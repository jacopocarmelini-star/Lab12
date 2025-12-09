-- --------------------------------------------------------
-- Database: mountain_paths
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `mountain_paths` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mountain_paths`;

-- Drop tables se già esistono
DROP TABLE IF EXISTS `connessione`;
DROP TABLE IF EXISTS `rifugio`;

-- Creazione tabella rifugio
CREATE TABLE IF NOT EXISTS `rifugio` (
  `id` int(6) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `localita` varchar(100) NOT NULL,
  `altitudine` int(5) NOT NULL,
  `capienza` int(4) NOT NULL,
  `aperto` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserimento rifugi
LOCK TABLES `rifugio` WRITE;
/*!40000 ALTER TABLE `rifugio` DISABLE KEYS */;
INSERT INTO `rifugio` (`id`, `nome`, `localita`, `altitudine`, `capienza`, `aperto`) VALUES
(1, 'Rifugio Aurora', 'Valle Azzurra', 1500, 30, 1),
(2, 'Rifugio Boreale', 'Monti Verdi', 1700, 45, 1),
(3, 'Rifugio Cima', 'Monte Bianco', 2500, 60, 1),
(4, 'Rifugio Daini', 'Valle degli Animali', 1300, 25, 1),
(5, 'Rifugio Eremo', 'Monte Solitario', 2000, 35, 1),
(6, 'Rifugio Faggio', 'Bosco Faggio', 1400, 20, 1),
(7, 'Rifugio Ghiacciaio', 'Valle Fredda', 2700, 50, 1),
(8, 'Rifugio Hibernia', 'Valle Gelata', 2300, 40, 1),
(9, 'Rifugio Isola', 'Lago Grande', 1600, 30, 1),
(10, 'Rifugio Juniper', 'Collina Juniper', 1200, 25, 1),
(11, 'Rifugio Kappa', 'Monte K', 1900, 35, 1),
(12, 'Rifugio Lupo', 'Valle Lupo', 1500, 20, 1),
(13, 'Rifugio Marmotta', 'Monti Rocciosi', 1800, 30, 1),
(14, 'Rifugio Nebbia', 'Valle Nebbiosa', 1600, 25, 1),
(15, 'Rifugio Orso', 'Bosco Orso', 2000, 40, 1),
(16, 'Rifugio Panorama Alto', 'Monte Alto', 2400, 50, 1),
(17, 'Rifugio Quercia', 'Bosco Quercia', 1300, 20, 1),
(18, 'Rifugio Roccia', 'Valle Rocciosa', 1700, 35, 1),
(19, 'Rifugio Stella', 'Colle Stellato', 1900, 30, 1),
(20, 'Rifugio Tiglio', 'Valle dei Tigli', 1500, 25, 1),
(21, 'Rifugio Ulivo', 'Collina Olivata', 1400, 20, 1),
(22, 'Rifugio Vento', 'Valle Ventosa', 2100, 40, 1),
(23, 'Rifugio Zefiro', 'Monte Zefiro', 2300, 45, 1),
(24, 'Rifugio Alpestre', 'Monti Alpestri', 1800, 35, 1),
(25, 'Rifugio Bosco Antico', 'Bosco Antico', 1500, 25, 1),
(26, 'Rifugio Candido', 'Valle Candida', 1700, 30, 1),
(27, 'Rifugio Duna', 'Collina Dune', 1400, 20, 1),
(28, 'Rifugio Edera', 'Bosco Edera', 1600, 25, 1),
(29, 'Rifugio Falco', 'Monti Falco', 2000, 40, 1),
(30, 'Rifugio Ginestra', 'Valle Ginestra', 1500, 30, 1),
(31, 'Rifugio Horizonte', 'Monte Horizonte', 2200, 45, 1),
(32, 'Rifugio Incanto', 'Valle Incantata', 1800, 35, 1),
(33, 'Rifugio Jolly', 'Collina Jolly', 1400, 25, 1),
(34, 'Rifugio Karst', 'Monti Karstici', 2100, 40, 1),
(35, 'Rifugio Lince', 'Valle Lince', 1900, 35, 1),
(36, 'Rifugio Magnolia', 'Bosco Magnolia', 1500, 30, 1),
(37, 'Rifugio Nuvola', 'Colle Nuvoloso', 1700, 25, 1),
(38, 'Rifugio Orizzonte', 'Monte Orizzonte', 2300, 50, 1),
(39, 'Rifugio Pioppo', 'Valle Pioppo', 1400, 20, 1),
(40, 'Rifugio Quota', 'Colle Quota', 1800, 30, 1),
(41, 'Rifugio Rovere', 'Bosco Rovere', 1500, 25, 1),
(42, 'Rifugio Sorgente', 'Valle Sorgente', 1600, 30, 1),
(43, 'Rifugio Tasso', 'Monte Tasso', 2100, 35, 1),
(44, 'Rifugio Uliveto', 'Collina Uliveto', 1400, 25, 1),
(45, 'Rifugio Vetta', 'Monte Vetta', 2400, 50, 1),
(46, 'Rifugio Zolla', 'Valle Zolla', 1300, 20, 1),
(47, 'Rifugio Argento', 'Monte Argento', 2200, 40, 1),
(48, 'Rifugio Betulla', 'Bosco Betulla', 1500, 25, 1),
(49, 'Rifugio Cedro', 'Valle Cedro', 1600, 30, 1),
(50, 'Rifugio Diamante', 'Colle Diamante', 2000, 35, 1);
/*!40000 ALTER TABLE `rifugio` ENABLE KEYS */;
UNLOCK TABLES;

-- Creazione tabella connessione
CREATE TABLE IF NOT EXISTS `connessione` (
  `id` int(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `id_rifugio1` int(6) NOT NULL,
  `id_rifugio2` int(6) NOT NULL,
  `distanza` decimal(5,2) NOT NULL,
  `difficolta` enum('facile','media','difficile') NOT NULL,
  `durata` time NOT NULL,
  `anno` int(4) NOT NULL,
  KEY `id_rifugio1` (`id_rifugio1`),
  KEY `id_rifugio2` (`id_rifugio2`),
  CONSTRAINT `FK_connessione_rifugio1` FOREIGN KEY (`id_rifugio1`) REFERENCES `rifugio` (`id`),
  CONSTRAINT `FK_connessione_rifugio2` FOREIGN KEY (`id_rifugio2`) REFERENCES `rifugio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserimento delle connessioni
LOCK TABLES `connessione` WRITE;
/*!40000 ALTER TABLE `connessione` DISABLE KEYS */;
INSERT INTO `connessione` (`id_rifugio1`, `id_rifugio2`, `distanza`, `difficolta`, `durata`, `anno`) VALUES
(1,2,4.50,'facile','01:20:00',1955),
(1,3,6.00,'media','01:48:00',1958),
(2,4,5.50,'media','01:30:00',1960),
(2,5,7.00,'difficile','02:12:00',1963),
(3,6,4.00,'facile','01:00:00',1965),
(3,7,8.50,'difficile','02:30:00',1966),
(4,8,3.50,'facile','01:00:00',1968),
(5,9,6.00,'media','01:42:00',1969),
(6,10,5.00,'media','01:30:00',1970),
(7,11,7.50,'difficile','02:18:00',1972),
(8,12,4.20,'facile','01:06:00',1973),
(9,13,6.80,'media','02:00:00',1975),
(10,14,5.50,'facile','01:24:00',1977),
(11,15,7.00,'difficile','02:12:00',1978),
(12,16,3.80,'facile','01:00:00',1980),
(13,17,6.20,'media','01:48:00',1982),
(14,18,5.00,'media','01:24:00',1985),
(15,19,7.50,'difficile','02:30:00',1987),
(16,20,4.00,'facile','01:00:00',1989),
(17,21,6.50,'media','02:00:00',1990),
(18,22,5.20,'media','01:30:00',1992),
(19,23,7.00,'difficile','02:12:00',1994),
(20,24,4.50,'facile','01:20:00',1997),
(21,25,6.80,'media','02:00:00',1999),
(22,26,5.50,'media','01:24:00',2000),
(23,27,7.20,'difficile','02:18:00',2002),
(24,28,4.00,'facile','01:00:00',2003),
(25,29,6.50,'media','02:00:00',2005),
(26,30,5.00,'media','01:18:00',2006),
(27,31,7.00,'difficile','02:12:00',2008),
(28,32,4.50,'facile','01:20:00',2009),
(29,33,6.80,'media','02:00:00',2010),
(30,34,5.50,'media','01:30:00',2011),
(31,35,7.50,'difficile','02:30:00',2012),
(32,36,4.20,'facile','01:06:00',2013),
(33,37,6.00,'media','01:48:00',2014),
(34,38,5.00,'media','01:24:00',2015),
(35,39,7.00,'difficile','02:12:00',2016),
(36,40,4.50,'facile','01:20:00',2017),
(37,41,6.50,'media','02:00:00',2018),
(38,42,5.20,'media','01:30:00',2019),
(39,43,7.20,'difficile','02:18:00',2020),
(40,44,4.00,'facile','01:00:00',2020),
(41,45,6.80,'media','02:00:00',2021),
(42,46,5.50,'media','01:24:00',2021),
(43,47,7.00,'difficile','02:12:00',2022),
(44,48,4.50,'facile','01:20:00',2022),
(45,49,6.00,'media','01:48:00',2023),
(46,50,5.50,'media','01:24:00',2023),
(1,10,7.00,'difficile','02:18:00',1952),
(2,11,6.50,'media','02:00:00',1956),
(3,12,5.00,'facile','01:12:00',1959),
(4,13,6.80,'media','02:00:00',1961),
(5,14,5.50,'media','01:24:00',1964),
(6,15,7.20,'difficile','02:18:00',1967),
(7,16,4.50,'facile','01:20:00',1971),
(8,17,6.00,'media','01:48:00',1974),
(9,18,5.50,'media','01:24:00',1976),
(10,19,7.00,'difficile','02:12:00',1979),
(11,20,4.50,'facile','01:20:00',1981),
(12,21,6.80,'media','02:00:00',1983),
(13,22,5.50,'media','01:24:00',1984),
(14,23,7.20,'difficile','02:18:00',1986),
(15,24,4.00,'facile','01:00:00',1988),
(16,25,6.50,'media','02:00:00',1991),
(17,26,5.20,'media','01:30:00',1993),
(18,27,7.00,'difficile','02:12:00',1995),
(19,28,4.50,'facile','01:20:00',1996),
(20,29,6.80,'media','02:00:00',1998),
(21,30,5.50,'media','01:24:00',2001),
(22,31,7.00,'difficile','02:12:00',2004),
(23,32,4.50,'facile','01:20:00',2007),
(24,33,6.00,'media','01:48:00',2010),
(25,34,5.50,'media','01:24:00',2012),
(26,35,7.20,'difficile','02:18:00',2013),
(27,36,4.20,'facile','01:06:00',2014),
(28,37,6.00,'media','01:48:00',2015),
(29,38,5.00,'media','01:24:00',2016),
(30,39,7.00,'difficile','02:12:00',2017),
(31,40,4.50,'facile','01:20:00',2018),
(32,41,6.50,'media','02:00:00',2019),
(33,42,5.20,'media','01:30:00',2020),
(34,43,7.20,'difficile','02:18:00',2021),
(35,44,4.00,'facile','01:00:00',2022),
(36,45,6.80,'media','02:00:00',2023),
(37,46,5.50,'media','01:24:00',2024),
(38,47,7.00,'difficile','02:12:00',2024),
(39,48,4.50,'facile','01:20:00',2019),
(40,49,6.00,'media','01:48:00',2018),
(41,50,5.50,'media','01:24:00',2017),
(50,1,7.00,'difficile','02:18:00',2016),
(5,6,3.80,'facile','01:00:00',1950),
(7,8,4.90,'facile','01:06:00',1951),
(15,16,2.80,'facile','00:48:00',1962),
(26,27,3.40,'media','01:06:00',1970),
(33,34,5.10,'media','01:18:00',1975),
(42,43,6.10,'difficile','02:00:00',1980),
(2,3,2.50,'facile','00:42:00',1982),
(18,19,3.90,'media','01:06:00',1984),
(8,9,2.20,'facile','00:36:00',1989),
(14,15,3.30,'facile','00:54:00',1992),
(24,25,4.75,'media','01:18:00',1995),
(34,35,5.25,'media','01:30:00',1999),
(44,45,6.40,'difficile','02:06:00',2002),
(11,12,2.90,'facile','00:54:00',2005),
(19,20,3.60,'media','01:00:00',2008),
(28,29,4.20,'media','01:06:00',2011),
(36,37,5.10,'media','01:24:00',2013),
(46,47,6.00,'difficile','02:00:00',2015),
(3,4,3.80,'facile','01:00:00',2016),
(12,13,5.60,'media','01:30:00',2017),
(21,22,4.10,'media','01:06:00',2018),
(30,31,6.30,'difficile','02:06:00',2019),
(38,39,3.70,'facile','00:57:00',2020),
(47,48,5.90,'media','01:36:00',2021),
(9,10,4.40,'media','01:12:00',2022),
(16,17,3.20,'facile','00:54:00',2023),
(27,28,4.60,'media','01:18:00',2024);
/*!40000 ALTER TABLE `connessione` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
