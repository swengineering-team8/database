CREATE DATABASE  IF NOT EXISTS `o_car` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `o_car`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: o_car
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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `car_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `car_name` varchar(45) DEFAULT NULL,
  `car_price` int DEFAULT NULL,
  `car_year` int DEFAULT NULL,
  `car_mileage` int DEFAULT NULL,
  `car_fuel` varchar(45) DEFAULT NULL,
  `car_info` longtext,
  `car_date` datetime DEFAULT NULL,
  `car_hit` int DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  KEY `fk_Car_Category1_idx` (`category_id`),
  CONSTRAINT `fk_car_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,1,'테스트1',1500,2019,10,'가솔린','test1','2022-04-08 00:00:00',0),(2,1,'테스트2',2000,2017,11,'가솔린','test2','2022-04-09 00:00:00',0),(3,1,'테스트3',1300,2019,12,'가솔린','test3','2022-04-10 00:00:00',0),(4,2,'테스트4',3000,2019,9,'가솔린','test4','2022-04-11 00:00:00',0),(5,2,'테스트5',4000,2019,15,'가솔린','test5','2022-04-12 00:00:00',0),(6,3,'테스트6',5000,2019,13,'가솔린','test6','2022-04-13 00:00:00',0),(7,3,'테스트7',6000,2019,16,'가솔린','test7','2022-04-14 00:00:00',0);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'현대 팰리세이드'),(2,'현대 그랜저'),(3,'현대 쏘나타');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `fav_id` int NOT NULL AUTO_INCREMENT,
  `car_id` int DEFAULT NULL,
  PRIMARY KEY (`fav_id`),
  KEY `fk_User_has_Car_Car1_idx` (`car_id`),
  CONSTRAINT `fk_fav_car_id` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `car_id` int DEFAULT NULL,
  `seller_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `car_state` int DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_user_has_car_car1_idx` (`car_id`),
  KEY `fk_order_car_id_idx` (`seller_id`),
  KEY `fk_order_customer_id_idx` (`customer_id`),
  CONSTRAINT `fk_order_car_id` FOREIGN KEY (`seller_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_order_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_order_seller_id` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `fav_id` int DEFAULT NULL,
  `user_uid` varchar(45) DEFAULT NULL,
  `user_pw` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_nickname` varchar(45) DEFAULT NULL,
  `user_phone` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_address` varchar(45) DEFAULT NULL,
  `user_date` datetime DEFAULT NULL,
  `user_role` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fav_id_idx` (`fav_id`),
  CONSTRAINT `fk_fav_id` FOREIGN KEY (`fav_id`) REFERENCES `favorites` (`fav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,'qwer','1234','a','aa','01012345678','qwe123@naver.com','서울특별시 노원구 광운로 20','2022-04-06 00:00:00',0),(2,NULL,'abc','123','b','bb','01012345678','qwe123@naver.com','서울특별시 노원구 광운로 20','2022-04-08 00:00:00',0),(3,NULL,'zxc','123','c','cc','01012345678','qwe123@naver.com','서울특별시 노원구 광운로 20','2022-04-10 00:00:00',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'o_car'
--

--
-- Dumping routines for database 'o_car'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-06 20:58:20
