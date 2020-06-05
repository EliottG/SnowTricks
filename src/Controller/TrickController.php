<?php

namespace App\Controller;

use App\Entity\Picture;
use App\Entity\Trick;
use App\Form\CategoryTrickType;
use App\Form\TrickType;
use App\Repository\PictureRepository;
use App\Repository\TrickRepository;
use Doctrine\ORM\EntityManager;
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

        $pictures = $trick->getPictures();
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
            $this->addFlash('success', 'Le trick a bien été modifié');
            return $this->redirectToRoute('trick');
        }
        return $this->render('trick/update.html.twig', [
            'form' => $form->createView(),
            'trick' => $trick

        ]);
    }
    /**
     * @Route("/trick/{id}-{slug}", name="trick.single",  requirements={"id":"\d+","slug": "[a-z0-9\-]+"})
     */
    public function single(Trick $trick)
    {
        return $this->render('trick/single.html.twig', [
            'trick' => $trick

        ]);
    }
    /**
     * @Route("/trick/delete-{id}" , name="trick.delete")
     * @Security("is_granted('ROLE_USER')")
     */
    public function delete(Trick $trick)
    {
        $em = $this->getDoctrine()->getManager();
        $em->remove($trick);
        $em->flush();
        $this->addFlash('fail', 'Le trick a bien été supprimé !');
        return $this->redirectToRoute('trick');
    }
    /**
     * @Route("/supprimer/image/{id}", name="delete.trick.picture")
     */
    public function deletePicture(Picture $picture, TrickRepository $repository)
    {
        $trick = $picture->getTrick();
        $trickId = $trick->getId();
        $trickSlug = $trick->getSlug();
        $em = $this->getDoctrine()->getManager();
        $em->remove($picture);
        $em->flush();
        $this->addFlash('fail', 'Image supprimée');
        return $this->redirectToRoute('trick.update', [
            'id' => $trickId,
            'slug' => $trickSlug
        ]);
    }
}
