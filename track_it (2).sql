-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 22, 2022 at 08:16 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `track it`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `Attendanceid` int(10) NOT NULL AUTO_INCREMENT,
  `id` int(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `designation` varchar(25) NOT NULL,
  `email` varchar(30) NOT NULL,
  `status` varchar(15) NOT NULL,
  `shiftid` int(10) NOT NULL,
  `Date` varchar(20) NOT NULL,
  PRIMARY KEY (`Attendanceid`),
  UNIQUE KEY `UC_attendance` (`id`,`Date`),
  KEY `departmentid` (`departmentid`),
  KEY `shiftid` (`shiftid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`Attendanceid`, `id`, `name`, `departmentid`, `designation`, `email`, `status`, `shiftid`, `Date`) VALUES
(1, 1, 'Faseeh', 1, 'Manager', 'cfaseeh@gmail.com', 'Absent', 1, '2022-05-22'),
(2, 1, 'Faseeh', 1, 'Manager', 'cfaseeh@gmail.com', 'Present', 2, '2022-05-23'),
(4, 2, 'Ali Zafar', 1, 'Supervisor', 'Alizafar@gmail.com', 'Present', 2, '2022-05-23');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `departmentid` int(10) NOT NULL,
  `departmentname` varchar(25) NOT NULL,
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentid`, `departmentname`) VALUES
(1, 'Human Resources'),
(2, 'Accounts');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  `AGE` int(2) NOT NULL,
  `DEPARTMENTID` int(4) NOT NULL,
  `DESIGNATION` varchar(15) NOT NULL,
  `SALARY` int(8) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `PHONENUMBER` varchar(15) NOT NULL,
  `DOB` varchar(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `employee_ibfk_1` (`DEPARTMENTID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ID`, `NAME`, `AGE`, `DEPARTMENTID`, `DESIGNATION`, `SALARY`, `EMAIL`, `PHONENUMBER`, `DOB`) VALUES
(1, 'Faseeh', 25, 1, 'Manager', 60000, 'cfaseeh@gmail.com', '03313672289', '2022-05-20'),
(2, 'Ali Zafar', 23, 1, 'Supervisor', 45000, 'Alizafar@gmail.com', '03347837789', '2022-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `employeehistory`
--

DROP TABLE IF EXISTS `employeehistory`;
CREATE TABLE IF NOT EXISTS `employeehistory` (
  `id` int(20) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `age` int(3) NOT NULL,
  `departmentid` int(20) NOT NULL,
  `designation` varchar(25) NOT NULL,
  `salary` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `DOL` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employeehistory_ibfk_1` (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employeelogin`
--

DROP TABLE IF EXISTS `employeelogin`;
CREATE TABLE IF NOT EXISTS `employeelogin` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `Password` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employeelogin`
--

INSERT INTO `employeelogin` (`ID`, `Password`) VALUES
(1, 'abc.123'),
(2, 'aeiou123');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('admin', 'aeiou123');

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
CREATE TABLE IF NOT EXISTS `shift` (
  `Shiftid` int(10) NOT NULL,
  `Shiftname` text NOT NULL,
  `Shifttiming` varchar(20) NOT NULL,
  PRIMARY KEY (`Shiftid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`Shiftid`, `Shiftname`, `Shifttiming`) VALUES
(1, 'Morning', '9:00 am - 5:00 pm'),
(2, 'Evening', '12:00 pm - 8:00 pm');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`id`) REFERENCES `employee` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`),
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`shiftid`) REFERENCES `shift` (`Shiftid`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DEPARTMENTID`) REFERENCES `department` (`departmentid`);

--
-- Constraints for table `employeehistory`
--
ALTER TABLE `employeehistory`
  ADD CONSTRAINT `employeehistory_ibfk_1` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`);

--
-- Constraints for table `employeelogin`
--
ALTER TABLE `employeelogin`
  ADD CONSTRAINT `employeelogin_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `employee` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
