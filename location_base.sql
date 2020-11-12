-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 12 nov. 2020 à 14:37
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `location_base`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `IdClient` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) NOT NULL,
  `Mdp` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  PRIMARY KEY (`IdClient`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`IdClient`, `Nom`, `Mdp`, `Email`) VALUES
(1, 'Richard Cooper', 'RC202020', 'richard.cooper@societe.fr'),
(22, 'Armanthe', 'Armanthe', 'contact@armanthe.com'),
(19, 'Patron', 'PPPPPPPP', 'patron@gp.com');

-- --------------------------------------------------------

--
-- Structure de la table `facturation`
--

DROP TABLE IF EXISTS `facturation`;
CREATE TABLE IF NOT EXISTS `facturation` (
  `IdFacturation` int(11) NOT NULL AUTO_INCREMENT,
  `IdClient` int(11) NOT NULL,
  `IdVehicule` int(11) NOT NULL,
  `DateD` date NOT NULL,
  `DateF` date NOT NULL,
  `Valeur` int(11) NOT NULL,
  `Etat` varchar(30) NOT NULL DEFAULT 'Impayée',
  PRIMARY KEY (`IdFacturation`,`IdClient`,`IdVehicule`,`DateD`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `facturation`
--

INSERT INTO `facturation` (`IdFacturation`, `IdClient`, `IdVehicule`, `DateD`, `DateF`, `Valeur`, `Etat`) VALUES
(1, 1, 17, '2020-10-18', '2020-10-25', 800, 'Impayée'),
(2, 1, 19, '2020-11-02', '2020-11-04', 500, 'Payée'),
(3, 1, 2, '2020-11-06', '2020-11-15', 700, 'Impayée'),
(4, 22, 1, '2020-10-08', '2020-10-09', 25, 'Payée'),
(5, 22, 19, '2020-10-10', '2020-10-20', 800, 'Payée'),
(6, 22, 12, '2020-11-01', '2020-11-30', 3000, 'Impayée'),
(7, 19, 3, '2020-11-01', '2020-11-04', 200, 'Impayée'),
(8, 19, 9, '2020-09-05', '2020-11-15', 700, 'Payée'),
(9, 19, 9, '2020-10-05', '2020-10-10', 120, 'Payée'),
(10, 20, 9, '2020-10-13', '2020-10-16', 60, 'Impayée'),
(11, 12, 19, '2020-11-04', '2020-12-04', 1500, 'Impayée'),
(12, 1, 11, '2020-11-01', '2020-12-01', 900, 'Impayée');

-- --------------------------------------------------------

--
-- Structure de la table `loueur`
--

DROP TABLE IF EXISTS `loueur`;
CREATE TABLE IF NOT EXISTS `loueur` (
  `IdLoueur` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) NOT NULL,
  `Mdp` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  PRIMARY KEY (`IdLoueur`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `loueur`
--

INSERT INTO `loueur` (`IdLoueur`, `Nom`, `Mdp`, `Email`) VALUES
(1, 'Ford', '12345678', 'pro@ford.com'),
(2, 'Chevrolet', '987456321', 'contact@chevrolet.com'),
(3, 'DavidLocations', 'DAVIDDIVA', 'diva@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `IdVehicule` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Type` varchar(30) NOT NULL,
  `Nb` int(11) NOT NULL,
  `Caract` json DEFAULT NULL,
  `Location` varchar(30) NOT NULL,
  `Photo` varchar(100) NOT NULL,
  `IdLoueur` int(100) NOT NULL,
  PRIMARY KEY (`IdVehicule`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`IdVehicule`, `Type`, `Nb`, `Caract`, `Location`, `Photo`, `IdLoueur`) VALUES
(1, 'Smart', 5, '{\"Moteur\": \"Hybride\", \"Vitesse\": \"Automatique\", \"Nombre de places\": \"2\", \"Nombre de portes\": \"3\"}', 'Disponible', './images/vehicules/smart.png', 1),
(2, 'Peugot e-208', 5, '{\"Moteur\": \"Essence\", \"Vitesse\": \"Mécanique\", \"Nombre de places\": \"5\", \"Nombre de portes\": \"5\"}', 'Disponible', './images/vehicules/peugeot-e-208.jpg', 2),
(3, 'Volkswagen Amarok', 2, '{\"Moteur\": \"Essence\", \"Vitesse\": \"Mécanique\", \"Nombre de places\": \"4\", \"Nombre de portes\": \"4\"}', 'Disponible', './images/vehicules/amarok.png', 2),
(9, 'Kia Picanto', 60, '{\"Moteur\": \"Essence\", \"Vitesse\": \"Automatique\", \"Nombre de places\": \"4\", \"Nombre de portes\": \"5\"}', 'Disponible', './images/vehicules/picanto.jpg', 1),
(10, 'Ford Fiesta', 20, '{\"Moteur\": \"Essence\", \"Vitesse\": \"Mécanique\", \"Nombre de places\": \"5\", \"Nombre de portes\": \"5\"}', 'Disponible', './images/vehicules/fiesta.jpg', 3),
(11, 'Hyundai i20', 80, '{\"Moteur\": \"Essence\", \"Vitesse\": \"Mécanique\", \"Nombre de places\": \"5\", \"Nombre de portes\": \"5\"}', 'Disponible', './images/vehicules/i20.jpg', 3),
(12, 'Renault Kadjar', 5, '{\"Moteur\": \"Essence\", \"Vitesse\": \"Automatique\", \"Nombre de places\": \"5\", \"Nombre de portes\": \"5\"}', 'Disponible', './images/vehicules/kadjar.jpg', 3),
(17, 'Dacia Duster', 7, '{\"Moteur\": \"Essence\", \"Vitesse\": \"Automatique\", \"Nombre de places\": \"5\", \"Nombre de portes\": \"5\"}', 'Disponible', './images/vehicules/duster.jpg', 3),
(20, 'Renault Zoe', 50, '{\"Moteur\": \"Hybride\", \"Vitesse\": \"Automatique\", \"Nombre de places\": \"5\", \"Nombre de portes\": \"3\"}', 'Disponible', './images/vehicules/zoe.jpg', 3),
(19, 'Mercedes Citan', 2, '{\"Moteur\": \"Essence\", \"Vitesse\": \"Mécanique\", \"Nombre de places\": \"5\", \"Nombre de portes\": \"5\"}', 'Disponible', './images/vehicules/citan.jpg', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
