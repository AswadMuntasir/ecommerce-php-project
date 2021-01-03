-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2021 at 11:04 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adminId` int(11) NOT NULL,
  `adminName` varchar(255) NOT NULL,
  `adminUser` varchar(255) NOT NULL,
  `adminEmail` varchar(255) NOT NULL,
  `adminPass` varchar(32) NOT NULL,
  `lavel` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminId`, `adminName`, `adminUser`, `adminEmail`, `adminPass`, `lavel`) VALUES
(1, 'Delwar J Imran', 'admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brandId` int(11) NOT NULL,
  `brandName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(1, 'Samsung'),
(2, 'Nokia'),
(3, 'Iphone'),
(4, 'Canon'),
(5, 'Accer');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartId` int(11) NOT NULL,
  `sId` varchar(255) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`) VALUES
(1, 'Toys, Kids &amp; Babies'),
(15, 'Beauty &amp; Healthcare'),
(16, 'Home Décor &amp; Kitchen'),
(17, 'Clothing'),
(18, 'Jewellery'),
(19, 'Footwear'),
(20, 'Sports &amp; Fitness'),
(21, 'Software'),
(22, 'Accessories'),
(23, 'Laptop'),
(24, 'Desktop'),
(25, 'Mobile Phones');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_compare`
--

CREATE TABLE `tbl_compare` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zip` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customers`
--

INSERT INTO `tbl_customers` (`id`, `name`, `address`, `city`, `country`, `zip`, `phone`, `email`, `pass`) VALUES
(1, 'Customer', 'Malibagh, Dhaka', 'Dhaka', 'Bangladesh', '1219', '01974353555', 'customer@gmail.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_deliveryboys`
--

CREATE TABLE `tbl_deliveryboys` (
  `dboyId` int(11) NOT NULL,
  `dboyName` varchar(50) NOT NULL,
  `dboyAddress` varchar(200) NOT NULL,
  `dboyCity` varchar(20) NOT NULL,
  `dboyCountry` varchar(20) NOT NULL,
  `dboyZip` int(6) NOT NULL,
  `dboyPhone` varchar(15) NOT NULL,
  `dboyEmail` varchar(50) NOT NULL,
  `dboyPass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_deliveryboys`
--

INSERT INTO `tbl_deliveryboys` (`dboyId`, `dboyName`, `dboyAddress`, `dboyCity`, `dboyCountry`, `dboyZip`, `dboyPhone`, `dboyEmail`, `dboyPass`) VALUES
(3, 'Monir', 'South Badda', 'Dhaka', 'Bangladesh', 1212, '01478523698', 'dboy@gmail.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `cmrId`, `productId`, `productName`, `quantity`, `price`, `image`, `date`, `status`) VALUES
(13, 1, 10, 'Camera', 3, 1650, 'upload/c769967566.jpg', '2018-03-02 12:29:03', 2),
(14, 1, 9, 'Monitor', 1, 50000, 'upload/ae748749b8.jpg', '2020-12-30 17:30:05', 0),
(15, 1, 8, 'Juice Machine', 1, 550, 'upload/a3957721a0.png', '2020-12-31 15:24:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `body` text NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `catId`, `brandId`, `body`, `price`, `image`, `type`) VALUES
(1, 'Lorem Ipsum is simply', 4, 3, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati labore voluptas neque doloremque? Illum voluptates, illo inventore qui fuga, harum dignissimos dolore earum sint. Hic mollitia consectetur, quis voluptatibus quae placeat, aliquid, in facilis, id doloribus cumque modi nemo maxime. Fugiat eum adipisci et quam dicta, nam quidem sapiente, nobis, doloremque magnam reprehenderit voluptatibus repudiandae praesentium. Minus consequuntur maxime, nostrum eos, molestias velit officiis alias incidunt enim reiciendis, pariatur repudiandae consectetur fugit! Suscipit sunt atque commodi repudiandae adipisci, dolore quaerat eveniet minima, repellat sint quas impedit velit quidem necessitatibus excepturi qui veniam maiores quibusdam animi neque consequuntur consectetur. Velit deleniti repellat vitae at, aut nulla, perspiciatis cupiditate non ipsum animi dolores, voluptatem est ea, minima dignissimos. Doloribus minima magnam perspiciatis.&lt;br /&gt;&amp;nbsp;&amp;nbsp; &amp;nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus vel facilis asperiores consequuntur minus excepturi quas, voluptatibus atque aut vitae! Non omnis, consectetur? Ex eligendi, fuga aspernatur velit assumenda ad unde dicta harum. Ab dolorem voluptate rerum natus voluptas ex repudiandae, sint sapiente cupiditate tempore necessitatibus dignissimos, quam exercitationem consequuntur officia placeat, eaque est a praesentium laboriosam provident minima obcaecati. Sunt ipsa cumque nobis sint aliquam non magnam incidunt inventore quia quod, iste repellat ducimus, ratione delectus maiores accusantium, eos.&lt;/p&gt;', 505.22, 'upload/491e649d8c.png', 0),
(2, 'Lorem Ipsum is simply', 9, 5, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati labore voluptas neque doloremque? Illum voluptates, illo inventore qui fuga, harum dignissimos dolore earum sint. Hic mollitia consectetur, quis voluptatibus quae placeat, aliquid, in facilis, id doloribus cumque modi nemo maxime. Fugiat eum adipisci et quam dicta, nam quidem sapiente, nobis, doloremque magnam reprehenderit voluptatibus repudiandae praesentium. Minus consequuntur maxime, nostrum eos, molestias velit officiis alias incidunt enim reiciendis, pariatur repudiandae consectetur fugit! Suscipit sunt atque commodi repudiandae adipisci, dolore quaerat eveniet minima, repellat sint quas impedit velit quidem necessitatibus excepturi qui veniam maiores quibusdam animi neque consequuntur consectetur. Velit deleniti repellat vitae at, aut nulla, perspiciatis cupiditate non ipsum animi dolores, voluptatem est ea, minima dignissimos. Doloribus minima magnam perspiciatis.&lt;br /&gt;&amp;nbsp;&amp;nbsp; &amp;nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus vel facilis asperiores consequuntur minus excepturi quas, voluptatibus atque aut vitae! Non omnis, consectetur? Ex eligendi, fuga aspernatur velit assumenda ad unde dicta harum. Ab dolorem voluptate rerum natus voluptas ex repudiandae, sint sapiente cupiditate tempore necessitatibus dignissimos, quam exercitationem consequuntur officia placeat, eaque est a praesentium laboriosam provident minima obcaecati. Sunt ipsa cumque nobis sint aliquam non magnam incidunt inventore quia quod, iste repellat ducimus, ratione delectus maiores accusantium, eos.&lt;/p&gt;', 620.87, 'upload/ea836cb393.jpg', 0),
(3, 'Lorem Ipsum is simply', 7, 2, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati labore voluptas neque doloremque? Illum voluptates, illo inventore qui fuga, harum dignissimos dolore earum sint. Hic mollitia consectetur, quis voluptatibus quae placeat, aliquid, in facilis, id doloribus cumque modi nemo maxime. Fugiat eum adipisci et quam dicta, nam quidem sapiente, nobis, doloremque magnam reprehenderit voluptatibus repudiandae praesentium. Minus consequuntur maxime, nostrum eos, molestias velit officiis alias incidunt enim reiciendis, pariatur repudiandae consectetur fugit! Suscipit sunt atque commodi repudiandae adipisci, dolore quaerat eveniet minima, repellat sint quas impedit velit quidem necessitatibus excepturi qui veniam maiores quibusdam animi neque consequuntur consectetur. Velit deleniti repellat vitae at, aut nulla, perspiciatis cupiditate non ipsum animi dolores, voluptatem est ea, minima dignissimos. Doloribus minima magnam perspiciatis.&lt;br /&gt;&amp;nbsp;&amp;nbsp; &amp;nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus vel facilis asperiores consequuntur minus excepturi quas, voluptatibus atque aut vitae! Non omnis, consectetur? Ex eligendi, fuga aspernatur velit assumenda ad unde dicta harum. Ab dolorem voluptate rerum natus voluptas ex repudiandae, sint sapiente cupiditate tempore necessitatibus dignissimos, quam exercitationem consequuntur officia placeat, eaque est a praesentium laboriosam provident minima obcaecati. Sunt ipsa cumque nobis sint aliquam non magnam incidunt inventore quia quod, iste repellat ducimus, ratione delectus maiores accusantium, eos.&lt;/p&gt;', 220.97, 'upload/1367244342.jpg', 0),
(4, 'Lorem Ipsum is simply', 10, 1, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati labore voluptas neque doloremque? Illum voluptates, illo inventore qui fuga, harum dignissimos dolore earum sint. Hic mollitia consectetur, quis voluptatibus quae placeat, aliquid, in facilis, id doloribus cumque modi nemo maxime. Fugiat eum adipisci et quam dicta, nam quidem sapiente, nobis, doloremque magnam reprehenderit voluptatibus repudiandae praesentium. Minus consequuntur maxime, nostrum eos, molestias velit officiis alias incidunt enim reiciendis, pariatur repudiandae consectetur fugit! Suscipit sunt atque commodi repudiandae adipisci, dolore quaerat eveniet minima, repellat sint quas impedit velit quidem necessitatibus excepturi qui veniam maiores quibusdam animi neque consequuntur consectetur. Velit deleniti repellat vitae at, aut nulla, perspiciatis cupiditate non ipsum animi dolores, voluptatem est ea, minima dignissimos. Doloribus minima magnam perspiciatis.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus vel facilis asperiores consequuntur minus excepturi quas, voluptatibus atque aut vitae! Non omnis, consectetur? Ex eligendi, fuga aspernatur velit assumenda ad unde dicta harum. Ab dolorem voluptate rerum natus voluptas ex repudiandae, sint sapiente cupiditate tempore necessitatibus dignissimos, quam exercitationem consequuntur officia placeat, eaque est a praesentium laboriosam provident minima obcaecati. Sunt ipsa cumque nobis sint aliquam non magnam incidunt inventore quia quod, iste repellat ducimus, ratione delectus maiores accusantium, eos.&lt;/p&gt;', 600, 'upload/5b7b9305f1.png', 0),
(5, 'Iron Machine', 16, 1, '&lt;p&gt;This is a verry Good Product.&lt;/p&gt;', 550, 'upload/4af42022d4.png', 1),
(6, 'Sound Box', 22, 1, '&lt;p&gt;This is a verry Good Product.&lt;/p&gt;', 660, 'upload/d5bf825e2d.jpg', 0),
(7, 'Fan', 22, 4, '&lt;p&gt;This is a verry Good Product.&lt;/p&gt;', 880, 'upload/8f9f7b4ade.jpg', 0),
(8, 'Juice Machine', 22, 1, '&lt;p&gt;This is a verry Good Product.&lt;/p&gt;', 550, 'upload/a3957721a0.png', 0),
(9, 'Monitor', 24, 5, '&lt;p&gt;This is a verry Good Product.&lt;/p&gt;', 50000, 'upload/ae748749b8.jpg', 1),
(10, 'Camera', 22, 4, '&lt;p&gt;This is a verry Good Product.&lt;/p&gt;', 750, 'upload/c769967566.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_seller`
--

CREATE TABLE `tbl_seller` (
  `sellerId` int(11) NOT NULL,
  `sellerName` varchar(50) NOT NULL,
  `sellerAddress` varchar(200) NOT NULL,
  `sellerCity` varchar(20) NOT NULL,
  `sellerCountry` varchar(20) NOT NULL,
  `sellerZip` int(6) NOT NULL,
  `sellerPhone` varchar(15) NOT NULL,
  `sellerEmail` varchar(100) NOT NULL,
  `sellerPass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_seller`
--

INSERT INTO `tbl_seller` (`sellerId`, `sellerName`, `sellerAddress`, `sellerCity`, `sellerCountry`, `sellerZip`, `sellerPhone`, `sellerEmail`, `sellerPass`) VALUES
(2, 'Seller', 'North Badda', 'Dhaka', 'Bangladesh', 1212, '01111111111', 'seller@gmail.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wlist`
--

CREATE TABLE `tbl_wlist` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_wlist`
--

INSERT INTO `tbl_wlist` (`id`, `cmrId`, `productId`, `productName`, `price`, `image`) VALUES
(6, 1, 7, 'Fan', 880.00, 'upload/8f9f7b4ade.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_deliveryboys`
--
ALTER TABLE `tbl_deliveryboys`
  ADD PRIMARY KEY (`dboyId`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `tbl_seller`
--
ALTER TABLE `tbl_seller`
  ADD PRIMARY KEY (`sellerId`);

--
-- Indexes for table `tbl_wlist`
--
ALTER TABLE `tbl_wlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_deliveryboys`
--
ALTER TABLE `tbl_deliveryboys`
  MODIFY `dboyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_seller`
--
ALTER TABLE `tbl_seller`
  MODIFY `sellerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_wlist`
--
ALTER TABLE `tbl_wlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
