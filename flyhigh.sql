-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 06:41 PM
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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_id` int(11) NOT NULL,
  `Category_name` varchar(50) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_id`, `Category_name`, `Description`) VALUES
(1, 'Photography Drones', 'Drones equipped with high-quality cameras for aerial photography and videography'),
(2, 'Racing Drones', 'High-speed drones designed for racing and agility'),
(3, 'Beginner Drones', 'Entry-level drones suitable for new users and hobbyists'),
(4, 'Industrial Drones', 'Heavy-duty drones used for surveying, inspection, and delivery tasks');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `ContactID` int(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`ContactID`, `fname`, `lname`, `email`, `message`) VALUES
(1, 'Suman', 'Shrestha', 'suman.shrestha@example.com', 'Hi! '),
(2, 'Anita', 'Thapa', 'anita.thapa@gmail.com', 'What are the delivery options like?'),
(3, 'Rajesh', 'Koirala', 'rajesh.koirala@yahoo.com', 'I have a question about the delivery time.'),
(4, 'Pooja', 'Gurung', 'pooja.gurung@outlook.com', 'Please send me the product details'),
(5, 'Dipak', 'Basnet', 'dipak.basnet@mail.com', 'Any discounts available?');

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

--
-- Dumping data for table `drone`
--

INSERT INTO `drone` (`Drone_id`, `Drone_name`, `Drone_description`, `Drone_price`, `Drone_quantity`, `Weight_grams`, `Flight_time_minutes`, `Range_meter`, `Camera_quality`, `Dimension`, `Drone_image`, `Category_id`) VALUES
(1, 'SkyRider X1', 'High-end drone for aerial photography', 899.99, 4, 1200, 25, 4000, '4K', '30x30x10 cm', 'drone.jpg', 1),
(2, 'Falcon Z3', 'Lightweight drone with long flight range', 649.5, 7, 850, 30, 5000, '1080p', '25x25x8 cm', 'drone.jpg', 2),
(3, 'AeroSnap Pro', 'Professional drone with image stabilization', 1199, 0, 1350, 28, 4500, '4K', '32x32x12 cm', 'drone.jpg', 1),
(4, 'HawkEye Mini', 'Compact drone for beginners', 299.99, 12, 600, 15, 2000, '720p', '20x20x5 cm', 'drone.jpg', 3),
(5, 'BuzzFly 360', '360-degree camera drone with stable flight', 749, 5, 950, 22, 3800, '1080p', '28x28x9 cm', 'drone.jpg', 2),
(6, 'Nimbus V2', 'All-weather drone with GPS', 999, 4, 1250, 26, 4200, '4K', '31x31x11 cm', 'drone.jpg', 1),
(7, 'Stealth Aero', 'Silent motor drone for stealth operations', 829, 7, 1000, 24, 3700, '1080p', '27x27x8 cm', 'drone.jpg', 2),
(8, 'DriftSurfer', 'Wind-resistant drone for beach and coastal areas', 589, 9, 890, 20, 3400, '1080p', '26x26x8 cm', 'drone.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `Order_id` int(11) NOT NULL,
  `Order_date` date NOT NULL,
  `Total_amount` float NOT NULL,
  `status` enum('pending','success','processing','canceled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`Order_id`, `Order_date`, `Total_amount`, `status`) VALUES
(6, '2025-05-21', 4496.99, 'pending'),
(7, '2025-05-21', 649.5, 'pending'),
(8, '2025-05-21', 749, 'pending');

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
(14, 'sayuj', '9800000000', 'male', '1999-10-01', 'sayuj@gmail.com', 'O2T2yaoLqRhhzTwQe1uqL275Hfu28PNxPo9SZ+cu5pxggih+x8uq8aQiOhfdSftaDZ4v4Q0=', 'Kathmandu', 'customer', 'user_77955da9.jpg'),
(15, 'Ram', '9800000011', 'male', '2025-05-14', 'ram@mail.com', 'BsI11Vtmqir/ClACzfIdZFzGLuynI0ocYiN8dtEfZ16UPrWsPhxjMK9mKNtDvGZzTd+AyHo=', 'ktm', 'customer', 'ramphoto_91754f27.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_drone_order`
--

CREATE TABLE `user_drone_order` (
  `User_id` int(11) NOT NULL,
  `Drone_id` int(11) NOT NULL,
  `Order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_drone_order`
--

INSERT INTO `user_drone_order` (`User_id`, `Drone_id`, `Order_id`, `quantity`) VALUES
(15, 1, 6, 1),
(15, 3, 6, 3),
(15, 2, 7, 1),
(15, 5, 8, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_id`),
  ADD UNIQUE KEY `unique_category_name` (`Category_name`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ContactID`);

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
  MODIFY `Category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `ContactID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `drone`
--
ALTER TABLE `drone`
  MODIFY `Drone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `Order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

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
