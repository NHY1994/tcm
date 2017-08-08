/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : tcm

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-08-08 22:02:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for relation
_case
-- ----------------------------
DROP TABLE IF EXISTS `relation
_case`;
CREATE TABLE `relation
_case` (
  `id` int(11) DEFAULT NULL,
  `parent` varchar(20) DEFAULT NULL,
  `children` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation
_case
-- ----------------------------

-- ----------------------------
-- Table structure for test_case_source
-- ----------------------------
DROP TABLE IF EXISTS `test_case_source`;
CREATE TABLE `test_case_source` (
  `id` int(11) DEFAULT NULL COMMENT '用例编号id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(1) DEFAULT NULL COMMENT '用例状态 1为正常，2为删除',
  `descript` varchar(255) DEFAULT NULL COMMENT '用例描述',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建者',
  `test_module` varchar(20) DEFAULT NULL COMMENT '测试模块',
  `level` varchar(1) DEFAULT NULL COMMENT '用例等级',
  `test_guidance` varchar(255) DEFAULT NULL COMMENT '测试指导',
  `precondition` varchar(255) DEFAULT NULL COMMENT '预置条件',
  `test_project` varchar(20) DEFAULT NULL COMMENT '测试项目',
  `test_step` varchar(255) DEFAULT NULL COMMENT '测试步骤',
  `expected_results` varchar(255) DEFAULT NULL COMMENT '预期结果',
  `Attachment` varchar(255) DEFAULT NULL COMMENT '附件，保存路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_case_source
-- ----------------------------
INSERT INTO `test_case_source` VALUES ('1', '2017-07-29 01:09:55', '1', '', 'nihongyan', '', '1', '', '', '', '', '', 'c://fujian/1.txt');
INSERT INTO `test_case_source` VALUES ('1', '2017-07-30 12:47:39', '1', '', 'nihongyan', '', '1', '', '', '', '', '', 'c://fujian/1.txt');

-- ----------------------------
-- Table structure for test_case_source_implement
-- ----------------------------
DROP TABLE IF EXISTS `test_case_source_implement`;
CREATE TABLE `test_case_source_implement` (
  `plan_number` int(11) NOT NULL COMMENT '测试计划编号',
  `id` int(11) DEFAULT NULL COMMENT '用例编号id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `descript` varchar(255) DEFAULT NULL COMMENT '用例描述',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建者',
  `test_module` varchar(20) DEFAULT NULL COMMENT '测试模块',
  `level` varchar(1) DEFAULT NULL COMMENT '用例等级',
  `test_guidance` varchar(255) DEFAULT NULL COMMENT '测试指导',
  `precondition` varchar(255) DEFAULT NULL COMMENT '预置条件',
  `test_project` varchar(20) DEFAULT NULL COMMENT '测试项目',
  `test_step` varchar(255) DEFAULT NULL COMMENT '测试步骤',
  `expected_results` varchar(255) DEFAULT NULL COMMENT '预期结果',
  `actual_result` varchar(255) DEFAULT NULL COMMENT '实测结果',
  `attachment` varchar(255) DEFAULT NULL COMMENT '附件，保存路径',
  `test_attachment` varchar(255) DEFAULT NULL COMMENT '测试附件，测试人员上传的',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` varchar(1) DEFAULT NULL COMMENT '用例执行状态，1pass，2Fail，3Block。4NA',
  `implement_user` varchar(20) DEFAULT NULL COMMENT '用例执行者',
  `implement_time` datetime DEFAULT NULL COMMENT '用例执行时间',
  PRIMARY KEY (`plan_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_case_source_implement
-- ----------------------------
INSERT INTO `test_case_source_implement` VALUES ('1', '1', '2017-07-02 19:55:22', null, null, null, '1', '测试指导', '预置条件', 'lopscoop', '1、打开登录界面', '1、正常打开界面', null, null, null, null, null, null, '2017-07-02 19:56:49');
INSERT INTO `test_case_source_implement` VALUES ('2', '12', '2017-07-02 19:55:22', '', '', '', '2', '测试指导2', '预置条件2', 'lopscoop2', '1、打开登录界面2', '1、正常打开界面2', '', '', '', '', '', '', '2017-07-02 19:56:17');

-- ----------------------------
-- Table structure for test_plan
-- ----------------------------
DROP TABLE IF EXISTS `test_plan`;
CREATE TABLE `test_plan` (
  `id` int(20) DEFAULT NULL COMMENT '测试计划编号',
  `project` varchar(20) DEFAULT NULL COMMENT '测试项目名称',
  `star_time` datetime DEFAULT NULL COMMENT '计划开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '计划结束时间',
  `status` int(11) DEFAULT NULL COMMENT '计划状态，1创建，2执行中，3结束'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_plan
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `psd` varchar(255) DEFAULT NULL,
  `reg_time` datetime DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `role` varchar(1) DEFAULT NULL,
  `reg_ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('001', 'nihongyan', '123456', '2017-06-18 17:30:55', '2017-06-18 17:30:59', '', null, null);
