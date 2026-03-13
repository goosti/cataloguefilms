<?php

namespace App\Controller;

use App\Entity\Film;
use App\Form\FilmType;
use App\Repository\FilmRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class FilmController extends AbstractController
{
    #[Route('/film/new', name: 'app_film_new')]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $film = new Film();
        $form = $this->createForm(FilmType::class, $film);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($film);
            $entityManager->flush();

            return $this->redirectToRoute('app_film');
        }

        return $this->render('film/new.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/film/{id}', name: 'app_film_show')]
    public function show(int $id, FilmRepository $filmRepository): Response
    {
        $film = $filmRepository->find($id);

        if (!$film) {
            return $this->redirectToRoute('app_film');
        }

        return $this->render('film/show.html.twig', [
            'film' => $film,
        ]);
    }

    #[Route('/film/{id}/delete', name: 'app_film_delete', methods: ['POST'])]
    public function delete(int $id, FilmRepository $filmRepository, EntityManagerInterface $entityManager): Response
    {
        $film = $filmRepository->find($id);

        if ($film) {
            $entityManager->remove($film);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_film');
    }

    #[Route('/film', name: 'app_film')]
    public function index(FilmRepository $filmRepository): Response
    {
        $films = $filmRepository->findAll();

        return $this->render('film/index.html.twig', [
            'films' => $films,
        ]);
    }
}