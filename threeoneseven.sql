CREATE DATABASE  IF NOT EXISTS `threeoneseven`;
USE `threeoneseven`;

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `DepartmentID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`),
  UNIQUE KEY `DepartmentID_UNIQUE` (`DepartmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `departments` WRITE;
INSERT INTO `departments` VALUES (1,'Home'),(2,'Sporting Goods'),(3,'Tools'),(4,'Other');
UNLOCK TABLES;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `idcategories_UNIQUE` (`CategoryID`),
  KEY `fk_departmentid_idx` (`DepartmentID`),
  CONSTRAINT `fk_departmentid` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

LOCK TABLES `categories` WRITE;
INSERT INTO `categories` VALUES (1,'Decor',1),(2,'Appliances',1),(3,'Exercise',2),(4,'Outdoor',2),(5,'Tools',3),(6,'Lighting',1),(7,'Kids',1),(10,'Other',4);
UNLOCK TABLES;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(90) NOT NULL,
  `Price` decimal(8,2) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `AmazonPrice` decimal(4) NOT NULL,
  `StockLevel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `ProductID_UNIQUE` (`ProductID`),
  KEY `category_FK_idx` (`CategoryID`),
  CONSTRAINT `category_FK` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=940 DEFAULT CHARSET=latin1;

LOCK TABLES `products` WRITE;
INSERT INTO `products` VALUES (1,'Pedtec Evaporative Air Cooler',89.00,2,99.99,'1'),(2,'H2OSUP Inflatable SUP',100.00,4,140.00,'1'),(4,'Homde Inflatable SUP',149.00,4,379.99,'1')
UNLOCK TABLES;