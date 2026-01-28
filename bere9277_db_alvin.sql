-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 27, 2026 at 01:48 PM
-- Server version: 11.4.9-MariaDB-cll-lve
-- PHP Version: 8.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bere9277_db_alvin`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(160) NOT NULL,
  `content` text NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `title`, `content`, `image_url`, `created_at`) VALUES
(1, 1, 'Cara memilh sepatu kalcer', 'sung ajah di simpen der', 'https://cdn-web.ruangguru.com/landing-pages/assets/hs/Ciri%20-%20ciri%20artikel.png', '2026-01-20 15:01:56'),
(2, 1, 'Cara Membedakan Sepatu Ori dan KW', 'Di artikel ini anda akan di ajari bagaimana sih caranya membedakan mana sepatu yang original dan mana yang KW (palsu)', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJL3xfxnvLyhU7A0zwkLGK0DeUQhSPl3-M9A&s', '2026-01-21 08:01:51'),
(3, 3, 'Jaman gini masih  make sepatu KW?', 'Dijaman yang sudah semaju ini banyak orang yang menjual sepatu branded secondhand dengan harga yang murah', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIVpOqpTP_znxAnL_9sTNPmsfCytK7OIZ7Hw&s', '2026-01-23 10:34:18');

-- --------------------------------------------------------

--
-- Table structure for table `shoes`
--

CREATE TABLE `shoes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(120) NOT NULL,
  `brand` varchar(80) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shoes`
--

INSERT INTO `shoes` (`id`, `user_id`, `name`, `brand`, `price`, `description`, `image_url`, `created_at`) VALUES
(4, 1, 'Jordan IV Fire Red', 'Nike', 8350000, 'Nike Air Jordan 4 Fire Red', 'https://images.stockx.com/images/Air-Jordan-4-Retro-Fire-Red-2020-Product.jpg?fit=fill&bg=FFFFFF&w=700&h=500&fm=webp&auto=compress&q=90&dpr=2&trim=color&updated_at=1738193358', '2026-01-21 06:12:32'),
(6, 1, 'Chuck Taylor 70s', 'Converse', 899000, 'Converse Chuck Taylor 70s', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG4bJsdEKy6iRm72vrrnu-PKaNezsjYHq5MA&s', '2026-01-21 07:51:26'),
(7, 1, 'Jordan 2 Union LA', 'Nike', 2399000, 'Nike Air Jordan 2 Union LA', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFyik9IEf2Rja0XOdExMv9QwwshpTy_dPgCw&s', '2026-01-21 07:55:28'),
(8, 1, 'Jordan 12 Taxi', 'Nike', 4730000, 'Nike Air Jordan 12 Taxi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSEYtTTOJhFeiv9zbKCTyC0qNAsT65YL6e1A&s', '2026-01-21 07:59:16'),
(9, 3, 'Jordan 13 Red Cherry', 'Nike', 5800000, 'Nike Air Jordan 13 Red Cherry', 'https://images.stockx.com/images/Air-Jordan-13-Retro-Cherry-2010-Product.jpg?fit=fill&bg=FFFFFF&w=700&h=500&fm=webp&auto=compress&q=90&dpr=2&trim=color&updated_at=1738193358', '2026-01-23 10:32:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `created_at`) VALUES
(1, 'alvin', 'alvingans@gmail.com', '$2y$10$X1tQji4Sd5N79lD6LJpAfevcIClgFsNtu.u0OXurv/ROjo8iitE8S', '2026-01-20 14:47:50'),
(2, 'tester123', 'tester123@gmail.com', '$2y$10$qO2pIo/6JTih799/23RDuuhW6gAKenvc991Ic0UDmmFmEsqiHsESe', '2026-01-23 09:14:23'),
(3, 'Alvin', 'alvinkhair@gmail.com', '$2y$10$4db8BdJYqWnLgZShFZv0rOPllczEAoWNMz2hDeqHG/KGwjkuMpTui', '2026-01-23 09:28:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `shoes`
--
ALTER TABLE `shoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shoes`
--
ALTER TABLE `shoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `shoes`
--
ALTER TABLE `shoes`
  ADD CONSTRAINT `shoes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
