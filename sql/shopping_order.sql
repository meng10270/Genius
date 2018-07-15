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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `orderid` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `total` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `userid` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `userid` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('15298225053510','23375.0','11','','',''),('15298226801560','15487.0','11','','',''),('15298227280110','15487.0','11','','',''),('15298229588190','47039.0','11','','',''),('15298230458840','15487.0','11','','',''),('15298268252590','7599.0','11','','',''),('15298334183270','84745.0','11','','',''),('15298364751950','27487.0','测试','','',''),('15298496014200','98633.0','11','','',''),('15298507584310','7599.0','测试','测试','118818189','北京市'),('15298510283350','296.0','11','你猜','13912340909','北京市朝阳区建国路20号 100024'),('15298513761830','6000.0','11','不告诉你','13912340909','北京市朝阳区建国路20号 100024'),('15299201354960','15487.0','123','你猜','18899990909','北京市朝阳区建国路20号 100024'),('15301559792340','6000.0','测试','张三','118818189111','北京市'),('15305780806800','21487.0','哈喽','王二','18811209847','北京市朝阳区建国路20号'),('15305804815220','15487.0','哈喽','李四','18811209847','北京市朝阳区建国路20号'),('15316202335260','39.0','123','你猜','18899990909','18899990909'),('15316206401230','88.0','123','张三','18899990909','18899990909'),('15316207488180','88.0','123','张三','18899990909','北京市朝阳区建国路20号 100024'),('15316249703650','650.0','123','张三','18899990909','北京市朝阳区建国路20号 100024');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
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
