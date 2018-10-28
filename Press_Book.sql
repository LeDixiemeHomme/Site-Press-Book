-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 29 Octobre 2018 à 00:41
-- Version du serveur :  5.7.24-0ubuntu0.18.04.1
-- Version de PHP :  7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Press_Book`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id_a` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `date_parution` date DEFAULT NULL,
  `date_recup` date DEFAULT NULL,
  `lien_origine` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `auteur` varchar(255) DEFAULT NULL,
  `etat_u` int(11) DEFAULT NULL,
  `id_s` int(32) DEFAULT NULL,
  `id_f` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `flux`
--

CREATE TABLE `flux` (
  `id_f` int(11) NOT NULL,
  `url_origine` varchar(255) DEFAULT NULL,
  `url_rss` varchar(255) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `nom_orga` varchar(255) DEFAULT NULL,
  `url_orga` varchar(255) DEFAULT NULL,
  `peri_maj` varchar(255) DEFAULT NULL,
  `acti_maj` tinyint(1) DEFAULT NULL,
  `last_maj` date DEFAULT NULL,
  `last_maj_succ` date DEFAULT NULL,
  `since_succ` int(11) DEFAULT NULL,
  `msg_last_maj` varchar(255) DEFAULT NULL,
  `etat_f` int(11) DEFAULT NULL,
  `id_s` int(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `press_book`
--

CREATE TABLE `press_book` (
  `id_u` int(11) DEFAULT NULL,
  `id_a` int(11) DEFAULT NULL,
  `etat_p` int(11) DEFAULT NULL,
  `date_ajout` date DEFAULT NULL,
  `etiquette` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

CREATE TABLE `sport` (
  `id_s` int(8) NOT NULL,
  `nom_s` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_u` int(11) NOT NULL,
  `nom_u` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `nom_club` varchar(255) DEFAULT NULL,
  `url_club` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `niveau` int(11) DEFAULT NULL,
  `etat_u` int(11) DEFAULT NULL,
  `id_s` int(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_a`),
  ADD KEY `id_s` (`id_s`),
  ADD KEY `id_f` (`id_f`);

--
-- Index pour la table `flux`
--
ALTER TABLE `flux`
  ADD PRIMARY KEY (`id_f`),
  ADD KEY `id_s` (`id_s`);

--
-- Index pour la table `press_book`
--
ALTER TABLE `press_book`
  ADD KEY `id_a` (`id_a`),
  ADD KEY `id_u` (`id_u`);

--
-- Index pour la table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`id_s`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_u`),
  ADD KEY `id_s` (`id_s`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id_a` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `flux`
--
ALTER TABLE `flux`
  MODIFY `id_f` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `sport`
--
ALTER TABLE `sport`
  MODIFY `id_s` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_u` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`id_s`) REFERENCES `sport` (`id_s`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`id_s`) REFERENCES `sport` (`id_s`),
  ADD CONSTRAINT `article_ibfk_3` FOREIGN KEY (`id_f`) REFERENCES `flux` (`id_f`);

--
-- Contraintes pour la table `flux`
--
ALTER TABLE `flux`
  ADD CONSTRAINT `flux_ibfk_1` FOREIGN KEY (`id_s`) REFERENCES `sport` (`id_s`);

--
-- Contraintes pour la table `press_book`
--
ALTER TABLE `press_book`
  ADD CONSTRAINT `press_book_ibfk_1` FOREIGN KEY (`id_a`) REFERENCES `article` (`id_a`),
  ADD CONSTRAINT `press_book_ibfk_2` FOREIGN KEY (`id_u`) REFERENCES `users` (`id_u`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_s`) REFERENCES `sport` (`id_s`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
