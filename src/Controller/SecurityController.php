<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\ConfirmResetType;
use App\Form\ResetType;
use App\Form\UserType;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;





class SecurityController extends AbstractController
{
    /**
     * @Route("/connexion", name="app_login")
     * @Security("not is_granted('ROLE_USER')")
     */
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        // if ($this->getUser()) {
        //     return $this->redirectToRoute('target_path');
        // }

        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('security/login.html.twig', ['last_username' => $lastUsername, 'error' => $error]);
    }

    /**
     * @Route("/déconnexion", name="app_logout")
     * @Security("is_granted('ROLE_USER')")
     */
    public function logout()
    {
        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }
    /**
     * @Route("/reinitialisation-{token}", name="reset.password")
     */
    public function resetPassword($token, UserRepository $repository, Request $request, UserPasswordEncoderInterface $passwordEncoder)
    {
        $user = $repository->findOneBy(['reset_token' => $token]);
        $form = $this->createForm(ConfirmResetType::class, $user);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $user->setPassword(
                $passwordEncoder->encodePassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            $user->setResetToken(null);
            $this->persistEntity($user);
            $this->addFlash('success', 'Votre mot de passe a bien été modifié ! Pensez à le retenir la prochaine fois !');
            return $this->redirectToRoute('app_login');
        }
        return $this->render('security/reset.html.twig', [
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/{id}-modifier/mot-de-passe" , name="update.password")
     */
    public function updatePassword(User $user, Request $request, UserPasswordEncoderInterface $passwordEncoder)
    {
        $form = $this->createForm(ConfirmResetType::class, $user);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $user->setPassword(
                $passwordEncoder->encodePassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            $this->persistEntity($user);
            $this->addFlash('success', 'Votre mot de passe a bien été modifié ');
            return $this->redirectToRoute('home');
        }
        return $this->render('security/update.html.twig', [
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
