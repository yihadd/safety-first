-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2023 at 11:24 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `safety_first`
--

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `complaint_id` varchar(10) NOT NULL,
  `complaint` varchar(255) DEFAULT NULL,
  `location_id` int(10) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `officer_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`complaint_id`, `complaint`, `location_id`, `status`, `officer_id`) VALUES
('c001', 'the way is dark', 11, 'not start', 'a001'),
('c002', 'the way is dangerous', 12, 'in progress', 'a002'),
('c003', 'no light', 13, 'in progress', 'a001'),
('c004', 'no light', 14, 'done', 'a001'),
('c005', 'no CCTV around building', 15, 'not start', 'a001'),
('c006', 'no water', 16, 'in progress', 'a002'),
('c007', ' no traffic light', 17, 'not start', 'a001'),
('c008', 'building is dark', 18, 'done', 'a002');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_timeline`
--

CREATE TABLE `complaint_timeline` (
  `complaint_categories_timeline` varchar(10) NOT NULL,
  `user_id` varchar(10) DEFAULT NULL,
  `complaint_id` varchar(10) DEFAULT NULL,
  `complaint_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaint_timeline`
--

INSERT INTO `complaint_timeline` (`complaint_categories_timeline`, `user_id`, `complaint_id`, `complaint_date`) VALUES
('b001', 'm001', 'c001', '2023-07-11'),
('b002', 'm002', 'c002', '2023-07-11'),
('b003', 'm001', 'c003', '2023-07-12'),
('b004', 'm002', 'c004', '2023-07-13'),
('b005', 'm001', 'c005', '2023-07-14'),
('b006', 'm002', 'c006', '2023-08-05'),
('b007', 'm001', 'c007', '2023-08-10'),
('b008', 'm002', 'c008', '2023-08-15');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(10) NOT NULL,
  `location_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `location_name`) VALUES
(11, 'dormatery 1'),
(12, 'dormatery 7'),
(13, 'dormatery 5'),
(14, 'in front masjid'),
(15, 'IT faculty'),
(16, 'quran building'),
(17, 'in front University'),
(18, 'Education building');

-- --------------------------------------------------------

--
-- Table structure for table `officer`
--

CREATE TABLE `officer` (
  `officer_id` varchar(10) NOT NULL,
  `officer_categories` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `officer`
--

INSERT INTO `officer` (`officer_id`, `officer_categories`) VALUES
('a001', 'admin1'),
('a002', 'admin2');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(10) NOT NULL,
  `user_categories` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_categories`) VALUES
('m001', 'student'),
('m002', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `user_complaint`
--

CREATE TABLE `user_complaint` (
  `number_id` int(10) NOT NULL,
  `new_location_id` int(11) DEFAULT NULL,
  `new_complaint_id` varchar(10) DEFAULT NULL,
  `new_user_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_complaint`
--

INSERT INTO `user_complaint` (`number_id`, `new_location_id`, `new_complaint_id`, `new_user_id`) VALUES
(2, 11, 'c001', 'm001'),
(3, 12, 'c002', 'm002'),
(4, 13, 'c003', 'm001'),
(5, 14, 'c004', 'm002'),
(6, 15, 'c005', 'm001'),
(7, 16, 'c006', 'm002'),
(8, 17, 'c007', 'm001'),
(9, 18, 'c008', 'm002');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `fk_location_id` (`location_id`),
  ADD KEY `fk_officer_id` (`officer_id`);

--
-- Indexes for table `complaint_timeline`
--
ALTER TABLE `complaint_timeline`
  ADD PRIMARY KEY (`complaint_categories_timeline`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_complaint_id` (`complaint_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `officer`
--
ALTER TABLE `officer`
  ADD PRIMARY KEY (`officer_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_complaint`
--
ALTER TABLE `user_complaint`
  ADD PRIMARY KEY (`number_id`),
  ADD KEY `fk_new_location_id` (`new_location_id`),
  ADD KEY `fk_new_complaint_id` (`new_complaint_id`),
  ADD KEY `fk_new_user_id` (`new_user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `fk_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `fk_officer_id` FOREIGN KEY (`officer_id`) REFERENCES `officer` (`officer_id`);

--
-- Constraints for table `complaint_timeline`
--
ALTER TABLE `complaint_timeline`
  ADD CONSTRAINT `fk_complaint_id` FOREIGN KEY (`complaint_id`) REFERENCES `complaint` (`complaint_id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `user_complaint`
--
ALTER TABLE `user_complaint`
  ADD CONSTRAINT `fk_new_complaint_id` FOREIGN KEY (`new_complaint_id`) REFERENCES `complaint` (`complaint_id`),
  ADD CONSTRAINT `fk_new_location_id` FOREIGN KEY (`new_location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `fk_new_user_id` FOREIGN KEY (`new_user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
