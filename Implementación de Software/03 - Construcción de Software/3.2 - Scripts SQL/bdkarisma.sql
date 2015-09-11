CREATE DATABASE  IF NOT EXISTS `bd_farmacia` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bd_farmacia`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_farmacia
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `t_boleta`
--

DROP TABLE IF EXISTS `t_boleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_boleta` (
  `nroBoleta` int(11) NOT NULL AUTO_INCREMENT,
  `codPedido` varchar(8) NOT NULL,
  PRIMARY KEY (`nroBoleta`),
  KEY `fk_boleta_pedido_idx` (`codPedido`),
  CONSTRAINT `fk_boleta_pedido` FOREIGN KEY (`codPedido`) REFERENCES `t_pedido` (`codPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_boleta`
--

LOCK TABLES `t_boleta` WRITE;
/*!40000 ALTER TABLE `t_boleta` DISABLE KEYS */;
INSERT INTO `t_boleta` VALUES (1,'15040001'),(3,'15040001'),(5,'15040001'),(7,'15040001'),(2,'15040002'),(4,'15040002'),(6,'15040002'),(8,'15040002'),(9,'15040003'),(10,'15040004'),(11,'15040005'),(12,'15040006'),(13,'15040007'),(14,'15040008'),(15,'15040009'),(16,'15040010'),(17,'15040011');
/*!40000 ALTER TABLE `t_boleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cantidadxpresentacio`
--

DROP TABLE IF EXISTS `t_cantidadxpresentacio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cantidadxpresentacio` (
  `codCantidadxPresentacion` int(5) NOT NULL AUTO_INCREMENT,
  `cantidad` varchar(45) DEFAULT NULL,
  `codPresentacion` int(5) NOT NULL,
  `estado` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`codCantidadxPresentacion`),
  KEY `fk_cantidad_presentacion_idx` (`codPresentacion`),
  CONSTRAINT `fk_cantidad_presentacion` FOREIGN KEY (`codPresentacion`) REFERENCES `t_presentacion` (`codPresentacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cantidadxpresentacio`
--

LOCK TABLES `t_cantidadxpresentacio` WRITE;
/*!40000 ALTER TABLE `t_cantidadxpresentacio` DISABLE KEYS */;
INSERT INTO `t_cantidadxpresentacio` VALUES (1,'10',1,'1'),(2,'100',1,'1'),(3,'200',1,'1'),(4,'1',2,'1');
/*!40000 ALTER TABLE `t_cantidadxpresentacio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_detallepedido`
--

DROP TABLE IF EXISTS `t_detallepedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_detallepedido` (
  `codPedido` varchar(8) NOT NULL,
  `codSucursal` int(5) NOT NULL,
  `codMedicamento` int(11) NOT NULL,
  `codCantidadxPresentacion` int(5) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precioTotal` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`codPedido`,`codMedicamento`,`codCantidadxPresentacion`,`codSucursal`),
  KEY `fk_detalle_medicamento_idx` (`codMedicamento`,`codCantidadxPresentacion`,`codSucursal`),
  CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`codPedido`) REFERENCES `t_pedido` (`codPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_pedido_sucursal_med_pres_cant` FOREIGN KEY (`codMedicamento`, `codCantidadxPresentacion`, `codSucursal`) REFERENCES `t_sucursal_presentacionxmedicamentos` (`codMedicamento`, `codCantxPresentacion`, `codSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_detallepedido`
--

LOCK TABLES `t_detallepedido` WRITE;
/*!40000 ALTER TABLE `t_detallepedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_detallepedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_distrito`
--

DROP TABLE IF EXISTS `t_distrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_distrito` (
  `codDistrito` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codDistrito`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_distrito`
--

LOCK TABLES `t_distrito` WRITE;
/*!40000 ALTER TABLE `t_distrito` DISABLE KEYS */;
INSERT INTO `t_distrito` VALUES (1,'Breña'),(2,'Jesus Maria'),(3,'Pueblo Libre'),(4,'San Isidro'),(5,'Lince'),(6,'Miraflores'),(7,'La Molina');
/*!40000 ALTER TABLE `t_distrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_estadopedido`
--

DROP TABLE IF EXISTS `t_estadopedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_estadopedido` (
  `codEstadoPedido` int(1) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`codEstadoPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_estadopedido`
--

LOCK TABLES `t_estadopedido` WRITE;
/*!40000 ALTER TABLE `t_estadopedido` DISABLE KEYS */;
INSERT INTO `t_estadopedido` VALUES (1,'Pendiente'),(2,'En Proceso'),(3,'Cancelado'),(4,'Terminado');
/*!40000 ALTER TABLE `t_estadopedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_medicamento`
--

DROP TABLE IF EXISTS `t_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_medicamento` (
  `codMedicamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`codMedicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_medicamento`
--

LOCK TABLES `t_medicamento` WRITE;
/*!40000 ALTER TABLE `t_medicamento` DISABLE KEYS */;
INSERT INTO `t_medicamento` VALUES (1,'APRONAX','1'),(2,'APRON-F','1'),(3,'ADIN-N','1'),(4,'AFLAMAX','1'),(5,'APROXIL','1'),(6,'APRODOL','1'),(7,'APROFORTE','1'),(8,'APROMEDIX','1'),(9,'APRONAX MUJER','1'),(10,'APROVIF','1'),(11,'APROX','1'),(12,'APROXANT N','1'),(13,'APROXIFLAM','1'),(14,'APROXIL','1'),(15,'APROXX-BRAND','1'),(16,'ASSONAX','1'),(17,'BACKANFLAM','1'),(18,'BIONAX','1'),(19,'BRIXONAX','1'),(20,'CONIPROX','1'),(21,'CUDEPROX','1'),(22,'DESINFLAM','1'),(23,'DICONAXX','1'),(24,'DOLMENST','1'),(25,'DOLOGINA MUJER','1'),(26,'DOLOGINA','1'),(27,'DOLOMES','1'),(28,'DOLOSPORT','1'),(29,'DOPROX','1'),(30,'DROPFANOXENO','1'),(31,'FEMICLER','1'),(32,'FEMINA FORTE','1'),(33,'FEMYNASS RD','1'),(34,'FLAXX','1'),(35,'GINEPROX','1'),(36,'GRUCONAX','1'),(37,'INDOL','1'),(38,'INFLAMAX','1'),(39,'IRAXEN','1'),(40,'LEFLEN','1'),(41,'LEXIFLAM','1'),(42,'LEXINAX','1'),(43,'MAXIFLAM','1'),(44,'MAXIFORT','1'),(45,'MEGALIVIO','1'),(46,'NACS','1'),(47,'NAFLAXIL','1'),(48,'NALEDYN SODICO','1'),(49,'NAPREX','1'),(50,'NAPRIND','1'),(51,'NAPROCOP','1'),(52,'NAPROCOP M','1'),(53,'NAPRODEL','1'),(54,'NAPROFAS','1'),(55,'NAPROFLOT','1'),(56,'NAPROL','1'),(57,'NAPROLER','1'),(58,'NAPROMED','1'),(59,'NAPRONEX TR EXTRA FORTE','1'),(60,'NAPROPHAR','1'),(61,'NAPROPLUS','1'),(62,'NAPROPOC','1'),(63,'NAPROSYN','1'),(64,'NAPROVEN','1'),(65,'NAPROX-C','1'),(66,'NAPROXAL','1'),(67,'NAPROXCOLL','1'),(68,'NAPROXENO','1'),(69,'NAPROXFARMA','1'),(70,'NAPROXXFILM','1'),(71,'NAPROXMEK','1'),(72,'NAPROXOL','1'),(73,'NAPROXPHARMAR','1'),(74,'NAPROXPORTY','1'),(75,'NAXODOL','1'),(76,'NOMAXEN','1'),(77,'NOPRAXIN','1'),(78,'ODONTOGESIC','1'),(79,'ONEXOL','1'),(80,'PAINFLEX','1'),(81,'PONSTAN RD','1'),(82,'PROMAXXFARMA','1'),(83,'PROMIZEN','1'),(84,'PROXIDOL','1'),(85,'SANARPOX','1'),(86,'SINATRIN','1'),(87,'TEDRAX','1'),(88,'TRADOMAX','1'),(89,'VIFANAX FORTE','1'),(90,'VITAPRONAX','1'),(91,'XENODOL','1'),(92,'XENOPROLAB','1');
/*!40000 ALTER TABLE `t_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pedido`
--

DROP TABLE IF EXISTS `t_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pedido` (
  `codPedido` varchar(8) NOT NULL,
  `fechaPedido` date DEFAULT NULL,
  `horaPedido` time DEFAULT NULL,
  `montoTotal` decimal(5,2) DEFAULT NULL,
  `montoCancelar` decimal(5,2) DEFAULT NULL,
  `codPersona` int(11) NOT NULL,
  `codEstadoPedido` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codPedido`),
  KEY `fk_pedido_persona_idx` (`codPersona`),
  KEY `fk_pedido_estadopedido_idx` (`codEstadoPedido`),
  CONSTRAINT `fk_pedido_estadopedido` FOREIGN KEY (`codEstadoPedido`) REFERENCES `t_estadopedido` (`codEstadoPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_persona` FOREIGN KEY (`codPersona`) REFERENCES `t_persona` (`codPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pedido`
--

LOCK TABLES `t_pedido` WRITE;
/*!40000 ALTER TABLE `t_pedido` DISABLE KEYS */;
INSERT INTO `t_pedido` VALUES ('15040001','2015-04-01','11:11:30',172.00,200.00,2,4),('15040002','2015-04-01','17:11:25',155.00,200.00,3,4),('15040003','2015-04-02','10:11:04',44.70,50.00,2,4),('15040004','2015-04-02','10:15:01',36.20,100.00,3,4),('15040005','2015-04-02','11:15:30',51.70,100.00,7,4),('15040006','2015-04-02','13:12:40',45.00,50.00,8,4),('15040007','2015-04-02','16:11:33',45.20,50.00,9,3),('15040008','2015-04-04','11:11:43',51.70,100.00,2,1),('15040009','2015-04-04','12:11:03',45.00,100.00,3,1),('15040010','2015-04-04','14:12:10',36.20,50.00,7,1),('15040011','2015-04-04','14:29:21',45.20,100.00,8,1),('15040012','2015-04-04','16:12:55',71.00,100.00,9,1),('15040013','2015-04-04','16:17:36',30.00,100.00,10,1),('15040014','2015-04-04','16:18:26',172.00,200.00,5,1),('15040015','2015-04-04','16:19:44',155.00,200.00,6,1);
/*!40000 ALTER TABLE `t_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_persona`
--

DROP TABLE IF EXISTS `t_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_persona` (
  `codPersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL,
  `dni` char(8) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `celular` int(9) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `correo` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `codDistrito` int(2) NOT NULL,
  `latitud` decimal(10,7) DEFAULT NULL,
  `longitud` decimal(10,7) DEFAULT NULL,
  `codigoPostal` int(6) DEFAULT NULL,
  PRIMARY KEY (`codPersona`),
  KEY `fk_persona_distrito_idx` (`codDistrito`),
  CONSTRAINT `fk_persona_distrito` FOREIGN KEY (`codDistrito`) REFERENCES `t_distrito` (`codDistrito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_persona`
--

LOCK TABLES `t_persona` WRITE;
/*!40000 ALTER TABLE `t_persona` DISABLE KEYS */;
INSERT INTO `t_persona` VALUES (1,'James','Gomez','Illatopa','75671416','1994-12-11',967768991,'Jr. La Paz 198 Sta Patricia',NULL,7,NULL,NULL,NULL),(2,'Gorki','LLerena','Jara','74193245','1992-07-14',987654321,'Jr. Asuncion 259',NULL,7,NULL,NULL,NULL),(3,'Juan','Zarate','Asturay','73671564','1993-08-11',987654123,'Jr. aires 324',NULL,7,NULL,NULL,NULL),(4,'Adrian','Rojas','Gozzer','70432342','1993-08-11',987654122,'Av. Arequipa 1860',NULL,5,NULL,NULL,NULL),(5,'Sandy','Sosa','Vargaz','70432341','1993-08-15',987654155,'Av. Arequipa 1810',NULL,5,NULL,NULL,NULL),(6,'Vanessa','Sovero','Torres','70432322','1993-11-20',987654129,'Av. Arequipa 1710',NULL,5,NULL,NULL,NULL),(7,'Jose','Torres','Valencia','70424553','1993-10-16',987654521,'Av. Constructores 184',NULL,7,NULL,NULL,NULL),(8,'Maria','Perez','Mendez','70424352','1993-11-15',987654643,'Jr. Curazao 174',NULL,7,NULL,NULL,NULL),(9,'Jesus','Gallardo','Limo','70424112','1993-12-15',987654958,'Jr. Brasilia 124',NULL,7,NULL,NULL,NULL),(10,'Ana','Meneses','Contreras','70424466','1993-05-15',987654195,'Av. Flora Tristan 224',NULL,7,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_presentacion`
--

DROP TABLE IF EXISTS `t_presentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_presentacion` (
  `codPresentacion` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `estado` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`codPresentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_presentacion`
--

LOCK TABLES `t_presentacion` WRITE;
/*!40000 ALTER TABLE `t_presentacion` DISABLE KEYS */;
INSERT INTO `t_presentacion` VALUES (1,'BLISTER','1'),(2,'SUSPENSION ORAL','1'),(3,'INYECTABLE','1'),(4,'COMPRIMIDOS','1'),(5,'CAPSULAS','1'),(6,'UNGUENTO','1');
/*!40000 ALTER TABLE `t_presentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_presentacionxmedicamento`
--

DROP TABLE IF EXISTS `t_presentacionxmedicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_presentacionxmedicamento` (
  `codMedicamento` int(11) NOT NULL,
  `codCantidadxPresentacion` int(5) NOT NULL,
  `codUnidad` int(11) NOT NULL,
  `abreviatura` varchar(100) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  `laboratorio` varchar(45) DEFAULT NULL,
  `fechaVencimienti` date DEFAULT NULL,
  `recetaMedica` enum('Si','No') DEFAULT NULL,
  `tipo` enum('Marca','Generico') DEFAULT NULL,
  `estado` enum('1','0') DEFAULT '1',
  `codMedGen` int(11) DEFAULT NULL,
  `codPresGen` int(5) DEFAULT NULL,
  PRIMARY KEY (`codMedicamento`,`codCantidadxPresentacion`,`codUnidad`),
  KEY `fk_presentacionxmedicamento_presentacion_idx` (`codCantidadxPresentacion`),
  KEY `fk_presentacionxmedicamento_unidad_idx` (`codUnidad`),
  KEY `fk_marca_generico_idx` (`codMedGen`,`codPresGen`),
  CONSTRAINT `fk_marca_generico` FOREIGN KEY (`codMedGen`, `codPresGen`) REFERENCES `t_presentacionxmedicamento` (`codMedicamento`, `codCantidadxPresentacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_presentacionxmedicamento_` FOREIGN KEY (`codMedicamento`) REFERENCES `t_medicamento` (`codMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_presentacionxmedicamento_unidad` FOREIGN KEY (`codUnidad`) REFERENCES `t_unidad` (`codUnidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sucursal_presentacionxmedicamentos_cantpres` FOREIGN KEY (`codCantidadxPresentacion`) REFERENCES `t_cantidadxpresentacio` (`codCantidadxPresentacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_presentacionxmedicamento`
--

LOCK TABLES `t_presentacionxmedicamento` WRITE;
/*!40000 ALTER TABLE `t_presentacionxmedicamento` DISABLE KEYS */;
INSERT INTO `t_presentacionxmedicamento` VALUES (1,1,2,'APRONAX 100 mg   BLISTER X 10 UNIDADES',8.00,NULL,'2016-12-22','No','Marca','1',68,NULL),(1,1,5,'APRONAX 275 mg   BLISTER X 10 UNIDADES',9.70,NULL,'2016-12-22','No','Marca','1',68,NULL),(1,1,8,'APRONAX 550 mg   BLISTER X 10 UNIDADES',10.10,NULL,'2016-12-22','No','Marca','1',68,NULL),(2,1,8,'APRON-F 550 mg    BLISTER X 10 UNIDADES',15.00,NULL,'2016-12-22','No','Marca','1',68,NULL);
/*!40000 ALTER TABLE `t_presentacionxmedicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rol`
--

DROP TABLE IF EXISTS `t_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_rol` (
  `codRol` int(2) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `estado` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`codRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rol`
--

LOCK TABLES `t_rol` WRITE;
/*!40000 ALTER TABLE `t_rol` DISABLE KEYS */;
INSERT INTO `t_rol` VALUES (1,'Administrador','1'),(2,'Tecnico','1'),(3,'Cliente','1');
/*!40000 ALTER TABLE `t_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sintomascomunes`
--

DROP TABLE IF EXISTS `t_sintomascomunes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sintomascomunes` (
  `codSintomasComunes` int(11) NOT NULL AUTO_INCREMENT,
  `sintoma` varchar(70) DEFAULT NULL,
  `codMedicamento` int(11) NOT NULL,
  `codCantidadxPresentacion` int(5) NOT NULL,
  PRIMARY KEY (`codSintomasComunes`),
  KEY `fk_sintoma_presentacionxmedicamento_idx` (`codMedicamento`,`codCantidadxPresentacion`),
  CONSTRAINT `fk_sintomas_med_pres_cant` FOREIGN KEY (`codMedicamento`, `codCantidadxPresentacion`) REFERENCES `t_presentacionxmedicamento` (`codMedicamento`, `codCantidadxPresentacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sintomascomunes`
--

LOCK TABLES `t_sintomascomunes` WRITE;
/*!40000 ALTER TABLE `t_sintomascomunes` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_sintomascomunes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sucursal`
--

DROP TABLE IF EXISTS `t_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sucursal` (
  `codSucursal` int(5) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(45) DEFAULT NULL,
  `codDistrito` int(2) NOT NULL,
  `latitud` decimal(10,7) DEFAULT NULL,
  `longitud` decimal(10,7) DEFAULT NULL,
  `codigoPostal` int(6) DEFAULT NULL,
  PRIMARY KEY (`codSucursal`),
  KEY `fk_sucursal_distrito_idx` (`codDistrito`),
  CONSTRAINT `fk_sucursal_distrito` FOREIGN KEY (`codDistrito`) REFERENCES `t_distrito` (`codDistrito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sucursal`
--

LOCK TABLES `t_sucursal` WRITE;
/*!40000 ALTER TABLE `t_sucursal` DISABLE KEYS */;
INSERT INTO `t_sucursal` VALUES (1,'Av. Arenales 2294',5,NULL,NULL,NULL),(2,'Av. Constructores 1210',7,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sucursal_presentacionxmedicamentos`
--

DROP TABLE IF EXISTS `t_sucursal_presentacionxmedicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sucursal_presentacionxmedicamentos` (
  `codSucursal` int(5) NOT NULL,
  `codMedicamento` int(11) NOT NULL,
  `codCantxPresentacion` int(5) NOT NULL,
  `stock1` int(5) DEFAULT NULL,
  `stock2` int(5) DEFAULT NULL,
  `estado` enum('1','0') DEFAULT '1',
  `codUnidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`codSucursal`,`codMedicamento`,`codCantxPresentacion`),
  KEY `fk_sucursal_presentacionxmedicamentos_sucursal_presenmedica_idx` (`codMedicamento`,`codCantxPresentacion`),
  KEY `fk_sucursal_presentacionxunidad_idx` (`codUnidad`),
  KEY `fk_sucursal_presentacionxcant_idx` (`codMedicamento`,`codCantxPresentacion`,`codUnidad`),
  CONSTRAINT `fk_sucursal_presentacionxcant` FOREIGN KEY (`codMedicamento`, `codCantxPresentacion`, `codUnidad`) REFERENCES `t_presentacionxmedicamento` (`codMedicamento`, `codCantidadxPresentacion`, `codUnidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sucursal_presentacionxmedicamentos_sucursal` FOREIGN KEY (`codSucursal`) REFERENCES `t_sucursal` (`codSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sucursal_presentacionxmedicamentos`
--

LOCK TABLES `t_sucursal_presentacionxmedicamentos` WRITE;
/*!40000 ALTER TABLE `t_sucursal_presentacionxmedicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_sucursal_presentacionxmedicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tipomedida`
--

DROP TABLE IF EXISTS `t_tipomedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tipomedida` (
  `codTipoMedida` int(5) NOT NULL AUTO_INCREMENT,
  `unidad` varchar(100) DEFAULT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  `estado` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`codTipoMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tipomedida`
--

LOCK TABLES `t_tipomedida` WRITE;
/*!40000 ALTER TABLE `t_tipomedida` DISABLE KEYS */;
INSERT INTO `t_tipomedida` VALUES (1,'Miligramo','mg','1'),(2,'Mililitro','ml','1'),(3,'Miligramo/Mililitro','mg/ml','1');
/*!40000 ALTER TABLE `t_tipomedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_unidad`
--

DROP TABLE IF EXISTS `t_unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_unidad` (
  `codUnidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(5) NOT NULL,
  `codTipoMedida` int(5) NOT NULL,
  `estado` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`codUnidad`),
  KEY `fk_unidad_tipomedida_idx` (`codTipoMedida`),
  CONSTRAINT `fk_unidad_tipomedida` FOREIGN KEY (`codTipoMedida`) REFERENCES `t_tipomedida` (`codTipoMedida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_unidad`
--

LOCK TABLES `t_unidad` WRITE;
/*!40000 ALTER TABLE `t_unidad` DISABLE KEYS */;
INSERT INTO `t_unidad` VALUES (1,'50',1,'1'),(2,'100',1,'1'),(3,'125',1,'1'),(4,'200',1,'1'),(5,'275',1,'1'),(6,'300',1,'1'),(7,'500',1,'1'),(8,'550',1,'1'),(9,'25',3,'1');
/*!40000 ALTER TABLE `t_unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_usuario`
--

DROP TABLE IF EXISTS `t_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_usuario` (
  `codUsuario` int(11) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `clave` varchar(50) DEFAULT NULL,
  `codRol` int(2) NOT NULL,
  `estado` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`codUsuario`),
  KEY `fk_usuario_rol_idx` (`codRol`),
  CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`codUsuario`) REFERENCES `t_persona` (`codPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`codRol`) REFERENCES `t_rol` (`codRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_usuario`
--

LOCK TABLES `t_usuario` WRITE;
/*!40000 ALTER TABLE `t_usuario` DISABLE KEYS */;
INSERT INTO `t_usuario` VALUES (1,'jgomez','james',2,'1'),(4,'arojas','adrian',2,'1');
/*!40000 ALTER TABLE `t_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-09  1:30:16
