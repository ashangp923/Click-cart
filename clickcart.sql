-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2023 at 06:12 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clickcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `buyer_ID` int(11) NOT NULL,
  `fName` varchar(30) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`buyer_ID`, `fName`, `lName`, `email`, `password`, `address`) VALUES
(1, 'Berenice', 'Celestin', 'berenice@gmail.com', 'RAhlhOVFMP', '718 Par Drive'),
(2, 'Sterling', 'Asia', 'sterling@gmail.com', 'ZmiCGzX51s', '3962 Chipmunk Lane'),
(3, 'Zaria', 'Napoleon', 'zaria@gmail.com', 'a1VCRLkLKw', '4344 Maud Street'),
(4, 'binuki', 'Deena', 'linwood@gmail.com', '1234', '4081 Pratt Avenue,Australia'),
(5, 'Jervis', 'Lina', 'jervis@gmail.com', 'mOwOrYfRxm', '789 Tori Lane');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_ID` int(11) NOT NULL,
  `buyer_ID` int(11) DEFAULT NULL,
  `product_ID` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_ID`, `buyer_ID`, `product_ID`, `quantity`, `price`) VALUES
(1, 1, 1, 1, '120.00'),
(2, 1, 2, 1, '15.00'),
(3, 1, 3, 1, '10.00'),
(4, 1, 4, 1, '110.00'),
(5, 1, 5, 1, '100.00'),
(6, 2, 1, 1, '549.99'),
(10, 4, 4, 4, '250.00');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_ID` int(11) NOT NULL,
  `category_Name` varchar(50) NOT NULL,
  `category_Picture` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_ID`, `category_Name`, `category_Picture`) VALUES
(1, 'Electronics', 'camera.png'),
(2, 'Sport', 'sports.png'),
(3, 'Health and Beauty', 'health_beauty.png'),
(4, 'Fashion', 'fashion.png'),
(5, 'Industrial Equipment', 'tools.png'),
(6, 'Home Garden', 'home_garden.png'),
(7, 'Grocery and pets', 'grocery.png');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_ID` int(11) NOT NULL,
  `seller_ID` int(11) NOT NULL,
  `buyer_ID` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sender_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_ID`, `seller_ID`, `buyer_ID`, `subject`, `message`, `timestamp`, `sender_role`) VALUES
(6, 2, 4, 'regarding a laptop', 'Great product', '2023-06-26 08:19:18', 'buyer'),
(7, 4, 4, 'Regarding Apple Watch', 'Highly Recommended', '2023-06-26 08:20:00', 'buyer');

-- --------------------------------------------------------

--
-- Table structure for table `place_order`
--

CREATE TABLE `place_order` (
  `place_id` int(11) NOT NULL,
  `buyer_ID` int(11) NOT NULL,
  `product_ID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `order_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `place_order`
--

INSERT INTO `place_order` (`place_id`, `buyer_ID`, `product_ID`, `quantity`, `total_price`, `shipping_address`, `billing_address`, `email`, `payment_method`, `order_status`) VALUES
(1, 1, 1, 1, '500.00', 'Galle,Matara', 'Galle,Matara', 'berenice@gmail.com', 'visa', 'complete'),
(2, 1, 1, 2, '1000.00', 'Galle,Matara', 'Galle,Matara', 'berenice@gmail.com', 'visa', 'pending'),
(3, 1, 1, 2, '500.00', 'Galle,Matara', 'Galle,Matara', 'berenice@gmail.com', 'visa', 'pending'),
(4, 4, 4, 4, '441.00', '4081 Pratt Avenue,Australia', '4081 Pratt Avenue,Australia', 'linwood@gmail.com', 'cash', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_ID` int(11) NOT NULL,
  `seller_ID` int(11) NOT NULL,
  `category_ID` int(11) NOT NULL,
  `product_Name` varchar(50) NOT NULL,
  `product_Brand` varchar(50) NOT NULL,
  `product_Description` varchar(255) DEFAULT NULL,
  `product_Image` varchar(50) NOT NULL,
  `product_Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_ID`, `seller_ID`, `category_ID`, `product_Name`, `product_Brand`, `product_Description`, `product_Image`, `product_Price`) VALUES
(1, 1, 1, 'Laptop LENOVO Ideapad 3i Intel Core i5 11th Gen 8G', 'Lenovo', '', 'lap.png', '500.00'),
(2, 1, 1, 'Samsung Galaxy A54', 'Samsung', 'The Samsung Galaxy A54 comes with 6.4-inch Super AMOLED display with 120Hz refresh rate and 5000mAh battery. Specs also include Triple camera setup on the back with 50MP main sensor and 32MP front selfie camera.', 'a54.png', '449.99'),
(3, 1, 1, 'Sony Alpha a7 III Mirrorless Digital Camera', 'Sony', '', 'cam.png', '1697.00'),
(4, 2, 1, 'Galaxy Buds2', 'Samsung', 'Galaxy Buds2 open a new world of sound with well-balanced audio, lightweight comfort fit, Active Noise Cancellation and seamless connectivity to your Galaxy phone and watch.', 'ear bud.jpg', '109.00'),
(5, 3, 1, 'Galaxy Buds2', 'Samsung', 'Galaxy Buds2 open a new world of sound with well-balanced audio, lightweight comfort fit, Active Noise Cancellation and seamless connectivity to your Galaxy phone and watch.', 'ear bud.jpg', '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `rating_ID` int(11) NOT NULL,
  `seller_ID` int(11) NOT NULL,
  `buyer_ID` int(11) NOT NULL,
  `product_ID` int(11) NOT NULL,
  `stars` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rating_ID`, `seller_ID`, `buyer_ID`, `product_ID`, `stars`, `comment`) VALUES
(1, 1, 1, 1, 5, 'best'),
(2, 1, 1, 1, 3, 'best'),
(3, 1, 1, 1, 5, 'best'),
(4, 1, 1, 1, 1, 'best'),
(5, 1, 1, 2, 5, 'best'),
(6, 1, 1, 1, 5, 'best'),
(8, 1, 3, 1, 3, 'not bad');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `seller_ID` int(11) NOT NULL,
  `seller_Name` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`seller_ID`, `seller_Name`, `location`, `email`, `password`) VALUES
(1, 'Nano Tech', 'Sri Lanka', 'lahiru@gmail.com', '1234'),
(2, 'Chama Computers', 'Sri Lanka', 'chama@gmail.com', 'NhhkLCi4qq'),
(3, 'Opsel', 'Sri Lanka', 'opsel@gmail.com', 'SNKHs5LUZG'),
(4, 'Apple', 'United state of America', 'info@apple.com', 'lLL10NbRKO'),
(5, 'LAHIRU', 'Sri Lanka', 'lahiru@gmail.com', 'nXINhIRHbc'),
(7, 'Ashan', 'Sri Lanka', 'ashan@gmail.com', '1234'),
(8, 'Nuwanga', 'China', 'nuwa@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`buyer_ID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_ID`),
  ADD KEY `CART_FK2` (`buyer_ID`),
  ADD KEY `CART_FK3` (`product_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_ID`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_ID`),
  ADD KEY `MESSAGE_FK1` (`seller_ID`),
  ADD KEY `MESSAGE_FK2` (`buyer_ID`);

--
-- Indexes for table `place_order`
--
ALTER TABLE `place_order`
  ADD PRIMARY KEY (`place_id`),
  ADD KEY `PLACE_ORDER_FK2` (`buyer_ID`),
  ADD KEY `PLACE_ORDER_FK3` (`product_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_ID`),
  ADD KEY `PRODUCT_FK` (`seller_ID`),
  ADD KEY `PRODUCT_FK1` (`category_ID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_ID`),
  ADD KEY `RATING_FK1` (`seller_ID`),
  ADD KEY `RATING_FK2` (`buyer_ID`),
  ADD KEY `RATING_FK3` (`product_ID`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`seller_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `buyer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `place_order`
--
ALTER TABLE `place_order`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `rating_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `seller_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `CART_FK2` FOREIGN KEY (`buyer_ID`) REFERENCES `buyer` (`buyer_ID`),
  ADD CONSTRAINT `CART_FK3` FOREIGN KEY (`product_ID`) REFERENCES `product` (`product_ID`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `MESSAGE_FK1` FOREIGN KEY (`seller_ID`) REFERENCES `seller` (`seller_ID`),
  ADD CONSTRAINT `MESSAGE_FK2` FOREIGN KEY (`buyer_ID`) REFERENCES `buyer` (`buyer_ID`);

--
-- Constraints for table `place_order`
--
ALTER TABLE `place_order`
  ADD CONSTRAINT `PLACE_ORDER_FK2` FOREIGN KEY (`buyer_ID`) REFERENCES `buyer` (`buyer_ID`),
  ADD CONSTRAINT `PLACE_ORDER_FK3` FOREIGN KEY (`product_ID`) REFERENCES `product` (`product_ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `PRODUCT_FK` FOREIGN KEY (`seller_ID`) REFERENCES `seller` (`seller_ID`),
  ADD CONSTRAINT `PRODUCT_FK1` FOREIGN KEY (`category_ID`) REFERENCES `category` (`category_ID`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `RATING_FK1` FOREIGN KEY (`seller_ID`) REFERENCES `seller` (`seller_ID`),
  ADD CONSTRAINT `RATING_FK2` FOREIGN KEY (`buyer_ID`) REFERENCES `buyer` (`buyer_ID`),
  ADD CONSTRAINT `RATING_FK3` FOREIGN KEY (`product_ID`) REFERENCES `product` (`product_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
