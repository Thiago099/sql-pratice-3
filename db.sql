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

-- Copiando estrutura para tabela meaning.correlation
CREATE TABLE IF NOT EXISTS `correlation` (
  `id_entity_from` int(11) DEFAULT NULL,
  `id_entity_to` int(11) DEFAULT NULL,
  `id_correlation_type` int(11) DEFAULT NULL,
  KEY `FK_correlation_entity` (`id_entity_from`),
  KEY `FK_correlation_entity_2` (`id_entity_to`),
  KEY `FK_correlation_correlation_type` (`id_correlation_type`),
  CONSTRAINT `FK_correlation_correlation_type` FOREIGN KEY (`id_correlation_type`) REFERENCES `correlation_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_correlation_entity` FOREIGN KEY (`id_entity_from`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_correlation_entity_2` FOREIGN KEY (`id_entity_to`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela meaning.correlation: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `correlation` ENABLE KEYS */;

-- Copiando estrutura para tabela meaning.correlation_type
CREATE TABLE IF NOT EXISTS `correlation_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela meaning.correlation_type: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `correlation_type` DISABLE KEYS */;
INSERT INTO `correlation_type` (`id`, `name`) VALUES
	(1, 'generalization'),
	(2, 'containing'),
	(3, 'causality');
/*!40000 ALTER TABLE `correlation_type` ENABLE KEYS */;

-- Copiando estrutura para tabela meaning.entity
CREATE TABLE IF NOT EXISTS `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela meaning.entity: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
