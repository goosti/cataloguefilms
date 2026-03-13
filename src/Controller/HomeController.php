<?php

namespace App\Controller;

use App\Repository\ContactRepository;
use App\Repository\FilmRepository;
use App\Repository\GenreRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(
        FilmRepository $filmRepository,
        GenreRepository $genreRepository,
        ContactRepository $contactRepository
    ): Response
    {
        return $this->render('home/index.html.twig', [
            'films' => $filmRepository->findAll(),
            'genres' => $genreRepository->findAll(),
            'contacts' => $contactRepository->findAll(),
        ]);
    }
}
