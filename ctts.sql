/*
Navicat MySQL Data Transfer

Source Server         : 可视化教学设计
Source Server Version : 50637
Source Host           : 139.224.54.245:3306
Source Database       : ctts

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2020-10-07 16:59:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookid` int(11) NOT NULL,
  `publish` varchar(255) DEFAULT NULL,
  `bookname` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `about` text,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------

-- ----------------------------
-- Table structure for chooseq
-- ----------------------------
DROP TABLE IF EXISTS `chooseq`;
CREATE TABLE `chooseq` (
  `cqid` int(11) NOT NULL,
  `cqitem` text,
  `cqcho` text,
  `cqans` varchar(255) DEFAULT NULL,
  `cqtail` text,
  `cqrem` text,
  `cqstatus` int(2) NOT NULL,
  PRIMARY KEY (`cqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chooseq
-- ----------------------------

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `exid` int(11) NOT NULL,
  `exname` varchar(255) NOT NULL,
  `createtime` varchar(255) NOT NULL,
  `exstatus` int(2) NOT NULL,
  PRIMARY KEY (`exid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------

-- ----------------------------
-- Table structure for examtail
-- ----------------------------
DROP TABLE IF EXISTS `examtail`;
CREATE TABLE `examtail` (
  `exid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `qtypeid` int(11) NOT NULL,
  `exstatus` varchar(2) NOT NULL,
  PRIMARY KEY (`exid`,`qid`,`qtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examtail
-- ----------------------------

-- ----------------------------
-- Table structure for fillq
-- ----------------------------
DROP TABLE IF EXISTS `fillq`;
CREATE TABLE `fillq` (
  `fqid` int(11) NOT NULL,
  `fqitem` text,
  `fqans` text,
  `fqtail` text,
  `fqrem` text,
  `fqstatus` int(2) NOT NULL,
  PRIMARY KEY (`fqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fillq
-- ----------------------------

-- ----------------------------
-- Table structure for programq
-- ----------------------------
DROP TABLE IF EXISTS `programq`;
CREATE TABLE `programq` (
  `pqid` int(11) NOT NULL,
  `pqitem` text,
  `pqans` text,
  `pqtail` text,
  `pqrem` text,
  `pqstatus` int(2) NOT NULL,
  PRIMARY KEY (`pqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programq
-- ----------------------------

-- ----------------------------
-- Table structure for qtype
-- ----------------------------
DROP TABLE IF EXISTS `qtype`;
CREATE TABLE `qtype` (
  `typeid` int(11) NOT NULL,
  `typename` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qtype
-- ----------------------------
INSERT INTO `qtype` VALUES ('1', '选择题');
INSERT INTO `qtype` VALUES ('2', '填空题');
INSERT INTO `qtype` VALUES ('3', '程序题');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(2) NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', 'GkxbLCPWMdF5yD8MZCC5m2BWMd2-Zoaw', 'YMMJEhEmew5xuIBYqrQ4yTZiMjljNzljYzVkZjEyMjU5MjkzMjhkNWE3OTZhYjUzMjBhNjM4Zjg2MmYxMDMzZjViMjMxMWIxMjEyZWYwNTi8GDTLCHkxR0DE5/mA79iBDayxklvx4K6BITtwOjER8w==', '1', '1');
INSERT INTO `user` VALUES ('2', 'zhouqing', '_xLlHs3d-n94VTl98QT0pKuw-JRsRtCJ', 'QyHlEhOmek/VJFbi8kxcfTRhZTA1NzZlNzE0MjgyNmI5MmRkZGYwMjU4OWNlYTJhY2U5YjIwNWVhYjRjNmEyZGExMjExY2U0ODA5MGQ3ZTditbVvJY7/C4Wh7oJv+TGh5Ga2puEtzS6YfEhr+j5Wwg==', '2', '1');
INSERT INTO `user` VALUES ('3', 'zzz', 'YNH_mjl-1IWVk51mO0nJ-_JAclIQvh1I', 'hCE9bP6ssuVUvQ2GT87WWDI4NDExMzc5MzVmNGM2ZjMyNGI3NTFiMWU3YTc2MWExNmMwMjUyYmY4ZDZkMDUzMWY3OWFhNGE2ODNjNTBlNmbWr45ZfRv49u4cztKPMTjvexf7SDIeRyqXU2lcLc7NqA==', '3', '1');
INSERT INTO `user` VALUES ('4', 'shiyu', 'y5dxjFIExmljkVfgFUydjTlPd9Q0ovJW', 'gli8MyBwcC9wowo1sS1M5zEzNzk4MGIwZDM4N2VkMTk4MTRhYzgyMDBlNjIwMDI1YTMxMDQxNTI4OTExMDJlMDYzYjVkM2Y4ODdkMzA1MTKIf6TDzI4hUCd8z4rD1Zd6Ix5gM3SbnS8XEMZuHaZmSg==', '3', '1');
INSERT INTO `user` VALUES ('5', 'feng', 'yYFriT-HcgkVccGG5gJgeK4WM8-VACNT', 'zIUkBt6kz5HMafywT8/+ZDY1NDlmNzYwZDFiMThjNDVlOTU2NmIxNzU0MGM3NjQ0ZmZhYjk5ZGYyZDBkZDlhNjAzODcyN2JkZmI2M2FkZDKKv2tZ3T0d5id6qN1IHjj9A1tMKlqUib6ru+DHKNUgfw==', '3', '1');

-- ----------------------------
-- Table structure for userans
-- ----------------------------
DROP TABLE IF EXISTS `userans`;
CREATE TABLE `userans` (
  `userid` int(11) NOT NULL,
  `exid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `qtypeid` int(11) NOT NULL,
  `ans` text,
  `grade` float DEFAULT NULL,
  `finishtime` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`userid`,`exid`,`qid`,`qtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userans
-- ----------------------------
