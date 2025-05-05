-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2025 at 08:33 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flyhigh`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `User_id` int(11) NOT NULL,
  `Drone_id` int(11) NOT NULL,
  `Cart_item_id` int(10) NOT NULL,
  `Cart_item_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_id` int(11) NOT NULL,
  `Category_name` varchar(50) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drone`
--

CREATE TABLE `drone` (
  `Drone_id` int(11) NOT NULL,
  `Drone_name` varchar(255) NOT NULL,
  `Drone_description` varchar(255) NOT NULL,
  `Drone_price` double NOT NULL,
  `Drone_quantity` int(10) NOT NULL,
  `Weight_grams` float DEFAULT NULL,
  `Flight_time_minutes` float DEFAULT NULL,
  `Range_meter` float DEFAULT NULL,
  `Camera_quality` varchar(50) DEFAULT NULL,
  `Dimension` varchar(20) DEFAULT NULL,
  `Drone_image` varchar(255) DEFAULT NULL,
  `Category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `Order_id` int(11) NOT NULL,
  `Order_quantity` int(5) NOT NULL,
  `Order_date` date NOT NULL,
  `Total_amount` float NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_id` int(11) NOT NULL,
  `User_name` varchar(50) NOT NULL,
  `User_phone` varchar(15) NOT NULL,
  `Gender` enum('male','female','other') NOT NULL,
  `User_DOB` date NOT NULL,
  `User_email` varchar(50) NOT NULL,
  `User_password` text NOT NULL,
  `User_address` varchar(50) NOT NULL,
  `Role_Name` enum('admin','customer') NOT NULL,
  `User_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_id`, `User_name`, `User_phone`, `Gender`, `User_DOB`, `User_email`, `User_password`, `User_address`, `Role_Name`, `User_image`) VALUES
(3, 'Aakrist', '9800000000', 'male', '2025-04-08', 'a@Thapa.com', 'XFsZmFliwIrZhKR470fWP8kjglftVkDGU/T+cvAoNT9u9NziANLwH1b1V6RleaCBbseA1A==', 'kamalpokhar', 'admin', ''),
(4, 'Ram', '9855555554', 'male', '2025-04-03', 'fly@high.com', 'gOoHjwKAGKhNQ6f/OBG3VpMux7Ybhh3NJrMeZIdgZrZmEAt63ESqcTzsa+gJU+40o/PNHQ==', 'kammal', 'customer', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_drone_order`
--

CREATE TABLE `user_drone_order` (
  `User_id` int(11) NOT NULL,
  `Drone_id` int(11) NOT NULL,
  `Order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`Cart_item_id`),
  ADD KEY `user_user_category_drone_cart_item_fk` (`User_id`),
  ADD KEY `drone_user_category_drone_cart_item_fk` (`Drone_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_id`),
  ADD UNIQUE KEY `unique_category_name` (`Category_name`);

--
-- Indexes for table `drone`
--
ALTER TABLE `drone`
  ADD PRIMARY KEY (`Drone_id`),
  ADD KEY `category_drone_fk` (`Category_id`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`Order_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`),
  ADD UNIQUE KEY `unique_user_email` (`User_email`),
  ADD UNIQUE KEY `unique_user_phone` (`User_phone`);

--
-- Indexes for table `user_drone_order`
--
ALTER TABLE `user_drone_order`
  ADD KEY `user_user_category_drone_order_fk` (`User_id`),
  ADD KEY `drone_user_category_drone_order_fk` (`Drone_id`),
  ADD KEY `order_user_category_drone_order_fk` (`Order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `drone`
--
ALTER TABLE `drone`
  MODIFY `Drone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `Order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `drone_user_category_drone_cart_item_fk` FOREIGN KEY (`Drone_id`) REFERENCES `drone` (`Drone_id`),
  ADD CONSTRAINT `user_user_category_drone_cart_item_fk` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Constraints for table `drone`
--
ALTER TABLE `drone`
  ADD CONSTRAINT `category_drone_fk` FOREIGN KEY (`Category_id`) REFERENCES `category` (`Category_id`);

--
-- Constraints for table `user_drone_order`
--
ALTER TABLE `user_drone_order`
  ADD CONSTRAINT `drone_user_category_drone_order_fk` FOREIGN KEY (`Drone_id`) REFERENCES `drone` (`Drone_id`),
  ADD CONSTRAINT `order_user_category_drone_order_fk` FOREIGN KEY (`Order_id`) REFERENCES `order_table` (`Order_id`),
  ADD CONSTRAINT `user_user_category_drone_order_fk` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
