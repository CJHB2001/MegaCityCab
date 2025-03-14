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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `nic_number` varchar(12) NOT NULL,
  `registration_number` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nic_number` (`nic_number`),
  UNIQUE KEY `registration_number` (`registration_number`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Chamod','Mullegama','0750481219','kingchamod2001@gmail.com','123456789','109/4 , samaragiri , ambthenn','dfdfdfd','123456789v','CUST00001','2025-02-23 16:04:24','2025-02-23 16:04:24'),(11,'Chamod','Mullegama','0750481217','hamod2001@gmail.com','123456789g','109/4 , samaragiri , ambthenn','dfdfdfd','123423423v','CUST00002','2025-02-23 18:26:28','2025-02-23 18:26:28'),(16,'Chamod','Mullegama','0750481212','chamod.mullegama@gmail.com','123456789q','109/4 , samaragiri , ambthenn','dfdfdfd','123123435v','CUST00012','2025-02-23 19:10:06','2025-02-23 19:10:06'),(17,'KASUN','Mullegama','0750481211','KASUN@example.com','123456789Q','109/4 , samaragiri , ambthenn','dfdfdfd','123432123V','CUST00017','2025-02-27 09:02:09','2025-02-27 09:02:09'),(18,'Chamod','Mullegama','0750481277','ingchamod2001@gmail.com','123456789f','109/4 , samaragiri , ambthenn','dfdfdfd','123456784v','CUST00018','2025-03-01 07:19:49','2025-03-01 07:19:49'),(19,'Chamod','Mullegama','0750481200','vvhamod2001@gmail.com','123456789f','109/4 , samaragiri , ambthenn','dfdfdfd','123456781v','CUST00019','2025-03-01 07:24:07','2025-03-01 07:24:07'),(20,'Alice','Smith','0772222222','alice@test.com','SecurePass123','456 Oak St',NULL,'198765432V','CUST00020','2025-03-07 15:53:47','2025-03-07 15:53:47'),(68,'Service','Test','0771111111','service@test.com','servicepass','Service Address',NULL,'555555555V','CUST00021','2025-03-07 16:12:20','2025-03-07 16:12:20'),(101,'Alice','Smith','0772222888','test12e@test.com','SecurePass123','456 Oak St',NULL,'198765439V','CUST00069','2025-03-07 17:29:16','2025-03-07 17:29:16'),(108,'Service','Test','0771111222','teste@test.com','servicepass','Service Address',NULL,'999999555V','CUST00102','2025-03-07 17:30:55','2025-03-07 17:30:55'),(114,'Service','Test','0702740542','test123e@test.com','servicepass','Service Address',NULL,'999999111V','CUST00109','2025-03-07 17:32:03','2025-03-07 17:32:03'),(126,'Service','Test','0702740540','te123@test.com','servicepass','Service Address',NULL,'999999789V','CUST00115','2025-03-07 17:33:11','2025-03-07 17:33:11'),(132,'Service','Test','0771111000','service123@test.com','servicepass','Service Address',NULL,'555555128V','CUST00127','2025-03-07 17:37:27','2025-03-07 17:37:27'),(135,'Nisansala ','Eknayake','0715465899','nisansala123@gmail.com','123456789q','No.94/2','Samaragiri , Mullegama, Ambathenna','200125801v','CUST00133','2025-03-07 19:22:25','2025-03-07 19:22:25'),(136,'Madu ','Eknayake','0715465822','madu123@gmail.com','123456789q','No.94/2',' Samaragiri , Mullegama , Ambathenna','200125800v','CUST00136','2025-03-07 19:33:24','2025-03-07 19:33:24'),(149,'Chamod','Mullegama','0750481216','kingchamod2002@gmail.com','123456789q','109/4 , samaragiri , ambthenn','dfdfdfd','123123987v','CUST00137','2025-03-14 05:51:05','2025-03-14 05:51:05'),(150,'Kasun','Mullegama','0702740000','kingchamod2003@gmail.com','123456789q','109/4 , samaragiri , ambthenn','dfdfdfd','123123123v','CUST00150','2025-03-14 05:59:10','2025-03-14 05:59:10'),(151,'Kasun','Mullegama','0702740999','kingchamod2004@gmail.com','123456789q','109/4 , samaragiri , ambthenn','dfdfdfd','123321123v','CUST00151','2025-03-14 06:29:15','2025-03-14 06:29:15'),(152,'Dasun','Mullegama','0702346543','dasun.mullegama@gmail.com','123456789q','109/4 , samaragiri , ambthenn','dfdfdfd','123456745v','CUST00152','2025-03-14 06:48:50','2025-03-14 06:48:50');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-14 13:59:15
