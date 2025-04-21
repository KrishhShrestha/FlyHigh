-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2025 at 10:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
  `Cart_item_id` int(11) NOT NULL,
  `Cart_item_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_id` int(11) NOT NULL,
  `Category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drone`
--

CREATE TABLE `drone` (
  `Drone_id` int(11) NOT NULL,
  `Drone_name` varchar(255) NOT NULL,
  `Drone_description` varchar(255) DEFAULT NULL,
  `Drone_price` int(50) NOT NULL,
  `Drone_weight` float NOT NULL,
  `Flight_time` float NOT NULL,
  `Drone_range` float NOT NULL,
  `Camera_quality` varchar(50) DEFAULT NULL,
  `Drone_quantity` int(10) NOT NULL DEFAULT 0,
  `Drone_dimension` varchar(20) NOT NULL,
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
  `Gender` varchar(20) NOT NULL,
  `User_DOB` date NOT NULL,
  `User_email` varchar(50) NOT NULL,
  `User_password` varchar(15) NOT NULL,
  `User_address` varchar(50) NOT NULL,
  `Role_Name` varchar(10) NOT NULL,
  `User_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_drone_cart_item`
--

CREATE TABLE `user_drone_cart_item` (
  `User_id` int(11) NOT NULL,
  `Drone_id` int(11) NOT NULL,
  `Cart_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_drone_order`
--

CREATE TABLE `user_drone_order` (
  `User_id` int(11) NOT NULL,
  `Category_id` int(11) NOT NULL,
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
  ADD PRIMARY KEY (`Cart_item_id`);

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
  ADD UNIQUE KEY `unique_drone_name` (`Drone_name`),
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
-- Indexes for table `user_drone_cart_item`
--
ALTER TABLE `user_drone_cart_item`
  ADD KEY `user_user_category_drone_cart_item_fk` (`User_id`),
  ADD KEY `drone_user_category_drone_cart_item_fk` (`Drone_id`),
  ADD KEY `cart_item_user_category_drone_cart_item_fk` (`Cart_item_id`);

--
-- Indexes for table `user_drone_order`
--
ALTER TABLE `user_drone_order`
  ADD KEY `user_user_category_drone_order_fk` (`User_id`),
  ADD KEY `category_user_category_drone_order_fk` (`Category_id`),
  ADD KEY `drone_user_category_drone_order_fk` (`Drone_id`),
  ADD KEY `order_user_category_drone_order_fk` (`Order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `Cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drone`
--
ALTER TABLE `drone`
  ADD CONSTRAINT `category_drone_fk` FOREIGN KEY (`Category_id`) REFERENCES `category` (`Category_id`);

--
-- Constraints for table `user_drone_cart_item`
--
ALTER TABLE `user_drone_cart_item`
  ADD CONSTRAINT `cart_item_user_category_drone_cart_item_fk` FOREIGN KEY (`Cart_item_id`) REFERENCES `cart_item` (`Cart_item_id`),
  ADD CONSTRAINT `drone_user_category_drone_cart_item_fk` FOREIGN KEY (`Drone_id`) REFERENCES `drone` (`Drone_id`),
  ADD CONSTRAINT `user_user_category_drone_cart_item_fk` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Constraints for table `user_drone_order`
--
ALTER TABLE `user_drone_order`
  ADD CONSTRAINT `category_user_category_drone_order_fk` FOREIGN KEY (`Category_id`) REFERENCES `category` (`Category_id`),
  ADD CONSTRAINT `drone_user_category_drone_order_fk` FOREIGN KEY (`Drone_id`) REFERENCES `drone` (`Drone_id`),
  ADD CONSTRAINT `order_user_category_drone_order_fk` FOREIGN KEY (`Order_id`) REFERENCES `order_table` (`Order_id`),
  ADD CONSTRAINT `user_user_category_drone_order_fk` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
