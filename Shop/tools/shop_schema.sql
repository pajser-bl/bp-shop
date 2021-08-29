CREATE DATABASE  IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shop`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `call_number` varchar(255) NOT NULL,
  `time_zone` varchar(255) NOT NULL,
  `region_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_region1_idx` (`region_id`),
  KEY `fk_city_country1_idx` (`country_id`),
  CONSTRAINT `fk_city_country1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `fk_city_region1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ISO2` varchar(2) NOT NULL,
  `ISO3` varchar(3) NOT NULL,
  `dialing_prefix` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `countries_regions`
--

DROP TABLE IF EXISTS `countries_regions`;
/*!50001 DROP VIEW IF EXISTS `countries_regions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `countries_regions` AS SELECT 
 1 AS `country_id`,
 1 AS `country_name`,
 1 AS `ISO2`,
 1 AS `ISO3`,
 1 AS `country_dialing_prefix`,
 1 AS `region_id`,
 1 AS `region_name`,
 1 AS `region_dialing_prefix`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `countries_regions_cities`
--

DROP TABLE IF EXISTS `countries_regions_cities`;
/*!50001 DROP VIEW IF EXISTS `countries_regions_cities`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `countries_regions_cities` AS SELECT 
 1 AS `country_id`,
 1 AS `country_name`,
 1 AS `ISO2`,
 1 AS `ISO3`,
 1 AS `country_dialing_prefix`,
 1 AS `region_id`,
 1 AS `region_name`,
 1 AS `region_dialing_prefix`,
 1 AS `city_id`,
 1 AS `city_name`,
 1 AS `postal_code`,
 1 AS `call_number`,
 1 AS `time_zone`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `credit_cards`
--

DROP TABLE IF EXISTS `credit_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `credit_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(16) NOT NULL,
  `expiration_month` varchar(2) NOT NULL,
  `expiration_year` varchar(2) NOT NULL,
  `type_code` varchar(45) NOT NULL,
  `holder` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_credit_cards_users1_idx` (`user_id`),
  CONSTRAINT `fk_credit_cards_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `full_locations`
--

DROP TABLE IF EXISTS `full_locations`;
/*!50001 DROP VIEW IF EXISTS `full_locations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `full_locations` AS SELECT 
 1 AS `country_id`,
 1 AS `country_name`,
 1 AS `ISO2`,
 1 AS `ISO3`,
 1 AS `country_dialing_prefix`,
 1 AS `region_id`,
 1 AS `region_name`,
 1 AS `region_dialing_prefix`,
 1 AS `city_id`,
 1 AS `city_name`,
 1 AS `postal_code`,
 1 AS `call_number`,
 1 AS `time_zone`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `longitude`,
 1 AS `latitude`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_location_city1_idx` (`city_id`),
  KEY `fk_location_region1_idx` (`region_id`),
  KEY `fk_location_country1_idx` (`country_id`),
  CONSTRAINT `fk_location_city1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `fk_location_country1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `fk_location_region1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `locations_names`
--

DROP TABLE IF EXISTS `locations_names`;
/*!50001 DROP VIEW IF EXISTS `locations_names`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `locations_names` AS SELECT 
 1 AS `Name_exp_1`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `login_by_application_id`
--

DROP TABLE IF EXISTS `login_by_application_id`;
/*!50001 DROP VIEW IF EXISTS `login_by_application_id`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `login_by_application_id` AS SELECT 
 1 AS `id`,
 1 AS `username`,
 1 AS `hash`,
 1 AS `application`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `order_info`
--

DROP TABLE IF EXISTS `order_info`;
/*!50001 DROP VIEW IF EXISTS `order_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `order_info` AS SELECT 
 1 AS `order_id`,
 1 AS `order_datetime`,
 1 AS `order_status_id`,
 1 AS `orders_status_name`,
 1 AS `orders_status_description`,
 1 AS `payment_id`,
 1 AS `credit_card_id`,
 1 AS `payment_datetime`,
 1 AS `amount`,
 1 AS `payment_status_id`,
 1 AS `payment_status_name`,
 1 AS `payment_status_description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!50001 DROP VIEW IF EXISTS `order_products`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `order_products` AS SELECT 
 1 AS `product_id`,
 1 AS `order_id`,
 1 AS `quantity`,
 1 AS `price`,
 1 AS `name`,
 1 AS `description`,
 1 AS `product_type_id`,
 1 AS `product_type_name`,
 1 AS `product_type_description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_orders_statuses1_idx` (`order_status_id`),
  KEY `fk_orders_users1_idx` (`user_id`),
  CONSTRAINT `fk_orders_orders_statuses1` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`),
  CONSTRAINT `fk_orders_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders_products` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `quantity` decimal(10,4) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `fk_orders_has_products_products1_idx` (`product_id`),
  KEY `fk_orders_has_products_orders1_idx` (`order_id`),
  CONSTRAINT `fk_orders_has_products_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_orders_has_products_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisations`
--

DROP TABLE IF EXISTS `organisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `organisations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `application_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_organisations_applications1_idx` (`application_id`),
  CONSTRAINT `fk_organisations_applications1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_statuses`
--

DROP TABLE IF EXISTS `payment_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_card_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `payment_status_id` int(11) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payments_credit_cards1_idx` (`credit_card_id`),
  KEY `fk_payments_orders1_idx` (`order_id`),
  KEY `fk_payments_payment_statuses1_idx` (`payment_status_id`),
  CONSTRAINT `fk_payments_credit_cards1` FOREIGN KEY (`credit_card_id`) REFERENCES `credit_cards` (`id`),
  CONSTRAINT `fk_payments_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`user_id`),
  CONSTRAINT `fk_payments_payment_statuses1` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `product_with_type`
--

DROP TABLE IF EXISTS `product_with_type`;
/*!50001 DROP VIEW IF EXISTS `product_with_type`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `product_with_type` AS SELECT 
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `product_description`,
 1 AS `product_price`,
 1 AS `type_id`,
 1 AS `type_name`,
 1 AS `type_description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `product_type_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_articles_products_types1_idx` (`product_type_id`),
  CONSTRAINT `fk_articles_products_types1` FOREIGN KEY (`product_type_id`) REFERENCES `products_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products_types`
--

DROP TABLE IF EXISTS `products_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(45) NOT NULL,
  `parent_product_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_types_products_types1_idx` (`parent_product_type_id`),
  CONSTRAINT `fk_products_types_products_types1` FOREIGN KEY (`parent_product_type_id`) REFERENCES `products_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `products_types_names`
--

DROP TABLE IF EXISTS `products_types_names`;
/*!50001 DROP VIEW IF EXISTS `products_types_names`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `products_types_names` AS SELECT 
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dialing_prefix` varchar(45) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_region_country1_idx` (`country_id`),
  CONSTRAINT `fk_region_country1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `organisation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`organisation_id`),
  KEY `fk_roles_organisations1_idx` (`organisation_id`),
  CONSTRAINT `fk_roles_organisations1` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles_permissions`
--

DROP TABLE IF EXISTS `roles_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles_permissions` (
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `role_organisation_id` int(11) NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`,`role_organisation_id`),
  KEY `fk_roles_has_permissions_permissions1_idx` (`permission_id`),
  KEY `fk_roles_permissions_roles1_idx` (`role_id`,`role_organisation_id`),
  CONSTRAINT `fk_roles_has_permissions_permissions1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `fk_roles_permissions_roles1` FOREIGN KEY (`role_id`, `role_organisation_id`) REFERENCES `roles` (`id`, `organisation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_users_location1_idx` (`location_id`),
  CONSTRAINT `fk_users_location1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_roles_applications`
--

DROP TABLE IF EXISTS `users_roles_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_roles_applications` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`,`application_id`),
  KEY `fk_users_has_roles_roles1_idx` (`role_id`),
  KEY `fk_users_has_roles_users1_idx` (`user_id`),
  KEY `fk_users_has_roles_applications1_idx` (`application_id`),
  CONSTRAINT `fk_users_has_roles_applications1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `fk_users_has_roles_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_users_has_roles_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `users_with_roles`
--

DROP TABLE IF EXISTS `users_with_roles`;
/*!50001 DROP VIEW IF EXISTS `users_with_roles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `users_with_roles` AS SELECT 
 1 AS `id`,
 1 AS `username`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `hash`,
 1 AS `first_name`,
 1 AS `middle_name`,
 1 AS `last_name`,
 1 AS `location_id`,
 1 AS `role_id`,
 1 AS `role_name`,
 1 AS `application_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `countries_regions`
--

/*!50001 DROP VIEW IF EXISTS `countries_regions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `countries_regions` AS select `c`.`id` AS `country_id`,`c`.`name` AS `country_name`,`c`.`ISO2` AS `ISO2`,`c`.`ISO3` AS `ISO3`,`c`.`dialing_prefix` AS `country_dialing_prefix`,`r`.`id` AS `region_id`,`r`.`name` AS `region_name`,`r`.`dialing_prefix` AS `region_dialing_prefix` from (`countries` `c` join `regions` `r` on((`r`.`country_id` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `countries_regions_cities`
--

/*!50001 DROP VIEW IF EXISTS `countries_regions_cities`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `countries_regions_cities` AS select `c`.`id` AS `country_id`,`c`.`name` AS `country_name`,`c`.`ISO2` AS `ISO2`,`c`.`ISO3` AS `ISO3`,`c`.`dialing_prefix` AS `country_dialing_prefix`,`r`.`id` AS `region_id`,`r`.`name` AS `region_name`,`r`.`dialing_prefix` AS `region_dialing_prefix`,`ci`.`id` AS `city_id`,`ci`.`name` AS `city_name`,`ci`.`postal_code` AS `postal_code`,`ci`.`call_number` AS `call_number`,`ci`.`time_zone` AS `time_zone` from ((`countries` `c` join `regions` `r` on((`r`.`country_id` = `c`.`id`))) join `cities` `ci` on(((`ci`.`region_id` = `r`.`id`) and (`ci`.`country_id` = `c`.`id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `full_locations`
--

/*!50001 DROP VIEW IF EXISTS `full_locations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `full_locations` AS select `q`.`country_id` AS `country_id`,`q`.`country_name` AS `country_name`,`q`.`ISO2` AS `ISO2`,`q`.`ISO3` AS `ISO3`,`q`.`country_dialing_prefix` AS `country_dialing_prefix`,`q`.`region_id` AS `region_id`,`q`.`region_name` AS `region_name`,`q`.`region_dialing_prefix` AS `region_dialing_prefix`,`q`.`city_id` AS `city_id`,`q`.`city_name` AS `city_name`,`q`.`postal_code` AS `postal_code`,`q`.`call_number` AS `call_number`,`q`.`time_zone` AS `time_zone`,`l`.`id` AS `location_id`,`l`.`name` AS `location_name`,`l`.`longitude` AS `longitude`,`l`.`latitude` AS `latitude` from (`locations` `l` join `countries_regions_cities` `q` on((`q`.`city_id` = `l`.`city_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `locations_names`
--

/*!50001 DROP VIEW IF EXISTS `locations_names`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `locations_names` AS select concat(`full_locations`.`country_name`,'/',`full_locations`.`region_name`,'/',`full_locations`.`city_name`,'/',`full_locations`.`location_name`) AS `Name_exp_1` from `full_locations` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `login_by_application_id`
--

/*!50001 DROP VIEW IF EXISTS `login_by_application_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `login_by_application_id` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`hash` AS `hash`,`ura`.`application_id` AS `application` from (`users` `u` join `users_roles_applications` `ura` on((`ura`.`user_id` = `u`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_info`
--

/*!50001 DROP VIEW IF EXISTS `order_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `order_info` AS select `o`.`id` AS `order_id`,`o`.`datetime` AS `order_datetime`,`o`.`order_status_id` AS `order_status_id`,`os`.`name` AS `orders_status_name`,`os`.`description` AS `orders_status_description`,`p`.`id` AS `payment_id`,`p`.`credit_card_id` AS `credit_card_id`,`p`.`datetime` AS `payment_datetime`,`p`.`amount` AS `amount`,`p`.`payment_status_id` AS `payment_status_id`,`ps`.`name` AS `payment_status_name`,`ps`.`description` AS `payment_status_description` from (((`orders` `o` join `order_statuses` `os` on((`o`.`order_status_id` = `os`.`id`))) join `payments` `p` on((`p`.`order_id` = `o`.`id`))) join `payment_statuses` `ps` on((`p`.`payment_status_id` = `ps`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_products`
--

/*!50001 DROP VIEW IF EXISTS `order_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `order_products` AS select `op`.`product_id` AS `product_id`,`op`.`order_id` AS `order_id`,`op`.`quantity` AS `quantity`,`op`.`price` AS `price`,`p`.`name` AS `name`,`p`.`description` AS `description`,`p`.`product_type_id` AS `product_type_id`,`pt`.`name` AS `product_type_name`,`pt`.`description` AS `product_type_description` from ((`products` `p` join `products_types` `pt` on((`pt`.`id` = `p`.`product_type_id`))) join `orders_products` `op` on((`op`.`product_id` = `p`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_with_type`
--

/*!50001 DROP VIEW IF EXISTS `product_with_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `product_with_type` AS select `p`.`id` AS `product_id`,`p`.`name` AS `product_name`,`p`.`description` AS `product_description`,`p`.`price` AS `product_price`,`t`.`id` AS `type_id`,`t`.`name` AS `type_name`,`t`.`description` AS `type_description` from (`products` `p` join `products_types` `t` on((`t`.`id` = `p`.`product_type_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `products_types_names`
--

/*!50001 DROP VIEW IF EXISTS `products_types_names`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `products_types_names` AS select `products_types`.`name` AS `name` from `products_types` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_with_roles`
--

/*!50001 DROP VIEW IF EXISTS `users_with_roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `users_with_roles` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`email` AS `email`,`u`.`phone` AS `phone`,`u`.`hash` AS `hash`,`u`.`first_name` AS `first_name`,`u`.`middle_name` AS `middle_name`,`u`.`last_name` AS `last_name`,`u`.`location_id` AS `location_id`,`r`.`id` AS `role_id`,`r`.`name` AS `role_name`,`ura`.`application_id` AS `application_id` from ((`users` `u` join `users_roles_applications` `ura` on((`ura`.`user_id` = `u`.`id`))) join `roles` `r` on((`ura`.`role_id` = `r`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-29 23:14:09
