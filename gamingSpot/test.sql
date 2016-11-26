-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: gamingSpot
-- ------------------------------------------------------
-- Server version	5.7.15-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user',1,'add_myuser'),(2,'Can change user',1,'change_myuser'),(3,'Can delete user',1,'delete_myuser'),(4,'Can add order',2,'add_order'),(5,'Can change order',2,'change_order'),(6,'Can delete order',2,'delete_order'),(7,'Can add product',3,'add_product'),(8,'Can change product',3,'change_product'),(9,'Can delete product',3,'delete_product'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add permission',5,'add_permission'),(14,'Can change permission',5,'change_permission'),(15,'Can delete permission',5,'delete_permission'),(16,'Can add content type',6,'add_contenttype'),(17,'Can change content type',6,'change_contenttype'),(18,'Can delete content type',6,'delete_contenttype'),(19,'Can add session',7,'add_session'),(20,'Can change session',7,'change_session'),(21,'Can delete session',7,'delete_session'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_shop_myuser_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_shop_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `shop_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-11-25 19:58:32.989535','1','Razer Abyssus 2000',1,'[{\"added\": {}}]',3,1),(2,'2016-11-25 20:00:30.130217','2','Steelseries Siberia 350 Gaming Headset (White)',1,'[{\"added\": {}}]',3,1),(3,'2016-11-25 20:22:24.651970','1','Razer Abyssus 2000',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',3,1),(4,'2016-11-25 20:23:30.297137','2','Steelseries Siberia 350 Gaming Headset (White)',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',3,1),(5,'2016-11-25 20:27:27.912877','2','Steelseries Siberia 350 Gaming Headset (White)',2,'[]',3,1),(6,'2016-11-25 20:34:36.640048','2','Steelseries Siberia 350',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',3,1),(7,'2016-11-25 21:09:57.325995','2','Steelseries Siberia 350',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',3,1),(8,'2016-11-25 21:10:10.227775','1','Razer Abyssus 2000',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',3,1),(9,'2016-11-25 21:11:46.048401','1','Razer Abyssus 2000',2,'[]',3,1),(10,'2016-11-25 21:11:58.951620','1','Razer Abyssus 2000',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',3,1),(11,'2016-11-25 21:12:28.515285','1','Razer Abyssus 2000',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',3,1),(12,'2016-11-25 21:24:50.774426','1','Razer Abyssus 2000',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',3,1),(13,'2016-11-25 21:25:03.385289','2','Steelseries Siberia 350',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',3,1),(14,'2016-11-25 21:30:31.898023','3','Corsair K70 LUX Cherry MX RGB',1,'[{\"added\": {}}]',3,1),(15,'2016-11-25 21:38:12.329665','4','Steelseries Rival 300',1,'[{\"added\": {}}]',3,1),(16,'2016-11-25 22:04:11.630578','5','Corsair MM800 POLARIS RGB Gaming Mousepad',1,'[{\"added\": {}}]',3,1),(17,'2016-11-25 22:04:54.891190','6','Corsair MM800 POLARIS RGB',1,'[{\"added\": {}}]',3,1),(18,'2016-11-25 22:05:28.280000','5','Corsair MM800 POLARIS RGB Gaming Mousepad',3,'',3,1),(19,'2016-11-25 22:08:19.790734','7','Logitech F310',1,'[{\"added\": {}}]',3,1),(20,'2016-11-25 22:12:45.572978','8','Razer BlackWidow Ultimate 2016 (key-thai , Green-S',1,'[{\"added\": {}}]',3,1),(21,'2016-11-25 22:14:14.593359','8','Razer BlackWidow Ultimate 2016 (key-thai , Green-S',3,'',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'admin','logentry'),(4,'auth','group'),(5,'auth','permission'),(6,'contenttypes','contenttype'),(7,'sessions','session'),(1,'shop','myuser'),(2,'shop','order'),(3,'shop','product');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-11-16 07:20:16.429695'),(2,'contenttypes','0002_remove_content_type_name','2016-11-16 07:20:16.528562'),(3,'auth','0001_initial','2016-11-16 07:20:16.935376'),(4,'auth','0002_alter_permission_name_max_length','2016-11-16 07:20:16.948387'),(5,'auth','0003_alter_user_email_max_length','2016-11-16 07:20:16.960444'),(6,'auth','0004_alter_user_username_opts','2016-11-16 07:20:16.975947'),(7,'auth','0005_alter_user_last_login_null','2016-11-16 07:20:16.989560'),(8,'auth','0006_require_contenttypes_0002','2016-11-16 07:20:16.994358'),(9,'auth','0007_alter_validators_add_error_messages','2016-11-16 07:20:17.009635'),(10,'auth','0008_alter_user_username_max_length','2016-11-16 07:20:17.024087'),(11,'sessions','0001_initial','2016-11-16 07:20:17.064301'),(12,'shop','0001_initial','2016-11-16 07:20:17.318482'),(13,'admin','0001_initial','2016-11-16 07:21:32.783779'),(14,'admin','0002_logentry_remove_auto_add','2016-11-16 07:21:32.809996');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('eyk9nm2ce364xo3zguz29j2daocb43zn','ZTVmOThkMTAzOTdmNmI0ZjI2N2EyYzBhYjUzMTM3YWQyZGNkZjJlODp7Il9hdXRoX3VzZXJfaGFzaCI6IjM1ZWM0Y2NhMWJhYjJlZDdhOTkzNTE3NTVjNTQ1NDdlNDhiNjkzNGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-12-05 11:43:05.708033'),('qzrxzg150prxdswut0c68kl524tdwpd1','ZTVmOThkMTAzOTdmNmI0ZjI2N2EyYzBhYjUzMTM3YWQyZGNkZjJlODp7Il9hdXRoX3VzZXJfaGFzaCI6IjM1ZWM0Y2NhMWJhYjJlZDdhOTkzNTE3NTVjNTQ1NDdlNDhiNjkzNGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-12-09 16:52:34.310268');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_myuser`
--

DROP TABLE IF EXISTS `shop_myuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_myuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `tels` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_myuser`
--

LOCK TABLES `shop_myuser` WRITE;
/*!40000 ALTER TABLE `shop_myuser` DISABLE KEYS */;
INSERT INTO `shop_myuser` VALUES (1,'pbkdf2_sha256$30000$mArQV9ddjV0R$3h0rjCm7jXbn/4bLo6uPm68W5lcFEXCcjM+u7hWHGBs=','2016-11-25 16:52:34.244769',1,'wlllsllck','','','willslick0910@gmail.com',1,1,'2016-11-16 08:45:47.929531',''),(2,'pbkdf2_sha256$30000$yQ2d9o6hy2FR$Wi/7tc2au329XTCNs8towfH/puQ+p1zbQH8xFUQdsnk=','2016-11-23 05:19:52.808621',0,'wlll','kuy','kuy','superwillkus39@hotmail.com',0,1,'2016-11-23 05:19:41.806111','191');
/*!40000 ALTER TABLE `shop_myuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_myuser_groups`
--

DROP TABLE IF EXISTS `shop_myuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_myuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_myuser_groups_myuser_id_d48e6f86_uniq` (`myuser_id`,`group_id`),
  KEY `shop_myuser_groups_group_id_138cb1a8_fk_auth_group_id` (`group_id`),
  CONSTRAINT `shop_myuser_groups_group_id_138cb1a8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `shop_myuser_groups_myuser_id_df48effe_fk_shop_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `shop_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_myuser_groups`
--

LOCK TABLES `shop_myuser_groups` WRITE;
/*!40000 ALTER TABLE `shop_myuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_myuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_myuser_user_permissions`
--

DROP TABLE IF EXISTS `shop_myuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_myuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_myuser_user_permissions_myuser_id_b744365a_uniq` (`myuser_id`,`permission_id`),
  KEY `shop_myuser_user_pe_permission_id_f0e91684_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `shop_myuser_user_pe_permission_id_f0e91684_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `shop_myuser_user_permission_myuser_id_8b0b37f5_fk_shop_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `shop_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_myuser_user_permissions`
--

LOCK TABLES `shop_myuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `shop_myuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_myuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(1) NOT NULL,
  `date` datetime(6) NOT NULL,
  `total` decimal(7,2) NOT NULL,
  `address` varchar(200) NOT NULL,
  `postcode` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `lates_update` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description_file` varchar(100) NOT NULL,
  `categories` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (1,'Razer Abyssus 2000','Razor',1190,'2016-11-25 19:53:43.000000','images/product/abyssus2014_gallery_1__store_gallery.png','description/no_description.txt','M'),(2,'Steelseries Siberia 350','Steelseries',3990,'2016-11-25 19:59:39.000000','images/product/373fea75736a412bbeccd0bbd05b9d8b.png.1000x575_q85_crop-smart.png','description/no_description.txt','H'),(3,'Corsair K70 LUX Cherry MX RGB','Corsair',6390,'2016-11-25 21:30:26.000000','images/product/K70_LUX_RGB-1.png','description/no_description.txt','K'),(4,'Steelseries Rival 300','Steelseries',2090,'2016-11-25 21:37:01.000000','images/product/steelseries-rival-300-silver-02.png','description/no_description.txt','M'),(6,'Corsair MM800 POLARIS RGB','Corsair',2990,'2016-11-25 22:02:51.000000','images/product/MM800-header_H9cpQrr.jpg','description/no_description.txt','MP'),(7,'Logitech F310','Logitech',875,'2016-11-25 22:07:01.000000','images/product/F310.png','description/no_description.txt','J');
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-26 16:19:58
