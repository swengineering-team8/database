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
  `category_id` int NOT NULL,
  `seller_id` char(20) NOT NULL,
  `car_name` varchar(20) DEFAULT NULL,
  `car_price` int DEFAULT NULL,
  `car_year` int DEFAULT NULL,
  `car_mileage` int DEFAULT NULL,
  `car_fuel` varchar(10) DEFAULT NULL,
  `car_info` longtext,
  `created_date` datetime DEFAULT NULL,
  `hit` int DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  KEY `fk_Car_category1_idx` (`category_id`),
  KEY `fk_Car_User1_idx` (`seller_id`),
  CONSTRAINT `fk_Car_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `fk_Car_User1` FOREIGN KEY (`seller_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,2,'asd','그랜저',2000,2015,10,'가솔린','비고1','2022-05-06 00:00:00',0),(2,3,'zxc','팰리세이드',1500,2020,11,'디젤','비고2','2022-05-07 00:00:00',0);
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
  `categ_name` varchar(10) DEFAULT NULL,
  `categ_company` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'쏘나타','현대'),(2,'그랜저','현대'),(3,'팰리세이드','현대');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `info` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'주)회사1','비고1');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `fav_id` int NOT NULL AUTO_INCREMENT,
  `user_id` char(20) NOT NULL,
  `car_id` int NOT NULL,
  PRIMARY KEY (`fav_id`),
  KEY `fk_User_has_Car1_Car1_idx` (`car_id`),
  KEY `fk_User_has_Car1_User1_idx` (`user_id`),
  CONSTRAINT `fk_User_has_Car1_Car1` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`),
  CONSTRAINT `fk_User_has_Car1_User1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES (1,'qwe',2);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `img_id` int NOT NULL AUTO_INCREMENT,
  `car_id` int NOT NULL,
  `img_name` varchar(45) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  PRIMARY KEY (`img_id`),
  KEY `fk_Image_Car1_idx` (`car_id`),
  CONSTRAINT `fk_Image_Car1` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `car_id` int NOT NULL,
  `buyer_id` char(20) NOT NULL,
  `purchase_date` datetime NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_User_has_Car_Car1_idx` (`car_id`),
  KEY `fk_User_has_Car_User1_idx` (`buyer_id`),
  CONSTRAINT `fk_User_has_Car_Car1` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`),
  CONSTRAINT `fk_User_has_Car_User1` FOREIGN KEY (`buyer_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,2,'qwe','2022-05-14 00:00:00');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` char(20) NOT NULL,
  `user_name` varchar(10) NOT NULL,
  `user_pw` varchar(50) NOT NULL,
  `user_nickname` varchar(30) NOT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `user_role` int NOT NULL,
  `Company_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_User_UserCompany1_idx` (`Company_id`),
  CONSTRAINT `fk_User_UserCompany1` FOREIGN KEY (`Company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('asd','asdf','1234','asdfg','01012345678','qwe123@naver.com','서울특별시 노원구 광운로 20','2022-05-04 00:00:00',1,NULL),('qwe','qwer','1234','qwert','01012345678','qwe123@naver.com','서울특별시 노원구 광운로 20','2022-05-03 00:00:00',0,NULL),('wer','wert','1234','werty','01012345678','wer@naver.com','서울특별시 노원구 광운로 20','2022-05-05 00:00:00',2,1),('zxc','zxcv','1234','zxcvb','01012345678','qwe123@naver.com','서울특별시 노원구 광운로 20','2022-05-05 00:00:00',1,NULL);
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

-- Dump completed on 2022-06-07  4:17:54
