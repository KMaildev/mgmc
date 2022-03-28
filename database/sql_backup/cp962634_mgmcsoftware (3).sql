-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 29, 2022 at 12:54 AM
-- Server version: 5.6.51
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cp962634_mgmcsoftware`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_classifications`
--

CREATE TABLE `account_classifications` (
  `id` int(11) NOT NULL,
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
(3, 'Revenue', '4-000', '2022-02-11 00:46:52', '2022-02-11 00:46:52'),
(4, 'COGS', '5-000', '2022-02-11 00:47:03', '2022-02-11 00:47:03'),
(5, 'Other Income', '4-100', '2022-02-11 00:47:15', '2022-02-11 00:47:15'),
(6, 'Operation Expenses', '5-100', '2022-02-11 00:47:26', '2022-02-11 00:47:26'),
(7, 'Administration Expenses', '6-100', '2022-02-11 00:47:37', '2022-02-11 00:47:37'),
(8, 'Selling & Distribution Expenses', '6-200', '2022-02-11 00:47:47', '2022-02-11 00:47:47'),
(9, 'Finance Costs', '6-300', '2022-02-11 00:47:56', '2022-02-11 00:47:56'),
(10, 'Other Expenses', '6-400', '2022-02-11 00:48:06', '2022-02-11 00:48:06'),
(11, 'Liabilities', '2-000', '2022-02-11 00:46:25', '2022-02-11 00:46:25');

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
(7, '1-600', 'Accumulated Depreciation', '1', 'BalanceSheet', '2022-02-13 21:38:07', '2022-02-13 21:38:07'),
(0, '1-700', 'Other Assets', '1', 'BalanceSheet', '2022-03-26 00:02:21', '2022-03-26 00:02:21'),
(0, '1-800', 'Advance Tax', '1', 'BalanceSheet', '2022-03-26 00:04:01', '2022-03-26 00:04:01'),
(0, '1-900', 'Advance Custom Duty', '1', 'BalanceSheet', '2022-03-26 00:05:12', '2022-03-26 00:05:12'),
(0, '2-100', 'Account Payable', '11', 'BalanceSheet', '2022-03-26 00:06:39', '2022-03-26 00:06:39'),
(0, '2-200', 'Accrued Liabilities', '11', 'BalanceSheet', '2022-03-26 00:07:29', '2022-03-26 00:07:29'),
(0, '2-300', 'Tax Payable', '11', 'BalanceSheet', '2022-03-26 00:09:51', '2022-03-26 00:09:51'),
(0, '2-400', 'Payroll Payable', '11', 'BalanceSheet', '2022-03-26 00:10:59', '2022-03-26 00:10:59'),
(0, '2-500', 'Other Payable', '11', 'BalanceSheet', '2022-03-26 00:11:46', '2022-03-26 00:11:46'),
(0, '2-600', 'Suspense Account', '11', 'BalanceSheet', '2022-03-26 00:12:52', '2022-03-26 00:12:52'),
(0, '2-700', 'Payable Custom Duty', '11', 'BalanceSheet', '2022-03-26 00:13:32', '2022-03-26 00:13:32'),
(0, '2-800', 'Long Term Loan', '11', 'BalanceSheet', '2022-03-26 00:14:32', '2022-03-26 00:14:32'),
(0, '3-100', 'Capital ( Common Stock )', '2', 'BalanceSheet', '2022-03-26 00:17:43', '2022-03-26 00:17:43'),
(0, '3-200', 'Additional Paid in Capital', '2', 'BalanceSheet', '2022-03-26 00:21:55', '2022-03-26 00:21:55'),
(0, '3-300', 'Dividend', '2', 'BalanceSheet', '2022-03-26 00:22:36', '2022-03-26 00:22:36'),
(0, '3-400', 'Retained Earning', '2', 'BalanceSheet', '2022-03-26 00:23:38', '2022-03-26 00:23:38'),
(0, '4-000', 'Revenue', '3', 'IncomeStatement', '2022-03-26 00:24:09', '2022-03-26 00:24:09'),
(0, '4-010', 'Sales Return and Allowance', '3', 'IncomeStatement', '2022-03-26 00:25:07', '2022-03-26 00:25:07'),
(0, '4-100', 'Other Income', '3', 'IncomeStatement', '2022-03-26 00:27:47', '2022-03-26 00:27:47'),
(0, '5-000', 'Cost of Good Sold', '4', 'IncomeStatement', '2022-03-26 00:48:10', '2022-03-26 00:48:10'),
(0, '5-100', 'Operation Expenses', '6', 'IncomeStatement', '2022-03-26 00:49:11', '2022-03-26 00:49:11'),
(0, '6-100', 'Administration Expenses', '7', 'IncomeStatement', '2022-03-26 00:50:06', '2022-03-26 00:50:06'),
(0, '6-200', 'Selling & Distribution Expenses', '8', 'IncomeStatement', '2022-03-26 00:51:21', '2022-03-26 00:51:21'),
(0, '6-300', 'Finance Costs', '9', 'IncomeStatement', '2022-03-26 00:51:57', '2022-03-26 00:51:57'),
(0, '6-400', 'Other Expenses', '10', 'IncomeStatement', '2022-03-26 00:52:56', '2022-03-26 00:52:56');

-- --------------------------------------------------------

--
-- Table structure for table `cash_books`
--

CREATE TABLE `cash_books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cash_book_date` text COLLATE utf8mb4_unicode_ci,
  `month` text COLLATE utf8mb4_unicode_ci,
  `year` text COLLATE utf8mb4_unicode_ci,
  `iv_one` text COLLATE utf8mb4_unicode_ci,
  `iv_two` text COLLATE utf8mb4_unicode_ci,
  `account_code_id` int(11) NOT NULL,
  `account_type_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cash_account_id` int(11) DEFAULT NULL,
  `bank_account` int(11) DEFAULT NULL,
  `cash_in` text COLLATE utf8mb4_unicode_ci,
  `cash_out` text COLLATE utf8mb4_unicode_ci,
  `bank_in` text COLLATE utf8mb4_unicode_ci,
  `bank_out` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chartof_accounts`
--

CREATE TABLE `chartof_accounts` (
  `id` int(11) NOT NULL,
  `coa_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_classification_id` int(11) NOT NULL,
  `account_opening_balance` text COLLATE utf8mb4_unicode_ci,
  `chartof_account_id` int(11) DEFAULT NULL,
  `sub_or_main_account` text COLLATE utf8mb4_unicode_ci,
  `opening_balance_date` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chartof_accounts`
--

INSERT INTO `chartof_accounts` (`id`, `coa_number`, `description`, `account_type_id`, `created_at`, `updated_at`, `account_classification_id`, `account_opening_balance`, `chartof_account_id`, `sub_or_main_account`, `opening_balance_date`) VALUES
(1, '1-010', 'Cash', 1, '2022-03-28 08:29:51', '2022-03-28 08:29:51', 1, '0', NULL, 'main_account', ''),
(2, '1-100', 'Bank', 2, '2022-03-28 08:30:59', '2022-03-28 08:30:59', 1, '0', NULL, 'main_account', ''),
(3, '1-200', 'Account Receivable', 3, '2022-03-28 08:31:42', '2022-03-28 08:31:42', 1, '0', NULL, 'main_account', ''),
(4, '1-201', 'Trade Receivable-Vehicles', 3, '2022-03-28 08:32:41', '2022-03-28 08:32:41', 1, '0', NULL, 'main_account', ''),
(5, '1-203', 'Trade Receivable-Spare Parts', 3, '2022-03-28 08:34:07', '2022-03-28 08:34:07', 1, '0', NULL, 'main_account', ''),
(6, '1-204', 'Trade Receivable-Truck Box', 3, '2022-03-28 08:35:10', '2022-03-28 08:35:10', 1, '0', NULL, 'main_account', ''),
(7, '1-205', 'Trade Receivable-Service', 3, '2022-03-28 08:35:47', '2022-03-28 08:35:47', 1, '0', NULL, 'main_account', ''),
(8, '1-206', 'Trade Receivable-Mitsubishi', 3, '2022-03-28 08:36:29', '2022-03-28 08:36:29', 1, '0', NULL, 'main_account', ''),
(9, '1-300', 'Prepaid Expenses', 4, '2022-03-28 08:37:09', '2022-03-28 08:37:09', 1, '0', NULL, 'main_account', ''),
(10, '1-301', 'Deferred Expenditure-Factory Rental', 4, '2022-03-28 08:37:51', '2022-03-28 08:37:51', 1, '0', NULL, 'main_account', ''),
(11, '1-302', 'Deferred Expenditure-Showroom Rental', 4, '2022-03-28 08:38:30', '2022-03-28 08:38:30', 1, '0', NULL, 'main_account', ''),
(12, '1-303', 'Deposit Payment to China Cherry Company', 4, '2022-03-28 08:39:18', '2022-03-28 08:39:18', 1, '0', NULL, 'main_account', ''),
(13, '1-304', 'Other Receivable', 4, '2022-03-28 08:39:52', '2022-03-28 08:39:52', 1, '0', NULL, 'main_account', ''),
(14, '1-305', 'MGM Mitsubishi Brand', 4, '2022-03-28 08:40:33', '2022-03-28 08:40:33', 1, '0', NULL, 'main_account', ''),
(15, '1-306', 'Gift Voucher', 4, '2022-03-28 08:41:03', '2022-03-28 08:41:03', 1, '0', NULL, 'main_account', ''),
(16, '1-307', 'Advance Payment', 4, '2022-03-28 08:41:56', '2022-03-28 08:41:56', 1, '0', NULL, 'main_account', ''),
(17, '1-308', 'Advance Salary', 4, '2022-03-28 08:42:22', '2022-03-28 08:42:22', 1, '0', NULL, 'main_account', ''),
(18, '1-309', 'Advance Permit', 4, '2022-03-28 08:42:59', '2022-03-28 08:42:59', 1, '0', NULL, 'main_account', ''),
(19, '1-310', 'Advance Insurance', 4, '2022-03-28 08:43:31', '2022-03-28 08:43:31', 1, '0', NULL, 'main_account', ''),
(20, '1-311', 'Investment Gold', 4, '2022-03-28 08:44:23', '2022-03-28 08:44:23', 1, '0', NULL, 'main_account', ''),
(21, '1-312', 'Investment Dollar', 4, '2022-03-28 08:44:59', '2022-03-28 08:44:59', 1, '0', NULL, 'main_account', ''),
(22, '1-400', 'Inventory', 5, '2022-03-28 08:45:33', '2022-03-28 08:45:33', 1, '0', NULL, 'main_account', ''),
(23, '1-401', 'Opening Inventory-Vehicle', 5, '2022-03-28 08:46:24', '2022-03-28 08:46:24', 1, '0', NULL, 'main_account', ''),
(24, '1-402', 'Opening Inventory-Spare Part', 5, '2022-03-28 08:48:47', '2022-03-28 08:48:47', 1, '0', NULL, 'main_account', ''),
(25, '1-403', 'Opening Inventory-Truck Box', 5, '2022-03-28 08:49:41', '2022-03-28 08:49:41', 1, '0', NULL, 'main_account', ''),
(26, '1-404', 'Closing Inventory-Vehicle', 5, '2022-03-28 08:50:14', '2022-03-28 08:50:14', 1, '0', NULL, 'main_account', ''),
(27, '1-405', 'Closing Inventory-Spare Part', 5, '2022-03-28 08:51:40', '2022-03-28 08:51:40', 1, '0', NULL, 'main_account', ''),
(28, '1-406', 'Closing Inventory-Truck Box', 5, '2022-03-28 08:52:12', '2022-03-28 08:52:12', 1, '0', NULL, 'main_account', ''),
(29, '1-500', 'Non Current Assets', 6, '2022-03-28 08:53:46', '2022-03-28 08:53:46', 1, '0', NULL, 'main_account', ''),
(30, '1-501', 'Computer & Accessories', 6, '2022-03-28 08:54:26', '2022-03-28 08:54:26', 1, '0', NULL, 'main_account', ''),
(31, '1-502', 'Furniture', 6, '2022-03-28 08:54:51', '2022-03-28 08:54:51', 1, '0', NULL, 'main_account', ''),
(32, '1-503', 'Office Equipment', 6, '2022-03-28 08:55:31', '2022-03-28 08:55:31', 1, '0', NULL, 'main_account', ''),
(33, '1-504', 'Motor Vehicle', 6, '2022-03-28 08:56:18', '2022-03-28 08:56:18', 1, '0', NULL, 'main_account', ''),
(34, '1-600', 'Accumulated Depreciation', 7, '2022-03-28 08:57:02', '2022-03-28 08:57:02', 1, '0', NULL, 'main_account', ''),
(35, '1-601', 'Accumulated Depreciation of Computer & Accessories', 7, '2022-03-28 08:57:51', '2022-03-28 08:57:51', 1, '0', NULL, 'main_account', ''),
(36, '1-602', 'Accumulated Depreciation of Furniture', 7, '2022-03-28 08:58:49', '2022-03-28 08:58:49', 1, '0', NULL, 'main_account', ''),
(37, '1-603', 'Accumulated Depreciation of Office Equipment', 7, '2022-03-28 08:59:50', '2022-03-28 08:59:50', 1, '0', NULL, 'main_account', ''),
(38, '1-604', 'Accumulated Depreciation of Motor Vehicle', 7, '2022-03-28 09:00:34', '2022-03-28 09:00:34', 1, '0', NULL, 'main_account', ''),
(39, '1-700', 'Other Assets', 0, '2022-03-28 09:01:07', '2022-03-28 09:01:07', 1, '0', NULL, 'main_account', ''),
(40, '1-800', 'Advance Tax', 0, '2022-03-28 09:01:33', '2022-03-28 09:01:33', 1, '0', NULL, 'main_account', ''),
(41, '1-900', 'Advance Custom Duty', 0, '2022-03-28 09:03:14', '2022-03-28 09:03:14', 1, '0', NULL, 'main_account', ''),
(42, '1-901', 'Advance Custom Duty ( 400 Units )', 0, '2022-03-28 09:05:31', '2022-03-28 09:05:31', 1, '0', NULL, 'main_account', ''),
(43, '1-902', 'Advance Custom Duty ( 200 Units )', 0, '2022-03-28 09:06:15', '2022-03-28 09:06:15', 1, '0', NULL, 'main_account', ''),
(44, '1-903', 'Advance Custom Duty ( 50 Units )', 0, '2022-03-28 09:07:07', '2022-03-28 09:07:07', 1, '0', NULL, 'main_account', '');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `background` text COLLATE utf8mb4_unicode_ci,
  `nrc_no` text COLLATE utf8mb4_unicode_ci,
  `phone` text COLLATE utf8mb4_unicode_ci,
  `email` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `country` text COLLATE utf8mb4_unicode_ci,
  `city` text COLLATE utf8mb4_unicode_ci,
  `state` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `dealer_customer_id` int(11) DEFAULT NULL,
  `dealer_or_hp` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `opening_balance` text COLLATE utf8mb4_unicode_ci,
  `opening_balance_date` text COLLATE utf8mb4_unicode_ci
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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
(15, '2022_03_24_192125_create_cash_books_table', 13),
(16, '2022_03_25_064339_create_customers_table', 14),
(17, '2022_03_25_073157_create_suppliers_table', 15),
(18, '2022_03_25_093621_create_products_table', 16),
(19, '2022_03_25_101345_add_opening_balance_date_to_chartof_accounts_table', 17),
(20, '2022_03_25_104526_add_new_column_to_customers_table', 18);

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `item_code` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `opening_cost` text COLLATE utf8mb4_unicode_ci,
  `opening_quantity` text COLLATE utf8mb4_unicode_ci,
  `qty_at_date` text COLLATE utf8mb4_unicode_ci,
  `selling_price` text COLLATE utf8mb4_unicode_ci,
  `sale_account_id` int(11) DEFAULT NULL,
  `cost_of_unit` text COLLATE utf8mb4_unicode_ci,
  `purchase_account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `company` text COLLATE utf8mb4_unicode_ci,
  `phone` text COLLATE utf8mb4_unicode_ci,
  `email` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$sEC8.T7pB0XueE8ovjiOmOnAif1m/H2H9eNoh95/zkgr7UUid7Uly', 'Ss7OKxBzHDgFQZrj9OaTva0aK3lHlHWUWQmXLRGfFdmNCyyEpgxMd289AfTG', '2022-02-10 15:10:38', '2022-02-10 15:10:38'),
(2, 'Admin', 'admin@skg.com', NULL, '$2y$10$uA.0FxxHyeuGxY/n51CT0uMv2V3lpOsmexE.0RpwL.ar2ubuCUQHe', NULL, '2022-02-14 03:35:54', '2022-02-14 03:35:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_classifications`
--
ALTER TABLE `account_classifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chartof_accounts`
--
ALTER TABLE `chartof_accounts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_classifications`
--
ALTER TABLE `account_classifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `chartof_accounts`
--
ALTER TABLE `chartof_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
