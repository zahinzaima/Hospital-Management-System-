-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2022 at 07:02 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `adm_id` int(4) NOT NULL,
  `adm_name` varchar(50) DEFAULT NULL,
  `adm_email` varchar(150) DEFAULT NULL,
  `is_staff` tinyint(1) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `pass` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`adm_id`, `adm_name`, `adm_email`, `is_staff`, `is_admin`, `pass`) VALUES
(2200, 'Ashik', 'abidhossainashik@gmail.com', 1, 1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dep_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dep_name`) VALUES
('CARDIOLOGY'),
('DENTAL'),
('GAYNAE'),
('MEDICINE'),
('NEUROLOGY'),
('SURGERY');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doc_id` int(4) NOT NULL,
  `doc_name` varchar(50) DEFAULT NULL,
  `doc_email` varchar(150) DEFAULT NULL,
  `degree` varchar(150) DEFAULT NULL,
  `speciality` varchar(300) DEFAULT NULL,
  `visit` int(11) DEFAULT NULL,
  `dep_name` varchar(50) DEFAULT NULL,
  `doc_image` varchar(150) DEFAULT NULL,
  `pass` varchar(6) DEFAULT NULL,
  `adm_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doc_id`, `doc_name`, `doc_email`, `degree`, `speciality`, `visit`, `dep_name`, `doc_image`, `pass`, `adm_id`) VALUES
(1100, 'Dr. Haque', 'doc.haque@gmail.com', 'MBBS, FCPS', 'Dental Surgeon', 500, 'DENTAL', 'default-doc-img.png', '0000', 2200),
(1101, 'Dr. Afroza Khanom', 'doc.afroza@gmail.com', 'MBBS, FCPS(Obs. & Gynae), DGO, MCPS(Obs. & Gynae)', 'Gynecology', 700, 'GAYNAE', 'default-doc-img.png', '0000', 2200),
(1102, 'Dr. Shams Munwar', 'doc.shams@gmail.com', 'MBBS, MRCP (UK), D.Card (London)', 'Senior Consultant', 900, 'CARDIOLOGY', 'default-doc-img.png', '0000', 2200),
(1103, 'Dr. Chowdhury Ratib Abdullah', 'doc.ratib@gmail.com', 'MBBS, CCD', 'Medicine Specialist', 600, 'MEDICINE', 'default-doc-img.png', '0000', 2200),
(1104, 'Md Yasin', 'yasin@gmial.com', 'MBBS', 'Intern', 100, 'MEDICINE', 'doc_default.png', '0000', 2200);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pat_id` int(6) NOT NULL,
  `pat_name` varchar(50) DEFAULT NULL,
  `pat_email` varchar(150) NOT NULL,
  `gander` varchar(6) DEFAULT NULL,
  `address` varchar(15) DEFAULT NULL,
  `pat_image` varchar(150) DEFAULT NULL,
  `pass` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pat_id`, `pat_name`, `pat_email`, `gander`, `address`, `pat_image`, `pass`) VALUES
(20220000, 'Abid', 'abid.hossain.ashik@g.bracu.ac.bd', 'Male', 'Dhaka', 'Abid.jpeg', '0000'),
(20220001, 'Priyam', 'priyam@gmail.com', 'Female', 'Dhaka', 'Priyam.png', '0000');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `doc_id` int(4) NOT NULL,
  `sch_day` varchar(12) NOT NULL,
  `t_from` time NOT NULL,
  `t_to` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`doc_id`, `sch_day`, `t_from`, `t_to`) VALUES
(1100, 'Monday', '16:00:00', '18:00:00'),
(1100, 'Sunday', '16:00:00', '18:00:00'),
(1103, 'Friday', '18:00:00', '21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `sto_name` varchar(150) NOT NULL,
  `details` varchar(2000) DEFAULT NULL,
  `sto_image` varchar(50) DEFAULT NULL,
  `adm_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`sto_name`, `details`, `sto_image`, `adm_id`) VALUES
('Piara Begum', 'Piara Begum, 41, a resident of Bhola, was diagnosed with a small tumor in her uterus nine years ago. The patient was treated by a local doctor but did not recover. When the condition worsens, at some point abnormal bleeding also starts. In this condition he was admitted to Evercare Hospital Dhaka. Her treatment started here under the supervision of Dr. Monowara Begum, Senior Consultant and Coordinator, Department of Obstetrics and Gynecology. It is learned that Piara Begum has contracted cancer. Both the patients and the doctors have given details about the medical services of Evercare Hospital Dhaka to deal with this complex situation.', 'Piara Begum.png', 2200);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dep_name`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doc_id`),
  ADD KEY `dep_name` (`dep_name`),
  ADD KEY `adm_id` (`adm_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pat_id`,`pat_email`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`doc_id`,`sch_day`,`t_from`,`t_to`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`sto_name`),
  ADD KEY `adm_id` (`adm_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`dep_name`) REFERENCES `departments` (`dep_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`adm_id`) REFERENCES `admins` (`adm_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `stories_ibfk_1` FOREIGN KEY (`adm_id`) REFERENCES `admins` (`adm_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
