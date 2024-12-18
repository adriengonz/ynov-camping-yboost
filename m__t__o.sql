-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 18 déc. 2024 à 16:30
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `météo`
--

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `city`
--

INSERT INTO `city` (`id`, `name`, `longitude`, `latitude`) VALUES
(1, 'Springfield', -93.2923, 37.2153),
(2, 'Shelbyville', -94.222, 38.2151),
(3, 'Ogdenville', -96.1213, 39.2301),
(4, 'North Haverbrook', -95.2022, 38.3102);

-- --------------------------------------------------------

--
-- Structure de la table `city_time`
--

CREATE TABLE `city_time` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `city_time`
--

INSERT INTO `city_time` (`id`, `city_id`, `title`, `body`, `status`, `created_at`) VALUES
(1, 1, 'Morning Weather Update', 'Sunny and warm in the morning hours.', 'active', '2024-12-18 07:00:00'),
(2, 2, 'Afternoon Update', 'Rain expected to start around 2 PM.', 'active', '2024-12-18 13:00:00'),
(3, 3, 'Evening Weather', 'Clear skies expected tonight.', 'active', '2024-12-18 19:00:00'),
(4, 4, 'Storm Alert', 'Severe storm conditions predicted overnight.', 'active', '2024-12-18 22:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `weather`
--

CREATE TABLE `weather` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `temperature` float NOT NULL,
  `precipitation` float NOT NULL,
  `wind_speed` float NOT NULL,
  `weather_condition` varchar(255) NOT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `weather`
--

INSERT INTO `weather` (`id`, `city_id`, `temperature`, `precipitation`, `wind_speed`, `weather_condition`, `recorded_at`) VALUES
(1, 1, 25.3, 0, 15, 'Sunny', '2024-12-18 11:15:42'),
(2, 2, 22.8, 2.5, 10.2, 'Rainy', '2024-12-18 11:15:42'),
(3, 3, 30.5, 0, 5.5, 'Clear', '2024-12-18 11:15:42'),
(4, 4, 18.2, 12.3, 20, 'Stormy', '2024-12-18 11:15:42');

-- --------------------------------------------------------

--
-- Structure de la table `weather_alert`
--

CREATE TABLE `weather_alert` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `alert_type` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `issued_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `weather_alert`
--

INSERT INTO `weather_alert` (`id`, `city_id`, `alert_type`, `description`, `issued_at`) VALUES
(1, 1, 'Heat Wave', 'Temperatures exceeding 35°C expected in the afternoon.', '2024-12-18 11:15:42'),
(2, 2, 'Flood Warning', 'Heavy rain expected to cause localized flooding.', '2024-12-18 11:15:42'),
(3, 3, 'High Winds', 'Gusts up to 80 km/h expected.', '2024-12-18 11:15:42'),
(4, 4, 'Severe Storm', 'Thunderstorms with potential hail and tornadoes.', '2024-12-18 11:15:42');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `city_time`
--
ALTER TABLE `city_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Index pour la table `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Index pour la table `weather_alert`
--
ALTER TABLE `weather_alert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `city_time`
--
ALTER TABLE `city_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `weather`
--
ALTER TABLE `weather`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `weather_alert`
--
ALTER TABLE `weather_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `city_time`
--
ALTER TABLE `city_time`
  ADD CONSTRAINT `city_time_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Contraintes pour la table `weather`
--
ALTER TABLE `weather`
  ADD CONSTRAINT `weather_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Contraintes pour la table `weather_alert`
--
ALTER TABLE `weather_alert`
  ADD CONSTRAINT `weather_alert_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
