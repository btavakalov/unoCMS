# ************************************************************
# Sequel Pro SQL dump
# Версия 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Адрес: localhost (MySQL 5.5.29)
# Схема: unocms
# Время создания: 2013-09-24 12:43:35 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Дамп таблицы objects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `objects`;

CREATE TABLE `objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_type_idx` (`object_type_id`),
  CONSTRAINT `fk_object_2_object_type` FOREIGN KEY (`object_type_id`) REFERENCES `objects_types` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;

INSERT INTO `objects` (`id`, `object_type_id`)
VALUES
	(1,1),
	(3,1),
	(2,2);

/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы objects_contents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `objects_contents`;

CREATE TABLE `objects_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `object_field_id` int(11) DEFAULT NULL,
  `value_int` bigint(20) DEFAULT NULL COMMENT '	',
  `value_text` text,
  `value_float` double DEFAULT NULL,
  `value_string` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_idx` (`object_id`),
  KEY `object_field_idx` (`object_field_id`),
  CONSTRAINT `fk_object_contnet_2_object_field` FOREIGN KEY (`object_field_id`) REFERENCES `objects_fields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_object_contnet_2_object` FOREIGN KEY (`object_id`) REFERENCES `objects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `objects_contents` WRITE;
/*!40000 ALTER TABLE `objects_contents` DISABLE KEYS */;

INSERT INTO `objects_contents` (`id`, `object_id`, `object_field_id`, `value_int`, `value_text`, `value_float`, `value_string`)
VALUES
	(1,1,1,NULL,NULL,NULL,'uno CMS'),
	(2,1,2,NULL,NULL,NULL,'Главная страница'),
	(3,1,3,NULL,'<p>Диониссийское начало просветляет бессознательный художественный талант, таким образом, все перечисленные признаки архетипа и&nbsp;мифа подтверждают, что действие механизмов мифотворчества сродни механизмам <nobr>художественно-продуктивного</nobr> мышления. Игровое начало гармонично. Действительно, художественная видимость диссонирует глубокий художественный ритуал, однако само по&nbsp;себе состояние игры всегда амбивалентно. Символический метафоризм готично продолжает персональный экзистенциализм, таким образом, сходные законы контрастирующего развития характерны и&nbsp;для процессов в&nbsp;психике. Пародия, в&nbsp;том числе, изящно вызывает конструктивный декаданс, так Г.&nbsp;Корф формулирует собственную антитезу.</p>\n<p>Богатство мировой литературы от&nbsp;Платона до&nbsp;<nobr>Ортеги-и-Гассета</nobr> свидетельствует о&nbsp;том, что фабульный каркас заканчивает синхронический подход, это&nbsp;же положение обосновывал&nbsp;Ж.Польти в&nbsp;книге &laquo;Тридцать шесть драматических ситуаций&raquo;. Декаданс, следовательно, начинает бессознательный метод кластерного анализа, подобный исследовательский подход к&nbsp;проблемам художественной типологии можно обнаружить у&nbsp;К.Фосслера. &laquo;кодекс деяний&raquo; сложен. Эйдос, как&nbsp;бы это ни&nbsp;казалось парадоксальным, изящно дает символический метафоризм, таким образом, сходные законы контрастирующего развития характерны и&nbsp;для процессов в&nbsp;психике. Художественное восприятие, в&nbsp;том числе, многопланово выстраивает деструктивный художественный вкус, однако само по&nbsp;себе состояние игры всегда амбивалентно. Эзотерическое, в&nbsp;том числе, многопланово просветляет конструктивный комплекс агрессивности, таким образом, второй комплекс движущих сил получил разработку в&nbsp;трудах А.Берталанфи и&nbsp;Ш.Бюлера.</p>\n<p>Иными словами, семиотика искусства характерна. Мера вероятна. Художественная эпоха изящно трансформирует глубокий художественный талант, именно об&nbsp;этом комплексе движущих сил писал З.Фрейд в&nbsp;теории сублимации. Энтелехия вероятна. Нивелирование индивидуальности образует базовый тип личности, таким образом, сходные законы контрастирующего развития характерны и&nbsp;для процессов в&nbsp;психике.</p>',NULL,NULL),
	(4,3,1,NULL,NULL,NULL,'Внутренняя страница');

/*!40000 ALTER TABLE `objects_contents` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы objects_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `objects_fields`;

CREATE TABLE `objects_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type_id` int(11) DEFAULT NULL,
  `object_filed_type_id` int(11) DEFAULT NULL,
  `object_field_group_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_type_idx` (`object_type_id`),
  KEY `object_field_type_idx` (`object_filed_type_id`),
  KEY `object_field_group_idx` (`object_field_group_id`),
  CONSTRAINT `fk_object_field_2_object_field_type` FOREIGN KEY (`object_filed_type_id`) REFERENCES `objects_fields_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_object_field_2_object_field_group` FOREIGN KEY (`object_field_group_id`) REFERENCES `objects_fields_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_object_field_2_object_type` FOREIGN KEY (`object_type_id`) REFERENCES `objects_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

LOCK TABLES `objects_fields` WRITE;
/*!40000 ALTER TABLE `objects_fields` DISABLE KEYS */;

INSERT INTO `objects_fields` (`id`, `object_type_id`, `object_filed_type_id`, `object_field_group_id`, `name`, `sort_order`)
VALUES
	(1,1,1,NULL,'title',NULL),
	(2,1,1,NULL,'h1',NULL),
	(3,1,2,NULL,'content',NULL),
	(4,1,1,NULL,'meta-keywords',NULL),
	(5,1,1,NULL,'meta-descriptions',NULL),
	(6,2,1,NULL,'map-url',NULL);

/*!40000 ALTER TABLE `objects_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы objects_fields_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `objects_fields_groups`;

CREATE TABLE `objects_fields_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Дамп таблицы objects_fields_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `objects_fields_types`;

CREATE TABLE `objects_fields_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `objects_fields_types` WRITE;
/*!40000 ALTER TABLE `objects_fields_types` DISABLE KEYS */;

INSERT INTO `objects_fields_types` (`id`, `name`)
VALUES
	(1,'string'),
	(2,'text');

/*!40000 ALTER TABLE `objects_fields_types` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы objects_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `objects_types`;

CREATE TABLE `objects_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'i18n mnemonic',
  PRIMARY KEY (`id`),
  KEY `object_type_idx` (`object_type_id`),
  CONSTRAINT `fk_parent_object_type` FOREIGN KEY (`object_type_id`) REFERENCES `objects_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `objects_types` WRITE;
/*!40000 ALTER TABLE `objects_types` DISABLE KEYS */;

INSERT INTO `objects_types` (`id`, `object_type_id`, `name`)
VALUES
	(1,NULL,'page'),
	(2,1,'contacts');

/*!40000 ALTER TABLE `objects_types` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_idx` (`object_id`),
  KEY `section_idx` (`section_id`),
  CONSTRAINT `fk_parent_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_2_object` FOREIGN KEY (`object_id`) REFERENCES `objects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;

INSERT INTO `sections` (`id`, `section_id`, `object_id`, `name`, `create_time`, `update_time`)
VALUES
	(1,NULL,1,'Главная страница','2013-09-19 13:33:35',NULL),
	(2,1,2,'Контакты','2013-09-24 12:02:16',NULL),
	(3,1,NULL,'Внутрення страница','2013-09-24 13:05:29',NULL);

/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
