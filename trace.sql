-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2023 a las 12:22:04
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
  `Id_Cuenta` int(11) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `ApellidoP` varchar(255) DEFAULT NULL,
  `ApellidoM` varchar(255) DEFAULT NULL,
  `CorreoI` varchar(255) DEFAULT NULL,
  `CorreoP` varchar(255) DEFAULT NULL,
  `FechaIng` varchar(255) DEFAULT NULL,
  `FechaEgreso` varchar(255) DEFAULT NULL,
  `Compania` varchar(255) DEFAULT NULL,
  `Puesto` varchar(255) DEFAULT NULL,
  `GeoLocationName` varchar(255) DEFAULT NULL,
  `GeoCountryName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumni`
--

INSERT INTO `alumni` (`Matricula`, `Id_Cuenta`, `Nombre`, `ApellidoP`, `ApellidoM`, `CorreoI`, `CorreoP`, `FechaIng`, `FechaEgreso`, `Compania`, `Puesto`, `GeoLocationName`, `GeoCountryName`) VALUES
(290179, 100, 'ALDO ANDRE', 'SILVA', 'LUNA', 'aldo.silva@uabc.edu.mx', '', '2011-1', '2019-1', '', '', '', ''),
(346547, 17, 'ABRAHAM', 'MEDINA', 'CARRILLO', 'abraham.medina.carrillo@uabc.edu.mx', '', '2016-2', '2022-1', '', '', '', ''),
(1200271, 108, 'JOSE ARMANDO', 'GUTI?RREZ', 'N??EZ', 'armando.gutierrez5@uabc.edu.mx', '', '2011-2', '2018-2', '', '', '', ''),
(1200315, 106, 'ENEIDA GUILLERMINA', 'ESPINOZA', 'RAMIREZ', 'eneida.espinoza@uabc.edu.mx', '', '2012-1', '2018-2', '', '', '', ''),
(1200429, 89, 'GUSTAVO', 'LEYVA', 'HERNANDEZ', 'gustavo.leyva@uabc.edu.mx', '', '2012-1', '2019-2', '', '', '', ''),
(1200553, 70, 'ANGELICA JAZMIN', 'AVILA', 'HUIZAR', 'angelica.avila@uabc.edu.mx', '', '2011-2', '2019-1', '', '', '', ''),
(1207876, 109, 'DANIEL', 'HERRERA', 'GONZALEZ', 'daniel.herrera.gonzalez@uabc.edu.mx', '', '2012-1', '2018-2', '', '', '', ''),
(1208369, 111, 'VICTOR ENRIQUE', 'L?PEZ', 'MALDONADO', 'vlopez44@uabc.edu.mx', '', '2012-2', '2018-2', '', '', '', ''),
(1208408, 103, 'GABRIEL', 'VALDEZ', 'TOPETE', 'valdez.gabriel@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1208411, 110, 'SERGIO ANTONIO', 'JIMENEZ', 'HERNANDEZ', 'sergio.jimenez@uabc.edu.mx', '', '2012-2', '2018-2', '', '', '', ''),
(1208458, 88, 'JESUS ADEL', 'LEON', 'ORTIZ', 'adel.leon@uabc.edu.mx', '', '2012-2', '2019-1', '', '', '', ''),
(1208520, 78, 'SHUNG LI', 'CHON', 'AGUIAR', 'li.chon@uabc.edu.mx', '', '2013-1', '2019-2', '', '', '', ''),
(1208529, 105, 'JOSE CARLOS', 'BOLA?OS', 'MARQUEZ', 'jose.bolanos@uabc.edu.mx', '', '2012-2', '2018-2', '', '', '', ''),
(1208610, 94, 'RUBEN OSBALDO', 'REYES', 'RIVERA', 'osbaldo.reyes@uabc.edu.mx', '', '2012-2', '2019-1', '', '', '', ''),
(1208658, 67, 'MANUEL ANTONIO', 'ALANIS', 'CARRILLO', 'alanism@uabc.edu.mx', '', '2013-1', '2019-1', '', '', '', ''),
(1208750, 64, 'EMMANUEL', 'NU?O', 'ESTRELLA', 'emmanuel.nuno.estrella@uabc.edu.mx', '', '2012-2', '2020-1', '', '', '', ''),
(1208767, 65, 'MIGUEL ALEXANDRO', 'ROBLEDO', 'GONZALEZ', 'miguel.robledo@uabc.edu.mx', '', '2012-2', '2020-1', '', '', '', ''),
(1208846, 102, 'JESUS ALBERTO', 'TRINIDAD', 'GARCIA', 'jesus.trinidad@uabc.edu.mx', '', '2012-2', '2019-1', '', '', '', ''),
(1208908, 97, 'VICTOR AARON', 'SANCHEZ', 'QUIROZ', 'victor.aaron.sanchez.quiroz@uabc.edu.mx', '', '2013-1', '2019-2', '', '', '', ''),
(1214623, 73, 'MAGDALENA CONCEPCI?N', 'BRAVO', 'GONZALEZ', 'magdalena.bravo@uabc.edu.mx', '', '2014-2', '2019-1', '', '', '', ''),
(1216621, 86, 'PAUL', 'JIM?NEZ', 'FRANCO', 'jimenez.paul@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1216638, 91, 'JOSE EMMANUEL', 'MORAN', 'CARRILLO', 'emmanuel.moran@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1216693, 68, 'FRANCISCO MARTIN', 'AREVALOS', 'FERNANDEZ', 'martin.arevalos@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1216718, 29, 'CRISTINA', 'QUINTERO', 'MARIN', 'quintero.cristina@uabc.edu.mx', '', '2014-1', '2021-2', '', '', '', ''),
(1216790, 92, 'ARTURO', 'NEVAREZ', 'VILLA', 'nevarez.arturo@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1216845, 93, 'LUIS ANTONIO', 'PICAZARRI', 'QUINTANA', 'luis.picazarri@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1217075, 104, 'SALVADOR', 'ZARAGOZA', 'GARCIA', 'salvador.zaragoza@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1217102, 59, 'SAUL IVAN', 'FLORES', 'TORRES COTO', 'flores.saul@uabc.edu.mx', '', '2013-2', '2020-1', '', '', '', ''),
(1217111, 90, 'ORLANDO DANTE', 'LOPEZ', 'MORENO', 'dante.lopez@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1217113, 85, 'OSCAR', 'ISLAS', 'OLIVER', 'oscar.islas@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1217167, 77, 'ARGENIS URIEL', 'CEBREROS', 'CARRILLO', 'uriel.cebreros@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1217169, 76, 'RICARDO', 'CASTRO', 'GONZALES', 'ricardo.castro27@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1217242, 82, 'BERENICE', 'FLORES', 'SALGADO', 'berenice.flores@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1217249, 81, 'LUIS GERARDO', 'ENCINAS', 'RAMOS', 'luis.encinas@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1217258, 84, 'LUIS ENRIQUE', 'GONZALEZ', 'CARDIEL', 'luis.gonzalez15@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1217266, 79, 'CARLOS JAVIER', 'DE LA CRUZ', 'LOPEZ', 'delacruz.carlos@uabc.edu.mx', '', '2013-2', '2019-1', '', '', '', ''),
(1217280, 60, 'CARLOS ALEJANDRO', 'GONZALEZ', 'ORTIZ', 'carlos.alejandro.gonzalez.ortiz@uabc.edu.mx', '', '2014-1', '2020-1', '', '', '', ''),
(1217306, 75, 'YAIR EDUARDO', 'CASTREJ?N', 'MART?NEZ', 'yair.castrejon@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1220016, 1, 'ALEJANDRO', 'AGUILAR', 'VEA', 'alejandro.aguilar.vea@uabc.edu.mx', '', '2015-1', '2022-2', '', '', '', ''),
(1220619, 57, 'MARIA ALEJANDRA', 'BRUGHERA', 'PEREZ', 'alejandra.brughera@uabc.edu.mx', '', '2014-2', '2020-1', '', '', '', ''),
(1220995, 71, 'VICTOR', 'BARCENAS', 'BURGOS', 'victor.barcenas@uabc.edu.mx', '', '2013-2', '2019-2', '', '', '', ''),
(1221858, 48, 'LUIS MAURICIO', 'PALACIO', 'RENTERIA', 'palacio.luis@uabc.edu.mx', '', '2013-2', '2021-1', '', '', '', ''),
(1222324, 18, 'LEONARDO', 'MELENDEZ', 'LINEROS', 'leonardo.melendez@uabc.edu.mx', '', '2017-2', '2022-2', '', '', '', ''),
(1224684, 49, 'RAMSSES', 'PALAFOX', 'BALLARDO', 'rpalafox@uabc.edu.mx', '', '2014-2', '2020-2', '', '', '', ''),
(1225272, 66, 'AAR?N ISAAC', 'TORRES', 'AVALOS', 'aaron.torres@uabc.edu.mx', '', '2014-1', '2020-1', '', '', '', ''),
(1225936, 69, 'ARTURO', 'ARREOLA', 'ALVAREZ', 'arreola.arturo@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1226489, 44, 'GUILLERMO', 'LEON', 'BARRIOS', 'guillermo.leon.barrios@uabc.edu.mx', '', '2014-2', '2021-1', '', '', '', ''),
(1226679, 107, 'ERICK GERARDO', 'GONZALEZ', 'CARDIEL', 'erick.gerardo.gonzalez.cardiel@uabc.edu.mx', '', '2014-2', '2018-2', '', '', '', ''),
(1226702, 83, 'JOSE ISABEL', 'GARCIA', 'ROCHA', 'a1226702@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1226795, 54, 'BIANCA YERELINE', 'SANCHEZ', 'SOTO', 'yereline.sanchez@uabc.edu.mx', '', '2014-2', '2020-2', '', '', '', ''),
(1227444, 101, 'EDGAR', 'TAPIA', 'JIM?NEZ', 'tapia.edgar5@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1227914, 95, 'ROCHELLE NICOLLE', 'REYES', 'UDASCO', 'rochelle.reyes@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1227952, 80, 'BRALLAN AXEL', 'DOM?NGUEZ', 'L?PEZ', 'brallan.dominguez@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1228153, 99, 'ROBERTO', 'SEVILLA', 'VARELA', 'roberto.sevilla.varela@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1228338, 96, 'MARIA DEL ROSARIO', 'SANCHEZ', 'GARCIA', 'sanchezm78@uabc.edu.mx', '', '2014-2', '2019-1', '', '', '', ''),
(1229127, 87, 'MARIESLI', 'LAVENANT', 'SANCHEZ', 'mariesli.lavenant@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1229558, 41, 'ALEXIS MANUEL', 'GUTIERREZ', 'KINTO', 'gutierrez.alexis85@uabc.edu.mx', '', '2014-2', '2020-2', '', '', '', ''),
(1229948, 72, 'EDGAR ALBERTO', 'BETANCOURT', 'JUAREZ', 'alberto.betancourt@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1230053, 56, 'MAXIMILIANO ALEJANDRO', 'VILLELA', 'PAULIN', 'mvillela@uabc.edu.mx', '', '2014-1', '2021-1', '', '', '', ''),
(1230078, 62, 'LESLIE', 'GUTIERREZ', 'BARAJAS', 'lgutierrez7@uabc.edu.mx', '', '2015-1', '2020-1', '', '', '', ''),
(1230477, 55, 'BRYAN ISAURO', 'SILVA', 'REYNOSO', 'bryan.silva@uabc.edu.mx', '', '2014-2', '2021-1', '', '', '', ''),
(1230589, 58, 'MONSERRAT', 'CORTES', 'HERRERA', 'mcortes26@uabc.edu.mx', '', '2015-1', '2020-1', '', '', '', ''),
(1230591, 50, 'CARLOS MANUEL', 'PARRA', 'ALMANZA', 'a1230591@uabc.edu.mx', '', '2015-1', '2021-1', '', '', '', ''),
(1231098, 28, 'IVAN ALFREDO', 'MORALES', 'ROSALES', 'imorales13@uabc.edu.mx', '', '2015-1', '2021-2', '', '', '', ''),
(1231366, 74, 'GLORIA LORENA', 'CAMACHO', 'L?PEZ', 'lcamacho32@uabc.edu.mx', '', '2014-2', '2019-2', '', '', '', ''),
(1232092, 45, 'OSCAR AUGUSTO', 'MARTINEZ', 'SALINAS', 'oscar.martinez42@uabc.edu.mx', '', '2014-2', '2021-1', '', '', '', ''),
(1232312, 112, 'MIRIAM DENISSE', 'NEVAREZ', 'MART?NEZ', 'denisse.nevarez@uabc.edu.mx', '', '2014-2', '2018-2', '', '', '', ''),
(1234226, 98, 'EFRAIN', 'SEGOVIANO', 'SOLEDAD', 'efrain.segoviano@uabc.edu.mx', '', '2015-1', '2019-2', '', '', '', ''),
(1234550, 63, 'SOFIA YANELI', 'MENDIAS', 'SANCHEZ', 'yaneli.mendias@uabc.edu.mx', '', '2015-2', '2020-1', '', '', '', ''),
(1234627, 14, 'HAOLIN', 'HONG', '', 'a1234627@uabc.edu.mx', '', '2016-1', '2022-1', '', '', '', ''),
(1235197, 33, 'LEONARDO DAVID', 'AGUILAR', 'CONTRERAS', 'leonardo.david.aguilar.contreras@uabc.edu.mx', '', '2015-2', '2021-1', '', '', '', ''),
(1235788, 38, 'EDGAR ALBERTO', 'CHAGALA', 'JIMENEZ', 'alberto.chagala@uabc.edu.mx', '', '2015-2', '2021-1', '', '', '', ''),
(1235877, 31, 'ARTURO', 'VIRUETE', 'GUTIERREZ', 'arturo.viruete@uabc.edu.mx', '', '2015-2', '2021-2', '', '', '', ''),
(1236301, 43, 'JUNGEUM', 'KIM', '', 'kim.jungeum@uabc.edu.mx', '', '2015-2', '2020-2', '', '', '', ''),
(1238137, 46, 'JORGE ANTONIO', 'MARTINEZ', 'VILLANUEVA', 'amartinez31@uabc.edu.mx', '', '2015-2', '2021-1', '', '', '', ''),
(1238268, 42, 'JESUS ALBERTO', 'JAQUEZ', 'GALVAN', 'alberto.jaquez@uabc.edu.mx', '', '2015-2', '2020-2', '', '', '', ''),
(1239210, 51, 'OSCAR ANDRE', 'PATI?O', 'GONZALEZ', 'andre.patino@uabc.edu.mx', '', '2015-2', '2020-2', '', '', '', ''),
(1239405, 21, 'ALAN OMAR', 'ROBLEDO', 'LOPEZ', 'alan.omar.robledo.lopez@uabc.edu.mx', '', '2015-2', '2022-1', '', '', '', ''),
(1241805, 23, 'JOSUE ISRAEL', 'VARELA', 'ARENAS', 'josue.varela@uabc.edu.mx', '', '2016-1', '2022-1', '', '', '', ''),
(1242003, 40, 'SALVADOR', 'GONZALEZ', 'BELTRAN', 'salvador.gonzalez.beltran@uabc.edu.mx', '', '2015-2', '2021-1', '', '', '', ''),
(1242780, 47, 'DANIEL OMAR', 'NAJERA', 'DAVILA', 'daniel.najera@uabc.edu.mx', '', '2015-2', '2020-2', '', '', '', ''),
(1244220, 53, 'RACHELLE NERIE', 'REYES', 'UDASCO', 'reyes.rachelle@uabc.edu.mx', '', '2016-2', '2020-2', '', '', '', ''),
(1244393, 35, 'RICARDO', 'CASTA?ON', 'RENTERIA', 'ricardo.castanon@uabc.edu.mx', '', '2016-2', '2021-1', '', '', '', ''),
(1244394, 20, 'BRANDON', 'RAYGOZA', 'DE LA PAZ', 'raygoza.brandon@uabc.edu.mx', '', '2017-1', '2022-1', '', '', '', ''),
(1244809, 26, 'ISAAC', 'HERNANDEZ', 'CANP', 'isaac.hernandez.cano@uabc.edu.mx', '', '2016-2', '2021-2', '', '', '', ''),
(1245064, 52, 'PAMELA ITZELT', 'PEREZ', 'MANRIQUEZ', 'a1245064@uabc.edu.mx', '', '2016-2', '2021-1', '', '', '', ''),
(1245120, 37, 'ANA CRISTINA', 'CAZARES', 'MERAZ', 'CCAZARES8@uabc.edu.mx', '', '2016-2', '2021-1', '', '', '', ''),
(1246720, 39, 'IGNACIO', 'CHAVEZ', 'PADILLA', 'chavez.ignacio@uabc.edu.mx', '', '2016-2', '2020-2', '', '', '', ''),
(1246836, 25, 'SERGIO DANIEL', 'GONZALEZ', 'ORTEGA', 'a1246836@uabc.edu.mx', '', '2016-2', '2021-2', '', '', '', ''),
(1247508, 32, 'GERMAN', 'ADAME', 'COLIN', 'german.adame@uabc.edu.mx', '', '2016-2', '2021-1', '', '', '', ''),
(1247818, 12, 'MONICA MICHEL', 'GONZAGA', 'PATI?O', 'michel.gonzaga@uabc.edu.mx', '', '2016-2', '2022-1', '', '', '', ''),
(1248593, 13, 'GUILLERMO EUGENIO', 'GUTIERREZ', 'SOTO', 'eugenio.gutierrez@uabc.edu.mx', '', '2016-2', '2022-1', '', '', '', ''),
(1249052, 15, 'JOSE RODRIGO', 'LEAL', 'VAZQUEZ', 'rodrigo.leal@uabc.edu.mx', '', '2016-2', '2022-1', '', '', '', ''),
(1249134, 27, 'DAVID', 'MONCIVAIS', 'MACIEL', 'david.moncivais@uabc.edu.mx', '', '2016-2', '2021-2', '', '', '', ''),
(1249199, 36, 'DIEGO', 'CAUDILLO', 'SANCHEZ', 'diego.caudillo@uabc.edu.mx', '', '2016-2', '2021-1', '', '', '', ''),
(1249508, 16, 'GILBERTO', 'MALDONADO', 'MIGUEL', 'gilberto.maldonado.miguel@uabc.edu.mx', '', '2016-2', '2022-1', '', '', '', ''),
(1249667, 30, 'JOSE LIAM', 'TAPIA', 'OLVERA', 'liam.tapia@uabc.edu.mx', '', '2016-2', '2021-2', '', '', '', ''),
(1252071, 34, 'JESSICA PAMELA', 'ANGUIANO', 'NEGRETE', 'jessica.anguiano@uabc.edu.mx', '', '2017-1', '2021-1', '', '', '', ''),
(1252717, 2, 'RICARDO', 'BANUELOS', 'DE LA TORRE', 'ricardo.banuelos@uabc.edu.mx', '', '2017-2', '2022-1', '', '', '', ''),
(1252771, 5, 'LUIS ALBERTO', 'CRISANTOS', 'USCANGA', 'luis.crisantos@uabc.edu.mx', '', '2017-2', '2022-2', '', '', '', ''),
(1252819, 61, 'SERGIO ENRIQUE', 'GUERRA', 'CERVANTES', 'a1252819@uabc.edu.mx', '', '2017-2', '2020-1', '', '', '', ''),
(1252872, 22, 'LUIS DIEGO', 'ROSAS', 'PARRA', 'a1252872@uabc.edu.mx', '', '2017-2', '2022-1', '', '', '', ''),
(1252892, 19, 'OMAR ANTONIO', 'MONTOYA', 'VALDIVIA', 'montoya.omar@uabc.edu.mx', '', '2017-2', '2022-1', '', '', '', ''),
(1252893, 24, 'VICTOR MANUEL', 'VERA', 'ARIAS', 'victor.vera@uabc.edu.mx', '', '2017-2', '2022-2', '', '', '', ''),
(1253444, 7, 'MIRIAM FERNANDA', 'CRUZ', 'SANCHEZ', 'cruz.miriam@uabc.edu.mx', '', '2017-2', '2022-2', '', '', '', ''),
(1253534, 9, 'ANGEL FERNANDO', 'ESPINOZA', 'ANDRADE', 'a1253534@uabc.edu.mx', '', '2017-2', '2022-2', '', '', '', ''),
(1253779, 10, 'HAOSHENG', 'FENG', '', 'feng.haosheng@uabc.edu.mx', '', '2017-2', '2022-1', '', '', '', ''),
(1254176, 8, 'CLAUDIA ARACELI', 'CRUZ', 'TERRAZAS', 'claudia.araceli.cruz.terrazas@uabc.edu.mx', '', '2017-2', '2022-2', '', '', '', ''),
(1261580, 4, 'DANIEL ADLAI', 'CARMONA', 'MOLINA', 'adlai.carmona@uabc.edu.mx', '', '2018-2', '2022-2', '', '', '', ''),
(1261795, 6, 'ROBERTO', 'CRUZ', 'BETANCOURT', 'roberto.cruz.betancourt@uabc.edu.mx', '', '2018-2', '2022-2', '', '', '', ''),
(1262006, 11, 'PAUL', 'GARCIA', 'GALEANA', 'paul.garcia.galeana@uabc.edu.mx', '', '2018-2', '2022-2', '', '', '', ''),
(1262509, 3, 'ARELI', 'CAPISTRAN', 'MARTINEZ', 'capistran.areli@uabc.edu.mx', '', '2018-2', '2022-2', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `Id_Cuenta` int(11) NOT NULL,
  `Usuario` varchar(255) DEFAULT NULL,
  `Contrasena` varchar(255) DEFAULT NULL,
  `Primer_acceso` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`Id_Cuenta`, `Usuario`, `Contrasena`, `Primer_acceso`) VALUES
(1, 'alejandro.aguilar.vea@uabc.edu.mx', '1220016', 0),
(2, 'ricardo.banuelos@uabc.edu.mx', '1252717', 0),
(3, 'capistran.areli@uabc.edu.mx', '1262509', 0),
(4, 'adlai.carmona@uabc.edu.mx', '1261580', 0),
(5, 'luis.crisantos@uabc.edu.mx', '1252771', 0),
(6, 'roberto.cruz.betancourt@uabc.edu.mx', '1261795', 0),
(7, 'cruz.miriam@uabc.edu.mx', '1253444', 0),
(8, 'claudia.araceli.cruz.terrazas@uabc.edu.mx', '1254176', 0),
(9, 'a1253534@uabc.edu.mx', '1253534', 0),
(10, 'feng.haosheng@uabc.edu.mx', '1253779', 0),
(11, 'paul.garcia.galeana@uabc.edu.mx', '1262006', 0),
(12, 'michel.gonzaga@uabc.edu.mx', '1247818', 0),
(13, 'eugenio.gutierrez@uabc.edu.mx', '1248593', 0),
(14, 'a1234627@uabc.edu.mx', '1234627', 0),
(15, 'rodrigo.leal@uabc.edu.mx', '1249052', 0),
(16, 'gilberto.maldonado.miguel@uabc.edu.mx', '1249508', 0),
(17, 'abraham.medina.carrillo@uabc.edu.mx', '346547', 0),
(18, 'leonardo.melendez@uabc.edu.mx', '1222324', 0),
(19, 'montoya.omar@uabc.edu.mx', '1252892', 0),
(20, 'raygoza.brandon@uabc.edu.mx', '1244394', 0),
(21, 'alan.omar.robledo.lopez@uabc.edu.mx', '1239405', 0),
(22, 'a1252872@uabc.edu.mx', '1252872', 0),
(23, 'josue.varela@uabc.edu.mx', '1241805', 0),
(24, 'victor.vera@uabc.edu.mx', '1252893', 0),
(25, 'a1246836@uabc.edu.mx', '1246836', 0),
(26, 'isaac.hernandez.cano@uabc.edu.mx', '1244809', 0),
(27, 'david.moncivais@uabc.edu.mx', '1249134', 0),
(28, 'imorales13@uabc.edu.mx', '1231098', 0),
(29, 'quintero.cristina@uabc.edu.mx', '1216718', 0),
(30, 'liam.tapia@uabc.edu.mx', '1249667', 0),
(31, 'arturo.viruete@uabc.edu.mx', '1235877', 0),
(32, 'german.adame@uabc.edu.mx', '1247508', 0),
(33, 'leonardo.david.aguilar.contreras@uabc.edu.mx', '1235197', 0),
(34, 'jessica.anguiano@uabc.edu.mx', '1252071', 0),
(35, 'ricardo.castanon@uabc.edu.mx', '1244393', 0),
(36, 'diego.caudillo@uabc.edu.mx', '1249199', 0),
(37, 'CCAZARES8@uabc.edu.mx', '1245120', 0),
(38, 'alberto.chagala@uabc.edu.mx', '1235788', 0),
(39, 'chavez.ignacio@uabc.edu.mx', '1246720', 0),
(40, 'salvador.gonzalez.beltran@uabc.edu.mx', '1242003', 0),
(41, 'gutierrez.alexis85@uabc.edu.mx', '1229558', 0),
(42, 'alberto.jaquez@uabc.edu.mx', '1238268', 0),
(43, 'kim.jungeum@uabc.edu.mx', '1236301', 0),
(44, 'guillermo.leon.barrios@uabc.edu.mx', '1226489', 0),
(45, 'oscar.martinez42@uabc.edu.mx', '1232092', 0),
(46, 'amartinez31@uabc.edu.mx', '1238137', 0),
(47, 'daniel.najera@uabc.edu.mx', '1242780', 0),
(48, 'palacio.luis@uabc.edu.mx', '1221858', 0),
(49, 'rpalafox@uabc.edu.mx', '1224684', 0),
(50, 'a1230591@uabc.edu.mx', '1230591', 0),
(51, 'andre.patino@uabc.edu.mx', '1239210', 0),
(52, 'a1245064@uabc.edu.mx', '1245064', 0),
(53, 'reyes.rachelle@uabc.edu.mx', '1244220', 0),
(54, 'yereline.sanchez@uabc.edu.mx', '1226795', 0),
(55, 'bryan.silva@uabc.edu.mx', '1230477', 0),
(56, 'mvillela@uabc.edu.mx', '1230053', 0),
(57, 'alejandra.brughera@uabc.edu.mx', '1220619', 0),
(58, 'mcortes26@uabc.edu.mx', '1230589', 0),
(59, 'flores.saul@uabc.edu.mx', '1217102', 0),
(60, 'carlos.alejandro.gonzalez.ortiz@uabc.edu.mx', '1217280', 0),
(61, 'a1252819@uabc.edu.mx', '1252819', 0),
(62, 'lgutierrez7@uabc.edu.mx', '1230078', 0),
(63, 'yaneli.mendias@uabc.edu.mx', '1234550', 0),
(64, 'emmanuel.nuno.estrella@uabc.edu.mx', '1208750', 0),
(65, 'miguel.robledo@uabc.edu.mx', '1208767', 0),
(66, 'aaron.torres@uabc.edu.mx', '1225272', 0),
(67, 'alanism@uabc.edu.mx', '1208658', 0),
(68, 'martin.arevalos@uabc.edu.mx', '1216693', 0),
(69, 'arreola.arturo@uabc.edu.mx', '1225936', 0),
(70, 'angelica.avila@uabc.edu.mx', '1200553', 0),
(71, 'victor.barcenas@uabc.edu.mx', '1220995', 0),
(72, 'alberto.betancourt@uabc.edu.mx', '1229948', 0),
(73, 'magdalena.bravo@uabc.edu.mx', '1214623', 0),
(74, 'lcamacho32@uabc.edu.mx', '1231366', 0),
(75, 'yair.castrejon@uabc.edu.mx', '1217306', 0),
(76, 'ricardo.castro27@uabc.edu.mx', '1217169', 0),
(77, 'uriel.cebreros@uabc.edu.mx', '1217167', 0),
(78, 'li.chon@uabc.edu.mx', '1208520', 0),
(79, 'delacruz.carlos@uabc.edu.mx', '1217266', 0),
(80, 'brallan.dominguez@uabc.edu.mx', '1227952', 0),
(81, 'luis.encinas@uabc.edu.mx', '1217249', 0),
(82, 'berenice.flores@uabc.edu.mx', '1217242', 0),
(83, 'a1226702@uabc.edu.mx', '1226702', 0),
(84, 'luis.gonzalez15@uabc.edu.mx', '1217258', 0),
(85, 'oscar.islas@uabc.edu.mx', '1217113', 0),
(86, 'jimenez.paul@uabc.edu.mx', '1216621', 0),
(87, 'mariesli.lavenant@uabc.edu.mx', '1229127', 0),
(88, 'adel.leon@uabc.edu.mx', '1208458', 0),
(89, 'gustavo.leyva@uabc.edu.mx', '1200429', 0),
(90, 'dante.lopez@uabc.edu.mx', '1217111', 0),
(91, 'emmanuel.moran@uabc.edu.mx', '1216638', 0),
(92, 'nevarez.arturo@uabc.edu.mx', '1216790', 0),
(93, 'luis.picazarri@uabc.edu.mx', '1216845', 0),
(94, 'osbaldo.reyes@uabc.edu.mx', '1208610', 0),
(95, 'rochelle.reyes@uabc.edu.mx', '1227914', 0),
(96, 'sanchezm78@uabc.edu.mx', '1228338', 0),
(97, 'victor.aaron.sanchez.quiroz@uabc.edu.mx', '1208908', 0),
(98, 'efrain.segoviano@uabc.edu.mx', '1234226', 0),
(99, 'roberto.sevilla.varela@uabc.edu.mx', '1228153', 0),
(100, 'aldo.silva@uabc.edu.mx', '290179', 0),
(101, 'tapia.edgar5@uabc.edu.mx', '1227444', 0),
(102, 'jesus.trinidad@uabc.edu.mx', '1208846', 0),
(103, 'valdez.gabriel@uabc.edu.mx', '1208408', 0),
(104, 'salvador.zaragoza@uabc.edu.mx', '1217075', 0),
(105, 'jose.bolanos@uabc.edu.mx', '1208529', 0),
(106, 'eneida.espinoza@uabc.edu.mx', '1200315', 0),
(107, 'erick.gerardo.gonzalez.cardiel@uabc.edu.mx', '1226679', 0),
(108, 'armando.gutierrez5@uabc.edu.mx', '1200271', 0),
(109, 'daniel.herrera.gonzalez@uabc.edu.mx', '1207876', 0),
(110, 'sergio.jimenez@uabc.edu.mx', '1208411', 0),
(111, 'vlopez44@uabc.edu.mx', '1208369', 0),
(112, 'denisse.nevarez@uabc.edu.mx', '1232312', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`Matricula`),
  ADD KEY `Id_Cuenta` (`Id_Cuenta`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`Id_Cuenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `Id_Cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumni`
--
ALTER TABLE `alumni`
  ADD CONSTRAINT `alumni_ibfk_1` FOREIGN KEY (`Id_Cuenta`) REFERENCES `cuentas` (`Id_Cuenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
