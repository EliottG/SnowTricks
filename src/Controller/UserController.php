<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\ResetType;
use App\Form\UserType;
use App\Repository\UserRepository;
use App\Service\MailManager;
use App\Service\UserManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class UserController extends AbstractController
{
    private $repository;

    public function __construct(UserRepository $repository)
    {
        $this->repository = $repository;
    }
    /**
     * @Route("/modifier/{id}-{slug}", name="user.update",  requirements={"slug": "[a-z0-9\-]*"})
     * @IsGranted("USER_EDIT", subject="user")
     */
    public function update(User $user, Request $request, UserManager $userManager)
    {

        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $pictureFile = $form->get('picture_name')->getData();
            $userManager->addProfilPicture($user, $pictureFile);
            $this->persistEntity($user);
            $this->addFlash('success', 'Votre profil a bien été modifié');
            return $this->redirectToRoute('home');
        }
        return $this->render('user/index.html.twig', [
            'form' => $form->createView(),
            'id' => $user->getId(),
            'user' => $user
        ]);
    }
    /**
     * @Route("/mot-de-passe-oublie", name="user.reset")
     */
    public function missPassword(Request $request, MailManager $mailManager)
    {

        $form = $this->createForm(ResetType::class);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $data = $form->getData();
            $sendMail = $mailManager->MailMissPassword($data);
            if ($sendMail != null) {
                $this->addFlash('fail', $sendMail);
                return $this->redirectToRoute('app_login');
            } else {
                $this->addFlash('success', 'Un mail a bien été envoyé à votre adresse email');
                return  $this->redirectToRoute('app_login');
            }
        }
        return $this->render('user/reset.html.twig', [
            'form' => $form->createView()
        ]);
    }

    private function persistEntity($entity)
    {
        $em = $this->getDoctrine()->getManager();
        $em->persist($entity);
        $em->flush();
    }
}
