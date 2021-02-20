-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: missa
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `content` varchar(512) NOT NULL,
  PRIMARY KEY (`comment_id`),
  UNIQUE KEY `comment_id_UNIQUE` (`comment_id`),
  KEY `fk_comment_post_id_idx` (`post_id`),
  CONSTRAINT `fk_comment_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (3,4,'我看到啦');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `community_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  `total_member` int(11) NOT NULL,
  PRIMARY KEY (`community_id`),
  UNIQUE KEY `community_id_UNIQUE` (`community_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'貓貓寵物店','吸貓真棒',1),(2,'奇聞異書店','學海無涯',1),(3,'邊緣人集散地','你沒朋友',1),(4,'開心農場_偷菜群','偷菜路上有你有我',3),(5,'創遊plus英嘴plus練習','中大社群',1),(6,'K的世界','Kaiser的好朋友',1),(7,'大氣系','雲物理介紹的',1),(8,'A先生俱樂部','交友',1),(9,'7的社群','就是只有七',1),(10,'MRB的社群','MRMRMR',1),(11,'資管系','資管人才優',1),(12,'資管系2','資管都是人才',1),(13,'資管系3','資管都是人才x',1),(14,'別再出BUG了啦','真的',1);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_match`
--

DROP TABLE IF EXISTS `friend_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL,
  `match_state` tinyint(4) NOT NULL,
  PRIMARY KEY (`match_id`),
  UNIQUE KEY `match_id_UNIQUE` (`match_id`),
  KEY `fk_user1_id_idx` (`user1_id`),
  KEY `fk_user2_id_idx` (`user2_id`),
  CONSTRAINT `fk_friendMatch_user1_id` FOREIGN KEY (`user1_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_friendMatch_user2_id` FOREIGN KEY (`user2_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_match`
--

LOCK TABLES `friend_match` WRITE;
/*!40000 ALTER TABLE `friend_match` DISABLE KEYS */;
INSERT INTO `friend_match` VALUES (3,2,3,1),(4,1,4,0),(7,7,4,1),(9,1,5,0),(10,1,12,0),(11,1,8,0),(12,1,9,0),(14,2,6,0),(15,2,9,0),(16,2,13,0),(17,2,11,0),(18,2,10,1),(19,2,7,1),(20,2,5,0),(21,2,12,0),(22,3,4,0),(23,4,10,0),(24,7,13,0),(25,7,8,0),(26,7,11,0),(27,7,15,1),(28,15,12,0),(29,15,5,0),(30,15,8,0),(32,15,1,1),(33,15,3,0),(34,15,6,0),(35,15,11,0),(36,15,4,0),(37,15,10,0),(40,1,13,0),(41,1,14,0),(42,1,11,0),(44,2,16,0),(45,3,16,1),(46,4,16,1),(47,5,16,1),(48,6,16,1),(50,1,7,0),(51,17,1,1);
/*!40000 ALTER TABLE `friend_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inbox` (
  `inbox_id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_match_id` int(11) DEFAULT NULL,
  `user_community_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`inbox_id`),
  UNIQUE KEY `inbox_id_UNIQUE` (`inbox_id`),
  KEY `fk_inbox_user_id` (`user_id`),
  CONSTRAINT `fk_inbox_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbox`
--

LOCK TABLES `inbox` WRITE;
/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;
INSERT INTO `inbox` VALUES (7,50,-1,7);
/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `login_times` int(11) DEFAULT '0',
  `status` varchar(255) DEFAULT '偶數會員',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'測試人員','test@cc.ncu.edu.tw','abcd1234','2020-01-01 05:40:38','2019-10-18 11:30:28',40,'偶數會員');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_content` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `message_id_UNIQUE` (`message_id`),
  KEY `fk_message_user_id_idx` (`user_id`),
  KEY `fk_message_match_id_idx` (`match_id`),
  CONSTRAINT `fk_message_match_id` FOREIGN KEY (`match_id`) REFERENCES `friend_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_message_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (3,7,7,'嗨'),(11,32,1,'還好'),(12,51,17,'ｈｉ'),(13,32,1,'asdfasdfasdf');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,1,3,399.99,12,4799.88),(2,1,4,499.99,14,6999.86),(3,2,1,199.99,11,2199.89),(4,2,3,399.99,5,1999.95),(5,2,2,299.99,7,2099.93),(6,2,4,499.99,3,1499.97),(7,3,1,199.99,10,1999.9),(8,3,4,499.99,7,3499.93),(9,4,2,299.99,3,899.97),(10,4,4,499.99,5,2499.95);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(10) DEFAULT NULL,
  `first_name` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `create` datetime DEFAULT NULL,
  `modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'測試','人員','','(320)桃園市中壢區中大路300號','0911-123-456','2019-11-08 16:13:41','2019-11-08 16:13:41'),(2,'中央','資管','','(320)桃園市中壢區中大路300號','0922-789-012','2019-11-08 16:15:08','2019-11-08 16:15:08'),(3,'中央','大學','','(320)桃園市中壢區中大路300號','0922-456-123','2019-11-08 16:32:07','2019-11-08 16:32:07'),(4,'NCU','MIS','','(32001) 桃園市中壢區中大路300 號','0911-234-977','2019-11-09 03:28:48','2019-11-09 03:28:48');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `content` varchar(512) NOT NULL,
  PRIMARY KEY (`post_id`),
  UNIQUE KEY `post_id_UNIQUE` (`post_id`),
  KEY `fk_post_user_id_idx` (`user_id`),
  KEY `fk_post_community_id_idx` (`community_id`),
  CONSTRAINT `fk_post_community_id` FOREIGN KEY (`community_id`) REFERENCES `community` (`community_id`),
  CONSTRAINT `fk_post_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (2,1,4,'s'),(4,1,4,'小勇你看的到馬'),(5,1,4,'sdfasdfasd');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 5C',199.99,'iPhone5C.jpg','這是iPhone5C'),(2,'iPhone 5S',299.99,'iPhone5S.jpg','這是iPhone5S'),(3,'iPhone 6',399.99,'iPhone6.jpg','這是iPhone 6'),(4,'iPhone 6 Plus',499.99,'iPhone6Plus.jpg','這是iPhone 6 Plus');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `hashed_password` varchar(128) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `name` varchar(64) NOT NULL,
  `age` int(11) NOT NULL,
  `birthday` datetime NOT NULL,
  `gender` int(11) NOT NULL,
  `work` varchar(45) DEFAULT NULL,
  `interest` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'123','a@gmail.com','0988888877','Kaiser',18,'1999-01-01 00:00:00',1,'射箭','當愛神邱比特小惡魔'),(2,'123','b@gmail.com','0','MR.B',18,'1999-02-01 00:00:00',1,'書店店長','看書'),(3,'123','c@gmail.com','0','MR.C',18,'1999-03-01 00:00:00',1,'寵物員','吸貓'),(4,'123','d@gmail.com','0','MR.D',18,'1999-03-01 00:00:00',1,'寵物員','吸狗'),(5,'123','e@gmail.com','0','MR.E',18,'1999-03-01 00:00:00',1,'寵物員','吸雞'),(6,'123','f@gmail.com','0','Falan',18,'1999-05-01 00:00:00',1,'飛行員','跳傘'),(7,'z5417888','ms0351332@gmail.com','0988402288','鄭阿嘉',55,'1997-11-18 00:00:00',0,'當獵人','一天只睡四小時的生物'),(8,'hello','hello@gmail.com','0998402222','HelloAmigo',15,'1997-11-18 00:00:00',0,NULL,NULL),(9,'my789abc','b123456123456x','062950555','Peter',98,'1995-11-16 00:00:00',1,NULL,NULL),(10,'test','test@gmail.com','0988401111','TestGuy',15,'1998-12-12 00:00:00',1,NULL,NULL),(11,'test2','test2@gmail.com','062622642','George',58,'1945-11-12 00:00:00',0,NULL,NULL),(12,'test3','test3@gmail.com','0999402284','Lorense',66,'1933-11-18 00:00:00',0,'澆水','看花'),(13,'tnfsh21085','tnfsh21085@gmail.com','0988777777','鄭成功大',99,'1911-11-11 00:00:00',1,'划船','成為海賊王'),(14,'MRA','MRA@gmail.com','0911111111','MRA',15,'1997-11-18 00:00:00',1,NULL,NULL),(15,'MRB','MRB@gmail.com','0922723555','MRB',16,'1997-11-18 00:00:00',1,NULL,NULL),(16,'goodfriend','goodfriend@gmail.com','0788745614','好朋友',12,'1997-11-18 00:00:00',1,NULL,NULL),(17,'b123x','b123x@gmail.com','0911121154','小泳',56,'1945-11-18 00:00:00',1,NULL,NULL),(18,'123','x@gmail.com','0944516785','lll',15,'1997-11-15 00:00:00',1,'work','interest');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_community`
--

DROP TABLE IF EXISTS `user_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_community` (
  `user_community_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `isHost` tinyint(4) NOT NULL,
  `isHostApproved` tinyint(4) NOT NULL,
  `isMemberApproved` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_community_id`),
  UNIQUE KEY `user_community_id_UNIQUE` (`user_community_id`),
  KEY `fk_user_community_user_id_idx` (`user_id`),
  KEY `fk_user_community_community_id_idx` (`community_id`),
  CONSTRAINT `fk_user_community_community_id` FOREIGN KEY (`community_id`) REFERENCES `community` (`community_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_community_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_community`
--

LOCK TABLES `user_community` WRITE;
/*!40000 ALTER TABLE `user_community` DISABLE KEYS */;
INSERT INTO `user_community` VALUES (1,2,2,1,1,1),(2,3,1,1,1,1),(3,1,1,0,0,1),(4,1,4,1,1,1),(5,1,1,0,0,0),(6,1,5,1,1,1),(8,1,1,0,0,0),(9,1,2,0,0,1),(10,1,3,0,0,1),(12,1,7,1,1,1),(13,1,7,0,0,0),(14,2,1,0,0,1),(15,2,2,0,0,0),(16,2,3,0,0,1),(17,2,4,0,1,1),(18,2,5,0,0,1),(19,2,6,0,0,1),(20,2,7,0,0,1),(21,7,1,0,0,1),(22,7,2,0,0,1),(23,7,3,0,0,1),(24,7,4,0,0,1),(25,7,5,0,0,1),(26,7,6,0,0,1),(27,7,7,0,0,1),(28,7,7,0,0,0),(29,1,7,0,0,0),(30,14,8,1,1,1),(31,15,8,0,0,1),(32,7,9,1,1,1),(33,15,10,1,1,1),(34,1,11,1,1,1),(35,1,12,1,1,1),(36,1,13,1,1,1),(37,1,14,1,1,1),(38,17,6,0,0,1),(39,17,4,0,1,1);
/*!40000 ALTER TABLE `user_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'missa'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-06 22:53:24
