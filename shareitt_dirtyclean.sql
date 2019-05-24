-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 24, 2019 at 04:44 AM
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
-- Database: `shareitt_dirtyclean`
--

-- --------------------------------------------------------

--
-- Table structure for table `dc_about_us`
--

CREATE TABLE `dc_about_us` (
  `id` int(11) NOT NULL,
  `image_name` varchar(300) NOT NULL,
  `desc1` text NOT NULL,
  `desc2` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_about_us`
--

INSERT INTO `dc_about_us` (`id`, `image_name`, `desc1`, `desc2`, `created`) VALUES
(1, 'about-1550227053-1_crop-1551064726-1.jpg', '<p>As founders and an integral part of the DirtyClean team, we are about as diverse as it gets! Mariners, Engineers, Home-Makers and Mechanical Professionals, we&rsquo;ve come together to form DirtyClean. What we do have in common is a passion for Detailing &amp; Clean Vehicles. We take Pride in our Rides! We quite literally guarantee the quality of our work. You see, we treat each vehicle like our own! We have a fully equipped self contained van, we even carry our own power generator and water allowing us to take our services just about anywhere! All you have to do is sit back relax and let us work our magic. Excited? Give us a call, we guarantee you&rsquo;ll love our work results!</p>\r\n', '', '2019-02-15 06:17:43');

-- --------------------------------------------------------

--
-- Table structure for table `dc_admin`
--

CREATE TABLE `dc_admin` (
  `id` int(100) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_role` varchar(10) DEFAULT NULL,
  `permissions` text,
  `active` tinyint(4) DEFAULT NULL,
  `last_modified` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `dc_admin`
--

INSERT INTO `dc_admin` (`id`, `fname`, `lname`, `username`, `email`, `password`, `user_role`, `permissions`, `active`, `last_modified`, `created`) VALUES
(1, 'Dirty', 'Clean', 'admin', 'dirtyclean.in@gmail.com', '$2y$10$i2wEVPdzjVe/gSx7vM3CKugSxvWlMQWuIiMTHvvPgAIf1lz2g2qP2', 'super', 'discount_coupon_view,discount_coupon_add,discount_coupon_update,discount_coupon_delete,vendor_subscription_view,vendor_subscription_create,vendor_subscription_update,vendor_subscription_delete', 1, '2019-05-20 18:01:52', '2019-01-18 10:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `dc_banner_master`
--

CREATE TABLE `dc_banner_master` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `sub_title` text NOT NULL,
  `banner_img` varchar(300) NOT NULL,
  `link` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL,
  `active` varchar(15) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_banner_master`
--

INSERT INTO `dc_banner_master` (`id`, `title`, `sub_title`, `banner_img`, `link`, `display_order`, `active`, `created`) VALUES
(8, '<strong>Mobile Car <span style=\"color:#3489ce;\">Wash </span>and <span style=\"color:#3489ce;\">Detailing</span></strong>', '<h1 style=\"font-style: italic;\"><b>We Come To <span style=\"color:#40E0D0;\">You</span>! At Work OR Home.</b></h1>\r\n', 'image-1-1558374577-1.jpg', '', 1, 'Yes', '2019-02-15 11:16:34'),
(9, 'Mobile Car Wash and Detailing', 'We come to you, at work or at home, <span style=\"color:3489ce;\">for </span>', 'engine-cleaning-1-1558375078-1.jpg', '', 2, 'Yes', '2019-02-15 11:17:03'),
(10, 'Your Satisfaction is Guaranteed!', 'We come to you, at work or at home, for full car wash and detailing services', 'maquinas-de-limpeza-a-vapor-moto-home-lavadoras-a-vapor-1558375172-1.jpg', '', 3, 'Yes', '2019-02-15 11:18:06'),
(12, 'test', 'test', 'howwedo-1551181817-1.jpg', '', 4, 'Yes', '2019-02-26 17:18:59');

-- --------------------------------------------------------

--
-- Table structure for table `dc_booking_details`
--

CREATE TABLE `dc_booking_details` (
  `id` int(11) NOT NULL,
  `personal_id` varchar(20) NOT NULL,
  `vehicle_category` varchar(100) NOT NULL,
  `vehicle_package` varchar(100) NOT NULL,
  `price` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_booking_details`
--

INSERT INTO `dc_booking_details` (`id`, `personal_id`, `vehicle_category`, `vehicle_package`, `price`, `created`) VALUES
(1, '1', '1', '1', '1500', '2019-04-02 04:53:31'),
(2, '1', '1', '1', '1500', '2019-04-02 04:53:31'),
(3, '2', '1', '1', '1500', '2019-04-02 05:02:36'),
(4, '2', '1', '2', '2500', '2019-04-02 05:02:36'),
(5, '3', '1', '2', '2500', '2019-04-02 05:48:03'),
(6, '3', '1', '2', '2500', '2019-04-02 05:48:03');

-- --------------------------------------------------------

--
-- Table structure for table `dc_category_master`
--

CREATE TABLE `dc_category_master` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `active` varchar(10) NOT NULL,
  `display_order` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_category_master`
--

INSERT INTO `dc_category_master` (`id`, `category_name`, `image`, `active`, `display_order`, `created`) VALUES
(1, 'Category 1', '1-1551950504-1.png', 'Yes', 1, '2019-02-21 06:23:59'),
(2, 'Category 2', '2-1551950464-1.png', 'Yes', 2, '2019-02-21 06:34:26'),
(3, 'Category 3', '3-1552028372-1.jpg', 'Yes', 3, '2019-02-21 06:34:36');

-- --------------------------------------------------------

--
-- Table structure for table `dc_client_reviews`
--

CREATE TABLE `dc_client_reviews` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image_name` varchar(300) NOT NULL,
  `review` text NOT NULL,
  `display_order` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_client_reviews`
--

INSERT INTO `dc_client_reviews` (`id`, `name`, `image_name`, `review`, `display_order`, `created`) VALUES
(3, 'demod', 'valentine-s_day_stones_467865_3840x2400-1550662213-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', 3, '2019-02-20 11:28:43'),
(4, 'fdgfd', '1543834308-1_large-1550662628-1.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make ', 2, '2019-02-20 11:37:08'),
(5, 'Deepika ', 'images-1551339041-1.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. I\r\n', 1, '2019-02-28 12:16:39');

-- --------------------------------------------------------

--
-- Table structure for table `dc_contactus`
--

CREATE TABLE `dc_contactus` (
  `id` int(11) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `email` varchar(60) NOT NULL,
  `registered_office` varchar(255) NOT NULL,
  `workshop` varchar(255) NOT NULL,
  `map_link` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_contactus`
--

INSERT INTO `dc_contactus` (`id`, `phone`, `email`, `registered_office`, `workshop`, `map_link`, `created`) VALUES
(1, '932-1010-932', 'dirtyclean.in@gmail.com', '<p>103 Almar, Fr Justin Road,Malad West, Mumbai,<br />\r\nMaharashtra 400064.</p>\r\n', '<p>Plot-CTS-1615,Marve Rd, Chikuwadi,<br />\r\nMalad West, Mumbai,Maharashtra 400095</p>\r\n', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3767.9781565384656!2d72.80463481490297!3d19.19615638701912!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7b69fbf88578f%3A0xc537a02e4b4a9924!2sFerro+Equip!5e0!3m2!1sen!2sin!4v1550057503049', '2019-02-20 06:07:50');

-- --------------------------------------------------------

--
-- Table structure for table `dc_contact_form`
--

CREATE TABLE `dc_contact_form` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `message` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_contact_form`
--

INSERT INTO `dc_contact_form` (`id`, `name`, `mobile`, `email`, `message`, `created`) VALUES
(1, 'Deepika ', '', 'deepika@innovins.com', 'hello \r\ni have some query', '2019-02-27 11:59:33'),
(2, 'supriya', '', 'supriya@gmail.com', 'sdadadasd', '2019-02-27 15:25:52'),
(3, 'deepika', '', 'deepika@innovins.com', 'test', '2019-02-28 11:23:54'),
(4, 'deepika', '8898130405', 'deepika@innovins.com', 'test\'\r\n', '2019-03-06 12:07:26'),
(5, 'demod', '8898130405', 'admin@gmail.com', 'tewts', '2019-03-06 17:03:47'),
(6, 'Mukunda', '8108911304', 'mukunda.v@innovins.com', 'testing', '2019-03-06 17:24:51'),
(7, 'Mukunda', '8108911304', 'mukunda.v@innovins.com', 'testing', '2019-03-06 17:26:11'),
(8, 'Mukunda', '8108911304', 'mukunda.v@innovins.com', 'testing', '2019-03-06 17:26:49'),
(9, 'Mukunda', '8108911304', 'mukunda.v@innovins.com', 'testing', '2019-03-06 17:27:48'),
(10, 'Mukunda', '8108911304', 'mukunda.v@innovins.com', 'test', '2019-03-06 17:29:29'),
(11, 'Mukunda', '8108911304', 'mukunda.v@innovins.com', 'test', '2019-03-06 17:29:42'),
(12, 'Mukunda', '8108911304', 'mukunda.v@innovins.com', 'test', '2019-03-06 17:30:32'),
(13, 'Mukunda', '8108911304', 'mukunda.v@innovins.com', 'test', '2019-03-06 17:31:59'),
(14, 'Mukunda', '8108911304', 'mukunda.v@innovins.com', 'test', '2019-03-06 17:32:11'),
(15, 'Mukunda', '8108911304', 'mukunda.v@innovins.com', 'test', '2019-03-06 17:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `dc_discount_coupon_master`
--

CREATE TABLE `dc_discount_coupon_master` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(25) NOT NULL,
  `coupon_type` varchar(50) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `coupon_usage` varchar(50) NOT NULL,
  `minimum_purchase_amount` int(11) NOT NULL,
  `special_coupon` varchar(4) DEFAULT NULL,
  `active` varchar(5) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `dc_discount_coupon_master`
--

INSERT INTO `dc_discount_coupon_master` (`id`, `coupon_code`, `coupon_type`, `coupon_value`, `valid_from`, `valid_to`, `coupon_usage`, `minimum_purchase_amount`, `special_coupon`, `active`, `created`) VALUES
(8, 'FLAT10', 'percent', 10, '2019-02-19', '2019-02-28', 'single', 0, 'Yes', 'Yes', '2019-02-19 10:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `dc_faqs`
--

CREATE TABLE `dc_faqs` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `question` text,
  `answer` text,
  `display_order` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_faqs`
--

INSERT INTO `dc_faqs` (`id`, `category`, `question`, `answer`, `display_order`, `created`) VALUES
(1, 'Booking', 'How do I book a detailing service?', 'We offer different ways to book our detailing services. You may call us and ask for a preferred time slot. Or mail us with your requirements and we will recommend the service best suited to you. Or visit our website and choose the date and time slots available which are convenient to you.\r\n                            Whatever booking method you choose, we strive to be there within 90 minutes of a confirmed booking.', 1, '2019-02-28 06:16:31'),
(2, 'Booking', 'Where do you operate? I live out of Mumbai.', 'Currently we offer our complete detailing packages within the geographical limits between Bandra & Borivali. Based on the response and travelling times we will look at expanding to a wider reach if sustainable. Our serviceable Pin-Codes are listed in our booking form. If you donâ€™t see your Pin- Code listed then we currently donâ€™t operate at that location at the moment. If you have any additional queries feel free to mail us.', 3, '2019-02-28 06:16:31'),
(3, 'Booking', 'Where are you located? What are your timings?', 'We come to you! Whether you are at home, oï¬ƒce or even on vacation. We operate out of a completely self suï¬ƒcient mobile unit. Generally, we do not need any power or water   requirements at your premises and we carry everything needed to get your vehicle looking its  best.\r\n                            Working Hours:\r\n                            We operate from 8 a.m to 8 p.m all days of the week.                            Working Hours:\r\n                            We operate from 8 a.m to 8 p.m all days of the week.', 2, '2019-02-28 06:16:31'),
(4, 'Booking', 'Do you do emergencies? I need my car cleaned ASAP!', 'As a work ethic we donâ€™t normally operate beyond our displayed working hours. But then again, we understand it\'s not always possible to fit in. While we cannot guarantee availability we will do our best to accommodate you. Needless to say all additional charges beyond working hours will be disclosed to you prior booking and dispatch.', 4, '2019-02-28 06:16:31'),
(5, 'Process', 'What Are the different types of Detailing Service you offer?', 'Refer to our website for a comprehensive list of different packages. All our detailing services start off the same way, with a thorough hand wiped and pressurised steam clean which sanitises and removes most surface dirt and contaminants without the use of harsh chemicals. We also offer Foam or Ph neutral Shampoo wash if you so desire. Depending on the condition of your vehicle and the recommended package, we have different levels of preparation, detailing and finishes to complete the job.', 2, '2019-02-28 06:16:31'),
(6, 'Process', 'Do you have a pre-work checklist? That scratch wasnâ€™t there before.', 'Yes, we start off with a detailed video/photographs of the vehicle in your presence highlighting all prior defects, scratches and paint damage to the interior and exterior. We also explain the limitations of our services, what we can/cannot do and the different services we offer and their benefits.', 1, '2019-02-28 06:16:31'),
(7, 'Process', 'Do I need an appointment or prior booking? What if there is a delay?', 'While not a necessity we recommend pre-booking via our web form, this way we can confirm your place in the queue. We try our best to reach you within 90 mins of a confirmed booking. Incase of any unforeseen delays/break-down of equipment we will inform you well in advance and reschedule if needed at no additional cost to you.', 3, '2019-02-28 06:16:31'),
(8, 'Process', 'What type pf payment options do you have?', 'As of now we accept Cash, Credit/Debit card at-site and Online payments. We do not offer   Credit. All payments to be made at the end of the service and in full.', 4, '2019-02-28 06:16:31'),
(9, 'Billing', 'What deals/discounts do you offer on different services?', 'While we have priced all our services at competitive rates, we also offer additional discounts if certain conditions are met:\r\n1. 3+ cars at a single location - 10% off on the entire bill - Valid for same category vehicles and same service package. Valid once/day. Max 4 Vehicles.\r\n2. Pay for 11 months - Get 3 additional washes! Applicable for any service package paid annually.\r\n3. Budget wash - Quick wash for those in a hurry - 2 vehicle minimum subject to a max of 6 vehicles.\r\n** Refer detailed Terms/Conditions\r\n', 1, '2019-02-28 06:16:31'),
(10, 'Billing', 'What other types of services do you offer? Denting, Painting, Mechanical Repair?', 'Yes there are! In case we come across any issues which require more than normal effort, use of cleaning materials, equipment and time like:\r\n1. Heavy Mold/Mildew/Fungus coating all over the car exterior and interior\r\n2. Deeply ingrained and excessive PetHair/Cigarette Burns\r\n3. Human Waste/Vomit/Animal Poop/Paan and other stains not of a normal nature\r\n4. Severe Muck/Mud stains of an abnormal nature (Racing/Off-road/Rally Cross)\r\n5. Any other stains/issues not occurring during normal use (eg: Chemicals/Tar/Acid/Oil/Rust etc) Our technician will advise you of this during the pre-work inspection.\r\n** Refer detailed Terms/Conditions', 2, '2019-02-28 06:16:31'),
(11, 'Billing', 'Are there any hidden costs? Are taxes included?', 'We have no hidden costs or anything extra. All charges are disclosed to you upfront. All services and complete job scope is also displayed on our website. What you see is what you pay for. We donâ€™t encourage tips but if you feel our staff have done a great job then go ahead and  appreciate them. If we can give you better value for your money then please use the feedback form and let us know. We try to provide you the most bang for your buck!', 3, '2019-02-28 06:16:31'),
(12, 'Billing', 'Is satisfaction guaranteed?', 'Yes your satisfaction is guaranteed! We are committed to giving you the best clean ever and are only happy when you are happy! In case you are not satisfied with our level of work please bring it to our notice. We will inspect and redo the complete section until you are fully satisfied. The best way to assure satisfaction is to thoroughly review your vehicle BEFORE our team leaves.', 4, '2019-02-28 06:16:31'),
(13, 'General', 'Do you offer Refunds? I want to cancel my booking.', 'Unfortunately we have a No-refund policy. But thats the last of the bad news. The Good news is we will offer you a pre-paid service note which can be utilised at any time with prior booking.\r\n                            Either way, you donâ€™t stand to lose anything. Our pre-paid service note has an unconditional 1 yr validity.', 1, '2019-02-28 06:16:31'),
(14, 'General', 'How long does the service take?', 'Time required for services depends on the type of vehicle, the service package requested, the number of technicians, and the equipment available. Following are approximate times for a dual- crew team.\r\n\r\n                            Dirty Detailing Package â€” 1.0 - 2.0 hours Very Dirty Detailing Package -- 2.0 - 3.0 hours\r\nExtremely Dirty Detailing Package -- 3.0 - 4.0 hours DirtyClean Plus+ Detailing Package -- 4.0 - 5.0 hours \r\nInterior Only -- 1.0 - 2.0 hours\r\nExterior Only -- 1.0 - 2.0 hours\r\nBudget Wash -- 30 minutes/car (Min 2 cars)', 2, '2019-02-28 06:16:31'),
(15, 'General', 'Are any permissions required? How much space do you need to work?', 'Yes your society/office premise permission is required prior commencing work. We will not be held responsible if we are denied our full operational methods and required space. We need\r\n                            unobstructed access to all 4 doors and the trunk/hood with at least 2 feet space on either side to move about freely. Plus sufficient space to park our van either at the side or the front/back of the vehicle being serviced. We do not clean any vehicle on the road/public space as it is not permitted by law. We also ensure the place is reasonably cleaned and no residue is left behind one we are done.', 3, '2019-02-28 06:16:31'),
(16, 'General', 'Can I gift a detailing package?', 'Yes you can. We offer gifting services for all our packages. You just need to select the â€˜giftâ€™ option from the booking form. We need the recipients name, address and contact details. Choose the correct date and time slot available. Multiple gifts can also be booked to different recipients. All gift payments to be made in advance.', 4, '2019-02-28 06:16:31'),
(17, 'General', 'Do you have a disclaimer policy? Where can I read the detailed terms and conditions?', 'Refer to our Disclaimer and Terms & Conditions for all legal binding issues with using our services. Click on this link -', 5, '2019-02-28 06:16:31');

-- --------------------------------------------------------

--
-- Table structure for table `dc_feature_master`
--

CREATE TABLE `dc_feature_master` (
  `id` int(11) NOT NULL,
  `feature_name` varchar(100) NOT NULL,
  `display_order` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_feature_master`
--

INSERT INTO `dc_feature_master` (`id`, `feature_name`, `display_order`, `created`) VALUES
(1, 'Interior', 1, '2019-02-21 08:29:38'),
(2, 'Exterior', 2, '2019-02-21 08:29:38'),
(3, 'Engine Bay', 3, '2019-02-21 08:29:44');

-- --------------------------------------------------------

--
-- Table structure for table `dc_footer`
--

CREATE TABLE `dc_footer` (
  `id` int(11) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `google` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_footer`
--

INSERT INTO `dc_footer` (`id`, `facebook`, `twitter`, `google`, `instagram`, `created`) VALUES
(1, '#', '#', '#', '#', '2019-02-20 08:18:41');

-- --------------------------------------------------------

--
-- Table structure for table `dc_gallery`
--

CREATE TABLE `dc_gallery` (
  `id` int(11) NOT NULL,
  `image_name` varchar(300) NOT NULL,
  `display_order` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_gallery`
--

INSERT INTO `dc_gallery` (`id`, `image_name`, `display_order`, `created`) VALUES
(8, 'gallery-review-1551337683-1.jpg', 1, '2019-02-20 11:11:33'),
(9, 'o-1551337645-1.jpg', 2, '2019-02-20 11:36:47');

-- --------------------------------------------------------

--
-- Table structure for table `dc_gallery_content`
--

CREATE TABLE `dc_gallery_content` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `video_link` varchar(255) NOT NULL,
  `image` varchar(500) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_gallery_content`
--

INSERT INTO `dc_gallery_content` (`id`, `title`, `description`, `video_link`, `image`, `created`) VALUES
(2, 'Review of the car detailing by our client', '<p><span style=\"font-size:14px;\">Call us for a pickup or drive straight up to our workshop and leave the car under our care. We always exceed your expectations! Call us for a pickup or drive straight up to our workshop and leave the car under our care. We always exceed your expectations! Call us for</span></p>\r\n\r\n<p>A pickup or drive straight up to our workshop and leave the car under our care. We always exceed your expectations! A pickup or drive straight up to our workshop and leave the car under our care. We always exceed your expectations!</p>\r\n\r\n<p>Call us for a pickup or drive straight up to our workshop and leave the car under our care. We always exceed your expectations! Call us for a pickup or drive straight up to our workshop and leave the car under our care. We always exceed your expectations!</p>\r\n', '', '', '2019-02-20 09:27:24'),
(3, '', '<p>Car Detailing & Washing like no other! Delivered to You! On time!</p>\r\n\r\n<p>Welcome to DirtyClean. Let\'s skip the boring intro and get right to it! We take pride in what we do & our results speak for themselves. Right from our fully equipped and self contained van (we call her â€˜Bessyâ€™), our premium range of detailing & cleaning products and our industrial grade equipment we guarantee you will love our work!</p>\r\n\r\n<p>Our trained team will guide you through the entire process of what to expect with the package you choose and ensures absolutely no compromise in the results you expect! Our attention to detail is obsessive and we donâ€™t mind getting dirty to deliver clean to you. Call us today, we promise you will be satisfied!</p>\r\n', 'https://www.youtube.com/embed/9ZzL2NAE1xo', '', '2019-02-21 03:18:28'),
(4, '', '<div class=\"row\">\r\n<div class=\"col-md-12\">\r\n<div>\r\n<p style=\"margin-left: 5pt; text-align: justify;\">Confused between all the terms used? Don&rsquo;t know your waxes from your polishes? Compounds? We&rsquo;re here to help. Let&rsquo;s break it down for you.</p>\r\n\r\n<h1 style=\"text-align: justify;\">What is Car Detailing?<img alt=\"\" src=\"/ckfinder/userfiles/images/dc.png\" style=\"width: 222px; height: 200px; float: left;\" /></h1>\r\n\r\n<p style=\"text-align: justify;\">Are you tired of looking at that dull finish on your car? All you see is swirls, scratches and paint rough to the touch. What happened to that shiny glossy feel, the smooth paint, that new car smell?</p>\r\n\r\n<p style=\"text-align: justify;\">Dirty rags, hard&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\">water, and dry rubbing can strip a vehicles finish in no time leaving your brand new car with scratches, swirl marks and looking ragged. UV rays, bird droppings, rain, pollution and dirt just add to the damage.</p>\r\n\r\n<p style=\"text-align: justify;\">Welcome to the world of Auto Detailing!</p>\r\n\r\n<p style=\"text-align: justify;\">&gt;&gt;Detailing is a comprehensive top-to-bottom and inside/out thorough cleaning and reconditioning of your vehicle using specialised tools and products that achieve results far beyond what a routine or daily wash can. Every car we detail has every last imperfection buffed, polished, or vacuumed out leaving it as good as new, smelling as fresh as ever and with the right care and attention can last from a few months to a year with regular upkeep.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">&gt;&gt; Our variety of detailing packages are designed in such a way as to give you unmatched value-for-money and thorough satisfaction irrespective of the package you choose. Using a variety of methods like clay bar treatment, high-end polishes, compounds and waxes, pH neutral car shampoos, an advanced steam interior cleaning with stain removal, seat extraction and leather treatment as well as dressing on all the plastics we ensure your vehicle is looking its absolute best!</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<h1 style=\"text-align: justify;\">The Detailing Process<img alt=\"\" src=\"/ckfinder/userfiles/images/dc.png\" style=\"width: 222px; height: 200px; float: right; margin: 10px;\" /></h1>\r\n\r\n<p style=\"text-align: justify;\">We come to your location (office or home) at a convenient time and date chosen by you. This saves you the trouble of having to drive to a detailing shop or car wash and wait around doing nothing while your car is washed/cleaned and detailed, sometimes for hours on end. A full car detailing package consists of three main phases: interior detailing, exterior detailing and engine bay cleaning. We break down each phase so you know exactly what to expect when you get your vehicle washed/detailed with us.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<h1 style=\"text-align: justify;\">Exterior Car Detailing<img alt=\"\" src=\"/ckfinder/userfiles/images/car-detailing-exterior.jpg\" style=\"width: 222px; height: 200px; float: left; margin: 10px;\" /></h1>\r\n\r\n<p style=\"text-align: justify;\">We begin with an exhaustive exterior wash to remove as much dust and dirt as possible. We use:</p>\r\n\r\n<p style=\"text-align: justify;\">Pressurised Steam Jet - Our preferred wash, sanitises and no chemicals</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;Pressure Foam wash - High pressure foam gets into all nooks/crannies</p>\r\n\r\n<p style=\"text-align: justify;\">Hand wash with Sponge - Elbow grease and a pH neutral shampoo</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">Whatever method we use, dirt and mud are softened and lifted off the surface either with high pressure, hand wash or a high pressure steam wipe down.</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">Our team does a comprehensive degrease treatment for the wheel rims, alloys and brake callipers. Tyres are scrubbed with special brushes and we clean in-between the lug nuts too.The wheels, wheel wells and suspension are usually the dirtiest part of the car!</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">The paintwork is washed and dried from top to bottom using washing mitts and microfibre towels. A new set of towels is used for each vehicle. The paintwork is then clayed using a clay bar that removes the stubborn dirt and stains which are still left behind after washing. Depending on the package, the paint is polished to eliminate any light scratches, oxidation, and swirl marks. The paint can be polished by hand or by a polishing machine. This is the most time-consuming part of the detailing process depending on the car and the state of</p>\r\n</div>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<div>\r\n<p style=\"margin-left: 5pt; text-align: justify;\">its paintwork. By this time the paint has achieved a nice glossy sheen to it and feels extremely smooth to the touch.</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">Finally, the vehicle is waxed with an orbital polisher machine to give it an additional protective layer using high-quality carnauba based paste or liquid wax. This added protection results in an even glossier liquid shine.</p>\r\n\r\n<p style=\"text-align: justify;\">Head-lights/Tail-lights are treated with a special protectant spray and buffed to a high shine to attain a high level of protection against harsh UV rays and prevent fading and browning. The windows are cleaned with special streak-free window cleaner inside and out for absolutely clear vision.</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">Rubber parts, trim, bumper strips, mirrors are then cleaned and polished with a special exterior coat to complete the exterior detailing process and make the entire car look gleaming.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<h1 style=\"text-align: justify;\">Interior Car Detailing<img alt=\"\" src=\"/ckfinder/userfiles/images/auto-interior-cleaning1.jpg\" style=\"width: 222px; height: 200px; float: right; margin: 10px;\" /></h1>\r\n\r\n<p style=\"text-align: justify;\">A high pressure blower is used on the complete interior surfaces including seats and under-seat areas, roof liner and trunk to loosen and blow off any dirt and dust from the surfaces.</p>\r\n\r\n<p style=\"text-align: justify;\">Next, all of the upholstery and carpet inside the car and trunk lining is thoroughly vacuumed with a high suction vacuum and shampooed or even soft brushed with soap and cleansing foam to remove stains and dirt. If the car has fabric seats, seat extraction is done with our extractor machine and If the car has leatherwork, this is often conditioned and scrubbed to remove dirt that is deeply ingrained. A leather polish is finally applied to preserve and enhance the leather smell and feel.</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">The roof liner is pressure steam cleaned to remove all dirt stains, sanitise the surface and remove trapped smells.</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">The entire dashboard is cleaned, scrubbed down with a soft brush, and a coat of non- glossy protectant coating is applied to it and allowed to dry. This prevents fading of the plastics and leaves behind a clean residue free surface which repels dust.</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">Vents, speaker enclosures, dashboard buttons, storage compartments etc are lightly brushed and dry-steam cleaned to sanitise and remove all surface germs and contaminants. A final wipe down with a protective coating keeps everything looking clean and fresh.</p>\r\n\r\n<p style=\"text-align: justify;\">Plastics and vinyl are also properly cleaned and dressed.</p>\r\n\r\n<p style=\"text-align: justify;\">Lastly, the rear view mirror and interior glasses are cleaned to a steak free finish.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<h1 style=\"text-align: justify;\">Engine Bay Cleaning<img alt=\"\" src=\"/ckfinder/userfiles/images/engine-bay-cleaning-1.png\" style=\"width: 222px; height: 200px; float: left; margin: 10px;\" /></h1>\r\n\r\n<p style=\"text-align: justify;\">Cleaning the engine bay is an important but often overlooked part of the detailing process and a lot of people simply don&rsquo;t do it. A clean engine bay can make a big impression on how well maintained a car is and is instrumental in identifying any engine problems and leakages very easily. Having a clean engine bay also raises the overall value of a car.</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">But it is not as straightforward as cleaning the interior or exterior due to the presence of highly sensitive and delicate electrical equipment.</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">Our team cleans the engine bay by using high pressure dry-steam with minimal moisture content. This protects the electrical system from water ingress. Then wiping it down with a specific engine degreaser before steaming everything clean once again. Once properly dried with a high pressure air blower, all silicone, plastic and rubber components are properly dressed to protect them from cracking. Battery and fluid containers are included. If easily accessible, we steam clean or pressure wash the radiator and a/c condenser coils too. This aids the efficiency of the cooling system and the a/c cooling effectiveness.</p>\r\n</div>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">Detailing or meticulous washing a vehicle is a time consuming and highly professional process that involves the use of specialised equipment, premium high-quality materials and a lot of effort.</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">A complete car detail will bring your car to its best condition. Even a brand new car stands to benefit from our paint protection and waxing process.</p>\r\n\r\n<p style=\"text-align: justify;\">Keeping your car in good condition will help maintain or restore the value of your car. You simply cannot get the same results from your regular car wash.</p>\r\n\r\n<h1 style=\"text-align: justify;\">Cost</h1>\r\n\r\n<p style=\"text-align: justify;\">You&rsquo;re probably thinking how much this is all going to cost you? We have created our value-for-money packages to suit every need and every budget. Whether you&rsquo;re looking for a regular professional car wash or a complete detail we&rsquo;ve got you covered. The size of your vehicle is a major factor in determining prices. So, an SUV obviously won&rsquo;t cost the same as a Hatch &ndash; but the difference isn&rsquo;t as much either. Think of it as a low-cost investment delivering high-value returns.</p>\r\n\r\n<p style=\"text-align: justify;\">Starting from 599/- onwards, our packages offer terrific value. And you can be assured of our attention to detail and complete job satisfaction.</p>\r\n\r\n<p style=\"margin-left: 5pt; text-align: justify;\">However, severely dirty vehicles, excessive pet hair, poop/paan stains, oil/grease/tar and off-road mud/muck will cost additional, sometimes up-to 30% extra of the chosen package. Refer our detailed<a href=\"http://shareittofriends.com/demo/dirtycleanphp/terms-n-conditions.php\" target=\"_blank\"> <u>Terms &amp; Conditions.</u></a></p>\r\n</div>\r\n</div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-12\">\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n', '', '', '2019-02-21 03:18:28'),
(5, '', '<div>\r\n<h3 class=\"title4\" style=\"text-align: center;\"><strong><span style=\"font-size:20px;\">Definitions, Disclaimer &amp; Detailed Terms &amp; Conditions</span></strong></h3>\r\n\r\n<p>We encourage you to go through these detailed terms and conditions to better understand how we work, what we use and limitations we might face before or during detailing your vehicle.</p>\r\n\r\n<p>These are general guidelines and are not binding to each and every vehicle OR package. These are abnormal or unusual conditions and situations we might face during our detailing process and necessitate a clarification in advance to avoid any uncertainty or discrepancies later on.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3 class=\"title4\" style=\"text-align: center;\"><strong><span style=\"font-size:20px;\">PRODUCTS WE USE:</span></strong></h3>\r\n\r\n<p>We exclusively purchase, stock and use products from proven, trusted and industry accepted brands like: Meguiar&#39;s / Chemical Guys / Formula 1 / STP / Armorall / 3M etc. All our Detailing products are used exactly as per company specifications and dilution ratios are maintained as specified. We do not endorse any particular brand or product and our selections keep changing based on continual upgrades of products and&nbsp;equipments.</p>\r\n\r\n<p>Rest assured the well being of your vehicle and your satisfaction means everything to us and we will not compromise on our quality standards!</p>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<h3 class=\"title4\" style=\"text-align: center;\"><strong><strong><span style=\"font-size:20px;\">EQUIPMENT &amp; MACHINERY:</span></strong></strong></h3>\r\n\r\n<p>Our Detailing Equipment &amp; Machinery comes from Industry standard manufacturers like :</p>\r\n\r\n<p>Honda, Manmachine, Bosch, Karcher and Stanley. Operating procedures are followed thoroughly by our team of qualified professionals. Again, we believe the right tool for the job is far more important rather than getting it done cheaper and at a lower standard.</p>\r\n\r\n<p><strong><strong>&nbsp;</strong></strong></p>\r\n\r\n<h3 class=\"title4\" style=\"text-align: center;\"><strong><span style=\"font-size:20px;\">STEAM JET CLEAN:</span></strong></h3>\r\n\r\n<p>Unless otherwise specified, all our cleaning processes use high pressure steam&nbsp;(Steam&nbsp;pressure:&nbsp;6-8&nbsp;Bar&nbsp;/&nbsp;Steam&nbsp;Temp:&nbsp;80-90*c)&nbsp;which&nbsp;guarantees&nbsp;to sanitise&nbsp;and&nbsp;clean&nbsp;surface&nbsp;contaminants&nbsp;without&nbsp;the&nbsp;use&nbsp;of&nbsp;harsh&nbsp;chemicals. Steam is an industry accepted method utilised the world over for fast, eï¬ƒcient&nbsp;and&nbsp;thorough&nbsp;cleaning&nbsp;which&nbsp;at&nbsp;times&nbsp;matches&nbsp;or&nbsp;even&nbsp;exceeds&nbsp;the results achieved with the use of harsher chemicals/products OR high pressure water. Steam also utilises&nbsp;less&nbsp;water&nbsp;per&nbsp;car&nbsp;and&nbsp;creates&nbsp;a&nbsp;very&nbsp;eco-friendly&nbsp;way&nbsp;of&nbsp;cleaning.</p>\r\n\r\n<p>If you still feel the need for a water based wash, we do offer high pressure foam wash or hand wash with pH neutral car shampoos.</p>\r\n\r\n<p>Kindly intimate us on your requirement prior commencing services.</p>\r\n\r\n<p><strong><strong>&nbsp;</strong></strong></p>\r\n\r\n<h3 class=\"title4\" style=\"text-align: center;\"><strong><strong><strong><span style=\"font-size:20px;\">INTERIORS:</span></strong></strong></strong></h3>\r\n\r\n<p>We don&rsquo;t remove/handle wires, under-seat amplifiers, exposed wiring conduits etc. We work around these items to prevent any untoward incident. It is your responsibility to provide a safe, clutter free and non-hazardous working zone for our&nbsp;team.</p>\r\n\r\n<p>We strongly recommend you remove all old papers, valuables, receipts, USB drives and any other personal items of importance from the vehicle prior our service. We will not be held responsible for any Loss/Theft of items. Our team will have a final check for anything of value and hand it over to you prior&nbsp;commencing&nbsp;work&nbsp;but&nbsp;the&nbsp;final&nbsp;responsibility&nbsp;lies&nbsp;with&nbsp;you,&nbsp;the&nbsp;owner.</p>\r\n\r\n<p>Seat Extraction/Wipe downs - We blow dry up to at least 80% dryness but some dampness might still remain due to the extraction process. We recommend fabric seats to dry in the sun at least 2-3 hrs prior use. This is standard practice and is recommended after a detailed seat vacuum and cleaning. Not applicable to Leather/Vinyl seats and seat covers.</p>\r\n\r\n<p><strong><strong><strong>&nbsp;</strong></strong></strong></p>\r\n\r\n<h3 class=\"title4\" style=\"text-align: center;\"><strong><strong><strong><strong><span style=\"font-size:20px;\">EXTERIORS:</span></strong></strong></strong></strong></h3>\r\n\r\n<p>Exterior drain channels are only cleaned up till where our equipment can reach. Leaves/branches, debris within the wiper housing, door drain channels, wheel well drains are not possible to be cleaned during routine service and will require professional dismantling to clean. This is beyond the scope of our equipment.</p>\r\n\r\n<p>Brake pad holders, disc rotors are not always easily accessible and are not guaranteed cleaned as covered during our washing service. Especially on cars with steel rims.</p>\r\n\r\n<p>We avoid shifting or removing electrical connectors, pipes, hoses, belts, moving parts etc within the engine bay. We use super heated steam and work on a as-seen basis. Unaccessible areas, Severe oil/grease stains, interior drain channels and crevices beyond the reach of our equipment will be unable to be detailed as thoroughly. Deep Engine bay cleaning is on a best effort basis.</p>\r\n\r\n<p>We don&rsquo;t guarantee the Manufacturer/Company specified longevity of our waxes/polishes &amp; coatings/sealants. We apply and dry all coatings/waxes and polishes as per company specification. But, regular Use of Hard water, abrasive cloths, dry wipe downs on a daily basis strip away the protective coatings faster than normal. This is not indicative of the quality of materials we use but rather the daily cleaning processes and environmental conditions the vehicle is subject&nbsp;to.</p>\r\n\r\n<p>Removal/treatment of Deep Rust stains / Hard water marks/ Deep scratches/ Paint damage/Clear Coat Stripping / Scuffed Alloys etc are beyond the capabilities of our equipment and would require Workshop Level procedures and equipment to correct defects.</p>\r\n\r\n<p><strong><strong><strong><strong>&nbsp;</strong></strong></strong></strong></p>\r\n\r\n<h3 class=\"title4\" style=\"text-align: center;\"><strong><span style=\"font-size:20px;\">STAGE 1, 2 &amp; 3 DEFINITIONS:</span></strong></h3>\r\n\r\n<p>All of our packages feature different levels of detailing and comprehensiveness to suit the package costs and our time/equipment limitations.</p>\r\n\r\n<p>Stage 1 - Basic levels of cleaning and polishing. We attack all surface dirt and contaminants, and work within the limits of a single piece of equipment. Most visible dirt will be removed and the</p>\r\n\r\n<p>Stage 2 - Standard levels of cleaning and polishing. In addition to the limits of our cleaning equipment we supplement the use of additional cleaning &amp; polishing products and accessories to detail and clean to an even greater degree. In addition to most surface dirt, we also remove stains and other contaminants not easily visible.The results are clearly visible.</p>\r\n\r\n<p>Stage 3 - Advanced level of cleansing and polishing. In addition to Stage 2 levels, we use the whole array of our specialised cleaning &amp; polishing equipment and products to deliver a very high quality standard of detailing and cleansing that returns the material to at or as near factory levels as possible. These are very time consuming and highly intensive processes and require professional levels of application to guarantee a good finish.</p>\r\n\r\n<p><strong><strong><strong><strong>&nbsp;</strong></strong></strong></strong></p>\r\n\r\n<h3 class=\"title4\" style=\"text-align: center;\"><strong><span style=\"font-size:20px;\">90 MINUTES ARRIVAL:</span></strong></h3>\r\n\r\n<p>We try our best to offer a 90 minute arrival time after a confirmed booking. At times it will not be possible to ensure we arrive on or before 90 mins. Various factors like: Traï¬ƒc conditions, floods, riots, road works, road closures, VIP movement and such can significantly affect our arrival time. Under no circumstances will DirtyClean be held responsible or liable for any loss or delay due to circumstances beyond our control. We will always keep you updated in case of any delays and make all reasonable efforts to reach you on time OR reschedule for a more convenient time/date if necessary. In case we are unable to reach your location within a reasonable time, you are informed to cancel the current booking and re-schedule if our delay will &nbsp;cause you any disruption in your&nbsp;plans.</p>\r\n\r\n<p><strong><strong><strong><strong>&nbsp;</strong></strong></strong></strong></p>\r\n\r\n<h3 class=\"title4\" style=\"text-align: center;\"><strong><strong><strong><strong><strong><span style=\"font-size:20px;\">COUPONS/DISCOUNTS:</span></strong></strong></strong></strong></strong></h3>\r\n\r\n<p>We do offer discounts and coupons from time to time.</p>\r\n\r\n<p>All coupons should be applied at the time of booking. Or should be mentioned prior confirming the same over the phone or via email. Once the</p>\r\n\r\n<p>payment invoice is generated, utilising coupons after a confirmed booking will not be entertained.</p>\r\n\r\n<ul>\r\n	<li>3+ vehicles, up-to a max of 6 vehicles/day - depending on package/ category chosen should be located within the &nbsp;same &nbsp;society/oï¬ƒce premises. This saves our unloading/loading and travelling time. We have a limited supply of on-board storage of water and would require access to a water source incase we exceed our limited on-board supply. ANY vehicles from ANY category and ANY package can avail this offer. All vehicles will be charged as per the package chosen and 10% Off will be on the total invoice value. *Subject to time of day/package/class - will be informed at time of booking for same/next day&nbsp;availability.</li>\r\n	<li>We also offer 3 extra washes on an annual payment of 11 months in advance. This is on a assumption of 1 or 2 washes/month. Or 2 washes/ month. For a 11 months package we offer a total of 14 months. This offer is&nbsp;applicable on all our Standard plans. Applicable for a single vehicle&nbsp;only.</li>\r\n	<li>Budget wash are typically hand washes with a quick vacuum of the interior and take not more than 30 mins/car. We need a 2 car minimum subject to a max of 6 cars in the same location. Vehicles can be from any category. Will be charged accordingly.</li>\r\n	<li>All billing invoices will be sent via email or sms.</li>\r\n</ul>\r\n\r\n<p>Our rates are all inclusive and include GST and any other relevant taxes.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3 class=\"title4\" style=\"text-align: center;\"><strong><strong><strong><strong><strong><strong><span style=\"font-size:20px;\">BREAKDOWNS/REFUNDS:</span></strong></strong></strong></strong></strong></strong></h3>\r\n\r\n<p>We might experience equipment or vehicle breakdowns or delays due to unforeseen circumstances or reasons completely beyond our control. During such situations, we will make all reasonable efforts to either reach the cleaning location with back-up equipment OR inform the recipient of our inability to complete the job at the scheduled time and place. In case we are unable to do the job at the specified date and time, we will either, with your permission reschedule our service OR offer a 1-time use credit note with an unconditional 1 year validity if the service has been paid for in advance.</p>\r\n\r\n<p>Unfortunately at this time we are unable to process or offer refunds. Rest assured your booking/payment will not go to waste and we will make all efforts to get your service completed as soon as possible.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3 class=\"title4\" style=\"text-align: center;\"><strong><span style=\"font-size:20px;\">SERVICE LIMITATIONS:</span></strong></h3>\r\n\r\n<ul>\r\n	<li>Heavy Mold/Mildew/Fungus coating all over the car exterior and&nbsp;interior</li>\r\n	<li>Deeply ingrained and excessive PetHair/Cigarette Burns</li>\r\n	<li>Human Waste/Vomit/Animal Poop/Paan and other stains not of a normal nature</li>\r\n	<li>Severe Muck/Mud stains of an abnormal nature &nbsp;(Racing/Off-road/Rally&nbsp;Cross)</li>\r\n	<li>Any other stains/issues not occurring during normal use (eg: Chemicals/ Tar/Acid/Oil/Rust etc)</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The above list is not comprehensive but only indicative of what comprises abnormal nature. These will incur an excessive cleaning cost of up-to 30% of the Total package cost. Advance booking and payment is a must. Time guarantees do not apply under these working conditions. We do not offer a satisfaction guarantee in these cases as interiors/exteriors could be &nbsp;damaged beyond our standards of condition recovery. Cleaning/Detailing will be on a best-effort basis. Needless to say we will ensure you get the same levels of detail and care that we utilise on other&nbsp;vehicles.</p>\r\n\r\n<p><strong><strong><strong><strong><strong><strong><strong>&nbsp;</strong></strong></strong></strong></strong></strong></strong></p>\r\n\r\n<h3 class=\"title4\" style=\"text-align: center;\"><strong><strong><strong><strong><strong><strong><strong><strong><span style=\"font-size:20px;\">COPYRIGHT VIOLATION:</span></strong></strong></strong></strong></strong></strong></strong></strong></h3>\r\n\r\n<p>Our website, our copyright design and any/all trademarks associated with and registered (Intellectual Property) within our company remain the exclusive property of <u>DirtyClean.in</u>&nbsp;and its registered owners. Any infringement of our intellectual property will result in severe prosecution by law and will be dealt with severely and punishable under the court of law subject to Mumbai jurisdiction only.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3 class=\"title4\" style=\"text-align: center;\"><strong><strong><strong><strong><strong><strong><strong><strong><strong><span style=\"font-size:20px;\">REVIEWS / FEEDBACK:</span></strong></strong></strong></strong></strong></strong></strong></strong></strong></h3>\r\n\r\n<p>We are always open to constructive criticism and feedback and we encourage you to utilise the feedback form, view us facebook, twitter, instagram, google+ or mail us and review our company and our services once detailing is done. This will help us to continually improve our methods, change what needs to be changed and deal with any negative feedback in a positive way. After all we value customer satisfaction in a big way and we want to leave you with a big smile on your face!</p>\r\n\r\n<p>We strive to Be Honest and Be True. What propels us is the relationships we build and the code we conduct ourselves by. We will always stick to our core as that is what builds our business as a company. Our satisfaction guarantee is unconditional and we stand by what we say!</p>\r\n</div>\r\n', '', '', '2019-02-21 03:18:28');

-- --------------------------------------------------------

--
-- Table structure for table `dc_home_carousel`
--

CREATE TABLE `dc_home_carousel` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `sub_title` varchar(100) NOT NULL,
  `image_name` varchar(300) NOT NULL,
  `link` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_home_carousel`
--

INSERT INTO `dc_home_carousel` (`id`, `title`, `sub_title`, `image_name`, `link`, `display_order`, `created`) VALUES
(1, 'DRY', '', 'new-project-2-1551932254-1.jpg', '', 2, '2019-02-21 04:36:17'),
(3, 'Wash', '', '1-1551867995-1.png', '', 1, '2019-02-21 05:09:56'),
(4, 'CLAY', '', 'new-project-3-1551932333-1.jpg', '', 3, '2019-03-07 09:48:53'),
(5, 'PREP', '', 'new-project-13-1551932351-1.jpg', '', 4, '2019-03-07 09:49:11'),
(6, 'INSPECT', '', 'new-project-12-1551932362-1.jpg', '', 5, '2019-03-07 09:49:22'),
(7, 'POLISH', '', 'new-project-11-1551932373-1.jpg', '', 6, '2019-03-07 09:49:33'),
(8, 'PROTECT', '', 'new-project-10-1551932383-1.jpg', '', 7, '2019-03-07 09:49:43'),
(9, 'INSIDE', '', 'icon-1551932837-1.png', '', 8, '2019-03-07 09:49:56'),
(10, 'FABRIC', '', 'new-project-9-1551932420-1.jpg', '', 9, '2019-03-07 09:50:20'),
(11, 'WHEELS', '', 'new-project-7-1551932441-1.jpg', '', 10, '2019-03-07 09:50:41'),
(12, 'GLASS', '', 'new-project-6-1551932455-1.jpg', '', 11, '2019-03-07 09:50:55'),
(13, 'DETAILS', '', 'new-project-4-1551932466-1.jpg', '', 12, '2019-03-07 09:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `dc_home_page`
--

CREATE TABLE `dc_home_page` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_name` varchar(300) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_home_page`
--

INSERT INTO `dc_home_page` (`id`, `title`, `image_name`, `created`) VALUES
(1, 'GM Polyplast Pvt Ltd', '-1550211632-1.jpg', '2019-02-15 05:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `dc_how_we_do`
--

CREATE TABLE `dc_how_we_do` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `display_order` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_how_we_do`
--

INSERT INTO `dc_how_we_do` (`id`, `title`, `image_name`, `description`, `display_order`, `created`) VALUES
(1, 'BOOKING', 'process-1-1551182687-1.png', '<p>-Select your Vehicle Category</p>\r\n\r\n<p>-Choose your Detailing Package</p>\r\n\r\n<p>-Call/Email or Book Online.</p>\r\n\r\n<p>-Gifting options if required</p>\r\n\r\n<p>-Pay online or Card/COD</p>\r\n\r\n<p>-Schedule an Appointment</p>\r\n\r\n<p>-Confirmed &amp; Vehicle Dispatch</p>\r\n', 1, '2019-02-21 04:23:32'),
(5, 'WORK LOCATION:', 'process-1-1551242210-1.png', '<p>-Necessary Permissions Required</p>\r\n\r\n<p>-Pre-Work Checks &amp; Photo/Video</p>\r\n\r\n<p>-Explanation of Package Scope</p>\r\n\r\n<p>-Ensure Suï¬ƒcient Working Space</p>\r\n\r\n<p>-Deploy Equipment</p>\r\n\r\n<p>-Commence Work Process</p>\r\n', 2, '2019-02-21 04:23:32'),
(6, 'WORK PROCESS:', 'process-1-1551242229-1.png', '<p>-Job carried our as per Package</p>\r\n\r\n<p>-Team Quality Checks</p>\r\n\r\n<p>-Final Inspection by Customer</p>\r\n\r\n<p>-Redo any missed area</p>\r\n\r\n<p>-Ensure Customer Satisfaction</p>\r\n\r\n<p>-Photo/Video on Completion</p>\r\n', 3, '2019-02-21 04:23:32'),
(7, 'COMPLETION:', 'process-1-1551242261-1.png', '<p>-Form Filling &amp; Completion Report</p>\r\n\r\n<p>-Billing Process (Card/Cash/Online)</p>\r\n\r\n<p>-Pack-up Equipment</p>\r\n\r\n<p>-Clean up Work Space</p>\r\n\r\n<p>-Vehicle Dispatch</p>\r\n\r\n<p>-One Happy Customer!</p>\r\n', 4, '2019-02-21 04:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `dc_package_master`
--

CREATE TABLE `dc_package_master` (
  `id` int(11) NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `display_order` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_package_master`
--

INSERT INTO `dc_package_master` (`id`, `package_name`, `display_order`, `created`) VALUES
(1, 'Bronze Package', 1, '2019-02-21 08:26:27'),
(2, 'Silver Package', 2, '2019-02-21 08:26:27'),
(3, 'Gold Package', 3, '2019-02-21 08:26:52'),
(4, 'Platinum Package', 4, '2019-02-21 08:26:52');

-- --------------------------------------------------------

--
-- Table structure for table `dc_personal_details`
--

CREATE TABLE `dc_personal_details` (
  `id` int(11) NOT NULL,
  `booking_id` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `landmark` varchar(200) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `booking_date` varchar(50) NOT NULL,
  `booking_time` varchar(50) NOT NULL,
  `no_vehicles` varchar(10) DEFAULT NULL,
  `gifted` varchar(10) DEFAULT NULL,
  `gifted_from` int(11) DEFAULT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `final_total` varchar(20) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_personal_details`
--

INSERT INTO `dc_personal_details` (`id`, `booking_id`, `first_name`, `last_name`, `mobile`, `email`, `address`, `landmark`, `zipcode`, `booking_date`, `booking_time`, `no_vehicles`, `gifted`, `gifted_from`, `payment_mode`, `payment_status`, `final_total`, `created`) VALUES
(1, 'DNC-10001', 'Mukunda', 'Vishwakarma', '8108911304', 'mukunda.v@innovins.com', 'Malad West', 'Chroma', '400096', '03/04/2019', '7:00am', '2', '0', NULL, 'COD', 'Pending', '2700', '2019-04-02 04:53:31'),
(2, 'DNC-10002', 'Mukunda', 'Vishwakarma', '8108911304', 'mukunda.v@innovins.com', 'Malad West', 'Chroma', '400096', '05/04/2019', '12:30am', '2', '0', NULL, 'COD', 'Pending', '3600', '2019-04-02 05:02:36'),
(3, '', 'Mukunda', 'Vishwakarma', '8108911304', 'mukunda.v@innovins.com', 'Malad West', 'Chroma', '400096', '17/04/2019', '', '2', '0', NULL, '', '', NULL, '2019-04-02 05:48:03');

-- --------------------------------------------------------

--
-- Table structure for table `dc_quick_wash_master`
--

CREATE TABLE `dc_quick_wash_master` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `time` int(20) NOT NULL,
  `main_features` text NOT NULL,
  `interior_feature` text NOT NULL,
  `exterior_feature` text NOT NULL,
  `price` varchar(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_quick_wash_master`
--

INSERT INTO `dc_quick_wash_master` (`id`, `category`, `time`, `main_features`, `interior_feature`, `exterior_feature`, `price`, `image`, `created`) VALUES
(1, '1', 30, '<ul class=\"car-feature\">\r\n                                <li><span>*</span>Min 2 Vehicle Requirement / Max 6 Vehicles</li>\r\n                                <li><span>*</span>Still better than your Regular Wash!</li>\r\n                            </ul>', '<ul class=\"car-feature\">\r\n                                <li>Air Blow Clean Seats / Carpet </li>\r\n                                <li>Seats Shampoo Cleaned </li>\r\n                                <li>Vacuum of Interior & Trunk </li>\r\n                                <li>Dashboard Protectant Coated </li>\r\n                                <li>Floor Mats Cleaned</li>\r\n                                <li>Mirrors / Glass Streak Free Wiped</li>\r\n                            </ul>', '<ul class=\"car-feature\">\r\n                                <li>Air Blow Dirt & Debris</li>\r\n                                <li>Hand Wash With Shampoo & Sponge</li>\r\n                                <li>Air Blow Dry / Microfibre Wipe Down </li>\r\n                                <li>Tyres & Wheels Shampoo Cleaned </li>\r\n                                <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                <li>Emblems / Chrome Polished</li>\r\n                            </ul>', '399', 'car-3-1550730797-1.png', '2019-02-21 10:01:06'),
(2, '2', 30, '<ul class=\"car-feature\">\r\n                                <li><span>*</span>Min 2 Vehicle Requirement / Max 6 Vehicles</li>\r\n                                <li><span>*</span>Still better than your Regular Wash!</li>\r\n                            </ul>', '<ul class=\"car-feature\">\r\n                                <li>Air Blow Clean Seats / Carpet </li>\r\n                                <li>Seats Shampoo Cleaned </li>\r\n                                <li>Vacuum of Interior & Trunk </li>\r\n                                <li>Dashboard Protectant Coated </li>\r\n                                <li>Floor Mats Cleaned</li>\r\n                                <li>Mirrors / Glass Streak Free Wiped</li>\r\n                            </ul>', '<ul class=\"car-feature\">\r\n                                <li>Air Blow Dirt & Debris</li>\r\n                                <li>Hand Wash With Shampoo & Sponge</li>\r\n                                <li>Air Blow Dry / Microfibre Wipe Down </li>\r\n                                <li>Tyres & Wheels Shampoo Cleaned </li>\r\n                                <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                <li>Emblems / Chrome Polished</li>\r\n                            </ul>', '499', 'car-1-1550730935-1.png', '2019-02-21 10:01:09'),
(3, '3', 30, '<ul class=\"car-feature\">\r\n                                <li><span>*</span>Min 2 Vehicle Requirement / Max 6 Vehicles</li>\r\n                                <li><span>*</span>Still better than your Regular Wash!</li>\r\n                            </ul>', '<ul class=\"car-feature\">\r\n                                <li>Air Blow Clean Seats / Carpet </li>\r\n                                <li>Seats Shampoo Cleaned </li>\r\n                                <li>Vacuum of Interior & Trunk </li>\r\n                                <li>Dashboard Protectant Coated </li>\r\n                                <li>Floor Mats Cleaned</li>\r\n                                <li>Mirrors / Glass Streak Free Wiped</li>\r\n                            </ul>', '<ul class=\"car-feature\">\r\n                                <li>Air Blow Dirt & Debris</li>\r\n                                <li>Hand Wash With Shampoo & Sponge</li>\r\n                                <li>Air Blow Dry / Microfibre Wipe Down </li>\r\n                                <li>Tyres & Wheels Shampoo Cleaned </li>\r\n                                <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                <li>Emblems / Chrome Polished</li>\r\n                            </ul>', '599', 'car-2-1550731021-1.png', '2019-02-21 10:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `dc_subscription_features_master`
--

CREATE TABLE `dc_subscription_features_master` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `feature_category` varchar(100) NOT NULL,
  `feature` longtext NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_subscription_features_master`
--

INSERT INTO `dc_subscription_features_master` (`id`, `category`, `package_name`, `feature_category`, `feature`, `created`) VALUES
(55, '1', '1', '1', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Minor Stain Removal (Stage 1)</li>\r\n	<li>Complete Vacuum of Interior &amp; Trunk</li>\r\n	<li>Floor Mats Vacuum / Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Mirrors / Glass Streak Free Wipe</li>\r\n	<li>A/C Vents Brush Cleaned</li>\r\n</ul>\r\n', '2019-02-27 06:39:34'),
(56, '1', '1', '2', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris Steam Jet Wash &amp; Wax</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down&nbsp;</li>\r\n	<li>Tyres &amp; Wheels Shampoo Wash</li>\r\n	<li>&nbsp;Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Protectant Coated&nbsp;</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>&nbsp;Emblems / Chrome Polished</li>\r\n</ul>\r\n', '2019-02-27 06:52:09'),
(57, '1', '2', '2', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris</li>\r\n	<li>Steam Jet Wash</li>\r\n	<li>Wax Coat with Buffing Machine (Stage 1)</li>\r\n	<li>Underbody / Suspension Wash with 90* Lance</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down</li>\r\n	<li>Tyres &amp; Wheels Degreased &amp; Shampoo wash</li>\r\n	<li>Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Protectant Coated</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>Emblems / Chrome Polished</li>\r\n</ul>\r\n', '2019-02-27 07:06:47'),
(59, '1', '2', '1', ' <ul>\r\n                                        <li>Air Blow Dirt & Debris </li>\r\n                                        <li>Steam Jet Wash</li>\r\n                                        <li>Wax Coat with Buffing Machine (Stage 1) </li>\r\n                                        <li>Underbody / Suspension Wash with 90* Lance </li>\r\n                                        <li>Air Blow Dry / Microfibre Wipe Down</li>\r\n                                        <li>Tyres & Wheels Degreased & Shampoo wash </li>\r\n                                        <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                        <li>Head-lights / Tail-lights Protectant Coated </li>\r\n                                        <li>Rubber / Vinyl / Plastic Protectant Coated </li>\r\n                                        <li>Emblems / Chrome Polished</li>\r\n                                    </ul>\r\n', '2019-02-27 07:08:13'),
(60, '1', '2', '3', '<ul>\r\n	<li>Hood Liner Water Pressure Cleaned</li>\r\n	<li>Engine Bay Air Pressure Blow Clean</li>\r\n	<li>Battery Terminals Cleaned</li>\r\n	<li>Drain Channels Cleaned &amp; Debris Removed</li>\r\n	<li>Engine Bay Steam Clean (Stage 1)</li>\r\n</ul>\r\n', '2019-02-27 07:08:48'),
(61, '1', '3', '2', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris</li>\r\n	<li>Steam Jet Wash</li>\r\n	<li>Swirl / Scratch Removal Polish Coat (Stage 1)</li>\r\n	<li>Wax Coat With Buffing Machine (Stage 2)</li>\r\n	<li>Underbody / Suspension Wash with 90* Lance</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down</li>\r\n	<li>Tyres &amp; Wheels Degreased &amp; Specialty Polished</li>\r\n	<li>Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Wax Coated</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>Emblems / Chrome Polished &amp; Waxed</li>\r\n</ul>\r\n', '2019-02-27 07:09:27'),
(62, '1', '3', '1', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Extraction &amp; Stain Removal (Stage 3)</li>\r\n	<li>Leather Seats Polished &amp; Specialty Leather Coated</li>\r\n	<li>Complete Vacuum of Interior, Roof-Liner &amp; Trunk</li>\r\n	<li>Floor Carpet Deep Cleaned (Stage 2)</li>\r\n	<li>Floor Mats Vacuum &amp; Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Seat Belts Steam Cleaned &amp; Sanitised</li>\r\n	<li>Interior Surfaces Steam Sanitised</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Mirrors / Glass Streak Free Wipe</li>\r\n	<li>A/C Vents Steam Cleaned &amp; Sanitised</li>\r\n</ul>\r\n', '2019-02-27 07:10:02'),
(63, '1', '3', '3', '<ul>\r\n	<li>Hood Liner Water Pressure Cleaned</li>\r\n	<li>Engine Bay Air Pressure Blow Clean</li>\r\n	<li>Battery Terminals Cleaned &amp; Corrosion Coated</li>\r\n	<li>Drain Channels Cleaned &amp; Debris Removed</li>\r\n	<li>Engine Bay Steam Clean (Stage 2)</li>\r\n	<li>Rubber / Plastic Dressing &amp; Protectant Coated</li>\r\n</ul>\r\n', '2019-02-27 07:10:25'),
(64, '1', '4', '2', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris Steam Jet Wash</li>\r\n	<li>Clay Bar Treatment</li>\r\n	<li>Specialty Swirl / Scratch Removal Polish Coat (Stage 3)</li>\r\n	<li>Specialty Wax Coat With Buffing Machine (Stage 3)</li>\r\n	<li>Underbody / Suspension Wash with 90* Lance</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down</li>\r\n	<li>Tyres &amp; Wheels Degreased &amp; Specialty Polished</li>\r\n	<li>Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Anti-Fade Wax Coated</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>Emblems / Chrome Polished &amp; Waxed</li>\r\n</ul>\r\n', '2019-02-27 07:13:35'),
(65, '1', '4', '1', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Spray Extraction &amp; Stain Removal (Stage 3)</li>\r\n	<li>Leather Seats Polished &amp; Specialty Leather Coated</li>\r\n	<li>Complete Vacuum of Interior, Roof-Liner &amp; Trunk</li>\r\n	<li>Floor Carpet Deep Cleaned (Stage 3)</li>\r\n	<li>Floor Mats Vacuum &amp; Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Seat Belts Steam Cleaned &amp; Sanitised</li>\r\n	<li>Complete Interior Cabin Steam Sanitised</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Mirrors / Glass Streak Free Wipe</li>\r\n	<li>A/C Vents Steam Cleaned &amp; Sanitised</li>\r\n	<li>A/C System &amp; Interior Odour Elimination Treatment</li>\r\n</ul>\r\n', '2019-02-27 07:14:34'),
(66, '3', '4', '3', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris</li>\r\n	<li>Steam Jet Wash &amp; Wax</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down</li>\r\n	<li>Tyres &amp; Wheels Shampoo Wash</li>\r\n	<li>Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Protectant Coated</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>Emblems / Chrome Polished</li>\r\n</ul>\r\n', '2019-02-27 07:16:30'),
(67, '2', '1', '2', '<ul class=\"feature-list\">\r\n                                        <li>Air Blow Dirt & Debris </li>\r\n                                        <li>Steam Jet Wash & Wax</li>\r\n                                        <li>Air Blow Dry / Microfibre Wipe Down </li>\r\n                                        <li>Tyres & Wheels Shampoo Wash </li>\r\n                                        <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                        <li>Head-lights / Tail-lights Protectant Coated </li>\r\n                                        <li>Rubber / Vinyl / Plastic Protectant Coated </li>\r\n                                        <li>Emblems / Chrome Polished</li>\r\n                                    </ul>\r\n', '2019-02-27 07:21:44'),
(68, '2', '1', '1', '<ul class=\"feature-list\">\r\n                                        <li>Air Blow Clean Seats / Carpet</li>\r\n                                        <li>Seats Minor Stain Removal (Stage 1) </li>\r\n                                        <li>Complete Vacuum of Interior & Trunk </li>\r\n                                        <li>Floor Mats Vacuum / Cleaned</li>\r\n                                        <li>Door Pockets / Doorjambs / Pillars Cleaned </li>\r\n                                        <li>Dashboard / Console Protectant Coated (Matt Finish) </li>\r\n                                        <li>Mirrors / Glass Streak Free Wipe</li>\r\n                                        <li>A/C Vents Brush Cleaned</li>\r\n                                    </ul>', '2019-02-27 07:23:43'),
(69, '2', '3', '2', '<ul>\r\n                                        <li>Air Blow Dirt & Debris </li>\r\n                                        <li>Steam Jet Wash</li>\r\n                                        <li>Wax Coat with Buffing Machine (Stage 1) </li>\r\n                                        <li>Underbody / Suspension Wash with 90* Lance </li>\r\n                                        <li>Air Blow Dry / Microfibre Wipe Down</li>\r\n                                        <li>Tyres & Wheels Degreased & Shampoo wash </li>\r\n                                        <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                        <li>Head-lights / Tail-lights Protectant Coated </li>\r\n                                        <li>Rubber / Vinyl / Plastic Protectant Coated </li>\r\n                                        <li>Emblems / Chrome Polished</li>\r\n                                    </ul>\r\n', '2019-02-27 08:52:22'),
(70, '2', '2', '2', '<ul class=\"feature-list\">\r\n                                        <li>Air Blow Dirt & Debris </li>\r\n                                        <li>Steam Jet Wash</li>\r\n                                        <li>Wax Coat with Buffing Machine (Stage 1) </li>\r\n                                        <li>Underbody / Suspension Wash with 90* Lance </li>\r\n                                        <li>Air Blow Dry / Microfibre Wipe Down</li>\r\n                                        <li>Tyres & Wheels Degreased & Shampoo wash </li>\r\n                                        <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                        <li>Head-lights / Tail-lights Protectant Coated </li>\r\n                                        <li>Rubber / Vinyl / Plastic Protectant Coated </li>\r\n                                        <li>Emblems / Chrome Polished</li>\r\n                                    </ul>', '2019-02-27 08:55:25'),
(71, '2', '2', '1', '<ul class=\"feature-list\">\r\n                                        <li>Air Blow Clean Seats / Carpet</li>\r\n                                        <li>Seats Shampoo Cleaned & Stain Removal (Stage 2)</li> \r\n                                        <li>Complete Vacuum of Interior & Trunk</li>\r\n                                        <li>Floor Carpet Shampoo Cleaned (Stage 1) </li>\r\n                                        <li>Floor Mats Vacuum / Cleaned</li>\r\n                                        <li>Door Pockets / Doorjambs / Pillars Cleaned </li>\r\n                                        <li>Dashboard / Console Protectant Coated (Matt Finish) </li>\r\n                                        <li>Glass / Windows Streak Free Wipe</li>\r\n                                        <li>A/C Vents Steam Cleaned & Sanitised</li>\r\n                                    </ul>\r\n', '2019-02-27 08:56:41'),
(72, '2', '2', '3', ' <ul class=\"feature-list\">\r\n                                        <li>Hood Liner Water Pressure Cleaned</li> \r\n                                        <li>Engine Bay Air Pressure Blow Clean </li>\r\n                                        <li>Battery Terminals Cleaned</li>\r\n                                        <li>Drain Channels Cleaned & Debris Removed </li>\r\n                                        <li>Engine Bay Steam Clean (Stage 1)</li>\r\n                                    </ul>\r\n', '2019-02-27 08:57:19'),
(74, '2', '3', '1', ' <ul class=\"feature-list\">\r\n                                        <li>Air Blow Clean Seats / Carpet</li>\r\n                                        <li>Seats Extraction & Stain Removal (Stage 3) </li>\r\n                                        <li>Leather Seats Polished & Specialty Leather Coated </li>\r\n                                        <li>Complete Vacuum of Interior, Roof-Liner & Trunk </li>\r\n                                        <li>Floor Carpet Deep Cleaned (Stage 2)</li>\r\n                                        <li>Floor Mats Vacuum & Cleaned</li>\r\n                                        <li>Door Pockets / Doorjambs / Pillars Cleaned </li>\r\n                                        <li>Seat Belts Steam Cleaned & Sanitised </li>\r\n                                        <li>Interior Surfaces Steam Sanitised</li>\r\n                                        <li>Dashboard / Console Protectant Coated (Matt Finish) </li>\r\n                                        <li>Mirrors / Glass Streak Free Wipe</li>\r\n                                        <li>A/C Vents Steam Cleaned & Sanitised</li>\r\n                                    </ul>\r\n', '2019-02-27 08:59:11'),
(75, '2', '3', '3', ' <ul class=\"feature-list\">\r\n                                        <li>Hood Liner Water Pressure Cleaned </li>\r\n                                        <li>Engine Bay Air Pressure Blow Clean</li>\r\n                                        <li>Battery Terminals Cleaned & Corrosion Coated </li>\r\n                                        <li>Drain Channels Cleaned & Debris Removed </li>\r\n                                        <li>Engine Bay Steam Clean (Stage 2)</li>\r\n                                        <li>Rubber / Plastic Dressing & Protectant Coated</li>\r\n                                    </ul>\r\n', '2019-02-27 08:59:35'),
(76, '2', '4', '2', '<ul class=\"feature-list\">\r\n                                        <li>Air Blow Dirt & Debris Steam Jet Wash</li>\r\n                                        <li>Clay Bar Treatment</li>\r\n                                        <li>Specialty Swirl / Scratch Removal Polish Coat (Stage 3) </li>\r\n                                        <li>Specialty Wax Coat With Buffing Machine (Stage 3) </li>\r\n                                        <li>Underbody / Suspension Wash with 90* Lance</li>\r\n                                        <li>Air Blow Dry / Microfibre Wipe Down</li>\r\n                                        <li>Tyres & Wheels Degreased & Specialty Polished</li> \r\n                                        <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                        <li>Head-lights / Tail-lights Anti-Fade Wax Coated </li>\r\n                                        <li>Rubber / Vinyl / Plastic Protectant Coated</li> \r\n                                        <li>Emblems / Chrome Polished & Waxed</li>\r\n                                    </ul>\r\n', '2019-02-27 09:03:56'),
(77, '2', '4', '1', '   <ul class=\"feature-list\">\r\n                                        <li>Air Blow Clean Seats / Carpet</li>\r\n                                        <li>Seats Spray Extraction & Stain Removal (Stage 3) </li>\r\n                                        <li>Leather Seats Polished & Specialty Leather Coated </li>\r\n                                        <li>Complete Vacuum of Interior, Roof-Liner & Trunk </li>\r\n                                        <li>Floor Carpet Deep Cleaned (Stage 3)</li>\r\n                                        <li>Floor Mats Vacuum & Cleaned</li>\r\n                                        <li>Door Pockets / Doorjambs / Pillars Cleaned </li>\r\n                                        <li>Seat Belts Steam Cleaned & Sanitised </li>\r\n                                        <li>Complete Interior Cabin Steam Sanitised</li>\r\n                                        <li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n                                        <li>Mirrors / Glass Streak Free Wipe</li>\r\n                                        <li>A/C Vents Steam Cleaned & Sanitised</li>\r\n                                        <li>A/C System & Interior Odour Elimination Treatment</li>\r\n                                    </ul>\r\n', '2019-02-27 09:04:16'),
(78, '2', '4', '3', ' <ul class=\"feature-list\">\r\n                                        <li>Hood Liner Water Pressure Cleaned </li>\r\n                                        <li>Engine Bay Air Pressure Blow Clean</li>\r\n                                        <li>Battery Terminals Cleaned & Corrosion Coated </li>\r\n                                        <li>Drain Channels Cleaned & Debris Removed </li>\r\n                                        <li>Engine Bay Steam Clean (Stage 3)</li>\r\n                                        <li>Rubber / Plastic / Hoses Dressing & Protectant Coated </li>\r\n                                        <li>Fluid Containers & Caps Polished</li>\r\n                                        <li>Specialty Windshield Washer Fluid Topped Up</li>\r\n                                    </ul>\r\n', '2019-02-27 09:07:29'),
(79, '3', '1', '1', ' <ul class=\"feature-list\">\r\n                                        <li>Air Blow Dirt & Debris </li>\r\n                                        <li>Steam Jet Wash & Wax</li>\r\n                                        <li>Air Blow Dry / Microfibre Wipe Down </li>\r\n                                        <li>Tyres & Wheels Shampoo Wash </li>\r\n                                        <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                        <li>Head-lights / Tail-lights Protectant Coated </li>\r\n                                        <li>Rubber / Vinyl / Plastic Protectant Coated </li>\r\n                                        <li>Emblems / Chrome Polished</li>\r\n                                    </ul>', '2019-02-27 09:15:25'),
(80, '3', '1', '1', ' <ul class=\"feature-list\">\r\n                                        <li>Air Blow Clean Seats / Carpet</li>\r\n                                        <li>Seats Minor Stain Removal (Stage 1) </li>\r\n                                        <li>Complete Vacuum of Interior & Trunk </li>\r\n                                        <li>Floor Mats Vacuum / Cleaned</li>\r\n                                        <li>Door Pockets / Doorjambs / Pillars Cleaned </li>\r\n                                        <li>Dashboard / Console Protectant Coated (Matt Finish) </li>\r\n                                        <li>Mirrors / Glass Streak Free Wipe</li>\r\n                                        <li>A/C Vents Brush Cleaned</li>\r\n                                    </ul>\r\n\r\n', '2019-02-27 09:15:45'),
(81, '3', '2', '2', '<ul class=\"feature-list\">\r\n                                        <li>Air Blow Dirt & Debris </li>\r\n                                        <li>Steam Jet Wash</li>\r\n                                        <li>Wax Coat with Buffing Machine (Stage 1) </li>\r\n                                        <li>Underbody / Suspension Wash with 90* Lance </li>\r\n                                        <li>Air Blow Dry / Microfibre Wipe Down</li>\r\n                                        <li>Tyres & Wheels Degreased & Shampoo wash </li>\r\n                                        <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                        <li>Head-lights / Tail-lights Protectant Coated </li>\r\n                                        <li>Rubber / Vinyl / Plastic Protectant Coated </li>\r\n                                        <li>Emblems / Chrome Polished</li>\r\n                                    </ul>', '2019-02-27 09:16:11'),
(82, '3', '2', '1', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Shampoo Cleaned &amp; Stain Removal (Stage 2)</li>\r\n	<li>Complete Vacuum of Interior &amp; Trunk</li>\r\n	<li>Floor Carpet Shampoo Cleaned (Stage 1)</li>\r\n	<li>Floor Mats Vacuum / Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Glass / Windows Streak Free Wipe</li>\r\n	<li>A/C Vents Steam Cleaned &amp; Sanitised</li>\r\n</ul>\r\n', '2019-02-27 09:16:36'),
(83, '3', '2', '1', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Shampoo Cleaned &amp; Stain Removal (Stage 2)</li>\r\n	<li>Complete Vacuum of Interior &amp; Trunk</li>\r\n	<li>Floor Carpet Shampoo Cleaned (Stage 1)</li>\r\n	<li>Floor Mats Vacuum / Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Glass / Windows Streak Free Wipe</li>\r\n	<li>A/C Vents Steam Cleaned &amp; Sanitised</li>\r\n</ul>\r\n', '2019-02-27 09:17:29'),
(84, '3', '2', '3', '<ul class=\"feature-list\">\r\n                                        <li>Hood Liner Water Pressure Cleaned</li> \r\n                                        <li>Engine Bay Air Pressure Blow Clean </li>\r\n                                        <li>Battery Terminals Cleaned</li>\r\n                                        <li>Drain Channels Cleaned & Debris Removed </li>\r\n                                        <li>Engine Bay Steam Clean (Stage 1)</li>\r\n                                    </ul>\r\n', '2019-02-27 09:18:43'),
(85, '3', '3', '2', '  <ul class=\"feature-list\">\r\n                                        <li>Air Blow Dirt & Debris </li>\r\n                                        <li>Steam Jet Wash</li>\r\n                                        <li>Swirl / Scratch Removal Polish Coat (Stage 1)</li> \r\n                                        <li>Wax Coat With Buffing Machine (Stage 2) </li>\r\n                                        <li>Underbody / Suspension Wash with 90* Lance </li>\r\n                                        <li>Air Blow Dry / Microfibre Wipe Down</li>\r\n                                        <li>Tyres & Wheels Degreased & Specialty Polished </li>\r\n                                        <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                        <li>Head-lights / Tail-lights Wax Coated </li>\r\n                                        <li>Rubber / Vinyl / Plastic Protectant Coated </li>\r\n                                        <li>Emblems / Chrome Polished & Waxed</li>\r\n                                    </ul>\r\n', '2019-02-27 09:19:07'),
(86, '3', '3', '1', '<ul class=\"feature-list\">\r\n                                        <li>Air Blow Clean Seats / Carpet</li>\r\n                                        <li>Seats Extraction & Stain Removal (Stage 3) </li>\r\n                                        <li>Leather Seats Polished & Specialty Leather Coated </li>\r\n                                        <li>Complete Vacuum of Interior, Roof-Liner & Trunk </li>\r\n                                        <li>Floor Carpet Deep Cleaned (Stage 2)</li>\r\n                                        <li>Floor Mats Vacuum & Cleaned</li>\r\n                                        <li>Door Pockets / Doorjambs / Pillars Cleaned </li>\r\n                                        <li>Seat Belts Steam Cleaned & Sanitised </li>\r\n                                        <li>Interior Surfaces Steam Sanitised</li>\r\n                                        <li>Dashboard / Console Protectant Coated (Matt Finish) </li>\r\n                                        <li>Mirrors / Glass Streak Free Wipe</li>\r\n                                        <li>A/C Vents Steam Cleaned & Sanitised</li>\r\n                                    ', '2019-02-27 09:19:20'),
(87, '3', '3', '3', '   <ul class=\"feature-list\">\r\n	<li>Hood Liner Water Pressure Cleaned</li>\r\n	<li>Engine Bay Air Pressure Blow Clean</li>\r\n	<li>Battery Terminals Cleaned &amp; Corrosion Coated</li>\r\n	<li>Drain Channels Cleaned &amp; Debris Removed</li>\r\n	<li>Engine Bay Steam Clean (Stage 2)</li>\r\n	<li>Rubber / Plastic Dressing &amp; Protectant Coated</li>\r\n</ul>\r\n', '2019-02-27 09:19:39'),
(88, '3', '4', '2', '    <ul class=\"feature-list\">\r\n                                        <li>Air Blow Dirt & Debris Steam Jet Wash</li>\r\n                                        <li>Clay Bar Treatment</li>\r\n                                        <li>Specialty Swirl / Scratch Removal Polish Coat (Stage 3) </li>\r\n                                        <li>Specialty Wax Coat With Buffing Machine (Stage 3) </li>\r\n                                        <li>Underbody / Suspension Wash with 90* Lance</li>\r\n                                        <li>Air Blow Dry / Microfibre Wipe Down</li>\r\n                                        <li>Tyres & Wheels Degreased & Specialty Polished</li> \r\n                                        <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                        <li>Head-lights / Tail-lights Anti-Fade Wax Coated </li>\r\n                                        <li>Rubber / Vinyl / Plastic Protectant Coated</li> \r\n                                        <li>Emblems / Chrome Polished & Waxed</li>\r\n                                    </ul>\r\n', '2019-02-27 09:20:15'),
(89, '3', '4', '1', ' <ul class=\"feature-list\">\r\n                                        <li>Air Blow Clean Seats / Carpet</li>\r\n                                        <li>Seats Spray Extraction & Stain Removal (Stage 3) </li>\r\n                                        <li>Leather Seats Polished & Specialty Leather Coated </li>\r\n                                        <li>Complete Vacuum of Interior, Roof-Liner & Trunk </li>\r\n                                        <li>Floor Carpet Deep Cleaned (Stage 3)</li>\r\n                                        <li>Floor Mats Vacuum & Cleaned</li>\r\n                                        <li>Door Pockets / Doorjambs / Pillars Cleaned </li>\r\n                                        <li>Seat Belts Steam Cleaned & Sanitised </li>\r\n                                        <li>Complete Interior Cabin Steam Sanitised</li>\r\n                                        <li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n                                        <li>Mirrors / Glass Streak Free Wipe</li>\r\n                                        <li>A/C Vents Steam Cleaned & Sanitised</li>\r\n                                        <li>A/C System & Interior Odour Elimination Treatment</li>\r\n                                    </ul>', '2019-02-27 09:20:33'),
(100, '1', '4', '3', '<ul>\r\n	<li>Hood Liner Water Pressure Cleaned</li>\r\n	<li>Engine Bay Air Pressure Blow Clean</li>\r\n	<li>Battery Terminals Cleaned &amp; Corrosion Coated</li>\r\n	<li>Drain Channels Cleaned &amp; Debris Removed</li>\r\n	<li>Engine Bay Steam Clean (Stage 2)</li>\r\n	<li>Rubber / Plastic Dressing &amp; Protectant Coated</li>\r\n</ul>\r\n', '2019-02-28 05:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `dc_subscription_master`
--

CREATE TABLE `dc_subscription_master` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `validity_period` varchar(11) NOT NULL,
  `package_price` varchar(255) NOT NULL,
  `permalink` varchar(255) NOT NULL,
  `active` varchar(10) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `interior_feature` text NOT NULL,
  `exterior_feature` text NOT NULL,
  `engine_bay_feature` text NOT NULL,
  `duration_from` varchar(11) DEFAULT NULL,
  `duration_to` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dc_subscription_master`
--

INSERT INTO `dc_subscription_master` (`id`, `category`, `package_name`, `validity_period`, `package_price`, `permalink`, `active`, `created`, `interior_feature`, `exterior_feature`, `engine_bay_feature`, `duration_from`, `duration_to`) VALUES
(1, '1', '1', '60', '1500', '1', 'Yes', '2019-02-21 09:23:51', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Minor Stain Removal (Stage 1)</li>\r\n	<li>Complete Vacuum of Interior &amp; Trunk</li>\r\n	<li>Floor Mats Vacuum / Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Mirrors / Glass Streak Free Wipe</li>\r\n	<li>A/C Vents Brush Cleaned</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris</li>\r\n	<li>Steam Jet Wash &amp; Wax</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down</li>\r\n	<li>Tyres &amp; Wheels Shampoo Wash</li>\r\n	<li>Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Protectant Coated</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>Emblems / Chrome Polished</li>\r\n</ul>\r\n', '', '60', '90'),
(2, '1', '2', '60', '2500', '2', 'Yes', '2019-02-22 04:18:17', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Shampoo Cleaned &amp; Stain Removal (Stage 2)</li>\r\n	<li>Complete Vacuum of Interior &amp; Trunk</li>\r\n	<li>Floor Carpet Shampoo Cleaned (Stage 1)</li>\r\n	<li>Floor Mats Vacuum / Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Glass / Windows Streak Free Wipe</li>\r\n	<li>A/C Vents Steam Cleaned &amp; Sanitised</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris</li>\r\n	<li>Steam Jet Wash</li>\r\n	<li>Wax Coat with Buffing Machine (Stage 1)</li>\r\n	<li>Underbody / Suspension Wash with 90* Lance</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down</li>\r\n	<li>Tyres &amp; Wheels Degreased &amp; Shampoo wash</li>\r\n	<li>Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Protectant Coated</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>Emblems / Chrome Polished</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Hood Liner Water Pressure Cleaned</li>\r\n	<li>Engine Bay Air Pressure Blow Clean</li>\r\n	<li>Battery Terminals Cleaned</li>\r\n	<li>Drain Channels Cleaned &amp; Debris Removed</li>\r\n	<li>Engine Bay Steam Clean (Stage 1)</li>\r\n</ul>\r\n', '120', '150'),
(3, '3', '3', '90', '3500', '3', 'Yes', '2019-02-22 04:26:00', ' <ul>\r\n                                        <li>Air Blow Clean Seats / Carpet</li>\r\n                                        <li>Seats Extraction & Stain Removal (Stage 3) </li>\r\n                                        <li>Leather Seats Polished & Specialty Leather Coated </li>\r\n                                        <li>Complete Vacuum of Interior, Roof-Liner & Trunk </li>\r\n                                        <li>Floor Carpet Deep Cleaned (Stage 2)</li>\r\n                                        <li>Floor Mats Vacuum & Cleaned</li>\r\n                                        <li>Door Pockets / Doorjambs / Pillars Cleaned </li>\r\n                                        <li>Seat Belts Steam Cleaned & Sanitised </li>\r\n                                        <li>Interior Surfaces Steam Sanitised</li>\r\n                                        <li>Dashboard / Console Protectant Coated (Matt Finish) </li>\r\n                                        <li>Mirrors / Glass Streak Free Wipe</li>\r\n                                        <li>A/C Vents Steam Cleaned & Sanitised</li>\r\n                                    </ul>\r\n', '  <ul>\r\n                                        <li>Air Blow Dirt & Debris </li>\r\n                                        <li>Steam Jet Wash</li>\r\n                                        <li>Swirl / Scratch Removal Polish Coat (Stage 1)</li> \r\n                                        <li>Wax Coat With Buffing Machine (Stage 2) </li>\r\n                                        <li>Underbody / Suspension Wash with 90* Lance </li>\r\n                                        <li>Air Blow Dry / Microfibre Wipe Down</li>\r\n                                        <li>Tyres & Wheels Degreased & Specialty Polished </li>\r\n                                        <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                        <li>Head-lights / Tail-lights Wax Coated </li>\r\n                                        <li>Rubber / Vinyl / Plastic Protectant Coated </li>\r\n                                        <li>Emblems / Chrome Polished & Waxed</li>\r\n                                    </ul>\r\n', '<ul>\r\n                                        <li>Hood Liner Water Pressure Cleaned </li>\r\n                                        <li>Engine Bay Air Pressure Blow Clean</li>\r\n                                        <li>Battery Terminals Cleaned & Corrosion Coated </li>\r\n                                        <li>Drain Channels Cleaned & Debris Removed </li>\r\n                                        <li>Engine Bay Steam Clean (Stage 2)</li>\r\n                                        <li>Rubber / Plastic Dressing & Protectant Coated</li>\r\n                                    </ul>\r\n', '0', '0'),
(4, '1', '3', '120', '3500', '3', 'Yes', '2019-02-27 07:22:37', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Extraction &amp; Stain Removal (Stage 3)</li>\r\n	<li>Leather Seats Polished &amp; Specialty Leather Coated</li>\r\n	<li>Complete Vacuum of Interior, Roof-Liner &amp; Trunk</li>\r\n	<li>Floor Carpet Deep Cleaned (Stage 2)</li>\r\n	<li>Floor Mats Vacuum &amp; Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Seat Belts Steam Cleaned &amp; Sanitised</li>\r\n	<li>Interior Surfaces Steam Sanitised</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Mirrors / Glass Streak Free Wipe</li>\r\n	<li>A/C Vents Steam Cleaned &amp; Sanitised</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris</li>\r\n	<li>Steam Jet Wash</li>\r\n	<li>Swirl / Scratch Removal Polish Coat (Stage 1)</li>\r\n	<li>Wax Coat With Buffing Machine (Stage 2)</li>\r\n	<li>Underbody / Suspension Wash with 90* Lance</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down</li>\r\n	<li>Tyres &amp; Wheels Degreased &amp; Specialty Polished</li>\r\n	<li>Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Wax Coated</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>Emblems / Chrome Polished &amp; Waxed</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Hood Liner Water Pressure Cleaned</li>\r\n	<li>Engine Bay Air Pressure Blow Clean</li>\r\n	<li>Battery Terminals Cleaned &amp; Corrosion Coated</li>\r\n	<li>Drain Channels Cleaned &amp; Debris Removed</li>\r\n	<li>Engine Bay Steam Clean (Stage 2)</li>\r\n	<li>Rubber / Plastic Dressing &amp; Protectant Coated</li>\r\n</ul>\r\n', '180', '210'),
(5, '1', '4', '180', '3500', '4', 'Yes', '2019-02-27 07:23:09', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Spray Extraction &amp; Stain Removal (Stage 3)</li>\r\n	<li>Leather Seats Polished &amp; Specialty Leather Coated</li>\r\n	<li>Complete Vacuum of Interior, Roof-Liner &amp; Trunk</li>\r\n	<li>Floor Carpet Deep Cleaned (Stage 3)</li>\r\n	<li>Floor Mats Vacuum &amp; Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Seat Belts Steam Cleaned &amp; Sanitised</li>\r\n	<li>Complete Interior Cabin Steam Sanitised</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Mirrors / Glass Streak Free Wipe</li>\r\n	<li>A/C Vents Steam Cleaned &amp; Sanitised</li>\r\n	<li>A/C System &amp; Interior Odour Elimination Treatment</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris</li>\r\n	<li>Steam Jet Wash</li>\r\n	<li>Clay Bar Treatment</li>\r\n	<li>Specialty Swirl / Scratch Removal Polish Coat (Stage 3)</li>\r\n	<li>Specialty Wax Coat With Buffing Machine (Stage 3)</li>\r\n	<li>Underbody / Suspension Wash with 90* Lance</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down</li>\r\n	<li>Tyres &amp; Wheels Degreased &amp; Specialty Polished</li>\r\n	<li>Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Anti-Fade Wax Coated</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>Emblems / Chrome Polished &amp; Waxed</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Hood Liner Water Pressure Cleaned</li>\r\n	<li>Engine Bay Air Pressure Blow Clean</li>\r\n	<li>Battery Terminals Cleaned &amp; Corrosion Coated</li>\r\n	<li>Drain Channels Cleaned &amp; Debris Removed</li>\r\n	<li>Engine Bay Steam Clean (Stage 3)</li>\r\n	<li>Rubber / Plastic / Hoses Dressing &amp; Protectant Coated</li>\r\n	<li>Fluid Containers &amp; Caps Polished</li>\r\n	<li>Specialty Windshield Washer Fluid Topped Up</li>\r\n</ul>\r\n', '180', '210'),
(7, '2', '1', '60', '1500', '1', 'Yes', '2019-02-27 08:41:04', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Shampoo Cleaned &amp; Stain Removal (Stage 2)</li>\r\n	<li>Complete Vacuum of Interior &amp; Trunk</li>\r\n	<li>Floor Carpet Shampoo Cleaned (Stage 1)</li>\r\n	<li>Floor Mats Vacuum / Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Glass / Windows Streak Free Wipe</li>\r\n	<li>A/C Vents Steam Cleaned &amp; Sanitised</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris</li>\r\n	<li>Steam Jet Wash</li>\r\n	<li>Wax Coat with Buffing Machine (Stage 1)</li>\r\n	<li>Underbody / Suspension Wash with 90* Lance</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down</li>\r\n	<li>Tyres &amp; Wheels Degreased &amp; Shampoo wash</li>\r\n	<li>Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Protectant Coated</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>Emblems / Chrome Polished</li>\r\n</ul>\r\n', '', '60', '90'),
(8, '2', '2', '120', '2500', '2', 'Yes', '2019-02-27 08:41:18', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Shampoo Cleaned &amp; Stain Removal (Stage 2)</li>\r\n	<li>Complete Vacuum of Interior &amp; Trunk</li>\r\n	<li>Floor Carpet Shampoo Cleaned (Stage 1)</li>\r\n	<li>Floor Mats Vacuum / Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Glass / Windows Streak Free Wipe</li>\r\n	<li>A/C Vents Steam Cleaned &amp; Sanitised</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris</li>\r\n	<li>Steam Jet Wash</li>\r\n	<li>Wax Coat with Buffing Machine (Stage 1)</li>\r\n	<li>Underbody / Suspension Wash with 90* Lance</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down</li>\r\n	<li>Tyres &amp; Wheels Degreased &amp; Shampoo wash</li>\r\n	<li>Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Protectant Coated</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>Emblems / Chrome Polished</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Hood Liner Water Pressure Cleaned</li>\r\n	<li>Engine Bay Air Pressure Blow Clean</li>\r\n	<li>Battery Terminals Cleaned</li>\r\n	<li>Drain Channels Cleaned &amp; Debris Removed</li>\r\n	<li>Engine Bay Steam Clean (Stage 1)</li>\r\n</ul>\r\n', '0', '0'),
(9, '2', '4', '180', '4500', '4', 'Yes', '2019-02-27 08:41:29', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Spray Extraction &amp; Stain Removal (Stage 3)</li>\r\n	<li>Leather Seats Polished &amp; Specialty Leather Coated</li>\r\n	<li>Complete Vacuum of Interior, Roof-Liner &amp; Trunk</li>\r\n	<li>Floor Carpet Deep Cleaned (Stage 3)</li>\r\n	<li>Floor Mats Vacuum &amp; Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Seat Belts Steam Cleaned &amp; Sanitised</li>\r\n	<li>Complete Interior Cabin Steam Sanitised</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Mirrors / Glass Streak Free Wipe</li>\r\n	<li>A/C Vents Steam Cleaned &amp; Sanitised</li>\r\n	<li>A/C System &amp; Interior Odour Elimination Treatment</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris</li>\r\n	<li>Steam Jet Wash</li>\r\n	<li>Clay Bar Treatment</li>\r\n	<li>Specialty Swirl / Scratch Removal Polish Coat (Stage 3)</li>\r\n	<li>Specialty Wax Coat With Buffing Machine (Stage 3)</li>\r\n	<li>Underbody / Suspension Wash with 90* Lance</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down</li>\r\n	<li>Tyres &amp; Wheels Degreased &amp; Specialty Polished</li>\r\n	<li>Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Anti-Fade Wax Coated</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>Emblems / Chrome Polished &amp; Waxed</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Hood Liner Water Pressure Cleaned</li>\r\n	<li>Engine Bay Air Pressure Blow Clean</li>\r\n	<li>Battery Terminals Cleaned &amp; Corrosion Coated</li>\r\n	<li>Drain Channels Cleaned &amp; Debris Removed</li>\r\n	<li>Engine Bay Steam Clean (Stage 3)</li>\r\n	<li>Rubber / Plastic / Hoses Dressing &amp; Protectant Coated</li>\r\n	<li>Fluid Containers &amp; Caps Polished</li>\r\n	<li>Specialty Windshield Washer Fluid Topped Up</li>\r\n</ul>\r\n', '180', '210'),
(10, '3', '1', '60', '1500', '1', 'Yes', '2019-02-27 08:41:40', '  <ul>\r\n                                        <li>Air Blow Clean Seats / Carpet</li>\r\n                                        <li>Seats Minor Stain Removal (Stage 1) </li>\r\n                                        <li>Complete Vacuum of Interior & Trunk </li>\r\n                                        <li>Floor Mats Vacuum / Cleaned</li>\r\n                                        <li>Door Pockets / Doorjambs / Pillars Cleaned </li>\r\n                                        <li>Dashboard / Console Protectant Coated (Matt Finish) </li>\r\n                                        <li>Mirrors / Glass Streak Free Wipe</li>\r\n                                        <li>A/C Vents Brush Cleaned</li>\r\n                                    </ul>\r\n', '  <ul>\r\n                                        <li>Air Blow Dirt & Debris </li>\r\n                                        <li>Steam Jet Wash & Wax</li>\r\n                                        <li>Air Blow Dry / Microfibre Wipe Down </li>\r\n                                        <li>Tyres & Wheels Shampoo Wash </li>\r\n                                        <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                        <li>Head-lights / Tail-lights Protectant Coated </li>\r\n                                        <li>Rubber / Vinyl / Plastic Protectant Coated </li>\r\n                                        <li>Emblems / Chrome Polished</li>\r\n                                    </ul>\r\n', '', '60', '90'),
(11, '3', '2', '120', '2500', '2', 'Yes', '2019-02-27 08:41:53', '       <ul>\r\n                                        <li>Air Blow Clean Seats / Carpet</li>\r\n                                        <li>Seats Shampoo Cleaned & Stain Removal (Stage 2)</li> \r\n                                        <li>Complete Vacuum of Interior & Trunk</li>\r\n                                        <li>Floor Carpet Shampoo Cleaned (Stage 1) </li>\r\n                                        <li>Floor Mats Vacuum / Cleaned</li>\r\n                                        <li>Door Pockets / Doorjambs / Pillars Cleaned </li>\r\n                                        <li>Dashboard / Console Protectant Coated (Matt Finish) </li>\r\n                                        <li>Glass / Windows Streak Free Wipe</li>\r\n                                        <li>A/C Vents Steam Cleaned & Sanitised</li>\r\n                                    </ul>\r\n', '<ul>\r\n                                        <li>Air Blow Dirt & Debris </li>\r\n                                        <li>Steam Jet Wash</li>\r\n                                        <li>Wax Coat with Buffing Machine (Stage 1) </li>\r\n                                        <li>Underbody / Suspension Wash with 90* Lance </li>\r\n                                        <li>Air Blow Dry / Microfibre Wipe Down</li>\r\n                                        <li>Tyres & Wheels Degreased & Shampoo wash </li>\r\n                                        <li>Glass / Mirrors Streak Free Wipe</li>\r\n                                        <li>Head-lights / Tail-lights Protectant Coated </li>\r\n                                        <li>Rubber / Vinyl / Plastic Protectant Coated </li>\r\n                                        <li>Emblems / Chrome Polished</li>\r\n                                    </ul>\r\n', '<ul>\r\n                                        <li>Hood Liner Water Pressure Cleaned</li> \r\n                                        <li>Engine Bay Air Pressure Blow Clean </li>\r\n                                        <li>Battery Terminals Cleaned</li>\r\n                                        <li>Drain Channels Cleaned & Debris Removed </li>\r\n                                        <li>Engine Bay Steam Clean (Stage 1)</li>\r\n                                    </ul>\r\n', '0', '0'),
(12, '2', '3', '180', '3500', '3', 'Yes', '2019-02-27 08:42:06', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Extraction &amp; Stain Removal (Stage 3)</li>\r\n	<li>Leather Seats Polished &amp; Specialty Leather Coated</li>\r\n	<li>Complete Vacuum of Interior, Roof-Liner &amp; Trunk</li>\r\n	<li>Floor Carpet Deep Cleaned (Stage 2)</li>\r\n	<li>Floor Mats Vacuum &amp; Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Seat Belts Steam Cleaned &amp; Sanitised</li>\r\n	<li>Interior Surfaces Steam Sanitised</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Mirrors / Glass Streak Free Wipe</li>\r\n	<li>A/C Vents Steam Cleaned &amp; Sanitised</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris</li>\r\n	<li>Steam Jet Wash</li>\r\n	<li>Swirl / Scratch Removal Polish Coat (Stage 1)</li>\r\n	<li>Wax Coat With Buffing Machine (Stage 2)</li>\r\n	<li>Underbody / Suspension Wash with 90* Lance</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down</li>\r\n	<li>Tyres &amp; Wheels Degreased &amp; Specialty Polished</li>\r\n	<li>Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Wax Coated</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>Emblems / Chrome Polished &amp; Waxed</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Hood Liner Water Pressure Cleaned</li>\r\n	<li>Engine Bay Air Pressure Blow Clean</li>\r\n	<li>Battery Terminals Cleaned &amp; Corrosion Coated</li>\r\n	<li>Drain Channels Cleaned &amp; Debris Removed</li>\r\n	<li>Engine Bay Steam Clean (Stage 2)</li>\r\n	<li>Rubber / Plastic Dressing &amp; Protectant Coated</li>\r\n</ul>\r\n', '120', '150'),
(13, '3', '4', '240', '4500', '4', 'Yes', '2019-02-27 08:42:19', '<ul>\r\n	<li>Air Blow Clean Seats / Carpet</li>\r\n	<li>Seats Spray Extraction &amp; Stain Removal (Stage 3)</li>\r\n	<li>Leather Seats Polished &amp; Specialty Leather Coated</li>\r\n	<li>Complete Vacuum of Interior, Roof-Liner &amp; Trunk</li>\r\n	<li>Floor Carpet Deep Cleaned (Stage 3)</li>\r\n	<li>Floor Mats Vacuum &amp; Cleaned</li>\r\n	<li>Door Pockets / Doorjambs / Pillars Cleaned</li>\r\n	<li>Seat Belts Steam Cleaned &amp; Sanitised</li>\r\n	<li>Complete Interior Cabin Steam Sanitised</li>\r\n	<li>Dashboard / Console Protectant Coated (Matt Finish)</li>\r\n	<li>Mirrors / Glass Streak Free Wipe</li>\r\n	<li>A/C Vents Steam Cleaned &amp; Sanitised</li>\r\n	<li>A/C System &amp; Interior Odour Elimination Treatment</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Air Blow Dirt &amp; Debris</li>\r\n	<li>Steam Jet Wash</li>\r\n	<li>Clay Bar Treatment</li>\r\n	<li>Specialty Swirl / Scratch Removal Polish Coat (Stage 3)</li>\r\n	<li>Specialty Wax Coat With Buffing Machine (Stage 3)</li>\r\n	<li>Underbody / Suspension Wash with 90* Lance</li>\r\n	<li>Air Blow Dry / Microfibre Wipe Down</li>\r\n	<li>Tyres &amp; Wheels Degreased &amp; Specialty Polished</li>\r\n	<li>Glass / Mirrors Streak Free Wipe</li>\r\n	<li>Head-lights / Tail-lights Anti-Fade Wax Coated</li>\r\n	<li>Rubber / Vinyl / Plastic Protectant Coated</li>\r\n	<li>Emblems / Chrome Polished &amp; Waxed</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Hood Liner Water Pressure Cleaned</li>\r\n	<li>Engine Bay Air Pressure Blow Clean</li>\r\n	<li>Battery Terminals Cleaned &amp; Corrosion Coated</li>\r\n	<li>Drain Channels Cleaned &amp; Debris Removed</li>\r\n	<li>Engine Bay Steam Clean (Stage 3)</li>\r\n	<li>Rubber / Plastic / Hoses Dressing &amp; Protectant Coated</li>\r\n	<li>Fluid Containers &amp; Caps Polished</li>\r\n	<li>Specialty Windshield Washer Fluid Topped Up</li>\r\n</ul>\r\n', '180', '210');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dc_about_us`
--
ALTER TABLE `dc_about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_admin`
--
ALTER TABLE `dc_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_banner_master`
--
ALTER TABLE `dc_banner_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_booking_details`
--
ALTER TABLE `dc_booking_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_category_master`
--
ALTER TABLE `dc_category_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_client_reviews`
--
ALTER TABLE `dc_client_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_contactus`
--
ALTER TABLE `dc_contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_contact_form`
--
ALTER TABLE `dc_contact_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_discount_coupon_master`
--
ALTER TABLE `dc_discount_coupon_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_faqs`
--
ALTER TABLE `dc_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_feature_master`
--
ALTER TABLE `dc_feature_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_footer`
--
ALTER TABLE `dc_footer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_gallery`
--
ALTER TABLE `dc_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_gallery_content`
--
ALTER TABLE `dc_gallery_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_home_carousel`
--
ALTER TABLE `dc_home_carousel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_home_page`
--
ALTER TABLE `dc_home_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_how_we_do`
--
ALTER TABLE `dc_how_we_do`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_package_master`
--
ALTER TABLE `dc_package_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_personal_details`
--
ALTER TABLE `dc_personal_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_quick_wash_master`
--
ALTER TABLE `dc_quick_wash_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_subscription_features_master`
--
ALTER TABLE `dc_subscription_features_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_subscription_master`
--
ALTER TABLE `dc_subscription_master`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dc_about_us`
--
ALTER TABLE `dc_about_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dc_admin`
--
ALTER TABLE `dc_admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dc_banner_master`
--
ALTER TABLE `dc_banner_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dc_booking_details`
--
ALTER TABLE `dc_booking_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dc_category_master`
--
ALTER TABLE `dc_category_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dc_client_reviews`
--
ALTER TABLE `dc_client_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dc_contactus`
--
ALTER TABLE `dc_contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dc_contact_form`
--
ALTER TABLE `dc_contact_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `dc_discount_coupon_master`
--
ALTER TABLE `dc_discount_coupon_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dc_faqs`
--
ALTER TABLE `dc_faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `dc_feature_master`
--
ALTER TABLE `dc_feature_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dc_footer`
--
ALTER TABLE `dc_footer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dc_gallery`
--
ALTER TABLE `dc_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dc_gallery_content`
--
ALTER TABLE `dc_gallery_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dc_home_carousel`
--
ALTER TABLE `dc_home_carousel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `dc_home_page`
--
ALTER TABLE `dc_home_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dc_how_we_do`
--
ALTER TABLE `dc_how_we_do`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dc_package_master`
--
ALTER TABLE `dc_package_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dc_personal_details`
--
ALTER TABLE `dc_personal_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dc_quick_wash_master`
--
ALTER TABLE `dc_quick_wash_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dc_subscription_features_master`
--
ALTER TABLE `dc_subscription_features_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `dc_subscription_master`
--
ALTER TABLE `dc_subscription_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
