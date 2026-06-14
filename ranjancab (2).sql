-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2026 at 07:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ranjancab`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(180) NOT NULL,
  `slug` varchar(220) NOT NULL,
  `excerpt` varchar(300) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(100) NOT NULL DEFAULT 'RanjanCabs Admin',
  `status` enum('draft','published') NOT NULL DEFAULT 'published',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `excerpt`, `content`, `author`, `status`, `created_at`, `updated_at`) VALUES
(1, 'How to Plan a Comfortable Bhopal to Indore Cab Ride', 'bhopal-to-indore-cab-ride', 'A practical checklist for timing, luggage, route planning, and choosing the right cab class for intercity travel.', 'A comfortable intercity cab ride starts with a clear pickup point, realistic travel time, and a vehicle class that fits your luggage and passenger count. For Bhopal to Indore, Sedan works well for compact groups, while SUV is better for extra bags or family travel. Book ahead during weekends and keep your OTP ready at pickup for faster trip start verification.', 'RanjanCabs Admin', 'published', '2026-06-11 06:30:00', '2026-06-11 18:18:39'),
(2, 'Why Verified Drivers Matter for Your Taxi Booking', 'verified-drivers-taxi-booking', 'Verified driver documents help make every trip more transparent, accountable, and safer for customers.', 'Driver verification is more than a formality. Licence, Aadhaar, and cab registration documents help the operations team confirm that a fleet partner is ready for customer duty. RanjanCabs keeps these records available to admins so only verified drivers are marked ready for live assignments.', 'RanjanCabs Admin', 'published', '2026-06-11 07:00:00', '2026-06-11 18:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `booking_ref_no` varchar(30) DEFAULT NULL,
  `customer_name` varchar(120) DEFAULT NULL,
  `customer_phone` varchar(15) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(15) DEFAULT NULL,
  `trip_type` varchar(30) NOT NULL DEFAULT 'Oneway',
  `pickup_location` varchar(255) NOT NULL,
  `drop_location` varchar(255) NOT NULL,
  `pickup_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `pickup_time` time NOT NULL,
  `car_type` varchar(30) NOT NULL,
  `distance` double NOT NULL DEFAULT 0,
  `total_fare` double NOT NULL DEFAULT 0,
  `advance_paid` double NOT NULL DEFAULT 0,
  `driver_balance` double NOT NULL DEFAULT 0,
  `otp_code` varchar(6) NOT NULL,
  `booking_flag` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active/searching, 2=in transit/cancelled in some admin views, 3=completed, -1=failed',
  `assigned_driver_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `coupon_code` varchar(30) DEFAULT NULL,
  `coupon_discount` double NOT NULL DEFAULT 0,
  `discounted_fare` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `booking_ref_no`, `customer_name`, `customer_phone`, `first_name`, `last_name`, `mobile_number`, `trip_type`, `pickup_location`, `drop_location`, `pickup_date`, `return_date`, `pickup_time`, `car_type`, `distance`, `total_fare`, `advance_paid`, `driver_balance`, `otp_code`, `booking_flag`, `assigned_driver_id`, `created_at`, `coupon_code`, `coupon_discount`, `discounted_fare`) VALUES
(1, 'RC-DEMO001', 'Rahul Mehta', '9876543210', 'Rahul', 'Mehta', '9876543210', 'Oneway', 'Bhopal Railway Station, Bhopal', 'Indore', '2026-06-15', NULL, '09:30:00', 'Sedan', 195, 3027.5, 302.75, 2724.75, '1234', 1, NULL, '2026-06-11 03:30:00', NULL, 0, 3027.5),
(2, 'RC-DEMO002', 'Priya Singh', '9876543211', 'Priya', 'Singh', '9876543211', 'Roundtrip', 'Bhopal Airport, Bhopal', 'Ujjain', '2026-06-16', '2026-06-18', '07:00:00', 'SUV', 190, 7585, 758.5, 6826.5, '2345', 2, 3, '2026-06-11 04:45:00', NULL, 0, 7585),
(3, 'RC-DEMO003', 'Ankit Jain', '9876543212', 'Ankit', 'Jain', '9876543212', 'Oneway', 'Bhopal ISBT, Bhopal', 'Sanchi', '2026-06-09', NULL, '11:45:00', 'Sedan', 48, 896, 500, 396, '3456', 3, 1, '2026-06-09 03:00:00', NULL, 0, 896),
(4, 'RC-DEMO004', 'Neha Gupta', '9876543213', 'Neha', 'Gupta', '9876543213', 'Oneway', 'Indore Vijay Nagar, Indore', 'Ujjain', '2026-06-12', NULL, '15:30:00', 'Hatchback', 55, 810, 81, 729, '4567', 1, 1, '2026-06-11 05:50:00', NULL, 0, 810),
(5, 'RC-9A2D193E', 'Vaishu', '1111111111', NULL, NULL, NULL, 'Oneway', 'Ujjain', 'Indore', '2026-06-24', NULL, '02:59:00', 'SUV', 55, 1400, 140, 1260, '6377', 1, NULL, '2026-06-11 16:24:50', NULL, 0, 1400),
(6, 'RC-B46935A8', 'Angel Shreshth', '8959158195', NULL, NULL, NULL, 'Oneway', 'Bhopal', 'Indore', '2026-06-18', NULL, '23:18:00', 'Sedan', 195, 3027, 302.7, 2724.3, '5448', 1, NULL, '2026-06-13 14:47:35', NULL, 0, 3027),
(7, 'RC-6DC342C9', 'Vaishu Shreshth', '8978987654', NULL, NULL, NULL, 'Oneway', 'Bhopal', 'Indore', '2026-06-24', NULL, '23:27:00', 'Sedan', 195, 3027, 302.7, 2724.3, '9020', 1, NULL, '2026-06-13 14:55:25', NULL, 0, 3027),
(8, 'RC-8A900953', 'Vaishu', '9516010790', NULL, NULL, NULL, 'Oneway', 'Bhopal', 'Indore', '2026-06-18', NULL, '00:47:00', 'Sedan', 195, 3027, 0, 3027, '3917', 3, 1, '2026-06-13 15:32:47', NULL, 0, 3027),
(9, 'RC-EF459C2C', 'Angel Vaishu', '8989898989', NULL, NULL, NULL, 'Oneway', 'Bhopal', 'Indore', '2026-06-20', NULL, '02:56:00', 'Sedan', 195, 3027, 302.7, 2724.3, '2363', 1, NULL, '2026-06-13 17:24:29', NULL, 0, 3027),
(10, 'RC-09CCFA6B', 'Ratana', '8959123241', NULL, NULL, NULL, 'Oneway', 'Bhopal', 'Indore', '2026-06-15', NULL, '17:26:00', 'Sedan', 195, 3027.5, 272.48, 2452.27, '1925', 3, 1, '2026-06-14 10:56:17', 'RANJAN10', 302.75, 2724.75),
(11, 'RC-86EBA872', 'Raghu', '8959134254', NULL, NULL, NULL, 'Oneway', 'Bhopal', 'Indore', '2026-06-16', NULL, '18:37:00', 'Sedan', 195, 3027.5, 272.48, 2452.27, '6150', 3, 1, '2026-06-14 11:05:58', 'RANJAN10', 302.75, 2724.75);

-- --------------------------------------------------------

--
-- Table structure for table `booking_rejections`
--

CREATE TABLE `booking_rejections` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `rejected_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_rejections`
--

INSERT INTO `booking_rejections` (`id`, `booking_id`, `driver_id`, `rejected_at`) VALUES
(1, 1, 2, '2026-06-11 16:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `cancelled_bookings`
--

CREATE TABLE `cancelled_bookings` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `booking_ref_no` varchar(30) DEFAULT NULL,
  `customer_name` varchar(120) DEFAULT NULL,
  `customer_phone` varchar(15) DEFAULT NULL,
  `pickup_location` varchar(255) NOT NULL,
  `drop_location` varchar(255) NOT NULL,
  `pickup_date` date NOT NULL,
  `pickup_time` time NOT NULL,
  `car_type` varchar(30) NOT NULL,
  `total_fare` double NOT NULL DEFAULT 0,
  `assigned_driver_id` int(11) DEFAULT NULL,
  `cancelled_by` varchar(50) NOT NULL DEFAULT 'Admin',
  `cancellation_reason` text DEFAULT NULL,
  `cancelled_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `advance_paid` double NOT NULL DEFAULT 0,
  `discounted_fare` double NOT NULL DEFAULT 0,
  `coupon_code` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cancelled_bookings`
--

INSERT INTO `cancelled_bookings` (`id`, `booking_id`, `booking_ref_no`, `customer_name`, `customer_phone`, `pickup_location`, `drop_location`, `pickup_date`, `pickup_time`, `car_type`, `total_fare`, `assigned_driver_id`, `cancelled_by`, `cancellation_reason`, `cancelled_at`, `advance_paid`, `discounted_fare`, `coupon_code`) VALUES
(1, 5, 'RC-CAN001', 'Vikas Tiwari', '9876543214', 'Bhopal', 'Indore', '2026-06-10', '18:00:00', 'Sedan', 3027.5, 1, 'Admin', 'Customer requested cancellation during demo setup', '2026-06-11 16:12:02', 0, 3027.5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_codes`
--

CREATE TABLE `coupon_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(30) NOT NULL,
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 10.00,
  `description` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `valid_from` date DEFAULT NULL,
  `valid_until` date DEFAULT NULL,
  `usage_count` int(11) NOT NULL DEFAULT 0,
  `max_usage` int(11) NOT NULL DEFAULT 100,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_codes`
--

INSERT INTO `coupon_codes` (`id`, `code`, `discount_percent`, `description`, `is_active`, `valid_from`, `valid_until`, `usage_count`, `max_usage`, `created_at`) VALUES
(1, 'RANJAN10', 10.00, 'Welcome offer — 10% off your first ride', 1, NULL, NULL, 2, 100, '2026-06-14 10:47:47'),
(2, 'SUMMER25', 10.00, 'Summer special — 10% discount on all routes', 0, NULL, NULL, 0, 100, '2026-06-14 10:47:47'),
(3, 'FESTIVE10', 10.00, 'Festival season offer — 10% off', 0, NULL, NULL, 0, 100, '2026-06-14 10:47:47');

-- --------------------------------------------------------

--
-- Table structure for table `customer_credentials`
--

CREATE TABLE `customer_credentials` (
  `id` int(11) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expiry` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_credentials`
--

INSERT INTO `customer_credentials` (`id`, `customer_phone`, `customer_email`, `password`, `reset_token`, `reset_token_expiry`, `created_at`) VALUES
(2, '1111111111', 'testrunner@ranjancabs.com', '$2y$10$68wPTFjQPCgQKxy5EgWPzOPY17bQg3GEI0Hu1b9kPiOUMY6inA2WG', NULL, NULL, '2026-06-12 16:31:54'),
(3, '9516010790', '9516010790@ranjancabs.local', '$2y$10$/L8EYvv64ttCrnk55tPQ7uZXO78mW.jVNl1Rjh2jDG6v3ihdSBTpe', NULL, NULL, '2026-06-13 15:32:47'),
(4, '8989898989', '8989898989@ranjancabs.local', '$2y$10$aVgbCz4s5uz17wJrkaGGu.L8gslJ.69dvIwFl0QGTVHnTOrTb98cq', NULL, NULL, '2026-06-13 17:24:29'),
(5, '8959123241', '8959123241@ranjancabs.local', '$2y$10$/yTG4cAdAIPtQWmCR/0ZtOQExJTOMPtq4ugTLd8cGKDOIVZYJKJJC', NULL, NULL, '2026-06-14 10:56:18'),
(6, '8959134254', '8959134254@ranjancabs.local', '$2y$10$EG43pGEeY1Rdp8VoC6qYNuTg9rySqMKBqdjvuJ21ocVhNqRmb3w8m', NULL, NULL, '2026-06-14 11:05:58');

-- --------------------------------------------------------

--
-- Table structure for table `fleet`
--

CREATE TABLE `fleet` (
  `id` int(11) NOT NULL,
  `driver_name` varchar(100) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_first_login` tinyint(1) NOT NULL DEFAULT 1,
  `vehicle_number` varchar(20) NOT NULL,
  `model_name` varchar(80) NOT NULL,
  `car_type` varchar(30) NOT NULL,
  `base_station` varchar(120) NOT NULL,
  `star_rating` decimal(3,2) NOT NULL DEFAULT 5.00,
  `rating` decimal(3,2) NOT NULL DEFAULT 5.00,
  `is_verified` tinyint(1) NOT NULL DEFAULT 1,
  `status` varchar(20) NOT NULL DEFAULT 'Active',
  `driver_license_no` varchar(50) DEFAULT NULL,
  `aadhaar_no` varchar(50) DEFAULT NULL,
  `rc_no` varchar(50) DEFAULT NULL,
  `doc_license_path` varchar(255) DEFAULT NULL,
  `doc_aadhaar_path` varchar(255) DEFAULT NULL,
  `doc_rc_path` varchar(255) DEFAULT NULL,
  `doc_cab_path` varchar(255) DEFAULT NULL,
  `doc_avatar_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fleet`
--

INSERT INTO `fleet` (`id`, `driver_name`, `mobile_number`, `password`, `is_first_login`, `vehicle_number`, `model_name`, `car_type`, `base_station`, `star_rating`, `rating`, `is_verified`, `status`, `driver_license_no`, `aadhaar_no`, `rc_no`, `doc_license_path`, `doc_aadhaar_path`, `doc_rc_path`, `doc_cab_path`, `doc_avatar_path`, `created_at`) VALUES
(1, 'Sanjeev Kumar', '8959158195', 'Kumar', 1, 'MP-04-HE-1234', 'Maruti Dzire', 'Sedan', 'Bhopal', 4.90, 4.90, 1, 'Active', 'MP0420220001', 'XXXX-XXXX-1111', 'MP04HE1234RC', 'uploads/drivers/dr_1_doc_license_1780469222.pdf', 'uploads/drivers/dr_1_doc_aadhaar_1780469222.pdf', 'uploads/drivers/dr_1_doc_rc_1780469222.PDF', 'uploads/drivers/dr_1_doc_cab_1780469222.jpg', 'uploads/drivers/dr_1_doc_avatar_1780469222.jpg', '2026-06-11 16:12:02'),
(2, 'Amit Sharma', '9000000002', 'Sharma', 1, 'MP-04-CB-7788', 'Hyundai Aura', 'Sedan', 'Bhopal', 4.70, 4.70, 0, 'Active', 'MP0420220002', 'XXXX-XXXX-2222', 'MP04CB7788RC', NULL, NULL, NULL, NULL, NULL, '2026-06-11 16:12:02'),
(3, 'Ravi Verma', '9000000003', 'Verma', 1, 'MP-04-SU-5511', 'Mahindra Scorpio', 'SUV', 'Bhopal', 4.80, 4.80, 0, 'Active', 'MP0420220003', 'XXXX-XXXX-3333', 'MP04SU5511RC', NULL, NULL, NULL, NULL, NULL, '2026-06-11 16:12:02'),
(4, 'Nitin Patel', '9000000004', 'Patel', 1, 'MP-09-HA-3210', 'Maruti WagonR', 'Hatchback', 'Indore', 4.50, 4.50, 0, 'Active', 'MP0920220004', 'XXXX-XXXX-4444', 'MP09HA3210RC', NULL, NULL, NULL, NULL, NULL, '2026-06-11 16:12:02'),
(6, 'Dharmu', '9934452732', '$2y$10$n1L1Ew5ntXUOYLMKeLYQruzk7lDNuqHtkCYgGPHym0VVktJaYL0ki', 1, 'BR016543', 'Wagon R', 'Hatchback', 'Patna', 5.00, 5.00, 1, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-14 16:24:06'),
(8, 'Ravi Rana', '9934564341', '$2y$10$Zj3qbjvJyeaNHxF/VVLZr.pUSVozMnXDjwkbziGdYMl4kQhml/GDy', 1, 'CV5643GA', 'Seeker', 'Sedan', 'Patna', 5.00, 5.00, 1, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-14 16:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `pricing_settings`
--

CREATE TABLE `pricing_settings` (
  `id` int(11) NOT NULL,
  `car_type` varchar(30) NOT NULL,
  `rate_per_km` decimal(10,2) NOT NULL,
  `portal_charges` decimal(10,2) NOT NULL,
  `advance_percentage` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pricing_settings`
--

INSERT INTO `pricing_settings` (`id`, `car_type`, `rate_per_km`, `portal_charges`, `advance_percentage`, `created_at`, `updated_at`) VALUES
(1, 'Sedan', 18.00, 200.00, 10.00, '2026-06-11 16:12:02', '2026-06-14 11:21:33'),
(2, 'SUV', 20.00, 300.00, 800.00, '2026-06-11 16:12:02', '2026-06-11 16:12:02'),
(3, 'Hatchback', 12.00, 150.00, 400.00, '2026-06-11 16:12:02', '2026-06-11 16:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `pickup_point` varchar(255) NOT NULL,
  `drop_point` varchar(255) NOT NULL,
  `estimated_distance` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `pickup_point`, `drop_point`, `estimated_distance`, `created_at`) VALUES
(1, 'Bhopal', 'Indore', 195, '2026-06-11 16:12:02'),
(2, 'Indore', 'Bhopal', 195, '2026-06-11 16:12:02'),
(3, 'Bhopal', 'Ujjain', 190, '2026-06-11 16:12:02'),
(4, 'Ujjain', 'Bhopal', 190, '2026-06-11 16:12:02'),
(5, 'Bhopal', 'Sanchi', 48, '2026-06-11 16:12:02'),
(6, 'Sanchi', 'Bhopal', 48, '2026-06-11 16:12:02'),
(7, 'Indore', 'Ujjain', 55, '2026-06-11 16:12:02'),
(8, 'Ujjain', 'Indore', 55, '2026-06-11 16:12:02'),
(9, 'Hyderabad Airport', 'BHEL RD Hyderabar', 45, '2026-06-14 11:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `travel_pages`
--

CREATE TABLE `travel_pages` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `intro_text` text DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `table_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`table_data`)),
  `primary_color` varchar(7) DEFAULT '#ff5a5f',
  `secondary_color` varchar(7) DEFAULT '#111111'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_blogs_slug` (`slug`),
  ADD KEY `idx_blogs_status_created` (`status`,`created_at`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_booking_ref_no` (`booking_ref_no`),
  ADD KEY `idx_bookings_customer_phone` (`customer_phone`),
  ADD KEY `idx_bookings_mobile_number` (`mobile_number`),
  ADD KEY `idx_bookings_flag_driver` (`booking_flag`,`assigned_driver_id`),
  ADD KEY `idx_bookings_car_pickup` (`car_type`,`pickup_location`),
  ADD KEY `fk_bookings_driver` (`assigned_driver_id`);

--
-- Indexes for table `booking_rejections`
--
ALTER TABLE `booking_rejections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_booking_driver_rejection` (`booking_id`,`driver_id`),
  ADD KEY `idx_rejections_driver` (`driver_id`);

--
-- Indexes for table `cancelled_bookings`
--
ALTER TABLE `cancelled_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cancelled_driver` (`assigned_driver_id`);

--
-- Indexes for table `coupon_codes`
--
ALTER TABLE `coupon_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_coupon_code` (`code`);

--
-- Indexes for table `customer_credentials`
--
ALTER TABLE `customer_credentials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_phone` (`customer_phone`),
  ADD UNIQUE KEY `customer_email` (`customer_email`);

--
-- Indexes for table `fleet`
--
ALTER TABLE `fleet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_fleet_mobile_number` (`mobile_number`),
  ADD KEY `idx_fleet_status_type_station` (`status`,`car_type`,`base_station`);

--
-- Indexes for table `pricing_settings`
--
ALTER TABLE `pricing_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_pricing_car_type` (`car_type`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_route_pair` (`pickup_point`,`drop_point`);

--
-- Indexes for table `travel_pages`
--
ALTER TABLE `travel_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `booking_rejections`
--
ALTER TABLE `booking_rejections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cancelled_bookings`
--
ALTER TABLE `cancelled_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupon_codes`
--
ALTER TABLE `coupon_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_credentials`
--
ALTER TABLE `customer_credentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fleet`
--
ALTER TABLE `fleet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pricing_settings`
--
ALTER TABLE `pricing_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `travel_pages`
--
ALTER TABLE `travel_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_bookings_driver` FOREIGN KEY (`assigned_driver_id`) REFERENCES `fleet` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `booking_rejections`
--
ALTER TABLE `booking_rejections`
  ADD CONSTRAINT `fk_rejections_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rejections_driver` FOREIGN KEY (`driver_id`) REFERENCES `fleet` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cancelled_bookings`
--
ALTER TABLE `cancelled_bookings`
  ADD CONSTRAINT `fk_cancelled_bookings_driver` FOREIGN KEY (`assigned_driver_id`) REFERENCES `fleet` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
