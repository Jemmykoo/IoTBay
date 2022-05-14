-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2022 at 05:31 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iotbay`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `ORDERID` int(11) NOT NULL,
  `PRODUCTID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`ORDERID`, `PRODUCTID`) VALUES
(10004, 100),
(10005, 103);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `userid`, `date`, `description`) VALUES
(2, 10006, '2022-05-14 08:50:01', 'John Smith logged in.'),
(3, 10006, '2022-05-14 08:54:25', 'John Smith logged in.'),
(4, 10006, '2022-05-14 08:56:16', 'John Smith logged in.'),
(5, 10006, '2022-05-14 09:00:04', 'John Smith logged out.'),
(6, 10006, '2022-05-14 09:00:42', 'John Smith logged in.'),
(7, 10006, '2022-05-14 09:01:00', 'John Smith logged out.');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ORDERID` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `ORDERDATE` date NOT NULL,
  `ORDERPRICE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ORDERID`, `ID`, `ORDERDATE`, `ORDERPRICE`) VALUES
(10004, 10001, '0000-00-00', 699.99),
(10005, 10003, '0000-00-00', 123.45);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `PRODUCTID` int(11) NOT NULL,
  `PRODUCTNAME` varchar(255) NOT NULL,
  `UNITPRICE` decimal(10,2) NOT NULL,
  `PRODUCTTYPE` varchar(255) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `PRODUCTDESCRIPTION` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`PRODUCTID`, `PRODUCTNAME`, `UNITPRICE`, `PRODUCTTYPE`, `QUANTITY`, `PRODUCTDESCRIPTION`) VALUES
(100, 'Drone', '699.99', 'robot', 12, 'flying object'),
(101, 'Apple Watch', '299.99', 'wearable', 20, 'wearable watch and fitbit'),
(102, 'Amazon Alexa', '666.66', 'spyware', 25, 'home'),
(103, 'Google echo', '123.45', 'spyware', 15, 'home'),
(104, 'Fancy doorbell', '50.20', 'home', 12, 'video camera doorbell');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `FIRSTNAME` varchar(255) NOT NULL,
  `LASTNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `PHONE` varchar(255) NOT NULL,
  `ISSTAFF` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `EMAIL`, `FIRSTNAME`, `LASTNAME`, `PASSWORD`, `PHONE`, `ISSTAFF`) VALUES
(10000, 'harry.potter@student.uts.edu.au', 'Harry', 'Potter', 'stag', '0412345678', 0),
(10001, 'ron.weasley@student.uts.edu.au', 'Ron', 'Weasley', 'dog', '0412666666', 0),
(10002, 'hermione.granger@student.uts.edu.au', 'Hermione', 'Granger', 'otter', '0412333444', 0),
(10003, 'albus.dumbledore@uts.edu.au', 'Albus', 'Dumbledore', 'phoenix', '1234567890', 1),
(10004, 'minerva.mcgonagall@uts.edu.au', 'Minerva', 'Mcgonagall', 'cat', '041111111', 1),
(10006, 'john.smith@gmail.com', 'John', 'Smith', 'smith', '9865472345', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `ORDERID` (`ORDERID`),
  ADD KEY `PRODUCTID` (`PRODUCTID`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ORDERID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`PRODUCTID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ORDERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10006;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `PRODUCTID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10007;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`ORDERID`) REFERENCES `orders` (`ORDERID`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`PRODUCTID`) REFERENCES `products` (`PRODUCTID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `users` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
