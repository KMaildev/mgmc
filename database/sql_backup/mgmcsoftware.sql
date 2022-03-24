-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 24, 2022 at 08:51 PM
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
-- Database: `mgmcsoftware`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_classifications`
--

CREATE TABLE `account_classifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_classifications`
--

INSERT INTO `account_classifications` (`id`, `name`, `ac_code`, `created_at`, `updated_at`) VALUES
(1, 'Assets', '1-000', '2022-02-11 00:46:11', '2022-02-11 00:46:11'),
(2, 'Equity', '3-000', '2022-02-11 00:46:39', '2022-02-11 00:46:39'),
(4, 'Revenue', '4-000', '2022-02-11 00:46:52', '2022-02-11 00:46:52'),
(5, 'COGS', '5-000', '2022-02-11 00:47:03', '2022-02-11 00:47:03'),
(6, 'Other Income', '4-100', '2022-02-11 00:47:15', '2022-02-11 00:47:15'),
(7, 'Operation Expenses', '5-100', '2022-02-11 00:47:26', '2022-02-11 00:47:26'),
(8, 'Administration Expenses', '6-100', '2022-02-11 00:47:37', '2022-02-11 00:47:37'),
(9, 'Selling & Distribution Expenses', '6-200', '2022-02-11 00:47:47', '2022-02-11 00:47:47'),
(10, 'Finance Costs', '6-300', '2022-02-11 00:47:56', '2022-02-11 00:47:56'),
(11, 'Other Expenses', '6-400', '2022-02-11 00:48:06', '2022-02-11 00:48:06'),
(12, 'Liabilities', '2-000', '2022-02-11 00:46:25', '2022-02-11 00:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_classification_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `financial_statement` enum('BalanceSheet','IncomeStatement') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`id`, `number`, `description`, `account_classification_id`, `financial_statement`, `created_at`, `updated_at`) VALUES
(1, '1-010', 'Cash', '1', 'BalanceSheet', '2022-02-13 21:35:53', '2022-02-13 21:35:53'),
(2, '1-100', 'Bank', '1', 'BalanceSheet', '2022-02-13 21:36:16', '2022-02-13 21:36:16'),
(3, '1-200', 'Account Receivable', '1', 'BalanceSheet', '2022-02-13 21:36:32', '2022-02-13 21:36:32'),
(4, '1-300', 'Prepaid Expenses', '1', 'BalanceSheet', '2022-02-13 21:36:51', '2022-02-13 21:36:51'),
(5, '1-400', 'Inventory', '1', 'BalanceSheet', '2022-02-13 21:37:40', '2022-02-13 21:37:40'),
(6, '1-500', 'Non Current Assets', '1', 'BalanceSheet', '2022-02-13 21:37:51', '2022-02-13 21:37:51'),
(7, '1-600', 'Accumulated Depreciation', '1', 'BalanceSheet', '2022-02-13 21:38:07', '2022-02-13 21:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `cash_books`
--

CREATE TABLE `cash_books` (
  `id` bigint(20) UNSIGNED NOT NULL,
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

--
-- Dumping data for table `cash_books`
--

INSERT INTO `cash_books` (`id`, `cash_book_date`, `month`, `year`, `iv_one`, `iv_two`, `account_code_id`, `account_type_id`, `description`, `cash_account_id`, `bank_account`, `cash_in`, `cash_out`, `bank_in`, `bank_out`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2022-03-25', '03', '2022', 'IV-00001', NULL, 12, '1', 'Cahs', 12, 0, '500', '0', '0', '0', 1, '2022-03-24 13:12:47', '2022-03-24 13:12:47'),
(2, '2022-03-25', '03', '2022', 'IV-0002', 'IV-0002', 12, '1', 'asdfasd', 12, 0, '5000', '3000', '9000', '9000', 1, '2022-03-24 13:21:33', '2022-03-24 13:21:33');

-- --------------------------------------------------------

--
-- Table structure for table `chartof_accounts`
--

CREATE TABLE `chartof_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coa_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_classification_id` int(11) NOT NULL,
  `account_opening_balance` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chartof_account_id` int(11) DEFAULT NULL,
  `sub_or_main_account` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chartof_accounts`
--

INSERT INTO `chartof_accounts` (`id`, `coa_number`, `description`, `account_type_id`, `created_at`, `updated_at`, `account_classification_id`, `account_opening_balance`, `chartof_account_id`, `sub_or_main_account`) VALUES
(1, '1-100', 'Bank', 2, '2022-03-10 22:35:04', '2022-03-10 22:35:04', 1, '0', NULL, 'main_account'),
(2, '1-200', 'Account Receivable', 3, '2022-03-10 22:42:32', '2022-03-10 22:42:32', 1, '0', NULL, 'main_account'),
(3, '1-202', 'Trade Receivable-Vehicles', 3, '2022-03-10 22:43:26', '2022-03-10 22:43:26', 1, '0', NULL, 'main_account'),
(4, '1-100-7', 'AYA  Saving  MMK-0092202010055139/20021829943', 2, '2022-03-11 00:20:22', '2022-03-21 10:20:36', 1, '0', 1, 'sub_account'),
(5, '1-100-2', 'AYA Current MMK-0092102010003865/10003821978', 2, '2022-03-11 00:30:17', '2022-03-11 00:30:17', 1, '0', 1, 'sub_account'),
(6, '1-100-3', 'AYA  USD-10004060570', 2, '2022-03-11 00:30:45', '2022-03-11 00:30:45', 1, '0', 1, 'sub_account'),
(7, '1-202-1', 'D-A Yay Kyo', 3, '2022-03-11 00:31:21', '2022-03-11 00:31:21', 1, '0', 3, 'sub_account'),
(11, '1-301', 'Deferred Expenditure Factory Rental', 4, '2022-03-24 12:23:50', '2022-03-24 12:23:50', 1, '0', NULL, 'main_account'),
(12, '1-010', 'Cash', 1, '2022-03-24 12:39:16', '2022-03-24 12:39:16', 1, '0', NULL, 'main_account');

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
(4, '2022_02_10_103209_create_account_classifications_table', 2),
(5, '2022_02_10_173302_create_account_types_table', 3),
(6, '2022_02_11_065406_create_chartof_accounts_table', 4),
(7, '2022_02_11_073056_add_account_classification_id_to_chartof_accounts_table', 5),
(8, '2022_02_11_172145_add_opening_balance_to_chartof_accounts_table', 6),
(9, '2022_02_11_173529_drop_opening_balance_from_chartof_accounts_table', 7),
(10, '2022_02_11_174226_add_account_opening_balance_to_chartof_accounts_table', 8),
(11, '2022_02_11_182521_drop_account_opening_balance_from_chartof_accounts_table', 9),
(12, '2022_02_11_182700_add_account_opening_balance_to_chartof_accounts_table', 10),
(13, '2022_02_14_033711_add_account_opening_balance_to_chartof_accounts_table', 11),
(14, '2022_03_11_063919_add_chartof_account_id_to_chartof_accounts_table', 12),
(15, '2022_03_24_192125_create_cash_books_table', 13);

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$sEC8.T7pB0XueE8ovjiOmOnAif1m/H2H9eNoh95/zkgr7UUid7Uly', NULL, '2022-02-10 15:10:38', '2022-02-10 15:10:38'),
(2, 'Admin', 'admin@skg.com', NULL, '$2y$10$uA.0FxxHyeuGxY/n51CT0uMv2V3lpOsmexE.0RpwL.ar2ubuCUQHe', NULL, '2022-02-14 03:35:54', '2022-02-14 03:35:54');

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_classifications`
--
ALTER TABLE `account_classifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cash_books`
--
ALTER TABLE `cash_books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chartof_accounts`
--
ALTER TABLE `chartof_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
