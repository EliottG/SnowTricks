<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Picture;
use App\Entity\Trick;
use App\Entity\User;
use App\Entity\Video;
use App\Form\CategoryTrickType;
use App\Form\CommentType;
use App\Form\TrickType;
use App\Repository\TrickRepository;
use App\Repository\UserRepository;
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
     * @Route("/trick", name="trick")
     */
    public function index(Request $request)
    {
        $trick = new Trick();
        $form = $this->createForm(CategoryTrickType::class, $trick);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            if ($trick->getCategory() != 'Tout') {
                $tricks = $this->repository->findBy(['category' => $trick->getCategory()]);
                return $this->render('trick/index.html.twig', [
                    'tricks' => $tricks,
                    'form' => $form->createView()
                ]);
            } else {
                $tricks = $this->repository->findAll();
                return $this->render('trick/index.html.twig', [
                    'tricks' => $tricks,
                    'form' => $form->createView()
                ]);
            }
        }
        $tricks = $this->repository->findAll();
        return $this->render('trick/index.html.twig', [
            'tricks' => $tricks,
            'form' => $form->createView()
        ]);
    }
    /**
     * @Route("/trick/ajouter", name="trick.create")
     * @Security("is_granted('ROLE_USER')")
     */
    public function create(Request $request)
    {
        $trick = new Trick;
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $pictures = $form->get('picture')->getData();
            foreach ($pictures as $picture) {
                $file = md5(uniqid()) . '.' . $picture->guessExtension();
                $picture->move(
                    $this->getParameter('trick_directory'),
                    $file
                );
                $trickPicture = new Picture();
                $trickPicture->setName($file);
                $trick->addPicture($trickPicture);
            }
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($trick);
            $entityManager->flush();
            $this->addFlash('success', 'Votre Trick a bien été ajouté !');
            return $this->redirectToRoute('trick');
        }
        return $this->render('trick/create.html.twig', [
            'form' => $form->createView()
        ]);
    }
    /**
     * @Route("/trick/modifier/{id}-{slug}", name="trick.update",  requirements={"id":"\d+","slug": "[a-z0-9\-]+"})
     *  @Security("is_granted('ROLE_USER')")
     */
    public function update(Trick $trick, Request $request)
    {

        $trickId = $trick->getId();
        $trickSlug = $trick->getSlug();
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $getVideos = $form->get('videos')->getData();
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
                } else {
                    $this->addFlash('fail', 'L\'une des vidéos que vous souhaitez ajouter ne provient pas des sites autorisés');
                    return $this->redirectToRoute('trick.update', [
                        'id' => $trickId,
                        'slug' => $trickSlug
                    ]);
                }
            }
        }
            $pictures = $form->get('picture')->getData();
            foreach ($pictures as $picture) {
                $file = md5(uniqid()) . '.' . $picture->guessExtension();
                $picture->move(
                    $this->getParameter('trick_directory'),
                    $file
                );
                $trickPicture = new Picture();
                $trickPicture->setName($file);
                $trick->addPicture($trickPicture);
            }
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($trick);
            $entityManager->flush();
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
    public function single(Trick $trick, Request $request, UserRepository $repository, User $user)
    {
        $comment = new Comment();
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $user = $repository->find($this->getUser()->getId());
            $comment->setTrick($trick);
            $comment->setUser($user);
            $em->persist($comment);
            $em->flush();
            $this->addFlash('success', 'Votre commentaire a bien été ajouté !');
            return $this->redirectToRoute('trick.single', [
                'id' => $trick->getId(),
                'slug' => $trick->getSlug()
            ]);
        }
        return $this->render('trick/single.html.twig', [
            'form' => $form->createView(),
            'trick' => $trick,
            'user' => $user

        ]);
    }
    /**
     * @Route("/trick/delete-{id}" , name="trick.delete")
     * @Security("is_granted('ROLE_USER')")
     */
    public function delete(Request $request, Trick $trick)
    {
        if ($this->isCsrfTokenValid("trick_delete", $request->query->get('csrf'))) {

            $em = $this->getDoctrine()->getManager();
            $em->remove($trick);
            $em->flush();
            $this->addFlash('fail', 'Le trick a bien été supprimé !');
        }

        return $this->redirectToRoute('trick');
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
        $em = $this->getDoctrine()->getManager();
        $em->remove($picture);
        $em->flush();
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
    public function deleteVideo(Video $video) {
        $trick = $video->getTrick();
        $trickId = $trick->getId();
        $trickSlug = $trick->getSlug();
        $em = $this->getDoctrine()->getManager();
        $em->remove($video);
        $em->flush();
        $this->addFlash('fail', 'Image supprimée');
        return $this->redirectToRoute('trick.update', [
            'id' => $trickId,
            'slug' => $trickSlug
        ]);
    }
}
