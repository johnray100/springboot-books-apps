/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 11.4.2-MariaDB : Database - masterdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`masterdb` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `masterdb`;

/*Table structure for table `authors` */

DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(250) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK9mhkwvnfaarcalo4noabrin5j` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `authors` */

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(250) NOT NULL,
  `fee` int(11) NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKehpdfjpu1jm3hijhj4mm0hx9h` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `book` */

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(250) NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkibbepcitr0a3cpk3rfr7nihn` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `books` */

/*Table structure for table `books_authors` */

DROP TABLE IF EXISTS `books_authors`;

CREATE TABLE `books_authors` (
  `book_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `FK3qua08pjd1ca1fe2x5cgohuu5` (`author_id`),
  CONSTRAINT `FK1b933slgixbjdslgwu888m34v` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `FK3qua08pjd1ca1fe2x5cgohuu5` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `books_authors` */

/*Table structure for table `books_categories` */

DROP TABLE IF EXISTS `books_categories`;

CREATE TABLE `books_categories` (
  `book_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`book_id`,`category_id`),
  KEY `FK4klp9o273ej1ywgmie14rvdx3` (`category_id`),
  CONSTRAINT `FK4klp9o273ej1ywgmie14rvdx3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FKmsuoucvyyccli3f6u59co41cq` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `books_categories` */

/*Table structure for table `books_publishers` */

DROP TABLE IF EXISTS `books_publishers`;

CREATE TABLE `books_publishers` (
  `book_id` bigint(20) NOT NULL,
  `publisher_id` bigint(20) NOT NULL,
  PRIMARY KEY (`book_id`,`publisher_id`),
  KEY `FKmtlqmi0xvd1k9l6xrh87fdal9` (`publisher_id`),
  CONSTRAINT `FK94y532bxn8867e1eg2g05x3d7` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `FKmtlqmi0xvd1k9l6xrh87fdal9` FOREIGN KEY (`publisher_id`) REFERENCES `authors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `books_publishers` */

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKt8o6pivur7nn124jehx7cygw5` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`) values 
(1,'Horror'),
(2,'Love Story');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
