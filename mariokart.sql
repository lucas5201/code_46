-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 24 fév. 2025 à 19:27
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mariokart`
--

-- --------------------------------------------------------

--
-- Structure de la table `apparitions_circuit`
--

DROP TABLE IF EXISTS `apparitions_circuit`;
CREATE TABLE IF NOT EXISTS `apparitions_circuit` (
  `id_apparition` int NOT NULL AUTO_INCREMENT,
  `circuit` int NOT NULL,
  `jeux` int NOT NULL,
  `coupe` int NOT NULL,
  `ordre` int NOT NULL,
  PRIMARY KEY (`id_apparition`),
  KEY `circuit` (`circuit`),
  KEY `jeux` (`jeux`),
  KEY `coupe` (`coupe`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `apparitions_circuit`
--

INSERT INTO `apparitions_circuit` (`id_apparition`, `circuit`, `jeux`, `coupe`, `ordre`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 3, 2, 1),
(3, 1, 5, 3, 1),
(4, 2, 2, 1, 2),
(5, 2, 5, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `circuits`
--

DROP TABLE IF EXISTS `circuits`;
CREATE TABLE IF NOT EXISTS `circuits` (
  `id_circuit` int NOT NULL AUTO_INCREMENT,
  `nom_circuit_fr` varchar(255) NOT NULL,
  `nom_circuit_qc` varchar(255) DEFAULT NULL,
  `coupe` int NOT NULL,
  `premiere_apparition` int NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id_circuit`),
  KEY `coupe` (`coupe`),
  KEY `premiere_apparition` (`premiere_apparition`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `circuits`
--

INSERT INTO `circuits` (`id_circuit`, `nom_circuit_fr`, `nom_circuit_qc`, `coupe`, `premiere_apparition`, `type`) VALUES
(1, 'SNES Circuit Mario 1', NULL, 1, 1, 1),
(2, 'N64 Ferme Meuh Meuh', NULL, 1, 2, 2),
(3, 'SNES Château Bowser 1', NULL, 1, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `coupes`
--

DROP TABLE IF EXISTS `coupes`;
CREATE TABLE IF NOT EXISTS `coupes` (
  `id_coupe` int NOT NULL AUTO_INCREMENT,
  `nom_coupe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_coupe`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `coupes`
--

INSERT INTO `coupes` (`id_coupe`, `nom_coupe`) VALUES
(1, 'Coupe Champignon'),
(2, 'Extra Mushroom Cup'),
(3, 'Coupe Carapace');

-- --------------------------------------------------------

--
-- Structure de la table `jeux`
--

DROP TABLE IF EXISTS `jeux`;
CREATE TABLE IF NOT EXISTS `jeux` (
  `id_jeu` int NOT NULL AUTO_INCREMENT,
  `nom_jeu` varchar(255) NOT NULL,
  `console` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_jeu`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `jeux`
--

INSERT INTO `jeux` (`id_jeu`, `nom_jeu`, `console`) VALUES
(1, 'Super Mario Kart', 'Super Nintendo'),
(2, 'Mario Kart 64', 'Nintendo 64'),
(3, 'Mario Kart: Super Circuit', 'Game Boy Advance'),
(4, 'Mario Kart: Double Dash!!', 'Nintendo GameCube'),
(5, 'Mario Kart DS', 'Nintendo DS'),
(6, 'Mario Kart Wii', 'Wii'),
(7, 'Mario Kart 7', 'Nintendo 3DS'),
(8, 'Mario Kart 8', 'Wii U'),
(9, 'Mario Kart 8 Deluxe', 'Nintendo Switch'),
(10, 'Mario Kart Tour', 'Mobile');

-- --------------------------------------------------------

--
-- Structure de la table `type_circuit`
--

DROP TABLE IF EXISTS `type_circuit`;
CREATE TABLE IF NOT EXISTS `type_circuit` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `nom_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `type_circuit`
--

INSERT INTO `type_circuit` (`id_type`, `nom_type`) VALUES
(1, 'Circuit'),
(2, 'Ferme');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
