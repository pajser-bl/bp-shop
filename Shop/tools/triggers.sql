-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `shop` ;
USE `shop`;

DELIMITER $$
USE `shop`$$
CREATE
DEFINER=`root`@`%`
TRIGGER `shop`.`countries_BEFORE_INSERT`
BEFORE INSERT ON `shop`.`countries`
FOR EACH ROW
BEGIN
	IF lower(NEW.name) like "kosovo" or lower(NEW.ISO2) = 'xk' or lower(NEW.ISO3) = 'KOS' or NEW.dialing_prefix='383' then
            signal sqlstate '02000' set MESSAGE_TEXT = 'Error: Kosovo is not a country.';
        end if;
END$$

USE `shop`$$
CREATE
DEFINER=`root`@`%`
TRIGGER `shop`.`integrity_check_update`
BEFORE UPDATE ON `shop`.`countries`
FOR EACH ROW
begin
        IF lower(NEW.name) like "kosovo" or lower(NEW.ISO2) = 'xk' or lower(NEW.ISO3) = 'KOS' or NEW.dialing_prefix='383' then
            signal sqlstate '02000' set MESSAGE_TEXT = 'Error: Kosovo is not a country.';
        end if;
    end$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
