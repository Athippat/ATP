-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 24, 2023 at 09:37 AM
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
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `permission` int(11) NOT NULL DEFAULT 0 COMMENT '0=Staff\r\n1=Admin\r\n2=Stock Checker',
  `image` varchar(255) DEFAULT NULL,
  `regDate` datetime NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `firstname`, `lastname`, `nickname`, `permission`, `image`, `regDate`, `updateDate`) VALUES
(1, 'Athippat', '!@Aa0853844385', 'Athippat', 'Chirawongnathiporn', 'Athip', 1, 'png', '2023-08-11 19:18:03', '2023-12-23 19:02:48'),
(2, 'Staom', 'Staom', 'Suwijak', 'Tapsukalack', 'Aomsin', 0, 'png', '2023-10-25 18:36:35', '2023-12-23 21:48:20'),
(3, 'plume', 'pongsakorn', 'pongsakorn', 'sommapee', 'plume', 2, NULL, '2023-10-31 21:53:11', '2023-12-23 19:41:10'),
(4, 'bronystylecrazy', '12345678', 'Sirawit', 'Pratoomsuwan', 'Art', 1, NULL, '2023-11-15 00:13:06', '2023-11-14 23:13:50'),
(10, 'Cher', '12345', 'Temtrong', 'Araimairu', 'Tam', 0, 'jpg', '2023-12-21 15:34:29', '2023-12-23 19:35:05'),
(11, 'asddsa', 'sadsda', 'sad', 'sad', 'dad', 0, 'jpeg', '2023-12-21 15:35:20', '2023-12-21 08:35:20'),
(12, 'asd', 'asd', 'ASD', 'DSA', 'dick', 2, 'jpeg', '2023-12-24 05:33:07', '2023-12-23 22:33:07'),
(14, 'Porn', 'chai', 'Athippat', 'ads', 'Toei', 0, 'jpg', '2023-12-24 15:07:50', '2023-12-24 08:08:42');

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
(1, 1, 'Dolly Fish', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(2, 2, 'Tender Marinated Pork', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(3, 3, 'Seafood Sauce', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(4, 5, 'Suki Sauce', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(5, 7, 'Chopstick', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(6, 8, 'Garlic', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(7, 9, 'Chili', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(8, 10, 'Egg', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(9, 10, 'Egg', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(10, 11, 'Water Spinach', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(11, 12, 'Celery', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(12, 13, 'Spring onion', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(13, 14, 'Pork Garlic And Black Pepper ', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(14, 15, 'Lard', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(15, 16, 'Bouncy Pork', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(16, 17, 'BBQ pork with spicy sauce', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(17, 18, 'Sliced Pork Neck ', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(18, 19, 'Tender Beef', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(19, 20, 'Chicken Garlic And Black Pepper', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(20, 21, 'Pork Belly Marinated in Sesame oil', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(21, 22, 'Squid Pineapple Cut', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(22, 23, 'Squid Ring ', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(23, 24, 'Cut Tentacled Squid', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(24, 25, 'Shrimp', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(25, 26, 'Squid', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(26, 27, 'Cheese Buns', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(27, 28, 'Pork Meatball', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(28, 29, 'Rugby Fish Meatball', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(29, 30, 'Ham', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(30, 31, 'Angry Birds Fish Cake', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(31, 32, 'Egg Tofu', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(32, 33, 'Crab Stick Salad Roll', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(33, 34, 'Crab Stick', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(34, 35, 'Sausage', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(35, 37, 'Sliced Squid', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(36, 39, 'Crispy Squid', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(37, 40, 'Cow Offal', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(38, 41, 'Pork Liver', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(39, 42, 'Chinese Cabbage', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(40, 43, 'Lettuce', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(41, 44, 'Bok Choy ', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(42, 45, 'Cabbage', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(43, 46, 'Corn', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(44, 47, 'Broccoli', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(45, 48, 'Pumpkin', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(46, 49, 'Carrot', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(47, 50, 'Sunflower Sprouts', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(48, 51, 'Wood Ear Mushroom', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(49, 52, 'Baby Corn', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(50, 53, 'Radish', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(51, 54, 'Eryngii Mushroom', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(52, 55, 'White Shimeji Mushroom', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(53, 56, 'Golden Needle Mushroom', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(54, 57, 'Corn Pellets', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(55, 58, 'Seaweed', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(56, 59, 'Yumyum', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(57, 60, 'Vermicelli', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(58, 61, 'Kelp Noodle', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(59, 62, 'Diced Bread', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(60, 63, 'Sugar', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(61, 64, 'Margarine', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(62, 65, 'Chocolate spread', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(63, 66, 'Pineapple spread', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(64, 67, 'Strawberry spread', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(65, 68, 'Orange spread', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(66, 69, 'Mentos', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(67, 70, 'Jelly Candy', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(68, 71, 'Marshmallow', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(69, 73, 'Fruit Salad', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(70, 75, 'Hale\'s Blue Boy Red Syrup', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(71, 76, 'Hale\'s Blue Boy Green Syrup', 'jpeg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(72, 77, 'Blue Hawaii Syrup', 'png', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(73, 78, 'Dice Taro', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(74, 79, 'Lod Chong', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(75, 80, 'Syrup', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(76, 81, 'Cantaloupe', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(77, 82, 'Crispy Tubtim', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(78, 83, 'Slim', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(79, 84, 'Grass Jelly', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(80, 85, 'Cornflakes', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(81, 86, 'Thong Yod', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(82, 87, 'Basil Seeds', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(83, 88, 'Lokchid', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(84, 89, 'Palm', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(85, 90, 'Raisins', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(86, 91, 'Jujube', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(87, 92, 'Cream puffs', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(88, 93, 'Tago', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(89, 94, 'Coconut Agar', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(90, 95, 'Brownies', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(91, 96, 'Boiled Quail Eggs', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(92, 97, 'Tomato', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(93, 98, 'Rings Onion', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(94, 99, 'Bell Pepper', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(95, 100, 'Shredded Salad', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(96, 103, 'Jade Noodles', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(97, 104, 'Watermelon', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(98, 105, 'Wood Ear Mushroom', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(99, 107, 'Crab Stick Seaweed Roll', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(100, 108, 'Fish Tofu', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(101, 109, 'Jelly Fish', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(102, 110, 'Sbai Nang', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(103, 111, 'Shang Ji', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(104, 112, 'Pickled Small Mango', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(105, 113, 'Pickled Tamarind', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(106, 114, 'Pickled Mango', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(107, 115, 'Pickled Santol', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(108, 116, 'Agar', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(109, 117, 'Coconut Jelly', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(110, 118, 'Dragon Fruit', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(111, 119, 'Mango soaked in plums', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(112, 120, 'Guava soaked in plums', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(113, 121, 'Fruit Dipping Powder', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(114, 122, 'Coconut milk syrup', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(115, 123, 'Cream Salad Dressing', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(116, 124, 'Steamed bun', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(117, 125, 'Dim sum', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(118, 126, 'Japan cooked rice', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(119, 127, 'Seaweed Salad', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(120, 128, 'Sour soy sauce', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(121, 129, 'Fried garlic', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(122, 131, 'Cut Crab stick', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(123, 133, 'Fried Cheese Ball', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(124, 134, 'Fried spring rolls', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(125, 135, 'Fried fermented pork', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(126, 136, 'Nugget', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(127, 137, 'Shrimp wrapped in sugarcane', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(128, 138, 'Sweet potato in syrup ', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(129, 139, 'Dried salted plums', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(130, 140, 'Tulee choco ball', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(131, 141, 'Marshmallow I', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(132, 142, 'Marshmallow II', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(133, 143, 'Marshmallow III', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(134, 144, 'Marshmallow IV', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(135, 145, 'Choco Candies', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(136, 146, 'Jelly Candy II', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(137, 148, 'Green Fruit Salad ', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(138, 149, 'Mixed Syrups', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(139, 150, 'Grill Sauce', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(140, 151, 'Margarine for grill', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(141, 152, 'FranceFried', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(142, 153, 'Mixed Sauces', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(143, 155, 'Big Shrimp for grill', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(144, 156, 'Spotted Babylon (Sweet Shell)', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(145, 157, 'Clam', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(146, 163, 'Mussel', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(147, 2, 'Tender Marinated Pork', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(148, 10, 'Egg', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(149, 15, 'Lard', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(150, 133, 'Fried Cheese Ball', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(151, 103, 'Jade Noodles', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-18 19:00:00'),
(152, 7, 'Chopstick', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-19 11:21:09'),
(153, 165, 'test', 'png', 'pongsakorn sommapee (plume)', '2023-12-21 23:27:56'),
(154, 1, 'Dolly Fish', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-24 05:29:59'),
(155, 2, 'Tender Marinated Pork', 'jpg', 'isa isa (isa)', '2023-12-24 05:35:16'),
(156, 34, 'Crab Stick', 'jpg', 'isa isa (isa)', '2023-12-24 05:35:45'),
(157, 1, 'Dolly Fish', 'jpg', '  ()', '2023-12-24 14:48:03'),
(158, 1, 'Dolly Fish', 'jpg', 'Athippat Chirawongnathiporn (Athip)', '2023-12-24 15:12:07'),
(159, 37, 'Sliced Squid', 'jpg', 'Athippat ads (Toei)', '2023-12-24 15:17:22');

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
(1, 'Green Cap Seasoning Sauce', 4, 5, 'jpg'),
(2, 'Soy Sauce', 4, 5, 'png'),
(3, 'Oyster Sauce', 4, 5, 'jpg'),
(4, 'Globe fish sauce/mixed flavor', 4, 5, 'png'),
(5, 'sesame oil', 4, 5, 'png'),
(6, 'vinegar', 4, 5, 'png'),
(7, 'tomato ketchup', 4, 5, 'png'),
(8, 'chili sauce', 4, 5, 'png'),
(9, 'Ocha Chili Paste', 4, 5, 'png'),
(10, 'chili oil', 4, 5, 'png'),
(11, 'Pure M.S.G.', 1, 5, 'png'),
(12, 'M.S.G.', 1, 5, 'png'),
(13, 'Knorr Soup Cubes', 1, 5, 'png'),
(14, 'brown sugar', 1, 5, 'png'),
(15, 'white sugar', 1, 5, 'png'),
(16, 'Squid pineapple cut', 1, 7, 'jpeg'),
(17, 'Palm oil', 1, 5, 'png'),
(18, 'Margarine', 1, 5, 'png'),
(19, 'Cut tentacled squid', 1, 7, 'jpeg'),
(20, 'white sesame', 1, 5, 'png'),
(21, 'Chinese liquor', 4, 5, 'png'),
(22, 'Pickled garlic juice', 4, 5, 'png'),
(23, 'Pickled garlic', 1, 5, 'png'),
(24, 'palm sugar', 1, 5, 'png'),
(25, 'salt', 1, 5, 'png'),
(26, 'instant noodles', 9, 8, 'png'),
(27, 'fragrant chili', 1, 5, 'png'),
(28, 'ground pepper', 1, 5, 'png'),
(29, 'black pepper', 1, 5, 'png'),
(30, 'black seaweed', 9, 1, 'png'),
(31, 'white mushroom', 1, 5, 'png'),
(32, 'Squid Rings', 1, 7, 'jpeg'),
(33, 'Bouncy Pork', 1, 2, 'jpg'),
(34, 'Fried garlic', 1, 5, 'png'),
(35, 'Jellyfish', 1, 7, 'jpg'),
(36, 'Thai Blue Lemonade', 4, 5, 'png'),
(37, 'Cheese Buns', 1, 6, 'jpeg'),
(38, 'Crispy Squid', 1, 7, 'jpeg'),
(39, 'Kikkoman', 4, 5, 'png'),
(40, 'Sbai Nang', 1, 2, 'jpeg'),
(41, 'Sweet Shellfish', 1, 7, 'jpeg'),
(42, 'sweetened condensed milk', 4, 5, 'png'),
(43, 'Neck Meat', 1, 2, 'jpeg'),
(44, 'Thai Bay Pressed Crab', 1, 6, 'jpeg'),
(45, 'Raisins', 1, 5, 'png'),
(46, 'Seaweed Salad', 9, 6, 'jpeg'),
(47, 'Cheese Balls', 1, 6, 'jpeg'),
(48, 'Jujube', 9, 3, 'jpg'),
(49, 'Scallop', 1, 6, 'jpeg'),
(51, 'syrup', 4, 5, 'png'),
(53, 'Dim Sum', 9, 6, 'jpeg'),
(54, 'Hell Blue Boy Red Water', 10, 4, 'png'),
(55, 'Twisted Shellfish', 1, 7, 'jpeg'),
(56, 'Hell Blue Boy Orange Juice', 10, 4, 'png'),
(57, 'Blue Hawaii Hell Blue Boy Water', 10, 4, 'png'),
(58, 'Squid', 1, 7, 'jpeg'),
(59, 'Hell Blue Boy Grape Juice', 10, 4, 'png'),
(60, 'Stuffed Shellfish', 1, 7, 'jpeg'),
(61, 'Hell Blue Boy Green Juice', 10, 4, 'png'),
(62, 'BBQ stick', 9, 9, 'png'),
(63, 'curry rubber band', 9, 9, 'png'),
(64, 'foam cup', 9, 9, 'png'),
(65, 'mixing bowl', 9, 9, 'png'),
(66, 'Sunlight dishwashing liquid', 9, 9, 'png'),
(67, 'washing powder', 1, 9, 'png'),
(68, 'rubber gloves', 9, 9, 'png'),
(69, 'bathroom cleaner', 10, 9, 'png'),
(70, 'Scotch Brite', 9, 9, 'png'),
(71, 'Steel wool', 9, 9, 'png'),
(72, 'rice', 1, 5, 'png'),
(73, 'bag with handle', 9, 9, 'png'),
(74, 'Salmon Stick', 1, 7, 'jpeg'),
(75, 'chopsticks', 9, 9, 'png'),
(76, 'Sweet Egg', 1, 6, 'jpeg'),
(77, 'tube', 9, 9, 'png'),
(78, 'Canned Tuna', 1, 2, 'jpg'),
(79, 'black pepper sauce', 4, 5, 'png'),
(80, 'Sushi Rice', 1, 10, 'jpeg'),
(81, 'Wasabi', 2, 5, 'jpeg'),
(82, 'Seasoning Sauce', 1, 5, 'jpeg'),
(83, 'Mala Sauce', 4, 5, 'png'),
(84, 'Pork liver', 1, 5, 'png'),
(86, 'dolly fish', 1, 7, 'png'),
(87, 'chicken breast', 1, 11, 'png'),
(88, 'Chicken frame', 1, 11, 'png'),
(89, 'Green/Orange Dragon Eggs', 2, 5, 'jpeg'),
(90, 'chicken entrails', 1, 11, 'png'),
(91, 'bacon', 1, 11, 'png'),
(92, 'Golden Needle Mushroom', 1, 1, 'png'),
(93, 'White Reishi Mushroom', 1, 1, 'png'),
(94, 'Eryngii Mushroom', 1, 1, 'png'),
(95, 'Japanese spring onions', 1, 1, 'png'),
(96, 'Teriyaki Sauce', 4, 5, 'png'),
(97, 'Shouyou', 4, 5, 'png'),
(98, 'mirin', 4, 5, 'png'),
(99, 'tissue', 9, 9, 'png'),
(100, 'Lod Chong', 1, 12, 'png'),
(101, 'grass jelly', 9, 12, 'png'),
(102, 'Mun cheum', 1, 12, 'png'),
(103, 'palm', 2, 12, 'png'),
(104, 'cantaloupe', 1, 3, 'png'),
(105, 'Thong Yod', 9, 12, 'png'),
(106, 'sago', 1, 12, 'png'),
(107, 'Crispy Tubtim', 9, 12, 'png'),
(108, 'Slim', 9, 12, 'png'),
(109, 'Lokchid', 2, 12, 'png'),
(110, 'Cornflakes', 1, 6, 'jpg'),
(111, 'M & M', 9, 6, 'jpeg'),
(112, 'Pickled Mango', 1, 3, 'png'),
(113, 'Pickled tamarind', 1, 3, 'png'),
(114, 'Pickled grapes', 1, 3, 'png'),
(115, 'Chocolate Chips', 9, 6, 'jpeg'),
(116, 'Pickled Santol', 1, 3, 'png'),
(117, 'Jelly', 1, 6, 'jpeg'),
(118, 'Marshmallow', 9, 6, 'jpeg'),
(119, 'watermelon', 1, 3, 'png'),
(120, 'Fruit Salad', 9, 6, 'jpeg'),
(121, 'dragon fruit', 1, 3, 'png'),
(122, 'Mayonnaise', 9, 5, 'jpeg'),
(123, 'Cantaloupe', 1, 3, 'png'),
(124, 'Guava soaked with plums', 1, 3, 'png'),
(125, 'Salad Dressing', 9, 5, 'jpeg'),
(126, 'mango', 1, 3, 'png'),
(127, 'Local Bread', 9, 11, 'png'),
(128, 'Chang', 10, 4, 'jpeg'),
(129, 'LEO', 10, 4, 'jpeg'),
(130, 'Singha', 10, 4, 'jpeg'),
(131, 'water spinach', 1, 1, 'png'),
(132, 'Soda', 10, 4, 'jpeg'),
(133, 'Chinese Cabbage', 1, 1, 'png'),
(134, 'Cabbage', 1, 1, 'png'),
(135, 'Celery', 1, 1, 'png'),
(136, 'Broccoli', 1, 1, 'png'),
(137, 'white wood ear mushroom', 1, 1, 'jpg'),
(138, 'Radish', 1, 1, 'png'),
(139, 'carrot', 1, 1, 'png'),
(140, 'spring onion', 1, 1, 'png'),
(141, 'baby corn', 1, 1, 'png'),
(142, 'sweet corn', 1, 1, 'png'),
(143, 'corn pellets', 1, 1, 'png'),
(144, 'lemon', 1, 5, 'png'),
(145, 'Thai coriander', 1, 1, 'png'),
(146, 'coriander root', 1, 1, 'png'),
(147, 'parsley', 1, 1, 'png'),
(148, 'cucumber', 1, 1, 'png'),
(149, 'long beans', 1, 1, 'png'),
(150, 'tomato', 1, 1, 'png'),
(151, 'shallots', 1, 1, 'png'),
(152, 'Onion', 1, 1, 'png'),
(153, 'Carved Garlic', 1, 1, 'png'),
(154, 'red bell pepper', 1, 1, 'png'),
(155, 'bird\'s eye chilli', 1, 1, 'png'),
(156, 'smile good lettuce', 1, 1, 'png'),
(157, 'Bitter melon', 1, 1, 'png'),
(158, 'young chilli', 1, 1, 'png'),
(159, 'bell pepper', 1, 1, 'png'),
(160, 'Queen Eggplant', 1, 1, 'png'),
(161, 'purple cabbage', 1, 1, 'png'),
(162, 'pumpkin', 1, 1, 'png'),
(163, 'pandan leaf', 1, 1, 'png'),
(164, 'peppermint', 1, 1, 'png'),
(165, 'Kaffir lime leaves', 1, 1, 'png'),
(166, 'lemon grass', 1, 1, 'png'),
(167, 'dried chilli', 1, 5, 'png'),
(168, 'Sour Mango', 1, 3, 'png'),
(169, 'sausage', 1, 6, 'png'),
(170, 'Crab sticks', 1, 6, 'png'),
(171, 'fish ball sticks', 1, 6, 'png'),
(172, 'Seaweed Chicken', 1, 6, 'png'),
(173, 'ham', 1, 6, 'png'),
(174, 'Fish Tofu', 1, 6, 'png'),
(175, 'Egg Tofu', 9, 5, 'png'),
(176, 'Quail eggs', 1, 5, 'png'),
(177, 'dumplings', 9, 5, 'png'),
(178, 'vermicelli', 9, 5, 'png'),
(179, 'kelp noodle', 9, 8, 'png'),
(180, 'beef', 1, 2, 'png'),
(181, 'Egg', 9, 5, 'jpg'),
(182, 'Lard', 1, 2, 'png'),
(183, 'Pork Loin', 1, 2, 'jpg'),
(184, 'Jade Noodles', 9, 8, 'jpg'),
(185, 'Pork Belly', 1, 2, 'jpg'),
(187, 'Shrimp', 1, 2, 'jpg'),
(188, 'Pork Meatball', 1, 2, 'jpg'),
(189, 'Rugby Fish Meatball', 1, 2, 'jpg'),
(190, 'Angry Birds Fish Cake', 1, 2, 'jpg'),
(191, 'Bok Choy ', 1, 1, 'jpg'),
(192, 'Sunflower Sprouts', 1, 1, 'jpg'),
(193, 'Wood Ear Mushroom', 1, 1, 'jpg'),
(194, 'YumYum', 9, 8, 'jpg'),
(195, 'Chocolate Spread', 9, 12, 'jpeg'),
(196, 'Pineapple Spread', 1, 12, 'jpg'),
(197, 'Strawberry Spread', 1, 12, 'jpg'),
(198, 'Orange Spread', 1, 12, 'jpg'),
(199, 'Mentos Mint', 9, 12, 'jpeg'),
(200, 'Mentos Fruity', 9, 12, 'jpg'),
(201, 'Ice', 1, 4, 'jpg'),
(202, 'Dice Taro', 1, 12, 'jpg'),
(203, 'Basil Seed', 2, 12, 'jpg'),
(204, 'Cream Puffs', 9, 12, 'jpg'),
(205, 'Tago', 9, 12, 'jpg'),
(206, 'Coconut Agar', 9, 12, 'jpg'),
(208, 'Brownies', 9, 12, 'jpg'),
(209, 'Boiled Quail Eggs', 9, 2, 'jpg'),
(210, 'Shredded Cabbage', 2, 2, 'jpg'),
(211, 'Shredded Red Cabbage', 2, 1, 'jpg'),
(212, 'Shredded Carrots', 2, 1, 'jpeg'),
(213, 'Sliced Squid', 1, 7, 'jpg'),
(214, 'Cow Offal', 1, 2, 'jpg'),
(215, 'Crab stick seaweed rolls', 1, 2, 'jpg'),
(216, 'Fish Tofu', 1, 2, 'png'),
(217, 'Jelly Fish', 1, 7, 'jpg'),
(218, 'Shang Ji', 1, 2, 'jpg'),
(219, 'Pickled small mango', 2, 3, 'jpg'),
(221, 'Coconut Jelly', 2, 12, 'jpg'),
(222, 'Agar', 9, 12, 'jpg'),
(223, 'Mango soaked in plums', 1, 3, 'jpg'),
(224, 'Sour soy sauce', 4, 5, 'jpg'),
(225, 'Coconut milk syrup', 4, 12, 'jpg'),
(226, 'Cream salad dressing', 4, 5, 'jpg'),
(227, 'Steamed bun', 9, 6, 'jpg'),
(228, 'Dried salted plums', 9, 3, 'jpg'),
(229, 'Marshmallow I', 9, 6, 'jpg'),
(230, 'Tulee choco ball', 9, 6, 'jpg'),
(231, 'Marshmallow II', 9, 6, 'jpg'),
(232, 'Marshmallow III', 9, 6, 'jpg'),
(233, 'Marshmallow IV', 9, 6, 'jpg'),
(234, 'Choco Candies', 9, 6, 'jpg'),
(235, 'Jelly Candy II', 9, 6, 'jpg'),
(236, 'Green Fruit Salad', 9, 12, 'jpg'),
(237, 'FranceFried', 9, 6, 'jpg'),
(238, 'Mussel', 1, 7, 'jpg'),
(239, 'Big Shrimp for grill', 1, 7, 'jpg'),
(240, 'Spotted Babylon (Sweet Shell)', 1, 7, 'jpg'),
(241, 'Clam', 1, 7, 'jpg'),
(242, 'Sweet potato in syrup', 1, 12, 'jpg'),
(243, 'Grill Sauce', 9, 5, 'jpg'),
(244, 'Fried spring rolls', 9, 6, 'jpg'),
(245, 'Fried fermented pork', 9, 6, 'jpg'),
(246, 'Nuget', 9, 6, 'jpg'),
(247, 'Shrimp wrapped in sugarcane', 9, 6, 'jpg'),
(248, 'Margarine for grill', 1, 5, 'jpg'),
(249, 'Crab Stick Salad Roll', 9, 6, 'jpg'),
(250, 'Num Yum Sai', 3, 5, 'png'),
(251, 'Water', 4, 4, 'jpg');

-- --------------------------------------------------------

--
-- Table structure for table `material_cost`
--

CREATE TABLE `material_cost` (
  `id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantity` float NOT NULL,
  `regDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `material_cost`
--

INSERT INTO `material_cost` (`id`, `material_id`, `price`, `quantity`, `regDate`) VALUES
(1, 86, 85, 2, '2023-12-18 19:03:39'),
(2, 5, 0.176, 100, '2023-12-18 19:03:39'),
(3, 2, 0.09, 50, '2023-12-18 19:03:39'),
(4, 3, 0.045, 50, '2023-12-18 19:03:39'),
(5, 15, 0.05, 0.01, '2023-12-18 19:03:39'),
(6, 20, 0.14, 0.005, '2023-12-18 19:03:39'),
(7, 183, 115, 2, '2023-12-18 19:03:39'),
(8, 155, 163, 0.3, '2023-12-18 19:03:39'),
(9, 151, 0.085, 0.1, '2023-12-18 19:03:39'),
(10, 11, 0.25, 0.1, '2023-12-18 19:03:39'),
(11, 153, 85, 0.1, '2023-12-18 19:03:39'),
(12, 81, 0.039, 12, '2023-12-18 19:03:39'),
(13, 146, 0.116, 0.1, '2023-12-18 19:03:39'),
(14, 250, 95, 1.5, '2023-12-18 19:03:39'),
(15, 154, 65, 1.2, '2023-12-18 19:03:39'),
(16, 153, 85, 0.8, '2023-12-18 19:03:39'),
(17, 15, 0.05, 2.8, '2023-12-18 19:03:39'),
(18, 24, 0.06, 1.6, '2023-12-18 19:03:39'),
(19, 25, 0.013, 0.6, '2023-12-18 19:03:39'),
(20, 20, 0.14, 0.4, '2023-12-18 19:03:39'),
(21, 145, 30, 0.5, '2023-12-18 19:03:39'),
(22, 251, 0.001, 4800, '2023-12-18 19:03:39'),
(23, 22, 0.035, 1500, '2023-12-18 19:03:39'),
(24, 36, 0.04, 1400, '2023-12-18 19:03:39'),
(25, 75, 0.65, 100, '2023-12-18 19:03:39'),
(26, 153, 85, 1, '2023-12-18 19:03:39'),
(27, 155, 163, 1, '2023-12-18 19:03:39'),
(28, 181, 4.3, 30, '2023-12-18 19:03:39'),
(29, 181, 4.3, 30, '2023-12-18 19:03:39'),
(30, 131, 18.5, 3, '2023-12-18 19:03:39'),
(31, 135, 55, 1, '2023-12-18 19:03:39'),
(32, 140, 50, 1, '2023-12-18 19:03:39'),
(33, 79, 0.15, 50, '2023-12-18 19:03:39'),
(34, 183, 115, 2, '2023-12-18 19:03:39'),
(35, 182, 55, 2, '2023-12-18 19:03:39'),
(36, 33, 89, 1, '2023-12-18 19:03:39'),
(37, 83, 0.161, 50, '2023-12-18 19:03:39'),
(38, 183, 115, 2, '2023-12-18 19:03:39'),
(39, 43, 142, 2, '2023-12-18 19:03:39'),
(40, 180, 150, 2, '2023-12-18 19:03:39'),
(41, 3, 0.045, 20, '2023-12-18 19:03:39'),
(42, 15, 0.05, 0.01, '2023-12-18 19:03:39'),
(43, 21, 0.52, 10, '2023-12-18 19:03:39'),
(44, 87, 87.5, 2, '2023-12-18 19:03:39'),
(45, 79, 0.15, 50, '2023-12-18 19:03:39'),
(46, 185, 155, 2, '2023-12-18 19:03:39'),
(47, 5, 0.176, 100, '2023-12-18 19:03:39'),
(48, 3, 0.045, 50, '2023-12-18 19:03:39'),
(49, 2, 0.09, 50, '2023-12-18 19:03:39'),
(50, 15, 0.05, 0.01, '2023-12-18 19:03:39'),
(51, 20, 0.14, 0.005, '2023-12-18 19:03:39'),
(52, 16, 95, 1, '2023-12-18 19:03:39'),
(53, 32, 149, 1, '2023-12-18 19:03:39'),
(54, 19, 79, 1, '2023-12-18 19:03:39'),
(55, 187, 120, 3, '2023-12-18 19:03:39'),
(56, 58, 179, 1, '2023-12-18 19:03:39'),
(57, 37, 290, 1, '2023-12-18 19:03:39'),
(58, 188, 79, 1, '2023-12-18 19:03:39'),
(59, 189, 89, 1, '2023-12-18 19:03:39'),
(60, 173, 140, 1, '2023-12-18 19:03:39'),
(61, 190, 105, 1, '2023-12-18 19:03:39'),
(62, 175, 9.5, 8, '2023-12-18 19:03:39'),
(63, 249, 60, 1, '2023-12-18 19:03:39'),
(64, 44, 149, 1, '2023-12-18 19:03:39'),
(65, 169, 129, 1, '2023-12-18 19:03:39'),
(66, 213, 129, 1, '2023-12-18 19:03:39'),
(67, 38, 89.5, 2, '2023-12-18 19:03:39'),
(68, 214, 155, 2, '2023-12-18 19:03:39'),
(69, 84, 115, 2, '2023-12-18 19:03:39'),
(70, 133, 175, 2, '2023-12-18 19:03:39'),
(71, 156, 45, 0.5, '2023-12-18 19:03:39'),
(72, 191, 30, 2, '2023-12-18 19:03:39'),
(73, 134, 39, 2, '2023-12-18 19:03:39'),
(74, 142, 50, 1, '2023-12-18 19:03:39'),
(75, 136, 60, 1, '2023-12-18 19:03:39'),
(76, 162, 69, 1, '2023-12-18 19:03:39'),
(77, 139, 25, 1, '2023-12-18 19:03:39'),
(78, 192, 62, 0.5, '2023-12-18 19:03:39'),
(79, 137, 180, 0.5, '2023-12-18 19:03:39'),
(80, 141, 116, 2, '2023-12-18 19:03:39'),
(81, 138, 125, 0.5, '2023-12-18 19:03:39'),
(82, 94, 57, 1, '2023-12-18 19:03:39'),
(83, 31, 50, 1, '2023-12-18 19:03:39'),
(84, 92, 46, 2, '2023-12-18 19:03:39'),
(85, 143, 65, 1, '2023-12-18 19:03:39'),
(86, 30, 828, 6, '2023-12-18 19:03:39'),
(87, 194, 2.33, 40, '2023-12-18 19:03:39'),
(88, 178, 50, 12, '2023-12-18 19:03:39'),
(89, 179, 9.8, 6, '2023-12-18 19:03:39'),
(90, 127, 20, 1, '2023-12-18 19:03:39'),
(91, 15, 0.05, 1, '2023-12-18 19:03:39'),
(92, 18, 0.35, 1, '2023-12-18 19:03:39'),
(93, 195, 185, 1, '2023-12-18 19:03:39'),
(94, 196, 299, 1, '2023-12-18 19:03:39'),
(95, 197, 264, 1, '2023-12-18 19:03:39'),
(96, 198, 231, 1, '2023-12-18 19:03:39'),
(97, 199, 49, 1, '2023-12-18 19:03:39'),
(98, 200, 49, 1, '2023-12-18 19:03:39'),
(99, 117, 66, 0.5, '2023-12-18 19:03:39'),
(100, 118, 42, 1, '2023-12-18 19:03:39'),
(101, 120, 50, 1, '2023-12-18 19:03:39'),
(102, 54, 126, 1, '2023-12-18 19:03:39'),
(103, 61, 80, 1, '2023-12-18 19:03:39'),
(104, 57, 85, 1, '2023-12-18 19:03:39'),
(105, 202, 0.087, 1, '2023-12-18 19:03:39'),
(106, 100, 30, 1, '2023-12-18 19:03:39'),
(107, 51, 0.046, 500, '2023-12-18 19:03:39'),
(108, 104, 45, 0.5, '2023-12-18 19:03:39'),
(109, 107, 46, 3, '2023-12-18 19:03:39'),
(110, 108, 37, 1, '2023-12-18 19:03:39'),
(111, 101, 35, 2, '2023-12-18 19:03:39'),
(112, 110, 0.24, 0.25, '2023-12-18 19:03:39'),
(113, 105, 45, 3, '2023-12-18 19:03:39'),
(114, 203, 0.33, 100, '2023-12-18 19:03:39'),
(115, 109, 0.08, 100, '2023-12-18 19:03:39'),
(116, 103, 0.065, 100, '2023-12-18 19:03:39'),
(117, 45, 139, 0.5, '2023-12-18 19:03:39'),
(118, 48, 65, 2, '2023-12-18 19:03:39'),
(119, 204, 240, 1, '2023-12-18 19:03:39'),
(120, 205, 6, 30, '2023-12-18 19:03:39'),
(121, 206, 160, 1, '2023-12-18 19:03:39'),
(122, 208, 260, 1, '2023-12-18 19:03:39'),
(123, 209, 68, 2, '2023-12-18 19:03:39'),
(124, 160, 88.5, 0.5, '2023-12-18 19:03:39'),
(125, 152, 47, 0.5, '2023-12-18 19:03:39'),
(126, 159, 149, 0.5, '2023-12-18 19:03:39'),
(127, 210, 0.058, 300, '2023-12-18 19:03:39'),
(128, 211, 0.15, 300, '2023-12-18 19:03:39'),
(129, 212, 0.14, 300, '2023-12-18 19:03:39'),
(130, 184, 32, 6, '2023-12-18 19:03:39'),
(131, 34, 0.17, 0.2, '2023-12-18 19:03:39'),
(132, 119, 20, 1, '2023-12-18 19:03:39'),
(133, 193, 65, 0.5, '2023-12-18 19:03:39'),
(134, 215, 130, 1, '2023-12-18 19:03:39'),
(135, 216, 105, 1, '2023-12-18 19:03:39'),
(136, 217, 120, 1, '2023-12-18 19:03:39'),
(137, 40, 115, 1, '2023-12-18 19:03:39'),
(138, 218, 79, 2, '2023-12-18 19:03:39'),
(139, 219, 0.078, 500, '2023-12-18 19:03:39'),
(140, 113, 72.2, 0.5, '2023-12-18 19:03:39'),
(141, 112, 58, 0.5, '2023-12-18 19:03:39'),
(142, 116, 79, 0.5, '2023-12-18 19:03:39'),
(143, 222, 160, 1, '2023-12-18 19:03:39'),
(144, 221, 0.042, 500, '2023-12-18 19:03:39'),
(145, 121, 50, 1, '2023-12-18 19:03:39'),
(146, 223, 50, 1, '2023-12-18 19:03:39'),
(147, 124, 50, 1, '2023-12-18 19:03:39'),
(148, 15, 0.05, 0.5, '2023-12-18 19:03:39'),
(149, 25, 0.013, 0.3, '2023-12-18 19:03:39'),
(150, 167, 330, 0.2, '2023-12-18 19:03:39'),
(151, 225, 0.56, 500, '2023-12-18 19:03:39'),
(152, 226, 0.3, 500, '2023-12-18 19:03:39'),
(153, 227, 85, 2, '2023-12-18 19:03:39'),
(154, 53, 175, 1, '2023-12-18 19:03:39'),
(155, 72, 27.2, 0.5, '2023-12-18 19:03:39'),
(156, 20, 0.14, 0.001, '2023-12-18 19:03:39'),
(157, 46, 179, 2, '2023-12-18 19:03:39'),
(158, 224, 0.07, 250, '2023-12-18 19:03:39'),
(159, 34, 0.17, 0.3, '2023-12-18 19:03:39'),
(160, 170, 179, 0.5, '2023-12-18 19:03:39'),
(161, 47, 192, 0.5, '2023-12-18 19:03:39'),
(162, 244, 112, 1, '2023-12-18 19:03:39'),
(163, 245, 105, 1, '2023-12-18 19:03:39'),
(164, 246, 109, 1, '2023-12-18 19:03:39'),
(165, 247, 140, 1, '2023-12-18 19:03:39'),
(166, 242, 87, 1, '2023-12-18 19:03:39'),
(167, 228, 89, 1, '2023-12-18 19:03:39'),
(168, 230, 42, 1, '2023-12-18 19:03:39'),
(169, 229, 39, 1, '2023-12-18 19:03:39'),
(170, 231, 28, 1, '2023-12-18 19:03:39'),
(171, 232, 36, 1, '2023-12-18 19:03:39'),
(172, 233, 36, 1, '2023-12-18 19:03:39'),
(173, 234, 28, 1, '2023-12-18 19:03:39'),
(174, 235, 30, 1, '2023-12-18 19:03:39'),
(175, 236, 50, 1, '2023-12-18 19:03:39'),
(176, 54, 126, 1, '2023-12-18 19:03:39'),
(177, 56, 63, 1, '2023-12-18 19:03:39'),
(178, 57, 85, 1, '2023-12-18 19:03:39'),
(179, 59, 80, 1, '2023-12-18 19:03:39'),
(180, 61, 80, 1, '2023-12-18 19:03:39'),
(181, 243, 115, 1, '2023-12-18 19:03:39'),
(182, 248, 120, 1, '2023-12-18 19:03:39'),
(183, 237, 149, 1, '2023-12-18 19:03:39'),
(184, 7, 0.051, 500, '2023-12-18 19:03:39'),
(185, 8, 0.09, 500, '2023-12-18 19:03:39'),
(186, 122, 70, 1, '2023-12-18 19:03:39'),
(187, 239, 130, 2, '2023-12-18 19:03:39'),
(188, 240, 180, 2, '2023-12-18 19:03:39'),
(189, 241, 85, 2, '2023-12-18 19:03:39'),
(190, 238, 115, 2, '2023-12-18 19:03:39'),
(191, 5, 0.176, 100, '2023-12-18 19:03:39'),
(192, 2, 0.09, 50, '2023-12-18 19:03:39'),
(193, 3, 0.045, 50, '2023-12-18 19:03:39'),
(194, 15, 0.05, 0.01, '2023-12-18 19:03:39'),
(195, 20, 0.14, 0.005, '2023-12-18 19:03:39'),
(196, 183, 115, 2, '2023-12-18 19:03:39'),
(197, 181, 4.3, 30, '2023-12-18 19:03:39'),
(198, 182, 55, 2, '2023-12-18 19:03:39'),
(199, 47, 192, 0.5, '2023-12-18 19:03:39'),
(200, 184, 32, 6, '2023-12-18 19:03:39'),
(201, 34, 0.17, 0.2, '2023-12-18 19:03:39'),
(202, 75, 0.65, 100, '2023-12-19 11:21:09'),
(203, 56, 63, 1, '2023-12-21 23:27:56'),
(204, 86, 20, 2, '2023-12-24 05:29:59'),
(205, 5, 0.176, 100, '2023-12-24 05:35:16'),
(206, 2, 0.09, 50, '2023-12-24 05:35:16'),
(207, 3, 0.045, 50, '2023-12-24 05:35:16'),
(208, 15, 0.05, 0.01, '2023-12-24 05:35:16'),
(209, 20, 0.14, 0.005, '2023-12-24 05:35:16'),
(210, 183, 115, 2, '2023-12-24 05:35:16'),
(211, 44, 149, 1, '2023-12-24 05:35:45'),
(212, 86, 20, 2, '2023-12-24 14:48:03'),
(213, 86, 20, 2, '2023-12-24 15:12:07'),
(214, 213, 129, 1, '2023-12-24 15:17:22');

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
(4, 1, 0.04, 21500, 21500, '2023-12-18 15:00:00'),
(5, 2, 0.09, 15000, 14800, '2023-12-18 15:00:00'),
(6, 3, 0.045, 12000, 11780, '2023-12-18 15:00:00'),
(7, 4, 0.06, 22500, 22500, '2023-12-18 15:00:00'),
(8, 5, 0.176, 12000, 11600, '2023-12-18 15:00:00'),
(9, 6, 0.0156, 30000, 30000, '2023-12-18 15:00:00'),
(10, 7, 0.051, 10000, 9500, '2023-12-18 15:00:00'),
(11, 8, 0.09, 6600, 6100, '2023-12-18 15:00:00'),
(12, 9, 0.085, 2000, 2000, '2023-12-18 15:00:00'),
(13, 185, 155, 10.6, 8.6, '2023-12-18 15:00:00'),
(14, 183, 115, 10, 0, '2023-12-18 15:00:00'),
(15, 183, 115, 10, 10, '2023-12-18 15:00:00'),
(17, 10, 0.12, 9000, 9000, '2023-12-18 15:00:00'),
(18, 182, 55, 5.4, 1.4, '2023-12-18 15:00:00'),
(19, 121, 50, 4.5, 3.5, '2023-12-18 15:00:00'),
(20, 104, 45, 8.4, 7.9, '2023-12-18 15:00:00'),
(22, 11, 0.25, 12, 11.9, '2023-12-18 15:00:00'),
(23, 12, 0.15, 4.8, 4.8, '2023-12-18 15:00:00'),
(24, 13, 0.28, 0.96, 0.96, '2023-12-18 15:00:00'),
(25, 14, 0.035, 12, 12, '2023-12-18 15:00:00'),
(26, 119, 20, 9.5, 8.5, '2023-12-18 15:00:00'),
(27, 15, 0.05, 12, 7.65, '2023-12-18 15:00:00'),
(28, 17, 0.07, 12000, 12000, '2023-12-18 15:00:00'),
(30, 20, 0.14, 12, 11.579, '2023-12-18 15:00:00'),
(31, 21, 0.52, 4500, 4490, '2023-12-18 15:00:00'),
(32, 22, 0.035, 12000, 10500, '2023-12-18 15:00:00'),
(33, 23, 0.38, 3, 3, '2023-12-18 15:00:00'),
(34, 24, 0.06, 6, 4.4, '2023-12-18 15:00:00'),
(35, 25, 0.013, 6, 5.1, '2023-12-18 15:00:00'),
(37, 26, 5.83, 60, 60, '2023-12-18 15:00:00'),
(38, 27, 0.73, 3, 3, '2023-12-18 15:00:00'),
(39, 28, 0.6, 6, 6, '2023-12-18 15:00:00'),
(40, 29, 0.3, 6, 6, '2023-12-18 15:00:00'),
(41, 187, 120, 10, 7, '2023-12-18 15:00:00'),
(42, 239, 130, 10, 8, '2023-12-18 15:00:00'),
(44, 140, 50, 1, 0, '2023-12-18 15:00:00'),
(45, 34, 0.17, 6, 5.3, '2023-12-18 15:00:00'),
(46, 136, 60, 2, 1, '2023-12-18 15:00:00'),
(47, 36, 0.04, 18000, 16600, '2023-12-18 15:00:00'),
(48, 39, 0.183, 6000, 6000, '2023-12-18 15:00:00'),
(49, 42, 0.1, 12000, 12000, '2023-12-18 15:00:00'),
(50, 37, 290, 6, 5, '2023-12-18 15:00:00'),
(51, 51, 0.046, 6000, 5500, '2023-12-18 15:00:00'),
(52, 19, 79, 2, 1, '2023-12-18 15:00:00'),
(53, 54, 126, 12, 10, '2023-12-18 15:00:00'),
(54, 56, 63, 12, 10, '2023-12-18 15:00:00'),
(55, 57, 85, 12, 10, '2023-12-18 15:00:00'),
(56, 59, 80, 12, 11, '2023-12-18 15:00:00'),
(57, 31, 50, 2, 1, '2023-12-18 15:00:00'),
(58, 61, 80, 12, 10, '2023-12-18 15:00:00'),
(59, 32, 149, 2, 1, '2023-12-18 15:00:00'),
(60, 62, 0.36, 100, 100, '2023-12-18 15:00:00'),
(61, 33, 89, 2, 1, '2023-12-18 15:00:00'),
(62, 63, 0.16, 500, 500, '2023-12-18 15:00:00'),
(63, 64, 0.65, 400, 400, '2023-12-18 15:00:00'),
(64, 66, 160, 3, 3, '2023-12-18 15:00:00'),
(65, 67, 0.055, 4.8, 4.8, '2023-12-18 15:00:00'),
(66, 35, 120, 2, 2, '2023-12-18 15:00:00'),
(67, 68, 24.33, 12, 12, '2023-12-18 15:00:00'),
(68, 69, 73, 6, 6, '2023-12-18 15:00:00'),
(69, 38, 89.5, 2, 0, '2023-12-18 15:00:00'),
(70, 70, 4, 24, 24, '2023-12-18 15:00:00'),
(71, 40, 115, 2, 1, '2023-12-18 15:00:00'),
(72, 71, 11.7, 12, 12, '2023-12-18 15:00:00'),
(73, 41, 194, 2, 2, '2023-12-18 15:00:00'),
(75, 75, 0.65, 1000, 800, '2023-12-18 15:00:00'),
(76, 77, 0.11, 500, 500, '2023-12-18 15:00:00'),
(77, 44, 149, 6, 4, '2023-12-18 15:00:00'),
(78, 79, 0.15, 12000, 11900, '2023-12-18 15:00:00'),
(79, 47, 192, 2, 1, '2023-12-18 15:00:00'),
(80, 193, 65, 1, 0.5, '2023-12-18 15:00:00'),
(81, 49, 225, 2, 2, '2023-12-18 15:00:00'),
(82, 153, 85, 2, 0.1, '2023-12-18 15:00:00'),
(83, 139, 25, 3.2, 2.2, '2023-12-18 15:00:00'),
(86, 92, 46, 2, 0, '2023-12-18 15:00:00'),
(87, 135, 55, 1, 0, '2023-12-18 15:00:00'),
(88, 81, 0.039, 2000, 1988, '2023-12-18 15:00:00'),
(89, 83, 0.161, 6000, 5950, '2023-12-18 15:00:00'),
(90, 43, 142, 6, 4, '2023-12-18 15:00:00'),
(91, 96, 0.133, 6000, 6000, '2023-12-18 15:00:00'),
(92, 46, 179, 2, 0, '2023-12-18 15:00:00'),
(93, 45, 139, 1, 0.5, '2023-12-18 15:00:00'),
(94, 48, 65, 2, 0, '2023-12-18 15:00:00'),
(96, 53, 175, 1, 0, '2023-12-18 15:00:00'),
(97, 55, 115, 2, 2, '2023-12-18 15:00:00'),
(98, 58, 179, 2, 1, '2023-12-18 15:00:00'),
(99, 97, 0.112, 2000, 2000, '2023-12-18 15:00:00'),
(100, 98, 0.17, 6000, 6000, '2023-12-18 15:00:00'),
(101, 72, 27.2, 5, 4.5, '2023-12-18 15:00:00'),
(102, 99, 468, 40, 40, '2023-12-18 15:00:00'),
(103, 110, 0.24, 1, 0.75, '2023-12-18 15:00:00'),
(104, 16, 95, 2, 1, '2023-12-18 15:00:00'),
(105, 111, 245, 1, 1, '2023-12-18 15:00:00'),
(106, 115, 4, 20, 20, '2023-12-18 15:00:00'),
(107, 117, 66, 1, 0.5, '2023-12-18 15:00:00'),
(108, 78, 180.37, 1.885, 1.885, '2023-12-18 15:00:00'),
(109, 118, 42, 1, 0, '2023-12-18 15:00:00'),
(110, 120, 50, 1, 0, '2023-12-18 15:00:00'),
(111, 122, 70, 6, 5, '2023-12-18 15:00:00'),
(112, 125, 23, 6, 6, '2023-12-18 15:00:00'),
(113, 80, 46, 5, 5, '2023-12-18 15:00:00'),
(114, 127, 20, 3, 2, '2023-12-18 15:00:00'),
(115, 194, 2.33, 60, 20, '2023-12-18 15:00:00'),
(116, 126, 45, 3, 3, '2023-12-18 15:00:00'),
(117, 195, 185, 1, 0, '2023-12-18 15:00:00'),
(118, 196, 299, 1, 0, '2023-12-18 15:00:00'),
(119, 197, 264, 1, 0, '2023-12-18 15:00:00'),
(120, 198, 231, 1, 0, '2023-12-18 15:00:00'),
(121, 199, 49, 1, 0, '2023-12-18 15:00:00'),
(122, 200, 49, 1, 0, '2023-12-18 15:00:00'),
(123, 128, 48, 288, 288, '2023-12-18 15:00:00'),
(124, 201, 20, 3.5, 3.5, '2023-12-18 15:00:00'),
(125, 202, 0.087, 1, 0, '2023-12-18 15:00:00'),
(126, 129, 50, 288, 288, '2023-12-18 15:00:00'),
(127, 203, 0.33, 100, 0, '2023-12-18 15:00:00'),
(128, 204, 240, 1, 0, '2023-12-18 15:00:00'),
(130, 130, 55, 288, 288, '2023-12-18 15:00:00'),
(131, 206, 160, 1, 0, '2023-12-18 15:00:00'),
(132, 208, 260, 1, 0, '2023-12-18 15:00:00'),
(133, 215, 130, 1, 0, '2023-12-18 15:00:00'),
(134, 216, 105, 1, 0, '2023-12-18 15:00:00'),
(135, 132, 7.8, 480, 480, '2023-12-18 15:00:00'),
(137, 222, 160, 1, 0, '2023-12-18 15:00:00'),
(138, 60, 259, 2, 2, '2023-12-18 15:00:00'),
(139, 65, 240, 12, 12, '2023-12-18 15:00:00'),
(140, 224, 0.07, 2800, 2550, '2023-12-18 15:00:00'),
(141, 74, 669, 1, 1, '2023-12-18 15:00:00'),
(142, 76, 159, 1, 1, '2023-12-18 15:00:00'),
(143, 225, 0.56, 700, 200, '2023-12-18 15:00:00'),
(144, 226, 0.3, 1000, 500, '2023-12-18 15:00:00'),
(145, 73, 50, 12, 12, '2023-12-18 15:00:00'),
(146, 227, 85, 2, 0, '2023-12-18 15:00:00'),
(147, 84, 115, 2, 0, '2023-12-18 15:00:00'),
(149, 82, 24.5, 6, 6, '2023-12-18 15:00:00'),
(150, 229, 39, 1, 0, '2023-12-18 15:00:00'),
(151, 82, 24.5, 12, 12, '2023-12-18 15:00:00'),
(153, 230, 42, 1, 0, '2023-12-18 15:00:00'),
(154, 231, 28, 1, 0, '2023-12-18 15:00:00'),
(155, 232, 36, 1, 0, '2023-12-18 15:00:00'),
(156, 86, 85, 2, 0, '2023-12-18 15:00:00'),
(157, 233, 36, 1, 0, '2023-12-18 15:00:00'),
(158, 234, 28, 1, 0, '2023-12-18 15:00:00'),
(159, 235, 30, 1, 0, '2023-12-18 15:00:00'),
(161, 236, 50, 1, 0, '2023-12-18 15:00:00'),
(162, 87, 87.5, 4, 2, '2023-12-18 15:00:00'),
(163, 237, 149, 2, 1, '2023-12-18 15:00:00'),
(164, 242, 87, 1, 0, '2023-12-18 15:00:00'),
(165, 243, 115, 1, 0, '2023-12-18 15:00:00'),
(166, 244, 112, 1, 0, '2023-12-18 15:00:00'),
(167, 217, 120, 2, 1, '2023-12-18 15:00:00'),
(168, 245, 105, 1, 0, '2023-12-18 15:00:00'),
(169, 246, 109, 2, 1, '2023-12-18 15:00:00'),
(170, 247, 140, 2, 1, '2023-12-18 15:00:00'),
(171, 248, 120, 1, 0, '2023-12-18 15:00:00'),
(172, 249, 60, 2, 1, '2023-12-18 15:00:00'),
(174, 251, 0.001, 20000, 15200, '2023-12-18 15:00:00'),
(175, 88, 24, 2, 2, '2023-12-18 15:00:00'),
(176, 89, 0.558, 500, 500, '2023-12-18 15:00:00'),
(177, 91, 394, 2, 2, '2023-12-18 15:00:00'),
(178, 93, 97, 2, 2, '2023-12-18 15:00:00'),
(179, 94, 57, 2, 1, '2023-12-18 15:00:00'),
(180, 95, 69, 2, 2, '2023-12-18 15:00:00'),
(181, 100, 30, 1, 0, '2023-12-18 15:00:00'),
(183, 102, 77, 1, 1, '2023-12-18 15:00:00'),
(186, 105, 45, 3, 0, '2023-12-18 15:00:00'),
(187, 103, 0.065, 1000, 900, '2023-12-18 15:00:00'),
(188, 221, 0.042, 1000, 500, '2023-12-18 15:00:00'),
(189, 205, 6, 30, 0, '2023-12-18 15:00:00'),
(190, 155, 163, 3, 1.7, '2023-12-18 15:00:00'),
(191, 151, 0.085, 2, 1.9, '2023-12-18 15:00:00'),
(192, 146, 0.116, 2, 1.9, '2023-12-18 15:00:00'),
(193, 250, 95, 12, 10.5, '2023-12-18 15:00:00'),
(194, 116, 79, 1, 0.5, '2023-12-18 15:00:00'),
(195, 123, 63, 4, 4, '2023-12-18 15:00:00'),
(196, 154, 65, 5, 3.8, '2023-12-18 15:00:00'),
(197, 156, 45, 3, 2.5, '2023-12-18 15:00:00'),
(199, 145, 30, 2, 1.5, '2023-12-18 15:00:00'),
(200, 181, 4.3, 150, 60, '2023-12-18 15:00:00'),
(201, 131, 18.5, 3, 0, '2023-12-18 15:00:00'),
(202, 180, 150, 4, 2, '2023-12-18 15:00:00'),
(203, 188, 79, 1, 0, '2023-12-18 15:00:00'),
(204, 189, 89, 1, 0, '2023-12-18 15:00:00'),
(206, 173, 140, 1, 0, '2023-12-18 15:00:00'),
(207, 190, 105, 1, 0, '2023-12-18 15:00:00'),
(208, 175, 9.5, 20, 12, '2023-12-18 15:00:00'),
(209, 169, 129, 1, 0, '2023-12-18 15:00:00'),
(210, 213, 129, 1, 0, '2023-12-18 15:00:00'),
(211, 214, 155, 2, 0, '2023-12-18 15:00:00'),
(212, 133, 175, 2, 0, '2023-12-18 15:00:00'),
(213, 191, 30, 2, 0, '2023-12-18 15:00:00'),
(214, 134, 39, 2, 0, '2023-12-18 15:00:00'),
(215, 142, 50, 1, 0, '2023-12-18 15:00:00'),
(216, 162, 69, 1, 0, '2023-12-18 15:00:00'),
(217, 192, 62, 0.5, 0, '2023-12-18 15:00:00'),
(218, 137, 180, 0.5, 0, '2023-12-18 15:00:00'),
(219, 141, 116, 2, 0, '2023-12-18 15:00:00'),
(221, 138, 125, 0.5, 0, '2023-12-18 15:00:00'),
(222, 143, 65, 1, 0, '2023-12-18 15:00:00'),
(223, 30, 828, 6, 0, '2023-12-18 15:00:00'),
(224, 178, 50, 168, 156, '2023-12-18 15:00:00'),
(225, 179, 9.8, 24, 18, '2023-12-18 15:00:00'),
(226, 18, 0.35, 1, 0, '2023-12-18 15:00:00'),
(227, 107, 46, 3, 0, '2023-12-18 15:00:00'),
(228, 108, 37, 1, 0, '2023-12-18 15:00:00'),
(229, 101, 35, 2, 0, '2023-12-18 15:00:00'),
(230, 109, 0.08, 500, 400, '2023-12-18 15:00:00'),
(231, 209, 68, 2, 0, '2023-12-18 15:00:00'),
(234, 160, 88.5, 0.5, 0, '2023-12-18 15:00:00'),
(235, 152, 47, 0.5, 0, '2023-12-18 15:00:00'),
(236, 159, 149, 0.5, 0, '2023-12-18 15:00:00'),
(237, 210, 0.058, 500, 200, '2023-12-18 15:00:00'),
(238, 211, 0.15, 500, 200, '2023-12-18 15:00:00'),
(239, 212, 0.14, 500, 200, '2023-12-18 15:00:00'),
(240, 184, 32, 12, 0, '2023-12-18 15:00:00'),
(241, 218, 79, 2, 0, '2023-12-18 15:00:00'),
(242, 219, 0.078, 500, 0, '2023-12-18 15:00:00'),
(243, 113, 72.2, 0.5, 0, '2023-12-18 15:00:00'),
(244, 112, 58, 0.5, 0, '2023-12-18 15:00:00'),
(245, 223, 50, 5, 4, '2023-12-18 15:00:00'),
(246, 124, 50, 5, 4, '2023-12-18 15:00:00'),
(247, 167, 330, 0.5, 0.3, '2023-12-18 15:00:00'),
(248, 170, 179, 6, 5.5, '2023-12-18 15:00:00'),
(249, 228, 89, 1, 0, '2023-12-18 15:00:00'),
(250, 240, 180, 2, 0, '2023-12-18 15:00:00'),
(251, 241, 85, 2, 0, '2023-12-18 15:00:00'),
(252, 238, 115, 2, 0, '2023-12-18 15:00:00'),
(253, 86, 20, 85, 79, '2023-12-24 04:03:02'),
(255, 213, 129, 20, 19, '2023-12-24 15:16:41');

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
(1, 'Dolly Fish', 'ปลาดอลลี่', 'jpg'),
(2, 'Tender Marinated Pork', 'หมูหมักน้ำมันงา', 'jpg'),
(3, 'Seafood Sauce', 'น้ำจิ้มซีฟูด', 'jpg'),
(4, 'Pan-fried Pork Sauce(Child)', 'น้ำจิ้มหมูกระทะ(เด็ก)', 'jpg'),
(5, 'Suki Sauce', 'น้ำจิ้มสุกี้', 'jpg'),
(6, 'Pan-fried Pork Sauce(Adult)', 'น้ำจิ้มหมูกระทะ(ผู้ใหญ่)', 'jpg'),
(7, 'Chopstick', 'ตะเกียบ', 'jpg'),
(8, 'Garlic', 'กระเทียม', 'jpg'),
(9, 'Chili', 'พริก', 'jpg'),
(10, 'Egg', 'ไข่ไก่', 'jpg'),
(11, 'Water Spinach', 'ผักบุ้ง', 'jpg'),
(12, 'Celery', 'คื่นช่าย', 'jpg'),
(13, 'Spring onion', 'ต้นหอม', 'jpg'),
(14, 'Pork Garlic And Black Pepper ', 'หมูกระเทียมพริกไทย', 'jpg'),
(15, 'Lard', 'มันหมู', 'jpg'),
(16, 'Bouncy Pork', 'หมูเด้ง', 'jpg'),
(17, 'BBQ pork with spicy sauce', 'หมูหม่าล่า', 'jpg'),
(18, 'Sliced Pork Neck ', 'สันคอหมูสไลด์', 'jpg'),
(19, 'Tender Beef', 'เนื้อนุ่ม', 'jpg'),
(20, 'Chicken Garlic And Black Pepper', 'ไก่กระเทียมพริกไทย', 'jpg'),
(21, 'Pork Belly Marinated in Sesame oil', 'หมูสามชั้นหมักน้ำมันงา', 'jpg'),
(22, 'Squid Pineapple Cut', 'หมึกบั้งทรง', 'jpg'),
(23, 'Squid Ring ', 'หมึกวง', 'jpg'),
(24, 'Cut Tentacled Squid', 'หนวดหมึกตัด', 'jpg'),
(25, 'Shrimp', 'กุ้ง', 'jpg'),
(26, 'Squid', 'หมึก', 'jpg'),
(27, 'Cheese Buns', 'ชีสบัน', 'jpg'),
(28, 'Pork Meatball', 'ลูกชิ้นหมู', 'jpg'),
(29, 'Rugby Fish Meatball', 'ลูกชิ้นปลารักบี้', 'jpg'),
(30, 'Ham', 'แฮม', 'jpg'),
(31, 'Angry Birds Fish Cake', 'ลูกชิ้นปลา Angry Birds', 'jpg'),
(32, 'Egg Tofu', 'เต้าหู้ไข่', 'jpg'),
(33, 'Crab Stick Salad Roll', 'สลัดโรลปูอัด', 'jpg'),
(34, 'Crab Stick', 'ปูอัด', 'jpg'),
(35, 'Sausage', 'ไส้กรอก', 'jpg'),
(37, 'Sliced Squid', 'หมึกแผ่น', 'jpg'),
(39, 'Crispy Squid', 'หมึกกรอบ', 'jpg'),
(40, 'Cow Offal', 'เครื่องในวัว (ลำไส้วัว)', 'jpg'),
(41, 'Pork Liver', 'ตับหมู', 'jpg'),
(42, 'Chinese Cabbage', 'ผักกาดขาว', 'jpg'),
(43, 'Lettuce', 'ผักกาดหอม', 'jpg'),
(44, 'Bok Choy ', 'กวางตุ้ง', 'jpg'),
(45, 'Cabbage', 'กะหล่ำปลี', 'jpg'),
(46, 'Corn', 'ข้าวโพด', 'jpg'),
(47, 'Broccoli', 'บรอกโคลี', 'jpg'),
(48, 'Pumpkin', 'ฟักทอง', 'jpg'),
(49, 'Carrot', 'แครอท', 'jpg'),
(50, 'Sunflower Sprouts', 'ต้นอ่อนทานตะวัน', 'jpg'),
(51, 'Wood Ear Mushroom', 'เห็ดหูหนูขาว', 'jpg'),
(52, 'Baby Corn', 'ข้าวโพดอ่อน', 'jpg'),
(53, 'Radish', 'หัวไซเท้า', 'jpg'),
(54, 'Eryngii Mushroom', 'เห็ดออรินจิ', 'jpg'),
(55, 'White Shimeji Mushroom', 'เห็ดชิเมจิขาว (เห็ดหลินขาว)', 'jpg'),
(56, 'Golden Needle Mushroom', 'เห็ดเข็มทอง', 'jpg'),
(57, 'Corn Pellets', 'ข้าวโพดเม็ด', 'jpg'),
(58, 'Seaweed', 'สาหร่าย', 'jpg'),
(59, 'Yumyum', 'ยำยำ', 'jpg'),
(60, 'Vermicelli', 'วุ้นเส้น', 'jpg'),
(61, 'Kelp Noodle', 'เส้นแก้ว', 'jpg'),
(62, 'Diced Bread', 'ขนมปังหันเต๋า', 'jpg'),
(63, 'Sugar', 'น้ำตาล', 'jpg'),
(64, 'Margarine', 'มาการีน (เนยเทียม)', 'jpg'),
(65, 'Chocolate spread', 'ซ็อกโกแลตสเปรด', 'jpg'),
(66, 'Pineapple spread', 'สเปรดสัปปะรด', 'jpg'),
(67, 'Strawberry spread', 'สเปรดสตรอเบอร์รี่', 'jpg'),
(68, 'Orange spread', 'สเปรดส้ม', 'jpg'),
(69, 'Mentos', 'เมนทอส', 'jpg'),
(70, 'Jelly Candy', 'เยลลี่ลูกอม', 'jpg'),
(71, 'Marshmallow', 'มาร์ชเมลโล่', 'jpg'),
(72, 'Bread Slice', 'ขนมปังแผ่น', 'jpg'),
(73, 'Fruit Salad', 'ฟรุตสลัด', 'jpg'),
(74, 'Ice', 'น้ำแข็ง', 'jpg'),
(75, 'Hale\'s Blue Boy Red Syrup', 'น้ำหวานเฮลบลูบอยสีแดง(กลิ่นสละ)', 'jpg'),
(76, 'Hale\'s Blue Boy Green Syrup', 'น้ำหวานเฮลบลูบอยสีเขียว(กลิ่นครีมโซดา)', 'jpeg'),
(77, 'Blue Hawaii Syrup', 'น้ำหวานบลูฮาวาย', 'png'),
(78, 'Dice Taro', 'เผือกเต๋า', 'jpg'),
(79, 'Lod Chong', 'ลอดช่อง', 'jpg'),
(80, 'Syrup', 'น้ำเชื่อม', 'jpg'),
(81, 'Cantaloupe', 'แคนตาลูป\r\n', 'jpg'),
(82, 'Crispy Tubtim', 'ทับทิมกรอบ', 'jpg'),
(83, 'Slim', 'ซาหริ่ม', 'jpg'),
(84, 'Grass Jelly', 'เฉาก๊วย', 'jpg'),
(85, 'Cornflakes', 'คอนเฟลก', 'jpg'),
(86, 'Thong Yod', 'ทองหยอด', 'jpg'),
(87, 'Basil Seeds', 'เม็ดแมงลัก', 'jpg'),
(88, 'Lokchid', 'ลูกชิด', 'jpg'),
(89, 'Palm', 'ลูกตาล', 'jpg'),
(90, 'Raisins', 'ลูกเกด\r\n', 'jpg'),
(91, 'Jujube', 'พุทราจีน', 'jpg'),
(92, 'Cream puffs', 'ครีมพัฟ', 'jpg'),
(93, 'Tago', 'ตะโก้', 'jpg'),
(94, 'Coconut Agar', 'วุ้นมะพร้าว (ใช้ผงวุ้นที่มาจากสาหร่ายทะเลทำ)', 'jpg'),
(95, 'Brownies', 'บราวนี่', 'jpg'),
(96, 'Boiled Quail Eggs', 'ไข่นกกระทาต้ม', 'jpg'),
(97, 'Tomato', 'มะเขือเทศ', 'jpg'),
(98, 'Rings Onion', 'หอมวง', 'jpg'),
(99, 'Bell Pepper', 'พริกหวาน', 'jpg'),
(100, 'Shredded Salad', 'ผักสลัดหันฝอย', 'jpg'),
(103, 'Jade Noodles', 'บะหมี่หยก', 'jpg'),
(104, 'Watermelon', 'แตงโม', 'jpg'),
(105, 'Wood Ear Mushroom', 'เห็ดหูหนู', 'jpg'),
(107, 'Crab Stick Seaweed Roll', 'ปูอัดห่อสาหร่าย', 'jpg'),
(108, 'Fish Tofu', 'เต้าหู้ปลา\r\n', 'jpg'),
(109, 'Jelly Fish', 'แมงกะพรุน\r\n', 'jpg'),
(110, 'Sbai Nang', 'สไบนาง (ผ้าขี้ริ้ววัว)', 'jpg'),
(111, 'Shang Ji', 'เซี่ยงจี้ (ไตหมู)', 'jpg'),
(112, 'Pickled Small Mango', 'มะม่วงเบาแช่อิ่ม', 'jpg'),
(113, 'Pickled Tamarind', 'มะขามแช่อิ่ม\r\n', 'jpg'),
(114, 'Pickled Mango', 'มะม่วงแช่อิ่ม\r\n', 'jpg'),
(115, 'Pickled Santol', 'กระท้อนแช่อิ่ม', 'jpg'),
(116, 'Agar', 'วุ้นใสกรอบ (ใช้ผงวุ้นที่มาจากสาหร่ายทะเลทำ)', 'jpg'),
(117, 'Coconut Jelly', 'วุ้นมะพร้าวในน้ำเชื่อม', 'jpg'),
(118, 'Dragon Fruit', 'แก้วมังกร', 'jpg'),
(119, 'Mango soaked in plums', 'มะม่วงแช่บ๊วย\r\n', 'jpg'),
(120, 'Guava soaked in plums', 'ฝรั่งแช่บ๊วย', 'jpg'),
(121, 'Fruit Dipping Powder', 'พริกเกลือ (ที่กินคู่กับผลไม้)', 'jpg'),
(122, 'Coconut milk syrup', 'น้ำกะทิราดขนมหวาน', 'jpg'),
(123, 'Cream Salad Dressing', 'น้ำสลัดครีม', 'jpg'),
(124, 'Steamed bun', 'ซาลาเปา', 'jpg'),
(125, 'Dim sum', 'ติ่มซำ (ex. ขนมจีบหมู, กุ้ง)', 'jpg'),
(126, 'Japan cooked rice', 'ข้าวญี่ปุ่นหุงสุก', 'jpg'),
(127, 'Seaweed Salad', 'ยำสาหร่าย', 'jpg'),
(128, 'Sour soy sauce', 'ซีอิ้วเปรี้ยว (จิ๊กโฉ่ว)', 'jpg'),
(129, 'Fried garlic', 'กระเทียมเจียว', 'jpg'),
(130, 'Shrimp soaked in fish sauce', 'กุ้งแช่น้ำปลา\r\n', 'jpg'),
(131, 'Cut Crab stick', 'ปูอัดหั่น', 'jpg'),
(132, 'Korean fish sauce pickled shrimp', 'กุ้งดองน้ำปลาเกาหลี', 'jpg'),
(133, 'Fried Cheese Ball', 'ชีสบอลทอด', 'jpg'),
(134, 'Fried spring rolls', 'ปอเปี๊ยะทอด\r\n', 'jpg'),
(135, 'Fried fermented pork', 'แหนมหมูทอด', 'jpg'),
(136, 'Nugget', 'นักเก็ต', 'jpg'),
(137, 'Shrimp wrapped in sugarcane', 'กุ้งพันอ้อย', 'jpg'),
(138, 'Sweet potato in syrup ', 'มันเทศไทยเชื่อม', 'jpg'),
(139, 'Dried salted plums', 'บ๊วยเค็มแห้ง', 'jpg'),
(140, 'Tulee choco ball', 'ทิวลี่ซ็อกโกบอล', 'jpg'),
(141, 'Marshmallow I', NULL, 'jpg'),
(142, 'Marshmallow II', NULL, 'jpg'),
(143, 'Marshmallow III', NULL, 'jpg'),
(144, 'Marshmallow IV', NULL, 'jpg'),
(145, 'Choco Candies', 'M&M ', 'jpg'),
(146, 'Jelly Candy II', NULL, 'jpg'),
(148, 'Green Fruit Salad ', 'ฟรุตสลัดเขียว', 'jpg'),
(149, 'Mixed Syrups', 'รวมน้ำเชื่อม', 'jpg'),
(150, 'Grill Sauce', 'ซอสสำหรับย่าง', 'jpg'),
(151, 'Margarine for grill', 'มาการีนสำหรับย่าง', 'jpg'),
(152, 'FranceFried', 'มันฝรั่งแท่งทอด\r\n', 'jpg'),
(153, 'Mixed Sauces', 'รวมซอส', 'jpg'),
(154, 'Seafood Shell', 'หอยซีฟู๊ด', 'jpg'),
(155, 'Big Shrimp for grill', 'กุ้งใหญ่สำหรับย่าง', 'jpg'),
(156, 'Spotted Babylon (Sweet Shell)', 'หอยหวาน (หอยตุ๊กแก, หอยเทพรถ)', 'jpg'),
(157, 'Clam', 'หอยกาบ', 'jpg'),
(158, 'Pork BBQ stick', 'บาร์บีคิวหมู\r\n', 'jpg'),
(159, 'Golden Needle Mushroom wrapped with bacon BBQ stick', 'บาร์บีคิวเห็ดเข็มทองพันเบค่อน', 'jpg'),
(160, 'Sausage Spaghetti', 'สปาเก็ตตี้ไส้กรอก', 'jpg'),
(161, 'Pork sausage spicy salad', 'ยำหมูยอ', 'jpg'),
(162, 'Seafood Bucket', 'ทะเลถัง ', 'jpg'),
(163, 'Mussel', 'หอยแมลงภู่', 'jpg'),
(164, 'Fried rice', 'ข้าวผัด', 'jpg');

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
(1, 1, 86, 2),
(2, 8, 153, 1),
(3, 9, 155, 1),
(5, 2, 5, 100),
(6, 2, 2, 50),
(7, 2, 3, 50),
(9, 10, 181, 30),
(10, 11, 131, 3),
(11, 12, 135, 1),
(12, 13, 140, 1),
(13, 2, 15, 0.01),
(15, 14, 79, 50),
(16, 15, 182, 2),
(18, 17, 83, 50),
(20, 2, 20, 0.005),
(22, 7, 75, 100),
(23, 14, 183, 2),
(24, 2, 183, 2),
(25, 16, 33, 1),
(26, 19, 180, 2),
(27, 19, 3, 20),
(28, 18, 43, 2),
(29, 19, 15, 0.01),
(30, 19, 21, 10),
(31, 20, 87, 2),
(32, 20, 79, 50),
(34, 22, 16, 1),
(35, 23, 32, 1),
(36, 24, 19, 1),
(38, 81, 104, 0.5),
(39, 26, 58, 1),
(40, 27, 37, 1),
(44, 61, 179, 6),
(45, 60, 178, 12),
(48, 34, 44, 1),
(49, 62, 127, 1),
(50, 17, 183, 2),
(51, 21, 185, 2),
(52, 21, 5, 100),
(53, 21, 3, 50),
(54, 21, 2, 50),
(57, 21, 15, 0.01),
(58, 21, 20, 0.005),
(59, 25, 187, 3),
(60, 28, 188, 1),
(61, 29, 189, 1),
(62, 30, 173, 1),
(63, 31, 190, 1),
(64, 35, 169, 1),
(65, 32, 175, 8),
(66, 39, 38, 2),
(67, 41, 84, 2),
(68, 42, 133, 2),
(69, 45, 134, 2),
(70, 44, 191, 2),
(71, 43, 156, 0.5),
(72, 47, 136, 1),
(73, 48, 162, 1),
(74, 46, 142, 1),
(75, 49, 139, 1),
(76, 50, 192, 0.5),
(77, 51, 137, 0.5),
(78, 52, 141, 2),
(79, 53, 138, 0.5),
(80, 105, 193, 0.5),
(81, 54, 94, 1),
(82, 55, 31, 1),
(83, 56, 92, 2),
(85, 58, 30, 6),
(86, 59, 194, 40),
(87, 72, 127, 3),
(88, 63, 15, 1),
(89, 64, 18, 1),
(90, 79, 100, 1),
(91, 82, 107, 3),
(92, 83, 108, 1),
(93, 84, 101, 2),
(94, 85, 110, 0.25),
(95, 65, 195, 1),
(96, 66, 196, 1),
(97, 67, 197, 1),
(98, 68, 198, 1),
(99, 69, 199, 1),
(100, 69, 200, 1),
(101, 70, 117, 0.5),
(102, 71, 118, 1),
(103, 73, 120, 1),
(105, 75, 54, 1),
(106, 76, 61, 1),
(107, 77, 57, 1),
(109, 80, 51, 500),
(110, 86, 105, 3),
(111, 78, 202, 1),
(112, 87, 203, 100),
(113, 88, 109, 100),
(114, 89, 103, 100),
(116, 91, 48, 2),
(118, 93, 205, 30),
(121, 96, 209, 2),
(123, 98, 152, 0.5),
(124, 99, 159, 0.5),
(125, 100, 210, 300),
(126, 100, 211, 300),
(127, 100, 212, 300),
(128, 103, 184, 6),
(129, 104, 119, 1),
(131, 57, 143, 1),
(132, 37, 213, 1),
(133, 40, 214, 2),
(134, 107, 215, 1),
(135, 108, 216, 1),
(136, 109, 217, 1),
(137, 110, 40, 1),
(138, 111, 218, 2),
(139, 112, 219, 500),
(140, 113, 113, 0.5),
(141, 114, 112, 0.5),
(142, 115, 116, 0.5),
(144, 117, 221, 500),
(145, 118, 121, 1),
(146, 120, 124, 1),
(147, 119, 223, 1),
(148, 121, 15, 0.5),
(149, 121, 25, 0.3),
(150, 121, 167, 0.2),
(151, 122, 225, 500),
(152, 123, 226, 500),
(156, 126, 72, 0.5),
(157, 126, 20, 0.001),
(158, 128, 224, 250),
(159, 129, 34, 0.3),
(160, 133, 47, 0.5),
(161, 131, 170, 0.5),
(162, 139, 228, 1),
(163, 141, 229, 1),
(164, 140, 230, 1),
(165, 142, 231, 1),
(166, 143, 232, 1),
(167, 144, 233, 1),
(168, 145, 234, 1),
(169, 146, 235, 1),
(170, 148, 236, 1),
(171, 152, 237, 1),
(172, 149, 54, 1),
(173, 149, 56, 1),
(174, 149, 57, 1),
(175, 149, 59, 1),
(176, 149, 61, 1),
(177, 163, 238, 2),
(178, 155, 239, 2),
(179, 156, 240, 2),
(180, 157, 241, 2),
(181, 138, 242, 1),
(182, 150, 243, 1),
(183, 134, 244, 1),
(184, 135, 245, 1),
(185, 136, 246, 1),
(186, 137, 247, 1),
(187, 151, 248, 1),
(188, 33, 249, 1),
(190, 3, 155, 0.3),
(191, 3, 151, 0.1),
(192, 3, 11, 0.1),
(193, 3, 153, 0.1),
(195, 3, 81, 12),
(197, 3, 146, 0.1),
(198, 3, 250, 1.5),
(199, 5, 154, 1.2),
(200, 5, 153, 0.8),
(201, 5, 15, 2.8),
(202, 5, 24, 1.6),
(203, 5, 25, 0.6),
(206, 5, 20, 0.4),
(207, 5, 145, 0.5),
(208, 5, 251, 4800),
(221, 153, 7, 500),
(222, 153, 8, 500),
(224, 153, 122, 1),
(225, 5, 22, 1500),
(227, 5, 36, 1400),
(228, 90, 45, 0.5),
(229, 92, 204, 1),
(230, 94, 206, 1),
(231, 95, 208, 1),
(233, 97, 160, 0.5),
(235, 103, 34, 0.2),
(236, 116, 222, 1),
(237, 124, 227, 2),
(238, 125, 53, 1),
(239, 127, 46, 2),
(241, 4, 14, 1),
(242, 4, 103, 1);

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
(1, 'Vegetable', '#add45c'),
(2, 'Meat', '#ff5733'),
(3, 'Fruit', '#ffc300'),
(4, 'Water', '#00baad'),
(5, 'Condiment', '#900c3f'),
(6, 'Snack', '#3d3d6b'),
(7, 'Seafood', '#00baad'),
(8, 'Noddle', '#ffc300'),
(9, 'Container', '#511849'),
(10, 'Rice', '#FFFFFF'),
(11, 'Raw', '#3d3d6b'),
(12, 'Dessert', '#ff75dd');

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
(1, 'kg'),
(2, 'g'),
(3, 'litre'),
(4, 'ml'),
(5, 'lb'),
(6, 'oz'),
(7, 'Teaspoon'),
(8, 'Tablespoon'),
(9, 'Piece'),
(10, 'Bottle');

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
-- Indexes for table `material_cost`
--
ALTER TABLE `material_cost`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `material_cost`
--
ALTER TABLE `material_cost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `material_leftover`
--
ALTER TABLE `material_leftover`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material_quantity`
--
ALTER TABLE `material_quantity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `menu_material`
--
ALTER TABLE `menu_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
