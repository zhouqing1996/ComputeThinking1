/*
Navicat MySQL Data Transfer

Source Server         : 可视化教学设计
Source Server Version : 50637
Source Host           : 139.224.54.245:3306
Source Database       : ctts

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2020-10-20 18:47:53
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
INSERT INTO `book` VALUES ('1', '人民出版社', '假如给我三天光明', '海伦凯勒', '励志', '1');
INSERT INTO `book` VALUES ('2', '人名', '2020', '未知', '一些', '1');
INSERT INTO `book` VALUES ('3', '人名', '2021', '未知', '一些', '1');
INSERT INTO `book` VALUES ('4', '人名', '2022', '未知', '一些', '1');
INSERT INTO `book` VALUES ('5', '人名', '2023', '未知', '一些', '1');
INSERT INTO `book` VALUES ('6', '人名', '2024', '未知', '一些', '1');
INSERT INTO `book` VALUES ('7', '人名', '2025', '未知', '一些', '1');
INSERT INTO `book` VALUES ('8', '人名', '2026', '未知', '一些', '1');
INSERT INTO `book` VALUES ('9', '人名', '2027', '未知', '一些', '1');
INSERT INTO `book` VALUES ('10', '人名', '2028', '未知', '一些', '1');
INSERT INTO `book` VALUES ('11', '人名', '2029', '未知', '一些', '1');
INSERT INTO `book` VALUES ('12', '人名', '2030', '未知', '一些', '1');
INSERT INTO `book` VALUES ('13', '人名', '2031', '未知', '一些', '1');
INSERT INTO `book` VALUES ('14', '人名', '2032', '未知', '一些', '1');
INSERT INTO `book` VALUES ('15', '人名', '2033', '未知', '一些', '1');
INSERT INTO `book` VALUES ('16', '人名', '2034', '未知', '一些', '1');
INSERT INTO `book` VALUES ('17', '人名', '2035', '未知', '一些', '1');
INSERT INTO `book` VALUES ('18', '人名', '2036', '未知', '一些', '1');
INSERT INTO `book` VALUES ('19', '人名', '2037', '未知', '一些', '1');
INSERT INTO `book` VALUES ('20', '人名', '2038', '未知', '一些', '0');

-- ----------------------------
-- Table structure for bprogramq
-- ----------------------------
DROP TABLE IF EXISTS `bprogramq`;
CREATE TABLE `bprogramq` (
  `bpid` varchar(255) NOT NULL,
  `bpitem` varchar(255) NOT NULL,
  `bpans` varchar(255) NOT NULL,
  `bptail` varchar(255) NOT NULL,
  `bprem` varchar(255) NOT NULL,
  `bpstatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bprogramq
-- ----------------------------
INSERT INTO `bprogramq` VALUES ('1', '题目一', 'C', 'C语言是世界上最好的编程语言', 'C语言', '1');
INSERT INTO `bprogramq` VALUES ('3', '题目三', 'C++', 'C++是世界上最好的编程语言', 'C++', '1');
INSERT INTO `bprogramq` VALUES ('4', '题目四', 'Java', 'Java语言是世界上最好的编程语言', 'Java', '1');
INSERT INTO `bprogramq` VALUES ('6', '题目五', 'PHP', 'PHP是世界上最好的编程语言', 'PHP语言', '1');

-- ----------------------------
-- Table structure for choosem
-- ----------------------------
DROP TABLE IF EXISTS `choosem`;
CREATE TABLE `choosem` (
  `mqid` int(11) NOT NULL,
  `mqitem` text,
  `mqcho` text,
  `mqans` text,
  `mqtail` text,
  `mqrem` text,
  `mqstatus` int(2) NOT NULL,
  PRIMARY KEY (`mqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of choosem
-- ----------------------------
INSERT INTO `choosem` VALUES ('1', '选择题1', 'A11---B12---C13---D14', 'B12', '略', '一', '1');
INSERT INTO `choosem` VALUES ('2', '选择题2', 'A12---B13---C14---D15', 'B13', '略', '二', '1');
INSERT INTO `choosem` VALUES ('3', '选择题3', 'A13---B14---C15---D16', 'B14', '略', '三', '1');
INSERT INTO `choosem` VALUES ('4', '选择题4', 'A14---B15---C16---D17', 'B15', '略', '四', '1');
INSERT INTO `choosem` VALUES ('5', '选择题5', 'A15---B16---C17---D18', 'B16', '略', '五', '1');
INSERT INTO `choosem` VALUES ('6', '选择题6', 'A16---B17---C18---D19', 'B17', '略', '六', '1');
INSERT INTO `choosem` VALUES ('7', '选择题7', 'A17---B18---C19---D20', 'B18', '略', '日', '1');
INSERT INTO `choosem` VALUES ('8', '选择题8', 'A18---B19---C20---D21', 'B19', '略', '一', '1');
INSERT INTO `choosem` VALUES ('9', '选择题9', 'A19---B20---C21---D22', 'B20', '略', '二', '1');
INSERT INTO `choosem` VALUES ('10', '选择题10', 'A20---B21---C22---D23', 'B21', '略', '三', '1');
INSERT INTO `choosem` VALUES ('11', '选择题11', 'A21---B22---C23---D24', 'B22', '略', '四', '1');
INSERT INTO `choosem` VALUES ('12', '选择题12', 'A22---B23---C24---D25', 'B23', '略', '五', '1');
INSERT INTO `choosem` VALUES ('13', '选择题13', 'A23---B24---C25---D26', 'B24', '略', '六', '1');
INSERT INTO `choosem` VALUES ('14', '选择题14', 'A24---B25---C26---D27', 'B25', '略', '日', '1');
INSERT INTO `choosem` VALUES ('15', '选择题15', 'A25---B26---C27---D28', 'B26', '略', '一', '1');
INSERT INTO `choosem` VALUES ('16', '选择题16', 'A26---B27---C28---D29', 'B27', '略', '二', '1');
INSERT INTO `choosem` VALUES ('17', '选择题17', 'A27---B28---C29---D30', 'B28', '略', '三', '1');
INSERT INTO `choosem` VALUES ('18', '选择题18', 'A28---B29---C30---D31', 'B29', '略', '四', '1');
INSERT INTO `choosem` VALUES ('19', '选择题19', 'A29---B30---C31---D32', 'B30', '略', '五', '1');
INSERT INTO `choosem` VALUES ('20', 'ahhaha', 'aaa---aaa---aa---aaaaaaa', 'aaa---aa', 'a', 'eeeeee', '1');
INSERT INTO `choosem` VALUES ('21', 'aaa', 'aa---aaa---aaaa---aaaaa', 'aa---aaa', 'a', 'aaaaaaaaaaaaaaaaa', '1');
INSERT INTO `choosem` VALUES ('22', '4', '4---5---6---7', '4--5---6---7', '11', '4', '1');
INSERT INTO `choosem` VALUES ('23', '44444', '44444---4444---444---444', '44', '444', '444', '1');
INSERT INTO `choosem` VALUES ('24', '涉及', '1---1---1---1', '2', '2', '1--2', '1');

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
INSERT INTO `chooseq` VALUES ('1', '设变量已定义并赋值，以下正确的表达式是_____.', 'int(15%5) ---X==---x=25%5--- x=y*5=+z', 'x=y+z+,++y', '3435647表达式的正确形式', '表达式的正确形式12', '1');
INSERT INTO `chooseq` VALUES ('2', '四大名著', '西游记---三国演义---水浒传---红楼梦', '四者都有', '常识知识', '四大民族', '1');
INSERT INTO `chooseq` VALUES ('3', '桃园三结义', '刘备---张飞---关羽---无名', '前三者', '三国演义', '故事', '0');
INSERT INTO `chooseq` VALUES ('4', '选择题1', 'A11---B12---C13---D14', 'B12', '略', '一', '1');
INSERT INTO `chooseq` VALUES ('5', '选择题2', 'A12---B13---C14---D15', 'B13', '略', '二', '1');
INSERT INTO `chooseq` VALUES ('6', '选择题3', 'A13---B14---C15---D16', 'B14', '略', '三', '1');
INSERT INTO `chooseq` VALUES ('7', '选择题4', 'A14---B15---C16---D17', 'B15', '略', '四', '1');
INSERT INTO `chooseq` VALUES ('8', '选择题5', 'A15---B16---C17---D18', 'B16', '略', '五', '1');
INSERT INTO `chooseq` VALUES ('9', '选择题6', 'A16---B17---C18---D19', 'B17', '略', '六', '1');
INSERT INTO `chooseq` VALUES ('10', '选择题7', 'A17---B18---C19---D20', 'B18', '略', '日', '1');
INSERT INTO `chooseq` VALUES ('11', '选择题8', 'A18---B19---C20---D21', 'B19', '略', '一', '1');
INSERT INTO `chooseq` VALUES ('12', '选择题9', 'A19---B20---C21---D22', 'B20', '略', '二', '1');
INSERT INTO `chooseq` VALUES ('13', '选择题10', 'A20---B21---C22---D23', 'B21', '略', '三', '1');
INSERT INTO `chooseq` VALUES ('14', '选择题11', 'A21---B22---C23---D24', 'B22', '略', '四', '1');
INSERT INTO `chooseq` VALUES ('15', '选择题12', 'A22---B23---C24---D25', 'B23', '略', '五', '1');
INSERT INTO `chooseq` VALUES ('16', '选择题13', 'A23---B24---C25---D26', 'B24', '略', '六', '1');
INSERT INTO `chooseq` VALUES ('17', '选择题14', 'A24---B25---C26---D27', 'B25', '略', '日', '1');
INSERT INTO `chooseq` VALUES ('18', '选择题15', 'A25---B26---C27---D28', 'B26', '略', '一', '1');
INSERT INTO `chooseq` VALUES ('19', '选择题16', 'A26---B27---C28---D29', 'B27', '略', '二', '1');
INSERT INTO `chooseq` VALUES ('20', '选择题17', 'A27---B28---C29---D30', 'B28', '略', '三', '1');
INSERT INTO `chooseq` VALUES ('21', '选择题18', 'A28---B29---C30---D31', 'B29', '略', '四', '1');
INSERT INTO `chooseq` VALUES ('22', '选择题19', 'A29---B30---C31---D32', 'B30', '略', '五', '1');
INSERT INTO `chooseq` VALUES ('23', 'shia', '11---1---1---1', '1', '1', '1', '1');
INSERT INTO `chooseq` VALUES ('24', '111111', '1111---1111---1111---11111', '1111', '111', '1111', '1');
INSERT INTO `chooseq` VALUES ('25', '教师测试选择题', '1---2---3---4', '1', '布置', '选择题', '1');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cid` int(11) NOT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `exid` int(11) NOT NULL,
  `exname` varchar(255) NOT NULL,
  `createtime` varchar(255) NOT NULL,
  `auth` int(11) DEFAULT NULL,
  `exstatus` int(2) NOT NULL,
  PRIMARY KEY (`exid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('2', 'ceshi1', '2020-10-12 16:55:12', null, '1');
INSERT INTO `exam` VALUES ('3', 'zaici ', '2020-10-12 17:15:38', '1', '1');
INSERT INTO `exam` VALUES ('4', '册数', '2020-10-12 17:30:37', '1', '1');
INSERT INTO `exam` VALUES ('5', '预览', '2020-10-12 20:42:11', '1', '1');
INSERT INTO `exam` VALUES ('6', '测试', '2020-10-13 18:24:50', '1', '1');
INSERT INTO `exam` VALUES ('7', '修改后', '2020-10-13 19:52:16', '1', '1');
INSERT INTO `exam` VALUES ('8', 'shisisaaa', '2020-10-15 20:55:12', '1', '1');
INSERT INTO `exam` VALUES ('9', 'shsiaaoaa', '2020-10-16 15:46:21', '1', '1');
INSERT INTO `exam` VALUES ('10', 'xin', '2020-10-17 09:10:31', null, '1');
INSERT INTO `exam` VALUES ('11', 'xinc', '2020-10-17 09:11:59', '1', '1');
INSERT INTO `exam` VALUES ('12', 'shisis', '2020-10-17 09:12:50', '1', '1');
INSERT INTO `exam` VALUES ('13', '改进', '2020-10-18 17:00:39', '1', '1');
INSERT INTO `exam` VALUES ('14', '创建试卷测试', '2020-10-19 15:11:40', '1', '1');
INSERT INTO `exam` VALUES ('15', '创建试卷测试2', '2020-10-19 15:12:51', '1', '1');
INSERT INTO `exam` VALUES ('16', '测评测试', '2020-10-20 10:34:45', '1', '1');
INSERT INTO `exam` VALUES ('17', '教师测试', '2020-10-20 15:26:44', '4', '1');
INSERT INTO `exam` VALUES ('18', '教师测试随机组卷', '2020-10-20 15:51:36', '4', '1');
INSERT INTO `exam` VALUES ('19', '教师测试创建试卷', '2020-10-20 15:57:31', '4', '1');

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
INSERT INTO `examtail` VALUES ('2', '2', '2', '1');
INSERT INTO `examtail` VALUES ('2', '8', '1', '1');
INSERT INTO `examtail` VALUES ('2', '9', '2', '1');
INSERT INTO `examtail` VALUES ('2', '12', '1', '1');
INSERT INTO `examtail` VALUES ('2', '15', '2', '1');
INSERT INTO `examtail` VALUES ('2', '16', '1', '1');
INSERT INTO `examtail` VALUES ('2', '17', '1', '1');
INSERT INTO `examtail` VALUES ('2', '18', '3', '1');
INSERT INTO `examtail` VALUES ('2', '19', '1', '1');
INSERT INTO `examtail` VALUES ('3', '2', '1', '1');
INSERT INTO `examtail` VALUES ('3', '4', '1', '1');
INSERT INTO `examtail` VALUES ('3', '4', '2', '1');
INSERT INTO `examtail` VALUES ('3', '5', '2', '1');
INSERT INTO `examtail` VALUES ('3', '7', '1', '1');
INSERT INTO `examtail` VALUES ('3', '7', '2', '1');
INSERT INTO `examtail` VALUES ('3', '9', '2', '1');
INSERT INTO `examtail` VALUES ('3', '10', '2', '1');
INSERT INTO `examtail` VALUES ('3', '11', '1', '1');
INSERT INTO `examtail` VALUES ('3', '12', '1', '1');
INSERT INTO `examtail` VALUES ('3', '12', '2', '1');
INSERT INTO `examtail` VALUES ('3', '13', '1', '1');
INSERT INTO `examtail` VALUES ('3', '13', '3', '1');
INSERT INTO `examtail` VALUES ('3', '15', '1', '1');
INSERT INTO `examtail` VALUES ('3', '16', '1', '1');
INSERT INTO `examtail` VALUES ('3', '16', '2', '1');
INSERT INTO `examtail` VALUES ('3', '17', '2', '1');
INSERT INTO `examtail` VALUES ('3', '18', '1', '1');
INSERT INTO `examtail` VALUES ('3', '19', '1', '1');
INSERT INTO `examtail` VALUES ('3', '19', '2', '1');
INSERT INTO `examtail` VALUES ('3', '20', '1', '1');
INSERT INTO `examtail` VALUES ('3', '21', '1', '1');
INSERT INTO `examtail` VALUES ('3', '21', '2', '1');
INSERT INTO `examtail` VALUES ('4', '1', '1', '1');
INSERT INTO `examtail` VALUES ('4', '1', '2', '1');
INSERT INTO `examtail` VALUES ('4', '2', '1', '1');
INSERT INTO `examtail` VALUES ('4', '2', '2', '1');
INSERT INTO `examtail` VALUES ('4', '3', '1', '1');
INSERT INTO `examtail` VALUES ('4', '3', '2', '1');
INSERT INTO `examtail` VALUES ('4', '4', '1', '1');
INSERT INTO `examtail` VALUES ('4', '5', '1', '1');
INSERT INTO `examtail` VALUES ('4', '5', '2', '1');
INSERT INTO `examtail` VALUES ('4', '6', '1', '1');
INSERT INTO `examtail` VALUES ('4', '7', '1', '1');
INSERT INTO `examtail` VALUES ('4', '7', '2', '1');
INSERT INTO `examtail` VALUES ('4', '7', '3', '1');
INSERT INTO `examtail` VALUES ('4', '8', '1', '1');
INSERT INTO `examtail` VALUES ('4', '8', '2', '1');
INSERT INTO `examtail` VALUES ('4', '9', '1', '1');
INSERT INTO `examtail` VALUES ('4', '10', '1', '1');
INSERT INTO `examtail` VALUES ('4', '11', '1', '1');
INSERT INTO `examtail` VALUES ('4', '13', '2', '1');
INSERT INTO `examtail` VALUES ('4', '14', '1', '1');
INSERT INTO `examtail` VALUES ('4', '14', '2', '1');
INSERT INTO `examtail` VALUES ('4', '15', '1', '1');
INSERT INTO `examtail` VALUES ('4', '15', '2', '1');
INSERT INTO `examtail` VALUES ('4', '16', '1', '1');
INSERT INTO `examtail` VALUES ('4', '16', '2', '1');
INSERT INTO `examtail` VALUES ('4', '17', '1', '1');
INSERT INTO `examtail` VALUES ('4', '18', '1', '1');
INSERT INTO `examtail` VALUES ('4', '19', '1', '1');
INSERT INTO `examtail` VALUES ('4', '20', '1', '1');
INSERT INTO `examtail` VALUES ('4', '21', '1', '1');
INSERT INTO `examtail` VALUES ('4', '22', '1', '1');
INSERT INTO `examtail` VALUES ('5', '7', '3', '1');
INSERT INTO `examtail` VALUES ('5', '8', '1', '1');
INSERT INTO `examtail` VALUES ('5', '10', '1', '1');
INSERT INTO `examtail` VALUES ('5', '10', '2', '1');
INSERT INTO `examtail` VALUES ('5', '14', '1', '1');
INSERT INTO `examtail` VALUES ('5', '15', '2', '1');
INSERT INTO `examtail` VALUES ('5', '20', '1', '1');
INSERT INTO `examtail` VALUES ('5', '21', '1', '1');
INSERT INTO `examtail` VALUES ('6', '1', '3', '1');
INSERT INTO `examtail` VALUES ('6', '2', '3', '1');
INSERT INTO `examtail` VALUES ('6', '3', '3', '1');
INSERT INTO `examtail` VALUES ('6', '4', '3', '1');
INSERT INTO `examtail` VALUES ('6', '6', '3', '1');
INSERT INTO `examtail` VALUES ('6', '9', '3', '1');
INSERT INTO `examtail` VALUES ('6', '10', '1', '1');
INSERT INTO `examtail` VALUES ('6', '10', '3', '1');
INSERT INTO `examtail` VALUES ('6', '15', '3', '1');
INSERT INTO `examtail` VALUES ('6', '19', '1', '1');
INSERT INTO `examtail` VALUES ('6', '19', '2', '1');
INSERT INTO `examtail` VALUES ('6', '20', '3', '1');
INSERT INTO `examtail` VALUES ('7', '2', '2', '1');
INSERT INTO `examtail` VALUES ('7', '6', '3', '1');
INSERT INTO `examtail` VALUES ('7', '10', '1', '1');
INSERT INTO `examtail` VALUES ('7', '12', '1', '1');
INSERT INTO `examtail` VALUES ('7', '14', '1', '1');
INSERT INTO `examtail` VALUES ('7', '14', '2', '1');
INSERT INTO `examtail` VALUES ('7', '17', '1', '1');
INSERT INTO `examtail` VALUES ('7', '17', '3', '1');
INSERT INTO `examtail` VALUES ('7', '19', '1', '1');
INSERT INTO `examtail` VALUES ('8', '1', '1', '1');
INSERT INTO `examtail` VALUES ('8', '5', '3', '1');
INSERT INTO `examtail` VALUES ('8', '6', '2', '1');
INSERT INTO `examtail` VALUES ('8', '7', '1', '1');
INSERT INTO `examtail` VALUES ('8', '12', '2', '1');
INSERT INTO `examtail` VALUES ('8', '14', '1', '1');
INSERT INTO `examtail` VALUES ('8', '16', '1', '1');
INSERT INTO `examtail` VALUES ('8', '20', '1', '1');
INSERT INTO `examtail` VALUES ('9', '5', '1', '1');
INSERT INTO `examtail` VALUES ('9', '8', '2', '1');
INSERT INTO `examtail` VALUES ('9', '17', '1', '1');
INSERT INTO `examtail` VALUES ('9', '17', '3', '1');
INSERT INTO `examtail` VALUES ('10', '1', '1', '1');
INSERT INTO `examtail` VALUES ('10', '1', '2', '1');
INSERT INTO `examtail` VALUES ('10', '1', '3', '1');
INSERT INTO `examtail` VALUES ('10', '2', '1', '1');
INSERT INTO `examtail` VALUES ('10', '2', '3', '1');
INSERT INTO `examtail` VALUES ('10', '2', '4', '1');
INSERT INTO `examtail` VALUES ('10', '2', '5', '1');
INSERT INTO `examtail` VALUES ('10', '3', '2', '1');
INSERT INTO `examtail` VALUES ('10', '3', '5', '1');
INSERT INTO `examtail` VALUES ('10', '4', '2', '1');
INSERT INTO `examtail` VALUES ('10', '4', '4', '1');
INSERT INTO `examtail` VALUES ('10', '5', '1', '1');
INSERT INTO `examtail` VALUES ('10', '5', '2', '1');
INSERT INTO `examtail` VALUES ('10', '6', '1', '1');
INSERT INTO `examtail` VALUES ('10', '6', '2', '1');
INSERT INTO `examtail` VALUES ('10', '6', '4', '1');
INSERT INTO `examtail` VALUES ('10', '8', '3', '1');
INSERT INTO `examtail` VALUES ('11', '1', '4', '1');
INSERT INTO `examtail` VALUES ('11', '1', '5', '1');
INSERT INTO `examtail` VALUES ('11', '2', '1', '1');
INSERT INTO `examtail` VALUES ('11', '3', '5', '1');
INSERT INTO `examtail` VALUES ('11', '4', '4', '1');
INSERT INTO `examtail` VALUES ('11', '4', '5', '1');
INSERT INTO `examtail` VALUES ('11', '5', '1', '1');
INSERT INTO `examtail` VALUES ('11', '6', '3', '1');
INSERT INTO `examtail` VALUES ('11', '6', '4', '1');
INSERT INTO `examtail` VALUES ('11', '7', '1', '1');
INSERT INTO `examtail` VALUES ('11', '8', '2', '1');
INSERT INTO `examtail` VALUES ('11', '9', '2', '1');
INSERT INTO `examtail` VALUES ('11', '9', '3', '1');
INSERT INTO `examtail` VALUES ('11', '16', '5', '1');
INSERT INTO `examtail` VALUES ('11', '18', '2', '1');
INSERT INTO `examtail` VALUES ('11', '18', '3', '1');
INSERT INTO `examtail` VALUES ('12', '1', '2', '1');
INSERT INTO `examtail` VALUES ('12', '1', '4', '1');
INSERT INTO `examtail` VALUES ('12', '2', '2', '1');
INSERT INTO `examtail` VALUES ('12', '2', '4', '1');
INSERT INTO `examtail` VALUES ('12', '4', '1', '1');
INSERT INTO `examtail` VALUES ('12', '4', '2', '1');
INSERT INTO `examtail` VALUES ('12', '4', '3', '1');
INSERT INTO `examtail` VALUES ('12', '4', '5', '1');
INSERT INTO `examtail` VALUES ('12', '5', '3', '1');
INSERT INTO `examtail` VALUES ('12', '6', '1', '1');
INSERT INTO `examtail` VALUES ('12', '6', '3', '1');
INSERT INTO `examtail` VALUES ('12', '6', '5', '1');
INSERT INTO `examtail` VALUES ('12', '7', '3', '1');
INSERT INTO `examtail` VALUES ('12', '7', '5', '1');
INSERT INTO `examtail` VALUES ('12', '8', '1', '1');
INSERT INTO `examtail` VALUES ('13', '1', '3', '1');
INSERT INTO `examtail` VALUES ('13', '1', '5', '1');
INSERT INTO `examtail` VALUES ('13', '2', '1', '1');
INSERT INTO `examtail` VALUES ('13', '2', '2', '1');
INSERT INTO `examtail` VALUES ('13', '2', '4', '1');
INSERT INTO `examtail` VALUES ('13', '3', '5', '1');
INSERT INTO `examtail` VALUES ('13', '4', '1', '1');
INSERT INTO `examtail` VALUES ('13', '4', '2', '1');
INSERT INTO `examtail` VALUES ('13', '5', '4', '1');
INSERT INTO `examtail` VALUES ('13', '6', '1', '1');
INSERT INTO `examtail` VALUES ('13', '6', '2', '1');
INSERT INTO `examtail` VALUES ('13', '6', '3', '1');
INSERT INTO `examtail` VALUES ('13', '6', '5', '1');
INSERT INTO `examtail` VALUES ('13', '7', '1', '1');
INSERT INTO `examtail` VALUES ('13', '8', '3', '1');
INSERT INTO `examtail` VALUES ('13', '8', '4', '1');
INSERT INTO `examtail` VALUES ('14', '20', '5', '1');
INSERT INTO `examtail` VALUES ('14', '21', '2', '1');
INSERT INTO `examtail` VALUES ('14', '21', '3', '1');
INSERT INTO `examtail` VALUES ('14', '22', '4', '1');
INSERT INTO `examtail` VALUES ('14', '23', '1', '1');
INSERT INTO `examtail` VALUES ('15', '21', '5', '1');
INSERT INTO `examtail` VALUES ('15', '22', '2', '1');
INSERT INTO `examtail` VALUES ('15', '22', '3', '1');
INSERT INTO `examtail` VALUES ('15', '23', '4', '1');
INSERT INTO `examtail` VALUES ('15', '24', '1', '1');
INSERT INTO `examtail` VALUES ('16', '1', '4', '1');
INSERT INTO `examtail` VALUES ('16', '2', '2', '1');
INSERT INTO `examtail` VALUES ('16', '2', '3', '1');
INSERT INTO `examtail` VALUES ('16', '2', '5', '1');
INSERT INTO `examtail` VALUES ('16', '3', '2', '1');
INSERT INTO `examtail` VALUES ('16', '3', '4', '1');
INSERT INTO `examtail` VALUES ('16', '4', '3', '1');
INSERT INTO `examtail` VALUES ('16', '4', '5', '1');
INSERT INTO `examtail` VALUES ('16', '7', '1', '1');
INSERT INTO `examtail` VALUES ('16', '8', '1', '1');
INSERT INTO `examtail` VALUES ('17', '1', '1', '1');
INSERT INTO `examtail` VALUES ('17', '1', '5', '1');
INSERT INTO `examtail` VALUES ('17', '2', '2', '1');
INSERT INTO `examtail` VALUES ('17', '2', '3', '1');
INSERT INTO `examtail` VALUES ('17', '4', '2', '1');
INSERT INTO `examtail` VALUES ('17', '4', '3', '1');
INSERT INTO `examtail` VALUES ('17', '5', '4', '1');
INSERT INTO `examtail` VALUES ('17', '5', '5', '1');
INSERT INTO `examtail` VALUES ('17', '7', '1', '1');
INSERT INTO `examtail` VALUES ('17', '7', '2', '1');
INSERT INTO `examtail` VALUES ('17', '7', '4', '1');
INSERT INTO `examtail` VALUES ('18', '1', '2', '1');
INSERT INTO `examtail` VALUES ('18', '2', '1', '1');
INSERT INTO `examtail` VALUES ('18', '2', '3', '1');
INSERT INTO `examtail` VALUES ('18', '9', '5', '1');
INSERT INTO `examtail` VALUES ('18', '11', '1', '1');
INSERT INTO `examtail` VALUES ('18', '15', '2', '1');
INSERT INTO `examtail` VALUES ('18', '18', '3', '1');
INSERT INTO `examtail` VALUES ('18', '18', '5', '1');
INSERT INTO `examtail` VALUES ('18', '19', '4', '1');
INSERT INTO `examtail` VALUES ('18', '21', '4', '1');
INSERT INTO `examtail` VALUES ('19', '22', '5', '1');
INSERT INTO `examtail` VALUES ('19', '23', '2', '1');
INSERT INTO `examtail` VALUES ('19', '23', '3', '1');
INSERT INTO `examtail` VALUES ('19', '24', '4', '1');
INSERT INTO `examtail` VALUES ('19', '25', '1', '1');

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
INSERT INTO `fillq` VALUES ('1', '题目1', '答案1', '详情1', '知识点1', '1');
INSERT INTO `fillq` VALUES ('2', '题目2', '答案2', '详情2', '知识点2', '1');
INSERT INTO `fillq` VALUES ('3', '题目3', '答案3', '详情3', '知识点3', '1');
INSERT INTO `fillq` VALUES ('4', '题目4', '答案4', '详情4', '知识点4', '1');
INSERT INTO `fillq` VALUES ('5', '题目5', '答案5', '详情5', '知识点5', '1');
INSERT INTO `fillq` VALUES ('6', '题目6', '答案6', '详情6', '知识点6', '1');
INSERT INTO `fillq` VALUES ('7', '题目7', '答案7', '详情7', '知识点7', '1');
INSERT INTO `fillq` VALUES ('8', '题目8', '答案8', '详情8', '知识点8', '1');
INSERT INTO `fillq` VALUES ('9', '题目9', '答案9', '详情9', '知识点9', '1');
INSERT INTO `fillq` VALUES ('10', '题目10', '答案10', '详情10', '知识点10', '1');
INSERT INTO `fillq` VALUES ('11', '题目11', '答案11', '详情11', '知识点11', '1');
INSERT INTO `fillq` VALUES ('12', '题目12', '答案12', '详情12', '知识点12', '1');
INSERT INTO `fillq` VALUES ('13', '题目13', '答案13', '详情13', '知识点13', '1');
INSERT INTO `fillq` VALUES ('14', '题目14', '答案14', '详情14', '知识点14', '1');
INSERT INTO `fillq` VALUES ('15', '题目15', '答案15', '详情15', '知识点15', '1');
INSERT INTO `fillq` VALUES ('16', '题目16', '答案16', '详情16', '知识点16', '1');
INSERT INTO `fillq` VALUES ('17', '题目17', '答案17', '详情17', '知识点17', '1');
INSERT INTO `fillq` VALUES ('18', '题目18', '答案18', '详情18', '知识点18', '1');
INSERT INTO `fillq` VALUES ('19', '题目19', '答案19', '详情19', '知识点19', '1');
INSERT INTO `fillq` VALUES ('20', '信息以什么形式存储在计算机中？', '二进制编码', '计算机基础', '计算机', '1');
INSERT INTO `fillq` VALUES ('21', '2', '2', '2', '2', '1');
INSERT INTO `fillq` VALUES ('22', '222', '222', '22', '2222', '1');
INSERT INTO `fillq` VALUES ('23', '填空题1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for judge
-- ----------------------------
DROP TABLE IF EXISTS `judge`;
CREATE TABLE `judge` (
  `jqid` int(11) NOT NULL,
  `jqitem` text,
  `jqans` int(2) DEFAULT NULL,
  `jqtail` text,
  `jqrem` text,
  `jqstatus` int(2) NOT NULL,
  PRIMARY KEY (`jqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of judge
-- ----------------------------
INSERT INTO `judge` VALUES ('1', '题目1', '1', '详情1', '知识点1', '1');
INSERT INTO `judge` VALUES ('2', '题目2', '1', '详情2', '知识点2', '1');
INSERT INTO `judge` VALUES ('3', '题目3', '0', '详情3', '知识点3', '1');
INSERT INTO `judge` VALUES ('4', '题目4', '1', '详情4', '知识点4', '1');
INSERT INTO `judge` VALUES ('5', '题目5', '0', '详情5', '知识点5', '1');
INSERT INTO `judge` VALUES ('6', '题目6', '1', '详情6', '知识点6', '1');
INSERT INTO `judge` VALUES ('7', '题目7', '0', '详情7', '知识点7', '1');
INSERT INTO `judge` VALUES ('8', '题目8', '1', '详情8', '知识点8', '1');
INSERT INTO `judge` VALUES ('9', '题目9', '0', '详情9', '知识点9', '1');
INSERT INTO `judge` VALUES ('10', '题目10', '1', '详情10', '知识点10', '1');
INSERT INTO `judge` VALUES ('11', '题目11', '0', '详情11', '知识点11', '1');
INSERT INTO `judge` VALUES ('12', '题目12', '1', '详情12', '知识点12', '1');
INSERT INTO `judge` VALUES ('13', '题目13', '0', '详情13', '知识点13', '1');
INSERT INTO `judge` VALUES ('14', '题目14', '1', '详情14', '知识点14', '1');
INSERT INTO `judge` VALUES ('15', '题目15', '0', '详情15', '知识点15', '1');
INSERT INTO `judge` VALUES ('16', '题目16', '1', '详情16', '知识点16', '1');
INSERT INTO `judge` VALUES ('17', '题目17', '0', '详情17', '知识点17', '1');
INSERT INTO `judge` VALUES ('18', '题目18', '1', '详情18', '知识点18', '1');
INSERT INTO `judge` VALUES ('19', '题目19', '0', '详情19', '知识点19', '1');
INSERT INTO `judge` VALUES ('20', '3', '3', '3', '3', '1');
INSERT INTO `judge` VALUES ('21', '333', '333', '333', '333', '1');
INSERT INTO `judge` VALUES ('22', '判断1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for pratice
-- ----------------------------
DROP TABLE IF EXISTS `pratice`;
CREATE TABLE `pratice` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `qtypeid` int(11) NOT NULL,
  `ans` text,
  `finishtime` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pratice
-- ----------------------------

-- ----------------------------
-- Table structure for program
-- ----------------------------
DROP TABLE IF EXISTS `program`;
CREATE TABLE `program` (
  `pqid` int(11) NOT NULL,
  `pqitem` text,
  `pqans` text,
  `pqtail` text,
  `pqrem` text,
  `pqstatus` int(2) NOT NULL,
  PRIMARY KEY (`pqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of program
-- ----------------------------
INSERT INTO `program` VALUES ('1', '程序题1', '答案1', '详情1', '知识点1', '1');
INSERT INTO `program` VALUES ('2', '程序题2', '答案2', '详情2', '知识点2', '1');
INSERT INTO `program` VALUES ('3', '程序题3', '答案3', '详情3', '知识点3', '1');
INSERT INTO `program` VALUES ('4', '程序题4', '答案4', '详情4', '知识点4', '1');
INSERT INTO `program` VALUES ('5', '程序题5', '答案5', '详情5', '知识点5', '1');
INSERT INTO `program` VALUES ('6', '程序题6', '答案6', '详情6', '知识点6', '1');
INSERT INTO `program` VALUES ('7', '程序题7', '答案7', '详情7', '知识点7', '1');
INSERT INTO `program` VALUES ('8', '程序题8', '答案8', '详情8', '知识点8', '1');
INSERT INTO `program` VALUES ('9', '程序题9', '答案9', '详情9', '知识点9', '1');
INSERT INTO `program` VALUES ('10', '程序题10', '答案10', '详情10', '知识点10', '1');
INSERT INTO `program` VALUES ('11', '程序题11', '答案11', '详情11', '知识点11', '1');
INSERT INTO `program` VALUES ('12', '程序题12', '答案12', '详情12', '知识点12', '1');
INSERT INTO `program` VALUES ('13', '程序题13', '答案13', '详情13', '知识点13', '1');
INSERT INTO `program` VALUES ('14', '程序题14', '答案14', '详情14', '知识点14', '1');
INSERT INTO `program` VALUES ('15', '程序题15', '答案15', '详情15', '知识点15', '1');
INSERT INTO `program` VALUES ('16', '程序题16', '答案16', '详情16', '知识点16', '1');
INSERT INTO `program` VALUES ('17', '程序题17', '答案17', '详情17', '知识点17', '1');
INSERT INTO `program` VALUES ('18', '程序题18', '答案18', '详情18', '知识点18', '1');
INSERT INTO `program` VALUES ('19', '程序题19', '答案19', '详情19', '知识点19', '1');
INSERT INTO `program` VALUES ('20', '5', '5', '5', '5', '1');
INSERT INTO `program` VALUES ('21', '5', '5', '5', '5', '1');
INSERT INTO `program` VALUES ('22', '555', '555', '555', '555', '1');
INSERT INTO `program` VALUES ('23', '程序题1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for programq
-- ----------------------------
DROP TABLE IF EXISTS `programq`;
CREATE TABLE `programq` (
  `pqid` int(11) NOT NULL,
  `pqtitle` text,
  `pqback` text,
  `pqdescri` text,
  `pqinputB` text,
  `pqoutputB` text,
  `pqcase` text,
  `pqother` text,
  `pqauth` int(11) DEFAULT NULL,
  `pqlabel` varchar(255) DEFAULT NULL,
  `pqrem` text,
  `pqans` text,
  `pqstatus` int(2) NOT NULL,
  PRIMARY KEY (`pqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programq
-- ----------------------------
INSERT INTO `programq` VALUES ('1', 'A1', '背景1', '描述1', '输入1', '输出1', '样例1', '说明1', '1', '标签1', '推荐1', '答案1', '1');
INSERT INTO `programq` VALUES ('3', 'A3', '背景3', '描述3', '输入3', '输出3', '样例3', '说明3', '1', '标签3', '推荐3', '答案3', '1');
INSERT INTO `programq` VALUES ('4', 'A4', '背景4', '描述4', '输入4', '输出4', '样例4', '说明4', '1', '标签4', '推荐4', '答案4', '1');
INSERT INTO `programq` VALUES ('5', 'A5', '背景5', '描述5', '输入5', '输出5', '样例5', '说明5', '1', '标签5', '推荐5', '答案5', '1');
INSERT INTO `programq` VALUES ('6', 'A6', '背景6', '描述6', '输入6', '输出6', '样例6', '说明6', '1', '标签6', '推荐6', '答案6', '1');
INSERT INTO `programq` VALUES ('7', 'A7', '背景7', '描述7', '输入7', '输出7', '样例7', '说明7', '1', '标签7', '推荐7', '答案7', '1');
INSERT INTO `programq` VALUES ('8', 'A8', '背景8', '描述8', '输入8', '输出8', '样例8', '说明8', '1', '标签8', '推荐8', '答案8', '1');
INSERT INTO `programq` VALUES ('9', 'A9', '背景9', '描述9', '输入9', '输出9', '样例9', '说明9', '1', '标签9', '推荐9', '答案9', '1');
INSERT INTO `programq` VALUES ('10', 'A10', '背景10', '描述10', '输入10', '输出10', '样例10', '说明10', '1', '标签10', '推荐10', '答案10', '1');
INSERT INTO `programq` VALUES ('11', 'A11', '背景11', '描述11', '输入11', '输出11', '样例11', '说明11', '1', '标签11', '推荐11', '答案11', '1');
INSERT INTO `programq` VALUES ('12', 'A12', '背景12', '描述12', '输入12', '输出12', '样例12', '说明12', '1', '标签12', '推荐12', '答案12', '1');
INSERT INTO `programq` VALUES ('13', 'A13', '背景13', '描述13', '输入13', '输出13', '样例13', '说明13', '1', '标签13', '推荐13', '答案13', '1');
INSERT INTO `programq` VALUES ('14', 'A14', '背景14', '描述14', '输入14', '输出14', '样例14', '说明14', '1', '标签14', '推荐14', '答案14', '1');
INSERT INTO `programq` VALUES ('15', 'A15', '背景15', '描述15', '输入15', '输出15', '样例15', '说明15', '1', '标签15', '推荐15', '答案15', '1');
INSERT INTO `programq` VALUES ('16', 'A16', '背景16', '描述16', '输入16', '输出16', '样例16', '说明16', '1', '标签16', '推荐16', '答案16', '1');
INSERT INTO `programq` VALUES ('17', 'A17', '背景17', '描述17', '输入17', '输出17', '样例17', '说明17', '1', '标签17', '推荐17', '答案17', '1');
INSERT INTO `programq` VALUES ('18', 'A18', '背景18', '描述18', '输入18', '输出18', '样例18', '说明18', '1', '标签18', '推荐18', '答案18', '1');
INSERT INTO `programq` VALUES ('19', 'A19', '背景19', '描述19', '输入19', '输出19', '样例19', '说明19', '1', '标签19', '推荐19', '答案19', '1');
INSERT INTO `programq` VALUES ('20', 'A20', '背景20', '描述20', '输入20', '输出20', '样例20', '说明20', '1', '标签20', '推荐20', '答案20', '1');
INSERT INTO `programq` VALUES ('21', '独木桥', '战争已经进入到紧要时间。你是运输小队长，正在率领运输部队向前线运送物资。运输任务像做题一样的无聊。你希望找些刺激，于是命令你的士兵们到前方的一座独木桥上欣赏风景，而你留在桥下欣赏士兵们。士兵们十分愤怒，因为这座独木桥十分狭窄，只能容纳11个人通过。假如有22个人相向而行在桥上相遇，那么他们22个人将无妨绕过对方，只能有11个人回头下桥，让另一个人先通过。但是，可以有多个人同时呆在同一个位置。', '突然，你收到从指挥部发来的信息，敌军的轰炸机正朝着你所在的独木桥飞来！为了安全，你的部队必须撤下独木桥。独木桥的长度为LL，士兵们只能呆在坐标为整数的地方。所有士兵的速度都为11，但一个士兵某一时刻来到了坐标为00或L+1L+1的位置，他就离开了独木桥。  每个士兵都有一个初始面对的方向，他们会以匀速朝着这个方向行走，中途不会自己改变方向。但是，如果两个士兵面对面相遇，他们无法彼此通过对方，于是就分别转身，继续行走。转身不需要任何的时间。  由于先前的愤怒，你已不能控制你的士兵。甚至，你连每个士兵初始面对的方向都不知道。因此，你想要知道你的部队最少需要多少时间就可能全部撤离独木桥。另外，总部也在安排阻拦敌人的进攻，因此你还需要知道你的部队最多需要多少时间才能全部撤离独木桥。', '第一行：一个整数LL，表示独木桥的长度。桥上的坐标为11…LL  第二行：一个整数NN，表示初始时留在桥上的士兵数目  第三行：有NN个整数，分别表示每个士兵的初始坐标。', '只有一行，输出22个整数，分别表示部队撤离独木桥的最小时间和最大时间。22个整数由一个空格符分开。', '输入 #1', '说明/提示 初始时，没有两个士兵同在一个坐标。  数据范围N \\le L \\le 5000N≤L≤5000。', '1', '模拟 贪心', '求阶乘', '略', '1');

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
INSERT INTO `qtype` VALUES ('4', '多选题');
INSERT INTO `qtype` VALUES ('5', '判断题');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` int(11) NOT NULL,
  `tid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------

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
INSERT INTO `user` VALUES ('1', 'root', '', 'eASjeAQVRCYhuvAQ1O5NwjAwOWU3YTZhNTVjNTY4ZThlZTgzMjRiMmRlYTY2MzMzMmVjZTllMTM2OTg0YTBlODNjNGJkMTA0NmIyODkyNWQcZdRsORm1vx4/QdY534ZtA4skulJ7QL+42NzGfbtxbQ==', '1', '1');
INSERT INTO `user` VALUES ('3', 'zzz', 'YNH_mjl-1IWVk51mO0nJ-_JAclIQvh1I', 'hCE9bP6ssuVUvQ2GT87WWDI4NDExMzc5MzVmNGM2ZjMyNGI3NTFiMWU3YTc2MWExNmMwMjUyYmY4ZDZkMDUzMWY3OWFhNGE2ODNjNTBlNmbWr45ZfRv49u4cztKPMTjvexf7SDIeRyqXU2lcLc7NqA==', '3', '1');
INSERT INTO `user` VALUES ('4', 'root2', '', 'gli8MyBwcC9wowo1sS1M5zEzNzk4MGIwZDM4N2VkMTk4MTRhYzgyMDBlNjIwMDI1YTMxMDQxNTI4OTExMDJlMDYzYjVkM2Y4ODdkMzA1MTKIf6TDzI4hUCd8z4rD1Zd6Ix5gM3SbnS8XEMZuHaZmSg==', '2', '1');
INSERT INTO `user` VALUES ('5', 'feng', '', 'zIUkBt6kz5HMafywT8/+ZDY1NDlmNzYwZDFiMThjNDVlOTU2NmIxNzU0MGM3NjQ0ZmZhYjk5ZGYyZDBkZDlhNjAzODcyN2JkZmI2M2FkZDKKv2tZ3T0d5id6qN1IHjj9A1tMKlqUib6ru+DHKNUgfw==', '1', '1');
INSERT INTO `user` VALUES ('6', '杨冰', 'm1wUiHqaHemOk2_kOdVI6Z14jdjDZjyX', 'UQWhxB372dHMqNL9qyQRXWZjYWExNjA5ODgwOWI0NGRlMGY4M2Q4OGFhNTQ2N2I4YTBiZmVmZTg5YjE0MGJhZWQ5ZmFhZWFmMTk5OGI1OGEceHEshMETk+1Tveu+2FB9sxlR1f+cggDosVUXRhMJ5Q==', '1', '1');
INSERT INTO `user` VALUES ('7', 'zhouq', null, '123456', '3', '0');
INSERT INTO `user` VALUES ('8', '周青', null, '123456', '3', '1');
INSERT INTO `user` VALUES ('9', '周青1', null, '123456', '3', '1');
INSERT INTO `user` VALUES ('10', '施雨', null, '123456', '3', '0');
INSERT INTO `user` VALUES ('12', 'cxx', '_xg-uNAeYDRmK9qMdKlLQAaMRiPydqkW', 'rf5AvNNKCmbIvXbnzjs8JzU2ZGNjODM0ZGUzMDNkZTU4ODE2ZjY0ZWUxOWNkNjI3ZGQ4OWYwOTNiMjEyYjA5MjllOTRiNTRiYzljOTM5NTIXcmFfrYwz577/rVo81CIX1kwBaulC/8ylgCwvOl7Rtg==', '1', '1');
INSERT INTO `user` VALUES ('13', 'test1', null, '123456', '3', '1');
INSERT INTO `user` VALUES ('14', 'test', null, '123456', '2', '1');
INSERT INTO `user` VALUES ('15', '800', null, 'W4idi5vfUDK0Nn9tOTUxLjEwY2ExNjM2ZDYxMDIyYmVkMzliZTFhM2ZjZjkxMjg1NjNmMTg3YmY1YTQ1OWVhMGE5MWM1YmQyMWNjMzRmYzj0jc7E3Vi4p4gfoDBihYkSKvTU1/awUhk+roZpqRGL7g==', '1', '1');
INSERT INTO `user` VALUES ('16', '801', null, 'Lfj4cC7yO76/e2s+8EmVmTAyYTc4ZTY4ZmE3OGE2OTUyMmM5NzQ0MDRmY2VlMzBmN2E2MWM3ZDhlNjEwYTljYzdjODZmYTNkM2Y3NWZlMGa/knfHbKZI6UZft9hPJnuLgEYQl6OSh0DV25hBFpv6ZQ==', '2', '1');
INSERT INTO `user` VALUES ('17', '802', null, 'MCPWMJrW18EkwIHIXzu5RDg1ZmQwOWYwZTM5NGNmZDAwN2Y5NGJjZGM1MmI0NzQxY2EwZDNkZmE4NTBiNWVkYmY4MjU4MjkzODNiMWM3NzL0pt0AlixTF3Nvt8J5L+zRp8p+PCAAPiYaKfNc6QHkjQ==', '3', '1');
INSERT INTO `user` VALUES ('18', '803', null, 'hTqKWuuspGpMLtekWFZ39mMyYzFjNGYzNzEyYzc0ZjFiMDQ4YWFlZGY0OTBlZWE5ZWZkNGU4ZjlhNDI5Zjc2YTk2MmUzMDQ4M2ZmMTliMjHMJSmQdnMezryesw6eTtZX+8ByYRFEcJPvem4no+uNTg==', '1', '1');
INSERT INTO `user` VALUES ('19', '804', null, 'cjD5QWqu6KPnWYhFN+gs+zQ5ZWNhYzM5YzUyMjgxZjkwMGFmMGY3ODYzZmM4MzhmNTAyMGQxNmRhODA2MmY5MzVkYzY3NTA0MTdkZDdlMTJT4+6qD+CW5g4d6RNjn2E+ITfsuofJNQj+en8rdMHcCQ==', '2', '1');
INSERT INTO `user` VALUES ('20', '805', null, 'UFLMftlJUwhHfgH7sCNRkjMyZThiMTgzNDVjODE2NTZhODRlMjIzZWQzNzU4YjIxZGNmZGQwMDAxZGYwNzBiMzM1NWQwZjlhYzBjMTg3NjYKij5tvO763feZYUZTXk6CUmdc8l3WJYIoUbkg7EqiXw==', '3', '1');
INSERT INTO `user` VALUES ('21', '806', null, '1Ty7JtwPAMtf7nv3zkYYDWRiZTFlYzZlMmNmNzc0OGU2NmI1YTgxY2MyOWE3MGEwZTljOGRmY2U1MmE5YzgxN2JlODI2YzFiZGU4MWEwZWO7LyQWUSqnROT8zcCgwNVgJ/Wbpcjgrs/Jy/gJnL6log==', '1', '1');
INSERT INTO `user` VALUES ('22', '807', null, 'KJrYJQnnq8LpF+sZiZy/rzM2ZmE1NDBjYTFhM2Y4YzIxZWZkOGYzNzA4NDZmZjQ2ODIxOTY1MmJiM2VjNTM5NWMyMTI2NDY1MzQ1Mzg3NzUL9OOxTwrAzfyShpQ0zUhTLS8mOM1BmCRAlKoaXqLccQ==', '2', '1');
INSERT INTO `user` VALUES ('23', '808', null, 'XWgZ38bsCYNimgf/nq1GdDM0YTZlYjRmNDhlNWE1MjFlNmZkMWJiMmMzMmFiNmRhNDlmN2MwYzBiMTJiNGIyZDc0Y2VhOTJhMjgwMjZkZDdJYUbeStXO2/kLek1FmYqkcN7Is1QHaMuq4Lyi4rLOEw==', '3', '1');
INSERT INTO `user` VALUES ('24', '809', null, '1ZcrPp5J/whAOaYVa/0J2jAxZDFhYTBiNTM5ZDI1NmRhNGI5ZTdmYzFjMzZkYjM0NGM1MDY3OWZlY2NjODZlN2Y2MDQ5NjU3NGE0YjkwYzI9yIxlXI1VBu6m57yPlUbxjwetWAauYFvtiMtQpqR/xA==', '1', '1');
INSERT INTO `user` VALUES ('25', '810', null, 'GRlKyiOcdzu0JISkkKJ77TY4MGZiZjRhYTQ3ZWVlYjA3NzMzY2ZiYmE0MjEyYWY5ZDk1Y2Q1ZDYxZjI2OTM4Yzg3MGZkNTIyMTMzNGFkYzY/ybSbhMECEveJdqQErP2WZBCDXD0wOkkP6BNbH4Vcdw==', '2', '1');
INSERT INTO `user` VALUES ('26', '811', null, 'K8O3Zro3LCez42kw4osszzJiOGI2ZmVhMGQwMDMyODNjNDc3NjJhZjk5YjRlODU5NWZiMzhmZmE5YjBkYjNlNDRkODA4ZmVjZjVmMTNmNWaOpYatlG8qMAvo8JaphtxpkLrhaUJ/fdlAzCH7/ibJnA==', '3', '1');
INSERT INTO `user` VALUES ('27', '812', null, 'Aecb8LgjiPZ5RL6SmgMIamU0MTc3ODUyNjZjYjBjMmJhMzg1OTMxZjEzMDExY2RjN2I4MzBmNTVjNTc4MDdkMmQ1ZGFkNTA2NWNjODFkYTgr9CGyCSDynsvM5sdgPLrUNvbNPJuELdlbPRh4RtEKcQ==', '1', '1');
INSERT INTO `user` VALUES ('28', '813', null, '+IYV7X1Pg5f+LjyzLtk4fzBiZWY4NjdlZGEwMDFhNzA3MTQ5ZDNlZDZkMTA4YWY1Y2VjZTQxNTc0ZDI3ZTAzMzAxMWY3ZGI3MjUwZDU4NjQGdpDBG7Ls9JETuwPZIKj/lIpmbYJYzG6j7dBSSl0KVw==', '2', '1');
INSERT INTO `user` VALUES ('29', '814', null, 'gISTw+p16PKgTamHakf8FjQxMGQzNTQxZTY3ZjIxYWNhZDZkZmJjYmM4YWYzOGM4MjU4Y2IyMmVjNmIzY2M5YWM5YTcwNmQxYmY1ZTI0YzPn4Nyk6FKJPaPac7RS1d1cC8zf9c25HKk/OUFtNkAKzQ==', '3', '1');
INSERT INTO `user` VALUES ('30', '815', null, 'wqiHXPSuZ6rt2VfmSNlzGmU2NWM0MjE0MTU4MjEwNmM4ZmRmN2MyMjA3YTM2OWNiNmNiY2ZjMjIxMWFmYjQyOTg1YmU3NjE2YTRhODc5ZTHRMfs2UWWsV4z52Dq3eMgvZO8+fNvkop6ur+fpjSmzAw==', '1', '1');
INSERT INTO `user` VALUES ('31', '816', null, '85tD3o3s2dtOuXIQ8qK2YWFiNmRiY2NlZWJkMjExNGY1ODYwYjhjOTRiNmJiNWNiMjQyYmY1NzY0MDQyYThjYjQ4NzA2MGQ4YmNhMzAwN2Rcqk9RkvQrE5moummYs0N4j1xVropXNgZ/ySiUoZybGw==', '2', '1');
INSERT INTO `user` VALUES ('32', '817', null, 'ovkBwfF3rtJ+c+NYxqCV/GI4NWFjZTA5ZjFhOWQxZWY1YzkzOGVlOGQyOTIyMDQxODc3NzIxNjdjNTk5NzBmMzY3Njk3OWIwOGVhNDIwOWavOTyy5mWSdBFPO07TOj7n6L58fDrkY8/T9wswdjh78w==', '3', '1');
INSERT INTO `user` VALUES ('33', '818', null, 'EPIfKsMKcfiCQINhh2SdrDczYWRkNjAzMTdiYmUwNjc2YzgyZmQ4MGY4NDA3YjVhMDUzMTU2YjRjN2JjYzQ5N2JkZGJjOTRmYjAxMjBmMzjCp6up4WlVFk4kSKTvNObirJn1TrFa3t+yNKYuqinDDw==', '1', '1');
INSERT INTO `user` VALUES ('34', 'root3', 'KXL-WhtszsEHrj32p307_OVbTx4W0ca2', 'S8RkaSLAd2W+uHfY5jSK+zljNzJjYmI0ZGUwM2VhMmY0OGMwOTliYjgxOWM3ZmExNmY1ZDE0MWNiZmZmMTE4OGI4ZWM0ZTQ4MDliZGNjZTNdLWGLmPyfp9JaBzlQpCNSfYGe05yzWiO/s+Yjth+IdQ==', '3', '1');
INSERT INTO `user` VALUES ('35', 'ddd', '', 'DJjTa3eLJ0+cO7v6w+3YeWYwMmJmYzUwNzdkMWVkZjdlYTIzMTJkNzRiODU4ZDRhNWYyNjljYzRiMGM2NjUyMjlhZjhkYjVkNzMxOGIzNWYP0rOAqLL4oKUm+o+Wo3woN/9ika/F3uuEAr14Shsq3g==', '3', '1');

-- ----------------------------
-- Table structure for userans
-- ----------------------------
DROP TABLE IF EXISTS `userans`;
CREATE TABLE `userans` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `exid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `qtypeid` int(11) NOT NULL,
  `ans` text,
  `grade` float DEFAULT NULL,
  `finishtime` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userans
-- ----------------------------
INSERT INTO `userans` VALUES ('1', '34', '16', '7', '1', 'D17', null, '2020-10-20 11:39:21', '1');
INSERT INTO `userans` VALUES ('1', '34', '16', '8', '1', 'A15', null, '2020-10-20 11:39:21', '1');
INSERT INTO `userans` VALUES ('1', '34', '16', '2', '2', '1111', null, '2020-10-20 11:39:21', '1');
INSERT INTO `userans` VALUES ('1', '34', '16', '3', '2', '1111', null, '2020-10-20 11:39:21', '1');
INSERT INTO `userans` VALUES ('1', '34', '16', '2', '3', '111', null, '2020-10-20 11:39:21', '1');
INSERT INTO `userans` VALUES ('1', '34', '16', '4', '3', '1111', null, '2020-10-20 11:39:21', '1');
INSERT INTO `userans` VALUES ('1', '34', '16', '1', '4', 'A11---B12---C13', null, '2020-10-20 11:39:21', '1');
INSERT INTO `userans` VALUES ('1', '34', '16', '3', '4', 'A13---C15---D16', null, '2020-10-20 11:39:21', '1');
INSERT INTO `userans` VALUES ('1', '34', '16', '2', '5', '0', null, '2020-10-20 11:39:21', '1');
INSERT INTO `userans` VALUES ('1', '34', '16', '4', '5', '1', null, '2020-10-20 11:39:21', '1');
INSERT INTO `userans` VALUES ('2', '34', '16', '7', '1', 'D17', null, '2020-10-20 11:41:52', '1');
INSERT INTO `userans` VALUES ('2', '34', '16', '8', '1', 'A15', null, '2020-10-20 11:41:52', '1');
INSERT INTO `userans` VALUES ('2', '34', '16', '2', '2', 'q', null, '2020-10-20 11:41:52', '1');
INSERT INTO `userans` VALUES ('2', '34', '16', '3', '2', 'q', null, '2020-10-20 11:41:52', '1');
INSERT INTO `userans` VALUES ('2', '34', '16', '2', '3', 'q', null, '2020-10-20 11:41:52', '1');
INSERT INTO `userans` VALUES ('2', '34', '16', '4', '3', 'q', null, '2020-10-20 11:41:52', '1');
INSERT INTO `userans` VALUES ('2', '34', '16', '1', '4', 'A11---D14---C13', null, '2020-10-20 11:41:52', '1');
INSERT INTO `userans` VALUES ('2', '34', '16', '3', '4', 'A13---C15', null, '2020-10-20 11:41:52', '1');
INSERT INTO `userans` VALUES ('2', '34', '16', '2', '5', '1', null, '2020-10-20 11:41:52', '1');
INSERT INTO `userans` VALUES ('2', '34', '16', '4', '5', '0', null, '2020-10-20 11:41:52', '1');

-- ----------------------------
-- Table structure for useranss
-- ----------------------------
DROP TABLE IF EXISTS `useranss`;
CREATE TABLE `useranss` (
  `id` int(111) NOT NULL,
  `userid` int(11) NOT NULL,
  `exid` int(11) NOT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `finishtime` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useranss
-- ----------------------------
INSERT INTO `useranss` VALUES ('1', '34', '16', '', '2020-10-20 11:39:21', '1');
INSERT INTO `useranss` VALUES ('2', '34', '16', '', '2020-10-20 11:41:52', '1');
