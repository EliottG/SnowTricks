<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\ResetType;
use App\Form\UserType;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\Mailer;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;

class UserController extends AbstractController
{
    private $repository;

    public function __construct(UserRepository $repository)
    {
        $this->repository = $repository;
    }
    /**
     * @Route("/modifier/{id}-{slug}", name="user.update",  requirements={"slug": "[a-z0-9\-]*"})
     */
    public function update(User $user, Request $request)
    {
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($user);
            $em->flush();
            return $this->redirectToRoute('home');
        }
        return $this->render('user/index.html.twig', [
            'form' => $form->createView(),
            'id' => $user->getId()
        ]);
    }
    /**
     * @Route("/mot-de-passe-oublie", name="user.reset")
     */
    public function missPassword(Request $request, MailerInterface $mailer)
    {

        $form = $this->createForm(ResetType::class);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $data = $form->getData();
            $user = $this->repository->findOneByEmail($data['email']);
            if (!$user) {
                $this->addFlash('fail', 'Cette adresse n\'est pas associée à un compte Snowtricks');
                return   $this->redirectToRoute('app_login');
            }
            $token = md5(uniqid());
            try {
                $user->setResetToken($token);
                $em = $this->getDoctrine()->getManager();
                $em->persist($user);
                $em->flush();
            } catch (\Exception $e) {
                $this->addFlash('fail', 'Une erreur est survenue' . $e->getMessage());
                return   $this->redirectToRoute('app_login');
            }
            $mail = (new Email())
                ->from('snowtricks.official@gmail.com')
                ->to($user->getEmail())
                ->subject('Mot de passe oublié')
                ->html($this->renderView('email/reset.html.twig', [
                    'token' => $token
                ]));
            $mailer->send($mail);
            $this->addFlash('success', 'Un mail a bien été envoyé à votre adresse email');
            return  $this->redirectToRoute('app_login');
        }
        return $this->render('user/reset.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
