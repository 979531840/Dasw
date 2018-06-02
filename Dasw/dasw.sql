/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - dasw
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dasw` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dasw`;

/*Table structure for table `dasw_invoice` */

DROP TABLE IF EXISTS `dasw_invoice`;

CREATE TABLE `dasw_invoice` (
  `invoice_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '发票ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `invoice_number` varchar(50) NOT NULL COMMENT '发票号',
  `invoice_owm` varchar(50) NOT NULL COMMENT '付款方',
  `invoice_paydate` date NOT NULL COMMENT '付款日期',
  `invoice_way` varchar(50) NOT NULL COMMENT '付款方式',
  `invoice_date` date NOT NULL COMMENT '开发票日期',
  `invoice_money` double(10,3) NOT NULL COMMENT '发票金额',
  `invoice_flag` varchar(10) NOT NULL COMMENT '标记发票是否已开',
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `dasw_invoice` */

insert  into `dasw_invoice`(`invoice_id`,`order_id`,`invoice_number`,`invoice_owm`,`invoice_paydate`,`invoice_way`,`invoice_date`,`invoice_money`,`invoice_flag`) values (2,12,'123456','腾讯','2017-06-15','网银','2017-06-23',1000000.000,'1'),(3,10,'4351213','百度','2017-06-20','现金','2017-06-23',40000.000,'1'),(4,9,'453422','搜狐','2017-01-09','网银','0000-00-00',550000.000,'0'),(5,8,'676786','秦伟','2017-06-01','现金','0000-00-00',4000.000,'0');

/*Table structure for table `dasw_order` */

DROP TABLE IF EXISTS `dasw_order`;

CREATE TABLE `dasw_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT '客户ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `order_date` date NOT NULL COMMENT '订单日期',
  `order_totalprice` double(10,3) DEFAULT NULL COMMENT '订单成交总额',
  `order_status` int(1) NOT NULL COMMENT '订单状态',
  `order_flag` int(1) NOT NULL COMMENT '标记时候退换货',
  `order_pay` double(10,3) DEFAULT NULL COMMENT '已付金额',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

/*Data for the table `dasw_order` */

insert  into `dasw_order`(`order_id`,`customer_id`,`user_id`,`order_date`,`order_totalprice`,`order_status`,`order_flag`,`order_pay`) values (123,1,1,'2017-06-01',4500.000,1,1,1111.000),(124,1,1,'2017-07-23',5500.000,1,1,2222.000),(125,2,2,'2017-05-24',6500.000,1,1,0.000);

/*Table structure for table `dasw_produce` */

DROP TABLE IF EXISTS `dasw_produce`;

CREATE TABLE `dasw_produce` (
  `produce_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自产产品ID',
  `produce_name` varchar(50) NOT NULL COMMENT '产品名称',
  `produce_typename` varchar(50) NOT NULL COMMENT '产品类型名称',
  `produce_item` varchar(50) NOT NULL COMMENT '货号',
  `produce_specification` varchar(10) NOT NULL COMMENT '规格',
  `produce_unit` varchar(10) NOT NULL COMMENT '计量单位',
  `produce_number` decimal(10,0) NOT NULL COMMENT '数量',
  `produce_purchaseDate` date DEFAULT NULL COMMENT '产品采购日期',
  `produce_originalPrice` double(10,3) DEFAULT NULL COMMENT '产品原价',
  `roduce_discount` double(10,3) DEFAULT NULL COMMENT '折扣',
  `produce_adddate` date DEFAULT NULL COMMENT '产品添加日期',
  `produce_date` date DEFAULT NULL COMMENT '生产日期',
  `produce_batch` varchar(10) DEFAULT NULL COMMENT '生产批次',
  `produce_content` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`produce_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123467 DEFAULT CHARSET=utf8 DELAY_KEY_WRITE=1;

/*Data for the table `dasw_produce` */

insert  into `dasw_produce`(`produce_id`,`produce_name`,`produce_typename`,`produce_item`,`produce_specification`,`produce_unit`,`produce_number`,`produce_purchaseDate`,`produce_originalPrice`,`roduce_discount`,`produce_adddate`,`produce_date`,`produce_batch`,`produce_content`) values (1,'板蓝根1','0','456789','30ml','袋','301','2017-06-15',300.000,0.900,'2017-06-01','2017-06-03','1',NULL),(2,'黄莲','0','235435','50ul','支','501','2017-06-03',300.000,0.500,'2017-06-07','2017-06-17','1',NULL),(3,'板蓝根','1','43535','45ul','袋','500','0000-00-00',NULL,NULL,'2017-06-01','2017-06-03','2',NULL),(4,'阿莫西林','0','4364564','40ml','支','500','2017-06-01',400.000,0.580,'0000-00-00','0000-00-00','',NULL),(5,'砒霜','1','67575675','500','mg','1000','0000-00-00',NULL,NULL,'2017-06-07','2017-06-09','1',NULL),(123465,'维生素A','1','234178','500g','片','600',NULL,NULL,NULL,NULL,NULL,'1',NULL),(123466,'秦伟','0','5646335','65','公斤','1','2017-06-01',10.000,0.800,'0000-00-00','0000-00-00','',NULL);

/*Table structure for table `dasw_sell` */

DROP TABLE IF EXISTS `dasw_sell`;

CREATE TABLE `dasw_sell` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `produce_id` int(10) unsigned NOT NULL COMMENT '产品ID',
  `produce_number` int(10) NOT NULL COMMENT '产品数量',
  `produce_discount` double(10,3) NOT NULL COMMENT '产品折扣',
  `produce_pay` double(10,3) NOT NULL COMMENT '产品成交价格',
  PRIMARY KEY (`order_id`,`produce_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

/*Data for the table `dasw_sell` */

insert  into `dasw_sell`(`order_id`,`produce_id`,`produce_number`,`produce_discount`,`produce_pay`) values (123,2,400,0.600,400.000),(123,4,300,0.800,500.000),(123,5,500,0.600,500.000),(124,1,500,0.700,450.000),(124,3,350,0.450,300.000),(124,123465,400,0.500,200.000),(124,123466,300,0.400,120.000),(125,1,500,0.500,250.000),(125,3,500,0.500,250.000),(125,4,500,0.500,250.000);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
