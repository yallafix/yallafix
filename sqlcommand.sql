-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2022 at 02:18 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edemand_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(50) NOT NULL,
  `type` varchar(32) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `alternate_mobile` varchar(20) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `city_id` int(20) NOT NULL DEFAULT 0,
  `city` varchar(252) NOT NULL,
  `landmark` varchar(128) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `lattitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `partner_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `is_saved_for_later` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(50) NOT NULL DEFAULT 0,
  `name` varchar(1024) NOT NULL,
  `image` text NOT NULL,
  `slug` varchar(1024) NOT NULL,
  `admin_commission` double NOT NULL COMMENT 'global admin commission for all partners',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - deactive | 1 - active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `latitude` varchar(120) DEFAULT NULL,
  `longitude` varchar(120) DEFAULT NULL,
  `delivery_charge_method` varchar(30) DEFAULT NULL,
  `fixed_charge` int(11) NOT NULL DEFAULT 0,
  `per_km_charge` int(11) NOT NULL DEFAULT 0,
  `range_wise_charges` text DEFAULT NULL,
  `time_to_travel` int(11) NOT NULL DEFAULT 0,
  `geolocation_type` varchar(30) DEFAULT NULL COMMENT 'not used in current',
  `radius` varchar(512) DEFAULT '0' COMMENT 'not used in current',
  `boundary_points` text DEFAULT NULL COMMENT 'not used in current',
  `max_deliverable_distance` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `delete_general_notification`
--

CREATE TABLE `delete_general_notification` (
  `id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `notification_id` int(50) NOT NULL,
  `is_readed` tinyint(50) NOT NULL,
  `is_deleted` tinytext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` mediumtext DEFAULT NULL,
  `answer` mediumtext DEFAULT NULL,
  `status` char(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'Customers'),
(3, 'partners', 'Service Providing Partners');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `is_rtl` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `code`, `is_rtl`, `created_at`) VALUES
(1, 'english', 'en', 0, '2021-12-25 10:37:11');


-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2021-12-02-124048', 'App\\Database\\Migrations\\AddProducts', 'default', 'App', 1669892046, 1),
(2, '2021-12-03-040835', 'App\\Database\\Migrations\\Test', 'default', 'App', 1669892046, 1),
(3, '2022-12-01-114504', 'App\\Database\\Migrations\\users_tokens', 'default', 'App', 1669900113, 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `message` varchar(512) NOT NULL,
  `type` varchar(12) NOT NULL,
  `type_id` varchar(512) NOT NULL DEFAULT '0',
  `image` varchar(128) DEFAULT NULL,
  `order_id` int(50) DEFAULT NULL,
  `user_id` int(50) DEFAULT NULL,
  `is_readed` tinyint(1) NOT NULL,
  `notification_type` varchar(50) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------


--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL DEFAULT 0,
  `city` varchar(252) NOT NULL,
  `total` double NOT NULL,
  `visiting_charges` double NOT NULL DEFAULT 0,
  `promo_code` varchar(64) NOT NULL,
  `promo_discount` double NOT NULL,
  `final_total` double NOT NULL,
  `payment_method` varchar(64) NOT NULL,
  `admin_earnings` double NOT NULL,
  `partner_earnings` double NOT NULL,
  `is_commission_settled` tinyint(1) NOT NULL COMMENT '0: Not settled\r\n1: Settled\r\n',
  `address_id` int(11) NOT NULL,
  `address` varchar(2048) NOT NULL,
  `date_of_service` date NOT NULL,
  `starting_time` time NOT NULL,
  `ending_time` time NOT NULL,
  `duration` varchar(64) NOT NULL COMMENT 'in minutes',
  `status` varchar(64) NOT NULL COMMENT '0. awaiting\r\n1. confirmed\r\n2. rescheduled\r\n3. cancelled\r\n4. completed',
  `remarks` varchar(2048) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_services`
--

CREATE TABLE `order_services` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_title` text NOT NULL,
  `tax_percentage` double NOT NULL,
  `tax_amount` double NOT NULL,
  `price` double NOT NULL,
  `quantity` double NOT NULL,
  `sub_total` double NOT NULL COMMENT 'price X quantity',
  `status` varchar(64) NOT NULL COMMENT '0. awaiting \r\n1. confirmed \r\n2. rescheduled \r\n3. cancelled \r\n4. completed	',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `partner_details`
--

CREATE TABLE `partner_details` (
  `id` int(11) UNSIGNED NOT NULL,
  `partner_id` int(11) NOT NULL COMMENT 'user_id',
  `company_name` varchar(1024) DEFAULT NULL,
  `about` varchar(4096) NOT NULL,
  `national_id` varchar(1024) DEFAULT NULL,
  `address` varchar(1024) DEFAULT NULL,
  `banner` longtext NOT NULL,
  `address_id` varchar(1024) DEFAULT NULL,
  `passport` varchar(1024) DEFAULT NULL,
  `tax_name` varchar(100) DEFAULT NULL,
  `tax_number` varchar(64) DEFAULT NULL,
  `bank_name` varchar(256) DEFAULT NULL,
  `account_number` varchar(256) NOT NULL,
  `account_name` varchar(512) DEFAULT NULL,
  `bank_code` varchar(256) DEFAULT NULL,
  `swift_code` varchar(256) DEFAULT NULL,
  `advance_booking_days` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - individual | 1 - organization ',
  `number_of_members` int(11) NOT NULL,
  `admin_commission` text NOT NULL COMMENT '[ {"category_id" : "commission"},{...} ]',
  `visiting_charges` int(20) NOT NULL,
  `is_approved` tinyint(1) NOT NULL COMMENT '0. Not approved\r\n1. Approved\r\n7. Trashed',
  `service_range` double DEFAULT NULL,
  `ratings` double NOT NULL DEFAULT 0,
  `number_of_ratings` double NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `partner_timings`
--

CREATE TABLE `partner_timings` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `day` varchar(20) DEFAULT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  `is_open` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_request`
--

CREATE TABLE `payment_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` varchar(56) NOT NULL COMMENT 'partner | customer',
  `payment_address` varchar(1024) NOT NULL,
  `amount` double NOT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0-pending | 1- approved|2-rejected',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `promo_code` varchar(28) NOT NULL,
  `message` varchar(512) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `no_of_users` int(11) DEFAULT NULL,
  `minimum_order_amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `discount_type` varchar(32) DEFAULT NULL,
  `max_discount_amount` double DEFAULT NULL,
  `repeat_usage` tinyint(4) NOT NULL,
  `no_of_repeat_usage` int(11) DEFAULT NULL,
  `image` varchar(256) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(1024) NOT NULL,
  `section_type` varchar(1024) NOT NULL,
  `category_ids` varchar(255) DEFAULT NULL,
  `partners_ids` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'partner_id',
  `category_id` int(11) NOT NULL,
  `tax_type` varchar(20) NOT NULL DEFAULT ' included',
  `tax_id` int(11) NOT NULL DEFAULT 0,
  `tax` double DEFAULT NULL,
  `title` varchar(2048) NOT NULL,
  `slug` varchar(2048) NOT NULL,
  `description` text NOT NULL,
  `tags` text NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `price` double NOT NULL,
  `discounted_price` double NOT NULL DEFAULT 0,
  `number_of_members_required` int(11) NOT NULL DEFAULT 1 COMMENT 'No of members required to perform service',
  `duration` varchar(128) NOT NULL COMMENT 'in minutes',
  `rating` double NOT NULL DEFAULT 0 COMMENT 'Average rating',
  `number_of_ratings` double NOT NULL DEFAULT 0,
  `on_site_allowed` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 - not allowed | 1 - allowed',
  `is_cancelable` tinyint(1) NOT NULL DEFAULT 0,
  `cancelable_till` varchar(200) NOT NULL,
  `max_quantity_allowed` int(11) NOT NULL DEFAULT 0 COMMENT '0 - unlimited | number - limited qty',
  `is_pay_later_allowed` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 - not allowed | 1 - allowed',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 - deactive | 1 - active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `services_ratings`
--

CREATE TABLE `services_ratings` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `rating` double NOT NULL,
  `comment` varchar(4096) DEFAULT NULL,
  `images` text DEFAULT NULL COMMENT 'multiple images( comma separated )',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `variable` varchar(35) NOT NULL,
  `value` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `variable`, `value`, `created_at`, `updated_at`) VALUES
(1, 'test', '{\"val\" : \"this\"}', '2022-04-21 05:59:17', '0000-00-00 00:00:00'),
(2, 'languages', '{\"ar-XA\":\"Arabic [Switzerland]\",\"bn-IN\":\"Bengali [India]\",\"en-GB\":\"English [United Kingdom]\",\"fr-CA\":\"French [Canada]\",\"en-US\":\"English [United States of America]\",\"es-ES\":\"Spanish \\/ Castilian [Spain]\",\"fi-FI\":\"Finnish [Finland]\",\"gu-IN\":\"Gujarati [India]\",\"ja-JP\":\"Japanese (ja) [Japan]\",\"kn-IN\":\"Kannada [India]\",\"ml-IN\":\"Malayalam [India]\",\"sv-SE\":\"Swedish [Sweden]\",\"ta-IN\":\"Tamil [India]\",\"tr-TR\":\"Turkish [Turkey]\",\"ms-MY\":\"Malay [Malaysia]\",\"pa-IN\":\"Punjabi [India]\",\"cs-CZ\":\"Czech [Czech Republic]\",\"de-DE\":\"German [Germany]\",\"en-AU\":\"English [Australia]\",\"en-IN\":\"English [India]\",\"es-US\":\"Spanish \\/ Castilian [United States of America]\",\"fr-FR\":\"French [France, French Republic]\",\"hi-IN\":\"Hindi [India]\",\"id-ID\":\"Indonesian [Indonesia]\",\"it-IT\":\"Italian [Italy]\",\"ko-KR\":\"Korean [Korea]\",\"ru-RU\":\"Russian [Russian Federation]\",\"uk-UA\":\"Ukrainian [Ukraine]\",\"cmn-CN\":\"Mandarin Chinese [China]\",\"cmn-TW\":\"Mandarin Chinese [Taiwan]\",\"da-DK\":\"Danish [Denmark]\",\"el-GR\":\"Greek \\/ Modern [Greece]\",\"fil-PH\":\"Filipino \\/ Pilipino [Philippines]\",\"hu-HU\":\"Hungarian [Hungary]\",\"nb-NO\":\"Norwegian Bokm\\u00e5l [Norway]\",\"nl-BE\":\"Dutch [Belgium]\",\"nl-NL\":\"Dutch [Netherlands the]\",\"pt-PT\":\"Portuguese [Portugal, Portuguese Republic]\",\"sk-SK\":\"Slovak [Slovakia (Slovak Republic)]\",\"vi-VN\":\"Vietnamese [Vietnam]\",\"pl-PL\":\"Polish [Poland]\",\"pt-BR\":\"Portuguese [Brazil]\",\"ca-ES\":\"Catalan; Valencian [Spain]\",\"yue-HK\":\"Yue Chinese [Hong Kong]\",\"af-ZA\":\"Afrikaans [South Africa]\",\"bg-BG\":\"Bulgarian [Bulgaria]\",\"lv-LV\":\"Latvian [Latvia]\",\"ro-RO\":\"Romanian \\/ Moldavian \\/ Moldovan [Romania]\",\"sr-RS\":\"Serbian [Serbia]\",\"th-TH\":\"Thai [Thailand]\",\"te-IN\":\"Telugu [India]\",\"is-IS\":\"Icelandic [Iceland]\",\"cy-GB\":\"Welsh [United Kingdom]\",\"en-GB-WLS\":\"English [united kingdom]\",\"es-MX\":\"Spanish \\/ Castilian [Mexico]\",\"en-NZ\":\"English [New Zealand]\",\"en-ZA\":\"English [South Africa]\",\"ar-EG\":\"Arabic [Egypt]\",\"ar-SA\":\"Arabic [Saudi Arabia]\",\"de-AT\":\"German [Austria]\",\"de-CH\":\"German [Switzerland, Swiss Confederation]\",\"en-CA\":\"English [Canada]\",\"en-HK\":\"English [Hong Kong]\",\"en-IE\":\"English [Ireland]\",\"en-PH\":\"English [Philippines]\",\"en-SG\":\"English [Singapore]\",\"es-AR\":\"Spanish \\/ Castilian [Argentina]\",\"es-CO\":\"Spanish \\/ Castilian [Colombia]\",\"et-EE\":\"Estonian [Estonia]\",\"fr-BE\":\"French [Belgium]\",\"fr-CH\":\"French [Switzerland, Swiss Confederation]\",\"ga-IE\":\"Irish [Ireland]\",\"he-IL\":\"Hebrew (modern) [Israel]\",\"hr-HR\":\"Croatian [Croatia]\",\"lt-LT\":\"Lithuanian [Lithuania]\",\"mr-IN\":\"Marathi [India]\",\"mt-MT\":\"Maltese [Malta]\",\"sl-SI\":\"Slovene [Slovenia]\",\"sw-KE\":\"Swahili [Kenya]\",\"ur-PK\":\"Urdu [Pakistan]\",\"zh-CN\":\"Chinese [China]\",\"zh-HK\":\"Chinese [Hong Kong]\",\"zh-TW\":\"Chinese [Taiwan]\",\"es-LA\":\"Spanish \\/ Castilian [Lao]\",\"ar-MS\":\"Arabic [Montserrat]\"}', '2022-04-21 05:59:17', '0000-00-00 00:00:00'),
(13, 'payment_gateways_settings', '{
\"razorpayApiStatus\":\"disable\",
\"razorpay_mode\":\"test\",
\"razorpay_currency\":\"INR\",
\"razorpay_secret\":\"your_razorpay_secret\",
\"razorpay_key\":\"your_razorpay_key\",
\"endpoint\":\"your_razorpay_endpoint\",
\"paypal_client_key\":\"your_paypal_client_key\",
\"paypal_currency_code\":\"USD\",
\"paypal_secret_key\":\"1235\",
\"paypal_business_email\":\"test@test.com\",
\"paypal_mode\":\"sandbox\",
\"paystack_status\":\"disable\",
\"paystack_mode\":\"test\",
\"paystack_currency\":\"NGN\",
\"paystack_secret\":\"your_paystack_secret\",
\"paystack_key\":\"your_paystack_key\",
\"stripe_status\":\"enable\",
\"stripe_mode\":\"test\",
\"stripe_currency\":\"INR\",
\"stripe_publishable_key\":\"your_stripe_publishable_key\",
\"stripe_webhook_secret_key\":\"your_stripe_webhook_secret_key\",
\"flutterwave_status\":\"enable\",
\"flutterwave_currency_code\":\"TZS\",
\"flutterwave_public_key\":\"your_flutterwave_public_key\",
\"flutterwave_secret_key\":\"your_flutterwave_secret_key\",
\"flutterwave_encryption_key\":\"your_flutterwave_encryption_key\",
\"flutterwave_webhook_secret_key\":\"your_flutterwave_webhook_secret_key\",
\"flutterwave_endpoint\":\"your_flutterwave_endpoint\",
\"stripe_secret_key\":\"your_stripe_secret_key\"}',
 '2022-11-28 13:03:05', '0000-00-00 00:00:00'),
(15, 'terms_conditions', '{\"terms_conditions\":\"<p>Partner Terms and Conditions Here<\\/p>\"}', '2022-04-29 06:48:00', '0000-00-00 00:00:00'),
(16, 'privacy_policy', '{\"privacy_policy\":\"<h1>Privacy Policy for WRTeam<\\/h1>\\r\\n<p>At eDemand Provider, accessible from https:\\/\\/edemand.wrteam.me\\/partner\\/login, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by eDemand Provider and how we use it.<\\/p>\\r\\n<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.<\\/p>\\r\\n<p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and\\/or collect in eDemand Provider. This policy is not applicable to any information collected offline or via channels other than this website.<\\/p>\\r\\n<p>Consent<\\/p>\\r\\n<p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.<\\/p>\\r\\n<h2>Information we collect<\\/h2>\\r\\n<p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.<\\/p>\\r\\n<p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and\\/or attachments you may send us, and any other information you may choose to provide.<\\/p>\\r\\n<p>When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.<\\/p>\\r\\n<h2>How we use your information<\\/h2>\\r\\n<p>We use the information we collect in various ways, including to:<\\/p>\\r\\n<ul>\\r\\n<li>Provide, operate, and maintain our website<\\/li>\\r\\n<li>Improve, personalize, and expand our website<\\/li>\\r\\n<li>Understand and analyze how you use our website<\\/li>\\r\\n<li>Develop new products, services, features, and functionality<\\/li>\\r\\n<li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes<\\/li>\\r\\n<li>Send you emails<\\/li>\\r\\n<li>Find and prevent fraud<\\/li>\\r\\n<\\/ul>\\r\\n<h2>Log Files<\\/h2>\\r\\n<p>eDemand Provider follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring\\/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.<\\/p>\\r\\n<h2>Advertising Partners Privacy Policies<\\/h2>\\r\\n<p>You may consult this list to find the Privacy Policy for each of the advertising partners of eDemand Provider.<\\/p>\\r\\n<p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on eDemand Provider, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and\\/or to personalize the advertising content that you see on websites that you visit.<\\/p>\\r\\n<p>Note that eDemand Provider has no access to or control over these cookies that are used by third-party advertisers.<\\/p>\\r\\n<h2>Third Party Privacy Policies<\\/h2>\\r\\n<p>eDemand Provider\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.<\\/p>\\r\\n<p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.<\\/p>\\r\\n<h2>CCPA Privacy Rights (Do Not Sell My Personal Information)<\\/h2>\\r\\n<p>Under the CCPA, among other rights, California consumers have the right to:<\\/p>\\r\\n<p>Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.<\\/p>\\r\\n<p>Request that a business delete any personal data about the consumer that a business has collected.<\\/p>\\r\\n<p>Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.<\\/p>\\r\\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.<\\/p>\\r\\n<h2>GDPR Data Protection Rights<\\/h2>\\r\\n<p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:<\\/p>\\r\\n<p>The right to access &ndash; You have the right to request copies of your personal data. We may charge you a small fee for this service.<\\/p>\\r\\n<p>The right to rectification &ndash; You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.<\\/p>\\r\\n<p>The right to erasure &ndash; You have the right to request that we erase your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to restrict processing &ndash; You have the right to request that we restrict the processing of your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to object to processing &ndash; You have the right to object to our processing of your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to data portability &ndash; You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.<\\/p>\\r\\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.<\\/p>\\r\\n<h2>Children\'s Information<\\/h2>\\r\\n<p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and\\/or monitor and guide their online activity.<\\/p>\\r\\n<p>eDemand Provider does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.<\\/p>\"}', '2022-11-29 09:52:41', '0000-00-00 00:00:00'),
(17, 'about_us', '{\"about_us\":\"this is about us page information\"}', '2022-11-22 06:38:16', '0000-00-00 00:00:00'),
(18, 'general_settings', '{\"company_title\":\"eDemand - On Demand Services\",\"support_name\":\"eDemand\",\"support_email\":\"info@eDemand.in\",\"currency\":\"$\",\"system_timezone_gmt\":\"+05:30\",\"system_timezone\":\"Asia\\/Kolkata\",\"phone\":\"9876543210\",\"max_serviceable_distance\":\"50\",\"primary_color\":\"#007bff\",\"secondary_color\":\"#fcfcfc\",\"primary_shadow\":\"#ffffff\",\"address\":\"#123, Time Square, Bhuj - India\",\"short_description\":\"<p>eDemand- On Demand services<\\/p>\",\"copyright_details\":\"Copyright@2024 eDemand. All rights reserved.\",\"support_hours\":\"09:00 AM to 06:00PM IST\",\"favicon\":\"1657775760_29d5c9510f319bcff33f.svg\",\"logo\":\"1655699574_7fd61254c6132ebfd8ce.svg\",\"half_logo\":\"1657775760_f730e7b07a5cda36133e.svg\",\"partner_favicon\":\"1655699528_c19e479401407f3a416d.svg\",\"partner_logo\":\"edemand_provider_logo.svg\",\"partner_half_logo\":\"1657775933_c37b2c2a81820814b648.svg\","otp_system":"1",\"customer_current_version_android_app"\:\"1.0.0"\,\"provider_current_version_android_app"\:\"1.0.0"\,\"at_doorstep":\"1"\,\"at_store"\:\"1"\}', '2022-11-29 07:40:58', '0000-00-00 00:00:00'),
(19, 'email_settings', '{\"mailProtocol\":\"SMTP\",\"smtpHost\":\"smtp.googlemail.com\",\"smtpUsername\":\"yourmail@gmail.com\",\"smtpPassword\":\"yourpassword\",\"smtpPort\":\"465\",\"smtpEncryption\":\"ssl\",\"mailType\":\"html\",\"update\":\"Update\"}', '2022-11-23 09:44:35', '0000-00-00 00:00:00'),
(21, 'refund_policy', '{\"refund_policy\":\"\"}', '2022-04-21 05:59:17', '0000-00-00 00:00:00'),
(22, 'app_settings', '{\"maintenance_date\":\"2022-11-15\",\"start_time\":\"11:01\",\"end_time\":\"15:03\",\"maintenance_mode\":\"on\"}', '2022-11-01 06:29:54', '0000-00-00 00:00:00'),
(23, 'customer_terms_conditions', '{\"customer_terms_conditions\":\"<p>Customer Terms and Condtions here<\\/p>\"}', '2022-04-29 06:41:44', NULL),
(24, 'customer_privacy_policy', '{\"customer_privacy_policy\":\"<h1>Privacy Policy for eDemand<\\/h1>\\r\\n<p>At https:\\/\\/edemand.wrteam.me\\/admin, accessible from https:\\/\\/edemand.wrteam.me\\/admin, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by https:\\/\\/edemand.wrteam.me\\/admin and how we use it.<\\/p>\\r\\n<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.<\\/p>\\r\\n<p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and\\/or collect in https:\\/\\/edemand.wrteam.me\\/admin. This policy is not applicable to any information collected offline or via channels other than this website. Our Privacy Policy was created with the help of the <a href=\\\"https:\\/\\/www.privacypolicygenerator.info\\/\\\">Free Privacy Policy Generator<\\/a>.<\\/p>\\r\\n<h2>Consent<\\/h2>\\r\\n<p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.<\\/p>\\r\\n<h2>Information we collect<\\/h2>\\r\\n<p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and\\/or attachments you may send us, and any other information you may choose to provide.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.<\\/p>\\r\\n<h2>How we use your information<\\/h2>\\r\\n<p>We use the information we collect in various ways, including to:<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<ul>\\r\\n<ul>\\r\\n<li>Provide, operate, and maintain our website<\\/li>\\r\\n<\\/ul>\\r\\n<\\/ul>\\r\\n<p>&nbsp;<\\/p>\\r\\n<ul>\\r\\n<ul>\\r\\n<li>Improve, personalize, and expand our website<\\/li>\\r\\n<\\/ul>\\r\\n<\\/ul>\\r\\n<p>&nbsp;<\\/p>\\r\\n<ul>\\r\\n<ul>\\r\\n<li>Understand and analyze how you use our website<\\/li>\\r\\n<\\/ul>\\r\\n<\\/ul>\\r\\n<p>&nbsp;<\\/p>\\r\\n<ul>\\r\\n<ul>\\r\\n<li>Develop new products, services, features, and functionality<\\/li>\\r\\n<\\/ul>\\r\\n<\\/ul>\\r\\n<p>&nbsp;<\\/p>\\r\\n<ul>\\r\\n<ul>\\r\\n<li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes<\\/li>\\r\\n<\\/ul>\\r\\n<\\/ul>\\r\\n<p>&nbsp;<\\/p>\\r\\n<ul>\\r\\n<ul>\\r\\n<li>Send you emails<\\/li>\\r\\n<\\/ul>\\r\\n<\\/ul>\\r\\n<p>&nbsp;<\\/p>\\r\\n<ul>\\r\\n<ul>\\r\\n<li>Find and prevent fraud<\\/li>\\r\\n<\\/ul>\\r\\n<\\/ul>\\r\\n<p>&nbsp;<\\/p>\\r\\n<h2>Log Files<\\/h2>\\r\\n<p>https:\\/\\/edemand.wrteam.me\\/admin follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring\\/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<h2>Advertising Partners Privacy Policies<\\/h2>\\r\\n<p>You may consult this list to find the Privacy Policy for each of the advertising partners of https:\\/\\/edemand.wrteam.me\\/admin.<\\/p>\\r\\n<p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on https:\\/\\/edemand.wrteam.me\\/admin, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and\\/or to personalize the advertising content that you see on websites that you visit.<\\/p>\\r\\n<p>Note that https:\\/\\/edemand.wrteam.me\\/admin has no access to or control over these cookies that are used by third-party advertisers.<\\/p>\\r\\n<h2>Third Party Privacy Policies<\\/h2>\\r\\n<p>https:\\/\\/edemand.wrteam.me\\/admin\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.<\\/p>\\r\\n<p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.<\\/p>\\r\\n<h2>CCPA Privacy Rights (Do Not Sell My Personal Information)<\\/h2>\\r\\n<p>Under the CCPA, among other rights, California consumers have the right to:<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>Request that a business delete any personal data about the consumer that a business has collected.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.<\\/p>\\r\\n<h2>GDPR Data Protection Rights<\\/h2>\\r\\n<p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>The right to access &ndash; You have the right to request copies of your personal data. We may charge you a small fee for this service.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>The right to rectification &ndash; You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>The right to erasure &ndash; You have the right to request that we erase your personal data, under certain conditions.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>The right to restrict processing &ndash; You have the right to request that we restrict the processing of your personal data, under certain conditions.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>The right to object to processing &ndash; You have the right to object to our processing of your personal data, under certain conditions.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>The right to data portability &ndash; You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.<\\/p>\\r\\n<h2>Children\'s Information<\\/h2>\\r\\n<p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and\\/or monitor and guide their online activity.<\\/p>\\r\\n<p>https:\\/\\/edemand.wrteam.me\\/admin does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.<\\/p>\"}', '2022-11-16 11:52:29', NULL),
(25, 'country_codes_old', '{
  \n  \"countries\": [\n   
  {\n      \"code\": \"+7 840\",\n      \"name\": \"Abkhazia\"\n    },\n 
  {\n      \"code\": \"+93\",\n      \"name\": \"Afghanistan\"\n  },\n
  {\n      \"code\": \"+355\",\n      \"name\": \"Albania\"\n    },\n 
      {\n      \"code\": \"+213\",\n      \"name\": \"Algeria\"\n    },\n    {\n      \"code\": \"+1 684\",\n      \"name\": \"American Samoa\"\n    },\n    {\n      \"code\": \"+376\",\n      \"name\": \"Andorra\"\n    },\n    {\n      \"code\": \"+244\",\n      \"name\": \"Angola\"\n    },\n    {\n      \"code\": \"+1 264\",\n      \"name\": \"Anguilla\"\n    },\n    {\n      \"code\": \"+1 268\",\n      \"name\": \"Antigua and Barbuda\"\n    },\n    {\n      \"code\": \"+54\",\n      \"name\": \"Argentina\"\n    },\n    {\n      \"code\": \"+374\",\n      \"name\": \"Armenia\"\n    },\n    {\n      \"code\": \"+297\",\n      \"name\": \"Aruba\"\n    },\n    {\n      \"code\": \"+247\",\n      \"name\": \"Ascension\"\n    },\n    {\n      \"code\": \"+61\",\n      \"name\": \"Australia\"\n    },\n    {\n      \"code\": \"+672\",\n      \"name\": \"Australian External Territories\"\n    },\n    {\n      \"code\": \"+43\",\n      \"name\": \"Austria\"\n    },\n    {\n      \"code\": \"+994\",\n      \"name\": \"Azerbaijan\"\n    },\n    {\n      \"code\": \"+1 242\",\n      \"name\": \"Bahamas\"\n    },\n    {\n      \"code\": \"+973\",\n      \"name\": \"Bahrain\"\n    },\n    {\n      \"code\": \"+880\",\n      \"name\": \"Bangladesh\"\n    },\n    {\n      \"code\": \"+1 246\",\n      \"name\": \"Barbados\"\n    },\n    {\n      \"code\": \"+1 268\",\n      \"name\": \"Barbuda\"\n    },\n    {\n      \"code\": \"+375\",\n      \"name\": \"Belarus\"\n    },\n    {\n      \"code\": \"+32\",\n      \"name\": \"Belgium\"\n    },\n    {\n      \"code\": \"+501\",\n      \"name\": \"Belize\"\n    },\n    {\n      \"code\": \"+229\",\n      \"name\": \"Benin\"\n    },\n    {\n      \"code\": \"+1 441\",\n      \"name\": \"Bermuda\"\n    },\n    {\n      \"code\": \"+975\",\n      \"name\": \"Bhutan\"\n    },\n    {\n      \"code\": \"+591\",\n      \"name\": \"Bolivia\"\n    },\n    {\n      \"code\": \"+387\",\n      \"name\": \"Bosnia and Herzegovina\"\n    },\n    {\n      \"code\": \"+267\",\n      \"name\": \"Botswana\"\n    },\n    {\n      \"code\": \"+55\",\n      \"name\": \"Brazil\"\n    },\n    {\n      \"code\": \"+246\",\n      \"name\": \"British Indian Ocean Territory\"\n    },\n    {\n      \"code\": \"+1 284\",\n      \"name\": \"British Virgin Islands\"\n    },\n    {\n      \"code\": \"+673\",\n      \"name\": \"Brunei\"\n    },\n    {\n      \"code\": \"+359\",\n      \"name\": \"Bulgaria\"\n    },\n    {\n      \"code\": \"+226\",\n      \"name\": \"Burkina Faso\"\n    },\n    {\n      \"code\": \"+257\",\n      \"name\": \"Burundi\"\n    },\n    {\n      \"code\": \"+855\",\n      \"name\": \"Cambodia\"\n    },\n    {\n      \"code\": \"+237\",\n      \"name\": \"Cameroon\"\n    },\n    {\n      \"code\": \"+1\",\n      \"name\": \"Canada\"\n    },\n    {\n      \"code\": \"+238\",\n      \"name\": \"Cape Verde\"\n    },\n    {\n      \"code\": \"+ 345\",\n      \"name\": \"Cayman Islands\"\n    },\n    {\n      \"code\": \"+236\",\n      \"name\": \"Central African Republic\"\n    },\n    {\n      \"code\": \"+235\",\n      \"name\": \"Chad\"\n    },\n    {\n      \"code\": \"+56\",\n      \"name\": \"Chile\"\n    },\n    {\n      \"code\": \"+86\",\n      \"name\": \"China\"\n    },\n    {\n      \"code\": \"+61\",\n      \"name\": \"Christmas Island\"\n    },\n    {\n      \"code\": \"+61\",\n      \"name\": \"Cocos-Keeling Islands\"\n    },\n    {\n      \"code\": \"+57\",\n      \"name\": \"Colombia\"\n    },\n    {\n      \"code\": \"+269\",\n      \"name\": \"Comoros\"\n    },\n    {\n      \"code\": \"+242\",\n      \"name\": \"Congo\"\n    },\n    {\n      \"code\": \"+243\",\n      \"name\": \"Congo, Dem. Rep. of (Zaire)\"\n    },\n    {\n      \"code\": \"+682\",\n      \"name\": \"Cook Islands\"\n    },\n    {\n      \"code\": \"+506\",\n      \"name\": \"Costa Rica\"\n    },\n    {\n      \"code\": \"+385\",\n      \"name\": \"Croatia\"\n    },\n    {\n      \"code\": \"+53\",\n      \"name\": \"Cuba\"\n    },\n    {\n      \"code\": \"+599\",\n      \"name\": \"Curacao\"\n    },\n    {\n      \"code\": \"+537\",\n      \"name\": \"Cyprus\"\n    },\n    {\n      \"code\": \"+420\",\n      \"name\": \"Czech Republic\"\n    },\n    {\n      \"code\": \"+45\",\n      \"name\": \"Denmark\"\n    },\n    {\n      \"code\": \"+246\",\n      \"name\": \"Diego Garcia\"\n    },\n    {\n      \"code\": \"+253\",\n      \"name\": \"Djibouti\"\n    },\n    {\n      \"code\": \"+1 767\",\n      \"name\": \"Dominica\"\n    },\n    {\n      \"code\": \"+1 809\",\n      \"name\": \"Dominican Republic\"\n    },\n    {\n      \"code\": \"+670\",\n      \"name\": \"East Timor\"\n    },\n    {\n      \"code\": \"+56\",\n      \"name\": \"Easter Island\"\n    },\n    {\n      \"code\": \"+593\",\n      \"name\": \"Ecuador\"\n    },\n    {\n      \"code\": \"+20\",\n      \"name\": \"Egypt\"\n    },\n    {\n      \"code\": \"+503\",\n      \"name\": \"El Salvador\"\n    },\n    {\n      \"code\": \"+240\",\n      \"name\": \"Equatorial Guinea\"\n    },\n    {\n      \"code\": \"+291\",\n      \"name\": \"Eritrea\"\n    },\n    {\n      \"code\": \"+372\",\n      \"name\": \"Estonia\"\n    },\n    {\n      \"code\": \"+251\",\n      \"name\": \"Ethiopia\"\n    },\n    {\n      \"code\": \"+500\",\n      \"name\": \"Falkland Islands\"\n    },\n    {\n      \"code\": \"+298\",\n      \"name\": \"Faroe Islands\"\n    },\n    {\n      \"code\": \"+679\",\n      \"name\": \"Fiji\"\n    },\n    {\n      \"code\": \"+358\",\n      \"name\": \"Finland\"\n    },\n    {\n      \"code\": \"+33\",\n      \"name\": \"France\"\n    },\n    {\n      \"code\": \"+596\",\n      \"name\": \"French Antilles\"\n    },\n    {\n      \"code\": \"+594\",\n      \"name\": \"French Guiana\"\n    },\n    {\n      \"code\": \"+689\",\n      \"name\": \"French Polynesia\"\n    },\n    {\n      \"code\": \"+241\",\n      \"name\": \"Gabon\"\n    },\n    {\n      \"code\": \"+220\",\n      \"name\": \"Gambia\"\n    },\n    {\n      \"code\": \"+995\",\n      \"name\": \"Georgia\"\n    },\n    {\n      \"code\": \"+49\",\n      \"name\": \"Germany\"\n    },\n    {\n      \"code\": \"+233\",\n      \"name\": \"Ghana\"\n    },\n    {\n      \"code\": \"+350\",\n      \"name\": \"Gibraltar\"\n    },\n    {\n      \"code\": \"+30\",\n      \"name\": \"Greece\"\n    },\n    {\n      \"code\": \"+299\",\n      \"name\": \"Greenland\"\n    },\n    {\n      \"code\": \"+1 473\",\n      \"name\": \"Grenada\"\n    },\n    {\n      \"code\": \"+590\",\n      \"name\": \"Guadeloupe\"\n    },\n    {\n      \"code\": \"+1 671\",\n      \"name\": \"Guam\"\n    },\n    {\n      \"code\": \"+502\",\n      \"name\": \"Guatemala\"\n    },\n    {\n      \"code\": \"+224\",\n      \"name\": \"Guinea\"\n    },\n    {\n      \"code\": \"+245\",\n      \"name\": \"Guinea-Bissau\"\n    },\n    {\n      \"code\": \"+595\",\n      \"name\": \"Guyana\"\n    },\n    {\n      \"code\": \"+509\",\n      \"name\": \"Haiti\"\n    },\n    {\n      \"code\": \"+504\",\n      \"name\": \"Honduras\"\n    },\n    {\n      \"code\": \"+852\",\n      \"name\": \"Hong Kong SAR China\"\n    },\n    {\n      \"code\": \"+36\",\n      \"name\": \"Hungary\"\n    },\n    {\n      \"code\": \"+354\",\n      \"name\": \"Iceland\"\n    },\n    {\n      \"code\": \"+91\",\n      \"name\": \"India\"\n    },\n    {\n      \"code\": \"+62\",\n      \"name\": \"Indonesia\"\n    },\n    {\n      \"code\": \"+98\",\n      \"name\": \"Iran\"\n    },\n    {\n      \"code\": \"+964\",\n      \"name\": \"Iraq\"\n    },\n    {\n      \"code\": \"+353\",\n      \"name\": \"Ireland\"\n    },\n    {\n      \"code\": \"+972\",\n      \"name\": \"Israel\"\n    },\n    {\n      \"code\": \"+39\",\n      \"name\": \"Italy\"\n    },\n    {\n      \"code\": \"+225\",\n      \"name\": \"Ivory Coast\"\n    },\n    {\n      \"code\": \"+1 876\",\n      \"name\": \"Jamaica\"\n    },\n    {\n      \"code\": \"+81\",\n      \"name\": \"Japan\"\n    },\n    {\n      \"code\": \"+962\",\n      \"name\": \"Jordan\"\n    },\n    {\n      \"code\": \"+7 7\",\n      \"name\": \"Kazakhstan\"\n    },\n    {\n      \"code\": \"+254\",\n      \"name\": \"Kenya\"\n    },\n    {\n      \"code\": \"+686\",\n      \"name\": \"Kiribati\"\n    },\n    {\n      \"code\": \"+965\",\n      \"name\": \"Kuwait\"\n    },\n    {\n      \"code\": \"+996\",\n      \"name\": \"Kyrgyzstan\"\n    },\n    {\n      \"code\": \"+856\",\n      \"name\": \"Laos\"\n    },\n    {\n      \"code\": \"+371\",\n      \"name\": \"Latvia\"\n    },\n    {\n      \"code\": \"+961\",\n      \"name\": \"Lebanon\"\n    },\n    {\n      \"code\": \"+266\",\n      \"name\": \"Lesotho\"\n    },\n    {\n      \"code\": \"+231\",\n      \"name\": \"Liberia\"\n    },\n    {\n      \"code\": \"+218\",\n      \"name\": \"Libya\"\n    },\n    {\n      \"code\": \"+423\",\n      \"name\": \"Liechtenstein\"\n    },\n    {\n      \"code\": \"+370\",\n      \"name\": \"Lithuania\"\n    },\n    {\n      \"code\": \"+352\",\n      \"name\": \"Luxembourg\"\n    },\n    {\n      \"code\": \"+853\",\n      \"name\": \"Macau SAR China\"\n    },\n    {\n      \"code\": \"+389\",\n      \"name\": \"Macedonia\"\n    },\n    {\n      \"code\": \"+261\",\n      \"name\": \"Madagascar\"\n    },\n    {\n      \"code\": \"+265\",\n      \"name\": \"Malawi\"\n    },\n    {\n      \"code\": \"+60\",\n      \"name\": \"Malaysia\"\n    },\n    {\n      \"code\": \"+960\",\n      \"name\": \"Maldives\"\n    },\n    {\n      \"code\": \"+223\",\n      \"name\": \"Mali\"\n    },\n    {\n      \"code\": \"+356\",\n      \"name\": \"Malta\"\n    },\n    {\n      \"code\": \"+692\",\n      \"name\": \"Marshall Islands\"\n    },\n    {\n      \"code\": \"+596\",\n      \"name\": \"Martinique\"\n    },\n    {\n      \"code\": \"+222\",\n      \"name\": \"Mauritania\"\n    },\n    {\n      \"code\": \"+230\",\n      \"name\": \"Mauritius\"\n    },\n    {\n      \"code\": \"+262\",\n      \"name\": \"Mayotte\"\n    },\n    {\n      \"code\": \"+52\",\n      \"name\": \"Mexico\"\n    },\n    {\n      \"code\": \"+691\",\n      \"name\": \"Micronesia\"\n    },\n    {\n      \"code\": \"+1 808\",\n      \"name\": \"Midway Island\"\n    },\n    {\n      \"code\": \"+373\",\n      \"name\": \"Moldova\"\n    },\n    {\n      \"code\": \"+377\",\n      \"name\": \"Monaco\"\n    },\n    {\n      \"code\": \"+976\",\n      \"name\": \"Mongolia\"\n    },\n    {\n      \"code\": \"+382\",\n      \"name\": \"Montenegro\"\n    },\n    {\n      \"code\": \"+1664\",\n      \"name\": \"Montserrat\"\n    },\n    {\n      \"code\": \"+212\",\n      \"name\": \"Morocco\"\n    },\n    {\n      \"code\": \"+95\",\n      \"name\": \"Myanmar\"\n    },\n    {\n      \"code\": \"+264\",\n      \"name\": \"Namibia\"\n    },\n    {\n      \"code\": \"+674\",\n      \"name\": \"Nauru\"\n    },\n    {\n      \"code\": \"+977\",\n      \"name\": \"Nepal\"\n    },\n    {\n      \"code\": \"+31\",\n      \"name\": \"Netherlands\"\n    },\n    {\n      \"code\": \"+599\",\n      \"name\": \"Netherlands Antilles\"\n    },\n    {\n      \"code\": \"+1 869\",\n      \"name\": \"Nevis\"\n    },\n    {\n      \"code\": \"+687\",\n      \"name\": \"New Caledonia\"\n    },\n    {\n      \"code\": \"+64\",\n      \"name\": \"New Zealand\"\n    },\n    {\n      \"code\": \"+505\",\n      \"name\": \"Nicaragua\"\n    },\n    {\n      \"code\": \"+227\",\n      \"name\": \"Niger\"\n    },\n    {\n      \"code\": \"+234\",\n      \"name\": \"Nigeria\"\n    },\n    {\n      \"code\": \"+683\",\n      \"name\": \"Niue\"\n    },\n    {\n      \"code\": \"+672\",\n      \"name\": \"Norfolk Island\"\n    },\n    {\n      \"code\": \"+850\",\n      \"name\": \"North Korea\"\n    },\n    {\n      \"code\": \"+1 670\",\n      \"name\": \"Northern Mariana Islands\"\n    },\n    {\n      \"code\": \"+47\",\n      \"name\": \"Norway\"\n    },\n    {\n      \"code\": \"+968\",\n      \"name\": \"Oman\"\n    },\n    {\n      \"code\": \"+92\",\n      \"name\": \"Pakistan\"\n    },\n    {\n      \"code\": \"+680\",\n      \"name\": \"Palau\"\n    },\n    {\n      \"code\": \"+970\",\n      \"name\": \"Palestinian Territory\"\n    },\n    {\n      \"code\": \"+507\",\n      \"name\": \"Panama\"\n    },\n    {\n      \"code\": \"+675\",\n      \"name\": \"Papua New Guinea\"\n    },\n    {\n      \"code\": \"+595\",\n      \"name\": \"Paraguay\"\n    },\n    {\n      \"code\": \"+51\",\n      \"name\": \"Peru\"\n    },\n    {\n      \"code\": \"+63\",\n      \"name\": \"Philippines\"\n    },\n    {\n      \"code\": \"+48\",\n      \"name\": \"Poland\"\n    },\n    {\n      \"code\": \"+351\",\n      \"name\": \"Portugal\"\n    },\n    {\n      \"code\": \"+1 787\",\n      \"name\": \"Puerto Rico\"\n    },\n    {\n      \"code\": \"+974\",\n      \"name\": \"Qatar\"\n    },\n    {\n      \"code\": \"+262\",\n      \"name\": \"Reunion\"\n    },\n    {\n      \"code\": \"+40\",\n      \"name\": \"Romania\"\n    },\n    {\n      \"code\": \"+7\",\n      \"name\": \"Russia\"\n    },\n    {\n      \"code\": \"+250\",\n      \"name\": \"Rwanda\"\n    },\n    {\n      \"code\": \"+685\",\n      \"name\": \"Samoa\"\n    },\n    {\n      \"code\": \"+378\",\n      \"name\": \"San Marino\"\n    },\n    {\n      \"code\": \"+966\",\n      \"name\": \"Saudi Arabia\"\n    },\n    {\n      \"code\": \"+221\",\n      \"name\": \"Senegal\"\n    },\n    {\n      \"code\": \"+381\",\n      \"name\": \"Serbia\"\n    },\n    {\n      \"code\": \"+248\",\n      \"name\": \"Seychelles\"\n    },\n    {\n      \"code\": \"+232\",\n      \"name\": \"Sierra Leone\"\n    },\n    {\n      \"code\": \"+65\",\n      \"name\": \"Singapore\"\n    },\n    {\n      \"code\": \"+421\",\n      \"name\": \"Slovakia\"\n    },\n    {\n      \"code\": \"+386\",\n      \"name\": \"Slovenia\"\n    },\n    {\n      \"code\": \"+677\",\n      \"name\": \"Solomon Islands\"\n    },\n    {\n      \"code\": \"+27\",\n      \"name\": \"South Africa\"\n    },\n    {\n      \"code\": \"+500\",\n      \"name\": \"South Georgia and the South Sandwich Islands\"\n    },\n    {\n      \"code\": \"+82\",\n      \"name\": \"South Korea\"\n    },\n    {\n      \"code\": \"+34\",\n      \"name\": \"Spain\"\n    },\n    {\n      \"code\": \"+94\",\n      \"name\": \"Sri Lanka\"\n    },\n    {\n      \"code\": \"+249\",\n      \"name\": \"Sudan\"\n    },\n    {\n      \"code\": \"+597\",\n      \"name\": \"Suriname\"\n    },\n    {\n      \"code\": \"+268\",\n      \"name\": \"Swaziland\"\n    },\n    {\n      \"code\": \"+46\",\n      \"name\": \"Sweden\"\n    },\n    {\n      \"code\": \"+41\",\n      \"name\": \"Switzerland\"\n    },\n    {\n      \"code\": \"+963\",\n      \"name\": \"Syria\"\n    },\n    {\n      \"code\": \"+886\",\n      \"name\": \"Taiwan\"\n    },\n    {\n      \"code\": \"+992\",\n      \"name\": \"Tajikistan\"\n    },\n    {\n      \"code\": \"+255\",\n      \"name\": \"Tanzania\"\n    },\n    {\n      \"code\": \"+66\",\n      \"name\": \"Thailand\"\n    },\n    {\n      \"code\": \"+670\",\n      \"name\": \"Timor Leste\"\n    },\n    {\n      \"code\": \"+228\",\n      \"name\": \"Togo\"\n    },\n    {\n      \"code\": \"+690\",\n      \"name\": \"Tokelau\"\n    },\n    {\n      \"code\": \"+676\",\n      \"name\": \"Tonga\"\n    },\n    {\n      \"code\": \"+1 868\",\n      \"name\": \"Trinidad and Tobago\"\n    },\n    {\n      \"code\": \"+216\",\n      \"name\": \"Tunisia\"\n    },\n    {\n      \"code\": \"+90\",\n      \"name\": \"Turkey\"\n    },\n    {\n      \"code\": \"+993\",\n      \"name\": \"Turkmenistan\"\n    },\n    {\n      \"code\": \"+1 649\",\n      \"name\": \"Turks and Caicos Islands\"\n    },\n    {\n      \"code\": \"+688\",\n      \"name\": \"Tuvalu\"\n    },\n    {\n      \"code\": \"+1 340\",\n      \"name\": \"U.S. Virgin Islands\"\n    },\n    {\n      \"code\": \"+256\",\n      \"name\": \"Uganda\"\n    },\n    {\n      \"code\": \"+380\",\n      \"name\": \"Ukraine\"\n    },\n    {\n      \"code\": \"+971\",\n      \"name\": \"United Arab Emirates\"\n    },\n    {\n      \"code\": \"+44\",\n      \"name\": \"United Kingdom\"\n    },\n    {\n      \"code\": \"+1\",\n      \"name\": \"United States\"\n    },\n    {\n      \"code\": \"+598\",\n      \"name\": \"Uruguay\"\n    },\n    {\n      \"code\": \"+998\",\n      \"name\": \"Uzbekistan\"\n    },\n    {\n      \"code\": \"+678\",\n      \"name\": \"Vanuatu\"\n    },\n    {\n      \"code\": \"+58\",\n      \"name\": \"Venezuela\"\n    },\n    {\n      \"code\": \"+84\",\n      \"name\": \"Vietnam\"\n    },\n    {\n      \"code\": \"+1 808\",\n      \"name\": \"Wake Island\"\n    },\n    {\n      \"code\": \"+681\",\n      \"name\": \"Wallis and Futuna\"\n    },\n    {\n      \"code\": \"+967\",\n      \"name\": \"Yemen\"\n    },\n    {\n      \"code\": \"+260\",\n      \"name\": \"Zambia\"\n    },\n    {\n      \"code\": \"+255\",\n      \"name\": \"Zanzibar\"\n    },\n    {\n      \"code\": \"+263\",\n      \"name\": \"Zimbabwe\"\n    }\n  ]\n}', '2022-06-06 06:54:27', '2022-06-06 06:48:21'),
(26, 'country_code', '+91', '2022-06-06 07:52:41', '2022-06-06 07:52:26'),
(27, 'api_key_settings', '{\"google_map_api\":\"YOUR_MAP_API\",\"firebase_server_key\":\"SERVER_KEY\"}', '2022-11-22 06:57:40', NULL),
(29, 'range_units', 'kilometers', '2022-08-10 10:37:37', NULL),
(30, 'contact_us', '{\"contact_us\":\"<p>Enter Contact Us.<\\/p>\"}', '2022-11-05 07:53:48', NULL),
(31, 'system_tax_settings', '{\"tax_status\":\"on\",\"tax_name\":\"GST\",\"tax\":\"10\"}', '2022-11-26 06:31:11', NULL),

(32,'country_codes','{
  \n \"countries\":[\n 
  {\n \"code\": \"+93\",   \n  \"name\": \"Afghanistan\" \n  },
  {\n \"code\": \"+358\",  \n  \"name\": \"Åland Islands\"\n  },
  {\n \"code\": \"+355\",  \n  \"name\": \"Albania\"\n  },
  {\n \"code\": \"+213\",  \n  \"name\": \"Algeria\"\n  },
  {\n \"code\": \"+1 684\",\n  \"name\": \"American Samoa\"\n  },
  {\n \"code\": \"+376\",  \n  \"name\": \"Andorra\"\n  },
  {\n \"code\": \"+244\",  \n  \"name\": \"Angola\"\n  },
  {\n \"code\": \"+1 264\",\n  \"name\": \"Anguilla\"\n  },
  {\n \"code\": \"+672\",  \n  \"name\": \"Antarctica\"\n  },
  {\n \"code\": \"+1 268\",\n  \"name\": \"Antigua and Barbuda\"\n  },
  {\n \"code\": \"+54\",   \n  \"name\": \"Argentina\"\n  },
  {\n \"code\": \"+374\",  \n  \"name\": \"Armenia\"\n  },
  {\n \"code\": \"+297\",  \n  \"name\": \"Aruba\"\n  },
  {\n \"code\": \"+61\",   \n  \"name\": \"Australia\"\n  },
  {\n \"code\": \"+43\",   \n  \"name\": \"Austria\"\n  },
  {\n \"code\": \"+994\",  \n  \"name\": \"Azerbaijan\"\n  },
  {\n \"code\": \"+1 242\",\n  \"name\": \"Bahamas\"\n  },
  {\n \"code\": \"+973\",  \n  \"name\": \"Bahrain\"\n  },
  {\n \"code\": \"+880\",  \n  \"name\": \"Bangladesh\"\n  },
  {\n \"code\": \"+1 246\",\n  \"name\": \"Barbados\"\n  },
  {\n \"code\": \"+375\",  \n  \"name\": \"Belarus\"\n  },
  {\n \"code\": \"+32\",   \n  \"name\": \"Belgium\"\n  },
  {\n \"code\": \"+501\",  \n  \"name\": \"Belize\"\n  },
  {\n \"code\": \"+229\",  \n  \"name\": \"Benin\"\n  },
  {\n \"code\": \"+1 441\",\n  \"name\": \"Bermuda\"\n  },
  {\n \"code\": \"+975\",  \n  \"name\": \"Bhutan\"\n  },
  {\n \"code\": \"+591\",  \n  \"name\": \"Bolivia (Plurinational State of)\"\n  },
  {\n \"code\": \"+599\",  \n  \"name\": \"Bonaire, Sint Eustatius and Saba\"\n  },
  {\n \"code\": \"+387\",  \n  \"name\": \"Bosnia and Herzegovina\"\n  },
  {\n \"code\": \"+267\",  \n  \"name\": \"Botswana\"\n  },
  {\n \"code\": \"+47\",   \n  \"name\": \"Bouvet Island\"\n  },
  {\n \"code\": \"+55\",   \n  \"name\": \"Brazil\"\n  },
  {\n \"code\": \"+246\",  \n  \"name\": \"British Indian Ocean Territory\"\n  },
  {\n \"code\": \"+673\",  \n  \"name\": \"Brunei Darussalam\"\n  },
  {\n \"code\": \"+359\",  \n  \"name\": \"Bulgaria\"\n  },
  {\n \"code\": \"+226\",  \n  \"name\": \"Burkina Faso\"\n  },
  {\n \"code\": \"+257\",  \n  \"name\": \"Burundi\"\n  },
  {\n \"code\": \"+238\",  \n  \"name\": \"Cabo Verde\"\n  },
  {\n \"code\": \"+855\",  \n  \"name\": \"Cambodia\"\n  },
  {\n \"code\": \"+237\",  \n  \"name\": \"Cameroon\"\n  },
  {\n \"code\": \"+1\",    \n  \"name\": \"Canada\"\n  },
  {\n \"code\": \"+1 345\",\n  \"name\": \"Cayman Islands\"\n  },
  {\n \"code\": \"+236\",  \n  \"name\": \"Central African Republic\"\n  },
  {\n \"code\": \"+235\",  \n  \"name\": \"Chad\"\n  },
  {\n \"code\": \"+56\",   \n  \"name\": \"Chile\"\n  },
  {\n \"code\": \"+86\",   \n  \"name\": \"China\"\n  },
  {\n \"code\": \"+61\",   \n  \"name\": \"Christmas Island\"\n  },
  {\n \"code\": \"+61\",   \n  \"name\": \"Cocos (Keeling) Islands\"\n  },
  {\n \"code\": \"+57\",   \n  \"name\": \"Colombia\"\n  },
  {\n \"code\": \"+269\",  \n  \"name\": \"Comoros\"\n  },
  {\n \"code\": \"+242\",  \n  \"name\": \"Congo\"\n  },
  {\n \"code\": \"+243\",  \n  \"name\": \"Congo, Democratic Republic of the\"\n  },
  {\n \"code\": \"+682\",  \n  \"name\": \"Cook Islands\"\n  },
  {\n \"code\": \"+506\",  \n  \"name\": \"Costa Rica\"\n  },
  {\n \"code\": \"+225\",  \n  \"name\": \"Côte d\'Ivoire\"\n  },
  {\n \"code\": \"+385\",  \n  \"name\": \"Croatia\"\n  },
  {\n \"code\": \"+53\",   \n  \"name\": \"Cuba\"\n  },
  {\n \"code\": \"+599\",  \n  \"name\": \"Curaçao\"\n  },
  {\n \"code\": \"+357\",  \n  \"name\": \"Cyprus\"\n  },
  {\n \"code\": \"+420\",  \n  \"name\": \"Czechia\"\n  },
  {\n \"code\": \"+45\",   \n  \"name\": \"Denmark\"\n  },
  {\n \"code\": \"+253\",  \n  \"name\": \"Djibouti\"\n  },
  {\n \"code\": \"+1 767\",\n  \"name\": \"Dominica\"\n  },
  {\n \"code\": \"+1 809\",\n  \"name\": \"Dominican Republic\"\n  },
  {\n \"code\": \"+593\",  \n  \"name\": \"Ecuador\"\n  },
  {\n \"code\": \"+20\",   \n  \"name\": \"Egypt\"\n  },
  {\n \"code\": \"+503\",  \n  \"name\": \"El Salvador\"\n  },
  {\n \"code\": \"+240\",  \n  \"name\": \"Equatorial Guinea\"\n  },
  {\n \"code\": \"+291\",  \n  \"name\": \"Eritrea\"\n  },
  {\n \"code\": \"+372\",  \n  \"name\": \"Estonia\"\n  },
  {\n \"code\": \"+268\",  \n  \"name\": \"Eswatini\"\n  },
  {\n \"code\": \"+251\",  \n  \"name\": \"Ethiopia\"\n  },
  {\n \"code\": \"+500\",  \n  \"name\": \"Falkland Islands (Malvinas)\"\n  },
  {\n \"code\": \"+298\",  \n  \"name\": \"Faroe Islands\"\n  },
  {\n \"code\": \"+679\",  \n  \"name\": \"Fiji\"\n  },
  {\n \"code\": \"+358\",  \n  \"name\": \"Finland\"\n  },
  {\n \"code\": \"+33\",   \n  \"name\": \"France\"\n  },
  {\n \"code\": \"+594\",  \n  \"name\": \"French Guiana\"\n  },
  {\n \"code\": \"+689\",  \n  \"name\": \"French Polynesia\"\n  },
  {\n \"code\": \"+262\",  \n  \"name\": \"French Southern Territories\"\n  },
  {\n \"code\": \"+241\",  \n  \"name\": \"Gabon\"\n  },
  {\n \"code\": \"+220\",  \n  \"name\": \"Gambia\"\n  },
  {\n \"code\": \"+995\",  \n  \"name\": \"Georgia\"\n  },
  {\n \"code\": \"+49\",   \n  \"name\": \"Germany\"\n  },
  {\n \"code\": \"+233\",  \n  \"name\": \"Ghana\"\n  },
  {\n \"code\": \"+350\",  \n  \"name\": \"Gibraltar\"\n  },
  {\n \"code\": \"+30\",   \n  \"name\": \"Greece\"\n  },
  {\n \"code\": \"+299\",  \n  \"name\": \"Greenland\"\n  },
  {\n \"code\": \"+1 473\",\n  \"name\": \"Grenada\"\n  },
  {\n \"code\": \"+590\",  \n  \"name\": \"Guadeloupe\"\n  },
  {\n \"code\": \"+1 671\",\n  \"name\": \"Guam\"\n  },
  {\n \"code\": \"+502\",  \n  \"name\": \"Guatemala\"\n  },
  {\n \"code\": \"+44\",   \n  \"name\": \"Guernsey\"\n  },
  {\n \"code\": \"+224\",  \n  \"name\": \"Guinea\"\n  },
  {\n \"code\": \"+245\",  \n  \"name\": \"Guinea-Bissau\"\n  },
  {\n \"code\": \"+592\",  \n  \"name\": \"Guyana\"\n  },
  {\n \"code\": \"+509\",  \n  \"name\": \"Haiti\"\n  },
  {\n \"code\": \"+672\",  \n  \"name\": \"Heard Island and McDonald Islands\"\n  },
  {\n \"code\": \"+379\",  \n  \"name\": \"Holy See\"\n  },
  {\n \"code\": \"+504\",  \n  \"name\": \"Honduras\"\n  },
  {\n \"code\": \"+852\",  \n  \"name\": \"Hong Kong\"\n  },
  {\n \"code\": \"+36\",   \n  \"name\": \"Hungary\"\n  },
  {\n \"code\": \"+354\",  \n  \"name\": \"Iceland\"\n  },
  {\n \"code\": \"+91\",   \n  \"name\": \"India\"\n  },
  {\n \"code\": \"+62\",   \n  \"name\": \"Indonesia\"\n  },
  {\n \"code\": \"+98\",   \n  \"name\": \"Iran (Islamic Republic of)\"\n  },
  {\n \"code\": \"+964\",  \n  \"name\": \"Iraq\"\n  },
  {\n \"code\": \"+353\",  \n  \"name\": \"Ireland\"\n  },
  {\n \"code\": \"+44\",   \n  \"name\": \"Isle of Man\"\n  },
  {\n \"code\": \"+972\",  \n  \"name\": \"Israel\"\n  },
  {\n \"code\": \"+39\",   \n  \"name\": \"Italy\"\n  },
  {\n \"code\": \"+1\",    \n  \"name\": \"Jamaica\"\n  },
  {\n \"code\": \"+81\",   \n  \"name\": \"Japan\"\n  },
  {\n \"code\": \"+44\",   \n  \"name\": \"Jersey\"\n  },
  {\n \"code\": \"+962\",  \n  \"name\": \"Jordan\"\n  },
  {\n \"code\": \"+7 840\",\n  \"name\": \"Abkhazia\" }\
  \n  ]\n}', '2022-06-06 06:54:27', '2022-06-06 06:48:21'),
  (33, 'web_settings', '{
  \"social_media\": [
    {
      \"url\": \"https:\/\/www.instagram.com\/wrteam.in\/\",
      \"file\": \"instagram.png\"
    },
    {
      \"url\": \"https:\/\/www.linkedin.com\/company\/wrteam\",
      \"file\": \"5.png\"
    },
    {
      \"url\": \"https:\/\/www.facebook.com\/wrteam.in\",
      \"file\": \"3.png\"
    }
  ],
  \"web_title\": \"Download eDemand Mobile App Free\",
  \"web_tagline\": \"Get eDemand App Now!\",
  \"short_description\": \"Get the latest resources for downloading, installing, and updating eDemand app. Select your device platform and Use Our app and Enjoy Your Life.\",
  \"playstore_url\": \"https://play.google.com/store/apps/details?id=wrteam.edemand.customer.e_demand\",
  \"app_section_status\": \"1\",
  \"applestore_url\": \"https://testflight.apple.com/join/KdqqsTnH\",
  \"landing_page_title\": \"One Stop Solution For Your All Services\",
  \"step_1_title\": \"Request Service\",
  \"step_2_title\": \"Match with Providers\",
  \"step_3_title\": \"Monitor Progress\",
  \"step_4_title\": \"Receive Quality Results\",
  \"step_1_description\": \"Simply choose the service you need and request it through our user-friendly platform.\",
  \"step_2_description\": \"Simply choose the service you need and request it through our user-friendly platform.\",
  \"step_3_description\": \"Simply choose the service you need and request it through our user-friendly platform.\",
  \"step_4_description\": \"Simply choose the service you need and request it through our user-friendly platform.\",
  \"process_flow_description\": \"Learn how eDemand streamlines the service booking process for you. From selecting your desired service to tracking its progress, our user-friendly platform ensures a seamless experience.\",
  \"footer_description\": \"eDemand: Your premier destination for efficient and reliable on-demand services.\",
  \"process_flow_title\": \"How eDemand Work\",
  \"web_logo\": \"1712291207_ea8387289fbe73fb9692.svg\",
  \"web_favicon\": \"1712290334_2aea411f2bf5ddf3e429.svg\",
  \"web_half_logo\": \"1712290334_44294b1cf3becbbf12c8.svg\",
  \"footer_logo\": \"1712291207_465ead38b08223e85f9e.png\",
  \"landing_page_logo\": \"1712290334_c232acc0fea1307e8e97.png\",
  \"landing_page_backgroud_image\": \"1712290334_dc7aec05d060321c3202.jpeg\",
  \"step_1_image\": \"1712289102_e92d26a3ad71ef5ff95b.png\",
  \"step_2_image\": \"1712289102_93c2e95f5a7595a43558.png\",
  \"step_3_image\": \"1712289102_5f4cd2d127ceb36b69a0.png\",
  \"step_4_image\": \"1712289102_089f079a3cb8fd99f6c2.png\",
  \"service_section_title\": \"Essential Repair Services\",
  \"category_section_title\": \"Essential Repair Services\",
  \"category_section_description\": \"Discover top-notch services tailored to meet your every need. Our professionals are dedicated to providing reliable and efficient solutions for your home and beyond.\",
  \"service_section_description\": \"Discover top-notch services tailored to meet your every need. Our professionals are dedicated to providing reliable and efficient solutions for your home and beyond.\",
  \"rating_section_title\": \"What people say about our services\",
  \"rating_section_description\": \"Read feedback from our valued customers to see how we’ve made a difference for them. Your opinion matters to us—share your experience and help others make informed decisions.\",
  \"faq_section_title\": \"Frequently Asked Questions\",
  \"faq_section_description\": \"Find answers to common questions about our services, how to use the app, and more. If you have any additional questions, feel free to reach out to our support team for further assistance.\"
}', '2022-11-26 06:31:11', NULL),
 (34, 'sms_gateway_setting', '
 {\"twilio_endpoint\":\"YOUR_URL\",
 \"sms_gateway_method\":\"POST\",
 \"country_code_include\":\"0\",
 \"header_key\":[\"Authorization\"],
 \"header_value\":[\"Basic YOUR_TOKEN\"],
 \"params_key\":[\"Test param key\"],
 \"params_value\":[\"test param value\"],
 \"body_key\":[\"To\",\"From\",\"Body\"],\"body_value\":[\"{only_mobile_number}\",\"123245\",\"{message}\"]}', '2022-11-26 06:31:11', NULL),
 (35, 'notification_settings', '{
  \"provider_approved_sms\": \"true\",
  \"provider_approved_notification\": \"true\",
  \"provider_disapproved_sms\": \"true\",
  \"withdraw_request_approved_email\": \"true\",
  \"withdraw_request_disapproved_sms\": \"true\",
  \"withdraw_request_disapproved_notification\": \"true\",
  \"withdraw_request_received_sms\": \"true\",
  \"withdraw_request_send_email\": \"true\",
  \"new_rating_given_by_customer_email\": \"true\",
  \"new_rating_given_by_customer_sms\": \"true\",
  \"new_rating_given_by_customer_notification\": \"true\",
  \"rating_request_to_customer_email\": \"true\",
  \"rating_request_to_customer_sms\": \"true\",
  \"rating_request_to_customer_notification\": \"true\"
}', '2022-11-26 06:31:11', NULL);



-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `type_id` int(11) NOT NULL,
  `image` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - deactive \r\n1 - active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `percentage` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0- deactive | 1 - active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_default` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `slug`, `image`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Retro', 'retro', 'retro.png', 1, 1, '2021-12-03 13:33:03', '2022-08-09 10:20:22');

-- --------------------------------------------------------



--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `transaction_type` varchar(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `order_id` varchar(128) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `txn_id` varchar(256) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(12) DEFAULT NULL,
  `currency_code` varchar(5) DEFAULT NULL,
  `message` varchar(128) NOT NULL,
  `transaction_date` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(20) NOT NULL,
  `version` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `version`, `created_at`, `updated_at`) VALUES
(1, '1.0', '2022-11-14 04:55:25', '2022-11-14 04:55:25'),
(2, '1.1.0', '2022-12-01 13:08:33', '2022-12-01 13:08:33'),
(3, '1.2.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(4, '1.3.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(5, '1.4.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(6, '1.5.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(7, '1.6.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(8, '1.7.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(9, '1.8.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(10, '1.9.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(11, '2.0.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(12, '2.1.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(13, '2.2.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(14, '2.2.1', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(15, '2.3.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(16, '2.4.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(17, '2.5.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(18, '2.6.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(19, '2.7.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(20, '2.8.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33'),
(21, '2.9.0', '2022-12-06 13:08:33', '2022-12-06 13:08:33');
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fcm_id` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `api_key` text NOT NULL,
  `friends_code` varchar(255) DEFAULT NULL,
  `referral_code` varchar(255) DEFAULT NULL,
  `city_id` int(50) DEFAULT 0,
  `city` varchar(252) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `balance`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `fcm_id`, `image`, `api_key`, `friends_code`, `referral_code`, `city_id`, `city`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'admin@gmail.com', '$2y$12$VZ4t32yfrHVie.442oPFf.r1j2H2ugEnsdAjA58KlO3PqgeiUJlEK', 'admin@gmail.com', 2000200, NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1669891890, 1, 'Admin', 'istrator', 'ADMIN', '9876543210', 'eQHx3ANrRLmbdIO7kK8nek:APA91bHuI19SM6qptCWJ3plidwFOhVg2Rg77k4oTuMQ0Xmd521vDBBZKzFX9yLKhe5yEI1SFVvT53Dt8XeIP0j3vxjUtJBj3D7OkgpoSJTHSdznekuew8CL_Ye-MBAjU3ke4lZtgVyI9', '1669274676_d851d48dfbaf52438615.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NjkwMDIwMjEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDA1MzgwMjEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMSJ9.bxPMyvDEFrkA1yq2lHhUhACwidQTsoR86te8gofHspM', '45dsrwr', 'MY_CODE', 10, '', '23.2330718', '69.6442306', '2022-05-24 04:44:29', '2022-05-24 04:44:29');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_tokens`
--

CREATE TABLE `users_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role` varchar(512) NOT NULL COMMENT '1. super admin\r\n2. admin\r\n3. client',
  `permissions` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `role`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 1, '1', NULL, '2022-07-21 04:18:12', '2022-08-11 07:36:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_id` (`partner_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);


--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delete_general_notification`
--
ALTER TABLE `delete_general_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);


-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `order_services`
--
ALTER TABLE `order_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`,`service_id`);

--
-- Indexes for table `partner_details`
--
ALTER TABLE `partner_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`partner_id`),
  ADD KEY `address_id` (`address_id`(768));

--
-- Indexes for table `partner_timings`
--
ALTER TABLE `partner_timings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Indexes for table `payment_request`
--
ALTER TABLE `payment_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`partner_id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`category_id`,`tax_id`),
  ADD KEY `tax_id` (`tax_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `tax_id_2` (`tax_id`);

--
-- Indexes for table `services_ratings`
--
ALTER TABLE `services_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`service_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);



-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `users_tokens`
--
ALTER TABLE `users_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delete_general_notification`
--
ALTER TABLE `delete_general_notification`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_services`
--
ALTER TABLE `order_services`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_details`
--
ALTER TABLE `partner_details`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_timings`
--
ALTER TABLE `partner_timings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_request`
--
ALTER TABLE `payment_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services_ratings`
--
ALTER TABLE `services_ratings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;



-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;

--
-- AUTO_INCREMENT for table `users_tokens`
--
ALTER TABLE `users_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;




ALTER TABLE `categories` ADD `dark_color` VARCHAR(255) NOT NULL AFTER `updated_at`, ADD `light_color` VARCHAR(255) NOT NULL AFTER `dark_color`;
ALTER TABLE `order_services` ADD `discount_price` DOUBLE NOT NULL AFTER `price`;
ALTER TABLE `sections` ADD `status` TEXT NOT NULL AFTER `updated_at`;
ALTER TABLE `sections` ADD `limit` TEXT NOT NULL AFTER `status`;
ALTER TABLE `users` ADD `country_code` TEXT NOT NULL AFTER `phone`;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


CREATE TABLE `cash_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `commison` int(11) NOT NULL,
  `status` text NOT NULL,
  `partner_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `settlement_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL, 
  `message` text NOT NULL,
  `date` date NOT NULL,
  `amount` text NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `users` ADD `payable_commision` TEXT  AFTER `updated_at`;

ALTER TABLE `orders` ADD `payment_status` TEXT  AFTER `updated_at`;

ALTER TABLE `orders` ADD `otp` INT NULL ;
ALTER TABLE `orders` ADD `work_started_proof` TEXT NULL ;
ALTER TABLE `orders` ADD `work_completed_proof` TEXT NULL;
ALTER TABLE `orders` ADD `parent_id` INT NULL;


ALTER TABLE `services` ADD `other_images` TEXT NOT NULL AFTER `updated_at`;
ALTER TABLE `services` ADD `long_description` LONGTEXT NOT NULL AFTER `updated_at`;
ALTER TABLE `services` ADD `files` TEXT NOT NULL AFTER `other_images`;
ALTER TABLE `services` ADD `faqs` TEXT NOT NULL AFTER `files`;
ALTER TABLE `partner_details` ADD `long_description` LONGTEXT NOT NULL AFTER `updated_at`;
ALTER TABLE `partner_details` ADD `other_images` TEXT NOT NULL AFTER `updated_at`;

ALTER TABLE `orders` ADD `order_latitude` TEXT NULL AFTER `parent_id`;
ALTER TABLE `orders` ADD `order_longitude` TEXT NULL AFTER `order_latitude`;

ALTER TABLE `sections` ADD `rank` INT NULL AFTER `limit`;
ALTER TABLE `services` ADD `at_store` TEXT NULL AFTER `faqs`;
ALTER TABLE `services` ADD `at_doorstep` TEXT NULL AFTER `at_store`;

ALTER TABLE `transactions` ADD `subscription_id` TEXT NULL AFTER `updated_at`;

ALTER TABLE `users` ADD `strip_id` TEXT NULL AFTER `payable_commision`;



CREATE TABLE `partner_subscriptions` (
  `subscription_id` text NOT NULL,
  `status` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_payment` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `duration` text NOT NULL,
  `price` text NOT NULL,
  `discount_price` text NOT NULL,
  `publish` text DEFAULT NULL,
  `order_type` text NOT NULL,
  `max_order_limit` text DEFAULT NULL,
  `service_type` text NOT NULL,
  `max_service_limit` text DEFAULT NULL,
  `tax_type` text NOT NULL,
  `tax_id` text NOT NULL,
  `is_commision` text NOT NULL,
  `commission_threshold` text DEFAULT NULL,
  `commission_percentage` text DEFAULT NULL,
  `transaction_id` text DEFAULT NULL,
  `tax_percentage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `duration` text NOT NULL,
  `price` double NOT NULL,
  `discount_price` double NOT NULL,
  `publish` text NOT NULL,
  `order_type` text NOT NULL,
  `max_order_limit` text DEFAULT NULL,
  `service_type` text NOT NULL,
  `max_service_limit` text DEFAULT NULL,
  `tax_type` text NOT NULL,
  `tax_id` text DEFAULT NULL,
  `is_commision` text NOT NULL,
  `commission_threshold` text DEFAULT NULL,
  `commission_percentage` text DEFAULT NULL,
  `status` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `users` ADD `web_fcm_id` TEXT NULL AFTER `strip_id`;
ALTER TABLE `users` ADD `platform` TEXT NULL AFTER `web_fcm_id`;
ALTER TABLE `partner_details` ADD `at_store` INT NULL AFTER `long_description`;
ALTER TABLE `partner_details` ADD `at_doorstep` INT NULL AFTER `at_store`;
ALTER TABLE `notifications` ADD `target` TEXT NULL AFTER `updated_at`;
ALTER TABLE `transactions` ADD `reference` TEXT NULL AFTER `updated_at`;

ALTER TABLE `partner_subscriptions` CHANGE `created_at` `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `partner_subscriptions` CHANGE `updated_at` `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;


CREATE TABLE `country_codes` (
  `name` text NOT NULL,
  `code` text NOT NULL,
  `created_at` date DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_default` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `country_codes` ADD `updated_at` DATE NULL AFTER `is_default`;

INSERT INTO `country_codes` (`name`, `code`, `created_at`, `id`, `is_default`) VALUES ('India', '+91', NULL, '1', '1');

ALTER TABLE `orders` ADD `promocode_id` INT NULL AFTER `order_longitude`;

CREATE TABLE `settlement_cashcollection_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_request_id` int(11) DEFAULT NULL,
  `commission_percentage` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `type` text NOT NULL COMMENT ' -cash_collection_by_admin  - cod\r\n    -cash_collection_by_provider - code\r\n    -received_by_admin - online_payment\r\n    -settled_by_settlement - manual settlement by admin\r\n    -settled_by_payment_request - withrequest approved by admin',
  `date` date NOT NULL,
  `time` time NOT NULL,
  `amount` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `commission_amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `admin_contact_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `message` longtext NOT NULL,
  `subject` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `services` ADD `approved_by_admin` TEXT ;
ALTER TABLE `partner_details` ADD `need_approval_for_the_service` TEXT ;


INSERT INTO settlement_cashcollection_history (provider_id, order_id, payment_request_id, commission_percentage, message, type, date, time, amount, total_amount, commission_amount)
SELECT 
    user_id AS provider_id,
    NULL AS order_id,
    id AS payment_request_id,
    NULL AS commission_percentage,
    remarks AS message,
    'settled_by_payment_request' AS type,
    DATE(created_at) AS date,
    TIME(created_at) AS time,
    amount,
    amount AS total_amount,
    NULL AS commission_amount
FROM payment_request
WHERE status = 3;


INSERT INTO settlement_cashcollection_history (provider_id, order_id, payment_request_id, commission_percentage, message, type, date, time, amount, total_amount, commission_amount)
SELECT 
    user_id AS provider_id,
    CASE 
        WHEN status = 'provider_cash_received' THEN order_id
        WHEN status = 'admin_cash_received' THEN NULL
    END AS order_id,
    NULL AS payment_request_id,
    NULL AS commission_percentage,
    message,
    CASE 
        WHEN status = 'provider_cash_recevied' THEN 'cash_collection_by_provider'
        WHEN status = 'admin_cash_recevied' THEN 'cash_collection_by_admin'
    END AS type,
    DATE(date) AS date,
    TIME(date) AS time, -- Extract time from the date
    commison AS amount,
    commison AS total_amount,
    null AS commission_amount
FROM cash_collection;


INSERT INTO settlement_cashcollection_history (provider_id, order_id, payment_request_id, commission_percentage, message, type, date, time, amount, total_amount, commission_amount)
SELECT 
    provider_id,
    NULL AS order_id,
    NULL AS payment_request_id,
    NULL AS commission_percentage,
    message,
    'settled_by_settlement' AS type,
    DATE(date) AS date,
    NOW() AS time,
    amount,
    amount AS total_amount,
    NULL AS commission_amount
FROM settlement_history;


UPDATE settings 
SET value = JSON_SET(
    value,
    '$.company_map_location', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7333.306105038601!2d69.62475796805171!3d23.219311325645396!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39511e44b301f483%3A0xe8396658a3fed5b!2sMirjapar%2C%20Bhuj%2C%20Gujarat%20370040!5e0!3m2!1sen!2sin!4v1711532768938!5m2!1sen!2sin\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'
)
WHERE variable = 'general_settings';



CREATE TABLE `chats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `booking_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `message` longtext NOT NULL,
  `file` longtext DEFAULT NULL,
  `file_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `e_id` int(11) NOT NULL,
  `sender_type` int(11) NOT NULL COMMENT '0 : Admin\r\n1: Provider\r\n2: customer',
  `receiver_type` int(11) NOT NULL COMMENT '0 : Admin\r\n1: Provider\r\n2: customer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `enquiries` (
  `id` int(60) NOT NULL AUTO_INCREMENT,
  `customer_id` int(250) DEFAULT NULL,
  `title` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0: Open 1:Close',
  `userType` int(11) NOT NULL COMMENT '0 : Admin\r\n1: Provider\r\n2: customer\r\n',
  `date` date NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `provider_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `partner_details` ADD `chat` TEXT  NULL  AFTER `need_approval_for_the_service`;


ALTER TABLE `users` ADD `panel_fcm_id` TEXT NULL AFTER `platform`;


UPDATE settings 
SET value = JSON_SET(
    value,
    '$.cod_setting', '1'
)
WHERE variable = 'payment_gateways_settings';


UPDATE settings 
SET value = JSON_SET(
    value,
    '$.payment_gateway_setting', '1'
)
WHERE variable = 'payment_gateways_settings';

-- version 2.6.0
CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `subject` text NOT NULL,
  `to` text NOT NULL,
  `template` longtext NOT NULL,
  `bcc` text DEFAULT NULL,
  `cc` text DEFAULT NULL,
  `parameters` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `user_id` text DEFAULT NULL,
  `subject` text NOT NULL,
  `type` text NOT NULL,
  `parameters` text NOT NULL,
  `bcc` text DEFAULT NULL,
  `cc` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `users` ADD `unsubscribe_email` VARCHAR(255) NOT NULL DEFAULT '1' AFTER `panel_fcm_id`;
ALTER TABLE `users` ADD `uid` VARCHAR(255) NULL AFTER `unsubscribe_email`;
ALTER TABLE `users` ADD `loginType` VARCHAR(255) NULL AFTER `uid`;
ALTER TABLE `users` ADD `countryCodeName` VARCHAR(255) NULL AFTER `loginType`;



ALTER TABLE `partner_details` ADD `pre_chat` VARCHAR(255) NOT NULL DEFAULT '1' AFTER `chat`;

UPDATE settings 
SET value = JSON_SET(
    value,
    '$.image_compression_quality', '70'
)
WHERE variable = 'general_settings';


UPDATE settings 
SET value = JSON_SET(
    value,
    '$.maxFilesOrImagesInOneMessage', '5'
)
WHERE variable = 'general_settings';


UPDATE settings 
SET value = JSON_SET(
    value,
    '$.maxFileSizeInMBCanBeSent', '80'
)
WHERE variable = 'general_settings';


UPDATE settings 
SET value = JSON_SET(
    value,
    '$.maxCharactersInATextMessage', '250'
)
WHERE variable = 'general_settings';


UPDATE settings 
SET value = JSON_SET(
    value,
    '$.android_google_interstitial_id', 'your_android_google_interstitial_id'
)
WHERE variable = 'general_settings';

UPDATE settings 
SET value = JSON_SET(
    value,
    '$.android_google_banner_id', 'your_android_google_banner_id'
)
WHERE variable = 'general_settings';

UPDATE settings 
SET value = JSON_SET(
    value,
    '$.ios_google_interstitial_id', 'your_ios_google_interstitial_id'
)
WHERE variable = 'general_settings';

UPDATE settings 
SET value = JSON_SET(
    value,
    '$.ios_google_banner_id', 'your_ios_google_banner_id'
)
WHERE variable = 'general_settings';

UPDATE settings 
SET value = JSON_SET(
    value,
    '$.decimal_point', '0'
)
WHERE variable = 'general_settings';

UPDATE settings 
SET value = JSON_SET(
    value,
    '$.customer_current_version_android_app', '1.0.0'
)
WHERE variable = 'general_settings';

UPDATE settings 
SET value = JSON_SET(
    value,
    '$.customer_current_version_ios_app', '1.0.0'
)
WHERE variable = 'general_settings';

UPDATE settings 
SET value = JSON_SET(
    value,
    '$.provider_current_version_android_app', '1.0.0'
)
WHERE variable = 'general_settings';

UPDATE settings 
SET value = JSON_SET(
    value,
    '$.provider_current_version_ios_app', '1.0.0'
)
WHERE variable = 'general_settings';

ALTER TABLE `languages` ADD `is_default` VARCHAR(255) NOT NULL DEFAULT '0' AFTER `created_at`;
UPDATE `languages` SET `is_default`='1' WHERE code="en";
INSERT INTO `email_templates` (`id`, `type`, `subject`, `to`, `template`, `bcc`, `cc`, `parameters`) VALUES
(1, 'provider_approved', 'Approval of Registration Request', 'null', '<p>Dear [[provider_name]],</p>\n<p>We are thrilled to inform you that your request has been approved! This is a significant milestone, and we cant wait to witness the impact your solutions will have on our operations.</p>\n<p>Here are the details you need:</p>\n<p>Provider ID: [[provider_id]]<br />Company Name: [[provider_name]]</p>\n<p>As we move forward, please feel free to reach out with any questions or additional information you may require. Were here to ensure a smooth and successful collaboration.</p>\n<p>Thank you once again for your outstanding work and dedication. We are looking forward to a fruitful partnership!</p>\n<p>Warm regards,</p>\n<p>[[company_logo]]</p>\n<p>[[company_contact_info]]</p>', 'wrteam.test@gmail;.com', 'wrteam.test@gmail.com', '[\"provider_name\",\"provider_id\",\"provider_name\",\"company_logo\",\"company_contact_info\"]'),
(2, 'provider_disapproved', 'Rejection of Registration Request', 'null', '<p>Dear [[provider_name]],</p>\r\n<p>&nbsp;</p>\r\n<p>I regret to inform you that your registration request has been declined. After careful review and consideration, we have determined that your offerings do not align with our current needs or standards.</p>\r\n<p>&nbsp;</p>\r\n<p>While we appreciate your interest in partnering with us, we believe it\s in both of our best interests to explore other opportunities that better fit our requirements at this time.</p>\r\n<p>&nbsp;</p>\r\n<p>Please know that this decision was not made lightly, and we genuinely value the effort you put into your application. We encourage you to continue pursuing opportunities that align more closely with your expertise and offerings.</p>\r\n<p>&nbsp;</p>\r\n<p>Thank you for your understanding. Should you have any questions or require further clarification, please do not hesitate to reach out.</p>\r\n<p>&nbsp;</p>\r\n<p>I wish you all the best in your future endeavors.</p>\r\n<p>&nbsp;</p>\r\n<p>Warm regards,</p>\r\n<p>[[company_name]]</p>\r\n<p>[[company_contact_info]]</p>\r\n<p>&nbsp;</p>', '', '', '[\"provider_name\",\"company_name\",\"company_contact_info\"]'),
(3, 'withdraw_request_approved', 'Withdrawal Request Approved', 'null', '<p>Dear [[Provider Name]],</p>\r\n<p>&nbsp;</p>\r\n<p>We are pleased to inform you that your withdrawal request has been approved. If you have any questions or concerns regarding this transaction, please do not hesitate to contact us. Thank you for choosing our services. We look forward to providing you with excellent service in the future.</p>\r\n<p>&nbsp;</p>\r\n<p>Your Request is for: [[Amount]] [[Currency]].</p>\r\n<p>&nbsp;</p>\r\n<p>Best Regards,</p>\r\n<p>[[Company Name]]</p>\r\n<p>&nbsp;</p>', '', '', '[\"Provider Name\",\"Amount\",\"Currency\",\"Company Name\"]'),
(4, 'withdraw_request_disapproved', 'Withdrawal Request Disapproved', 'null', '<p>Dear [[Provider Name]],</p>\r\n<p>&nbsp;</p>\r\n<p>We regret to inform you that your withdrawal request has been disapproved. If you have any questions or concerns regarding this decision, please do not hesitate to contact us. Thank you for choosing our services. We look forward to providing you with excellent service in the future.</p>\r\n<p>&nbsp;</p>\r\n<p>Your Request is for: [[Amount]] [[Currency]].</p>\r\n<p>&nbsp;</p>\r\n<p>Best Regards, [[Company Name]]</p>\r\n<p>&nbsp;</p>', '', '', '[\"Provider Name\",\"Amount\",\"Currency\",\"Company Name\"]'),
(5, 'payment_settlement', 'Payment Settlement', 'null', '<p>Dear [[provider_name]],</p>\r\n<p>&nbsp;</p>\r\n<p>I am writing to confirm that we have credited the agreed-upon amount of [[currency]][[amount]] to your account, as per our agreement. This payment settles the outstanding balance for the services provided by your company.</p>\r\n<p>&nbsp;</p>\r\n<p>We understand the importance of timely payments for maintaining a healthy business relationship, and we strive to meet our payment obligations promptly. Please check your account and confirm that the payment has been received. If you have any questions or concerns, please do not hesitate to contact us.</p>\r\n<p>&nbsp;</p>\r\n<p>[[company_contact_info]]</p>\r\n<p>&nbsp;</p>\r\n<p>Thank you for your prompt attention to this matter. We look forward to continuing our mutually beneficial partnership.</p>\r\n<p>&nbsp;</p>\r\n<p>Best Regards,</p>\r\n<p>[[company_name]].</p>\r\n<p>&nbsp;</p>', '', '', '[\"provider_name\",\"currency\",\"amount\",\"company_contact_info\",\"company_name\"]'),
(6, 'service_disapproved', 'Rejection of Service Request', 'null', '<p>Dear [[Provider Name]],</p>\r\n<p>&nbsp;</p>\r\n<p>We regret to inform you that your request for service approval has been disapproved. After thorough evaluation and consideration, our team has determined that your request does not meet the necessary criteria for approval.</p>\r\n<p>&nbsp;</p>\r\n<p>We understand that this decision may be disappointing for you, but please know that we carefully reviewed your request and made the best decision based on our policies and guidelines.</p>\r\n<p>&nbsp;</p>\r\n<p>If you have any questions or concerns regarding the decision, please do not hesitate to reach out to us. We would be happy to discuss any specific concerns that you may have.</p>\r\n<p>&nbsp;</p>\r\n<p>Contact us:</p>\r\n<p>&nbsp;</p>\r\n<p>[[Company Contact Info]]</p>\r\n<p>&nbsp;</p>\r\n<p>Best Regards,</p>\r\n<p>&nbsp;</p>\r\n<p>[[Company Name]]</p>\r\n<p>&nbsp;</p>', '', '', '[\"Provider Name\",\"Company Contact Info\",\"Company Name\"]'),
(7, 'service_approved', 'Approval of Service Request', 'null', '<p>Dear [[Provider Name]],</p>\r\n<p>&nbsp;</p>\r\n<p>I am pleased to inform you that your request for service approval has been approved. After careful review and consideration, our team has determined that your request meets all the necessary criteria and is eligible for approval.</p>\r\n<p>&nbsp;</p>\r\n<p>Once again, congratulations on your approval status! We look forward to working with you and supporting your goals.</p>\r\n<p>&nbsp;</p>\r\n<p>If you have any questions or concerns, please do not hesitate to contact us.</p>\r\n<p>&nbsp;</p>\r\n<p>Contact Us:</p>\r\n<p>[[Company Contact Info]]</p>\r\n<p>&nbsp;</p>\r\n<p>Best Regards,</p>\r\n<p>[[Company Name]]</p>', '', '', '[\"Provider Name\",\"Company Contact Info\",\"Company Name\"]'),
(8, 'user_account_active', 'Account activation confirmation', 'null', '<p>Dear [[user_name]],</p>\r\n<p>&nbsp;</p>\r\n<p>We are pleased to inform you that your account has been successfully activated. You can now log in to your account and start using our services. If you have any questions or need any assistance, feel free to contact us.</p>\r\n<p>&nbsp;</p>\r\n<p>Thank you again for choosing our services. We look forward to doing business with you again.</p>\r\n<p>&nbsp;</p>\r\n<p>Best Regards,</p>\r\n<p>[[company_name]]</p>\r\n<p>&nbsp;</p>', '', '', '[\"user_name\",\"company_name\"]'),
(9, 'user_account_deactive', 'Account Deactivation Confirmation', 'null', '<div>Dear [[user_name]],</div>\r\n<div>&nbsp;</div>\r\n<div>We are sorry to inform you that your account has been deactivated.</div>\r\n<div>&nbsp;</div>\r\n<div>[[user_id]][[user_name]][[company_name]][[site_url]][[company_contact_info]][[company_logo]][[company_contact_info]][[company_logo]]</div>\r\n<div>&nbsp;</div>\r\n<div>If you have any questions or need any assistance, feel free to contact us.</div>\r\n<div>&nbsp;</div>\r\n<div>Thank you again for choosing our services. We look forward to doing business with you again.</div>\r\n<div>&nbsp;</div>\r\n<div>Best Regards,</div>\r\n<div>[[company_name]]</div>\r\n<p>&nbsp;</p>', NULL, '', '[\"user_name\",\"user_id\",\"user_name\",\"company_name\",\"site_url\",\"company_contact_info\",\"company_logo\",\"company_contact_info\",\"company_logo\",\"company_name\"]'),
(10, 'booking_status_updated', 'Booking Confirmation', 'null', '<p>Subject: Booking Confirmation</p>\r\n<p>Dear [[user_name]],</p>\r\n<p>Thank you for choosing [Service Name]. We are pleased to confirm your booking.</p>\r\n<p>Booking Details:</p>\r\n<p>Service Name: [[booking_service_names]]<br />Booking Date: [[booking_date]]<br />Time: [[booking_time]]<br />Address: [[booking_address]]</p>\r\n<p>We look forward to serving you. If you have any questions or need to make changes to your booking, please dont hesitate to contact us at [Contact Information].</p>\r\n<p>Best regards,</p>\r\n<p>[[company_name]]<br />[[company_contact_info]]</p>', '', '', '[\"user_name\",\"booking_service_names\",\"booking_date\",\"booking_time\",\"booking_address\",\"company_name\",\"company_contact_info\"]'),
(11, 'new_booking_confirmation_to_customer', 'Booking Confirmation', 'null', '<p>Dear [[user_name]],</p>\r\n<p>Thank you for choosing [[provider_name]]. We are pleased to confirm your booking.</p>\r\n<p>Booking Details:</p>\r\n<p>Booking Date: [[booking_date]]<br />Time: [[booking_time]]<br />Address: [[booking_address]]<br />Services include: [[booking_service_names]]</p>\r\n<p>We look forward to serving you. If you have any questions or need to make changes to your booking, please dont hesitate to contact us at [Contact Information].</p>\r\n<p>Best regards,</p>\r\n<p>[[company_name]]<br />[[company_contact_info]]</p>', '', '', '[\"user_name\",\"provider_name\",\"booking_date\",\"booking_time\",\"booking_address\",\"booking_service_names\",\"company_name\",\"company_contact_info\"]'),
(12, 'new_booking_received_for_provider', ' New Booking Received ', 'null', '<p>Dear [[provider_name]],</p>\r\n<p>We are delighted to inform you that a new booking has been received through our platform.</p>\r\n<p>Booking Details:</p>\r\n<p>Service: [[booking_service_names]]<br />Booking Date: [[booking_date]]<br />Time: [[booking_time]]<br />Customer: [[user_name]]</p>\r\n<p>Please ensure that you are prepared for the appointment and ready to provide exceptional service to our valued customer.</p>\r\n<p>If you have any questions or require further information regarding this booking, feel free to reach out to us.</p>\r\n<p>Thank you for being a part of our service and for your commitment to excellence.</p>\r\n<p>Best regards,</p>\r\n<p>[[company_name]]<br />[[company_contact_info]]</p>', '', '', '[\"provider_name\",\"booking_service_names\",\"booking_date\",\"booking_time\",\"user_name\",\"company_name\",\"company_contact_info\"]'),
(13, 'provider_update_information', 'Provider Update Information', 'null', '<p>Dear [[company_name]]</p>\r\n<p>I hope this message finds you well.</p>\r\n<p>I wanted to inform you that [Provider Name] has recently updated their details. Please find the updated information below:</p>\r\n<p>Provider ID: [[provider_id]]</p>\r\n<p>[[provider_name]] has taken the initiative to ensure that their information is accurate and up-to-date in our records. If there are any further steps required from our end regarding this update, please let us know.</p>\r\n<p>Thank you for your attention to this matter.</p>\r\n<p>Best regards,</p>\r\n<p>[[company_name]]</p>\r\n<p>[[company_contact_info]]</p>', '', '', '[\"company_name\",\"provider_id\",\"provider_name\",\"company_name\",\"company_contact_info\"]'),
(14, 'new_provider_registerd', 'New Provider Registered', 'null', '<p>Subject: New Provider Registered</p>\r\n<p>Dear [[company_name]],</p>\r\n<p>I hope this email finds you well.</p>\r\n<p>I am pleased to inform you that a new provider has registered with us. Here are the details of the new registration:</p>\r\n<p>Provider Name: [[provider_name]]<br />Provider ID: [[provider_id]]</p>\r\n<p>We welcome [[provider_name]] to our platform and look forward to exploring potential collaborations with them. Kindly review the provided information and proceed with the necessary steps to onboard them into our system.</p>\r\n<p>If you require any further details or assistance regarding this registration, please do not hesitate to reach out to me.</p>\r\n<p>Thank you for your attention to this matter.</p>\r\n<p>Best regards,</p>\r\n<p>[[company_name]]<br />[[company_contact_info]]</p>', '', '', '[\"company_name\",\"provider_name\",\"provider_id\",\"provider_name\",\"company_name\",\"company_contact_info\"]'),
(15, 'withdraw_request_received', 'Withdrawal Request Received', 'null', '<p>Subject: Withdrawal Request Received</p>\r\n<p>Dear [[company_name]],</p>\r\n<p>I hope this email finds you well.</p>\r\n<p>I wanted to bring to your attention that we have received a withdrawal request from one of our providers. Here are the details of the request:</p>\r\n<p>Provider Name: [[provider_name]]<br />Provider ID: [[provider_id]]<br />Amount: [[amount]]<br />Currency: [[currency]]</p>\r\n<p>Please review this withdrawal request at your earliest convenience and proceed with the necessary steps to process it accordingly. If you need any additional information or assistance, please do not hesitate to reach out to me.</p>\r\n<p>Thank you for your attention to this matter.</p>\r\n<p>Best regards,</p>\r\n<p>[[Your Name]]</p>\r\n<p>[[Your Position]]</p>\r\n<p>[[Your Contact Information]]</p>', '', '', '[\"company_name\",\"provider_name\",\"provider_id\",\"amount\",\"currency\",\"Your Name\",\"Your Position\",\"Your Contact Information\"]'),
(16, 'new_rating_given_by_customer', ' New Rating Received from a Customer', 'null', '<p><strong>Subject:</strong> New Rating Received from a Customer !</p>\r\n<p><strong>Dear [[provider_name]],</strong></p>\r\n<p>We wanted to let you know that a customer has recently submitted a rating for your service.</p>\r\n<p>To view the details and feedback, please log in to your provider dashboard at your convenience.</p>\r\n<p>Thank you for your continued commitment to providing excellent service!</p>\r\n<p>Best regards,<br />[[company_name]]</p>\r\n<p>[[company_contact_info]]</p>', '', '', '[\"provider_name\",\"company_name\",\"company_contact_info\"]'),
(17, 'rating_request_to_customer', 'We Value Your Feedback – Please Share Your Rating!', 'null', '<p><strong>Subject:</strong> We Value Your Feedback &ndash; Please Share Your Rating!!</p>\r\n<p><strong>Dear [[user_name]],</strong></p>\r\n<p>We hope you enjoyed your recent experience with us!</p>\r\n<p>Your feedback is incredibly important and helps us to continue improving our services. We would greatly appreciate it if you could take a moment to rate your experience by clicking the link below:</p>\r\n<p>&nbsp;</p>\r\n<p>Thank you for your time and for choosing [[company_name]]. If you have any additional comments or suggestions, please feel free to reply to this email.</p>\r\n<p>Best regards,<br />[[provider_name]]<br /><br /></p>', '', '', '[\"user_name\",\"company_name\",\"provider_name\"]');


CREATE TABLE `sms_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `template` longtext NOT NULL,
  `parameters` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `title` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `sms_templates` (`id`, `type`, `template`, `parameters`, `created_at`, `updated_at`, `title`) VALUES
(1, 'provider_approved', 'Dear [[provider_name]], your request as a provider has been approved. You can now start providing services through our platform. Visit [[site_url]] for more details.', '[\"provider_name\",\"site_url\"]', '2024-07-16 12:19:21', '2024-07-16 12:19:21', 'Approval'),
(2, 'provider_disapproved', 'Dear [[provider_name]], we regret to inform you that your provider request with [[company_name]] has been disapproved. For further information, please contact us at [[company_contact_info]].\r\n', '[\"provider_name\",\"company_name\",\"company_contact_info\"]', '2024-07-16 12:23:29', '2024-07-16 12:23:29', 'Rejection'),
(3, 'withdraw_request_approved', 'Hello [[provider_name]], your withdrawal request has been approved. The amount of [[amount]] [[currency]] will be processed shortly. ', '[\"provider_name\",\"amount\",\"currency\"]', '2024-07-16 12:24:04', '2024-07-16 12:24:04', 'Withdrawal'),
(4, 'withdraw_request_disapproved', 'Hello [[provider_name]], we regret to inform you that your withdrawal request has been disapproved. Please contact [[company_name]] at [[company_contact_info]] for more details.\r\n', '[\"provider_name\",\"company_name\",\"company_contact_info\"]', '2024-07-16 12:34:19', '2024-07-16 12:34:19', 'Withdrawal'),
(5, 'payment_settlement', 'Dear [[provider_name]], your payment of [[amount]] [[currency]] has been successfully settled. Thank you for choosing [[company_name]].\r\n', '[\"provider_name\",\"amount\",\"currency\",\"company_name\"]', '2024-07-16 12:35:19', '2024-07-16 12:35:19', 'Payment'),
(6, 'service_disapproved', 'Dear [[provider_name]], we regret to inform you that your service request ([[service_name]]) with [[company_name]] has been disapproved. Please contact us for further assistance.\r\n', '[\"provider_name\",\"service_name\",\"company_name\"]', '2024-07-16 12:36:14', '2024-07-16 12:36:14', 'Rejection'),
(7, 'service_approved', 'Hello [[provider_name]], your service request ([[service_name]]) has been approved by [[company_name]]. You can proceed with the service as planned.\r\n', '[\"provider_name\",\"service_name\",\"company_name\"]', '2024-07-16 12:37:22', '2024-07-16 12:37:22', 'Approval'),
(8, 'user_account_active', 'Hello [[user_name]], your account with [[company_name]] is now active. \r\n', '[\"user_name\",\"company_name\"]', '2024-07-16 12:37:56', '2024-07-16 12:37:56', 'Account'),
(9, 'user_account_deactive', 'Hello [[user_name]], your account with [[company_name]] has been deactivated. If you have any questions, please contact us at [[company_contact_info]].\r\n', '[\"user_name\",\"company_name\",\"company_contact_info\"]', '2024-07-16 12:38:47', '2024-07-16 12:38:47', 'Account'),
(10, 'booking_status_updated', 'Hello [[user_name]], the status of your booking ([[booking_id]]) with [[company_name]] has been updated. Visit [[site_url]] for details.\r\n', '[\"user_name\",\"booking_id\",\"company_name\",\"site_url\"]', '2024-07-16 12:44:21', '2024-07-16 12:44:21', 'Booking'),
(11, 'new_booking_confirmation_to_customer', 'Hello [[user_name]], your booking ([[booking_id]]) with [[company_name]] for [[booking_service_names]] on [[booking_date]] at [[booking_time]] has been confirmed. Thank you for choosing us!\r\n', '[\"user_name\",\"booking_id\",\"company_name\",\"booking_service_names\",\"booking_date\",\"booking_time\"]', '2024-07-16 12:46:26', '2024-07-16 12:46:26', 'Booking'),
(12, 'new_booking_received_for_provider', 'Hello [[provider_name]], a new booking ([[booking_id]]) has been received for you from [[user_name]]. Please review and confirm at [[site_url]].\r\n', '[\"provider_name\",\"booking_id\",\"user_name\",\"site_url\"]', '2024-07-16 12:47:31', '2024-07-16 12:47:31', 'New'),
(13, 'provider_update_information', 'Hello [[company_logo]], [[provider_name]] updated their details check once.\r\n', '[\"company_logo\",\"provider_name\"]', '2024-07-16 12:48:38', '2024-07-16 12:48:38', 'Provider Update Information'),
(14, 'new_provider_registerd', 'A new provider [[provider_name]] has registered with [[company_name]]. Visit [[site_url]] for more details.\r\n', '[\"provider_name\",\"company_name\",\"site_url\"]', '2024-07-16 12:51:15', '2024-07-16 12:51:15', 'New Provider Registered'),
(15, 'withdraw_request_received', 'Hello [[provider_name]], we have received your withdrawal request. It is currently being processed. You will be notified once it&#039;s approved or disapproved.\r\n', '[\"provider_name\"]', '2024-07-16 12:54:38', '2024-07-16 12:54:38', 'Withdrawal Request Received'),
(16, 'new_rating_given_by_customer', 'Dear [[provider_name]] A [[user_name]] has just rated your service. Check your dashboard for details and feedback. Thank you!', '[\"provider_name\",\"user_name\"]', '2024-08-02 17:54:27', '2024-08-02 17:54:27', 'New Rating Alert'),
(17, 'rating_request_to_customer', 'Dear [[user_name]] We value your feedback! Please take a moment to rate your recent experience with us. Your input helps us improve. \r\n\r\n', '[\"user_name\"]', '2024-08-02 17:56:08', '2024-08-02 17:56:08', 'Rating Request to customer');




UPDATE settings 
SET value = JSON_SET(
    value,
    '$.authentication_mode', 'firebase'
)
WHERE variable = 'general_settings';





UPDATE settings 
SET value = JSON_SET(
    value,
    '$.image_compression_preference', '0'
)
WHERE variable = 'general_settings';

UPDATE settings 
SET value = JSON_SET(
    value,
    '$.image_compression_quality', '0'
)
WHERE variable = 'general_settings';

UPDATE settings SET value = JSON_SET(value,'$.distance_unit', 'km')WHERE variable = 'general_settings';

ALTER TABLE `orders` ADD `isRefunded` VARCHAR(255)  DEFAULT '0' AFTER `promocode_id`;


CREATE TABLE `otps` (  `id` int(11) NOT NULL AUTO_INCREMENT,  `mobile` text NOT NULL,  `otp` text NOT NULL,  `created_at` datetime NOT NULL,  PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `sliders` ADD `url` TEXT NULL AFTER `updated_at`;
ALTER TABLE `sliders` CHANGE `image` `app_image` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE `sliders` ADD `web_image` TEXT NOT NULL AFTER `url`;
ALTER TABLE `partner_details` CHANGE `chat` `chat` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0';
ALTER TABLE `sections` ADD `banner_type` TEXT NULL AFTER `rank`;
ALTER TABLE `sections` ADD `banner_url` TEXT NULL AFTER `banner_type`;
ALTER TABLE `sections` ADD `app_banner_image` TEXT NULL AFTER `banner_url`, ADD `web_banner_image` TEXT NULL AFTER `app_banner_image`;
UPDATE settings SET value = JSON_SET(value,'$.allow_post_booking_chat', '1')WHERE variable = 'general_settings';
UPDATE settings SET value = JSON_SET(value,'$.allow_pre_booking_chat', '1') WHERE variable = 'general_settings';



