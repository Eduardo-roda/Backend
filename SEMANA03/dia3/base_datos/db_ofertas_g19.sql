-- MySQL Script generated by MySQL Workbench
-- Wed Mar  8 19:52:19 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_ofertas_g19
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_ofertas_g19
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_ofertas_g19` DEFAULT CHARACTER SET utf8 ;
USE `db_ofertas_g19` ;

-- -----------------------------------------------------
-- Table `db_ofertas_g19`.`tbl_empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ofertas_g19`.`tbl_empresa` (
  `empresa_id` INT NOT NULL AUTO_INCREMENT,
  `empresa_nombre` VARCHAR(255) NOT NULL,
  `empresa_descripcion` LONGTEXT NULL,
  `empresa_logo` VARCHAR(255) NULL,
  `empresa beneficios` LONGTEXT NULL,
  PRIMARY KEY (`empresa_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ofertas_g19`.`tbl_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ofertas_g19`.`tbl_categoria` (
  `categoria_id` INT NOT NULL AUTO_INCREMENT,
  `categoria_descripcion` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`categoria_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ofertas_g19`.`tbl_experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ofertas_g19`.`tbl_experiencia` (
  `experiencia_id` INT NOT NULL AUTO_INCREMENT,
  `experiencia_descripcion` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`experiencia_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ofertas_g19`.`tbl_jornada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ofertas_g19`.`tbl_jornada` (
  `jornada_id` INT NOT NULL AUTO_INCREMENT,
  `jornada_descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`jornada_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ofertas_g19`.`tbl_modalidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ofertas_g19`.`tbl_modalidad` (
  `modalidad_id` INT NOT NULL AUTO_INCREMENT,
  `modalidad_descripcion` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`modalidad_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ofertas_g19`.`tbl_oferta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ofertas_g19`.`tbl_oferta` (
  `oferta_id` INT NOT NULL AUTO_INCREMENT,
  `oferta_fregistro` DATE NOT NULL,
  `oferta_titulo` VARCHAR(255) NOT NULL,
  `oferta_descripcion` LONGTEXT NULL,
  `oferta_requerimientos` LONGTEXT NULL,
  `oferta_salario` DOUBLE NOT NULL,
  `oferta_url` VARCHAR(255) NULL,
  `empresa_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  `experiencia_id` INT NOT NULL,
  `jornada_id` INT NOT NULL,
  `modalidad_id` INT NOT NULL,
  PRIMARY KEY (`oferta_id`),
  CONSTRAINT `fk_tbl_oferta_tbl_empresa`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `db_ofertas_g19`.`tbl_empresa` (`empresa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_oferta_tbl_categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `db_ofertas_g19`.`tbl_categoria` (`categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_oferta_tbl_experiencia1`
    FOREIGN KEY (`experiencia_id`)
    REFERENCES `db_ofertas_g19`.`tbl_experiencia` (`experiencia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_oferta_tbl_jornada1`
    FOREIGN KEY (`jornada_id`)
    REFERENCES `db_ofertas_g19`.`tbl_jornada` (`jornada_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_oferta_tbl_modalidad1`
    FOREIGN KEY (`modalidad_id`)
    REFERENCES `db_ofertas_g19`.`tbl_modalidad` (`modalidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ofertas_g19`.`tbl_postulante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ofertas_g19`.`tbl_postulante` (
  `postulante_id` INT NOT NULL AUTO_INCREMENT,
  `postulante_nombres` VARCHAR(255) NOT NULL,
  `postulante_apellidos` VARCHAR(255) NOT NULL,
  `postulante_doc_identidad` VARCHAR(255) NULL,
  `postulante_tipodoc_ide` INT NOT NULL DEFAULT 1,
  `postulante_fnacimiento` DATE NOT NULL,
  `postulante_celular` VARCHAR(100) NULL,
  `postulante_email` VARCHAR(255) NULL,
  `postulante_estado` CHAR(1) NULL DEFAULT '1',
  PRIMARY KEY (`postulante_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ofertas_g19`.`tbl_postulante_experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ofertas_g19`.`tbl_postulante_experiencia` (
  `postulante_experiencia` INT NOT NULL AUTO_INCREMENT,
  `postulante_experiencia_empresa` VARCHAR(255) NOT NULL,
  `postulante_experiencia_cargo` VARCHAR(255) NOT NULL,
  `postulante_experiencia_resumen` LONGTEXT NULL,
  `postulante_experiencia_finicio` DATE NOT NULL,
  `postulante_experiencia_ffin` DATE NULL,
  `postulante_experiencia_vigente` CHAR(1) NOT NULL DEFAULT '0',
  `postulante_id` INT NOT NULL,
  PRIMARY KEY (`postulante_experiencia`),
  CONSTRAINT `fk_tbl_postulante_experiencia_tbl_postulante1`
    FOREIGN KEY (`postulante_id`)
    REFERENCES `db_ofertas_g19`.`tbl_postulante` (`postulante_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ofertas_g19`.`tbl_postulante_estudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ofertas_g19`.`tbl_postulante_estudio` (
  `postulante_estudio_id` INT NOT NULL,
  `postulante_estudio_lugar` VARCHAR(255) NOT NULL,
  `postulante_estudio_especialidad` VARCHAR(255) NOT NULL,
  `postulante_estudio_finicio` DATE NOT NULL,
  `postulante_estudio_ffin` DATE NOT NULL,
  `postulante_estudio_sinterminar` CHAR(1) NOT NULL DEFAULT '0',
  `tbl_postulante_postulante_id` INT NOT NULL,
  PRIMARY KEY (`postulante_estudio_id`),
  CONSTRAINT `fk_tbl_postulante_estudio_tbl_postulante1`
    FOREIGN KEY (`tbl_postulante_postulante_id`)
    REFERENCES `db_ofertas_g19`.`tbl_postulante` (`postulante_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ofertas_g19`.`tbl_oferta_etapa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ofertas_g19`.`tbl_oferta_etapa` (
  `oferta_etapa_id` INT NOT NULL AUTO_INCREMENT,
  `oferta_etapa_descripcion` VARCHAR(255) NOT NULL,
  `oferta_etapa_posterior_id` INT NULL,
  PRIMARY KEY (`oferta_etapa_id`),
  CONSTRAINT `fk_tbl_oferta_etapa_tbl_oferta_etapa1`
    FOREIGN KEY (`oferta_etapa_posterior_id`)
    REFERENCES `db_ofertas_g19`.`tbl_oferta_etapa` (`oferta_etapa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ofertas_g19`.`tbl_oferta_postulante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ofertas_g19`.`tbl_oferta_postulante` (
  `oferta_postulante_id` INT NOT NULL AUTO_INCREMENT,
  `oferta_postulante_fregistro` DATE NOT NULL,
  `oferta_postulante_seleccionado` CHAR(1) NOT NULL DEFAULT '0',
  `oferta_id` INT NOT NULL,
  `postulante_id` INT NOT NULL,
  `oferta_etapa_id` INT NOT NULL,
  PRIMARY KEY (`oferta_postulante_id`),
  CONSTRAINT `fk_tbl_oferta_postulante_tbl_oferta1`
    FOREIGN KEY (`oferta_id`)
    REFERENCES `db_ofertas_g19`.`tbl_oferta` (`oferta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_oferta_postulante_tbl_postulante1`
    FOREIGN KEY (`postulante_id`)
    REFERENCES `db_ofertas_g19`.`tbl_postulante` (`postulante_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_oferta_postulante_tbl_oferta_etapa1`
    FOREIGN KEY (`oferta_etapa_id`)
    REFERENCES `db_ofertas_g19`.`tbl_oferta_etapa` (`oferta_etapa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;