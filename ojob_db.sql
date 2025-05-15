-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: job_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add category',6,'add_category'),(22,'Can change category',6,'change_category'),(23,'Can delete category',6,'delete_category'),(24,'Can view category',6,'view_category'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add recruitment',8,'add_recruitment'),(30,'Can change recruitment',8,'change_recruitment'),(31,'Can delete recruitment',8,'delete_recruitment'),(32,'Can view recruitment',8,'view_recruitment'),(33,'Can add new',9,'add_new'),(34,'Can change new',9,'change_new'),(35,'Can delete new',9,'delete_new'),(36,'Can view new',9,'view_new'),(37,'Can add tag',10,'add_tag'),(38,'Can change tag',10,'change_tag'),(39,'Can delete tag',10,'delete_tag'),(40,'Can view tag',10,'view_tag'),(41,'Can add comment',11,'add_comment'),(42,'Can change comment',11,'change_comment'),(43,'Can delete comment',11,'delete_comment'),(44,'Can view comment',11,'view_comment'),(45,'Can add like',12,'add_like'),(46,'Can change like',12,'change_like'),(47,'Can delete like',12,'delete_like'),(48,'Can view like',12,'view_like'),(49,'Can add application',13,'add_application'),(50,'Can change application',13,'change_application'),(51,'Can delete application',13,'delete_application'),(52,'Can view application',13,'view_application'),(53,'Can add access token',14,'add_accesstoken'),(54,'Can change access token',14,'change_accesstoken'),(55,'Can delete access token',14,'delete_accesstoken'),(56,'Can view access token',14,'view_accesstoken'),(57,'Can add grant',15,'add_grant'),(58,'Can change grant',15,'change_grant'),(59,'Can delete grant',15,'delete_grant'),(60,'Can view grant',15,'view_grant'),(61,'Can add refresh token',16,'add_refreshtoken'),(62,'Can change refresh token',16,'change_refreshtoken'),(63,'Can delete refresh token',16,'delete_refreshtoken'),(64,'Can view refresh token',16,'view_refreshtoken'),(65,'Can add id token',17,'add_idtoken'),(66,'Can change id token',17,'change_idtoken'),(67,'Can delete id token',17,'delete_idtoken'),(68,'Can view id token',17,'view_idtoken'),(69,'Can add user profile',18,'add_userprofile'),(70,'Can change user profile',18,'change_userprofile'),(71,'Can delete user profile',18,'delete_userprofile'),(72,'Can view user profile',18,'view_userprofile'),(73,'Can add skill',19,'add_skill'),(74,'Can change skill',19,'change_skill'),(75,'Can delete skill',19,'delete_skill'),(76,'Can view skill',19,'view_skill');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_jobs_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_jobs_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobs_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-05-12 18:01:59.114904','1','IT',1,'[{\"added\": {}}]',6,1),(2,'2025-05-12 18:02:07.165221','2','Audit',1,'[{\"added\": {}}]',6,1),(3,'2025-05-12 18:02:23.435386','3','Marketing',1,'[{\"added\": {}}]',6,1),(4,'2025-05-12 18:03:25.479375','1','Tester',1,'[{\"added\": {}}]',8,1),(5,'2025-05-12 18:03:39.951862','2','Software Engineer',1,'[{\"added\": {}}]',8,1),(6,'2025-05-12 18:03:50.671097','3','Data Engineer',1,'[{\"added\": {}}]',8,1),(7,'2025-05-12 18:04:48.274994','1','Recruit for May',1,'[{\"added\": {}}]',9,1),(8,'2025-05-12 18:05:25.103303','2','Recruit for July',1,'[{\"added\": {}}]',9,1),(9,'2025-05-12 18:05:42.319835','3','Recruit for May',1,'[{\"added\": {}}]',9,1),(10,'2025-05-12 19:58:53.273206','4','Leader Marketing',1,'[{\"added\": {}}]',8,1),(11,'2025-05-12 20:14:03.761403','1','Django',1,'[{\"added\": {}}]',10,1),(12,'2025-05-12 20:36:58.405729','2','user1',1,'[{\"added\": {}}]',7,1),(13,'2025-05-12 20:46:00.187130','3','abcds',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'jobs','category'),(11,'jobs','comment'),(12,'jobs','like'),(9,'jobs','new'),(8,'jobs','recruitment'),(19,'jobs','skill'),(10,'jobs','tag'),(7,'jobs','user'),(18,'jobs','userprofile'),(14,'oauth2_provider','accesstoken'),(13,'oauth2_provider','application'),(15,'oauth2_provider','grant'),(17,'oauth2_provider','idtoken'),(16,'oauth2_provider','refreshtoken'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-05-12 17:47:09.598969'),(2,'contenttypes','0002_remove_content_type_name','2025-05-12 17:47:09.709181'),(3,'auth','0001_initial','2025-05-12 17:47:10.040765'),(4,'auth','0002_alter_permission_name_max_length','2025-05-12 17:47:10.111526'),(5,'auth','0003_alter_user_email_max_length','2025-05-12 17:47:10.117537'),(6,'auth','0004_alter_user_username_opts','2025-05-12 17:47:10.123675'),(7,'auth','0005_alter_user_last_login_null','2025-05-12 17:47:10.129354'),(8,'auth','0006_require_contenttypes_0002','2025-05-12 17:47:10.133362'),(9,'auth','0007_alter_validators_add_error_messages','2025-05-12 17:47:10.137379'),(10,'auth','0008_alter_user_username_max_length','2025-05-12 17:47:10.144968'),(11,'auth','0009_alter_user_last_name_max_length','2025-05-12 17:47:10.151556'),(12,'auth','0010_alter_group_name_max_length','2025-05-12 17:47:10.167568'),(13,'auth','0011_update_proxy_permissions','2025-05-12 17:47:10.179285'),(14,'auth','0012_alter_user_first_name_max_length','2025-05-12 17:47:10.227717'),(15,'jobs','0001_initial','2025-05-12 17:47:10.640727'),(16,'admin','0001_initial','2025-05-12 17:47:10.777361'),(17,'admin','0002_logentry_remove_auto_add','2025-05-12 17:47:10.787312'),(18,'admin','0003_logentry_add_action_flag_choices','2025-05-12 17:47:10.787312'),(19,'sessions','0001_initial','2025-05-12 17:47:10.837058'),(20,'jobs','0002_recruitment_new','2025-05-12 17:55:32.252044'),(21,'jobs','0003_alter_new_content','2025-05-12 18:32:41.911597'),(22,'jobs','0004_tag_new_tags','2025-05-12 20:13:26.674018'),(23,'jobs','0005_comment_like','2025-05-12 20:17:46.918040'),(24,'jobs','0006_user_avatar','2025-05-12 20:30:20.834891'),(25,'jobs','0007_alter_user_avatar','2025-05-12 20:44:52.440823'),(26,'oauth2_provider','0001_initial','2025-05-12 20:55:49.611241'),(27,'oauth2_provider','0002_auto_20190406_1805','2025-05-12 20:55:49.734053'),(28,'oauth2_provider','0003_auto_20201211_1314','2025-05-12 20:55:49.794938'),(29,'oauth2_provider','0004_auto_20200902_2022','2025-05-12 20:55:50.230535'),(30,'oauth2_provider','0005_auto_20211222_2352','2025-05-12 20:55:50.303070'),(31,'oauth2_provider','0006_alter_application_client_secret','2025-05-12 20:55:50.327529'),(32,'oauth2_provider','0007_application_post_logout_redirect_uris','2025-05-12 20:55:50.396860'),(33,'oauth2_provider','0008_alter_accesstoken_token','2025-05-12 20:55:50.405348'),(34,'oauth2_provider','0009_add_hash_client_secret','2025-05-12 20:55:50.485787'),(35,'oauth2_provider','0010_application_allowed_origins','2025-05-12 20:55:50.553063'),(36,'oauth2_provider','0011_refreshtoken_token_family','2025-05-12 20:55:50.612700'),(37,'oauth2_provider','0012_add_token_checksum','2025-05-12 20:55:50.867751'),(38,'jobs','0008_alter_new_image_alter_recruitment_image','2025-05-12 21:21:54.108750'),(39,'jobs','0009_skill_userprofile','2025-05-12 21:28:44.931799');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('sptk5f836x5i460jslzr8z5r6x0a2teb','.eJxVjEEOwiAQRe_C2hCgpYBL9z0DmWEGqRqalHZlvLtt0oVu_3vvv0WEbS1xa7zEicRVaHH53RDSk-sB6AH1Pss013WZUB6KPGmT40z8up3u30GBVvYaUCsOZEzQvcmWyWln0fjMoR9MSGQ7heggEHeGmJS23vu8-zm5IYH4fAHifjgO:1uEXS2:PBoa3g8h79teuWfPZaCDIio7Tgn8ifkqH-PD54o5zfI','2025-05-26 18:00:30.711959');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_category`
--

DROP TABLE IF EXISTS `jobs_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_category`
--

LOCK TABLES `jobs_category` WRITE;
/*!40000 ALTER TABLE `jobs_category` DISABLE KEYS */;
INSERT INTO `jobs_category` VALUES (1,1,'2025-05-12 18:01:59.114098','2025-05-12 18:01:59.114098','IT'),(2,1,'2025-05-12 18:02:07.163677','2025-05-12 18:02:07.163677','Audit'),(3,1,'2025-05-12 18:02:23.435386','2025-05-12 18:02:23.435386','Marketing');
/*!40000 ALTER TABLE `jobs_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_comment`
--

DROP TABLE IF EXISTS `jobs_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_comment_new_id_ef7beea8_fk_jobs_new_id` (`new_id`),
  KEY `jobs_comment_user_id_d0b0a06b_fk_jobs_user_id` (`user_id`),
  CONSTRAINT `jobs_comment_new_id_ef7beea8_fk_jobs_new_id` FOREIGN KEY (`new_id`) REFERENCES `jobs_new` (`id`),
  CONSTRAINT `jobs_comment_user_id_d0b0a06b_fk_jobs_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobs_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_comment`
--

LOCK TABLES `jobs_comment` WRITE;
/*!40000 ALTER TABLE `jobs_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_like`
--

DROP TABLE IF EXISTS `jobs_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_like` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `new_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobs_like_user_id_new_id_82de2e44_uniq` (`user_id`,`new_id`),
  KEY `jobs_like_new_id_bc5d0a05_fk_jobs_new_id` (`new_id`),
  CONSTRAINT `jobs_like_new_id_bc5d0a05_fk_jobs_new_id` FOREIGN KEY (`new_id`) REFERENCES `jobs_new` (`id`),
  CONSTRAINT `jobs_like_user_id_b87d5eda_fk_jobs_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobs_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_like`
--

LOCK TABLES `jobs_like` WRITE;
/*!40000 ALTER TABLE `jobs_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_new`
--

DROP TABLE IF EXISTS `jobs_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_new` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recruitment_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_new_recruitment_id_5dba5fcc_fk_jobs_recruitment_id` (`recruitment_id`),
  CONSTRAINT `jobs_new_recruitment_id_5dba5fcc_fk_jobs_recruitment_id` FOREIGN KEY (`recruitment_id`) REFERENCES `jobs_recruitment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_new`
--

LOCK TABLES `jobs_new` WRITE;
/*!40000 ALTER TABLE `jobs_new` DISABLE KEYS */;
INSERT INTO `jobs_new` VALUES (1,1,'2025-05-12 18:04:48.270856','2025-05-12 18:04:48.270856','Recruit for May','We are happy when you come here.','new/2025/05/testjob.jpg',1),(2,1,'2025-05-12 18:05:25.099382','2025-05-12 18:05:25.099382','Recruit for July','We are happy when you come here.','new/2025/05/dejob.png',3),(3,1,'2025-05-12 18:05:42.319835','2025-05-12 18:05:42.319835','Recruit for May','We are happy when you come here.','new/2025/05/sw.jpg',2);
/*!40000 ALTER TABLE `jobs_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_new_tags`
--

DROP TABLE IF EXISTS `jobs_new_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_new_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `new_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobs_new_tags_new_id_tag_id_de8cb453_uniq` (`new_id`,`tag_id`),
  KEY `jobs_new_tags_tag_id_ad29bc66_fk_jobs_tag_id` (`tag_id`),
  CONSTRAINT `jobs_new_tags_new_id_ef5abc1c_fk_jobs_new_id` FOREIGN KEY (`new_id`) REFERENCES `jobs_new` (`id`),
  CONSTRAINT `jobs_new_tags_tag_id_ad29bc66_fk_jobs_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `jobs_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_new_tags`
--

LOCK TABLES `jobs_new_tags` WRITE;
/*!40000 ALTER TABLE `jobs_new_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs_new_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_recruitment`
--

DROP TABLE IF EXISTS `jobs_recruitment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_recruitment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scription` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_recruitment_category_id_b4bed6e3_fk_jobs_category_id` (`category_id`),
  CONSTRAINT `jobs_recruitment_category_id_b4bed6e3_fk_jobs_category_id` FOREIGN KEY (`category_id`) REFERENCES `jobs_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_recruitment`
--

LOCK TABLES `jobs_recruitment` WRITE;
/*!40000 ALTER TABLE `jobs_recruitment` DISABLE KEYS */;
INSERT INTO `jobs_recruitment` VALUES (1,1,'2025-05-12 18:03:25.464010','2025-05-12 18:03:25.464010','Tester','We are happy when you come here.','recruitment/2025/05/testjob.jpg',1),(2,1,'2025-05-12 18:03:39.948343','2025-05-12 18:03:39.948343','Software Engineer','We are happy when you come here.','recruitment/2025/05/sw.jpg',1),(3,1,'2025-05-12 18:03:50.667707','2025-05-12 18:03:50.667707','Data Engineer','We are happy when you come here.','recruitment/2025/05/dejob.png',1),(4,1,'2025-05-12 19:58:53.271652','2025-05-12 19:58:53.271652','Leader Marketing','We are happy when you come here.','recruitment/2025/05/mèo.jpg',3);
/*!40000 ALTER TABLE `jobs_recruitment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_skill`
--

DROP TABLE IF EXISTS `jobs_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_skill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_skill`
--

LOCK TABLES `jobs_skill` WRITE;
/*!40000 ALTER TABLE `jobs_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_tag`
--

DROP TABLE IF EXISTS `jobs_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_tag`
--

LOCK TABLES `jobs_tag` WRITE;
/*!40000 ALTER TABLE `jobs_tag` DISABLE KEYS */;
INSERT INTO `jobs_tag` VALUES (1,1,'2025-05-12 20:14:03.759118','2025-05-12 20:14:03.759118','Django');
/*!40000 ALTER TABLE `jobs_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_user`
--

DROP TABLE IF EXISTS `jobs_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_user`
--

LOCK TABLES `jobs_user` WRITE;
/*!40000 ALTER TABLE `jobs_user` DISABLE KEYS */;
INSERT INTO `jobs_user` VALUES (1,'pbkdf2_sha256$1000000$Xppv4qlIWfNuFt9HBbcC0S$c9lxSiaGJZzC6+aUHRBB5xjeSlmA8069VkQMx7axdNc=','2025-05-12 18:00:30.695257',1,'admin','','','admin@gmail.com',1,1,'2025-05-12 17:57:12.020896',NULL),(2,'1234',NULL,0,'user1','abc','def','adb@gmail.com',0,1,'2025-05-12 20:36:32.000000','testjob.jpg'),(3,'1',NULL,0,'abcds','erd','edsss','erd@gmail.com',0,1,'2025-05-12 20:45:29.000000','image/upload/v1747082758/nzefwzxijtykhd1het5m.png'),(4,'123456',NULL,0,'lichi','lili','chichi','',0,1,'2025-05-12 20:48:31.395659','image/upload/v1747082912/dryozsvpucswgsyafprq.png'),(5,'pbkdf2_sha256$1000000$3ss2upkVoQmeuCRlkbv67v$Pn23mHIEmLMqGCRlohjJLLLdvLVQILx+7sEQi91RJSs=',NULL,0,'user','lili','chichi','',0,1,'2025-05-12 20:50:30.619735','image/upload/v1747083032/y8wr6aiifcmki7eiokfu.png'),(6,'pbkdf2_sha256$1000000$UlRUVpDAaJvehDqMrq8lG8$9nTuU4a/1Kc1bag67QUkUaWxUq80/8yYobKc1AcRWbM=',NULL,0,'user3','lili','chichi','',0,1,'2025-05-12 20:51:55.088944','image/upload/v1747083117/hnuotdrpaxelh0oje3qx.png');
/*!40000 ALTER TABLE `jobs_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_user_groups`
--

DROP TABLE IF EXISTS `jobs_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobs_user_groups_user_id_group_id_39db2e61_uniq` (`user_id`,`group_id`),
  KEY `jobs_user_groups_group_id_8c4ec9ac_fk_auth_group_id` (`group_id`),
  CONSTRAINT `jobs_user_groups_group_id_8c4ec9ac_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `jobs_user_groups_user_id_c74ea82a_fk_jobs_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobs_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_user_groups`
--

LOCK TABLES `jobs_user_groups` WRITE;
/*!40000 ALTER TABLE `jobs_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_user_user_permissions`
--

DROP TABLE IF EXISTS `jobs_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobs_user_user_permissions_user_id_permission_id_80875a4d_uniq` (`user_id`,`permission_id`),
  KEY `jobs_user_user_permi_permission_id_e171478b_fk_auth_perm` (`permission_id`),
  CONSTRAINT `jobs_user_user_permi_permission_id_e171478b_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `jobs_user_user_permissions_user_id_d7a33063_fk_jobs_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobs_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_user_user_permissions`
--

LOCK TABLES `jobs_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `jobs_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_userprofile`
--

DROP TABLE IF EXISTS `jobs_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `education` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_userprofile_user_id_2e767d7c_fk_jobs_user_id` (`user_id`),
  CONSTRAINT `jobs_userprofile_user_id_2e767d7c_fk_jobs_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobs_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_userprofile`
--

LOCK TABLES `jobs_userprofile` WRITE;
/*!40000 ALTER TABLE `jobs_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_userprofile_skills`
--

DROP TABLE IF EXISTS `jobs_userprofile_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_userprofile_skills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userprofile_id` bigint NOT NULL,
  `skill_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobs_userprofile_skills_userprofile_id_skill_id_477e44a3_uniq` (`userprofile_id`,`skill_id`),
  KEY `jobs_userprofile_skills_skill_id_38c5cc1f_fk_jobs_skill_id` (`skill_id`),
  CONSTRAINT `jobs_userprofile_ski_userprofile_id_5abd90c1_fk_jobs_user` FOREIGN KEY (`userprofile_id`) REFERENCES `jobs_userprofile` (`id`),
  CONSTRAINT `jobs_userprofile_skills_skill_id_38c5cc1f_fk_jobs_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `jobs_skill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_userprofile_skills`
--

LOCK TABLES `jobs_userprofile_skills` WRITE;
/*!40000 ALTER TABLE `jobs_userprofile_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs_userprofile_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  `token_checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_provider_accesstoken_token_checksum_85319a26_uniq` (`token_checksum`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_jobs_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_jobs_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobs_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_logout_redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash_client_secret` tinyint(1) NOT NULL,
  `allowed_origins` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_jobs_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_jobs_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobs_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'R8oqau32w5HhFioPbkaNgwwNIjLmT1Rdn4cLcxis','','confidential','password','pbkdf2_sha256$1000000$X0N9EziPR7t0K4XsW0Lih9$q9NM1t55q7Z8LRaoqKzHQOpMCgVwEl2O19/hUMR3+cc=','oJob',1,0,'2025-05-12 20:59:40.764604','2025-05-12 20:59:40.764604','','',1,'');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_jobs_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_jobs_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobs_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_jobs_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_jobs_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobs_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  `token_family` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_jobs_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_jobs_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobs_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-14 16:07:05
