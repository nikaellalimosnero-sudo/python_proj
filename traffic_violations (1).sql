-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2025 at 11:09 PM
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
-- Database: `traffic_violation`
--

-- --------------------------------------------------------

--
-- Table structure for table `traffic_violations`
--

CREATE TABLE `traffic_violations` (
  `id` int(11) NOT NULL,
  `PlateNumber` varchar(20) DEFAULT NULL,
  `DriverName` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Belts` varchar(10) DEFAULT NULL,
  `Personal_Injury` varchar(10) DEFAULT NULL,
  `Property_Damage` varchar(10) DEFAULT NULL,
  `Commercial_License` varchar(10) DEFAULT NULL,
  `Commercial_Vehicle` varchar(10) DEFAULT NULL,
  `State` varchar(10) DEFAULT NULL,
  `VehicleType` varchar(50) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Make` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `Charge` varchar(50) DEFAULT NULL,
  `PenaltyAmount` decimal(10,2) DEFAULT NULL,
  `Contributed_To_Accident` varchar(10) DEFAULT NULL,
  `Race` varchar(50) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Driver_City` varchar(100) DEFAULT NULL,
  `Driver_State` varchar(10) DEFAULT NULL,
  `DL_State` varchar(10) DEFAULT NULL,
  `Arrest_Type` varchar(50) DEFAULT NULL,
  `Violation_Type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `traffic_violations`
--

INSERT INTO `traffic_violations` (`id`, `PlateNumber`, `DriverName`, `Description`, `Belts`, `Personal_Injury`, `Property_Damage`, `Commercial_License`, `Commercial_Vehicle`, `State`, `VehicleType`, `Year`, `Make`, `Model`, `Color`, `Charge`, `PenaltyAmount`, `Contributed_To_Accident`, `Race`, `Gender`, `Driver_City`, `Driver_State`, `DL_State`, `Arrest_Type`, `Violation_Type`) VALUES
(1, 'ABC1234', 'Driver_1', 'DISPLAYING EXPIRED REGISTRATION PLATE ISSUED BY STATE', 'No', 'No', 'No', 'No', 'No', 'NC', 'Automobile', 2013, 'HYUNDAI', 'ELANTRA', 'GRAY', '13411f', 2500.00, 'No', 'WHITE', 'F', 'ASHEVILLE', 'NC', 'NC', 'A - Marked Patrol', 'Citation'),
(2, 'ABC5678', 'Driver_2', 'DRIVER FAIL TO STOP AT RED TRAFFIC SIGNAL', 'No', 'No', 'No', 'No', 'No', 'MD', 'Automobile', 2015, 'FORD', 'FOCUS', 'SILVER', '21202i1', 1800.00, 'No', 'OTHER', 'M', 'SILVER SPRING', 'MD', 'MD', 'A - Marked Patrol', 'Citation'),
(3, 'ABC9012', 'Driver_3', 'DRIVING UNDER THE INFLUENCE OF ALCOHOL PER SE', 'No', 'No', 'No', 'No', 'No', 'MD', 'Automobile', 2000, 'TOYOTA', 'COROLLA', 'BLACK', '21902a2', 3200.00, 'No', 'BLACK', 'M', 'SILVER SPRING', 'MD', 'MD', 'B - Unmarked Patrol', 'Citation'),
(4, 'ABC4321', 'Driver_4', 'PERSON DRIVING MOTOR VEHICLE WITHOUT LICENSE', 'No', 'No', 'No', 'No', 'No', 'MD', 'Automobile', 2012, 'HONDA', 'CIVIC', 'BLACK', '16303c', 4000.00, 'No', 'BLACK', 'M', 'COLUMBIA', 'MD', 'MD', 'A - Marked Patrol', 'Citation'),
(5, 'ABC8765', 'Driver_5', 'DISPLAYING EXPIRED REGISTRATION PLATE', 'No', 'No', 'No', 'Yes', 'No', 'MD', 'Automobile', 2010, 'FORD', 'ESCAPE', 'BLACK', '13411f', 2100.00, 'No', 'WHITE', 'M', 'MOUNT AIRY', 'MD', 'MD', 'A - Marked Patrol', 'Citation'),
(6, 'ABC1357', 'Driver_6', 'FAILURE TO YIELD RIGHT OF WAY', 'No', 'No', 'Yes', 'No', 'No', 'MD', 'Automobile', 2008, 'NISSAN', 'ALTIMA', 'RED', '20802b', 3600.00, 'No', 'ASIAN', 'F', 'ROCKVILLE', 'MD', 'MD', 'A - Marked Patrol', 'Citation'),
(7, 'ABC2468', 'Driver_7', 'DRIVING WITHOUT PROPER EQUIPMENT', 'No', 'No', 'No', 'No', 'No', 'VA', 'Automobile', 2009, 'CHEVROLET', 'MALIBU', 'WHITE', '14503d', 1400.00, 'No', 'HISPANIC', 'M', 'FAIRFAX', 'VA', 'VA', 'C - State Trooper', 'Citation'),
(8, 'ABC3690', 'Driver_8', 'FAILURE TO STOP AT STOP SIGN', 'No', 'No', 'No', 'No', 'No', 'DC', 'Automobile', 2011, 'KIA', 'RIO', 'BLUE', '20501e', 2700.00, 'No', 'WHITE', 'F', 'WASHINGTON', 'DC', 'DC', 'A - Marked Patrol', 'Citation'),
(9, 'ABC1122', 'Driver_9', 'EXCEEDING SPEED LIMIT BY 20 MPH', 'No', 'No', 'Yes', 'No', 'No', 'MD', 'Automobile', 2017, 'HYUNDAI', 'SONATA', 'GRAY', '22005f', 3300.00, 'Yes', 'BLACK', 'M', 'BALTIMORE', 'MD', 'MD', 'B - Unmarked Patrol', 'Citation'),
(10, 'ABC3344', 'Driver_10', 'IMPROPER LANE CHANGE', 'No', 'No', 'No', 'No', 'No', 'MD', 'Automobile', 2014, 'FORD', 'FUSION', 'WHITE', '19807g', 1500.00, 'No', 'WHITE', 'F', 'SILVER SPRING', 'MD', 'MD', 'A - Marked Patrol', 'Citation'),
(11, 'ABC5566', 'Driver_11', 'DRIVING WITHOUT HEADLIGHTS AT NIGHT', 'No', 'No', 'No', 'No', 'No', 'NC', 'Automobile', 2005, 'TOYOTA', 'CAMRY', 'BLACK', '13009h', 2800.00, 'No', 'ASIAN', 'M', 'CHARLOTTE', 'NC', 'NC', 'C - State Trooper', 'Citation'),
(12, 'ABC7788', 'Driver_12', 'FAILURE TO SIGNAL WHILE TURNING', 'No', 'No', 'No', 'No', 'No', 'MD', 'Automobile', 2006, 'HONDA', 'ACCORD', 'BLUE', '20904i', 1600.00, 'No', 'WHITE', 'F', 'GAITHERSBURG', 'MD', 'MD', 'A - Marked Patrol', 'Citation'),
(13, 'ABC9900', 'Driver_13', 'DRIVING UNDER THE INFLUENCE', 'No', 'Yes', 'Yes', 'No', 'No', 'MD', 'Automobile', 2003, 'CHEVROLET', 'IMPALA', 'RED', '21905j', 4800.00, 'Yes', 'BLACK', 'M', 'BALTIMORE', 'MD', 'MD', 'B - Unmarked Patrol', 'Citation'),
(14, 'ABC2233', 'Driver_14', 'OPERATING UNREGISTERED VEHICLE', 'No', 'No', 'No', 'Yes', 'No', 'MD', 'Automobile', 2001, 'FORD', 'FOCUS', 'WHITE', '13411f', 1200.00, 'No', 'HISPANIC', 'M', 'ROCKVILLE', 'MD', 'MD', 'A - Marked Patrol', 'Citation'),
(15, 'ABC4455', 'Driver_15', 'FAILURE TO OBEY TRAFFIC CONTROL DEVICE', 'No', 'No', 'No', 'No', 'No', 'VA', 'Automobile', 2016, 'NISSAN', 'SENTRA', 'BLACK', '21202i1', 1900.00, 'No', 'WHITE', 'F', 'ARLINGTON', 'VA', 'VA', 'C - State Trooper', 'Citation'),
(16, 'ABC6677', 'Driver_16', 'IMPROPER TURN AT INTERSECTION', 'No', 'No', 'No', 'No', 'No', 'DC', 'Automobile', 2007, 'HYUNDAI', 'ELANTRA', 'SILVER', '20907k', 1750.00, 'No', 'OTHER', 'M', 'WASHINGTON', 'DC', 'DC', 'A - Marked Patrol', 'Citation'),
(17, 'ABC8899', 'Driver_17', 'DRIVING WITHOUT SEATBELT', 'Yes', 'No', 'No', 'No', 'No', 'MD', 'Automobile', 2018, 'FORD', 'ESCAPE', 'BLUE', '15008l', 1000.00, 'No', 'BLACK', 'M', 'SILVER SPRING', 'MD', 'MD', 'A - Marked Patrol', 'Citation'),
(18, 'ABC1212', 'Driver_18', 'FAILURE TO MAINTAIN SAFE DISTANCE', 'No', 'No', 'Yes', 'No', 'No', 'MD', 'Automobile', 2012, 'TOYOTA', 'PRIUS', 'GREEN', '20004m', 2600.00, 'Yes', 'ASIAN', 'F', 'BETHESDA', 'MD', 'MD', 'B - Unmarked Patrol', 'Citation'),
(19, 'ABC3434', 'Driver_19', 'IMPROPER BACKING OF VEHICLE', 'No', 'No', 'Yes', 'No', 'No', 'MD', 'Automobile', 2010, 'HONDA', 'CIVIC', 'BLACK', '20705n', 2300.00, 'No', 'WHITE', 'F', 'COLUMBIA', 'MD', 'MD', 'A - Marked Patrol', 'Citation'),
(20, 'ABC5656', 'Driver_20', 'FAILURE TO STOP FOR SCHOOL BUS', 'No', 'No', 'No', 'No', 'No', 'VA', 'Automobile', 2015, 'NISSAN', 'ALTIMA', 'WHITE', '22106o', 4200.00, 'No', 'HISPANIC', 'M', 'FAIRFAX', 'VA', 'VA', 'C - State Trooper', 'Citation'),
(21, 'ABC7878', 'Driver_21', 'OPERATING VEHICLE WITH SUSPENDED LICENSE', 'No', 'No', 'No', 'No', 'No', 'MD', 'Automobile', 2004, 'TOYOTA', 'COROLLA', 'RED', '13411p', 3500.00, 'No', 'BLACK', 'M', 'BALTIMORE', 'MD', 'MD', 'B - Unmarked Patrol', 'Citation'),
(22, 'ABC9090', 'Driver_22', 'DRIVING WITHOUT INSURANCE', 'No', 'No', 'No', 'No', 'No', 'MD', 'Automobile', 2002, 'FORD', 'TAURUS', 'BLUE', '14009q', 2950.00, 'No', 'WHITE', 'F', 'ROCKVILLE', 'MD', 'MD', 'A - Marked Patrol', 'Citation'),
(23, 'ABC1414', 'Driver_23', 'DRIVING WITHOUT VALID REGISTRATION', 'No', 'No', 'No', 'No', 'No', 'MD', 'Automobile', 2013, 'HYUNDAI', 'SONATA', 'BLACK', '13411f', 1100.00, 'No', 'ASIAN', 'M', 'SILVER SPRING', 'MD', 'MD', 'A - Marked Patrol', 'Citation'),
(24, 'ABC3636', 'Driver_24', 'FAILURE TO YIELD TO PEDESTRIAN', 'YES', 'No', 'Yes', 'No', 'No', 'DC', 'Automobile', 2016, 'HONDA', 'CIVIC', 'GRAY', '20802r', 2850.00, 'Yes', 'WHITE', 'F', 'WASHINGTON', 'DC', 'DC', 'A - Marked Patrol', 'Citation');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `traffic_violations`
--
ALTER TABLE `traffic_violations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `traffic_violations`
--
ALTER TABLE `traffic_violations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
