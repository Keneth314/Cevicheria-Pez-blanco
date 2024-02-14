-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 14-02-2024 a las 20:47:57
-- Versión del servidor: 5.7.44-cll-lve
-- Versión de PHP: 8.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kenethlo_cevicheria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletas`
--

CREATE TABLE `boletas` (
  `idBoleta` int(11) NOT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `montoTotal` decimal(10,2) DEFAULT NULL,
  `codigoPago` varchar(255) DEFAULT NULL,
  `codigoBoleta` varchar(255) DEFAULT NULL,
  `fechaEmision` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallesBoleta`
--

CREATE TABLE `detallesBoleta` (
  `idDetalleBoleta` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `mesa` int(11) DEFAULT NULL,
  `ambiente` int(11) DEFAULT NULL,
  `idBoleta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `mesa` int(11) DEFAULT NULL,
  `ambiente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `descripcion`, `cantidad`, `precio`, `total`, `mesa`, `ambiente`) VALUES
(1, 'cerveza', 1, 8.00, 8.00, 1, 1),
(2, 'ceviche', 1, 15.00, 15.00, 1, 1),
(3, 'Trio marino', 1, 20.00, 20.00, 1, 1),
(4, 'ceviche', 2, 15.00, 30.00, 1, 1),
(5, 'ceviche', 2, 0.00, 0.00, 1, 1),
(6, 'ceviche', 2, 0.00, 0.00, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE `privilegios` (
  `idPrivilegio` int(11) NOT NULL,
  `nombrePrivilegios` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`idPrivilegio`, `nombrePrivilegios`) VALUES
(1, 'Reservar Mesa'),
(2, 'Validar Reserva'),
(3, 'Registrar Usuario'),
(4, 'Obtener lista de Productos'),
(5, 'Administrar Productos'),
(6, 'Registrar Venta'),
(7, 'Emitir Reporte Ingresos'),
(8, 'Editar Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `descripcion`, `precio`, `estado`) VALUES
(1, 'Cerveza', 8.00, 1),
(2, 'Ceviche de pescado', 15.00, 0),
(3, 'Trio marino', 20.00, 1),
(4, 'Ceviche mixto', 20.00, 1),
(5, 'Leche de tigre', 10.00, 1),
(7, 'ChicharrÃ³n de pescado', 25.00, 0),
(8, 'Gaseosa', 10.00, 1),
(9, 'Agua mineral', 10.00, 1),
(10, 'Arroz con mariscos', 20.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proformas`
--

CREATE TABLE `proformas` (
  `idProforma` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `mesa` int(11) DEFAULT NULL,
  `ambiente` int(11) DEFAULT NULL,
  `montoTotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `idReserva` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `fechaReservada` date DEFAULT NULL,
  `fechaDeReserva` date DEFAULT NULL,
  `ambiente` int(11) DEFAULT NULL,
  `cantMesas` int(11) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `atendido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuario`, `password`, `estado`) VALUES
(1, 'keneth', '123456', 1),
(2, 'admin123', 'admin123', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_privilegio`
--

CREATE TABLE `usuario_privilegio` (
  `idUsuario` int(11) NOT NULL,
  `idPrivilegio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_privilegio`
--

INSERT INTO `usuario_privilegio` (`idUsuario`, `idPrivilegio`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(1, 3),
(2, 3),
(1, 4),
(2, 4),
(1, 5),
(2, 5),
(1, 6),
(2, 6),
(1, 7),
(2, 7),
(1, 8),
(2, 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boletas`
--
ALTER TABLE `boletas`
  ADD PRIMARY KEY (`idBoleta`);

--
-- Indices de la tabla `detallesBoleta`
--
ALTER TABLE `detallesBoleta`
  ADD PRIMARY KEY (`idDetalleBoleta`),
  ADD KEY `idBoleta` (`idBoleta`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`);

--
-- Indices de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`idPrivilegio`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `proformas`
--
ALTER TABLE `proformas`
  ADD PRIMARY KEY (`idProforma`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`idReserva`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `usuario_privilegio`
--
ALTER TABLE `usuario_privilegio`
  ADD PRIMARY KEY (`idUsuario`,`idPrivilegio`),
  ADD KEY `idPrivilegio` (`idPrivilegio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boletas`
--
ALTER TABLE `boletas`
  MODIFY `idBoleta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallesBoleta`
--
ALTER TABLE `detallesBoleta`
  MODIFY `idDetalleBoleta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `idPrivilegio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proformas`
--
ALTER TABLE `proformas`
  MODIFY `idProforma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallesBoleta`
--
ALTER TABLE `detallesBoleta`
  ADD CONSTRAINT `detallesBoleta_ibfk_1` FOREIGN KEY (`idBoleta`) REFERENCES `boletas` (`idBoleta`);

--
-- Filtros para la tabla `usuario_privilegio`
--
ALTER TABLE `usuario_privilegio`
  ADD CONSTRAINT `usuario_privilegio_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `usuario_privilegio_ibfk_2` FOREIGN KEY (`idPrivilegio`) REFERENCES `privilegios` (`idPrivilegio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
