-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2024 a las 05:47:20
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aurora`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrodecompras`
--

CREATE TABLE `carrodecompras` (
  `id_Carro` int(11) NOT NULL,
  `id_Usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrodecompras`
--

INSERT INTO `carrodecompras` (`id_Carro`, `id_Usuario`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_Pedido` int(11) NOT NULL,
  `id_Carro` int(11) DEFAULT NULL,
  `id_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL,
  `Total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_Pedido`, `id_Carro`, `id_Producto`, `Cantidad`, `Total`) VALUES
(1, 1, 1, 2, 28000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_Producto` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Referencia` varchar(50) DEFAULT NULL,
  `Precio` int(11) NOT NULL,
  `cantidadDisponible` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_Producto`, `Nombre`, `Referencia`, `Precio`, `cantidadDisponible`) VALUES
(1, 'Rose Rose', 'Rubor', 14000, 5),
(2, 'Electric', 'Esmalte', 10000, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_Usuario` int(11) NOT NULL,
  `nombre_Completo` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Contraseña` varchar(8) NOT NULL,
  `Dirección` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_Usuario`, `nombre_Completo`, `Email`, `Contraseña`, `Dirección`) VALUES
(1, 'María Rojas', 'rojasmaria@gmail.com', 'passw123', 'Cr 5 #42-30 Bogotá'),
(2, 'Claudia Perez', 'perezclaudia@gmail.com', 'mascot12', 'Cll 52 #42-30 Cali');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrodecompras`
--
ALTER TABLE `carrodecompras`
  ADD PRIMARY KEY (`id_Carro`),
  ADD KEY `id_Usuario` (`id_Usuario`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_Pedido`),
  ADD KEY `id_Carro` (`id_Carro`),
  ADD KEY `id_Producto` (`id_Producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_Producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_Usuario`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrodecompras`
--
ALTER TABLE `carrodecompras`
  MODIFY `id_Carro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_Pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrodecompras`
--
ALTER TABLE `carrodecompras`
  ADD CONSTRAINT `carrodecompras_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_Carro`) REFERENCES `carrodecompras` (`id_Carro`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_Producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
