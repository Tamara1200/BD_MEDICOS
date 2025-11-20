-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2025 a las 03:50:08
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
-- Base de datos: `medicos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipouser`
--

CREATE TABLE `tipouser` (
  `id_tuser` int(11) NOT NULL,
  `nombretuser` varchar(55) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipouser`
--

INSERT INTO `tipouser` (`id_tuser`, `nombretuser`, `descripcion`) VALUES
(1, 'SISTEMAS', 'USUARIO ESPECIALIZADO EN EL ANTENIMIENTO DEL SISTEMA'),
(2, 'MEDICO', 'USUARIO ESPECIALIZADO EN EL SECTOR SALUD'),
(3, 'PACIENTE', 'PERSONA ATENDIDA DENTRO DE LA INTITUCIÓN'),
(4, 'VISITANTE', 'PERSONA DE LA CUAL SU ESTADIA ES PARCIAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(55) NOT NULL,
  `Ap` varchar(55) NOT NULL,
  `Am` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `id_tuser` int(11) NOT NULL,
  `f_registro` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `Ap`, `Am`, `email`, `password_hash`, `id_tuser`, `f_registro`) VALUES
(1, 'ERIC', 'GOMEZ', 'MARTINEZ', 'eric@gmail.com', '546aa56dc1b06c31f9fafd86b2cda5d0', 1, '2025-11-19'),
(2, 'GABI', 'LOPEZ', 'VARGAS', 'gabi@gmail.com', '557319843e92ee97928c1a37b2eb842c', 2, '2025-11-19'),
(3, 'TAMARA', 'SEGURA', 'ARCINIEGA', 'tam@gmai.com', '2999f62796492ac2ec584c001f8627be', 3, '2025-11-19'),
(4, 'Sandra', 'VALENCIA', 'HERNANDEZ', 'sandraqgmail.com', 'a83c136705ab8ba224088419236b57e5', 4, '2025-11-19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tipouser`
--
ALTER TABLE `tipouser`
  ADD PRIMARY KEY (`id_tuser`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_tuser` (`id_tuser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tipouser`
--
ALTER TABLE `tipouser`
  MODIFY `id_tuser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tuser`) REFERENCES `tipouser` (`id_tuser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
