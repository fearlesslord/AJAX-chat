/*
SQLyog Ultimate v9.50 
MySQL - 5.5.32 : Database - chat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`chat` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `chat`;

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `login` varchar(200) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=cp1251;

/*Data for the table `messages` */

insert  into `messages`(`id`,`login`,`message`,`time`) values (19,'taras','first','2014-02-05 12:29:07'),(20,'ivan','second','2014-02-05 12:29:11'),(21,'petro','third','2014-02-13 12:29:13'),(22,'oleg','bla','2014-02-11 12:29:30'),(23,'vasul','new bla','2014-02-11 12:29:45'),(24,'aaa','bbb','2014-02-11 12:41:53'),(25,'newaaa','newbbb','2014-02-11 12:52:00'),(26,'desna','krasna','0000-00-00 00:00:00'),(27,'desna1','krasna1','0000-00-00 00:00:00'),(28,'desna','krasna','0000-00-00 00:00:00'),(29,'taras','aaa','2014-02-11 16:05:50'),(30,'taras','aaa','2014-02-11 16:05:50'),(31,'new Taras','new','2014-02-11 16:08:53'),(32,'new Taras2','new2','2014-02-11 16:10:45'),(33,'new Taras3','new3','2014-02-11 16:11:21'),(34,'new Taras5','new3','2014-02-11 16:11:55'),(35,'Ivan','Hi','2014-02-12 09:30:08'),(75,'new Taras3','new mess3','2014-02-13 09:51:29'),(74,'new Taras2','new mess2','2014-02-13 09:51:18'),(73,'new Taras','new mess','2014-02-13 09:50:39'),(72,'name','mess','2014-02-12 16:48:08'),(71,'gerard','deparde','2014-02-12 16:51:37'),(70,'asm','yes','2014-02-12 15:43:55'),(69,'tu','222','2014-02-12 15:37:58'),(68,'ja','111','2014-02-12 15:37:13'),(67,'Dereh','bla','2014-02-12 15:13:50'),(66,'Shon','Hello','2014-02-12 15:13:41'),(49,'11111111111','xxxxxxxxxx\n2222222222','2014-02-12 14:34:59'),(50,'Taras','One','2014-02-12 14:38:02'),(86,'Ivan7','Sula7','2014-02-13 13:55:55'),(85,'Ivan5','Sula5','2014-02-13 13:54:58'),(84,'Ivan2','Sula2','2014-02-13 13:53:29'),(83,'Ivan2','Sula2','2014-02-13 12:33:29'),(82,'Ivan2','Sula2','2014-02-13 12:32:40'),(114,'Qwer','Me','2014-02-13 19:02:48'),(113,'Kate22','Hi22','2014-02-13 18:50:16'),(112,'Kate','Hi','2014-02-13 18:47:49'),(111,'Petro','Ivan','2014-02-13 18:45:45'),(110,'LLeon25','Killer25','2014-02-13 18:44:36'),(109,'LLeon2','Killer2','2014-02-13 18:44:19'),(108,'LLeon','Killer','2014-02-13 18:43:14'),(107,'222','111','2014-02-13 18:42:26'),(106,'newOn','newOne2','2014-02-13 18:33:14'),(105,'aaa2','bbb2','2014-02-13 18:20:41'),(104,'aaa2','bbb2','2014-02-13 18:19:29'),(103,'aaa1','bbb2','2014-02-13 18:18:04'),(102,'aaa','bbb','2014-02-13 18:10:17'),(101,'44','55','2014-02-13 17:59:50');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
