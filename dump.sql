-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: walletic
-- ------------------------------------------------------
-- Server version	8.0.27

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
  `account_id` int NOT NULL AUTO_INCREMENT,
  `user_id_fk` int DEFAULT NULL,
  `balance` int DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `user_id_fk` (`user_id_fk`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`user_id_fk`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,1,3950),(2,2,4000),(3,3,4200),(4,4,50),(5,5,50);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `bank_account_id` int NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(200) DEFAULT NULL,
  `balance` int DEFAULT NULL,
  PRIMARY KEY (`bank_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,'Meezan Bank',2150),(2,'Meezan Bank',6300),(3,'United Bank Limited',15750),(4,'National Bank of Pakistan',99800);
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p2ptransaction`
--

DROP TABLE IF EXISTS `p2ptransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p2ptransaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `reciver_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `reciver_id` (`reciver_id`),
  CONSTRAINT `p2ptransaction_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `p2ptransaction_ibfk_2` FOREIGN KEY (`reciver_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p2ptransaction`
--

LOCK TABLES `p2ptransaction` WRITE;
/*!40000 ALTER TABLE `p2ptransaction` DISABLE KEYS */;
INSERT INTO `p2ptransaction` VALUES (1,1,2,200),(2,2,1,500);
/*!40000 ALTER TABLE `p2ptransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `typeOfTransaction` varchar(45) DEFAULT NULL,
  `amount` int NOT NULL,
  `walletic_account_id` int DEFAULT NULL,
  `bank_account_id_fk` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `walletic_account_id` (`walletic_account_id`),
  KEY `bank_account_id_fk` (`bank_account_id_fk`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`walletic_account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`bank_account_id_fk`) REFERENCES `banks` (`bank_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'withdraw',500,1,2),(2,'withdraw',200,3,3),(3,'withdraw',200,3,3),(4,'withdraw',200,3,3),(5,'withdraw',200,3,3),(6,'withdraw',200,3,3),(7,'withdraw',200,3,3),(8,'withdraw',200,3,3),(9,'withdraw',200,3,3),(10,'withdraw',200,3,3),(11,'withdraw',200,3,3),(12,'withdraw',200,3,3),(13,'withdraw',200,3,3),(14,'withdraw',200,3,3),(15,'withdraw',50,3,3),(16,'withdraw',50,3,3),(17,'withdraw',50,2,3),(18,'withdraw',50,2,3),(19,'withdraw',50,2,3),(20,'withdraw',50,2,3),(21,'withdraw',50,2,3),(22,'withdraw',50,2,3),(23,'deposit',50,2,3),(24,'deposit',50,2,3),(25,'deposit',50,2,3),(26,'deposit',50,2,3),(27,'deposit',50,2,3),(28,'deposit',50,2,3),(29,'deposit',50,2,3),(30,'withdraw',50,3,1),(31,'withdraw',50,1,1),(32,'withdraw',50,1,1),(33,'deposit',100,3,4),(34,'deposit',100,3,4);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `phoneNo` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Abdul Samad','3332176508','samad@gmail.com','1234567','business'),(2,'Abdul Rafay','3358477685','rafay@gmail.com','4345666','business'),(3,'Mudassir Nadeem','3332176508','mudassir@gmail.com','1234567','consumer'),(4,'fidda','3332176506','fidda@gmail.com','$2b$10$EC1m3AtkWYMOp2TGAitdYu/dhmL8bDDdKc1ZkgAr8espJjnp7UUhe','business'),(5,'kashan','3332176502','kashan@gmail.com','$2b$10$Nqc1CW5c9n87xpCPOME6Get57Wy5ZgXbTpemYd6EUAK/cQz0IqTy.','business');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-09 19:05:52
