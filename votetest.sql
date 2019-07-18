/*
Navicat MySQL Data Transfer

Source Server         : zdc
Source Server Version : 50136
Source Host           : localhost:3306
Source Database       : votetest

Target Server Type    : MYSQL
Target Server Version : 50136
File Encoding         : 65001

Date: 2018-05-09 11:07:28
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `program`
-- ----------------------------
DROP TABLE IF EXISTS `program`;
CREATE TABLE `program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `performer` varchar(45) NOT NULL,
  `dep` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `score` int(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of program
-- ----------------------------
INSERT INTO program VALUES ('1', '《北城之歌》', '李四', '信息学部', '歌曲', '29');
INSERT INTO program VALUES ('2', '《小苹果》', '鸿飞', '表演学部', '歌曲', '14');
INSERT INTO program VALUES ('3', '《时间都去哪儿了》', '王五', '城建学部', '歌曲', '8');
INSERT INTO program VALUES ('4', '《自由飞翔》', '张三', '经管学部', '歌曲', '8');
