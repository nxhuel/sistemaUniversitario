-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sistema_escolar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistema_escolar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistema_escolar` DEFAULT CHARACTER SET utf8 ;
USE `sistema_escolar` ;

-- -----------------------------------------------------
-- Table `sistema_escolar`.`alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_escolar`.`alumno` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(8) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefono` INT NULL,
  `password` VARCHAR(45) NOT NULL,
  `edad` DATE NOT NULL,
  `inscripcion` DATE NOT NULL,
  `fk_alumno_carrera_id` INT NOT NULL,
  `fk_alumno_materia_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `carrera_id_idx` (`fk_alumno_carrera_id` ASC) VISIBLE,
  INDEX `materia_id_idx` (`fk_alumno_materia_id` ASC) VISIBLE,
  CONSTRAINT `fk_alumno_carrera_id`
    FOREIGN KEY (`fk_alumno_carrera_id`)
    REFERENCES `sistema_escolar`.`carrera` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_materia_id`
    FOREIGN KEY (`fk_alumno_materia_id`)
    REFERENCES `sistema_escolar`.`materia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_escolar`.`contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_escolar`.`contrato` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inicio` DATE NOT NULL,
  `fin` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_escolar`.`docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_escolar`.`docente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `id_contrato` VARCHAR(45) NOT NULL,
  `especializacion` VARCHAR(45) NOT NULL,
  `edad` VARCHAR(45) NOT NULL,
  `fk_docente_contrato_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_docente_contrato1_idx` (`fk_docente_contrato_id` ASC) VISIBLE,
  CONSTRAINT `fk_docente_contrato_id`
    FOREIGN KEY (`fk_docente_contrato_id`)
    REFERENCES `sistema_escolar`.`contrato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_escolar`.`carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_escolar`.`carrera` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `integracion` DATE NOT NULL,
  `duracion` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_escolar`.`periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_escolar`.`periodo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inicio` DATE NOT NULL,
  `fin` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_escolar`.`materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_escolar`.`materia` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `codigo` INT NOT NULL,
  `plan_de_estudio` VARCHAR(45) NOT NULL,
  `grado` INT NOT NULL,
  `fk_materia_carrera_id` INT NOT NULL,
  `fk_materia_periodo_id` INT NOT NULL,
  `fk_materia_docente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_carrera_idx` (`fk_materia_carrera_id` ASC) VISIBLE,
  INDEX `periodo_id_idx` (`fk_materia_periodo_id` ASC) VISIBLE,
  INDEX `docente_id_idx` (`fk_materia_docente_id` ASC) VISIBLE,
  CONSTRAINT `fk_materia_carrera_id`
    FOREIGN KEY (`fk_materia_carrera_id`)
    REFERENCES `sistema_escolar`.`carrera` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_materia_periodo_id`
    FOREIGN KEY (`fk_materia_periodo_id`)
    REFERENCES `sistema_escolar`.`periodo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_materia_docente_id`
    FOREIGN KEY (`fk_materia_docente_id`)
    REFERENCES `sistema_escolar`.`docente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_escolar`.`alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_escolar`.`alumno` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(8) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefono` INT NULL,
  `password` VARCHAR(45) NOT NULL,
  `edad` DATE NOT NULL,
  `inscripcion` DATE NOT NULL,
  `fk_alumno_carrera_id` INT NOT NULL,
  `fk_alumno_materia_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `carrera_id_idx` (`fk_alumno_carrera_id` ASC) VISIBLE,
  INDEX `materia_id_idx` (`fk_alumno_materia_id` ASC) VISIBLE,
  CONSTRAINT `fk_alumno_carrera_id`
    FOREIGN KEY (`fk_alumno_carrera_id`)
    REFERENCES `sistema_escolar`.`carrera` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_materia_id`
    FOREIGN KEY (`fk_alumno_materia_id`)
    REFERENCES `sistema_escolar`.`materia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_escolar`.`calificaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_escolar`.`calificaciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nota_cursada` INT NULL,
  `nota_final` INT NULL,
  `fk_calificaciones_materia_id` INT NOT NULL,
  `fk_calificaciones_alumno_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `materia_id_idx` (`fk_calificaciones_materia_id` ASC) VISIBLE,
  INDEX `fk_calificaciones_alumno1_idx` (`fk_calificaciones_alumno_id` ASC) VISIBLE,
  CONSTRAINT `fk_calificaciones_materia_id`
    FOREIGN KEY (`fk_calificaciones_materia_id`)
    REFERENCES `sistema_escolar`.`materia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_calificaciones_alumno_id`
    FOREIGN KEY (`fk_calificaciones_alumno_id`)
    REFERENCES `sistema_escolar`.`alumno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_escolar`.`aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_escolar`.`aula` (
  `id` INT NOT NULL,
  `numero` INT NOT NULL,
  `capacidad` INT NOT NULL,
  `estado` TINYINT NOT NULL,
  `fk_aula_carrera_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `carrera_id_idx` (`fk_aula_carrera_id` ASC) VISIBLE,
  CONSTRAINT `fk_aula_carrera_id`
    FOREIGN KEY (`fk_aula_carrera_id`)
    REFERENCES `sistema_escolar`.`carrera` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_escolar`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_escolar`.`horario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dia` INT NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_fin` TIME NOT NULL,
  `fk_horario_materia_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `materia_id_idx` (`fk_horario_materia_id` ASC) VISIBLE,
  CONSTRAINT `fk_horario_materia_id`
    FOREIGN KEY (`fk_horario_materia_id`)
    REFERENCES `sistema_escolar`.`materia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
