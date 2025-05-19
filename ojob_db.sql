-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: ojob_db
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add category',6,'add_category'),(22,'Can change category',6,'change_category'),(23,'Can delete category',6,'delete_category'),(24,'Can view category',6,'view_category'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add recruitment',8,'add_recruitment'),(30,'Can change recruitment',8,'change_recruitment'),(31,'Can delete recruitment',8,'delete_recruitment'),(32,'Can view recruitment',8,'view_recruitment'),(33,'Can add new',9,'add_new'),(34,'Can change new',9,'change_new'),(35,'Can delete new',9,'delete_new'),(36,'Can view new',9,'view_new'),(37,'Can add tag',10,'add_tag'),(38,'Can change tag',10,'change_tag'),(39,'Can delete tag',10,'delete_tag'),(40,'Can view tag',10,'view_tag'),(41,'Can add comment',11,'add_comment'),(42,'Can change comment',11,'change_comment'),(43,'Can delete comment',11,'delete_comment'),(44,'Can view comment',11,'view_comment'),(45,'Can add like',12,'add_like'),(46,'Can change like',12,'change_like'),(47,'Can delete like',12,'delete_like'),(48,'Can view like',12,'view_like'),(49,'Can add skill',13,'add_skill'),(50,'Can change skill',13,'change_skill'),(51,'Can delete skill',13,'delete_skill'),(52,'Can view skill',13,'view_skill'),(53,'Can add user profile',14,'add_userprofile'),(54,'Can change user profile',14,'change_userprofile'),(55,'Can delete user profile',14,'delete_userprofile'),(56,'Can view user profile',14,'view_userprofile'),(57,'Can add type',15,'add_type'),(58,'Can change type',15,'change_type'),(59,'Can delete type',15,'delete_type'),(60,'Can view type',15,'view_type'),(61,'Can add application',16,'add_application'),(62,'Can change application',16,'change_application'),(63,'Can delete application',16,'delete_application'),(64,'Can view application',16,'view_application'),(65,'Can add access token',17,'add_accesstoken'),(66,'Can change access token',17,'change_accesstoken'),(67,'Can delete access token',17,'delete_accesstoken'),(68,'Can view access token',17,'view_accesstoken'),(69,'Can add grant',18,'add_grant'),(70,'Can change grant',18,'change_grant'),(71,'Can delete grant',18,'delete_grant'),(72,'Can view grant',18,'view_grant'),(73,'Can add refresh token',19,'add_refreshtoken'),(74,'Can change refresh token',19,'change_refreshtoken'),(75,'Can delete refresh token',19,'delete_refreshtoken'),(76,'Can view refresh token',19,'view_refreshtoken'),(77,'Can add id token',20,'add_idtoken'),(78,'Can change id token',20,'change_idtoken'),(79,'Can delete id token',20,'delete_idtoken'),(80,'Can view id token',20,'view_idtoken');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-05-15 07:36:16.120473','1','IT',1,'[{\"added\": {}}]',6,1),(2,'2025-05-15 07:36:25.738137','2','Marketing',1,'[{\"added\": {}}]',6,1),(3,'2025-05-15 07:36:29.056908','3','HR',1,'[{\"added\": {}}]',6,1),(4,'2025-05-15 07:36:37.337273','4','Audit',1,'[{\"added\": {}}]',6,1),(5,'2025-05-15 07:36:43.520176','5','Logictic',1,'[{\"added\": {}}]',6,1),(6,'2025-05-15 07:36:50.528185','6','Sale',1,'[{\"added\": {}}]',6,1),(7,'2025-05-15 07:36:54.530721','6','Sales',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',6,1),(8,'2025-05-15 07:37:11.058357','7','Barista',1,'[{\"added\": {}}]',6,1),(9,'2025-05-15 07:37:18.570570','8','Manager',1,'[{\"added\": {}}]',6,1),(10,'2025-05-15 07:37:26.252483','9','Teacher',1,'[{\"added\": {}}]',6,1),(11,'2025-05-15 07:37:31.251860','10','Design',1,'[{\"added\": {}}]',6,1),(12,'2025-05-15 07:38:37.301560','1','Software  Engineer',1,'[{\"added\": {}}]',8,1),(13,'2025-05-15 07:38:56.953619','2','Data Engineer',1,'[{\"added\": {}}]',8,1),(14,'2025-05-15 07:39:26.933218','3','Tester',1,'[{\"added\": {}}]',8,1),(15,'2025-05-15 07:39:42.291011','4','Intern Marketing',1,'[{\"added\": {}}]',8,1),(16,'2025-05-15 07:40:06.160607','5','Leader Marketing',1,'[{\"added\": {}}]',8,1),(17,'2025-05-15 07:40:28.675089','6','Manager Marketing',1,'[{\"added\": {}}]',8,1),(18,'2025-05-15 07:40:52.558440','7','HR Manager',1,'[{\"added\": {}}]',8,1),(19,'2025-05-15 07:42:12.196874','8','Auditor',1,'[{\"added\": {}}]',8,1),(20,'2025-05-15 07:44:48.076240','9','Internal Audit Specialist',1,'[{\"added\": {}}]',8,1),(21,'2025-05-15 07:45:37.523325','1','English',1,'[{\"added\": {}}]',10,1),(22,'2025-05-15 07:45:41.927792','1','Hire',1,'[{\"added\": {}}]',9,1),(23,'2025-05-15 07:48:36.584693','1','Software  Engineer',2,'[{\"changed\": {\"fields\": [\"Salary\", \"Image\"]}}]',8,1),(24,'2025-05-15 07:48:52.040573','2','Data Engineer',2,'[{\"changed\": {\"fields\": [\"Salary\", \"Image\"]}}]',8,1),(25,'2025-05-15 07:52:43.165760','1','Software  Engineer',2,'[{\"changed\": {\"fields\": [\"Type\"]}}]',8,1),(26,'2025-05-15 07:52:57.513450','1','Software  Engineer',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(27,'2025-05-15 07:53:15.578750','2','Data Engineer',2,'[{\"changed\": {\"fields\": [\"Type\", \"Image\"]}}]',8,1),(28,'2025-05-15 07:53:38.628744','3','Tester',2,'[{\"changed\": {\"fields\": [\"Type\", \"Salary\", \"Image\"]}}]',8,1),(29,'2025-05-15 07:54:25.305013','4','Intern Marketing',2,'[{\"changed\": {\"fields\": [\"Type\", \"Salary\", \"Image\"]}}]',8,1),(30,'2025-05-15 07:54:32.770565','5','Leader Marketing',2,'[{\"changed\": {\"fields\": [\"Type\"]}}]',8,1),(31,'2025-05-15 07:54:46.417973','5','Leader Marketing',2,'[{\"changed\": {\"fields\": [\"Type\", \"Salary\", \"Image\"]}}]',8,1),(32,'2025-05-15 07:55:15.883702','7','HR Manager',2,'[{\"changed\": {\"fields\": [\"Type\", \"Salary\", \"Image\"]}}]',8,1),(33,'2025-05-15 07:55:37.618569','8','Auditor',2,'[{\"changed\": {\"fields\": [\"Type\", \"Salary\", \"Image\"]}}]',8,1),(34,'2025-05-15 07:55:57.493588','9','Internal Audit Specialist',2,'[{\"changed\": {\"fields\": [\"Type\", \"Salary\", \"Image\"]}}]',8,1),(35,'2025-05-15 07:56:50.968539','10','Intern Software Engineer',1,'[{\"added\": {}}]',8,1),(36,'2025-05-15 07:57:59.869997','2','Django',1,'[{\"added\": {}}]',10,1),(37,'2025-05-15 07:58:05.255514','3','Flask',1,'[{\"added\": {}}]',10,1),(38,'2025-05-15 07:58:09.149033','2','Hire',1,'[{\"added\": {}}]',9,1),(39,'2025-05-15 07:58:28.807353','1','Hire For July',2,'[{\"changed\": {\"fields\": [\"Subject\"]}}]',9,1),(40,'2025-05-15 07:59:11.030880','3','Recruit for May',1,'[{\"added\": {}}]',9,1),(41,'2025-05-15 08:00:03.342515','4','Recruit for May',1,'[{\"added\": {}}]',9,1),(42,'2025-05-15 08:00:17.619641','4','Chinese',1,'[{\"added\": {}}]',10,1),(43,'2025-05-15 08:00:21.816032','3','Recruit for May',2,'[{\"changed\": {\"fields\": [\"Tags\"]}}]',9,1),(44,'2025-05-15 08:01:05.430110','5','Recruit for May',1,'[{\"added\": {}}]',9,1),(45,'2025-05-19 10:19:30.639370','1','Comment object (1)',1,'[{\"added\": {}}]',11,1),(46,'2025-05-19 10:20:03.174352','2','Comment object (2)',1,'[{\"added\": {}}]',11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'jobs','category'),(11,'jobs','comment'),(12,'jobs','like'),(9,'jobs','new'),(8,'jobs','recruitment'),(13,'jobs','skill'),(10,'jobs','tag'),(15,'jobs','type'),(7,'jobs','user'),(14,'jobs','userprofile'),(17,'oauth2_provider','accesstoken'),(16,'oauth2_provider','application'),(18,'oauth2_provider','grant'),(20,'oauth2_provider','idtoken'),(19,'oauth2_provider','refreshtoken'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-05-15 07:31:59.181995'),(2,'contenttypes','0002_remove_content_type_name','2025-05-15 07:31:59.302972'),(3,'auth','0001_initial','2025-05-15 07:31:59.545860'),(4,'auth','0002_alter_permission_name_max_length','2025-05-15 07:31:59.609068'),(5,'auth','0003_alter_user_email_max_length','2025-05-15 07:31:59.609068'),(6,'auth','0004_alter_user_username_opts','2025-05-15 07:31:59.625848'),(7,'auth','0005_alter_user_last_login_null','2025-05-15 07:31:59.625848'),(8,'auth','0006_require_contenttypes_0002','2025-05-15 07:31:59.625848'),(9,'auth','0007_alter_validators_add_error_messages','2025-05-15 07:31:59.640729'),(10,'auth','0008_alter_user_username_max_length','2025-05-15 07:31:59.640729'),(11,'auth','0009_alter_user_last_name_max_length','2025-05-15 07:31:59.656806'),(12,'auth','0010_alter_group_name_max_length','2025-05-15 07:31:59.672010'),(13,'auth','0011_update_proxy_permissions','2025-05-15 07:31:59.672010'),(14,'auth','0012_alter_user_first_name_max_length','2025-05-15 07:31:59.688103'),(15,'jobs','0001_initial','2025-05-15 07:32:00.042910'),(16,'admin','0001_initial','2025-05-15 07:32:00.181367'),(17,'admin','0002_logentry_remove_auto_add','2025-05-15 07:32:00.197461'),(18,'admin','0003_logentry_add_action_flag_choices','2025-05-15 07:32:00.208141'),(19,'jobs','0002_recruitment_new','2025-05-15 07:32:00.353995'),(20,'jobs','0003_alter_new_content','2025-05-15 07:32:00.356778'),(21,'jobs','0004_tag_new_tags','2025-05-15 07:32:00.537890'),(22,'jobs','0005_comment_like','2025-05-15 07:32:00.806505'),(23,'jobs','0006_user_avatar','2025-05-15 07:32:00.861443'),(24,'jobs','0007_alter_user_avatar','2025-05-15 07:32:00.901613'),(25,'jobs','0008_alter_new_image_alter_recruitment_image','2025-05-15 07:32:00.981045'),(26,'jobs','0009_skill_userprofile','2025-05-15 07:32:01.228579'),(27,'jobs','0010_type_recruitment_salary_recruitment_types','2025-05-15 07:32:01.473156'),(28,'jobs','0011_alter_recruitment_salary','2025-05-15 07:32:01.527866'),(29,'oauth2_provider','0001_initial','2025-05-15 07:32:02.271274'),(30,'oauth2_provider','0002_auto_20190406_1805','2025-05-15 07:32:02.408661'),(31,'oauth2_provider','0003_auto_20201211_1314','2025-05-15 07:32:02.484351'),(32,'oauth2_provider','0004_auto_20200902_2022','2025-05-15 07:32:02.939026'),(33,'oauth2_provider','0005_auto_20211222_2352','2025-05-15 07:32:03.006656'),(34,'oauth2_provider','0006_alter_application_client_secret','2025-05-15 07:32:03.038779'),(35,'oauth2_provider','0007_application_post_logout_redirect_uris','2025-05-15 07:32:03.128778'),(36,'oauth2_provider','0008_alter_accesstoken_token','2025-05-15 07:32:03.133497'),(37,'oauth2_provider','0009_add_hash_client_secret','2025-05-15 07:32:03.225994'),(38,'oauth2_provider','0010_application_allowed_origins','2025-05-15 07:32:03.292136'),(39,'oauth2_provider','0011_refreshtoken_token_family','2025-05-15 07:32:03.359585'),(40,'oauth2_provider','0012_add_token_checksum','2025-05-15 07:32:03.639669'),(41,'sessions','0001_initial','2025-05-15 07:32:03.693757'),(42,'jobs','0012_remove_recruitment_types_remove_recruitment_salary_and_more','2025-05-15 07:32:56.284832'),(43,'jobs','0013_remove_new_salary_recruitment_salary','2025-05-15 07:47:30.416882'),(44,'jobs','0014_recruitment_type','2025-05-15 07:52:02.055362');
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
INSERT INTO `django_session` VALUES ('7lg58bfnrhs4t79xhm0s1arvpcog9cnx','.eJxVjEEOwiAQRe_C2pABSgsu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWSpx-N8L44LqDdMd6azK2ui4zyV2RB-3y2hI_L4f7d1Cwl2_tM0Q2nHkyPhI5pCFDQodqzFPyo4oW3KAVA2nQCNaSRbRJWTBGuSjeHwfjOBM:1uGxaE:zRI_b5Xiv6vXQWJDJil7kOlsijkZg3IE75kgw84oreI','2025-06-02 10:18:58.380694'),('mcaq1qc1dgi196kkellnw1unix6jmqzz','.eJxVjEEOwiAQRe_C2pABSgsu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWSpx-N8L44LqDdMd6azK2ui4zyV2RB-3y2hI_L4f7d1Cwl2_tM0Q2nHkyPhI5pCFDQodqzFPyo4oW3KAVA2nQCNaSRbRJWTBGuSjeHwfjOBM:1uFT8O:Ul3Qrv3Rwoa98rgOE2Azp9Anwn8oS9LyzCQK2aotkFk','2025-05-29 07:36:04.419378');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_category`
--

LOCK TABLES `jobs_category` WRITE;
/*!40000 ALTER TABLE `jobs_category` DISABLE KEYS */;
INSERT INTO `jobs_category` VALUES (1,1,'2025-05-15 07:36:16.120473','2025-05-15 07:36:16.120473','IT'),(2,1,'2025-05-15 07:36:25.738137','2025-05-15 07:36:25.738137','Marketing'),(3,1,'2025-05-15 07:36:29.056908','2025-05-15 07:36:29.056908','HR'),(4,1,'2025-05-15 07:36:37.337273','2025-05-15 07:36:37.337273','Audit'),(5,1,'2025-05-15 07:36:43.520176','2025-05-15 07:36:43.520176','Logictic'),(6,1,'2025-05-15 07:36:50.528185','2025-05-15 07:36:50.528185','Sales'),(7,1,'2025-05-15 07:37:11.058357','2025-05-15 07:37:11.058357','Barista'),(8,1,'2025-05-15 07:37:18.570570','2025-05-15 07:37:18.570570','Manager'),(9,1,'2025-05-15 07:37:26.252483','2025-05-15 07:37:26.252483','Teacher'),(10,1,'2025-05-15 07:37:31.251860','2025-05-15 07:37:31.251860','Design');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_comment`
--

LOCK TABLES `jobs_comment` WRITE;
/*!40000 ALTER TABLE `jobs_comment` DISABLE KEYS */;
INSERT INTO `jobs_comment` VALUES (1,1,'2025-05-19 10:19:30.623571','2025-05-19 10:19:30.623571','very good',1,1),(2,1,'2025-05-19 10:20:03.164543','2025-05-19 10:20:03.164543','good! I like this',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_new`
--

LOCK TABLES `jobs_new` WRITE;
/*!40000 ALTER TABLE `jobs_new` DISABLE KEYS */;
INSERT INTO `jobs_new` VALUES (1,1,'2025-05-15 07:45:40.165729','2025-05-15 07:45:40.165729','Hire For July','<pre>\r\nWe are happy when you come here.</pre>','image/upload/v1747295141/kc2begbfevpmgxhhlbos.jpg',7),(2,1,'2025-05-15 07:58:08.258376','2025-05-15 07:58:08.258376','Hire','<pre>\r\nWe are happy when you come here.</pre>','image/upload/v1747295888/ali2euapmzrsbhmfvc6g.jpg',1),(3,1,'2025-05-15 07:59:10.402721','2025-05-15 07:59:10.402721','Recruit for May','<pre>\r\nWe are happy when you come here.</pre>','image/upload/v1747295950/clvapjowrkyazvpf2ym1.png',5),(4,1,'2025-05-15 08:00:02.616368','2025-05-15 08:00:02.616368','Recruit for May','<pre>\r\nWe are happy when you come here.</pre>','image/upload/v1747296002/qn2mrownfsoe0u8kmcyn.png',4),(5,1,'2025-05-15 08:01:04.661244','2025-05-15 08:01:04.661244','Recruit for May','<pre>\r\nWe are happy when you come here.</pre>','image/upload/v1747296064/x92nxebndunupxae3mvw.jpg',9);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_new_tags`
--

LOCK TABLES `jobs_new_tags` WRITE;
/*!40000 ALTER TABLE `jobs_new_tags` DISABLE KEYS */;
INSERT INTO `jobs_new_tags` VALUES (1,1,1),(2,2,2),(3,2,3),(6,3,4),(5,4,1),(7,5,4);
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
  `salary` decimal(12,2) NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_recruitment_category_id_b4bed6e3_fk_jobs_category_id` (`category_id`),
  CONSTRAINT `jobs_recruitment_category_id_b4bed6e3_fk_jobs_category_id` FOREIGN KEY (`category_id`) REFERENCES `jobs_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_recruitment`
--

LOCK TABLES `jobs_recruitment` WRITE;
/*!40000 ALTER TABLE `jobs_recruitment` DISABLE KEYS */;
INSERT INTO `jobs_recruitment` VALUES (1,1,'2025-05-15 07:38:34.585125','2025-05-15 07:38:34.585125','Software  Engineer','We are happy when you come here.','image/upload/v1747295576/rkq2ka98lkdx4umcv2bg.jpg',1,20000000.00,'Full-time'),(2,1,'2025-05-15 07:38:56.251506','2025-05-15 07:38:56.251506','Data Engineer','We are happy when you come here.','image/upload/v1747295595/afmyhabmsjqnoo1irx4b.png',1,20000000.00,'Full-time'),(3,1,'2025-05-15 07:39:25.736715','2025-05-15 07:39:25.736715','Tester','We are happy when you come here.','image/upload/v1747295617/bmzh7znufh4ohavrrj7i.jpg',1,10000000.00,'Full-time'),(4,1,'2025-05-15 07:39:41.050212','2025-05-15 07:39:41.050212','Intern Marketing','We are happy when you come here.','image/upload/v1747295664/w4jy9hhomungzonflfez.jpg',2,15000000.00,'Full-time'),(5,1,'2025-05-15 07:40:05.334211','2025-05-15 07:40:05.334211','Leader Marketing','We are happy when you come here.','image/upload/v1747295685/wdowu3bmj29jqjisibn6.png',2,25000000.00,'Full-time'),(6,1,'2025-05-15 07:40:26.122291','2025-05-15 07:40:26.122291','Manager Marketing','We are happy when you come here.','image/upload/v1747294827/juaoa1ggepql7nakmw0t.jpg',2,0.00,'0'),(7,1,'2025-05-15 07:40:51.692450','2025-05-15 07:40:51.692450','HR Manager','We are happy when you come here.','image/upload/v1747295715/ounlunouqffegr6kjv4s.jpg',3,30000000.00,'Full'),(8,1,'2025-05-15 07:42:11.215010','2025-05-15 07:42:11.215010','Auditor','We are happy when you come here.','image/upload/v1747295737/bltaag3fnlozzz4q1rx4.jpg',4,10000000.00,'Fu'),(9,1,'2025-05-15 07:44:46.763398','2025-05-15 07:44:46.763398','Internal Audit Specialist','We are happy when you come here.','image/upload/v1747295756/gfnaekldfzhiautp1c1s.jpg',4,5000000.00,'Fu'),(10,1,'2025-05-15 07:56:50.050654','2025-05-15 07:56:50.050654','Intern Software Engineer','We are happy when you come here.','image/upload/v1747295810/epagszw62x0tnhs5px85.jpg',1,5000000.00,'Full-time');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_tag`
--

LOCK TABLES `jobs_tag` WRITE;
/*!40000 ALTER TABLE `jobs_tag` DISABLE KEYS */;
INSERT INTO `jobs_tag` VALUES (1,1,'2025-05-15 07:45:37.522186','2025-05-15 07:45:37.522186','English'),(2,1,'2025-05-15 07:57:59.869205','2025-05-15 07:57:59.869205','Django'),(3,1,'2025-05-15 07:58:05.254451','2025-05-15 07:58:05.254451','Flask'),(4,1,'2025-05-15 08:00:17.617494','2025-05-15 08:00:17.617494','Chinese');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_user`
--

LOCK TABLES `jobs_user` WRITE;
/*!40000 ALTER TABLE `jobs_user` DISABLE KEYS */;
INSERT INTO `jobs_user` VALUES (1,'pbkdf2_sha256$1000000$s7eLTf6gj7nL6vNHs450UE$k88AdOJosbbS0CBtSpNk9/gbTmEjDaxhTiGWs1FTyX8=','2025-05-19 10:18:58.367817',1,'admin','','','admin@gmail.com',1,1,'2025-05-15 07:35:36.910476',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
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

-- Dump completed on 2025-05-19 17:27:45
