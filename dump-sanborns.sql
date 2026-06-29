/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sanborns_store
-- ------------------------------------------------------
-- Server version	11.8.8-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `acumulado_retrasos_estatus`
--

DROP TABLE IF EXISTS `acumulado_retrasos_estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acumulado_retrasos_estatus` (
  `id_acumulado_retrasoe` int(11) NOT NULL AUTO_INCREMENT,
  `id_rela` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `num_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `Fecha_estatus` varchar(30) NOT NULL,
  `Fecha_Asignacion` varchar(30) NOT NULL,
  `retraso` varchar(50) DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `transferencia` varchar(15) NOT NULL,
  `id_tienda` int(11) NOT NULL,
  `nombre_tienda` varchar(70) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  PRIMARY KEY (`id_acumulado_retrasoe`),
  KEY `retraso` (`retraso`),
  KEY `tipo` (`tipo`),
  KEY `fecha_registro` (`fecha_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acumulado_retrasos_guias`
--

DROP TABLE IF EXISTS `acumulado_retrasos_guias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acumulado_retrasos_guias` (
  `id_acumulado_retrasog` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `num_pedido` int(11) DEFAULT NULL,
  `guia` varchar(50) DEFAULT NULL,
  `fecha_embarque` date DEFAULT NULL,
  `retraso` varchar(50) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `guia_retorno` varchar(20) DEFAULT NULL,
  `fecha_generacion_guia` datetime DEFAULT NULL,
  PRIMARY KEY (`id_acumulado_retrasog`),
  KEY `tipo` (`tipo`),
  KEY `num_pedido` (`num_pedido`),
  KEY `guia` (`guia`),
  KEY `retraso` (`retraso`),
  KEY `fecha_registro` (`fecha_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acumulado_retrasos_guias_detalle_transfer`
--

DROP TABLE IF EXISTS `acumulado_retrasos_guias_detalle_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acumulado_retrasos_guias_detalle_transfer` (
  `id_acumulado_retrasogd` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `num_pedido` int(11) NOT NULL,
  `guia` varchar(50) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `fecha_embarque` date NOT NULL,
  `retraso` varchar(50) DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `guia_retorno` varchar(20) DEFAULT NULL,
  `fecha_generacion_guia` datetime DEFAULT NULL,
  `transferencia` varchar(15) DEFAULT NULL,
  `nombre_tienda` varchar(70) DEFAULT NULL,
  `fecha_recoleccion` date DEFAULT NULL,
  PRIMARY KEY (`id_acumulado_retrasogd`),
  KEY `transferencia` (`transferencia`),
  KEY `num_pedido` (`num_pedido`),
  KEY `guia` (`guia`),
  KEY `fecha_registro` (`fecha_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acumulado_retrasos_guias_dhl`
--

DROP TABLE IF EXISTS `acumulado_retrasos_guias_dhl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acumulado_retrasos_guias_dhl` (
  `id_acumulado_retrasodhl` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` text NOT NULL,
  `num_pedido` int(11) NOT NULL,
  `guia` varchar(50) NOT NULL,
  `fecha_embarque` date NOT NULL,
  `retraso` varchar(50) DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `guia_retorno` varchar(20) DEFAULT NULL,
  `fecha_generacion_guia` datetime DEFAULT NULL,
  PRIMARY KEY (`id_acumulado_retrasodhl`),
  KEY `num_pedido` (`num_pedido`),
  KEY `guia` (`guia`),
  KEY `fecha_registro` (`fecha_registro`),
  FULLTEXT KEY `tipo` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acumulado_retrasos_guias_dhl_transfer`
--

DROP TABLE IF EXISTS `acumulado_retrasos_guias_dhl_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acumulado_retrasos_guias_dhl_transfer` (
  `id_acumulado_retrasodhlt` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `num_pedido` int(11) NOT NULL,
  `guia` varchar(50) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `fecha_embarque` date NOT NULL,
  `retraso` varchar(50) DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `guia_retorno` varchar(20) DEFAULT NULL,
  `fecha_generacion_guia` datetime DEFAULT NULL,
  `transferencia` varchar(15) DEFAULT NULL,
  `nombre_tienda` varchar(70) DEFAULT NULL,
  `fecha_recoleccion` date DEFAULT NULL,
  PRIMARY KEY (`id_acumulado_retrasodhlt`),
  KEY `transferencia` (`transferencia`),
  KEY `num_pedido` (`num_pedido`),
  KEY `guia` (`guia`),
  KEY `fecha_registro` (`fecha_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acumulado_retrasos_x_tienda`
--

DROP TABLE IF EXISTS `acumulado_retrasos_x_tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acumulado_retrasos_x_tienda` (
  `id_acumulado_retrasot` int(11) NOT NULL AUTO_INCREMENT,
  `id_rela` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `num_pedido` int(11) NOT NULL,
  `nombre_tienda` varchar(100) NOT NULL,
  `Fecha_Pedido` varchar(30) NOT NULL,
  `Fecha_Asignacion` varchar(30) NOT NULL,
  `retraso` varchar(50) DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_acumulado_retrasot`),
  KEY `nombre_tienda` (`nombre_tienda`),
  KEY `fecha_registro` (`fecha_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `archivos_feedback_procesados`
--

DROP TABLE IF EXISTS `archivos_feedback_procesados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `archivos_feedback_procesados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  `pedidos` text NOT NULL COMMENT 'se almacenara informacion como:\nnumeroPedido:relacion_pedido,numeroPedido:relacion_pedido',
  `estatus` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2339853 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `archivos_fincados`
--

DROP TABLE IF EXISTS `archivos_fincados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `archivos_fincados` (
  `id_archivo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_procesado` datetime NOT NULL,
  `numero_pedido` int(11) NOT NULL,
  `contenido` text NOT NULL,
  `estatus` tinyint(4) NOT NULL,
  `informacion_error` varchar(145) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_archivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articulos_facturacion`
--

DROP TABLE IF EXISTS `articulos_facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos_facturacion` (
  `id_articulo` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` bigint(20) NOT NULL,
  `sku` int(11) DEFAULT NULL,
  `division` varchar(15) NOT NULL,
  `secuencia` tinyint(4) DEFAULT NULL,
  `departamento` tinyint(4) DEFAULT NULL,
  `descripcion` varchar(250) NOT NULL,
  `ean` varchar(13) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `importe_bruto` float DEFAULT NULL,
  `importe_neto` float DEFAULT NULL,
  `descuento_neto` float DEFAULT NULL,
  `importe_monedero` float DEFAULT NULL,
  `vendedor` tinyint(4) DEFAULT NULL,
  `porcentaje_iva` tinyint(4) DEFAULT NULL,
  `gramaje` tinyint(4) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  PRIMARY KEY (`id_articulo`),
  KEY `sku` (`sku`) USING BTREE,
  KEY `fk_num_pedido` (`numero_pedido`),
  CONSTRAINT `fk_num_pedido` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos_facturacion` (`numero_pedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asignacion_mensajeria`
--

DROP TABLE IF EXISTS `asignacion_mensajeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacion_mensajeria` (
  `id_asignacion_mensajeria` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `id_mensajeria` int(11) NOT NULL,
  `tienda_claroshop` int(11) NOT NULL,
  `id_tienda_fisica` int(11) NOT NULL,
  `guia_generada` varchar(100) DEFAULT NULL,
  `enviada` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_asignada` datetime DEFAULT NULL,
  `usuario_alta` int(11) NOT NULL,
  `usuario_modificacion` int(11) DEFAULT 0,
  `tipo_servicio` enum('0','1','2') NOT NULL DEFAULT '0',
  `paquete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_asignacion_mensajeria`),
  KEY `i_asignacion_pedido` (`num_pedido`),
  KEY `i_asignacion_relacion` (`id_relacion_pedido`),
  KEY `i_asignacion_mensajeria` (`id_mensajeria`),
  KEY `i_asignacion_tienda` (`id_tienda_fisica`),
  KEY `i_guia_generada` (`guia_generada`),
  KEY `i_tipo_servicio` (`tipo_servicio`),
  CONSTRAINT `fk_asignacion_mensajeria` FOREIGN KEY (`id_mensajeria`) REFERENCES `ctg_mensajeria` (`id`),
  CONSTRAINT `fk_asignacion_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`),
  CONSTRAINT `fk_asignacion_relacion` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=561491 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `axii_log`
--

DROP TABLE IF EXISTS `axii_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `axii_log` (
  `id_axii_log` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL DEFAULT 0,
  `valores_json` text NOT NULL,
  `fecha` datetime NOT NULL,
  `metodo` varchar(15) NOT NULL,
  `consulta` text NOT NULL,
  `modulo` int(11) NOT NULL DEFAULT 0,
  `visible` tinyint(4) NOT NULL DEFAULT 0,
  `tabla` varchar(145) NOT NULL DEFAULT '',
  `pedido` int(11) NOT NULL DEFAULT 0,
  `comentario` varchar(245) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_axii_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bancos` (
  `id_banco` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_tarjeta` enum('OTRO','CREDITO','DEBITO') NOT NULL DEFAULT 'OTRO',
  `banco` varchar(100) NOT NULL,
  `id_banco_promocion` int(11) DEFAULT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_banco`),
  KEY `id_banco` (`id_banco`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bines`
--

DROP TABLE IF EXISTS `bines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefijos` varchar(15) NOT NULL,
  `tipo_tarjeta` varchar(10) NOT NULL,
  `emisor` varchar(80) NOT NULL,
  `descripcion` varchar(180) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `binexix` (`prefijos`)
) ENGINE=InnoDB AUTO_INCREMENT=838 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bines_bancos`
--

DROP TABLE IF EXISTS `bines_bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bines_bancos` (
  `id_bines_banco` int(11) NOT NULL AUTO_INCREMENT,
  `id_banco` int(11) DEFAULT NULL,
  `bim` char(10) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `estatus` tinyint(4) NOT NULL DEFAULT 0,
  `tipo` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = credito, 2 = debito, 3 = otro',
  PRIMARY KEY (`id_bines_banco`),
  KEY `id_banco` (`id_banco`)
) ENGINE=InnoDB AUTO_INCREMENT=1097 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bitacora_concilia`
--

DROP TABLE IF EXISTS `bitacora_concilia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_concilia` (
  `id_bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `paso` char(30) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_bitacora`)
) ENGINE=InnoDB AUTO_INCREMENT=2665 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bitacoraactualizaciondeinformaciondepedidos`
--

DROP TABLE IF EXISTS `bitacoraactualizaciondeinformaciondepedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacoraactualizaciondeinformaciondepedidos` (
  `Indice` int(11) NOT NULL AUTO_INCREMENT,
  `Num_Pedido` int(11) DEFAULT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus_Original_Pedido` int(11) DEFAULT NULL,
  `Estatus_Actualizado_Pedido` int(11) DEFAULT NULL,
  `Usuario_Solicita_Cambio` varchar(60) DEFAULT NULL,
  `Usuario_Aplica_Cambio` varchar(60) DEFAULT NULL,
  `Observaciones_Cambio` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Indice`),
  KEY `idxBAIP_Fecha` (`Fecha_Actualizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bloqueo_acciones_productos`
--

DROP TABLE IF EXISTS `bloqueo_acciones_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloqueo_acciones_productos` (
  `id_bloqueo_acciones_productos` int(11) NOT NULL AUTO_INCREMENT,
  `id_relacion_pedido` int(11) NOT NULL,
  `tipo` enum('ayuda_dinamica') DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `estatus` enum('Creado','En uso','Liberado') DEFAULT NULL,
  `vence` datetime DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` varchar(50) DEFAULT NULL,
  `usuario_modificacion` varchar(50) DEFAULT NULL,
  `usuario_baja` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_bloqueo_acciones_productos`),
  KEY `i_id_relacion_pedido` (`id_relacion_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bloqueo_acciones_productos_historial`
--

DROP TABLE IF EXISTS `bloqueo_acciones_productos_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloqueo_acciones_productos_historial` (
  `id_bloqueo_prod_historial` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `id_bloqueo_acciones_productos` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` varchar(50) DEFAULT NULL,
  `usuario_modificacion` varchar(50) DEFAULT NULL,
  `usuario_baja` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_bloqueo_prod_historial`),
  KEY `i_bloqueo_usuario` (`id_bloqueo_acciones_productos`)
) ENGINE=InnoDB AUTO_INCREMENT=890 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `boletinar_cliente_fraude`
--

DROP TABLE IF EXISTS `boletinar_cliente_fraude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `boletinar_cliente_fraude` (
  `id_boletinar` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_fraude` int(11) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `borrado` int(11) DEFAULT NULL COMMENT '1-activo 0-eliminado',
  PRIMARY KEY (`id_boletinar`),
  KEY `cliente_fraude` (`cliente_fraude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `borrame1`
--

DROP TABLE IF EXISTS `borrame1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrame1` (
  `sku` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `borrame2`
--

DROP TABLE IF EXISTS `borrame2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrame2` (
  `sku` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bracket_camioneta`
--

DROP TABLE IF EXISTS `bracket_camioneta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bracket_camioneta` (
  `id_bracket_camioneta` int(11) NOT NULL AUTO_INCREMENT,
  `id_bracket` int(11) NOT NULL,
  `numero_pedido` int(11) NOT NULL,
  `guia` varchar(90) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `precio` float(20,2) NOT NULL,
  `id_seller` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificación` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `id_usuario_alta` int(11) NOT NULL,
  `id_usurio_modifica` int(11) DEFAULT NULL,
  `id_usuario_baja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_bracket_camioneta`),
  KEY `i_pedido_bracket` (`numero_pedido`),
  KEY `i_relpedido_bracket` (`id_relacion_pedido`),
  KEY `i_guia_bracket` (`guia`),
  CONSTRAINT `fk_pedido_bracket` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_relpedido_bracket` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_estado`
--

DROP TABLE IF EXISTS `c_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(2) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `abrev` varchar(16) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `usuario_alta` varchar(50) NOT NULL,
  `usuario_modifica` varchar(50) DEFAULT NULL,
  `usuario_baja` varchar(50) DEFAULT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  `fecha_baja` datetime DEFAULT NULL,
  PRIMARY KEY (`id_estado`),
  KEY `i_cat_estado` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cambio_estatus_pedidos`
--

DROP TABLE IF EXISTS `cambio_estatus_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cambio_estatus_pedidos` (
  `id_cambio_estatus` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `estatus_desc` varchar(50) NOT NULL,
  `id_estatus` int(11) NOT NULL,
  `procesado` tinyint(1) DEFAULT 0,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_cambio_estatus`),
  KEY `fk_cambio_estatus_pedidos_crd_pedido` (`num_pedido`),
  CONSTRAINT `fk_cambio_estatus_pedidos_crd_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carrerasears`
--

DROP TABLE IF EXISTS `carrerasears`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrerasears` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pedido` int(11) NOT NULL,
  `id_relacion` int(11) NOT NULL,
  `folio` varchar(20) DEFAULT NULL,
  `res_ws_pos` text DEFAULT NULL,
  `envio_mail` tinyint(1) NOT NULL DEFAULT 0,
  `res_ws_correo` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_relacion` (`id_relacion`),
  CONSTRAINT `fk_id_relacion` FOREIGN KEY (`id_relacion`) REFERENCES `relacion_pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_estatus_track`
--

DROP TABLE IF EXISTS `cat_estatus_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_estatus_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mensajeria` int(11) NOT NULL,
  `estatus` varchar(25) NOT NULL,
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_mensajeria` (`id_mensajeria`) USING BTREE,
  KEY `codigo` (`codigo`) USING BTREE,
  CONSTRAINT `fk_id_mensajeria_cat_track` FOREIGN KEY (`id_mensajeria`) REFERENCES `ctg_mensajeria` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_metodos_api`
--

DROP TABLE IF EXISTS `cat_metodos_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_metodos_api` (
  `id_metodo` int(11) NOT NULL AUTO_INCREMENT,
  `metodo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `tipo_metodo` enum('POST','GET','PUT','DELETE') CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT 'GET',
  `activo` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_metodo`),
  KEY `idx_metodo` (`metodo`) USING BTREE,
  KEY `idx_tipo_metodo` (`tipo_metodo`) USING BTREE,
  KEY `idx_activo` (`activo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_status_tickets`
--

DROP TABLE IF EXISTS `cat_status_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_status_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla para catálogo de los estatus de la ayuda dinámica',
  `status` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL COMMENT 'nombre del estatus ',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogo_areas`
--

DROP TABLE IF EXISTS `catalogo_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo_areas` (
  `id_cat_area` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(130) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_cat_area`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogo_familia`
--

DROP TABLE IF EXISTS `catalogo_familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo_familia` (
  `id_catalogo_familia` int(11) NOT NULL AUTO_INCREMENT,
  `familia` varchar(100) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_usuario_registra` int(11) DEFAULT NULL,
  `id_tab_micuenta` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_catalogo_familia`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogo_forma_pago_pos`
--

DROP TABLE IF EXISTS `catalogo_forma_pago_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo_forma_pago_pos` (
  `id_forma_pago_pos` int(11) NOT NULL AUTO_INCREMENT,
  `id_sap` int(11) NOT NULL,
  `id_sales_audit` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_forma_pago_pos`),
  KEY `i_id_sap` (`id_sap`) USING BTREE,
  KEY `i_pos_sales` (`id_sales_audit`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogo_fuentes`
--

DROP TABLE IF EXISTS `catalogo_fuentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo_fuentes` (
  `id_cat_fuente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(130) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_cat_fuente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogo_mesa_regalo`
--

DROP TABLE IF EXISTS `catalogo_mesa_regalo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo_mesa_regalo` (
  `id_ctg_mesa` int(11) NOT NULL AUTO_INCREMENT,
  `id_mesa` int(11) NOT NULL DEFAULT 0,
  `nombre_mesa` varchar(150) NOT NULL DEFAULT '',
  `fecha_evento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_creacion_evento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_registro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mensaje_bienvenida` varchar(240) NOT NULL DEFAULT '',
  `email_cliente` varchar(90) NOT NULL DEFAULT '',
  `tipo_plan` varchar(40) NOT NULL DEFAULT '',
  `tipo_evento` varchar(70) NOT NULL DEFAULT '',
  `nombre_festejado` varchar(150) NOT NULL DEFAULT '',
  `enviado` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_ctg_mesa`),
  KEY `id_mesa` (`id_mesa`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogo_padres_tipificaciones`
--

DROP TABLE IF EXISTS `catalogo_padres_tipificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo_padres_tipificaciones` (
  `id_cat_padrestipif` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `estatus` tinyint(4) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_cat_padrestipif`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogo_tipificacion`
--

DROP TABLE IF EXISTS `catalogo_tipificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo_tipificacion` (
  `id_cat_tipificacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(130) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_cat_padrestipif` int(11) NOT NULL,
  PRIMARY KEY (`id_cat_tipificacion`),
  KEY `fk_padre_tipificacion` (`id_cat_padrestipif`),
  CONSTRAINT `fk_padre_tipificacion` FOREIGN KEY (`id_cat_padrestipif`) REFERENCES `catalogo_padres_tipificaciones` (`id_cat_padrestipif`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catcolor`
--

DROP TABLE IF EXISTS `catcolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `catcolor` (
  `fiColorId` int(11) NOT NULL,
  `fcColorDesc` varchar(50) NOT NULL,
  `fcColorHex` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`fiColorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cattalla`
--

DROP TABLE IF EXISTS `cattalla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cattalla` (
  `fiTallaId` int(11) NOT NULL,
  `fcTallaDesc` varchar(40) NOT NULL,
  `fiTipoMedidaTallaId` int(11) NOT NULL,
  PRIMARY KEY (`fiTallaId`),
  KEY `FK_CTMT_CT` (`fiTipoMedidaTallaId`),
  CONSTRAINT `FK_CTMT_CT` FOREIGN KEY (`fiTipoMedidaTallaId`) REFERENCES `cattipomedidatalla` (`fiTipoMedidaTallaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente_tmx`
--

DROP TABLE IF EXISTS `cliente_tmx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_tmx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `email_tmx` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `telefono_tmx` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `activo` tinyint(2) NOT NULL DEFAULT 1,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_id_cliente` (`id_cliente`) USING BTREE,
  CONSTRAINT `fk_cliente_tmx_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Empresa` varchar(100) DEFAULT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido_Paterno` varchar(100) NOT NULL,
  `Apellido_Materno` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `Tienda` int(11) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `quiere_tarjeta` tinyint(1) unsigned DEFAULT 0 COMMENT '0-default, 1-desea ser contactado, 2 - acepto contrato , 3 no acepto el contrato',
  `noventa` int(30) DEFAULT NULL COMMENT 'numero de venta de la tarjeta',
  `unicard_foto` int(11) DEFAULT 0 COMMENT '0- no existe foto 1- ya se hizo',
  `promocion_tarjeta_vip` tinyint(1) DEFAULT 0,
  `limite` float DEFAULT NULL COMMENT 'limite de credito',
  `tc` varchar(20) DEFAULT NULL,
  `referido_por` varchar(100) DEFAULT NULL COMMENT 'email del usuario de plaza que refirio al cliente',
  `estatus_tc` tinyint(1) DEFAULT 0 COMMENT '0-no aplica 1-rechazado 2-aprobado estatus para los clientes que se crean y se les aplica solicitud de aprobacion tc unicard',
  `rfc` varchar(70) DEFAULT NULL,
  `fecha_unicard` datetime DEFAULT NULL COMMENT 'fecha en la que acepto el contrato',
  `sears` int(11) DEFAULT NULL COMMENT 'id del cliente en sears',
  `sexo` char(1) DEFAULT NULL COMMENT 'f-femenino m-masculino',
  `telefono_telmex` char(10) DEFAULT NULL,
  `num_puntosinfin` varchar(20) DEFAULT NULL,
  `Es_Proveedor` varchar(45) DEFAULT NULL,
  `contrasena_2` varchar(100) DEFAULT NULL,
  `contrasena_3` char(32) DEFAULT NULL,
  `usuario_cobro` varchar(30) DEFAULT NULL,
  `preferencias` mediumtext DEFAULT NULL,
  `foto_perfil` mediumtext DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `ip` varchar(20) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT '',
  `tipo_rfc` varchar(11) DEFAULT '',
  PRIMARY KEY (`Id`),
  KEY `email` (`Email`),
  KEY `Apellido` (`Apellido_Paterno`),
  KEY `Nombre` (`Nombre`),
  KEY `sears` (`sears`),
  KEY `por_tienda` (`Tienda`) USING BTREE,
  KEY `i_fecha_cliente` (`fecha_creacion`)
) ENGINE=InnoDB AUTO_INCREMENT=2709890 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codigos_asentamiento`
--

DROP TABLE IF EXISTS `codigos_asentamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigos_asentamiento` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `asentamiento` varchar(200) DEFAULT NULL,
  `tipo_asentamiento` varchar(75) DEFAULT NULL,
  `municipio` varchar(75) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `id_oficina` int(6) DEFAULT NULL,
  `id_tipo_asentamiento` int(3) DEFAULT NULL,
  `id_municipio` int(4) DEFAULT NULL,
  `id_asentamiento` int(5) DEFAULT NULL,
  `zona` varchar(50) DEFAULT NULL,
  `id_ciudad` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codigos_rojos_mensajeria`
--

DROP TABLE IF EXISTS `codigos_rojos_mensajeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigos_rojos_mensajeria` (
  `id_codigo_rojo_msj` int(11) NOT NULL AUTO_INCREMENT,
  `cp` varchar(255) NOT NULL,
  `mensajeria` varchar(255) NOT NULL,
  `ruta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_codigo_rojo_msj`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16617 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comentarios_pedidos`
--

DROP TABLE IF EXISTS `comentarios_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios_pedidos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `Comentario` text NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `visible` int(11) DEFAULT 0 COMMENT '2-solo para unicard',
  `id_usuario` int(11) DEFAULT NULL COMMENT 'id de quien coloca el comentario',
  `nivel` int(11) DEFAULT NULL,
  `frontend` tinyint(4) DEFAULT 0,
  `id_area` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `Id_Pedido` (`numero_pedido`),
  KEY `idx_Fecha` (`fecha`),
  KEY `idx_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=119142004 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comentarios_pedidos_presupuesto`
--

DROP TABLE IF EXISTS `comentarios_pedidos_presupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios_pedidos_presupuesto` (
  `idcomentario` int(11) NOT NULL AUTO_INCREMENT,
  `numpedido` int(11) NOT NULL,
  `fecharegistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `comentario` text NOT NULL,
  `visible` int(11) DEFAULT 0 COMMENT '2-solo para unicard',
  `idusuario` int(11) DEFAULT NULL COMMENT 'id de quien coloca el comentario',
  `frontend` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`idcomentario`),
  KEY `pedido` (`numpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comercio_pedidos`
--

DROP TABLE IF EXISTS `comercio_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercio_pedidos` (
  `id_comercio` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL COMMENT 'id del producto',
  `id_seller` int(11) NOT NULL,
  `precio` double NOT NULL COMMENT 'precio del producto al cual lo compro el cliente',
  `envio` double NOT NULL DEFAULT 0 COMMENT 'costo de envio del producto',
  `etapa` int(11) NOT NULL DEFAULT 0 COMMENT 'etapa en la cual se encuentra el producto 0-pendiente,1-por pagar,2-pagados,3-enaclaracion,4-cancelado,5-proceso de pago,6-reembolso,7-validando guia,8-hemsa ',
  `fecha_alta` datetime NOT NULL,
  `id_relacion_pedido` int(11) DEFAULT NULL COMMENT 'id de la tabla relacion pedidos',
  `numero_pedido` int(11) DEFAULT NULL COMMENT 'numero de pedido',
  `fecha_cancelacion` datetime DEFAULT NULL COMMENT 'fecha que cancela la partida de un producto',
  `Tienda` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_comercio`),
  KEY `fk_comercio_producto` (`id_producto`),
  KEY `fk_comercio_pedido` (`numero_pedido`),
  KEY `fk_comercio_relacion` (`id_relacion_pedido`),
  KEY `i_id_seller` (`id_seller`),
  CONSTRAINT `fk_comercio_pedido` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`),
  CONSTRAINT `fk_comercio_relacion` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8917050 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comercio_pedidos_guias`
--

DROP TABLE IF EXISTS `comercio_pedidos_guias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercio_pedidos_guias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idComercio` int(11) NOT NULL,
  `compania` int(11) NOT NULL,
  `guia` varchar(90) NOT NULL,
  `numero_pedido` int(11) NOT NULL,
  `estatus` int(11) DEFAULT 0 COMMENT '0 guia por validar - 1 guia erronea 2-validada',
  `fecha` datetime DEFAULT NULL,
  `FechaValidacion` datetime DEFAULT NULL,
  `eliminado` int(1) DEFAULT 1 COMMENT '1-habilitada 0-eliminada',
  `entregado` int(1) DEFAULT 0 COMMENT '0-no entregado 1-entregado Embarques valida que el producto este como entregado en la mensajeria',
  `fechavalidaentrega` datetime DEFAULT NULL COMMENT 'fecha en la cual comercial valida que el producto fue entregado',
  `tiene_guia_retorno` tinyint(4) NOT NULL DEFAULT 0,
  `url_traking` varchar(250) NOT NULL,
  `t1envios` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idcomercio` (`idComercio`),
  KEY `guia` (`guia`),
  KEY `pnormalizado` (`numero_pedido`),
  KEY `i_comguia_fecha` (`fecha`),
  KEY `i_cpg_compania` (`compania`),
  KEY `eliminado` (`eliminado`) USING BTREE,
  KEY `estatus` (`estatus`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7698829 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comercio_pedidos_historico`
--

DROP TABLE IF EXISTS `comercio_pedidos_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercio_pedidos_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comercio_pedido` int(11) DEFAULT NULL COMMENT 'id de la tabla comercio_pedido',
  `estatus` int(11) DEFAULT NULL COMMENT 'id del estatus al cual cambio ',
  `usr` int(11) DEFAULT NULL COMMENT 'id del usuario que realizo el movimiento',
  `fecha` datetime DEFAULT NULL COMMENT 'fecha registro accion',
  `accion` int(11) DEFAULT NULL COMMENT '1-proceso, 2-modifico, 3-elimino',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comisiones_proveedor_mktp`
--

DROP TABLE IF EXISTS `comisiones_proveedor_mktp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comisiones_proveedor_mktp` (
  `id_comisiones_proveedor_mktp` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `estatus_pedido` varchar(100) DEFAULT NULL,
  `fecha_pedido` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_pago` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_cancelacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_tienda` int(11) NOT NULL,
  `nombre_tienda` varchar(150) NOT NULL,
  `comision` double NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre_producto` text NOT NULL,
  `precio_venta` double NOT NULL,
  `ingreso_comision` double NOT NULL,
  `iva_ingreso_comision` double NOT NULL,
  `total_comision` double NOT NULL,
  `enviado` tinyint(1) NOT NULL,
  `nombre_archivo` varchar(150) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `fecha_baja` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_comisiones_proveedor_mktp`),
  KEY `num_pedido` (`num_pedido`) USING BTREE,
  KEY `estatus_pedido` (`estatus_pedido`) USING BTREE,
  KEY `fecha_pedido` (`fecha_pedido`) USING BTREE,
  KEY `fecha_pago` (`fecha_pago`) USING BTREE,
  KEY `fecha_cancelacion` (`fecha_cancelacion`) USING BTREE,
  KEY `id_tienda` (`id_tienda`) USING BTREE,
  KEY `id_producto` (`id_producto`) USING BTREE,
  KEY `enviado` (`enviado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=540882 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conciliacargos`
--

DROP TABLE IF EXISTS `conciliacargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conciliacargos` (
  `Indice` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Pedido` int(11) NOT NULL,
  `Num_Pedido` int(11) NOT NULL,
  `tienda` int(11) DEFAULT NULL,
  `Estatus_Numerico` int(11) DEFAULT NULL,
  `Estatus_Pedido_Desc` varchar(90) NOT NULL,
  `Estatus_Reza` varchar(30) DEFAULT NULL,
  `IdFormapago` int(11) DEFAULT NULL,
  `formas_pago_origen` varchar(100) DEFAULT NULL,
  `Forma_De_Pago` varchar(100) DEFAULT NULL,
  `Tipo_Tarjeta` varchar(50) DEFAULT NULL,
  `Banco_Emisor` varchar(50) DEFAULT NULL,
  `Subtotal_Venta` double DEFAULT NULL,
  `Total_Envio` double DEFAULT NULL,
  `Total_Venta` double DEFAULT NULL,
  `Fecha_Pedido_Colocado` varchar(30) DEFAULT NULL,
  `Fecha_Pago` varchar(30) DEFAULT NULL,
  `sales_venta` varchar(50) DEFAULT NULL,
  `fecha_sales_cancela` datetime DEFAULT NULL,
  `sales_cancelacion` varchar(50) DEFAULT NULL,
  `MotivoCancela` varchar(200) DEFAULT NULL,
  `Dvision` int(11) DEFAULT NULL,
  `Id_Producto` int(11) NOT NULL,
  `Nombre_Producto` varchar(500) NOT NULL,
  `EAN` varchar(20) DEFAULT NULL,
  `SKU` varchar(50) DEFAULT NULL,
  `catalogo_ext` char(2) DEFAULT NULL,
  `fecha_entrega_cex` char(5) DEFAULT NULL,
  `mesa_regalo` char(10) DEFAULT NULL,
  `Transferencia` varchar(50) DEFAULT NULL,
  `Tiendatrans` int(11) DEFAULT NULL,
  `EstatusTran` varchar(10) DEFAULT NULL,
  `Fecha_Transferencia` datetime DEFAULT NULL,
  `Fecha_Envio_Transferencia` datetime DEFAULT NULL,
  `Fecha_Recepcion_Transferencia` datetime DEFAULT NULL,
  `estatus_guia` text DEFAULT NULL,
  `Guia_Pedido` varchar(90) DEFAULT NULL,
  `Carrier_Pedido` varchar(60) DEFAULT NULL,
  `fecha_entrega_prod` varchar(50) DEFAULT NULL,
  `EstatusProducto` varchar(100) DEFAULT NULL,
  `colonia` varchar(100) DEFAULT NULL,
  `municipio` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `telefono_uno` char(20) DEFAULT NULL,
  `telefono_dos` char(20) DEFAULT NULL,
  `Id_RelacionPed` int(11) DEFAULT NULL,
  `fecha_cancela_prod` varchar(50) DEFAULT NULL,
  `Descuento` double DEFAULT NULL,
  `Debito_Credito` varchar(50) DEFAULT NULL,
  `Precio_Venta_Producto` double DEFAULT NULL,
  `comision_pesos` float(20,2) DEFAULT NULL,
  `comision_porcentaje` float(20,2) DEFAULT NULL,
  `Fecha_recoleccion_msj` varchar(50) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `motivo_rechazo` varchar(100) DEFAULT NULL,
  `fecha_estimada_entrega` varchar(50) DEFAULT NULL,
  `fecha_estimada_inicio` varchar(50) DEFAULT NULL,
  `id_seller` int(11) DEFAULT NULL,
  `nombre_seller` varchar(100) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `id_cat_nieta` int(11) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `cyr` char(2) DEFAULT NULL,
  `Fecha_Embarque` varchar(30) DEFAULT NULL,
  `fecha_asignacion` varchar(30) DEFAULT NULL,
  `identificador_fullfilment` char(2) DEFAULT NULL,
  `Plataforma` text DEFAULT NULL,
  `motivo_producto` varchar(200) DEFAULT NULL,
  `afiliado` int(11) DEFAULT NULL,
  `descuento_producto` double DEFAULT NULL,
  `tipo_mesa` varchar(50) DEFAULT NULL,
  `fecha_empaque` datetime DEFAULT NULL,
  `fecha_conocimiento` datetime DEFAULT NULL,
  `forma_pago_pos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Indice`),
  KEY `i_num_pedido` (`Num_Pedido`) USING BTREE,
  KEY `i_id_pedido` (`Id_Pedido`) USING BTREE,
  KEY `i_rel_pedido` (`Id_RelacionPed`) USING BTREE,
  KEY `i_guia` (`Guia_Pedido`) USING BTREE,
  KEY `i_estatus_ped` (`Estatus_Numerico`) USING BTREE,
  KEY `i_forma_pago` (`IdFormapago`) USING BTREE,
  KEY `i_estatus_reza` (`Estatus_Reza`) USING BTREE,
  KEY `i_id_producto` (`Id_Producto`) USING BTREE,
  KEY `i_concilia_estatusProd` (`EstatusProducto`) USING BTREE,
  KEY `i_concilia_empaque` (`fecha_empaque`) USING BTREE,
  KEY `i_concilia_conocimiento` (`fecha_conocimiento`) USING BTREE,
  KEY `idxpedidonum` (`Num_Pedido`),
  KEY `EstatusRezaIdx` (`Estatus_Reza`)
) ENGINE=InnoDB AUTO_INCREMENT=1333 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conciliacion_amex`
--

DROP TABLE IF EXISTS `conciliacion_amex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conciliacion_amex` (
  `id_conciliacion` int(11) NOT NULL AUTO_INCREMENT,
  `numero_compania` varchar(50) NOT NULL,
  `venta_tarjeta_credito` varchar(10) NOT NULL,
  `tipo_transaccion` varchar(3) NOT NULL,
  `numero_tienda` varchar(100) NOT NULL,
  `numero_terminal` varchar(100) NOT NULL,
  `numero_transaccion` varchar(100) NOT NULL,
  `numero_operador` varchar(100) NOT NULL,
  `numero_cuenta` varchar(100) NOT NULL,
  `fecha_vencimiento` datetime NOT NULL,
  `importe_compra` varchar(100) NOT NULL,
  `numero_autorizacion` varchar(100) NOT NULL,
  `numero_tarjetas_transaccion` varchar(100) NOT NULL,
  `numero_promocion` varchar(100) NOT NULL,
  `id_banco_promocion` varchar(100) NOT NULL,
  `numero_departamento` varchar(100) NOT NULL,
  `fecha_transaccion` datetime NOT NULL,
  `hora_transaccion` datetime NOT NULL,
  `is_cashback` varchar(10) NOT NULL,
  `is_puntos_bancomer` varchar(10) NOT NULL,
  `importe_cashback` varchar(10) NOT NULL,
  `numero_referencia` varchar(100) NOT NULL,
  `tipo_promocion` varchar(50) NOT NULL,
  `numero_promocion_sears` varchar(50) NOT NULL,
  `meses_diferimiento_promocion` varchar(50) NOT NULL,
  `meses_parcializacion` varchar(50) NOT NULL,
  `modo_entrada_tarjeta` varchar(50) NOT NULL,
  `clave_operacion` varchar(50) NOT NULL,
  `conciliar` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id_conciliacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Tabla encargada de registrar todas las transacciones generadas con la forma de pago American Express';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conciliacion_sears`
--

DROP TABLE IF EXISTS `conciliacion_sears`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conciliacion_sears` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Id del registro',
  `num_pedido` int(10) DEFAULT NULL COMMENT 'Numero de pedido',
  `estatus` tinyint(1) DEFAULT NULL COMMENT '1:aprobada 2:rechazada 3:cancelada 4:devolucion',
  `fecha` datetime DEFAULT NULL COMMENT 'Fecha del registro',
  `num_tarjeta` varchar(50) DEFAULT NULL COMMENT 'Numero de tarjeta encriptado ',
  `importe` double DEFAULT NULL COMMENT 'Importe total de la transaccion',
  `referencia` varchar(20) DEFAULT NULL COMMENT 'Numero de autorizacion',
  `completa` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Determina si la transaccion fue completada:0 no, 1 si',
  `ventas` tinyint(1) DEFAULT 0 COMMENT 'Determina si es venta o no ',
  `pp` varchar(45) DEFAULT '00',
  `sec` varchar(45) DEFAULT '10',
  `nombre` varchar(200) DEFAULT '',
  `formaPago` varchar(10) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conciliacion_sears_control`
--

DROP TABLE IF EXISTS `conciliacion_sears_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conciliacion_sears_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `procesado` int(11) DEFAULT NULL,
  `fecha_conciliado` datetime DEFAULT NULL,
  `fecha_respuesta` datetime DEFAULT NULL,
  `fuente` varchar(10) DEFAULT NULL COMMENT 'CRON\nMANUAL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conocimiento_embarque_app`
--

DROP TABLE IF EXISTS `conocimiento_embarque_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conocimiento_embarque_app` (
  `id_conocimiento_embarque` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `numero_pedido` int(11) NOT NULL,
  `numero_guia` varchar(90) NOT NULL,
  `relacion_pedidos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`relacion_pedidos`)),
  `comercio_pedidos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`comercio_pedidos`)),
  `fecha_registro` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `id_usuario` int(11) DEFAULT NULL,
  `id_tienda` int(11) DEFAULT NULL,
  `scaneado` tinyint(1) DEFAULT NULL,
  `embarque` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_conocimiento_embarque`),
  KEY `i_pedido_scanguia` (`numero_pedido`),
  KEY `i_guia_scanguia` (`numero_guia`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_acceso`
--

DROP TABLE IF EXISTS `control_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_acceso` (
  `id_control_acceso` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `ip_usuario` varchar(130) DEFAULT NULL,
  `estatus` tinyint(4) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_control_acceso`),
  KEY `fk_control_usuario` (`id_usuario`),
  KEY `fk_control_sucursal` (`id_sucursal`),
  CONSTRAINT `fk_control_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`),
  CONSTRAINT `fk_control_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_correo_factura`
--

DROP TABLE IF EXISTS `control_correo_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_correo_factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `correo_destino` varchar(200) NOT NULL DEFAULT '',
  `enviado` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_enviado` datetime NOT NULL,
  `usuario_envia` int(11) NOT NULL DEFAULT 0,
  `ticket_unico` varchar(100) NOT NULL DEFAULT '',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fechamodificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_control_correo_factura_num_pedido` (`numero_pedido`),
  CONSTRAINT `fk_control_correo_factura_num_pedido` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_correos`
--

DROP TABLE IF EXISTS `control_correos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_correos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fuente` varchar(60) DEFAULT NULL,
  `numero_pedido` int(11) DEFAULT NULL,
  `correos_destino` varchar(254) DEFAULT NULL,
  `enviado` int(11) DEFAULT 0,
  `fecha_enviado` datetime DEFAULT NULL,
  `usuario_envia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_numero_pedido` (`numero_pedido`),
  KEY `idx_enviado` (`enviado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_creditienda_facturacion`
--

DROP TABLE IF EXISTS `control_creditienda_facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_creditienda_facturacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `importe` varchar(255) NOT NULL,
  `no_cia` varchar(255) NOT NULL DEFAULT '',
  `no_reg` varchar(255) NOT NULL DEFAULT '',
  `no_tda` varchar(255) NOT NULL DEFAULT '',
  `no_trx` varchar(255) NOT NULL DEFAULT '',
  `pedido` varchar(255) NOT NULL DEFAULT '',
  `token` varchar(255) NOT NULL DEFAULT '',
  `xml_request` longtext DEFAULT NULL,
  `xml_response` longtext DEFAULT NULL,
  `respuesta` varchar(255) NOT NULL DEFAULT '',
  `fecha_envio` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_cu`
--

DROP TABLE IF EXISTS `control_cu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_cu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `sku` varchar(50) NOT NULL DEFAULT '',
  `tipo` int(1) NOT NULL COMMENT '1=bloqueo, 2=confirmado, 3=cancelado',
  `intentos` int(11) NOT NULL,
  `estatus` int(1) NOT NULL COMMENT '0=pendiente,1=completo,3=error',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_control_cu_numero_pedido` (`numero_pedido`),
  KEY `fk_control_cu_relacion_pedidos` (`id_relacion_pedido`),
  CONSTRAINT `fk_control_cu_numero_pedido` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_control_cu_relacion_pedidos` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_cybersource`
--

DROP TABLE IF EXISTS `control_cybersource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_cybersource` (
  `control_cybersource_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `mail_cliente` varchar(150) DEFAULT NULL,
  `fecha_transaccion` datetime DEFAULT NULL,
  `respuesta_cybersource` varchar(50) DEFAULT NULL,
  `monto_transaccion` double DEFAULT NULL,
  `intento_por_dia` int(11) DEFAULT NULL,
  `sumatoria_al_dia` double DEFAULT NULL,
  `productos` mediumtext DEFAULT NULL,
  PRIMARY KEY (`control_cybersource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_mensajeria`
--

DROP TABLE IF EXISTS `control_mensajeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_mensajeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL DEFAULT 0,
  `relacion_pedido` int(11) NOT NULL DEFAULT 0,
  `guia` varchar(90) DEFAULT NULL,
  `estatus` int(11) NOT NULL DEFAULT 0,
  `fecha_registro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_cancela` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_entrega` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tipo_guia` varchar(20) NOT NULL DEFAULT '',
  `guia_precedencia` varchar(90) NOT NULL,
  `guia_sustituta` varchar(25) NOT NULL DEFAULT '',
  `usuario_genera` int(11) NOT NULL DEFAULT 0,
  `usuario_modifica` int(11) NOT NULL DEFAULT 0,
  `usuario_cancela` int(11) NOT NULL DEFAULT 0,
  `compania` int(11) NOT NULL DEFAULT 0,
  `estatus_track` varchar(20) NOT NULL DEFAULT '',
  `regenerado` int(11) DEFAULT 0,
  `fecha_generada` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_relacion` (`numero_pedido`,`relacion_pedido`,`guia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25175 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_monitor_pi`
--

DROP TABLE IF EXISTS `control_monitor_pi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_monitor_pi` (
  `id_ctrl` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla',
  `forma_notifica` enum('ARCHIVO','SERVICIO') CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL COMMENT 'Se notifica por Archivo o por peticion al servico de Genesis',
  `num_pedido` int(11) NOT NULL COMMENT 'Numero de pedido',
  `id_relacion_pedido` int(11) NOT NULL COMMENT 'Id relacion pedido',
  `contenido_ctrl` text CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL COMMENT 'Contenido del Arcvhio o respuesta de la petición',
  `tipo_metodo` enum('CANCELAR','AVANZAR') CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL COMMENT 'Metodo que se utilizo para Pedidos de Internet',
  `estatus` tinyint(1) NOT NULL DEFAULT 1,
  `usr_id_solicita` int(11) NOT NULL COMMENT 'usuario del axii que solicita en el monitor',
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha del registro',
  `fecha_modificacion` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_ctrl`),
  KEY `idx_num_pedido` (`num_pedido`) USING BTREE,
  KEY `idx_id_relacion_pedido` (`id_relacion_pedido`) USING BTREE,
  KEY `idx_fecha_registro` (`fecha_registro`) USING BTREE,
  CONSTRAINT `control_monitor_pi_id_relacion_pedidos` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `control_monitor_pi_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_notif_genesix`
--

DROP TABLE IF EXISTS `control_notif_genesix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_notif_genesix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('cancelado','entregado') NOT NULL,
  `pedido` int(11) NOT NULL,
  `relacion_pedido` int(11) NOT NULL,
  `estatus_producto` int(11) NOT NULL,
  `tienda_fisica` varchar(50) NOT NULL,
  `transferencia` int(11) NOT NULL,
  `estatus_transferencia` int(2) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_pedido` (`pedido`) USING BTREE,
  KEY `idx_relacion_pedido` (`relacion_pedido`) USING BTREE,
  CONSTRAINT `fk_pedido_control_notif_genesix` FOREIGN KEY (`pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_relacion_pedido_control_notif_genesix` FOREIGN KEY (`relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_remboloso_realizado`
--

DROP TABLE IF EXISTS `control_remboloso_realizado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_remboloso_realizado` (
  `id_rr` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `comprobante` varchar(200) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_rr`),
  KEY `num_pedido` (`num_pedido`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  CONSTRAINT `fk_crr_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_crr_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_sales_audit`
--

DROP TABLE IF EXISTS `control_sales_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_sales_audit` (
  `id_control_sales_audit` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `tipo_transaccion_sa` int(11) NOT NULL,
  `registradora_enviada` varchar(45) DEFAULT NULL,
  `transaccion_enviada` varchar(45) DEFAULT NULL,
  `monto_pedido` double NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` int(11) NOT NULL DEFAULT 1,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  `conciliado` int(11) NOT NULL DEFAULT 0,
  `tienda_confirmada` int(11) NOT NULL DEFAULT 0,
  `fecha_venta_confirmada` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sales_audit_response` int(11) NOT NULL DEFAULT 0,
  `cancelado_mesa` tinyint(1) DEFAULT 0,
  `fecha_cancelado_mesa` datetime DEFAULT '0000-00-00 00:00:00',
  `tienda_anticipo` int(11) NOT NULL DEFAULT 570,
  `enviado_mesa_regalo` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_enviado_mesa_regalo` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_anticipo_pos` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_venta_pos` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_cancela_pos` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_control_sales_audit`),
  KEY `i_control_sales` (`numero_pedido`),
  KEY `i_relacion_sales` (`id_relacion_pedido`),
  KEY `i_estatus` (`estatus`) USING BTREE,
  KEY `i_conciliado` (`conciliado`) USING BTREE,
  KEY `fecha_alta` (`fecha_alta`) USING BTREE,
  KEY `registradora_enviada` (`registradora_enviada`) USING BTREE,
  KEY `sales_audit_response` (`sales_audit_response`) USING BTREE,
  KEY `estatus` (`estatus`) USING BTREE,
  CONSTRAINT `fk_control_sales` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`),
  CONSTRAINT `fk_relacion_sales` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9096464 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_sales_audit_temp`
--

DROP TABLE IF EXISTS `control_sales_audit_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_sales_audit_temp` (
  `id_control_sales_audit` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `tipo_transaccion_sa` int(11) NOT NULL,
  `registradora_enviada` varchar(45) DEFAULT NULL,
  `transaccion_enviada` varchar(45) DEFAULT NULL,
  `monto_pedido` double NOT NULL,
  `conciliado` int(11) NOT NULL DEFAULT 0 COMMENT '0 = Pendiente, 1 = Procesado',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` int(11) NOT NULL DEFAULT 1,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_control_sales_audit`),
  KEY `i_control_sales` (`numero_pedido`),
  KEY `i_relacion_sales` (`id_relacion_pedido`),
  CONSTRAINT `fk_control_sales_temp_numero_pedido` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`),
  CONSTRAINT `fk_relacion_sales_temp_id_relacion_pedido` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=344461 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_signature_mensajeria`
--

DROP TABLE IF EXISTS `control_signature_mensajeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_signature_mensajeria` (
  `id_control_signature_mensajeria` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `guia` varchar(90) NOT NULL,
  `archivo` text NOT NULL,
  `signature_url` text NOT NULL,
  `enviado` tinyint(4) NOT NULL DEFAULT 0,
  `fecha_envio` datetime NOT NULL,
  `id_mensajeria` int(11) NOT NULL DEFAULT 0,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `usuario_alta` int(11) NOT NULL DEFAULT 0,
  `usuario_modifica` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_control_signature_mensajeria`),
  KEY `i_pedido_ctrlmsj` (`numero_pedido`),
  KEY `i_guia_ctrlmsj` (`guia`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_sms_clientes`
--

DROP TABLE IF EXISTS `control_sms_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_sms_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT 1,
  `mensaje` text NOT NULL,
  `archivo` varchar(100) NOT NULL,
  `fecha_envio` datetime NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_num_pedido` (`num_pedido`) USING BTREE,
  CONSTRAINT `fk_control_sms_clientes_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_tag_afiliados`
--

DROP TABLE IF EXISTS `control_tag_afiliados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_tag_afiliados` (
  `id_control_tag_afiliados` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `status_sears` varchar(30) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_control_tag_afiliados`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_transacciones_sears`
--

DROP TABLE IF EXISTS `control_transacciones_sears`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_transacciones_sears` (
  `id_control_transacciones_sears` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL COMMENT 'Almacena el numero de pedido',
  `registradora` int(11) NOT NULL,
  `transaccion` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` int(11) NOT NULL DEFAULT 1,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  `fecha_asignacion` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_control_transacciones_sears`),
  KEY `i_control_transaccion` (`numero_pedido`),
  CONSTRAINT `fk_control_transaccion` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=5165386 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_transacciones_sears_b`
--

DROP TABLE IF EXISTS `control_transacciones_sears_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_transacciones_sears_b` (
  `id_control_transacciones_sears` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL COMMENT 'Almacena el numero de pedido',
  `registradora` int(11) NOT NULL,
  `transaccion` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` int(11) NOT NULL DEFAULT 1,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  `fecha_asignacion` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_control_transacciones_sears`),
  KEY `i_control_transaccion` (`numero_pedido`),
  CONSTRAINT `fk_control_transaccion_b` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `control_transacciones_sears_tmp`
--

DROP TABLE IF EXISTS `control_transacciones_sears_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_transacciones_sears_tmp` (
  `id_control_transacciones_sears` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL COMMENT 'Almacena el numero de pedido',
  `registradora` int(11) NOT NULL,
  `transaccion` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` int(11) NOT NULL DEFAULT 1,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_control_transacciones_sears`),
  KEY `i_control_transaccion` (`numero_pedido`),
  CONSTRAINT `fk_control_transaccion2` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=462256 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cps_cobertura_mensajeria`
--

DROP TABLE IF EXISTS `cps_cobertura_mensajeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cps_cobertura_mensajeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensajeria` int(11) NOT NULL,
  `codigo_postal` varchar(5) NOT NULL,
  `nombre_colonia` varchar(150) NOT NULL DEFAULT '',
  `asentamiento` varchar(150) NOT NULL DEFAULT '',
  `municipio` varchar(150) NOT NULL DEFAULT '',
  `estado` varchar(150) NOT NULL DEFAULT '',
  `ciudad` varchar(150) NOT NULL DEFAULT '',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `i_cobertura_men` (`mensajeria`),
  KEY `i_cobertura_cp` (`codigo_postal`)
) ENGINE=InnoDB AUTO_INCREMENT=4809 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cps_skydrop`
--

DROP TABLE IF EXISTS `cps_skydrop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cps_skydrop` (
  `id_cp` int(11) NOT NULL AUTO_INCREMENT,
  `zona` char(50) NOT NULL,
  `codigo_postal` varchar(6) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  `tipo_colonia` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_cp`)
) ENGINE=InnoDB AUTO_INCREMENT=1518 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creditienda_track`
--

DROP TABLE IF EXISTS `creditienda_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditienda_track` (
  `id_creditienda_track` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_relacion` int(11) NOT NULL,
  `estatus_pedido` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `respuesta` varchar(200) DEFAULT NULL,
  `envio` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_creditienda_track`),
  KEY `i_pedido_creditienda` (`num_pedido`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cron_impuestognx`
--

DROP TABLE IF EXISTS `cron_impuestognx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_impuestognx` (
  `id_cron_impuestosgnx` int(11) NOT NULL AUTO_INCREMENT,
  `ean` varchar(20) DEFAULT '',
  `sku` varchar(20) DEFAULT '',
  `departamento` char(4) DEFAULT '',
  `sub_departamento` char(4) DEFAULT '',
  `impuesto` float(5,2) DEFAULT 0.00,
  `codigo_fiscal` char(15) DEFAULT '',
  `unidad_de_medida` char(3) DEFAULT '',
  `bandera_importacion` char(1) DEFAULT '',
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `tienda` varchar(5) NOT NULL,
  `id_tienda` int(11) NOT NULL DEFAULT 2430,
  PRIMARY KEY (`id_cron_impuestosgnx`) USING BTREE,
  KEY `i_ci_sku` (`sku`),
  KEY `i_ci_tienda` (`tienda`),
  KEY `i_ci_ean` (`ean`),
  KEY `i_idtienda` (`id_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=863193 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cron_impuestognx_swap`
--

DROP TABLE IF EXISTS `cron_impuestognx_swap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_impuestognx_swap` (
  `id_cron_impuestosgnx` int(11) NOT NULL AUTO_INCREMENT,
  `ean` varchar(20) DEFAULT '',
  `sku` varchar(20) DEFAULT '',
  `departamento` char(4) DEFAULT '',
  `sub_departamento` char(4) DEFAULT '',
  `impuesto` float(5,2) DEFAULT 0.00,
  `codigo_fiscal` char(15) DEFAULT '',
  `unidad_de_medida` char(3) DEFAULT '',
  `bandera_importacion` char(1) DEFAULT '',
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `tienda` varchar(5) NOT NULL,
  PRIMARY KEY (`id_cron_impuestosgnx`) USING BTREE,
  KEY `i_tienda_gnx` (`tienda`) USING BTREE,
  KEY `i_sku_gnx` (`sku`) USING BTREE,
  KEY `i_ean_gnx` (`ean`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=863183 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cron_mails`
--

DROP TABLE IF EXISTS `cron_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_mails` (
  `identidad` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `emailfuente` varchar(250) NOT NULL DEFAULT '',
  `emailnombre` varchar(250) NOT NULL DEFAULT '',
  `emaildestino` varchar(250) NOT NULL DEFAULT '',
  `subject` varchar(250) NOT NULL DEFAULT '',
  `cuerpo` mediumtext NOT NULL,
  `tipo` varchar(250) NOT NULL DEFAULT '',
  `origen` varchar(250) NOT NULL DEFAULT '',
  `prioridad` int(10) unsigned NOT NULL DEFAULT 0,
  `estatus` int(10) unsigned NOT NULL DEFAULT 0,
  `intentos` int(10) unsigned NOT NULL DEFAULT 0,
  `fechasolicitud` datetime DEFAULT '0000-00-00 00:00:00',
  `fechaenvio` datetime DEFAULT '0000-00-00 00:00:00',
  `pedidoreferencia` varchar(250) NOT NULL DEFAULT '',
  `programacionenvio` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`identidad`),
  KEY `Index_2` (`estatus`,`intentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctg_ciudad`
--

DROP TABLE IF EXISTS `ctg_ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctg_ciudad` (
  `idctg_ciudad` int(11) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `idctg_estado` int(11) NOT NULL,
  PRIMARY KEY (`idctg_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctg_mensajeria`
--

DROP TABLE IF EXISTS `ctg_mensajeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctg_mensajeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensajeria` varchar(60) NOT NULL,
  `orden` int(11) NOT NULL,
  `visible` int(11) DEFAULT NULL,
  `id_t1envios` int(11) NOT NULL DEFAULT 0 COMMENT 'Match para mensajeras de t1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctg_tipo_descuento`
--

DROP TABLE IF EXISTS `ctg_tipo_descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctg_tipo_descuento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci DEFAULT '',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctrl_email_claroshop`
--

DROP TABLE IF EXISTS `ctrl_email_claroshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctrl_email_claroshop` (
  `id_ctrl_email` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL DEFAULT 0,
  `datos_correo` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci DEFAULT NULL,
  `tipo_correo` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci DEFAULT NULL,
  `recordatorio` tinyint(1) DEFAULT NULL,
  `solicitud` text CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci DEFAULT NULL,
  `respuesta` text CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci DEFAULT NULL,
  `enviado` tinyint(1) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT '0000-00-00 00:00:00',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `origen` varchar(100) NOT NULL,
  `hash` varchar(100) NOT NULL,
  `salt` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ctrl_email`),
  KEY `num_pedido` (`num_pedido`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20417 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctrl_email_retraso`
--

DROP TABLE IF EXISTS `ctrl_email_retraso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctrl_email_retraso` (
  `id_email_retraso` int(11) NOT NULL AUTO_INCREMENT,
  `id_ctrl_email` int(11) DEFAULT NULL,
  `id_rel_pedido` int(11) NOT NULL DEFAULT 0,
  `num_pedido` int(11) NOT NULL DEFAULT 0,
  `id_producto` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_email_retraso`),
  KEY `id_ctrl_email` (`id_ctrl_email`) USING BTREE,
  KEY `num_pedido` (`num_pedido`) USING BTREE,
  KEY `id_producto` (`id_producto`) USING BTREE,
  KEY `fecha_alta` (`fecha_alta`) USING BTREE,
  KEY `fecha_modificacion` (`fecha_modificacion`) USING BTREE,
  KEY `id_rel_pedido` (`id_rel_pedido`) USING BTREE,
  CONSTRAINT `fk_ctrl_email_retraso_id_ctrl_email` FOREIGN KEY (`id_ctrl_email`) REFERENCES `ctrl_email_claroshop` (`id_ctrl_email`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_ctrl_email_retraso_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos_borrar` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cupones`
--

DROP TABLE IF EXISTS `cupones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupones` (
  `Id_Cupon` varchar(13) NOT NULL,
  `Codigo` varchar(20) NOT NULL,
  `Nombre` varchar(250) DEFAULT NULL,
  `Descripcion` mediumtext DEFAULT NULL,
  `Cantidad` float DEFAULT NULL,
  `Porcentaje` float DEFAULT NULL,
  `Compra_Minima` float DEFAULT NULL,
  `Tipo` int(1) NOT NULL DEFAULT 1 COMMENT '1=Mall, 2=Envio, 3=Admon',
  `Unico` int(1) NOT NULL DEFAULT 0 COMMENT '1- solo un usuario 0-todos los usuarios',
  `Activo` int(1) NOT NULL DEFAULT 1 COMMENT '1-activado 0-desactivado',
  `Inicia` datetime DEFAULT NULL,
  `Vence` datetime DEFAULT NULL,
  `Asignado_a` varchar(250) DEFAULT NULL,
  `Fecha_Creacion` datetime NOT NULL,
  `portal` int(5) DEFAULT 0,
  `promocion` int(11) DEFAULT NULL COMMENT 'promocion a la cual corresponde el cupon',
  `usuario` int(11) DEFAULT NULL COMMENT 'usuario que genero el cupon',
  `enviado` int(1) DEFAULT NULL,
  PRIMARY KEY (`Id_Cupon`),
  KEY `Asignado_a` (`Asignado_a`),
  KEY `completo` (`Codigo`,`Asignado_a`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cupones_promocion`
--

DROP TABLE IF EXISTS `cupones_promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupones_promocion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promocion` varchar(70) DEFAULT NULL COMMENT 'nombre de la promocion',
  `inicio` date DEFAULT NULL COMMENT 'inicio de la campana',
  `finaliza` date DEFAULT NULL COMMENT 'fin de la campana',
  `portal` int(11) DEFAULT NULL COMMENT 'portal donde se uso la promocion',
  `activado` int(1) DEFAULT 1 COMMENT '1 activado 0 no activado',
  `fecha` datetime DEFAULT NULL COMMENT 'fecha que se inserto el registro',
  `notificable` int(1) DEFAULT 1 COMMENT '1 si se agrega a los reportes de notificacion 0-no se agrega a los reportes de notificacion',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cybersource_transacciones`
--

DROP TABLE IF EXISTS `cybersource_transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cybersource_transacciones` (
  `request_id` varchar(25) NOT NULL DEFAULT '',
  `id_pedido` varchar(25) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `tipo_targeta` varchar(10) DEFAULT NULL,
  `targeta_numero` varchar(25) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `merchant_reference_code` varchar(25) DEFAULT NULL,
  `decision` varchar(10) DEFAULT NULL,
  `reason_code` int(11) DEFAULT NULL,
  `card_scheme` varchar(25) DEFAULT NULL,
  `card_issuer` varchar(25) DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  FULLTEXT KEY `Request_id` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos_clientes`
--

DROP TABLE IF EXISTS `datos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_clientes` (
  `Cliente` int(11) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Entre_Calles` varchar(100) DEFAULT NULL,
  `Colonia` varchar(100) DEFAULT NULL,
  `Ciudad` varchar(100) NOT NULL,
  `Estado` varchar(100) NOT NULL,
  `Codigo_Postal` varchar(10) NOT NULL,
  `Pais` varchar(100) NOT NULL,
  `Lada` varchar(10) DEFAULT NULL,
  `Telefono1` varchar(50) NOT NULL,
  `Celular` varchar(50) DEFAULT NULL,
  `Fecha_Inicio` datetime DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Tarjeta` tinyint(1) NOT NULL DEFAULT 0,
  `num_ext` varchar(10) DEFAULT NULL,
  `num_int` varchar(15) DEFAULT NULL,
  `es_telmex` tinyint(1) unsigned DEFAULT 0,
  `es_telcel` tinyint(1) unsigned DEFAULT 0,
  `municipio` varchar(150) DEFAULT NULL,
  `municipio_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Cliente`),
  KEY `DatosContactoPersonales` (`Codigo_Postal`,`Telefono1`,`Celular`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos_deposito`
--

DROP TABLE IF EXISTS `datos_deposito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_deposito` (
  `id_deposito` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_deposito` varchar(30) DEFAULT NULL,
  `nombre_cliente` varchar(120) DEFAULT NULL,
  `banco` varchar(80) DEFAULT NULL,
  `numero_cuenta` varchar(20) DEFAULT NULL,
  `sucursal` varchar(70) DEFAULT NULL,
  `numero_pedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_deposito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos_factura`
--

DROP TABLE IF EXISTS `datos_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_factura` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `pedidoNormalizado` varchar(20) DEFAULT NULL,
  `factura` mediumtext DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Creada` char(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos_pedido`
--

DROP TABLE IF EXISTS `datos_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_pedido` (
  `Pedido` int(11) NOT NULL,
  `Entregar` varchar(200) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Entre_Calles` varchar(100) DEFAULT NULL,
  `Colonia` varchar(100) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT NULL,
  `CP` varchar(30) DEFAULT NULL,
  `Pais` varchar(100) DEFAULT NULL,
  `Lada` varchar(50) DEFAULT NULL,
  `Telefono` varchar(100) DEFAULT NULL,
  `Observaciones` varchar(255) DEFAULT NULL,
  `es_regalo` tinyint(1) DEFAULT 0,
  `mensaje_regalo` varchar(255) DEFAULT NULL,
  `numero_exterior` varchar(25) DEFAULT NULL,
  `numero_interior` varchar(25) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `municipio` varchar(150) DEFAULT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `apellido_paterno` varchar(100) DEFAULT NULL,
  `calle` varchar(200) DEFAULT NULL,
  `local_entrega` varchar(100) DEFAULT NULL,
  `accesibilidad` varchar(100) DEFAULT NULL,
  `persona_autorizada` varchar(100) DEFAULT NULL,
  `piso_n` varchar(500) DEFAULT NULL,
  `estado_ts` varchar(200) DEFAULT NULL,
  `ciudad_ts` varchar(200) DEFAULT NULL,
  `id_sucursal` int(5) DEFAULT NULL,
  `existe_ts` tinyint(1) DEFAULT NULL,
  `latitud` varchar(15) NOT NULL DEFAULT '0.0',
  `longitud` varchar(15) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`Pedido`),
  KEY `i_dp_estado` (`Estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos_pedido_historial`
--

DROP TABLE IF EXISTS `datos_pedido_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_pedido_historial` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pedido` int(11) NOT NULL,
  `Entregar` varchar(100) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Entre_Calles` varchar(100) DEFAULT NULL,
  `Colonia` varchar(100) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT NULL,
  `CP` varchar(11) DEFAULT NULL,
  `Pais` varchar(100) DEFAULT NULL,
  `Lada` varchar(11) DEFAULT NULL,
  `Telefono` varchar(100) DEFAULT NULL,
  `Observaciones` varchar(255) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos_presupuesto_pedido`
--

DROP TABLE IF EXISTS `datos_presupuesto_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_presupuesto_pedido` (
  `idpresupuestopedido` int(11) NOT NULL,
  `entregar` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `entrecalles` varchar(100) DEFAULT NULL,
  `colonia` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `cp` varchar(30) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `lada` varchar(50) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `esregalo` tinyint(1) DEFAULT 0,
  `mensajeregalo` varchar(255) DEFAULT NULL,
  `numeroexterior` varchar(25) DEFAULT NULL,
  `numerointerior` varchar(25) DEFAULT NULL,
  `idmunicipio` int(11) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `municipio` varchar(150) DEFAULT NULL,
  `apellidomaterno` varchar(100) DEFAULT NULL,
  `apellidopaterno` varchar(100) DEFAULT NULL,
  `calle` varchar(200) DEFAULT NULL,
  `localentrega` varchar(100) DEFAULT NULL,
  `accesibilidad` varchar(100) DEFAULT NULL,
  `personaautorizada` varchar(100) DEFAULT NULL,
  `pison` varchar(500) DEFAULT NULL,
  `estadots` varchar(200) DEFAULT NULL,
  `ciudadts` varchar(200) DEFAULT NULL,
  `idsucursal` int(5) DEFAULT NULL,
  `existets` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idpresupuestopedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos_reembolso`
--

DROP TABLE IF EXISTS `datos_reembolso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_reembolso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `clabe_interbancaria` varchar(25) NOT NULL,
  `nombre_banco` varchar(50) NOT NULL,
  `nombre_titular` varchar(100) NOT NULL,
  `rfc` varchar(15) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `num_pedido` (`num_pedido`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  KEY `idx_id_cliente` (`id_cliente`) USING BTREE,
  KEY `idx_id_relacion_pedido` (`id_relacion_pedido`) USING BTREE,
  CONSTRAINT `fk_datos_reembolso_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_datos_reembolso_id_relacion_pedido` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_datos_reembolso_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_datos_reembolso_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=967 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datosenvio`
--

DROP TABLE IF EXISTS `datosenvio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `datosenvio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '',
  `direccion` varchar(255) NOT NULL,
  `entre_calles` varchar(100) DEFAULT NULL,
  `colonia` varchar(100) DEFAULT '',
  `ciudad` varchar(100) NOT NULL DEFAULT '',
  `estado` varchar(100) NOT NULL DEFAULT '',
  `cp` varchar(15) NOT NULL DEFAULT '',
  `pais` varchar(45) NOT NULL DEFAULT '',
  `lada` varchar(15) DEFAULT '',
  `telefono` varchar(45) NOT NULL DEFAULT '',
  `observaciones` varchar(255) DEFAULT '',
  `idCliente` int(10) unsigned NOT NULL DEFAULT 0,
  `es_regalo` tinyint(1) DEFAULT 0,
  `mensaje_regalo` varchar(255) DEFAULT NULL,
  `num_ext` varchar(50) DEFAULT 'NULL',
  `num_int` varchar(50) DEFAULT 'NULL',
  `celular` varchar(20) DEFAULT NULL,
  `es_telmex` tinyint(1) unsigned DEFAULT 0,
  `es_telcel` tinyint(1) unsigned DEFAULT 0,
  `municipio` varchar(150) DEFAULT NULL,
  `municipio_id` int(10) DEFAULT NULL,
  `apellido_materno` varchar(200) DEFAULT NULL,
  `apellido_paterno` varchar(200) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `local_entrega` varchar(100) DEFAULT NULL,
  `accesibilidad` varchar(100) DEFAULT NULL,
  `persona_autorizada` varchar(200) DEFAULT NULL,
  `piso_n` varchar(200) DEFAULT NULL,
  `tipo_cliente` binary(1) DEFAULT x'30',
  `alias` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `por_cliente` (`idCliente`,`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detalle_cupon`
--

DROP TABLE IF EXISTS `detalle_cupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_cupon` (
  `id_detalle_cupon` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cupon` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_estatus_cupon` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` varchar(50) NOT NULL,
  `usuario_modifica` varchar(50) DEFAULT NULL,
  `usuario_baja` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_cupon`),
  KEY `detalle_cupon` (`id_cupon`) USING BTREE,
  KEY `detalle_serv` (`id_servicio`) USING BTREE,
  KEY `detalle_estatus` (`id_estatus_cupon`) USING BTREE,
  CONSTRAINT `detalle_cupon_ibfk_1` FOREIGN KEY (`id_cupon`) REFERENCES `cupon` (`id_cupon`),
  CONSTRAINT `detalle_cupon_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicios_decompras` (`id`),
  CONSTRAINT `detalle_cupon_ibfk_3` FOREIGN KEY (`id_estatus_cupon`) REFERENCES `estatus_cupon` (`id_estatus_cupon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detalle_descuento`
--

DROP TABLE IF EXISTS `detalle_descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_descuento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_relacion_pedido` int(11) NOT NULL,
  `id_tipo_descuento` int(11) NOT NULL,
  `plan_pago` int(11) NOT NULL DEFAULT 0,
  `secuencia` int(11) NOT NULL DEFAULT 0,
  `monto_descuento` float(7,2) NOT NULL DEFAULT 0.00,
  `porcentaje_descuento` float NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `forma_de_pago` int(11) NOT NULL,
  `id_promocion` int(11) NOT NULL,
  `mensualidades` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_id_relacion_pedido` (`id_relacion_pedido`) USING BTREE,
  KEY `idx_id_tipo_descuento` (`id_tipo_descuento`) USING BTREE,
  CONSTRAINT `fk_detalle_descuento_id_relacion_pedido` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_descuento_id_tipo_descuento` FOREIGN KEY (`id_tipo_descuento`) REFERENCES `ctg_tipo_descuento` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedidos` (
  `id_detalle_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `ProductoId` int(11) DEFAULT NULL,
  `imei` varchar(50) DEFAULT NULL,
  `sim` varchar(50) DEFAULT NULL,
  `serie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `imei_producto` (`ProductoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `direccion_facturacion`
--

DROP TABLE IF EXISTS `direccion_facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion_facturacion` (
  `id` varchar(30) NOT NULL,
  `calle_numero` varchar(255) DEFAULT NULL,
  `colonia` varchar(255) DEFAULT NULL,
  `cod_postal` varchar(20) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `numero_pedido` varchar(30) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `numero_pedido` (`numero_pedido`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_help_requests`
--

DROP TABLE IF EXISTS `dynamic_help_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_help_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relacion_pedidos_id` int(11) NOT NULL,
  `recurso` enum('ticket','etiqueta') NOT NULL,
  `request` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`request`)),
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`response`)),
  `code_response` int(11) NOT NULL,
  `fecha_response` datetime NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `usuario_alta` int(11) NOT NULL,
  `usuario_modifica` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL DEFAULT '',
  `user_profile` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `relacion_pedidos_id` (`relacion_pedidos_id`) USING BTREE,
  CONSTRAINT `fk_relacion_pedidos_dynamic` FOREIGN KEY (`relacion_pedidos_id`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1470 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_flujo_envios`
--

DROP TABLE IF EXISTS `email_flujo_envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_flujo_envios` (
  `id_email` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL DEFAULT 0,
  `datos_correo` longtext DEFAULT NULL,
  `tipo_correo` varchar(25) DEFAULT NULL,
  `solicitud` text DEFAULT NULL,
  `respuesta` text DEFAULT NULL,
  `enviado` tinyint(1) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT '0000-00-00 00:00:00',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `origen` varchar(100) NOT NULL,
  PRIMARY KEY (`id_email`),
  KEY `i_flujo_pedido` (`num_pedido`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=909 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `embarque`
--

DROP TABLE IF EXISTS `embarque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `embarque` (
  `Id_Embarque` int(11) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `visible` tinyint(1) DEFAULT NULL COMMENT '1-visible 0-no visible',
  PRIMARY KEY (`Id_Embarque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `embarque_tienda`
--

DROP TABLE IF EXISTS `embarque_tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `embarque_tienda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `id_conocimiento_embarque` int(11) NOT NULL,
  `id_pdf` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL DEFAULT 0,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_conocimiento_embarque` (`id_conocimiento_embarque`) USING BTREE,
  KEY `id_pdf` (`id_pdf`) USING BTREE,
  CONSTRAINT `fk_embarque_tienda_con_embarque` FOREIGN KEY (`id_conocimiento_embarque`) REFERENCES `conocimiento_embarque_app` (`id_conocimiento_embarque`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empleados_entrega_express`
--

DROP TABLE IF EXISTS `empleados_entrega_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados_entrega_express` (
  `id_moto` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) NOT NULL,
  `id_tienda` int(11) NOT NULL,
  `nombre_empleado` varchar(100) NOT NULL,
  `vehiculo` varchar(50) NOT NULL,
  `placas` varchar(20) NOT NULL,
  `no_eco` varchar(20) NOT NULL,
  `no_serie` varchar(100) NOT NULL,
  `motor` varchar(100) NOT NULL,
  `modelo` varchar(10) NOT NULL,
  `celular_empleado` varchar(15) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualiza` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_moto`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estatus_pedidos`
--

DROP TABLE IF EXISTS `estatus_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatus_pedidos` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Alias` varchar(100) DEFAULT NULL,
  `Activada` char(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etiquetas_devolucion_help_rel_pedido`
--

DROP TABLE IF EXISTS `etiquetas_devolucion_help_rel_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiquetas_devolucion_help_rel_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_pedido` varchar(20) NOT NULL DEFAULT '',
  `id_tienda_devolucion` int(11) NOT NULL,
  `id_tienda_origen` int(11) NOT NULL,
  `fecha_solicitud` datetime NOT NULL,
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL DEFAULT 0,
  `num_etiqueta` varchar(50) NOT NULL DEFAULT '',
  `num_guia` varchar(50) NOT NULL DEFAULT '',
  `solicitud` tinyint(4) NOT NULL DEFAULT 0,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `recibido` tinyint(4) NOT NULL DEFAULT 0,
  `origen` varchar(20) DEFAULT NULL,
  `tipo_envio` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etiquetas_devolucion_pos_codigo_barras`
--

DROP TABLE IF EXISTS `etiquetas_devolucion_pos_codigo_barras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiquetas_devolucion_pos_codigo_barras` (
  `id_etiquetas_codigo_barras` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_etiqueta` varchar(20) NOT NULL DEFAULT '',
  `id_tienda_origen` int(11) NOT NULL,
  `fecha_solicitud` datetime NOT NULL,
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `num_etiqueta` varchar(50) NOT NULL DEFAULT '',
  `codigo_barras` varchar(100) NOT NULL DEFAULT '',
  `solicitud` tinyint(4) NOT NULL DEFAULT 0,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `recibido` tinyint(4) NOT NULL DEFAULT 0,
  `origen` varchar(20) DEFAULT NULL,
  `tipo_envio` varchar(20) NOT NULL,
  PRIMARY KEY (`id_etiquetas_codigo_barras`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extras_proveedor`
--

DROP TABLE IF EXISTS `extras_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras_proveedor` (
  `id_extra` int(11) NOT NULL AUTO_INCREMENT,
  `id_tienda` int(11) NOT NULL,
  `id_tienda_AS400` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rfc` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_extra`),
  KEY `i_id_tienda` (`id_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=2522 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Razon_social` varchar(90) DEFAULT NULL,
  `Rfc` varchar(90) DEFAULT NULL,
  `Domicilio` tinytext DEFAULT NULL,
  `Solicita_usr` int(11) DEFAULT NULL,
  `Cliente` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `eliminada` int(11) DEFAULT NULL COMMENT '0-eliminada 1-activa',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factura_imr`
--

DROP TABLE IF EXISTS `factura_imr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_imr` (
  `id_factura_imr` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `guia` varchar(100) DEFAULT NULL,
  `num_proveedor` int(11) DEFAULT NULL,
  `factura` text DEFAULT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  PRIMARY KEY (`id_factura_imr`),
  KEY `num_pedido` (`num_pedido`) USING BTREE,
  KEY `i_guia_facimr` (`guia`),
  KEY `i_num_proveedor` (`num_proveedor`),
  CONSTRAINT `fk_factua_imr_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fallaguiat1enviov2`
--

DROP TABLE IF EXISTS `fallaguiat1enviov2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fallaguiat1enviov2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `relacion_pedido` varchar(900) DEFAULT NULL,
  `id_tienda_fisica` int(11) DEFAULT NULL,
  `id_servicio` int(11) DEFAULT NULL,
  `nombre_servicio` varchar(90) DEFAULT NULL,
  `servicio` varchar(200) DEFAULT NULL,
  `tipo_servicio` varchar(200) DEFAULT NULL,
  `fecha_banned_inicio` date DEFAULT NULL,
  `fecha_banned_fin` date DEFAULT NULL,
  `token_quote` varchar(200) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_numero_pedido` (`numero_pedido`),
  KEY `idx_id_servicio` (`id_servicio`),
  KEY `idx_nombre_servicio` (`nombre_servicio`),
  KEY `idx_servicio` (`servicio`),
  KEY `idx_id_tienda_fisica` (`id_tienda_fisica`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `folio_mensajerias`
--

DROP TABLE IF EXISTS `folio_mensajerias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `folio_mensajerias` (
  `id_folio` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `no_guia` varchar(30) NOT NULL,
  `usuario` varchar(70) NOT NULL,
  `no_folio` varchar(45) NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `comentario` text NOT NULL,
  `proceso` tinyint(4) DEFAULT 0,
  `termina` tinyint(4) DEFAULT 0,
  `fecha_termina` datetime DEFAULT NULL,
  PRIMARY KEY (`id_folio`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `folio_mensajerias_alibaba`
--

DROP TABLE IF EXISTS `folio_mensajerias_alibaba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `folio_mensajerias_alibaba` (
  `id_folio_mensajerias_alibaba` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `id_folio` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `id_motivo_reclamacion` int(11) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificación` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `id_usuario_alta` int(11) NOT NULL,
  `id_usurio_modifica` int(11) DEFAULT NULL,
  `id_usuario_baja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_folio_mensajerias_alibaba`),
  KEY `i_pedido_msjalibaba` (`numero_pedido`),
  KEY `i_relpedido_msjalibaba` (`id_relacion_pedido`),
  CONSTRAINT `fk_pedido_msjalibaba` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_relpedido_msjalibaba` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formas_pago_factura`
--

DROP TABLE IF EXISTS `formas_pago_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `formas_pago_factura` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT,
  `id_claroshop_pago` int(11) NOT NULL,
  `homologado` int(11) NOT NULL,
  `nombre_pago` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `idx_pagofactura` (`id_claroshop_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fotos`
--

DROP TABLE IF EXISTS `fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotos` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Foto` varchar(200) NOT NULL,
  `Miniatura` varchar(200) NOT NULL,
  `Tienda` int(11) NOT NULL,
  `Fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `orden` tinyint(4) DEFAULT 0 COMMENT 'orden al mostrar las fotos',
  `fecha_modificacion` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`Id`),
  KEY `por_tienda` (`Tienda`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fuente_tipificacion`
--

DROP TABLE IF EXISTS `fuente_tipificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fuente_tipificacion` (
  `id_fuente_tipificacion` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `id_cat_fuente` int(11) NOT NULL,
  `id_cat_tipificacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_atendido` datetime DEFAULT NULL,
  `usuario_valida` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_cat_padrestipif` int(11) DEFAULT 0,
  PRIMARY KEY (`id_fuente_tipificacion`),
  KEY `fk_fuentetip_pedido` (`num_pedido`),
  KEY `fk_fuentetip_relped` (`id_relacion_pedido`),
  KEY `fk_fuentetip_catfuente` (`id_cat_fuente`),
  KEY `fk_fuentetip_cattip` (`id_cat_tipificacion`),
  KEY `fk_fuentetip_usrusuario` (`id_usuario`),
  CONSTRAINT `fk_fuentetip_catfuente` FOREIGN KEY (`id_cat_fuente`) REFERENCES `catalogo_fuentes` (`id_cat_fuente`),
  CONSTRAINT `fk_fuentetip_cattip` FOREIGN KEY (`id_cat_tipificacion`) REFERENCES `catalogo_tipificacion` (`id_cat_tipificacion`),
  CONSTRAINT `fk_fuentetip_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`),
  CONSTRAINT `fk_fuentetip_relped` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`),
  CONSTRAINT `fk_fuentetip_usrusuario` FOREIGN KEY (`id_usuario`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guias_anexos`
--

DROP TABLE IF EXISTS `guias_anexos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guias_anexos` (
  `id_guias_anexos` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `guia` varchar(90) NOT NULL,
  `tipo_archivo` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_guias_anexos`),
  KEY `i_anexo_pedido` (`num_pedido`) USING BTREE,
  KEY `i_anexo_guia` (`guia`) USING BTREE,
  KEY `i_direccion_ga` (`direccion`),
  CONSTRAINT `fk_guias_anexos_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7106 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guias_duplicadas`
--

DROP TABLE IF EXISTS `guias_duplicadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guias_duplicadas` (
  `id_guia_duplicada` int(11) NOT NULL AUTO_INCREMENT,
  `numero_guia` varchar(90) NOT NULL,
  `identificador_guia` varchar(40) NOT NULL,
  `numero_pedido` int(11) NOT NULL,
  `enviado` tinyint(4) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` int(11) NOT NULL DEFAULT 1167,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_guia_duplicada`),
  KEY `i_guia_duplicada` (`numero_guia`),
  KEY `i_pedido_duplicado` (`numero_pedido`),
  CONSTRAINT `fk_guia_duplicada` FOREIGN KEY (`numero_guia`) REFERENCES `mensajeria_track` (`guia`),
  CONSTRAINT `fk_pedido_duplicado` FOREIGN KEY (`numero_pedido`) REFERENCES `mensajeria_track` (`num_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guiat1enviov2`
--

DROP TABLE IF EXISTS `guiat1enviov2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guiat1enviov2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `relacion_pedido` varchar(900) DEFAULT NULL,
  `id_tienda_fisica` int(11) DEFAULT NULL,
  `guia` varchar(90) NOT NULL,
  `paqueteria` varchar(90) DEFAULT NULL,
  `id_servicio` int(9) DEFAULT NULL,
  `nombre_servicio` varchar(90) DEFAULT NULL,
  `servicio` varchar(90) DEFAULT NULL,
  `remitente` varchar(90) DEFAULT NULL,
  `cp_remitente` varchar(10) DEFAULT NULL,
  `destinatario` varchar(90) DEFAULT NULL,
  `cp_destinario` varchar(10) DEFAULT NULL,
  `fecha_creacion_guia` datetime DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `link_guia` varchar(200) DEFAULT NULL,
  `guia_guardada` tinyint(1) DEFAULT 0,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_numero_pedido` (`numero_pedido`),
  KEY `idx_guia` (`guia`),
  KEY `idx_paqueteria` (`paqueteria`),
  KEY `idx_id_tienda_fisica` (`id_tienda_fisica`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guide_quote`
--

DROP TABLE IF EXISTS `guide_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guide_quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `json_out` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`json_out`)),
  `quotation_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`quotation_data`)),
  `guide_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`guide_data`)),
  `status` enum('pending','failed','successful') NOT NULL DEFAULT 'pending',
  `num_pedido` int(11) NOT NULL,
  `guide` varchar(100) NOT NULL DEFAULT '',
  `codigo` varchar(10) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gushup_evidence`
--

DROP TABLE IF EXISTS `gushup_evidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gushup_evidence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` text DEFAULT NULL,
  `relation_id` int(11) NOT NULL DEFAULT 0,
  `orientation` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url_s3` text DEFAULT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `validated` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fecha_alta` (`fecha_alta`) USING BTREE,
  KEY `relation_id` (`relation_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historial_estatus`
--

DROP TABLE IF EXISTS `historial_estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_estatus` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pedido` int(11) NOT NULL,
  `Estatus` int(11) DEFAULT NULL,
  `Usuario` varchar(70) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `i_historial_pedido` (`Pedido`),
  KEY `i_historial_estatus` (`Estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=25856323 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historial_estatus_presupuesto`
--

DROP TABLE IF EXISTS `historial_estatus_presupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_estatus_presupuesto` (
  `idhistorial` int(11) NOT NULL AUTO_INCREMENT,
  `numpedido` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecharegistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idhistorial`),
  KEY `pedido_estatus` (`numpedido`,`estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historial_estatus_productos`
--

DROP TABLE IF EXISTS `historial_estatus_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_estatus_productos` (
  `id_historial` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `estatus_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `usuario_ss` varchar(50) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_historial`),
  UNIQUE KEY `idxidhist` (`id_historial`) USING BTREE,
  KEY `fk_pedido_hist` (`num_pedido`),
  KEY `fk_relacion_hist` (`id_relacion_pedido`),
  KEY `fk_usuario_hist` (`id_usuario`),
  KEY `estatus_producto` (`estatus_producto`) USING BTREE,
  CONSTRAINT `historial_estatus_productos_ibfk_1` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`),
  CONSTRAINT `historial_estatus_productos_ibfk_2` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43372489 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historial_fecha_estimada`
--

DROP TABLE IF EXISTS `historial_fecha_estimada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_fecha_estimada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_fecha_estimada` int(11) NOT NULL,
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `fecha_estimada` mediumtext NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_histotial_fecha_estimada_relacion_pedido_fecha_estimada` (`id_fecha_estimada`) USING BTREE,
  KEY `fk_historial_fecha_estimada_pedidos` (`num_pedido`) USING BTREE,
  KEY `fk_historial_fecha_estimada_relacion_pedidos` (`id_relacion_pedido`) USING BTREE,
  KEY `fk_historial_fecha_estimada_id_usuario` (`id_usuario`),
  CONSTRAINT `fk_historial_fecha_estimada_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_historial_fecha_estimada_pedidos` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_historial_fecha_estimada_relacion_pedidos` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_histotial_fecha_estimada_relacion_pedido_fecha_estimada` FOREIGN KEY (`id_fecha_estimada`) REFERENCES `relacion_pedido_fecha_estimada` (`id_rel_pedido_fe`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6647863 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historial_pagos_imr`
--

DROP TABLE IF EXISTS `historial_pagos_imr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_pagos_imr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tienda` int(11) NOT NULL DEFAULT 0,
  `id_tienda_as` int(11) NOT NULL DEFAULT 0,
  `fcarga` date NOT NULL,
  `fecha` date NOT NULL,
  `id_imr` int(11) NOT NULL DEFAULT 0,
  `pago` int(11) NOT NULL DEFAULT 0,
  `mensaje` varchar(50) NOT NULL DEFAULT '',
  `id_usuario` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_historial_pagos_imr_id_imr` (`id_imr`),
  KEY `fk_historial_pagos_imr_id_usuario` (`id_usuario`),
  KEY `idx_id_tienda` (`id_tienda`) USING BTREE,
  KEY `idx_id_tienda_as` (`id_tienda_as`) USING BTREE,
  CONSTRAINT `fk_historial_pagos_imr_id_imr` FOREIGN KEY (`id_imr`) REFERENCES `pedidos_imr` (`imr`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_historial_pagos_imr_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_historial_pagos_imr_idx_id_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historial_pagos_imr_devolucion`
--

DROP TABLE IF EXISTS `historial_pagos_imr_devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_pagos_imr_devolucion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tienda` int(11) NOT NULL DEFAULT 0,
  `id_tienda_as` int(11) NOT NULL DEFAULT 0,
  `fcarga` date NOT NULL,
  `fecha` date NOT NULL,
  `id_imr` int(11) NOT NULL DEFAULT 0,
  `pago` int(11) NOT NULL DEFAULT 0,
  `mensaje` varchar(50) NOT NULL DEFAULT '',
  `id_usuario` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_historial_pagos_imr_id_imr` (`id_imr`),
  KEY `fk_historial_pagos_imr_id_usuario` (`id_usuario`),
  KEY `idx_id_tienda_as` (`id_tienda_as`) USING BTREE,
  KEY `idx_id_tienda` (`id_tienda`) USING BTREE,
  CONSTRAINT `fk_historial_pagos_imr_id_imr_devolucion` FOREIGN KEY (`id_imr`) REFERENCES `pedidos_imr_devolucion` (`imr_devolucion`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_historial_pagos_imr_id_usuario_devolucion` FOREIGN KEY (`id_usuario`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_historial_pagos_imr_idx_id_tienda_devolucion` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hojas_entrega_fedex`
--

DROP TABLE IF EXISTS `hojas_entrega_fedex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojas_entrega_fedex` (
  `id_hoja` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `guia` varchar(15) NOT NULL,
  `nombre_archivo` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_hoja`),
  UNIQUE KEY `nombre_archivo_UNIQUE` (`nombre_archivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imr_guias_dropshipping`
--

DROP TABLE IF EXISTS `imr_guias_dropshipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `imr_guias_dropshipping` (
  `imr_guia` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `guia` varchar(90) DEFAULT NULL,
  `id_seller` int(11) DEFAULT NULL,
  `id_as400` int(11) DEFAULT NULL,
  `codigo_mensajeria` varchar(30) DEFAULT NULL,
  `fecha_entrega_mensajeria` datetime DEFAULT NULL,
  `precio_total` float(20,2) DEFAULT NULL,
  `peso_total` float(20,2) DEFAULT NULL,
  `precio_guia` float(20,2) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`imr_guia`),
  KEY `i_guia_drop` (`guia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imr_guias_fullfilment`
--

DROP TABLE IF EXISTS `imr_guias_fullfilment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `imr_guias_fullfilment` (
  `imr_guia` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `guia` varchar(90) DEFAULT NULL,
  `id_seller` int(11) DEFAULT NULL,
  `id_as400` int(11) DEFAULT NULL,
  `codigo_mensajeria` varchar(30) DEFAULT NULL,
  `fecha_entrega_mensajeria` datetime DEFAULT NULL,
  `precio_total` float(20,2) DEFAULT NULL,
  `peso_total` float(20,2) DEFAULT NULL,
  `precio_guia` float(20,2) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`imr_guia`),
  KEY `i_guia_full` (`guia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intentos_cybersource`
--

DROP TABLE IF EXISTS `intentos_cybersource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `intentos_cybersource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` varchar(30) NOT NULL,
  `reference_code` varchar(30) NOT NULL,
  `cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(255) DEFAULT NULL,
  `pedido` int(11) DEFAULT NULL,
  `data` mediumtext DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `data_netpay` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ivoy`
--

DROP TABLE IF EXISTS `ivoy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ivoy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `guia` varchar(90) NOT NULL,
  `tipo_servicio` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_id_order` (`id_order`) USING BTREE,
  KEY `idx_guia` (`guia`) USING BTREE,
  KEY `idx_tipo_servicio` (`tipo_servicio`) USING BTREE,
  KEY `idx_fecha_creacion` (`fecha_creacion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lista_blanca`
--

DROP TABLE IF EXISTS `lista_blanca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_blanca` (
  `id_lista_blanca` int(11) NOT NULL AUTO_INCREMENT,
  `avs_ciudad` varchar(60) NOT NULL,
  `avs_nombre` varchar(40) NOT NULL,
  `avs_apellido_paterno` varchar(50) NOT NULL,
  `avs_apellido_materno` varchar(50) NOT NULL,
  `avs_estado` varchar(60) NOT NULL,
  `avs_direccion` varchar(50) NOT NULL,
  `avs_colonia` varchar(50) NOT NULL,
  `avs_municipio` varchar(50) DEFAULT NULL,
  `avs_cp` int(11) NOT NULL,
  `ciudad` varchar(60) DEFAULT NULL,
  `pais` varchar(60) DEFAULT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido_paterno` varchar(50) DEFAULT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `estado` varchar(60) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `municipio` varchar(50) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `tipo_tarjeta` varchar(20) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `entrada_cdt` datetime DEFAULT NULL,
  `pedido` int(11) DEFAULT NULL,
  `procedencia` varchar(10) DEFAULT NULL,
  `envio_ciudad` varchar(60) DEFAULT NULL,
  `envio_pais` varchar(60) DEFAULT NULL,
  `envio_estado` varchar(60) DEFAULT NULL,
  `envio_direccion` varchar(50) DEFAULT NULL,
  `envio_colonia` varchar(50) DEFAULT NULL,
  `envio_municipio` varchar(50) DEFAULT NULL,
  `envio_cp` int(11) DEFAULT NULL,
  `estatus` tinyint(4) DEFAULT NULL,
  `numero_tarjeta` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id_lista_blanca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lista_direcciones`
--

DROP TABLE IF EXISTS `lista_direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_direcciones` (
  `id_tienda` int(11) NOT NULL AUTO_INCREMENT,
  `num_tienda` int(11) NOT NULL,
  `nombre_encargado` varchar(250) NOT NULL,
  `puesto_encargado` varchar(100) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `correo_electronico2` varchar(100) NOT NULL,
  `correo_electronico3` text DEFAULT NULL,
  `tipo_tienda` varchar(50) NOT NULL,
  `nombre_tienda` varchar(100) NOT NULL,
  `zona_tienda` varchar(50) NOT NULL,
  `telefono_tienda` varchar(20) NOT NULL,
  `direccion_tienda` varchar(100) DEFAULT NULL,
  `colonia_tienda` varchar(100) DEFAULT NULL,
  `ciudad_tienda` varchar(50) NOT NULL,
  `codigo_estado_tienda` varchar(5) NOT NULL,
  `codigo_postal_tienda` varchar(10) NOT NULL,
  `codigo_pais_tienda` varchar(5) NOT NULL,
  `tipo_guia_tienda` varchar(5) NOT NULL,
  `fecha_alta_tienda` date NOT NULL,
  `tienda_claroshop` int(11) NOT NULL,
  `cel_aux_internet` varchar(100) NOT NULL,
  `cobertura_ivoy` int(11) NOT NULL DEFAULT 0,
  `no_exterior` varchar(10) NOT NULL DEFAULT '',
  `latitud` varchar(15) NOT NULL DEFAULT '',
  `longitud` varchar(15) NOT NULL DEFAULT '',
  `ivoy_od` tinyint(1) NOT NULL DEFAULT 0,
  `ivoy_nd` tinyint(1) DEFAULT 0,
  `dir_modulo_cyr` varchar(250) NOT NULL DEFAULT '',
  `horario_txt` varchar(50) NOT NULL DEFAULT '',
  `mapa_ubicacion` varchar(400) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_tienda`),
  KEY `i_listaNumtienda` (`num_tienda`),
  KEY `i_listatiendacs` (`tienda_claroshop`)
) ENGINE=InnoDB AUTO_INCREMENT=3564 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lista_negra`
--

DROP TABLE IF EXISTS `lista_negra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_negra` (
  `id_lista_negra` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(60) NOT NULL,
  `pais` varchar(60) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `estado` varchar(60) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `municipio` varchar(50) DEFAULT NULL,
  `cp` int(11) NOT NULL,
  `tipo_tarjeta` varchar(20) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `entrada_cdt` datetime DEFAULT NULL,
  `pedido` int(11) NOT NULL,
  `procedencia` varchar(10) DEFAULT NULL,
  `id_cliente_compra` int(11) NOT NULL,
  `envio_ciudad` varchar(60) DEFAULT NULL,
  `envio_pais` varchar(60) DEFAULT NULL,
  `envio_nombre` varchar(40) DEFAULT NULL,
  `envio_apellido_paterno` varchar(50) DEFAULT NULL,
  `envio_apellido_materno` varchar(50) DEFAULT NULL,
  `envio_estado` varchar(60) DEFAULT NULL,
  `envio_direccion` varchar(50) DEFAULT NULL,
  `envio_colonia` varchar(50) DEFAULT NULL,
  `envio_municipio` varchar(50) DEFAULT NULL,
  `envio_cp` int(11) DEFAULT NULL,
  `asunto` varchar(100) DEFAULT NULL,
  `estatus` tinyint(4) DEFAULT NULL,
  `numero_tarjeta` varchar(20) DEFAULT NULL,
  `ip` varchar(20) NOT NULL,
  `id_metodo_pago` int(11) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_lista_negra`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_3dsecure`
--

DROP TABLE IF EXISTS `log_3dsecure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_3dsecure` (
  `idlogsecure` bigint(20) NOT NULL AUTO_INCREMENT,
  `idpedidopresupuesto` bigint(20) NOT NULL,
  `respuesta` text DEFAULT NULL,
  `fecharegistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idlogsecure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_acciones_crud`
--

DROP TABLE IF EXISTS `log_acciones_crud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_acciones_crud` (
  `id_log_accion_crud` bigint(20) NOT NULL AUTO_INCREMENT,
  `tabla` varchar(100) NOT NULL,
  `cambios` longtext NOT NULL,
  `modulo` varchar(100) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `accion` char(20) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_log_accion_crud`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_actualizacion_orden_alibaba`
--

DROP TABLE IF EXISTS `log_actualizacion_orden_alibaba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_actualizacion_orden_alibaba` (
  `id_log_updatealibaba` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `pedido_alibaba` varchar(20) DEFAULT NULL,
  `id_tienda` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `estatus` varchar(50) NOT NULL,
  `descripcion_estatus` varchar(250) DEFAULT NULL,
  `confirmacion_proveedor` tinyint(1) DEFAULT NULL,
  `id_tienda_devolución` int(11) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificación` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `id_usuario_alta` int(11) NOT NULL,
  `id_usurio_modifica` int(11) DEFAULT NULL,
  `id_usuario_baja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_log_updatealibaba`),
  KEY `i_pedido_logalibaba` (`numero_pedido`),
  KEY `i_relpedido_logalibaba` (`id_relacion_pedido`),
  CONSTRAINT `fk_pedido_logalibaba` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_relpedido_logalibaba` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12507 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_antifraude`
--

DROP TABLE IF EXISTS `log_antifraude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_antifraude` (
  `id_antifraude` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) DEFAULT NULL,
  `status_inicio` varchar(45) DEFAULT NULL,
  `status_actual` varchar(45) DEFAULT NULL,
  `datos_json` longtext DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `respuesta_servicio` varchar(45) DEFAULT NULL,
  `solicitud` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_antifraude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_cron_notificacion_postventa`
--

DROP TABLE IF EXISTS `log_cron_notificacion_postventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_cron_notificacion_postventa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `tiipo` varchar(15) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `forma_de_pago` int(11) NOT NULL,
  `fecha_pedido_colocado` datetime NOT NULL,
  `fecha_final` datetime DEFAULT '0000-00-00 00:00:00',
  `peticion_api` text NOT NULL,
  `respuesta_api` text DEFAULT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `num_pedido` (`num_pedido`) USING BTREE,
  KEY `id_cliente` (`id_cliente`) USING BTREE,
  KEY `forma_de_pago` (`forma_de_pago`) USING BTREE,
  CONSTRAINT `fk_log_cron_notificacion_postventa_forma_de_pago` FOREIGN KEY (`forma_de_pago`) REFERENCES `metodos_de_pago` (`id_metodos_pago`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_log_cron_notificacion_postventa_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_log_cron_notificacion_postventa_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_cu`
--

DROP TABLE IF EXISTS `log_cu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_cu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `request` text NOT NULL,
  `date_request` datetime NOT NULL,
  `response` text NOT NULL,
  `date_response` datetime NOT NULL,
  `code_response` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_log_cu_numero_pedido` (`numero_pedido`),
  CONSTRAINT `fk_log_cu_numero_pedido` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_estatus_pedido_payu`
--

DROP TABLE IF EXISTS `log_estatus_pedido_payu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_estatus_pedido_payu` (
  `id_logep_payu` int(10) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(10) NOT NULL,
  `codigo_referencia` varchar(45) DEFAULT NULL,
  `solicitud` text DEFAULT NULL,
  `respuesta` text DEFAULT NULL,
  `estatus` varchar(25) NOT NULL,
  `msj_mostrado` mediumtext NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` varchar(50) DEFAULT NULL,
  `usuario_modificacion` varchar(50) DEFAULT NULL,
  `usuario_baja` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_logep_payu`),
  KEY `pedido_payu` (`numero_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_ivoy`
--

DROP TABLE IF EXISTS `log_ivoy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_ivoy` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `request` mediumtext NOT NULL,
  `response` mediumtext NOT NULL,
  `response_json` mediumtext NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `id_paquete` int(11) NOT NULL,
  `guia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_log`),
  KEY `num_pedido` (`num_pedido`) USING BTREE,
  KEY `guia` (`guia`) USING BTREE,
  KEY `id_paquete` (`id_paquete`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  CONSTRAINT `fk_pedido_ivoy` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`),
  CONSTRAINT `fk_usuario_ivoy` FOREIGN KEY (`id_usuario`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=395849 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_layout_sears`
--

DROP TABLE IF EXISTS `log_layout_sears`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_layout_sears` (
  `id_log_sears` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT NULL,
  `mensaje_estatus` varchar(90) DEFAULT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `fecha_procesado` date DEFAULT NULL,
  `nombre_de_archivo` varchar(50) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_log_sears`),
  KEY `inx_pedido` (`num_pedido`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4316 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_mod_puntos_sinfin`
--

DROP TABLE IF EXISTS `log_mod_puntos_sinfin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_mod_puntos_sinfin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) DEFAULT NULL COMMENT 'Llave foranea del id de usuario',
  `tipo_accion` int(11) DEFAULT NULL COMMENT 'Campo para definir el tipo de accion que se realizo , 1 agregar una tasa , 2 editar tasa , 3 eliminar tasa , 4 activar una tasa ,etc',
  `datos` mediumtext DEFAULT NULL COMMENT 'campo para guardar en json los datos de la diretentes acciones',
  `fecha_accion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accion` (`tipo_accion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_pagos_servicios`
--

DROP TABLE IF EXISTS `log_pagos_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_pagos_servicios` (
  `id_pago_serv` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_servicio` varchar(30) DEFAULT NULL,
  `id_servicio` int(10) unsigned DEFAULT NULL,
  `paquete` varchar(30) DEFAULT NULL,
  `pago` double DEFAULT NULL,
  `estatus_pago` int(1) DEFAULT NULL,
  `forma_pago` varchar(30) DEFAULT NULL,
  `vigencia_inicio` datetime DEFAULT NULL,
  `vigencia_fin` datetime DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` varchar(50) DEFAULT NULL,
  `usuario_modifica` varchar(50) DEFAULT NULL,
  `usuario_baja` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pago_serv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_pedidos_estatus_fancy`
--

DROP TABLE IF EXISTS `log_pedidos_estatus_fancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_pedidos_estatus_fancy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peticion` text DEFAULT NULL,
  `respuesta` longtext DEFAULT NULL,
  `pedido` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_pedidos_proceso_deshold`
--

DROP TABLE IF EXISTS `log_pedidos_proceso_deshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_pedidos_proceso_deshold` (
  `id_log_proceso_deshold` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `request_api` text NOT NULL,
  `response_api` text NOT NULL,
  `solicitud` tinyint(4) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_log_proceso_deshold`),
  KEY `i_pedido_desholdlog` (`numero_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=2496 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_proceso_vence`
--

DROP TABLE IF EXISTS `log_proceso_vence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_proceso_vence` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `total_enviado` double NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_log`),
  KEY `busqueda` (`numero_pedido`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_reactivacion`
--

DROP TABLE IF EXISTS `log_reactivacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_reactivacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `relacion_pedido` int(11) NOT NULL,
  `estatus_anterior` int(11) NOT NULL,
  `estatus_nuevo` int(11) NOT NULL,
  `motivo` enum('Otro','Ya fue entregado','Se va a entregar') NOT NULL,
  `origen` enum('Otro','Profeco','Redes Sociales','Error') NOT NULL,
  `reactivar` enum('Otro','Pedido','Partida') NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_sanborns_postran`
--

DROP TABLE IF EXISTS `log_sanborns_postran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_sanborns_postran` (
  `id_postran` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) DEFAULT NULL,
  `producto` int(11) DEFAULT NULL,
  `estatus` char(1) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL COMMENT 'Id del usuario axii',
  `procesado` tinyint(1) DEFAULT 0,
  `id_relacion_pedidos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_postran`),
  KEY `i_postran_estatus` (`estatus`),
  KEY `i_postran_relacion` (`id_relacion_pedidos`),
  KEY `i_postran_pedido` (`num_pedido`),
  KEY `i_postran_producto` (`producto`),
  KEY `i_postran_procesado` (`procesado`)
) ENGINE=InnoDB AUTO_INCREMENT=4182 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_skydrop`
--

DROP TABLE IF EXISTS `log_skydrop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_skydrop` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `response` text NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `id_skydrop` int(11) NOT NULL,
  `guia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_log`),
  KEY `num_pedido` (`num_pedido`) USING BTREE,
  KEY `guia` (`guia`) USING BTREE,
  KEY `id_skydrop` (`id_skydrop`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  CONSTRAINT `fk_pedido_skydrop` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`),
  CONSTRAINT `fk_usuario_skydrop` FOREIGN KEY (`id_usuario`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_sustitutos`
--

DROP TABLE IF EXISTS `log_sustitutos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_sustitutos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL,
  `sku_hijo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL,
  `sku_padre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL,
  `ean` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL,
  `id_tienda` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_carta_porte`
--

DROP TABLE IF EXISTS `logs_carta_porte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_carta_porte` (
  `id_logs_carta_porte` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL DEFAULT 0,
  `request` text NOT NULL,
  `respuesta` text NOT NULL,
  `reenvio` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_logs_carta_porte`),
  KEY `i_pedido_log` (`numero_pedido`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2409 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_error_guia`
--

DROP TABLE IF EXISTS `logs_error_guia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_error_guia` (
  `id_log_guia` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo` varchar(100) NOT NULL,
  `compania` int(11) NOT NULL,
  `productos` text DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `id_tienda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_log_guia`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_guias`
--

DROP TABLE IF EXISTS `logs_guias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_guias` (
  `id_log_guia` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_tienda` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `no_guia` varchar(50) DEFAULT '0',
  `orden_compra` varchar(100) DEFAULT '0',
  `rdd` varchar(50) DEFAULT '0',
  `carta_aceptacion` varchar(50) DEFAULT '0',
  `fecha_genera` datetime DEFAULT NULL,
  `descarga_guia` varchar(50) DEFAULT '0',
  `fecha_descarga` datetime DEFAULT NULL,
  `guarda_guia` varchar(50) DEFAULT '0',
  `fecha_guarda` datetime DEFAULT NULL,
  `compania` varchar(45) NOT NULL,
  `cantidad_productos` int(11) NOT NULL,
  `envio_correo` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id_log_guia`),
  KEY `idx_pedguia` (`num_pedido`,`no_guia`)
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_reembolso_parcial`
--

DROP TABLE IF EXISTS `logs_reembolso_parcial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_reembolso_parcial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_reembolso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estatus` smallint(6) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_id_reembolso` (`id_reembolso`) USING BTREE,
  CONSTRAINT `fk_logs_reembolso_parcial_id_reembolso` FOREIGN KEY (`id_reembolso`) REFERENCES `reembolso_parcial` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_respuesta_pagos_oxxo`
--

DROP TABLE IF EXISTS `logs_respuesta_pagos_oxxo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_respuesta_pagos_oxxo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL DEFAULT 0,
  `respuesta` text NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_id_pedido` (`numero_pedido`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5902 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_respuesta_pagos_t1pagos`
--

DROP TABLE IF EXISTS `logs_respuesta_pagos_t1pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_respuesta_pagos_t1pagos` (
  `id_log_respuesta` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL DEFAULT 0,
  `respuesta` text NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_log_respuesta`),
  KEY `idx_id_pedido` (`numero_pedido`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logsguias`
--

DROP TABLE IF EXISTS `logsguias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logsguias` (
  `id_log_guia` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_tienda` int(11) NOT NULL,
  `productos` text NOT NULL,
  `direccion_tienda` int(11) DEFAULT NULL,
  `solicitud` text DEFAULT NULL,
  `respuesta` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `compania` tinyint(4) DEFAULT NULL,
  `guia` varchar(100) DEFAULT NULL,
  `guia_rdd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_log_guia`)
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mails_concilia`
--

DROP TABLE IF EXISTS `mails_concilia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mails_concilia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `correo` varchar(50) NOT NULL DEFAULT '',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matriz_estatus_principal`
--

DROP TABLE IF EXISTS `matriz_estatus_principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `matriz_estatus_principal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_estatus_pedido` int(11) NOT NULL,
  `id_forma_pago` int(11) NOT NULL,
  `estatus_principal` varchar(50) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_id_forma_pago` (`id_forma_pago`) USING BTREE,
  KEY `idx_estatus_principal` (`estatus_principal`) USING BTREE,
  KEY `idx_id_estatus_pedido` (`id_estatus_pedido`,`id_forma_pago`,`estatus_principal`) USING BTREE,
  CONSTRAINT `fk_matriz_id_estatus_pedido` FOREIGN KEY (`id_estatus_pedido`) REFERENCES `admonplaza`.`usr_alias_estatus` (`Estatus`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_matriz_id_forma_pago` FOREIGN KEY (`id_forma_pago`) REFERENCES `metodos_de_pago` (`id_metodos_pago`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mensajeria_track`
--

DROP TABLE IF EXISTS `mensajeria_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajeria_track` (
  `id_track` int(11) NOT NULL AUTO_INCREMENT,
  `id_mensajeria` int(11) NOT NULL,
  `codigo` varchar(4) DEFAULT NULL,
  `guia` varchar(90) NOT NULL,
  `actividad` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `fecha_hora` datetime NOT NULL,
  `mensaje` varchar(45) NOT NULL,
  `eventos` int(5) DEFAULT NULL,
  `enviado` int(1) NOT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `guia_retorno` varchar(12) DEFAULT NULL,
  `fecha_retorno` datetime DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `entregado` tinyint(1) DEFAULT 0,
  `num_pedido` int(11) NOT NULL,
  `alibaba` tinyint(4) NOT NULL DEFAULT 0,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_track`),
  KEY `i_pedido_track` (`num_pedido`),
  KEY `i_guia_track` (`guia`),
  KEY `i_mensajeria_track` (`id_mensajeria`),
  KEY `i_codigo_track` (`codigo`),
  KEY `enviado` (`enviado`),
  KEY `i_fecha_hora_mt` (`fecha_hora`),
  CONSTRAINT `fk_pedido_track` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=1110979 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mensajeria_track_devolucion`
--

DROP TABLE IF EXISTS `mensajeria_track_devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajeria_track_devolucion` (
  `id_mensajeria_track_dev` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) DEFAULT NULL,
  `guia` varchar(20) NOT NULL,
  `actividad` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `fecha_hora` datetime NOT NULL,
  `mensaje` varchar(45) NOT NULL,
  `eventos` int(5) DEFAULT NULL,
  `enviado` int(1) NOT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `num_pedido` int(11) NOT NULL,
  `fecha_estimada` datetime DEFAULT NULL,
  `mensajeria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mensajeria_track_dev`),
  KEY `i_mtd_pedido` (`num_pedido`),
  KEY `i_mtd_guia` (`guia`),
  KEY `fk_mens_track_dev_mensajeria_id` (`mensajeria_id`),
  CONSTRAINT `fk_mens_track_dev_mensajeria_id` FOREIGN KEY (`mensajeria_id`) REFERENCES `ctg_mensajeria` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=772 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mesa_regalo`
--

DROP TABLE IF EXISTS `mesa_regalo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesa_regalo` (
  `id_regalo` int(11) NOT NULL AUTO_INCREMENT,
  `num_evento` char(9) NOT NULL,
  `mensaje_regalo` text NOT NULL,
  `nombre_regala` varchar(200) DEFAULT NULL,
  `num_pedido` int(11) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `num_monedero` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Número de monedero de la mesa de regalo, encriptado.',
  `id_mesa_regalo` int(11) NOT NULL DEFAULT 0,
  `id_direccion_mesa_regalo` int(11) NOT NULL DEFAULT 0,
  `enviado_ws` int(11) NOT NULL DEFAULT 0,
  `fecha_enviado_ws` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tipo_mesa` varchar(10) NOT NULL DEFAULT '',
  `fecha_cancelado_ws` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cancelacion_ws` int(11) NOT NULL DEFAULT 0,
  `guestcheckout` int(11) NOT NULL DEFAULT 0,
  `nom_evento` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_regalo`),
  KEY `num_evento` (`num_evento`) USING BTREE,
  KEY `num_pedido` (`num_pedido`) USING BTREE,
  KEY `fecha_registro` (`fecha_registro`) USING BTREE,
  CONSTRAINT `fk_mesa_regalo_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63146 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mesa_regalo_hibrida`
--

DROP TABLE IF EXISTS `mesa_regalo_hibrida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesa_regalo_hibrida` (
  `id_mesa_regalo_hibrida` int(11) NOT NULL AUTO_INCREMENT,
  `num_evento` varchar(9) NOT NULL DEFAULT '',
  `num_pedido` int(11) NOT NULL DEFAULT 0,
  `id_relacion_pedido` int(11) NOT NULL DEFAULT 0,
  `tipo_entrega_mesa` int(11) NOT NULL DEFAULT 0,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `enviado_ws` int(11) NOT NULL DEFAULT 0,
  `fecha_enviado_ws` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cancelacion_ws` int(11) NOT NULL DEFAULT 0,
  `fecha_cancelado_ws` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_mesa_regalo_hibrida`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metodos_de_pago`
--

DROP TABLE IF EXISTS `metodos_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_de_pago` (
  `id_metodos_pago` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `descripcion` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT 0,
  `id_genesix` int(11) NOT NULL,
  `id_sales_audit` int(11) NOT NULL,
  PRIMARY KEY (`id_metodos_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=4469 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metodos_permitidos_api`
--

DROP TABLE IF EXISTS `metodos_permitidos_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_permitidos_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_metodo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_id_metodo` (`id_metodo`) USING BTREE,
  KEY `idx_id_usuario` (`id_usuario`) USING BTREE,
  CONSTRAINT `fk_metodos_permitidos_api_id_metodo` FOREIGN KEY (`id_metodo`) REFERENCES `cat_metodos_api` (`id_metodo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_metodos_permitidos_api_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios_api` (`id_usuario`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migaja_categoria_producto`
--

DROP TABLE IF EXISTS `migaja_categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migaja_categoria_producto` (
  `id_migaja_cp` int(11) NOT NULL AUTO_INCREMENT,
  `id_relacion_pedido` int(11) NOT NULL,
  `id_cat_padre` int(11) unsigned NOT NULL,
  `categoria_padre` varchar(100) NOT NULL,
  `id_cat_hija` int(11) unsigned DEFAULT NULL,
  `categoria_hija` varchar(100) NOT NULL,
  `id_cat_nieta` int(11) unsigned DEFAULT NULL,
  `categoria_nieta` varchar(100) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` int(11) DEFAULT NULL,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_migaja_cp`),
  UNIQUE KEY `id_relacion_pedido` (`id_relacion_pedido`),
  KEY `i_migaja_relpedido` (`id_relacion_pedido`),
  KEY `i_cat_padre` (`id_cat_padre`),
  KEY `i_cat_hija` (`id_cat_hija`),
  KEY `i_nieta` (`id_cat_nieta`),
  CONSTRAINT `fk_migaja_relacion` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13743886 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `motivo_cancelacion_producto`
--

DROP TABLE IF EXISTS `motivo_cancelacion_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `motivo_cancelacion_producto` (
  `id_motivo_producto` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_motivo_cancelacion` int(11) NOT NULL,
  `id_estatus` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_motivo_producto`) USING BTREE,
  KEY `i_pedido_motivoprod` (`num_pedido`),
  KEY `i_relpedido_motivoprod` (`id_relacion_pedido`),
  KEY `i_producto_motivoprod` (`id_producto`),
  KEY `i_motivo_motivoprod` (`id_motivo_cancelacion`),
  KEY `i_estatus_motivoprod` (`id_estatus`),
  CONSTRAINT `fk_pedido_motivoprod` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`),
  CONSTRAINT `fk_producto_motivoprod` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_relpedido_motivoprod` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3075 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `motivo_pedido`
--

DROP TABLE IF EXISTS `motivo_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `motivo_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido` int(11) DEFAULT NULL COMMENT 'num de pedido',
  `motivo` int(11) DEFAULT NULL COMMENT 'id del motivo',
  `estatus` int(11) DEFAULT NULL COMMENT 'estatus al cual fue cambiado el pedido',
  `fecha` datetime DEFAULT NULL COMMENT 'fecha del registro',
  PRIMARY KEY (`id`),
  KEY `NumPedido` (`pedido`),
  KEY `InxMotivo` (`motivo`)
) ENGINE=InnoDB AUTO_INCREMENT=2374 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `motivos_reembolso`
--

DROP TABLE IF EXISTS `motivos_reembolso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `motivos_reembolso` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Motivo` varchar(120) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multiguias_mensajeria`
--

DROP TABLE IF EXISTS `multiguias_mensajeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiguias_mensajeria` (
  `id_multiguia` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `num_pedido` int(11) NOT NULL,
  `guia_master` varchar(20) NOT NULL,
  `no_paquete` int(11) NOT NULL,
  `num_guia` varchar(20) NOT NULL,
  `tipo_guia` varchar(5) NOT NULL,
  `fecha_genera` datetime NOT NULL,
  `mensajeria` int(11) NOT NULL,
  PRIMARY KEY (`id_multiguia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mx_ciudades`
--

DROP TABLE IF EXISTS `mx_ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mx_ciudades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estado_id` int(10) unsigned DEFAULT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `plaza_telcel` varchar(250) DEFAULT NULL,
  `region_telcel` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=915 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mx_codigospostales`
--

DROP TABLE IF EXISTS `mx_codigospostales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mx_codigospostales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cp` char(5) DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `municipio` varchar(200) DEFAULT NULL,
  `estado_id` int(10) unsigned DEFAULT NULL,
  `municipio_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `por_cp` (`cp`,`municipio_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=133531 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mx_estados`
--

DROP TABLE IF EXISTS `mx_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mx_estados` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `iso2` char(2) NOT NULL,
  `iso3` char(3) NOT NULL,
  `abrev` varchar(10) DEFAULT NULL,
  `busqueda_servicios` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mx_municipios`
--

DROP TABLE IF EXISTS `mx_municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mx_municipios` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `estado_id` int(3) unsigned NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `region_telcel` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `por_estado` (`estado_id`) USING BTREE,
  CONSTRAINT `mx_municipios_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `mx_estados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3016 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `netpay_transacciones`
--

DROP TABLE IF EXISTS `netpay_transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `netpay_transacciones` (
  `order_id` varchar(25) NOT NULL DEFAULT '',
  `id_pedido` varchar(25) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `tipo_targeta` varchar(10) DEFAULT NULL,
  `targeta_numero` varchar(25) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `response_msg` varchar(30) DEFAULT NULL,
  `response_text` mediumtext DEFAULT NULL,
  `response_code` varchar(5) DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `idxidped` (`id_pedido`),
  KEY `idxclienteid` (`id_cliente`),
  FULLTEXT KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notas_entrega`
--

DROP TABLE IF EXISTS `notas_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_entrega` (
  `id_notas_entrega` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `numero_autorizacion` varchar(130) DEFAULT NULL,
  `numero_identificacion` varchar(130) DEFAULT NULL,
  `nombre_recoge` varchar(100) DEFAULT NULL,
  `forma_pago` varchar(40) DEFAULT NULL,
  `fecha_creacion_nota` datetime DEFAULT NULL,
  `id_usuario_valida` int(11) NOT NULL,
  `tipo_identificacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_notas_entrega`),
  KEY `fk_notas_pedido` (`numero_pedido`),
  KEY `fk_notas_relacion` (`id_relacion_pedido`),
  KEY `fk_notas_usuario` (`id_usuario_valida`),
  CONSTRAINT `fk_notas_pedido` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`),
  CONSTRAINT `fk_notas_relacion` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`),
  CONSTRAINT `fk_notas_usuario` FOREIGN KEY (`id_usuario_valida`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `id_notificacion` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `tipo` char(5) NOT NULL,
  `estatus_transferencia` char(1) NOT NULL,
  `destinatario` text NOT NULL,
  `text_sms` varchar(160) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT 0,
  `contador_notificado` int(11) NOT NULL DEFAULT 0,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` varchar(50) DEFAULT NULL,
  `usuario_modificacion` varchar(50) DEFAULT NULL,
  `usuario_baja` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_notificacion`),
  KEY `fk_pedido_notifica` (`num_pedido`),
  KEY `fk_relacionp_notifica` (`id_relacion_pedido`),
  CONSTRAINT `fk_pedido_notifica` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`),
  CONSTRAINT `fk_relacionp_notifica` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=552 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `expires_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `expires_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `expires_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `operacion_santa`
--

DROP TABLE IF EXISTS `operacion_santa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `operacion_santa` (
  `id_operacion_santa` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `nino` char(1) DEFAULT NULL,
  `familia` char(1) DEFAULT NULL,
  `amigos` char(1) DEFAULT NULL,
  `pareja` char(1) DEFAULT NULL,
  `hogar` char(1) DEFAULT NULL,
  `jugueteria` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_operacion_santa`),
  KEY `idx_sku` (`sku`) USING BTREE,
  KEY `idx_id_producto` (`id_producto`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1162 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_payment_method`
--

DROP TABLE IF EXISTS `order_payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_payment_method` (
  `order_payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `payment_amount` float(7,2) NOT NULL DEFAULT 0.00,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`order_payment_method_id`),
  KEY `order_payment_methodix` (`order_number`),
  KEY `fecha_alta` (`fecha_alta`)
) ENGINE=InnoDB AUTO_INCREMENT=1591 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders_process`
--

DROP TABLE IF EXISTS `orders_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `lastupdate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2355 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paypal_mensualidad`
--

DROP TABLE IF EXISTS `paypal_mensualidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal_mensualidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `estatus` tinyint(4) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pdf_embarque_tienda`
--

DROP TABLE IF EXISTS `pdf_embarque_tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pdf_embarque_tienda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `ubicacion` varchar(256) NOT NULL DEFAULT '',
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido_plataforma`
--

DROP TABLE IF EXISTS `pedido_plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_plataforma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `plataforma` enum('WEB','ANDROID','IOS','UNKNOWN','PWA','CREDITIENDA','POSVENTA','POSAFILIADO','POSMESA') NOT NULL DEFAULT 'WEB',
  `version` varchar(11) DEFAULT '2.0',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `i_pedido_plataforma` (`num_pedido`),
  KEY `i_plataforma` (`plataforma`)
) ENGINE=InnoDB AUTO_INCREMENT=6877460 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido_sin_comision`
--

DROP TABLE IF EXISTS `pedido_sin_comision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_sin_comision` (
  `id_pedido_sincomision` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` int(11) DEFAULT NULL,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pedido_sincomision`),
  KEY `i_sincomision_pedido` (`num_pedido`),
  CONSTRAINT `fk_sincomision_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido_sucursal`
--

DROP TABLE IF EXISTS `pedido_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_sucursal` (
  `id_pedido_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_relacion_pedido` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_pedido_sucursal`),
  KEY `fk_pedido_sucursal` (`id_pedido`),
  KEY `fk_sucursal_sucursal` (`id_sucursal`),
  KEY `id_relacion_pedido` (`id_relacion_pedido`) USING BTREE,
  CONSTRAINT `fk_pedido_sucursal` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`Id`),
  CONSTRAINT `fk_sucursal_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=40298 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cliente` int(11) NOT NULL,
  `Tipo` int(11) NOT NULL COMMENT '1=no aplica a garanplus, 2=si aplico a garanplus',
  `Fecha_Inicio` datetime NOT NULL,
  `Estatus` int(11) NOT NULL,
  `Tienda` int(11) NOT NULL,
  `Urgencia` int(11) NOT NULL,
  `Forma_de_pago` int(11) NOT NULL,
  `Num_pedido` int(11) NOT NULL,
  `Pedido_Normalizado` varchar(100) DEFAULT NULL,
  `stratus_mensaje` varchar(50) NOT NULL DEFAULT '',
  `stratus_codigo` varchar(10) NOT NULL DEFAULT '',
  `nombre` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `mes` varchar(45) DEFAULT NULL,
  `ao` varchar(45) DEFAULT NULL,
  `seguridad` varchar(255) DEFAULT NULL,
  `anterior` int(10) unsigned DEFAULT NULL,
  `subtotal` double unsigned DEFAULT NULL COMMENT 'Subtotal del pedido limpio sin cambios individuales en precios de productos',
  `subtotal_venta` double unsigned DEFAULT NULL COMMENT 'Subtotal del pedido con todo incluido',
  `total_envio` double unsigned DEFAULT NULL,
  `descuento` double unsigned DEFAULT 0,
  `total` double unsigned DEFAULT NULL COMMENT 'Total del pedido usando subtotal limpio',
  `total_venta` double unsigned DEFAULT NULL COMMENT 'Total del pedido con todo incluido',
  `tienda_origen` int(11) DEFAULT 0,
  `extra` mediumtext DEFAULT NULL COMMENT 'Información adicional sobre el pedido en formato json',
  `modalidad` tinyint(2) unsigned DEFAULT 0 COMMENT '1 = 4 campos activos',
  `tarjeta_puntos` double(10,2) unsigned DEFAULT NULL COMMENT 'puntos con los que cargara el pedido',
  `meses` tinyint(2) unsigned DEFAULT NULL COMMENT 'meses a pagar el producti',
  `interes` int(1) unsigned DEFAULT NULL COMMENT 'intereses a pagar  por el pedido',
  `telefono_telmex` varchar(20) DEFAULT NULL,
  `num_externo` int(9) DEFAULT NULL COMMENT 'almacena el pedido de una tienda externa',
  `evento` varchar(30) DEFAULT NULL,
  `campana` int(10) unsigned DEFAULT 0,
  `ip` varchar(20) DEFAULT NULL,
  `tipo_entrega` tinyint(1) DEFAULT NULL,
  `id_portal` int(11) DEFAULT 0,
  `registradora` int(11) NOT NULL DEFAULT 0,
  `transaccion` int(11) NOT NULL DEFAULT 0,
  `tipo_descuento` tinyint(2) NOT NULL DEFAULT 3,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `por_num` (`Num_pedido`) USING BTREE,
  KEY `por_cliente` (`Cliente`) USING BTREE,
  KEY `formapagoFK` (`Forma_de_pago`),
  KEY `i_pedido_estatus` (`Estatus`),
  KEY `i_pedido_tienda` (`Tienda`),
  KEY `i_pedido_fechai` (`Fecha_Inicio`),
  KEY `i_pedido_tiendaorigen` (`tienda_origen`)
) ENGINE=InnoDB AUTO_INCREMENT=12282230 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER t_creditienda_track_i AFTER INSERT ON pedidos FOR EACH ROW BEGIN
  IF (NEW.Estatus = 7 AND NEW.Tienda = 71) THEN
      IF NOT EXISTS (SELECT 1 FROM creditienda_track WHERE num_pedido = NEW.Num_pedido AND estatus_pedido = 7) THEN
        INSERT INTO `tienda`.`creditienda_track` (`num_pedido`, `id_relacion`, `estatus_pedido`) SELECT Pedido, id, 7 FROM relacion_pedidos WHERE Pedido = NEW.Num_pedido;
      END IF;
  ELSEIF (NEW.Estatus = 4 AND NEW.Tienda = 71) THEN
      IF NOT EXISTS (SELECT 1 FROM creditienda_track WHERE num_pedido = NEW.Num_pedido AND estatus_pedido = 4) THEN
        INSERT INTO `tienda`.`creditienda_track` (`num_pedido`, `id_relacion`, `estatus_pedido`) SELECT Pedido, id, 4 FROM relacion_pedidos WHERE Pedido = NEW.Num_pedido;
      END IF;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER t_creditienda_track_u AFTER UPDATE ON pedidos FOR EACH ROW BEGIN
  IF (NEW.Estatus = 7 AND OLD.Tienda = 71) THEN
      IF NOT EXISTS (SELECT 1 FROM creditienda_track WHERE num_pedido = NEW.Num_pedido AND estatus_pedido = 7) THEN
        INSERT INTO `tienda`.`creditienda_track` (`num_pedido`, `id_relacion`, `estatus_pedido`) SELECT Pedido, id, 7 FROM relacion_pedidos WHERE Pedido = NEW.Num_pedido;
      END IF;
  ELSEIF (NEW.Estatus = 4 AND OLD.Tienda = 71) THEN
      IF NOT EXISTS (SELECT 1 FROM creditienda_track WHERE num_pedido = NEW.Num_pedido AND estatus_pedido = 4) THEN
        INSERT INTO `tienda`.`creditienda_track` (`num_pedido`, `id_relacion`, `estatus_pedido`) SELECT Pedido, id, 4 FROM relacion_pedidos WHERE Pedido = NEW.Num_pedido;
      END IF;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedidos_control`
--

DROP TABLE IF EXISTS `pedidos_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_control` (
  `num_pedido` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`num_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000161 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_entregados`
--

DROP TABLE IF EXISTS `pedidos_entregados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_entregados` (
  `id_pedido_entregado` bigint(20) NOT NULL AUTO_INCREMENT,
  `num_pedido` bigint(20) NOT NULL,
  `entregado` tinyint(4) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_pedido_entregado`),
  KEY `idxPedEntre` (`num_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_entregados_csd`
--

DROP TABLE IF EXISTS `pedidos_entregados_csd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_entregados_csd` (
  `id_pedido_entregado` int(11) NOT NULL AUTO_INCREMENT,
  `forma_de_pago` varchar(100) DEFAULT NULL,
  `pedidos_por_fp` int(11) DEFAULT NULL,
  `monto_por_fp` double DEFAULT NULL,
  `total_pedidos` int(11) DEFAULT NULL,
  `total_monto` double DEFAULT NULL,
  `ptj_por_fp` double DEFAULT NULL,
  `total_ptj` double DEFAULT NULL,
  `fecha_informacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pedido_entregado`),
  KEY `fecha_informacion` (`fecha_informacion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_factura`
--

DROP TABLE IF EXISTS `pedidos_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido` int(11) DEFAULT NULL COMMENT 'id de la tabla pedidos',
  `razon_social` varchar(120) DEFAULT NULL,
  `rfc` varchar(30) DEFAULT NULL,
  `domicilio` text DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `auth` int(11) DEFAULT NULL COMMENT 'id del usuario que autoriza',
  `fecha_auth` datetime DEFAULT NULL COMMENT 'fecha de autorizacion de la factura',
  `estatus` int(11) DEFAULT 0 COMMENT '0-solicitada 1-creada 2-enviada',
  PRIMARY KEY (`id`),
  KEY `pedido` (`pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_facturacion`
--

DROP TABLE IF EXISTS `pedidos_facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_facturacion` (
  `id_pedido_facturacion` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` bigint(20) NOT NULL,
  `detalle_xml` text DEFAULT NULL,
  `envio` text DEFAULT NULL,
  `descuento` varchar(15) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `terminal` char(5) DEFAULT NULL,
  `tipo_transaccion` tinyint(4) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `importe_bruto` float DEFAULT NULL,
  `importe_neto` float DEFAULT NULL,
  `importe_monedero` float DEFAULT NULL,
  `numero_cod` tinyint(4) DEFAULT NULL,
  `cajero` tinyint(4) DEFAULT NULL,
  `vendedor` tinyint(4) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `codigo_fp` tinyint(4) DEFAULT NULL,
  `secuencia` tinyint(4) DEFAULT NULL,
  `planpago` tinyint(4) DEFAULT NULL,
  `autorizacion` varchar(50) DEFAULT NULL,
  `compania` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pedido_facturacion`),
  UNIQUE KEY `pedido` (`numero_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_fullfilment`
--

DROP TABLE IF EXISTS `pedidos_fullfilment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_fullfilment` (
  `id_pedidos_fullfilment` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `contenido` text DEFAULT NULL,
  `ids_relacion_pedido` text DEFAULT NULL,
  `ids_fullfilment` text DEFAULT NULL,
  `almacen` tinyint(4) NOT NULL DEFAULT 0,
  `fecha_colocado` datetime NOT NULL,
  `enviado` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_pedidos_fullfilment`) USING BTREE,
  KEY `i_fullfilemnt_pedido` (`numero_pedido`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27788 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_gushup`
--

DROP TABLE IF EXISTS `pedidos_gushup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_gushup` (
  `id_pedidos_gushup` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `id_motivo` int(11) NOT NULL,
  `estatus_devolucion` tinyint(4) NOT NULL DEFAULT 0,
  `return_type` int(11) DEFAULT NULL,
  `external_store` int(11) DEFAULT NULL,
  `physical_store` int(11) DEFAULT NULL,
  `fecha_peticion` datetime NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_pedidos_gushup`),
  KEY `i_pedido_gushup` (`num_pedido`) USING BTREE,
  KEY `i_gushup_rpedido` (`id_relacion_pedido`) USING BTREE,
  KEY `i_gushup_motivo` (`id_motivo`) USING BTREE,
  KEY `i_gushup_fecha` (`fecha_peticion`) USING BTREE,
  CONSTRAINT `fk_gushup_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_imr`
--

DROP TABLE IF EXISTS `pedidos_imr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_imr` (
  `imr` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor` int(11) DEFAULT NULL,
  `comision_pesos` int(11) DEFAULT NULL,
  `total_precio_venta` int(11) DEFAULT NULL,
  `num_pedido` int(11) DEFAULT NULL,
  `guia` varchar(90) NOT NULL,
  `estatus` tinyint(4) DEFAULT NULL,
  `id_tienda` int(11) DEFAULT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `nombre_archivo` varchar(50) NOT NULL,
  `fecha_recepcion` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` int(11) DEFAULT NULL,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  PRIMARY KEY (`imr`),
  KEY `k_estatus` (`estatus`) USING BTREE,
  KEY `k_id_tienda` (`proveedor`) USING BTREE,
  KEY `fk_num_pedido` (`num_pedido`) USING BTREE,
  KEY `fk_id_relacion_pedido` (`id_relacion_pedido`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=490949 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_imr_devolucion`
--

DROP TABLE IF EXISTS `pedidos_imr_devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_imr_devolucion` (
  `imr_devolucion` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor` int(11) DEFAULT NULL,
  `num_pedido` int(11) DEFAULT NULL,
  `guia` varchar(90) NOT NULL,
  `id_tienda` int(11) DEFAULT NULL,
  `comision_pesos` int(11) DEFAULT NULL,
  `total_precio_venta` int(11) DEFAULT NULL,
  `estatus` tinyint(4) DEFAULT NULL,
  `nombre_archivo` varchar(50) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `fecha_cancelacion` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` int(11) DEFAULT NULL,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  PRIMARY KEY (`imr_devolucion`),
  KEY `k_estatus` (`estatus`) USING BTREE,
  KEY `k_id_tienda` (`proveedor`) USING BTREE,
  KEY `id_relacion_pedido` (`id_relacion_pedido`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16284 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_pago_tienda_conciliados`
--

DROP TABLE IF EXISTS `pedidos_pago_tienda_conciliados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_pago_tienda_conciliados` (
  `id` int(111) NOT NULL AUTO_INCREMENT,
  `tienda` char(4) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `terminal` char(4) NOT NULL,
  `transaccion` char(4) NOT NULL,
  `cuenta` char(19) DEFAULT NULL,
  `vendedor` char(4) NOT NULL,
  `numero_pedido` int(11) NOT NULL,
  `importe` int(11) NOT NULL,
  `forma_pago_tienda` char(2) NOT NULL,
  `prefijo_cuenta` int(11) NOT NULL DEFAULT 0,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_pedidos_pago_tienda_conciliados_num_pedido` (`numero_pedido`),
  CONSTRAINT `fk_pedidos_pago_tienda_conciliados_num_pedido` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_parciales`
--

DROP TABLE IF EXISTS `pedidos_parciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_parciales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `relacion_pedido` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `conciliado` int(11) DEFAULT 0,
  `usuario_valida` int(11) DEFAULT NULL,
  `fecha_valida` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `tipo_conciliado` int(11) DEFAULT 0 COMMENT 'ENTREGADO PARCIAL=0\nDEVOLUCION PARCIAL=1',
  `forma_pago` int(11) DEFAULT NULL,
  `registradora` int(11) NOT NULL DEFAULT 0,
  `transaccion` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idxppnoped` (`numero_pedido`),
  KEY `idxpprelped` (`relacion_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_poliza_ingresos`
--

DROP TABLE IF EXISTS `pedidos_poliza_ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_poliza_ingresos` (
  `id_poliza_ingresos` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `entregado` tinyint(4) DEFAULT 0,
  `entregado_API` tinyint(1) DEFAULT NULL,
  `entregado_API_comision` tinyint(1) DEFAULT NULL,
  `venta` tinyint(1) NOT NULL DEFAULT 0,
  `devolucion` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_poliza_ingresos`),
  KEY `i_pedido_poliza` (`num_pedido`) USING BTREE,
  KEY `i_venta` (`venta`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4109 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_proceso_deshold`
--

DROP TABLE IF EXISTS `pedidos_proceso_deshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_proceso_deshold` (
  `id_proceso_deshold` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `cantidad_sku` int(11) NOT NULL,
  `id_tienda` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `solicitud` tinyint(4) NOT NULL DEFAULT 0,
  `tipo` varchar(100) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_proceso_deshold`),
  KEY `i_pedido_deshold` (`numero_pedido`),
  KEY `i_solicitud_deshold` (`solicitud`),
  KEY `i_tienda_deshold` (`id_tienda`),
  KEY `i_fecha_deshold` (`fecha_alta`),
  CONSTRAINT `fk_pedido_deshold` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=596 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_rechazo`
--

DROP TABLE IF EXISTS `pedidos_rechazo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_rechazo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `motivo` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=614 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_vtas_internet`
--

DROP TABLE IF EXISTS `pedidos_vtas_internet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_vtas_internet` (
  `id_pedidos_ventainternet` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `id_trans_tar` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_pedidos_ventainternet`),
  KEY `fk_ventas_pedido` (`numero_pedido`),
  KEY `fk_ventas_transaccion` (`id_trans_tar`),
  CONSTRAINT `fk_ventas_pedido` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`),
  CONSTRAINT `fk_ventas_transaccion` FOREIGN KEY (`id_trans_tar`) REFERENCES `transacciones_tarjeta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `peticiones`
--

DROP TABLE IF EXISTS `peticiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `peticiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `tipo_peticion` enum('no_definido','fincado') NOT NULL,
  `fecha_peticion` datetime NOT NULL DEFAULT current_timestamp(),
  `json_in` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`json_in`)),
  `json_original` text NOT NULL,
  `estatus` varchar(15) NOT NULL DEFAULT 'Espera',
  `json_out` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`json_out`)),
  `ip` varchar(20) NOT NULL DEFAULT '',
  `num_pedido` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_num_pedido` (`num_pedido`) USING BTREE,
  KEY `idx_fecha_peticion` (`fecha_peticion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11052300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `peticiones3`
--

DROP TABLE IF EXISTS `peticiones3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `peticiones3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `tipo_peticion` enum('no_definido','fincado') NOT NULL,
  `fecha_peticion` datetime NOT NULL DEFAULT current_timestamp(),
  `json_in` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`json_in`)),
  `json_original` text NOT NULL,
  `estatus` varchar(15) NOT NULL DEFAULT 'Espera',
  `json_out` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`json_out`)),
  `ip` varchar(20) NOT NULL DEFAULT '',
  `num_pedido` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_num_pedido` (`num_pedido`) USING BTREE,
  KEY `idx_fecha_peticion` (`fecha_peticion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `peticiones_api`
--

DROP TABLE IF EXISTS `peticiones_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `peticiones_api` (
  `id_peticion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la petición',
  `id_usuario` int(11) DEFAULT NULL COMMENT 'Id del usuario que hizo la petición',
  `tipo_peticion` varchar(10) DEFAULT NULL COMMENT 'Tipode Petición',
  `fecha_peticion` datetime DEFAULT current_timestamp() COMMENT 'Fecha en que se ingresa la peticón',
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `json_in` text DEFAULT NULL,
  `json_out` text DEFAULT NULL,
  `num_pedido` int(11) DEFAULT 0,
  PRIMARY KEY (`id_peticion`),
  KEY `idx_api` (`tipo_peticion`,`num_pedido`) USING BTREE,
  KEY `idx_num_pedido` (`num_pedido`) USING BTREE,
  KEY `i_fecha_peticion` (`fecha_peticion`)
) ENGINE=InnoDB AUTO_INCREMENT=11586 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Tabla para el log de las peticiones a la API de Fincado';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `peticiones_api_mktp`
--

DROP TABLE IF EXISTS `peticiones_api_mktp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `peticiones_api_mktp` (
  `id_peticion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la petición',
  `id_usuario` int(11) DEFAULT NULL COMMENT 'Id del usuario que hizo la petición',
  `tipo_peticion` varchar(10) DEFAULT NULL COMMENT 'Tipode Petición',
  `fecha_peticion` datetime DEFAULT current_timestamp() COMMENT 'Fecha en que se ingresa la peticón',
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `json_in` text DEFAULT NULL,
  `json_out` text DEFAULT NULL,
  `num_pedido` int(11) DEFAULT 0,
  PRIMARY KEY (`id_peticion`),
  KEY `idx_api` (`tipo_peticion`,`num_pedido`) USING BTREE,
  KEY `idx_num_pedido` (`num_pedido`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2354 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `peticiones_api_prueba`
--

DROP TABLE IF EXISTS `peticiones_api_prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `peticiones_api_prueba` (
  `id_peticion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la petición',
  `id_usuario` int(11) DEFAULT NULL COMMENT 'Id del usuario que hizo la petición',
  `tipo_peticion` varchar(10) DEFAULT NULL COMMENT 'Tipode Petición',
  `fecha_peticion` datetime DEFAULT current_timestamp() COMMENT 'Fecha en que se ingresa la peticón',
  `json_in` text DEFAULT NULL,
  `json_out` text DEFAULT NULL,
  `num_pedido` int(11) DEFAULT NULL,
  `campo1` text DEFAULT NULL,
  `campo2` int(11) DEFAULT 0,
  PRIMARY KEY (`id_peticion`)
) ENGINE=InnoDB AUTO_INCREMENT=2682305 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `peticiones_api_resp`
--

DROP TABLE IF EXISTS `peticiones_api_resp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `peticiones_api_resp` (
  `id_peticion` int(11) NOT NULL DEFAULT 0 COMMENT 'Id de la petición',
  `id_usuario` int(11) DEFAULT NULL COMMENT 'Id del usuario que hizo la petición',
  `tipo_peticion` varchar(10) DEFAULT NULL COMMENT 'Tipode Petición',
  `fecha_peticion` datetime DEFAULT current_timestamp() COMMENT 'Fecha en que se ingresa la peticón',
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `json_in` text DEFAULT NULL,
  `json_out` text DEFAULT NULL,
  `num_pedido` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pickup`
--

DROP TABLE IF EXISTS `pickup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickup` (
  `id_pickup` int(11) NOT NULL AUTO_INCREMENT,
  `id_tienda` int(11) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `id_usuario` int(11) NOT NULL,
  `total_pickup` int(11) NOT NULL DEFAULT 0,
  `id_mensajeria` int(11) NOT NULL,
  `respose_pickup` text NOT NULL,
  PRIMARY KEY (`id_pickup`),
  KEY `id_tienda` (`id_tienda`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  KEY `id_mensajeria` (`id_mensajeria`) USING BTREE,
  KEY `fecha_registro` (`fecha_registro`) USING BTREE,
  CONSTRAINT `fk_pickup_id_mensajeria` FOREIGN KEY (`id_mensajeria`) REFERENCES `ctg_mensajeria` (`id`),
  CONSTRAINT `fk_pickup_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=469 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poliza_ingresos_parciales_cancelados`
--

DROP TABLE IF EXISTS `poliza_ingresos_parciales_cancelados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `poliza_ingresos_parciales_cancelados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `relacion_pedido` int(11) NOT NULL,
  `guia` varchar(255) DEFAULT NULL,
  `tienda_axii` int(11) DEFAULT NULL,
  `enviado` int(11) DEFAULT NULL,
  `nombre_archivo` varchar(255) DEFAULT NULL,
  `fecha_cancelacion` datetime DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `usuario_alta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidos` (`num_pedido`) USING BTREE,
  KEY `relacion_pedidos` (`relacion_pedido`) USING BTREE,
  CONSTRAINT `fk_poliza_ingresos_parciales_cancelados_id_relacion` FOREIGN KEY (`relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_poliza_ingresos_parciales_cancelados_pedidos` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `polizas_generadas`
--

DROP TABLE IF EXISTS `polizas_generadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `polizas_generadas` (
  `id_polizas_generadas` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicial` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_final` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `ejectuar_poliza` tinyint(1) NOT NULL DEFAULT 0,
  `ejecutar_imr` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_modificacion` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_polizas_generadas`),
  KEY `fecha_inicial` (`fecha_inicial`) USING BTREE,
  KEY `fecha_final` (`fecha_final`) USING BTREE,
  KEY `fecha_alta` (`fecha_alta`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pot_cat_motivo_cancela`
--

DROP TABLE IF EXISTS `pot_cat_motivo_cancela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_cat_motivo_cancela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(100) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_motivo` (`motivo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pot_cyr_pos`
--

DROP TABLE IF EXISTS `pot_cyr_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_cyr_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_rel_pedido` int(11) NOT NULL,
  `id_forma_pago` int(11) NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_envio_pos` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `tipo_cyr` enum('1','2') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pot_dimensiones_producto`
--

DROP TABLE IF EXISTS `pot_dimensiones_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_dimensiones_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `log` text NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`) USING BTREE,
  KEY `sku` (`sku`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  KEY `fecha_alta` (`fecha_alta`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pot_etiqueta_cyr`
--

DROP TABLE IF EXISTS `pot_etiqueta_cyr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_etiqueta_cyr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mensajeria` int(11) NOT NULL,
  `guia` varchar(90) NOT NULL DEFAULT '',
  `etiqueta` varchar(90) NOT NULL DEFAULT '',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pot_guias_cyr`
--

DROP TABLE IF EXISTS `pot_guias_cyr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_guias_cyr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `compania` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `id_etiqueta` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pot_usuario_cancela`
--

DROP TABLE IF EXISTS `pot_usuario_cancela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_usuario_cancela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('cyr','pi','mr','psn') NOT NULL DEFAULT 'pi',
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_pot_motivo_cancelacion` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `surtimiento` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_num_pedido` (`num_pedido`) USING BTREE,
  KEY `idx_id_relacion_pedido` (`id_relacion_pedido`) USING BTREE,
  KEY `idx_id_usuario` (`id_usuario`) USING BTREE,
  KEY `idx_id_pot_motivo_cancelacion` (`id_pot_motivo_cancelacion`) USING BTREE,
  KEY `tipo` (`tipo`) USING BTREE,
  CONSTRAINT `fk_pot_usuario_cancela_id_relacion_pedido` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_pot_usuario_cancela_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_pot_usuario_cancela_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pot_usuario_confirma`
--

DROP TABLE IF EXISTS `pot_usuario_confirma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot_usuario_confirma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('cyr','pi','mr','psn') NOT NULL DEFAULT 'pi',
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `estatus_cu` int(11) NOT NULL DEFAULT 0,
  `confirm_pos` enum('0','1','2') NOT NULL DEFAULT '0',
  `surtimiento` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_num_pedido` (`num_pedido`) USING BTREE,
  KEY `idx_id_relacion_pedido` (`id_relacion_pedido`) USING BTREE,
  KEY `idx_id_usuario` (`id_usuario`) USING BTREE,
  CONSTRAINT `fk_pot_usuario_confirma_id_relacion_pedido` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_pot_usuario_confirma_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_pot_usuario_confirma_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prestigio_mkp`
--

DROP TABLE IF EXISTS `prestigio_mkp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestigio_mkp` (
  `id_prestigio_mkp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla',
  `reputacion` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Reputación de la tienda en número',
  `id_seller` int(11) NOT NULL DEFAULT 0 COMMENT 'ID de la tienda MKP',
  `fecha_reputacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_prestigio_mkp`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `presupuesto_pedidos`
--

DROP TABLE IF EXISTS `presupuesto_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `presupuesto_pedidos` (
  `idpresupuesto` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT '1=no aplica a garanplus, 2=si aplico a garanplus',
  `fechainicio` datetime NOT NULL,
  `estatus` int(11) NOT NULL,
  `tienda` int(11) NOT NULL,
  `formapago` int(11) NOT NULL,
  `tipotarjeta` varchar(45) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `mes` varchar(45) DEFAULT NULL,
  `subtotal` double unsigned DEFAULT NULL COMMENT 'Subtotal del pedido limpio sin cambios individuales en precios de productos',
  `subtotalventa` double unsigned DEFAULT NULL COMMENT 'Subtotal del pedido con todo incluido',
  `totalenvio` double unsigned DEFAULT NULL,
  `descuento` double unsigned DEFAULT 0,
  `total` double unsigned DEFAULT NULL COMMENT 'Total del pedido usando subtotal limpio',
  `totalventa` double unsigned DEFAULT NULL COMMENT 'Total del pedido con todo incluido',
  `extra` text DEFAULT NULL COMMENT 'Información adicional sobre el pedido en formato json',
  `ip` varchar(20) DEFAULT NULL,
  `numpedido` bigint(20) DEFAULT NULL,
  `cyber` text DEFAULT NULL,
  PRIMARY KEY (`idpresupuesto`),
  KEY `por_cliente` (`idcliente`) USING BTREE,
  KEY `total` (`total`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productocolor`
--

DROP TABLE IF EXISTS `productocolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productocolor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idproducto` int(11) NOT NULL,
  `idtienda` int(11) DEFAULT NULL,
  `nombrecolor` varchar(100) NOT NULL,
  `codecolor` varchar(8) DEFAULT NULL,
  `estatus` int(11) NOT NULL,
  `fecharegistro` datetime NOT NULL,
  `fechamodificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22494 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(500) NOT NULL,
  `Descripcion` longtext DEFAULT NULL,
  `Descripcion_Corta` longtext DEFAULT NULL,
  `Fecha_Inicio` datetime NOT NULL,
  `Sub_Categoria` int(11) NOT NULL,
  `Especial` tinyint(1) NOT NULL DEFAULT 0,
  `Precio_Lista` double NOT NULL DEFAULT 0,
  `Precio` double NOT NULL,
  `Precio_Envio` double NOT NULL,
  `Precio_Envio2` double NOT NULL DEFAULT 0,
  `Estatus` int(11) NOT NULL,
  `Tienda` int(11) NOT NULL,
  `Mas_Comprado` tinyint(1) NOT NULL DEFAULT 0,
  `En_Oferta` tinyint(1) NOT NULL DEFAULT 0,
  `Principal` tinyint(1) NOT NULL DEFAULT 0,
  `Variante` varchar(100) DEFAULT 'NULL',
  `Precio_Dolares` double NOT NULL DEFAULT 0,
  `Numero_Parte` varchar(50) DEFAULT NULL,
  `Numero_Proveedor` varchar(50) DEFAULT 'NULL',
  `Embarque` int(10) unsigned NOT NULL DEFAULT 0,
  `Peso_volumetrico` double DEFAULT 0,
  `Peso` double DEFAULT 0,
  `Fabricante` varchar(45) DEFAULT NULL,
  `Modelo` varchar(45) DEFAULT NULL,
  `Precio_Banamex` double DEFAULT NULL,
  `Facturable` int(1) DEFAULT 0,
  `Venta` double DEFAULT NULL,
  `Cantidad` int(11) DEFAULT 0,
  `unico` double unsigned DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `precio_costo` float unsigned DEFAULT NULL COMMENT 'Precio al cual se la va a pagar al proveedor',
  `precio_amarilla` float DEFAULT NULL COMMENT 'precio para mostrar los productos de plaza amarilla',
  `terminos_altos` text CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `terminos_bajos` text CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `ean` varchar(60) DEFAULT NULL COMMENT 'codigo de barras',
  `ean_generico` varchar(20) DEFAULT NULL,
  `id_portal` int(11) NOT NULL DEFAULT 0 COMMENT 'Id producto sears portal',
  `tipo` char(255) DEFAULT NULL COMMENT 'tipo de ropa sears',
  `big_ticket` char(10) NOT NULL DEFAULT 'N' COMMENT 'tamano del producto',
  `back_order` char(255) DEFAULT NULL,
  `interes` tinyint(1) DEFAULT 0 COMMENT '1-si interes 0-no interes',
  `telmex_sku` char(8) DEFAULT NULL,
  `telmex_ean` char(15) DEFAULT NULL,
  `telmex_plazo1` int(2) unsigned DEFAULT NULL,
  `telmex_factor1` float unsigned DEFAULT NULL,
  `telmex_factor2` float unsigned DEFAULT NULL,
  `telmex_factor3` float unsigned DEFAULT NULL,
  `telmex_cat1` float unsigned DEFAULT NULL,
  `telmex_cat2` float unsigned DEFAULT NULL,
  `telmex_cat3` float unsigned DEFAULT NULL,
  `linea` int(11) DEFAULT NULL,
  `clase` int(11) DEFAULT NULL,
  `subclase` int(11) DEFAULT NULL,
  `alto` varchar(50) DEFAULT NULL,
  `ancho` varchar(50) DEFAULT NULL,
  `profundidad` varchar(50) DEFAULT NULL,
  `peso_prod` varchar(50) DEFAULT NULL,
  `peligroso` tinyint(1) DEFAULT 0,
  `new_update` int(11) DEFAULT NULL,
  `ancho_caja` varchar(50) DEFAULT NULL,
  `alto_caja` varchar(50) DEFAULT NULL,
  `profundidad_caja` varchar(50) DEFAULT NULL,
  `peso_caja` varchar(50) DEFAULT NULL,
  `imagen_ficha` varchar(150) DEFAULT NULL,
  `imagen_caja` varchar(150) DEFAULT NULL,
  `estatus_genesis` varchar(10) DEFAULT NULL,
  `ingles` tinyint(1) DEFAULT 0,
  `temporada` varchar(50) DEFAULT NULL,
  `anio_temporada` varchar(50) DEFAULT NULL,
  `coleccion` varchar(50) DEFAULT NULL,
  `nuevo` int(11) DEFAULT NULL,
  `comision` float DEFAULT NULL,
  `comision_porcentaje` float DEFAULT NULL,
  `relevancia_venta` int(11) DEFAULT NULL,
  `video_producto` varchar(200) DEFAULT NULL,
  `tipo_envio` tinyint(1) DEFAULT NULL,
  `es_pago` int(2) DEFAULT NULL,
  `atributos` longtext DEFAULT NULL COMMENT 'Almacena un las caracteristicas del producto como color, peso, altura',
  `texto_enriquecido` longtext DEFAULT NULL COMMENT 'Almacenara la descripción detallada de productos de sears',
  `digital` tinyint(4) DEFAULT 0,
  `click_recoge` tinyint(4) DEFAULT 0,
  `actualizado_cron` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `Sub_Categoria` (`Sub_Categoria`),
  KEY `Numero_Parte` (`Numero_Parte`),
  KEY `Tienda` (`Tienda`,`Numero_Parte`) USING BTREE,
  KEY `idproducto` (`Id`),
  KEY `idxEstatus` (`Estatus`,`Tienda`),
  KEY `actualizado_cron` (`Tienda`,`actualizado_cron`) USING BTREE,
  KEY `i_prod_portal` (`id_portal`)
) ENGINE=InnoDB AUTO_INCREMENT=2700862 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productos_entregados_emarsys`
--

DROP TABLE IF EXISTS `productos_entregados_emarsys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_entregados_emarsys` (
  `id_producto_emarsys` int(11) NOT NULL AUTO_INCREMENT,
  `id_relacion_pedido` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `num_pedido` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `arbol_categorias` mediumtext DEFAULT NULL,
  `enviado` tinyint(4) NOT NULL DEFAULT 0,
  `envio_yotpo` tinyint(4) NOT NULL DEFAULT 0,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_producto_emarsys`),
  UNIQUE KEY `id_relacion_pedido` (`id_relacion_pedido`),
  KEY `fk_relacion_emarsys` (`id_relacion_pedido`),
  KEY `fk_producto_emarsys` (`id_producto`),
  KEY `fk_categoria_emarsys` (`id_categoria`),
  KEY `fk_pedido_emarsys` (`num_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=4180 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productos_front`
--

DROP TABLE IF EXISTS `productos_front`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_front` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(500) NOT NULL,
  `Descripcion` longtext DEFAULT NULL,
  `Descripcion_Corta` longtext DEFAULT NULL,
  `Fecha_Inicio` datetime NOT NULL,
  `Sub_Categoria` varchar(50) NOT NULL,
  `Especial` tinyint(1) NOT NULL DEFAULT 0,
  `Precio_Lista` double NOT NULL DEFAULT 0,
  `Precio` double NOT NULL,
  `Precio_Envio` double NOT NULL,
  `Precio_Envio2` double NOT NULL DEFAULT 0,
  `Estatus` int(11) NOT NULL,
  `Tienda` int(11) NOT NULL,
  `Mas_Comprado` tinyint(1) NOT NULL DEFAULT 0,
  `En_Oferta` tinyint(1) NOT NULL DEFAULT 0,
  `Principal` tinyint(1) NOT NULL DEFAULT 0,
  `Variante` varchar(100) DEFAULT 'NULL',
  `Precio_Dolares` double NOT NULL DEFAULT 0,
  `Numero_Parte` varchar(50) DEFAULT NULL,
  `Numero_Proveedor` varchar(50) DEFAULT 'NULL',
  `Embarque` int(10) unsigned NOT NULL DEFAULT 0,
  `Peso_volumetrico` double DEFAULT 0,
  `Peso` double DEFAULT 0,
  `Fabricante` varchar(45) DEFAULT NULL,
  `Modelo` varchar(45) DEFAULT NULL,
  `Precio_Banamex` double DEFAULT NULL,
  `Facturable` int(1) DEFAULT 0,
  `Venta` double DEFAULT NULL,
  `Cantidad` int(11) DEFAULT 0,
  `unico` double unsigned DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `precio_costo` float unsigned DEFAULT NULL COMMENT 'Precio al cual se la va a pagar al proveedor',
  `precio_amarilla` float DEFAULT NULL COMMENT 'precio para mostrar los productos de plaza amarilla',
  `terminos_altos` text CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `terminos_bajos` text CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `ean` varchar(60) DEFAULT NULL COMMENT 'codigo de barras',
  `ean_generico` varchar(20) DEFAULT NULL,
  `telmex` float DEFAULT NULL COMMENT 'precio telmex',
  `tipo` char(255) DEFAULT NULL COMMENT 'tipo de ropa sears',
  `big_ticket` char(255) DEFAULT NULL COMMENT 'tamano del producto',
  `back_order` char(255) DEFAULT NULL,
  `interes` tinyint(1) DEFAULT 0 COMMENT '1-si interes 0-no interes',
  `telmex_sku` char(8) DEFAULT NULL,
  `telmex_ean` char(15) DEFAULT NULL,
  `telmex_plazo1` int(2) unsigned DEFAULT NULL,
  `telmex_factor1` float unsigned DEFAULT NULL,
  `telmex_factor2` float unsigned DEFAULT NULL,
  `telmex_factor3` float unsigned DEFAULT NULL,
  `telmex_cat1` float unsigned DEFAULT NULL,
  `telmex_cat2` float unsigned DEFAULT NULL,
  `telmex_cat3` float unsigned DEFAULT NULL,
  `linea` int(11) DEFAULT NULL,
  `clase` int(11) DEFAULT NULL,
  `subclase` int(11) DEFAULT NULL,
  `alto` varchar(50) DEFAULT NULL,
  `ancho` varchar(50) DEFAULT NULL,
  `profundidad` varchar(50) DEFAULT NULL,
  `peso_prod` varchar(50) DEFAULT NULL,
  `peligroso` tinyint(1) DEFAULT 0,
  `new_update` int(11) DEFAULT NULL,
  `ancho_caja` varchar(50) DEFAULT NULL,
  `alto_caja` varchar(50) DEFAULT NULL,
  `profundidad_caja` varchar(50) DEFAULT NULL,
  `peso_caja` varchar(50) DEFAULT NULL,
  `imagen_ficha` varchar(150) DEFAULT NULL,
  `imagen_caja` varchar(150) DEFAULT NULL,
  `estatus_genesis` varchar(10) DEFAULT NULL,
  `ingles` tinyint(1) DEFAULT 0,
  `temporada` varchar(50) DEFAULT NULL,
  `anio_temporada` varchar(50) DEFAULT NULL,
  `coleccion` varchar(50) DEFAULT NULL,
  `nuevo` int(11) DEFAULT NULL,
  `comision` float DEFAULT NULL,
  `comision_porcentaje` float DEFAULT NULL,
  `relevancia_venta` int(11) DEFAULT NULL,
  `video_producto` varchar(200) DEFAULT NULL,
  `tipo_envio` tinyint(1) DEFAULT NULL,
  `es_pago` int(2) DEFAULT NULL,
  `atributos` longtext DEFAULT NULL COMMENT 'Almacena un las caracteristicas del producto como color, peso, altura',
  `texto_enriquecido` longtext DEFAULT NULL COMMENT 'Almacenara la descripción detallada de productos de sears',
  `digital` tinyint(4) DEFAULT 0,
  `click_recoge` tinyint(4) DEFAULT 0,
  `solo_tienda` tinyint(4) NOT NULL DEFAULT 0,
  `gratuito` tinyint(1) NOT NULL DEFAULT 0,
  `revista_digital` tinyint(1) NOT NULL DEFAULT 0,
  `cron_actualizado` tinyint(1) NOT NULL DEFAULT 0,
  `especificacion_filtros` longtext DEFAULT NULL,
  `cex` int(1) DEFAULT NULL,
  `cex_dias` varchar(50) DEFAULT NULL,
  `division` int(11) NOT NULL DEFAULT 0,
  `descuento` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `Sub_Categoria` (`Sub_Categoria`) USING BTREE,
  KEY `Numero_Parte` (`Numero_Parte`) USING BTREE,
  KEY `Tienda` (`Tienda`,`Numero_Parte`) USING BTREE,
  KEY `idproducto` (`Id`) USING BTREE,
  KEY `idxEstatus` (`Estatus`,`Tienda`) USING BTREE,
  KEY `busca_producto` (`Tienda`,`ean_generico`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157852 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productos_multi_paquetes`
--

DROP TABLE IF EXISTS `productos_multi_paquetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_multi_paquetes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_tienda` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `peso` float(6,2) DEFAULT 0.00,
  `alto` float(6,2) DEFAULT 0.00,
  `ancho` float(6,2) DEFAULT 0.00,
  `profundidad` float(6,2) DEFAULT 0.00,
  `peso_empaque` float(6,2) DEFAULT 0.00,
  `alto_empaque` float(6,2) DEFAULT 0.00,
  `ancho_empaque` float(6,2) DEFAULT 0.00,
  `profundidad_empaque` float(6,2) DEFAULT 0.00,
  `fecha_alta` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`) USING BTREE,
  KEY `id_tienda` (`id_tienda`) USING BTREE,
  CONSTRAINT `fk_volumetria_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos_borrar` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_volumetria_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productos_portal`
--

DROP TABLE IF EXISTS `productos_portal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_portal` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(500) NOT NULL,
  `Descripcion` longtext DEFAULT NULL,
  `Descripcion_Corta` longtext DEFAULT NULL,
  `Fecha_Inicio` datetime NOT NULL,
  `Sub_Categoria` varchar(50) NOT NULL,
  `Especial` tinyint(1) NOT NULL DEFAULT 0,
  `Precio_Lista` double NOT NULL DEFAULT 0,
  `Precio` double NOT NULL,
  `Precio_Envio` double NOT NULL,
  `Precio_Envio2` double NOT NULL DEFAULT 0,
  `Estatus` int(11) NOT NULL,
  `Tienda` int(11) NOT NULL,
  `Mas_Comprado` tinyint(1) NOT NULL DEFAULT 0,
  `En_Oferta` tinyint(1) NOT NULL DEFAULT 0,
  `Principal` tinyint(1) NOT NULL DEFAULT 0,
  `Variante` varchar(100) DEFAULT 'NULL',
  `Precio_Dolares` double NOT NULL DEFAULT 0,
  `Numero_Parte` varchar(50) DEFAULT NULL,
  `Numero_Proveedor` varchar(50) DEFAULT 'NULL',
  `Embarque` int(10) unsigned NOT NULL DEFAULT 0,
  `Peso_volumetrico` double DEFAULT 0,
  `Peso` double DEFAULT 0,
  `Fabricante` varchar(45) DEFAULT NULL,
  `Modelo` varchar(45) DEFAULT NULL,
  `Precio_Banamex` double DEFAULT NULL,
  `Facturable` int(1) DEFAULT 0,
  `Venta` double DEFAULT NULL,
  `Cantidad` int(11) DEFAULT 0,
  `unico` double unsigned DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `precio_costo` float unsigned DEFAULT NULL COMMENT 'Precio al cual se la va a pagar al proveedor',
  `precio_amarilla` float DEFAULT NULL COMMENT 'precio para mostrar los productos de plaza amarilla',
  `terminos_altos` text CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `terminos_bajos` text CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `ean` varchar(60) DEFAULT NULL COMMENT 'codigo de barras',
  `ean_generico` varchar(20) DEFAULT NULL,
  `telmex` float DEFAULT NULL COMMENT 'precio telmex',
  `tipo` char(255) DEFAULT NULL COMMENT 'tipo de ropa sears',
  `big_ticket` char(255) DEFAULT NULL COMMENT 'tamano del producto',
  `back_order` char(255) DEFAULT NULL,
  `interes` tinyint(1) DEFAULT 0 COMMENT '1-si interes 0-no interes',
  `telmex_sku` char(8) DEFAULT NULL,
  `telmex_ean` char(15) DEFAULT NULL,
  `telmex_plazo1` int(2) unsigned DEFAULT NULL,
  `telmex_factor1` float unsigned DEFAULT NULL,
  `telmex_factor2` float unsigned DEFAULT NULL,
  `telmex_factor3` float unsigned DEFAULT NULL,
  `telmex_cat1` float unsigned DEFAULT NULL,
  `telmex_cat2` float unsigned DEFAULT NULL,
  `telmex_cat3` float unsigned DEFAULT NULL,
  `linea` int(11) DEFAULT NULL,
  `clase` int(11) DEFAULT NULL,
  `subclase` int(11) DEFAULT NULL,
  `alto` varchar(50) DEFAULT NULL,
  `ancho` varchar(50) DEFAULT NULL,
  `profundidad` varchar(50) DEFAULT NULL,
  `peso_prod` varchar(50) DEFAULT NULL,
  `peligroso` tinyint(1) DEFAULT 0,
  `new_update` int(11) DEFAULT NULL,
  `ancho_caja` varchar(50) DEFAULT NULL,
  `alto_caja` varchar(50) DEFAULT NULL,
  `profundidad_caja` varchar(50) DEFAULT NULL,
  `peso_caja` varchar(50) DEFAULT NULL,
  `imagen_ficha` varchar(150) DEFAULT NULL,
  `imagen_caja` varchar(150) DEFAULT NULL,
  `estatus_genesis` varchar(10) DEFAULT NULL,
  `ingles` tinyint(1) DEFAULT 0,
  `temporada` varchar(50) DEFAULT NULL,
  `anio_temporada` varchar(50) DEFAULT NULL,
  `coleccion` varchar(50) DEFAULT NULL,
  `nuevo` int(11) DEFAULT NULL,
  `comision` float DEFAULT NULL,
  `comision_porcentaje` float DEFAULT NULL,
  `relevancia_venta` int(11) DEFAULT NULL,
  `video_producto` varchar(200) DEFAULT NULL,
  `tipo_envio` tinyint(1) DEFAULT NULL,
  `es_pago` int(2) DEFAULT NULL,
  `atributos` longtext DEFAULT NULL COMMENT 'Almacena un las caracteristicas del producto como color, peso, altura',
  `texto_enriquecido` longtext DEFAULT NULL COMMENT 'Almacenara la descripción detallada de productos de sears',
  `digital` tinyint(4) DEFAULT 0,
  `click_recoge` tinyint(4) DEFAULT 0,
  `solo_tienda` tinyint(4) NOT NULL DEFAULT 0,
  `gratuito` tinyint(1) NOT NULL DEFAULT 0,
  `revista_digital` tinyint(1) NOT NULL DEFAULT 0,
  `cron_actualizado` tinyint(1) NOT NULL DEFAULT 0,
  `especificacion_filtros` longtext DEFAULT NULL,
  `cex` int(1) DEFAULT NULL,
  `cex_dias` varchar(50) DEFAULT NULL,
  `division` int(11) NOT NULL DEFAULT 0,
  `descuento` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `Sub_Categoria` (`Sub_Categoria`) USING BTREE,
  KEY `Numero_Parte` (`Numero_Parte`) USING BTREE,
  KEY `Tienda` (`Tienda`,`Numero_Parte`) USING BTREE,
  KEY `idproducto` (`Id`) USING BTREE,
  KEY `idxEstatus` (`Estatus`,`Tienda`) USING BTREE,
  KEY `busca_producto` (`Tienda`,`ean_generico`) USING BTREE,
  KEY `i_ean_producto` (`ean`)
) ENGINE=InnoDB AUTO_INCREMENT=195301 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productos_relacion_fullfilment`
--

DROP TABLE IF EXISTS `productos_relacion_fullfilment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_relacion_fullfilment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `pedido_fullfilment` int(11) NOT NULL,
  `producto_fullfilment` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `almacen` tinyint(4) NOT NULL DEFAULT 0,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pedido_fullfilment` (`pedido_fullfilment`) USING BTREE,
  KEY `producto_fullfilment` (`producto_fullfilment`) USING BTREE,
  KEY `id_relacion_pedido` (`id_relacion_pedido`) USING BTREE,
  KEY `numero_pedido` (`numero_pedido`,`id_relacion_pedido`) USING BTREE,
  CONSTRAINT `fk_productos_relacion_fullfilment_id_relacion_pedido` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_productos_relacion_fullfilment_pedidos` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_productos_relacion_fullfilment_pedidos_full` FOREIGN KEY (`pedido_fullfilment`) REFERENCES `pedidos_fullfilment` (`id_pedidos_fullfilment`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productos_vinculados`
--

DROP TABLE IF EXISTS `productos_vinculados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_vinculados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_relp_p` int(11) NOT NULL,
  `id_relp_h` int(11) NOT NULL,
  `sku_producto_p` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL,
  `sku_producto_h` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `i_id_relp_p` (`id_relp_p`),
  KEY `i_id_relp_h` (`id_relp_h`)
) ENGINE=InnoDB AUTO_INCREMENT=6498 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productotallacolor`
--

DROP TABLE IF EXISTS `productotallacolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productotallacolor` (
  `fcEAN` varchar(50) NOT NULL,
  `fcEANSecundario` varchar(50) NOT NULL,
  `fiTallaId` int(11) NOT NULL,
  `fiColorId` int(11) NOT NULL,
  PRIMARY KEY (`fcEAN`,`fiTallaId`,`fcEANSecundario`,`fiColorId`),
  KEY `FK_PTC_CT` (`fiTallaId`),
  KEY `FK_PTC_CC` (`fiColorId`),
  CONSTRAINT `FK_PTC_CC` FOREIGN KEY (`fiColorId`) REFERENCES `catcolor` (`fiColorId`),
  CONSTRAINT `FK_PTC_CT` FOREIGN KEY (`fiTallaId`) REFERENCES `cattalla` (`fiTallaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `push_delivered`
--

DROP TABLE IF EXISTS `push_delivered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_delivered` (
  `id_push_delivered` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `num_guia` varchar(90) NOT NULL,
  `proveedor` varchar(90) NOT NULL,
  `fecha_autorizado` datetime NOT NULL,
  `liga_soporte` text DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `enviado` int(1) NOT NULL DEFAULT 0,
  `fecha_recepcion` date DEFAULT NULL,
  PRIMARY KEY (`id_push_delivered`),
  KEY `fk_num_pedido_push_delivered` (`num_pedido`),
  CONSTRAINT `fk_num_pedido_push_delivered` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reembolso_api`
--

DROP TABLE IF EXISTS `reembolso_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reembolso_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo_reembolso` enum('completo','parcial') NOT NULL,
  `fecha_peticion` datetime NOT NULL,
  `json_in` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`json_in`)),
  `json_out` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`json_out`)),
  `estatus` varchar(50) NOT NULL DEFAULT '',
  `autorizacion` varchar(30) NOT NULL DEFAULT '',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_reembolso_t1_api_num_pedido` (`num_pedido`),
  KEY `fk_reembolso_t1_api_id_usuario` (`id_usuario`),
  CONSTRAINT `fk_reembolso_t1_api_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `admonplaza`.`usr_usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_reembolso_t1_api_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reembolso_parcial`
--

DROP TABLE IF EXISTS `reembolso_parcial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reembolso_parcial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `estatus` smallint(6) DEFAULT NULL,
  `comprobante` mediumtext NOT NULL,
  `id_reembolso_api` int(11) NOT NULL DEFAULT 0,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_num_pedido` (`num_pedido`) USING BTREE,
  KEY `idx_id_relacion_pedido` (`id_relacion_pedido`) USING BTREE,
  KEY `idx_id_producto` (`id_producto`) USING BTREE,
  CONSTRAINT `fk_reembolso_parcial_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_reembolso_parcial_id_relacion_pedido` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_reembolso_parcial_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reembolso_t1_api`
--

DROP TABLE IF EXISTS `reembolso_t1_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reembolso_t1_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `relacion_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo_reembolso` enum('completo','parcial') NOT NULL,
  `fecha_peticion` datetime NOT NULL,
  `json_in` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`json_in`)),
  `json_out` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`json_out`)),
  `estatus` varchar(50) NOT NULL DEFAULT '',
  `autorizacion` varchar(30) NOT NULL DEFAULT '',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referencia_mensajeria`
--

DROP TABLE IF EXISTS `referencia_mensajeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencia_mensajeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedidoNormalizado` varchar(30) NOT NULL,
  `mensajeria` int(5) NOT NULL,
  `referencia` varchar(30) NOT NULL,
  `idProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_cupon_cliente`
--

DROP TABLE IF EXISTS `rel_cupon_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_cupon_cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Id_Cupon` varchar(13) NOT NULL DEFAULT '',
  `cliente` int(11) NOT NULL DEFAULT 0,
  `pedido` int(11) NOT NULL DEFAULT 0,
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`cliente`),
  KEY `pedido` (`pedido`),
  KEY `Id_Cupon` (`Id_Cupon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_pedido_con_intereses`
--

DROP TABLE IF EXISTS `rel_pedido_con_intereses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_pedido_con_intereses` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pedido` int(30) DEFAULT NULL COMMENT 'numero de pedido',
  `Tarjeta` int(11) DEFAULT NULL COMMENT 'id forma de pago',
  `Total` double DEFAULT NULL COMMENT 'total del campo pedido, no incluye envio',
  `Mensualidad` double DEFAULT NULL COMMENT 'cantidad mensual a pagar',
  `Tipo` int(1) DEFAULT NULL COMMENT 'Si es tipo 2 indica que se cambio forma de pago',
  `Interes` double DEFAULT NULL COMMENT 'intereses cobrados',
  `TotalIntereses` double DEFAULT NULL COMMENT 'total de la compra intereses + envio',
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `pedido` (`Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_pedido_factura`
--

DROP TABLE IF EXISTS `rel_pedido_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_pedido_factura` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Factura` int(11) DEFAULT NULL,
  `Pedido` int(11) DEFAULT NULL,
  `Fecha_solicita` datetime DEFAULT NULL,
  `Realiza` int(11) DEFAULT NULL,
  `Fecha_realiza` datetime DEFAULT NULL,
  `eliminada` int(1) DEFAULT 1 COMMENT '1-no 0-si',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_pedido_tdccomprobante`
--

DROP TABLE IF EXISTS `rel_pedido_tdccomprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_pedido_tdccomprobante` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pedido` int(11) DEFAULT NULL,
  `Comprobante` varchar(100) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `Tipo` int(11) DEFAULT NULL COMMENT '1-con intereses 0-sin intereses',
  `usr` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `motivo` int(11) unsigned DEFAULT 1 COMMENT 'motivo por el cual el cargo es diferente al que viene al pedido',
  `validado` int(11) DEFAULT 0 COMMENT '0-pendiente 1-aprobado 2-conciliar',
  `fecha_validacion` datetime DEFAULT NULL,
  `usr_validacion` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT 1 COMMENT '1 no cancelado 0-reembolso,cancelado',
  `detalle` mediumtext DEFAULT NULL COMMENT 'almacena la informacion de la transaccion',
  PRIMARY KEY (`Id`),
  KEY `pedido` (`Pedido`),
  KEY `Comprobante` (`Comprobante`),
  KEY `idx_usr` (`usr`)
) ENGINE=InnoDB AUTO_INCREMENT=5806881 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_producto_foto`
--

DROP TABLE IF EXISTS `rel_producto_foto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_producto_foto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Producto` int(11) NOT NULL,
  `Foto` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Producto` (`Producto`),
  KEY `Foto` (`Foto`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_reembolso_pedidos`
--

DROP TABLE IF EXISTS `rel_reembolso_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_reembolso_pedidos` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdReembolso` int(10) unsigned NOT NULL,
  `IdComercioPedido` int(10) unsigned NOT NULL,
  `FechaCreacion` date NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_tienda_fisica_mensajeria`
--

DROP TABLE IF EXISTS `rel_tienda_fisica_mensajeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_tienda_fisica_mensajeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tienda_fisica` int(11) NOT NULL,
  `id_mensajeria` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_rel_tienda_fisica_mensajeria_id_tienda_fisica` (`id_tienda_fisica`),
  KEY `fk_rel_tienda_fisica_mensajeria_id_mensajeria` (`id_mensajeria`),
  CONSTRAINT `fk_rel_tienda_fisica_mensajeria_id_mensajeria` FOREIGN KEY (`id_mensajeria`) REFERENCES `ctg_mensajeria` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_rel_tienda_fisica_mensajeria_id_tienda_fisica` FOREIGN KEY (`id_tienda_fisica`) REFERENCES `lista_direcciones` (`num_tienda`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relacion_categorias_iva`
--

DROP TABLE IF EXISTS `relacion_categorias_iva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_categorias_iva` (
  `id_categoria_iva` int(11) NOT NULL AUTO_INCREMENT,
  `id_cat` int(11) unsigned NOT NULL,
  `iva` int(3) DEFAULT 0,
  `usuario_alta` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `usuario_baja` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `usuario_modificacion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `fecha_baja` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_categoria_iva`),
  KEY `id_cat` (`id_cat`) USING BTREE,
  CONSTRAINT `fk_id_cat_rci` FOREIGN KEY (`id_cat`) REFERENCES `tienda_nueva`.`categorias` (`id_cat`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relacion_correo_seller`
--

DROP TABLE IF EXISTS `relacion_correo_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_correo_seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_seller` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nombre_tipo` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(250) NOT NULL DEFAULT '',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relacion_departamentos_tienda_dc`
--

DROP TABLE IF EXISTS `relacion_departamentos_tienda_dc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_departamentos_tienda_dc` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id principal de la tabla',
  `id_tienda` int(11) NOT NULL COMMENT 'Id identificador de la tienda a la que pertenece el departamento',
  `id_depa_tienda` int(11) NOT NULL COMMENT 'Id del departamento de la tienda',
  `id_depa_dc` int(11) NOT NULL COMMENT 'Id del departamento de decompras',
  `fecha_creacion` datetime NOT NULL COMMENT 'Fecha en la que se dio de alta el registro',
  `fecha_modificacion` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifico el registro',
  `fecha_baja` datetime DEFAULT NULL COMMENT 'Fecha en la que se dio de baja el registro',
  `usuario_alta` varchar(50) NOT NULL COMMENT 'Usuario que da de alta un registro',
  `usuario_modifica` varchar(50) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `usuario_baja` varchar(50) DEFAULT NULL COMMENT 'Usuario que da de baja el registro',
  PRIMARY KEY (`id`),
  KEY `id_tienda` (`id_tienda`,`id_depa_tienda`) USING BTREE,
  CONSTRAINT `relacion_departamentos_tienda_dc_fktienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Guarda relación de los departamentos de una tienda con decompras';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relacion_estatus_productos`
--

DROP TABLE IF EXISTS `relacion_estatus_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_estatus_productos` (
  `id_relacion` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `relacion_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `estatus_producto` int(4) NOT NULL,
  `guia_original` varchar(20) NOT NULL,
  `guia_retorno` varchar(20) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_relacion`),
  KEY `i_relacion_estatus` (`estatus_producto`),
  KEY `i_relacion_pedido` (`num_pedido`),
  KEY `irelpedido` (`relacion_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=16097830 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relacion_familia_estatus`
--

DROP TABLE IF EXISTS `relacion_familia_estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_familia_estatus` (
  `id_relacion_familia_estatus` int(11) NOT NULL AUTO_INCREMENT,
  `id_catalogo_familia` int(11) NOT NULL,
  `estatus_pedido` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `forma_de_pago` int(11) NOT NULL,
  PRIMARY KEY (`id_relacion_familia_estatus`),
  KEY `fk_relacion_familia_estatus_1_idx` (`id_catalogo_familia`),
  KEY `i_estatus_falilia` (`estatus_pedido`),
  KEY `i_formapago_familia` (`forma_de_pago`),
  CONSTRAINT `fk_relacion_familia_estatus_1` FOREIGN KEY (`id_catalogo_familia`) REFERENCES `catalogo_familia` (`id_catalogo_familia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1252 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relacion_formas_pago_cs_sat`
--

DROP TABLE IF EXISTS `relacion_formas_pago_cs_sat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_formas_pago_cs_sat` (
  `id_forma_pago` int(11) NOT NULL,
  `id_sat` char(2) NOT NULL,
  `desc_forma_pago` varchar(100) NOT NULL,
  `desc_sat` varchar(100) NOT NULL,
  `usuario_alta` varchar(50) DEFAULT NULL,
  `usuario_modificacion` varchar(50) DEFAULT NULL,
  `usuario_baja` varchar(50) DEFAULT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  PRIMARY KEY (`id_forma_pago`),
  CONSTRAINT `fk_id_forma_pago_rfpcs` FOREIGN KEY (`id_forma_pago`) REFERENCES `metodos_de_pago` (`id_metodos_pago`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relacion_pedido_fecha_estimada`
--

DROP TABLE IF EXISTS `relacion_pedido_fecha_estimada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_pedido_fecha_estimada` (
  `id_rel_pedido_fe` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `fecha_estimada_entrega` datetime NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` int(11) DEFAULT NULL,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  `costo_cotizacion` float(7,2) NOT NULL,
  `tipo_envio` varchar(250) NOT NULL,
  `id_mensajeria` int(11) NOT NULL,
  `fecha_entrega_programada` date NOT NULL DEFAULT '0000-00-00',
  `fecha_estimada_entrega_inicio` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `range_copy` text NOT NULL,
  `range_text` text NOT NULL,
  `days` int(11) NOT NULL DEFAULT 0,
  `state` text NOT NULL,
  `fecha_estimada_mensajeria` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_entrega_mensajeria` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `place` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(60) NOT NULL DEFAULT '',
  `correo_retraso_entrega` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_cliente` text NOT NULL,
  `fecha_manual` int(2) NOT NULL,
  `fecha_manual_inicio` date NOT NULL DEFAULT '0000-00-00',
  `fecha_manual_fin` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id_rel_pedido_fe`),
  UNIQUE KEY `id_relacion_pedido` (`id_relacion_pedido`),
  KEY `i_pedido_estimada` (`numero_pedido`),
  KEY `i_relacion_estimada` (`id_relacion_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=8262075 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relacion_pedidos`
--

DROP TABLE IF EXISTS `relacion_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tienda` int(11) DEFAULT NULL,
  `Pedido` int(10) unsigned DEFAULT NULL,
  `id_seller` int(11) NOT NULL,
  `nombre_seller` varchar(100) NOT NULL,
  `id_categoria` int(11) NOT NULL DEFAULT 0,
  `categoria` varchar(100) NOT NULL DEFAULT '',
  `Producto` int(10) unsigned DEFAULT NULL,
  `Nombre_producto` mediumtext DEFAULT NULL,
  `Precio` double unsigned DEFAULT NULL,
  `precio_venta` double unsigned DEFAULT NULL COMMENT 'El precio reflejado en carrito con interes, descuento individual, etc.',
  `precio_lista` double NOT NULL DEFAULT 0,
  `costo_envio` double unsigned DEFAULT NULL,
  `costo_envio_venta` double DEFAULT NULL,
  `habilitado` char(3) DEFAULT 's',
  `extra` varchar(255) DEFAULT NULL COMMENT 'Aqui se guarda más detalle de lo aplicado al producto',
  `costo` double DEFAULT 0 COMMENT 'costo al cual se la paga al proveedor el producto',
  `comision` float DEFAULT NULL COMMENT 'comision aplicable al producto',
  `pto_emisor` int(10) DEFAULT NULL COMMENT 'punto emisor sears',
  `estatus_sears` char(1) DEFAULT NULL COMMENT 'estatus sears',
  `transferencia` int(10) DEFAULT NULL COMMENT 'numero de transferencia sears',
  `fecha` datetime DEFAULT NULL,
  `iva` tinyint(4) DEFAULT NULL,
  `comision_pesos` float DEFAULT NULL,
  `comision_porcentaje` float DEFAULT NULL,
  `sku_hijo` varchar(50) DEFAULT '0',
  `sku_padre` varchar(50) DEFAULT '0',
  `departamento` int(11) DEFAULT NULL,
  `ean` varchar(60) DEFAULT NULL,
  `cex` tinyint(2) DEFAULT NULL COMMENT 'Catálogo\r\nExtendido',
  `cex_dias` varchar(50) DEFAULT NULL COMMENT 'Días del\r\nCatálogo Extendido Alfanumerico',
  `tallacolor` tinyint(2) DEFAULT NULL,
  `vinculado` tinyint(2) DEFAULT 0,
  `descuento` float(9,2) DEFAULT NULL,
  `tipo_mensajeria` char(1) DEFAULT '0',
  `id_relacion_pedido_portal` int(11) DEFAULT NULL,
  `plan_de_pago` int(11) NOT NULL DEFAULT 0 COMMENT 'Plan de pago(MSI) por producto',
  `secuencia` int(11) NOT NULL DEFAULT 0 COMMENT 'Secuencia (Promoción) por producto',
  `fullfilment` tinyint(1) NOT NULL DEFAULT 0,
  `id_fullfilment` int(11) NOT NULL DEFAULT 0,
  `ean_hijo` varchar(50) DEFAULT '0',
  `id_relacion_pedido` int(11) NOT NULL DEFAULT 0,
  `tag_afiliado` varchar(70) NOT NULL DEFAULT '',
  `id_afiliado` int(11) DEFAULT NULL,
  `comision_afiliado` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Pedido` (`Pedido`),
  KEY `Producto` (`Producto`),
  KEY `transferencia` (`transferencia`),
  KEY `habilitado` (`habilitado`),
  KEY `id_seller` (`id_seller`) USING BTREE,
  KEY `i_id_seller_rel` (`id_seller`),
  KEY `fullfilment` (`fullfilment`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16942311 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relacion_pedidos_alibaba`
--

DROP TABLE IF EXISTS `relacion_pedidos_alibaba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_pedidos_alibaba` (
  `id_rel_pedido_alibaba` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `pedido_alibaba` varchar(20) DEFAULT NULL,
  `id_tienda` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `id_tienda_fisica` int(11) DEFAULT NULL,
  `id_cdt` int(11) DEFAULT NULL,
  `tipo_entrega` varchar(10) DEFAULT NULL,
  `redistribuir` tinyint(1) NOT NULL,
  `catalogo_extendido` tinyint(1) NOT NULL,
  `big_ticket` tinyint(1) NOT NULL,
  `procesado` tinyint(1) NOT NULL,
  `codigo_respuesta` int(11) DEFAULT NULL,
  `mensaje_respuesta` text DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `id_usuario_alta` tinyint(4) NOT NULL,
  `id_usuario_modifica` tinyint(4) DEFAULT NULL,
  `id_usuario_baja` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_rel_pedido_alibaba`),
  KEY `i_pedido_alibaba` (`numero_pedido`),
  KEY `i_relpedido_alibaba` (`id_relacion_pedido`),
  CONSTRAINT `fk_pedido_alibaba` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_relpedido_alibaba` FOREIGN KEY (`id_relacion_pedido`) REFERENCES `relacion_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6048 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relacion_pedidos_backup`
--

DROP TABLE IF EXISTS `relacion_pedidos_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_pedidos_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tienda` int(10) unsigned DEFAULT NULL,
  `Pedido` int(10) unsigned DEFAULT NULL,
  `Producto` int(10) unsigned DEFAULT NULL,
  `Nombre_producto` mediumtext DEFAULT NULL,
  `Precio` double unsigned DEFAULT NULL,
  `precio_venta` double unsigned DEFAULT NULL COMMENT 'El precio reflejado en carrito con interes, descuento individual, etc.',
  `costo_envio` double unsigned DEFAULT NULL,
  `costo_envio_venta` double DEFAULT NULL,
  `habilitado` char(3) DEFAULT 's',
  `extra` varchar(255) DEFAULT NULL COMMENT 'Aqui se guarda más detalle de lo aplicado al producto',
  `costo` double DEFAULT 0 COMMENT 'costo al cual se la paga al proveedor el producto',
  `comision` float DEFAULT NULL COMMENT 'comision aplicable al producto',
  `pto_emisor` int(10) DEFAULT NULL COMMENT 'punto emisor sears',
  `estatus_sears` char(1) DEFAULT NULL COMMENT 'estatus sears',
  `transferencia` int(10) DEFAULT NULL COMMENT 'numero de transferencia sears',
  `fecha` datetime DEFAULT NULL,
  `iva` tinyint(4) DEFAULT NULL,
  `comision_pesos` float DEFAULT NULL,
  `comision_porcentaje` float DEFAULT NULL,
  `sku_hijo` bigint(20) DEFAULT 0,
  `sku_padre` varchar(50) DEFAULT '0',
  `departamento` int(11) DEFAULT NULL,
  `ean` varchar(60) DEFAULT NULL,
  `tallacolor` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Pedido` (`Pedido`),
  KEY `Producto` (`Producto`),
  KEY `transferencia` (`transferencia`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relacion_pedidos_tienda_dc`
--

DROP TABLE IF EXISTS `relacion_pedidos_tienda_dc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_pedidos_tienda_dc` (
  `id_registro` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id principal de la tabla',
  `id_tienda` int(11) DEFAULT NULL COMMENT 'Id de la tienda a la que pertenece el producto',
  `pedido_tienda` int(11) unsigned NOT NULL COMMENT 'Numero de pedido de sanborns',
  `checkout_id` int(11) DEFAULT NULL,
  `pedido_dc` int(11) NOT NULL COMMENT 'Numero de pedido de sanborns en decompras',
  `fecha_alta` datetime DEFAULT NULL COMMENT 'Fecha en la que se da de alta el registro',
  `fecha_baja` datetime DEFAULT NULL COMMENT 'Fecha en la que se da de baja el registro',
  `fecha_modificacion` datetime DEFAULT NULL COMMENT 'Fecha de la ultima modificación del registro',
  `usuario_alta` varchar(50) DEFAULT NULL COMMENT 'Usuario que da de alta el registro',
  `usuario_baja` varchar(50) DEFAULT NULL COMMENT 'Usuario que da de baja el registro',
  `usuario_modifica` varchar(50) DEFAULT NULL COMMENT 'Ultimo usuario que modifica el registro',
  PRIMARY KEY (`id_registro`),
  KEY `pedido_dc` (`pedido_dc`) USING BTREE,
  KEY `id_tienda` (`id_tienda`) USING BTREE,
  CONSTRAINT `fk_pedido_dc` FOREIGN KEY (`pedido_dc`) REFERENCES `pedidos` (`Num_pedido`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Relación de los pedidos cualquier tienda con los pedidos de cualquier tienda en decompras';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relacion_pedidos_tmp`
--

DROP TABLE IF EXISTS `relacion_pedidos_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_pedidos_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tienda` int(10) unsigned DEFAULT NULL,
  `Pedido` int(10) unsigned DEFAULT NULL,
  `Producto` int(10) unsigned DEFAULT NULL,
  `Nombre_producto` text DEFAULT NULL,
  `Precio` double unsigned DEFAULT NULL,
  `precio_venta` double unsigned DEFAULT NULL COMMENT 'El precio reflejado en carrito con interes, descuento individual, etc.',
  `costo_envio` double unsigned DEFAULT NULL,
  `costo_envio_venta` double DEFAULT NULL,
  `habilitado` char(3) DEFAULT 's',
  `extra` varchar(255) DEFAULT NULL COMMENT 'Aqui se guarda más detalle de lo aplicado al producto',
  `costo` double DEFAULT 0 COMMENT 'costo al cual se la paga al proveedor el producto',
  `comision` float DEFAULT NULL COMMENT 'comision aplicable al producto',
  `pto_emisor` int(10) DEFAULT NULL COMMENT 'punto emisor sears',
  `estatus_sears` char(2) DEFAULT NULL COMMENT 'estatus sears',
  `transferencia` int(10) DEFAULT NULL COMMENT 'numero de transferencia sears',
  `fecha` datetime DEFAULT NULL,
  `descuento_sears` double DEFAULT NULL,
  `comision_pesos` float DEFAULT NULL,
  `comision_porcentaje` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Pedido` (`Pedido`),
  KEY `Producto` (`Producto`),
  KEY `transferencia` (`transferencia`),
  KEY `idxestatus_sears` (`estatus_sears`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1389360 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`eesquivel`@`%`*/ /*!50003 TRIGGER `bit_relped_ins` AFTER INSERT ON `relacion_pedidos_tmp`
FOR EACH ROW INSERT INTO bitacoradml(host, usuario, operacion, modificado, tabla) VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "Insertar", NOW(), "relacion_pedidos_tmp") */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `relacion_presupuesto_pedidos`
--

DROP TABLE IF EXISTS `relacion_presupuesto_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_presupuesto_pedidos` (
  `idrelacionpresupuesto` int(11) NOT NULL AUTO_INCREMENT,
  `tienda` int(10) unsigned DEFAULT NULL,
  `pedido` int(10) unsigned DEFAULT NULL,
  `producto` int(10) unsigned DEFAULT NULL,
  `nombreproducto` text DEFAULT NULL,
  `precio` double unsigned DEFAULT NULL,
  `precioventa` double unsigned DEFAULT NULL COMMENT 'El precio reflejado en carrito con interes, descuento individual, etc.',
  `costoenvio` double unsigned DEFAULT NULL,
  `costoenvioventa` double DEFAULT NULL,
  `habilitado` char(3) DEFAULT 's',
  `extra` varchar(255) DEFAULT NULL COMMENT 'Aqui se guarda más detalle de lo aplicado al producto',
  `costo` double DEFAULT 0 COMMENT 'costo al cual se la paga al proveedor el producto',
  `comision` float DEFAULT NULL COMMENT 'comision aplicable al producto',
  `ptoemisor` int(10) DEFAULT NULL COMMENT 'punto emisor sears',
  `estatussears` char(1) DEFAULT NULL COMMENT 'estatus sears',
  `transferencia` int(10) DEFAULT NULL COMMENT 'numero de transferencia sears',
  `fecha` datetime DEFAULT NULL,
  `descuentosears` double DEFAULT NULL,
  `comisionpesos` float DEFAULT NULL,
  `comisionporcentaje` float DEFAULT NULL,
  `skuhijo` bigint(20) DEFAULT 0,
  `skupadre` varchar(50) DEFAULT '0',
  PRIMARY KEY (`idrelacionpresupuesto`),
  KEY `Pedido` (`pedido`),
  KEY `Producto` (`producto`),
  KEY `transferencia` (`transferencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relacion_productos_tienda_dc`
--

DROP TABLE IF EXISTS `relacion_productos_tienda_dc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_productos_tienda_dc` (
  `id_registro` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id principal de la tabla',
  `id_tienda` int(11) DEFAULT NULL COMMENT 'Id de la tienda a la que pertenece el producto',
  `id_prod_tienda` bigint(20) DEFAULT NULL,
  `financiamiento` text DEFAULT NULL,
  `id_prod_dc` int(11) NOT NULL COMMENT 'Id del producto de sanborns en decompras',
  `traducido` tinyint(1) NOT NULL DEFAULT 0,
  `actualizable` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_alta` datetime DEFAULT NULL COMMENT 'Fecha en la que se da de alta el registro',
  `fecha_baja` datetime DEFAULT NULL COMMENT 'Fecha en la que se da de baja el registro',
  `fecha_modificacion` datetime DEFAULT NULL COMMENT 'Fecha de la ultima modificación del registro',
  `usuario_alta` varchar(50) DEFAULT NULL COMMENT 'Usuario que da de alta el registro',
  `usuario_baja` varchar(50) DEFAULT NULL COMMENT 'Usuario que da de baja el registro',
  `usuario_modifica` varchar(50) DEFAULT NULL COMMENT 'Ultimo usuario que modifica el registro',
  PRIMARY KEY (`id_registro`),
  KEY `id_prod_dc` (`id_prod_dc`) USING BTREE,
  KEY `id_tienda` (`id_tienda`) USING BTREE,
  KEY `id_prod_tienda` (`id_prod_tienda`) USING BTREE,
  CONSTRAINT `fk_id_prod_dc` FOREIGN KEY (`id_prod_dc`) REFERENCES `productos_borrar` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_id_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Relación de los productos de cualquier tienda con los productos de cualquier tienda en decompras';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reporte_guias`
--

DROP TABLE IF EXISTS `reporte_guias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte_guias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `relacion_pedido` int(11) NOT NULL,
  `guia` varchar(150) DEFAULT NULL,
  `fecha_origen_guia` datetime DEFAULT NULL,
  `fecha_promesa_paqueteria` datetime DEFAULT NULL,
  `estatus_guia` varchar(255) DEFAULT NULL,
  `familia_estatu` varchar(255) DEFAULT NULL,
  `dias_embarque` int(11) DEFAULT NULL,
  `tipo_guia` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `retorno_mensajeria`
--

DROP TABLE IF EXISTS `retorno_mensajeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `retorno_mensajeria` (
  `id_retorno_mensajeria` int(11) NOT NULL AUTO_INCREMENT,
  `id_mensajeria` int(11) NOT NULL,
  `codigo` varchar(4) DEFAULT NULL,
  `num_pedido` int(11) NOT NULL,
  `guia_original` varchar(90) NOT NULL,
  `guia_retorno` varchar(90) NOT NULL,
  `actividad` varchar(100) NOT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `fecha_hora` datetime NOT NULL,
  `mensaje` varchar(45) NOT NULL,
  `eventos` tinyint(4) DEFAULT NULL,
  `enviado` tinyint(1) NOT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `entregado` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_retorno_mensajeria`),
  KEY `i_retorno_mensajeria` (`num_pedido`) USING BTREE,
  KEY `i_retorno_pedido` (`num_pedido`) USING BTREE,
  KEY `i_retorno_guiao` (`guia_original`) USING BTREE,
  KEY `i_retorno_guiar` (`guia_retorno`) USING BTREE,
  CONSTRAINT `fk_guias_retorno_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_audit_service`
--

DROP TABLE IF EXISTS `sales_audit_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_audit_service` (
  `id_sales_audit_service` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_notificacion` enum('anticipo','confirmacion') NOT NULL,
  `num_pedido` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_consumo` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `registradora` int(11) NOT NULL,
  `transaccion` int(11) NOT NULL,
  `xml` text NOT NULL,
  `xml_response` text NOT NULL,
  `procesado` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_sales_audit_service`),
  KEY `idx_num_pedido` (`num_pedido`) USING BTREE,
  CONSTRAINT `fk_sales_audit_service_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_check_pos`
--

DROP TABLE IF EXISTS `sales_check_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_check_pos` (
  `id_sales_check_pos` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `sales_check` varchar(20) NOT NULL,
  `tienda_anticipo` varchar(4) NOT NULL,
  `registradora` int(11) NOT NULL,
  `transaccion` int(11) NOT NULL,
  `origen` varchar(20) DEFAULT NULL,
  `id_afiliado` varchar(60) DEFAULT NULL,
  `fecha_sales_check` varchar(10) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_sales_check_pos`),
  KEY `i_pedido_salescheck` (`numero_pedido`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54582 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_check_pos_detalle`
--

DROP TABLE IF EXISTS `sales_check_pos_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_check_pos_detalle` (
  `id_pos_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `forma_de_pago_pos` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_pos_detalle`),
  KEY `i_pedido_salesdetalle` (`numero_pedido`) USING BTREE,
  KEY `i_relacion_salesdetalle` (`id_relacion_pedido`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=609 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sanborns_log_guias`
--

DROP TABLE IF EXISTS `sanborns_log_guias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanborns_log_guias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido` varchar(45) NOT NULL,
  `pedidoTienda` varchar(45) NOT NULL,
  `comercio` varchar(45) NOT NULL,
  `mensajeria` varchar(45) NOT NULL,
  `guia` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scan_guias_app`
--

DROP TABLE IF EXISTS `scan_guias_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `scan_guias_app` (
  `id_scan` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `numero_pedido` int(11) NOT NULL,
  `numero_guia` varchar(90) NOT NULL,
  `relacion_pedidos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`relacion_pedidos`)),
  `comercio_pedidos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`comercio_pedidos`)),
  `fecha_registro` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `id_usuario` int(11) DEFAULT NULL,
  `id_tienda` int(11) DEFAULT NULL,
  `scaneado` tinyint(1) DEFAULT NULL,
  `embarque` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_scan`),
  KEY `i_pedido_scanguia` (`numero_pedido`),
  KEY `i_guia_scanguia` (`numero_guia`),
  KEY `i_scaneado` (`scaneado`),
  KEY `i_embarque` (`embarque`),
  KEY `i_fecha_registro` (`fecha_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `id_seller` int(11) NOT NULL AUTO_INCREMENT,
  `id_externo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estatus` tinyint(1) NOT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_seller`),
  UNIQUE KEY `id_externo` (`id_externo`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sepomex`
--

DROP TABLE IF EXISTS `sepomex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sepomex` (
  `d_codigo` varchar(5) DEFAULT NULL,
  `d_asenta` varchar(100) DEFAULT NULL,
  `d_tipo_asenta` varchar(100) DEFAULT NULL,
  `d_mnpio` varchar(100) DEFAULT NULL,
  `d_estado` varchar(100) DEFAULT NULL,
  `d_ciudad` varchar(100) DEFAULT NULL,
  `d_cp` varchar(45) DEFAULT NULL,
  `c_estado` varchar(45) DEFAULT NULL,
  `c_oficina` varchar(45) DEFAULT NULL,
  `c_cp` varchar(45) DEFAULT NULL,
  `c_tipo_asenta` varchar(45) DEFAULT NULL,
  `c_mnpio` varchar(45) DEFAULT NULL,
  `id_asenta_cpcons` varchar(45) DEFAULT NULL,
  `d_zona` varchar(45) DEFAULT NULL,
  `c_cve_ciudad` varchar(45) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=144757 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sin_guia_fedex`
--

DROP TABLE IF EXISTS `sin_guia_fedex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sin_guia_fedex` (
  `id_sin_guia` int(11) NOT NULL AUTO_INCREMENT,
  `id_cat` int(11) NOT NULL,
  `nombre_categoria` varchar(150) NOT NULL,
  `costo_envio` varchar(150) NOT NULL,
  `sin_guia` smallint(2) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_sin_guia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `solicita_cancela_productos`
--

DROP TABLE IF EXISTS `solicita_cancela_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicita_cancela_productos` (
  `id_solicita` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `relacion_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(250) NOT NULL,
  `estatus_producto` tinyint(4) NOT NULL,
  `tienda_origen` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_cancela` datetime DEFAULT '0000-00-00 00:00:00',
  `id_usuario` int(11) NOT NULL,
  `solicitud` float(1,0) DEFAULT 0,
  `etapa_anterior` tinyint(4) NOT NULL,
  `origen` varchar(100) NOT NULL DEFAULT '' COMMENT 'Origen de la petición de cancelación del producto.',
  PRIMARY KEY (`id_solicita`),
  KEY `idxnumpedid` (`num_pedido`),
  KEY `idxidrelpedi` (`relacion_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sucursal_direccion`
--

DROP TABLE IF EXISTS `sucursal_direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal_direccion` (
  `id_sucursal_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) NOT NULL DEFAULT 1,
  `calle` varchar(150) NOT NULL,
  `numero` varchar(30) NOT NULL DEFAULT '0',
  `colonia` varchar(150) NOT NULL,
  `delegacion_municipio` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `cp` char(5) NOT NULL,
  `lada` char(10) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `horario` varchar(50) NOT NULL DEFAULT 'Lunes a Domingo de 11:00 a 21:00',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` int(11) NOT NULL DEFAULT 1,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sucursal_direccion`) USING BTREE,
  KEY `i_sucursal_direccion` (`id_sucursal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `id_externo` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_tienda` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_sucursal`) USING BTREE,
  KEY `fk_tienda_sucursal` (`id_tienda`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tallacolor`
--

DROP TABLE IF EXISTS `tallacolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tallacolor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idproductocolor` int(11) NOT NULL,
  `talla` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `skuhijo` varchar(45) DEFAULT NULL,
  `ean` varchar(45) DEFAULT NULL,
  `prefixpeso` varchar(10) DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `prefixprecio` varchar(10) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `estatus` int(11) NOT NULL,
  `fecharegistro` datetime NOT NULL,
  `fechamodificado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61112 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_comprobante`
--

DROP TABLE IF EXISTS `ticket_comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_comprobante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_archivo_ticket` varchar(100) DEFAULT '',
  `numero_pedido` int(11) DEFAULT 0,
  `enviado` int(11) DEFAULT 0,
  `comprobante` varchar(100) DEFAULT '',
  `fecha_enviado` datetime DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `id_comprobante` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tickets_help`
--

DROP TABLE IF EXISTS `tickets_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla',
  `ticket_id` int(11) NOT NULL COMMENT 'número de ticket enviado por portal',
  `status_id` int(11) NOT NULL DEFAULT 1 COMMENT 'ID del estatus del ticket en el back',
  `json` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci DEFAULT NULL COMMENT 'JSON que envia el portal para la atención del ticket',
  `id_cliente` int(11) DEFAULT NULL,
  `num_pedido` int(11) DEFAULT NULL COMMENT 'numero de pedido',
  `id_pedido` int(11) DEFAULT NULL COMMENT 'id del pedido',
  `statusf` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci DEFAULT NULL COMMENT 'Estatus del ticket en el portal',
  `statsusf_id` int(11) DEFAULT NULL COMMENT 'id del estatus del portal',
  `type` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci DEFAULT NULL COMMENT 'tipo de ticket del portal',
  `type_id` int(11) DEFAULT NULL COMMENT 'is del tipo de ticket del portal',
  `reproceso` tinyint(2) NOT NULL DEFAULT 0 COMMENT 'bandera para saber si el ticket es reeprocesado',
  `reason` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `application` varchar(250) NOT NULL DEFAULT '',
  `origen` varchar(100) NOT NULL DEFAULT '' COMMENT 'Origen de la petición de cancelación del producto.',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `problem_id` int(11) NOT NULL DEFAULT 0,
  `actions_id` int(11) NOT NULL DEFAULT 0,
  `hash_json` varchar(100) NOT NULL DEFAULT '' COMMENT 'Hash de la información del json sin el id del portal, para evitar duplicados',
  PRIMARY KEY (`id`),
  KEY `hash_json` (`hash_json`) USING BTREE,
  KEY `i_help_estatus` (`status_id`),
  KEY `i_ticket_help` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1080 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tickets_help_evidencias`
--

DROP TABLE IF EXISTS `tickets_help_evidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_help_evidencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla',
  `id_ticket` int(11) NOT NULL COMMENT 'id del tciket de ayuda dinámica',
  `url_imagen` varchar(250) NOT NULL COMMENT 'url de evidencia que contiene la imagen del producto',
  `orden` smallint(6) NOT NULL COMMENT 'orden de las imagenes',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `i_ticket_help` (`id_ticket`)
) ENGINE=InnoDB AUTO_INCREMENT=2836 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tickets_help_refound`
--

DROP TABLE IF EXISTS `tickets_help_refound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_help_refound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `id_relacion_pedido` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `forma_de_pago` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `gratis` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tickets_help_rel_pedido`
--

DROP TABLE IF EXISTS `tickets_help_rel_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_help_rel_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla, auto incrementable',
  `ticket_id` int(11) NOT NULL COMMENT 'tienda.tickets_help.id',
  `id_relacion_pedido` int(11) NOT NULL COMMENT 'id de relacion pedido',
  `estatus` int(11) NOT NULL DEFAULT 0 COMMENT 'Estatus de avance en el proceso de devolución, (0:pendiente, 1:)',
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `no_reporte` varchar(45) NOT NULL DEFAULT '',
  `id_motivo_rechazo` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_relacion_pedido` (`id_relacion_pedido`) USING BTREE,
  KEY `i_ticket_pedido` (`ticket_id`),
  KEY `i_pedido_estatus` (`estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=1023 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Propietario` int(11) NOT NULL,
  `Fecha_Inicio` datetime NOT NULL,
  `Estatus` int(11) NOT NULL,
  `Num_Pedidos` int(11) unsigned DEFAULT 0,
  `Url` varchar(100) DEFAULT 'NULL',
  `Autorizada` int(11) DEFAULT 0,
  `Logo_Tienda` varchar(250) DEFAULT NULL,
  `comentario` mediumtext DEFAULT NULL,
  `comision` double DEFAULT 8.99,
  `fechaActivacion` date DEFAULT NULL,
  `fechaComentario` date DEFAULT NULL,
  `notificacionContpaq` int(11) DEFAULT 0,
  `Portal` int(4) DEFAULT 0,
  `tipo` int(1) unsigned DEFAULT 1 COMMENT '0 es prueba, 1 es premium, 2 es ancla, 3 es portal',
  `contrato` tinyint(1) DEFAULT 0 COMMENT '0 no acepta contrato 1 acepta contrato',
  `prime` tinyint(4) DEFAULT NULL COMMENT '1-prime 0-no prime',
  `pais` int(3) DEFAULT 1 COMMENT 'id del pais donde se debe mostrar el comercio',
  `tipoTiendaId` int(11) DEFAULT NULL,
  `mezcla_servicios` int(11) DEFAULT NULL,
  `portal_origen` int(4) DEFAULT NULL,
  `id_identity` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  KEY `Propietario` (`Propietario`),
  KEY `Nombre` (`Nombre`),
  KEY `Autorizada` (`Autorizada`)
) ENGINE=InnoDB AUTO_INCREMENT=126526540 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tiendas_autocenter_sears`
--

DROP TABLE IF EXISTS `tiendas_autocenter_sears`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiendas_autocenter_sears` (
  `id_tienda_autocenter_sears` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_centro_automotriz` varchar(200) NOT NULL,
  `num_tienda_autocenter` int(11) NOT NULL,
  `numero_tienda_sears` int(11) NOT NULL,
  `nombre_tienda` varchar(200) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_tienda_autocenter_sears`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipos_guias`
--

DROP TABLE IF EXISTS `tipos_guias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_guias` (
  `id_guia` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `num_guia` varchar(50) NOT NULL,
  `tipo_guia` varchar(20) NOT NULL,
  `id_tienda` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `t1_envios` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_guia`),
  KEY `num_pedido` (`num_pedido`),
  KEY `num_guia` (`num_guia`),
  KEY `id_producto` (`id_producto`) USING BTREE,
  KEY `tipo_guia` (`tipo_guia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=764 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `access_token` varchar(2048) NOT NULL,
  `refresh_token` varchar(2048) NOT NULL,
  `access_token_expiry` bigint(20) NOT NULL DEFAULT 0,
  `refresh_token_expiry` bigint(20) NOT NULL DEFAULT 0,
  `scope` varchar(45) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokent1envio`
--

DROP TABLE IF EXISTS `tokent1envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokent1envio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` text NOT NULL,
  `expires_in` varchar(20) DEFAULT NULL,
  `date_expires_in` datetime DEFAULT NULL,
  `refresh_expires_in` varchar(20) DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `date_refresh_expires_in` datetime DEFAULT NULL,
  `token_type` varchar(20) DEFAULT NULL,
  `not_before_policy` varchar(20) DEFAULT NULL,
  `session_state` varchar(200) DEFAULT NULL,
  `scope` varchar(200) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaccion_pagobancos`
--

DROP TABLE IF EXISTS `transaccion_pagobancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion_pagobancos` (
  `datos` mediumtext DEFAULT NULL COMMENT 'almacena todos los campos de la respuesta del banco en formato json',
  `fecha` datetime DEFAULT NULL COMMENT 'fecha en que se recibio la respuesta del banco',
  `id_cliente` int(11) DEFAULT NULL COMMENT 'Id del cliente Sears',
  `tienda` int(11) DEFAULT NULL COMMENT 'Tienda qeu se realizo la transaccion',
  `banco` varchar(20) DEFAULT NULL COMMENT 'nombre del banco',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la tabla',
  `id_transaccion` varchar(50) DEFAULT '' COMMENT 'relacionada con id de la tabla tmp_salesaudit y id_transaccion de la tabla sales_pago_audit',
  PRIMARY KEY (`id`),
  KEY `id_transaccion` (`id_transaccion`) USING BTREE,
  KEY `id_cliente` (`id_cliente`) USING BTREE,
  KEY `fecha` (`fecha`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaccion_paypal_express`
--

DROP TABLE IF EXISTS `transaccion_paypal_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion_paypal_express` (
  `idtransaccion` int(11) NOT NULL AUTO_INCREMENT,
  `idpedido` int(11) NOT NULL,
  `notransaccion` varchar(45) NOT NULL,
  `estadotransaccion` varchar(45) NOT NULL,
  `pago` varchar(45) NOT NULL,
  `datos` text NOT NULL,
  `fechaalta` datetime NOT NULL,
  `estatus` int(11) DEFAULT NULL,
  `fechaactualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idtransaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaccion_paypalexpress_log`
--

DROP TABLE IF EXISTS `transaccion_paypalexpress_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion_paypalexpress_log` (
  `idtransaccionlog` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `numero_pedido` int(11) NOT NULL,
  `autorizacion_pp` varchar(45) DEFAULT '0',
  `datos` text NOT NULL,
  `fechaalta` datetime NOT NULL,
  `ack` varchar(45) NOT NULL,
  `codigo_pp` varchar(45) NOT NULL,
  `msj_corto_pp` text NOT NULL,
  `mjs_largo_pp` text NOT NULL,
  `msj_mostrado` text NOT NULL,
  PRIMARY KEY (`idtransaccionlog`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transacciones_netpay`
--

DROP TABLE IF EXISTS `transacciones_netpay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones_netpay` (
  `id_transaccion` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) DEFAULT NULL,
  `pedido_normalizado` varchar(20) DEFAULT NULL,
  `extra` mediumtext DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `tarjeta` varchar(20) DEFAULT NULL,
  `estado` tinyint(1) unsigned DEFAULT 0,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id_transaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transacciones_tarjeta`
--

DROP TABLE IF EXISTS `transacciones_tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones_tarjeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `numero_tarjeta` varchar(150) NOT NULL COMMENT 'Se deja la longitud de 150 para guardar cifrado el valor',
  `cvv` varchar(150) NOT NULL COMMENT 'Se deja la longitud de 150 para guardar cifrado el valor',
  `banco_emisor` varchar(50) NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `tipo_tarjeta` varchar(45) NOT NULL,
  `codigo_autorizacion` varchar(20) NOT NULL,
  `avs_nombre` varchar(50) NOT NULL,
  `avs_apellido1` varchar(50) NOT NULL,
  `avs_apellido2` varchar(50) NOT NULL,
  `avs_direccion` varchar(200) NOT NULL,
  `avs_colonia` varchar(80) NOT NULL,
  `avs_municipio` varchar(70) NOT NULL,
  `avs_ciudad` varchar(70) NOT NULL,
  `avs_estado` varchar(60) NOT NULL,
  `avs_codigo_postal` varchar(5) NOT NULL,
  `avs_pais` varchar(50) NOT NULL,
  `revision_cyber` tinyint(1) DEFAULT NULL,
  `respuesta_cyber` int(11) DEFAULT NULL,
  `transaccion_cyber` varchar(30) NOT NULL DEFAULT '',
  `pp_autorizacion_cyber` int(11) DEFAULT NULL,
  `usar_bin` tinyint(1) DEFAULT 0,
  `fecha_modificacion` datetime DEFAULT NULL,
  `codigo_referencia` varchar(45) NOT NULL DEFAULT '',
  `bin` int(11) DEFAULT NULL,
  `plan_pago` int(11) DEFAULT NULL,
  `secuencia` int(11) DEFAULT NULL,
  `id_promocion` int(11) DEFAULT NULL,
  `id_banco` int(11) DEFAULT NULL,
  `mensualidad` int(11) DEFAULT NULL,
  `ip_transaccion_cyber` varchar(16) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_trans_tarjeta_pedido` (`numero_pedido`),
  KEY `i_numtarjeta_tt` (`numero_tarjeta`),
  KEY `i_codautoriza_tt` (`codigo_autorizacion`),
  KEY `transacciones_tarjeta_ix` (`bin`),
  CONSTRAINT `fk_trans_tarjeta_pedido` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25160 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transferencias_historial`
--

DROP TABLE IF EXISTS `transferencias_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferencias_historial` (
  `id_histransf` int(11) NOT NULL AUTO_INCREMENT,
  `transferencia` varchar(15) DEFAULT NULL,
  `id_tienda` int(11) DEFAULT NULL,
  `num_pedido` int(11) DEFAULT NULL,
  `estatus` varchar(5) DEFAULT NULL,
  `fecha_archivo` date DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `relacion_pedido` int(11) DEFAULT NULL,
  `nombre_archivo` varchar(50) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` datetime DEFAULT NULL,
  `usuario_alta` int(11) NOT NULL,
  `usuario_modificacion` int(11) DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_histransf`),
  KEY `idx_relacionped` (`relacion_pedido`),
  KEY `idx_numpedidoth` (`num_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transferencias_tiendas`
--

DROP TABLE IF EXISTS `transferencias_tiendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferencias_tiendas` (
  `id_transferencia` int(11) NOT NULL AUTO_INCREMENT,
  `transferencia` varchar(15) NOT NULL,
  `division` varchar(10) DEFAULT NULL,
  `id_tienda` int(11) NOT NULL,
  `nombre_tienda` varchar(70) NOT NULL,
  `id_producto` varchar(10) NOT NULL,
  `nombre_producto` varchar(150) NOT NULL,
  `guia` varchar(15) DEFAULT NULL,
  `tipo_envio` varchar(50) DEFAULT NULL,
  `salescheck` varchar(15) DEFAULT NULL,
  `fecha_alta` datetime NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estatus` varchar(15) DEFAULT NULL,
  `num_pedido` int(11) NOT NULL,
  `fuente` varchar(20) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `estatus_p` tinyint(4) NOT NULL DEFAULT 0,
  `estatus_x` tinyint(4) NOT NULL DEFAULT 0,
  `estatus_b` tinyint(4) NOT NULL DEFAULT 0,
  `fecha_estatus_p` datetime DEFAULT NULL,
  `fecha_estatus_x` datetime DEFAULT NULL,
  `fecha_estatus_b` datetime DEFAULT NULL,
  `relacion_pedido` int(11) DEFAULT NULL,
  `estatus_s` tinyint(4) DEFAULT NULL,
  `fecha_estatus_s` datetime DEFAULT NULL,
  `embarcar_desde` int(11) DEFAULT NULL COMMENT '1: Desde Tienda\n2: Desde CDT',
  `estatus_c` tinyint(4) NOT NULL DEFAULT 0,
  `fecha_estatus_c` datetime DEFAULT NULL,
  `fecha_estatus_e` varchar(45) DEFAULT NULL,
  `estatus_e` varchar(45) DEFAULT NULL,
  `fecha_estatus_t` datetime DEFAULT NULL,
  `estatus_t` tinyint(4) DEFAULT NULL,
  `guia_generada` int(11) DEFAULT 0,
  `estatus_r` tinyint(4) DEFAULT NULL,
  `fecha_estatus_r` datetime DEFAULT NULL,
  `indicador_consolidacion` char(2) NOT NULL DEFAULT '',
  `guia_sears` int(11) NOT NULL DEFAULT 0,
  `comentario_sears` text NOT NULL,
  `estatus_bo` tinyint(4) DEFAULT 0,
  `fecha_estatus_bo` datetime DEFAULT '0000-00-00 00:00:00',
  `error_pickup` int(11) DEFAULT 0,
  `estatus_m` tinyint(4) NOT NULL DEFAULT 0,
  `fecha_estatus_m` datetime DEFAULT NULL,
  `estatus_i` tinyint(4) DEFAULT NULL,
  `fecha_estatus_i` datetime DEFAULT NULL,
  `estatus_d` tinyint(4) NOT NULL DEFAULT 0,
  `fecha_estatus_d` datetime DEFAULT NULL,
  `surtible` tinyint(1) NOT NULL DEFAULT 0,
  `kilometros` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_transferencia`),
  KEY `idx_idProducto` (`id_producto`),
  KEY `idx_NumPedido` (`num_pedido`),
  KEY `idx_relacionped` (`relacion_pedido`),
  KEY `fecha_registro` (`fecha_registro`),
  KEY `i_id_tienda` (`id_tienda`),
  KEY `i_tt_surtible` (`surtible`),
  KEY `i_tt_estatus` (`estatus`),
  KEY `i_tt_indicador` (`indicador_consolidacion`)
) ENGINE=InnoDB AUTO_INCREMENT=10794407 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('active','deleted') NOT NULL DEFAULT 'active',
  `api_token` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(90) NOT NULL COMMENT 'mail del usuario\n',
  `PASSWORD` blob DEFAULT NULL,
  `folio` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `contrasena` blob DEFAULT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `ap_paterno` varchar(45) DEFAULT NULL,
  `ap_materno` varchar(45) DEFAULT NULL,
  `dir` varchar(90) NOT NULL,
  `col` varchar(45) NOT NULL,
  `ciudad` int(11) NOT NULL,
  `edo` int(11) NOT NULL,
  `cp` varchar(5) DEFAULT NULL,
  `cel_sms` varchar(45) DEFAULT NULL,
  `email_contra` varchar(45) NOT NULL,
  `email_resp` varchar(60) DEFAULT NULL,
  `lada_contact` varchar(10) DEFAULT NULL,
  `tel_contact` varchar(10) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios_api`
--

DROP TABLE IF EXISTS `usuarios_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_api` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL COMMENT 'Api Token que se utilza para acceder a la api',
  `nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL COMMENT 'Nombre de la empresa o usuario que accede a la api',
  `correo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL COMMENT 'Correo de contacto del usuario',
  `app` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL COMMENT 'De que tipo de aplicativo consume el usuario',
  `activo` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'estatus del usuario',
  `origen` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL COMMENT 'Detalle de usuario o empresa que usa la api',
  `inicio` int(11) DEFAULT 0 COMMENT 'Aplica para usuarios que finquen pedidos, y es el numero de pedido inicial asignado al usuario y/o empresa',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5979 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webhook_logs`
--

DROP TABLE IF EXISTS `webhook_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_logs` (
  `id_webhook_logs` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `guia` int(11) NOT NULL,
  `id_mensajeria` int(11) NOT NULL,
  `request` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`request`)),
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_webhook_logs`),
  KEY `i_webhooklogs_pedido` (`numero_pedido`),
  KEY `i_webhooklogs_guia` (`guia`),
  KEY `i_webhooklogs_mensajeria` (`id_mensajeria`),
  CONSTRAINT `fk_webhook_logspedido` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`Num_pedido`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ws_partner`
--

DROP TABLE IF EXISTS `ws_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ws_partner` (
  `id_partner` int(11) NOT NULL AUTO_INCREMENT,
  `id_tienda` int(11) NOT NULL,
  `tipo_app` tinyint(4) NOT NULL,
  `estatus` char(1) NOT NULL,
  `usuario_alta` varchar(50) NOT NULL,
  `usuario_modif` varchar(50) DEFAULT NULL,
  `usuario_baja` varchar(50) DEFAULT NULL,
  `password_partner` blob DEFAULT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modif` datetime DEFAULT NULL,
  `fecha_baja` datetime DEFAULT NULL,
  PRIMARY KEY (`id_partner`),
  KEY `id_tienda` (`id_tienda`,`tipo_app`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'sanborns_store'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-06-29 11:47:44
