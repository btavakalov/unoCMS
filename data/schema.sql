SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `unocms` ;
CREATE SCHEMA IF NOT EXISTS `unocms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `unocms` ;

-- -----------------------------------------------------
-- Table `unocms`.`objects_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `unocms`.`objects_types` ;

CREATE TABLE IF NOT EXISTS `unocms`.`objects_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `object_type_id` INT NULL,
  `name` VARCHAR(255) NULL COMMENT 'i18n mnemonic',
  PRIMARY KEY (`id`),
  INDEX `object_type_idx` (`object_type_id` ASC),
  CONSTRAINT `fk_parent_object_type`
    FOREIGN KEY (`object_type_id`)
    REFERENCES `unocms`.`objects_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `unocms`.`objects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `unocms`.`objects` ;

CREATE TABLE IF NOT EXISTS `unocms`.`objects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `object_type_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `object_type_idx` (`object_type_id` ASC),
  CONSTRAINT `fk_object_2_object_type`
    FOREIGN KEY (`object_type_id`)
    REFERENCES `unocms`.`objects_types` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `unocms`.`sections`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `unocms`.`sections` ;

CREATE TABLE IF NOT EXISTS `unocms`.`sections` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `section_id` INT NULL,
  `object_id` INT NULL,
  `name` VARCHAR(255) NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `section_idx` (`section_id` ASC),
  INDEX `object_idx` (`object_id` ASC),
  CONSTRAINT `fk_parent_section`
    FOREIGN KEY (`section_id`)
    REFERENCES `unocms`.`sections` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_2_object`
    FOREIGN KEY (`object_id`)
    REFERENCES `unocms`.`objects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `unocms`.`objects_fields_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `unocms`.`objects_fields_types` ;

CREATE TABLE IF NOT EXISTS `unocms`.`objects_fields_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `unocms`.`objects_fields_groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `unocms`.`objects_fields_groups` ;

CREATE TABLE IF NOT EXISTS `unocms`.`objects_fields_groups` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `unocms`.`objects_fields`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `unocms`.`objects_fields` ;

CREATE TABLE IF NOT EXISTS `unocms`.`objects_fields` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `object_type_id` INT NULL,
  `object_filed_type_id` INT NULL,
  `object_field_group_id` INT NULL,
  `name` VARCHAR(45) NULL,
  `sort_order` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `object_type_idx` (`object_type_id` ASC),
  INDEX `object_field_type_idx` (`object_filed_type_id` ASC),
  INDEX `object_field_group_idx` (`object_field_group_id` ASC),
  CONSTRAINT `fk_object_field_2_object_type`
    FOREIGN KEY (`object_type_id`)
    REFERENCES `unocms`.`objects_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_object_field_2_object_field_type`
    FOREIGN KEY (`object_filed_type_id`)
    REFERENCES `unocms`.`objects_fields_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_object_field_2_object_field_group`
    FOREIGN KEY (`object_field_group_id`)
    REFERENCES `unocms`.`objects_fields_groups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `unocms`.`objects_contents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `unocms`.`objects_contents` ;

CREATE TABLE IF NOT EXISTS `unocms`.`objects_contents` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `object_id` INT NULL,
  `object_field_id` INT NULL,
  `value_int` BIGINT NULL COMMENT '	',
  `value_text` TEXT NULL,
  `value_float` DOUBLE NULL,
  `value_string` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `object_idx` (`object_id` ASC),
  INDEX `object_field_idx` (`object_field_id` ASC),
  CONSTRAINT `fk_object_contnet_2_object`
    FOREIGN KEY (`object_id`)
    REFERENCES `unocms`.`objects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_object_contnet_2_object_field`
    FOREIGN KEY (`object_field_id`)
    REFERENCES `unocms`.`objects_fields` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
