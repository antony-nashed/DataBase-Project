-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: tony
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int NOT NULL,
  `trainer_id` int DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `schedule` varchar(100) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `trainer_id` (`trainer_id`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (201,101,'Morning Bootcamp','Mon/Wed/Fri 6:00 AM',20),(202,102,'Yoga Flow','Tue/Thu 7:00 AM',15),(203,103,'Strength Training','Mon/Wed 5:30 PM',12),(204,104,'Pilates Core','Tue/Thu 6:00 PM',10),(205,105,'Spin Class','Mon/Wed/Fri 7:30 AM',15),(206,106,'Zumba Party','Fri 6:00 PM',25),(207,107,'CrossFit WOD','Tue/Thu/Sat 8:00 AM',10),(208,108,'Beginner Yoga','Sat 9:00 AM',12),(209,109,'Senior Fitness','Mon/Wed/Fri 10:00 AM',15),(210,110,'Aqua Aerobics','Tue/Thu 11:00 AM',12),(211,111,'Boxing Basics','Mon/Wed 7:00 PM',8),(212,112,'Nutrition Workshop','Sat 11:00 AM',30);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_sessions`
--

DROP TABLE IF EXISTS `class_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_sessions` (
  `start_time` time NOT NULL,
  `class_id` int NOT NULL,
  `session_date` date NOT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`start_time`,`class_id`,`session_date`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `class_sessions_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_sessions`
--

LOCK TABLES `class_sessions` WRITE;
/*!40000 ALTER TABLE `class_sessions` DISABLE KEYS */;
INSERT INTO `class_sessions` VALUES ('06:00:00',201,'2023-11-01','07:00:00'),('06:00:00',201,'2023-11-08','07:00:00'),('07:00:00',202,'2023-11-02','08:00:00'),('07:00:00',202,'2023-11-09','08:00:00'),('07:30:00',205,'2023-11-03','08:30:00'),('08:00:00',207,'2023-11-04','09:00:00'),('09:00:00',208,'2023-11-04','10:00:00'),('10:00:00',209,'2023-11-05','11:00:00'),('11:00:00',210,'2023-11-05','12:00:00'),('11:00:00',212,'2023-11-06','12:30:00'),('17:30:00',203,'2023-11-01','18:30:00'),('17:30:00',203,'2023-11-08','18:30:00'),('18:00:00',204,'2023-11-02','19:00:00'),('18:00:00',206,'2023-11-03','19:00:00'),('19:00:00',211,'2023-11-06','20:00:00');
/*!40000 ALTER TABLE `class_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `gender` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'John Smith','1990-05-15','Male'),(2,'Emily Johnson','1985-08-22','Female'),(3,'Michael Brown','1992-03-10','Male'),(4,'Sarah Davis','1988-11-30','Female'),(5,'David Wilson','1995-07-18','Male'),(6,'Jennifer Miller','1991-02-25','Female'),(7,'Robert Taylor','1987-09-12','Male'),(8,'Jessica Anderson','1993-06-08','Female'),(9,'William Thomas','1989-04-17','Male'),(10,'Amanda Martinez','1994-01-20','Female'),(11,'Daniel Jackson','1996-12-05','Male'),(12,'Lisa White','1986-10-15','Female');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_book_class`
--

DROP TABLE IF EXISTS `member_book_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_book_class` (
  `member_id` int NOT NULL,
  `class_id` int NOT NULL,
  `booking_date` date DEFAULT NULL,
  PRIMARY KEY (`member_id`,`class_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `member_book_class_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `member_book_class_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_book_class`
--

LOCK TABLES `member_book_class` WRITE;
/*!40000 ALTER TABLE `member_book_class` DISABLE KEYS */;
INSERT INTO `member_book_class` VALUES (1,201,'2023-10-01'),(1,202,'2023-10-13'),(2,202,'2023-10-02'),(2,203,'2023-10-14'),(3,203,'2023-10-03'),(3,204,'2023-10-15'),(4,204,'2023-10-04'),(5,205,'2023-10-05'),(6,206,'2023-10-06'),(7,207,'2023-10-07'),(8,208,'2023-10-08'),(9,209,'2023-10-09'),(10,210,'2023-10-10'),(11,211,'2023-10-11'),(12,212,'2023-10-12');
/*!40000 ALTER TABLE `member_book_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_phone`
--

DROP TABLE IF EXISTS `member_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_phone` (
  `phone` varchar(20) NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`phone`,`member_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `member_phone_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_phone`
--

LOCK TABLES `member_phone` WRITE;
/*!40000 ALTER TABLE `member_phone` DISABLE KEYS */;
INSERT INTO `member_phone` VALUES ('555-123-4567',1),('555-987-6543',2),('555-234-5678',3),('555-876-5432',4),('555-345-6789',5),('555-765-4321',6),('555-456-7890',7),('555-654-3210',8),('555-567-8901',9),('555-543-2109',10),('555-678-9012',11),('555-432-1098',12);
/*!40000 ALTER TABLE `member_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `membership_id` int NOT NULL,
  `member_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`membership_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES (1001,1,'2023-01-15','2024-01-15','Premium','Active'),(1002,2,'2023-02-20','2024-02-20','Standard','Active'),(1003,3,'2023-03-10','2024-03-10','Student','Active'),(1004,4,'2023-04-05','2024-04-05','Premium','Active'),(1005,5,'2023-05-12','2024-05-12','Standard','Active'),(1006,6,'2023-06-18','2024-06-18','Student','Active'),(1007,7,'2023-07-22','2024-07-22','Premium','Active'),(1008,8,'2023-08-30','2024-08-30','Standard','Active'),(1009,9,'2023-09-14','2024-09-14','Student','Active'),(1010,10,'2023-10-25','2024-10-25','Premium','Active'),(1011,11,'2023-11-05','2024-11-05','Standard','Expired'),(1012,12,'2023-12-10','2024-12-10','Student','Active');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `role` varchar(30) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (101,'James Wilson','Head Trainer','Male','555-111-2222'),(102,'Patricia Moore','Yoga Instructor','Female','555-222-3333'),(103,'Richard Lee','Personal Trainer','Male','555-333-4444'),(104,'Linda Clark','Pilates Instructor','Female','555-444-5555'),(105,'Charles Young','Spin Instructor','Male','555-555-6666'),(106,'Barbara Hall','Zumba Instructor','Female','555-666-7777'),(107,'Joseph Allen','CrossFit Trainer','Male','555-777-8888'),(108,'Margaret Scott','Receptionist','Female','555-888-9999'),(109,'Thomas King','Manager','Male','555-999-0000'),(110,'Susan Green','Swim Instructor','Female','555-000-1111'),(111,'Christopher Baker','Boxing Coach','Male','555-121-2121'),(112,'Dorothy Adams','Nutritionist','Female','555-232-3232');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-16  4:33:29
