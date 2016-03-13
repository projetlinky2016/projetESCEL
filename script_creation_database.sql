-- MySQL Script generated by MySQL Workbench
-- 02/01/16 16:28:46
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ProjetERDF_BDD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProjetERDF_BDD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProjetERDF_BDD` DEFAULT CHARACTER SET utf8 ;
USE `ProjetERDF_BDD` ;

-- -----------------------------------------------------
-- Table `ProjetERDF_BDD`.`OptTarifaire`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjetERDF_BDD`.`OptTarifaire` ;

CREATE TABLE IF NOT EXISTS `ProjetERDF_BDD`.`OptTarifaire` (
  `IdOptTarifaire` INT NOT NULL AUTO_INCREMENT,
  `Label` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdOptTarifaire`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetERDF_BDD`.`OptionCompteur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjetERDF_BDD`.`OptionCompteur` ;

CREATE TABLE IF NOT EXISTS `ProjetERDF_BDD`.`OptionCompteur` (
  `IdOptCompteur` INT NOT NULL AUTO_INCREMENT,
  `Date_update` DATETIME NOT NULL,
  `IntensiteSouscrit` FLOAT NOT NULL,
  `IdOptTarifaire` INT NOT NULL,
  `IndexHeureCreuse` INT NOT NULL,
  `IndexHeurePleine` INT NOT NULL,
  `PuissanceApparenteSouscrite` FLOAT NOT NULL,
  `AlarmeSiPuissanceDepasse` TINYINT(1) NOT NULL,
  PRIMARY KEY (`IdOptCompteur`),
  INDEX `IdOptTarifaire_idx` (`IdOptTarifaire` ASC),
  CONSTRAINT `IdOptTarifaire`
    FOREIGN KEY (`IdOptTarifaire`)
    REFERENCES `ProjetERDF_BDD`.`OptTarifaire` (`IdOptTarifaire`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetERDF_BDD`.`TypeAnomalie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjetERDF_BDD`.`TypeAnomalie` ;

CREATE TABLE IF NOT EXISTS `ProjetERDF_BDD`.`TypeAnomalie` (
  `IdTypeAnomalie` INT NOT NULL AUTO_INCREMENT,
  `Label` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdTypeAnomalie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetERDF_BDD`.`Anomalie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjetERDF_BDD`.`Anomalie` ;

CREATE TABLE IF NOT EXISTS `ProjetERDF_BDD`.`Anomalie` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Date` DATETIME NOT NULL,
  `Provenance` VARCHAR(45) NOT NULL,
  `IdTypeAnomalie` INT NOT NULL,
  `IdOptCompteur` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IdOptCompteur_idx` (`IdOptCompteur` ASC),
  INDEX `IdTypeAnomalie_idx` (`IdTypeAnomalie` ASC),
  CONSTRAINT `IdOptCompteur`
    FOREIGN KEY (`IdOptCompteur`)
    REFERENCES `ProjetERDF_BDD`.`OptionCompteur` (`IdOptCompteur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdTypeAnomalie`
    FOREIGN KEY (`IdTypeAnomalie`)
    REFERENCES `ProjetERDF_BDD`.`TypeAnomalie` (`IdTypeAnomalie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetERDF_BDD`.`Norme_EN50160`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjetERDF_BDD`.`Norme_EN50160` ;

CREATE TABLE IF NOT EXISTS `ProjetERDF_BDD`.`Norme_EN50160` (
  `VoltMin` INT NOT NULL,
  `VoltMax` INT NOT NULL,
  `DateUpdate` DATETIME NOT NULL,
  PRIMARY KEY (`VoltMin`, `VoltMax`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetERDF_BDD`.`Values`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjetERDF_BDD`.`Values` ;

CREATE TABLE IF NOT EXISTS `ProjetERDF_BDD`.`Values` (
  `Date` DATETIME NOT NULL,
  `Ampere` LONG NULL,
  `Volt` LONG NULL,
  `Watt_Heure_Base` LONG NULL,
  `Watt_Heure_HP` LONG NULL,
  `Watt_Heure_HC` LONG NULL,
  `Papparente` LONG NULL,
  `Pactive` LONG NULL,
  `Preactive` LONG NULL,
  `HeurePleine` TINYINT(1) NULL,
  `HeureCreuse` TINYINT(1) NULL,
  `IdOptCompteur` INT NULL,
  PRIMARY KEY (`Date`),
  INDEX `IdOptCompteur_idx` (`IdOptCompteur` ASC),
  CONSTRAINT `IdOptCompteurTwo`
    FOREIGN KEY (`IdOptCompteur`)
    REFERENCES `ProjetERDF_BDD`.`OptionCompteur` (`IdOptCompteur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin;
 DROP USER admin;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin' IDENTIFIED BY 'admin';

GRANT ALL ON `ProjetERDF_BDD`.* TO 'admin';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;








INSERT INTO `ProjetERDF_BDD`.`TypeAnomalie` (`IdTypeAnomalie`, `Label`) VALUES ('1', 'Depassement puissance');
INSERT INTO `ProjetERDF_BDD`.`TypeAnomalie` (`IdTypeAnomalie`, `Label`) VALUES ('2', 'Coupure Systeme');
INSERT INTO `ProjetERDF_BDD`.`TypeAnomalie` (`IdTypeAnomalie`, `Label`) VALUES ('3', 'Disjoncteur');
INSERT INTO `ProjetERDF_BDD`.`TypeAnomalie` (`IdTypeAnomalie`, `Label`) VALUES ('4', 'PV455EF');




