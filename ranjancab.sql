-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2026 at 06:28 PM
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `booking_ref_no`, `customer_name`, `customer_phone`, `first_name`, `last_name`, `mobile_number`, `trip_type`, `pickup_location`, `drop_location`, `pickup_date`, `return_date`, `pickup_time`, `car_type`, `distance`, `total_fare`, `advance_paid`, `driver_balance`, `otp_code`, `booking_flag`, `assigned_driver_id`, `created_at`) VALUES
(1, 'RC-DEMO001', 'Rahul Mehta', '9876543210', 'Rahul', 'Mehta', '9876543210', 'Oneway', 'Bhopal Railway Station, Bhopal', 'Indore', '2026-06-15', NULL, '09:30:00', 'Sedan', 195, 3027.5, 500, 2527.5, '1234', 1, NULL, '2026-06-11 03:30:00'),
(2, 'RC-DEMO002', 'Priya Singh', '9876543211', 'Priya', 'Singh', '9876543211', 'Roundtrip', 'Bhopal Airport, Bhopal', 'Ujjain', '2026-06-16', '2026-06-18', '07:00:00', 'SUV', 190, 7585, 800, 6785, '2345', 2, 3, '2026-06-11 04:45:00'),
(3, 'RC-DEMO003', 'Ankit Jain', '9876543212', 'Ankit', 'Jain', '9876543212', 'Oneway', 'Bhopal ISBT, Bhopal', 'Sanchi', '2026-06-09', NULL, '11:45:00', 'Sedan', 48, 896, 500, 396, '3456', 3, 1, '2026-06-09 03:00:00'),
(4, 'RC-DEMO004', 'Neha Gupta', '9876543213', 'Neha', 'Gupta', '9876543213', 'Oneway', 'Indore Vijay Nagar, Indore', 'Ujjain', '2026-06-12', NULL, '15:30:00', 'Hatchback', 55, 810, 400, 410, '4567', 1, 1, '2026-06-11 05:50:00'),
(5, 'RC-9A2D193E', 'Vaishu', '1111111111', NULL, NULL, NULL, 'Oneway', 'Ujjain', 'Indore', '2026-06-24', NULL, '02:59:00', 'SUV', 55, 1400, 0, 1400, '6377', 1, NULL, '2026-06-11 16:24:50');

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
  `cancelled_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cancelled_bookings`
--

INSERT INTO `cancelled_bookings` (`id`, `booking_id`, `booking_ref_no`, `customer_name`, `customer_phone`, `pickup_location`, `drop_location`, `pickup_date`, `pickup_time`, `car_type`, `total_fare`, `assigned_driver_id`, `cancelled_by`, `cancellation_reason`, `cancelled_at`) VALUES
(1, 5, 'RC-CAN001', 'Vikas Tiwari', '9876543214', 'Bhopal', 'Indore', '2026-06-10', '18:00:00', 'Sedan', 3027.5, 1, 'Admin', 'Customer requested cancellation during demo setup', '2026-06-11 16:12:02');

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

INSERT INTO `fleet` (`id`, `driver_name`, `mobile_number`, `password`, `is_first_login`, `vehicle_number`, `model_name`, `car_type`, `base_station`, `star_rating`, `rating`, `is_verified`, `status`, `driver_license_no`, `aadhaar_no`, `doc_license_path`, `doc_aadhaar_path`, `doc_rc_path`, `doc_cab_path`, `doc_avatar_path`, `created_at`) VALUES
(1, 'Sanjeev Kumar', '8959158195', 'Kumar', 1, 'MP-04-HE-1234', 'Maruti Dzire', 'Sedan', 'Bhopal', 4.90, 4.90, 1, 'Active', 'MP0420220001', 'XXXX-XXXX-1111', 'uploads/drivers/dr_1_doc_license_1780469222.pdf', 'uploads/drivers/dr_1_doc_aadhaar_1780469222.pdf', 'uploads/drivers/dr_1_doc_rc_1780469222.PDF', 'uploads/drivers/dr_1_doc_cab_1780469222.jpg', 'uploads/drivers/dr_1_doc_avatar_1780469222.jpg', '2026-06-11 16:12:02'),
(2, 'Amit Sharma', '9000000002', 'Sharma', 1, 'MP-04-CB-7788', 'Hyundai Aura', 'Sedan', 'Bhopal', 4.70, 4.70, 1, 'Active', 'MP0420220002', 'XXXX-XXXX-2222', NULL, NULL, NULL, NULL, NULL, '2026-06-11 16:12:02'),
(3, 'Ravi Verma', '9000000003', 'Verma', 1, 'MP-04-SU-5511', 'Mahindra Scorpio', 'SUV', 'Bhopal', 4.80, 4.80, 1, 'Active', 'MP0420220003', 'XXXX-XXXX-3333', NULL, NULL, NULL, NULL, NULL, '2026-06-11 16:12:02'),
(4, 'Nitin Patel', '9000000004', 'Patel', 1, 'MP-09-HA-3210', 'Maruti WagonR', 'Hatchback', 'Indore', 4.50, 4.50, 1, 'Inactive', 'MP0920220004', 'XXXX-XXXX-4444', NULL, NULL, NULL, NULL, NULL, '2026-06-11 16:12:02');

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
(1, 'Sedan', 14.50, 200.00, 500.00, '2026-06-11 16:12:02', '2026-06-11 16:12:02'),
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
(8, 'Ujjain', 'Indore', 55, '2026-06-11 16:12:02');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `booking_rejections`
--
ALTER TABLE `booking_rejections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cancelled_bookings`
--
ALTER TABLE `cancelled_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fleet`
--
ALTER TABLE `fleet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pricing_settings`
--
ALTER TABLE `pricing_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
