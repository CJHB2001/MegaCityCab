-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: megacitycab
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `registration_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `pick_up_point` varchar(255) NOT NULL,
  `drop_off_point` varchar(255) NOT NULL,
  `passengers` int NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `distance_km` float NOT NULL,
  `total_bill` float NOT NULL,
  `ride_date` date NOT NULL,
  `ride_time` time NOT NULL,
  `message` text,
  `booking_status` int DEFAULT '0',
  `car_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trip_status` int DEFAULT '0',
  `payment_status` int DEFAULT '0',
  `discount` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (122,136,'CUST00136','madu123@gmail.com','Madu Eknayake','0715465822','Mortuwa','Bambalapitiya',2,'car',18,3240,'2025-03-14','12:45:00','',1,11,'2025-03-13 18:40:27','2025-03-13 18:59:20',3,1,10.00),(123,150,'CUST00150','kingchamod2003@gmail.com','Kasun mullegama','0715465822','Kadawatha','Colombo',2,'car',18,3420,'2025-03-14','14:33:00','',1,11,'2025-03-14 06:00:25','2025-03-14 06:05:05',3,1,5.00),(124,151,'CUST00151','kingchamod2004@gmail.com','Kasun Mullegama','0702740542','Mortuwa','Colombo',2,'car',23,4600,'2025-03-14','15:02:00','',0,NULL,'2025-03-14 06:30:49','2025-03-14 06:30:49',0,0,0.00),(125,152,'CUST00152','dasun.mullegama@gmail.com','Dasun Mullegama','0750481219','Mortuwa','Colombo',2,'car',20,3800,'2025-03-14','14:21:00','',1,11,'2025-03-14 06:50:02','2025-03-14 06:53:01',3,1,5.00);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-14 13:59:16
