/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : jobrecord

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-02-16 22:52:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `post` varchar(50) DEFAULT NULL,
  `starttime` varchar(255) DEFAULT NULL COMMENT '网申开始时间',
  `endtime` varchar(255) DEFAULT '/' COMMENT '网申结束时间',
  `status` varchar(50) DEFAULT '未网申',
  `requirement` varchar(500) DEFAULT '无',
  `remark` varchar(500) DEFAULT '无',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('2', '科大讯飞', 'http://www.hotjob.cn/wt/iflytek/web/index/campus', '软件开发工程师/正式', '2018-02-01', '0000-00-00', '已投简历', '1、参与软件产品项目设计，能够根据软件的需求完成架构和功能的设计 \r\n2、学习整合并优化项目开发所需各种资源，最终编写开发文档 \r\n3、逐步负责软件开发技术和规范及标准流程的改进 \r\n4、根据开发进度和任务分配，完成后台、客户端、web前端、测试开发等相关方向的算法设计、开发、编程任务', '3.17华工大学城宣讲会');
INSERT INTO `company` VALUES ('9', '一加(深圳市万普拉斯科技有限公司)', 'https://xiaoyuan.zhaopin.com/job/CC000130761J90000045000', '后端开发工程师 Java(深圳)', '', '/', '已投简历', '职位描述：\r\n1、根据产品需求以及技术分析设计文档，实现业务系统编码和自测工作，完成既定的工作任务；\r\n2、深入理解业务产品以及技术设计，协助整理技术分析设计文档；\r\n3、负责解决系统线上故障，负责优化业务和系统问题。\r\n\r\n任职要求：\r\n1、本科及以上学历，计算机相关专业；\r\n2、基础扎实，有独立完成过开发项目或实习经验；\r\n3、思路清晰，工作用心，诚实敬业，有较强的团队协作精神和责任心；\r\n4、热爱编程，乐于学习新的软件方法和技术，勇于面对挑战，能承受压力；\r\n5、英语具备日常沟通能力，CET-6优先。', '智联校招 深圳-福田区');
INSERT INTO `company` VALUES ('13', '有为信息', 'hr@yuweitek.com', 'JAVA开发工程师', '已经开始', '/', '已投简历', '1.本科以上学历，计算机软件,网络工程等相关专业；\r\n2.英语四级以上，具备良好的外文文献阅读和翻译能力；\r\n3.了解常用数据库及开发模式，java开发语言等，并有一定的独立编程能力；\r\n4.语言表达清晰，能勤奋刻苦，踏实工作，能承受一定的工作压力；', '深圳福田区');
INSERT INTO `company` VALUES ('15', 'TP-Link', 'https://xiaoyuan.zhaopin.com/job/CC000140409J90000077000', '软件工程师(后端开发方向)', '已经开始', '/', '已投简历', '1.	使用Java语言，进行云端业务逻辑开发。\r\n2.	学习掌握设计规范，开发高容量、高并发的服务器业务，挑战性能优化极限。\r\n3.	进行数据库的设计与开发工作。', '深圳 智联');
INSERT INTO `company` VALUES ('16', '搜狐', 'wenqilu@sohu-inc.com', 'Java后台开发工程师', '/', '/', '已投简历', '/', '/');
INSERT INTO `company` VALUES ('17', '4399', 'https://hr.4399om.com/main/?r=userCenter/index', 'Web后端开发工程师', '/', '/', '已投简历', '1）计算机或计算机相关专业，本科及以上学历；\r\n2）扎实的编程语言基础，掌握常见的数据结构和算法，对操作系统、数据库等有较好的基础；\r\n3）对面向对象思想有深入的理解，有良好的编程习惯；\r\n4）具备优秀的逻辑思维能力，对解决挑战性问题充满热情，善于解决问题和分析问题；\r\n5）较好的沟通和团队协作能力，较强的学习能力和快速解决问题的能力。', '');
