<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegistrationFormType;
use App\Repository\UserRepository;
use App\Service\MailManager;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class RegistrationController extends AbstractController
{
    /**
     * @Route("/inscription", name="app_register")
     * @Security("not is_granted('ROLE_USER')")
     */
    public function register(Request $request, UserPasswordEncoderInterface $passwordEncoder, MailManager $mailManager): Response
    {
        $user = new User();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user->setPassword(
                $passwordEncoder->encodePassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            $user->setTokenValidate(md5(uniqid()));
            $this->persistEntity($user);
            $mailManager->mailRegistration($user);
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
        $this->persistEntity($user);
        
        $this->addFlash('success', 'Félicitations, votre compte est désormais activé !');
        return $this->redirectToRoute('home');
    }
    private function persistEntity($entity)
    {
        $em = $this->getDoctrine()->getManager();
        $em->persist($entity);
        $em->flush();
    }
}
