/*
Navicat MySQL Data Transfer

Source Server         : xu
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : roadsys

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2019-04-15 17:23:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `area` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `operateip` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `operatetime` datetime DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `an_one` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `an_two` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `changetime` datetime DEFAULT NULL,
  `ques_one` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `ques_two` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of answer
-- ----------------------------

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brandid` int(11) NOT NULL,
  `brandaddress` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `brandbuildtime` datetime DEFAULT NULL,
  `brandchinaname` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `brandenglishname` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `brandlogo` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `brandstory` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `brandtext` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `menuid` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  PRIMARY KEY (`brandid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of brand
-- ----------------------------

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `id` int(11) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `bankname` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `banknumber` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `cardid` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `isuse` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of card
-- ----------------------------

-- ----------------------------
-- Table structure for china
-- ----------------------------
DROP TABLE IF EXISTS `china`;
CREATE TABLE `china` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of china
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsid` int(11) NOT NULL,
  `brandid` int(11) DEFAULT NULL,
  `buildtime` datetime DEFAULT NULL,
  `goodstext` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `menuid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `price` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  PRIMARY KEY (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for goods_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_image`;
CREATE TABLE `goods_image` (
  `goodsimageid` int(11) NOT NULL,
  `buildtime` datetime DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `imageurl` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `ismain` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `menuid` int(11) DEFAULT NULL,
  PRIMARY KEY (`goodsimageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of goods_image
-- ----------------------------

-- ----------------------------
-- Table structure for goods_property
-- ----------------------------
DROP TABLE IF EXISTS `goods_property`;
CREATE TABLE `goods_property` (
  `goodspropertyid` int(11) NOT NULL,
  `buildtime` datetime DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `issku` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `menuid` int(11) DEFAULT NULL,
  `propertynameid` int(11) DEFAULT NULL,
  `propertyvalueid` int(11) DEFAULT NULL,
  PRIMARY KEY (`goodspropertyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of goods_property
-- ----------------------------

-- ----------------------------
-- Table structure for goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku`;
CREATE TABLE `goods_sku` (
  `skuid` int(11) NOT NULL,
  `barcode` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `buildtime` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `menuid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `property` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `productcode` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `skuname` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  PRIMARY KEY (`skuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of goods_sku
-- ----------------------------

-- ----------------------------
-- Table structure for ldtable
-- ----------------------------
DROP TABLE IF EXISTS `ldtable`;
CREATE TABLE `ldtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(11) CHARACTER SET utf8 NOT NULL,
  `azdate` datetime DEFAULT NULL,
  `scgs` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `azpeople` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `azaddress` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `isopen` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `dl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `dy` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `state` int(255) DEFAULT '0',
  `opentime` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `closetime` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `czpeople` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `bz` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of ldtable
-- ----------------------------
INSERT INTO `ldtable` VALUES ('4', 'IS22342234', '2018-04-22 16:34:42', '上海照明', '小米', '福州市晋安区', '1', '1.1', '220', '0', '18:30:00', '5:00:00', '123', null);
INSERT INTO `ldtable` VALUES ('8', 'IS323423', '2018-04-22 16:57:53', '北京科技', '小红', '厦门思明区', '1', '1.2', '220', '0', '18:30:00', '5:00:00', '123', null);
INSERT INTO `ldtable` VALUES ('9', 'IS76768', '2018-04-25 14:53:17', '泉州总部', '幻灵', '泉州鲤城区', '0', '1.3', '10', '0', '17:00:00', '6:00:00', '123', null);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `haschild` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `isshow` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `levels` int(11) DEFAULT NULL,
  `menuid` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `parentid` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `ques` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of question
-- ----------------------------

-- ----------------------------
-- Table structure for systemlog
-- ----------------------------
DROP TABLE IF EXISTS `systemlog`;
CREATE TABLE `systemlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `logtype` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `addressip` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `parms` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `createby` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `exceptioncode` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `exceptiondetail` varchar(255) COLLATE utf8_esperanto_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of systemlog
-- ----------------------------
INSERT INTO `systemlog` VALUES ('1', null, null, null, null, null, null, null, null);
INSERT INTO `systemlog` VALUES ('2', null, null, null, null, null, null, null, null);
INSERT INTO `systemlog` VALUES ('3', null, null, null, null, null, null, null, '');
INSERT INTO `systemlog` VALUES ('4', null, null, null, null, null, null, null, '');
INSERT INTO `systemlog` VALUES ('5', 'com.controller.UserController.goLogin.', '', '0:0:0:0:0:0:0:1', null, null, '2019-01-11', null, null);
INSERT INTO `systemlog` VALUES ('6', 'com.controller.UserController.login.用户登录', '查询操作', '0:0:0:0:0:0:0:1', null, '123', '2019-01-11', null, null);
INSERT INTO `systemlog` VALUES ('7', 'com.controller.UserController.userIndex.', '', '0:0:0:0:0:0:0:1', null, '123', '2019-01-11', null, null);
INSERT INTO `systemlog` VALUES ('8', 'com.controller.RoadController.roadList.', '', '0:0:0:0:0:0:0:1', null, '123', '2019-01-11', null, null);
INSERT INTO `systemlog` VALUES ('9', 'com.controller.RoadController.contol.', '', '0:0:0:0:0:0:0:1', null, '123', '2019-01-11', null, null);
INSERT INTO `systemlog` VALUES ('10', 'com.controller.RoadController.setTime.', '', '0:0:0:0:0:0:0:1', null, '123', '2019-01-11', null, null);
INSERT INTO `systemlog` VALUES ('11', 'com.controller.RoadController.jbxx.', '', '0:0:0:0:0:0:0:1', null, '123', '2019-01-11', null, null);
INSERT INTO `systemlog` VALUES ('12', 'com.controller.UserController.goLogin.', '', '0:0:0:0:0:0:0:1', null, null, '2019-01-28', null, null);
INSERT INTO `systemlog` VALUES ('13', 'com.controller.UserController.login.用户登录', '查询操作', '0:0:0:0:0:0:0:1', null, null, '2019-01-28', null, null);
INSERT INTO `systemlog` VALUES ('14', 'com.controller.UserController.goLogin.', '', '0:0:0:0:0:0:0:1', null, null, '2019-02-16', null, null);
INSERT INTO `systemlog` VALUES ('15', 'com.controller.UserController.login.用户登录', '查询操作', '0:0:0:0:0:0:0:1', null, '123', '2019-02-16', null, null);
INSERT INTO `systemlog` VALUES ('16', 'com.controller.UserController.userIndex.', '', '0:0:0:0:0:0:0:1', null, '123', '2019-02-16', null, null);
INSERT INTO `systemlog` VALUES ('17', 'com.controller.RoadController.roadList.', '', '0:0:0:0:0:0:0:1', null, '123', '2019-02-16', null, null);
INSERT INTO `systemlog` VALUES ('18', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('19', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, null, '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('20', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, null, '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('21', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('22', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('23', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('24', 'com.controller.UserController.handbook.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('25', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('26', 'com.controller.UserController.handbook.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('27', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('28', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('29', 'com.controller.UserController.handbook.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('30', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('31', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('32', 'com.controller.UserController.handbook.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('33', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('34', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('35', 'com.controller.UserController.handbook.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('36', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('37', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('38', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('39', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('40', 'com.controller.UserController.handbook.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('41', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('42', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('43', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('44', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('45', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'xyb', '2019-03-07', null, null);
INSERT INTO `systemlog` VALUES ('46', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('47', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('48', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('49', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('50', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('51', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('52', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('53', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('54', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('55', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, null, '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('56', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, null, '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('57', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, '123', '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('58', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, '123', '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('59', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, '123', '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('60', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, '123', '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('61', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, '123', '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('62', 'com.controller.RoadController.contol.', '', '127.0.0.1', null, '123', '2019-03-08', null, null);
INSERT INTO `systemlog` VALUES ('63', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('64', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, '123', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('65', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, '123', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('66', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, '123', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('67', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, '123', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('68', 'com.controller.RoadController.contol.', '', '127.0.0.1', null, '123', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('69', 'com.controller.RoadController.setTime.', '', '127.0.0.1', null, '123', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('70', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, '123', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('71', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('72', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, '123', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('73', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, '123', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('74', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, '123', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('75', 'com.controller.UserController.userList.', '', '127.0.0.1', null, '123', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('76', 'com.controller.UserController.loginOut.', '', '127.0.0.1', null, '123', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('77', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('78', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('79', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('80', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('81', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('82', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('83', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('84', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('85', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('86', 'com.controller.RoadController.jbxx.', '', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('87', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('88', 'com.controller.RoadController.jbxx.', '', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('89', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('90', 'com.controller.RoadController.jbxx.', '', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('91', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-21', null, null);
INSERT INTO `systemlog` VALUES ('92', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('93', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('94', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('95', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('96', 'com.controller.RoadController.contol.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('97', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('98', 'com.controller.RoadController.jbxx.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('99', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('100', 'com.controller.UserController.handbook.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('101', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('102', 'com.controller.UserController.handbook.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('103', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('104', 'com.controller.UserController.handbook.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('105', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('106', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('107', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('108', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('109', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('110', 'com.controller.RoadController.jbxx.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('111', 'com.controller.RoadController.setTime.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('112', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('113', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('114', 'com.controller.UserController.downloadFile.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('115', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('116', 'com.controller.UserController.handbook.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('117', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('118', 'com.controller.UserController.handbook.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('119', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('120', 'com.controller.UserController.goLogin.', '', '192.168.43.106', null, null, '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('121', 'com.controller.UserController.login.用户登录', '查询操作', '192.168.43.106', null, null, '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('122', 'com.controller.UserController.login.用户登录', '查询操作', '192.168.43.106', null, null, '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('123', 'com.controller.UserController.login.用户登录', '查询操作', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('124', 'com.controller.UserController.userIndex.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('125', 'com.controller.RoadController.roadList.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('126', 'com.controller.RoadController.contol.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('127', 'com.controller.RoadController.setTime.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('128', 'com.controller.RoadController.jbxx.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('129', 'com.controller.UserController.handbook.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('130', 'com.controller.UserController.userList.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('131', 'com.controller.UserController.handbook.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('132', 'com.controller.RoadController.jbxx.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('133', 'com.controller.RoadController.setTime.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('134', 'com.controller.RoadController.contol.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('135', 'com.controller.RoadController.roadList.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('136', 'com.controller.UserController.userList.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('137', 'com.controller.UserController.handbook.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('138', 'com.controller.RoadController.jbxx.', '', '192.168.43.106', null, 'admin', '2019-03-25', null, null);
INSERT INTO `systemlog` VALUES ('139', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('140', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('141', 'com.controller.UserController.downloadFile.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('142', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('143', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('144', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('145', 'com.controller.UserController.downloadFile.', '', '127.0.0.1', null, null, '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('146', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('147', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('148', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('149', 'com.controller.UserController.loginOut.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('150', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('151', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('152', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('153', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('154', 'com.controller.UserController.addUser.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('155', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('156', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('157', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('158', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('159', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('160', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('161', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('162', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('163', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('164', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('165', 'com.controller.UserController.addUser.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('166', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('167', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('168', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('169', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('170', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('171', 'com.controller.RoadController.addRoadPage.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('172', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('173', 'com.controller.UserController.addUser.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('174', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('175', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('176', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('177', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('178', 'com.controller.UserController.addUser.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('179', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('180', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('181', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('182', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('183', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('184', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('185', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('186', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('187', 'com.controller.UserController.addUser.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('188', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('189', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('190', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('191', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('192', 'com.controller.UserController.addUser.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('193', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('194', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('195', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('196', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('197', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('198', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('199', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('200', 'com.controller.UserController.addUser.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('201', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('202', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('203', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('204', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('205', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('206', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('207', 'com.controller.UserController.addUser.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('208', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('209', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('210', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('211', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('212', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('213', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('214', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('215', 'com.controller.UserController.addUser.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('216', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('217', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('218', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('219', 'com.controller.RoadController.addRoadPage.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('220', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('221', 'com.controller.UserController.addUser.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('222', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('223', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('224', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('225', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('226', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('227', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('228', 'com.controller.UserController.userList.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('229', 'com.controller.UserController.addUser.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('230', 'com.controller.UserController.register.', '', '127.0.0.1', null, 'admin', '2019-03-28', null, null);
INSERT INTO `systemlog` VALUES ('231', 'com.controller.UserController.goLogin.', '', '127.0.0.1', null, null, '2019-04-02', null, null);
INSERT INTO `systemlog` VALUES ('232', 'com.controller.UserController.login.用户登录', '查询操作', '127.0.0.1', null, 'admin', '2019-04-02', null, null);
INSERT INTO `systemlog` VALUES ('233', 'com.controller.UserController.userIndex.', '', '127.0.0.1', null, 'admin', '2019-04-02', null, null);
INSERT INTO `systemlog` VALUES ('234', 'com.controller.RoadController.roadList.', '', '127.0.0.1', null, 'admin', '2019-04-02', null, null);
INSERT INTO `systemlog` VALUES ('235', 'com.controller.RoadController.setTime.', '', '127.0.0.1', null, 'admin', '2019-04-02', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `age` varchar(10) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `pwd` varchar(255) COLLATE utf8_esperanto_ci NOT NULL,
  `registertime` datetime DEFAULT NULL,
  `power` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0000000016', 'admin', '12', '123321', '2018-04-25 11:16:52', '1');
INSERT INTO `user` VALUES ('0000000017', '123', '12', '123321', '2018-04-25 11:18:37', '0');
INSERT INTO `user` VALUES ('0000000019', 'xyb', '12', '111111', '2018-04-25 11:51:17', '0');
INSERT INTO `user` VALUES ('0000000020', 'xyb1', '12', '111111', '2018-04-25 11:51:35', '1');
INSERT INTO `user` VALUES ('0000000021', 'jdbc测试', '12', '123321', null, '0');
INSERT INTO `user` VALUES ('0000000034', 'kafka', '11', '111111', null, '0');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `birthday` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `changetime` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `headurl` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `memberlevel` int(11) DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Records of user_info
-- ----------------------------
