/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 8.0.16 : Database - aletaby_s4demo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`aletaby_s4demo` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `aletaby_s4demo`;

/*Table structure for table `class` */

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `class` */

insert  into `class`(`id`,`name`,`description`,`date_create`,`date_update`) values 
(2,'Sociales','asdf','2021-02-28 07:14:20','2021-02-28 07:14:20'),
(3,'Química','asdf','2021-02-28 07:14:26','2021-02-28 07:14:27'),
(4,'Cumputación Aplicada','23','2021-02-28 07:48:02','2021-02-28 07:48:02'),
(5,'Sociales 2','sfd','2021-02-28 07:48:09','2021-02-28 07:48:09'),
(6,'Marketing','23','2021-02-28 07:48:14','2021-02-28 07:48:14'),
(8,'Programación','test',NULL,NULL),
(9,'Base de datos','datos',NULL,NULL);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`name`,`last_name`,`phone_number`,`description`,`address`,`email`,`date_create`,`date_update`) values 
(4,'Henry Alejandro','Taby Zenteno','67072444','Varios','calle willca Sarate','henry.taby@gmail.com','2021-02-27 17:27:02','2021-02-27 17:27:03'),
(5,'Maria de los angeles','de los Angeles','3333','tses','calle pedro pedrito pedtrote','algo@gmail.com','2021-02-27 17:27:02','2021-02-27 17:27:14'),
(6,'Diego Martines','Ramires','4858282','alguna descripción','calle lanza 353','diego@gmail.com','2021-02-27 17:27:28','2021-02-27 17:28:28'),
(7,'Maria','Taba','48488484','asdfasdfasdf','calle marquina','henry@gmail.com',NULL,NULL),
(8,'Mario','Taby','554544','asdfasdf','calle','asdf@asdf',NULL,NULL),
(19,'Carlos','Ponce','asdfasdfasd','fasdfasdfasdf','adfasdf','asdfasdf',NULL,NULL),
(21,'mario','mario','asdf','asdf','adf','asdf',NULL,NULL),
(25,'Carla','Peredo','232343','tetsd','marquina','desdf@gmail.com',NULL,NULL),
(26,'Carla','Peredo','232343','tetsd','marquina','desdf@gmail.com',NULL,NULL),
(27,'Carla','Peredo','232343','tetsd','marquina','desdf@gmail.com',NULL,NULL),
(28,'Carlos','Ponce','78458','sdfwer','calle ingavi','maria@gmail.com',NULL,NULL),
(30,'Maria','Juares','70724444','saokdierkider ','Calle 3','maria@gmail.com',NULL,NULL),
(35,'Ceci','Uriona','333','sdfsafdsf','calle palos','datos@gmail.com',NULL,NULL),
(36,'Marco','Daza','7807','asdfasdf','callee','adsf@º',NULL,NULL);

/*Table structure for table `student_class` */

DROP TABLE IF EXISTS `student_class`;

CREATE TABLE `student_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_class_student_idx` (`student_id`),
  KEY `fk_student_class_class1_idx` (`class_id`),
  CONSTRAINT `fk_student_class_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `fk_student_class_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `student_class` */

insert  into `student_class`(`id`,`student_id`,`class_id`,`date_create`,`date_update`) values 
(2,4,3,'2021-02-28 12:22:33','2021-02-28 12:22:33'),
(7,4,6,NULL,NULL),
(8,4,4,NULL,NULL),
(10,8,4,NULL,NULL),
(12,5,4,NULL,NULL),
(13,5,3,NULL,NULL),
(15,6,3,NULL,NULL),
(17,8,3,NULL,NULL),
(18,8,6,NULL,NULL),
(19,4,8,NULL,NULL),
(20,7,8,NULL,NULL),
(21,35,2,NULL,NULL),
(23,25,3,NULL,NULL),
(24,7,9,NULL,NULL),
(25,6,9,NULL,NULL),
(26,21,9,NULL,NULL),
(27,5,9,NULL,NULL),
(28,36,2,NULL,NULL),
(29,36,4,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
