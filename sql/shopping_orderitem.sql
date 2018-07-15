CREATE DATABASE  IF NOT EXISTS `shopping` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `shopping`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `itemname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `singleprice` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `orderid` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  KEY `orderid_idx` (`orderid`),
  CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `order` (`orderid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES ('手机','1','7599.0','15298225053510'),('笔记本电脑','2','7888.0','15298225053510'),('手机','1','7599.0','15298226801560'),('笔记本电脑','1','7888.0','15298226801560'),('手机','1','7599.0','15298227280110'),('笔记本电脑','1','7888.0','15298227280110'),('手机','1','7599.0','15298229588190'),('笔记本电脑','5','7888.0','15298229588190'),('手机','1','7599.0','15298230458840'),('笔记本电脑','1','7888.0','15298230458840'),('手机','1','7599.0','15298268252590'),('手机','7','7599.0','15298334183270'),('笔记本电脑','4','7888.0','15298334183270'),('手机','1','7599.0','15298364751950'),('笔记本电脑','1','7888.0','15298364751950'),('相机','2','6000.0','15298364751950'),('手机','7','7599.0','15298496014200'),('笔记本电脑','5','7888.0','15298496014200'),('相机','1','6000.0','15298496014200'),('手机','1','7599.0','15298507584310'),('上衣','1','296.0','15298510283350'),('相机','1','6000.0','15298513761830'),('手机','1','7599.0','15299201354960'),('笔记本电脑','1','7888.0','15299201354960'),('相机','1','6000.0','15301559792340'),('手机','1','7599.0','15305780806800'),('相机','1','6000.0','15305780806800'),('笔记本电脑','1','7888.0','15305780806800'),('手机','1','7599.0','15305804815220'),('笔记本电脑','1','7888.0','15305804815220'),('鲁滨逊漂流记','1','39.0','15316202335260'),('鲁滨逊漂流记','1','39.0','15316206401230'),('茶花女','1','49.0','15316206401230'),('鲁滨逊漂流记','1','39.0','15316207488180'),('茶花女','1','49.0','15316207488180'),('鲁滨逊漂流记','2','39.0','15316249703650'),('茶花女','3','49.0','15316249703650'),('java实用手册','2','109.0','15316249703650'),('c#','2','59.0','15316249703650'),('java script','1','89.0','15316249703650');
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-15 18:04:28
