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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `summary` text,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (52,'Seamless Travel with Mega City Cab Service','2025-03-11','<p>Enjoy reliable, comfortable, and affordable rides across Colombo with Mega City Cab Service.</p>','blog_images\\c2a2aeee-f039-4794-bb14-7eaa85e0919f.jpg','2025-03-11 18:11:47','2025-03-11 18:14:12'),(53,'Luxury Car Hire Travel in Style with Mega City Cab','2025-03-12','<p>Experience premium rides for weddings, business, and VIP events in Colombo.</p>','blog_images\\2dd8eae8-7da9-42df-9a9b-256772256739.jpg','2025-03-11 18:18:08','2025-03-11 18:44:50'),(54,'Why Mega City Cab is Your Best Travel Companion','2025-03-12','<p>Get 24/7 cab service, affordable rates, and hassle-free rides anywhere in Colombo</p>','blog_images\\4af80926-9dcc-49eb-8dad-de4987a7eb49.png','2025-03-11 18:37:56','2025-03-11 18:38:12'),(55,'Safe & Budget-Friendly Rides with Mega City Cab','2025-03-12','<p>Travel securely with professional drivers, GPS tracking, and sanitized vehicles at great prices</p>','blog_images\\8a6c318d-06d6-4e73-a712-4c16ec2478a9.jpeg','2025-03-11 18:47:43','2025-03-11 18:47:43');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reply_message` text,
  `replied_at` datetime DEFAULT NULL,
  `replied` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Chamod Mullegama','0750481219','kingchamod2001@gmail.com','hyjyjy','2025-03-11 05:10:48','2025-03-11 11:48:19',NULL,NULL,1),(2,'Kasun dimantha','0750481219','chamod2001@gmail.com','I can not book a ride error message is coming How can I book a ride ','2025-03-11 20:00:56','2025-03-11 20:03:26',NULL,NULL,1),(3,'Chamod Mullegama','0750481219','kingchamod2001@gmail.com','How can i book a ride','2025-03-14 05:43:36','2025-03-14 05:43:36',NULL,NULL,0),(4,'Chamod Mullegama','0750481219','kingchamod2001@gmail.com','How can i make book','2025-03-14 05:49:12','2025-03-14 05:49:12',NULL,NULL,0),(5,'Chamod Mullegama','0750481219','kingchamod2001@gmail.com','how can i book ride','2025-03-14 05:55:59','2025-03-14 06:09:02',NULL,NULL,1),(6,'Chamod Mullegama','0750481219','kingchamod2001@gmail.com','test','2025-03-14 06:26:52','2025-03-14 06:26:52',NULL,NULL,0),(7,'Chamod Mullegama','0750481219','kingchamod2001@gmail.com','HOW CAN I START','2025-03-14 06:45:51','2025-03-14 06:57:54',NULL,NULL,1);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `image_path` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (21,'Family Minivan','Spacious and convenient minivans for family trips and group travel','gallery_images\\b3998832-c05c-4ebb-bdc1-e8c14c5f340b.jpg','2025-03-11 18:25:29','2025-03-11 18:25:29'),(22,'Airport Transfer Cab','Reliable and timely airport pickup and drop-off services','gallery_images\\5478e2c3-6de1-42b0-8c69-40ffb317e102.jpg','2025-03-11 18:27:40','2025-03-11 18:27:40'),(23,'Luxury Wedding Car','Elegant cars for weddings and special occasions in style','gallery_images\\5aa03ff0-21a2-4d5a-8e50-327de835c11e.jpeg','2025-03-11 18:32:37','2025-03-11 18:32:37'),(24,'Galle Face Night Drive','Relax with a peaceful ride along Galle Face under the city lights','gallery_images\\62bbb281-01e6-431e-b81c-650ec9a388c6.jpeg','2025-03-11 18:35:38','2025-03-11 18:35:38');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `agreement` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter`
--

LOCK TABLES `newsletter` WRITE;
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
INSERT INTO `newsletter` VALUES (2,'chamod.mullegama@gmail.com',1,'2025-02-20 15:56:09','2025-02-20 15:56:09'),(8,'kingchamod2001@gmail.com',1,'2025-02-23 11:11:08','2025-02-23 11:11:08'),(9,'kingchamod2001@gmail.com',1,'2025-03-01 04:39:18','2025-03-01 04:39:18'),(10,'chamod.mullegama@gmail.com',1,'2025-03-05 14:56:00','2025-03-05 14:56:00'),(11,'kingchamod2001@gmail.com',1,'2025-03-14 06:57:15','2025-03-14 06:57:15');
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (7,'Kasun',' Perera','kasun.perera@example.com','Excellent service! The cab was on time, and the driver was very professional. Highly recommended!','2025-03-01 17:58:05','2025-03-01 17:58:05'),(8,'Dilan','Silva','dilan.silva@example.com','Reliable and safe! The driver was friendly, and the car was well-maintained. Great experience!','2025-03-01 18:03:20','2025-03-01 18:03:20'),(9,'Amila','Senanayake','amila.senanayake@example.com','Very professional service! The cab arrived quickly, the driver was polite, and the ride was smooth. Highly recommended for daily travel!','2025-03-01 18:04:22','2025-03-01 18:04:22'),(10,'Roshan','Abeywardena','Roshanabeywardena@example.com','Impressive service! The driver was very professional, and the car was spotless. I recommend Mega City Cab to everyone!','2025-03-01 18:05:13','2025-03-01 18:05:13'),(11,'Thilina','Karunaratne','thilina.karunaratne@example.com','Safe and comfortable ride! The driver followed traffic rules, and the car was well-maintained. Great experience with Mega City Cab!','2025-03-01 18:05:46','2025-03-01 18:05:46'),(13,'Chamod','Mullegama','kingchamod2001@gmail.com','Good Service','2025-03-14 05:42:37','2025-03-14 05:42:37');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (12,'Carpool Service','Share rides with others and reduce travel costs. Convenient and eco-friendly.','service_images\\3a087afb-371f-4951-a785-d36708b272d2.png'),(13,'Luxury Car Hire','Drive high-end vehicles for special occasions. Perfect for VIP experiences.','service_images\\fd29f155-1bd1-415b-933c-cd33ae855794.png'),(28,'Cab Booking','Convenient ride booking service for various travel needs, including rentals and transfers','service_images\\d1496c20-0328-4557-be35-173323def66e.png'),(29,'Car Rental','Rent a vehicle for personal or business use with flexible durations and options','service_images\\4cf1289b-3e41-4359-ae15-a334a8ba10b7.png');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','DRIVER','CUSTOMER') NOT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `license_id` varchar(100) DEFAULT NULL,
  `gender` enum('MALE','FEMALE','OTHER') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'admin@example.com','123','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,'2025-02-25 06:53:35','2025-02-25 06:53:35'),(17,'chamara@gmail.com','Chamara@258','DRIVER','uploads/profile-photos\\3308f240-44a3-4b3a-a575-5a717098b2dd.png','Chamara Ranasinghe',36,'12','LK90123456',NULL,'2025-03-01 18:45:13','2025-03-05 17:05:46'),(18,'anurara@gmail.com','Anura@753','DRIVER','uploads/profile-photos\\65574967-a6cd-4032-9dca-47d692e0d653.png','Anura Rathnayake',27,'6','LK01234567','MALE','2025-03-01 18:46:20','2025-03-01 18:46:20'),(19,'udara@gmail.com','Udara@369','DRIVER','uploads/profile-photos\\2ac3fa39-f202-4609-91e4-665b3dd2dc6f.png','Udara Bandara',33,'9','LK12398765','MALE','2025-03-01 18:48:01','2025-03-01 18:48:01'),(20,'jasinth21@gmail.com','123','DRIVER','uploads/profile-photos\\95c37084-90e2-4676-aa7b-1c36bba2eb96.png','Jasintha Ekanayake',25,'3','LK45632178','MALE','2025-03-01 18:49:09','2025-03-01 18:49:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_type` varchar(50) NOT NULL,
  `engine_number` varchar(50) NOT NULL,
  `vehicle_number` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `vehicle_fuel_type` varchar(50) NOT NULL,
  `doors` int NOT NULL,
  `capacity` int NOT NULL,
  `driver_id` int NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `driver_id` (`driver_id`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (11,'Car','ENG123456789','KX-1582','Toyota Prius','White','Hybrid',4,5,20,'vehicle_images\\32d9992d-1b79-4fd1-bbf4-4ba8427d9cef.jpg','2025-03-08 07:00:51','2025-03-08 07:00:51'),(12,'Van','ENG567893210','NC-9364','Toyota KDH High roof','Gray','Petrol',4,14,19,'vehicle_images\\0c046249-6351-4d62-8b6c-0a63063088d8.jpg','2025-03-08 07:23:49','2025-03-08 07:23:49');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-14 15:58:39
