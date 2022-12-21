-- MySQL Script generated by MySQL Workbench
-- Wed Dec 21 16:21:56 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL,
  `apellido` VARCHAR(50) NULL,
  `foto` LONGTEXT NULL,
  `info` VARCHAR(250) NULL,
  `email` VARCHAR(40) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `mydb`.`estudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estudio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(30) NULL,
  `institucion` VARCHAR(60) NULL,
  `fecha_inicio` DATE NULL,
  `fecha_finalizacion` DATE NULL,
  `descripcion` VARCHAR(150) NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_estudio_Persona_idx` (`Persona_id` ASC),
  CONSTRAINT `fk_estudio_Persona`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `mydb`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`experiencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `empresa` VARCHAR(30) NULL,
  `puesto` VARCHAR(30) NULL,
  `fecha_inicio` DATE NULL,
  `fecha_finalizacion` DATE NULL,
  `descripcion` VARCHAR(120) NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_experiencia_Persona1_idx` (`Persona_id` ASC),
  CONSTRAINT `fk_experiencia_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `mydb`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`skill` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `habilidad` VARCHAR(25) NULL,
  `porcentaje` INT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_skill_Persona1_idx` (`Persona_id` ASC),
  CONSTRAINT `fk_skill_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `mydb`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proyecto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(70) NULL,
  `descripcion` VARCHAR(150) NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_proyecto_Persona1_idx` (`Persona_id` ASC),
  CONSTRAINT `fk_proyecto_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `mydb`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`red_social`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`red_social` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `icono` LONGTEXT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_red_social_Persona1_idx` (`Persona_id` ASC),
  CONSTRAINT `fk_red_social_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `mydb`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
