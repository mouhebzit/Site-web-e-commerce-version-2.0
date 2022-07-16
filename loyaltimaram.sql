-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Hôte : loyaltimaram.mysql.db
-- Généré le : mar. 21 juin 2022 à 23:44
-- Version du serveur : 5.6.50-log
-- Version de PHP : 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `loyaltimaram`
--

-- --------------------------------------------------------

--
-- Structure de la table `Authentification`
--

CREATE TABLE `Authentification` (
  `Adr_mail` varchar(15) NOT NULL,
  `Mot_de_passe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Commande`
--

CREATE TABLE `Commande` (
  `ID_comm` varchar(15) NOT NULL,
  `ID_pers` varchar(15) NOT NULL,
  `ID_prod` varchar(15) NOT NULL,
  `Quantite_commande` int(255) UNSIGNED NOT NULL,
  `Date_commande` date NOT NULL,
  `Prix_commande` int(255) UNSIGNED NOT NULL,
  `Frais_Livraison` int(255) UNSIGNED NOT NULL,
  `Type_Livraison` enum('Standard','Express','','') NOT NULL DEFAULT 'Standard',
  `Mode_Paiement` enum('Carte Bancaire','PayPal','Paylib','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `position` int(3) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `subject_id`, `menu_name`, `position`, `visible`, `content`) VALUES
(4, 2, 'Contact Us', 4, 1, 'jhbj'),
(5, 2, 'Banking', 1, 1, NULL),
(6, 2, 'Credit Cards', 2, 1, NULL),
(7, 2, 'Mortgages', 3, 1, NULL),
(8, 3, 'Checking', 1, 1, NULL),
(9, 3, 'Loans', 2, 1, NULL),
(10, 3, 'Merchant Services', 3, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `Panier`
--

CREATE TABLE `Panier` (
  `ID_pan` varchar(15) NOT NULL,
  `ID_prod` varchar(15) NOT NULL,
  `Nom_produit` varchar(40) NOT NULL,
  `Type_produit` varchar(40) NOT NULL,
  `Marque` varchar(20) NOT NULL,
  `Taille` enum('XXXL','XXL','XL','L','M','S','XS','XXS') NOT NULL,
  `Couleur` varchar(20) DEFAULT NULL,
  `Description` text,
  `Quantite` bigint(255) UNSIGNED NOT NULL,
  `Prix` int(255) UNSIGNED NOT NULL,
  `Image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Personne`
--

CREATE TABLE `Personne` (
  `ID_pers` int(10) UNSIGNED NOT NULL,
  `Civilite` enum('M','F','','') DEFAULT NULL,
  `Nom` varchar(100) NOT NULL,
  `Prenom` varchar(100) NOT NULL,
  `Adr_mail` varchar(100) NOT NULL,
  `Indic` varchar(100) NOT NULL,
  `Num_tel` int(9) UNSIGNED NOT NULL,
  `Date_de_naissance` date NOT NULL,
  `Num_rue` int(4) UNSIGNED NOT NULL,
  `Rue` varchar(100) NOT NULL,
  `Code_postal` int(7) UNSIGNED NOT NULL,
  `Ville` varchar(100) NOT NULL,
  `Pays` varchar(100) NOT NULL,
  `Mot_de_passe` varchar(100) NOT NULL,
  `Statut` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Produit`
--

CREATE TABLE `Produit` (
  `ID_prod` varchar(15) NOT NULL,
  `Nom_produit` varchar(40) NOT NULL,
  `Type_produit` varchar(40) NOT NULL,
  `Marque` varchar(20) NOT NULL,
  `Taille` enum('XXXL','XXL','XL','L','M','S','XS','XXS') NOT NULL,
  `Couleur` varchar(20) DEFAULT NULL,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Quantite` bigint(255) UNSIGNED NOT NULL,
  `Prix` int(255) UNSIGNED NOT NULL,
  `Image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Produit`
--

INSERT INTO `Produit` (`ID_prod`, `Nom_produit`, `Type_produit`, `Marque`, `Taille`, `Couleur`, `Description`, `Quantite`, `Prix`, `Image`) VALUES
('10', 'T-SHIRT HEAVY', 'T-shirt', 'zara', 'S', 'blanc', 'T-shirt confectionné en coton épais. Col rond et manches longues.', 0, 30, 'shirt_blanc.jpeg'),
('2', 'T-SHIRT BASIQUE', 'T-shirt', 'zara', 'M', 'noir', 'T-shirt confectionné dans un coton extensible. Col en V et manches courtes.', 10, 15, 'shirt_noir.jpeg'),
('3', 'T-SHIRT ', 'T-shirt', 'zara', 'L', 'bleu', 'T-shirt en maille tricoté dans un fil de coton. Col rond et manches courtes.', 9, 20, 'shirt_bleu.jpeg'),
('4', 'HAUT BIMATIÈRE EN POPELINE', 'T-shirt', 'zara', 'L', 'bleu', 'T-shirt à col rond et manches courtes. Impression sur le devant en relief bimatière en contraste. Fentes latérales sur le bas.', 3, 25, 'shirt_bleu2.jpeg'),
('5', 'T-SHIRT BASIQUE LIGHTWEIGHT', 'T-shirt', 'zara', 'M', 'rose', 'T-shirt basique confectionné dans un tissu de coton léger. Col rond et manches courtes.', 4, 7, 'shirt_rose.jpeg'),
('6', 'T-SHIRT BASIQUE MEDIUM', 'T-shirt', 'zara', 'M', 'rouge', 'T-shirt regular fit confectionné dans un tissu au fini mercerisé. Col rond au fini en rib et manches courtes.', 9, 25, 'shirt_rouge.jpeg'),
('7', 'T-SHIRT BASIQUE HEAVY WEIGHT', 'T-shirt', 'zara', 'S', 'rouge', 'T-shirt ample confectionné en coton compact. Col rond et manches courtes.', 4, 30, 'shirt_rouge2.jpeg'),
('8', 'T-SHIRT HAUT COURT', 'T-shirt', 'zara', 'L', 'noir', 'T-shirt en maille tricoté dans un fil de coton. Col rond et manches courtes. Finitions en rib.', 22, 10, 'shirt_noir2.jpeg'),
('9', 'T-SHIRT LONG LENGHT', 'T-shirt', 'zara', 'S', 'gris', 'T-shirt extra long. Col rond et manches courtes. Fentes latérales sur le bas.', 6, 20, 'shirt_gris.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `position` int(3) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `subjects`
--

INSERT INTO `subjects` (`id`, `menu_name`, `position`, `visible`) VALUES
(2, 'Consumere', 2, 1),
(3, 'Small Business', 3, 0),
(5, 'Commercial', 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `hashed_password` varchar(255) DEFAULT NULL,
  `admin_access` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `hashed_password`, `admin_access`) VALUES
(5, 'mouhab', 'zitouni', 'zitounimouheb@outlook.fr', '', '$2y$10$e/lQ7mGg2K9UxiOkpoIMBOXVjJBI3D0cKow267oHSnNu4xO2pRAlu', 0),
(6, 'omar', 'graouna', 'omar@gmail.com', '', '$2y$10$By7MMUnPmm9HhP3GmuAj9uTVbpAXf6pTTCVktSvVIHOmaKFAbHIx.', 0),
(7, 'nour', 'houdda', 'houda@gmail.com', '', '$2y$10$T3iAru7NVD82wEVOYpb.BOJYK9PKKlf73/UL7rWWUQHYiG1YGaCyW', 0),
(9, 'Maram', 'Zitouni', 'zitouni.maram@gmail.com', '', '$2y$10$YPxdq1N6X2iDxYWpa.ueYuBwx8BcldZQQgAyC34J5BXDci2PKxJzC', 1),
(10, 'Aymane', 'Tchich', 'aymane2tch@gmail.com', '', '$2y$10$lH.jbGo6lgeeNpsvX6f3M.u1doWYsLcUn0XiR634ZJfeh9JPycijq', 0),
(11, 'Maram', 'Zitouni', 'zitouni.maram20@gmail.com', '', '$2y$10$7guMflFug9UjVuXLkc2z7ehbFDwcfbLKJOiGv.Q79CBGO/UPcFVqS', 0),
(12, 'Maram', 'Zitouni', 'zitouni.maram21@gmail.com', '', '$2y$10$/b5RUOubmZ9wlEF73emtXuUrmRyz7YhawnxyIsQHYyXuOpFJhYvpy', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`ID_comm`);

--
-- Index pour la table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_subject_id` (`subject_id`);

--
-- Index pour la table `Personne`
--
ALTER TABLE `Personne`
  ADD PRIMARY KEY (`ID_pers`);

--
-- Index pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`ID_prod`);

--
-- Index pour la table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_username` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
