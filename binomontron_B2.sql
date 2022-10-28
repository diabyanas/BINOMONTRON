-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : ven. 28 oct. 2022 à 07:53
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `binomontron`
--

-- --------------------------------------------------------

--
-- Structure de la table `apprenants`
--

CREATE TABLE `apprenants` (
  `id_apprenant` int NOT NULL,
  `nom_apprenant` varchar(50) NOT NULL,
  `prenom_apprenant` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email_apprenant` varchar(50) NOT NULL,
  `id_niveau` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `apprenants`
--

INSERT INTO `apprenants` (`id_apprenant`, `nom_apprenant`, `prenom_apprenant`, `email_apprenant`, `id_niveau`) VALUES
(1, 'LE GRAND', 'Kevin', 'kevin.le-grand@isen-ouest.yncrea.fr', 1),
(2, 'PETIARD', 'Harold', 'harold.petiard@isen-ouest.yncrea.fr', 1),
(3, 'SCANU', 'David', 'david.scanu@isen-ouest.yncrea.fr', 1),
(4, 'ANCELIN', 'Antoine', 'antoine.ancelin@isen-ouest.yncrea.fr', 1),
(5, 'JOURNAUX', 'Johann', 'johann.journaux@isen-ouest.yncrea.fr', 1),
(6, 'LEBARBIER', 'Charley', 'charley.lebarbier@isen-ouest.yncrea.fr', 1),
(7, 'DIABY', 'Amadou', 'amadou.diaby@isen-ouest.yncrea.fr', 1),
(8, 'DAUMER', 'Geoffroy', 'geoffroy.daumer@isen-ouest.yncrea.fr', 1),
(9, 'JULES', 'Dimitri', 'dimitri.jules@isen-ouest.yncrea.fr', 1),
(10, 'GUERIN', 'Basile', 'basile.guerin@isen-ouest.yncrea.fr', 1),
(11, 'OSWALD', 'Viacheslav', 'viacheslav.oswald@isen-ouest.yncrea.fr', 1),
(12, 'DUSSART', 'Ramata Soraya', 'ramata-soraya.dussart@isen-ouest.yncrea.fr', 1),
(13, 'ZOUITEN', 'Guinel', 'guinel.zouiten@isen-ouest.yncrea.fr', 1);

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id_groupe` int NOT NULL,
  `nom_groupe` varchar(50) NOT NULL,
  `date_groupe` datetime NOT NULL,
  `id_apprenant` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `niveaux`
--

CREATE TABLE `niveaux` (
  `id_niveau` int NOT NULL,
  `niveau` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `niveaux`
--

INSERT INTO `niveaux` (`id_niveau`, `niveau`) VALUES
(1, 'Debutant'),
(2, 'Intermediaire'),
(3, 'Expert');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `apprenants`
--
ALTER TABLE `apprenants`
  ADD PRIMARY KEY (`id_apprenant`),
  ADD KEY `id_niveau` (`id_niveau`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id_groupe`),
  ADD KEY `id_apprenant` (`id_apprenant`);

--
-- Index pour la table `niveaux`
--
ALTER TABLE `niveaux`
  ADD PRIMARY KEY (`id_niveau`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `apprenants`
--
ALTER TABLE `apprenants`
  MODIFY `id_apprenant` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id_groupe` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `niveaux`
--
ALTER TABLE `niveaux`
  MODIFY `id_niveau` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `apprenants`
--
ALTER TABLE `apprenants`
  ADD CONSTRAINT `apprenants_ibfk_1` FOREIGN KEY (`id_niveau`) REFERENCES `niveaux` (`id_niveau`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `groupe_ibfk_1` FOREIGN KEY (`id_apprenant`) REFERENCES `apprenants` (`id_apprenant`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
