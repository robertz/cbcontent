-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: 127.0.0.1    Database: content
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `ContentItem`
--

DROP TABLE IF EXISTS `ContentItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContentItem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContentItem`
--

LOCK TABLES `ContentItem` WRITE;
/*!40000 ALTER TABLE `ContentItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContentItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LangTypes`
--

DROP TABLE IF EXISTS `LangTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LangTypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LangTypes`
--

LOCK TABLES `LangTypes` WRITE;
/*!40000 ALTER TABLE `LangTypes` DISABLE KEYS */;
INSERT INTO `LangTypes` VALUES (1,'en','English'),(2,'es','Spanish');
/*!40000 ALTER TABLE `LangTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Page`
--

DROP TABLE IF EXISTS `Page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Page_page_uindex` (`page`) COMMENT 'No duplicate page names'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Page`
--

LOCK TABLES `Page` WRITE;
/*!40000 ALTER TABLE `Page` DISABLE KEYS */;
/*!40000 ALTER TABLE `Page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PageContentItem`
--

DROP TABLE IF EXISTS `PageContentItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PageContentItem` (
  `pageId` int NOT NULL,
  `contentItemId` int NOT NULL,
  KEY `PageContentItem_ContentItem_id_fk` (`contentItemId`),
  KEY `PageContentItem_Page_id_fk` (`pageId`),
  CONSTRAINT `PageContentItem_ContentItem_id_fk` FOREIGN KEY (`contentItemId`) REFERENCES `ContentItem` (`id`),
  CONSTRAINT `PageContentItem_Page_id_fk` FOREIGN KEY (`pageId`) REFERENCES `Page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PageContentItem`
--

LOCK TABLES `PageContentItem` WRITE;
/*!40000 ALTER TABLE `PageContentItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `PageContentItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TranslatedItem`
--

DROP TABLE IF EXISTS `TranslatedItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TranslatedItem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ContentItemId` int NOT NULL,
  `LangTypeId` int NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TranslatedItem_ContentItem_id_fk` (`ContentItemId`),
  KEY `TranslatedItem_LangTypes_id_fk` (`LangTypeId`),
  CONSTRAINT `TranslatedItem_ContentItem_id_fk` FOREIGN KEY (`ContentItemId`) REFERENCES `ContentItem` (`id`),
  CONSTRAINT `TranslatedItem_LangTypes_id_fk` FOREIGN KEY (`LangTypeId`) REFERENCES `LangTypes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TranslatedItem`
--

LOCK TABLES `TranslatedItem` WRITE;
/*!40000 ALTER TABLE `TranslatedItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `TranslatedItem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-22 10:33:27
