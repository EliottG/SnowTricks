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
    public function __construct()
    {
        
    }
    /**
     * @Route("/trick", name="trick")
     */
    public function index(TrickRepository $repository)
    {
        $tricks = $repository->findAll();   
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
            return $this->redirectToRoute('trick');
        }
        return $this->render('trick/create.html.twig', [
            'form' => $form->createView()
        ]);
    }
    /**
     * @Route("/trick/update/{id}", name="trick.update")
     */
    public function update(TrickRepository $repository, $id, Request $request)
    {
        $trick = $repository->find($id);
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
     * @Route("/trick/{id}", name="trick.single")
     */
    public function single(TrickRepository $repository, $id)
    {
        $trick = $repository->find($id);
        return $this->render('trick/single.html.twig', [
            'trick' => $trick
            
        ]);
    }
}
