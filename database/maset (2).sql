-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 13, 2025 at 11:38 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maset`
--

-- --------------------------------------------------------

--
-- Table structure for table `aktivitas_users`
--

CREATE TABLE `aktivitas_users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `aksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aktivitas_users`
--

INSERT INTO `aktivitas_users` (`id`, `user_id`, `aksi`, `created_at`) VALUES
(1, 1, 'Melihat halaman kelola makanan', '2025-07-13 11:32:34'),
(2, 1, 'Melihat halaman kelola makanan', '2025-07-13 11:32:48'),
(3, 1, 'Melihat halaman kelola makanan', '2025-07-13 11:33:11'),
(4, 1, 'Melihat halaman kelola makanan', '2025-07-13 11:33:18'),
(5, 1, 'Melihat halaman kelola makanan', '2025-07-13 11:33:21'),
(6, 1, 'Melihat halaman kelola makanan', '2025-07-13 11:33:23'),
(7, 1, 'Melihat halaman kelola makanan', '2025-07-13 11:33:47'),
(8, 1, 'Melihat halaman kelola makanan', '2025-07-13 11:33:51'),
(9, 1, 'Melihat halaman kelola makanan', '2025-07-13 11:33:54'),
(10, 1, 'Melihat halaman kelola makanan', '2025-07-13 11:33:58'),
(11, 1, 'Melihat halaman kelola makanan', '2025-07-13 11:34:01'),
(12, 1, 'Melihat halaman kelola makanan', '2025-07-13 11:34:03'),
(13, 1, 'Melihat halaman kelola makanan', '2025-07-13 11:34:44');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorit`
--

CREATE TABLE `favorit` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `makanan_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `makanan`
--

CREATE TABLE `makanan` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_makanan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` text COLLATE utf8mb4_unicode_ci,
  `kalori` double(8,2) DEFAULT NULL,
  `karbohidrat` double(8,2) DEFAULT NULL,
  `protein` double(8,2) DEFAULT NULL,
  `harga` int DEFAULT NULL,
  `level_harga` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe_diet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cluster` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `makanan`
--

INSERT INTO `makanan` (`id`, `nama_makanan`, `gambar`, `kalori`, `karbohidrat`, `protein`, `harga`, `level_harga`, `tipe_diet`, `cluster`, `created_at`, `updated_at`) VALUES
(487, 'Nama Makanan', 'Gambar', NULL, NULL, NULL, NULL, 'Level Harga', 'Tipe Diet', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(488, 'Telur Rebus', 'https://images.eatthismuch.com/med/36640_elm333_3445f15a-841d-4f23-9353-e269b504d115.jpg', 72.00, 0.40, 6.30, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(489, 'Salad Ayam Caesar', 'https://images.eatthismuch.com/med/33488_ldementhon_023ee1ed-1b44-4452-9ae9-f29a0cfbc54c.png', 358.00, 3.90, 31.80, 40000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(490, 'Orak-arik Bayam', 'https://images.eatthismuch.com/med/56823_elm333_99e159c8-7230-4ef8-b270-05bd0bf2f549.jpg', 252.00, 6.80, 14.10, 14000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(491, 'Telur orak-arik', 'https://images.eatthismuch.com/med/34096_erin_m_f434d8cd-93af-4dde-86b5-11fa49b476b0.png', 273.00, 2.40, 19.50, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(492, 'Ayam Panggang Teriyaki', 'https://images.eatthismuch.com/med/36663_jessejsherrill_5e9504b0-f3ad-4740-99c2-53773915faa6.jpg', 373.00, 12.70, 57.60, 24000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(493, 'Ubi Jalar', 'https://images.eatthismuch.com/med/42621_elm333_b5bc89d3-32a1-4505-a38b-926d3a09777c.jpg', 112.00, 26.20, 2.00, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(494, 'Tuna', 'https://images.eatthismuch.com/med/34567_PBnJammie_fc009fb5-c25d-42e7-9816-c280fbb5c217.jpeg', 317.00, 14.10, 36.20, 33000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(495, 'Ayam Panggang', 'https://images.eatthismuch.com/med/36662_tabitharwheeler_83d52001-a710-4e61-ad20-fb545347e831.jpg', 316.00, 14.60, 27.50, 38000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(496, 'Salad Tuna', 'https://images.eatthismuch.com/med/56852_tabitharwheeler_4efc3d4b-3a45-4fdb-a30d-56fb3ef8b57e.jpg', 237.00, 10.00, 18.30, 15000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(497, 'Ayam Bawang Putih', 'https://images.eatthismuch.com/med/33501_elm333_4bb41603-56fd-43db-8de6-af0ee43b8c16.jpg', 225.00, 1.60, 27.00, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(498, 'Coconut Milk Protein Shake', 'https://images.eatthismuch.com/med/34529_erin_m_d332ffda-cbd3-41c4-8efe-ba54be439ac2.png', 360.00, 19.00, 51.00, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(499, 'Telur Rebus Kupas', 'https://images.eatthismuch.com/med/39296_ldementhon_81a2d45f-cc37-4e12-bb3c-ab12c90c29ce.jpg', 144.00, 0.70, 12.60, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(500, 'Oatmeal banana protein shake', 'https://images.eatthismuch.com/med/33544_erin_m_8323de29-d07e-467a-a15f-53e752405fe9.png', 546.00, 48.50, 53.70, 31000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(501, 'Salad Ayam Kari', 'https://images.eatthismuch.com/med/36624_elm333_0c86da09-fb11-4a97-a729-d11f7d9f40a2.jpg', 275.00, 1.40, 26.00, 16000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(502, 'Salad Ayam dan Alpukat', 'https://images.eatthismuch.com/med/33519_elm333_04a59a70-44d7-4010-9cf2-30410e4a9435.jpg', 404.00, 12.00, 34.60, 27000, 'Mahal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(503, 'Chicken wrap', 'https://images.eatthismuch.com/med/34202_erin_m_603eda78-c76e-4fcc-9ef8-5254b79227f5.png', 253.00, 24.70, 24.00, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(504, 'Chicken Kabobs', 'https://images.eatthismuch.com/med/33494_elm333_65fda051-e649-4b62-92e7-9ccd8076eaf3.jpg', 285.00, 33.30, 28.30, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(505, 'Classic Omelet', 'https://images.eatthismuch.com/med/34828_tabitharwheeler_375317ba-efcc-490f-a328-30caf79492a1.jpg', 298.00, 1.10, 19.40, 11000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(506, 'Acar Timun dan Tomat Segar', 'https://images.eatthismuch.com/med/36583_erin_m_e8029c7c-8e28-4a2e-99e4-f74481a4fcd9.png', 92.00, 6.40, 1.20, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(507, 'Salad Tuna dan Alpukan Paleo', 'https://images.eatthismuch.com/med/255176_erin_m_3c4d93f4-6f37-46e5-8a34-32197b722981.png', 451.00, 19.20, 31.70, 35000, 'Premium', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(508, 'Ayam Tumis', 'https://images.eatthismuch.com/med/33774_tabitharwheeler_e9d47dcf-5ed2-424f-a4e2-db6f7f26364b.jpg', 192.00, 5.70, 31.20, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(509, 'Ayam Keju Bayam', 'https://images.eatthismuch.com/med/33936_ldementhon_a99db1d4-c0b9-4ff5-8561-49a4c71923bf.jpg', 508.00, 7.70, 62.20, 21000, 'Mahal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(510, 'Ayam Goreng saus Lemon ', 'https://images.eatthismuch.com/med/386715_tabitharwheeler_c0ab67e2-de51-4706-9bee-cde5708800e4.jpg', 173.00, 0.60, 26.60, 16000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(511, 'Pancake Protein', 'https://images.eatthismuch.com/med/412920_lfrontier_dd1b5a3a-bccc-41bb-9a54-7fc0f984aebd.png', 250.00, 27.70, 13.80, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(512, 'Daging Sapi Tumis', 'https://images.eatthismuch.com/med/33767_erin_m_2dda50bc-732d-4a8d-81b5-eabcd0304d66.png', 217.00, 10.10, 21.30, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(513, 'Ayam Panggang Kulit Keju', 'https://images.eatthismuch.com/med/36672_erin_m_6f623a9d-13e6-496d-a5d9-9a9302932f76.png', 364.00, 2.90, 29.20, 22000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(514, 'Asparagus Panggang', 'https://images.eatthismuch.com/med/33503_erin_m_b1221caa-c35f-4911-8251-8b63682d1cfb.png', 69.00, 4.70, 2.60, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(515, 'Brokoli Kukus dengan Minyak Zaitun dan Keju', 'https://images.eatthismuch.com/med/45106_tabitharwheeler_90dff40b-4259-4496-9aab-3eafcbb1dfcf.jpg', 189.00, 11.60, 8.60, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(516, 'Salmon Panggang', 'https://images.eatthismuch.com/med/45079_erin_m_0a52e2b4-4feb-4eab-be3b-8374032688d9.png', 243.00, 0.30, 28.30, 15000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(517, 'Sandwich Tuna Barbeque', 'https://images.eatthismuch.com/med/37612_elm333_e372780d-7e82-4f5a-b6b9-cfc50c4edb33.jpg', 375.00, 47.70, 36.80, 34000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(518, 'Roti Panggang Pisang Selai Kacang', 'https://images.eatthismuch.com/med/39533_erin_m_5ba9f81a-bd3e-47fc-872b-b553372bcf12.png', 386.00, 51.90, 11.40, 37000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(519, 'Salad Caesar Sehat', 'https://images.eatthismuch.com/med/34571_erin_m_78b2f47c-7cf1-4a17-95c1-5d5c67d83e43.png', 377.00, 3.90, 30.30, 37000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(520, 'Chicken Fajitas', 'https://images.eatthismuch.com/med/412924_tabitharwheeler_1a903d07-fd65-4de8-a024-48fe402e74ff.jpg', 355.00, 29.90, 31.10, 26000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(521, 'Banana oatmeal', 'https://images.eatthismuch.com/med/33511_elm333_b07f7274-1079-4f17-a461-46b7085230d9.jpg', 494.00, 96.80, 19.40, 34000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(522, 'Salad Ayam Sederhana', 'https://images.eatthismuch.com/med/3087507_ldementhon_c9e72ef3-788f-4bd7-8370-eac0239d39fc.jpg', 161.00, 8.60, 3.60, 13000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(523, 'Southwestern Eggs', 'https://images.eatthismuch.com/med/34671_erin_m_e65f8c8a-5d22-4b5a-8c50-49742ea73e78.png', 256.00, 3.20, 18.90, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(524, 'Vegetarian Fajitas', 'https://images.eatthismuch.com/med/412924_tabitharwheeler_1a903d07-fd65-4de8-a024-48fe402e74ff.jpg', 275.00, 35.00, 13.00, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(525, 'Telur Orrak-arik dengan Bayam dan Keju', 'https://images.eatthismuch.com/med/207668_tabitharwheeler_6eb87ced-d1be-4727-8d19-b530db75b504.jpg', 219.00, 2.60, 16.10, 12000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(526, 'Ayam Barbeque', 'https://images.eatthismuch.com/med/34749_ldementhon_ef6080bf-ccf8-4167-973a-0590b9151464.png', 344.00, 36.00, 27.50, 24000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(527, 'Kentang Panggang', 'https://images.eatthismuch.com/med/36642_tabitharwheeler_03f4d328-3586-45fd-a84a-56ddec4ac772.jpg', 233.00, 29.80, 3.60, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(528, 'Selain kacang & Pisang Oatmeal', 'https://images.eatthismuch.com/med/413007_cyberchristie_f063e2da-91d9-4962-9123-2d6c710600aa.png', 282.00, 46.10, 9.30, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(529, 'Smoothie Mangga', 'https://images.eatthismuch.com/med/37604_elm333_9cdd0ccb-b391-4448-ba48-c75dae1870a1.jpg', 355.00, 44.30, 32.80, 40000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(530, 'Sandwich Turkey', 'https://images.eatthismuch.com/med/943340_elm333_9cdbf1e6-d06d-41c0-92bd-61606f323390.jpg', 177.00, 27.20, 10.50, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(531, 'Sandwich Ham dan keju ', 'https://images.eatthismuch.com/med/33492_tabitharwheeler_a8cfbf0f-6c9f-47bc-abb1-4eac0e248087.jpg', 535.00, 29.40, 32.70, 37000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(532, 'Brokoli Kukus', 'https://images.eatthismuch.com/med/39781_tabitharwheeler_faeb2596-a9fe-4a32-a365-52aa28bdabb7.jpg', 134.00, 11.30, 4.90, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(533, 'Breakfast Parfait', 'https://images.eatthismuch.com/med/34796_elm333_c0af6c1e-0e0c-4779-8c01-4bafcb5dc746.jpg', 333.00, 43.90, 27.60, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(534, 'Omelet putih telur keju', 'https://images.eatthismuch.com/med/412935_elm333_2b6170b6-7dbc-4e9c-acc2-a73c4f613295.jpg', 392.00, 2.70, 37.40, 37000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(535, 'Big PB&J Sandwich', 'https://images.eatthismuch.com/med/33482_tabitharwheeler_6cd5f22c-a4fa-476b-abba-c9c9a42c3c3c.jpg', 621.00, 64.00, 21.50, 26000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(536, 'Caprese Sandwich', 'https://images.eatthismuch.com/med/55543_erin_m_169a3fe7-127c-46b3-99bc-6f8fb5fa66f1.png', 340.00, 52.10, 17.50, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(537, 'Egg Salad Sandwich', 'https://images.eatthismuch.com/med/33525_tabitharwheeler_78fe767b-800b-43c9-b262-6af2232f46a7.jpg', 482.00, 25.60, 20.20, 28000, 'Mahal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(538, 'Buncis Panggang', 'https://images.eatthismuch.com/med/39204_erin_m_8f15074c-2348-4b94-ac9e-ff8c3c5b6145.png', 122.00, 14.10, 3.70, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(539, 'Eggs, Cheese, Turkey Sausage Omelet', 'https://images.eatthismuch.com/med/35583_erin_m_aa758c85-e7f7-459e-9aa1-fb52ccec6f32.png', 368.00, 2.30, 32.50, 38000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(540, 'Ayam Panggang Lemon', 'https://images.eatthismuch.com/med/36664_tabitharwheeler_820895b6-fe45-4185-8863-77a23b436c72.jpg', 196.00, 4.20, 29.40, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(541, 'Smoothie Protein Coklat Kacang', 'https://images.eatthismuch.com/med/33547_tabitharwheeler_18bd494c-fb4f-4311-9fe0-9ef4500d0964.jpg', 542.00, 49.80, 40.70, 23000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(542, 'Pancake oat dan keju Cottage', 'https://images.eatthismuch.com/med/39211_tabitharwheeler_b0fc3ecd-6a00-4126-8962-4a4b3f2a771d.jpg', 296.00, 33.60, 33.50, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(543, 'Sandwich Telur dan Keju', 'https://images.eatthismuch.com/med/717847_jhannavanesa1213_11dc0e64-05cb-43f2-9781-aad7ca57267d.jpeg', 261.00, 25.10, 19.20, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(544, 'Ayam Bawang Putih Teriyaki', 'https://images.eatthismuch.com/med/39291_tabitharwheeler_6e9c9912-70b0-4bbd-833f-7b1e7e7870f5.jpg', 175.00, 6.30, 27.80, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(545, 'Roti Panggang Kayu Manis', 'https://images.eatthismuch.com/med/36559_tabitharwheeler_ce337033-07e9-457d-8289-614bdc9d78e3.jpg', 130.00, 18.80, 3.60, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(546, 'Salad Timun, Tomat dengan Tuna', 'https://images.eatthismuch.com/med/905900_CaseyMooney_8014238a-f167-45c1-ac1c-1922d176fecc.png', 184.00, 9.40, 34.20, 16000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(547, 'Denver omelet', 'https://images.eatthismuch.com/med/225159_tabitharwheeler_f263549e-39ca-4e79-93f0-c209a9ab48c6.jpg', 362.00, 7.30, 27.40, 26000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(548, 'Salad Ayam Buffalo', 'https://images.eatthismuch.com/med/907110_mmclaxton04_7c274cdd-92f4-4d9f-a10c-d97cb8506fd8.jpg', 228.00, 8.80, 28.40, 20000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(549, 'Mozzarella Tortilla Pizza', 'https://images.eatthismuch.com/med/33905_SexyMaps_3c8a5786-9c0b-4ab9-99c9-8e22e2143260.jpg', 196.00, 17.60, 11.40, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(550, 'Gordon Ramsay\'s Scrambled Eggs', 'https://images.eatthismuch.com/med/33946_tabitharwheeler_35f8e68e-7902-44f0-b45a-0c6607809387.jpg', 446.00, 1.30, 19.30, 27000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(551, 'Dada Ayam Madu dan Kacang Pecan', 'https://images.eatthismuch.com/med/39310_tabitharwheeler_2758cdd1-e752-40ba-ab83-e7bca151b42c.jpg', 386.00, 30.30, 28.90, 32000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(552, 'Salad Tuna dan Alpukat', 'https://images.eatthismuch.com/med/924619_Tahirah_Fo_Ferah_be330bb4-505c-4ea2-b074-26ad678577a2.jpg', 226.00, 5.30, 33.30, 19000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(553, 'Ayam Bawang Putih', 'https://images.eatthismuch.com/med/303915_kgines_aca74c1a-c539-443c-8add-95c5d2a0e196.png', 353.00, 10.10, 53.40, 23000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(554, 'Bayam Tumis Bawang Putih', 'https://images.eatthismuch.com/med/57064_tabitharwheeler_bbbf21b7-f213-4541-acb2-1d53ae33d8a0.jpg', 102.00, 6.90, 5.00, 15000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(555, 'Asparagus Saus Balsamik', 'https://images.eatthismuch.com/med/47247_erin_m_3b6f446d-be00-4f9f-8d47-89c18ba33c2e.png', 58.00, 5.40, 2.70, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(556, 'Nasi Goreng', 'https://images.eatthismuch.com/med/33939_tabitharwheeler_0c9f0dbe-5745-48a6-9792-7e53ef253bbb.jpg', 390.00, 55.30, 15.50, 28000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(557, 'Sandwich Ayam Barbeque', 'https://images.eatthismuch.com/med/50746_erin_m_d2616545-19ef-45b3-b5ec-fd2b0986c87a.png', 491.00, 38.60, 39.50, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(558, 'Daging Sapi Panggang Saus Balsamik', 'https://images.eatthismuch.com/med/36698_tabitharwheeler_b723d0d0-7dfb-4463-930f-15225ca8c018.jpg', 334.00, 6.50, 22.50, 33000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(559, 'Asparagus Panggang Teflon', 'https://images.eatthismuch.com/med/39329_tabitharwheeler_2c7eda2f-2ee9-4831-aea2-fa6cca96dffd.jpg', 54.00, 4.60, 2.50, 7000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(560, 'Salad Tomat', 'https://images.eatthismuch.com/med/33940_erin_m_630964d1-02d1-420a-957f-f0e3cedc82ef.png', 68.00, 13.40, 3.00, 10000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(561, 'Buncis Minyak Zaitun', 'https://images.eatthismuch.com/med/45085_tabitharwheeler_ccc9814e-ff99-4c1b-9638-0d3775f8c74a.jpg', 95.00, 7.80, 2.10, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(562, 'Kopi Blended dan Shake Protein Selai Kacang', 'https://images.eatthismuch.com/med/34763_tabitharwheeler_a870f31c-ce4e-47ed-b1ea-499861d79525.jpg', 528.00, 51.50, 40.90, 25000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(563, 'Kentang Goreng Ubi', 'https://images.eatthismuch.com/med/34973_tabitharwheeler_c4fbce56-35ae-441a-ae7b-a7a7e3e883ba.jpg', 239.00, 42.50, 2.40, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(564, 'Selai Kacang pisang Oatmeal', 'https://images.eatthismuch.com/med/54631_tabitharwheeler_8ae61a14-58fd-4a7d-b1f5-95d7d5720901.jpg', 311.00, 48.00, 10.60, 35000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(565, 'Strawberry Smoothie', 'https://images.eatthismuch.com/med/412984_tabitharwheeler_06ade64c-ccdc-4e0d-8fc1-3669754919e6.jpg', 278.00, 33.90, 33.70, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(566, 'Oatmeal Pisang Selai Kacang dan Cokelat', 'https://images.eatthismuch.com/med/43621_erin_m_476e6fb1-f2b0-405b-b44c-25ec2ff4a773.png', 550.00, 66.50, 36.90, 24000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(567, 'Chicken Strips', 'https://images.eatthismuch.com/med/921865_i_heart_tjs_dfef9c17-e55d-4428-bf8a-93a61224fb18.jpg', 152.00, 0.00, 26.50, 18000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(568, 'Ayam Bakar Mediterranean', 'https://images.eatthismuch.com/med/33604_erin_m_ba55c968-33b2-4d1c-a6a1-103105b18087.png', 420.00, 4.00, 53.90, 23000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(569, 'Oatmeal dan Buah Persik', 'https://images.eatthismuch.com/med/34544_erin_m_8ca1a6db-3cb9-4f36-93d5-0537f8eb871c.png', 176.00, 39.60, 5.70, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(570, 'Chicken Caesar Wraps', 'https://images.eatthismuch.com/med/34691_erin_m_5fa11394-90d0-4f53-b452-3889802164c6.png', 560.00, 26.90, 34.10, 39000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(571, 'Telur Rebus', 'https://images.eatthismuch.com/med/39219_tabitharwheeler_2b8f8e4b-ec63-41d2-beeb-40a5456d6815.jpg', 72.00, 0.40, 6.30, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(572, 'Orak-arik Putih Telur dengan Alpukat dan Tomat', 'https://images.eatthismuch.com/med/4368678_jsastre199_259f6134-1679-4cce-a76c-5931c8ac09c4.jpeg', 273.00, 15.60, 20.60, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(573, 'Keju Cottage dengan Tuna Pedas', 'https://images.eatthismuch.com/med/332370_erin_m_bcb3777c-be65-4aef-8b37-dcb941614aac.png', 228.00, 4.00, 46.20, 18000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(574, 'Salad Tuna dan Kacang Putih', 'https://images.eatthismuch.com/med/332363_TZNewman_0820f6f1-c628-4182-bb00-df1d0e064c30.jpg', 362.00, 43.60, 30.70, 24000, 'Mahal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(575, 'Fast Oatmeal', 'https://images.eatthismuch.com/med/50036_tabitharwheeler_c3226eea-a168-42c9-aede-7b411a4ad2f7.jpg', 244.00, 58.30, 6.00, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(576, 'Beef Tacos', 'https://images.eatthismuch.com/med/211394_erin_m_6d5851e7-a3d0-4fc7-97c2-dec3fcc06e7d.png', 238.00, 9.40, 12.10, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(577, 'Es Krim Pisang Nanas', 'https://images.eatthismuch.com/med/332352_MikeOcho_f4fa869c-3598-4d0c-a85e-d071972d909a.png', 280.00, 72.00, 2.90, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(578, 'Chicken Club Sandwich', 'https://images.eatthismuch.com/med/33493_erin_m_52104ea7-bf52-4fb4-9ca7-a5974632c0fa.png', 788.00, 43.50, 29.60, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(579, 'Omelet Keju dan Bayam', 'https://images.eatthismuch.com/med/33531_tabitharwheeler_911265d9-ec9f-436f-97ac-6935023cb566.jpg', 533.00, 2.00, 26.80, 39000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(580, 'Telur Orak-arik Sayur', 'https://images.eatthismuch.com/med/717738_MTawheed_a35930f8-aef1-4685-aef5-3dee288eea87.jpg', 511.00, 33.20, 29.10, 26000, 'Mahal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(581, 'Zucchini Hash Browns', 'https://images.eatthismuch.com/med/209451_tabitharwheeler_ad1759e7-6764-471c-8a7f-e4024daaa0e4.jpg', 159.00, 7.40, 7.90, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(582, 'Telur Orak-arik dengan Sayuran', 'https://images.eatthismuch.com/med/412900_tabitharwheeler_118d0242-4f53-4ef5-92c0-6fe8abe548be.jpg', 161.00, 6.50, 8.20, 14000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(583, 'Dada Ayam Parmesan Rempah', 'https://images.eatthismuch.com/med/35421_tabitharwheeler_dc189f1b-330f-4c7f-a92a-274f491c73bb.jpg', 292.00, 4.40, 34.90, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(584, 'Kentang dan Paprika Tumis', 'https://images.eatthismuch.com/med/45556_tabitharwheeler_dafc6361-ffb5-41b4-b8e2-152f82414fd8.jpg', 442.00, 63.30, 7.60, 37000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(585, 'Scramble sosis,Telur dan Keju', 'https://images.eatthismuch.com/med/412929_tabitharwheeler_b0345d67-b4a8-42f6-bcdb-e7aa6ad20577.jpg', 323.00, 8.90, 22.10, 25000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(586, 'Salad Ayam Jeruk Nipis', 'https://images.eatthismuch.com/med/907212_Shamarie84_d55ed57a-284c-4637-8080-e9ac535d658d.png', 242.00, 3.30, 32.50, 20000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(587, 'Ayam Paprika Asap', 'https://images.eatthismuch.com/med/295471_ale_marc_7c10ff33-581c-4919-9a2c-e5ccd33d3367.png', 386.00, 2.60, 53.80, 21000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(588, 'Kentang Goreng Rumahan', 'https://images.eatthismuch.com/med/206224_tabitharwheeler_d3c89696-70f1-4966-915c-ea9af1ad6229.jpg', 295.00, 50.00, 6.00, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(589, 'Smoothie Selai Kacang Creamy', 'https://images.eatthismuch.com/med/34735_erin_m_0859f467-4e78-45a1-a353-e07b0c355840.png', 374.00, 10.40, 30.00, 38000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(590, 'Perkedel Tuna', 'https://images.eatthismuch.com/med/33953_erin_m_d68769ca-1f53-48eb-97c6-3ded69e30d00.png', 335.00, 21.40, 42.90, 36000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(591, 'Sandwich Selada dan Tomat', 'https://images.eatthismuch.com/med/33506_erin_m_d7ccb7f3-f742-4034-9d9f-7f1d4010d220.png', 452.00, 28.00, 14.20, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(592, 'Ayam Saus Persik', 'https://images.eatthismuch.com/med/45419_StephanCrowley_874c2cd7-9481-485c-afa4-71e37fc182c5.png', 234.00, 16.50, 27.30, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(593, 'Basic Chicken Salad', 'https://images.eatthismuch.com/med/45828_tabitharwheeler_65d55548-0604-4a58-a97b-b5e550591931.jpg', 410.00, 3.70, 29.80, 20000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(594, 'Vegan Banana Oatmeal Smoothie', 'https://images.eatthismuch.com/med/254476_ldementhon_e30c0188-a9fd-4c3b-8f93-e26439ea0dfa.png', 395.00, 43.50, 31.70, 39000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(595, 'Greek Yogurt and Fruit Salad', 'https://images.eatthismuch.com/med/39532_erin_m_ed668d2b-392f-43f8-82dc-7119965ba96f.png', 263.00, 33.00, 14.30, 13000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(596, 'Easy Paleo Garlic Chicken', 'https://images.eatthismuch.com/med/253958_ldementhon_b7ff97df-1fcd-4929-9d68-f9caeb2e971a.png', 208.00, 1.60, 26.90, 15000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(597, 'Egg in a Basket', 'https://images.eatthismuch.com/med/46007_tabitharwheeler_4660e549-5a57-402a-955e-82ce8dcc360a.jpg', 193.00, 12.40, 9.80, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(598, 'Basic Paleo Scrambled Eggs', 'https://images.eatthismuch.com/med/253957_ldementhon_99b1c917-bca0-4ef1-8be0-acd8181cea04.png', 282.00, 2.40, 19.40, 11000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(599, 'Maple Glazed Salmon', 'https://images.eatthismuch.com/med/213320_tabitharwheeler_82c2c5ba-66fb-48cd-957a-fa362c57fe30.jpg', 309.00, 10.60, 34.10, 29000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(600, 'Spinach Taco Salad', 'https://images.eatthismuch.com/med/924528_Talia303_febc9a1a-1b8a-4659-829a-e5a61a1430db.jpg', 364.00, 15.50, 24.10, 21000, 'Mahal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(601, 'Tuna Melt Patties', 'https://images.eatthismuch.com/med/34566_tabitharwheeler_f0b8e092-ec6c-49a1-b02a-79ce730b27ff.jpg', 200.00, 11.50, 25.40, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(602, 'Tropical protein smoothie', 'https://images.eatthismuch.com/med/34387_erin_m_da7d21fb-43f0-4110-ac41-e2924fd14f08.png', 425.00, 76.90, 28.40, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(603, 'Banana Oatmeal Smoothie', 'https://images.eatthismuch.com/med/42556_tabitharwheeler_c1046f3d-8648-4c61-9730-6f9c7d300a31.jpg', 718.00, 95.70, 50.40, 25000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(604, 'Grilled turkey sandwich', 'https://images.eatthismuch.com/med/33530_tabitharwheeler_7a3fb23e-4ed0-465e-96ab-ca5e40a303f5.jpg', 425.00, 34.20, 29.90, 25000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(605, 'Basic Chicken Quesadilla', 'https://images.eatthismuch.com/med/34084_JoeOcho_25738644-f714-446b-8adb-731833514dec.png', 852.00, 48.30, 61.30, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(606, 'Protein Southwest Scramble', 'https://images.eatthismuch.com/med/254564_tabitharwheeler_315a8e95-7d41-442e-876d-22943048f295.jpg', 335.00, 25.00, 24.00, 31000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(607, 'Broiled Sesame Tofu', 'https://images.eatthismuch.com/med/34099_tabitharwheeler_5c9a3a7a-52c6-4726-b275-2ad2e7227c60.jpg', 141.00, 9.50, 12.00, 11000, 'Normal', 'Vegan', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(608, 'Spicy Avocado Toast', 'https://images.eatthismuch.com/med/34420_tabitharwheeler_fd56d8f0-277f-4d27-a29d-47c5d9d3e124.jpg', 550.00, 42.90, 11.20, 38000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(609, 'Garlic Kale', 'https://images.eatthismuch.com/med/36722_tabitharwheeler_1aa63d8c-3589-4139-92c1-c6eac85c7f1f.jpg', 81.00, 3.90, 1.60, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(610, 'Summer Shrimp', 'https://images.eatthismuch.com/med/33954_tabitharwheeler_295df205-6676-44d5-868b-6ad9c2fcbf39.jpg', 192.00, 2.70, 20.80, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(611, 'Soft Boiled Eggs & Toast', 'https://images.eatthismuch.com/med/852857_tabitharwheeler_6bec9144-7f46-461e-9f9c-037b15bef681.jpg', 284.00, 24.70, 19.50, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(612, 'Bachelor Brussel Sprouts', 'https://images.eatthismuch.com/med/203296_HillOK444_5b51edbb-11d0-4621-8d28-76ae161428cc.png', 156.00, 8.20, 3.00, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(613, 'Turkey Sandwich', 'https://images.eatthismuch.com/med/323667_joesnyder1_540bf165-e310-4a86-9f7c-ce1d1bf1269c.png', 335.00, 31.50, 18.80, 26000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(614, 'Seared strip steak', 'https://images.eatthismuch.com/med/34087_tabitharwheeler_694ccccd-bc5c-4327-9a3f-b9ab68e9e4e7.jpg', 461.00, 0.30, 33.40, 26000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(615, 'Chicken Bacon Ranch Wrap', 'https://images.eatthismuch.com/med/33526_erin_m_d6ba28b4-81bf-4615-b27c-36fb9e01c30b.png', 510.00, 26.60, 34.80, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(616, 'Tortellini Southwest', 'https://images.eatthismuch.com/med/45266_erin_m_1a5377c9-ba1f-44b1-af61-b034f031c7ca.png', 355.00, 44.00, 18.50, 40000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(617, 'High Protein Omelet', 'https://images.eatthismuch.com/med/320804_MichaelDuw%C3%A9_a4c543a1-4075-4e8e-9467-4cc09f46b73c.png', 302.00, 23.10, 27.40, 32000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(618, 'Ham and Egg Mushroom Cups', 'https://images.eatthismuch.com/med/56754_PBnJammie_e23bc5b8-3317-41bb-b9a0-1fdd7b62ff10.jpeg', 195.00, 4.70, 12.70, 14000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(619, 'Big Bad Bean Burrito', 'https://images.eatthismuch.com/med/57131_i_heart_tjs_aaa74afc-d627-44bf-8f65-65a2255df7bb.jpg', 287.00, 33.30, 8.20, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(620, 'Ham and Egg Scramble', 'https://images.eatthismuch.com/med/928005_tabitharwheeler_841d26df-fd34-46b1-8ef5-55c3a094466e.jpg', 291.00, 5.90, 29.10, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(621, 'Blueberry protein pudding', 'https://images.eatthismuch.com/med/386736_tabitharwheeler_b4fb322b-4b0e-41a5-8964-32e845db0def.jpg', 432.00, 26.70, 72.80, 39000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(622, 'Baked Spinach and Eggs', 'https://images.eatthismuch.com/med/385883_tabitharwheeler_43242cfb-45e0-4473-8b1f-c44b17206825.jpg', 145.00, 2.30, 9.80, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(623, 'Almonds and Blueberries Yogurt Snack', 'https://images.eatthismuch.com/med/905846_AlexandraPetric_89a58047-cca9-4f8f-9ea3-749c36063e24.jpg', 218.00, 19.80, 21.40, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(624, 'French Dip Sandwich', 'https://images.eatthismuch.com/med/223429_erin_m_c8f4bb38-df9d-415b-b636-08d32f9edbe2.png', 208.00, 22.50, 9.90, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(625, 'Basic Eggs', 'https://images.eatthismuch.com/med/905711_tabitharwheeler_5e5c1d26-e56a-45af-a35b-fabae62f3ad6.jpg', 183.00, 0.70, 12.60, 18000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(626, 'Asian Style Beef and Broccoli', 'https://images.eatthismuch.com/med/33819_erin_m_cc946223-db2d-4316-be3c-da672afa06df.png', 248.00, 8.70, 21.10, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(627, 'Oatmeal and raisins', 'https://images.eatthismuch.com/med/34542_erin_m_6c837755-7bc1-487c-8f4c-65137602cf82.png', 259.00, 62.30, 6.20, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(628, 'Apple Toast', 'https://images.eatthismuch.com/med/36608_i_heart_tjs_03e71b9c-9c21-4b40-9471-786cee2208b1.jpg', 130.00, 21.20, 3.70, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(629, 'Tuna Stuffed Pepper', 'https://images.eatthismuch.com/med/3238296_PBnJammie_3d14c1ec-5c4a-44f3-85b2-1306136ed059.jpeg', 200.00, 10.20, 34.40, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(630, 'Firecracker Burgers', 'https://images.eatthismuch.com/med/36701_tabitharwheeler_cdf72e71-fcb5-477b-a160-352cd88415ed.jpg', 403.00, 2.40, 26.50, 40000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(631, 'Zucchini Hash', 'https://images.eatthismuch.com/med/254574_tabitharwheeler_89af8e31-a75e-472e-8cda-648d90a4a561.jpg', 218.00, 12.70, 16.80, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(632, 'Caprese Chicken', 'https://images.eatthismuch.com/med/386716_GRRemlin_af39aab2-1010-4ecd-a680-3a88888c10a4.jpg', 273.00, 8.00, 33.50, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(633, 'Green salad', 'https://images.eatthismuch.com/med/33536_erin_m_4aa4d1fe-aaa9-4447-95d1-5fc8458ac5a4.png', 70.00, 1.40, 0.70, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(634, 'Light Raspberry yogurt', 'https://images.eatthismuch.com/med/34572_erin_m_422caba7-9854-42b5-b34a-0e8d9ec14ab6.png', 141.00, 16.30, 17.80, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(635, 'Grilled cheese sandwich', 'https://images.eatthismuch.com/med/33505_tabitharwheeler_adc3c380-0b9f-402b-a703-b20f3c2b79a1.jpg', 408.00, 24.30, 13.90, 40000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(636, 'Pesto Scrambled Eggs', 'https://images.eatthismuch.com/med/38199_Tahirah_Fo_Ferah_3949e6da-6f79-4b53-b411-611e0b4b2b76.jpg', 252.00, 1.80, 13.30, 12000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(637, 'Balsamic Salmon', 'https://images.eatthismuch.com/med/33755_ldementhon_bf372679-0d68-4fe0-85a3-fe933be694e2.jpg', 298.00, 3.70, 22.70, 17000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(638, 'Black Bean Vegetarian Quesadillas', 'https://images.eatthismuch.com/med/40729_tabitharwheeler_97ccaeee-4156-4adb-b6de-06dd9b7388fc.jpg', 405.00, 54.10, 20.30, 38000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(639, 'Rooster Bullet Sandwich', 'https://images.eatthismuch.com/med/34829_erin_m_7fba1706-ffe0-4e1f-97f9-607f4b4c2e47.png', 525.00, 25.30, 36.90, 39000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(640, 'Pasta with Fresh Tomato Sauce', 'https://images.eatthismuch.com/med/45255_tabitharwheeler_310fe06c-7de2-439c-8e84-84bb72ce647a.jpg', 245.00, 48.90, 10.40, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(641, 'Asparagus Parmesan', 'https://images.eatthismuch.com/med/36709_erin_m_5b830503-ae80-4f1a-924e-235d6fcef621.png', 184.00, 3.90, 6.60, 15000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(642, 'Brown Sugar Salmon', 'https://images.eatthismuch.com/med/34750_tabitharwheeler_507de9c2-2995-4ee0-83b9-93be6a09cfad.jpg', 397.00, 9.40, 35.10, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(643, 'Chicken Ranch Tacos', 'https://images.eatthismuch.com/med/56904_erin_m_b072000f-66a5-4f8d-89c9-d83b116d66ec.png', 354.00, 26.90, 23.00, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(644, 'Berry Granola Parfait', 'https://images.eatthismuch.com/med/33527_HillOK444_9de5ef7f-c96f-4699-b4b5-35761fef4554.png', 430.00, 53.50, 21.20, 35000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(645, 'Cheese Meatballs', 'https://images.eatthismuch.com/med/34791_erin_m_a79461a2-4b1d-4f7c-a516-ec8ac449d784.png', 372.00, 1.20, 24.30, 26000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(646, 'Spinach and Turkey Wrap', 'https://images.eatthismuch.com/med/906881_tabitharwheeler_577cba81-a93a-477f-96c7-ddf248bd1a7a.jpg', 290.00, 27.30, 15.40, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(647, 'Almond Milk Cocoa Protein Shake', 'https://images.eatthismuch.com/med/254479_ldementhon_6d8ef880-45b5-403b-8a85-f7d912c262d6.png', 241.00, 27.60, 26.00, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(648, 'White Rice', 'https://images.eatthismuch.com/med/45206_tabitharwheeler_69217534-fb96-49f3-8192-49cd85b35d39.jpg', 338.00, 74.00, 6.60, 25000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(649, 'Classic Fruit Salad', 'https://images.eatthismuch.com/med/203491_tabitharwheeler_2b3c3114-c5a6-4d9f-8176-a162d594e832.jpg', 192.00, 48.30, 3.60, 15000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(650, 'Cucumbers and Egg Salad', 'https://images.eatthismuch.com/med/36619_erin_m_d48aceae-7364-40ff-aeab-4df11ef8ed72.png', 338.00, 13.50, 15.00, 28000, 'Mahal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(651, 'Zucchini Frittata', 'https://images.eatthismuch.com/med/56825_tabitharwheeler_13236531-3e47-4e16-b8fb-ee216f5908b7.jpg', 201.00, 6.60, 15.40, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(652, 'Veggie & chicken salad', 'https://images.eatthismuch.com/med/34583_erin_m_3ada8a55-8f8a-4cc0-a7d7-8e303d201e6b.png', 294.00, 21.10, 19.40, 17000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(653, 'Roast Teriyaki Broccoli', 'https://images.eatthismuch.com/med/39677_erin_m_8de3c102-2999-495a-842b-18bcc8a9b938.png', 69.00, 7.70, 3.00, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(654, 'Baked Chicken', 'https://images.eatthismuch.com/med/33504_erin_m_d4c293ba-f79c-4b09-a666-d570d4bce54a.png', 491.00, 1.00, 53.50, 35000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(655, 'Spicy Chicken Fajita', 'https://images.eatthismuch.com/med/34077_erin_m_dfdd51aa-b93b-40fd-b6de-05eb11f7ce8a.png', 453.00, 29.30, 38.40, 40000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(656, 'Tropical Fruit Smoothie', 'https://images.eatthismuch.com/med/36629_MikeOcho_8385bb6a-a4b7-4cf7-a023-f470b983e5cc.png', 335.00, 72.30, 14.30, 29000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(657, 'Arugula Chicken Salad', 'https://images.eatthismuch.com/med/254550_kylemek_2ca44c17-f7d3-4397-b567-9f19d65b67d1.png', 560.00, 18.00, 56.30, 37000, 'Premium', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(658, 'Garlic Roasted Brussels Sprouts', 'https://images.eatthismuch.com/med/412930_tabitharwheeler_adc9c1b8-466f-4d89-aee8-c29a9a59383b.jpg', 162.00, 8.90, 3.20, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(659, 'Feta-Stuffed Hamburgers', 'https://images.eatthismuch.com/med/36697_erin_m_d01752c6-ab64-4649-a766-9ee1727438eb.png', 388.00, 1.80, 24.80, 29000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(660, 'Easy Olive Oil, Tomato, and Basil Pasta', 'https://images.eatthismuch.com/med/45256_erin_m_194bb3ad-c126-4b71-a617-52aab09e6196.png', 324.00, 44.00, 8.70, 29000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(661, 'Scrambled Eggs with Bacon and Mushrooms', 'https://images.eatthismuch.com/med/717793_tabitharwheeler_4fa4cc6f-c5be-4b78-af16-c8767a9c9079.jpg', 264.00, 1.70, 17.60, 20000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(662, 'Beer Grilled Shrimp', 'https://images.eatthismuch.com/med/36718_erin_m_a1b65a66-4f15-400d-93ce-b12dbbce4469.png', 162.00, 5.40, 23.70, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(663, 'Creamy Mango Smoothie', 'https://images.eatthismuch.com/med/36615_tabitharwheeler_c824607d-afee-4fc8-9b7e-9377e60cda30.jpg', 141.00, 24.20, 6.90, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(664, 'High Potassium Fruit Salad', 'https://images.eatthismuch.com/med/213586_i_heart_tjs_bca8078d-6835-4e86-81b1-4a2fafe8b69f.jpg', 62.00, 10.60, 5.20, 9000, 'Murah', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(665, 'ALT (Avocado, Lettuce, and Tomato) Sandwiches', 'https://images.eatthismuch.com/med/386790_tabitharwheeler_2a1f4242-8d72-4404-a438-70395eda3d6c.jpg', 344.00, 32.70, 16.20, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(666, 'Baked Chicken Breasts', 'https://images.eatthismuch.com/med/303942_kgines_59c79a1d-c922-4a0f-bbd6-68e7bd24b22c.png', 347.00, 0.90, 53.30, 36000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(667, 'Chocolate Mousse II', 'https://images.eatthismuch.com/med/45262_i_heart_tjs_6d8b0012-ffb4-4259-902f-fd934b0fb482.jpg', 166.00, 16.80, 4.70, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(668, 'Steak and Eggs Hash', 'https://images.eatthismuch.com/med/34091_erin_m_9822354e-b352-4193-ab63-79ef0b8e1202.png', 517.00, 20.20, 31.70, 32000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(669, 'Baked Chicken Breast', 'https://images.eatthismuch.com/med/948571_tabitharwheeler_9b5e3731-6de2-4463-a6c1-923bbebc90d0.jpg', 153.00, 1.90, 27.60, 11000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(670, 'Curry Cheddar Scrambled Eggs', 'https://images.eatthismuch.com/med/36623_tabitharwheeler_d3580db6-5da7-40c8-87f5-8aa4005353dd.jpg', 219.00, 1.20, 16.00, 15000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(671, 'Tasty Turkey & Spinach Omelet', 'https://images.eatthismuch.com/med/56672_erin_m_550f5a36-6c6d-4f07-98ea-d3adc28c5392.png', 423.00, 18.20, 47.20, 26000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(672, 'Spicy Basil Lemon Chicken', 'https://images.eatthismuch.com/med/282139_hlapla1_ac84a44c-2912-463e-a691-ac4435d55771.png', 283.00, 7.40, 39.40, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(673, 'Easy Fried Spinach', 'https://images.eatthismuch.com/med/36661_erin_m_972176e5-a606-40d6-91ae-24732d060d49.png', 175.00, 4.80, 3.00, 11000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(674, 'Cinnamon Apple Delight', 'https://images.eatthismuch.com/med/46501_i_heart_tjs_406d2f1f-f297-49d0-ba4f-c12da8dd710e.jpg', 224.00, 38.60, 18.00, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(675, 'Raspberry Chia Seed Pudding', 'https://images.eatthismuch.com/med/337828_tabitharwheeler_cc3d9411-9db3-4148-9363-457a90bef6c1.jpg', 305.00, 28.60, 8.70, 37000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(676, 'Black Beans and Rice', 'https://images.eatthismuch.com/med/34526_erin_m_bf890685-569d-4053-bfbc-56ff1a32aada.png', 311.00, 56.20, 14.00, 32000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(677, 'Chocolate Banana Protein Muffins', 'https://images.eatthismuch.com/med/34765_i_heart_tjs_d4f88626-735d-49bf-8e83-0da65049e368.jpg', 160.00, 28.20, 8.00, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(678, 'Zucchini Spears with Parmesan', 'https://images.eatthismuch.com/med/906095_tabitharwheeler_44f532d2-3f2b-471e-9a02-4a55b7064958.jpg', 43.00, 5.20, 3.40, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(679, 'Garlic Green Beans with Tofu', 'https://images.eatthismuch.com/med/34875_erin_m_80f9d977-1813-4094-b223-9a2408152607.png', 270.00, 17.90, 13.30, 19000, 'Normal', 'Vegan', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(680, 'Roast Beef and Cheddar Sandwich', 'https://images.eatthismuch.com/med/906002_jamiemsrd_5d997799-5d46-411a-9d57-5d69e1cc88df.jpg', 450.00, 25.40, 41.30, 22000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(681, 'Peanut Butter Chocolate Protein Balls', 'https://images.eatthismuch.com/med/906080_elm333_6ad80a81-25d5-4414-8d99-907a216e34ad.jpg', 127.00, 13.50, 8.00, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(682, 'Mexican chickpea salad', 'https://images.eatthismuch.com/med/34554_tabitharwheeler_82162386-6ae5-46cb-8535-0a20cecb72ad.jpg', 136.00, 18.70, 6.30, 11000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(683, 'Scrambled Eggs with Onion Flakes', 'https://images.eatthismuch.com/med/906179_tabitharwheeler_a525205c-6424-4dd6-b16f-4dafd7439492.jpg', 181.00, 1.20, 15.80, 16000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(684, 'Onion and Tomato Omelet', 'https://images.eatthismuch.com/med/412942_tabitharwheeler_cd974a09-3fa3-467f-86ef-a14ff94aa220.jpg', 300.00, 4.40, 14.70, 12000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(685, 'Goat Cheese and Spinach Turkey Burgers', 'https://images.eatthismuch.com/med/36731_tabitharwheeler_2da6d510-edd9-4064-a35e-7e9dc1989aaa.jpg', 396.00, 20.80, 40.50, 33000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(686, 'Panfried steak with garlic butter', 'https://images.eatthismuch.com/med/33535_erin_m_7a05b91d-4e78-4067-ba72-b02fb234e649.png', 728.00, 1.10, 39.40, 25000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(687, 'Brownies Berprotein', 'https://m.ftscrt.com/static/recipe/71012335-8a65-4211-85bc-fc98961495fb.jpg', 184.00, 11.88, 19.29, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(688, 'Telur Dadar Sayur', 'https://m.ftscrt.com/static/recipe/17b0ac40-49b8-4ec5-997f-30ff3df81994.jpg', 268.00, 13.79, 7.58, 14000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(689, 'Brownies', 'https://m.ftscrt.com/static/recipe/38cea3a0-db69-4b43-82a9-6a551b83b5a7.jpg', 79.00, 8.63, 1.60, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(690, 'Kue Wortel Labu', 'https://m.ftscrt.com/static/recipe/682cdaf2-d7ee-46d7-9b4e-3100ea8bdb14.jpg', 288.00, 31.41, 4.34, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(691, 'Kue Kering Coklat Chip', 'https://m.ftscrt.com/static/recipe/4a900a3f-b902-4d9b-a5a7-21997f0f86fd.jpg', 139.00, 18.15, 1.42, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(692, 'Kue Pisang', 'https://m.ftscrt.com/static/recipe/cafe23c7-eaa8-4868-bd24-e4aa388d52bd.jpg', 124.00, 26.15, 2.99, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(693, 'Pancake Pisang', 'https://m.ftscrt.com/static/recipe/a23aab18-6da1-46b5-bbbe-743176660a2f.jpg', 297.00, 5.00, 39.11, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(694, 'Roti Pisang Oat', 'https://m.ftscrt.com/static/recipe/02cfcf50-184b-4f9f-b609-6ebb2d30ce8d.jpg', 193.00, 29.77, 4.28, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(695, 'Donat', 'https://m.ftscrt.com/static/recipe/06e11583-e166-4c21-a28b-9a35b6148cd9.jpg', 106.00, 0.10, 19.30, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(696, 'Muffin Oat Pisang', 'https://m.ftscrt.com/static/recipe/96b4491e-3694-4661-bd18-f431678d4048.jpg', 136.00, 23.62, 4.02, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(697, 'Banana Bread Oats', 'https://m.ftscrt.com/static/recipe/d99b4496-5626-4249-b444-2e67991da406.jpg', 247.00, 32.96, 8.84, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(698, 'Bilah Energi Oatmeal Cokelat', 'https://m.ftscrt.com/static/recipe/28134fbc-6512-4de0-8adb-bd77620cf2ff.jpg', 92.00, 13.29, 2.06, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(699, 'Kue Pisang', 'https://m.ftscrt.com/static/recipe/23b191a3-ee69-4284-b6a0-2f95dbb94b79.jpg', 118.00, 19.31, 6.30, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(700, 'Mie Shirataki Goreng', 'https://m.ftscrt.com/static/recipe/abd8c1bf-00db-4577-bef7-37e806f6a641.jpg', 175.00, 19.04, 9.13, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(701, 'Kue Gandum Pisang', 'https://m.ftscrt.com/static/recipe/892f0def-c5e6-4a4b-a222-a4360823b5bf.jpg', 103.00, 19.26, 3.18, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(702, 'Saus Cokelat', 'https://m.ftscrt.com/static/recipe/c64d9778-3992-4423-ab15-881ac74e3db5.jpg', 78.00, 9.56, 2.12, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(703, 'Sandwich Telur Dadar', 'https://m.ftscrt.com/static/recipe/687f35fe-9dd8-4a41-ab14-216a6bb82647.jpg', 306.00, 7.60, 36.48, 31000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(704, 'Banana Oats Coklat', 'https://m.ftscrt.com/static/recipe/1c8d84c8-e1fe-4f41-a219-748b9855a23d.jpg', 314.00, 45.52, 12.27, 34000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(705, 'Tumis Kubis', 'https://m.ftscrt.com/static/recipe/17dcae94-b8d0-4236-bb60-e9047d920177.jpg', 89.00, 19.17, 3.40, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(706, 'Jus Hijau', 'https://m.ftscrt.com/static/recipe/6643bb15-61b2-4756-b693-8dea455dd8b3.jpg', 61.00, 15.56, 1.26, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(707, 'Kue Oat Pisang', 'https://m.ftscrt.com/static/recipe/228c7014-d4fd-4734-b544-730d107e3c29.jpg', 153.00, 23.24, 4.04, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09');
INSERT INTO `makanan` (`id`, `nama_makanan`, `gambar`, `kalori`, `karbohidrat`, `protein`, `harga`, `level_harga`, `tipe_diet`, `cluster`, `created_at`, `updated_at`) VALUES
(708, 'Kue Pisang Kukus', 'https://m.ftscrt.com/static/recipe/ca663dfd-9a6b-481c-b542-8b6ea05fc64a.jpg', 181.00, 21.89, 4.32, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(709, 'Ayam dengan Jagung dan Kacang', 'https://m.ftscrt.com/static/recipe/52a2791c-02c5-4e19-9e11-a427b4c09d1d.jpg', 200.00, 4.60, 18.28, 14000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(710, 'Sop Tulang Iga Sapi', 'https://m.ftscrt.com/static/recipe/a45f85bd-08a4-44df-b270-dd8125b91e21.jpg', 156.00, 6.75, 10.57, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(711, 'Ikan Tongkol Asam Pedas', 'https://m.ftscrt.com/static/recipe/62115826-a37b-4023-bb93-ca910f630ac2.jpg', 100.00, 1.90, 18.39, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(712, 'Nasi Goreng Sayuran', 'https://m.ftscrt.com/static/recipe/87219099-5033-4aa1-ab15-42c08f893387.jpg', 416.00, 70.19, 15.58, 29000, 'Mahal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(713, 'Rebusan Tahu dengan Kecambah', 'https://m.ftscrt.com/static/recipe/6dc70086-7a21-4ce8-92fc-99919b3cc6d1.jpg', 61.00, 3.65, 4.44, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(714, 'Roti Pisang Havermut', 'https://m.ftscrt.com/static/recipe/3dc75459-6839-4198-af8a-0b38538289c7.jpg', 232.00, 39.64, 7.30, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(715, 'Goreng Labu dengan Jagung', 'https://m.ftscrt.com/static/recipe/9de0f46b-8a8b-4637-ab55-97cee741b46a.jpg', 121.00, 1.00, 19.07, 13000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(716, 'Roti Pisang dan Keju', 'https://m.ftscrt.com/static/recipe/afe8e6f9-9bbd-4e95-98e5-e66c7761b311.jpg', 280.00, 5.00, 4.00, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(717, 'Pancake Protein Oat', 'https://m.ftscrt.com/static/recipe/f9126ab1-2d0c-43f3-b3bc-b71791eae36e.jpg', 86.00, 8.30, 8.57, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(718, 'Brownies Oatmeal', 'https://m.ftscrt.com/static/recipe/6294e676-78fc-40fb-a3d0-91c0fa26b239.jpg', 165.00, 26.59, 4.40, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(719, 'Mangkuk Sushi Salmon', 'https://m.ftscrt.com/static/recipe/99c55dcc-b492-4c67-b37a-b48850cda670.jpg', 792.00, 7.56, 22.58, 24000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(720, 'Salad Sayur dengan Ayam, Tahu, dan Tempe', 'https://m.ftscrt.com/static/recipe/bc7164ab-3020-45ba-8316-2e1858b1cdd7.jpg', 195.00, 9.58, 18.78, 16000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(721, 'Bihun dengan Sayuran', 'https://m.ftscrt.com/static/recipe/60ce6f52-6fd4-4057-941c-b96adbcfd67c.jpg', 242.00, 47.79, 4.35, 17000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(722, 'Nasi Pizza dengan Ayam dan Sayuran', 'https://m.ftscrt.com/static/recipe/5fda7cad-57c6-4c75-a192-59d17405dc2c.jpg', 234.00, 0.50, 19.40, 20000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(723, 'Kari Tuna', 'https://m.ftscrt.com/static/recipe/31e98b8e-c8a1-4fee-9fda-811b9f6b4bde.jpg', 76.00, 2.24, 13.63, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(724, 'Toge Telur', 'https://m.ftscrt.com/static/recipe/feb3a055-9e3c-4740-a8f8-83455953a5f2.jpg', 252.00, 26.73, 21.90, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(725, 'Smoothie Buah Naga dan Pisang', 'https://m.ftscrt.com/static/recipe/628f21a7-c977-4b09-aee5-c6e8d32b6feb.jpg', 280.00, 60.40, 4.98, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(726, 'Bolu Oatmeal Pisang Cokelat', 'https://m.ftscrt.com/static/recipe/ea6ede7e-e208-4388-96c6-e063e8676ae8.jpg', 106.00, 18.69, 2.96, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(727, 'Bolu Tape', 'https://m.ftscrt.com/static/recipe/5d9f2847-9921-4abf-a285-8b711e62be43.jpg', 233.00, 31.30, 4.27, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(728, 'Ayam Rica Rica', 'https://m.ftscrt.com/static/recipe/67c86617-b111-4812-94df-6e196542c596.jpg', 219.00, 5.88, 17.83, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(729, 'Oat Panekuk', 'https://m.ftscrt.com/static/recipe/171ebe49-d320-4eb6-9730-1619d3a136f6.jpg', 54.00, 7.10, 2.44, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(730, 'Sawi Isi Ayam Udang', 'https://m.ftscrt.com/static/recipe/1016de03-9802-40d2-bf4b-1b1ef6784a1c.jpg', 131.00, 9.82, 12.51, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(731, 'Tumis Brokoli', 'https://m.ftscrt.com/static/recipe/2db32a6d-972a-426b-96b5-d7359424ed12.jpg', 79.00, 17.22, 3.49, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(732, 'Omlete Tahu Telur', 'https://m.ftscrt.com/static/recipe/ee89885c-8bf7-440a-872e-b47c2063843f.jpg', 232.00, 2.48, 14.26, 11000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(733, 'Tumis Buncis Tempe', 'https://m.ftscrt.com/static/recipe/a85d2fdc-037e-4bee-826d-fe7b186bbd25.jpg', 111.00, 9.90, 9.50, 18000, 'Normal', 'Vegan', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(734, 'Muesli Simple', 'https://m.ftscrt.com/static/recipe/4459fd35-19db-4855-b723-894f553ec259.jpg', 255.00, 5.80, 42.21, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(735, 'Jus Bokcoy', 'https://m.ftscrt.com/static/recipe/2779ccea-2b1f-4f8a-b913-954c1f3a8985.jpg', 94.00, 2.00, 24.57, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(736, 'Jus', 'https://m.ftscrt.com/static/recipe/63392a2e-5241-45c8-a874-22d0d4d3cd25.jpg', 35.00, 8.58, 0.93, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(737, 'Sandwich', 'https://m.ftscrt.com/static/recipe/6b4d7f9a-b598-4347-aa8e-744550ca847c.jpg', 467.00, 6.10, 38.12, 38000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(738, 'Tumis Tempe Labu Kacang Panjang', 'https://m.ftscrt.com/static/recipe/baba9ac3-cdb9-4f9e-a4cc-dee93bce7057.jpg', 90.00, 7.73, 7.69, 9000, 'Murah', 'Vegan', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(739, 'Tumis Kacang Panjang dan Tauge', 'https://m.ftscrt.com/static/recipe/f9de6871-91cd-488b-a936-24b10b620606.jpg', 90.00, 2.60, 6.11, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(740, 'Beef Patty', 'https://m.ftscrt.com/static/recipe/0b6a6087-907b-4b64-a692-c405b1c31153.jpg', 230.00, 0.20, 6.67, 14000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(741, 'Banana Oat Cookies', 'https://m.ftscrt.com/static/recipe/dc63ff91-5ee7-44c1-8522-6f90335d4f88.jpg', 120.00, 25.29, 2.57, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(742, 'Sawi Tumis', 'https://m.ftscrt.com/static/recipe/cdf3a6c3-0d2e-4b27-9d55-2a0f790347ff.jpg', 53.00, 2.20, 9.09, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(743, 'Tumis Labu Siam', 'https://m.ftscrt.com/static/recipe/14038ad5-00e1-4e1a-bae2-f6dc45e0c713.jpg', 61.00, 4.15, 0.79, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(744, 'Tahu Telur', 'https://m.ftscrt.com/static/recipe/26b7f833-1306-4400-aa9e-073c82593a0e.jpg', 203.00, 3.70, 14.70, 14000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(745, 'Chia Seed Yakult', 'https://m.ftscrt.com/static/recipe/ff24feff-7337-4da6-b94e-11b89d03f5f1.jpg', 154.00, 27.62, 3.64, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(746, 'Dimsum Ayam Udang', 'https://m.ftscrt.com/static/recipe/3706ad65-28e5-420e-85c3-8726c33d1d32.jpg', 50.00, 4.26, 3.70, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(747, 'Oat Cookies', 'https://m.ftscrt.com/static/recipe/5dc5dc35-308a-46a9-a3e7-1e130b98e87b.jpg', 24.00, 0.50, 4.66, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(748, 'Bakso Ayam Oat', 'https://m.ftscrt.com/static/recipe/7115392f-0cb2-45cc-a831-47c62885c2ba.jpg', 197.00, 15.26, 19.25, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(749, 'Dada Ayam Suwir', 'https://m.ftscrt.com/static/recipe/96477924-0da3-447d-b309-dc6323c9ae4a.jpg', 283.00, 22.34, 18.37, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(750, 'Tumis Jamur Daging Brokoli', 'https://m.ftscrt.com/static/recipe/2dbe28b4-3cc3-4b27-9af4-eee3c178fcad.jpg', 79.00, 7.38, 8.39, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(751, 'Kimchi Jiggae', 'https://m.ftscrt.com/static/recipe/ad0a84ed-9643-45d5-b50c-452542def1ab.jpg', 210.00, 5.00, 17.03, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(752, 'Bakso Kentang Fettuccine', 'https://m.ftscrt.com/static/recipe/790ff7ca-0a72-4792-89bd-ecc6a652a4b0.jpg', 343.00, 60.41, 11.64, 26000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(753, 'Healthy Oatmeal Bar', 'https://m.ftscrt.com/static/recipe/6b13981a-a595-4373-81c2-4e373439614e.jpg', 94.00, 13.67, 2.84, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(754, 'Oseng Cabe Tahu Tempe', 'https://m.ftscrt.com/static/recipe/cea1375a-fe97-474b-bfd1-06c7d4fd2b13.jpg', 330.00, 13.50, 40.29, 25000, 'Mahal', 'Vegan', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(755, 'Smoothie Buah Naga', 'https://m.ftscrt.com/static/recipe/d83418c1-ac84-42fa-a9a6-fc4b77004761.jpg', 138.00, 20.28, 3.43, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(756, 'Teriyaki Beef', 'https://m.ftscrt.com/static/recipe/a4c414f5-e832-435f-8e53-8a28a7c2f037.jpg', 366.00, 15.14, 26.71, 22000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(757, 'Tumis Sayur dengan Telur', 'https://m.ftscrt.com/static/recipe/4f548523-4d8b-4d36-b03f-0c5735169f9e.jpg', 379.00, 38.57, 13.47, 33000, 'Premium', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(758, 'Pancake Pisang', 'https://m.ftscrt.com/static/recipe/8f394150-c0ef-468d-bd73-675792cdc67b.jpg', 51.00, 0.70, 10.89, 7000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(759, 'Aglio Olio', 'https://m.ftscrt.com/static/recipe/82f06889-2e66-4ded-a233-81ff7d6863a2.jpg', 292.00, 33.46, 19.20, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(760, 'Sawi Tumis Tauge', 'https://m.ftscrt.com/static/recipe/9678b8f6-279f-402f-93ad-b4b7ac8a4c03.jpg', 91.00, 9.38, 4.84, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(761, 'Bolognese Wrap', 'https://m.ftscrt.com/static/recipe/c0d5ca6f-855d-4bbd-b294-8b17ead6e54d.jpg', 242.00, 4.90, 29.08, 16000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(762, 'Rebusan Ayam Saus Tiram', 'https://m.ftscrt.com/static/recipe/1501c581-d0d2-45cb-8d5f-d9dc2429e094.jpg', 329.00, 21.29, 29.87, 35000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(763, 'Tumis Kecambah', 'https://m.ftscrt.com/static/recipe/dec33b85-e1e7-45d5-9708-f407673d4287.jpg', 95.00, 1.90, 8.14, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(764, 'Tumis Sayuran', 'https://m.ftscrt.com/static/recipe/24c9d481-ed55-4da8-9e6a-8bf9e1937d14.jpg', 80.00, 18.12, 3.48, 9000, 'Murah', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(765, 'Bungkus Salad Ayam', 'https://m.ftscrt.com/static/recipe/32852371-32f7-4ed8-8a3d-84ab80b5098e.jpg', 382.00, 27.10, 33.22, 35000, 'Premium', 'Vegetarian', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(766, 'Ayam Goreng Bumbu Kuning', 'https://m.ftscrt.com/static/recipe/1584852f-c454-4a74-bedd-5990048ad453.jpg', 486.00, 0.00, 2.50, 21000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(767, 'Tahu Lumpia', 'https://m.ftscrt.com/static/recipe/544de650-4934-4528-b236-e183265a968a.jpg', 43.00, 5.28, 2.72, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(768, 'Sup Daging Selada Air', 'https://m.ftscrt.com/static/recipe/357c500a-d89c-4045-ad20-ba5ed87a7d77.jpg', 193.00, 8.91, 17.07, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(769, 'Sambal Bawang', 'https://m.ftscrt.com/static/recipe/d198bade-d96f-4cfd-b17d-c0f97524b241.jpg', 107.00, 7.12, 1.40, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(770, 'Brokoli Bawang Putih', 'https://m.ftscrt.com/static/recipe/09ebf138-010f-461b-8857-36d774e90964.jpg', 190.00, 15.30, 8.03, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(771, 'Spring Roll Ayam', 'https://m.ftscrt.com/static/recipe/eb63a2e9-07c5-4670-9ddd-3f5e668eb6d6.jpg', 119.00, 16.86, 4.11, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(772, 'Suwir Ayam Creamy', 'https://m.ftscrt.com/static/recipe/3b6be690-fd29-4763-ac82-f9c1a1482aa9.jpg', 319.00, 9.50, 44.93, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(773, 'Ampyang', 'https://m.ftscrt.com/static/recipe/4cf1d9c1-92f1-4a67-9452-ddf951404cee.jpg', 132.00, 1.20, 14.47, 12000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(774, 'Semur Tahu', 'https://m.ftscrt.com/static/recipe/4f948cfc-5dc3-4448-9dd5-a4fe7fa1c8de.jpg', 212.00, 32.80, 5.84, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(775, 'Tumis Tahu Telur Wortel', 'https://m.ftscrt.com/static/recipe/bcd9772a-1e28-40c4-b414-6c96127409bb.jpg', 252.00, 39.01, 16.88, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(776, 'Bagel', 'https://m.ftscrt.com/static/recipe/d67fc8b7-0ee1-4717-b81d-b557c840570d.jpg', 233.00, 0.20, 46.76, 18000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(777, 'Tahu Goreng Telur', 'https://m.ftscrt.com/static/recipe/3f634a4d-0188-4752-b68d-37ef262910d3.jpg', 188.00, 6.92, 4.51, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(778, 'Sup Telur Pedas', 'https://m.ftscrt.com/static/recipe/aaf9410c-2cf7-4530-ba5f-c9a7dc34129c.jpg', 382.00, 5.00, 17.04, 22000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(779, 'Cumi Lada Hitam', 'https://m.ftscrt.com/static/recipe/0ffeccac-d8aa-4aef-8ccc-91bd05d5a335.jpg', 107.00, 6.46, 12.17, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(780, 'Bubur Ayam Oatmeal', 'https://m.ftscrt.com/static/recipe/57a453bc-00aa-4394-a089-9028ab09cc1e.jpg', 434.00, 38.34, 35.87, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(781, 'Tumis Tahu dan Tuna', 'https://m.ftscrt.com/static/recipe/d18fe186-d3ef-4e1e-bba6-ff947a09f221.jpg', 313.00, 23.00, 17.90, 27000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(782, 'Bulgogi', 'https://m.ftscrt.com/static/recipe/d5f8b0d9-dadc-45ac-9eb0-6b2b3a7963d3.jpg', 704.00, 65.60, 35.52, 38000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(783, 'Tumis Timun dan Ayam', 'https://m.ftscrt.com/static/recipe/698e30fc-8687-47c1-b7be-529db7f9eea5.jpg', 236.00, 8.93, 10.16, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(784, 'Tumis Kangkung', 'https://m.ftscrt.com/static/recipe/dd44fafb-7c78-4a53-bdf6-b34c952f060e.jpg', 58.00, 1.60, 6.41, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(785, 'Tumis Telur Tahu', 'https://m.ftscrt.com/static/recipe/5ff58275-2317-4e0e-aaee-7ebe45a505a5.jpg', 278.00, 15.09, 26.23, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(786, 'Bubur Ayam Oatmeal', 'https://m.ftscrt.com/static/recipe/458178e5-70b7-4b63-ad16-a0dfc280efe3.jpg', 310.00, 24.33, 34.37, 37000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(787, 'Ayam Saos Tiram', 'https://m.ftscrt.com/static/recipe/7d697424-6c3e-4844-bccd-03e715b618a7.jpg', 669.00, 29.58, 76.66, 39000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(788, 'Spaghetti Gandum dengan Saus Tomat', 'https://m.ftscrt.com/static/recipe/db201b7a-b425-4dfb-9459-ae0083d41ddd.jpg', 252.00, 34.01, 12.42, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:09', '2025-07-13 04:33:09'),
(789, 'Salad Sayur', 'https://m.ftscrt.com/static/recipe/c6e3392f-b02f-444e-a1be-e0625c349c6e.jpg', 134.00, 8.90, 32.69, 18000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(790, 'Green Smoothie', 'https://m.ftscrt.com/static/recipe/1e98265c-fb97-43e5-851a-42575e466f91.jpg', 229.00, 33.68, 6.94, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(791, 'Omlet Bayam', 'https://m.ftscrt.com/static/recipe/d8d89660-924a-4b6b-bb89-eacbe9a22367.jpg', 95.00, 7.55, 7.04, 10000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(792, 'Pakcoy dengan Bawang Putih', 'https://m.ftscrt.com/static/recipe/523a726d-9fdb-4b30-858b-039133c90dc0.jpg', 193.00, 1.50, 14.22, 18000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(793, 'Pokcoy Kuah Pedas', 'https://m.ftscrt.com/static/recipe/a967d6c7-3549-48b3-a1ff-fbf326778bfd.jpg', 348.00, 26.22, 29.26, 34000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(794, 'Tempe Kecap', 'https://m.ftscrt.com/static/recipe/082cfdd8-bbd1-4a46-a40c-e05649259d3a.jpg', 489.00, 6.40, 56.79, 25000, 'Mahal', 'Vegan', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(795, 'Bayam Tumis Tahu', 'https://m.ftscrt.com/static/recipe/5ba3aa97-6cb6-48c3-8f21-d804d4380e40.jpg', 397.00, 11.82, 31.87, 23000, 'Mahal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(796, 'Chicken Teriyaki', 'https://m.ftscrt.com/static/recipe/648b76e6-e4c3-4674-8eb3-eec94d151e5f.jpg', 304.00, 5.20, 32.81, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(797, 'Telor Dadar', 'https://m.ftscrt.com/static/recipe/4a6ed25b-6543-4346-ba67-b72823d626a5.jpg', 246.00, 7.00, 11.04, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(798, 'Sup Tahu Brokoli', 'https://m.ftscrt.com/static/recipe/62115c31-49dd-4fc9-b195-88707c406401.jpg', 158.00, 8.89, 12.05, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(799, 'Bihun Jamur', 'https://m.ftscrt.com/static/recipe/6ba736b9-e389-425f-8ec0-3c22d551956b.jpg', 433.00, 55.15, 25.45, 23000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(800, 'Sup Tofu Telur', 'https://m.ftscrt.com/static/recipe/afcbc87b-2fa3-401c-acfb-008d88fdaaa1.jpg', 503.00, 5.30, 31.92, 36000, 'Premium', 'Vegan', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(801, 'Tempe Goreng', 'https://m.ftscrt.com/static/recipe/d4e86393-78a7-4547-9b27-1b858e29b379.jpg', 25.00, 0.00, 1.30, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(802, 'Smoothies Berry', 'https://m.ftscrt.com/static/recipe/4dce64a2-1910-4c48-9862-4de8f2fb73e1.jpg', 136.00, 26.90, 5.28, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(803, 'Tempe Teriyaki', 'https://m.ftscrt.com/static/recipe/c250a11e-172b-4479-b2b6-1e6985fad605.jpg', 484.00, 51.74, 18.94, 36000, 'Premium', 'Vegan', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(804, 'Tumis Ayam Tahu Telur', 'https://m.ftscrt.com/static/recipe/86c26762-01f2-4a28-904a-6c539f1428e0.jpg', 461.00, 0.30, 4.41, 33000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(805, 'Ayam Teriyaki', 'https://m.ftscrt.com/static/recipe/f4ad1c91-34fa-4fae-ad98-3aa4aa52aa1c.jpg', 167.00, 5.96, 18.38, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(806, 'Oseng Tahu Buncis Telur', 'https://m.ftscrt.com/static/recipe/bd55ba59-2c6d-440e-8641-89ab03a267cc.jpg', 77.00, 4.68, 4.89, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(807, 'Oseng Sawi Telur', 'https://m.ftscrt.com/static/recipe/485db2c7-a339-490b-bf52-18eb66a0229c.jpg', 113.00, 1.60, 9.54, 14000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(808, 'Capcay Toge', 'https://m.ftscrt.com/static/recipe/7b071d87-c929-4812-91ad-b54eca1796d9.jpg', 200.00, 23.42, 20.30, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(809, 'Sup Telur', 'https://m.ftscrt.com/static/recipe/051eed7e-198e-4be3-9de2-397123bddc89.jpg', 187.00, 3.60, 10.99, 15000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(810, 'Spaghetti', 'https://m.ftscrt.com/static/recipe/ec423167-afa7-4b00-a708-b72015a00d3f.jpg', 693.00, 71.94, 44.50, 25000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(811, 'Tempe Tahu Orek', 'https://m.ftscrt.com/static/recipe/5cbb7046-4610-454b-88c4-266719105876.jpg', 5.00, 0.39, 0.18, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(812, 'Tumis Sawi Tahu', 'https://m.ftscrt.com/static/recipe/5d03658d-cdb7-4d13-ad9b-ccf71c349ff2.jpg', 450.00, 13.87, 14.88, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(813, 'Shakshuka', 'https://m.ftscrt.com/static/recipe/fb98f709-9289-43bc-8dc8-4d043c9867d9.jpg', 283.00, 6.30, 31.06, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(814, 'Toast Avocado', 'https://m.ftscrt.com/static/recipe/445eff56-9751-43aa-853f-4b774d8527e9.jpg', 488.00, 39.95, 6.83, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(815, 'Oat Almond Butter Cookies', 'https://m.ftscrt.com/static/recipe/ab505e48-9050-41b8-8f62-c04deef45fdf.jpg', 46.00, 4.41, 1.42, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(816, 'Blueband Biskuit Lunak', 'https://m.ftscrt.com/static/recipe/15f70bba-a2d1-4246-8192-60230f41c011.jpg', 300.00, 32.54, 3.56, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(817, 'Ayam Brokoli Tumis', 'https://m.ftscrt.com/static/recipe/fc638dbc-f534-4535-b9ab-fdf561cfc0a1.jpg', 347.00, 14.47, 27.81, 24000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(818, 'Vegan Cookies', 'https://m.ftscrt.com/static/recipe/58c1a644-41f6-4840-a0f4-173470d7c36a.jpg', 63.00, 9.73, 1.21, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(819, 'Bolu Sagon Kelapa', 'https://m.ftscrt.com/static/recipe/48b49dc1-f0b1-4ef5-95ae-947cfa61814c.jpg', 499.00, 3.90, 41.87, 28000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(820, 'Oatbanana Cookies', 'https://m.ftscrt.com/static/recipe/a83386c8-d69d-453f-9902-e8bd9a463061.jpg', 385.00, 11.90, 71.42, 33000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(821, 'Sup Tomat', 'https://m.ftscrt.com/static/recipe/0447fff8-03f0-40cd-8119-adf1eff5c7d0.jpg', 206.00, 11.35, 20.61, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(822, 'Bihun Rebus', 'https://m.ftscrt.com/static/recipe/ac94cf7f-b1fe-491a-8e5e-0750d86273e0.jpg', 186.00, 31.14, 1.38, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(823, 'Prol Tape Keju', 'https://m.ftscrt.com/static/recipe/40a07461-1480-47ce-939d-f5900d4305e2.jpg', 157.00, 22.65, 2.85, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(824, 'Stim Ikan Ala Chinese', 'https://m.ftscrt.com/static/recipe/caa2bb8c-4308-47f7-b7ab-6e66cc874508.jpg', 134.00, 1.00, 8.14, 16000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(825, 'Tumis Pakcoy', 'https://m.ftscrt.com/static/recipe/d3869313-994b-4cd0-a311-4240bf382cbb.jpg', 30.00, 6.20, 1.22, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(826, 'Banana Oat Cake', 'https://m.ftscrt.com/static/recipe/cca1aae7-25a5-44f4-82f5-994cc3bd51d0.jpg', 322.00, 32.20, 14.40, 24000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(827, 'Pan Sarden Pizza', 'https://m.ftscrt.com/static/recipe/56aaff7a-8c86-435c-92de-a9426be354ec.jpg', 1244.00, 159.81, 54.05, 23000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(828, 'Bibimbap', 'https://m.ftscrt.com/static/recipe/65ff05ea-40ee-4b16-9f63-b1fae2a6e9b5.jpg', 438.00, 67.95, 15.39, 23000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(829, 'Smoothie Buah Naga dan Pisang', 'https://m.ftscrt.com/static/recipe/34e5c4ab-c264-412a-86d3-f6622bc28280.jpg', 144.00, 29.66, 4.18, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(830, 'Sesame Toowoomba Pasta', 'https://m.ftscrt.com/static/recipe/f237cd8c-ec83-4a88-94a0-f621c94ac930.jpg', 588.00, 57.91, 11.83, 33000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(831, 'Ayam Saos Mentega', 'https://m.ftscrt.com/static/recipe/07f8f3c1-43c6-42fc-be78-38528435f587.jpg', 597.00, 0.20, 71.63, 22000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(832, 'Setup Roti Gandum', 'https://m.ftscrt.com/static/recipe/4ec0a828-9f7e-4dd6-a837-5936a699d996.jpg', 183.00, 49.99, 10.40, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(833, 'Oat Goreng Special', 'https://m.ftscrt.com/static/recipe/2a4f137e-1dec-42ef-a579-741d05d8323b.jpg', 812.00, 146.95, 40.91, 36000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(834, 'Vegan Chocolate Strawberry Banana Cake', 'https://m.ftscrt.com/static/recipe/846d26ec-e0cb-47ac-8468-25b5284399d8.jpg', 291.00, 28.06, 6.51, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(835, 'Mie Shirataki Soto', 'https://m.ftscrt.com/static/recipe/22959696-0618-40a3-9704-bef5c7ba88f2.jpg', 307.00, 34.29, 15.30, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(836, 'Omelet Tuna', 'https://m.ftscrt.com/static/recipe/3327f0c5-12b5-4148-ac4d-d59fa79f0461.jpg', 126.00, 1.10, 2.22, 15000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(837, 'Japchae Shirataki', 'https://m.ftscrt.com/static/recipe/454f0499-a2bc-469c-8079-d4bbe2abf1d3.jpg', 56.00, 10.54, 1.60, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(838, 'Pizza Oatmeal Teflon', 'https://m.ftscrt.com/static/recipe/748dfea7-cd04-4884-9afc-acd54ecf762b.jpg', 162.00, 21.38, 7.12, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(839, 'Poires Helena', 'https://m.ftscrt.com/static/recipe/fc61ac59-318e-4d0a-a7da-7ab3afb269d1.jpg', 388.00, 9.10, 68.87, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(840, 'Bayam Jamur', 'https://m.ftscrt.com/static/recipe/0bf344a8-ca9b-47ba-9712-c3c84cccaaeb.jpg', 83.00, 10.44, 5.93, 5000, 'Murah', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(841, 'Gyoza', 'https://m.ftscrt.com/static/recipe/01c35b4f-3dbb-4654-a79b-a94f6d3204da.jpg', 49.00, 4.86, 3.73, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(842, 'Cah Kangkung Ala', 'https://m.ftscrt.com/static/recipe/fc8ee1f0-1f60-4c5a-84ce-c5ca87b0aad7.jpg', 260.00, 4.60, 21.22, 14000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(843, 'Sup Telur Jagung', 'https://m.ftscrt.com/static/recipe/c36b3f65-9f04-4565-91c4-2894d8908415.jpg', 216.00, 5.30, 33.00, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(844, 'NasGor Receh', 'https://m.ftscrt.com/static/recipe/784c037d-2270-42db-bd24-1ff36231581e.jpg', 140.00, 3.70, 22.44, 18000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(845, 'Perdekel Tahu Bawang', 'https://m.ftscrt.com/static/recipe/06ce6870-d0f4-4185-84c8-c051b48e69fc.jpg', 42.00, 0.10, 1.22, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(846, 'Papaya Yogurt with Almonds', 'https://m.ftscrt.com/static/recipe/c4d6d5a1-748e-410b-be66-108c90421d6d.jpg', 210.00, 42.68, 5.52, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(847, 'Chia Puding', 'https://m.ftscrt.com/static/recipe/842333d5-8bac-4305-be0d-b072c04422e7.jpg', 232.00, 10.10, 36.86, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(848, 'Kare Capit Kepiting', 'https://m.ftscrt.com/static/recipe/68de2ec5-a6b6-425e-a6bf-a2cdb3a84b67.jpg', 205.00, 13.20, 26.78, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(849, 'Bubur Manis Oat', 'https://m.ftscrt.com/static/recipe/71d70958-30fd-4f82-8517-b764b62523a6.jpg', 187.00, 34.09, 3.18, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(850, 'Salad Roll', 'https://m.ftscrt.com/static/recipe/9002a438-a88b-46ec-9d7c-9b357b59f7dc.jpg', 183.00, 14.96, 15.18, 12000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(851, 'Ayam Tempe Penyet', 'https://m.ftscrt.com/static/recipe/cfe1c812-5c58-436f-8927-a6416c60dbc2.jpg', 458.00, 31.36, 47.85, 33000, 'Premium', 'Vegan', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(852, 'Tahu Kuping', 'https://m.ftscrt.com/static/recipe/5d6a97d5-c113-4cd5-8051-030aab519b9b.jpg', 65.00, 0.50, 12.09, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(853, 'Tongseng Bango dan Fiber Chreme', 'https://m.ftscrt.com/static/recipe/f71afba1-d46d-4273-b97b-ae8932e53411.jpg', 360.00, 34.11, 36.39, 33000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(854, 'Green Smoothie', 'https://m.ftscrt.com/static/recipe/e12d5b7c-1ebc-4fd8-9c7b-0f4330daa42e.jpg', 146.00, 4.50, 37.33, 13000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(855, 'Smoothie Coklat Pisang', 'https://m.ftscrt.com/static/recipe/b89563c9-0235-41f3-9a44-5ddd69d68722.jpg', 280.00, 60.42, 5.85, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(856, 'Snack Oat', 'https://m.ftscrt.com/static/recipe/fa5ba034-7e24-4f0c-8927-ee5f7fbd6d86.jpg', 26.00, 3.44, 0.73, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(857, 'Salad', 'https://m.ftscrt.com/static/recipe/64343068-e4a2-4315-abb1-61511a7a3f82.jpg', 475.00, 55.72, 10.37, 29000, 'Mahal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(858, 'Bread Puding', 'https://m.ftscrt.com/static/recipe/f6bdcbdd-edb3-444f-87bb-43890db598b0.jpg', 77.00, 10.80, 3.77, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(859, 'Salad Selada Nanas Tomat Cerry', 'https://m.ftscrt.com/static/recipe/88927be0-c6c8-41c4-b82e-9441bdb59263.jpg', 233.00, 2.10, 14.16, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(860, 'Sawi Gulung', 'https://m.ftscrt.com/static/recipe/1f1594f4-7118-4217-a9cb-c4d66e68d39c.jpg', 44.00, 1.62, 4.10, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(861, 'Tahu Kol', 'https://m.ftscrt.com/static/recipe/09b0eaac-f3f8-401a-9b92-31df845d0016.jpg', 20.00, 1.45, 1.58, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(862, 'Dragon Fruit Jelly', 'https://m.ftscrt.com/static/recipe/b1d1cce9-c733-4f35-b103-d114fc65d1f5.jpg', 132.00, 32.45, 1.95, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(863, 'Dimsum Diet', 'https://m.ftscrt.com/static/recipe/a6db4d28-2474-48c7-ac73-f6667b2ee455.jpg', 52.00, 5.90, 3.67, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(864, 'Bakso di Soup', 'https://m.ftscrt.com/static/recipe/30d324ca-bd61-488c-a2e0-7b1b9c075890.jpg', 242.00, 9.99, 20.65, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(865, 'Pancake Naga', 'https://m.ftscrt.com/static/recipe/396bedc0-9fe1-4f59-8c6c-eb12bfb74a26.jpg', 334.00, 48.64, 17.07, 28000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(866, 'Bolu Pisang Oat Kukus', 'https://m.ftscrt.com/static/recipe/a70d08ad-a53f-4c8c-801b-b5556b96f6cf.jpg', 46.00, 8.25, 1.51, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(867, 'Sawi Tahu', 'https://m.ftscrt.com/static/recipe/ec9f6427-a1c8-40b9-b401-3764138fb446.jpg', 246.00, 1.30, 18.60, 14000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(868, 'Tumis Sawi Putih', 'https://m.ftscrt.com/static/recipe/4e52a80a-d7e5-4054-923a-632ded6781d3.jpg', 263.00, 22.48, 10.08, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(869, 'Cauliflower Nasi Goreng', 'https://m.ftscrt.com/static/recipe/16cf7cb1-cfeb-4696-bf81-dbdb98991bee.jpg', 184.00, 23.66, 11.36, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(870, 'Susu Gula Merah Segar Dengan Keju Krim', 'https://m.ftscrt.com/static/recipe/3606e48a-8c24-4e73-932d-7b9d21e66010.jpg', 298.00, 0.00, 18.42, 14000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(871, 'Chicken Tandoori', 'https://m.ftscrt.com/static/recipe/d4f21281-6585-4267-a696-7ef1010da743.jpg', 218.00, 9.05, 17.40, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(872, 'Sushi Telor', 'https://m.ftscrt.com/static/recipe/c5a7c6fb-8c2e-466b-9880-906af2b4098d.jpg', 285.00, 1.50, 46.33, 17000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(873, 'Orange Smoothie', 'https://m.ftscrt.com/static/recipe/47fcd2a6-0688-4652-8848-b85290662597.jpg', 187.00, 47.88, 2.39, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(874, 'Sayur Pokcoy Tahu Telur', 'https://m.ftscrt.com/static/recipe/52f53db6-9b6b-4dbe-b241-ccbb0262f3a0.jpg', 194.00, 2.20, 15.36, 11000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(875, 'Bakmi Goreng Shirataki', 'https://m.ftscrt.com/static/recipe/0aed81a5-92fd-43c4-b97f-2c64ce718d0c.jpg', 140.00, 23.80, 8.94, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(876, 'Klapertart', 'https://m.ftscrt.com/static/recipe/781cce8a-75c1-4d4a-bb92-485a6e77102a.jpg', 176.00, 2.00, 21.01, 17000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(877, 'Cookies Oatmeal', 'https://m.ftscrt.com/static/recipe/99c99845-bd46-4473-902b-e4cb3ea341b0.jpg', 35.00, 1.60, 9.82, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(878, 'Sayur Tumis Sawi Telur', 'https://m.ftscrt.com/static/recipe/20879525-7f81-4dca-a03c-faea7e32fe74.jpg', 130.00, 13.25, 4.66, 13000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(879, 'Bubur Oat', 'https://m.ftscrt.com/static/recipe/912d5461-26e4-451c-961c-d03233c84e77.jpg', 413.00, 38.00, 35.49, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(880, 'Nasi Goreng China', 'https://m.ftscrt.com/static/recipe/d2783c03-6082-46ed-a922-18ddfbef0ffc.jpg', 450.00, 67.20, 14.04, 25000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(881, 'Tumis Wortel Buncis', 'https://m.ftscrt.com/static/recipe/10ecb585-4594-4361-aeae-67740979d72a.jpg', 295.00, 53.60, 10.99, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(882, 'Tumis Ayam Jamur Tempe', 'https://m.ftscrt.com/static/recipe/75000ddf-7b45-4399-a8de-badc6ea3172f.jpg', 662.00, 62.90, 56.15, 23000, 'Mahal', 'Vegan', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(883, 'Ayam Suwir Balado', 'https://m.ftscrt.com/static/recipe/31c80581-c18b-4d36-ba78-3dd0a08a32c4.jpg', 708.00, 112.94, 43.14, 35000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(884, 'Bolu Pisang Kukus', 'https://m.ftscrt.com/static/recipe/cf4ed3b3-3036-4677-94ed-711f6713e9be.jpg', 138.00, 20.56, 3.47, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(885, 'Hot Choco', 'https://m.ftscrt.com/static/recipe/0e117bbc-0df5-428c-8840-63c64c292a32.jpg', 288.00, 21.25, 16.20, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(886, 'Yellow Smoothies', 'https://m.ftscrt.com/static/recipe/745c540c-2619-4fff-889f-34ae372a24f2.jpg', 80.00, 3.30, 21.00, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(887, 'Capcay Ayam Kuah tanpa Minyak', 'https://m.ftscrt.com/static/recipe/ba7e96e2-8277-4905-b4a8-bb56214373dd.jpg', 91.00, 5.52, 13.65, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(888, 'Telur Kukus', 'https://m.ftscrt.com/static/recipe/ab76b9f0-1096-4ab8-bfca-bb33563b69e5.jpg', 230.00, 5.56, 22.64, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(889, 'Bubur Oatmeal Asin', 'https://m.ftscrt.com/static/recipe/a01980be-616d-4107-a203-a94d7b2cf85a.jpg', 223.00, 27.49, 12.26, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(890, 'Kekian Udang', 'https://m.ftscrt.com/static/recipe/d430fd36-3f49-4c7b-b50d-cae272bc8ad9.jpg', 46.00, 1.93, 7.19, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(891, 'Cah Sayur', 'https://m.ftscrt.com/static/recipe/a79b6ace-bec2-474f-ac5c-e8773e3a89cf.jpg', 240.00, 36.44, 20.94, 18000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(892, 'Spaghetti Aglio Olio Bandeng tanpa Minyak', 'https://m.ftscrt.com/static/recipe/d71e2036-a956-4e46-a3bd-860e77aefe9b.jpg', 462.00, 7.20, 65.74, 30000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(893, 'Tumis Sawi Putih', 'https://m.ftscrt.com/static/recipe/d94ad929-9114-4cc0-a9aa-981330df9b33.jpg', 163.00, 8.60, 2.47, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(894, 'Cah Brokoli Ayam', 'https://m.ftscrt.com/static/recipe/3cb3465c-8292-4016-9a11-4c1d711af10a.jpg', 183.00, 4.84, 20.91, 13000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(895, 'Nasi Goreng Tapi Bohong', 'https://m.ftscrt.com/static/recipe/83848c8a-1d58-4e9a-a00c-bc09e0389c9b.jpg', 291.00, 40.05, 6.81, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(896, 'Mini Pancakes', 'https://m.ftscrt.com/static/recipe/123ed72d-c496-4fe0-9c0e-26a9a2b8287b.jpg', 353.00, 4.30, 62.77, 32000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(897, 'Steak Tempe', 'https://m.ftscrt.com/static/recipe/a2ed5362-451f-48e5-b314-f81d6a4c549b.jpg', 135.00, 29.52, 6.21, 19000, 'Normal', 'Vegan', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(898, 'Shirataki Tomato Soup', 'https://m.ftscrt.com/static/recipe/a6235aa8-0fc3-4813-b99a-9a0c93a34218.jpg', 163.00, 21.74, 6.29, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(899, 'Steak Tempe', 'https://m.ftscrt.com/static/recipe/5905c699-0809-4d8c-b364-dac48f954d89.jpg', 992.00, 113.09, 43.39, 21000, 'Mahal', 'Vegan', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(900, 'Capcay', 'https://m.ftscrt.com/static/recipe/22db4992-c520-417a-abaf-397d6bd88f2b.jpg', 363.00, 47.46, 17.07, 39000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(901, 'Sohun Goreng', 'https://m.ftscrt.com/static/recipe/17dd0d3f-746c-4445-9b64-b7f37d23dc82.jpg', 392.00, 44.58, 27.31, 23000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(902, 'Acar Timun Nanas', 'https://m.ftscrt.com/static/recipe/8f354947-ebb2-431b-9e36-29fbe3e23bf5.jpg', 113.00, 28.13, 2.33, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(903, 'Tumis Jamur Kacang Panjang', 'https://m.ftscrt.com/static/recipe/01afd4dc-a355-4305-a878-412d4de54ec4.jpg', 91.00, 19.07, 3.39, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(904, 'Telur Sutera', 'https://m.ftscrt.com/static/recipe/be854e2e-eccc-4c08-9702-b831f1deac1f.jpg', 195.00, 3.60, 22.75, 20000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(905, 'Manggo Sticky Oats', 'https://m.ftscrt.com/static/recipe/fcabcad6-816b-4806-9a6f-e6279895a49d.jpg', 262.00, 48.62, 2.82, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(906, 'Spring Roll', 'https://m.ftscrt.com/static/recipe/e98a016b-1bf7-4053-aeed-74fdb2746a74.jpg', 332.00, 43.24, 10.17, 34000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(907, 'Agar-agar Kukus Coklat', 'https://m.ftscrt.com/static/recipe/3fa2439a-28a0-444a-bc7e-e80426a4c2b9.jpg', 113.00, 16.01, 2.42, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(908, 'Ayam Geprek Low Calori', 'https://m.ftscrt.com/static/recipe/eabdfa03-a087-43f4-8d8c-1bfeca1b297f.jpg', 329.00, 18.10, 26.56, 31000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(909, 'Sup Daging Tahu', 'https://m.ftscrt.com/static/recipe/79fe14e7-521b-4a01-9334-dced8c9d6f70.jpg', 269.00, 22.49, 14.42, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(910, 'Soto Ayam', 'https://m.ftscrt.com/static/recipe/7c98f300-064c-4670-a8b9-27334f534f84.jpg', 121.00, 16.25, 10.64, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(911, 'Oseng Buncis Tempe', 'https://m.ftscrt.com/static/recipe/cd166886-7814-47aa-a887-b63f43cb165b.jpg', 212.00, 6.30, 36.32, 11000, 'Normal', 'Vegan', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(912, 'Nasi Goreng Oatmeal', 'https://m.ftscrt.com/static/recipe/25599d7d-d772-446a-abb6-c9c15f5378b2.jpg', 336.00, 53.09, 7.70, 23000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(913, 'Nasgor Merah', 'https://m.ftscrt.com/static/recipe/c3fa8c42-88d6-40db-8f3b-72ee7b6dcdad.jpg', 322.00, 5.70, 41.06, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(914, 'Mentai Shirataki', 'https://m.ftscrt.com/static/recipe/c070cb47-4325-4c25-bcc0-ec46acff2a7d.jpg', 352.00, 24.27, 2.20, 23000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(915, 'Sundubu jigae ala Indonesia', 'https://m.ftscrt.com/static/recipe/c04c2b45-ead3-41bf-95ac-3044044fa40c.jpg', 218.00, 2.00, 16.82, 14000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(916, 'Ayam Crispy Oatmil', 'https://m.ftscrt.com/static/recipe/a0f3d59b-ae95-44ca-860e-880ed8188266.jpg', 284.00, 14.82, 20.48, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(917, 'Sup Bening', 'https://m.ftscrt.com/static/recipe/9616bc7e-6cbd-469d-9808-01a1c5aa3f1a.jpg', 162.00, 2.50, 22.70, 18000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(918, 'Roti Tawar', 'https://m.ftscrt.com/static/recipe/134a0c2b-3e5d-4fe3-a74e-f415bc70b9a5.jpg', 134.00, 1.40, 21.25, 20000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(919, 'Sup Sehat', 'https://m.ftscrt.com/static/recipe/87288cd6-59e7-4c3a-895c-1c5ee5472a27.jpg', 56.00, 3.00, 4.53, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(920, 'Swallow', 'https://m.ftscrt.com/static/recipe/6d8920e8-7bb1-4a63-97a1-fd01034384ae.jpg', 5.00, 1.98, 0.00, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(921, 'Salad Ayam', 'https://m.ftscrt.com/static/recipe/b31792aa-d36e-470b-9bdb-26204ea4eb05.jpg', 376.00, 41.93, 22.51, 34000, 'Premium', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(922, 'Bolu Cup', 'https://m.ftscrt.com/static/recipe/83f65312-9b0e-438d-8a5e-9a6f722799c4.jpg', 59.00, 0.20, 9.88, 5000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(923, 'Pokcoy Siram Jamur Enoki', 'https://m.ftscrt.com/static/recipe/59a7fc8c-6a05-401f-bbfa-47f263f246c2.jpg', 116.00, 1.70, 5.65, 11000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(924, 'Kue Muesli', 'https://m.ftscrt.com/static/recipe/50ad7400-c810-487d-ba9c-2909754e3567.jpg', 78.00, 1.50, 13.85, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(925, 'Sup Baso Ikan', 'https://m.ftscrt.com/static/recipe/8580b817-a7ad-40a4-b539-36a66c272e7f.jpg', 70.00, 0.40, 7.47, 5000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(926, 'Mie Shirataki', 'https://m.ftscrt.com/static/recipe/efd6cfee-349a-4fbf-a7c3-329f6cab26ff.jpg', 371.00, 36.00, 32.95, 25000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(927, 'Tumis Sawi Tahu', 'https://m.ftscrt.com/static/recipe/457f6fae-1e97-4491-9eaf-fc91cd2a1a2a.jpg', 269.00, 6.30, 25.24, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(928, 'Puding Chia', 'https://m.ftscrt.com/static/recipe/d34542f9-9f42-4bb9-8434-05061c323770.jpg', 76.00, 13.64, 4.54, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(929, 'Milk Tea Chiffon', 'https://m.ftscrt.com/static/recipe/b72547f5-3a55-4933-9e7b-aa209f1a1e5b.jpg', 138.00, 0.20, 15.75, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(930, 'Bakso Tempe', 'https://m.ftscrt.com/static/recipe/781ca47e-8f3f-4cb0-823a-6af901808ea0.jpg', 32.00, 4.02, 1.42, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(931, 'Oseng Tahu', 'https://m.ftscrt.com/static/recipe/a3d44e24-04bd-46fd-a0d8-23d956535cd2.jpg', 231.00, 1.60, 8.76, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(932, 'Makaroni ayam', 'https://m.ftscrt.com/static/recipe/cda3adda-d61a-4ebd-a789-dbef91527d25.jpg', 147.00, 18.83, 8.92, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(933, 'Tahu Telur', 'https://m.ftscrt.com/static/recipe/36b1655d-cc44-4127-9ff1-b056694316f8.jpg', 256.00, 4.50, 25.75, 15000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(934, 'Nasi Goreng', 'https://m.ftscrt.com/static/recipe/5cd27966-6e93-4ebe-a947-e6fee9ccca74.jpg', 206.00, 31.29, 4.09, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(935, 'Nasi Goreng Spesial (Nasi Merah)', 'https://m.ftscrt.com/static/recipe/523b5e66-47cc-4d25-9d68-2ea36e9e8905.jpg', 509.00, 6.40, 42.35, 34000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(936, 'Ampyang', 'https://m.ftscrt.com/static/recipe/dba35161-8174-48bc-92bd-8a0ac29e7e9a.jpg', 170.00, 1.40, 22.24, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(937, 'Omlate Bayam', 'https://m.ftscrt.com/static/recipe/88c11434-9abb-43a5-b451-c0bfc429770e.jpg', 179.00, 6.31, 8.00, 13000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(938, 'Sup Telur', 'https://m.ftscrt.com/static/recipe/1cf89613-1054-4330-b60e-3a62985ecafc.jpg', 204.00, 2.60, 11.90, 13000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(939, 'Seblak Mie Shirataki', 'https://m.ftscrt.com/static/recipe/083a8e80-4c4a-4ae3-9e80-6b98cbbfe311.jpg', 114.00, 11.65, 7.13, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(940, 'Kangkung Tumis', 'https://m.ftscrt.com/static/recipe/412f55e6-de55-4504-b6fe-03a7bf1a7aef.jpg', 450.00, 9.10, 35.27, 22000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(941, 'Steam Fish', 'https://m.ftscrt.com/static/recipe/193b92d4-5b96-4ba1-b64e-7a99bfdb700b.jpg', 310.00, 2.70, 21.32, 28000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(942, 'Sayur Bayam Bening', 'https://m.ftscrt.com/static/recipe/afb0694b-6fc8-4325-9ab7-9fe254bc0b36.jpg', 55.00, 4.80, 9.35, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(943, 'Tumis Tempe Sayur', 'https://m.ftscrt.com/static/recipe/c62978ad-fdd4-4ffb-b3c0-82732599d9d4.jpg', 180.00, 24.44, 11.96, 17000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(944, 'Oat Pisang', 'https://m.ftscrt.com/static/recipe/2c22fed6-9d01-4a23-8ec2-69524b996291.jpg', 162.00, 3.00, 32.95, 17000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(945, 'Brownies Oat', 'https://m.ftscrt.com/static/recipe/1873a361-9cc2-4a58-9b72-94dc14ad402a.jpg', 158.00, 18.53, 2.16, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(946, 'Muffins Pisang', 'https://m.ftscrt.com/static/recipe/df691189-1f14-4951-8438-d499a858afac.jpg', 113.00, 19.50, 7.86, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(947, 'Kue Chiffon', 'https://m.ftscrt.com/static/recipe/b05f9837-76de-4381-870b-aec03a429d31.jpg', 181.00, 0.20, 17.28, 13000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(948, 'Protein Bar Kacang Tanah', 'https://m.ftscrt.com/static/recipe/b6642417-1d25-42ed-9a27-fdf33b2b9812.jpg', 72.00, 8.99, 2.20, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(949, 'Klepon Ubi', 'https://m.ftscrt.com/static/recipe/c86c96cd-71b9-4a9b-aaf7-92d88cfee2f3.jpg', 125.00, 2.00, 30.07, 17000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(950, 'Banana Oatmeal Pancake', 'https://m.ftscrt.com/static/recipe/dbbc47a7-dd6d-4c2f-b4eb-b7a7644b7e53.jpg', 120.00, 18.80, 3.22, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(951, 'Pancake Oat', 'https://m.ftscrt.com/static/recipe/a1abfe56-0808-427f-8d7d-cd9076f52dec.jpg', 203.00, 28.83, 14.69, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(952, 'Tumis Brokoli Udang', 'https://m.ftscrt.com/static/recipe/f0659101-386f-4cea-9bd4-94ba416a4ec7.jpg', 329.00, 4.80, 14.31, 26000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10');
INSERT INTO `makanan` (`id`, `nama_makanan`, `gambar`, `kalori`, `karbohidrat`, `protein`, `harga`, `level_harga`, `tipe_diet`, `cluster`, `created_at`, `updated_at`) VALUES
(953, 'Tumis Oatmeal Dengan Sayur', 'https://m.ftscrt.com/static/recipe/885bc0b8-43e2-4fb5-a3df-80f288546edb.jpg', 273.00, 59.94, 7.10, 13000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(954, 'Sup Labu Energi', 'https://m.ftscrt.com/static/recipe/bdd562de-360f-4958-ac06-efa8f74b18a1.jpg', 249.00, 2.80, 52.28, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(955, 'Tumis Kacang Panjang', 'https://m.ftscrt.com/static/recipe/a5e8e691-c6b8-4203-939f-31e271e11f8a.jpg', 280.00, 2.40, 8.47, 12000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(956, 'Sup Pembakar Lemak', 'https://m.ftscrt.com/static/recipe/a5f44f92-c03d-41e4-8283-1543f3a565c9.jpg', 48.00, 3.10, 9.66, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(957, 'Abon', 'https://img-cdn.medkomtek.com/PbrY9X3ignQ8sVuj_LU9UXljyew=/0x0/smart/filters:quality(75):strip_icc():format(webp)/article/7g8ceHGDNMuttlBcXEl8d/original/099726800_1605161502-Mana-yang-Lebih-Sehat-Abon-Sapi-atau-Abon-Ayam-shutterstock_1361446550.jpg', 280.00, 0.00, 9.20, 15000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(958, 'Abon haruwan', 'https://img-global.cpcdn.com/recipes/cbf330fbd1ba6316/1200x630cq70/photo.jpg', 513.00, 21.30, 23.70, 34000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(959, 'Agar-agar', 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1644389489/attached_image/manfaat-agar-agar-untuk-tubuh.jpg', 0.00, 0.00, 0.00, 5000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(960, 'Akar tonjong segar', 'https://images.tokopedia.net/img/cache/200-square/product-1/2018/8/11/3052608/3052608_12e6762a-1a95-450b-8a7c-347a26dc3201_450_450.jpg', 45.00, 10.80, 1.10, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(961, 'Aletoge segar', 'https://nilaigizi.com/assets/images/produk/produk_1577340236.jpg', 37.00, 3.80, 4.40, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(962, 'Alpukat segar', 'https://katakabar.com/assets/images/upload/news/medium_news_1594438184.jpeg', 85.00, 7.70, 0.90, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(963, 'Ampas tahu kukus', 'https://cdns.diadona.id/diadona.id/resized/640x320/news/2020/02/26/5346/manfaat-ampas-tahu-yang-nggak-boleh-disepelekan-orang-jepang-aja-doyan-masa-kamu-ogah-ogahan-200226f.jpg', 75.00, 10.70, 4.10, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(964, 'Anyang sayur', 'https://static.republika.co.id/uploads/images/inpicture_slide/anyang-_180520222511-425.jpg', 126.00, 10.30, 3.40, 17000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(965, 'Apel', 'https://asset.kompas.com/crops/smfd25xgXRE3HpMLb2aamPeulYM=/21x0:1476x970/1200x800/data/photo/2022/08/30/630d7ae5d041f.jpg', 58.00, 14.90, 0.30, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(966, 'Arbei', 'https://asset.kompas.com/crops/NoCuCvNGfQG6_Ct04e7Vjcabjv4=/204x0:885x454/1200x800/data/photo/2020/06/25/5ef44bb002503.jpg', 37.00, 8.30, 0.80, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(967, 'Ares sayur', 'https://asset-a.grid.id/crop/0x0:0x0/x/photo/2018/07/10/1764115767.jpg', 113.00, 11.20, 0.90, 20000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(968, 'Arrowroot segar', 'https://1.bp.blogspot.com/-frPXLhHsX1o/YGH-vVXAdtI/AAAAAAAAAQc/rFFQBIqzF-sEPYUiGLOUyb-KetyM7haWACLcBGAsYHQ/s2048/IMG20210227100704.jpg', 102.00, 24.10, 1.00, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(969, 'Asam kandis segar', 'https://assets.ladiestory.id/gallery/16768092331084058551-asam-kandis.jpg', 75.00, 16.10, 0.20, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(970, 'Asam payak segar', 'https://nilaigizi.com/assets/images/produk/produk_1537342320.jpg', 135.00, 32.10, 0.80, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(971, 'Asinan Bogor sayuran', 'https://www.piknikdong.com/wp-content/uploads/2021/04/Resep-Asinan-Sayur-Bogor-Sederhana.jpg', 98.00, 14.80, 3.90, 6000, 'Murah', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(972, 'Ayam  goreng Kentuckysayap', 'https://img-global.cpcdn.com/recipes/2ecb088a495ef73a/680x482cq70/ayam-goreng-kentucky-foto-resep-utama.jpg', 297.00, 1.60, 35.90, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(973, 'Ayam ampela goreng', 'https://cdn1-production-images-kly.akamaized.net/MldE3BInsLHr9JgPKFlsYtmbV-E=/0x344:5472x3428/469x260/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3142898/original/027275800_1591175314-shutterstock_188934800.jpg', 270.00, 9.90, 32.30, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(974, 'Ayam goreng church texa sayap', 'https://e7.pngegg.com/pngimages/66/902/png-clipart-church-s-chicken-bakery-chicken-nugget-fried-chicken-texas-chicken-church-s-chicken-bakery-thumbnail.png', 295.00, 1.50, 34.00, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(975, 'Ayam goreng church texas dada', 'https://i0.wp.com/harga.web.id/wp-content/uploads/Harga-Texas-Chicken-Reguler-dan-Promo.jpg?fit=680%2C300&ssl=1', 338.00, 0.40, 35.20, 36000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(976, 'Ayam goreng kalasan paha', 'https://thumb.viva.id/intipseleb/1265x711/2022/10/21/6352aa183c0c1-resep-ayam-goreng-kalasan.jpg', 275.00, 1.30, 37.40, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(977, 'Ayam goreng kentucky dada', 'https://awsimages.detik.net.id/community/media/visual/2021/07/07/kirim-pesan-unik-kfc-2_43.jpeg?w=1200', 298.00, 0.10, 34.20, 17000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(978, 'Ayam goreng Kentucky paha', 'https://img-global.cpcdn.com/recipes/d61db7c7021bcd27/680x482cq70/paha-kentucky-yummy-foto-resep-utama.jpg', 286.00, 1.10, 32.10, 16000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(979, 'Ayam goreng pioneer dada', 'https://d1sag4ddilekf6.cloudfront.net/compressed_webp/items/IDITE20210726121341017693/detail/menueditor_item_428cb0ea19e44146a00e1cfbef85faae_1627524568218570621.webp', 295.00, 0.60, 37.40, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(980, 'Ayam goreng sukabumi dada', 'https://i0.wp.com/i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/d5baa5ea-bad6-4cc6-b6fe-a0c4a9a86979_Go-Biz_20211222_160332.jpeg', 244.00, 1.00, 36.70, 11000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(981, 'Ayam goreng sukabumi paha', 'https://i0.wp.com/i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/60ef5b81-53d7-4375-a9a3-b7eb2aed3b2a_master-menu-item-image_1597233742745.jpg?resize=728%2C500', 283.00, 0.50, 35.70, 17000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(982, 'Ayam taliwang masakan', 'https://asset.kompas.com/crops/-oAqlkfrKHaqebhytdtKz-JV6ls=/4x0:1000x664/750x500/data/photo/2020/12/22/5fe16c7655542.jpg', 264.00, 2.70, 18.20, 16000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(983, 'Ayam usus goreng', 'https://img-global.cpcdn.com/recipes/fa7c9443ce9efcb5/1200x630cq70/photo.jpg', 473.00, 13.90, 45.20, 26000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(984, 'Babat', 'https://awsimages.detik.net.id/community/media/visual/2022/05/26/resep-bacem-babat-sapi.jpeg?w=1200', 113.00, 0.00, 17.60, 14000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(985, 'Bacang', 'https://cdn1-production-images-kly.akamaized.net/dmeIqjoEQPYVHvwOwc32D8B7EcI=/1200x675/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1495067/original/082497700_1486023784-bacang-fsui_wodpress.jpg', 102.90, 16.30, 3.30, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(986, 'Bagea kelapa asin', 'https://resepkoki.id/wp-content/uploads/2018/02/Resep-Kue-Bagea.jpg', 450.00, 78.10, 3.20, 31000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(987, 'Bagea kelapa manis', 'https://s3.theasianparent.com/tap-assets-prod/wp-content/uploads/sites/24/2022/03/kue-bagea-featured-650x339.jpg', 452.00, 80.60, 1.30, 31000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(988, 'Bagea kenari asin', 'https://images.tokopedia.net/img/cache/700/hDjmkQ/2021/10/4/73219f10-0149-4af7-b1ca-c51d90ca767b.jpg', 529.00, 63.60, 3.20, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(989, 'Bagea kenari manis', 'https://indonesiakaya.com/wp-content/uploads/2020/10/1__IMG_0796_CROP_Renyah_gurih_dan_manis_begitulah_kira-kira_gambaran_saat_mencicipi_kue_bagea_khas_Sulawesi_Utara.jpg', 523.00, 64.20, 3.20, 40000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(990, 'Baje', 'https://cf.shopee.co.id/file/91afb76cc87856ee341c0ee5970d66a9', 129.00, 15.60, 1.90, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(991, 'Bakpia kue', 'https://asset.kompas.com/crops/BZ6Z25Y0XcjtoHBInh10nGsMM2Q=/3x0:700x465/750x500/data/photo/2021/03/17/60514d8851d3e.jpeg', 272.00, 44.10, 8.70, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(992, 'Bakso ', 'https://asset.kompas.com/crops/x6OULHa8pMi47UnvDTzf1j62ov4=/3x0:700x465/750x500/data/photo/2022/08/25/6306b48bb80a1.jpeg', 76.00, 9.20, 4.10, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(993, 'Bakwan', 'https://i0.wp.com/resepkoki.id/wp-content/uploads/2019/04/Resep-Bakwan-Jagung-1.jpg?fit=1749%2C1920&ssl=1', 280.00, 39.00, 8.20, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(994, 'Batatas kelapa ubi bakar', 'https://img-global.cpcdn.com/recipes/95d754afdf8eb1f2/1200x630cq70/photo.jpg', 110.00, 23.40, 1.40, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(995, 'Batatas kelapa ubi kukus', 'https://img-global.cpcdn.com/recipes/9f91679fd1ba49f0/680x482cq70/singkong-kukus-toping-kelapa-parut-foto-resep-utama.jpg', 92.00, 21.00, 1.20, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(996, 'Batatas tali ubi rebus', 'https://img-global.cpcdn.com/recipes/f9664da25cda52e4/1200x630cq70/photo.jpg', 182.00, 42.20, 2.40, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(997, 'Bawang Bombay', 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1621837004/attached_image/berbagai-nutrisi-di-balik-manfaat-bombay.jpg', 45.00, 10.30, 1.40, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(998, 'Bawang Merah', 'https://cdn.shopify.com/s/files/1/0369/8321/0116/products/015_640x.jpg?v=1646380408', 39.00, 0.20, 1.50, 7000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(999, 'Bawang Putih', 'https://www.astronauts.id/blog/wp-content/uploads/2022/11/Manfaat-Bawang-Putih-Untuk-Kulit-yang-Tidak-Banyak-Tahu.jpg', 95.00, 23.10, 4.50, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1000, 'Bayam kukus', 'https://img-global.cpcdn.com/recipes/ff942e133f5dc64e/680x482cq70/bayam-kukus-foto-resep-utama.jpg', 30.00, 5.80, 1.30, 8000, 'Murah', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1001, 'Bayam Merah', 'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/10/15060945/manfaat-bayam-merah-yang-jarang-diketahui-halodoc.jpg', 51.00, 10.00, 4.60, 8000, 'Murah', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1002, 'Bayam rebus', 'https://img-global.cpcdn.com/recipes/5be8dc1e0002f811/1200x630cq70/photo.jpg', 23.00, 3.70, 1.20, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1003, 'Bayam tumis + oncom', 'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1601173915/chhxzj6dnkwkryigiyrl.jpg', 102.00, 6.90, 3.70, 12000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1004, 'Bayam tumis bersantan', 'https://img.kurio.network/FnRZ04iY18q6h7oJzzZDFZOD5Zk=/1200x1200/filters:quality(80)/https://kurio-img.kurioapps.com/21/04/07/2ab69e8a-370d-460a-89ac-0efadafee196.jpe', 48.00, 2.60, 1.40, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1005, 'Bebek alabio daging segar', 'https://medioenblog.files.wordpress.com/2018/02/bebek.jpg', 303.00, 3.70, 11.30, 20000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1006, 'Bebek daging goreng', 'https://asset.kompas.com/crops/y8jlET9Zwl-5iykdc5t58sS-_KY=/0x52:1000x719/750x500/data/photo/2020/07/14/5f0d253a6edd5.jpg', 300.00, 4.50, 24.00, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1007, 'Beef burger', 'https://cdn.id9.site/burgerax/media/2020/09/beef-burger-e1644156606108.jpeg', 258.00, 32.50, 10.60, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1008, 'Beef teriyaki masakan', 'https://www.masakapahariini.com/wp-content/uploads/2020/12/resep-beef-teriyaki-2-500x300.jpg', 151.00, 22.30, 8.60, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1009, 'Beef yakiniku masakan', 'https://asset.kompas.com/crops/awoHyKStB8lI_yqs1PTI3VjIHsE=/78x42:958x629/750x500/data/photo/2022/12/08/6391613d09412.jpg', 132.00, 20.70, 9.80, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1010, 'Belibis daging segar', 'https://assets.tokko.io/2bbdc42e-f0c6-494e-ae09-9d177af2ec61/products/images/cc352d35-2818-45ed-9a63-03f4fbd2247b', 131.00, 2.80, 20.20, 16000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1011, 'Belimbing', 'https://cdn0-production-images-kly.akamaized.net/vVBJG9Flt0ncPec4-hGyZftu4og=/1200x900/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2778801/original/086460500_1556885614-belimbing.jpg', 36.00, 8.80, 0.40, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1012, 'Belut goreng', 'https://asset.kompas.com/crops/EIwKgK9ZA21scjpbrA9zMJehUIU=/100x67:900x600/750x500/data/photo/2021/03/23/6059483f259e2.jpeg', 417.00, 32.00, 25.90, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1013, 'Belut segar', 'https://cdn0-production-images-kly.akamaized.net/dzEIf_Zb-p6ktRAywNdWHoTH5Wg=/1200x900/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2760114/original/080217400_1553484954-Cara_budidaya_belut.jpg', 70.00, 1.00, 14.60, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1014, 'Bengkuang', 'https://jovee.id/wp-content/uploads/2020/11/shutterstock_1830526784.jpg', 55.00, 12.80, 1.40, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1015, 'Bentul talas kukus', 'https://i.ytimg.com/vi/zJ9Rg_MIGfY/maxresdefault.jpg', 71.00, 15.40, 2.30, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1016, 'Bihun', 'https://ik.imagekit.io/dcjlghyytp1/2020/03/curry-1609780_1920.jpg?tr=f-auto', 360.00, 82.10, 4.70, 38000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1017, 'Bihun Goreng ', 'https://img.kurio.network/ZxAfF4qJQbpTcsTwVZ5fxE-8_no=/1200x1200/filters:quality(80)/https://kurio-img.kurioapps.com/21/10/17/f29f0fe9-7b93-498a-a6fe-2e0abc82e509.jpe', 154.00, 25.50, 3.00, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1018, 'Bihun goreng instan', 'https://img-global.cpcdn.com/recipes/98b4c2fca1b1e699/1200x630cq70/photo.jpg', 381.00, 80.30, 6.10, 39000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1019, 'Bihun Jagung mentah', 'https://cdn.idntimes.com/content-images/post/20190917/ts3-afd6374f037588e5b1267149563c6ce7.jpg', 354.00, 87.40, 0.50, 37000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1020, 'Biji Jambu Mete goreng', 'https://jovee.id/wp-content/uploads/2020/09/KACANGMEDE.jpg', 629.00, 19.80, 21.50, 26000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1021, 'Biji nangka/Biji salak', 'https://img-global.cpcdn.com/recipes/0df60642ab5496ab/680x482cq70/122-biji-salak-ber-nangka-foto-resep-utama.jpg', 262.00, 51.10, 2.30, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1022, 'Bika Ambon ', 'https://kurio-img.kurioapps.com/21/08/09/550ddc82-8004-49fe-a427-197fead4eec3.jpe', 225.70, 52.90, 3.00, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1023, 'Biskuit', 'https://s4.bukalapak.com/bukalapak-kontenz-production/content_attachments/57314/original/main_merek_biskuit_enak_shutterstock.jpg', 458.00, 75.10, 6.90, 28000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1024, 'Bit', 'https://static.honestdocs.id/system/blog_articles/main_hero_images/000/002/304/original/14_Manfaat_Buah_Bit_Bagi_Kesehatan_Tubuh.jpg', 42.00, 9.60, 1.60, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1025, 'Biwah segar', 'https://cdn.idntimes.com/content-images/community/2019/07/big-1358231-960-720-8ba3de334ccaf29bc9502faa35dd8283_600x400.jpg', 51.00, 12.10, 0.30, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1026, 'Buah Mentega (bisbul)', 'https://cdns.klimg.com/merdeka.com/i/w/news/2020/07/07/1195681/content_images/670x335/20200707152852-1-ilsutrasi-buah-mentega-atau-bisbul-002-nurul-diva-kautsar.jpg', 39.00, 9.70, 0.70, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1027, 'Buah Naga Merah segar', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//85/MTA-51432240/no-brand_buah-naga-merah-segar-fresh-1-pcs_full01.jpg', 71.00, 9.10, 1.70, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1028, 'Buah Naga Putih segar', 'https://cf.shopee.co.id/file/957f1f3ed49275a0fe2f2d9ac37524e4', 56.00, 10.90, 0.80, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1029, 'Buah negri segar', 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1648442001/attached_image/manfaat-buah-markisa-yang-perlu-anda-ketahui.jpg', 55.00, 12.20, 1.20, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1030, 'Buah Nona', 'https://www.pantau.com/wp-content/uploads/2022/04/191111044328-buah-nona-buah-langka-yang-memiliki-segundang-manfaat-bagi-kesehatan.jpg', 101.00, 25.20, 1.70, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1031, 'Bubur ', 'https://awsimages.detik.net.id/community/media/visual/2021/12/13/resep-bubur-ayam-cincang_43.jpeg?w=1200', 60.00, 13.00, 1.00, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1032, 'Bubur sagu', 'https://img-global.cpcdn.com/recipes/541f0543f5b40b2a/680x482cq70/bubur-sagu-foto-resep-utama.jpg', 167.00, 33.00, 0.20, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1033, 'Bubur tinotuan (Manado)', 'https://asset.kompas.com/crops/8IPl4RcIfLh3fkwXhKHPuPHqoz8=/81x22:892x563/750x500/data/photo/2020/05/13/5ebbdec618a37.jpg', 156.00, 15.60, 2.30, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1034, 'Bulgogi masakan', 'https://asset.kompas.com/crops/MGdiKvcc-R0j5purun8FmiLeX_U=/0x0:0x0/750x500/data/photo/2020/12/23/5fe2c9413a6ce.jpg', 72.00, 1.40, 11.40, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1035, 'Buncis', 'https://medicillin.com/admin/upload/images/information/584770af1e043.png', 35.00, 7.70, 2.40, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1036, 'Buncis rebus', 'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2022/11/15080206/selain-enak-ini-manfaat-buncis-rebus-yang-baik-untuk-kesehatan-halodoc.jpg', 30.00, 6.40, 2.20, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1037, 'Bungkil Kacang Tanah', 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/10/20/34e1ca8b-cb9d-46ae-8088-0c9ea431f9f6.jpg', 336.00, 30.50, 37.40, 34000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1038, 'Bungkil Kelapa', 'https://images.tokopedia.net/img/cache/700/hDjmkQ/2022/1/29/4e91f29e-92d7-4178-a7d2-774f994714e1.jpg', 368.00, 40.00, 23.00, 36000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1039, 'Buntil ', 'https://asset.kompas.com/crops/vCayyRtg4fGtL3Y9EnpXrWr_TIw=/3x0:700x465/750x500/data/photo/2021/02/08/6020e623372b3.jpg', 106.00, 7.90, 4.40, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1040, 'Buntil daun talas', 'https://i0.wp.com/borobudurnews.com/wp-content/uploads/2021/05/buntil-daun-talas-khas-Magelang.jpg?fit=979%2C579&ssl=1', 141.00, 8.00, 4.40, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1041, 'Buras ', 'https://www.masakapahariini.com/wp-content/uploads/2022/06/resep-buras.jpg', 125.70, 23.90, 3.30, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1042, 'Caisin segar', 'https://images.tokopedia.net/img/cache/700/product-1/2020/4/5/5400804/5400804_d23967b7-039f-4904-97d8-6a303aae6628_1051_1051.jpg', 20.00, 3.40, 1.70, 7000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1043, 'Cakalang asap', 'https://indonesiakaya.com/wp-content/uploads/2020/10/Ikan_Asar_yang_sudah_matang_dan_siap_untuk_disajikan_atau_diolah_lagi_.jpg', 155.00, 10.20, 20.10, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1044, 'Cake tape', 'https://resepkoki.id/wp-content/uploads/2016/12/Resep-Bolu-Tape.jpg', 323.00, 50.10, 4.90, 23000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1045, 'Cap cai sayur', 'https://awsimages.detik.net.id/community/media/visual/2021/12/25/resep-capcay-kuah-kental.jpeg?w=1200', 97.00, 4.20, 5.80, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1046, 'Cempedak', 'https://images.genpi.co/uploads/kalbar/arsip/normal/2022/07/15/buah-cempedak-foto-istockphotocom-n3j5.jpg', 116.00, 28.60, 3.00, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1047, 'Chicken teriyaki masakan', 'https://img-global.cpcdn.com/recipes/ff7dc38da72458fa/680x482cq70/ayam-teriyaki-ala-hokben-foto-resep-utama.jpg', 168.00, 7.50, 13.00, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1048, 'Chikiniku masakan', 'https://drive.google.com/file/d/1LZOGoU3M3XcPbU5_HaAZ26ybCTbiTXpT/view?usp=sharing', 143.00, 22.80, 9.80, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1049, 'Combro ', 'https://assets.suaramerdeka.com/crop/7x38:699x495/750x500/webp/photo/2021/11/01/2899515089.jpg', 210.00, 35.80, 1.60, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1050, 'Corned Beef', 'https://www.jessicagavin.com/wp-content/uploads/2023/03/corned-beef-hash-15-1200.jpg', 241.00, 0.00, 16.00, 17000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1051, 'Cumi-cumi goreng', 'https://i0.wp.com/resepmasakandapurarie.com/wp-content/uploads/2014/09/Resep-Cumi-Goreng-Tepung-Crispy-.jpg', 265.00, 0.00, 40.60, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1052, 'Daging Asap', 'https://asset.kompas.com/crops/hysnw0J-U1aA8CzBNW5j_uEC3s8=/0x476:1080x1196/750x500/data/photo/2022/03/22/6239bc36b14f4.jpg', 191.00, 0.00, 32.00, 16000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1053, 'Daun Bawang', 'https://asset.kompas.com/crops/u8jpueVME4sJk32KP-0Rnjg9o1I=/479x0:1500x681/750x500/data/photo/2022/05/07/6275586c1ce7d.jpg', 29.00, 5.20, 1.80, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1054, 'Daun Kacang Panjang kukus', 'https://img-global.cpcdn.com/recipes/4ec6b371c573cabe/680x482cq70/sayur-bobor-lembayung-daun-kacang-panjang-foto-resep-utama.jpg', 40.00, 8.00, 3.70, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1055, 'Daun katuk rebus', 'https://img-global.cpcdn.com/recipes/68161cf2088797fc/680x482cq70/rebus-daun-katuk-foto-resep-utama.jpg', 53.00, 9.10, 5.30, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1056, 'Daun Kelor rebus', 'https://img-global.cpcdn.com/recipes/ed600b784cb28839/680x482cq70/daun-kelor-rebus-foto-resep-utama.jpg', 61.00, 10.00, 6.10, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1057, 'Daun Kemangi', 'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/11/01025747/ini-4-manfaat-daun-kemangi-yang-jarang-diketahui-halodoc.jpg', 46.00, 8.90, 4.00, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1058, 'Daun kol sawi segar', 'https://asset.kompas.com/crops/MsuwGORqaxVW-qpj97DoEK4RTLs=/293x0:1145x568/780x390/data/photo/2021/09/27/61517629bbd33.jpg', 22.00, 3.60, 2.10, 5000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1059, 'Daun kubis segar', 'https://nilaigizi.com/assets/images/produk/produk_1599051215.jpg', 51.00, 8.00, 2.50, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1060, 'Daun Labu Siam', 'https://aksikata.com/wp-content/uploads/2019/05/daun-labu-siam.jpg', 60.00, 4.70, 4.00, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1061, 'Daun Labu Waluh', 'https://www.parenting.co.id/img/images/B1.jpg', 30.00, 4.50, 3.60, 7000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1062, 'Daun Melinjo', 'https://goleksayur.com/data/images/product/IMG10160.jpg', 99.00, 21.30, 5.00, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1063, 'Daun Pakis', 'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2022/11/11085513/Jarang-Diketahui-Ini-X-Manfaat-Sayur-Pakis-bagi-Kesehatan.jpg', 35.00, 6.40, 4.00, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1064, 'Daun Singkong', 'https://s3-publishing-cmn-svc-prd.s3.ap-southeast-1.amazonaws.com/article/k6oXuilGJwEixYI9s0ubT/original/043951600_1631871725-Berbagai_Manfaat_Daun_Singkong_untuk_Kesehatan_Anda.jpg', 73.00, 13.00, 6.80, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1065, 'Daun Singkong lodeh', 'https://asset.kompas.com/crops/mxv9DRtBdiPbq6Lb9lPvPEn4Mtk=/0x0:1000x667/750x500/data/photo/2020/10/21/5f8f3ec62aee7.jpg', 55.00, 8.50, 4.00, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1066, 'Daun Singkong rebus', 'https://img-global.cpcdn.com/recipes/0aba29b97a7b109f/680x482cq70/daun-singkong-rebus-ala-rm-padang-foto-resep-utama.jpg', 31.00, 4.80, 3.70, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1067, 'Daun talas rebus', 'https://archive.netralnews.com/foto/2020/04/13/76-daun_talas_sangat_lezat_dibuat_masakan_buntil.jpg', 27.00, 5.90, 1.30, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1068, 'Daun Ubi Jalar kukus', 'https://cdnimage2.caping.co.id/news/20220228/2a/1619199045A782A517.jpg_480A0A1A80.webp', 56.00, 13.00, 3.10, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1069, 'Daun ubi merah kukus', 'https://cdn1-production-images-kly.akamaized.net/53ShO_wlxOo4hIuWjKZKBK2QLvQ=/469x260/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2580229/original/025700500_1546586996-resep-tumis-daun-ubi-jalar.jpg', 56.00, 13.00, 3.10, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1070, 'Dendeng belut goreng', 'https://selerasa.com/wp-content/uploads/2015/11/images_dendeng-belut.JPG', 382.00, 8.00, 55.70, 31000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1071, 'Dendeng Daging Sapi', 'https://awsimages.detik.net.id/community/media/visual/2022/02/20/resep-dendeng-sapi-medan_43.jpeg?w=700&q=90', 433.00, 0.00, 55.00, 22000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1072, 'Dendeng mujahir goreng', 'https://img-global.cpcdn.com/recipes/c49ebd05c391ae54/680x482cq70/dendeng-mujair-foto-resep-utama.jpg', 598.00, 9.20, 74.30, 37000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1073, 'Dideh darah ayam', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh9d4T1r7jHqSELzd2b3KBFeJlzKWtbaUIbOrsHTyKYSr_SJvpO2EijjASugjDKlv0-WhFvsRpcskdPJx95G3cpox3XJVzjTbDJQaISa_egWAzjYl3Cd8Zb0hXWGcIGj8KavQ37Uu6qRvTtob_G9TAIxgfhI4Xz2yKfM_PuI3PixHmXXHJySQ70I4e9dQ/s600/dideh.jpg', 77.00, 0.70, 13.80, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1074, 'Dideh darah sapi', 'https://cdns.diadona.id/diadona.id/resized/640x320/news/2020/09/29/23311/664xauto-banyak-digemari-kuliner-asal-indonesia-ini-ternyata-terbuat-dari-darah-hewan-200929c.jpg', 104.00, 0.00, 21.90, 14000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1075, 'Djibokum masakan', 'https://drive.google.com/file/d/1LZOGoU3M3XcPbU5_HaAZ26ybCTbiTXpT/view?usp=sharing', 248.00, 40.90, 10.00, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1076, 'Dodol', 'https://asset.kompas.com/crops/e3JycmGm1r9fr7krT-Kj-p7R3m0=/32x18:1000x664/750x500/data/photo/2023/03/03/64014f11134b7.jpeg', 395.00, 81.20, 3.00, 38000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1077, 'Duku', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Duku_Lansium_domesticum_Ripe.jpg/1200px-Duku_Lansium_domesticum_Ripe.jpg', 63.00, 16.10, 1.00, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1078, 'Durian', 'https://asset-a.grid.id/crop/0x0:0x0/x/photo/2023/01/20/alasan-mengapa-buah-durian-diseb-20230120035049.jpg', 134.00, 28.00, 2.50, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1079, 'Eceng Gondok', 'https://unair.ac.id/wp-content/uploads/2022/11/Foto-by-detikFood.jpeg', 18.00, 3.80, 1.00, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1080, 'Embacang', 'https://s0.bukalapak.com/img/037360101/large/144135_2embacang.jpg', 98.00, 25.40, 1.40, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1081, 'Empal (daging) Goreng masakan', 'https://cdn-2.tstatic.net/batam/foto/bank/images/resep-empal.jpg', 248.00, 10.10, 36.20, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1082, 'Emping (kerupuk melinjo)', 'https://cdns.klimg.com/merdeka.com/i/w/news/2020/09/24/1224077/540x270/cara-membuat-emping-melinjo-yang-gurih-dan-renyah-mudah-dipraktikkan.jpg', 345.00, 71.50, 12.00, 38000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1083, 'Es krim', 'https://cdn0-production-images-kly.akamaized.net/HfkjSnesMVgDaS0dVGBUFFN6sZw=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2769420/original/063670200_1554367843-birthday-break-caramel-461430.jpg', 210.00, 20.60, 4.00, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1084, 'Es Krim (Coconut milk) ', 'https://cdn.nutritioninthekitch.com/wp-content/uploads/2022/03/Coconut-ice-cream-5-800x1184.jpg', 156.70, 32.70, 3.00, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1085, 'Es Sirup ', 'https://cdn.yummy.co.id/content-images/images/20220619/xfaVB26SMb4zm5RAt72MsKdSiArIkWyc-31363535363231363533d41d8cd98f00b204e9800998ecf8427e.jpg?x-oss-process=image/resize,w_388,h_388,m_fixed,x-oss-process=image/format,webp', 44.80, 11.30, 0.00, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1086, 'Fillet o-fish', 'https://www.recipetineats.com/wp-content/uploads/2018/08/Homemade-Filet-O-Fish_3.jpg', 270.00, 19.30, 12.30, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1087, 'Gado-gado', 'https://img.kurio.network/rlKzeW_1_iLZ-JMm9fFHX-rGdIE=/1200x1200/filters:quality(80)/https://kurio-img.kurioapps.com/22/06/22/53264347-b7ba-4257-852d-04e3d1b4e4e5.jpe', 137.00, 21.00, 6.10, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1088, 'Gadung kukus', 'https://img-global.cpcdn.com/recipes/51c229856c44e39a/680x482cq70/gadung-kukus-foto-resep-utama.jpg', 88.00, 20.90, 0.80, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1089, 'Gadung ubi kukus', 'https://img-global.cpcdn.com/recipes/51c229856c44e39a/1200x630cq70/photo.jpg', 88.00, 20.90, 0.60, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1090, 'Gambas (Oyong)', 'https://static.honestdocs.id/system/blog_articles/main_hero_images/000/001/679/original/15_Manfaat_Sayur_Gambas_%28Oyong%29_Bagi_Kesehatan.jpg', 18.00, 4.10, 0.80, 7000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1091, 'Gambas lodeh', 'https://cdn.yummy.co.id/content-images/images/20210411/n8JWL5o9Saqut50aP4W9cCHqob98nCg8-31363138313239343736d41d8cd98f00b204e9800998ecf8427e.jpg?x-oss-process=image/resize,w_388,h_388,m_fixed,x-oss-process=image/format,webp', 13.00, 1.60, 0.30, 7000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1092, 'Ganyong kukus', 'https://pbs.twimg.com/media/FaAqu9paIAEm13B?format=jpg&name=4096x4096', 100.00, 23.80, 0.80, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1093, 'Ganyong rebus', 'https://assets-a1.kompasiana.com/items/album/2019/11/18/fb-img-1574037281653-5dd1e7e2d541df7e5258fdc2.jpg', 100.00, 23.80, 0.80, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1094, 'Genjer segar', 'https://images.tokopedia.net/img/cache/700/product-1/2020/5/15/7845717/7845717_a5118472-420f-4bf5-a311-ff8401926d6d_1000_1000.jpg', 35.00, 7.70, 1.70, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1095, 'Geplak jahe', 'https://id-live-01.slatic.net/p/e9d3d5c495903bfc0909965e77c210ad.jpg', 462.00, 57.70, 3.10, 32000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1096, 'Gete kuah asam masakan', 'https://nilaigizi.com/assets/images/produk/produk_1535785356.jpg', 75.00, 6.00, 8.20, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1097, 'Getuk goreng', 'https://resepkoki.id/wp-content/uploads/2016/03/Resep-Getuk-goreng.jpg', 360.00, 74.30, 1.30, 37000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1098, 'Getuk pisang', 'https://asset.kompas.com/crops/l3xnQh1pGb-JXXnQlqwMVzdfRMo=/0x0:1000x667/750x500/data/photo/2022/12/25/63a7a3ef59ddd.jpeg', 144.00, 34.10, 1.10, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1099, 'Getuk singkong', 'https://images.tokopedia.net/img/KRMmCm/2022/8/9/d04d11c4-f1e5-4595-8166-a53955b475ca.jpg', 204.00, 47.40, 0.50, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1100, 'Gudeg ', 'https://cdn1-production-images-kly.akamaized.net/IpYTbngk7MSDqY-O2zh-l35oxxs=/1200x1200/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/776636/original/012158200_1417956101-gudeg.jpg', 53.00, 8.80, 1.60, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1101, 'Gudeg sayur', 'https://1.bp.blogspot.com/-dubLmtxl4XI/V9NzynrpH4I/AAAAAAAAZTY/Mh8U8r2Fy58EWteb0ARFDyZWj7Wot4n0ACLcB/s1600/A%2BGUDEG%2BBASAH%2BIG.jpg', 160.00, 16.00, 3.30, 12000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1102, 'Gulai asam keueung masakan', 'https://img-global.cpcdn.com/recipes/8f989c17e5803c3b/680x482cq70/gulai-asam-keueng-asam-pedas-tongkol-seafoodfestival-foto-resep-utama.jpg', 52.00, 1.80, 10.00, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1103, 'Gulai ikan masakan', 'https://sweetrip.id/wp-content/uploads/2022/10/1.jpg', 106.00, 2.50, 16.50, 18000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1104, 'Gulai ikan paya masakan', 'https://www.glory-travel.com/wp-content/uploads/2018/11/o1AJ9qDyyJNSpZWhUgGYc3MngFqoAN6WRcGHHcyTN6eXyGCVk.jpg', 148.00, 5.00, 10.00, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1105, 'Gulai kambing', 'https://kbu-cdn.com/dk/wp-content/uploads/gulai-kambing.jpg', 126.00, 6.20, 4.20, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1106, 'Gulai keumamah masakan', 'https://img-global.cpcdn.com/recipes/d43cbe5d1ad0490d/680x482cq70/gulai-keumamah-foto-resep-utama.jpg', 110.00, 3.20, 5.90, 14000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1107, 'Gulai pakis', 'https://www.agrowindo.com/wp-content/uploads/2017/06/Gulai-pakis-agrowindo.jpg', 143.00, 6.00, 4.00, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1108, 'Gurame asem manis masakan', 'https://d12man5gwydfvl.cloudfront.net/wp-content/uploads/2020/03/shutterstock_1561182373.jpg', 192.00, 12.70, 12.70, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1109, 'Ham', 'https://bakeitwithlove.com/wp-content/uploads/2021/12/glazed-honey-ham-sq.jpg', 389.00, 0.30, 16.90, 35000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1110, 'Hangop', 'https://www.lekkerensimpel.com/wp-content/uploads/2016/10/IMG_0381-2.jpg', 65.00, 3.50, 10.00, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1111, 'Ikan asar merah masakan', 'https://t-2.tstatic.net/medan/foto/bank/images2/Resep-Ikan-Asar-dan-Cara-Membuatnya-Hidangan-Khas-Maluku.jpg', 146.00, 5.60, 17.70, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1112, 'Ikan Asin bilis goreng', 'https://img-global.cpcdn.com/recipes/446879a009d58694/1200x630cq70/photo.jpg', 380.00, 0.00, 33.60, 32000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1113, 'Ikan Asin gabus goreng', 'https://images.tokopedia.net/img/cache/700/product-1/2019/7/27/6486945/6486945_99c1b375-e266-42bb-b539-f5731fb74114_960_960.jpg', 456.00, 0.00, 46.50, 34000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1114, 'Ikan Asin japuh goreng', 'https://img-global.cpcdn.com/recipes/756a62f3201bd80c/1200x630cq70/photo.jpg', 348.00, 0.00, 18.70, 30000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1115, 'Ikan Asin teri goreng', 'https://img-global.cpcdn.com/recipes/15714e008b15f3e0/680x482cq70/teri-segar-goreng-tanpa-minyak-foto-resep-utama.jpg', 430.00, 0.00, 33.40, 34000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1116, 'Ikan bandeng presto masakan', 'https://www.philips.com/c-dam/b2c/id_ID/experience/ho/cooking/iikan-goreng-thumbnail.jpg', 296.00, 11.30, 17.10, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1117, 'Ikan baung bakar', 'https://dherdian.files.wordpress.com/2014/12/ikan-baung.jpg', 144.00, 5.20, 17.80, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1118, 'Ikan baung segar', 'https://www.pustakadunia.com/media/posts/9/green-baung.jpg', 123.00, 3.30, 15.10, 12000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1119, 'Ikan Belida bakar', 'https://nilaigizi.com/assets/images/produk/produk_1535645437.JPG', 128.00, 7.20, 18.00, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1120, 'Ikan Belut Segar goreng', 'https://kbu-cdn.com/dk/wp-content/uploads/belut-goreng-crispy.jpg', 417.00, 32.00, 25.90, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1121, 'Ikan gete goreng', 'https://nilaigizi.com/assets/images/produk/produk_1535646628.jpg', 267.00, 0.20, 23.10, 15000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1122, 'Ikan Lele goreng', 'https://kbu-cdn.com/dk/wp-content/uploads/lele-goreng-bumbu-lengkuas.jpg', 252.00, 0.00, 19.90, 16000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1123, 'Ikan Mas goreng', 'https://cdn1-production-images-kly.akamaized.net/PoXdFBAzit7rJj6MDEQSxQ35dT8=/0x462:5162x3371/1200x675/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2930376/original/062217400_1570175183-shutterstock_445394449.jpg', 188.00, 0.00, 19.30, 15000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1124, 'Ikan Mas pepes', 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/01/06/1877204615.jpg', 209.00, 11.80, 15.20, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1125, 'Ikan Mujair dendeng goreng', 'https://img-global.cpcdn.com/recipes/c49ebd05c391ae54/680x482cq70/dendeng-mujair-foto-resep-utama.jpg', 598.00, 9.20, 74.30, 38000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1126, 'Ikan Mujair goreng', 'https://kurio-img.kurioapps.com/22/10/07/3521e216-d7b3-498d-a045-95973e196c36.jpg', 416.00, 0.00, 46.90, 24000, 'Mahal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1127, 'Ikan Mujair pepes', 'https://sweetrip.id/wp-content/uploads/2022/10/a-pepeas.jpg', 121.00, 0.80, 21.70, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1128, 'Ikan Papuyu bakar', 'https://img-global.cpcdn.com/recipes/c0df8c1401aba288/1200x630cq70/photo.jpg', 152.00, 6.70, 17.60, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1129, 'Ikan Patin bakar', 'https://awsimages.detik.net.id/community/media/visual/2022/05/16/resep-ikan-patin-bakar-bumbu-kecap-pedas_43.jpeg?w=1200', 144.00, 4.30, 17.50, 18000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1130, 'Jagung muda rebus', 'https://img-global.cpcdn.com/recipes/692c7955006bca76/1200x630cq70/photo.jpg', 142.00, 30.30, 5.00, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1131, 'Jagung Rebus ', 'https://asset.kompas.com/crops/L0i8I7tD8bIDLcs9nVG_Ok9egfI=/0x0:1000x667/750x500/data/photo/2021/10/05/615b9e713eeda.jpg', 175.00, 35.00, 1.80, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1132, 'Jagung Sayur (tumis) ', 'https://ibusayur.my.id/wp-content/uploads/2022/08/ibusayur.my.id-sayur-nangka-51661b26-eb56-4072-8613-65cb6b4c2ecb.png', 148.90, 20.10, 10.40, 14000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1133, 'Jahe', 'https://s3-publishing-cmn-svc-prd.s3.ap-southeast-1.amazonaws.com/article/yGGUi3g36leAkNBWE0jT6/original/044762400_1598525725-Ini-Bedanya-Manfaat-Jahe-Merah-Jahe-Putih-dan-Jahe-Emprit-shutterstock_585874265.jpg', 51.00, 10.10, 1.50, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1134, 'Jambu Air', 'https://demfarm.id/wp-content/uploads/2022/08/rose-apples-or-chomphu-isolated-on-white-backgroun-2021-09-03-19-03-57-utc-1024x768.jpg', 46.00, 11.80, 0.60, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1135, 'Jambu Biji', 'https://asset.kompas.com/crops/4TGyZIJJ3wev1NuC6g-2Pggg6tA=/51x58:931x644/750x500/data/photo/2022/10/28/635b7364a7089.jpg', 49.00, 12.20, 0.90, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1136, 'Jambu Bol', 'https://asset.kompas.com/crops/CRaVBVmC7B0888k4y86iwwNsCvo=/0x41:1000x707/750x500/data/photo/2021/06/15/60c82d8d8e0d2.jpg', 56.00, 14.20, 0.60, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1137, 'Jeruk Bali', 'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/11/15053620/Jeruk-Bali-Kaya-Vitamin-C-Ini-Manfaatnya-untuk-Kesehatan.jpg', 48.00, 12.40, 0.60, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1138, 'Jeruk Nipis', 'https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2020/03/02/2284586354.png', 37.00, 12.30, 0.80, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1139, 'Jeruk ragi segar', 'https://images.tokopedia.net/img/cache/250-square/hDjmkQ/2021/1/3/2de49603-36db-48fc-9749-df7946340f62.png', 49.00, 11.10, 0.70, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1140, 'Kacang Arab', 'https://img.okezone.com/content/2021/02/04/298/2356167/mengenal-chickpea-kacang-arab-penuh-nutrisi-yang-baik-untuk-tubuh-ahltPCXlfV.jpg', 330.00, 60.20, 23.80, 26000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1141, 'Kacang atom', 'https://img-global.cpcdn.com/recipes/74c03b7bf26daaf4/680x482cq70/sukro-kacang-atom-foto-resep-utama.jpg', 533.00, 28.80, 27.80, 38000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1142, 'Kacang Belimbing rebus', 'https://cdn1-production-images-kly.akamaized.net/TNGJxQzLI6y-VeIWmj2-GBuyLBQ=/1200x900/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2729965/original/086034000_1550232841-foto_kecipir.JPG', 204.00, 17.50, 16.90, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1143, 'Kacang Ijo', 'https://cdn0-production-images-kly.akamaized.net/EfXY7zn0w4mfhomUUiKK4dlg2Cs=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/704437/original/Kacang_Hijau_0714.jpg', 345.00, 62.90, 22.20, 32000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1144, 'Kacang Kapri Goreng ', 'https://sc04.alicdn.com/kf/HTB1TBuVqKuSBuNjSsziq6zq8pXae.jpg', 445.00, 65.50, 11.00, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1145, 'Kacang Kedelai kukus', 'https://img2.beritasatu.com/cache/beritasatu/910x580-2/20082012110024.jpg', 75.00, 10.70, 4.10, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1146, 'Kacang kedelai rebus', 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/07/27/1000907679.jpg', 189.00, 12.70, 20.20, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1147, 'Kacang Merah kering rebus', 'https://asset.kompas.com/crops/Nas6r0JWAfSTCuULYQOzawPHY1I=/59x3:885x554/780x390/data/photo/2022/02/16/620ca71bcdae7.jpg', 158.00, 28.20, 10.30, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1148, 'Kacang Panjang kukus', 'https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2021/08/20/kacang-panjangjpg-20210820065144.jpg', 39.00, 7.60, 3.00, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1149, 'Kacang Panjang tumis', 'https://asset.kompas.com/crops/If5HOEMwzIA4cyaXwjSvrF79U2E=/1x25:963x667/750x500/data/photo/2021/02/27/6039ddfacfede.jpg', 150.00, 7.00, 2.50, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1150, 'Kacang sukro', 'https://icalan.id/userfile/filemanager/834//lz-olshop_1630921772-uTyPi.jpeg', 484.00, 57.70, 8.80, 29000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1151, 'Kacang tanah goreng', 'https://cdn.rasa.my/2018/10/Untitled-design33.png', 564.00, 25.50, 25.50, 31000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1152, 'Kacang Tanah kacang sari', 'https://mmc.tirto.id/image/otf/1024x535/2017/07/12/susu-kacang-tanah--ISTOCK.jpg', 561.00, 26.00, 25.50, 40000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1153, 'Kacang Telur ', 'https://img-global.cpcdn.com/recipes/18de1fa4c4094900/400x400cq70/photo.jpg', 748.00, 124.80, 20.80, 40000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1154, 'Kakap', 'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2022/11/30105045/Tinggi-Protein-Ini-X-Manfaat-Ikan-Kakap-untuk-Kesehatan.jpg', 92.00, 0.00, 20.00, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1155, 'Kalio jeroan masakan', 'https://img-global.cpcdn.com/recipes/2031e463b74f84a0/1200x630cq70/photo.jpg', 163.00, 4.10, 16.50, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1156, 'Kalio kikil (tunjang) masakan', 'https://asset.kompas.com/crops/mqYtGN3S_jZncBl0Ug8aj0WNS0E=/0x0:1000x667/750x500/data/photo/2021/03/01/603c964830992.jpg', 122.00, 3.90, 13.80, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1157, 'Kalio otak masakan', 'https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/sasefoto/original/32036_kalio-otak.JPG', 157.00, 11.40, 8.10, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1158, 'Kalio telur masakan', 'https://img-global.cpcdn.com/recipes/642209af1316da73/680x482cq70/kalio-telur-foto-resep-utama.jpg', 193.00, 9.70, 10.60, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1159, 'Kambose', 'https://img-global.cpcdn.com/recipes/26bdea923d2d4e15/680x482cq70/sup-dayak-foto-resep-utama.jpg', 164.00, 32.60, 3.00, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1160, 'Kangkung', 'https://www.astronauts.id/blog/wp-content/uploads/2023/01/Mengenal-Manfaat-Kangkung-Bagi-Tubuh--1200x900.jpg', 29.00, 5.40, 3.00, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10');
INSERT INTO `makanan` (`id`, `nama_makanan`, `gambar`, `kalori`, `karbohidrat`, `protein`, `harga`, `level_harga`, `tipe_diet`, `cluster`, `created_at`, `updated_at`) VALUES
(1161, 'Kangkung kukus', 'https://cdn1-production-images-kly.akamaized.net/A3CuOjVcvmP6noevlbrt75x6srk=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3446098/original/094275500_1619997238-stir-fried-vegetables-2245082_1280.jpg', 30.00, 4.70, 3.20, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1162, 'Kangkung rebus', 'https://cdn0-production-images-kly.akamaized.net/-w7C3Sli-qWhlPa4hmzbg324XkA=/190x0:855x665/1200x1200/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4353847/original/077195900_1678438446-shutterstock_1262667451.jpg', 22.00, 3.10, 2.50, 5000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1163, 'Kangkung tondano', 'https://www.andrafarm.com/_andra_farm/gambar_kelompok/a046-2.jpg', 43.00, 8.40, 1.80, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1164, 'Kangkung tumis', 'https://scm-assets.constant.co/scm/unilever/e9dc924f238fa6cc29465942875fe8f0/17ea3056-4e78-4d25-bd54-cf3a9296188b.jpg', 52.00, 3.00, 1.80, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1165, 'Kaparende sayur', 'https://www.gotravelly.com/blog/wp-content/uploads/2021/05/kaparende.jpg', 38.00, 2.60, 2.40, 5000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1166, 'Kapurung', 'https://rasabunda.com/wp-content/uploads/2021/08/Kapurung.jpg', 41.00, 7.80, 2.00, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1167, 'Karedok ', 'https://asset.kompas.com/crops/szsUOraQ00vakiV0314KT6-71v8=/0x0:1000x667/750x500/data/photo/2021/07/07/60e56c9f60649.jpg', 146.70, 19.70, 5.90, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1168, 'Karedok sayur', 'https://asset.kompas.com/crops/jbNcoL1_PmijICoxtO4126XbZgM=/0x0:1000x667/780x390/data/photo/2021/07/07/60e56c9f60649.jpg', 92.00, 14.10, 2.20, 9000, 'Murah', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1169, 'Karoket ', 'https://img-global.cpcdn.com/recipes/3ac8414039a793c2/680x482cq70/karoket-indomie-foto-resep-utama.jpg', 292.00, 2.80, 11.20, 20000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1170, 'Katul Beras', 'https://cdn.idntimes.com/content-images/post/20170623/rye-bran-2500-56a210e73df78cf7727192c2-f82bea323262cc6f562d6321d24ab643_600x400.jpg', 275.00, 54.60, 12.60, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1171, 'Katul Jagung', 'https://s2.bukalapak.com/img/2370243413/large/20180830_215736_scaled.jpg', 356.00, 64.50, 9.00, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1172, 'Keju', 'https://cdns.klimg.com/merdeka.com/i/w/news/2020/05/08/1175035/content_images/670x335/20200508114326-1-ilustrasi-keju-008-destriyana.jpg', 326.00, 13.10, 22.80, 22000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1173, 'Kelapa Muda daging', 'https://assets.tokko.io/7785295b-a6a6-4936-ab19-a31759ef44d7/products/images/8f8a1078-27c5-43e8-8a32-93738de68b9d', 68.00, 14.00, 1.00, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1174, 'Kelapa Tua daging', 'https://asset-a.grid.id/crop/0x0:0x0/x/photo/2022/09/06/daging-kelapajpg-20220906030742.jpg', 359.00, 14.00, 3.40, 39000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1175, 'Kelepon ', 'https://caramembuat.id/wp-content/uploads/2022/06/Cara-Membuat-Klepon-Ketan-Khas-Bali.webp', 214.00, 40.20, 5.40, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1176, 'Kelewih', 'https://kecipir.com/blog/wp-content/uploads/2018/02/arto_commun_070509_0128_ltn.jpg', 111.00, 27.20, 1.50, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1177, 'Kembang tahu', 'https://asset.kompas.com/crops/sgS6iHzRJjt2l5GMjgtm8spQscM=/0x0:1000x667/750x500/data/photo/2020/08/22/5f412ff8eee87.jpg', 380.00, 23.30, 48.90, 27000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1178, 'Kembang Turi', 'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1568729650/gegx4jyvwt2yemk2wou0.jpg', 44.00, 9.60, 1.80, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1179, 'Kentang', 'https://img.freepik.com/free-photo/side-view-basket-bowl-full-potato-sackcloth-wooden-surface-background-with-copy-space_141793-5650.jpg?w=1060&t=st=1684232790~exp=1684233390~hmac=d4c5a62367069d98e3ddf3935be7b63e3f650cd00d6f80da197e948280b1e1b3', 83.00, 19.10, 2.00, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1180, 'Kepiting', 'https://thumb.tvonenews.com/thumbnail/2022/09/09/631ae5a4f1c8b-ilustrasi-makanan-laut-kepiting_1265_711.jpg', 151.00, 14.10, 13.80, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1181, 'Kerang', 'https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/02/Kerang-Tiram.jpg?fit=740%2C471&ssl=1', 59.00, 3.60, 18.00, 7000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1182, 'Keremes', 'https://1.bp.blogspot.com/-7vUY82UReBs/WTbWbqEd68I/AAAAAAAAG4k/isry-Tn67FQgLbx5nqz5ZVhpQeAMHkaSACLcB/s1600/23-04-12-2863049_540b3cf5-8735-4432-9749-3805a501b746.jpg', 475.00, 64.40, 1.60, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1183, 'Keripik bayam', 'https://asset.kompas.com/crops/jYESdylVwVMIxcGzRhIFfZhPjnI=/0x28:1000x694/750x500/data/photo/2021/06/12/60c3ff4b72ad0.jpeg', 586.00, 50.20, 4.90, 20000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1184, 'Keripik gadung', 'https://www.ngadipuro.desa.id/desa/upload/artikel/sedang_1634355777_keripik-gadung.jpg', 446.00, 76.00, 2.80, 39000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1185, 'Keripik kentang', 'https://asset.kompas.com/crops/TaJKfxhk6isVM1cCWS03MJ-LeZw=/32x12:1000x657/780x390/data/photo/2022/05/25/628d7e2eb24a9.jpg', 448.00, 67.10, 2.70, 25000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1186, 'Keripik singkong', 'https://www.astronauts.id/blog/wp-content/uploads/2022/09/Olahan-Keripik-Khas-Indonesia-yang-Bikin-Kamu-Ketagihan-1024x683.jpg', 478.00, 72.00, 0.90, 29000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1187, 'Keripik tempe', 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2022/07/19/1076813219.png', 581.00, 41.70, 12.10, 36000, 'Premium', 'Vegan', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1188, 'Keripik ubi', 'https://kurio-img.kurioapps.com/21/09/02/38b4842e-bbd0-4c81-9ac4-2f41364dfbfc.jpe', 486.00, 67.60, 0.20, 40000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1189, 'Kerupuk Aci', 'https://alatpresplastik.com/wp-content/uploads/2022/01/kekekeru.jpg', 350.00, 85.90, 0.50, 32000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1190, 'Kerupuk Udang ', 'https://cdn0-production-images-kly.akamaized.net/ihQHCeKhKldhY8YlTDkiu0ObeqE=/261x0:928x667/1200x900/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3265798/original/012419700_1602564070-shutterstock_1736290877.jpg', 340.00, 52.00, 30.00, 24000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1191, 'Kesemek', 'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2023/02/08040440/catat-ini-manfaat-buah-kesemek-bagi-kesehatan-tubuh-halodoc.jpg', 78.00, 20.00, 0.80, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1192, 'Ketan hitam matang', 'https://asset.kompas.com/crops/agGJ3o2lK5eMmT-VkGdijGLjgpQ=/0x0:1000x667/750x500/data/photo/2020/10/26/5f965ccbd7c1a.jpg', 181.00, 37.30, 4.00, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1193, 'Ketan putih matang', 'https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2018/10/13/211488655.jpg', 163.00, 35.70, 3.00, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1194, 'Ketapang ', 'https://cdn0-production-images-kly.akamaized.net/bEFvWpDkZsFCndvlKQ2liamvXwM=/0x287:3046x2004/1200x675/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3989958/original/069432700_1649474910-biji_ketapang.jpg', 340.00, 54.00, 11.00, 32000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1195, 'Ketimun', 'https://www.garnesia.com/images/news/b542.jpg', 12.00, 2.70, 0.70, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1196, 'Ketimun madura segar', 'https://kopijagung.com/wp-content/uploads/2021/05/0001-1776641472_20210524_095708_0000_compress85-scaled.jpg', 9.00, 1.90, 0.50, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1197, 'Ketoprak', 'https://asset.kompas.com/crops/BiN_oCxCDgkO09b1B_FPfZuvGBw=/0x0:739x493/750x500/data/photo/2020/01/29/5e318845429db.jpg', 153.00, 13.00, 7.90, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1198, 'Ketupat ketan', 'https://awsimages.detik.net.id/community/media/visual/2022/05/01/ketupat-ketan-khas-sumatra-2.jpeg?w=1200', 212.00, 38.60, 4.00, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1199, 'Ketupat Tahu ', 'https://asset-a.grid.id/crop/0x0:0x0/x/photo/2021/06/09/resep-kupat-tahu-menu-sarapan-n-20210609032448.jpg', 109.60, 18.60, 2.60, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1200, 'Kluwek', 'https://faktualnews.co/images/2022/01/kluwek.png', 310.00, 13.50, 10.00, 25000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1201, 'Kokosan', 'https://cms.sehatq.com/public/img/article_img/buah-kokosan-dan-duku-satu-keluarga-tapi-beda-rasa-1595398922.jpg', 86.00, 13.00, 1.60, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1202, 'Kool Kembang', 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2020/11/17/8b6436f9-8344-48fd-9171-b066c4191f94.jpg', 25.00, 4.90, 2.40, 5000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1203, 'Kool Merah kool putih', 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1627875002/attached_image/walau-bikin-perut-kembung-manfat-kol-ternyata-banyak-lho.jpg', 24.00, 5.30, 1.40, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1204, 'Koya', 'https://cf.shopee.co.id/file/25e9b3e3d818ae999bd0736ff56ca58b', 366.00, 77.50, 4.20, 33000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1205, 'Kripik Tempe Goreng ', 'https://asset.kompas.com/crops/NvawKpjCGV6FrehArD0C-OBjYSI=/3x0:700x465/750x500/data/photo/2020/12/01/5fc629934653a.jpg', 542.00, 11.50, 40.30, 30000, 'Mahal', 'Vegan', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1206, 'Krokot', 'https://www.greeners.co/wp-content/uploads/2020/09/Krokot-Tanaman-Gulma-dengan-Segudang-Khasiat-2.jpg', 21.00, 3.80, 1.70, 7000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1207, 'Kucai', 'https://img-cdn.medkomtek.com/0sG2Fssyrmn9bdgy08HRVYdJE6U=/0x0/smart/filters:quality(75):strip_icc():format(webp)/article/APtPHT6GJD825hl5oB-p_/original/070454600_1570675713-Sejuta-Manfaat-Daun-Kucai-yang-Jarang-Diketahui-Orang-By-K321-Shutterstock_1100191607.jpg', 45.00, 10.30, 2.20, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1208, 'Kue ali', 'https://awsimages.detik.net.id/community/media/visual/2022/06/21/resep-kue-cincin_43.jpeg?w=1200', 440.00, 64.50, 3.80, 29000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1209, 'Kue Apem ', 'https://cdn0-production-images-kly.akamaized.net/1vXhapwViv08dtFYbhhKKEfqiJ0=/0x542:4608x3139/1200x675/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3479555/original/004272600_1623394884-shutterstock_1952418853.jpg', 186.70, 39.60, 1.60, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1210, 'Kue bangket', 'https://asset.kompas.com/crops/1zdz3_jE_GfEVcRZKtgL2GokVrA=/0x0:1000x667/750x500/data/photo/2023/02/24/63f805fb8890f.jpeg', 338.00, 80.30, 1.50, 34000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1211, 'Kue Bugis ', 'https://asset.kompas.com/crops/hHVyMg5BiDHITqTbKdbpz1Un4_c=/0x0:1000x667/750x500/data/photo/2022/06/21/62b109f77f78c.jpeg', 240.00, 54.00, 1.00, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1212, 'Kue jahe', 'https://kurio-img.kurioapps.com/21/07/21/7ff9c395-9dea-492e-b3a0-ec9c7287dc04.jpe', 425.00, 84.60, 1.60, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1213, 'Kue kelapa', 'https://assets.suaramerdeka.com/crop/0x0:0x0/750x500/webp/photo/2023/01/03/3184254010.png', 591.00, 47.50, 5.60, 38000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1214, 'Kue Koya ', 'https://media.karousell.com/media/photos/products/2018/08/23/koya_kacang_suuk_asli_bandung_1535029115_863b9a71_progressive.jpg', 366.00, 7.90, 4.20, 37000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1215, 'Kue lumpur', 'https://img.kurio.network/u_ismzhaT5An97OjUr0AzVYEjCE=/1200x900/filters:quality(80)/https://kurio-img.kurioapps.com/21/09/21/eec4bac2-8193-41bd-b249-22a4afc28519.jpe', 291.00, 44.10, 3.60, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1216, 'Kue mangkok ', 'https://asset.kompas.com/crops/EUNcgQqWtMLzjyycRK-jWqJPg5Q=/3x0:700x465/750x500/data/photo/2021/01/13/5ffe348f5e49a.jpg', 182.00, 40.40, 1.00, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1217, 'Kue Pacar Cina ', 'https://asset.kompas.com/crops/jkimxsmqIcyNJ_UjeHGJML9sT_4=/0x0:698x465/750x500/data/photo/2021/02/20/603069ab80f59.jpg', 126.70, 57.30, 0.70, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1218, 'Kue Pia ', 'https://www.resepkuerenyah.com/wp-content/uploads/2015/05/Resep-Kue-Pia-Kacang-Hijau.jpg', 296.00, 66.40, 1.40, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1219, 'Kue putu cangkir', 'https://i.ytimg.com/vi/GH8hVDZ3AZA/maxresdefault.jpg', 304.00, 54.90, 5.30, 28000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1220, 'Kue putu singkong', 'https://asset.kompas.com/crops/4HYsevQAK_PJOcsTRt4Tl0vo4YI=/0x0:1000x667/750x500/data/photo/2021/06/10/60c19ee3dbc24.jpg', 217.00, 53.20, 1.20, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1221, 'Kue Satu ', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Kue_satu_2.JPG/640px-Kue_satu_2.JPG', 393.30, 79.30, 2.70, 38000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1222, 'Kue Semprong ', 'https://asset.kompas.com/crops/jT3TeOZw6jjDRXgh1-P9Yrz0enI=/0x0:1000x667/750x500/data/photo/2022/01/21/61ea314112848.jpg', 380.00, 92.00, 1.00, 39000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1223, 'Kue sus', 'https://statics.indozone.news/local/63abe8c5a2d3e.jpg', 221.00, 24.80, 7.50, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1224, 'Kue Talam ', 'https://cdn.yummy.co.id/content-images/images/20220319/ZDxMHnPOfZAq6tXHCLa9WsgeVwHh5Wb2-31363437363439303336d41d8cd98f00b204e9800998ecf8427e.jpg?x-oss-process=image/format,webp', 180.00, 32.00, 5.00, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1225, 'Kue Tambang ', 'https://asset.kompas.com/crops/x2yGurVUxpP-COxvvOjVx2P7lL0=/100x67:900x600/750x500/data/photo/2022/04/14/62578f6fbc8b8.jpg', 512.00, 60.40, 26.00, 21000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1226, 'Kue thipan', 'https://asset.kompas.com/crops/fXb2bs6UVUJNODIGbh7aFfAzUE4=/41x33:950x639/750x500/data/photo/2021/03/05/6041b846aa175.jpg', 247.00, 49.50, 2.90, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1227, 'Kundur segar', 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/7/19/0136f82a-7e5d-4239-a821-5d104134e2bf.jpg', 22.00, 4.70, 0.40, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1228, 'Kura-kura', 'https://image-cdn.medkomtek.com/KZBBktqticgNUpCCeJzeVrcDKGg=/673x379/smart/klikdokter-media-buckets/medias/2312546/original/004647900_1581575442-Daging-Penyu-Shutterstock_443050405.jpg', 83.00, 0.00, 19.10, 7000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1229, 'Kwaci', 'https://lzd-img-global.slatic.net/g/p/38df63d32f7205e9f443bd8cac8ef122.jpg_720x720q80.jpg_.webp', 515.00, 13.80, 30.60, 27000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1230, 'Labu kuning segar', 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/8/15/8459499c-3699-48fc-99e9-68c2b3dd27d6.jpg?ect=4g', 51.00, 10.00, 1.70, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1231, 'Labu Siam', 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2023/05/27/3705926699.jpg', 26.00, 6.70, 0.60, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1232, 'Labu waluh segar', 'https://media.istockphoto.com/id/1276814339/id/foto/irisan-mentah-segar-butternut-squash-di-papan-kayu-tampilan-atas-ke-bawah.jpg?s=612x612&w=0&k=20&c=zCYDW2KS0xuVGjq4k-_AwwkZnCQxapWuuWovVhJvqKA=', 32.00, 6.60, 1.10, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1233, 'Laksa ', 'https://asset.kompas.com/crops/cmvexYXhxB1oyebUTtLncpQTxNE=/256x116:1280x798/750x500/data/photo/2022/10/11/63455e3290f0e.jpg', 166.30, 29.50, 2.70, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1234, 'Langsat', 'https://st4.depositphotos.com/12727742/21449/i/450/depositphotos_214494426-stock-photo-lanzones-fruit-on-white-isolated.jpg', 56.00, 14.30, 0.90, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1235, 'Lapis legit', 'https://kurio-img.kurioapps.com/21/03/03/fba953f2-c456-49e3-bec5-7adc1cbfd5a6.jpe', 389.00, 55.50, 6.60, 39000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1236, 'Lemon Squasih', 'https://i0.wp.com/blog.duniamasak.com/wp-content/uploads/Manfaat-dari-Citrus-Squash.jpg?fit=900%2C520&ssl=1', 36.00, 10.00, 0.00, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1237, 'Lemonade', 'https://awsimages.detik.net.id/community/media/visual/2020/12/11/lemonade.jpeg?w=700&q=90', 30.00, 8.00, 0.00, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1238, 'Lemper ', 'https://awsimages.detik.net.id/community/media/visual/2022/03/30/resep-lemper-ayam_43.jpeg?w=1200', 221.30, 43.40, 3.80, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1239, 'Lempog durian', 'https://www.wowkeren.com/display/images/photo/2019/11/01/00281112s7.jpg', 320.00, 63.70, 3.50, 28000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1240, 'Leupeut Ketan ', 'https://sweetrip.id/wp-content/uploads/2021/05/171584083_119493940234318_4941248120678130162_n.jpg', 240.00, 51.30, 7.80, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1241, 'Lobak', 'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2022/09/29035721/Kandungan-Nutrisi-pada-Lobak-Putih-yang-Baik-bagi-Kesehatan.jpg', 19.00, 4.20, 0.90, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1242, 'Lopis ', 'https://img-global.cpcdn.com/recipes/08285e540251b661/680x482cq70/lupislopis-ketan-pandan-ala-chef-muhammad-foto-resep-utama.jpg', 163.30, 33.00, 2.80, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1243, 'Lupis ketan', 'https://asset.kompas.com/crops/TRFlnZa303pT0iwa7gkId4MCWSA=/0x54:1000x720/750x500/data/photo/2020/06/24/5ef30e98cb1e8.jpg', 164.00, 34.50, 1.80, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1244, 'Madu', 'https://asset.kompas.com/crops/xLLMihh3EZy1CwtkPn_4DGDwe9A=/0x8:1000x675/750x500/data/photo/2020/11/12/5facc84db5083.jpg', 294.00, 79.50, 0.30, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1245, 'Makaroni', 'https://img.freepik.com/free-photo/horizontal-view-butterfly-uncooked-pastas-brown-bowl-mixed-color-table-high-resolution-photo_140725-86866.jpg?w=1060&t=st=1684233335~exp=1684233935~hmac=5e53a5f2f8d8db6b49b05831a1ffda6004b9b1fc696423217781874c3ef92e9c', 363.00, 78.70, 8.70, 29000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1246, 'Mangga Harum Manis', 'https://www.rumahtanaman.com/wp-content/uploads/2018/01/Slide8.jpg', 46.00, 11.90, 0.40, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1247, 'Manggis', 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1645702972/attached_image/manfaat-buah-manggis-untuk-kesehatan-yang-sayang-dilewatkan.jpg', 63.00, 15.60, 0.60, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1248, 'Markisa segar', 'https://sc04.alicdn.com/kf/U9a58688525d24e25a10c656a5b19874cy.jpg', 144.00, 29.80, 3.50, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1249, 'Martabak  manis', 'https://tasteofnusa.com/wp-content/uploads/2022/03/martabak-manis-12-720x720.jpg', 265.30, 49.30, 4.70, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1250, 'Martabak Telur ', 'https://www.masakapahariini.com/wp-content/uploads/2020/10/Martabak-Telor-Bayam.jpg', 200.00, 29.50, 8.90, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1251, 'Masekat', 'https://img-global.cpcdn.com/recipes/af253cf910c76d69/1200x630cq70/photo.jpg', 369.00, 74.10, 2.10, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1252, 'Matoa segar', 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2023/3/9/ac2bbe27-dd14-46dc-947f-98a9b16b0be6.jpg', 90.00, 21.10, 1.20, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1253, 'Melase', 'https://s0.bukalapak.com/img/57164672241/large/data.jpeg', 276.00, 71.00, 0.00, 19000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1254, 'Menteng', 'https://cdn.idntimes.com/content-images/community/2019/06/img-20190616-231022-b1184a09c11ecdd83465d09708483513_600x400.jpg', 65.00, 16.10, 1.70, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1255, 'Mi basah', 'https://lzd-img-global.slatic.net/g/ff/kf/S32cbc99669db47d09a0603d5b5340a676.jpg_720x720q80.jpg_.webp', 88.00, 14.00, 0.60, 5000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1256, 'Mi golosor', 'https://img.okezone.com/content/2021/04/18/301/2396626/mie-glosor-takjil-khas-bogor-yang-cuma-bisa-dicicipi-saat-ramadan-nC8fwT950l.jpg', 71.00, 15.90, 0.20, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1257, 'Mi kering', 'https://www.basoyen.com/wp-content/uploads/2020/07/markus-winkler-57EDibTULBw-unsplash-600x600.jpg', 339.00, 6.30, 10.00, 28000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1258, 'Mie aceh rebus', 'https://resepkoki.id/wp-content/uploads/2021/03/Resep-Mie-Aceh.jpg', 113.00, 18.10, 3.00, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1259, 'Mie ayam', 'https://awsimages.detik.net.id/community/media/visual/2022/10/12/resep-mie-ayam-kecap_43.jpeg?w=1200', 102.00, 10.50, 6.20, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1260, 'Mie bakso', 'https://upload.wikimedia.org/wikipedia/commons/a/a9/Indonesian_bakso%2C_with_noodle_and_bean_sprouts%2C_April_2018_%2803%29.jpg', 114.00, 16.40, 5.30, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1261, 'Mie Bendo', 'https://img-global.cpcdn.com/recipes/bdd43198a013a918/680x482cq70/mie-lethekmie-bendo-goreng-foto-resep-utama.jpg', 353.00, 88.00, 0.30, 40000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1262, 'Mie celon', 'https://nilaigizi.com/assets/images/produk/produk_1538367850.jpg', 102.00, 17.80, 3.00, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1263, 'Mie Goreng ', 'https://kbu-cdn.com/dk/wp-content/uploads/mie-goreng-korea.jpg', 468.00, 62.40, 7.60, 40000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1264, 'Mie kering', 'https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/2022/10/13/1236905540.jpg', 337.00, 50.00, 7.90, 24000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1265, 'Mie pangsit basah', 'https://sweetrip.id/wp-content/uploads/2020/08/bakmisibos_116436440_1141684466204653_5039711773118966116_n.jpg', 105.00, 9.40, 5.90, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1266, 'Mie Sagu', 'https://o-cdn-cas.sirclocdn.com/parenting/images/mie_sagu_goreng.width-800.format-webp.webp', 190.00, 46.50, 0.20, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1267, 'Misoa', 'https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/01/Resep-Misoa-goreng.jpg?fit=1896%2C1920&ssl=1', 345.00, 78.00, 8.50, 28000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1268, 'Misro ', 'https://resepkoki.id/wp-content/uploads/2016/03/Resep-Misro.jpg', 218.00, 50.20, 0.80, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1269, 'Moon tahu', 'https://asset.kompas.com/crops/6euVEo-wAGx89LIBbuVHsBls00g=/3x0:700x465/750x500/data/photo/2021/02/26/60389a2ca08d2.jpg', 128.00, 1.30, 8.00, 15000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1270, 'Mostarda metan -sawi', 'https://1.bp.blogspot.com/-Z49IVx92C3Q/YPTZ76m0s4I/AAAAAAAAE7A/YqyhcefD4AsQ1AuLNA-G-fEMDUUKjKJ1gCLcBGAsYHQ/s1200/mostarda-planta-1200x900.jpg', 33.00, 4.70, 2.30, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1271, 'Mujahir acar kuning masakan', 'https://img-global.cpcdn.com/recipes/8bebe8ed6c7b4f07/680x482cq70/ikan-mujair-acar-kuning-foto-resep-utama.jpg', 330.00, 12.10, 17.80, 40000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1272, 'Nanas', 'https://awsimages.detik.net.id/community/media/visual/2022/07/04/diet-nanas-bikin-bb-turun-1-kg-seminggu-apa-aman-untuk-kesehatan-3.jpeg?w=682', 52.00, 13.70, 0.40, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1273, 'Nasi', 'https://asset.kompas.com/crops/V8z5REsWvqpu4CxKPWl_Ukg7CNI=/151x100:1349x898/780x390/data/photo/2022/01/08/61d9973b79cbd.jpg', 180.00, 39.80, 3.00, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1274, 'Nasi beras merah', 'https://www.masakapahariini.com/wp-content/uploads/2019/11/nasi-tim-beras-merah.jpg', 149.00, 32.50, 2.80, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1275, 'Nasi Goreng ', 'https://asset.kompas.com/crops/2RnTJZK6E9ABjS_1qmItNjI1hls=/0x0:5760x3840/750x500/data/photo/2023/02/14/63eb12fb840da.jpg', 276.00, 30.20, 3.20, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1276, 'Nasi gurih', 'https://www.frisianflag.com/storage/app/media/uploaded-files/nasi-uduk-betawi.jpg', 190.00, 26.00, 4.70, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1277, 'Nasi jagung', 'https://tokohinspiratif.id/wp-content/uploads/2019/03/WhatsApp-Image-2019-03-25-at-16.10.19-1280x640.jpeg', 357.00, 79.50, 8.80, 31000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1278, 'Nasi rames', 'https://o-cdn-cas.sirclocdn.com/parenting/images/nasi-rames.width-800.format-webp.webp', 155.00, 19.10, 10.30, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1279, 'Nasi tim', 'https://www.masakapahariini.com/wp-content/uploads/2022/08/cara-membuat-nasi-tim-ayam-sayuran-mpasi.jpg', 120.00, 26.00, 2.40, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1280, 'Nasi Uduk ', 'https://img.kurio.network/P1Obhh7cenTadrAZ6Hc_XPjaVws=/1200x1200/filters:quality(80)/https://kurio-img.kurioapps.com/21/09/01/53606332-ec0c-478c-add9-78815b5cc658.jpe', 253.30, 11.70, 4.30, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1281, 'Olah-olah', 'https://img-global.cpcdn.com/recipes/45ba2643fc906c09/680x482cq70/olah-olah-foto-resep-utama.jpg', 9.00, 7.10, 2.10, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1282, 'Oncom', 'https://asset.kompas.com/crops/TJ76EsKIghwcoD2Dkv7GrHGa_x4=/0x9:1000x675/750x500/data/photo/2020/08/04/5f2959f90ed39.jpg', 187.00, 22.60, 13.00, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1283, 'Onde-onde ', 'https://www.masakapahariini.com/wp-content/uploads/2020/10/resep-onde-onde.jpg', 288.60, 44.30, 8.30, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1284, 'Ongol-ongol ', 'https://blog.tokowahab.com/wp-content/uploads/2020/01/Resep-Ongol-Ongol.jpg', 115.00, 14.00, 1.50, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1285, 'Papais ', 'https://cdn-brilio-net.akamaized.net/news/2022/02/15/222989/1667876-1000xauto-resep-papais-pisang.jpg', 133.80, 27.00, 3.00, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1286, 'Papeda', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Papeda%2C_Kuah_Kuning%2C_Ikan_Tude_Bakar_2.jpg/1200px-Papeda%2C_Kuah_Kuning%2C_Ikan_Tude_Bakar_2.jpg', 61.00, 14.90, 0.20, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1287, 'Parede baleh masakan', 'https://cdn.yummy.co.id/content-images/images/20200815/2YZZLlB1Zbu1u15lVU5vD8BzPnocXd9x-31353937343730313934d41d8cd98f00b204e9800998ecf8427e.jpg?x-oss-process=image/format,webp', 87.00, 5.50, 10.50, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1288, 'Paria Putih kukus', 'https://img-global.cpcdn.com/recipes/a97ee086d880b66f/680x482cq70/chao-gu-kua-pare-putih-isi-telur-tofu-kukus-foto-resep-utama.jpg', 16.00, 3.40, 0.80, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1289, 'Pastel', 'https://img-global.cpcdn.com/recipes/66d15fa15c092e35/1200x630cq70/photo.jpg', 307.00, 42.40, 4.50, 27000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1290, 'Pe-Cay', 'https://img-global.cpcdn.com/recipes/b41cd819ef249758/680x482cq70/sayur-pecay-sawi-putih-cah-tahu-foto-resep-utama.jpg', 23.00, 4.50, 1.80, 7000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1291, 'Pempek adaan', 'https://asset.kompas.com/crops/ZCo2_DcJAXGslXbYIM3Zv4nCzsA=/0x41:1000x708/750x500/data/photo/2021/03/01/603c1e79dd9d3.jpg', 162.00, 27.80, 4.90, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1292, 'Pempek belida', 'https://storage.hpaindonesia.net:8215/assets/71fe72e0c41bc168b875616e063f59fe/a5ef8b002a65c712f64b2d7df37c80c5.jpg', 156.00, 31.60, 4.20, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1293, 'Pempek kapal selam', 'https://blog.duniamasak.com/wp-content/uploads/image2-1024x1024.jpeg', 152.00, 28.20, 4.50, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1294, 'Pempek kelesan', 'https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/halloseleb/2020/11/Pempek-1.png', 211.00, 26.60, 12.30, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1295, 'Pempek kulit', 'https://img.kurio.network/qccsgXHXu9eyYhL6WTN-KoaY8xE=/1200x1200/filters:quality(80)/https://kurio-img.kurioapps.com/20/06/05/40ff5973-31a7-407f-be12-b3d3af335023.jpg', 243.00, 39.10, 5.20, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1296, 'Pempek tenggiri', 'https://s0.bukalapak.com/uploads/content_attachment/fd3107d582c4f80e5448ada5/original/foto_utama_pempek_2.jpg', 173.00, 33.40, 7.20, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1297, 'Pencok lele masakan', 'https://img-global.cpcdn.com/recipes/385569312441e99f/680x482cq70/pencok-lele-foto-resep-utama.jpg', 372.00, 3.50, 7.80, 39000, 'Premium', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1298, 'Pepare ular segar', 'https://m.andrafarm.com/_andra_farm/gambar_kelompok/a078.jpg', 19.00, 3.90, 0.60, 7000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1299, 'Pepaya lodeh', 'https://img-global.cpcdn.com/recipes/5355bb65be878c54/680x482cq70/lodeh-pepaya-muda-foto-resep-utama.jpg', 275.00, 30.20, 11.60, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1300, 'Petis Ikan', 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/8/24/d361f072-450d-4d28-9195-2f6ffd192b85.jpg', 161.00, 24.00, 20.00, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1301, 'Petis Udang', 'https://img-global.cpcdn.com/recipes/9495ed8f8ea95711/680x482cq70/petis-udang-foto-resep-utama.jpg', 220.00, 40.00, 15.00, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1302, 'Pilus ', 'https://asset.kompas.com/crops/S7g9b7Wq4I4Ut3RoExzI7yd2mL4=/0x0:1000x667/750x500/data/photo/2021/12/10/61b2aa4cbd1f3.jpg', 514.00, 647.00, 1.00, 27000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1303, 'Pindang Ikan Banjar', 'https://img-global.cpcdn.com/recipes/14d53b21dadc8a0a/680x482cq70/pindang-patin-urang-banjar-ala-ulun-foto-resep-utama.jpg', 157.00, 0.00, 28.00, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1304, 'Pindang Ikan Benggol', 'https://img-global.cpcdn.com/recipes/c8d60c4a0a1eeb05/680x482cq70/pindang-benggol-bumbu-kecap-mantuuul-foto-resep-utama.jpg', 170.00, 0.00, 31.00, 20000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1305, 'Pindang Ikan Layang', 'https://img-global.cpcdn.com/recipes/d32672cdc5392959/400x400cq70/photo.jpg', 153.00, 0.00, 30.00, 12000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1306, 'Pindang Ikan Selar Kecil', 'https://img-global.cpcdn.com/recipes/e291e5bf58d67808/680x482cq70/pindang-ikan-selar-foto-resep-utama.jpg', 142.00, 0.00, 27.00, 12000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1307, 'Pindang kenari masakan', 'https://lestariweb.com/ResepImages/PindangIkanKenari.jpg', 124.00, 0.00, 9.50, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1308, 'Pisang Goreng ', 'https://awsimages.detik.net.id/community/media/visual/2022/06/28/resep-pisang-goreng-keriting_43.jpeg?w=1200', 220.00, 6.30, 2.30, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1309, 'Pulut', 'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/B407551B-198D-472D-B9D8-4F11D6C1AE25/Derivates/91E2E036-AF80-4A24-91FF-EE9631211E26.jpg', 216.00, 44.40, 2.60, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1310, 'Putu Mayang ', 'https://awsimages.detik.net.id/community/media/visual/2022/05/12/resep-putu-mayang-betawi_43.jpeg?w=1200', 200.00, 43.80, 1.00, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1311, 'Rambutan', 'https://www.homegrown.in/upload/product/big1193470275.jpg', 69.00, 18.10, 0.90, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1312, 'Rasbi (Beras Ubi)', 'https://warisanbudaya.kemdikbud.go.id/dashboard/media/photos/1613027332-tetap-5.jpg', 394.00, 76.60, 2.20, 40000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1313, 'Rawon masakan', 'https://www.masakapahariini.com/wp-content/uploads/2018/04/resep-rawon-daging-500x300.jpg', 60.00, 4.00, 5.40, 5000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1314, 'Rebon kering', 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/8/13/d25ccc26-81c6-414e-9210-b7b5a5903789.jpg', 299.00, 3.20, 29.40, 20000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1315, 'Rebon udang kecil segar', 'https://agrozine.id/wp-content/uploads/2022/07/Udang-Rebon.jpg', 81.00, 0.70, 16.20, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1316, 'Rebung', 'https://cdn1-production-images-kly.akamaized.net/VdkaPQZ7BOhsrzOWdXKVwhjeaYY=/1200x900/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/1740001/original/057180700_1508071681-Sederet-Manfaat-Rebung-untuk-Kesehatan.jpg', 27.00, 5.20, 0.60, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1317, 'Rendang sapi masakan', 'https://asset.kompas.com/crops/HDe5rLDP0dEOLb6MC_UPvRTwFg8=/0x141:500x474/750x500/data/photo/2021/05/11/609a08809259f.jpg', 193.00, 7.80, 22.60, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1318, 'Risoles ', 'https://rasabunda.com/wp-content/uploads/2021/08/Risoles-Ragout.jpg', 335.00, 70.50, 5.30, 27000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1319, 'Roti Gambang ', 'https://cdn0-production-images-kly.akamaized.net/TR6XRCpau_4ik-E3GDzTng6DDnU=/0x300:4496x2834/1200x675/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3573373/original/099205200_1631765412-shutterstock_1786072643.jpg', 350.00, 75.50, 7.50, 29000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1320, 'Roti Putih', 'https://www.yesdok.com/visual/slideshow/slices-bread-white-background-article-1625550183.jpg?w=1200', 248.00, 50.00, 8.00, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1321, 'Rujak cingur', 'https://lingkar.news/wp-content/uploads/2023/03/Resep-Rujak-Cingur-Makanan-Tradisional-Khas-Surabaya.jpg', 153.00, 8.00, 11.30, 18000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1322, 'Rumput laut', 'https://cdn.infobrand.id/images/img/posts/2019/07/11/pemerintah-sebut-rumput-laut-potensial-jadi-lumbung-rupiah.jpg', 41.00, 8.10, 1.40, 7000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1323, 'Sapi abon', 'https://cdn0-production-images-kly.akamaized.net/fqIGhZT1Z1Zu36S_0_xZCoJSI5A=/1200x900/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3980335/original/086906600_1648695608-Abon_Sapi_Premium.jpg', 212.00, 59.30, 18.00, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1324, 'Sate Kulit ', 'https://img.qraved.co/v2/image/data/over-1530587392136-x.png', 110.00, 11.50, 15.50, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1325, 'Sate Usus ', 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/03/17/92418359.jpeg', 126.70, 1.30, 14.00, 16000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1326, 'Sawi', 'https://i0.wp.com/resepkoki.id/wp-content/uploads/2018/02/sawi-hijau.jpg?fit=700%2C465&ssl=1', 22.00, 4.00, 2.30, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1327, 'Sawi putih / pecai segar', 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1562321062/attached_image/simak-manfaat-sawi-putih-dan-cara-mengolahnya.jpg', 9.00, 1.70, 1.00, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1328, 'Sawi taiwan segar', 'https://bosmayur.com/wp-content/uploads/2020/10/SAWI-HIJAU-TAIWAN.jpg', 30.00, 4.40, 1.90, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1329, 'Sawo', 'https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2022/02/18/manfaat-makan-buah-sawojpg-20220218054230.jpg', 92.00, 22.40, 0.50, 8000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1330, 'Sayur asem', 'https://kbu-cdn.com/dk/wp-content/uploads/sayur-asem-betawi.jpg', 29.00, 5.00, 0.70, 9000, 'Murah', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1331, 'Sayur bunga pepaya', 'https://img.okezone.com/content/2016/08/11/298/1461224/resep-tumis-bunga-pepaya-anti-pahit-FVC55ioetB.jpg', 49.00, 9.80, 1.70, 10000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1332, 'Sayur sop', 'https://www.astronauts.id/blog/wp-content/uploads/2022/07/Resep-Sayur-Sop-Bening-Enak-dan-Gurih-Cocok-Saat-Tubuh-Kurang-Fit-1024x683.jpg', 27.00, 1.00, 1.30, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1333, 'Sayur umbut kelapa', 'https://cdn0-production-images-kly.akamaized.net/H6v-Vuj_s2NuBQ1JVdAtUOraaOI=/0x0:998x562/469x260/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3603077/original/021559400_1634270571-shutterstock_2045298773.jpg', 67.00, 5.10, 5.20, 6000, 'Murah', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1334, 'Selada', 'https://www.batamfresh.com/wp-content/uploads/2015/12/Selada-Keriting.jpg', 15.00, 2.90, 1.20, 5000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1335, 'Selada Air rebus', 'https://cdn.yummy.co.id/content-images/images/20210709/49DvTl27doQU4KTcGvMeptYfrUCVyrTW-31363235383338343334d41d8cd98f00b204e9800998ecf8427e.jpg?x-oss-process=image/format,webp', 19.00, 2.90, 2.70, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1336, 'Semangka', 'https://cdn.timesmedia.co.id/images/2018/10/03/Semangka-Merah.jpg', 28.00, 6.90, 0.50, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1337, 'Semur Jengkol ', 'https://assets.pikiran-rakyat.com/crop/0x135:1080x1215/x/photo/2020/11/25/1187166638.jpg', 192.50, 30.30, 4.50, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1338, 'Shabu-shabu', 'https://drive.google.com/file/d/1LZOGoU3M3XcPbU5_HaAZ26ybCTbiTXpT/view?usp=sharing', 88.00, 0.80, 3.20, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1339, 'Singkong Goreng ', 'https://sweetrip.id/wp-content/uploads/2022/04/singkong.jpeg', 285.00, 28.00, 1.00, 16000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1340, 'Singkong kukus', 'https://asset.kompas.com/crops/5kSIoZRz5urTHMM1PdoIQ64E0zU=/0x0:996x664/750x500/data/photo/2021/08/21/61208628cd52c.jpg', 146.00, 34.70, 1.20, 12000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1341, 'Singkong tape', 'https://image-cdn.medkomtek.com/KWOw6uO2QBAVuCumxbrxIkbIIek=/1200x675/smart/klikdokter-media-buckets/medias/2321509/original/051458700_1606124573-Awas-Kebanyakan-Makan-Tape-Singkong-Bikin-Keputihan-shutterstock_1790685980.jpg', 173.00, 42.50, 0.50, 17000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1342, 'Siomay ', 'https://awsimages.detik.net.id/community/media/visual/2021/11/17/resep-siomay-ayan-jamur_43.jpeg?w=1200', 95.30, 14.40, 4.40, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1343, 'Sirsak', 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/09/20/3327403627.jpeg', 65.00, 16.30, 1.00, 9000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1344, 'Sop buntut masakan', 'https://img-global.cpcdn.com/recipes/91727f982ad54daa/1200x630cq70/photo.jpg', 71.00, 2.20, 7.50, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1345, 'Sop daging sapi masakan', 'https://img.okezone.com/content/2020/02/27/298/2175054/resep-sayur-sop-daging-masakan-rumahan-paling-populer-24WHr0ACJo.jpg', 49.00, 5.30, 5.80, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1346, 'Sop kaki sapi masakan', 'https://www.ruparupa.com/blog/wp-content/uploads/2021/06/Screen-Shot-2021-06-21-at-14.11.27.png', 68.00, 3.70, 9.00, 8000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1347, 'Sop kambing masakan', 'https://asset.kompas.com/crops/4BopB2so0iCh5Dj_6QkB41md3B0=/3x0:700x465/750x500/data/photo/2021/01/15/6000de7b45e69.jpg', 34.00, 1.10, 5.50, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1348, 'Sop Kool dan Wortel', 'https://img-global.cpcdn.com/recipes/8adcb73d8f012620/680x482cq70/sop-kol-simple-foto-resep-utama.jpg', 15.00, 3.10, 0.60, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1349, 'Soto betawi masakan', 'https://www.unileverfoodsolutions.co.id/dam/global-ufs/mcos/SEA/calcmenu/recipes/ID-recipes/soups/soto-betawi/main-header.jpg', 135.00, 11.50, 2.50, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1350, 'Soto dengan Daging', 'https://img.kurio.network/mjtADdO0Q-nnAohGaTqVBvp8rMc=/1200x1200/filters:quality(80)/https://kurio-img.kurioapps.com/21/03/01/0bfa7a3d-28f6-440f-907b-def23ccb96d9.jpe', 127.50, 8.30, 2.60, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1351, 'Soto jeroan masakan', 'https://awsimages.detik.net.id/community/media/visual/2022/03/15/resep-soto-jeroan-sapi_43.jpeg?w=1200', 92.00, 1.40, 11.80, 6000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1352, 'Spaghetti', 'https://images.immediate.co.uk/production/volatile/sites/30/2022/09/Spicy-tomato-spaghetti-caf3053.jpg', 139.00, 22.60, 7.40, 10000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1353, 'Srikaya', 'https://images.tokopedia.net/blog-tokopedia-com/uploads/2021/02/Manfaat-Buah-Srikaya-untuk-Kesehatan.jpg', 101.00, 35.20, 1.70, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1354, 'Tahu goreng', 'https://img-global.cpcdn.com/recipes/33285f91f3b22e50/1200x630cq70/photo.jpg', 115.00, 2.50, 9.70, 14000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1355, 'Tahu telur', 'https://resepkoki.id/wp-content/uploads/2021/09/Resep-Tahu-Telur.jpg', 328.00, 24.60, 12.60, 32000, 'Premium', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1356, 'Tekwan', 'https://cdn0-production-images-kly.akamaized.net/j6uieBQwJPfQO1YqUyADA34MfBA=/0x355:667x731/1200x675/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3402174/original/073058800_1615863502-shutterstock_1597851637.jpg', 53.00, 9.40, 1.90, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1357, 'Tempe Goreng ', 'https://asset.kompas.com/crops/tnGS6LHPv4vxzDYTS-JJdLXBrjo=/0x41:1000x708/1200x800/data/photo/2020/04/01/5e841eccea33c.jpg', 328.00, 12.80, 18.40, 22000, 'Mahal', 'Vegan', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1358, 'Terong kukus', 'https://1.bp.blogspot.com/-Geazm3gHNOw/WrJfbbzv9XI/AAAAAAAACe0/ivjlGyMEIuQKPKORmHkPF9SIluhx0Ad5ACLcBGAs/s1600/photo.jpg', 23.00, 4.90, 1.80, 9000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1359, 'Tim (nasi tim)', 'https://www.mooimom.id/media/ck-uploads/2022/06/28/nasi-tim-bayi-bubur-ayam_lnEjENK.jpg', 120.00, 26.00, 2.40, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1360, 'Tiwul  ', 'https://asset.kompas.com/crops/_Lav4KVP5NTBM2GTsDVtTxgCx08=/70x0:914x563/750x500/data/photo/2021/12/03/61a9f9d558fc0.jpg', 353.00, 83.40, 2.40, 26000, 'Mahal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1361, 'Toge Goreng ', 'https://akcdn.detik.net.id/community/media/visual/2019/04/22/de16ca5c-a9d9-4197-a567-b818b1d59d94.jpeg?w=1208', 93.60, 15.10, 4.40, 6000, 'Murah', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1362, 'Tumis bandeng', 'https://img.okezone.com/content/2018/04/26/298/1891625/kacang-panjang-tumis-tauge-dan-bandeng-bumbu-acar-menu-makan-siang-yang-sempurna-fPgLm3B8Js.jpg', 189.00, 0.60, 11.30, 19000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1363, 'Tumis bayam bersantan', 'https://cdn1-production-images-kly.akamaized.net/4a0ttXDkFeMMNthY5iFfBhug3Ys=/1200x675/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3437424/original/069907400_1619146736-Bobor_Bayam_Jagung.jpg', 48.00, 2.60, 1.40, 10000, 'Normal', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1364, 'Ubi Cilembu', 'https://assets-a1.kompasiana.com/items/album/2021/11/11/img-20211111-wa0043-618cbcd606310e41062eaf72.jpg', 186.00, 44.30, 1.90, 20000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1365, 'Ubi Jalar Goreng ', 'https://resepkoki.id/wp-content/uploads/2022/03/Resep-Ubi-Goreng.jpg', 160.00, 55.30, 3.70, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1366, 'Ubi jalar kuning kukus', 'https://img-global.cpcdn.com/recipes/96d4a66b6b3523c4/1200x630cq70/photo.jpg', 100.00, 23.80, 0.70, 13000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1367, 'Ubi Jalar Rebus', 'https://d1bpj0tv6vfxyp.cloudfront.net/articles/807337_27-11-2020_8-6-29.jpeg', 114.00, 25.60, 1.40, 11000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1368, 'Ubi Jalar Sayur', 'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/jawapos/2022/11/daun-ubi-jalar.jpg', 184.00, 22.50, 1.40, 17000, 'Normal', 'Vegetarian', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1369, 'Woku ubi', 'https://img-global.cpcdn.com/recipes/6ee7c77a5d0b37cb/680x482cq70/daun-singkong-masak-woku-foto-resep-utama.jpg', 143.00, 15.00, 3.10, 15000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10');
INSERT INTO `makanan` (`id`, `nama_makanan`, `gambar`, `kalori`, `karbohidrat`, `protein`, `harga`, `level_harga`, `tipe_diet`, `cluster`, `created_at`, `updated_at`) VALUES
(1370, 'Yangko', 'https://serikatnews.com/wp-content/uploads/2022/12/yangko-giant.jpg', 254.00, 58.10, 3.00, 14000, 'Normal', 'Normal', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10'),
(1371, 'Yoghurt', 'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2022/08/04071319/Inilah-Alasan-Greek-Yogurt-Menjadi-Cemilan-Sehat.jpg', 52.00, 4.00, 3.30, 7000, 'Murah', 'Keto', NULL, '2025-07-13 04:33:10', '2025-07-13 04:33:10');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_06_28_185227_add_role_to_users_table', 1),
(6, '2025_06_30_123240_create_makanans_table', 1),
(7, '2025_07_01_015833_create_aktivitas_users_table', 1),
(8, '2025_07_02_021634_create_favorit_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@example.com', 'admin', NULL, '$2y$10$xVtgA3.pgh40eTalwrnhU.E.ZiP32pBdF3B90aQAPzY.La0xvqt0W', NULL, '2025-07-13 04:31:49', '2025-07-13 04:31:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aktivitas_users`
--
ALTER TABLE `aktivitas_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aktivitas_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorit`
--
ALTER TABLE `favorit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorit_user_id_foreign` (`user_id`),
  ADD KEY `favorit_makanan_id_foreign` (`makanan_id`);

--
-- Indexes for table `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aktivitas_users`
--
ALTER TABLE `aktivitas_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorit`
--
ALTER TABLE `favorit`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `makanan`
--
ALTER TABLE `makanan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1372;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aktivitas_users`
--
ALTER TABLE `aktivitas_users`
  ADD CONSTRAINT `aktivitas_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorit`
--
ALTER TABLE `favorit`
  ADD CONSTRAINT `favorit_makanan_id_foreign` FOREIGN KEY (`makanan_id`) REFERENCES `makanan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorit_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
