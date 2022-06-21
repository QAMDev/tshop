/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 5.7.33 : Database - tshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE `tshop_db`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_popular` tinyint(4) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `categories` */

insert  into `categories`(`id`,`parent_id`,`title`,`is_popular`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values
(1,NULL,'cat1',0,1,'2022-05-31 19:51:03','2022-05-31 19:51:03',NULL),
(2,1,'subcat1-edit',0,1,'2022-05-31 19:56:11','2022-05-31 20:43:04',NULL);

/*Table structure for table `category_products` */

DROP TABLE IF EXISTS `category_products`;

CREATE TABLE `category_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `category_products` */

insert  into `category_products`(`id`,`product_id`,`category_id`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values
(1,1,2,1,'2022-05-31 21:45:58','2022-05-31 21:45:58',NULL),
(2,2,2,1,'2022-05-31 21:47:22','2022-05-31 21:47:22',NULL),
(3,3,2,1,'2022-06-08 22:19:39','2022-06-08 22:19:39',NULL),
(4,4,2,1,'2022-06-08 22:20:11','2022-06-08 22:20:11',NULL);

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `customers` */

insert  into `customers`(`id`,`shop_id`,`phone_number`,`email`,`name`,`created_at`,`updated_at`,`deleted_at`) values
(1,2,'+923142558569','customer1@yopmail.com','QCustomer','2022-05-24 12:49:18','2022-05-24 12:49:18',NULL),
(2,1,'+123456789','tese_new@yopmail.com','Test New','2022-06-21 16:20:16','2022-06-21 16:20:16',NULL);

/*Table structure for table `inventories` */

DROP TABLE IF EXISTS `inventories`;

CREATE TABLE `inventories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `quantity` float DEFAULT '1',
  `length` float DEFAULT '10',
  `unit` varchar(6) DEFAULT 'meter',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `inventories` */

insert  into `inventories`(`id`,`product_id`,`quantity`,`length`,`unit`) values
(1,2,100,2,'meter'),
(2,1,-1.5,3,'meter'),
(3,3,22,2,'meter'),
(4,4,4,2,'meter');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `password_resets` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) unsigned NOT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` float NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `products` */

insert  into `products`(`id`,`shop_id`,`sku`,`title`,`slug`,`description`,`price`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values
(1,2,'111','pro1','title','test',2,1,'2022-05-31 21:45:58','2022-06-01 21:06:10',NULL),
(2,1,'31112','pro2','title','2',22,1,'2022-05-31 21:47:22','2022-06-01 21:06:01',NULL),
(3,2,'333','pro3','title','test',22,1,'2022-06-08 22:19:39','2022-06-08 22:19:50',NULL),
(4,2,'444','pro4','title','tedt',44,1,'2022-06-08 22:20:11','2022-06-08 22:20:11',NULL);

/*Table structure for table `receipt_details` */

DROP TABLE IF EXISTS `receipt_details`;

CREATE TABLE `receipt_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `unit` varchar(6) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `receipt_details` */

insert  into `receipt_details`(`id`,`receipt_id`,`product_id`,`quantity`,`unit_price`,`unit`,`price`) values
(1,1,1,2,2,NULL,NULL),
(2,3,1,2,2,NULL,NULL),
(3,6,1,1,2,NULL,2),
(4,2,1,2,2,NULL,NULL),
(5,2,3,1,22,NULL,NULL),
(6,6,3,2,22,NULL,44),
(7,7,1,1,2,NULL,2),
(8,7,3,4,22,NULL,88),
(9,5,1,3,2,NULL,6),
(10,8,1,4,NULL,'meter',8),
(11,8,3,1,NULL,'meter',22),
(12,4,2,1,NULL,NULL,22),
(13,9,1,1,NULL,'meter',2),
(14,10,1,1,NULL,'meter',2),
(15,11,1,2,NULL,'meter',4),
(16,12,1,10,NULL,'meter',20),
(17,13,2,1,NULL,'meter',22),
(18,14,1,2.5,NULL,'meter',5);

/*Table structure for table `receipts` */

DROP TABLE IF EXISTS `receipts`;

CREATE TABLE `receipts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(40) DEFAULT NULL,
  `shop_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `receipts` */

insert  into `receipts`(`id`,`uid`,`shop_id`,`customer_id`,`sub_total`,`discount`,`total`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values
(1,11,2,1,NULL,NULL,NULL,0,'2022-06-08 17:51:27','2022-06-08 17:51:27',NULL),
(2,12,2,1,NULL,NULL,NULL,1,'2022-06-08 17:53:57','2022-06-08 17:53:57',NULL),
(3,13,2,1,NULL,NULL,NULL,1,'2022-06-08 17:54:49','2022-06-08 17:54:49',NULL),
(4,14,2,1,22,0,22,1,'2022-06-08 22:24:38','2022-06-10 23:17:43',NULL),
(5,15,2,1,6,0,6,1,'2022-06-08 22:26:38','2022-06-10 23:17:25',NULL),
(6,16,2,1,46,0,46,1,'2022-06-08 22:40:36','2022-06-10 23:17:19',NULL),
(7,17,2,1,90,0,90,1,'2022-06-08 22:44:55','2022-06-10 23:17:03',NULL),
(8,18,2,1,30,2,28,1,'2022-06-10 22:58:49','2022-06-10 23:16:29',NULL),
(9,19,2,1,2,NULL,2,0,'2022-06-13 21:57:02','2022-06-13 21:57:02',NULL),
(10,110,2,1,2,NULL,2,0,'2022-06-13 22:00:35','2022-06-13 22:00:35',NULL),
(11,111,2,1,4,NULL,4,0,'2022-06-13 22:01:13','2022-06-13 22:01:13',NULL),
(12,112,2,1,20,NULL,20,0,'2022-06-13 22:01:58','2022-06-13 22:01:58',NULL),
(13,213,1,2,22,0,22,1,'2022-06-21 16:20:16','2022-06-21 16:20:16',NULL),
(14,114,2,1,5,0.5,4.5,1,'2022-06-21 17:13:00','2022-06-21 21:27:52',NULL);

/*Table structure for table `sales_purchases` */

DROP TABLE IF EXISTS `sales_purchases`;

CREATE TABLE `sales_purchases` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `type` enum('sale','purchase') DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `sales_purchases` */

insert  into `sales_purchases`(`id`,`shop_id`,`product_id`,`type`,`quantity`,`price`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values
(1,1,2,'sale',2,25,1,'2022-06-16 21:29:10','2022-06-16 21:34:32',NULL),
(2,2,1,'sale',3,2,NULL,'2022-06-21 17:55:53','2022-06-21 17:55:53',NULL),
(3,2,1,'sale',3,2,NULL,'2022-06-21 17:57:13','2022-06-21 17:57:13',NULL),
(4,2,1,'sale',2.5,2,0,'2022-06-21 21:22:32','2022-06-21 21:25:28',NULL),
(5,2,1,'sale',3,2,NULL,'2022-06-21 21:25:48','2022-06-21 21:25:48',NULL),
(6,2,1,'sale',2.5,2,NULL,'2022-06-21 21:27:52','2022-06-21 21:27:52',NULL);

/*Table structure for table `shop_users` */

DROP TABLE IF EXISTS `shop_users`;

CREATE TABLE `shop_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `shop_users` */

insert  into `shop_users`(`id`,`shop_id`,`user_id`) values
(1,1,8);

/*Table structure for table `shops` */

DROP TABLE IF EXISTS `shops`;

CREATE TABLE `shops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `shops` */

insert  into `shops`(`id`,`user_id`,`name`,`email`,`contact`,`address`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values
(1,6,'Shop 1','shop1@yopmail.com','+1111111111','test',1,'2022-05-23 21:50:48','2022-05-24 10:52:06',NULL),
(2,7,'QShop','qshop@yopmail.com','+11111111111','test',1,'2022-05-24 12:38:07','2022-05-24 12:38:07',NULL);

/*Table structure for table `system_modules` */

DROP TABLE IF EXISTS `system_modules`;

CREATE TABLE `system_modules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `permit_sort` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_modules` */

insert  into `system_modules`(`id`,`title`,`slug`,`route_name`,`icon`,`class`,`parent_id`,`sort`,`permit_sort`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values
(1,'Dashboard','dashboard','dashboard','shopping-bag',NULL,0,1,0,1,NULL,NULL,NULL),
(2,'System Users','management',NULL,'users','with-sub',0,2,0,1,NULL,NULL,NULL),
(3,'Roles Management','roles','roles.show','circle-o',NULL,2,0,1,1,NULL,NULL,NULL),
(4,'Users Management','users','users.show','circle-o',NULL,2,0,2,1,NULL,NULL,NULL),
(5,'Shops Management','shops','shops.show','shopping-cart',NULL,0,3,0,1,NULL,NULL,NULL),
(6,'Customers Management','customers','customers.show','user',NULL,0,6,0,1,NULL,NULL,NULL),
(7,'Inventory Management','inventory',NULL,'shopping-cart','with-sub',0,4,0,1,NULL,NULL,NULL),
(8,'Categories','categories','categories.show','circle-o',NULL,7,0,0,1,NULL,NULL,NULL),
(9,'Products','products','products.show','circle-o',NULL,7,0,1,1,NULL,NULL,NULL),
(10,'Billing','billing',NULL,'file-text','with-sub',0,8,0,1,NULL,NULL,NULL),
(11,'Receipt','receipts','receipts.show','circle-o',NULL,10,0,2,1,NULL,NULL,NULL),
(12,'Sales/Purchase Management','sales-purchase','sales-purchase.show','file-text',NULL,0,7,0,1,NULL,NULL,NULL);

/*Table structure for table `system_role_permissions` */

DROP TABLE IF EXISTS `system_role_permissions`;

CREATE TABLE `system_role_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `system_module` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT '0',
  `add` tinyint(1) NOT NULL DEFAULT '0',
  `edit` tinyint(1) NOT NULL DEFAULT '0',
  `delete` tinyint(1) NOT NULL DEFAULT '0',
  `view` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_role_permissions_system_module_id_foreign` (`system_module`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_role_permissions` */

insert  into `system_role_permissions`(`id`,`system_module`,`system_role`,`is_visible`,`add`,`edit`,`delete`,`view`,`created_at`,`updated_at`) values
(40,'users','shop',0,0,0,0,0,'2020-03-29 16:17:09','2020-03-29 16:17:09'),
(41,'roles','shop',0,0,0,0,0,'2020-03-29 16:17:09','2020-03-29 16:17:09'),
(42,'shops','shop',0,0,0,0,0,'2020-03-29 16:17:09','2020-03-29 16:17:09'),
(43,'agents','shop',0,1,1,1,1,'2020-03-29 16:17:09','2020-03-29 16:17:09'),
(44,'current_recalls','shop',0,0,0,0,0,'2020-03-29 16:17:09','2020-03-29 16:17:09'),
(45,'customers','shop',1,1,1,1,1,'2020-03-29 16:17:09','2020-03-29 16:17:09'),
(46,'recalled_products','shop',0,0,0,0,1,'2020-03-29 16:17:09','2020-03-29 16:17:09'),
(47,'email_templates','shop',1,1,1,1,1,'2020-03-29 16:17:09','2020-03-29 16:17:09'),
(48,'sms_templates','shop',1,1,1,1,1,'2020-03-29 16:17:09','2020-03-29 16:17:09'),
(67,'users','agent',0,0,0,0,0,'2020-03-29 16:22:50','2020-03-29 16:22:50'),
(68,'roles','agent',0,0,0,0,0,'2020-03-29 16:22:50','2020-03-29 16:22:50'),
(69,'shops','agent',0,0,0,0,0,'2020-03-29 16:22:50','2020-03-29 16:22:50'),
(70,'recalled_products','agent',0,0,0,0,0,'2020-03-29 16:22:50','2020-03-29 16:22:50'),
(71,'current_recalls','agent',0,0,0,0,0,'2020-03-29 16:22:50','2020-03-29 16:22:50'),
(72,'customers','agent',0,1,0,0,0,'2020-03-29 16:22:50','2020-03-29 16:22:50'),
(73,'agents','agent',0,0,0,0,0,'2020-03-29 16:22:50','2020-03-29 16:22:50'),
(74,'email_templates','agent',0,0,0,0,0,'2020-03-29 16:22:50','2020-03-29 16:22:50'),
(75,'sms_templates','agent',0,0,0,0,0,'2020-03-29 16:22:50','2020-03-29 16:22:50'),
(85,'categories','admin',1,1,1,1,1,'2022-05-31 19:15:11','2022-05-31 19:15:11'),
(86,'products','admin',1,1,1,1,1,'2022-05-31 19:15:11','2022-05-31 19:15:11'),
(87,'users','admin',1,1,1,1,1,'2022-05-31 19:15:11','2022-05-31 19:15:11'),
(88,'roles','admin',1,1,1,1,1,'2022-05-31 19:15:11','2022-05-31 19:15:11'),
(89,'shops','admin',1,1,1,1,1,'2022-05-31 19:15:11','2022-05-31 19:15:11'),
(90,'inventory','admin',1,1,1,1,1,'2022-05-31 19:15:11','2022-05-31 19:15:11'),
(91,'customers','admin',1,1,1,1,1,'2022-05-31 19:15:11','2022-05-31 19:15:11'),
(92,'billing','admin',1,1,1,1,1,'2022-05-31 19:15:11','2022-05-31 19:15:11'),
(93,'receipts','admin',1,1,1,1,1,'2022-05-31 19:15:11','2022-05-31 19:15:11'),
(94,'sales-purchase','admin',1,1,1,1,1,NULL,NULL);

/*Table structure for table `system_roles` */

DROP TABLE IF EXISTS `system_roles`;

CREATE TABLE `system_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_superadmin` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_roles` */

insert  into `system_roles`(`id`,`title`,`slug`,`is_superadmin`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values
(1,'Admin','admin',1,1,NULL,NULL,NULL),
(2,'Shop','shop',0,1,'2019-10-22 14:51:53','2019-10-22 14:51:53',NULL);

/*Table structure for table `system_settings` */

DROP TABLE IF EXISTS `system_settings`;

CREATE TABLE `system_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `input_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_settings` */

insert  into `system_settings`(`id`,`label`,`slug`,`value`,`input_type`,`helper`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values
(1,'Maintenance Mode','maintenance-mode','0','checkbox',NULL,1,NULL,NULL,NULL);

/*Table structure for table `system_statistics` */

DROP TABLE IF EXISTS `system_statistics`;

CREATE TABLE `system_statistics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_statistics` */

/*Table structure for table `system_statuses` */

DROP TABLE IF EXISTS `system_statuses`;

CREATE TABLE `system_statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_statuses` */

/*Table structure for table `uploads` */

DROP TABLE IF EXISTS `uploads`;

CREATE TABLE `uploads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_ref_id` bigint(20) DEFAULT NULL,
  `ref_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesize` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `uploads` */

insert  into `uploads`(`id`,`model_name`,`model_ref_id`,`ref_name`,`source`,`thumbnail`,`filename`,`filesize`,`caption`,`created_at`,`updated_at`,`deleted_at`) values
(1,'users',1,'user','uploads/1/1653391679ed74d5259d2b415e958d71e9f6e434e0.jpg','uploads/1/thumbnail/1653391679ed74d5259d2b415e958d71e9f6e434e0.jpg','ed74d5259d2b415e958d71e9f6e434e0.jpg','13.22 KB','Administrator','2022-05-24 11:27:36','2022-05-24 11:27:59',NULL),
(2,'users',7,'user','uploads/7/1653395887imgg.png','uploads/7/thumbnail/1653395887imgg.png','imgg.png','2.22 KB','QShop','2022-05-24 12:38:07','2022-05-24 12:38:07',NULL),
(3,'users',8,'user','uploads/8/1655331755avatar.jpg','uploads/8/thumbnail/1655331755avatar.jpg','avatar.jpg','2.75 KB','','2022-06-15 21:39:00','2022-06-15 22:22:35',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'shop',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`role`,`name`,`email`,`password`,`contact`,`is_active`,`email_verified_at`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values
(1,'admin','Administrator','admin@tshop.com','$2y$10$kOtT2PPN22nepXVdr8sUB..b6eX6O.WEQ5Hx9OPo9s.3DNEWmviXG',NULL,1,'2019-12-08 18:36:03',NULL,NULL,'2022-05-24 11:40:26',NULL),
(6,'shop','Store 1','store1@yopmail.com','$2y$10$Dd1BON8MPFtJuRpZplQ0m.OFowHSFPEtaHkBcwCvRCQ4gUhFvW/Wu',NULL,1,NULL,NULL,'2022-05-23 21:50:48','2022-05-23 21:50:48',NULL),
(7,'shop','QShop','qshop@yopmail.com','$2y$10$lSdcPpHMv/wnG8mbpx81ouSUOZlrQiD4RXoze24NTfOsTzuUkJ/N.',NULL,1,NULL,NULL,'2022-05-24 12:38:07','2022-05-24 12:38:07',NULL),
(8,'shop','User','user1s1@yopmail.com','$2y$10$3aPBCWy.3y5vTjpjsr17nextrnuPWZh8g0N1SXaesGCNDxaK61r.u','+923458745896',1,NULL,NULL,'2022-06-15 21:38:59','2022-06-15 22:22:21',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
