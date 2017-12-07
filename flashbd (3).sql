-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2016 a las 16:52:20
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `flashbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cadetes`
--

CREATE TABLE IF NOT EXISTS `cadetes` (
  `dni` int(8) NOT NULL,
  `usuarios_username` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` int(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dni`,`usuarios_username`),
  KEY `fk_cadetes_usuarios1_idx` (`usuarios_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cadetes`
--

INSERT INTO `cadetes` (`dni`, `usuarios_username`, `nombre`, `apellido`, `direccion`, `telefono`, `email`) VALUES
(2, 'vargas', 'roberto', 'garcia', 'juarez 4343', NULL, NULL),
(123456, 'paredes', 'ramiro', 'martinez', 'zucazaca 4444', 153403674, 'zuca@hotmail.com'),
(32132131, 'paredes', 'jose', 'paredes', 'zambia 123', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `nombreCategoria` varchar(45) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `usuarios_username` varchar(45) NOT NULL,
  `color` int(1) NOT NULL DEFAULT '5',
  PRIMARY KEY (`nombreCategoria`,`usuarios_username`),
  KEY `fk_categorias_usuarios1_idx` (`usuarios_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`nombreCategoria`, `imagen`, `usuarios_username`, `color`) VALUES
('alcohol', NULL, 'paredes', 4),
('bebidas', NULL, 'paredes', 1),
('empanadas', NULL, 'paredes', 5),
('lomitos', NULL, 'paredes', 3),
('pizzanesas', NULL, 'paredes', 3),
('pizzas', NULL, 'paredes', 1),
('tornillos', NULL, 'paredes', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `idclientes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(40) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `usuarios_username` varchar(45) NOT NULL,
  PRIMARY KEY (`idclientes`,`usuarios_username`),
  KEY `fk_clientes_usuarios1_idx` (`usuarios_username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idclientes`, `nombre`, `apellido`, `direccion`, `telefono`, `email`, `usuarios_username`) VALUES
(9, 'jose', 'perez', 'zubieta 123', '3109', '12940218', 'paredes'),
(10, 'maitildo', 'arevalo', 'fraga 123', '340198', '', 'paredes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `nroPedido` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `usuarios_username` varchar(45) NOT NULL,
  `idCadete` tinyint(3) NOT NULL,
  `fecha` date DEFAULT NULL,
  `confirmado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nroPedido`,`idCliente`,`usuarios_username`,`idCadete`),
  KEY `fk_pedidos_clientes1_idx` (`idCliente`),
  KEY `fk_pedidos_usuarios1_idx` (`usuarios_username`),
  KEY `fk_pedidos_cadetes1_idx` (`idCadete`),
  KEY `nroPedido` (`nroPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_has_productos`
--

CREATE TABLE IF NOT EXISTS `pedidos_has_productos` (
  `nroPedido` int(11) NOT NULL,
  `nombreProducto` varchar(45) NOT NULL,
  `cantidad` int(3) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`nroPedido`,`nombreProducto`,`username`),
  KEY `fk_pedidos_has_productos_productos1_idx` (`nombreProducto`),
  KEY `fk_pedidos_has_productos_pedidos1_idx` (`nroPedido`),
  KEY `fk_pedidos_has_productos_usuarios1_idx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `nombreCategoria` varchar(45) NOT NULL,
  `nombreProducto` varchar(45) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `precio` float NOT NULL,
  `usuarios_username` varchar(45) NOT NULL,
  PRIMARY KEY (`nombreCategoria`,`usuarios_username`,`nombreProducto`),
  KEY `fk_productos_categorias1_idx` (`nombreCategoria`),
  KEY `fk_productos_usuarios1_idx` (`usuarios_username`),
  KEY `nombreProducto_UNIQUE` (`nombreProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`nombreCategoria`, `nombreProducto`, `stock`, `imagen`, `costo`, `precio`, `usuarios_username`) VALUES
('bebidas', 'coca cola 2 litros', 10, NULL, 20, 30, 'paredes'),
('bebidas', 'COCACOLA 1 LITRO', 30, NULL, 10, 20, 'paredes'),
('lomitos', 'lomitos queso', 4, NULL, 25, 80, 'paredes'),
('pizzanesas', 'pizzanesa rucula', 1, NULL, 10, 100, 'paredes'),
('pizzas', 'palmito', 59, NULL, 18, 38, 'paredes'),
('pizzas', 'parmesano', 43, NULL, 12, 439, 'paredes'),
('pizzas', 'pizza doble queso', 2, NULL, 10, 80, 'paredes'),
('pizzas', 'pizza queso', 1, NULL, 10, 70, 'paredes'),
('pizzas', 'pizza rucula', 1, NULL, 10, 85, 'paredes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `username` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `empresa` varchar(45) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`username`, `nombre`, `apellido`, `direccion`, `telefono`, `email`, `empresa`, `password`) VALUES
('paredes', 'ivan', 'parede', 'uruguay 1682', NULL, NULL, 'paredes sa', '123'),
('vargas', 'forencia', 'vargas', 'ayacucho 4217', NULL, NULL, 'vargas sa', '123');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cadetes`
--
ALTER TABLE `cadetes`
  ADD CONSTRAINT `fk_cadetes_usuarios1` FOREIGN KEY (`usuarios_username`) REFERENCES `usuarios` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categorias_usuarios1` FOREIGN KEY (`usuarios_username`) REFERENCES `usuarios` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_usuarios1` FOREIGN KEY (`usuarios_username`) REFERENCES `usuarios` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_clientes1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idclientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_usuarios1` FOREIGN KEY (`usuarios_username`) REFERENCES `usuarios` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidos_has_productos`
--
ALTER TABLE `pedidos_has_productos`
  ADD CONSTRAINT `fk_pedidos_has_productos_pedidos1` FOREIGN KEY (`nroPedido`) REFERENCES `pedidos` (`nroPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_has_productos_productos1` FOREIGN KEY (`nombreProducto`) REFERENCES `productos` (`nombreProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_has_productos_usuarios1` FOREIGN KEY (`username`) REFERENCES `usuarios` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_usuarios1` FOREIGN KEY (`usuarios_username`) REFERENCES `usuarios` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`nombreCategoria`) REFERENCES `categorias` (`nombreCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
