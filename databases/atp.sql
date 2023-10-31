-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 31, 2023 at 09:11 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atp`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `permission` int(11) NOT NULL DEFAULT 0,
  `regDate` datetime NOT NULL,
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `firstname`, `lastname`, `nickname`, `permission`, `regDate`, `updateDate`) VALUES
(1, 'Athippat', '!@Aa0853844385', 'Athippat', 'Chirawongnathiporn', 'Athip', 1, '2023-08-11 19:18:03', '2023-08-11 17:19:54'),
(2, 'Staom', 'Staom', 'Suwijak', 'Tapsukalack', 'Aomsin', 1, '2023-10-25 18:36:35', '2023-10-25 16:37:48');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_image` varchar(255) NOT NULL,
  `serveBy` varchar(255) NOT NULL,
  `regDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `menu_id`, `menu_name`, `menu_image`, `serveBy`, `regDate`) VALUES
(1, 1, 'Sesame Marinated Pork', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-10-30 23:58:40'),
(2, 1, 'Sesame Marinated Pork', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-10-30 23:59:25');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`id`, `name`, `unit_id`, `type_id`, `image`) VALUES
(1, 'Pork', 1, 1, 'jpeg'),
(2, 'Black Pepper', 8, 4, 'jpeg'),
(3, 'Sesame oil', 8, 4, 'jpeg'),
(4, 'Sesame', 2, 4, 'jpeg'),
(5, 'Coke', 8, 3, 'jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `material_leftover`
--

CREATE TABLE `material_leftover` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `quantity` float NOT NULL,
  `leftoverBy` varchar(255) NOT NULL,
  `material_id` int(11) NOT NULL,
  `material_image` varchar(255) NOT NULL,
  `regDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `material_leftover`
--

INSERT INTO `material_leftover` (`id`, `name`, `unit`, `type`, `price`, `quantity`, `leftoverBy`, `material_id`, `material_image`, `regDate`) VALUES
(1, 'Sesame', 'G', 'Condiment', 250, 940, 'Athippat Chirawongnathiporn (Athip)', 4, 'jpeg', '2023-10-30 23:34:39'),
(2, 'Coke', 'Bottle', 'Water', 35, 993, 'Athippat Chirawongnathiporn (Athip)', 5, 'jpeg', '2023-10-30 23:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `material_quantity`
--

CREATE TABLE `material_quantity` (
  `id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantity` float NOT NULL,
  `balance` float NOT NULL,
  `regDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `material_quantity`
--

INSERT INTO `material_quantity` (`id`, `material_id`, `price`, `quantity`, `balance`, `regDate`) VALUES
(2, 3, 60, 12, 0, '2023-10-26 10:50:20'),
(3, 4, 10, 100, 0, '2023-10-26 10:50:35'),
(4, 5, 30, 12, 0, '2023-10-26 10:52:02'),
(5, 1, 30, 8, 0, '2023-10-26 10:54:18'),
(6, 1, 100, 20, 0, '2023-10-29 08:27:57'),
(7, 1, 100, 20, 0, '2023-10-29 08:28:00'),
(8, 1, 150, 10, 0, '2023-10-29 08:29:08'),
(9, 2, 85, 24, 24, '2023-10-29 08:29:27'),
(10, 3, 45, 2, 0, '2023-10-29 08:33:41'),
(13, 1, 50, 40, 0, '2023-10-29 08:42:43'),
(14, 1, 90, 20000, 19910, '2023-10-29 09:04:26'),
(17, 3, 5, 20, 18, '2023-10-30 23:54:58'),
(18, 4, 60, 200, 140, '2023-10-30 23:55:09');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `description`, `image`) VALUES
(1, 'Sesame Marinated Pork', NULL, 'jpg'),
(2, 'Pork Chop', NULL, 'jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `menu_material`
--

CREATE TABLE `menu_material` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_material`
--

INSERT INTO `menu_material` (`id`, `menu_id`, `material_id`, `quantity`) VALUES
(1, 1, 1, 20),
(2, 1, 3, 1),
(3, 1, 4, 30),
(4, 2, 1, 10),
(5, 2, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL DEFAULT '#FFFFFF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `type`, `color`) VALUES
(1, 'Meat', '#ff5733'),
(2, 'Vegetable', '#57c785'),
(3, 'Water', '#2a7b9b'),
(4, 'Condiment', '#900c3f');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `unit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `unit`) VALUES
(1, 'KG'),
(2, 'G'),
(3, 'Egg'),
(4, 'Tablespoon'),
(5, 'Cup'),
(6, 'Teaspoon'),
(7, 'Ounce'),
(8, 'Bottle'),
(9, 'ML');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_leftover`
--
ALTER TABLE `material_leftover`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_quantity`
--
ALTER TABLE `material_quantity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_material`
--
ALTER TABLE `menu_material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `material_leftover`
--
ALTER TABLE `material_leftover`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `material_quantity`
--
ALTER TABLE `material_quantity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_material`
--
ALTER TABLE `menu_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
