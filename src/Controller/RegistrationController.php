<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegistrationFormType;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class RegistrationController extends AbstractController
{
    /**
     * @Route("/register", name="app_register")
     */
    public function register(Request $request, UserPasswordEncoderInterface $passwordEncoder, MailerInterface $mailer): Response
    {
        $user = new User();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password
            $user->setPassword(
                $passwordEncoder->encodePassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            $user->setTokenValidate(md5(uniqid()));
            
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($user);
            $entityManager->flush();

            $email = (new Email())
            ->from('snowtricks.official@gmail.com')
            ->to($user->getEmail())
            ->subject('Confirmation de votre compte Snowtricks')
            ->html($this->renderView('email/activation.html.twig', [
                    'token' => $user->getTokenValidate()
                ])
                );
            $mailer->send($email);
            // do anything else you need here, like send an email
            $this->addFlash('success', 'Un lien de confirmation a été envoyé à votre adresse mail pour confirmer la création de votre compte !');
            return $this->redirectToRoute('home');
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
        ]);
    }

/**
 * @Route("/activation/{token}", name="app_confirm_mail")
 */
    public function confirmMail($token, UserRepository $repository){
        $user = $repository->findOneBy(['token_validate' => $token]);
        if (!$user) {
            throw $this->createNotFoundException('Cet utilisateur n\' existe pas');
        }
        $user->setTokenValidate(null);
        $user->setIsValid(true);      
        $em = $this->getDoctrine()->getManager();
        $em->persist($user);
        $em->flush();
        
        $this->addFlash('success', 'Félications, votre compte est désormais activé !');
        return $this->redirectToRoute('home');
    }
}
