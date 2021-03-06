/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : stock

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2016-01-16 14:14:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `increase`
-- ----------------------------
DROP TABLE IF EXISTS `increase`;
CREATE TABLE `increase` (
  `lable1` double(255,2) DEFAULT NULL,
  `lable2` double(255,2) DEFAULT NULL,
  `lable3` double(255,2) DEFAULT NULL,
  `lable4` double(255,2) DEFAULT NULL,
  `lable5` double(255,2) DEFAULT NULL,
  `lable6` double(255,2) DEFAULT NULL,
  `lable7` double(255,2) DEFAULT NULL,
  `lable8` double(255,2) DEFAULT NULL,
  `lable9` double(255,2) DEFAULT NULL,
  `lable10` double(255,2) DEFAULT NULL,
  `lable11` double(255,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of increase
-- ----------------------------
INSERT INTO `increase` VALUES ('-10.00', '-9.98', '1.68', '-8.70', '-10.01', '10.01', '10.01', '10.01', '-10.01', '-9.99', '-3.50');
INSERT INTO `increase` VALUES ('-4.97', '-1.62', '-9.97', '4.21', '-9.99', '10.00', '10.00', '10.00', '-4.21', '-4.64', '-0.87');
INSERT INTO `increase` VALUES ('5.91', '4.45', '2.91', '-6.00', '-9.99', '-1.62', '-1.62', '-1.62', '9.99', '4.64', '-1.75');
INSERT INTO `increase` VALUES ('7.09', '5.88', '10.01', '6.03', '-55.01', '2.14', '2.14', '2.14', '9.78', '8.92', '3.63');
INSERT INTO `increase` VALUES ('1.23', '6.33', '4.08', '-1.64', '-8.93', '-10.01', '-10.01', '-10.01', '9.98', '5.76', '2.59');
INSERT INTO `increase` VALUES ('-1.88', '-3.76', '-0.11', '-1.40', '-9.99', '-10.00', '-10.00', '-10.00', '3.75', '0.65', '-1.91');
INSERT INTO `increase` VALUES ('-0.15', '3.90', '3.32', '0.31', '5.07', '10.02', '10.02', '10.02', '9.57', '3.41', '-0.28');
INSERT INTO `increase` VALUES ('-9.98', '-9.98', '-10.01', '-10.01', '-1.63', '3.04', '3.04', '3.04', '2.00', '-10.00', '-5.02');
INSERT INTO `increase` VALUES ('-3.08', '-10.01', '-8.88', '-7.60', '-3.58', '1.50', '1.50', '1.50', '-0.08', '-8.53', '-5.93');
INSERT INTO `increase` VALUES ('9.51', '9.99', '10.01', '7.40', '7.08', '9.40', '9.40', '9.40', '0.95', '10.00', '7.14');
INSERT INTO `increase` VALUES ('-4.52', '7.03', '-1.15', '-3.29', '-1.09', '2.57', '2.57', '2.57', '-3.85', '6.64', '-2.58');
INSERT INTO `increase` VALUES ('-0.37', '2.40', '2.77', '0.31', '7.66', '-1.12', '-1.12', '-1.12', '5.12', '6.79', '0.60');
INSERT INTO `increase` VALUES ('7.39', '10.01', '10.00', '4.59', '3.32', '1.52', '1.52', '1.52', '1.75', '10.00', '3.42');
INSERT INTO `increase` VALUES ('1.88', '7.16', '3.53', '5.90', '-4.90', '-6.96', '-6.96', '-6.96', '3.41', '6.49', '0.57');
INSERT INTO `increase` VALUES ('-3.25', '4.54', '-1.17', '-1.15', '4.60', '10.00', '10.00', '10.00', '4.63', '10.00', '-1.72');
INSERT INTO `increase` VALUES ('3.08', '-3.45', '8.08', '9.99', '0.76', '0.71', '0.71', '0.71', '-2.66', '-66.34', '1.22');
INSERT INTO `increase` VALUES ('-4.16', '-4.65', '-8.08', '-6.52', '8.91', '3.66', '3.66', '3.66', '4.46', '-9.41', '-3.04');
INSERT INTO `increase` VALUES ('4.50', '10.01', '10.00', '7.64', '1.23', '10.01', '10.01', '10.01', '3.22', '6.94', '1.51');
INSERT INTO `increase` VALUES ('-3.78', '-5.29', '-0.73', '-1.93', '-9.98', '0.26', '0.26', '0.26', '-3.23', '-5.34', '-2.36');
INSERT INTO `increase` VALUES ('1.14', '-4.02', '-2.99', '0.07', '0.94', '3.98', '3.98', '3.98', '1.34', '2.61', '1.42');
INSERT INTO `increase` VALUES ('4.74', '4.88', '6.41', '3.82', '1.10', '6.25', '6.25', '6.25', '2.14', '7.76', '4.23');
INSERT INTO `increase` VALUES ('1.11', '5.76', '-1.17', '3.39', '-1.61', '2.81', '2.81', '2.81', '-0.79', '-0.61', '1.40');
INSERT INTO `increase` VALUES ('2.64', '3.03', '5.84', '6.70', '-0.41', '2.16', '2.16', '2.16', '9.38', '7.39', '3.14');
INSERT INTO `increase` VALUES ('1.04', '-0.14', '0.26', '-0.03', '4.46', '2.28', '2.28', '2.28', '-9.93', '0.19', '0.78');
INSERT INTO `increase` VALUES ('-1.59', '1.18', '-4.54', '-2.53', '-0.51', '5.03', '5.03', '5.03', '10.00', '-1.91', '-1.05');
INSERT INTO `increase` VALUES ('3.45', '10.00', '6.08', '7.01', '-1.13', '0.73', '0.73', '0.73', '2.16', '3.74', '3.19');
INSERT INTO `increase` VALUES ('-0.83', '5.90', '5.91', '-0.25', '-4.85', '-10.01', '-10.01', '-10.01', '-4.48', '7.31', '1.51');
INSERT INTO `increase` VALUES ('-2.00', '-3.77', '-0.43', '-0.22', '-0.66', '8.78', '8.78', '8.78', '3.95', '-3.01', '0.21');
INSERT INTO `increase` VALUES ('1.54', '2.15', '9.07', '1.06', '6.28', '4.35', '4.35', '4.35', '-4.79', '6.41', '1.67');
INSERT INTO `increase` VALUES ('-8.55', '-9.96', '-9.99', '-9.10', '-2.22', '-3.26', '-3.26', '-3.26', '-2.66', '-9.61', '-5.78');
INSERT INTO `increase` VALUES ('4.77', '9.63', '4.10', '3.63', '2.91', '-0.50', '-0.50', '-0.50', '1.64', '6.16', '3.64');
INSERT INTO `increase` VALUES ('3.71', '1.39', '-1.37', '1.54', '9.38', '-6.48', '-6.48', '-6.48', '-4.60', '3.07', '2.27');
INSERT INTO `increase` VALUES ('3.86', '-1.10', '2.46', '-2.58', '-1.34', '2.32', '2.32', '2.32', '-1.12', '-2.80', '0.67');
INSERT INTO `increase` VALUES ('0.07', '-1.01', '2.15', '0.20', '5.03', '0.99', '0.99', '0.99', '6.16', '-1.04', '1.14');
INSERT INTO `increase` VALUES ('1.84', '-4.28', '-5.00', '-1.85', '0.20', '-0.93', '-0.93', '-0.93', '-2.90', '-4.98', '-2.49');
INSERT INTO `increase` VALUES ('-1.64', '-0.18', '-0.63', '2.69', '0.00', '1.96', '1.96', '1.96', '5.67', '0.53', '0.70');
INSERT INTO `increase` VALUES ('-2.35', '0.24', '-1.38', '-0.95', '1.44', '8.31', '8.31', '8.31', '9.26', '-2.11', '-0.65');
INSERT INTO `increase` VALUES ('-1.92', '-6.42', '1.36', '-1.46', '-2.89', '-3.73', '-3.73', '-3.73', '1.47', '-3.95', '-2.31');
INSERT INTO `increase` VALUES ('-0.28', '0.57', '1.79', '-0.10', '0.56', '9.84', '9.84', '9.84', '1.43', '2.21', '-0.57');
INSERT INTO `increase` VALUES ('5.27', '9.44', '5.00', '4.81', '2.41', '2.08', '2.08', '2.08', '3.89', '7.09', '4.94');
INSERT INTO `increase` VALUES ('0.98', '0.65', '-2.84', '-3.59', '-6.82', '0.09', '0.09', '0.09', '-5.83', '0.41', '0.09');
INSERT INTO `increase` VALUES ('1.01', '2.49', '5.54', '5.19', '3.11', '0.76', '0.76', '0.76', '5.42', '2.19', '2.43');
INSERT INTO `increase` VALUES ('-0.23', '-0.17', '3.46', '0.32', '0.00', '-3.10', '-3.10', '-3.10', '-6.32', '9.99', '0.96');
INSERT INTO `increase` VALUES ('0.10', '3.87', '-0.71', '4.92', '0.00', '2.73', '2.73', '2.73', '-3.47', '5.35', '0.04');
INSERT INTO `increase` VALUES ('1.13', '1.37', '-0.05', '4.03', '0.00', '-0.53', '-0.53', '-0.53', '4.84', '5.38', '0.83');
INSERT INTO `increase` VALUES ('-1.51', '-3.82', '-4.34', '-4.45', '0.00', '-5.13', '-5.13', '-5.13', '5.68', '-3.27', '-0.01');
INSERT INTO `increase` VALUES ('0.70', '-0.21', '-2.87', '0.12', '0.00', '-1.39', '-1.39', '-1.39', '1.75', '-7.62', '-2.11');
INSERT INTO `increase` VALUES ('5.63', '7.75', '2.31', '1.45', '0.00', '2.40', '2.40', '2.40', '1.07', '4.36', '1.84');
INSERT INTO `increase` VALUES ('-2.26', '-4.38', '-3.62', '-7.18', '0.00', '3.73', '3.73', '3.73', '6.91', '-3.33', '-0.69');
INSERT INTO `increase` VALUES ('-2.37', '-4.44', '0.80', '-1.25', '0.00', '5.25', '5.25', '5.25', '-3.11', '-3.92', '-2.15');
INSERT INTO `increase` VALUES ('1.45', '3.83', '6.13', '1.53', '0.00', '3.53', '3.53', '3.53', '-6.90', '10.01', '2.60');
INSERT INTO `increase` VALUES ('1.65', '0.14', '-3.25', '0.99', '0.00', '10.00', '10.00', '10.00', '0.78', '3.77', '0.61');
INSERT INTO `increase` VALUES ('-0.83', '3.12', '-1.91', '-3.42', '0.00', '1.03', '1.03', '1.03', '0.00', '-5.92', '-0.67');
INSERT INTO `increase` VALUES ('0.58', '-0.77', '3.33', '2.69', '0.00', '-7.88', '-7.88', '-7.88', '0.00', '2.00', '0.21');
INSERT INTO `increase` VALUES ('1.56', '10.01', '1.20', '0.77', '0.00', '3.03', '3.03', '3.03', '0.00', '2.45', '1.27');
INSERT INTO `increase` VALUES ('-2.83', '1.96', '-2.96', '-2.09', '0.00', '0.00', '0.00', '0.00', '0.00', '-3.61', '-0.66');
INSERT INTO `increase` VALUES ('-9.19', '-6.00', '-2.91', '-3.56', '0.00', '0.00', '0.00', '0.00', '0.00', '-10.00', '-6.32');
INSERT INTO `increase` VALUES ('-2.39', '-3.70', '-3.02', '-1.21', '0.00', '0.00', '0.00', '0.00', '0.00', '-2.20', '0.30');
