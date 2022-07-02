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
USE `shop` ;

-- -----------------------------------------------------
-- Placeholder table for view `shop`.`countries_regions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`countries_regions` (`country_id` INT, `country_name` INT, `ISO2` INT, `ISO3` INT, `country_dialing_prefix` INT, `region_id` INT, `region_name` INT, `region_dialing_prefix` INT);

-- -----------------------------------------------------
-- Placeholder table for view `shop`.`countries_regions_cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`countries_regions_cities` (`country_id` INT, `country_name` INT, `ISO2` INT, `ISO3` INT, `country_dialing_prefix` INT, `region_id` INT, `region_name` INT, `region_dialing_prefix` INT, `city_id` INT, `city_name` INT, `postal_code` INT, `call_number` INT, `time_zone` INT);

-- -----------------------------------------------------
-- Placeholder table for view `shop`.`login_by_application_id`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`login_by_application_id` (`id` INT, `username` INT, `hash` INT, `application` INT);

-- -----------------------------------------------------
-- Placeholder table for view `shop`.`order_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`order_info` (`order_id` INT, `order_datetime` INT, `order_status_id` INT, `orders_status_name` INT, `orders_status_description` INT, `payment_id` INT, `credit_card_id` INT, `payment_datetime` INT, `amount` INT, `payment_status_id` INT, `payment_status_name` INT, `payment_status_description` INT);

-- -----------------------------------------------------
-- Placeholder table for view `shop`.`order_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`order_products` (`product_id` INT, `order_id` INT, `quantity` INT, `price` INT, `name` INT, `description` INT, `product_type_id` INT, `product_type_name` INT, `product_type_description` INT);

-- -----------------------------------------------------
-- Placeholder table for view `shop`.`product_with_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`product_with_type` (`product_id` INT, `product_name` INT, `product_description` INT, `product_price` INT, `type_id` INT, `type_name` INT, `type_description` INT);

-- -----------------------------------------------------
-- Placeholder table for view `shop`.`products_types_names`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`products_types_names` (`name` INT);

-- -----------------------------------------------------
-- Placeholder table for view `shop`.`users_with_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`users_with_roles` (`id` INT, `username` INT, `email` INT, `phone` INT, `hash` INT, `first_name` INT, `middle_name` INT, `last_name` INT, `location_id` INT, `role_id` INT, `role_name` INT, `application_id` INT);

-- -----------------------------------------------------
-- View `shop`.`countries_regions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop`.`countries_regions`;
USE `shop`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `shop`.`countries_regions` AS select `c`.`id` AS `country_id`,`c`.`name` AS `country_name`,`c`.`ISO2` AS `ISO2`,`c`.`ISO3` AS `ISO3`,`c`.`dialing_prefix` AS `country_dialing_prefix`,`r`.`id` AS `region_id`,`r`.`name` AS `region_name`,`r`.`dialing_prefix` AS `region_dialing_prefix` from (`shop`.`countries` `c` join `shop`.`regions` `r` on((`r`.`country_id` = `c`.`id`)));

-- -----------------------------------------------------
-- View `shop`.`countries_regions_cities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop`.`countries_regions_cities`;
USE `shop`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `shop`.`countries_regions_cities` AS select `c`.`id` AS `country_id`,`c`.`name` AS `country_name`,`c`.`ISO2` AS `ISO2`,`c`.`ISO3` AS `ISO3`,`c`.`dialing_prefix` AS `country_dialing_prefix`,`r`.`id` AS `region_id`,`r`.`name` AS `region_name`,`r`.`dialing_prefix` AS `region_dialing_prefix`,`ci`.`id` AS `city_id`,`ci`.`name` AS `city_name`,`ci`.`postal_code` AS `postal_code`,`ci`.`call_number` AS `call_number`,`ci`.`time_zone` AS `time_zone` from ((`shop`.`countries` `c` join `shop`.`regions` `r` on((`r`.`country_id` = `c`.`id`))) join `shop`.`cities` `ci` on(((`ci`.`region_id` = `r`.`id`) and (`ci`.`country_id` = `c`.`id`))));

-- -----------------------------------------------------
-- View `shop`.`login_by_application_id`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop`.`login_by_application_id`;
USE `shop`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `shop`.`login_by_application_id` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`hash` AS `hash`,`ura`.`application_id` AS `application` from (`shop`.`users` `u` join `shop`.`users_roles_applications` `ura` on((`ura`.`user_id` = `u`.`id`)));

-- -----------------------------------------------------
-- View `shop`.`order_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop`.`order_info`;
USE `shop`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `shop`.`order_info` AS select `o`.`id` AS `order_id`,`o`.`datetime` AS `order_datetime`,`o`.`order_status_id` AS `order_status_id`,`os`.`name` AS `orders_status_name`,`os`.`description` AS `orders_status_description`,`p`.`id` AS `payment_id`,`p`.`credit_card_id` AS `credit_card_id`,`p`.`datetime` AS `payment_datetime`,`p`.`amount` AS `amount`,`p`.`payment_status_id` AS `payment_status_id`,`ps`.`name` AS `payment_status_name`,`ps`.`description` AS `payment_status_description` from (((`shop`.`orders` `o` join `shop`.`order_statuses` `os` on((`o`.`order_status_id` = `os`.`id`))) join `shop`.`payments` `p` on((`p`.`order_id` = `o`.`id`))) join `shop`.`payment_statuses` `ps` on((`p`.`payment_status_id` = `ps`.`id`)));

-- -----------------------------------------------------
-- View `shop`.`order_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop`.`order_products`;
USE `shop`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `shop`.`order_products` AS select `op`.`product_id` AS `product_id`,`op`.`order_id` AS `order_id`,`op`.`quantity` AS `quantity`,`op`.`price` AS `price`,`p`.`name` AS `name`,`p`.`description` AS `description`,`p`.`product_type_id` AS `product_type_id`,`pt`.`name` AS `product_type_name`,`pt`.`description` AS `product_type_description` from ((`shop`.`products` `p` join `shop`.`products_types` `pt` on((`pt`.`id` = `p`.`product_type_id`))) join `shop`.`orders_products` `op` on((`op`.`product_id` = `p`.`id`)));

-- -----------------------------------------------------
-- View `shop`.`product_with_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop`.`product_with_type`;
USE `shop`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `shop`.`product_with_type` AS select `p`.`id` AS `product_id`,`p`.`name` AS `product_name`,`p`.`description` AS `product_description`,`p`.`price` AS `product_price`,`t`.`id` AS `type_id`,`t`.`name` AS `type_name`,`t`.`description` AS `type_description` from (`shop`.`products` `p` join `shop`.`products_types` `t` on((`t`.`id` = `p`.`product_type_id`)));

-- -----------------------------------------------------
-- View `shop`.`products_types_names`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop`.`products_types_names`;
USE `shop`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `shop`.`products_types_names` AS select `shop`.`products_types`.`name` AS `name` from `shop`.`products_types`;

-- -----------------------------------------------------
-- View `shop`.`users_with_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop`.`users_with_roles`;
USE `shop`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `shop`.`users_with_roles` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`email` AS `email`,`u`.`phone` AS `phone`,`u`.`hash` AS `hash`,`u`.`first_name` AS `first_name`,`u`.`middle_name` AS `middle_name`,`u`.`last_name` AS `last_name`,`u`.`location_id` AS `location_id`,`r`.`id` AS `role_id`,`r`.`name` AS `role_name`,`ura`.`application_id` AS `application_id` from ((`shop`.`users` `u` join `shop`.`users_roles_applications` `ura` on((`ura`.`user_id` = `u`.`id`))) join `shop`.`roles` `r` on((`ura`.`role_id` = `r`.`id`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
