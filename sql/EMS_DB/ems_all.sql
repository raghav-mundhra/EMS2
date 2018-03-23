-- MySQL dump 10.16  Distrib 10.1.25-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: ems
-- ------------------------------------------------------
-- Server version	10.1.25-MariaDB

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
-- Current Database: `ems`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ems` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ems`;

--
-- Table structure for table `academic_sessions`
--

DROP TABLE IF EXISTS `academic_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_sessions` (
  `ac_session_id` int(5) NOT NULL AUTO_INCREMENT,
  `from_year` year(4) NOT NULL,
  `course_id` int(5) NOT NULL,
  `current_semester` int(1) NOT NULL,
  PRIMARY KEY (`ac_session_id`),
  UNIQUE KEY `from_year` (`from_year`,`course_id`,`current_semester`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `academic_sessions_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_sessions`
--

LOCK TABLES `academic_sessions` WRITE;
/*!40000 ALTER TABLE `academic_sessions` DISABLE KEYS */;
INSERT INTO `academic_sessions` VALUES (1,2016,1,1),(2,2016,1,2);
/*!40000 ALTER TABLE `academic_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditing`
--

DROP TABLE IF EXISTS `auditing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditing` (
  `session_id` int(11) NOT NULL,
  `sub_code` varchar(12) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `check_id` int(11) DEFAULT '0',
  `component_id` int(2) NOT NULL,
  `type_flag` int(1) NOT NULL COMMENT '[0]:Main Examination,[1]:Retotalling,[2]:Revaluation,[3]:ATKT',
  PRIMARY KEY (`session_id`,`type_flag`),
  KEY `check_id` (`check_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `component_id` (`component_id`),
  KEY `sub_code` (`sub_code`),
  CONSTRAINT `auditing_ibfk_1` FOREIGN KEY (`check_id`) REFERENCES `checking` (`check_id`),
  CONSTRAINT `auditing_ibfk_2` FOREIGN KEY (`component_id`) REFERENCES `component` (`component_id`),
  CONSTRAINT `auditing_ibfk_4` FOREIGN KEY (`sub_code`) REFERENCES `subjects` (`sub_code`),
  CONSTRAINT `auditing_ibfk_5` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditing`
--

LOCK TABLES `auditing` WRITE;
/*!40000 ALTER TABLE `auditing` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `course_id` int(4) NOT NULL,
  `program` varchar(60) NOT NULL,
  `branch` varchar(100) NOT NULL,
  PRIMARY KEY (`course_id`),
  CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'Bachelors of Technology','Computer Science & Information Technology'),(2,'Bachelors of Business Administration','Retail Management'),(3,'Bachelors of Technology','Automobile'),(4,'Bachelors of Technology','Mechatronics'),(5,'Bachelors of Business Administration','Banking Financial services and Insurance'),(6,'Masters of Business Administration','Banking Financial services and Insurance');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `chat_id` int(10) NOT NULL AUTO_INCREMENT,
  `sender` varchar(60) NOT NULL,
  `receiver` varchar(60) NOT NULL,
  `msg` varchar(500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checking`
--

DROP TABLE IF EXISTS `checking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checking` (
  `check_id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(1000) NOT NULL,
  PRIMARY KEY (`check_id`),
  KEY `operator_id` (`operator_id`),
  CONSTRAINT `checking_ibfk_1` FOREIGN KEY (`operator_id`) REFERENCES `operators` (`operator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checking`
--

LOCK TABLES `checking` WRITE;
/*!40000 ALTER TABLE `checking` DISABLE KEYS */;
/*!40000 ALTER TABLE `checking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component` (
  `component_id` int(2) NOT NULL AUTO_INCREMENT,
  `component_name` varchar(255) NOT NULL,
  PRIMARY KEY (`component_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES (1,'Continuous Assessment Theory '),(2,'End Semester Theory'),(3,'Continuous Assessment Practical'),(4,'End Semester Practical'),(5,'Industry Assessment'),(6,'Internal Examination');
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component_distribution`
--

DROP TABLE IF EXISTS `component_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component_distribution` (
  `component_id` int(2) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `passing_marks` decimal(7,4) NOT NULL,
  `max_marks` decimal(7,4) NOT NULL,
  PRIMARY KEY (`component_id`,`sub_id`),
  KEY `sub_id` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_distribution`
--

LOCK TABLES `component_distribution` WRITE;
/*!40000 ALTER TABLE `component_distribution` DISABLE KEYS */;
INSERT INTO `component_distribution` VALUES (1,1,20.0000,50.0000),(2,1,20.0000,50.0000),(3,2,16.0000,40.0000),(4,2,16.0000,40.0000),(5,2,8.0000,20.0000),(6,3,40.0000,100.0000);
/*!40000 ALTER TABLE `component_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_level`
--

DROP TABLE IF EXISTS `course_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_level` (
  `level_id` int(1) NOT NULL,
  `level_name` varchar(255) NOT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_level`
--

LOCK TABLES `course_level` WRITE;
/*!40000 ALTER TABLE `course_level` DISABLE KEYS */;
INSERT INTO `course_level` VALUES (1,'Undergraduate'),(2,'Postgraduate');
/*!40000 ALTER TABLE `course_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` int(4) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL,
  `level_id` int(1) NOT NULL,
  `course_name` varchar(300) NOT NULL,
  `duration` int(1) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `level_id` (`level_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `component` (`component_id`),
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `course_level` (`level_id`),
  CONSTRAINT `courses_ibfk_3` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,1,1,'Bachelors of Technology Computer Science & Information Technology',4),(2,4,1,'Bachelors of Business Administration Retail Management',3),(3,2,1,'Bachelors of Technology Automobile',4),(4,2,1,'Bachelors of Technology Mechatronics',4),(5,3,1,'Bachelors of Business Administration Banking Financial services and Insurance',3),(6,3,2,'Masters of Business Administration Banking Financial services and Insurance',2);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detained_subject`
--

DROP TABLE IF EXISTS `detained_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detained_subject` (
  `roll_id` int(11) NOT NULL,
  `detained_sub_id` int(5) NOT NULL,
  PRIMARY KEY (`roll_id`,`detained_sub_id`),
  KEY `detained_sub_id` (`detained_sub_id`),
  CONSTRAINT `detained_subject_ibfk_1` FOREIGN KEY (`roll_id`) REFERENCES `roll_list` (`roll_id`),
  CONSTRAINT `detained_subject_ibfk_2` FOREIGN KEY (`detained_sub_id`) REFERENCES `sub_distribution` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detained_subject`
--

LOCK TABLES `detained_subject` WRITE;
/*!40000 ALTER TABLE `detained_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `detained_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_tr_request`
--

DROP TABLE IF EXISTS `edit_tr_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edit_tr_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `requester` int(3) NOT NULL,
  `roll_id` int(11) NOT NULL,
  `sub_code` varchar(10) NOT NULL,
  `cat_flag` tinyint(1) NOT NULL,
  `end_theory_flag` tinyint(1) NOT NULL,
  `cap_flag` tinyint(1) NOT NULL,
  `end_practical_flag` tinyint(1) NOT NULL,
  `ia_flag` tinyint(1) NOT NULL,
  `ie_flag` tinyint(1) NOT NULL,
  `remarks` varchar(300) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0:No action taken; 1:Approved; 2:Disapproved; 3:Closed',
  PRIMARY KEY (`request_id`),
  KEY `requester` (`requester`),
  KEY `roll_id` (`roll_id`),
  KEY `sub_code` (`sub_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_tr_request`
--

LOCK TABLES `edit_tr_request` WRITE;
/*!40000 ALTER TABLE `edit_tr_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_tr_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elective_map`
--

DROP TABLE IF EXISTS `elective_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elective_map` (
  `enrol_no` varchar(12) NOT NULL,
  `elective_sub_code` varchar(10) NOT NULL,
  PRIMARY KEY (`enrol_no`,`elective_sub_code`),
  KEY `elective_sub_code` (`elective_sub_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elective_map`
--

LOCK TABLES `elective_map` WRITE;
/*!40000 ALTER TABLE `elective_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `elective_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_month_year`
--

DROP TABLE IF EXISTS `exam_month_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_month_year` (
  `session_id` int(11) NOT NULL,
  `month_year` varchar(30) NOT NULL,
  `type_flag` int(1) NOT NULL,
  PRIMARY KEY (`session_id`,`type_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_month_year`
--

LOCK TABLES `exam_month_year` WRITE;
/*!40000 ALTER TABLE `exam_month_year` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_month_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_summary`
--

DROP TABLE IF EXISTS `exam_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_summary` (
  `roll_id` int(10) NOT NULL,
  `total_credits_earned` int(3) NOT NULL,
  `total_gpv_earned` int(3) NOT NULL,
  `sgpa` decimal(6,4) NOT NULL,
  PRIMARY KEY (`roll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_summary`
--

LOCK TABLES `exam_summary` WRITE;
/*!40000 ALTER TABLE `exam_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failure_report`
--

DROP TABLE IF EXISTS `failure_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failure_report` (
  `roll_id` int(10) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `component_id` int(2) NOT NULL,
  PRIMARY KEY (`roll_id`,`sub_id`,`component_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failure_report`
--

LOCK TABLES `failure_report` WRITE;
/*!40000 ALTER TABLE `failure_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `failure_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_summary`
--

DROP TABLE IF EXISTS `issue_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_summary` (
  `session_id` int(5) NOT NULL,
  `notification_date` date NOT NULL,
  `type_flag` int(1) NOT NULL,
  PRIMARY KEY (`session_id`,`type_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_summary`
--

LOCK TABLES `issue_summary` WRITE;
/*!40000 ALTER TABLE `issue_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operators`
--

DROP TABLE IF EXISTS `operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operators` (
  `operator_id` int(3) NOT NULL AUTO_INCREMENT,
  `operator_name` varchar(500) NOT NULL,
  `operator_email` varchar(30) NOT NULL,
  `operator_username` varchar(200) NOT NULL,
  `operator_password` varchar(200) NOT NULL,
  `operator_active` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operator_id`),
  UNIQUE KEY `operator_username` (`operator_username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operators`
--

LOCK TABLES `operators` WRITE;
/*!40000 ALTER TABLE `operators` DISABLE KEYS */;
INSERT INTO `operators` VALUES (2,'operator','operator','operator','5f4dcc3b5aa765d61d8327deb882cf99',1,0),(4,'Samyak','captainsamyak@gmail.com','captainsamyak','296a154b460501a3ca3144c9f8a9d1d7',0,0),(5,'Samyak Jain','jainsamyak330@s.co','jainsamyak330','5e3afa2252e7a70d135dd2447a112b22',0,0),(6,'Chayan Bansal','bansalc10@gmail.com','bansalc10','5f4dcc3b5aa765d61d8327deb882cf99',1,0),(7,'Raghav','raghav.mundhra3011@gmail.com','raghav.mundhra3011','9460d2107460db9c63715141329e96de',0,0);
/*!40000 ALTER TABLE `operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roll_list`
--

DROP TABLE IF EXISTS `roll_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roll_list` (
  `roll_id` int(10) NOT NULL AUTO_INCREMENT,
  `enrol_no` varchar(12) NOT NULL,
  `semester` int(1) NOT NULL,
  `atkt_flag` tinyint(1) NOT NULL,
  `serial_no` decimal(8,0) DEFAULT NULL,
  `no_prints` int(3) NOT NULL DEFAULT '0',
  `retotal_reg_flag` int(1) NOT NULL DEFAULT '0',
  `reval_reg_flag` int(1) NOT NULL DEFAULT '0',
  `atkt_reg_flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`roll_id`),
  KEY `enrol_no` (`enrol_no`),
  CONSTRAINT `roll_list_ibfk_1` FOREIGN KEY (`enrol_no`) REFERENCES `students` (`enrol_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roll_list`
--

LOCK TABLES `roll_list` WRITE;
/*!40000 ALTER TABLE `roll_list` DISABLE KEYS */;
INSERT INTO `roll_list` VALUES (1,'2016ab001010',1,0,1,0,0,1,0);
/*!40000 ALTER TABLE `roll_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` text NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,'School of Computer Science & Information Technology'),(2,'School of Automobile & Mechatronics Engineering'),(3,'School of Banking, Financial Services, Insurance'),(4,'School of Retail Management'),(5,'School of Construction Engineering & Management');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score` (
  `roll_id` int(10) NOT NULL,
  `component_id` int(2) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `marks` decimal(7,4) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `check_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`roll_id`,`component_id`,`sub_id`),
  KEY `sub_id` (`sub_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `check_id` (`check_id`),
  KEY `component_id` (`component_id`,`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `enrol_no` varchar(12) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `address` varchar(500) NOT NULL,
  `gender` char(1) NOT NULL,
  `stud_mobile` varchar(10) NOT NULL,
  `guardian_mobile` varchar(10) DEFAULT NULL,
  `to_year` year(4) NOT NULL,
  `cgpa` decimal(6,4) DEFAULT NULL,
  `ac_session_id` int(5) NOT NULL,
  PRIMARY KEY (`enrol_no`),
  KEY `ac_session_id` (`ac_session_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`ac_session_id`) REFERENCES `academic_sessions` (`ac_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('2016ab001010','test','test','test','test','test','test','M','9999999999',NULL,2020,NULL,1);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_distribution`
--

DROP TABLE IF EXISTS `sub_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_distribution` (
  `sub_id` int(5) NOT NULL AUTO_INCREMENT,
  `sub_code` varchar(10) NOT NULL,
  `practical_flag` tinyint(1) NOT NULL,
  `credits_allotted` int(1) NOT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `sub_code` (`sub_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_distribution`
--

LOCK TABLES `sub_distribution` WRITE;
/*!40000 ALTER TABLE `sub_distribution` DISABLE KEYS */;
INSERT INTO `sub_distribution` VALUES (1,'BTCS01CC01',0,2),(2,'BTCS01CC01',1,3),(3,'BTCS01CC02',2,0);
/*!40000 ALTER TABLE `sub_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `sub_code` varchar(10) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `total_credits` int(2) NOT NULL,
  `ie_flag` int(11) NOT NULL,
  `elective_flag` tinyint(1) NOT NULL DEFAULT '0',
  `ac_session_id` int(11) NOT NULL,
  PRIMARY KEY (`sub_code`,`ac_session_id`),
  KEY `ac_session_id` (`ac_session_id`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`ac_session_id`) REFERENCES `academic_sessions` (`ac_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES ('BTCS01CC01','Applied Mathematics',5,0,0,1),('BTCS01CC02','PPM Management',0,1,0,1);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_admin`
--

DROP TABLE IF EXISTS `super_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_admin` (
  `super_admin_id` int(1) NOT NULL AUTO_INCREMENT,
  `super_admin_name` varchar(200) NOT NULL,
  `super_admin_email` varchar(30) NOT NULL,
  `super_admin_username` varchar(200) NOT NULL,
  `super_admin_password` varchar(200) NOT NULL,
  PRIMARY KEY (`super_admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_admin`
--

LOCK TABLES `super_admin` WRITE;
/*!40000 ALTER TABLE `super_admin` DISABLE KEYS */;
INSERT INTO `super_admin` VALUES (1,'SuperAdmin','super@test.com','17c4520f6cfd1ab53d8745e84681eb49','874fcc6e14275dde5a23319c9ce5f8e4');
/*!40000 ALTER TABLE `super_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tr`
--

DROP TABLE IF EXISTS `tr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tr` (
  `roll_id` int(10) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `cat_cap` decimal(7,4) DEFAULT NULL,
  `ia` decimal(7,4) DEFAULT NULL,
  `end_sem` decimal(7,4) DEFAULT NULL,
  `ie` decimal(7,4) DEFAULT NULL,
  `total` decimal(7,4) NOT NULL,
  `percent` decimal(7,4) NOT NULL,
  `grade` char(2) NOT NULL,
  `gp` int(2) NOT NULL,
  `cr` int(2) NOT NULL,
  `gpv` decimal(7,4) NOT NULL,
  PRIMARY KEY (`roll_id`,`sub_id`),
  KEY `sub_id` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tr`
--

LOCK TABLES `tr` WRITE;
/*!40000 ALTER TABLE `tr` DISABLE KEYS */;
/*!40000 ALTER TABLE `tr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(1000) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `operator_id` (`operator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ems_retotal`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ems_retotal` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ems_retotal`;

--
-- Table structure for table `retotal_exam_summary`
--

DROP TABLE IF EXISTS `retotal_exam_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retotal_exam_summary` (
  `retotal_roll_id` int(10) NOT NULL,
  `total_cr_earned` int(10) NOT NULL,
  `total_gpv_earned` int(10) NOT NULL,
  `sgpa` decimal(7,4) NOT NULL,
  PRIMARY KEY (`retotal_roll_id`),
  CONSTRAINT `retotal_exam_summary_ibfk_1` FOREIGN KEY (`retotal_roll_id`) REFERENCES `retotal_roll_list` (`retotal_roll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retotal_exam_summary`
--

LOCK TABLES `retotal_exam_summary` WRITE;
/*!40000 ALTER TABLE `retotal_exam_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `retotal_exam_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retotal_failure_report`
--

DROP TABLE IF EXISTS `retotal_failure_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retotal_failure_report` (
  `retotal_roll_id` int(10) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `component_id` int(2) NOT NULL,
  PRIMARY KEY (`retotal_roll_id`,`sub_id`,`component_id`),
  KEY `retotal_roll_id` (`retotal_roll_id`,`component_id`,`sub_id`),
  CONSTRAINT `retotal_failure_report_ibfk_1` FOREIGN KEY (`retotal_roll_id`, `component_id`, `sub_id`) REFERENCES `score_retotal` (`retotal_roll_id`, `component_id`, `sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retotal_failure_report`
--

LOCK TABLES `retotal_failure_report` WRITE;
/*!40000 ALTER TABLE `retotal_failure_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `retotal_failure_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retotal_roll_list`
--

DROP TABLE IF EXISTS `retotal_roll_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retotal_roll_list` (
  `retotal_roll_id` int(10) NOT NULL AUTO_INCREMENT,
  `roll_id` int(10) NOT NULL,
  `retotal_session_id` int(10) NOT NULL,
  `serial_no` int(10) NOT NULL,
  PRIMARY KEY (`retotal_roll_id`),
  KEY `roll_id` (`roll_id`),
  KEY `retotal_session_id` (`retotal_session_id`),
  CONSTRAINT `retotal_roll_list_ibfk_1` FOREIGN KEY (`roll_id`) REFERENCES `ems`.`roll_list` (`roll_id`),
  CONSTRAINT `retotal_roll_list_ibfk_2` FOREIGN KEY (`retotal_session_id`) REFERENCES `retotal_sessions` (`retotal_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retotal_roll_list`
--

LOCK TABLES `retotal_roll_list` WRITE;
/*!40000 ALTER TABLE `retotal_roll_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `retotal_roll_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retotal_sessions`
--

DROP TABLE IF EXISTS `retotal_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retotal_sessions` (
  `retotal_session_id` int(10) NOT NULL AUTO_INCREMENT,
  `ac_session_id` int(10) NOT NULL,
  PRIMARY KEY (`retotal_session_id`),
  KEY `ac_session_id` (`ac_session_id`),
  CONSTRAINT `retotal_sessions_ibfk_1` FOREIGN KEY (`ac_session_id`) REFERENCES `ems`.`academic_sessions` (`ac_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retotal_sessions`
--

LOCK TABLES `retotal_sessions` WRITE;
/*!40000 ALTER TABLE `retotal_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `retotal_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retotal_subjects`
--

DROP TABLE IF EXISTS `retotal_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retotal_subjects` (
  `retotal_roll_id` int(10) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `done_flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`retotal_roll_id`,`sub_id`),
  KEY `sub_id` (`sub_id`),
  KEY `retotal_roll_id` (`retotal_roll_id`),
  CONSTRAINT `retotal_subjects_ibfk_1` FOREIGN KEY (`retotal_roll_id`) REFERENCES `retotal_roll_list` (`retotal_roll_id`),
  CONSTRAINT `retotal_subjects_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `ems`.`sub_distribution` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retotal_subjects`
--

LOCK TABLES `retotal_subjects` WRITE;
/*!40000 ALTER TABLE `retotal_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `retotal_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_retotal`
--

DROP TABLE IF EXISTS `score_retotal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_retotal` (
  `retotal_roll_id` int(10) NOT NULL,
  `component_id` int(2) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `marks` decimal(7,4) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `check_id` int(11) DEFAULT NULL,
  `status_flag` int(1) NOT NULL COMMENT '0: decrement; 1:no change; 2: incremented',
  PRIMARY KEY (`retotal_roll_id`,`component_id`,`sub_id`),
  KEY `sub_id` (`sub_id`),
  KEY `component_id` (`component_id`),
  KEY `check_id` (`check_id`),
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `score_retotal_ibfk_1` FOREIGN KEY (`retotal_roll_id`) REFERENCES `retotal_roll_list` (`retotal_roll_id`),
  CONSTRAINT `score_retotal_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `ems`.`sub_distribution` (`sub_id`),
  CONSTRAINT `score_retotal_ibfk_3` FOREIGN KEY (`component_id`) REFERENCES `ems`.`component_distribution` (`component_id`),
  CONSTRAINT `score_retotal_ibfk_4` FOREIGN KEY (`check_id`) REFERENCES `ems`.`checking` (`check_id`),
  CONSTRAINT `score_retotal_ibfk_5` FOREIGN KEY (`transaction_id`) REFERENCES `ems`.`transactions` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_retotal`
--

LOCK TABLES `score_retotal` WRITE;
/*!40000 ALTER TABLE `score_retotal` DISABLE KEYS */;
/*!40000 ALTER TABLE `score_retotal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tr_retotal`
--

DROP TABLE IF EXISTS `tr_retotal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tr_retotal` (
  `retotal_roll_id` int(10) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `cat_cap` decimal(7,4) DEFAULT NULL,
  `ia` decimal(7,4) DEFAULT NULL,
  `end_sem` decimal(7,4) DEFAULT NULL,
  `ie` decimal(7,4) DEFAULT NULL,
  `total` decimal(7,4) NOT NULL,
  `percent` decimal(7,4) NOT NULL,
  `grade` char(2) NOT NULL,
  `gp` int(2) NOT NULL,
  `cr` int(2) NOT NULL,
  `gpv` decimal(7,4) NOT NULL,
  `status_flag` int(1) NOT NULL COMMENT '[0]: Score decremented,[1]:Score unchanged, [2]:Score incremented',
  PRIMARY KEY (`retotal_roll_id`,`sub_id`),
  KEY `sub_id` (`sub_id`),
  CONSTRAINT `tr_retotal_ibfk_1` FOREIGN KEY (`retotal_roll_id`) REFERENCES `retotal_roll_list` (`retotal_roll_id`),
  CONSTRAINT `tr_retotal_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `score_retotal` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tr_retotal`
--

LOCK TABLES `tr_retotal` WRITE;
/*!40000 ALTER TABLE `tr_retotal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tr_retotal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ems_reval`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ems_reval` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ems_reval`;

--
-- Table structure for table `reval_exam_summary`
--

DROP TABLE IF EXISTS `reval_exam_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reval_exam_summary` (
  `reval_roll_id` int(10) NOT NULL,
  `total_cr_earned` int(10) NOT NULL,
  `total_gpv_earned` int(10) NOT NULL,
  `sgpa` decimal(7,4) NOT NULL,
  PRIMARY KEY (`reval_roll_id`),
  KEY `reval_roll_id` (`reval_roll_id`),
  CONSTRAINT `reval_exam_summary_ibfk_1` FOREIGN KEY (`reval_roll_id`) REFERENCES `reval_roll_list` (`reval_roll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reval_exam_summary`
--

LOCK TABLES `reval_exam_summary` WRITE;
/*!40000 ALTER TABLE `reval_exam_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `reval_exam_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reval_failure_report`
--

DROP TABLE IF EXISTS `reval_failure_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reval_failure_report` (
  `reval_roll_id` int(10) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `component_id` int(2) NOT NULL,
  PRIMARY KEY (`reval_roll_id`,`sub_id`,`component_id`),
  KEY `reval_roll_id` (`reval_roll_id`,`component_id`,`sub_id`),
  CONSTRAINT `reval_failure_report_ibfk_1` FOREIGN KEY (`reval_roll_id`, `component_id`, `sub_id`) REFERENCES `score_reval_1_2` (`reval_roll_id`, `component_id`, `sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reval_failure_report`
--

LOCK TABLES `reval_failure_report` WRITE;
/*!40000 ALTER TABLE `reval_failure_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `reval_failure_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reval_roll_list`
--

DROP TABLE IF EXISTS `reval_roll_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reval_roll_list` (
  `reval_roll_id` int(10) NOT NULL AUTO_INCREMENT,
  `roll_id` int(10) NOT NULL,
  `reval_session_id` int(10) NOT NULL,
  `serial_no` int(10) NOT NULL,
  `no_prints` int(3) NOT NULL,
  PRIMARY KEY (`reval_roll_id`),
  KEY `reval_session_id` (`reval_session_id`),
  KEY `roll_id` (`roll_id`),
  CONSTRAINT `reval_roll_list_ibfk_1` FOREIGN KEY (`reval_session_id`) REFERENCES `reval_sessions` (`reval_session_id`),
  CONSTRAINT `reval_roll_list_ibfk_2` FOREIGN KEY (`roll_id`) REFERENCES `ems`.`roll_list` (`roll_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reval_roll_list`
--

LOCK TABLES `reval_roll_list` WRITE;
/*!40000 ALTER TABLE `reval_roll_list` DISABLE KEYS */;
INSERT INTO `reval_roll_list` VALUES (1,1,1,1,0);
/*!40000 ALTER TABLE `reval_roll_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reval_sessions`
--

DROP TABLE IF EXISTS `reval_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reval_sessions` (
  `reval_session_id` int(5) NOT NULL AUTO_INCREMENT,
  `ac_session_id` int(5) NOT NULL,
  PRIMARY KEY (`reval_session_id`),
  KEY `ac_session_id` (`ac_session_id`),
  CONSTRAINT `reval_sessions_ibfk_1` FOREIGN KEY (`ac_session_id`) REFERENCES `ems`.`academic_sessions` (`ac_session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reval_sessions`
--

LOCK TABLES `reval_sessions` WRITE;
/*!40000 ALTER TABLE `reval_sessions` DISABLE KEYS */;
INSERT INTO `reval_sessions` VALUES (1,1);
/*!40000 ALTER TABLE `reval_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reval_subjects`
--

DROP TABLE IF EXISTS `reval_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reval_subjects` (
  `reval_roll_id` int(10) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `done_flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reval_roll_id`,`sub_id`),
  KEY `sub_id` (`sub_id`),
  CONSTRAINT `reval_subjects_ibfk_1` FOREIGN KEY (`reval_roll_id`) REFERENCES `reval_roll_list` (`reval_roll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reval_subjects`
--

LOCK TABLES `reval_subjects` WRITE;
/*!40000 ALTER TABLE `reval_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `reval_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_reval_1_2`
--

DROP TABLE IF EXISTS `score_reval_1_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_reval_1_2` (
  `reval_roll_id` int(10) NOT NULL,
  `component_id` int(2) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `original_marks` decimal(7,4) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `check_id` int(11) DEFAULT NULL,
  `status_flag` int(1) NOT NULL COMMENT '0: decrement; 1:no change; 2: incremented',
  `marks_1` decimal(7,4) DEFAULT NULL,
  `marks_2` decimal(7,4) DEFAULT NULL,
  `avearge` decimal(7,4) DEFAULT NULL,
  `third_reval_flag` int(1) NOT NULL DEFAULT '0',
  `third_reval_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`reval_roll_id`,`component_id`,`sub_id`),
  KEY `component_id` (`component_id`),
  KEY `sub_id` (`sub_id`),
  KEY `third_reval_id` (`third_reval_id`),
  KEY `check_id` (`check_id`),
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `score_reval_1_2_ibfk_2` FOREIGN KEY (`component_id`) REFERENCES `ems`.`component` (`component_id`),
  CONSTRAINT `score_reval_1_2_ibfk_3` FOREIGN KEY (`sub_id`) REFERENCES `ems`.`sub_distribution` (`sub_id`),
  CONSTRAINT `score_reval_1_2_ibfk_4` FOREIGN KEY (`third_reval_id`) REFERENCES `score_reval_3` (`third_reval_id`),
  CONSTRAINT `score_reval_1_2_ibfk_5` FOREIGN KEY (`check_id`) REFERENCES `ems`.`checking` (`check_id`),
  CONSTRAINT `score_reval_1_2_ibfk_6` FOREIGN KEY (`transaction_id`) REFERENCES `ems`.`transactions` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_reval_1_2`
--

LOCK TABLES `score_reval_1_2` WRITE;
/*!40000 ALTER TABLE `score_reval_1_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `score_reval_1_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_reval_3`
--

DROP TABLE IF EXISTS `score_reval_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_reval_3` (
  `third_reval_id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) NOT NULL,
  `check_id` int(10) NOT NULL,
  `marks` decimal(7,4) NOT NULL,
  PRIMARY KEY (`third_reval_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `check_id` (`check_id`),
  CONSTRAINT `score_reval_3_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `ems`.`transactions` (`transaction_id`),
  CONSTRAINT `score_reval_3_ibfk_2` FOREIGN KEY (`check_id`) REFERENCES `ems`.`checking` (`check_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_reval_3`
--

LOCK TABLES `score_reval_3` WRITE;
/*!40000 ALTER TABLE `score_reval_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `score_reval_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tr_reval`
--

DROP TABLE IF EXISTS `tr_reval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tr_reval` (
  `reval_roll_id` int(10) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `cat_cap` decimal(7,4) DEFAULT NULL,
  `ia` decimal(7,4) DEFAULT NULL,
  `end_sem` decimal(7,4) DEFAULT NULL,
  `ie` decimal(7,4) DEFAULT NULL,
  `total` decimal(7,4) NOT NULL,
  `percent` decimal(7,4) NOT NULL,
  `grade` char(2) NOT NULL,
  `gp` int(2) NOT NULL,
  `cr` int(2) NOT NULL,
  `gpv` decimal(7,4) NOT NULL,
  `status_flag` int(1) NOT NULL COMMENT '[0]: Score decremented,[1]:Score unchanged, [2]:Score incremented',
  PRIMARY KEY (`reval_roll_id`,`sub_id`),
  KEY `sub_id` (`sub_id`),
  CONSTRAINT `tr_reval_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `ems`.`sub_distribution` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tr_reval`
--

LOCK TABLES `tr_reval` WRITE;
/*!40000 ALTER TABLE `tr_reval` DISABLE KEYS */;
/*!40000 ALTER TABLE `tr_reval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ems_atkt`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ems_atkt` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ems_atkt`;

--
-- Table structure for table `atkt_exam_summary`
--

DROP TABLE IF EXISTS `atkt_exam_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atkt_exam_summary` (
  `atkt_roll_id` int(10) NOT NULL,
  `total_credits_earned` int(3) NOT NULL,
  `total_gpv_earned` int(3) NOT NULL,
  `sgpa` decimal(6,4) NOT NULL,
  PRIMARY KEY (`atkt_roll_id`),
  KEY `atkt_roll_id` (`atkt_roll_id`),
  CONSTRAINT `atkt_exam_summary_ibfk_1` FOREIGN KEY (`atkt_roll_id`) REFERENCES `atkt_roll_list` (`atkt_roll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atkt_exam_summary`
--

LOCK TABLES `atkt_exam_summary` WRITE;
/*!40000 ALTER TABLE `atkt_exam_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `atkt_exam_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atkt_failure_report`
--

DROP TABLE IF EXISTS `atkt_failure_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atkt_failure_report` (
  `atkt_roll_id` int(10) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `component_id` int(2) NOT NULL,
  PRIMARY KEY (`atkt_roll_id`,`sub_id`,`component_id`),
  KEY `component_id` (`component_id`),
  KEY `sub_id` (`sub_id`),
  KEY `atkt_roll_id` (`atkt_roll_id`,`component_id`,`sub_id`),
  CONSTRAINT `atkt_failure_report_ibfk_1` FOREIGN KEY (`atkt_roll_id`, `component_id`, `sub_id`) REFERENCES `score_atkt` (`atkt_roll_id`, `component_id`, `sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atkt_failure_report`
--

LOCK TABLES `atkt_failure_report` WRITE;
/*!40000 ALTER TABLE `atkt_failure_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `atkt_failure_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atkt_roll_list`
--

DROP TABLE IF EXISTS `atkt_roll_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atkt_roll_list` (
  `atkt_roll_id` int(10) NOT NULL AUTO_INCREMENT,
  `roll_id` int(10) NOT NULL,
  `atkt_session_id` int(10) NOT NULL,
  `serial_no` int(10) NOT NULL,
  `no_prints` int(3) NOT NULL,
  PRIMARY KEY (`atkt_roll_id`),
  KEY `atkt_session_id` (`atkt_session_id`),
  KEY `roll_id` (`roll_id`),
  KEY `atkt_roll_id` (`atkt_roll_id`),
  CONSTRAINT `atkt_roll_list_ibfk_1` FOREIGN KEY (`atkt_session_id`) REFERENCES `atkt_sessions` (`atkt_session_id`),
  CONSTRAINT `atkt_roll_list_ibfk_2` FOREIGN KEY (`roll_id`) REFERENCES `ems`.`roll_list` (`roll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atkt_roll_list`
--

LOCK TABLES `atkt_roll_list` WRITE;
/*!40000 ALTER TABLE `atkt_roll_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `atkt_roll_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atkt_sessions`
--

DROP TABLE IF EXISTS `atkt_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atkt_sessions` (
  `atkt_session_id` int(5) NOT NULL DEFAULT '0',
  `ac_session_id` int(5) NOT NULL,
  PRIMARY KEY (`atkt_session_id`),
  KEY `ac_session_id` (`ac_session_id`),
  CONSTRAINT `atkt_sessions_ibfk_1` FOREIGN KEY (`ac_session_id`) REFERENCES `ems`.`academic_sessions` (`ac_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atkt_sessions`
--

LOCK TABLES `atkt_sessions` WRITE;
/*!40000 ALTER TABLE `atkt_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `atkt_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atkt_subjects`
--

DROP TABLE IF EXISTS `atkt_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atkt_subjects` (
  `atkt_roll_id` int(10) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `done_flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`atkt_roll_id`,`sub_id`),
  KEY `sub_id` (`sub_id`),
  CONSTRAINT `atkt_subjects_ibfk_1` FOREIGN KEY (`atkt_roll_id`) REFERENCES `atkt_roll_list` (`atkt_roll_id`),
  CONSTRAINT `atkt_subjects_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `ems`.`sub_distribution` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atkt_subjects`
--

LOCK TABLES `atkt_subjects` WRITE;
/*!40000 ALTER TABLE `atkt_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `atkt_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_atkt`
--

DROP TABLE IF EXISTS `score_atkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_atkt` (
  `atkt_roll_id` int(10) NOT NULL,
  `component_id` int(2) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `marks` decimal(7,4) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `check_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`atkt_roll_id`,`component_id`,`sub_id`),
  KEY `check_id` (`check_id`),
  KEY `component_id` (`component_id`),
  KEY `sub_id` (`sub_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `atkt_roll_id` (`atkt_roll_id`),
  CONSTRAINT `score_atkt_ibfk_2` FOREIGN KEY (`check_id`) REFERENCES `ems`.`checking` (`check_id`),
  CONSTRAINT `score_atkt_ibfk_3` FOREIGN KEY (`component_id`) REFERENCES `ems`.`component` (`component_id`),
  CONSTRAINT `score_atkt_ibfk_4` FOREIGN KEY (`sub_id`) REFERENCES `ems`.`sub_distribution` (`sub_id`),
  CONSTRAINT `score_atkt_ibfk_5` FOREIGN KEY (`transaction_id`) REFERENCES `ems`.`transactions` (`transaction_id`),
  CONSTRAINT `score_atkt_ibfk_6` FOREIGN KEY (`atkt_roll_id`) REFERENCES `atkt_roll_list` (`atkt_roll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_atkt`
--

LOCK TABLES `score_atkt` WRITE;
/*!40000 ALTER TABLE `score_atkt` DISABLE KEYS */;
/*!40000 ALTER TABLE `score_atkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tr_atkt`
--

DROP TABLE IF EXISTS `tr_atkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tr_atkt` (
  `atkt_roll_id` int(10) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `cat_cap` decimal(7,4) DEFAULT NULL,
  `ia` decimal(7,4) DEFAULT NULL,
  `end_sem` decimal(7,4) DEFAULT NULL,
  `ie` decimal(7,4) DEFAULT NULL,
  `total` decimal(7,4) NOT NULL,
  `percent` decimal(7,4) NOT NULL,
  `grade` char(2) NOT NULL,
  `gp` int(2) NOT NULL,
  `cr` int(2) NOT NULL,
  `gpv` decimal(7,4) NOT NULL,
  PRIMARY KEY (`atkt_roll_id`,`sub_id`),
  KEY `sub_id` (`sub_id`),
  KEY `atkt_roll_id` (`atkt_roll_id`),
  CONSTRAINT `tr_atkt_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `ems`.`sub_distribution` (`sub_id`),
  CONSTRAINT `tr_atkt_ibfk_3` FOREIGN KEY (`atkt_roll_id`) REFERENCES `atkt_roll_list` (`atkt_roll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tr_atkt`
--

LOCK TABLES `tr_atkt` WRITE;
/*!40000 ALTER TABLE `tr_atkt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tr_atkt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-23 16:34:41
