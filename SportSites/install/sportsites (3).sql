-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2015 a las 10:46:00
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sportsites`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id_categoria` int(11) NOT NULL,
  `nom` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `descripcio` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id_categoria`, `nom`, `descripcio`) VALUES
(1, 'BMX', 'BMX'),
(2, 'Running', 'Correr');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `comentari`
--
CREATE TABLE IF NOT EXISTS `comentari` (
`usuari` varchar(30)
,`comentari` text
,`publicat` date
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentaris`
--

CREATE TABLE IF NOT EXISTS `comentaris` (
  `id_comentari` int(11) NOT NULL,
  `comentari` text COLLATE utf8_spanish_ci NOT NULL,
  `data_publicacio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `comentaris`
--

INSERT INTO `comentaris` (`id_comentari`, `comentari`, `data_publicacio`) VALUES
(1, 'Esto es una mierda', '2015-05-22');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `favorit`
--
CREATE TABLE IF NOT EXISTS `favorit` (
`titol` varchar(30)
,`descripcio` text
,`imatge` varchar(100)
,`lloc` varchar(60)
,`usuari` int(11)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorits`
--

CREATE TABLE IF NOT EXISTS `favorits` (
  `site` int(11) NOT NULL,
  `usuari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `favorits`
--

INSERT INTO `favorits` (`site`, `usuari`) VALUES
(1, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multimedia`
--

CREATE TABLE IF NOT EXISTS `multimedia` (
`id_multimedia` int(11) NOT NULL,
  `imatge` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `video` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuari` int(11) NOT NULL,
  `site` int(11) NOT NULL,
  `categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sites`
--

CREATE TABLE IF NOT EXISTS `sites` (
`id_site` int(11) NOT NULL,
  `titol` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `descripcio` text COLLATE utf8_spanish_ci NOT NULL,
  `categoria` int(11) DEFAULT NULL,
  `lloc` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `imatge` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comentari` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `data` date NOT NULL,
  `usuari` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `sites`
--

INSERT INTO `sites` (`id_site`, `titol`, `descripcio`, `categoria`, `lloc`, `imatge`, `comentari`, `data`, `usuari`) VALUES
(1, 'Skatepark Castelldefels', 'Skatepark situado al lado del Anec Blau.', 1, 'Castelldefels', '2592.gif', NULL, '2015-05-28', 1),
(4, 'SkatePark Viladecans', 'ojuu', 2, 'Viladecans', '2019-dispensador-cubalibres-arduino.jpg', NULL, '2015-05-21', 1),
(6, 'kk', 'kk', 1, 'kkk', '2014-super-angry-birds-arduino.jpg', NULL, '2015-05-28', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitescomentaris`
--

CREATE TABLE IF NOT EXISTS `sitescomentaris` (
  `site` int(11) NOT NULL,
  `comentari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sitescomentaris`
--

INSERT INTO `sitescomentaris` (`site`, `comentari`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscripcio`
--

CREATE TABLE IF NOT EXISTS `subscripcio` (
`id_subs` int(11) NOT NULL,
  `metode_pagament` varchar(30) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'No Definida',
  `preu` int(11) NOT NULL DEFAULT '25',
  `c_bancaria` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'No Definida',
  `subscrit` char(2) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'NO',
  `usuari` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `subscripcio`
--

INSERT INTO `subscripcio` (`id_subs`, `metode_pagament`, `preu`, `c_bancaria`, `subscrit`, `usuari`) VALUES
(1, 'Tarjeta', 1, '025888366987454474', 'SI', 1),
(5, 'No Definida', 25, 'No Definida', 'NO', 6),
(6, 'Transferencia', 25, 'No Definidas', 'SI', 3),
(7, 'No Definida', 25, 'No Definida', 'NO', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuaris`
--

CREATE TABLE IF NOT EXISTS `usuaris` (
`id_user` int(11) NOT NULL,
  `nom` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cognoms` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `localitat` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `sexe` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefon` int(11) NOT NULL,
  `email` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `usuari` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rol` int(11) NOT NULL,
  `estat` int(11) NOT NULL DEFAULT '1',
  `imatge_Perfil` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `valoracio` int(11) NOT NULL DEFAULT '10'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `usuaris`
--

INSERT INTO `usuaris` (`id_user`, `nom`, `cognoms`, `localitat`, `sexe`, `telefon`, `email`, `usuari`, `password`, `rol`, `estat`, `imatge_Perfil`, `valoracio`) VALUES
(1, 'Administrador', 'SportSite', 'Gavà', 'Home', 936547892, 'admin@sportsite.com', 'admin', '202cb962ac59075b964b07152d234b70', 1, 1, NULL, 10),
(2, 'Usuario1', 'SportSite', 'Gavà', 'Home', 936547892, 'user1@sportsite.com', 'user1', '202cb962ac59075b964b07152d234b70', 2, 1, NULL, 0),
(3, 'Usuario2', 'SportSite', 'Gavà', 'Dona', 936582135, 'user2@sportsite.com', 'user2', '202cb962ac59075b964b07152d234b70', 2, 1, NULL, 0),
(5, 'kk', 'kk', 'kk', 'Dona', 936541235, 'kk@kk.com', 'kk', '202cb962ac59075b964b07152d234b70', 2, 0, NULL, 0),
(6, 'Usuario3', 'SportSites', 'Viladecans', 'Home', 936541235, 'user3@sportsites.com', 'user3', '202cb962ac59075b964b07152d234b70', 2, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariscomentaris`
--

CREATE TABLE IF NOT EXISTS `usuariscomentaris` (
  `usuari` int(11) NOT NULL,
  `comentari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuariscomentaris`
--

INSERT INTO `usuariscomentaris` (`usuari`, `comentari`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura para la vista `comentari`
--
DROP TABLE IF EXISTS `comentari`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comentari` AS select `usuaris`.`usuari` AS `usuari`,`comentaris`.`comentari` AS `comentari`,`comentaris`.`data_publicacio` AS `publicat` from ((((`usuaris` join `usuariscomentaris` on((`usuaris`.`id_user` = `usuariscomentaris`.`usuari`))) join `comentaris` on((`usuariscomentaris`.`comentari` = `comentaris`.`id_comentari`))) join `sitescomentaris` on((`comentaris`.`id_comentari` = `sitescomentaris`.`comentari`))) join `sites` on((`sitescomentaris`.`site` = `sites`.`id_site`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `favorit`
--
DROP TABLE IF EXISTS `favorit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `favorit` AS select `sites`.`titol` AS `titol`,`sites`.`descripcio` AS `descripcio`,`sites`.`imatge` AS `imatge`,`sites`.`lloc` AS `lloc`,`usuaris`.`id_user` AS `usuari` from ((`sites` join `favorits` on((`sites`.`id_site` = `favorits`.`site`))) join `usuaris` on((`favorits`.`usuari` = `usuaris`.`id_user`)));

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `comentaris`
--
ALTER TABLE `comentaris`
 ADD PRIMARY KEY (`id_comentari`);

--
-- Indices de la tabla `favorits`
--
ALTER TABLE `favorits`
 ADD PRIMARY KEY (`site`,`usuari`), ADD KEY `Favorits_Usuaris` (`usuari`);

--
-- Indices de la tabla `multimedia`
--
ALTER TABLE `multimedia`
 ADD PRIMARY KEY (`id_multimedia`), ADD KEY `Multimedia_Categories` (`categoria`), ADD KEY `Multimedia_Sites` (`site`), ADD KEY `Multimedia_Usuaris` (`usuari`);

--
-- Indices de la tabla `sites`
--
ALTER TABLE `sites`
 ADD PRIMARY KEY (`id_site`), ADD KEY `Sites_Categories` (`categoria`), ADD KEY `Sites_Usuaris` (`usuari`);

--
-- Indices de la tabla `sitescomentaris`
--
ALTER TABLE `sitescomentaris`
 ADD PRIMARY KEY (`site`,`comentari`), ADD KEY `Comentaris_Comentari_Site` (`comentari`);

--
-- Indices de la tabla `subscripcio`
--
ALTER TABLE `subscripcio`
 ADD PRIMARY KEY (`id_subs`), ADD KEY `Subscripcio_Usuaris` (`usuari`);

--
-- Indices de la tabla `usuaris`
--
ALTER TABLE `usuaris`
 ADD PRIMARY KEY (`id_user`);

--
-- Indices de la tabla `usuariscomentaris`
--
ALTER TABLE `usuariscomentaris`
 ADD PRIMARY KEY (`usuari`,`comentari`), ADD KEY `Comentaris_Comentari` (`comentari`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `multimedia`
--
ALTER TABLE `multimedia`
MODIFY `id_multimedia` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sites`
--
ALTER TABLE `sites`
MODIFY `id_site` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `subscripcio`
--
ALTER TABLE `subscripcio`
MODIFY `id_subs` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `usuaris`
--
ALTER TABLE `usuaris`
MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `favorits`
--
ALTER TABLE `favorits`
ADD CONSTRAINT `Favorits_Usuaris` FOREIGN KEY (`usuari`) REFERENCES `usuaris` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Sites_Favorits` FOREIGN KEY (`site`) REFERENCES `sites` (`id_site`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `multimedia`
--
ALTER TABLE `multimedia`
ADD CONSTRAINT `Multimedia_Categories` FOREIGN KEY (`categoria`) REFERENCES `categories` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Multimedia_Sites` FOREIGN KEY (`site`) REFERENCES `sites` (`id_site`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Multimedia_Usuaris` FOREIGN KEY (`usuari`) REFERENCES `usuaris` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sites`
--
ALTER TABLE `sites`
ADD CONSTRAINT `Sites_Categories` FOREIGN KEY (`categoria`) REFERENCES `categories` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Sites_Usuaris` FOREIGN KEY (`usuari`) REFERENCES `usuaris` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sitescomentaris`
--
ALTER TABLE `sitescomentaris`
ADD CONSTRAINT `Comentaris_Comentari_Site` FOREIGN KEY (`comentari`) REFERENCES `comentaris` (`id_comentari`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Comentaris_Sites` FOREIGN KEY (`site`) REFERENCES `sites` (`id_site`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `subscripcio`
--
ALTER TABLE `subscripcio`
ADD CONSTRAINT `Subscripcio_Usuaris` FOREIGN KEY (`usuari`) REFERENCES `usuaris` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuariscomentaris`
--
ALTER TABLE `usuariscomentaris`
ADD CONSTRAINT `Comentaris_Comentari` FOREIGN KEY (`comentari`) REFERENCES `comentaris` (`id_comentari`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `Comentaris_Usuaris` FOREIGN KEY (`usuari`) REFERENCES `usuaris` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
