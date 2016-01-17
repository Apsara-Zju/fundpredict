/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2016-01-16 16:16:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `increase`
-- ----------------------------
DROP TABLE IF EXISTS `increase`;
CREATE TABLE `increase` (
  `lable1` double(255,2) NOT NULL,
  `lable2` double(255,2) NOT NULL,
  `lable3` double(255,2) NOT NULL,
  `lable4` double(255,2) NOT NULL,
  `lable5` double(255,2) NOT NULL,
  `lable6` double(255,2) NOT NULL,
  `lable7` double(255,2) NOT NULL,
  `lable8` double(255,2) NOT NULL,
  `lable9` double(255,2) NOT NULL,
  `lable10` double(255,2) DEFAULT NULL,
  `lable11` double(255,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


