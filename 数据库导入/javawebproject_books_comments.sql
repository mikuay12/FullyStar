-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: javawebproject
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `books_comments`
--

DROP TABLE IF EXISTS `books_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_comments` (
  `comment_ID` int NOT NULL AUTO_INCREMENT,
  `comment_book` varchar(45) DEFAULT NULL,
  `comment_user` varchar(45) DEFAULT NULL,
  `comment_content` text,
  PRIMARY KEY (`comment_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_comments`
--

LOCK TABLES `books_comments` WRITE;
/*!40000 ALTER TABLE `books_comments` DISABLE KEYS */;
INSERT INTO `books_comments` VALUES (1,'200201','1001000','某种意义上说，是中国旧社会的一部百科全书'),(2,'200204','1001003','非常好看，爱来自瓷器'),(3,'200204','1001001','这个作家是英国著名的推理小说创作者'),(4,'200204','1001001','这本书我挺喜欢的'),(6,'200202','1001001','我是第一条评论'),(7,'200205','1001007','最喜欢看的一集'),(8,'200205','1001007','这书写的贼牛逼'),(13,'200206','1001009','我小时候很喜欢看'),(14,'200201','1001002','这书。。。现在可以评论吧'),(17,'200204','1001001','这本书写的很好'),(18,'200206','1001001','我的童年回忆'),(19,'200201','1001002','典型的中国文学'),(20,'200203','1001008','这本书还拍成了电影'),(21,'200207','1001001','这本书里的描写的前辈太悲惨了，向他们这样的人致敬'),(22,'200207','1001000','铭记历史，勇敢前行'),(32,'200201',NULL,'test'),(33,'200201',NULL,'test');
/*!40000 ALTER TABLE `books_comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-02 17:21:39
