-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2014 a las 06:31:35
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accion`
--

CREATE TABLE IF NOT EXISTS `accion` (
  `id_accion` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
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
  `id_articulo` int(11) NOT NULL
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
  `id_materia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_cat`
--

CREATE TABLE IF NOT EXISTS `articulo_cat` (
  `id_categoria` int(11) NOT NULL,
  `descripcion` varchar(25) NOT NULL,
  `estado` char(3) NOT NULL,
  `url` varchar(100) NOT NULL
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
`precio` decimal(10,2) NOT NULL,
`fecha_desde` date NOT NULL,
`fecha_hasta` date NOT NULL,
`id_articulo` int(11) NOT NULL,
`estado` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- 
-- Volcado de datos para la tabla `articulo_pre`
-- 
INSERT INTO `articulo_pre` (`id_art_pre`, `precio`, `fecha_desde`, `fecha_hasta`, `id_articulo`, `estado`) VALUES
(0, 6.00, '2014-10-20', '2014-11-30', 1, 'V'),
(1, 3.00, '2014-10-27', '2014-11-05', 1, 'V'),
(2, 6.00, '2014-09-18', '2014-09-30', 2, 'V'),
(3, 5.00, '2014-09-17', '2014-09-26', 3, 'A'),
(4, 3.45, '2014-11-15', '2014-11-30', 1, 'V'),
(5, 7.00, '2014-12-01', '2014-12-31', 1, 'A'),
(6, 5.00, '2014-11-01', '2014-11-02', 2, 'V'),
(7, 4.00, '2014-11-03', '2014-11-04', 2, 'V'),
(8, 10.00, '2014-11-05', '2014-11-06', 2, 'A');
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
  `id_precio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo_ter`
--

INSERT INTO `articulo_ter` (`id_articulo`, `descripcion`, `min_stock`, `estado`, `fecha_crea`, `cant_per_unit`, `disponible_web`, `id_categoria`, `imagen`, `id_precio`) VALUES
(1, 'Articulo 1', 5, 'A', '2014-09-16 00:00:00', 9, 'SI', 1, 'css/image/1.JPG', NULL),
(2, 'Articulo 2', 5, 'A', '2014-09-16 00:00:00', 10, 'SI', 1, 'css/image/2.JPG', NULL),
(3, 'Articulo 3', 3, 'A', '2014-09-16 00:00:00', 6, 'SI', 3, 'css/image/3.JPG', NULL),
(4, 'Articulo 4', 5, 'A', '2014-09-16 00:00:00', 10, 'NO', 1, 'css/image/4.JPG', NULL),
(5, 'Articulo 5', 0, 'A', '2014-09-17 23:51:56', 4, 'SI', 4, 'css/image/5.JPG', NULL),
(6, 'Articulo 6', 0, 'A', '2014-09-18 00:11:50', 3, 'SI', 4, 'css/image/6.JPG', NULL),
(7, 'Articulo 7', 0, 'A', '2014-09-18 18:25:32', 2, 'SI', 1, 'css/image/7.JPG', NULL),
(8, 'Articulo 8', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 2, 'css/image/8.JPG', NULL),
(9, 'Articulo 9', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 2, 'css/image/9.JPG', NULL),
(10, 'Articulo 10', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 2, 'css/image/10.JPG', NULL),
(11, 'Articulo 11', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 2, 'css/image/11.JPG', NULL),
(12, 'Articulo 12', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 2, 'css/image/12.JPG', NULL),
(13, 'Articulo 13', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 1, 'css/image/13.JPG', NULL),
(14, 'Articulo 14', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 1, 'css/image/14.JPG', NULL),
(15, 'Articulo 15', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 1, 'css/image/15.JPG', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_uni`
--

CREATE TABLE IF NOT EXISTS `articulo_uni` (
  `id_uniart` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `estado` char(3) NOT NULL
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
  `usuario_crea` varchar(15) DEFAULT NULL
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
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `canal`
--

INSERT INTO `canal` (`id_canal`, `descripcion`) VALUES
(1, 'Internet'),
(2, 'Telefono'),
(3, 'Local');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `id_cargo` int(25) NOT NULL,
  `valor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `valor`) VALUES
(1, 'Administra'),
(2, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE IF NOT EXISTS `cita` (
  `id_cita` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_programada` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido` varchar(64) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `id_canal` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `comentario` varchar(250) DEFAULT NULL,
  `id_empleado` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`id_cita`, `fecha_creacion`, `fecha_programada`, `hora`, `nombre`, `apellido`, `telefono`, `direccion`, `email`, `id_canal`, `id_estado`, `comentario`, `id_empleado`) VALUES
(1, '2014-08-27 18:29:50', '2014-11-19', '12:20:00', 'Raul', 'Lopez', 's', 'Callle las palmeras block F #45', 'raul.lopez@hotmail.com', 1, 2, 'd', 3),
(2, '2014-09-03 00:00:00', NULL, NULL, 'Rodrigo', 'Amaya', '22120543', 'Citibank', 'rodrigo.amaya@citi.com', 1, 1, 'Cortinas azules', 3),
(3, '2014-09-03 00:00:00', NULL, NULL, 'William', 'Linarez', '21251413', 'Pinares', 'william.linarez@citi.com', 1, 1, 'Cortinas Blancas', 4),
(4, '2014-10-18 07:38:00', '2014-11-12', '08:30:00', 'Ana', 'Garcia', '2267-0976', 'Resd.bosques de suiza pol. G #87', 'anagarcia10@yahoo.com', 1, 2, 'Solicito informacion sobre cortinas', 4),
(5, '2014-10-18 07:54:43', NULL, NULL, 'Jorge', 'Luna', '2256-8980', 'san salvador', 'tucorreo@gmail.com', 1, 1, 'prueba 2', 4),
(6, '2014-10-26 00:06:20', '2014-10-26', '10:30:00', 'karen', 'ramos', '23456732', 'mejicanos', 'aramos@hotmail.com', 1, 2, 'hola', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_estado`
--

CREATE TABLE IF NOT EXISTS `cita_estado` (
  `id_citaest` int(11) NOT NULL,
  `valor` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cita_estado`
--

INSERT INTO `cita_estado` (`id_citaest`, `valor`) VALUES
(1, 'Pendiente'),
(2, 'Confirmada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `id_ciudad` int(11) NOT NULL,
  `valor` varchar(25) NOT NULL,
  `estado` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `valor`, `estado`) VALUES
(1, 'Santa Tecla', 'A'),
(2, 'San Salvador', 'A'),
(3, 'Santa Tecla', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` varchar(16) NOT NULL,
  `primer_nombre` varchar(32) NOT NULL,
  `primer_apellido` varchar(32) NOT NULL,
  `direccion` varchar(32) NOT NULL,
  `telefono` varchar(16) NOT NULL,
  `nit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `primer_nombre`, `primer_apellido`, `direccion`, `telefono`, `nit`) VALUES
('100411', 'Pedro', 'Miguel', 'Sabana', '456468', '654226');

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
  `id_forma_pago` int(11) NOT NULL
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
  `id_compra` int(11) NOT NULL
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
  `id_compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE IF NOT EXISTS `cotizacion` (
  `id_cotizacion` int(11) NOT NULL,
  `resumen` text CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_creacion` date NOT NULL,
  `monto_descuento` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `porcentaje_anticipo` int(11) NOT NULL,
  `dia_validez` int(11) NOT NULL,
  `porcentaje_descuento` int(11) NOT NULL,
  `id_tiempo_entrega` int(11) NOT NULL,
  `id_cotizacion_estado` int(11) NOT NULL,
  `id_cita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_detalle`
--

CREATE TABLE IF NOT EXISTS `cotizacion_detalle` (
  `id_cotizacion_detalle` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `alto` float NOT NULL,
  `ancho` float NOT NULL,
  `largo` float NOT NULL,
  `area` float NOT NULL,
  `volulmen` float NOT NULL,
  `id_articulo` int(11) NOT NULL,
  `id_cotizacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_estado`
--

CREATE TABLE IF NOT EXISTS `cotizacion_estado` (
  `id_estado` int(11) NOT NULL,
  `descripcion` varchar(25) NOT NULL
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
  `codigo_emp` varchar(9) NOT NULL,
  `id_sucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellido`, `telefono`, `fecha_creacion`, `id_cargo`, `codigo_emp`, `id_sucursal`) VALUES
(1, 'Pedro', 'Sanchez', '76386841', '2014-09-03 00:00:00', 1, 'SD100411', 1),
(2, 'Daysi', 'Najera', '61425952', '2014-09-03 00:00:00', 2, 'nm100312', 2),
(3, 'Jorge', 'Luna', '22151684', '2014-09-03 00:00:00', 2, 'JL101010', 2),
(4, 'Ronan', 'Villafranco', '7809-6953', '2014-06-09 00:00:00', 2, 'RN1406091', 2);

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
  `id_forma_pago` int(11) NOT NULL
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
  `id_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_estado`
--

CREATE TABLE IF NOT EXISTS `factura_estado` (
  `id_estado` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE IF NOT EXISTS `forma_pago` (
  `id_forma_pago` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
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
  `id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_usuario`
--

CREATE TABLE IF NOT EXISTS `log_usuario` (
`id_usuario_log` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(64) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `hora_ingreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hora_fin` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=140 ;

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
(34, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 07:43:07', '2014-10-02 07:43:07'),
(35, 1, 'admin', '2014-10-03 00:00:00', '2014-10-03 23:28:47', '2014-10-03 23:28:47'),
(36, 1, 'admin', '2014-10-03 00:00:00', '2014-10-04 00:25:35', '2014-10-04 00:25:35'),
(37, 1, 'admin', '2014-10-03 00:00:00', '2014-10-04 01:10:29', '2014-10-04 01:10:29'),
(38, 1, 'admin', '2014-10-03 00:00:00', '2014-10-04 03:52:05', '2014-10-04 03:52:05'),
(39, 1, 'admin', '2014-10-14 00:00:00', '2014-10-14 08:49:00', '2014-10-14 08:49:00'),
(40, 3, 'ventas1', '2014-10-14 00:00:00', '2014-10-14 08:52:33', '2014-10-14 08:52:33'),
(41, 1, 'admin', '2014-10-14 00:00:00', '2014-10-14 08:58:09', '2014-10-14 08:58:09'),
(42, 4, 'superventa', '2014-10-14 00:00:00', '2014-10-14 09:21:01', '2014-10-14 09:21:01'),
(43, 4, 'superventa', '2014-10-14 00:00:00', '2014-10-14 09:25:15', '2014-10-14 09:25:15'),
(44, 4, 'superventa', '2014-10-14 00:00:00', '2014-10-14 09:29:01', '2014-10-14 09:29:01'),
(45, 1, 'admin', '2014-10-14 00:00:00', '2014-10-14 09:37:05', '2014-10-14 09:37:05'),
(46, 1, 'admin', '2014-10-14 00:00:00', '2014-10-14 09:37:35', '2014-10-14 09:37:35'),
(47, 4, 'superventa', '2014-10-14 00:00:00', '2014-10-14 09:49:05', '2014-10-14 09:49:05'),
(48, 1, 'admin', '2014-10-14 00:00:00', '2014-10-14 09:53:33', '2014-10-14 09:53:33'),
(49, 4, 'superventa', '2014-10-14 00:00:00', '2014-10-14 09:56:00', '2014-10-14 09:56:00'),
(50, 1, 'admin', '2014-10-14 00:00:00', '2014-10-14 09:58:15', '2014-10-14 09:58:15'),
(51, 4, 'superventa', '2014-10-14 00:00:00', '2014-10-14 10:26:27', '2014-10-14 10:26:27'),
(52, 4, 'superventa', '2014-10-14 00:00:00', '2014-10-14 11:31:15', '2014-10-14 11:31:15'),
(53, 4, 'superventa', '2014-10-14 00:00:00', '2014-10-14 11:31:38', '2014-10-14 11:31:38'),
(54, 3, 'ventas1', '2014-10-14 00:00:00', '2014-10-14 12:43:31', '2014-10-14 12:43:31'),
(55, 4, 'superventa', '2014-10-14 00:00:00', '2014-10-14 12:44:20', '2014-10-14 12:44:20'),
(56, 4, 'superventa', '2014-10-15 00:00:00', '2014-10-15 13:00:52', '2014-10-15 13:00:52'),
(57, 1, 'admin', '2014-10-15 00:00:00', '2014-10-15 13:03:26', '2014-10-15 13:03:26'),
(58, 4, 'superventa', '2014-10-15 00:00:00', '2014-10-15 13:03:45', '2014-10-15 13:03:45'),
(59, 4, 'superventa', '2014-10-15 00:00:00', '2014-10-15 13:05:28', '2014-10-15 13:05:28'),
(60, 4, 'superventa', '2014-10-15 00:00:00', '2014-10-15 13:18:17', '2014-10-15 13:18:17'),
(61, 4, 'superventa', '2014-10-15 00:00:00', '2014-10-15 14:03:27', '2014-10-15 14:03:27'),
(62, 3, 'ventas1', '2014-10-15 00:00:00', '2014-10-15 14:09:17', '2014-10-15 14:09:17'),
(63, 4, 'superventa', '2014-10-15 00:00:00', '2014-10-15 14:44:24', '2014-10-15 14:44:24'),
(64, 3, 'ventas1', '2014-10-15 00:00:00', '2014-10-15 16:15:27', '2014-10-15 16:15:27'),
(65, 3, 'ventas1', '2014-10-15 00:00:00', '2014-10-15 16:28:45', '2014-10-15 16:28:45'),
(66, 1, 'admin', '2014-10-16 00:00:00', '2014-10-16 12:30:31', '2014-10-16 12:30:31'),
(67, 4, 'superventa', '2014-10-16 00:00:00', '2014-10-16 12:31:38', '2014-10-16 12:31:38'),
(68, 3, 'ventas1', '2014-10-16 00:00:00', '2014-10-16 12:33:42', '2014-10-16 12:33:42'),
(69, 4, 'superventa', '2014-10-16 00:00:00', '2014-10-16 15:44:21', '2014-10-16 15:44:21'),
(70, 3, 'ventas1', '2014-10-16 00:00:00', '2014-10-16 15:59:11', '2014-10-16 15:59:11'),
(71, 4, 'superventa', '2014-10-16 00:00:00', '2014-10-16 16:13:13', '2014-10-16 16:13:13'),
(72, 3, 'ventas1', '2014-10-16 00:00:00', '2014-10-16 16:14:02', '2014-10-16 16:14:02'),
(73, 3, 'ventas1', '2014-10-17 00:00:00', '2014-10-17 13:53:54', '2014-10-17 13:53:54'),
(74, 4, 'superventa', '2014-10-17 00:00:00', '2014-10-17 14:11:42', '2014-10-17 14:11:42'),
(75, 3, 'ventas1', '2014-10-17 00:00:00', '2014-10-17 14:34:12', '2014-10-17 14:34:12'),
(76, 3, 'ventas1', '2014-10-17 00:00:00', '2014-10-17 15:24:11', '2014-10-17 15:24:11'),
(77, 4, 'superventa', '2014-10-17 00:00:00', '2014-10-17 16:19:25', '2014-10-17 16:19:25'),
(78, 3, 'ventas1', '2014-10-17 00:00:00', '2014-10-17 16:39:56', '2014-10-17 16:39:56'),
(79, 4, 'superventa', '2014-10-18 00:00:00', '2014-10-18 13:27:27', '2014-10-18 13:27:27'),
(80, 3, 'ventas1', '2014-10-18 00:00:00', '2014-10-18 13:33:10', '2014-10-18 13:33:10'),
(81, 4, 'superventa', '2014-10-18 00:00:00', '2014-10-18 13:39:02', '2014-10-18 13:39:02'),
(82, 4, 'superventa', '2014-10-18 00:00:00', '2014-10-18 13:49:52', '2014-10-18 13:49:52'),
(83, 3, 'ventas1', '2014-10-18 00:00:00', '2014-10-18 13:50:54', '2014-10-18 13:50:54'),
(84, 4, 'superventa', '2014-10-18 00:00:00', '2014-10-18 14:02:24', '2014-10-18 14:02:24'),
(85, 3, 'ventas1', '2014-10-18 00:00:00', '2014-10-18 14:10:23', '2014-10-18 14:10:23'),
(86, 3, 'ventas1', '2014-10-19 00:00:00', '2014-10-19 06:01:21', '2014-10-19 06:01:21'),
(87, 3, 'ventas1', '2014-10-19 00:00:00', '2014-10-19 22:30:14', '2014-10-19 22:30:14'),
(88, 3, 'ventas1', '2014-10-21 00:00:00', '2014-10-21 14:16:22', '2014-10-21 14:16:22'),
(89, 3, 'ventas1', '2014-10-21 00:00:00', '2014-10-21 15:38:29', '2014-10-21 15:38:29'),
(90, 3, 'ventas1', '2014-10-23 00:00:00', '2014-10-23 13:24:43', '2014-10-23 13:24:43'),
(91, 4, 'superventa', '2014-10-23 00:00:00', '2014-10-23 13:27:36', '2014-10-23 13:27:36'),
(92, 3, 'ventas1', '2014-10-23 00:00:00', '2014-10-23 13:34:15', '2014-10-23 13:34:15'),
(93, 3, 'ventas1', '2014-10-24 00:00:00', '2014-10-24 12:07:09', '2014-10-24 12:07:09'),
(94, 4, 'superventa', '2014-10-24 00:00:00', '2014-10-24 12:16:27', '2014-10-24 12:16:27'),
(95, 3, 'ventas1', '2014-10-24 00:00:00', '2014-10-24 13:05:16', '2014-10-24 13:05:16'),
(96, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-25 12:16:17', '2014-10-25 12:16:17'),
(97, 4, 'superventa', '2014-10-25 00:00:00', '2014-10-25 14:13:17', '2014-10-25 14:13:17'),
(98, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-25 14:25:23', '2014-10-25 14:25:23'),
(99, 4, 'superventa', '2014-10-25 00:00:00', '2014-10-25 14:36:10', '2014-10-25 14:36:10'),
(100, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-25 14:40:00', '2014-10-25 14:40:00'),
(101, 4, 'superventa', '2014-10-25 00:00:00', '2014-10-25 14:54:52', '2014-10-25 14:54:52'),
(102, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-25 14:55:19', '2014-10-25 14:55:19'),
(103, 4, 'superventa', '2014-10-25 00:00:00', '2014-10-25 15:01:22', '2014-10-25 15:01:22'),
(104, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-25 15:16:27', '2014-10-25 15:16:27'),
(105, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-25 15:17:14', '2014-10-25 15:17:14'),
(106, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-25 15:38:41', '2014-10-25 15:38:41'),
(107, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-26 00:28:14', '2014-10-26 00:28:14'),
(108, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-26 00:32:23', '2014-10-26 00:32:23'),
(109, 4, 'superventa', '2014-10-25 00:00:00', '2014-10-26 01:01:32', '2014-10-26 01:01:32'),
(110, 4, 'superventa', '2014-10-25 00:00:00', '2014-10-26 01:04:36', '2014-10-26 01:04:36'),
(111, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-26 01:07:10', '2014-10-26 01:07:10'),
(112, 4, 'superventa', '2014-10-25 00:00:00', '2014-10-26 01:12:50', '2014-10-26 01:12:50'),
(113, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-26 01:13:39', '2014-10-26 01:13:39'),
(114, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-26 01:14:42', '2014-10-26 01:14:42'),
(115, 4, 'superventa', '2014-10-25 00:00:00', '2014-10-26 01:20:10', '2014-10-26 01:20:10'),
(116, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-26 01:23:32', '2014-10-26 01:23:32'),
(117, 4, 'superventa', '2014-10-25 00:00:00', '2014-10-26 04:59:51', '2014-10-26 04:59:51'),
(118, 4, 'superventa', '2014-10-25 00:00:00', '2014-10-26 05:30:54', '2014-10-26 05:30:54'),
(119, 3, 'ventas1', '2014-10-25 00:00:00', '2014-10-26 05:35:51', '2014-10-26 05:35:51'),
(120, 4, 'superventa', '2014-10-25 00:00:00', '2014-10-26 05:48:11', '2014-10-26 05:48:11'),
(121, 3, 'ventas1', '2014-10-26 00:00:00', '2014-10-26 06:12:03', '2014-10-26 06:12:03'),
(122, 4, 'superventa', '2014-10-30 00:00:00', '2014-10-30 08:42:15', '2014-10-30 08:42:15'),
(123, 3, 'ventas1', '2014-10-30 00:00:00', '2014-10-30 09:22:03', '2014-10-30 09:22:03'),
(124, 4, 'superventa', '2014-10-30 00:00:00', '2014-10-30 13:34:31', '2014-10-30 13:34:31'),
(125, 3, 'ventas1', '2014-10-30 00:00:00', '2014-10-30 13:34:51', '2014-10-30 13:34:51'),
(126, 3, 'ventas1', '2014-11-01 00:00:00', '2014-11-02 00:05:05', '2014-11-02 00:05:05'),
(127, 3, 'ventas1', '2014-11-05 00:00:00', '2014-11-05 13:03:46', '2014-11-05 13:03:46'),
(128, 3, 'ventas1', '2014-11-11 00:00:00', '2014-11-11 10:44:22', '2014-11-11 10:44:22'),
(129, 4, 'ventas2', '2014-11-11 00:00:00', '2014-11-11 10:58:20', '2014-11-11 10:58:20'),
(130, 4, 'ventas2', '2014-11-11 00:00:00', '2014-11-11 11:00:48', '2014-11-11 11:00:48'),
(131, 3, 'ventas1', '2014-11-11 00:00:00', '2014-11-11 11:08:09', '2014-11-11 11:08:09'),
(132, 4, 'ventas2', '2014-11-11 00:00:00', '2014-11-11 11:43:53', '2014-11-11 11:43:53'),
(133, 3, 'ventas1', '2014-11-11 00:00:00', '2014-11-11 11:46:27', '2014-11-11 11:46:27'),
(134, 4, 'ventas2', '2014-11-13 00:00:00', '2014-11-13 12:50:16', '2014-11-13 12:50:16'),
(135, 3, 'ventas1', '2014-11-17 00:00:00', '2014-11-17 11:24:07', '2014-11-17 11:24:07'),
(136, 3, 'ventas1', '2014-11-19 00:00:00', '2014-11-19 12:34:13', '2014-11-19 12:34:13'),
(137, 3, 'ventas1', '2014-11-19 00:00:00', '2014-11-19 13:11:08', '2014-11-19 13:11:08'),
(138, 3, 'ventas1', '2014-11-20 00:00:00', '2014-11-20 10:53:15', '2014-11-20 10:53:15'),
(139, 3, 'ventas1', '2014-11-20 00:00:00', '2014-11-20 11:50:17', '2014-11-20 11:50:17');

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
  `fecha_creacion` datetime NOT NULL
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
  `id_articulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_tipo_trabajo`
--

CREATE TABLE IF NOT EXISTS `orden_tipo_trabajo` (
  `id_tipo_orden` int(11) NOT NULL,
  `descripcion` varchar(25) NOT NULL,
  `estado` char(3) NOT NULL
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
  `id_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_trabajo_estado`
--

CREATE TABLE IF NOT EXISTS `orden_trabajo_estado` (
  `id_estado` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `id_pais` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `estado` char(3) NOT NULL
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
  `id_ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE IF NOT EXISTS `provincia` (
  `id_provincia` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `estado` char(3) NOT NULL
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
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_sistema`
--

CREATE TABLE IF NOT EXISTS `rol_sistema` (
  `id_rol` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL
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
`id_seqnos` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `seqnos`
--

INSERT INTO `seqnos` (`bdatos`, `tabla`, `siguiente`, `pkey`, `id_seqnos`) VALUES
('bdatos', 'usuario', 3, 'id_usuario', 1),
('bdatos', 'cita', 8, 'id_cita', 2),
('bdatos', 'canal', 1, 'id_canal', 3),
('bdatos', 'cita_estado', 3, 'id_citaest', 4),
('bdatos', 'cargo', 4, 'id_cargo', 5),
('bdatos', 'empleado', 3, 'id_empleado', 6),
('bdatos', 'sucursal', 1, 'id_sucursal', 7),
('bdatos', 'articulo_ter', 9, 'id_articulo', 8),
('bdatos', 'articulo_pre', 3, 'id_art_pre', 9),
('bdatos', 'cliente', 8, 'id_cliente', 10),
('bdatos', 'cotizacion_detalle', 6, 'id_cotizacion_detalle', 11),
('bdatos', 'cotizacion', 7, 'id_cotizacion', 12),
('bdatos', 'detalle_traslado', 1, 'id_detalle', 13),
('bdatos', 'traslado_inv_articulo', 1, 'id_movimiento', 14);

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
  `recibido_por` varchar(20) DEFAULT NULL
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
`id_sucursal` int(11) NOT NULL,
  `descripcion` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `estado` char(3) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_ciudad` int(11) NOT NULL,
  `ruta_imagen` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_crea` varchar(10) DEFAULT NULL
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
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_orden_cortina`
--

CREATE TABLE IF NOT EXISTS `tipo_orden_cortina` (
  `id_orden_cortina` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
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
  `id_articulo` int(11) NOT NULL
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
  `id_articulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE IF NOT EXISTS `ubicacion` (
  `id_ubicacion` int(11) NOT NULL,
  `descripcion` varchar(15) NOT NULL,
  `estado` char(3) NOT NULL,
  `id_bodega` int(11) NOT NULL
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
  `id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `servicio`, `usuario`, `clave_temp`, `clave_def`, `fecha_registro`, `fecha_modificacion`, `fecha_utl_pwd`, `descripcion`, `estado`, `fecha_utl_ing`, `id_empleado`) VALUES
(1, 1, 'admin', 'admin', 'admin', '2014-08-27 18:28:53', '2014-08-27 18:28:53', '0000-00-00 00:00:00', 'admin', 'A', '0000-00-00 00:00:00', 1),
(2, 1, 'admin2', 'admin2', 'admin2', '2014-08-27 18:36:14', '2014-08-27 18:36:14', '0000-00-00 00:00:00', 'admin2', 'A', '0000-00-00 00:00:00', 1),
(3, 1, 'ventas1', 'ventas1', 'ventas1', '2014-10-01 00:00:00', '2014-10-01 00:00:00', '2014-10-01 00:00:00', 'Vendedor 1', 'A', '2014-10-01 00:00:00', 3),
(4, 1, 'ventas2', 'ventas2', 'ventas2', '2014-07-02 00:00:00', '2014-10-01 00:00:00', '2014-04-01 00:00:00', 'Vendedor', 'A', NULL, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE IF NOT EXISTS `usuario_rol` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_usuario_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
 ADD PRIMARY KEY (`id_acceso`);

--
-- Indices de la tabla `accion`
--
ALTER TABLE `accion`
 ADD PRIMARY KEY (`id_accion`);

--
-- Indices de la tabla `ajuste_inv_articulo`
--
ALTER TABLE `ajuste_inv_articulo`
 ADD PRIMARY KEY (`id_movimiento`);

--
-- Indices de la tabla `ajuste_inv_materia`
--
ALTER TABLE `ajuste_inv_materia`
 ADD PRIMARY KEY (`id_movimiento`);

--
-- Indices de la tabla `articulo_cat`
--
ALTER TABLE `articulo_cat`
 ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `articulo_pre`
--
ALTER TABLE `articulo_pre`
 ADD PRIMARY KEY (`id_art_pre`);

--
-- Indices de la tabla `articulo_ter`
--
ALTER TABLE `articulo_ter`
 ADD PRIMARY KEY (`id_articulo`);

--
-- Indices de la tabla `articulo_uni`
--
ALTER TABLE `articulo_uni`
 ADD PRIMARY KEY (`id_uniart`);

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
 ADD PRIMARY KEY (`id_bodega`);

--
-- Indices de la tabla `canal`
--
ALTER TABLE `canal`
 ADD PRIMARY KEY (`id_canal`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
 ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
 ADD PRIMARY KEY (`id_cita`);

--
-- Indices de la tabla `cita_estado`
--
ALTER TABLE `cita_estado`
 ADD PRIMARY KEY (`id_citaest`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
 ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
 ADD PRIMARY KEY (`id_compra`);

--
-- Indices de la tabla `compra_detalle`
--
ALTER TABLE `compra_detalle`
 ADD PRIMARY KEY (`id_compra_detalle`), ADD UNIQUE KEY `id_compra` (`id_compra`);

--
-- Indices de la tabla `compra_gasto`
--
ALTER TABLE `compra_gasto`
 ADD PRIMARY KEY (`id_gasto`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
 ADD PRIMARY KEY (`id_cotizacion`);

--
-- Indices de la tabla `cotizacion_detalle`
--
ALTER TABLE `cotizacion_detalle`
 ADD PRIMARY KEY (`id_cotizacion_detalle`);

--
-- Indices de la tabla `cotizacion_estado`
--
ALTER TABLE `cotizacion_estado`
 ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
 ADD PRIMARY KEY (`id_empleado`), ADD UNIQUE KEY `codigo_emp` (`codigo_emp`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
 ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
 ADD PRIMARY KEY (`id_detalle_factura`);

--
-- Indices de la tabla `factura_estado`
--
ALTER TABLE `factura_estado`
 ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
 ADD PRIMARY KEY (`id_forma_pago`);

--
-- Indices de la tabla `instalacion`
--
ALTER TABLE `instalacion`
 ADD PRIMARY KEY (`id_instalacion`), ADD UNIQUE KEY `id_factura` (`id_factura`);

--
-- Indices de la tabla `log_usuario`
--
ALTER TABLE `log_usuario`
 ADD PRIMARY KEY (`id_usuario_log`);

--
-- Indices de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
 ADD PRIMARY KEY (`id_materia`);

--
-- Indices de la tabla `orden_detalle`
--
ALTER TABLE `orden_detalle`
 ADD PRIMARY KEY (`id_orden_detalle`);

--
-- Indices de la tabla `orden_tipo_trabajo`
--
ALTER TABLE `orden_tipo_trabajo`
 ADD PRIMARY KEY (`id_tipo_orden`);

--
-- Indices de la tabla `orden_trabajo`
--
ALTER TABLE `orden_trabajo`
 ADD PRIMARY KEY (`id_orden`), ADD UNIQUE KEY `id_cotizacion` (`id_cotizacion`);

--
-- Indices de la tabla `orden_trabajo_estado`
--
ALTER TABLE `orden_trabajo_estado`
 ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
 ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
 ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
 ADD PRIMARY KEY (`id_provincia`);

--
-- Indices de la tabla `recibo`
--
ALTER TABLE `recibo`
 ADD PRIMARY KEY (`id_recibo`);

--
-- Indices de la tabla `rol_sistema`
--
ALTER TABLE `rol_sistema`
 ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `seqnos`
--
ALTER TABLE `seqnos`
 ADD PRIMARY KEY (`id_seqnos`);

--
-- Indices de la tabla `solicitud_material`
--
ALTER TABLE `solicitud_material`
 ADD PRIMARY KEY (`id_solicitud_material`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
 ADD PRIMARY KEY (`id_sucursal`), ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `tiempo_entrega`
--
ALTER TABLE `tiempo_entrega`
 ADD PRIMARY KEY (`id_tiempo_entrega`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
 ADD PRIMARY KEY (`id_tipo_documento`);

--
-- Indices de la tabla `tipo_orden_cortina`
--
ALTER TABLE `tipo_orden_cortina`
 ADD PRIMARY KEY (`id_orden_cortina`);

--
-- Indices de la tabla `traslado_inv_articulo`
--
ALTER TABLE `traslado_inv_articulo`
 ADD PRIMARY KEY (`id_movimiento`);

--
-- Indices de la tabla `traslado_inv_materia`
--
ALTER TABLE `traslado_inv_materia`
 ADD PRIMARY KEY (`id_movimiento`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
 ADD PRIMARY KEY (`id_ubicacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`id_usuario`), ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
 ADD PRIMARY KEY (`id_usuario_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `log_usuario`
--
ALTER TABLE `log_usuario`
MODIFY `id_usuario_log` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=140;
--
-- AUTO_INCREMENT de la tabla `seqnos`
--
ALTER TABLE `seqnos`
MODIFY `id_seqnos` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
