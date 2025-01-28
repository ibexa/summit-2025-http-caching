-- MariaDB dump 10.19  Distrib 10.5.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: ezp
-- ------------------------------------------------------
-- Server version	10.5.10-MariaDB-1:10.5.10+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ezbinaryfile`
--

DROP TABLE IF EXISTS `ezbinaryfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezbinaryfile` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `version` int(11) NOT NULL DEFAULT 0,
  `download_count` int(11) NOT NULL DEFAULT 0,
  `filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `original_filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`contentobject_attribute_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezbinaryfile`
--

LOCK TABLES `ezbinaryfile` WRITE;
/*!40000 ALTER TABLE `ezbinaryfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezbinaryfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state`
--

DROP TABLE IF EXISTS `ezcobj_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_language_id` bigint(20) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcobj_state_identifier` (`group_id`,`identifier`),
  KEY `ezcobj_state_priority` (`priority`),
  KEY `ezcobj_state_lmask` (`language_mask`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state`
--

LOCK TABLES `ezcobj_state` WRITE;
/*!40000 ALTER TABLE `ezcobj_state` DISABLE KEYS */;
INSERT INTO `ezcobj_state` VALUES (1,2,2,'not_locked',3,0),(2,2,2,'locked',3,1);
/*!40000 ALTER TABLE `ezcobj_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_group`
--

DROP TABLE IF EXISTS `ezcobj_state_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_language_id` bigint(20) NOT NULL DEFAULT 0,
  `identifier` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcobj_state_group_identifier` (`identifier`),
  KEY `ezcobj_state_group_lmask` (`language_mask`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_group`
--

LOCK TABLES `ezcobj_state_group` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_group` DISABLE KEYS */;
INSERT INTO `ezcobj_state_group` VALUES (2,2,'ez_lock',3);
/*!40000 ALTER TABLE `ezcobj_state_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_group_language`
--

DROP TABLE IF EXISTS `ezcobj_state_group_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_group_language` (
  `contentobject_state_group_id` int(11) NOT NULL DEFAULT 0,
  `real_language_id` bigint(20) NOT NULL DEFAULT 0,
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `language_id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`contentobject_state_group_id`,`real_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_group_language`
--

LOCK TABLES `ezcobj_state_group_language` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_group_language` DISABLE KEYS */;
INSERT INTO `ezcobj_state_group_language` VALUES (2,2,'',3,'Lock');
/*!40000 ALTER TABLE `ezcobj_state_group_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_language`
--

DROP TABLE IF EXISTS `ezcobj_state_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_language` (
  `contentobject_state_id` int(11) NOT NULL DEFAULT 0,
  `language_id` bigint(20) NOT NULL DEFAULT 0,
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`contentobject_state_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_language`
--

LOCK TABLES `ezcobj_state_language` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_language` DISABLE KEYS */;
INSERT INTO `ezcobj_state_language` VALUES (1,3,'','Not locked'),(2,3,'','Locked');
/*!40000 ALTER TABLE `ezcobj_state_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_link`
--

DROP TABLE IF EXISTS `ezcobj_state_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_link` (
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_state_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contentobject_id`,`contentobject_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_link`
--

LOCK TABLES `ezcobj_state_link` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_link` DISABLE KEYS */;
INSERT INTO `ezcobj_state_link` VALUES (1,1),(4,1),(10,1),(11,1),(12,1),(13,1),(14,1),(41,1),(42,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1);
/*!40000 ALTER TABLE `ezcobj_state_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontent_language`
--

DROP TABLE IF EXISTS `ezcontent_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontent_language` (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `disabled` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezcontent_language_name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontent_language`
--

LOCK TABLES `ezcontent_language` WRITE;
/*!40000 ALTER TABLE `ezcontent_language` DISABLE KEYS */;
INSERT INTO `ezcontent_language` VALUES (2,0,'eng-GB','English (United Kingdom)');
/*!40000 ALTER TABLE `ezcontent_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentbrowsebookmark`
--

DROP TABLE IF EXISTS `ezcontentbrowsebookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentbrowsebookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezcontentbrowsebookmark_location` (`node_id`),
  KEY `ezcontentbrowsebookmark_user` (`user_id`),
  KEY `ezcontentbrowsebookmark_user_location` (`user_id`,`node_id`),
  CONSTRAINT `ezcontentbrowsebookmark_location_fk` FOREIGN KEY (`node_id`) REFERENCES `ezcontentobject_tree` (`node_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ezcontentbrowsebookmark_user_fk` FOREIGN KEY (`user_id`) REFERENCES `ezuser` (`contentobject_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentbrowsebookmark`
--

LOCK TABLES `ezcontentbrowsebookmark` WRITE;
/*!40000 ALTER TABLE `ezcontentbrowsebookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcontentbrowsebookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass`
--

DROP TABLE IF EXISTS `ezcontentclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL DEFAULT 0,
  `always_available` int(11) NOT NULL DEFAULT 0,
  `contentobject_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT 0,
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `initial_language_id` bigint(20) NOT NULL DEFAULT 0,
  `is_container` int(11) NOT NULL DEFAULT 0,
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `modifier_id` int(11) NOT NULL DEFAULT 0,
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `serialized_description_list` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `serialized_name_list` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sort_field` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 1,
  `url_alias_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentclass_version` (`version`),
  KEY `ezcontentclass_identifier` (`identifier`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass`
--

LOCK TABLES `ezcontentclass` WRITE;
/*!40000 ALTER TABLE `ezcontentclass` DISABLE KEYS */;
INSERT INTO `ezcontentclass` VALUES (1,0,1,'<short_name|name>',1024392098,14,'folder',2,1,2,1448831672,14,'a3d405b81be900468eb153d774f4f0d2','a:0:{}','a:1:{s:6:\"eng-GB\";s:6:\"Folder\";}',1,1,NULL),(2,0,0,'<short_title|title>',1024392098,14,'article',2,1,3,1082454989,14,'c15b600eb9198b1924063b5a68758232',NULL,'a:2:{s:6:\"eng-GB\";s:7:\"Article\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(3,0,1,'<name>',1024392098,14,'user_group',2,1,3,1048494743,14,'25b4268cdcd01921b808a0d854b877ef',NULL,'a:2:{s:6:\"eng-GB\";s:10:\"User group\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(4,0,1,'<first_name> <last_name>',1024392098,14,'user',2,0,3,1082018364,14,'40faa822edc579b02c25f6bb7beec3ad',NULL,'a:2:{s:6:\"eng-GB\";s:4:\"User\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(5,0,1,'<name>',1031484992,14,'image',2,0,2,1736257876,14,'f6df12aa74e36230eb675f364fccd25a','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}',1,1,NULL),(12,0,1,'<name>',1052385472,14,'file',2,0,3,1052385669,14,'637d58bfddf164627bdfd265733280a0',NULL,'a:2:{s:6:\"eng-GB\";s:4:\"File\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(42,0,1,'<name>',1435924826,14,'landing_page',2,1,2,1435924826,14,'60c03e9758465eb69d56b3afb6adf18e','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:12:\"Landing page\";}',2,0,''),(43,0,1,'<title>',1537166773,14,'form',2,0,2,1537166834,14,'6f7f21df775a33c1e4bbc76b48c38476','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Form\";}',2,0,''),(44,0,1,'<first_name> <last_name>',1701600193,14,'editor',2,0,2,1701600193,14,'65730554a57aca85ee891125c432aa59','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:6:\"Editor\";}',1,1,''),(45,0,1,'<name>',1736257875,14,'tag',2,0,2,1736257875,14,'bce6696b9ddbab8739d34c7f5d210d47','a:0:{}','a:1:{s:6:\"eng-GB\";s:3:\"Tag\";}',2,0,''),(46,0,1,'<name|identifier>',1736257877,14,'product_category_tag',2,0,2,1736257877,14,'bce7902def3b0fbabca28ec59d62bf5f','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Product category\";}',2,0,''),(47,0,1,'<first_name> <last_name>',1736257878,14,'member',2,0,2,1736257878,14,'3d6eeb4abcf9a6a04df47b86113ea309','a:0:{}','a:1:{s:6:\"eng-GB\";s:6:\"Member\";}',2,0,''),(48,0,1,'<name>',1736257878,14,'company',2,0,2,1736257879,14,'dba642b451d6b9ea38f5a5a4a0f1cf50','a:0:{}','a:1:{s:6:\"eng-GB\";s:7:\"Company\";}',2,0,''),(49,0,1,'<name>',1736257878,14,'shipping_address',2,0,2,1736257878,14,'dec6cba898a0060963e7f1e5247c05f3','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Shipping address\";}',2,0,''),(50,0,1,'<name>',1736257879,14,'corporate_account_application',2,0,2,1736257879,14,'c33bb64d812df4803b47f6b0d609055b','a:0:{}','a:1:{s:6:\"eng-GB\";s:29:\"Corporate Account Application\";}',2,0,''),(51,0,1,'<name>',1736257879,14,'customer_portal_page',2,0,2,1736257879,14,'7f29e3b3caa9e87f81916e0647852d34','a:0:{}','a:1:{s:6:\"eng-GB\";s:20:\"Customer Portal Page\";}',2,0,''),(52,0,1,'<name>',1736257879,14,'customer_portal',2,1,2,1736257879,14,'442f7edb4ce7ac2eb75a4b73631e7ce7','a:0:{}','a:1:{s:6:\"eng-GB\";s:15:\"Customer Portal\";}',2,0,''),(53,0,1,'<name>',1736257880,14,'dashboard_landing_page',2,0,2,1736257881,14,'f6c0316d25587ff91c14222eef90be0d','a:1:{s:6:\"eng-GB\";s:22:\"Customizable Dashboard\";}','a:1:{s:6:\"eng-GB\";s:9:\"Dashboard\";}',9,0,'');
/*!40000 ALTER TABLE `ezcontentclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_attribute`
--

DROP TABLE IF EXISTS `ezcontentclass_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL DEFAULT 0,
  `can_translate` int(11) DEFAULT 1,
  `category` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `data_float1` double DEFAULT NULL,
  `data_float2` double DEFAULT NULL,
  `data_float3` double DEFAULT NULL,
  `data_float4` double DEFAULT NULL,
  `data_int1` int(11) DEFAULT NULL,
  `data_int2` int(11) DEFAULT NULL,
  `data_int3` int(11) DEFAULT NULL,
  `data_int4` int(11) DEFAULT NULL,
  `data_text1` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text2` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text3` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text4` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text5` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_type_string` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `identifier` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `is_information_collector` int(11) NOT NULL DEFAULT 0,
  `is_required` int(11) NOT NULL DEFAULT 0,
  `is_searchable` int(11) NOT NULL DEFAULT 0,
  `is_thumbnail` tinyint(1) NOT NULL DEFAULT 0,
  `placement` int(11) NOT NULL DEFAULT 0,
  `serialized_data_text` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `serialized_description_list` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `serialized_name_list` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentclass_attr_ccid` (`contentclass_id`),
  KEY `ezcontentclass_attr_dts` (`data_type_string`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_attribute`
--

LOCK TABLES `ezcontentclass_attribute` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_attribute` DISABLE KEYS */;
INSERT INTO `ezcontentclass_attribute` VALUES (1,0,1,'',2,0,0,0,0,255,0,0,0,'New article','','','','','ezstring','title',0,1,1,1,0,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Title\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(4,0,1,'',1,NULL,NULL,NULL,NULL,255,0,NULL,NULL,'Folder',NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(6,0,1,'',3,0,0,0,0,255,0,0,0,'','','','',NULL,'ezstring','name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(7,0,1,'',3,0,0,0,0,255,0,0,0,'','','','',NULL,'ezstring','description',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Description\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(8,0,1,'',4,0,0,0,0,255,0,0,0,'','','','','','ezstring','first_name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:10:\"First name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(9,0,1,'',4,0,0,0,0,255,0,0,0,'','','','','','ezstring','last_name',0,1,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:9:\"Last name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(12,0,0,'',4,0,0,0,0,7,10,0,0,'','^[^@]+$','','','','ezuser','user_account',0,1,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:12:\"User account\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(116,0,1,'',5,NULL,NULL,NULL,NULL,150,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(117,0,1,'',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','caption',0,0,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:7:\"Caption\";}'),(118,0,1,'',5,10,NULL,NULL,NULL,NULL,0,NULL,NULL,'MB',NULL,NULL,NULL,'[]','ezimage','image',0,0,1,1,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}'),(119,0,1,'',1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','short_description',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Short description\";}'),(120,0,1,'',2,0,0,0,0,10,0,0,0,'','','','','','ezrichtext','intro',0,1,1,0,4,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Intro\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(121,0,1,'',2,0,0,0,0,20,0,0,0,'','','','','','ezrichtext','body',0,0,1,0,5,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Body\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(123,0,0,'',2,0,0,0,0,0,0,0,0,'','','','','','ezboolean','enable_comments',0,0,0,0,6,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:15:\"Enable comments\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(146,0,1,'',12,0,0,0,0,0,0,0,0,'New file','','','',NULL,'ezstring','name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(147,0,1,'',12,0,0,0,0,10,0,0,0,'','','','',NULL,'ezrichtext','description',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Description\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(148,0,1,'',12,0,0,0,0,0,0,0,0,'','','','',NULL,'ezbinaryfile','file',0,1,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"File\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(152,0,1,'',2,0,0,0,0,255,0,0,0,'','','','','','ezstring','short_title',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Short title\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(153,0,1,'',2,0,0,0,0,1,0,0,0,'','','','','','ezauthor','author',0,0,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:6:\"Author\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(154,0,1,'',2,0,0,0,0,0,0,0,0,'','','','','','ezobjectrelation','image',0,0,1,0,7,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(155,0,1,'',1,NULL,NULL,NULL,NULL,100,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','short_name',0,0,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Short name\";}'),(156,0,1,'',1,NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','description',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(179,0,1,'',4,0,0,0,0,10,0,0,0,'','','','','','eztext','signature',0,0,1,0,4,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:9:\"Signature\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(180,0,1,'',4,10,0,0,0,0,0,0,0,'MB','','','','','ezimage','image',0,0,0,1,5,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(185,0,1,'content',42,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,10,'N;','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(186,0,1,'content',42,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','description',0,1,1,0,20,'N;','a:1:{s:6:\"eng-GB\";s:24:\"Landing page description\";}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(187,0,1,'content',42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezlandingpage','page',0,0,0,0,30,'N;','a:1:{s:6:\"eng-GB\";s:12:\"Landing page\";}','a:1:{s:6:\"eng-GB\";s:12:\"Landing page\";}'),(188,0,1,'content',43,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(189,0,1,'content',43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezform','form',0,0,0,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Form\";}'),(190,0,1,'content',44,NULL,NULL,NULL,NULL,255,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','first_name',0,1,1,0,0,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:10:\"First name\";}'),(191,0,1,'content',44,NULL,NULL,NULL,NULL,255,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','last_name',0,1,1,0,1,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:9:\"Last name\";}'),(192,0,0,'content',44,NULL,NULL,NULL,NULL,7,10,0,0,NULL,'^[^@]+$',NULL,NULL,NULL,'ezuser','user_account',0,1,0,0,2,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:12:\"User account\";}'),(193,0,1,'content',44,0,NULL,NULL,NULL,NULL,0,NULL,NULL,'MB',NULL,NULL,NULL,'[]','ezimage','image',0,0,0,1,3,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}'),(194,0,1,'content',44,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eztext','signature',0,0,1,0,4,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:9:\"Signature\";}'),(195,0,0,'about',44,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','position',0,0,1,0,5,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:9:\"Job Title\";}'),(196,0,0,'about',44,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','department',0,0,1,0,6,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:10:\"Department\";}'),(197,0,0,'about',44,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','location',0,0,1,0,7,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:8:\"Location\";}'),(198,0,1,'contact',44,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','phone',0,0,1,0,8,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:5:\"Phone\";}'),(199,0,1,'contact',44,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','linked_in',0,0,1,0,9,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:8:\"LinkedIn\";}'),(200,0,1,'',45,NULL,NULL,NULL,NULL,0,0,NULL,NULL,'New Tag',NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,1,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(201,0,0,'',45,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','identifier',0,1,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Identifier\";}'),(202,0,0,'',45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tags',NULL,NULL,NULL,NULL,'ibexa_taxonomy_entry','parent',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:6:\"Parent\";}'),(203,0,1,'',45,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eztext','description',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(204,0,1,'',45,0,NULL,NULL,NULL,NULL,0,NULL,NULL,'MB',NULL,NULL,NULL,'[]','ezimage','image',0,0,0,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:12:\"Image upload\";}'),(205,0,1,'',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezkeyword','tags',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Tags\";}'),(206,0,1,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,10,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(207,0,0,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','identifier',0,1,1,0,20,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Identifier\";}'),(208,0,0,'',46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'product_categories',NULL,NULL,NULL,NULL,'ibexa_taxonomy_entry','parent',0,0,1,0,30,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:15:\"Parent Category\";}'),(209,0,1,'',46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','description',0,0,1,0,40,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(210,0,1,'',46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimageasset','image',0,0,1,0,50,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}'),(211,0,0,'',47,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','first_name',0,1,1,0,2,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:10:\"First name\";}'),(212,0,0,'',47,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','last_name',0,1,1,0,3,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:9:\"Last name\";}'),(213,0,0,'',47,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','phone_number',0,1,1,0,4,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:5:\"Phone\";}'),(214,0,0,'internal',47,NULL,NULL,NULL,NULL,39,10,NULL,NULL,NULL,'^[^@]+$',NULL,NULL,NULL,'ezuser','user',0,1,0,0,6,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:4:\"User\";}'),(215,0,0,'basic_information',48,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'ezboolean','active',0,0,1,0,1,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:9:\"Is active\";}'),(216,0,0,'basic_information',48,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,2,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(217,0,0,'basic_information',48,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','vat',0,1,1,0,3,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:6:\"Tax ID\";}'),(218,0,0,'basic_information',48,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','website',0,0,1,0,4,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:7:\"Website\";}'),(219,0,0,'basic_information',48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ibexa_customer_group','customer_group',0,1,0,0,5,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:14:\"Customer group\";}'),(220,0,0,'basic_information',48,NULL,NULL,NULL,NULL,0,64,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"user\"/></constraints><selection_type value=\"0\"/><root_default_location value=\"\"/><contentobject-placement node-id=\"64\"/></related-objects>\n','ezobjectrelation','sales_rep',0,1,1,0,6,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:20:\"Sales representative\";}'),(221,0,0,'basic_information',48,NULL,NULL,NULL,NULL,0,-1,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"member\"/></constraints><selection_type value=\"0\"/><root_default_location value=\"1\"/><contentobject-placement node-id=\"-1\"/></related-objects>\n','ezobjectrelation','contact',0,0,1,0,7,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:14:\"Contact person\";}'),(222,0,0,'basic_information',48,NULL,NULL,NULL,NULL,0,-1,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"shipping_address\"/></constraints><selection_type value=\"0\"/><root_default_location value=\"1\"/><contentobject-placement node-id=\"-1\"/></related-objects>\n','ezobjectrelation','default_address',0,0,1,0,8,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:15:\"Default address\";}'),(223,0,0,'billing_address',48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"type\":\"billing\"}','ibexa_address','billing_address',0,1,0,0,9,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:15:\"Billing address\";}'),(224,0,0,'internal',48,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints/><selection_type value=\"0\"/><root_default_location value=\"\"/><contentobject-placement/></related-objects>\n','ezobjectrelation','address_book',0,0,1,0,10,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:12:\"Address book\";}'),(225,0,0,'internal',48,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints/><selection_type value=\"0\"/><root_default_location value=\"\"/><contentobject-placement/></related-objects>\n','ezobjectrelation','members',0,0,1,0,10,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:7:\"Members\";}'),(226,0,0,'',49,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,1,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(227,0,0,'',49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"type\":\"personal\"}','ibexa_address','address',0,0,0,0,2,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:7:\"Address\";}'),(228,0,0,'',49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezemail','email',0,0,1,0,3,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:6:\"E-mail\";}'),(229,0,0,'basic_information',49,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','phone',0,0,1,0,4,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:5:\"Phone\";}'),(230,0,0,'company',50,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,1,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(231,0,0,'company',50,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','vat',0,1,1,0,2,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:6:\"Tax ID\";}'),(232,0,0,'company',50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"type\":\"billing\"}','ibexa_address','address',0,1,0,0,3,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:7:\"Address\";}'),(233,0,0,'company',50,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','website',0,0,1,0,4,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:7:\"Website\";}'),(234,0,0,'member',50,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','first_name',0,1,1,0,11,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:10:\"First name\";}'),(235,0,0,'member',50,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','last_name',0,1,1,0,12,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:9:\"Last name\";}'),(236,0,0,'member',50,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','phone_number',0,1,1,0,13,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:5:\"Phone\";}'),(237,0,0,'member',50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'ezemail','user',0,1,1,0,14,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:5:\"Email\";}'),(238,0,0,'internal',50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ibexa_customer_group','customer_group',0,0,0,0,15,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:14:\"Customer group\";}'),(239,0,0,'internal',50,NULL,NULL,NULL,NULL,0,64,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"user\"/></constraints><selection_type value=\"0\"/><root_default_location value=\"\"/><contentobject-placement node-id=\"64\"/></related-objects>\n','ezobjectrelation','sales_rep',0,0,1,0,16,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:20:\"Sales representative\";}'),(240,0,0,'',51,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,1,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(241,0,0,'',51,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','description',0,1,1,0,2,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(242,0,1,'',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"availableBlocks\":null,\"availableLayouts\":null,\"editorMode\":\"page_view_mode\"}','ezlandingpage','page',0,1,0,0,3,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:15:\"Customer Portal\";}'),(243,0,0,'',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,1,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(244,0,1,'content',53,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,0,0,0,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:14:\"Dashboard name\";}'),(245,0,0,'content',53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"availableBlocks\":[\"ibexa_news\",\"my_content\",\"common_content\",\"review_queue\",\"quick_actions\",\"ibexa_activity_log_list\",\"top_clicked_items\",\"products_by_categories\",\"products_with_lowest_stock\"]}','ezlandingpage','dashboard',0,1,0,0,1,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:14:\"Dashboard page\";}');
/*!40000 ALTER TABLE `ezcontentclass_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_attribute_ml`
--

DROP TABLE IF EXISTS `ezcontentclass_attribute_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_attribute_ml` (
  `contentclass_attribute_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_json` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`contentclass_attribute_id`,`version`,`language_id`),
  KEY `ezcontentclass_attribute_ml_lang_fk` (`language_id`),
  CONSTRAINT `ezcontentclass_attribute_ml_lang_fk` FOREIGN KEY (`language_id`) REFERENCES `ezcontent_language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_attribute_ml`
--

LOCK TABLES `ezcontentclass_attribute_ml` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_attribute_ml` DISABLE KEYS */;
INSERT INTO `ezcontentclass_attribute_ml` VALUES (116,0,2,'Name',NULL,NULL,NULL),(117,0,2,'Caption',NULL,NULL,NULL),(118,0,2,'Image',NULL,NULL,NULL),(190,0,2,'First name','',NULL,NULL),(191,0,2,'Last name','',NULL,NULL),(192,0,2,'User account','',NULL,NULL),(193,0,2,'Image','',NULL,NULL),(194,0,2,'Signature','',NULL,NULL),(195,0,2,'Job Title','',NULL,NULL),(196,0,2,'Department','',NULL,NULL),(197,0,2,'Location','',NULL,NULL),(198,0,2,'Phone','',NULL,NULL),(199,0,2,'LinkedIn','',NULL,NULL),(200,0,2,'Name','',NULL,NULL),(201,0,2,'Identifier',NULL,NULL,NULL),(202,0,2,'Parent',NULL,NULL,NULL),(203,0,2,'Description',NULL,NULL,NULL),(204,0,2,'Image upload',NULL,NULL,NULL),(205,0,2,'Tags',NULL,NULL,NULL),(206,0,2,'Name',NULL,NULL,NULL),(207,0,2,'Identifier',NULL,NULL,NULL),(208,0,2,'Parent Category',NULL,NULL,NULL),(209,0,2,'Description',NULL,NULL,NULL),(210,0,2,'Image',NULL,NULL,NULL),(211,0,2,'First name','',NULL,NULL),(212,0,2,'Last name','',NULL,NULL),(213,0,2,'Phone','',NULL,NULL),(214,0,2,'User','',NULL,NULL),(215,0,2,'Is active','',NULL,NULL),(216,0,2,'Name','',NULL,NULL),(217,0,2,'Tax ID','',NULL,NULL),(218,0,2,'Website','',NULL,NULL),(219,0,2,'Customer group','',NULL,NULL),(220,0,2,'Sales representative','',NULL,NULL),(221,0,2,'Contact person','',NULL,NULL),(222,0,2,'Default address','',NULL,NULL),(223,0,2,'Billing address','',NULL,NULL),(224,0,2,'Address book','',NULL,NULL),(225,0,2,'Members','',NULL,NULL),(226,0,2,'Name','',NULL,NULL),(227,0,2,'Address','',NULL,NULL),(228,0,2,'E-mail','',NULL,NULL),(229,0,2,'Phone','',NULL,NULL),(230,0,2,'Name','',NULL,NULL),(231,0,2,'Tax ID','',NULL,NULL),(232,0,2,'Address','',NULL,NULL),(233,0,2,'Website','',NULL,NULL),(234,0,2,'First name','',NULL,NULL),(235,0,2,'Last name','',NULL,NULL),(236,0,2,'Phone','',NULL,NULL),(237,0,2,'Email','',NULL,NULL),(238,0,2,'Customer group','',NULL,NULL),(239,0,2,'Sales representative','',NULL,NULL),(240,0,2,'Name','',NULL,NULL),(241,0,2,'Description','',NULL,NULL),(242,0,2,'Customer Portal','',NULL,NULL),(243,0,2,'Name','',NULL,NULL),(244,0,2,'Dashboard name','',NULL,NULL),(245,0,2,'Dashboard page','',NULL,NULL);
/*!40000 ALTER TABLE `ezcontentclass_attribute_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_classgroup`
--

DROP TABLE IF EXISTS `ezcontentclass_classgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_classgroup` (
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `contentclass_version` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`contentclass_id`,`contentclass_version`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_classgroup`
--

LOCK TABLES `ezcontentclass_classgroup` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_classgroup` DISABLE KEYS */;
INSERT INTO `ezcontentclass_classgroup` VALUES (1,0,1,'Content'),(2,0,1,'Content'),(3,0,2,'Users'),(4,0,2,'Users'),(5,0,3,'Media'),(12,0,3,'Media'),(42,0,1,'Content'),(43,0,1,'Content'),(44,0,2,'Users'),(45,0,1,'Content'),(46,0,1,'Content'),(47,0,5,'corporate_account'),(48,0,5,'corporate_account'),(49,0,5,'corporate_account'),(50,0,5,'corporate_account'),(51,0,6,'Customer Portal'),(52,0,6,'Customer Portal'),(53,0,7,'Dashboard');
/*!40000 ALTER TABLE `ezcontentclass_classgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_name`
--

DROP TABLE IF EXISTS `ezcontentclass_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_name` (
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `contentclass_version` int(11) NOT NULL DEFAULT 0,
  `language_id` bigint(20) NOT NULL DEFAULT 0,
  `language_locale` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`contentclass_id`,`contentclass_version`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_name`
--

LOCK TABLES `ezcontentclass_name` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_name` DISABLE KEYS */;
INSERT INTO `ezcontentclass_name` VALUES (1,0,2,'eng-GB','Folder'),(2,0,3,'eng-GB','Article'),(3,0,3,'eng-GB','User group'),(4,0,3,'eng-GB','User'),(5,0,2,'eng-GB','Image'),(12,0,3,'eng-GB','File'),(42,0,2,'eng-GB','Landing page'),(43,0,2,'eng-GB','Form'),(44,0,2,'eng-GB','Editor'),(45,0,2,'eng-GB','Tag'),(46,0,2,'eng-GB','Product category'),(47,0,2,'eng-GB','Member'),(48,0,2,'eng-GB','Company'),(49,0,2,'eng-GB','Shipping address'),(50,0,2,'eng-GB','Corporate Account Application'),(51,0,2,'eng-GB','Customer Portal Page'),(52,0,2,'eng-GB','Customer Portal'),(53,0,2,'eng-GB','Dashboard');
/*!40000 ALTER TABLE `ezcontentclass_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclassgroup`
--

DROP TABLE IF EXISTS `ezcontentclassgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclassgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL DEFAULT 0,
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `modifier_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclassgroup`
--

LOCK TABLES `ezcontentclassgroup` WRITE;
/*!40000 ALTER TABLE `ezcontentclassgroup` DISABLE KEYS */;
INSERT INTO `ezcontentclassgroup` VALUES (1,1031216928,14,1033922106,14,'Content',0),(2,1031216941,14,1033922113,14,'Users',0),(3,1032009743,14,1033922120,14,'Media',0),(4,1736257876,14,1736257876,14,'product',1),(5,1736257877,14,1736257877,14,'corporate_account',1),(6,1736257879,14,1736257879,14,'Customer Portal',0),(7,1736257880,14,1736257880,14,'Dashboard',1);
/*!40000 ALTER TABLE `ezcontentclassgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject`
--

DROP TABLE IF EXISTS `ezcontentobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `current_version` int(11) DEFAULT NULL,
  `initial_language_id` bigint(20) NOT NULL DEFAULT 0,
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 0,
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `section_id` int(11) NOT NULL DEFAULT 0,
  `status` int(11) DEFAULT 0,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcontentobject_remote_id` (`remote_id`),
  KEY `ezcontentobject_classid` (`contentclass_id`),
  KEY `ezcontentobject_lmask` (`language_mask`),
  KEY `ezcontentobject_pub` (`published`),
  KEY `ezcontentobject_section` (`section_id`),
  KEY `ezcontentobject_currentversion` (`current_version`),
  KEY `ezcontentobject_owner` (`owner_id`),
  KEY `ezcontentobject_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject`
--

LOCK TABLES `ezcontentobject` WRITE;
/*!40000 ALTER TABLE `ezcontentobject` DISABLE KEYS */;
INSERT INTO `ezcontentobject` VALUES (1,1,9,2,3,1448889046,'Ibexa Platform',14,1448889046,'9459d3c29e15006e45197295722c7ade',1,1,0),(4,3,1,2,3,1033917596,'Users',14,1033917596,'f5c88a2209584891056f987fd965b0ba',2,1,0),(10,4,2,2,3,1072180405,'Anonymous User',14,1033920665,'faaeb9be3bd98ed09f606fc16d144eca',2,1,0),(11,3,1,2,3,1033920746,'Guest accounts',14,1033920746,'5f7f0bdb3381d6a461d8c29ff53d908f',2,1,0),(12,3,1,2,3,1033920775,'Administrator users',14,1033920775,'9b47a45624b023b1a76c73b74d704acf',2,1,0),(13,3,1,2,3,1033920794,'Editors',14,1033920794,'3c160cca19fb135f83bd02d911f04db2',2,1,0),(14,4,3,2,3,1301062024,'Administrator User',14,1033920830,'1bb4fe25487f05527efa8bfd394cecc7',2,1,0),(41,1,1,2,3,1060695457,'Media',14,1060695457,'a6e35cbcb7cd6ae4b691f3eee30cd262',3,1,0),(42,3,1,2,3,1072180330,'Anonymous users',14,1072180330,'15b256dbea2ae72418ff5facc999e8f9',2,1,0),(49,1,1,2,3,1080220197,'Images',14,1080220197,'e7ff633c6b8e0fd3531e74c6e712bead',3,1,0),(50,1,1,2,3,1080220220,'Files',14,1080220220,'732a5acd01b51a6fe6eab448ad4138a9',3,1,0),(51,1,1,2,3,1080220233,'Multimedia',14,1080220233,'09082deb98662a104f325aaa8c4933d3',3,1,0),(52,42,1,2,3,1442481743,'Ibexa Digital Experience Platform',14,1442481743,'34720ff636e1d4ce512f762dc638e4ac',1,1,0),(53,1,1,2,3,1486473151,'Form Uploads',14,1486473151,'6797ab09a3e84316f09c4ccabce90e2d',3,1,0),(54,1,1,2,2,1537166893,'Forms',14,1537166893,'9e863fbb0fb835ce050032b4f00de61d',6,1,0),(55,1,1,2,3,1586855342,'Site skeletons',14,1586855342,'1ac4a4b7108e607682beaba14ba860c5',7,1,0),(56,1,1,2,3,1736257875,'Taxonomy',14,1736257875,'aee98801c7791bf6f1df72a6b1e4d7d7',8,1,0),(57,1,1,2,3,1736257875,'Tags',14,1736257875,'2c8c0eefd0aac5038380567e17cc9497',8,1,0),(58,45,1,2,3,1736257876,'Root',14,1736257876,'f6179b0bc14ad64cc5e6e4c9fe5b4e71',8,1,0),(59,1,1,2,3,1736257876,'Product catalog',14,1736257876,'b52cd93e7b759c7f1cebaf397014050a',1,1,0),(60,1,1,2,3,1736257877,'Products Taxonomy',14,1736257877,'3e6adec9921c7969a71554bb0c595cac',9,1,0),(61,1,1,2,3,1736257877,'Products Taxonomy',14,1736257877,'762094905ac552a3ee9a8b527be4f404',9,1,0),(62,46,1,2,3,1736257877,'Product Root Tag',14,1736257877,'7e51e4c58e4ee7cc5849402121340d89',9,1,0),(63,3,1,2,3,1736257877,'Sales representatives',14,1736257877,'corporate_account_sales_reps_content',10,1,0),(64,3,1,2,3,1736257878,'Corporate Account',14,1736257878,'7836f87525d334189ccff2a7f8f29830',10,1,0),(65,1,1,2,3,1736257879,'Corporate Account Applications',14,1736257879,'9e940a96cf226b7c6f0c5c8d8ae49fdd',10,1,0),(66,1,1,2,3,1736257880,'Dashboards',14,1736257880,'dashboard_container_folder',11,1,0),(67,1,1,2,3,1736257880,'Predefined dashboards',14,1736257880,'predefined_dashboards_folder',11,1,0),(68,53,3,2,3,1736257881,'Default dashboard',14,1736257880,'default_dashboard_landing_page',11,1,0),(69,1,1,2,3,1736257880,'User dashboards',14,1736257880,'user_dashboards_folder',11,1,0);
/*!40000 ALTER TABLE `ezcontentobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_attribute`
--

DROP TABLE IF EXISTS `ezcontentobject_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL DEFAULT 0,
  `attribute_original_id` int(11) DEFAULT 0,
  `contentclassattribute_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `data_float` double DEFAULT NULL,
  `data_int` int(11) DEFAULT NULL,
  `data_text` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_type_string` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `language_code` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_id` bigint(20) NOT NULL DEFAULT 0,
  `sort_key_int` int(11) NOT NULL DEFAULT 0,
  `sort_key_string` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentobject_attribute_co_id_ver_lang_code` (`contentobject_id`,`version`,`language_code`),
  KEY `ezcontentobject_classattr_id` (`contentclassattribute_id`),
  KEY `sort_key_string` (`sort_key_string`(191)),
  KEY `ezcontentobject_attribute_language_code` (`language_code`),
  KEY `sort_key_int` (`sort_key_int`),
  KEY `ezcontentobject_attribute_co_id_ver` (`contentobject_id`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_attribute`
--

LOCK TABLES `ezcontentobject_attribute` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_attribute` DISABLE KEYS */;
INSERT INTO `ezcontentobject_attribute` VALUES (1,9,0,4,1,NULL,NULL,'Ibexa Platform','ezstring','eng-GB',3,0,'ibexa platform'),(2,9,0,119,1,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?><section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ibexa.co/xmlns/dxp/docbook/xhtml\" xmlns:ezcustom=\"http://ibexa.co/xmlns/dxp/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para><emphasis role=\"strong\">You are now ready to start your project.</emphasis></para></section>','ezrichtext','eng-GB',3,0,''),(7,1,0,7,4,NULL,NULL,'Main group','ezstring','eng-GB',3,0,''),(8,1,0,6,4,NULL,NULL,'Users','ezstring','eng-GB',3,0,''),(19,2,0,8,10,0,0,'Anonymous','ezstring','eng-GB',3,0,'anonymous'),(20,2,0,9,10,0,0,'User','ezstring','eng-GB',3,0,'user'),(21,2,0,12,10,0,0,'','ezuser','eng-GB',3,0,''),(22,1,0,6,11,0,0,'Guest accounts','ezstring','eng-GB',3,0,''),(23,1,0,7,11,0,0,'','ezstring','eng-GB',3,0,''),(24,1,0,6,12,0,0,'Administrator users','ezstring','eng-GB',3,0,''),(25,1,0,7,12,0,0,'','ezstring','eng-GB',3,0,''),(26,1,0,6,13,0,0,'Editors','ezstring','eng-GB',3,0,''),(27,1,0,7,13,0,0,'','ezstring','eng-GB',3,0,''),(28,3,0,8,14,0,0,'Administrator','ezstring','eng-GB',3,0,'administrator'),(29,3,0,9,14,0,0,'User','ezstring','eng-GB',3,0,'user'),(30,3,30,12,14,0,0,'','ezuser','eng-GB',3,0,''),(98,1,0,4,41,0,0,'Media','ezstring','eng-GB',3,0,''),(99,1,0,119,41,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ibexa.co/xmlns/dxp/docbook/xhtml\" xmlns:ezcustom=\"http://ibexa.co/xmlns/dxp/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(100,1,0,6,42,0,0,'Anonymous users','ezstring','eng-GB',3,0,'anonymous users'),(101,1,0,7,42,0,0,'User group for the anonymous user','ezstring','eng-GB',3,0,'user group for the anonymous user'),(102,9,0,155,1,NULL,NULL,'Ibexa Platform','ezstring','eng-GB',3,0,'ibexa platform'),(103,1,0,155,41,0,0,'','ezstring','eng-GB',3,0,''),(104,9,0,156,1,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?><section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ibexa.co/xmlns/dxp/docbook/xhtml\" xmlns:ezcustom=\"http://ibexa.co/xmlns/dxp/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>This is the clean installation coming with Ibexa Platform.</para><para>It\'s a bare-bones setup of the Platform, an excellent foundation to build upon if you want to start your project from scratch.</para></section>','ezrichtext','eng-GB',3,0,''),(105,1,0,156,41,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ibexa.co/xmlns/dxp/docbook/xhtml\" xmlns:ezcustom=\"http://ibexa.co/xmlns/dxp/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(142,1,0,4,49,0,0,'Images','ezstring','eng-GB',3,0,'images'),(143,1,0,155,49,0,0,'','ezstring','eng-GB',3,0,''),(144,1,0,119,49,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ibexa.co/xmlns/dxp/docbook/xhtml\" xmlns:ezcustom=\"http://ibexa.co/xmlns/dxp/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(145,1,0,156,49,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ibexa.co/xmlns/dxp/docbook/xhtml\" xmlns:ezcustom=\"http://ibexa.co/xmlns/dxp/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(147,1,0,4,50,0,0,'Files','ezstring','eng-GB',3,0,'files'),(148,1,0,155,50,0,0,'','ezstring','eng-GB',3,0,''),(149,1,0,119,50,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ibexa.co/xmlns/dxp/docbook/xhtml\" xmlns:ezcustom=\"http://ibexa.co/xmlns/dxp/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(150,1,0,156,50,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ibexa.co/xmlns/dxp/docbook/xhtml\" xmlns:ezcustom=\"http://ibexa.co/xmlns/dxp/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(152,1,0,4,51,0,0,'Multimedia','ezstring','eng-GB',3,0,'multimedia'),(153,1,0,155,51,0,0,'','ezstring','eng-GB',3,0,''),(154,1,0,119,51,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ibexa.co/xmlns/dxp/docbook/xhtml\" xmlns:ezcustom=\"http://ibexa.co/xmlns/dxp/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(155,1,0,156,51,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ibexa.co/xmlns/dxp/docbook/xhtml\" xmlns:ezcustom=\"http://ibexa.co/xmlns/dxp/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(177,2,0,179,10,0,0,'','eztext','eng-GB',3,0,''),(178,3,0,179,14,0,0,'','eztext','eng-GB',3,0,''),(179,2,0,180,10,0,0,'','ezimage','eng-GB',3,0,''),(180,3,0,180,14,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"\" filename=\"\" suffix=\"\" basename=\"\" dirpath=\"\" url=\"\" original_filename=\"\" mime_type=\"\" width=\"\" height=\"\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1301057722\"><original attribute_id=\"180\" attribute_version=\"3\" attribute_language=\"eng-GB\"/></ezimage>\n','ezimage','eng-GB',3,0,''),(242,1,0,185,52,NULL,NULL,'Ibexa Digital Experience Platform','ezstring','eng-GB',3,0,'ibexa digital experience platform'),(243,1,0,186,52,NULL,NULL,'You are now ready to start your project.','ezstring','eng-GB',3,0,'you are now ready to start your project.'),(244,1,0,187,52,NULL,NULL,NULL,'ezlandingpage','eng-GB',3,0,'ibexa digital experience platform'),(245,1,0,4,53,NULL,NULL,'Form Uploads','ezstring','eng-GB',3,0,'form uploads'),(246,1,0,155,53,NULL,NULL,'form uploads','ezstring','eng-GB',3,0,'form uploads'),(247,1,0,119,53,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ibexa.co/xmlns/dxp/docbook/xhtml\" xmlns:ezcustom=\"http://ibexa.co/xmlns/dxp/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>Folder for file uploads</para></section>\n','ezrichtext','eng-GB',3,0,''),(248,1,0,156,53,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(249,1,0,4,54,NULL,NULL,'Forms','ezstring','eng-GB',2,0,'forms'),(250,1,0,155,54,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(251,1,0,119,54,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,''),(252,1,0,156,54,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,''),(253,1,0,4,55,NULL,NULL,'Site skeletons','ezstring','eng-GB',3,0,'site skeletons'),(254,1,0,155,55,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(255,1,0,119,55,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(256,1,0,156,55,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(257,1,0,4,56,NULL,NULL,'Taxonomy','ezstring','eng-GB',3,0,'taxonomy'),(258,1,0,155,56,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(259,1,0,119,56,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(260,1,0,156,56,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(261,1,0,4,57,NULL,NULL,'Tags','ezstring','eng-GB',3,0,'tags'),(262,1,0,155,57,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(263,1,0,119,57,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(264,1,0,156,57,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(265,1,0,200,58,NULL,NULL,'Root','ezstring','eng-GB',3,0,'root'),(266,1,0,201,58,NULL,NULL,'root','ezstring','eng-GB',3,0,'root'),(267,1,0,202,58,NULL,NULL,NULL,'ibexa_taxonomy_entry','eng-GB',3,0,''),(268,1,0,203,58,NULL,NULL,NULL,'eztext','eng-GB',3,0,''),(269,1,0,204,58,NULL,NULL,NULL,'ezimage','eng-GB',3,0,''),(270,1,0,4,59,NULL,NULL,'Product catalog','ezstring','eng-GB',3,0,'product catalog'),(271,1,0,155,59,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(272,1,0,119,59,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(273,1,0,156,59,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(274,1,0,4,60,NULL,NULL,'Products Taxonomy','ezstring','eng-GB',3,0,'products taxonomy'),(275,1,0,155,60,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(276,1,0,119,60,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(277,1,0,156,60,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(278,1,0,4,61,NULL,NULL,'Products Taxonomy','ezstring','eng-GB',3,0,'products taxonomy'),(279,1,0,155,61,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(280,1,0,119,61,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(281,1,0,156,61,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(282,1,0,206,62,NULL,NULL,'Product Root Tag','ezstring','eng-GB',3,0,'product root tag'),(283,1,0,207,62,NULL,NULL,'product_root','ezstring','eng-GB',3,0,'product_root'),(284,1,0,208,62,NULL,NULL,NULL,'ibexa_taxonomy_entry','eng-GB',3,0,''),(285,1,0,209,62,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(286,1,0,210,62,NULL,NULL,'{\"destinationContentId\":null,\"alternativeText\":null,\"source\":null}','ezimageasset','eng-GB',3,0,''),(287,1,0,6,63,NULL,NULL,'Sales representatives','ezstring','eng-GB',3,0,'sales representatives'),(288,1,0,7,63,NULL,NULL,'Sales representatives','ezstring','eng-GB',3,0,'sales representatives'),(289,1,0,6,64,NULL,NULL,'Corporate Account','ezstring','eng-GB',3,0,'corporate account'),(290,1,0,7,64,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(291,1,0,4,65,NULL,NULL,'Corporate Account Applications','ezstring','eng-GB',3,0,'corporate account applications'),(292,1,0,155,65,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(293,1,0,119,65,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(294,1,0,156,65,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(295,1,0,4,66,NULL,NULL,'Dashboards','ezstring','eng-GB',3,0,'dashboards'),(296,1,0,155,66,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(297,1,0,119,66,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(298,1,0,156,66,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(299,1,0,4,67,NULL,NULL,'Predefined dashboards','ezstring','eng-GB',3,0,'predefined dashboards'),(300,1,0,155,67,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(301,1,0,119,67,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(302,1,0,156,67,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(303,1,0,244,68,NULL,NULL,'Default dashboard','ezstring','eng-GB',3,0,'default dashboard'),(303,2,0,244,68,NULL,NULL,'Default dashboard','ezstring','eng-GB',3,0,'default dashboard'),(303,3,0,244,68,NULL,NULL,'Default dashboard','ezstring','eng-GB',3,0,'default dashboard'),(304,1,0,245,68,NULL,NULL,NULL,'ezlandingpage','eng-GB',3,0,''),(304,2,0,245,68,NULL,NULL,NULL,'ezlandingpage','eng-GB',3,0,''),(304,3,0,245,68,NULL,NULL,NULL,'ezlandingpage','eng-GB',3,0,''),(305,1,0,4,69,NULL,NULL,'User dashboards','ezstring','eng-GB',3,0,'user dashboards'),(306,1,0,155,69,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(307,1,0,119,69,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(308,1,0,156,69,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,'');
/*!40000 ALTER TABLE `ezcontentobject_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_link`
--

DROP TABLE IF EXISTS `ezcontentobject_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentclassattribute_id` int(11) NOT NULL DEFAULT 0,
  `from_contentobject_id` int(11) NOT NULL DEFAULT 0,
  `from_contentobject_version` int(11) NOT NULL DEFAULT 0,
  `relation_type` int(11) NOT NULL DEFAULT 1,
  `to_contentobject_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ezco_link_to_co_id` (`to_contentobject_id`),
  KEY `ezco_link_from` (`from_contentobject_id`,`from_contentobject_version`,`contentclassattribute_id`),
  KEY `ezco_link_cca_id` (`contentclassattribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_link`
--

LOCK TABLES `ezcontentobject_link` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcontentobject_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_name`
--

DROP TABLE IF EXISTS `ezcontentobject_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_name` (
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `content_version` int(11) NOT NULL DEFAULT 0,
  `content_translation` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `real_translation` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`contentobject_id`,`content_version`,`content_translation`),
  KEY `ezcontentobject_name_lang_id` (`language_id`),
  KEY `ezcontentobject_name_cov_id` (`content_version`),
  KEY `ezcontentobject_name_name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_name`
--

LOCK TABLES `ezcontentobject_name` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_name` DISABLE KEYS */;
INSERT INTO `ezcontentobject_name` VALUES (1,9,'eng-GB',2,'Ibexa Platform','eng-GB'),(4,1,'eng-GB',3,'Users','eng-GB'),(10,2,'eng-GB',3,'Anonymous User','eng-GB'),(11,1,'eng-GB',3,'Guest accounts','eng-GB'),(12,1,'eng-GB',3,'Administrator users','eng-GB'),(13,1,'eng-GB',3,'Editors','eng-GB'),(14,3,'eng-GB',3,'Administrator User','eng-GB'),(41,1,'eng-GB',3,'Media','eng-GB'),(42,1,'eng-GB',3,'Anonymous users','eng-GB'),(49,1,'eng-GB',3,'Images','eng-GB'),(50,1,'eng-GB',3,'Files','eng-GB'),(51,1,'eng-GB',3,'Multimedia','eng-GB'),(52,1,'eng-GB',2,'Ibexa Digital Experience Platform','eng-GB'),(53,1,'eng-GB',2,'Form Uploads','eng-GB'),(54,1,'eng-GB',3,'Forms','eng-GB'),(55,1,'eng-GB',3,'Site skeletons','eng-GB'),(56,1,'eng-GB',3,'Taxonomy','eng-GB'),(57,1,'eng-GB',3,'Tags','eng-GB'),(58,1,'eng-GB',3,'Root','eng-GB'),(59,1,'eng-GB',3,'Product catalog','eng-GB'),(60,1,'eng-GB',3,'Products Taxonomy','eng-GB'),(61,1,'eng-GB',3,'Products Taxonomy','eng-GB'),(62,1,'eng-GB',3,'Product Root Tag','eng-GB'),(63,1,'eng-GB',3,'Sales representatives','eng-GB'),(64,1,'eng-GB',3,'Corporate Account','eng-GB'),(65,1,'eng-GB',3,'Corporate Account Applications','eng-GB'),(66,1,'eng-GB',3,'Dashboards','eng-GB'),(67,1,'eng-GB',3,'Predefined dashboards','eng-GB'),(68,1,'eng-GB',3,'Default dashboard','eng-GB'),(68,2,'eng-GB',3,'Default dashboard','eng-GB'),(68,3,'eng-GB',3,'Default dashboard','eng-GB'),(69,1,'eng-GB',3,'User dashboards','eng-GB');
/*!40000 ALTER TABLE `ezcontentobject_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_trash`
--

DROP TABLE IF EXISTS `ezcontentobject_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_trash` (
  `node_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `is_hidden` int(11) NOT NULL DEFAULT 0,
  `is_invisible` int(11) NOT NULL DEFAULT 0,
  `main_node_id` int(11) DEFAULT NULL,
  `modified_subnode` int(11) DEFAULT 0,
  `parent_node_id` int(11) NOT NULL DEFAULT 0,
  `path_identification_string` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `path_string` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT 0,
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `sort_field` int(11) DEFAULT 1,
  `sort_order` int(11) DEFAULT 1,
  `trashed` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`node_id`),
  KEY `ezcobj_trash_depth` (`depth`),
  KEY `ezcobj_trash_p_node_id` (`parent_node_id`),
  KEY `ezcobj_trash_path_ident` (`path_identification_string`(50)),
  KEY `ezcobj_trash_co_id` (`contentobject_id`),
  KEY `ezcobj_trash_modified_subnode` (`modified_subnode`),
  KEY `ezcobj_trash_path` (`path_string`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_trash`
--

LOCK TABLES `ezcontentobject_trash` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcontentobject_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_tree`
--

DROP TABLE IF EXISTS `ezcontentobject_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_tree` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_is_published` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `is_hidden` int(11) NOT NULL DEFAULT 0,
  `is_invisible` int(11) NOT NULL DEFAULT 0,
  `main_node_id` int(11) DEFAULT NULL,
  `modified_subnode` int(11) DEFAULT 0,
  `parent_node_id` int(11) NOT NULL DEFAULT 0,
  `path_identification_string` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `path_string` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT 0,
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `sort_field` int(11) DEFAULT 1,
  `sort_order` int(11) DEFAULT 1,
  PRIMARY KEY (`node_id`),
  KEY `ezcontentobject_tree_p_node_id` (`parent_node_id`),
  KEY `ezcontentobject_tree_path_ident` (`path_identification_string`(50)),
  KEY `ezcontentobject_tree_contentobject_id_path_string` (`path_string`(191),`contentobject_id`),
  KEY `ezcontentobject_tree_co_id` (`contentobject_id`),
  KEY `ezcontentobject_tree_depth` (`depth`),
  KEY `ezcontentobject_tree_path` (`path_string`(191)),
  KEY `modified_subnode` (`modified_subnode`),
  KEY `ezcontentobject_tree_remote_id` (`remote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_tree`
--

LOCK TABLES `ezcontentobject_tree` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_tree` DISABLE KEYS */;
INSERT INTO `ezcontentobject_tree` VALUES (1,0,1,1,0,0,0,1,1448999778,1,'','/1/',0,'629709ba256fe317c3ddcee35453a96a',1,1),(2,52,1,1,1,0,0,2,1301073466,1,'node_2','/1/2/',0,'f3e90596361e31d496d4026eb624c983',8,1),(5,4,1,1,1,0,0,5,1301062024,1,'users','/1/5/',0,'3f6d92f8044aed134f32153517850f5a',1,1),(12,11,1,1,2,0,0,12,1081860719,5,'users/guest_accounts','/1/5/12/',0,'602dcf84765e56b7f999eaafd3821dd3',1,1),(13,12,1,1,2,0,0,13,1301062024,5,'users/administrator_users','/1/5/13/',0,'769380b7aa94541679167eab817ca893',1,1),(14,13,1,1,2,0,0,14,1081860719,5,'users/editors','/1/5/14/',0,'f7dda2854fc68f7c8455d9cb14bd04a9',1,1),(15,14,1,3,3,0,0,15,1301062024,13,'users/administrator_users/administrator_user','/1/5/13/15/',0,'e5161a99f733200b9ed4e80f9c16187b',1,1),(42,1,1,9,2,0,0,42,1486473151,2,'node_2/ez_platform','/1/2/42/',0,'581da01017b80b1afb1e5e2a3081c724',1,1),(43,41,1,1,1,0,0,43,1081860720,1,'media','/1/43/',0,'75c715a51699d2d309a924eca6a95145',9,1),(44,42,1,1,2,0,0,44,1081860719,5,'users/anonymous_users','/1/5/44/',0,'4fdf0072da953bb276c0c7e0141c5c9b',9,1),(45,10,1,2,3,0,0,45,1081860719,44,'users/anonymous_users/anonymous_user','/1/5/44/45/',0,'2cf8343bee7b482bab82b269d8fecd76',9,1),(51,49,1,1,2,0,0,51,1081860720,43,'media/images','/1/43/51/',0,'1b26c0454b09bb49dfb1b9190ffd67cb',9,1),(52,50,1,1,2,0,0,52,1081860720,43,'media/files','/1/43/52/',0,'0b113a208f7890f9ad3c24444ff5988c',9,1),(53,51,1,1,2,0,0,53,1081860720,43,'media/multimedia','/1/43/53/',0,'4f18b82c75f10aad476cae5adf98c11f',9,1),(54,53,1,1,3,0,0,54,1486473151,52,'media/files/form_uploads','/1/43/52/54/',0,'0543630fa051a1e2be54dbd32da2420f',1,1),(55,54,1,1,1,0,0,55,1537166893,1,'forms','/1/55/',0,'1dad43be47e3a5c12cd06010aab65112',9,1),(56,55,1,1,2,0,0,56,1586855342,1,'site_skeletons','/1/56/',0,'9658f6deaeef9fc27300df5d5f566b37',9,1),(57,56,1,1,1,0,0,57,1736257875,1,'taxonomy','/1/57/',0,'b265c6aff1a297c36bb28cc10b3bbf79',9,1),(58,57,1,1,2,0,0,58,1736257875,57,'taxonomy/tags','/1/57/58/',0,'taxonomy_tags_folder',9,1),(59,58,1,1,3,0,0,59,1736257876,58,'taxonomy/tags/root','/1/57/58/59/',0,'taxonomy_tags_root',9,1),(60,59,1,1,1,0,0,60,1736257876,1,'product_catalog','/1/60/',0,'ibexa_product_catalog_root',9,1),(61,60,1,1,1,0,0,61,1736257877,1,'products_taxonomy','/1/61/',0,'product_category_taxonomy_folder',1,1),(62,61,1,1,2,0,0,62,1736257877,61,'products_taxonomy/products_taxonomy','/1/61/62/',0,'product_category_taxonomy_folder_root',1,1),(63,62,1,1,3,0,0,63,1736257877,62,'products_taxonomy/products_taxonomy/product_root_tag','/1/61/62/63/',0,'product_category_taxonomy_tag_root',2,0),(64,63,1,1,2,0,0,64,1736257877,5,'users/sales_representatives','/1/5/64/',0,'corporate_account_sales_reps',9,1),(65,64,1,1,1,0,0,65,1736257878,1,'corporate_account','/1/65/',0,'corporate_account_folder',9,1),(66,65,1,1,1,0,0,66,1736257879,1,'corporate_account_applications','/1/66/',0,'corporate_account_applications_folder',2,0),(67,66,1,1,1,0,0,67,1736257880,1,'dashboards','/1/67/',0,'dashboard_container',9,1),(68,67,1,1,2,0,0,68,1736257880,67,'dashboards/predefined_dashboards','/1/67/68/',0,'predefined_dashboards',9,1),(69,68,1,3,3,0,0,69,1736257880,68,'dashboards/predefined_dashboards/default_dashboard','/1/67/68/69/',0,'default_dashboard',9,0),(70,69,1,1,2,0,0,70,1736257880,67,'dashboards/user_dashboards','/1/67/70/',0,'user_dashboards',9,1);
/*!40000 ALTER TABLE `ezcontentobject_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_version`
--

DROP TABLE IF EXISTS `ezcontentobject_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT 0,
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `initial_language_id` bigint(20) NOT NULL DEFAULT 0,
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `version` int(11) NOT NULL DEFAULT 0,
  `workflow_event_pos` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ezcobj_version_status` (`status`),
  KEY `idx_object_version_objver` (`contentobject_id`,`version`),
  KEY `ezcontobj_version_obj_status` (`contentobject_id`,`status`),
  KEY `ezcobj_version_creator_id` (`creator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=532 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_version`
--

LOCK TABLES `ezcontentobject_version` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_version` DISABLE KEYS */;
INSERT INTO `ezcontentobject_version` VALUES (4,4,0,14,2,3,0,1,0,1,1),(439,11,1033920737,14,2,3,1033920746,1,0,1,0),(440,12,1033920760,14,2,3,1033920775,1,0,1,0),(441,13,1033920786,14,2,3,1033920794,1,0,1,0),(472,41,1060695450,14,2,3,1060695457,1,0,1,0),(473,42,1072180278,14,2,3,1072180330,1,0,1,0),(474,10,1072180337,14,2,3,1072180405,1,0,2,0),(488,49,1080220181,14,2,3,1080220197,1,0,1,0),(489,50,1080220211,14,2,3,1080220220,1,0,1,0),(490,51,1080220225,14,2,3,1080220233,1,0,1,0),(499,14,1301061783,14,2,3,1301062024,1,0,3,0),(506,1,1448889045,14,2,3,1448889046,1,0,9,0),(512,52,1442481742,14,2,3,1442481743,1,0,1,0),(513,53,1486473143,14,2,3,1486473151,1,0,1,0),(514,54,1537166893,14,2,2,1537166893,1,0,1,0),(515,55,1586855342,14,2,3,1586855342,1,0,1,0),(516,56,1736257875,14,2,3,1736257875,1,0,1,0),(517,57,1736257875,14,2,3,1736257876,1,0,1,0),(518,58,1736257876,14,2,3,1736257876,1,0,1,0),(519,59,1736257876,14,2,3,1736257876,1,0,1,0),(520,60,1736257877,14,2,3,1736257877,1,0,1,0),(521,61,1736257877,14,2,3,1736257877,1,0,1,0),(522,62,1736257877,14,2,3,1736257877,1,0,1,0),(523,63,1736257877,14,2,3,1736257877,1,0,1,0),(524,64,1736257877,14,2,3,1736257878,1,0,1,0),(525,65,1736257879,14,2,3,1736257879,1,0,1,0),(526,66,1736257880,14,2,3,1736257880,1,0,1,0),(527,67,1736257880,14,2,3,1736257880,1,0,1,0),(528,68,1736257880,14,2,3,1736257881,3,0,1,0),(529,69,1736257880,14,2,3,1736257880,1,0,1,0),(530,68,1736257880,14,2,3,1736257881,3,0,2,0),(531,68,1736257881,14,2,3,1736257881,1,0,3,0);
/*!40000 ALTER TABLE `ezcontentobject_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezdatebasedpublisher_scheduled_entries`
--

DROP TABLE IF EXISTS `ezdatebasedpublisher_scheduled_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezdatebasedpublisher_scheduled_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `version_id` int(11) DEFAULT NULL,
  `version_number` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `action_timestamp` int(11) NOT NULL,
  `action` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `url_root` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_id_version_number_action` (`content_id`,`version_number`,`action`),
  KEY `content_id` (`content_id`),
  KEY `version_id` (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezdatebasedpublisher_scheduled_entries`
--

LOCK TABLES `ezdatebasedpublisher_scheduled_entries` WRITE;
/*!40000 ALTER TABLE `ezdatebasedpublisher_scheduled_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezdatebasedpublisher_scheduled_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezdfsfile`
--

DROP TABLE IF EXISTS `ezdfsfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezdfsfile` (
  `name_hash` varchar(34) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name_trunk` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'application/octet-stream',
  `scope` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `mtime` int(11) NOT NULL DEFAULT 0,
  `expired` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name_hash`),
  KEY `ezdfsfile_name_trunk` (`name_trunk`(191)),
  KEY `ezdfsfile_expired_name` (`expired`,`name`(191)),
  KEY `ezdfsfile_name` (`name`(191)),
  KEY `ezdfsfile_mtime` (`mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezdfsfile`
--

LOCK TABLES `ezdfsfile` WRITE;
/*!40000 ALTER TABLE `ezdfsfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezdfsfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezeditorialworkflow_markings`
--

DROP TABLE IF EXISTS `ezeditorialworkflow_markings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezeditorialworkflow_markings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `result` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_workflow_id_markings` (`workflow_id`),
  CONSTRAINT `fk_ezeditorialworkflow_markings_workflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `ezeditorialworkflow_workflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezeditorialworkflow_markings`
--

LOCK TABLES `ezeditorialworkflow_markings` WRITE;
/*!40000 ALTER TABLE `ezeditorialworkflow_markings` DISABLE KEYS */;
INSERT INTO `ezeditorialworkflow_markings` VALUES (1,1,'draft','',NULL,'[]'),(2,2,'draft','',NULL,'[]'),(3,3,'draft','',NULL,'[]'),(4,4,'draft','',NULL,'[]'),(5,5,'draft','',NULL,'[]'),(6,6,'draft','',NULL,'[]'),(7,7,'draft','',NULL,'[]'),(8,8,'draft','',NULL,'[]'),(9,9,'draft','',NULL,'[]'),(10,10,'draft','',NULL,'[]'),(11,11,'draft','',NULL,'[]'),(12,12,'draft','',NULL,'[]'),(13,13,'draft','',NULL,'[]'),(14,14,'draft','',NULL,'[]');
/*!40000 ALTER TABLE `ezeditorialworkflow_markings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezeditorialworkflow_transitions`
--

DROP TABLE IF EXISTS `ezeditorialworkflow_transitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezeditorialworkflow_transitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_workflow_id_transitions` (`workflow_id`),
  CONSTRAINT `fk_ezeditorialworkflow_transitions_workflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `ezeditorialworkflow_workflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezeditorialworkflow_transitions`
--

LOCK TABLES `ezeditorialworkflow_transitions` WRITE;
/*!40000 ALTER TABLE `ezeditorialworkflow_transitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezeditorialworkflow_transitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezeditorialworkflow_workflows`
--

DROP TABLE IF EXISTS `ezeditorialworkflow_workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezeditorialworkflow_workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `version_no` int(11) NOT NULL,
  `workflow_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `initial_owner_id` int(11) DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_workflow_id` (`id`),
  KEY `idx_workflow_co_id_ver` (`content_id`,`version_no`),
  KEY `idx_workflow_name` (`workflow_name`),
  KEY `initial_owner_id` (`initial_owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezeditorialworkflow_workflows`
--

LOCK TABLES `ezeditorialworkflow_workflows` WRITE;
/*!40000 ALTER TABLE `ezeditorialworkflow_workflows` DISABLE KEYS */;
INSERT INTO `ezeditorialworkflow_workflows` VALUES (1,56,1,'quick_review',14,1736257875),(2,57,1,'quick_review',14,1736257875),(3,58,1,'quick_review',14,1736257876),(4,59,1,'quick_review',14,1736257876),(5,60,1,'quick_review',14,1736257877),(6,61,1,'quick_review',14,1736257877),(7,62,1,'quick_review',14,1736257877),(8,63,1,'quick_review',14,1736257877),(9,64,1,'quick_review',14,1736257878),(10,65,1,'quick_review',14,1736257879),(11,66,1,'quick_review',14,1736257880),(12,67,1,'quick_review',14,1736257880),(13,68,1,'quick_review',14,1736257880),(14,69,1,'quick_review',14,1736257880);
/*!40000 ALTER TABLE `ezeditorialworkflow_workflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_field_attributes`
--

DROP TABLE IF EXISTS `ezform_field_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_field_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezform_fa_f_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_field_attributes`
--

LOCK TABLES `ezform_field_attributes` WRITE;
/*!40000 ALTER TABLE `ezform_field_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_field_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_field_validators`
--

DROP TABLE IF EXISTS `ezform_field_validators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_field_validators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezform_fv_f_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_field_validators`
--

LOCK TABLES `ezform_field_validators` WRITE;
/*!40000 ALTER TABLE `ezform_field_validators` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_field_validators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_fields`
--

DROP TABLE IF EXISTS `ezform_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_fields`
--

LOCK TABLES `ezform_fields` WRITE;
/*!40000 ALTER TABLE `ezform_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_form_submission_data`
--

DROP TABLE IF EXISTS `ezform_form_submission_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_form_submission_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_submission_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_form_submission_data`
--

LOCK TABLES `ezform_form_submission_data` WRITE;
/*!40000 ALTER TABLE `ezform_form_submission_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_form_submission_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_form_submissions`
--

DROP TABLE IF EXISTS `ezform_form_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_form_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `language_code` varchar(6) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_form_submissions`
--

LOCK TABLES `ezform_form_submissions` WRITE;
/*!40000 ALTER TABLE `ezform_form_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_form_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_forms`
--

DROP TABLE IF EXISTS `ezform_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  `content_field_id` int(11) DEFAULT NULL,
  `language_code` varchar(16) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_forms`
--

LOCK TABLES `ezform_forms` WRITE;
/*!40000 ALTER TABLE `ezform_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezgmaplocation`
--

DROP TABLE IF EXISTS `ezgmaplocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezgmaplocation` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_version` int(11) NOT NULL DEFAULT 0,
  `latitude` double NOT NULL DEFAULT 0,
  `longitude` double NOT NULL DEFAULT 0,
  `address` varchar(150) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`contentobject_attribute_id`,`contentobject_version`),
  KEY `latitude_longitude_key` (`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezgmaplocation`
--

LOCK TABLES `ezgmaplocation` WRITE;
/*!40000 ALTER TABLE `ezgmaplocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezgmaplocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezimagefile`
--

DROP TABLE IF EXISTS `ezimagefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezimagefile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `filepath` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ezimagefile_file` (`filepath`(191)),
  KEY `ezimagefile_coid` (`contentobject_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezimagefile`
--

LOCK TABLES `ezimagefile` WRITE;
/*!40000 ALTER TABLE `ezimagefile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezimagefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezkeyword`
--

DROP TABLE IF EXISTS `ezkeyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezkeyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL DEFAULT 0,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezkeyword_keyword` (`keyword`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezkeyword`
--

LOCK TABLES `ezkeyword` WRITE;
/*!40000 ALTER TABLE `ezkeyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezkeyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezkeyword_attribute_link`
--

DROP TABLE IF EXISTS `ezkeyword_attribute_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezkeyword_attribute_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) NOT NULL DEFAULT 0,
  `objectattribute_id` int(11) NOT NULL DEFAULT 0,
  `version` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ezkeyword_attr_link_oaid` (`objectattribute_id`),
  KEY `ezkeyword_attr_link_kid_oaid` (`keyword_id`,`objectattribute_id`),
  KEY `ezkeyword_attr_link_oaid_ver` (`objectattribute_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezkeyword_attribute_link`
--

LOCK TABLES `ezkeyword_attribute_link` WRITE;
/*!40000 ALTER TABLE `ezkeyword_attribute_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezkeyword_attribute_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezmedia`
--

DROP TABLE IF EXISTS `ezmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezmedia` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `version` int(11) NOT NULL DEFAULT 0,
  `controls` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `has_controller` int(11) DEFAULT 0,
  `height` int(11) DEFAULT NULL,
  `is_autoplay` int(11) DEFAULT 0,
  `is_loop` int(11) DEFAULT 0,
  `mime_type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `original_filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `pluginspage` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `quality` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentobject_attribute_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezmedia`
--

LOCK TABLES `ezmedia` WRITE;
/*!40000 ALTER TABLE `ezmedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eznode_assignment`
--

DROP TABLE IF EXISTS `eznode_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eznode_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `from_node_id` int(11) DEFAULT 0,
  `is_main` int(11) NOT NULL DEFAULT 0,
  `op_code` int(11) NOT NULL DEFAULT 0,
  `parent_node` int(11) DEFAULT NULL,
  `parent_remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `sort_field` int(11) DEFAULT 1,
  `sort_order` int(11) DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 0,
  `is_hidden` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `eznode_assignment_is_main` (`is_main`),
  KEY `eznode_assignment_coid_cov` (`contentobject_id`,`contentobject_version`),
  KEY `eznode_assignment_parent_node` (`parent_node`),
  KEY `eznode_assignment_co_version` (`contentobject_version`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eznode_assignment`
--

LOCK TABLES `eznode_assignment` WRITE;
/*!40000 ALTER TABLE `eznode_assignment` DISABLE KEYS */;
INSERT INTO `eznode_assignment` VALUES (4,8,2,0,1,2,5,'','0',1,1,0,0),(5,42,1,0,1,2,5,'','0',9,1,0,0),(6,10,2,-1,1,2,44,'','0',9,1,0,0),(7,4,1,0,1,2,1,'','0',1,1,0,0),(8,12,1,0,1,2,5,'','0',1,1,0,0),(9,13,1,0,1,2,5,'','0',1,1,0,0),(11,41,1,0,1,2,1,'','0',1,1,0,0),(12,11,1,0,1,2,5,'','0',1,1,0,0),(27,49,1,0,1,2,43,'','0',9,1,0,0),(28,50,1,0,1,2,43,'','0',9,1,0,0),(29,51,1,0,1,2,43,'','0',9,1,0,0),(38,14,3,-1,1,2,13,'','0',1,1,0,0),(40,53,1,0,1,2,52,'0543630fa051a1e2be54dbd32da2420f','0',1,1,0,0),(41,54,1,0,1,2,2,'1dad43be47e3a5c12cd06010aab65112','0',9,1,0,0),(42,55,1,0,1,2,2,'9658f6deaeef9fc27300df5d5f566b37','0',9,1,0,0),(43,56,1,0,1,2,1,'b265c6aff1a297c36bb28cc10b3bbf79','0',9,1,0,0),(44,57,1,0,1,2,57,'taxonomy_tags_folder','0',9,1,0,0),(45,58,1,0,1,2,58,'taxonomy_tags_root','0',9,1,0,0),(46,59,1,0,1,2,1,'ibexa_product_catalog_root','0',9,1,0,0),(47,60,1,0,1,2,1,'product_category_taxonomy_folder','0',1,1,0,0),(48,61,1,0,1,2,61,'product_category_taxonomy_folder_root','0',1,1,0,0),(49,62,1,0,1,2,62,'product_category_taxonomy_tag_root','0',2,0,0,0),(50,63,1,0,1,2,5,'corporate_account_sales_reps','0',9,1,0,0),(51,64,1,0,1,2,1,'corporate_account_folder','0',9,1,0,0),(52,65,1,0,1,2,1,'corporate_account_applications_folder','0',2,0,0,0),(53,66,1,0,1,2,1,'dashboard_container','0',9,1,0,0),(54,67,1,0,1,2,67,'predefined_dashboards','0',9,1,0,0),(55,68,1,0,1,2,68,'default_dashboard','0',9,0,0,0),(56,69,1,0,1,2,67,'user_dashboards','0',9,1,0,0);
/*!40000 ALTER TABLE `eznode_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eznotification`
--

DROP TABLE IF EXISTS `eznotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eznotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `is_pending` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT 0,
  `data` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eznotification_owner_is_pending` (`owner_id`,`is_pending`),
  KEY `eznotification_owner` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eznotification`
--

LOCK TABLES `eznotification` WRITE;
/*!40000 ALTER TABLE `eznotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `eznotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpackage`
--

DROP TABLE IF EXISTS `ezpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpackage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `install_date` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `version` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpackage`
--

LOCK TABLES `ezpackage` WRITE;
/*!40000 ALTER TABLE `ezpackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_attributes`
--

DROP TABLE IF EXISTS `ezpage_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_attributes`
--

LOCK TABLES `ezpage_attributes` WRITE;
/*!40000 ALTER TABLE `ezpage_attributes` DISABLE KEYS */;
INSERT INTO `ezpage_attributes` VALUES (1,'actions','create_content,create_form,create_product,create_catalog,create_company'),(2,'show_only_current_user','0'),(3,'limit','5'),(4,'limit','7');
/*!40000 ALTER TABLE `ezpage_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_blocks`
--

DROP TABLE IF EXISTS `ezpage_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `view` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_blocks`
--

LOCK TABLES `ezpage_blocks` WRITE;
/*!40000 ALTER TABLE `ezpage_blocks` DISABLE KEYS */;
INSERT INTO `ezpage_blocks` VALUES (1,'quick_actions','default','Quick actions'),(2,'ibexa_news','default','Ibexa news'),(3,'review_queue','default','Review queue'),(4,'my_content','default','My content'),(5,'common_content','default','Common content'),(6,'quick_actions','default','Quick actions'),(7,'ibexa_news','default','Ibexa news'),(8,'review_queue','default','Review queue'),(9,'my_content','default','My content'),(10,'common_content','default','Common content'),(11,'quick_actions','default','Quick actions'),(12,'ibexa_news','default','Ibexa news'),(13,'review_queue','default','Review queue'),(14,'my_content','default','My content'),(15,'common_content','default','Common content'),(16,'quick_actions','default','Quick actions'),(17,'ibexa_activity_log_list','activity_log_list','Recent activity'),(18,'ibexa_news','default','Ibexa news'),(19,'review_queue','default','Review queue'),(20,'my_content','default','My content'),(21,'common_content','default','Common content');
/*!40000 ALTER TABLE `ezpage_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_blocks_design`
--

DROP TABLE IF EXISTS `ezpage_blocks_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_blocks_design` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `style` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `compiled` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpage_blocks_design_block_id` (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_blocks_design`
--

LOCK TABLES `ezpage_blocks_design` WRITE;
/*!40000 ALTER TABLE `ezpage_blocks_design` DISABLE KEYS */;
INSERT INTO `ezpage_blocks_design` VALUES (1,1,NULL,'',NULL),(2,2,NULL,'',NULL),(3,3,NULL,'',NULL),(4,4,NULL,'',NULL),(5,5,NULL,'',NULL),(6,6,NULL,'',NULL),(7,7,NULL,'',NULL),(8,8,NULL,'',NULL),(9,9,NULL,'',NULL),(10,10,NULL,'',NULL),(11,11,NULL,'',NULL),(12,12,NULL,'',NULL),(13,13,NULL,'',NULL),(14,14,NULL,'',NULL),(15,15,NULL,'',NULL),(16,16,NULL,'',NULL),(17,17,NULL,'',NULL),(18,18,NULL,'',NULL),(19,19,NULL,'',NULL),(20,20,NULL,'',NULL),(21,21,NULL,'',NULL);
/*!40000 ALTER TABLE `ezpage_blocks_design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_blocks_visibility`
--

DROP TABLE IF EXISTS `ezpage_blocks_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_blocks_visibility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `since` int(11) DEFAULT NULL,
  `till` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpage_blocks_visibility_block_id` (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_blocks_visibility`
--

LOCK TABLES `ezpage_blocks_visibility` WRITE;
/*!40000 ALTER TABLE `ezpage_blocks_visibility` DISABLE KEYS */;
INSERT INTO `ezpage_blocks_visibility` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL),(3,3,NULL,NULL),(4,4,NULL,NULL),(5,5,NULL,NULL),(6,6,NULL,NULL),(7,7,NULL,NULL),(8,8,NULL,NULL),(9,9,NULL,NULL),(10,10,NULL,NULL),(11,11,NULL,NULL),(12,12,NULL,NULL),(13,13,NULL,NULL),(14,14,NULL,NULL),(15,15,NULL,NULL),(16,16,NULL,NULL),(17,17,NULL,NULL),(18,18,NULL,NULL),(19,19,NULL,NULL),(20,20,NULL,NULL),(21,21,NULL,NULL);
/*!40000 ALTER TABLE `ezpage_blocks_visibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_map_attributes_blocks`
--

DROP TABLE IF EXISTS `ezpage_map_attributes_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_map_attributes_blocks` (
  `attribute_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_id`,`block_id`),
  KEY `ezpage_map_attributes_blocks_attribute_id` (`attribute_id`),
  KEY `ezpage_map_attributes_blocks_block_id` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_map_attributes_blocks`
--

LOCK TABLES `ezpage_map_attributes_blocks` WRITE;
/*!40000 ALTER TABLE `ezpage_map_attributes_blocks` DISABLE KEYS */;
INSERT INTO `ezpage_map_attributes_blocks` VALUES (1,16),(2,17),(3,17),(4,18);
/*!40000 ALTER TABLE `ezpage_map_attributes_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_map_blocks_zones`
--

DROP TABLE IF EXISTS `ezpage_map_blocks_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_map_blocks_zones` (
  `block_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  PRIMARY KEY (`block_id`,`zone_id`),
  KEY `ezpage_map_blocks_zones_block_id` (`block_id`),
  KEY `ezpage_map_blocks_zones_zone_id` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_map_blocks_zones`
--

LOCK TABLES `ezpage_map_blocks_zones` WRITE;
/*!40000 ALTER TABLE `ezpage_map_blocks_zones` DISABLE KEYS */;
INSERT INTO `ezpage_map_blocks_zones` VALUES (1,2),(2,4),(3,5),(4,5),(5,5),(6,6),(7,8),(8,9),(9,9),(10,9),(11,10),(12,12),(13,13),(14,13),(15,13),(16,14),(17,15),(18,16),(19,17),(20,17),(21,17);
/*!40000 ALTER TABLE `ezpage_map_blocks_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_map_zones_pages`
--

DROP TABLE IF EXISTS `ezpage_map_zones_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_map_zones_pages` (
  `zone_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`zone_id`,`page_id`),
  KEY `ezpage_map_zones_pages_zone_id` (`zone_id`),
  KEY `ezpage_map_zones_pages_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_map_zones_pages`
--

LOCK TABLES `ezpage_map_zones_pages` WRITE;
/*!40000 ALTER TABLE `ezpage_map_zones_pages` DISABLE KEYS */;
INSERT INTO `ezpage_map_zones_pages` VALUES (1,1),(2,2),(3,2),(4,2),(5,2),(6,3),(7,3),(8,3),(9,3),(14,5),(15,5),(16,5),(17,5);
/*!40000 ALTER TABLE `ezpage_map_zones_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_pages`
--

DROP TABLE IF EXISTS `ezpage_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_no` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `language_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `layout` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezpage_pages_content_id_version_no` (`content_id`,`version_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_pages`
--

LOCK TABLES `ezpage_pages` WRITE;
/*!40000 ALTER TABLE `ezpage_pages` DISABLE KEYS */;
INSERT INTO `ezpage_pages` VALUES (1,1,52,'eng-GB','default'),(2,1,68,'eng-GB','dashboard_three_rows_two_columns'),(3,2,68,'eng-GB','dashboard_three_rows_two_columns'),(5,3,68,'eng-GB','dashboard_three_rows_two_columns');
/*!40000 ALTER TABLE `ezpage_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_zones`
--

DROP TABLE IF EXISTS `ezpage_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_zones`
--

LOCK TABLES `ezpage_zones` WRITE;
/*!40000 ALTER TABLE `ezpage_zones` DISABLE KEYS */;
INSERT INTO `ezpage_zones` VALUES (1,'default'),(2,'top'),(3,'middle-left'),(4,'middle-right'),(5,'bottom'),(6,'top'),(7,'middle-left'),(8,'middle-right'),(9,'bottom'),(14,'top'),(15,'middle-left'),(16,'middle-right'),(17,'bottom');
/*!40000 ALTER TABLE `ezpage_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpolicy`
--

DROP TABLE IF EXISTS `ezpolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `module_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `original_id` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpolicy_role_id` (`role_id`),
  KEY `ezpolicy_original_id` (`original_id`)
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy`
--

LOCK TABLES `ezpolicy` WRITE;
/*!40000 ALTER TABLE `ezpolicy` DISABLE KEYS */;
INSERT INTO `ezpolicy` VALUES (332,'*','*',0,2),(344,'selfedit','user',0,6),(364,'read','content',0,4),(365,'read','content',0,4),(366,'read','taxonomy',0,4),(367,'read','content',0,4),(368,'read','taxonomy',0,4),(369,'*','content',0,3),(370,'login','user',0,3),(371,'*','url',0,3),(372,'all_functions','taxonomy',0,3),(373,'all_functions','taxonomy',0,3),(389,'read','content',0,1),(390,'login','user',0,1),(391,'view_embed','content',0,1),(392,'read','content',0,1),(393,'read','taxonomy',0,1),(394,'read','content',0,1),(395,'read','taxonomy',0,1),(396,'create','content',0,1),(397,'read','content',0,1),(401,'invite','user',0,14),(402,'*','content',0,14),(403,'assign','role',0,14),(404,'login','user',0,13),(405,'read','content',0,13),(406,'read','content',0,13),(407,'versionread','content',0,13),(408,'view','customer_group',0,13),(409,'read','role',0,13),(410,'login','user',0,13),(411,'read','content',0,13),(412,'view_embed','content',0,13),(413,'read','content',0,13),(414,'read','taxonomy',0,13),(415,'read','content',0,13),(416,'read','taxonomy',0,13),(417,'read','content',0,20),(418,'read','content',0,20),(419,'read','content',0,20),(420,'versionread','content',0,20),(421,'edit','content',0,20),(422,'publish','content',0,20),(423,'customize','dashboard',0,20);
/*!40000 ALTER TABLE `ezpolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpolicy_limitation`
--

DROP TABLE IF EXISTS `ezpolicy_limitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy_limitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `policy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policy_id` (`policy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy_limitation`
--

LOCK TABLES `ezpolicy_limitation` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation` DISABLE KEYS */;
INSERT INTO `ezpolicy_limitation` VALUES (252,'Section',329),(276,'Class',364),(277,'Owner',364),(278,'Section',365),(279,'Taxonomy',366),(280,'Section',367),(281,'Taxonomy',368),(289,'Section',389),(290,'SiteAccess',390),(291,'Class',391),(292,'Section',392),(293,'Taxonomy',393),(294,'Section',394),(295,'Taxonomy',395),(296,'Class',396),(297,'ParentClass',396),(298,'Subtree',396),(299,'ChangeOwner',396),(300,'Class',397),(301,'Node',397),(303,'UserPermissions',401),(304,'Role',403),(305,'MemberOf',403),(306,'SiteAccess',404),(307,'Section',405),(308,'Subtree',406),(309,'Section',407),(310,'SiteAccess',410),(311,'Section',411),(312,'Class',412),(313,'Section',413),(314,'Taxonomy',414),(315,'Section',415),(316,'Taxonomy',416),(317,'Subtree',417),(318,'Node',418),(319,'Subtree',419),(320,'Owner',419),(321,'Subtree',420),(322,'Owner',420),(323,'Subtree',421),(324,'Owner',421),(325,'Subtree',422),(326,'Owner',422);
/*!40000 ALTER TABLE `ezpolicy_limitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpolicy_limitation_value`
--

DROP TABLE IF EXISTS `ezpolicy_limitation_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy_limitation_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limitation_id` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpolicy_limit_value_limit_id` (`limitation_id`),
  KEY `ezpolicy_limitation_value_val` (`value`(191))
) ENGINE=InnoDB AUTO_INCREMENT=574 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy_limitation_value`
--

LOCK TABLES `ezpolicy_limitation_value` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation_value` DISABLE KEYS */;
INSERT INTO `ezpolicy_limitation_value` VALUES (478,252,'1'),(514,276,'4'),(515,277,'1'),(516,278,'8'),(517,279,'tags'),(518,280,'9'),(519,281,'product_categories'),(526,289,'1'),(527,289,'3'),(528,289,'6'),(529,290,'1766001124'),(530,291,'12'),(531,291,'5'),(532,292,'8'),(533,293,'tags'),(534,294,'9'),(535,295,'product_categories'),(536,296,'50'),(537,297,'1'),(538,298,'/1/66/'),(539,299,'-1'),(540,300,'1'),(541,301,'66'),(544,303,'Role_14'),(545,303,'Role_15'),(546,304,'14'),(547,304,'15'),(548,305,'-1'),(549,306,'523491234'),(550,307,'10'),(551,308,'/1/5/'),(552,309,'10'),(553,310,'1766001124'),(554,311,'1'),(555,311,'3'),(556,311,'6'),(557,312,'5'),(558,312,'12'),(559,313,'8'),(560,314,'tags'),(561,315,'9'),(562,316,'product_categories'),(563,317,'/1/67/68/'),(564,318,'67'),(565,318,'70'),(566,319,'/1/67/70/'),(567,320,'1'),(568,321,'/1/67/70/'),(569,322,'1'),(570,323,'/1/67/70/'),(571,324,'1'),(572,325,'/1/67/70/'),(573,326,'1');
/*!40000 ALTER TABLE `ezpolicy_limitation_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpreferences`
--

DROP TABLE IF EXISTS `ezpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpreferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpreferences_user_id_idx` (`user_id`,`name`),
  KEY `ezpreferences_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpreferences`
--

LOCK TABLES `ezpreferences` WRITE;
/*!40000 ALTER TABLE `ezpreferences` DISABLE KEYS */;
INSERT INTO `ezpreferences` VALUES (1,'focus_mode',14,'0');
/*!40000 ALTER TABLE `ezpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezrole`
--

DROP TABLE IF EXISTS `ezrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_new` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `value` char(1) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `version` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezrole`
--

LOCK TABLES `ezrole` WRITE;
/*!40000 ALTER TABLE `ezrole` DISABLE KEYS */;
INSERT INTO `ezrole` VALUES (1,0,'Anonymous','0',0),(2,0,'Administrator','0',0),(3,0,'Editor','0',0),(4,0,'Member','0',0),(6,0,'User Profile Owner','0',0),(13,0,'Corporate Access','0',0),(14,0,'Company admin','0',0),(15,0,'Company buyer','0',0),(20,0,'Dashboard','0',0);
/*!40000 ALTER TABLE `ezrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsearch_object_word_link`
--

DROP TABLE IF EXISTS `ezsearch_object_word_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsearch_object_word_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentclass_attribute_id` int(11) NOT NULL DEFAULT 0,
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `frequency` double NOT NULL DEFAULT 0,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `integer_value` int(11) NOT NULL DEFAULT 0,
  `next_word_id` int(11) NOT NULL DEFAULT 0,
  `placement` int(11) NOT NULL DEFAULT 0,
  `prev_word_id` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 0,
  `section_id` int(11) NOT NULL DEFAULT 0,
  `word_id` int(11) NOT NULL DEFAULT 0,
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ezsearch_object_word_link_object` (`contentobject_id`),
  KEY `ezsearch_object_word_link_identifier` (`identifier`(191)),
  KEY `ezsearch_object_word_link_integer_value` (`integer_value`),
  KEY `ezsearch_object_word_link_word` (`word_id`),
  KEY `ezsearch_object_word_link_frequency` (`frequency`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsearch_object_word_link`
--

LOCK TABLES `ezsearch_object_word_link` WRITE;
/*!40000 ALTER TABLE `ezsearch_object_word_link` DISABLE KEYS */;
INSERT INTO `ezsearch_object_word_link` VALUES (29,4,1,1,0,'name',0,18,0,0,1448889046,1,17,3),(30,4,1,1,0,'name',0,19,1,17,1448889046,1,18,3),(31,119,1,1,0,'short_description',0,20,2,18,1448889046,1,19,3),(32,119,1,1,0,'short_description',0,21,3,19,1448889046,1,20,3),(33,119,1,1,0,'short_description',0,22,4,20,1448889046,1,21,3),(34,119,1,1,0,'short_description',0,23,5,21,1448889046,1,22,3),(35,119,1,1,0,'short_description',0,24,6,22,1448889046,1,23,3),(36,119,1,1,0,'short_description',0,25,7,23,1448889046,1,24,3),(37,119,1,1,0,'short_description',0,26,8,24,1448889046,1,25,3),(38,119,1,1,0,'short_description',0,17,9,25,1448889046,1,26,3),(39,155,1,1,0,'short_name',0,18,10,26,1448889046,1,17,3),(40,155,1,1,0,'short_name',0,27,11,17,1448889046,1,18,3),(41,156,1,1,0,'description',0,28,12,18,1448889046,1,27,3),(42,156,1,1,0,'description',0,29,13,27,1448889046,1,28,3),(43,156,1,1,0,'description',0,30,14,28,1448889046,1,29,3),(44,156,1,1,0,'description',0,31,15,29,1448889046,1,30,3),(45,156,1,1,0,'description',0,32,16,30,1448889046,1,31,3),(46,156,1,1,0,'description',0,33,17,31,1448889046,1,32,3),(47,156,1,1,0,'description',0,17,18,32,1448889046,1,33,3),(48,156,1,1,0,'description',0,18,19,33,1448889046,1,17,3),(49,156,1,1,0,'description',0,34,20,17,1448889046,1,18,3),(50,156,1,1,0,'description',0,35,21,18,1448889046,1,34,3),(51,156,1,1,0,'description',0,36,22,34,1448889046,1,35,3),(52,156,1,1,0,'description',0,37,23,35,1448889046,1,36,3),(53,156,1,1,0,'description',0,38,24,36,1448889046,1,37,3),(54,156,1,1,0,'description',0,39,25,37,1448889046,1,38,3),(55,156,1,1,0,'description',0,40,26,38,1448889046,1,39,3),(56,156,1,1,0,'description',0,29,27,39,1448889046,1,40,3),(57,156,1,1,0,'description',0,18,28,40,1448889046,1,29,3),(58,156,1,1,0,'description',0,41,29,29,1448889046,1,18,3),(59,156,1,1,0,'description',0,42,30,18,1448889046,1,41,3),(60,156,1,1,0,'description',0,43,31,41,1448889046,1,42,3),(61,156,1,1,0,'description',0,23,32,42,1448889046,1,43,3),(62,156,1,1,0,'description',0,44,33,43,1448889046,1,23,3),(63,156,1,1,0,'description',0,45,34,23,1448889046,1,44,3),(64,156,1,1,0,'description',0,46,35,44,1448889046,1,45,3),(65,156,1,1,0,'description',0,19,36,45,1448889046,1,46,3),(66,156,1,1,0,'description',0,47,37,46,1448889046,1,19,3),(67,156,1,1,0,'description',0,23,38,19,1448889046,1,47,3),(68,156,1,1,0,'description',0,24,39,47,1448889046,1,23,3),(69,156,1,1,0,'description',0,25,40,23,1448889046,1,24,3),(70,156,1,1,0,'description',0,26,41,24,1448889046,1,25,3),(71,156,1,1,0,'description',0,48,42,25,1448889046,1,26,3),(72,156,1,1,0,'description',0,49,43,26,1448889046,1,48,3),(73,156,1,1,0,'description',0,0,44,48,1448889046,1,49,3),(74,7,3,4,0,'description',0,51,0,0,1033917596,2,50,3),(75,7,3,4,0,'description',0,52,1,50,1033917596,2,51,3),(76,6,3,4,0,'name',0,0,2,51,1033917596,2,52,3),(77,8,4,10,0,'first_name',0,54,0,0,1033920665,2,53,3),(78,9,4,10,0,'last_name',0,0,1,53,1033920665,2,54,3),(79,6,3,11,0,'name',0,56,0,0,1033920746,2,55,3),(80,6,3,11,0,'name',0,0,1,55,1033920746,2,56,3),(81,6,3,12,0,'name',0,52,0,0,1033920775,2,57,3),(82,6,3,12,0,'name',0,0,1,57,1033920775,2,52,3),(83,6,3,13,0,'name',0,0,0,0,1033920794,2,58,3),(84,8,4,14,0,'first_name',0,54,0,0,1033920830,2,57,3),(85,9,4,14,0,'last_name',0,0,1,57,1033920830,2,54,3),(86,4,1,41,0,'name',0,0,0,0,1060695457,3,59,3),(87,6,3,42,0,'name',0,52,0,0,1072180330,2,53,3),(88,6,3,42,0,'name',0,54,1,53,1072180330,2,52,3),(89,7,3,42,0,'description',0,51,2,52,1072180330,2,54,3),(90,7,3,42,0,'description',0,60,3,54,1072180330,2,51,3),(91,7,3,42,0,'description',0,29,4,51,1072180330,2,60,3),(92,7,3,42,0,'description',0,53,5,60,1072180330,2,29,3),(93,7,3,42,0,'description',0,54,6,29,1072180330,2,53,3),(94,7,3,42,0,'description',0,0,7,53,1072180330,2,54,3),(95,4,1,49,0,'name',0,0,0,0,1080220197,3,61,3),(96,4,1,50,0,'name',0,0,0,0,1080220220,3,62,3),(97,4,1,51,0,'name',0,0,0,0,1080220233,3,63,3),(98,185,42,52,0,'name',0,64,0,0,1442481743,1,17,3),(99,185,42,52,0,'name',0,65,1,17,1442481743,1,64,3),(100,185,42,52,0,'name',0,18,2,64,1442481743,1,65,3),(101,185,42,52,0,'name',0,19,3,65,1442481743,1,18,3),(102,186,42,52,0,'description',0,20,4,18,1442481743,1,19,3),(103,186,42,52,0,'description',0,21,5,19,1442481743,1,20,3),(104,186,42,52,0,'description',0,22,6,20,1442481743,1,21,3),(105,186,42,52,0,'description',0,23,7,21,1442481743,1,22,3),(106,186,42,52,0,'description',0,24,8,22,1442481743,1,23,3),(107,186,42,52,0,'description',0,25,9,23,1442481743,1,24,3),(108,186,42,52,0,'description',0,26,10,24,1442481743,1,25,3),(109,186,42,52,0,'description',0,0,11,25,1442481743,1,26,3),(110,4,1,53,0,'name',0,67,0,0,1486473151,3,66,3),(111,4,1,53,0,'name',0,66,1,66,1486473151,3,67,3),(112,155,1,53,0,'short_name',0,67,2,67,1486473151,3,66,3),(113,155,1,53,0,'short_name',0,68,3,66,1486473151,3,67,3),(114,119,1,53,0,'short_description',0,60,4,67,1486473151,3,68,3),(115,119,1,53,0,'short_description',0,69,5,68,1486473151,3,60,3),(116,119,1,53,0,'short_description',0,67,6,60,1486473151,3,69,3),(117,119,1,53,0,'short_description',0,0,7,69,1486473151,3,67,3),(118,4,1,54,0,'name',0,0,0,0,1537166893,6,70,2),(119,4,1,55,0,'name',0,72,0,0,1586855342,7,71,3),(120,4,1,55,0,'name',0,0,1,71,1586855342,7,72,3),(121,4,1,56,0,'name',0,0,0,0,1736257875,8,73,3),(122,4,1,57,0,'name',0,0,0,0,1736257875,8,74,3),(123,200,45,58,0,'name',0,75,0,0,1736257876,8,75,3),(124,201,45,58,0,'identifier',0,0,1,75,1736257876,8,75,3),(125,4,1,59,0,'name',0,77,0,0,1736257876,1,76,3),(126,4,1,59,0,'name',0,0,1,76,1736257876,1,77,3),(127,4,1,60,0,'name',0,73,0,0,1736257877,9,78,3),(128,4,1,60,0,'name',0,0,1,78,1736257877,9,73,3),(129,4,1,61,0,'name',0,73,0,0,1736257877,9,78,3),(130,4,1,61,0,'name',0,0,1,78,1736257877,9,73,3),(131,206,46,62,0,'name',0,75,0,0,1736257877,9,76,3),(132,206,46,62,0,'name',0,79,1,76,1736257877,9,75,3),(133,206,46,62,0,'name',0,80,2,75,1736257877,9,79,3),(134,207,46,62,0,'identifier',0,0,3,79,1736257877,9,80,3),(135,6,3,63,0,'name',0,82,0,0,1736257877,10,81,3),(136,6,3,63,0,'name',0,81,1,81,1736257877,10,82,3),(137,7,3,63,0,'description',0,82,2,82,1736257877,10,81,3),(138,7,3,63,0,'description',0,0,3,81,1736257877,10,82,3),(139,6,3,64,0,'name',0,84,0,0,1736257878,10,83,3),(140,6,3,64,0,'name',0,0,1,83,1736257878,10,84,3),(141,4,1,65,0,'name',0,84,0,0,1736257879,10,83,3),(142,4,1,65,0,'name',0,85,1,83,1736257879,10,84,3),(143,4,1,65,0,'name',0,0,2,84,1736257879,10,85,3),(144,4,1,66,0,'name',0,0,0,0,1736257880,11,86,3),(145,4,1,67,0,'name',0,86,0,0,1736257880,11,87,3),(146,4,1,67,0,'name',0,0,1,87,1736257880,11,86,3),(147,4,1,69,0,'name',0,86,0,0,1736257880,11,54,3),(148,4,1,69,0,'name',0,0,1,54,1736257880,11,86,3);
/*!40000 ALTER TABLE `ezsearch_object_word_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsearch_word`
--

DROP TABLE IF EXISTS `ezsearch_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsearch_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_count` int(11) NOT NULL DEFAULT 0,
  `word` varchar(150) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezsearch_word_word_i` (`word`),
  KEY `ezsearch_word_obj_count` (`object_count`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsearch_word`
--

LOCK TABLES `ezsearch_word` WRITE;
/*!40000 ALTER TABLE `ezsearch_word` DISABLE KEYS */;
INSERT INTO `ezsearch_word` VALUES (17,2,'ibexa'),(18,2,'platform'),(19,2,'you'),(20,2,'are'),(21,2,'now'),(22,2,'ready'),(23,2,'to'),(24,2,'start'),(25,2,'your'),(26,2,'project'),(27,1,'this'),(28,1,'is'),(29,2,'the'),(30,1,'clean'),(31,1,'installation'),(32,1,'coming'),(33,1,'with'),(34,1,'it'),(35,1,'s'),(36,1,'a'),(37,1,'bare'),(38,1,'bones'),(39,1,'setup'),(40,1,'of'),(41,1,'an'),(42,1,'excellent'),(43,1,'foundation'),(44,1,'build'),(45,1,'upon'),(46,1,'if'),(47,1,'want'),(48,1,'from'),(49,1,'scratch'),(50,1,'main'),(51,2,'group'),(52,3,'users'),(53,2,'anonymous'),(54,4,'user'),(55,1,'guest'),(56,1,'accounts'),(57,2,'administrator'),(58,1,'editors'),(59,1,'media'),(60,2,'for'),(61,1,'images'),(62,1,'files'),(63,1,'multimedia'),(64,1,'digital'),(65,1,'experience'),(66,1,'form'),(67,1,'uploads'),(68,1,'folder'),(69,1,'file'),(70,1,'forms'),(71,1,'site'),(72,1,'skeletons'),(73,3,'taxonomy'),(74,1,'tags'),(75,2,'root'),(76,2,'product'),(77,1,'catalog'),(78,2,'products'),(79,1,'tag'),(80,1,'product_root'),(81,1,'sales'),(82,1,'representatives'),(83,2,'corporate'),(84,2,'account'),(85,1,'applications'),(86,3,'dashboards'),(87,1,'predefined');
/*!40000 ALTER TABLE `ezsearch_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsection`
--

DROP TABLE IF EXISTS `ezsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `navigation_part_identifier` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'ezcontentnavigationpart',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsection`
--

LOCK TABLES `ezsection` WRITE;
/*!40000 ALTER TABLE `ezsection` DISABLE KEYS */;
INSERT INTO `ezsection` VALUES (1,'standard','','Standard','ezcontentnavigationpart'),(2,'users','','Users','ezusernavigationpart'),(3,'media','','Media','ezmedianavigationpart'),(6,'form',NULL,'Form','ezcontentnavigationpart'),(7,'site_skeleton',NULL,'Site skeleton','ezcontentnavigationpart'),(8,'taxonomy',NULL,'Taxonomy','ezcontentnavigationpart'),(9,'product_taxonomy',NULL,'Products Taxonomy','ezcontentnavigationpart'),(10,'corporate_account',NULL,'Corporate Account','ezcontentnavigationpart'),(11,'dashboard',NULL,'Dashboard','ezcontentnavigationpart');
/*!40000 ALTER TABLE `ezsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsite`
--

DROP TABLE IF EXISTS `ezsite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsite`
--

LOCK TABLES `ezsite` WRITE;
/*!40000 ALTER TABLE `ezsite` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezsite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsite_data`
--

DROP TABLE IF EXISTS `ezsite_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsite_data` (
  `name` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsite_data`
--

LOCK TABLES `ezsite_data` WRITE;
/*!40000 ALTER TABLE `ezsite_data` DISABLE KEYS */;
INSERT INTO `ezsite_data` VALUES ('ibexa-release','4.6');
/*!40000 ALTER TABLE `ezsite_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsite_public_access`
--

DROP TABLE IF EXISTS `ezsite_public_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsite_public_access` (
  `public_access_identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `site_access_group` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL,
  `config` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `site_matcher_host` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `site_matcher_path` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`public_access_identifier`),
  KEY `ezsite_public_access_site_id` (`site_id`),
  CONSTRAINT `fk_ezsite_public_access_site_id` FOREIGN KEY (`site_id`) REFERENCES `ezsite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsite_public_access`
--

LOCK TABLES `ezsite_public_access` WRITE;
/*!40000 ALTER TABLE `ezsite_public_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezsite_public_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurl`
--

DROP TABLE IF EXISTS `ezurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL DEFAULT 0,
  `is_valid` int(11) NOT NULL DEFAULT 1,
  `last_checked` int(11) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `original_url_md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `url` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezurl_url` (`url`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurl`
--

LOCK TABLES `ezurl` WRITE;
/*!40000 ALTER TABLE `ezurl` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurl_object_link`
--

DROP TABLE IF EXISTS `ezurl_object_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurl_object_link` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_attribute_version` int(11) NOT NULL DEFAULT 0,
  `url_id` int(11) NOT NULL DEFAULT 0,
  KEY `ezurl_ol_coa_id` (`contentobject_attribute_id`),
  KEY `ezurl_ol_url_id` (`url_id`),
  KEY `ezurl_ol_coa_version` (`contentobject_attribute_version`),
  KEY `ezurl_ol_coa_id_cav` (`contentobject_attribute_id`,`contentobject_attribute_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurl_object_link`
--

LOCK TABLES `ezurl_object_link` WRITE;
/*!40000 ALTER TABLE `ezurl_object_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezurl_object_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlalias`
--

DROP TABLE IF EXISTS `ezurlalias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlalias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `forward_to_id` int(11) NOT NULL DEFAULT 0,
  `is_imported` int(11) NOT NULL DEFAULT 0,
  `is_internal` int(11) NOT NULL DEFAULT 1,
  `is_wildcard` int(11) NOT NULL DEFAULT 0,
  `source_md5` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `source_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ezurlalias_source_md5` (`source_md5`),
  KEY `ezurlalias_wcard_fwd` (`is_wildcard`,`forward_to_id`),
  KEY `ezurlalias_forward_to_id` (`forward_to_id`),
  KEY `ezurlalias_imp_wcard_fwd` (`is_imported`,`is_wildcard`,`forward_to_id`),
  KEY `ezurlalias_source_url` (`source_url`(191)),
  KEY `ezurlalias_desturl` (`destination_url`(191))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlalias`
--

LOCK TABLES `ezurlalias` WRITE;
/*!40000 ALTER TABLE `ezurlalias` DISABLE KEYS */;
INSERT INTO `ezurlalias` VALUES (12,'content/view/full/2',0,1,1,0,'d41d8cd98f00b204e9800998ecf8427e',''),(13,'content/view/full/5',0,1,1,0,'9bc65c2abec141778ffaa729489f3e87','users'),(15,'content/view/full/12',0,1,1,0,'02d4e844e3a660857a3f81585995ffe1','users/guest_accounts'),(16,'content/view/full/13',0,1,1,0,'1b1d79c16700fd6003ea7be233e754ba','users/administrator_users'),(17,'content/view/full/14',0,1,1,0,'0bb9dd665c96bbc1cf36b79180786dea','users/editors'),(18,'content/view/full/15',0,1,1,0,'f1305ac5f327a19b451d82719e0c3f5d','users/administrator_users/administrator_user'),(20,'content/view/full/43',0,1,1,0,'62933a2951ef01f4eafd9bdf4d3cd2f0','media'),(21,'content/view/full/44',0,1,1,0,'3ae1aac958e1c82013689d917d34967a','users/anonymous_users'),(22,'content/view/full/45',0,1,1,0,'aad93975f09371695ba08292fd9698db','users/anonymous_users/anonymous_user'),(28,'content/view/full/51',0,1,1,0,'38985339d4a5aadfc41ab292b4527046','media/images'),(29,'content/view/full/52',0,1,1,0,'ad5a8c6f6aac3b1b9df267fe22e7aef6','media/files'),(30,'content/view/full/53',0,1,1,0,'562a0ac498571c6c3529173184a2657c','media/multimedia');
/*!40000 ALTER TABLE `ezurlalias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlalias_ml`
--

DROP TABLE IF EXISTS `ezurlalias_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlalias_ml` (
  `parent` int(11) NOT NULL DEFAULT 0,
  `text_md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `action` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `action_type` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `alias_redirects` int(11) NOT NULL DEFAULT 1,
  `id` int(11) NOT NULL DEFAULT 0,
  `is_alias` int(11) NOT NULL DEFAULT 0,
  `is_original` int(11) NOT NULL DEFAULT 0,
  `lang_mask` bigint(20) NOT NULL DEFAULT 0,
  `link` int(11) NOT NULL DEFAULT 0,
  `text` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`parent`,`text_md5`),
  KEY `ezurlalias_ml_actt_org_al` (`action_type`,`is_original`,`is_alias`),
  KEY `ezurlalias_ml_text_lang` (`text`(32),`lang_mask`,`parent`),
  KEY `ezurlalias_ml_par_act_id_lnk` (`action`(32),`id`,`link`,`parent`),
  KEY `ezurlalias_ml_par_lnk_txt` (`parent`,`text`(32),`link`),
  KEY `ezurlalias_ml_act_org` (`action`(32),`is_original`),
  KEY `ezurlalias_ml_text` (`text`(32),`id`,`link`),
  KEY `ezurlalias_ml_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlalias_ml`
--

LOCK TABLES `ezurlalias_ml` WRITE;
/*!40000 ALTER TABLE `ezurlalias_ml` DISABLE KEYS */;
INSERT INTO `ezurlalias_ml` VALUES (0,'126c4c3261a922d852dd22f709c392aa','eznode:67','eznode',0,52,0,1,3,52,'dashboards'),(0,'25d9c27d68ba0e40468e05a61f96d31d','eznode:56','eznode',0,41,0,1,3,41,'site-skeletons'),(0,'3eea0b287528e413d5b8c3ec63b348a3','eznode:66','eznode',0,51,0,1,3,51,'corporate-account-applications'),(0,'50e2736330de124f6edea9b008556fe6','nop:','nop',1,17,0,0,1,17,'media2'),(0,'62933a2951ef01f4eafd9bdf4d3cd2f0','eznode:43','eznode',1,9,0,1,3,9,'Media'),(0,'76e323bf7efc1fad8935eb37bd557b92','eznode:42','eznode',0,40,0,1,3,40,'ez-platform'),(0,'7a5dd46fdb234e993bf6ae0029a7cb17','eznode:57','eznode',0,42,0,1,3,42,'taxonomy'),(0,'86425c35a33507d479f71ade53a669aa','nop:','nop',1,3,0,0,1,3,'users2'),(0,'95101b3856a317eb94648f63cfece7cc','eznode:61','eznode',0,46,0,1,3,46,'products-taxonomy'),(0,'9bc65c2abec141778ffaa729489f3e87','eznode:5','eznode',1,2,0,1,3,2,'Users'),(0,'a4d1fdf4a7cd746c56dbb5241779104c','eznode:60','eznode',0,45,0,1,3,45,'product-catalog'),(0,'ac68b62abfd6a9fe26e8ac4236c8ce0c','eznode:55','eznode',0,39,0,1,2,39,'forms'),(0,'d41d8cd98f00b204e9800998ecf8427e','eznode:2','eznode',1,1,0,1,3,1,''),(0,'f49d56ba2509d02f31be013279a08376','eznode:65','eznode',0,50,0,1,3,50,'corporate-account'),(2,'a147e136bfa717592f2bd70bd4b53b17','eznode:14','eznode',1,6,0,1,3,6,'Editors'),(2,'c2803c3fa1b0b5423237b4e018cae755','eznode:44','eznode',1,10,0,1,3,10,'Anonymous-Users'),(2,'cf321ef5aaa3be9ef8a2d8cc12e7bbaa','eznode:64','eznode',0,49,0,1,3,49,'sales-representatives'),(2,'e57843d836e3af8ab611fde9e2139b3a','eznode:12','eznode',1,4,0,1,3,4,'Guest-accounts'),(2,'f89fad7f8a3abc8c09e1deb46a420007','eznode:13','eznode',1,5,0,1,3,5,'Administrator-users'),(3,'505e93077a6dde9034ad97a14ab022b1','nop:','nop',1,11,0,0,1,11,'anonymous_users2'),(3,'70bb992820e73638731aa8de79b3329e','eznode:12','eznode',1,26,0,0,1,4,'guest_accounts'),(3,'a147e136bfa717592f2bd70bd4b53b17','eznode:14','eznode',1,29,0,0,1,6,'editors'),(3,'a7da338c20bf65f9f789c87296379c2a','nop:','nop',1,7,0,0,1,7,'administrator_users2'),(3,'aeb8609aa933b0899aa012c71139c58c','eznode:13','eznode',1,27,0,0,1,5,'administrator_users'),(3,'e9e5ad0c05ee1a43715572e5cc545926','eznode:44','eznode',1,30,0,0,1,10,'anonymous_users'),(5,'5a9d7b0ec93173ef4fedee023209cb61','eznode:15','eznode',1,8,0,1,3,8,'Administrator-User'),(7,'a3cca2de936df1e2f805710399989971','eznode:15','eznode',1,28,0,0,0,8,'administrator_user'),(9,'2e5bc8831f7ae6a29530e7f1bbf2de9c','eznode:53','eznode',1,20,0,1,3,20,'Multimedia'),(9,'45b963397aa40d4a0063e0d85e4fe7a1','eznode:52','eznode',1,19,0,1,3,19,'Files'),(9,'59b514174bffe4ae402b3d63aad79fe0','eznode:51','eznode',1,18,0,1,3,18,'Images'),(10,'ccb62ebca03a31272430bc414bd5cd5b','eznode:45','eznode',1,12,0,1,3,12,'Anonymous-User'),(11,'c593ec85293ecb0e02d50d4c5c6c20eb','eznode:45','eznode',1,31,0,0,1,12,'anonymous_user'),(17,'2e5bc8831f7ae6a29530e7f1bbf2de9c','eznode:53','eznode',1,34,0,0,1,20,'multimedia'),(17,'45b963397aa40d4a0063e0d85e4fe7a1','eznode:52','eznode',1,33,0,0,1,19,'files'),(17,'59b514174bffe4ae402b3d63aad79fe0','eznode:51','eznode',1,32,0,0,1,18,'images'),(19,'2c5f0c4eb6b8ba8d176b87665bdbe1af','eznode:54','eznode',0,38,0,1,3,38,'form-uploads'),(42,'d57ac45256849d9b13e2422d91580fb9','eznode:58','eznode',0,43,0,1,3,43,'tags'),(43,'63a9f0ea7bb98050796b649e85481845','eznode:59','eznode',0,44,0,1,3,44,'root'),(46,'95101b3856a317eb94648f63cfece7cc','eznode:62','eznode',0,47,0,1,3,47,'products-taxonomy'),(47,'0f8bb6935dfa5cdde71555c3b10f7c85','eznode:63','eznode',0,48,0,1,3,48,'product-root-tag'),(52,'071873e18b16cac89832c126532791a5','eznode:68','eznode',0,53,0,1,3,53,'predefined-dashboards'),(52,'c5ead8bc7ee41f607b8d1457db5f2e1a','eznode:70','eznode',0,55,0,1,3,55,'user-dashboards'),(53,'ac8beb2631de1a9eef16312f02a437c2','eznode:69','eznode',1,54,0,1,3,54,'default-dashboard');
/*!40000 ALTER TABLE `ezurlalias_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlalias_ml_incr`
--

DROP TABLE IF EXISTS `ezurlalias_ml_incr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlalias_ml_incr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlalias_ml_incr`
--

LOCK TABLES `ezurlalias_ml_incr` WRITE;
/*!40000 ALTER TABLE `ezurlalias_ml_incr` DISABLE KEYS */;
INSERT INTO `ezurlalias_ml_incr` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55);
/*!40000 ALTER TABLE `ezurlalias_ml_incr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlwildcard`
--

DROP TABLE IF EXISTS `ezurlwildcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlwildcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlwildcard`
--

LOCK TABLES `ezurlwildcard` WRITE;
/*!40000 ALTER TABLE `ezurlwildcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezurlwildcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser`
--

DROP TABLE IF EXISTS `ezuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser` (
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `login` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `password_hash_type` int(11) NOT NULL DEFAULT 1,
  `password_updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentobject_id`),
  UNIQUE KEY `ezuser_login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser`
--

LOCK TABLES `ezuser` WRITE;
/*!40000 ALTER TABLE `ezuser` DISABLE KEYS */;
INSERT INTO `ezuser` VALUES (10,'anonymous@link.invalid','anonymous','$2y$10$35gOSQs6JK4u4whyERaeUuVeQBi2TUBIZIfP7HEj7sfz.MxvTuOeC',7,NULL),(14,'admin@link.invalid','admin','$2y$10$FDn9NPwzhq85cLLxfD5Wu.L3SL3Z/LNCvhkltJUV0wcJj7ciJg2oy',7,NULL);
/*!40000 ALTER TABLE `ezuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser_accountkey`
--

DROP TABLE IF EXISTS `ezuser_accountkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser_accountkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash_key` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `hash_key` (`hash_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser_accountkey`
--

LOCK TABLES `ezuser_accountkey` WRITE;
/*!40000 ALTER TABLE `ezuser_accountkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezuser_accountkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser_role`
--

DROP TABLE IF EXISTS `ezuser_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) DEFAULT NULL,
  `limit_identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `limit_value` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezuser_role_role_id` (`role_id`),
  KEY `ezuser_role_contentobject_id` (`contentobject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser_role`
--

LOCK TABLES `ezuser_role` WRITE;
/*!40000 ALTER TABLE `ezuser_role` DISABLE KEYS */;
INSERT INTO `ezuser_role` VALUES (34,12,'','',2),(39,13,'','',6),(49,13,'','',4),(50,13,'Subtree','/1/2/',3),(51,13,'Subtree','/1/43/',3),(53,11,'','',1),(54,42,'','',1),(55,13,'','',1),(56,64,'','',13),(57,13,'','',20);
/*!40000 ALTER TABLE `ezuser_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser_setting`
--

DROP TABLE IF EXISTS `ezuser_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser_setting` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `is_enabled` int(11) NOT NULL DEFAULT 0,
  `max_login` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser_setting`
--

LOCK TABLES `ezuser_setting` WRITE;
/*!40000 ALTER TABLE `ezuser_setting` DISABLE KEYS */;
INSERT INTO `ezuser_setting` VALUES (10,1,1000),(14,1,10);
/*!40000 ALTER TABLE `ezuser_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_activity_log`
--

DROP TABLE IF EXISTS `ibexa_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_activity_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_class_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `object_id` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_name` varchar(190) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '(DC2Type:json)',
  PRIMARY KEY (`id`),
  KEY `ibexa_activity_log_object_class_idx` (`object_class_id`),
  KEY `ibexa_activity_log_action_idx` (`action_id`),
  KEY `ibexa_activity_log_object_idx` (`object_id`),
  KEY `ibexa_activity_log_object_name_idx` (`object_name`),
  KEY `ibexa_activity_log_group_idx` (`group_id`),
  CONSTRAINT `ibexa_activity_log_action_fk` FOREIGN KEY (`action_id`) REFERENCES `ibexa_activity_log_action` (`id`),
  CONSTRAINT `ibexa_activity_log_group_fk` FOREIGN KEY (`group_id`) REFERENCES `ibexa_activity_log_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ibexa_activity_log_object_class_fk` FOREIGN KEY (`object_class_id`) REFERENCES `ibexa_activity_log_object_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_activity_log`
--

LOCK TABLES `ibexa_activity_log` WRITE;
/*!40000 ALTER TABLE `ibexa_activity_log` DISABLE KEYS */;
INSERT INTO `ibexa_activity_log` VALUES (1,1,1,1,'56','Taxonomy','[]'),(2,1,2,1,'56','Taxonomy','[]'),(3,1,1,1,'57','Tags','[]'),(4,1,2,1,'57','Tags','[]'),(5,1,1,1,'58','Root','[]'),(6,1,2,1,'58','Root','[]'),(7,1,1,2,'59','Product catalog','[]'),(8,1,2,2,'59','Product catalog','[]'),(9,1,1,3,'60','Products Taxonomy','[]'),(10,1,2,3,'60','Products Taxonomy','[]'),(11,1,1,3,'61','Products Taxonomy','[]'),(12,1,2,3,'61','Products Taxonomy','[]'),(13,1,1,3,'62','Product Root Tag','[]'),(14,1,2,3,'62','Product Root Tag','[]'),(15,1,1,4,'63','Sales representatives','[]'),(16,1,2,4,'63','Sales representatives','[]'),(17,1,1,4,'64','Corporate Account','[]'),(18,1,2,4,'64','Corporate Account','[]'),(19,1,1,5,'65','Corporate Account Applications','[]'),(20,1,2,5,'65','Corporate Account Applications','[]'),(21,1,1,6,'66','Dashboards','[]'),(22,1,2,6,'66','Dashboards','[]'),(23,1,1,6,'67','Predefined dashboards','[]'),(24,1,2,6,'67','Predefined dashboards','[]'),(25,1,1,6,'68','Default dashboard','[]'),(26,1,2,6,'68','Default dashboard','[]'),(27,1,1,6,'69','User dashboards','[]'),(28,1,2,6,'69','User dashboards','[]'),(29,1,3,7,'68','Default dashboard','[]'),(30,1,4,7,'68','Default dashboard','[]'),(31,1,2,7,'68','Default dashboard','[]'),(32,1,3,7,'68','Default dashboard','[]'),(33,1,4,7,'68','Default dashboard','[]'),(34,1,2,7,'68','Default dashboard','[]');
/*!40000 ALTER TABLE `ibexa_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_activity_log_action`
--

DROP TABLE IF EXISTS `ibexa_activity_log_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_activity_log_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_activity_log_action_uidx` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_activity_log_action`
--

LOCK TABLES `ibexa_activity_log_action` WRITE;
/*!40000 ALTER TABLE `ibexa_activity_log_action` DISABLE KEYS */;
INSERT INTO `ibexa_activity_log_action` VALUES (1,'create'),(3,'create_draft'),(2,'publish'),(4,'update');
/*!40000 ALTER TABLE `ibexa_activity_log_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_activity_log_group`
--

DROP TABLE IF EXISTS `ibexa_activity_log_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_activity_log_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL,
  `ip_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `logged_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ibexa_activity_log_group_source_idx` (`source_id`),
  KEY `ibexa_activity_log_ip_idx` (`ip_id`),
  KEY `ibexa_activity_log_logged_at_idx` (`logged_at`),
  KEY `ibexa_activity_log_user_id_idx` (`user_id`),
  CONSTRAINT `ibexa_activity_log_group_source_fk` FOREIGN KEY (`source_id`) REFERENCES `ibexa_activity_log_group_source` (`id`),
  CONSTRAINT `ibexa_activity_log_ip_fk` FOREIGN KEY (`ip_id`) REFERENCES `ibexa_activity_log_ip` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_activity_log_group`
--

LOCK TABLES `ibexa_activity_log_group` WRITE;
/*!40000 ALTER TABLE `ibexa_activity_log_group` DISABLE KEYS */;
INSERT INTO `ibexa_activity_log_group` VALUES (1,1,NULL,'Migrating file: 002_taxonomy_content.yml','2025-01-07 13:51:15',14),(2,1,NULL,'Migrating file: 009_product_catalog.yml','2025-01-07 13:51:16',14),(3,1,NULL,'Migrating file: 2022_06_23_09_39_product_categories.yaml','2025-01-07 13:51:17',14),(4,1,NULL,'Migrating file: 012_corporate_account.yml','2025-01-07 13:51:17',14),(5,1,NULL,'Migrating file: 012_corporate_account_registration.yml','2025-01-07 13:51:19',14),(6,1,NULL,'Migrating file: 2023_09_23_14_15_dashboard_structure.yaml','2025-01-07 13:51:20',14),(7,1,NULL,'Migrating file: 2023_12_04_13_34_activity_log_dashboard_structure.yaml','2025-01-07 13:51:20',14);
/*!40000 ALTER TABLE `ibexa_activity_log_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_activity_log_group_source`
--

DROP TABLE IF EXISTS `ibexa_activity_log_group_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_activity_log_group_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_activity_log_group_source_name_uidx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_activity_log_group_source`
--

LOCK TABLES `ibexa_activity_log_group_source` WRITE;
/*!40000 ALTER TABLE `ibexa_activity_log_group_source` DISABLE KEYS */;
INSERT INTO `ibexa_activity_log_group_source` VALUES (1,'migration');
/*!40000 ALTER TABLE `ibexa_activity_log_group_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_activity_log_ip`
--

DROP TABLE IF EXISTS `ibexa_activity_log_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_activity_log_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_activity_log_group_source_ip_uidx` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_activity_log_ip`
--

LOCK TABLES `ibexa_activity_log_ip` WRITE;
/*!40000 ALTER TABLE `ibexa_activity_log_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_activity_log_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_activity_log_object_class`
--

DROP TABLE IF EXISTS `ibexa_activity_log_object_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_activity_log_object_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_class` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_activity_log_object_class_uidx` (`object_class`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_activity_log_object_class`
--

LOCK TABLES `ibexa_activity_log_object_class` WRITE;
/*!40000 ALTER TABLE `ibexa_activity_log_object_class` DISABLE KEYS */;
INSERT INTO `ibexa_activity_log_object_class` VALUES (1,'Ibexa\\Contracts\\Core\\Repository\\Values\\Content\\Content');
/*!40000 ALTER TABLE `ibexa_activity_log_object_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_attribute_definition`
--

DROP TABLE IF EXISTS `ibexa_attribute_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_attribute_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `identifier` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `options` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_definition_identifier_idx` (`identifier`),
  KEY `ibexa_attribute_definition_attribute_group_idx` (`attribute_group_id`),
  CONSTRAINT `ibexa_attribute_definition_attribute_group_fk` FOREIGN KEY (`attribute_group_id`) REFERENCES `ibexa_attribute_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_attribute_definition`
--

LOCK TABLES `ibexa_attribute_definition` WRITE;
/*!40000 ALTER TABLE `ibexa_attribute_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_attribute_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_attribute_definition_assignment`
--

DROP TABLE IF EXISTS `ibexa_attribute_definition_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_attribute_definition_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_definition_id` int(11) NOT NULL,
  `field_definition_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `discriminator` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_attribute_definition_assignment_main_uidx` (`field_definition_id`,`status`,`attribute_definition_id`),
  KEY `ibexa_attribute_definition_assignment_field_definition_idx` (`field_definition_id`),
  KEY `ibexa_attribute_definition_assignment_attribute_definition_idx` (`attribute_definition_id`),
  CONSTRAINT `ibexa_attribute_definition_assignment_attribute_definition_fk` FOREIGN KEY (`attribute_definition_id`) REFERENCES `ibexa_attribute_definition` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_attribute_definition_assignment`
--

LOCK TABLES `ibexa_attribute_definition_assignment` WRITE;
/*!40000 ALTER TABLE `ibexa_attribute_definition_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_attribute_definition_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_attribute_definition_ml`
--

DROP TABLE IF EXISTS `ibexa_attribute_definition_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_attribute_definition_ml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_definition_id` int(11) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name_normalized` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(10000) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_attribute_definition_ml_uidx` (`attribute_definition_id`,`language_id`),
  KEY `ibexa_attribute_definition_ml_attribute_definition_idx` (`attribute_definition_id`),
  KEY `ibexa_attribute_definition_ml_language_idx` (`language_id`),
  KEY `ibexa_attribute_definition_ml_name_idx` (`name_normalized`),
  CONSTRAINT `ibexa_attribute_definition_ml_attribute_definition_fk` FOREIGN KEY (`attribute_definition_id`) REFERENCES `ibexa_attribute_definition` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ibexa_attribute_definition_ml_language_fk` FOREIGN KEY (`language_id`) REFERENCES `ezcontent_language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_attribute_definition_ml`
--

LOCK TABLES `ibexa_attribute_definition_ml` WRITE;
/*!40000 ALTER TABLE `ibexa_attribute_definition_ml` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_attribute_definition_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_attribute_group`
--

DROP TABLE IF EXISTS `ibexa_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_attribute_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_attribute_group_identifier_uidx` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_attribute_group`
--

LOCK TABLES `ibexa_attribute_group` WRITE;
/*!40000 ALTER TABLE `ibexa_attribute_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_attribute_group_ml`
--

DROP TABLE IF EXISTS `ibexa_attribute_group_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_attribute_group_ml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name_normalized` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_group_ml_idx` (`attribute_group_id`,`language_id`),
  KEY `ibexa_attribute_group_ml_attribute_group_idx` (`attribute_group_id`),
  KEY `ibexa_attribute_group_ml_language_idx` (`language_id`),
  KEY `ibexa_attribute_group_ml_name_idx` (`name_normalized`),
  CONSTRAINT `ibexa_attribute_group_ml_attribute_group_fk` FOREIGN KEY (`attribute_group_id`) REFERENCES `ibexa_attribute_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ibexa_attribute_group_ml_language_fk` FOREIGN KEY (`language_id`) REFERENCES `ezcontent_language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_attribute_group_ml`
--

LOCK TABLES `ibexa_attribute_group_ml` WRITE;
/*!40000 ALTER TABLE `ibexa_attribute_group_ml` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_attribute_group_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_catalog`
--

DROP TABLE IF EXISTS `ibexa_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `creator_id` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'draft',
  `query_string` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_catalog_identifier_idx` (`identifier`),
  KEY `ibexa_catalog_creator_idx` (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_catalog`
--

LOCK TABLES `ibexa_catalog` WRITE;
/*!40000 ALTER TABLE `ibexa_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_catalog_ml`
--

DROP TABLE IF EXISTS `ibexa_catalog_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_catalog_ml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name_normalized` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(10000) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_catalog_ml_catalog_language_uidx` (`catalog_id`,`language_id`),
  KEY `ibexa_catalog_catalog_idx` (`catalog_id`),
  KEY `ibexa_catalog_language_idx` (`language_id`),
  CONSTRAINT `ibexa_catalog_ml_fk` FOREIGN KEY (`catalog_id`) REFERENCES `ibexa_catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_catalog_ml`
--

LOCK TABLES `ibexa_catalog_ml` WRITE;
/*!40000 ALTER TABLE `ibexa_catalog_ml` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_catalog_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_content_customer_group`
--

DROP TABLE IF EXISTS `ibexa_content_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_content_customer_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `field_version_no` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_content_customer_group_attribute_uidx` (`field_id`,`field_version_no`),
  KEY `ibexa_content_customer_group_customer_group_idx` (`customer_group_id`),
  CONSTRAINT `ibexa_content_customer_group_attribute_fk` FOREIGN KEY (`field_id`, `field_version_no`) REFERENCES `ezcontentobject_attribute` (`id`, `version`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ibexa_content_customer_group_customer_group_fk` FOREIGN KEY (`customer_group_id`) REFERENCES `ibexa_customer_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_content_customer_group`
--

LOCK TABLES `ibexa_content_customer_group` WRITE;
/*!40000 ALTER TABLE `ibexa_content_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_content_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_corporate_application_state`
--

DROP TABLE IF EXISTS `ibexa_corporate_application_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_corporate_application_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `state` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_corporate_application_state_application_unique` (`application_id`),
  UNIQUE KEY `ibexa_corporate_application_state_company_unique` (`company_id`),
  KEY `ibexa_corporate_application_state_state_idx` (`state`),
  CONSTRAINT `ibexa_corporate_application_state_application_fk` FOREIGN KEY (`application_id`) REFERENCES `ezcontentobject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ibexa_corporate_application_state_company_fk` FOREIGN KEY (`company_id`) REFERENCES `ezcontentobject` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_corporate_application_state`
--

LOCK TABLES `ibexa_corporate_application_state` WRITE;
/*!40000 ALTER TABLE `ibexa_corporate_application_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_corporate_application_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_corporate_company_history`
--

DROP TABLE IF EXISTS `ibexa_corporate_company_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_corporate_company_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `event_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `event_data` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  PRIMARY KEY (`id`),
  KEY `ibexa_corporate_company_history_company_idx` (`company_id`),
  KEY `ibexa_corporate_company_history_application_idx` (`application_id`),
  KEY `ibexa_corporate_company_history_user_idx` (`user_id`),
  CONSTRAINT `ibexa_corporate_company_history_application_fk` FOREIGN KEY (`application_id`) REFERENCES `ezcontentobject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ibexa_corporate_company_history_company_fk` FOREIGN KEY (`company_id`) REFERENCES `ezcontentobject` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ibexa_corporate_company_history_user_fk` FOREIGN KEY (`user_id`) REFERENCES `ezcontentobject` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_corporate_company_history`
--

LOCK TABLES `ibexa_corporate_company_history` WRITE;
/*!40000 ALTER TABLE `ibexa_corporate_company_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_corporate_company_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_corporate_member_assignment`
--

DROP TABLE IF EXISTS `ibexa_corporate_member_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_corporate_member_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `member_role` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `member_role_assignment_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `company_location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_corporate_member_assignment_unique_idx` (`member_id`,`company_id`),
  KEY `ibexa_corporate_member_assignment_member_idx` (`member_id`),
  KEY `ibexa_corporate_member_assignment_company_idx` (`company_id`),
  KEY `ibexa_corporate_member_assignment_company_location_idx` (`company_location_id`),
  KEY `ibexa_corporate_member_assignment_member_role_assignment_idx` (`member_role_assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_corporate_member_assignment`
--

LOCK TABLES `ibexa_corporate_member_assignment` WRITE;
/*!40000 ALTER TABLE `ibexa_corporate_member_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_corporate_member_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_currency`
--

DROP TABLE IF EXISTS `ibexa_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subunits` smallint(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_currency_code_idx` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_currency`
--

LOCK TABLES `ibexa_currency` WRITE;
/*!40000 ALTER TABLE `ibexa_currency` DISABLE KEYS */;
INSERT INTO `ibexa_currency` VALUES (1,'AFN',2,0),(2,'EUR',2,0),(3,'ALL',2,0),(4,'DZD',2,0),(5,'USD',2,0),(6,'AOA',2,0),(7,'XCD',2,0),(8,'ARS',2,0),(9,'AMD',2,0),(10,'AWG',2,0),(11,'AUD',2,0),(12,'AZN',2,0),(13,'BSD',2,0),(14,'BHD',3,0),(15,'BDT',2,0),(16,'BBD',2,0),(17,'BYN',2,0),(18,'BZD',2,0),(19,'XOF',0,0),(20,'BMD',2,0),(21,'INR',2,0),(22,'BTN',2,0),(23,'BOB',2,0),(24,'BOV',2,0),(25,'BAM',2,0),(26,'BWP',2,0),(27,'NOK',2,0),(28,'BRL',2,0),(29,'BND',2,0),(30,'BGN',2,0),(31,'BIF',0,0),(32,'CVE',2,0),(33,'KHR',2,0),(34,'XAF',0,0),(35,'CAD',2,0),(36,'KYD',2,0),(37,'CLP',0,0),(38,'CLF',4,0),(39,'CNY',2,0),(40,'COP',2,0),(41,'COU',2,0),(42,'KMF',0,0),(43,'CDF',2,0),(44,'NZD',2,0),(45,'CRC',2,0),(46,'HRK',2,0),(47,'CUP',2,0),(48,'CUC',2,0),(49,'ANG',2,0),(50,'CZK',2,0),(51,'DKK',2,0),(52,'DJF',0,0),(53,'DOP',2,0),(54,'EGP',2,0),(55,'SVC',2,0),(56,'ERN',2,0),(57,'ETB',2,0),(58,'FKP',2,0),(59,'FJD',2,0),(60,'XPF',0,0),(61,'GMD',2,0),(62,'GEL',2,0),(63,'GHS',2,0),(64,'GIP',2,0),(65,'GTQ',2,0),(66,'GBP',2,0),(67,'GNF',0,0),(68,'GYD',2,0),(69,'HTG',2,0),(70,'HNL',2,0),(71,'HKD',2,0),(72,'HUF',2,0),(73,'ISK',0,0),(74,'IDR',2,0),(75,'XDR',0,0),(76,'IRR',2,0),(77,'IQD',3,0),(78,'ILS',2,0),(79,'JMD',2,0),(80,'JPY',0,0),(81,'JOD',3,0),(82,'KZT',2,0),(83,'KES',2,0),(84,'KPW',2,0),(85,'KRW',0,0),(86,'KWD',3,0),(87,'KGS',2,0),(88,'LAK',2,0),(89,'LBP',2,0),(90,'LSL',2,0),(91,'ZAR',2,0),(92,'LRD',2,0),(93,'LYD',3,0),(94,'CHF',2,0),(95,'MOP',2,0),(96,'MKD',2,0),(97,'MGA',2,0),(98,'MWK',2,0),(99,'MYR',2,0),(100,'MVR',2,0),(101,'MRU',2,0),(102,'MUR',2,0),(103,'XUA',0,0),(104,'MXN',2,0),(105,'MXV',2,0),(106,'MDL',2,0),(107,'MNT',2,0),(108,'MAD',2,0),(109,'MZN',2,0),(110,'MMK',2,0),(111,'NAD',2,0),(112,'NPR',2,0),(113,'NIO',2,0),(114,'NGN',2,0),(115,'OMR',3,0),(116,'PKR',2,0),(117,'PAB',2,0),(118,'PGK',2,0),(119,'PYG',0,0),(120,'PEN',2,0),(121,'PHP',2,0),(122,'PLN',2,0),(123,'QAR',2,0),(124,'RON',2,0),(125,'RUB',2,0),(126,'RWF',0,0),(127,'SHP',2,0),(128,'WST',2,0),(129,'STN',2,0),(130,'SAR',2,0),(131,'RSD',2,0),(132,'SCR',2,0),(133,'SLL',2,0),(134,'SGD',2,0),(135,'XSU',0,0),(136,'SBD',2,0),(137,'SOS',2,0),(138,'SSP',2,0),(139,'LKR',2,0),(140,'SDG',2,0),(141,'SRD',2,0),(142,'SZL',2,0),(143,'SEK',2,0),(144,'CHE',2,0),(145,'CHW',2,0),(146,'SYP',2,0),(147,'TWD',2,0),(148,'TJS',2,0),(149,'TZS',2,0),(150,'THB',2,0),(151,'TOP',2,0),(152,'TTD',2,0),(153,'TND',3,0),(154,'TRY',2,0),(155,'TMT',2,0),(156,'UGX',0,0),(157,'UAH',2,0),(158,'AED',2,0),(159,'USN',2,0),(160,'UYU',2,0),(161,'UYI',0,0),(162,'UYW',4,0),(163,'UZS',2,0),(164,'VUV',0,0),(165,'VES',2,0),(166,'VND',0,0),(167,'YER',2,0),(168,'ZMW',2,0),(169,'ZWL',2,0),(170,'XBA',0,0),(171,'XBB',0,0),(172,'XBC',0,0),(173,'XBD',0,0),(174,'XTS',0,0),(175,'XXX',0,0),(176,'XAU',0,0),(177,'XPD',0,0),(178,'XPT',0,0),(179,'XAG',0,0);
/*!40000 ALTER TABLE `ibexa_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_customer_group`
--

DROP TABLE IF EXISTS `ibexa_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_customer_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `global_price_rate` decimal(5,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_customer_group_identifier_idx` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_customer_group`
--

LOCK TABLES `ibexa_customer_group` WRITE;
/*!40000 ALTER TABLE `ibexa_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_customer_group_ml`
--

DROP TABLE IF EXISTS `ibexa_customer_group_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_customer_group_ml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name_normalized` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(10000) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_customer_group_ml_customer_group_language_uidx` (`customer_group_id`,`language_id`),
  KEY `ibexa_customer_group_idx` (`customer_group_id`),
  KEY `ibexa_language_idx` (`language_id`),
  CONSTRAINT `ibexa_customer_group__ml_fk` FOREIGN KEY (`customer_group_id`) REFERENCES `ibexa_customer_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_customer_group_ml`
--

LOCK TABLES `ibexa_customer_group_ml` WRITE;
/*!40000 ALTER TABLE `ibexa_customer_group_ml` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_customer_group_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_measurement_range_value`
--

DROP TABLE IF EXISTS `ibexa_measurement_range_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_measurement_range_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_field_id` int(11) NOT NULL,
  `version_no` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `min_value` double NOT NULL,
  `max_value` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_measurement_range_value_attr_ver` (`content_field_id`,`version_no`),
  UNIQUE KEY `ibexa_measurement_range_value_attr_ver_type_unit` (`content_field_id`,`version_no`,`unit_id`),
  KEY `IDX_90D7F03DF8BD700D` (`unit_id`),
  CONSTRAINT `ibexa_measurement_range_value_attr_fk` FOREIGN KEY (`content_field_id`, `version_no`) REFERENCES `ezcontentobject_attribute` (`id`, `version`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ibexa_measurement_range_value_unit_fk` FOREIGN KEY (`unit_id`) REFERENCES `ibexa_measurement_unit` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_measurement_range_value`
--

LOCK TABLES `ibexa_measurement_range_value` WRITE;
/*!40000 ALTER TABLE `ibexa_measurement_range_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_measurement_range_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_measurement_type`
--

DROP TABLE IF EXISTS `ibexa_measurement_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_measurement_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(192) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_measurement_type_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_measurement_type`
--

LOCK TABLES `ibexa_measurement_type` WRITE;
/*!40000 ALTER TABLE `ibexa_measurement_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_measurement_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_measurement_unit`
--

DROP TABLE IF EXISTS `ibexa_measurement_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_measurement_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `identifier` varchar(192) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_measurement_unit_type_identifier` (`type_id`,`identifier`),
  KEY `IDX_7105A57BC54C8C93` (`type_id`),
  CONSTRAINT `ibexa_measurement_unit_type_fk` FOREIGN KEY (`type_id`) REFERENCES `ibexa_measurement_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_measurement_unit`
--

LOCK TABLES `ibexa_measurement_unit` WRITE;
/*!40000 ALTER TABLE `ibexa_measurement_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_measurement_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_measurement_value`
--

DROP TABLE IF EXISTS `ibexa_measurement_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_measurement_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_field_id` int(11) NOT NULL,
  `version_no` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `value` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_measurement_value_attr_ver` (`content_field_id`,`version_no`),
  UNIQUE KEY `ibexa_measurement_value_attr_ver_unit` (`content_field_id`,`version_no`,`unit_id`),
  KEY `IDX_286F4E67F8BD700D` (`unit_id`),
  CONSTRAINT `ibexa_measurement_value_attr_fk` FOREIGN KEY (`content_field_id`, `version_no`) REFERENCES `ezcontentobject_attribute` (`id`, `version`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ibexa_measurement_value_unit_fk` FOREIGN KEY (`unit_id`) REFERENCES `ibexa_measurement_unit` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_measurement_value`
--

LOCK TABLES `ibexa_measurement_value` WRITE;
/*!40000 ALTER TABLE `ibexa_measurement_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_measurement_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_migrations`
--

DROP TABLE IF EXISTS `ibexa_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_migrations` (
  `name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_migrations`
--

LOCK TABLES `ibexa_migrations` WRITE;
/*!40000 ALTER TABLE `ibexa_migrations` DISABLE KEYS */;
INSERT INTO `ibexa_migrations` VALUES ('000_taxonomy_content_types.yml','2025-01-07 13:51:15',85),('001_taxonomy_sections.yml','2025-01-07 13:51:15',25),('002_taxonomy_content.yml','2025-01-07 13:51:16',506),('003_taxonomy_permissions.yml','2025-01-07 13:51:16',152),('009_product_catalog.yml','2025-01-07 13:51:16',158),('010_currencies.yml','2025-01-07 13:51:17',433),('012_corporate_account_registration.yml','2025-01-07 13:51:19',302),('012_corporate_account.yml','2025-01-07 13:51:19',1218),('013_assign_role_limitations.yml','2025-01-07 13:51:19',113),('2022_06_23_09_39_product_categories.yaml','2025-01-07 13:51:17',586),('2022_11_07_22_46_application_internal_fields.yaml','2025-01-07 13:51:19',88),('2023_03_06_13_00_customer_portal.yaml','2025-01-07 13:51:19',135),('2023_05_09_12_40_corporate_access_role_update.yaml','2025-01-07 13:51:19',102),('2023_08_11_12_40_required_billing_address.yaml','2025-01-07 13:51:20',116),('2023_09_23_14_15_dashboard_structure.yaml','2025-01-07 13:51:20',613),('2023_10_10_16_14_dashboard_permissions.yaml','2025-01-07 13:51:20',47),('2023_11_20_21_32_product_catalog_dashboard_structure.yaml','2025-01-07 13:51:21',90),('2023_12_04_13_34_activity_log_dashboard_structure.yaml','2025-01-07 13:51:21',488),('2023_12_05_17_00_personalization_dashboard_structure.yaml','2025-01-07 13:51:21',55),('2023_12_06_15_00_image_content_type.yaml','2025-01-07 13:51:16',77),('2023_12_07_20_23_editor_content_type.yaml','2025-01-07 13:51:02',121),('2024_01_09_22_23_editor_permissions.yaml','2025-01-07 13:51:02',240),('2024_07_25_07_00_non_translatable_product_categories.yaml','2025-01-07 13:51:17',90);
/*!40000 ALTER TABLE `ibexa_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product`
--

DROP TABLE IF EXISTS `ibexa_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_product_id` int(11) DEFAULT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_product_code_uidx` (`code`),
  KEY `ibexa_product_base_product_idx` (`base_product_id`),
  CONSTRAINT `ibexa_product_base_product_fk` FOREIGN KEY (`base_product_id`) REFERENCES `ibexa_product` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product`
--

LOCK TABLES `ibexa_product` WRITE;
/*!40000 ALTER TABLE `ibexa_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_specification`
--

DROP TABLE IF EXISTS `ibexa_product_specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_no` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `content_id` int(11) DEFAULT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `base_product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_product_specification_field_version_uidx` (`field_id`,`version_no`),
  KEY `ibexa_product_specification_fid` (`field_id`),
  KEY `ibexa_product_specification_pc` (`code`),
  KEY `ibexa_product_idx` (`product_id`),
  KEY `ibexa_product_specification_base_pid` (`base_product_id`),
  KEY `ibexa_product_specification_cv` (`content_id`,`version_no`),
  CONSTRAINT `ibexa_product_fkey` FOREIGN KEY (`product_id`) REFERENCES `ibexa_product` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ibexa_product_specification_field_version_fk` FOREIGN KEY (`field_id`, `version_no`) REFERENCES `ezcontentobject_attribute` (`id`, `version`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_specification`
--

LOCK TABLES `ibexa_product_specification` WRITE;
/*!40000 ALTER TABLE `ibexa_product_specification` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_specification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_specification_asset`
--

DROP TABLE IF EXISTS `ibexa_product_specification_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_specification_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_specification_id` int(11) NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tags` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  PRIMARY KEY (`id`),
  KEY `ibexa_product_specification_asset_pid` (`product_specification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_specification_asset`
--

LOCK TABLES `ibexa_product_specification_asset` WRITE;
/*!40000 ALTER TABLE `ibexa_product_specification_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_specification_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_specification_attribute`
--

DROP TABLE IF EXISTS `ibexa_product_specification_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_specification_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_specification_id` int(11) NOT NULL,
  `attribute_definition_id` int(11) NOT NULL,
  `discriminator` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ibexa_product_specification_attribute_sid_idx` (`product_specification_id`),
  KEY `ibexa_product_specification_attribute_aid_idx` (`attribute_definition_id`),
  CONSTRAINT `ibexa_product_specification_attribute_aid` FOREIGN KEY (`attribute_definition_id`) REFERENCES `ibexa_attribute_definition` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ibexa_product_specification_attribute_sid_fk` FOREIGN KEY (`product_specification_id`) REFERENCES `ibexa_product_specification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_specification_attribute`
--

LOCK TABLES `ibexa_product_specification_attribute` WRITE;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_specification_attribute_boolean`
--

DROP TABLE IF EXISTS `ibexa_product_specification_attribute_boolean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_specification_attribute_boolean` (
  `id` int(11) NOT NULL,
  `value` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ibexa_product_specification_attribute_boolean_value_idx` (`value`),
  CONSTRAINT `ibexa_product_specification_attribute_boolean_fk` FOREIGN KEY (`id`) REFERENCES `ibexa_product_specification_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_specification_attribute_boolean`
--

LOCK TABLES `ibexa_product_specification_attribute_boolean` WRITE;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_boolean` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_boolean` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_specification_attribute_float`
--

DROP TABLE IF EXISTS `ibexa_product_specification_attribute_float`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_specification_attribute_float` (
  `id` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ibexa_product_specification_attribute_float_value_idx` (`value`),
  CONSTRAINT `ibexa_product_specification_attribute_float_fk` FOREIGN KEY (`id`) REFERENCES `ibexa_product_specification_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_specification_attribute_float`
--

LOCK TABLES `ibexa_product_specification_attribute_float` WRITE;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_float` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_float` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_specification_attribute_integer`
--

DROP TABLE IF EXISTS `ibexa_product_specification_attribute_integer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_specification_attribute_integer` (
  `id` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ibexa_product_specification_attribute_integer_value_idx` (`value`),
  CONSTRAINT `ibexa_product_specification_attribute_integer_fk` FOREIGN KEY (`id`) REFERENCES `ibexa_product_specification_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_specification_attribute_integer`
--

LOCK TABLES `ibexa_product_specification_attribute_integer` WRITE;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_integer` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_integer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_specification_attribute_measurement_range`
--

DROP TABLE IF EXISTS `ibexa_product_specification_attribute_measurement_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_specification_attribute_measurement_range` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `min_value` double DEFAULT NULL,
  `max_value` double DEFAULT NULL,
  `base_min_value` double DEFAULT NULL,
  `base_max_value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ibexa_product_specification_attr_range_measurement_unit_idx` (`unit_id`),
  KEY `ibexa_product_specification_attr_range_measurement_baseunit_idx` (`base_unit_id`),
  CONSTRAINT `ibexa_product_specification_attr_range_measurement_baseunit_fk` FOREIGN KEY (`base_unit_id`) REFERENCES `ibexa_measurement_unit` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ibexa_product_specification_attr_range_measurement_range_fk` FOREIGN KEY (`id`) REFERENCES `ibexa_product_specification_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ibexa_product_specification_attr_range_measurement_unit_fk` FOREIGN KEY (`unit_id`) REFERENCES `ibexa_measurement_unit` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_specification_attribute_measurement_range`
--

LOCK TABLES `ibexa_product_specification_attribute_measurement_range` WRITE;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_measurement_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_measurement_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_specification_attribute_measurement_value`
--

DROP TABLE IF EXISTS `ibexa_product_specification_attribute_measurement_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_specification_attribute_measurement_value` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `base_value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ibexa_product_specification_attr_value_measurement_unit_idx` (`unit_id`),
  KEY `ibexa_product_specification_attr_value_measurement_baseunit_idx` (`base_unit_id`),
  CONSTRAINT `ibexa_product_specification_attr_single_measurement_baseunit_fk` FOREIGN KEY (`base_unit_id`) REFERENCES `ibexa_measurement_unit` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ibexa_product_specification_attr_single_measurement_unit_fk` FOREIGN KEY (`unit_id`) REFERENCES `ibexa_measurement_unit` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ibexa_product_specification_attr_single_measurement_value_fk` FOREIGN KEY (`id`) REFERENCES `ibexa_product_specification_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_specification_attribute_measurement_value`
--

LOCK TABLES `ibexa_product_specification_attribute_measurement_value` WRITE;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_measurement_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_measurement_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_specification_attribute_selection`
--

DROP TABLE IF EXISTS `ibexa_product_specification_attribute_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_specification_attribute_selection` (
  `id` int(11) NOT NULL,
  `value` varchar(190) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ibexa_product_specification_attribute_selection_value_idx` (`value`),
  CONSTRAINT `ibexa_product_specification_attribute_selection_fk` FOREIGN KEY (`id`) REFERENCES `ibexa_product_specification_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_specification_attribute_selection`
--

LOCK TABLES `ibexa_product_specification_attribute_selection` WRITE;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_specification_attribute_simple_custom`
--

DROP TABLE IF EXISTS `ibexa_product_specification_attribute_simple_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_specification_attribute_simple_custom` (
  `id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  PRIMARY KEY (`id`),
  CONSTRAINT `ibexa_product_specification_attribute_simple_custom_fk` FOREIGN KEY (`id`) REFERENCES `ibexa_product_specification_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_specification_attribute_simple_custom`
--

LOCK TABLES `ibexa_product_specification_attribute_simple_custom` WRITE;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_simple_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_specification_attribute_simple_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_specification_availability`
--

DROP TABLE IF EXISTS `ibexa_product_specification_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_specification_availability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT 0,
  `is_infinite` tinyint(1) NOT NULL DEFAULT 0,
  `stock` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_product_specification_availability_product_code_uidx` (`product_code`),
  KEY `ibexa_product_specification_availability_idx` (`availability`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_specification_availability`
--

LOCK TABLES `ibexa_product_specification_availability` WRITE;
/*!40000 ALTER TABLE `ibexa_product_specification_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_specification_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_specification_price`
--

DROP TABLE IF EXISTS `ibexa_product_specification_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_specification_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL,
  `product_code` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `discriminator` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'main',
  `amount` decimal(19,4) NOT NULL,
  `custom_price_amount` decimal(19,4) DEFAULT NULL,
  `custom_price_rule` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ibexa_product_specification_price_product_code_idx` (`product_code`),
  KEY `ibexa_product_specification_price_currency_idx` (`currency_id`),
  CONSTRAINT `ibexa_product_specification_price_currency_fk` FOREIGN KEY (`currency_id`) REFERENCES `ibexa_currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_specification_price`
--

LOCK TABLES `ibexa_product_specification_price` WRITE;
/*!40000 ALTER TABLE `ibexa_product_specification_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_specification_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_specification_price_customer_group`
--

DROP TABLE IF EXISTS `ibexa_product_specification_price_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_specification_price_customer_group` (
  `id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ibexa_product_specification_price_customer_group_idx` (`customer_group_id`),
  CONSTRAINT `ibexa_product_specification_price_customer_group_fk` FOREIGN KEY (`customer_group_id`) REFERENCES `ibexa_customer_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_specification_price_customer_group`
--

LOCK TABLES `ibexa_product_specification_price_customer_group` WRITE;
/*!40000 ALTER TABLE `ibexa_product_specification_price_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_specification_price_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_type_settings`
--

DROP TABLE IF EXISTS `ibexa_product_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_type_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_definition_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_virtual` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_product_type_setting_field_definition_uidx` (`field_definition_id`,`status`),
  KEY `ibexa_product_type_setting_field_definition_idx` (`field_definition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_type_settings`
--

LOCK TABLES `ibexa_product_type_settings` WRITE;
/*!40000 ALTER TABLE `ibexa_product_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_product_type_specification_region_vat_category`
--

DROP TABLE IF EXISTS `ibexa_product_type_specification_region_vat_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_product_type_specification_region_vat_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_definition_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `region` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `vat_category` varchar(190) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_product_type_region_vat_category_product_region_fk` (`field_definition_id`,`status`,`region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_product_type_specification_region_vat_category`
--

LOCK TABLES `ibexa_product_type_specification_region_vat_category` WRITE;
/*!40000 ALTER TABLE `ibexa_product_type_specification_region_vat_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_product_type_specification_region_vat_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_segment_group_map`
--

DROP TABLE IF EXISTS `ibexa_segment_group_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_segment_group_map` (
  `segment_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`segment_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_segment_group_map`
--

LOCK TABLES `ibexa_segment_group_map` WRITE;
/*!40000 ALTER TABLE `ibexa_segment_group_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_segment_group_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_segment_groups`
--

DROP TABLE IF EXISTS `ibexa_segment_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_segment_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`identifier`),
  UNIQUE KEY `ibexa_segment_groups_identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_segment_groups`
--

LOCK TABLES `ibexa_segment_groups` WRITE;
/*!40000 ALTER TABLE `ibexa_segment_groups` DISABLE KEYS */;
INSERT INTO `ibexa_segment_groups` VALUES (1,'corporate_accounts','Corporate Accounts');
/*!40000 ALTER TABLE `ibexa_segment_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_segment_user_map`
--

DROP TABLE IF EXISTS `ibexa_segment_user_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_segment_user_map` (
  `segment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`segment_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_segment_user_map`
--

LOCK TABLES `ibexa_segment_user_map` WRITE;
/*!40000 ALTER TABLE `ibexa_segment_user_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_segment_user_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_segments`
--

DROP TABLE IF EXISTS `ibexa_segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_segments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`identifier`),
  UNIQUE KEY `ibexa_segments_identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_segments`
--

LOCK TABLES `ibexa_segments` WRITE;
/*!40000 ALTER TABLE `ibexa_segments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_segments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_setting`
--

DROP TABLE IF EXISTS `ibexa_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '(DC2Type:json)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_setting_group_identifier` (`group`,`identifier`),
  KEY `ibexa_setting_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_setting`
--

LOCK TABLES `ibexa_setting` WRITE;
/*!40000 ALTER TABLE `ibexa_setting` DISABLE KEYS */;
INSERT INTO `ibexa_setting` VALUES (1,'personalization','installation_key','\"\"');
/*!40000 ALTER TABLE `ibexa_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_taxonomy_assignments`
--

DROP TABLE IF EXISTS `ibexa_taxonomy_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_taxonomy_assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) DEFAULT NULL,
  `content_id` int(11) NOT NULL,
  `version_no` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_taxonomy_assignments_unique_entry_content_idx` (`entry_id`,`content_id`,`version_no`),
  KEY `ibexa_taxonomy_assignments_entry_id_idx` (`entry_id`),
  KEY `ibexa_taxonomy_assignments_content_id_version_no_idx` (`content_id`,`version_no`),
  CONSTRAINT `FK_17589FEBBA364942` FOREIGN KEY (`entry_id`) REFERENCES `ibexa_taxonomy_entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_taxonomy_assignments`
--

LOCK TABLES `ibexa_taxonomy_assignments` WRITE;
/*!40000 ALTER TABLE `ibexa_taxonomy_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_taxonomy_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_taxonomy_entries`
--

DROP TABLE IF EXISTS `ibexa_taxonomy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_taxonomy_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `names` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `mainLanguageCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_id` int(11) NOT NULL,
  `left` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL,
  `lvl` int(11) NOT NULL,
  `taxonomy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_taxonomy_entries_identifier_idx` (`taxonomy`,`identifier`),
  KEY `IDX_74706FD6727ACA70` (`parent_id`),
  KEY `ibexa_taxonomy_entries_content_id_idx` (`content_id`),
  CONSTRAINT `FK_74706FD6727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `ibexa_taxonomy_entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_taxonomy_entries`
--

LOCK TABLES `ibexa_taxonomy_entries` WRITE;
/*!40000 ALTER TABLE `ibexa_taxonomy_entries` DISABLE KEYS */;
INSERT INTO `ibexa_taxonomy_entries` VALUES (1,NULL,'root','Root','a:1:{s:6:\"eng-GB\";s:4:\"Root\";}','eng-GB',58,1,2,1,0,'tags'),(2,NULL,'product_root','Product Root Tag','a:1:{s:6:\"eng-GB\";s:16:\"Product Root Tag\";}','eng-GB',62,1,2,2,0,'product_categories');
/*!40000 ALTER TABLE `ibexa_taxonomy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_token`
--

DROP TABLE IF EXISTS `ibexa_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT 0,
  `expires` int(11) NOT NULL DEFAULT 0,
  `revoked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_token_unique` (`token`,`identifier`,`type_id`),
  KEY `IDX_B5412887C54C8C93` (`type_id`),
  CONSTRAINT `ibexa_token_type_id_fk` FOREIGN KEY (`type_id`) REFERENCES `ibexa_token_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_token`
--

LOCK TABLES `ibexa_token` WRITE;
/*!40000 ALTER TABLE `ibexa_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_token_type`
--

DROP TABLE IF EXISTS `ibexa_token_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_token_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_token_type_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_token_type`
--

LOCK TABLES `ibexa_token_type` WRITE;
/*!40000 ALTER TABLE `ibexa_token_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_token_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_user_invitations`
--

DROP TABLE IF EXISTS `ibexa_user_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_user_invitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `site_access_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `creation_date` int(11) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_user_invitations_email_uindex` (`email`(191)),
  UNIQUE KEY `ibexa_user_invitations_hash_uindex` (`hash`(191)),
  KEY `ibexa_user_invitations_email_idx` (`email`),
  KEY `ibexa_user_invitations_hash_idx` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_user_invitations`
--

LOCK TABLES `ibexa_user_invitations` WRITE;
/*!40000 ALTER TABLE `ibexa_user_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_user_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_user_invitations_assignments`
--

DROP TABLE IF EXISTS `ibexa_user_invitations_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_user_invitations_assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invitation_id` int(11) NOT NULL,
  `user_group_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `limitation_type` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `limitation_value` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DA5A7872A35D7AF0` (`invitation_id`),
  CONSTRAINT `ibexa_user_invitations_assignments_ibexa_user_invitations_id_fk` FOREIGN KEY (`invitation_id`) REFERENCES `ibexa_user_invitations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_user_invitations_assignments`
--

LOCK TABLES `ibexa_user_invitations_assignments` WRITE;
/*!40000 ALTER TABLE `ibexa_user_invitations_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_user_invitations_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_workflow_version_lock`
--

DROP TABLE IF EXISTS `ibexa_workflow_version_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_workflow_version_lock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_version_lock_content` (`content_id`),
  KEY `idx_version_lock_user` (`user_id`),
  KEY `idx_version_lock_content_version` (`content_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_workflow_version_lock`
--

LOCK TABLES `ibexa_workflow_version_lock` WRITE;
/*!40000 ALTER TABLE `ibexa_workflow_version_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_workflow_version_lock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-07 13:51:36
