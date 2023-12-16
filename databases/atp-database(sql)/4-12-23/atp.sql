-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 04, 2023 at 04:21 PM
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
(2, 'Staom', 'Staom', 'Suwijak', 'Tapsukalack', 'Aomsin', 1, '2023-10-25 18:36:35', '2023-10-25 16:37:48'),
(3, 'plume', 'pongsakorn', 'pongsakorn', 'sommapee', 'plume', 0, '2023-10-31 21:53:11', '2023-10-31 20:53:57'),
(4, 'bronystylecrazy', '12345678', 'Sirawit', 'Pratoomsuwan', 'Art', 1, '2023-11-15 00:13:06', '2023-11-14 23:13:50');

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
(1, 1, 'Dolly Fish', 'jpg', '  ()', '2023-11-30 22:02:56');

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
(50, 'Sugar Cane Shrimp', 1, 6, 'jpeg'),
(51, 'syrup', 4, 5, 'png'),
(52, 'Nuggets', 1, 6, 'jpeg'),
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
(85, 'french fries', 1, 6, 'png'),
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
(228, 'Dried salted plums', 1, 3, 'jpg'),
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
(249, 'Crab Stick Salad Roll', 9, 6, 'jpg');

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
(1, 210, 35, 1000, 1000, '2023-11-30 10:31:36'),
(2, 211, 35, 1000, 1000, '2023-11-30 10:32:19'),
(3, 212, 35, 1000, 1000, '2023-11-30 10:32:47'),
(4, 40, 70, 1, 1, '2023-11-30 15:30:36'),
(5, 218, 40, 2, 2, '2023-11-30 15:33:05');

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
(104, 74, 201, 20),
(105, 75, 54, 1),
(106, 76, 61, 1),
(107, 77, 57, 1),
(109, 80, 51, 500),
(110, 86, 105, 3),
(111, 78, 202, 1),
(112, 87, 203, 100),
(113, 88, 109, 100),
(114, 89, 103, 100),
(115, 90, 45, 50),
(116, 91, 48, 2),
(117, 92, 204, 100),
(118, 93, 205, 30),
(119, 94, 206, 30),
(120, 95, 208, 36),
(121, 96, 209, 2),
(122, 97, 150, 1),
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
(143, 116, 222, 30),
(144, 117, 221, 500),
(145, 118, 121, 1),
(146, 120, 124, 1),
(147, 119, 223, 1),
(148, 121, 15, 0.5),
(149, 121, 25, 0.3),
(150, 121, 167, 0.2),
(151, 122, 225, 500),
(152, 123, 226, 500),
(153, 127, 46, 30),
(154, 125, 53, 60),
(155, 124, 227, 20),
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
(188, 33, 249, 1);

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
(3, 'Litre'),
(4, 'ml'),
(5, 'lb'),
(6, 'oz'),
(7, 'Teaspoon'),
(8, 'Tablespoon'),
(9, 'Price'),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `material_leftover`
--
ALTER TABLE `material_leftover`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material_quantity`
--
ALTER TABLE `material_quantity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `menu_material`
--
ALTER TABLE `menu_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

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
