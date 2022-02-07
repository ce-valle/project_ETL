-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema obesity_alcohol
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema obesity_alcohol
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `obesity_alcohol` DEFAULT CHARACTER SET utf8 ;
USE `obesity_alcohol` ;

-- -----------------------------------------------------
-- Table `obesity_alcohol`.`country_obesity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `obesity_alcohol`.`country_obesity` (
  `country` VARCHAR(25) NOT NULL,
  `both.sexes` INT(6) NULL,
  `male` INT(6) NULL,
  `female` INT(6) NULL,
  PRIMARY KEY (`country`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`country_meat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `obesity_alcohol`.`country_meat` (
  `country` VARCHAR(25) NOT NULL,
  `kg/person_2002` FLOAT(6) NULL,
  `country_obesity_country` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`country`, `country_obesity_country`),
  INDEX `fk_country_meat_country_obesity1_idx` (`country_obesity_country` ASC) VISIBLE,
  CONSTRAINT `fk_country_meat_country_obesity1`
    FOREIGN KEY (`country_obesity_country`)
    REFERENCES `obesity_alcohol`.`country_obesity` (`country`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `obesity_alcohol`.`country_alcohol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `obesity_alcohol`.`country_alcohol` (
  `country` VARCHAR(25) NOT NULL,
  `alcconsumption` INT(6) NULL,
  `country_meat_country` VARCHAR(25) NOT NULL,
  `country_obesity_country` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`country`, `country_meat_country`, `country_obesity_country`),
  INDEX `fk_country_alcohol_country_meat_idx` (`country_meat_country` ASC) VISIBLE,
  INDEX `fk_country_alcohol_country_obesity1_idx` (`country_obesity_country` ASC) VISIBLE,
  CONSTRAINT `fk_country_alcohol_country_meat`
    FOREIGN KEY (`country_meat_country`)
    REFERENCES `obesity_alcohol`.`country_meat` (`country`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_country_alcohol_country_obesity1`
    FOREIGN KEY (`country_obesity_country`)
    REFERENCES `obesity_alcohol`.`country_obesity` (`country`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
