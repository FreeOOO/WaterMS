-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: data
-- ------------------------------------------------------
-- Server version	5.5.49-0+deb8u1

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
-- Table structure for table ` orderdetail`
--

DROP TABLE IF EXISTS ` orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ` orderdetail` (
  `od_id` int(10) DEFAULT NULL,
  `orders_id` int(10) DEFAULT NULL,
  `equipment_id` int(10) DEFAULT NULL,
  `material_id` int(10) DEFAULT NULL,
  `items_num` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table ` orderdetail`
--

LOCK TABLES ` orderdetail` WRITE;
/*!40000 ALTER TABLE ` orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE ` orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowcertificate`
--

DROP TABLE IF EXISTS `borrowcertificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowcertificate` (
  `borrowingID` bigint(20) NOT NULL COMMENT '借还编号',
  `cerid` bigint(20) NOT NULL,
  `name` varchar(16) NOT NULL COMMENT '证件姓名',
  `certificateType` varchar(20) DEFAULT NULL COMMENT '证书类别',
  `subjecttoborrow` varchar(200) NOT NULL COMMENT '借用事由',
  `tenderTime` date DEFAULT NULL COMMENT '投标时间',
  `borrowingDate` date DEFAULT NULL COMMENT '借用日期',
  `datereturn` date DEFAULT NULL COMMENT '应还日期',
  `borrower` varchar(16) DEFAULT NULL COMMENT '借用人',
  `incomewitness` varchar(16) DEFAULT NULL COMMENT '收证人',
  `closingdatecard` date DEFAULT NULL COMMENT '收证日期',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `whetherrestitution` char(2) NOT NULL DEFAULT '否' COMMENT '是否归还',
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`borrowingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowcertificate`
--

LOCK TABLES `borrowcertificate` WRITE;
/*!40000 ALTER TABLE `borrowcertificate` DISABLE KEYS */;
INSERT INTO `borrowcertificate` VALUES (125,125,'乐彦博','二级建筑证','项目投标','2016-06-06','2016-06-03','2016-07-05','张龙','','2016-06-04','a','是',10002),(126,128,'章明旭','一级建筑证','项目投标','2016-06-09','2016-06-03','2016-06-17','李宏','','2016-06-04','','是',10005),(165,129,'潘俊哲','一级建筑证','项目投标','2016-06-22','2016-06-04','2016-06-17','张兰','李哄',NULL,'无','否',10006),(185,124,'魏嘉志','一级建筑证','项目投标','2016-06-15','2016-06-04','2016-06-15','张龙','',NULL,'','否',10001);
/*!40000 ALTER TABLE `borrowcertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowlaborcontract`
--

DROP TABLE IF EXISTS `borrowlaborcontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowlaborcontract` (
  `borrowingID` bigint(20) NOT NULL COMMENT '借还编号',
  `userid` bigint(20) NOT NULL COMMENT '合同的员工ID',
  `name` varchar(16) NOT NULL COMMENT '合同姓名',
  `subjecttoborrow` varchar(100) DEFAULT NULL COMMENT '借用事由',
  `borrowingDate` date DEFAULT NULL COMMENT '借用日期',
  `datereturn` date DEFAULT NULL COMMENT '应还日期',
  `borrower` varchar(16) DEFAULT NULL COMMENT '借用人',
  `handpaintedPeople` varchar(16) DEFAULT NULL COMMENT '收回人',
  `dateofrecovery` date DEFAULT NULL COMMENT '收回日期',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `whetherrestitution` char(2) NOT NULL DEFAULT '否' COMMENT '是否归还',
  PRIMARY KEY (`borrowingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowlaborcontract`
--

LOCK TABLES `borrowlaborcontract` WRITE;
/*!40000 ALTER TABLE `borrowlaborcontract` DISABLE KEYS */;
INSERT INTO `borrowlaborcontract` VALUES (163,10001,'魏嘉志','项目投标','2016-06-04','2016-06-16','李宏','张兰','2016-06-04','无','是'),(166,10002,'乐彦博','项目投标','2016-06-04','2016-06-16','张龙','张兰','2016-06-04','无','是');
/*!40000 ALTER TABLE `borrowlaborcontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate`
--

DROP TABLE IF EXISTS `certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate` (
  `cerid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL COMMENT '员工ID',
  `certificateType` varchar(20) DEFAULT NULL COMMENT '证书类别',
  `certificatename` varchar(20) NOT NULL COMMENT '证书名称',
  `name` varchar(16) NOT NULL COMMENT '姓名',
  `sex` char(2) NOT NULL COMMENT '性别',
  `birth` date NOT NULL COMMENT '出生日期',
  `idnumber` char(18) NOT NULL COMMENT '身份证号',
  `hirecompanies` varchar(30) DEFAULT NULL COMMENT '聘用企业',
  `job` varchar(16) DEFAULT NULL COMMENT '专业类别（职务）',
  `technicaltitles` varchar(16) DEFAULT NULL COMMENT '技术职称',
  `certificateNumber` varchar(50) DEFAULT NULL COMMENT '资格证书编号',
  `registrationNumber` varchar(50) DEFAULT NULL COMMENT '注册编号',
  `certificateNo` varchar(50) DEFAULT NULL COMMENT '证书编号',
  `issuingauthority` varchar(50) DEFAULT NULL COMMENT '发证机关',
  `dateofissue` date NOT NULL COMMENT '发证日期',
  `validitydeadline` date DEFAULT NULL COMMENT '有效期截止日期',
  `approvalNumber` varchar(50) DEFAULT NULL COMMENT '批准文号',
  `additionalitemsregistrationrecord` varchar(50) DEFAULT NULL COMMENT '增项注册记录',
  `accessorymaterial` varchar(50) DEFAULT NULL COMMENT '附件材料',
  `whetherrestitution` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`cerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate`
--

LOCK TABLES `certificate` WRITE;
/*!40000 ALTER TABLE `certificate` DISABLE KEYS */;
INSERT INTO `certificate` VALUES (124,10001,'一级建筑证','一级建筑证书','魏嘉志','男','1977-09-19','440901197709194316','淮阴水利','建筑','','S0280208040048','苏111050700001','苏H012012135262','江苏省建设厅','2012-02-06','2016-10-27','','','1465017155999.doc','是'),(125,10002,'二级建筑证','一级建筑证书','乐彦博','男','1975-02-19','440901197502198379','淮阴水利','建筑','','S0280208040048','苏111050701016','苏H012012133462','江苏省建设厅','2012-02-06','2016-08-16','','','1465017170796.pdf',NULL),(126,10003,'二级水利证','一级建筑证书','殷伟诚','男','1975-02-10','440901197502108337','淮阴水利','建筑','','S0280208040048','苏111050700216','苏H012014263462','江苏省建设厅','2012-02-06','2016-09-06','','','1464921432055.doc',NULL),(127,10004,'二级水利证','一级水利证书','魏高俊','男','1978-02-12','440901197802126991','淮阴水利','水利','','S0280208040048','苏111050702616','苏H012012326562','江苏省建设厅','2012-02-06','2017-09-21','','','1464921223555.doc',NULL),(128,10005,'一级建筑证','一级建筑证书','章明旭','男','1977-09-16','440901197709165291','淮阴水利','建筑','','S0280208040048','苏111050700341','苏H012012135262','江苏省建设厅','2012-02-06','2016-07-12','','','1464920938055.doc','否'),(129,10006,'一级建筑证','一级建筑证书','潘俊哲','男','1983-01-21','440901198301219959','淮阴水利','建筑','','S0280208040048','苏111050700341','苏H012012135262','江苏省建设厅','2012-02-06','2016-09-13','','','1464920938055.doc','是'),(130,10007,'二级建筑证','一级建筑证书','柳德厚','男','1970-02-16','440901197002166952','淮阴水利','建筑','','S0280208040048','苏111050701016','苏H012012133462','江苏省建设厅','2012-02-06','2017-07-04','','','1464921232055.doc',NULL),(131,10008,'二级水利证','一级建筑证书','史明旭','男','1989-03-12','440901198903127998','淮阴水利','建筑','','S0280208040048','苏111050700216','苏H012014263462','江苏省建设厅','2012-02-06','2017-02-21','','','1464921432055.doc',NULL),(132,10009,'二级水利证','一级水利证书','吕宣朗','男','1984-03-25','44090119840325427X','淮阴水利','水利','','S0280208040048','苏111050702616','苏H012012326562','江苏省建设厅','2012-02-06','2016-09-21','asddas','',NULL,NULL);
/*!40000 ALTER TABLE `certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `userid` bigint(20) NOT NULL COMMENT '员工ID',
  `idnumber` char(18) NOT NULL COMMENT '身份证号',
  `name` varchar(16) NOT NULL COMMENT '姓名',
  `jobtitle` char(4) NOT NULL COMMENT '职称',
  `evaluationtime` date DEFAULT NULL COMMENT '评定时间',
  `sex` char(2) DEFAULT NULL COMMENT '性别',
  `post` varchar(30) DEFAULT NULL COMMENT '职务',
  `job` varchar(30) DEFAULT NULL COMMENT '岗位',
  `firstdegree` varchar(30) DEFAULT NULL COMMENT '第一学历',
  `graduatedschool` varchar(30) DEFAULT NULL COMMENT '毕业学校',
  `highesteducation` varchar(30) DEFAULT NULL COMMENT '最高学历',
  `highestEducationSchools` varchar(30) DEFAULT NULL COMMENT '最高学历毕业学校',
  `bachelorofScience` varchar(30) DEFAULT NULL COMMENT '学位',
  `dateofbirth` date NOT NULL COMMENT '出生日期',
  `workDate` date DEFAULT NULL COMMENT '参加工作日期',
  `datecompany` date DEFAULT NULL COMMENT '到公司日期',
  `dateofseparation` date DEFAULT NULL COMMENT '离职日期',
  `reasonforleaving` varchar(300) DEFAULT NULL COMMENT '离职原因',
  `birthplace` varchar(100) DEFAULT NULL COMMENT '籍贯',
  `politicalstatus` varchar(10) DEFAULT NULL COMMENT '政治面貌',
  `officePhone` varchar(15) DEFAULT NULL COMMENT '办公电话',
  `homephone` varchar(15) DEFAULT NULL COMMENT '家庭电话',
  `homeaddress` varchar(100) DEFAULT NULL COMMENT '家庭住址',
  `phone` char(11) DEFAULT NULL COMMENT '手机',
  `email` varchar(50) DEFAULT NULL COMMENT 'Email',
  `photo` varchar(50) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (10001,'440901197709194316','魏嘉志','中级','2013-05-02','男','副总监','公司员工','大学专科','扬州大学','大学专科','扬州大学','无','1977-09-19','2009-06-02','2012-04-10',NULL,'无','淮安','群众','0517-86359216','0517-86359216','淮安','18364236230','sakhjsld@163.com','1465017122605.jpg'),(10002,'440901197502198379','乐彦博','中级','2012-02-28','男','施工员','公司员工','初中','','初中','无','无','1975-02-19','2009-08-13','2012-04-10',NULL,'无','淮安','群众','0517-86359216','0517-86359216','淮安','18364269310','xcakjhafk@163.com','1465017130273.jpg'),(10003,'440901197502108337','殷伟诚','副高','2011-07-19','男','总监','材料部长','大学本科','扬州大学','大学本科','扬州大学','学士','1975-02-10','2012-06-05','2012-06-05',NULL,'无','淮安','群众','0517-86334261','0517-86334261','淮安','13643262320','dasdklaj@126.com','1464919546964.jpg'),(10004,'440901197802126991','魏高俊','中级','2014-06-10','男','施工员','公司员工','高中/职中/中专','','高中/职中/中专','无','无','1978-02-12','2012-10-09','2012-10-09',NULL,'无','淮安','群众','0517-86332642','0517-86332642','淮安','18936231520','sadkjafhf@126.com','1464919671146.jpg'),(10005,'440901197709165291','章明旭','中级','2012-08-14','男','副总监','工程部长','大学专科','','大学专科','','无','1977-09-16','2009-02-09','2009-02-09',NULL,'无','淮安','群众','0517-86354526','0517-86354526','淮安','18932062315','asfdazzxc@sina.com','1464920074346.jpg'),(10006,'440901198301219959','潘俊哲','中级','2011-03-23','男','施工员','安全部长','初中','','初中','','无','1983-01-21','2012-06-05','2012-04-10',NULL,'无','淮安','群众','','','淮安','18364236392','321465465@qq.com','1464920160719.jpg'),(10007,'440901197002166952','柳德厚','中级','2013-05-02','男','副总监','公司员工','大学专科','扬州大学','大学专科','扬州大学','无','1970-02-16','2009-06-02','2012-04-10',NULL,'无','淮安','群众','0517-86359216','0517-86359216','淮安','18364236230','sakhjsld@163.com','1464928711059.jpg'),(10008,'440901198903127998','史明旭','中级','2012-02-28','男','施工员','公司员工','初中','','初中','无','无','1989-03-12','2009-08-13','2012-04-10',NULL,'无','淮安','群众','0517-86359216','0517-86359216','淮安','18364269310','xcakjhafk@163.com','1464919407494.jpg'),(10009,'44090119840325427X','吕宣朗','副高','2011-07-19','男','总监','材料部长','大学本科','扬州大学','大学本科','扬州大学','学士','1984-03-25','2012-06-05','2012-06-05',NULL,'无','淮安','群众','0517-86334261','0517-86334261','淮安','13643262320','dasdklaj@126.com','1464919546964.jpg'),(10010,'440901199008205552','彭伟博','中级','2014-06-10','男','施工员','公司员工','高中/职中/中专','','高中/职中/中专','无','无','1990-08-20','2012-10-09','2012-10-09',NULL,'无','淮安','群众','0517-86332642','0517-86332642','淮安','18936231520','sadkjafhf@126.com','1464919671146.jpg'),(10011,'440901197401257050','袁宣朗','中级','2012-08-14','男','副总监','工程部长','大学专科','','大学专科','','无','1974-01-25','2009-02-09','2009-02-09',NULL,'无','淮安','群众','0517-86354526','0517-86354526','淮安','18932062315','asfdazzxc@sina.com','1464920074346.jpg'),(10012,'440901198006254612','酆建功','中级','2012-02-28','男','施工员','安全部长','初中','','初中','','无','1980-06-25','2009-08-23','2012-04-10',NULL,'无','淮安','群众','','','淮安','18364236393','321465465@qq.com','1464920160719.jpg'),(10013,'440901197209192090','范熙泰','中级','2013-05-02','男','副总监','公司员工','大学专科','扬州大学','大学专科','扬州大学','无','1972-09-19','2009-06-02','2012-04-10',NULL,'无','淮安','群众','0517-86359216','0517-86359216','淮安','18364236230','sakhjsld@163.com','1464918353941.jpg'),(10014,'44090119830816433X','郝熙华','中级','2012-02-28','男','施工员','公司员工','初中','','初中','无','无','1983-08-16','2009-08-13','2012-04-10',NULL,'无','淮安','群众','0517-86359216','0517-86359216','淮安','18364269310','xcakjhafk@163.com','1464919407494.jpg'),(10015,'440901198904114494','任凯泽','副高','2011-07-19','男','总监','材料部长','大学本科','扬州大学','大学本科','扬州大学','学士','1989-04-11','2012-06-05','2012-06-05',NULL,'无','淮安','群众','0517-86334261','0517-86334261','淮安','13643262320','dasdklaj@126.com','1464919546964.jpg'),(10016,'440901197804174911','许心怡','中级','2014-06-10','男','施工员','公司员工','高中/职中/中专','','高中/职中/中专','无','无','1978-04-17','2012-10-09','2012-10-09',NULL,'无','淮安','群众','0517-86332642','0517-86332642','淮安','18936231520','sadkjafhf@126.com','1464919671146.jpg');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (186),(186),(10019),(10019);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laborcontract`
--

DROP TABLE IF EXISTS `laborcontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laborcontract` (
  `userid` bigint(20) NOT NULL COMMENT '员工ID',
  `name` varchar(16) DEFAULT NULL COMMENT '姓名',
  `IDnumber` char(18) NOT NULL COMMENT '身份证号',
  `ContractNo` varchar(50) NOT NULL COMMENT '合同编号',
  `contracttype` varchar(50) DEFAULT NULL COMMENT '合同类型',
  `StartDate` date DEFAULT NULL COMMENT '起始日期',
  `deadline` date NOT NULL COMMENT '截止日期',
  `Dateofsigning` date DEFAULT NULL COMMENT '签订日期',
  `Signedobjects` varchar(16) NOT NULL COMMENT '签订对象',
  `sgnedobjects` varchar(16) DEFAULT NULL,
  `whetherrestitution` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laborcontract`
--

LOCK TABLES `laborcontract` WRITE;
/*!40000 ALTER TABLE `laborcontract` DISABLE KEYS */;
INSERT INTO `laborcontract` VALUES (10001,'魏嘉志','440901197709194316','2010001100003','劳动合同','2014-06-10','2016-07-20','2014-06-10','魏嘉志',NULL,'否'),(10002,'乐彦博','440901197502198379','2010001348292','劳动合同','2014-06-10','2017-06-07','2014-06-10','乐彦博',NULL,'否');
/*!40000 ALTER TABLE `laborcontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialsecurity`
--

DROP TABLE IF EXISTS `socialsecurity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialsecurity` (
  `socialSecurityNo` bigint(20) NOT NULL,
  `time` date NOT NULL,
  `userid` bigint(20) NOT NULL COMMENT '员工ID',
  `PersonalNumber` varchar(50) NOT NULL COMMENT '个人编号',
  `name` varchar(16) NOT NULL COMMENT '姓名',
  `Medicarebase` int(11) DEFAULT NULL COMMENT '医保基数',
  `Pensionbase` int(11) DEFAULT NULL COMMENT '养老基数',
  `Individualhealthinsurance` double DEFAULT NULL COMMENT '个人医疗保险',
  `PersonalUnemploymentInsurance` double DEFAULT NULL COMMENT '个人失业保险',
  `Privatepensioninsurance` double DEFAULT NULL COMMENT '个人养老保险',
  `MedicalInsuranceUnit` double DEFAULT NULL COMMENT '单位医疗保险',
  `UnemploymentInsuranceUnit` double DEFAULT NULL COMMENT '单位失业保险',
  `Endowmentinsurance` double DEFAULT NULL COMMENT '单位养老保险',
  `Unitillnessinsurance` double DEFAULT NULL COMMENT '单位医保大病',
  `Unitmaternityinsurance` double DEFAULT NULL COMMENT '单位生育保险',
  `Injuryinsuranceunit` double DEFAULT NULL COMMENT '单位工伤保险',
  PRIMARY KEY (`socialSecurityNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialsecurity`
--

LOCK TABLES `socialsecurity` WRITE;
/*!40000 ALTER TABLE `socialsecurity` DISABLE KEYS */;
INSERT INTO `socialsecurity` VALUES (145,'2016-06-03',10001,'','魏嘉志',1973,1140,54,27,216,243,54,540,0,21.6,13.5),(146,'2016-06-03',10002,'','乐彦博',1973,1140,50,25,200,225,50,500,0,20,12.5),(147,'2016-06-03',10003,'','殷伟诚',1973,1140,56,28,224,252,56,560,0,22.400000000000002,14),(148,'2016-06-03',10004,'','魏高俊',1973,1140,50,25,200,225,50,500,0,20,12.5),(149,'2016-06-03',10005,'','章明旭',1973,1140,52,26,208,234,52,520,0,20.8,13),(150,'2016-06-03',10006,'','潘俊哲',1973,1140,56,28,224,252,56,560,0,22.400000000000002,14),(151,'2016-06-03',10007,'','柳德厚',1973,1140,50,25,200,225,50,500,0,20,12.5),(152,'2016-06-03',10008,'','史明旭',1973,1140,50,25,200,225,50,500,0,20,12.5),(153,'2016-06-03',10009,'','吕宣朗',1973,1140,50,25,200,225,50,500,0,20,12.5),(154,'2016-06-03',10010,'','彭伟博',1973,1140,54,27,216,243,54,540,0,21.6,13.5),(155,'2016-06-03',10011,'','袁宣朗',1973,1140,50,25,200,225,50,500,0,20,12.5),(156,'2016-06-03',10012,'','酆建功',1973,1140,50,25,200,225,50,500,0,20,12.5),(157,'2016-06-03',10013,'','范熙泰',1973,1140,52,26,208,234,52,520,0,20.8,13),(158,'2016-06-03',10014,'','郝熙华',1973,1140,50,25,200,225,50,500,0,20,12.5),(159,'2016-06-03',10015,'','任凯泽',1973,1140,50,25,200,225,50,500,0,20,12.5),(160,'2016-06-03',10016,'','许心怡',1973,1140,50,25,200,225,50,500,0,20,12.5),(161,'2016-06-03',10017,'','俞德馨',1973,1140,50,25,200,225,50,500,0,20,12.5),(162,'2016-06-03',10018,'','赵芳',1973,1140,50,25,200,225,50,500,0,20,12.5);
/*!40000 ALTER TABLE `socialsecurity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `userid` bigint(20) NOT NULL COMMENT '员工ID',
  `phone` char(11) NOT NULL COMMENT '用户名（手机号）',
  `password` char(32) NOT NULL COMMENT '密码',
  `salt` char(10) NOT NULL COMMENT 'salt',
  `email` char(50) DEFAULT NULL COMMENT '注册邮箱',
  `competence` char(10) NOT NULL COMMENT '权限',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (10000,'admin','1235','111',NULL,'人事部长');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wage`
--

DROP TABLE IF EXISTS `wage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wage` (
  `nowage` bigint(20) NOT NULL COMMENT '工资编号',
  `userid` bigint(20) NOT NULL COMMENT '员工ID',
  `name` varchar(16) NOT NULL COMMENT '姓名',
  `payrollTime` date NOT NULL COMMENT '工资发放时间',
  `basicwage` double DEFAULT NULL COMMENT '基本工资',
  `senioritywage` double DEFAULT NULL COMMENT '工龄工资',
  `skillwage` double DEFAULT NULL COMMENT '技能工',
  `postsalary` double DEFAULT NULL COMMENT '岗位工资',
  `performancepay` double DEFAULT NULL COMMENT '绩效工资',
  `allowance` double DEFAULT NULL COMMENT '津贴',
  `other` double DEFAULT NULL COMMENT '其他',
  `totalsent` double DEFAULT NULL COMMENT '应发合计',
  `medicalinsurance` double DEFAULT NULL COMMENT '医疗保险',
  `unemploymentinsurance` double DEFAULT NULL COMMENT '失业保险',
  `pension` double DEFAULT NULL COMMENT '养老保险',
  `housingfund` double DEFAULT NULL COMMENT '住房公积金',
  `incometax` double DEFAULT NULL COMMENT '所得税金',
  `otherdeductions` double DEFAULT NULL COMMENT '其它扣款',
  `totalcharge` double DEFAULT NULL COMMENT '扣款合计',
  `realwages` double DEFAULT NULL COMMENT '实发工资',
  PRIMARY KEY (`nowage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wage`
--

LOCK TABLES `wage` WRITE;
/*!40000 ALTER TABLE `wage` DISABLE KEYS */;
INSERT INTO `wage` VALUES (127,10001,'魏嘉志','2016-04-30',2500,0,0,0,100,100,0,2700,54,27,216,270,108.30000000000001,0,675.3,2024.7),(128,10002,'乐彦博','2016-04-30',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(129,10003,'殷伟诚','2016-04-30',2500,0,0,0,200,0,100,2800,56,28,224,280,116.20000000000002,0,704.2,2095.8),(130,10004,'魏高俊','2016-04-30',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(131,10005,'章明旭','2016-04-30',2500,100,0,0,0,0,0,2600,52,26,208,260,100.4,50,646.4,1953.6),(132,10006,'潘俊哲','2016-04-30',2500,0,0,0,200,0,100,2800,56,28,224,280,116.20000000000002,0,704.2,2095.8),(133,10007,'柳德厚','2016-04-30',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(134,10008,'史明旭','2016-04-30',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(135,10009,'吕宣朗','2016-04-30',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(136,10010,'彭伟博','2016-04-30',2500,0,0,0,0,0,200,2700,54,27,216,270,108.30000000000001,50,675.3,2024.7),(137,10011,'袁宣朗','2016-04-30',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(138,10012,'酆建功','2016-04-30',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(139,10013,'范熙泰','2016-04-30',2500,0,100,0,0,0,0,2600,52,26,208,260,100.4,0,646.4,1953.6),(140,10014,'郝熙华','2016-04-30',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(141,10015,'任凯泽','2016-04-30',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(142,10016,'许心怡','2016-04-30',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(143,10017,'俞德馨','2016-04-30',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(144,10018,'赵芳','2016-04-30',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(167,10001,'魏嘉志','2016-05-31',2500,0,0,0,100,100,0,2700,54,27,216,270,108.30000000000001,0,675.3,2024.7),(168,10002,'乐彦博','2016-05-31',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(169,10003,'殷伟诚','2016-05-31',2500,0,0,0,200,0,100,2800,56,28,224,280,116.20000000000002,0,704.2,2095.8),(170,10004,'魏高俊','2016-05-31',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(171,10005,'章明旭','2016-05-31',2500,100,0,0,0,0,0,2600,52,26,208,260,100.4,50,646.4,1953.6),(172,10006,'潘俊哲','2016-05-31',2500,0,0,0,200,0,100,2800,56,28,224,280,116.20000000000002,0,704.2,2095.8),(173,10007,'柳德厚','2016-05-31',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(174,10008,'史明旭','2016-05-31',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(175,10009,'吕宣朗','2016-05-31',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(176,10010,'彭伟博','2016-05-31',2500,0,0,0,0,0,200,2700,54,27,216,270,108.30000000000001,50,675.3,2024.7),(177,10011,'袁宣朗','2016-05-31',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(178,10012,'酆建功','2016-05-31',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(179,10013,'范熙泰','2016-05-31',2500,0,100,0,0,0,0,2600,52,26,208,260,100.4,0,646.4,1953.6),(180,10014,'郝熙华','2016-05-31',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(181,10015,'任凯泽','2016-05-31',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(182,10016,'许心怡','2016-05-31',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(183,10017,'俞德馨','2016-05-31',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5),(184,10018,'赵芳','2016-05-31',2500,0,0,0,0,0,0,2500,50,25,200,250,92.5,0,617.5,1882.5);
/*!40000 ALTER TABLE `wage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagestandard`
--

DROP TABLE IF EXISTS `wagestandard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagestandard` (
  `userid` bigint(20) NOT NULL COMMENT '员工ID',
  `name` varchar(16) NOT NULL COMMENT '姓名',
  `basicwage` int(11) NOT NULL COMMENT '基本工资',
  `senioritywage` int(11) NOT NULL DEFAULT '0' COMMENT '工龄工资',
  `skillwage` int(11) NOT NULL DEFAULT '0' COMMENT '技能工资',
  `performancepay` int(11) NOT NULL DEFAULT '0' COMMENT '绩效工资',
  `allowance` int(11) NOT NULL DEFAULT '0' COMMENT '津贴',
  `other` int(11) NOT NULL DEFAULT '0' COMMENT '其他奖励',
  `otherdeductions` int(11) NOT NULL DEFAULT '0' COMMENT '其它扣款'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagestandard`
--

LOCK TABLES `wagestandard` WRITE;
/*!40000 ALTER TABLE `wagestandard` DISABLE KEYS */;
INSERT INTO `wagestandard` VALUES (10001,'魏嘉志',2500,0,0,100,100,0,0),(10002,'乐彦博',2500,0,0,0,0,0,0),(10003,'殷伟诚',2500,0,0,200,0,100,0),(10004,'魏高俊',2500,0,0,0,0,0,0),(10005,'章明旭',2500,100,0,0,0,0,50),(10006,'潘俊哲',2500,0,0,200,0,100,0),(10007,'柳德厚',2500,0,0,0,0,0,0),(10008,'史明旭',2500,0,0,0,0,0,0),(10009,'吕宣朗',2500,0,0,0,0,0,0),(10010,'彭伟博',2500,0,0,0,0,200,50),(10011,'袁宣朗',2500,0,0,0,0,0,0),(10012,'酆建功',2500,0,0,0,0,0,0),(10013,'范熙泰',2500,0,100,0,0,0,0),(10014,'郝熙华',2500,0,0,0,0,0,0),(10015,'任凯泽',2500,0,0,0,0,0,0),(10016,'许心怡',2500,0,0,0,0,0,0),(10017,'俞德馨',2500,0,0,0,0,0,0),(10018,'赵芳',2500,0,0,0,0,0,0);
/*!40000 ALTER TABLE `wagestandard` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-08 17:10:01
