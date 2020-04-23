CREATE DATABASE `uranus`;

CREATE TABLE `uranus`.`company` (
  `ID_COMPANY` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `PHONE` varchar(30) DEFAULT NULL,
  `MANAGER` varchar(58) DEFAULT NULL,
  PRIMARY KEY (`ID_COMPANY`),
  UNIQUE KEY `ID_COMPANY_UNIQUE` (`ID_COMPANY`)
) ENGINE=InnoDB AUTO_INCREMENT=3;

CREATE TABLE `uranus`.`history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFERENCE` char(8) NOT NULL,
  `DATETIME` datetime NOT NULL DEFAULT current_timestamp(),
  `SOURCE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_PASTE_UNIQUE` (`ID`)
) ENGINE=InnoDB;

CREATE TABLE `uranus`.`rule` (
  `ID_RULE` int(11) NOT NULL AUTO_INCREMENT,
  `ID_COMPANY` int(11) NOT NULL,
  `STRING` tinytext NOT NULL,
  `SOURCE` varchar(100) NOT NULL,
  `FILTER` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_RULE`),
  UNIQUE KEY `ID_BING_RULE_UNIQUE` (`ID_RULE`),
  KEY `ID_COMPANY_idx` (`ID_COMPANY`),
  CONSTRAINT `FK_ID_COMPANY` FOREIGN KEY (`ID_COMPANY`) REFERENCES `company` (`ID_COMPANY`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3;

CREATE TABLE `uranus`.`alert` (
  `ID_ALERT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_COMPANY` int(11) NOT NULL,
  `CONTENT` text NOT NULL,
  `DATETIME` datetime NOT NULL DEFAULT current_timestamp(),
  `STATUS` int(1) NOT NULL,
  `NOTIFICATION` int(1) NOT NULL,
  `HASH` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_ALERT`),
  UNIQUE KEY `ID_BING_ALERT_UNIQUE` (`ID_ALERT`),
  UNIQUE KEY `REF` (`HASH`),
  KEY `ID_COMPANY_idx` (`ID_COMPANY`),
  CONSTRAINT `ID_FK_COMPANY` FOREIGN KEY (`ID_COMPANY`) REFERENCES `company` (`ID_COMPANY`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;