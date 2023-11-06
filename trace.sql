-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2023 a las 12:54:52
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trace`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumni`
--

CREATE TABLE `alumni` (
  `Matricula` int(11) NOT NULL,
  `Nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ApellidoP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ApellidoM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CorreoI` varchar(255) NOT NULL,
  `CorreoP` varchar(255) DEFAULT NULL,
  `FechaIng` varchar(10) DEFAULT NULL,
  `FechaEgreso` varchar(10) DEFAULT NULL,
  `Compania` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Puesto` varchar(255) DEFAULT NULL,
  `GeoLocationName` varchar(255) DEFAULT NULL,
  `GeoCountryName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumni`
--

INSERT INTO `alumni` (`Matricula`, `Nombre`, `ApellidoP`, `ApellidoM`, `CorreoI`, `CorreoP`, `FechaIng`, `FechaEgreso`, `Compania`, `Puesto`, `GeoLocationName`, `GeoCountryName`) VALUES
(290179, 'ALDO ANDRE', 'SILVA', 'LUNA', 'aldo.silva@uabc.edu.mx', '', '2011-1', '2019-1', '', '', '', ''),
(346547, 'ABRAHAM', 'MEDINA', 'CARRILLO', 'abraham.medina.carrillo@uabc.edu.mx', '', '2016-2', '2022-1', '', '', '', ''),
(1200271, 'JOSE ARMANDO', 'GUTIÉRREZ', 'NÚÑEZ', 'armando.gutierrez5@uabc.edu.mx', '', '2011-2', '2018-2', '', '', '', ''),
(1200315, 'ENEIDA GUILLERMINA', 'ESPINOZA', 'RAMIREZ', 'eneida.espinoza@uabc.edu.mx', '', '2012-1', '2018-2', '', '', '', ''),
(1200429, 'GUSTAVO', 'LEYVA', 'HERNANDEZ', 'gustavo.leyva@uabc.edu.mx', '', '2012-1', '2019-2', '', '', '', ''),
(1200553, 'ANGELICA JAZMIN', 'AVILA', 'HUIZAR', 'angelica.avila@uabc.edu.mx', '', '2011-2', '2019-1', '', '', '', ''),
(1207876, 'DANIEL', 'HERRERA', 'GONZALEZ', 'daniel.herrera.gonzalez@uabc.edu.mx', '', '2012-1', '2018-2', '', '', '', ''),
(1208369, 'VICTOR ENRIQUE', 'LÓPEZ', 'MALDONADO', 'vlopez44@uabc.edu.mx', '', '2012-2', '2018-2', '', '', '', ''),
(1208408, 'GABRIEL', 'VALDEZ', 'TOPETE', 'valdez.gabriel@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1208411, 'SERGIO ANTONIO', 'JIMENEZ', 'HERNANDEZ', 'sergio.jimenez@uabc.edu.mx', '', '2012-2', '2018-2', '', '', '', ''),
(1208458, 'JESUS ADEL', 'LEON', 'ORTIZ', 'adel.leon@uabc.edu.mx', '', '2012-2', '2019-1', '', '', '', ''),
(1208520, 'SHUNG LI', 'CHON', 'AGUIAR', 'li.chon@uabc.edu.mx', '', '2013-1', '2019-2', '', '', '', ''),
(1208529, 'JOSE CARLOS', 'BOLAÑOS', 'MARQUEZ', 'jose.bolanos@uabc.edu.mx', '', '2012-2', '2018-2', '', '', '', ''),
(1208610, 'RUBEN OSBALDO', 'REYES', 'RIVERA', 'osbaldo.reyes@uabc.edu.mx', '', '2012-2', '2019-1', '', '', '', ''),
(1208658, 'MANUEL ANTONIO', 'ALANIS', 'CARRILLO', 'alanism@uabc.edu.mx', '', '2013-1', '2019-1', '', '', '', ''),
(1208750, 'EMMANUEL', 'NUÑO', 'ESTRELLA', 'emmanuel.nuno.estrella@uabc.edu.mx', '', '2012-2', '2020-1', '', '', '', ''),
(1208767, 'MIGUEL ALEXANDRO', 'ROBLEDO', 'GONZALEZ', 'miguel.robledo@uabc.edu.mx', '', '2012-2', '2020-1', '', '', '', ''),
(1208846, 'JESUS ALBERTO', 'TRINIDAD', 'GARCIA', 'jesus.trinidad@uabc.edu.mx', '', '2012-2', '2019-1', '', '', '', ''),
(1208908, 'VICTOR AARON', 'SANCHEZ', 'QUIROZ', 'victor.aaron.sanchez.quiroz@uabc.edu.mx', '', '2013-1', '2019-2', '', '', '', ''),
(1214623, 'MAGDALENA CONCEPCIÓN', 'BRAVO', 'GONZALEZ', 'magdalena.bravo@uabc.edu.mx', '', '2014-2', '2019-1', '', '', '', ''),
(1216621, 'PAUL', 'JIMÉNEZ', 'FRANCO', 'jimenez.paul@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1216638, 'JOSE EMMANUEL', 'MORAN', 'CARRILLO', 'emmanuel.moran@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1216693, 'FRANCISCO MARTIN', 'AREVALOS', 'FERNANDEZ', 'martin.arevalos@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1216718, 'CRISTINA', 'QUINTERO', 'MARIN', 'quintero.cristina@uabc.edu.mx', '', '2014-1', '2021-2', '', '', '', ''),
(1216790, 'ARTURO', 'NEVAREZ', 'VILLA', 'nevarez.arturo@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1216845, 'LUIS ANTONIO', 'PICAZARRI', 'QUINTANA', 'luis.picazarri@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1217075, 'SALVADOR', 'ZARAGOZA', 'GARCIA', 'salvador.zaragoza@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1217102, 'SAUL IVAN', 'FLORES', 'TORRES COTO', 'flores.saul@uabc.edu.mx', '', '2013-2', '2020-1', '', '', '', ''),
(1217111, 'ORLANDO DANTE', 'LOPEZ', 'MORENO', 'dante.lopez@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1217113, 'OSCAR', 'ISLAS', 'OLIVER', 'oscar.islas@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1217167, 'ARGENIS URIEL', 'CEBREROS', 'CARRILLO', 'uriel.cebreros@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1217169, 'RICARDO', 'CASTRO', 'GONZALES', 'ricardo.castro27@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1217242, 'BERENICE', 'FLORES', 'SALGADO', 'berenice.flores@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1217249, 'LUIS GERARDO', 'ENCINAS', 'RAMOS', 'luis.encinas@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1217258, 'LUIS ENRIQUE', 'GONZALEZ', 'CARDIEL', 'luis.gonzalez15@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1217266, 'CARLOS JAVIER', 'DE LA CRUZ', 'LOPEZ', 'delacruz.carlos@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1217280, 'CARLOS ALEJANDRO', 'GONZALEZ', 'ORTIZ', 'carlos.alejandro.gonzalez.ortiz@uabc.edu.mx', '', '2014-1', '2020-1', '', '', '', ''),
(1217306, 'YAIR EDUARDO', 'CASTREJÓN', 'MARTÍNEZ', 'yair.castrejon@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1220016, 'ALEJANDRO', 'AGUILAR', 'VEA', 'alejandro.aguilar.vea@uabc.edu.mx', '', '2015-1', '2022-2', '', '', '', ''),
(1220619, 'MARIA ALEJANDRA', 'BRUGHERA', 'PEREZ', 'alejandra.brughera@uabc.edu.mx', '', '2014-2', '2020-1', '', '', '', ''),
(1220995, 'VICTOR', 'BARCENAS', 'BURGOS', 'victor.barcenas@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1221858, 'LUIS MAURICIO', 'PALACIO', 'RENTERIA', 'palacio.luis@uabc.edu.mx', '', '2013-2', '2021-1', '', '', '', ''),
(1222324, 'LEONARDO', 'MELENDEZ', 'LINEROS', 'leonardo.melendez@uabc.edu.mx', '', '2017-2', '2022-2', '', '', '', ''),
(1224684, 'RAMSSES', 'PALAFOX', 'BALLARDO', 'rpalafox@uabc.edu.mx', '', '2014-2', '2020-2', '', '', '', ''),
(1225272, 'AARÓN ISAAC', 'TORRES', 'AVALOS', 'aaron.torres@uabc.edu.mx', '', '2014-1', '2020-1', '', '', '', ''),
(1225936, 'ARTURO', 'ARREOLA', 'ALVAREZ', 'arreola.arturo@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1226489, 'GUILLERMO', 'LEON', 'BARRIOS', 'guillermo.leon.barrios@uabc.edu.mx', '', '2014-2', '2021-1', '', '', '', ''),
(1226679, 'ERICK GERARDO', 'GONZALEZ', 'CARDIEL', 'erick.gerardo.gonzalez.cardiel@uabc.edu.mx', '', '2014-2', '2018-2', '', '', '', ''),
(1226702, 'JOSE ISABEL', 'GARCIA', 'ROCHA', 'a1226702@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1226795, 'BIANCA YERELINE', 'SANCHEZ', 'SOTO', 'yereline.sanchez@uabc.edu.mx', '', '2014-2', '2020-2', '', '', '', ''),
(1227444, 'EDGAR', 'TAPIA', 'JIMÉNEZ', 'tapia.edgar5@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1227914, 'ROCHELLE NICOLLE', 'REYES', 'UDASCO', 'rochelle.reyes@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1227952, 'BRALLAN AXEL', 'DOMÍNGUEZ', 'LÓPEZ', 'brallan.dominguez@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1228153, 'ROBERTO', 'SEVILLA', 'VARELA', 'roberto.sevilla.varela@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1228338, 'MARIA DEL ROSARIO', 'SANCHEZ', 'GARCIA', 'sanchezm78@uabc.edu.mx', '', '2014-2', '2019-1', '', '', '', ''),
(1229127, 'MARIESLI', 'LAVENANT', 'SANCHEZ', 'mariesli.lavenant@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1229558, 'ALEXIS MANUEL', 'GUTIERREZ', 'KINTO', 'gutierrez.alexis85@uabc.edu.mx', '', '2014-2', '2020-2', '', '', '', ''),
(1229948, 'EDGAR ALBERTO', 'BETANCOURT', 'JUAREZ', 'alberto.betancourt@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1230053, 'MAXIMILIANO ALEJANDRO', 'VILLELA', 'PAULIN', 'mvillela@uabc.edu.mx', '', '2014-1', '2021-1', '', '', '', ''),
(1230078, 'LESLIE', 'GUTIERREZ', 'BARAJAS', 'lgutierrez7@uabc.edu.mx', '', '2015-1', '2020-1', '', '', '', ''),
(1230477, 'BRYAN ISAURO', 'SILVA', 'REYNOSO', 'bryan.silva@uabc.edu.mx', '', '2014-2', '2021-1', '', '', '', ''),
(1230589, 'MONSERRAT', 'CORTES', 'HERRERA', 'mcortes26@uabc.edu.mx', '', '2015-1', '2020-1', '', '', '', ''),
(1230591, 'CARLOS MANUEL', 'PARRA', 'ALMANZA', 'a1230591@uabc.edu.mx', '', '2015-1', '2021-1', '', '', '', ''),
(1231098, 'IVAN ALFREDO', 'MORALES', 'ROSALES', 'imorales13@uabc.edu.mx', '', '2015-1', '2021-2', '', '', '', ''),
(1231366, 'GLORIA LORENA', 'CAMACHO', 'LÓPEZ', 'lcamacho32@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1232092, 'OSCAR AUGUSTO', 'MARTINEZ', 'SALINAS', 'oscar.martinez42@uabc.edu.mx', '', '2014-2', '2021-1', '', '', '', ''),
(1232312, 'MIRIAM DENISSE', 'NEVAREZ', 'MARTÍNEZ', 'denisse.nevarez@uabc.edu.mx', '', '2014-2', '2018-2', '', '', '', ''),
(1234226, 'EFRAIN', 'SEGOVIANO', 'SOLEDAD', 'efrain.segoviano@uabc.edu.mx', '', '2015-1', '2019-2', '', '', '', ''),
(1234550, 'SOFIA YANELI', 'MENDIAS', 'SANCHEZ', 'yaneli.mendias@uabc.edu.mx', '', '2015-2', '2020-1', '', '', '', ''),
(1234627, 'HAOLIN', 'HONG', '', 'a1234627@uabc.edu.mx', '', '2016-1', '2022-1', '', '', '', ''),
(1235197, 'LEONARDO DAVID', 'AGUILAR', 'CONTRERAS', 'leonardo.david.aguilar.contreras@uabc.edu.mx', '', '2015-2', '2021-1', '', '', '', ''),
(1235788, 'EDGAR ALBERTO', 'CHAGALA', 'JIMENEZ', 'alberto.chagala@uabc.edu.mx', '', '2015-2', '2021-1', '', '', '', ''),
(1235877, 'ARTURO', 'VIRUETE', 'GUTIERREZ', 'arturo.viruete@uabc.edu.mx', '', '2015-2', '2021-2', '', '', '', ''),
(1236301, 'JUNGEUM', 'KIM', '', 'kim.jungeum@uabc.edu.mx', '', '2015-2', '2020-2', '', '', '', ''),
(1238137, 'JORGE ANTONIO', 'MARTINEZ', 'VILLANUEVA', 'amartinez31@uabc.edu.mx', '', '2015-2', '2021-1', '', '', '', ''),
(1238268, 'JESUS ALBERTO', 'JAQUEZ', 'GALVAN', 'alberto.jaquez@uabc.edu.mx', '', '2015-2', '2020-2', '', '', '', ''),
(1239210, 'OSCAR ANDRE', 'PATIÑO', 'GONZALEZ', 'andre.patino@uabc.edu.mx', '', '2015-2', '2020-2', '', '', '', ''),
(1239405, 'ALAN OMAR', 'ROBLEDO', 'LOPEZ', 'alan.omar.robledo.lopez@uabc.edu.mx', '', '2015-2', '2022-1', '', '', '', ''),
(1241805, 'JOSUE ISRAEL', 'VARELA', 'ARENAS', 'josue.varela@uabc.edu.mx', '', '2016-1', '2022-1', '', '', '', ''),
(1242003, 'SALVADOR', 'GONZALEZ', 'BELTRAN', 'salvador.gonzalez.beltran@uabc.edu.mx', '', '2015-2', '2021-1', '', '', '', ''),
(1242780, 'DANIEL OMAR', 'NAJERA', 'DAVILA', 'daniel.najera@uabc.edu.mx', '', '2015-2', '2020-2', '', '', '', ''),
(1244220, 'RACHELLE NERIE', 'REYES', 'UDASCO', 'reyes.rachelle@uabc.edu.mx', '', '2016-2', '2020-2', '', '', '', ''),
(1244393, 'RICARDO', 'CASTAÑON', 'RENTERIA', 'ricardo.castanon@uabc.edu.mx', '', '2016-2', '2021-1', '', '', '', ''),
(1244394, 'BRANDON', 'RAYGOZA', 'DE LA PAZ', 'raygoza.brandon@uabc.edu.mx', '', '2017-1', '2022-1', '', '', '', ''),
(1244809, 'ISAAC', 'HERNANDEZ', 'CANP', 'isaac.hernandez.cano@uabc.edu.mx', '', '2016-2', '2021-2', '', '', '', ''),
(1245064, 'PAMELA ITZELT', 'PEREZ', 'MANRIQUEZ', 'a1245064@uabc.edu.mx', '', '2016-2', '2021-1', '', '', '', ''),
(1245120, 'ANA CRISTINA', 'CAZARES', 'MERAZ', 'CCAZARES8@uabc.edu.mx', '', '2016-2', '2021-1', '', '', '', ''),
(1246720, 'IGNACIO', 'CHAVEZ', 'PADILLA', 'chavez.ignacio@uabc.edu.mx', '', '2016-2', '2020-2', '', '', '', ''),
(1246836, 'SERGIO DANIEL', 'GONZALEZ', 'ORTEGA', 'a1246836@uabc.edu.mx', '', '2016-2', '2021-2', '', '', '', ''),
(1247508, 'GERMAN', 'ADAME', 'COLIN', 'german.adame@uabc.edu.mx', '', '2016-2', '2021-1', '', '', '', ''),
(1247818, 'MONICA MICHEL', 'GONZAGA', 'PATIÑO', 'michel.gonzaga@uabc.edu.mx', '', '2016-2', '2022-1', '', '', '', ''),
(1248593, 'GUILLERMO EUGENIO', 'GUTIERREZ', 'SOTO', 'eugenio.gutierrez@uabc.edu.mx', '', '2016-2', '2022-1', '', '', '', ''),
(1249052, 'JOSE RODRIGO', 'LEAL', 'VAZQUEZ', 'rodrigo.leal@uabc.edu.mx', '', '2016-2', '2022-1', '', '', '', ''),
(1249134, 'DAVID', 'MONCIVAIS', 'MACIEL', 'david.moncivais@uabc.edu.mx', '', '2016-2', '2021-2', '', '', '', ''),
(1249199, 'DIEGO', 'CAUDILLO', 'SANCHEZ', 'diego.caudillo@uabc.edu.mx', '', '2016-2', '2021-1', '', '', '', ''),
(1249508, 'GILBERTO', 'MALDONADO', 'MIGUEL', 'gilberto.maldonado.miguel@uabc.edu.mx', '', '2016-2', '2022-1', '', '', '', ''),
(1249667, 'JOSE LIAM', 'TAPIA', 'OLVERA', 'liam.tapia@uabc.edu.mx', '', '2016-2', '2021-2', '', '', '', ''),
(1252071, 'JESSICA PAMELA', 'ANGUIANO', 'NEGRETE', 'jessica.anguiano@uabc.edu.mx', '', '2017-1', '2021-1', '', '', '', ''),
(1252717, 'RICARDO', 'BANUELOS', 'DE LA TORRE', 'ricardo.banuelos@uabc.edu.mx', '', '2017-2', '2022-1', '', '', '', ''),
(1252771, 'LUIS ALBERTO', 'CRISANTOS', 'USCANGA', 'luis.crisantos@uabc.edu.mx', '', '2017-2', '2022-2', '', '', '', ''),
(1252819, 'SERGIO ENRIQUE', 'GUERRA', 'CERVANTES', 'a1252819@uabc.edu.mx', '', '2017-2', '2020-1', '', '', '', ''),
(1252872, 'LUIS DIEGO', 'ROSAS', 'PARRA', 'a1252872@uabc.edu.mx', '', '2017-2', '2022-1', '', '', '', ''),
(1252892, 'OMAR ANTONIO', 'MONTOYA', 'VALDIVIA', 'montoya.omar@uabc.edu.mx', '', '2017-2', '2022-1', '', '', '', ''),
(1252893, 'VICTOR MANUEL', 'VERA', 'ARIAS', 'victor.vera@uabc.edu.mx', '', '2017-2', '2022-2', '', '', '', ''),
(1253444, 'MIRIAM FERNANDA', 'CRUZ', 'SANCHEZ', 'cruz.miriam@uabc.edu.mx', '', '2017-2', '2022-2', '', '', '', ''),
(1253534, 'ANGEL FERNANDO', 'ESPINOZA', 'ANDRADE', 'a1253534@uabc.edu.mx', '', '2017-2', '2022-2', '', '', '', ''),
(1253779, 'HAOSHENG', 'FENG', '', 'feng.haosheng@uabc.edu.mx', '', '2017-2', '2022-1', '', '', '', ''),
(1254176, 'CLAUDIA ARACELI', 'CRUZ', 'TERRAZAS', 'claudia.araceli.cruz.terrazas@uabc.edu.mx', '', '2017-2', '2022-2', '', '', '', ''),
(1261580, 'DANIEL ADLAI', 'CARMONA', 'MOLINA', 'adlai.carmona@uabc.edu.mx', '', '2018-2', '2022-2', '', '', '', ''),
(1261795, 'ROBERTO', 'CRUZ', 'BETANCOURT', 'roberto.cruz.betancourt@uabc.edu.mx', '', '2018-2', '2022-2', '', '', '', ''),
(1262006, 'PAUL', 'GARCIA', 'GALEANA', 'paul.garcia.galeana@uabc.edu.mx', '', '2018-2', '2022-2', '', '', '', ''),
(1262509, 'ARELI', 'CAPISTRAN', 'MARTINEZ', 'capistran.areli@uabc.edu.mx', '', '2018-2', '2022-2', '', '', '', '');

--
-- Disparadores `alumni`
--
DELIMITER $$
CREATE TRIGGER `trg_alumni_create_account` AFTER INSERT ON `alumni` FOR EACH ROW BEGIN
    INSERT INTO cuentas (Usuario, Contrasena, Primer_acceso)
    VALUES (NEW.correoI, NEW.matricula, 0);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_alumni_delete_account` BEFORE DELETE ON `alumni` FOR EACH ROW BEGIN
    DELETE FROM cuentas
    WHERE Usuario = OLD.correoI;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `Id_Cuenta` int(11) NOT NULL,
  `Usuario` varchar(255) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Primer_acceso` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`Id_Cuenta`, `Usuario`, `Contrasena`, `Primer_acceso`) VALUES
(1, 'a1226702@uabc.edu.mx', '1226702', 0),
(2, 'a1230591@uabc.edu.mx', '1230591', 0),
(3, 'a1234627@uabc.edu.mx', '1234627', 0),
(4, 'a1245064@uabc.edu.mx', '1245064', 0),
(5, 'a1246836@uabc.edu.mx', '1246836', 0),
(6, 'a1252819@uabc.edu.mx', '1252819', 0),
(7, 'a1252872@uabc.edu.mx', '1252872', 0),
(8, 'a1253534@uabc.edu.mx', '1253534', 0),
(9, 'aaron.torres@uabc.edu.mx', '1225272', 0),
(10, 'abraham.medina.carrillo@uabc.edu.mx', '346547', 0),
(11, 'adel.leon@uabc.edu.mx', '1208458', 0),
(12, 'adlai.carmona@uabc.edu.mx', '1261580', 0),
(13, 'alan.omar.robledo.lopez@uabc.edu.mx', '1239405', 0),
(14, 'alanism@uabc.edu.mx', '1208658', 0),
(15, 'alberto.betancourt@uabc.edu.mx', '1229948', 0),
(16, 'alberto.chagala@uabc.edu.mx', '1235788', 0),
(17, 'alberto.jaquez@uabc.edu.mx', '1238268', 0),
(18, 'aldo.silva@uabc.edu.mx', '290179', 0),
(19, 'alejandra.brughera@uabc.edu.mx', '1220619', 0),
(20, 'alejandro.aguilar.vea@uabc.edu.mx', '1220016', 0),
(21, 'amartinez31@uabc.edu.mx', '1238137', 0),
(22, 'andre.patino@uabc.edu.mx', '1239210', 0),
(23, 'angelica.avila@uabc.edu.mx', '1200553', 0),
(24, 'armando.gutierrez5@uabc.edu.mx', '1200271', 0),
(25, 'arreola.arturo@uabc.edu.mx', '1225936', 0),
(26, 'arturo.viruete@uabc.edu.mx', '1235877', 0),
(27, 'berenice.flores@uabc.edu.mx', '1217242', 0),
(28, 'brallan.dominguez@uabc.edu.mx', '1227952', 0),
(29, 'bryan.silva@uabc.edu.mx', '1230477', 0),
(30, 'capistran.areli@uabc.edu.mx', '1262509', 0),
(31, 'carlos.alejandro.gonzalez.ortiz@uabc.edu.mx', '1217280', 0),
(32, 'CCAZARES8@uabc.edu.mx', '1245120', 0),
(33, 'chavez.ignacio@uabc.edu.mx', '1246720', 0),
(34, 'claudia.araceli.cruz.terrazas@uabc.edu.mx', '1254176', 0),
(35, 'cruz.miriam@uabc.edu.mx', '1253444', 0),
(36, 'daniel.herrera.gonzalez@uabc.edu.mx', '1207876', 0),
(37, 'daniel.najera@uabc.edu.mx', '1242780', 0),
(38, 'dante.lopez@uabc.edu.mx', '1217111', 0),
(39, 'david.moncivais@uabc.edu.mx', '1249134', 0),
(40, 'delacruz.carlos@uabc.edu.mx', '1217266', 0),
(41, 'denisse.nevarez@uabc.edu.mx', '1232312', 0),
(42, 'diego.caudillo@uabc.edu.mx', '1249199', 0),
(43, 'efrain.segoviano@uabc.edu.mx', '1234226', 0),
(44, 'emmanuel.moran@uabc.edu.mx', '1216638', 0),
(45, 'emmanuel.nuno.estrella@uabc.edu.mx', '1208750', 0),
(46, 'eneida.espinoza@uabc.edu.mx', '1200315', 0),
(47, 'erick.gerardo.gonzalez.cardiel@uabc.edu.mx', '1226679', 0),
(48, 'eugenio.gutierrez@uabc.edu.mx', '1248593', 0),
(49, 'feng.haosheng@uabc.edu.mx', '1253779', 0),
(50, 'flores.saul@uabc.edu.mx', '1217102', 0),
(51, 'german.adame@uabc.edu.mx', '1247508', 0),
(52, 'gilberto.maldonado.miguel@uabc.edu.mx', '1249508', 0),
(53, 'guillermo.leon.barrios@uabc.edu.mx', '1226489', 0),
(54, 'gustavo.leyva@uabc.edu.mx', '1200429', 0),
(55, 'gutierrez.alexis85@uabc.edu.mx', '1229558', 0),
(56, 'imorales13@uabc.edu.mx', '1231098', 0),
(57, 'isaac.hernandez.cano@uabc.edu.mx', '1244809', 0),
(58, 'jessica.anguiano@uabc.edu.mx', '1252071', 0),
(59, 'jesus.trinidad@uabc.edu.mx', '1208846', 0),
(60, 'jimenez.paul@uabc.edu.mx', '1216621', 0),
(61, 'jose.bolanos@uabc.edu.mx', '1208529', 0),
(62, 'josue.varela@uabc.edu.mx', '1241805', 0),
(63, 'kim.jungeum@uabc.edu.mx', '1236301', 0),
(64, 'lcamacho32@uabc.edu.mx', '1231366', 0),
(65, 'leonardo.david.aguilar.contreras@uabc.edu.mx', '1235197', 0),
(66, 'leonardo.melendez@uabc.edu.mx', '1222324', 0),
(67, 'lgutierrez7@uabc.edu.mx', '1230078', 0),
(68, 'li.chon@uabc.edu.mx', '1208520', 0),
(69, 'liam.tapia@uabc.edu.mx', '1249667', 0),
(70, 'luis.crisantos@uabc.edu.mx', '1252771', 0),
(71, 'luis.encinas@uabc.edu.mx', '1217249', 0),
(72, 'luis.gonzalez15@uabc.edu.mx', '1217258', 0),
(73, 'luis.picazarri@uabc.edu.mx', '1216845', 0),
(74, 'magdalena.bravo@uabc.edu.mx', '1214623', 0),
(75, 'mariesli.lavenant@uabc.edu.mx', '1229127', 0),
(76, 'martin.arevalos@uabc.edu.mx', '1216693', 0),
(77, 'mcortes26@uabc.edu.mx', '1230589', 0),
(78, 'michel.gonzaga@uabc.edu.mx', '1247818', 0),
(79, 'miguel.robledo@uabc.edu.mx', '1208767', 0),
(80, 'montoya.omar@uabc.edu.mx', '1252892', 0),
(81, 'mvillela@uabc.edu.mx', '1230053', 0),
(82, 'nevarez.arturo@uabc.edu.mx', '1216790', 0),
(83, 'osbaldo.reyes@uabc.edu.mx', '1208610', 0),
(84, 'oscar.islas@uabc.edu.mx', '1217113', 0),
(85, 'oscar.martinez42@uabc.edu.mx', '1232092', 0),
(86, 'palacio.luis@uabc.edu.mx', '1221858', 0),
(87, 'paul.garcia.galeana@uabc.edu.mx', '1262006', 0),
(88, 'quintero.cristina@uabc.edu.mx', '1216718', 0),
(89, 'raygoza.brandon@uabc.edu.mx', '1244394', 0),
(90, 'reyes.rachelle@uabc.edu.mx', '1244220', 0),
(91, 'ricardo.banuelos@uabc.edu.mx', '1252717', 0),
(92, 'ricardo.castanon@uabc.edu.mx', '1244393', 0),
(93, 'ricardo.castro27@uabc.edu.mx', '1217169', 0),
(94, 'roberto.cruz.betancourt@uabc.edu.mx', '1261795', 0),
(95, 'roberto.sevilla.varela@uabc.edu.mx', '1228153', 0),
(96, 'rochelle.reyes@uabc.edu.mx', '1227914', 0),
(97, 'rodrigo.leal@uabc.edu.mx', '1249052', 0),
(98, 'rpalafox@uabc.edu.mx', '1224684', 0),
(99, 'salvador.gonzalez.beltran@uabc.edu.mx', '1242003', 0),
(100, 'salvador.zaragoza@uabc.edu.mx', '1217075', 0),
(101, 'sanchezm78@uabc.edu.mx', '1228338', 0),
(102, 'sergio.jimenez@uabc.edu.mx', '1208411', 0),
(103, 'tapia.edgar5@uabc.edu.mx', '1227444', 0),
(104, 'uriel.cebreros@uabc.edu.mx', '1217167', 0),
(105, 'valdez.gabriel@uabc.edu.mx', '1208408', 0),
(106, 'victor.aaron.sanchez.quiroz@uabc.edu.mx', '1208908', 0),
(107, 'victor.barcenas@uabc.edu.mx', '1220995', 0),
(108, 'victor.vera@uabc.edu.mx', '1252893', 0),
(109, 'vlopez44@uabc.edu.mx', '1208369', 0),
(110, 'yair.castrejon@uabc.edu.mx', '1217306', 0),
(111, 'yaneli.mendias@uabc.edu.mx', '1234550', 0),
(112, 'yereline.sanchez@uabc.edu.mx', '1226795', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_admin`
--

CREATE TABLE `cuentas_admin` (
  `Id_Cuenta` int(11) NOT NULL,
  `Usuario` varchar(255) NOT NULL,
  `Contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuentas_admin`
--

INSERT INTO `cuentas_admin` (`Id_Cuenta`, `Usuario`, `Contrasena`) VALUES
(1, 'Admin', 'admin123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`Matricula`),
  ADD UNIQUE KEY `unique_CorreoI` (`CorreoI`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`Id_Cuenta`),
  ADD KEY `Usuario` (`Usuario`);

--
-- Indices de la tabla `cuentas_admin`
--
ALTER TABLE `cuentas_admin`
  ADD PRIMARY KEY (`Id_Cuenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `Id_Cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT de la tabla `cuentas_admin`
--
ALTER TABLE `cuentas_admin`
  MODIFY `Id_Cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `alumni` (`CorreoI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
