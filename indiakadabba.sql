-- MySQL dump 10.13  Distrib 5.6.27, for osx10.10 (x86_64)
--
-- Host: localhost    Database: groups_development
-- ------------------------------------------------------
-- Server version	5.6.27

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
-- Table structure for table `active_admin_comments`
--

DROP TABLE IF EXISTS `active_admin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_admin_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) DEFAULT NULL,
  `body` text,
  `resource_id` varchar(255) NOT NULL,
  `resource_type` varchar(255) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`),
  KEY `index_active_admin_comments_on_resource_type_and_resource_id` (`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_admin_comments`
--

LOCK TABLES `active_admin_comments` WRITE;
/*!40000 ALTER TABLE `active_admin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_admin_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin@example.com','$2a$10$oC54EGSeTDi8Wf.TPrVPBerrd0yLqNlNdF1WoISMO5Aa7U9HwS50y',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-12-30 23:24:04','2015-12-30 23:24:04');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `owner_type` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (1,5,'Cart',1,1,'Menu',100,'2015-12-30 23:31:01','2015-12-30 23:31:01'),(2,6,'Cart',1,1,'Menu',100,'2015-12-30 23:33:49','2015-12-30 23:33:49'),(3,1,'Cart',1,5,'Menu',100,'2015-12-30 23:41:52','2015-12-30 23:41:52'),(4,1,'Cart',1,6,'Menu',100,'2015-12-30 23:41:56','2015-12-30 23:41:56');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'2015-12-30 23:24:26','2015-12-30 23:24:26'),(2,'2015-12-30 23:24:54','2015-12-30 23:24:54'),(3,'2015-12-30 23:29:57','2015-12-30 23:29:57'),(4,'2015-12-30 23:30:47','2015-12-30 23:30:47'),(5,'2015-12-30 23:31:00','2015-12-30 23:31:00'),(6,'2015-12-30 23:33:49','2015-12-30 23:33:49'),(7,'2016-01-10 23:39:06','2016-01-10 23:39:06'),(8,'2016-01-10 23:40:49','2016-01-10 23:40:49'),(9,'2016-01-10 23:40:49','2016-01-10 23:40:49'),(10,'2016-01-10 23:41:30','2016-01-10 23:41:30'),(11,'2016-01-10 23:41:30','2016-01-10 23:41:30'),(12,'2016-01-10 23:42:04','2016-01-10 23:42:04'),(13,'2016-01-10 23:42:04','2016-01-10 23:42:04');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chefs`
--

DROP TABLE IF EXISTS `chefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chefs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chefs`
--

LOCK TABLES `chefs` WRITE;
/*!40000 ALTER TABLE `chefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `chefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupans`
--

DROP TABLE IF EXISTS `coupans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `exppires_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `applied` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupans`
--

LOCK TABLES `coupans` WRITE;
/*!40000 ALTER TABLE `coupans` DISABLE KEYS */;
INSERT INTO `coupans` VALUES (1,'2015-12-30 23:24:19','2015-12-30 23:24:19','WELCOME','percent',20,NULL,NULL,NULL),(2,'2015-12-30 23:24:19','2015-12-30 23:24:19','WELCOME50','absolute',50,NULL,NULL,NULL);
/*!40000 ALTER TABLE `coupans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `contact_detail` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'2015-12-30 23:24:19','2015-12-30 23:24:19','street1','landmark1','city1','SB Road'),(2,'2015-12-30 23:24:19','2015-12-30 23:24:19','street2','landmark2','city2','JM Road'),(3,'2015-12-30 23:24:19','2015-12-30 23:24:19','street3','landmark3','city3','Shivaji Nagar'),(4,'2015-12-30 23:24:19','2015-12-30 23:24:19','street4','landmark4','city4','Wakewadi'),(5,'2015-12-30 23:24:19','2015-12-30 23:24:19','street5','landmark5','city5','E-Square'),(6,'2015-12-30 23:24:19','2015-12-30 23:24:19','street6','landmark6','city6','Kasbapeth'),(7,'2015-12-30 23:24:19','2015-12-30 23:24:19','street7','landmark7','city7','COEP Hostels'),(8,'2015-12-30 23:24:19','2015-12-30 23:24:19','street8','landmark8','city8','Deccan Gymkhana'),(9,'2015-12-30 23:24:19','2015-12-30 23:24:19','street9','landmark9','city9',NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `menu_type` varchar(255) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'2015-12-30 23:24:19','2015-12-30 23:24:19','veg briyani',100,'veg','rice',NULL),(2,'2015-12-30 23:24:19','2015-12-30 23:24:19','chicken briyani',100,'non-veg','rice',NULL),(3,'2015-12-30 23:24:19','2015-12-30 23:24:19','fried rice',100,'veg','rice',NULL),(4,'2015-12-30 23:24:19','2015-12-30 23:24:19','chicken fried rice',100,'non-veg','rice',NULL),(5,'2015-12-30 23:24:19','2015-12-30 23:24:19','aaloo paratha',100,'veg','paratha',NULL),(6,'2015-12-30 23:24:19','2015-12-30 23:24:19','gobhi paratha',100,'veg','paratha',NULL),(7,'2015-12-30 23:24:19','2015-12-30 23:24:19','paneer butter masala',100,'veg','gravy',NULL),(8,'2015-12-30 23:24:19','2015-12-30 23:24:19','paneer tikka',100,'veg','gravy',NULL),(9,'2015-12-30 23:24:19','2015-12-30 23:24:19','butter chicken',100,'non-veg','gravy',NULL),(10,'2015-12-30 23:24:19','2015-12-30 23:24:19','hyderabadi chicken',100,'non-veg','gravy',NULL);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `summery` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `instruction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_orders`
--

DROP TABLE IF EXISTS `party_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `contact_detail` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` varchar(255) DEFAULT 'requested',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_orders`
--

LOCK TABLES `party_orders` WRITE;
/*!40000 ALTER TABLE `party_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `party_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150920200412'),('20150920204238'),('20150920204254'),('20150920204306'),('20150920204319'),('20150920204338'),('20150920204349'),('20150920210810'),('20150920210816'),('20150924075357'),('20150924075733'),('20150924075909'),('20150925085124'),('20150925093804'),('20150925101757'),('20150925102109'),('20151002154223'),('20151002154246'),('20151002173748'),('20151002174106'),('20151002180301'),('20151002181627'),('20151002185532'),('20151002194712'),('20151002194804'),('20151002205103'),('20151003004017'),('20151003061718'),('20151003150228'),('20151005040654'),('20151005041039'),('20151005153139'),('20151005155011'),('20151005200647'),('20151009062834'),('20151009080546'),('20151009134039'),('20151009210151'),('20151030174906'),('20151030175109'),('20151030202018'),('20151030202226'),('20151030204913'),('20151102181457');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_addresses`
--

DROP TABLE IF EXISTS `shipping_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `addrss1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_addresses`
--

LOCK TABLES `shipping_addresses` WRITE;
/*!40000 ALTER TABLE `shipping_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_frames`
--

DROP TABLE IF EXISTS `time_frames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_frames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(255) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_frames`
--

LOCK TABLES `time_frames` WRITE;
/*!40000 ALTER TABLE `time_frames` DISABLE KEYS */;
INSERT INTO `time_frames` VALUES (1,'7AM - 8 AM',1,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(2,'8AM - 9AM',1,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(3,'10AM - 11AM',1,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(4,'11AM - 12PM',1,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(5,'12PM - 1PM',1,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(6,'1PM - 2PM',1,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(7,'2PM - 3PM',1,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(8,'7 PM-8 PM',1,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(9,'8PM - 9PM',1,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(10,'9PM - 10PM',1,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(11,'7AM - 8 AM',2,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(12,'8AM - 9AM',2,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(13,'10AM - 11AM',2,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(14,'11AM - 12PM',2,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(15,'12PM - 1PM',2,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(16,'1PM - 2PM',2,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(17,'2PM - 3PM',2,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(18,'7 PM-8 PM',2,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(19,'8PM - 9PM',2,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(20,'9PM - 10PM',2,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(21,'7AM - 8 AM',3,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(22,'8AM - 9AM',3,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(23,'10AM - 11AM',3,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(24,'11AM - 12PM',3,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(25,'12PM - 1PM',3,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(26,'1PM - 2PM',3,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(27,'2PM - 3PM',3,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(28,'7 PM-8 PM',3,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(29,'8PM - 9PM',3,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(30,'9PM - 10PM',3,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(31,'7AM - 8 AM',4,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(32,'8AM - 9AM',4,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(33,'10AM - 11AM',4,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(34,'11AM - 12PM',4,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(35,'12PM - 1PM',4,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(36,'1PM - 2PM',4,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(37,'2PM - 3PM',4,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(38,'7 PM-8 PM',4,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(39,'8PM - 9PM',4,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(40,'9PM - 10PM',4,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(41,'7AM - 8 AM',5,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(42,'8AM - 9AM',5,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(43,'10AM - 11AM',5,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(44,'11AM - 12PM',5,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(45,'12PM - 1PM',5,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(46,'1PM - 2PM',5,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(47,'2PM - 3PM',5,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(48,'7 PM-8 PM',5,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(49,'8PM - 9PM',5,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(50,'9PM - 10PM',5,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(51,'7AM - 8 AM',6,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(52,'8AM - 9AM',6,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(53,'10AM - 11AM',6,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(54,'11AM - 12PM',6,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(55,'12PM - 1PM',6,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(56,'1PM - 2PM',6,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(57,'2PM - 3PM',6,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(58,'7 PM-8 PM',6,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(59,'8PM - 9PM',6,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(60,'9PM - 10PM',6,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(61,'7AM - 8 AM',7,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(62,'8AM - 9AM',7,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(63,'10AM - 11AM',7,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(64,'11AM - 12PM',7,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(65,'12PM - 1PM',7,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(66,'1PM - 2PM',7,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(67,'2PM - 3PM',7,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(68,'7 PM-8 PM',7,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(69,'8PM - 9PM',7,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(70,'9PM - 10PM',7,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(71,'7AM - 8 AM',8,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(72,'8AM - 9AM',8,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(73,'10AM - 11AM',8,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(74,'11AM - 12PM',8,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(75,'12PM - 1PM',8,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(76,'1PM - 2PM',8,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(77,'2PM - 3PM',8,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(78,'7 PM-8 PM',8,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(79,'8PM - 9PM',8,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(80,'9PM - 10PM',8,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(81,'7AM - 8 AM',9,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(82,'8AM - 9AM',9,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(83,'10AM - 11AM',9,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(84,'11AM - 12PM',9,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(85,'12PM - 1PM',9,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(86,'1PM - 2PM',9,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(87,'2PM - 3PM',9,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(88,'7 PM-8 PM',9,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(89,'8PM - 9PM',9,'2015-12-30 23:24:19','2015-12-30 23:24:19'),(90,'9PM - 10PM',9,'2015-12-30 23:24:19','2015-12-30 23:24:19');
/*!40000 ALTER TABLE `time_frames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `VerificationStatus` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-07 15:16:14
