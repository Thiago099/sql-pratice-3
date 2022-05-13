-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.22-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para meaning
CREATE DATABASE IF NOT EXISTS `meaning` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `meaning`;

-- Copiando estrutura para tabela meaning.cardinality
CREATE TABLE IF NOT EXISTS `cardinality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela meaning.cardinality: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `cardinality` DISABLE KEYS */;
INSERT INTO `cardinality` (`id`, `name`, `description`) VALUES
	(1, '1', 'one'),
	(2, '1 - N', 'one or more'),
	(3, '0 - N', 'zero or more'),
	(4, 'Q', 'fixed number'),
	(5, 'Q - N', 'fixed number or more'),
	(6, 'Q - U', 'fixed number to fixed number');
/*!40000 ALTER TABLE `cardinality` ENABLE KEYS */;

-- Copiando estrutura para tabela meaning.entity
CREATE TABLE IF NOT EXISTS `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela meaning.entity: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` (`id`, `name`) VALUES
	(1, 'tag'),
	(2, 'paramter'),
	(3, 'function');
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;

-- Copiando estrutura para tabela meaning.entity_parameter
CREATE TABLE IF NOT EXISTS `entity_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_entity_parent` int(11) DEFAULT NULL,
  `id_entity_child` int(11) DEFAULT NULL,
  `id_cardinality` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_entity_parameter_entity` (`id_entity_parent`),
  KEY `FK_entity_parameter_entity_2` (`id_entity_child`),
  KEY `FK_entity_parameter_cardinality` (`id_cardinality`),
  CONSTRAINT `FK_entity_parameter_cardinality` FOREIGN KEY (`id_cardinality`) REFERENCES `cardinality` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_entity_parameter_entity` FOREIGN KEY (`id_entity_parent`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_entity_parameter_entity_2` FOREIGN KEY (`id_entity_child`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela meaning.entity_parameter: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `entity_parameter` DISABLE KEYS */;
INSERT INTO `entity_parameter` (`id`, `id_entity_parent`, `id_entity_child`, `id_cardinality`) VALUES
	(1, 1, 2, 3),
	(2, 3, 2, 3);
/*!40000 ALTER TABLE `entity_parameter` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
