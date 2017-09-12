-- MySQL dump 10.11
--
-- Host: 127.0.0.1    Database: ddb
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt-log

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
-- Table structure for table `ys_cangku`
--

DROP TABLE IF EXISTS `ys_cangku`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_cangku` (
  `id` bigint(20) NOT NULL auto_increment,
  `zscf` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '名称',
  `ph` varchar(80) collate utf8_unicode_ci NOT NULL,
  `cs` varchar(50) collate utf8_unicode_ci NOT NULL default '  ',
  `sl` decimal(10,2) NOT NULL,
  `bz` text collate utf8_unicode_ci,
  `xrrq` varchar(30) collate utf8_unicode_ci NOT NULL COMMENT '添加日期',
  `yanse` varchar(50) collate utf8_unicode_ci NOT NULL,
  `yanseh` varchar(50) collate utf8_unicode_ci NOT NULL default ' ',
  `lb` varchar(20) collate utf8_unicode_ci NOT NULL,
  `ck` varchar(50) collate utf8_unicode_ci NOT NULL,
  `zzd` varchar(20) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='仓库表';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_cangku`
--

LOCK TABLES `ys_cangku` WRITE;
/*!40000 ALTER TABLE `ys_cangku` DISABLE KEYS */;
INSERT INTO `ys_cangku` VALUES (1,'1/28A','A28','力达','0.00',NULL,'2016-12-18','',' ','晴纶','原料',NULL),(3,'1/2.3 100%A','QY161218','盈生','0.00',NULL,'2016-12-18','原胚','RW','空芯带','胚纱',NULL),(4,'1/2.3 100%A','696969','天旺','0.00',NULL,'2016-12-18','蓝色','BLUE','空芯带','色纱',NULL),(5,'1/2.3 100%A','3333','盈生','0.00',NULL,'2016-12-20','原胚','RW','空芯带','胚纱',NULL),(6,'1/2.3 100%A','23456','天旺','0.00',NULL,'2016-12-20','红色','RED','空芯带','色纱',NULL),(7,'1/2.3 100%A','5656','盈生','90.00',NULL,'2016-12-21','原胚','RW','空芯带','胚纱',NULL),(8,'1/2.3 100%A','9898','互益','0.00',NULL,'2016-12-21','黑色','Black','空芯带','色纱',NULL);
/*!40000 ALTER TABLE `ys_cangku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_chuhuo`
--

DROP TABLE IF EXISTS `ys_chuhuo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_chuhuo` (
  `id` bigint(20) NOT NULL auto_increment,
  `ckdyh` varchar(15) collate utf8_unicode_ci NOT NULL default '0',
  `ckrq` varchar(30) collate utf8_unicode_ci NOT NULL COMMENT '出库日期',
  `ddid` varchar(20) collate utf8_unicode_ci default NULL COMMENT '定单号',
  `ckph` varchar(150) collate utf8_unicode_ci default NULL,
  `ckgg` varchar(100) collate utf8_unicode_ci NOT NULL default ' ' COMMENT '出货纱种',
  `cksh` varchar(30) collate utf8_unicode_ci default NULL COMMENT '色号',
  `cksb` varchar(50) collate utf8_unicode_ci default NULL COMMENT '色别',
  `cksl` double NOT NULL default '0',
  `ckdj` double NOT NULL default '0' COMMENT '单价',
  `ckkpjg` double NOT NULL default '0',
  `ckkh` varchar(30) collate utf8_unicode_ci default NULL,
  `cklxr` varchar(20) collate utf8_unicode_ci default NULL COMMENT '联系人',
  `cklxrdh` varchar(20) collate utf8_unicode_ci default NULL COMMENT '电话',
  `cklxrem` varchar(30) collate utf8_unicode_ci default NULL COMMENT '邮箱',
  `ckdz` varchar(150) collate utf8_unicode_ci default NULL,
  `ckqs` varchar(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '状态',
  `ckqsrq` date default NULL COMMENT '签收日期',
  `ckkplx` varchar(20) collate utf8_unicode_ci NOT NULL COMMENT '类型',
  `cksfzf` int(1) NOT NULL default '0' COMMENT '是否作废',
  `ckkpdh` varchar(20) collate utf8_unicode_ci default NULL COMMENT '对帐单号',
  `ckbz` text collate utf8_unicode_ci,
  `ckkhbh` varchar(50) collate utf8_unicode_ci default NULL COMMENT '客户编号',
  `ckbcbh` varchar(50) collate utf8_unicode_ci default NULL COMMENT '本厂编号',
  `ckck` varchar(2) collate utf8_unicode_ci NOT NULL default 'cp',
  `qsr` varchar(30) collate utf8_unicode_ci default NULL COMMENT '签收人',
  `dzdsj` date default NULL COMMENT '对帐单时间',
  `dzdr` varchar(30) collate utf8_unicode_ci default NULL COMMENT '对帐单人',
  `sksj` date default NULL COMMENT '收款时间',
  `skjg` decimal(10,2) NOT NULL default '0.00' COMMENT '收款金额',
  `skr` varchar(30) collate utf8_unicode_ci default NULL COMMENT '收款人',
  `kpsj` date default NULL COMMENT '开票时间',
  `kpjg` decimal(10,2) NOT NULL default '0.00' COMMENT '开票金额',
  `kpdh` varchar(50) collate utf8_unicode_ci default NULL COMMENT '开票单号',
  `kpr` varchar(30) collate utf8_unicode_ci default NULL COMMENT '开票人',
  `khcwdh` varchar(20) collate utf8_unicode_ci default NULL COMMENT '客户财务电话',
  `khcwcz` varchar(20) collate utf8_unicode_ci default NULL COMMENT '客户财务传真',
  `jians` int(11) NOT NULL default '0' COMMENT '件数',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='出库表';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_chuhuo`
--

LOCK TABLES `ys_chuhuo` WRITE;
/*!40000 ALTER TABLE `ys_chuhuo` DISABLE KEYS */;
INSERT INTO `ys_chuhuo` VALUES (1,'CH1612001','1482062585','DD201612001[1]','A28','1/28A','RW','原胚',2000,0,0,'盈生',NULL,NULL,NULL,'/小付(13790392812)','0',NULL,'再加工',0,NULL,NULL,NULL,NULL,'原料',NULL,NULL,NULL,NULL,'0.00',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,80),(2,'CH1612002','1482063329','DD201612001[2]','QY161218','1/2.3 100%Acrylic','RW','原胚',800,0,0,'天旺',NULL,NULL,NULL,'大朗高英/龙(0769-6666666)','0',NULL,'再加工',0,NULL,NULL,NULL,NULL,'胚纱',NULL,NULL,NULL,NULL,'0.00',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,40),(3,'CH1612003','1482244179','DD201612001[2]','3333','1/2.3 100%Acrylic','RW','原胚',1000,0,0,'天旺',NULL,NULL,NULL,'大朗高英/龙(0769-6666666)','0',NULL,'再加工',0,NULL,NULL,NULL,NULL,'胚纱',NULL,NULL,NULL,NULL,'0.00',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,40),(4,'CH1701001','1484052940','DD201612001[5]','9898','1/2.3 100%Acrylic','Black','黑色',200,0,0,'制衣厂',NULL,NULL,NULL,'不知道/李生(0769-11111111)','0',NULL,'卖纱',0,NULL,NULL,NULL,NULL,'色纱',NULL,NULL,NULL,NULL,'0.00',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,1),(5,'CH1701001','1484052940','DD201612001[4]','23456','1/2.3 100%Acrylic','RED','红色',900,0,0,'制衣厂',NULL,NULL,NULL,'不知道/李生(0769-11111111)','0',NULL,'卖纱',0,NULL,NULL,NULL,NULL,'色纱',NULL,NULL,NULL,NULL,'0.00',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,1),(6,'CH1701001','1484052940','DD201612001[3]','696969','1/2.3 100%Acrylic','BLUE','蓝色',780,0,0,'制衣厂',NULL,NULL,NULL,'不知道/李生(0769-11111111)','0',NULL,'卖纱',0,NULL,NULL,NULL,NULL,'色纱',NULL,NULL,NULL,NULL,'0.00',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,1),(7,'CH1703001','1488541102','DD201612001[2]','5656','1/2.3 100%Acrylic','RW','原胚',10,22,220,'盈生',NULL,NULL,NULL,'/小付(13790392812)','0',NULL,'卖纱',0,NULL,NULL,NULL,NULL,'胚纱',NULL,NULL,NULL,NULL,'0.00',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `ys_chuhuo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_cklsz`
--

DROP TABLE IF EXISTS `ys_cklsz`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_cklsz` (
  `id` bigint(20) NOT NULL auto_increment,
  `rq` date NOT NULL,
  `ph` varchar(80) collate utf8_unicode_ci NOT NULL,
  `cs` varchar(50) collate utf8_unicode_ci default NULL,
  `jc` varchar(50) collate utf8_unicode_ci NOT NULL,
  `sl` decimal(10,2) NOT NULL,
  `bdh` varchar(50) collate utf8_unicode_ci default NULL,
  `bz` text collate utf8_unicode_ci,
  `us` varchar(50) collate utf8_unicode_ci NOT NULL,
  `ddid` varchar(20) collate utf8_unicode_ci default NULL,
  `ck` varchar(2) collate utf8_unicode_ci NOT NULL,
  `bm` varchar(15) collate utf8_unicode_ci NOT NULL default '*' COMMENT '车间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_cklsz`
--

LOCK TABLES `ys_cklsz` WRITE;
/*!40000 ALTER TABLE `ys_cklsz` DISABLE KEYS */;
INSERT INTO `ys_cklsz` VALUES (1,'2016-12-18','A28','力达','进仓','2000.00','20202020',NULL,'Admin','DD201612001[1]','原料','*'),(2,'2016-12-18','A28','盈生','出货','-2000.00','CH1612001',NULL,'Admin','DD201612001[1]','原料','*'),(4,'2016-12-18','QY161218','盈生','进仓','800.00','202020',NULL,'Admin','DD201612001[2]','胚纱','*'),(5,'2016-12-18','QY161218','天旺','出货','-800.00','CH1612002',NULL,'Admin','DD201612001[2]','胚纱','*'),(6,'2016-12-18','696969','天旺','进仓','780.00','0000',NULL,'Admin','DD201612001[3]','色纱','*'),(7,'2016-12-20','3333','盈生','进仓','1000.00','0000',NULL,'Admin','DD201612001[2]','胚纱','*'),(8,'2016-12-20','3333','天旺','出货','-1000.00','CH1612003',NULL,'Admin','DD201612001[2]','胚纱','*'),(9,'2016-12-20','23456','天旺','进仓','900.00','34567',NULL,'Admin','DD201612001[4]','色纱','*'),(10,'2016-12-21','5656','盈生','进仓','100.00','2020',NULL,'Admin','DD201612001[2]','胚纱','*'),(11,'2016-12-21','9898','互益','进仓','200.00','202020',NULL,'Admin','DD201612001[5]','色纱','*'),(12,'2017-01-10','9898','制衣厂','出货','-200.00','CH1701001',NULL,'Admin','DD201612001[5]','色纱','*'),(13,'2017-01-10','23456','制衣厂','出货','-900.00','CH1701001',NULL,'Admin','DD201612001[4]','色纱','*'),(14,'2017-01-10','696969','制衣厂','出货','-780.00','CH1701001',NULL,'Admin','DD201612001[3]','色纱','*'),(15,'2017-03-03','5656','盈生','出货','-10.00','CH1703001',NULL,'Admin','DD201612001[2]','胚纱','*');
/*!40000 ALTER TABLE `ys_cklsz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_ddan`
--

DROP TABLE IF EXISTS `ys_ddan`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_ddan` (
  `ddid` varchar(15) collate utf8_unicode_ci NOT NULL,
  `rq` date NOT NULL,
  `kh` varchar(50) collate utf8_unicode_ci default NULL,
  `khbh` varchar(50) collate utf8_unicode_ci default NULL COMMENT '客户订单号',
  `bcbh` varchar(50) collate utf8_unicode_ci default NULL COMMENT '本厂订单号',
  `szgg` varchar(150) collate utf8_unicode_ci NOT NULL COMMENT '纱种规格',
  `sl` decimal(10,2) NOT NULL default '0.00',
  `jq` date default NULL,
  `zt` varchar(1) collate utf8_unicode_ci NOT NULL default '0',
  `bz` text collate utf8_unicode_ci,
  `cpdj` decimal(10,2) NOT NULL default '0.00' COMMENT '单价',
  `ddlx` varchar(20) collate utf8_unicode_ci NOT NULL default '买卖' COMMENT '订单类型',
  `khph` varchar(50) collate utf8_unicode_ci default NULL COMMENT '纱号',
  PRIMARY KEY  (`ddid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单表';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_ddan`
--

LOCK TABLES `ys_ddan` WRITE;
/*!40000 ALTER TABLE `ys_ddan` DISABLE KEYS */;
INSERT INTO `ys_ddan` VALUES ('DD201612001','2016-12-18','制衣厂','PO20161218',NULL,'1/2.3 100%Acrylic','2000.00','2016-12-31','2',NULL,'23.00','一般','SH001'),('DD201612002','2016-12-21','制衣厂2',NULL,NULL,'1/5 100%Cotton','5000.00','2016-12-21','0',NULL,'36.00','一般','SH001');
/*!40000 ALTER TABLE `ys_ddan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_ddani`
--

DROP TABLE IF EXISTS `ys_ddani`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_ddani` (
  `id` int(11) NOT NULL auto_increment,
  `rq` date NOT NULL,
  `ddid` varchar(15) collate utf8_unicode_ci NOT NULL,
  `xh` smallint(6) NOT NULL,
  `lb` varchar(10) collate utf8_unicode_ci NOT NULL,
  `zscf` varchar(100) collate utf8_unicode_ci NOT NULL,
  `cs` varchar(30) collate utf8_unicode_ci NOT NULL,
  `dz` varchar(100) collate utf8_unicode_ci NOT NULL,
  `ys` varchar(30) collate utf8_unicode_ci NOT NULL,
  `sh` varchar(30) collate utf8_unicode_ci NOT NULL,
  `sh1` varchar(30) collate utf8_unicode_ci NOT NULL,
  `okph` varchar(50) collate utf8_unicode_ci NOT NULL,
  `sl` decimal(10,2) NOT NULL,
  `ck` varchar(10) collate utf8_unicode_ci NOT NULL,
  `jq` date NOT NULL,
  `bz` text collate utf8_unicode_ci NOT NULL,
  `us` varchar(20) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_ddani`
--

LOCK TABLES `ys_ddani` WRITE;
/*!40000 ALTER TABLE `ys_ddani` DISABLE KEYS */;
INSERT INTO `ys_ddani` VALUES (1,'2016-12-18','DD201612001',1,'晴纶','1/28A','力达','大朗黎贝岭/张生(0769-8888888)','','','','','2000.00','原料','2016-12-21','','Admin'),(2,'2016-12-18','DD201612001',2,'空芯带','1/2.3 100%A','盈生','/小付(13790392812)','原胚','RW','','3161218','2000.00','胚纱','2016-12-24','','Admin'),(3,'2016-12-18','DD201612001',3,'空芯带','1/2.3 100%A','天旺','大朗高英/龙(0769-6666666)','蓝色','BLUE','BL77','77','1000.00','色纱','2016-12-30','','Admin'),(4,'2016-12-18','DD201612001',4,'空芯带','1/2.3 100%A','天旺','大朗高英/龙(0769-6666666)','红色','RED','','','500.00','色纱','2016-12-31','','Admin'),(5,'2016-12-18','DD201612001',5,'空芯带','1/2.3 100%A','天旺','大朗高英/龙(0769-6666666)','黑色','Black','','','500.00','色纱','2016-12-31','','Admin'),(6,'2016-12-21','DD201612002',1,'圈圈纱','1/5 100%C','盈生','/小付(13790392812)','','','','','5000.00','胚纱','2016-12-31','','Admin'),(7,'2017-01-09','DD201612001',6,'空芯带','1/2.3 100%A','天旺','大朗高英/龙(0769-6666666)','白色','WHITE','WH99','9999','9.00','色纱','2016-12-30','','Admin'),(8,'2017-01-09','DD201612001',7,'空芯带','1/2.3 100%A','天旺','大朗高英/龙(0769-6666666)','绿色','green','GR554','554','55.00','色纱','2016-12-30','','Admin'),(10,'2017-01-10','DD201612002',2,'曲珠纱','1/5 44%Cotton 28%Rayon 10%Nylon 8%Polyester 10%Lurex','天旺','大朗高英/龙(0769-6666666)','红色','RD011','RED','09666','1000.00','色纱','2017-01-31',' 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五GG;\r\n 4.代染:是, 染损:小于8%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追OK缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .           ','Admin'),(11,'2017-01-10','DD201612002',3,'曲珠纱','1/5 44%Cotton 28%Rayon 10%Nylon 8%Polyester 10%Lurex','天旺','大朗高英/龙(0769-6666666)','蓝色','BL022','BLUE','989898','1000.00','色纱','2017-01-31',' 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五GG;\r\n 4.代染:是, 染损:小于8%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追OK缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .           ','Admin');
/*!40000 ALTER TABLE `ys_ddani` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_dgdan`
--

DROP TABLE IF EXISTS `ys_dgdan`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_dgdan` (
  `id` bigint(20) NOT NULL auto_increment,
  `dgid` varchar(20) collate utf8_unicode_ci NOT NULL,
  `xdrq` date NOT NULL,
  `jhrq` varchar(20) collate utf8_unicode_ci NOT NULL default '0',
  `dgcs` varchar(20) collate utf8_unicode_ci NOT NULL default 'ys',
  `pm` varchar(30) collate utf8_unicode_ci NOT NULL COMMENT '品名',
  `zs` varchar(20) collate utf8_unicode_ci NOT NULL,
  `cf` varchar(50) collate utf8_unicode_ci NOT NULL,
  `lb` varchar(50) collate utf8_unicode_ci NOT NULL,
  `ys` varchar(30) collate utf8_unicode_ci NOT NULL default '胚纱',
  `sl` decimal(10,2) NOT NULL default '0.00',
  `dj` decimal(10,2) NOT NULL default '0.00',
  `fkfs` varchar(60) collate utf8_unicode_ci default NULL COMMENT '付款方式',
  `shfs` varchar(60) collate utf8_unicode_ci default NULL COMMENT '送货方式',
  `bz` text collate utf8_unicode_ci,
  `ishans` int(1) NOT NULL default '0' COMMENT '是否含税',
  `hcfp` varchar(100) collate utf8_unicode_ci default NULL,
  `sfjg` decimal(10,2) NOT NULL default '0.00' COMMENT '实付金额',
  `ck` varchar(10) collate utf8_unicode_ci NOT NULL COMMENT '仓库类别',
  `yt` varchar(200) collate utf8_unicode_ci NOT NULL COMMENT '用途',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='原料定购单';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_dgdan`
--

LOCK TABLES `ys_dgdan` WRITE;
/*!40000 ALTER TABLE `ys_dgdan` DISABLE KEYS */;
/*!40000 ALTER TABLE `ys_dgdan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_dolog`
--

DROP TABLE IF EXISTS `ys_dolog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_dolog` (
  `dt` datetime NOT NULL,
  `info` text collate utf8_unicode_ci NOT NULL,
  `us` varchar(50) collate utf8_unicode_ci NOT NULL,
  `bb` varchar(50) collate utf8_unicode_ci default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_dolog`
--

LOCK TABLES `ys_dolog` WRITE;
/*!40000 ALTER TABLE `ys_dolog` DISABLE KEYS */;
INSERT INTO `ys_dolog` VALUES ('2016-12-18 19:47:25','SH001;空芯带;1/2.3;100%A; 1/28A *1条; 8针空芯带;;;2016-12-18;','Admin','添加制造单'),('2016-12-18 19:48:08','a;盈生;小付;13790392812;;;-1;','Admin','添加客户'),('2016-12-18 19:48:52','a;天旺;龙;0769-6666666;大朗高英;;-1;','Admin','添加客户'),('2016-12-18 19:50:27','a;力达;张生;0769-8888888;大朗黎贝岭;;-1;','Admin','添加客户'),('2016-12-18 19:50:49','a;互益;吴;0752-9999999;;;-1;','Admin','添加客户'),('2016-12-18 19:51:40','a;制衣厂;李生;0769-11111111;不知道;;-1;','Admin','添加客户'),('2016-12-18 19:52:59','制衣厂;一般;PO20161218;;SH001;1/2.3 100%Acrylic;2000.00;23.00;;2016-12-31;DD201612001;submit;2016-12-18;','Admin','添加订单DD201612001'),('2016-12-18 19:54:23','力达;1/28A;;晴纶;;;;2000.00;2016-12-21;;DD201612001;原料;大朗黎贝岭/张生(0769-8888888);2016-12-18;Admin;1;','Admin','添加子订单'),('2016-12-18 19:55:13','盈生;1/2.3 100%A;3161218;空芯带;原胚;RW;;2000.00;2016-12-24;;DD201612001;胚纱;/小付(13790392812);2016-12-18;Admin;2;','Admin','添加子订单'),('2016-12-18 19:55:58','天旺;1/2.3 100%A;;空芯带;蓝色;BLUE;;1000.00;2016-12-30;;DD201612001;色纱;大朗高英/龙(0769-6666666);2016-12-18;Admin;3;','Admin','添加子订单'),('2016-12-18 19:56:37','天旺;1/2.3 100%A;;空芯带;红色;RED;;500.00;2016-12-31;;DD201612001;色纱;大朗高英/龙(0769-6666666);2016-12-18;Admin;4;','Admin','添加子订单'),('2016-12-18 19:57:18','互益;1/2.3 100%A;;空芯带;黑色;Black;;500.00;2016-12-31;;DD201612001;色纱;/吴(0752-9999999);2016-12-18;Admin;5;','Admin','添加子订单'),('2016-12-18 19:59:43','DD201612001[1];A28;1/28A;;;晴纶;力达;2000;KG;20202020;;原料;进仓;;2016-12-18;2016-12-18;Admin;','Admin','进仓A28'),('2016-12-18 20:03:05','2016-12-18;A28;盈生;出货;-2000;CH1612001;;Admin;DD201612001[1];原料;','Admin','出货A28'),('2016-12-18 20:06:23','DD201612001[2];3161218-1;1/28A;;;晴纶;力达;800;KG;1010101;;胚纱;进仓;;2016-12-18;2016-12-18;Admin;','Admin','进仓3161218-1'),('2016-12-18 20:12:45','2;1/28A;3161218-1;力达;800.00;;2016-12-18;; ;晴纶;胚纱;;','Admin','删除库存记录: 3161218-1'),('2016-12-18 20:13:39','DD201612001[2];QY161218;1/2.3 100%A;原胚;RW;空芯带;盈生;800;KG;202020;;胚纱;进仓;;2016-12-18;2016-12-18;Admin;','Admin','进仓QY161218'),('2016-12-18 20:15:29','2016-12-18;QY161218;天旺;出货;-800;CH1612002;;Admin;DD201612001[2];胚纱;','Admin','出货QY161218'),('2016-12-18 20:19:04','DD201612001[3];696969;1/2.3 100%A;蓝色;BLUE;空芯带;天旺;780;KG;0000;;色纱;进仓;;2016-12-18;2016-12-18;Admin;','Admin','进仓696969'),('2016-12-20 22:17:37','127.0.0.1 Windows 10 Chrome(55.0.2883.87)','Admin','login'),('2016-12-20 22:29:05','DD201612001[2];3333;1/2.3 100%A;原胚;RW;空芯带;盈生;1000;KG;0000;;胚纱;进仓;;2016-12-20;2016-12-20;Admin;','Admin','进仓3333'),('2016-12-20 22:29:39','2016-12-20;3333;天旺;出货;-1000;CH1612003;;Admin;DD201612001[2];胚纱;','Admin','出货3333'),('2016-12-20 22:30:11','DD201612001[4];23456;1/2.3 100%A;红色;RED;空芯带;天旺;900;KG;34567;;色纱;进仓;;2016-12-20;2016-12-20;Admin;','Admin','进仓23456'),('2016-12-21 00:05:45','DD201612001[2];5656;1/2.3 100%A;原胚;RW;空芯带;盈生;100;KG;2020;;胚纱;进仓;;2016-12-21;2016-12-21;Admin;','Admin','进仓5656'),('2016-12-21 00:06:21','DD201612001[5];9898;1/2.3 100%A;黑色;Black;空芯带;互益;200;KG;202020;;色纱;进仓;;2016-12-21;2016-12-21;Admin;','Admin','进仓9898'),('2016-12-21 12:15:00','127.0.0.1 Windows 10 Chrome(55.0.2883.87)','Admin','login'),('2016-12-21 12:17:24','制衣厂2;一般;;;SH001;1/5 100%Cotton;5000.00;36.00;;2016-12-21;DD201612002;submit;2016-12-21;','Admin','添加订单DD201612002'),('2016-12-21 12:21:42','盈生;1/5 100%C;;圈圈纱;;;;5000.00;2016-12-31;;DD201612002;胚纱;/小付(13790392812);2016-12-21;Admin;1;','Admin','添加子订单'),('2016-12-25 22:12:50','127.0.0.1 Windows 10 Chrome(55.0.2883.87)','Admin','login'),('2017-01-03 20:45:34','127.0.0.1 Windows 10 Chrome(55.0.2883.87)','Admin','login'),('2017-01-08 11:27:36','127.0.0.1 Windows 10 Chrome(55.0.2883.87)','Admin','login'),('2017-01-09 22:09:55','127.0.0.1 Windows 10 Chrome(55.0.2883.87)','Admin','login'),('2017-01-09 22:57:01','天旺;1/2.3 100%A;9999;空芯带;白色;WHITE;WH99;9.00;2016-12-30;;DD201612001;色纱;;大朗高英/龙(0769-6666666);2017-01-09;Admin;6;','Admin','添加子订单'),('2017-01-09 23:00:18','天旺;1/2.3 100%A;77;空芯带;蓝色;BLUE;BL77;1000.00;2016-12-30;;;;3;大朗高英/龙(0769-6666666);','Admin','编辑子订单'),('2017-01-09 23:00:59','天旺;1/2.3 100%A;554;空芯带;绿色;green;GR554;55.00;2016-12-30;;DD201612001;色纱;;大朗高英/龙(0769-6666666);2017-01-09;Admin;7;','Admin','添加子订单'),('2017-01-09 23:02:46','天旺;1/2.3 100%A;;空芯带;黑色;Black;;500.00;2016-12-31;;;;5;大朗高英/龙(0769-6666666);','Admin','编辑子订单'),('2017-01-09 23:39:41','SH001;空芯带;1/2.3;100%A; 1/28A *1条 ; 8针空芯带 \r\n33HZ;;;2017-01-09;','Admin','修改制造单'),('2017-01-10 19:51:04','天旺;1/5 100%Cotton;36900;曲珠纱;红色;rd001;RED;1000.00;2017-01-31; 1.实数交货; \r\n 2.数量控制 5%,质量要求:环保料;\r\n 3.本单织法:一条毛织5针;\r\n 4.代染:是, 染损:小于5%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追ok缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 . ;DD201612002;色纱;;大朗高英/龙(0769-6666666);2017-01-10;Admin;2;','Admin','添加子订单'),('2017-01-10 19:52:01','9;2017-01-10;DD201612002;2;曲珠纱;1/5 100%Cotton;天旺;大朗高英/龙(0769-6666666);红色;rd001;RED;36900;1000.00;色纱;2017-01-31;;Admin;','Admin','删除子订单DD201612002'),('2017-01-10 19:52:41','天旺;1/5 100%Cotton;09665;曲珠纱;红色;RD01;RED;1000.00;2017-01-10; 1.实数交货; \r\n 2.数量控制  %,质量要求:环保料;\r\n 3.本单织法:一条毛织7针;\r\n 4.代染:是, 染损:小于 %,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追ok缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 . ;DD201612002;色纱;;大朗高英/龙(0769-6666666);2017-01-10;Admin;2;','Admin','添加子订单'),('2017-01-10 19:53:13','天旺;1/5 100%Cotton;09665;曲珠纱;红色;RD01;RED;1000.00;2017-01-10; 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五针;\r\n 4.代染:是, 染损:小于 5%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追ok缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .  ;;;10;大朗高英/龙(0769-6666666);','Admin','编辑子订单'),('2017-01-10 20:21:51','天旺;1/5 44%Cotton 28%Rayon 10%Nylon 18%Lurex;09665;曲珠纱;红色;RD01;RED;1000.00;2017-01-10; 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五针;\r\n 4.代染:是, 染损:小于 5%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追ok缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .   ;;;10;大朗高英/龙(0769-6666666);','Admin','编辑子订单'),('2017-01-10 20:22:53','天旺;1/5 44%Cotton 28%Rayon 10%Nylon 8%Polyester 10%Lurex;09665;曲珠纱;红色;RD01;RED;1000.00;2017-01-10; 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五针;\r\n 4.代染:是, 染损:小于 5%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追ok缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .    ;;;10;大朗高英/龙(0769-6666666);','Admin','编辑子订单'),('2017-01-10 20:40:29','天旺;1/5 44%Cotton 28%Rayon 10%Nylon 8%Polyester 10%Lurex;09666;曲珠纱;红色;RD01;RED;1000.00;2017-01-10; 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五针;\r\n 4.代染:是, 染损:小于 5%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追ok缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .     ;;;10;大朗高英/龙(0769-6666666);','Admin','编辑子订单要求'),('2017-01-10 20:40:29','天旺;1/5 44%Cotton 28%Rayon 10%Nylon 8%Polyester 10%Lurex;09666;曲珠纱;红色;RD01;RED;1000.00;2017-01-10; 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五针;\r\n 4.代染:是, 染损:小于 5%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追ok缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .     ;;;10;大朗高英/龙(0769-6666666);','Admin','编辑子订单'),('2017-01-10 20:44:18','天旺;1/5 44%Cotton 28%Rayon 10%Nylon 8%Polyester 10%Lurex;09666;曲珠纱;红色;RD011;RED;1000.00;2017-01-10;;;10;大朗高英/龙(0769-6666666);','Admin','编辑子订单要求'),('2017-01-10 20:44:18','天旺;1/5 44%Cotton 28%Rayon 10%Nylon 8%Polyester 10%Lurex;09666;曲珠纱;红色;RD011;RED;1000.00;2017-01-10;;;10;大朗高英/龙(0769-6666666);','Admin','编辑子订单'),('2017-01-10 20:46:09',' 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五针;\r\n 4.代染:是, 染损:小于 5%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追ok缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .       ; 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五针;\r\n 4.代染:是, 染损:小于 5%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追ok缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .      ;','Admin','编辑子订单要求'),('2017-01-10 20:46:09','天旺;1/5 44%Cotton 28%Rayon 10%Nylon 8%Polyester 10%Lurex;09666;曲珠纱;红色;RD011;RED;1000.00;2017-01-31;;;10;大朗高英/龙(0769-6666666);','Admin','编辑子订单'),('2017-01-10 20:47:01','天旺;1/5 44%Cotton 28%Rayon 10%Nylon 8%Polyester 10%Lurex;989898;曲珠纱;蓝色;BL002;BLUE;1000.00;2017-01-31; 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五针;\r\n 4.代染:是, 染损:小于 5%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追ok缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .        ;DD201612002;色纱;;大朗高英/龙(0769-6666666);2017-01-10;Admin;3;','Admin','添加子订单'),('2017-01-10 20:47:56',' 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五GG;\r\n 4.代染:是, 染损:小于 5%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追ok缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .         ; 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五针;\r\n 4.代染:是, 染损:小于 5%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追ok缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .        ;','Admin','编辑子订单要求'),('2017-01-10 20:47:56','天旺;1/5 44%Cotton 28%Rayon 10%Nylon 8%Polyester 10%Lurex;989898;曲珠纱;蓝色;BL002;BLUE;1000.00;2017-01-31;;;11;大朗高英/龙(0769-6666666);','Admin','编辑子订单'),('2017-01-10 20:49:22','天旺;1/5 44%Cotton 28%Rayon 10%Nylon 8%Polyester 10%Lurex;989898;曲珠纱;蓝色;BL022;BLUE;1000.00;2017-01-31;;;11;大朗高英/龙(0769-6666666);','Admin','编辑子订单'),('2017-01-10 20:49:55',' 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五GG;\r\n 4.代染:是, 染损:小于 5%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追OK缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .          ; 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五GG;\r\n 4.代染:是, 染损:小于 5%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追ok缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .         ;','Admin','编辑子订单要求'),('2017-01-10 20:49:55','天旺;1/5 44%Cotton 28%Rayon 10%Nylon 8%Polyester 10%Lurex;989898;曲珠纱;蓝色;BL022;BLUE;1000.00;2017-01-31;;;11;大朗高英/龙(0769-6666666);','Admin','编辑子订单'),('2017-01-10 20:51:02',' 1.实数交货; \r\n 2.数量控制 3%,质量要求:环保料;\r\n 3.本单织法:一条毛织五GG;\r\n 4.代染:是, 染损:小于8%,色牢度:要合格;\r\n 5.对色:对普通室内日光灯;\r\n 6.用我司提供的胚纱,追OK缸下染,颜色对准,自对色送货;\r\n 7.此纱一定要烘干 .           ','Admin','编辑子订单要求'),('2017-01-10 20:51:02','天旺;1/5 44%Cotton 28%Rayon 10%Nylon 8%Polyester 10%Lurex;989898;曲珠纱;蓝色;BL022;BLUE;1000.00;2017-01-31;;;11;大朗高英/龙(0769-6666666);','Admin','编辑子订单'),('2017-01-10 20:55:40','2017-01-10;9898;制衣厂;出货;-200;CH1701001;;Admin;DD201612001[5];色纱;','Admin','出货9898'),('2017-01-10 20:55:40','2017-01-10;23456;制衣厂;出货;-900;CH1701001;;Admin;DD201612001[4];色纱;','Admin','出货23456'),('2017-01-10 20:55:40','2017-01-10;696969;制衣厂;出货;-780;CH1701001;;Admin;DD201612001[3];色纱;','Admin','出货696969'),('2017-03-03 19:36:39','127.0.0.1 Windows 10 Chrome(56.0.2924.87)','Admin','login'),('2017-03-03 19:38:22','2017-03-03;5656;盈生;出货;-10;CH1703001;;Admin;DD201612001[2];胚纱;','Admin','出货5656');
/*!40000 ALTER TABLE `ys_dolog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_jianyi`
--

DROP TABLE IF EXISTS `ys_jianyi`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_jianyi` (
  `id` int(11) NOT NULL auto_increment,
  `tm` datetime NOT NULL,
  `us` varchar(20) collate utf8_unicode_ci NOT NULL,
  `jy` text collate utf8_unicode_ci NOT NULL,
  `hf` text collate utf8_unicode_ci NOT NULL,
  `qt` varchar(10) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='建议';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_jianyi`
--

LOCK TABLES `ys_jianyi` WRITE;
/*!40000 ALTER TABLE `ys_jianyi` DISABLE KEYS */;
/*!40000 ALTER TABLE `ys_jianyi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_jizhang`
--

DROP TABLE IF EXISTS `ys_jizhang`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_jizhang` (
  `xh` int(11) NOT NULL auto_increment COMMENT '序号',
  `na` varchar(30) collate utf8_unicode_ci NOT NULL COMMENT '帐号名',
  `us` varchar(30) collate utf8_unicode_ci NOT NULL COMMENT '用户名',
  `ye` decimal(10,2) NOT NULL COMMENT '余额',
  `tm` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY  (`xh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='帐户';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_jizhang`
--

LOCK TABLES `ys_jizhang` WRITE;
/*!40000 ALTER TABLE `ys_jizhang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ys_jizhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_jizhangrizhi`
--

DROP TABLE IF EXISTS `ys_jizhangrizhi`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_jizhangrizhi` (
  `xh` int(11) NOT NULL auto_increment,
  `tm` date NOT NULL,
  `us` varchar(30) collate utf8_unicode_ci NOT NULL,
  `na` varchar(30) collate utf8_unicode_ci NOT NULL,
  `lb` varchar(10) collate utf8_unicode_ci NOT NULL,
  `mc` varchar(100) collate utf8_unicode_ci NOT NULL,
  `dj` decimal(10,2) NOT NULL,
  `sl` decimal(10,2) NOT NULL,
  `je` decimal(10,2) NOT NULL,
  `ye` decimal(10,2) NOT NULL,
  `dw` varchar(10) collate utf8_unicode_ci default NULL COMMENT '数量的单位',
  `bz` text collate utf8_unicode_ci,
  `yt` varchar(10) collate utf8_unicode_ci default NULL,
  `gys` varchar(20) collate utf8_unicode_ci default NULL,
  `gz` date default NULL COMMENT '过帐时间',
  PRIMARY KEY  (`xh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_jizhangrizhi`
--

LOCK TABLES `ys_jizhangrizhi` WRITE;
/*!40000 ALTER TABLE `ys_jizhangrizhi` DISABLE KEYS */;
/*!40000 ALTER TABLE `ys_jizhangrizhi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_jrckd`
--

DROP TABLE IF EXISTS `ys_jrckd`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_jrckd` (
  `id` smallint(6) NOT NULL auto_increment,
  `us` varchar(50) collate utf8_unicode_ci NOT NULL,
  `ph` varchar(200) collate utf8_unicode_ci NOT NULL,
  `ck` varchar(10) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_jrckd`
--

LOCK TABLES `ys_jrckd` WRITE;
/*!40000 ALTER TABLE `ys_jrckd` DISABLE KEYS */;
/*!40000 ALTER TABLE `ys_jrckd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_kehu`
--

DROP TABLE IF EXISTS `ys_kehu`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_kehu` (
  `xh` int(11) NOT NULL auto_increment,
  `na` varchar(50) collate utf8_unicode_ci NOT NULL,
  `lb` varchar(10) collate utf8_unicode_ci NOT NULL default 'a',
  `dz` varchar(100) collate utf8_unicode_ci default NULL,
  `lxr` varchar(30) collate utf8_unicode_ci default NULL,
  `dh` varchar(20) collate utf8_unicode_ci default NULL,
  `em` varchar(30) collate utf8_unicode_ci default NULL,
  `bz` text collate utf8_unicode_ci,
  PRIMARY KEY  (`xh`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='客户表';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_kehu`
--

LOCK TABLES `ys_kehu` WRITE;
/*!40000 ALTER TABLE `ys_kehu` DISABLE KEYS */;
INSERT INTO `ys_kehu` VALUES (1,'盈生','a',NULL,'小付','13790392812',NULL,NULL),(2,'天旺','a','大朗高英','龙','0769-6666666',NULL,NULL),(3,'力达','a','大朗黎贝岭','张生','0769-8888888',NULL,NULL),(4,'互益','a',NULL,'吴','0752-9999999',NULL,NULL),(5,'制衣厂','a','不知道','李生','0769-11111111',NULL,NULL);
/*!40000 ALTER TABLE `ys_kehu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_pinming`
--

DROP TABLE IF EXISTS `ys_pinming`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_pinming` (
  `xh` int(11) NOT NULL auto_increment,
  `na` varchar(100) collate utf8_unicode_ci NOT NULL,
  `lb` varchar(100) collate utf8_unicode_ci NOT NULL,
  `zl` varchar(10) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`xh`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_pinming`
--

LOCK TABLES `ys_pinming` WRITE;
/*!40000 ALTER TABLE `ys_pinming` DISABLE KEYS */;
INSERT INTO `ys_pinming` VALUES (29,'半精梳棉','原料','仓库'),(30,'精梳棉','原料','仓库'),(31,'晴纶','原料','仓库'),(32,'短节棉','原料','仓库'),(33,'长节棉','原料','仓库'),(34,'半漂亚麻','原料','仓库'),(35,'原色亚麻','原料','仓库'),(36,'气流纺棉','原料','仓库'),(42,'曲珠纱','胚纱','仓库'),(43,'圈圈纱','胚纱','仓库'),(44,'电脑纱','胚纱','仓库'),(45,'空芯带','胚纱','仓库'),(46,'起毛纱','胚纱','仓库'),(47,'曲珠纱','色纱','仓库'),(48,'圈圈纱','色纱','仓库'),(49,'电脑纱','色纱','仓库'),(50,'空芯带','色纱','仓库'),(51,'水结珠','色纱','仓库');
/*!40000 ALTER TABLE `ys_pinming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_qianwei`
--

DROP TABLE IF EXISTS `ys_qianwei`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_qianwei` (
  `xiefa` varchar(30) collate utf8_unicode_ci NOT NULL COMMENT '写法',
  `jianxie` varchar(10) collate utf8_unicode_ci NOT NULL COMMENT '简写',
  `quanxie` varchar(10) collate utf8_unicode_ci NOT NULL COMMENT '全写',
  `zhongwen` varchar(10) collate utf8_unicode_ci NOT NULL COMMENT '中文',
  PRIMARY KEY  (`xiefa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='纤维表';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_qianwei`
--

LOCK TABLES `ys_qianwei` WRITE;
/*!40000 ALTER TABLE `ys_qianwei` DISABLE KEYS */;
INSERT INTO `ys_qianwei` VALUES ('a','A','Acrylic','晴纶'),('acr','A','Acrylic','晴纶'),('acrylic','A','Acrylic','晴纶'),('an','AN','Angora','兔毛'),('ang','AN','Angora','兔毛'),('angora','AN','Angora','兔毛'),('ba','BA','Bamboo','竹纤维'),('bam','BA','Bamboo','竹纤维'),('bamboo','BA','Bamboo','竹纤维'),('c','C','Cotton','棉'),('cot','C','Cotton','棉'),('cotton','C','Cotton','棉'),('cottonslub','C','Cotton','棉'),('htc','C','Cotton','棉'),('l','L','Linen','亚麻'),('lin','L','Linen','亚麻'),('linen','L','Linen','亚麻'),('lu','LU','Lurex','金线'),('lurex','LU','Lurex','金线'),('ly','LY','Lycra','拉架'),('lycra','LY','Lycra','拉架'),('m','M','Mohair','马海毛'),('ma','M','Mohair','马海毛'),('mahair','M','Mohair','马海毛'),('metallic','Meta','Metallic','金银线'),('mod','MODAL','Modal','莫代尔'),('modal','MODAL','Modal','莫代尔'),('mohair','M','Mohair','马海毛'),('n','N','Nylon','尼龙'),('ny','N','Nylon','尼龙'),('nylon','N','Nylon','尼龙'),('p','P','Polyester','涤纶'),('poly','P','Polyester','涤纶'),('polyester','P','Polyester','涤纶'),('r','R','Ramie','苎麻'),('ra','RA','Rayon','人棉'),('ram','R','Ramie','苎麻'),('ramie','R','Ramie','苎麻'),('ray','RA','Rayon','人棉'),('rayon','RA','Rayon','人棉'),('s','S','Silk','蚕丝'),('silk','S','Silk','蚕丝'),('slub cotton','C','Cotton','粒棉'),('sp','SP','Spandex','拉架'),('spandex','SP','Spandex','拉架'),('ten','TEN','Tencel','天丝'),('tencel','TEN','Tencel','天丝'),('tex','TEN','Tencel','天丝'),('v','V','Viscose','光丝'),('vis','V','Viscose','光丝'),('viscose','V','Viscose','光丝'),('w','W','Wool','羊毛'),('wool','W','Wool','羊毛'),('亚麻','L','Linen','亚麻'),('人棉','RA','Rayon','人棉'),('光丝','V','Viscose','光丝'),('兔毛','AN','Angora','兔毛'),('天丝','TEN','Tencel','天丝'),('尼龙','N','Nylon','尼龙'),('拉架','LY','Lycra','拉架'),('晴纶','A','Acrylic','晴纶'),('棉','C','Cotton','棉'),('油丝','S','Silk','蚕丝'),('涤纶','P','Polyester','涤纶'),('竹纤维','BA','Bamboo','竹纤维'),('羊毛','W','Wool','羊毛'),('苎麻','R','Ramie','苎麻'),('莫代尔','MODAL','Modal','莫代尔'),('蚕丝','S','Silk','蚕丝'),('金线','LU','Lurex','金线'),('金葱','LU','Lurex','金线'),('锦纶','N','Nylon','尼龙'),('马海毛','M','Mohair','马海毛');
/*!40000 ALTER TABLE `ys_qianwei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_tixing`
--

DROP TABLE IF EXISTS `ys_tixing`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_tixing` (
  `id` int(11) NOT NULL auto_increment,
  `tm` date NOT NULL,
  `us` varchar(60) collate utf8_unicode_ci NOT NULL COMMENT '显示给用户',
  `sm` varchar(300) collate utf8_unicode_ci NOT NULL,
  `gz` varchar(30) collate utf8_unicode_ci NOT NULL,
  `va` varchar(30) collate utf8_unicode_ci NOT NULL COMMENT '创建此提醒的用户',
  `yjsj` date NOT NULL,
  `sjsj` date NOT NULL,
  `bz` text collate utf8_unicode_ci NOT NULL,
  `zt` varchar(1) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='事件提醒';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_tixing`
--

LOCK TABLES `ys_tixing` WRITE;
/*!40000 ALTER TABLE `ys_tixing` DISABLE KEYS */;
/*!40000 ALTER TABLE `ys_tixing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_user`
--

DROP TABLE IF EXISTS `ys_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_user` (
  `yhm` varchar(20) collate utf8_unicode_ci NOT NULL,
  `yhmm` varchar(50) collate utf8_unicode_ci default '18650aeebd991088a956ecf341b91c59',
  `yhqx` varchar(5) collate utf8_unicode_ci NOT NULL default '1',
  `tbqx` varchar(50) collate utf8_unicode_ci NOT NULL,
  `yhbz` varchar(30) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`yhm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_user`
--

LOCK TABLES `ys_user` WRITE;
/*!40000 ALTER TABLE `ys_user` DISABLE KEYS */;
INSERT INTO `ys_user` VALUES ('admin','21232f297a57a5a743894a0e4a801fc3','A','127.0.0.1,2017-03-03 19:36:39','Admin');
/*!40000 ALTER TABLE `ys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ys_zzd`
--

DROP TABLE IF EXISTS `ys_zzd`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ys_zzd` (
  `ph` varchar(50) collate utf8_unicode_ci NOT NULL,
  `pm` varchar(30) collate utf8_unicode_ci default NULL COMMENT '品名',
  `zs` varchar(100) collate utf8_unicode_ci NOT NULL,
  `cf` varchar(150) collate utf8_unicode_ci NOT NULL default '*',
  `khph` varchar(80) collate utf8_unicode_ci default NULL,
  `jrsj` date default NULL,
  `bz` text collate utf8_unicode_ci,
  `wz` varchar(10) collate utf8_unicode_ci default NULL,
  `lb` varchar(10) collate utf8_unicode_ci NOT NULL default 'hj' COMMENT '类别',
  `gy` text collate utf8_unicode_ci COMMENT '工艺',
  `yl` text collate utf8_unicode_ci COMMENT '用料',
  `cl` varchar(50) collate utf8_unicode_ci default NULL COMMENT '产量',
  PRIMARY KEY  (`ph`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ys_zzd`
--

LOCK TABLES `ys_zzd` WRITE;
/*!40000 ALTER TABLE `ys_zzd` DISABLE KEYS */;
INSERT INTO `ys_zzd` VALUES ('SH001','空芯带','1/2.3','100%A',NULL,'2017-01-09',NULL,NULL,'hj',' 8针空芯带 \r\n33HZ',' 1/28A *1条 ',NULL);
/*!40000 ALTER TABLE `ys_zzd` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-22 11:41:04
