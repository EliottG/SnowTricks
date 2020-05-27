<?php

namespace App\Controller;

use App\Entity\Trick;
use App\Form\TrickType;
use App\Repository\TrickRepository;
use Doctrine\ORM\EntityManager;
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
    public function index()
    {
        $tricks = $this->repository->findAll();   
        return $this->render('trick/index.html.twig', [
            'tricks' => $tricks
        ]);
    }
    /**
     * @Route("/trick/ajouter", name="trick.create")
     */
    public function create(Request $request)
    {
        $trick = new Trick;
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
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
     * @Route("/trick/update/{id}-{slug}", name="trick.update",  requirements={"id":"\d+","slug": "[a-z0-9\-]+"})
     */
    public function update(Trick $trick, Request $request)
    {
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($trick);
            $entityManager->flush();
            return $this->redirectToRoute('trick');
        }
        return $this->render('trick/update.html.twig', [
            'form' => $form->createView()
            
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
}
