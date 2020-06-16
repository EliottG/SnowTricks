<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Picture;
use App\Entity\Trick;
use App\Entity\Video;
use App\Form\CommentType;
use App\Form\TrickType;
use App\Repository\TrickRepository;
use App\Repository\UserRepository;
use App\Service\TrickManager;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class TrickController extends AbstractController
{
    private $repository;

    public function __construct(TrickRepository $repository)
    {
        $this->repository = $repository;
    }
    /**
     * @Route("/", name="home")
     */
    public function index()
    {
        $trick = new Trick();
        $tricks = $this->repository->findAll();
        return $this->render('home/index.html.twig', [
            'tricks' => $tricks,
        ]);
    }
    /**
     * @Route("/trick/ajouter", name="trick.create")
     * @Security("is_granted('ROLE_USER')")
     */
    public function create(Request $request, TrickManager $trickManager)
    {
        $trick = new Trick;
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $mainPicture = $form->get('main_image')->getData();
            $trickManager->addMainPictureToTrick($trick, $mainPicture);
            $pictures = $form->get('picture')->getData();
            $trickManager->addPicturesToTrick($trick, $pictures);
            $getVideos = $form->get('videos')->getData();
            $trickManager->addVideosToTrick($trick, $getVideos);
            $this->persistEntity($trick);
            $this->addFlash('success', 'Votre Trick a bien été ajouté !');
            return $this->redirectToRoute('trick.single', [
                'id' => $trick->getId(),
                'slug' => $trick->getSlug(),
            ]);
        }
        return $this->render('trick/create.html.twig', [
            'form' => $form->createView()
        ]);
    }
    /**
     * @Route("/trick/modifier/{id}-{slug}", name="trick.update",  requirements={"id":"\d+","slug": "[a-z0-9\-]+"})
     *  @Security("is_granted('ROLE_USER')")
     */
    public function update(Trick $trick, Request $request, TrickManager $trickManager)
    {

        $trickId = $trick->getId();
        $trickSlug = $trick->getSlug();
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $getVideos = $form->get('videos')->getData();
            $trickManager->addVideosToTrick($trick, $getVideos);
            $mainPicture = $form->get('main_image')->getData();
            $trickManager->addMainPictureToTrick($trick, $mainPicture);
            $pictures = $form->get('picture')->getData();
            $trickManager->addPicturesToTrick($trick, $pictures);
            $this->persistEntity($trick);
            $this->addFlash('success', 'Le trick a bien été modifié');
            return $this->redirectToRoute('trick.single', [
                'id' => $trickId,
                'slug' => $trickSlug
            ]);
        }
        return $this->render('trick/update.html.twig', [
            'form' => $form->createView(),
            'trick' => $trick

        ]);
    }
    /**
     * @Route("/trick/{id}-{slug}", name="trick.single",  requirements={"id":"\d+","slug": "[a-z0-9\-]+"})
     */
    public function single(Trick $trick, Request $request, UserRepository $repository)
    {
        $comment = new Comment();
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $user = $repository->find($this->getUser()->getId());
            $comment->setTrick($trick);
            $comment->setUser($user);
            $this->persistEntity($comment);
            $this->addFlash('success', 'Votre commentaire a bien été ajouté !');
            return $this->redirectToRoute('trick.single', [
                'id' => $trick->getId(),
                'slug' => $trick->getSlug()
            ]);
        }
        return $this->render('trick/single.html.twig', [
            'form' => $form->createView(),
            'trick' => $trick,

        ]);
    }
    /**
     * @Route("/trick/delete-{id}" , name="trick.delete")
     * @Security("is_granted('ROLE_USER')")
     */
    public function delete(Request $request, Trick $trick)
    {
        if ($this->isCsrfTokenValid("trick_delete", $request->query->get('csrf'))) {
            $this->removeEntity($trick);
            $this->addFlash('fail', 'Le trick a bien été supprimé !');
        }

        return $this->redirectToRoute('home');
    }
    /**
     * @Route("/supprimer/image/{id}", name="delete.trick.picture")
     * @Security("is_granted('ROLE_USER')")
     */
    public function deletePicture(Picture $picture)
    {
        $trick = $picture->getTrick();
        $trickId = $trick->getId();
        $trickSlug = $trick->getSlug();
        $this->removeEntity($picture);
        $this->addFlash('fail', 'Vidéo supprimée');
        return $this->redirectToRoute('trick.update', [
            'id' => $trickId,
            'slug' => $trickSlug
        ]);
    }
    /**
     * @Route("/supprimer/video/{id}", name="delete.trick.video")
     * @Security("is_granted('ROLE_USER')")
     */
    public function deleteVideo(Video $video)
    {
        $trick = $video->getTrick();
        $trickId = $trick->getId();
        $trickSlug = $trick->getSlug();
        $this->removeEntity($video);
        $this->addFlash('fail', 'Image supprimée');
        return $this->redirectToRoute('trick.update', [
            'id' => $trickId,
            'slug' => $trickSlug
        ]);
    }
    private function persistEntity($entity)
    {
        $em = $this->getDoctrine()->getManager();
        $em->persist($entity);
        $em->flush();
    }
    private function removeEntity($entity)
    {
        $em = $this->getDoctrine()->getManager();
        $em->remove($entity);
        $em->flush();
    }
}
