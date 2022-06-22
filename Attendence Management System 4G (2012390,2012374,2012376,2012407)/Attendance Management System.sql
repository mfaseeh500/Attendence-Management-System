-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 22, 2022 at 01:23 PM
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
  `departmentid` int(10) NOT NULL,
  `status` varchar(15) NOT NULL,
  `shiftid` int(10) NOT NULL,
  `Date` varchar(20) NOT NULL,
  PRIMARY KEY (`Attendanceid`),
  UNIQUE KEY `UC_attendance` (`id`,`Date`),
  KEY `attendance_ibfk_2` (`departmentid`),
  KEY `attendance_ibfk_3` (`shiftid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`Attendanceid`, `id`, `departmentid`, `status`, `shiftid`, `Date`) VALUES
(4, 2, 2, 'Leave', 1, '2022-05-29'),
(6, 4, 1, 'Present', 2, '2022-06-22');

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
(2, 'Accounts'),
(3, 'Laboratory'),
(4, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  `AGE` int(2) NOT NULL,
  `GENDER` varchar(20) NOT NULL,
  `DEPARTMENTID` int(4) NOT NULL,
  `DESIGNATION` varchar(25) NOT NULL,
  `SALARY` int(8) NOT NULL,
  `EMAIL` varchar(35) NOT NULL,
  `PHONENUMBER` varchar(15) NOT NULL,
  `DOB` varchar(11) NOT NULL,
  `Shiftid` int(3) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  UNIQUE KEY `PHONENUMBER` (`PHONENUMBER`),
  KEY `employee_ibfk_1` (`DEPARTMENTID`),
  KEY `employee_ibfk_2` (`Shiftid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ID`, `NAME`, `AGE`, `GENDER`, `DEPARTMENTID`, `DESIGNATION`, `SALARY`, `EMAIL`, `PHONENUMBER`, `DOB`, `Shiftid`) VALUES
(2, 'Amaan', 30, 'male', 2, 'Accountant', 30000, 'amaan@gmail.com', '03313655670', '2022-05-29', 1),
(3, 'Shayan', 40, 'male', 4, 'Manager', 70000, 'shayan@gmail.com', '03313785589', '2022-05-30', 1),
(4, 'Faseeh', 19, 'male', 1, 'Manager', 100000, 'mfaseeh500@gmail.com', '03313672287', '2022-06-22', 2),
(7, 'Amaan', 20, 'male', 1, 'Assistant', 100000, 'mfaseeh50@gmail.com', '03202278798', '2022-06-22', 1);

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
  `designation` varchar(30) NOT NULL,
  `salary` int(10) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `SHIFTID` int(3) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `DOL` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employeehistory_ibfk_1` (`departmentid`),
  KEY `SHIFTID` (`SHIFTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employeehistory`
--

INSERT INTO `employeehistory` (`id`, `Name`, `age`, `departmentid`, `designation`, `salary`, `email`, `phonenumber`, `password`, `SHIFTID`, `DOB`, `DOL`) VALUES
(1, 'Faseeh', 30, 4, 'Manager', 40000, 'cfaseeh@gmail.com', '03313672289', 'aeiou123', 1, '2022-05-29', '2022-06-22');

-- --------------------------------------------------------

--
-- Table structure for table `employeelogin`
--

DROP TABLE IF EXISTS `employeelogin`;
CREATE TABLE IF NOT EXISTS `employeelogin` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `Password` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employeelogin`
--

INSERT INTO `employeelogin` (`ID`, `Password`) VALUES
(2, '12345'),
(3, 'abc.123'),
(4, 'Abc.1234'),
(5, 'Abcd12'),
(6, 'Abcd12'),
(7, 'Abcd12');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_attendance`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `employee_attendance`;
CREATE TABLE IF NOT EXISTS `employee_attendance` (
`id` int(10)
,`name` varchar(30)
,`DEPARTMENTID` int(10)
,`departmentname` varchar(25)
,`DESIGNATION` varchar(25)
,`EMAIL` varchar(35)
,`shiftid` int(10)
,`Shiftname` text
,`Shifttiming` varchar(20)
,`status` varchar(15)
,`Date` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_data`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `employee_data`;
CREATE TABLE IF NOT EXISTS `employee_data` (
`ID` int(20)
,`NAME` varchar(30)
,`AGE` int(2)
,`GENDER` varchar(20)
,`DEPARTMENTID` int(4)
,`DEPARTMENTNAME` varchar(25)
,`DESIGNATION` varchar(25)
,`SALARY` int(8)
,`EMAIL` varchar(35)
,`PHONENUMBER` varchar(15)
,`DOB` varchar(11)
,`PASSWORD` varchar(15)
);

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
-- Stand-in structure for view `past_employees`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `past_employees`;
CREATE TABLE IF NOT EXISTS `past_employees` (
`ID` int(20)
,`NAME` varchar(25)
,`AGE` int(3)
,`DEPARTMENTID` int(20)
,`DEPARTMENTNAME` varchar(25)
,`DESIGNATION` varchar(30)
,`SALARY` int(10)
,`EMAIL` varchar(35)
,`PHONENUMBER` varchar(20)
,`PASSWORD` varchar(20)
,`DOB` varchar(10)
,`DOL` varchar(10)
);

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

-- --------------------------------------------------------

--
-- Structure for view `employee_attendance`
--
DROP TABLE IF EXISTS `employee_attendance`;

DROP VIEW IF EXISTS `employee_attendance`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_attendance`  AS  select `attendance`.`id` AS `id`,`employee`.`NAME` AS `name`,`attendance`.`departmentid` AS `DEPARTMENTID`,`department`.`departmentname` AS `departmentname`,`employee`.`DESIGNATION` AS `DESIGNATION`,`employee`.`EMAIL` AS `EMAIL`,`attendance`.`shiftid` AS `shiftid`,`shift`.`Shiftname` AS `Shiftname`,`shift`.`Shifttiming` AS `Shifttiming`,`attendance`.`status` AS `status`,`attendance`.`Date` AS `Date` from (((`attendance` join `employee` on((`employee`.`ID` = `attendance`.`id`))) join `department` on((`attendance`.`departmentid` = `department`.`departmentid`))) join `shift` on((`shift`.`Shiftid` = `attendance`.`shiftid`))) ;

-- --------------------------------------------------------

--
-- Structure for view `employee_data`
--
DROP TABLE IF EXISTS `employee_data`;

DROP VIEW IF EXISTS `employee_data`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_data`  AS  select `employee`.`ID` AS `ID`,`employee`.`NAME` AS `NAME`,`employee`.`AGE` AS `AGE`,`employee`.`GENDER` AS `GENDER`,`employee`.`DEPARTMENTID` AS `DEPARTMENTID`,`department`.`departmentname` AS `DEPARTMENTNAME`,`employee`.`DESIGNATION` AS `DESIGNATION`,`employee`.`SALARY` AS `SALARY`,`employee`.`EMAIL` AS `EMAIL`,`employee`.`PHONENUMBER` AS `PHONENUMBER`,`employee`.`DOB` AS `DOB`,`employeelogin`.`Password` AS `PASSWORD` from ((`employee` join `employeelogin` on((`employee`.`ID` = `employeelogin`.`ID`))) join `department` on((`employee`.`DEPARTMENTID` = `department`.`departmentid`))) ;

-- --------------------------------------------------------

--
-- Structure for view `past_employees`
--
DROP TABLE IF EXISTS `past_employees`;

DROP VIEW IF EXISTS `past_employees`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `past_employees`  AS  select `employeehistory`.`id` AS `ID`,`employeehistory`.`Name` AS `NAME`,`employeehistory`.`age` AS `AGE`,`employeehistory`.`departmentid` AS `DEPARTMENTID`,`department`.`departmentname` AS `DEPARTMENTNAME`,`employeehistory`.`designation` AS `DESIGNATION`,`employeehistory`.`salary` AS `SALARY`,`employeehistory`.`email` AS `EMAIL`,`employeehistory`.`phonenumber` AS `PHONENUMBER`,`employeehistory`.`password` AS `PASSWORD`,`employeehistory`.`DOB` AS `DOB`,`employeehistory`.`DOL` AS `DOL` from (`employeehistory` join `department` on((`employeehistory`.`departmentid` = `department`.`departmentid`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`id`) REFERENCES `employee` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`shiftid`) REFERENCES `shift` (`Shiftid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DEPARTMENTID`) REFERENCES `department` (`departmentid`) ON DELETE NO ACTION,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Shiftid`) REFERENCES `shift` (`Shiftid`) ON DELETE NO ACTION;

--
-- Constraints for table `employeehistory`
--
ALTER TABLE `employeehistory`
  ADD CONSTRAINT `employeehistory_ibfk_1` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`),
  ADD CONSTRAINT `employeehistory_ibfk_2` FOREIGN KEY (`SHIFTID`) REFERENCES `shift` (`Shiftid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
