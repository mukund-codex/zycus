-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 24, 2019 at 04:41 AM
-- Server version: 5.5.61-38.13-log
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shareitt_zycus`
--

-- --------------------------------------------------------

--
-- Table structure for table `zycus_about_us`
--

CREATE TABLE `zycus_about_us` (
  `id` int(11) NOT NULL,
  `image_name` varchar(300) NOT NULL,
  `desc1` text NOT NULL,
  `desc2` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zycus_about_us`
--

INSERT INTO `zycus_about_us` (`id`, `image_name`, `desc1`, `desc2`, `created`) VALUES
(1, 'five_precept_of_digital_procurement_transformation-1558069311-1.png', '<p><span poppins=\"\" style=\"color: rgb(0, 0, 0); font-family: \">Zycus is a leading global provider of complete Source-to-Pay suite of procurement performance solutions. Our comprehensive product portfolio includes applications for both the strategic and the operational aspects of procurement - eProcurement, eInvoicing, Spend Analysis, eSourcing, Contract Management, Supplier Management, Financial Savings Management, Project Management and Request Management Our spirit of innovation and our passion to help procurement create greater business impact are reflected among the hundreds of procurement solution deployments that we have undertaken over the years. We are proud to have as our clients, some of the best-of-breed companies across verticals like Manufacturing, Automotives, Banking and Finance, Oil and Gas, Food Processing, Electronics, Telecommunications, Chemicals, Health and Pharma, Education and more.</span></p>\r\n', '', '2019-02-15 06:17:43');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_activity_master`
--

CREATE TABLE `zycus_activity_master` (
  `id` int(11) NOT NULL,
  `category` varchar(10) NOT NULL,
  `activity_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `points` int(100) NOT NULL,
  `active` varchar(10) NOT NULL,
  `isdelete` varchar(30) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zycus_activity_master`
--

INSERT INTO `zycus_activity_master` (`id`, `category`, `activity_name`, `description`, `points`, `active`, `isdelete`, `created`) VALUES
(1, '4', 'Beginning Balance', 'Get 250 points instantly after signing up for the Praemia program', 250, '0', '', '2019-05-03 10:29:09'),
(2, '5', 'Mention of Zycus on Customer\'s website', 'Any usage of Zycus logo, or quotes mentioning Zycus on your companyâ€™s website gets you 300 points', 300, '0', '', '2019-05-03 10:29:30'),
(3, '7', 'Customer\'s Quote about Zycus', 'Provide a shareable quote about your partnership  with Zycus or its product to get 300 points', 300, '0', '', '2019-05-03 10:29:50'),
(4, '5', 'Logo use on Zycus website', 'Allow Zycus to display your company logo on our customer list on the Zycus website and get  400 points', 400, '0', '', '2019-05-03 10:30:12'),
(5, '6', 'Review on select partner websites', 'Write a review on Zycus on the selected partner website (like Gartner Peer Insights, G2Crowd, Capterra etc.) for 500 points ', 500, '0', '', '2019-05-03 10:30:36'),
(6, '5', 'test', 'test', 10000, '0', '', '2019-05-04 04:36:21'),
(7, '5', 'test', 'test', 10000, '0', '', '2019-05-04 04:37:17'),
(8, '5', 'test', 'test', 10000, '0', '', '2019-05-04 04:39:43'),
(9, '7', 'testing', 'testing testing ', 5500, '0', '', '2019-05-04 05:08:51'),
(10, '7', 'opportunity', 'this is an opportunity description', 5000, '0', '', '2019-05-04 05:23:48'),
(12, '4', 'Activity Master#100', 'Activity Master#100', 100, '1', '', '2019-05-10 07:16:56'),
(13, '5', 'Activity Master#200', 'Activity Master#200', 200, '0', '', '2019-05-10 07:18:28'),
(14, '6', 'Activity Master#300', 'Activity Master#300', 300, '0', '', '2019-05-10 07:18:57'),
(15, '11', 'Engage & Earn Points', 'Engage & Earn Points', 400, '1', '', '2019-05-17 04:15:56'),
(16, '5', 'Tickets', 'Tickets', 500, '1', '', '2019-05-17 06:56:03'),
(17, '6', 'Service credits', 'Service credits', 600, '1', '', '2019-05-17 06:56:46'),
(18, '5', 'test', 'test', 9000, '1', '', '2019-05-20 08:49:36'),
(19, '4', 'te', 'st', 6567, '1', '', '2019-05-20 11:56:53'),
(20, '7', 'testing the mail', 'description for mail', 100, '1', '', '2019-05-23 11:20:23');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_admin`
--

CREATE TABLE `zycus_admin` (
  `id` int(100) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `user_role` varchar(10) DEFAULT NULL,
  `permissions` text,
  `active` tinyint(4) DEFAULT NULL,
  `last_modified` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `zycus_admin`
--

INSERT INTO `zycus_admin` (`id`, `fname`, `lname`, `username`, `email`, `mobile`, `password`, `user_role`, `permissions`, `active`, `last_modified`, `created`) VALUES
(1, 'Zycus', 'Rewards', 'admin', 'mukunda.v@innovins.com', NULL, '$2y$10$i2wEVPdzjVe/gSx7vM3CKugSxvWlMQWuIiMTHvvPgAIf1lz2g2qP2', 'super', 'discount_coupon_view,discount_coupon_add,discount_coupon_update,discount_coupon_delete,vendor_subscription_view,vendor_subscription_create,vendor_subscription_update,vendor_subscription_delete', 1, '2019-05-16 04:42:39', '2019-01-18 10:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_banner_master`
--

CREATE TABLE `zycus_banner_master` (
  `id` int(11) NOT NULL,
  `title` text,
  `sub_title` text,
  `ipad_img` varchar(300) NOT NULL,
  `phone_img` varchar(300) NOT NULL,
  `link` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL,
  `active` varchar(15) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zycus_banner_master`
--

INSERT INTO `zycus_banner_master` (`id`, `title`, `sub_title`, `ipad_img`, `phone_img`, `link`, `display_order`, `active`, `created`) VALUES
(4, '<h1>Get <strong>Quick Results</strong> with high Throughtput</h1>\r\n', NULL, 'ipad-1556623211-1.png', '-1556623193-1.png', '', 3, 'Yes', '2019-04-30 11:19:53'),
(7, 'Sample Test Banner&nbsp;', NULL, 'ai-powered-1557318984-1.jpg', '', '', 1, 'No', '2019-05-03 12:11:45'),
(8, '<h1>FUTURE OF PROCUMENT</h1>\r\n', NULL, '-1557321789-1.jpg', '', '', 9, 'No', '2019-05-08 13:23:09'),
(10, 'test', NULL, '-1558069948-1.jpg', '', '', 2, 'No', '2019-05-17 05:12:28'),
(11, '', NULL, '-1558069988-1.jpg', '', '', 15, 'Yes', '2019-05-17 05:13:08');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_category_master`
--

CREATE TABLE `zycus_category_master` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL,
  `display_order` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zycus_category_master`
--

INSERT INTO `zycus_category_master` (`id`, `category_name`, `active`, `display_order`, `created`) VALUES
(4, 'Content', '1', 1, '2019-04-16 03:39:19'),
(5, 'Tickets', '1', 2, '2019-04-16 03:53:51'),
(6, 'Service credits', '1', 3, '2019-04-16 03:54:02'),
(7, 'Speaking opportunities', '1', 4, '2019-04-16 03:54:20'),
(11, 'Category#1', '0', 5, '2019-05-17 04:11:26');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_contactus`
--

CREATE TABLE `zycus_contactus` (
  `id` int(11) NOT NULL,
  `region` text,
  `address` text,
  `display_order` int(11) DEFAULT NULL,
  `active` varchar(30) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zycus_contactus`
--

INSERT INTO `zycus_contactus` (`id`, `region`, `address`, `display_order`, `active`, `created`) VALUES
(1, 'USA', '<strong>Princeton:</strong> 103 Carnegie Center, Suite 201 Princeton, NJ 08540<br />\r\nPh: 609-799-5664<br />\r\n<strong>Chicago:</strong> 5600 N River Road, Suite 800 Rosemont, IL 60018<br />\r\nPh: 847-993-3180<br />\r\n<strong>Atlanta:</strong> 555 North Point Center East; 4th Floor, Alpharetta, GA 30022<br />\r\nPh: 678-366-5000', 5, 'Yes', '2019-05-03 11:14:38'),
(2, 'UK', '<strong>London</strong>: Kajaine House, 57-67 High Street, Edgware, Middlesex HA8 7DD,<br />\r\nUnited Kingdom Ph: +44(0)1189-637-493', 4, 'Yes', '2019-05-03 11:14:51'),
(3, 'ASIA', '<strong>Mumbai</strong>: Plot No. GJ-07, Seepz++, Seepz SEZ, Andheri (East),<br />\r\nMumbai - 400 096 Ph: +91-22-66407676<br />\r\n<strong>Pune</strong>: Pride Purple Accord, 1st Floor, Above Vijay Sales, Next to Hotel Mahableshwar,<br />\r\nBaner Road, Pune - 411045 Ph: +91-22-66407676<br />\r\n<strong>Bangalore</strong>: MFAR Silverline Tech park, Unit No. 2, 3rd Floor, Plot No. 180, EPIP Area,<br />\r\n2nd Phase Whitefield, Bangalore 560066 Ph: +91-80-46737676', 9, 'Yes', '2019-05-03 11:15:07'),
(4, 'SINGAPORE', '<strong>SINGAPORE</strong>: 101 Cecil Street,#20-11,Tong ENG Building-069533', 2, 'Yes', '2019-05-03 11:16:33'),
(5, 'AUSTRALIA', '<strong>Melbourne</strong>: Level 9, 440 Collins Street, Melbourne VIC 3000', 1, 'Yes', '2019-05-03 11:16:49'),
(6, 'MIDDLE EAST', '<strong>Dubai</strong>: Unit EX &ndash; 20 , Building No 12, Dubai Internet City, Dubai , UAE, PO BOX No. 73000', 3, 'Yes', '2019-05-03 11:17:35'),
(13, 'Singapore', '<p>101 Cecil Street, #20-11, Tong ENG Building - 069533</p>\r\n', 7, 'Yes', '2019-05-08 14:00:28'),
(17, 'Mumbai Andheri', '<span style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small;\">Plot No. GJ - 07, Seepz++, Andheri East, Mumbai, Maharashtra 400096</span>', 6, 'Yes', '2019-05-17 05:05:09');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_contact_form`
--

CREATE TABLE `zycus_contact_form` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `message` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zycus_contact_form`
--

INSERT INTO `zycus_contact_form` (`id`, `name`, `mobile`, `email`, `message`, `created`) VALUES
(1, 'Deepika', '8898130405', 'deepika@innovins.com', 'Sample', '2019-05-03 12:06:02'),
(2, 'tanvi', '6776766676', 'tanvi@innovins.com', 'test', '2019-05-04 04:27:03'),
(3, 'Ridhi Malhotra', '9029055680', 'ridhi.malhotra@zycus.com', 'kkkkk', '2019-05-16 09:52:50'),
(4, 'juned ahmed', '9821316681', 'juned.ahmed@zycus.com', 'Test', '2019-05-17 05:06:25'),
(5, 'juned ahmed', '9821316681', 'juned.ahmed@zycus.com', 'juned ahmed', '2019-05-17 05:09:30'),
(6, 'juned ahmed', '9821316681', 'juned.ahmed@zycus.com', 'Test', '2019-05-17 09:54:19'),
(7, 'tanvi parab', '7700016543', 'tanvi@innovins.com', 'test', '2019-05-20 07:53:40'),
(8, 'tanvi parab', '7700016543', 'tanvi@innovins.com', 'testttttttttttttt', '2019-05-20 07:54:06'),
(9, 'Mukunda Vishwakarma', '8108911304', 'mukunda.v@innovins.com', 'testing enquiry', '2019-05-20 09:50:25'),
(10, 'Tan v Vi', '7700016543', 'tanvi@innovins.com', 'test', '2019-05-20 11:28:19'),
(11, 'juned ahmed', '9821316681', 'juned.ahmed@zycus.com', 'Demo', '2019-05-22 10:32:55'),
(12, 'juned ahmed', '9821316681', 'juned.ahmed@zycus.com', 'Get In Touch', '2019-05-22 10:33:46'),
(13, 'juned ahmed', '9821316681', 'juned.ahmed@zycus.com', 'Get In Touch', '2019-05-22 10:33:55'),
(14, 'tanvi', '7700016543', 'tanvi@innovins.com', 'test', '2019-05-23 11:12:45'),
(15, 'Tanvi Vi', '7700054645', 'tanvi@innovins.com', 'testing for mail', '2019-05-23 11:29:41');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_gallery_content`
--

CREATE TABLE `zycus_gallery_content` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `subtitle` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zycus_gallery_content`
--

INSERT INTO `zycus_gallery_content` (`id`, `title`, `subtitle`, `description`, `image`, `created`) VALUES
(1, 'Zycus Praemia Program', 'Make the most of your Zycus journey, earn your rewards today.', '<p>Talk about your Zycus experience and get rewarded. Join our rewards program for free to begin earning redeemable points and<br />\r\nexclusive benefits.</p>\r\n\r\n<h4>Why sign up for the rewards program:</h4>\r\n\r\n<div class=\"row ul-row\">\r\n<div class=\"col-sm-6 col-md-6\">\r\n<ul class=\"tick\">\r\n	<li>Earn reward points</li>\r\n	<li>Gain access to exclusive benefits from Zycus</li>\r\n	<li>Network with industry peers</li>\r\n</ul>\r\n</div>\r\n\r\n<div class=\"col-sm-6 col-md-6\">\r\n<ul class=\"tick\">\r\n	<li>Showcase thought leadership in your industry</li>\r\n	<li>Grow your brands presence</li>\r\n	<li>Be the first to know of exclusive Praemia opportunities</li>\r\n</ul>\r\n</div>\r\n</div>\r\n', NULL, '2019-05-01 03:49:15'),
(3, 'Ways to earn your points', '', '<p>Explore and choose from various engagement avenues,<br />\r\nto collaborate with Zycus and earn points.</p>\r\n', '-1556950725-1.png', '2019-05-01 03:57:37'),
(4, 'Whatâ€™s in it for you?', '', '<p>Opting for marketing initiatives will allow you to earn points for your company and redeem them to avail professional benefits such as:</p>\r\n\r\n<ul>\r\n	<li>Conference Passes</li>\r\n	<li>Workshops</li>\r\n	<li>Special Discounts</li>\r\n	<li>Elevated Statuses</li>\r\n	<li>And More...</li>\r\n</ul>\r\n', '', '2019-05-01 05:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_home_carousel`
--

CREATE TABLE `zycus_home_carousel` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `sub_title` varchar(100) NOT NULL,
  `image_name` varchar(300) NOT NULL,
  `link` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zycus_home_carousel`
--

INSERT INTO `zycus_home_carousel` (`id`, `title`, `sub_title`, `image_name`, `link`, `display_order`, `created`) VALUES
(1, 'WASH', '', '1-1551864337-1.png', '', 2, '2019-02-20 23:06:17'),
(3, 'Auto Wash', 'Lorem Ipsum', 'car-img-1551182979-1.png', '', 2, '2019-02-20 23:39:56'),
(4, 'auto wash', 'auto wash', '11-1551955143-1.png', '', 3, '2019-03-07 10:39:03'),
(5, 'auto wash', 'auto wash', '3_crop-1551955154-1.jpg', '', 4, '2019-03-07 10:39:14'),
(6, 'auto wash', 'auto wash', '18-1551955288-1.jpg', '', 5, '2019-03-07 10:41:28');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_how_we_do`
--

CREATE TABLE `zycus_how_we_do` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `display_order` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zycus_how_we_do`
--

INSERT INTO `zycus_how_we_do` (`id`, `title`, `image_name`, `description`, `display_order`, `created`) VALUES
(1, 'BOOKING', 'process-1-1551182687-1.png', '<p>-Select your Vehicle Category</p>\r\n\r\n<p>-Choose your Detailing Package</p>\r\n\r\n<p>-Call/Email or Book Online.</p>\r\n\r\n<p>-Gifting options if required</p>\r\n\r\n<p>-Pay online or Card/COD</p>\r\n\r\n<p>-Schedule an Appointment</p>\r\n\r\n<p>-Confirmed &amp; Vehicle Dispatch</p>\r\n', 1, '2019-02-20 22:53:32'),
(5, 'WORK LOCATION:', 'process-1-1551242210-1.png', '<p>-Necessary Permissions Required</p>\r\n\r\n<p>-Pre-Work Checks &amp; Photo/Video</p>\r\n\r\n<p>-Explanation of Package Scope</p>\r\n\r\n<p>-Ensure Suï¬ƒcient Working Space</p>\r\n\r\n<p>-Deploy Equipment</p>\r\n\r\n<p>-Commence Work Process</p>\r\n', 2, '2019-02-20 22:53:32'),
(6, 'WORK PROCESS:', 'process-1-1551242229-1.png', '<p>-Job carried our as per Package</p>\r\n\r\n<p>-Team Quality Checks</p>\r\n\r\n<p>-Final Inspection by Customer</p>\r\n\r\n<p>-Redo any missed area</p>\r\n\r\n<p>-Ensure Customer Satisfaction</p>\r\n\r\n<p>-Photo/Video on Completion</p>\r\n', 3, '2019-02-20 22:53:32'),
(7, 'COMPLETION:', 'process-1-1551242261-1.png', '<p>-Form Filling &amp; Completion Report</p>\r\n\r\n<p>-Billing Process (Card/Cash/Online)</p>\r\n\r\n<p>-Pack-up Equipment</p>\r\n\r\n<p>-Clean up Work Space</p>\r\n\r\n<p>-Vehicle Dispatch</p>\r\n\r\n<p>-One Happy Customer!</p>\r\n', 4, '2019-02-20 22:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_redeem_activity`
--

CREATE TABLE `zycus_redeem_activity` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `redeem` varchar(40) NOT NULL,
  `points` int(100) NOT NULL,
  `status` varchar(40) NOT NULL,
  `approved` varchar(40) NOT NULL,
  `approved_by` varchar(100) NOT NULL,
  `approved_time` datetime DEFAULT NULL,
  `rejected_reason` text NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zycus_redeem_activity`
--

INSERT INTO `zycus_redeem_activity` (`id`, `userid`, `redeem`, `points`, `status`, `approved`, `approved_by`, `approved_time`, `rejected_reason`, `created_by`, `created`) VALUES
(1, 1, '10', 50, 'Requested', 'Rejected', '', NULL, '', '', '2019-05-15 11:17:41'),
(2, 1, '10', 50, 'Requested', 'Rejected', '', NULL, '', '', '2019-05-15 12:12:18'),
(3, 1, '10', 50, 'Requested', 'Approved', '', NULL, '', '', '2019-05-15 12:18:59'),
(4, 10, '9', 159, 'Requested', '', '', NULL, '', '', '2019-05-17 05:33:55'),
(5, 14, '5', 7500, '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-17 05:48:32'),
(6, 14, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-17 05:51:01'),
(7, 14, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-17 05:53:00'),
(8, 10, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-17 06:12:32'),
(9, 10, '9', 159, 'Requested', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-17 06:17:12'),
(10, 10, '9', 159, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-17 06:19:51'),
(11, 16, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-17 07:17:10'),
(12, 10, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-17 10:23:22'),
(13, 10, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-17 10:23:32'),
(14, 10, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-17 10:23:42'),
(15, 10, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-17 10:23:52'),
(16, 18, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 05:20:19'),
(17, 18, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 06:23:51'),
(18, 18, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-20 06:24:38'),
(19, 18, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 06:25:50'),
(20, 18, '9', 159, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 06:46:16'),
(21, 18, '9', 159, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 06:46:21'),
(22, 18, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 06:46:41'),
(23, 18, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 06:46:47'),
(24, 18, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 06:50:22'),
(25, 18, '9', 159, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 06:51:54'),
(26, 35, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-20 07:42:41'),
(27, 35, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 07:43:26'),
(28, 35, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 09:26:18'),
(29, 36, '6', 10000, '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-20 09:45:48'),
(30, 36, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:15:03'),
(31, 36, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:15:11'),
(32, 36, '9', 159, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:16:31'),
(33, 36, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:16:39'),
(34, 32, '9', 159, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:25:47'),
(35, 36, '9', 159, 'Requested', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:26:02'),
(36, 36, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:26:08'),
(37, 36, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:26:15'),
(38, 36, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:26:49'),
(39, 36, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:26:55'),
(40, 36, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:27:01'),
(41, 36, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:27:08'),
(42, 36, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:27:15'),
(43, 32, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', '2019-05-20 04:49:39', '', '', '2019-05-20 11:19:08'),
(44, 36, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', '2019-05-20 06:26:00', '', '', '2019-05-20 11:24:07'),
(45, 36, '5', 7500, '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-20 12:11:06'),
(46, 36, '2', 4000, 'Requested', 'Approved', 'Zycus Rewards', '2019-05-20 06:05:08', '', '', '2019-05-20 12:34:17'),
(47, 36, '4', 6000, 'Requested', 'Approved', 'Zycus Rewards', '2019-05-20 06:04:54', '', '', '2019-05-20 12:34:30'),
(48, 32, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', '2019-05-20 06:30:20', 'Reason is nothing', '', '2019-05-20 12:56:15'),
(49, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-20 13:02:44'),
(50, 36, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-21 10:19:52'),
(51, 36, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-21 10:20:04'),
(52, 36, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-21 10:20:10'),
(53, 36, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-21 10:20:16'),
(54, 36, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', '2019-05-21 04:27:43', 'test', '', '2019-05-21 10:20:23'),
(55, 36, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', '2019-05-21 04:27:15', '', '', '2019-05-21 10:20:27'),
(56, 36, '6', 10000, '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-21 10:59:55'),
(57, 36, '6', 10000, '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-21 11:38:47'),
(58, 32, '5', 7500, '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-21 11:49:22'),
(59, 36, '5', 7500, '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-21 11:51:02'),
(60, 36, '5', 7500, '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-21 11:53:29'),
(61, 15, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', '2019-05-22 04:39:06', 'Demo test', '', '2019-05-22 11:00:29'),
(62, 15, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', '2019-05-22 04:33:19', '', '', '2019-05-22 11:00:37'),
(63, 15, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-22 11:00:44'),
(64, 36, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 11:24:41'),
(65, 36, '6', 10000, '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-23 11:27:05'),
(66, 40, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', '2019-05-23 06:03:44', 'no', '', '2019-05-23 12:32:45'),
(67, 40, '10', 50, 'Requested', 'Rejected', 'Zycus Rewards', '2019-05-23 06:03:36', 'no', '', '2019-05-23 12:32:52'),
(68, 40, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:33:51'),
(69, 40, '10', 50, 'Requested', 'Approved', 'Zycus Rewards', '2019-05-23 06:10:42', '', '', '2019-05-23 12:40:23'),
(70, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:42:46'),
(71, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:43:52'),
(72, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:43:59'),
(73, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:44:05'),
(74, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:44:11'),
(75, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:44:18'),
(76, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:44:22'),
(77, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:44:29'),
(78, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:44:36'),
(79, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:44:53'),
(80, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:45:00'),
(81, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:45:07'),
(82, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:45:15'),
(83, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:45:33'),
(84, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:45:40'),
(85, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:45:46'),
(86, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:50:02'),
(87, 32, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:50:17'),
(88, 32, '6', 10000, 'Requested', 'Rejected', 'Zycus Rewards', '2019-05-24 09:22:38', 'tester', '', '2019-05-23 12:52:59'),
(89, 40, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-23 12:55:35'),
(90, 40, '10', 50, 'Requested', '', '', NULL, '', '', '2019-05-24 04:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_redeem_master`
--

CREATE TABLE `zycus_redeem_master` (
  `id` int(11) NOT NULL,
  `category` varchar(10) NOT NULL,
  `reward_name` varchar(200) NOT NULL,
  `points` int(100) NOT NULL,
  `display_order` varchar(20) NOT NULL,
  `active` varchar(10) NOT NULL,
  `isdelete` varchar(30) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zycus_redeem_master`
--

INSERT INTO `zycus_redeem_master` (`id`, `category`, `reward_name`, `points`, `display_order`, `active`, `isdelete`, `created`) VALUES
(2, '5', 'Buy 1 Get 1 Free on Horizon\'s Ticket', 4000, '1', '1', '', '2019-05-20 12:08:25'),
(3, '6', '10 Hours Service Credit', 5000, '2', '1', '', '2019-05-20 12:08:25'),
(4, '6', 'One Zycus sponsored pass to Institute of Supply Management 2018 conference (ISM2018)', 6000, '3', '1', '', '2019-05-20 12:08:25'),
(5, '4', '$1500 discount on purchase of additional module', 7500, '4', '1', '', '2019-05-20 12:08:25'),
(6, '4', '$2000 worth credit on contract renewal', 10000, 'a', '1', '', '2019-05-20 12:08:25'),
(9, '8', 'Reward Name', 159, '1', '1', '', '2019-05-10 06:42:23'),
(10, '8', 'Demo', 50, '1', '1', '', '2019-05-10 06:44:16'),
(11, '5', 'testing for mail1', 50, '1', '1', '1', '2019-05-23 11:26:34');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_user_activity`
--

CREATE TABLE `zycus_user_activity` (
  `id` int(11) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `activity` varchar(50) NOT NULL,
  `points` int(100) NOT NULL,
  `count` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `remark` text NOT NULL,
  `approved` varchar(10) NOT NULL,
  `approved_by` varchar(100) NOT NULL,
  `approved_time` datetime DEFAULT NULL,
  `rejected_reason` text NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zycus_user_activity`
--

INSERT INTO `zycus_user_activity` (`id`, `userid`, `category`, `activity`, `points`, `count`, `status`, `remark`, `approved`, `approved_by`, `approved_time`, `rejected_reason`, `created_by`, `created`) VALUES
(1, '1', '6', '14', 300, '1', 'already done', 'test', 'Approved', '', NULL, '', '', '2019-05-15 11:12:35'),
(2, '1', '6', '14', 300, '1', 'already done', 'test', 'Approved', '', NULL, '', '', '2019-05-15 11:12:50'),
(3, '1', '6', '14', 300, '1', 'already done', 'test', 'Approved', '', NULL, '', '', '2019-05-15 11:13:00'),
(4, '1', '5', '13', 200, '1', 'already done', 'test', 'Approved', '', NULL, '', '', '2019-05-15 11:14:37'),
(5, '1', '6', '14', 300, '1', 'already done', 'test', '', '', NULL, '', '', '2019-05-15 12:57:40'),
(6, '7', '11', '15', 400, '1', 'interested', 'Engage & Earn Points', '', '', NULL, '', '', '2019-05-17 04:16:43'),
(7, '10', '4', '12', 100, '1', 'interested', 'Demo', '', '', NULL, '', '', '2019-05-17 04:37:26'),
(8, '10', '5', '13', 200, '1', 'interested', 'Demo2', '', '', NULL, '', '', '2019-05-17 04:39:13'),
(9, '10', '11', '15', 400, '1', 'already done', '400 Points', 'Approved', '', NULL, '', '', '2019-05-17 05:31:45'),
(10, '10', '5', '13', 200, '1', 'already done', 'Pioints#200', 'Approved', '', NULL, '', '', '2019-05-17 05:32:41'),
(11, '14', '4', '1', 250, '1', 'already done', '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-17 05:34:16'),
(12, '10', '6', '14', 300, '1', 'interested', '300#', '', '', NULL, '', '', '2019-05-17 05:34:54'),
(13, '10', '11', '15', 400, '1', 'already done', '#400', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-17 05:36:44'),
(14, '14', '11', '15', 400, '1', 'already done', 'tester', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-17 05:38:43'),
(15, '14', '11', '15', 400, '1', 'already done', 'tester', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-17 05:38:53'),
(16, '16', '6', '17', 600, '1', 'already done', '#600', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-17 07:04:53'),
(17, '16', '11', '15', 400, '1', 'already done', '#400', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-17 07:05:51'),
(18, '16', '5', '16', 500, '1', 'already done', '#200', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-17 07:08:05'),
(19, '16', '11', '15', 400, '1', 'already done', '#600', '', '', NULL, '', '', '2019-05-17 07:10:22'),
(20, '10', '6', '17', 600, '1', 'already done', 'Test', '', '', NULL, '', '', '2019-05-17 10:20:11'),
(21, '10', '6', '17', 600, '1', 'interested', 'Intrest', '', '', NULL, '', '', '2019-05-17 10:33:40'),
(22, '18', '6', '17', 600, '1', 'already done', 'kjkjlj', '', '', NULL, '', '', '2019-05-17 11:14:59'),
(23, '18', '6', '17', 600, '1', 'already done', 'kjkjlj', '', '', NULL, '', '', '2019-05-17 11:15:09'),
(24, '18', '6', '17', 600, '1', 'already done', 'kjkjlj', '', '', NULL, '', '', '2019-05-17 11:15:19'),
(25, '18', '6', '17', 600, '1', 'already done', 'kjkjlj', '', '', NULL, '', '', '2019-05-17 11:15:29'),
(26, '18', '6', '17', 600, '1', 'already done', 'kjkjlj', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-17 11:15:39'),
(27, '18', '6', '17', 600, '1', 'already done', 'kjkjlj', '', '', NULL, '', '', '2019-05-17 11:15:49'),
(28, '18', '6', '17', 600, '1', 'already done', 'kjkjlj', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-17 11:15:59'),
(29, '18', '6', '17', 600, '1', 'already done', 'kjkjlj', '', '', NULL, '', '', '2019-05-17 11:16:10'),
(30, '18', '6', '17', 600, '1', 'already done', 'kjkjlj', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-17 11:16:20'),
(31, '18', '6', '17', 600, '1', 'already done', 'kjkjlj', '', '', NULL, '', '', '2019-05-17 11:16:30'),
(32, '18', '6', '17', 600, '1', 'already done', 'kjkjlj', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-17 11:16:40'),
(33, '18', '6', '17', 600, '1', 'already done', 'kjkjlj', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-17 11:16:50'),
(34, '18', '6', '17', 600, '1', 'interested', 'interest', '', '', NULL, '', '', '2019-05-20 06:30:12'),
(35, '18', '5', '16', 500, '1', 'already done', 'interested', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 06:49:25'),
(36, '35', '5', '16', 500, '1', 'already done', 'i am done with it ', 'Rejected', 'Zycus Rewards', NULL, '', '', '2019-05-20 07:39:13'),
(37, '35', '5', '16', 500, '1', 'already done', 'i am done with it ', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 07:39:15'),
(38, '35', '5', '18', 9000, '1', 'already done', 'test', '', '', NULL, '', '', '2019-05-20 09:24:08'),
(39, '36', '5', '18', 9000, '1', 'already done', 'test', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 09:37:46'),
(40, '36', '5', '18', 9000, '1', 'already done', 'huhkj', '', '', NULL, '', '', '2019-05-20 10:14:34'),
(41, '36', '5', '18', 9000, '1', 'interested', 'hukhjm ', '', '', NULL, '', '', '2019-05-20 10:14:46'),
(42, '36', '5', '18', 9000, '1', 'interested', 'hukhjm ', '', '', NULL, '', '', '2019-05-20 10:14:50'),
(43, '32', '5', '18', 9000, '1', 'already done', 'testing', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 10:17:04'),
(44, '32', '5', '18', 9000, '1', 'already done', 'tester', 'Approved', 'Zycus Rewards', '2019-05-20 04:46:22', '', '', '2019-05-20 10:22:13'),
(45, '36', '5', '18', 9000, '1', 'already done', 'uh', 'Rejected', 'Zycus Rewards', '2019-05-20 05:51:45', '', '', '2019-05-20 10:25:22'),
(46, '36', '5', '18', 9000, '1', 'interested', 'hthjhjh', '', '', NULL, '', '', '2019-05-20 10:53:45'),
(47, '36', '5', '18', 9000, '1', 'interested', 'hthjhjh', 'Rejected', 'Zycus Rewards', '2019-05-20 06:15:01', 'reason is nothing ', '', '2019-05-20 10:53:58'),
(48, '36', '5', '18', 9000, '1', 'interested', 'hthjhjh', '', '', NULL, '', '', '2019-05-20 10:54:04'),
(49, '36', '5', '18', 9000, '1', 'interested', 'hthjhjh', '', '', NULL, '', '', '2019-05-20 10:54:11'),
(50, '36', '5', '18', 9000, '1', 'interested', 'hthjhjh', '', '', NULL, '', '', '2019-05-20 10:54:20'),
(51, '36', '5', '18', 9000, '1', 'interested', 'hthjhjh', '', '', NULL, '', '', '2019-05-20 10:54:32'),
(52, '36', '5', '18', 9000, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-20 10:54:43'),
(53, '32', '5', '18', 9000, '1', 'already done', 'test', 'Approved', 'Zycus Rewards', NULL, '', '', '2019-05-20 11:02:26'),
(54, '36', '4', '12', 100, '1', 'interested', '', '', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-20 11:57:42'),
(55, '32', '5', '18', 9000, '1', 'already done', 'rteteasd', '', '', NULL, '', '', '2019-05-20 12:22:28'),
(56, '32', '6', '17', 600, '1', 'already done', 'dasdasdasdasd', '', '', NULL, '', '', '2019-05-20 12:22:46'),
(57, '36', '4', '19', 6567, '1', 'already done', 'hj', '', '', NULL, '', '', '2019-05-20 12:41:33'),
(58, '36', '4', '19', 6567, '1', 'interested', 'hj', '', '', NULL, '', '', '2019-05-20 12:41:43'),
(59, '36', '4', '19', 6567, '1', 'interested', 'k', '', '', NULL, '', '', '2019-05-21 03:40:22'),
(81, '32', '4', '19', 6567, '1', 'already done', 'tester', '', '', NULL, '', '', '2019-05-21 07:38:05'),
(82, '36', '4', '19', 6567, '1', 'interested', 'hhjkhj', '', '', NULL, '', '', '2019-05-21 08:48:58'),
(83, '36', '4', '19', 6567, '1', 'interested', 'hhjkhj', '', '', NULL, '', '', '2019-05-21 08:49:05'),
(84, '36', '4', '19', 6567, '1', 'already done', 'heya', 'Rejected', 'Zycus Rewards', '2019-05-21 02:23:57', 'uhi', '', '2019-05-21 08:53:19'),
(85, '36', '5', '16', 500, '1', 'already done', 'test', 'Rejected', 'Zycus Rewards', '2019-05-21 02:26:57', 'kjjjjjjjjjjj', '', '2019-05-21 08:55:16'),
(94, '32', '4', '19', 6567, '1', 'already done', 'tester', '', '', NULL, '', '', '2019-05-21 09:50:47'),
(95, '32', '4', '19', 6567, '1', 'already done', 'asdad', '', '', NULL, '', '', '2019-05-21 09:54:44'),
(96, '32', '4', '19', 6567, '1', 'already done', 'asdasd', '', '', NULL, '', '', '2019-05-21 09:55:27'),
(97, '32', '4', '19', 6567, '1', 'already done', 'asdasd', '', '', NULL, '', '', '2019-05-21 09:56:59'),
(98, '32', '4', '12', 100, '1', 'already done', '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-21 10:15:12'),
(99, '36', '4', '19', 6567, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-21 10:18:58'),
(100, '32', '4', '12', 100, '1', 'already done', '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-21 10:24:26'),
(101, '36', '4', '19', 6567, '1', 'already done', 'jjkjkj', '', '', NULL, '', '', '2019-05-21 10:24:47'),
(102, '36', '4', '19', 6567, '1', 'already done', 'dddd', '', '', NULL, '', '', '2019-05-21 10:29:57'),
(103, '36', '4', '19', 6567, '1', 'already done', 'test', '', '', NULL, '', '', '2019-05-21 10:31:32'),
(104, '36', '5', '18', 9000, '1', 'already done', 'tetgfgfh', 'Rejected', 'Zycus Rewards', '2019-05-21 04:26:32', 'no', '', '2019-05-21 10:55:16'),
(105, '36', '5', '16', 500, '1', 'already done', 'hjjj', 'Approved', 'Zycus Rewards', '2019-05-21 04:26:08', '', '', '2019-05-21 10:55:53'),
(106, '36', '4', '12', 100, '1', 'already done', '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-21 11:38:09'),
(107, '36', '4', '12', 100, '1', 'interested', '', '', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-21 11:40:32'),
(108, '15', '6', '17', 600, '1', 'interested', '600 Points test', '', '', NULL, '', '', '2019-05-22 10:27:27'),
(109, '15', '6', '17', 600, '1', 'interested', '600 Points test', '', '', NULL, '', '', '2019-05-22 10:27:41'),
(110, '15', '6', '17', 600, '1', 'interested', '600 Points test', '', '', NULL, '', '', '2019-05-22 10:27:48'),
(111, '15', '11', '15', 400, '1', 'interested', 'Second time test', '', '', NULL, '', '', '2019-05-22 10:39:54'),
(112, '15', '11', '15', 400, '1', 'interested', 'Second time test', '', '', NULL, '', '', '2019-05-22 10:40:00'),
(113, '15', '5', '16', 500, '1', 'already done', 'Already done', 'Approved', 'Zycus Rewards', '2019-05-22 04:29:41', '', '', '2019-05-22 10:42:30'),
(114, '15', '5', '18', 9000, '1', 'already done', 'already done', 'Approved', 'Zycus Rewards', '2019-05-22 04:29:46', '', '', '2019-05-22 10:43:00'),
(115, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:56:55'),
(116, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:57:01'),
(117, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:57:08'),
(118, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:57:14'),
(119, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:57:21'),
(120, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:57:26'),
(121, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:57:32'),
(122, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:57:38'),
(123, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:57:45'),
(124, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:57:52'),
(125, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:57:56'),
(126, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:58:03'),
(127, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:58:10'),
(128, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:58:16'),
(129, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:58:25'),
(130, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:58:30'),
(131, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:58:37'),
(132, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:58:45'),
(133, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:58:52'),
(134, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:58:59'),
(135, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:59:02'),
(136, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:59:09'),
(137, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:59:15'),
(138, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:59:22'),
(139, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:59:28'),
(140, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:59:33'),
(141, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:59:39'),
(142, '36', '4', '12', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 10:59:46'),
(143, '36', '4', '19', 6567, '1', 'interested', 'uyujhj', '', '', NULL, '', '', '2019-05-23 11:00:56'),
(144, '36', '4', '19', 6567, '1', 'interested', 'uyujhj', '', '', NULL, '', '', '2019-05-23 11:01:04'),
(145, '36', '4', '19', 6567, '1', 'interested', 'uyujhj', '', '', NULL, '', '', '2019-05-23 11:01:11'),
(146, '36', '4', '19', 6567, '1', 'interested', 'uyujhj', '', '', NULL, '', '', '2019-05-23 11:01:17'),
(147, '36', '4', '19', 6567, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 11:13:53'),
(148, '36', '5', '18', 9000, '1', 'already done', 'test', '', '', NULL, '', '', '2019-05-23 11:14:25'),
(149, '32', '4', '19', 6567, '1', 'already done', 'test', '', '', NULL, '', '', '2019-05-23 11:15:33'),
(150, '36', '7', '20', 100, '1', 'interested', 'i am interested..', '', '', NULL, '', '', '2019-05-23 11:20:47'),
(151, '32', '4', '19', 6567, '1', 'interested', 'rewasrew', '', '', NULL, '', '', '2019-05-23 11:20:49'),
(152, '36', '7', '20', 100, '1', 'already done', 'testing the already done', '', '', NULL, '', '', '2019-05-23 11:23:49'),
(153, '36', '4', '12', 100, '1', 'already done', '', 'Approved', 'Zycus Rewards', NULL, '', 'Zycus Rewards', '2019-05-23 11:28:23'),
(154, '36', '4', '12', 100, '1', 'already done', 'test', '', '', NULL, '', '', '2019-05-23 11:45:57'),
(155, '36', '7', '20', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 11:46:59'),
(156, '36', '4', '12', 100, '1', 'already done', 'test', '', '', NULL, '', '', '2019-05-23 11:47:56'),
(157, '36', '7', '20', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 11:48:44'),
(158, '32', '7', '20', 100, '1', 'interested', 'k', '', '', NULL, '', '', '2019-05-23 11:55:35'),
(159, '36', '5', '18', 9000, '1', 'already done', 'testing the test', '', '', NULL, '', '', '2019-05-23 12:03:47'),
(160, '36', '6', '17', 600, '1', 'already done', 'test', 'Approved', 'Zycus Rewards', '2019-05-23 05:34:45', '', '', '2019-05-23 12:04:21'),
(161, '36', '7', '20', 100, '1', 'interested', 'test', '', '', NULL, '', '', '2019-05-23 12:18:53'),
(162, '32', '7', '20', 100, '1', 'interested', 'tester', '', '', NULL, '', '', '2019-05-23 12:22:20'),
(163, '32', '7', '20', 100, '1', 'interested', 'dede', '', '', NULL, '', '', '2019-05-23 12:23:23'),
(164, '32', '7', '20', 100, '1', 'interested', '', '', '', NULL, '', '', '2019-05-23 12:23:54'),
(165, '40', '7', '20', 100, '1', 'already done', 'test', 'Approved', 'Zycus Rewards', '2019-05-23 05:54:58', '', '', '2019-05-23 12:24:02'),
(166, '32', '7', '20', 100, '1', 'interested', '', '', '', NULL, '', '', '2019-05-23 12:24:24'),
(167, '40', '7', '20', 100, '1', 'interested', '', '', '', NULL, '', '', '2019-05-23 12:25:56'),
(168, '40', '7', '20', 100, '1', 'interested', '', '', '', NULL, '', '', '2019-05-23 12:26:14'),
(169, '40', '4', '19', 6567, '1', 'interested', '', '', '', NULL, '', '', '2019-05-23 12:39:32'),
(170, '40', '4', '19', 6567, '1', 'interested', '', '', '', NULL, '', '', '2019-05-23 12:39:45'),
(171, '40', '7', '20', 100, '1', 'interested', '', '', '', NULL, '', '', '2019-05-23 12:39:56'),
(172, '40', '7', '20', 100, '1', 'already done', 'tets', 'Approved', 'Zycus Rewards', '2019-05-23 06:25:28', '', '', '2019-05-23 12:55:17');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_user_login_logs`
--

CREATE TABLE `zycus_user_login_logs` (
  `id` int(11) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `loggedin` varchar(150) NOT NULL,
  `loggedout` varchar(150) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zycus_user_login_logs`
--

INSERT INTO `zycus_user_login_logs` (`id`, `userid`, `loggedin`, `loggedout`, `created`) VALUES
(1, '1', '15-05-2019 03:55:25', '15-05-2019 03:57:40', '2019-05-15 10:25:25'),
(2, '1', '15-05-2019 04:20:41', '15-05-2019 04:29:43', '2019-05-15 10:50:41'),
(3, '1', '15-05-2019 04:33:27', '', '2019-05-15 11:03:27'),
(4, '1', '15-05-2019 04:40:51', '', '2019-05-15 11:10:51'),
(5, '1', '15-05-2019 05:37:34', '', '2019-05-15 12:07:34'),
(6, '3', '15-05-2019 06:16:53', '', '2019-05-15 12:46:53'),
(7, '3', '15-05-2019 06:22:34', '', '2019-05-15 12:52:34'),
(8, '3', '16-05-2019 01:27:57', '', '2019-05-16 07:57:57'),
(9, '7', '16-05-2019 02:30:06', '', '2019-05-16 09:00:06'),
(10, '3', '16-05-2019 03:16:03', '', '2019-05-16 09:46:03'),
(11, '7', '17-05-2019 09:40:24', '17-05-2019 10:06:41', '2019-05-17 04:10:24'),
(12, '10', '17-05-2019 10:06:54', '17-05-2019 11:53:33', '2019-05-17 04:36:54'),
(13, '12', '17-05-2019 10:07:07', '17-05-2019 10:17:58', '2019-05-17 04:37:07'),
(14, '12', '17-05-2019 10:18:01', '17-05-2019 10:33:35', '2019-05-17 04:48:01'),
(15, '14', '17-05-2019 11:08:15', '', '2019-05-17 05:38:15'),
(16, '10', '17-05-2019 12:25:07', '17-05-2019 12:31:51', '2019-05-17 06:55:07'),
(17, '16', '17-05-2019 12:32:11', '', '2019-05-17 07:02:11'),
(18, '10', '17-05-2019 03:15:44', '17-05-2019 03:30:39', '2019-05-17 09:45:44'),
(19, '10', '17-05-2019 03:46:57', '', '2019-05-17 10:16:57'),
(20, '18', '17-05-2019 03:58:25', '', '2019-05-17 10:28:25'),
(21, '18', '20-05-2019 10:49:24', '20-05-2019 11:41:39', '2019-05-20 05:19:24'),
(22, '18', '20-05-2019 11:42:44', '20-05-2019 11:43:20', '2019-05-20 06:12:44'),
(23, '18', '20-05-2019 11:43:29', '20-05-2019 12:40:27', '2019-05-20 06:13:29'),
(24, '32', '20-05-2019 11:45:01', '20-05-2019 11:45:14', '2019-05-20 06:15:01'),
(25, '32', '20-05-2019 11:45:39', '20-05-2019 11:50:45', '2019-05-20 06:15:39'),
(26, '18', '20-05-2019 11:51:05', '', '2019-05-20 06:21:05'),
(27, '32', '20-05-2019 11:51:07', '', '2019-05-20 06:21:07'),
(28, '3', '20-05-2019 12:17:59', '', '2019-05-20 06:47:59'),
(29, '34', '20-05-2019 01:03:05', '20-05-2019 01:04:38', '2019-05-20 07:33:05'),
(30, '34', '20-05-2019 01:04:03', '20-05-2019 01:04:07', '2019-05-20 07:34:03'),
(31, '35', '20-05-2019 01:05:09', '', '2019-05-20 07:35:09'),
(32, '35', '20-05-2019 02:07:51', '20-05-2019 02:37:20', '2019-05-20 08:37:51'),
(33, '32', '20-05-2019 02:35:09', '20-05-2019 03:14:03', '2019-05-20 09:05:09'),
(34, '35', '20-05-2019 02:37:28', '20-05-2019 02:58:23', '2019-05-20 09:07:28'),
(35, '36', '20-05-2019 02:58:25', '20-05-2019 02:59:56', '2019-05-20 09:28:25'),
(36, '36', '20-05-2019 02:59:58', '20-05-2019 03:36:27', '2019-05-20 09:29:58'),
(37, '32', '20-05-2019 03:19:19', '', '2019-05-20 09:49:19'),
(38, '32', '20-05-2019 03:20:07', '20-05-2019 03:36:04', '2019-05-20 09:50:07'),
(39, '32', '20-05-2019 03:41:27', '', '2019-05-20 10:11:27'),
(40, '36', '20-05-2019 03:44:14', '', '2019-05-20 10:14:14'),
(41, '32', '20-05-2019 04:32:11', '', '2019-05-20 11:02:11'),
(42, '36', '21-05-2019 09:10:14', '', '2019-05-21 03:40:14'),
(43, '32', '21-05-2019 09:36:19', '', '2019-05-21 04:06:19'),
(44, '36', '21-05-2019 12:34:23', '', '2019-05-21 07:04:23'),
(45, '32', '21-05-2019 12:57:03', '', '2019-05-21 07:27:03'),
(46, '32', '21-05-2019 01:24:54', '', '2019-05-21 07:54:54'),
(47, '32', '21-05-2019 01:26:26', '', '2019-05-21 07:56:26'),
(48, '32', '21-05-2019 02:08:01', '21-05-2019 02:28:14', '2019-05-21 08:38:01'),
(49, '36', '21-05-2019 02:12:58', '21-05-2019 04:58:05', '2019-05-21 08:42:58'),
(50, '32', '21-05-2019 02:28:25', '', '2019-05-21 08:58:25'),
(51, '32', '21-05-2019 04:39:08', '21-05-2019 04:57:49', '2019-05-21 11:09:08'),
(52, '32', '21-05-2019 04:45:33', '', '2019-05-21 11:15:33'),
(53, '36', '21-05-2019 04:58:09', '', '2019-05-21 11:28:09'),
(54, '32', '21-05-2019 05:00:08', '', '2019-05-21 11:30:08'),
(55, '32', '21-05-2019 05:00:40', '', '2019-05-21 11:30:40'),
(56, '15', '22-05-2019 03:52:19', '22-05-2019 04:31:28', '2019-05-22 10:22:19'),
(57, '15', '22-05-2019 04:31:36', '', '2019-05-22 11:01:36'),
(58, '38', '23-05-2019 03:57:49', '', '2019-05-23 10:27:49'),
(59, '32', '23-05-2019 04:00:09', '', '2019-05-23 10:30:09'),
(60, '36', '23-05-2019 04:25:08', '23-05-2019 04:31:55', '2019-05-23 10:55:08'),
(61, '36', '23-05-2019 04:43:47', '23-05-2019 05:50:24', '2019-05-23 11:13:47'),
(62, '32', '23-05-2019 04:45:24', '', '2019-05-23 11:15:24'),
(63, '40', '23-05-2019 05:53:14', '', '2019-05-23 12:23:14'),
(64, '32', '23-05-2019 06:04:37', '', '2019-05-23 12:34:37'),
(65, '40', '24-05-2019 09:45:08', '', '2019-05-24 04:15:08');

-- --------------------------------------------------------

--
-- Table structure for table `zycus_user_master`
--

CREATE TABLE `zycus_user_master` (
  `id` int(100) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `password_reset_code` varchar(200) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `last_modified` varchar(255) NOT NULL,
  `points` varchar(100) DEFAULT NULL,
  `isdelete` varchar(100) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `zycus_user_master`
--

INSERT INTO `zycus_user_master` (`id`, `userid`, `fname`, `lname`, `email`, `mobile`, `password`, `password_reset_code`, `active`, `last_modified`, `points`, `isdelete`, `created_by`, `created`) VALUES
(1, '0001', 'Deepika', 'Acharya', 'deepika@innovins.com', '8898130405', '$2y$10$VtZ54vy738FmxKaHmVKFiO1XMcpjBGsNlAtcoY9Un3aZ/9tVNvQ8.', NULL, 1, '', '1050', '1', '', '2019-05-15 10:14:48'),
(2, '0002', 'Done', 'Done', 'Done@gnail.com', '8898132222', '$2y$10$4J9tZl.iPwV/ZZ2.ZhJB9eM7sn/FdEvMDx0g6W.sUWrsXhhL8oPYe', NULL, 1, '', '0', '1', '', '2019-05-15 11:01:43'),
(3, '0003', 'Ridhi', 'Malhotra', 'ridhi.malhotra@zycus.com', '9029055680', '$2y$10$xEZ6vhVTWkXru5/0JHllEemGomBXG4cmf2t66GtZ3TmyycI5fz/Zu', NULL, 1, '', '0', '', '', '2019-05-15 12:43:31'),
(4, '0004', 'juned', 'ahmed', 'juned.ahmed@zycus.com', '9821316681', '$2y$10$7QLzCaAK5xg65pcD3HNJDOTJsFGE74DbZQAUVSN02DjGsF4pXykuq', 'a277896facdaf68a3f2cbba727c51f13', 1, '', '0', '1', '', '2019-05-16 08:48:36'),
(5, '0005', 'juned', 'ahmed', 'juned.ahmed@zycus.com', '9821316681', '$2y$10$Bj7dPujSNpc4/rsrd2knw.7JaIKFrZ1pH68KDIAoGt/AbD0ty/s9i', NULL, 1, '2019-05-16 03:08:46', '0', '1', '', '2019-05-16 08:49:25'),
(6, '0006', 'juned', 'demo', 'admin@admin.com', '9821316681', '$2y$10$djymyeWaHh8BdW1QsZb/NOiAwc4o/lfV6x2CH1IewPV7okvlP6kni', NULL, 1, '', '0', '1', '', '2019-05-16 08:50:39'),
(7, '0007', 'demo', 'demo', 'juned.demo@zycus.com', '9821316681', '$2y$10$g0Td3SZz8wO1DdZUuawIAexWbejrcDROlb12uPDvdwMPT5s8YIwk6', NULL, 1, '2019-05-16 02:29:52', '0', '1', '', '2019-05-16 08:59:20'),
(8, '0008', 'Deepikanew', 'Acharya', 'deepika@innovins.com', '9999999999', '$2y$10$xHH8kAzK./fl8FeTQH6yY.rLQTuRklHOqgZfVOro7v5ga5Wj6Pze2', NULL, 1, '', '0', '1', '', '2019-05-16 09:39:58'),
(9, '0009', 'deepika', 'acharyaraa', 'deepika@innovins.com', '9378732711', '$2y$10$cIgfVYHGxp0stM4GLAbaF.M1FngJeOx4tu/98Ndc4ah4SEwYiBKSS', NULL, 1, '2019-05-17 10:52:51', '0', '', 'Zycus Rewards', '2019-05-16 09:48:14'),
(11, '0011', 'juned', 'ahmed', 'junedahmed@zycus.com', '9821316681', '$2y$10$F9zKnv2DZrGQAHdbXFIrtuRK3OuphhSJ6P7NJsskJ/501caPXoRIW', NULL, 1, '2019-05-17 10:05:49', '0', '', '', '2019-05-17 04:34:56'),
(15, '0013', 'juned', 'ahmed', 'juned.ahmed@zycus.com', '9821316681', '$2y$10$3pDLlX6oJw6QkAvHNq3kaOmaZrIC1gq64vLxfsunXJvx.y8CrT5Ia', NULL, 1, '2019-05-22 03:52:08', '9400', '', 'Zycus Rewards', '2019-05-17 06:32:54'),
(16, '0014', 'juned', 'ahmed', 'linda.ashok@zycus.com', '9821316681', '$2y$10$R0bBVoFa22gYraFqsqhY/.wQcv2YENxVWJSFzQ.2zgr3qpSdBJZZC', NULL, 1, '', '1450', '', 'Zycus Rewards', '2019-05-17 07:01:43'),
(17, '0015', 'juned a', 'demo', 'juned.ahmed-1@zycus.com', '9821316681', '$2y$10$npsUz/t.YOaMeddQl0Rbiu5NLq7HMh7IS9JamCUDg7VN3QA9Mhqra', NULL, 1, '', '0', '', 'Zycus Rewards', '2019-05-17 10:15:45'),
(18, '0016', 'tanvi', 'parab', 'tanvi@innovins.com', '7700016543', '$2y$10$oYYzjdpCxFnyCo2zN7MtGuefO27bHPsHmxLD7r.R68xgJi8VpaVXK', '9b243d002527d7be52ef1c670c1abc85', 1, '', '323', '1', '', '2019-05-17 10:28:02'),
(32, '0017', 'Mukunda', 'Vishwakarma', 'mukunda.v@innovins.com', '8108911304', '$2y$10$iZw9FgxZz8Z3hvp4Nut57u0CFjA92pUhTmw36o10gIf0TH8HeKgsi', 'abf0b7fc1571fb6e5ac6e64ef7a9cfc4', 1, '2019-05-20 02:34:41', '33641', '', 'Zycus Rewards', '2019-05-17 12:54:57'),
(33, '0018', 'tanvi ', 'parab', 'tanvi@innovins.com', '7700016543', '$2y$10$w54rzUlE445ROuji79Yd/ufaXZjwjBppXxE9Sa3yKmgL3EENsd/1m', NULL, 1, '', '0', '1', '', '2019-05-20 07:09:40'),
(34, '0019', 'tanvi', 'parab', 'tanvi@innovins.com', '7700016543', '$2y$10$6NB3SwY8RbqFJko49XFjNO9Gw2.mj1YUHxN3wQM4rASDm070EzpNC', NULL, 1, '', '0', '1', '', '2019-05-20 07:19:20'),
(35, '0020', 'tanvi', 'parab', 'tanvi@innovins.com', '7700016543', '$2y$10$qskMPLem5xCfAWf6UuWTyO/uoqOVg9.LvJXex.9ND.wEki2iygGti', NULL, 1, '2019-05-20 02:37:08', '400', '1', 'Zycus Rewards', '2019-05-20 07:34:48'),
(36, '0021', 'Tanvi', 'Vi', 'tanvi@innovins.com', '', '$2y$10$SCBiYgdwXa6R/nTC0Abh.OITdTWFYzRmfSr1FdyZ56mV7FM1d6M2q', NULL, 1, '2019-05-23 04:49:39', '62391', '1', 'Zycus Rewards', '2019-05-20 09:28:07'),
(37, '0022', 'Rajanikant ', 'Saner', 'rajanikant.saner@zycus.com', '', '$2y$10$PQbiJfMKw0RB3gwW4sNsZe4U1mXZXnfHPhrykwQhhEWYIVGrB7rRe', NULL, 1, '', '0', '', 'Zycus Rewards', '2019-05-22 10:20:41'),
(38, '0023', 'Bhavik', 'Champanerkar', 'bhavik@innovins.com', '9999999999', '$2y$10$qDuOO7eXHciZPZ7zWlKXhODj8sCmDnLEM9.M8I3lyXLBfWrpRd53i', '7602612d3d53b06f1aafaee9b1bdd151', 1, '', '0', '', 'Zycus Rewards', '2019-05-23 10:23:38'),
(39, '0024', 'palak', 'shah', 'palak@innovins.com', '7788990088', '$2y$10$Dw8.U8iotHxzfr9DRbniTeVNhSxKDWSA4yKwH5GT5sRnSoNJjO/tO', NULL, 1, '', '0', '', 'Zycus Rewards', '2019-05-23 11:03:36'),
(40, '0025', 'tanvi', 'parab', 'tanvi@innovins.com', '7700016543', '$2y$10$FJjYLnu1ejx1s5geLvaDRue2zAVXb0NqUvejRbyf/tMjYHa4hNiW2', NULL, 1, '', '0', '', 'Zycus Rewards', '2019-05-23 12:20:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `zycus_about_us`
--
ALTER TABLE `zycus_about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_activity_master`
--
ALTER TABLE `zycus_activity_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_admin`
--
ALTER TABLE `zycus_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_banner_master`
--
ALTER TABLE `zycus_banner_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_category_master`
--
ALTER TABLE `zycus_category_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_contactus`
--
ALTER TABLE `zycus_contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_contact_form`
--
ALTER TABLE `zycus_contact_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_gallery_content`
--
ALTER TABLE `zycus_gallery_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_home_carousel`
--
ALTER TABLE `zycus_home_carousel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_how_we_do`
--
ALTER TABLE `zycus_how_we_do`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_redeem_activity`
--
ALTER TABLE `zycus_redeem_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_redeem_master`
--
ALTER TABLE `zycus_redeem_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_user_activity`
--
ALTER TABLE `zycus_user_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_user_login_logs`
--
ALTER TABLE `zycus_user_login_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zycus_user_master`
--
ALTER TABLE `zycus_user_master`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `zycus_about_us`
--
ALTER TABLE `zycus_about_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zycus_activity_master`
--
ALTER TABLE `zycus_activity_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `zycus_admin`
--
ALTER TABLE `zycus_admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zycus_banner_master`
--
ALTER TABLE `zycus_banner_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `zycus_category_master`
--
ALTER TABLE `zycus_category_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `zycus_contactus`
--
ALTER TABLE `zycus_contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `zycus_contact_form`
--
ALTER TABLE `zycus_contact_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `zycus_gallery_content`
--
ALTER TABLE `zycus_gallery_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zycus_home_carousel`
--
ALTER TABLE `zycus_home_carousel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `zycus_how_we_do`
--
ALTER TABLE `zycus_how_we_do`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `zycus_redeem_activity`
--
ALTER TABLE `zycus_redeem_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `zycus_redeem_master`
--
ALTER TABLE `zycus_redeem_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `zycus_user_activity`
--
ALTER TABLE `zycus_user_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `zycus_user_login_logs`
--
ALTER TABLE `zycus_user_login_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `zycus_user_master`
--
ALTER TABLE `zycus_user_master`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
