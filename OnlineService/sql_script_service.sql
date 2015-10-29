-- MySQL Script generated by MySQL Workbench
-- Пт. 30 окт. 2015 00:25:30
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `cUserName` VARCHAR(45) NOT NULL,
  `cUserSurname` VARCHAR(45) NOT NULL,
  `cUserMail` VARCHAR(45) NOT NULL,
  `cUserPassword` VARCHAR(45) NOT NULL,
  `cPhoneNumber` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `idUser_UNIQUE` (`idUser` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Category` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Category` (
  `idCategory` INT NOT NULL,
  `cCategoryDesc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategory`),
  UNIQUE INDEX `idCategory_UNIQUE` (`idCategory` ASC),
  UNIQUE INDEX `cCategoryDesc_UNIQUE` (`cCategoryDesc` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Order` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `idOrder` INT NOT NULL AUTO_INCREMENT,
  `cOrderDescription` VARCHAR(50) NOT NULL,
  `dOrderDate` DATE NOT NULL,
  `idUser` INT NOT NULL,
  `idCategory` INT NOT NULL,
  `dCost` DOUBLE NOT NULL,
  `cStatus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idOrder`, `idCategory`),
  UNIQUE INDEX `idOrder_UNIQUE` (`idOrder` ASC),
  INDEX `fk_Order_User_idx` (`idUser` ASC),
  INDEX `fk_Order_Category1_idx` (`idCategory` ASC),
  CONSTRAINT `fk_Order_User`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Category1`
    FOREIGN KEY (`idCategory`)
    REFERENCES `mydb`.`Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Guarantee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Guarantee` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Guarantee` (
  `idGuarantee` INT NOT NULL AUTO_INCREMENT,
  `iDurationDays` INT NOT NULL,
  `dStartGuarantee` DATE NOT NULL,
  `dEndGuarantee` DATE NOT NULL,
  `idOrder` INT NOT NULL,
  PRIMARY KEY (`idGuarantee`, `idOrder`),
  UNIQUE INDEX `idGuarantee_UNIQUE` (`idGuarantee` ASC),
  INDEX `fk_Guarantee_Order1_idx` (`idOrder` ASC),
  CONSTRAINT `fk_Guarantee_Order1`
    FOREIGN KEY (`idOrder`)
    REFERENCES `mydb`.`Order` (`idOrder`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Goods`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Goods` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Goods` (
  `idGoods` INT NOT NULL AUTO_INCREMENT,
  `cGoodName` VARCHAR(45) NOT NULL,
  `cGoodModel` VARCHAR(45) NOT NULL,
  `cGoodDescription` TEXT(100) NOT NULL,
  `idCategory` INT NOT NULL,
  PRIMARY KEY (`idGoods`, `idCategory`),
  UNIQUE INDEX `idGoods_UNIQUE` (`idGoods` ASC),
  INDEX `fk_Goods_Category1_idx` (`idCategory` ASC),
  CONSTRAINT `fk_Goods_Category1`
    FOREIGN KEY (`idCategory`)
    REFERENCES `mydb`.`Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
