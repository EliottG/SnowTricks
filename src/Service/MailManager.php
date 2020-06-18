<?php

namespace App\Service;

use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Twig\Environment;

class MailManager
{
    private $mailer;
    private $em;
    private $userRepository;
    private $twig;

    public function __construct(MailerInterface $mailer, EntityManagerInterface $em, UserRepository $userRepository, Environment $twig)
    {
        $this->twig = $twig;
        $this->mailer = $mailer;
        $this->em = $em;
        $this->userRepository = $userRepository;
    }


    public function mailRegistration($user) {
        $email = (new Email())
            ->from('snowtricks.official@gmail.com')
            ->to($user->getEmail())
            ->subject('Confirmation de votre compte Snowtricks')
            ->html($this->twig->render('email/activation.html.twig', [
                    'token' => $user->getTokenValidate()
                ])
                );
            $this->mailer->send($email);
    }

    public function mailMissPassword($data)
    {
        $user = $this->userRepository->findOneByEmail($data['email']);
        if (!$user) {
            $failMessage = "Cet email n'est pas associé à un compte SnowTricks";
            return $failMessage;
        }
        $token = md5(uniqid());
        try {
            $user->setResetToken($token);
            $this->em->persist($user);
            $this->em->flush();
        } catch (\Exception $e) {
            $failMessage = "Une erreur est survenue, réesayez";
            return $failMessage;
        }
        $mail = (new Email())
            ->from('snowtricks.official@gmail.com')
            ->to($user->getEmail())
            ->subject('Mot de passe oublié')
            ->html($this->twig->render('email/reset.html.twig', [
                'token' => $token
            ]));
        $this->mailer->send($mail);
        return null;
    }
}
