-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 13 mars 2026 à 09:32
-- Version du serveur : 9.1.0
-- Version de PHP : 8.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `catalogue_films_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `mail` varchar(180) NOT NULL,
  `message` longtext NOT NULL,
  `date_envoi` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `nom`, `mail`, `message`, `date_envoi`) VALUES
(1, 'Romain Reigns', 'roman.reigns@wwe.com', 'Acknowledge me !', '2026-03-13 09:24:49');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20260313082622', '2026-03-13 08:26:49', 57);

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `annee` int NOT NULL,
  `affiche` varchar(255) DEFAULT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8244BE224296D31F` (`genre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id`, `titre`, `description`, `annee`, `affiche`, `genre_id`) VALUES
(1, 'Star Wars', 'La guerre des étoiles, l\'Empire contre les rebelles', 1970, 'https://static.posters.cz/image/750/28733.jpg', 1),
(3, 'Fast And Furious', 'La nuit tombée, Dominic Toretto règne sur les rues de Los Angeles à la tête d\'une équipe de fidèles qui partagent son goût du risque, sa passion de la vitesse et son culte des voitures de sport lancées à plus de 250 km/h dans des rodéos urbains d\'une rare violence.', 2001, 'https://m.media-amazon.com/images/I/71qtDoM-rcL._AC_UF894,1000_QL80_.jpg', 2),
(4, 'Halloween Kills', 'Quelques minutes après que Laurie Strode, sa fille Karen et sa petite fille Allyson ont abandonné le monstrueux Michael Myers enfermé et en feu dans le sous-sol, Laurie se retrouve à l\'hôpital avec des lésions mortelles, pensant avoir finalement tué son bourreau de toujours. Or, lorsque Michael réussit à se libérer, ses performances sanglantes reprennent. Tandis que Laurie se prépare à se défendre contre lui, elle motive toute la ville de Haddonfield à faire face à l\'inarrêtable monstre.', 2021, 'https://fr.web.img6.acsta.net/pictures/21/07/05/15/50/1097806.jpg', 3);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categorie` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `categorie`) VALUES
(1, 'Science Fiction'),
(2, 'Action'),
(3, 'Horreur');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
