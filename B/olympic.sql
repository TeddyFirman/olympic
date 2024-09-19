-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 19, 2024 at 01:07 AM
-- Server version: 11.5.2-MariaDB
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olympic`
--

-- --------------------------------------------------------

--
-- Table structure for table `mar_mas_customer`
--

CREATE TABLE `mar_mas_customer` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mar_mas_customer`
--

INSERT INTO `mar_mas_customer` (`id`, `name`, `province`, `city`, `address`) VALUES
('CUS0001', 'Dara Arafah', 'SUMATRA SELATAN', 'PALEMBANG', 'jl. Bahagia No. 12'),
('CUS0002', 'Raditya Dika', 'DKI JAKARTA', 'JAKARTA PUSAT', 'jl. Kemerdekaan No. 45'),
('CUS0003', 'Jhonathan Cristie', 'JAWA TENGAH', 'SEMARANG', 'jl. Tengah No. 99'),
('CUS0004', 'Desta Mahendra', 'JAWA TIMUR', 'MALANG', 'jl. Ditempat No. 105B'),
('CUS0005', 'Irfan Hakim', 'JAWA TIMUR', 'KEDIRI', 'jl. Sapu-Sapu No. 67');

-- --------------------------------------------------------

--
-- Table structure for table `mar_mas_expedition`
--

CREATE TABLE `mar_mas_expedition` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mar_mas_expedition`
--

INSERT INTO `mar_mas_expedition` (`id`, `name`) VALUES
('EKS0001', 'ABC EXPRESS'),
('EKS0002', 'ITU CARGO');

-- --------------------------------------------------------

--
-- Table structure for table `mar_mas_item`
--

CREATE TABLE `mar_mas_item` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `price` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mar_mas_item`
--

INSERT INTO `mar_mas_item` (`id`, `name`, `brand`, `price`) VALUES
('ITM0001', 'Lemari 2 Pintu', 'OLYMPIC', 2000),
('ITM0002', 'Meja Tulis', 'OLYMPIC', 800),
('ITM0003', 'Rak Plastik', 'OLYMPLAST', 950),
('ITM0004', 'Kursi Anak', 'OLYMPLAST', 400);

-- --------------------------------------------------------

--
-- Table structure for table `mar_mas_marketplace`
--

CREATE TABLE `mar_mas_marketplace` (
  `id` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `store_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mar_mas_marketplace`
--

INSERT INTO `mar_mas_marketplace` (`id`, `platform`, `brand`, `store_name`) VALUES
('MP0001', 'SHOPEE', 'OLYMPIC', 'SHOPEE - OLYMPIC'),
('MP0002', 'SHOPEE', 'OLYMPLAST', 'SHOPEE - OLYMPLAST');

-- --------------------------------------------------------

--
-- Table structure for table `mar_tra_order`
--

CREATE TABLE `mar_tra_order` (
  `id` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `marketplace_id` varchar(255) NOT NULL,
  `expedition_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mar_tra_order`
--

INSERT INTO `mar_tra_order` (`id`, `created_at`, `customer_id`, `marketplace_id`, `expedition_id`) VALUES
('SO20090001', '2020-09-25', 'CUS0001', 'MP0002', 'EKS0001'),
('SO20090002', '2020-09-26', 'CUS0002', 'MP0001', 'EKS0001'),
('SO20090003', '2020-09-27', 'CUS0003', 'MP0002', 'EKS0001'),
('SO20090004', '2020-09-28', 'CUS0003', 'MP0002', 'EKS0002'),
('SO20100001', '2020-10-02', 'CUS0004', 'MP0001', 'EKS0002'),
('SO20100002', '2020-10-03', 'CUS0001', 'MP0002', 'EKS0002'),
('SO20100003', '2020-10-04', 'CUS0005', 'MP0002', 'EKS0001'),
('SO20100004', '2020-10-05', 'CUS0001', 'MP0002', 'EKS0001'),
('SO20100005', '2020-10-06', 'CUS0005', 'MP0002', 'EKS0002'),
('SO20100006', '2020-10-07', 'CUS0001', 'MP0002', 'EKS0002');

-- --------------------------------------------------------

--
-- Table structure for table `mar_tra_order_detail`
--

CREATE TABLE `mar_tra_order_detail` (
  `id` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mar_tra_order_detail`
--

INSERT INTO `mar_tra_order_detail` (`id`, `created_at`, `order_id`, `item_id`, `qty`) VALUES
(1001, '2020-09-25', 'SO20090001', 'ITM0003', 4),
(1002, '2020-09-26', 'SO20090002', 'ITM0001', 1),
(1003, '2020-09-26', 'SO20090002', 'ITM0002', 1),
(1004, '2020-09-27', 'SO20090003', 'ITM0003', 8),
(1005, '2020-09-28', 'SO20090004', 'ITM0004', 1),
(1006, '2020-10-02', 'SO20100001', 'ITM0001', 1),
(1007, '2020-10-02', 'SO20100001', 'ITM0002', 2),
(1008, '2020-10-02', 'SO20100001', 'ITM0003', 2),
(1009, '2020-10-02', 'SO20100001', 'ITM0004', 4),
(1010, '2020-10-03', 'SO20100002', 'ITM0004', 1),
(1011, '2020-10-04', 'SO20100003', 'ITM0004', 1),
(1012, '2020-10-05', 'SO20100004', 'ITM0003', 1),
(1013, '2020-10-06', 'SO20100005', 'ITM0004', 3),
(1014, '2020-10-07', 'SO20100006', 'ITM0003', 2),
(1015, '2020-10-07', 'SO20100006', 'ITM0004', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mar_mas_customer`
--
ALTER TABLE `mar_mas_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mar_mas_expedition`
--
ALTER TABLE `mar_mas_expedition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mar_mas_item`
--
ALTER TABLE `mar_mas_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mar_mas_marketplace`
--
ALTER TABLE `mar_mas_marketplace`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mar_tra_order`
--
ALTER TABLE `mar_tra_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mar_tra_order_detail`
--
ALTER TABLE `mar_tra_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mar_tra_order_detail`
--
ALTER TABLE `mar_tra_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1016;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
