-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 02-10-2014 a las 01:47:16
-- Versión del servidor: 5.5.20
-- Versión de PHP: 5.3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdatos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE IF NOT EXISTS `acceso` (
  `id_acceso` int(11) NOT NULL,
  `id_accion` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_acceso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accion`
--

CREATE TABLE IF NOT EXISTS `accion` (
  `id_accion` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_accion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajuste_inv_articulo`
--

CREATE TABLE IF NOT EXISTS `ajuste_inv_articulo` (
  `id_movimiento` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_crea` date NOT NULL,
  `id_tipo_movimiento` int(11) NOT NULL,
  `factura_referencia` varchar(10) NOT NULL,
  `ubicacion_origen` int(11) NOT NULL,
  `ubicacion_destino` int(11) NOT NULL,
  `id_articulo` int(11) NOT NULL,
  PRIMARY KEY (`id_movimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajuste_inv_materia`
--

CREATE TABLE IF NOT EXISTS `ajuste_inv_materia` (
  `id_movimiento` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_crea` date NOT NULL,
  `id_tipo_movimiento` int(11) NOT NULL,
  `factura_referencia` varchar(10) NOT NULL,
  `ubicacion_origen` int(11) NOT NULL,
  `ubicacion_destino` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  PRIMARY KEY (`id_movimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_cat`
--

CREATE TABLE IF NOT EXISTS `articulo_cat` (
  `id_categoria` int(11) NOT NULL,
  `descripcion` varchar(25) NOT NULL,
  `estado` char(3) NOT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo_cat`
--

INSERT INTO `articulo_cat` (`id_categoria`, `descripcion`, `estado`, `url`) VALUES
(1, 'Cortinas', 'A', 'ver_cortinas.php'),
(2, 'Persianas', 'A', 'ver_persianas.php'),
(3, 'Pisos', 'A', 'ver_pisos.php'),
(4, 'Alfombras', 'A', 'ver_alfombras.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_exi`
--

CREATE TABLE IF NOT EXISTS `articulo_exi` (
  `id_articulo` int(11) NOT NULL,
  `cant_disponible` int(11) NOT NULL,
  `id_ubicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo_exi`
--

INSERT INTO `articulo_exi` (`id_articulo`, `cant_disponible`, `id_ubicacion`) VALUES
(1, 5, 1),
(1, 10, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_pre`
--

CREATE TABLE IF NOT EXISTS `articulo_pre` (
  `id_art_pre` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  `id_articulo` int(11) NOT NULL,
  PRIMARY KEY (`id_art_pre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo_pre`
--

INSERT INTO `articulo_pre` (`id_art_pre`, `precio`, `fecha_desde`, `fecha_hasta`, `id_articulo`) VALUES
(1, 3, '0000-00-00', '0000-00-00', 7),
(2, 6, '2014-09-18', '2014-09-30', 8),
(3, 5, '2014-09-17', '2014-09-26', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_ter`
--

CREATE TABLE IF NOT EXISTS `articulo_ter` (
  `id_articulo` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `min_stock` int(11) NOT NULL,
  `estado` char(3) NOT NULL,
  `fecha_crea` datetime NOT NULL,
  `cant_per_unit` int(11) NOT NULL,
  `disponible_web` char(2) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo_ter`
--

INSERT INTO `articulo_ter` (`id_articulo`, `descripcion`, `min_stock`, `estado`, `fecha_crea`, `cant_per_unit`, `disponible_web`, `id_categoria`, `imagen`) VALUES
(1, 'Articulo 1', 5, 'A', '2014-09-16 00:00:00', 9, 'SI', 1, 'css/image/1.jpg'),
(2, 'Articulo 2', 5, 'A', '2014-09-16 00:00:00', 10, 'SI', 1, 'css/image/2.jpg'),
(3, 'Articulo 3', 3, 'A', '2014-09-16 00:00:00', 6, 'SI', 3, 'css/image/3.jpg'),
(4, 'Articulo 4', 5, 'A', '2014-09-16 00:00:00', 10, 'NO', 1, 'css/image/4.jpg'),
(5, 'Articulo 5', 0, 'A', '2014-09-17 23:51:56', 4, 'SI', 4, 'css/image/5.jpg'),
(6, 'Articulo 6', 0, 'A', '2014-09-18 00:11:50', 3, 'SI', 4, 'css/image/6.jpg'),
(7, 'Articulo 7', 0, 'A', '2014-09-18 18:25:32', 2, 'SI', 1, 'css/image/7.jpg'),
(8, 'Articulo 8', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 2, 'css/image/8.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_uni`
--

CREATE TABLE IF NOT EXISTS `articulo_uni` (
  `id_uniart` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `estado` char(3) NOT NULL,
  PRIMARY KEY (`id_uniart`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo_uni`
--

INSERT INTO `articulo_uni` (`id_uniart`, `descripcion`, `estado`) VALUES
(1, 'Metros', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE IF NOT EXISTS `bodega` (
  `id_bodega` int(11) NOT NULL,
  `descripcion` varchar(25) NOT NULL,
  `estado` char(3) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `usuario_crea` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_bodega`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bodega`
--

INSERT INTO `bodega` (`id_bodega`, `descripcion`, `estado`, `id_sucursal`, `fecha_creacion`, `usuario_crea`) VALUES
(1, 'Bodega Central', 'A', 1, '2014-09-19', 'admin'),
(2, 'Bodega Secundaria', 'A', 2, '2014-09-19', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canal`
--

CREATE TABLE IF NOT EXISTS `canal` (
  `id_canal` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_canal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `canal`
--

INSERT INTO `canal` (`id_canal`, `descripcion`) VALUES
(1, 'No Disponible'),
(2, 'Internet'),
(3, 'Telefono'),
(4, 'Local');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `id_cargo` int(25) NOT NULL,
  `valor` varchar(10) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `valor`) VALUES
(1, 'Administra'),
(2, 'Supervisor'),
(3, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE IF NOT EXISTS `cita` (
  `id_cita` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_programada` datetime DEFAULT NULL,
  `hora` timestamp NULL DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido` varchar(64) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `id_canal` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `comentario` varchar(250) DEFAULT NULL,
  `id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`id_cita`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`id_cita`, `fecha_creacion`, `fecha_programada`, `hora`, `nombre`, `apellido`, `telefono`, `direccion`, `email`, `id_canal`, `id_estado`, `comentario`, `id_empleado`) VALUES
(1, '2014-08-27 18:29:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'usuario1', 'usuarioap', 's', 's', 's@s.com', 1, 1, 'd', 0),
(2, '2014-09-03 00:00:00', NULL, '2014-09-03 20:27:19', 'Rodrigo', 'Amaya', '22120543', 'Citibank', 'rodrigo.amaya@citi.com', 1, 1, 'Cortinas Bonitas', 0),
(3, '2014-09-03 00:00:00', NULL, '2014-09-03 20:29:45', 'William', 'Linarez', '21251413', 'Pinares', 'william.linarez@citi.com', 1, 1, 'Cortinas Blancas', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_estado`
--

CREATE TABLE IF NOT EXISTS `cita_estado` (
  `id_citaest` int(11) NOT NULL,
  `valor` varchar(25) NOT NULL,
  PRIMARY KEY (`id_citaest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cita_estado`
--

INSERT INTO `cita_estado` (`id_citaest`, `valor`) VALUES
(1, 'Pendiente'),
(2, 'En Revision');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `id_ciudad` int(11) NOT NULL,
  `valor` varchar(25) NOT NULL,
  `estado` char(3) NOT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `valor`, `estado`) VALUES
(0, 'Santa Tecla', 'A'),
(1, 'San Salvador', 'A'),
(2, 'Santa Tecla', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` varchar(16) NOT NULL,
  `primer_nombre` varchar(32) NOT NULL,
  `segundo_nombre` varchar(32) NOT NULL,
  `primer_apellido` varchar(32) NOT NULL,
  `segundo_apellido` varchar(32) NOT NULL,
  `direccion` varchar(32) NOT NULL,
  `telefono` varchar(16) NOT NULL,
  `dir_ins` varchar(32) NOT NULL,
  `nit` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `direccion`, `telefono`, `dir_ins`, `nit`) VALUES
('100411', 'Pedro', 'Miguel', 'Sanchez', 'Diaz', 'Sabana', '456468', 'Citi', '654226');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `id_compra` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `sumas` decimal(10,0) NOT NULL,
  `impuesto` float NOT NULL,
  `estado` char(3) NOT NULL,
  `factura` varchar(10) NOT NULL,
  `id_solicitud_material` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_forma_pago` int(11) NOT NULL,
  PRIMARY KEY (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_detalle`
--

CREATE TABLE IF NOT EXISTS `compra_detalle` (
  `id_compra_detalle` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  PRIMARY KEY (`id_compra_detalle`),
  UNIQUE KEY `id_compra` (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_gasto`
--

CREATE TABLE IF NOT EXISTS `compra_gasto` (
  `id_gasto` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_gasto` date NOT NULL,
  `id_compra` int(11) NOT NULL,
  PRIMARY KEY (`id_gasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE IF NOT EXISTS `cotizacion` (
  `id_cotizacion` int(11) NOT NULL,
  `resumen` date NOT NULL,
  `fecha_creacion` date NOT NULL,
  `monto_descuento` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `sub_total` decimal(10,0) NOT NULL,
  `porcentaje_anticipo` int(11) NOT NULL,
  `dia_validez` int(11) NOT NULL,
  `porcentaje_descuento` int(11) NOT NULL,
  `id_tiempo_entrega` date NOT NULL,
  `id_cotizacion_estado` int(11) NOT NULL,
  `id_cita` int(11) NOT NULL,
  PRIMARY KEY (`id_cotizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_detalle`
--

CREATE TABLE IF NOT EXISTS `cotizacion_detalle` (
  `id_cotizacion_detalle` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `alto` float NOT NULL,
  `ancho` float NOT NULL,
  `largo` float NOT NULL,
  `area` float NOT NULL,
  `volulmen` float NOT NULL,
  `id_articulo` int(11) NOT NULL,
  PRIMARY KEY (`id_cotizacion_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_estado`
--

CREATE TABLE IF NOT EXISTS `cotizacion_estado` (
  `id_estado` int(11) NOT NULL,
  `descripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `codigo_emp` varchar(9) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `codigo_emp` (`codigo_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellido`, `telefono`, `fecha_creacion`, `id_cargo`, `id_usuario`, `codigo_emp`) VALUES
(1, 'Pedro', 'Sanchez', '76386841', '2014-09-03 00:00:00', 1, 1, 'SD100411'),
(2, 'Daysi', 'Najera', '61425952', '2014-09-03 00:00:00', 3, 2, 'nm100312'),
(3, 'Jorge', 'Luna', '22151684', '2014-09-03 00:00:00', 2, 3, 'JL101010');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `id_factura` int(11) NOT NULL,
  `fecha_factura` date NOT NULL,
  `fecha_creacion` date NOT NULL,
  `direccion_factura` varchar(50) NOT NULL,
  `direccion_instalacion` varchar(50) NOT NULL,
  `nit` varchar(25) NOT NULL,
  `ncr` varchar(25) NOT NULL,
  `giro` varchar(25) NOT NULL,
  `sub_total` decimal(10,0) NOT NULL,
  `descuento` int(11) NOT NULL,
  `monto_descuento` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `fa_estado` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_tipo_doc` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `id_forma_pago` int(11) NOT NULL,
  PRIMARY KEY (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_detalle`
--

CREATE TABLE IF NOT EXISTS `factura_detalle` (
  `id_detalle_factura` int(11) NOT NULL,
  `medidas` varchar(10) NOT NULL,
  `sentido` varchar(10) NOT NULL,
  `cubres` varchar(10) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `id_factura` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_estado`
--

CREATE TABLE IF NOT EXISTS `factura_estado` (
  `id_estado` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE IF NOT EXISTS `forma_pago` (
  `id_forma_pago` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instalacion`
--

CREATE TABLE IF NOT EXISTS `instalacion` (
  `id_instalacion` int(11) NOT NULL,
  `estado` char(3) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_instalacion` date NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`id_instalacion`),
  UNIQUE KEY `id_factura` (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_usuario`
--

CREATE TABLE IF NOT EXISTS `log_usuario` (
  `id_usuario_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(64) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `hora_ingreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hora_fin` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_usuario_log`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Volcado de datos para la tabla `log_usuario`
--

INSERT INTO `log_usuario` (`id_usuario_log`, `id_usuario`, `usuario`, `fecha_ingreso`, `hora_ingreso`, `hora_fin`) VALUES
(1, 8, 'admin7', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 9, 'admin8', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 11, 'admin9', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 1, 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1, 'admin', '0000-00-00 00:00:00', '2014-08-27 01:48:14', '2014-08-27 01:48:14'),
(8, 1, 'admin', '2014-08-26 00:00:00', '2014-08-27 01:50:19', '2014-08-27 01:50:19'),
(9, 1, 'admin', '0000-00-00 00:00:00', '2014-08-27 03:57:05', '2014-08-27 03:57:05'),
(10, 1, 'admin', '2014-08-26 00:00:00', '2014-08-27 03:58:48', '2014-08-27 03:58:48'),
(11, 2, 'admin2', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 1, '', '2014-08-27 00:00:00', '2014-08-28 00:37:03', '2014-08-28 00:37:03'),
(13, 1, 'admin', '2014-08-27 00:00:00', '2014-08-28 00:37:38', '2014-08-28 00:37:38'),
(14, 1, 'admin', '2014-08-28 00:00:00', '2014-08-28 06:48:36', '2014-08-28 06:48:36'),
(15, 1, 'admin', '2014-08-28 00:00:00', '2014-08-28 07:07:50', '2014-08-28 07:07:50'),
(16, 1, 'admin', '2014-08-28 00:00:00', '2014-08-28 07:08:24', '2014-08-28 07:08:24'),
(17, 1, 'admin', '2014-08-28 00:00:00', '2014-08-28 07:27:29', '2014-08-28 07:27:29'),
(18, 1, 'admin', '2014-08-28 00:00:00', '2014-08-28 07:27:35', '2014-08-28 07:27:35'),
(19, 1, 'admin', '2014-09-02 00:00:00', '2014-09-03 04:49:45', '2014-09-03 04:49:45'),
(20, 1, 'admin', '2014-09-02 00:00:00', '2014-09-03 04:50:06', '2014-09-03 04:50:06'),
(21, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:00:12', '2014-10-02 07:00:12'),
(22, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:00:59', '2014-10-02 07:00:59'),
(23, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:03:00', '2014-10-02 07:03:00'),
(24, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:08:07', '2014-10-02 07:08:07'),
(25, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:11:43', '2014-10-02 07:11:43'),
(26, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:12:16', '2014-10-02 07:12:16'),
(27, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:12:56', '2014-10-02 07:12:56'),
(28, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:13:41', '2014-10-02 07:13:41'),
(29, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:22:42', '2014-10-02 07:22:42'),
(30, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:23:20', '2014-10-02 07:23:20'),
(31, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:23:56', '2014-10-02 07:23:56'),
(32, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:25:07', '2014-10-02 07:25:07'),
(33, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:34:38', '2014-10-02 07:34:38'),
(34, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:43:07', '2014-10-02 07:43:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_exi`
--

CREATE TABLE IF NOT EXISTS `materia_exi` (
  `id_ubicacion` int(11) NOT NULL,
  `cant_disponible` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_prima`
--

CREATE TABLE IF NOT EXISTS `materia_prima` (
  `id_materia` int(11) NOT NULL,
  `descripcion` varchar(25) NOT NULL,
  `min_stock` int(11) NOT NULL,
  `max_stock` int(11) NOT NULL,
  `estado` char(3) NOT NULL,
  `cant_per_unit` int(11) NOT NULL,
  `id_artunidad` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materia_prima`
--

INSERT INTO `materia_prima` (`id_materia`, `descripcion`, `min_stock`, `max_stock`, `estado`, `cant_per_unit`, `id_artunidad`, `fecha_creacion`) VALUES
(1, 'Material 1', 5, 25, 'A', 15, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_prima_utilizada`
--

CREATE TABLE IF NOT EXISTS `materia_prima_utilizada` (
  `id_orden_detalle` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_detalle`
--

CREATE TABLE IF NOT EXISTS `orden_detalle` (
  `id_orden_detalle` int(11) NOT NULL,
  `area` float NOT NULL,
  `total` decimal(11,0) NOT NULL,
  `rollo` float NOT NULL,
  `tipo` varchar(11) NOT NULL,
  `color` varchar(11) NOT NULL,
  `alto` float NOT NULL,
  `ancho` float NOT NULL,
  `largo` float NOT NULL,
  `volumen` float NOT NULL,
  `cantidad` float NOT NULL,
  `id_orden` int(11) NOT NULL,
  `id_articulo` int(11) NOT NULL,
  PRIMARY KEY (`id_orden_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_tipo_trabajo`
--

CREATE TABLE IF NOT EXISTS `orden_tipo_trabajo` (
  `id_tipo_orden` int(11) NOT NULL,
  `descripcion` varchar(25) NOT NULL,
  `estado` char(3) NOT NULL,
  PRIMARY KEY (`id_tipo_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_trabajo`
--

CREATE TABLE IF NOT EXISTS `orden_trabajo` (
  `id_orden` int(11) NOT NULL,
  `fecha_orden` date NOT NULL,
  `id_trabajo_tipo` int(11) NOT NULL,
  `materiales_adicionales` varchar(50) NOT NULL,
  `observaciones` varchar(50) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `id_trabajo_estado` int(11) NOT NULL,
  `id_tipo_cortina` int(11) NOT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `id_cotizacion` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_orden`),
  UNIQUE KEY `id_cotizacion` (`id_cotizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_trabajo_estado`
--

CREATE TABLE IF NOT EXISTS `orden_trabajo_estado` (
  `id_estado` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `id_pais` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `estado` char(3) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `estado` char(3) NOT NULL,
  `contacto` varchar(20) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE IF NOT EXISTS `provincia` (
  `id_provincia` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `estado` char(3) NOT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibo`
--

CREATE TABLE IF NOT EXISTS `recibo` (
  `id_recibo` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_recibo` date NOT NULL,
  `id_cotizacion` int(11) NOT NULL,
  `monto` decimal(10,0) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_recibo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_sistema`
--

CREATE TABLE IF NOT EXISTS `rol_sistema` (
  `id_rol` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol_sistema`
--

INSERT INTO `rol_sistema` (`id_rol`, `descripcion`, `url`) VALUES
(1, 'Administrador', 'index_admin.php'),
(2, 'Supervisor', 'index_supervisor.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seqnos`
--

CREATE TABLE IF NOT EXISTS `seqnos` (
  `bdatos` varchar(30) NOT NULL,
  `tabla` varchar(30) NOT NULL,
  `siguiente` int(11) NOT NULL,
  `pkey` varchar(30) NOT NULL,
  `id_seqnos` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_seqnos`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `seqnos`
--

INSERT INTO `seqnos` (`bdatos`, `tabla`, `siguiente`, `pkey`, `id_seqnos`) VALUES
('bdatos', 'usuario', 3, 'id_usuario', 1),
('bdatos', 'cita', 2, 'id_cita', 2),
('bdatos', 'canal', 1, 'id_canal', 3),
('bdatos', 'cita_estado', 3, 'id_citaest', 4),
('bdatos', 'cargo', 4, 'id_cargo', 5),
('bdatos', 'empleado', 3, 'id_empleado', 6),
('bdatos', 'sucursal', 1, 'id_sucursal', 7),
('bdatos', 'articulo_ter', 9, 'id_articulo', 8),
('bdatos', 'articulo_pre', 3, 'id_art_pre', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_material`
--

CREATE TABLE IF NOT EXISTS `solicitud_material` (
  `id_solicitud_material` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `id_estado` int(11) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `solicitado_por` varchar(20) NOT NULL,
  `autorizado_por` varchar(20) DEFAULT NULL,
  `preparado_por` varchar(20) DEFAULT NULL,
  `despachado_por` varchar(20) DEFAULT NULL,
  `recibido_por` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_solicitud_material`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_material_detalle`
--

CREATE TABLE IF NOT EXISTS `solicitud_material_detalle` (
  `id_solicitud_material_d` int(11) NOT NULL,
  `regalia` int(11) NOT NULL,
  `muestra` int(11) NOT NULL,
  `ventas` int(11) NOT NULL,
  `reparacion` int(11) NOT NULL,
  `destruccion` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `id_solicitud_material` int(11) NOT NULL,
  `id_materia_prima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE IF NOT EXISTS `sucursal` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `estado` char(3) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_ciudad` int(11) NOT NULL,
  `ruta_imagen` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_crea` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `descripcion`, `direccion`, `nit`, `estado`, `telefono`, `email`, `id_ciudad`, `ruta_imagen`, `fecha_creacion`, `usuario_crea`) VALUES
(1, 'Metrocentro', 'MetroCentro', '34554', 'A', '224684', 'sd@dfsdf.com', 1, NULL, '2014-09-08 00:00:00', 'admin'),
(2, 'La Gran Via', 'La Gran Via', '5415616515', 'A', '2224442', 'lgv@alfinte.com', 2, NULL, '2014-09-08 00:00:00', 'admin'),
(3, 'Plaza Merliot', 'Plaza Merliot', '234324', 'A', '345234', 'sdfsdf', 1, '', '2014-09-08 15:03:21', 'sdfasf'),
(4, 'Plaza Mundo', 'Plaza Mundo', 'd43534', 'a', '452345', '54gfdgsd', 1, '', '2014-09-08 15:05:37', ''),
(5, 'Unicentro', 'Unicentro', '123', 'a', '234324', 'sfsdf', 1, '', '2014-09-08 15:06:59', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiempo_entrega`
--

CREATE TABLE IF NOT EXISTS `tiempo_entrega` (
  `id_tiempo_entrega` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tiempo_entrega`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_orden_cortina`
--

CREATE TABLE IF NOT EXISTS `tipo_orden_cortina` (
  `id_orden_cortina` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_orden_cortina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado_inv_articulo`
--

CREATE TABLE IF NOT EXISTS `traslado_inv_articulo` (
  `id_movimiento` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_crea` date NOT NULL,
  `id_tipo_movimiento` int(11) NOT NULL,
  `factura_referencia` varchar(10) NOT NULL,
  `ubicacion_origen` int(11) NOT NULL,
  `ubicacion_destino` int(11) NOT NULL,
  `id_articulo` int(11) NOT NULL,
  PRIMARY KEY (`id_movimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado_inv_materia`
--

CREATE TABLE IF NOT EXISTS `traslado_inv_materia` (
  `id_movimiento` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_crea` date NOT NULL,
  `id_tipo_movimiento` int(11) NOT NULL,
  `factura_referencia` varchar(10) NOT NULL,
  `ubicacion_origen` int(11) NOT NULL,
  `ubicacion_destino` int(11) NOT NULL,
  `id_articulo` int(11) NOT NULL,
  PRIMARY KEY (`id_movimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE IF NOT EXISTS `ubicacion` (
  `id_ubicacion` int(11) NOT NULL,
  `descripcion` varchar(15) NOT NULL,
  `estado` char(3) NOT NULL,
  `id_bodega` int(11) NOT NULL,
  PRIMARY KEY (`id_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id_ubicacion`, `descripcion`, `estado`, `id_bodega`) VALUES
(1, 'C01', 'A', 1),
(2, 'C02', 'A', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `servicio` int(11) NOT NULL DEFAULT '1',
  `usuario` varchar(10) NOT NULL,
  `clave_temp` varchar(64) NOT NULL,
  `clave_def` varchar(64) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `fecha_utl_pwd` datetime DEFAULT NULL,
  `descripcion` varchar(64) NOT NULL,
  `estado` char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A',
  `fecha_utl_ing` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `servicio`, `usuario`, `clave_temp`, `clave_def`, `fecha_registro`, `fecha_modificacion`, `fecha_utl_pwd`, `descripcion`, `estado`, `fecha_utl_ing`) VALUES
(1, 1, 'admin', 'admin', 'admin', '2014-08-27 18:28:53', '2014-08-27 18:28:53', '0000-00-00 00:00:00', 'admin', 'A', '0000-00-00 00:00:00'),
(2, 1, 'admin2', 'admin2', 'admin2', '2014-08-27 18:36:14', '2014-08-27 18:36:14', '0000-00-00 00:00:00', 'admin2', 'A', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE IF NOT EXISTS `usuario_rol` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_usuario_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
