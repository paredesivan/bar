-- MySQL Script generated by MySQL Workbench
-- 07/24/16 21:01:35
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema flashbd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema flashbd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flashbd` DEFAULT CHARACTER SET latin1 ;
USE `flashbd` ;

-- -----------------------------------------------------
-- Table `flashbd`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flashbd`.`usuarios` (
  `username` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` INT(11) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `empresa` VARCHAR(45) NOT NULL,
  `password` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `flashbd`.`cadetes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flashbd`.`cadetes` (
  `idCadete` INT(10) NOT NULL,
  `usuarios_username` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(25) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` INT(20) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCadete`, `usuarios_username`),
  INDEX `fk_cadetes_usuarios1_idx` (`usuarios_username` ASC),
  CONSTRAINT `fk_cadetes_usuarios1`
    FOREIGN KEY (`usuarios_username`)
    REFERENCES `flashbd`.`usuarios` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `flashbd`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flashbd`.`categorias` (
  `nombreCategoria` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(100) NULL DEFAULT NULL,
  `usuarios_username` VARCHAR(45) NOT NULL,
  `color` INT(1) NOT NULL DEFAULT '5',
  PRIMARY KEY (`nombreCategoria`, `usuarios_username`),
  INDEX `fk_categorias_usuarios1_idx` (`usuarios_username` ASC),
  CONSTRAINT `fk_categorias_usuarios1`
    FOREIGN KEY (`usuarios_username`)
    REFERENCES `flashbd`.`usuarios` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `flashbd`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flashbd`.`clientes` (
  `idclientes` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(40) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(80) NULL DEFAULT NULL,
  `usuarios_username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idclientes`, `usuarios_username`),
  INDEX `fk_clientes_usuarios1_idx` (`usuarios_username` ASC),
  CONSTRAINT `fk_clientes_usuarios1`
    FOREIGN KEY (`usuarios_username`)
    REFERENCES `flashbd`.`usuarios` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `flashbd`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flashbd`.`pedidos` (
  `nroPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `idCliente` INT(11) NOT NULL,
  `usuarios_username` VARCHAR(45) NOT NULL,
  `idCadete` INT(10) NULL,
  `fecha` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`nroPedido`, `idCliente`, `usuarios_username`, `idCadete`),
  INDEX `fk_pedidos_clientes1_idx` (`idCliente` ASC),
  INDEX `fk_pedidos_usuarios1_idx` (`usuarios_username` ASC),
  INDEX `fk_pedidos_cadetes1_idx` (`idCadete` ASC),
  CONSTRAINT `fk_pedidos_clientes1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `flashbd`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_usuarios1`
    FOREIGN KEY (`usuarios_username`)
    REFERENCES `flashbd`.`usuarios` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_cadetes1`
    FOREIGN KEY (`idCadete`)
    REFERENCES `flashbd`.`cadetes` (`idCadete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `flashbd`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flashbd`.`productos` (
  `nombreCategoria` VARCHAR(45) NOT NULL,
  `nombreProducto` VARCHAR(45) NOT NULL,
  `stock` INT(11) NULL DEFAULT NULL,
  `imagen` VARCHAR(100) NULL DEFAULT NULL,
  `costo` FLOAT NULL DEFAULT NULL,
  `precio` FLOAT NOT NULL,
  `usuarios_username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombreCategoria`, `usuarios_username`, `nombreProducto`),
  INDEX `fk_productos_categorias1_idx` (`nombreCategoria` ASC),
  INDEX `fk_productos_usuarios1_idx` (`usuarios_username` ASC),
  CONSTRAINT `fk_productos_usuarios1`
    FOREIGN KEY (`usuarios_username`)
    REFERENCES `flashbd`.`usuarios` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `productos_ibfk_1`
    FOREIGN KEY (`nombreCategoria`)
    REFERENCES `flashbd`.`categorias` (`nombreCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `flashbd`.`pedidos_has_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flashbd`.`pedidos_has_productos` (
  `nroPedido` INT(11) NOT NULL,
  `nombreProducto` VARCHAR(45) NOT NULL,
  `cantidad` INT(10) NULL,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nroPedido`, `nombreProducto`, `username`),
  INDEX `fk_pedidos_has_productos_productos1_idx` (`nombreProducto` ASC),
  INDEX `fk_pedidos_has_productos_pedidos1_idx` (`nroPedido` ASC),
  INDEX `fk_pedidos_has_productos_usuarios1_idx` (`username` ASC),
  CONSTRAINT `fk_pedidos_has_productos_pedidos1`
    FOREIGN KEY (`nroPedido`)
    REFERENCES `flashbd`.`pedidos` (`nroPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_has_productos_productos1`
    FOREIGN KEY (`nombreProducto`)
    REFERENCES `flashbd`.`productos` (`nombreProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_has_productos_usuarios1`
    FOREIGN KEY (`username`)
    REFERENCES `flashbd`.`usuarios` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
