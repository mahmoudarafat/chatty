-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 06, 2022 at 02:45 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_support`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `activation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `client_id`, `name`, `mobile`, `image`, `is_active`, `activation_code`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, '01021232270', NULL, 'active', '111111', '2021-08-05 04:46:14', '2021-08-05 04:46:14'),
(2, NULL, NULL, '12312412412', NULL, 'active', '111111', '2021-08-08 09:50:52', '2021-08-08 09:50:52'),
(3, NULL, NULL, '12345678', NULL, 'active', '111111', '2021-08-08 10:01:09', '2021-08-08 10:01:09'),
(4, NULL, NULL, '123456789', NULL, 'active', '111111', '2021-08-09 05:06:36', '2021-08-09 05:06:36'),
(5, NULL, NULL, '0147258369', NULL, 'active', '111111', '2021-08-09 09:32:47', '2021-08-09 09:32:47'),
(6, NULL, NULL, '0123456789', NULL, 'active', '111111', '2021-08-09 09:46:49', '2021-08-09 09:46:49'),
(7, NULL, NULL, '2012345678', NULL, 'active', '111111', '2021-08-10 03:07:33', '2021-08-10 03:07:33'),
(8, NULL, NULL, '20123456788', NULL, 'active', '111111', '2021-08-10 03:11:55', '2021-08-10 03:11:55'),
(9, NULL, NULL, '20123456789', NULL, 'active', '111111', '2021-08-10 03:33:43', '2021-08-10 03:33:43'),
(10, NULL, NULL, '2001021232270', NULL, 'active', '111111', '2021-08-10 08:37:30', '2021-08-10 08:37:30');

-- --------------------------------------------------------

--
-- Table structure for table `active_logo`
--

CREATE TABLE `active_logo` (
  `id` int(11) NOT NULL,
  `client_id` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) DEFAULT NULL,
  `HTTP_X` varchar(255) DEFAULT NULL,
  `mac` varchar(255) NOT NULL,
  `active` text,
  `notes` text CHARACTER SET utf8,
  `add_user` varchar(255) NOT NULL DEFAULT '12345'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `image` text,
  `ordering` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `name`, `name_en`, `image`, `ordering`, `created_at`, `updated_at`) VALUES
(31, 'ملابس', 'clothes', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(2, 'أحذية', 'shoes', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(32, 'ادوات صحية وسباكة', 'Sanitary Products', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(4, 'ادوات إطفاء الحريق', 'Firefighting tools', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(5, 'أخرى', 'others', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(17, 'صيدلية', 'pharmacy', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(23, 'إكسسوارات', 'Accessories', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(27, 'الأجهزة الإلكترونية', 'Electronics', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(9, 'سوبر ماركت', 'supermarket', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(6, 'مطعم', 'Resturant', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(11, 'مخبز', 'bakery', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(12, 'الاجهزه المنزليه والكهربائيه', 'Household appliance', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(13, 'مراكز الصيانه والعنايه بالسيارات', 'Car Care', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(14, 'قطع غيار السيارات', 'Auto Parts Store', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(15, 'المستلزمات الطبية', 'Medical supplies', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(8, 'الجوالات وبطاقات الشحن', 'Mobile Phones and Charging Cards', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(25, 'أدوات كهربائيه', 'Electrical Tools', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(30, 'مستحضرات تجميل ومنظفات', 'Cosmetics and detergents', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(29, 'مكتبات وخردوات', 'Libraries and hardware', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(28, 'أدوات منزليه ورفايع', 'Houseware', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(20, 'مراكز العناية بالشعر', 'Hair care centers', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(16, 'تغير فلاتر وزيت سيارات', 'Car oil and filter change', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(22, 'محل حلويات', 'sweetmeats shop', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(24, 'المستلزمات الطبية', 'Medical supplies', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(18, 'محل زجاج ومرايا', 'Glass and mirror shop', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(19, 'مغسلة ملابس ', 'Laundries', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(1, 'مبيعات أنشطه مختلفة ', 'General sales', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(3, 'ادوات السلامة', 'safety tools', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(7, 'معارض سيارميك', 'ceramic exhibitions', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20'),
(21, 'معرض سيارات', 'Car Showrooms', NULL, NULL, '2022-03-27 11:19:42', '2022-03-27 11:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` int(11) NOT NULL,
  `mob` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sales_percent` double NOT NULL,
  `img` text COLLATE utf8_unicode_ci,
  `link_view` int(11) NOT NULL DEFAULT '0',
  `target` double NOT NULL DEFAULT '0',
  `city_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `souq_subscribe` tinyint(1) DEFAULT NULL,
  `souq_start_date` date DEFAULT NULL,
  `souq_end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `name`, `country`, `mob`, `sales_percent`, `img`, `link_view`, `target`, `city_id`, `activity_id`, `souq_subscribe`, `souq_start_date`, `souq_end_date`, `created_at`, `updated_at`) VALUES
(1, 'test', 1, '0100000000', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `agent_balances`
--

CREATE TABLE `agent_balances` (
  `id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `money` double NOT NULL,
  `info` text NOT NULL,
  `client_id` int(11) NOT NULL,
  `add_user` varchar(255) NOT NULL,
  `add_date` timestamp NULL DEFAULT NULL,
  `update_user` varchar(255) NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agent_payment`
--

CREATE TABLE `agent_payment` (
  `id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `money` double NOT NULL,
  `safe_id` int(11) NOT NULL,
  `notes` text NOT NULL,
  `transaction_flag` varchar(255) NOT NULL,
  `add_user` varchar(255) NOT NULL,
  `add_date` timestamp NULL DEFAULT NULL,
  `update_user` varchar(255) NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `agent_payment`
--

INSERT INTO `agent_payment` (`id`, `agent_id`, `date`, `money`, `safe_id`, `notes`, `transaction_flag`, `add_user`, `add_date`, `update_user`, `update_date`) VALUES
(1, 5, '2018-07-21', 2, 1, 'There Is No Notes Until Now!', '21072018025754', 'محمود الزيادى', '2018-07-21 17:57:54', 'محمود الزيادى', '2018-07-21 17:57:54'),
(2, 5, '2018-07-26', 250, 1, 'There Is No Notes Until Now!', '26072018031515', 'صالح الغبارى', '2018-07-26 18:15:15', 'صالح الغبارى', '2018-07-26 18:15:15'),
(3, 5, '2018-07-26', -200, 1, 'There Is No Notes Until Now!', '26072018031713', 'صالح الغبارى', '2018-07-26 18:17:13', 'صالح الغبارى', '2018-07-26 18:17:13'),
(4, 7, '2018-08-15', 840, 2, 'تم سداد جزء من المستحق للوكيل', '15082018032103', 'ahmadelrefayee', '2018-08-15 18:21:03', 'ahmadelrefayee', '2018-08-15 18:21:03'),
(5, 7, '2018-08-15', -100, 2, 'استرجاع عموله', '15082018032357', 'ahmadelrefayee', '2018-08-15 18:23:57', 'ahmadelrefayee', '2018-08-15 18:23:57'),
(6, 7, '2018-08-15', -100, 2, 'استرجاع عموله مستحقه', '15082018032429', 'ahmadelrefayee', '2018-08-15 18:24:29', 'ahmadelrefayee', '2018-08-15 18:24:29'),
(7, 5, '2018-08-16', 50, 1, 'There Is No Notes Until Now!', '16082018030230', 'صالح الغبارى', '2018-08-16 18:02:30', 'صالح الغبارى', '2018-08-16 18:02:30'),
(8, 7, '2019-01-29', 1510.24, 8, 'تست اختبار للسداد', '29012019123308', 'ahmadelrefayee', '2019-01-29 16:33:08', 'ahmadelrefayee', '2019-01-29 16:33:08'),
(9, 27, '2019-01-30', 880, 1, 'سداد المستحق', '30012019085319', 'ahmadelrefayee', '2019-01-31 00:53:19', 'ahmadelrefayee', '2019-01-31 00:53:19'),
(10, 9, '2019-01-30', 200, 1, 'تعديل مباشر', '30012019085400', 'ahmadelrefayee', '2019-01-31 00:54:00', 'ahmadelrefayee', '2019-01-31 00:54:00'),
(11, 9, '2019-02-04', 50, 7, 'There Is No Notes Until Now!', '04022019064418', 'ahmadelrefayee', '2019-02-04 22:44:18', 'ahmadelrefayee', '2019-02-04 22:44:18'),
(12, 8, '2019-02-04', 135.68, 7, 'There Is No Notes Until Now!', '04022019064439', 'ahmadelrefayee', '2019-02-04 22:44:39', 'ahmadelrefayee', '2019-02-04 22:44:39'),
(13, 25, '2019-02-04', 228.13, 7, 'There Is No Notes Until Now!', '04022019064539', 'ahmadelrefayee', '2019-02-04 22:45:39', 'ahmadelrefayee', '2019-02-04 22:45:39'),
(14, 9, '2019-02-28', 199.29, 7, 'سداد', '28032019045856', 'ahmadelrefayee', '2019-03-28 19:58:56', 'ahmadelrefayee', '2019-03-28 19:58:56'),
(15, 9, '2019-05-02', 760.77, 8, 'تم السداد', '02052019060252', 'ahmadelrefayee', '2019-05-02 21:02:52', 'ahmadelrefayee', '2019-05-02 21:02:52'),
(16, 8, '2019-05-02', 54.59, 8, 'تم', '02052019060330', 'ahmadelrefayee', '2019-05-02 21:03:30', 'ahmadelrefayee', '2019-05-02 21:03:30'),
(17, 25, '2019-05-02', 227.66, 8, 'تم', '02052019060358', 'ahmadelrefayee', '2019-05-02 21:03:58', 'ahmadelrefayee', '2019-05-02 21:03:58'),
(18, 9, '2019-06-01', 539.07, 7, 'تم سداد المستحق لشهر مايو', '09062019072443', 'ahmadelrefayee', '2019-06-09 22:24:43', 'ahmadelrefayee', '2019-06-09 22:24:43'),
(19, 9, '2019-07-02', 312.06, 8, 'sdad', '02072019015552', 'ahmadelrefayee', '2019-07-02 16:55:52', 'ahmadelrefayee', '2019-07-02 16:55:52'),
(20, 9, '2019-08-07', 719.19, 1, 'تم سداد المستحق لشهر 7', '07082019021100', 'ahmadelrefayee', '2019-08-07 17:11:00', 'ahmadelrefayee', '2019-08-07 17:11:00'),
(21, 3, '2019-08-07', 1405.14, 7, 'تم سداد المستحق لشهر 7', '07082019021138', 'ahmadelrefayee', '2019-08-07 17:11:38', 'ahmadelrefayee', '2019-08-07 17:11:38'),
(22, 8, '2019-08-07', 79.26, 8, 'سداد المستحق', '07082019021234', 'ahmadelrefayee', '2019-08-07 17:12:34', 'ahmadelrefayee', '2019-08-07 17:12:34'),
(23, 1, '2019-08-07', 2921.54, 8, 'سداد المستحق', '07082019021303', 'ahmadelrefayee', '2019-08-07 17:13:03', 'ahmadelrefayee', '2019-08-07 17:13:03'),
(24, 25, '2019-08-07', 100, 8, 'سداد المستحق', '07082019021337', 'ahmadelrefayee', '2019-08-07 17:13:37', 'ahmadelrefayee', '2019-08-07 17:13:37'),
(25, 27, '2019-08-07', 99.57, 7, 'تصفير الحساب', '07082019021400', 'ahmadelrefayee', '2019-08-07 17:14:00', 'ahmadelrefayee', '2019-08-07 17:14:00'),
(26, 27, '2019-08-07', 199.14, 8, 'تصفير', '07082019021434', 'ahmadelrefayee', '2019-08-07 17:14:34', 'ahmadelrefayee', '2019-08-07 17:14:34'),
(27, 9, '2019-09-09', 192.2, 1, 'تم سداد المستحق', '09092019015833', 'ahmadelrefayee', '2019-09-09 16:58:33', 'ahmadelrefayee', '2019-09-09 16:58:33'),
(28, 9, '2019-10-02', 163.82, 1, 'تم السداد', '02102019064028', 'ahmadelrefayee', '2019-10-02 21:40:28', 'ahmadelrefayee', '2019-10-02 21:40:28'),
(29, 37, '2019-10-31', 100, 1, 'تم السداد', '03112019035710', 'ahmadelrefayee', '2019-11-03 19:57:10', 'ahmadelrefayee', '2019-11-03 19:57:10'),
(30, 9, '0000-00-00', 476.68, 1, 'تم السداد', '03112019035742', 'ahmadelrefayee', '2019-11-03 19:57:42', 'ahmadelrefayee', '2019-11-03 19:57:42'),
(31, 9, '2020-01-02', 1683.74, 7, 'تصفية مستحقات', '02012020101227', 'ahmadelrefayee', '2020-01-02 06:12:27', 'ahmadelrefayee', '2020-01-02 06:12:27'),
(32, 8, '2020-01-02', 180.78, 7, 'تصفية مستحقات', '02012020101300', 'ahmadelrefayee', '2020-01-02 06:13:00', 'ahmadelrefayee', '2020-01-02 06:13:00'),
(33, 25, '2020-01-02', 226.07, 8, 'تصفية مستحقات', '02012020101424', 'ahmadelrefayee', '2020-01-02 06:14:24', 'ahmadelrefayee', '2020-01-02 06:14:24'),
(34, 9, '2020-02-08', 191.89, 1, 'تم السداد في راتب شهر يناير 2020', '08022020124117', 'ahmadelrefayee', '2020-02-08 08:41:17', 'ahmadelrefayee', '2020-02-08 08:41:17'),
(35, 9, '2020-03-05', 157.38, 1, 'تم السداد', '05032020104517', 'ahmadelrefayee', '2020-03-05 06:45:17', 'ahmadelrefayee', '2020-03-05 06:45:17'),
(36, 40, '2020-03-05', 200.25, 1, 'تم التصفية', '05032020104609', 'ahmadelrefayee', '2020-03-05 06:46:09', 'ahmadelrefayee', '2020-03-05 06:46:09'),
(37, 39, '2020-03-05', 100, 1, 'تم السداد', '05032020104629', 'ahmadelrefayee', '2020-03-05 06:46:29', 'ahmadelrefayee', '2020-03-05 06:46:29'),
(38, 38, '2020-03-05', 200, 1, 'تم السداد', '05032020104653', 'ahmadelrefayee', '2020-03-05 06:46:53', 'ahmadelrefayee', '2020-03-05 06:46:53'),
(39, 8, '2020-03-05', 30, 1, 'تم السداد', '05032020104715', 'ahmadelrefayee', '2020-03-05 06:47:15', 'ahmadelrefayee', '2020-03-05 06:47:15'),
(40, 25, '2020-03-05', 200, 1, 'تم السداد', '05032020104746', 'ahmadelrefayee', '2020-03-05 06:47:46', 'ahmadelrefayee', '2020-03-05 06:47:46'),
(41, 9, '2020-04-18', 199.72, 1, 'تم السداد في راتب شهر مارس2020', '18042020112730', 'ahmadelrefayee', '2020-04-18 07:27:30', 'ahmadelrefayee', '2020-04-18 07:27:30'),
(42, 38, '2020-04-18', 212.56, 7, 'There Is No Notes Until Now!', '18042020112824', 'ahmadelrefayee', '2020-04-18 07:28:24', 'ahmadelrefayee', '2020-04-18 07:28:24'),
(43, 9, '2020-05-16', 200.69, 7, 'تم السداد في راتب شهر ابريل االمنصرف', '17052020123000', 'ahmadelrefayee', '2020-05-16 20:30:00', 'ahmadelrefayee', '2020-05-16 20:30:00'),
(44, 9, '2020-06-03', 216.63, 1, 'تم السداد مع راتب شهر مايو 2020', '13062020033137', 'ahmadelrefayee', '2020-06-13 11:31:37', 'ahmadelrefayee', '2020-06-13 11:31:37'),
(45, 9, '2020-06-04', 339.54, 1, 'تم السداد في راتب شهر 6', '25072020031539', 'ahmadelrefayee', '2020-07-25 11:15:39', 'ahmadelrefayee', '2020-07-25 11:15:39'),
(46, 9, '2020-09-14', 767.14, 7, 'تم سداد المستحق له في راتب شهر 9', '14092020110615', 'ahmadelrefayee', '2020-09-14 07:06:15', 'ahmadelrefayee', '2020-09-14 07:06:15'),
(47, 9, '2020-10-29', 190.82, 7, 'تم السداد في راتب شهر 9 المنصرف', '29102020022709', 'ahmadelrefayee', '2020-10-29 10:27:09', 'ahmadelrefayee', '2020-10-29 10:27:09'),
(48, 9, '2020-11-10', 1004.19, 7, 'سداد المستحق في راتب شهر 10/2020', '10112020025715', 'ahmadelrefayee', '2020-11-10 10:57:15', 'ahmadelrefayee', '2020-11-10 10:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `agent_view_link`
--

CREATE TABLE `agent_view_link` (
  `id` bigint(20) NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `view_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `id` int(11) DEFAULT NULL,
  `alert_name` varchar(255) DEFAULT NULL,
  `para` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `add_user` int(11) DEFAULT NULL,
  `edit_user` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(11) NOT NULL,
  `img` text NOT NULL,
  `currency` varchar(255) NOT NULL,
  `date_kind` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `img`, `currency`, `date_kind`) VALUES
(1, '../img/uploads/4997-27-06-19-Badr.png', 'جنيه', 0);

-- --------------------------------------------------------

--
-- Table structure for table `attention`
--

CREATE TABLE `attention` (
  `id` int(11) DEFAULT NULL,
  `attentin_text` text,
  `shop_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `backup_services`
--

CREATE TABLE `backup_services` (
  `id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `subscript_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `backup_plan` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `badr_shop`
--

CREATE TABLE `badr_shop` (
  `shop_name` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `ower_name` varchar(50) DEFAULT NULL,
  `serial_id` int(50) DEFAULT NULL,
  `active_id` varchar(50) DEFAULT NULL,
  `active_date` timestamp NULL DEFAULT NULL,
  `tel_bill` varchar(20) DEFAULT NULL,
  `mobile_bill` varchar(20) DEFAULT NULL,
  `bill_header` text,
  `message_bill` text,
  `run_date` date DEFAULT NULL,
  `run_domian` varchar(50) DEFAULT NULL,
  `logo_path` varchar(50) DEFAULT NULL,
  `color_option` tinyint(1) DEFAULT NULL,
  `edit_incom_price` int(1) DEFAULT NULL,
  `sale_quick` tinyint(1) DEFAULT NULL,
  `enter_quant` tinyint(1) DEFAULT NULL,
  `return_bill` tinyint(1) DEFAULT NULL,
  `sale_details` tinyint(1) DEFAULT NULL,
  `items_company` int(11) DEFAULT NULL,
  `company_ratio` int(11) DEFAULT NULL,
  `units_sup` tinyint(1) DEFAULT NULL,
  `bolla` tinyint(1) DEFAULT NULL,
  `boll_per` decimal(10,2) DEFAULT NULL,
  `bolla_gift` decimal(10,2) DEFAULT NULL,
  `bill_size` int(11) DEFAULT NULL,
  `billno_show` tinyint(1) DEFAULT NULL,
  `bill_no_record` int(11) DEFAULT NULL,
  `barcode_size` int(11) DEFAULT NULL,
  `barcode_reader` tinyint(1) DEFAULT NULL,
  `day_payment` tinyint(1) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `type_show_barcode` tinyint(1) DEFAULT NULL,
  `price_percent` int(11) DEFAULT NULL,
  `discount_type` tinyint(1) DEFAULT NULL,
  `edit_price_bill` tinyint(1) DEFAULT NULL,
  `spend_at_report` tinyint(1) DEFAULT NULL,
  `incom_at_report` tinyint(1) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `money_safe` decimal(10,2) DEFAULT NULL,
  `netowrk_payment` tinyint(1) DEFAULT NULL,
  `plan` int(11) DEFAULT NULL,
  `theme_store` int(11) DEFAULT NULL,
  `install_path` text,
  `server_path` varchar(255) DEFAULT NULL,
  `us_os` varchar(255) DEFAULT NULL,
  `pass_os` varchar(255) DEFAULT NULL,
  `date_type` int(11) DEFAULT NULL,
  `huro_late` int(11) DEFAULT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `vs` decimal(10,2) DEFAULT NULL,
  `online` int(11) DEFAULT NULL,
  `module` tinyint(1) DEFAULT NULL,
  `u_no` int(11) DEFAULT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `multi_price` int(11) DEFAULT NULL,
  `check_lowest_price` int(11) DEFAULT NULL,
  `notes` tinyint(1) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT NULL,
  `bill_time_alert` tinyint(1) DEFAULT NULL,
  `style` int(11) DEFAULT NULL,
  `color_size` int(11) DEFAULT NULL,
  `badr_style` int(11) DEFAULT NULL,
  `language` int(11) DEFAULT NULL,
  `about` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `bill_adds` tinyint(1) DEFAULT NULL,
  `upload_img` varchar(255) DEFAULT NULL,
  `decimal_num_quant` int(11) DEFAULT NULL,
  `decimal_num_price` int(11) DEFAULT NULL,
  `select_client` tinyint(1) DEFAULT NULL,
  `client_limit` int(11) DEFAULT NULL,
  `insatllments` int(11) DEFAULT NULL,
  `screen_type` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `backup_time` int(11) DEFAULT NULL,
  `backup_path` varchar(500) DEFAULT NULL,
  `manufacturing` int(11) DEFAULT NULL,
  `distributor` int(11) DEFAULT NULL,
  `sms_scrip` int(11) DEFAULT NULL,
  `show_item_serial` tinyint(1) DEFAULT NULL,
  `upload_img_slide` varchar(255) DEFAULT NULL,
  `address` text,
  `Regist_purchases` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `barcodesetting`
--

CREATE TABLE `barcodesetting` (
  `shop_id` int(11) DEFAULT NULL,
  `support` int(11) DEFAULT NULL,
  `price` tinyint(4) DEFAULT NULL,
  `showitem` tinyint(4) DEFAULT NULL,
  `show_about` int(11) DEFAULT NULL,
  `barcodestyle` int(11) DEFAULT NULL,
  `titleName` varchar(255) DEFAULT NULL,
  `barcodecount` int(11) DEFAULT NULL,
  `barcodewidth` decimal(10,2) DEFAULT NULL,
  `barcodeheight` decimal(10,2) DEFAULT NULL,
  `itemup` decimal(10,2) DEFAULT NULL,
  `pageup` decimal(10,2) DEFAULT NULL,
  `itemdown` decimal(10,2) DEFAULT NULL,
  `pagedown` decimal(10,2) DEFAULT NULL,
  `itemright` decimal(10,2) DEFAULT NULL,
  `pageright` decimal(10,2) DEFAULT NULL,
  `itemleft` decimal(10,2) DEFAULT NULL,
  `pageleft` decimal(10,2) DEFAULT NULL,
  `logoheight` decimal(10,0) DEFAULT NULL,
  `logowidth` decimal(10,0) DEFAULT NULL,
  `codimgheight` decimal(10,0) DEFAULT NULL,
  `codimgwidth` decimal(10,0) DEFAULT NULL,
  `support_scale` int(11) DEFAULT NULL,
  `scale_start` varchar(10) DEFAULT NULL,
  `scale_item` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bills_add`
--

CREATE TABLE `bills_add` (
  `id` int(11) DEFAULT NULL,
  `Addition_name` text,
  `check_addition` int(11) DEFAULT NULL,
  `addition_value` decimal(10,4) DEFAULT NULL,
  `bill_add_method` int(11) DEFAULT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `add_user` int(11) DEFAULT NULL,
  `edit_user` int(11) DEFAULT NULL,
  `edit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shop_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bills_add_history`
--

CREATE TABLE `bills_add_history` (
  `id` int(11) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `addition_id` int(11) DEFAULT NULL,
  `addition_value` decimal(10,4) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bill_setting`
--

CREATE TABLE `bill_setting` (
  `shop_id` int(11) DEFAULT NULL,
  `bill_header` mediumtext,
  `message_bill` mediumtext,
  `font_size` int(11) DEFAULT NULL,
  `show_code` tinyint(4) DEFAULT NULL,
  `show_about` tinyint(4) DEFAULT NULL,
  `show_salesman` tinyint(4) DEFAULT NULL,
  `show_client_balance` tinyint(4) DEFAULT NULL,
  `smallbill_itemname` tinyint(4) DEFAULT NULL,
  `show_item_serial` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `card_comanyes`
--

CREATE TABLE `card_comanyes` (
  `id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `card_footer` text,
  `card_header` text,
  `number_digital` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `card_numbers`
--

CREATE TABLE `card_numbers` (
  `id` int(11) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `card_state` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `income_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `sale_price` int(11) DEFAULT NULL,
  `sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_channels`
--

CREATE TABLE `chat_channels` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `status` enum('open','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `agent_id` int(11) DEFAULT NULL,
  `access_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_channels`
--

INSERT INTO `chat_channels` (`id`, `account_id`, `status`, `agent_id`, `access_count`, `created_at`, `updated_at`) VALUES
(1, 1, 'open', 94, 136, '2021-08-08 09:47:24', '2022-03-30 09:28:41'),
(2, 5, 'open', 0, 0, '2021-08-09 09:33:19', '2021-08-09 09:33:19'),
(3, 4, 'open', NULL, 15, '2021-10-03 10:53:01', '2021-12-20 15:45:36');

-- --------------------------------------------------------

--
-- Table structure for table `chat_logs`
--

CREATE TABLE `chat_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(11) NOT NULL,
  `logMessage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(11) NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `sender_id` int(11) NOT NULL,
  `sender_type` enum('account','agent','system') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('text','file','voice','image','video') COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_read_at` timestamp NULL DEFAULT NULL,
  `account_read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `channel_id`, `message`, `sender_id`, `sender_type`, `type`, `file_path`, `agent_read_at`, `account_read_at`, `created_at`, `updated_at`) VALUES
(310, 1, '1245', 1, 'account', 'text', '', '2022-03-31 05:10:42', '2022-03-31 05:09:54', '2022-03-31 05:09:54', '2022-03-31 05:10:42'),
(311, 2, '222', 1, 'account', 'text', '', '2022-03-31 05:29:52', '2022-03-31 05:10:21', '2022-03-31 05:10:21', '2022-03-31 05:29:52'),
(312, 1, '1111', 1, 'account', 'text', '', '2022-03-31 05:10:43', '2022-03-31 05:10:35', '2022-03-31 05:10:35', '2022-03-31 05:10:43'),
(313, 1, NULL, 94, 'agent', 'text', '', '2022-04-04 05:38:38', NULL, '2022-04-04 05:38:38', '2022-04-04 05:38:38'),
(314, 1, NULL, 94, 'agent', 'text', '', '2022-04-04 05:39:11', NULL, '2022-04-04 05:39:11', '2022-04-04 05:39:11'),
(315, 1, NULL, 94, 'agent', 'text', '', '2022-04-04 06:33:22', NULL, '2022-04-04 06:33:22', '2022-04-04 06:33:22'),
(316, 1, NULL, 94, 'agent', 'image', 'chatFiles/2022/4/4/1649068559.jpg', '2022-04-04 06:35:59', NULL, '2022-04-04 06:35:59', '2022-04-04 06:35:59'),
(317, 1, NULL, 94, 'agent', 'image', 'chatFiles/2022/4/4/1649068559.jpg', '2022-04-04 06:35:59', NULL, '2022-04-04 06:35:59', '2022-04-04 06:35:59'),
(323, 1, NULL, 94, 'agent', 'video', 'chatFiles/2022/4/5/1649147659.mp4', '2022-04-05 04:34:19', NULL, '2022-04-05 04:34:19', '2022-04-05 04:34:19'),
(324, 1, '125', 1, 'account', 'text', '', '2022-04-05 05:21:36', '2022-04-05 04:44:48', '2022-04-05 04:44:48', '2022-04-05 05:21:36'),
(325, 1, NULL, 94, 'agent', 'image', 'chatFiles/2022/4/5/1649150560.jpg', '2022-04-05 05:22:40', NULL, '2022-04-05 05:22:40', '2022-04-05 05:22:40'),
(326, 1, '124', 1, 'account', 'text', '', '2022-04-06 08:51:43', '2022-04-05 06:32:25', '2022-04-05 06:32:25', '2022-04-06 08:51:43'),
(327, 1, NULL, 1, 'account', 'image', 'chatFiles/2022/4/5/1649156158.jpg', '2022-04-06 08:51:43', '2022-04-05 06:55:58', '2022-04-05 06:55:58', '2022-04-06 08:51:43'),
(328, 1, NULL, 1, 'account', 'video', 'chatFiles/2022/4/5/1649156571.mp4', '2022-04-06 08:51:43', '2022-04-05 07:02:51', '2022-04-05 07:02:51', '2022-04-06 08:51:43'),
(329, 2, 'sdasd', 1, 'agent', 'text', '', '2022-05-26 06:01:06', NULL, '2022-05-26 06:01:06', '2022-05-26 06:01:06'),
(330, 1, 'fsdfas', 1, 'agent', 'text', '', '2022-05-26 06:01:22', NULL, '2022-05-26 06:01:22', '2022-05-26 06:01:22'),
(331, 2, 'sdsadasdas', 94, 'agent', 'text', '', '2022-05-30 08:05:52', NULL, '2022-05-30 08:05:52', '2022-05-30 08:05:52'),
(332, 2, 'sadasd', 94, 'agent', 'text', '', '2022-05-30 09:08:15', NULL, '2022-05-30 09:08:15', '2022-05-30 09:08:15'),
(333, 1, 'sdfsf', 94, 'agent', 'text', '', '2022-06-01 11:56:04', NULL, '2022-06-01 11:56:04', '2022-06-01 11:56:04'),
(334, 1, 'saassa', 94, 'agent', 'text', '', '2022-06-02 12:24:00', NULL, '2022-06-02 12:24:00', '2022-06-02 12:24:00'),
(335, 1, 'adasdasd', 94, 'agent', 'text', '', '2022-06-02 12:25:07', NULL, '2022-06-02 12:25:07', '2022-06-02 12:25:07'),
(336, 1, 'fsafasfdasdf', 94, 'agent', 'text', '', '2022-06-02 12:26:28', NULL, '2022-06-02 12:26:28', '2022-06-02 12:26:28'),
(337, 1, 'sdfgjds fkdlkj hfkjd fkjdslf\r\nfdhg dsgfjg\r\nfd ds kbgfd', 94, 'agent', 'text', '', '2022-06-02 12:26:35', NULL, '2022-06-02 12:26:35', '2022-06-02 12:26:35'),
(338, 1, 'ءؤرءئرؤئ', 94, 'agent', 'text', '', '2022-06-02 12:35:32', NULL, '2022-06-02 12:35:32', '2022-06-02 12:35:32'),
(339, 1, 'help', 94, 'agent', 'text', '', '2022-06-05 07:44:23', NULL, '2022-06-05 07:44:23', '2022-06-05 07:44:23'),
(340, 1, 'xzc\\cxz', 94, 'agent', 'text', '', '2022-06-05 07:46:07', NULL, '2022-06-05 07:46:07', '2022-06-05 07:46:07'),
(341, 1, 'fdgfdg', 94, 'agent', 'text', '', '2022-06-05 07:54:58', NULL, '2022-06-05 07:54:58', '2022-06-05 07:54:58'),
(342, 1, 'sdasd', 94, 'agent', 'text', '', '2022-06-05 07:56:16', NULL, '2022-06-05 07:56:16', '2022-06-05 07:56:16'),
(343, 2, 'dsasdas', 94, 'agent', 'text', '', '2022-06-05 07:56:24', NULL, '2022-06-05 07:56:24', '2022-06-05 07:56:24'),
(344, 2, 'sdsad', 94, 'agent', 'text', '', '2022-06-05 07:56:32', NULL, '2022-06-05 07:56:32', '2022-06-05 07:56:32'),
(345, 1, 'sd', 94, 'agent', 'text', '', '2022-06-05 07:57:19', NULL, '2022-06-05 07:57:19', '2022-06-05 07:57:19'),
(346, 2, 'asdsad', 94, 'agent', 'text', '', '2022-06-05 07:57:27', NULL, '2022-06-05 07:57:27', '2022-06-05 07:57:27'),
(347, 1, 'sada', 94, 'agent', 'text', '', '2022-06-05 07:57:50', NULL, '2022-06-05 07:57:50', '2022-06-05 07:57:50'),
(348, 2, 'sadsad', 94, 'agent', 'text', '', '2022-06-05 07:57:55', NULL, '2022-06-05 07:57:55', '2022-06-05 07:57:55'),
(349, 1, 'sfddf', 94, 'agent', 'text', '', '2022-06-05 08:06:28', NULL, '2022-06-05 08:06:28', '2022-06-05 08:06:28'),
(350, 1, 'sdfsdf', 94, 'agent', 'text', '', '2022-06-05 08:07:33', NULL, '2022-06-05 08:07:33', '2022-06-05 08:07:33'),
(351, 2, 'dsfsdf', 94, 'agent', 'text', '', '2022-06-05 08:07:38', NULL, '2022-06-05 08:07:38', '2022-06-05 08:07:38'),
(352, 2, 'sdfsfdssssssssss', 94, 'agent', 'text', '', '2022-06-05 08:07:45', NULL, '2022-06-05 08:07:45', '2022-06-05 08:07:45'),
(353, 1, 'help', 94, 'agent', 'text', '', '2022-06-05 08:10:10', NULL, '2022-06-05 08:10:10', '2022-06-05 08:10:10'),
(354, 1, 'sdasdasd', 94, 'agent', 'text', '', '2022-06-05 08:10:43', NULL, '2022-06-05 08:10:43', '2022-06-05 08:10:43'),
(355, 2, 'try', 94, 'agent', 'text', '', '2022-06-05 08:11:21', NULL, '2022-06-05 08:11:21', '2022-06-05 08:11:21'),
(356, 1, 'dsd', 94, 'agent', 'text', '', '2022-06-05 08:25:05', NULL, '2022-06-05 08:25:05', '2022-06-05 08:25:05'),
(357, 1, 'dsfdf', 94, 'agent', 'text', '', '2022-06-05 08:25:12', NULL, '2022-06-05 08:25:12', '2022-06-05 08:25:12'),
(358, 1, 'sdf', 94, 'agent', 'text', '', '2022-06-05 08:25:58', NULL, '2022-06-05 08:25:58', '2022-06-05 08:25:58'),
(359, 1, 'dsfs', 94, 'agent', 'text', '', '2022-06-05 08:26:04', NULL, '2022-06-05 08:26:04', '2022-06-05 08:26:04'),
(360, 2, 'asdfdf', 94, 'agent', 'text', '', '2022-06-05 10:00:55', NULL, '2022-06-05 10:00:55', '2022-06-05 10:00:55'),
(361, 2, 'sad', 94, 'agent', 'text', '', '2022-06-05 10:04:44', NULL, '2022-06-05 10:04:44', '2022-06-05 10:04:44'),
(362, 2, 'sadsdasda', 94, 'agent', 'text', '', '2022-06-05 10:05:44', NULL, '2022-06-05 10:05:44', '2022-06-05 10:05:44'),
(363, 2, 'sadsdasdafcds', 94, 'agent', 'text', '', '2022-06-05 10:14:13', NULL, '2022-06-05 10:14:13', '2022-06-05 10:14:13'),
(364, 2, 'sadssadasdafcds', 94, 'agent', 'text', '', '2022-06-05 10:14:47', NULL, '2022-06-05 10:14:47', '2022-06-05 10:14:47'),
(365, 2, 'sadssadasadafcds', 94, 'agent', 'text', '', '2022-06-05 10:16:00', NULL, '2022-06-05 10:16:00', '2022-06-05 10:16:00'),
(366, 2, 'ass', 94, 'agent', 'text', '', '2022-06-05 10:16:13', NULL, '2022-06-05 10:16:13', '2022-06-05 10:16:13'),
(367, 2, 'asss', 94, 'agent', 'text', '', '2022-06-05 10:17:17', NULL, '2022-06-05 10:17:17', '2022-06-05 10:17:17'),
(368, 2, 'assss', 94, 'agent', 'text', '', '2022-06-05 10:17:44', NULL, '2022-06-05 10:17:44', '2022-06-05 10:17:44'),
(369, 2, 'asssss', 94, 'agent', 'text', '', '2022-06-05 10:17:52', NULL, '2022-06-05 10:17:52', '2022-06-05 10:17:52'),
(370, 2, 'asssssds', 94, 'agent', 'text', '', '2022-06-05 10:21:53', NULL, '2022-06-05 10:21:53', '2022-06-05 10:21:53'),
(371, 2, 'asdfssssds', 94, 'agent', 'text', '', '2022-06-05 10:22:02', NULL, '2022-06-05 10:22:02', '2022-06-05 10:22:02'),
(372, 2, 'sadsad', 94, 'agent', 'text', '', '2022-06-05 10:22:52', NULL, '2022-06-05 10:22:52', '2022-06-05 10:22:52'),
(373, 2, 'ad', 94, 'agent', 'text', '', '2022-06-05 10:23:17', NULL, '2022-06-05 10:23:17', '2022-06-05 10:23:17'),
(374, 2, 'dsf', 94, 'agent', 'text', '', '2022-06-05 10:23:48', NULL, '2022-06-05 10:23:48', '2022-06-05 10:23:48'),
(375, 2, 'sad', 94, 'agent', 'text', '', '2022-06-05 10:24:12', NULL, '2022-06-05 10:24:12', '2022-06-05 10:24:12'),
(376, 2, 'sad', 94, 'agent', 'text', '', '2022-06-05 10:24:55', NULL, '2022-06-05 10:24:55', '2022-06-05 10:24:55'),
(377, 2, 'sad', 94, 'agent', 'text', '', '2022-06-05 10:26:03', NULL, '2022-06-05 10:26:03', '2022-06-05 10:26:03'),
(378, 2, 'asd', 94, 'agent', 'text', '', '2022-06-05 10:26:12', NULL, '2022-06-05 10:26:12', '2022-06-05 10:26:12'),
(379, 2, 'dsf', 94, 'agent', 'text', '', '2022-06-05 10:26:20', NULL, '2022-06-05 10:26:20', '2022-06-05 10:26:20'),
(380, 2, 'sfd', 94, 'agent', 'text', '', '2022-06-05 10:26:33', NULL, '2022-06-05 10:26:33', '2022-06-05 10:26:33'),
(381, 2, 'sda', 94, 'agent', 'text', '', '2022-06-05 10:26:46', NULL, '2022-06-05 10:26:46', '2022-06-05 10:26:46'),
(382, 2, 'dsfds', 94, 'agent', 'text', '', '2022-06-05 10:28:15', NULL, '2022-06-05 10:28:15', '2022-06-05 10:28:15'),
(383, 2, 'ads', 94, 'agent', 'text', '', '2022-06-05 10:28:30', NULL, '2022-06-05 10:28:30', '2022-06-05 10:28:30'),
(384, 2, 'ad', 94, 'agent', 'text', '', '2022-06-05 10:29:08', NULL, '2022-06-05 10:29:08', '2022-06-05 10:29:08'),
(385, 1, 'sdfasdfsadf', 94, 'agent', 'text', '', '2022-06-05 10:30:07', NULL, '2022-06-05 10:30:07', '2022-06-05 10:30:07'),
(386, 1, 'sadsa', 94, 'agent', 'text', '', '2022-06-05 10:30:37', NULL, '2022-06-05 10:30:37', '2022-06-05 10:30:37'),
(387, 1, 'سيبسبي', 94, 'agent', 'text', '', '2022-06-05 12:08:16', NULL, '2022-06-05 12:08:16', '2022-06-05 12:08:16'),
(388, 1, 'sadsa', 94, 'agent', 'text', '', '2022-06-05 12:14:46', NULL, '2022-06-05 12:14:46', '2022-06-05 12:14:46'),
(389, 1, 'as', 94, 'agent', 'text', '', '2022-06-05 12:21:02', NULL, '2022-06-05 12:21:02', '2022-06-05 12:21:02'),
(390, 1, 'sadsad', 94, 'agent', 'text', '', '2022-06-05 12:21:15', NULL, '2022-06-05 12:21:15', '2022-06-05 12:21:15'),
(391, 1, 'sfda', 94, 'agent', 'text', '', '2022-06-05 12:22:19', NULL, '2022-06-05 12:22:19', '2022-06-05 12:22:19'),
(392, 1, 'sadsadad', 94, 'agent', 'text', '', '2022-06-05 12:22:32', NULL, '2022-06-05 12:22:32', '2022-06-05 12:22:32'),
(393, 1, 'dsfsdf', 94, 'agent', 'text', '', '2022-06-05 12:23:10', NULL, '2022-06-05 12:23:10', '2022-06-05 12:23:10'),
(394, 1, 'fdsasfd', 94, 'agent', 'text', '', '2022-06-05 12:24:47', NULL, '2022-06-05 12:24:47', '2022-06-05 12:24:47'),
(395, 1, 'fdsgfdsg', 94, 'agent', 'text', '', '2022-06-05 12:25:55', NULL, '2022-06-05 12:25:55', '2022-06-05 12:25:55'),
(396, 2, 'sadsa', 94, 'agent', 'text', '', '2022-06-05 12:26:13', NULL, '2022-06-05 12:26:13', '2022-06-05 12:26:13'),
(397, 1, 'sadsad', 94, 'agent', 'text', '', '2022-06-05 12:26:16', NULL, '2022-06-05 12:26:16', '2022-06-05 12:26:16'),
(398, 1, 'frgesgr', 94, 'agent', 'text', '', '2022-06-05 12:29:20', NULL, '2022-06-05 12:29:20', '2022-06-05 12:29:20'),
(399, 1, 'dsasad', 94, 'agent', 'text', '', '2022-06-05 12:29:22', NULL, '2022-06-05 12:29:22', '2022-06-05 12:29:22'),
(400, 1, 'dsaasdsad', 94, 'agent', 'text', '', '2022-06-05 12:29:29', NULL, '2022-06-05 12:29:29', '2022-06-05 12:29:29'),
(401, 1, 'fsas', 94, 'agent', 'text', '', '2022-06-05 12:29:33', NULL, '2022-06-05 12:29:33', '2022-06-05 12:29:33'),
(402, 1, 'ffghgfdghjhgfjghj', 94, 'agent', 'text', '', '2022-06-05 12:29:48', NULL, '2022-06-05 12:29:48', '2022-06-05 12:29:48'),
(403, 1, 's', 94, 'agent', 'text', '', '2022-06-06 07:06:25', NULL, '2022-06-06 07:06:25', '2022-06-06 07:06:25'),
(404, 2, 'reger', 94, 'agent', 'text', '', '2022-06-06 07:07:20', NULL, '2022-06-06 07:07:20', '2022-06-06 07:07:20'),
(405, 2, 'gdfg', 94, 'agent', 'text', '', '2022-06-06 07:07:22', NULL, '2022-06-06 07:07:22', '2022-06-06 07:07:22'),
(406, 1, 'sad', 94, 'agent', 'text', '', '2022-06-06 07:08:25', NULL, '2022-06-06 07:08:25', '2022-06-06 07:08:25'),
(407, 2, 'asasa', 94, 'agent', 'text', '', '2022-06-06 07:08:40', NULL, '2022-06-06 07:08:40', '2022-06-06 07:08:40'),
(408, 2, 'fdsaf', 94, 'agent', 'text', '', '2022-06-06 07:18:54', NULL, '2022-06-06 07:18:54', '2022-06-06 07:18:54'),
(409, 1, 'asdasd', 94, 'agent', 'text', '', '2022-06-06 07:22:46', NULL, '2022-06-06 07:22:46', '2022-06-06 07:22:46'),
(410, 1, 'dsfsdf', 94, 'agent', 'text', '', '2022-06-06 09:01:24', NULL, '2022-06-06 09:01:24', '2022-06-06 09:01:24'),
(411, 1, 'sfads', 94, 'agent', 'text', '', '2022-06-06 09:03:36', NULL, '2022-06-06 09:03:36', '2022-06-06 09:03:36'),
(412, 1, 'sfdf', 94, 'agent', 'text', '', '2022-06-06 09:04:36', NULL, '2022-06-06 09:04:36', '2022-06-06 09:04:36'),
(413, 2, 'شسيس', 94, 'agent', 'text', '', '2022-06-06 09:07:07', NULL, '2022-06-06 09:07:07', '2022-06-06 09:07:07'),
(414, 1, 'بيسيب', 94, 'agent', 'text', '', '2022-06-06 09:07:52', NULL, '2022-06-06 09:07:52', '2022-06-06 09:07:52'),
(415, 1, 'gfdfdg', 94, 'agent', 'text', '', '2022-06-06 09:08:27', NULL, '2022-06-06 09:08:27', '2022-06-06 09:08:27'),
(416, 1, 'test', 94, 'agent', 'text', '', '2022-06-06 09:39:19', NULL, '2022-06-06 09:39:19', '2022-06-06 09:39:19'),
(417, 1, 'test2', 94, 'agent', 'text', '', '2022-06-06 09:43:56', NULL, '2022-06-06 09:43:56', '2022-06-06 09:43:56'),
(418, 1, 'try', 94, 'agent', 'text', '', '2022-06-06 09:44:39', NULL, '2022-06-06 09:44:39', '2022-06-06 09:44:39'),
(419, 1, 'new try', 94, 'agent', 'text', '', '2022-06-06 09:45:14', NULL, '2022-06-06 09:45:14', '2022-06-06 09:45:14'),
(420, 1, 'sasd', 94, 'agent', 'text', '', '2022-06-06 12:01:00', NULL, '2022-06-06 12:01:00', '2022-06-06 12:01:00'),
(421, 1, 'asdsad', 94, 'agent', 'text', '', '2022-06-06 10:01:28', NULL, '2022-06-06 10:01:28', '2022-06-06 10:01:28'),
(422, 1, 'teesr', 94, 'agent', 'text', '', '2022-06-06 10:01:59', NULL, '2022-06-06 10:01:59', '2022-06-06 10:01:59'),
(423, 2, 'asd', 94, 'agent', 'text', '', '2022-06-06 10:05:33', NULL, '2022-06-06 10:05:33', '2022-06-06 10:05:33'),
(424, 1, 'sdas', 94, 'agent', 'text', '', '2022-06-06 10:05:37', NULL, '2022-06-06 10:05:37', '2022-06-06 10:05:37'),
(425, 1, NULL, 94, 'agent', 'text', '', '2022-06-06 11:35:03', NULL, '2022-06-06 11:35:03', '2022-06-06 11:35:03'),
(426, 1, NULL, 94, 'agent', 'text', '', '2022-06-06 11:36:43', NULL, '2022-06-06 11:36:43', '2022-06-06 11:36:43'),
(427, 1, NULL, 94, 'agent', 'image', 'chatFiles/2022/6/6/1654522675.png', '2022-06-06 11:37:55', NULL, '2022-06-06 11:37:55', '2022-06-06 11:37:55'),
(428, 1, NULL, 94, 'agent', 'text', '', '2022-06-06 11:46:44', NULL, '2022-06-06 11:46:44', '2022-06-06 11:46:44'),
(429, 1, NULL, 94, 'agent', 'text', '', '2022-06-06 11:47:03', NULL, '2022-06-06 11:47:03', '2022-06-06 11:47:03'),
(430, 1, NULL, 94, 'agent', 'image', 'chatFiles/2022/6/6/1654523280.png', '2022-06-06 11:48:00', NULL, '2022-06-06 11:48:00', '2022-06-06 11:48:00'),
(431, 1, NULL, 94, 'agent', 'video', 'chatFiles/2022/6/6/1654523471.mp4', '2022-06-06 11:51:11', NULL, '2022-06-06 11:51:11', '2022-06-06 11:51:11'),
(432, 1, NULL, 94, 'agent', 'video', 'chatFiles/2022/6/6/1654523628.mp4', '2022-06-06 11:53:48', NULL, '2022-06-06 11:53:48', '2022-06-06 11:53:48'),
(433, 1, NULL, 94, 'agent', 'video', 'chatFiles/2022/6/6/1654523653.mp4', '2022-06-06 11:54:13', NULL, '2022-06-06 11:54:13', '2022-06-06 11:54:13'),
(434, 1, NULL, 94, 'agent', 'video', 'chatFiles/2022/6/6/1654523685.mp4', '2022-06-06 11:54:45', NULL, '2022-06-06 11:54:45', '2022-06-06 11:54:45'),
(435, 1, NULL, 94, 'agent', 'video', 'chatFiles/2022/6/6/1654523715.mp4', '2022-06-06 11:55:15', NULL, '2022-06-06 11:55:15', '2022-06-06 11:55:15'),
(436, 1, NULL, 94, 'agent', 'video', 'chatFiles/2022/6/6/1654523781.mp4', '2022-06-06 11:56:21', NULL, '2022-06-06 11:56:21', '2022-06-06 11:56:21'),
(437, 1, NULL, 94, 'agent', 'video', 'chatFiles/2022/6/6/1654523873.mp4', '2022-06-06 11:57:53', NULL, '2022-06-06 11:57:53', '2022-06-06 11:57:53'),
(438, 1, NULL, 94, 'agent', 'video', 'chatFiles/2022/6/6/1654523903.mp4', '2022-06-06 11:58:23', NULL, '2022-06-06 11:58:23', '2022-06-06 11:58:23'),
(439, 1, NULL, 94, 'agent', 'video', 'chatFiles/2022/6/6/1654524590.mp4', '2022-06-06 12:09:50', NULL, '2022-06-06 12:09:50', '2022-06-06 12:09:50'),
(440, 2, 'sdfdsf', 94, 'agent', 'text', '', '2022-06-06 12:11:16', NULL, '2022-06-06 12:11:16', '2022-06-06 12:11:16'),
(441, 1, 'dsfdsf', 94, 'agent', 'text', '', '2022-06-06 12:11:21', NULL, '2022-06-06 12:11:21', '2022-06-06 12:11:21');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED DEFAULT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `pharmacy_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ower_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `telephone2` varchar(255) DEFAULT NULL,
  `address` text NOT NULL,
  `notes` text NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `active_id` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `active_sta` tinyint(1) NOT NULL DEFAULT '0',
  `mac` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `telephone_active` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `offline_plane` int(11) NOT NULL DEFAULT '5',
  `active_date` datetime DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `register_support` tinyint(1) NOT NULL DEFAULT '0',
  `support_start` date DEFAULT NULL,
  `support_end` date DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `users_no` int(11) NOT NULL DEFAULT '1',
  `sell_price` int(11) NOT NULL,
  `company_percent` int(11) NOT NULL,
  `net_price` int(11) NOT NULL,
  `payment_check` int(11) NOT NULL,
  `payment_time` date DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `currency` varchar(255) DEFAULT 'جنيه',
  `work_type` varchar(255) NOT NULL,
  `count_employee` int(11) NOT NULL,
  `home_tel` text NOT NULL,
  `whatsapp` text NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `media_know` int(11) NOT NULL,
  `comment` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `out_link` text NOT NULL,
  `bell_flag` tinyint(4) NOT NULL DEFAULT '0',
  `bell_date` date DEFAULT NULL,
  `contact_done` tinyint(4) NOT NULL DEFAULT '0',
  `contact_user_id` int(11) DEFAULT NULL,
  `contact_by` varchar(255) DEFAULT NULL,
  `t_s_renew_date` timestamp NULL DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `souq_domain` varchar(255) DEFAULT NULL,
  `share_url` varchar(255) DEFAULT NULL,
  `souq_subscribe` tinyint(1) DEFAULT NULL,
  `souq_start_date` date DEFAULT NULL,
  `souq_end_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `pharmacy_name`, `ower_name`, `telephone`, `telephone2`, `address`, `notes`, `email`, `password`, `active_id`, `active_sta`, `mac`, `telephone_active`, `offline_plane`, `active_date`, `country`, `add_date`, `register_support`, `support_start`, `support_end`, `company_id`, `product_id`, `users_no`, `sell_price`, `company_percent`, `net_price`, `payment_check`, `payment_time`, `payment_method`, `currency`, `work_type`, `count_employee`, `home_tel`, `whatsapp`, `facebook`, `media_know`, `comment`, `user_id`, `out_link`, `bell_flag`, `bell_date`, `contact_done`, `contact_user_id`, `contact_by`, `t_s_renew_date`, `city_id`, `activity_id`, `souq_domain`, `share_url`, `souq_subscribe`, `souq_start_date`, `souq_end_date`, `created_at`, `updated_at`, `ip`) VALUES
(2, 'تجريبى ', 'تجريبى ', '01114021665', '', 'تست البدر', '', '', '', '39e27e43dcb6a9eb5e114aa564608309', 0, '50-3E-AA-D8-95-3B', '123456789', 5, '0000-00-00 00:00:00', '187', '2013-02-03 15:53:35', 0, NULL, NULL, 1, 0, 1, 0, 0, 0, 1, '2014-09-27', 2, 'Ø±ÙŠØ§Ù„', '', 0, '', '', '', 0, '', 1, '', 0, NULL, 0, NULL, NULL, '2019-09-30 03:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:54:49', '2022-03-27 11:54:49', NULL),
(3, 'صيدلية المجمع الاسلامى', 'د/ عمرو الصعيدى', '01200333700', '', '', '', '', '', 'ef41c1f9621ac943ba6fd3df00eb6f7c', 0, '00-13-72-BC-A5-C2', '01200333700', 5, '0000-00-00 00:00:00', '', '2013-02-03 15:53:35', 0, NULL, NULL, 1, 0, 1, 0, 0, 0, 1, '2014-09-27', 2, 'جنيه', '', 0, '', '', '', 0, '', 1, '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:54:49', '2022-03-27 11:54:49', NULL),
(4, 'تجريبى', 'تجريبى', '01114021665', '', '', '', '', '', 'b5b6bbb3a366cfa487336187f97be254', 0, '60-EB-69-DC-D8-2B', '01114021665', 5, '0000-00-00 00:00:00', '', '2013-02-04 12:35:51', 1, '2013-02-04', '2018-02-04', 1, 2, 1, 0, 0, 0, 0, '0000-00-00', 2, 'جنيه', '', 0, '', '', '', 0, '', 1, '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-27 11:54:49', '2022-03-27 11:54:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `snap_chat` varchar(255) DEFAULT NULL,
  `terms_condition` text,
  `about_app` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(3) UNSIGNED NOT NULL,
  `name_en` varchar(200) DEFAULT NULL,
  `name_ar` varchar(200) NOT NULL,
  `iso_alpha2` varchar(2) DEFAULT NULL,
  `iso_alpha3` varchar(3) DEFAULT NULL,
  `iso_numeric` int(11) DEFAULT NULL,
  `phonecode` int(11) NOT NULL DEFAULT '0',
  `currency_code` char(3) DEFAULT NULL,
  `currency_name_en` varchar(32) DEFAULT NULL,
  `currency_name_ar` varchar(32) NOT NULL,
  `currrency_symbol` varchar(3) DEFAULT NULL,
  `flag` text,
  `orderflag` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) DEFAULT NULL,
  `phone_length` int(11) DEFAULT NULL,
  `sms_opt` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name_en`, `name_ar`, `iso_alpha2`, `iso_alpha3`, `iso_numeric`, `phonecode`, `currency_code`, `currency_name_en`, `currency_name_ar`, `currrency_symbol`, `flag`, `orderflag`, `ordering`, `phone_length`, `sms_opt`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'افغانستان', 'AF', 'AFG', 4, 93, 'AFN', 'Afghani', 'افغانى', '؋', 'AF.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(2, 'Albania', 'البانيا', 'AL', 'ALB', 8, 355, 'ALL', 'Lek', 'ليك', 'Lek', 'AL.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(3, 'Algeria', 'الجزائر', 'DZ', 'DZA', 12, 213, 'DZD', 'Dinar', 'دينار', NULL, 'DZ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(4, 'American Samoa', 'ساموا الأمريكية', 'AS', 'ASM', 16, 1684, 'USD', 'Dollar', 'دولار', '$', 'AS.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(5, 'Andorra', 'أندورا', 'AD', 'AND', 20, 376, 'EUR', 'Euro', 'يورو', '€', 'AD.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(6, 'Angola', 'انغولا', 'AO', 'AGO', 24, 244, 'AOA', 'Kwanza', 'كوانزا', 'Kz', 'AO.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(7, 'Anguilla', 'أنجويلا', 'AI', 'AIA', 660, 1264, 'XCD', 'Dollar', 'دولار', '$', 'AI.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(8, 'Antarctica', 'القارة القطبية الجنوبية', 'AQ', 'ATA', 10, 0, '', 'Dollar', 'دولار', NULL, 'AQ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(9, 'Antigua and Barbuda', 'أنتيغوا وبربودا', 'AG', 'ATG', 28, 1268, 'XCD', 'Dollar', 'دولار', '$', 'AG.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(10, 'Argentina', 'الارجنتين', 'AR', 'ARG', 32, 54, 'ARS', 'Peso', 'بيزو', '$', 'AR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(11, 'Armenia', 'ارمينيا', 'AM', 'ARM', 51, 374, 'AMD', 'Dram', 'درام', NULL, 'AM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(12, 'Aruba', 'اروبا', 'AW', 'ABW', 533, 297, 'AWG', 'Guilder', 'جيلدر', 'ƒ', 'AW.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(13, 'Australia', 'استراليا', 'AU', 'AUS', 36, 61, 'AUD', 'Dollar', 'دولار', '$', 'AU.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(14, 'Austria', 'النمسا', 'AT', 'AUT', 40, 43, 'EUR', 'Euro', 'يورو', '€', 'AT.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(15, 'Azerbaijan', 'ازبيكان', 'AZ', 'AZE', 31, 994, 'AZN', 'Manat', 'مانات', 'ман', 'AZ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(16, 'Bahamas', 'جزر البهاما', 'BS', 'BHS', 44, 1242, 'BSD', 'Dollar', 'دولار', '$', 'BS.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(17, 'Bahrain', 'البحرين', 'BH', 'BHR', 48, 973, 'BHD', 'Dinar', 'دينار', NULL, 'BH.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(18, 'Bangladesh', 'بنجلاديش', 'BD', 'BGD', 50, 880, 'BDT', 'Taka', 'تاكا', NULL, 'BD.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(19, 'Barbados', 'بربادوس', 'BB', 'BRB', 52, 1246, 'BBD', 'Dollar', 'دولار', '$', 'BB.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(20, 'Belarus', 'روسيا البيضاء', 'BY', 'BLR', 112, 375, 'BYR', 'Ruble', 'روبل', 'p.', 'BY.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(21, 'Belgium', 'بلجيكا', 'BE', 'BEL', 56, 32, 'EUR', 'Euro', 'يورو', '€', 'BE.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(22, 'Belize', 'بليز', 'BZ', 'BLZ', 84, 501, 'BZD', 'Dollar', 'دولار', 'BZ$', 'BZ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(23, 'Benin', 'بنين', 'BJ', 'BEN', 204, 229, 'XOF', 'Franc', 'فرنك', NULL, 'BJ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(24, 'Bermuda', 'برمودا', 'BM', 'BMU', 60, 1441, 'BMD', 'Dollar', 'دولار', '$', 'BM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(25, 'Bhutan', 'بوتان', 'BT', 'BTN', 64, 975, 'BTN', 'Ngultrum', 'نغولترم بوتاني', NULL, 'BT.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(26, 'Bolivia', 'بوليفيا', 'BO', 'BOL', 68, 591, 'BOB', 'Boliviano', 'بوليفاريو', '$b', 'BO.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(27, 'Bosnia and Herzegovina', 'البوسنة والهرسك', 'BA', 'BIH', 70, 387, 'BAM', 'Marka', 'ماركا', 'KM', 'BA.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(28, 'Botswana', 'بوتسوانا', 'BW', 'BWA', 72, 267, 'BWP', 'Pula', 'بولا', 'P', 'BW.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(29, 'Bouvet Island', 'جزيرة بوفيت', 'BV', 'BVT', 74, 0, 'NOK', 'Krone', 'كرون', 'kr', 'BV.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(30, 'Brazil', 'البرازيل', 'BR', 'BRA', 76, 55, 'BRL', 'Real', 'ريال', 'R$', 'BR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(31, 'British Indian Ocean Territory', 'إقليم المحيط الهندي البريطاني', 'IO', 'IOT', 86, 246, 'USD', 'Dollar', 'دولار', '$', 'IO.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(32, 'British Virgin Islands', 'جزر فيرجن البريطانية', 'VG', 'VGB', 92, 1284, 'USD', 'Dollar', 'دولار', '$', 'VG.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(33, 'Brunei', 'بروناي', 'BN', 'BRN', 96, 673, 'BND', 'Dollar', 'دولار', '$', 'BN.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(34, 'Bulgaria', 'بلغاريا', 'BG', 'BGR', 100, 359, 'BGN', 'Lev', 'ليف', 'лв', 'BG.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(35, 'Burkina Faso', 'بوركينا فاسو', 'BF', 'BFA', 854, 226, 'XOF', 'Franc', 'فرنك', NULL, 'BF.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(36, 'Burundi', 'بوروندي', 'BI', 'BDI', 108, 257, 'BIF', 'Franc', 'فرنك', NULL, 'BI.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(37, 'Cambodia', 'كمبوديا', 'KH', 'KHM', 116, 855, 'KHR', 'Riels', 'ريال', '៛', 'KH.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(38, 'Cameroon', 'كاميرون', 'CM', 'CMR', 120, 237, 'XAF', 'Franc', 'فرنك', 'FCF', 'CM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(39, 'Canada', 'كندا', 'CA', 'CAN', 124, 1, 'CAD', 'Dollar', 'دولار', '$', 'CA.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(40, 'Cape Verde', 'الرأس الأخضر', 'CV', 'CPV', 132, 238, 'CVE', 'Escudo', 'إيسكودو', NULL, 'CV.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(41, 'Cayman Islands', 'جزر كايمان', 'KY', 'CYM', 136, 1345, 'KYD', 'Dollar', 'دولار', '$', 'KY.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(42, 'Central African Republic', 'جمهورية افريقيا الوسطى', 'CF', 'CAF', 140, 236, 'XAF', 'Franc', 'فرنك', 'FCF', 'CF.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(43, 'Chad', 'تشاد', 'TD', 'TCD', 148, 235, 'XAF', 'Franc', 'فرنك', NULL, 'TD.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(44, 'Chile', 'تشيلى', 'CL', 'CHL', 152, 56, 'CLP', 'Peso', 'بيزو', NULL, 'CL.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(45, 'China', 'الصين', 'CN', 'CHN', 156, 86, 'CNY', 'Yuan Renminbi', 'يوان ', '¥', 'CN.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(46, 'Christmas Island', 'جزيرة الكريسماس', 'CX', 'CXR', 162, 61, 'AUD', 'Dollar', 'دولار', '$', 'CX.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(47, 'Cocos Islands', 'جزر كوكوس', 'CC', 'CCK', 166, 672, 'AUD', 'Dollar', 'دولار', '$', 'CC.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(48, 'Colombia', 'كولومبيا', 'CO', 'COL', 170, 57, 'COP', 'Peso', 'بيزو', '$', 'CO.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(49, 'Comoros', 'جزر القمر', 'KM', 'COM', 174, 269, 'KMF', 'Franc', 'فرنك', NULL, 'KM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(50, 'Cook Islands', 'جزر كوك', 'CK', 'COK', 184, 682, 'NZD', 'Dollar', 'دولار', '$', 'CK.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(51, 'Costa Rica', 'كوستا ريكا', 'CR', 'CRI', 188, 506, 'CRC', 'Colon', 'كولون', '₡', 'CR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(52, 'Croatia', 'كورواتيا', 'HR', 'HRV', 191, 385, 'HRK', 'Kuna', 'كونا', 'kn', 'HR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(53, 'Cuba', 'كوبا', 'CU', 'CUB', 192, 53, 'CUP', 'Peso', 'بيزو', '₱', 'CU.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(54, 'Cyprus', 'قبرص', 'CY', 'CYP', 196, 357, 'CYP', 'Pound', 'جنيه', NULL, 'CY.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(55, 'Czech Republic', 'التشيك', 'CZ', 'CZE', 203, 420, 'CZK', 'Koruna', 'كورونا', 'Kč', 'CZ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(56, 'Democratic Republic of the Congo', 'جمهورية الكونغو الديموقراطية', 'CD', 'COD', 180, 242, 'CDF', 'Franc', 'فرنك', NULL, 'CD.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(57, 'Denmark', 'الدنمارك', 'DK', 'DNK', 208, 45, 'DKK', 'Krone', 'كرون', 'kr', 'DK.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(58, 'Djibouti', 'جيبوتي', 'DJ', 'DJI', 262, 253, 'DJF', 'Franc', 'فرنك', NULL, 'DJ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(59, 'Dominica', 'دومينيكا', 'DM', 'DMA', 212, 1767, 'XCD', 'Dollar', 'دولار', '$', 'DM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(60, 'Dominican Republic', 'جمهورية الدومينيكان', 'DO', 'DOM', 214, 1809, 'DOP', 'Peso', 'بيزو', 'RD$', 'DO.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(61, 'East Timor', 'تيمور الشرقية', 'TL', 'TLS', 626, 670, 'USD', 'Dollar', 'دولار', '$', 'TL.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(62, 'Ecuador', 'الإكوادور', 'EC', 'ECU', 218, 593, 'USD', 'Dollar', 'دولار', '$', 'EC.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(63, 'Egypt', 'مصر', 'EG', 'EGY', 818, 20, 'EGP', 'Pound', 'جنيه', '£', 'EG.png', 9, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(64, 'El Salvador', 'السلفادور', 'SV', 'SLV', 222, 503, 'SVC', 'Dollar', 'دولار', '$', 'SV.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(65, 'Equatorial Guinea', 'غينيا الاستوائية', 'GQ', 'GNQ', 226, 240, 'XAF', 'Franc', 'فرنك', 'FCF', 'GQ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(66, 'Eritrea', 'إريتريا', 'ER', 'ERI', 232, 291, 'ERN', 'Nakfa', 'نكفا', 'Nfk', 'ER.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(67, 'Estonia', 'استونيا', 'EE', 'EST', 233, 372, 'EEK', 'Kroon', 'كرون', 'kr', 'EE.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(68, 'Ethiopia', 'اثيوبيا', 'ET', 'ETH', 231, 251, 'ETB', 'Birr', 'بير', NULL, 'ET.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(69, 'Falkland Islands', 'جزر فوكلاند', 'FK', 'FLK', 238, 500, 'FKP', 'Pound', 'جنيه', '£', 'FK.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(70, 'Faroe Islands', 'جزر فارو', 'FO', 'FRO', 234, 298, 'DKK', 'Krone', 'كرون', 'kr', 'FO.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(71, 'Fiji', 'فيجي', 'FJ', 'FJI', 242, 679, 'FJD', 'Dollar', 'دولار', '$', 'FJ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(72, 'Finland', 'فنلندا', 'FI', 'FIN', 246, 358, 'EUR', 'Euro', 'يورو', '€', 'FI.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(73, 'France', 'فرنسا', 'FR', 'FRA', 250, 33, 'EUR', 'Euro', 'يورو', '€', 'FR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(74, 'French Guiana', 'غيانا الفرنسية', 'GF', 'GUF', 254, 594, 'EUR', 'Euro', 'يورو', '€', 'GF.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(75, 'French Polynesia', 'بولينيزيا الفرنسية', 'PF', 'PYF', 258, 689, 'XPF', 'Franc', 'فرنك', NULL, 'PF.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(76, 'French Southern Territories', 'الاقاليم الجنوبية الفرنسية', 'TF', 'ATF', 260, 0, 'EUR', 'Euro  ', 'يورو', '€', 'TF.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(77, 'Gabon', 'جابون', 'GA', 'GAB', 266, 241, 'XAF', 'Franc', 'فرنك', 'FCF', 'GA.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(78, 'Gambia', 'غامبيا', 'GM', 'GMB', 270, 220, 'GMD', 'Dalasi', 'دالاسى', 'D', 'GM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(79, 'Georgia', 'جورجيا', 'GE', 'GEO', 268, 995, 'GEL', 'Lari', 'لارى', NULL, 'GE.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(80, 'Germany', 'المانيا', 'DE', 'DEU', 276, 49, 'EUR', 'Euro', 'يورو', '€', 'DE.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(81, 'Ghana', 'غانا', 'GH', 'GHA', 288, 233, 'GHC', 'Cedi', 'سيدى', '¢', 'GH.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(82, 'Gibraltar', 'جبل طارق', 'GI', 'GIB', 292, 350, 'GIP', 'Pound', 'جنيه', '£', 'GI.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(83, 'Greece', 'اليونان', 'GR', 'GRC', 300, 30, 'EUR', 'Euro', 'يورو', '€', 'GR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(84, 'Greenland', 'جرينلاند', 'GL', 'GRL', 304, 299, 'DKK', 'Krone', 'كرون', 'kr', 'GL.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(85, 'Grenada', 'غرينادا', 'GD', 'GRD', 308, 1473, 'XCD', 'Dollar', 'دولار', '$', 'GD.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(86, 'Guadeloupe', 'غوادلوب', 'GP', 'GLP', 312, 590, 'EUR', 'Euro', 'يورو', '€', 'GP.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(87, 'Guam', 'غوام', 'GU', 'GUM', 316, 1671, 'USD', 'Dollar', 'دولار', '$', 'GU.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(88, 'Guatemala', 'غواتيمالا', 'GT', 'GTM', 320, 502, 'GTQ', 'Quetzal', 'كتزال', 'Q', 'GT.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(89, 'Guinea', 'غينيا', 'GN', 'GIN', 324, 224, 'GNF', 'Franc', 'فرنك', NULL, 'GN.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(90, 'Guinea-Bissau', 'غينيا بيساو', 'GW', 'GNB', 624, 245, 'XOF', 'Franc', 'فرنك', NULL, 'GW.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(91, 'Guyana', 'غيانا', 'GY', 'GUY', 328, 592, 'GYD', 'Dollar', 'دولار', '$', 'GY.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(92, 'Haiti', 'هايتى', 'HT', 'HTI', 332, 509, 'HTG', 'Gourde', 'جورده', 'G', 'HT.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(93, 'Heard Island and McDonald Islands', 'جزيرة هيرد وجزر ماكدونالد', 'HM', 'HMD', 334, 0, 'AUD', 'Dollar', 'دولار', '$', 'HM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(94, 'Honduras', 'هندوراس', 'HN', 'HND', 340, 504, 'HNL', 'Lempira', 'ليمبيرا', 'L', 'HN.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(95, 'Hong Kong', 'هونج كونج', 'HK', 'HKG', 344, 852, 'HKD', 'Dollar', 'دولار', '$', 'HK.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(96, 'Hungary', 'المجر', 'HU', 'HUN', 348, 36, 'HUF', 'Forint', 'فورنت مجرى', 'Ft', 'HU.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(97, 'Iceland', 'أيسلندا', 'IS', 'ISL', 352, 354, 'ISK', 'Krona', 'كرونا', 'kr', 'IS.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(98, 'India', 'الهند', 'IN', 'IND', 356, 91, 'INR', 'Rupee', 'روبية', '₹', 'IN.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(99, 'Indonesia', 'اندونسيا', 'ID', 'IDN', 360, 62, 'IDR', 'Rupiah', 'روبيه', 'Rp', 'ID.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(100, 'Iran', 'ايران', 'IR', 'IRN', 364, 98, 'IRR', 'Rial', 'ريال', '﷼', 'IR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(101, 'Iraq', 'العراق', 'IQ', 'IRQ', 368, 964, 'IQD', 'Dinar', 'دينار', NULL, 'IQ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(102, 'Ireland', 'ايرلندا', 'IE', 'IRL', 372, 353, 'EUR', 'Euro', 'يورو', '€', 'IE.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(103, 'Israel', 'اسرائيل', 'IL', 'ISR', 376, 972, 'ILS', 'Shekel', 'شيكل', '₪', 'IL.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(104, 'Italy', 'ايطاليا', 'IT', 'ITA', 380, 39, 'EUR', 'Euro', 'يورو', '€', 'IT.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(105, 'Ivory Coast', 'ساحل العاج', 'CI', 'CIV', 384, 225, 'XOF', 'Franc', 'فرنك', NULL, 'CI.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(106, 'Jamaica', 'جاميكا', 'JM', 'JAM', 388, 1876, 'JMD', 'Dollar', 'دولار', '$', 'JM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(107, 'Japan', 'اليابان', 'JP', 'JPN', 392, 81, 'JPY', 'Yen', 'ين', '¥', 'JP.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(108, 'Jordan', 'الاردن', 'JO', 'JOR', 400, 962, 'JOD', 'Dinar', 'دينار', NULL, 'JO.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(109, 'Kazakhstan', 'كازاخستان', 'KZ', 'KAZ', 398, 7, 'KZT', 'Tenge', 'تنغ', 'лв', 'KZ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(110, 'Kenya', 'كينيا', 'KE', 'KEN', 404, 254, 'KES', 'Shilling', 'شيلينغ', NULL, 'KE.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(111, 'Kiribati', 'كيريباس', 'KI', 'KIR', 296, 686, 'AUD', 'Dollar', 'دولار', '$', 'KI.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(112, 'Kuwait', 'الكويت', 'KW', 'KWT', 414, 965, 'KWD', 'Dinar', 'دينار', NULL, 'KW.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(113, 'Kyrgyzstan', 'قيرغيزستان', 'KG', 'KGZ', 417, 996, 'KGS', 'Som', 'سوم', 'лв', 'KG.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(114, 'Laos', 'لاوس', 'LA', 'LAO', 418, 856, 'LAK', 'Kip', 'كيب', '₭', 'LA.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(115, 'Latvia', 'لاتيفا', 'LV', 'LVA', 428, 371, 'LVL', 'Lat', 'لات', 'Ls', 'LV.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(116, 'Lebanon', 'لبنان', 'LB', 'LBN', 422, 961, 'LBP', 'LBP', 'ليرة', 'LBP', 'LB.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(117, 'Lesotho', 'ليسوتو', 'LS', 'LSO', 426, 266, 'LSL', 'Loti', 'لوتو', 'L', 'LS.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(118, 'Liberia', 'ليبيريا', 'LR', 'LBR', 430, 231, 'LRD', 'Dollar', 'دولار', '$', 'LR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(119, 'Libya', 'ليبيا', 'LY', 'LBY', 434, 218, 'LYD', 'Dinar', 'دينار', NULL, 'LY.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(120, 'Liechtenstein', 'ليشتنشتاين', 'LI', 'LIE', 438, 423, 'CHF', 'Franc', 'فرنك', 'CHF', 'LI.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(121, 'Lithuania', 'ليتوانيا', 'LT', 'LTU', 440, 370, 'LTL', 'Litas', 'ليتاس', 'Lt', 'LT.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(122, 'Luxembourg', 'لوكسمبورغ', 'LU', 'LUX', 442, 352, 'EUR', 'Euro', 'يورو', '€', 'LU.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(123, 'Macao', 'ماكاو', 'MO', 'MAC', 446, 853, 'MOP', 'Pataca', 'باتاكا', 'MOP', 'MO.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(124, 'Macedonia', 'مقدونيا', 'MK', 'MKD', 807, 389, 'MKD', 'Denar', 'دينار', 'ден', 'MK.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(125, 'Madagascar', 'مدغشقر', 'MG', 'MDG', 450, 261, 'MGA', 'Ariary', 'اريارى', NULL, 'MG.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(126, 'Malawi', 'مالاوي', 'MW', 'MWI', 454, 265, 'MWK', 'Kwacha', 'كواشا', 'MK', 'MW.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(127, 'Malaysia', 'ماليزيا', 'MY', 'MYS', 458, 60, 'MYR', 'Ringgit', 'رنغيت', 'RM', 'MY.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(128, 'Maldives', 'جزر المالديف', 'MV', 'MDV', 462, 960, 'MVR', 'Rufiyaa', 'روفيه', 'Rf', 'MV.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(129, 'Mali', 'مالى', 'ML', 'MLI', 466, 223, 'XOF', 'Franc', 'فرنك', NULL, 'ML.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(130, 'Malta', 'مالطا', 'MT', 'MLT', 470, 356, 'MTL', 'Lira', 'ليره', NULL, 'MT.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(131, 'Marshall Islands', 'جزر مارشال', 'MH', 'MHL', 584, 692, 'USD', 'Dollar', 'دولار', '$', 'MH.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(132, 'Martinique', 'مارتينيك', 'MQ', 'MTQ', 474, 596, 'EUR', 'Euro', 'يورو', '€', 'MQ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(133, 'Mauritania', 'موريتانيا', 'MR', 'MRT', 478, 222, 'MRO', 'Ouguiya', 'اوقية', 'UM', 'MR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(134, 'Mauritius', 'موريشيوس', 'MU', 'MUS', 480, 230, 'MUR', 'Rupee', 'روبية', '₨', 'MU.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(135, 'Mayotte', 'مايوت', 'YT', 'MYT', 175, 269, 'EUR', 'Euro', 'يورو', '€', 'YT.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(136, 'Mexico', 'المكسيك', 'MX', 'MEX', 484, 52, 'MXN', 'Peso', 'بيزو', '$', 'MX.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(137, 'Micronesia', 'ميكرونيزيا', 'FM', 'FSM', 583, 691, 'USD', 'Dollar', 'دولار', '$', 'FM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(138, 'Moldova', 'مولدافيا', 'MD', 'MDA', 498, 373, 'MDL', 'Leu', 'ليو', NULL, 'MD.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(139, 'Monaco', 'موناكو', 'MC', 'MCO', 492, 377, 'EUR', 'Euro', 'يورو', '€', 'MC.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(140, 'Mongolia', 'منغوليا', 'MN', 'MNG', 496, 976, 'MNT', 'Tugrik', 'توغروغ', '₮', 'MN.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(141, 'Montserrat', 'مونتسيرات', 'MS', 'MSR', 500, 1664, 'XCD', 'Dollar', 'دولار', '$', 'MS.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(142, 'Morocco', 'المغرب', 'MA', 'MAR', 504, 212, 'MAD', 'Dirham', 'درهم', NULL, 'MA.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(143, 'Mozambique', 'موزمبيق', 'MZ', 'MOZ', 508, 258, 'MZN', 'Meticail', 'متكال', 'MT', 'MZ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(144, 'Myanmar', 'بورما', 'MM', 'MMR', 104, 95, 'MMK', 'Kyat', 'كيات', 'K', 'MM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(145, 'Namibia', 'نامبيا', 'NA', 'NAM', 516, 264, 'NAD', 'Dollar', 'دولار', '$', 'NA.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(146, 'Nauru', 'ناورو', 'NR', 'NRU', 520, 674, 'AUD', 'Dollar', 'دولار', '$', 'NR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(147, 'Nepal', 'نيبال', 'NP', 'NPL', 524, 977, 'NPR', 'Rupee', 'روبية', '₨', 'NP.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(148, 'Netherlands', 'هولندا', 'NL', 'NLD', 528, 31, 'EUR', 'Euro', 'يورو', '€', 'NL.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(149, 'Netherlands Antilles', 'الأنتيل الهولندية', 'AN', 'ANT', 530, 599, 'ANG', 'Guilder', 'جيلدر', 'ƒ', 'AN.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(150, 'New Caledonia', 'كاليدونيا الجديدة', 'NC', 'NCL', 540, 687, 'XPF', 'Franc', 'فرنك', NULL, 'NC.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(151, 'New Zealand', 'نيوزيلندا', 'NZ', 'NZL', 554, 64, 'NZD', 'Dollar', 'دولار', '$', 'NZ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(152, 'Nicaragua', 'نيكاراغوا', 'NI', 'NIC', 558, 505, 'NIO', 'Cordoba', 'كوردبا', 'C$', 'NI.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(153, 'Niger', 'النيجر', 'NE', 'NER', 562, 227, 'XOF', 'Franc', 'فرنك', NULL, 'NE.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(154, 'Nigeria', 'نيجريا', 'NG', 'NGA', 566, 234, 'NGN', 'Naira', 'نيره', '₦', 'NG.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(155, 'Niue', 'نيوي', 'NU', 'NIU', 570, 683, 'NZD', 'Dollar', 'دولار', '$', 'NU.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(156, 'Norfolk Island', 'جزيرة نورفولك', 'NF', 'NFK', 574, 672, 'AUD', 'Dollar', 'دولار', '$', 'NF.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(157, 'North Korea', 'كوريا الشماليه', 'KP', 'PRK', 408, 850, 'KPW', 'Won', 'وون', '₩', 'KP.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(158, 'Northern Mariana Islands', 'جزر ماريانا الشمالية', 'MP', 'MNP', 580, 1670, 'USD', 'Dollar', 'دولار', '$', 'MP.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(159, 'Norway', 'النرويج', 'NO', 'NOR', 578, 47, 'NOK', 'Krone', 'كرون', 'kr', 'NO.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(160, 'Oman', 'عمان', 'OM', 'OMN', 512, 968, 'OMR', 'Rial', 'ريال', '﷼', 'OM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(161, 'Pakistan', 'باكستان', 'PK', 'PAK', 586, 92, 'PKR', 'Rupee', 'روبية', '₨', 'PK.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(162, 'Palau', 'بالاو', 'PW', 'PLW', 585, 680, 'USD', 'Dollar', 'دولار', '$', 'PW.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(163, 'Palestinian Territory', 'فلسطين', 'PS', 'PSE', 275, 970, 'ILS', 'Shekel', 'جنيه فلسطينى', '₪', 'PS.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(164, 'Panama', 'بنما', 'PA', 'PAN', 591, 507, 'PAB', 'Balboa', 'بالبوا بنمي', 'B/.', 'PA.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(165, 'Papua New Guinea', 'غينيا الجديدة', 'PG', 'PNG', 598, 675, 'PGK', 'Kina', 'كينا', NULL, 'PG.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(166, 'Paraguay', 'باراغواي', 'PY', 'PRY', 600, 595, 'PYG', 'Guarani', 'غواراني', 'Gs', 'PY.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(167, 'Peru', 'بيرو', 'PE', 'PER', 604, 51, 'PEN', 'Sol', 'سول', 'S/.', 'PE.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(168, 'Philippines', 'الفلبين', 'PH', 'PHL', 608, 63, 'PHP', 'Peso', 'بيزو', 'Php', 'PH.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(169, 'Pitcairn', 'بيتكيرن', 'PN', 'PCN', 612, 0, 'NZD', 'Dollar', 'دولار', '$', 'PN.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(170, 'Poland', 'بولندا', 'PL', 'POL', 616, 48, 'PLN', 'Zloty', 'زلوتي بولندي', 'zł', 'PL.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(171, 'Portugal', 'البرتغال', 'PT', 'PRT', 620, 351, 'EUR', 'Euro', 'يورو', '€', 'PT.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(172, 'Puerto Rico', 'بورتو ريكو', 'PR', 'PRI', 630, 1787, 'USD', 'Dollar', 'دولار', '$', 'PR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(173, 'Qatar', 'قطر', 'QA', 'QAT', 634, 974, 'QAR', 'Rial', 'ريال', '﷼', 'QA.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(174, 'Republic of the Congo', 'جمهورية الكونغو', 'CG', 'COG', 178, 242, 'XAF', 'Franc', 'فرنك', 'FCF', 'CG.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(175, 'Reunion', ' ريونيون', 'RE', 'REU', 638, 262, 'EUR', 'Euro', 'يورو', '€', 'RE.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(176, 'Romania', 'رومانيا', 'RO', 'ROU', 642, 40, 'RON', 'Leu', 'ليو', 'lei', 'RO.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(177, 'Russia', 'روسيا', 'RU', 'RUS', 643, 70, 'RUB', 'Ruble', 'روبل', 'руб', 'RU.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(178, 'Rwanda', 'رواندا', 'RW', 'RWA', 646, 250, 'RWF', 'Franc', 'فرنك', NULL, 'RW.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(179, 'Saint Helena', 'سانت هيلانة', 'SH', 'SHN', 654, 290, 'SHP', 'Pound', 'جنيه', '£', 'SH.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(180, 'Saint Kitts and Nevis', 'سانت كيتس ونيفيس', 'KN', 'KNA', 659, 1869, 'XCD', 'Dollar', 'دولار', '$', 'KN.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(181, 'Saint Lucia', 'سانت لوسيا', 'LC', 'LCA', 662, 1758, 'XCD', 'Dollar', 'دولار', '$', 'LC.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(182, 'Saint Pierre and Miquelon', 'سان بيار وميكلون', 'PM', 'SPM', 666, 508, 'EUR', 'Euro', 'يورو', '€', 'PM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(183, 'Saint Vincent and the Grenadines', 'سانت فنسنت وجزر غرينادين', 'VC', 'VCT', 670, 1784, 'XCD', 'Dollar', 'دولار', '$', 'VC.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(184, 'Samoa', 'ساموا', 'WS', 'WSM', 882, 684, 'WST', 'Tala', 'تالا', 'WS$', 'WS.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(185, 'San Marino', 'سان مارينو', 'SM', 'SMR', 674, 378, 'EUR', 'Euro', 'يورو', '€', 'SM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(186, 'Sao Tome and Principe', 'ساو تومي وبرينسيب', 'ST', 'STP', 678, 239, 'STD', 'Dobra', 'دوبرا', 'Db', 'ST.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(187, 'Saudi Arabia', 'المملكه العربيه السعوديه', 'SA', 'SAU', 682, 966, 'SAR', 'Rial', 'ريال', '﷼', 'SA.png', 10, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(188, 'Senegal', 'السنغال', 'SN', 'SEN', 686, 221, 'XOF', 'Franc', 'فرنك', NULL, 'SN.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(189, 'Serbia and Montenegro', 'صربيا', 'CS', 'SCG', 891, 381, 'RSD', 'Dinar', 'دينار', 'Дин', 'CS.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(190, 'Seychelles', 'سيشيل', 'SC', 'SYC', 690, 248, 'SCR', 'Rupee', 'روبية', '₨', 'SC.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(191, 'Sierra Leone', 'سيراليون', 'SL', 'SLE', 694, 232, 'SLL', 'Leone', 'ليون', 'Le', 'SL.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(192, 'Singapore', 'سنغافورة', 'SG', 'SGP', 702, 65, 'SGD', 'Dollar', 'دولار', '$', 'SG.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(193, 'Slovakia', 'سلوفاكيا', 'SK', 'SVK', 703, 421, 'SKK', 'Koruna', 'كورونا', 'Sk', 'SK.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(194, 'Slovenia', 'سلوفينيا', 'SI', 'SVN', 705, 386, 'EUR', 'Euro', 'يورو', '€', 'SI.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(195, 'Solomon Islands', 'جزر سليمان', 'SB', 'SLB', 90, 677, 'SBD', 'Dollar', 'دولار', '$', 'SB.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(196, 'Somalia', 'الصومال', 'SO', 'SOM', 706, 252, 'SOS', 'Shilling', 'شلن صومالى', 'S', 'SO.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(197, 'South Africa', 'جنوب افريقيا', 'ZA', 'ZAF', 710, 27, 'ZAR', 'Rand', 'راند', 'R', 'ZA.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(198, 'South Georgia and the South Sandwich Islands', 'جورجيا الجنوبية وجزر ساندويتش الجنوبية', 'GS', 'SGS', 239, 0, 'GBP', 'Pound', 'جنيه', '£', 'GS.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(199, 'South Korea', 'كوريا الجنوبيه', 'KR', 'KOR', 410, 82, 'KRW', 'Won', 'وون', '₩', 'KR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(200, 'Spain', 'اسبانيا', 'ES', 'ESP', 724, 34, 'EUR', 'Euro', 'يورو', '€', 'ES.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(201, 'Sri Lanka', 'سيريلانكا', 'LK', 'LKA', 144, 94, 'LKR', 'Rupee', 'روبية', '₨', 'LK.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(202, 'Sudan', 'السودان', 'SD', 'SDN', 736, 249, 'SDD', 'Dinar', 'دينار', NULL, 'SD.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(203, 'Suriname', 'سورينام', 'SR', 'SUR', 740, 597, 'SRD', 'Dollar', 'دولار', '$', 'SR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(204, 'Svalbard and Jan Mayen', 'سفالبارد وجان مايان', 'SJ', 'SJM', 744, 47, 'NOK', 'Krone', 'كرون', 'kr', 'SJ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(205, 'Swaziland', 'سوازيلاند', 'SZ', 'SWZ', 748, 268, 'SZL', 'Lilangeni', 'ليلانغيني سوازيلندي', NULL, 'SZ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(206, 'Sweden', 'السويد', 'SE', 'SWE', 752, 46, 'SEK', 'Krona', 'كرونا', 'kr', 'SE.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(207, 'Switzerland', 'سويسرا', 'CH', 'CHE', 756, 41, 'CHF', 'Franc', 'فرنك', 'CHF', 'CH.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(208, 'Syria', 'سوريا', 'SY', 'SYR', 760, 963, 'SYP', 'Pound', 'جنيه', '£', 'SY.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(209, 'Taiwan', 'تايوان', 'TW', 'TWN', 158, 886, 'TWD', 'Dollar', 'دولار', 'NT$', 'TW.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(210, 'Tajikistan', 'طاجيكستان', 'TJ', 'TJK', 762, 992, 'TJS', 'Somoni', 'سامانى', NULL, 'TJ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(211, 'Tanzania', 'تنزانيا', 'TZ', 'TZA', 834, 255, 'TZS', 'Shilling', 'شيلينغ', NULL, 'TZ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(212, 'Thailand', 'تايلاند', 'TH', 'THA', 764, 66, 'THB', 'Baht', 'بات', '฿', 'TH.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(213, 'Togo', 'توغو', 'TG', 'TGO', 768, 228, 'XOF', 'Franc', 'فرنك', NULL, 'TG.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(214, 'Tokelau', 'توكيلاو', 'TK', 'TKL', 772, 690, 'NZD', 'Dollar', 'دولار', '$', 'TK.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(215, 'Tonga', 'تونغا', 'TO', 'TON', 776, 676, 'TOP', 'Pa\'anga', 'بانغا تونغي', 'T$', 'TO.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(216, 'Trinidad and Tobago', 'ترينداد وتوباغو', 'TT', 'TTO', 780, 1868, 'TTD', 'Dollar', 'دولار', 'TT$', 'TT.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(217, 'Tunisia', 'تونس', 'TN', 'TUN', 788, 216, 'TND', 'Dinar', 'دينار', NULL, 'TN.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(218, 'Turkey', 'تركيا', 'TR', 'TUR', 792, 90, 'TRY', 'Lira', 'ليره تركيه', 'YTL', 'TR.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(219, 'Turkmenistan', 'تركمانستان', 'TM', 'TKM', 795, 7370, 'TMM', 'Manat', 'منات', 'm', 'TM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(220, 'Turks and Caicos Islands', 'جزر تركس وكايكوس', 'TC', 'TCA', 796, 1649, 'USD', 'Dollar', 'دولار', '$', 'TC.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(221, 'Tuvalu', 'توفالو', 'TV', 'TUV', 798, 688, 'AUD', 'Dollar', 'دولار', '$', 'TV.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(222, 'U.S. Virgin Islands', 'جزر فيرجن الأمريكية', 'VI', 'VIR', 850, 1340, 'USD', 'Dollar', 'دولار', '$', 'VI.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(223, 'Uganda', 'اوغندا', 'UG', 'UGA', 800, 256, 'UGX', 'Shilling', 'شيلينغ أوغندي', NULL, 'UG.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(224, 'Ukraine', 'اوكرانيا', 'UA', 'UKR', 804, 380, 'UAH', 'Hryvnia', 'هريفنا', '₴', 'UA.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(225, 'United Arab Emirates', 'الامارات العربيه المتحده', 'AE', 'ARE', 784, 971, 'AED', 'Dirham', 'درهم', NULL, 'AE.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(226, 'United Kingdom', 'انجلترا', 'GB', 'GBR', 826, 44, 'GBP', 'Pound', 'جنيه', '£', 'GB.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(227, 'United States', 'امريكا', 'US', 'USA', 840, 1, 'USD', 'Dollar', 'دولار', '$', 'US.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(228, 'United States Minor Outlying Islands', '\nجزر الولايات المتحدة البعيدة الصغيرة', 'UM', 'UMI', 581, 1, 'USD', 'Dollar ', 'دولار', '$', 'UM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(229, 'Uruguay', 'أوروغواي', 'UY', 'URY', 858, 598, 'UYU', 'Peso', 'بيزو', '$U', 'UY.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(230, 'Uzbekistan', 'أوزبكستان', 'UZ', 'UZB', 860, 998, 'UZS', 'Som', 'سوم', 'лв', 'UZ.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(231, 'Vanuatu', 'فانواتو', 'VU', 'VUT', 548, 678, 'VUV', 'Vatu', 'فاتو', 'Vt', 'VU.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(232, 'Vatican', 'الفاتيكان', 'VA', 'VAT', 336, 39, 'EUR', 'Euro', 'يورو', '€', 'VA.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(233, 'Venezuela', 'فنزويلا', 'VE', 'VEN', 862, 58, 'VEF', 'Bolivar', 'بوليفار', 'Bs', 'VE.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(234, 'Vietnam', 'فيتنام', 'VN', 'VNM', 704, 84, 'VND', 'Dong', 'دونغ', '₫', 'VN.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(235, 'Wallis and Futuna', 'واليس وفوتونا', 'WF', 'WLF', 876, 681, 'XPF', 'Franc', 'فرنك', NULL, 'WF.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(236, 'Western Sahara', 'الصحراء الغربية', 'EH', 'ESH', 732, 212, 'MAD', 'Dirham', 'درهم', NULL, 'EH.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(237, 'Yemen', 'اليمن', 'YE', 'YEM', 887, 967, 'YER', 'Rial', 'ريال', '﷼', 'YE.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(238, 'Zambia', 'زامبيا', 'ZM', 'ZMB', 894, 260, 'ZMK', 'Kwacha', 'كواشا', 'ZK', 'ZM.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38'),
(239, 'Zimbabwe', 'زيمبابوي', 'ZW', 'ZWE', 716, 263, 'ZWD', 'Dollar', 'دولار', 'Z$', 'ZW.png', 0, NULL, NULL, NULL, '2022-03-27 11:55:38', '2022-03-27 11:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `expenses_register`
--

CREATE TABLE `expenses_register` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text NOT NULL,
  `money` double NOT NULL,
  `notes` text NOT NULL,
  `safe_id` int(11) NOT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  `transaction_flag` varchar(255) NOT NULL,
  `add_user` varchar(255) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_user` varchar(255) NOT NULL,
  `last_update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expenses_register`
--

INSERT INTO `expenses_register` (`id`, `item_id`, `date`, `description`, `money`, `notes`, `safe_id`, `currency_name`, `transaction_flag`, `add_user`, `add_date`, `last_update_user`, `last_update_date`) VALUES
(1, 16, '2019-08-20', 'الال', 100, 'There Is No Notes Until Now!', 6, 'دولار', '20082019020954', 'ahmadelrefayee', '2019-08-20 17:09:54', 'ahmadelrefayee', '2019-08-20 17:09:54'),
(2, 2, '2019-08-20', 'ااب', 120, 'ابا', 9, 'جنيه', '20082019021014', 'ahmadelrefayee', '2019-08-20 17:10:14', 'ahmadelrefayee', '2019-08-20 17:10:14');

-- --------------------------------------------------------

--
-- Table structure for table `expense_items`
--

CREATE TABLE `expense_items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expense_items`
--

INSERT INTO `expense_items` (`id`, `name`, `description`) VALUES
(1, 'سلف موظفين', 'سلف موظفين'),
(2, 'كهرباء', 'شحن كهرباء'),
(3, 'ايجار', 'ايجار شهري'),
(4, 'الانترنت', 'شحن النت'),
(5, 'البوفية', 'بوفية الشركه'),
(6, 'صيانه', 'صيانه شامله'),
(7, 'اجهزة كمبيوتر', 'شراء وتجديد وصيانه الاجهزه'),
(8, 'المرتبات', 'اجمالي المرتبات الشهريه'),
(9, 'التامينات والمعاشات', 'دفعات شهريه'),
(10, 'ضرائب', 'ضريبة مكتسبه مدفوعه'),
(11, 'مصاريف انشائية', 'مصاريف انشائيه وتجديدات'),
(12, 'استضافات داخلية', 'استضافات لمشروعات داخليه للشركه'),
(13, 'ايجار السيرفر الخارجي', 'ايجار السيرفرات بشكل عام'),
(14, 'مكافات', 'مكافات ماديه للموظفين'),
(15, 'نثريات', 'نثريات للشركه'),
(16, 'داعية واعلانات', 'داعيه واعلانات مكتوبه'),
(17, 'حملات تسويقيه', 'حملات تسوقيه بشكل عام'),
(18, 'بدلات', 'بدلات انتقالات بشكل عام موظفين واداره');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_companies`
--

CREATE TABLE `marketing_companies` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `sales_man` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sales_percent` varchar(255) NOT NULL,
  `privilige` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marketing_companies`
--

INSERT INTO `marketing_companies` (`id`, `company_name`, `country`, `sales_man`, `tel`, `user`, `password`, `sales_percent`, `privilige`) VALUES
(1, 'بدر للنظم الذكية', 'مصر', 'محمود الزيادي', '01114021665', 'admin', '47ad41c7ec8e977816cbec9b02b475b9', '0', '1.00'),
(2, 'المحضار الدولية للتجارة والصناعة', 'اليمن', 'مصطفى العطار', '+967773323887', 'mostafa@almhdar.com', '205dcfe76c0a9e931ad7d7c89ad7ed12', '35', '0.00'),
(3, 'بدر للنظم الذكية', 'مصر', 'صالح', '01114021665', 'saleh', 'ad53c9540838a5a17fca1b8401b0e127', '0', '1.00');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2021_03_24_124210_player_ids', 3),
(14, '2021_08_04_142048_create_accounts', 4),
(15, '2021_08_05_131335_create_chat_channels', 5),
(16, '2021_08_05_134853_create_chat_messages', 5),
(17, '2021_08_05_140523_create_chat_logs', 5),
(18, '2019_12_14_000001_create_personal_access_tokens_table', 6),
(19, '2021_08_18_225340_create_sessions_table', 6),
(20, '2021_08_18_225900_create_messages_table', 6),
(21, '2021_08_18_230225_create_chats_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('41ce9c0bc525929cf896eb161fabaa8597b2e5865fb6217e579a4dba955c19445bd2bca9ea9b6848', 1, 8, 'authToken', '[]', 0, '2022-05-26 07:44:45', '2022-05-26 07:44:45', '2023-05-26 09:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'oPzqlkPEyH7SnGsDmyiiMlDLpbGXm9rViU913BWD', NULL, 'http://localhost', 1, 0, 0, '2021-07-29 04:06:01', '2021-07-29 04:06:01'),
(2, NULL, 'Laravel Password Grant Client', 'Pyacc1pEwB3oPyrMMQHYSTUcExxGjoFQm8fHdPQ9', 'users', 'http://localhost', 0, 1, 0, '2021-07-29 04:06:01', '2021-07-29 04:06:01'),
(3, NULL, 'Laravel Personal Access Client', 'aFIiTw4U4OTYs9A6CJuYzbrR4LpWVb2Xt2Ydrb2e', NULL, 'http://localhost', 1, 0, 0, '2021-08-22 08:26:11', '2021-08-22 08:26:11'),
(4, NULL, 'Laravel Password Grant Client', 'Czorb7mujRqiccm1oXngcUGYmPpbxl2LwjajAg2Z', 'users', 'http://localhost', 0, 1, 0, '2021-08-22 08:26:11', '2021-08-22 08:26:11'),
(5, NULL, 'Laravel Personal Access Client', 'mo8RUmpxmpJYH8eEz8eCyBRyTQqMZ2qbQHiocr25', NULL, 'http://localhost', 1, 0, 0, '2022-04-06 07:47:03', '2022-04-06 07:47:03'),
(6, NULL, 'Laravel Personal Access Client', 'cxg8as86WYbw04GYiwThxqmmSBIJKchho1E6s0jS', NULL, 'http://localhost', 1, 0, 0, '2022-04-06 07:49:04', '2022-04-06 07:49:04'),
(7, NULL, 'Laravel Password Grant Client', 'DFxxVGCeTkXXfFbRc9MdOG2l5Dzdctb1AVf9qb2w', 'users', 'http://localhost', 0, 1, 0, '2022-04-06 07:49:04', '2022-04-06 07:49:04'),
(8, NULL, 'Laravel Personal Access Client', 'OMYp3fdvGJKrsef8xDPnF4nUnIU3TwtvFbIOEfDZ', NULL, 'http://localhost', 1, 0, 0, '2022-04-06 08:03:40', '2022-04-06 08:03:40'),
(9, NULL, 'Laravel Password Grant Client', 'J3VCIqKNyzkbKaS4PaoaEddBZbgNszYuOVWxVDc0', 'users', 'http://localhost', 0, 1, 0, '2022-04-06 08:03:40', '2022-04-06 08:03:40');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-07-29 04:06:01', '2021-07-29 04:06:01'),
(2, 3, '2021-08-22 08:26:11', '2021-08-22 08:26:11'),
(3, 6, '2022-04-06 07:49:04', '2022-04-06 07:49:04'),
(4, 8, '2022-04-06 08:03:40', '2022-04-06 08:03:40');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_sales`
--

CREATE TABLE `online_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(11) NOT NULL,
  `sale_point` int(11) NOT NULL DEFAULT '1',
  `owner` tinyint(4) NOT NULL DEFAULT '0',
  `privilege` int(11) NOT NULL,
  `login` tinyint(1) NOT NULL DEFAULT '1',
  `new_sale_puplic` tinyint(1) NOT NULL DEFAULT '1',
  `new_sale_quick` tinyint(1) NOT NULL DEFAULT '1',
  `new_sale_disc` tinyint(1) NOT NULL DEFAULT '1',
  `return_sales_insert` tinyint(1) NOT NULL DEFAULT '1',
  `pay_sales` tinyint(1) NOT NULL DEFAULT '1',
  `incoming_bill` tinyint(1) NOT NULL DEFAULT '1',
  `incoming_bill_return` tinyint(1) NOT NULL DEFAULT '1',
  `incoming_show` tinyint(1) NOT NULL DEFAULT '1',
  `show_supplier` tinyint(1) NOT NULL DEFAULT '1',
  `new_supplier` tinyint(1) NOT NULL DEFAULT '1',
  `new_items` tinyint(1) NOT NULL DEFAULT '1',
  `show_items` tinyint(1) NOT NULL DEFAULT '1',
  `show_min` tinyint(1) NOT NULL DEFAULT '1',
  `show_bolla` tinyint(1) NOT NULL DEFAULT '1',
  `users` tinyint(1) NOT NULL DEFAULT '1',
  `setting` tinyint(1) NOT NULL DEFAULT '1',
  `show_clients` tinyint(1) NOT NULL DEFAULT '1',
  `change_date` tinyint(1) NOT NULL DEFAULT '1',
  `unites` tinyint(1) NOT NULL DEFAULT '1',
  `data` tinyint(1) NOT NULL DEFAULT '1',
  `add_user` int(11) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_user` int(11) DEFAULT NULL,
  `edit_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `edit_items` tinyint(1) NOT NULL,
  `show_day_total` tinyint(1) NOT NULL DEFAULT '1',
  `spending` tinyint(1) NOT NULL DEFAULT '1',
  `show_report` tinyint(1) NOT NULL DEFAULT '1',
  `sale_discount` tinyint(1) NOT NULL DEFAULT '1',
  `sale_cash` tinyint(1) NOT NULL DEFAULT '1',
  `db_name` varchar(255) NOT NULL DEFAULT 'shoes_test',
  `us_name` varchar(255) NOT NULL,
  `dbpassword` varchar(255) NOT NULL,
  `host_server` varchar(255) NOT NULL DEFAULT 'localhost'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `online_sales`
--

INSERT INTO `online_sales` (`id`, `user_name`, `password`, `name`, `sale_point`, `owner`, `privilege`, `login`, `new_sale_puplic`, `new_sale_quick`, `new_sale_disc`, `return_sales_insert`, `pay_sales`, `incoming_bill`, `incoming_bill_return`, `incoming_show`, `show_supplier`, `new_supplier`, `new_items`, `show_items`, `show_min`, `show_bolla`, `users`, `setting`, `show_clients`, `change_date`, `unites`, `data`, `add_user`, `add_date`, `edit_user`, `edit_date`, `edit_items`, `show_day_total`, `spending`, `show_report`, `sale_discount`, `sale_cash`, `db_name`, `us_name`, `dbpassword`, `host_server`) VALUES
(1, 'demo', '202cb962ac59075b964b07152d234b70', 'Demo', 19, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2013-11-27 16:24:15', 1, '0000-00-00 00:00:00', 1, 1, 1, 1, 1, 1, 'badrsyst_sales2', 'badrsyst_sal2514', 'I{@9$DR9$@gq', 'localhost'),
(2, 'demo2', '202cb962ac59075b964b07152d234b70', 'demo22', 19, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2013-11-29 07:07:08', 1, '0000-00-00 00:00:00', 1, 1, 1, 1, 1, 1, 'badrsyst_sales2', 'badrsyst_sal2514', 'I{@9$DR9$@gq', 'localhost');

-- --------------------------------------------------------

--
-- Table structure for table `participations`
--

CREATE TABLE `participations` (
  `id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `subscribtion_start` date DEFAULT NULL,
  `subscribtion_end` date DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `payment_method` enum('electronic','bank') DEFAULT NULL,
  `epay_request` text,
  `epay_response` text,
  `image` varchar(255) DEFAULT NULL,
  `safe` varchar(255) DEFAULT NULL,
  `note` text,
  `created_by` int(11) DEFAULT NULL,
  `service_update` tinyint(1) DEFAULT NULL,
  `service_support` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_ids`
--

CREATE TABLE `player_ids` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `player_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `player_ids`
--

INSERT INTO `player_ids` (`id`, `client_id`, `player_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2021-09-26 11:28:58', '2021-09-26 11:28:58'),
(2, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2021-09-29 11:12:30', '2021-09-29 11:12:30'),
(3, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2021-09-29 12:02:35', '2021-09-29 12:02:35'),
(4, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2021-09-30 10:15:29', '2021-09-30 10:15:29'),
(5, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2021-09-30 11:03:09', '2021-09-30 11:03:09'),
(6, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2021-10-02 10:30:34', '2021-10-02 10:30:34'),
(7, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2021-10-03 10:24:41', '2021-10-03 10:24:41'),
(8, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2021-10-03 10:29:19', '2021-10-03 10:29:19'),
(9, 4, '556456456', '2021-10-03 10:31:43', '2021-10-03 10:31:43'),
(10, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2021-10-04 15:11:54', '2021-10-04 15:11:54'),
(11, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2021-10-05 12:49:22', '2021-10-05 12:49:22'),
(12, 4, '556456456', '2021-12-20 15:29:39', '2021-12-20 15:29:39'),
(13, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-03-27 09:58:37', '2022-03-27 09:58:37'),
(14, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-03-28 03:11:49', '2022-03-28 03:11:49'),
(15, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-03-28 03:18:37', '2022-03-28 03:18:37'),
(16, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-03-28 05:50:30', '2022-03-28 05:50:30'),
(17, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-03-29 03:12:00', '2022-03-29 03:12:00'),
(18, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-03-30 09:26:38', '2022-03-30 09:26:38'),
(19, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-04-06 07:42:37', '2022-04-06 07:42:37'),
(20, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-04-06 07:47:59', '2022-04-06 07:47:59'),
(21, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-04-06 07:49:11', '2022-04-06 07:49:11'),
(22, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-04-06 07:57:29', '2022-04-06 07:57:29'),
(23, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-04-06 08:03:51', '2022-04-06 08:03:51'),
(24, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-04-06 08:04:03', '2022-04-06 08:04:03'),
(25, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-04-06 08:04:16', '2022-04-06 08:04:16'),
(26, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-04-06 08:17:57', '2022-04-06 08:17:57'),
(27, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-04-06 08:36:20', '2022-04-06 08:36:20'),
(28, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-04-06 08:58:51', '2022-04-06 08:58:51'),
(29, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-04-07 02:44:20', '2022-04-07 02:44:20'),
(30, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-04-07 06:47:51', '2022-04-07 06:47:51'),
(31, 1, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU', '2022-05-26 07:44:45', '2022-05-26 07:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_price`) VALUES
(1, 'بدر للمبيعات اليومية - الخطة المخفضه', 1200),
(2, 'بدر للمبيعات اليومية - الخطة الأساسية ', 1500),
(3, 'بدر للمبيعات - اون لاين مجانى', 315),
(4, 'بدر للصيدليات', 1400),
(5, 'بدر للصيانة', 0),
(6, 'بدر للمبيعات - الخطة الشاملة', 4000),
(7, 'بدر للمبيعات - اون لاين 2', 700),
(8, 'بدر للمبيعات - اون لاين 3', 1190),
(9, 'بدر للمبيعات - اون لاين 4', 1590),
(10, 'بدر للمبيعات - اون لاين 5', 2800),
(11, 'برنامج بدر لمراكز الصيانة', 1500);

-- --------------------------------------------------------

--
-- Table structure for table `products2`
--

CREATE TABLE `products2` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `info` text COLLATE utf8_unicode_ci NOT NULL,
  `country_price_flag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `renew` tinyint(4) NOT NULL DEFAULT '0',
  `percent` double NOT NULL DEFAULT '0',
  `users_num` int(11) NOT NULL DEFAULT '0',
  `stores_num` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products2`
--

INSERT INTO `products2` (`id`, `name`, `info`, `country_price_flag`, `renew`, `percent`, `users_num`, `stores_num`) VALUES
(1, 'منتج 1', 'بدر للمبيعات اليومية - الخطة المخفضه', '180422115746', 2, 0, 0, 0),
(2, 'منتج 2', 'بدر للمبيعات اليومية - الخطة الأساسية 2', '180422115905', 2, 0, 0, 0),
(3, 'حجز نطاقات', 'حجز اسماء المواقع', '180718043043', 1, 0, 0, 0),
(4, 'بدر للمبيعات اون لاين', 'بدر للمبيعات اون لاين', '180723103515', 2, 0, 0, 0),
(5, 'مشروعات مخصوصه', 'ويب سايت او تطبيق اندرويد او ايفون او كل ما سبق', '181212103036', 0, 0, 0, 0),
(6, 'الاستضافات الخارجيه على السيرفرات', 'استضافات لعملاء على الاستضافات الخاصه بالسيرفرات الخاصه بالشركه', '190615104709', 1, 0, 1, 0),
(7, 'الدعم الفني', 'دعم فني لبرنامج البدر للمبيعات', '190615105421', 2, 0, 0, 0),
(8, 'البدر للمبيعات اوف لاين', 'البدر للمبيعات اوف لاين', '190916072701', 2, 0, 0, 0),
(9, 'نسخه اوف لاين -بدون دعم فنى', 'نسخه برنامج اوف لاين للبدر للمبيعات بدون اشتراك بالدعم الفنى الاون لاين', '200813115311', 2, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_country_price`
--

CREATE TABLE `products_country_price` (
  `id` int(11) NOT NULL,
  `country_price_flag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` int(11) NOT NULL,
  `price` double NOT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_country_price`
--

INSERT INTO `products_country_price` (`id`, `country_price_flag`, `country`, `price`, `currency`) VALUES
(13, '180422115746', 0, 399, 'دولار'),
(12, '180422115746', 63, 2200, 'جنيه'),
(16, '180422115905', 63, 2200, 'جنيه'),
(15, '180422115905', 0, 399, 'دولار'),
(14, '180422115905', 187, 2200, 'ريال'),
(8, '180718043043', 0, 13, '$'),
(18, '180723103515', 0, 15, '$'),
(22, '181212103036', 63, 0, 'جنيه'),
(17, '190615104709', 63, 0, 'جنيه'),
(19, '190615105421', 0, 0, 'دولار'),
(20, '190615105421', 63, 0, 'جنيه'),
(21, '190615105421', 187, 0, 'ريال سعودي'),
(23, '181212103036', 187, 0, 'ريال سعودي'),
(24, '181212103036', 0, 0, 'دولار'),
(30, '190916072701', 0, 700, 'د  ولار'),
(29, '190916072701', 187, 2200, 'ريال'),
(28, '190916072701', 63, 2200, 'جنيه'),
(32, '200813115311', 187, 1800, 'ريال'),
(33, '200813115311', 63, 2100, 'جنيه');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `client_id` int(11) NOT NULL,
  `start_at` date DEFAULT NULL,
  `end_at` date DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `all_money` double NOT NULL DEFAULT '0',
  `cash` double NOT NULL DEFAULT '0',
  `rest` double NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `client_id`, `start_at`, `end_at`, `currency_code`, `all_money`, `cash`, `rest`) VALUES
(1, 'تست', 'تست', 9379, '2018-12-12', '2019-10-12', 'EGP', 25000, 10000, 15000),
(2, 'user', '9380', 9380, '2018-08-10', '2019-03-15', 'SAR', 5000, 1250, 3750);

-- --------------------------------------------------------

--
-- Table structure for table `projects_register`
--

CREATE TABLE `projects_register` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text NOT NULL,
  `money` double NOT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `notes` text NOT NULL,
  `safe_id` int(11) NOT NULL,
  `transaction_flag` varchar(255) NOT NULL,
  `add_user` varchar(255) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_user` varchar(255) NOT NULL,
  `last_update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects_register`
--

INSERT INTO `projects_register` (`id`, `project_id`, `date`, `description`, `money`, `currency_code`, `notes`, `safe_id`, `transaction_flag`, `add_user`, `add_date`, `last_update_user`, `last_update_date`) VALUES
(1, 1, '2018-12-12', 'المرحلة الثانيه للمشروع', 5000, 'EGP', 'لا يوجد', 1, '12122018062834', 'ahmadelrefayee', '2018-12-12 22:28:34', 'ahmadelrefayee', '2018-12-12 22:28:51'),
(2, 2, '2018-12-12', 'دفع بعدتسليم التصميم', 1250, 'SAR', 'تم الدفع', 1, '12122018063505', 'ahmadelrefayee', '2018-12-12 22:35:05', 'ahmadelrefayee', '2018-12-12 22:35:05'),
(3, 1, '2018-12-19', 'ونةةمن', 1000, 'DZD', 'نمنخنتمن', 1, '19122018025615', 'ahmadelrefayee', '2018-12-19 18:56:15', 'ahmadelrefayee', '2018-12-19 18:56:15'),
(4, 1, '2018-12-19', 'تست', 1500, 'SAR', 'تست', 8, '19122018025940', 'ahmadelrefayee', '2018-12-19 18:59:40', 'ahmadelrefayee', '2018-12-19 18:59:40');

-- --------------------------------------------------------

--
-- Table structure for table `safes`
--

CREATE TABLE `safes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `balance` double NOT NULL,
  `initial_balance` double NOT NULL,
  `country` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `safes`
--

INSERT INTO `safes` (`id`, `name`, `balance`, `initial_balance`, `country`) VALUES
(1, 'safe1', 28708.05, 10000, 63),
(2, 'safe2', 14167, 10000, 63),
(3, 'حسابات مؤسسة كوابل  بجدة (أ سامى)', 24433.08, 0, 187),
(4, 'حسابات مؤسسة بانورما القصيم', 1528, 0, 187),
(5, 'حساب البنك الاهلى المصرى', 1220, 0, 63),
(6, 'حساب ال PayPal', -40.4, 0, 227),
(7, 'تست', 89.86, 0, 63),
(8, 'تست2', -12465.09, 0, 63),
(9, 'بدايه يوم 15/6فودافون كاش', 18938.5, 0, 63),
(10, 'بدايه يوم 15/6 حساب كوابل هوست جده', 945, 0, 187),
(11, 'بدايه يوم 15/6 رصيد النقديه للدرج اليومي', 500, 0, 63),
(12, 'بدايه يوم 15/6 حساب فرع الاحساء', 32498.25, 0, 187),
(13, 'بدايه يوم 15/6 حساب البنك الاهلي', 1210, 0, 63),
(14, 'بدايه يوم 15/6 حساب بنك الاسكندرية', 0, 0, 63),
(15, 'بدايه يوم 15/6 حساب باي بال', 45, 0, 227),
(16, 'بدايه يوم 15/6 حساب الفيزا', 0, 0, 63),
(17, 'خزينة تحويل دولار', 0, 0, 227),
(18, 'خزينة تحويل بالجنيه', 4740, 0, 63),
(19, 'ارصده حره', 35030.96107105, 0, 63),
(20, 'ارصده حره ريال', 2166, 0, 187),
(21, 'الرياض(احمد كساب)', 16927, 0, 187),
(22, 'تحويلات خاصه ( الاحساء )', 28821.9, 0, 187);

-- --------------------------------------------------------

--
-- Table structure for table `safe_transaction`
--

CREATE TABLE `safe_transaction` (
  `id` int(11) NOT NULL,
  `safe_id` int(11) NOT NULL,
  `op_flag` tinyint(4) NOT NULL,
  `transaction_flag` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `revenue` double NOT NULL,
  `expense` double NOT NULL,
  `balance` double NOT NULL,
  `description` text NOT NULL,
  `user` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user1_id` int(10) UNSIGNED NOT NULL,
  `user2_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `smsclients`
--

CREATE TABLE `smsclients` (
  `shop_id` int(11) NOT NULL,
  `SMSPass` varchar(255) NOT NULL,
  `SMSCount` int(11) NOT NULL DEFAULT '0',
  `SMSPakgeID` int(11) NOT NULL,
  `SMSStartDate` date NOT NULL,
  `SMSEndDate` date NOT NULL,
  `SMSTitle` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smsclients`
--

INSERT INTO `smsclients` (`shop_id`, `SMSPass`, `SMSCount`, `SMSPakgeID`, `SMSStartDate`, `SMSEndDate`, `SMSTitle`) VALUES
(48, '1722973ok', 2000, 2, '2017-01-19', '2018-04-30', 'Albadr'),
(3970, 'f502-60d6', 2000, 2, '2017-01-19', '2018-01-20', 'cablshop');

-- --------------------------------------------------------

--
-- Table structure for table `sms_package`
--

CREATE TABLE `sms_package` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_package`
--

INSERT INTO `sms_package` (`id`, `name`, `count`) VALUES
(1, 'الباقة 200', 200),
(2, 'الباقة 2000', 2000),
(3, 'الباقة 1000', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `sms_setting`
--

CREATE TABLE `sms_setting` (
  `id` int(11) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_setting`
--

INSERT INTO `sms_setting` (`id`, `country_code`, `username`, `password`, `link`) VALUES
(1, '187', 'albadr', '1722973ok', 'http://apps.gateway.sa/vendorsms/pushsms.aspx');

-- --------------------------------------------------------

--
-- Table structure for table `sms_status`
--

CREATE TABLE `sms_status` (
  `id` int(11) NOT NULL,
  `code` varchar(11) NOT NULL,
  `ar_message` varchar(255) NOT NULL,
  `en_message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_status`
--

INSERT INTO `sms_status` (`id`, `code`, `ar_message`, `en_message`) VALUES
(1, '000', 'تم الإرسال بنجاح', 'Received successfully'),
(2, '101', 'البيانات غير مكتملة', 'incomplete data'),
(3, '102', 'راجع الدعم الفنى كود المشكلة  102', 'call Support team Problem code 102'),
(4, '103', 'راجع الدعم الفنى كود المشكلة  103', 'call Support team Problem code 103'),
(5, '106', 'تواصل مع الدعم الفنى لتأكيد أسم المرسل ', 'Call technical support to confirm the sender name'),
(6, '108', 'رقم المرسل إليه غير صحيح', 'ther aren\'t valid numbers to send');

-- --------------------------------------------------------

--
-- Table structure for table `technical_support`
--

CREATE TABLE `technical_support` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `t_s_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 => problem     1=>duration',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `safe_id` int(11) DEFAULT NULL,
  `currency_name` varchar(100) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `pay_way` tinyint(4) DEFAULT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_user` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `technical_support`
--

INSERT INTO `technical_support` (`id`, `client_id`, `t_s_type`, `start_date`, `end_date`, `safe_id`, `currency_name`, `amount`, `pay_way`, `add_date`, `add_user`) VALUES
(1, 2, 0, '2019-09-19 03:00:00', NULL, 7, 'جنيه', 50, 1, '2019-09-19 12:27:02', 7),
(2, 2, 1, '2019-09-19 03:00:00', '2019-09-30 03:00:00', 7, 'جنيه', 50, 1, '2019-09-19 12:27:19', 7),
(3, 7562, 1, '2019-12-25 20:00:00', '2019-12-25 20:00:00', 3, 'ريال', 300, 2, '2019-12-26 12:13:23', 7),
(4, 7562, 1, '2019-12-25 20:00:00', '2020-12-25 20:00:00', 3, 'ريال', 300, 2, '2019-12-26 12:33:37', 7),
(5, 7321, 0, '2020-07-01 20:00:00', NULL, 22, 'ريال', 50, 2, '2020-07-02 11:24:55', 7),
(6, 10794, 1, '2020-07-25 20:00:00', '2021-07-25 20:00:00', 22, 'ريال', 450, 2, '2020-07-26 05:28:03', 54),
(7, 4883, 0, '2020-08-03 20:00:00', NULL, 22, 'ريال', 75, 2, '2020-08-06 04:16:02', 54),
(8, 6427, 0, '2020-09-05 20:00:00', NULL, 22, 'ريال', 75, 2, '2020-09-06 08:33:36', 7),
(9, 6427, 1, '2020-09-05 20:00:00', '2020-09-05 20:00:00', 22, 'ريال', 300, 2, '2020-09-06 08:33:50', 7),
(10, 63, 1, '2021-01-19 20:00:00', '2021-01-19 20:00:00', 9, 'جنيه', 600, 2, '2021-01-26 12:01:40', 7),
(11, 13322, 0, '2021-05-21 20:00:00', NULL, 1, 'جنيه', 100, 3, '2021-06-09 09:38:25', 7);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `m_notes` text NOT NULL,
  `mail_send` tinyint(4) NOT NULL,
  `powers` tinyint(4) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL,
  `user2` int(11) NOT NULL DEFAULT '0',
  `client_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `m_notes` text NOT NULL,
  `mail_send` tinyint(4) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `update_clients`
--

CREATE TABLE `update_clients` (
  `id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `update_status` int(11) DEFAULT NULL,
  `update_log` text,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `update_version`
--

CREATE TABLE `update_version` (
  `id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `folder_name` text,
  `file_path` text,
  `review_status` int(11) DEFAULT NULL,
  `uploader` int(11) DEFAULT NULL,
  `tester` int(11) DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `notes` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `userr`
--

CREATE TABLE `userr` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `job` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pass` text COLLATE utf8_unicode_ci NOT NULL,
  `img` text COLLATE utf8_unicode_ci NOT NULL,
  `prev` text COLLATE utf8_unicode_ci NOT NULL,
  `agent` int(11) NOT NULL DEFAULT '0',
  `marketing_type` tinyint(4) NOT NULL DEFAULT '0',
  `activation` tinyint(4) NOT NULL DEFAULT '1',
  `U` bigint(20) NOT NULL,
  `player_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userr`
--

INSERT INTO `userr` (`id`, `name`, `job`, `Email`, `pass`, `img`, `prev`, `agent`, `marketing_type`, `activation`, `U`, `player_id`) VALUES
(1, 'محمود الزيادى', 'المدير العام', 'info@badrsystems.com', '202cb962ac59075b964b07152d234b70', '../img/1.jpg', 'مدير عام', 0, 0, 1, 12345, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(2, 'صالح الغبارى', 'خدمة عملاء ومحاسب', 'a@a.com', 'SkMyM2NuWGFOZHcwQ0MwOHphYmZHQT09', '../img/1.jpg', 'مدير عام', 0, 0, 1, 4154, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(3, 'اختبار 2', 'مختبر 2', 's@s.com', 'MWxZd3VaQ2R0ZVNuWUtiVDNtSFVmdz09', '../img/1.jpg', 'تسويق', 2, 0, 0, 3713, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(4, 'حسن سويدان', 'مسوق', 'hassan_mohammed32@yahoo.com', 'b1VOYzNHT3pMdlpsWmVvWStuVVhyZz09', '../img/1.jpg', 'تسويق', 3, 0, 1, 2499, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(5, 'شيماء', 'مسؤل خدمة العملاء', 'shima@badrsystems.com', 'UVdWbEd3bTJmR3p4RVA4N3NlUURRQT09', '../img/1.jpg', 'تسويق', 8, 0, 1, 5950, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(6, 'سماح', 'تسويق', 'samah@badrsystems.com', 'KzVWV2loRFZRQ3dsOUplWEZNc2ZuZz09', '../img/1.jpg', 'تسويق', 10, 0, 1, 7112, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(7, 'ahmadelrefayee', 'محاسب', 'ahmad@ahmad.com', 'Mk9Qc0JsRWRCd3A2aTlqcmExdTlTQT09', '../img/1.jpg', 'مدير عام', 0, 0, 1, 3281, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(10, 'حساب اختبار', 'حساب اختبار تسويق', 'test@badrsystems.com', 'dXVkR2NCRW80dkR1ekhYSlVEV1NyUT09', '../img/1.jpg', 'تسويق', 5, 0, 1, 3749, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(12, 'sale', 'مسوق', 's@s.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/1.jpg', 'تسويق', 5, 0, 0, 6471, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(14, 'ahmad', 'مسوق', 'ahmad@ahmad1.com', 'Mk9Qc0JsRWRCd3A2aTlqcmExdTlTQT09', '../img/1.jpg', 'تسويق', 9, 0, 1, 2034, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(15, 'hazem14', 'مسوق', 'ahmad@ahmad2.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/1.jpg', 'تسويق', 7, 0, 1, 5725, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(17, 'hazem14', 'وكيل', 'hazem14@ahmad.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/1.jpg', 'خدمة العملاء', 0, 0, 1, 6634, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(18, 'sami@cable.sa', 'شركة كابل هوست', 'sami@cable.sa', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/uploads/6030-09-09-18-Badr.png', 'تسويق', 4, 0, 1, 2078, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(19, 'أشيماء', 'دعم فنى', 'sm592493@gmail.com', 'UVdWbEd3bTJmR3p4RVA4N3NlUURRQT09', '../img/1.jpg', 'خدمة العملاء', 0, 0, 1, 1226, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(20, 'ضحى العدوى عقيل', 'تسويق إلكترونى', 'dohaaqeel@hotmail.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'تسويق', 11, 0, 1, 3193, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(21, 'أ/ وفاء - سوريا', 'توسيق إلكترونى', 'm.wafaa@outlook.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'تسويق', 12, 0, 1, 1988, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(22, 'نجوي محمد اشرف', 'تسويق', 'neven.m.ashraf@gmail.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'تسويق', 13, 0, 1, 4375, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(23, 'محمد ابراهيم الفقى', 'تسويق', 'Figo.elfky58@yahoo.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'تسويق', 14, 0, 1, 2654, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(28, 'عبدالله علاء احمد عبد النبي العشري', 'تسويق إلكترونى', 'abdallahala.elashrey@yahoo.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'تسويق', 19, 0, 1, 6144, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(27, 'هشام ربيع عبد السميع ابويوسف', 'تسويق إلكترونى', 'salahhesham160@gmail.com', 'L25kRXY5V2k2eWh4YXVYd1RTNjM0QT09', '../img/1.jpg', 'تسويق', 18, 0, 1, 827, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(29, 'شركة أبداع تك - م عبد الله فاروق مجود', 'تسويق إلكترونى', 'ipda3.tech@gmail.com', 'YkU2ZDgzaGtSQlVpQVNGYmk5MkRvdz09', '../img/uploads/1158-14-09-18-Badr.png', 'تسويق', 20, 0, 1, 8396, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(30, 'alaa abdalmonem alsawy', 'تسويق إلكترونى', 'alaa-a-s-m@hotmail.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'تسويق', 21, 0, 1, 2003, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(31, 'محمد رمضان عبدريه', 'تسويق إلكترونى', 'mohammed.abdrabou@hotmail.com', '202cb962ac59075b964b07152d234b70', '../img/1.jpg', 'تسويق', 22, 0, 1, 42, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(32, 'الامير صلاح', 'تسويق إلكترونى', 'Amirsalah648@gmail.com', 'ckdnaVVWYVg1VnorQUJ3KzVFZDNjUT09', '../img/1.jpg', 'تسويق', 23, 0, 1, 9482, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(33, 'مصطفى العشماوي الجنايني', 'تسويق إلكترونى', 'disha.gensh@gmail.com', 'enArSzlRVXFlQnY0RlEvbE0yekxiZz09', '../img/1.jpg', 'تسويق', 24, 0, 1, 3022, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(34, 'محمد ابو عتمان', 'تسويق إلكترونى', 'elhabbed@gmail.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/1.jpg', 'تسويق', 25, 0, 1, 7770, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(35, 'محمد أبو عتمان -دعم فنى', 'دعم فنى', 'elhabbed@badrsystems.com', 'bkVyVzROQU1PNkliMzFZaW84U04yZz09', '../img/1.jpg', 'مدير خدمة العملاء', 0, 0, 1, 1494, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(36, 'أ/ سماح كساب', 'خدمة عملاء', 'samah2@badrsystems.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'خدمة العملاء', 0, 0, 1, 246, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(37, 'رباب محمد عبد الحميد محمد', 'تسويق إلكترونى', 'Rabab7247@gmail.com', 'YWtQUmRodENaNEFJV3B6VXlkVDZHdz09', '../img/1.jpg', 'تسويق', 26, 0, 1, 7304, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(38, 'كريم الحلو', 'تسويق إلكترونى', 'kareem@badrsystems.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'تسويق', 27, 0, 1, 4679, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(39, 'كريم الحلو - دعم فنى', 'دعم فنى وخدمه عملاء', 'kareem2@badrsystems.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'خدمة العملاء', 0, 0, 1, 3698, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(40, 'سمر زكريا محمد', 'تسويق إلكترونى', 's_beldad@hotmail.com', 'c0ZKRDdUamtEZUdhaisyOUhROFgxUT09', '../img/1.jpg', 'تسويق', 28, 0, 1, 374, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(41, 'مروة احمد محمد', 'تسويق إلكترونى', 'maroamohmad076@gmail.com', 'WEZaWmd3bHBLR2h1UzRGZUFUbnMvUT09', '../img/1.jpg', 'تسويق', 29, 0, 1, 9316, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(42, 'مي وليد ياسين السيد', 'تسويق إلكترونى', 'nemor1252@gmail.com', 'Vld2aDc1R0lza3owV3BuZHYxaXlRZz09', '../img/1.jpg', 'تسويق', 30, 0, 1, 9091, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(43, 'ابراهيم فيصل الحمدو', 'تسويق إلكترونى', 'ibraheemalhamdo1994@gmail.com', 'UmRPMStGZ1hHVHV1Tk1CN20vaGU2Zz09', '../img/1.jpg', 'تسويق', 31, 0, 1, 1002, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(44, 'رانيا على خضر مالك', 'تسويق إلكترونى', 'RANIAALISUDAN94@gmail.com', 'M0IvOFlnajRiK2dub3gwTFM3cFFMZz09', '../img/1.jpg', 'تسويق', 32, 0, 1, 6185, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(45, 'Mohamed Fawzy - DM Manager', 'تسويق إلكترونى', 'clickfirm@yahoo.com', 'N1d3YzRPeXRjWGdGMzJxUXplbU13dz09', '../img/1.jpg', 'مدير عام', 0, 0, 1, 5042, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(46, 'Aya ali', 'تسويق إلكترونى', 's_beldad@hotmail.com', 'ZE51M2V6QnJxNW5LZjZ4dlF5V3oyUT09', '../img/1.jpg', 'تسويق', 34, 0, 1, 1393, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(47, 'عادل قطب', 'تسويق إلكترونى', 'Mohamedsayedelhadad@yahoo.com', 'dmF0VzBCRnJzcnI3VXBGZWNBSndJZz09', '../img/1.jpg', 'تسويق', 35, 0, 1, 2217, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(55, 'أ حسام', 'مبيعات', 'Elfadel2005@gmail.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'خدمة العملاء', 0, 0, 1, 8360, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(52, 'أحمد عباس', 'مسؤل مبيعات', 'ahmedabas@albadrsystems.com', 'bjJWZzB4RkRkbUtWOE9HOFYzUTdXQT09', '../img/1.jpg', 'مدير عام', 0, 0, 1, 3158, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(51, 'أحمد صلاح', 'مبيعات', 'a7mdsalah88@gmail.com', 'ZmhvSW80QzR1Q1hOZEYyZXhpbXNNZz09', '../img/1.jpg', 'مدير عام', 0, 0, 1, 4345, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(54, 'محمد أشرف', 'خدمه عملاء', 'men@yahoo.com', 'S2JnWXJ5NTIyM1JGdkVJbXJoNFdGY3MyL1ByUnB6OERUdnAybHBIWXAzQT0=', '../img/1.jpg', 'خدمة العملاء', 0, 0, 0, 944, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(56, 'أحمد صلاح - الشركة', 'تسويق إلكترونى', 'a7mdsalah88@yahoo.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'تسويق', 37, 0, 1, 5720, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(58, 'arafat', 'مدير المشروعات', 'mahmoudarafat33@gmail.com', 'ZU9UVEd2c2NLbGVmYVhrQmdaNWhzdz09', '../img/uploads/8606-23-02-21-Badr.png', 'مدير عام', 0, 0, 1, 8222, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(59, 'محمد على الرفاعي', 'مسئول مبيعات', 'mohamed@mohamed.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/1.jpg', 'خدمة العملاء', 0, 0, 0, 9254, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(61, 'نورهان طلخان - شركة البدر', 'تسويق إلكترونى', 'nourhan.reda2021@gmail.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/1.jpg', 'تسويق', 38, 0, 1, 1645, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(62, 'إلهام راشد -شركة البدر', 'تسويق إلكترونى', 'albadr.eg77@gmail.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'تسويق', 39, 0, 1, 460, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(63, 'على الشرقاوى - شركة البدر', 'تسويق إلكترونى', 'alielsharkawy009@gmail.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/uploads/9287-16-01-20-Badr.jpg', 'تسويق', 40, 0, 1, 2255, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(64, 'إيهاب عبد العال - شركة البدر', 'تسويق إلكترونى', 'albadrsells@gmail.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'تسويق', 41, 0, 1, 4049, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(65, 'محمد فاضل', 'تسويق إلكترونى', 'capmohammadfadel@gmail.com', 'em5jK2xpdjhQOUxTbSs1dlV4RTkxQT09', '../img/1.jpg', 'خدمة العملاء', 0, 0, 1, 3660, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(66, 'ماجد - شركة البدر', 'تسويق إلكترونى', 'majedmoneir221@gmail.com', 'Y2t5Rk5KZ1A1MUNCUWZaclFHcmJYdz09', '../img/1.jpg', 'تسويق', 43, 0, 1, 5748, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(81, 'سيد ذكى', 'تسويق إلكترونى', 's.zaki9899@gmail.com', 'SHlITzFzeDRTZlV1RUpCR1VZUVV0UmE0T3FndUtHTkdSMmlhV1FuOTVrdz0=', '../img/1.jpg', 'تسويق', 53, 0, 1, 7165, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(67, 'ahmd kasap', 'تسويق إلكترونى', 'Ahmedkassap1147@gmail.com', 'NE1NTVo1bjBZQXg4N2ZUVU51TlNVdz09', '../img/1.jpg', 'تسويق', 44, 0, 1, 4217, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(68, 'ahmd kasap', 'مسوق ومبيعات', 'Ahmedkassap1147@gmail.com', 'NE1NTVo1bjBZQXg4N2ZUVU51TlNVdz09', '../img/1.jpg', 'تسويق', 44, 0, 1, 6517, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(69, 'سهى- المنطقه الشرقية', 'تسويق إلكترونى', 'soso.n.d987@gmail.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/1.jpg', 'تسويق', 45, 0, 1, 2428, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(70, 'سهى', 'تسويق بنسبة', 'soso.n.d987@gmail.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/1.jpg', 'تسويق', 45, 1, 1, 1862, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(71, 'ساهر', 'تسويق إلكترونى', 'saherfouda@gmail.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/1.jpg', 'تسويق', 46, 0, 1, 2400, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(72, 'ساهر', 'تسويق بنسبة', 'saherfouda@gmail.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/1.jpg', 'تسويق', 46, 1, 1, 5059, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(73, 'احمد صلاح', 'تسويق إلكترونى', 'a7md@salah.com', 'UVdWbEd3bTJmR3p4RVA4N3NlUURRQT09', '../img/1.jpg', 'تسويق', 47, 0, 1, 1460, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(74, 'احمد يحي', 'تسويق إلكترونى', 'ahmedmeahmed2009@gmail.com', 'czlLWW1JTXBlM3hHSi96Wkg0Qk1VQT09', '../img/1.jpg', 'تسويق', 48, 0, 1, 4303, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(75, 'السعيد عطية', 'مبيعات', 'saed@gmail.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/1.jpg', 'تسويق', 48, 0, 1, 8068, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(76, 'ا/ هشام', 'تسويق إلكترونى', 'Alihosh0101@gmail.com', 'ZmhvSW80QzR1Q1hOZEYyZXhpbXNNZz09', '../img/1.jpg', 'تسويق', 49, 0, 1, 7800, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(77, 'الاعلانات الممولة', 'تمويل اعلانات السعودية', 'a7mdsalah1988@gmail.com', 'ZmhvSW80QzR1Q1hOZEYyZXhpbXNNZz09', '../img/1.jpg', 'تسويق', 49, 0, 1, 7856, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(78, 'أ.مصطفى الوكيل', 'تسويق إلكترونى', 'sasaprince2020.me@gmail.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/1.jpg', 'مدير عام', 0, 0, 1, 3712, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(82, 'حسن اسماعيل', 'تسويق إلكترونى', 'hsnadacc@gmail.com', 'R2ZmUjk3eHBEWGdnNzV3SHZMYmJrcmNFY3E2VTFQbkZCRWRtWXd3NUNIYz0=', '../img/1.jpg', 'تسويق', 54, 0, 1, 4078, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(83, 'محمود الأشرم', 'تسويق إلكترونى', 'Ma7moud.mo7amed21@gmail.com', 'YkpRalFTaVo5cUZXNU80cFI5MjhlMmVDeGI3YmllRW14bGx1dWlIMXVlND0=', '../img/1.jpg', 'تسويق', 55, 0, 1, 9828, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(85, 'ا تامر', 'مسؤل دعم فنى', 'tamer@albadrsystems.com', 'aHk2NzFxWjdkeG1hZ2RjTWpOUm1BUT09', '../img/1.jpg', 'خدمة العملاء', 0, 0, 1, 8419, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(86, 'بانورما القصيم 2021', 'تسويق إلكترونى', 'mahmoud.subhy@outlook.com', 'b2VjUEpaNmVleEtCSU9LL3lsY2RpZz09', '../img/1.jpg', 'تسويق', 57, 0, 1, 399, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(87, 'نواف الحربي', 'تسويق إلكترونى', 'noaf55100@gmail.com', 'NE1NTVo1bjBZQXg4N2ZUVU51TlNVdz09', '../img/1.jpg', 'تسويق', 58, 0, 1, 183, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(88, 'عصام باحميد', 'تسويق إلكترونى', '39am.ba@gmail.com', 'NE1NTVo1bjBZQXg4N2ZUVU51TlNVdz09', '../img/1.jpg', 'تسويق', 59, 0, 1, 3701, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(89, 'عبد العزيز باحميد', 'تسويق إلكترونى', 'abdulaziz.bahamid.979@gmail.com', 'NE1NTVo1bjBZQXg4N2ZUVU51TlNVdz09', '../img/1.jpg', 'تسويق', 60, 0, 1, 9576, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(93, 'محمد رجب', 'تسويق إلكترونى', 'moragaboo06@gmail.com', 'Q0lVMTZIczJLZVhPeG9zS0VvRXRLdz09', '../img/1.jpg', 'تسويق', 64, 0, 1, 5810, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU'),
(94, 'test dev', 'test dev', 'admin@admin.com', '202cb962ac59075b964b07152d234b70', '../img/1.jpg', 'test dev', 0, 0, 1, 12345, 'dUhZC3vg-GcjxpzJsMilkT:APA91bEq-9ElbT0bml9RdEcwpq-da-MyiY3S-aZHV5Y_TAXr0wlOAjMRbozGPuPKw07vDvY3R6GZN_xk98kYkUQofBvXpcjEDKydkENKS6BmT0sbSAhY3sYTgBfmfE-Bo_fM9HKSZ5ZU');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`) VALUES
(2, 'admin', '47ad41c7ec8e977816cbec9b02b475b9', 'mahmoud elzaiady'),
(3, 'shima', '202cb962ac59075b964b07152d234b70', 'shima');

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `zone_id` int(10) NOT NULL,
  `country_code` char(2) COLLATE utf8_bin NOT NULL,
  `zone_name` varchar(35) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`zone_id`, `country_code`, `zone_name`) VALUES
(1, 'AD', 'Europe/Andorra'),
(2, 'AE', 'Asia/Dubai'),
(3, 'AF', 'Asia/Kabul'),
(4, 'AG', 'America/Antigua'),
(5, 'AI', 'America/Anguilla'),
(6, 'AL', 'Europe/Tirane'),
(7, 'AM', 'Asia/Yerevan'),
(8, 'AO', 'Africa/Luanda'),
(9, 'AQ', 'Antarctica/McMurdo'),
(10, 'AQ', 'Antarctica/Casey'),
(11, 'AQ', 'Antarctica/Davis'),
(12, 'AQ', 'Antarctica/DumontDUrville'),
(13, 'AQ', 'Antarctica/Mawson'),
(14, 'AQ', 'Antarctica/Palmer'),
(15, 'AQ', 'Antarctica/Rothera'),
(16, 'AQ', 'Antarctica/Syowa'),
(17, 'AQ', 'Antarctica/Troll'),
(18, 'AQ', 'Antarctica/Vostok'),
(19, 'AR', 'America/Argentina/Buenos_Aires'),
(20, 'AR', 'America/Argentina/Cordoba'),
(21, 'AR', 'America/Argentina/Salta'),
(22, 'AR', 'America/Argentina/Jujuy'),
(23, 'AR', 'America/Argentina/Tucuman'),
(24, 'AR', 'America/Argentina/Catamarca'),
(25, 'AR', 'America/Argentina/La_Rioja'),
(26, 'AR', 'America/Argentina/San_Juan'),
(27, 'AR', 'America/Argentina/Mendoza'),
(28, 'AR', 'America/Argentina/San_Luis'),
(29, 'AR', 'America/Argentina/Rio_Gallegos'),
(30, 'AR', 'America/Argentina/Ushuaia'),
(31, 'AS', 'Pacific/Pago_Pago'),
(32, 'AT', 'Europe/Vienna'),
(33, 'AU', 'Australia/Lord_Howe'),
(34, 'AU', 'Antarctica/Macquarie'),
(35, 'AU', 'Australia/Hobart'),
(36, 'AU', 'Australia/Currie'),
(37, 'AU', 'Australia/Melbourne'),
(38, 'AU', 'Australia/Sydney'),
(39, 'AU', 'Australia/Broken_Hill'),
(40, 'AU', 'Australia/Brisbane'),
(41, 'AU', 'Australia/Lindeman'),
(42, 'AU', 'Australia/Adelaide'),
(43, 'AU', 'Australia/Darwin'),
(44, 'AU', 'Australia/Perth'),
(45, 'AU', 'Australia/Eucla'),
(46, 'AW', 'America/Aruba'),
(47, 'AX', 'Europe/Mariehamn'),
(48, 'AZ', 'Asia/Baku'),
(49, 'BA', 'Europe/Sarajevo'),
(50, 'BB', 'America/Barbados'),
(51, 'BD', 'Asia/Dhaka'),
(52, 'BE', 'Europe/Brussels'),
(53, 'BF', 'Africa/Ouagadougou'),
(54, 'BG', 'Europe/Sofia'),
(55, 'BH', 'Asia/Bahrain'),
(56, 'BI', 'Africa/Bujumbura'),
(57, 'BJ', 'Africa/Porto-Novo'),
(58, 'BL', 'America/St_Barthelemy'),
(59, 'BM', 'Atlantic/Bermuda'),
(60, 'BN', 'Asia/Brunei'),
(61, 'BO', 'America/La_Paz'),
(62, 'BQ', 'America/Kralendijk'),
(63, 'BR', 'America/Noronha'),
(64, 'BR', 'America/Belem'),
(65, 'BR', 'America/Fortaleza'),
(66, 'BR', 'America/Recife'),
(67, 'BR', 'America/Araguaina'),
(68, 'BR', 'America/Maceio'),
(69, 'BR', 'America/Bahia'),
(70, 'BR', 'America/Sao_Paulo'),
(71, 'BR', 'America/Campo_Grande'),
(72, 'BR', 'America/Cuiaba'),
(73, 'BR', 'America/Santarem'),
(74, 'BR', 'America/Porto_Velho'),
(75, 'BR', 'America/Boa_Vista'),
(76, 'BR', 'America/Manaus'),
(77, 'BR', 'America/Eirunepe'),
(78, 'BR', 'America/Rio_Branco'),
(79, 'BS', 'America/Nassau'),
(80, 'BT', 'Asia/Thimphu'),
(81, 'BW', 'Africa/Gaborone'),
(82, 'BY', 'Europe/Minsk'),
(83, 'BZ', 'America/Belize'),
(84, 'CA', 'America/St_Johns'),
(85, 'CA', 'America/Halifax'),
(86, 'CA', 'America/Glace_Bay'),
(87, 'CA', 'America/Moncton'),
(88, 'CA', 'America/Goose_Bay'),
(89, 'CA', 'America/Blanc-Sablon'),
(90, 'CA', 'America/Toronto'),
(91, 'CA', 'America/Nipigon'),
(92, 'CA', 'America/Thunder_Bay'),
(93, 'CA', 'America/Iqaluit'),
(94, 'CA', 'America/Pangnirtung'),
(95, 'CA', 'America/Atikokan'),
(96, 'CA', 'America/Winnipeg'),
(97, 'CA', 'America/Rainy_River'),
(98, 'CA', 'America/Resolute'),
(99, 'CA', 'America/Rankin_Inlet'),
(100, 'CA', 'America/Regina'),
(101, 'CA', 'America/Swift_Current'),
(102, 'CA', 'America/Edmonton'),
(103, 'CA', 'America/Cambridge_Bay'),
(104, 'CA', 'America/Yellowknife'),
(105, 'CA', 'America/Inuvik'),
(106, 'CA', 'America/Creston'),
(107, 'CA', 'America/Dawson_Creek'),
(108, 'CA', 'America/Fort_Nelson'),
(109, 'CA', 'America/Vancouver'),
(110, 'CA', 'America/Whitehorse'),
(111, 'CA', 'America/Dawson'),
(112, 'CC', 'Indian/Cocos'),
(113, 'CD', 'Africa/Kinshasa'),
(114, 'CD', 'Africa/Lubumbashi'),
(115, 'CF', 'Africa/Bangui'),
(116, 'CG', 'Africa/Brazzaville'),
(117, 'CH', 'Europe/Zurich'),
(118, 'CI', 'Africa/Abidjan'),
(119, 'CK', 'Pacific/Rarotonga'),
(120, 'CL', 'America/Santiago'),
(121, 'CL', 'Pacific/Easter'),
(122, 'CM', 'Africa/Douala'),
(123, 'CN', 'Asia/Shanghai'),
(124, 'CN', 'Asia/Urumqi'),
(125, 'CO', 'America/Bogota'),
(126, 'CR', 'America/Costa_Rica'),
(127, 'CU', 'America/Havana'),
(128, 'CV', 'Atlantic/Cape_Verde'),
(129, 'CW', 'America/Curacao'),
(130, 'CX', 'Indian/Christmas'),
(131, 'CY', 'Asia/Nicosia'),
(132, 'CZ', 'Europe/Prague'),
(133, 'DE', 'Europe/Berlin'),
(134, 'DE', 'Europe/Busingen'),
(135, 'DJ', 'Africa/Djibouti'),
(136, 'DK', 'Europe/Copenhagen'),
(137, 'DM', 'America/Dominica'),
(138, 'DO', 'America/Santo_Domingo'),
(139, 'DZ', 'Africa/Algiers'),
(140, 'EC', 'America/Guayaquil'),
(141, 'EC', 'Pacific/Galapagos'),
(142, 'EE', 'Europe/Tallinn'),
(143, 'EG', 'Africa/Cairo'),
(144, 'EH', 'Africa/El_Aaiun'),
(145, 'ER', 'Africa/Asmara'),
(146, 'ES', 'Europe/Madrid'),
(147, 'ES', 'Africa/Ceuta'),
(148, 'ES', 'Atlantic/Canary'),
(149, 'ET', 'Africa/Addis_Ababa'),
(150, 'FI', 'Europe/Helsinki'),
(151, 'FJ', 'Pacific/Fiji'),
(152, 'FK', 'Atlantic/Stanley'),
(153, 'FM', 'Pacific/Chuuk'),
(154, 'FM', 'Pacific/Pohnpei'),
(155, 'FM', 'Pacific/Kosrae'),
(156, 'FO', 'Atlantic/Faroe'),
(157, 'FR', 'Europe/Paris'),
(158, 'GA', 'Africa/Libreville'),
(159, 'GB', 'Europe/London'),
(160, 'GD', 'America/Grenada'),
(161, 'GE', 'Asia/Tbilisi'),
(162, 'GF', 'America/Cayenne'),
(163, 'GG', 'Europe/Guernsey'),
(164, 'GH', 'Africa/Accra'),
(165, 'GI', 'Europe/Gibraltar'),
(166, 'GL', 'America/Godthab'),
(167, 'GL', 'America/Danmarkshavn'),
(168, 'GL', 'America/Scoresbysund'),
(169, 'GL', 'America/Thule'),
(170, 'GM', 'Africa/Banjul'),
(171, 'GN', 'Africa/Conakry'),
(172, 'GP', 'America/Guadeloupe'),
(173, 'GQ', 'Africa/Malabo'),
(174, 'GR', 'Europe/Athens'),
(175, 'GS', 'Atlantic/South_Georgia'),
(176, 'GT', 'America/Guatemala'),
(177, 'GU', 'Pacific/Guam'),
(178, 'GW', 'Africa/Bissau'),
(179, 'GY', 'America/Guyana'),
(180, 'HK', 'Asia/Hong_Kong'),
(181, 'HN', 'America/Tegucigalpa'),
(182, 'HR', 'Europe/Zagreb'),
(183, 'HT', 'America/Port-au-Prince'),
(184, 'HU', 'Europe/Budapest'),
(185, 'ID', 'Asia/Jakarta'),
(186, 'ID', 'Asia/Pontianak'),
(187, 'ID', 'Asia/Makassar'),
(188, 'ID', 'Asia/Jayapura'),
(189, 'IE', 'Europe/Dublin'),
(190, 'IL', 'Asia/Jerusalem'),
(191, 'IM', 'Europe/Isle_of_Man'),
(192, 'IN', 'Asia/Kolkata'),
(193, 'IO', 'Indian/Chagos'),
(194, 'IQ', 'Asia/Baghdad'),
(195, 'IR', 'Asia/Tehran'),
(196, 'IS', 'Atlantic/Reykjavik'),
(197, 'IT', 'Europe/Rome'),
(198, 'JE', 'Europe/Jersey'),
(199, 'JM', 'America/Jamaica'),
(200, 'JO', 'Asia/Amman'),
(201, 'JP', 'Asia/Tokyo'),
(202, 'KE', 'Africa/Nairobi'),
(203, 'KG', 'Asia/Bishkek'),
(204, 'KH', 'Asia/Phnom_Penh'),
(205, 'KI', 'Pacific/Tarawa'),
(206, 'KI', 'Pacific/Enderbury'),
(207, 'KI', 'Pacific/Kiritimati'),
(208, 'KM', 'Indian/Comoro'),
(209, 'KN', 'America/St_Kitts'),
(210, 'KP', 'Asia/Pyongyang'),
(211, 'KR', 'Asia/Seoul'),
(212, 'KW', 'Asia/Kuwait'),
(213, 'KY', 'America/Cayman'),
(214, 'KZ', 'Asia/Almaty'),
(215, 'KZ', 'Asia/Qyzylorda'),
(216, 'KZ', 'Asia/Aqtobe'),
(217, 'KZ', 'Asia/Aqtau'),
(218, 'KZ', 'Asia/Oral'),
(219, 'LA', 'Asia/Vientiane'),
(220, 'LB', 'Asia/Beirut'),
(221, 'LC', 'America/St_Lucia'),
(222, 'LI', 'Europe/Vaduz'),
(223, 'LK', 'Asia/Colombo'),
(224, 'LR', 'Africa/Monrovia'),
(225, 'LS', 'Africa/Maseru'),
(226, 'LT', 'Europe/Vilnius'),
(227, 'LU', 'Europe/Luxembourg'),
(228, 'LV', 'Europe/Riga'),
(229, 'LY', 'Africa/Tripoli'),
(230, 'MA', 'Africa/Casablanca'),
(231, 'MC', 'Europe/Monaco'),
(232, 'MD', 'Europe/Chisinau'),
(233, 'ME', 'Europe/Podgorica'),
(234, 'MF', 'America/Marigot'),
(235, 'MG', 'Indian/Antananarivo'),
(236, 'MH', 'Pacific/Majuro'),
(237, 'MH', 'Pacific/Kwajalein'),
(238, 'MK', 'Europe/Skopje'),
(239, 'ML', 'Africa/Bamako'),
(240, 'MM', 'Asia/Rangoon'),
(241, 'MN', 'Asia/Ulaanbaatar'),
(242, 'MN', 'Asia/Hovd'),
(243, 'MN', 'Asia/Choibalsan'),
(244, 'MO', 'Asia/Macau'),
(245, 'MP', 'Pacific/Saipan'),
(246, 'MQ', 'America/Martinique'),
(247, 'MR', 'Africa/Nouakchott'),
(248, 'MS', 'America/Montserrat'),
(249, 'MT', 'Europe/Malta'),
(250, 'MU', 'Indian/Mauritius'),
(251, 'MV', 'Indian/Maldives'),
(252, 'MW', 'Africa/Blantyre'),
(253, 'MX', 'America/Mexico_City'),
(254, 'MX', 'America/Cancun'),
(255, 'MX', 'America/Merida'),
(256, 'MX', 'America/Monterrey'),
(257, 'MX', 'America/Matamoros'),
(258, 'MX', 'America/Mazatlan'),
(259, 'MX', 'America/Chihuahua'),
(260, 'MX', 'America/Ojinaga'),
(261, 'MX', 'America/Hermosillo'),
(262, 'MX', 'America/Tijuana'),
(263, 'MX', 'America/Bahia_Banderas'),
(264, 'MY', 'Asia/Kuala_Lumpur'),
(265, 'MY', 'Asia/Kuching'),
(266, 'MZ', 'Africa/Maputo'),
(267, 'NA', 'Africa/Windhoek'),
(268, 'NC', 'Pacific/Noumea'),
(269, 'NE', 'Africa/Niamey'),
(270, 'NF', 'Pacific/Norfolk'),
(271, 'NG', 'Africa/Lagos'),
(272, 'NI', 'America/Managua'),
(273, 'NL', 'Europe/Amsterdam'),
(274, 'NO', 'Europe/Oslo'),
(275, 'NP', 'Asia/Kathmandu'),
(276, 'NR', 'Pacific/Nauru'),
(277, 'NU', 'Pacific/Niue'),
(278, 'NZ', 'Pacific/Auckland'),
(279, 'NZ', 'Pacific/Chatham'),
(280, 'OM', 'Asia/Muscat'),
(281, 'PA', 'America/Panama'),
(282, 'PE', 'America/Lima'),
(283, 'PF', 'Pacific/Tahiti'),
(284, 'PF', 'Pacific/Marquesas'),
(285, 'PF', 'Pacific/Gambier'),
(286, 'PG', 'Pacific/Port_Moresby'),
(287, 'PG', 'Pacific/Bougainville'),
(288, 'PH', 'Asia/Manila'),
(289, 'PK', 'Asia/Karachi'),
(290, 'PL', 'Europe/Warsaw'),
(291, 'PM', 'America/Miquelon'),
(292, 'PN', 'Pacific/Pitcairn'),
(293, 'PR', 'America/Puerto_Rico'),
(294, 'PS', 'Asia/Gaza'),
(295, 'PS', 'Asia/Hebron'),
(296, 'PT', 'Europe/Lisbon'),
(297, 'PT', 'Atlantic/Madeira'),
(298, 'PT', 'Atlantic/Azores'),
(299, 'PW', 'Pacific/Palau'),
(300, 'PY', 'America/Asuncion'),
(301, 'QA', 'Asia/Qatar'),
(302, 'RE', 'Indian/Reunion'),
(303, 'RO', 'Europe/Bucharest'),
(304, 'RS', 'Europe/Belgrade'),
(305, 'RU', 'Europe/Kaliningrad'),
(306, 'RU', 'Europe/Moscow'),
(307, 'RU', 'Europe/Simferopol'),
(308, 'RU', 'Europe/Volgograd'),
(309, 'RU', 'Europe/Kirov'),
(310, 'RU', 'Europe/Astrakhan'),
(311, 'RU', 'Europe/Samara'),
(312, 'RU', 'Europe/Ulyanovsk'),
(313, 'RU', 'Asia/Yekaterinburg'),
(314, 'RU', 'Asia/Omsk'),
(315, 'RU', 'Asia/Novosibirsk'),
(316, 'RU', 'Asia/Barnaul'),
(317, 'RU', 'Asia/Tomsk'),
(318, 'RU', 'Asia/Novokuznetsk'),
(319, 'RU', 'Asia/Krasnoyarsk'),
(320, 'RU', 'Asia/Irkutsk'),
(321, 'RU', 'Asia/Chita'),
(322, 'RU', 'Asia/Yakutsk'),
(323, 'RU', 'Asia/Khandyga'),
(324, 'RU', 'Asia/Vladivostok'),
(325, 'RU', 'Asia/Ust-Nera'),
(326, 'RU', 'Asia/Magadan'),
(327, 'RU', 'Asia/Sakhalin'),
(328, 'RU', 'Asia/Srednekolymsk'),
(329, 'RU', 'Asia/Kamchatka'),
(330, 'RU', 'Asia/Anadyr'),
(331, 'RW', 'Africa/Kigali'),
(332, 'SA', 'Asia/Riyadh'),
(333, 'SB', 'Pacific/Guadalcanal'),
(334, 'SC', 'Indian/Mahe'),
(335, 'SD', 'Africa/Khartoum'),
(336, 'SE', 'Europe/Stockholm'),
(337, 'SG', 'Asia/Singapore'),
(338, 'SH', 'Atlantic/St_Helena'),
(339, 'SI', 'Europe/Ljubljana'),
(340, 'SJ', 'Arctic/Longyearbyen'),
(341, 'SK', 'Europe/Bratislava'),
(342, 'SL', 'Africa/Freetown'),
(343, 'SM', 'Europe/San_Marino'),
(344, 'SN', 'Africa/Dakar'),
(345, 'SO', 'Africa/Mogadishu'),
(346, 'SR', 'America/Paramaribo'),
(347, 'SS', 'Africa/Juba'),
(348, 'ST', 'Africa/Sao_Tome'),
(349, 'SV', 'America/El_Salvador'),
(350, 'SX', 'America/Lower_Princes'),
(351, 'SY', 'Asia/Damascus'),
(352, 'SZ', 'Africa/Mbabane'),
(353, 'TC', 'America/Grand_Turk'),
(354, 'TD', 'Africa/Ndjamena'),
(355, 'TF', 'Indian/Kerguelen'),
(356, 'TG', 'Africa/Lome'),
(357, 'TH', 'Asia/Bangkok'),
(358, 'TJ', 'Asia/Dushanbe'),
(359, 'TK', 'Pacific/Fakaofo'),
(360, 'TL', 'Asia/Dili'),
(361, 'TM', 'Asia/Ashgabat'),
(362, 'TN', 'Africa/Tunis'),
(363, 'TO', 'Pacific/Tongatapu'),
(364, 'TR', 'Europe/Istanbul'),
(365, 'TT', 'America/Port_of_Spain'),
(366, 'TV', 'Pacific/Funafuti'),
(367, 'TW', 'Asia/Taipei'),
(368, 'TZ', 'Africa/Dar_es_Salaam'),
(369, 'UA', 'Europe/Kiev'),
(370, 'UA', 'Europe/Uzhgorod'),
(371, 'UA', 'Europe/Zaporozhye'),
(372, 'UG', 'Africa/Kampala'),
(373, 'UM', 'Pacific/Johnston'),
(374, 'UM', 'Pacific/Midway'),
(375, 'UM', 'Pacific/Wake'),
(376, 'US', 'America/New_York'),
(377, 'US', 'America/Detroit'),
(378, 'US', 'America/Kentucky/Louisville'),
(379, 'US', 'America/Kentucky/Monticello'),
(380, 'US', 'America/Indiana/Indianapolis'),
(381, 'US', 'America/Indiana/Vincennes'),
(382, 'US', 'America/Indiana/Winamac'),
(383, 'US', 'America/Indiana/Marengo'),
(384, 'US', 'America/Indiana/Petersburg'),
(385, 'US', 'America/Indiana/Vevay'),
(386, 'US', 'America/Chicago'),
(387, 'US', 'America/Indiana/Tell_City'),
(388, 'US', 'America/Indiana/Knox'),
(389, 'US', 'America/Menominee'),
(390, 'US', 'America/North_Dakota/Center'),
(391, 'US', 'America/North_Dakota/New_Salem'),
(392, 'US', 'America/North_Dakota/Beulah'),
(393, 'US', 'America/Denver'),
(394, 'US', 'America/Boise'),
(395, 'US', 'America/Phoenix'),
(396, 'US', 'America/Los_Angeles'),
(397, 'US', 'America/Anchorage'),
(398, 'US', 'America/Juneau'),
(399, 'US', 'America/Sitka'),
(400, 'US', 'America/Metlakatla'),
(401, 'US', 'America/Yakutat'),
(402, 'US', 'America/Nome'),
(403, 'US', 'America/Adak'),
(404, 'US', 'Pacific/Honolulu'),
(405, 'UY', 'America/Montevideo'),
(406, 'UZ', 'Asia/Samarkand'),
(407, 'UZ', 'Asia/Tashkent'),
(408, 'VA', 'Europe/Vatican'),
(409, 'VC', 'America/St_Vincent'),
(410, 'VE', 'America/Caracas'),
(411, 'VG', 'America/Tortola'),
(412, 'VI', 'America/St_Thomas'),
(413, 'VN', 'Asia/Ho_Chi_Minh'),
(414, 'VU', 'Pacific/Efate'),
(415, 'WF', 'Pacific/Wallis'),
(416, 'WS', 'Pacific/Apia'),
(417, 'YE', 'Asia/Aden'),
(418, 'YT', 'Indian/Mayotte'),
(419, 'ZA', 'Africa/Johannesburg'),
(420, 'ZM', 'Africa/Lusaka'),
(421, 'ZW', 'Africa/Harare');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `active_logo`
--
ALTER TABLE `active_logo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_balances`
--
ALTER TABLE `agent_balances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_payment`
--
ALTER TABLE `agent_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_view_link`
--
ALTER TABLE `agent_view_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_channels`
--
ALTER TABLE `chat_channels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_logs`
--
ALTER TABLE `chat_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telephone_active` (`telephone_active`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `work_type` (`work_type`),
  ADD KEY `pharmacy_name` (`pharmacy_name`),
  ADD KEY `telephone` (`telephone`),
  ADD KEY `email` (`email`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `ower_name` (`ower_name`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses_register`
--
ALTER TABLE `expenses_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_items`
--
ALTER TABLE `expense_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_companies`
--
ALTER TABLE `marketing_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_ids`
--
ALTER TABLE `player_ids`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_channels`
--
ALTER TABLE `chat_channels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=442;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `player_ids`
--
ALTER TABLE `player_ids`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
