<?php

namespace App\Service;

use App\Entity\Picture;
use App\Entity\Trick;
use App\Entity\Video;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\String\Slugger\SluggerInterface;

class TrickManager 
{

    public $slugger;
    public $trickDirectory;

    public function __construct(SluggerInterface $slugger, string $trickDirectory)
    {
        $this->slugger = $slugger;
        $this->trickDirectory = $trickDirectory;
    }


    // public function saveTrick($trick)

    public function addMainPictureToTrick(Trick $trick, $picture)
    {
        if ($picture) {
            $originalFilename = pathinfo($picture->getClientOriginalName(), PATHINFO_FILENAME);
            $safeFilename = $this->slugger->slug($originalFilename);
            $newFilename = $safeFilename . '-' . uniqid() . '.' . $picture->guessExtension();
            try {
                $picture->move(
                    $this->trickDirectory,
                    $newFilename
                );
            } catch (FileException $e) {
            }
            $trick->setMainImage($newFilename);
        }
    }
    public function addPicturesToTrick(Trick $trick, $pictures)
    {
        foreach ($pictures as $picture) {
            $file = md5(uniqid()) . '.' . $picture->guessExtension();
            $picture->move(
                $this->trickDirectory,
                $file
            );
            $trickPicture = new Picture();
            $trickPicture->setName($file);
            $trick->addPicture($trickPicture);
        }
    }
    public function addVideosToTrick(Trick $trick, $getVideos)
    {
        $videos = explode(',', $getVideos);
        foreach ($videos as $video) {
            if ($video != null) {
                if (preg_match('#youtube#', $video) || preg_match('#dailymotion#', $video)) {
                    if (preg_match('#youtube#', $video)) {
                        $pattern = "#watch\?v=#";
                        $replace =  "embed/";
                        $video = preg_replace($pattern, $replace, $video);
                    } else if ((preg_match('#dailymotion#', $video))) {
                        $pattern = "#video#";
                        $replace =  "embed/video";
                        $video = preg_replace($pattern, $replace, $video);
                    }
                    $trickVideo = new Video();
                    $trickVideo->setLink($video);
                    $trick->addVideo($trickVideo);
                }
            }
        }
    }
}
