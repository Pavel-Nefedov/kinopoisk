-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: kinopoiskhd
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'фильмы'),(2,'сериалы');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geners`
--

DROP TABLE IF EXISTS `geners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geners` (
  `id` bigint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geners`
--

LOCK TABLES `geners` WRITE;
/*!40000 ALTER TABLE `geners` DISABLE KEYS */;
INSERT INTO `geners` VALUES (1,'комедия'),(2,'боевик'),(3,'криминал'),(4,'фентези'),(5,'приключения'),(6,'мультфильмы'),(7,'фантастика'),(8,'документальные'),(9,'ужасы'),(10,'мелодрамы'),(11,'Драма');
/*!40000 ALTER TABLE `geners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` bigint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `duration` char(3) DEFAULT NULL,
  `photo_id` bigint unsigned DEFAULT NULL,
  `created_at` year NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `rating` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `created_at` (`created_at`),
  KEY `rating` (`rating`),
  KEY `categories_id` (`categories_id`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Форсаж 9','Чтобы спасти семью и мир, Доминик противостоит своему брату. Начало последней трилогии драйвовой франшизы','142',NULL,2021,1,0),(2,'Острые козырьки','Криминальная сага в стиле ретро о банде и ее лютом боссе. Так популярна, что повысила продажи головных уборов',NULL,NULL,2013,2,0),(3,'Аватар','Парализованный морпех становится мессией жителей Пандоры. Уникальный мир — масштабный проект Джеймса Кэмерона','155',NULL,2009,1,0),(4,'Новый Человек Паук','Укус паука — и жизнь подростка меняется навсегда. Первая часть супергеройской дилогии с Эндрю Гарфилдом','138',NULL,2012,1,0),(5,'Монстры на каникулах','В респектабельный отель для монстров попадает человек. Обаятельная комедийная анимация про семью графа Дракулы','91',NULL,2012,1,0),(6,'Босс молокосос','Младенец с манерами топ-менеджера выполняет сверхмиссию. Хит о малютке-головастике от сценариста «Мадагаскара»','93',NULL,2017,1,0),(7,'ОНО 2','Повзрослевшие герои узнают, что Оно вернулось. Вторая часть экранизации культового романа Стивена Кинга','169',NULL,2019,1,0),(8,'Во все тяжкие','Умирающий учитель химии начинает варить мет ради благополучия семьи. Выдающийся драматический сериал 2010-х',NULL,NULL,2008,2,0),(9,'Карточный домик','Конгрессмен США и его жена готовы на все ради заветной цели. Политический триллер о необузданной жажде власти',NULL,NULL,2013,2,0),(10,'Кунг-фу панда','Мультфильм про мастеров боевых искусств','88',NULL,2008,1,0),(11,'Круиз по джунглям','Археолог Лили отправляется в дебри Амазонки на поиски редкого артефакта. Комедийный квест с Эмили Блант','127',NULL,2021,1,0),(12,'Черная вдова','Наташа Романофф срывает планы Дрейкова по порабощению мира. Фантастический боевик со Скарлетт Йоханссон','134',NULL,2021,1,0),(13,'Круэлла','Бунтарка покоряет модный мир Лондона. Предыстория злодейки из «101 далматинца» со сногсшибательными костюмами','134',NULL,2021,1,0),(14,'Интерстеллар','Фантастический эпос про задыхающуюся Землю, космические полеты и парадоксы времени. «Оскар» за спецэффекты','169',NULL,2014,1,0),(15,'Мегамозг','Семейная анимация от режиссера «Босса-молокососа»','91',NULL,2010,1,0),(16,'Форсаж 8','Доминик переходит на сторону зла ради спасения семьи. Боевик о семейных ценностях, хакерах и ядерном оружии','136',NULL,2017,1,0),(17,'Тайная жизнь домашних животных','Жизнь пса Макса меняется, когда хозяйка заводит еще одного питомца. Мультфильм от создателей «Гадкого я»','86',NULL,2016,1,0),(18,'Как прируччить дракона','Начало истории о дружбе мальчика и дракона. Обаятельный мультфильм с головокружительными визуальными эффектами','98',NULL,2010,1,0),(19,'Киберсталкер','Лукас поступает в лучшую инженерную школу мира, но популярные ученики школы постоянно унижают одаренного 18-летнего гика, и тогда он решается на месть',NULL,NULL,2019,2,0),(20,'Стартап','Агент ФБР расследует дело о нелегальной криптовалюте. Драма о финансовых аферах с Мартином Фриманом',NULL,NULL,2016,2,0);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_geners`
--

DROP TABLE IF EXISTS `movies_geners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_geners` (
  `movie_id` bigint unsigned NOT NULL,
  `genere_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`movie_id`,`genere_id`),
  KEY `genere_id` (`genere_id`),
  CONSTRAINT `movies_geners_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `movies_geners_ibfk_2` FOREIGN KEY (`genere_id`) REFERENCES `geners` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_geners`
--

LOCK TABLES `movies_geners` WRITE;
/*!40000 ALTER TABLE `movies_geners` DISABLE KEYS */;
INSERT INTO `movies_geners` VALUES (5,1),(6,1),(11,1),(13,1),(17,1),(1,2),(3,2),(4,2),(8,2),(10,2),(12,2),(16,2),(2,3),(8,3),(13,3),(20,3),(5,4),(7,4),(18,4),(1,5),(3,5),(4,5),(6,5),(11,5),(5,6),(6,6),(10,6),(15,6),(17,6),(18,6),(3,7),(4,7),(12,7),(14,7),(15,7),(7,9),(9,10),(14,11),(19,11);
/*!40000 ALTER TABLE `movies_geners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `new_movies_v`
--

DROP TABLE IF EXISTS `new_movies_v`;
/*!50001 DROP VIEW IF EXISTS `new_movies_v`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `new_movies_v` AS SELECT 
 1 AS `name`,
 1 AS `duration`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `gender` enum('f','m','x') NOT NULL,
  `birthday` date NOT NULL,
  `age` int DEFAULT NULL,
  `photo_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','1994-03-09',27,NULL,0),(2,'x','1999-05-21',22,NULL,0),(3,'m','1998-03-03',23,NULL,0),(4,'x','2000-10-30',21,NULL,0),(5,'m','2010-08-23',11,NULL,0),(6,'f','2015-09-12',6,NULL,0),(7,'x','1984-04-08',37,NULL,0),(8,'f','1970-12-01',51,NULL,0),(9,'f','1992-02-28',29,NULL,0),(10,'f','1965-11-25',56,NULL,0);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_birthday_before_insert` BEFORE INSERT ON `profiles` FOR EACH ROW BEGIN
		IF NEW.birthday >= current_date() THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert Canceled. Birthday must be in the past!';
		END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `profiles_favorites`
--

DROP TABLE IF EXISTS `profiles_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles_favorites` (
  `user_id` bigint unsigned NOT NULL,
  `movie_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`movie_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `profiles_favorites_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `profiles_favorites_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles_favorites`
--

LOCK TABLES `profiles_favorites` WRITE;
/*!40000 ALTER TABLE `profiles_favorites` DISABLE KEYS */;
INSERT INTO `profiles_favorites` VALUES (1,4),(1,8),(2,2),(3,1),(3,2),(3,6),(5,6),(5,7),(5,10),(8,8),(9,2),(9,4),(10,3),(10,6);
/*!40000 ALTER TABLE `profiles_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles_history`
--

DROP TABLE IF EXISTS `profiles_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles_history` (
  `user_id` bigint unsigned NOT NULL,
  `movie_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`movie_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `profiles_history_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `profiles_history_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles_history`
--

LOCK TABLES `profiles_history` WRITE;
/*!40000 ALTER TABLE `profiles_history` DISABLE KEYS */;
INSERT INTO `profiles_history` VALUES (1,5),(1,7),(1,8),(1,10),(2,5),(3,3),(3,7),(3,9),(3,10),(4,4),(4,5),(5,3),(5,4),(5,5),(5,8),(6,3),(7,2),(7,4),(7,6),(8,1),(8,2),(8,3),(9,1),(9,2),(10,5),(10,6),(10,8),(10,10);
/*!40000 ALTER TABLE `profiles_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `rating` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,1,1,5,'2021-09-29 18:07:50','2021-09-29 18:07:50'),(2,1,3,7,'2021-09-29 18:07:50','2021-09-29 18:07:50'),(3,2,4,8,'2021-09-29 18:07:50','2021-09-29 18:07:50'),(4,7,2,7,'2021-09-29 18:07:50','2021-09-29 18:07:50'),(5,3,9,4,'2021-09-29 18:07:50','2021-09-29 18:07:50'),(6,9,1,1,'2021-09-29 18:07:50','2021-09-29 18:07:50'),(7,5,9,6,'2021-09-29 18:07:50','2021-09-29 18:07:50'),(8,2,5,5,'2021-09-29 18:07:50','2021-09-29 18:07:50'),(9,1,8,5,'2021-09-29 18:08:39','2021-09-29 18:08:39'),(10,1,6,7,'2021-09-29 18:08:39','2021-09-29 18:08:39'),(11,2,2,8,'2021-09-29 18:08:39','2021-09-29 18:08:39'),(12,7,6,7,'2021-09-29 18:08:39','2021-09-29 18:08:39'),(13,3,7,4,'2021-09-29 18:08:39','2021-09-29 18:08:39'),(14,9,5,1,'2021-09-29 18:08:39','2021-09-29 18:08:39'),(15,5,7,6,'2021-09-29 18:08:39','2021-09-29 18:08:39'),(16,2,1,5,'2021-09-29 18:08:39','2021-09-29 18:08:39'),(25,10,8,5,'2021-10-04 03:40:48','2021-10-04 03:40:48'),(26,11,6,7,'2021-10-04 03:40:48','2021-10-04 03:40:48'),(27,20,2,8,'2021-10-04 03:40:48','2021-10-04 03:40:48'),(28,17,6,7,'2021-10-04 03:40:48','2021-10-04 03:40:48'),(29,13,7,4,'2021-10-04 03:40:48','2021-10-04 03:40:48'),(30,19,5,1,'2021-10-04 03:40:48','2021-10-04 03:40:48'),(31,15,7,6,'2021-10-04 03:40:48','2021-10-04 03:40:48'),(32,12,1,5,'2021-10-04 03:40:48','2021-10-04 03:40:48'),(33,10,3,5,'2021-10-04 04:01:25','2021-10-04 04:01:25'),(34,11,4,7,'2021-10-04 04:01:25','2021-10-04 04:01:25'),(35,20,1,6,'2021-10-04 04:01:25','2021-10-04 04:01:25'),(36,17,9,5,'2021-10-04 04:01:25','2021-10-04 04:01:25'),(37,13,7,9,'2021-10-04 04:01:25','2021-10-04 04:01:25'),(38,19,5,8,'2021-10-04 04:01:25','2021-10-04 04:01:25'),(39,15,7,2,'2021-10-04 04:01:25','2021-10-04 04:01:25'),(40,12,10,3,'2021-10-04 04:01:25','2021-10-04 04:01:25'),(41,10,7,5,'2021-10-04 04:01:46','2021-10-04 04:01:46'),(42,11,8,7,'2021-10-04 04:01:46','2021-10-04 04:01:46'),(43,20,10,6,'2021-10-04 04:01:46','2021-10-04 04:01:46'),(44,17,9,5,'2021-10-04 04:01:46','2021-10-04 04:01:46'),(45,13,7,9,'2021-10-04 04:01:46','2021-10-04 04:01:46'),(46,19,6,8,'2021-10-04 04:01:46','2021-10-04 04:01:46'),(47,15,7,2,'2021-10-04 04:01:46','2021-10-04 04:01:46'),(48,12,10,3,'2021-10-04 04:01:46','2021-10-04 04:01:46');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ratings_v`
--

DROP TABLE IF EXISTS `ratings_v`;
/*!50001 DROP VIEW IF EXISTS `ratings_v`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ratings_v` AS SELECT 
 1 AS `name`,
 1 AS `rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `serials_seasons`
--

DROP TABLE IF EXISTS `serials_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serials_seasons` (
  `serial_id` bigint unsigned NOT NULL,
  `num_season` bigint unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `serial_id` (`serial_id`),
  KEY `num_season` (`num_season`),
  CONSTRAINT `serials_seasons_ibfk_1` FOREIGN KEY (`serial_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serials_seasons`
--

LOCK TABLES `serials_seasons` WRITE;
/*!40000 ALTER TABLE `serials_seasons` DISABLE KEYS */;
INSERT INTO `serials_seasons` VALUES (2,1,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(2,2,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(2,3,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(2,4,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(8,1,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(8,2,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(8,3,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(8,4,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(8,5,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(9,1,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(9,2,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(9,3,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(9,4,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(9,5,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(9,6,'2021-09-29 05:17:10','2021-09-29 05:17:10'),(19,1,'2021-10-04 03:06:48','2021-10-04 03:06:48'),(20,1,'2021-10-04 03:06:48','2021-10-04 03:06:48'),(20,2,'2021-10-04 03:06:48','2021-10-04 03:06:48'),(20,3,'2021-10-04 03:06:48','2021-10-04 03:06:48');
/*!40000 ALTER TABLE `serials_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serials_series`
--

DROP TABLE IF EXISTS `serials_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serials_series` (
  `serial_id` bigint unsigned NOT NULL,
  `seasons_id` bigint unsigned NOT NULL,
  `num_series` bigint unsigned NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `seasons_id` (`seasons_id`),
  KEY `serial_id` (`serial_id`),
  CONSTRAINT `serials_series_ibfk_1` FOREIGN KEY (`seasons_id`) REFERENCES `serials_seasons` (`num_season`),
  CONSTRAINT `serials_series_ibfk_2` FOREIGN KEY (`serial_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serials_series`
--

LOCK TABLES `serials_series` WRITE;
/*!40000 ALTER TABLE `serials_series` DISABLE KEYS */;
INSERT INTO `serials_series` VALUES (2,1,1,NULL,'2021-09-29 05:30:02','2021-09-29 05:30:02'),(2,1,2,NULL,'2021-09-29 05:30:02','2021-09-29 05:30:02'),(2,1,3,NULL,'2021-09-29 05:30:02','2021-09-29 05:30:02'),(2,1,4,NULL,'2021-09-29 05:30:02','2021-09-29 05:30:02'),(2,1,5,NULL,'2021-09-29 05:30:02','2021-09-29 05:30:02'),(2,1,6,NULL,'2021-09-29 05:30:02','2021-09-29 05:30:02'),(2,1,7,NULL,'2021-09-29 05:30:02','2021-09-29 05:30:02'),(2,1,8,NULL,'2021-09-29 05:30:02','2021-09-29 05:30:02'),(2,1,9,NULL,'2021-09-29 05:30:02','2021-09-29 05:30:02'),(2,1,10,NULL,'2021-09-29 05:30:02','2021-09-29 05:30:02'),(2,1,11,NULL,'2021-09-29 05:30:02','2021-09-29 05:30:02'),(2,1,12,NULL,'2021-09-29 05:30:02','2021-09-29 05:30:02'),(2,1,13,NULL,'2021-09-29 05:30:02','2021-09-29 05:30:02'),(2,2,1,'Глава 14','2021-09-29 05:32:20','2021-09-29 05:32:20'),(2,2,2,NULL,'2021-09-29 05:32:20','2021-09-29 05:32:20'),(2,2,3,NULL,'2021-09-29 05:32:20','2021-09-29 05:32:20'),(2,2,4,NULL,'2021-09-29 05:32:20','2021-09-29 05:32:20'),(2,2,5,'Глава 18','2021-09-29 05:32:20','2021-09-29 05:32:20'),(2,2,6,NULL,'2021-09-29 05:32:20','2021-09-29 05:32:20'),(2,2,7,NULL,'2021-09-29 05:32:20','2021-09-29 05:32:20'),(2,2,8,NULL,'2021-09-29 05:32:20','2021-09-29 05:32:20'),(2,2,9,NULL,'2021-09-29 05:32:20','2021-09-29 05:32:20'),(2,2,10,'Глава 23','2021-09-29 05:32:20','2021-09-29 05:32:20'),(2,2,11,NULL,'2021-09-29 05:32:20','2021-09-29 05:32:20'),(2,2,12,NULL,'2021-09-29 05:32:20','2021-09-29 05:32:20'),(2,2,13,'Глава 26','2021-09-29 05:32:20','2021-09-29 05:32:20'),(2,3,1,'Глава 27','2021-09-29 05:33:06','2021-09-29 05:33:06'),(2,3,2,NULL,'2021-09-29 05:33:06','2021-09-29 05:33:06'),(2,3,3,NULL,'2021-09-29 05:33:06','2021-09-29 05:33:06'),(2,3,4,NULL,'2021-09-29 05:33:06','2021-09-29 05:33:06'),(2,3,5,'Глава 30','2021-09-29 05:33:06','2021-09-29 05:33:06'),(2,3,6,NULL,'2021-09-29 05:33:06','2021-09-29 05:33:06'),(2,3,7,NULL,'2021-09-29 05:33:06','2021-09-29 05:33:06'),(2,3,8,NULL,'2021-09-29 05:33:06','2021-09-29 05:33:06'),(2,3,9,NULL,'2021-09-29 05:33:06','2021-09-29 05:33:06'),(2,3,10,'Глава 35','2021-09-29 05:33:06','2021-09-29 05:33:06'),(2,3,11,NULL,'2021-09-29 05:33:06','2021-09-29 05:33:06'),(2,3,12,NULL,'2021-09-29 05:33:06','2021-09-29 05:33:06'),(2,3,13,'Глава 39','2021-09-29 05:33:06','2021-09-29 05:33:06'),(2,4,1,'Глава 40','2021-09-29 05:34:33','2021-09-29 05:34:33'),(2,4,2,NULL,'2021-09-29 05:34:33','2021-09-29 05:34:33'),(2,4,3,NULL,'2021-09-29 05:34:33','2021-09-29 05:34:33'),(2,4,4,NULL,'2021-09-29 05:34:33','2021-09-29 05:34:33'),(2,4,5,'Глава 44','2021-09-29 05:34:33','2021-09-29 05:34:33'),(2,4,6,NULL,'2021-09-29 05:34:33','2021-09-29 05:34:33'),(2,4,7,NULL,'2021-09-29 05:34:33','2021-09-29 05:34:33'),(2,4,8,NULL,'2021-09-29 05:34:33','2021-09-29 05:34:33'),(2,4,9,NULL,'2021-09-29 05:34:33','2021-09-29 05:34:33'),(2,4,10,'Глава 49','2021-09-29 05:34:33','2021-09-29 05:34:33'),(2,4,11,NULL,'2021-09-29 05:34:33','2021-09-29 05:34:33'),(2,4,12,NULL,'2021-09-29 05:34:33','2021-09-29 05:34:33'),(2,4,13,'Глава 52','2021-09-29 05:34:33','2021-09-29 05:34:33'),(2,5,1,'Глава 53','2021-09-29 05:35:15','2021-09-29 05:35:15'),(2,5,2,NULL,'2021-09-29 05:35:15','2021-09-29 05:35:15'),(2,5,3,NULL,'2021-09-29 05:35:15','2021-09-29 05:35:15'),(2,5,4,NULL,'2021-09-29 05:35:15','2021-09-29 05:35:15'),(2,5,5,'Глава 57','2021-09-29 05:35:15','2021-09-29 05:35:15'),(2,5,6,NULL,'2021-09-29 05:35:15','2021-09-29 05:35:15'),(2,5,7,NULL,'2021-09-29 05:35:15','2021-09-29 05:35:15'),(2,5,8,NULL,'2021-09-29 05:35:15','2021-09-29 05:35:15'),(2,5,9,NULL,'2021-09-29 05:35:15','2021-09-29 05:35:15'),(2,5,10,'Глава 62','2021-09-29 05:35:15','2021-09-29 05:35:15'),(2,5,11,NULL,'2021-09-29 05:35:15','2021-09-29 05:35:15'),(2,5,12,NULL,'2021-09-29 05:35:15','2021-09-29 05:35:15'),(2,5,13,'Глава 65','2021-09-29 05:35:15','2021-09-29 05:35:15'),(2,6,1,'Глава 66','2021-09-29 05:36:06','2021-09-29 05:36:06'),(2,6,2,NULL,'2021-09-29 05:36:06','2021-09-29 05:36:06'),(2,6,3,NULL,'2021-09-29 05:36:06','2021-09-29 05:36:06'),(2,6,4,NULL,'2021-09-29 05:36:06','2021-09-29 05:36:06'),(2,6,5,'Глава 70','2021-09-29 05:36:06','2021-09-29 05:36:06'),(2,6,6,NULL,'2021-09-29 05:36:06','2021-09-29 05:36:06'),(2,6,7,NULL,'2021-09-29 05:36:06','2021-09-29 05:36:06'),(2,6,8,NULL,'2021-09-29 05:36:06','2021-09-29 05:36:06'),(2,6,9,NULL,'2021-09-29 05:36:06','2021-09-29 05:36:06'),(2,6,10,'Глава 74','2021-09-29 05:36:06','2021-09-29 05:36:06'),(2,6,11,NULL,'2021-09-29 05:36:06','2021-09-29 05:36:06'),(2,6,12,NULL,'2021-09-29 05:36:06','2021-09-29 05:36:06'),(2,6,13,'Глава 78','2021-09-29 05:36:06','2021-09-29 05:36:06'),(8,1,1,NULL,'2021-09-29 05:40:17','2021-09-29 05:40:17'),(8,1,2,'Кот в мешке…','2021-09-29 05:40:17','2021-09-29 05:40:17'),(8,1,3,NULL,'2021-09-29 05:40:17','2021-09-29 05:40:17'),(8,1,4,NULL,'2021-09-29 05:40:17','2021-09-29 05:40:17'),(8,1,5,'Раковый больной','2021-09-29 05:40:17','2021-09-29 05:40:17'),(8,1,6,NULL,'2021-09-29 05:40:17','2021-09-29 05:40:17'),(8,1,7,NULL,'2021-09-29 05:40:17','2021-09-29 05:40:17'),(8,2,1,NULL,'2021-09-29 05:41:31','2021-09-29 05:41:31'),(8,2,2,NULL,'2021-09-29 05:41:31','2021-09-29 05:41:31'),(8,2,3,NULL,'2021-09-29 05:41:31','2021-09-29 05:41:31'),(8,2,4,NULL,'2021-09-29 05:41:31','2021-09-29 05:41:31'),(8,2,5,NULL,'2021-09-29 05:41:31','2021-09-29 05:41:31'),(8,2,6,NULL,'2021-09-29 05:41:31','2021-09-29 05:41:31'),(8,2,7,NULL,'2021-09-29 05:41:31','2021-09-29 05:41:31'),(8,2,8,NULL,'2021-09-29 05:41:31','2021-09-29 05:41:31'),(8,2,9,NULL,'2021-09-29 05:41:31','2021-09-29 05:41:31'),(8,2,10,NULL,'2021-09-29 05:41:31','2021-09-29 05:41:31'),(8,2,11,NULL,'2021-09-29 05:41:31','2021-09-29 05:41:31'),(8,2,12,NULL,'2021-09-29 05:41:31','2021-09-29 05:41:31'),(8,2,13,NULL,'2021-09-29 05:41:31','2021-09-29 05:41:31'),(8,3,1,NULL,'2021-09-29 05:42:25','2021-09-29 05:42:25'),(8,3,2,NULL,'2021-09-29 05:42:25','2021-09-29 05:42:25'),(8,3,3,NULL,'2021-09-29 05:42:25','2021-09-29 05:42:25'),(8,3,4,NULL,'2021-09-29 05:42:25','2021-09-29 05:42:25'),(8,3,5,NULL,'2021-09-29 05:42:25','2021-09-29 05:42:25'),(8,3,6,NULL,'2021-09-29 05:42:25','2021-09-29 05:42:25'),(8,3,7,NULL,'2021-09-29 05:42:25','2021-09-29 05:42:25'),(8,3,8,NULL,'2021-09-29 05:42:25','2021-09-29 05:42:25'),(8,3,9,NULL,'2021-09-29 05:42:25','2021-09-29 05:42:25'),(8,3,10,NULL,'2021-09-29 05:42:25','2021-09-29 05:42:25'),(8,3,11,NULL,'2021-09-29 05:42:25','2021-09-29 05:42:25'),(8,3,12,NULL,'2021-09-29 05:42:25','2021-09-29 05:42:25'),(8,3,13,NULL,'2021-09-29 05:42:25','2021-09-29 05:42:25'),(8,4,1,NULL,'2021-09-29 05:56:30','2021-09-29 05:56:30'),(8,4,2,NULL,'2021-09-29 05:56:30','2021-09-29 05:56:30'),(8,4,3,NULL,'2021-09-29 05:56:30','2021-09-29 05:56:30'),(8,4,4,NULL,'2021-09-29 05:56:30','2021-09-29 05:56:30'),(8,4,5,NULL,'2021-09-29 05:56:30','2021-09-29 05:56:30'),(8,4,6,NULL,'2021-09-29 05:56:30','2021-09-29 05:56:30'),(8,4,7,NULL,'2021-09-29 05:56:30','2021-09-29 05:56:30'),(8,4,8,NULL,'2021-09-29 05:56:30','2021-09-29 05:56:30'),(8,4,9,NULL,'2021-09-29 05:56:30','2021-09-29 05:56:30'),(8,4,10,NULL,'2021-09-29 05:56:30','2021-09-29 05:56:30'),(8,4,11,NULL,'2021-09-29 05:56:30','2021-09-29 05:56:30'),(8,4,12,NULL,'2021-09-29 05:56:30','2021-09-29 05:56:30'),(8,4,13,NULL,'2021-09-29 05:56:30','2021-09-29 05:56:30'),(8,5,1,NULL,'2021-09-29 05:57:11','2021-09-29 05:57:11'),(8,5,2,NULL,'2021-09-29 05:57:11','2021-09-29 05:57:11'),(8,5,3,NULL,'2021-09-29 05:57:11','2021-09-29 05:57:11'),(8,5,4,NULL,'2021-09-29 05:57:11','2021-09-29 05:57:11'),(8,5,5,NULL,'2021-09-29 05:57:11','2021-09-29 05:57:11'),(8,5,6,NULL,'2021-09-29 05:57:11','2021-09-29 05:57:11'),(8,5,7,NULL,'2021-09-29 05:57:11','2021-09-29 05:57:11'),(8,5,8,NULL,'2021-09-29 05:57:11','2021-09-29 05:57:11'),(8,5,9,NULL,'2021-09-29 05:57:11','2021-09-29 05:57:11'),(8,5,10,NULL,'2021-09-29 05:57:11','2021-09-29 05:57:11'),(8,5,11,NULL,'2021-09-29 05:57:11','2021-09-29 05:57:11'),(8,5,12,NULL,'2021-09-29 05:57:11','2021-09-29 05:57:11'),(8,5,13,NULL,'2021-09-29 05:57:11','2021-09-29 05:57:11'),(8,5,14,NULL,'2021-09-29 05:57:24','2021-09-29 05:57:24'),(8,5,15,NULL,'2021-09-29 05:57:24','2021-09-29 05:57:24'),(8,5,16,NULL,'2021-09-29 05:57:24','2021-09-29 05:57:24'),(9,5,1,NULL,'2021-09-29 05:59:03','2021-09-29 05:59:03'),(9,5,2,NULL,'2021-09-29 05:59:03','2021-09-29 05:59:03'),(9,5,3,NULL,'2021-09-29 05:59:03','2021-09-29 05:59:03'),(9,5,4,NULL,'2021-09-29 05:59:03','2021-09-29 05:59:03'),(9,5,5,NULL,'2021-09-29 05:59:03','2021-09-29 05:59:03'),(9,5,6,NULL,'2021-09-29 05:59:03','2021-09-29 05:59:03'),(9,5,7,NULL,'2021-09-29 05:59:03','2021-09-29 05:59:03'),(9,5,8,NULL,'2021-09-29 05:59:03','2021-09-29 05:59:03'),(9,5,9,NULL,'2021-09-29 05:59:03','2021-09-29 05:59:03'),(9,5,10,NULL,'2021-09-29 05:59:03','2021-09-29 05:59:03'),(9,5,11,NULL,'2021-09-29 05:59:03','2021-09-29 05:59:03'),(9,5,12,NULL,'2021-09-29 05:59:03','2021-09-29 05:59:03'),(9,5,13,NULL,'2021-09-29 05:59:03','2021-09-29 05:59:03'),(9,6,1,NULL,'2021-09-29 05:59:26','2021-09-29 05:59:26'),(9,6,2,NULL,'2021-09-29 05:59:26','2021-09-29 05:59:26'),(9,6,3,NULL,'2021-09-29 05:59:26','2021-09-29 05:59:26'),(9,6,4,NULL,'2021-09-29 05:59:26','2021-09-29 05:59:26'),(9,6,5,NULL,'2021-09-29 05:59:26','2021-09-29 05:59:26'),(9,6,6,NULL,'2021-09-29 05:59:26','2021-09-29 05:59:26'),(9,6,7,NULL,'2021-09-29 05:59:26','2021-09-29 05:59:26'),(9,6,8,NULL,'2021-09-29 05:59:26','2021-09-29 05:59:26'),(9,6,9,NULL,'2021-09-29 05:59:26','2021-09-29 05:59:26'),(9,6,10,NULL,'2021-09-29 05:59:26','2021-09-29 05:59:26'),(9,6,11,NULL,'2021-09-29 05:59:26','2021-09-29 05:59:26'),(9,6,12,NULL,'2021-09-29 05:59:26','2021-09-29 05:59:26'),(9,6,13,NULL,'2021-09-29 05:59:26','2021-09-29 05:59:26'),(9,4,1,NULL,'2021-09-29 05:59:52','2021-09-29 05:59:52'),(9,4,2,NULL,'2021-09-29 05:59:52','2021-09-29 05:59:52'),(9,4,3,NULL,'2021-09-29 05:59:52','2021-09-29 05:59:52'),(9,4,4,NULL,'2021-09-29 05:59:52','2021-09-29 05:59:52'),(9,4,5,NULL,'2021-09-29 05:59:52','2021-09-29 05:59:52'),(9,4,6,NULL,'2021-09-29 05:59:52','2021-09-29 05:59:52'),(9,4,7,NULL,'2021-09-29 05:59:52','2021-09-29 05:59:52'),(9,4,8,NULL,'2021-09-29 05:59:52','2021-09-29 05:59:52'),(9,4,9,NULL,'2021-09-29 05:59:52','2021-09-29 05:59:52'),(9,4,10,NULL,'2021-09-29 05:59:52','2021-09-29 05:59:52'),(9,3,1,NULL,'2021-09-29 06:00:06','2021-09-29 06:00:06'),(9,3,2,NULL,'2021-09-29 06:00:06','2021-09-29 06:00:06'),(9,3,3,NULL,'2021-09-29 06:00:06','2021-09-29 06:00:06'),(9,3,4,NULL,'2021-09-29 06:00:06','2021-09-29 06:00:06'),(9,3,5,NULL,'2021-09-29 06:00:06','2021-09-29 06:00:06'),(9,3,6,NULL,'2021-09-29 06:00:06','2021-09-29 06:00:06'),(9,3,7,NULL,'2021-09-29 06:00:06','2021-09-29 06:00:06'),(9,3,8,NULL,'2021-09-29 06:00:06','2021-09-29 06:00:06'),(9,3,9,NULL,'2021-09-29 06:00:06','2021-09-29 06:00:06'),(9,3,10,NULL,'2021-09-29 06:00:06','2021-09-29 06:00:06'),(9,2,1,NULL,'2021-09-29 06:00:25','2021-09-29 06:00:25'),(9,2,2,NULL,'2021-09-29 06:00:25','2021-09-29 06:00:25'),(9,2,3,NULL,'2021-09-29 06:00:25','2021-09-29 06:00:25'),(9,2,4,NULL,'2021-09-29 06:00:25','2021-09-29 06:00:25'),(9,2,5,NULL,'2021-09-29 06:00:25','2021-09-29 06:00:25'),(9,2,6,NULL,'2021-09-29 06:00:25','2021-09-29 06:00:25'),(9,2,7,NULL,'2021-09-29 06:00:25','2021-09-29 06:00:25'),(9,2,8,NULL,'2021-09-29 06:00:25','2021-09-29 06:00:25'),(9,2,9,NULL,'2021-09-29 06:00:25','2021-09-29 06:00:25'),(9,2,10,NULL,'2021-09-29 06:00:25','2021-09-29 06:00:25'),(9,1,1,NULL,'2021-09-29 06:00:44','2021-09-29 06:00:44'),(9,1,2,NULL,'2021-09-29 06:00:44','2021-09-29 06:00:44'),(9,1,3,NULL,'2021-09-29 06:00:44','2021-09-29 06:00:44'),(9,1,4,NULL,'2021-09-29 06:00:44','2021-09-29 06:00:44'),(9,1,5,NULL,'2021-09-29 06:00:44','2021-09-29 06:00:44'),(9,1,6,NULL,'2021-09-29 06:00:44','2021-09-29 06:00:44'),(9,1,7,NULL,'2021-09-29 06:00:44','2021-09-29 06:00:44'),(9,1,8,NULL,'2021-09-29 06:00:44','2021-09-29 06:00:44'),(9,1,9,NULL,'2021-09-29 06:00:44','2021-09-29 06:00:44'),(9,1,10,NULL,'2021-09-29 06:00:44','2021-09-29 06:00:44'),(19,1,1,NULL,'2021-10-04 03:12:16','2021-10-04 03:12:16'),(19,1,2,NULL,'2021-10-04 03:12:16','2021-10-04 03:12:16'),(19,1,3,NULL,'2021-10-04 03:12:16','2021-10-04 03:12:16'),(19,1,4,NULL,'2021-10-04 03:12:16','2021-10-04 03:12:16'),(19,1,5,NULL,'2021-10-04 03:12:16','2021-10-04 03:12:16'),(19,1,6,NULL,'2021-10-04 03:12:16','2021-10-04 03:12:16'),(19,1,7,NULL,'2021-10-04 03:12:16','2021-10-04 03:12:16'),(19,1,8,NULL,'2021-10-04 03:12:16','2021-10-04 03:12:16'),(20,1,1,NULL,'2021-10-04 03:12:51','2021-10-04 03:12:51'),(20,1,2,NULL,'2021-10-04 03:12:51','2021-10-04 03:12:51'),(20,1,3,NULL,'2021-10-04 03:12:51','2021-10-04 03:12:51'),(20,1,4,NULL,'2021-10-04 03:12:51','2021-10-04 03:12:51'),(20,1,5,NULL,'2021-10-04 03:12:51','2021-10-04 03:12:51'),(20,1,6,NULL,'2021-10-04 03:12:51','2021-10-04 03:12:51'),(20,1,7,NULL,'2021-10-04 03:12:51','2021-10-04 03:12:51'),(20,1,8,NULL,'2021-10-04 03:12:51','2021-10-04 03:12:51'),(20,1,9,NULL,'2021-10-04 03:12:51','2021-10-04 03:12:51'),(20,1,10,NULL,'2021-10-04 03:12:51','2021-10-04 03:12:51'),(20,2,1,NULL,'2021-10-04 03:13:15','2021-10-04 03:13:15'),(20,2,2,NULL,'2021-10-04 03:13:15','2021-10-04 03:13:15'),(20,2,3,NULL,'2021-10-04 03:13:15','2021-10-04 03:13:15'),(20,2,4,NULL,'2021-10-04 03:13:15','2021-10-04 03:13:15'),(20,2,5,NULL,'2021-10-04 03:13:15','2021-10-04 03:13:15'),(20,2,6,NULL,'2021-10-04 03:13:15','2021-10-04 03:13:15'),(20,2,7,NULL,'2021-10-04 03:13:15','2021-10-04 03:13:15'),(20,2,8,NULL,'2021-10-04 03:13:15','2021-10-04 03:13:15'),(20,2,9,NULL,'2021-10-04 03:13:15','2021-10-04 03:13:15'),(20,2,10,NULL,'2021-10-04 03:13:15','2021-10-04 03:13:15'),(20,3,1,NULL,'2021-10-04 03:13:38','2021-10-04 03:13:38'),(20,3,2,NULL,'2021-10-04 03:13:38','2021-10-04 03:13:38'),(20,3,3,NULL,'2021-10-04 03:13:38','2021-10-04 03:13:38'),(20,3,4,NULL,'2021-10-04 03:13:38','2021-10-04 03:13:38'),(20,3,5,NULL,'2021-10-04 03:13:38','2021-10-04 03:13:38'),(20,3,6,NULL,'2021-10-04 03:13:38','2021-10-04 03:13:38'),(20,3,7,NULL,'2021-10-04 03:13:38','2021-10-04 03:13:38'),(20,3,8,NULL,'2021-10-04 03:13:38','2021-10-04 03:13:38'),(20,3,9,NULL,'2021-10-04 03:13:38','2021-10-04 03:13:38'),(20,3,10,NULL,'2021-10-04 03:13:38','2021-10-04 03:13:38');
/*!40000 ALTER TABLE `serials_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` char(11) NOT NULL,
  `password_hash` char(65) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `phone` (`phone`),
  KEY `email_2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Максим','Василенко','maxvasilenko@mail.ru','89995432111',NULL,'2021-09-21 15:21:38'),(2,'Данил','Белиоглов','danyasvoi@mail.ru','89875432111','svoi979','2021-09-21 15:21:38'),(3,'Никита','Шитяков','shityadrift@mail.ru','89875434891','85456216428','2021-09-21 15:21:38'),(4,'Дима','Денискин','dimabpan@mail.ru','89875434121','hash555','2021-09-21 15:21:38'),(5,'Данил','Донской','danybmx@mail.ru','89874562111','parol123','2021-09-21 15:21:38'),(6,'Дарья','Дьяченко','dashaway@mail.ru','89994352111',NULL,'2021-09-21 15:26:05'),(7,'Полина','Сопельцева','polinkamalinka@mail.ru','89827432111','svoi979','2021-09-21 15:26:05'),(8,'Яна','Семердак','smrdkyanka@mail.ru','89875434691','85456216428','2021-09-21 15:26:05'),(9,'Настя','Борисова','nastushka@mail.ru','89875434179','hash555','2021-09-21 15:26:05'),(10,'Катя','Кукушкина','katyache@mail.ru','89874428111','parol123','2021-09-21 15:26:05'),(11,'Алёна','Карпенко','alenakarpenko@mail.ru','89785432111',NULL,'2021-10-06 05:53:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `new_movies_v`
--

/*!50001 DROP VIEW IF EXISTS `new_movies_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_movies_v` (`name`,`duration`) AS select `movies`.`name` AS `name`,`movies`.`duration` AS `duration` from `movies` where (`movies`.`created_at` = 2021) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ratings_v`
--

/*!50001 DROP VIEW IF EXISTS `ratings_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ratings_v` (`name`,`rating`) AS select `m`.`name` AS `name`,(sum(`r`.`rating`) / count(`r`.`rating`)) AS `(sum(r.rating) / count(r.rating))` from (`ratings` `r` join `movies` `m` on((`m`.`id` = `r`.`movie_id`))) group by `m`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-06 22:19:21
