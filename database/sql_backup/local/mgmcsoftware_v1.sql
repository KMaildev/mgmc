-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2022 at 09:21 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

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
(1, 'products_log', 'created', 'App\\Models\\Products', 1, 'App\\User', 1, '{\"attributes\":{\"product\":\"Q22B\",\"brand_id\":null,\"brand_name\":\"Karry\",\"quantity\":\"1\",\"created_at\":\"2022-05-15T05:18:50.000000Z\",\"updated_at\":\"2022-05-15T05:18:50.000000Z\"}}', '2022-05-14 22:48:50', '2022-05-14 22:48:50'),
(2, 'products_log', 'created', 'App\\Models\\Products', 2, 'App\\User', 1, '{\"attributes\":{\"product\":\"Q22B\",\"brand_id\":null,\"brand_name\":\"Karry\",\"quantity\":\"1\",\"created_at\":\"2022-05-15T05:18:50.000000Z\",\"updated_at\":\"2022-05-15T05:18:50.000000Z\"}}', '2022-05-14 22:48:50', '2022-05-14 22:48:50'),
(3, 'customers_log', 'created', 'App\\Models\\Customers', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"U Maung Maung Soe\",\"phone\":\"09123123123\",\"description\":null,\"opening_balance\":\"0\",\"opening_balance_date\":null,\"created_at\":\"2022-05-15T05:30:49.000000Z\",\"updated_at\":\"2022-05-15T05:30:49.000000Z\"}}', '2022-05-14 23:00:49', '2022-05-14 23:00:49'),
(4, 'customers_log', 'created', 'App\\Models\\Customers', 2, 'App\\User', 1, '{\"attributes\":{\"name\":\"U Aung Zaw Win\",\"phone\":\"09123123123\",\"description\":null,\"opening_balance\":\"0\",\"opening_balance_date\":null,\"created_at\":\"2022-05-15T05:32:47.000000Z\",\"updated_at\":\"2022-05-15T05:32:47.000000Z\"}}', '2022-05-14 23:02:47', '2022-05-14 23:02:47'),
(5, 'customers_log', 'updated', 'App\\Models\\Customers', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"U Maung Maung Soe\",\"phone\":\"09123123123\",\"description\":null,\"opening_balance\":\"0\",\"opening_balance_date\":null,\"created_at\":\"2022-05-15T05:30:49.000000Z\",\"updated_at\":\"2022-05-15T05:33:46.000000Z\"},\"old\":{\"name\":\"U Maung Maung Soe\",\"phone\":\"09123123123\",\"description\":null,\"opening_balance\":\"0\",\"opening_balance_date\":null,\"created_at\":\"2022-05-15T05:30:49.000000Z\",\"updated_at\":\"2022-05-15T05:30:49.000000Z\"}}', '2022-05-14 23:03:46', '2022-05-14 23:03:46'),
(6, 'customers_log', 'updated', 'App\\Models\\Customers', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"U Maung Maung Soe\",\"phone\":\"09123123123\",\"description\":null,\"opening_balance\":\"0\",\"opening_balance_date\":null,\"created_at\":\"2022-05-15T05:30:49.000000Z\",\"updated_at\":\"2022-05-15T05:34:28.000000Z\"},\"old\":{\"name\":\"U Maung Maung Soe\",\"phone\":\"09123123123\",\"description\":null,\"opening_balance\":\"0\",\"opening_balance_date\":null,\"created_at\":\"2022-05-15T05:30:49.000000Z\",\"updated_at\":\"2022-05-15T05:33:46.000000Z\"}}', '2022-05-14 23:04:28', '2022-05-14 23:04:28'),
(7, 'customers_log', 'updated', 'App\\Models\\Customers', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"U Maung Maung Soe\",\"phone\":\"09123123123\",\"description\":null,\"opening_balance\":\"0\",\"opening_balance_date\":null,\"created_at\":\"2022-05-15T05:30:49.000000Z\",\"updated_at\":\"2022-05-15T05:34:45.000000Z\"},\"old\":{\"name\":\"U Maung Maung Soe\",\"phone\":\"09123123123\",\"description\":null,\"opening_balance\":\"0\",\"opening_balance_date\":null,\"created_at\":\"2022-05-15T05:30:49.000000Z\",\"updated_at\":\"2022-05-15T05:34:28.000000Z\"}}', '2022-05-14 23:04:45', '2022-05-14 23:04:45'),
(8, 'customers_log', 'updated', 'App\\Models\\Customers', 2, 'App\\User', 1, '{\"attributes\":{\"name\":\"U Aung Zaw Win\",\"phone\":\"09123123123\",\"description\":null,\"opening_balance\":\"0\",\"opening_balance_date\":null,\"created_at\":\"2022-05-15T05:32:47.000000Z\",\"updated_at\":\"2022-05-15T05:35:50.000000Z\"},\"old\":{\"name\":\"U Aung Zaw Win\",\"phone\":\"09123123123\",\"description\":null,\"opening_balance\":\"0\",\"opening_balance_date\":null,\"created_at\":\"2022-05-15T05:32:47.000000Z\",\"updated_at\":\"2022-05-15T05:32:47.000000Z\"}}', '2022-05-14 23:05:50', '2022-05-14 23:05:50'),
(9, 'departments_log', 'created', 'App\\Models\\Department', 1, 'App\\User', 1, '{\"attributes\":{\"title\":\"Admin\",\"created_at\":\"2022-05-15T06:36:25.000000Z\",\"updated_at\":\"2022-05-15T06:36:25.000000Z\"}}', '2022-05-15 00:06:25', '2022-05-15 00:06:25'),
(10, 'departments_log', 'created', 'App\\Models\\Department', 2, 'App\\User', 1, '{\"attributes\":{\"title\":\"Purchase\",\"created_at\":\"2022-05-15T06:36:31.000000Z\",\"updated_at\":\"2022-05-15T06:36:31.000000Z\"}}', '2022-05-15 00:06:31', '2022-05-15 00:06:31'),
(11, 'departments_log', 'created', 'App\\Models\\Department', 3, 'App\\User', 1, '{\"attributes\":{\"title\":\"Sale\",\"created_at\":\"2022-05-15T06:36:34.000000Z\",\"updated_at\":\"2022-05-15T06:36:34.000000Z\"}}', '2022-05-15 00:06:34', '2022-05-15 00:06:34'),
(12, 'users_log', 'created', 'App\\User', 3, 'App\\User', 1, '{\"attributes\":{\"name\":\"Ma May Myat Mon\",\"email\":\"mamaymyatmon@gmail.com\",\"employee_id\":\"EMP-00001\",\"phone\":\"0912312312\",\"nrc_number\":null,\"address\":\"YGN\",\"department_id\":3,\"created_at\":\"2022-05-15T06:38:07.000000Z\",\"updated_at\":\"2022-05-15T06:38:07.000000Z\"}}', '2022-05-15 00:08:07', '2022-05-15 00:08:07'),
(13, 'users_log', 'updated', 'App\\User', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"Dev Test\",\"email\":\"developer@gmail.com\",\"employee_id\":\"EMP-0001\",\"phone\":\"09444161997\",\"nrc_number\":null,\"address\":\"YGN\",\"department_id\":1,\"created_at\":\"2022-03-28T17:58:34.000000Z\",\"updated_at\":\"2022-06-01T02:17:14.000000Z\"},\"old\":{\"name\":\"Dev Test\",\"email\":\"developer@gmail.com\",\"employee_id\":\"EMP-0001\",\"phone\":\"09444161997\",\"nrc_number\":null,\"address\":\"YGN\",\"department_id\":1,\"created_at\":\"2022-03-28T17:58:34.000000Z\",\"updated_at\":\"2022-05-12T16:41:42.000000Z\"}}', '2022-05-31 19:47:14', '2022-05-31 19:47:14'),
(14, 'products_log', 'created', 'App\\Models\\Products', 3, 'App\\User', 1, '{\"attributes\":{\"product\":\"Q22B\",\"brand_id\":null,\"brand_name\":\"Karry\",\"quantity\":\"1\",\"created_at\":\"2022-06-01T02:19:12.000000Z\",\"updated_at\":\"2022-06-01T02:19:12.000000Z\"}}', '2022-05-31 19:49:12', '2022-05-31 19:49:12'),
(15, 'products_log', 'created', 'App\\Models\\Products', 4, 'App\\User', 1, '{\"attributes\":{\"product\":\"Q22B\",\"brand_id\":null,\"brand_name\":\"Karry\",\"quantity\":\"1\",\"created_at\":\"2022-06-01T02:19:12.000000Z\",\"updated_at\":\"2022-06-01T02:19:12.000000Z\"}}', '2022-05-31 19:49:12', '2022-05-31 19:49:12'),
(16, 'products_log', 'created', 'App\\Models\\Products', 5, 'App\\User', 1, '{\"attributes\":{\"product\":\"Car\",\"brand_id\":null,\"brand_name\":\"Karry\",\"quantity\":\"1\",\"created_at\":\"2022-06-01T02:24:31.000000Z\",\"updated_at\":\"2022-06-01T02:24:31.000000Z\"}}', '2022-05-31 19:54:31', '2022-05-31 19:54:31'),
(17, 'products_log', 'created', 'App\\Models\\Products', 6, 'App\\User', 1, '{\"attributes\":{\"product\":\"Car\",\"brand_id\":null,\"brand_name\":\"Karry\",\"quantity\":\"1\",\"created_at\":\"2022-06-01T02:26:06.000000Z\",\"updated_at\":\"2022-06-01T02:26:06.000000Z\"}}', '2022-05-31 19:56:06', '2022-05-31 19:56:06'),
(18, 'products_log', 'deleted', 'App\\Models\\Products', 6, 'App\\User', 1, '{\"attributes\":{\"product\":\"Car\",\"brand_id\":null,\"brand_name\":\"Karry\",\"quantity\":\"1\",\"created_at\":\"2022-06-01T02:26:06.000000Z\",\"updated_at\":\"2022-06-01T02:26:06.000000Z\"}}', '2022-05-31 19:56:19', '2022-05-31 19:56:19'),
(19, 'products_log', 'deleted', 'App\\Models\\Products', 5, 'App\\User', 1, '{\"attributes\":{\"product\":\"Car\",\"brand_id\":null,\"brand_name\":\"Karry\",\"quantity\":\"1\",\"created_at\":\"2022-06-01T02:24:31.000000Z\",\"updated_at\":\"2022-06-01T02:24:31.000000Z\"}}', '2022-05-31 19:56:30', '2022-05-31 19:56:30'),
(20, 'users_log', 'updated', 'App\\User', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"Dev Test\",\"email\":\"developer@gmail.com\",\"employee_id\":\"EMP-0001\",\"phone\":\"09444161997\",\"nrc_number\":null,\"address\":\"YGN\",\"department_id\":1,\"created_at\":\"2022-03-28T17:58:34.000000Z\",\"updated_at\":\"2022-06-01T13:44:46.000000Z\"},\"old\":{\"name\":\"Dev Test\",\"email\":\"developer@gmail.com\",\"employee_id\":\"EMP-0001\",\"phone\":\"09444161997\",\"nrc_number\":null,\"address\":\"YGN\",\"department_id\":1,\"created_at\":\"2022-03-28T17:58:34.000000Z\",\"updated_at\":\"2022-06-01T02:17:14.000000Z\"}}', '2022-06-01 07:14:47', '2022-06-01 07:14:47'),
(21, 'users_log', 'updated', 'App\\User', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"Dev Test\",\"email\":\"developer@gmail.com\",\"employee_id\":\"EMP-0001\",\"phone\":\"09444161997\",\"nrc_number\":null,\"address\":\"YGN\",\"department_id\":1,\"created_at\":\"2022-03-28T17:58:34.000000Z\",\"updated_at\":\"2022-06-01T14:47:44.000000Z\"},\"old\":{\"name\":\"Dev Test\",\"email\":\"developer@gmail.com\",\"employee_id\":\"EMP-0001\",\"phone\":\"09444161997\",\"nrc_number\":null,\"address\":\"YGN\",\"department_id\":1,\"created_at\":\"2022-03-28T17:58:34.000000Z\",\"updated_at\":\"2022-06-01T13:44:46.000000Z\"}}', '2022-06-01 08:17:44', '2022-06-01 08:17:44'),
(22, 'customers_log', 'created', 'App\\Models\\Customers', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"MGM\",\"phone\":\"09\",\"description\":null,\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:12:28.000000Z\",\"updated_at\":\"2022-06-01T15:12:28.000000Z\"}}', '2022-06-01 08:42:28', '2022-06-01 08:42:28'),
(23, 'customers_log', 'updated', 'App\\Models\\Customers', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"MGM\",\"phone\":\"09\",\"description\":\"Ok\",\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:12:28.000000Z\",\"updated_at\":\"2022-06-01T15:23:03.000000Z\"},\"old\":{\"name\":\"MGM\",\"phone\":\"09\",\"description\":null,\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:12:28.000000Z\",\"updated_at\":\"2022-06-01T15:12:28.000000Z\"}}', '2022-06-01 08:53:03', '2022-06-01 08:53:03'),
(24, 'customers_log', 'updated', 'App\\Models\\Customers', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"MGM\",\"phone\":\"09\",\"description\":\"Ok\",\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:12:28.000000Z\",\"updated_at\":\"2022-06-01T15:23:07.000000Z\"},\"old\":{\"name\":\"MGM\",\"phone\":\"09\",\"description\":\"Ok\",\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:12:28.000000Z\",\"updated_at\":\"2022-06-01T15:23:03.000000Z\"}}', '2022-06-01 08:53:07', '2022-06-01 08:53:07'),
(25, 'customers_log', 'created', 'App\\Models\\Customers', 3, 'App\\User', 1, '{\"attributes\":{\"name\":\"Mg Mg\",\"phone\":\"09444161554\",\"description\":\"Ok\",\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:41:30.000000Z\",\"updated_at\":\"2022-06-01T15:41:30.000000Z\"}}', '2022-06-01 09:11:30', '2022-06-01 09:11:30'),
(26, 'customers_log', 'created', 'App\\Models\\Customers', 4, 'App\\User', 1, '{\"attributes\":{\"name\":\"U Soe\",\"phone\":\"091231311\",\"description\":\"Hello\",\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:42:39.000000Z\",\"updated_at\":\"2022-06-01T15:42:39.000000Z\"}}', '2022-06-01 09:12:39', '2022-06-01 09:12:39'),
(27, 'customers_log', 'created', 'App\\Models\\Customers', 5, 'App\\User', 1, '{\"attributes\":{\"name\":\"Mg Mg\",\"phone\":\"askf\",\"description\":\"as\",\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:43:55.000000Z\",\"updated_at\":\"2022-06-01T15:43:55.000000Z\"}}', '2022-06-01 09:13:55', '2022-06-01 09:13:55'),
(28, 'customers_log', 'updated', 'App\\Models\\Customers', 2, 'App\\User', 1, '{\"attributes\":{\"name\":\"HP\",\"phone\":\"09\",\"description\":\"Ok\",\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:12:28.000000Z\",\"updated_at\":\"2022-06-01T15:51:30.000000Z\"},\"old\":{\"name\":\"HP\",\"phone\":\"09\",\"description\":\"Ok\",\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:12:28.000000Z\",\"updated_at\":\"2022-06-01T15:23:07.000000Z\"}}', '2022-06-01 09:21:30', '2022-06-01 09:21:30'),
(29, 'customers_log', 'updated', 'App\\Models\\Customers', 2, 'App\\User', 1, '{\"attributes\":{\"name\":\"HP Customer\",\"phone\":\"09\",\"description\":\"Ok\",\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:12:28.000000Z\",\"updated_at\":\"2022-06-01T15:51:39.000000Z\"},\"old\":{\"name\":\"HP\",\"phone\":\"09\",\"description\":\"Ok\",\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:12:28.000000Z\",\"updated_at\":\"2022-06-01T15:51:30.000000Z\"}}', '2022-06-01 09:21:39', '2022-06-01 09:21:39'),
(30, 'customers_log', 'updated', 'App\\Models\\Customers', 5, 'App\\User', 1, '{\"attributes\":{\"name\":\"Mg Mg\",\"phone\":\"askf\",\"description\":\"as\",\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:43:55.000000Z\",\"updated_at\":\"2022-06-01T15:56:32.000000Z\"},\"old\":{\"name\":\"Mg Mg\",\"phone\":\"askf\",\"description\":\"as\",\"opening_balance\":null,\"opening_balance_date\":null,\"created_at\":\"2022-06-01T15:43:55.000000Z\",\"updated_at\":\"2022-06-01T15:43:55.000000Z\"}}', '2022-06-01 09:26:32', '2022-06-01 09:26:32'),
(31, 'customers_log', 'updated', 'App\\Models\\Customers', 5, 'App\\User', 1, '{\"attributes\":{\"name\":\"Mg Mg\",\"company_name\":\"Mg Mg\",\"dealer_code\":null,\"city\":\"YGN\",\"address\":\"kasdf\",\"phone\":\"askf\",\"description\":\"as\",\"created_at\":\"2022-06-01T15:43:55.000000Z\",\"updated_at\":\"2022-06-01T15:58:08.000000Z\"},\"old\":{\"name\":\"Mg Mg\",\"company_name\":\"Mg Mg\",\"dealer_code\":null,\"city\":\"YGN\",\"address\":\"kasdf\",\"phone\":\"askf\",\"description\":\"as\",\"created_at\":\"2022-06-01T15:43:55.000000Z\",\"updated_at\":\"2022-06-01T15:56:32.000000Z\"}}', '2022-06-01 09:28:08', '2022-06-01 09:28:08'),
(32, 'customers_log', 'updated', 'App\\Models\\Customers', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"MGM SOE\",\"company_name\":\"Karry Show room (ASE)\",\"dealer_code\":\"MGM-001-YGN-Karry1\",\"city\":\"Yangon\",\"address\":\"Yangon City\",\"phone\":\"09\",\"description\":\"Ok\",\"created_at\":\"2022-06-01T15:12:28.000000Z\",\"updated_at\":\"2022-06-01T15:59:52.000000Z\"},\"old\":{\"name\":\"MGM\",\"company_name\":\"Karry Show room (ASE)\",\"dealer_code\":\"MGM-001-YGN-Karry1\",\"city\":\"Yangon\",\"address\":\"Yangon City\",\"phone\":\"09\",\"description\":\"Ok\",\"created_at\":\"2022-06-01T15:12:28.000000Z\",\"updated_at\":\"2022-06-01T15:23:07.000000Z\"}}', '2022-06-01 09:29:52', '2022-06-01 09:29:52'),
(33, 'customers_log', 'created', 'App\\Models\\Customers', 6, 'App\\User', 1, '{\"attributes\":{\"name\":\"MGM\",\"company_name\":\"Karry Show room (Head Office)\",\"dealer_code\":\"MGM-002-YGN-MGM\",\"city\":\"Yangon\",\"address\":null,\"phone\":null,\"description\":null,\"created_at\":\"2022-06-01T04:15:44.000000Z\",\"updated_at\":\"2022-06-01T04:15:44.000000Z\"}}', '2022-06-01 09:45:44', '2022-06-01 09:45:44'),
(34, 'suppliers_log', 'created', 'App\\Models\\Supplier', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"Chery Commercial Vehicle(Anhui) Company Limited\",\"company\":null,\"phone\":\"959\",\"description\":null,\"created_at\":\"2022-06-01T04:48:19.000000Z\",\"updated_at\":\"2022-06-01T04:48:19.000000Z\"}}', '2022-06-01 10:18:19', '2022-06-01 10:18:19');

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
  `company_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dealer_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dealer_or_hp` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dealer_customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `company_name`, `dealer_code`, `city`, `address`, `phone`, `email`, `description`, `dealer_or_hp`, `dealer_customer_id`, `created_at`, `updated_at`) VALUES
(1, 'MGM SOE', 'Karry Show room (ASE)', 'MGM-001-YGN-Karry1', 'Yangon', 'Yangon City', '09', 'bnaauto.902@gmail.com', 'Ok', 'dealer', 0, '2022-06-01 08:42:28', '2022-06-01 09:29:52'),
(2, 'HP Customer', 'Karry Show room (ASE)', 'MGM-001-YGN-Karry1', 'Yangon', 'Yangon City', '09', 'bnaauto.902@gmail.com', 'Ok', 'hp', 1, '2022-06-01 08:42:28', '2022-06-01 09:21:39'),
(3, 'Mg Mg', 'OK Company', NULL, 'Yangon', 'YGN', '09444161554', 'mgmg@gmail.com', 'Ok', 'dealer', 2, '2022-06-01 09:11:30', '2022-06-01 09:11:30'),
(4, 'U Soe', 'S Company', NULL, 'YGN', 'YGN', '091231311', 'mgmg@gmail.com', 'Hello', 'hp', 1, '2022-06-01 09:12:39', '2022-06-01 09:12:39'),
(5, 'Mg Mg', 'Mg Mg', NULL, 'YGN', 'kasdf', 'askf', 'aksdf@gmail.com', 'as', 'hp', 3, '2022-06-01 09:13:55', '2022-06-01 09:28:08'),
(6, 'MGM', 'Karry Show room (Head Office)', 'MGM-002-YGN-MGM', 'Yangon', NULL, NULL, NULL, NULL, 'dealer', 0, '2022-05-31 21:45:44', '2022-05-31 21:45:44');

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

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2022-05-15 00:06:25', '2022-05-15 00:06:25'),
(2, 'Purchase', '2022-05-15 00:06:31', '2022-05-15 00:06:31'),
(3, 'Sale', '2022-05-15 00:06:34', '2022-05-15 00:06:34');

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
(9, '2022_03_25_073157_create_suppliers_table', 1),
(10, '2022_03_25_093621_create_products_table', 1),
(11, '2022_03_28_065307_create_activity_log_table', 1),
(12, '2022_04_25_152320_create_brands_table', 1),
(13, '2022_04_25_154422_create_departments_table', 1),
(14, '2022_03_25_064339_create_customers_table', 2),
(15, '2022_06_01_184253_create_sales_invoices_table', 3),
(17, '2022_06_01_184854_create_sales_invoices_payments_table', 3),
(18, '2022_06_01_184553_create_sales_items_table', 4);

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
  `brand_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commodity` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_usd` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_value_ad` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_duty_other_tax_percent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commercial_tax_percent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maccs_service_fee` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_fee` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redemption_fine` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advance_tax_percent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product`, `type`, `model_no`, `model_year`, `configuration`, `body_color`, `interior_color`, `engine_power`, `chessi_no`, `engine_no`, `weight`, `door`, `seater`, `vehicle_no`, `quantity`, `remark`, `user_id`, `brand_id`, `brand_name`, `commodity`, `id_no`, `unit`, `amount_usd`, `exchange_rate`, `adjustment_value_ad`, `import_duty_other_tax_percent`, `commercial_tax_percent`, `maccs_service_fee`, `security_fee`, `redemption_fine`, `advance_tax_percent`, `import_date`, `created_at`, `updated_at`) VALUES
(1, 'Q22B', 'Left Hand Drive', 'Model:2019; 1300 CC', '2019', '-', '-', '-', '1300 CC', 'LVMZ1A1A2KF143205', NULL, '-', '-', '-', '-', '1', NULL, '1', NULL, 'Karry', 'ILNS ILV192002891', '100141000000', 'Unit', '3800', '1422.52', '0', '10', '5', '15000', '10000', '100000', '2', '', '2022-05-14 22:48:50', '2022-05-14 22:48:50'),
(2, 'Q22B', 'Left Hand Drive', 'Model:2019; 1300 CC', '2019', '-', '-', '-', '1300 CC', 'LVMZ1A1A8KF143211', NULL, '-', '-', '-', '-', '1', NULL, '1', NULL, 'Karry', 'ILNS ILV192002891', '100141000000', 'Unit', '3800', '1422.52', '0', '10', '5', '15000', '10000', '100000', '2', '', '2022-05-14 22:48:50', '2022-05-14 22:48:50'),
(3, 'Q22B', 'Left Hand Drive', 'Model:2019; 1300 CC', '2019', '-', '-', '-', '1300 CC', 'LVMZ1A1A2KF143205', NULL, '-', '-', '-', '-', '1', NULL, '1', NULL, 'Karry', 'ILNS ILV192002891', '100000000000', 'Unit', '3800', '1422.52', '0', '10', '5', '15000', '10000', '100000', '2', '', '2022-05-31 19:49:12', '2022-05-31 19:49:12'),
(4, 'Q22B', 'Left Hand Drive', 'Model:2019; 1300 CC', '2019', '-', '-', '-', '1300 CC', 'LVMZ1A1A8KF143211', NULL, '-', '-', '-', '-', '1', NULL, '1', NULL, 'Karry', 'ILNS ILV192002891', '100000000000', 'Unit', '3800', '1422.52', '0', '10', '5', '15000', '10000', '100000', '2', '', '2022-05-31 19:49:12', '2022-05-31 19:49:12');

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoices`
--

CREATE TABLE `sales_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_invoices`
--

INSERT INTO `sales_invoices` (`id`, `invoice_no`, `invoice_date`, `customer_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'IV-00001', '2022-06-02', 1, 1, '2022-06-01 12:48:57', '2022-06-01 12:48:57'),
(2, 'IV-00001', '2022-06-02', 1, 1, '2022-06-01 12:50:53', '2022-06-01 12:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoices_payments`
--

CREATE TABLE `sales_invoices_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `down_payment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dealer_ercentage` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_invoice_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_invoices_payments`
--

INSERT INTO `sales_invoices_payments` (`id`, `down_payment`, `discount`, `dealer_ercentage`, `sales_invoice_id`, `created_at`, `updated_at`) VALUES
(1, '1000', '0', NULL, 2, '2022-06-01 12:50:53', '2022-06-01 12:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `sales_items`
--

CREATE TABLE `sales_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `unit_price` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_invoice_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_items`
--

INSERT INTO `sales_items` (`id`, `product_id`, `qty`, `unit_price`, `sales_invoice_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1000', 2, '2022-06-01 12:50:53', '2022-06-01 12:50:53');

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
(1, 'Chery Commercial Vehicle(Anhui) Company Limited', NULL, '959', 'Xurupeng@mychery.com', 'No-8 Building 717 South Zhongshan Road,Science and Technology Industrial Park,Yijiang District,Wuhu,Anhui,China', NULL, '2022-05-31 22:18:19', '2022-05-31 22:18:19');

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
(1, 'Dev Test', 'developer@gmail.com', NULL, '$2y$10$fCdZ6o33mm5ftnDrz63j4O1ssBWd1mrEaCfHLwaVpgr2ei7t3RURe', NULL, '2022-03-28 11:28:34', '2022-06-01 08:17:44', 'EMP-0001', '09444161997', NULL, 'male', 'YGN', 1, '2022-06-01 14:47:44', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36'),
(2, 'U Aung Cho Tun', 'aungchotun@gmail.com', NULL, '$2y$10$tl7wt/VHxT8TX1cZwGzUhuT/RyFx.TU3kI/2gmAXywdc294eCHTra', 'KyAsL3PniXpQqZBoPCp50e8Pq9rw4IjSBsYgJD8eQJod5ICz3u8M4vcOKrdZ', '2022-03-28 19:41:13', '2022-03-31 08:39:12', 'EMP-00002', '09123123123', NULL, 'male', 'YGN', 1, '2022-03-31 15:39:12', '69.160.8.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0'),
(3, 'Ma May Myat Mon', 'mamaymyatmon@gmail.com', NULL, '$2y$10$sSmcokRLRJBbuuOogCQamOWL4FCnsBgZkLQIcJn4MkRPhGWx6krDC', NULL, '2022-05-15 00:08:07', '2022-05-15 00:08:07', 'EMP-00001', '0912312312', NULL, 'male', 'YGN', 3, NULL, NULL, NULL);

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
-- Indexes for table `sales_invoices`
--
ALTER TABLE `sales_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_invoices_payments`
--
ALTER TABLE `sales_invoices_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_items`
--
ALTER TABLE `sales_items`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales_invoices`
--
ALTER TABLE `sales_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_invoices_payments`
--
ALTER TABLE `sales_invoices_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
