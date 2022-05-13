-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 13, 2022 at 01:34 PM
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
(1, 'products_log', 'deleted', 'App\\Models\\Products', 5, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-13T04:11:17.000000Z\",\"updated_at\":\"2022-05-13T04:11:17.000000Z\"}}', '2022-05-13 01:40:26', '2022-05-13 01:40:26'),
(2, 'products_log', 'updated', 'App\\Models\\Products', 1, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"2\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:10:31.000000Z\"},\"old\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-12T05:32:18.000000Z\"}}', '2022-05-13 02:40:31', '2022-05-13 02:40:31'),
(3, 'products_log', 'updated', 'App\\Models\\Products', 1, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:12:35.000000Z\"},\"old\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"2\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:10:31.000000Z\"}}', '2022-05-13 02:42:35', '2022-05-13 02:42:35'),
(4, 'products_log', 'updated', 'App\\Models\\Products', 1, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"2\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:12:52.000000Z\"},\"old\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:12:35.000000Z\"}}', '2022-05-13 02:42:52', '2022-05-13 02:42:52'),
(5, 'products_log', 'updated', 'App\\Models\\Products', 1, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:12:55.000000Z\"},\"old\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"2\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:12:52.000000Z\"}}', '2022-05-13 02:42:55', '2022-05-13 02:42:55'),
(6, 'products_log', 'updated', 'App\\Models\\Products', 1, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"asdf\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:13:02.000000Z\"},\"old\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:12:55.000000Z\"}}', '2022-05-13 02:43:02', '2022-05-13 02:43:02'),
(7, 'products_log', 'updated', 'App\\Models\\Products', 1, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"2\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:13:59.000000Z\"},\"old\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:13:02.000000Z\"}}', '2022-05-13 02:43:59', '2022-05-13 02:43:59'),
(8, 'products_log', 'updated', 'App\\Models\\Products', 1, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:14:08.000000Z\"},\"old\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"2\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:13:59.000000Z\"}}', '2022-05-13 02:44:08', '2022-05-13 02:44:08'),
(9, 'products_log', 'updated', 'App\\Models\\Products', 2, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"2\",\"created_at\":\"2022-05-13T04:11:17.000000Z\",\"updated_at\":\"2022-05-13T09:14:16.000000Z\"},\"old\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-13T04:11:17.000000Z\",\"updated_at\":\"2022-05-13T04:11:17.000000Z\"}}', '2022-05-13 02:44:16', '2022-05-13 02:44:16'),
(10, 'products_log', 'updated', 'App\\Models\\Products', 1, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:14:45.000000Z\"},\"old\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:14:08.000000Z\"}}', '2022-05-13 02:44:45', '2022-05-13 02:44:45'),
(11, 'products_log', 'updated', 'App\\Models\\Products', 1, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:15:36.000000Z\"},\"old\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:14:45.000000Z\"}}', '2022-05-13 02:45:36', '2022-05-13 02:45:36'),
(12, 'products_log', 'updated', 'App\\Models\\Products', 3, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-13T04:11:17.000000Z\",\"updated_at\":\"2022-05-13T09:17:21.000000Z\"},\"old\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-13T04:11:17.000000Z\",\"updated_at\":\"2022-05-13T04:11:17.000000Z\"}}', '2022-05-13 02:47:21', '2022-05-13 02:47:21'),
(13, 'products_log', 'updated', 'App\\Models\\Products', 3, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"asfd\",\"created_at\":\"2022-05-13T04:11:17.000000Z\",\"updated_at\":\"2022-05-13T09:21:34.000000Z\"},\"old\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-13T04:11:17.000000Z\",\"updated_at\":\"2022-05-13T09:17:21.000000Z\"}}', '2022-05-13 02:51:34', '2022-05-13 02:51:34'),
(14, 'brands_log', 'created', 'App\\Models\\Brand', 1, 'App\\User', 1, '{\"attributes\":{\"name\":\"Q22D\",\"created_at\":\"2022-05-13T09:23:55.000000Z\",\"updated_at\":\"2022-05-13T09:23:55.000000Z\"}}', '2022-05-13 02:53:55', '2022-05-13 02:53:55'),
(15, 'products_log', 'updated', 'App\\Models\\Products', 1, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":\"1\",\"brand_name\":\"Mitsubishi\",\"quantity\":\"0\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:24:11.000000Z\"},\"old\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-12T05:32:18.000000Z\",\"updated_at\":\"2022-05-13T09:15:36.000000Z\"}}', '2022-05-13 02:54:11', '2022-05-13 02:54:11'),
(16, 'products_log', 'created', 'App\\Models\\Products', 6, 'App\\User', 1, '{\"attributes\":{\"product\":\"10\",\"brand_id\":\"1\",\"brand_name\":\"10\",\"quantity\":\"10\",\"created_at\":\"2022-05-13T09:26:04.000000Z\",\"updated_at\":\"2022-05-13T09:26:04.000000Z\"}}', '2022-05-13 02:56:04', '2022-05-13 02:56:04'),
(17, 'products_log', 'updated', 'App\\Models\\Products', 6, 'App\\User', 1, '{\"attributes\":{\"product\":\"10\",\"brand_id\":\"1\",\"brand_name\":\"10\",\"quantity\":\"0\",\"created_at\":\"2022-05-13T09:26:04.000000Z\",\"updated_at\":\"2022-05-13T09:28:34.000000Z\"},\"old\":{\"product\":\"10\",\"brand_id\":\"1\",\"brand_name\":\"10\",\"quantity\":\"10\",\"created_at\":\"2022-05-13T09:26:04.000000Z\",\"updated_at\":\"2022-05-13T09:26:04.000000Z\"}}', '2022-05-13 02:58:34', '2022-05-13 02:58:34'),
(18, 'products_log', 'updated', 'App\\Models\\Products', 6, 'App\\User', 1, '{\"attributes\":{\"product\":\"20\",\"brand_id\":\"1\",\"brand_name\":\"20\",\"quantity\":\"20\",\"created_at\":\"2022-05-13T09:26:04.000000Z\",\"updated_at\":\"2022-05-13T09:28:59.000000Z\"},\"old\":{\"product\":\"10\",\"brand_id\":\"1\",\"brand_name\":\"10\",\"quantity\":\"0\",\"created_at\":\"2022-05-13T09:26:04.000000Z\",\"updated_at\":\"2022-05-13T09:28:34.000000Z\"}}', '2022-05-13 02:58:59', '2022-05-13 02:58:59'),
(19, 'products_log', 'updated', 'App\\Models\\Products', 6, 'App\\User', 1, '{\"attributes\":{\"product\":\"20\",\"brand_id\":\"1\",\"brand_name\":\"20\",\"quantity\":\"10\",\"created_at\":\"2022-05-13T09:26:04.000000Z\",\"updated_at\":\"2022-05-13T09:30:14.000000Z\"},\"old\":{\"product\":\"20\",\"brand_id\":\"1\",\"brand_name\":\"20\",\"quantity\":\"20\",\"created_at\":\"2022-05-13T09:26:04.000000Z\",\"updated_at\":\"2022-05-13T09:28:59.000000Z\"}}', '2022-05-13 03:00:14', '2022-05-13 03:00:14'),
(20, 'products_log', 'updated', 'App\\Models\\Products', 6, 'App\\User', 1, '{\"attributes\":{\"product\":\"20\",\"brand_id\":\"1\",\"brand_name\":\"20\",\"quantity\":\"30\",\"created_at\":\"2022-05-13T09:26:04.000000Z\",\"updated_at\":\"2022-05-13T09:30:37.000000Z\"},\"old\":{\"product\":\"20\",\"brand_id\":\"1\",\"brand_name\":\"20\",\"quantity\":\"10\",\"created_at\":\"2022-05-13T09:26:04.000000Z\",\"updated_at\":\"2022-05-13T09:30:14.000000Z\"}}', '2022-05-13 03:00:37', '2022-05-13 03:00:37'),
(21, 'products_log', 'created', 'App\\Models\\Products', 7, 'App\\User', 1, '{\"attributes\":{\"product\":\"10\",\"brand_id\":\"1\",\"brand_name\":\"10\",\"quantity\":\"10\",\"created_at\":\"2022-05-13T09:31:15.000000Z\",\"updated_at\":\"2022-05-13T09:31:15.000000Z\"}}', '2022-05-13 03:01:15', '2022-05-13 03:01:15'),
(22, 'products_log', 'updated', 'App\\Models\\Products', 6, 'App\\User', 1, '{\"attributes\":{\"product\":\"20\",\"brand_id\":\"1\",\"brand_name\":\"20\",\"quantity\":\"1\",\"created_at\":\"2022-05-13T09:26:04.000000Z\",\"updated_at\":\"2022-05-13T09:33:38.000000Z\"},\"old\":{\"product\":\"20\",\"brand_id\":\"1\",\"brand_name\":\"20\",\"quantity\":\"30\",\"created_at\":\"2022-05-13T09:26:04.000000Z\",\"updated_at\":\"2022-05-13T09:30:37.000000Z\"}}', '2022-05-13 03:03:38', '2022-05-13 03:03:38'),
(23, 'products_log', 'updated', 'App\\Models\\Products', 7, 'App\\User', 1, '{\"attributes\":{\"product\":\"10\",\"brand_id\":\"1\",\"brand_name\":\"10\",\"quantity\":\"2\",\"created_at\":\"2022-05-13T09:31:15.000000Z\",\"updated_at\":\"2022-05-13T09:33:47.000000Z\"},\"old\":{\"product\":\"10\",\"brand_id\":\"1\",\"brand_name\":\"10\",\"quantity\":\"10\",\"created_at\":\"2022-05-13T09:31:15.000000Z\",\"updated_at\":\"2022-05-13T09:31:15.000000Z\"}}', '2022-05-13 03:03:47', '2022-05-13 03:03:47'),
(24, 'products_log', 'updated', 'App\\Models\\Products', 7, 'App\\User', 1, '{\"attributes\":{\"product\":\"10\",\"brand_id\":\"1\",\"brand_name\":\"10\",\"quantity\":\"1\",\"created_at\":\"2022-05-13T09:31:15.000000Z\",\"updated_at\":\"2022-05-13T09:33:54.000000Z\"},\"old\":{\"product\":\"10\",\"brand_id\":\"1\",\"brand_name\":\"10\",\"quantity\":\"2\",\"created_at\":\"2022-05-13T09:31:15.000000Z\",\"updated_at\":\"2022-05-13T09:33:47.000000Z\"}}', '2022-05-13 03:03:54', '2022-05-13 03:03:54'),
(25, 'products_log', 'created', 'App\\Models\\Products', 1, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-13T11:10:29.000000Z\",\"updated_at\":\"2022-05-13T11:10:29.000000Z\"}}', '2022-05-13 04:40:29', '2022-05-13 04:40:29'),
(26, 'products_log', 'created', 'App\\Models\\Products', 2, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-13T11:11:32.000000Z\",\"updated_at\":\"2022-05-13T11:11:32.000000Z\"}}', '2022-05-13 04:41:32', '2022-05-13 04:41:32'),
(27, 'products_log', 'created', 'App\\Models\\Products', 3, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-13T11:11:32.000000Z\",\"updated_at\":\"2022-05-13T11:11:32.000000Z\"}}', '2022-05-13 04:41:32', '2022-05-13 04:41:32'),
(28, 'products_log', 'created', 'App\\Models\\Products', 4, 'App\\User', 1, '{\"attributes\":{\"product\":\"Eclip\",\"brand_id\":null,\"brand_name\":\"Mitsubishi\",\"quantity\":\"1\",\"created_at\":\"2022-05-13T11:11:32.000000Z\",\"updated_at\":\"2022-05-13T11:11:32.000000Z\"}}', '2022-05-13 04:41:32', '2022-05-13 04:41:32'),
(29, 'products_log', 'created', 'App\\Models\\Products', 5, 'App\\User', 1, '{\"attributes\":{\"product\":\"Q22B\",\"brand_id\":null,\"brand_name\":\"Karry\",\"quantity\":\"1\",\"created_at\":\"2022-05-13T11:32:29.000000Z\",\"updated_at\":\"2022-05-13T11:32:29.000000Z\"}}', '2022-05-13 05:02:29', '2022-05-13 05:02:29'),
(30, 'products_log', 'created', 'App\\Models\\Products', 6, 'App\\User', 1, '{\"attributes\":{\"product\":\"Q22B\",\"brand_id\":null,\"brand_name\":\"Karry\",\"quantity\":\"1\",\"created_at\":\"2022-05-13T11:32:29.000000Z\",\"updated_at\":\"2022-05-13T11:32:29.000000Z\"}}', '2022-05-13 05:02:30', '2022-05-13 05:02:30');

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

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Q22D', '2022-05-13 02:53:55', '2022-05-13 02:53:55');

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
(10, '2022_03_25_093621_create_products_table', 1),
(11, '2022_03_28_065307_create_activity_log_table', 1),
(12, '2022_04_25_152320_create_brands_table', 1),
(13, '2022_04_25_154422_create_departments_table', 1);

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
(1, 'Eclip', '-', '-', '-', '-', '-', '-', '-', '-', NULL, '-', '-', '-', '-', '1', NULL, '1', NULL, 'Mitsubishi', '-', '-', 'Unit', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '2022-05-13 04:40:29', '2022-05-13 04:40:29'),
(2, 'Eclip', '-', '-', '-', '-', '-', '-', '-', '-', NULL, '-', '-', '-', '-', '1', NULL, '1', NULL, 'Mitsubishi', '-', '-', 'Unit', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '', '2022-05-13 04:41:32', '2022-05-13 04:41:32'),
(3, 'Eclip', '-', '-', '-', '-', '-', '-', '-', '-', NULL, '-', '-', '-', '-', '1', NULL, '1', NULL, 'Mitsubishi', '-', '-', 'Unit', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '', '2022-05-13 04:41:32', '2022-05-13 04:41:32'),
(4, 'Eclip', '-', '-', '-', '-', '-', '-', '-', '-', NULL, '-', '-', '-', '-', '1', NULL, '1', NULL, 'Mitsubishi', '-', '-', 'Unit', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '', '2022-05-13 04:41:32', '2022-05-13 04:41:32'),
(5, 'Q22B', 'Left Hand Drive', 'Model:2019; 1300 CC', '2019', '-', '-', '-', '1300 CC', 'LVMZ1A1A2KF143205', NULL, '-', '-', '-', '-', '1', NULL, '1', NULL, 'Karry', 'ILNS ILV192002891', '100141000000', 'Unit', '3800', '1422.52', '0', '10', '5', '15000', '10000', '100000', '2', '', '2022-05-13 05:02:29', '2022-05-13 05:02:29'),
(6, 'Q22B', 'Left Hand Drive', 'Model:2019; 1300 CC', '2019', '-', '-', '-', '1300 CC', 'LVMZ1A1A8KF143211', NULL, '-', '-', '-', '-', '1', NULL, '1', NULL, 'Karry', 'ILNS ILV192002891', '100141000000', 'Unit', '3800', '1422.52', '0', '10', '5', '15000', '10000', '100000', '2', '', '2022-05-13 05:02:29', '2022-05-13 05:02:29');

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
(1, 'Dev Test', 'developer@gmail.com', NULL, '$2y$10$fCdZ6o33mm5ftnDrz63j4O1ssBWd1mrEaCfHLwaVpgr2ei7t3RURe', NULL, '2022-03-28 11:28:34', '2022-05-12 20:44:55', 'EMP-0001', '09444161997', NULL, 'male', 'YGN', 1, '2022-05-13 03:14:55', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36'),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
