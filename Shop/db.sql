-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 ;
USE `shop` ;

-- -----------------------------------------------------
-- Table `shop`.`applications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`applications` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`organisations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`organisations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL,
  `application_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_organisations_applications1_idx` (`application_id` ASC),
  CONSTRAINT `fk_organisations_applications1`
    FOREIGN KEY (`application_id`)
    REFERENCES `shop`.`applications` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL,
  `organisation_id` INT NOT NULL,
  PRIMARY KEY (`id`, `organisation_id`),
  INDEX `fk_roles_organisations1_idx` (`organisation_id` ASC),
  CONSTRAINT `fk_roles_organisations1`
    FOREIGN KEY (`organisation_id`)
    REFERENCES `shop`.`organisations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `ISO2` VARCHAR(2) NOT NULL,
  `ISO3` VARCHAR(3) NOT NULL,
  `dialing_prefix` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`region` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `dialing_prefix` VARCHAR(45) NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_region_country1_idx` (`country_id` ASC),
  CONSTRAINT `fk_region_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `shop`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`city` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `postal_code` VARCHAR(255) NOT NULL,
  `call_number` VARCHAR(255) NOT NULL,
  `time_zone` VARCHAR(255) NOT NULL,
  `region_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_city_region1_idx` (`region_id` ASC),
  CONSTRAINT `fk_city_region1`
    FOREIGN KEY (`region_id`)
    REFERENCES `shop`.`region` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `longitude` DECIMAL(9,6) NULL,
  `latitude` DECIMAL(8) NULL,
  `city_id` INT NOT NULL,
  `region_id` INT NOT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_location_city1_idx` (`city_id` ASC),
  INDEX `fk_location_region1_idx` (`region_id` ASC),
  INDEX `fk_location_country1_idx` (`country_id` ASC),
  CONSTRAINT `fk_location_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `shop`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_region1`
    FOREIGN KEY (`region_id`)
    REFERENCES `shop`.`region` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `shop`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `hash` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `middle_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_users_location1_idx` (`location_id` ASC),
  CONSTRAINT `fk_users_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `shop`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`roles_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`roles_permissions` (
  `permission_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  `role_organisation_id` INT NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`, `role_organisation_id`),
  INDEX `fk_roles_has_permissions_permissions1_idx` (`permission_id` ASC),
  INDEX `fk_roles_permissions_roles1_idx` (`role_id` ASC, `role_organisation_id` ASC),
  CONSTRAINT `fk_roles_has_permissions_permissions1`
    FOREIGN KEY (`permission_id`)
    REFERENCES `shop`.`permissions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_roles_permissions_roles1`
    FOREIGN KEY (`role_id` , `role_organisation_id`)
    REFERENCES `shop`.`roles` (`id` , `organisation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`users_roles_applications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`users_roles_applications` (
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  `application_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`, `application_id`),
  INDEX `fk_users_has_roles_roles1_idx` (`role_id` ASC),
  INDEX `fk_users_has_roles_users1_idx` (`user_id` ASC),
  INDEX `fk_users_has_roles_applications1_idx` (`application_id` ASC),
  CONSTRAINT `fk_users_has_roles_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `shop`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_roles_roles1`
    FOREIGN KEY (`role_id`)
    REFERENCES `shop`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_roles_applications1`
    FOREIGN KEY (`application_id`)
    REFERENCES `shop`.`applications` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`products_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`products_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `parent_product_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_types_products_types1_idx` (`parent_product_type_id` ASC),
  CONSTRAINT `fk_products_types_products_types1`
    FOREIGN KEY (`parent_product_type_id`)
    REFERENCES `shop`.`products_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  `product_type_id` INT NOT NULL,
  `price` DECIMAL(10,4) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_articles_products_types1_idx` (`product_type_id` ASC),
  CONSTRAINT `fk_articles_products_types1`
    FOREIGN KEY (`product_type_id`)
    REFERENCES `shop`.`products_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`order_statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`order_statuses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `datetime` DATETIME NOT NULL,
  `order_status_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_orders_statuses1_idx` (`order_status_id` ASC),
  INDEX `fk_orders_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_orders_orders_statuses1`
    FOREIGN KEY (`order_status_id`)
    REFERENCES `shop`.`order_statuses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `shop`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`orders_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`orders_products` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `price` DECIMAL(10,4) NOT NULL,
  `quantity` DECIMAL(10,4) NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  INDEX `fk_orders_has_products_products1_idx` (`product_id` ASC),
  INDEX `fk_orders_has_products_orders1_idx` (`order_id` ASC),
  CONSTRAINT `fk_orders_has_products_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `shop`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_products_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`credit_cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`credit_cards` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(16) NOT NULL,
  `expiration_month` VARCHAR(2) NOT NULL,
  `expiration_year` VARCHAR(2) NOT NULL,
  `type_code` VARCHAR(45) NOT NULL,
  `holder` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_credit_cards_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_credit_cards_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `shop`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`payment_statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`payment_statuses` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`payments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `credit_card_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `datetime` DATETIME NOT NULL,
  `payment_status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_payments_credit_cards1_idx` (`credit_card_id` ASC),
  INDEX `fk_payments_orders1_idx` (`order_id` ASC),
  INDEX `fk_payments_payment_statuses1_idx` (`payment_status_id` ASC),
  CONSTRAINT `fk_payments_credit_cards1`
    FOREIGN KEY (`credit_card_id`)
    REFERENCES `shop`.`credit_cards` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `shop`.`orders` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_payment_statuses1`
    FOREIGN KEY (`payment_status_id`)
    REFERENCES `shop`.`payment_statuses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
