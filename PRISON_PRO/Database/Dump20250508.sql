-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: prisondb
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminID` int NOT NULL,
  `aPhoneNum` varchar(10) DEFAULT NULL,
  `aEmail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminID`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `users` (`IDNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmate`
--

DROP TABLE IF EXISTS `inmate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inmate` (
  `inmateID` int NOT NULL,
  `cellNumber` int DEFAULT NULL,
  PRIMARY KEY (`inmateID`),
  CONSTRAINT `inmate_ibfk_1` FOREIGN KEY (`inmateID`) REFERENCES `users` (`IDNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmate`
--

LOCK TABLES `inmate` WRITE;
/*!40000 ALTER TABLE `inmate` DISABLE KEYS */;
/*!40000 ALTER TABLE `inmate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `invID` int NOT NULL,
  `invName` varchar(50) DEFAULT NULL,
  `invType` varchar(50) DEFAULT NULL,
  `invQty` int DEFAULT NULL,
  `IDNum` int DEFAULT NULL,
  PRIMARY KEY (`invID`),
  KEY `IDNum` (`IDNum`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`IDNum`) REFERENCES `users` (`IDNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `mID` int NOT NULL,
  `mMessage` text,
  `mDate` date DEFAULT NULL,
  PRIMARY KEY (`mID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nextofkin`
--

DROP TABLE IF EXISTS `nextofkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nextofkin` (
  `kinID` int NOT NULL,
  `nPhoneNum` varchar(10) DEFAULT NULL,
  `nEmail` varchar(50) DEFAULT NULL,
  `nRelationship` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kinID`),
  CONSTRAINT `nextofkin_ibfk_1` FOREIGN KEY (`kinID`) REFERENCES `users` (`IDNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nextofkin`
--

LOCK TABLES `nextofkin` WRITE;
/*!40000 ALTER TABLE `nextofkin` DISABLE KEYS */;
/*!40000 ALTER TABLE `nextofkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `rID` int NOT NULL,
  `rMessage` text,
  `rStatus` varchar(1) DEFAULT NULL,
  `rDate` date DEFAULT NULL,
  PRIMARY KEY (`rID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestusers`
--

DROP TABLE IF EXISTS `requestusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requestusers` (
  `rID` int NOT NULL,
  `IDNum` int NOT NULL,
  PRIMARY KEY (`rID`,`IDNum`),
  KEY `IDNum` (`IDNum`),
  CONSTRAINT `requestusers_ibfk_1` FOREIGN KEY (`rID`) REFERENCES `request` (`rID`),
  CONSTRAINT `requestusers_ibfk_2` FOREIGN KEY (`IDNum`) REFERENCES `users` (`IDNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestusers`
--

LOCK TABLES `requestusers` WRITE;
/*!40000 ALTER TABLE `requestusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `requestusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `IDNum` int NOT NULL,
  `uName` varchar(50) DEFAULT NULL,
  `uSurname` varchar(50) DEFAULT NULL,
  `uAddress` varchar(100) DEFAULT NULL,
  `uGender` varchar(1) DEFAULT NULL,
  `uTitle` varchar(5) DEFAULT NULL,
  `uUsername` varchar(50) DEFAULT NULL,
  `uPassword` varchar(50) DEFAULT NULL,
  `uRole` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersmessage`
--

DROP TABLE IF EXISTS `usersmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersmessage` (
  `mID` int NOT NULL,
  `IDNum` int NOT NULL,
  PRIMARY KEY (`mID`,`IDNum`),
  KEY `IDNum` (`IDNum`),
  CONSTRAINT `usersmessage_ibfk_1` FOREIGN KEY (`mID`) REFERENCES `message` (`mID`),
  CONSTRAINT `usersmessage_ibfk_2` FOREIGN KEY (`IDNum`) REFERENCES `users` (`IDNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersmessage`
--

LOCK TABLES `usersmessage` WRITE;
/*!40000 ALTER TABLE `usersmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitation`
--

DROP TABLE IF EXISTS `visitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitation` (
  `date` date NOT NULL,
  `kinID` int NOT NULL,
  `inmateID` int NOT NULL,
  PRIMARY KEY (`date`,`kinID`,`inmateID`),
  KEY `kinID` (`kinID`),
  KEY `inmateID` (`inmateID`),
  CONSTRAINT `visitation_ibfk_1` FOREIGN KEY (`kinID`) REFERENCES `nextofkin` (`kinID`),
  CONSTRAINT `visitation_ibfk_2` FOREIGN KEY (`inmateID`) REFERENCES `inmate` (`inmateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitation`
--

LOCK TABLES `visitation` WRITE;
/*!40000 ALTER TABLE `visitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'prisondb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-08 22:24:05
