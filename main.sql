CREATE DATABASE  IF NOT EXISTS `bus_transportation_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bus_transportation_system`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: bus_transportation_system
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `Email_ID` varchar(45) NOT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Account_Create_Date` date DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Passenger_ID` int NOT NULL,
  PRIMARY KEY (`Email_ID`),
  UNIQUE KEY `Email_ID_UNIQUE` (`Email_ID`),
  UNIQUE KEY `Passenger_ID_UNIQUE` (`Passenger_ID`),
  KEY `Passenger_ID_idx` (`Passenger_ID`),
  CONSTRAINT `Passenger_ID` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('chandler.bing@gmail.com','chandler@123','2021-12-01','Active',1),('gunther@gmail.com','gunther@123','2005-02-01','Inactive',7),('joey.tribbiani@gmail.com','joey@123','2021-11-03','Active',2),('monica.geller@gmail.com','monica@123','2021-09-24','Active',5),('phoebe.buffey@gmail.com','phoebe@123','2021-11-18','Active',6),('rachel.green@gmail.com','rachel@123','2022-01-14','Inactive',3),('ross.geller@gmail.com','ross@123','2022-03-06','Active',4);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `Apartment_No` int NOT NULL,
  `Street_Name` varchar(45) NOT NULL,
  `Province` varchar(45) DEFAULT NULL,
  `Postal_Code` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Passenger_ID` int NOT NULL,
  PRIMARY KEY (`Apartment_No`,`Street_Name`),
  UNIQUE KEY `Passenger_ID_UNIQUE` (`Passenger_ID`),
  KEY `Passenger_ID_idx` (`Passenger_ID`),
  CONSTRAINT `P_ID` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (10,'Shipur','Uttarakhand','464547','Najibabad',3),(26,'Gift City','Gujarat','382110','Gandhinagar',7),(125,'Satellite','Gujarat','214146','Ahmedabad',1),(180,'Manpur','Uttarakhand','767572','Lansdowne',2),(245,'Marine Drive','Maharashtra','214058','Mumbai',4),(400,'Ramnagar','Uttarakhand','450008','Najibabad',5),(708,'Vastrapur','Gujarat','218980','Ahmedabad',6);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `Bus_ID` int NOT NULL,
  `License_Plate_No` varchar(45) DEFAULT NULL,
  `Bus_Capacity` int DEFAULT NULL,
  PRIMARY KEY (`Bus_ID`),
  UNIQUE KEY `Bus_ID_UNIQUE` (`Bus_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (101,'ABC123',26),(102,'QWE234',52),(103,'AK34433',15),(104,'PQRS123',26),(105,'MHR2367',52);
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_frequency`
--

DROP TABLE IF EXISTS `bus_frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_frequency` (
  `Route_ID` int NOT NULL,
  `Bus_Frequency` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Route_ID`),
  CONSTRAINT `R1_Route_ID` FOREIGN KEY (`Route_ID`) REFERENCES `route` (`Route_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_frequency`
--

LOCK TABLES `bus_frequency` WRITE;
/*!40000 ALTER TABLE `bus_frequency` DISABLE KEYS */;
INSERT INTO `bus_frequency` VALUES (11,'10'),(12,'15'),(13,'7');
/*!40000 ALTER TABLE `bus_frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_pass`
--

DROP TABLE IF EXISTS `bus_pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_pass` (
  `Pass_ID` int NOT NULL,
  `Expiry_Dt` date DEFAULT NULL,
  `Pass_Type` varchar(45) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  PRIMARY KEY (`Pass_ID`),
  UNIQUE KEY `Pass_ID_UNIQUE` (`Pass_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_pass`
--

LOCK TABLES `bus_pass` WRITE;
/*!40000 ALTER TABLE `bus_pass` DISABLE KEYS */;
INSERT INTO `bus_pass` VALUES (1101,'2022-06-30','Monthly',50),(1102,'2022-06-15','Monthly',50),(1103,'2022-09-01','Quarterly',120),(1104,'2022-08-20','Quarterly',120),(1105,'2022-05-19','Quarterly',120),(1106,'2022-01-26','Monthly',50),(1107,'2022-03-18','Monthly',50);
/*!40000 ALTER TABLE `bus_pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_stop`
--

DROP TABLE IF EXISTS `bus_stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_stop` (
  `Stop_Name` varchar(45) NOT NULL,
  `Stop_Number` int DEFAULT NULL,
  `Stop_Time` time DEFAULT NULL,
  `Route_ID` int NOT NULL,
  `Start_Location` varchar(45) NOT NULL,
  `End_Location` varchar(45) NOT NULL,
  PRIMARY KEY (`Stop_Name`,`Route_ID`,`Start_Location`,`End_Location`),
  KEY `R_St_Loc_idx` (`Start_Location`) /*!80000 INVISIBLE */,
  KEY `R_Route_ID_idx` (`Route_ID`,`Start_Location`,`End_Location`),
  CONSTRAINT `R_Route_ID, R_Start_Loc, R_End_Loc` FOREIGN KEY (`Route_ID`, `Start_Location`, `End_Location`) REFERENCES `route` (`Route_ID`, `Start_Location`, `End_Location`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_stop`
--

LOCK TABLES `bus_stop` WRITE;
/*!40000 ALTER TABLE `bus_stop` DISABLE KEYS */;
INSERT INTO `bus_stop` VALUES ('Botanical Garden',6,'11:45:00',11,'Ahmedabad','Gandhinagar'),('Botanical Garden',2,'16:15:00',11,'Gandhinagar','Ahmedabad'),('Botanical Garden',4,'11:15:00',13,'Bandra Kurla Complex','Marine Drive'),('Botanical Garden',2,'08:00:00',13,'Marine Drive','Bandra Kurla Complex'),('Dadar',2,'08:30:00',13,'Bandra Kurla Complex','Marine Drive'),('Dadar',4,'09:30:00',13,'Marine Drive','Bandra Kurla Complex'),('Gift City',5,'11:30:00',11,'Ahmedabad','Gandhinagar'),('Gift City',3,'16:30:00',11,'Gandhinagar','Ahmedabad'),('Kotdwar',6,'13:00:00',12,'Lansdowne','Najibabad'),('Kotdwar',2,'12:15:00',12,'Najibabad','Lansdowne'),('Sidhbali',5,'14:00:00',12,'Lansdowne','Najibabad'),('Sidhbali',5,'13:30:00',12,'Najibabad','Lansdowne'),('Wadala IMAX',3,'09:00:00',13,'Bandra Kurla Complex','Marine Drive'),('Wadala IMAX',3,'08:45:00',13,'Marine Drive','Bandra Kurla Complex');
/*!40000 ALTER TABLE `bus_stop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_payment`
--

DROP TABLE IF EXISTS `card_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_payment` (
  `Card_Number` varchar(20) NOT NULL,
  `CarHolder_Name` varchar(45) DEFAULT NULL,
  `Expiry_Date` date DEFAULT NULL,
  `Card_Type` varchar(45) DEFAULT NULL,
  `Card_Vendor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Card_Number`),
  UNIQUE KEY `Card_Number_UNIQUE` (`Card_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_payment`
--

LOCK TABLES `card_payment` WRITE;
/*!40000 ALTER TABLE `card_payment` DISABLE KEYS */;
INSERT INTO `card_payment` VALUES ('1234-5678-9888','Joey Tribbiani','2030-11-25','Debit','Visa'),('1256-7845-0977','Gunther Shaw','2024-04-10','Credit','Master'),('2456-1234-7689','Chandler Bing','2040-12-31','Credit','Master'),('3452-8765-0023','Phoebe Buffay','2032-03-14','Credit','Master'),('4545-0809-0022','Monica Geller','2025-12-15','Debit','Visa'),('5677-8999-0033','Rachel Green','2036-07-20','Credit','Master');
/*!40000 ALTER TABLE `card_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `DL_Number` varchar(50) NOT NULL,
  `DL_Class` varchar(45) DEFAULT NULL,
  `DL_Expiry_Dt` date DEFAULT NULL,
  `Emp_ID` int NOT NULL,
  PRIMARY KEY (`DL_Number`),
  UNIQUE KEY `DL_Number_UNIQUE` (`DL_Number`),
  UNIQUE KEY `Emp_ID_UNIQUE` (`Emp_ID`),
  KEY `E_Emp_ID_idx` (`Emp_ID`),
  CONSTRAINT `E_Emp_ID` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES ('GJ123456789','3','2022-08-20',11),('GJ333456789','3','2022-07-31',12),('GJ345456789','2','2030-10-12',13);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drives`
--

DROP TABLE IF EXISTS `drives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drives` (
  `Bus_ID` int NOT NULL,
  `DL_Number` varchar(50) NOT NULL,
  PRIMARY KEY (`Bus_ID`,`DL_Number`),
  UNIQUE KEY `DL_Number_UNIQUE` (`DL_Number`),
  UNIQUE KEY `Bus_ID_UNIQUE` (`Bus_ID`),
  CONSTRAINT `B1_Bus_ID` FOREIGN KEY (`Bus_ID`) REFERENCES `bus` (`Bus_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `D_DL_Number` FOREIGN KEY (`DL_Number`) REFERENCES `driver` (`DL_Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drives`
--

LOCK TABLES `drives` WRITE;
/*!40000 ALTER TABLE `drives` DISABLE KEYS */;
INSERT INTO `drives` VALUES (101,'GJ123456789'),(102,'GJ333456789'),(103,'GJ345456789');
/*!40000 ALTER TABLE `drives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Emp_ID` int NOT NULL,
  `Email_ID` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `First_Name` varchar(45) DEFAULT NULL,
  `Last_Name` varchar(45) DEFAULT NULL,
  `DOJ` date DEFAULT NULL,
  `Phone_No` bigint DEFAULT NULL,
  PRIMARY KEY (`Emp_ID`),
  UNIQUE KEY `Emp_ID_UNIQUE` (`Emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (11,'garywilliam@gmail.com','15 Stepny Place','Gary','William','2018-04-01',9898787670),(12,'tomkarry@gmail.com','6 Hillspring Rd','Tom','Karry','2019-05-03',2378459012),(13,'timothyhanks@gmail.com','35 Grimes Rd','Timothy','Hanks','2015-10-13',2364457966),(14,'paulajones@gmail.com','31 Lathrop Lane','Paula','Jones','2017-06-18',3395652385);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `Passenger_ID` int NOT NULL,
  `First_Name` varchar(45) DEFAULT NULL,
  `Last_Name` varchar(45) DEFAULT NULL,
  `Email_ID` varchar(45) DEFAULT NULL,
  `Phone_No` varchar(10) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`Passenger_ID`),
  UNIQUE KEY `Passenger_ID_UNIQUE` (`Passenger_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Chandler','Bing','chandler.bing@gmail.com','9993334455','1993-02-01'),(2,'Joey','Tribbiani','joey.tribbiani@gmail.com','9993124425','1990-04-12'),(3,'Rachel','Green','rachel.green@gmail.com','9013334435','1995-10-10'),(4,'Ross','Geller','ross.geller@gmail.com','9342670134','1992-04-16'),(5,'Monica','Geller','monica.geller@gmail.com','8237817702','1989-09-25'),(6,'Phoebe','Buffay','phoebe.buffey@gmail.com','9106067791','1992-03-28'),(7,'Gunther','Shaw','gunther.shaw@gmail.com','9673297560','1991-11-23');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `Passenger_ID` int NOT NULL,
  `Pass_ID` int NOT NULL,
  `Card_Number` varchar(20) NOT NULL,
  `Purchase_Date` date DEFAULT NULL,
  PRIMARY KEY (`Pass_ID`,`Passenger_ID`,`Card_Number`),
  UNIQUE KEY `Pass_ID_UNIQUE` (`Pass_ID`),
  KEY `P_Passenger_ID_idx` (`Passenger_ID`),
  KEY `P_Card_Number_idx` (`Card_Number`),
  CONSTRAINT `P_Card_Number` FOREIGN KEY (`Card_Number`) REFERENCES `card_payment` (`Card_Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `P_Pass_ID` FOREIGN KEY (`Pass_ID`) REFERENCES `bus_pass` (`Pass_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `P_Passenger_ID` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,1101,'2456-1234-7689','2022-05-30'),(2,1102,'1234-5678-9888','2022-05-15'),(3,1103,'5677-8999-0033','2022-06-01'),(5,1104,'4545-0809-0022','2022-05-21'),(6,1105,'3452-8765-0023','2022-01-19'),(7,1106,'1256-7845-0977','2021-12-26'),(6,1107,'3452-8765-0023','2022-02-18');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `query_1`
--

DROP TABLE IF EXISTS `query_1`;
/*!50001 DROP VIEW IF EXISTS `query_1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `query_1` AS SELECT 
 1 AS `Route_ID`,
 1 AS `Stop_Name`,
 1 AS `Stop_Number`,
 1 AS `Stop_Time`,
 1 AS `Start_Location`,
 1 AS `Start_Time`,
 1 AS `End_Location`,
 1 AS `End_Time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_2`
--

DROP TABLE IF EXISTS `query_2`;
/*!50001 DROP VIEW IF EXISTS `query_2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `query_2` AS SELECT 
 1 AS `Route_ID`,
 1 AS `Start_Location`,
 1 AS `End_Location`,
 1 AS `Stop_Name`,
 1 AS `Stop_Number`,
 1 AS `Stop_Time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_3`
--

DROP TABLE IF EXISTS `query_3`;
/*!50001 DROP VIEW IF EXISTS `query_3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `query_3` AS SELECT 
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `Email_ID`,
 1 AS `Phone_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_4`
--

DROP TABLE IF EXISTS `query_4`;
/*!50001 DROP VIEW IF EXISTS `query_4`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `query_4` AS SELECT 
 1 AS `Quarterly Purchase Details`,
 1 AS `Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_5`
--

DROP TABLE IF EXISTS `query_5`;
/*!50001 DROP VIEW IF EXISTS `query_5`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `query_5` AS SELECT 
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `Card_Number`,
 1 AS `Purchase_Date`,
 1 AS `Card_Vendor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_6`
--

DROP TABLE IF EXISTS `query_6`;
/*!50001 DROP VIEW IF EXISTS `query_6`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `query_6` AS SELECT 
 1 AS `Pass_Type`,
 1 AS `Annual Revenue Amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_7`
--

DROP TABLE IF EXISTS `query_7`;
/*!50001 DROP VIEW IF EXISTS `query_7`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `query_7` AS SELECT 
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `DL_Number`,
 1 AS `DL_Expiry_Dt`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `Route_ID` int NOT NULL,
  `Start_Location` varchar(45) NOT NULL,
  `End_Location` varchar(45) NOT NULL,
  `Start_Time` time DEFAULT NULL,
  `End_Time` time DEFAULT NULL,
  `Bus_ID` int DEFAULT NULL,
  PRIMARY KEY (`Route_ID`,`Start_Location`,`End_Location`),
  KEY `B_Bus_ID_idx` (`Bus_ID`),
  CONSTRAINT `B_Bus_ID` FOREIGN KEY (`Bus_ID`) REFERENCES `bus` (`Bus_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (11,'Ahmedabad','Gandhinagar','07:00:00','20:00:00',101),(11,'Gandhinagar','Ahmedabad','08:00:00','21:00:00',101),(12,'Lansdowne','Najibabad','09:00:00','22:00:00',104),(12,'Najibabad','Lansdowne','11:00:00','19:00:00',102),(13,'Bandra Kurla Complex','Marine Drive','08:00:00','23:00:00',105),(13,'Marine Drive','Bandra Kurla Complex','07:30:00','22:30:00',103);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uses`
--

DROP TABLE IF EXISTS `uses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uses` (
  `Bus_ID` int NOT NULL,
  `Passenger_ID` int NOT NULL,
  `Travel_Date` date DEFAULT NULL,
  PRIMARY KEY (`Bus_ID`,`Passenger_ID`),
  KEY `P2_Passenger_ID_idx` (`Passenger_ID`),
  CONSTRAINT `B2_Bus_ID` FOREIGN KEY (`Bus_ID`) REFERENCES `bus` (`Bus_ID`),
  CONSTRAINT `P2_Passenger_ID` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uses`
--

LOCK TABLES `uses` WRITE;
/*!40000 ALTER TABLE `uses` DISABLE KEYS */;
INSERT INTO `uses` VALUES (101,1,'2022-03-17'),(102,3,'2021-12-22'),(103,7,'2022-06-18'),(104,4,'2022-05-13'),(105,5,'2022-04-25');
/*!40000 ALTER TABLE `uses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `query_1`
--

/*!50001 DROP VIEW IF EXISTS `query_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_1` AS select `r`.`Route_ID` AS `Route_ID`,`b`.`Stop_Name` AS `Stop_Name`,`b`.`Stop_Number` AS `Stop_Number`,`b`.`Stop_Time` AS `Stop_Time`,`r`.`Start_Location` AS `Start_Location`,`r`.`Start_Time` AS `Start_Time`,`r`.`End_Location` AS `End_Location`,`r`.`End_Time` AS `End_Time` from (`route` `r` join `bus_stop` `b` on(((`r`.`Route_ID` = `b`.`Route_ID`) and (`r`.`Start_Location` = `b`.`Start_Location`) and (`r`.`End_Location` = `b`.`End_Location`)))) where ((`b`.`Stop_Name` = 'Botanical Garden') and (`b`.`Stop_Time` >= '08:00:00') and (`b`.`Stop_Time` <= '12:00:00')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_2`
--

/*!50001 DROP VIEW IF EXISTS `query_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_2` AS select `r`.`Route_ID` AS `Route_ID`,`r`.`Start_Location` AS `Start_Location`,`r`.`End_Location` AS `End_Location`,`b`.`Stop_Name` AS `Stop_Name`,`b`.`Stop_Number` AS `Stop_Number`,`b`.`Stop_Time` AS `Stop_Time` from (`route` `r` join `bus_stop` `b` on(((`r`.`Route_ID` = `b`.`Route_ID`) and (`r`.`Start_Location` = `b`.`Start_Location`) and (`r`.`End_Location` = `b`.`End_Location`)))) where (`r`.`Route_ID` = 13) order by `r`.`Start_Location`,`b`.`Stop_Number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_3`
--

/*!50001 DROP VIEW IF EXISTS `query_3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_3` AS select `p`.`First_Name` AS `First_Name`,`p`.`Last_Name` AS `Last_Name`,`p`.`Email_ID` AS `Email_ID`,`p`.`Phone_No` AS `Phone_no` from (`passenger` `p` join `address` `a` on((`p`.`Passenger_ID` = `a`.`Passenger_ID`))) where (`a`.`City` = 'Ahmedabad') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_4`
--

/*!50001 DROP VIEW IF EXISTS `query_4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_4` AS select `b`.`Pass_Type` AS `Quarterly Purchase Details`,count(`b`.`Pass_Type`) AS `Count` from (`bus_pass` `b` join `purchase` `p` on((`b`.`Pass_ID` = `p`.`Pass_ID`))) where (`p`.`Purchase_Date` >= '2022-03-01') group by `b`.`Pass_Type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_5`
--

/*!50001 DROP VIEW IF EXISTS `query_5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_5` AS select `p`.`First_Name` AS `First_Name`,`p`.`Last_Name` AS `Last_Name`,`c`.`Card_Number` AS `Card_Number`,`pr`.`Purchase_Date` AS `Purchase_Date`,`c`.`Card_Vendor` AS `Card_Vendor` from (((`purchase` `pr` join `passenger` `p` on((`p`.`Passenger_ID` = `pr`.`Passenger_ID`))) join `bus_pass` `b` on((`b`.`Pass_ID` = `pr`.`Pass_ID`))) join `card_payment` `c` on(((`c`.`Card_Number` = `pr`.`Card_Number`) and (`pr`.`Purchase_Date` >= '2021-12-01') and (`c`.`Card_Type` = 'Credit') and (`b`.`Pass_Type` = 'Monthly')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_6`
--

/*!50001 DROP VIEW IF EXISTS `query_6`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_6` AS select `b`.`Pass_Type` AS `Pass_Type`,sum(`b`.`Price`) AS `Annual Revenue Amount` from (`bus_pass` `b` join `purchase` `p` on((`b`.`Pass_ID` = `p`.`Pass_ID`))) where (`p`.`Purchase_Date` >= '2021-06-01') group by `b`.`Pass_Type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_7`
--

/*!50001 DROP VIEW IF EXISTS `query_7`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_7` AS select `e`.`First_Name` AS `First_Name`,`e`.`Last_Name` AS `Last_Name`,`d`.`DL_Number` AS `DL_Number`,`d`.`DL_Expiry_Dt` AS `DL_Expiry_Dt` from (`driver` `d` join `employee` `e` on((`e`.`Emp_ID` = `d`.`Emp_ID`))) where ((`d`.`DL_Expiry_Dt` >= '2022-06-01') and (`d`.`DL_Expiry_Dt` <= '2022-09-01')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-10 23:18:15
