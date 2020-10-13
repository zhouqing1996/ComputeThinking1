/*
Navicat MySQL Data Transfer

Source Server         : 可视化教学设计
Source Server Version : 50637
Source Host           : 139.224.54.245:3306
Source Database       : ctts

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2020-10-13 22:03:37
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
INSERT INTO `fillq` VALUES ('3', '华师在哪一个省？', '湖北省', '地理', '知识点1', '1');
INSERT INTO `fillq` VALUES ('4', '题目2', '答案2', '', '知识点2', '1');
INSERT INTO `fillq` VALUES ('5', '题目3', '答案3', '', '知识点3', '0');
INSERT INTO `fillq` VALUES ('6', '题目4', '答案4', '', '知识点4', '1');
INSERT INTO `fillq` VALUES ('7', '题目5', '答案5', '', '知识点5', '1');
INSERT INTO `fillq` VALUES ('8', '题目6', '答案6', '', '知识点6', '1');
INSERT INTO `fillq` VALUES ('9', '题目7', '答案7', '', '知识点7', '1');
INSERT INTO `fillq` VALUES ('10', '题目8', '答案8', '', '知识点8', '0');
INSERT INTO `fillq` VALUES ('11', '题目9', '9', '', '知识点9', '1');
INSERT INTO `fillq` VALUES ('12', '题目10', '答案10', '', '知识点10', '1');
INSERT INTO `fillq` VALUES ('13', '题目11', '答案11', '', '知识点11', '1');
INSERT INTO `fillq` VALUES ('14', '题目12', '答案12', '', '知识点12', '1');
INSERT INTO `fillq` VALUES ('15', '题目13', '答案13', '', '知识点13', '1');
INSERT INTO `fillq` VALUES ('16', '题目14', '答案14', '', '知识点14', '1');
INSERT INTO `fillq` VALUES ('17', '题目15', '答案15', '', '知识点15', '1');
INSERT INTO `fillq` VALUES ('18', '题目16', '答案16', '', '知识点16', '1');
INSERT INTO `fillq` VALUES ('19', '题目17', '答案17', '', '知识点17', '1');
INSERT INTO `fillq` VALUES ('20', '题目18', '答案18', '', '知识点18', '1');
INSERT INTO `fillq` VALUES ('21', '题目19', '答案19', '', '知识点19', '1');

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
INSERT INTO `programq` VALUES ('2', 'A2', '背景2', '描述2', '输入2', '输出2', '样例2', '说明2', '1', '标签2', '推荐2', '答案2', '1');
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
INSERT INTO `user` VALUES ('1', 'root', 'oVhWN09Yhh9ApR5z8x5PSo17IbM2TqK_', 'eASjeAQVRCYhuvAQ1O5NwjAwOWU3YTZhNTVjNTY4ZThlZTgzMjRiMmRlYTY2MzMzMmVjZTllMTM2OTg0YTBlODNjNGJkMTA0NmIyODkyNWQcZdRsORm1vx4/QdY534ZtA4skulJ7QL+42NzGfbtxbQ==', '1', '1');
INSERT INTO `user` VALUES ('3', 'zzz', 'YNH_mjl-1IWVk51mO0nJ-_JAclIQvh1I', 'hCE9bP6ssuVUvQ2GT87WWDI4NDExMzc5MzVmNGM2ZjMyNGI3NTFiMWU3YTc2MWExNmMwMjUyYmY4ZDZkMDUzMWY3OWFhNGE2ODNjNTBlNmbWr45ZfRv49u4cztKPMTjvexf7SDIeRyqXU2lcLc7NqA==', '3', '1');
INSERT INTO `user` VALUES ('4', 'zhouqing', 'y5dxjFIExmljkVfgFUydjTlPd9Q0ovJW', 'gli8MyBwcC9wowo1sS1M5zEzNzk4MGIwZDM4N2VkMTk4MTRhYzgyMDBlNjIwMDI1YTMxMDQxNTI4OTExMDJlMDYzYjVkM2Y4ODdkMzA1MTKIf6TDzI4hUCd8z4rD1Zd6Ix5gM3SbnS8XEMZuHaZmSg==', '2', '1');
INSERT INTO `user` VALUES ('5', 'feng', 'Umor2p9AgYRdZ8Qd42egwf5Xe_Mvg05y', 'zIUkBt6kz5HMafywT8/+ZDY1NDlmNzYwZDFiMThjNDVlOTU2NmIxNzU0MGM3NjQ0ZmZhYjk5ZGYyZDBkZDlhNjAzODcyN2JkZmI2M2FkZDKKv2tZ3T0d5id6qN1IHjj9A1tMKlqUib6ru+DHKNUgfw==', '1', '1');
INSERT INTO `user` VALUES ('6', '杨冰', '8MhKUlr0FD1rkrFvhOX44DP8QGMojgDk', 'UQWhxB372dHMqNL9qyQRXWZjYWExNjA5ODgwOWI0NGRlMGY4M2Q4OGFhNTQ2N2I4YTBiZmVmZTg5YjE0MGJhZWQ5ZmFhZWFmMTk5OGI1OGEceHEshMETk+1Tveu+2FB9sxlR1f+cggDosVUXRhMJ5Q==', '1', '1');
INSERT INTO `user` VALUES ('7', 'zhouq', null, '123456', '3', '0');
INSERT INTO `user` VALUES ('8', '周青', null, '123456', '3', '1');
INSERT INTO `user` VALUES ('9', '周青1', null, '123456', '3', '1');
INSERT INTO `user` VALUES ('10', '施雨', null, '123456', '3', '0');
INSERT INTO `user` VALUES ('12', 'cxx', 'imhsM0izxEMet91pZxG8R4nfgW8eUG9L', 'rf5AvNNKCmbIvXbnzjs8JzU2ZGNjODM0ZGUzMDNkZTU4ODE2ZjY0ZWUxOWNkNjI3ZGQ4OWYwOTNiMjEyYjA5MjllOTRiNTRiYzljOTM5NTIXcmFfrYwz577/rVo81CIX1kwBaulC/8ylgCwvOl7Rtg==', '1', '1');
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
INSERT INTO `user` VALUES ('34', 'root2', '', 'S8RkaSLAd2W+uHfY5jSK+zljNzJjYmI0ZGUwM2VhMmY0OGMwOTliYjgxOWM3ZmExNmY1ZDE0MWNiZmZmMTE4OGI4ZWM0ZTQ4MDliZGNjZTNdLWGLmPyfp9JaBzlQpCNSfYGe05yzWiO/s+Yjth+IdQ==', '3', '1');

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
