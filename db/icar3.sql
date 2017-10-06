CREATE DATABASE  IF NOT EXISTS `icar3` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `icar3`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: icar-samlocal.c1uldykdwmrj.us-east-1.rds.amazonaws.com    Database: icar3
-- ------------------------------------------------------
-- Server version	5.6.35-log

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
-- Table structure for table `APLCTN_USR_SSSN`
--

DROP TABLE IF EXISTS `APLCTN_USR_SSSN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APLCTN_USR_SSSN` (
  `SSSN_ID` varchar(256) NOT NULL,
  `APLCTN_NM` varchar(20) NOT NULL,
  `VRSN_CD` varchar(8) NOT NULL,
  `DLRSHP_KY` int(11) NOT NULL,
  `DLR_USR_NM` varchar(15) NOT NULL,
  `SSSN_CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SSSN_EXPRY_TS` datetime(6) NOT NULL,
  `SSSN_STS_IN` char(1) NOT NULL DEFAULT 'A',
  `SSSN_LST_ACTV_TS` datetime(6) DEFAULT NULL,
  `DVC_NM` varchar(12) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SSSN_ID`),
  KEY `APLCTN_USR_SSSN_IF1` (`DLRSHP_KY`),
  CONSTRAINT `fk_aplctn_usr_sssn_dlrshp` FOREIGN KEY (`DLRSHP_KY`) REFERENCES `DLRSHP` (`DLRSHP_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APLCTN_USR_SSSN`
--

LOCK TABLES `APLCTN_USR_SSSN` WRITE;
/*!40000 ALTER TABLE `APLCTN_USR_SSSN` DISABLE KEYS */;
/*!40000 ALTER TABLE `APLCTN_USR_SSSN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `APLCTN_VRSN_CNTL`
--

DROP TABLE IF EXISTS `APLCTN_VRSN_CNTL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APLCTN_VRSN_CNTL` (
  `APLCTN_NM` varchar(12) NOT NULL,
  `VRSN_CD` varchar(8) NOT NULL,
  `DVC_NM` varchar(12) NOT NULL,
  `MRKT_CD` varchar(3) NOT NULL,
  `LANCH_DT` datetime(6) NOT NULL,
  `EXPRY_DT` datetime(6) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`APLCTN_NM`,`VRSN_CD`,`DVC_NM`,`MRKT_CD`),
  KEY `APLCTN_VRSN_CNTL_IF1` (`MRKT_CD`),
  CONSTRAINT `fk_aplctn_vrsn_cntl_mrkt` FOREIGN KEY (`MRKT_CD`) REFERENCES `MRKT_LKUP` (`MRKT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APLCTN_VRSN_CNTL`
--

LOCK TABLES `APLCTN_VRSN_CNTL` WRITE;
/*!40000 ALTER TABLE `APLCTN_VRSN_CNTL` DISABLE KEYS */;
/*!40000 ALTER TABLE `APLCTN_VRSN_CNTL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CKLIST_APRVL`
--

DROP TABLE IF EXISTS `CKLIST_APRVL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CKLIST_APRVL` (
  `CKLIST_APRVL_RCRD_KY` int(11) NOT NULL,
  `MRKT_CD` varchar(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `ENTY_NM` varchar(40) NOT NULL,
  `MDL_YR_NB` decimal(5,1) NOT NULL,
  `MDL_LN_CD` varchar(3) NOT NULL,
  `CHNG_TS` datetime(6) NOT NULL,
  `CHNG_USR_ID` varchar(40) DEFAULT NULL,
  `APRVR_ACTVTY_CD` char(1) DEFAULT NULL,
  `APRVR_CMNT_TX` varchar(256) DEFAULT NULL,
  `APRVR_ACTVTY_TS` datetime(6) DEFAULT NULL,
  `APRVR_USR_ID` varchar(40) DEFAULT NULL,
  `PRCSD_IN` char(1) NOT NULL,
  `PRCSD_TS` datetime(6) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CKLIST_APRVL_RCRD_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CKLIST_APRVL`
--

LOCK TABLES `CKLIST_APRVL` WRITE;
/*!40000 ALTER TABLE `CKLIST_APRVL` DISABLE KEYS */;
/*!40000 ALTER TABLE `CKLIST_APRVL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLNT`
--

DROP TABLE IF EXISTS `CLNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLNT` (
  `CLNT_KY` int(11) NOT NULL,
  `PRSNL_HSH_ID` varchar(100) NOT NULL,
  `PRFX_NM` varchar(10) DEFAULT NULL,
  `SFX_NM` varchar(10) DEFAULT NULL,
  `FRST_NM` varchar(30) NOT NULL,
  `MIDL_NM` varchar(30) DEFAULT NULL,
  `LST_NM` varchar(30) NOT NULL,
  `PRFRD_LNG_CD` varchar(5) NOT NULL,
  `PRFRD_PHN_TYP_CD` char(1) NOT NULL,
  `PRFRD_EML_TYP_CD` char(1) NOT NULL,
  `CMPNY_NM` varchar(75) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CLNT_KY`),
  KEY `CLNT_AK1` (`FRST_NM`,`LST_NM`),
  KEY `CLNT_IF1` (`PRFRD_LNG_CD`),
  KEY `CLNT_IF2` (`PRFRD_PHN_TYP_CD`),
  KEY `CLNT_IF3` (`PRFRD_EML_TYP_CD`),
  CONSTRAINT `fk_clnt_eml_typ` FOREIGN KEY (`PRFRD_EML_TYP_CD`) REFERENCES `EML_TYP_LKUP` (`EML_TYP_CD`),
  CONSTRAINT `fk_clnt_lng` FOREIGN KEY (`PRFRD_LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`),
  CONSTRAINT `fk_clnt_phn_typ` FOREIGN KEY (`PRFRD_PHN_TYP_CD`) REFERENCES `PHN_TYP_LKUP` (`PHN_TYP_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLNT`
--

LOCK TABLES `CLNT` WRITE;
/*!40000 ALTER TABLE `CLNT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLNT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLNT_ADRS`
--

DROP TABLE IF EXISTS `CLNT_ADRS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLNT_ADRS` (
  `CLNT_KY` int(11) NOT NULL,
  `ADRS_LN_1_TX` varchar(100) NOT NULL,
  `ADRS_LN_2_TX` varchar(100) DEFAULT NULL,
  `CTY_NM` varchar(55) NOT NULL,
  `ST_CD` char(2) NOT NULL,
  `PSTL_CD` varchar(10) NOT NULL,
  `CNTRY_CD` char(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CLNT_KY`),
  KEY `CLNT_ADRS_IF2` (`CNTRY_CD`),
  KEY `CLNT_ADRS_IF3` (`CNTRY_CD`,`ST_CD`),
  KEY `fk_clnt_adrs_st` (`CNTRY_CD`,`ST_CD`,`LNG_CD`),
  CONSTRAINT `fk_clnt_adrs_clnt` FOREIGN KEY (`CLNT_KY`) REFERENCES `CLNT` (`CLNT_KY`),
  CONSTRAINT `fk_clnt_adrs_cntry` FOREIGN KEY (`CNTRY_CD`) REFERENCES `CNTRY_LKUP` (`CNTRY_CD`),
  CONSTRAINT `fk_clnt_adrs_st` FOREIGN KEY (`CNTRY_CD`, `ST_CD`, `LNG_CD`) REFERENCES `ST_LKUP` (`CNTRY_CD`, `ST_CD`, `LNG_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLNT_ADRS`
--

LOCK TABLES `CLNT_ADRS` WRITE;
/*!40000 ALTER TABLE `CLNT_ADRS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLNT_ADRS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLNT_EML`
--

DROP TABLE IF EXISTS `CLNT_EML`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLNT_EML` (
  `CLNT_KY` int(11) NOT NULL,
  `EML_TYP_CD` char(1) NOT NULL,
  `EML_ID` varchar(120) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CLNT_KY`,`EML_TYP_CD`),
  KEY `CLNT_EML_IF1` (`CLNT_KY`),
  KEY `CLNT_EML_IF2` (`EML_TYP_CD`),
  CONSTRAINT `fk_clnt_eml_clnt` FOREIGN KEY (`CLNT_KY`) REFERENCES `CLNT` (`CLNT_KY`),
  CONSTRAINT `fk_clnt_eml_eml_typ` FOREIGN KEY (`EML_TYP_CD`) REFERENCES `EML_TYP_LKUP` (`EML_TYP_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLNT_EML`
--

LOCK TABLES `CLNT_EML` WRITE;
/*!40000 ALTER TABLE `CLNT_EML` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLNT_EML` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLNT_GRP`
--

DROP TABLE IF EXISTS `CLNT_GRP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLNT_GRP` (
  `CLNT_KY` int(11) NOT NULL,
  `OPRTNY_KY` int(11) NOT NULL,
  `PRMRY_IN` char(1) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CLNT_KY`,`OPRTNY_KY`),
  KEY `CLNT_GRP_IF1` (`CLNT_KY`),
  KEY `fk_clnt_grp_oprtny_idx` (`OPRTNY_KY`),
  CONSTRAINT `fk_clnt_grp_clnt` FOREIGN KEY (`CLNT_KY`) REFERENCES `CLNT` (`CLNT_KY`),
  CONSTRAINT `fk_clnt_grp_oprtny` FOREIGN KEY (`OPRTNY_KY`) REFERENCES `OPRTNY` (`OPRTNY_KY`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLNT_GRP`
--

LOCK TABLES `CLNT_GRP` WRITE;
/*!40000 ALTER TABLE `CLNT_GRP` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLNT_GRP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLNT_ID_NM_LKUP`
--

DROP TABLE IF EXISTS `CLNT_ID_NM_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLNT_ID_NM_LKUP` (
  `CLNT_ID_NM_KY` int(11) NOT NULL,
  `MRKT_CD` varchar(3) NOT NULL,
  `CLNT_ID_NM` varchar(75) NOT NULL,
  `CLNT_ID_SRC_NM` varchar(75) NOT NULL,
  `CLNT_ID_SHRT_DS` varchar(150) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CLNT_ID_NM_KY`),
  KEY `CLNT_ID_NM_LKUP_IF1` (`MRKT_CD`),
  CONSTRAINT `fk_clnt_id_nm_lkup_mrkt` FOREIGN KEY (`MRKT_CD`) REFERENCES `MRKT_LKUP` (`MRKT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLNT_ID_NM_LKUP`
--

LOCK TABLES `CLNT_ID_NM_LKUP` WRITE;
/*!40000 ALTER TABLE `CLNT_ID_NM_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLNT_ID_NM_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLNT_ID_VLU`
--

DROP TABLE IF EXISTS `CLNT_ID_VLU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLNT_ID_VLU` (
  `CLNT_KY` int(11) NOT NULL,
  `CLNT_ID_NM_KY` int(11) NOT NULL,
  `CLNT_ID_VLU_TX` varchar(75) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CLNT_KY`,`CLNT_ID_NM_KY`),
  KEY `CLNT_ID_VLU_IF1` (`CLNT_KY`),
  KEY `CLNT_ID_VLU_IF2` (`CLNT_ID_NM_KY`),
  CONSTRAINT `fk_clnt_id_vlu_clnt` FOREIGN KEY (`CLNT_KY`) REFERENCES `CLNT` (`CLNT_KY`),
  CONSTRAINT `fk_clnt_id_vlu_clnt_id_nm` FOREIGN KEY (`CLNT_ID_NM_KY`) REFERENCES `CLNT_ID_NM_LKUP` (`CLNT_ID_NM_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLNT_ID_VLU`
--

LOCK TABLES `CLNT_ID_VLU` WRITE;
/*!40000 ALTER TABLE `CLNT_ID_VLU` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLNT_ID_VLU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLNT_PHN`
--

DROP TABLE IF EXISTS `CLNT_PHN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLNT_PHN` (
  `CLNT_KY` int(11) NOT NULL,
  `PHN_TYP_CD` char(1) NOT NULL,
  `PHN_CNTRY_CD` varchar(5) NOT NULL,
  `PHN_NB` bigint(20) NOT NULL,
  `MBL_CARR_LKUP_KY` varchar(45) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CLNT_KY`,`PHN_TYP_CD`),
  KEY `CLNT_PHN_IF1` (`CLNT_KY`),
  KEY `CLNT_PHN_IF2` (`PHN_TYP_CD`),
  KEY `fk_clnt_phn_mbl_carr_lkup` (`MBL_CARR_LKUP_KY`),
  CONSTRAINT `fk_clnt_phn_clnt` FOREIGN KEY (`CLNT_KY`) REFERENCES `CLNT` (`CLNT_KY`),
  CONSTRAINT `fk_clnt_phn_mbl_carr_lkup` FOREIGN KEY (`MBL_CARR_LKUP_KY`) REFERENCES `MBL_CARR_LKUP` (`MBL_CARR_LKUP_KY`),
  CONSTRAINT `fk_clnt_phn_phn_typ` FOREIGN KEY (`PHN_TYP_CD`) REFERENCES `PHN_TYP_LKUP` (`PHN_TYP_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLNT_PHN`
--

LOCK TABLES `CLNT_PHN` WRITE;
/*!40000 ALTER TABLE `CLNT_PHN` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLNT_PHN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLNT_PRFX_NM_LKUP`
--

DROP TABLE IF EXISTS `CLNT_PRFX_NM_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLNT_PRFX_NM_LKUP` (
  `LNG_CD` varchar(5) NOT NULL,
  `PRFX_NM` varchar(40) NOT NULL,
  `MRKT_CD` varchar(3) NOT NULL,
  `PRFX_CD` varchar(8) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `CLNT_PRFX_NM_LKUP_PK` (`LNG_CD`,`PRFX_NM`,`MRKT_CD`),
  KEY `fk_clnt_prfx_nm_mrkt_cd` (`MRKT_CD`),
  CONSTRAINT `fk_clnt_prfx_nm_lkup_lng` FOREIGN KEY (`LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`),
  CONSTRAINT `fk_clnt_prfx_nm_mrkt_cd` FOREIGN KEY (`MRKT_CD`) REFERENCES `MRKT_LKUP` (`MRKT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLNT_PRFX_NM_LKUP`
--

LOCK TABLES `CLNT_PRFX_NM_LKUP` WRITE;
/*!40000 ALTER TABLE `CLNT_PRFX_NM_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLNT_PRFX_NM_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLNT_VHCL_PRFRNC`
--

DROP TABLE IF EXISTS `CLNT_VHCL_PRFRNC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLNT_VHCL_PRFRNC` (
  `CLNT_KY` int(11) NOT NULL,
  `VHCL_PRFRNC_CD` char(2) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CLNT_KY`,`VHCL_PRFRNC_CD`),
  CONSTRAINT `fk_clnt_vhcl_prfrnc_clnt` FOREIGN KEY (`CLNT_KY`) REFERENCES `CLNT` (`CLNT_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLNT_VHCL_PRFRNC`
--

LOCK TABLES `CLNT_VHCL_PRFRNC` WRITE;
/*!40000 ALTER TABLE `CLNT_VHCL_PRFRNC` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLNT_VHCL_PRFRNC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CNFGTR_SRCH_DTL`
--

DROP TABLE IF EXISTS `CNFGTR_SRCH_DTL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CNFGTR_SRCH_DTL` (
  `SRCH_KY` int(11) NOT NULL,
  `SRCH_CRTRA_LBL_TX` varchar(75) NOT NULL,
  `SRCH_CRTRA_VLU_CD` varchar(36) NOT NULL,
  `MK_CD` char(2) NOT NULL,
  `MDL_YR_NB` decimal(5,1) NOT NULL,
  `MDL_LN_CD` varchar(3) NOT NULL,
  `MKTG_CPY_VRSN_DS` varchar(75) NOT NULL,
  `OPRTNY_KY` int(11) NOT NULL,
  `DLRSHP_KY` int(11) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SRCH_KY`,`SRCH_CRTRA_LBL_TX`,`SRCH_CRTRA_VLU_CD`),
  KEY `CNFGTR_SRCH_DTL_IF1` (`DLRSHP_KY`),
  KEY `CNFGTR_SRCH_DTL_IF2` (`OPRTNY_KY`),
  CONSTRAINT `fk_cnfgtr_srch_dtl_dlrshp` FOREIGN KEY (`DLRSHP_KY`) REFERENCES `DLRSHP` (`DLRSHP_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CNFGTR_SRCH_DTL`
--

LOCK TABLES `CNFGTR_SRCH_DTL` WRITE;
/*!40000 ALTER TABLE `CNFGTR_SRCH_DTL` DISABLE KEYS */;
/*!40000 ALTER TABLE `CNFGTR_SRCH_DTL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CNFGTR_SRCH_RSLT`
--

DROP TABLE IF EXISTS `CNFGTR_SRCH_RSLT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CNFGTR_SRCH_RSLT` (
  `SRCH_KY` int(11) NOT NULL,
  `RSLT_CN` int(11) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SRCH_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CNFGTR_SRCH_RSLT`
--

LOCK TABLES `CNFGTR_SRCH_RSLT` WRITE;
/*!40000 ALTER TABLE `CNFGTR_SRCH_RSLT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CNFGTR_SRCH_RSLT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CNTRY_LKUP`
--

DROP TABLE IF EXISTS `CNTRY_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CNTRY_LKUP` (
  `CNTRY_CD` char(3) NOT NULL,
  `CNTRY_NM` varchar(75) NOT NULL,
  `ITRTNL_PHN_CD` varchar(4) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CNTRY_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CNTRY_LKUP`
--

LOCK TABLES `CNTRY_LKUP` WRITE;
/*!40000 ALTER TABLE `CNTRY_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `CNTRY_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DLRSHP`
--

DROP TABLE IF EXISTS `DLRSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DLRSHP` (
  `DLRSHP_KY` int(11) NOT NULL,
  `DLR_NB` varchar(6) NOT NULL,
  `AFLT_CD` char(3) NOT NULL,
  `MRKT_CD` varchar(3) NOT NULL,
  `DLRSHP_NM` varchar(55) NOT NULL,
  `CMPNY_WBST_ID` varchar(1000) DEFAULT NULL,
  `SVC_BKNG_WBST_ID` varchar(1000) DEFAULT NULL,
  `NGTN_WBST_ID` varchar(1000) DEFAULT NULL,
  `DLVRY_EML_ID` varchar(120) DEFAULT NULL,
  `NTFCTN_1_EML_ID` varchar(120) DEFAULT NULL,
  `APLCTN_ACS_LVL_NB` decimal(38,0) NOT NULL,
  `PRVCY_URL_TX` varchar(1000) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DLRSHP_KY`),
  KEY `DLRSHP_IF1` (`MRKT_CD`),
  CONSTRAINT `fk_dlrshp_mrkt` FOREIGN KEY (`MRKT_CD`) REFERENCES `MRKT_LKUP` (`MRKT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DLRSHP`
--

LOCK TABLES `DLRSHP` WRITE;
/*!40000 ALTER TABLE `DLRSHP` DISABLE KEYS */;
/*!40000 ALTER TABLE `DLRSHP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DLRSHP_GRP`
--

DROP TABLE IF EXISTS `DLRSHP_GRP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DLRSHP_GRP` (
  `DLRSHP_GRP_KY` int(11) NOT NULL,
  `DLRSHP_KY` int(11) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DLRSHP_GRP_KY`),
  KEY `DLRSHP_GRP_IF1` (`DLRSHP_KY`),
  CONSTRAINT `fk_dlrshp_grp_dlr` FOREIGN KEY (`DLRSHP_KY`) REFERENCES `DLRSHP` (`DLRSHP_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DLRSHP_GRP`
--

LOCK TABLES `DLRSHP_GRP` WRITE;
/*!40000 ALTER TABLE `DLRSHP_GRP` DISABLE KEYS */;
/*!40000 ALTER TABLE `DLRSHP_GRP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DLR_USR_NTFCTN_STTNG`
--

DROP TABLE IF EXISTS `DLR_USR_NTFCTN_STTNG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DLR_USR_NTFCTN_STTNG` (
  `DLR_USR_NTFCTN_KY` int(11) NOT NULL,
  `DLRSHP_KY` int(11) NOT NULL,
  `DLR_USR_NM` varchar(15) NOT NULL,
  `EML_ID` varchar(120) DEFAULT NULL,
  `MBL_PHN_NB` bigint(20) DEFAULT NULL,
  `MBL_CARR_LKUP_KY` varchar(45) DEFAULT NULL,
  `NTFCTN_EVNT_TYP_CD` char(1) NOT NULL,
  `ACTV_IN` char(1) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DLR_USR_NTFCTN_KY`),
  KEY `DLR_USR_NTFCTN_STTNG_IF1` (`DLRSHP_KY`),
  KEY `fk_dlr_usr_ntfctn_mbl_carr_ky` (`MBL_CARR_LKUP_KY`),
  CONSTRAINT `fk_dlr_usr_ntfctn_mbl_carr_ky` FOREIGN KEY (`MBL_CARR_LKUP_KY`) REFERENCES `MBL_CARR_LKUP` (`MBL_CARR_LKUP_KY`),
  CONSTRAINT `fk_dlr_usr_ntfctn_sttng_dlr` FOREIGN KEY (`DLRSHP_KY`) REFERENCES `DLRSHP` (`DLRSHP_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DLR_USR_NTFCTN_STTNG`
--

LOCK TABLES `DLR_USR_NTFCTN_STTNG` WRITE;
/*!40000 ALTER TABLE `DLR_USR_NTFCTN_STTNG` DISABLE KEYS */;
/*!40000 ALTER TABLE `DLR_USR_NTFCTN_STTNG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DLR_USR_PSTN_LKUP`
--

DROP TABLE IF EXISTS `DLR_USR_PSTN_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DLR_USR_PSTN_LKUP` (
  `PSTN_CD` varchar(8) NOT NULL,
  `CHNL_CD` char(2) NOT NULL,
  `FNCTN_CD` varchar(8) NOT NULL,
  `PSTN_NM` varchar(40) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PSTN_CD`,`CHNL_CD`),
  KEY `DLR_USR_PSTN_LKUP_IF1` (`FNCTN_CD`),
  CONSTRAINT `fk_dlr_usr_pstn_lkup_fn_cd` FOREIGN KEY (`FNCTN_CD`) REFERENCES `FNCTN_CD_LKUP` (`FNCTN_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DLR_USR_PSTN_LKUP`
--

LOCK TABLES `DLR_USR_PSTN_LKUP` WRITE;
/*!40000 ALTER TABLE `DLR_USR_PSTN_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `DLR_USR_PSTN_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DLR_USR_PSTN_OVRRD`
--

DROP TABLE IF EXISTS `DLR_USR_PSTN_OVRRD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DLR_USR_PSTN_OVRRD` (
  `DLR_USR_NM` varchar(15) NOT NULL,
  `DLRSHP_KY` int(11) NOT NULL,
  `CHNL_CD` char(2) NOT NULL,
  `OVRRD_PSTN_CD` varchar(8) NOT NULL,
  `OVRRD_PSTN_EXPRY_DT` datetime(6) NOT NULL,
  `OVRRD_BY_USR_NM` varchar(15) NOT NULL,
  `OVRRD_TS` datetime(6) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DLR_USR_NM`,`DLRSHP_KY`),
  KEY `DLR_USR_PSTN_OVRRD_IF1` (`OVRRD_PSTN_CD`,`CHNL_CD`),
  KEY `DLR_USR_PSTN_OVRRD_IF2` (`DLRSHP_KY`),
  CONSTRAINT `fk_dlr_usr_pstn_ovrrd_dlr` FOREIGN KEY (`DLRSHP_KY`) REFERENCES `DLRSHP` (`DLRSHP_KY`),
  CONSTRAINT `fk_dlr_usr_pstn_ovrrd_pstn_cd` FOREIGN KEY (`OVRRD_PSTN_CD`, `CHNL_CD`) REFERENCES `DLR_USR_PSTN_LKUP` (`PSTN_CD`, `CHNL_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DLR_USR_PSTN_OVRRD`
--

LOCK TABLES `DLR_USR_PSTN_OVRRD` WRITE;
/*!40000 ALTER TABLE `DLR_USR_PSTN_OVRRD` DISABLE KEYS */;
/*!40000 ALTER TABLE `DLR_USR_PSTN_OVRRD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DLVRY_CKLIST`
--

DROP TABLE IF EXISTS `DLVRY_CKLIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DLVRY_CKLIST` (
  `DLVRY_CKLIST_KY` int(11) NOT NULL,
  `MRKT_CD` varchar(3) NOT NULL,
  `VHCL_MK_CD` char(2) NOT NULL,
  `MDL_YR_NB` decimal(5,1) NOT NULL,
  `MDL_LN_CD` varchar(3) NOT NULL,
  `SRC_FEATR_ID` varchar(20) NOT NULL,
  `DSPLY_CTGRY_ID` varchar(10) DEFAULT NULL,
  `STP_GRP_ID` varchar(20) DEFAULT NULL,
  `MKTG_CPY_ID` varchar(40) DEFAULT NULL,
  `RCMNDD_IN` char(1) NOT NULL,
  `VDO_LNK_ID` varchar(20) DEFAULT NULL,
  `DSPLY_VDO_IN` char(1) NOT NULL DEFAULT 'N',
  `WBST_CTGRY_TX` varchar(125) DEFAULT NULL,
  `WBST_SBCTGY_TX` varchar(125) DEFAULT NULL,
  `ACTV_IN` char(1) NOT NULL,
  `GNRC_CKLIST_IN` char(1) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DLVRY_CKLIST_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DLVRY_CKLIST`
--

LOCK TABLES `DLVRY_CKLIST` WRITE;
/*!40000 ALTER TABLE `DLVRY_CKLIST` DISABLE KEYS */;
/*!40000 ALTER TABLE `DLVRY_CKLIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DLVRY_CKLIST_CTGRY`
--

DROP TABLE IF EXISTS `DLVRY_CKLIST_CTGRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DLVRY_CKLIST_CTGRY` (
  `MRKT_CD` varchar(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `DSPLY_CTGRY_ID` varchar(10) NOT NULL,
  `DSPLY_CTGRY_NM` varchar(75) NOT NULL,
  `SRT_NB` int(11) NOT NULL,
  `ACTV_IN` char(1) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MRKT_CD`,`LNG_CD`,`DSPLY_CTGRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DLVRY_CKLIST_CTGRY`
--

LOCK TABLES `DLVRY_CKLIST_CTGRY` WRITE;
/*!40000 ALTER TABLE `DLVRY_CKLIST_CTGRY` DISABLE KEYS */;
/*!40000 ALTER TABLE `DLVRY_CKLIST_CTGRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DLVRY_CKLIST_FEATR_SLCTD`
--

DROP TABLE IF EXISTS `DLVRY_CKLIST_FEATR_SLCTD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DLVRY_CKLIST_FEATR_SLCTD` (
  `OPRTNY_KY` int(11) NOT NULL,
  `DLVRY_CKLIST_KY` int(11) NOT NULL,
  `CMPLTD_IN` char(1) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OPRTNY_KY`,`DLVRY_CKLIST_KY`),
  KEY `DLVRY_CKLIST_FEATR_SLCTD_IF1` (`OPRTNY_KY`),
  KEY `DLVRY_CKLIST_FEATR_SLCTD_IF2` (`DLVRY_CKLIST_KY`),
  CONSTRAINT `fk_dc_featr_slctd_dc` FOREIGN KEY (`DLVRY_CKLIST_KY`) REFERENCES `DLVRY_CKLIST` (`DLVRY_CKLIST_KY`),
  CONSTRAINT `fk_dc_featr_slctd_oprtny` FOREIGN KEY (`OPRTNY_KY`) REFERENCES `OPRTNY` (`OPRTNY_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DLVRY_CKLIST_FEATR_SLCTD`
--

LOCK TABLES `DLVRY_CKLIST_FEATR_SLCTD` WRITE;
/*!40000 ALTER TABLE `DLVRY_CKLIST_FEATR_SLCTD` DISABLE KEYS */;
/*!40000 ALTER TABLE `DLVRY_CKLIST_FEATR_SLCTD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DLVRY_CKLIST_MKTG_CPY`
--

DROP TABLE IF EXISTS `DLVRY_CKLIST_MKTG_CPY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DLVRY_CKLIST_MKTG_CPY` (
  `MRKT_CD` varchar(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `MKTG_CPY_ID` varchar(40) NOT NULL,
  `MKTG_CPY_DS` varchar(1000) NOT NULL,
  `ACTV_IN` char(1) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MRKT_CD`,`LNG_CD`,`MKTG_CPY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DLVRY_CKLIST_MKTG_CPY`
--

LOCK TABLES `DLVRY_CKLIST_MKTG_CPY` WRITE;
/*!40000 ALTER TABLE `DLVRY_CKLIST_MKTG_CPY` DISABLE KEYS */;
/*!40000 ALTER TABLE `DLVRY_CKLIST_MKTG_CPY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DLVRY_CKLIST_STP`
--

DROP TABLE IF EXISTS `DLVRY_CKLIST_STP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DLVRY_CKLIST_STP` (
  `MRKT_CD` varchar(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `STP_GRP_ID` varchar(20) NOT NULL,
  `STP_NB` decimal(38,0) NOT NULL,
  `STP_DS` varchar(1000) NOT NULL,
  `ACTV_IN` char(1) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MRKT_CD`,`LNG_CD`,`STP_GRP_ID`,`STP_NB`),
  KEY `DLVRY_CKLIST_STP_IF1` (`MRKT_CD`,`LNG_CD`,`STP_GRP_ID`),
  CONSTRAINT `fk_dc_stp_dc_stp_grp` FOREIGN KEY (`MRKT_CD`, `LNG_CD`, `STP_GRP_ID`) REFERENCES `DLVRY_CKLIST_STP_GRP` (`MRKT_CD`, `LNG_CD`, `STP_GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DLVRY_CKLIST_STP`
--

LOCK TABLES `DLVRY_CKLIST_STP` WRITE;
/*!40000 ALTER TABLE `DLVRY_CKLIST_STP` DISABLE KEYS */;
/*!40000 ALTER TABLE `DLVRY_CKLIST_STP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DLVRY_CKLIST_STP_GRP`
--

DROP TABLE IF EXISTS `DLVRY_CKLIST_STP_GRP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DLVRY_CKLIST_STP_GRP` (
  `MRKT_CD` varchar(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `STP_GRP_ID` varchar(20) NOT NULL,
  `STP_GRP_DS` varchar(256) NOT NULL,
  `ACTV_IN` char(1) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MRKT_CD`,`LNG_CD`,`STP_GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DLVRY_CKLIST_STP_GRP`
--

LOCK TABLES `DLVRY_CKLIST_STP_GRP` WRITE;
/*!40000 ALTER TABLE `DLVRY_CKLIST_STP_GRP` DISABLE KEYS */;
/*!40000 ALTER TABLE `DLVRY_CKLIST_STP_GRP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EML_TYP_LKUP`
--

DROP TABLE IF EXISTS `EML_TYP_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EML_TYP_LKUP` (
  `EML_TYP_CD` char(1) NOT NULL,
  `EML_TYP_NM` varchar(40) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EML_TYP_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EML_TYP_LKUP`
--

LOCK TABLES `EML_TYP_LKUP` WRITE;
/*!40000 ALTER TABLE `EML_TYP_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `EML_TYP_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ERR_CD_LKUP`
--

DROP TABLE IF EXISTS `ERR_CD_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ERR_CD_LKUP` (
  `ERR_CD` varchar(8) NOT NULL,
  `ERR_DS` varchar(100) NOT NULL,
  `ERR_MSG_FRMT_TX` varchar(100) DEFAULT NULL,
  `RMRK_TX` varchar(256) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ERR_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ERR_CD_LKUP`
--

LOCK TABLES `ERR_CD_LKUP` WRITE;
/*!40000 ALTER TABLE `ERR_CD_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `ERR_CD_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ERR_DTL`
--

DROP TABLE IF EXISTS `ERR_DTL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ERR_DTL` (
  `ERR_KY` int(11) NOT NULL,
  `ERR_CD` varchar(8) NOT NULL,
  `ERR_MSG_TX` varchar(125) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ERR_KY`,`ERR_CD`),
  KEY `ERR_DTL_IF1` (`ERR_CD`),
  CONSTRAINT `fk_err_dtl_err_cd` FOREIGN KEY (`ERR_CD`) REFERENCES `ERR_CD_LKUP` (`ERR_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ERR_DTL`
--

LOCK TABLES `ERR_DTL` WRITE;
/*!40000 ALTER TABLE `ERR_DTL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ERR_DTL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEATR_VDO`
--

DROP TABLE IF EXISTS `FEATR_VDO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEATR_VDO` (
  `MRKT_CD` varchar(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `VDO_LNK_ID` varchar(20) NOT NULL,
  `MDL_YR_NB` decimal(5,1) NOT NULL,
  `MDL_LN_CD` varchar(3) NOT NULL,
  `VDO_DSPLY_TX` varchar(125) NOT NULL,
  `VDO_URL_TX` varchar(1000) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MRKT_CD`,`LNG_CD`,`VDO_LNK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEATR_VDO`
--

LOCK TABLES `FEATR_VDO` WRITE;
/*!40000 ALTER TABLE `FEATR_VDO` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEATR_VDO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FNCTN_CD_LKUP`
--

DROP TABLE IF EXISTS `FNCTN_CD_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FNCTN_CD_LKUP` (
  `FNCTN_CD` varchar(8) NOT NULL,
  `FNCTN_DS` varchar(150) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FNCTN_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FNCTN_CD_LKUP`
--

LOCK TABLES `FNCTN_CD_LKUP` WRITE;
/*!40000 ALTER TABLE `FNCTN_CD_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FNCTN_CD_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LNG_LKUP`
--

DROP TABLE IF EXISTS `LNG_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LNG_LKUP` (
  `LNG_CD` varchar(5) NOT NULL,
  `LNG_NM` varchar(40) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LNG_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LNG_LKUP`
--

LOCK TABLES `LNG_LKUP` WRITE;
/*!40000 ALTER TABLE `LNG_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `LNG_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MBL_CARR_LKUP`
--

DROP TABLE IF EXISTS `MBL_CARR_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MBL_CARR_LKUP` (
  `MBL_CARR_LKUP_KY` varchar(45) NOT NULL,
  `LNG_CD` varchar(5) DEFAULT NULL,
  `CNTRY_CD` char(3) NOT NULL,
  `MBL_CARR_CD` varchar(45) NOT NULL,
  `MBL_CARR_NM` varchar(40) NOT NULL,
  `MSG_URL_DMN_TX` varchar(100) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `MBL_CARR_LKUP_PK` (`MBL_CARR_LKUP_KY`),
  UNIQUE KEY `MBL_CARR_LKUP_AK1` (`CNTRY_CD`,`MBL_CARR_CD`),
  KEY `fk_mbl_carr_lkup_lng` (`LNG_CD`),
  CONSTRAINT `fk_mbl_carr_lkup_cntry` FOREIGN KEY (`CNTRY_CD`) REFERENCES `CNTRY_LKUP` (`CNTRY_CD`),
  CONSTRAINT `fk_mbl_carr_lkup_lng` FOREIGN KEY (`LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MBL_CARR_LKUP`
--

LOCK TABLES `MBL_CARR_LKUP` WRITE;
/*!40000 ALTER TABLE `MBL_CARR_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `MBL_CARR_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MRKT_LKUP`
--

DROP TABLE IF EXISTS `MRKT_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MRKT_LKUP` (
  `MRKT_CD` varchar(3) NOT NULL,
  `MRKT_NM` varchar(75) NOT NULL,
  `DFLT_LNG_CD` varchar(5) NOT NULL,
  `APLCBL_LNG_LIST_TX` varchar(75) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MRKT_CD`),
  KEY `MRKT_LKUP_IF1` (`DFLT_LNG_CD`),
  CONSTRAINT `fk_mrkt_lkup_lng` FOREIGN KEY (`DFLT_LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MRKT_LKUP`
--

LOCK TABLES `MRKT_LKUP` WRITE;
/*!40000 ALTER TABLE `MRKT_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `MRKT_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MSCLNS_DSPLY`
--

DROP TABLE IF EXISTS `MSCLNS_DSPLY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSCLNS_DSPLY` (
  `MSCLNS_DSPLY_ID` int(11) NOT NULL,
  `MRKT_CD` varchar(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `MSCLNS_DSPLY_CTGRY_TX` varchar(40) NOT NULL,
  `MSCLNS_DSPLY_SRC_TX` varchar(40) NOT NULL,
  `APLCTN_NM` varchar(12) NOT NULL,
  `DSPLY_TX` varchar(256) NOT NULL,
  `DSPLY_EVNT_ACTVTY_TYP_CD` char(2) NOT NULL,
  `DSPLY_SCRN_TX` varchar(40) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MSCLNS_DSPLY_ID`),
  KEY `MSCLNS_DSPLY_IF1` (`MRKT_CD`),
  KEY `MSCLNS_DSPLY_IF2` (`LNG_CD`),
  CONSTRAINT `fk_msclns_dsply_lng` FOREIGN KEY (`LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`),
  CONSTRAINT `fk_msclns_dsply_mrkt` FOREIGN KEY (`MRKT_CD`) REFERENCES `MRKT_LKUP` (`MRKT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MSCLNS_DSPLY`
--

LOCK TABLES `MSCLNS_DSPLY` WRITE;
/*!40000 ALTER TABLE `MSCLNS_DSPLY` DISABLE KEYS */;
/*!40000 ALTER TABLE `MSCLNS_DSPLY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MSCLNS_DSPLY_RSPNS`
--

DROP TABLE IF EXISTS `MSCLNS_DSPLY_RSPNS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSCLNS_DSPLY_RSPNS` (
  `OPRTNY_KY` int(11) NOT NULL,
  `MSCLNS_DSPLY_ID` int(11) NOT NULL,
  `MSCLNS_DSPLY_RSPNS_IN` char(1) NOT NULL,
  `CSTMR_RSPNS_TX` varchar(300) DEFAULT NULL,
  `SLS_CSLTNT_RSPNS_TX` varchar(300) DEFAULT NULL,
  `CSTMR_INTL_TX` varchar(30) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OPRTNY_KY`,`MSCLNS_DSPLY_ID`),
  KEY `MSCLNS_DSPLY_RSPNS_IF1` (`OPRTNY_KY`),
  KEY `MSCLNS_DSPLY_RSPNS_IF2` (`MSCLNS_DSPLY_ID`),
  CONSTRAINT `fk_msclns_dsply_rspns_msclns_d` FOREIGN KEY (`MSCLNS_DSPLY_ID`) REFERENCES `MSCLNS_DSPLY` (`MSCLNS_DSPLY_ID`),
  CONSTRAINT `fk_msclns_dsply_rspns_oprtny` FOREIGN KEY (`OPRTNY_KY`) REFERENCES `OPRTNY` (`OPRTNY_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MSCLNS_DSPLY_RSPNS`
--

LOCK TABLES `MSCLNS_DSPLY_RSPNS` WRITE;
/*!40000 ALTER TABLE `MSCLNS_DSPLY_RSPNS` DISABLE KEYS */;
/*!40000 ALTER TABLE `MSCLNS_DSPLY_RSPNS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPRTNY`
--

DROP TABLE IF EXISTS `OPRTNY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OPRTNY` (
  `OPRTNY_KY` int(11) NOT NULL,
  `CLNT_KY` int(11) NOT NULL,
  `CHNL_CD` char(2) NOT NULL,
  `DLRSHP_KY` int(11) NOT NULL,
  `OPRTNY_DT` datetime(6) NOT NULL,
  `CRNT_OPRTNY_ACTVTY_KY` int(11) NOT NULL,
  `DLVRY_CMPLT_DT` datetime(6) DEFAULT NULL,
  `DLVRY_VHCL_ID_NB` char(17) DEFAULT NULL,
  `DLVRY_NEW_USD_IN` char(1) DEFAULT NULL,
  `DLVRY_EML_ID` varchar(120) DEFAULT NULL,
  `PRVCY_APRVL_IN` char(1) NOT NULL,
  `PRVCY_APRVL_NM` varchar(75) DEFAULT NULL,
  `PRVCY_APRVL_PHN_NB` varchar(50) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OPRTNY_KY`),
  UNIQUE KEY `OPRTNY_AK1` (`OPRTNY_DT`),
  KEY `OPRTNY_IF2` (`DLRSHP_KY`),
  KEY `fk_oprtny_clnt_grp` (`CLNT_KY`),
  CONSTRAINT `fk_oprtny_clnt_grp` FOREIGN KEY (`CLNT_KY`) REFERENCES `CLNT_GRP` (`CLNT_KY`),
  CONSTRAINT `fk_oprtny_dlr` FOREIGN KEY (`DLRSHP_KY`) REFERENCES `DLRSHP` (`DLRSHP_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPRTNY`
--

LOCK TABLES `OPRTNY` WRITE;
/*!40000 ALTER TABLE `OPRTNY` DISABLE KEYS */;
/*!40000 ALTER TABLE `OPRTNY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPRTNY_ACTVTY`
--

DROP TABLE IF EXISTS `OPRTNY_ACTVTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OPRTNY_ACTVTY` (
  `OPRTNY_ACTVTY_KY` int(11) NOT NULL,
  `OPRTNY_KY` int(11) NOT NULL,
  `ACTVTY_TYP_CD` char(2) NOT NULL,
  `ACTVTY_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ACTVTY_USR_ID` varchar(60) DEFAULT NULL,
  `ACTVTY_USR_FULL_NM` varchar(75) DEFAULT NULL,
  `ACTVTY_NOTE_TX` varchar(1000) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OPRTNY_ACTVTY_KY`),
  KEY `OPRTNY_ACTVTY_IF1` (`OPRTNY_KY`),
  CONSTRAINT `fk_oprtny_actvty_oprtny` FOREIGN KEY (`OPRTNY_KY`) REFERENCES `OPRTNY` (`OPRTNY_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPRTNY_ACTVTY`
--

LOCK TABLES `OPRTNY_ACTVTY` WRITE;
/*!40000 ALTER TABLE `OPRTNY_ACTVTY` DISABLE KEYS */;
/*!40000 ALTER TABLE `OPRTNY_ACTVTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPRTNY_ACTVTY_TYP_LKUP`
--

DROP TABLE IF EXISTS `OPRTNY_ACTVTY_TYP_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OPRTNY_ACTVTY_TYP_LKUP` (
  `ACTVTY_TYP_CD` char(2) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `ACTVTY_TYP_NM` varchar(55) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `OPRTNY_ACTVTY_TYP_LKUP_AK1` (`ACTVTY_TYP_CD`,`LNG_CD`),
  KEY `OPRTNY_ACTVTY_TYP_LKUP_IF1` (`LNG_CD`),
  CONSTRAINT `fk_oprtny_actvty_typ_lkup_lng` FOREIGN KEY (`LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPRTNY_ACTVTY_TYP_LKUP`
--

LOCK TABLES `OPRTNY_ACTVTY_TYP_LKUP` WRITE;
/*!40000 ALTER TABLE `OPRTNY_ACTVTY_TYP_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `OPRTNY_ACTVTY_TYP_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHN_TYP_LKUP`
--

DROP TABLE IF EXISTS `PHN_TYP_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PHN_TYP_LKUP` (
  `PHN_TYP_CD` char(1) NOT NULL,
  `PHN_TYP_NM` varchar(40) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PHN_TYP_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHN_TYP_LKUP`
--

LOCK TABLES `PHN_TYP_LKUP` WRITE;
/*!40000 ALTER TABLE `PHN_TYP_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `PHN_TYP_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PR_DLVRY_CKLIST`
--

DROP TABLE IF EXISTS `PR_DLVRY_CKLIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PR_DLVRY_CKLIST` (
  `PR_DLVRY_CKLIST_KY` int(11) NOT NULL,
  `MRKT_CD` varchar(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `VHCL_MK_CD` char(2) NOT NULL,
  `ENGN_TYP_TX` varchar(40) NOT NULL,
  `PR_DLVRY_CKLIST_ITM_TX` varchar(1000) NOT NULL,
  `CTGRY_TX` varchar(125) NOT NULL,
  `SRT_NB` int(11) NOT NULL,
  `EXTND_DS` varchar(1000) DEFAULT NULL,
  `ACTV_IN` char(1) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PR_DLVRY_CKLIST_KY`),
  KEY `PR_DLVRY_CKLIST_IF1` (`MRKT_CD`),
  KEY `PR_DLVRY_CKLIST_IF2` (`LNG_CD`),
  CONSTRAINT `fk_pre_dlvry_cklist_lng` FOREIGN KEY (`LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`),
  CONSTRAINT `fk_pre_dlvry_cklist_mrkt` FOREIGN KEY (`MRKT_CD`) REFERENCES `MRKT_LKUP` (`MRKT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PR_DLVRY_CKLIST`
--

LOCK TABLES `PR_DLVRY_CKLIST` WRITE;
/*!40000 ALTER TABLE `PR_DLVRY_CKLIST` DISABLE KEYS */;
/*!40000 ALTER TABLE `PR_DLVRY_CKLIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PR_DLVRY_FEATR_SLCTD`
--

DROP TABLE IF EXISTS `PR_DLVRY_FEATR_SLCTD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PR_DLVRY_FEATR_SLCTD` (
  `OPRTNY_KY` int(11) NOT NULL,
  `PR_DLVRY_CKLIST_KY` int(11) NOT NULL,
  `CMPLTD_IN` char(1) NOT NULL,
  `NOTE_DS` varchar(1000) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OPRTNY_KY`,`PR_DLVRY_CKLIST_KY`),
  KEY `PR_DLVRY_FEATR_SLCTD_IF1` (`PR_DLVRY_CKLIST_KY`),
  KEY `PR_DLVRY_FEATR_SLCTD_IF2` (`OPRTNY_KY`),
  CONSTRAINT `fk_pre_dc_featr_slctd_oprtny` FOREIGN KEY (`OPRTNY_KY`) REFERENCES `OPRTNY` (`OPRTNY_KY`),
  CONSTRAINT `fk_pre_dc_featr_slctd_pre_dc` FOREIGN KEY (`PR_DLVRY_CKLIST_KY`) REFERENCES `PR_DLVRY_CKLIST` (`PR_DLVRY_CKLIST_KY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PR_DLVRY_FEATR_SLCTD`
--

LOCK TABLES `PR_DLVRY_FEATR_SLCTD` WRITE;
/*!40000 ALTER TABLE `PR_DLVRY_FEATR_SLCTD` DISABLE KEYS */;
/*!40000 ALTER TABLE `PR_DLVRY_FEATR_SLCTD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROAD_ABRVTN_LKUP`
--

DROP TABLE IF EXISTS `ROAD_ABRVTN_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROAD_ABRVTN_LKUP` (
  `MRKT_CD` varchar(3) NOT NULL,
  `ROAD_NM` varchar(40) NOT NULL,
  `ALTRNT_NM` varchar(40) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MRKT_CD`,`ROAD_NM`),
  KEY `ROAD_ABRVTN_LKUP_IF1` (`MRKT_CD`),
  CONSTRAINT `fk_rd_abrvtn_mrkt` FOREIGN KEY (`MRKT_CD`) REFERENCES `MRKT_LKUP` (`MRKT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROAD_ABRVTN_LKUP`
--

LOCK TABLES `ROAD_ABRVTN_LKUP` WRITE;
/*!40000 ALTER TABLE `ROAD_ABRVTN_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROAD_ABRVTN_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCHDLD_MNTNC_NOTC_ALRT`
--

DROP TABLE IF EXISTS `SCHDLD_MNTNC_NOTC_ALRT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCHDLD_MNTNC_NOTC_ALRT` (
  `MSG_ID` varchar(40) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `MRKT_CD` varchar(3) NOT NULL,
  `APLCTN_NM` varchar(40) NOT NULL,
  `STRT_TS` datetime(6) NOT NULL,
  `END_TS` datetime(6) NOT NULL,
  `MSG_TTL_TX` varchar(75) NOT NULL,
  `MSG_TX` varchar(1000) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `SCHDLD_MNTNC_NOTC_ALRT_PK` (`MSG_ID`,`LNG_CD`,`MRKT_CD`),
  KEY `fk_schdld_mntnc_notc_alrt_mrkt` (`MRKT_CD`),
  KEY `fk_schdld_mntnc_notc_alrt_lng` (`LNG_CD`),
  CONSTRAINT `fk_schdld_mntnc_notc_alrt_lng` FOREIGN KEY (`LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`),
  CONSTRAINT `fk_schdld_mntnc_notc_alrt_mrkt` FOREIGN KEY (`MRKT_CD`) REFERENCES `MRKT_LKUP` (`MRKT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCHDLD_MNTNC_NOTC_ALRT`
--

LOCK TABLES `SCHDLD_MNTNC_NOTC_ALRT` WRITE;
/*!40000 ALTER TABLE `SCHDLD_MNTNC_NOTC_ALRT` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCHDLD_MNTNC_NOTC_ALRT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SRC_FEATR_ID_LKUP`
--

DROP TABLE IF EXISTS `SRC_FEATR_ID_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SRC_FEATR_ID_LKUP` (
  `MRKT_CD` varchar(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `MDL_YR_NB` decimal(5,1) NOT NULL,
  `MDL_LN_CD` varchar(3) NOT NULL,
  `SRC_FEATR_ID` varchar(40) NOT NULL,
  `FEATR_DS` varchar(1000) NOT NULL,
  `SRC_SYSTM_NM` varchar(40) NOT NULL,
  `VHCL_MK_CD` char(2) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MRKT_CD`,`LNG_CD`,`MDL_YR_NB`,`MDL_LN_CD`,`SRC_FEATR_ID`),
  KEY `SRC_FEATR_ID_LKUP_IF1` (`MRKT_CD`),
  KEY `SRC_FEATR_ID_LKUP_IF2` (`LNG_CD`),
  CONSTRAINT `fk_src_featr_id_lkup_lng` FOREIGN KEY (`LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`),
  CONSTRAINT `fk_src_featr_id_lkup_mrkt` FOREIGN KEY (`MRKT_CD`) REFERENCES `MRKT_LKUP` (`MRKT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SRC_FEATR_ID_LKUP`
--

LOCK TABLES `SRC_FEATR_ID_LKUP` WRITE;
/*!40000 ALTER TABLE `SRC_FEATR_ID_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `SRC_FEATR_ID_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SSSN_TKN`
--

DROP TABLE IF EXISTS `SSSN_TKN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SSSN_TKN` (
  `TKN_ID` varchar(500) NOT NULL,
  `APLCTN_NM` varchar(12) NOT NULL,
  `TKN_CRTE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TKN_EXPRY_DT` datetime(6) NOT NULL,
  `DRTN_MIN_NB` int(11) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TKN_ID`,`APLCTN_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SSSN_TKN`
--

LOCK TABLES `SSSN_TKN` WRITE;
/*!40000 ALTER TABLE `SSSN_TKN` DISABLE KEYS */;
/*!40000 ALTER TABLE `SSSN_TKN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STG_DLVRY_CKLIST`
--

DROP TABLE IF EXISTS `STG_DLVRY_CKLIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STG_DLVRY_CKLIST` (
  `MRKT_CD` varchar(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `MDL_YR_NB` decimal(5,1) NOT NULL,
  `MDL_LN_CD` varchar(3) NOT NULL,
  `SRC_FEATR_ID` varchar(40) NOT NULL,
  `VHCL_MK_CD` char(2) NOT NULL,
  `DSPLY_CTGRY_ID` varchar(10) DEFAULT NULL,
  `STP_GRP_ID` varchar(20) DEFAULT NULL,
  `MKTG_CPY_ID` varchar(40) NOT NULL,
  `RCMNDD_IN` char(1) NOT NULL DEFAULT 'N',
  `VDO_LNK_ID` varchar(20) DEFAULT NULL,
  `DSPLY_VDO_IN` char(1) DEFAULT 'N',
  `WBST_CTGRY_TX` varchar(125) DEFAULT NULL,
  `WBST_SBCTGY_TX` varchar(125) DEFAULT NULL,
  `CHNG_TYP_CD` char(1) DEFAULT NULL,
  `ACTV_IN` char(1) NOT NULL,
  `EDTR_CMNT_TX` varchar(256) DEFAULT NULL,
  `FEATR_HS_IN` char(1) NOT NULL,
  `GNRC_CKLIST_IN` char(1) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MRKT_CD`,`LNG_CD`,`MDL_YR_NB`,`MDL_LN_CD`,`SRC_FEATR_ID`),
  KEY `STG_DLVRY_CKLIST_IF5` (`MRKT_CD`,`LNG_CD`,`VDO_LNK_ID`),
  KEY `STG_DLVRY_CKLIST_IF4` (`MRKT_CD`,`LNG_CD`,`STP_GRP_ID`),
  KEY `STG_DLVRY_CKLIST_IF2` (`MRKT_CD`,`LNG_CD`,`DSPLY_CTGRY_ID`),
  KEY `STG_DLVRY_CKLIST_IF3` (`MRKT_CD`,`LNG_CD`,`MKTG_CPY_ID`),
  CONSTRAINT `fk_stg_dc_featr_vdo` FOREIGN KEY (`MRKT_CD`, `LNG_CD`, `VDO_LNK_ID`) REFERENCES `FEATR_VDO` (`MRKT_CD`, `LNG_CD`, `VDO_LNK_ID`),
  CONSTRAINT `fk_stg_dc_src_featr_id` FOREIGN KEY (`MRKT_CD`, `LNG_CD`, `MDL_YR_NB`, `MDL_LN_CD`, `SRC_FEATR_ID`) REFERENCES `SRC_FEATR_ID_LKUP` (`MRKT_CD`, `LNG_CD`, `MDL_YR_NB`, `MDL_LN_CD`, `SRC_FEATR_ID`),
  CONSTRAINT `fk_stg_dc_stg_dc_ctrgy` FOREIGN KEY (`MRKT_CD`, `LNG_CD`, `DSPLY_CTGRY_ID`) REFERENCES `STG_DLVRY_CKLIST_CTGRY` (`MRKT_CD`, `LNG_CD`, `DSPLY_CTGRY_ID`),
  CONSTRAINT `fk_stg_dc_stg_dc_mktg_cpy` FOREIGN KEY (`MRKT_CD`, `LNG_CD`, `MKTG_CPY_ID`) REFERENCES `STG_DLVRY_CKLIST_MKTG_CPY` (`MRKT_CD`, `LNG_CD`, `MKTG_CPY_ID`),
  CONSTRAINT `fk_stg_dc_stg_dc_stp_grp` FOREIGN KEY (`MRKT_CD`, `LNG_CD`, `STP_GRP_ID`) REFERENCES `STG_DLVRY_CKLIST_STP_GRP` (`MRKT_CD`, `LNG_CD`, `STP_GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STG_DLVRY_CKLIST`
--

LOCK TABLES `STG_DLVRY_CKLIST` WRITE;
/*!40000 ALTER TABLE `STG_DLVRY_CKLIST` DISABLE KEYS */;
/*!40000 ALTER TABLE `STG_DLVRY_CKLIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STG_DLVRY_CKLIST_CTGRY`
--

DROP TABLE IF EXISTS `STG_DLVRY_CKLIST_CTGRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STG_DLVRY_CKLIST_CTGRY` (
  `MRKT_CD` varchar(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `DSPLY_CTGRY_ID` varchar(10) NOT NULL,
  `DSPLY_CTGRY_NM` varchar(150) NOT NULL,
  `SRT_NB` int(11) NOT NULL,
  `ACTV_IN` char(1) NOT NULL,
  `CHNG_TYP_CD` char(1) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MRKT_CD`,`LNG_CD`,`DSPLY_CTGRY_ID`),
  KEY `STG_DLVRY_CKLIST_CTGRY_IF1` (`MRKT_CD`),
  KEY `STG_DLVRY_CKLIST_CTGRY_IF2` (`LNG_CD`),
  CONSTRAINT `fk_stg_dc_ctgry_lng` FOREIGN KEY (`LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`),
  CONSTRAINT `fk_stg_dc_ctgry_mrkt` FOREIGN KEY (`MRKT_CD`) REFERENCES `MRKT_LKUP` (`MRKT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STG_DLVRY_CKLIST_CTGRY`
--

LOCK TABLES `STG_DLVRY_CKLIST_CTGRY` WRITE;
/*!40000 ALTER TABLE `STG_DLVRY_CKLIST_CTGRY` DISABLE KEYS */;
/*!40000 ALTER TABLE `STG_DLVRY_CKLIST_CTGRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STG_DLVRY_CKLIST_MKTG_CPY`
--

DROP TABLE IF EXISTS `STG_DLVRY_CKLIST_MKTG_CPY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STG_DLVRY_CKLIST_MKTG_CPY` (
  `MRKT_CD` varchar(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `MKTG_CPY_ID` varchar(40) NOT NULL,
  `MKTG_CPY_DS` varchar(1000) DEFAULT NULL,
  `CHNG_TYP_CD` char(1) DEFAULT NULL,
  `ACTV_IN` char(1) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MRKT_CD`,`LNG_CD`,`MKTG_CPY_ID`),
  KEY `STG_DLVRY_CKLIST_MKTG_CPY_IF1` (`MRKT_CD`),
  KEY `STG_DLVRY_CKLIST_MKTG_CPY_IF2` (`LNG_CD`),
  CONSTRAINT `fk_stg_dc_mktg_cpy_lng` FOREIGN KEY (`LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`),
  CONSTRAINT `fk_stg_dc_mktg_cpy_mrkt` FOREIGN KEY (`MRKT_CD`) REFERENCES `MRKT_LKUP` (`MRKT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STG_DLVRY_CKLIST_MKTG_CPY`
--

LOCK TABLES `STG_DLVRY_CKLIST_MKTG_CPY` WRITE;
/*!40000 ALTER TABLE `STG_DLVRY_CKLIST_MKTG_CPY` DISABLE KEYS */;
/*!40000 ALTER TABLE `STG_DLVRY_CKLIST_MKTG_CPY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STG_DLVRY_CKLIST_STP`
--

DROP TABLE IF EXISTS `STG_DLVRY_CKLIST_STP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STG_DLVRY_CKLIST_STP` (
  `LNG_CD` varchar(5) NOT NULL,
  `MRKT_CD` varchar(3) NOT NULL,
  `STP_GRP_ID` varchar(20) NOT NULL,
  `STP_NB` decimal(38,0) NOT NULL,
  `STP_DS` varchar(256) NOT NULL,
  `CHNG_TYP_CD` char(1) NOT NULL,
  `ACTV_IN` char(1) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LNG_CD`,`MRKT_CD`,`STP_GRP_ID`,`STP_NB`),
  KEY `STG_DLVRY_CKLIST_STP_IF1` (`MRKT_CD`,`LNG_CD`,`STP_GRP_ID`),
  CONSTRAINT `fk_stg_dc_stp_stg_dc_stp_grp` FOREIGN KEY (`MRKT_CD`, `LNG_CD`, `STP_GRP_ID`) REFERENCES `STG_DLVRY_CKLIST_STP_GRP` (`MRKT_CD`, `LNG_CD`, `STP_GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STG_DLVRY_CKLIST_STP`
--

LOCK TABLES `STG_DLVRY_CKLIST_STP` WRITE;
/*!40000 ALTER TABLE `STG_DLVRY_CKLIST_STP` DISABLE KEYS */;
/*!40000 ALTER TABLE `STG_DLVRY_CKLIST_STP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STG_DLVRY_CKLIST_STP_GRP`
--

DROP TABLE IF EXISTS `STG_DLVRY_CKLIST_STP_GRP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STG_DLVRY_CKLIST_STP_GRP` (
  `MRKT_CD` varchar(3) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `STP_GRP_ID` varchar(20) NOT NULL,
  `STP_GRP_DS` varchar(256) NOT NULL,
  `CHNG_TYP_CD` char(1) NOT NULL,
  `ACTV_IN` char(1) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MRKT_CD`,`LNG_CD`,`STP_GRP_ID`),
  KEY `STG_DLVRY_CKLIST_STP_GRP_IF1` (`MRKT_CD`),
  KEY `STG_DLVRY_CKLIST_STP_GRP_IF2` (`LNG_CD`),
  CONSTRAINT `fk_stg_dc_stp_grp_lng` FOREIGN KEY (`LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`),
  CONSTRAINT `fk_stg_dc_stp_grp_mrkt` FOREIGN KEY (`MRKT_CD`) REFERENCES `MRKT_LKUP` (`MRKT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STG_DLVRY_CKLIST_STP_GRP`
--

LOCK TABLES `STG_DLVRY_CKLIST_STP_GRP` WRITE;
/*!40000 ALTER TABLE `STG_DLVRY_CKLIST_STP_GRP` DISABLE KEYS */;
/*!40000 ALTER TABLE `STG_DLVRY_CKLIST_STP_GRP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ST_LKUP`
--

DROP TABLE IF EXISTS `ST_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ST_LKUP` (
  `CNTRY_CD` char(3) NOT NULL,
  `ST_CD` char(2) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `ST_NM` varchar(75) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CNTRY_CD`,`ST_CD`,`LNG_CD`),
  KEY `fk_st_lkup_lng` (`LNG_CD`),
  CONSTRAINT `fk_st_lkup_cntry` FOREIGN KEY (`CNTRY_CD`) REFERENCES `CNTRY_LKUP` (`CNTRY_CD`),
  CONSTRAINT `fk_st_lkup_lng` FOREIGN KEY (`LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ST_LKUP`
--

LOCK TABLES `ST_LKUP` WRITE;
/*!40000 ALTER TABLE `ST_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `ST_LKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TST_DRV_VHCL`
--

DROP TABLE IF EXISTS `TST_DRV_VHCL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TST_DRV_VHCL` (
  `OPRTNY_KY` int(11) NOT NULL,
  `CLNT_KY` int(11) NOT NULL,
  `VIN` char(17) NOT NULL,
  `LTST_TST_DRV_DT` datetime(6) NOT NULL,
  `VHCL_SLCTD_IN` char(1) NOT NULL,
  `NEW_VHCL_IN` char(1) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `TST_DRV_VHCL_PK` (`OPRTNY_KY`,`CLNT_KY`,`VIN`),
  KEY `fk_tst_drv_vhcl_vin` (`VIN`),
  KEY `fk_tst_drv_vhcl_clnt_ky` (`CLNT_KY`),
  CONSTRAINT `fk_tst_drv_vhcl_clnt_ky` FOREIGN KEY (`CLNT_KY`) REFERENCES `CLNT` (`CLNT_KY`),
  CONSTRAINT `fk_tst_drv_vhcl_oprtny_ky` FOREIGN KEY (`OPRTNY_KY`) REFERENCES `OPRTNY` (`OPRTNY_KY`),
  CONSTRAINT `fk_tst_drv_vhcl_vin` FOREIGN KEY (`VIN`) REFERENCES `VHCL` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TST_DRV_VHCL`
--

LOCK TABLES `TST_DRV_VHCL` WRITE;
/*!40000 ALTER TABLE `TST_DRV_VHCL` DISABLE KEYS */;
/*!40000 ALTER TABLE `TST_DRV_VHCL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VHCL`
--

DROP TABLE IF EXISTS `VHCL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VHCL` (
  `VIN` char(17) NOT NULL,
  `VHCL_MK_CD` char(2) NOT NULL,
  `MDL_LN_CD` varchar(3) NOT NULL,
  `MDL_VRSN_NM` varchar(40) NOT NULL,
  `MDL_YR_NB` decimal(5,1) NOT NULL,
  `MSRP_AM` decimal(9,2) NOT NULL,
  `CRNCY_CD` char(3) NOT NULL,
  `VHCL_TYP_CD` char(1) NOT NULL,
  `STK_ID_NB` varchar(20) DEFAULT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDT_USR_ID` varchar(60) NOT NULL,
  `UPDT_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`VIN`),
  UNIQUE KEY `VHCL_PK` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VHCL`
--

LOCK TABLES `VHCL` WRITE;
/*!40000 ALTER TABLE `VHCL` DISABLE KEYS */;
/*!40000 ALTER TABLE `VHCL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VHCL_PRFRNC_LKUP`
--

DROP TABLE IF EXISTS `VHCL_PRFRNC_LKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VHCL_PRFRNC_LKUP` (
  `VHCL_PRFRNC_CD` char(2) NOT NULL,
  `LNG_CD` varchar(5) NOT NULL,
  `VHCL_PRFRNC_NM` varchar(55) NOT NULL,
  `CRTE_USR_ID` varchar(60) NOT NULL,
  `CRTE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `VHCL_PRFRNC_LKUP_AK1` (`VHCL_PRFRNC_CD`,`LNG_CD`),
  KEY `VHCL_PRFRNC_LKUP_IF1` (`LNG_CD`),
  CONSTRAINT `fk_vhcl_prfrnc_lkup_lng` FOREIGN KEY (`LNG_CD`) REFERENCES `LNG_LKUP` (`LNG_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VHCL_PRFRNC_LKUP`
--

LOCK TABLES `VHCL_PRFRNC_LKUP` WRITE;
/*!40000 ALTER TABLE `VHCL_PRFRNC_LKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `VHCL_PRFRNC_LKUP` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-06 14:18:38
