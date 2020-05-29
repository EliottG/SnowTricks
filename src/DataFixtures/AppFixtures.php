<?php

namespace App\DataFixtures;

use App\Entity\Trick;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        for ($i = 1; $i <= 20 ; $i ++) {
            $trick = new Trick();
            $trick->setTitle('Ma figure n°' .$i);
            $trick->setCategory('Freestyle');
            $manager->persist($trick);
            $user = new User();
            $user->setUsername('Utilisateur'.$i);
            $user->setCatchPhrase('Phrase de présentation n°'. $i);
            $user->setEmail('email.user@number'. $i);
            $user->setRoles(['ROLE_USER']);
            $user->setPassword('$argon2i$v=19$m=65536,t=4,p=1$NDUudVVXRDNOUEdwR1RTUw$fSBVnxZF6mhYTH31ko+gh3fx/PLXtIroGGh9YX7htDw');
            $manager->persist($user);
            
        }
        // $product = new Product();
        // $manager->persist($product);

        $manager->flush();
    }
}
