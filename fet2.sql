/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost
 Source Database       : fet2

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : utf-8

 Date: 08/17/2017 22:52:00 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `false`
-- ----------------------------
DROP TABLE IF EXISTS `false`;
CREATE TABLE `false` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_account_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_account_record`;
CREATE TABLE `t_account_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) DEFAULT NULL COMMENT '发生资金流动的账户ID',
  `reason` int(4) DEFAULT NULL COMMENT '资金变动原因',
  `amount` decimal(10,0) DEFAULT NULL COMMENT '金额',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注说明',
  `operat_type` int(4) DEFAULT NULL,
  `operat_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_17` (`account_id`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`account_id`) REFERENCES `t_sys_agent_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='佣金金记录表，用于记录经纪人的佣金金流动状况，和账户表关联，不与用户表关联';

-- ----------------------------
--  Records of `t_account_record`
-- ----------------------------
BEGIN;
INSERT INTO `t_account_record` VALUES ('1', '1', '0', '1439', '经纪人注册送红包', '2', '2016-06-22 21:10:11'), ('2', '-1', '1', '0', '经纪人注册红包', '2', '2016-06-22 21:10:12'), ('3', '1', '0', '1439', '经纪人红包结佣申请', '2', '2016-06-22 21:10:12'), ('4', '3', '0', '1861', '经纪人注册送红包', '2', '2016-06-23 11:07:19'), ('5', '-1', '1', '0', '经纪人注册红包', '2', '2016-06-23 11:07:19'), ('6', '3', '0', '1861', '经纪人红包结佣申请', '2', '2016-06-23 11:07:19'), ('7', '4', '0', '1478', '经纪人注册送红包', '2', '2016-06-23 11:18:32'), ('8', '-1', '1', '0', '经纪人注册红包', '2', '2016-06-23 11:18:32'), ('9', '4', '0', '1478', '经纪人红包结佣申请', '2', '2016-06-23 11:18:32'), ('10', '5', '0', '2236', '经纪人注册送红包', '2', '2016-06-23 11:24:04'), ('11', '-1', '1', '0', '经纪人注册红包', '2', '2016-06-23 11:24:04'), ('12', '5', '0', '2236', '经纪人红包结佣申请', '2', '2016-06-23 11:24:05'), ('13', '6', '0', '1805', '经纪人注册送红包', '2', '2016-06-23 13:57:42'), ('14', '-1', '1', '0', '经纪人注册红包', '2', '2016-06-23 13:57:42'), ('15', '6', '0', '1805', '经纪人红包结佣申请', '2', '2016-06-23 13:57:42');
COMMIT;

-- ----------------------------
--  Table structure for `t_agent_application`
-- ----------------------------
DROP TABLE IF EXISTS `t_agent_application`;
CREATE TABLE `t_agent_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `agent_id` int(11) DEFAULT NULL COMMENT '经纪人ID',
  `real_name` varchar(200) DEFAULT NULL COMMENT '真实姓名',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `id_card` varchar(200) DEFAULT NULL COMMENT '身份证件号',
  `file_id` int(11) DEFAULT NULL COMMENT '文件ID',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_29` (`agent_id`),
  CONSTRAINT `FK_Reference_29` FOREIGN KEY (`agent_id`) REFERENCES `t_agent_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储经纪人审核信息';

-- ----------------------------
--  Table structure for `t_agent_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_agent_user`;
CREATE TABLE `t_agent_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `refer_id` int(11) DEFAULT NULL COMMENT '推荐人AGENT_ID',
  `refer_number` varchar(255) DEFAULT NULL COMMENT '推荐人手机号',
  `account_id` int(11) DEFAULT NULL COMMENT '账户表ID',
  `real_name_validate` int(11) DEFAULT '0' COMMENT '普通或专业认证标示',
  `phone_decimal` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `idt_num` varchar(50) DEFAULT NULL COMMENT '身份证号码',
  `idt_fileid` int(11) DEFAULT NULL COMMENT '身份证件图片的ID',
  `card_fileid` int(11) DEFAULT NULL COMMENT '名片图片ID',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '开户银行名称',
  `company` varchar(100) DEFAULT NULL COMMENT '所属公司',
  `wechat_id` varchar(50) DEFAULT NULL COMMENT '微信OPEN_ID',
  `work_area` varchar(255) DEFAULT NULL COMMENT '工作区域',
  `work_space` varchar(255) DEFAULT NULL COMMENT '所属门店或楼盘',
  `customer_count` decimal(10,0) DEFAULT '0' COMMENT '推荐客户数',
  `customer_newmessage` decimal(10,0) DEFAULT '0' COMMENT '客户新消息数',
  `refer_count` decimal(10,0) DEFAULT '0' COMMENT '推荐经纪人数',
  `money_total` decimal(10,0) DEFAULT '0' COMMENT '佣金总额',
  `user_id` int(11) DEFAULT NULL COMMENT '系统用户表ID',
  `auto_login` int(11) DEFAULT '0' COMMENT '是否自动登录 0 否 1 是',
  `check_remark` varchar(255) DEFAULT NULL COMMENT '审核备注',
  `arrived_count` decimal(10,0) DEFAULT '0' COMMENT '到访数',
  `sign_count` varchar(255) DEFAULT '0' COMMENT '签约数',
  `deal_time` datetime DEFAULT NULL COMMENT '最后交互时间',
  `deal_content` varchar(255) DEFAULT NULL COMMENT '最后处理备注',
  `agent_person` varchar(255) DEFAULT NULL COMMENT '经纪人维护人',
  `person_phone` varchar(255) DEFAULT NULL COMMENT '维护人号码',
  `next_time` datetime DEFAULT NULL COMMENT '下次回访时间',
  `agent_group` varchar(255) DEFAULT NULL COMMENT '经纪人分组',
  `source` int(11) DEFAULT NULL COMMENT '1自主注册 2推荐注册 3先下推广 4其他方式',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_15` (`account_id`),
  KEY `FK_Reference_24` (`refer_id`),
  KEY `FK_t_agent_user` (`user_id`),
  CONSTRAINT `FK_t_agent_user` FOREIGN KEY (`user_id`) REFERENCES `t_sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储经纪人信息';

-- ----------------------------
--  Table structure for `t_area`
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `area_name` varchar(100) DEFAULT NULL COMMENT '省份名称',
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='表';

-- ----------------------------
--  Records of `t_area`
-- ----------------------------
BEGIN;
INSERT INTO `t_area` VALUES ('1', '玄武区', '1'), ('2', '鼓楼区', '1'), ('3', '浦口区', '1'), ('13', '建邺区', '1'), ('14', '江宁区', '1'), ('15', '新区', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_call_team`
-- ----------------------------
DROP TABLE IF EXISTS `t_call_team`;
CREATE TABLE `t_call_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `team_name` varchar(50) DEFAULT NULL COMMENT '登录名',
  `lead_id` int(11) DEFAULT NULL COMMENT '组长ID',
  `team_count` int(11) DEFAULT '0' COMMENT '成员人数',
  `team_type` int(11) DEFAULT NULL COMMENT '团队类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_14` (`lead_id`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`lead_id`) REFERENCES `t_sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='存储CALL客团队信息';

-- ----------------------------
--  Records of `t_call_team`
-- ----------------------------
BEGIN;
INSERT INTO `t_call_team` VALUES ('1', '团队A', '2', '0', '1', null, '2015-05-20 11:04:35');
COMMIT;

-- ----------------------------
--  Table structure for `t_call_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_call_user`;
CREATE TABLE `t_call_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `team_id` int(11) DEFAULT NULL COMMENT '团队ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `customer_decimal` int(11) DEFAULT '0' COMMENT '待处理客户数',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_11` (`team_id`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`team_id`) REFERENCES `t_call_team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储call客信息';

-- ----------------------------
--  Table structure for `t_cash_application`
-- ----------------------------
DROP TABLE IF EXISTS `t_cash_application`;
CREATE TABLE `t_cash_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) DEFAULT NULL,
  `amount_money` decimal(10,0) DEFAULT NULL,
  `final_money` decimal(10,0) DEFAULT NULL,
  `application_time` datetime DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `operater_id` int(11) DEFAULT NULL,
  `result_status` int(11) DEFAULT NULL,
  `money_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_19` (`account_id`),
  KEY `FK_Reference_23` (`operater_id`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`account_id`) REFERENCES `t_sys_agent_account` (`id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`operater_id`) REFERENCES `t_sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现申请表';

-- ----------------------------
--  Table structure for `t_cash_balance`
-- ----------------------------
DROP TABLE IF EXISTS `t_cash_balance`;
CREATE TABLE `t_cash_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) DEFAULT NULL,
  `amount_money` decimal(10,0) DEFAULT NULL,
  `final_money` decimal(10,0) DEFAULT NULL,
  `application_time` date DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `operater_id` int(11) DEFAULT NULL,
  `application_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_20` (`application_id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`application_id`) REFERENCES `t_cash_application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现结算表';

-- ----------------------------
--  Table structure for `t_cash_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_cash_detail`;
CREATE TABLE `t_cash_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `application_id` int(11) DEFAULT NULL,
  `result` varchar(500) DEFAULT NULL,
  `operater_id` int(11) DEFAULT NULL,
  `operater_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_28` (`application_id`),
  CONSTRAINT `FK_Reference_28` FOREIGN KEY (`application_id`) REFERENCES `t_cash_application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现流水';

-- ----------------------------
--  Table structure for `t_city`
-- ----------------------------
DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `city_name` varchar(100) DEFAULT NULL COMMENT '城市名称',
  `province_id` int(11) DEFAULT NULL COMMENT '所属省份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='城市表';

-- ----------------------------
--  Records of `t_city`
-- ----------------------------
BEGIN;
INSERT INTO `t_city` VALUES ('1', '南京分公司', '1'), ('21', '常州分公司', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_name` varchar(500) DEFAULT NULL COMMENT '分组名称',
  `group_key` varchar(100) DEFAULT NULL COMMENT '分组KEY',
  `config_name` varchar(500) DEFAULT NULL,
  `config_key` varchar(500) DEFAULT NULL COMMENT '配置项KEY',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='配置动态参数表';

-- ----------------------------
--  Records of `t_config`
-- ----------------------------
BEGIN;
INSERT INTO `t_config` VALUES ('1', '红包最大金额', 'RED_MAX', '最大金额', '3003'), ('2', '红包最低金额', 'RED_MIN', '最低金额', '1000'), ('3', '红包活动开关', 'OPEN_STATUS', '开关状态', '1'), ('4', '账户操作类型', 'OPERATOR_TYPE', '可提现佣金', '1'), ('5', '账户操作类型', 'OPERATOR_TYPE', '可结佣金', '2'), ('6', '账户操作类型', 'OPERATOR_TYPE', '已结佣金', '3'), ('7', '账户操作类型', 'OPERATOR_TYPE', '待审佣金', '4'), ('8', '推荐人红包金额', 'RED_REFER', '推荐人红包金额', '50'), ('9', '专业经纪人冷冻期', 'FROZEN_PER', '专业经纪人冷冻期', '0'), ('10', '普通经纪人冷冻期', 'FROZEN_ORD', '普通经纪人冷冻期', '0'), ('11', '每日经纪人推荐客户数', 'COUNT_MAX', '每日推荐数', '10'), ('12', '用户级别', 'USER_LEVEL', '管理员', '1'), ('13', '用户级别', 'USER_LEVEL', '省级', '11'), ('14', '用户级别', 'USER_LEVEL', '市级', '12'), ('15', '用户级别', 'USER_LEVEL', '公司', '13');
COMMIT;

-- ----------------------------
--  Table structure for `t_customer_application`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_application`;
CREATE TABLE `t_customer_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `house_id` int(11) DEFAULT NULL COMMENT '项目Id',
  `area_id` int(11) DEFAULT NULL COMMENT '区域Id',
  `customer_name` varchar(50) DEFAULT NULL COMMENT '客户姓名',
  `customer_decimal` varchar(50) DEFAULT NULL COMMENT '客户手机号码',
  `sex` decimal(10,0) DEFAULT NULL COMMENT '性别',
  `customer_level` int(11) DEFAULT NULL COMMENT '客户等级ID',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注信息',
  `agent_id` int(11) DEFAULT NULL COMMENT '经纪人ID',
  `customer_status` int(11) DEFAULT NULL COMMENT '客户状态',
  `refer_time` datetime DEFAULT NULL COMMENT '推荐时间',
  `effect_type` int(11) DEFAULT '1' COMMENT '有效性',
  `appeal_status` int(11) DEFAULT '0' COMMENT '申诉状态',
  `appeal_msg` varchar(2000) DEFAULT NULL COMMENT '申诉内容',
  `press_status` int(11) DEFAULT '0' COMMENT '催办状态',
  `read_status` int(11) DEFAULT '0' COMMENT '阅读状态 0：未阅读 1：已阅读',
  `house_count` int(11) DEFAULT '1' COMMENT '数量',
  `house_price` decimal(10,0) DEFAULT NULL COMMENT '佣金单价',
  `follow_time` datetime DEFAULT NULL COMMENT '最后跟进时间',
  `next_time` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `refer_area` int(11) DEFAULT '0' COMMENT '推荐到该区域',
  `self_send` int(11) DEFAULT '0' COMMENT '亲自邀约',
  `self_look` int(11) DEFAULT '0' COMMENT '亲自带看',
  `batch_id` int(11) DEFAULT NULL COMMENT '批次编号',
  `money_status` int(11) DEFAULT '0' COMMENT '申请结佣奖状态',
  `arrived_status` int(11) DEFAULT '0' COMMENT '申请到访奖状态',
  `look_status` int(11) DEFAULT '0' COMMENT '申请带看奖状态',
  `duty_id` int(11) DEFAULT NULL COMMENT '最新负责处理人ID',
  `consultant_name` varchar(255) DEFAULT NULL COMMENT '置业顾问名称',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_22` (`house_id`),
  KEY `FK_Reference_26` (`customer_level`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`house_id`) REFERENCES `t_houses_project` (`id`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`customer_level`) REFERENCES `t_customer_level` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户推荐表，记录初次经纪人推荐的客户信息';

-- ----------------------------
--  Table structure for `t_customer_choice`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_choice`;
CREATE TABLE `t_customer_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rule_id` int(11) DEFAULT NULL,
  `choice_name` varchar(500) DEFAULT NULL,
  `choice_content` varchar(500) DEFAULT NULL,
  `choice_score` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_12` (`rule_id`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`rule_id`) REFERENCES `t_customer_rule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='配置客户等级选项';

-- ----------------------------
--  Records of `t_customer_choice`
-- ----------------------------
BEGIN;
INSERT INTO `t_customer_choice` VALUES ('3', '2', '两室一厅', '两室一厅', '5'), ('4', '2', '三室一厅', '三室一厅', '10'), ('5', '2', '三室以上', '三室以上', '15'), ('6', '3', '新购房', '新购房', '5'), ('7', '3', '改善型住房', '改善型住房', '10'), ('8', '3', '其他', '其他', '15'), ('9', '4', '10万元', '10万元', '5'), ('10', '4', '20万元', '20万元', '10'), ('11', '4', '30万元', '30万元', '15'), ('12', '5', '两室一厅', '两室一厅', '5'), ('13', '5', '三室一厅', '三室一厅', '10'), ('14', '5', '三室以上', '三室以上', '15'), ('15', '6', '新购房', '新购房', '5'), ('16', '6', '改善型住房', '改善型住房', '10'), ('17', '6', '其他', '其他', '15'), ('18', '7', '40万元', '40万元', '5'), ('19', '7', '50万元', '50万元', '10'), ('20', '7', '60万元', '60万元', '15');
COMMIT;

-- ----------------------------
--  Table structure for `t_customer_level`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_level`;
CREATE TABLE `t_customer_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `level_name` varchar(500) DEFAULT NULL COMMENT '等级名称',
  `level_score` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='配置客户等级';

-- ----------------------------
--  Records of `t_customer_level`
-- ----------------------------
BEGIN;
INSERT INTO `t_customer_level` VALUES ('1', 'A类', '100'), ('2', 'B类', '50'), ('3', 'C类', '25'), ('4', 'D楼', '50'), ('5', 'E类', '75');
COMMIT;

-- ----------------------------
--  Table structure for `t_customer_money`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_money`;
CREATE TABLE `t_customer_money` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL COMMENT '客户申请表ID',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `amount` decimal(10,0) DEFAULT NULL COMMENT '奖励金额',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `money_type` int(11) DEFAULT NULL COMMENT '佣金类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `account_id` int(11) DEFAULT NULL COMMENT '账户ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='可结佣金清单表（除签约佣金外）';

-- ----------------------------
--  Records of `t_customer_money`
-- ----------------------------
BEGIN;
INSERT INTO `t_customer_money` VALUES ('1', null, null, null, null, null, null, '0', null), ('2', null, null, '1439', '经纪人注册送红包', '5', '2016-06-22 21:10:11', '1', '1'), ('3', null, null, '1861', '经纪人注册送红包', '5', '2016-06-23 11:07:19', '1', '3'), ('4', null, null, '1478', '经纪人注册送红包', '5', '2016-06-23 11:18:32', '1', '4'), ('5', null, null, '2236', '经纪人注册送红包', '5', '2016-06-23 11:24:04', '1', '5'), ('6', null, null, '1805', '经纪人注册送红包', '5', '2016-06-23 13:57:42', '1', '6');
COMMIT;

-- ----------------------------
--  Table structure for `t_customer_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_record`;
CREATE TABLE `t_customer_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_type` int(11) DEFAULT NULL,
  `operate_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `operate_content` varchar(2000) DEFAULT NULL COMMENT '操作内容',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `customer_referid` int(11) DEFAULT NULL,
  `message_type` int(11) DEFAULT '0' COMMENT '新消息标示',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_25` (`customer_referid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录处理用户的历史记录';

-- ----------------------------
--  Table structure for `t_customer_rule`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_rule`;
CREATE TABLE `t_customer_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rule_name` varchar(500) DEFAULT NULL COMMENT '规则名称',
  `rule_question` varchar(500) DEFAULT NULL,
  `rule_type` int(11) DEFAULT NULL COMMENT '1 :一手房 2：二手房',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='配置客户等级计算规则';

-- ----------------------------
--  Records of `t_customer_rule`
-- ----------------------------
BEGIN;
INSERT INTO `t_customer_rule` VALUES ('2', '购买户型1', '购买户型1', '1'), ('3', '购买户型2', '购买户型2', '1'), ('4', '预期总房款', '预期总房款', '1'), ('5', '购买户型3', '购买户型3', '2'), ('6', '购买户型4', '购买户型4', '2'), ('7', '预期总房款2', '预期总房款2', '2');
COMMIT;

-- ----------------------------
--  Table structure for `t_files`
-- ----------------------------
DROP TABLE IF EXISTS `t_files`;
CREATE TABLE `t_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(1000) DEFAULT NULL,
  `file_size` varchar(1000) DEFAULT NULL,
  `file_PATH` varchar(1000) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `LOGIC_STATUS` int(11) DEFAULT NULL,
  `file_type` int(11) DEFAULT NULL,
  `refer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COMMENT='存储图片路径';

-- ----------------------------
--  Records of `t_files`
-- ----------------------------
BEGIN;
INSERT INTO `t_files` VALUES ('68', '201608211033178364662.jpg', '147916771328', 'upload/201608211033178364662.jpg', '2016-08-21 10:33:17', null, '1', null), ('69', '201608211033214033450.jpg', '147916771328', 'upload/201608211033214033450.jpg', '2016-08-21 10:33:21', null, '1', null), ('70', '201608211033242758786.jpg', '147916771328', 'upload/201608211033242758786.jpg', '2016-08-21 10:33:24', null, '1', null), ('71', '201608211033276575444.jpg', '147916771328', 'upload/201608211033276575444.jpg', '2016-08-21 10:33:27', null, '1', null), ('72', '201608211035176595327.jpg', '147916771328', 'upload/201608211035176595327.jpg', '2016-08-21 10:35:17', null, '2', '3'), ('73', '201608211035199553347.jpg', '147916771328', 'upload/201608211035199553347.jpg', '2016-08-21 10:35:20', null, '2', '3'), ('74', '201608211035222777339.jpg', '147916771328', 'upload/201608211035222777339.jpg', '2016-08-21 10:35:22', null, '2', '3'), ('75', '201608211035243943516.jpg', '147916771328', 'upload/201608211035243943516.jpg', '2016-08-21 10:35:24', null, '2', '3'), ('76', '201608211042529924276.jpg', '147916771328', 'upload/201608211042529924276.jpg', '2016-08-21 10:42:53', null, '2', null), ('77', '201608211043117736782.jpg', '147916771328', 'upload/201608211043117736782.jpg', '2016-08-21 10:43:11', null, '2', null), ('78', '201608211117184784849.jpg', '147916771328', 'upload/201608211117184784849.jpg', '2016-08-21 11:17:18', null, '2', '3'), ('79', '20160821111722944969.jpg', '147916771328', 'upload/20160821111722944969.jpg', '2016-08-21 11:17:22', null, '2', '3'), ('80', '201608212106217065937.png', '147916771328', 'upload/201608212106217065937.png', '2016-08-21 21:06:22', null, '2', null), ('81', '201608212106243333629.png', '147916771328', 'upload/201608212106243333629.png', '2016-08-21 21:06:24', null, '2', null), ('82', '201608212106266975628.png', '147916771328', 'upload/201608212106266975628.png', '2016-08-21 21:06:26', null, '2', null), ('83', '201608212106305921476.png', '147916771328', 'upload/201608212106305921476.png', '2016-08-21 21:06:30', null, '2', null), ('84', '201608231553188524218.png', '147916771328', 'upload/201608231553188524218.png', '2016-08-23 15:53:19', null, '2', null), ('85', '201608241115598154393.xls', '147916771328', 'upload/201608241115598154393.xls', '2016-08-24 11:16:52', null, '99', null), ('86', '201608241527515786139.xls', '147916771328', 'upload/201608241527515786139.xls', '2016-08-24 15:27:52', null, '99', null), ('87', '201608241550539955777.xls', '147916771328', 'upload/201608241550539955777.xls', '2016-08-24 15:50:54', null, '99', null), ('88', '201608241551039581893.xls', '147916771328', 'upload/201608241551039581893.xls', '2016-08-24 15:51:04', null, '99', null), ('89', '201608241659182884526.xls', '147916771328', 'upload/201608241659182884526.xls', '2016-08-24 16:59:18', null, '88', null), ('90', '201608241701239466225.xls', '147916771328', 'upload/201608241701239466225.xls', '2016-08-24 17:01:24', null, '88', null), ('91', '201609021241051291769.png', '42947571712', 'upload/201609021241051291769.png', '2016-09-02 12:41:05', null, '2', null), ('92', '201609021242523961354.png', '42947571712', 'upload/201609021242523961354.png', '2016-09-02 12:42:52', null, '2', null), ('93', '201609021713597609821.png', '42947571712', 'upload/201609021713597609821.png', '2016-09-02 17:13:59', null, '2', '1'), ('94', '201609021715547319186.png', '42947571712', 'upload/201609021715547319186.png', '2016-09-02 17:15:54', null, '2', '2'), ('95', '20160902173324744204.png', '42947571712', 'upload/20160902173324744204.png', '2016-09-02 17:33:24', null, '2', null), ('96', '201609061131255853515.xls', '42947571712', 'upload/201609061131255853515.xls', '2016-09-06 11:31:25', null, '88', null), ('97', '201609061134205256946.png', '42947571712', 'upload/201609061134205256946.png', '2016-09-06 11:34:20', null, '2', '2'), ('98', '201609061134259631990.png', '42947571712', 'upload/201609061134259631990.png', '2016-09-06 11:34:26', null, '2', '2'), ('99', '201609061138041063127.xls', '42947571712', 'upload/201609061138041063127.xls', '2016-09-06 11:38:04', null, '99', null), ('100', '201609061157148746986.png', '42947571712', 'upload/201609061157148746986.png', '2016-09-06 11:57:14', null, '2', null), ('101', '201610171908381756999.png', '42947571712', 'upload/201610171908381756999.png', '2016-10-17 19:08:38', null, '2', null), ('102', '201610171908434257658.png', '42947571712', 'upload/201610171908434257658.png', '2016-10-17 19:08:43', null, '2', null), ('103', '201610171908564411993.png', '42947571712', 'upload/201610171908564411993.png', '2016-10-17 19:08:56', null, '2', null), ('104', '201610171909008321859.png', '42947571712', 'upload/201610171909008321859.png', '2016-10-17 19:09:00', null, '2', null), ('105', '201610171909043016656.png', '42947571712', 'upload/201610171909043016656.png', '2016-10-17 19:09:04', null, '2', null), ('106', '20161017190910981753.png', '42947571712', 'upload/20161017190910981753.png', '2016-10-17 19:09:10', null, '2', null), ('107', '201610171909164426465.png', '42947571712', 'upload/201610171909164426465.png', '2016-10-17 19:09:16', null, '2', null), ('108', '201610171909238649365.png', '42947571712', 'upload/201610171909238649365.png', '2016-10-17 19:09:23', null, '2', null), ('109', '201610171909312231478.png', '42947571712', 'upload/201610171909312231478.png', '2016-10-17 19:09:31', null, '2', null), ('110', '201610310911467604439.xls', '42947571712', 'upload/201610310911467604439.xls', '2016-10-31 09:11:47', null, '88', null), ('111', '20161031091224276648.xls', '42947571712', 'upload/20161031091224276648.xls', '2016-10-31 09:12:24', null, '88', null), ('112', '201610310912386529576.xls', '42947571712', 'upload/201610310912386529576.xls', '2016-10-31 09:12:38', null, '88', null), ('113', '20161031093119292274.png', '42947571712', 'upload/20161031093119292274.png', '2016-10-31 09:31:19', null, '2', '11'), ('114', '20161031094323711694.png', '42947571712', 'upload/20161031094323711694.png', '2016-10-31 09:43:23', null, '2', null), ('115', '201611081428275295547.xls', '42947571712', 'upload/201611081428275295547.xls', '2016-11-08 14:28:27', null, '88', null), ('116', '201611231419287688666.xls', '42947571712', 'upload/201611231419287688666.xls', '2016-11-23 14:19:28', null, '88', null), ('117', '201611231424339758238.xls', '42947571712', 'upload/201611231424339758238.xls', '2016-11-23 14:24:33', null, '88', null), ('118', '201611231424471478811.xls', '42947571712', 'upload/201611231424471478811.xls', '2016-11-23 14:24:47', null, '88', null), ('119', '201611231424555533303.xls', '42947571712', 'upload/201611231424555533303.xls', '2016-11-23 14:24:55', null, '88', null), ('120', '201611231427094935501.xls', '42947571712', 'upload/201611231427094935501.xls', '2016-11-23 14:27:09', null, '88', null), ('121', '201611231432501237996.xls', '42947571712', 'upload/201611231432501237996.xls', '2016-11-23 14:32:50', null, '88', null), ('122', '201611231434452197220.xls', '42947571712', 'upload/201611231434452197220.xls', '2016-11-23 14:34:45', null, '88', null), ('123', '201611231435202979277.xls', '42947571712', 'upload/201611231435202979277.xls', '2016-11-23 14:35:20', null, '88', null), ('124', '201611231603401873889.xls', '42947571712', 'upload/201611231603401873889.xls', '2016-11-23 16:03:40', null, '99', null), ('125', '20161123160432637239.png', '42947571712', 'upload/20161123160432637239.png', '2016-11-23 16:04:32', null, '2', '17'), ('126', '201611232136451202042.xls', '42947571712', 'upload/201611232136451202042.xls', '2016-11-23 21:36:46', null, '99', null), ('127', '201611232137006855841.xls', '42947571712', 'upload/201611232137006855841.xls', '2016-11-23 21:37:00', null, '88', null), ('128', '201611232137092655233.xls', '42947571712', 'upload/201611232137092655233.xls', '2016-11-23 21:37:09', null, '88', null), ('129', '201611232141275131336.xls', '42947571712', 'upload/201611232141275131336.xls', '2016-11-23 21:41:27', null, '99', null), ('130', '201611240920575039777.jpg', '42947571712', 'upload/201611240920575039777.jpg', '2016-11-24 09:20:57', null, '2', '18'), ('131', '20161124092506231533.jpg', '42947571712', 'upload/20161124092506231533.jpg', '2016-11-24 09:25:06', null, '2', '19'), ('132', '201611240939245057020.xls', '42947571712', 'upload/201611240939245057020.xls', '2016-11-24 09:39:24', null, '88', null), ('133', '201611240943127116884.jpg', '42947571712', 'upload/201611240943127116884.jpg', '2016-11-24 09:43:12', null, '2', '22'), ('134', '201612081537175457619.jpg', '42947571712', 'upload/201612081537175457619.jpg', '2016-12-08 15:37:17', null, '6', '5'), ('135', '201612110919325485764.png', '42947571712', 'upload/201612110919325485764.png', '2016-12-11 09:19:32', null, '6', '6'), ('136', '201612110919417999369.png', '42947571712', 'upload/201612110919417999369.png', '2016-12-11 09:19:41', null, '6', null), ('137', '201612110919539861168.png', '42947571712', 'upload/201612110919539861168.png', '2016-12-11 09:19:54', null, '6', '6'), ('138', '201612110924191153814.png', '42947571712', 'upload/201612110924191153814.png', '2016-12-11 09:24:19', null, '7', '6'), ('139', '201612110924238964198.png', '42947571712', 'upload/201612110924238964198.png', '2016-12-11 09:24:23', null, '7', '6'), ('140', '201612131033415726365.xls', '42947571712', 'upload/201612131033415726365.xls', '2016-12-13 10:33:42', null, '88', null), ('141', '201612131348474093421.xls', '42947571712', 'upload/201612131348474093421.xls', '2016-12-13 13:48:47', null, '99', null), ('142', '201612131420068271956.png', '42947571712', 'upload/201612131420068271956.png', '2016-12-13 14:20:06', null, '7', '8'), ('143', '201612131434412763203.png', '42947571712', 'upload/201612131434412763203.png', '2016-12-13 14:34:41', null, '2', null), ('144', '201612131446366469071.png', '42947571712', 'upload/201612131446366469071.png', '2016-12-13 14:46:36', null, '7', '9'), ('145', '20161214083812357325.xls', '42947571712', 'upload/20161214083812357325.xls', '2016-12-14 08:38:12', null, '99', null), ('146', '201612191041028042326.jpg', '42947571712', 'upload/201612191041028042326.jpg', '2016-12-19 10:41:02', null, '2', '23'), ('147', '201612191041202265038.jpg', '42947571712', 'upload/201612191041202265038.jpg', '2016-12-19 10:41:20', null, '2', '23'), ('148', '201612221722234546880.xls', '42947571712', 'upload/201612221722234546880.xls', '2016-12-22 17:22:23', null, '88', null), ('149', '20161222172329641174.xls', '42947571712', 'upload/20161222172329641174.xls', '2016-12-22 17:23:29', null, '88', null), ('150', '201612221724473625964.xls', '42947571712', 'upload/201612221724473625964.xls', '2016-12-22 17:24:47', null, '99', null), ('151', '201612221725199575766.jpg', '42947571712', 'upload/201612221725199575766.jpg', '2016-12-22 17:25:20', null, '2', '32'), ('152', '201612221730236647581.jpg', '42947571712', 'upload/201612221730236647581.jpg', '2016-12-22 17:30:23', null, '6', '8'), ('153', '201612221731588211653.jpg', '42947571712', 'upload/201612221731588211653.jpg', '2016-12-22 17:31:58', null, '6', '9'), ('154', '201612230737204805144.xls', '42947571712', 'upload/201612230737204805144.xls', '2016-12-23 07:37:20', null, '99', null), ('155', '201612230742476111473.jpg', '42947571712', 'upload/201612230742476111473.jpg', '2016-12-23 07:42:48', null, '7', '10'), ('156', '201702211550452377929.jpg', '42947571712', 'upload/201702211550452377929.jpg', '2017-02-21 15:50:45', null, '2', null), ('157', '201702221401356454254.jpg', '42947571712', 'upload/201702221401356454254.jpg', '2017-02-22 14:01:36', null, '2', null), ('158', '201702240927544358415.png', '42947571712', 'upload/201702240927544358415.png', '2017-02-24 09:27:54', null, '6', '24'), ('159', '201702240928117638692.jpg', '42947571712', 'upload/201702240928117638692.jpg', '2017-02-24 09:28:11', null, '6', '24'), ('160', '201702240929184517845.bmp', '42947571712', 'upload/201702240929184517845.bmp', '2017-02-24 09:29:18', null, '6', '24'), ('161', '201702241412095392212.JPG', '42947571712', 'upload/201702241412095392212.JPG', '2017-02-24 14:12:09', null, '2', null), ('162', '201702241416193877197.JPG', '42947571712', 'upload/201702241416193877197.JPG', '2017-02-24 14:16:19', null, '2', '45'), ('163', '201702271539449906828.xls', '42947571712', 'upload/201702271539449906828.xls', '2017-02-27 15:39:45', null, '88', null), ('164', '201702271551323601255.xls', '42947571712', 'upload/201702271551323601255.xls', '2017-02-27 15:51:32', null, '99', null), ('165', '20170313102531311092.jpg', '42947571712', 'upload/20170313102531311092.jpg', '2017-03-13 10:25:31', null, '2', null), ('166', '201703131026422516586.jpg', '42947571712', 'upload/201703131026422516586.jpg', '2017-03-13 10:26:42', null, '2', null), ('167', '201703131028201122320.bmp', '42947571712', 'upload/201703131028201122320.bmp', '2017-03-13 10:28:20', null, '2', '47'), ('168', '201703201400274796750.jpg', '42947571712', 'upload/201703201400274796750.jpg', '2017-03-20 14:00:27', null, '2', null), ('169', '201703201402141994922.png', '42947571712', 'upload/201703201402141994922.png', '2017-03-20 14:02:14', null, '2', null), ('170', '201703201405559991791.jpg', '42947571712', 'upload/201703201405559991791.jpg', '2017-03-20 14:05:56', null, '2', null), ('171', '201703201412112406350.xls', '42947571712', 'upload/201703201412112406350.xls', '2017-03-20 14:12:11', null, '88', null), ('172', '201703201412391781346.xls', '42947571712', 'upload/201703201412391781346.xls', '2017-03-20 14:12:39', null, '88', null), ('173', '201703201421438726528.png', '42947571712', 'upload/201703201421438726528.png', '2017-03-20 14:21:43', null, '6', '27'), ('174', '201703201421499031194.jpg', '42947571712', 'upload/201703201421499031194.jpg', '2017-03-20 14:21:50', null, '6', '27'), ('175', '201703201652318514726.png', '42947571712', 'upload/201703201652318514726.png', '2017-03-20 16:52:31', null, '2', null), ('176', '201703201654478694253.jpg', '42947571712', 'upload/201703201654478694253.jpg', '2017-03-20 16:54:47', null, '2', null), ('177', '201703201655162604985.jpg', '42947571712', 'upload/201703201655162604985.jpg', '2017-03-20 16:55:16', null, '2', null), ('178', '201703201656085264655.jpg', '42947571712', 'upload/201703201656085264655.jpg', '2017-03-20 16:56:08', null, '2', null), ('179', '201703201658325122388.jpg', '42947571712', 'upload/201703201658325122388.jpg', '2017-03-20 16:58:32', null, '2', null), ('180', '201703201658418561883.jpg', '42947571712', 'upload/201703201658418561883.jpg', '2017-03-20 16:58:41', null, '2', null), ('181', '201703201701054845246.jpg', '42947571712', 'upload/201703201701054845246.jpg', '2017-03-20 17:01:05', null, '2', null), ('182', '201703291533378794149.jpg', '42947571712', 'upload/201703291533378794149.jpg', '2017-03-29 15:33:38', null, '2', '49'), ('183', '20170329154722799646.jpg', '42947571712', 'upload/20170329154722799646.jpg', '2017-03-29 15:47:22', null, '2', null), ('184', '201703291557283076028.jpg', '42947571712', 'upload/201703291557283076028.jpg', '2017-03-29 15:57:28', null, '6', '29'), ('185', '201703291559482158589.xls', '42947571712', 'upload/201703291559482158589.xls', '2017-03-29 15:59:48', null, '99', null), ('186', '201703291559598877472.xls', '42947571712', 'upload/201703291559598877472.xls', '2017-03-29 15:59:59', null, '99', null), ('187', '201703291602376554720.xls', '42947571712', 'upload/201703291602376554720.xls', '2017-03-29 16:02:37', null, '99', null), ('188', '201703291602497181507.xls', '42947571712', 'upload/201703291602497181507.xls', '2017-03-29 16:02:49', null, '99', null), ('189', '201703291605321261270.xls', '42947571712', 'upload/201703291605321261270.xls', '2017-03-29 16:05:32', null, '88', null), ('190', '201703291605436106080.xls', '42947571712', 'upload/201703291605436106080.xls', '2017-03-29 16:05:43', null, '88', null), ('191', '201703291605585013824.xls', '42947571712', 'upload/201703291605585013824.xls', '2017-03-29 16:05:58', null, '88', null), ('192', '201703291606455183316.xls', '42947571712', 'upload/201703291606455183316.xls', '2017-03-29 16:06:45', null, '88', null), ('193', '201703291607055182358.xls', '42947571712', 'upload/201703291607055182358.xls', '2017-03-29 16:07:05', null, '88', null), ('194', '201703291607405497126.xls', '42947571712', 'upload/201703291607405497126.xls', '2017-03-29 16:07:40', null, '88', null), ('195', '201703291608112375794.xls', '42947571712', 'upload/201703291608112375794.xls', '2017-03-29 16:08:11', null, '88', null), ('196', '201703291611415848150.xls', '42947571712', 'upload/201703291611415848150.xls', '2017-03-29 16:11:41', null, '88', null), ('197', '201703291611515222119.xls', '42947571712', 'upload/201703291611515222119.xls', '2017-03-29 16:11:51', null, '88', null), ('198', '201703291611596005680.xls', '42947571712', 'upload/201703291611596005680.xls', '2017-03-29 16:11:59', null, '88', null), ('199', '201703291612064121156.xls', '42947571712', 'upload/201703291612064121156.xls', '2017-03-29 16:12:06', null, '88', null), ('200', '201703291612577885953.jpg', '42947571712', 'upload/201703291612577885953.jpg', '2017-03-29 16:12:58', null, '2', '48'), ('201', '201703291633322596804.xls', '42947571712', 'upload/201703291633322596804.xls', '2017-03-29 16:33:32', null, '88', null), ('202', '201703300852147841311.xls', '42947571712', 'upload/201703300852147841311.xls', '2017-03-30 08:52:15', null, '88', null), ('203', '201703300915282574307.xls', '42947571712', 'upload/201703300915282574307.xls', '2017-03-30 09:15:28', null, '88', null), ('204', '201703300915363983076.xls', '42947571712', 'upload/201703300915363983076.xls', '2017-03-30 09:15:36', null, '88', null), ('205', '201703300918456665779.xls', '42947571712', 'upload/201703300918456665779.xls', '2017-03-30 09:18:45', null, '88', null), ('206', '201703300934211808855.xls', '42947571712', 'upload/201703300934211808855.xls', '2017-03-30 09:34:21', null, '88', null), ('207', '201703300934299613281.xls', '42947571712', 'upload/201703300934299613281.xls', '2017-03-30 09:34:29', null, '88', null), ('208', '201703300941034822040.xls', '42947571712', 'upload/201703300941034822040.xls', '2017-03-30 09:41:03', null, '88', null), ('209', '201703300941182797554.xls', '42947571712', 'upload/201703300941182797554.xls', '2017-03-30 09:41:18', null, '88', null), ('210', '201703300943427658244.xls', '42947571712', 'upload/201703300943427658244.xls', '2017-03-30 09:43:42', null, '88', null), ('211', '201703300944044071988.xls', '42947571712', 'upload/201703300944044071988.xls', '2017-03-30 09:44:04', null, '88', null), ('212', '201703300944285488661.xls', '42947571712', 'upload/201703300944285488661.xls', '2017-03-30 09:44:28', null, '88', null), ('213', '201703300945468152145.xls', '42947571712', 'upload/201703300945468152145.xls', '2017-03-30 09:45:46', null, '88', null), ('214', '201703300945529714957.xls', '42947571712', 'upload/201703300945529714957.xls', '2017-03-30 09:45:52', null, '88', null), ('215', '201703300949513502991.xls', '42947571712', 'upload/201703300949513502991.xls', '2017-03-30 09:49:51', null, '88', null), ('216', '201703300950005856051.xls', '42947571712', 'upload/201703300950005856051.xls', '2017-03-30 09:50:00', null, '88', null), ('217', '201703300952578992514.xls', '42947571712', 'upload/201703300952578992514.xls', '2017-03-30 09:52:57', null, '88', null), ('218', '201703301706543543541.jpg', '42947571712', 'upload/201703301706543543541.jpg', '2017-03-30 17:06:54', null, '2', null), ('219', '201704261545466143687.jpg', '42947571712', 'upload/201704261545466143687.jpg', '2017-04-26 15:45:46', null, '2', '52'), ('220', '201704261546183803752.jpg', '42947571712', 'upload/201704261546183803752.jpg', '2017-04-26 15:46:18', null, '2', '53'), ('221', '201704261546241459154.jpg', '42947571712', 'upload/201704261546241459154.jpg', '2017-04-26 15:46:24', null, '2', '53'), ('222', '201704281029118292341.jpg', '42947571712', 'upload/201704281029118292341.jpg', '2017-04-28 10:29:11', null, '6', '30'), ('223', '201705021543099995769.jpg', '42947571712', 'upload/201705021543099995769.jpg', '2017-05-02 15:43:10', null, '2', '56');
COMMIT;

-- ----------------------------
--  Table structure for `t_floor_room`
-- ----------------------------
DROP TABLE IF EXISTS `t_floor_room`;
CREATE TABLE `t_floor_room` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `building_no` varchar(32) DEFAULT NULL COMMENT '楼号',
  `floor_no` varchar(32) DEFAULT NULL COMMENT '楼层号',
  `room_no` varchar(32) DEFAULT NULL COMMENT '楼层房间号',
  `room_name` varchar(255) DEFAULT NULL COMMENT '房间名',
  `room_type` varchar(32) DEFAULT NULL COMMENT '房间类型',
  `is_used` varchar(2) DEFAULT NULL COMMENT '是否入住',
  `room_code` varchar(255) DEFAULT NULL COMMENT '房间编号（楼号+层数+房间号）',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='楼层房间表';

-- ----------------------------
--  Records of `t_floor_room`
-- ----------------------------
BEGIN;
INSERT INTO `t_floor_room` VALUES ('1', '1', '2', '03', '测试房间1', '标准间', '0', '1203'), ('2', '1', '2', '02', '测试房间2', '单人间', '0', '1202'), ('3', '1', '2', '04', '22', '333', '0', '1204'), ('4', '1', '2', '01', '11', '11', '0', '1201'), ('5', '1', '2', '5', '123', '123', '0', '1205'), ('6', '1', '2', '4', '123', '123', '0', '1206'), ('7', '1', '2', '33', '123', '123', '0', '1207'), ('8', '1', '2', '44', '123', '123', '0', '1208'), ('9', '1', '2', '23', '13', '123', '0', '1209'), ('10', '1', '2', '3', '23', '23', '0', '1210'), ('11', '1', '2', '11', '11', '11', '0', '1211');
COMMIT;

-- ----------------------------
--  Table structure for `t_houses_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_config`;
CREATE TABLE `t_houses_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` int(11) DEFAULT NULL,
  `config_name` varchar(100) DEFAULT NULL,
  `config_title` varchar(500) DEFAULT NULL,
  `config_content` varchar(500) DEFAULT NULL,
  `pic_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_9` (`project_id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`project_id`) REFERENCES `t_houses_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='楼盘配套';

-- ----------------------------
--  Records of `t_houses_config`
-- ----------------------------
BEGIN;
INSERT INTO `t_houses_config` VALUES ('1', '3', '项目介绍', '东山核心、江宁门户、花园SOHO', '<p>东山国际滨河街区，位于上元大街，毗邻秦淮河，总建筑面积约6万㎡，低密度活力街区，首创“花园SOHO”鲜氧办公居住理念，以170间绿色、有氧、健康、舒适的稀缺商住空间，强势填补区域内花园式SOHO的市场空白，满足创新型办公的需求，引领东山商务生活的全面升级。</p>', null, '2015-05-31 11:28:48', '2015-05-31 11:28:48'), ('2', '3', '周边配套', '10分钟商务生活圈，繁华永不落幕', '东山国际滨河街区作用东山核心，东临万达，西接金轮，周边商务生活配套醇熟。其自身更是集花园SOHO、滨河商业街、星级商务酒店为一体，满足商住、投资、购物、餐饮、娱乐、社交、休闲需求，足不出户，繁华生活俯拾即是。 ', null, null, null), ('3', '3', '交通配置', '10分钟商务生活圈，繁华永不落幕', '自驾路线-内环东线一路畅通直到卡子门大街高架，直行至双龙大道，河定桥后第一个岔路口，沿上元大街过东山桥，第一个岔路口至滨河路即可到达。公交路线：701、703、821、东井线、区2、区12等多条线路至武夷花园站即可到达。地铁路线：地铁1号线南延线至河定桥站，步行10分钟即可到达。', null, null, null), ('4', '3', '户型鉴赏2', '远离城市的喧嚣，尽享静谧人生2', '<p>123<br/></p>', null, '2015-05-25 11:23:30', '2015-05-25 11:23:30'), ('6', '1', '项目介绍', '东山核心、江宁门户、花园SOHO', '<p><span style=\"font: 12px/18px &quot;sans serif&quot;, tahoma, verdana, helvetica; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; font-size-adjust: none; font-stretch: normal; -webkit-text-stroke-width: 0px;\">东山国际滨河街区，位于上元大街，毗邻秦淮河，总建筑面积约6万㎡，低密度活力街区，首创“花园SOHO”鲜氧办公居住理念，以170间绿色、有氧、健康、舒适的稀缺商住空间，强势填补区域内花园式SOHO的市场空白，满足创新型办公的需求，引领东山商务生活的全面升级。</span></p>', null, '2015-06-08 17:01:44', '2015-06-08 17:01:44'), ('7', '2', '11', '11111', '<p>11111111<br/></p>', null, '2015-05-30 17:56:32', '2015-05-30 17:56:32'), ('8', '1', '周边配套', '10分钟商务生活圈，繁华永不落幕', '<p><span style=\"TEXT-ALIGN: center; TEXT-TRANSFORM: none; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; DISPLAY: inline !important; FONT: 14px Simsun; WHITE-SPACE: normal; FLOAT: none; LETTER-SPACING: normal; COLOR: rgb(68,68,68); WORD-SPACING: 0px; -webkit-text-stroke-width: 0px\">东山国际滨河街区作用东山核心，东临万达，西接金轮，周边商务生活配套醇熟。其自身更是集花园SOHO、滨河商业街、星级商务酒店为一体，满足商住、投资、购物、餐饮、娱乐、社交、休闲需求，足不出户，繁华生活俯拾即是。</span></p>', null, '2015-06-05 11:55:53', '2015-06-05 11:55:53'), ('9', '1', '交通配置', '10分钟商务生活圈，繁华永不落幕', '<p><span style=\"TEXT-TRANSFORM: none; TEXT-INDENT: 0px; DISPLAY: inline !important; FONT: 12px/18px &#39;sans serif&#39;, tahoma, verdana, helvetica; WHITE-SPACE: normal; FLOAT: none; LETTER-SPACING: normal; COLOR: rgb(0,0,0); WORD-SPACING: 0px; -webkit-text-stroke-width: 0px\">自驾路线-内环东线一路畅通直到卡子门大街高架，直行至双龙大道，河定桥后第一个岔路口，沿上元大街过东山桥，第一个岔路口至滨河路即可到达。 公交路线：701、703、821、东井线、区2、区12等多条线路至武夷花园站即可到达。 地铁路线：地铁1号线南延线至河定桥站，步行10分钟即可到达。</span></p>', null, '2015-06-05 11:57:08', '2015-06-05 11:57:08'), ('10', '1', '户型鉴赏', '远离城市的喧嚣，尽享静谧人生', '<p><span style=\"TEXT-TRANSFORM: none; TEXT-INDENT: 0px; DISPLAY: inline !important; FONT: 12px/18px &#39;sans serif&#39;, tahoma, verdana, helvetica; WHITE-SPACE: normal; FLOAT: none; LETTER-SPACING: normal; COLOR: rgb(0,0,0); WORD-SPACING: 0px; -webkit-text-stroke-width: 0px\">3.3米层高，4米大开间，采光通透； 观景阳台，尽享阳光绿意的生态居住生活； 全功能商住空间，型随心悦，办公居住两相</span></p>', null, '2015-06-05 12:02:51', '2015-06-05 12:02:51');
COMMIT;

-- ----------------------------
--  Table structure for `t_houses_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_project`;
CREATE TABLE `t_houses_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `project_summary` varchar(500) DEFAULT NULL COMMENT '项目简介',
  `province` int(11) DEFAULT NULL COMMENT '省份',
  `city` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL COMMENT '区域ID',
  `price` decimal(10,0) DEFAULT NULL COMMENT '单价',
  `brokerage` decimal(10,0) DEFAULT NULL COMMENT '佣金',
  `up_area` decimal(10,0) DEFAULT NULL COMMENT '面积上限',
  `down_area` decimal(10,0) DEFAULT NULL COMMENT '面积下限',
  `up_sum` decimal(10,1) DEFAULT NULL COMMENT '总价上限',
  `down_sum` decimal(10,1) DEFAULT NULL COMMENT '总价下限',
  `first_reward` decimal(10,0) DEFAULT NULL COMMENT '首次来访奖',
  `view_reward` decimal(10,0) DEFAULT NULL COMMENT '亲自带看奖',
  `limit_desc` varchar(100) DEFAULT NULL COMMENT '限时奖励时间描述',
  `bro_desc` varchar(100) DEFAULT NULL COMMENT '佣金组成描述',
  `address` varchar(500) DEFAULT NULL COMMENT '地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `pm_id` int(11) DEFAULT NULL COMMENT '项目经理ID',
  `is_main` int(11) DEFAULT NULL COMMENT '是否主打（0：不是 1：是）',
  `req_type` int(11) DEFAULT NULL COMMENT '需求类型',
  `delete_status` int(11) DEFAULT '0' COMMENT '默认0，1表示已删除',
  `sole_count` int(11) DEFAULT '0' COMMENT '销量',
  `max_bro` decimal(10,1) DEFAULT NULL COMMENT '最大佣金',
  `deal_point` int(11) DEFAULT NULL COMMENT '成交指数',
  `commission_point` int(11) DEFAULT NULL COMMENT '佣金指数',
  `price_image_id` int(11) DEFAULT NULL COMMENT '价格图片ID',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_6` (`province`),
  KEY `FK_Reference_7` (`city`),
  KEY `FK_Reference_8` (`area`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`province`) REFERENCES `t_province` (`id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`city`) REFERENCES `t_city` (`id`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`area`) REFERENCES `t_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='楼盘项目列表';

-- ----------------------------
--  Records of `t_houses_project`
-- ----------------------------
BEGIN;
INSERT INTO `t_houses_project` VALUES ('1', '东山国际滨河街区', '江宁首创，多层花园SOHO　最后一块掘金地', '1', '1', '14', '13800', '5000', '68', '55', '94.0', '76.0', '100', '0', '无限时奖励', '佣金5000元/套', '南京市江宁区上元大街155号', '2015-10-23 00:00:00', '2015-06-12 00:45:26', '86', '0', '1', '0', '0', '5000.0', '1', '10', null), ('2', '东山国际滨河街区2', '江宁首创，多层花园SOHO　最后一块掘金地', '1', '1', '2', '15600', '6000', '3000', '2000', '2000.0', '1000.0', '150', '200', '2015年2月12日 0时-2015年5月31日 24时', '基础佣金6000元/套 + 限时奖励3000元每套', '1222', '2015-10-23 00:00:00', '2015-10-23 00:00:00', '1', '1', '1', '1', '0', null, null, null, null), ('3', '东山国际滨河街区3', '江宁首创，多层花园SOHO　最后一块掘金地', '1', '1', '3', '18600', '7000', '4000', '2500', '2000.0', '1000.0', '100', '200', '2015年3月12日 0时-2015年5月31日 24时', '基础佣金6000元/套 + 限时奖励3000元每套', '231321', '2015-10-23 00:00:00', '2015-10-23 00:00:00', '1', '1', '2', '1', '3', null, null, null, null), ('5', '楼盘名称', 'asdf', null, null, '1', '2222', '1', null, null, '2000.0', '1000.0', null, null, null, null, 'ssss', '2015-05-22 14:30:57', '2015-05-22 14:30:57', '4', '0', null, '1', '0', null, null, null, null), ('10', '12321', '31123', null, null, '1', '11222', '1123', '11', '22', '2000.0', '1000.0', '123', '123', '3212', '3212', '1222', '2015-05-22 14:30:57', '2015-05-22 14:30:57', '4', '0', '1', '1', '0', null, null, null, null), ('11', '楼盘名称 ', '楼盘简介', null, null, '2', '11111', '44', '11', '22', '2000.0', '1000.0', '33', '22', '限时奖励描述', '佣金组成描述', '楼盘地址 ', '2015-05-22 00:00:00', '2015-05-22 16:02:43', '19', '0', '1', '1', '0', null, null, null, null), ('12', '楼盘名称', '楼盘简介', null, null, '1', '1111', '33', '22', '33', '2000.0', '1000.0', '11', '22', '限时奖励描述', '佣金组成描述', '楼盘地址', '2015-05-22 14:30:57', '2015-05-22 14:30:57', '4', '0', '1', '1', '0', null, null, null, null), ('13', '沁恒科技园', '沁恒科技园', null, null, '2', '11111', '33', '11', '22', '2000.0', '1000.0', '11', '22', '限时奖励描述', '佣金组成描述   ', '沁恒科技园', '2015-05-22 14:56:07', '2015-05-22 14:56:07', '19', '0', '2', '1', '0', null, null, null, null), ('14', '测试01', '测试01', null, null, '1', '1111', '33', '222', '111', '2000.0', '1000.0', '11', '22', '测试01', '测试01', '测试01', '2015-05-22 16:04:51', '2015-05-22 16:05:16', '4', '0', '1', '1', '0', null, null, null, null), ('17', '12333', '1123123', null, null, '1', '1233', '123', '12', '23', '2000.0', '1000.0', '30', '12', '12123', '123123', '123123', '2015-05-22 16:20:34', '2015-06-11 20:14:20', '4', '0', '1', '0', '0', '500.0', '2', null, null), ('18', 'asdfasfd', 'asdfasdf', null, null, '1', '123123', '123', '123', '123', '2000.0', '1000.0', '123', '123', '1233', '1233', 'asdfasdf', '2015-05-22 16:21:10', '2015-05-22 16:21:10', '4', '0', '1', '1', '0', null, null, null, null), ('19', 'das2222', 'sdsf', null, null, '1', '1234', '1222', '111', '23', '2000.0', '1000.0', '123', '123', '12334', '1222', '123123', '2015-05-22 16:29:38', '2015-05-22 16:31:09', '4', '0', '1', '1', '0', null, null, null, null), ('20', '东山国', '', null, null, '1', null, null, null, null, null, null, null, null, '', '', '', '2015-05-31 12:00:12', '2015-05-31 12:00:12', '4', '1', '1', '1', '0', null, null, null, null), ('21', '星火E方', '三号线地铁口总价28万起挑高SOHO', null, null, '2', '7500', '9000', '70', '45', '50.0', '28.0', '0', '200', '基础奖励+限时奖励', '基础佣金6000元/套+限时奖励3000元/套', '浦口高新区星火路9号', '2015-06-05 10:35:32', '2015-06-11 11:13:33', '4', '1', '1', '0', '0', '9000.0', null, null, null), ('22', '明发新城中心', '大河西，地铁口，总价28万起挑高公寓', null, null, '2', '9000', '6000', '80', '57', '72.0', '25.0', '100', '0', '限时奖励时间：4月27日0时-6月30日24时', '基础佣金5000元/套+限时奖励1000元/套', '南京市浦口区江浦街道浦口大道37号（浦口大道与新浦路交汇处）', '2015-06-05 10:58:52', '2015-06-11 23:04:56', '4', '1', '1', '0', '0', '6000.0', null, null, null), ('23', '苏宁滨江壹号', '封藏河西，江界豪宅，奥体中心166-238㎡绝版江景豪宅', null, null, '13', '21800', '60000', '238', '136', '470.0', '330.0', '0', '0', '5月6日0时-6月30日24时', '住宅佣金20000元/套+车库佣金20000元/套+限时奖励20000元/套（税前）', '南京市建邺区河西大街与扬子江大道的交汇处', '2015-06-05 11:04:20', '2015-06-08 15:26:19', '4', '0', '2', '0', '0', '60000.0', null, null, null), ('24', 'test001', 'test001', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test001', 'test001', 'test001test001', '2015-06-17 10:37:25', '2015-06-17 10:37:25', null, '1', '1', '0', '0', '2.0', null, null, null), ('25', 'test002', 'test002', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test002', 'test002', 'test002test001', '2015-06-17 10:42:24', '2015-06-17 10:42:24', null, '1', '1', '0', '0', '2.0', null, null, null), ('26', 'test003', 'test003', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test003', 'test003', 'test003test001', '2015-06-17 10:43:51', '2015-06-17 10:43:51', null, '1', '1', '0', '0', '2.0', null, null, null), ('27', 'test004', 'test004', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test004', 'test004', 'test004test001', '2015-06-17 10:43:56', '2015-06-17 10:43:56', null, '1', '1', '0', '0', '2.0', null, null, null), ('28', 'test005', 'test005', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test005', 'test005', 'test005test001', '2015-06-17 10:44:01', '2015-06-17 10:44:01', null, '1', '1', '0', '0', '2.0', null, null, null), ('29', 'test006', 'test006', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test006', 'test006', 'test006test001', '2015-06-17 10:44:08', '2015-06-17 10:44:08', null, '1', '1', '0', '0', '2.0', null, null, null), ('30', 'test007', 'test007', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test007', 'test007', 'test007test001', '2015-06-17 10:44:13', '2015-06-17 10:44:13', null, '1', '1', '0', '0', '2.0', null, null, null), ('31', 'test008', 'test008', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test008', 'test008', 'test008test001', '2015-06-17 10:44:18', '2015-06-17 10:44:18', null, '1', '1', '0', '0', '2.0', null, null, null), ('32', 'test009', 'test009', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test009', 'test009', 'test009test001', '2015-06-17 10:44:24', '2015-06-17 10:44:24', null, '1', '1', '0', '0', '2.0', null, null, null), ('33', 'test010', 'test010', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test010', 'test010', 'test010test001', '2015-06-17 10:44:28', '2015-06-17 10:44:28', null, '1', '1', '0', '0', '2.0', null, null, null), ('34', 'test011', 'test011', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test011', 'test011', 'test011test001', '2015-06-17 10:44:33', '2015-06-17 10:44:33', null, '1', '1', '0', '0', '2.0', null, null, null), ('35', 'test012', 'test012', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test012', 'test012', 'test012test001', '2015-06-17 10:44:37', '2015-06-17 10:44:37', null, '1', '1', '0', '0', '2.0', null, null, null), ('36', 'test013', 'test013', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test013', 'test013', 'test013test001', '2015-06-17 10:44:42', '2015-06-17 10:44:42', null, '1', '1', '0', '0', '2.0', null, null, null), ('37', 'test014', 'test014', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test014', 'test014', 'test014test001', '2015-06-17 10:44:46', '2015-06-17 10:44:46', null, '1', '1', '0', '0', '2.0', null, null, null), ('38', 'test015', 'test015', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test015', 'test015', 'test015test001', '2015-06-17 10:44:51', '2015-06-17 10:44:51', null, '1', '1', '0', '0', '2.0', null, null, null), ('39', 'test016', 'test016', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test016', 'test016', 'test016test001', '2015-06-17 10:44:55', '2015-06-17 10:44:55', null, '1', '1', '0', '0', '2.0', null, null, null), ('40', 'test017', 'test017', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test017', 'test017', 'test017test001', '2015-06-17 10:44:59', '2015-06-17 10:44:59', null, '1', '1', '0', '0', '2.0', null, null, null), ('41', 'test018', 'test018', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test018', 'test018', 'test018test001', '2015-06-17 10:45:03', '2015-06-17 10:45:03', null, '1', '1', '0', '0', '2.0', null, null, null), ('42', 'test019', 'test019', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test019', 'test019', 'test019test001', '2015-06-17 10:45:07', '2015-06-17 10:45:07', null, '1', '1', '0', '0', '2.0', null, null, null), ('43', 'test020', 'test020', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test020', 'test020', 'test020test001', '2015-06-17 10:45:11', '2015-06-17 10:45:11', null, '1', '1', '0', '0', '2.0', null, null, null), ('44', 'test021', 'test021', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test021', 'test021', 'test021test001', '2015-06-17 10:45:16', '2015-06-17 10:45:16', null, '1', '1', '0', '0', '2.0', null, null, null), ('45', 'test022', 'test022', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test022', 'test022', 'test022test001', '2015-06-17 10:45:20', '2015-06-17 10:45:20', null, '1', '1', '0', '0', '2.0', null, null, null), ('46', 'test023', 'test023', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test023', 'test023', 'test023test001', '2015-06-17 10:45:24', '2015-06-17 10:45:24', null, '1', '1', '0', '0', '2.0', null, null, null), ('47', 'test024', 'test024', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test024', 'test024', 'test024test001', '2015-06-17 10:45:27', '2015-06-17 10:45:27', null, '1', '1', '0', '0', '2.0', null, null, null), ('48', 'test025', 'test025', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test025', 'test025', 'test025test001', '2015-06-17 10:45:31', '2015-06-17 10:45:31', null, '1', '1', '0', '0', '2.0', null, null, null), ('49', 'test026', 'test026', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test026', 'test026', 'test026test001', '2015-06-17 10:45:35', '2015-06-17 10:45:35', null, '1', '1', '0', '0', '2.0', null, null, null), ('50', 'test027', 'test027', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test027', 'test027', 'test027test001', '2015-06-17 10:45:38', '2015-06-17 10:45:38', null, '1', '1', '0', '0', '2.0', null, null, null), ('51', 'test028', 'test028', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test028', 'test028', 'test028test001', '2015-06-17 10:45:42', '2015-06-17 10:45:42', null, '1', '1', '0', '0', '2.0', null, null, null), ('52', 'test029', 'test029', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test029', 'test029', 'test029test001', '2015-06-17 10:45:46', '2015-06-17 10:45:46', null, '1', '1', '0', '0', '2.0', null, null, null), ('53', 'test030', 'test030', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test030', 'test030', 'test030test001', '2015-06-17 10:45:50', '2015-06-17 10:45:50', null, '1', '1', '0', '0', '2.0', null, null, null), ('54', 'test031', 'test031', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test031', 'test031', 'test031test001', '2015-06-17 10:45:53', '2015-06-17 10:45:53', null, '1', '1', '0', '0', '2.0', null, null, null), ('55', 'test032', 'test032', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test032', 'test032', 'test032test001', '2015-06-17 10:45:57', '2015-06-17 10:45:57', null, '1', '1', '0', '0', '2.0', null, null, null), ('56', 'test033', 'test033', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test033', 'test033', 'test033test001', '2015-06-17 10:46:07', '2015-06-17 10:46:07', null, '1', '1', '0', '0', '2.0', null, null, null), ('57', 'test034', 'test034', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test034', 'test034', 'test034test001', '2015-06-17 10:46:11', '2015-06-17 10:46:11', null, '1', '1', '0', '0', '2.0', null, null, null), ('58', 'test035', 'test035', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test035', 'test035', 'test035test001', '2015-06-17 10:46:15', '2015-06-17 10:46:15', null, '1', '1', '0', '0', '2.0', null, null, null), ('59', 'test036', 'test036', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test036', 'test036', 'test036test001', '2015-06-17 10:46:19', '2015-06-17 10:46:19', null, '1', '1', '0', '0', '2.0', null, null, null), ('60', 'test037', 'test037', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test037', 'test037', 'test037test001', '2015-06-17 10:46:23', '2015-06-17 10:46:23', null, '1', '1', '0', '0', '2.0', null, null, null), ('61', 'test038', 'test038', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test038', 'test038', 'test038test001', '2015-06-17 10:46:27', '2015-06-17 10:46:27', null, '1', '1', '0', '0', '2.0', null, null, null), ('62', 'test039', 'test039', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test039', 'test039', 'test039test001', '2015-06-17 10:46:31', '2015-06-17 10:46:31', null, '1', '1', '0', '0', '2.0', null, null, null), ('63', 'test040', 'test040', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test040', 'test040', 'test040test001', '2015-06-17 10:46:35', '2015-06-17 10:46:35', null, '1', '1', '0', '0', '2.0', null, null, null), ('64', 'test041', 'test041', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test041', 'test041', 'test041test001', '2015-06-17 10:46:39', '2015-06-17 10:46:39', null, '1', '1', '0', '0', '2.0', null, null, null), ('65', 'test042', 'test042', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test042', 'test042', 'test042test001', '2015-06-17 10:46:43', '2015-06-17 10:46:43', null, '1', '1', '0', '0', '2.0', null, null, null), ('66', 'test043', 'test043', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test043', 'test043', 'test043test001', '2015-06-17 10:46:49', '2015-06-17 10:46:49', null, '1', '1', '0', '0', '2.0', null, null, null), ('67', 'test044', 'test044', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test044', 'test044', 'test044test001', '2015-06-17 10:46:55', '2015-06-17 10:46:55', null, '1', '1', '0', '0', '2.0', null, null, null), ('68', 'test045', 'test045', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test045', 'test045', 'test045test001', '2015-06-17 10:46:59', '2015-06-17 10:46:59', null, '1', '1', '0', '0', '2.0', null, null, null), ('69', 'test046', 'test046', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test046', 'test046', 'test046test001', '2015-06-17 10:47:03', '2015-06-17 10:47:03', null, '1', '1', '0', '0', '2.0', null, null, null), ('70', 'test047', 'test047', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test047', 'test047', 'test047test001', '2015-06-17 10:47:06', '2015-06-17 10:47:06', null, '1', '1', '0', '0', '2.0', null, null, null), ('71', 'test048', 'test048', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test048', 'test048', 'test048test001', '2015-06-17 10:47:10', '2015-06-17 10:47:10', null, '1', '1', '0', '0', '2.0', null, null, null), ('72', 'test049', 'test049', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test049', 'test049', 'test049test001', '2015-06-17 10:47:14', '2015-06-17 10:47:14', null, '1', '1', '0', '0', '2.0', null, null, null), ('73', 'test050', 'test050', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test050', 'test050', 'test050test001', '2015-06-17 10:47:18', '2015-06-17 10:47:18', null, '1', '1', '0', '0', '2.0', null, null, null), ('74', 'test051', 'test051', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test051', 'test051', 'test051test001', '2015-06-17 10:47:22', '2015-06-17 10:47:22', null, '1', '1', '0', '0', '2.0', null, null, null), ('75', 'test052', 'test052', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test052', 'test052', 'test052test001', '2015-06-17 10:47:26', '2015-06-17 10:47:26', null, '1', '1', '0', '0', '2.0', null, null, null), ('76', 'test053', 'test053', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test053', 'test053', 'test053test001', '2015-06-17 10:47:30', '2015-06-17 10:47:30', null, '1', '1', '0', '0', '2.0', null, null, null), ('77', 'test054', 'test054', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test054', 'test054', 'test054test001', '2015-06-17 10:47:35', '2015-06-17 10:47:35', null, '1', '1', '0', '0', '2.0', null, null, null), ('78', 'test055', 'test055', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test055', 'test055', 'test055test001', '2015-06-17 10:47:39', '2015-06-17 10:47:39', null, '1', '1', '0', '0', '2.0', null, null, null), ('79', 'test056', 'test056', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test056', 'test056', 'test056test001', '2015-06-17 10:47:45', '2015-06-17 10:47:45', null, '1', '1', '0', '0', '2.0', null, null, null), ('80', 'test057', 'test057', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test057', 'test057', 'test057test001', '2015-06-17 10:47:51', '2015-06-17 10:47:51', null, '1', '1', '0', '0', '2.0', null, null, null), ('81', 'test058', 'test058', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test058', 'test058', 'test058test001', '2015-06-17 10:48:00', '2015-06-17 10:48:00', null, '1', '1', '0', '0', '2.0', null, null, null), ('82', 'test059', 'test059', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test059', 'test059', 'test059test001', '2015-06-17 10:48:06', '2015-06-17 10:48:06', null, '1', '1', '0', '0', '2.0', null, null, null), ('83', 'test060', 'test060', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test060', 'test060', 'test060test001', '2015-06-17 10:48:13', '2015-06-17 10:48:13', null, '1', '1', '0', '0', '2.0', null, null, null), ('84', 'test061', 'test061', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test061', 'test061', 'test061test001', '2015-06-17 10:48:20', '2015-06-17 10:48:20', null, '1', '1', '0', '0', '2.0', null, null, null), ('85', 'test062', 'test062', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test062', 'test062', 'test062test001', '2015-06-17 10:48:27', '2015-06-17 10:48:27', null, '1', '1', '0', '0', '2.0', null, null, null), ('86', 'test063', 'test063', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test063', 'test063', 'test063test001', '2015-06-17 10:48:35', '2015-06-17 10:48:35', null, '1', '1', '0', '0', '2.0', null, null, null), ('87', 'test064', 'test064', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test064', 'test064', 'test064test001', '2015-06-17 10:48:42', '2015-06-17 10:48:42', null, '1', '1', '0', '0', '2.0', null, null, null), ('88', 'test065', 'test065', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test065', 'test065', 'test065test001', '2015-06-17 10:48:49', '2015-06-17 10:48:49', null, '1', '1', '0', '0', '2.0', null, null, null), ('89', 'test066', 'test066', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test066', 'test066', 'test066test001', '2015-06-17 10:48:56', '2015-06-17 10:48:56', null, '1', '1', '0', '0', '2.0', null, null, null), ('90', 'test067', 'test067', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test067', 'test067', 'test067test001', '2015-06-17 10:49:04', '2015-06-17 10:49:04', null, '1', '1', '0', '0', '2.0', null, null, null), ('91', 'test068', 'test068', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test068', 'test068', 'test068test001', '2015-06-17 10:49:12', '2015-06-17 10:49:12', null, '1', '1', '0', '0', '2.0', null, null, null), ('92', 'test069', 'test069', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test069', 'test069', 'test069test001', '2015-06-17 10:49:20', '2015-06-17 10:49:20', null, '1', '1', '0', '0', '2.0', null, null, null), ('93', 'test070', 'test070', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test070', 'test070', 'test070test001', '2015-06-17 10:49:29', '2015-06-17 10:49:29', null, '1', '1', '0', '0', '2.0', null, null, null), ('94', 'test071', 'test071', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test071', 'test071', 'test071test001', '2015-06-17 10:49:39', '2015-06-17 10:49:39', null, '1', '1', '0', '0', '2.0', null, null, null), ('95', 'test072', 'test072', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test072', 'test072', 'test072test001', '2015-06-17 10:49:47', '2015-06-17 10:49:47', null, '1', '1', '0', '0', '2.0', null, null, null), ('96', 'test073', 'test073', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test073', 'test073', 'test073test001', '2015-06-17 10:49:54', '2015-06-17 10:49:54', null, '1', '1', '0', '0', '2.0', null, null, null), ('97', 'test074', 'test074', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test074', 'test074', 'test074test001', '2015-06-17 10:50:02', '2015-06-17 10:50:02', null, '1', '1', '0', '0', '2.0', null, null, null), ('98', 'test075', 'test075', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test075', 'test075', 'test075test001', '2015-06-17 10:50:09', '2015-06-17 10:50:09', null, '1', '1', '0', '0', '2.0', null, null, null), ('99', 'test076', 'test076', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test076', 'test076', 'test076test001', '2015-06-17 10:50:16', '2015-06-17 10:50:16', null, '1', '1', '0', '0', '2.0', null, null, null), ('100', 'test077', 'test077', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test077', 'test077', 'test077test001', '2015-06-17 10:50:22', '2015-06-17 10:50:22', null, '1', '1', '0', '0', '2.0', null, null, null), ('101', 'test078', 'test078', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test078', 'test078', 'test078test001', '2015-06-17 10:50:29', '2015-06-17 10:50:29', null, '1', '1', '0', '0', '2.0', null, null, null), ('102', 'test079', 'test079', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test079', 'test079', 'test079test001', '2015-06-17 10:50:37', '2015-06-17 10:50:37', null, '1', '1', '0', '0', '2.0', null, null, null), ('103', 'test080', 'test080', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test080', 'test080', 'test080test001', '2015-06-17 10:50:44', '2015-06-17 10:50:44', null, '1', '1', '0', '0', '2.0', null, null, null), ('104', 'test081', 'test081', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test081', 'test081', 'test081test001', '2015-06-17 10:50:51', '2015-06-17 10:50:51', null, '1', '1', '0', '0', '2.0', null, null, null), ('105', 'test082', 'test082', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test082', 'test082', 'test082test001', '2015-06-17 10:50:59', '2015-06-17 10:50:59', null, '1', '1', '0', '0', '2.0', null, null, null), ('106', 'test083', 'test083', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test083', 'test083', 'test083test001', '2015-06-17 10:51:05', '2015-06-17 10:51:05', null, '1', '1', '0', '0', '2.0', null, null, null), ('107', 'test084', 'test084', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test084', 'test084', 'test084test001', '2015-06-17 10:51:10', '2015-06-17 10:51:10', null, '1', '1', '0', '0', '2.0', null, null, null), ('108', 'test085', 'test085', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test085', 'test085', 'test085test001', '2015-06-17 10:51:17', '2015-06-17 10:51:17', null, '1', '1', '0', '0', '2.0', null, null, null), ('109', 'test086', 'test086', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test086', 'test086', 'test086test001', '2015-06-17 10:51:22', '2015-06-17 10:51:22', null, '1', '1', '0', '0', '2.0', null, null, null), ('110', 'test087', 'test087', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test087', 'test087', 'test087test001', '2015-06-17 10:51:29', '2015-06-17 10:51:29', null, '1', '1', '0', '0', '2.0', null, null, null), ('111', 'test088', 'test088', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test088', 'test088', 'test088test001', '2015-06-17 10:51:36', '2015-06-17 10:51:36', null, '1', '1', '0', '0', '2.0', null, null, null), ('112', 'test089', 'test089', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test089', 'test089', 'test089test001', '2015-06-17 10:51:43', '2015-06-17 10:51:43', null, '1', '1', '0', '0', '2.0', null, null, null), ('113', 'test090', 'test090', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test090', 'test090', 'test090test001', '2015-06-17 10:51:50', '2015-06-17 10:51:50', null, '1', '1', '0', '0', '2.0', null, null, null), ('114', 'test091', 'test091', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test091', 'test091', 'test091test001', '2015-06-17 10:51:56', '2015-06-17 10:51:56', null, '1', '1', '0', '0', '2.0', null, null, null), ('115', 'test092', 'test092', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test092', 'test092', 'test092test001', '2015-06-17 10:52:04', '2015-06-17 10:52:04', null, '1', '1', '0', '0', '2.0', null, null, null), ('116', 'test093', 'test093', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test093', 'test093', 'test093test001', '2015-06-17 10:52:10', '2015-06-17 10:52:10', null, '1', '1', '0', '0', '2.0', null, null, null), ('117', 'test094', 'test094', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test094', 'test094', 'test094test001', '2015-06-17 10:52:16', '2015-06-17 10:52:16', null, '1', '1', '0', '0', '2.0', null, null, null), ('118', 'test095', 'test095', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test095', 'test095', 'test095test001', '2015-06-17 10:52:22', '2015-06-17 10:52:22', null, '1', '1', '0', '0', '2.0', null, null, null), ('119', 'test096', 'test096', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test096', 'test096', 'test096test001', '2015-06-17 10:52:29', '2015-06-17 10:52:29', null, '1', '1', '0', '0', '2.0', null, null, null), ('120', 'test097', 'test097', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test097', 'test097', 'test097test001', '2015-06-17 10:52:36', '2015-06-17 10:52:36', null, '1', '1', '0', '0', '2.0', null, null, null), ('121', 'test098', 'test098', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test098', 'test098', 'test098test001', '2015-06-17 10:52:42', '2015-06-17 10:52:42', null, '1', '1', '0', '0', '2.0', null, null, null), ('122', 'test099', 'test099', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test099', 'test099', 'test099test001', '2015-06-17 10:52:48', '2015-06-17 10:52:48', null, '1', '1', '0', '0', '2.0', null, null, null), ('123', 'test100', 'test100', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test100', 'test100', 'test100test001', '2015-06-17 10:52:55', '2015-06-17 10:52:55', null, '1', '1', '0', '0', '2.0', null, null, null), ('124', 'test101', 'test101', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test101', 'test101', 'test101test001', '2015-06-17 10:53:03', '2015-06-17 10:53:03', null, '1', '1', '0', '0', '2.0', null, null, null), ('125', 'test102', 'test102', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test102', 'test102', 'test102test001', '2015-06-17 10:53:10', '2015-06-17 10:53:10', null, '1', '1', '0', '0', '2.0', null, null, null), ('126', 'test103', 'test103', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test103', 'test103', 'test103test001', '2015-06-17 10:53:16', '2015-06-17 10:53:16', null, '1', '1', '0', '0', '2.0', null, null, null), ('127', 'test104', 'test104', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test104', 'test104', 'test104test001', '2015-06-17 10:53:22', '2015-06-17 10:53:22', null, '1', '1', '0', '0', '2.0', null, null, null), ('128', 'test105', 'test105', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test105', 'test105', 'test105test001', '2015-06-17 10:53:28', '2015-06-17 10:53:28', null, '1', '1', '0', '0', '2.0', null, null, null), ('129', 'test106', 'test106', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test106', 'test106', 'test106test001', '2015-06-17 10:53:34', '2015-06-17 10:53:34', null, '1', '1', '0', '0', '2.0', null, null, null), ('130', 'test107', 'test107', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test107', 'test107', 'test107test001', '2015-06-17 10:53:41', '2015-06-17 10:53:41', null, '1', '1', '0', '0', '2.0', null, null, null), ('131', 'test108', 'test108', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test108', 'test108', 'test108test001', '2015-06-17 10:53:47', '2015-06-17 10:53:47', null, '1', '1', '0', '0', '2.0', null, null, null), ('132', 'test109', 'test109', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test109', 'test109', 'test109test001', '2015-06-17 10:53:56', '2015-06-17 10:53:56', null, '1', '1', '0', '0', '2.0', null, null, null), ('133', 'test110', 'test110', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test110', 'test110', 'test110test001', '2015-06-17 10:54:04', '2015-06-17 10:54:04', null, '1', '1', '0', '0', '2.0', null, null, null), ('134', 'test111', 'test111', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test111', 'test111', 'test111test001', '2015-06-17 10:54:11', '2015-06-17 10:54:11', null, '1', '1', '0', '0', '2.0', null, null, null), ('135', 'test112', 'test112', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test112', 'test112', 'test112test001', '2015-06-17 10:54:19', '2015-06-17 10:54:19', null, '1', '1', '0', '0', '2.0', null, null, null), ('136', 'test113', 'test113', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test113', 'test113', 'test113test001', '2015-06-17 10:54:28', '2015-06-17 10:54:28', null, '1', '1', '0', '0', '2.0', null, null, null), ('137', 'test114', 'test114', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test114', 'test114', 'test114test001', '2015-06-17 10:54:35', '2016-06-24 15:00:49', null, '1', '1', '0', '0', '2.0', null, null, '-1'), ('138', 'test115', 'test115', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test115', 'test115', 'test115test001', '2015-06-17 10:54:42', '2015-06-17 10:54:42', null, '1', '1', '0', '0', '2.0', null, null, null), ('139', 'test116', 'test116', null, null, '1', '10000', '1', '100', '10', '9.0', '2.0', '1', '2', 'test116', 'test116', 'test116test001', '2015-06-17 10:54:48', '2015-06-17 10:54:48', null, '1', '1', '0', '0', '2.0', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `t_houses_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_houses_type`;
CREATE TABLE `t_houses_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` int(11) DEFAULT NULL,
  `house_typename` varchar(500) DEFAULT NULL,
  `house_typecontent` varchar(500) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  `house_area` int(11) DEFAULT NULL,
  `house_price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_10` (`project_id`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`project_id`) REFERENCES `t_houses_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼盘户型';

-- ----------------------------
--  Table structure for `t_money_application`
-- ----------------------------
DROP TABLE IF EXISTS `t_money_application`;
CREATE TABLE `t_money_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) DEFAULT NULL COMMENT '账户ID',
  `amount_money` decimal(10,0) DEFAULT NULL COMMENT '申请结佣金额',
  `final_money` decimal(10,0) DEFAULT NULL COMMENT '最终金额',
  `application_time` datetime DEFAULT NULL COMMENT '申请时间',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `operater_id` int(11) DEFAULT NULL COMMENT '操作员ID',
  `pm_id` int(11) DEFAULT NULL COMMENT '项目经理ID',
  `result_status` int(11) DEFAULT NULL COMMENT '状态',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户申请表ID',
  `app_type` int(11) DEFAULT NULL COMMENT '佣金类型',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_18` (`account_id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`account_id`) REFERENCES `t_sys_agent_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现申请表';

-- ----------------------------
--  Table structure for `t_money_balance`
-- ----------------------------
DROP TABLE IF EXISTS `t_money_balance`;
CREATE TABLE `t_money_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) DEFAULT NULL COMMENT '账户ID',
  `amount_money` decimal(10,0) DEFAULT NULL,
  `final_money` decimal(10,0) DEFAULT NULL,
  `application_time` datetime DEFAULT NULL COMMENT '申请时间',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `operater_id` int(11) DEFAULT NULL COMMENT '操作人ID',
  `application_id` int(11) DEFAULT NULL COMMENT '申请ID',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_21` (`application_id`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`application_id`) REFERENCES `t_money_application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现结算表';

-- ----------------------------
--  Table structure for `t_money_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_money_detail`;
CREATE TABLE `t_money_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `application_id` int(11) DEFAULT NULL,
  `result` varchar(500) DEFAULT NULL,
  `operater_id` int(11) DEFAULT NULL,
  `operater_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_27` (`application_id`),
  CONSTRAINT `FK_Reference_27` FOREIGN KEY (`application_id`) REFERENCES `t_money_application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='佣金流水';

-- ----------------------------
--  Table structure for `t_msg_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_msg_record`;
CREATE TABLE `t_msg_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '接受短信的用户ID',
  `msg_type` int(11) DEFAULT NULL COMMENT '1:验证码，2:账户信息变更通知,3:营销',
  `phone_number` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `content` varchar(800) DEFAULT NULL COMMENT '发送内容',
  `send_status` int(11) DEFAULT NULL COMMENT '状态，1：成功，0：失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信记录表';

-- ----------------------------
--  Table structure for `t_msg_validate`
-- ----------------------------
DROP TABLE IF EXISTS `t_msg_validate`;
CREATE TABLE `t_msg_validate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `expiration_time` datetime DEFAULT NULL COMMENT '过期时间',
  `validate_code` varchar(255) DEFAULT NULL COMMENT '验证码',
  `validate_status` int(11) DEFAULT NULL COMMENT '验证码状态',
  `validate_code_seq` varchar(255) DEFAULT NULL COMMENT '验证码序号',
  `phone_number` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `validate_time` datetime DEFAULT NULL COMMENT '验证时间',
  `purpose` varchar(400) DEFAULT NULL COMMENT '验证码用途',
  `content` varchar(400) DEFAULT NULL COMMENT '短信全文内容',
  `record_id` int(11) DEFAULT NULL COMMENT '记录ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='短信验证码表';

-- ----------------------------
--  Records of `t_msg_validate`
-- ----------------------------
BEGIN;
INSERT INTO `t_msg_validate` VALUES ('1', null, '2016-06-22 21:09:50', '2016-06-22 21:14:50', '6029', '1', null, '13605179121', null, '注册资料', '6029', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_type` varchar(255) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图文消息表';

-- ----------------------------
--  Table structure for `t_news_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_news_detail`;
CREATE TABLE `t_news_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(400) DEFAULT NULL COMMENT '标题',
  `description` varchar(500) DEFAULT NULL COMMENT '说明',
  `pic_id` varchar(255) DEFAULT NULL COMMENT '图片ID',
  `content` text COMMENT '内容',
  `parent_id` int(11) DEFAULT NULL COMMENT '所属消息ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图文消息明细表';

-- ----------------------------
--  Table structure for `t_operate_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_operate_record`;
CREATE TABLE `t_operate_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_type` int(11) DEFAULT NULL COMMENT '账户类型',
  `operate_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `operate_content` varchar(2000) DEFAULT NULL COMMENT '操作内容',
  `operate_time` date DEFAULT NULL COMMENT '操作时间',
  `operate_ip` varchar(2000) DEFAULT NULL COMMENT '操作IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4962 DEFAULT CHARSET=utf8 COMMENT='记录用户的操作历史';

-- ----------------------------
--  Records of `t_operate_record`
-- ----------------------------
BEGIN;
INSERT INTO `t_operate_record` VALUES ('3520', '2', '2', '1', '后台登录', '2015-06-12', '192.168.1.99'), ('3521', '2', '2', '1', '后台登录', '2015-06-12', '100.64.209.212'), ('3522', '2', '2', '1', '后台登录', '2015-06-12', '100.64.209.212'), ('3523', '2', '2', '1', '后台登录', '2015-06-12', '192.168.1.99'), ('3524', '2', '2', '1', '后台登录', '2015-06-12', '192.168.1.99'), ('3525', '2', '2', '1', '后台登录', '2015-06-15', '127.0.0.1'), ('3526', '2', '2', '1', '后台登录', '2015-06-15', '127.0.0.1'), ('3527', '2', '2', '1', '后台登录', '2015-06-15', '127.0.0.1'), ('3528', '2', '2', '1', '后台登录', '2015-06-15', '127.0.0.1'), ('3529', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.113'), ('3530', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.113'), ('3531', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.108'), ('3532', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3533', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3534', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3535', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3536', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3537', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3538', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3539', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3540', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3541', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3542', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3543', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3544', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3545', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3546', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3547', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3548', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3549', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3550', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3551', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3552', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3553', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3554', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3555', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3556', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3557', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3558', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3559', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3560', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3561', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3562', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3563', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3564', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3565', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3566', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3567', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3568', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3569', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3570', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3571', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3572', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3573', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3574', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3575', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3576', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3577', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3578', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3579', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3580', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3581', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3582', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3583', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3584', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3585', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3586', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3587', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3588', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3589', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3590', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3591', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3592', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3593', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3594', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3595', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3596', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3597', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3598', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3599', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3600', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3601', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3602', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3603', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3604', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3605', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3606', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3607', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3608', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3609', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3610', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3611', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3612', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3613', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3614', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3615', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3616', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3617', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3618', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3619', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3620', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3621', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3622', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3623', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3624', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3625', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3626', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3627', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3628', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3629', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3630', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3631', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3632', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3633', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3634', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3635', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3636', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3637', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3638', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3639', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3640', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3641', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3642', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3643', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3644', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3645', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3646', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3647', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3648', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3649', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3650', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3651', '2', '2', '1', '后台登录', '2015-06-17', '192.168.1.100'), ('3652', '2', '2', '1', '后台登录', '2015-11-26', '127.0.0.1'), ('3653', '2', '2', '1', '后台登录', '2015-11-26', '127.0.0.1'), ('3654', '2', '2', '1', '后台登录', '2015-11-26', '127.0.0.1'), ('3655', '2', '2', '1', '后台登录', '2015-12-08', '127.0.0.1'), ('3656', '2', '2', '1', '后台登录', '2015-12-17', '127.0.0.1'), ('3657', '2', '2', '1', '后台登录', '2016-01-05', '127.0.0.1'), ('3658', '2', '2', '1', '后台登录', '2016-01-05', '127.0.0.1'), ('3659', '2', '2', '1', '后台登录', '2016-01-05', '127.0.0.1'), ('3660', '2', '2', '1', '后台登录', '2016-01-06', '127.0.0.1'), ('3661', '2', '2', '1', '后台登录', '2016-02-01', '127.0.0.1'), ('3662', '2', '2', '1', '后台登录', '2016-05-29', '0:0:0:0:0:0:0:1'), ('3663', '2', '2', '1', '后台登录', '2016-06-21', '0:0:0:0:0:0:0:1'), ('3664', '2', '2', '1', '后台登录', '2016-06-22', '0:0:0:0:0:0:0:1'), ('3665', '2', '2', '1', '后台登录', '2016-06-22', '0:0:0:0:0:0:0:1'), ('3666', '2', '2', '1', '后台登录', '2016-06-22', '0:0:0:0:0:0:0:1'), ('3667', '2', '2', '1', '后台登录', '2016-06-22', '0:0:0:0:0:0:0:1'), ('3668', '2', '2', '1', '后台登录', '2016-06-23', '0:0:0:0:0:0:0:1'), ('3669', '2', '2', '1', '后台登录', '2016-06-23', '0:0:0:0:0:0:0:1'), ('3670', '2', '2', '1', '后台登录', '2016-06-23', '0:0:0:0:0:0:0:1'), ('3671', '2', '2', '1', '后台登录', '2016-06-23', '0:0:0:0:0:0:0:1'), ('3672', '2', '2', '1', '后台登录', '2016-06-23', '0:0:0:0:0:0:0:1'), ('3673', '2', '2', '1', '后台登录', '2016-06-23', '0:0:0:0:0:0:0:1'), ('3674', '2', '2', '1', '后台登录', '2016-06-23', '0:0:0:0:0:0:0:1'), ('3675', '2', '2', '1', '后台登录', '2016-06-23', '0:0:0:0:0:0:0:1'), ('3676', '2', '2', '1', '后台登录', '2016-06-23', '0:0:0:0:0:0:0:1'), ('3677', '2', '2', '1', '后台登录', '2016-06-23', '0:0:0:0:0:0:0:1'), ('3678', '2', '2', '1', '后台登录', '2016-06-23', '0:0:0:0:0:0:0:1'), ('3679', '2', '2', '1', '后台登录', '2016-06-23', '0:0:0:0:0:0:0:1'), ('3680', '2', '2', '1', '后台登录', '2016-06-23', '192.168.199.140'), ('3681', '2', '2', '1', '后台登录', '2016-06-24', '0:0:0:0:0:0:0:1'), ('3682', '2', '2', '1', '后台登录', '2016-06-24', '0:0:0:0:0:0:0:1'), ('3683', '2', '2', '1', '后台登录', '2016-06-24', '0:0:0:0:0:0:0:1'), ('3684', '2', '2', '1', '后台登录', '2016-06-24', '0:0:0:0:0:0:0:1'), ('3685', '2', '2', '1', '后台登录', '2016-06-25', '0:0:0:0:0:0:0:1'), ('3686', '2', '2', '1', '后台登录', '2016-07-08', '0:0:0:0:0:0:0:1'), ('3687', '2', '2', '1', '后台登录', '2016-07-08', '0:0:0:0:0:0:0:1'), ('3688', '2', '2', '1', '后台登录', '2016-07-08', '0:0:0:0:0:0:0:1'), ('3689', '2', '2', '1', '后台登录', '2016-07-11', '0:0:0:0:0:0:0:1'), ('3690', '2', '2', '1', '后台登录', '2016-07-12', '0:0:0:0:0:0:0:1'), ('3691', '2', '2', '1', '后台登录', '2016-07-12', '0:0:0:0:0:0:0:1'), ('3692', '2', '2', '1', '后台登录', '2016-07-12', '0:0:0:0:0:0:0:1'), ('3693', '2', '2', '1', '后台登录', '2016-07-12', '0:0:0:0:0:0:0:1'), ('3694', '2', '2', '1', '后台登录', '2016-07-12', '0:0:0:0:0:0:0:1'), ('3695', '2', '2', '1', '后台登录', '2016-07-12', '0:0:0:0:0:0:0:1'), ('3696', '2', '2', '1', '后台登录', '2016-07-12', '0:0:0:0:0:0:0:1'), ('3697', '2', '2', '1', '后台登录', '2016-07-12', '0:0:0:0:0:0:0:1'), ('3698', '2', '2', '1', '后台登录', '2016-07-12', '0:0:0:0:0:0:0:1'), ('3699', '2', '2', '1', '后台登录', '2016-07-12', '0:0:0:0:0:0:0:1'), ('3700', '2', '2', '1', '后台登录', '2016-07-12', '0:0:0:0:0:0:0:1'), ('3701', '2', '2', '1', '后台登录', '2016-07-12', '0:0:0:0:0:0:0:1'), ('3702', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3703', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3704', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3705', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3706', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3707', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3708', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3709', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3710', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3711', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3712', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3713', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3714', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3715', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3716', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3717', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3718', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3719', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3720', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3721', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3722', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3723', '2', '2', '1', '后台登录', '2016-07-13', '0:0:0:0:0:0:0:1'), ('3724', '2', '2', '1', '后台登录', '2016-07-14', '0:0:0:0:0:0:0:1'), ('3725', '2', '2', '1', '后台登录', '2016-07-14', '0:0:0:0:0:0:0:1'), ('3726', '2', '2', '1', '后台登录', '2016-07-14', '0:0:0:0:0:0:0:1'), ('3727', '2', '2', '1', '后台登录', '2016-07-14', '0:0:0:0:0:0:0:1'), ('3728', '2', '2', '1', '后台登录', '2016-07-14', '0:0:0:0:0:0:0:1'), ('3729', '2', '2', '1', '后台登录', '2016-07-14', '0:0:0:0:0:0:0:1'), ('3730', '2', '2', '1', '后台登录', '2016-07-14', '0:0:0:0:0:0:0:1'), ('3731', '2', '2', '1', '后台登录', '2016-07-14', '0:0:0:0:0:0:0:1'), ('3732', '2', '2', '1', '后台登录', '2016-07-15', '0:0:0:0:0:0:0:1'), ('3733', '2', '2', '1', '后台登录', '2016-07-15', '0:0:0:0:0:0:0:1'), ('3734', '2', '2', '1', '后台登录', '2016-07-15', '0:0:0:0:0:0:0:1'), ('3735', '2', '2', '1', '后台登录', '2016-07-15', '0:0:0:0:0:0:0:1'), ('3736', '2', '2', '1', '后台登录', '2016-07-15', '0:0:0:0:0:0:0:1'), ('3737', '2', '2', '1', '后台登录', '2016-07-15', '0:0:0:0:0:0:0:1'), ('3738', '2', '2', '1', '后台登录', '2016-07-15', '0:0:0:0:0:0:0:1'), ('3739', '2', '2', '1', '后台登录', '2016-07-15', '0:0:0:0:0:0:0:1'), ('3740', '2', '2', '1', '后台登录', '2016-07-15', '0:0:0:0:0:0:0:1'), ('3741', '2', '2', '1', '后台登录', '2016-07-16', '0:0:0:0:0:0:0:1'), ('3742', '2', '2', '1', '后台登录', '2016-07-16', '0:0:0:0:0:0:0:1'), ('3743', '2', '2', '1', '后台登录', '2016-07-16', '0:0:0:0:0:0:0:1'), ('3744', '2', '2', '1', '后台登录', '2016-07-16', '0:0:0:0:0:0:0:1'), ('3745', '2', '2', '1', '后台登录', '2016-07-16', '0:0:0:0:0:0:0:1'), ('3746', '2', '2', '1', '后台登录', '2016-07-16', '0:0:0:0:0:0:0:1'), ('3747', '2', '2', '1', '后台登录', '2016-07-16', '0:0:0:0:0:0:0:1'), ('3748', '2', '2', '1', '后台登录', '2016-07-16', '0:0:0:0:0:0:0:1'), ('3749', '2', '2', '1', '后台登录', '2016-07-16', '0:0:0:0:0:0:0:1'), ('3750', '2', '2', '1', '后台登录', '2016-07-16', '0:0:0:0:0:0:0:1'), ('3751', '2', '2', '1', '后台登录', '2016-07-17', '0:0:0:0:0:0:0:1'), ('3752', '2', '2', '1', '后台登录', '2016-07-17', '0:0:0:0:0:0:0:1'), ('3753', '2', '2', '1', '后台登录', '2016-07-17', '0:0:0:0:0:0:0:1'), ('3754', '2', '2', '1', '后台登录', '2016-07-17', '0:0:0:0:0:0:0:1'), ('3755', '2', '2', '1', '后台登录', '2016-07-17', '0:0:0:0:0:0:0:1'), ('3756', '2', '2', '1', '后台登录', '2016-07-18', '0:0:0:0:0:0:0:1'), ('3757', '2', '2', '1', '后台登录', '2016-07-18', '0:0:0:0:0:0:0:1'), ('3758', '2', '2', '1', '后台登录', '2016-07-18', '0:0:0:0:0:0:0:1'), ('3759', '2', '2', '1', '后台登录', '2016-07-18', '0:0:0:0:0:0:0:1'), ('3760', '2', '2', '1', '后台登录', '2016-07-18', '0:0:0:0:0:0:0:1'), ('3761', '2', '2', '1', '后台登录', '2016-07-18', '0:0:0:0:0:0:0:1'), ('3762', '2', '2', '1', '后台登录', '2016-08-10', '0:0:0:0:0:0:0:1'), ('3763', '2', '2', '1', '后台登录', '2016-08-10', '0:0:0:0:0:0:0:1'), ('3764', '2', '2', '1', '后台登录', '2016-08-10', '0:0:0:0:0:0:0:1'), ('3765', '2', '2', '1', '后台登录', '2016-08-10', '0:0:0:0:0:0:0:1'), ('3766', '2', '2', '1', '后台登录', '2016-08-10', '0:0:0:0:0:0:0:1'), ('3767', '2', '2', '1', '后台登录', '2016-08-12', '0:0:0:0:0:0:0:1'), ('3768', '2', '2', '1', '后台登录', '2016-08-15', '0:0:0:0:0:0:0:1'), ('3769', '2', '2', '1', '后台登录', '2016-08-15', '0:0:0:0:0:0:0:1'), ('3770', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3771', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3772', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3773', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3774', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3775', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3776', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3777', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3778', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3779', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3780', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3781', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3782', '12', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3783', '13', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3784', '13', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3785', '12', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3786', '12', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3787', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3788', '12', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3789', '12', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3790', '12', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3791', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3792', '2', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3793', '12', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3794', '12', '2', '1', '后台登录', '2016-08-16', '0:0:0:0:0:0:0:1'), ('3795', '2', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3796', '12', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3797', '12', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3798', '2', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3799', '2', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3800', '12', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3801', '12', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3802', '13', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3803', '12', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3804', '12', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3805', '12', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3806', '12', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3807', '12', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3808', '2', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3809', '2', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3810', '12', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3811', '12', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3812', '12', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3813', '2', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3814', '12', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3815', '2', '2', '1', '后台登录', '2016-08-17', '0:0:0:0:0:0:0:1'), ('3816', '12', '2', '1', '后台登录', '2016-08-18', '0:0:0:0:0:0:0:1'), ('3817', '12', '2', '1', '后台登录', '2016-08-18', '0:0:0:0:0:0:0:1'), ('3818', '12', '2', '1', '后台登录', '2016-08-18', '0:0:0:0:0:0:0:1'), ('3819', '12', '2', '1', '后台登录', '2016-08-18', '0:0:0:0:0:0:0:1'), ('3820', '12', '2', '1', '后台登录', '2016-08-18', '0:0:0:0:0:0:0:1'), ('3821', '12', '2', '1', '后台登录', '2016-08-18', '0:0:0:0:0:0:0:1'), ('3822', '12', '2', '1', '后台登录', '2016-08-18', '0:0:0:0:0:0:0:1'), ('3823', '12', '2', '1', '后台登录', '2016-08-18', '0:0:0:0:0:0:0:1'), ('3824', '12', '2', '1', '后台登录', '2016-08-18', '0:0:0:0:0:0:0:1'), ('3825', '12', '2', '1', '后台登录', '2016-08-18', '0:0:0:0:0:0:0:1'), ('3826', '12', '2', '1', '后台登录', '2016-08-18', '0:0:0:0:0:0:0:1'), ('3827', '2', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3828', '14', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3829', '14', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3830', '14', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3831', '14', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3832', '2', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3833', '12', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3834', '14', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3835', '12', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3836', '2', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3837', '12', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3838', '13', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3839', '14', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3840', '14', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3841', '12', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3842', '2', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3843', '12', '2', '1', '后台登录', '2016-08-19', '0:0:0:0:0:0:0:1'), ('3844', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3845', '2', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3846', '2', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3847', '2', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3848', '2', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3849', '2', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3850', '2', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3851', '2', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3852', '2', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3853', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3854', '13', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3855', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3856', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3857', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3858', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3859', '13', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3860', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3861', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3862', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3863', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3864', '2', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3865', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3866', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3867', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3868', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3869', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3870', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3871', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3872', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3873', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3874', '12', '2', '1', '后台登录', '2016-08-20', '0:0:0:0:0:0:0:1'), ('3875', '2', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3876', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3877', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3878', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3879', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3880', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3881', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3882', '2', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3883', '13', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3884', '2', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3885', '15', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3886', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3887', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3888', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3889', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3890', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3891', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3892', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3893', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3894', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3895', '2', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3896', '2', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3897', '13', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3898', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3899', '13', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3900', '2', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3901', '2', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3902', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3903', '13', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3904', '13', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3905', '12', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3906', '2', '2', '1', '后台登录', '2016-08-21', '0:0:0:0:0:0:0:1'), ('3907', '12', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3908', '2', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3909', '2', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3910', '2', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3911', '2', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3912', '2', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3913', '2', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3914', '12', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3915', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3916', '2', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3917', '12', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3918', '12', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3919', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3920', '12', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3921', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3922', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3923', '2', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3924', '12', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3925', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3926', '15', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3927', '12', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3928', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3929', '2', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3930', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3931', '12', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3932', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3933', '12', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3934', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3935', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3936', '12', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3937', '2', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3938', '12', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3939', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3940', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3941', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3942', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3943', '13', '2', '1', '后台登录', '2016-08-22', '0:0:0:0:0:0:0:1'), ('3944', '12', '2', '1', '后台登录', '2016-08-23', '0:0:0:0:0:0:0:1'), ('3945', '12', '2', '1', '后台登录', '2016-08-23', '0:0:0:0:0:0:0:1'), ('3946', '12', '2', '1', '后台登录', '2016-08-23', '0:0:0:0:0:0:0:1'), ('3947', '13', '2', '1', '后台登录', '2016-08-23', '0:0:0:0:0:0:0:1'), ('3948', '12', '2', '1', '后台登录', '2016-08-23', '0:0:0:0:0:0:0:1'), ('3949', '12', '2', '1', '后台登录', '2016-08-24', '0:0:0:0:0:0:0:1'), ('3950', '12', '2', '1', '后台登录', '2016-08-24', '0:0:0:0:0:0:0:1'), ('3951', '12', '2', '1', '后台登录', '2016-08-24', '0:0:0:0:0:0:0:1'), ('3952', '12', '2', '1', '后台登录', '2016-08-24', '0:0:0:0:0:0:0:1'), ('3953', '12', '2', '1', '后台登录', '2016-08-24', '0:0:0:0:0:0:0:1'), ('3954', '13', '2', '1', '后台登录', '2016-08-25', '121.237.192.245'), ('3955', '13', '2', '1', '后台登录', '2016-08-25', '218.94.93.242'), ('3956', '17', '2', '1', '后台登录', '2016-08-25', '218.94.93.242'), ('3957', '17', '2', '1', '后台登录', '2016-08-25', '121.237.192.245'), ('3958', '17', '2', '1', '后台登录', '2016-08-25', '121.237.192.245'), ('3959', '17', '2', '1', '后台登录', '2016-08-25', '218.94.93.242'), ('3960', '12', '2', '1', '后台登录', '2016-08-25', '49.74.85.217'), ('3961', '13', '2', '1', '后台登录', '2016-08-25', '49.74.85.217'), ('3962', '17', '2', '1', '后台登录', '2016-08-26', '121.237.192.245'), ('3963', '2', '2', '1', '后台登录', '2016-08-27', '121.237.174.22'), ('3964', '2', '2', '1', '后台登录', '2016-08-27', '121.237.174.22'), ('3965', '15', '2', '1', '后台登录', '2016-08-27', '121.237.174.22'), ('3966', '13', '2', '1', '后台登录', '2016-08-27', '121.237.174.22'), ('3967', '2', '2', '1', '后台登录', '2016-08-27', '121.237.174.22'), ('3968', '13', '2', '1', '后台登录', '2016-08-27', '121.237.174.22'), ('3969', '2', '2', '1', '后台登录', '2016-08-27', '121.237.174.22'), ('3970', '13', '2', '1', '后台登录', '2016-08-28', '117.89.227.251'), ('3971', '2', '2', '1', '后台登录', '2016-08-29', '180.109.230.48'), ('3972', '13', '2', '1', '后台登录', '2016-08-29', '180.109.230.48'), ('3973', '17', '2', '1', '后台登录', '2016-08-29', '180.109.230.48'), ('3974', '13', '2', '1', '后台登录', '2016-08-29', '180.109.230.48'), ('3975', '2', '2', '1', '后台登录', '2016-08-29', '180.109.230.48'), ('3976', '13', '2', '1', '后台登录', '2016-08-29', '180.109.230.48'), ('3977', '2', '2', '1', '后台登录', '2016-08-29', '180.109.230.48'), ('3978', '15', '2', '1', '后台登录', '2016-08-29', '180.109.230.48'), ('3979', '2', '2', '1', '后台登录', '2016-08-29', '180.109.230.48'), ('3980', '15', '2', '1', '后台登录', '2016-08-29', '180.109.230.48'), ('3981', '2', '2', '1', '后台登录', '2016-08-29', '180.109.230.48'), ('3982', '2', '2', '1', '后台登录', '2016-08-29', '180.109.230.48'), ('3983', '15', '2', '1', '后台登录', '2016-08-31', '117.136.81.162'), ('3984', '2', '2', '1', '后台登录', '2016-08-31', '112.2.36.56'), ('3985', '17', '2', '1', '后台登录', '2016-08-31', '112.2.36.56'), ('3986', '17', '2', '1', '后台登录', '2016-08-31', '112.2.36.56'), ('3987', '13', '2', '1', '后台登录', '2016-08-31', '112.2.36.56'), ('3988', '15', '2', '1', '后台登录', '2016-08-31', '112.2.36.56'), ('3989', '2', '2', '1', '后台登录', '2016-08-31', '112.2.36.56'), ('3990', '15', '2', '1', '后台登录', '2016-08-31', '121.229.94.209'), ('3991', '2', '2', '1', '后台登录', '2016-09-02', '49.65.71.86'), ('3992', '2', '2', '1', '后台登录', '2016-09-02', '223.104.4.54'), ('3993', '13', '2', '1', '后台登录', '2016-09-02', '223.104.4.54'), ('3994', '2', '2', '1', '后台登录', '2016-09-02', '49.65.71.86'), ('3995', '2', '2', '1', '后台登录', '2016-09-02', '180.109.226.254'), ('3996', '13', '2', '1', '后台登录', '2016-09-02', '49.77.1.28'), ('3997', '13', '2', '1', '后台登录', '2016-09-02', '180.109.226.254'), ('3998', '2', '2', '1', '后台登录', '2016-09-02', '49.77.1.28'), ('3999', '15', '2', '1', '后台登录', '2016-09-02', '49.77.1.28'), ('4000', '2', '2', '1', '后台登录', '2016-09-02', '49.77.1.28'), ('4001', '14', '2', '1', '后台登录', '2016-09-02', '49.77.1.28'), ('4002', '13', '2', '1', '后台登录', '2016-09-02', '112.2.36.56'), ('4003', '17', '2', '1', '后台登录', '2016-09-02', '112.2.36.56'), ('4004', '13', '2', '1', '后台登录', '2016-09-02', '112.2.36.56'), ('4005', '15', '2', '1', '后台登录', '2016-09-02', '112.2.36.56'), ('4006', '2', '2', '1', '后台登录', '2016-09-02', '112.2.36.56'), ('4007', '2', '2', '1', '后台登录', '2016-09-02', '121.225.91.61'), ('4008', '12', '2', '1', '后台登录', '2016-09-04', '121.229.120.23'), ('4009', '2', '2', '1', '后台登录', '2016-09-04', '121.229.120.23'), ('4010', '14', '2', '1', '后台登录', '2016-09-04', '121.229.120.23'), ('4011', '13', '2', '1', '后台登录', '2016-09-04', '121.229.120.23'), ('4012', '2', '2', '1', '后台登录', '2016-09-04', '121.229.120.23'), ('4013', '2', '2', '1', '后台登录', '2016-09-04', '121.229.120.23'), ('4014', '13', '2', '1', '后台登录', '2016-09-04', '121.225.91.61'), ('4015', '2', '2', '1', '后台登录', '2016-09-04', '180.109.200.153'), ('4016', '2', '2', '1', '后台登录', '2016-09-05', '49.74.85.35'), ('4017', '17', '2', '1', '后台登录', '2016-09-05', '222.94.48.118'), ('4018', '13', '2', '1', '后台登录', '2016-09-05', '222.94.48.118'), ('4019', '15', '2', '1', '后台登录', '2016-09-05', '222.94.48.118'), ('4020', '15', '2', '1', '后台登录', '2016-09-05', '49.74.85.35'), ('4021', '12', '2', '1', '后台登录', '2016-09-05', '49.74.85.35'), ('4022', '2', '2', '1', '后台登录', '2016-09-05', '49.74.85.35'), ('4023', '15', '2', '1', '后台登录', '2016-09-05', '180.109.200.153'), ('4024', '15', '2', '1', '后台登录', '2016-09-05', '180.109.200.153'), ('4025', '15', '2', '1', '后台登录', '2016-09-06', '49.77.226.181'), ('4026', '2', '2', '1', '后台登录', '2016-09-06', '49.77.226.181'), ('4027', '17', '2', '1', '后台登录', '2016-09-06', '112.2.36.56'), ('4028', '13', '2', '1', '后台登录', '2016-09-06', '112.2.36.56'), ('4029', '15', '2', '1', '后台登录', '2016-09-06', '112.2.36.56'), ('4030', '17', '2', '1', '后台登录', '2016-09-06', '112.2.36.56'), ('4031', '13', '2', '1', '后台登录', '2016-09-06', '112.2.36.56'), ('4032', '15', '2', '1', '后台登录', '2016-09-06', '112.2.36.56'), ('4033', '2', '2', '1', '后台登录', '2016-09-06', '112.2.36.56'), ('4034', '17', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4035', '13', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4036', '17', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4037', '2', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4038', '13', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4039', '2', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4040', '15', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4041', '13', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4042', '17', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4043', '15', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4044', '15', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4045', '17', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4046', '17', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4047', '17', '2', '1', '后台登录', '2016-09-06', '180.110.205.215'), ('4048', '15', '2', '1', '后台登录', '2016-09-07', '49.77.226.181'), ('4049', '2', '2', '1', '后台登录', '2016-09-07', '49.77.226.181'), ('4050', '2', '2', '1', '后台登录', '2016-09-07', '49.77.226.181'), ('4051', '2', '2', '1', '后台登录', '2016-09-07', '49.77.226.181'), ('4052', '15', '2', '1', '后台登录', '2016-09-07', '180.110.205.215'), ('4053', '2', '2', '1', '后台登录', '2016-09-07', '49.92.95.109'), ('4054', '2', '2', '1', '后台登录', '2016-09-07', '202.103.114.12'), ('4055', '15', '2', '1', '后台登录', '2016-09-07', '202.103.114.12'), ('4056', '2', '2', '1', '后台登录', '2016-09-08', '180.109.226.89'), ('4057', '2', '2', '1', '后台登录', '2016-09-08', '180.109.226.89'), ('4058', '2', '2', '1', '后台登录', '2016-09-08', '180.109.226.89'), ('4059', '17', '2', '1', '后台登录', '2016-09-11', '183.206.14.55'), ('4060', '15', '2', '1', '后台登录', '2016-09-11', '183.206.14.55'), ('4061', '13', '2', '1', '后台登录', '2016-09-11', '183.206.14.55'), ('4062', '13', '2', '1', '后台登录', '2016-09-11', '114.222.191.113'), ('4063', '2', '2', '1', '后台登录', '2016-09-11', '121.237.199.46'), ('4064', '2', '2', '1', '后台登录', '2016-09-12', '218.94.93.242'), ('4065', '15', '2', '1', '后台登录', '2016-09-12', '112.2.36.56'), ('4066', '13', '2', '1', '后台登录', '2016-09-12', '112.2.36.56'), ('4067', '17', '2', '1', '后台登录', '2016-09-12', '112.2.36.56'), ('4068', '2', '2', '1', '后台登录', '2016-09-12', '112.2.36.56'), ('4069', '2', '2', '1', '后台登录', '2016-09-12', '114.222.54.211'), ('4070', '2', '2', '1', '后台登录', '2016-09-12', '114.222.54.211'), ('4071', '2', '2', '1', '后台登录', '2016-09-12', '49.77.249.253'), ('4072', '2', '2', '1', '后台登录', '2016-09-12', '114.222.54.211'), ('4073', '2', '2', '1', '后台登录', '2016-09-12', '49.77.249.253'), ('4074', '2', '2', '1', '后台登录', '2016-09-12', '114.222.54.211'), ('4075', '2', '2', '1', '后台登录', '2016-09-12', '114.222.54.211'), ('4076', '2', '2', '1', '后台登录', '2016-09-12', '114.222.54.211'), ('4077', '2', '2', '1', '后台登录', '2016-09-12', '114.222.54.211'), ('4078', '2', '2', '1', '后台登录', '2016-09-12', '49.77.249.253'), ('4079', '2', '2', '1', '后台登录', '2016-09-12', '218.94.61.30'), ('4080', '2', '2', '1', '后台登录', '2016-09-14', '112.2.36.56'), ('4081', '17', '2', '1', '后台登录', '2016-09-14', '218.94.93.242'), ('4082', '2', '2', '1', '后台登录', '2016-09-25', '180.111.157.209'), ('4083', '2', '2', '1', '后台登录', '2016-09-26', '49.77.248.243'), ('4084', '13', '2', '1', '后台登录', '2016-09-26', '49.77.248.243'), ('4085', '13', '2', '1', '后台登录', '2016-09-27', '121.237.174.22'), ('4086', '2', '2', '1', '后台登录', '2016-09-27', '222.95.111.193'), ('4087', '13', '2', '1', '后台登录', '2016-09-29', '121.237.174.22'), ('4088', '17', '2', '1', '后台登录', '2016-09-30', '112.2.36.56'), ('4089', '2', '2', '1', '后台登录', '2016-09-30', '221.226.50.142'), ('4090', '15', '2', '1', '后台登录', '2016-10-05', '49.74.85.225'), ('4091', '2', '2', '1', '后台登录', '2016-10-05', '180.109.215.106'), ('4092', '15', '2', '1', '后台登录', '2016-10-09', '222.94.96.198'), ('4093', '17', '2', '1', '后台登录', '2016-10-11', '218.94.93.242'), ('4094', '2', '2', '1', '后台登录', '2016-10-16', '121.237.164.67'), ('4095', '17', '2', '1', '后台登录', '2016-10-17', '218.76.24.248'), ('4096', '17', '2', '1', '后台登录', '2016-10-17', '218.76.24.248'), ('4097', '13', '2', '1', '后台登录', '2016-10-17', '218.76.24.248'), ('4098', '15', '2', '1', '后台登录', '2016-10-17', '202.103.114.12'), ('4099', '13', '2', '1', '后台登录', '2016-10-17', '202.103.114.12'), ('4100', '15', '2', '1', '后台登录', '2016-10-17', '202.103.114.12'), ('4101', '17', '2', '1', '后台登录', '2016-10-17', '202.103.114.12'), ('4102', '17', '2', '1', '后台登录', '2016-10-18', '180.110.200.105'), ('4103', '2', '2', '1', '后台登录', '2016-10-23', '222.94.230.30'), ('4104', '13', '2', '1', '后台登录', '2016-10-23', '222.94.230.30'), ('4105', '13', '2', '1', '后台登录', '2016-10-23', '222.94.230.30'), ('4106', '2', '2', '1', '后台登录', '2016-10-24', '222.94.230.30'), ('4107', '2', '2', '1', '后台登录', '2016-10-30', '180.109.214.146'), ('4108', '2', '2', '1', '后台登录', '2016-10-30', '180.109.214.146'), ('4109', '13', '2', '1', '后台登录', '2016-10-30', '180.109.214.146'), ('4110', '13', '2', '1', '后台登录', '2016-10-31', '112.2.36.56'), ('4111', '17', '2', '1', '后台登录', '2016-10-31', '112.2.36.56'), ('4112', '13', '2', '1', '后台登录', '2016-10-31', '112.2.36.56'), ('4113', '17', '2', '1', '后台登录', '2016-10-31', '112.2.36.56'), ('4114', '2', '2', '1', '后台登录', '2016-10-31', '112.2.36.56'), ('4115', '17', '2', '1', '后台登录', '2016-10-31', '112.2.36.56'), ('4116', '2', '2', '1', '后台登录', '2016-10-31', '218.94.93.242'), ('4117', '15', '2', '1', '后台登录', '2016-11-04', '121.237.194.148'), ('4118', '17', '2', '1', '后台登录', '2016-11-04', '121.237.194.148'), ('4119', '13', '2', '1', '后台登录', '2016-11-04', '121.237.194.148'), ('4120', '17', '2', '1', '后台登录', '2016-11-04', '121.237.194.148'), ('4121', '13', '2', '1', '后台登录', '2016-11-07', '112.2.36.56'), ('4122', '13', '2', '1', '后台登录', '2016-11-07', '112.2.36.56'), ('4123', '2', '2', '1', '后台登录', '2016-11-08', '218.94.93.242'), ('4124', '13', '2', '1', '后台登录', '2016-11-08', '112.2.36.56'), ('4125', '17', '2', '1', '后台登录', '2016-11-08', '112.2.36.56'), ('4126', '2', '2', '1', '后台登录', '2016-11-13', '49.77.157.95'), ('4127', '2', '2', '1', '后台登录', '2016-11-13', '49.77.157.95'), ('4128', '2', '2', '1', '后台登录', '2016-11-13', '114.221.0.189'), ('4129', '2', '2', '1', '后台登录', '2016-11-13', '114.221.0.189'), ('4130', '2', '2', '1', '后台登录', '2016-11-13', '114.221.0.189'), ('4131', '2', '2', '1', '后台登录', '2016-11-14', '117.88.52.14'), ('4132', '15', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4133', '17', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4134', '17', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4135', '2', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4136', '17', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4137', '13', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4138', '15', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4139', '17', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4140', '13', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4141', '12', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4142', '17', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4143', '13', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4144', '2', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4145', '13', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4146', '17', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4147', '2', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4148', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4149', '17', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4150', '13', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4151', '17', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4152', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4153', '13', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4154', '13', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4155', '15', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4156', '15', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4157', '17', '2', '1', '后台登录', '2016-11-23', '112.2.36.56'), ('4158', '2', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4159', '12', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4160', '13', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4161', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4162', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4163', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4164', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4165', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4166', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4167', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4168', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4169', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4170', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4171', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4172', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4173', '17', '2', '1', '后台登录', '2016-11-23', '180.110.180.77'), ('4174', '2', '2', '1', '后台登录', '2016-11-24', '218.94.63.158'), ('4175', '13', '2', '1', '后台登录', '2016-11-24', '218.94.63.158'), ('4176', '17', '2', '1', '后台登录', '2016-11-24', '218.94.63.158'), ('4177', '13', '2', '1', '后台登录', '2016-11-24', '218.94.63.158'), ('4178', '2', '2', '1', '后台登录', '2016-11-24', '218.94.63.158'), ('4179', '13', '2', '1', '后台登录', '2016-11-24', '218.94.63.158'), ('4180', '17', '2', '1', '后台登录', '2016-11-24', '218.94.63.158'), ('4181', '17', '2', '1', '后台登录', '2016-11-24', '218.94.63.158'), ('4182', '13', '2', '1', '后台登录', '2016-11-24', '218.94.63.158'), ('4183', '15', '2', '1', '后台登录', '2016-11-24', '218.94.63.158'), ('4184', '2', '2', '1', '后台登录', '2016-11-24', '218.94.63.158'), ('4185', '17', '2', '1', '后台登录', '2016-11-24', '218.94.63.158'), ('4186', '2', '2', '1', '后台登录', '2016-11-25', '218.94.93.242'), ('4187', '17', '2', '1', '后台登录', '2016-11-25', '218.94.93.242'), ('4188', '17', '2', '1', '后台登录', '2016-11-26', '218.94.93.242'), ('4189', '13', '2', '1', '后台登录', '2016-11-26', '218.94.93.242'), ('4190', '17', '2', '1', '后台登录', '2016-11-26', '218.94.93.242'), ('4191', '2', '2', '1', '后台登录', '2016-12-05', '121.237.199.84'), ('4192', '2', '2', '1', '后台登录', '2016-12-06', '121.237.199.84'), ('4193', '12', '2', '1', '后台登录', '2016-12-06', '121.237.199.84'), ('4194', '15', '2', '1', '后台登录', '2016-12-06', '121.229.94.161'), ('4195', '13', '2', '1', '后台登录', '2016-12-06', '121.229.94.161'), ('4196', '12', '2', '1', '后台登录', '2016-12-06', '121.229.94.161'), ('4197', '13', '2', '1', '后台登录', '2016-12-06', '121.229.94.161'), ('4198', '13', '2', '1', '后台登录', '2016-12-06', '121.229.94.161'), ('4199', '13', '2', '1', '后台登录', '2016-12-07', '121.237.195.49'), ('4200', '13', '2', '1', '后台登录', '2016-12-07', '121.237.195.49'), ('4201', '2', '2', '1', '后台登录', '2016-12-08', '120.197.196.176'), ('4202', '13', '2', '1', '后台登录', '2016-12-08', '121.237.195.49'), ('4203', '17', '2', '1', '后台登录', '2016-12-08', '121.237.195.49'), ('4204', '15', '2', '1', '后台登录', '2016-12-08', '121.237.195.49'), ('4205', '2', '2', '1', '后台登录', '2016-12-08', '58.213.134.58'), ('4206', '17', '2', '1', '后台登录', '2016-12-08', '121.237.195.49'), ('4207', '2', '2', '1', '后台登录', '2016-12-08', '49.77.156.128'), ('4208', '17', '2', '1', '后台登录', '2016-12-08', '112.2.36.56'), ('4209', '2', '2', '1', '后台登录', '2016-12-08', '112.2.36.56'), ('4210', '17', '2', '1', '后台登录', '2016-12-08', '112.2.36.56'), ('4211', '17', '2', '1', '后台登录', '2016-12-08', '112.2.36.56'), ('4212', '13', '2', '1', '后台登录', '2016-12-08', '112.2.36.56'), ('4213', '15', '2', '1', '后台登录', '2016-12-08', '112.2.36.56'), ('4214', '13', '2', '1', '后台登录', '2016-12-08', '112.2.36.56'), ('4215', '2', '2', '1', '后台登录', '2016-12-08', '112.2.36.56'), ('4216', '15', '2', '1', '后台登录', '2016-12-08', '112.2.36.56'), ('4217', '13', '2', '1', '后台登录', '2016-12-08', '112.2.36.56'), ('4218', '17', '2', '1', '后台登录', '2016-12-08', '112.2.36.56'), ('4219', '15', '2', '1', '后台登录', '2016-12-09', '222.95.154.102'), ('4220', '15', '2', '1', '后台登录', '2016-12-09', '121.237.195.49'), ('4221', '17', '2', '1', '后台登录', '2016-12-09', '121.237.195.49'), ('4222', '13', '2', '1', '后台登录', '2016-12-09', '121.237.195.49'), ('4223', '17', '2', '1', '后台登录', '2016-12-09', '121.237.195.49'), ('4224', '13', '2', '1', '后台登录', '2016-12-09', '121.237.195.49'), ('4225', '17', '2', '1', '后台登录', '2016-12-09', '121.237.195.49'), ('4226', '13', '2', '1', '后台登录', '2016-12-09', '58.212.13.227'), ('4227', '15', '2', '1', '后台登录', '2016-12-09', '49.77.156.128'), ('4228', '12', '2', '1', '后台登录', '2016-12-09', '49.77.156.128'), ('4229', '13', '2', '1', '后台登录', '2016-12-09', '49.77.156.128'), ('4230', '2', '2', '1', '后台登录', '2016-12-10', '49.74.36.112'), ('4231', '2', '2', '1', '后台登录', '2016-12-10', '49.74.36.112'), ('4232', '2', '2', '1', '后台登录', '2016-12-10', '49.74.36.112'), ('4233', '17', '2', '1', '后台登录', '2016-12-11', '112.86.253.111'), ('4234', '17', '2', '1', '后台登录', '2016-12-11', '112.86.253.111'), ('4235', '13', '2', '1', '后台登录', '2016-12-11', '112.86.253.111'), ('4236', '2', '2', '1', '后台登录', '2016-12-11', '112.86.253.111'), ('4237', '2', '2', '1', '后台登录', '2016-12-12', '58.213.134.58'), ('4238', '2', '2', '1', '后台登录', '2016-12-12', '117.89.93.70'), ('4239', '2', '2', '1', '后台登录', '2016-12-12', '117.89.93.70'), ('4240', '13', '2', '1', '后台登录', '2016-12-12', '117.89.93.70'), ('4241', '2', '2', '1', '后台登录', '2016-12-12', '117.89.93.70'), ('4242', '13', '2', '1', '后台登录', '2016-12-12', '117.89.93.70'), ('4243', '17', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4244', '13', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4245', '17', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4246', '13', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4247', '17', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4248', '13', '2', '1', '后台登录', '2016-12-13', '58.213.134.58'), ('4249', '12', '2', '1', '后台登录', '2016-12-13', '58.213.134.58'), ('4250', '15', '2', '1', '后台登录', '2016-12-13', '58.213.134.58'), ('4251', '13', '2', '1', '后台登录', '2016-12-13', '58.213.134.58'), ('4252', '12', '2', '1', '后台登录', '2016-12-13', '58.213.134.58'), ('4253', '17', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4254', '17', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4255', '17', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4256', '13', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4257', '17', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4258', '13', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4259', '15', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4260', '13', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4261', '15', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4262', '13', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4263', '15', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4264', '2', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4265', '15', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4266', '12', '2', '1', '后台登录', '2016-12-13', '49.74.84.90'), ('4267', '17', '2', '1', '后台登录', '2016-12-13', '112.2.36.56'), ('4268', '17', '2', '1', '后台登录', '2016-12-13', '218.94.93.242'), ('4269', '17', '2', '1', '后台登录', '2016-12-14', '112.2.36.56'), ('4270', '13', '2', '1', '后台登录', '2016-12-14', '58.213.134.58'), ('4271', '2', '2', '1', '后台登录', '2016-12-14', '58.213.134.58'), ('4272', '12', '2', '1', '后台登录', '2016-12-14', '58.213.134.58'), ('4273', '2', '2', '1', '后台登录', '2016-12-14', '58.213.134.58'), ('4274', '17', '2', '1', '后台登录', '2016-12-14', '58.213.134.58'), ('4275', '17', '2', '1', '后台登录', '2016-12-14', '218.94.93.242'), ('4276', '2', '2', '1', '后台登录', '2016-12-14', '180.109.212.69'), ('4277', '2', '2', '1', '后台登录', '2016-12-14', '180.109.212.69'), ('4278', '2', '2', '1', '后台登录', '2016-12-18', '121.225.48.103'), ('4279', '2', '2', '1', '后台登录', '2016-12-18', '121.225.48.103'), ('4280', '12', '2', '1', '后台登录', '2016-12-18', '121.225.48.103'), ('4281', '13', '2', '1', '后台登录', '2016-12-18', '121.225.48.103'), ('4282', '2', '2', '1', '后台登录', '2016-12-18', '121.225.48.103'), ('4283', '15', '2', '1', '后台登录', '2016-12-18', '121.225.48.103'), ('4284', '17', '2', '1', '后台登录', '2016-12-19', '112.2.36.56'), ('4285', '13', '2', '1', '后台登录', '2016-12-19', '112.2.36.56'), ('4286', '15', '2', '1', '后台登录', '2016-12-19', '112.2.36.56'), ('4287', '2', '2', '1', '后台登录', '2016-12-19', '112.2.36.56'), ('4288', '15', '2', '1', '后台登录', '2016-12-19', '58.213.134.58'), ('4289', '12', '2', '1', '后台登录', '2016-12-19', '49.77.189.151'), ('4290', '2', '2', '1', '后台登录', '2016-12-19', '49.77.189.151'), ('4291', '2', '2', '1', '后台登录', '2016-12-20', '49.65.117.39'), ('4292', '2', '2', '1', '后台登录', '2016-12-20', '49.65.117.39'), ('4293', '2', '2', '1', '后台登录', '2016-12-20', '114.221.129.74'), ('4294', '17', '2', '1', '后台登录', '2016-12-21', '112.2.36.56'), ('4295', '17', '2', '1', '后台登录', '2016-12-21', '112.2.36.56'), ('4296', '13', '2', '1', '后台登录', '2016-12-21', '112.2.36.56'), ('4297', '17', '2', '1', '后台登录', '2016-12-21', '112.2.36.56'), ('4298', '13', '2', '1', '后台登录', '2016-12-21', '180.111.196.36'), ('4299', '17', '2', '1', '后台登录', '2016-12-22', '61.155.235.226'), ('4300', '13', '2', '1', '后台登录', '2016-12-22', '218.76.24.248'), ('4301', '15', '2', '1', '后台登录', '2016-12-22', '218.76.24.248'), ('4302', '17', '2', '1', '后台登录', '2016-12-22', '218.76.24.248'), ('4303', '17', '2', '1', '后台登录', '2016-12-22', '61.155.235.226'), ('4304', '2', '2', '1', '后台登录', '2016-12-22', '218.76.24.248'), ('4305', '17', '2', '1', '后台登录', '2016-12-22', '112.2.36.56'), ('4306', '13', '2', '1', '后台登录', '2016-12-22', '112.2.36.56'), ('4307', '17', '2', '1', '后台登录', '2016-12-22', '112.2.36.56'), ('4308', '2', '2', '1', '后台登录', '2016-12-22', '49.77.189.74'), ('4309', '13', '2', '1', '后台登录', '2016-12-22', '112.2.36.56'), ('4310', '15', '2', '1', '后台登录', '2016-12-22', '112.2.36.56'), ('4311', '13', '2', '1', '后台登录', '2016-12-22', '112.2.36.56'), ('4312', '17', '2', '1', '后台登录', '2016-12-22', '61.155.235.226'), ('4313', '15', '2', '1', '后台登录', '2016-12-22', '112.2.36.56'), ('4314', '13', '2', '1', '后台登录', '2016-12-22', '61.155.235.226'), ('4315', '2', '2', '1', '后台登录', '2016-12-22', '49.77.189.74'), ('4316', '17', '2', '1', '后台登录', '2016-12-22', '112.2.36.56'), ('4317', '2', '2', '1', '后台登录', '2016-12-22', '61.155.235.226'), ('4318', '2', '2', '1', '后台登录', '2016-12-22', '61.155.235.226'), ('4319', '17', '2', '1', '后台登录', '2016-12-22', '112.2.36.56'), ('4320', '2', '2', '1', '后台登录', '2016-12-22', '61.155.235.226'), ('4321', '13', '2', '1', '后台登录', '2016-12-22', '112.80.127.75'), ('4322', '15', '2', '1', '后台登录', '2016-12-22', '112.80.127.75'), ('4323', '13', '2', '1', '后台登录', '2016-12-22', '112.80.127.75'), ('4324', '15', '2', '1', '后台登录', '2016-12-22', '112.80.127.75'), ('4325', '13', '2', '1', '后台登录', '2016-12-22', '112.80.127.75'), ('4326', '15', '2', '1', '后台登录', '2016-12-22', '112.80.127.75'), ('4327', '2', '2', '1', '后台登录', '2016-12-22', '112.80.127.75'), ('4328', '17', '2', '1', '后台登录', '2016-12-23', '112.80.127.75'), ('4329', '13', '2', '1', '后台登录', '2016-12-23', '112.80.127.75'), ('4330', '17', '2', '1', '后台登录', '2016-12-23', '218.94.63.158'), ('4331', '13', '2', '1', '后台登录', '2016-12-23', '218.94.63.158'), ('4332', '15', '2', '1', '后台登录', '2016-12-23', '218.94.63.158'), ('4333', '2', '2', '1', '后台登录', '2016-12-23', '218.94.63.158'), ('4334', '13', '2', '1', '后台登录', '2016-12-23', '218.94.63.158'), ('4335', '13', '2', '1', '后台登录', '2016-12-23', '218.94.63.158'), ('4336', '17', '2', '1', '后台登录', '2016-12-23', '218.94.63.158'), ('4337', '17', '2', '1', '后台登录', '2017-02-11', '117.93.147.209'), ('4338', '17', '2', '1', '后台登录', '2017-02-11', '117.93.147.209'), ('4339', '17', '2', '1', '后台登录', '2017-02-11', '117.93.147.209'), ('4340', '13', '2', '1', '后台登录', '2017-02-11', '117.93.147.209'), ('4341', '15', '2', '1', '后台登录', '2017-02-11', '117.93.147.209'), ('4342', '17', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4343', '13', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4344', '15', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4345', '2', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4346', '17', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4347', '13', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4348', '13', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4349', '12', '2', '1', '后台登录', '2017-02-13', '58.213.134.58'), ('4350', '13', '2', '1', '后台登录', '2017-02-13', '58.213.134.58'), ('4351', '2', '2', '1', '后台登录', '2017-02-13', '58.213.134.58'), ('4352', '15', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4353', '2', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4354', '2', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4355', '15', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4356', '15', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4357', '2', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4358', '22', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4359', '24', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4360', '25', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4361', '26', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4362', '23', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4363', '27', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4364', '2', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4365', '2', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4366', '2', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4367', '28', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4368', '17', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4369', '28', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4370', '13', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4371', '17', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4372', '13', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4373', '28', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4374', '2', '2', '1', '后台登录', '2017-02-13', '61.155.235.226'), ('4375', '2', '2', '1', '后台登录', '2017-02-13', '180.111.116.197'), ('4376', '2', '2', '1', '后台登录', '2017-02-13', '180.111.116.197'), ('4377', '17', '2', '1', '后台登录', '2017-02-14', '61.155.235.226'), ('4378', '17', '2', '1', '后台登录', '2017-02-14', '61.155.235.226'), ('4379', '13', '2', '1', '后台登录', '2017-02-14', '58.213.134.58'), ('4380', '2', '2', '1', '后台登录', '2017-02-14', '58.213.134.58'), ('4381', '13', '2', '1', '后台登录', '2017-02-14', '58.212.22.70'), ('4382', '13', '2', '1', '后台登录', '2017-02-14', '58.212.22.70'), ('4383', '2', '2', '1', '后台登录', '2017-02-15', '49.77.189.84'), ('4384', '13', '2', '1', '后台登录', '2017-02-15', '49.77.189.84'), ('4385', '2', '2', '1', '后台登录', '2017-02-15', '49.77.189.84'), ('4386', '12', '2', '1', '后台登录', '2017-02-15', '58.212.22.70'), ('4387', '13', '2', '1', '后台登录', '2017-02-15', '58.212.22.70'), ('4388', '13', '2', '1', '后台登录', '2017-02-15', '58.212.22.70'), ('4389', '12', '2', '1', '后台登录', '2017-02-15', '58.212.22.70'), ('4390', '2', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4391', '34', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4392', '38', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4393', '39', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4394', '37', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4395', '37', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4396', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4397', '2', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4398', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4399', '41', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4400', '24', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4401', '2', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4402', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4403', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4404', '22', '2', '1', '后台登录', '2017-02-16', '221.226.84.218'), ('4405', '13', '2', '1', '后台登录', '2017-02-16', '58.213.134.58'), ('4406', '24', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4407', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4408', '42', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4409', '43', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4410', '15', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4411', '42', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4412', '43', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4413', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4414', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4415', '39', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4416', '2', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4417', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4418', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4419', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4420', '22', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4421', '45', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4422', '34', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4423', '24', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4424', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4425', '47', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4426', '22', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4427', '2', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4428', '48', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4429', '22', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4430', '50', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4431', '26', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4432', '2', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4433', '26', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4434', '23', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4435', '2', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4436', '23', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4437', '48', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4438', '44', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4439', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4440', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4441', '58', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4442', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4443', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4444', '58', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4445', '58', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4446', '59', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4447', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4448', '26', '2', '1', '后台登录', '2017-02-16', '58.221.239.14'), ('4449', '60', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4450', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4451', '26', '2', '1', '后台登录', '2017-02-16', '58.221.239.14'), ('4452', '22', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4453', '24', '2', '1', '后台登录', '2017-02-16', '61.155.235.226'), ('4454', '68', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4455', '24', '2', '1', '后台登录', '2017-02-16', '58.216.242.248'), ('4456', '58', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4457', '25', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4458', '51', '2', '1', '后台登录', '2017-02-16', '58.221.239.14'), ('4459', '58', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4460', '24', '2', '1', '后台登录', '2017-02-16', '58.216.242.248'), ('4461', '47', '2', '1', '后台登录', '2017-02-16', '222.185.241.190'), ('4462', '67', '2', '1', '后台登录', '2017-02-16', '222.187.126.162'), ('4463', '46', '2', '1', '后台登录', '2017-02-16', '218.93.112.210'), ('4464', '46', '2', '1', '后台登录', '2017-02-16', '218.93.112.210'), ('4465', '46', '2', '1', '后台登录', '2017-02-16', '218.93.112.210'), ('4466', '26', '2', '1', '后台登录', '2017-02-16', '58.221.239.14'), ('4467', '24', '2', '1', '后台登录', '2017-02-16', '58.216.242.248'), ('4468', '51', '2', '1', '后台登录', '2017-02-17', '58.221.239.14'), ('4469', '26', '2', '1', '后台登录', '2017-02-17', '58.221.239.14'), ('4470', '51', '2', '1', '后台登录', '2017-02-17', '58.221.239.14'), ('4471', '23', '2', '1', '后台登录', '2017-02-17', '218.90.243.181'), ('4472', '53', '2', '1', '后台登录', '2017-02-17', '218.90.243.181'), ('4473', '23', '2', '1', '后台登录', '2017-02-17', '218.90.243.181'), ('4474', '26', '2', '1', '后台登录', '2017-02-17', '58.221.239.14'), ('4475', '67', '2', '1', '后台登录', '2017-02-17', '114.234.175.186'), ('4476', '26', '2', '1', '后台登录', '2017-02-17', '58.221.239.14'), ('4477', '51', '2', '1', '后台登录', '2017-02-17', '58.221.239.14'), ('4478', '52', '2', '1', '后台登录', '2017-02-17', '58.221.239.14'), ('4479', '67', '2', '1', '后台登录', '2017-02-17', '114.234.175.186'), ('4480', '51', '2', '1', '后台登录', '2017-02-17', '58.221.239.14'), ('4481', '2', '2', '1', '后台登录', '2017-02-19', '121.229.108.244'), ('4482', '51', '2', '1', '后台登录', '2017-02-20', '58.221.239.14'), ('4483', '49', '2', '1', '后台登录', '2017-02-20', '221.226.215.90'), ('4484', '49', '2', '1', '后台登录', '2017-02-20', '58.213.138.194'), ('4485', '49', '2', '1', '后台登录', '2017-02-20', '114.221.176.244'), ('4486', '49', '2', '1', '后台登录', '2017-02-20', '222.94.177.118'), ('4487', '49', '2', '1', '后台登录', '2017-02-20', '121.225.13.179'), ('4488', '49', '2', '1', '后台登录', '2017-02-20', '121.225.13.179'), ('4489', '49', '2', '1', '后台登录', '2017-02-20', '221.226.29.94'), ('4490', '49', '2', '1', '后台登录', '2017-02-20', '180.102.109.13'), ('4491', '49', '2', '1', '后台登录', '2017-02-20', '117.89.132.188'), ('4492', '49', '2', '1', '后台登录', '2017-02-20', '49.74.42.164'), ('4493', '49', '2', '1', '后台登录', '2017-02-20', '114.221.176.244'), ('4494', '49', '2', '1', '后台登录', '2017-02-20', '222.94.177.118'), ('4495', '49', '2', '1', '后台登录', '2017-02-20', '58.213.138.194'), ('4496', '49', '2', '1', '后台登录', '2017-02-20', '49.74.42.164'), ('4497', '49', '2', '1', '后台登录', '2017-02-20', '180.110.239.70'), ('4498', '2', '2', '1', '后台登录', '2017-02-20', '61.155.235.226'), ('4499', '22', '2', '1', '后台登录', '2017-02-20', '61.155.235.226'), ('4500', '2', '2', '1', '后台登录', '2017-02-20', '61.155.235.226'), ('4501', '71', '2', '1', '后台登录', '2017-02-20', '61.155.235.226'), ('4502', '15', '2', '1', '后台登录', '2017-02-20', '61.155.235.226'), ('4503', '2', '2', '1', '后台登录', '2017-02-20', '61.155.235.226'), ('4504', '25', '2', '1', '后台登录', '2017-02-20', '61.155.235.226'), ('4505', '49', '2', '1', '后台登录', '2017-02-20', '180.102.109.13'), ('4506', '49', '2', '1', '后台登录', '2017-02-20', '180.110.239.70'), ('4507', '49', '2', '1', '后台登录', '2017-02-20', '180.111.168.123'), ('4508', '2', '2', '1', '后台登录', '2017-02-20', '180.98.110.111'), ('4509', '26', '2', '1', '后台登录', '2017-02-20', '58.221.239.14'), ('4510', '26', '2', '1', '后台登录', '2017-02-20', '58.221.239.14'), ('4511', '50', '2', '1', '后台登录', '2017-02-20', '114.222.179.102'), ('4512', '49', '2', '1', '后台登录', '2017-02-20', '58.213.138.194'), ('4513', '2', '2', '1', '后台登录', '2017-02-20', '61.155.235.226'), ('4514', '2', '2', '1', '后台登录', '2017-02-20', '61.155.235.226'), ('4515', '54', '2', '1', '后台登录', '2017-02-20', '221.230.133.154'), ('4516', '54', '2', '1', '后台登录', '2017-02-21', '221.230.133.154'), ('4517', '72', '2', '1', '后台登录', '2017-02-21', '61.155.235.226'), ('4518', '49', '2', '1', '后台登录', '2017-02-21', '114.221.177.49'), ('4519', '26', '2', '1', '后台登录', '2017-02-21', '58.221.239.14'), ('4520', '51', '2', '1', '后台登录', '2017-02-21', '58.221.239.14'), ('4521', '26', '2', '1', '后台登录', '2017-02-21', '58.221.239.14'), ('4522', '51', '2', '1', '后台登录', '2017-02-21', '58.221.239.14'), ('4523', '2', '2', '1', '后台登录', '2017-02-21', '61.155.235.226'), ('4524', '54', '2', '1', '后台登录', '2017-02-21', '221.230.133.154'), ('4525', '49', '2', '1', '后台登录', '2017-02-21', '58.213.138.194');
INSERT INTO `t_operate_record` VALUES ('4526', '49', '2', '1', '后台登录', '2017-02-21', '180.102.97.214'), ('4527', '54', '2', '1', '后台登录', '2017-02-21', '221.230.133.154'), ('4528', '51', '2', '1', '后台登录', '2017-02-21', '58.221.239.14'), ('4529', '51', '2', '1', '后台登录', '2017-02-21', '58.221.239.14'), ('4530', '2', '2', '1', '后台登录', '2017-02-21', '61.155.235.226'), ('4531', '25', '2', '1', '后台登录', '2017-02-21', '222.187.126.162'), ('4532', '68', '2', '1', '后台登录', '2017-02-21', '222.187.126.162'), ('4533', '67', '2', '1', '后台登录', '2017-02-21', '222.187.126.162'), ('4534', '53', '2', '1', '后台登录', '2017-02-21', '122.194.119.155'), ('4535', '23', '2', '1', '后台登录', '2017-02-21', '218.90.243.181'), ('4536', '54', '2', '1', '后台登录', '2017-02-21', '221.230.133.154'), ('4537', '54', '2', '1', '后台登录', '2017-02-21', '221.230.133.154'), ('4538', '72', '2', '1', '后台登录', '2017-02-21', '61.155.235.226'), ('4539', '49', '2', '1', '后台登录', '2017-02-21', '58.240.140.19'), ('4540', '68', '2', '1', '后台登录', '2017-02-21', '221.229.255.234'), ('4541', '49', '2', '1', '后台登录', '2017-02-21', '112.80.92.68'), ('4542', '50', '2', '1', '后台登录', '2017-02-22', '180.110.48.95'), ('4543', '49', '2', '1', '后台登录', '2017-02-22', '221.226.186.2'), ('4544', '2', '2', '1', '后台登录', '2017-02-22', '61.155.235.226'), ('4545', '67', '2', '1', '后台登录', '2017-02-22', '180.125.255.75'), ('4546', '49', '2', '1', '后台登录', '2017-02-22', '221.226.186.2'), ('4547', '49', '2', '1', '后台登录', '2017-02-22', '221.226.186.2'), ('4548', '49', '2', '1', '后台登录', '2017-02-22', '221.226.186.2'), ('4549', '49', '2', '1', '后台登录', '2017-02-22', '114.221.183.153'), ('4550', '49', '2', '1', '后台登录', '2017-02-22', '221.226.29.94'), ('4551', '49', '2', '1', '后台登录', '2017-02-22', '114.221.183.153'), ('4552', '49', '2', '1', '后台登录', '2017-02-22', '117.88.191.120'), ('4553', '51', '2', '1', '后台登录', '2017-02-22', '58.221.239.14'), ('4554', '51', '2', '1', '后台登录', '2017-02-22', '58.221.239.14'), ('4555', '51', '2', '1', '后台登录', '2017-02-22', '58.221.239.14'), ('4556', '26', '2', '1', '后台登录', '2017-02-22', '58.221.239.14'), ('4557', '49', '2', '1', '后台登录', '2017-02-22', '49.77.173.91'), ('4558', '68', '2', '1', '后台登录', '2017-02-22', '222.187.126.162'), ('4559', '67', '2', '1', '后台登录', '2017-02-22', '222.187.126.162'), ('4560', '2', '2', '1', '后台登录', '2017-02-22', '114.221.143.25'), ('4561', '50', '2', '1', '后台登录', '2017-02-23', '121.237.241.92'), ('4562', '67', '2', '1', '后台登录', '2017-02-23', '180.125.255.75'), ('4563', '47', '2', '1', '后台登录', '2017-02-23', '58.216.242.248'), ('4564', '2', '2', '1', '后台登录', '2017-02-23', '58.213.134.58'), ('4565', '15', '2', '1', '后台登录', '2017-02-23', '58.213.134.58'), ('4566', '67', '2', '1', '后台登录', '2017-02-23', '180.125.255.75'), ('4567', '68', '2', '1', '后台登录', '2017-02-23', '221.229.255.234'), ('4568', '2', '2', '1', '后台登录', '2017-02-23', '61.155.235.226'), ('4569', '46', '2', '1', '后台登录', '2017-02-23', '218.93.112.210'), ('4570', '67', '2', '1', '后台登录', '2017-02-23', '180.125.255.75'), ('4571', '46', '2', '1', '后台登录', '2017-02-24', '218.93.112.210'), ('4572', '46', '2', '1', '后台登录', '2017-02-24', '218.93.112.210'), ('4573', '46', '2', '1', '后台登录', '2017-02-24', '218.93.112.210'), ('4574', '46', '2', '1', '后台登录', '2017-02-24', '218.93.112.210'), ('4575', '46', '2', '1', '后台登录', '2017-02-24', '218.93.112.210'), ('4576', '46', '2', '1', '后台登录', '2017-02-24', '218.93.112.210'), ('4577', '46', '2', '1', '后台登录', '2017-02-24', '218.93.112.210'), ('4578', '47', '2', '1', '后台登录', '2017-02-24', '222.185.241.190'), ('4579', '46', '2', '1', '后台登录', '2017-02-24', '218.93.112.210'), ('4580', '67', '2', '1', '后台登录', '2017-02-24', '180.125.255.75'), ('4581', '50', '2', '1', '后台登录', '2017-02-24', '121.237.241.92'), ('4582', '49', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4583', '51', '2', '1', '后台登录', '2017-02-24', '58.221.239.14'), ('4584', '26', '2', '1', '后台登录', '2017-02-24', '58.221.239.14'), ('4585', '50', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4586', '22', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4587', '44', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4588', '2', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4589', '67', '2', '1', '后台登录', '2017-02-24', '222.187.126.162'), ('4590', '25', '2', '1', '后台登录', '2017-02-24', '222.187.126.162'), ('4591', '22', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4592', '72', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4593', '25', '2', '1', '后台登录', '2017-02-24', '222.187.126.162'), ('4594', '15', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4595', '22', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4596', '67', '2', '1', '后台登录', '2017-02-24', '222.187.126.162'), ('4597', '15', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4598', '2', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4599', '22', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4600', '25', '2', '1', '后台登录', '2017-02-24', '222.187.126.162'), ('4601', '67', '2', '1', '后台登录', '2017-02-24', '222.187.126.162'), ('4602', '46', '2', '1', '后台登录', '2017-02-24', '218.93.112.210'), ('4603', '49', '2', '1', '后台登录', '2017-02-24', '222.95.81.47'), ('4604', '22', '2', '1', '后台登录', '2017-02-24', '180.109.128.22'), ('4605', '44', '2', '1', '后台登录', '2017-02-24', '180.109.128.22'), ('4606', '2', '2', '1', '后台登录', '2017-02-24', '180.109.128.22'), ('4607', '68', '2', '1', '后台登录', '2017-02-24', '221.229.255.234'), ('4608', '2', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4609', '22', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4610', '2', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4611', '74', '2', '1', '后台登录', '2017-02-24', '180.109.128.22'), ('4612', '74', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4613', '73', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4614', '49', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4615', '73', '2', '1', '后台登录', '2017-02-24', '180.109.128.22'), ('4616', '2', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4617', '49', '2', '1', '后台登录', '2017-02-24', '180.109.128.22'), ('4618', '2', '2', '1', '后台登录', '2017-02-24', '180.109.128.22'), ('4619', '50', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4620', '49', '2', '1', '后台登录', '2017-02-24', '180.109.128.22'), ('4621', '2', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4622', '2', '2', '1', '后台登录', '2017-02-24', '180.109.128.22'), ('4623', '75', '2', '1', '后台登录', '2017-02-24', '180.109.128.22'), ('4624', '75', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4625', '50', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4626', '2', '2', '1', '后台登录', '2017-02-24', '180.109.128.22'), ('4627', '49', '2', '1', '后台登录', '2017-02-24', '180.109.128.22'), ('4628', '2', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4629', '2', '2', '1', '后台登录', '2017-02-24', '180.109.128.22'), ('4630', '50', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4631', '49', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4632', '22', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4633', '22', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4634', '51', '2', '1', '后台登录', '2017-02-24', '58.221.239.14'), ('4635', '51', '2', '1', '后台登录', '2017-02-24', '58.221.239.14'), ('4636', '25', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4637', '68', '2', '1', '后台登录', '2017-02-24', '221.229.255.234'), ('4638', '22', '2', '1', '后台登录', '2017-02-24', '61.155.235.226'), ('4639', '68', '2', '1', '后台登录', '2017-02-24', '221.229.255.234'), ('4640', '22', '2', '1', '后台登录', '2017-02-26', '117.89.77.7'), ('4641', '44', '2', '1', '后台登录', '2017-02-26', '117.89.77.7'), ('4642', '55', '2', '1', '后台登录', '2017-02-26', '117.89.77.7'), ('4643', '44', '2', '1', '后台登录', '2017-02-26', '117.89.77.7'), ('4644', '2', '2', '1', '后台登录', '2017-02-26', '117.89.77.7'), ('4645', '46', '2', '1', '后台登录', '2017-02-27', '218.93.112.210'), ('4646', '46', '2', '1', '后台登录', '2017-02-27', '218.93.112.210'), ('4647', '51', '2', '1', '后台登录', '2017-02-27', '58.221.239.14'), ('4648', '68', '2', '1', '后台登录', '2017-02-27', '221.229.255.234'), ('4649', '51', '2', '1', '后台登录', '2017-02-27', '58.221.239.14'), ('4650', '22', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4651', '44', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4652', '49', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4653', '15', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4654', '54', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4655', '2', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4656', '25', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4657', '2', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4658', '15', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4659', '25', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4660', '15', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4661', '72', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4662', '2', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4663', '71', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4664', '15', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4665', '47', '2', '1', '后台登录', '2017-02-27', '222.185.241.190'), ('4666', '25', '2', '1', '后台登录', '2017-02-27', '222.187.126.162'), ('4667', '72', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4668', '71', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4669', '49', '2', '1', '后台登录', '2017-02-27', '222.95.81.168'), ('4670', '2', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4671', '71', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4672', '68', '2', '1', '后台登录', '2017-02-27', '221.229.255.234'), ('4673', '72', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4674', '2', '2', '1', '后台登录', '2017-02-27', '58.213.103.2'), ('4675', '72', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4676', '2', '2', '1', '后台登录', '2017-02-27', '58.213.103.2'), ('4677', '68', '2', '1', '后台登录', '2017-02-27', '221.229.255.234'), ('4678', '71', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4679', '72', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4680', '72', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4681', '68', '2', '1', '后台登录', '2017-02-27', '221.229.255.234'), ('4682', '26', '2', '1', '后台登录', '2017-02-27', '58.221.239.14'), ('4683', '71', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4684', '2', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4685', '25', '2', '1', '后台登录', '2017-02-27', '61.155.235.226'), ('4686', '47', '2', '1', '后台登录', '2017-02-28', '222.185.241.190'), ('4687', '46', '2', '1', '后台登录', '2017-02-28', '218.93.112.210'), ('4688', '24', '2', '1', '后台登录', '2017-02-28', '58.216.242.248'), ('4689', '24', '2', '1', '后台登录', '2017-02-28', '58.216.242.248'), ('4690', '24', '2', '1', '后台登录', '2017-02-28', '58.216.242.248'), ('4691', '22', '2', '1', '后台登录', '2017-02-28', '180.109.195.86'), ('4692', '71', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4693', '72', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4694', '71', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4695', '25', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4696', '68', '2', '1', '后台登录', '2017-02-28', '221.229.255.234'), ('4697', '25', '2', '1', '后台登录', '2017-02-28', '222.187.126.162'), ('4698', '68', '2', '1', '后台登录', '2017-02-28', '221.229.255.234'), ('4699', '72', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4700', '71', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4701', '72', '2', '1', '后台登录', '2017-02-28', '180.109.195.86'), ('4702', '72', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4703', '71', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4704', '72', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4705', '71', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4706', '72', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4707', '71', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4708', '72', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4709', '71', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4710', '72', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4711', '72', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4712', '71', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4713', '72', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4714', '71', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4715', '72', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4716', '71', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4717', '72', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4718', '71', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4719', '72', '2', '1', '后台登录', '2017-02-28', '61.155.235.226'), ('4720', '2', '2', '1', '后台登录', '2017-03-10', '49.65.117.90'), ('4721', '72', '2', '1', '后台登录', '2017-03-13', '61.155.235.226'), ('4722', '71', '2', '1', '后台登录', '2017-03-13', '61.155.235.226'), ('4723', '72', '2', '1', '后台登录', '2017-03-13', '61.155.235.226'), ('4724', '72', '2', '1', '后台登录', '2017-03-15', '61.155.235.226'), ('4725', '72', '2', '1', '后台登录', '2017-03-15', '61.155.235.226'), ('4726', '71', '2', '1', '后台登录', '2017-03-15', '61.155.235.226'), ('4727', '76', '2', '1', '后台登录', '2017-03-15', '61.155.235.226'), ('4728', '2', '2', '1', '后台登录', '2017-03-16', '127.0.0.1'), ('4729', '2', '2', '1', '后台登录', '2017-03-16', '127.0.0.1'), ('4730', '68', '2', '1', '后台登录', '2017-03-17', '221.229.255.234'), ('4731', '68', '2', '1', '后台登录', '2017-03-17', '221.229.255.234'), ('4732', '68', '2', '1', '后台登录', '2017-03-17', '221.229.255.234'), ('4733', '2', '2', '1', '后台登录', '2017-03-17', '49.77.179.90'), ('4734', '72', '2', '1', '后台登录', '2017-03-17', '61.155.235.226'), ('4735', '72', '2', '1', '后台登录', '2017-03-17', '61.155.235.226'), ('4736', '72', '2', '1', '后台登录', '2017-03-17', '61.155.235.226'), ('4737', '2', '2', '1', '后台登录', '2017-03-17', '180.109.196.19'), ('4738', '72', '2', '1', '后台登录', '2017-03-17', '61.155.235.226'), ('4739', '72', '2', '1', '后台登录', '2017-03-17', '180.109.196.19'), ('4740', '72', '2', '1', '后台登录', '2017-03-17', '49.77.179.90'), ('4741', '2', '2', '1', '后台登录', '2017-03-17', '180.109.196.19'), ('4742', '15', '2', '1', '后台登录', '2017-03-17', '49.77.179.90'), ('4743', '15', '2', '1', '后台登录', '2017-03-17', '49.77.179.90'), ('4744', '76', '2', '1', '后台登录', '2017-03-17', '180.109.196.19'), ('4745', '2', '2', '1', '后台登录', '2017-03-17', '180.109.196.19'), ('4746', '26', '2', '1', '后台登录', '2017-03-17', '180.109.196.19'), ('4747', '72', '2', '1', '后台登录', '2017-03-17', '127.0.0.1'), ('4748', '72', '2', '1', '后台登录', '2017-03-17', '127.0.0.1'), ('4749', '72', '2', '1', '后台登录', '2017-03-17', '127.0.0.1'), ('4750', '72', '2', '1', '后台登录', '2017-03-17', '61.155.235.226'), ('4751', '72', '2', '1', '后台登录', '2017-03-17', '121.237.172.44'), ('4752', '71', '2', '1', '后台登录', '2017-03-17', '61.155.235.226'), ('4753', '15', '2', '1', '后台登录', '2017-03-17', '61.155.235.226'), ('4754', '2', '2', '1', '后台登录', '2017-03-17', '61.155.235.226'), ('4755', '72', '2', '1', '后台登录', '2017-03-17', '117.62.196.254'), ('4756', '2', '2', '1', '后台登录', '2017-03-17', '117.62.196.254'), ('4757', '72', '2', '1', '后台登录', '2017-03-17', '117.62.196.254'), ('4758', '72', '2', '1', '后台登录', '2017-03-17', '117.62.196.254'), ('4759', '2', '2', '1', '后台登录', '2017-03-17', '117.62.196.254'), ('4760', '72', '2', '1', '后台登录', '2017-03-17', '117.62.196.254'), ('4761', '2', '2', '1', '后台登录', '2017-03-17', '117.62.196.254'), ('4762', '2', '2', '1', '后台登录', '2017-03-20', '127.0.0.1'), ('4763', '2', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4764', '72', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4765', '71', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4766', '72', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4767', '71', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4768', '72', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4769', '71', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4770', '72', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4771', '71', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4772', '72', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4773', '71', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4774', '72', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4775', '72', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4776', '71', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4777', '2', '2', '1', '后台登录', '2017-03-20', '127.0.0.1'), ('4778', '71', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4779', '15', '2', '1', '后台登录', '2017-03-20', '61.155.235.226'), ('4780', '72', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4781', '72', '2', '1', '后台登录', '2017-03-20', '117.62.199.7'), ('4782', '15', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4783', '72', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4784', '71', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4785', '71', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4786', '72', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4787', '72', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4788', '72', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4789', '72', '2', '1', '后台登录', '2017-03-20', '117.62.199.7'), ('4790', '72', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4791', '15', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4792', '72', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4793', '71', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4794', '71', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4795', '76', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4796', '71', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4797', '72', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4798', '72', '2', '1', '后台登录', '2017-03-20', '58.213.103.2'), ('4799', '72', '2', '1', '后台登录', '2017-03-21', '58.213.103.2'), ('4800', '72', '2', '1', '后台登录', '2017-03-21', '61.155.235.226'), ('4801', '71', '2', '1', '后台登录', '2017-03-21', '61.155.235.226'), ('4802', '72', '2', '1', '后台登录', '2017-03-21', '61.155.235.226'), ('4803', '71', '2', '1', '后台登录', '2017-03-21', '61.155.235.226'), ('4804', '71', '2', '1', '后台登录', '2017-03-21', '61.155.235.226'), ('4805', '15', '2', '1', '后台登录', '2017-03-21', '61.155.235.226'), ('4806', '72', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4807', '15', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4808', '72', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4809', '71', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4810', '71', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4811', '15', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4812', '15', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4813', '71', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4814', '72', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4815', '15', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4816', '72', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4817', '72', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4818', '71', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4819', '72', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4820', '15', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4821', '72', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4822', '72', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4823', '72', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4824', '72', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4825', '72', '2', '1', '后台登录', '2017-03-22', '58.213.103.2'), ('4826', '71', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4827', '72', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4828', '72', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4829', '51', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4830', '24', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4831', '72', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4832', '24', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4833', '72', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4834', '71', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4835', '72', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4836', '15', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4837', '25', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4838', '25', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4839', '71', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4840', '15', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4841', '23', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4842', '15', '2', '1', '后台登录', '2017-03-23', '61.155.235.226'), ('4843', '72', '2', '1', '后台登录', '2017-03-27', '61.155.235.226'), ('4844', '2', '2', '1', '后台登录', '2017-03-27', '127.0.0.1'), ('4845', '72', '2', '1', '后台登录', '2017-03-28', '58.213.103.2'), ('4846', '15', '2', '1', '后台登录', '2017-03-28', '58.213.103.2'), ('4847', '72', '2', '1', '后台登录', '2017-03-28', '58.213.103.2'), ('4848', '72', '2', '1', '后台登录', '2017-03-29', '61.155.235.226'), ('4849', '72', '2', '1', '后台登录', '2017-03-29', '61.155.235.226'), ('4850', '72', '2', '1', '后台登录', '2017-03-29', '61.155.235.226'), ('4851', '72', '2', '1', '后台登录', '2017-03-29', '61.155.235.226'), ('4852', '72', '2', '1', '后台登录', '2017-03-29', '61.155.235.226'), ('4853', '72', '2', '1', '后台登录', '2017-03-29', '61.155.235.226'), ('4854', '71', '2', '1', '后台登录', '2017-03-29', '61.155.235.226'), ('4855', '72', '2', '1', '后台登录', '2017-03-29', '222.95.82.215'), ('4856', '72', '2', '1', '后台登录', '2017-03-29', '222.95.82.215'), ('4857', '26', '2', '1', '后台登录', '2017-03-29', '58.221.239.14'), ('4858', '72', '2', '1', '后台登录', '2017-03-29', '222.95.82.215'), ('4859', '51', '2', '1', '后台登录', '2017-03-29', '58.221.239.14'), ('4860', '72', '2', '1', '后台登录', '2017-03-30', '61.155.235.226'), ('4861', '72', '2', '1', '后台登录', '2017-03-30', '222.95.82.215'), ('4862', '72', '2', '1', '后台登录', '2017-03-30', '222.95.82.215'), ('4863', '72', '2', '1', '后台登录', '2017-03-30', '222.95.82.215'), ('4864', '72', '2', '1', '后台登录', '2017-03-30', '61.155.235.226'), ('4865', '72', '2', '1', '后台登录', '2017-03-30', '61.155.235.226'), ('4866', '71', '2', '1', '后台登录', '2017-03-30', '61.155.235.226'), ('4867', '72', '2', '1', '后台登录', '2017-03-30', '61.155.235.226'), ('4868', '71', '2', '1', '后台登录', '2017-03-30', '61.155.235.226'), ('4869', '15', '2', '1', '后台登录', '2017-03-30', '61.155.235.226'), ('4870', '72', '2', '1', '后台登录', '2017-03-30', '117.91.71.96'), ('4871', '72', '2', '1', '后台登录', '2017-03-30', '117.91.71.96'), ('4872', '71', '2', '1', '后台登录', '2017-03-30', '117.91.71.96'), ('4873', '15', '2', '1', '后台登录', '2017-03-30', '117.91.71.96'), ('4874', '24', '2', '1', '后台登录', '2017-04-05', '61.155.235.226'), ('4875', '72', '2', '1', '后台登录', '2017-04-14', '180.111.9.159'), ('4876', '72', '2', '1', '后台登录', '2017-04-14', '61.155.235.226'), ('4877', '24', '2', '1', '后台登录', '2017-04-20', '61.155.235.226'), ('4878', '72', '2', '1', '后台登录', '2017-04-24', '61.155.235.226'), ('4879', '71', '2', '1', '后台登录', '2017-04-24', '61.155.235.226'), ('4880', '72', '2', '1', '后台登录', '2017-04-24', '61.155.235.226'), ('4881', '71', '2', '1', '后台登录', '2017-04-24', '114.222.90.247'), ('4882', '71', '2', '1', '后台登录', '2017-04-24', '61.155.235.226'), ('4883', '71', '2', '1', '后台登录', '2017-04-24', '49.74.43.95'), ('4884', '72', '2', '1', '后台登录', '2017-04-26', '117.89.136.152'), ('4885', '72', '2', '1', '后台登录', '2017-04-26', '61.155.235.226'), ('4886', '71', '2', '1', '后台登录', '2017-04-26', '61.155.235.226'), ('4887', '72', '2', '1', '后台登录', '2017-04-26', '61.155.235.226'), ('4888', '72', '2', '1', '后台登录', '2017-04-26', '61.155.235.226'), ('4889', '71', '2', '1', '后台登录', '2017-04-26', '61.155.235.226'), ('4890', '72', '2', '1', '后台登录', '2017-04-26', '61.155.235.226'), ('4891', '15', '2', '1', '后台登录', '2017-04-26', '61.155.235.226'), ('4892', '2', '2', '1', '后台登录', '2017-04-26', '61.155.235.226'), ('4893', '71', '2', '1', '后台登录', '2017-04-27', '61.155.235.226'), ('4894', '71', '2', '1', '后台登录', '2017-04-27', '61.155.235.226'), ('4895', '2', '2', '1', '后台登录', '2017-04-27', '61.155.235.226'), ('4896', '72', '2', '1', '后台登录', '2017-04-27', '61.155.235.226'), ('4897', '71', '2', '1', '后台登录', '2017-04-27', '61.155.235.226'), ('4898', '72', '2', '1', '后台登录', '2017-04-28', '61.155.235.226'), ('4899', '72', '2', '1', '后台登录', '2017-04-28', '61.155.235.226'), ('4900', '72', '2', '1', '后台登录', '2017-04-28', '61.155.235.226'), ('4901', '72', '2', '1', '后台登录', '2017-04-28', '61.155.235.226'), ('4902', '72', '2', '1', '后台登录', '2017-04-28', '61.155.235.226'), ('4903', '72', '2', '1', '后台登录', '2017-04-28', '61.155.235.226'), ('4904', '72', '2', '1', '后台登录', '2017-04-28', '61.155.235.226'), ('4905', '72', '2', '1', '后台登录', '2017-04-28', '61.155.235.226'), ('4906', '15', '2', '1', '后台登录', '2017-04-28', '61.155.235.226'), ('4907', '71', '2', '1', '后台登录', '2017-04-28', '61.155.235.226'), ('4908', '72', '2', '1', '后台登录', '2017-04-28', '61.155.235.226'), ('4909', '71', '2', '1', '后台登录', '2017-04-28', '61.155.235.226'), ('4910', '72', '2', '1', '后台登录', '2017-05-02', '61.155.235.226'), ('4911', '72', '2', '1', '后台登录', '2017-05-02', '61.155.235.226'), ('4912', '72', '2', '1', '后台登录', '2017-05-02', '61.155.235.226'), ('4913', '72', '2', '1', '后台登录', '2017-05-02', '61.155.235.226'), ('4914', '71', '2', '1', '后台登录', '2017-05-02', '61.155.235.226'), ('4915', '72', '2', '1', '后台登录', '2017-05-02', '61.155.235.226'), ('4916', '72', '2', '1', '后台登录', '2017-05-02', '61.155.235.226'), ('4917', '71', '2', '1', '后台登录', '2017-05-02', '61.155.235.226'), ('4918', '71', '2', '1', '后台登录', '2017-05-03', '61.155.235.226'), ('4919', '71', '2', '1', '后台登录', '2017-05-03', '61.155.235.226'), ('4920', '72', '2', '1', '后台登录', '2017-05-05', '61.155.235.226'), ('4921', '72', '2', '1', '后台登录', '2017-05-05', '61.155.235.226'), ('4922', '71', '2', '1', '后台登录', '2017-05-05', '61.155.235.226'), ('4923', '81', '2', '1', '后台登录', '2017-05-05', '61.155.235.226'), ('4924', '71', '2', '1', '后台登录', '2017-05-05', '61.155.235.226'), ('4925', '82', '2', '1', '后台登录', '2017-05-05', '61.155.235.226'), ('4926', '71', '2', '1', '后台登录', '2017-05-05', '61.155.235.226'), ('4927', '82', '2', '1', '后台登录', '2017-05-05', '61.155.235.226'), ('4928', '72', '2', '1', '后台登录', '2017-05-08', '61.155.235.226'), ('4929', '71', '2', '1', '后台登录', '2017-05-08', '61.155.235.226'), ('4930', '72', '2', '1', '后台登录', '2017-05-08', '61.155.235.226'), ('4931', '71', '2', '1', '后台登录', '2017-05-08', '61.155.235.226'), ('4932', '72', '2', '1', '后台登录', '2017-05-09', '61.155.235.226'), ('4933', '72', '2', '1', '后台登录', '2017-05-09', '61.155.235.226'), ('4934', '71', '2', '1', '后台登录', '2017-05-10', '127.0.0.1'), ('4935', '71', '2', '1', '后台登录', '2017-05-10', '127.0.0.1'), ('4936', '2', '2', '1', '后台登录', '2017-05-11', '127.0.0.1'), ('4937', '2', '2', '1', '后台登录', '2017-05-11', '127.0.0.1'), ('4938', '26', '2', '1', '后台登录', '2017-05-11', '127.0.0.1'), ('4939', '25', '2', '1', '后台登录', '2017-05-11', '127.0.0.1'), ('4940', '71', '2', '1', '后台登录', '2017-05-12', '127.0.0.1'), ('4941', '72', '2', '1', '后台登录', '2017-05-12', '127.0.0.1'), ('4942', '2', '2', '1', '后台登录', '2017-06-06', '127.0.0.1'), ('4943', '24', '2', '1', '后台登录', '2017-06-06', '127.0.0.1'), ('4944', '46', '2', '1', '后台登录', '2017-06-06', '127.0.0.1'), ('4945', '2', '2', '1', '后台登录', '2017-08-02', '0:0:0:0:0:0:0:1'), ('4946', '2', '2', '1', '后台登录', '2017-08-02', '0:0:0:0:0:0:0:1'), ('4947', '2', '2', '1', '后台登录', '2017-08-02', '0:0:0:0:0:0:0:1'), ('4948', '2', '2', '1', '后台登录', '2017-08-02', '0:0:0:0:0:0:0:1'), ('4949', '2', '2', '1', '后台登录', '2017-08-02', '0:0:0:0:0:0:0:1'), ('4950', '2', '2', '1', '后台登录', '2017-08-02', '0:0:0:0:0:0:0:1'), ('4951', '2', '2', '1', '后台登录', '2017-08-03', '0:0:0:0:0:0:0:1'), ('4952', '2', '2', '1', '后台登录', '2017-08-03', '0:0:0:0:0:0:0:1'), ('4953', '85', '2', '1', '后台登录', '2017-08-03', '0:0:0:0:0:0:0:1'), ('4954', '86', '2', '1', '后台登录', '2017-08-03', '0:0:0:0:0:0:0:1'), ('4955', '2', '2', '1', '后台登录', '2017-08-03', '0:0:0:0:0:0:0:1'), ('4956', '87', '2', '1', '后台登录', '2017-08-03', '0:0:0:0:0:0:0:1'), ('4957', '2', '2', '1', '后台登录', '2017-08-03', '0:0:0:0:0:0:0:1'), ('4958', '2', '2', '1', '后台登录', '2017-08-03', '0:0:0:0:0:0:0:1'), ('4959', '86', '2', '1', '后台登录', '2017-08-03', '0:0:0:0:0:0:0:1'), ('4960', '2', '2', '1', '后台登录', '2017-08-03', '0:0:0:0:0:0:0:1'), ('4961', '2', '2', '1', '后台登录', '2017-08-12', '0:0:0:0:0:0:0:1');
COMMIT;

-- ----------------------------
--  Table structure for `t_province`
-- ----------------------------
DROP TABLE IF EXISTS `t_province`;
CREATE TABLE `t_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `province_name` varchar(100) DEFAULT NULL COMMENT '省份名称',
  `delete_status` int(11) DEFAULT '0' COMMENT '0:默认，1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='省份表';

-- ----------------------------
--  Records of `t_province`
-- ----------------------------
BEGIN;
INSERT INTO `t_province` VALUES ('1', '江苏省', '0');
COMMIT;

-- ----------------------------
--  Table structure for `t_room_checkinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_room_checkinfo`;
CREATE TABLE `t_room_checkinfo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `check_roomid` varchar(32) DEFAULT NULL COMMENT '检查房间ID',
  `check_userid` varchar(32) DEFAULT NULL COMMENT '检查人ID',
  `check_date` datetime DEFAULT NULL COMMENT '检查时间',
  `check_Metope01` varchar(255) DEFAULT NULL COMMENT '墙面检查01-破损、乱画',
  `check_Metope02` varchar(255) DEFAULT NULL COMMENT '墙面检查02-灰尘',
  `check_Ground01` varchar(255) DEFAULT NULL COMMENT '地面检查01-烟头杂物',
  `check_Ground02` varchar(255) DEFAULT NULL COMMENT '地面检查02-未拖地',
  `check_Ground03` varchar(255) DEFAULT NULL COMMENT '地面检查-03垃圾桶未倒',
  `check_Desk01` varchar(255) DEFAULT NULL COMMENT '书桌检查-01物品摆放',
  `check_Desk02` varchar(255) DEFAULT NULL COMMENT '书桌检查-02桌面清洁',
  `check_Bed01` varchar(255) DEFAULT NULL COMMENT '床铺检查-01被子未叠',
  `check_Bed02` varchar(255) DEFAULT NULL COMMENT '床铺检查-02床铺乱',
  `check_Balcony01` varchar(255) DEFAULT NULL COMMENT '阳台检查-01地面未拖',
  `check_Balcony02` varchar(255) DEFAULT NULL COMMENT '阳台检查-02物品不整齐',
  `check_WashGargle01` varchar(255) DEFAULT NULL COMMENT '洗漱台检查-01镜子脏',
  `check_WashGargle02` varchar(255) DEFAULT NULL COMMENT '洗漱台检查-02洗漱台脏乱',
  `check_WashGargle03` varchar(255) DEFAULT NULL COMMENT '洗漱台检查-03有水迹',
  `check_Toilet01` varchar(255) DEFAULT NULL COMMENT '卫生间检查01-异味',
  `check_Toilet02` varchar(255) DEFAULT NULL COMMENT '卫生间检查02-污渍',
  `check_Toilet03` varchar(255) DEFAULT NULL COMMENT '卫生间检查03-脏乱差',
  `check_Power01` varchar(255) DEFAULT NULL COMMENT '电器检查-01违章电器',
  `check_Power02` varchar(255) DEFAULT NULL COMMENT '电器检查-02私接电器',
  `check_Power03` varchar(255) DEFAULT NULL COMMENT '电器检查-03电源不拔',
  `check_Other01` varchar(255) DEFAULT NULL COMMENT '其他检查-01改变格局',
  `check_Other02` varchar(255) DEFAULT NULL COMMENT '其他检查-02饲养宠物',
  `check_Other03` varchar(255) DEFAULT NULL COMMENT '其他检查-03门口堆垃圾',
  `check_Other04` varchar(255) DEFAULT NULL COMMENT '其他检查-04喷淋挂衣服',
  `check_Other05` varchar(255) DEFAULT NULL COMMENT '其他检查-05无床门贴',
  `check_pic01` varchar(255) DEFAULT NULL COMMENT '检查图片1',
  `check_pic02` varchar(255) DEFAULT NULL COMMENT '检查图片2',
  `check_pic03` varchar(255) DEFAULT NULL COMMENT '检查图片3',
  `check_pic04` varchar(255) DEFAULT NULL COMMENT '检查图片4',
  `check_pic05` varchar(255) DEFAULT NULL COMMENT '检查图片5',
  `check_remark` varchar(1024) DEFAULT NULL COMMENT '备注信息',
  `check_result` varchar(255) DEFAULT NULL COMMENT '检查结果',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='宿舍检查表';

-- ----------------------------
--  Records of `t_room_checkinfo`
-- ----------------------------
BEGIN;
INSERT INTO `t_room_checkinfo` VALUES ('1', '1203', '13605179121', '2016-06-27 15:05:13', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, '', '2'), ('2', '1302', '13605179121', '2016-06-27 17:36:11', '123', '12', '123', '12', '123', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, '', '3'), ('3', '1302', '13605179121', '2016-06-28 11:13:30', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', 'upload/201606281113177501099.png', 'upload/201606281113223538992.png', 'upload/201606281113261104805.png', null, null, '2222', '4'), ('4', '1203', '13605179121', '2016-06-28 15:34:06', '4', '4', '4', '4', '5', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, '', '4'), ('5', '1203', '13605179121', '2016-06-28 15:35:59', '4', '5', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, '', '0'), ('6', '1302', '13605179121', '2016-06-28 15:36:39', '1', '5', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, '', '0'), ('7', '1203', '13605179121', '2016-06-28 15:36:56', '6', '8', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, '', '0'), ('8', '1203', '13605179121', '2016-06-28 15:38:29', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '', '', '', null, null, '', '100'), ('9', '1203', '13605179121', '2016-06-28 15:54:19', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', 'upload/201606281554131026304.png', '', '', null, null, '23', '100'), ('10', '1203', '13605179121', '2016-06-28 15:55:13', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', 'upload/201606281554131026304.png', '', '', null, null, '23', '87'), ('11', '1203', '13605179121', '2016-06-28 16:01:17', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', 'upload/201606281601019698971.png', '', '', null, null, '', '100'), ('12', '1203', '13605179121', '2016-06-28 16:02:23', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', 'upload/201606281601019698971.png', '', '', null, null, '', '100'), ('13', '1203', '13605179121', '2016-06-28 16:03:07', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', 'upload/201606281601019698971.png', '', '', null, null, '', '100'), ('14', '1203', '13605179121', '2016-06-28 16:04:28', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', 'upload/201606281601019698971.png', '', '', null, null, '', '100'), ('15', '1203', '13605179121', '2016-06-28 16:05:26', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', 'upload/201606281601019698971.png', '', '', null, null, '', '100'), ('16', '1203', '13605179121', '2016-06-28 16:06:20', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', 'upload/201606281601019698971.png', '', '', null, null, '', '100'), ('17', '1203', '13605179121', '2016-06-28 16:06:28', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', 'upload/201606281601019698971.png', '', '', null, null, '', '100'), ('18', '1203', '13605179121', '2016-06-28 16:08:21', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', 'upload/201606281601019698971.png', '', '', null, null, '', '100'), ('19', '1203', '13605179121', '2016-06-28 16:14:15', '4', '4', '3', '4', '3', '4', '4', '4', '3', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '', '', '', null, null, '123', '97'), ('20', '1203', '13605179121', '2016-06-28 22:37:13', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'upload/201606282237094671650.jpg', null, null, '', 'NaN'), ('21', '1203', '13605179121', '2016-06-29 10:38:58', '1', '2', '3', '4', '3', '3', '3', '3', '3', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '3', '3', '2', '2', 'upload/201606291038438126031.png', 'upload/201606291038468456263.png', 'upload/201606291038546774146.png', null, null, '123', '59'), ('22', '1201', '13605179121', '2016-07-03 15:52:22', '4', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, '', 'NaN'), ('23', '1201', '13605179121', '2016-07-03 15:58:17', '4', '4', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, '', 'NaN'), ('24', '1201', '13605179121', '2016-07-07 16:24:44', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'upload/201607071605265031945.png', 'upload/201607071605288431724.png', 'upload/20160707160531248830.png', 'upload/201607071624374767776.png', 'upload/201607071624415647976.png', '', 'NaN'), ('25', '1203', '13605179121', '2016-07-07 17:09:14', '2', '2', '2', '2', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'upload/201607071708588757508.png', 'upload/201607071709012618108.png', 'upload/201607071709042418659.png', 'upload/201607071709059427958.png', 'upload/201607071709082285025.png', '', '10');
COMMIT;

-- ----------------------------
--  Table structure for `t_sea_goods_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_sea_goods_record`;
CREATE TABLE `t_sea_goods_record` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `work_poor_id` int(11) NOT NULL,
  `goods_cash` varchar(255) DEFAULT NULL COMMENT '现金',
  `goods_value` varchar(255) DEFAULT NULL COMMENT '物资折合人民币',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `send_dept` varchar(255) DEFAULT NULL COMMENT '发送部门',
  `send_thing` varchar(255) DEFAULT NULL COMMENT '发送物品',
  `send_remark` varchar(255) DEFAULT NULL COMMENT '发送描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_sea_govunit`
-- ----------------------------
DROP TABLE IF EXISTS `t_sea_govunit`;
CREATE TABLE `t_sea_govunit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `unit_name` varchar(512) DEFAULT '512' COMMENT '单位名称',
  `unit_city` int(11) DEFAULT NULL,
  `is_member` varchar(10) DEFAULT NULL,
  `join_time` datetime DEFAULT NULL,
  `unit_duty` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_sea_govunit`
-- ----------------------------
BEGIN;
INSERT INTO `t_sea_govunit` VALUES ('44', '珠江路美轩', '1', '1', '2017-07-01 00:00:00', '超鸡'), ('45', '南湖美轩', '1', '1', '2017-08-01 00:00:00', '常老板');
COMMIT;

-- ----------------------------
--  Table structure for `t_sea_honor`
-- ----------------------------
DROP TABLE IF EXISTS `t_sea_honor`;
CREATE TABLE `t_sea_honor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `honor_desc` varchar(2048) DEFAULT NULL COMMENT '主要事迹',
  `honor_time` datetime DEFAULT NULL COMMENT '获奖时间',
  `honor_code` varchar(255) DEFAULT NULL COMMENT '奖章编号',
  `honor_title` varchar(255) DEFAULT NULL COMMENT '表彰文件签发单位标题文号',
  `honor_type` varchar(255) DEFAULT NULL COMMENT '荣誉种类',
  `honor_level` varchar(255) DEFAULT NULL COMMENT '荣誉级别',
  `honor_worker` int(11) NOT NULL DEFAULT '0' COMMENT '荣誉职工ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `check_flag` varchar(8) DEFAULT NULL COMMENT '审核状态',
  `unit_honor_desc` varchar(255) DEFAULT NULL COMMENT '集体事迹',
  `in_unit` int(11) DEFAULT NULL COMMENT '获奖单位',
  `join_time` datetime DEFAULT NULL,
  `unit_duty` varchar(255) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `send_dept` varchar(255) DEFAULT NULL,
  `send_thing` varchar(255) DEFAULT NULL,
  `check_desc` varchar(100) DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除',
  `extFileDisplayName` varchar(255) DEFAULT NULL,
  `extFileName` varchar(255) DEFAULT NULL,
  `extFileDisplayName2` varchar(255) DEFAULT NULL,
  `extFileName2` varchar(255) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_sea_honor`
-- ----------------------------
BEGIN;
INSERT INTO `t_sea_honor` VALUES ('83', '10000', '2017-08-03 00:00:00', null, '123213', '短期', '112233', '314', '2017-08-03 00:39:09', '0', '123', '0', '2017-08-27 00:00:00', null, null, null, null, null, null, '0', '', '', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `t_sea_honor_unit`
-- ----------------------------
DROP TABLE IF EXISTS `t_sea_honor_unit`;
CREATE TABLE `t_sea_honor_unit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `honor_unit` varchar(255) DEFAULT NULL COMMENT '单位名称',
  `unit_location` varchar(255) DEFAULT NULL COMMENT '所在地',
  `unit_phone` varchar(255) DEFAULT NULL COMMENT '单位电话',
  `unit_duty` varchar(255) DEFAULT NULL COMMENT '单位负责人',
  `unit_leader` varchar(255) DEFAULT NULL COMMENT '工会主席',
  `honor_duty` varchar(255) DEFAULT NULL COMMENT '获奖岗位责任人',
  `honor_type` varchar(255) DEFAULT NULL COMMENT '荣誉种类',
  `honor_level` varchar(255) DEFAULT NULL COMMENT '荣誉级别',
  `unit_honor_desc` varchar(255) DEFAULT NULL COMMENT '集体事迹',
  `honor_code` varchar(255) DEFAULT NULL COMMENT '奖章编号',
  `honor_title` varchar(255) DEFAULT NULL COMMENT '表彰文件签发单位标题文号',
  `honor_time` datetime DEFAULT NULL COMMENT '获奖时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `check_flag` varchar(8) DEFAULT NULL COMMENT '审核状态',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除',
  `check_desc` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `honor_dept` varchar(255) DEFAULT NULL,
  `add_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_sea_worker`
-- ----------------------------
DROP TABLE IF EXISTS `t_sea_worker`;
CREATE TABLE `t_sea_worker` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `worker_name` varchar(255) DEFAULT NULL,
  `worker_sex` varchar(16) DEFAULT NULL,
  `worker_age` varchar(16) DEFAULT NULL,
  `worker_idnumber` varchar(32) DEFAULT NULL,
  `worker_address` varchar(255) DEFAULT NULL,
  `worker_phone` varchar(32) DEFAULT NULL,
  `honor_remark` varchar(512) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `is_hard` varchar(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `bank_card` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `work_duty` varchar(255) DEFAULT NULL COMMENT '职工身份',
  `create_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_sea_worker`
-- ----------------------------
BEGIN;
INSERT INTO `t_sea_worker` VALUES ('314', '测试', null, '2月5日', '320103198502050573', '雨花西路', '13605179121', null, '0', '0', '2017-08-03 00:39:09', null, null, null), ('315', '测试2', null, '2月6日', '320103198502030574', '雨花西路', '13500000002', null, '0', '1', '2017-08-02 22:05:50', null, null, null), ('316', '2222', null, '22', '320103198502050576', '3123', '13605179121', null, '44', '1', '2017-08-03 12:41:10', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `t_sea_worker_poor`
-- ----------------------------
DROP TABLE IF EXISTS `t_sea_worker_poor`;
CREATE TABLE `t_sea_worker_poor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `family_people` varchar(128) DEFAULT NULL COMMENT '家庭情况',
  `family_income` varchar(32) DEFAULT NULL COMMENT '家庭收入',
  `poor_reason` varchar(512) DEFAULT NULL COMMENT '贫困原因',
  `in_unit` int(11) DEFAULT NULL COMMENT '填报单位',
  `check_unit` varchar(255) DEFAULT NULL COMMENT '审核单位',
  `change_memo` varchar(512) DEFAULT NULL COMMENT '变更说明',
  `poor_level` varchar(255) DEFAULT NULL COMMENT '贫困等级',
  `worker_id` int(11) DEFAULT NULL COMMENT '员工ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `check_flag` varchar(8) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `send_dept` varchar(255) DEFAULT NULL,
  `send_thing` varchar(255) DEFAULT NULL,
  `send_remark` varchar(2048) DEFAULT NULL,
  `check_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_sea_worker_poor`
-- ----------------------------
BEGIN;
INSERT INTO `t_sea_worker_poor` VALUES ('269', null, null, null, '0', null, null, null, '314', '2017-08-02 22:00:58', '0', null, null, null, null, null), ('270', null, null, null, '0', null, null, null, '315', '2017-08-02 22:05:50', '0', null, null, null, null, null), ('271', null, null, null, '44', null, null, null, '316', '2017-08-03 12:41:10', '0', null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `t_store_agent`
-- ----------------------------
DROP TABLE IF EXISTS `t_store_agent`;
CREATE TABLE `t_store_agent` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) DEFAULT NULL COMMENT '经纪人表ID',
  `store_id` int(11) DEFAULT NULL COMMENT '上线ID',
  `status` int(11) DEFAULT NULL COMMENT '当前状态',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `memo` varchar(1000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='门店经纪人关系表';

-- ----------------------------
--  Records of `t_store_agent`
-- ----------------------------
BEGIN;
INSERT INTO `t_store_agent` VALUES ('22', '4155', '5254', '2', '2015-09-14 16:25:31', ' '), ('23', '8561', '8595', '4', '2016-01-10 08:08:42', ' '), ('24', '8594', '8595', '1', '2015-10-10 18:26:00', ' '), ('25', '8673', '8595', '1', '2015-10-20 17:43:20', ' '), ('26', '8764', '8640', '4', '2015-12-24 15:30:51', ' '), ('27', '8772', '8772', '4', '2016-01-25 18:29:47', ' '), ('28', '9014', '9013', '1', '2016-04-06 13:55:09', ' 买哪儿网'), ('29', '8674', '8343', '1', '2016-04-06 14:03:14', ' '), ('30', '9015', '9013', '1', '2016-04-06 14:48:31', ' 买哪儿网');
COMMIT;

-- ----------------------------
--  Table structure for `t_sys_agent_account`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_agent_account`;
CREATE TABLE `t_sys_agent_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cash` decimal(10,0) DEFAULT '0' COMMENT '可提现金',
  `usable` decimal(10,0) DEFAULT '0' COMMENT '可结佣金',
  `total` decimal(10,0) DEFAULT '0' COMMENT '已结佣金',
  `pending` decimal(10,0) DEFAULT '0' COMMENT '申请结算佣金',
  `history` decimal(10,0) DEFAULT '0' COMMENT '已结现金',
  `cashing` decimal(10,0) DEFAULT '0' COMMENT '申请提现现金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='资金账户表';

-- ----------------------------
--  Records of `t_sys_agent_account`
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_agent_account` VALUES ('-1', '0', '0', '0', '0', '0', null), ('1', '0', '1439', '0', '0', '0', '0'), ('2', '0', '0', '0', '0', '0', '0'), ('3', '0', '1861', '0', '0', '0', '0'), ('4', '0', '1478', '0', '0', '0', '0'), ('5', '0', '2236', '0', '0', '0', '0'), ('6', '0', '1805', '0', '0', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `t_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `menu_url` varchar(500) DEFAULT NULL COMMENT '菜单地址',
  `sort_decimal` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
--  Records of `t_sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_menu` VALUES ('1', '全省会员统计', 'admin/govworker!view', '1'), ('2', '单位会员管理', 'admin/govworker!view', '1'), ('3', '客户统计', 'admin/govworker!view_poor2', '2'), ('4', '客户管理', 'admin/govworker!view_poor', '2'), ('5', '合同统计', 'admin/govhonor!view2', '3'), ('6', '合同管理', 'admin/govhonor!view', '3'), ('7', '分公司管理', 'admin/govunit!view', '5'), ('8', '用户管理', 'admin/user!view', '5'), ('9', '权限管理', 'admin/user!role', '5'), ('10', '个人设置', 'admin/user!password', '5'), ('13', '客户审核', 'admin/govworker!view_poor1', '2'), ('14', '合同审核', 'admin/govhonor!view1', '3'), ('15', '单位荣誉统计', 'admin/govhonorunit!view2', '4'), ('16', '单位荣誉审核', 'admin/govhonorunit!view1', '4'), ('17', '单位荣誉管理', 'admin/govhonorunit!view', '4');
COMMIT;

-- ----------------------------
--  Table structure for `t_sys_menu_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu_role`;
CREATE TABLE `t_sys_menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `Reference_1` (`role_id`),
  KEY `Reference_2` (`menu_id`),
  CONSTRAINT `Reference_1` FOREIGN KEY (`role_id`) REFERENCES `t_sys_role` (`id`),
  CONSTRAINT `Reference_2` FOREIGN KEY (`menu_id`) REFERENCES `t_sys_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8 COMMENT='后台菜单角色关联表';

-- ----------------------------
--  Records of `t_sys_menu_role`
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_menu_role` VALUES ('160', '1', '1'), ('161', '1', '2'), ('162', '1', '3'), ('163', '1', '4'), ('164', '1', '5'), ('165', '1', '6'), ('166', '1', '7'), ('167', '1', '8'), ('168', '1', '9'), ('169', '1', '10'), ('173', '1', '13'), ('174', '1', '14'), ('191', '13', '2'), ('192', '13', '4'), ('193', '13', '6'), ('194', '13', '10'), ('202', '12', '7'), ('203', '12', '8'), ('204', '12', '10'), ('205', '12', '13'), ('206', '12', '14'), ('211', '11', '1'), ('212', '11', '3'), ('213', '11', '5'), ('214', '11', '10');
COMMIT;

-- ----------------------------
--  Table structure for `t_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `sort_decimal` int(11) DEFAULT NULL COMMENT '排序号',
  `description` varchar(500) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='后台角色表';

-- ----------------------------
--  Records of `t_sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role` VALUES ('1', '管理员', '0', '超级管理员'), ('11', '省公司管理员', null, '省公司管理员'), ('12', '市公司管理员', null, '市公司管理员'), ('13', '业务员', null, '业务员');
COMMIT;

-- ----------------------------
--  Table structure for `t_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(50) DEFAULT NULL COMMENT '登录名',
  `pwd_code` varchar(50) DEFAULT NULL COMMENT '登录密码',
  `real_name` varchar(200) DEFAULT NULL COMMENT '真实姓名',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `user_type` int(11) DEFAULT NULL COMMENT '用户类型',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `last_logintime` datetime DEFAULT NULL COMMENT '登录时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `wechat_time` datetime DEFAULT NULL COMMENT '微信最后交互时间',
  `unit_id` int(11) DEFAULT NULL COMMENT '单位ID',
  `city_id` int(11) DEFAULT NULL COMMENT '城市',
  `user_level` varchar(255) DEFAULT NULL COMMENT '用户等级',
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='存储用户信息';

-- ----------------------------
--  Records of `t_sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_user` VALUES ('2', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', null, '13812345678', null, '2', '1', '2017-08-12 14:14:27', '2015-05-12 00:00:00', null, null, null, null, '0:0:0:0:0:0:0:1'), ('83', 'ceo', 'e10adc3949ba59abbe56e057f20f883e', 'ceo', null, '13900000001', null, '2', '11', null, '2017-08-02 22:24:58', null, null, null, '11', null), ('84', 'nj1', 'e10adc3949ba59abbe56e057f20f883e', 'nj1', null, '13400000002', null, '2', '12', null, '2017-08-02 23:15:05', null, null, '1', '12', null), ('85', 'njyw1', 'e10adc3949ba59abbe56e057f20f883e', 'njyw1', null, '13500000008', null, '2', '13', '2017-08-03 12:40:44', '2017-08-02 23:15:42', null, '44', '1', '13', '0:0:0:0:0:0:0:1'), ('86', 'njyw2', 'e10adc3949ba59abbe56e057f20f883e', 'njyw2', null, '13200000002', null, '2', '13', '2017-08-03 18:56:28', '2017-08-03 12:40:28', null, '44', '1', '13', '0:0:0:0:0:0:0:1'), ('87', 'njyw3', 'e10adc3949ba59abbe56e057f20f883e', 'njyw3', null, '13400000002', null, '2', '13', '2017-08-03 12:43:36', '2017-08-03 12:43:24', null, '45', '1', '13', '0:0:0:0:0:0:0:1');
COMMIT;

-- ----------------------------
--  Table structure for `t_sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户Id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  KEY `Reference_4` (`user_id`),
  KEY `Reference_5` (`role_id`),
  CONSTRAINT `Reference_4` FOREIGN KEY (`user_id`) REFERENCES `t_sys_user` (`id`),
  CONSTRAINT `Reference_5` FOREIGN KEY (`role_id`) REFERENCES `t_sys_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='后台用户角色关联表';

-- ----------------------------
--  Records of `t_sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_user_role` VALUES ('95', '2', '1'), ('112', '83', '11'), ('113', '84', '12'), ('114', '85', '13'), ('115', '86', '13'), ('116', '87', '13');
COMMIT;

-- ----------------------------
--  Table structure for `t_wechat_auto`
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_auto`;
CREATE TABLE `t_wechat_auto` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `auto_type` int(11) DEFAULT '1' COMMENT '0:关注时自动回复，1:消息自动回复',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键字',
  `content_type` int(11) DEFAULT NULL COMMENT '1:图片,2:文字',
  `media_id` varchar(255) DEFAULT NULL COMMENT '图片ID',
  `content` varchar(2000) DEFAULT NULL COMMENT '文字内容',
  `role_name` varchar(255) DEFAULT NULL COMMENT '规则名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `pic_url` varchar(500) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='自动回复表';

-- ----------------------------
--  Records of `t_wechat_auto`
-- ----------------------------
BEGIN;
INSERT INTO `t_wechat_auto` VALUES ('31', '0', null, '2', '', '欢迎关注房小帅', null, '2015-06-10 15:17:12', ''), ('32', '1', '123', '2', '', '欢迎关注！！！！', '123', '2015-06-10 15:17:34', ''), ('33', '1', 'xmjl', '2', '', '蔡晓媛   13913912899  测试项目', '123', '2015-06-10 15:58:17', ''), ('34', '0', null, '2', '', 'Hi，小帅等您很久啦！\r\n小帅充分懂得您作为房产经纪人的辛苦，您只需要注册成为【房小帅】会员，动动手指推荐客户，就能用更帅的方式赚钱，赢取高额佣金。\r\n点击屏幕下方“任务管理”的“登录/注册”，就可注册成为房小帅会员。\r\n回复 “注册”，了解注册、以及推荐经纪人朋友的流程；回复“推荐”，了解向楼盘推荐购房客户的流程；回复“佣金”，了解申请结佣与申请提现流程。', null, '2015-06-11 15:52:30', '');
COMMIT;

-- ----------------------------
--  Table structure for `t_wechat_auto_history`
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_auto_history`;
CREATE TABLE `t_wechat_auto_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(255) DEFAULT NULL COMMENT '用户的OPEN_ID',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键字',
  `say_word` varchar(2000) DEFAULT NULL COMMENT '发送的内容',
  `role_id` int(11) DEFAULT NULL COMMENT '规则ID',
  `media_id` varchar(255) DEFAULT NULL COMMENT '图片ID',
  `content` varchar(2000) DEFAULT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动回复历史';

-- ----------------------------
--  Table structure for `t_wechat_interface`
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_interface`;
CREATE TABLE `t_wechat_interface` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_type` varchar(200) DEFAULT NULL,
  `message_content` varchar(500) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `operate_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信接口交互记录表';

-- ----------------------------
--  Table structure for `t_wechat_message_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_message_record`;
CREATE TABLE `t_wechat_message_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` varchar(255) DEFAULT NULL COMMENT '消息来源 OPENID',
  `to_user` varchar(255) DEFAULT NULL COMMENT '消息目的地 OPENID',
  `from_user_id` int(11) DEFAULT NULL COMMENT '消息来源 UserId',
  `to_user_id` int(11) DEFAULT NULL COMMENT '消息目的地 UserId',
  `message_type` varchar(11) DEFAULT NULL COMMENT '消息类型',
  `content` text COMMENT '消息内容',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信消息记录表';

-- ----------------------------
--  Table structure for `t_wechat_template`
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_template`;
CREATE TABLE `t_wechat_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `send_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `event_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信回复模板表';

SET FOREIGN_KEY_CHECKS = 1;
