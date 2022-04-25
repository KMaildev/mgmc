-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 25, 2022 at 06:55 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mgmcsoftware_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_classifications`
--

CREATE TABLE `account_classifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_classification_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `financial_statement` enum('BalanceSheet','IncomeStatement') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'users_log', 'updated', 'App\\User', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"Dev Test\",\"email\":\"developer@gmail.com\",\"employee_id\":\"EMP-0001\",\"phone\":\"09444161997\",\"nrc_number\":null,\"address\":\"YGN\",\"department_id\":1,\"created_at\":\"2022-03-28T17:58:34.000000Z\",\"updated_at\":\"2022-04-25T15:55:08.000000Z\"},\"old\":{\"name\":\"Dev Test\",\"email\":\"developer@gmail.com\",\"employee_id\":\"EMP-0001\",\"phone\":\"09444161997\",\"nrc_number\":null,\"address\":\"YGN\",\"department_id\":1,\"created_at\":\"2022-03-28T17:58:34.000000Z\",\"updated_at\":\"2022-04-25T15:15:46.000000Z\"}}', '2022-04-25 09:25:08', '2022-04-25 09:25:08'),
(2, 'suppliers_log', 'created', 'App\\Models\\Supplier', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"Mg Mg\",\"company\":null,\"phone\":\"09444161997\",\"description\":\"asdf\",\"created_at\":\"2022-04-25T15:55:34.000000Z\",\"updated_at\":\"2022-04-25T15:55:34.000000Z\"}}', '2022-04-25 09:25:34', '2022-04-25 09:25:34'),
(3, 'brands_log', 'updated', 'App\\Models\\Brand', 5, 'App\\User', 1, '{\"attributes\":{\"name\":\"Truck Boxx\",\"created_at\":\"2022-04-25T16:06:47.000000Z\",\"updated_at\":\"2022-04-25T16:11:12.000000Z\"},\"old\":{\"name\":\"Truck Box\",\"created_at\":\"2022-04-25T16:06:47.000000Z\",\"updated_at\":\"2022-04-25T16:06:47.000000Z\"}}', '2022-04-25 09:41:12', '2022-04-25 09:41:12'),
(4, 'brands_log', 'deleted', 'App\\Models\\Brand', 5, 'App\\User', 1, '{\"attributes\":{\"name\":\"Truck Boxx\",\"created_at\":\"2022-04-25T16:06:47.000000Z\",\"updated_at\":\"2022-04-25T16:11:12.000000Z\"}}', '2022-04-25 09:41:17', '2022-04-25 09:41:17'),
(5, 'products_log', 'created', 'App\\Models\\Products', 1, 'App\\User', 1, '{\"attributes\":{\"name\":null,\"item_code\":null,\"description\":null,\"opening_cost\":null,\"opening_quantity\":null,\"qty_at_date\":null,\"selling_price\":null,\"sale_account_id\":null,\"cost_of_unit\":null,\"purchase_account_id\":null,\"created_at\":\"2022-04-25T16:36:05.000000Z\",\"updated_at\":\"2022-04-25T16:36:05.000000Z\"}}', '2022-04-25 10:06:05', '2022-04-25 10:06:05'),
(6, 'products_log', 'created', 'App\\Models\\Products', 2, 'App\\User', 1, '{\"attributes\":{\"name\":null,\"item_code\":null,\"description\":null,\"opening_cost\":null,\"opening_quantity\":null,\"qty_at_date\":null,\"selling_price\":null,\"sale_account_id\":null,\"cost_of_unit\":null,\"purchase_account_id\":null,\"created_at\":\"2022-04-25T16:36:15.000000Z\",\"updated_at\":\"2022-04-25T16:36:15.000000Z\"}}', '2022-04-25 10:06:15', '2022-04-25 10:06:15'),
(7, 'products_log', 'created', 'App\\Models\\Products', 3, 'App\\User', 1, '{\"attributes\":{\"name\":null,\"item_code\":null,\"description\":null,\"opening_cost\":null,\"opening_quantity\":null,\"qty_at_date\":null,\"selling_price\":null,\"sale_account_id\":null,\"cost_of_unit\":null,\"purchase_account_id\":null,\"created_at\":\"2022-04-25T16:36:28.000000Z\",\"updated_at\":\"2022-04-25T16:36:28.000000Z\"}}', '2022-04-25 10:06:28', '2022-04-25 10:06:28'),
(8, 'products_log', 'updated', 'App\\Models\\Products', 3, 'App\\User', 1, '{\"attributes\":{\"product\":\"X5 Maxx\",\"brand_id\":\"3\",\"quantity\":\"10\",\"created_at\":\"2022-04-25T16:36:28.000000Z\",\"updated_at\":\"2022-04-25T16:47:37.000000Z\"},\"old\":{\"product\":\"X5 Max\",\"brand_id\":\"3\",\"quantity\":\"0\",\"created_at\":\"2022-04-25T16:36:28.000000Z\",\"updated_at\":\"2022-04-25T16:36:28.000000Z\"}}', '2022-04-25 10:17:37', '2022-04-25 10:17:37'),
(9, 'products_log', 'deleted', 'App\\Models\\Products', 2, 'App\\User', 1, '{\"attributes\":{\"product\":\"Captiva\",\"brand_id\":\"2\",\"quantity\":\"0\",\"created_at\":\"2022-04-25T16:36:15.000000Z\",\"updated_at\":\"2022-04-25T16:36:15.000000Z\"}}', '2022-04-25 10:18:10', '2022-04-25 10:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_books`
--

CREATE TABLE `cash_books` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_book_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iv_one` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iv_two` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_code_id` int(11) NOT NULL,
  `account_type_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash_account_id` int(11) DEFAULT NULL,
  `bank_account` int(11) DEFAULT NULL,
  `cash_in` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash_out` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_in` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_out` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chartof_accounts`
--

CREATE TABLE `chartof_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `coa_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `account_classification_id` int(11) DEFAULT NULL,
  `account_opening_balance` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chartof_account_id` int(11) DEFAULT NULL,
  `sub_or_main_account` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nrc_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dealer_customer_id` int(11) DEFAULT NULL,
  `dealer_or_hp` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_02_10_103209_create_account_classifications_table', 1),
(5, '2022_02_10_173302_create_account_types_table', 1),
(6, '2022_02_11_065406_create_chartof_accounts_table', 1),
(7, '2022_03_24_192125_create_cash_books_table', 1),
(8, '2022_03_25_064339_create_customers_table', 1),
(9, '2022_03_25_073157_create_suppliers_table', 1),
(10, '2022_03_25_093621_create_products_table', 2),
(11, '2022_03_28_065307_create_activity_log_table', 2),
(12, '2022_04_25_152320_create_brands_table', 2),
(13, '2022_04_25_154422_create_departments_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_year` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body_color` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interior_color` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engine_power` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chessi_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engine_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `door` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seater` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `company`, `phone`, `email`, `address`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Mg Mg', NULL, '09444161997', 'mg@gmail.comasdf', 'asdf', 'asdf', '2022-04-25 09:25:34', '2022-04-25 09:25:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nrc_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `last_login_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `employee_id`, `phone`, `nrc_number`, `gender`, `address`, `department_id`, `last_login_at`, `last_login_ip`, `agent`) VALUES
(1, 'Dev Test', 'developer@gmail.com', NULL, '$2y$10$fCdZ6o33mm5ftnDrz63j4O1ssBWd1mrEaCfHLwaVpgr2ei7t3RURe', NULL, '2022-03-28 11:28:34', '2022-04-25 09:25:08', 'EMP-0001', '09444161997', NULL, 'male', 'YGN', 1, '2022-04-25 15:55:08', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'),
(2, 'U Aung Cho Tun', 'aungchotun@gmail.com', NULL, '$2y$10$tl7wt/VHxT8TX1cZwGzUhuT/RyFx.TU3kI/2gmAXywdc294eCHTra', 'KyAsL3PniXpQqZBoPCp50e8Pq9rw4IjSBsYgJD8eQJod5ICz3u8M4vcOKrdZ', '2022-03-28 19:41:13', '2022-03-31 08:39:12', 'EMP-00002', '09123123123', NULL, 'male', 'YGN', 1, '2022-03-31 15:39:12', '69.160.8.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_classifications`
--
ALTER TABLE `account_classifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_classifications_ac_code_unique` (`ac_code`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_types_number_unique` (`number`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_books`
--
ALTER TABLE `cash_books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chartof_accounts`
--
ALTER TABLE `chartof_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chartof_accounts_coa_number_unique` (`coa_number`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_classifications`
--
ALTER TABLE `account_classifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_books`
--
ALTER TABLE `cash_books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chartof_accounts`
--
ALTER TABLE `chartof_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
