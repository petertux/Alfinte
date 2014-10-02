-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-10-2014 a las 07:28:26
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

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
(1, '3', '0000-00-00', '0000-00-00', 7),
(2, '6', '2014-09-18', '2014-09-30', 8);

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
(1, 'Articulo 1', 5, 'A', '2014-09-16 00:00:00', 9, 'SI', 1, 'css/image/1.JPG'),
(2, 'Articulo 2', 5, 'A', '2014-09-16 00:00:00', 10, 'SI', 1, 'css/image/2.JPG'),
(3, 'Articulo 3', 3, 'A', '2014-09-16 00:00:00', 6, 'SI', 3, 'css/image/3.JPG'),
(4, 'Articulo 4', 5, 'A', '2014-09-16 00:00:00', 10, 'NO', 1, 'css/image/4.JPG'),
(5, 'Articulo 5', 0, 'A', '2014-09-17 23:51:56', 4, 'SI', 4, 'css/image/5.JPG'),
(6, 'Articulo 6', 0, 'A', '2014-09-18 00:11:50', 3, 'SI', 4, 'css/image/6.JPG'),
(7, 'Articulo 7', 0, 'A', '2014-09-18 18:25:32', 2, 'SI', 1, 'css/image/7.JPG'),
(8, 'Articulo 8', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 2, 'css/image/8.JPG'),
(9, 'Articulo 9', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 2, 'css/image/9.JPG'),
(10, 'Articulo 10', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 2, 'css/image/10.JPG'),
(11, 'Articulo 11', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 2, 'css/image/11.JPG'),
(12, 'Articulo 12', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 2, 'css/image/12.JPG'),
(13, 'Articulo 13', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 1, 'css/image/13.JPG'),
(14, 'Articulo 14', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 1, 'css/image/14.JPG'),
(15, 'Articulo 15', 0, 'A', '2014-09-18 18:30:02', 5, 'SI', 1, 'css/image/15.JPG');

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
(1, 'Internet'),
(2, 'Local'),
(3, 'Telefono');

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
  `id_empleado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_cita`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`id_cita`, `fecha_creacion`, `fecha_programada`, `hora`, `nombre`, `apellido`, `telefono`, `direccion`, `email`, `id_canal`, `id_estado`, `comentario`, `id_empleado`) VALUES
(1, '2014-08-27 18:29:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'usuario1', 'usuarioap', 's', 's', 's@s.com', 1, 1, 'd', 1),
(2, '2014-09-03 00:00:00', NULL, '2014-09-03 20:27:19', 'Rodrigo', 'Amaya', '22120543', 'Citibank', 'rodrigo.amaya@citi.com', 1, 2, 'Cortinas Bonitas', 3),
(3, '2014-09-03 00:00:00', NULL, '2014-09-03 20:29:45', 'William', 'Linarez', '21251413', 'Pinares', 'william.linarez@citi.com', 1, 2, 'Cortinas Blancas', 3),
(5, '2014-10-02 06:03:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'a', 'a', 'a', 'a', 'a@dd.com', 1, 1, 'a', 1);

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
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `codigo_emp` (`codigo_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellido`, `telefono`, `fecha_creacion`, `id_cargo`, `codigo_emp`) VALUES
(1, 'Pedro', 'Sanchez', '76386841', '2014-09-03 00:00:00', 1, 'SD100411'),
(2, 'Daysi', 'Najera', '61425952', '2014-09-03 00:00:00', 3, 'nm100312'),
(3, 'Jorge', 'Luna', '22151684', '2014-09-03 00:00:00', 2, 'JL101010');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

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
(21, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 09:17:10', '2014-10-02 09:17:10'),
(22, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 09:49:15', '2014-10-02 09:49:15'),
(23, 3, 'ventas1', '2014-10-02 00:00:00', '2014-10-02 10:27:30', '2014-10-02 10:27:30'),
(24, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 12:04:43', '2014-10-02 12:04:43'),
(25, 3, 'ventas1', '2014-10-02 00:00:00', '2014-10-02 12:37:44', '2014-10-02 12:37:44'),
(26, 1, 'admin', '2014-10-02 00:00:00', '2014-10-02 12:37:53', '2014-10-02 12:37:53');

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
-- Estructura de tabla para la tabla `orden_detalle`
--

CREATE TABLE IF NOT EXISTS `orden_detalle` (
  `ID_ORDEN_DETALLE` int(11) NOT NULL,
  `AREA` float NOT NULL,
  `TOTAL` decimal(11,0) NOT NULL,
  `ROLLO` float NOT NULL,
  `TIPO` varchar(11) NOT NULL,
  `COLOR` varchar(11) NOT NULL,
  `ALTO` float NOT NULL,
  `ANCHO` float NOT NULL,
  `LARGO` float NOT NULL,
  `VOLUMEN` float NOT NULL,
  `CANTIDAD` float NOT NULL,
  `ID_ARTICULO` int(11) NOT NULL,
  `ID_ORDEN` int(11) NOT NULL,
  PRIMARY KEY (`ID_ORDEN_DETALLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_tipo_trabajo`
--

CREATE TABLE IF NOT EXISTS `orden_tipo_trabajo` (
  `ID_TIPO_ORDEN` int(11) NOT NULL,
  `DESCRIPCION` varchar(25) NOT NULL,
  `ESTADO` char(3) NOT NULL,
  PRIMARY KEY (`ID_TIPO_ORDEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_trabajo`
--

CREATE TABLE IF NOT EXISTS `orden_trabajo` (
  `ID_ORDEN` int(11) NOT NULL,
  `FECHA_ORDEN` date NOT NULL,
  `MATERIALES_ADICIONALES` varchar(50) NOT NULL,
  `OBSERVACIONES` varchar(50) NOT NULL,
  `FECHA_CREACION` date NOT NULL,
  `ID_COTIZACION` int(11) NOT NULL,
  `ID_TIPO_ORDEN` int(11) NOT NULL,
  `id_trabajo_estado` int(11) NOT NULL,
  `ID_TIPO_DOCUMENTO` int(11) NOT NULL,
  `ID_ORDEN_CORTINA` int(11) NOT NULL,
  `ID_CLIENTE` varchar(16) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`ID_ORDEN`),
  UNIQUE KEY `ID_COTIZACION` (`ID_COTIZACION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_trabajo_estado`
--

CREATE TABLE IF NOT EXISTS `orden_trabajo_estado` (
  `ID_ESTADO` int(11) NOT NULL,
  `DESCRIPCION` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_ESTADO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('bdatos', 'cita', 6, 'id_cita', 2),
('bdatos', 'canal', 1, 'id_canal', 3),
('bdatos', 'cita_estado', 3, 'id_citaest', 4),
('bdatos', 'cargo', 4, 'id_cargo', 5),
('bdatos', 'empleado', 3, 'id_empleado', 6),
('bdatos', 'sucursal', 1, 'id_sucursal', 7),
('bdatos', 'articulo_ter', 9, 'id_articulo', 8),
('bdatos', 'articulo_pre', 3, 'id_art_pre', 9);

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
(1, 'sucursal', 'MetroCentro', '34554', 'A', '224684', 'sd@dfsdf.com', 1, NULL, '2014-09-08 00:00:00', 'admin'),
(2, 'La Gran Via', 'La Gran Via', '5415616515', 'A', '2224442', 'lgv@alfinte.com', 2, NULL, '2014-09-08 00:00:00', 'admin'),
(4, 'hgfhgf', 'gdhdfh', 'd43534', 'a', '452345', '54gfdgsd', 1, '', '2014-09-08 15:05:37', ''),
(5, 'sdfasdf', 'sdafasdf', '123', 'a', '234324', 'sfsdf', 1, '', '2014-09-08 15:06:59', '');

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
  `id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `servicio`, `usuario`, `clave_temp`, `clave_def`, `fecha_registro`, `fecha_modificacion`, `fecha_utl_pwd`, `descripcion`, `estado`, `fecha_utl_ing`, `id_empleado`) VALUES
(1, 1, 'admin', 'admin', 'admin', '2014-08-27 18:28:53', '2014-08-27 18:28:53', '0000-00-00 00:00:00', 'admin', 'A', '0000-00-00 00:00:00', 1),
(2, 1, 'admin2', 'admin2', 'admin2', '2014-08-27 18:36:14', '2014-08-27 18:36:14', '0000-00-00 00:00:00', 'admin2', 'A', '0000-00-00 00:00:00', 1),
(3, 1, 'ventas1', 'ventas1', 'ventas1', '2014-10-01 00:00:00', '2014-10-01 00:00:00', '2014-10-01 00:00:00', 'Vendedor 1', 'A', '2014-10-01 00:00:00', 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
