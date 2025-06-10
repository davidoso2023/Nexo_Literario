-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2025 a las 02:42:26
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
-- Base de datos: `nexo_literario`
--
CREATE DATABASE IF NOT EXISTS `nexo_literario` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `nexo_literario`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_asignaturas`
--

CREATE TABLE `tbl_asignaturas` (
  `Id_Asig` int(11) NOT NULL,
  `Nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_asignaturas`
--

INSERT INTO `tbl_asignaturas` (`Id_Asig`, `Nombre`) VALUES
(1, 'Programacion Web');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_facultades`
--

CREATE TABLE `tbl_facultades` (
  `id_fac` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_facultades`
--

INSERT INTO `tbl_facultades` (`id_fac`, `nombre`) VALUES
(1, 'Ingenieria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_libros`
--

CREATE TABLE `tbl_libros` (
  `id_libros` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `asignatura_id` int(11) DEFAULT NULL,
  `facultad_id` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creador_id` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_libros`
--

INSERT INTO `tbl_libros` (`id_libros`, `titulo`, `autor`, `asignatura_id`, `facultad_id`, `descripcion`, `creador_id`, `fecha_creacion`) VALUES
(2, 'Nexo Literario', 'charles bandera', 1, 1, 'nn san bandera', 1, '2025-06-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_libros_temas`
--

CREATE TABLE `tbl_libros_temas` (
  `libro_id` int(11) NOT NULL,
  `tema_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_temas`
--

CREATE TABLE `tbl_temas` (
  `id_temas` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_temas`
--

INSERT INTO `tbl_temas` (`id_temas`, `nombre`) VALUES
(1, 'ingenieria de software');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `facultad_id` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`id_usuarios`, `nombre`, `correo`, `contraseña`, `facultad_id`, `fecha_creacion`) VALUES
(1, 'David', 'nn@nn', '12345', 1, '2025-06-08'),
(2, 'Damian', 'eldama@jjjj', '12345', 1, '2025-06-09'),
(3, 'karo', 'karo@karo', '1234', 1, '2025-06-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_valoraciones`
--

CREATE TABLE `tbl_valoraciones` (
  `id_valor` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `libro_id` int(11) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL CHECK (`puntuacion` >= 1 and `puntuacion` <= 5),
  `comentario` text DEFAULT NULL,
  `fecha_creacion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_asignaturas`
--
ALTER TABLE `tbl_asignaturas`
  ADD PRIMARY KEY (`Id_Asig`);

--
-- Indices de la tabla `tbl_facultades`
--
ALTER TABLE `tbl_facultades`
  ADD PRIMARY KEY (`id_fac`);

--
-- Indices de la tabla `tbl_libros`
--
ALTER TABLE `tbl_libros`
  ADD PRIMARY KEY (`id_libros`),
  ADD KEY `facultad_id` (`facultad_id`),
  ADD KEY `creador_id` (`creador_id`);

--
-- Indices de la tabla `tbl_libros_temas`
--
ALTER TABLE `tbl_libros_temas`
  ADD PRIMARY KEY (`libro_id`,`tema_id`),
  ADD KEY `tema_id` (`tema_id`);

--
-- Indices de la tabla `tbl_temas`
--
ALTER TABLE `tbl_temas`
  ADD PRIMARY KEY (`id_temas`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`id_usuarios`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `facultad_id` (`facultad_id`);

--
-- Indices de la tabla `tbl_valoraciones`
--
ALTER TABLE `tbl_valoraciones`
  ADD PRIMARY KEY (`id_valor`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `libro_id` (`libro_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_asignaturas`
--
ALTER TABLE `tbl_asignaturas`
  MODIFY `Id_Asig` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_facultades`
--
ALTER TABLE `tbl_facultades`
  MODIFY `id_fac` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_libros`
--
ALTER TABLE `tbl_libros`
  MODIFY `id_libros` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_temas`
--
ALTER TABLE `tbl_temas`
  MODIFY `id_temas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_valoraciones`
--
ALTER TABLE `tbl_valoraciones`
  MODIFY `id_valor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_libros`
--
ALTER TABLE `tbl_libros`
  ADD CONSTRAINT `tbl_libros_ibfk_1` FOREIGN KEY (`facultad_id`) REFERENCES `tbl_facultades` (`id_fac`),
  ADD CONSTRAINT `tbl_libros_ibfk_2` FOREIGN KEY (`creador_id`) REFERENCES `tbl_usuarios` (`id_usuarios`);

--
-- Filtros para la tabla `tbl_libros_temas`
--
ALTER TABLE `tbl_libros_temas`
  ADD CONSTRAINT `tbl_libros_temas_ibfk_1` FOREIGN KEY (`libro_id`) REFERENCES `tbl_libros` (`id_libros`),
  ADD CONSTRAINT `tbl_libros_temas_ibfk_2` FOREIGN KEY (`tema_id`) REFERENCES `tbl_temas` (`id_temas`);

--
-- Filtros para la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD CONSTRAINT `tbl_usuarios_ibfk_1` FOREIGN KEY (`facultad_id`) REFERENCES `tbl_facultades` (`id_fac`);

--
-- Filtros para la tabla `tbl_valoraciones`
--
ALTER TABLE `tbl_valoraciones`
  ADD CONSTRAINT `tbl_valoraciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `tbl_usuarios` (`id_usuarios`),
  ADD CONSTRAINT `tbl_valoraciones_ibfk_2` FOREIGN KEY (`libro_id`) REFERENCES `tbl_libros` (`id_libros`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
