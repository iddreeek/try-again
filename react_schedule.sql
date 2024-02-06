-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 06, 2024 at 07:57 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `react_schedule`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_ID` int(10) NOT NULL,
  `calendar_ID` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_ID`, `calendar_ID`, `title`, `start`, `end`) VALUES
(1, 1, 'Demacian Party', '2023-12-16 00:00:00', '2023-12-25 00:00:00'),
(2, 1, 'Mage Hunting', '2023-12-08 00:00:00', '2023-12-10 00:00:00'),
(5, 1, 'Demaciaaaa', '2023-12-04 22:30:00', '2023-12-05 01:30:00'),
(6, 1, 'Mage Cell Inspection', '2023-12-05 16:00:00', '2023-12-07 16:00:00'),
(7, 1, 'Try', '2023-12-12 16:00:00', '2023-12-13 16:00:00'),
(8, 1, 'Maynkrap Taym', '2023-12-25 16:00:00', '2023-12-27 16:00:00'),
(9, 1, 'awit', '2023-09-11 16:00:00', '2023-09-12 16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_ID` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_ID`, `group_name`) VALUES
(1, 'Demacian'),
(2, 'ND');

-- --------------------------------------------------------

--
-- Table structure for table `group_calendar`
--

CREATE TABLE `group_calendar` (
  `calendar_ID` int(10) NOT NULL,
  `group_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group_calendar`
--

INSERT INTO `group_calendar` (`calendar_ID`, `group_ID`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_ID` int(20) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_ID`, `first_name`, `last_name`, `email`, `pass`) VALUES
(1, 'Ed', 'Mundo', 'edmundo@gmail.com', 'trylangnaman'),
(2, 'Nis', 'Sin', 'nissinwafer@gmail.com', 'trylang123'),
(3, 'Garen', 'Crownguard', 'garenxkata@gmail.com', 'katalangsapatna'),
(4, 'Jarvan', 'Lightshield', 'jarvanshyv@gmail.com', 'shyvdragussy');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `user_ID` int(10) NOT NULL,
  `group_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`user_ID`, `group_ID`) VALUES
(3, 1),
(4, 1),
(1, 2),
(2, 2),
(3, 2),
(3, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_ID`),
  ADD KEY `calendar_ID` (`calendar_ID`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_ID`);

--
-- Indexes for table `group_calendar`
--
ALTER TABLE `group_calendar`
  ADD PRIMARY KEY (`calendar_ID`),
  ADD KEY `group_ID` (`group_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_ID`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD KEY `user_ID` (`user_ID`),
  ADD KEY `group_ID` (`group_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_calendar`
--
ALTER TABLE `group_calendar`
  MODIFY `calendar_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_ID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `cid_FK` FOREIGN KEY (`calendar_ID`) REFERENCES `group_calendar` (`calendar_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_calendar`
--
ALTER TABLE `group_calendar`
  ADD CONSTRAINT `gid_FK` FOREIGN KEY (`group_ID`) REFERENCES `groups` (`group_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `gid_FK_group` FOREIGN KEY (`group_ID`) REFERENCES `groups` (`group_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `uid_FK_users` FOREIGN KEY (`user_ID`) REFERENCES `users` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
