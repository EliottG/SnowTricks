<?php

namespace App\Service;

use App\Entity\User;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\String\Slugger\SluggerInterface;

class UserManager
{
    private $slugger;
    private $profilDirectory;
    public function __construct(SluggerInterface $slugger, $profilDirectory)
    {
        $this->slugger = $slugger;
        $this->profilDirectory = $profilDirectory;
    }
    public function addProfilPicture(User $user, $pictureFile)
    {
        if ($pictureFile) {
            $originalFilename = pathinfo($pictureFile->getClientOriginalName(), PATHINFO_FILENAME);
            $safeFilename = $this->slugger->slug($originalFilename);
            $newFilename = $safeFilename . '-' . uniqid() . '.' . $pictureFile->guessExtension();
            try {
                $pictureFile->move(
                    $this->profilDirectory,
                    $newFilename
                );
            } catch (FileException $e) {
            }
            $user->setPictureName($newFilename);
        }
    }
}
