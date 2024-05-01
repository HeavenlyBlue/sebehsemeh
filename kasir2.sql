-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2022 at 05:56 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir2`
--

-- --------------------------------------------------------

--
-- Table structure for table `stock_masuk`
--

CREATE TABLE `stock_masuk` (
  `id` int(11) NOT NULL,
  `id_barang` int(128) NOT NULL,
  `qty` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `stock_masuk`
--
DELIMITER $$
CREATE TRIGGER `masuk` AFTER INSERT ON `stock_masuk` FOR EACH ROW BEGIN
	UPDATE tbl_stock SET stok = stok + NEW.stok
    WHERE id_barang = NEW.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(128) NOT NULL,
  `id_kategori` int(128) NOT NULL,
  `harga` int(128) NOT NULL,
  `foto` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id_barang`, `nama_barang`, `id_kategori`, `harga`, `foto`) VALUES
(1, 'Nasi Bakar Ayam Kemangi', 1, 14000, 'barangdef.jpg'),
(2, 'Mie Sosis bonus VIT Goreng atau Rebus', 1, 13000, 'barangdef.jpg'),
(3, 'Mendoan', 3, 11000, 'barangdef.jpg'),
(79, 'Kopi Klotok Santan', 2, 12000, 'barangdef.jpg'),
(81, 'Kopi Klotok Coklat', 2, 8000, 'barangdef.jpg'),
(82, 'Pisang goreng', 3, 14000, 'barangdef.jpg'),
(83, 'Kopi Klotok Susu', 1, 6000, 'barangdef.jpg'),
(84, 'Roti Panggang Coklat', 3, 15000, 'barangdef.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoice`
--

CREATE TABLE `tbl_invoice` (
  `id` int(11) NOT NULL,
  `nama_pelanggan` varchar(128) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `pembayaran` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_invoice`
--

INSERT INTO `tbl_invoice` (`id`, `nama_pelanggan`, `tgl_pesan`, `total_bayar`, `pembayaran`) VALUES
(25, 'Dodik', '2022-09-06 14:53:29', 33000, 'CASH'),
(26, 'altop', '2022-09-06 14:56:56', 24000, 'DANA'),
(27, 'mafa', '2022-09-07 21:18:03', 93000, 'CASH'),
(28, 'adi', '2022-09-07 21:26:58', 35000, 'CASH'),
(29, 'Pesek', '2022-09-07 21:27:47', 120000, 'CASH'),
(30, 'tata', '2022-09-07 21:55:02', 28000, 'CASH'),
(31, 'dodik', '2022-10-30 17:07:07', 23000, 'CASH'),
(32, 'altop', '2022-10-30 17:07:55', 24000, 'OVO');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Makanan'),
(2, 'Minuman'),
(3, 'Snack');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pesanan`
--

CREATE TABLE `tbl_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(128) NOT NULL,
  `id_barang` int(128) NOT NULL,
  `nama_barang` varchar(128) NOT NULL,
  `jumlah` int(128) NOT NULL,
  `harga` int(128) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pesanan`
--

INSERT INTO `tbl_pesanan` (`id`, `id_invoice`, `id_barang`, `nama_barang`, `jumlah`, `harga`, `pilihan`) VALUES
(25, 25, 1, 'Nasi Bakar Ayam Kemangi', 1, 14000, ''),
(26, 25, 2, 'Mie Sosis bonus VIT Goreng atau Rebus', 1, 13000, ''),
(27, 25, 83, 'Kopi Klotok Susu', 1, 6000, ''),
(28, 26, 83, 'Kopi Klotok Susu', 4, 6000, ''),
(29, 27, 1, 'Nasi Bakar Ayam Kemangi', 1, 14000, ''),
(30, 27, 2, 'Mie Sosis bonus VIT Goreng atau Rebus', 1, 13000, ''),
(31, 27, 83, 'Kopi Klotok Susu', 1, 6000, ''),
(32, 27, 79, 'Kopi Klotok Santan', 1, 12000, ''),
(33, 27, 81, 'Kopi Klotok Coklat', 1, 8000, ''),
(34, 27, 3, 'Mendoan', 1, 11000, ''),
(35, 27, 82, 'Pisang goreng', 1, 14000, ''),
(36, 27, 84, 'Roti Panggang Coklat', 1, 15000, ''),
(37, 28, 1, 'Nasi Bakar Ayam Kemangi', 1, 14000, ''),
(38, 28, 2, 'Mie Sosis bonus VIT Goreng atau Rebus', 1, 13000, ''),
(39, 28, 81, 'Kopi Klotok Coklat', 1, 8000, ''),
(40, 29, 1, 'Nasi Bakar Ayam Kemangi', 7, 14000, ''),
(41, 29, 81, 'Kopi Klotok Coklat', 2, 8000, ''),
(42, 29, 83, 'Kopi Klotok Susu', 1, 6000, ''),
(43, 30, 1, 'Nasi Bakar Ayam Kemangi', 2, 14000, ''),
(44, 31, 3, 'Mendoan', 1, 11000, ''),
(45, 31, 79, 'Kopi Klotok Santan', 1, 12000, ''),
(46, 32, 79, 'Kopi Klotok Santan', 2, 12000, '');

--
-- Triggers `tbl_pesanan`
--
DELIMITER $$
CREATE TRIGGER `stok` AFTER INSERT ON `tbl_pesanan` FOR EACH ROW BEGIN
	UPDATE tbl_stock SET stok = stok-NEW.jumlah
    WHERE id_barang = NEW.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock`
--

CREATE TABLE `tbl_stock` (
  `id_stock` int(11) NOT NULL,
  `id_barang` int(128) NOT NULL,
  `stok` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_stock`
--

INSERT INTO `tbl_stock` (`id_stock`, `id_barang`, `stok`) VALUES
(3, 1, 5),
(4, 2, 12),
(5, 3, 5),
(6, 79, -1),
(8, 82, 3),
(17, 81, 2),
(18, 83, 2),
(23, 84, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `tanggal_dibuat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `image`, `password`, `role_id`, `is_active`, `tanggal_dibuat`) VALUES
(9, 'robertus satria', 'satriachandra.cs@gmail.com', 'login.gif', '$2y$10$czLj5OwGjAK5cC5jGiiJ6eN3S.wbcZSIZf5a6Z2PnGWvfKvy3sLQy', 1, 1, 1661443675),
(10, 'fandi eka', 'setyawan@gmail.com', 'gembok.jpg', '$2y$10$aTCu33dwNcIWWAF23aLuR.LXdVp9BhDO2LH91o8rwu3Kp4kMWU5Jy', 2, 1, 1552120289),
(11, 'aku satria', 'strchndr@gmail.com', 'default.jpg', '$2y$10$ub9F1bY3OV2ruEHGUWra6eKo4LrQcfwVAFEyBSbqsHloQ6eqUeGSy', 2, 1, 1661584173);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(3, 2, 2),
(8, 1, 2),
(11, 2, 4),
(12, 1, 6),
(13, 1, 7),
(19, 1, 4),
(20, 1, 8),
(21, 1, 9),
(23, 2, 9),
(24, 1, 10),
(26, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(8, 'Master'),
(9, 'Penjualan'),
(10, 'Invoice');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user', 1),
(3, 2, 'Edit Profile', 'user/edit', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(5, 3, 'Submenu Management ', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(9, 1, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 0),
(11, 2, 'Ganti Password', 'user/gantipassword', 'fas fa-fw fa-key', 1),
(18, 8, 'Barang', 'master', 'fas fa-fw fa-cubes', 1),
(19, 8, 'Kategori', 'master/kategori', 'fas fa-fw fa-list', 1),
(21, 8, 'Stock Barang', 'master/stock', 'fas fa-fw fa-truck', 1),
(22, 9, 'Penjualan', 'penjualan', 'fas fa-fw fa-dollar-sign', 1),
(23, 10, 'Invoice', 'invoice', 'fas fa-fw fa-file', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stock_masuk`
--
ALTER TABLE `stock_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_stock`
--
ALTER TABLE `tbl_stock`
  ADD PRIMARY KEY (`id_stock`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `stock_masuk`
--
ALTER TABLE `stock_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbl_stock`
--
ALTER TABLE `tbl_stock`
  MODIFY `id_stock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
