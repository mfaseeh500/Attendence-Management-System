-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 18, 2022 at 04:51 PM
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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  `AGE` int(2) NOT NULL,
  `DEPARTMENTID` int(4) NOT NULL,
  `DEPARTMENTNAME` varchar(20) NOT NULL,
  `DESIGNATION` varchar(15) NOT NULL,
  `SALARY` int(8) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `PHONENUMBER` varchar(15) NOT NULL,
  `DOB` varchar(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ID`, `NAME`, `AGE`, `DEPARTMENTID`, `DEPARTMENTNAME`, `DESIGNATION`, `SALARY`, `EMAIL`, `PHONENUMBER`, `DOB`) VALUES
(1, 'Faseeh', 23, 50000, 'Human Resources', 'Manager', 50000, 'managerhr@gmail.com', '03313672289', '2022-05-15');

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
  `departmentname` varchar(30) NOT NULL,
  `designation` varchar(25) NOT NULL,
  `salary` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `DOL` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employeehistory`
--

INSERT INTO `employeehistory` (`id`, `Name`, `age`, `departmentid`, `departmentname`, `designation`, `salary`, `email`, `phonenumber`, `password`, `DOB`, `DOL`) VALUES
(2, 'Ali', 20, 2, 'Finance', 'Supervisor', 50000, 'SupervisorFinance@gmail.com', '03222470522', 'aeiou123', 'null', '2022-05-18'),
(3, 'atta', 22, 1, 'Human Resources', 'clerk', 20000, 'clerkHR@gmail.com', '03313879980', 'a123', '2022-05-18', '2022-05-18');

-- --------------------------------------------------------

--
-- Table structure for table `employeelogin`
--

DROP TABLE IF EXISTS `employeelogin`;
CREATE TABLE IF NOT EXISTS `employeelogin` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `Password` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employeelogin`
--

INSERT INTO `employeelogin` (`ID`, `Password`) VALUES
(1, 'abc123');

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
