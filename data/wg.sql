/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:8889
 Source Schema         : wg

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 29/03/2019 14:46:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for work_activity_coupons
-- ----------------------------
DROP TABLE IF EXISTS `work_activity_coupons`;
CREATE TABLE `work_activity_coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_no` varchar(255) NOT NULL COMMENT '优惠券编号',
  `market_activity_id` bigint(20) NOT NULL COMMENT '营销活动ID',
  `coupon_type` varchar(20) NOT NULL COMMENT '优惠券类别：discount打折券full满减券',
  `expiry_time` datetime NOT NULL COMMENT '到期时间',
  `reach_money` decimal(10,2) NOT NULL COMMENT '满多少元后可用',
  `change_value` decimal(10,2) NOT NULL COMMENT '优惠值：discount打折值full满减金额',
  `issue_num` bigint(20) NOT NULL COMMENT '优惠券发行数量',
  `use_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '已被领取的数量',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_activity_coupons
-- ----------------------------
BEGIN;
INSERT INTO `work_activity_coupons` VALUES (1, 'C2018090310383967268', 18, 'full', '2020-09-26 00:00:00', 2000.00, 200.00, 100, 9, 1, 0, '2018-09-03 10:38:39', '2019-02-25 17:50:51');
INSERT INTO `work_activity_coupons` VALUES (2, 'C2018090310385679967', 8, 'full', '2018-09-30 00:00:00', 10000.00, 1000.00, 100, 2, 2, 0, '2018-09-03 10:38:56', '2018-12-03 17:01:38');
INSERT INTO `work_activity_coupons` VALUES (3, 'C2018090310393506234', 5, 'discount', '2018-09-30 00:00:00', 1000.00, 5.00, 100, 2, 2, 0, '2018-09-03 10:39:35', '2018-12-03 17:01:38');
INSERT INTO `work_activity_coupons` VALUES (4, 'C2018090310395027402', 2, 'discount', '2018-09-30 00:00:00', 10000.00, 7.00, 100, 2, 2, 0, '2018-09-03 10:39:50', '2018-12-03 17:01:38');
INSERT INTO `work_activity_coupons` VALUES (5, 'C2018090409553440611', 8, 'discount', '2018-09-30 00:00:00', 100000.00, 1.00, 1000, 1, 2, 0, '2018-09-04 09:55:34', '2018-12-03 17:01:38');
INSERT INTO `work_activity_coupons` VALUES (6, 'C2018100714342510604', 18, 'full', '2019-02-28 00:00:00', 1500.00, 150.00, 10, 4, 1, 0, '2018-10-07 14:34:25', '2019-02-25 17:50:50');
INSERT INTO `work_activity_coupons` VALUES (7, 'C2018113011231233612', 18, 'full', '2019-11-15 00:00:00', 1000.00, 100.00, 20, 8, 1, 0, '2018-11-30 11:23:12', '2019-02-25 17:50:49');
INSERT INTO `work_activity_coupons` VALUES (8, 'C2018113011232928218', 18, 'full', '2019-11-23 00:00:00', 500.00, 50.00, 10, 9, 1, 0, '2018-11-30 11:23:29', '2019-02-25 17:50:49');
INSERT INTO `work_activity_coupons` VALUES (9, 'C2018120315543452059', 22, 'full', '2018-12-03 15:56:41', 20.00, 1.00, 1, 1, 2, 0, '2018-12-03 15:54:34', '2018-12-03 16:29:57');
INSERT INTO `work_activity_coupons` VALUES (10, 'C2019022411572846318', 18, 'discount', '2019-02-25 11:56:57', 300.00, 9.00, 100, 0, 2, 0, '2019-02-24 11:57:28', '2019-02-25 17:50:47');
INSERT INTO `work_activity_coupons` VALUES (11, 'C2019022517544975673', 29, 'discount', '2019-03-01 00:00:00', 139.00, 9.00, 100, 0, 2, 1, '2019-02-25 17:54:49', '2019-02-25 17:54:49');
INSERT INTO `work_activity_coupons` VALUES (12, 'C2019022517560435510', 29, 'full', '2019-03-01 00:00:00', 200.00, 50.00, 100, 2, 2, 1, '2019-02-25 17:56:04', '2019-02-25 17:56:04');
COMMIT;

-- ----------------------------
-- Table structure for work_activity_full_rules
-- ----------------------------
DROP TABLE IF EXISTS `work_activity_full_rules`;
CREATE TABLE `work_activity_full_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `market_activity_id` bigint(20) NOT NULL COMMENT '营销活动ID',
  `user_level_ids` text NOT NULL COMMENT '会员等级IDs',
  `full_money` decimal(10,2) NOT NULL,
  `reduce_money` decimal(10,2) NOT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_activity_full_rules
-- ----------------------------
BEGIN;
INSERT INTO `work_activity_full_rules` VALUES (1, 17, '[1]', 4.00, 4.00, 1, 0, '2018-08-27 18:10:26', '2019-02-25 17:51:33');
INSERT INTO `work_activity_full_rules` VALUES (2, 17, '[2,3,4,5,6]', 800.00, 88.00, 1, 0, '2018-08-27 18:12:40', '2019-02-25 17:51:33');
INSERT INTO `work_activity_full_rules` VALUES (3, 17, '[6,5,1,2,4,3]', 100.00, 20.00, 1, 0, '2018-10-07 14:33:04', '2019-02-25 17:51:33');
INSERT INTO `work_activity_full_rules` VALUES (4, 25, '[4,5,6]', 500.00, 50.00, 1, 0, '2019-02-23 11:19:36', '2019-02-25 17:51:33');
INSERT INTO `work_activity_full_rules` VALUES (5, 30, '[6,5,4,3,2,1]', 150.00, 50.00, 1, 1, '2019-02-25 17:53:59', '2019-02-25 17:53:59');
COMMIT;

-- ----------------------------
-- Table structure for work_addresses
-- ----------------------------
DROP TABLE IF EXISTS `work_addresses`;
CREATE TABLE `work_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `consignee_name` varchar(100) NOT NULL COMMENT '收货人',
  `mobile` varchar(20) NOT NULL COMMENT '联系电话',
  `province` varchar(255) NOT NULL COMMENT '省份',
  `province_code` varchar(20) NOT NULL COMMENT '省份编码ID',
  `city` varchar(255) NOT NULL COMMENT '城市',
  `city_code` varchar(20) NOT NULL COMMENT '城市编码ID',
  `area` varchar(255) NOT NULL COMMENT '地区',
  `area_code` varchar(20) NOT NULL COMMENT '地区编码ID',
  `address` varchar(255) NOT NULL COMMENT '详细地址',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否为默认收货地址1-是 0-否',
  `sort` int(11) DEFAULT '0' COMMENT '地址排序',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_addresses
-- ----------------------------
BEGIN;
INSERT INTO `work_addresses` VALUES (1, 2, 'hgvb', '12345688905', '天津市', '120000', '市辖区', '120100', '河西区', '120103', 'ccb', '', '', 0, 0, 0, '2018-11-10 14:43:22', '2018-11-10 15:11:59');
INSERT INTO `work_addresses` VALUES (2, 2, 'hgvb', '12345688905', '天津市', '120000', '市辖区', '120100', '河西区', '120103', 'ccb', '', '', 0, 0, 0, '2018-11-10 14:43:22', '2018-11-10 15:15:35');
INSERT INTO `work_addresses` VALUES (3, 3, '看看', '12345678905', '山西省', '140000', '朔州市', '140600', '山阴县', '140621', '鸡腿', '', '', 0, 0, 1, '2018-11-10 15:05:45', '2018-11-10 15:05:46');
INSERT INTO `work_addresses` VALUES (4, 3, '看看', '12345678905', '山西省', '140000', '朔州市', '140600', '山阴县', '140621', '鸡腿', '', '', 1, 0, 1, '2018-11-10 15:05:46', '2018-11-10 15:05:46');
INSERT INTO `work_addresses` VALUES (5, 2, '就', '12345678905', '黑龙江省', '230000', '鸡西市', '230300', '市辖区', '230301', '酒', '', '', 1, 0, 0, '2018-11-10 15:12:53', '2018-11-10 15:15:37');
INSERT INTO `work_addresses` VALUES (6, 2, '路途', '12345688904', '河北省', '130000', '邯郸市', '130400', '邯郸县', '130421', '就', '', '', 1, 0, 0, '2018-11-10 15:17:00', '2018-11-10 15:18:56');
INSERT INTO `work_addresses` VALUES (7, 2, '牛', '12345678905', '江苏省', '320000', '常州市', '320400', '市辖区', '320401', '12346679905', '', '', 1, 0, 0, '2018-11-10 15:25:20', '2018-11-10 15:28:17');
INSERT INTO `work_addresses` VALUES (8, 2, '九江', '12345678905', '北京市', '110000', '市辖区', '110100', '东城区', '110101', 'vvv', '', '', 1, 0, 0, '2018-11-10 15:34:37', '2018-11-10 16:44:24');
INSERT INTO `work_addresses` VALUES (9, 1, '999', '18390606242', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', 1, 0, 1, '2018-11-10 15:46:47', '2018-11-10 15:46:47');
INSERT INTO `work_addresses` VALUES (10, 7, '123456', '12345678912', '北京市', '110000', '市辖区', '110100', '朝阳区', '110105', '长沙', '', '', 1, 0, 1, '2018-11-10 17:39:22', '2018-11-10 17:39:22');
INSERT INTO `work_addresses` VALUES (11, 2, '继续', '12345678905', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '泪如雨下', '', '', 1, 0, 1, '2018-11-12 09:24:01', '2018-11-12 09:24:01');
INSERT INTO `work_addresses` VALUES (12, 8, '啊啊啊', '18175974828', '北京市', '110000', '市辖区', '110100', '石景山区', '110107', '啊啊啊啊啊啊啊啊', '', '', 1, 0, 1, '2018-11-12 11:20:18', '2018-11-12 11:20:18');
INSERT INTO `work_addresses` VALUES (13, 9, '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '', '', 1, 0, 1, '2018-11-12 12:46:51', '2018-11-12 12:46:51');
INSERT INTO `work_addresses` VALUES (14, 40, '哦哦哦', '12345678910', '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '鄂托克旗', '150624', '饿得', NULL, NULL, 1, 0, 1, '2018-11-27 10:23:45', '2018-11-27 10:23:45');
INSERT INTO `work_addresses` VALUES (15, 42, '毛', '15675143940', '天津市', '120000', '市辖区', '120100', '河东区', '120102', '测试', NULL, NULL, 1, 0, 1, '2018-11-27 14:30:49', '2018-11-27 14:30:49');
INSERT INTO `work_addresses` VALUES (16, 6, '卿进', '15200597371', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '测试', NULL, NULL, 1, 0, 1, '2018-11-27 15:20:05', '2018-11-27 15:20:05');
INSERT INTO `work_addresses` VALUES (17, 4, '不', '18390173100', '黑龙江省', '230000', '佳木斯市', '230800', '汤原县', '230828', '啊', NULL, NULL, 1, 0, 1, '2018-11-27 15:50:13', '2018-11-27 15:50:13');
INSERT INTO `work_addresses` VALUES (18, 17, '摩擦', '12345678940', '河北省', '130000', '邢台市', '130500', '内丘县', '130523', '看看咯', NULL, NULL, 1, 0, 1, '2018-11-28 15:09:18', '2018-11-28 15:09:18');
INSERT INTO `work_addresses` VALUES (19, 44, '1', '12345678102', '黑龙江省', '230000', '牡丹江市', '231000', '海林市', '231083', '1', NULL, NULL, 1, 0, 1, '2018-11-28 15:29:43', '2018-11-28 15:29:43');
INSERT INTO `work_addresses` VALUES (20, 45, '周涛', '18390926488', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '长沙', NULL, NULL, 1, 0, 1, '2018-11-29 09:52:05', '2018-11-29 09:52:05');
INSERT INTO `work_addresses` VALUES (21, 46, 'ccv', '12345678905', '河北省', '130000', '邯郸市', '130400', '邯郸县', '130421', 'vcvb', NULL, NULL, 1, 0, 1, '2018-11-29 17:18:24', '2018-11-29 17:18:24');
INSERT INTO `work_addresses` VALUES (22, 43, '吴雷', '18676798664', '湖南省', '430000', '长沙市', '430100', '长沙县', '430121', '天源', NULL, NULL, 1, 0, 1, '2018-12-01 15:16:55', '2018-12-01 15:16:55');
INSERT INTO `work_addresses` VALUES (23, 48, '赵若煊', '18630135988', '河北省', '130000', '石家庄市', '130100', '元氏县', '130132', '光明小区', NULL, NULL, 1, 0, 1, '2018-12-01 16:33:48', '2018-12-01 16:33:48');
INSERT INTO `work_addresses` VALUES (24, 49, '韩梅梅', '15527507613', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '开源鑫茂大厦906产品部', NULL, NULL, 0, 0, 1, '2018-12-03 14:26:29', '2019-02-22 11:32:31');
INSERT INTO `work_addresses` VALUES (25, 49, 'DK Studio', '15527507613', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '流芳大道特一号', NULL, NULL, 1, 0, 1, '2018-12-03 14:28:14', '2019-02-22 11:32:31');
INSERT INTO `work_addresses` VALUES (26, 15, '朱老大', '13973131356', '山东省', '370000', '临沂市', '371300', '平邑县', '371326', '1233', NULL, NULL, 1, 0, 1, '2018-12-03 17:05:40', '2018-12-03 17:05:40');
INSERT INTO `work_addresses` VALUES (27, 55, '啊啊啊', '18175974828', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '啊', NULL, NULL, 1, 0, 1, '2018-12-04 14:16:40', '2018-12-04 14:16:40');
INSERT INTO `work_addresses` VALUES (28, 56, '嗯嗯', '18166198431', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '856', NULL, NULL, 1, 0, 1, '2018-12-05 10:00:00', '2018-12-05 10:00:00');
INSERT INTO `work_addresses` VALUES (29, 16, '郑熙', '13787024881', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '558885', NULL, NULL, 1, 0, 1, '2018-12-05 14:03:52', '2018-12-05 14:03:52');
INSERT INTO `work_addresses` VALUES (30, 59, '1', '12345678911', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', NULL, NULL, 1, 0, 1, '2019-01-25 17:24:00', '2019-01-25 17:24:00');
INSERT INTO `work_addresses` VALUES (31, 11, 'huang', '15084960792', '北京市', '110000', '市辖区', '110100', '东城区', '110101', 'jingan金刚', NULL, NULL, 0, 0, 1, '2019-01-28 15:39:22', '2019-01-28 15:46:51');
INSERT INTO `work_addresses` VALUES (32, 11, 'sadsadasadasd撒大声地', '15084960792', '北京市', '110000', '市辖区', '110100', '东城区', '110101', 'dsadas大萨达所', NULL, NULL, 1, 0, 1, '2019-01-28 15:46:51', '2019-01-28 15:46:51');
INSERT INTO `work_addresses` VALUES (33, 60, '卢汛', '15073689110', '上海市', '310000', '市辖区', '310100', '松江区', '310117', '123', NULL, NULL, 1, 0, 1, '2019-02-11 11:34:21', '2019-02-11 11:34:38');
INSERT INTO `work_addresses` VALUES (34, 63, '记录', '12345678905', '天津市', '120000', '市辖区', '120100', '红桥区', '120106', '急急急', NULL, NULL, 1, 0, 1, '2019-02-14 18:01:51', '2019-02-14 18:01:51');
INSERT INTO `work_addresses` VALUES (35, 62, '在不在不', '15071357527', '天津市', '120000', '市辖区', '120100', '红桥区', '120106', '准备补习班', NULL, NULL, 1, 0, 1, '2019-02-15 09:33:27', '2019-02-15 09:33:27');
INSERT INTO `work_addresses` VALUES (36, 64, '付付付', '18229860977', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '星沙', NULL, NULL, 1, 0, 1, '2019-02-22 11:10:02', '2019-02-22 11:10:02');
INSERT INTO `work_addresses` VALUES (37, 14, '了个热', '15672898584', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '嘞你', NULL, NULL, 1, 0, 1, '2019-02-22 16:13:25', '2019-02-22 16:13:25');
INSERT INTO `work_addresses` VALUES (38, 66, '过分', '12345678904', '辽宁省', '210000', '丹东市', '210600', '市辖区', '210601', '飞飞', NULL, NULL, 1, 0, 1, '2019-02-23 08:36:45', '2019-02-23 08:36:45');
INSERT INTO `work_addresses` VALUES (39, 21, '蒋娇', '15674875874', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '开源鑫贸', NULL, NULL, 1, 0, 1, '2019-02-23 16:50:00', '2019-02-23 16:50:00');
INSERT INTO `work_addresses` VALUES (40, 65, '皮卡', '15273060636', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '北京北京', NULL, NULL, 1, 0, 1, '2019-02-26 10:49:09', '2019-02-26 10:49:09');
COMMIT;

-- ----------------------------
-- Table structure for work_admin_accounts
-- ----------------------------
DROP TABLE IF EXISTS `work_admin_accounts`;
CREATE TABLE `work_admin_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(50) NOT NULL COMMENT '登录的唯一标识符',
  `password` varchar(255) NOT NULL COMMENT '登录密码',
  `admin_id` bigint(20) DEFAULT '0' COMMENT '管理员ID',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态:1正常0已删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_admin_accounts
-- ----------------------------
BEGIN;
INSERT INTO `work_admin_accounts` VALUES (1, 'super', '18002797d30d04fdc5fe16aceec36d47', 1, 1, '2018-04-10 16:40:36', '2018-09-03 10:38:16');
INSERT INTO `work_admin_accounts` VALUES (2, 'admin', 'b5305e8c4c5e08c246943fe736701525', 2, 1, '2018-04-10 16:40:48', '2019-03-29 11:22:20');
INSERT INTO `work_admin_accounts` VALUES (3, 'test', 'b5305e8c4c5e08c246943fe736701525', 3, 0, '2018-04-11 10:22:20', '2018-04-11 10:30:41');
INSERT INTO `work_admin_accounts` VALUES (4, 'test', 'b5305e8c4c5e08c246943fe736701525', 4, 0, '2018-04-11 14:09:07', '2018-09-03 10:37:56');
INSERT INTO `work_admin_accounts` VALUES (5, 'df', 'e6297b585db794e177808f8953b46669', 5, 0, '2018-06-29 11:59:02', '2018-09-03 10:37:53');
INSERT INTO `work_admin_accounts` VALUES (6, 'testadmin', 'b5305e8c4c5e08c246943fe736701525', 6, 0, '2018-08-24 09:52:10', '2018-09-03 10:37:39');
INSERT INTO `work_admin_accounts` VALUES (7, '1', '5f6a0a6526c1fee9485551c9f94aa66b', 7, 0, '2018-09-04 09:48:51', '2018-09-04 09:49:07');
INSERT INTO `work_admin_accounts` VALUES (8, 'yiyun', 'dd9a9818083a8d2bb3810887ecc40dc4', 8, 1, '2018-11-10 10:05:47', '2018-11-10 10:06:29');
INSERT INTO `work_admin_accounts` VALUES (9, '123123', 'e6297b585db794e177808f8953b46669', 9, 1, '2018-11-12 11:36:45', '2018-11-12 11:36:45');
INSERT INTO `work_admin_accounts` VALUES (10, 'wancll520', 'b5305e8c4c5e08c246943fe736701525', 10, 1, '2018-12-06 16:37:49', '2018-12-06 16:39:04');
INSERT INTO `work_admin_accounts` VALUES (11, 'wancll888', 'b5305e8c4c5e08c246943fe736701525', 11, 1, '2018-12-06 16:38:18', '2018-12-06 16:38:49');
COMMIT;

-- ----------------------------
-- Table structure for work_admin_assets
-- ----------------------------
DROP TABLE IF EXISTS `work_admin_assets`;
CREATE TABLE `work_admin_assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NOT NULL COMMENT '管理员ID',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `score` decimal(10,2) DEFAULT '0.00' COMMENT '积分',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_admin_assets
-- ----------------------------
BEGIN;
INSERT INTO `work_admin_assets` VALUES (1, 5, 0.00, 0.00, 1, '2018-06-29 11:59:02', '2018-06-29 11:59:02');
INSERT INTO `work_admin_assets` VALUES (2, 6, 0.00, 0.00, 1, '2018-08-24 09:52:10', '2018-08-24 09:52:10');
INSERT INTO `work_admin_assets` VALUES (3, 7, 0.00, 0.00, 1, '2018-09-04 09:48:51', '2018-09-04 09:48:51');
INSERT INTO `work_admin_assets` VALUES (4, 8, 0.00, 0.00, 1, '2018-11-10 10:05:47', '2018-11-10 10:05:47');
INSERT INTO `work_admin_assets` VALUES (5, 9, 0.00, 0.00, 1, '2018-11-12 11:36:45', '2018-11-12 11:36:45');
INSERT INTO `work_admin_assets` VALUES (6, 10, 0.00, 0.00, 1, '2018-12-06 16:37:49', '2018-12-06 16:37:49');
INSERT INTO `work_admin_assets` VALUES (7, 11, 0.00, 0.00, 1, '2018-12-06 16:38:18', '2018-12-06 16:38:18');
COMMIT;

-- ----------------------------
-- Table structure for work_admin_tokens
-- ----------------------------
DROP TABLE IF EXISTS `work_admin_tokens`;
CREATE TABLE `work_admin_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_account_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '管理员账号ID',
  `admin_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `client_type` varchar(50) NOT NULL COMMENT '客户端类型：pc|wap|app|wechat|applet',
  `token` varchar(255) NOT NULL COMMENT '授权token',
  `refresh_token` varchar(255) DEFAULT NULL COMMENT '刷新token',
  `expire_time` int(11) DEFAULT NULL COMMENT 'token有效时长，为空表示永久有效',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_admin_tokens
-- ----------------------------
BEGIN;
INSERT INTO `work_admin_tokens` VALUES (1, 2, 2, 'pc', 'admin&pc@60d11ba7df136201db1d4d2170c21863', 'admin&pc@26e5a2522615ed092eaf5d653fb2152f', 7200, 1, '2018-10-29 12:00:17', '2018-10-29 12:00:17');
INSERT INTO `work_admin_tokens` VALUES (2, 1, 1, 'pc', 'admin&pc@aab313b9a56cf9bca5dd368633ddf44d', 'admin&pc@17936dad01a1b967f683fcdc2e883973', 7200, 1, '2018-10-29 13:35:21', '2018-10-29 13:35:21');
INSERT INTO `work_admin_tokens` VALUES (3, 1, 1, 'pc', 'admin&pc@1d96f40dea99afa4fd0d21dfd6f7d1d6', 'admin&pc@392adb8ec20199256967fd581960e7fb', 7200, 1, '2018-10-29 13:37:46', '2018-10-29 13:37:46');
INSERT INTO `work_admin_tokens` VALUES (4, 1, 1, 'pc', 'admin&pc@31c017c9bc6c77a43413731df094da06', 'admin&pc@94718ef71efec3bff750825099eb9d4d', 7200, 1, '2018-11-10 09:26:33', '2018-11-10 15:39:48');
INSERT INTO `work_admin_tokens` VALUES (5, 2, 2, 'pc', 'admin&pc@3cda3afbdc72a7d9f7fc4370bec20da7', 'admin&pc@4ebed71e25ca3cc96bd875a392104bd6', 7200, 1, '2018-11-10 09:27:04', '2018-11-10 09:27:04');
INSERT INTO `work_admin_tokens` VALUES (6, 1, 1, 'pc', 'admin&pc@3abe08c7c13c20b0c57f7edbdaedcfe5', 'admin&pc@73a5e4595917d2ef252fa0da7dca3e55', 7200, 1, '2018-11-10 09:28:09', '2018-11-10 09:28:09');
INSERT INTO `work_admin_tokens` VALUES (7, 1, 1, 'pc', 'admin&pc@f103b9fa9d81b776db8bdf2ecf23bce7', 'admin&pc@37418435e5387d06f1a58b88fed4bb53', 7200, 1, '2018-11-10 10:05:05', '2018-11-10 10:05:05');
INSERT INTO `work_admin_tokens` VALUES (8, 8, 8, 'pc', 'admin&pc@102f3610b44ee684a6850c02c26cd306', 'admin&pc@6fdff9047265650e4dc87f7a82242b51', 7200, 1, '2018-11-10 10:09:38', '2018-11-10 10:09:38');
INSERT INTO `work_admin_tokens` VALUES (9, 1, 1, 'pc', 'admin&pc@4cda7dc12e56d60747f1b0f135945239', 'admin&pc@de9ccfcb49335686c57f5436489fb7b7', 7200, 1, '2018-11-10 10:09:58', '2018-11-10 10:09:58');
INSERT INTO `work_admin_tokens` VALUES (10, 1, 1, 'pc', 'admin&pc@c279dd76e2f942f63392f572edd381df', 'admin&pc@146914058830cd847d2deee615fb3505', 7200, 1, '2018-11-10 10:32:46', '2018-11-10 10:32:46');
INSERT INTO `work_admin_tokens` VALUES (11, 2, 2, 'pc', 'admin&pc@a135299dfd26a546ae37436f30b25380', 'admin&pc@35182dedc5f5767daefaf36f3ee8356b', 7200, 1, '2018-11-10 10:42:40', '2018-11-10 17:58:04');
INSERT INTO `work_admin_tokens` VALUES (12, 2, 2, 'pc', 'admin&pc@76a261b5fc7234aa368c32eb6fce8388', 'admin&pc@a3c2d610acfe69c4e5d47b8f644af941', 7200, 1, '2018-11-10 10:46:42', '2018-11-10 10:46:42');
INSERT INTO `work_admin_tokens` VALUES (13, 1, 1, 'pc', 'admin&pc@d2e424ee6df49e88159b655d5d08b0f4', 'admin&pc@986cec935c02b453b7ccc577cce488cb', 7200, 1, '2018-11-10 11:10:02', '2018-11-10 11:10:02');
INSERT INTO `work_admin_tokens` VALUES (14, 2, 2, 'pc', 'admin&pc@ea2d5d84cb849220b862c5a885a7457a', 'admin&pc@19eca57ee5d20fcefba1562dd36e4118', 7200, 1, '2018-11-10 13:40:38', '2018-11-10 13:40:38');
INSERT INTO `work_admin_tokens` VALUES (15, 2, 2, 'pc', 'admin&pc@c4ff7b5847e983ddff294a6b860f113f', 'admin&pc@2716135ebada02306c9f52f7ad6907b3', 7200, 1, '2018-11-10 14:41:44', '2018-11-10 14:41:44');
INSERT INTO `work_admin_tokens` VALUES (16, 2, 2, 'pc', 'admin&pc@695085dbe2adf93e4d6679bd3d913223', 'admin&pc@7d17d51d576e907a822af0aebd2eaadb', 7200, 1, '2018-11-10 14:52:02', '2018-11-10 14:52:02');
INSERT INTO `work_admin_tokens` VALUES (26, 2, 2, 'pc', 'admin&pc@99400b0edf533610eedb8d74b127d6f7', 'admin&pc@9d181528fb652a358f1bd31556a72edb', 7200, 1, '2018-11-12 10:24:21', '2018-11-12 13:53:50');
INSERT INTO `work_admin_tokens` VALUES (18, 1, 1, 'pc', 'admin&pc@a35d3fa2b94f19b760613f974e67094e', 'admin&pc@bcae2665336e6b8106bb685240f22e21', 7200, 1, '2018-11-10 15:45:45', '2018-11-10 15:45:45');
INSERT INTO `work_admin_tokens` VALUES (19, 1, 1, 'pc', 'admin&pc@9b2057c7d72d20d3bd712004942f68ef', 'admin&pc@60a3cc5ba0da8f1d65edf1831631529a', 7200, 1, '2018-11-10 16:10:52', '2018-11-10 16:10:52');
INSERT INTO `work_admin_tokens` VALUES (20, 1, 1, 'pc', 'admin&pc@d97f7a1e2f12a444a099c63a4791ec3a', 'admin&pc@00067832e6050230334e22915abb7fdb', 7200, 1, '2018-11-10 16:24:21', '2018-11-10 16:24:21');
INSERT INTO `work_admin_tokens` VALUES (21, 1, 1, 'pc', 'admin&pc@394e47788d2b1e2bd0b4fbdb16e86751', 'admin&pc@086fa6137a10765cf34331375fbd0665', 7200, 1, '2018-11-10 17:10:13', '2018-11-10 17:10:13');
INSERT INTO `work_admin_tokens` VALUES (22, 1, 1, 'pc', 'admin&pc@3453a303ff1881c91d14e16c248597ce', 'admin&pc@2943b81d18b62b219af93494a341de27', 7200, 1, '2018-11-10 17:13:52', '2018-11-10 17:13:52');
INSERT INTO `work_admin_tokens` VALUES (23, 1, 1, 'pc', 'admin&pc@b8324fd68d4428021f2a1339e297cdd0', 'admin&pc@96a055b865b766e43ff5bd67887c039d', 7200, 1, '2018-11-10 17:14:17', '2018-11-10 17:14:17');
INSERT INTO `work_admin_tokens` VALUES (24, 2, 2, 'pc', 'admin&pc@670f50d27f5c142ffa7d918da267e194', 'admin&pc@33f763c970b497885418f20bdbfe0778', 7200, 1, '2018-11-10 17:38:40', '2018-11-10 17:38:40');
INSERT INTO `work_admin_tokens` VALUES (25, 2, 2, 'pc', 'admin&pc@051e64e198f2bf5feb7fc34dbb43d8e7', 'admin&pc@931f1db1fbbb4a7fe8301c2e9ccae8c3', 7200, 1, '2018-11-11 21:16:02', '2018-11-11 21:16:02');
INSERT INTO `work_admin_tokens` VALUES (27, 2, 2, 'pc', 'admin&pc@c240fe992aa1b078cff1824cf84d0787', 'admin&pc@57fe20ce4aaa60e9e30b872ca13e09a6', 7200, 1, '2018-11-12 10:28:32', '2018-11-12 10:28:32');
INSERT INTO `work_admin_tokens` VALUES (28, 2, 2, 'pc', 'admin&pc@c570379b443da0a0c8101f172d11041d', 'admin&pc@a6aec55bb028a0b623ecb6bdedae2d6e', 7200, 1, '2018-11-12 11:06:00', '2018-11-12 14:35:49');
INSERT INTO `work_admin_tokens` VALUES (29, 2, 2, 'pc', 'admin&pc@b8f080aab110452333ede58a0d81b698', 'admin&pc@9d690ad6d6a2bdb757d529fef1429f30', 7200, 1, '2018-11-12 11:09:16', '2018-11-12 11:09:16');
INSERT INTO `work_admin_tokens` VALUES (30, 9, 9, 'pc', 'admin&pc@ea1e207ef0f79c7ae1d81b5b7c2f0005', 'admin&pc@690c0e64b9540123718ecbbf985c0c31', 7200, 1, '2018-11-12 11:37:00', '2018-11-12 16:03:52');
INSERT INTO `work_admin_tokens` VALUES (31, 2, 2, 'pc', 'admin&pc@0282eedea3142873dde6215dbd202cd6', 'admin&pc@31db1fb65287c65fd5f808f53a614f69', 7200, 1, '2018-11-12 13:36:57', '2018-11-12 13:36:57');
INSERT INTO `work_admin_tokens` VALUES (32, 2, 2, 'pc', 'admin&pc@eed0034a2bedef69eba9721bc09d56e0', 'admin&pc@8884ff833ce9ca782cfbae0dfa719583', 7200, 1, '2018-11-12 13:42:06', '2018-11-12 13:42:06');
INSERT INTO `work_admin_tokens` VALUES (33, 2, 2, 'pc', 'admin&pc@6f5acea2585538239b78c0ff0f16ed2f', 'admin&pc@08c0dfcd6c4e35715a325ab5726559b7', 7200, 1, '2018-11-12 13:50:10', '2018-11-12 15:50:23');
INSERT INTO `work_admin_tokens` VALUES (34, 2, 2, 'pc', 'admin&pc@e44c69b994729e5863738379ee9c91e0', 'admin&pc@47ae31e70f900a89e8209072107fc031', 7200, 1, '2018-11-12 14:31:23', '2018-11-12 14:31:23');
INSERT INTO `work_admin_tokens` VALUES (35, 2, 2, 'pc', 'admin&pc@cbb972d53dfedbcba0608aa2e8f05d50', 'admin&pc@04f164d1dae57ba1054dd7b2cff6c872', 7200, 1, '2018-11-12 15:57:27', '2018-11-12 15:57:27');
INSERT INTO `work_admin_tokens` VALUES (36, 1, 1, 'pc', 'admin&pc@f8407b5edb40b31e703d925b43fb1435', 'admin&pc@c5e4f6183f0c833a32bc3420338e58a0', 7200, 1, '2018-11-12 15:58:35', '2018-11-12 15:58:35');
INSERT INTO `work_admin_tokens` VALUES (88, 2, 2, 'pc', 'admin&pc@9a410bc5df91f701ad8bea033443975a', 'admin&pc@457d6431d50359a4c9ab5455b5b8a27d', 7200, 1, '2018-12-04 17:36:49', '2018-12-04 17:36:49');
INSERT INTO `work_admin_tokens` VALUES (103, 2, 2, 'pc', 'admin&pc@66081df6558d200b5d053c4cdd36574d', 'admin&pc@c5860e4ac53a6a33e2787b4bba6d93a2', 7200, 1, '2018-12-05 18:02:33', '2018-12-05 18:02:33');
INSERT INTO `work_admin_tokens` VALUES (75, 2, 2, 'pc', 'admin&pc@71cff495edeb50005de14d3e676249e4', 'admin&pc@ab0292fa95fd495be63e9c6dd5901d6c', 7200, 1, '2018-12-03 11:16:11', '2018-12-03 17:04:37');
INSERT INTO `work_admin_tokens` VALUES (59, 2, 2, 'pc', 'admin&pc@9a52ea62f7644c54d77782ac128809f3', 'admin&pc@20d4babb12cc704f4c0e7493c3718b1e', 7200, 1, '2018-11-30 15:41:57', '2018-11-30 15:41:57');
INSERT INTO `work_admin_tokens` VALUES (41, 2, 2, 'pc', 'admin&pc@4f2b1f8553ff62d8699c0ad694ec5e51', 'admin&pc@d512abd8c0ad33cec9ad369cf94441a9', 7200, 1, '2018-11-27 17:54:03', '2018-11-27 17:54:03');
INSERT INTO `work_admin_tokens` VALUES (42, 2, 2, 'pc', 'admin&pc@423bcda88cf2677fd9389f802839e12c', 'admin&pc@c9cc6d669a5dfef90e0aafb99d33abc8', 7200, 1, '2018-11-28 09:47:05', '2018-11-28 09:47:05');
INSERT INTO `work_admin_tokens` VALUES (43, 2, 2, 'pc', 'admin&pc@59d0f9d2ab87847b185ff1d5f5c4b999', 'admin&pc@85572754aa97fa9c7481c314152b8663', 7200, 1, '2018-11-28 11:31:27', '2018-11-28 11:31:27');
INSERT INTO `work_admin_tokens` VALUES (94, 2, 2, 'pc', 'admin&pc@1042e5d114a0583c9b8829ece5a1e748', 'admin&pc@9ed56416265e00c0cd1c8503d0f1916a', 7200, 1, '2018-12-05 10:08:05', '2018-12-06 14:06:36');
INSERT INTO `work_admin_tokens` VALUES (61, 1, 1, 'pc', 'admin&pc@a09b70c692f65ebe7e497e67b158a86f', 'admin&pc@6ced0314333d19a81641aa057957b536', 7200, 1, '2018-11-30 22:09:31', '2018-11-30 22:09:31');
INSERT INTO `work_admin_tokens` VALUES (68, 2, 2, 'pc', 'admin&pc@05085af4e3b05e50660d5e1ca3462eaa', 'admin&pc@8625c98cadce6d51dc6cebfc27694aab', 7200, 1, '2018-12-01 11:16:05', '2018-12-01 11:16:05');
INSERT INTO `work_admin_tokens` VALUES (48, 2, 2, 'pc', 'admin&pc@9bea945f9220a0e03146591e1323f567', 'admin&pc@c6deb11fc523bff4679d25c00559e81f', 7200, 1, '2018-11-29 14:00:26', '2018-11-29 14:00:26');
INSERT INTO `work_admin_tokens` VALUES (49, 2, 2, 'pc', 'admin&pc@d3e180ba0493a8ac6bf0928ea1a814b5', 'admin&pc@bb655f3132f9c4271acd6dadde80630c', 7200, 1, '2018-11-29 14:00:58', '2018-11-29 16:15:26');
INSERT INTO `work_admin_tokens` VALUES (50, 1, 1, 'pc', 'admin&pc@b9d3513483268b9ca6b5b7db26551ea9', 'admin&pc@ac78a2bcf3366a557e8d0d56f9fdfd0a', 7200, 1, '2018-11-29 14:44:15', '2018-11-29 14:44:15');
INSERT INTO `work_admin_tokens` VALUES (51, 2, 2, 'pc', 'admin&pc@5269cfb007de60f0dffdd0e86656deac', 'admin&pc@7401709265c74b7b7a330746cb59625e', 7200, 1, '2018-11-29 15:32:51', '2018-11-29 15:32:51');
INSERT INTO `work_admin_tokens` VALUES (53, 2, 2, 'pc', 'admin&pc@29c24c25251ec4942ceec8bcbea09b3d', 'admin&pc@9b27a034fad206e4a5888c155d6d1db7', 7200, 1, '2018-11-29 16:22:41', '2018-11-29 16:22:41');
INSERT INTO `work_admin_tokens` VALUES (97, 2, 2, 'pc', 'admin&pc@8722bcac3212bd60184e11f425007182', 'admin&pc@2369b800c82a6d19bec470174452ec87', 7200, 1, '2018-12-05 14:23:49', '2018-12-07 09:13:16');
INSERT INTO `work_admin_tokens` VALUES (99, 1, 1, 'pc', 'admin&pc@b6e349d4c730187f61b653950aab688e', 'admin&pc@81ecf5aff29bad583e261cac67a46aff', 7200, 1, '2018-12-05 15:29:43', '2018-12-06 15:26:01');
INSERT INTO `work_admin_tokens` VALUES (57, 2, 2, 'pc', 'admin&pc@d81c8aa1985889122b1f79bc0f85f59a', 'admin&pc@7259a8a51f6545cceb6af3edf5506d22', 7200, 1, '2018-11-30 11:29:24', '2018-11-30 11:29:24');
INSERT INTO `work_admin_tokens` VALUES (58, 2, 2, 'pc', 'admin&pc@e3fffd45263b42146c6ee50598f1ed8d', 'admin&pc@a7666f8e19f04e6d1c7aa75f16310ac6', 7200, 1, '2018-11-30 15:17:03', '2018-11-30 15:17:03');
INSERT INTO `work_admin_tokens` VALUES (62, 1, 1, 'pc', 'admin&pc@69c61f52178b13bd4e1fa0ad0fb113f3', 'admin&pc@a20752fa20946796ee8aed38326144b8', 7200, 1, '2018-11-30 22:42:43', '2018-11-30 22:42:43');
INSERT INTO `work_admin_tokens` VALUES (63, 1, 1, 'pc', 'admin&pc@6badddec16cc4167d498cb6064935611', 'admin&pc@cf2834a41e4f2e3bb725ce549a8c4500', 7200, 1, '2018-11-30 23:03:28', '2018-11-30 23:03:28');
INSERT INTO `work_admin_tokens` VALUES (90, 1, 1, 'pc', 'admin&pc@351f100122b7e1f3bcd7f884218ae716', 'admin&pc@b61fc540b2c507a29beb7bc35cc182b9', 7200, 1, '2018-12-05 09:08:50', '2018-12-05 09:08:50');
INSERT INTO `work_admin_tokens` VALUES (65, 1, 1, 'pc', 'admin&pc@19ad374c7853868974ca652728650230', 'admin&pc@596bd0fe28d3e00c28313eb45e664139', 7200, 1, '2018-11-30 23:21:56', '2018-11-30 23:21:56');
INSERT INTO `work_admin_tokens` VALUES (101, 2, 2, 'pc', 'admin&pc@8642537d2c796cc4b181101d201feb14', 'admin&pc@3eeac95cc78498299ebf675ed69e451f', 7200, 1, '2018-12-05 16:22:52', '2018-12-05 16:22:52');
INSERT INTO `work_admin_tokens` VALUES (85, 2, 2, 'pc', 'admin&pc@89c6b6f7f04644cb32db98cc03970a67', 'admin&pc@8564348014efd26f3fb1bb4fc0f432ed', 7200, 1, '2018-12-04 16:35:39', '2018-12-04 16:35:39');
INSERT INTO `work_admin_tokens` VALUES (87, 2, 2, 'pc', 'admin&pc@9b48e47cb15e4380dcd8a22449458d55', 'admin&pc@878773e6b9fba66b7c014bda604d5d11', 7200, 1, '2018-12-04 17:28:16', '2018-12-05 15:09:07');
INSERT INTO `work_admin_tokens` VALUES (76, 2, 2, 'pc', 'admin&pc@d0ee5c0f794c66566e0aa4f5ed6ac221', 'admin&pc@384972cd2b06f277e596cc2fbca978a7', 7200, 1, '2018-12-03 11:36:09', '2018-12-03 11:36:09');
INSERT INTO `work_admin_tokens` VALUES (77, 2, 2, 'pc', 'admin&pc@192743203da64059f1cb397425a525af', 'admin&pc@8ef3c7a76f0e9e3f5c7dab93dd51c20f', 7200, 1, '2018-12-03 13:31:15', '2018-12-03 13:31:15');
INSERT INTO `work_admin_tokens` VALUES (78, 2, 2, 'pc', 'admin&pc@329c5c86d61ea534df342573907d7fd4', 'admin&pc@d9ec61a154c078f7867f78cf62d68e84', 7200, 1, '2018-12-03 14:42:05', '2018-12-03 18:45:18');
INSERT INTO `work_admin_tokens` VALUES (79, 2, 2, 'pc', 'admin&pc@0315375ecf65b5ddfe0acc1c6eb45359', 'admin&pc@f844bfcecb5fc7b08fd3c8a98481c52f', 7200, 1, '2018-12-03 15:14:52', '2018-12-03 15:14:52');
INSERT INTO `work_admin_tokens` VALUES (93, 2, 2, 'pc', 'admin&pc@4a0c6c7f49dc8e2c183cf00dc338d635', 'admin&pc@d3be1c3b72f4f2ceb2057aa27779c5c0', 7200, 1, '2018-12-05 10:02:15', '2018-12-05 10:02:15');
INSERT INTO `work_admin_tokens` VALUES (81, 1, 1, 'pc', 'admin&pc@38e6c1eb3a63ce0d820285a60773c2a5', 'admin&pc@a3f3257afe00f72139ff670a3bad316e', 7200, 1, '2018-12-03 17:58:34', '2018-12-03 17:58:34');
INSERT INTO `work_admin_tokens` VALUES (107, 2, 2, 'pc', 'admin&pc@3fbd394e6ea9d4029cd640ca990e1e2e', 'admin&pc@f4a0624fc11363424b698db7148c7d3a', 7200, 1, '2018-12-07 09:27:47', '2018-12-07 09:27:47');
INSERT INTO `work_admin_tokens` VALUES (83, 2, 2, 'pc', 'admin&pc@52fe999675b05e8f7cb4f80bbc6e08c8', 'admin&pc@447e87ef1f6d0b0a63ba53a284f7c440', 7200, 1, '2018-12-04 13:46:38', '2018-12-04 13:46:38');
INSERT INTO `work_admin_tokens` VALUES (84, 2, 2, 'pc', 'admin&pc@23bc437cdbedeebd26a171c86ddcc67c', 'admin&pc@eda4d81a2ea65a46dfe403995e670172', 7200, 1, '2018-12-04 15:11:59', '2018-12-04 15:11:59');
INSERT INTO `work_admin_tokens` VALUES (89, 1, 1, 'pc', 'admin&pc@e1b77bedf1efbb376d168f162898ecfe', 'admin&pc@b6a8ab89fed02c344c9712aeb8f59283', 7200, 1, '2018-12-04 17:41:24', '2018-12-05 09:08:38');
INSERT INTO `work_admin_tokens` VALUES (91, 1, 1, 'pc', 'admin&pc@88c1ce1fe0fefd4c063aba3efc1332a9', 'admin&pc@8df99ed22bb81c4e87b48a6d20add0bb', 7200, 1, '2018-12-05 09:10:11', '2018-12-05 09:10:11');
INSERT INTO `work_admin_tokens` VALUES (92, 2, 2, 'pc', 'admin&pc@e38a76bcc83ef46e59645ae6d0266168', 'admin&pc@831cc817515550092680f042363012f1', 7200, 1, '2018-12-05 09:31:45', '2018-12-07 08:57:33');
INSERT INTO `work_admin_tokens` VALUES (105, 2, 2, 'pc', 'admin&pc@cc6494e9c1133eb6e6dc79f86e4d534e', 'admin&pc@20578dff36fc7b8d85632032b9c80e68', 7200, 1, '2018-12-06 19:18:43', '2018-12-06 19:18:43');
INSERT INTO `work_admin_tokens` VALUES (96, 2, 2, 'pc', 'admin&pc@88e547976937741e38a4726b94dd840c', 'admin&pc@902ca942caf8b6af32f432693a9f828e', 7200, 1, '2018-12-05 12:08:03', '2018-12-05 12:08:03');
INSERT INTO `work_admin_tokens` VALUES (98, 2, 2, 'pc', 'admin&pc@bf88db59a782734e1131b95a53528b97', 'admin&pc@7c6ffa29eaa0e2cd48687d07dcee04c0', 7200, 1, '2018-12-05 15:05:38', '2018-12-05 15:05:38');
INSERT INTO `work_admin_tokens` VALUES (100, 2, 2, 'pc', 'admin&pc@2db187f315cd2256a397f908d993b0b7', 'admin&pc@caf953ec003732602a8153e14746160f', 7200, 1, '2018-12-05 16:16:08', '2018-12-05 16:16:08');
INSERT INTO `work_admin_tokens` VALUES (102, 2, 2, 'pc', 'admin&pc@4b70baa4b9f3655e502033413decfedb', 'admin&pc@94f6008f18123b0577eadcf1c814b645', 7200, 1, '2018-12-05 16:47:44', '2018-12-05 16:47:44');
INSERT INTO `work_admin_tokens` VALUES (104, 2, 2, 'pc', 'admin&pc@908c119068458e8c3a8a6cb0ff3c3f16', 'admin&pc@5e30d4b83c253dce8638496a996397bd', 7200, 1, '2018-12-06 18:35:47', '2018-12-06 18:35:47');
INSERT INTO `work_admin_tokens` VALUES (106, 2, 2, 'pc', 'admin&pc@566521cd6d97f98e53f343fe23dc2b76', 'admin&pc@b43e6787da32e11605028b9eb2bbc8bd', 7200, 1, '2018-12-06 20:08:15', '2018-12-06 20:08:15');
INSERT INTO `work_admin_tokens` VALUES (108, 2, 2, 'pc', 'admin&pc@2362a5e4733e6f2bde3c590cfff50711', 'admin&pc@206371f583c91a313124463aa1c069fa', 7200, 1, '2019-01-22 13:55:36', '2019-01-22 13:55:36');
INSERT INTO `work_admin_tokens` VALUES (163, 2, 2, 'pc', 'admin&pc@c67395f90a278af34514bb8ef449387b', 'admin&pc@47cb4c2601ab214d8c5b9780db63e67d', 7200, 1, '2019-02-13 14:07:39', '2019-02-13 14:07:39');
INSERT INTO `work_admin_tokens` VALUES (170, 2, 2, 'pc', 'admin&pc@78ba6d85bc0733226292cb817c1e223d', 'admin&pc@9b154cf508b1029e708e1486c8fb61b1', 7200, 1, '2019-02-14 11:46:16', '2019-02-14 11:46:16');
INSERT INTO `work_admin_tokens` VALUES (137, 2, 2, 'pc', 'admin&pc@0a000e96fa7e3c1c3a2f1fb7a39dd7cd', 'admin&pc@e0cbedd4ababb12b89e767aa0e03f5cd', 7200, 1, '2019-01-28 11:43:26', '2019-01-28 11:43:26');
INSERT INTO `work_admin_tokens` VALUES (112, 2, 2, 'pc', 'admin&pc@cd6aea0363c424b96ac2b797b54570f0', 'admin&pc@89635e40f7aa5ff1869ee540bf4027b3', 7200, 1, '2019-01-22 14:12:00', '2019-01-22 14:12:00');
INSERT INTO `work_admin_tokens` VALUES (153, 2, 2, 'pc', 'admin&pc@523a737b9e7611ec0af958054a151498', 'admin&pc@3baf1b5693d7a75095b29afd4fe1ba20', 7200, 1, '2019-01-31 09:59:00', '2019-01-31 09:59:00');
INSERT INTO `work_admin_tokens` VALUES (167, 1, 1, 'pc', 'admin&pc@c5934f66249cc2d6c7a9075b758a2f0c', 'admin&pc@31cf88dac6a4e9d1d89fe9e89ea69b55', 7200, 1, '2019-02-14 09:54:50', '2019-02-14 09:54:50');
INSERT INTO `work_admin_tokens` VALUES (140, 2, 2, 'pc', 'admin&pc@9ffc5cb57ca50c222607e85c8c025111', 'admin&pc@8b281c40a3c7aaf0d2b5a1219993e338', 7200, 1, '2019-01-28 16:34:28', '2019-01-28 16:34:28');
INSERT INTO `work_admin_tokens` VALUES (138, 2, 2, 'pc', 'admin&pc@8308dcf7a44e9f5602f28e46c5914437', 'admin&pc@1226246f63e9dc657d7f3a6ff285ab6d', 7200, 1, '2019-01-28 14:36:30', '2019-01-30 09:40:29');
INSERT INTO `work_admin_tokens` VALUES (171, 2, 2, 'pc', 'admin&pc@21407969251a056d45ff75838356e682', 'admin&pc@9bd5c22b17386e04a813c87c0248c375', 7200, 1, '2019-02-14 15:28:45', '2019-02-14 15:28:45');
INSERT INTO `work_admin_tokens` VALUES (118, 2, 2, 'pc', 'admin&pc@862acf712b6ef3ce7c16ede7ae73b006', 'admin&pc@a85789ed4aba6a692348aad059480af1', 7200, 1, '2019-01-22 16:42:35', '2019-01-22 16:42:35');
INSERT INTO `work_admin_tokens` VALUES (173, 2, 2, 'pc', 'admin&pc@04c1cac3b1a57db3a74678ac048c164f', 'admin&pc@22722952c7d444888434a5770348295b', 7200, 1, '2019-02-14 16:40:14', '2019-02-14 16:40:14');
INSERT INTO `work_admin_tokens` VALUES (120, 2, 2, 'pc', 'admin&pc@0620748e7ef7d0edde5fb76c54aefb12', 'admin&pc@919316eaedfce3a526bb8ebb7e68721b', 7200, 1, '2019-01-22 21:35:46', '2019-01-25 09:56:41');
INSERT INTO `work_admin_tokens` VALUES (222, 2, 2, 'pc', 'admin&pc@481a0236dd1671b7af404d93477d3608', 'admin&pc@92f7210aafa14ab7a8d901e14c36c40d', 7200, 1, '2019-02-25 17:08:24', '2019-02-26 11:44:04');
INSERT INTO `work_admin_tokens` VALUES (166, 2, 2, 'pc', 'admin&pc@2ff959d6de7c568a350821a964b28e7d', 'admin&pc@92b4ea450728f887378e2ccdf7761568', 7200, 1, '2019-02-14 09:52:20', '2019-02-14 09:52:20');
INSERT INTO `work_admin_tokens` VALUES (123, 2, 2, 'pc', 'admin&pc@6b517855cb3be1b7dfab08333549fdfa', 'admin&pc@d82de238731f8c6cfb4ca5fe2c3f776c', 7200, 1, '2019-01-24 09:27:03', '2019-01-24 18:27:25');
INSERT INTO `work_admin_tokens` VALUES (125, 2, 2, 'pc', 'admin&pc@4446c49db269d3dfd1f7b0fcf2f24332', 'admin&pc@80287279d7e67abf8714177c38b041fd', 7200, 1, '2019-01-24 17:23:11', '2019-01-24 17:23:11');
INSERT INTO `work_admin_tokens` VALUES (127, 2, 2, 'pc', 'admin&pc@e401ba0ef877c2c6be5d99136487dafc', 'admin&pc@38b8a6fa2918b565ab3330e56b1bb8dc', 7200, 1, '2019-01-24 20:17:27', '2019-01-24 20:17:27');
INSERT INTO `work_admin_tokens` VALUES (152, 2, 2, 'pc', 'admin&pc@966ccd1eb876b309a37e5bad0d34cd34', 'admin&pc@bff9fbbff45c3dbb9d6733dbcfbcee67', 7200, 1, '2019-01-31 09:58:19', '2019-01-31 09:58:19');
INSERT INTO `work_admin_tokens` VALUES (129, 1, 1, 'pc', 'admin&pc@7d64981abe01b38fcc13a6a2f1de45f3', 'admin&pc@133db496c8889d8a4438c61395348da5', 7200, 1, '2019-01-25 16:26:39', '2019-01-25 16:26:39');
INSERT INTO `work_admin_tokens` VALUES (131, 1, 1, 'pc', 'admin&pc@a65550ceabca064c08cb136f6268f621', 'admin&pc@b147458017c7b6e2ac8751db6a3e0d24', 7200, 1, '2019-01-25 17:40:58', '2019-01-25 17:40:58');
INSERT INTO `work_admin_tokens` VALUES (133, 2, 2, 'pc', 'admin&pc@647596a6dd9773bd4c3b544102b66a74', 'admin&pc@c28ae565902e73de7eb4ac32d503bd19', 7200, 1, '2019-01-26 09:59:53', '2019-01-26 09:59:53');
INSERT INTO `work_admin_tokens` VALUES (134, 1, 1, 'pc', 'admin&pc@ab9bdc5cfdbf252c4ee15958df77a5be', 'admin&pc@61660ede7189e01bc5cc3955767f9bcd', 7200, 1, '2019-01-26 10:35:35', '2019-01-26 10:35:35');
INSERT INTO `work_admin_tokens` VALUES (139, 2, 2, 'pc', 'admin&pc@edad35c8b02b3faf3f47d05e31939700', 'admin&pc@48530f11938be669308501c0fabfcdc1', 7200, 1, '2019-01-28 14:47:51', '2019-01-28 14:47:51');
INSERT INTO `work_admin_tokens` VALUES (141, 2, 2, 'pc', 'admin&pc@ece699b4a46cb0f37e08ba5c39158f5d', 'admin&pc@f72405c71475da940e15d1b197c57e74', 7200, 1, '2019-01-28 17:20:55', '2019-01-29 09:03:35');
INSERT INTO `work_admin_tokens` VALUES (143, 1, 1, 'pc', 'admin&pc@82440e3d4be91e53e339d40aa60c810b', 'admin&pc@10dc625a59c9481670e4f1fb16953044', 7200, 1, '2019-01-29 10:13:37', '2019-01-29 13:55:46');
INSERT INTO `work_admin_tokens` VALUES (144, 2, 2, 'pc', 'admin&pc@cba32a20eac30aaf976f7b41a37584f3', 'admin&pc@57cd433d42fffb5aedbb6889a35a1744', 7200, 1, '2019-01-29 14:04:33', '2019-01-29 14:04:33');
INSERT INTO `work_admin_tokens` VALUES (151, 2, 2, 'pc', 'admin&pc@d8f3279cecba8bcdc5f710952f538beb', 'admin&pc@57a53f854aab38a8d67eb5694f86f405', 7200, 1, '2019-01-31 09:52:37', '2019-01-31 09:52:37');
INSERT INTO `work_admin_tokens` VALUES (146, 2, 2, 'pc', 'admin&pc@decd8d85ba4df6eea31aa8ddf79e6dbe', 'admin&pc@39559671ce13bb1e9d23634c8e946e1a', 7200, 1, '2019-01-29 14:09:24', '2019-01-29 14:09:24');
INSERT INTO `work_admin_tokens` VALUES (147, 2, 2, 'pc', 'admin&pc@d1398f9ae40f13c346356df2521f5b51', 'admin&pc@d43252872ebc4497d9c62d7c0db70304', 7200, 1, '2019-01-29 15:49:52', '2019-01-29 15:49:52');
INSERT INTO `work_admin_tokens` VALUES (158, 1, 1, 'pc', 'admin&pc@beb69dabf7bcc370b103057ac7b8a244', 'admin&pc@8dc42ab1fcef21f29af047c75dfbf6e4', 7200, 1, '2019-02-11 11:21:10', '2019-02-11 11:21:10');
INSERT INTO `work_admin_tokens` VALUES (149, 2, 2, 'pc', 'admin&pc@776dcb2ce13a47e7c3c395700febcd99', 'admin&pc@789242593fcb628c9f655a5d576af0e6', 7200, 1, '2019-01-29 19:07:33', '2019-01-30 09:34:03');
INSERT INTO `work_admin_tokens` VALUES (156, 2, 2, 'pc', 'admin&pc@6debfc1e6b55770630716b2579290b3f', 'admin&pc@bdb853e6662ecbc21274a9e9ee67c0f0', 7200, 1, '2019-02-11 10:03:35', '2019-02-11 10:03:35');
INSERT INTO `work_admin_tokens` VALUES (155, 2, 2, 'pc', 'admin&pc@b60de9306431a1b111fc0e433d05153f', 'admin&pc@11d1fc9c6401450609fe23eb1806c2a7', 7200, 1, '2019-01-31 13:02:16', '2019-01-31 13:02:16');
INSERT INTO `work_admin_tokens` VALUES (157, 2, 2, 'pc', 'admin&pc@1552c81861f149be6193da2023c443d1', 'admin&pc@0f2d8d591977d837e1422cdf8228b87b', 7200, 1, '2019-02-11 10:07:40', '2019-02-11 13:02:21');
INSERT INTO `work_admin_tokens` VALUES (159, 2, 2, 'pc', 'admin&pc@5d678f42d2bed5ade2db4eee5c5d0de1', 'admin&pc@416ac5c665f859fa69797e59b8d15c14', 7200, 1, '2019-02-11 11:37:40', '2019-02-11 11:37:40');
INSERT INTO `work_admin_tokens` VALUES (160, 2, 2, 'pc', 'admin&pc@97f43c6b805b8232e81ddd1fa3abcf6f', 'admin&pc@8fd1becff0e174beb5fa04409d254808', 7200, 1, '2019-02-13 11:37:12', '2019-02-13 11:37:12');
INSERT INTO `work_admin_tokens` VALUES (161, 2, 2, 'pc', 'admin&pc@0bb104ccbec7cb1f862ac58187ac066a', 'admin&pc@a16272f5655f326e6f08bc55379de151', 7200, 1, '2019-02-13 11:46:44', '2019-02-13 15:11:27');
INSERT INTO `work_admin_tokens` VALUES (219, 2, 2, 'pc', 'admin&pc@294ec982fb8eac83a8e258cb20f2ff9f', 'admin&pc@b18566ede580d7a7320a90c7129c3feb', 7200, 1, '2019-02-25 11:44:43', '2019-02-25 14:50:35');
INSERT INTO `work_admin_tokens` VALUES (227, 2, 2, 'pc', 'admin&pc@3ef958ba4c689c11e7d8bdd187485505', 'admin&pc@068e6c0b855bff2a4c5a3c72c4980960', 7200, 1, '2019-02-26 09:40:18', '2019-02-26 09:40:18');
INSERT INTO `work_admin_tokens` VALUES (165, 2, 2, 'pc', 'admin&pc@3f65652b59872dea9c8092b7d257529f', 'admin&pc@d4cd21af3bdcaa708ef4692ef9fab13b', 7200, 1, '2019-02-13 15:46:23', '2019-02-13 15:46:23');
INSERT INTO `work_admin_tokens` VALUES (168, 2, 2, 'pc', 'admin&pc@f9f56c2fb11ac7b175b48f66d53eda5c', 'admin&pc@447f780d7b0763dea15bb75667302c05', 7200, 1, '2019-02-14 11:24:25', '2019-02-14 11:24:25');
INSERT INTO `work_admin_tokens` VALUES (169, 1, 1, 'pc', 'admin&pc@beebe0a7b5aac8d2e196215e114298b3', 'admin&pc@82a87b058c9727af0a99cf7ac90aab15', 7200, 1, '2019-02-14 11:24:49', '2019-02-14 14:51:14');
INSERT INTO `work_admin_tokens` VALUES (174, 2, 2, 'pc', 'admin&pc@ec7cec9aa20666e749f7c6466dee125a', 'admin&pc@5e514ab5c7d4f5a91fb40419d9ad78e1', 7200, 1, '2019-02-14 17:54:01', '2019-02-15 09:32:27');
INSERT INTO `work_admin_tokens` VALUES (175, 1, 1, 'pc', 'admin&pc@82efdc97d166fd2a84a106e277dcdfcf', 'admin&pc@f8f9efc6b5da0758c3fd32d685a3a14a', 7200, 1, '2019-02-15 11:15:13', '2019-02-15 11:15:13');
INSERT INTO `work_admin_tokens` VALUES (176, 2, 2, 'pc', 'admin&pc@d0353e38940db006dad35c51719b56dd', 'admin&pc@5b2baad63f3e38102d31339f6fca8fc3', 7200, 1, '2019-02-22 10:08:08', '2019-02-23 15:54:17');
INSERT INTO `work_admin_tokens` VALUES (197, 2, 2, 'pc', 'admin&pc@eee76961b3ae3f11bc87c109ef3905e8', 'admin&pc@de23e4e296b61ad48222aa48b3aa94f2', 7200, 1, '2019-02-23 15:15:37', '2019-02-23 15:15:37');
INSERT INTO `work_admin_tokens` VALUES (195, 2, 2, 'pc', 'admin&pc@11afd64680e0508c67f47e9d0f35522d', 'admin&pc@5d3f1efde26bae48fca90db5d23543f0', 7200, 1, '2019-02-23 14:32:00', '2019-02-23 14:32:00');
INSERT INTO `work_admin_tokens` VALUES (179, 2, 2, 'pc', 'admin&pc@d9589165ee562c3aa494e930d15ad2d7', 'admin&pc@f5d2f3cc99d421da621fb731b5e0f8b3', 7200, 1, '2019-02-22 10:45:10', '2019-02-22 16:12:30');
INSERT INTO `work_admin_tokens` VALUES (216, 2, 2, 'pc', 'admin&pc@e13fa5389404b37714dd964a74f39aa4', 'admin&pc@c1e16771967f576914a36eb929ffbfb7', 7200, 1, '2019-02-25 09:17:37', '2019-02-26 11:17:38');
INSERT INTO `work_admin_tokens` VALUES (181, 2, 2, 'pc', 'admin&pc@554b220a11768ef72691d4b0564070d1', 'admin&pc@5a990b341c506a658a4a2e770b63a220', 7200, 1, '2019-02-22 11:16:08', '2019-02-23 17:33:28');
INSERT INTO `work_admin_tokens` VALUES (221, 2, 2, 'pc', 'admin&pc@6216764cd704b89d520f4a5b83228f34', 'admin&pc@51b36b46846abc9c815f5868f39b688c', 7200, 1, '2019-02-25 16:56:05', '2019-02-26 10:25:56');
INSERT INTO `work_admin_tokens` VALUES (200, 2, 2, 'pc', 'admin&pc@ddcf2d489c2c5c850071e8a55886b35a', 'admin&pc@c78631be322af460c03a6a5679f8a5d2', 7200, 1, '2019-02-23 16:40:00', '2019-02-23 16:40:00');
INSERT INTO `work_admin_tokens` VALUES (184, 2, 2, 'pc', 'admin&pc@1049745568878363419f259a9281da4d', 'admin&pc@545c071c7f285aa2581029086e8c1206', 7200, 1, '2019-02-22 11:42:30', '2019-02-23 11:21:35');
INSERT INTO `work_admin_tokens` VALUES (217, 2, 2, 'pc', 'admin&pc@131ddfa947da3a3011033c6421fe333a', 'admin&pc@512d62d5fc2f16566de6272098bd94e4', 7200, 1, '2019-02-25 09:22:16', '2019-02-26 13:45:15');
INSERT INTO `work_admin_tokens` VALUES (186, 2, 2, 'pc', 'admin&pc@cfcd2a734259f1eb53c9e67e6a680b08', 'admin&pc@3884da57b6ad16ab88bef148a007fb06', 7200, 1, '2019-02-22 15:13:27', '2019-02-23 16:32:51');
INSERT INTO `work_admin_tokens` VALUES (187, 2, 2, 'pc', 'admin&pc@94c7f5240866db909ab96f5b7968f969', 'admin&pc@67fe3e8088afe5e6aceb4ad1874de6e4', 7200, 1, '2019-02-22 17:22:55', '2019-02-22 17:22:55');
INSERT INTO `work_admin_tokens` VALUES (188, 2, 2, 'pc', 'admin&pc@4c1fe183ad0a52a16dc60f52c1fb6521', 'admin&pc@c8c30fd1a810ad50af893e9129c55e9e', 7200, 1, '2019-02-22 17:42:39', '2019-02-22 17:42:39');
INSERT INTO `work_admin_tokens` VALUES (218, 2, 2, 'pc', 'admin&pc@2f71c39087e43a6849c27ca5402c87e0', 'admin&pc@c17669b0cdc1ff6bcd364d26f4a04683', 7200, 1, '2019-02-25 10:42:34', '2019-02-26 13:44:21');
INSERT INTO `work_admin_tokens` VALUES (228, 2, 2, 'pc', 'admin&pc@7b0e72f7fca2bca50883a4d273df1842', 'admin&pc@93cac3c960e29fa11ae80c18390730ca', 7200, 1, '2019-02-26 10:07:24', '2019-02-26 10:07:24');
INSERT INTO `work_admin_tokens` VALUES (194, 2, 2, 'pc', 'admin&pc@b5877aaa62a736844be7d6157d57b09b', 'admin&pc@97a4d20cd9100bc241c3092b78b3b6be', 7200, 1, '2019-02-23 11:44:01', '2019-02-23 11:44:01');
INSERT INTO `work_admin_tokens` VALUES (196, 2, 2, 'pc', 'admin&pc@9edde67f6ebc3f5f74296f050e29264a', 'admin&pc@aff07448e217a2057b453661f14e65ef', 7200, 1, '2019-02-23 14:44:07', '2019-02-23 14:44:07');
INSERT INTO `work_admin_tokens` VALUES (199, 1, 1, 'pc', 'admin&pc@f6852182e248977d31002e454e4a2f5e', 'admin&pc@fdf80119daaccf08859dddc3b00be822', 7200, 1, '2019-02-23 16:33:19', '2019-02-23 16:33:19');
INSERT INTO `work_admin_tokens` VALUES (226, 2, 2, 'pc', 'admin&pc@1276fd0d0343b0b5dcbfd1b0c6d3cfc1', 'admin&pc@bd201f5945833d0ffcdf5cef3f51bb25', 7200, 1, '2019-02-25 21:37:41', '2019-02-25 21:37:41');
INSERT INTO `work_admin_tokens` VALUES (202, 2, 2, 'pc', 'admin&pc@9bb32e657262daabd3eaf0421ab23e05', 'admin&pc@bc177d9b76325dac9aa95bb9a5cdcfe7', 7200, 1, '2019-02-23 16:44:06', '2019-02-23 16:44:06');
INSERT INTO `work_admin_tokens` VALUES (225, 2, 2, 'pc', 'admin&pc@1f387622a378c2f05f90550e00b8b5aa', 'admin&pc@b650f5a88c30912379da4adc79b7cc22', 7200, 1, '2019-02-25 21:21:54', '2019-02-25 21:21:54');
INSERT INTO `work_admin_tokens` VALUES (204, 2, 2, 'pc', 'admin&pc@e9981176aa0a4c8dc6d3a12f47e68c2c', 'admin&pc@dbcf0332528b33c1e47959b81490949c', 7200, 1, '2019-02-24 11:34:36', '2019-02-24 11:34:36');
INSERT INTO `work_admin_tokens` VALUES (205, 2, 2, 'pc', 'admin&pc@0694152f3fe118233880e35ae2a8c34f', 'admin&pc@4a8dafea47a914558dc85f91b3188035', 7200, 1, '2019-02-24 11:49:36', '2019-02-24 14:01:09');
INSERT INTO `work_admin_tokens` VALUES (206, 2, 2, 'pc', 'admin&pc@1da3987bac0cdf2746fdd024760023e5', 'admin&pc@298e147dfd25a02f1c5cb2d2ef60784b', 7200, 1, '2019-02-24 22:28:03', '2019-02-24 22:28:03');
INSERT INTO `work_admin_tokens` VALUES (207, 2, 2, 'pc', 'admin&pc@13ffea46a7f018feee66f7e7cf30e1cc', 'admin&pc@9bc6b755950f6732e3952de60e0fa8ae', 7200, 1, '2019-02-24 22:47:33', '2019-02-24 22:47:33');
INSERT INTO `work_admin_tokens` VALUES (208, 2, 2, 'pc', 'admin&pc@6203442dab970b8b3b12ef1d339006b3', 'admin&pc@141af6ec6210d29fb3cab4653a131918', 7200, 1, '2019-02-24 23:05:45', '2019-02-24 23:05:45');
INSERT INTO `work_admin_tokens` VALUES (209, 2, 2, 'pc', 'admin&pc@a640c40fb6aad925a8fc10d99e1a2ba9', 'admin&pc@88e64fc7b6089b525464b899c21d8d69', 7200, 1, '2019-02-24 23:10:47', '2019-02-24 23:10:47');
INSERT INTO `work_admin_tokens` VALUES (210, 2, 2, 'pc', 'admin&pc@ced8b0c1896f8fe1ecf3aa26a428f6a6', 'admin&pc@6ded2ce22c7c4954792e3714b17210ae', 7200, 1, '2019-02-24 23:12:11', '2019-02-24 23:12:11');
INSERT INTO `work_admin_tokens` VALUES (211, 2, 2, 'pc', 'admin&pc@c6d9ba60fa3d95137f337226f191f941', 'admin&pc@678cfb9ff9c04652836442b278095b57', 7200, 1, '2019-02-24 23:14:05', '2019-02-24 23:14:05');
INSERT INTO `work_admin_tokens` VALUES (212, 2, 2, 'pc', 'admin&pc@2f3ea96b1b6af788f71ff6f0085fc7e0', 'admin&pc@7715063413a2579c629b90745352abe9', 7200, 1, '2019-02-24 23:14:33', '2019-02-24 23:14:33');
INSERT INTO `work_admin_tokens` VALUES (213, 2, 2, 'pc', 'admin&pc@8381bd9a9f3892479a2b5462e2073a09', 'admin&pc@e1f8305f268de91ec34efe4c9f977d30', 7200, 1, '2019-02-24 23:19:05', '2019-02-24 23:19:05');
INSERT INTO `work_admin_tokens` VALUES (214, 2, 2, 'pc', 'admin&pc@5f0001299a741cded497576550ecfb67', 'admin&pc@75d92a212aaaa2c05585dd45a980d8b0', 7200, 1, '2019-02-24 23:22:11', '2019-02-24 23:22:11');
INSERT INTO `work_admin_tokens` VALUES (215, 2, 2, 'pc', 'admin&pc@535ba674e17af39fce7f76408353eb98', 'admin&pc@775231c2889163d28ac0092d21e631da', 7200, 1, '2019-02-24 23:25:11', '2019-02-24 23:25:11');
INSERT INTO `work_admin_tokens` VALUES (220, 2, 2, 'pc', 'admin&pc@aee289f3945a9c807f71321910f7addc', 'admin&pc@e3ccb1644b282646552f325fb4f0d249', 7200, 1, '2019-02-25 14:50:37', '2019-02-25 14:50:37');
INSERT INTO `work_admin_tokens` VALUES (223, 2, 2, 'pc', 'admin&pc@26c17149011634e162c9dbcb4267fb9d', 'admin&pc@9a6b5772f0d2117e63c8485a77c76e28', 7200, 1, '2019-02-25 17:38:45', '2019-02-25 17:38:45');
INSERT INTO `work_admin_tokens` VALUES (224, 2, 2, 'pc', 'admin&pc@b64bf9aab35c6aa975b79d5da39bf7eb', 'admin&pc@d87b1e17b44ad40d6c63ad310ddc686f', 7200, 1, '2019-02-25 20:12:19', '2019-02-25 20:12:19');
INSERT INTO `work_admin_tokens` VALUES (229, 2, 2, 'pc', 'admin&pc@68977daf89ea3740848e89dd3051748e', 'admin&pc@4431d44bb03272c1584c4805a381171c', 7200, 1, '2019-02-26 10:57:50', '2019-02-26 13:40:51');
INSERT INTO `work_admin_tokens` VALUES (230, 2, 2, 'pc', 'admin&pc@2952453792691aff3c12cc9c97fef1a3', 'admin&pc@685b896a1bae40e945806a49b1f523a6', 7200, 1, '2019-02-26 11:44:29', '2019-02-26 11:44:29');
INSERT INTO `work_admin_tokens` VALUES (231, 2, 2, 'pc', 'admin&pc@f6185643774d89c0734017afc1a66f43', 'admin&pc@821fb56cd1ddf0eac8fc6aebdcaab67b', 7200, 1, '2019-03-19 14:23:15', '2019-03-19 14:23:15');
INSERT INTO `work_admin_tokens` VALUES (232, 2, 2, 'pc', 'work@pc@cc456c8c534d19cfc15410db143d051f', 'work@pc@ed704b795e2bfb21b49af28228f281e8', 7200, 1, '2019-03-19 17:32:57', '2019-03-19 17:32:57');
INSERT INTO `work_admin_tokens` VALUES (233, 2, 2, 'pc', 'work@pc@5c8a6602b35c72d70ceb18fd20ea36b6', 'work@pc@80d82f1a36a667c875bbe22d52915e2a', 7200, 1, '2019-03-19 17:33:25', '2019-03-19 17:33:25');
INSERT INTO `work_admin_tokens` VALUES (234, 2, 2, 'pc', 'work@pc@eb83aca749018062cf09cbc884575e2c', 'work@pc@3e89a897afcd213ae109cdd083d7f211', 7200, 1, '2019-03-19 17:35:14', '2019-03-19 17:35:14');
INSERT INTO `work_admin_tokens` VALUES (235, 2, 2, 'pc', 'work@pc@c992d003cb306986ad312881d9047193', 'work@pc@4a0918562e5eff37c8427bd0e0193175', 7200, 1, '2019-03-19 17:35:34', '2019-03-19 17:35:34');
INSERT INTO `work_admin_tokens` VALUES (236, 2, 2, 'pc', 'work@pc@b7fe561dc56a4f2d1f26880085103028', 'work@pc@d9de0247cf8ab692c89e2c496b23c1ba', 7200, 1, '2019-03-19 17:38:47', '2019-03-19 17:38:47');
INSERT INTO `work_admin_tokens` VALUES (237, 2, 2, 'pc', 'work@pc@c19e682b91aeb1378ff212e9cfe29a99', 'work@pc@ba4caa3a67f513d75aa365d000aa7498', 7200, 1, '2019-03-19 17:40:06', '2019-03-19 17:40:06');
INSERT INTO `work_admin_tokens` VALUES (238, 2, 2, 'pc', 'work@pc@f4b8369e08711b039f71c50194cddee4', 'work@pc@a112c5eea532e92a7537356133fdb0da', 7200, 1, '2019-03-19 17:41:05', '2019-03-19 17:41:05');
INSERT INTO `work_admin_tokens` VALUES (239, 2, 2, 'pc', 'work@pc@eb1268da0b20be3984bbbfd621ef987c', 'work@pc@a82424938c264f4d41bba3154e8dffda', 7200, 1, '2019-03-19 17:45:57', '2019-03-19 17:45:57');
INSERT INTO `work_admin_tokens` VALUES (240, 2, 2, 'pc', 'admin&pc@6349f09a96afc28acb8185d1b2710975', 'admin&pc@abb4e6e8fdd85e7117f79c09933d4306', 7200, 1, '2019-03-20 17:46:22', '2019-03-20 17:46:22');
INSERT INTO `work_admin_tokens` VALUES (241, 2, 2, 'pc', 'admin&pc@a2109a3c831e410382c57f2ea20e7212', 'admin&pc@d0210476681f4a4370c870242c57e47e', 7200, 1, '2019-03-20 17:50:23', '2019-03-20 17:50:23');
INSERT INTO `work_admin_tokens` VALUES (242, 2, 2, 'pc', 'admin&pc@66de5765c2d0ed96cdbb674542caba95', 'admin&pc@9a6e10fb40993ab36bdea12e4580193d', 7200, 1, '2019-03-20 17:50:48', '2019-03-20 17:50:48');
INSERT INTO `work_admin_tokens` VALUES (243, 2, 2, 'pc', 'admin&pc@3dbe5cd8f336fa30773d836ea0e0d71e', 'admin&pc@1ca6c76bb5362c8415bd695cd928b177', 7200, 1, '2019-03-20 18:06:32', '2019-03-20 18:06:32');
INSERT INTO `work_admin_tokens` VALUES (244, 2, 2, 'pc', 'admin&pc@bf7eb952ebd578f21984e81920aeb7f1', 'admin&pc@08f3611286cddbbb5db76b2333ed9f03', 7200, 1, '2019-03-20 18:45:14', '2019-03-20 18:45:14');
INSERT INTO `work_admin_tokens` VALUES (245, 2, 2, 'pc', 'admin&pc@56dd9cb3555851c5d2ea5dbca63a6d48', 'admin&pc@1571a2f047f2499007bde1d9ed995151', 7200, 1, '2019-03-20 18:45:40', '2019-03-21 15:11:51');
INSERT INTO `work_admin_tokens` VALUES (248, 2, 2, 'pc', 'admin&pc@5bbb2cdb558c1dc34164086d03936372', 'admin&pc@f750729c0d4f8f35544c2706d566a6ad', 7200, 1, '2019-03-24 16:37:42', '2019-03-24 16:37:42');
INSERT INTO `work_admin_tokens` VALUES (253, 2, 2, 'pc', 'admin&pc@3cdb578361260902053d83e969b622a5', 'admin&pc@146c975f8a382a32c29674de8f34dc96', 7200, 1, '2019-03-27 17:10:29', '2019-03-28 23:47:48');
INSERT INTO `work_admin_tokens` VALUES (251, 2, 2, 'pc', 'admin&pc@e52d903246ede2b601d93b60cf5dcfc4', 'admin&pc@8f517b1467d9068ece957c34e8f46cd8', 7200, 1, '2019-03-25 17:28:07', '2019-03-25 20:40:20');
INSERT INTO `work_admin_tokens` VALUES (250, 2, 2, 'pc', 'admin&pc@7372aca79756a6efc2cf30d70560197f', 'admin&pc@19fcfef9f944c7ac5d05d70c390e152d', 7200, 1, '2019-03-25 13:37:24', '2019-03-25 13:37:24');
INSERT INTO `work_admin_tokens` VALUES (255, 2, 2, 'pc', 'admin&pc@bdb2ca8a1b0f25d55c63c44dc32b58c1', 'admin&pc@bf30e1db715cbd334d99c1f0d048919b', 7200, 1, '2019-03-29 10:45:09', '2019-03-29 10:45:09');
INSERT INTO `work_admin_tokens` VALUES (254, 2, 2, 'pc', 'admin&pc@065f62e7af1b6caf10226fae60093778', 'admin&pc@a9ac96888b08f7143bc3ced4e0f495ef', 7200, 1, '2019-03-28 17:22:20', '2019-03-28 17:22:20');
INSERT INTO `work_admin_tokens` VALUES (256, 2, 2, 'pc', 'admin&pc@d77c66e41d526485fe31c1eef39b021c', 'admin&pc@cf465451ac9a3cd1154d769b8c81c5ab', 7200, 1, '2019-03-29 11:08:38', '2019-03-29 11:08:38');
INSERT INTO `work_admin_tokens` VALUES (257, 2, 2, 'pc', 'admin&pc@c1bb61f50d2cabc20906bd9440506ebf', 'admin&pc@efbe5147b857d01deefa0a6dba1fe9ba', 7200, 1, '2019-03-29 11:13:12', '2019-03-29 11:13:12');
INSERT INTO `work_admin_tokens` VALUES (258, 2, 2, 'pc', 'admin&pc@c901921662e4710b118819496ff2e22c', 'admin&pc@06e6c92d220ad34cf9497a1f7c01b744', 7200, 1, '2019-03-29 11:20:31', '2019-03-29 11:20:31');
INSERT INTO `work_admin_tokens` VALUES (259, 2, 2, 'pc', 'admin&pc@da0a2f3a3b5eee04060a000177fb2cf5', 'admin&pc@21938f9226ddefb8dac1178dc8ce3faf', 7200, 1, '2019-03-29 11:22:03', '2019-03-29 11:22:03');
INSERT INTO `work_admin_tokens` VALUES (260, 2, 2, 'pc', 'admin&pc@d323a5cdcadc4bec0bcda90e3c4fd03f', 'admin&pc@d12554002ecdda7a222ecc4937084c6a', 7200, 1, '2019-03-29 11:22:54', '2019-03-29 13:23:35');
COMMIT;

-- ----------------------------
-- Table structure for work_admin_visit_logs
-- ----------------------------
DROP TABLE IF EXISTS `work_admin_visit_logs`;
CREATE TABLE `work_admin_visit_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_account_id` bigint(20) NOT NULL COMMENT '管理员账号ID',
  `admin_id` bigint(20) NOT NULL COMMENT '管理员ID',
  `ip` varchar(255) NOT NULL COMMENT '访问IP',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `client_type` varchar(255) NOT NULL COMMENT '客户端类型：pc|wap|app|wechat|applet',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_admin_visit_logs
-- ----------------------------
BEGIN;
INSERT INTO `work_admin_visit_logs` VALUES (1, 2, 2, '175.8.204.64', '2018-10-29 12:00:17', 'pc', 1, '2018-10-29 12:00:17', '2018-10-29 12:00:17');
INSERT INTO `work_admin_visit_logs` VALUES (2, 1, 1, '175.8.204.64', '2018-10-29 13:35:21', 'pc', 1, '2018-10-29 13:35:21', '2018-10-29 13:35:21');
INSERT INTO `work_admin_visit_logs` VALUES (3, 1, 1, '175.8.204.64', '2018-10-29 13:37:46', 'pc', 1, '2018-10-29 13:37:46', '2018-10-29 13:37:46');
INSERT INTO `work_admin_visit_logs` VALUES (4, 1, 1, '113.246.203.142', '2018-11-10 09:26:33', 'pc', 1, '2018-11-10 09:26:33', '2018-11-10 09:26:33');
INSERT INTO `work_admin_visit_logs` VALUES (5, 2, 2, '113.246.203.142', '2018-11-10 09:27:04', 'pc', 1, '2018-11-10 09:27:04', '2018-11-10 09:27:04');
INSERT INTO `work_admin_visit_logs` VALUES (6, 1, 1, '113.246.203.142', '2018-11-10 09:28:09', 'pc', 1, '2018-11-10 09:28:09', '2018-11-10 09:28:09');
INSERT INTO `work_admin_visit_logs` VALUES (7, 1, 1, '113.246.203.142', '2018-11-10 10:05:05', 'pc', 1, '2018-11-10 10:05:05', '2018-11-10 10:05:05');
INSERT INTO `work_admin_visit_logs` VALUES (8, 8, 8, '113.246.203.142', '2018-11-10 10:09:38', 'pc', 1, '2018-11-10 10:09:38', '2018-11-10 10:09:38');
INSERT INTO `work_admin_visit_logs` VALUES (9, 1, 1, '113.246.203.142', '2018-11-10 10:09:58', 'pc', 1, '2018-11-10 10:09:58', '2018-11-10 10:09:58');
INSERT INTO `work_admin_visit_logs` VALUES (10, 1, 1, '113.246.203.142', '2018-11-10 10:32:46', 'pc', 1, '2018-11-10 10:32:46', '2018-11-10 10:32:46');
INSERT INTO `work_admin_visit_logs` VALUES (11, 2, 2, '113.247.14.225', '2018-11-10 10:42:40', 'pc', 1, '2018-11-10 10:42:40', '2018-11-10 10:42:40');
INSERT INTO `work_admin_visit_logs` VALUES (12, 2, 2, '113.247.14.225', '2018-11-10 10:46:42', 'pc', 1, '2018-11-10 10:46:42', '2018-11-10 10:46:42');
INSERT INTO `work_admin_visit_logs` VALUES (13, 1, 1, '113.246.203.142', '2018-11-10 11:10:02', 'pc', 1, '2018-11-10 11:10:02', '2018-11-10 11:10:02');
INSERT INTO `work_admin_visit_logs` VALUES (14, 2, 2, '113.246.203.142', '2018-11-10 13:40:38', 'pc', 1, '2018-11-10 13:40:38', '2018-11-10 13:40:38');
INSERT INTO `work_admin_visit_logs` VALUES (15, 2, 2, '113.246.203.142', '2018-11-10 14:41:44', 'pc', 1, '2018-11-10 14:41:44', '2018-11-10 14:41:44');
INSERT INTO `work_admin_visit_logs` VALUES (16, 2, 2, '113.246.203.142', '2018-11-10 14:52:02', 'pc', 1, '2018-11-10 14:52:02', '2018-11-10 14:52:02');
INSERT INTO `work_admin_visit_logs` VALUES (17, 2, 2, '113.246.203.142', '2018-11-10 14:56:50', 'pc', 1, '2018-11-10 14:56:50', '2018-11-10 14:56:50');
INSERT INTO `work_admin_visit_logs` VALUES (18, 1, 1, '113.246.203.142', '2018-11-10 15:45:45', 'pc', 1, '2018-11-10 15:45:45', '2018-11-10 15:45:45');
INSERT INTO `work_admin_visit_logs` VALUES (19, 1, 1, '113.246.203.142', '2018-11-10 16:10:52', 'pc', 1, '2018-11-10 16:10:52', '2018-11-10 16:10:52');
INSERT INTO `work_admin_visit_logs` VALUES (20, 1, 1, '113.246.203.142', '2018-11-10 16:24:21', 'pc', 1, '2018-11-10 16:24:21', '2018-11-10 16:24:21');
INSERT INTO `work_admin_visit_logs` VALUES (21, 1, 1, '113.246.203.142', '2018-11-10 17:10:13', 'pc', 1, '2018-11-10 17:10:13', '2018-11-10 17:10:13');
INSERT INTO `work_admin_visit_logs` VALUES (22, 1, 1, '113.246.203.142', '2018-11-10 17:13:52', 'pc', 1, '2018-11-10 17:13:52', '2018-11-10 17:13:52');
INSERT INTO `work_admin_visit_logs` VALUES (23, 1, 1, '113.246.203.142', '2018-11-10 17:14:17', 'pc', 1, '2018-11-10 17:14:17', '2018-11-10 17:14:17');
INSERT INTO `work_admin_visit_logs` VALUES (24, 2, 2, '192.168.31.145', '2018-11-10 17:38:40', 'pc', 1, '2018-11-10 17:38:40', '2018-11-10 17:38:40');
INSERT INTO `work_admin_visit_logs` VALUES (25, 2, 2, '175.0.204.133', '2018-11-11 21:16:02', 'pc', 1, '2018-11-11 21:16:02', '2018-11-11 21:16:02');
INSERT INTO `work_admin_visit_logs` VALUES (26, 2, 2, '113.247.12.57', '2018-11-12 10:24:21', 'pc', 1, '2018-11-12 10:24:21', '2018-11-12 10:24:21');
INSERT INTO `work_admin_visit_logs` VALUES (27, 2, 2, '113.247.12.57', '2018-11-12 10:28:32', 'pc', 1, '2018-11-12 10:28:32', '2018-11-12 10:28:32');
INSERT INTO `work_admin_visit_logs` VALUES (28, 2, 2, '113.247.12.57', '2018-11-12 11:06:00', 'pc', 1, '2018-11-12 11:06:00', '2018-11-12 11:06:00');
INSERT INTO `work_admin_visit_logs` VALUES (29, 2, 2, '113.247.12.57', '2018-11-12 11:09:16', 'pc', 1, '2018-11-12 11:09:16', '2018-11-12 11:09:16');
INSERT INTO `work_admin_visit_logs` VALUES (30, 9, 9, '113.247.12.57', '2018-11-12 11:37:00', 'pc', 1, '2018-11-12 11:37:00', '2018-11-12 11:37:00');
INSERT INTO `work_admin_visit_logs` VALUES (31, 2, 2, '113.247.12.57', '2018-11-12 13:36:57', 'pc', 1, '2018-11-12 13:36:57', '2018-11-12 13:36:57');
INSERT INTO `work_admin_visit_logs` VALUES (32, 2, 2, '113.247.12.57', '2018-11-12 13:42:06', 'pc', 1, '2018-11-12 13:42:06', '2018-11-12 13:42:06');
INSERT INTO `work_admin_visit_logs` VALUES (33, 2, 2, '113.247.12.57', '2018-11-12 13:50:10', 'pc', 1, '2018-11-12 13:50:10', '2018-11-12 13:50:10');
INSERT INTO `work_admin_visit_logs` VALUES (34, 2, 2, '113.247.12.57', '2018-11-12 14:31:23', 'pc', 1, '2018-11-12 14:31:23', '2018-11-12 14:31:23');
INSERT INTO `work_admin_visit_logs` VALUES (35, 2, 2, '113.247.12.57', '2018-11-12 15:57:27', 'pc', 1, '2018-11-12 15:57:27', '2018-11-12 15:57:27');
INSERT INTO `work_admin_visit_logs` VALUES (36, 1, 1, '113.247.12.57', '2018-11-12 15:58:35', 'pc', 1, '2018-11-12 15:58:35', '2018-11-12 15:58:35');
INSERT INTO `work_admin_visit_logs` VALUES (37, 2, 2, '175.8.206.87', '2018-11-26 16:59:38', 'pc', 1, '2018-11-26 16:59:38', '2018-11-26 16:59:38');
INSERT INTO `work_admin_visit_logs` VALUES (38, 2, 2, '113.247.49.199', '2018-11-27 10:21:22', 'pc', 1, '2018-11-27 10:21:22', '2018-11-27 10:21:22');
INSERT INTO `work_admin_visit_logs` VALUES (39, 2, 2, '113.247.49.199', '2018-11-27 14:51:31', 'pc', 1, '2018-11-27 14:51:31', '2018-11-27 14:51:31');
INSERT INTO `work_admin_visit_logs` VALUES (40, 2, 2, '113.247.49.143', '2018-11-27 17:05:39', 'pc', 1, '2018-11-27 17:05:39', '2018-11-27 17:05:39');
INSERT INTO `work_admin_visit_logs` VALUES (41, 2, 2, '113.247.49.199', '2018-11-27 17:54:03', 'pc', 1, '2018-11-27 17:54:03', '2018-11-27 17:54:03');
INSERT INTO `work_admin_visit_logs` VALUES (42, 2, 2, '113.247.49.199', '2018-11-28 09:47:05', 'pc', 1, '2018-11-28 09:47:05', '2018-11-28 09:47:05');
INSERT INTO `work_admin_visit_logs` VALUES (43, 2, 2, '113.247.49.199', '2018-11-28 11:31:27', 'pc', 1, '2018-11-28 11:31:27', '2018-11-28 11:31:27');
INSERT INTO `work_admin_visit_logs` VALUES (44, 2, 2, '113.247.49.199', '2018-11-28 11:31:27', 'pc', 1, '2018-11-28 11:31:27', '2018-11-28 11:31:27');
INSERT INTO `work_admin_visit_logs` VALUES (45, 2, 2, '113.246.200.15', '2018-11-28 14:31:31', 'pc', 1, '2018-11-28 14:31:31', '2018-11-28 14:31:31');
INSERT INTO `work_admin_visit_logs` VALUES (46, 1, 1, '175.8.204.141', '2018-11-29 09:50:45', 'pc', 1, '2018-11-29 09:50:45', '2018-11-29 09:50:45');
INSERT INTO `work_admin_visit_logs` VALUES (47, 2, 2, '175.13.245.95', '2018-11-29 11:52:34', 'pc', 1, '2018-11-29 11:52:34', '2018-11-29 11:52:34');
INSERT INTO `work_admin_visit_logs` VALUES (48, 2, 2, '127.0.0.1', '2018-11-29 14:00:26', 'pc', 1, '2018-11-29 14:00:26', '2018-11-29 14:00:26');
INSERT INTO `work_admin_visit_logs` VALUES (49, 2, 2, '127.0.0.1', '2018-11-29 14:00:58', 'pc', 1, '2018-11-29 14:00:58', '2018-11-29 14:00:58');
INSERT INTO `work_admin_visit_logs` VALUES (50, 1, 1, '175.8.204.141', '2018-11-29 14:44:15', 'pc', 1, '2018-11-29 14:44:15', '2018-11-29 14:44:15');
INSERT INTO `work_admin_visit_logs` VALUES (51, 2, 2, '127.0.0.1', '2018-11-29 15:32:51', 'pc', 1, '2018-11-29 15:32:51', '2018-11-29 15:32:51');
INSERT INTO `work_admin_visit_logs` VALUES (52, 2, 2, '175.8.204.141', '2018-11-29 15:42:19', 'pc', 1, '2018-11-29 15:42:19', '2018-11-29 15:42:19');
INSERT INTO `work_admin_visit_logs` VALUES (53, 2, 2, '175.8.204.141', '2018-11-29 16:22:41', 'pc', 1, '2018-11-29 16:22:41', '2018-11-29 16:22:41');
INSERT INTO `work_admin_visit_logs` VALUES (54, 2, 2, '175.8.204.141', '2018-11-29 16:51:54', 'pc', 1, '2018-11-29 16:51:54', '2018-11-29 16:51:54');
INSERT INTO `work_admin_visit_logs` VALUES (55, 1, 1, '175.8.204.141', '2018-11-29 17:28:01', 'pc', 1, '2018-11-29 17:28:01', '2018-11-29 17:28:01');
INSERT INTO `work_admin_visit_logs` VALUES (56, 2, 2, '175.8.204.141', '2018-11-29 21:16:51', 'pc', 1, '2018-11-29 21:16:51', '2018-11-29 21:16:51');
INSERT INTO `work_admin_visit_logs` VALUES (57, 2, 2, '175.8.204.141', '2018-11-30 11:29:24', 'pc', 1, '2018-11-30 11:29:24', '2018-11-30 11:29:24');
INSERT INTO `work_admin_visit_logs` VALUES (58, 2, 2, '175.8.204.141', '2018-11-30 15:17:03', 'pc', 1, '2018-11-30 15:17:03', '2018-11-30 15:17:03');
INSERT INTO `work_admin_visit_logs` VALUES (59, 2, 2, '113.246.202.231', '2018-11-30 15:41:57', 'pc', 1, '2018-11-30 15:41:57', '2018-11-30 15:41:57');
INSERT INTO `work_admin_visit_logs` VALUES (60, 2, 2, '113.247.14.237', '2018-11-30 17:11:25', 'pc', 1, '2018-11-30 17:11:25', '2018-11-30 17:11:25');
INSERT INTO `work_admin_visit_logs` VALUES (61, 1, 1, '113.246.202.65', '2018-11-30 22:09:31', 'pc', 1, '2018-11-30 22:09:31', '2018-11-30 22:09:31');
INSERT INTO `work_admin_visit_logs` VALUES (62, 1, 1, '120.228.130.115', '2018-11-30 22:42:43', 'pc', 1, '2018-11-30 22:42:43', '2018-11-30 22:42:43');
INSERT INTO `work_admin_visit_logs` VALUES (63, 1, 1, '120.228.130.115', '2018-11-30 23:03:28', 'pc', 1, '2018-11-30 23:03:28', '2018-11-30 23:03:28');
INSERT INTO `work_admin_visit_logs` VALUES (64, 1, 1, '125.75.4.49', '2018-11-30 23:21:25', 'pc', 1, '2018-11-30 23:21:25', '2018-11-30 23:21:25');
INSERT INTO `work_admin_visit_logs` VALUES (65, 1, 1, '120.228.130.115', '2018-11-30 23:21:56', 'pc', 1, '2018-11-30 23:21:56', '2018-11-30 23:21:56');
INSERT INTO `work_admin_visit_logs` VALUES (66, 2, 2, '113.247.14.147', '2018-12-01 11:07:17', 'pc', 1, '2018-12-01 11:07:17', '2018-12-01 11:07:17');
INSERT INTO `work_admin_visit_logs` VALUES (67, 2, 2, '113.247.14.147', '2018-12-01 11:09:40', 'pc', 1, '2018-12-01 11:09:40', '2018-12-01 11:09:40');
INSERT INTO `work_admin_visit_logs` VALUES (68, 2, 2, '113.247.14.147', '2018-12-01 11:16:05', 'pc', 1, '2018-12-01 11:16:05', '2018-12-01 11:16:05');
INSERT INTO `work_admin_visit_logs` VALUES (69, 2, 2, '113.247.14.147', '2018-12-01 11:16:13', 'pc', 1, '2018-12-01 11:16:13', '2018-12-01 11:16:13');
INSERT INTO `work_admin_visit_logs` VALUES (70, 2, 2, '113.247.14.147', '2018-12-01 11:47:23', 'pc', 1, '2018-12-01 11:47:23', '2018-12-01 11:47:23');
INSERT INTO `work_admin_visit_logs` VALUES (71, 2, 2, '113.246.202.65', '2018-12-01 14:11:42', 'pc', 1, '2018-12-01 14:11:42', '2018-12-01 14:11:42');
INSERT INTO `work_admin_visit_logs` VALUES (72, 2, 2, '113.247.14.109', '2018-12-03 09:00:24', 'pc', 1, '2018-12-03 09:00:24', '2018-12-03 09:00:24');
INSERT INTO `work_admin_visit_logs` VALUES (73, 2, 2, '175.8.207.100', '2018-12-03 09:37:50', 'pc', 1, '2018-12-03 09:37:50', '2018-12-03 09:37:50');
INSERT INTO `work_admin_visit_logs` VALUES (74, 2, 2, '175.8.207.100', '2018-12-03 09:40:39', 'pc', 1, '2018-12-03 09:40:39', '2018-12-03 09:40:39');
INSERT INTO `work_admin_visit_logs` VALUES (75, 2, 2, '175.8.207.100', '2018-12-03 11:16:11', 'pc', 1, '2018-12-03 11:16:11', '2018-12-03 11:16:11');
INSERT INTO `work_admin_visit_logs` VALUES (76, 2, 2, '175.8.207.100', '2018-12-03 11:36:09', 'pc', 1, '2018-12-03 11:36:09', '2018-12-03 11:36:09');
INSERT INTO `work_admin_visit_logs` VALUES (77, 2, 2, '113.247.51.103', '2018-12-03 13:31:15', 'pc', 1, '2018-12-03 13:31:15', '2018-12-03 13:31:15');
INSERT INTO `work_admin_visit_logs` VALUES (78, 2, 2, '175.8.207.100', '2018-12-03 14:42:05', 'pc', 1, '2018-12-03 14:42:05', '2018-12-03 14:42:05');
INSERT INTO `work_admin_visit_logs` VALUES (79, 2, 2, '0.0.0.0', '2018-12-03 15:14:52', 'pc', 1, '2018-12-03 15:14:52', '2018-12-03 15:14:52');
INSERT INTO `work_admin_visit_logs` VALUES (80, 2, 2, '117.136.89.115', '2018-12-03 15:34:23', 'pc', 1, '2018-12-03 15:34:23', '2018-12-03 15:34:23');
INSERT INTO `work_admin_visit_logs` VALUES (81, 1, 1, '175.8.207.100', '2018-12-03 17:58:34', 'pc', 1, '2018-12-03 17:58:34', '2018-12-03 17:58:34');
INSERT INTO `work_admin_visit_logs` VALUES (82, 2, 2, '113.247.51.134', '2018-12-04 09:25:28', 'pc', 1, '2018-12-04 09:25:28', '2018-12-04 09:25:28');
INSERT INTO `work_admin_visit_logs` VALUES (83, 2, 2, '0.0.0.0', '2018-12-04 13:46:38', 'pc', 1, '2018-12-04 13:46:38', '2018-12-04 13:46:38');
INSERT INTO `work_admin_visit_logs` VALUES (84, 2, 2, '113.247.51.134', '2018-12-04 15:11:59', 'pc', 1, '2018-12-04 15:11:59', '2018-12-04 15:11:59');
INSERT INTO `work_admin_visit_logs` VALUES (85, 2, 2, '175.8.207.62', '2018-12-04 16:35:39', 'pc', 1, '2018-12-04 16:35:39', '2018-12-04 16:35:39');
INSERT INTO `work_admin_visit_logs` VALUES (86, 2, 2, '175.8.207.100', '2018-12-04 17:08:29', 'pc', 1, '2018-12-04 17:08:29', '2018-12-04 17:08:29');
INSERT INTO `work_admin_visit_logs` VALUES (87, 2, 2, '175.8.207.62', '2018-12-04 17:28:16', 'pc', 1, '2018-12-04 17:28:16', '2018-12-04 17:28:16');
INSERT INTO `work_admin_visit_logs` VALUES (88, 2, 2, '175.8.207.62', '2018-12-04 17:36:49', 'pc', 1, '2018-12-04 17:36:49', '2018-12-04 17:36:49');
INSERT INTO `work_admin_visit_logs` VALUES (89, 1, 1, '175.8.207.100', '2018-12-04 17:41:24', 'pc', 1, '2018-12-04 17:41:24', '2018-12-04 17:41:24');
INSERT INTO `work_admin_visit_logs` VALUES (90, 1, 1, '113.247.14.36', '2018-12-05 09:08:50', 'pc', 1, '2018-12-05 09:08:50', '2018-12-05 09:08:50');
INSERT INTO `work_admin_visit_logs` VALUES (91, 1, 1, '125.75.4.31', '2018-12-05 09:10:11', 'pc', 1, '2018-12-05 09:10:11', '2018-12-05 09:10:11');
INSERT INTO `work_admin_visit_logs` VALUES (92, 2, 2, '113.247.14.36', '2018-12-05 09:31:45', 'pc', 1, '2018-12-05 09:31:45', '2018-12-05 09:31:45');
INSERT INTO `work_admin_visit_logs` VALUES (93, 2, 2, '113.246.200.75', '2018-12-05 10:02:15', 'pc', 1, '2018-12-05 10:02:15', '2018-12-05 10:02:15');
INSERT INTO `work_admin_visit_logs` VALUES (94, 2, 2, '113.247.14.36', '2018-12-05 10:08:05', 'pc', 1, '2018-12-05 10:08:05', '2018-12-05 10:08:05');
INSERT INTO `work_admin_visit_logs` VALUES (95, 2, 2, '113.246.200.75', '2018-12-05 12:06:34', 'pc', 1, '2018-12-05 12:06:34', '2018-12-05 12:06:34');
INSERT INTO `work_admin_visit_logs` VALUES (96, 2, 2, '43.250.200.104', '2018-12-05 12:08:03', 'pc', 1, '2018-12-05 12:08:03', '2018-12-05 12:08:03');
INSERT INTO `work_admin_visit_logs` VALUES (97, 2, 2, '113.247.14.36', '2018-12-05 14:23:49', 'pc', 1, '2018-12-05 14:23:49', '2018-12-05 14:23:49');
INSERT INTO `work_admin_visit_logs` VALUES (98, 2, 2, '113.246.200.75', '2018-12-05 15:05:38', 'pc', 1, '2018-12-05 15:05:38', '2018-12-05 15:05:38');
INSERT INTO `work_admin_visit_logs` VALUES (99, 1, 1, '113.247.14.36', '2018-12-05 15:29:43', 'pc', 1, '2018-12-05 15:29:43', '2018-12-05 15:29:43');
INSERT INTO `work_admin_visit_logs` VALUES (100, 2, 2, '175.10.167.178', '2018-12-05 16:16:08', 'pc', 1, '2018-12-05 16:16:08', '2018-12-05 16:16:08');
INSERT INTO `work_admin_visit_logs` VALUES (101, 2, 2, '113.246.200.75', '2018-12-05 16:22:52', 'pc', 1, '2018-12-05 16:22:52', '2018-12-05 16:22:52');
INSERT INTO `work_admin_visit_logs` VALUES (102, 2, 2, '113.247.14.36', '2018-12-05 16:47:44', 'pc', 1, '2018-12-05 16:47:44', '2018-12-05 16:47:44');
INSERT INTO `work_admin_visit_logs` VALUES (103, 2, 2, '113.247.14.36', '2018-12-05 18:02:33', 'pc', 1, '2018-12-05 18:02:33', '2018-12-05 18:02:33');
INSERT INTO `work_admin_visit_logs` VALUES (104, 2, 2, '113.246.203.21', '2018-12-06 18:35:47', 'pc', 1, '2018-12-06 18:35:47', '2018-12-06 18:35:47');
INSERT INTO `work_admin_visit_logs` VALUES (105, 2, 2, '113.247.14.237', '2018-12-06 19:18:43', 'pc', 1, '2018-12-06 19:18:43', '2018-12-06 19:18:43');
INSERT INTO `work_admin_visit_logs` VALUES (106, 2, 2, '113.247.14.237', '2018-12-06 20:08:15', 'pc', 1, '2018-12-06 20:08:15', '2018-12-06 20:08:15');
INSERT INTO `work_admin_visit_logs` VALUES (107, 2, 2, '113.247.48.217', '2018-12-07 09:27:47', 'pc', 1, '2018-12-07 09:27:47', '2018-12-07 09:27:47');
INSERT INTO `work_admin_visit_logs` VALUES (108, 2, 2, '113.247.51.150', '2019-01-22 13:55:36', 'pc', 1, '2019-01-22 13:55:36', '2019-01-22 13:55:36');
INSERT INTO `work_admin_visit_logs` VALUES (109, 2, 2, '113.247.48.154', '2019-01-22 13:57:46', 'pc', 1, '2019-01-22 13:57:46', '2019-01-22 13:57:46');
INSERT INTO `work_admin_visit_logs` VALUES (110, 2, 2, '113.247.48.154', '2019-01-22 13:59:54', 'pc', 1, '2019-01-22 13:59:54', '2019-01-22 13:59:54');
INSERT INTO `work_admin_visit_logs` VALUES (111, 2, 2, '113.247.48.154', '2019-01-22 14:08:44', 'pc', 1, '2019-01-22 14:08:44', '2019-01-22 14:08:44');
INSERT INTO `work_admin_visit_logs` VALUES (112, 2, 2, '112.17.156.182', '2019-01-22 14:12:00', 'pc', 1, '2019-01-22 14:12:00', '2019-01-22 14:12:00');
INSERT INTO `work_admin_visit_logs` VALUES (113, 2, 2, '113.247.51.150', '2019-01-22 14:12:51', 'pc', 1, '2019-01-22 14:12:51', '2019-01-22 14:12:51');
INSERT INTO `work_admin_visit_logs` VALUES (114, 2, 2, '112.17.156.182', '2019-01-22 14:13:32', 'pc', 1, '2019-01-22 14:13:32', '2019-01-22 14:13:32');
INSERT INTO `work_admin_visit_logs` VALUES (115, 2, 2, '113.247.48.154', '2019-01-22 14:13:43', 'pc', 1, '2019-01-22 14:13:43', '2019-01-22 14:13:43');
INSERT INTO `work_admin_visit_logs` VALUES (116, 2, 2, '113.247.51.150', '2019-01-22 14:21:28', 'pc', 1, '2019-01-22 14:21:28', '2019-01-22 14:21:28');
INSERT INTO `work_admin_visit_logs` VALUES (117, 2, 2, '113.247.48.154', '2019-01-22 14:30:42', 'pc', 1, '2019-01-22 14:30:42', '2019-01-22 14:30:42');
INSERT INTO `work_admin_visit_logs` VALUES (118, 2, 2, '113.247.51.150', '2019-01-22 16:42:35', 'pc', 1, '2019-01-22 16:42:35', '2019-01-22 16:42:35');
INSERT INTO `work_admin_visit_logs` VALUES (119, 2, 2, '113.247.51.150', '2019-01-22 16:43:09', 'pc', 1, '2019-01-22 16:43:09', '2019-01-22 16:43:09');
INSERT INTO `work_admin_visit_logs` VALUES (120, 2, 2, '113.247.51.150', '2019-01-22 21:35:46', 'pc', 1, '2019-01-22 21:35:46', '2019-01-22 21:35:46');
INSERT INTO `work_admin_visit_logs` VALUES (121, 2, 2, '113.247.48.154', '2019-01-23 09:37:54', 'pc', 1, '2019-01-23 09:37:54', '2019-01-23 09:37:54');
INSERT INTO `work_admin_visit_logs` VALUES (122, 2, 2, '113.247.51.150', '2019-01-23 10:28:44', 'pc', 1, '2019-01-23 10:28:44', '2019-01-23 10:28:44');
INSERT INTO `work_admin_visit_logs` VALUES (123, 2, 2, '113.246.201.10', '2019-01-24 09:27:03', 'pc', 1, '2019-01-24 09:27:03', '2019-01-24 09:27:03');
INSERT INTO `work_admin_visit_logs` VALUES (124, 2, 2, '113.247.12.81', '2019-01-24 09:30:59', 'pc', 1, '2019-01-24 09:30:59', '2019-01-24 09:30:59');
INSERT INTO `work_admin_visit_logs` VALUES (125, 2, 2, '127.0.0.1', '2019-01-24 17:23:11', 'pc', 1, '2019-01-24 17:23:11', '2019-01-24 17:23:11');
INSERT INTO `work_admin_visit_logs` VALUES (126, 2, 2, '113.246.201.10', '2019-01-24 18:51:44', 'pc', 1, '2019-01-24 18:51:45', '2019-01-24 18:51:45');
INSERT INTO `work_admin_visit_logs` VALUES (127, 2, 2, '113.246.201.10', '2019-01-24 20:17:27', 'pc', 1, '2019-01-24 20:17:27', '2019-01-24 20:17:27');
INSERT INTO `work_admin_visit_logs` VALUES (128, 1, 1, '113.247.12.81', '2019-01-25 12:00:18', 'pc', 1, '2019-01-25 12:00:18', '2019-01-25 12:00:18');
INSERT INTO `work_admin_visit_logs` VALUES (129, 1, 1, '112.17.156.182', '2019-01-25 16:26:39', 'pc', 1, '2019-01-25 16:26:39', '2019-01-25 16:26:39');
INSERT INTO `work_admin_visit_logs` VALUES (130, 2, 2, '113.247.12.81', '2019-01-25 17:07:17', 'pc', 1, '2019-01-25 17:07:17', '2019-01-25 17:07:17');
INSERT INTO `work_admin_visit_logs` VALUES (131, 1, 1, '112.17.156.182', '2019-01-25 17:40:58', 'pc', 1, '2019-01-25 17:40:58', '2019-01-25 17:40:58');
INSERT INTO `work_admin_visit_logs` VALUES (132, 2, 2, '113.247.18.70', '2019-01-26 00:14:21', 'pc', 1, '2019-01-26 00:14:21', '2019-01-26 00:14:21');
INSERT INTO `work_admin_visit_logs` VALUES (133, 2, 2, '113.246.201.228', '2019-01-26 09:59:53', 'pc', 1, '2019-01-26 09:59:53', '2019-01-26 09:59:53');
INSERT INTO `work_admin_visit_logs` VALUES (134, 1, 1, '113.246.201.228', '2019-01-26 10:35:35', 'pc', 1, '2019-01-26 10:35:35', '2019-01-26 10:35:35');
INSERT INTO `work_admin_visit_logs` VALUES (135, 2, 2, '0.0.0.0', '2019-01-26 14:58:08', 'pc', 1, '2019-01-26 14:58:08', '2019-01-26 14:58:08');
INSERT INTO `work_admin_visit_logs` VALUES (136, 2, 2, '113.246.202.245', '2019-01-26 17:30:58', 'pc', 1, '2019-01-26 17:30:58', '2019-01-26 17:30:58');
INSERT INTO `work_admin_visit_logs` VALUES (137, 2, 2, '113.246.200.252', '2019-01-28 11:43:26', 'pc', 1, '2019-01-28 11:43:26', '2019-01-28 11:43:26');
INSERT INTO `work_admin_visit_logs` VALUES (138, 2, 2, '113.246.202.78', '2019-01-28 14:36:30', 'pc', 1, '2019-01-28 14:36:30', '2019-01-28 14:36:30');
INSERT INTO `work_admin_visit_logs` VALUES (139, 2, 2, '113.246.200.252', '2019-01-28 14:47:51', 'pc', 1, '2019-01-28 14:47:51', '2019-01-28 14:47:51');
INSERT INTO `work_admin_visit_logs` VALUES (140, 2, 2, '0.0.0.0', '2019-01-28 16:34:28', 'pc', 1, '2019-01-28 16:34:28', '2019-01-28 16:34:28');
INSERT INTO `work_admin_visit_logs` VALUES (141, 2, 2, '113.246.202.78', '2019-01-28 17:20:55', 'pc', 1, '2019-01-28 17:20:55', '2019-01-28 17:20:55');
INSERT INTO `work_admin_visit_logs` VALUES (142, 2, 2, '0.0.0.0', '2019-01-29 09:39:02', 'pc', 1, '2019-01-29 09:39:02', '2019-01-29 09:39:02');
INSERT INTO `work_admin_visit_logs` VALUES (143, 1, 1, '175.8.205.104', '2019-01-29 10:13:37', 'pc', 1, '2019-01-29 10:13:37', '2019-01-29 10:13:37');
INSERT INTO `work_admin_visit_logs` VALUES (144, 2, 2, '175.8.204.7', '2019-01-29 14:04:33', 'pc', 1, '2019-01-29 14:04:33', '2019-01-29 14:04:33');
INSERT INTO `work_admin_visit_logs` VALUES (145, 2, 2, '175.8.204.7', '2019-01-29 14:04:34', 'pc', 1, '2019-01-29 14:04:34', '2019-01-29 14:04:34');
INSERT INTO `work_admin_visit_logs` VALUES (146, 2, 2, '175.8.204.7', '2019-01-29 14:09:24', 'pc', 1, '2019-01-29 14:09:24', '2019-01-29 14:09:24');
INSERT INTO `work_admin_visit_logs` VALUES (147, 2, 2, '175.8.205.104', '2019-01-29 15:49:52', 'pc', 1, '2019-01-29 15:49:52', '2019-01-29 15:49:52');
INSERT INTO `work_admin_visit_logs` VALUES (148, 1, 1, '175.8.205.104', '2019-01-29 17:11:14', 'pc', 1, '2019-01-29 17:11:14', '2019-01-29 17:11:14');
INSERT INTO `work_admin_visit_logs` VALUES (149, 2, 2, '175.8.205.104', '2019-01-29 19:07:33', 'pc', 1, '2019-01-29 19:07:33', '2019-01-29 19:07:33');
INSERT INTO `work_admin_visit_logs` VALUES (150, 2, 2, '113.247.49.124', '2019-01-31 09:41:23', 'pc', 1, '2019-01-31 09:41:23', '2019-01-31 09:41:23');
INSERT INTO `work_admin_visit_logs` VALUES (151, 2, 2, '0.0.0.0', '2019-01-31 09:52:37', 'pc', 1, '2019-01-31 09:52:37', '2019-01-31 09:52:37');
INSERT INTO `work_admin_visit_logs` VALUES (152, 2, 2, '0.0.0.0', '2019-01-31 09:58:19', 'pc', 1, '2019-01-31 09:58:19', '2019-01-31 09:58:19');
INSERT INTO `work_admin_visit_logs` VALUES (153, 2, 2, '113.247.49.124', '2019-01-31 09:59:00', 'pc', 1, '2019-01-31 09:59:00', '2019-01-31 09:59:00');
INSERT INTO `work_admin_visit_logs` VALUES (154, 2, 2, '113.247.13.176', '2019-01-31 10:46:58', 'pc', 1, '2019-01-31 10:46:58', '2019-01-31 10:46:58');
INSERT INTO `work_admin_visit_logs` VALUES (155, 2, 2, '113.247.49.124', '2019-01-31 13:02:16', 'pc', 1, '2019-01-31 13:02:16', '2019-01-31 13:02:16');
INSERT INTO `work_admin_visit_logs` VALUES (156, 2, 2, '113.246.200.130', '2019-02-11 10:03:35', 'pc', 1, '2019-02-11 10:03:35', '2019-02-11 10:03:35');
INSERT INTO `work_admin_visit_logs` VALUES (157, 2, 2, '175.8.206.32', '2019-02-11 10:07:40', 'pc', 1, '2019-02-11 10:07:40', '2019-02-11 10:07:40');
INSERT INTO `work_admin_visit_logs` VALUES (158, 1, 1, '175.8.206.32', '2019-02-11 11:21:10', 'pc', 1, '2019-02-11 11:21:10', '2019-02-11 11:21:10');
INSERT INTO `work_admin_visit_logs` VALUES (159, 2, 2, '175.8.206.117', '2019-02-11 11:37:40', 'pc', 1, '2019-02-11 11:37:40', '2019-02-11 11:37:40');
INSERT INTO `work_admin_visit_logs` VALUES (160, 2, 2, '112.17.156.182', '2019-02-13 11:37:12', 'pc', 1, '2019-02-13 11:37:12', '2019-02-13 11:37:12');
INSERT INTO `work_admin_visit_logs` VALUES (161, 2, 2, '127.0.0.1', '2019-02-13 11:46:44', 'pc', 1, '2019-02-13 11:46:44', '2019-02-13 11:46:44');
INSERT INTO `work_admin_visit_logs` VALUES (162, 2, 2, '113.247.51.68', '2019-02-13 11:53:49', 'pc', 1, '2019-02-13 11:53:49', '2019-02-13 11:53:49');
INSERT INTO `work_admin_visit_logs` VALUES (163, 2, 2, '113.247.12.213', '2019-02-13 14:07:39', 'pc', 1, '2019-02-13 14:07:39', '2019-02-13 14:07:39');
INSERT INTO `work_admin_visit_logs` VALUES (164, 2, 2, '175.0.206.107', '2019-02-13 14:42:18', 'pc', 1, '2019-02-13 14:42:18', '2019-02-13 14:42:18');
INSERT INTO `work_admin_visit_logs` VALUES (165, 2, 2, '113.247.12.213', '2019-02-13 15:46:23', 'pc', 1, '2019-02-13 15:46:23', '2019-02-13 15:46:23');
INSERT INTO `work_admin_visit_logs` VALUES (166, 2, 2, '113.247.48.99', '2019-02-14 09:52:20', 'pc', 1, '2019-02-14 09:52:20', '2019-02-14 09:52:20');
INSERT INTO `work_admin_visit_logs` VALUES (167, 1, 1, '112.17.156.182', '2019-02-14 09:54:50', 'pc', 1, '2019-02-14 09:54:50', '2019-02-14 09:54:50');
INSERT INTO `work_admin_visit_logs` VALUES (168, 2, 2, '175.8.205.135', '2019-02-14 11:24:25', 'pc', 1, '2019-02-14 11:24:25', '2019-02-14 11:24:25');
INSERT INTO `work_admin_visit_logs` VALUES (169, 1, 1, '175.8.205.135', '2019-02-14 11:24:49', 'pc', 1, '2019-02-14 11:24:49', '2019-02-14 11:24:49');
INSERT INTO `work_admin_visit_logs` VALUES (170, 2, 2, '113.247.48.99', '2019-02-14 11:46:16', 'pc', 1, '2019-02-14 11:46:16', '2019-02-14 11:46:16');
INSERT INTO `work_admin_visit_logs` VALUES (171, 2, 2, '113.247.48.99', '2019-02-14 15:28:45', 'pc', 1, '2019-02-14 15:28:45', '2019-02-14 15:28:45');
INSERT INTO `work_admin_visit_logs` VALUES (172, 2, 2, '175.0.206.107', '2019-02-14 16:31:39', 'pc', 1, '2019-02-14 16:31:39', '2019-02-14 16:31:39');
INSERT INTO `work_admin_visit_logs` VALUES (173, 2, 2, '175.8.205.135', '2019-02-14 16:40:14', 'pc', 1, '2019-02-14 16:40:14', '2019-02-14 16:40:14');
INSERT INTO `work_admin_visit_logs` VALUES (174, 2, 2, '175.8.205.135', '2019-02-14 17:54:01', 'pc', 1, '2019-02-14 17:54:01', '2019-02-14 17:54:01');
INSERT INTO `work_admin_visit_logs` VALUES (175, 1, 1, '175.8.205.135', '2019-02-15 11:15:13', 'pc', 1, '2019-02-15 11:15:13', '2019-02-15 11:15:13');
INSERT INTO `work_admin_visit_logs` VALUES (176, 2, 2, '113.247.13.163', '2019-02-22 10:08:08', 'pc', 1, '2019-02-22 10:08:08', '2019-02-22 10:08:08');
INSERT INTO `work_admin_visit_logs` VALUES (177, 2, 2, '113.247.13.159', '2019-02-22 10:13:42', 'pc', 1, '2019-02-22 10:13:42', '2019-02-22 10:13:42');
INSERT INTO `work_admin_visit_logs` VALUES (178, 2, 2, '113.247.51.55', '2019-02-22 10:31:22', 'pc', 1, '2019-02-22 10:31:22', '2019-02-22 10:31:22');
INSERT INTO `work_admin_visit_logs` VALUES (179, 2, 2, '192.168.31.137', '2019-02-22 10:45:10', 'pc', 1, '2019-02-22 10:45:10', '2019-02-22 10:45:10');
INSERT INTO `work_admin_visit_logs` VALUES (180, 2, 2, '113.247.13.159', '2019-02-22 10:59:08', 'pc', 1, '2019-02-22 10:59:08', '2019-02-22 10:59:08');
INSERT INTO `work_admin_visit_logs` VALUES (181, 2, 2, '113.247.13.163', '2019-02-22 11:16:08', 'pc', 1, '2019-02-22 11:16:08', '2019-02-22 11:16:08');
INSERT INTO `work_admin_visit_logs` VALUES (182, 2, 2, '113.247.13.159', '2019-02-22 11:32:22', 'pc', 1, '2019-02-22 11:32:22', '2019-02-22 11:32:22');
INSERT INTO `work_admin_visit_logs` VALUES (183, 2, 2, '113.247.13.159', '2019-02-22 11:33:47', 'pc', 1, '2019-02-22 11:33:47', '2019-02-22 11:33:47');
INSERT INTO `work_admin_visit_logs` VALUES (184, 2, 2, '113.247.13.159', '2019-02-22 11:42:30', 'pc', 1, '2019-02-22 11:42:30', '2019-02-22 11:42:30');
INSERT INTO `work_admin_visit_logs` VALUES (185, 2, 2, '113.247.13.159', '2019-02-22 13:08:20', 'pc', 1, '2019-02-22 13:08:20', '2019-02-22 13:08:20');
INSERT INTO `work_admin_visit_logs` VALUES (186, 2, 2, '113.247.51.55', '2019-02-22 15:13:27', 'pc', 1, '2019-02-22 15:13:27', '2019-02-22 15:13:27');
INSERT INTO `work_admin_visit_logs` VALUES (187, 2, 2, '113.247.51.55', '2019-02-22 17:22:55', 'pc', 1, '2019-02-22 17:22:55', '2019-02-22 17:22:55');
INSERT INTO `work_admin_visit_logs` VALUES (188, 2, 2, '222.240.102.197', '2019-02-22 17:42:39', 'pc', 1, '2019-02-22 17:42:39', '2019-02-22 17:42:39');
INSERT INTO `work_admin_visit_logs` VALUES (189, 2, 2, '175.0.206.107', '2019-02-23 10:10:01', 'pc', 1, '2019-02-23 10:10:01', '2019-02-23 10:10:01');
INSERT INTO `work_admin_visit_logs` VALUES (190, 2, 2, '0.0.0.0', '2019-02-23 10:13:19', 'pc', 1, '2019-02-23 10:13:19', '2019-02-23 10:13:19');
INSERT INTO `work_admin_visit_logs` VALUES (191, 2, 2, '113.247.13.159', '2019-02-23 10:17:40', 'pc', 1, '2019-02-23 10:17:40', '2019-02-23 10:17:40');
INSERT INTO `work_admin_visit_logs` VALUES (192, 2, 2, '113.247.13.197', '2019-02-23 10:47:59', 'pc', 1, '2019-02-23 10:47:59', '2019-02-23 10:47:59');
INSERT INTO `work_admin_visit_logs` VALUES (193, 2, 2, '113.246.200.4', '2019-02-23 11:25:40', 'pc', 1, '2019-02-23 11:25:40', '2019-02-23 11:25:40');
INSERT INTO `work_admin_visit_logs` VALUES (194, 2, 2, '113.247.13.197', '2019-02-23 11:44:01', 'pc', 1, '2019-02-23 11:44:01', '2019-02-23 11:44:01');
INSERT INTO `work_admin_visit_logs` VALUES (195, 2, 2, '113.247.13.197', '2019-02-23 14:32:00', 'pc', 1, '2019-02-23 14:32:00', '2019-02-23 14:32:00');
INSERT INTO `work_admin_visit_logs` VALUES (196, 2, 2, '113.247.13.197', '2019-02-23 14:44:07', 'pc', 1, '2019-02-23 14:44:07', '2019-02-23 14:44:07');
INSERT INTO `work_admin_visit_logs` VALUES (197, 2, 2, '117.136.89.100', '2019-02-23 15:15:37', 'pc', 1, '2019-02-23 15:15:37', '2019-02-23 15:15:37');
INSERT INTO `work_admin_visit_logs` VALUES (198, 2, 2, '113.246.200.4', '2019-02-23 16:30:51', 'pc', 1, '2019-02-23 16:30:51', '2019-02-23 16:30:51');
INSERT INTO `work_admin_visit_logs` VALUES (199, 1, 1, '113.247.13.197', '2019-02-23 16:33:19', 'pc', 1, '2019-02-23 16:33:19', '2019-02-23 16:33:19');
INSERT INTO `work_admin_visit_logs` VALUES (200, 2, 2, '113.246.200.4', '2019-02-23 16:40:00', 'pc', 1, '2019-02-23 16:40:00', '2019-02-23 16:40:00');
INSERT INTO `work_admin_visit_logs` VALUES (201, 2, 2, '113.246.200.4', '2019-02-23 16:42:01', 'pc', 1, '2019-02-23 16:42:01', '2019-02-23 16:42:01');
INSERT INTO `work_admin_visit_logs` VALUES (202, 2, 2, '113.247.13.197', '2019-02-23 16:44:06', 'pc', 1, '2019-02-23 16:44:06', '2019-02-23 16:44:06');
INSERT INTO `work_admin_visit_logs` VALUES (203, 2, 2, '113.246.200.4', '2019-02-23 17:02:26', 'pc', 1, '2019-02-23 17:02:26', '2019-02-23 17:02:26');
INSERT INTO `work_admin_visit_logs` VALUES (204, 2, 2, '42.48.55.236', '2019-02-24 11:34:36', 'pc', 1, '2019-02-24 11:34:36', '2019-02-24 11:34:36');
INSERT INTO `work_admin_visit_logs` VALUES (205, 2, 2, '113.246.200.4', '2019-02-24 11:49:36', 'pc', 1, '2019-02-24 11:49:36', '2019-02-24 11:49:36');
INSERT INTO `work_admin_visit_logs` VALUES (206, 2, 2, '42.48.55.236', '2019-02-24 22:28:03', 'pc', 1, '2019-02-24 22:28:03', '2019-02-24 22:28:03');
INSERT INTO `work_admin_visit_logs` VALUES (207, 2, 2, '42.48.55.236', '2019-02-24 22:47:33', 'pc', 1, '2019-02-24 22:47:33', '2019-02-24 22:47:33');
INSERT INTO `work_admin_visit_logs` VALUES (208, 2, 2, '42.48.55.236', '2019-02-24 23:05:45', 'pc', 1, '2019-02-24 23:05:45', '2019-02-24 23:05:45');
INSERT INTO `work_admin_visit_logs` VALUES (209, 2, 2, '42.48.55.236', '2019-02-24 23:10:47', 'pc', 1, '2019-02-24 23:10:47', '2019-02-24 23:10:47');
INSERT INTO `work_admin_visit_logs` VALUES (210, 2, 2, '42.48.55.236', '2019-02-24 23:12:11', 'pc', 1, '2019-02-24 23:12:11', '2019-02-24 23:12:11');
INSERT INTO `work_admin_visit_logs` VALUES (211, 2, 2, '42.48.55.236', '2019-02-24 23:14:05', 'pc', 1, '2019-02-24 23:14:05', '2019-02-24 23:14:05');
INSERT INTO `work_admin_visit_logs` VALUES (212, 2, 2, '42.48.55.236', '2019-02-24 23:14:33', 'pc', 1, '2019-02-24 23:14:33', '2019-02-24 23:14:33');
INSERT INTO `work_admin_visit_logs` VALUES (213, 2, 2, '42.48.55.236', '2019-02-24 23:19:05', 'pc', 1, '2019-02-24 23:19:05', '2019-02-24 23:19:05');
INSERT INTO `work_admin_visit_logs` VALUES (214, 2, 2, '42.48.55.236', '2019-02-24 23:22:11', 'pc', 1, '2019-02-24 23:22:11', '2019-02-24 23:22:11');
INSERT INTO `work_admin_visit_logs` VALUES (215, 2, 2, '42.48.55.236', '2019-02-24 23:25:11', 'pc', 1, '2019-02-24 23:25:11', '2019-02-24 23:25:11');
INSERT INTO `work_admin_visit_logs` VALUES (216, 2, 2, '113.246.200.4', '2019-02-25 09:17:37', 'pc', 1, '2019-02-25 09:17:37', '2019-02-25 09:17:37');
INSERT INTO `work_admin_visit_logs` VALUES (217, 2, 2, '113.246.200.4', '2019-02-25 09:22:16', 'pc', 1, '2019-02-25 09:22:16', '2019-02-25 09:22:16');
INSERT INTO `work_admin_visit_logs` VALUES (218, 2, 2, '0.0.0.0', '2019-02-25 10:42:34', 'pc', 1, '2019-02-25 10:42:34', '2019-02-25 10:42:34');
INSERT INTO `work_admin_visit_logs` VALUES (219, 2, 2, '113.247.50.30', '2019-02-25 11:44:43', 'pc', 1, '2019-02-25 11:44:43', '2019-02-25 11:44:43');
INSERT INTO `work_admin_visit_logs` VALUES (220, 2, 2, '113.247.50.30', '2019-02-25 14:50:37', 'pc', 1, '2019-02-25 14:50:37', '2019-02-25 14:50:37');
INSERT INTO `work_admin_visit_logs` VALUES (221, 2, 2, '113.246.203.92', '2019-02-25 16:56:05', 'pc', 1, '2019-02-25 16:56:05', '2019-02-25 16:56:05');
INSERT INTO `work_admin_visit_logs` VALUES (222, 2, 2, '113.246.203.92', '2019-02-25 17:08:24', 'pc', 1, '2019-02-25 17:08:24', '2019-02-25 17:08:24');
INSERT INTO `work_admin_visit_logs` VALUES (223, 2, 2, '113.247.50.30', '2019-02-25 17:38:45', 'pc', 1, '2019-02-25 17:38:45', '2019-02-25 17:38:45');
INSERT INTO `work_admin_visit_logs` VALUES (224, 2, 2, '120.228.130.174', '2019-02-25 20:12:19', 'pc', 1, '2019-02-25 20:12:19', '2019-02-25 20:12:19');
INSERT INTO `work_admin_visit_logs` VALUES (225, 2, 2, '113.246.203.92', '2019-02-25 21:21:54', 'pc', 1, '2019-02-25 21:21:54', '2019-02-25 21:21:54');
INSERT INTO `work_admin_visit_logs` VALUES (226, 2, 2, '113.246.203.92', '2019-02-25 21:37:41', 'pc', 1, '2019-02-25 21:37:41', '2019-02-25 21:37:41');
INSERT INTO `work_admin_visit_logs` VALUES (227, 2, 2, '175.9.44.217', '2019-02-26 09:40:18', 'pc', 1, '2019-02-26 09:40:18', '2019-02-26 09:40:18');
INSERT INTO `work_admin_visit_logs` VALUES (228, 2, 2, '113.246.203.92', '2019-02-26 10:07:24', 'pc', 1, '2019-02-26 10:07:24', '2019-02-26 10:07:24');
INSERT INTO `work_admin_visit_logs` VALUES (229, 2, 2, '175.9.44.217', '2019-02-26 10:57:50', 'pc', 1, '2019-02-26 10:57:50', '2019-02-26 10:57:50');
INSERT INTO `work_admin_visit_logs` VALUES (230, 2, 2, '113.246.203.92', '2019-02-26 11:44:29', 'pc', 1, '2019-02-26 11:44:29', '2019-02-26 11:44:29');
INSERT INTO `work_admin_visit_logs` VALUES (231, 2, 2, '192.168.0.130', '2019-03-19 14:23:15', 'pc', 1, '2019-03-19 14:23:15', '2019-03-19 14:23:15');
INSERT INTO `work_admin_visit_logs` VALUES (232, 2, 2, '192.168.0.130', '2019-03-19 17:32:57', 'pc', 1, '2019-03-19 17:32:57', '2019-03-19 17:32:57');
INSERT INTO `work_admin_visit_logs` VALUES (233, 2, 2, '192.168.0.130', '2019-03-19 17:33:25', 'pc', 1, '2019-03-19 17:33:25', '2019-03-19 17:33:25');
INSERT INTO `work_admin_visit_logs` VALUES (234, 2, 2, '192.168.0.130', '2019-03-19 17:35:14', 'pc', 1, '2019-03-19 17:35:14', '2019-03-19 17:35:14');
INSERT INTO `work_admin_visit_logs` VALUES (235, 2, 2, '192.168.0.130', '2019-03-19 17:35:34', 'pc', 1, '2019-03-19 17:35:34', '2019-03-19 17:35:34');
INSERT INTO `work_admin_visit_logs` VALUES (236, 2, 2, '192.168.0.130', '2019-03-19 17:38:47', 'pc', 1, '2019-03-19 17:38:47', '2019-03-19 17:38:47');
INSERT INTO `work_admin_visit_logs` VALUES (237, 2, 2, '192.168.0.130', '2019-03-19 17:40:06', 'pc', 1, '2019-03-19 17:40:06', '2019-03-19 17:40:06');
INSERT INTO `work_admin_visit_logs` VALUES (238, 2, 2, '192.168.0.130', '2019-03-19 17:41:05', 'pc', 1, '2019-03-19 17:41:05', '2019-03-19 17:41:05');
INSERT INTO `work_admin_visit_logs` VALUES (239, 2, 2, '192.168.0.130', '2019-03-19 17:45:57', 'pc', 1, '2019-03-19 17:45:57', '2019-03-19 17:45:57');
INSERT INTO `work_admin_visit_logs` VALUES (240, 2, 2, '192.168.0.130', '2019-03-20 17:46:22', 'pc', 1, '2019-03-20 17:46:22', '2019-03-20 17:46:22');
INSERT INTO `work_admin_visit_logs` VALUES (241, 2, 2, '192.168.0.130', '2019-03-20 17:50:23', 'pc', 1, '2019-03-20 17:50:23', '2019-03-20 17:50:23');
INSERT INTO `work_admin_visit_logs` VALUES (242, 2, 2, '192.168.0.130', '2019-03-20 17:50:48', 'pc', 1, '2019-03-20 17:50:48', '2019-03-20 17:50:48');
INSERT INTO `work_admin_visit_logs` VALUES (243, 2, 2, '192.168.0.130', '2019-03-20 18:06:32', 'pc', 1, '2019-03-20 18:06:32', '2019-03-20 18:06:32');
INSERT INTO `work_admin_visit_logs` VALUES (244, 2, 2, '192.168.0.130', '2019-03-20 18:45:14', 'pc', 1, '2019-03-20 18:45:14', '2019-03-20 18:45:14');
INSERT INTO `work_admin_visit_logs` VALUES (245, 2, 2, '192.168.0.130', '2019-03-20 18:45:40', 'pc', 1, '2019-03-20 18:45:40', '2019-03-20 18:45:40');
INSERT INTO `work_admin_visit_logs` VALUES (246, 2, 2, '192.168.0.130', '2019-03-21 15:21:02', 'pc', 1, '2019-03-21 15:21:02', '2019-03-21 15:21:02');
INSERT INTO `work_admin_visit_logs` VALUES (247, 2, 2, '192.168.0.140', '2019-03-24 16:37:10', 'pc', 1, '2019-03-24 16:37:10', '2019-03-24 16:37:10');
INSERT INTO `work_admin_visit_logs` VALUES (248, 2, 2, '192.168.0.130', '2019-03-24 16:37:42', 'pc', 1, '2019-03-24 16:37:42', '2019-03-24 16:37:42');
INSERT INTO `work_admin_visit_logs` VALUES (249, 2, 2, '192.168.0.130', '2019-03-24 16:38:15', 'pc', 1, '2019-03-24 16:38:15', '2019-03-24 16:38:15');
INSERT INTO `work_admin_visit_logs` VALUES (250, 2, 2, '192.168.0.107', '2019-03-25 13:37:24', 'pc', 1, '2019-03-25 13:37:24', '2019-03-25 13:37:24');
INSERT INTO `work_admin_visit_logs` VALUES (251, 2, 2, '192.168.0.130', '2019-03-25 17:28:07', 'pc', 1, '2019-03-25 17:28:07', '2019-03-25 17:28:07');
INSERT INTO `work_admin_visit_logs` VALUES (252, 2, 2, '192.168.0.130', '2019-03-25 20:41:21', 'pc', 1, '2019-03-25 20:41:21', '2019-03-25 20:41:21');
INSERT INTO `work_admin_visit_logs` VALUES (253, 2, 2, '192.168.0.140', '2019-03-27 17:10:29', 'pc', 1, '2019-03-27 17:10:29', '2019-03-27 17:10:29');
INSERT INTO `work_admin_visit_logs` VALUES (254, 2, 2, '192.168.0.159', '2019-03-28 17:22:20', 'pc', 1, '2019-03-28 17:22:20', '2019-03-28 17:22:20');
INSERT INTO `work_admin_visit_logs` VALUES (255, 2, 2, '192.168.0.130', '2019-03-29 10:45:09', 'pc', 1, '2019-03-29 10:45:09', '2019-03-29 10:45:09');
INSERT INTO `work_admin_visit_logs` VALUES (256, 2, 2, '192.168.0.130', '2019-03-29 11:08:38', 'pc', 1, '2019-03-29 11:08:38', '2019-03-29 11:08:38');
INSERT INTO `work_admin_visit_logs` VALUES (257, 2, 2, '192.168.0.130', '2019-03-29 11:13:12', 'pc', 1, '2019-03-29 11:13:12', '2019-03-29 11:13:12');
INSERT INTO `work_admin_visit_logs` VALUES (258, 2, 2, '192.168.0.130', '2019-03-29 11:20:31', 'pc', 1, '2019-03-29 11:20:31', '2019-03-29 11:20:31');
INSERT INTO `work_admin_visit_logs` VALUES (259, 2, 2, '192.168.0.130', '2019-03-29 11:22:03', 'pc', 1, '2019-03-29 11:22:03', '2019-03-29 11:22:03');
INSERT INTO `work_admin_visit_logs` VALUES (260, 2, 2, '192.168.0.130', '2019-03-29 11:22:54', 'pc', 1, '2019-03-29 11:22:54', '2019-03-29 11:22:54');
COMMIT;

-- ----------------------------
-- Table structure for work_admins
-- ----------------------------
DROP TABLE IF EXISTS `work_admins`;
CREATE TABLE `work_admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) DEFAULT NULL COMMENT '管理员手机号',
  `name` varchar(50) DEFAULT NULL COMMENT '管理员真实姓名',
  `user_name` varchar(50) DEFAULT NULL COMMENT '管理员用户名',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '管理员昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '管理员头像',
  `telephone` varchar(20) DEFAULT NULL COMMENT '管理员联系电话',
  `qq` varchar(255) DEFAULT NULL COMMENT '管理员qq号',
  `wechat` varchar(255) DEFAULT NULL COMMENT '管理员微信号',
  `email` varchar(50) DEFAULT NULL COMMENT '管理员邮箱',
  `memo` text COMMENT '备注',
  `role_ids` text COMMENT '角色IDs',
  `status` tinyint(1) DEFAULT '1' COMMENT '管理员状态：1正常9黑名单',
  `is_view` tinyint(1) DEFAULT '1' COMMENT '是否显示：0否1是',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0假删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_admins
-- ----------------------------
BEGIN;
INSERT INTO `work_admins` VALUES (1, '', '', '', 'super', '', '', '', '', '', '', '[3]', 1, 0, 1, '2018-04-10 16:40:36', '2018-04-11 16:46:56');
INSERT INTO `work_admins` VALUES (2, '18888888888', '', '', 'admin', '/public/upload/user_images/20190329/5a88f16b2470d09aacce1b3e7396e10d.jpeg', '', '', '', '', '', '[2,3]', 1, 1, 1, '2018-04-10 16:40:48', '2018-04-11 16:46:56');
INSERT INTO `work_admins` VALUES (3, '', '', '', 'test', '', '', '', '', '', '', '[2]', 1, 1, 0, '2018-04-11 10:22:20', '2018-04-11 10:30:41');
INSERT INTO `work_admins` VALUES (4, '', '', '', 'test', '', '', '', '', '', '', '[2]', 1, 1, 0, '2018-04-11 14:09:07', '2018-09-03 10:37:56');
INSERT INTO `work_admins` VALUES (5, '18888888881', '', '', '1231', '/public/upload/user_avatar_images/20180629\\ab37000fab1f28d08476b722a2c9aca3.png', '188888888888', '', '', 'afdf@fadf.fga', 'fdafadfadsfdasfsd', '[3]', 1, 1, 0, '2018-06-29 11:59:02', '2018-09-03 10:37:53');
INSERT INTO `work_admins` VALUES (6, '', '', '', '测试管理', '/public/upload/user_images/20180824/dccaa48903262c321b02db6fc5f38642.png', '', '', '', '', '', '[2]', 1, 1, 0, '2018-08-24 09:52:10', '2018-09-03 10:37:39');
INSERT INTO `work_admins` VALUES (7, '11111111111', '', '', '1', '', '11111111111', '', '', '1@qq.com', '1', '[2]', 1, 1, 0, '2018-09-04 09:48:51', '2018-09-04 09:49:07');
INSERT INTO `work_admins` VALUES (8, '', '', '', 'yiyun', '/public/static/images/avatar.png', '', '', '', '', '', '[3]', 1, 0, 1, '2018-11-10 10:05:47', '2018-11-10 10:05:47');
INSERT INTO `work_admins` VALUES (9, '18175974828', '', '', '', '', '', '', '', '', '', '[2]', 1, 1, 1, '2018-11-12 11:36:45', '2018-11-12 11:36:45');
INSERT INTO `work_admins` VALUES (10, '', NULL, '', 'wancll520', '/public/upload/user_images/20181206/afc01a218814ce500038d221d9720c38.png', '', '', '', '', '', '[2]', 1, 1, 1, '2018-12-06 16:37:49', '2018-12-06 16:37:49');
INSERT INTO `work_admins` VALUES (11, '', NULL, '', 'wancll888', '/public/upload/user_images/20181206/a8ce4fc45519de283dc97cc6744a73a5.png', '', '', '', '', '', '[2]', 1, 1, 1, '2018-12-06 16:38:18', '2018-12-06 16:38:18');
COMMIT;

-- ----------------------------
-- Table structure for work_advertisements
-- ----------------------------
DROP TABLE IF EXISTS `work_advertisements`;
CREATE TABLE `work_advertisements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) NOT NULL COMMENT '广告类型ID',
  `name` varchar(255) NOT NULL COMMENT '广告名称',
  `img` text COMMENT '广告图片',
  `alt` varchar(255) DEFAULT NULL COMMENT '图片alt属性',
  `memo` text COMMENT '备注',
  `position` varchar(50) DEFAULT NULL COMMENT '广告显示位置',
  `href` text COMMENT '链接',
  `is_open_model` tinyint(1) DEFAULT '0' COMMENT '是否开启模型：0否1是',
  `model` varchar(50) DEFAULT NULL COMMENT '绑定模型',
  `model_id` bigint(20) DEFAULT NULL COMMENT '模型ID',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_advertisements
-- ----------------------------
BEGIN;
INSERT INTO `work_advertisements` VALUES (1, 4, 'WAP首页广告1', '/public/upload/article_images/20180724\\c3eb76df4a99d086f6fc8fd56e8235a6.png', '', '', 'wap端首页广告1', '', 0, '', 0, 1, 0, '2018-07-24 11:38:54', '2018-07-24 11:40:29');
INSERT INTO `work_advertisements` VALUES (2, 3, 'wap首页广告1', '/public/upload/article_images/20180830/04a83a05636b65372fc4fea8ae5b9ca2.png', '', '', '', '', 0, '', 0, 2, 0, '2018-08-04 19:08:27', '2019-02-23 17:56:31');
INSERT INTO `work_advertisements` VALUES (3, 4, '455454', '/public/upload/article_images/20180903/d0d0a37bacfcdd7495e86aed5c61f5ee.jpg', '545454', '', '3', 'http://www.baidu.com', 0, '', 0, 2, 0, '2018-08-24 13:10:54', '2019-02-23 17:56:35');
INSERT INTO `work_advertisements` VALUES (4, 3, '434', '/public/upload/article_images/20180901/6d7facaee9503df9055a730a6bd31e9c.png', '43', '', '', '', 0, '', 0, 1, 0, '2018-08-24 13:11:20', '2019-02-23 17:56:33');
INSERT INTO `work_advertisements` VALUES (5, 2, '哼哼唧唧', '', '', NULL, '', '', 0, '', 0, 1, 1, '2019-02-25 17:09:40', '2019-02-25 17:09:40');
COMMIT;

-- ----------------------------
-- Table structure for work_annoncements
-- ----------------------------
DROP TABLE IF EXISTS `work_annoncements`;
CREATE TABLE `work_annoncements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) NOT NULL COMMENT '公告类型ID',
  `title` varchar(255) NOT NULL COMMENT '公告标题',
  `author` varchar(50) DEFAULT NULL,
  `intro` text COMMENT '公告简介',
  `thum` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `imgs` text COMMENT '图片集',
  `content` text COMMENT '公告内容',
  `audio_url` text COMMENT '音频链接',
  `video_url` text COMMENT '视频链接',
  `online_time` datetime DEFAULT NULL COMMENT '公告上线时间',
  `offline_time` datetime DEFAULT NULL COMMENT '公告下线时间',
  `issue_time` datetime DEFAULT NULL COMMENT '公告发布时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_annoncements
-- ----------------------------
BEGIN;
INSERT INTO `work_annoncements` VALUES (1, 29, 'Wancll商城系统全新升级，敬请期待！', '', '', '', '[]', '', '', '', '2018-12-05 15:07:02', '2018-07-31 00:00:00', '2018-11-28 11:54:06', 1, 0, '2018-07-24 11:54:03', '2019-03-22 17:42:10');
INSERT INTO `work_annoncements` VALUES (2, 7, '1', '1', '1', '/public/upload/article_images/20180824/0da1e41284a68ed2ba298e4485e52343.png', '[]', '<p>66</p>', '1', '', '2018-08-27 00:00:00', '2018-08-31 00:00:00', '2018-08-24 00:00:00', 1, 0, '2018-08-24 13:14:45', '2018-09-03 11:47:36');
INSERT INTO `work_annoncements` VALUES (3, 29, '双十二钜惠，Wancll商城大波福利等你领取', '电商部小天', '', '/public/upload/article_images/20181205/7f4215067c6fe2174cfd22252d059976.png', '[]', '<p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: \">双十二钜惠，Wancll商城大波福利等你领取！</p><p><span class=\"origin\" style=\"display: block; position: absolute; z-index: 4; width: 89px; height: 29px; right: 0px; background-image: url(\"></span></p><p><span class=\"lb-left s_arrow_left\" style=\"display: block; position: absolute; z-index: 4; top: 0px; margin-top: -40px; left: 0px; width: 22px; height: 64px; background-image: url(\"></span><span class=\"lb-right s_arrow_right\" style=\"display: block; position: absolute; z-index: 4; top: 0px; margin-top: -40px; right: 0px; width: 22px; height: 64px; background-image: url(\"></span></p><p><br/></p>', '', '', '2018-12-05 15:03:50', '2018-09-30 00:00:00', '2018-09-03 00:00:00', 1, 0, '2018-09-03 11:50:13', '2019-03-22 17:42:07');
INSERT INTO `work_annoncements` VALUES (4, 29, '热烈祝贺DK服装入驻Wancll商城', '电商部小天', '', '', '[]', '<p>热烈祝贺DK服装入驻Wancll商城</p>', '', '', '2018-12-05 15:00:47', NULL, '2018-12-04 10:14:00', 1, 0, '2018-11-29 21:45:22', '2019-03-22 17:42:04');
INSERT INTO `work_annoncements` VALUES (5, 6, '收到繁花似锦', '', '', '/public/upload/article_images/20190223/998d232c358e6799b60401c7d1f20bf9.png', '[]', '<p>都是粉红色的护肤时间到家公司发布</p>', '', '', NULL, NULL, NULL, 1, 1, '2019-02-23 17:04:47', '2019-02-23 17:04:47');
INSERT INTO `work_annoncements` VALUES (6, 29, '额问问', '问问', ' ', '', '[]', '', '', '', NULL, NULL, NULL, 1, 0, '2019-02-23 17:58:03', '2019-03-22 17:42:14');
COMMIT;

-- ----------------------------
-- Table structure for work_articles
-- ----------------------------
DROP TABLE IF EXISTS `work_articles`;
CREATE TABLE `work_articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '文章摘要',
  `thum` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `intro` text COMMENT '文章简介',
  `content` longtext COMMENT '文章内容',
  `author` varchar(50) DEFAULT NULL COMMENT '文章作者',
  `imgs` text COMMENT '文章的图片集',
  `audio_url` text COMMENT '音频链接',
  `video_url` text COMMENT '视频链接',
  `type_id` bigint(20) DEFAULT '0' COMMENT '文章的分类ID',
  `click_num` bigint(20) DEFAULT '0' COMMENT '文章的点击量',
  `status` tinyint(1) DEFAULT '1' COMMENT '1上线2下线',
  `issue_time` varchar(255) DEFAULT NULL COMMENT '文章发布时间',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_articles
-- ----------------------------
BEGIN;
INSERT INTO `work_articles` VALUES (1, '热烈祝贺DK服装入驻Wancll商城', '/public/upload/article_images/20181205/0cd651cee53722db094d19e7a0c56d3b.jpg', '国际知名品牌DK服装入驻Wancll商城。', '<header><h1>热烈祝贺DK服装入驻Wancll商城</h1><p><a href=\"https://www.wancll.com\" target=\"_self\">电商部小天</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;12-5 14:53<a style=\"display: none;\" href=\"https://m.haiwainet.cn/ttc/3541083/2018/0724/content_31359718_1.html#\">显示图片</a> &nbsp; &nbsp; &nbsp;</p></header><p><br/></p><article><p class=\"imgs_c\"><br/></p><p>当地时间23日，韩国首尔，警方在鲁会灿跳楼现场进行调查 供图/视觉中国</p><p>韩国首都首尔警方23日说，在野党正义党党鞭、国会议员鲁会灿当天上午在公寓楼跳楼自尽。</p><p>鲁会灿是韩国劳工运动代表性人物，以清廉形象著称，最近却因牵涉搅动政坛的“网络水军案”接受调查，被指两年前非法收受5000万韩元(约合30万元人民币)政治捐款。警方说，不会作尸检，原因是鲁会灿死亡没有可疑之处，而且家人不同意。</p><p><strong>警方称不会作尸检</strong></p><p>警方官员说，当天上午9时38分，首尔市中心一座公寓楼的保安金某在大门附近发现鲁会灿的尸体，立即报警。</p><p>“我听到砰的一响，然后就在那儿发现了鲁议员，”金某说，“我立即向警方报告这起事件，没有碰任何东西。警察告诉我去看看他还有没有脉搏，我试着做了，但是没有脉搏，尽管当时他摔到地上只有一两分钟。”</p><p>警方稍后在公寓楼17层和18层之间的楼梯间发现一件夹克衫，里面有装着鲁会灿身份证件和名片的钱包，以及一封遗书。</p><p>鲁会灿在遗书中承认拿钱，但否认干非法勾当。他在遗书中写道，他收了那笔钱，但是与任何“不当请求”无关。他对不起自己的家人。</p><p>鲁会灿的母亲和一个兄弟住在这座公寓楼里。</p><p>警方说，不会作尸检，原因是鲁会灿死亡没有可疑之处，而且家人不同意。按照家人的意愿，遗书其他部分不会公开。</p><p>鲁会灿是韩国自前总统卢武铉2009年5月因家人卷入腐败丑闻而跳崖以来，自杀身亡的最知名政治人物。</p><p><strong>经常犀利揭露体制内腐败</strong></p><p>鲁会灿61岁，劳工维权人士出身，三次当选国会议员，是韩国劳工运动和进步派政治标志性人物之一。他经常犀利揭露和尖锐抨击体制内腐败，人气很高。</p><p>只是，鲁会灿近期卷入网络水军案，涉嫌收受非法献金一事，接受检察部门调查，一直以来的清廉形象黯然失色。</p><p>网络水军案主角是博客博主金某，网名“Druking”。检方指认，金某及其团队借助电脑程序在网络新闻下捏造留言和评论，目的是在政治热点议题上操控民意，使舆情有利于现执政党共同民主党。</p><p>警方调查发现，金某与执政党、青瓦台官员有联系，其中包括上月当选庆尚南道知事的前议员、总统文在寅的心腹金庆洙。</p><p>检方指认，金某的亲信都某2016年向鲁会灿非法捐款5000万韩元，并安排金某和鲁会灿见面。韩联社报道，鲁会灿曾经从金某活动的网络论坛获得2000万韩元(12万元人民币)演讲费。</p><p>鲁会灿否认上述指认。首尔一家法院19日拒绝批准特别检察官逮捕都某。</p><p>警方和检方2016年联合调查鲁会灿所涉非法献金案，但没有起诉。</p><p>作为网络水军案调查的一部分，特别检察官许益范(音译)带领特别检察组开始重新调查这起案件，发现都某向调查人员提交伪造证据，致使检方两年前没能提出起诉。</p><p><strong>朝野各党党鞭取消会议</strong></p><p>许益范对鲁会灿之死表达哀悼。他告诉媒体记者，他个人“尊重”鲁会灿，这一“悲剧性消息”令他痛苦。“我为他的灵魂祈祷，向他的家人表达哀悼。”系着黑色领带的许益范在镜头前深深低下头。</p><p>青瓦台同样对鲁会灿之死表达哀悼。“这是令人心碎的事件，”青瓦台发言人金宜谦说，“我希望鲁议员安息。”青瓦台宣布，文在寅取消原定当天听取和回复网络请愿的互联网广播节目。</p><p>鲁会灿所在的正义党说：“对他的逝去，没有语言能够表达悲伤。”正义党当天晚些时候举行紧急会议。</p><p>正义党和另一个在野小党民主和平党今年3月组成议会党团，由鲁会灿担任代表。</p><p>共同民主党发言人白惠莲说：“鲁会灿自上世纪90年代以来就致力于进步派政治，是韩国历史上进步派政治的象征。”</p><p>保守派的最大在野党自由韩国党说，鲁会灿之死是“韩国政治的一个悲剧”，“他作为政治家树立了一个关心普通民众和劳工的榜样”，朝野政党应当延续鲁会灿对政治改革和发展的热忱。</p><p>朝野各党党鞭原定当天上午开会，商讨促进在国会的合作，但在鲁会灿坠楼身亡后取消会议。</p></article><p><br/></p><p>31359718,.韩正义党党鞭涉&quot;网络水军案&quot;跳楼 否认干非法勾当,.2018-07-24 06:53:52,.204233,.耿佩,.toutiao</p><p><br/></p>', '电商部小天', '[]', '', '', 25, 0, 1, '', 0, '2018-07-24 10:57:26', '2019-02-23 17:56:42');
INSERT INTO `work_articles` VALUES (2, '9月你好', '/public/upload/article_images/20180824/5666be1eff868608d8454b5d0efc8c31.png', '', '<p>的方法的奋斗的非官方大哥大哥大对方答复<br/></p>', '大大', '[]', '4343', '344343', 25, 0, 1, '', 0, '2018-08-24 13:10:09', '2018-09-03 11:45:32');
INSERT INTO `work_articles` VALUES (3, '44', '/public/upload/article_images/20180824/6bec19f2686cbbb6a8573f2487947a19.png', '4', '<p>5454545454<br/></p>', '4', '[]', '4', '4', 25, 0, 1, '', 0, '2018-08-24 15:08:06', '2018-09-03 11:45:32');
INSERT INTO `work_articles` VALUES (4, '44', '/public/upload/article_images/20180824/6bec19f2686cbbb6a8573f2487947a19.png', '4', '<p>5454545454<br/></p>', '4', '[]', '4', '4', 25, 0, 1, '', 0, '2018-08-24 15:08:06', '2018-09-03 11:45:32');
INSERT INTO `work_articles` VALUES (5, '44', '/public/upload/article_images/20180824/6bec19f2686cbbb6a8573f2487947a19.png', '4', '<p>5454545454<br/></p>', '4', '[]', '4', '4', 25, 0, 1, '', 0, '2018-08-24 15:08:06', '2018-09-03 11:45:32');
INSERT INTO `work_articles` VALUES (6, '65', '/public/upload/article_images/20180824/41557b04fca07d46651b985764fb4cbd.png', '56', '<p>565656<br/></p>', '56', '[]', '56', '56', 25, 0, 1, '', 0, '2018-08-24 15:10:37', '2018-09-03 11:45:32');
INSERT INTO `work_articles` VALUES (7, '65', '/public/upload/article_images/20180824/41557b04fca07d46651b985764fb4cbd.png', '56', '<p>565656<br/></p>', '56', '[]', '56', '56', 26, 0, 1, '', 0, '2018-08-24 15:10:37', '2018-09-03 11:45:32');
INSERT INTO `work_articles` VALUES (8, '1', '', '1', '', '1', '[]', '1', '1', 27, 0, 1, '', 0, '2018-09-04 09:54:00', '2018-09-04 09:54:04');
INSERT INTO `work_articles` VALUES (9, '感遇四首之一 ', '/public/upload/article_images/20190325/8ec913bf9eb63ca1d5ce4c30444ed242.jpg', '孤鸿海上来，池潢不敢顾。\n侧见双翠鸟，巢在三珠树。\n矫矫珍木巅，得无金丸惧。\n美服患人指，高明逼神恶。\n今我游冥冥，弋者何所慕。', '<p>i暖色调的话就快点萨达说过的话三个多月厚度为业务订单额外的给广大海关大厦广东撒谎</p>', '张九龄', '[]', '2312312', '123', 25, 0, 1, NULL, 1, '2019-03-22 17:46:47', '2019-03-22 17:46:47');
COMMIT;

-- ----------------------------
-- Table structure for work_attr_templates
-- ----------------------------
DROP TABLE IF EXISTS `work_attr_templates`;
CREATE TABLE `work_attr_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性模板名称',
  `intro` text COMMENT '商品属性模板简介',
  `content` text COMMENT '商品属性模板内容',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '商品属性模板排序',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_attr_templates
-- ----------------------------
BEGIN;
INSERT INTO `work_attr_templates` VALUES (1, '衣服属性模板', '', '[{\"name\":\"品牌\",\"options\":[\"轩斯顿（XUANSIDUN）\",\"轩斯顿2（XUANSIDUN）\"]},{\"name\":\"商品名称\",\"options\":[\"轩斯顿 短袖T恤\"]},{\"name\":\"商品编号\",\"options\":[\"27069258521\"]},{\"name\":\"商品重量\",\"options\":[\"500.00g\"]},{\"name\":\"商品产地\",\"options\":[\"中国大陆\"]},{\"name\":\"厚度\",\"options\":[\"常规\"]},{\"name\":\"领型\",\"options\":[\"连帽\"]},{\"name\":\"颜色\",\"options\":[\"灰色\"]},{\"name\":\"袖长\",\"options\":[\"五分袖\"]}]', 0, 1, '2018-07-24 10:45:13', '2018-07-24 10:45:13');
INSERT INTO `work_attr_templates` VALUES (2, '颜色', '颜色属性', '[{\"name\":\"红\",\"options\":[\"大红\",\"深红\"]},{\"name\":\"黑\",\"options\":[\"非常黑\",\"一般黑\"]},{\"name\":\"灰\",\"options\":[\"灰色\"]},{\"name\":\"绿\",\"options\":[\"绿色\"]}]', 0, 0, '2018-08-24 08:02:58', '2018-12-05 17:26:34');
INSERT INTO `work_attr_templates` VALUES (3, '行李箱属性', NULL, '[{\"name\":\"产地\",\"options\":[\"中国\"]},{\"name\":\"材质\",\"options\":[\"铝合金\"]}]', 0, 1, '2018-12-05 11:35:22', '2018-12-05 11:35:22');
INSERT INTO `work_attr_templates` VALUES (4, '女包属性', NULL, '[{\"name\":\"产地\",\"options\":[\"英国\",\"法国\"]},{\"name\":\"材质\",\"options\":[\"真皮\"]}]', 0, 1, '2018-12-05 12:53:55', '2018-12-05 12:53:55');
INSERT INTO `work_attr_templates` VALUES (5, '电脑属性', NULL, '[{\"name\":\"处理器\",\"options\":[\"Intel\"]},{\"name\":\"材质\",\"options\":[\"金属\",\"塑料\"]}]', 0, 1, '2018-12-05 16:06:47', '2018-12-05 16:06:47');
INSERT INTO `work_attr_templates` VALUES (6, '手机属性', NULL, '[{\"name\":\"系统\",\"options\":[\"Android\",\"ios\"]},{\"name\":\"尺寸\",\"options\":[\"5.5英寸\",\"5.8英寸\"]}]', 0, 1, '2018-12-05 16:29:19', '2018-12-05 16:29:19');
INSERT INTO `work_attr_templates` VALUES (7, '图书属性', NULL, '[{\"name\":\"开本\",\"options\":[\"16开\"]},{\"name\":\"套装\",\"options\":[\"是\",\"否\"]},{\"name\":\"出版时间\",\"options\":[\"2015年\"]}]', 0, 1, '2018-12-06 09:59:08', '2018-12-06 09:59:08');
INSERT INTO `work_attr_templates` VALUES (8, '美妆属性', NULL, '[{\"name\":\"保质期\",\"options\":[\"2年\"]},{\"name\":\"适用群体\",\"options\":[\"男\",\"女\"]}]', 0, 1, '2018-12-06 10:45:54', '2018-12-06 10:45:54');
INSERT INTO `work_attr_templates` VALUES (9, '项链属性', NULL, '[{\"name\":\"材质\",\"options\":[\"合金\",\"黄金\",\"纯银\"]},{\"name\":\"风格\",\"options\":[\"时尚\",\"简约\"]}]', 0, 1, '2018-12-06 11:38:07', '2018-12-06 11:38:07');
INSERT INTO `work_attr_templates` VALUES (10, '手表属性', NULL, '[{\"name\":\"表带材质\",\"options\":[\"金属\"]},{\"name\":\"表盘形状\",\"options\":[\"圆形\"]}]', 0, 1, '2018-12-06 11:38:56', '2018-12-06 11:38:56');
INSERT INTO `work_attr_templates` VALUES (11, '加湿器属性', NULL, '[{\"name\":\"加湿方式\",\"options\":[\"有雾\",\"无雾\"]},{\"name\":\"适用群体\",\"options\":[\"家用\"]}]', 0, 1, '2018-12-06 13:00:46', '2018-12-06 13:00:46');
INSERT INTO `work_attr_templates` VALUES (12, '空净属性', NULL, '[{\"name\":\"供电方式\",\"options\":[\"交流电\"]},{\"name\":\"适用群体\",\"options\":[\"家用\"]}]', 0, 1, '2018-12-06 13:02:06', '2018-12-06 13:02:06');
INSERT INTO `work_attr_templates` VALUES (13, '母婴属性', NULL, '[{\"name\":\"保质期\",\"options\":[\"两年\"]},{\"name\":\"产地\",\"options\":[\"国产\",\"外国\"]}]', 0, 1, '2018-12-06 13:39:50', '2018-12-06 13:39:50');
INSERT INTO `work_attr_templates` VALUES (14, '面料', NULL, '[{\"name\":\"面料\",\"options\":[\"棉\",\"麻\"]}]', 0, 1, '2019-02-23 16:54:32', '2019-02-23 16:54:32');
COMMIT;

-- ----------------------------
-- Table structure for work_banners
-- ----------------------------
DROP TABLE IF EXISTS `work_banners`;
CREATE TABLE `work_banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) NOT NULL COMMENT '轮播图类别ID',
  `name` varchar(255) NOT NULL COMMENT '轮播图名称',
  `img` text COMMENT '轮播图图片',
  `alt` varchar(255) DEFAULT NULL COMMENT '图片alt属性',
  `href` text COMMENT '链接',
  `position` varchar(50) DEFAULT NULL COMMENT '轮播图显示位置',
  `memo` text COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '轮播图状态：1上线2下线',
  `is_open_model` tinyint(1) DEFAULT '0' COMMENT '开启模型：0关闭1开启',
  `model` varchar(50) DEFAULT NULL,
  `model_id` bigint(20) DEFAULT NULL,
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_banners
-- ----------------------------
BEGIN;
INSERT INTO `work_banners` VALUES (1, 11, 'wap轮播图1', '/public/upload/article_images/20190328/7ac38139034b858ed5fb0b78ce2bb97d.jpg', '', 'www.wancll.com', '', '', 1, 0, '', 0, 1, '2018-07-24 15:20:33', '2018-07-24 15:20:33');
INSERT INTO `work_banners` VALUES (2, 11, 'wap轮播图2', '/public/upload/article_images/20190328/ace4044748742a7c82b507317301e360.jpg', '', 'www.wancll.com', '', '', 1, 0, '', 0, 1, '2018-07-24 15:21:30', '2018-07-24 15:21:30');
INSERT INTO `work_banners` VALUES (3, 11, 'wap轮播图3', '/public/upload/article_images/20190328/ab9261893716f12429c44cda18a7ce9b.jpg', '', '', '', '', 1, 1, 'goods', 107, 1, '2018-07-24 15:21:47', '2018-07-24 15:21:47');
INSERT INTO `work_banners` VALUES (4, 10, 'Pc轮播图', '/public/upload/article_images/20180827/f2f0f6ba8a22e7d6317eaa05615533fc.png', '3', '3', '3', '', 1, 0, '', 0, 1, '2018-08-27 17:18:43', '2018-08-27 17:18:43');
INSERT INTO `work_banners` VALUES (5, 28, 'WAP领券中心轮播图1', '/public/upload/article_images/20181205/a70b865d7d8e4bb71a256191c562a2a3.png', '', '', '', '', 1, 0, '', 0, 1, '2018-09-01 15:20:47', '2018-09-01 15:20:47');
INSERT INTO `work_banners` VALUES (6, 11, '对方的', '/public/upload/article_images/20190328/3370d59df2213d46fb4b7eff69205a15.jpg', '', '', '', NULL, 1, 0, '', 0, 1, '2019-02-23 17:09:22', '2019-02-23 17:09:22');
INSERT INTO `work_banners` VALUES (7, 28, ' huod', '/public/upload/article_images/20190224/ceab58b186802511c74f15c9e695a749.png', '', '', '', NULL, 1, 0, '', 0, 0, '2019-02-24 12:04:15', '2019-02-24 12:04:46');
COMMIT;

-- ----------------------------
-- Table structure for work_build_fair
-- ----------------------------
DROP TABLE IF EXISTS `work_build_fair`;
CREATE TABLE `work_build_fair` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户 ID',
  `merchant_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商户名称',
  `contact_name` varchar(30) NOT NULL DEFAULT '' COMMENT '联系人',
  `telephone` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_build_fair
-- ----------------------------
BEGIN;
INSERT INTO `work_build_fair` VALUES (2, 62, '123123', '123123', '176215022221', 1, '2019-03-26 10:56:51', '2019-03-26 10:56:51');
COMMIT;

-- ----------------------------
-- Table structure for work_categories
-- ----------------------------
DROP TABLE IF EXISTS `work_categories`;
CREATE TABLE `work_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT '0' COMMENT '父分类id;0为顶层',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序：数值越大越靠前',
  `status` tinyint(4) DEFAULT '1' COMMENT '1正常2禁用',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_categories
-- ----------------------------
BEGIN;
INSERT INTO `work_categories` VALUES (1, 0, '广告类别', 50, 1, 1, '2018-06-28 14:20:08', '2018-06-29 21:12:36');
INSERT INTO `work_categories` VALUES (2, 1, '文章广告', 0, 1, 1, '2018-06-28 14:20:18', '2018-06-29 22:20:28');
INSERT INTO `work_categories` VALUES (3, 1, 'WAP首页广告', 3, 1, 1, '2018-06-29 15:51:20', '2018-06-29 15:51:20');
INSERT INTO `work_categories` VALUES (4, 1, '产品广告', 1, 1, 1, '2018-06-29 16:23:08', '2018-06-29 16:23:08');
INSERT INTO `work_categories` VALUES (5, 0, '通知公告类别', 40, 1, 1, '2018-06-29 21:25:13', '2018-06-30 09:15:24');
INSERT INTO `work_categories` VALUES (6, 5, '系统公告', 0, 1, 1, '2018-06-29 21:25:42', '2018-06-29 21:25:42');
INSERT INTO `work_categories` VALUES (7, 5, '产品公告', 0, 2, 0, '2018-06-29 21:26:07', '2019-03-22 17:42:38');
INSERT INTO `work_categories` VALUES (8, 5, '升级公告', 0, 1, 0, '2018-06-29 21:26:34', '2019-03-22 17:42:42');
INSERT INTO `work_categories` VALUES (9, 0, '轮播图类别', 30, 1, 1, '2018-06-29 21:26:52', '2018-06-29 21:26:52');
INSERT INTO `work_categories` VALUES (10, 9, 'PC端轮播图', 0, 1, 1, '2018-06-29 21:27:15', '2018-06-29 21:27:15');
INSERT INTO `work_categories` VALUES (11, 9, 'WAP端首页轮播图', 0, 1, 1, '2018-06-29 21:27:33', '2018-07-28 11:03:11');
INSERT INTO `work_categories` VALUES (12, 9, 'APP端轮播图', 0, 1, 1, '2018-06-29 21:28:05', '2018-06-29 21:28:05');
INSERT INTO `work_categories` VALUES (13, 0, '友情链接类别', 20, 1, 1, '2018-06-29 21:28:26', '2018-06-29 21:28:26');
INSERT INTO `work_categories` VALUES (14, 13, '行业友链', 0, 1, 1, '2018-06-29 21:28:46', '2018-06-29 21:28:46');
INSERT INTO `work_categories` VALUES (15, 13, '系统友链', 0, 1, 1, '2018-06-29 21:29:11', '2018-06-29 21:29:11');
INSERT INTO `work_categories` VALUES (16, 0, '规则类别', 10, 1, 1, '2018-06-29 21:29:30', '2018-06-29 21:29:30');
INSERT INTO `work_categories` VALUES (17, 16, '注册规则', 0, 1, 1, '2018-06-29 21:29:51', '2018-06-29 21:29:51');
INSERT INTO `work_categories` VALUES (18, 16, '支付规则', 0, 1, 1, '2018-06-29 21:30:10', '2018-06-29 21:30:10');
INSERT INTO `work_categories` VALUES (19, 16, '活动规则', 0, 1, 1, '2018-06-29 21:30:25', '2018-06-29 21:30:25');
INSERT INTO `work_categories` VALUES (20, 0, '指导手册类别', 5, 1, 1, '2018-06-29 22:03:54', '2018-06-29 22:03:54');
INSERT INTO `work_categories` VALUES (21, 20, '开发说明', 0, 1, 1, '2018-06-29 22:04:21', '2018-06-29 22:04:21');
INSERT INTO `work_categories` VALUES (22, 20, '使用说明', 0, 1, 1, '2018-06-29 22:04:32', '2018-06-29 22:04:32');
INSERT INTO `work_categories` VALUES (23, 20, '维护说明', 0, 1, 1, '2018-06-29 22:04:52', '2018-06-29 22:04:52');
INSERT INTO `work_categories` VALUES (24, 0, '文章分类', 60, 1, 1, '2018-06-30 09:48:01', '2018-06-30 09:48:01');
INSERT INTO `work_categories` VALUES (25, 24, '关于我们', 0, 1, 1, '2018-06-30 09:48:29', '2018-06-30 09:48:29');
INSERT INTO `work_categories` VALUES (26, 24, '文章分类2', 0, 1, 0, '2018-06-30 10:03:22', '2019-03-22 17:45:10');
INSERT INTO `work_categories` VALUES (27, 26, '文章分类2-1', 0, 1, 0, '2018-06-30 10:04:09', '2019-03-22 17:45:07');
INSERT INTO `work_categories` VALUES (28, 9, 'WAP领券中心轮播图', 0, 1, 1, '2018-09-01 15:20:06', '2018-09-01 15:20:06');
INSERT INTO `work_categories` VALUES (29, 5, 'WAP首页公告', 0, 1, 0, '2018-09-01 15:33:59', '2019-03-22 17:42:46');
INSERT INTO `work_categories` VALUES (30, 4, '3', 3, 1, 1, '2018-09-14 10:01:15', '2018-09-14 10:01:15');
INSERT INTO `work_categories` VALUES (31, 1, '限时折扣广告', 0, 1, 1, '2018-09-29 16:06:24', '2018-09-29 16:06:24');
COMMIT;

-- ----------------------------
-- Table structure for work_commission_applys
-- ----------------------------
DROP TABLE IF EXISTS `work_commission_applys`;
CREATE TABLE `work_commission_applys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `apply_no` varchar(255) NOT NULL COMMENT '申请分佣单号',
  `receipt_type` varchar(255) NOT NULL COMMENT '收款类别：money钱包wechat微信收款ali支付宝收款',
  `user_commission_log_ids` text NOT NULL COMMENT '订单IDs',
  `money` decimal(10,2) NOT NULL COMMENT '分享佣金',
  `already_pay_money` decimal(10,2) DEFAULT NULL COMMENT '已支付分享佣金',
  `intro` varchar(255) DEFAULT NULL COMMENT '提现简介',
  `desc` varchar(255) DEFAULT NULL COMMENT '申请提现详细说明',
  `memo` text COMMENT '备注',
  `deal_time` datetime DEFAULT NULL COMMENT '处理时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '是否打开：0未打款1已打款',
  `status` tinyint(1) DEFAULT '1' COMMENT '1申请中2审核未通过3审核通过',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_commission_applys
-- ----------------------------
BEGIN;
INSERT INTO `work_commission_applys` VALUES (1, 4, 'F2018112817364093362', 'ali', '[\"2\"]', 24.00, NULL, '申请佣金提现', '申请佣金提现：24￥，申请时间：2018-11-28 17:36:40', NULL, NULL, NULL, 0, 1, 1, '2018-11-28 17:36:40', '2018-11-28 17:38:42');
INSERT INTO `work_commission_applys` VALUES (2, 4, 'F2018112817380962082', 'money', '[]', 0.00, 0.00, '申请佣金提现', '申请佣金提现：0￥，申请时间：2018-11-28 17:38:09', NULL, '2018-11-28 17:38:23', '2018-11-28 17:38:23', 1, 3, 1, '2018-11-28 17:38:09', '2018-11-28 17:38:23');
INSERT INTO `work_commission_applys` VALUES (3, 4, 'F2018112817392230029', 'money', '[]', 0.00, 0.00, '申请佣金提现', '申请佣金提现：0￥，申请时间：2018-11-28 17:39:22', NULL, '2018-11-28 17:59:01', '2018-11-28 17:59:01', 1, 3, 1, '2018-11-28 17:39:22', '2018-11-28 17:59:01');
INSERT INTO `work_commission_applys` VALUES (4, 4, 'F2018112817540444331', 'ali', '[\"4\"]', 0.01, NULL, '申请佣金提现', '申请佣金提现：0.01￥，申请时间：2018-11-28 17:54:04', NULL, NULL, NULL, 0, 1, 1, '2018-11-28 17:54:04', '2018-11-28 17:54:04');
INSERT INTO `work_commission_applys` VALUES (5, 4, 'F2018112915432460253', 'money', '[\"5\"]', 0.01, 0.01, '申请佣金提现', '申请佣金提现：0.01￥，申请时间：2018-11-29 15:43:24', NULL, '2018-11-29 16:23:37', '2018-11-29 16:23:37', 1, 3, 1, '2018-11-29 15:43:24', '2018-11-29 16:23:37');
INSERT INTO `work_commission_applys` VALUES (6, 4, 'F2018112916232034019', 'money', '[\"6\"]', 0.01, 0.01, '申请佣金提现', '申请佣金提现：0.01￥，申请时间：2018-11-29 16:23:20', NULL, '2018-11-29 16:23:30', '2018-11-29 16:23:30', 1, 3, 1, '2018-11-29 16:23:20', '2018-11-29 16:23:30');
INSERT INTO `work_commission_applys` VALUES (7, 4, 'F2018112917230014945', 'money', '[\"7\"]', 0.01, 0.01, '申请佣金提现', '申请佣金提现：0.01￥，申请时间：2018-11-29 17:23:00', NULL, '2018-11-29 17:23:33', '2018-11-29 17:23:33', 1, 3, 1, '2018-11-29 17:23:00', '2018-11-29 17:23:33');
INSERT INTO `work_commission_applys` VALUES (8, 4, 'F2018120309382488569', 'money', '[\"12\"]', 0.10, NULL, '申请佣金提现', '申请佣金提现：0.1￥，申请时间：2018-12-03 09:38:24', NULL, NULL, NULL, 0, 1, 1, '2018-12-03 09:38:24', '2018-12-03 09:38:24');
INSERT INTO `work_commission_applys` VALUES (9, 4, 'F2018120309430940558', 'money', '[\"17\"]', 10.00, NULL, '申请佣金提现', '申请佣金提现：10￥，申请时间：2018-12-03 09:43:09', NULL, NULL, NULL, 0, 1, 1, '2018-12-03 09:43:09', '2018-12-03 09:43:09');
INSERT INTO `work_commission_applys` VALUES (10, 2, 'F2019022210153967556', 'money', '[10,22]', 27.39, NULL, '申请佣金提现', '申请佣金提现：27.39￥，申请时间：2019-02-22 10:15:39', NULL, NULL, NULL, 0, 1, 1, '2019-02-22 10:15:39', '2019-02-22 10:15:39');
INSERT INTO `work_commission_applys` VALUES (11, 2, 'F2019022313243110460', 'ali', '[\"86\"]', 15.90, NULL, '申请佣金提现', '申请佣金提现：15.9￥，申请时间：2019-02-23 13:24:31', NULL, NULL, NULL, 0, 1, 1, '2019-02-23 13:24:31', '2019-02-23 13:24:31');
COMMIT;

-- ----------------------------
-- Table structure for work_config
-- ----------------------------
DROP TABLE IF EXISTS `work_config`;
CREATE TABLE `work_config` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `team` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `type` varchar(50) DEFAULT NULL COMMENT 'img 图片',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='系统配置参数';

-- ----------------------------
-- Records of work_config
-- ----------------------------
BEGIN;
INSERT INTO `work_config` VALUES (27, 'version', 'v1.4.2', 'basic', 'text', '', 1, '2018-10-28 16:57:20', '2018-10-28 16:57:23');
INSERT INTO `work_config` VALUES (12, 'system_title', 'workshop', 'basic', 'text', '', 1, '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `work_config` VALUES (15, 'web_icon', '/public/upload/user_images/20180926/baa9bc1f16dbdc95b49db87e5adff317.png', 'basic', 'img', '', 1, '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `work_config` VALUES (16, 'admin_login_logo', '/public/upload/user_images/20190328/0e813edf8b9bdfd380557adcb7f590e8.png', 'basic', 'img', '', 1, '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `work_config` VALUES (17, 'admin_index_logo', '/public/upload/user_images/20190328/69f2eeda5f2e2c753545e05e5792c8f8.png', 'basic', 'img', '', 1, '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `work_config` VALUES (18, 'wap_index_logo', '/public/upload/user_images/20190328/af0e55de4adf8e8bc2069c5f14800f11.png', 'basic', 'img', '', 1, '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `work_config` VALUES (19, 'wap_login_logo', '/public/upload/user_images/20190328/1443e84eb09f2078b17e0ce57148a9eb.png', 'basic', 'img', '', 1, '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `work_config` VALUES (20, 'home_pc_logo', '/public/upload/user_images/20190328/cf15308e3c524be2018d5c141a0cbf41.png', 'basic', 'img', '', 1, '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `work_config` VALUES (28, 'copyright', '湖南蜗壳科技有限公司', 'basic', 'text', '', 1, '2018-10-28 16:58:30', '2018-10-28 16:58:33');
INSERT INTO `work_config` VALUES (29, 'avatar', '/public/upload/user_images/20190328/df6310d3fdc9d8d99041c63b6fa10f28.png', 'basic', 'img', '', 1, '2018-11-03 09:22:12', '2018-11-03 09:22:15');
INSERT INTO `work_config` VALUES (30, 'share_img', '/public/static/wap/images/yaoqing.png', 'basic', 'img', '', 1, '2018-11-03 09:42:19', '2018-11-03 09:42:22');
INSERT INTO `work_config` VALUES (31, 'customer_telephone', '', 'basic', 'text', '', 1, '2018-11-10 09:34:05', '2018-11-10 09:34:07');
COMMIT;

-- ----------------------------
-- Table structure for work_custom_foottext
-- ----------------------------
DROP TABLE IF EXISTS `work_custom_foottext`;
CREATE TABLE `work_custom_foottext` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `foot_info` text COMMENT '1|底部标题',
  `foot_title_id` text COMMENT '1|文章标题集',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_custom_foottext
-- ----------------------------
BEGIN;
INSERT INTO `work_custom_foottext` VALUES (1, '111', '222');
COMMIT;

-- ----------------------------
-- Table structure for work_custom_klmko
-- ----------------------------
DROP TABLE IF EXISTS `work_custom_klmko`;
CREATE TABLE `work_custom_klmko` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for work_custom_pclogo
-- ----------------------------
DROP TABLE IF EXISTS `work_custom_pclogo`;
CREATE TABLE `work_custom_pclogo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `img` text COMMENT '2|pc端logo',
  `title` text COMMENT '1|pc端标语',
  `href` text COMMENT '1|首页链接',
  `index_title` text COMMENT '1|首页标语',
  `go_mobile` text COMMENT '1|手机连接名称',
  `title_text` text COMMENT '1|网页名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for work_custom_wanclleetr
-- ----------------------------
DROP TABLE IF EXISTS `work_custom_wanclleetr`;
CREATE TABLE `work_custom_wanclleetr` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `wwwwww` text COMMENT '1|你好d',
  `www` text COMMENT '2|shux',
  `dsdss` text COMMENT '1|4554',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_custom_wanclleetr
-- ----------------------------
BEGIN;
INSERT INTO `work_custom_wanclleetr` VALUES (1, '333', '/public/upload/user_images/20190215/724ec2e2060a1b063530164d8f88cd8d.jpg', NULL);
INSERT INTO `work_custom_wanclleetr` VALUES (2, '434', '/public/upload/user_images/20190215/d011a848db32aba25b018a1144640935.jpg', '344334');
COMMIT;

-- ----------------------------
-- Table structure for work_custom_waplogo
-- ----------------------------
DROP TABLE IF EXISTS `work_custom_waplogo`;
CREATE TABLE `work_custom_waplogo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `logo` text COMMENT '2|logo',
  `login_logo` text COMMENT '2|login_logo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_custom_waplogo
-- ----------------------------
BEGIN;
INSERT INTO `work_custom_waplogo` VALUES (2, '/public/upload/user_images/20180804/bcbf0db623ee45029d73d9c92dcf251d.jpg', '/public/upload/user_images/20180804/3ba49f995d6ed33be4952303b6db986c.jpg');
COMMIT;

-- ----------------------------
-- Table structure for work_dds
-- ----------------------------
DROP TABLE IF EXISTS `work_dds`;
CREATE TABLE `work_dds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '数据字典名称',
  `table_name` varchar(20) NOT NULL COMMENT '数据字典数据表名称',
  `nav_id` bigint(20) DEFAULT NULL,
  `intro` text COMMENT '数据字典说明',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_dds
-- ----------------------------
BEGIN;
INSERT INTO `work_dds` VALUES (25, '参数', 'wanclleetr', NULL, '简介', 1, '2019-02-15 11:17:07', '2019-02-15 11:17:07');
INSERT INTO `work_dds` VALUES (26, '分类问题', 'catequestion', NULL, '分类问题', 0, '2019-03-23 13:53:36', '2019-03-23 13:53:59');
COMMIT;

-- ----------------------------
-- Table structure for work_feedbacks
-- ----------------------------
DROP TABLE IF EXISTS `work_feedbacks`;
CREATE TABLE `work_feedbacks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '反馈的标题',
  `content` text COMMENT '反馈的详细说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：预留字段',
  `is_deal` tinyint(1) DEFAULT '0' COMMENT '是否处理：0未处理1已处理',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_feedbacks
-- ----------------------------
BEGIN;
INSERT INTO `work_feedbacks` VALUES (1, 4, NULL, NULL, '功能改进', '吧', 1, 0, 1, '2018-11-13 14:47:43', '2018-11-13 14:47:43');
INSERT INTO `work_feedbacks` VALUES (2, 2, NULL, NULL, '功能异常', 'd', 1, 0, 1, '2018-11-14 00:20:35', '2018-11-14 00:20:35');
INSERT INTO `work_feedbacks` VALUES (3, 2, NULL, NULL, '功能异常', 'ms', 1, 0, 1, '2018-11-14 00:24:26', '2018-11-14 00:24:26');
INSERT INTO `work_feedbacks` VALUES (4, 2, NULL, NULL, '功能改进', 'mjcuilxcc', 1, 0, 1, '2018-11-14 00:25:55', '2018-11-14 00:25:55');
INSERT INTO `work_feedbacks` VALUES (5, 2, NULL, NULL, '功能异常', 'n！', 1, 0, 1, '2018-11-14 00:26:19', '2018-11-14 00:26:19');
INSERT INTO `work_feedbacks` VALUES (6, 2, NULL, NULL, '功能异常', '60', 1, 0, 1, '2018-11-14 00:28:23', '2018-11-14 00:28:23');
INSERT INTO `work_feedbacks` VALUES (7, 49, NULL, NULL, '功能改进', '123', 1, 0, 1, '2018-12-03 14:34:52', '2018-12-03 14:34:52');
INSERT INTO `work_feedbacks` VALUES (8, 49, NULL, NULL, '功能异常', '123', 1, 0, 1, '2018-12-03 14:36:25', '2018-12-03 14:36:25');
INSERT INTO `work_feedbacks` VALUES (9, 49, NULL, NULL, '功能异常', '123\n测试', 1, 1, 1, '2018-12-03 14:37:35', '2019-01-25 16:28:06');
INSERT INTO `work_feedbacks` VALUES (10, 64, NULL, NULL, '功能异常', '测试', 1, 0, 1, '2019-02-25 17:47:23', '2019-02-25 17:47:23');
INSERT INTO `work_feedbacks` VALUES (11, 64, NULL, NULL, '功能异常', '测试', 1, 1, 1, '2019-02-25 17:47:25', '2019-02-25 17:53:21');
COMMIT;

-- ----------------------------
-- Table structure for work_freight_templates
-- ----------------------------
DROP TABLE IF EXISTS `work_freight_templates`;
CREATE TABLE `work_freight_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品运费模板名称',
  `intro` text COMMENT '商品运费模板简介',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '计费方式：1重量2数量',
  `basic_value` decimal(10,2) unsigned NOT NULL COMMENT '基本值',
  `basic_price` decimal(10,2) unsigned NOT NULL COMMENT '基本价格',
  `add_value` decimal(10,2) unsigned NOT NULL COMMENT '增加值',
  `add_price` decimal(10,2) unsigned NOT NULL COMMENT '增加价格',
  `content` text COMMENT '其它特殊地区内容',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '商品规格模板排序',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_freight_templates
-- ----------------------------
BEGIN;
INSERT INTO `work_freight_templates` VALUES (1, '运费模板', '', 2, 1.00, 10.00, 1.00, 1.00, '[]', 0, 1, '2018-07-24 11:26:54', '2018-07-24 11:26:54');
INSERT INTO `work_freight_templates` VALUES (2, '模板一', '', 1, 10.00, 10.00, 10.00, 10.00, '[{\"basic_value\":\"10\",\"basic_price\":\"10\",\"add_value\":\"10\",\"add_price\":\"10\",\"area_codes\":[\"540000\",\"540100\",\"540101\",\"540102\",\"540103\",\"540121\",\"540122\",\"540123\",\"540124\",\"540126\",\"540127\",\"540200\",\"540202\",\"540221\",\"540222\",\"540223\",\"540224\",\"540225\",\"540226\",\"540227\",\"540228\",\"540229\",\"540230\",\"540231\",\"540232\",\"540233\",\"540234\",\"540235\",\"540236\",\"540237\",\"540300\",\"540302\",\"540321\",\"540322\",\"540323\",\"540324\",\"540325\",\"540326\",\"540327\",\"540328\",\"540329\",\"540330\",\"540400\",\"540402\",\"540421\",\"540422\",\"540423\",\"540424\",\"540425\",\"540426\",\"540500\",\"540501\",\"540502\",\"540521\",\"540522\",\"540523\",\"540524\",\"540525\",\"540526\",\"540527\",\"540528\",\"540529\",\"540530\",\"540531\",\"542400\",\"542421\",\"542422\",\"542423\",\"542424\",\"542425\",\"542426\",\"542427\",\"542428\",\"542429\",\"542430\",\"542431\",\"542500\",\"542521\",\"542522\",\"542523\",\"542524\",\"542525\",\"542526\",\"542527\",\"650000\",\"650100\",\"650101\",\"650102\",\"650103\",\"650104\",\"650105\",\"650106\",\"650107\",\"650109\",\"650121\",\"650200\",\"650201\",\"650202\",\"650203\",\"650204\",\"650205\",\"650400\",\"650402\",\"650421\",\"650422\",\"650500\",\"650502\",\"650521\",\"650522\",\"652300\",\"652301\",\"652302\",\"652323\",\"652324\",\"652325\",\"652327\",\"652328\",\"652700\",\"652701\",\"652702\",\"652722\",\"652723\",\"652800\",\"652801\",\"652822\",\"652823\",\"652824\",\"652825\",\"652826\",\"652827\",\"652828\",\"652829\",\"652900\",\"652901\",\"652922\",\"652923\",\"652924\",\"652925\",\"652926\",\"652927\",\"652928\",\"652929\",\"653000\",\"653001\",\"653022\",\"653023\",\"653024\",\"653100\",\"653101\",\"653121\",\"653122\",\"653123\",\"653124\",\"653125\",\"653126\",\"653127\",\"653128\",\"653129\",\"653130\",\"653131\",\"653200\",\"653201\",\"653221\",\"653222\",\"653223\",\"653224\",\"653225\",\"653226\",\"653227\",\"654000\",\"654002\",\"654003\",\"654004\",\"654021\",\"654022\",\"654023\",\"654024\",\"654025\",\"654026\",\"654027\",\"654028\",\"654200\",\"654201\",\"654202\",\"654221\",\"654223\",\"654224\",\"654225\",\"654226\",\"654300\",\"654301\",\"654321\",\"654322\",\"654323\",\"654324\",\"654325\",\"654326\",\"659000\",\"659001\",\"659002\",\"659003\",\"659004\",\"659006\"]}]', 0, 1, '2018-08-15 14:45:45', '2018-08-15 14:45:45');
INSERT INTO `work_freight_templates` VALUES (3, '重量计费', '重量', 1, 2.00, 20.00, 1.00, 10.00, '[]', 0, 1, '2018-08-24 08:00:59', '2018-08-24 08:00:59');
INSERT INTO `work_freight_templates` VALUES (5, '测试模板', '测试模板', 1, 5.00, 50.00, 5000.00, 500.00, '[]', 0, 0, '2018-09-26 17:03:54', '2018-09-26 17:22:48');
INSERT INTO `work_freight_templates` VALUES (4, '1', '1', 1, 1.00, 1.00, 1.00, 1.00, '[]', 0, 0, '2018-09-10 10:11:17', '2018-09-10 10:11:21');
INSERT INTO `work_freight_templates` VALUES (6, '删除模板', '33', 1, 500.00, 50.00, 50.00, 20.00, '[]', 0, 0, '2018-11-26 13:36:00', '2018-11-26 13:40:02');
INSERT INTO `work_freight_templates` VALUES (7, '共同出单', '卖家与买家运费对半', 1, 1.00, 6.00, 2.00, 1.00, '[]', 0, 0, '2019-02-22 11:23:22', '2019-02-22 11:23:48');
INSERT INTO `work_freight_templates` VALUES (8, '按重量计费', '', 1, 2.00, 30.00, 1.00, 20.00, '[]', 0, 1, '2019-02-23 16:58:07', '2019-02-23 16:58:07');
COMMIT;

-- ----------------------------
-- Table structure for work_friendly_links
-- ----------------------------
DROP TABLE IF EXISTS `work_friendly_links`;
CREATE TABLE `work_friendly_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) NOT NULL COMMENT '友情链接类型ID',
  `name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `img` text COMMENT '友情链接图片',
  `alt` varchar(255) DEFAULT NULL COMMENT '友情链接图片alt属性',
  `memo` text COMMENT '友情链接备注',
  `position` varchar(50) DEFAULT NULL COMMENT '友情链接显示位置',
  `href` text COMMENT '链接',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `is_open_model` tinyint(1) DEFAULT '0' COMMENT '开启模型',
  `model` varchar(20) DEFAULT NULL,
  `model_id` bigint(20) DEFAULT NULL COMMENT '模型ID',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_friendly_links
-- ----------------------------
BEGIN;
INSERT INTO `work_friendly_links` VALUES (1, 15, '6', '', '6', NULL, '6', '6', 1, 0, '', 0, 0, '2018-08-27 17:13:37', '2018-09-10 11:40:11');
INSERT INTO `work_friendly_links` VALUES (2, 14, '66', 'http://v4.wx.wygoo.com/public/upload/article_images/20180827/f14838766aee41c9f3556f0716073b72.png', '6', NULL, '6', '6', 1, 1, 'article', 6, 0, '2018-08-27 17:13:52', '2018-09-10 11:40:11');
INSERT INTO `work_friendly_links` VALUES (3, 15, '55656', '', '5', NULL, '56', '5', 1, 0, '', 0, 0, '2018-09-14 10:07:45', '2018-09-14 10:08:14');
INSERT INTO `work_friendly_links` VALUES (4, 14, '655656', '', '6556', NULL, '56', '566', 1, 0, '', 0, 0, '2018-09-14 10:07:55', '2018-09-14 10:08:12');
COMMIT;

-- ----------------------------
-- Table structure for work_goods_cates
-- ----------------------------
DROP TABLE IF EXISTS `work_goods_cates`;
CREATE TABLE `work_goods_cates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `thum` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `pid` bigint(20) DEFAULT '0' COMMENT '父分类ID',
  `sort` int(11) DEFAULT '0' COMMENT '排序：数值越大越靠前',
  `status` tinyint(4) DEFAULT '1' COMMENT '1正常2禁用',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_goods_cates
-- ----------------------------
BEGIN;
INSERT INTO `work_goods_cates` VALUES (58, '家具效果', '', 49, 0, 1, 1, '2019-03-28 19:53:20', '2019-03-28 19:53:20');
INSERT INTO `work_goods_cates` VALUES (56, '瓷砖效果', '', 51, 0, 1, 1, '2019-03-28 19:52:47', '2019-03-28 19:52:47');
INSERT INTO `work_goods_cates` VALUES (57, '木地板效果', '', 50, 0, 1, 1, '2019-03-28 19:53:02', '2019-03-28 19:53:02');
INSERT INTO `work_goods_cates` VALUES (55, '室内效果', '', 52, 0, 1, 1, '2019-03-28 19:52:23', '2019-03-28 19:52:23');
INSERT INTO `work_goods_cates` VALUES (54, '瓷砖效果', '', 48, 0, 1, 1, '2019-03-20 19:07:37', '2019-03-20 19:07:37');
INSERT INTO `work_goods_cates` VALUES (53, '室内效果', '', 48, 0, 1, 1, '2019-03-20 19:07:23', '2019-03-20 19:07:23');
INSERT INTO `work_goods_cates` VALUES (51, '上门清洁', '/public/upload/goods_images/20190328/323b3e9abbbb712f0b39deefe2876a2a.png', 0, 0, 1, 1, '2019-03-20 19:06:59', '2019-03-20 19:06:59');
INSERT INTO `work_goods_cates` VALUES (52, '人才招聘', '/public/upload/goods_images/20190328/22c534a9551a316184f56449c59c4805.png', 0, 0, 1, 1, '2019-03-20 19:07:09', '2019-03-20 19:07:09');
INSERT INTO `work_goods_cates` VALUES (50, '上门维修', '/public/upload/goods_images/20190328/81f7dd75711c123153b5ebb31dddce04.png', 0, 0, 1, 1, '2019-03-20 19:06:50', '2019-03-20 19:06:50');
INSERT INTO `work_goods_cates` VALUES (49, '上门安装', '/public/upload/goods_images/20190328/25c5495e1528042d40542401ca50fce0.png', 0, 0, 1, 1, '2019-03-20 19:06:39', '2019-03-20 19:06:39');
INSERT INTO `work_goods_cates` VALUES (48, '施工图', '/public/upload/goods_images/20190328/774c537a1d02804536916c11ce4eeaae.png', 0, 0, 1, 1, '2019-03-20 19:06:27', '2019-03-20 19:06:27');
INSERT INTO `work_goods_cates` VALUES (47, '效果图', '/public/upload/goods_images/20190328/4a07d50550461afa6dacd0a800053f67.png', 0, 0, 1, 1, '2019-03-20 19:06:18', '2019-03-20 19:06:18');
COMMIT;

-- ----------------------------
-- Table structure for work_group_buy_teams
-- ----------------------------
DROP TABLE IF EXISTS `work_group_buy_teams`;
CREATE TABLE `work_group_buy_teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_buy_type` tinyint(1) NOT NULL COMMENT '拼团模式:1系统拼团2会员拼团',
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `group_buy_order_pid` bigint(20) DEFAULT '0' COMMENT '发起拼团的订单ID',
  `begin_time` datetime DEFAULT NULL COMMENT '购买的商品ID',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `person_num` int(11) unsigned NOT NULL DEFAULT '2' COMMENT '团购人数',
  `info` text COMMENT '当前团的信息',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1待拼团2团已结束3拼团完成',
  `end_team_time` datetime DEFAULT NULL COMMENT '结束拼团时间',
  `end_team_type` tinyint(1) DEFAULT '1' COMMENT '结束拼团类别:1未结束2未完成拼团到期结束3完成拼团结束',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_group_buy_teams
-- ----------------------------
BEGIN;
INSERT INTO `work_group_buy_teams` VALUES (1, 2, 21, 15, '2018-11-10 15:26:17', '2018-11-10 20:26:17', 3, '[{\"user_id\":2,\"order_id\":15}]', 0, 2, '2018-11-12 09:23:28', 2, 1, '2018-11-10 15:26:17', '2018-11-12 09:23:28');
INSERT INTO `work_group_buy_teams` VALUES (2, 2, 23, 65, '2018-11-12 09:24:16', '2018-11-12 19:24:16', 10, '[{\"user_id\":2,\"order_id\":65}]', 0, 2, '2018-11-14 10:20:16', 2, 1, '2018-11-12 09:24:16', '2018-11-14 10:20:16');
INSERT INTO `work_group_buy_teams` VALUES (3, 2, 23, 88, '2018-11-12 17:53:56', '2018-11-13 03:53:56', 10, '[{\"user_id\":2,\"order_id\":88}]', 0, 2, '2018-11-14 10:20:16', 2, 1, '2018-11-12 17:53:56', '2018-11-14 10:20:16');
INSERT INTO `work_group_buy_teams` VALUES (4, 2, 23, 105, '2018-11-17 09:32:28', '2018-11-17 19:32:28', 10, '[{\"user_id\":4,\"order_id\":105}]', 0, 2, '2018-11-19 11:41:50', 2, 1, '2018-11-17 09:32:28', '2018-11-19 11:41:50');
INSERT INTO `work_group_buy_teams` VALUES (5, 2, 23, 106, '2018-11-17 09:52:58', '2018-11-17 19:52:58', 10, '[{\"user_id\":1,\"order_id\":106}]', 0, 2, '2018-11-19 11:41:50', 2, 1, '2018-11-17 09:52:58', '2018-11-19 11:41:50');
INSERT INTO `work_group_buy_teams` VALUES (6, 2, 23, 109, '2018-11-17 14:29:20', '2018-11-18 00:29:20', 10, '[{\"user_id\":1,\"order_id\":109}]', 0, 2, '2018-11-19 11:41:50', 2, 1, '2018-11-17 14:29:20', '2018-11-19 11:41:50');
INSERT INTO `work_group_buy_teams` VALUES (7, 2, 23, 111, '2018-11-17 14:31:19', '2018-11-18 00:31:19', 10, '[{\"user_id\":1,\"order_id\":111}]', 0, 2, '2018-11-19 11:41:50', 2, 1, '2018-11-17 14:31:19', '2018-11-19 11:41:50');
INSERT INTO `work_group_buy_teams` VALUES (8, 2, 23, 112, '2018-11-17 14:32:05', '2018-11-18 00:32:05', 10, '[{\"user_id\":1,\"order_id\":112}]', 0, 2, '2018-11-19 11:41:50', 2, 1, '2018-11-17 14:32:05', '2018-11-19 11:41:50');
INSERT INTO `work_group_buy_teams` VALUES (9, 2, 23, 116, '2018-11-17 14:40:39', '2018-11-18 00:40:39', 10, '[{\"user_id\":1,\"order_id\":116}]', 0, 2, '2018-11-19 11:41:50', 2, 1, '2018-11-17 14:40:39', '2018-11-19 11:41:50');
INSERT INTO `work_group_buy_teams` VALUES (10, 2, 23, 117, '2018-11-17 14:41:36', '2018-11-18 00:41:36', 10, '[{\"user_id\":1,\"order_id\":117}]', 0, 2, '2018-11-19 11:41:50', 2, 1, '2018-11-17 14:41:36', '2018-11-19 11:41:50');
INSERT INTO `work_group_buy_teams` VALUES (11, 2, 23, 115, '2018-11-17 14:41:45', '2018-11-18 00:41:45', 10, '[{\"user_id\":1,\"order_id\":115}]', 0, 2, '2018-11-19 11:41:50', 2, 1, '2018-11-17 14:41:45', '2018-11-19 11:41:50');
INSERT INTO `work_group_buy_teams` VALUES (12, 2, 23, 114, '2018-11-17 14:42:26', '2018-11-18 00:42:26', 10, '[{\"user_id\":1,\"order_id\":114}]', 0, 2, '2018-11-19 11:41:50', 2, 1, '2018-11-17 14:42:26', '2018-11-19 11:41:50');
INSERT INTO `work_group_buy_teams` VALUES (13, 2, 23, 120, '2018-11-17 15:35:27', '2018-11-18 01:35:27', 10, '[{\"user_id\":17,\"order_id\":120},{\"user_id\":4,\"order_id\":129}]', 0, 2, '2018-11-19 11:41:50', 2, 1, '2018-11-17 15:35:27', '2018-11-19 11:41:50');
INSERT INTO `work_group_buy_teams` VALUES (14, 2, 23, 132, '2018-11-19 11:58:47', '2018-11-19 21:58:47', 10, '[{\"user_id\":13,\"order_id\":132}]', 0, 2, '2018-11-20 09:50:15', 2, 1, '2018-11-19 11:58:47', '2018-11-20 09:50:15');
INSERT INTO `work_group_buy_teams` VALUES (15, 2, 23, 133, '2018-11-19 13:36:22', '2018-11-19 23:36:22', 10, '[{\"user_id\":13,\"order_id\":133}]', 0, 2, '2018-11-20 09:50:15', 2, 1, '2018-11-19 13:36:22', '2018-11-20 09:50:15');
INSERT INTO `work_group_buy_teams` VALUES (16, 2, 23, 137, '2018-11-19 14:57:18', '2018-11-20 00:57:18', 10, '[{\"user_id\":17,\"order_id\":137}]', 0, 2, '2018-11-20 09:50:15', 2, 1, '2018-11-19 14:57:18', '2018-11-20 09:50:15');
INSERT INTO `work_group_buy_teams` VALUES (17, 2, 23, 147, '2018-11-20 09:50:41', '2018-11-20 19:50:41', 10, '[{\"user_id\":2,\"order_id\":147}]', 0, 2, '2018-11-22 11:15:26', 2, 1, '2018-11-20 09:50:41', '2018-11-22 11:15:26');
INSERT INTO `work_group_buy_teams` VALUES (18, 2, 23, 151, '2018-11-20 10:24:16', '2018-11-20 20:24:16', 10, '[{\"user_id\":2,\"order_id\":151}]', 0, 2, '2018-11-22 11:15:26', 2, 1, '2018-11-20 10:24:16', '2018-11-22 11:15:26');
INSERT INTO `work_group_buy_teams` VALUES (19, 2, 23, 153, '2018-11-20 10:31:14', '2018-11-20 20:31:14', 10, '[{\"user_id\":2,\"order_id\":153}]', 0, 2, '2018-11-22 11:15:26', 2, 1, '2018-11-20 10:31:14', '2018-11-22 11:15:26');
INSERT INTO `work_group_buy_teams` VALUES (20, 2, 22, 239, '2018-11-26 09:48:15', '2018-11-27 09:48:15', 5, '[{\"user_id\":2,\"order_id\":239}]', 0, 2, '2018-11-28 14:50:16', 2, 1, '2018-11-26 09:48:15', '2018-11-28 14:50:16');
INSERT INTO `work_group_buy_teams` VALUES (21, 2, 22, 250, '2018-11-28 14:50:53', '2018-11-29 14:50:53', 5, '[{\"user_id\":4,\"order_id\":250},{\"user_id\":17,\"order_id\":251}]', 0, 2, '2018-11-29 16:23:29', 2, 1, '2018-11-28 14:50:53', '2018-11-29 16:23:29');
INSERT INTO `work_group_buy_teams` VALUES (22, 2, 23, 271, '2018-12-03 09:12:27', '2018-12-04 05:12:27', 20, '[{\"user_id\":48,\"order_id\":271}]', 0, 2, '2018-12-04 09:15:22', 2, 1, '2018-12-03 09:12:27', '2018-12-04 09:15:22');
INSERT INTO `work_group_buy_teams` VALUES (23, 2, 20, 284, '2018-12-03 17:41:43', '2018-12-03 18:41:43', 2, '[{\"user_id\":2,\"order_id\":284}]', 0, 2, '2018-12-03 18:44:38', 2, 1, '2018-12-03 17:41:43', '2018-12-03 18:44:38');
INSERT INTO `work_group_buy_teams` VALUES (24, 2, 20, 285, '2018-12-03 18:52:48', '2018-12-03 19:52:48', 2, '[{\"user_id\":9,\"order_id\":285}]', 0, 2, '2018-12-04 09:15:22', 2, 1, '2018-12-03 18:52:49', '2018-12-04 09:15:22');
INSERT INTO `work_group_buy_teams` VALUES (25, 2, 21, 286, '2018-12-03 18:55:05', '2018-12-03 20:55:05', 2, '[{\"user_id\":9,\"order_id\":286},{\"user_id\":2,\"order_id\":287}]', 0, 3, '2018-12-03 18:55:45', 3, 1, '2018-12-03 18:55:05', '2018-12-03 18:55:45');
INSERT INTO `work_group_buy_teams` VALUES (26, 2, 21, 293, '2018-12-04 09:15:55', '2018-12-04 11:15:55', 2, '[{\"user_id\":2,\"order_id\":293}]', 0, 2, '2018-12-04 20:36:32', 2, 1, '2018-12-04 09:15:55', '2018-12-04 20:36:32');
INSERT INTO `work_group_buy_teams` VALUES (27, 2, 41, 332, '2018-12-05 14:37:35', '2018-12-05 16:37:35', 2, '[{\"user_id\":49,\"order_id\":332}]', 0, 2, '2018-12-06 12:13:45', 2, 1, '2018-12-05 14:37:35', '2018-12-06 12:13:45');
INSERT INTO `work_group_buy_teams` VALUES (28, 2, 79, 333, '2018-12-06 16:00:30', '2018-12-06 18:00:30', 2, '[{\"user_id\":49,\"order_id\":333}]', 0, 2, '2018-12-06 18:34:00', 2, 1, '2018-12-06 16:00:30', '2018-12-06 18:34:00');
INSERT INTO `work_group_buy_teams` VALUES (29, 2, 85, 335, '2018-12-07 09:33:04', '2018-12-07 11:33:04', 2, '[{\"user_id\":49,\"order_id\":335}]', 0, 2, '2019-01-22 14:09:41', 2, 1, '2018-12-07 09:33:04', '2019-01-22 14:09:41');
INSERT INTO `work_group_buy_teams` VALUES (30, 2, 85, 349, '2019-02-11 11:51:35', '2019-02-11 13:51:35', 2, '[{\"user_id\":17,\"order_id\":349}]', 0, 2, '2019-02-13 14:27:58', 2, 1, '2019-02-11 11:51:36', '2019-02-13 14:27:58');
INSERT INTO `work_group_buy_teams` VALUES (31, 2, 85, 364, '2019-02-22 15:53:33', '2019-02-22 17:53:33', 2, '[{\"user_id\":2,\"order_id\":364}]', 0, 2, '2019-02-23 00:10:47', 2, 1, '2019-02-22 15:53:33', '2019-02-23 00:10:47');
INSERT INTO `work_group_buy_teams` VALUES (32, 2, 79, 370, '2019-02-23 09:53:30', '2019-02-23 11:53:30', 2, '[{\"user_id\":2,\"order_id\":370}]', 0, 2, '2019-02-23 15:14:06', 2, 1, '2019-02-23 09:53:30', '2019-02-23 15:14:06');
INSERT INTO `work_group_buy_teams` VALUES (33, 2, 101, 385, '2019-02-26 10:53:41', '2019-02-27 10:53:41', 3, '[{\"user_id\":65,\"order_id\":385}]', 0, 1, NULL, 1, 1, '2019-02-26 10:53:41', '2019-02-26 10:53:41');
INSERT INTO `work_group_buy_teams` VALUES (34, 2, 101, 386, '2019-02-26 11:05:00', '2019-02-27 11:05:00', 3, '[{\"user_id\":64,\"order_id\":386}]', 0, 1, NULL, 1, 1, '2019-02-26 11:05:00', '2019-02-26 11:05:00');
COMMIT;

-- ----------------------------
-- Table structure for work_guides
-- ----------------------------
DROP TABLE IF EXISTS `work_guides`;
CREATE TABLE `work_guides` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) NOT NULL COMMENT '指导手册类别ID',
  `title` varchar(100) NOT NULL COMMENT '指导手册标题',
  `thum` varchar(255) DEFAULT NULL COMMENT '指导手册缩略图',
  `intro` varchar(255) DEFAULT NULL COMMENT '指导手册摘要',
  `content` text COMMENT '指导手册详细内容',
  `author` varchar(50) DEFAULT NULL COMMENT '指导手册作者',
  `imgs` text COMMENT '图片集',
  `audio_url` text COMMENT '音频链接',
  `video_url` text COMMENT '视频链接',
  `click_num` bigint(20) DEFAULT '0' COMMENT '文章的点击量',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_guides
-- ----------------------------
BEGIN;
INSERT INTO `work_guides` VALUES (1, 22, '方式发', '/public/upload/article_images/20180630\\af71e469697a4aa92543cff5eeba1823.png', 'dfa', '<p>的说法打法</p>', 'fsdf ', '[]', '', '', 0, 1, 1, '2018-06-30 11:43:24', '2018-09-10 11:55:45');
INSERT INTO `work_guides` VALUES (2, 23, '1', '', '1', '', '1', '[]', '1', '', 0, 1, 0, '2018-09-10 11:55:21', '2018-09-10 11:56:02');
INSERT INTO `work_guides` VALUES (3, 22, '2', '', '2', '', '2', '[]', '3', '2', 0, 1, 0, '2018-09-10 11:55:28', '2018-09-10 11:56:02');
INSERT INTO `work_guides` VALUES (4, 21, '3', '', '3', '', '3', '[]', '3', '3', 0, 1, 0, '2018-09-10 11:55:37', '2018-09-10 11:56:02');
COMMIT;

-- ----------------------------
-- Table structure for work_jobs
-- ----------------------------
DROP TABLE IF EXISTS `work_jobs`;
CREATE TABLE `work_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL COMMENT '队列名',
  `payload` longtext NOT NULL COMMENT '载入数据',
  `attempts` tinyint(3) unsigned NOT NULL COMMENT '尝试执行任务次数',
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL COMMENT '运行执行的最早时间',
  `created_at` int(10) unsigned NOT NULL COMMENT '任务创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_jobs
-- ----------------------------
BEGIN;
INSERT INTO `work_jobs` VALUES (1, 'TimedTasksQueue', '{\"job\":\"app\\\\job\\\\task\\\\GroupBuyReturnGoods\",\"data\":{\"token\":\"5b50a120cf984\"}}', 0, 0, NULL, 1532044800, 1532010784);
COMMIT;

-- ----------------------------
-- Table structure for work_jpush_devices
-- ----------------------------
DROP TABLE IF EXISTS `work_jpush_devices`;
CREATE TABLE `work_jpush_devices` (
  `device_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '设备号',
  `type` varchar(10) NOT NULL COMMENT '值为ios || android',
  `account_id` bigint(20) unsigned NOT NULL,
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`device_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for work_market_activities
-- ----------------------------
DROP TABLE IF EXISTS `work_market_activities`;
CREATE TABLE `work_market_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL COMMENT '活动类别',
  `name` varchar(255) NOT NULL COMMENT '活动名称',
  `thum` varchar(255) DEFAULT NULL COMMENT '活动缩略图',
  `imgs` text COMMENT '活动图集',
  `intro` text COMMENT '活动简介',
  `content` text COMMENT '活动内容',
  `begin_time` datetime NOT NULL COMMENT '活动开始时间',
  `end_time` datetime NOT NULL COMMENT '活动结束时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_market_activities
-- ----------------------------
BEGIN;
INSERT INTO `work_market_activities` VALUES (2, 'coupon', '优惠券活动', '/public/upload/user_images/20180926/c851fbc3b215ee0d5bad04d10e21be48.jpg', '[\"\\/public\\/upload\\/user_images\\/20180926\\/902486c07a5d32cd29d49988f852a4ed.jpg\"]', '3', '', '2018-08-24 00:00:00', '2019-07-06 00:00:00', 1, 0, '2018-08-24 13:57:41', '2018-11-21 10:49:41');
INSERT INTO `work_market_activities` VALUES (3, 'full', '满减活动', '/public/upload/user_images/20180926/673c9608e5d1ba5ce08828501d0f1c18.jpg', '[\"\\/public\\/upload\\/user_images\\/20180926\\/d68dd0cfbfb52b3ec86752e56d3f187a.jpg\"]', '满减活动', '', '2018-08-24 00:00:00', '2018-09-30 00:00:00', 1, 0, '2018-08-24 13:58:53', '2018-10-06 09:19:30');
INSERT INTO `work_market_activities` VALUES (4, 'full', '满减活动2', '/public/upload/user_images/20180926/f830c4e18e2b7fa3c864392666e804c9.jpg', '[\"\\/public\\/upload\\/user_images\\/20180926\\/caaddd5d80f128c2e1068b944d9f7c51.jpg\"]', '33', '', '2018-08-27 00:00:00', '2018-09-30 00:00:00', 1, 0, '2018-08-27 18:10:59', '2018-10-06 09:19:27');
INSERT INTO `work_market_activities` VALUES (5, 'coupon', '优惠券活动2', '/public/upload/user_images/20180926/150909468247dc22cd3500ea9dbcf143.jpg', '[\"\\/public\\/upload\\/user_images\\/20180926\\/1c61b9718b86c1750c616e6239c325ee.jpg\"]', '优惠券活动2', '', '2018-08-28 00:00:00', '2018-11-30 00:00:00', 1, 0, '2018-08-27 18:11:39', '2018-11-21 10:49:22');
INSERT INTO `work_market_activities` VALUES (7, 'coupon', '1', '/public/upload/user_images/20180903/7c6881e625d1c2cef03421ac139698eb.jpg', '[]', '1', '', '2018-09-03 00:00:00', '2018-09-30 00:00:00', 1, 0, '2018-09-03 10:32:14', '2018-09-10 10:21:31');
INSERT INTO `work_market_activities` VALUES (8, 'coupon', '2', '/public/upload/user_images/20180903/79c3483fb4398becbf9372cfcf610c28.jpg', '[]', '2', '', '2018-09-03 00:00:00', '2018-09-29 00:00:00', 1, 0, '2018-09-03 10:32:30', '2018-09-10 10:21:31');
INSERT INTO `work_market_activities` VALUES (9, 'discount', '345', '/public/upload/user_images/20180914/2c03bde3344352ee9a0e5d922d67106f.png', '[]', '554', '', '2018-09-12 00:00:00', '2018-09-27 00:00:00', 1, 0, '2018-09-14 09:17:10', '2018-09-14 09:17:17');
INSERT INTO `work_market_activities` VALUES (12, 'full', '满减', '', '[]', '', '', '2018-10-06 09:19:42', '2019-01-05 00:00:00', 1, 0, '2018-10-06 09:19:48', '2018-11-21 10:49:22');
INSERT INTO `work_market_activities` VALUES (13, 'discount', '10月折扣商品', '/public/upload/user_images/20181007/eccaeb1dc25aec1b09db61bde3ca04e8.png', '[\"\\/public\\/upload\\/user_images\\/20181007\\/bad0882fb66bf29f202c110f267e6d56.png\"]', '10月限时折扣商品', '', '2018-10-07 14:27:53', '2018-11-30 00:00:00', 1, 0, '2018-10-07 14:27:36', '2018-11-21 10:49:08');
INSERT INTO `work_market_activities` VALUES (10, 'discount', '限时折扣', '', '[]', '', '', '2018-09-29 16:03:10', '2018-11-30 10:45:47', 1, 0, '2018-09-29 16:03:18', '2018-11-21 10:49:08');
INSERT INTO `work_market_activities` VALUES (11, 'full', '营销活动101', '/public/upload/user_images/20180930/3e095c9165953fddee1325fcd5a15cbe.png', '[]', '活动', '', '2018-09-26 00:00:00', '2018-09-12 00:00:00', 2, 0, '2018-09-30 15:25:23', '2018-11-21 10:49:22');
INSERT INTO `work_market_activities` VALUES (14, 'coupon', '优惠券活动', '/public/upload/user_images/20181007/40df265d5df3e08c5e96f0fb6e741d53.png', '[\"\\/public\\/upload\\/user_images\\/20181007\\/bb240b6e83e0f8f05fefe90cd03242a0.png\"]', '10月优惠券活动', '', '2018-10-07 14:32:26', '2018-11-30 00:00:00', 2, 0, '2018-10-07 14:31:59', '2018-12-03 17:01:52');
INSERT INTO `work_market_activities` VALUES (15, 'full', '10月满减活动', '/public/upload/user_images/20181007/3ac6411f40fe0319a2cf11244c1774c7.jpg', '[\"\\/public\\/upload\\/user_images\\/20181007\\/e57af46d7e151ea7625fadd5000d8b13.jpg\"]', '10月满减活动', '', '2018-10-07 14:33:18', '2018-11-29 00:00:00', 1, 0, '2018-10-07 14:32:31', '2018-11-21 10:49:14');
INSERT INTO `work_market_activities` VALUES (16, 'discount', '限时折扣', '', '[]', '限时折扣活动', '', '2018-11-19 00:00:00', '2019-02-14 00:00:00', 2, 0, '2018-11-19 18:24:25', '2019-02-25 17:51:33');
INSERT INTO `work_market_activities` VALUES (17, 'full', '满减优惠', '', '[]', '', '', '2018-11-21 10:49:53', '2018-12-31 00:00:00', 2, 0, '2018-11-21 10:49:58', '2019-02-25 17:51:33');
INSERT INTO `work_market_activities` VALUES (18, 'coupon', '11月优惠券', '', '[]', '饿肚肚', '', '2018-11-26 10:13:43', '2021-11-27 13:13:45', 1, 0, '2018-11-26 10:11:48', '2019-02-25 17:51:33');
INSERT INTO `work_market_activities` VALUES (19, 'full', '满减促销', '', '[]', '', '', '2018-12-03 16:28:39', '2018-12-03 16:29:44', 2, 0, '2018-11-28 14:32:13', '2018-12-03 17:11:26');
INSERT INTO `work_market_activities` VALUES (20, 'discount', '全场5折', '', '[]', '全场5折', '', '2018-12-01 00:00:00', '2022-12-16 00:00:00', 1, 0, '2018-12-01 15:25:06', '2018-12-01 16:18:14');
INSERT INTO `work_market_activities` VALUES (21, 'full', '4545', '', '[]', '4554', '', '2018-12-03 15:56:03', '2018-12-03 16:29:37', 2, 0, '2018-12-03 15:53:50', '2018-12-03 17:01:52');
INSERT INTO `work_market_activities` VALUES (22, 'coupon', '54455', '', '[]', '5454', '', '2018-12-03 16:29:11', '2018-12-03 16:29:23', 2, 0, '2018-12-03 15:54:15', '2018-12-03 17:01:52');
INSERT INTO `work_market_activities` VALUES (23, 'coupon', '1', '', '[]', '1', '', '2018-12-02 16:28:18', '2018-12-31 00:00:00', 1, 0, '2018-12-03 16:28:25', '2018-12-03 16:28:35');
INSERT INTO `work_market_activities` VALUES (24, 'full', '11', '', '[]', '22', '', '2019-02-23 11:20:33', '2019-02-28 00:00:00', 1, 0, '2019-02-23 11:19:00', '2019-02-23 11:19:07');
INSERT INTO `work_market_activities` VALUES (25, 'full', '11', '', '[]', '22', '', '2019-02-23 11:20:33', '2019-02-28 00:00:00', 1, 0, '2019-02-23 11:19:01', '2019-02-25 17:51:33');
INSERT INTO `work_market_activities` VALUES (26, 'discount', 'rrrrr', '/public/upload/user_images/20190224/7e12fc428ba51875ed048d0dd80fa76d.png', '[]', 'yiidsd', '', '2019-02-26 12:06:04', '2019-02-27 00:00:00', 1, 0, '2019-02-24 12:06:26', '2019-02-25 17:51:33');
INSERT INTO `work_market_activities` VALUES (27, 'coupon', '12', '', '[]', '12', '', '2019-02-06 00:00:00', '2019-02-27 00:00:00', 1, 0, '2019-02-25 17:10:22', '2019-02-25 17:51:33');
INSERT INTO `work_market_activities` VALUES (28, 'full', 'ffrreee', '', '[]', '', '', '2019-02-25 17:50:10', '2019-02-26 00:00:00', 1, 0, '2019-02-25 17:45:54', '2019-02-25 17:51:33');
INSERT INTO `work_market_activities` VALUES (29, 'coupon', '2月开年大酬宾', '', '[]', '', '', '2019-02-25 17:52:14', '2019-03-01 00:00:00', 2, 1, '2019-02-25 17:52:23', '2019-02-25 17:52:23');
INSERT INTO `work_market_activities` VALUES (30, 'full', '2月开年大酬宾', '', '[]', '', '', '2019-02-25 17:52:41', '2019-03-01 00:00:00', 2, 1, '2019-02-25 17:52:46', '2019-02-25 17:52:46');
INSERT INTO `work_market_activities` VALUES (31, 'discount', '2月开年大酬宾', '', '[]', '', '', '2019-02-01 00:00:00', '2019-03-01 00:00:00', 2, 1, '2019-02-25 17:53:09', '2019-02-25 17:53:09');
COMMIT;

-- ----------------------------
-- Table structure for work_mobile_msgs
-- ----------------------------
DROP TABLE IF EXISTS `work_mobile_msgs`;
CREATE TABLE `work_mobile_msgs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) NOT NULL COMMENT '手机号',
  `msg` varchar(255) NOT NULL COMMENT '发送的短信内容',
  `code` varchar(255) NOT NULL COMMENT '短信验证码',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '短信发送状态（1发送成功0发送失败）',
  `send_time` datetime NOT NULL COMMENT '短信的发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_mobile_msgs
-- ----------------------------
BEGIN;
INSERT INTO `work_mobile_msgs` VALUES (1, '15675143940', '您的验证码是：651129，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '651129', 0, '2018-11-10 17:38:07');
INSERT INTO `work_mobile_msgs` VALUES (2, '18175974828', '您的验证码是：436819，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '436819', 0, '2018-11-12 11:11:22');
INSERT INTO `work_mobile_msgs` VALUES (3, '18175974828', '您的验证码是：118346，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '118346', 0, '2018-11-12 11:11:29');
INSERT INTO `work_mobile_msgs` VALUES (4, '15084960792', '您的验证码是：809738，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '809738', 0, '2018-11-12 15:07:36');
INSERT INTO `work_mobile_msgs` VALUES (5, '13170308670', '您的验证码是：707008，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '707008', 0, '2018-11-12 16:56:28');
INSERT INTO `work_mobile_msgs` VALUES (6, '13170308670', '您的验证码是：159555，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '159555', 0, '2018-11-12 16:56:30');
INSERT INTO `work_mobile_msgs` VALUES (7, '13170308670', '您的验证码是：652180，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '652180', 0, '2018-11-12 16:56:37');
INSERT INTO `work_mobile_msgs` VALUES (8, '13170308670', '您的验证码是：332978，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '332978', 0, '2018-11-12 16:56:58');
INSERT INTO `work_mobile_msgs` VALUES (9, '13170308670', '您的验证码是：307210，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '307210', 0, '2018-11-12 16:57:34');
INSERT INTO `work_mobile_msgs` VALUES (10, '13170308670', '您的验证码是：960838，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '960838', 0, '2018-11-12 16:58:47');
INSERT INTO `work_mobile_msgs` VALUES (11, '13170308670', '您的验证码是：802337，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '802337', 0, '2018-11-12 16:58:50');
INSERT INTO `work_mobile_msgs` VALUES (12, '13170308670', '您的验证码是：386469，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '386469', 0, '2018-11-12 16:58:52');
INSERT INTO `work_mobile_msgs` VALUES (13, '13787024881', '您的验证码是：668465，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '668465', 1, '2018-11-14 13:59:30');
INSERT INTO `work_mobile_msgs` VALUES (14, '13787024881', '您的验证码是：747872，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '747872', 1, '2018-11-14 13:59:51');
INSERT INTO `work_mobile_msgs` VALUES (15, '18570322162', '您的验证码是：935606，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '935606', 1, '2018-11-16 10:16:29');
INSERT INTO `work_mobile_msgs` VALUES (16, '18570322162', '您的验证码是：316193，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '316193', 1, '2018-11-16 10:17:11');
INSERT INTO `work_mobile_msgs` VALUES (17, '18570322162', '您的验证码是：119159，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '119159', 1, '2018-11-16 10:17:45');
INSERT INTO `work_mobile_msgs` VALUES (18, '15111063940', '您的验证码是：256186，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '256186', 1, '2018-11-17 16:31:37');
INSERT INTO `work_mobile_msgs` VALUES (19, '15111063940', '您的验证码是：657261，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '657261', 1, '2018-11-17 16:31:58');
INSERT INTO `work_mobile_msgs` VALUES (20, '13755195588', '您的验证码是：830962，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '830962', 1, '2018-11-19 12:24:34');
INSERT INTO `work_mobile_msgs` VALUES (21, '15200911999', '您的验证码是：402853，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '402853', 1, '2018-11-19 12:51:13');
INSERT INTO `work_mobile_msgs` VALUES (22, '18670012031', '您的验证码是：353539，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '353539', 1, '2018-11-19 16:27:11');
INSERT INTO `work_mobile_msgs` VALUES (23, '18670012031', '您的验证码是：386207，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '386207', 1, '2018-11-19 16:27:48');
INSERT INTO `work_mobile_msgs` VALUES (24, '13755195588', '您的验证码是：686605，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '686605', 1, '2018-11-20 12:50:53');
INSERT INTO `work_mobile_msgs` VALUES (25, '15071357527', '您的验证码是：969400，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '969400', 1, '2018-11-21 15:09:23');
INSERT INTO `work_mobile_msgs` VALUES (26, '18900734438', '您的验证码是：235839，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '235839', 1, '2018-11-22 10:17:19');
INSERT INTO `work_mobile_msgs` VALUES (27, '18975130026', '您的验证码是：310920，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '310920', 1, '2018-11-23 11:18:25');
INSERT INTO `work_mobile_msgs` VALUES (28, '18676798664', '您的验证码是：510120，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '510120', 0, '2018-11-27 18:25:41');
INSERT INTO `work_mobile_msgs` VALUES (29, '18676798664', '您的验证码是：972093，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '972093', 0, '2018-11-27 18:25:44');
INSERT INTO `work_mobile_msgs` VALUES (30, '18676798664', '您的验证码是：304401，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '304401', 0, '2018-11-27 18:25:59');
INSERT INTO `work_mobile_msgs` VALUES (31, '18676798664', '您的验证码是：931818，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '931818', 0, '2018-11-27 18:26:12');
INSERT INTO `work_mobile_msgs` VALUES (32, '18630135988', '您的验证码是：630728，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '630728', 0, '2018-12-01 14:48:40');
INSERT INTO `work_mobile_msgs` VALUES (33, '18630135988', '您的验证码是：386653，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '386653', 0, '2018-12-01 14:49:19');
INSERT INTO `work_mobile_msgs` VALUES (34, '18630135988', '您的验证码是：668327，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '668327', 0, '2018-12-01 14:59:33');
INSERT INTO `work_mobile_msgs` VALUES (35, '18630135988', '您的验证码是：346556，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '346556', 0, '2018-12-01 14:59:49');
INSERT INTO `work_mobile_msgs` VALUES (36, '18630135988', '您的验证码是：229958，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '229958', 0, '2018-12-01 14:59:53');
INSERT INTO `work_mobile_msgs` VALUES (37, '18630135988', '您的验证码是：149328，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '149328', 0, '2018-12-01 14:59:59');
INSERT INTO `work_mobile_msgs` VALUES (38, '18630135988', '您的验证码是：884131，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '884131', 0, '2018-12-01 15:00:03');
INSERT INTO `work_mobile_msgs` VALUES (39, '18630135988', '您的验证码是：209038，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '209038', 0, '2018-12-01 15:01:02');
INSERT INTO `work_mobile_msgs` VALUES (40, '18630135988', '您的验证码是：377537，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '377537', 0, '2018-12-01 15:01:10');
INSERT INTO `work_mobile_msgs` VALUES (41, '18630135988', '您的验证码是：348585，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '348585', 0, '2018-12-01 15:01:14');
INSERT INTO `work_mobile_msgs` VALUES (42, '18630135988', '您的验证码是：264887，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '264887', 0, '2018-12-01 15:01:17');
INSERT INTO `work_mobile_msgs` VALUES (43, '18676798664', '您的验证码是：211230，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '211230', 0, '2018-12-01 15:17:23');
INSERT INTO `work_mobile_msgs` VALUES (44, '18676798664', '您的验证码是：864218，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '864218', 0, '2018-12-01 15:17:25');
INSERT INTO `work_mobile_msgs` VALUES (45, '18676798664', '您的验证码是：194440，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '194440', 0, '2018-12-01 15:17:28');
INSERT INTO `work_mobile_msgs` VALUES (46, '18676798664', '您的验证码是：721305，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '721305', 0, '2018-12-01 15:17:32');
INSERT INTO `work_mobile_msgs` VALUES (47, '18676798664', '您的验证码是：897052，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '897052', 0, '2018-12-01 15:17:42');
INSERT INTO `work_mobile_msgs` VALUES (48, '18676798664', '您的验证码是：235242，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '235242', 0, '2018-12-01 15:17:47');
INSERT INTO `work_mobile_msgs` VALUES (49, '17692652658', '您的验证码是：511424，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '511424', 0, '2018-12-03 12:42:55');
INSERT INTO `work_mobile_msgs` VALUES (50, '17692652658', '您的验证码是：896778，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '896778', 0, '2018-12-03 12:42:55');
INSERT INTO `work_mobile_msgs` VALUES (51, '15527507613', '您的验证码是：741136，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '741136', 0, '2018-12-03 13:41:46');
INSERT INTO `work_mobile_msgs` VALUES (52, '15527507613', '您的验证码是：478380，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '478380', 0, '2018-12-03 13:41:59');
INSERT INTO `work_mobile_msgs` VALUES (53, '15527507613', '您的验证码是：881348，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '881348', 0, '2018-12-03 13:42:05');
INSERT INTO `work_mobile_msgs` VALUES (54, '15527507613', '您的验证码是：930030，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '930030', 0, '2018-12-03 13:42:08');
INSERT INTO `work_mobile_msgs` VALUES (55, '15527507613', '您的验证码是：663139，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '663139', 0, '2018-12-03 13:47:16');
INSERT INTO `work_mobile_msgs` VALUES (56, '15527507613', '您的验证码是：360198，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '360198', 0, '2018-12-03 14:29:28');
INSERT INTO `work_mobile_msgs` VALUES (57, '15527507613', '您的验证码是：325909，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '325909', 0, '2018-12-03 14:29:59');
INSERT INTO `work_mobile_msgs` VALUES (58, '13676214636', '您的验证码是：200246，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '200246', 0, '2018-12-03 18:07:01');
INSERT INTO `work_mobile_msgs` VALUES (59, '13676214636', '您的验证码是：409226，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '409226', 0, '2018-12-03 18:09:30');
INSERT INTO `work_mobile_msgs` VALUES (60, '13676214636', '您的验证码是：867079，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '867079', 0, '2018-12-03 18:09:37');
INSERT INTO `work_mobile_msgs` VALUES (61, '13676214636', '您的验证码是：392774，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '392774', 0, '2018-12-03 18:09:48');
INSERT INTO `work_mobile_msgs` VALUES (62, '18166198431', '您的验证码是：414780，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '414780', 0, '2018-12-05 09:50:26');
INSERT INTO `work_mobile_msgs` VALUES (63, '18166198431', '您的验证码是：639987，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '639987', 0, '2018-12-05 09:50:28');
INSERT INTO `work_mobile_msgs` VALUES (64, '13787024881', '您的验证码是：288655，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '288655', 0, '2018-12-05 14:04:17');
INSERT INTO `work_mobile_msgs` VALUES (65, '18975130026', '您的验证码是：757945，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '757945', 0, '2018-12-05 18:59:29');
INSERT INTO `work_mobile_msgs` VALUES (66, '18975130026', '您的验证码是：980980，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '980980', 0, '2018-12-05 18:59:32');
INSERT INTO `work_mobile_msgs` VALUES (67, '18975130026', '您的验证码是：356249，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '356249', 0, '2018-12-05 18:59:49');
INSERT INTO `work_mobile_msgs` VALUES (68, '15273967010', '您的验证码是：314025，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '314025', 0, '2018-12-05 20:23:22');
INSERT INTO `work_mobile_msgs` VALUES (69, '16666666666', '您的验证码是：128892，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '128892', 0, '2018-12-06 11:28:52');
INSERT INTO `work_mobile_msgs` VALUES (70, '15273060636', '您的验证码是：279112，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '279112', 0, '2018-12-06 20:07:21');
INSERT INTO `work_mobile_msgs` VALUES (71, '15273060636', '您的验证码是：912408，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '912408', 0, '2018-12-06 20:07:26');
INSERT INTO `work_mobile_msgs` VALUES (72, '15273060636', '您的验证码是：718346，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '718346', 0, '2018-12-06 20:07:30');
INSERT INTO `work_mobile_msgs` VALUES (73, '18075157349', '您的验证码是：210658，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '210658', 0, '2019-01-23 08:50:28');
INSERT INTO `work_mobile_msgs` VALUES (74, '18630135988', '您的验证码是：948110，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '948110', 0, '2019-01-24 09:37:47');
INSERT INTO `work_mobile_msgs` VALUES (75, '18676798664', '您的验证码是：512104，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '512104', 0, '2019-01-24 10:11:25');
INSERT INTO `work_mobile_msgs` VALUES (76, '12345678911', '您的验证码是：645407，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '645407', 0, '2019-01-24 14:57:51');
INSERT INTO `work_mobile_msgs` VALUES (77, '15084960792', '您的验证码是：500466，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '500466', 0, '2019-01-28 17:39:43');
INSERT INTO `work_mobile_msgs` VALUES (78, '15073689110', '您的验证码是：841457，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '841457', 0, '2019-02-11 11:33:18');
INSERT INTO `work_mobile_msgs` VALUES (79, '13974889410', '您的验证码是：499702，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '499702', 0, '2019-02-22 11:23:10');
INSERT INTO `work_mobile_msgs` VALUES (80, '13974889410', '您的验证码是：722567，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '722567', 0, '2019-02-22 11:23:13');
INSERT INTO `work_mobile_msgs` VALUES (81, '18229860977', '您的验证码是：224167，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '224167', 0, '2019-02-22 11:25:53');
INSERT INTO `work_mobile_msgs` VALUES (82, '16797271921', '您的验证码是：157499，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '157499', 0, '2019-02-23 16:37:17');
COMMIT;

-- ----------------------------
-- Table structure for work_navs
-- ----------------------------
DROP TABLE IF EXISTS `work_navs`;
CREATE TABLE `work_navs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '目录名称',
  `thum` varchar(255) DEFAULT NULL COMMENT '类目的缩略图',
  `icon` varchar(255) DEFAULT NULL COMMENT 'icon图标',
  `module` varchar(255) NOT NULL COMMENT '模块名',
  `class` varchar(255) NOT NULL COMMENT '类名',
  `method` varchar(255) NOT NULL COMMENT '方法名',
  `params` varchar(255) DEFAULT NULL COMMENT '其他参数',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `pid` bigint(20) unsigned DEFAULT '0' COMMENT '父分类目录',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '是否置顶：0否1是',
  `status` tinyint(1) DEFAULT '1' COMMENT '菜单状态：1显示2隐藏',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_navs
-- ----------------------------
BEGIN;
INSERT INTO `work_navs` VALUES (1, '人事管理', '', 'icon-account', '', '', '', '', 900, 0, 0, 1, 1, '2017-12-06 15:06:14', '2018-04-02 15:46:53');
INSERT INTO `work_navs` VALUES (2, '部门人员', '', '', 'admin', 'users', 'index', '', 100, 1, 0, 1, 1, '2017-12-06 15:11:57', '2017-12-29 09:34:45');
INSERT INTO `work_navs` VALUES (29, '管理员列表', '', '', 'admin', 'system', 'admins', '', 20, 22, 0, 1, 1, '2017-12-11 20:56:47', '2017-12-19 08:55:41');
INSERT INTO `work_navs` VALUES (112, '会员认证', '', '', 'admin', 'users', 'user_auths', '', 90, 1, 0, 1, 1, '2018-04-08 17:33:31', '2018-04-08 17:33:31');
INSERT INTO `work_navs` VALUES (33, '会员访问日志', '', '', 'admin', 'users', 'user_visit_logs', '', 10, 1, 0, 1, 1, '2017-12-12 09:21:44', '2017-12-29 09:35:01');
INSERT INTO `work_navs` VALUES (34, '自定义模型', '', '', 'admin', 'system', 'dds', '', 12, 22, 0, 1, 1, '2017-12-12 20:19:06', '2018-03-10 09:58:18');
INSERT INTO `work_navs` VALUES (18, '关于我们', '', '', 'admin', 'content', 'articles', '', 200, 37, 0, 1, 1, '2017-12-06 15:23:47', '2017-12-16 10:09:53');
INSERT INTO `work_navs` VALUES (113, '会员银行卡', '', '', 'admin', 'users', 'user_bank_cards', '', 70, 1, 0, 1, 0, '2018-04-10 16:52:12', '2019-03-29 11:23:32');
INSERT INTO `work_navs` VALUES (21, '规则列表', '', '', 'admin', 'content', 'rules', '', 50, 37, 0, 1, 1, '2017-12-06 15:25:01', '2017-12-28 17:51:07');
INSERT INTO `work_navs` VALUES (22, '系统管理', '', 'icon-msnui-sys-set', 'admin', '', '', '', 100, 0, 0, 1, 1, '2017-12-06 15:25:27', '2018-02-25 23:19:26');
INSERT INTO `work_navs` VALUES (23, '参数配置', '', '', 'admin', 'system', 'params', '', 16, 22, 0, 1, 1, '2017-12-06 15:26:06', '2018-02-25 11:23:01');
INSERT INTO `work_navs` VALUES (24, '菜单配置', '', '', 'admin', 'system', 'navs', '', 15, 22, 0, 1, 1, '2017-12-06 15:26:35', '2018-02-25 11:23:12');
INSERT INTO `work_navs` VALUES (114, '资产管理', '', 'icon-daizhifudingdan', '', '', '', '', 750, 0, 0, 1, 1, '2018-04-11 17:53:54', '2018-04-11 17:53:54');
INSERT INTO `work_navs` VALUES (27, '角色管理', '', '', 'admin', 'system', 'roles', '', 18, 22, 1, 1, 1, '2017-12-06 16:53:05', '2017-12-19 08:55:51');
INSERT INTO `work_navs` VALUES (115, '会员资产列表', '', '', 'admin', 'user_assets', 'index', '', 100, 114, 0, 1, 1, '2018-04-11 17:54:55', '2018-04-11 17:54:55');
INSERT INTO `work_navs` VALUES (36, '数据中台', '', 'icon-iconset0357', '', '', '', '', 1000, 0, 0, 1, 1, '2017-12-14 15:27:53', '2018-02-25 23:18:30');
INSERT INTO `work_navs` VALUES (37, '内容管理', '', 'icon-xiexinzhangjie', '', '', '', '', 60, 0, 0, 1, 1, '2017-12-16 10:05:09', '2018-02-25 23:19:14');
INSERT INTO `work_navs` VALUES (39, '通知公告', '', '', 'admin', 'content', 'annoncements', '', 78, 37, 0, 1, 1, '2017-12-16 10:08:37', '2017-12-28 17:50:23');
INSERT INTO `work_navs` VALUES (42, '轮播图管理', '', '', 'admin', 'content', 'banners', '', 60, 37, 0, 1, 1, '2017-12-16 10:21:28', '2017-12-28 17:51:13');
INSERT INTO `work_navs` VALUES (43, '分类管理', '', 'icon-all', 'admin', 'goods', 'index', '', 750, 0, 0, 1, 0, '2017-12-16 10:35:43', '2019-03-29 13:14:56');
INSERT INTO `work_navs` VALUES (45, '分类列表', '', '', 'admin', 'goods', 'goods_cates', '', 90, 43, 0, 1, 1, '2017-12-16 10:37:57', '2017-12-16 10:37:57');
INSERT INTO `work_navs` VALUES (49, '订单列表', '', '', 'admin', 'orders', 'index', '', 100, 48, 0, 1, 1, '2017-12-16 10:47:03', '2017-12-29 23:09:05');
INSERT INTO `work_navs` VALUES (70, '管理员登录日志', '', '', 'admin', 'system', 'admin_visit_logs', '', 19, 22, 0, 1, 1, '2017-12-20 21:21:54', '2017-12-20 21:21:54');
INSERT INTO `work_navs` VALUES (116, '资产变动记录', '', '', 'admin', 'user_assets', 'user_asset_logs', '', 90, 114, 0, 1, 1, '2018-04-11 18:02:58', '2018-04-11 18:02:58');
INSERT INTO `work_navs` VALUES (117, '会员积分记录', '', '', 'admin', 'user_assets', 'user_score_logs', '', 60, 114, 0, 1, 1, '2018-04-11 20:36:36', '2018-04-11 20:36:36');
INSERT INTO `work_navs` VALUES (118, '会员提现记录', '', '', 'admin', 'user_assets', 'user_withdraw_logs', '', 70, 114, 0, 1, 1, '2018-04-11 20:40:19', '2018-04-11 20:40:19');
INSERT INTO `work_navs` VALUES (75, '会员地址', '', '', 'admin', 'users', 'user_addresses', '', 80, 1, 0, 1, 1, '2017-12-29 22:57:42', '2017-12-29 22:57:42');
INSERT INTO `work_navs` VALUES (76, '发货管理', '', '', 'admin', 'orders', 'order_deliver', '', 90, 48, 0, 1, 1, '2017-12-29 23:08:50', '2017-12-29 23:08:50');
INSERT INTO `work_navs` VALUES (77, '退货管理', '', '', 'admin', 'orders', 'goods_return', '', 80, 48, 0, 1, 1, '2017-12-29 23:10:22', '2017-12-29 23:10:22');
INSERT INTO `work_navs` VALUES (78, '物流查询', '', '', 'admin', 'orders', 'query_logistics', '', 60, 48, 0, 1, 1, '2017-12-29 23:11:39', '2017-12-29 23:11:39');
INSERT INTO `work_navs` VALUES (82, '分销商等级设置', '', '', 'admin', 'distribution', 'levels', '', 90, 81, 0, 1, 1, '2017-12-27 10:52:40', '2017-12-27 10:52:53');
INSERT INTO `work_navs` VALUES (83, '分销基本参数', '', '', 'admin', 'distribution', 'params', '', 100, 81, 0, 1, 1, '2017-12-27 14:11:33', '2018-04-02 14:11:44');
INSERT INTO `work_navs` VALUES (119, '会员充值记录', '', '', 'admin', 'user_assets', 'user_recharge_logs', '', 80, 114, 0, 1, 1, '2018-04-11 20:40:44', '2018-04-11 20:40:44');
INSERT INTO `work_navs` VALUES (86, '分销商佣金提现管理', '', '', 'admin', 'distribution', 'user_withdraw', '', 80, 81, 0, 1, 1, '2018-01-08 22:49:59', '2018-04-02 14:11:44');
INSERT INTO `work_navs` VALUES (90, '签收管理', '', '', 'admin', 'orders', 'sign_for', '', 70, 48, 0, 1, 1, '2018-02-08 10:52:34', '2018-04-02 14:11:44');
INSERT INTO `work_navs` VALUES (91, '基础设置', '', 'icon-shezhi1', 'admin', 'system', 'base_params', '', 2000, 0, 1, 1, 1, '2018-02-08 17:10:08', '2018-04-02 14:11:44');
INSERT INTO `work_navs` VALUES (92, '留言建议', '', 'icon-xinfeng2', 'admin', 'content', 'feedback', '', 1900, 0, 1, 1, 1, '2018-02-08 17:10:45', '2018-04-02 14:11:44');
INSERT INTO `work_navs` VALUES (93, '指导手册', '', 'icon-yewushouce', 'admin', 'content', 'guides', '', 1800, 0, 1, 1, 1, '2018-02-08 17:12:07', '2018-04-02 14:11:44');
INSERT INTO `work_navs` VALUES (94, '统计板', '', '', 'admin', 'data', 'index', '', 10, 36, 0, 1, 1, '2018-02-23 08:44:28', '2018-04-02 14:11:44');
INSERT INTO `work_navs` VALUES (129, '会员优惠券', '', '', 'admin', 'users', 'user_coupons', '', 60, 1, 0, 1, 0, '2018-04-14 20:33:56', '2019-03-29 11:23:28');
INSERT INTO `work_navs` VALUES (122, '活动管理', '', '', 'admin', 'market_activities', 'index', '', 100, 121, 0, 1, 1, '2018-04-12 17:55:09', '2018-04-12 17:55:09');
INSERT INTO `work_navs` VALUES (124, '优惠券活动规则', '', '', 'admin', 'market_activities', 'coupon_activities', '', 70, 121, 0, 1, 1, '2018-04-13 11:45:26', '2018-04-13 11:45:26');
INSERT INTO `work_navs` VALUES (125, '满减活动规则', '', '', 'admin', 'market_activities', 'full_activities', '', 80, 121, 0, 1, 1, '2018-04-13 14:14:19', '2018-04-13 14:14:19');
INSERT INTO `work_navs` VALUES (126, '会员等级设置', '', '', 'admin', 'system', 'user_levels', '', 0, 22, 0, 1, 1, '2018-04-13 15:06:15', '2018-04-13 15:06:15');
INSERT INTO `work_navs` VALUES (127, '限时折扣活动规则', '', '', 'admin', 'market_activities', 'discount_activities', '', 90, 121, 0, 1, 1, '2018-04-13 15:24:17', '2018-04-13 15:24:17');
INSERT INTO `work_navs` VALUES (130, '会员申请分销商管理', '', '', 'admin', 'distribution', 'user_applications', '', 10, 81, 0, 1, 1, '2018-04-23 09:30:14', '2018-04-23 09:30:14');
INSERT INTO `work_navs` VALUES (131, '分销商品设置', '', '', 'admin', 'distribution', 'goods_setting', '', 80, 81, 0, 1, 1, '2018-04-25 11:11:32', '2018-04-25 11:11:32');
INSERT INTO `work_navs` VALUES (133, '分红商等级设置', '', '', 'admin', 'bonus', 'levels', '', 90, 132, 0, 1, 1, '2018-04-27 09:26:26', '2018-04-27 09:26:26');
INSERT INTO `work_navs` VALUES (134, '分红基本参数', '', '', 'admin', 'bonus', 'params', '', 100, 132, 0, 1, 1, '2018-04-27 10:25:08', '2018-04-27 10:25:08');
INSERT INTO `work_navs` VALUES (135, '会员申请分红商管理', '', '', 'admin', 'bonus', 'user_applications', '', 60, 132, 0, 1, 1, '2018-04-27 11:30:33', '2018-04-27 11:30:33');
INSERT INTO `work_navs` VALUES (136, '地区代理会员设置', '', '', 'admin', 'bonus', 'area_user_setting', '', 78, 132, 0, 1, 1, '2018-04-27 13:58:42', '2018-04-27 13:58:42');
INSERT INTO `work_navs` VALUES (137, '分红商品设置', '', '', 'admin', 'bonus', 'goods_setting', '', 80, 132, 0, 1, 1, '2018-04-27 13:59:08', '2018-04-27 13:59:08');
INSERT INTO `work_navs` VALUES (138, '全球分红会员设置', '', '', 'admin', 'bonus', 'global_user_setting', '', 76, 132, 0, 1, 1, '2018-04-28 09:19:42', '2018-04-28 09:19:42');
INSERT INTO `work_navs` VALUES (139, '分红商佣金提现管理', '', '', 'admin', 'bonus', 'user_withdraw', '', 70, 132, 0, 1, 1, '2018-04-28 10:14:12', '2018-04-28 10:14:12');
INSERT INTO `work_navs` VALUES (140, '会员上下级关系', '', '', 'admin', 'users', 'user_relationship', '', 0, 1, 0, 1, 1, '2018-06-04 22:06:58', '2018-06-04 22:06:58');
INSERT INTO `work_navs` VALUES (141, '分销商列表', '', '', 'admin', 'distribution', 'users', '', 0, 81, 0, 1, 1, '2018-06-13 13:46:29', '2018-06-13 13:46:29');
INSERT INTO `work_navs` VALUES (142, '分红商列表', '', '', 'admin', 'bonus', 'users', '', 0, 132, 0, 1, 1, '2018-06-13 13:46:51', '2018-06-13 13:46:51');
INSERT INTO `work_navs` VALUES (143, '分类树', '', '', 'admin', 'system', 'category_tree', '', 11, 22, 0, 1, 0, '2018-06-28 11:52:31', '2019-03-29 11:21:45');
INSERT INTO `work_navs` VALUES (148, '积分商品管理', '', '', 'admin', 'score_shop', 'goods_list', '', 40, 146, 0, 1, 1, '2018-06-29 22:33:25', '2018-06-29 22:33:25');
INSERT INTO `work_navs` VALUES (150, '积分商城配置', '', '', 'admin', 'score_shop', 'params', '', 50, 146, 0, 1, 1, '2018-06-30 15:12:10', '2018-06-30 15:12:10');
INSERT INTO `work_navs` VALUES (151, '团购配置', '', '', 'admin', 'group_shop', 'params', '', 50, 147, 0, 1, 1, '2018-06-30 15:28:42', '2018-06-30 15:28:42');
INSERT INTO `work_navs` VALUES (153, '会员团购商品设置', '', '', 'admin', 'group_shop', 'member_goods_list', '', 35, 147, 0, 1, 1, '2018-07-05 09:57:28', '2018-07-05 09:57:28');
INSERT INTO `work_navs` VALUES (156, '会员团购订单管理', '', '', 'admin', 'group_shop', 'user_orders', '', 28, 147, 0, 1, 1, '2018-07-24 15:29:53', '2018-07-24 15:29:53');
INSERT INTO `work_navs` VALUES (158, '会员团购拼团信息', '', '', 'admin', 'group_shop', 'user_teams', '', 33, 147, 0, 1, 1, '2018-07-24 15:32:31', '2018-07-24 15:32:31');
INSERT INTO `work_navs` VALUES (159, '拼团退款管理', '', '', 'admin', 'group_shop', 'return_money', '', 0, 147, 0, 1, 1, '2018-07-31 10:34:56', '2018-07-31 10:34:56');
INSERT INTO `work_navs` VALUES (165, '基础设置', '', '', 'admin', 'system', 'base_params', '', 0, 22, 0, 1, 1, '2018-09-07 14:47:09', '2018-09-07 14:47:09');
INSERT INTO `work_navs` VALUES (172, '师傅管理', '', 'icon-account', 'admin', 'master', '', '', 0, 0, 0, 1, 0, '2019-03-21 13:13:12', '2019-03-29 11:13:00');
INSERT INTO `work_navs` VALUES (173, '师傅列表', '', '', 'admin', 'master', 'index', '', 0, 172, 0, 1, 1, '2019-03-21 13:14:15', '2019-03-21 13:14:15');
INSERT INTO `work_navs` VALUES (174, '师傅认证', '', '', 'admin', 'master', 'master_via', '', 0, 172, 0, 1, 1, '2019-03-21 13:14:50', '2019-03-21 13:14:50');
INSERT INTO `work_navs` VALUES (175, '人事管理', '', 'icon-xiexinzhangjie', '', '', '', '', 0, 0, 0, 1, 0, '2019-03-29 13:07:10', '2019-03-29 13:08:47');
COMMIT;

-- ----------------------------
-- Table structure for work_notices
-- ----------------------------
DROP TABLE IF EXISTS `work_notices`;
CREATE TABLE `work_notices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `title` varchar(255) NOT NULL COMMENT '消息标题',
  `intro` text COMMENT '消息简介',
  `content` text COMMENT '消息详情',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1显示2隐藏',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_notices
-- ----------------------------
BEGIN;
INSERT INTO `work_notices` VALUES (1, 2, '33', '3', '123333', 1, 1, '2019-02-15 10:30:41', '2019-02-15 10:30:41');
INSERT INTO `work_notices` VALUES (2, 64, '你好', '1', '1', 1, 0, '2019-02-22 11:12:43', '2019-02-22 11:14:09');
COMMIT;

-- ----------------------------
-- Table structure for work_qiniu_files
-- ----------------------------
DROP TABLE IF EXISTS `work_qiniu_files`;
CREATE TABLE `work_qiniu_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL COMMENT '文件名称',
  `file_type` varchar(255) NOT NULL COMMENT '文件类型',
  `file_size` varchar(255) NOT NULL COMMENT '文件大小',
  `key` varchar(255) NOT NULL COMMENT '七牛生成的文件key',
  `file_url` varchar(255) NOT NULL COMMENT '七牛外链',
  `desc` text COMMENT '文件说明',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for work_quote
-- ----------------------------
DROP TABLE IF EXISTS `work_quote`;
CREATE TABLE `work_quote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tid` bigint(20) DEFAULT NULL COMMENT '任务ID',
  `mid` bigint(20) DEFAULT NULL COMMENT '师傅ID',
  `money` decimal(20,2) DEFAULT NULL COMMENT '报价',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_quote
-- ----------------------------
BEGIN;
INSERT INTO `work_quote` VALUES (8, 10, 62, 1000.00, 1, '2019-03-26 14:58:48', NULL);
INSERT INTO `work_quote` VALUES (9, 12, 7, 1000.00, 1, '2019-03-26 20:24:52', '2019-03-26 20:24:52');
INSERT INTO `work_quote` VALUES (10, 10, NULL, 1000.00, 1, '2019-03-27 11:01:51', '2019-03-27 11:01:51');
INSERT INTO `work_quote` VALUES (11, 10, NULL, 1000.00, 1, '2019-03-27 11:01:57', '2019-03-27 11:01:57');
INSERT INTO `work_quote` VALUES (12, 10, NULL, 1000.00, 1, '2019-03-27 11:02:09', '2019-03-27 11:02:09');
INSERT INTO `work_quote` VALUES (13, 10, NULL, 1000.00, 1, '2019-03-27 11:02:31', '2019-03-27 11:02:31');
INSERT INTO `work_quote` VALUES (14, 16, 62, 1000.00, 1, '2019-03-27 11:33:43', '2019-03-27 11:33:43');
INSERT INTO `work_quote` VALUES (16, 17, 7, 1000.00, 1, '2019-03-27 11:34:55', '2019-03-27 11:34:55');
INSERT INTO `work_quote` VALUES (17, 16, 7, 1999.00, 1, '2019-03-27 20:48:09', '2019-03-27 20:48:09');
COMMIT;

-- ----------------------------
-- Table structure for work_role_api_powers
-- ----------------------------
DROP TABLE IF EXISTS `work_role_api_powers`;
CREATE TABLE `work_role_api_powers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `module` varchar(255) NOT NULL COMMENT '模块名称',
  `create` tinyint(1) DEFAULT '1' COMMENT '新建权限：0禁止1允许',
  `update` tinyint(1) DEFAULT '1' COMMENT '更新权限：0禁止1允许',
  `read` tinyint(1) DEFAULT '1' COMMENT '查看权限：0禁止1允许',
  `delete` tinyint(1) DEFAULT '1' COMMENT '删除权限：0禁止1允许',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_role_api_powers
-- ----------------------------
BEGIN;
INSERT INTO `work_role_api_powers` VALUES (1, 1, 'users', 1, 1, 1, 1, 1, '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (2, 1, 'modules', 1, 1, 1, 1, 1, '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (3, 1, 'annoncements', 1, 1, 1, 1, 1, '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (4, 1, 'articles', 1, 1, 1, 1, 1, '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (5, 1, 'rules', 1, 1, 1, 1, 1, '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (6, 1, 'roles', 1, 1, 1, 1, 1, '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (7, 1, 'params', 1, 1, 1, 1, 1, '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (8, 1, 'navs', 1, 1, 1, 1, 1, '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (9, 1, 'datadict_keys', 1, 1, 1, 1, 1, '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (10, 2, 'users', 1, 1, 1, 1, 1, '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (11, 2, 'modules', 1, 1, 1, 1, 1, '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (12, 2, 'annoncements', 1, 1, 1, 1, 1, '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (13, 2, 'articles', 1, 1, 1, 1, 1, '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (14, 2, 'rules', 1, 1, 1, 1, 1, '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (15, 2, 'roles', 1, 1, 1, 1, 1, '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (16, 2, 'params', 1, 1, 1, 1, 1, '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (17, 2, 'navs', 1, 1, 1, 1, 1, '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (18, 2, 'datadict_keys', 1, 1, 1, 1, 1, '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (19, 1, 'admins', 1, 1, 1, 1, 1, '2017-12-11 21:30:18', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (20, 1, 'article_types', 1, 1, 1, 1, 1, '2017-12-11 22:03:22', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (21, 1, 'visit_logs', 1, 1, 1, 1, 1, '2017-12-12 09:42:14', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (22, 1, 'advertisements', 1, 1, 1, 1, 1, '2017-12-12 15:33:24', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (23, 1, 'friendly_links', 1, 1, 1, 1, 1, '2017-12-12 16:53:12', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (24, 1, 'dds', 1, 1, 1, 1, 1, '2017-12-12 20:42:10', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (25, 1, 'data_counts', 1, 1, 1, 1, 1, '2017-12-19 18:15:37', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (26, 1, 'resources', 1, 1, 1, 1, 1, '2017-12-20 09:55:41', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (27, 1, 'banners', 1, 1, 1, 1, 1, '2017-12-20 10:10:03', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (28, 1, 'courses', 1, 1, 1, 1, 1, '2017-12-20 15:51:08', '2017-12-20 17:29:54');
INSERT INTO `work_role_api_powers` VALUES (29, 1, 'course_types', 1, 1, 1, 1, 1, '2017-12-20 17:13:09', '2017-12-20 17:29:54');
INSERT INTO `work_role_api_powers` VALUES (30, 1, 'course_boxs', 1, 1, 1, 1, 1, '2017-12-20 17:29:54', '2017-12-20 17:29:54');
INSERT INTO `work_role_api_powers` VALUES (31, 1, 'systems', 1, 1, 1, 1, 1, '2017-12-20 21:29:28', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (32, 1, 'shops', 1, 1, 1, 1, 1, '2017-12-21 15:43:58', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (33, 1, 'coupons', 1, 1, 1, 1, 1, '2017-12-23 14:01:48', '2018-03-10 09:59:10');
INSERT INTO `work_role_api_powers` VALUES (34, 1, 'orders', 1, 1, 1, 1, 1, '2017-12-25 10:32:21', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (35, 3, 'users', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (36, 3, 'modules', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (37, 3, 'annoncements', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (38, 3, 'admins', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (39, 3, 'article_types', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (40, 3, 'articles', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (41, 3, 'rules', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (42, 3, 'roles', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (43, 3, 'params', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (44, 3, 'navs', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (45, 3, 'datadict_keys', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (46, 3, 'visit_logs', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (47, 3, 'advertisements', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (48, 3, 'friendly_links', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (49, 3, 'dds', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (50, 3, 'data_counts', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (51, 3, 'resources', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (52, 3, 'banners', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (53, 3, 'systems', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (54, 3, 'shops', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (55, 3, 'coupons', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (56, 3, 'orders', 1, 1, 1, 1, 1, '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (57, 1, 'addresses', 1, 1, 1, 1, 1, '2017-12-25 11:31:53', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (58, 3, 'addresses', 1, 1, 1, 1, 1, '2017-12-25 11:32:06', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (59, 3, 'carts', 1, 1, 1, 1, 1, '2017-12-25 11:45:43', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (60, 3, 'goods', 1, 1, 1, 1, 1, '2017-12-25 14:21:28', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (61, 3, 'goods_comments', 1, 1, 1, 1, 1, '2017-12-25 14:21:28', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (62, 3, 'goods_collections', 1, 1, 1, 1, 1, '2017-12-25 14:21:28', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (63, 1, 'carts', 1, 1, 1, 1, 1, '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (64, 1, 'goods', 1, 1, 1, 1, 1, '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (65, 1, 'goods_comments', 1, 1, 1, 1, 1, '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (66, 1, 'goods_collections', 1, 1, 1, 1, 1, '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (67, 1, 'goods_cates', 1, 1, 1, 1, 1, '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (68, 2, 'admins', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (69, 2, 'article_types', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (70, 2, 'visit_logs', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (71, 2, 'advertisements', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (72, 2, 'friendly_links', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (73, 2, 'dds', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (74, 2, 'data_counts', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (75, 2, 'resources', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (76, 2, 'banners', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (77, 2, 'systems', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (78, 2, 'shops', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (79, 2, 'coupons', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (80, 2, 'orders', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (81, 2, 'addresses', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (82, 2, 'carts', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (83, 2, 'goods', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (84, 2, 'goods_comments', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (85, 2, 'goods_collections', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (86, 2, 'goods_cates', 1, 1, 1, 1, 1, '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (87, 3, 'goods_cates', 1, 1, 1, 1, 1, '2017-12-25 14:49:45', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (88, 1, 'querys', 1, 1, 1, 1, 1, '2017-12-25 15:24:19', '2017-12-25 15:24:19');
INSERT INTO `work_role_api_powers` VALUES (89, 2, 'querys', 1, 1, 1, 1, 1, '2017-12-25 15:24:25', '2017-12-25 15:24:25');
INSERT INTO `work_role_api_powers` VALUES (90, 3, 'querys', 1, 1, 1, 1, 1, '2017-12-25 15:24:32', '2017-12-25 15:24:32');
INSERT INTO `work_role_api_powers` VALUES (91, 3, 'query', 1, 1, 1, 1, 1, '2017-12-25 15:44:11', '2017-12-25 16:14:08');
INSERT INTO `work_role_api_powers` VALUES (92, 2, 'query', 1, 1, 1, 1, 1, '2017-12-25 15:44:17', '2018-01-10 19:36:05');
INSERT INTO `work_role_api_powers` VALUES (93, 1, 'query', 1, 1, 1, 1, 1, '2017-12-25 15:44:25', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (94, 1, 'commissions', 1, 1, 1, 1, 1, '2017-12-27 17:51:46', '2017-12-27 17:51:46');
INSERT INTO `work_role_api_powers` VALUES (95, 1, 'commission_levels', 1, 1, 1, 1, 1, '2017-12-27 17:53:11', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (96, 1, 'commission_systems', 1, 1, 1, 1, 1, '2017-12-27 17:54:11', '2017-12-28 09:31:15');
INSERT INTO `work_role_api_powers` VALUES (97, 3, 'commission_levels', 1, 1, 1, 1, 1, '2018-01-05 09:32:48', '2018-01-05 10:01:18');
INSERT INTO `work_role_api_powers` VALUES (98, 1, 'commission_applys', 1, 1, 1, 1, 1, '2018-01-11 11:55:06', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (99, 1, 'coupon_types', 1, 1, 1, 1, 1, '2018-01-11 11:55:46', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (100, 1, 'asstes_supervise', 1, 1, 1, 1, 1, '2018-01-15 14:03:31', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (101, 1, 'feedbacks', 1, 1, 1, 1, 1, '2018-02-09 10:47:49', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (102, 1, 'basics', 1, 1, 1, 1, 1, '2018-02-22 10:21:31', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (103, 1, 'guides', 1, 1, 1, 1, 1, '2018-02-22 11:52:38', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (104, 1, 'spec_models', 1, 1, 1, 1, 1, '2018-02-23 18:41:32', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (105, 1, 'specs', 1, 1, 1, 1, 1, '2018-02-23 18:41:32', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (106, 1, 'attr_models', 1, 1, 1, 1, 1, '2018-02-25 11:35:53', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (107, 1, 'attrs', 1, 1, 1, 1, 1, '2018-02-25 11:35:53', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (108, 1, 'transport_models', 1, 1, 1, 1, 1, '2018-02-28 08:49:41', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (109, 1, 'qiniu', 1, 1, 1, 1, 1, '2018-03-08 13:50:42', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (110, 1, 'databackup', 1, 1, 1, 1, 1, '2018-03-09 09:34:33', '2018-03-10 09:59:11');
INSERT INTO `work_role_api_powers` VALUES (111, 1, 'email', 1, 1, 1, 1, 1, '2018-03-10 09:59:11', '2018-03-10 09:59:11');
COMMIT;

-- ----------------------------
-- Table structure for work_role_nav_powers
-- ----------------------------
DROP TABLE IF EXISTS `work_role_nav_powers`;
CREATE TABLE `work_role_nav_powers` (
  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `nav_ids` text NOT NULL COMMENT '菜单IDs',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_role_nav_powers
-- ----------------------------
BEGIN;
INSERT INTO `work_role_nav_powers` VALUES (2, '[91,92,93,36,94,1,2,112,75,33,140,114,115,116,119,118,117,22,29,70,23,24,165,126,37,18,39,42,21]', 1, '2018-04-04 10:57:01', '2019-03-29 13:53:39');
INSERT INTO `work_role_nav_powers` VALUES (3, '[91,92,93,36,94,1,2,112,75,113,129,33,140,114,115,116,119,118,117,43,44,45,100,101,102,170,46,47,48,49,76,77,90,78,121,122,127,125,124,146,150,148,152,147,151,153,158,156,159,81,83,82,131,86,130,141,132,134,133,137,136,138,139,135,142,22,29,70,27,23,24,34,143,103,105,165,154,126,104,37,18,38,39,42,32,21,171]', 1, '2018-04-04 10:57:34', '2019-02-23 16:33:47');
INSERT INTO `work_role_nav_powers` VALUES (4, '[]', 1, '2018-04-05 17:57:18', '2018-04-05 17:57:18');
INSERT INTO `work_role_nav_powers` VALUES (5, '[]', 1, '2018-06-29 14:14:09', '2018-06-29 14:14:09');
INSERT INTO `work_role_nav_powers` VALUES (6, '[36,94,1,116]', 1, '2018-08-24 09:46:23', '2018-08-24 10:51:55');
INSERT INTO `work_role_nav_powers` VALUES (7, '[]', 1, '2018-09-04 09:47:48', '2018-09-04 09:47:48');
INSERT INTO `work_role_nav_powers` VALUES (8, '[]', 1, '2018-09-10 11:31:27', '2018-09-10 11:31:27');
INSERT INTO `work_role_nav_powers` VALUES (9, '[]', 1, '2018-09-10 11:31:57', '2018-09-10 11:31:57');
INSERT INTO `work_role_nav_powers` VALUES (10, '[]', 1, '2018-09-10 11:32:01', '2018-09-10 11:32:01');
INSERT INTO `work_role_nav_powers` VALUES (11, '[]', 1, '2018-09-26 17:43:00', '2018-09-26 17:43:00');
COMMIT;

-- ----------------------------
-- Table structure for work_roles
-- ----------------------------
DROP TABLE IF EXISTS `work_roles`;
CREATE TABLE `work_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `intro` varchar(255) DEFAULT NULL COMMENT '角色简介',
  `type` text NOT NULL COMMENT 'user用户类角色admin管理员角色',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_roles
-- ----------------------------
BEGIN;
INSERT INTO `work_roles` VALUES (1, '会员', '会员通用角色', 'user', 1, '2018-04-04 10:55:37', '2018-04-04 10:55:37');
INSERT INTO `work_roles` VALUES (2, '普通管理员', '普通管理员发', 'admin', 1, '2018-04-04 10:57:01', '2018-04-04 10:57:01');
INSERT INTO `work_roles` VALUES (3, '超级管理员', '超级管理员', 'admin', 1, '2018-04-04 10:57:34', '2018-04-04 10:57:34');
INSERT INTO `work_roles` VALUES (4, '运营管理员', '运营管理员的介绍', 'admin', 0, '2018-04-05 17:57:18', '2018-04-05 17:57:18');
INSERT INTO `work_roles` VALUES (5, '测试', '法大师傅', 'admin', 0, '2018-06-29 14:14:09', '2018-06-29 14:14:43');
INSERT INTO `work_roles` VALUES (6, '测试管理员', '用于测试', 'admin', 0, '2018-08-24 09:46:23', '2018-09-03 11:39:48');
INSERT INTO `work_roles` VALUES (7, '1', '1', 'user', 0, '2018-09-04 09:47:48', '2018-09-04 09:47:59');
INSERT INTO `work_roles` VALUES (8, '1', '1', 'user', 0, '2018-09-10 11:31:27', '2018-09-10 11:31:54');
INSERT INTO `work_roles` VALUES (9, '1', '1', 'user', 0, '2018-09-10 11:31:57', '2018-09-10 11:32:07');
INSERT INTO `work_roles` VALUES (10, '2', '2', 'admin', 0, '2018-09-10 11:32:01', '2018-09-10 11:32:05');
INSERT INTO `work_roles` VALUES (11, '测试角色', '测试角色', 'admin', 0, '2018-09-26 17:43:00', '2018-09-26 17:44:01');
COMMIT;

-- ----------------------------
-- Table structure for work_rules
-- ----------------------------
DROP TABLE IF EXISTS `work_rules`;
CREATE TABLE `work_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) NOT NULL COMMENT '规则分类ID',
  `title` varchar(255) NOT NULL COMMENT '规则标题',
  `thum` varchar(255) DEFAULT NULL COMMENT '规则缩略图',
  `intro` text COMMENT '规则简介',
  `content` text COMMENT '规则详情',
  `author` varchar(50) DEFAULT NULL COMMENT '文章作者',
  `imgs` text COMMENT '文章的图片集',
  `audio_url` text COMMENT '音频链接',
  `video_url` text COMMENT '视频链接',
  `click_num` bigint(20) DEFAULT '0' COMMENT '文章的点击量',
  `status` tinyint(1) DEFAULT '1' COMMENT '1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_rules
-- ----------------------------
BEGIN;
INSERT INTO `work_rules` VALUES (1, 18, '43', '/public/upload/article_images/20180824/10b240754b2569ba5ca96096d21f83e3.png', '34', '<p>4334433443</p>', '433', '[]', '4343', '3443', 0, 1, 1, '2018-08-24 13:05:19', '2018-09-10 11:40:36');
INSERT INTO `work_rules` VALUES (2, 18, '3343434', '/public/upload/article_images/20180824/39f45d1f26e7d31f90ca305ef4173f08.png', '43', '343443443', '4334', '[]', '4343', '34', 0, 1, 1, '2018-08-24 13:05:38', '2018-09-10 11:40:36');
INSERT INTO `work_rules` VALUES (3, 19, '43434', '/public/upload/article_images/20180824/c1910dfeac43e6effd6368e56094d113.png', '3434', '43433434', '4334', '[]', '3443', '34', 0, 1, 1, '2018-08-24 13:05:52', '2018-09-10 11:40:36');
INSERT INTO `work_rules` VALUES (4, 17, '1', '', '1', '', '1', '[]', '1', '1', 0, 1, 0, '2018-09-10 11:40:43', '2018-09-10 11:40:47');
INSERT INTO `work_rules` VALUES (5, 17, '服务条款', '', '', '<p>服务条款</p>', '', '[]', '', '', 0, 1, 1, '2018-09-17 20:59:50', '2018-09-17 20:59:50');
INSERT INTO `work_rules` VALUES (6, 17, '隐私政策', '', '', '<p><span style=\"color: #a31515;\">隐私政策</span></p><p><br/></p>', '', '[]', '', '', 0, 1, 1, '2018-09-17 21:00:02', '2018-09-17 21:00:02');
COMMIT;

-- ----------------------------
-- Table structure for work_score_logs
-- ----------------------------
DROP TABLE IF EXISTS `work_score_logs`;
CREATE TABLE `work_score_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `change_type` varchar(255) NOT NULL COMMENT '积分变动类别',
  `change_num` decimal(10,2) NOT NULL COMMENT '积分变动数量',
  `intro` text NOT NULL COMMENT '积分日志简介',
  `desc` text COMMENT '积分日志详情',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_score_logs
-- ----------------------------
BEGIN;
INSERT INTO `work_score_logs` VALUES (1, 2, 'admin_recharge_score', 5000.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-11-10 14:44:46', 1, '2018-11-10 14:44:46', '2018-11-10 14:44:46');
INSERT INTO `work_score_logs` VALUES (2, 2, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 14:44:58', 1, '2018-11-10 14:44:58', '2018-11-10 14:44:58');
INSERT INTO `work_score_logs` VALUES (3, 3, 'admin_recharge_score', 200.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-11-10 15:04:43', 1, '2018-11-10 15:04:43', '2018-11-10 15:04:43');
INSERT INTO `work_score_logs` VALUES (4, 3, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:05:52', 1, '2018-11-10 15:05:52', '2018-11-10 15:05:52');
INSERT INTO `work_score_logs` VALUES (5, 3, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:05:52', 1, '2018-11-10 15:05:52', '2018-11-10 15:05:52');
INSERT INTO `work_score_logs` VALUES (6, 2, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:25:42', 1, '2018-11-10 15:25:42', '2018-11-10 15:25:42');
INSERT INTO `work_score_logs` VALUES (7, 2, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:27:32', 1, '2018-11-10 15:27:32', '2018-11-10 15:27:32');
INSERT INTO `work_score_logs` VALUES (8, 2, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:27:33', 1, '2018-11-10 15:27:33', '2018-11-10 15:27:33');
INSERT INTO `work_score_logs` VALUES (9, 1, 'admin_recharge_score', 10000000.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-11-10 15:47:12', 1, '2018-11-10 15:47:12', '2018-11-10 15:47:12');
INSERT INTO `work_score_logs` VALUES (10, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:47:14', 1, '2018-11-10 15:47:14', '2018-11-10 15:47:14');
INSERT INTO `work_score_logs` VALUES (11, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:47:14', 1, '2018-11-10 15:47:14', '2018-11-10 15:47:14');
INSERT INTO `work_score_logs` VALUES (12, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:47:15', 1, '2018-11-10 15:47:15', '2018-11-10 15:47:15');
INSERT INTO `work_score_logs` VALUES (13, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:47:15', 1, '2018-11-10 15:47:15', '2018-11-10 15:47:15');
INSERT INTO `work_score_logs` VALUES (14, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:47:15', 1, '2018-11-10 15:47:15', '2018-11-10 15:47:15');
INSERT INTO `work_score_logs` VALUES (15, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:47:23', 1, '2018-11-10 15:47:23', '2018-11-10 15:47:23');
INSERT INTO `work_score_logs` VALUES (16, 2, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:51:58', 1, '2018-11-10 15:51:58', '2018-11-10 15:51:58');
INSERT INTO `work_score_logs` VALUES (17, 2, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:51:58', 1, '2018-11-10 15:51:58', '2018-11-10 15:51:58');
INSERT INTO `work_score_logs` VALUES (18, 2, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 15:51:59', 1, '2018-11-10 15:51:59', '2018-11-10 15:51:59');
INSERT INTO `work_score_logs` VALUES (19, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:51', 1, '2018-11-10 16:02:51', '2018-11-10 16:02:51');
INSERT INTO `work_score_logs` VALUES (20, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:57', 1, '2018-11-10 16:02:57', '2018-11-10 16:02:57');
INSERT INTO `work_score_logs` VALUES (21, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:57', 1, '2018-11-10 16:02:57', '2018-11-10 16:02:57');
INSERT INTO `work_score_logs` VALUES (22, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:57', 1, '2018-11-10 16:02:57', '2018-11-10 16:02:57');
INSERT INTO `work_score_logs` VALUES (23, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:58', 1, '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `work_score_logs` VALUES (24, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:58', 1, '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `work_score_logs` VALUES (25, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:58', 1, '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `work_score_logs` VALUES (26, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:58', 1, '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `work_score_logs` VALUES (27, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:47', 1, '2018-11-10 16:03:47', '2018-11-10 16:03:47');
INSERT INTO `work_score_logs` VALUES (28, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:54', 1, '2018-11-10 16:03:54', '2018-11-10 16:03:54');
INSERT INTO `work_score_logs` VALUES (29, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:54', 1, '2018-11-10 16:03:54', '2018-11-10 16:03:54');
INSERT INTO `work_score_logs` VALUES (30, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:54', 1, '2018-11-10 16:03:54', '2018-11-10 16:03:54');
INSERT INTO `work_score_logs` VALUES (31, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:55', 1, '2018-11-10 16:03:55', '2018-11-10 16:03:55');
INSERT INTO `work_score_logs` VALUES (32, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:55', 1, '2018-11-10 16:03:55', '2018-11-10 16:03:55');
INSERT INTO `work_score_logs` VALUES (33, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:55', 1, '2018-11-10 16:03:55', '2018-11-10 16:03:55');
INSERT INTO `work_score_logs` VALUES (34, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:56', 1, '2018-11-10 16:03:56', '2018-11-10 16:03:56');
INSERT INTO `work_score_logs` VALUES (35, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:04:49', 1, '2018-11-10 16:04:49', '2018-11-10 16:04:49');
INSERT INTO `work_score_logs` VALUES (36, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:01', 1, '2018-11-10 16:05:01', '2018-11-10 16:05:01');
INSERT INTO `work_score_logs` VALUES (37, 1, 'score_shop', 20.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:09', 1, '2018-11-10 16:05:09', '2018-11-10 16:05:09');
INSERT INTO `work_score_logs` VALUES (38, 1, 'score_shop', 20.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:17', 1, '2018-11-10 16:05:17', '2018-11-10 16:05:17');
INSERT INTO `work_score_logs` VALUES (39, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:44', 1, '2018-11-10 16:05:44', '2018-11-10 16:05:44');
INSERT INTO `work_score_logs` VALUES (40, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:50', 1, '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `work_score_logs` VALUES (41, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:50', 1, '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `work_score_logs` VALUES (42, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:50', 1, '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `work_score_logs` VALUES (43, 1, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:50', 1, '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `work_score_logs` VALUES (44, 1, 'score_shop', 20.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:07:45', 1, '2018-11-10 16:07:45', '2018-11-10 16:07:45');
INSERT INTO `work_score_logs` VALUES (45, 1, 'score_shop', 20.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:07:53', 1, '2018-11-10 16:07:53', '2018-11-10 16:07:53');
INSERT INTO `work_score_logs` VALUES (46, 1, 'score_shop', 20.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:08:12', 1, '2018-11-10 16:08:12', '2018-11-10 16:08:12');
INSERT INTO `work_score_logs` VALUES (47, 1, 'score_shop', 20.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:14:13', 1, '2018-11-10 16:14:13', '2018-11-10 16:14:13');
INSERT INTO `work_score_logs` VALUES (48, 1, 'score_shop', 20.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:14:13', 1, '2018-11-10 16:14:13', '2018-11-10 16:14:13');
INSERT INTO `work_score_logs` VALUES (49, 1, 'score_shop', 20.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:14:13', 1, '2018-11-10 16:14:13', '2018-11-10 16:14:13');
INSERT INTO `work_score_logs` VALUES (50, 1, 'score_shop', 20.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:18:08', 1, '2018-11-10 16:18:08', '2018-11-10 16:18:08');
INSERT INTO `work_score_logs` VALUES (51, 1, 'score_shop', 20.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:18:20', 1, '2018-11-10 16:18:20', '2018-11-10 16:18:20');
INSERT INTO `work_score_logs` VALUES (52, 1, 'score_shop', 20.00, '积分兑换', '积分兑换商品，购物时间2018-11-10 16:18:44', 1, '2018-11-10 16:18:44', '2018-11-10 16:18:44');
INSERT INTO `work_score_logs` VALUES (53, 3, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-11-10 16:39:12', 1, '2018-11-10 16:39:12', '2018-11-10 16:39:12');
INSERT INTO `work_score_logs` VALUES (54, 4, 'admin_recharge_score', 1000000.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-11-10 16:39:55', 1, '2018-11-10 16:39:55', '2018-11-10 16:39:55');
INSERT INTO `work_score_logs` VALUES (55, 4, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-11-10 16:40:00', 1, '2018-11-10 16:40:00', '2018-11-10 16:40:00');
INSERT INTO `work_score_logs` VALUES (56, 7, 'shop', 90.30, '会员完成购物', '会员完成购物，购物时间2018-11-10 18:40:45', 1, '2018-11-10 18:40:45', '2018-11-10 18:40:45');
INSERT INTO `work_score_logs` VALUES (57, 7, 'shop', 90.30, '会员完成购物', '会员完成购物，购物时间2018-11-10 18:40:49', 1, '2018-11-10 18:40:49', '2018-11-10 18:40:49');
INSERT INTO `work_score_logs` VALUES (58, 8, 'shop', 1000.00, '会员完成购物', '会员完成购物，购物时间2018-11-12 11:22:37', 1, '2018-11-12 11:22:37', '2018-11-12 11:22:37');
INSERT INTO `work_score_logs` VALUES (59, 9, 'admin_recharge_score', 2000.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-11-12 13:42:32', 1, '2018-11-12 13:42:32', '2018-11-12 13:42:32');
INSERT INTO `work_score_logs` VALUES (60, 1, 'shop', 1000.00, '会员完成购物', '会员完成购物，购物时间2018-11-12 16:11:04', 1, '2018-11-12 16:11:04', '2018-11-12 16:11:04');
INSERT INTO `work_score_logs` VALUES (61, 8, 'shop', 20.00, '会员完成购物', '会员完成购物，购物时间2018-11-12 17:27:42', 1, '2018-11-12 17:27:42', '2018-11-12 17:27:42');
INSERT INTO `work_score_logs` VALUES (62, 4, 'shop', 20.00, '会员完成购物', '会员完成购物，购物时间2018-11-12 17:33:23', 1, '2018-11-12 17:33:23', '2018-11-12 17:33:23');
INSERT INTO `work_score_logs` VALUES (63, 4, 'shop', 20.00, '会员完成购物', '会员完成购物，购物时间2018-11-12 17:33:25', 1, '2018-11-12 17:33:25', '2018-11-12 17:33:25');
INSERT INTO `work_score_logs` VALUES (64, 17, 'admin_recharge_score', 100000.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-11-17 09:55:29', 1, '2018-11-17 09:55:29', '2018-11-17 09:55:29');
INSERT INTO `work_score_logs` VALUES (65, 17, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-17 09:55:38', 1, '2018-11-17 09:55:38', '2018-11-17 09:55:38');
INSERT INTO `work_score_logs` VALUES (66, 17, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-11-17 09:55:44', 1, '2018-11-17 09:55:44', '2018-11-17 09:55:44');
INSERT INTO `work_score_logs` VALUES (67, 8, 'score_shop', 105.00, '积分兑换', '积分兑换商品，购物时间2018-11-17 09:56:31', 1, '2018-11-17 09:56:31', '2018-11-17 09:56:31');
INSERT INTO `work_score_logs` VALUES (68, 20, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-11-17 11:59:46', 1, '2018-11-17 11:59:46', '2018-11-17 11:59:46');
INSERT INTO `work_score_logs` VALUES (69, 24, 'shop', 20.00, '会员完成购物', '会员完成购物，购物时间2018-11-17 15:23:55', 1, '2018-11-17 15:23:55', '2018-11-17 15:23:55');
INSERT INTO `work_score_logs` VALUES (70, 8, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-11-17 15:47:23', 1, '2018-11-17 15:47:23', '2018-11-17 15:47:23');
INSERT INTO `work_score_logs` VALUES (71, 25, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-11-17 16:05:08', 1, '2018-11-17 16:05:08', '2018-11-17 16:05:08');
INSERT INTO `work_score_logs` VALUES (72, 26, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-11-17 16:20:08', 1, '2018-11-17 16:20:08', '2018-11-17 16:20:08');
INSERT INTO `work_score_logs` VALUES (73, 27, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-11-17 16:33:37', 1, '2018-11-17 16:33:37', '2018-11-17 16:33:37');
INSERT INTO `work_score_logs` VALUES (74, 4, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-17 17:05:54', 1, '2018-11-17 17:05:54', '2018-11-17 17:05:54');
INSERT INTO `work_score_logs` VALUES (75, 2, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-20 10:06:34', 1, '2018-11-20 10:06:34', '2018-11-20 10:06:34');
INSERT INTO `work_score_logs` VALUES (76, 2, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2018-11-20 10:27:45', 1, '2018-11-20 10:27:45', '2018-11-20 10:27:45');
INSERT INTO `work_score_logs` VALUES (77, 28, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-11-20 12:52:48', 1, '2018-11-20 12:52:48', '2018-11-20 12:52:48');
INSERT INTO `work_score_logs` VALUES (78, 2, 'score_shop', 20.00, '积分兑换', '积分兑换商品，购物时间2018-11-21 07:44:58', 1, '2018-11-21 07:44:58', '2018-11-21 07:44:58');
INSERT INTO `work_score_logs` VALUES (79, 31, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-11-21 10:08:21', 1, '2018-11-21 10:08:21', '2018-11-21 10:08:21');
INSERT INTO `work_score_logs` VALUES (80, 35, 'admin_recharge_score', 1000.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-11-22 10:59:07', 1, '2018-11-22 10:59:07', '2018-11-22 10:59:07');
INSERT INTO `work_score_logs` VALUES (81, 15, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-11-23 11:53:56', 1, '2018-11-23 11:53:56', '2018-11-23 11:53:56');
INSERT INTO `work_score_logs` VALUES (82, 17, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-11-23 11:54:08', 1, '2018-11-23 11:54:08', '2018-11-23 11:54:08');
INSERT INTO `work_score_logs` VALUES (83, 32, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-11-23 12:08:31', 1, '2018-11-23 12:08:31', '2018-11-23 12:08:31');
INSERT INTO `work_score_logs` VALUES (84, 4, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-11-23 15:50:21', 1, '2018-11-23 15:50:21', '2018-11-23 15:50:21');
INSERT INTO `work_score_logs` VALUES (85, 36, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-11-24 14:10:44', 1, '2018-11-24 14:10:44', '2018-11-24 14:10:44');
INSERT INTO `work_score_logs` VALUES (86, 4, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-11-28 15:22:39', 1, '2018-11-28 15:22:39', '2018-11-28 15:22:39');
INSERT INTO `work_score_logs` VALUES (87, 44, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-11-28 15:30:05', 1, '2018-11-28 15:30:05', '2018-11-28 15:30:05');
INSERT INTO `work_score_logs` VALUES (88, 44, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-11-28 17:50:23', 1, '2018-11-28 17:50:23', '2018-11-28 17:50:23');
INSERT INTO `work_score_logs` VALUES (89, 44, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-11-28 17:54:44', 1, '2018-11-28 17:54:44', '2018-11-28 17:54:44');
INSERT INTO `work_score_logs` VALUES (90, 44, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-11-29 16:21:51', 1, '2018-11-29 16:21:51', '2018-11-29 16:21:51');
INSERT INTO `work_score_logs` VALUES (91, 44, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-11-29 16:24:09', 1, '2018-11-29 16:24:09', '2018-11-29 16:24:09');
INSERT INTO `work_score_logs` VALUES (92, 2, 'shop', 4.00, '会员完成购物', '会员完成购物，购物时间2018-11-29 16:44:31', 1, '2018-11-29 16:44:31', '2018-11-29 16:44:31');
INSERT INTO `work_score_logs` VALUES (93, 44, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-11-29 17:26:21', 1, '2018-11-29 17:26:21', '2018-11-29 17:26:21');
INSERT INTO `work_score_logs` VALUES (94, 48, 'admin_recharge_score', 151515.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-12-01 15:41:40', 1, '2018-12-01 15:41:40', '2018-12-01 15:41:40');
INSERT INTO `work_score_logs` VALUES (95, 47, 'admin_recharge_score', 151515.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-12-01 15:41:46', 1, '2018-12-01 15:41:46', '2018-12-01 15:41:46');
INSERT INTO `work_score_logs` VALUES (96, 46, 'admin_recharge_score', 51515.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-12-01 15:41:51', 1, '2018-12-01 15:41:51', '2018-12-01 15:41:51');
INSERT INTO `work_score_logs` VALUES (97, 45, 'admin_recharge_score', 151515.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-12-01 15:41:55', 1, '2018-12-01 15:41:55', '2018-12-01 15:41:55');
INSERT INTO `work_score_logs` VALUES (98, 44, 'admin_recharge_score', 151515.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-12-01 15:42:00', 1, '2018-12-01 15:42:00', '2018-12-01 15:42:00');
INSERT INTO `work_score_logs` VALUES (99, 43, 'admin_recharge_score', 151515.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-12-01 15:42:08', 1, '2018-12-01 15:42:08', '2018-12-01 15:42:08');
INSERT INTO `work_score_logs` VALUES (100, 17, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-12-01 15:48:10', 1, '2018-12-01 15:48:10', '2018-12-01 15:48:10');
INSERT INTO `work_score_logs` VALUES (101, 28, 'shop', 1000.00, '会员完成购物', '会员完成购物，购物时间2018-12-01 15:48:15', 1, '2018-12-01 15:48:15', '2018-12-01 15:48:15');
INSERT INTO `work_score_logs` VALUES (102, 4, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-12-01 15:48:19', 1, '2018-12-01 15:48:19', '2018-12-01 15:48:19');
INSERT INTO `work_score_logs` VALUES (103, 48, 'admin_recharge_score', 10000.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-12-01 16:35:02', 1, '2018-12-01 16:35:02', '2018-12-01 16:35:02');
INSERT INTO `work_score_logs` VALUES (104, 44, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-12-03 09:42:11', 1, '2018-12-03 09:42:11', '2018-12-03 09:42:11');
INSERT INTO `work_score_logs` VALUES (105, 49, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-12-03 14:56:59', 1, '2018-12-03 14:56:59', '2018-12-03 14:56:59');
INSERT INTO `work_score_logs` VALUES (106, 2, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-12-03 16:42:29', 1, '2018-12-03 16:42:29', '2018-12-03 16:42:29');
INSERT INTO `work_score_logs` VALUES (107, 2, 'score_shop', 10.00, '积分兑换', '积分兑换商品，购物时间2018-12-03 16:45:13', 1, '2018-12-03 16:45:13', '2018-12-03 16:45:13');
INSERT INTO `work_score_logs` VALUES (108, 2, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-12-03 17:10:59', 1, '2018-12-03 17:10:59', '2018-12-03 17:10:59');
INSERT INTO `work_score_logs` VALUES (109, 2, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-12-03 19:06:26', 1, '2018-12-03 19:06:26', '2018-12-03 19:06:26');
INSERT INTO `work_score_logs` VALUES (110, 4, 'score_shop', 10.00, '积分兑换', '积分兑换商品，购物时间2018-12-04 10:24:05', 1, '2018-12-04 10:24:05', '2018-12-04 10:24:05');
INSERT INTO `work_score_logs` VALUES (111, 4, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2018-12-04 10:24:13', 1, '2018-12-04 10:24:13', '2018-12-04 10:24:13');
INSERT INTO `work_score_logs` VALUES (112, 49, 'admin_recharge_score', 1999.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2018-12-05 14:36:23', 1, '2018-12-05 14:36:23', '2018-12-05 14:36:23');
INSERT INTO `work_score_logs` VALUES (113, 49, 'score_shop', 30.00, '积分兑换', '积分兑换商品，购物时间2018-12-05 14:36:46', 1, '2018-12-05 14:36:46', '2018-12-05 14:36:46');
INSERT INTO `work_score_logs` VALUES (114, 2, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2018-12-06 18:36:16', 1, '2018-12-06 18:36:16', '2018-12-06 18:36:16');
INSERT INTO `work_score_logs` VALUES (115, 2, 'shop', 2.00, '会员完成购物', '会员完成购物，购物时间2019-01-23 17:10:52', 1, '2019-01-23 17:10:52', '2019-01-23 17:10:52');
INSERT INTO `work_score_logs` VALUES (116, 17, 'sign_in', 100.00, '会员签到', '会员签到，签到时间2019-01-25 15:27:47', 1, '2019-01-25 15:27:47', '2019-01-25 15:27:47');
INSERT INTO `work_score_logs` VALUES (117, 1, 'sign_in', 1.00, '会员签到', '会员签到，签到时间2019-01-26 15:54:35', 1, '2019-01-26 15:54:36', '2019-01-26 15:54:36');
INSERT INTO `work_score_logs` VALUES (118, 64, 'admin_recharge_score', 666.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2019-02-22 11:26:03', 1, '2019-02-22 11:26:03', '2019-02-22 11:26:03');
INSERT INTO `work_score_logs` VALUES (119, 2, 'score_shop', 298.00, '积分兑换', '积分兑换商品，购物时间2019-02-22 15:22:36', 1, '2019-02-22 15:22:36', '2019-02-22 15:22:36');
INSERT INTO `work_score_logs` VALUES (120, 64, 'score_shop', 209.00, '积分兑换', '积分兑换商品，购物时间2019-02-23 09:23:22', 1, '2019-02-23 09:23:22', '2019-02-23 09:23:22');
INSERT INTO `work_score_logs` VALUES (121, 64, 'sign_in', 2.00, '会员签到', '会员签到，签到时间2019-02-23 10:11:58', 1, '2019-02-23 10:11:58', '2019-02-23 10:11:58');
INSERT INTO `work_score_logs` VALUES (122, 21, 'admin_recharge_score', 10000.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2019-02-23 16:51:48', 1, '2019-02-23 16:51:48', '2019-02-23 16:51:48');
INSERT INTO `work_score_logs` VALUES (123, 21, 'score_shop', 209.00, '积分兑换', '积分兑换商品，购物时间2019-02-23 17:08:40', 1, '2019-02-23 17:08:40', '2019-02-23 17:08:40');
INSERT INTO `work_score_logs` VALUES (124, 21, 'score_shop', 1.00, '积分兑换', '积分兑换商品，购物时间2019-02-25 21:38:57', 1, '2019-02-25 21:38:57', '2019-02-25 21:38:57');
INSERT INTO `work_score_logs` VALUES (125, 65, 'admin_recharge_score', 120.00, '管理员充值积分', '管理员给会员充值积分, 充值时间2019-02-26 11:26:25', 1, '2019-02-26 11:26:25', '2019-02-26 11:26:25');
INSERT INTO `work_score_logs` VALUES (126, 65, 'sign_in', 2.00, '会员签到', '会员签到，签到时间2019-02-26 11:26:33', 1, '2019-02-26 11:26:33', '2019-02-26 11:26:33');
INSERT INTO `work_score_logs` VALUES (127, 65, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2019-02-26 11:26:52', 1, '2019-02-26 11:26:52', '2019-02-26 11:26:52');
INSERT INTO `work_score_logs` VALUES (128, 48, 'score_shop', 100.00, '积分兑换', '积分兑换商品，购物时间2019-02-26 11:42:36', 1, '2019-02-26 11:42:36', '2019-02-26 11:42:36');
COMMIT;

-- ----------------------------
-- Table structure for work_spec_templates
-- ----------------------------
DROP TABLE IF EXISTS `work_spec_templates`;
CREATE TABLE `work_spec_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品规格模板名称',
  `intro` text COMMENT '商品规格模板简介',
  `content` text COMMENT '商品规格模板内容',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '商品规格模板排序',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_spec_templates
-- ----------------------------
BEGIN;
INSERT INTO `work_spec_templates` VALUES (1, '衣服规格', NULL, '[{\"name\":\"颜色\",\"options\":[\"白色\",\"黑色\"]},{\"name\":\"尺寸\",\"options\":[\"S\",\"M\"]}]', 0, 1, '2018-07-24 10:47:19', '2018-07-24 10:47:19');
INSERT INTO `work_spec_templates` VALUES (2, '颜色尺寸', '', '[{\"name\":\"颜色\",\"options\":[\"红色\",\"绿色\",\"蓝色\"]}]', 0, 0, '2018-07-28 11:47:50', '2018-12-05 17:26:54');
INSERT INTO `work_spec_templates` VALUES (3, '尺寸', '尺寸', '[{\"name\":\"长度\",\"options\":[\"小于50cm\",\"大于50cm\"]}]', 0, 0, '2018-08-24 08:04:42', '2018-09-26 14:06:59');
INSERT INTO `work_spec_templates` VALUES (4, '1', '1', '[{\"name\":\"1\",\"options\":[\"1\"]}]', 0, 0, '2018-09-10 10:10:20', '2018-09-10 10:10:33');
INSERT INTO `work_spec_templates` VALUES (5, '2', '2', '[{\"name\":\"2\",\"options\":[\"2\"]}]', 0, 0, '2018-09-10 10:10:25', '2018-09-10 10:10:33');
INSERT INTO `work_spec_templates` VALUES (6, '测试规格', '测试规范', '[{\"name\":\"测试\",\"options\":[\"测试\"]}]', 0, 0, '2018-09-26 17:04:59', '2018-09-26 17:22:35');
INSERT INTO `work_spec_templates` VALUES (7, '删除规格', '规格', '[{\"name\":\"的\",\"options\":[\"3\"]}]', 0, 0, '2018-11-26 13:37:01', '2018-11-26 13:40:14');
INSERT INTO `work_spec_templates` VALUES (8, '行李箱规格', NULL, '[{\"name\":\"颜色\",\"options\":[\"黑\",\"白\"]},{\"name\":\"尺寸\",\"options\":[\"20寸\",\"24寸\"]}]', 0, 1, '2018-12-05 11:36:20', '2018-12-05 11:36:20');
INSERT INTO `work_spec_templates` VALUES (9, '女包规格', NULL, '[{\"name\":\"颜色\",\"options\":[\"黑\",\"白\"]}]', 0, 1, '2018-12-05 12:54:37', '2018-12-05 12:54:37');
INSERT INTO `work_spec_templates` VALUES (10, '电脑规格', NULL, '[{\"name\":\"颜色\",\"options\":[\"银\",\"白\"]}]', 0, 1, '2018-12-05 16:07:42', '2018-12-05 16:07:42');
INSERT INTO `work_spec_templates` VALUES (11, '手机规格', NULL, '[{\"name\":\"运行内存\",\"options\":[\"6GB\",\"8GB\"]}]', 0, 1, '2018-12-05 16:27:22', '2018-12-05 16:27:22');
INSERT INTO `work_spec_templates` VALUES (12, '家电规格', NULL, '[{\"name\":\"颜色\",\"options\":[\"白色\"]}]', 0, 1, '2018-12-06 12:59:24', '2018-12-06 12:59:24');
INSERT INTO `work_spec_templates` VALUES (13, '母婴规格', NULL, '[{\"name\":\"年龄\",\"options\":[\"3岁以下\"]}]', 0, 1, '2018-12-06 13:39:01', '2018-12-06 13:39:01');
INSERT INTO `work_spec_templates` VALUES (14, '颜色尺寸', NULL, '[{\"name\":\"颜色\",\"options\":[\"红色\",\"蓝色\"]},{\"name\":\"尺寸\",\"options\":[\"1米\",\"2米\"]}]', 0, 1, '2019-02-23 16:52:30', '2019-02-23 16:52:30');
INSERT INTO `work_spec_templates` VALUES (15, '烟', '翻译的成功和 v 北京开幕了， ', '[{\"name\":\"长烟\",\"options\":[\"20\"]},{\"name\":\"短烟\",\"options\":[\"10\"]},{\"name\":\"细烟\",\"options\":[\"5\"]}]', 0, 0, '2019-02-24 14:17:28', '2019-02-24 14:21:31');
INSERT INTO `work_spec_templates` VALUES (16, '烟', '试试', '[{\"name\":\"烟\",\"options\":[\"长烟\",\"短烟\",\"细烟\"]},{\"name\":\"品牌\",\"options\":[\"中华\",\"芙蓉王\"]}]', 0, 1, '2019-02-24 14:23:26', '2019-02-24 14:23:26');
COMMIT;

-- ----------------------------
-- Table structure for work_timed_task_logs
-- ----------------------------
DROP TABLE IF EXISTS `work_timed_task_logs`;
CREATE TABLE `work_timed_task_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) NOT NULL COMMENT '任务id',
  `warn_code` tinyint(4) DEFAULT '0' COMMENT '警告码；0执行成功',
  `desc` varchar(255) DEFAULT NULL COMMENT '任务执行情况描述',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for work_timed_tasks
-- ----------------------------
DROP TABLE IF EXISTS `work_timed_tasks`;
CREATE TABLE `work_timed_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '定时任务名称',
  `desc` text NOT NULL COMMENT '定时任务描述',
  `interval_type` varchar(30) NOT NULL DEFAULT 'custom' COMMENT '间隔类型',
  `interval_value` int(11) NOT NULL COMMENT '间隔值',
  `handler` varchar(50) NOT NULL COMMENT '队列处理类名',
  `next_time` datetime NOT NULL COMMENT '下次执行时间',
  `action_num` int(11) DEFAULT '0' COMMENT '执行次数',
  `token` varchar(255) DEFAULT NULL COMMENT '用于确定最新任务情况',
  `status` tinyint(1) DEFAULT '1' COMMENT '任务开关：1开启2关闭',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_timed_tasks
-- ----------------------------
BEGIN;
INSERT INTO `work_timed_tasks` VALUES (1, '自动取消订单', '每天检测一次，对下订单满规定天数仍未支付的订单，系统自动取消该订单。', 'day', 1, 'CancelOrders', '2019-02-14 12:00:00', 0, '5c64dfc62d501', 1, 1, '2018-07-19 22:07:21', '2018-09-26 17:51:51');
INSERT INTO `work_timed_tasks` VALUES (2, '自动删除订单', '每天检测一次，对已取消的订单满规定天数后，系统自动删除该订单。', 'day', 1, 'DeleteOrders', '2019-02-14 12:00:00', 0, '5c64e035022e2', 1, 1, '2018-07-19 22:11:59', '2018-09-26 17:51:51');
INSERT INTO `work_timed_tasks` VALUES (3, '自动签收订单', '每天检测一次，对已发货的订单满规定天数会员仍未进行签收的订单，系统自动签收该订单。', 'day', 1, 'SignOrders', '2018-09-27 00:00:00', 0, '5bab56b774559', 2, 1, '2018-07-19 22:14:49', '2018-09-26 17:51:51');
INSERT INTO `work_timed_tasks` VALUES (4, '团购处理时限', '对已到结束时间，仍未完成的拼团的订单，自动结束该团。', 'minute', 1, 'GroupBuyTimeLimits', '2018-09-27 10:45:00', 0, '5bab56b773e09', 2, 1, '2018-07-19 22:26:17', '2018-09-26 17:51:51');
INSERT INTO `work_timed_tasks` VALUES (5, '团购自动退款', '每天检测一次，对团购中未完成拼团的订单，自动退款。', 'day', 1, 'GroupBuyReturnMoney', '2018-09-27 08:00:00', 0, '5bab56b77307e', 2, 1, '2018-07-19 22:33:04', '2018-09-26 17:51:51');
COMMIT;

-- ----------------------------
-- Table structure for work_user_accounts
-- ----------------------------
DROP TABLE IF EXISTS `work_user_accounts`;
CREATE TABLE `work_user_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(50) NOT NULL COMMENT '登录的唯一标识符',
  `password` varchar(255) NOT NULL COMMENT '登录密码',
  `pay_password` varchar(255) DEFAULT NULL COMMENT '支付密码',
  `qq_openid` varchar(255) DEFAULT NULL COMMENT 'qq的appid',
  `wechat_openid` varchar(255) DEFAULT NULL COMMENT '微信的appid',
  `user_id` bigint(20) DEFAULT '0' COMMENT '用户ID',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态:1正常0已删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user_accounts
-- ----------------------------
BEGIN;
INSERT INTO `work_user_accounts` VALUES (1, '18888888888', 'b5305e8c4c5e08c246943fe736701525', 'e6297b585db794e177808f8953b46669', '', 'ol1SowgRCWMtOwePHU58X-dbPFTs', 1, 1, '2018-11-10 09:28:14', '2018-11-24 17:00:58');
INSERT INTO `work_user_accounts` VALUES (2, '15071357527', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 2, 1, '2018-11-10 13:43:52', '2019-02-22 11:37:15');
INSERT INTO `work_user_accounts` VALUES (3, '15071350005', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 3, 1, '2018-11-10 15:04:28', '2018-11-10 15:07:17');
INSERT INTO `work_user_accounts` VALUES (4, '13874930708', 'bf9b5ff11f7fb14a9ba69024d625d5b9', 'b5305e8c4c5e08c246943fe736701525', '', '', 4, 1, '2018-11-10 15:06:37', '2018-12-04 17:15:45');
INSERT INTO `work_user_accounts` VALUES (5, '15071350006', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 5, 1, '2018-11-10 16:00:30', '2018-11-10 16:00:43');
INSERT INTO `work_user_accounts` VALUES (22, '13874931111', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 22, 1, '2018-11-17 14:17:32', '2018-11-17 14:19:31');
INSERT INTO `work_user_accounts` VALUES (6, '15200597371', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 6, 1, '2018-11-10 16:42:53', '2018-11-10 16:42:53');
INSERT INTO `work_user_accounts` VALUES (7, '15675143940', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 7, 1, '2018-11-10 17:38:14', '2018-11-27 14:47:46');
INSERT INTO `work_user_accounts` VALUES (8, '18175974828', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 8, 1, '2018-11-12 11:17:55', '2018-11-12 11:18:13');
INSERT INTO `work_user_accounts` VALUES (9, '15071357528', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 9, 1, '2018-11-12 12:45:53', '2018-11-12 12:46:07');
INSERT INTO `work_user_accounts` VALUES (10, '15580841403', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 10, 1, '2018-11-12 14:27:08', '2018-11-12 14:27:19');
INSERT INTO `work_user_accounts` VALUES (11, '17712345678', 'b5305e8c4c5e08c246943fe736701525', NULL, '', 'ol1SowgrO0TswBMCU8CgFchbkLlA', 11, 1, '2018-11-12 15:08:12', '2018-11-12 15:08:12');
INSERT INTO `work_user_accounts` VALUES (12, '13170308670', '58ea7ee5188b7ea946b66cff50bf5e82', NULL, '', 'ol1Sowv6Pftwf392vjMVJ4FGNGm8', 12, 1, '2018-11-12 17:19:46', '2018-11-12 17:19:46');
INSERT INTO `work_user_accounts` VALUES (13, '15574320801', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 13, 1, '2018-11-12 22:35:49', '2018-11-15 22:27:38');
INSERT INTO `work_user_accounts` VALUES (14, '18711869150', '18567eba4e05ea7282f98dd78a7b262b', 'b5305e8c4c5e08c246943fe736701525', '', 'ol1SowuRPvM0t3L9PpgmG1YfgjSk', 14, 1, '2018-11-14 10:19:52', '2019-02-23 16:37:46');
INSERT INTO `work_user_accounts` VALUES (15, '13973131356', 'e6297b585db794e177808f8953b46669', 'e6297b585db794e177808f8953b46669', '', 'ol1SowiG0I5lNWFy1qWuLcLp_ZwU', 15, 1, '2018-11-14 11:13:22', '2019-01-29 16:44:32');
INSERT INTO `work_user_accounts` VALUES (16, '13787024881', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 16, 1, '2018-11-14 14:00:18', '2018-11-14 14:00:18');
INSERT INTO `work_user_accounts` VALUES (17, '13874930001', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', 'ol1Sowr-jXVXF5j0mqe9d6wgOni4', 17, 1, '2018-11-15 14:52:24', '2018-12-04 17:16:05');
INSERT INTO `work_user_accounts` VALUES (18, '18570322162', '02bc8576b345cf400f15f41c72dfec10', NULL, '', 'ol1SowjhhRIP-bgZnHz_xxwpG7q8', 18, 1, '2018-11-16 10:18:07', '2018-11-16 10:18:07');
INSERT INTO `work_user_accounts` VALUES (19, '17608491856', 'e5b639ee055d05b6165e940aae79a87a', NULL, '', '', 19, 1, '2018-11-16 17:17:22', '2018-11-16 17:17:22');
INSERT INTO `work_user_accounts` VALUES (20, '13117512114', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 20, 1, '2018-11-17 11:59:22', '2018-11-17 11:59:31');
INSERT INTO `work_user_accounts` VALUES (21, '15674875874', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 21, 1, '2018-11-17 13:59:12', '2019-02-23 16:50:26');
INSERT INTO `work_user_accounts` VALUES (23, '13874932222', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 23, 1, '2018-11-17 14:19:54', '2018-11-17 15:38:49');
INSERT INTO `work_user_accounts` VALUES (24, '13874930002', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 24, 1, '2018-11-17 15:21:32', '2018-11-17 15:23:33');
INSERT INTO `work_user_accounts` VALUES (25, '13874933333', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 25, 1, '2018-11-17 15:39:17', '2018-11-17 16:05:20');
INSERT INTO `work_user_accounts` VALUES (26, '15802542997', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', 'ol1Sown_wzzHDV0Sdg_jCmSzo_yE', 26, 1, '2018-11-17 15:49:36', '2018-11-30 12:03:51');
INSERT INTO `work_user_accounts` VALUES (36, '13874930003', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 36, 1, '2018-11-24 14:10:01', '2018-11-24 14:10:01');
INSERT INTO `work_user_accounts` VALUES (27, '15111063940', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 27, 1, '2018-11-17 16:32:15', '2018-11-17 16:32:15');
INSERT INTO `work_user_accounts` VALUES (28, '13755195588', 'd6c8d635e820f2c026c410242f09b5a2', 'b5305e8c4c5e08c246943fe736701525', '', '', 28, 1, '2018-11-19 12:25:10', '2018-11-20 12:51:16');
INSERT INTO `work_user_accounts` VALUES (29, '15200911999', 'b5305e8c4c5e08c246943fe736701525', NULL, '', 'ol1SowtkR2Nkj23CZPM86WiwgQnw', 29, 1, '2018-11-19 12:51:39', '2018-11-19 12:51:39');
INSERT INTO `work_user_accounts` VALUES (30, '18670012031', 'b5305e8c4c5e08c246943fe736701525', NULL, '', 'ol1Sowv84bW_a5tYa5P_1nFowl0k', 30, 1, '2018-11-19 16:28:19', '2018-11-19 16:28:19');
INSERT INTO `work_user_accounts` VALUES (31, '13874930009', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 31, 1, '2018-11-19 17:32:59', '2018-11-20 15:26:17');
INSERT INTO `work_user_accounts` VALUES (32, '19000000001', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 32, 1, '2018-11-20 14:07:51', '2018-11-26 10:04:37');
INSERT INTO `work_user_accounts` VALUES (33, '12312312122', 'e6297b585db794e177808f8953b46669', NULL, '', '', 33, 1, '2018-11-20 16:57:45', '2018-11-20 16:57:45');
INSERT INTO `work_user_accounts` VALUES (38, '13874930010', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 38, 1, '2018-11-26 16:18:07', '2018-11-26 16:18:07');
INSERT INTO `work_user_accounts` VALUES (34, '18071357528', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 34, 1, '2018-11-21 09:09:56', '2018-11-21 09:10:49');
INSERT INTO `work_user_accounts` VALUES (35, '18900734438', '880c94afacf313d0a44a7cd5e9a105ba', NULL, '', '', 35, 1, '2018-11-22 10:18:03', '2018-11-22 10:18:03');
INSERT INTO `work_user_accounts` VALUES (37, '15629183379', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 37, 1, '2018-11-26 09:32:37', '2018-11-26 09:34:08');
INSERT INTO `work_user_accounts` VALUES (39, '18390926485', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 39, 1, '2018-11-26 19:23:04', '2018-11-26 19:23:04');
INSERT INTO `work_user_accounts` VALUES (40, '13874930004', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 40, 1, '2018-11-27 10:22:03', '2018-11-27 10:24:03');
INSERT INTO `work_user_accounts` VALUES (41, '13874930005', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 41, 1, '2018-11-27 10:22:47', '2018-11-27 10:22:56');
INSERT INTO `work_user_accounts` VALUES (42, '15675143950', 'e6297b585db794e177808f8953b46669', 'b5305e8c4c5e08c246943fe736701525', '', '', 42, 1, '2018-11-27 14:30:19', '2018-11-27 14:31:40');
INSERT INTO `work_user_accounts` VALUES (43, '18676798664', 'b5305e8c4c5e08c246943fe736701525', 'dca004a21b5ff10deca18ab29fd2a4ca', '', '', 43, 1, '2018-11-27 18:26:57', '2019-02-23 17:07:39');
INSERT INTO `work_user_accounts` VALUES (44, '13874930006', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 44, 1, '2018-11-28 15:28:58', '2018-11-28 15:29:06');
INSERT INTO `work_user_accounts` VALUES (45, '18390926488', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 45, 1, '2018-11-28 17:35:38', '2018-11-28 17:35:38');
INSERT INTO `work_user_accounts` VALUES (46, '15071350000', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 46, 1, '2018-11-29 16:38:18', '2018-11-29 16:38:29');
INSERT INTO `work_user_accounts` VALUES (47, '16000000000', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 47, 1, '2018-11-30 11:28:49', '2018-11-30 11:28:49');
INSERT INTO `work_user_accounts` VALUES (48, '18630135988', '04517952767d2452f5f2071938af61f7', '370126826245aae738d5c847b71ec45a', '', 'ol1Sowvg5NUxoi-CMZZO4uQW_-iM', 48, 1, '2018-12-01 15:03:02', '2019-02-26 11:42:09');
INSERT INTO `work_user_accounts` VALUES (49, '16666666666', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', 'ol1SowpeIhwGPQkpqc7wLAH4APTs', 49, 1, '2018-12-03 13:42:17', '2019-02-22 11:28:17');
INSERT INTO `work_user_accounts` VALUES (50, '13973131333', 'e6297b585db794e177808f8953b46669', NULL, '', '', 50, 1, '2018-12-04 14:02:20', '2018-12-04 14:02:20');
INSERT INTO `work_user_accounts` VALUES (51, '17352820001', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 51, 1, '2018-12-04 14:07:35', '2018-12-04 14:07:35');
INSERT INTO `work_user_accounts` VALUES (52, '13973131311', 'e6297b585db794e177808f8953b46669', NULL, '', '', 52, 1, '2018-12-04 14:11:54', '2018-12-04 14:11:54');
INSERT INTO `work_user_accounts` VALUES (53, '13973131555', 'e6297b585db794e177808f8953b46669', NULL, '', '', 53, 1, '2018-12-04 14:13:04', '2018-12-04 14:13:19');
INSERT INTO `work_user_accounts` VALUES (54, '13973131366', 'e6297b585db794e177808f8953b46669', 'e6297b585db794e177808f8953b46669', '', '', 54, 1, '2018-12-04 14:14:09', '2018-12-04 14:14:32');
INSERT INTO `work_user_accounts` VALUES (55, '13327219279', '58ea7ee5188b7ea946b66cff50bf5e82', NULL, '', '', 55, 1, '2018-12-04 14:14:58', '2018-12-04 14:14:58');
INSERT INTO `work_user_accounts` VALUES (56, '18166198431', '828e83dfc23b171078d5ee016c944d04', NULL, '', '', 56, 1, '2018-12-05 09:51:56', '2018-12-05 09:51:56');
INSERT INTO `work_user_accounts` VALUES (57, '18975130026', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 57, 1, '2018-12-05 19:00:00', '2018-12-05 19:00:00');
INSERT INTO `work_user_accounts` VALUES (58, '15273967010', 'b5305e8c4c5e08c246943fe736701525', NULL, '', 'ol1SowoUaZXWN-TvUJFfbd0EzB1s', 58, 1, '2018-12-05 20:23:41', '2018-12-05 20:23:41');
INSERT INTO `work_user_accounts` VALUES (59, '12345678911', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 59, 1, '2019-01-24 14:58:07', '2019-01-24 14:58:07');
INSERT INTO `work_user_accounts` VALUES (60, '15073689110', 'b5305e8c4c5e08c246943fe736701525', NULL, '', '', 60, 1, '2019-02-11 11:33:31', '2019-02-11 11:33:31');
INSERT INTO `work_user_accounts` VALUES (61, '15211042188', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 61, 1, '2019-02-13 15:41:32', '2019-02-13 15:41:50');
INSERT INTO `work_user_accounts` VALUES (62, '12000000000', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 62, 1, '2019-02-14 17:55:51', '2019-02-14 17:56:03');
INSERT INTO `work_user_accounts` VALUES (63, '12000000001', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 63, 1, '2019-02-14 17:59:45', '2019-02-14 18:00:00');
INSERT INTO `work_user_accounts` VALUES (64, '18229860977', 'b5305e8c4c5e08c246943fe736701525', '1848536007c1f98aaf10d368a25dba5b', '', '', 64, 1, '2019-02-22 11:02:25', '2019-02-22 11:28:14');
INSERT INTO `work_user_accounts` VALUES (65, '15273060636', 'fe5c837d2d3f1132a08e946f30085824', '58ea7ee5188b7ea946b66cff50bf5e82', '', '', 65, 1, '2019-02-22 13:12:12', '2019-02-26 10:53:35');
INSERT INTO `work_user_accounts` VALUES (66, '15071350001', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', 66, 1, '2019-02-23 08:36:04', '2019-02-23 08:37:21');
COMMIT;

-- ----------------------------
-- Table structure for work_user_asset_logs
-- ----------------------------
DROP TABLE IF EXISTS `work_user_asset_logs`;
CREATE TABLE `work_user_asset_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `asset_type` varchar(255) NOT NULL COMMENT '资产类别',
  `change_type` varchar(255) NOT NULL COMMENT '资产变动类别',
  `change_money` decimal(10,2) NOT NULL COMMENT '资产变动金额',
  `intro` text NOT NULL COMMENT '资产日志简介',
  `desc` text COMMENT '资产日志详情',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user_asset_logs
-- ----------------------------
BEGIN;
INSERT INTO `work_user_asset_logs` VALUES (1, 1, 'money', 'user_money_recharge', 12342355.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-10 09:28:42', '2018-11-10 09:28:42');
INSERT INTO `work_user_asset_logs` VALUES (2, 2, 'money', 'user_money_recharge', 5000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-10 14:44:55', '2018-11-10 14:44:55');
INSERT INTO `work_user_asset_logs` VALUES (3, 3, 'money', 'user_money_recharge', 20000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-10 15:04:38', '2018-11-10 15:04:38');
INSERT INTO `work_user_asset_logs` VALUES (4, 3, 'money', 'user_pay', 129.00, '购物支付【N2018111015072359604】', '会员购物扣款，订单号：N2018111015072359604', 1, '2018-11-10 15:07:34', '2018-11-10 15:07:34');
INSERT INTO `work_user_asset_logs` VALUES (5, 2, 'money', 'user_pay', 860.00, '购物支付【N2018111015094750069】', '会员购物扣款，订单号：N2018111015094750069', 1, '2018-11-10 15:10:18', '2018-11-10 15:10:18');
INSERT INTO `work_user_asset_logs` VALUES (6, 2, 'money', 'user_money_recharge', 0.01, '会员钱包充值', '会员通过第三方对钱包进行充值', 1, '2018-11-10 15:19:55', '2018-11-10 15:19:55');
INSERT INTO `work_user_asset_logs` VALUES (7, 2, 'money', 'user_pay', 10.00, '购物支付【N2018111015260494969】', '会员购物扣款，订单号：N2018111015260494969', 1, '2018-11-10 15:26:17', '2018-11-10 15:26:17');
INSERT INTO `work_user_asset_logs` VALUES (8, 2, 'money', 'user_money_recharge', 0.01, '会员钱包充值', '会员通过第三方对钱包进行充值', 1, '2018-11-10 15:33:13', '2018-11-10 15:33:13');
INSERT INTO `work_user_asset_logs` VALUES (9, 1, 'money', 'user_money_recharge', 0.01, '会员钱包充值', '会员通过第三方对钱包进行充值', 1, '2018-11-10 15:49:49', '2018-11-10 15:49:49');
INSERT INTO `work_user_asset_logs` VALUES (10, 2, 'money', 'user_money_recharge', 0.01, '会员钱包充值', '会员通过第三方对钱包进行充值', 1, '2018-11-10 15:50:23', '2018-11-10 15:50:23');
INSERT INTO `work_user_asset_logs` VALUES (11, 2, 'money', 'user_money_recharge', 0.01, '会员钱包充值', '会员通过第三方对钱包进行充值', 1, '2018-11-10 15:59:07', '2018-11-10 15:59:07');
INSERT INTO `work_user_asset_logs` VALUES (12, 4, 'money', 'user_money_recharge', 1000000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-10 16:39:50', '2018-11-10 16:39:50');
INSERT INTO `work_user_asset_logs` VALUES (13, 7, 'money', 'user_money_recharge', 1000000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-10 18:38:59', '2018-11-10 18:38:59');
INSERT INTO `work_user_asset_logs` VALUES (14, 7, 'money', 'user_pay', 129.00, '购物支付【N2018111018395033027】', '会员购物扣款，订单号：N2018111018395033027', 1, '2018-11-10 18:39:57', '2018-11-10 18:39:57');
INSERT INTO `work_user_asset_logs` VALUES (15, 7, 'money', 'user_pay', 129.00, '购物支付【N2018111018392565960】', '会员购物扣款，订单号：N2018111018392565960', 1, '2018-11-10 18:40:06', '2018-11-10 18:40:06');
INSERT INTO `work_user_asset_logs` VALUES (16, 2, 'money', 'user_pay', 20.00, '购物支付【N2018111209240631039】', '会员购物扣款，订单号：N2018111209240631039', 1, '2018-11-12 09:24:16', '2018-11-12 09:24:16');
INSERT INTO `work_user_asset_logs` VALUES (17, 8, 'money', 'user_money_recharge', 100000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-12 11:19:01', '2018-11-12 11:19:01');
INSERT INTO `work_user_asset_logs` VALUES (18, 8, 'money', 'user_pay', 542.00, '购物支付【N2018111211203530483】', '会员购物扣款，订单号：N2018111211203530483', 1, '2018-11-12 11:21:02', '2018-11-12 11:21:02');
INSERT INTO `work_user_asset_logs` VALUES (19, 9, 'money', 'user_money_recharge', 2000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-12 13:42:24', '2018-11-12 13:42:24');
INSERT INTO `work_user_asset_logs` VALUES (20, 9, 'money', 'user_pay', 225.00, '购物支付【N2018111213463151961】', '会员购物扣款，订单号：N2018111213463151961', 1, '2018-11-12 13:46:42', '2018-11-12 13:46:42');
INSERT INTO `work_user_asset_logs` VALUES (21, 9, 'money', 'user_pay', 225.00, '购物支付【N2018111214484555517】', '会员购物扣款，订单号：N2018111214484555517', 1, '2018-11-12 14:48:46', '2018-11-12 14:48:46');
INSERT INTO `work_user_asset_logs` VALUES (22, 9, 'money', 'user_pay', 225.00, '购物支付【N2018111214492293059】', '会员购物扣款，订单号：N2018111214492293059', 1, '2018-11-12 14:49:22', '2018-11-12 14:49:22');
INSERT INTO `work_user_asset_logs` VALUES (23, 9, 'money', 'user_pay', 225.00, '购物支付【N2018111215504169401】', '会员购物扣款，订单号：N2018111215504169401', 1, '2018-11-12 15:50:41', '2018-11-12 15:50:41');
INSERT INTO `work_user_asset_logs` VALUES (24, 9, 'money', 'user_pay', 225.00, '购物支付【N2018111215505088666】', '会员购物扣款，订单号：N2018111215505088666', 1, '2018-11-12 15:50:51', '2018-11-12 15:50:51');
INSERT INTO `work_user_asset_logs` VALUES (25, 9, 'money', 'user_pay', 225.00, '购物支付【N2018111215505860048】', '会员购物扣款，订单号：N2018111215505860048', 1, '2018-11-12 15:50:58', '2018-11-12 15:50:58');
INSERT INTO `work_user_asset_logs` VALUES (26, 1, 'money', 'user_pay', 562.00, '购物支付【N2018111216102235077】', '会员购物扣款，订单号：N2018111216102235077', 1, '2018-11-12 16:10:29', '2018-11-12 16:10:29');
INSERT INTO `work_user_asset_logs` VALUES (27, 9, 'money', 'user_pay', 225.00, '购物支付【N2018111216122010380】', '会员购物扣款，订单号：N2018111216122010380', 1, '2018-11-12 16:12:21', '2018-11-12 16:12:21');
INSERT INTO `work_user_asset_logs` VALUES (28, 9, 'money', 'user_pay', 225.00, '购物支付【N2018111216123083002】', '会员购物扣款，订单号：N2018111216123083002', 1, '2018-11-12 16:12:30', '2018-11-12 16:12:30');
INSERT INTO `work_user_asset_logs` VALUES (29, 8, 'money', 'user_pay', 200.00, '购物支付【N2018111217270753601】', '会员购物扣款，订单号：N2018111217270753601', 1, '2018-11-12 17:27:21', '2018-11-12 17:27:21');
INSERT INTO `work_user_asset_logs` VALUES (30, 4, 'money', 'user_pay', 200.00, '购物支付【N2018111217313273864】', '会员购物扣款，订单号：N2018111217313273864', 1, '2018-11-12 17:31:37', '2018-11-12 17:31:37');
INSERT INTO `work_user_asset_logs` VALUES (31, 4, 'money', 'user_pay', 200.00, '购物支付【N2018111217324175106】', '会员购物扣款，订单号：N2018111217324175106', 1, '2018-11-12 17:32:45', '2018-11-12 17:32:45');
INSERT INTO `work_user_asset_logs` VALUES (32, 4, 'money', 'user_pay', 200.00, '购物支付【N2018111217325527373】', '会员购物扣款，订单号：N2018111217325527373', 1, '2018-11-12 17:32:58', '2018-11-12 17:32:58');
INSERT INTO `work_user_asset_logs` VALUES (33, 4, 'money', 'user_pay', 200.00, '购物支付【N2018111217353480997】', '会员购物扣款，订单号：N2018111217353480997', 1, '2018-11-12 17:35:41', '2018-11-12 17:35:41');
INSERT INTO `work_user_asset_logs` VALUES (34, 2, 'money', 'user_pay', 40.00, '购物支付【N2018111217534690827】', '会员购物扣款，订单号：N2018111217534690827', 1, '2018-11-12 17:53:56', '2018-11-12 17:53:56');
INSERT INTO `work_user_asset_logs` VALUES (35, 9, 'money', 'user_money_recharge', 2000000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-13 14:24:41', '2018-11-13 14:24:41');
INSERT INTO `work_user_asset_logs` VALUES (36, 2, 'money', 'user_money_recharge', 25000000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-13 14:25:02', '2018-11-13 14:25:02');
INSERT INTO `work_user_asset_logs` VALUES (37, 4, 'money', 'user_pay', 20.00, '购物支付【N2018111709322143170】', '会员购物扣款，订单号：N2018111709322143170', 1, '2018-11-17 09:32:28', '2018-11-17 09:32:28');
INSERT INTO `work_user_asset_logs` VALUES (38, 1, 'money', 'user_pay', 20.00, '购物支付【N2018111709524687457】', '会员购物扣款，订单号：N2018111709524687457', 1, '2018-11-17 09:52:58', '2018-11-17 09:52:58');
INSERT INTO `work_user_asset_logs` VALUES (39, 20, 'money', 'user_money_recharge', 10000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-17 12:00:18', '2018-11-17 12:00:18');
INSERT INTO `work_user_asset_logs` VALUES (40, 1, 'money', 'user_pay', 120.00, '购物支付【N2018111714285409442】', '会员购物扣款，订单号：N2018111714285409442', 1, '2018-11-17 14:28:58', '2018-11-17 14:28:58');
INSERT INTO `work_user_asset_logs` VALUES (41, 1, 'money', 'user_pay', 20.00, '购物支付【N2018111714214184119】', '会员购物扣款，订单号：N2018111714214184119', 1, '2018-11-17 14:29:20', '2018-11-17 14:29:20');
INSERT INTO `work_user_asset_logs` VALUES (42, 1, 'money', 'user_pay', 20.00, '购物支付【N2018111714310285508】', '会员购物扣款，订单号：N2018111714310285508', 1, '2018-11-17 14:31:19', '2018-11-17 14:31:19');
INSERT INTO `work_user_asset_logs` VALUES (43, 1, 'money', 'user_pay', 20.00, '购物支付【N2018111714315319790】', '会员购物扣款，订单号：N2018111714315319790', 1, '2018-11-17 14:32:05', '2018-11-17 14:32:05');
INSERT INTO `work_user_asset_logs` VALUES (44, 1, 'money', 'user_pay', 20.00, '购物支付【N2018111714403438008】', '会员购物扣款，订单号：N2018111714403438008', 1, '2018-11-17 14:40:39', '2018-11-17 14:40:39');
INSERT INTO `work_user_asset_logs` VALUES (45, 1, 'money', 'user_pay', 20.00, '购物支付【N2018111714413154904】', '会员购物扣款，订单号：N2018111714413154904', 1, '2018-11-17 14:41:36', '2018-11-17 14:41:36');
INSERT INTO `work_user_asset_logs` VALUES (46, 1, 'money', 'user_pay', 20.00, '购物支付【N2018111714395871897】', '会员购物扣款，订单号：N2018111714395871897', 1, '2018-11-17 14:41:45', '2018-11-17 14:41:45');
INSERT INTO `work_user_asset_logs` VALUES (47, 1, 'money', 'user_pay', 20.00, '购物支付【N2018111714385279906】', '会员购物扣款，订单号：N2018111714385279906', 1, '2018-11-17 14:42:26', '2018-11-17 14:42:26');
INSERT INTO `work_user_asset_logs` VALUES (48, 1, 'money', 'user_pay', 129.00, '购物支付【N2018111714423510157】', '会员购物扣款，订单号：N2018111714423510157', 1, '2018-11-17 14:42:39', '2018-11-17 14:42:39');
INSERT INTO `work_user_asset_logs` VALUES (49, 1, 'money', 'user_pay', 129.00, '购物支付【N2018111514514842437】', '会员购物扣款，订单号：N2018111514514842437', 1, '2018-11-17 14:42:51', '2018-11-17 14:42:51');
INSERT INTO `work_user_asset_logs` VALUES (50, 24, 'money', 'user_money_recharge', 1.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-17 15:21:46', '2018-11-17 15:21:46');
INSERT INTO `work_user_asset_logs` VALUES (51, 24, 'money', 'user_pay', 1.00, '购物支付【N2018111715231974939】', '会员购物扣款，订单号：N2018111715231974939', 1, '2018-11-17 15:23:40', '2018-11-17 15:23:40');
INSERT INTO `work_user_asset_logs` VALUES (52, 17, 'money', 'user_money_recharge', 100000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-17 15:35:21', '2018-11-17 15:35:21');
INSERT INTO `work_user_asset_logs` VALUES (53, 17, 'money', 'user_pay', 20.00, '购物支付【N2018111715342190344】', '会员购物扣款，订单号：N2018111715342190344', 1, '2018-11-17 15:35:27', '2018-11-17 15:35:27');
INSERT INTO `work_user_asset_logs` VALUES (54, 8, 'money', 'user_pay', 101.00, '购物支付【N2018111715445342578】', '会员购物扣款，订单号：N2018111715445342578', 1, '2018-11-17 15:45:01', '2018-11-17 15:45:01');
INSERT INTO `work_user_asset_logs` VALUES (55, 17, 'money', 'user_drawcash', 111.00, '申请提现扣款【D2018111716071093025】', '会员申请提现，系统自动扣款，提现申请单号【D2018111716071093025】', 1, '2018-11-17 16:07:10', '2018-11-17 16:07:10');
INSERT INTO `work_user_asset_logs` VALUES (56, 17, 'money', 'user_pay', 1.50, '购物支付【N2018111715555862219】', '会员购物扣款，订单号：N2018111715555862219', 1, '2018-11-17 16:08:24', '2018-11-17 16:08:24');
INSERT INTO `work_user_asset_logs` VALUES (57, 17, 'money', 'user_pay', 129.00, '购物支付【N2018111514524681927】', '会员购物扣款，订单号：N2018111514524681927', 1, '2018-11-17 16:08:33', '2018-11-17 16:08:33');
INSERT INTO `work_user_asset_logs` VALUES (58, 26, 'money', 'user_money_recharge', 20.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-17 16:18:23', '2018-11-17 16:18:23');
INSERT INTO `work_user_asset_logs` VALUES (59, 26, 'money', 'user_pay', 20.00, '购物支付【N2018111716180262927】', '会员购物扣款，订单号：N2018111716180262927', 1, '2018-11-17 16:18:31', '2018-11-17 16:18:31');
INSERT INTO `work_user_asset_logs` VALUES (60, 4, 'money', 'user_pay', 129.00, '购物支付【N2018111717013128277】', '会员购物扣款，订单号：N2018111717013128277', 1, '2018-11-17 17:01:37', '2018-11-17 17:01:37');
INSERT INTO `work_user_asset_logs` VALUES (61, 8, 'money', 'user_pay', 451.50, '购物支付【N2018111715535162443】', '会员购物扣款，订单号：N2018111715535162443', 1, '2018-11-17 17:02:21', '2018-11-17 17:02:21');
INSERT INTO `work_user_asset_logs` VALUES (62, 4, 'money', 'user_pay', 20.00, '购物支付【N2018111717051106436】', '会员购物扣款，订单号：N2018111717051106436', 1, '2018-11-17 17:05:19', '2018-11-17 17:05:19');
INSERT INTO `work_user_asset_logs` VALUES (63, 13, 'money', 'user_money_recharge', 10000000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-19 11:56:12', '2018-11-19 11:56:12');
INSERT INTO `work_user_asset_logs` VALUES (64, 13, 'money', 'user_pay', 20.00, '购物支付【N2018111911584150567】', '会员购物扣款，订单号：N2018111911584150567', 1, '2018-11-19 11:58:47', '2018-11-19 11:58:47');
INSERT INTO `work_user_asset_logs` VALUES (65, 13, 'money', 'user_pay', 20.00, '购物支付【N2018111913360600312】', '会员购物扣款，订单号：N2018111913360600312', 1, '2018-11-19 13:36:22', '2018-11-19 13:36:22');
INSERT INTO `work_user_asset_logs` VALUES (66, 17, 'money', 'user_pay', 20.00, '购物支付【N2018111914570254249】', '会员购物扣款，订单号：N2018111914570254249', 1, '2018-11-19 14:57:18', '2018-11-19 14:57:18');
INSERT INTO `work_user_asset_logs` VALUES (67, 17, 'money', 'user_pay', 20.00, '购物支付【N2018111915542137012】', '会员购物扣款，订单号：N2018111915542137012', 1, '2018-11-19 15:54:27', '2018-11-19 15:54:27');
INSERT INTO `work_user_asset_logs` VALUES (68, 17, 'money', 'user_pay', 129.00, '购物支付【N2018111915595173491】', '会员购物扣款，订单号：N2018111915595173491', 1, '2018-11-19 15:59:59', '2018-11-19 15:59:59');
INSERT INTO `work_user_asset_logs` VALUES (69, 4, 'money', 'user_pay', 129.00, '购物支付【N2018111916011282423】', '会员购物扣款，订单号：N2018111916011282423', 1, '2018-11-19 16:01:18', '2018-11-19 16:01:18');
INSERT INTO `work_user_asset_logs` VALUES (70, 17, 'money', 'user_pay', 129.00, '购物支付【N2018111916031434377】', '会员购物扣款，订单号：N2018111916031434377', 1, '2018-11-19 16:03:20', '2018-11-19 16:03:20');
INSERT INTO `work_user_asset_logs` VALUES (71, 2, 'money', 'user_pay', 20.00, '购物支付【N2018112009503362061】', '会员购物扣款，订单号：N2018112009503362061', 1, '2018-11-20 09:50:41', '2018-11-20 09:50:41');
INSERT INTO `work_user_asset_logs` VALUES (72, 2, 'money', 'user_pay', 562.00, '购物支付【N2018112009522141157】', '会员购物扣款，订单号：N2018112009522141157', 1, '2018-11-20 09:52:37', '2018-11-20 09:52:37');
INSERT INTO `work_user_asset_logs` VALUES (73, 2, 'money', 'user_money_recharge', 0.01, '会员钱包充值', '会员通过第三方对钱包进行充值', 1, '2018-11-20 10:09:00', '2018-11-20 10:09:00');
INSERT INTO `work_user_asset_logs` VALUES (74, 2, 'money', 'user_money_recharge', 0.01, '会员钱包充值', '会员通过第三方对钱包进行充值', 1, '2018-11-20 10:14:22', '2018-11-20 10:14:22');
INSERT INTO `work_user_asset_logs` VALUES (75, 2, 'money', 'user_pay', 20.00, '购物支付【N2018112010240604266】', '会员购物扣款，订单号：N2018112010240604266', 1, '2018-11-20 10:24:16', '2018-11-20 10:24:16');
INSERT INTO `work_user_asset_logs` VALUES (76, 2, 'money', 'user_pay', 20.00, '购物支付【N2018112010305409046】', '会员购物扣款，订单号：N2018112010305409046', 1, '2018-11-20 10:31:14', '2018-11-20 10:31:14');
INSERT INTO `work_user_asset_logs` VALUES (77, 28, 'money', 'user_money_recharge', 10000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-20 12:37:39', '2018-11-20 12:37:39');
INSERT INTO `work_user_asset_logs` VALUES (78, 2, 'money', 'user_pay_return', 240.00, '订单退款【G2018112009580342320】', '会员申请订单退款，退款订单号：G2018112009580342320', 1, '2018-11-20 12:47:34', '2018-11-20 12:47:34');
INSERT INTO `work_user_asset_logs` VALUES (79, 28, 'money', 'user_pay', 120.00, '购物支付【N2018112012504509175】', '会员购物扣款，订单号：N2018112012504509175', 1, '2018-11-20 12:51:27', '2018-11-20 12:51:27');
INSERT INTO `work_user_asset_logs` VALUES (80, 28, 'money', 'user_pay', 562.00, '购物支付【N2018112012582427690】', '会员购物扣款，订单号：N2018112012582427690', 1, '2018-11-20 12:58:32', '2018-11-20 12:58:32');
INSERT INTO `work_user_asset_logs` VALUES (81, 28, 'money', 'user_pay', 100.00, '购物支付【N2018112013202778377】', '会员购物扣款，订单号：N2018112013202778377', 1, '2018-11-20 13:20:35', '2018-11-20 13:20:35');
INSERT INTO `work_user_asset_logs` VALUES (82, 28, 'money', 'user_pay_return', 100.00, '订单退款【G2018112013205286878】', '会员申请订单退款，退款订单号：G2018112013205286878', 1, '2018-11-20 13:24:25', '2018-11-20 13:24:25');
INSERT INTO `work_user_asset_logs` VALUES (83, 8, 'money', 'user_pay_return', 0.83, '订单退款【G2018111715455617620】', '会员申请订单退款，退款订单号：G2018111715455617620', 1, '2018-11-20 13:24:35', '2018-11-20 13:24:35');
INSERT INTO `work_user_asset_logs` VALUES (84, 28, 'money', 'user_pay', 320.00, '购物支付【N2018112013271332287】', '会员购物扣款，订单号：N2018112013271332287', 1, '2018-11-20 13:27:25', '2018-11-20 13:27:25');
INSERT INTO `work_user_asset_logs` VALUES (85, 28, 'money', 'user_pay_return', 320.00, '订单退款【G2018112013283084715】', '会员申请订单退款，退款订单号：G2018112013283084715', 1, '2018-11-20 13:29:30', '2018-11-20 13:29:30');
INSERT INTO `work_user_asset_logs` VALUES (86, 28, 'money', 'user_pay', 129.00, '购物支付【N2018112013585220624】', '会员购物扣款，订单号：N2018112013585220624', 1, '2018-11-20 13:59:00', '2018-11-20 13:59:00');
INSERT INTO `work_user_asset_logs` VALUES (87, 1, 'money', 'user_pay', 129.00, '购物支付【N2018112017133175670】', '会员购物扣款，订单号：N2018112017133175670', 1, '2018-11-20 17:13:34', '2018-11-20 17:13:34');
INSERT INTO `work_user_asset_logs` VALUES (88, 34, 'money', 'user_money_recharge', 500.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-21 09:11:29', '2018-11-21 09:11:29');
INSERT INTO `work_user_asset_logs` VALUES (89, 34, 'money', 'user_pay', 129.00, '购物支付【N2018112109103630100】', '会员购物扣款，订单号：N2018112109103630100', 1, '2018-11-21 09:11:36', '2018-11-21 09:11:36');
INSERT INTO `work_user_asset_logs` VALUES (90, 2, 'money', 'user_get_commission', 25.80, '分销佣金提现【F2018112109252175447】', '会员申请分销提现到钱包', 1, '2018-11-21 09:26:30', '2018-11-21 09:26:30');
INSERT INTO `work_user_asset_logs` VALUES (91, 2, 'money', 'user_pay', 120.00, '购物支付【N2018112110352978422】', '会员购物扣款，订单号：N2018112110352978422', 1, '2018-11-21 10:35:36', '2018-11-21 10:35:36');
INSERT INTO `work_user_asset_logs` VALUES (92, 17, 'money', 'user_pay', 562.00, '购物支付【N2018112110402436898】', '会员购物扣款，订单号：N2018112110402436898', 1, '2018-11-21 10:40:30', '2018-11-21 10:40:30');
INSERT INTO `work_user_asset_logs` VALUES (93, 2, 'money', 'user_pay', 562.00, '购物支付【N2018112110412654007】', '会员购物扣款，订单号：N2018112110412654007', 1, '2018-11-21 10:41:34', '2018-11-21 10:41:34');
INSERT INTO `work_user_asset_logs` VALUES (94, 35, 'money', 'user_money_recharge', 100.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-22 10:58:59', '2018-11-22 10:58:59');
INSERT INTO `work_user_asset_logs` VALUES (95, 15, 'money', 'user_money_recharge', 30000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-22 13:43:34', '2018-11-22 13:43:34');
INSERT INTO `work_user_asset_logs` VALUES (96, 15, 'money', 'user_pay', 129.00, '购物支付【N2018112114194729503】', '会员购物扣款，订单号：N2018112114194729503', 1, '2018-11-22 13:43:44', '2018-11-22 13:43:44');
INSERT INTO `work_user_asset_logs` VALUES (97, 15, 'money', 'user_pay', 129.00, '购物支付【N2018112213440651194】', '会员购物扣款，订单号：N2018112213440651194', 1, '2018-11-22 13:44:18', '2018-11-22 13:44:18');
INSERT INTO `work_user_asset_logs` VALUES (98, 15, 'money', 'user_pay', 129.00, '购物支付【N2018112213444579200】', '会员购物扣款，订单号：N2018112213444579200', 1, '2018-11-22 13:44:50', '2018-11-22 13:44:50');
INSERT INTO `work_user_asset_logs` VALUES (99, 15, 'money', 'user_pay', 129.00, '购物支付【N2018112213540215520】', '会员购物扣款，订单号：N2018112213540215520', 1, '2018-11-22 13:54:05', '2018-11-22 13:54:05');
INSERT INTO `work_user_asset_logs` VALUES (100, 15, 'money', 'user_pay', 129.00, '购物支付【N2018112213552603464】', '会员购物扣款，订单号：N2018112213552603464', 1, '2018-11-22 13:55:30', '2018-11-22 13:55:30');
INSERT INTO `work_user_asset_logs` VALUES (101, 15, 'money', 'user_pay', 129.00, '购物支付【N2018112213555554533】', '会员购物扣款，订单号：N2018112213555554533', 1, '2018-11-22 13:55:58', '2018-11-22 13:55:58');
INSERT INTO `work_user_asset_logs` VALUES (102, 15, 'money', 'user_pay', 129.00, '购物支付【N2018112213564220296】', '会员购物扣款，订单号：N2018112213564220296', 1, '2018-11-22 13:56:45', '2018-11-22 13:56:45');
INSERT INTO `work_user_asset_logs` VALUES (103, 15, 'money', 'user_pay', 129.00, '购物支付【N2018112214024776215】', '会员购物扣款，订单号：N2018112214024776215', 1, '2018-11-22 14:02:50', '2018-11-22 14:02:50');
INSERT INTO `work_user_asset_logs` VALUES (104, 17, 'money', 'user_pay', 120.00, '购物支付【N2018112311534668391】', '会员购物扣款，订单号：N2018112311534668391', 1, '2018-11-23 11:53:49', '2018-11-23 11:53:49');
INSERT INTO `work_user_asset_logs` VALUES (105, 31, 'money', 'user_money_recharge', 10000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-23 15:11:06', '2018-11-23 15:11:06');
INSERT INTO `work_user_asset_logs` VALUES (106, 31, 'money', 'user_pay', 50.00, '购物支付【N2018112315104057251】', '会员购物扣款，订单号：N2018112315104057251', 1, '2018-11-23 15:11:15', '2018-11-23 15:11:15');
INSERT INTO `work_user_asset_logs` VALUES (107, 31, 'money', 'user_pay', 0.01, '购物支付【N2018112315374816982】', '会员购物扣款，订单号：N2018112315374816982', 1, '2018-11-23 15:37:55', '2018-11-23 15:37:55');
INSERT INTO `work_user_asset_logs` VALUES (108, 31, 'money', 'user_pay', 0.01, '购物支付【N2018112316021669966】', '会员购物扣款，订单号：N2018112316021669966', 1, '2018-11-23 16:02:37', '2018-11-23 16:02:37');
INSERT INTO `work_user_asset_logs` VALUES (109, 2, 'money', 'user_pay', 0.01, '购物支付【N2018112110541427339】', '会员购物扣款，订单号：N2018112110541427339', 1, '2018-11-23 16:03:27', '2018-11-23 16:03:27');
INSERT INTO `work_user_asset_logs` VALUES (110, 15, 'money', 'user_pay', 129.00, '购物支付【N2018112316551574480】', '会员购物扣款，订单号：N2018112316551574480', 1, '2018-11-23 16:55:18', '2018-11-23 16:55:18');
INSERT INTO `work_user_asset_logs` VALUES (111, 15, 'money', 'user_pay', 129.00, '购物支付【N2018112411051411054】', '会员购物扣款，订单号：N2018112411051411054', 1, '2018-11-24 11:06:36', '2018-11-24 11:06:36');
INSERT INTO `work_user_asset_logs` VALUES (112, 15, 'money', 'user_pay', 129.00, '购物支付【N2018112411233997236】', '会员购物扣款，订单号：N2018112411233997236', 1, '2018-11-24 11:23:42', '2018-11-24 11:23:42');
INSERT INTO `work_user_asset_logs` VALUES (113, 31, 'money', 'user_pay', 120.00, '购物支付【N2018112414371330931】', '会员购物扣款，订单号：N2018112414371330931', 1, '2018-11-24 14:42:17', '2018-11-24 14:42:17');
INSERT INTO `work_user_asset_logs` VALUES (114, 31, 'money', 'user_pay', 562.00, '购物支付【N2018112316020813667】', '会员购物扣款，订单号：N2018112316020813667', 1, '2018-11-24 14:42:33', '2018-11-24 14:42:33');
INSERT INTO `work_user_asset_logs` VALUES (115, 15, 'money', 'user_pay', 129.00, '购物支付【N2018112414561950659】', '会员购物扣款，订单号：N2018112414561950659', 1, '2018-11-24 15:00:47', '2018-11-24 15:00:47');
INSERT INTO `work_user_asset_logs` VALUES (116, 4, 'money', 'user_pay', 552.00, '购物支付【N2018112415204977953】', '会员购物扣款，订单号：N2018112415204977953', 1, '2018-11-24 15:20:54', '2018-11-24 15:20:54');
INSERT INTO `work_user_asset_logs` VALUES (117, 4, 'money', 'user_pay', 562.00, '购物支付【N2018112415222885643】', '会员购物扣款，订单号：N2018112415222885643', 1, '2018-11-24 15:22:36', '2018-11-24 15:22:36');
INSERT INTO `work_user_asset_logs` VALUES (118, 31, 'money', 'user_pay', 558.00, '购物支付【N2018112415234083969】', '会员购物扣款，订单号：N2018112415234083969', 1, '2018-11-24 15:23:47', '2018-11-24 15:23:47');
INSERT INTO `work_user_asset_logs` VALUES (119, 2, 'money', 'user_money_recharge', 0.01, '会员钱包充值', '会员通过第三方对钱包进行充值', 1, '2018-11-24 20:19:29', '2018-11-24 20:19:29');
INSERT INTO `work_user_asset_logs` VALUES (120, 37, 'money', 'user_money_recharge', 2000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-26 09:32:53', '2018-11-26 09:32:53');
INSERT INTO `work_user_asset_logs` VALUES (121, 2, 'money', 'user_pay', 562.00, '购物支付【N2018112609352515302】', '会员购物扣款，订单号：N2018112609352515302', 1, '2018-11-26 09:35:35', '2018-11-26 09:35:35');
INSERT INTO `work_user_asset_logs` VALUES (122, 2, 'money', 'user_pay', 100.00, '购物支付【N2018112609480281614】', '会员购物扣款，订单号：N2018112609480281614', 1, '2018-11-26 09:48:15', '2018-11-26 09:48:15');
INSERT INTO `work_user_asset_logs` VALUES (123, 43, 'money', 'user_money_recharge', 8.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-28 09:47:37', '2018-11-28 09:47:37');
INSERT INTO `work_user_asset_logs` VALUES (124, 4, 'money', 'user_pay', 320.00, '购物支付【N2018112811364938590】', '会员购物扣款，订单号：N2018112811364938590', 1, '2018-11-28 11:37:01', '2018-11-28 11:37:01');
INSERT INTO `work_user_asset_logs` VALUES (125, 4, 'money', 'user_pay', 125.00, '购物支付【N2018112811552385970】', '会员购物扣款，订单号：N2018112811552385970', 1, '2018-11-28 11:55:37', '2018-11-28 11:55:37');
INSERT INTO `work_user_asset_logs` VALUES (126, 4, 'money', 'user_pay', 125.00, '购物支付【N2018112811551380969】', '会员购物扣款，订单号：N2018112811551380969', 1, '2018-11-28 11:55:57', '2018-11-28 11:55:57');
INSERT INTO `work_user_asset_logs` VALUES (127, 17, 'money', 'user_pay', 120.00, '购物支付【N2018112110441887770】', '会员购物扣款，订单号：N2018112110441887770', 1, '2018-11-28 11:57:24', '2018-11-28 11:57:24');
INSERT INTO `work_user_asset_logs` VALUES (128, 4, 'money', 'user_pay', 100.00, '购物支付【N2018112811550334475】', '会员购物扣款，订单号：N2018112811550334475', 1, '2018-11-28 13:42:57', '2018-11-28 13:42:57');
INSERT INTO `work_user_asset_logs` VALUES (129, 4, 'money', 'user_money_recharge', 0.01, '会员钱包充值', '会员通过第三方对钱包进行充值', 1, '2018-11-28 14:49:39', '2018-11-28 14:49:39');
INSERT INTO `work_user_asset_logs` VALUES (130, 4, 'money', 'user_money_recharge', 0.01, '会员钱包充值', '会员通过第三方对钱包进行充值', 1, '2018-11-28 14:49:56', '2018-11-28 14:49:56');
INSERT INTO `work_user_asset_logs` VALUES (131, 4, 'money', 'user_pay', 100.00, '购物支付【N2018112814504619691】', '会员购物扣款，订单号：N2018112814504619691', 1, '2018-11-28 14:50:53', '2018-11-28 14:50:53');
INSERT INTO `work_user_asset_logs` VALUES (132, 17, 'money', 'user_pay', 100.00, '购物支付【N2018112815092177917】', '会员购物扣款，订单号：N2018112815092177917', 1, '2018-11-28 15:09:41', '2018-11-28 15:09:41');
INSERT INTO `work_user_asset_logs` VALUES (133, 4, 'money', 'user_pay', 120.00, '购物支付【N2018112815160866128】', '会员购物扣款，订单号：N2018112815160866128', 1, '2018-11-28 15:16:18', '2018-11-28 15:16:18');
INSERT INTO `work_user_asset_logs` VALUES (134, 4, 'money', 'user_pay', 1161.00, '购物支付【N2018112815165056572】', '会员购物扣款，订单号：N2018112815165056572', 1, '2018-11-28 15:16:59', '2018-11-28 15:16:59');
INSERT INTO `work_user_asset_logs` VALUES (135, 4, 'money', 'user_drawcash', 100.00, '申请提现扣款【D2018112815212776667】', '会员申请提现，系统自动扣款，提现申请单号【D2018112815212776667】', 1, '2018-11-28 15:21:27', '2018-11-28 15:21:27');
INSERT INTO `work_user_asset_logs` VALUES (136, 44, 'money', 'user_money_recharge', 10000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-28 15:29:26', '2018-11-28 15:29:26');
INSERT INTO `work_user_asset_logs` VALUES (137, 44, 'money', 'user_pay', 120.00, '购物支付【N2018112815294558461】', '会员购物扣款，订单号：N2018112815294558461', 1, '2018-11-28 15:29:49', '2018-11-28 15:29:49');
INSERT INTO `work_user_asset_logs` VALUES (138, 44, 'money', 'user_pay', 100.00, '购物支付【N2018112817374681771】', '会员购物扣款，订单号：N2018112817374681771', 1, '2018-11-28 17:37:50', '2018-11-28 17:37:50');
INSERT INTO `work_user_asset_logs` VALUES (139, 4, 'money', 'user_get_commission', 0.00, '分销佣金提现【F2018112817380962082】', '会员申请分销提现到钱包', 1, '2018-11-28 17:38:23', '2018-11-28 17:38:23');
INSERT INTO `work_user_asset_logs` VALUES (140, 44, 'money', 'user_pay_return', 100.00, '订单退款【G2018112817485133873】', '会员申请订单退款，退款订单号：G2018112817485133873', 1, '2018-11-28 17:49:38', '2018-11-28 17:49:38');
INSERT INTO `work_user_asset_logs` VALUES (141, 44, 'money', 'user_pay', 100.00, '购物支付【N2018112817494880881】', '会员购物扣款，订单号：N2018112817494880881', 1, '2018-11-28 17:49:52', '2018-11-28 17:49:52');
INSERT INTO `work_user_asset_logs` VALUES (142, 44, 'money', 'user_pay', 100.00, '购物支付【N2018112817542805460】', '会员购物扣款，订单号：N2018112817542805460', 1, '2018-11-28 17:54:32', '2018-11-28 17:54:32');
INSERT INTO `work_user_asset_logs` VALUES (143, 4, 'money', 'user_get_commission', 0.00, '分销佣金提现【F2018112817392230029】', '会员申请分销提现到钱包', 1, '2018-11-28 17:59:01', '2018-11-28 17:59:01');
INSERT INTO `work_user_asset_logs` VALUES (144, 4, 'money', 'user_drawcash', 10000.00, '申请提现扣款【D2018112914531973541】', '会员申请提现，系统自动扣款，提现申请单号【D2018112914531973541】', 1, '2018-11-29 14:53:19', '2018-11-29 14:53:19');
INSERT INTO `work_user_asset_logs` VALUES (145, 44, 'money', 'user_pay', 100.00, '购物支付【N2018112916213633810】', '会员购物扣款，订单号：N2018112916213633810', 1, '2018-11-29 16:21:40', '2018-11-29 16:21:40');
INSERT INTO `work_user_asset_logs` VALUES (146, 4, 'money', 'user_get_commission', 0.01, '分销佣金提现【F2018112916232034019】', '会员申请分销提现到钱包', 1, '2018-11-29 16:23:30', '2018-11-29 16:23:30');
INSERT INTO `work_user_asset_logs` VALUES (147, 4, 'money', 'user_get_commission', 0.01, '分销佣金提现【F2018112915432460253】', '会员申请分销提现到钱包', 1, '2018-11-29 16:23:37', '2018-11-29 16:23:37');
INSERT INTO `work_user_asset_logs` VALUES (148, 4, 'money', 'user_get_bonus', 4.20, '分红佣金提现【B2018112916231064436】', '会员申请分红提现到钱包', 1, '2018-11-29 16:23:45', '2018-11-29 16:23:45');
INSERT INTO `work_user_asset_logs` VALUES (149, 44, 'money', 'user_pay', 100.00, '购物支付【N2018112916235534656】', '会员购物扣款，订单号：N2018112916235534656', 1, '2018-11-29 16:23:59', '2018-11-29 16:23:59');
INSERT INTO `work_user_asset_logs` VALUES (150, 46, 'money', 'user_money_recharge', 500000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-11-29 16:38:44', '2018-11-29 16:38:44');
INSERT INTO `work_user_asset_logs` VALUES (151, 2, 'money', 'user_pay', 211.00, '购物支付【N2018112916423277583】', '会员购物扣款，订单号：N2018112916423277583', 1, '2018-11-29 16:42:41', '2018-11-29 16:42:41');
INSERT INTO `work_user_asset_logs` VALUES (152, 46, 'money', 'user_pay', 129.00, '购物支付【N2018112917182713260】', '会员购物扣款，订单号：N2018112917182713260', 1, '2018-11-29 17:18:32', '2018-11-29 17:18:32');
INSERT INTO `work_user_asset_logs` VALUES (153, 46, 'money', 'user_pay', 129.00, '购物支付【N2018112917211106346】', '会员购物扣款，订单号：N2018112917211106346', 1, '2018-11-29 17:21:17', '2018-11-29 17:21:17');
INSERT INTO `work_user_asset_logs` VALUES (154, 46, 'money', 'user_pay', 129.00, '购物支付【N2018112917231100922】', '会员购物扣款，订单号：N2018112917231100922', 1, '2018-11-29 17:23:16', '2018-11-29 17:23:16');
INSERT INTO `work_user_asset_logs` VALUES (155, 4, 'money', 'user_get_bonus', 0.01, '分红佣金提现【B2018112917231000993】', '会员申请分红提现到钱包', 1, '2018-11-29 17:23:19', '2018-11-29 17:23:19');
INSERT INTO `work_user_asset_logs` VALUES (156, 4, 'money', 'user_get_commission', 0.01, '分销佣金提现【F2018112917230014945】', '会员申请分销提现到钱包', 1, '2018-11-29 17:23:33', '2018-11-29 17:23:33');
INSERT INTO `work_user_asset_logs` VALUES (157, 44, 'money', 'user_pay', 110.00, '购物支付【N2018112917260760300】', '会员购物扣款，订单号：N2018112917260760300', 1, '2018-11-29 17:26:10', '2018-11-29 17:26:10');
INSERT INTO `work_user_asset_logs` VALUES (158, 46, 'money', 'user_money_recharge', 100000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-01 11:20:34', '2018-12-01 11:20:34');
INSERT INTO `work_user_asset_logs` VALUES (159, 4, 'money', 'user_drawcash_not_agree', 10000.00, '提现审核未通过回款', '管理员拒绝提现，系统自动返还提现资金', 1, '2018-12-01 11:21:18', '2018-12-01 11:21:18');
INSERT INTO `work_user_asset_logs` VALUES (160, 4, 'money', 'user_drawcash_not_agree', 100.00, '提现审核未通过回款', '管理员拒绝提现，系统自动返还提现资金', 1, '2018-12-01 11:21:21', '2018-12-01 11:21:21');
INSERT INTO `work_user_asset_logs` VALUES (161, 17, 'money', 'user_drawcash_not_agree', 111.00, '提现审核未通过回款', '管理员拒绝提现，系统自动返还提现资金', 1, '2018-12-01 11:21:24', '2018-12-01 11:21:24');
INSERT INTO `work_user_asset_logs` VALUES (162, 19, 'money', 'user_money_recharge', 10000000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-01 11:48:11', '2018-12-01 11:48:11');
INSERT INTO `work_user_asset_logs` VALUES (163, 43, 'money', 'user_money_recharge', 888888.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-01 11:49:34', '2018-12-01 11:49:34');
INSERT INTO `work_user_asset_logs` VALUES (164, 43, 'money', 'user_pay', 125.00, '购物支付【N2018120115170152378】', '会员购物扣款，订单号：N2018120115170152378', 1, '2018-12-01 15:17:59', '2018-12-01 15:17:59');
INSERT INTO `work_user_asset_logs` VALUES (165, 48, 'money', 'user_money_recharge', 100000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-01 15:22:08', '2018-12-01 15:22:08');
INSERT INTO `work_user_asset_logs` VALUES (166, 47, 'money', 'user_money_recharge', 10000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-01 15:22:13', '2018-12-01 15:22:13');
INSERT INTO `work_user_asset_logs` VALUES (167, 47, 'money', 'user_money_recharge', 100000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-01 15:22:19', '2018-12-01 15:22:19');
INSERT INTO `work_user_asset_logs` VALUES (168, 45, 'money', 'user_money_recharge', 100000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-01 15:22:24', '2018-12-01 15:22:24');
INSERT INTO `work_user_asset_logs` VALUES (169, 44, 'money', 'user_money_recharge', 100000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-01 15:22:29', '2018-12-01 15:22:29');
INSERT INTO `work_user_asset_logs` VALUES (170, 42, 'money', 'user_money_recharge', 100000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-01 15:22:34', '2018-12-01 15:22:34');
INSERT INTO `work_user_asset_logs` VALUES (171, 41, 'money', 'user_money_recharge', 100000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-01 15:22:41', '2018-12-01 15:22:41');
INSERT INTO `work_user_asset_logs` VALUES (172, 40, 'money', 'user_money_recharge', 1000000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-01 15:22:48', '2018-12-01 15:22:48');
INSERT INTO `work_user_asset_logs` VALUES (173, 43, 'money', 'user_pay_return', 125.00, '订单退款【G2018120115182577265】', '会员申请订单退款，退款订单号：G2018120115182577265', 1, '2018-12-01 15:47:13', '2018-12-01 15:47:13');
INSERT INTO `work_user_asset_logs` VALUES (174, 2, 'money', 'user_pay_return', 562.00, '订单退款【G2018112609372929091】', '会员申请订单退款，退款订单号：G2018112609372929091', 1, '2018-12-01 15:47:16', '2018-12-01 15:47:16');
INSERT INTO `work_user_asset_logs` VALUES (175, 2, 'money', 'user_pay_return', 562.00, '订单退款【G2018112610372795227】', '会员申请订单退款，退款订单号：G2018112610372795227', 1, '2018-12-01 15:47:19', '2018-12-01 15:47:19');
INSERT INTO `work_user_asset_logs` VALUES (176, 2, 'money', 'user_pay_return', 120.00, '订单退款【G2018112610384715402】', '会员申请订单退款，退款订单号：G2018112610384715402', 1, '2018-12-01 15:47:22', '2018-12-01 15:47:22');
INSERT INTO `work_user_asset_logs` VALUES (177, 2, 'money', 'user_pay_return', 562.00, '订单退款【G2018112614275229103】', '会员申请订单退款，退款订单号：G2018112614275229103', 1, '2018-12-01 15:47:24', '2018-12-01 15:47:24');
INSERT INTO `work_user_asset_logs` VALUES (178, 2, 'money', 'user_pay_return', 0.01, '订单退款【G2018112609384720298】', '会员申请订单退款，退款订单号：G2018112609384720298', 1, '2018-12-01 15:47:36', '2018-12-01 15:47:36');
INSERT INTO `work_user_asset_logs` VALUES (179, 15, 'money', 'user_pay_return', 129.00, '订单退款【G2018112415005387540】', '会员申请订单退款，退款订单号：G2018112415005387540', 1, '2018-12-01 15:47:40', '2018-12-01 15:47:40');
INSERT INTO `work_user_asset_logs` VALUES (180, 15, 'money', 'user_pay_return', 129.00, '订单退款【G2018112411320482871】', '会员申请订单退款，退款订单号：G2018112411320482871', 1, '2018-12-01 15:47:45', '2018-12-01 15:47:45');
INSERT INTO `work_user_asset_logs` VALUES (181, 15, 'money', 'user_pay_return', 129.00, '订单退款【G2018112215271244228】', '会员申请订单退款，退款订单号：G2018112215271244228', 1, '2018-12-01 15:47:50', '2018-12-01 15:47:50');
INSERT INTO `work_user_asset_logs` VALUES (182, 2, 'money', 'user_pay_return', 600.00, '订单退款【G2018111322323320306】', '会员申请订单退款，退款订单号：G2018111322323320306', 1, '2018-12-01 15:47:54', '2018-12-01 15:47:54');
INSERT INTO `work_user_asset_logs` VALUES (183, 48, 'money', 'user_money_recharge', 1000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-01 16:33:02', '2018-12-01 16:33:02');
INSERT INTO `work_user_asset_logs` VALUES (184, 48, 'money', 'user_money_recharge', 999999.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-01 16:37:31', '2018-12-01 16:37:31');
INSERT INTO `work_user_asset_logs` VALUES (185, 48, 'money', 'user_pay', 999999.00, '购物支付【N2018120116340166628】', '会员购物扣款，订单号：N2018120116340166628', 1, '2018-12-01 16:37:38', '2018-12-01 16:37:38');
INSERT INTO `work_user_asset_logs` VALUES (186, 48, 'money', 'user_pay', 20.00, '购物支付【N2018120309121980379】', '会员购物扣款，订单号：N2018120309121980379', 1, '2018-12-03 09:12:27', '2018-12-03 09:12:27');
INSERT INTO `work_user_asset_logs` VALUES (187, 44, 'money', 'user_pay', 110.00, '购物支付【N2018120309402658779】', '会员购物扣款，订单号：N2018120309402658779', 1, '2018-12-03 09:40:30', '2018-12-03 09:40:30');
INSERT INTO `work_user_asset_logs` VALUES (188, 44, 'money', 'user_pay_return', 110.00, '订单退款【G2018120309410902884】', '会员申请订单退款，退款订单号：G2018120309410902884', 1, '2018-12-03 09:41:34', '2018-12-03 09:41:34');
INSERT INTO `work_user_asset_logs` VALUES (189, 44, 'money', 'user_pay', 110.00, '购物支付【N2018120309415435949】', '会员购物扣款，订单号：N2018120309415435949', 1, '2018-12-03 09:41:57', '2018-12-03 09:41:57');
INSERT INTO `work_user_asset_logs` VALUES (190, 2, 'money', 'user_pay', 125.00, '购物支付【N2018112115453102472】', '会员购物扣款，订单号：N2018112115453102472', 1, '2018-12-03 11:26:19', '2018-12-03 11:26:19');
INSERT INTO `work_user_asset_logs` VALUES (191, 2, 'money', 'user_pay_return', 125.00, '订单退款【G2018120311284634509】', '会员申请订单退款，退款订单号：G2018120311284634509', 1, '2018-12-03 11:38:51', '2018-12-03 11:38:51');
INSERT INTO `work_user_asset_logs` VALUES (192, 2, 'money', 'user_pay', 110.00, '购物支付【N2018112916422651419】', '会员购物扣款，订单号：N2018112916422651419', 1, '2018-12-03 11:43:28', '2018-12-03 11:43:28');
INSERT INTO `work_user_asset_logs` VALUES (193, 2, 'money', 'user_drawcash', 2.00, '申请提现扣款【D2018120315120920430】', '会员申请提现，系统自动扣款，提现申请单号【D2018120315120920430】', 1, '2018-12-03 15:12:09', '2018-12-03 15:12:09');
INSERT INTO `work_user_asset_logs` VALUES (194, 15, 'money', 'user_drawcash', 0.01, '申请提现扣款【D2018120315162359554】', '会员申请提现，系统自动扣款，提现申请单号【D2018120315162359554】', 1, '2018-12-03 15:16:23', '2018-12-03 15:16:23');
INSERT INTO `work_user_asset_logs` VALUES (195, 15, 'money', 'user_drawcash', 0.01, '申请提现扣款【D2018120315172157238】', '会员申请提现，系统自动扣款，提现申请单号【D2018120315172157238】', 1, '2018-12-03 15:17:21', '2018-12-03 15:17:21');
INSERT INTO `work_user_asset_logs` VALUES (196, 15, 'money', 'user_drawcash_not_agree', 0.01, '提现审核未通过回款', '管理员拒绝提现，系统自动返还提现资金', 1, '2018-12-03 15:25:56', '2018-12-03 15:25:56');
INSERT INTO `work_user_asset_logs` VALUES (197, 2, 'money', 'user_drawcash', 5.00, '申请提现扣款【D2018120315275828727】', '会员申请提现，系统自动扣款，提现申请单号【D2018120315275828727】', 1, '2018-12-03 15:27:58', '2018-12-03 15:27:58');
INSERT INTO `work_user_asset_logs` VALUES (198, 2, 'money', 'user_drawcash_not_agree', 5.00, '提现审核未通过回款', '管理员拒绝提现，系统自动返还提现资金', 1, '2018-12-03 15:28:11', '2018-12-03 15:28:11');
INSERT INTO `work_user_asset_logs` VALUES (199, 4, 'money', 'user_drawcash', 9900.00, '申请提现扣款【D2018120316053386012】', '会员申请提现，系统自动扣款，提现申请单号【D2018120316053386012】', 1, '2018-12-03 16:05:33', '2018-12-03 16:05:33');
INSERT INTO `work_user_asset_logs` VALUES (200, 2, 'money', 'user_pay', 120.00, '购物支付【N2018120316301138489】', '会员购物扣款，订单号：N2018120316301138489', 1, '2018-12-03 16:30:18', '2018-12-03 16:30:18');
INSERT INTO `work_user_asset_logs` VALUES (201, 15, 'money', 'user_pay', 125.00, '购物支付【N2018120317054252278】', '会员购物扣款，订单号：N2018120317054252278', 1, '2018-12-03 17:05:46', '2018-12-03 17:05:46');
INSERT INTO `work_user_asset_logs` VALUES (202, 15, 'money', 'user_pay', 110.00, '购物支付【N2018120317065422403】', '会员购物扣款，订单号：N2018120317065422403', 1, '2018-12-03 17:06:58', '2018-12-03 17:06:58');
INSERT INTO `work_user_asset_logs` VALUES (203, 4, 'money', 'user_pay_return', 200.00, '订单退款【G2018111217322009473】', '会员申请订单退款，退款订单号：G2018111217322009473', 1, '2018-12-03 17:08:34', '2018-12-03 17:08:34');
INSERT INTO `work_user_asset_logs` VALUES (204, 3, 'money', 'user_pay_return', 129.00, '订单退款【G2018111015082095851】', '会员申请订单退款，退款订单号：G2018111015082095851', 1, '2018-12-03 17:08:45', '2018-12-03 17:08:45');
INSERT INTO `work_user_asset_logs` VALUES (205, 2, 'money', 'user_money_recharge', 0.01, '会员钱包充值', '会员通过第三方对钱包进行充值', 1, '2018-12-03 17:17:15', '2018-12-03 17:17:15');
INSERT INTO `work_user_asset_logs` VALUES (206, 2, 'money', 'user_pay', 2.00, '购物支付【N2018120317375448949】', '会员购物扣款，订单号：N2018120317375448949', 1, '2018-12-03 17:41:43', '2018-12-03 17:41:43');
INSERT INTO `work_user_asset_logs` VALUES (207, 2, 'money', 'user_pay_return', 2.00, '订单退款【G2018120318443859214】', '会员申请订单退款，退款订单号：G2018120318443859214', 1, '2018-12-03 18:51:33', '2018-12-03 18:51:33');
INSERT INTO `work_user_asset_logs` VALUES (208, 9, 'money', 'user_pay', 2.00, '购物支付【N2018120318523560208】', '会员购物扣款，订单号：N2018120318523560208', 1, '2018-12-03 18:52:48', '2018-12-03 18:52:48');
INSERT INTO `work_user_asset_logs` VALUES (209, 9, 'money', 'user_pay', 10.00, '购物支付【N2018120318545805033】', '会员购物扣款，订单号：N2018120318545805033', 1, '2018-12-03 18:55:05', '2018-12-03 18:55:05');
INSERT INTO `work_user_asset_logs` VALUES (210, 2, 'money', 'user_pay', 10.00, '购物支付【N2018120318553964503】', '会员购物扣款，订单号：N2018120318553964503', 1, '2018-12-03 18:55:45', '2018-12-03 18:55:45');
INSERT INTO `work_user_asset_logs` VALUES (211, 2, 'money', 'user_pay', 10.00, '购物支付【N2018120409154750918】', '会员购物扣款，订单号：N2018120409154750918', 1, '2018-12-04 09:15:55', '2018-12-04 09:15:55');
INSERT INTO `work_user_asset_logs` VALUES (212, 4, 'money', 'user_pay', 320.00, '购物支付【N2018120411355908465】', '会员购物扣款，订单号：N2018120411355908465', 1, '2018-12-04 11:36:08', '2018-12-04 11:36:08');
INSERT INTO `work_user_asset_logs` VALUES (213, 15, 'money', 'user_pay', 110.00, '购物支付【N2018120411390837533】', '会员购物扣款，订单号：N2018120411390837533', 1, '2018-12-04 11:39:16', '2018-12-04 11:39:16');
INSERT INTO `work_user_asset_logs` VALUES (214, 15, 'money', 'user_pay', 110.00, '购物支付【N2018120411401792694】', '会员购物扣款，订单号：N2018120411401792694', 1, '2018-12-04 11:40:24', '2018-12-04 11:40:24');
INSERT INTO `work_user_asset_logs` VALUES (215, 15, 'money', 'user_pay', 110.00, '购物支付【N2018120411444526955】', '会员购物扣款，订单号：N2018120411444526955', 1, '2018-12-04 11:44:53', '2018-12-04 11:44:53');
INSERT INTO `work_user_asset_logs` VALUES (216, 15, 'money', 'user_pay', 110.00, '购物支付【N2018120411494028805】', '会员购物扣款，订单号：N2018120411494028805', 1, '2018-12-04 11:49:48', '2018-12-04 11:49:48');
INSERT INTO `work_user_asset_logs` VALUES (217, 15, 'money', 'user_pay', 110.00, '购物支付【N2018120412254798108】', '会员购物扣款，订单号：N2018120412254798108', 1, '2018-12-04 12:25:56', '2018-12-04 12:25:56');
INSERT INTO `work_user_asset_logs` VALUES (218, 15, 'money', 'user_pay', 110.00, '购物支付【N2018120412264839222】', '会员购物扣款，订单号：N2018120412264839222', 1, '2018-12-04 12:26:57', '2018-12-04 12:26:57');
INSERT INTO `work_user_asset_logs` VALUES (219, 43, 'money', 'user_pay', 562.00, '购物支付【N2018120400284538223】', '会员购物扣款，订单号：N2018120400284538223', 1, '2018-12-04 13:39:40', '2018-12-04 13:39:40');
INSERT INTO `work_user_asset_logs` VALUES (220, 15, 'money', 'user_pay', 110.00, '购物支付【N2018120413412243325】', '会员购物扣款，订单号：N2018120413412243325', 1, '2018-12-04 13:41:32', '2018-12-04 13:41:32');
INSERT INTO `work_user_asset_logs` VALUES (221, 15, 'money', 'user_pay', 110.00, '购物支付【N2018120413493956799】', '会员购物扣款，订单号：N2018120413493956799', 1, '2018-12-04 13:50:01', '2018-12-04 13:50:01');
INSERT INTO `work_user_asset_logs` VALUES (222, 15, 'money', 'user_pay', 110.00, '购物支付【N2018120413525787863】', '会员购物扣款，订单号：N2018120413525787863', 1, '2018-12-04 13:53:21', '2018-12-04 13:53:21');
INSERT INTO `work_user_asset_logs` VALUES (223, 15, 'money', 'user_pay', 110.00, '购物支付【N2018120413571136709】', '会员购物扣款，订单号：N2018120413571136709', 1, '2018-12-04 13:57:32', '2018-12-04 13:57:32');
INSERT INTO `work_user_asset_logs` VALUES (224, 15, 'money', 'user_pay', 110.00, '购物支付【N2018120414090949828】', '会员购物扣款，订单号：N2018120414090949828', 1, '2018-12-04 14:09:16', '2018-12-04 14:09:16');
INSERT INTO `work_user_asset_logs` VALUES (225, 4, 'money', 'user_pay', 125.00, '购物支付【N2018120414103772284】', '会员购物扣款，订单号：N2018120414103772284', 1, '2018-12-04 14:10:55', '2018-12-04 14:10:55');
INSERT INTO `work_user_asset_logs` VALUES (226, 15, 'money', 'user_pay', 110.00, '购物支付【N2018120414262233681】', '会员购物扣款，订单号：N2018120414262233681', 1, '2018-12-04 14:26:30', '2018-12-04 14:26:30');
INSERT INTO `work_user_asset_logs` VALUES (227, 49, 'money', 'user_money_recharge', 199999.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2018-12-05 14:10:10', '2018-12-05 14:10:10');
INSERT INTO `work_user_asset_logs` VALUES (228, 49, 'money', 'user_pay', 303.00, '购物支付【N2018120514115930546】', '会员购物扣款，订单号：N2018120514115930546', 1, '2018-12-05 14:12:07', '2018-12-05 14:12:07');
INSERT INTO `work_user_asset_logs` VALUES (229, 49, 'money', 'user_pay', 204.00, '购物支付【N2018120514132122861】', '会员购物扣款，订单号：N2018120514132122861', 1, '2018-12-05 14:13:34', '2018-12-05 14:13:34');
INSERT INTO `work_user_asset_logs` VALUES (230, 49, 'money', 'user_pay', 103.00, '购物支付【N2018120514141317078】', '会员购物扣款，订单号：N2018120514141317078', 1, '2018-12-05 14:14:21', '2018-12-05 14:14:21');
INSERT INTO `work_user_asset_logs` VALUES (231, 49, 'money', 'user_pay', 99.00, '购物支付【N2018120514143518924】', '会员购物扣款，订单号：N2018120514143518924', 1, '2018-12-05 14:14:42', '2018-12-05 14:14:42');
INSERT INTO `work_user_asset_logs` VALUES (232, 49, 'money', 'user_pay', 304.00, '购物支付【N2018120514172042237】', '会员购物扣款，订单号：N2018120514172042237', 1, '2018-12-05 14:17:26', '2018-12-05 14:17:26');
INSERT INTO `work_user_asset_logs` VALUES (233, 49, 'money', 'user_pay', 199.00, '购物支付【N2018120514175082513】', '会员购物扣款，订单号：N2018120514175082513', 1, '2018-12-05 14:17:56', '2018-12-05 14:17:56');
INSERT INTO `work_user_asset_logs` VALUES (234, 49, 'money', 'user_pay', 300.00, '购物支付【N2018120514224517796】', '会员购物扣款，订单号：N2018120514224517796', 1, '2018-12-05 14:22:51', '2018-12-05 14:22:51');
INSERT INTO `work_user_asset_logs` VALUES (235, 49, 'money', 'user_pay', 303.00, '购物支付【N2018120514230953095】', '会员购物扣款，订单号：N2018120514230953095', 1, '2018-12-05 14:23:16', '2018-12-05 14:23:16');
INSERT INTO `work_user_asset_logs` VALUES (236, 49, 'money', 'user_pay', 699.00, '购物支付【N2018120514301430987】', '会员购物扣款，订单号：N2018120514301430987', 1, '2018-12-05 14:30:21', '2018-12-05 14:30:21');
INSERT INTO `work_user_asset_logs` VALUES (237, 49, 'money', 'user_pay', 599.00, '购物支付【N2018120514303488526】', '会员购物扣款，订单号：N2018120514303488526', 1, '2018-12-05 14:30:40', '2018-12-05 14:30:40');
INSERT INTO `work_user_asset_logs` VALUES (238, 49, 'money', 'user_pay', 90.00, '购物支付【N2018120514372881242】', '会员购物扣款，订单号：N2018120514372881242', 1, '2018-12-05 14:37:35', '2018-12-05 14:37:35');
INSERT INTO `work_user_asset_logs` VALUES (239, 49, 'money', 'user_pay', 268.00, '购物支付【N2018120616002424644】', '会员购物扣款，订单号：N2018120616002424644', 1, '2018-12-06 16:00:30', '2018-12-06 16:00:30');
INSERT INTO `work_user_asset_logs` VALUES (240, 49, 'money', 'user_pay', 56563.00, '购物支付【N2018120618241247570】', '会员购物扣款，订单号：N2018120618241247570', 1, '2018-12-06 18:24:22', '2018-12-06 18:24:22');
INSERT INTO `work_user_asset_logs` VALUES (241, 49, 'money', 'user_pay', 709.00, '购物支付【N2018120709324915619】', '会员购物扣款，订单号：N2018120709324915619', 1, '2018-12-07 09:33:04', '2018-12-07 09:33:04');
INSERT INTO `work_user_asset_logs` VALUES (242, 15, 'money', 'user_pay', 749.00, '购物支付【N2019012214104625241】', '会员购物扣款，订单号：N2019012214104625241', 1, '2019-01-22 14:11:14', '2019-01-22 14:11:14');
INSERT INTO `work_user_asset_logs` VALUES (243, 1, 'money', 'user_pay', 139.00, '购物支付【N2019012314221169212】', '会员购物扣款，订单号：N2019012314221169212', 1, '2019-01-23 14:22:23', '2019-01-23 14:22:23');
INSERT INTO `work_user_asset_logs` VALUES (244, 48, 'money', 'user_pay', 100.00, '购物支付【N2019012418333303903】', '会员购物扣款，订单号：N2019012418333303903', 1, '2019-01-24 18:33:41', '2019-01-24 18:33:41');
INSERT INTO `work_user_asset_logs` VALUES (245, 17, 'money', 'user_pay', 149.00, '购物支付【N2019012716215980372】', '会员购物扣款，订单号：N2019012716215980372', 1, '2019-01-27 16:22:04', '2019-01-27 16:22:04');
INSERT INTO `work_user_asset_logs` VALUES (246, 1, 'money', 'user_pay', 139.00, '购物支付【N2019012816374659974】', '会员购物扣款，订单号：N2019012816374659974', 1, '2019-01-28 16:37:58', '2019-01-28 16:37:58');
INSERT INTO `work_user_asset_logs` VALUES (247, 15, 'money', 'user_pay', 139.00, '购物支付【N2019012916444906690】', '会员购物扣款，订单号：N2019012916444906690', 1, '2019-01-29 16:45:03', '2019-01-29 16:45:03');
INSERT INTO `work_user_asset_logs` VALUES (248, 17, 'money', 'user_pay', 709.00, '购物支付【N2019021111512897572】', '会员购物扣款，订单号：N2019021111512897572', 1, '2019-02-11 11:51:35', '2019-02-11 11:51:35');
INSERT INTO `work_user_asset_logs` VALUES (249, 48, 'money', 'user_pay', 149.00, '购物支付【N2019021314131867964】', '会员购物扣款，订单号：N2019021314131867964', 1, '2019-02-13 14:13:32', '2019-02-13 14:13:32');
INSERT INTO `work_user_asset_logs` VALUES (250, 63, 'money', 'user_money_recharge', 50000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2019-02-14 18:00:15', '2019-02-14 18:00:15');
INSERT INTO `work_user_asset_logs` VALUES (251, 63, 'money', 'user_pay', 155.00, '购物支付【N2019021418015494152】', '会员购物扣款，订单号：N2019021418015494152', 1, '2019-02-14 18:02:01', '2019-02-14 18:02:01');
INSERT INTO `work_user_asset_logs` VALUES (252, 63, 'money', 'user_pay', 229.00, '购物支付【N2019021418032608227】', '会员购物扣款，订单号：N2019021418032608227', 1, '2019-02-14 18:03:51', '2019-02-14 18:03:51');
INSERT INTO `work_user_asset_logs` VALUES (253, 63, 'money', 'user_pay', 408.00, '购物支付【N2019021418051340746】', '会员购物扣款，订单号：N2019021418051340746', 1, '2019-02-14 18:05:20', '2019-02-14 18:05:20');
INSERT INTO `work_user_asset_logs` VALUES (254, 63, 'money', 'user_pay', 139.00, '购物支付【N2019021418102821799】', '会员购物扣款，订单号：N2019021418102821799', 1, '2019-02-14 18:10:36', '2019-02-14 18:10:36');
INSERT INTO `work_user_asset_logs` VALUES (255, 63, 'money', 'user_pay', 998.00, '购物支付【N2019021418112512378】', '会员购物扣款，订单号：N2019021418112512378', 1, '2019-02-14 18:11:32', '2019-02-14 18:11:32');
INSERT INTO `work_user_asset_logs` VALUES (256, 63, 'money', 'user_pay', 1499.00, '购物支付【N2019021418122453695】', '会员购物扣款，订单号：N2019021418122453695', 1, '2019-02-14 18:12:32', '2019-02-14 18:12:32');
INSERT INTO `work_user_asset_logs` VALUES (257, 62, 'money', 'user_money_recharge', 50000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2019-02-15 09:34:03', '2019-02-15 09:34:03');
INSERT INTO `work_user_asset_logs` VALUES (258, 62, 'money', 'user_pay', 139.00, '购物支付【N2019021509333127289】', '会员购物扣款，订单号：N2019021509333127289', 1, '2019-02-15 09:35:52', '2019-02-15 09:35:52');
INSERT INTO `work_user_asset_logs` VALUES (259, 64, 'money', 'user_money_recharge', 999.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2019-02-22 11:25:44', '2019-02-22 11:25:44');
INSERT INTO `work_user_asset_logs` VALUES (260, 64, 'money', 'user_pay', 149.00, '购物支付【N2019022211274569550】', '会员购物扣款，订单号：N2019022211274569550', 1, '2019-02-22 11:28:28', '2019-02-22 11:28:28');
INSERT INTO `work_user_asset_logs` VALUES (261, 64, 'money', 'user_pay', 139.00, '购物支付【N2019022211244800475】', '会员购物扣款，订单号：N2019022211244800475', 1, '2019-02-22 11:34:51', '2019-02-22 11:34:51');
INSERT INTO `work_user_asset_logs` VALUES (262, 2, 'money', 'user_drawcash', 1000.00, '申请提现扣款【D2019022211453994370】', '会员申请提现，系统自动扣款，提现申请单号【D2019022211453994370】', 1, '2019-02-22 11:45:39', '2019-02-22 11:45:39');
INSERT INTO `work_user_asset_logs` VALUES (263, 2, 'money', 'user_drawcash', 1000.00, '申请提现扣款【D2019022211462648323】', '会员申请提现，系统自动扣款，提现申请单号【D2019022211462648323】', 1, '2019-02-22 11:46:26', '2019-02-22 11:46:26');
INSERT INTO `work_user_asset_logs` VALUES (264, 2, 'money', 'user_drawcash_not_agree', 1000.00, '提现审核未通过回款', '管理员拒绝提现，系统自动返还提现资金', 1, '2019-02-22 11:46:38', '2019-02-22 11:46:38');
INSERT INTO `work_user_asset_logs` VALUES (265, 1, 'money', 'user_pay', 83.00, '购物支付【N2019022215271172594】', '会员购物扣款，订单号：N2019022215271172594', 1, '2019-02-22 15:27:24', '2019-02-22 15:27:24');
INSERT INTO `work_user_asset_logs` VALUES (266, 17, 'money', 'user_pay_return', 709.00, '订单退款【G2019021314275896072】', '会员申请订单退款，退款订单号：G2019021314275896072', 1, '2019-02-22 15:29:56', '2019-02-22 15:29:56');
INSERT INTO `work_user_asset_logs` VALUES (267, 2, 'money', 'user_pay', 709.00, '购物支付【N2019022215532288069】', '会员购物扣款，订单号：N2019022215532288069', 1, '2019-02-22 15:53:33', '2019-02-22 15:53:33');
INSERT INTO `work_user_asset_logs` VALUES (268, 1, 'money', 'user_pay', 169.00, '购物支付【N2019022216121206993】', '会员购物扣款，订单号：N2019022216121206993', 1, '2019-02-22 16:12:19', '2019-02-22 16:12:19');
INSERT INTO `work_user_asset_logs` VALUES (269, 1, 'money', 'user_pay', 83.00, '购物支付【N2019022216230146818】', '会员购物扣款，订单号：N2019022216230146818', 1, '2019-02-22 16:23:12', '2019-02-22 16:23:12');
INSERT INTO `work_user_asset_logs` VALUES (270, 64, 'money', 'user_pay_return', 139.00, '订单退款【G2019022309185706674】', '会员申请订单退款，退款订单号：G2019022309185706674', 1, '2019-02-23 09:20:29', '2019-02-23 09:20:29');
INSERT INTO `work_user_asset_logs` VALUES (271, 2, 'money', 'user_pay', 268.00, '购物支付【N2019022309532381488】', '会员购物扣款，订单号：N2019022309532381488', 1, '2019-02-23 09:53:30', '2019-02-23 09:53:30');
INSERT INTO `work_user_asset_logs` VALUES (272, 64, 'money', 'user_pay', 100.00, '购物支付【N2019022309580776743】', '会员购物扣款，订单号：N2019022309580776743', 1, '2019-02-23 09:58:18', '2019-02-23 09:58:18');
INSERT INTO `work_user_asset_logs` VALUES (273, 46, 'money', 'user_pay', 159.00, '购物支付【N2019022313201125391】', '会员购物扣款，订单号：N2019022313201125391', 1, '2019-02-23 13:20:18', '2019-02-23 13:20:18');
INSERT INTO `work_user_asset_logs` VALUES (274, 66, 'money', 'user_money_recharge', 5200.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2019-02-23 16:13:48', '2019-02-23 16:13:48');
INSERT INTO `work_user_asset_logs` VALUES (275, 66, 'money', 'user_pay', 139.00, '购物支付【N2019022316132412708】', '会员购物扣款，订单号：N2019022316132412708', 1, '2019-02-23 16:13:54', '2019-02-23 16:13:54');
INSERT INTO `work_user_asset_logs` VALUES (276, 66, 'money', 'user_pay_return', 139.00, '订单退款【G2019022316145001007】', '会员申请订单退款，退款订单号：G2019022316145001007', 1, '2019-02-23 16:18:19', '2019-02-23 16:18:19');
INSERT INTO `work_user_asset_logs` VALUES (277, 14, 'money', 'user_money_recharge', 12335464.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2019-02-23 16:35:09', '2019-02-23 16:35:09');
INSERT INTO `work_user_asset_logs` VALUES (278, 14, 'money', 'user_drawcash', 1000.00, '申请提现扣款【D2019022316375544978】', '会员申请提现，系统自动扣款，提现申请单号【D2019022316375544978】', 1, '2019-02-23 16:37:55', '2019-02-23 16:37:55');
INSERT INTO `work_user_asset_logs` VALUES (279, 15, 'money', 'user_pay', 149.00, '购物支付【N2019022316420103010】', '会员购物扣款，订单号：N2019022316420103010', 1, '2019-02-23 16:42:06', '2019-02-23 16:42:06');
INSERT INTO `work_user_asset_logs` VALUES (280, 21, 'money', 'user_money_recharge', 100000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2019-02-23 16:51:31', '2019-02-23 16:51:31');
INSERT INTO `work_user_asset_logs` VALUES (281, 21, 'money', 'user_pay', 408.00, '购物支付【N2019022316500309290】', '会员购物扣款，订单号：N2019022316500309290', 1, '2019-02-23 16:52:01', '2019-02-23 16:52:01');
INSERT INTO `work_user_asset_logs` VALUES (282, 21, 'money', 'user_pay', 3960.00, '购物支付【N2019022316521496102】', '会员购物扣款，订单号：N2019022316521496102', 1, '2019-02-23 16:52:21', '2019-02-23 16:52:21');
INSERT INTO `work_user_asset_logs` VALUES (283, 2, 'money', 'user_pay_return', 268.00, '订单退款【G2019022315140624402】', '会员申请订单退款，退款订单号：G2019022315140624402', 1, '2019-02-23 17:11:38', '2019-02-23 17:11:38');
INSERT INTO `work_user_asset_logs` VALUES (284, 21, 'money', 'user_pay_return', 408.00, '订单退款【G2019022316551460999】', '会员申请订单退款，退款订单号：G2019022316551460999', 1, '2019-02-25 10:43:28', '2019-02-25 10:43:28');
INSERT INTO `work_user_asset_logs` VALUES (285, 65, 'money', 'user_money_recharge', 10000.00, '管理员充值', '管理员在后台给会员进行充值', 1, '2019-02-26 10:47:14', '2019-02-26 10:47:14');
INSERT INTO `work_user_asset_logs` VALUES (286, 65, 'money', 'user_pay', 130.00, '购物支付【N2019022610531306482】', '会员购物扣款，订单号：N2019022610531306482', 1, '2019-02-26 10:53:41', '2019-02-26 10:53:41');
INSERT INTO `work_user_asset_logs` VALUES (287, 64, 'money', 'user_pay', 130.00, '购物支付【N2019022611045019532】', '会员购物扣款，订单号：N2019022611045019532', 1, '2019-02-26 11:05:00', '2019-02-26 11:05:00');
INSERT INTO `work_user_asset_logs` VALUES (288, 1, 'money', 'user_pay', 139.00, '购物支付【N2019022613395762761】', '会员购物扣款，订单号：N2019022613395762761', 1, '2019-02-26 13:40:09', '2019-02-26 13:40:09');
INSERT INTO `work_user_asset_logs` VALUES (289, 1, 'money', 'user_pay', 83.00, '购物支付【N2019022613482556585】', '会员购物扣款，订单号：N2019022613482556585', 1, '2019-02-26 13:48:47', '2019-02-26 13:48:47');
INSERT INTO `work_user_asset_logs` VALUES (290, 1, 'money', 'user_pay', 135.00, '购物支付【N2019022613510520134】', '会员购物扣款，订单号：N2019022613510520134', 1, '2019-02-26 13:51:21', '2019-02-26 13:51:21');
INSERT INTO `work_user_asset_logs` VALUES (291, 62, 'span', 'pay_span', 100.00, '缴纳诚信保证金', '缴纳诚信保证金', 1, '2019-03-23 11:47:32', '2019-03-23 11:47:32');
INSERT INTO `work_user_asset_logs` VALUES (292, 62, 'span', 'pay_span', 100.00, '缴纳诚信保证金', '缴纳诚信保证金', 1, '2019-03-23 13:12:41', '2019-03-23 13:12:41');
INSERT INTO `work_user_asset_logs` VALUES (293, 62, 'span', 'pay_span', 100.00, '缴纳诚信保证金', '缴纳诚信保证金', 1, '2019-03-25 10:47:19', '2019-03-25 10:47:19');
INSERT INTO `work_user_asset_logs` VALUES (294, 62, 'span', 'pay_span', 100.00, '缴纳诚信保证金', '缴纳诚信保证金', 1, '2019-03-25 11:40:14', '2019-03-25 11:40:14');
INSERT INTO `work_user_asset_logs` VALUES (295, 62, 'span', 'pay_span', 100.00, '缴纳诚信保证金', '缴纳诚信保证金', 1, '2019-03-25 14:06:56', '2019-03-25 14:06:56');
INSERT INTO `work_user_asset_logs` VALUES (296, 7, 'span', 'pay_span', 2000.00, '缴纳诚信保证金', '缴纳诚信保证金', 1, '2019-03-25 15:22:37', '2019-03-25 15:22:37');
INSERT INTO `work_user_asset_logs` VALUES (297, 7, 'span', 'pay_span', 2000.00, '缴纳诚信保证金', '缴纳诚信保证金', 1, '2019-03-25 15:26:14', '2019-03-25 15:26:14');
INSERT INTO `work_user_asset_logs` VALUES (298, 7, 'span', 'pay_span', 2000.00, '缴纳诚信保证金', '缴纳诚信保证金', 1, '2019-03-25 16:56:05', '2019-03-25 16:56:05');
INSERT INTO `work_user_asset_logs` VALUES (299, 7, 'span', 'pay_span', 2000.00, '缴纳诚信保证金', '缴纳诚信保证金', 1, '2019-03-26 13:55:40', '2019-03-26 13:55:40');
INSERT INTO `work_user_asset_logs` VALUES (300, 7, 'span', 'pay_span', 20000.00, '缴纳诚信保证金', '缴纳诚信保证金', 1, '2019-03-28 19:51:27', '2019-03-28 19:51:27');
COMMIT;

-- ----------------------------
-- Table structure for work_user_assets
-- ----------------------------
DROP TABLE IF EXISTS `work_user_assets`;
CREATE TABLE `work_user_assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `score` decimal(10,2) DEFAULT '0.00' COMMENT '积分',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  `span` decimal(10,2) DEFAULT '0.00' COMMENT '诚信保证金',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user_assets
-- ----------------------------
BEGIN;
INSERT INTO `work_user_assets` VALUES (1, 1, 12340156.01, 9997881.00, 1, '2018-11-10 09:28:14', '2018-11-10 09:28:14', 0.00);
INSERT INTO `work_user_assets` VALUES (2, 2, 25002603.88, 3785.00, 1, '2018-11-10 13:43:52', '2018-11-10 13:43:52', 0.00);
INSERT INTO `work_user_assets` VALUES (3, 3, 20000.00, 1.00, 1, '2018-11-10 15:04:28', '2018-11-10 15:04:28', 0.00);
INSERT INTO `work_user_assets` VALUES (4, 4, 985596.26, 999936.00, 1, '2018-11-10 15:06:37', '2018-11-10 15:06:37', 0.00);
INSERT INTO `work_user_assets` VALUES (5, 5, 0.00, 0.00, 1, '2018-11-10 16:00:30', '2018-11-10 16:00:30', 0.00);
INSERT INTO `work_user_assets` VALUES (6, 6, 0.00, 0.00, 1, '2018-11-10 16:42:53', '2018-11-10 16:42:53', 0.00);
INSERT INTO `work_user_assets` VALUES (7, 7, 970742.00, 258.00, 1, '2018-11-10 17:38:14', '2018-11-10 17:38:14', 28000.00);
INSERT INTO `work_user_assets` VALUES (8, 8, 98706.33, 917.00, 1, '2018-11-12 11:17:55', '2018-11-12 11:17:55', 0.00);
INSERT INTO `work_user_assets` VALUES (9, 9, 2000188.00, 2000.00, 1, '2018-11-12 12:45:53', '2018-11-12 12:45:53', 0.00);
INSERT INTO `work_user_assets` VALUES (10, 10, 0.00, 0.00, 1, '2018-11-12 14:27:08', '2018-11-12 14:27:08', 0.00);
INSERT INTO `work_user_assets` VALUES (11, 11, 0.00, 0.00, 1, '2018-11-12 15:08:12', '2018-11-12 15:08:12', 0.00);
INSERT INTO `work_user_assets` VALUES (12, 12, 0.00, 0.00, 1, '2018-11-12 17:19:46', '2018-11-12 17:19:46', 0.00);
INSERT INTO `work_user_assets` VALUES (13, 13, 9999960.00, 0.00, 1, '2018-11-12 22:35:49', '2018-11-12 22:35:49', 0.00);
INSERT INTO `work_user_assets` VALUES (14, 14, 12334464.00, 0.00, 1, '2018-11-14 10:19:52', '2018-11-14 10:19:52', 0.00);
INSERT INTO `work_user_assets` VALUES (15, 15, 26246.99, 1.00, 1, '2018-11-14 11:13:22', '2018-11-14 11:13:22', 0.00);
INSERT INTO `work_user_assets` VALUES (16, 16, 0.00, 0.00, 1, '2018-11-14 14:00:18', '2018-11-14 14:00:18', 0.00);
INSERT INTO `work_user_assets` VALUES (17, 17, 98500.50, 100005.00, 1, '2018-11-15 14:52:24', '2018-11-15 14:52:24', 0.00);
INSERT INTO `work_user_assets` VALUES (18, 18, 0.00, 0.00, 1, '2018-11-16 10:18:07', '2018-11-16 10:18:07', 0.00);
INSERT INTO `work_user_assets` VALUES (19, 19, 10000000.00, 0.00, 1, '2018-11-16 17:17:22', '2018-11-16 17:17:22', 0.00);
INSERT INTO `work_user_assets` VALUES (20, 20, 10000.00, 1.00, 1, '2018-11-17 11:59:22', '2018-11-17 11:59:22', 0.00);
INSERT INTO `work_user_assets` VALUES (21, 21, 96040.00, 9790.00, 1, '2018-11-17 13:59:12', '2018-11-17 13:59:12', 0.00);
INSERT INTO `work_user_assets` VALUES (22, 22, 0.00, 0.00, 1, '2018-11-17 14:17:32', '2018-11-17 14:17:32', 0.00);
INSERT INTO `work_user_assets` VALUES (23, 23, 0.00, 0.00, 1, '2018-11-17 14:19:54', '2018-11-17 14:19:54', 0.00);
INSERT INTO `work_user_assets` VALUES (24, 24, 0.00, 20.00, 1, '2018-11-17 15:21:32', '2018-11-17 15:21:32', 0.00);
INSERT INTO `work_user_assets` VALUES (25, 25, 0.00, 1.00, 1, '2018-11-17 15:39:17', '2018-11-17 15:39:17', 0.00);
INSERT INTO `work_user_assets` VALUES (26, 26, 0.00, 2.00, 1, '2018-11-17 15:49:36', '2018-11-17 15:49:36', 0.00);
INSERT INTO `work_user_assets` VALUES (27, 27, 0.00, 1.00, 1, '2018-11-17 16:32:15', '2018-11-17 16:32:15', 0.00);
INSERT INTO `work_user_assets` VALUES (28, 28, 9189.00, 1002.00, 1, '2018-11-19 12:25:09', '2018-11-19 12:25:09', 0.00);
INSERT INTO `work_user_assets` VALUES (29, 29, 0.00, 0.00, 1, '2018-11-19 12:51:39', '2018-11-19 12:51:39', 0.00);
INSERT INTO `work_user_assets` VALUES (30, 30, 0.00, 0.00, 1, '2018-11-19 16:28:19', '2018-11-19 16:28:19', 0.00);
INSERT INTO `work_user_assets` VALUES (31, 31, 8709.98, 1.00, 1, '2018-11-19 17:32:59', '2018-11-19 17:32:59', 0.00);
INSERT INTO `work_user_assets` VALUES (32, 32, 0.00, 1.00, 1, '2018-11-20 14:07:51', '2018-11-20 14:07:51', 0.00);
INSERT INTO `work_user_assets` VALUES (33, 33, 0.00, 0.00, 1, '2018-11-20 16:57:45', '2018-11-20 16:57:45', 0.00);
INSERT INTO `work_user_assets` VALUES (34, 34, 371.00, 0.00, 1, '2018-11-21 09:09:56', '2018-11-21 09:09:56', 0.00);
INSERT INTO `work_user_assets` VALUES (35, 35, 100.00, 1000.00, 1, '2018-11-22 10:18:03', '2018-11-22 10:18:03', 0.00);
INSERT INTO `work_user_assets` VALUES (36, 36, 0.00, 1.00, 1, '2018-11-24 14:10:01', '2018-11-24 14:10:01', 0.00);
INSERT INTO `work_user_assets` VALUES (37, 37, 2000.00, 0.00, 1, '2018-11-26 09:32:37', '2018-11-26 09:32:37', 0.00);
INSERT INTO `work_user_assets` VALUES (38, 38, 0.00, 0.00, 1, '2018-11-26 16:18:07', '2018-11-26 16:18:07', 0.00);
INSERT INTO `work_user_assets` VALUES (39, 39, 0.00, 0.00, 1, '2018-11-26 19:23:04', '2018-11-26 19:23:04', 0.00);
INSERT INTO `work_user_assets` VALUES (40, 40, 1000000.00, 0.00, 1, '2018-11-27 10:22:03', '2018-11-27 10:22:03', 0.00);
INSERT INTO `work_user_assets` VALUES (41, 41, 100000.00, 0.00, 1, '2018-11-27 10:22:47', '2018-11-27 10:22:47', 0.00);
INSERT INTO `work_user_assets` VALUES (42, 42, 100000.00, 0.00, 1, '2018-11-27 14:30:19', '2018-11-27 14:30:19', 0.00);
INSERT INTO `work_user_assets` VALUES (43, 43, 888334.00, 151515.00, 1, '2018-11-27 18:26:57', '2018-11-27 18:26:57', 0.00);
INSERT INTO `work_user_assets` VALUES (44, 44, 109260.00, 151529.00, 1, '2018-11-28 15:28:58', '2018-11-28 15:28:58', 0.00);
INSERT INTO `work_user_assets` VALUES (45, 45, 100000.00, 151515.00, 1, '2018-11-28 17:35:38', '2018-11-28 17:35:38', 0.00);
INSERT INTO `work_user_assets` VALUES (46, 46, 599454.00, 51515.00, 1, '2018-11-29 16:38:18', '2018-11-29 16:38:18', 0.00);
INSERT INTO `work_user_assets` VALUES (47, 47, 110000.00, 151515.00, 1, '2018-11-30 11:28:49', '2018-11-30 11:28:49', 0.00);
INSERT INTO `work_user_assets` VALUES (48, 48, 100731.00, 161415.00, 1, '2018-12-01 15:03:02', '2018-12-01 15:03:02', 0.00);
INSERT INTO `work_user_assets` VALUES (49, 49, 139256.00, 1970.00, 1, '2018-12-03 13:42:17', '2018-12-03 13:42:17', 0.00);
INSERT INTO `work_user_assets` VALUES (50, 50, 0.00, 0.00, 1, '2018-12-04 14:02:20', '2018-12-04 14:02:20', 0.00);
INSERT INTO `work_user_assets` VALUES (51, 51, 0.00, 0.00, 1, '2018-12-04 14:07:35', '2018-12-04 14:07:35', 0.00);
INSERT INTO `work_user_assets` VALUES (52, 52, 0.00, 0.00, 1, '2018-12-04 14:11:54', '2018-12-04 14:11:54', 0.00);
INSERT INTO `work_user_assets` VALUES (53, 53, 0.00, 0.00, 1, '2018-12-04 14:13:04', '2018-12-04 14:13:04', 0.00);
INSERT INTO `work_user_assets` VALUES (54, 54, 0.00, 0.00, 1, '2018-12-04 14:14:09', '2018-12-04 14:14:09', 0.00);
INSERT INTO `work_user_assets` VALUES (55, 55, 0.00, 0.00, 1, '2018-12-04 14:14:58', '2018-12-04 14:14:58', 0.00);
INSERT INTO `work_user_assets` VALUES (56, 56, 0.00, 0.00, 1, '2018-12-05 09:51:56', '2018-12-05 09:51:56', 0.00);
INSERT INTO `work_user_assets` VALUES (57, 57, 0.00, 0.00, 1, '2018-12-05 19:00:00', '2018-12-05 19:00:00', 0.00);
INSERT INTO `work_user_assets` VALUES (58, 58, 0.00, 0.00, 1, '2018-12-05 20:23:41', '2018-12-05 20:23:41', 0.00);
INSERT INTO `work_user_assets` VALUES (59, 59, 0.00, 0.00, 1, '2019-01-24 14:58:07', '2019-01-24 14:58:07', 0.00);
INSERT INTO `work_user_assets` VALUES (60, 60, 0.00, 0.00, 1, '2019-02-11 11:33:31', '2019-02-11 11:33:31', 0.00);
INSERT INTO `work_user_assets` VALUES (61, 61, 0.00, 0.00, 1, '2019-02-13 15:41:32', '2019-02-13 15:41:32', 0.00);
INSERT INTO `work_user_assets` VALUES (62, 62, 48361.00, 0.00, 1, '2019-02-14 17:55:51', '2019-02-14 17:55:51', 500.00);
INSERT INTO `work_user_assets` VALUES (63, 63, 46572.00, 0.00, 1, '2019-02-14 17:59:45', '2019-02-14 17:59:45', 0.00);
INSERT INTO `work_user_assets` VALUES (64, 64, 620.00, 459.00, 1, '2019-02-22 11:02:25', '2019-02-22 11:02:25', 0.00);
INSERT INTO `work_user_assets` VALUES (65, 65, 9870.00, 22.00, 1, '2019-02-22 13:12:12', '2019-02-22 13:12:12', 0.00);
INSERT INTO `work_user_assets` VALUES (66, 66, 5200.00, 0.00, 1, '2019-02-23 08:36:04', '2019-02-23 08:36:04', 0.00);
COMMIT;

-- ----------------------------
-- Table structure for work_user_auths
-- ----------------------------
DROP TABLE IF EXISTS `work_user_auths`;
CREATE TABLE `work_user_auths` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(255) DEFAULT NULL COMMENT '用户身份证号',
  `id_card_front_img` varchar(255) DEFAULT NULL COMMENT '身份证正面照',
  `id_card_back_img` varchar(255) DEFAULT NULL COMMENT '身份证反面照',
  `imgs` text COMMENT '其他认证提交的图片数据',
  `status` tinyint(1) DEFAULT '0' COMMENT '用户认证状态：0未认证1待审核2审核未通过3审核通过',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0假删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user_auths
-- ----------------------------
BEGIN;
INSERT INTO `work_user_auths` VALUES (1, 17, 'vgg', '55555569008845555X', '/public/upload/applet/tmp_6cd82b5c9271f5b46f99a1efbbfb97190be312d914c6f691.jpg', '/public/upload/applet/tmp_7d46d54ac8c5eaad46fade0491f22cbdafe396147dc24380.jpg', '[]', 3, 1, '2018-11-17 16:08:13', '2018-11-17 16:08:13');
INSERT INTO `work_user_auths` VALUES (2, 4, '我的', '430681199607087619', '/public/upload/applet/tmp_e3e70a9e217442d1c93f3c983a683d22772cee02a9e777c7.jpg', '/public/upload/applet/tmp_5047a5fb42e9219ffa7b04cfb14ee28c6fce1d49cc78b060.jpg', '[]', 3, 1, '2018-11-28 15:19:59', '2018-11-28 15:20:38');
INSERT INTO `work_user_auths` VALUES (4, 49, '长沙彭于晏', '4501000000000000000', '/public/upload/user_images/20181205/1fd345da12353f3e18b2b18781964e86.jpg', '/public/upload/user_images/20181205/50ae7f6f582f2b858c2ed7945cee9529.jpg', '[]', 3, 1, '2018-12-03 15:04:07', '2018-12-05 14:33:48');
COMMIT;

-- ----------------------------
-- Table structure for work_user_commission_logs
-- ----------------------------
DROP TABLE IF EXISTS `work_user_commission_logs`;
CREATE TABLE `work_user_commission_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `order_goods_id` bigint(20) NOT NULL COMMENT '订单商品ID',
  `level` tinyint(1) NOT NULL COMMENT '所处分销商层级',
  `expect_money` decimal(10,2) DEFAULT NULL COMMENT '预计佣金：下单时计算的佣金',
  `real_commisson_money` decimal(10,2) DEFAULT NULL COMMENT '分佣总金额',
  `real_commission_rate` decimal(10,2) DEFAULT NULL COMMENT '分佣比例',
  `real_money` decimal(10,2) DEFAULT NULL COMMENT '真实佣金：订单完成后的佣金',
  `already_drawcash_money` decimal(10,2) DEFAULT '0.00' COMMENT '已提现金额',
  `source_user_id` bigint(20) NOT NULL COMMENT '来源会员ID',
  `order_status` tinyint(1) DEFAULT '1' COMMENT '订单状态：1待付款2已付款3已完成',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：0未申请提现1申请提现中2申请未通过3审核通过',
  `commission_apply_id` bigint(20) DEFAULT NULL COMMENT '申请提现的ID',
  `apply_no` varchar(255) DEFAULT NULL COMMENT '申请提现的单号',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user_commission_logs
-- ----------------------------
BEGIN;
INSERT INTO `work_user_commission_logs` VALUES (1, 2, 181, 22, 204, 1, 25.80, 129.00, 20.00, 25.80, 25.80, 34, 3, 3, 1, 'F2018112109252175447', 1, '2018-11-21 09:10:36', '2018-11-21 09:26:30');
INSERT INTO `work_user_commission_logs` VALUES (2, 4, 254, 18, 282, 1, 24.00, 120.00, 20.00, 24.00, 0.00, 44, 3, 1, 1, 'F2018112817364093362', 1, '2018-11-28 15:29:45', '2018-11-28 17:38:42');
INSERT INTO `work_user_commission_logs` VALUES (3, 4, 255, 18, 283, 1, 20.00, NULL, 20.00, NULL, 0.00, 44, 2, 0, NULL, NULL, 1, '2018-11-28 17:37:46', '2018-11-28 17:37:50');
INSERT INTO `work_user_commission_logs` VALUES (4, 4, 256, 18, 284, 1, 0.01, 100.00, 0.01, 0.01, 0.00, 44, 3, 1, 4, 'F2018112817540444331', 1, '2018-11-28 17:49:48', '2018-11-28 17:54:04');
INSERT INTO `work_user_commission_logs` VALUES (5, 4, 257, 18, 285, 1, 0.01, 100.00, 0.01, 0.01, 0.01, 44, 3, 3, 5, 'F2018112915432460253', 1, '2018-11-28 17:54:28', '2018-11-29 16:23:37');
INSERT INTO `work_user_commission_logs` VALUES (6, 4, 260, 18, 288, 1, 0.01, 100.00, 0.01, 0.01, 0.01, 44, 3, 3, 6, 'F2018112916232034019', 1, '2018-11-29 16:21:36', '2018-11-29 16:23:30');
INSERT INTO `work_user_commission_logs` VALUES (7, 4, 261, 18, 289, 1, 0.01, 100.00, 0.01, 0.01, 0.01, 44, 3, 3, 7, 'F2018112917230014945', 1, '2018-11-29 16:23:55', '2018-11-29 17:23:33');
INSERT INTO `work_user_commission_logs` VALUES (8, 2, 264, 22, 292, 1, 14.19, NULL, 11.00, NULL, 0.00, 46, 2, 0, NULL, NULL, 1, '2018-11-29 17:18:27', '2018-11-29 17:18:32');
INSERT INTO `work_user_commission_logs` VALUES (9, 2, 265, 22, 293, 1, 14.19, NULL, 11.00, NULL, 0.00, 46, 2, 0, NULL, NULL, 1, '2018-11-29 17:21:11', '2018-11-29 17:21:17');
INSERT INTO `work_user_commission_logs` VALUES (10, 2, 266, 22, 294, 1, 14.19, 129.00, 11.00, 14.19, 0.00, 46, 3, 1, 10, 'F2019022210153967556', 1, '2018-11-29 17:23:11', '2019-02-22 10:15:39');
INSERT INTO `work_user_commission_logs` VALUES (11, 4, 267, 18, 295, 1, 0.10, NULL, 0.10, NULL, 0.00, 44, 1, 0, NULL, NULL, 1, '2018-11-29 17:26:04', '2018-11-29 17:26:04');
INSERT INTO `work_user_commission_logs` VALUES (12, 4, 268, 18, 296, 1, 0.10, 100.00, 0.10, 0.10, 0.00, 44, 3, 1, 8, 'F2018120309382488569', 1, '2018-11-29 17:26:07', '2018-12-03 09:38:24');
INSERT INTO `work_user_commission_logs` VALUES (13, 21, 270, 38, 298, 1, 1000.00, NULL, 0.10, NULL, 0.00, 48, 2, 0, NULL, NULL, 1, '2018-12-01 16:34:01', '2018-12-01 16:37:38');
INSERT INTO `work_user_commission_logs` VALUES (14, 44, 272, 18, 300, 1, 1.00, NULL, 1.00, NULL, 0.00, 44, 2, 0, NULL, NULL, 1, '2018-12-03 09:40:26', '2018-12-03 09:40:30');
INSERT INTO `work_user_commission_logs` VALUES (15, 4, 272, 18, 300, 2, 10.00, NULL, 10.00, NULL, 0.00, 44, 2, 0, NULL, NULL, 1, '2018-12-03 09:40:26', '2018-12-03 09:40:30');
INSERT INTO `work_user_commission_logs` VALUES (16, 44, 273, 18, 301, 1, 1.00, 100.00, 1.00, 1.00, 0.00, 44, 3, 0, NULL, NULL, 1, '2018-12-03 09:41:54', '2018-12-03 09:42:11');
INSERT INTO `work_user_commission_logs` VALUES (17, 4, 273, 18, 301, 2, 10.00, 100.00, 10.00, 10.00, 0.00, 44, 3, 1, 9, 'F2018120309430940558', 1, '2018-12-03 09:41:54', '2018-12-03 09:43:09');
INSERT INTO `work_user_commission_logs` VALUES (18, 48, 277, 21, 305, 1, 18.75, NULL, 15.00, NULL, 0.00, 48, 1, 0, NULL, NULL, 1, '2018-12-03 15:16:08', '2018-12-03 15:16:08');
INSERT INTO `work_user_commission_logs` VALUES (19, 21, 277, 21, 305, 2, 12.50, NULL, 10.00, NULL, 0.00, 48, 1, 0, NULL, NULL, 1, '2018-12-03 15:16:08', '2018-12-03 15:16:08');
INSERT INTO `work_user_commission_logs` VALUES (20, 48, 278, 21, 306, 1, 18.75, NULL, 15.00, NULL, 0.00, 48, 1, 0, NULL, NULL, 1, '2018-12-03 15:16:31', '2018-12-03 15:16:31');
INSERT INTO `work_user_commission_logs` VALUES (21, 21, 278, 21, 306, 2, 12.50, NULL, 10.00, NULL, 0.00, 48, 1, 0, NULL, NULL, 1, '2018-12-03 15:16:31', '2018-12-03 15:16:31');
INSERT INTO `work_user_commission_logs` VALUES (22, 2, 279, 21, 307, 1, 13.20, 120.00, 11.00, 13.20, 0.00, 2, 3, 1, 10, 'F2019022210153967556', 1, '2018-12-03 16:30:11', '2019-02-22 10:15:39');
INSERT INTO `work_user_commission_logs` VALUES (23, 15, 281, 21, 309, 1, 1.25, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-03 17:05:42', '2018-12-03 17:05:46');
INSERT INTO `work_user_commission_logs` VALUES (24, 15, 282, 18, 310, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-03 17:06:54', '2018-12-03 17:06:58');
INSERT INTO `work_user_commission_logs` VALUES (25, 2, 288, 21, 316, 1, 13.75, NULL, 11.00, NULL, 0.00, 2, 1, 0, NULL, NULL, 1, '2018-12-03 19:12:28', '2018-12-03 19:12:28');
INSERT INTO `work_user_commission_logs` VALUES (26, 4, 295, 23, 323, 1, 5.62, NULL, 1.00, NULL, 0.00, 4, 1, 0, NULL, NULL, 1, '2018-12-04 11:35:51', '2018-12-04 11:35:51');
INSERT INTO `work_user_commission_logs` VALUES (27, 4, 296, 19, 324, 1, 3.00, NULL, 1.00, NULL, 0.00, 4, 2, 0, NULL, NULL, 1, '2018-12-04 11:35:59', '2018-12-04 11:36:08');
INSERT INTO `work_user_commission_logs` VALUES (28, 15, 297, 18, 325, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-04 11:39:08', '2018-12-04 11:39:16');
INSERT INTO `work_user_commission_logs` VALUES (29, 15, 298, 18, 326, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-04 11:40:17', '2018-12-04 11:40:24');
INSERT INTO `work_user_commission_logs` VALUES (30, 15, 299, 18, 327, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-04 11:44:45', '2018-12-04 11:44:53');
INSERT INTO `work_user_commission_logs` VALUES (31, 15, 300, 18, 328, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-04 11:49:40', '2018-12-04 11:49:48');
INSERT INTO `work_user_commission_logs` VALUES (32, 15, 301, 18, 329, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-04 12:25:47', '2018-12-04 12:25:56');
INSERT INTO `work_user_commission_logs` VALUES (33, 15, 302, 18, 330, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-04 12:26:48', '2018-12-04 12:26:57');
INSERT INTO `work_user_commission_logs` VALUES (34, 15, 303, 18, 331, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-04 13:41:22', '2018-12-04 13:41:32');
INSERT INTO `work_user_commission_logs` VALUES (35, 15, 304, 18, 332, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 1, 0, NULL, NULL, 1, '2018-12-04 13:43:11', '2018-12-04 13:43:11');
INSERT INTO `work_user_commission_logs` VALUES (36, 15, 305, 18, 333, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 1, 0, NULL, NULL, 1, '2018-12-04 13:45:57', '2018-12-04 13:45:57');
INSERT INTO `work_user_commission_logs` VALUES (37, 15, 306, 18, 334, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 1, 0, NULL, NULL, 1, '2018-12-04 13:49:18', '2018-12-04 13:49:18');
INSERT INTO `work_user_commission_logs` VALUES (38, 15, 307, 18, 335, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-04 13:49:39', '2018-12-04 13:50:01');
INSERT INTO `work_user_commission_logs` VALUES (39, 15, 308, 18, 336, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-04 13:52:57', '2018-12-04 13:53:21');
INSERT INTO `work_user_commission_logs` VALUES (40, 15, 309, 18, 337, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-04 13:57:11', '2018-12-04 13:57:32');
INSERT INTO `work_user_commission_logs` VALUES (41, 15, 310, 18, 338, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 1, 0, NULL, NULL, 1, '2018-12-04 13:58:48', '2018-12-04 13:58:48');
INSERT INTO `work_user_commission_logs` VALUES (42, 15, 311, 18, 339, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-04 14:09:09', '2018-12-04 14:09:16');
INSERT INTO `work_user_commission_logs` VALUES (43, 4, 312, 21, 340, 1, 1.25, NULL, 1.00, NULL, 0.00, 4, 2, 0, NULL, NULL, 1, '2018-12-04 14:10:37', '2018-12-04 14:10:55');
INSERT INTO `work_user_commission_logs` VALUES (44, 4, 313, 20, 341, 1, 1.00, NULL, 1.00, NULL, 0.00, 4, 1, 0, NULL, NULL, 1, '2018-12-04 14:13:24', '2018-12-04 14:13:24');
INSERT INTO `work_user_commission_logs` VALUES (45, 15, 315, 18, 343, 1, 1.00, NULL, 1.00, NULL, 0.00, 15, 2, 0, NULL, NULL, 1, '2018-12-04 14:26:22', '2018-12-04 14:26:30');
INSERT INTO `work_user_commission_logs` VALUES (46, 49, 334, 62, 386, 1, 524.85, 3499.00, 15.00, 524.85, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (47, 49, 334, 54, 385, 1, 45.30, 302.00, 15.00, 45.30, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (48, 49, 334, 67, 384, 1, 959.70, 6398.00, 15.00, 959.70, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (49, 49, 334, 70, 383, 1, 599.85, 3999.00, 15.00, 599.85, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (50, 49, 334, 69, 382, 1, 1424.85, 9499.00, 15.00, 1424.85, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (51, 49, 334, 68, 381, 1, 239.70, 1598.00, 15.00, 239.70, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (52, 49, 334, 66, 380, 1, 1049.85, 6999.00, 15.00, 1049.85, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (53, 49, 334, 65, 379, 1, 749.85, 4999.00, 15.00, 749.85, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (54, 49, 334, 64, 378, 1, 1424.85, 9499.00, 15.00, 1424.85, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (55, 49, 334, 63, 377, 1, 824.85, 5499.00, 15.00, 824.85, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (56, 49, 334, 110, 376, 1, 20.85, 139.00, 15.00, 20.85, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (57, 49, 334, 109, 375, 1, 22.35, 149.00, 15.00, 22.35, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (58, 49, 334, 108, 374, 1, 12.45, 83.00, 15.00, 12.45, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (59, 49, 334, 107, 373, 1, 23.25, 155.00, 15.00, 23.25, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (60, 49, 334, 106, 372, 1, 22.50, 150.00, 15.00, 22.50, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (61, 49, 334, 103, 371, 1, 40.50, 270.00, 15.00, 40.50, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (62, 49, 334, 104, 370, 1, 61.20, 408.00, 15.00, 61.20, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (63, 49, 334, 86, 369, 1, 31.35, 209.00, 15.00, 31.35, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (64, 49, 334, 85, 368, 1, 112.35, 749.00, 15.00, 112.35, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (65, 49, 334, 84, 367, 1, 29.85, 199.00, 15.00, 29.85, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (66, 49, 334, 83, 366, 1, 113.70, 758.00, 15.00, 113.70, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:08');
INSERT INTO `work_user_commission_logs` VALUES (67, 49, 334, 82, 365, 1, 38.85, 259.00, 15.00, 38.85, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:09');
INSERT INTO `work_user_commission_logs` VALUES (68, 49, 334, 81, 364, 1, 22.20, 148.00, 15.00, 22.20, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:09');
INSERT INTO `work_user_commission_logs` VALUES (69, 49, 334, 80, 363, 1, 44.70, 298.00, 15.00, 44.70, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:09');
INSERT INTO `work_user_commission_logs` VALUES (70, 49, 334, 79, 362, 1, 44.70, 298.00, 15.00, 44.70, 0.00, 49, 3, 0, NULL, NULL, 1, '2018-12-06 18:24:13', '2018-12-06 18:29:09');
INSERT INTO `work_user_commission_logs` VALUES (71, 48, 342, 40, 394, 1, 50.00, 100.00, 50.00, 50.00, 0.00, 48, 3, 0, NULL, NULL, 1, '2019-01-24 18:33:33', '2019-01-24 18:34:17');
INSERT INTO `work_user_commission_logs` VALUES (72, 44, 343, 108, 395, 1, 4.15, NULL, 5.00, NULL, 0.00, 45, 1, 0, NULL, NULL, 1, '2019-01-24 18:47:24', '2019-01-24 18:47:24');
INSERT INTO `work_user_commission_logs` VALUES (73, 17, 345, 109, 397, 1, 3.00, 3.00, 100.00, 3.00, 0.00, 17, 3, 0, NULL, NULL, 1, '2019-01-27 16:21:59', '2019-01-29 17:10:36');
INSERT INTO `work_user_commission_logs` VALUES (74, 15, 347, 110, 399, 1, 6.95, 139.00, 5.00, 6.95, 0.00, 15, 3, 0, NULL, NULL, 1, '2019-01-29 16:44:49', '2019-01-31 09:47:01');
INSERT INTO `work_user_commission_logs` VALUES (75, 48, 350, 109, 402, 1, 30.00, 30.00, 100.00, 30.00, 0.00, 48, 3, 0, NULL, NULL, 1, '2019-02-13 14:13:18', '2019-02-13 14:14:18');
INSERT INTO `work_user_commission_logs` VALUES (76, 21, 350, 109, 402, 2, 1.50, 1.50, 100.00, 1.50, 0.00, 48, 3, 0, NULL, NULL, 1, '2019-02-13 14:13:18', '2019-02-13 14:14:18');
INSERT INTO `work_user_commission_logs` VALUES (77, 62, 351, 107, 403, 1, 7.75, NULL, 5.00, NULL, 0.00, 63, 2, 0, NULL, NULL, 1, '2019-02-14 18:01:54', '2019-02-14 18:02:01');
INSERT INTO `work_user_commission_logs` VALUES (78, 62, 352, 100, 404, 1, 11.45, NULL, 5.00, NULL, 0.00, 63, 2, 0, NULL, NULL, 1, '2019-02-14 18:03:26', '2019-02-14 18:03:51');
INSERT INTO `work_user_commission_logs` VALUES (79, 62, 353, 104, 405, 1, 20.40, NULL, 5.00, NULL, 0.00, 63, 2, 0, NULL, NULL, 1, '2019-02-14 18:05:13', '2019-02-14 18:05:20');
INSERT INTO `work_user_commission_logs` VALUES (80, 62, 354, 101, 406, 1, 6.95, NULL, 5.00, NULL, 0.00, 63, 2, 0, NULL, NULL, 1, '2019-02-14 18:10:28', '2019-02-14 18:10:36');
INSERT INTO `work_user_commission_logs` VALUES (81, 62, 355, 96, 407, 1, 49.90, NULL, 5.00, NULL, 0.00, 63, 2, 0, NULL, NULL, 1, '2019-02-14 18:11:25', '2019-02-14 18:11:33');
INSERT INTO `work_user_commission_logs` VALUES (82, 62, 356, 95, 408, 1, 74.95, NULL, 5.00, NULL, 0.00, 63, 2, 0, NULL, NULL, 1, '2019-02-14 18:12:24', '2019-02-14 18:12:32');
INSERT INTO `work_user_commission_logs` VALUES (83, 62, 357, 101, 409, 1, 6.95, 139.00, 5.00, 6.95, 0.00, 62, 3, 0, NULL, NULL, 1, '2019-02-15 09:33:31', '2019-02-15 09:38:32');
INSERT INTO `work_user_commission_logs` VALUES (84, 64, 371, 40, 423, 1, 50.00, NULL, 50.00, NULL, 0.00, 64, 2, 0, NULL, NULL, 1, '2019-02-23 09:58:07', '2019-02-23 09:58:18');
INSERT INTO `work_user_commission_logs` VALUES (85, 64, 372, 98, 424, 1, 29.90, NULL, 5.00, NULL, 0.00, 64, 1, 0, NULL, NULL, 1, '2019-02-23 11:20:33', '2019-02-23 11:20:33');
INSERT INTO `work_user_commission_logs` VALUES (86, 2, 373, 99, 425, 1, 15.90, 159.00, 10.00, 15.90, 0.00, 46, 3, 1, 11, 'F2019022313243110460', 1, '2019-02-23 13:20:11', '2019-02-23 13:24:31');
INSERT INTO `work_user_commission_logs` VALUES (87, 15, 376, 109, 428, 1, 30.00, 30.00, 100.00, 30.00, 0.00, 15, 3, 0, NULL, NULL, 1, '2019-02-23 16:42:01', '2019-02-23 16:48:42');
INSERT INTO `work_user_commission_logs` VALUES (88, 21, 377, 104, 429, 1, 20.40, NULL, 5.00, NULL, 0.00, 21, 2, 0, NULL, NULL, 1, '2019-02-23 16:50:03', '2019-02-23 16:52:01');
INSERT INTO `work_user_commission_logs` VALUES (89, 21, 378, 102, 430, 1, 198.00, 3960.00, 5.00, 198.00, 0.00, 21, 3, 0, NULL, NULL, 1, '2019-02-23 16:52:14', '2019-02-23 16:53:51');
INSERT INTO `work_user_commission_logs` VALUES (90, 43, 381, 111, 433, 1, 11.10, NULL, 5.00, NULL, 0.00, 43, 1, 0, NULL, NULL, 1, '2019-02-24 12:09:54', '2019-02-24 12:09:54');
INSERT INTO `work_user_commission_logs` VALUES (91, 14, 383, 110, 435, 1, 6.95, NULL, 5.00, NULL, 0.00, 14, 1, 0, NULL, NULL, 1, '2019-02-25 17:16:30', '2019-02-25 17:16:30');
INSERT INTO `work_user_commission_logs` VALUES (92, 1, 391, 108, 443, 1, 8.30, NULL, 10.00, NULL, 0.00, 1, 2, 0, NULL, NULL, 1, '2019-02-26 13:48:25', '2019-02-26 13:48:47');
INSERT INTO `work_user_commission_logs` VALUES (93, 1, 392, 103, 444, 1, 13.50, NULL, 10.00, NULL, 0.00, 1, 2, 0, NULL, NULL, 1, '2019-02-26 13:51:05', '2019-02-26 13:51:21');
COMMIT;

-- ----------------------------
-- Table structure for work_user_coupons
-- ----------------------------
DROP TABLE IF EXISTS `work_user_coupons`;
CREATE TABLE `work_user_coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL COMMENT '优惠券编号',
  `activity_coupon_id` bigint(20) NOT NULL COMMENT '优惠券ID',
  `market_activity_id` bigint(20) NOT NULL COMMENT '营销活动ID',
  `coupon_no` varchar(255) NOT NULL COMMENT '优惠券编号',
  `coupon_type` varchar(20) NOT NULL COMMENT '优惠券类别：discount打折券full满减券',
  `expiry_time` datetime NOT NULL COMMENT '到期时间',
  `reach_money` decimal(10,2) NOT NULL COMMENT '满多少元后可用',
  `change_value` decimal(10,2) NOT NULL COMMENT '优惠值：discount打折值full满减金额',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1未使用2已使用',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user_coupons
-- ----------------------------
BEGIN;
INSERT INTO `work_user_coupons` VALUES (1, '4', 4, 2, 'U2018111217413982041', 'discount', '2018-11-12 17:45:07', 10000.00, 7.00, 1, 1, '2018-11-12 17:41:39', '2018-11-12 17:41:39');
INSERT INTO `work_user_coupons` VALUES (2, '4', 6, 14, 'U2018111217421352183', 'full', '2018-11-12 17:45:37', 50.00, 5.00, 1, 1, '2018-11-12 17:42:13', '2018-11-12 17:42:13');
INSERT INTO `work_user_coupons` VALUES (3, '4', 3, 5, 'U2018111217422914046', 'discount', '2018-11-30 17:41:21', 1000.00, 5.00, 2, 1, '2018-11-12 17:42:29', '2018-11-28 15:16:50');
INSERT INTO `work_user_coupons` VALUES (4, '2', 3, 5, 'U2018111400422271408', 'discount', '2018-11-30 17:41:21', 1000.00, 5.00, 1, 1, '2018-11-14 00:42:22', '2018-11-14 00:42:22');
INSERT INTO `work_user_coupons` VALUES (5, '1', 3, 5, 'U2018111710114457813', 'discount', '2018-11-30 17:41:21', 1000.00, 5.00, 1, 1, '2018-11-17 10:11:44', '2018-11-17 10:11:44');
INSERT INTO `work_user_coupons` VALUES (6, '17', 3, 5, 'U2018111909342915933', 'discount', '2018-11-30 17:41:21', 1000.00, 5.00, 1, 1, '2018-11-19 09:34:29', '2018-11-19 09:34:29');
INSERT INTO `work_user_coupons` VALUES (7, '17', 4, 2, 'U2018111909540723808', 'discount', '2018-11-19 09:58:33', 10000.00, 7.00, 1, 1, '2018-11-19 09:54:07', '2018-11-19 09:54:07');
INSERT INTO `work_user_coupons` VALUES (8, '17', 6, 14, 'U2018111909540721320', 'full', '2018-11-19 09:58:23', 50.00, 5.00, 1, 1, '2018-11-19 09:54:07', '2018-11-19 09:54:07');
INSERT INTO `work_user_coupons` VALUES (9, '13', 3, 5, 'U2018111914215572637', 'discount', '2018-11-30 17:41:21', 1000.00, 5.00, 1, 1, '2018-11-19 14:21:55', '2018-11-19 14:21:55');
INSERT INTO `work_user_coupons` VALUES (10, '31', 3, 5, 'U2018112016294319060', 'discount', '2018-11-30 17:41:21', 1000.00, 5.00, 1, 1, '2018-11-20 16:29:43', '2018-11-20 16:29:43');
INSERT INTO `work_user_coupons` VALUES (11, '2', 7, 18, 'U2018112610145682861', 'discount', '2018-11-26 13:14:12', 10.00, 1.00, 1, 1, '2018-11-26 10:14:56', '2018-11-26 10:14:56');
INSERT INTO `work_user_coupons` VALUES (12, '43', 1, 18, 'U2018120115153301785', 'full', '2020-09-26 00:00:00', 1000.00, 100.00, 1, 1, '2018-12-01 15:15:33', '2018-12-01 15:15:33');
INSERT INTO `work_user_coupons` VALUES (13, '43', 6, 18, 'U2018120115153486060', 'full', '2019-01-01 00:00:00', 50.00, 5.00, 1, 1, '2018-12-01 15:15:34', '2018-12-01 15:15:34');
INSERT INTO `work_user_coupons` VALUES (14, '43', 7, 18, 'U2018120115153585141', 'full', '2019-11-15 00:00:00', 100.00, 10.00, 1, 1, '2018-12-01 15:15:35', '2018-12-01 15:15:35');
INSERT INTO `work_user_coupons` VALUES (15, '43', 8, 18, 'U2018120115153543850', 'full', '2019-11-23 00:00:00', 1000.00, 200.00, 1, 1, '2018-12-01 15:15:35', '2018-12-01 15:15:35');
INSERT INTO `work_user_coupons` VALUES (16, '48', 8, 18, 'U2018120309050155343', 'full', '2019-11-23 00:00:00', 1000.00, 200.00, 1, 1, '2018-12-03 09:05:01', '2018-12-03 09:05:01');
INSERT INTO `work_user_coupons` VALUES (17, '48', 7, 18, 'U2018120309050288064', 'full', '2019-11-15 00:00:00', 100.00, 10.00, 1, 1, '2018-12-03 09:05:02', '2018-12-03 09:05:02');
INSERT INTO `work_user_coupons` VALUES (18, '48', 6, 18, 'U2018120309050316012', 'full', '2019-01-01 00:00:00', 50.00, 5.00, 1, 1, '2018-12-03 09:05:03', '2018-12-03 09:05:03');
INSERT INTO `work_user_coupons` VALUES (19, '48', 1, 18, 'U2018120309050469175', 'full', '2020-09-26 00:00:00', 1000.00, 100.00, 1, 1, '2018-12-03 09:05:04', '2018-12-03 09:05:04');
INSERT INTO `work_user_coupons` VALUES (20, '49', 8, 18, 'U2018120314031726420', 'full', '2019-11-23 00:00:00', 1000.00, 200.00, 1, 1, '2018-12-03 14:03:17', '2018-12-03 14:03:17');
INSERT INTO `work_user_coupons` VALUES (21, '49', 7, 18, 'U2018120314032185782', 'full', '2019-11-15 00:00:00', 100.00, 10.00, 1, 1, '2018-12-03 14:03:21', '2018-12-03 14:03:21');
INSERT INTO `work_user_coupons` VALUES (22, '44', 8, 18, 'U2018120314290936989', 'full', '2019-11-23 00:00:00', 1000.00, 200.00, 1, 1, '2018-12-03 14:29:09', '2018-12-03 14:29:09');
INSERT INTO `work_user_coupons` VALUES (23, '44', 7, 18, 'U2018120314291044641', 'full', '2019-11-15 00:00:00', 100.00, 10.00, 1, 1, '2018-12-03 14:29:10', '2018-12-03 14:29:10');
INSERT INTO `work_user_coupons` VALUES (24, '44', 6, 18, 'U2018120314291008749', 'full', '2019-01-01 00:00:00', 50.00, 5.00, 1, 1, '2018-12-03 14:29:10', '2018-12-03 14:29:10');
INSERT INTO `work_user_coupons` VALUES (25, '44', 1, 18, 'U2018120314291154833', 'full', '2020-09-26 00:00:00', 1000.00, 100.00, 1, 1, '2018-12-03 14:29:11', '2018-12-03 14:29:11');
INSERT INTO `work_user_coupons` VALUES (26, '2', 9, 22, 'U2018120315550959217', 'full', '2018-12-03 15:56:41', 20.00, 1.00, 1, 1, '2018-12-03 15:55:09', '2018-12-03 15:55:09');
INSERT INTO `work_user_coupons` VALUES (27, '2', 1, 18, 'U2018120316010629451', 'full', '2020-09-26 00:00:00', 1000.00, 100.00, 1, 1, '2018-12-03 16:01:06', '2018-12-03 16:01:06');
INSERT INTO `work_user_coupons` VALUES (28, '2', 6, 18, 'U2018120316012905778', 'full', '2019-01-01 00:00:00', 50.00, 5.00, 2, 1, '2018-12-03 16:01:29', '2018-12-03 16:30:11');
INSERT INTO `work_user_coupons` VALUES (29, '2', 8, 18, 'U2018120316015763168', 'full', '2019-11-23 00:00:00', 1000.00, 200.00, 1, 1, '2018-12-03 16:01:57', '2018-12-03 16:01:57');
INSERT INTO `work_user_coupons` VALUES (30, '4', 8, 18, 'U2018120316055886700', 'full', '2019-11-23 00:00:00', 1000.00, 200.00, 1, 1, '2018-12-03 16:05:58', '2018-12-03 16:05:58');
INSERT INTO `work_user_coupons` VALUES (31, '4', 7, 18, 'U2018120316055919938', 'full', '2019-11-15 00:00:00', 100.00, 10.00, 1, 1, '2018-12-03 16:05:59', '2018-12-03 16:05:59');
INSERT INTO `work_user_coupons` VALUES (32, '4', 1, 18, 'U2018120316060096888', 'full', '2020-09-26 00:00:00', 1000.00, 100.00, 1, 1, '2018-12-03 16:06:00', '2018-12-03 16:06:00');
INSERT INTO `work_user_coupons` VALUES (33, '1', 8, 18, 'U2019012309573384430', 'full', '2019-11-23 00:00:00', 500.00, 50.00, 1, 1, '2019-01-23 09:57:33', '2019-01-23 09:57:33');
INSERT INTO `work_user_coupons` VALUES (34, '1', 1, 18, 'U2019012815214591647', 'full', '2020-09-26 00:00:00', 2000.00, 200.00, 1, 1, '2019-01-28 15:21:45', '2019-01-28 15:21:45');
INSERT INTO `work_user_coupons` VALUES (35, '1', 7, 18, 'U2019012815215154170', 'full', '2019-11-15 00:00:00', 1000.00, 100.00, 1, 1, '2019-01-28 15:21:51', '2019-01-28 15:21:51');
INSERT INTO `work_user_coupons` VALUES (36, '64', 7, 18, 'U2019022311133076806', 'full', '2019-11-15 00:00:00', 1000.00, 100.00, 1, 1, '2019-02-23 11:13:30', '2019-02-23 11:13:30');
INSERT INTO `work_user_coupons` VALUES (37, '64', 8, 18, 'U2019022311195345740', 'full', '2019-11-23 00:00:00', 500.00, 50.00, 1, 1, '2019-02-23 11:19:53', '2019-02-23 11:19:53');
INSERT INTO `work_user_coupons` VALUES (38, '14', 7, 18, 'U2019022316563518571', 'full', '2019-11-15 00:00:00', 1000.00, 100.00, 1, 1, '2019-02-23 16:56:35', '2019-02-23 16:56:35');
INSERT INTO `work_user_coupons` VALUES (39, '14', 8, 18, 'U2019022316564320460', 'full', '2019-11-23 00:00:00', 500.00, 50.00, 1, 1, '2019-02-23 16:56:43', '2019-02-23 16:56:43');
INSERT INTO `work_user_coupons` VALUES (40, '14', 1, 18, 'U2019022316564332718', 'full', '2020-09-26 00:00:00', 2000.00, 200.00, 1, 1, '2019-02-23 16:56:43', '2019-02-23 16:56:43');
INSERT INTO `work_user_coupons` VALUES (41, '64', 12, 29, 'U2019022517581164259', 'full', '2019-03-01 00:00:00', 200.00, 50.00, 1, 1, '2019-02-25 17:58:11', '2019-02-25 17:58:11');
INSERT INTO `work_user_coupons` VALUES (42, '1', 12, 29, 'U2019022614042992381', 'full', '2019-03-01 00:00:00', 200.00, 50.00, 1, 1, '2019-02-26 14:04:29', '2019-02-26 14:04:29');
COMMIT;

-- ----------------------------
-- Table structure for work_user_drawcashs
-- ----------------------------
DROP TABLE IF EXISTS `work_user_drawcashs`;
CREATE TABLE `work_user_drawcashs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `order_no` varchar(255) NOT NULL COMMENT '提现订单号',
  `asset_type` varchar(255) NOT NULL COMMENT '提现资产类型',
  `type` varchar(255) NOT NULL COMMENT '提现类别',
  `money` decimal(10,2) NOT NULL COMMENT '提现金额',
  `bank_card_id` bigint(20) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL COMMENT '提现至银行的名称',
  `card_number` varchar(255) DEFAULT NULL COMMENT '提现至银行卡号',
  `card_holder` varchar(255) DEFAULT NULL COMMENT '持卡人姓名',
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '是否打款：0否1是',
  `status` tinyint(1) DEFAULT '1' COMMENT '充值状态：1待审核2拒绝提现3提现通过',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user_drawcashs
-- ----------------------------
BEGIN;
INSERT INTO `work_user_drawcashs` VALUES (1, 17, 'D2018111716071093025', 'money', 'withdrawToBankCard', 111.00, 2, '中国邮政储蓄银行', '128555575558508', 'ggy', 0, 2, 1, '2018-11-17 16:07:10', '2018-12-01 11:21:24');
INSERT INTO `work_user_drawcashs` VALUES (2, 4, 'D2018112815212776667', 'money', 'withdrawToBankCard', 100.00, 2, '中国建设银行', '8542', '我的', 0, 2, 1, '2018-11-28 15:21:27', '2018-12-01 11:21:21');
INSERT INTO `work_user_drawcashs` VALUES (3, 4, 'D2018112914531973541', 'money', 'withdrawToBankCard', 10000.00, 3, '光大银行', '46155766461', '988__#%&()67$@&!&_&64726482920194756373*4*$;', 0, 2, 1, '2018-11-29 14:53:19', '2018-12-01 11:21:18');
INSERT INTO `work_user_drawcashs` VALUES (4, 2, 'D2018120315120920430', 'money', 'withdrawToBankCard', 2.00, 6, '中国工商银行', '5555554886', '要发给', 1, 3, 1, '2018-12-03 15:12:09', '2018-12-06 20:14:11');
INSERT INTO `work_user_drawcashs` VALUES (5, 15, 'D2018120315162359554', 'money', 'withdrawToBankCard', 0.01, 7, '中国邮政储蓄银行', '123123123', '猪猪', 1, 3, 1, '2018-12-03 15:16:23', '2019-01-26 11:16:32');
INSERT INTO `work_user_drawcashs` VALUES (6, 15, 'D2018120315172157238', 'money', 'withdrawToBankCard', 0.01, 7, '中国邮政储蓄银行', '123123123', '猪猪', 0, 2, 1, '2018-12-03 15:17:21', '2018-12-03 15:25:56');
INSERT INTO `work_user_drawcashs` VALUES (7, 2, 'D2018120315275828727', 'money', 'withdrawToBankCard', 5.00, 6, '中国工商银行', '5555554886', '要发给', 0, 2, 1, '2018-12-03 15:27:58', '2018-12-03 15:28:11');
INSERT INTO `work_user_drawcashs` VALUES (8, 4, 'D2018120316053386012', 'money', 'withdrawToBankCard', 9900.00, 3, '光大银行', '46155766461', '988__#%&()67$@&!&_&64726482920194756373*4*$;', 1, 3, 1, '2018-12-03 16:05:33', '2018-12-06 20:13:49');
INSERT INTO `work_user_drawcashs` VALUES (9, 2, 'D2019022211453994370', 'money', 'withdrawToBankCard', 1000.00, 6, '中国工商银行', '5555554886', '要发给', 1, 3, 1, '2019-02-22 11:45:39', '2019-02-22 11:46:09');
INSERT INTO `work_user_drawcashs` VALUES (10, 2, 'D2019022211462648323', 'money', 'withdrawToBankCard', 1000.00, 6, '中国工商银行', '5555554886', '要发给', 0, 2, 1, '2019-02-22 11:46:26', '2019-02-22 11:46:38');
INSERT INTO `work_user_drawcashs` VALUES (11, 14, 'D2019022316375544978', 'money', 'withdrawToBankCard', 1000.00, 11, '中国建设银行', '6217002920128489896', '胡逸伦', 0, 1, 1, '2019-02-23 16:37:55', '2019-02-23 16:37:55');
COMMIT;

-- ----------------------------
-- Table structure for work_user_info
-- ----------------------------
DROP TABLE IF EXISTS `work_user_info`;
CREATE TABLE `work_user_info` (
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT '会员购物次数（确定完成才算）',
  `order_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员购物总金额（确定完成才算）',
  `shop_goods` text COMMENT '会员已购商品列表',
  `total_expect_commission_money` decimal(10,2) DEFAULT '0.00' COMMENT '总的预计的佣金（订单创建后核算的）',
  `total_real_commission_money` decimal(10,2) DEFAULT '0.00' COMMENT '总的实际的佣金（订单完成后计算的）',
  `already_drawcash_commission_money` decimal(10,2) DEFAULT '0.00' COMMENT '已经提现的佣金',
  `wait_pay_commission_money` decimal(10,2) DEFAULT '0.00' COMMENT '等待支付的佣金',
  `total_expect_bonus_money` decimal(10,2) DEFAULT '0.00' COMMENT '总的预计的分红（订单创建后核算的）',
  `total_real_bonus_money` decimal(10,2) DEFAULT '0.00' COMMENT '总的实际的分红（订单完成后计算的）',
  `already_drawcash_bonus_money` decimal(10,2) DEFAULT '0.00' COMMENT '已经提现的分红',
  `wait_pay_bonus_money` decimal(10,2) DEFAULT '0.00' COMMENT '等待支付的分红',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user_info
-- ----------------------------
BEGIN;
INSERT INTO `work_user_info` VALUES (1, 6, 1165.00, '[23,22,110,108,105]', 21.80, 0.00, 0.00, 0.00, 2.18, 0.00, 0.00, 0.00, 1, '2018-11-10 09:28:14', '2019-02-26 13:51:05');
INSERT INTO `work_user_info` VALUES (2, 6, 451.01, '[18,21,30]', 111.22, 69.09, 25.80, 43.29, 163497.56, 9726.93, 0.00, 9110.58, 1, '2018-11-10 13:43:52', '2019-02-26 13:51:05');
INSERT INTO `work_user_info` VALUES (3, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-10 15:04:28', '2018-11-10 15:04:28');
INSERT INTO `work_user_info` VALUES (4, 6, 1910.00, '[28,22,20,18]', 75.11, 34.14, 0.03, 34.11, 45.91, 10.21, 4.21, 6.00, 1, '2018-11-10 15:06:37', '2019-01-24 18:47:24');
INSERT INTO `work_user_info` VALUES (5, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-10 16:00:30', '2018-11-10 16:00:30');
INSERT INTO `work_user_info` VALUES (6, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-10 16:42:53', '2018-11-10 16:42:53');
INSERT INTO `work_user_info` VALUES (7, 2, 258.00, '[22]', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-10 17:38:14', '2018-11-10 18:40:49');
INSERT INTO `work_user_info` VALUES (8, 3, 842.17, '[23,28,18]', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-12 11:17:55', '2018-11-17 15:47:23');
INSERT INTO `work_user_info` VALUES (9, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-12 12:45:53', '2018-11-12 12:45:53');
INSERT INTO `work_user_info` VALUES (10, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-12 14:27:08', '2018-11-12 14:27:08');
INSERT INTO `work_user_info` VALUES (11, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-12 15:08:12', '2018-11-12 15:08:12');
INSERT INTO `work_user_info` VALUES (12, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-12 17:19:46', '2018-11-12 17:19:46');
INSERT INTO `work_user_info` VALUES (13, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-12 22:35:49', '2018-11-12 22:35:49');
INSERT INTO `work_user_info` VALUES (14, 0, 0.00, NULL, 6.95, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-14 10:19:52', '2019-02-25 17:16:30');
INSERT INTO `work_user_info` VALUES (15, 4, 1166.00, '[22,85,110,109]', 55.20, 36.95, 0.00, 0.00, 455.50, 238.45, 0.00, 0.00, 1, '2018-11-14 11:13:22', '2019-02-26 13:51:05');
INSERT INTO `work_user_info` VALUES (16, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-14 14:00:18', '2018-11-14 14:00:18');
INSERT INTO `work_user_info` VALUES (17, 4, 518.00, '[18,21,22,109]', 3.00, 3.00, 0.00, 0.00, 107838.82, 6076.91, 0.00, 0.01, 1, '2018-11-15 14:52:24', '2019-02-26 13:51:05');
INSERT INTO `work_user_info` VALUES (18, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-16 10:18:07', '2018-11-16 10:18:07');
INSERT INTO `work_user_info` VALUES (19, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-16 17:17:22', '2018-11-16 17:17:22');
INSERT INTO `work_user_info` VALUES (20, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-17 11:59:22', '2018-11-17 11:59:22');
INSERT INTO `work_user_info` VALUES (21, 1, 3960.00, '[102]', 1244.90, 199.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-17 13:59:12', '2019-02-23 16:53:51');
INSERT INTO `work_user_info` VALUES (22, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-17 14:17:32', '2018-11-17 14:17:32');
INSERT INTO `work_user_info` VALUES (23, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-17 14:19:54', '2018-11-17 14:19:54');
INSERT INTO `work_user_info` VALUES (24, 1, 1.00, '[28]', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-17 15:21:32', '2018-11-17 15:23:55');
INSERT INTO `work_user_info` VALUES (25, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-17 15:39:17', '2018-11-17 15:39:17');
INSERT INTO `work_user_info` VALUES (26, 1, 20.00, '[18]', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-17 15:49:36', '2018-11-17 16:20:08');
INSERT INTO `work_user_info` VALUES (27, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-17 16:32:15', '2018-11-17 16:32:15');
INSERT INTO `work_user_info` VALUES (28, 3, 811.00, '[18,22,23]', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-19 12:25:09', '2018-12-01 15:48:15');
INSERT INTO `work_user_info` VALUES (29, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-19 12:51:39', '2018-11-19 12:51:39');
INSERT INTO `work_user_info` VALUES (30, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-19 16:28:19', '2018-11-19 16:28:19');
INSERT INTO `work_user_info` VALUES (31, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-19 17:32:59', '2018-11-19 17:32:59');
INSERT INTO `work_user_info` VALUES (32, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-20 14:07:51', '2018-11-20 14:07:51');
INSERT INTO `work_user_info` VALUES (33, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-20 16:57:45', '2018-11-20 16:57:45');
INSERT INTO `work_user_info` VALUES (34, 1, 129.00, '[22]', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-21 09:09:56', '2018-11-21 09:12:09');
INSERT INTO `work_user_info` VALUES (35, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-22 10:18:03', '2018-11-22 10:18:03');
INSERT INTO `work_user_info` VALUES (36, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 1.20, 0.00, 0.00, 0.00, 1, '2018-11-24 14:10:01', '2018-11-27 10:23:48');
INSERT INTO `work_user_info` VALUES (37, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-26 09:32:37', '2018-11-26 09:32:37');
INSERT INTO `work_user_info` VALUES (38, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-26 16:18:07', '2018-11-26 16:18:07');
INSERT INTO `work_user_info` VALUES (39, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-26 19:23:04', '2018-11-26 19:23:04');
INSERT INTO `work_user_info` VALUES (40, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-27 10:22:03', '2018-11-27 10:22:03');
INSERT INTO `work_user_info` VALUES (41, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-27 10:22:47', '2018-11-27 10:22:47');
INSERT INTO `work_user_info` VALUES (42, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-27 14:30:19', '2018-11-27 14:30:19');
INSERT INTO `work_user_info` VALUES (43, 0, 0.00, NULL, 11.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-27 18:26:57', '2019-02-24 12:09:54');
INSERT INTO `work_user_info` VALUES (44, 7, 740.00, '[18]', 6.15, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-28 15:28:58', '2019-01-24 18:47:24');
INSERT INTO `work_user_info` VALUES (45, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-28 17:35:38', '2018-11-28 17:35:38');
INSERT INTO `work_user_info` VALUES (46, 2, 288.00, '[22,99]', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-29 16:38:18', '2019-02-23 13:20:39');
INSERT INTO `work_user_info` VALUES (47, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-11-30 11:28:49', '2018-11-30 11:28:49');
INSERT INTO `work_user_info` VALUES (48, 2, 249.00, '[40,109]', 117.50, 80.00, 0.00, 0.00, 44.82, 44.82, 0.00, 0.00, 1, '2018-12-01 15:03:02', '2019-02-13 14:14:18');
INSERT INTO `work_user_info` VALUES (49, 7, 57875.00, '[39,50,52,55,44,62,54,67,70,69,68,66,65,64,63,110,109,108,107,106,103,104,86,85,84,83,82,81,80,79]', 8484.45, 8484.45, 0.00, 0.00, 10181.34, 10181.34, 0.00, 0.00, 1, '2018-12-03 13:42:17', '2019-02-22 15:02:11');
INSERT INTO `work_user_info` VALUES (50, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-12-04 14:02:20', '2018-12-04 14:02:20');
INSERT INTO `work_user_info` VALUES (51, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-12-04 14:07:35', '2018-12-04 14:07:35');
INSERT INTO `work_user_info` VALUES (52, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-12-04 14:11:54', '2018-12-04 14:11:54');
INSERT INTO `work_user_info` VALUES (53, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-12-04 14:13:04', '2018-12-04 14:13:04');
INSERT INTO `work_user_info` VALUES (54, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-12-04 14:14:09', '2018-12-04 14:14:09');
INSERT INTO `work_user_info` VALUES (55, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-12-04 14:14:58', '2018-12-04 14:14:58');
INSERT INTO `work_user_info` VALUES (56, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-12-05 09:51:56', '2018-12-05 09:51:56');
INSERT INTO `work_user_info` VALUES (57, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-12-05 19:00:00', '2018-12-05 19:00:00');
INSERT INTO `work_user_info` VALUES (58, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-12-05 20:23:41', '2018-12-05 20:23:41');
INSERT INTO `work_user_info` VALUES (59, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2019-01-24 14:58:07', '2019-01-24 14:58:07');
INSERT INTO `work_user_info` VALUES (60, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2019-02-11 11:33:31', '2019-02-11 11:33:31');
INSERT INTO `work_user_info` VALUES (61, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2019-02-13 15:41:32', '2019-02-13 15:41:32');
INSERT INTO `work_user_info` VALUES (62, 1, 139.00, '[101]', 178.35, 6.95, 0.00, 0.00, 12.76, 1.39, 0.00, 0.00, 1, '2019-02-14 17:55:51', '2019-02-15 09:38:32');
INSERT INTO `work_user_info` VALUES (63, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 14.99, 0.00, 0.00, 0.00, 1, '2019-02-14 17:59:45', '2019-02-14 18:12:24');
INSERT INTO `work_user_info` VALUES (64, 1, 149.00, '[109]', 79.90, 0.00, 0.00, 0.00, 5.98, 0.00, 0.00, 0.00, 1, '2019-02-22 11:02:25', '2019-02-23 11:20:33');
INSERT INTO `work_user_info` VALUES (65, 1, 0.00, '[103]', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2019-02-22 13:12:12', '2019-02-26 11:43:16');
INSERT INTO `work_user_info` VALUES (66, 0, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2019-02-23 08:36:04', '2019-02-23 08:36:04');
COMMIT;

-- ----------------------------
-- Table structure for work_user_levels
-- ----------------------------
DROP TABLE IF EXISTS `work_user_levels`;
CREATE TABLE `work_user_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '级别名称',
  `min_score` decimal(10,2) NOT NULL COMMENT '当前等级的最小积分数',
  `intro` text COMMENT '级别简介',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user_levels
-- ----------------------------
BEGIN;
INSERT INTO `work_user_levels` VALUES (1, '普通会员', 0.00, '初始会员等级', 1, 1, '2018-07-27 19:40:15', '2018-07-27 19:40:15');
INSERT INTO `work_user_levels` VALUES (2, '一星会员', 100.00, NULL, 1, 1, '2018-07-27 19:40:32', '2018-07-27 19:40:32');
INSERT INTO `work_user_levels` VALUES (3, '二星会员', 200.00, NULL, 1, 1, '2018-07-27 19:40:43', '2018-07-27 19:40:43');
INSERT INTO `work_user_levels` VALUES (4, '三星会员', 300.00, NULL, 1, 1, '2018-07-27 19:40:53', '2018-07-27 19:40:53');
INSERT INTO `work_user_levels` VALUES (5, '四星会员', 400.00, NULL, 1, 1, '2018-07-27 19:41:05', '2018-07-27 19:41:05');
INSERT INTO `work_user_levels` VALUES (6, '五星会员', 500.00, NULL, 1, 1, '2018-07-27 19:41:15', '2018-07-27 19:41:15');
INSERT INTO `work_user_levels` VALUES (7, '3', 33.00, '33', 1, 0, '2018-08-24 10:45:59', '2018-08-24 10:46:07');
COMMIT;

-- ----------------------------
-- Table structure for work_user_recharges
-- ----------------------------
DROP TABLE IF EXISTS `work_user_recharges`;
CREATE TABLE `work_user_recharges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `order_no` varchar(255) NOT NULL COMMENT '充值订单号',
  `asset_type` varchar(255) NOT NULL COMMENT '充值资产类型',
  `type` varchar(255) NOT NULL COMMENT '充值类别',
  `money` decimal(10,2) NOT NULL COMMENT '充值金额',
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '是否支付：0未支付1已支付',
  `pay_type` varchar(255) DEFAULT NULL COMMENT '支付类别',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '充值状态：1待确认2未通过3已通过',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user_recharges
-- ----------------------------
BEGIN;
INSERT INTO `work_user_recharges` VALUES (1, 1, 'R2018111009284203329', 'money', '9', 12342355.00, 1, '9', '2018-11-10 09:28:42', 3, 1, '2018-11-10 09:28:42', '2018-11-10 09:28:42');
INSERT INTO `work_user_recharges` VALUES (2, 2, 'R2018111014445512269', 'money', '9', 5000.00, 1, '9', '2018-11-10 14:44:55', 3, 1, '2018-11-10 14:44:55', '2018-11-10 14:44:55');
INSERT INTO `work_user_recharges` VALUES (3, 3, 'R2018111015043803857', 'money', '9', 20000.00, 1, '9', '2018-11-10 15:04:38', 3, 1, '2018-11-10 15:04:38', '2018-11-10 15:04:38');
INSERT INTO `work_user_recharges` VALUES (4, 2, 'R2018111015194756753', 'money', '1', 0.01, 1, '2', '2018-11-10 15:19:55', 3, 1, '2018-11-10 15:19:47', '2018-11-10 15:19:55');
INSERT INTO `work_user_recharges` VALUES (5, 2, 'R2018111015232646522', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 15:23:26', '2018-11-10 15:23:26');
INSERT INTO `work_user_recharges` VALUES (6, 2, 'R2018111015330527246', 'money', '1', 0.01, 1, '2', '2018-11-10 15:33:13', 3, 1, '2018-11-10 15:33:05', '2018-11-10 15:33:13');
INSERT INTO `work_user_recharges` VALUES (7, 1, 'R2018111015401627125', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 15:40:16', '2018-11-10 15:40:16');
INSERT INTO `work_user_recharges` VALUES (8, 2, 'R2018111015402465417', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 15:40:24', '2018-11-10 15:40:24');
INSERT INTO `work_user_recharges` VALUES (9, 1, 'R2018111015490900137', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 15:49:09', '2018-11-10 15:49:09');
INSERT INTO `work_user_recharges` VALUES (10, 1, 'R2018111015493846558', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 15:49:38', '2018-11-10 15:49:38');
INSERT INTO `work_user_recharges` VALUES (11, 1, 'R2018111015494319813', 'money', '1', 0.01, 1, '1', '2018-11-10 15:49:49', 3, 1, '2018-11-10 15:49:43', '2018-11-10 15:49:49');
INSERT INTO `work_user_recharges` VALUES (12, 2, 'R2018111015501538396', 'money', '1', 0.01, 1, '1', '2018-11-10 15:50:23', 3, 1, '2018-11-10 15:50:15', '2018-11-10 15:50:23');
INSERT INTO `work_user_recharges` VALUES (13, 1, 'R2018111015585378997', 'money', '1', 1.00, 0, NULL, NULL, 1, 1, '2018-11-10 15:58:53', '2018-11-10 15:58:53');
INSERT INTO `work_user_recharges` VALUES (14, 2, 'R2018111015585794539', 'money', '1', 0.01, 1, '2', '2018-11-10 15:59:07', 3, 1, '2018-11-10 15:58:57', '2018-11-10 15:59:07');
INSERT INTO `work_user_recharges` VALUES (15, 1, 'R2018111016012673998', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:01:26', '2018-11-10 16:01:26');
INSERT INTO `work_user_recharges` VALUES (16, 1, 'R2018111016241079779', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:24:10', '2018-11-10 16:24:10');
INSERT INTO `work_user_recharges` VALUES (17, 1, 'R2018111016242896135', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:24:28', '2018-11-10 16:24:28');
INSERT INTO `work_user_recharges` VALUES (18, 1, 'R2018111016251238702', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:25:12', '2018-11-10 16:25:12');
INSERT INTO `work_user_recharges` VALUES (19, 1, 'R2018111016340192372', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:34:01', '2018-11-10 16:34:01');
INSERT INTO `work_user_recharges` VALUES (20, 1, 'R2018111016345967343', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:34:59', '2018-11-10 16:34:59');
INSERT INTO `work_user_recharges` VALUES (21, 1, 'R2018111016365976013', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:36:59', '2018-11-10 16:36:59');
INSERT INTO `work_user_recharges` VALUES (22, 4, 'R2018111016395085008', 'money', '9', 1000000.00, 1, '9', '2018-11-10 16:39:50', 3, 1, '2018-11-10 16:39:50', '2018-11-10 16:39:50');
INSERT INTO `work_user_recharges` VALUES (23, 1, 'R2018111016424211069', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:42:42', '2018-11-10 16:42:42');
INSERT INTO `work_user_recharges` VALUES (24, 1, 'R2018111016441870481', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:44:18', '2018-11-10 16:44:18');
INSERT INTO `work_user_recharges` VALUES (25, 1, 'R2018111016472580858', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:47:25', '2018-11-10 16:47:25');
INSERT INTO `work_user_recharges` VALUES (26, 1, 'R2018111016484302429', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:48:43', '2018-11-10 16:48:43');
INSERT INTO `work_user_recharges` VALUES (27, 1, 'R2018111016572536089', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:57:25', '2018-11-10 16:57:25');
INSERT INTO `work_user_recharges` VALUES (28, 1, 'R2018111016573087533', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:57:30', '2018-11-10 16:57:30');
INSERT INTO `work_user_recharges` VALUES (29, 1, 'R2018111016573107797', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:57:31', '2018-11-10 16:57:31');
INSERT INTO `work_user_recharges` VALUES (30, 1, 'R2018111016573302561', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 16:57:33', '2018-11-10 16:57:33');
INSERT INTO `work_user_recharges` VALUES (31, 1, 'R2018111017002581263', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:00:25', '2018-11-10 17:00:25');
INSERT INTO `work_user_recharges` VALUES (32, 1, 'R2018111017041947235', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:04:19', '2018-11-10 17:04:19');
INSERT INTO `work_user_recharges` VALUES (33, 1, 'R2018111017064662927', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:06:46', '2018-11-10 17:06:46');
INSERT INTO `work_user_recharges` VALUES (34, 1, 'R2018111017331544134', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:33:15', '2018-11-10 17:33:15');
INSERT INTO `work_user_recharges` VALUES (35, 1, 'R2018111017332426902', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:33:24', '2018-11-10 17:33:24');
INSERT INTO `work_user_recharges` VALUES (36, 1, 'R2018111017405696898', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:40:56', '2018-11-10 17:40:56');
INSERT INTO `work_user_recharges` VALUES (37, 1, 'R2018111017412066655', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:41:20', '2018-11-10 17:41:20');
INSERT INTO `work_user_recharges` VALUES (38, 1, 'R2018111017415026881', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:41:50', '2018-11-10 17:41:50');
INSERT INTO `work_user_recharges` VALUES (39, 1, 'R2018111017474887328', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:47:48', '2018-11-10 17:47:48');
INSERT INTO `work_user_recharges` VALUES (40, 1, 'R2018111017480442107', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:48:04', '2018-11-10 17:48:04');
INSERT INTO `work_user_recharges` VALUES (41, 1, 'R2018111017480966749', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:48:09', '2018-11-10 17:48:09');
INSERT INTO `work_user_recharges` VALUES (42, 1, 'R2018111017494252423', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:49:42', '2018-11-10 17:49:42');
INSERT INTO `work_user_recharges` VALUES (43, 1, 'R2018111017513998687', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:51:39', '2018-11-10 17:51:39');
INSERT INTO `work_user_recharges` VALUES (44, 1, 'R2018111017595367246', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 17:59:53', '2018-11-10 17:59:53');
INSERT INTO `work_user_recharges` VALUES (45, 1, 'R2018111018030321686', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 18:03:03', '2018-11-10 18:03:03');
INSERT INTO `work_user_recharges` VALUES (46, 1, 'R2018111018121339027', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-10 18:12:13', '2018-11-10 18:12:13');
INSERT INTO `work_user_recharges` VALUES (47, 7, 'R2018111018385966199', 'money', '9', 1000000.00, 1, '9', '2018-11-10 18:38:59', 3, 1, '2018-11-10 18:38:59', '2018-11-10 18:38:59');
INSERT INTO `work_user_recharges` VALUES (48, 1, 'R2018111111351406496', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-11 11:35:14', '2018-11-11 11:35:14');
INSERT INTO `work_user_recharges` VALUES (49, 8, 'R2018111211190158277', 'money', '9', 100000.00, 1, '9', '2018-11-12 11:19:01', 3, 1, '2018-11-12 11:19:01', '2018-11-12 11:19:01');
INSERT INTO `work_user_recharges` VALUES (50, 9, 'R2018111213422441133', 'money', '9', 2000.00, 1, '9', '2018-11-12 13:42:24', 3, 1, '2018-11-12 13:42:24', '2018-11-12 13:42:24');
INSERT INTO `work_user_recharges` VALUES (51, 13, 'R2018111222360358464', 'money', '1', 100.00, 0, NULL, NULL, 1, 1, '2018-11-12 22:36:03', '2018-11-12 22:36:03');
INSERT INTO `work_user_recharges` VALUES (52, 13, 'R2018111310335465596', 'money', '1', 100.00, 0, NULL, NULL, 1, 1, '2018-11-13 10:33:54', '2018-11-13 10:33:54');
INSERT INTO `work_user_recharges` VALUES (53, 9, 'R2018111314244149216', 'money', '9', 2000000.00, 1, '9', '2018-11-13 14:24:41', 3, 1, '2018-11-13 14:24:41', '2018-11-13 14:24:41');
INSERT INTO `work_user_recharges` VALUES (54, 2, 'R2018111314250212722', 'money', '9', 25000000.00, 1, '9', '2018-11-13 14:25:02', 3, 1, '2018-11-13 14:25:02', '2018-11-13 14:25:02');
INSERT INTO `work_user_recharges` VALUES (55, 10, 'R2018111711532117455', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-17 11:53:21', '2018-11-17 11:53:21');
INSERT INTO `work_user_recharges` VALUES (56, 10, 'R2018111711535471572', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-17 11:53:54', '2018-11-17 11:53:54');
INSERT INTO `work_user_recharges` VALUES (57, 1, 'R2018111711551158294', 'money', '1', 1.00, 0, NULL, NULL, 1, 1, '2018-11-17 11:55:11', '2018-11-17 11:55:11');
INSERT INTO `work_user_recharges` VALUES (58, 10, 'R2018111711552166750', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-17 11:55:21', '2018-11-17 11:55:21');
INSERT INTO `work_user_recharges` VALUES (59, 10, 'R2018111711574134714', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-17 11:57:41', '2018-11-17 11:57:41');
INSERT INTO `work_user_recharges` VALUES (60, 20, 'R2018111712001813296', 'money', '9', 10000.00, 1, '9', '2018-11-17 12:00:18', 3, 1, '2018-11-17 12:00:18', '2018-11-17 12:00:18');
INSERT INTO `work_user_recharges` VALUES (61, 24, 'R2018111715214636091', 'money', '9', 1.00, 1, '9', '2018-11-17 15:21:46', 3, 1, '2018-11-17 15:21:46', '2018-11-17 15:21:46');
INSERT INTO `work_user_recharges` VALUES (62, 17, 'R2018111715352102271', 'money', '9', 100000.00, 1, '9', '2018-11-17 15:35:21', 3, 1, '2018-11-17 15:35:21', '2018-11-17 15:35:21');
INSERT INTO `work_user_recharges` VALUES (63, 26, 'R2018111716182361739', 'money', '9', 20.00, 1, '9', '2018-11-17 16:18:23', 3, 1, '2018-11-17 16:18:23', '2018-11-17 16:18:23');
INSERT INTO `work_user_recharges` VALUES (64, 13, 'R2018111911561225603', 'money', '9', 10000000.00, 1, '9', '2018-11-19 11:56:12', 3, 1, '2018-11-19 11:56:12', '2018-11-19 11:56:12');
INSERT INTO `work_user_recharges` VALUES (65, 2, 'R2018112010085216274', 'money', '1', 0.01, 1, '2', '2018-11-20 10:09:00', 3, 1, '2018-11-20 10:08:52', '2018-11-20 10:09:00');
INSERT INTO `work_user_recharges` VALUES (66, 2, 'R2018112010141555193', 'money', '1', 0.01, 1, '2', '2018-11-20 10:14:22', 3, 1, '2018-11-20 10:14:15', '2018-11-20 10:14:22');
INSERT INTO `work_user_recharges` VALUES (67, 28, 'R2018112012373931293', 'money', '9', 10000.00, 1, '9', '2018-11-20 12:37:39', 3, 1, '2018-11-20 12:37:39', '2018-11-20 12:37:39');
INSERT INTO `work_user_recharges` VALUES (68, 2, 'R2018112017165810508', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-11-20 17:16:58', '2018-11-20 17:16:58');
INSERT INTO `work_user_recharges` VALUES (69, 34, 'R2018112109112979581', 'money', '9', 500.00, 1, '9', '2018-11-21 09:11:29', 3, 1, '2018-11-21 09:11:29', '2018-11-21 09:11:29');
INSERT INTO `work_user_recharges` VALUES (70, 2, 'R2018112110024998643', 'money', '1', 20.00, 0, NULL, NULL, 1, 1, '2018-11-21 10:02:49', '2018-11-21 10:02:49');
INSERT INTO `work_user_recharges` VALUES (71, 2, 'R2018112110520855888', 'money', '1', 5.00, 0, NULL, NULL, 1, 1, '2018-11-21 10:52:08', '2018-11-21 10:52:08');
INSERT INTO `work_user_recharges` VALUES (72, 2, 'R2018112110521896049', 'money', '1', 5.00, 0, NULL, NULL, 1, 1, '2018-11-21 10:52:18', '2018-11-21 10:52:18');
INSERT INTO `work_user_recharges` VALUES (73, 35, 'R2018112210585999083', 'money', '9', 100.00, 1, '9', '2018-11-22 10:58:59', 3, 1, '2018-11-22 10:58:59', '2018-11-22 10:58:59');
INSERT INTO `work_user_recharges` VALUES (74, 15, 'R2018112213433460177', 'money', '9', 30000.00, 1, '9', '2018-11-22 13:43:34', 3, 1, '2018-11-22 13:43:34', '2018-11-22 13:43:34');
INSERT INTO `work_user_recharges` VALUES (75, 31, 'R2018112315110640851', 'money', '9', 10000.00, 1, '9', '2018-11-23 15:11:06', 3, 1, '2018-11-23 15:11:06', '2018-11-23 15:11:06');
INSERT INTO `work_user_recharges` VALUES (76, 2, 'R2018112420183750301', 'money', '1', 0.10, 0, NULL, NULL, 1, 1, '2018-11-24 20:18:37', '2018-11-24 20:18:37');
INSERT INTO `work_user_recharges` VALUES (77, 2, 'R2018112420184745373', 'money', '1', 0.10, 0, NULL, NULL, 1, 1, '2018-11-24 20:18:47', '2018-11-24 20:18:47');
INSERT INTO `work_user_recharges` VALUES (78, 2, 'R2018112420184858107', 'money', '1', 0.10, 0, NULL, NULL, 1, 1, '2018-11-24 20:18:48', '2018-11-24 20:18:48');
INSERT INTO `work_user_recharges` VALUES (79, 2, 'R2018112420185048854', 'money', '1', 0.10, 0, NULL, NULL, 1, 1, '2018-11-24 20:18:50', '2018-11-24 20:18:50');
INSERT INTO `work_user_recharges` VALUES (80, 2, 'R2018112420185109892', 'money', '1', 0.10, 0, NULL, NULL, 1, 1, '2018-11-24 20:18:51', '2018-11-24 20:18:51');
INSERT INTO `work_user_recharges` VALUES (81, 2, 'R2018112420185251022', 'money', '1', 0.10, 0, NULL, NULL, 1, 1, '2018-11-24 20:18:52', '2018-11-24 20:18:52');
INSERT INTO `work_user_recharges` VALUES (82, 2, 'R2018112420185327837', 'money', '1', 0.10, 0, NULL, NULL, 1, 1, '2018-11-24 20:18:53', '2018-11-24 20:18:53');
INSERT INTO `work_user_recharges` VALUES (83, 2, 'R2018112420190134246', 'money', '1', 0.10, 0, NULL, NULL, 1, 1, '2018-11-24 20:19:01', '2018-11-24 20:19:01');
INSERT INTO `work_user_recharges` VALUES (84, 2, 'R2018112420192083132', 'money', '1', 0.01, 1, '2', '2018-11-24 20:19:29', 3, 1, '2018-11-24 20:19:20', '2018-11-24 20:19:29');
INSERT INTO `work_user_recharges` VALUES (85, 37, 'R2018112609325354559', 'money', '9', 2000.00, 1, '9', '2018-11-26 09:32:53', 3, 1, '2018-11-26 09:32:53', '2018-11-26 09:32:53');
INSERT INTO `work_user_recharges` VALUES (86, 43, 'R2018112809473714452', 'money', '9', 8.00, 1, '9', '2018-11-28 09:47:37', 3, 1, '2018-11-28 09:47:37', '2018-11-28 09:47:37');
INSERT INTO `work_user_recharges` VALUES (87, 4, 'R2018112814493227686', 'money', '1', 0.01, 1, '2', '2018-11-28 14:49:39', 3, 1, '2018-11-28 14:49:32', '2018-11-28 14:49:39');
INSERT INTO `work_user_recharges` VALUES (88, 4, 'R2018112814495103596', 'money', '1', 0.01, 1, '1', '2018-11-28 14:49:56', 3, 1, '2018-11-28 14:49:51', '2018-11-28 14:49:56');
INSERT INTO `work_user_recharges` VALUES (89, 44, 'R2018112815292658446', 'money', '9', 10000.00, 1, '9', '2018-11-28 15:29:26', 3, 1, '2018-11-28 15:29:26', '2018-11-28 15:29:26');
INSERT INTO `work_user_recharges` VALUES (90, 46, 'R2018112916384416359', 'money', '9', 500000.00, 1, '9', '2018-11-29 16:38:44', 3, 1, '2018-11-29 16:38:44', '2018-11-29 16:38:44');
INSERT INTO `work_user_recharges` VALUES (91, 46, 'R2018120111203487306', 'money', '9', 100000.00, 1, '9', '2018-12-01 11:20:34', 3, 1, '2018-12-01 11:20:34', '2018-12-01 11:20:34');
INSERT INTO `work_user_recharges` VALUES (92, 19, 'R2018120111481183824', 'money', '9', 10000000.00, 1, '9', '2018-12-01 11:48:11', 3, 1, '2018-12-01 11:48:11', '2018-12-01 11:48:11');
INSERT INTO `work_user_recharges` VALUES (93, 43, 'R2018120111493481404', 'money', '9', 888888.00, 1, '9', '2018-12-01 11:49:34', 3, 1, '2018-12-01 11:49:34', '2018-12-01 11:49:34');
INSERT INTO `work_user_recharges` VALUES (94, 48, 'R2018120115220885631', 'money', '9', 100000.00, 1, '9', '2018-12-01 15:22:08', 3, 1, '2018-12-01 15:22:08', '2018-12-01 15:22:08');
INSERT INTO `work_user_recharges` VALUES (95, 47, 'R2018120115221345738', 'money', '9', 10000.00, 1, '9', '2018-12-01 15:22:13', 3, 1, '2018-12-01 15:22:13', '2018-12-01 15:22:13');
INSERT INTO `work_user_recharges` VALUES (96, 47, 'R2018120115221908529', 'money', '9', 100000.00, 1, '9', '2018-12-01 15:22:19', 3, 1, '2018-12-01 15:22:19', '2018-12-01 15:22:19');
INSERT INTO `work_user_recharges` VALUES (97, 45, 'R2018120115222484150', 'money', '9', 100000.00, 1, '9', '2018-12-01 15:22:24', 3, 1, '2018-12-01 15:22:24', '2018-12-01 15:22:24');
INSERT INTO `work_user_recharges` VALUES (98, 44, 'R2018120115222968653', 'money', '9', 100000.00, 1, '9', '2018-12-01 15:22:29', 3, 1, '2018-12-01 15:22:29', '2018-12-01 15:22:29');
INSERT INTO `work_user_recharges` VALUES (99, 42, 'R2018120115223425123', 'money', '9', 100000.00, 1, '9', '2018-12-01 15:22:34', 3, 1, '2018-12-01 15:22:34', '2018-12-01 15:22:34');
INSERT INTO `work_user_recharges` VALUES (100, 41, 'R2018120115224106806', 'money', '9', 100000.00, 1, '9', '2018-12-01 15:22:41', 3, 1, '2018-12-01 15:22:41', '2018-12-01 15:22:41');
INSERT INTO `work_user_recharges` VALUES (101, 40, 'R2018120115224867632', 'money', '9', 1000000.00, 1, '9', '2018-12-01 15:22:48', 3, 1, '2018-12-01 15:22:48', '2018-12-01 15:22:48');
INSERT INTO `work_user_recharges` VALUES (102, 48, 'R2018120116330223178', 'money', '9', 1000.00, 1, '9', '2018-12-01 16:33:02', 3, 1, '2018-12-01 16:33:02', '2018-12-01 16:33:02');
INSERT INTO `work_user_recharges` VALUES (103, 48, 'R2018120116350701934', 'money', '9', 99999999.00, 1, '9', '2018-12-01 16:35:07', 3, 1, '2018-12-01 16:35:07', '2018-12-01 16:35:07');
INSERT INTO `work_user_recharges` VALUES (104, 48, 'R2018120116373140680', 'money', '9', 999999.00, 1, '9', '2018-12-01 16:37:31', 3, 1, '2018-12-01 16:37:31', '2018-12-01 16:37:31');
INSERT INTO `work_user_recharges` VALUES (105, 49, 'R2018120314595041239', 'money', '1', 1.00, 0, NULL, NULL, 1, 1, '2018-12-03 14:59:50', '2018-12-03 14:59:50');
INSERT INTO `work_user_recharges` VALUES (106, 2, 'R2018120317131527244', 'money', '1', 0.10, 0, NULL, NULL, 1, 1, '2018-12-03 17:13:15', '2018-12-03 17:13:15');
INSERT INTO `work_user_recharges` VALUES (107, 2, 'R2018120317170481716', 'money', '1', 0.01, 1, '2', '2018-12-03 17:17:15', 3, 1, '2018-12-03 17:17:04', '2018-12-03 17:17:15');
INSERT INTO `work_user_recharges` VALUES (108, 2, 'R2018120317175921416', 'money', '1', 0.01, 0, NULL, NULL, 1, 1, '2018-12-03 17:17:59', '2018-12-03 17:17:59');
INSERT INTO `work_user_recharges` VALUES (109, 49, 'R2018120514101071957', 'money', '9', 199999.00, 1, '9', '2018-12-05 14:10:10', 3, 1, '2018-12-05 14:10:10', '2018-12-05 14:10:10');
INSERT INTO `work_user_recharges` VALUES (110, 63, 'R2019021418001556537', 'money', '9', 50000.00, 1, '9', '2019-02-14 18:00:15', 3, 1, '2019-02-14 18:00:15', '2019-02-14 18:00:15');
INSERT INTO `work_user_recharges` VALUES (111, 62, 'R2019021509340386717', 'money', '9', 50000.00, 1, '9', '2019-02-15 09:34:03', 3, 1, '2019-02-15 09:34:03', '2019-02-15 09:34:03');
INSERT INTO `work_user_recharges` VALUES (112, 64, 'R2019022211254418480', 'money', '9', 999.00, 1, '9', '2019-02-22 11:25:44', 3, 1, '2019-02-22 11:25:44', '2019-02-22 11:25:44');
INSERT INTO `work_user_recharges` VALUES (113, 66, 'R2019022316134815290', 'money', '9', 5200.00, 1, '9', '2019-02-23 16:13:48', 3, 1, '2019-02-23 16:13:48', '2019-02-23 16:13:48');
INSERT INTO `work_user_recharges` VALUES (114, 14, 'R2019022316350923262', 'money', '9', 12335464.00, 1, '9', '2019-02-23 16:35:09', 3, 1, '2019-02-23 16:35:09', '2019-02-23 16:35:09');
INSERT INTO `work_user_recharges` VALUES (115, 21, 'R2019022316513199418', 'money', '9', 100000.00, 1, '9', '2019-02-23 16:51:31', 3, 1, '2019-02-23 16:51:31', '2019-02-23 16:51:31');
INSERT INTO `work_user_recharges` VALUES (116, 65, 'R2019022610471430088', 'money', '9', 10000.00, 1, '9', '2019-02-26 10:47:14', 3, 1, '2019-02-26 10:47:14', '2019-02-26 10:47:14');
COMMIT;

-- ----------------------------
-- Table structure for work_user_third_accounts
-- ----------------------------
DROP TABLE IF EXISTS `work_user_third_accounts`;
CREATE TABLE `work_user_third_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `user_type` varchar(255) DEFAULT NULL COMMENT '用户类型',
  `client_type` varchar(255) DEFAULT NULL COMMENT '客户端类别',
  `type` varchar(255) NOT NULL COMMENT '账户类型：ali ||  wechat',
  `name` varchar(255) NOT NULL COMMENT '账号名称',
  `account` varchar(255) NOT NULL COMMENT '账号',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user_third_accounts
-- ----------------------------
BEGIN;
INSERT INTO `work_user_third_accounts` VALUES (1, 1, 'user', 'wechat', 'wechat', 'openid', 'oNGLot9r0rsf4gvYC4K0o8RHkhFY', 1, '2018-11-10 15:58:44', '2018-11-10 15:58:44');
INSERT INTO `work_user_third_accounts` VALUES (2, 11, 'user', 'applet', 'wechat', 'openid', 'oPYxV4_J5UyPR16xJjmz5oZNdC3I', 1, '2018-11-12 15:08:12', '2018-11-12 15:08:12');
INSERT INTO `work_user_third_accounts` VALUES (3, 12, 'user', 'applet', 'wechat', 'openid', 'oPYxV45AWw1REmlLz78lZM9Cw4ic', 1, '2018-11-12 17:19:46', '2018-11-12 17:19:46');
INSERT INTO `work_user_third_accounts` VALUES (4, 18, 'user', 'applet', 'wechat', 'openid', 'oPYxV49tE_s8GDcfM1XVldDqyDqo', 1, '2018-11-16 10:18:07', '2018-11-16 10:18:07');
INSERT INTO `work_user_third_accounts` VALUES (5, 22, 'user', 'applet', 'wechat', 'openid', 'oPYxV48j3GePYWyXzdh2jlX7juT8', 1, '2018-11-17 14:17:32', '2018-11-17 14:17:32');
INSERT INTO `work_user_third_accounts` VALUES (6, 23, 'user', 'applet', 'wechat', 'openid', 'oPYxV48j3GePYWyXzdh2jlX7juT8', 1, '2018-11-17 14:19:54', '2018-11-17 14:19:54');
INSERT INTO `work_user_third_accounts` VALUES (7, 17, NULL, 'applet', 'wechat', 'openid', 'oPYxV48j3GePYWyXzdh2jlX7juT8', 1, '2018-11-17 15:25:38', '2018-11-17 15:25:38');
INSERT INTO `work_user_third_accounts` VALUES (8, 25, 'user', 'applet', 'wechat', 'openid', 'oPYxV48j3GePYWyXzdh2jlX7juT8', 1, '2018-11-17 15:39:17', '2018-11-17 15:39:17');
INSERT INTO `work_user_third_accounts` VALUES (9, 17, 'user', 'applet', 'wechat', 'openid', 'oPYxV48j3GePYWyXzdh2jlX7juT8', 1, '2018-11-17 16:05:39', '2018-11-17 16:05:39');
INSERT INTO `work_user_third_accounts` VALUES (10, 29, 'user', 'applet', 'wechat', 'openid', 'oPYxV4z4h5ApNo65cOnTC5CMrZcI', 1, '2018-11-19 12:51:39', '2018-11-19 12:51:39');
INSERT INTO `work_user_third_accounts` VALUES (11, 30, 'user', 'applet', 'wechat', 'openid', 'oPYxV4_QHQEHIomMc1e8sY8vnXNY', 1, '2018-11-19 16:28:19', '2018-11-19 16:28:19');
INSERT INTO `work_user_third_accounts` VALUES (12, 15, 'user', 'wechat', 'wechat', 'openid', 'oNGLotzmnxK1aIfJio_NWCsPA9zg', 1, '2018-11-21 13:56:52', '2018-11-21 13:56:52');
INSERT INTO `work_user_third_accounts` VALUES (13, 4, 'user', 'applet', 'wechat', 'openid', 'oPYxV48j3GePYWyXzdh2jlX7juT8', 1, '2018-11-22 16:40:37', '2018-11-22 16:40:37');
INSERT INTO `work_user_third_accounts` VALUES (14, 2, NULL, 'wechat', 'wechat', 'openid', 'oNGLot4_XoC66hMHUu_r38CXdojE', 1, '2018-11-23 14:24:06', '2018-11-23 14:24:06');
INSERT INTO `work_user_third_accounts` VALUES (15, 39, NULL, 'applet', 'wechat', 'openid', 'oPYxV4-DGw2eZpzoCYdtsmcycLOk', 1, '2018-11-26 19:23:36', '2018-11-26 19:23:36');
INSERT INTO `work_user_third_accounts` VALUES (16, 4, NULL, 'wap', 'ali', '黄跃龙', '13874930708', 1, '2018-11-28 17:36:31', '2018-11-28 17:36:31');
INSERT INTO `work_user_third_accounts` VALUES (17, 26, 'user', 'applet', 'wechat', 'openid', 'oPYxV42rbZf8AndCdbLPaMeD1tt4', 1, '2018-11-30 12:03:51', '2018-11-30 12:03:51');
INSERT INTO `work_user_third_accounts` VALUES (18, 49, NULL, 'app', 'wechat', 'openid', 'oOVUO1e61IJ65LbRiWDtG9SMayR8', 1, '2018-12-03 14:43:02', '2018-12-03 14:43:02');
INSERT INTO `work_user_third_accounts` VALUES (19, 4, NULL, 'app', 'wechat', 'openid', 'oOVUO1ZEKsXToCN3swxlzdw4zjtk', 1, '2018-12-03 15:53:05', '2018-12-03 15:53:05');
INSERT INTO `work_user_third_accounts` VALUES (20, 15, 'user', 'applet', 'wechat', 'openid', 'oPYxV44qsMs76ykyUxcGxJgPDfZI', 1, '2019-01-22 14:10:11', '2019-01-24 15:21:59');
INSERT INTO `work_user_third_accounts` VALUES (21, 48, 'user', 'applet', 'wechat', 'openid', 'oPYxV44-zY5Z7e282Y6zb82HUk-g', 1, '2019-01-24 09:37:52', '2019-01-24 09:37:52');
INSERT INTO `work_user_third_accounts` VALUES (22, 2, NULL, 'app', 'ali', '郭仕伟', '15071357557', 1, '2019-02-23 13:22:17', '2019-02-23 13:22:17');
COMMIT;

-- ----------------------------
-- Table structure for work_user_tokens
-- ----------------------------
DROP TABLE IF EXISTS `work_user_tokens`;
CREATE TABLE `work_user_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_account_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户账号ID',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `client_type` varchar(50) NOT NULL COMMENT '客户端类型：pc|wap|app|wechat|applet',
  `token` varchar(255) NOT NULL COMMENT '授权token',
  `refresh_token` varchar(255) DEFAULT NULL COMMENT '刷新token',
  `expire_time` int(11) DEFAULT NULL COMMENT 'token有效时长，为空表示永久有效',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=593 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user_tokens
-- ----------------------------
BEGIN;
INSERT INTO `work_user_tokens` VALUES (1, 1, 1, 'wap', 'user&wap@9a19ae1625fcabe2545c880316081f20', 'user&wap@4f885cf7a725f13f42d3fb6c5a955c49', 7200, 1, '2018-11-09 09:28:14', '2018-11-10 09:28:14');
INSERT INTO `work_user_tokens` VALUES (2, 1, 1, 'wechat', 'user&wechat@cffcdf8f61add554a249887fded8da37', 'user&wechat@ce96660fe8b5e211aa98f4695d1eed59', 7200, 1, '2018-11-10 09:58:03', '2018-11-10 15:58:32');
INSERT INTO `work_user_tokens` VALUES (3, 1, 1, 'applet', 'user&applet@7667b82384edcba19f6739a32aeb8c1f', 'user&applet@4a90b712d066ea13dcb35aacb50fe0e8', 0, 1, '2018-11-10 09:59:11', '2018-11-10 09:59:11');
INSERT INTO `work_user_tokens` VALUES (4, 1, 1, 'app', 'user&app@90c2f510584a06302ce5a75d2aab9faf', 'user&app@ec8cc6538a9a6a958878748eb7c234e9', 0, 1, '2018-11-10 10:07:20', '2018-11-10 10:07:20');
INSERT INTO `work_user_tokens` VALUES (5, 1, 1, 'applet', 'user&applet@ab839b42a7351377131a84e8b437cff2', 'user&applet@c91a8abe58b92248e362afe2557e2c36', 0, 1, '2018-11-10 10:08:19', '2018-11-10 10:08:19');
INSERT INTO `work_user_tokens` VALUES (6, 2, 2, 'app', 'user&app@d534125717637c389c321d19b42e751a', 'user&app@7fe5de4ee0b081e7555722e9330b5e02', 0, 1, '2018-11-10 13:43:52', '2018-11-10 13:43:52');
INSERT INTO `work_user_tokens` VALUES (7, 2, 2, 'app', 'user&app@9e0634e9546ed890519d78a1cf97ef5e', 'user&app@bb947b607c32219cfdb282ac6a3ffb49', 0, 1, '2018-11-10 13:45:54', '2018-11-10 13:45:54');
INSERT INTO `work_user_tokens` VALUES (8, 2, 2, 'app', 'user&app@c77956cd2252f645ad20dc830d99a6bc', 'user&app@34d686d1c69cecef97589f7a98d5dde1', 0, 1, '2018-11-10 14:40:53', '2018-11-10 14:40:53');
INSERT INTO `work_user_tokens` VALUES (9, 2, 2, 'wechat', 'user&wechat@a1b3eb147504215a9feb7d3336cbbbda', 'user&wechat@c7b8e10cd8c8992ca19e6ac18f9d5b7f', 7200, 1, '2018-11-10 14:56:16', '2018-11-10 14:56:16');
INSERT INTO `work_user_tokens` VALUES (10, 2, 2, 'app', 'user&app@b97cf12e6bda93bbab008519dbac88c4', 'user&app@f25b2df8203de80761c1ce2a104b0eb5', 0, 1, '2018-11-10 14:58:02', '2018-11-10 14:58:02');
INSERT INTO `work_user_tokens` VALUES (11, 2, 2, 'applet', 'user&applet@775ce1fbbb5d4182b2151e0aa032f978', 'user&applet@123af483ad7be044e31dfd6fa1104ba8', 0, 1, '2018-11-10 15:00:29', '2018-11-10 15:00:29');
INSERT INTO `work_user_tokens` VALUES (12, 3, 3, 'app', 'user&app@ba155bbe4effcb133e8b7d64cf7137ba', 'user&app@98045413f80d02ebd338cc80dae7a383', 0, 1, '2018-11-10 15:04:28', '2018-11-10 15:04:28');
INSERT INTO `work_user_tokens` VALUES (53, 4, 4, 'wap', 'user&wap@c71c142315f26857bf5374a3c8d967f3', 'user&wap@69b6f4d69e9307e1ca15628e0824e672', 7200, 1, '2018-11-12 17:26:01', '2018-11-12 17:26:01');
INSERT INTO `work_user_tokens` VALUES (63, 2, 2, 'wechat', 'user&wechat@2af6d2df76d80f1214facb4dd3f2f663', 'user&wechat@a85f12bee9ca04e3f8a98540650965b5', 7200, 1, '2018-11-13 14:23:59', '2018-11-13 14:23:59');
INSERT INTO `work_user_tokens` VALUES (15, 2, 2, 'applet', 'user&applet@24aa629f79d2a7dabf590070c915e37e', 'user&applet@57bf73c33d9f3efef6a9276a24094b32', 0, 1, '2018-11-10 15:11:43', '2018-11-10 15:11:43');
INSERT INTO `work_user_tokens` VALUES (16, 2, 2, 'applet', 'user&applet@a15885f697dd1e1be29362651638b38d', 'user&applet@56b2abdd93e3135fefef4b56c52c2711', 0, 1, '2018-11-10 15:38:51', '2018-11-10 15:38:51');
INSERT INTO `work_user_tokens` VALUES (17, 2, 2, 'applet', 'user&applet@ba90860d95d240d4bb04f2580274b3cf', 'user&applet@97d63f5a13a6c98fd5a1b35cf447b0ab', 0, 1, '2018-11-10 15:55:44', '2018-11-10 15:55:44');
INSERT INTO `work_user_tokens` VALUES (18, 1, 1, 'wechat', 'user&wechat@f06e5a0287923470676eba4ca12e03d4', 'user&wechat@d24ae3ee4d1aa2c67c942872294acec3', 7200, 1, '2018-11-10 15:58:47', '2018-11-10 15:58:47');
INSERT INTO `work_user_tokens` VALUES (19, 1, 1, 'wechat', 'user&wechat@7e1df311a3e0f2f158d628951e7367f5', 'user&wechat@f9971d672b37785f4228092b5bdc21b6', 7200, 1, '2018-11-10 16:00:10', '2018-11-10 16:00:10');
INSERT INTO `work_user_tokens` VALUES (20, 5, 5, 'wechat', 'user&wechat@3d41ced5c46502395685a7d15d29636f', 'user&wechat@95bd98af7a164dcc61f45e08920403de', 7200, 1, '2018-11-10 16:00:30', '2018-11-10 16:00:30');
INSERT INTO `work_user_tokens` VALUES (21, 1, 1, 'wechat', 'user&wechat@e5f38f3764d7453b269b9c4aa7833818', 'user&wechat@d0e14cb70b2245c003419d04fdb44882', 7200, 1, '2018-11-10 16:24:03', '2018-11-10 16:24:03');
INSERT INTO `work_user_tokens` VALUES (22, 1, 1, 'wechat', 'user&wechat@ffbb2af9e71952b0b418453034a35a79', 'user&wechat@6960156d982e9b3955a42973bf543b53', 7200, 1, '2018-11-10 16:36:50', '2018-11-10 16:36:50');
INSERT INTO `work_user_tokens` VALUES (23, 4, 4, 'app', 'user&app@3ff1b67243f3865bbeef849aac9cb0da', 'user&app@1e13069628bfb34ca0baf356298e61ed', 0, 1, '2018-11-10 16:39:34', '2018-11-10 16:39:34');
INSERT INTO `work_user_tokens` VALUES (24, 4, 4, 'app', 'user&app@4043fb95a654c4464a5a0fa0e572c83a', 'user&app@98fbcf5d78d6cd3fcb8847d0eb0e8c30', 0, 1, '2018-11-10 16:40:48', '2018-11-10 16:40:48');
INSERT INTO `work_user_tokens` VALUES (38, 10, 10, 'wechat', 'user&wechat@d9d3327421ac73bb51110d49e7d27a26', 'user&wechat@4938ff4125580bd5e08b909eb473c01f', 7200, 1, '2018-11-12 14:27:08', '2018-11-12 14:27:08');
INSERT INTO `work_user_tokens` VALUES (26, 6, 6, 'applet', 'user&applet@cf8973e7c681b1ecd8e4a699e4b5ad76', 'user&applet@5defa82254ae38e4ba78234c0bda9602', 0, 1, '2018-11-10 16:42:53', '2018-11-10 16:42:53');
INSERT INTO `work_user_tokens` VALUES (27, 1, 1, 'wechat', 'user&wechat@e3ac39b5c858ff13b2b3dcbab7efeeb2', 'user&wechat@6592adc51ccbdc7f54ca602e42bbe94b', 7200, 1, '2018-11-10 16:48:35', '2018-11-10 16:48:35');
INSERT INTO `work_user_tokens` VALUES (28, 7, 7, 'pc', 'user&pc@336b8d62138055939b9a638c60e1f2af', 'user&pc@a3e0ea1991ce3c020244351773f9970e', 7200, 1, '2018-11-10 17:38:14', '2018-11-10 17:38:14');
INSERT INTO `work_user_tokens` VALUES (29, 7, 7, 'wap', 'user&wap@f8654c4492eebbd8e8c2c638c95ad722', 'user&wap@1073e3864abe9784820917edc533b16b', 7200, 1, '2018-11-10 18:39:06', '2018-11-10 18:39:06');
INSERT INTO `work_user_tokens` VALUES (30, 8, 8, 'wechat', 'user&wechat@cc8fa63676a38a4bcde958c2200c0a57', 'user&wechat@06a056d85b783509460ca1bd0349c457', 7200, 1, '2018-11-12 11:17:55', '2018-11-12 16:52:49');
INSERT INTO `work_user_tokens` VALUES (31, 9, 9, 'wap', 'user&wap@d6bf54711d2a2c0cf79acd5a0562170a', 'user&wap@467c3dc012633d3085224be1768f4d4c', 7200, 1, '2018-11-12 12:45:53', '2018-11-12 12:45:53');
INSERT INTO `work_user_tokens` VALUES (32, 9, 9, 'wap', 'user&wap@73b28d4d0cfa282a8e0e5bd559e26b82', 'user&wap@379d930fdedd21c56a4c0f788575a295', 7200, 1, '2018-11-12 13:45:19', '2018-11-12 13:45:19');
INSERT INTO `work_user_tokens` VALUES (33, 9, 9, 'wap', 'user&wap@fa9d1e6d2504cffd32f5ffbb8d23e0fc', 'user&wap@244f2a3046ea55f8e1adb500dbe656b2', 7200, 1, '2018-11-12 13:50:57', '2018-11-12 13:50:57');
INSERT INTO `work_user_tokens` VALUES (34, 9, 9, 'wap', 'user&wap@c48107631323eff1b8c17314c074a7c0', 'user&wap@83484591ac285c9096e7220213f89262', 7200, 1, '2018-11-12 13:51:40', '2018-11-12 13:51:40');
INSERT INTO `work_user_tokens` VALUES (35, 1, 1, 'applet', 'user&applet@f62c581f2072b194c1dc173a22b137ea', 'user&applet@d4bff3c27a93ef0851efa005338b4899', 0, 1, '2018-11-12 13:52:16', '2018-11-12 13:52:16');
INSERT INTO `work_user_tokens` VALUES (358, 1, 1, 'wechat', 'user&wechat@d84cf2eac7b2812c304d594309d01dd1', 'user&wechat@4b2306a5f21497a555fc704fedc7a616', 7200, 1, '2018-12-04 20:38:18', '2018-12-04 20:38:18');
INSERT INTO `work_user_tokens` VALUES (37, 2, 2, 'app', 'user&app@957b0c28da256e4f6cecea2584dfc4b5', 'user&app@1b06f13b2860a00ac028787e67986a9a', 0, 1, '2018-11-12 13:53:47', '2018-11-12 13:53:47');
INSERT INTO `work_user_tokens` VALUES (39, 9, 9, 'wap', 'user&wap@2c42f85c12698d72715e3828af8a195a', 'user&wap@4095f483dfaed97a4ce0f03d1cf716ec', 7200, 1, '2018-11-12 14:45:49', '2018-11-12 14:45:49');
INSERT INTO `work_user_tokens` VALUES (40, 9, 9, 'wap', 'user&wap@52b6d85a2bfc96348a284d5beb3b7722', 'user&wap@ccfe3d65f3586837c56b81f150786cc8', 7200, 1, '2018-11-12 14:48:41', '2018-11-12 14:48:41');
INSERT INTO `work_user_tokens` VALUES (41, 9, 9, 'wap', 'user&wap@0a83d278f5825cdcf208badf2d96a04f', 'user&wap@5f41f8d98cf5ade2d6145ec6d132e643', 7200, 1, '2018-11-12 14:49:17', '2018-11-12 14:49:17');
INSERT INTO `work_user_tokens` VALUES (42, 11, 11, 'applet', 'user&applet@13964d2bedbd80122b437b4bd325e5a4', 'user&applet@ca9764a76ed7f83b6bc6961efd05d3ab', 0, 1, '2018-11-12 15:08:12', '2018-11-12 15:08:12');
INSERT INTO `work_user_tokens` VALUES (43, 9, 9, 'wap', 'user&wap@fc1f1ea525c30ccfdc5292b0c89806d9', 'user&wap@84805ca6dac2ab1e6e7c3546e6d11ba5', 7200, 1, '2018-11-12 15:49:05', '2018-11-12 15:49:05');
INSERT INTO `work_user_tokens` VALUES (44, 9, 9, 'wap', 'user&wap@808223b544930b0dde691f0bae891fd5', 'user&wap@43ede1e0e161d41a520bc75ba9406612', 7200, 1, '2018-11-12 15:49:13', '2018-11-12 15:49:13');
INSERT INTO `work_user_tokens` VALUES (45, 9, 9, 'wap', 'user&wap@e5f71d848eae9440a7f37fcca405c5b1', 'user&wap@13039d2e3bc24a69dd4dabeac547aa7b', 7200, 1, '2018-11-12 15:49:21', '2018-11-12 15:49:21');
INSERT INTO `work_user_tokens` VALUES (46, 9, 9, 'wap', 'user&wap@a31a18199fc93c0b28ac8dbf2f874c11', 'user&wap@636f1bb4e7b90039d28217b6597a7b63', 7200, 1, '2018-11-12 15:50:35', '2018-11-12 15:50:35');
INSERT INTO `work_user_tokens` VALUES (47, 9, 9, 'wap', 'user&wap@ebb0a4c959297483679dd2d65210f1f1', 'user&wap@571911cc66dc111ac7fa6491efb75d63', 7200, 1, '2018-11-12 15:50:45', '2018-11-12 15:50:45');
INSERT INTO `work_user_tokens` VALUES (48, 9, 9, 'wap', 'user&wap@c9d4fbc521cd50bd00630ded00e9360a', 'user&wap@0c29c8568a8d94949bf6a7b274f6eade', 7200, 1, '2018-11-12 15:50:54', '2018-11-12 15:50:54');
INSERT INTO `work_user_tokens` VALUES (49, 9, 9, 'wap', 'user&wap@ed1047030cfdd18ab9e54000763270b1', 'user&wap@14653b87be78e5e4af44bd932468adb1', 7200, 1, '2018-11-12 16:12:15', '2018-11-12 16:12:15');
INSERT INTO `work_user_tokens` VALUES (50, 9, 9, 'wap', 'user&wap@d33f8c1e5b35da0264ce75f569d6f025', 'user&wap@f46d0952765f9003dcf7309113327948', 7200, 1, '2018-11-12 16:12:24', '2018-11-12 16:12:24');
INSERT INTO `work_user_tokens` VALUES (51, 9, 9, 'wap', 'user&wap@7adc5cbe6ed270da4e0d2646a96f51eb', 'user&wap@5dcd65300eb225a98d3c7a09357c6d8e', 7200, 1, '2018-11-12 16:12:33', '2018-11-12 16:12:33');
INSERT INTO `work_user_tokens` VALUES (52, 12, 12, 'applet', 'user&applet@3614ef209d63a40f29f940a2a41e3855', 'user&applet@2832b8491736abbe2c78df41bc88dd3f', 0, 1, '2018-11-12 17:19:46', '2018-11-12 17:19:46');
INSERT INTO `work_user_tokens` VALUES (54, 4, 4, 'applet', 'user&applet@13145057dce7aadb3f6ded205d3fafcd', 'user&applet@b85b7f44d8e3cf1283a0fd58094c52e1', 0, 1, '2018-11-12 17:37:21', '2018-11-12 17:37:21');
INSERT INTO `work_user_tokens` VALUES (55, 2, 2, 'applet', 'user&applet@d40f07d2d8c581081f4f0f35b2cf487c', 'user&applet@7a31d116dec67e16c97019fda2931279', 0, 1, '2018-11-12 17:52:01', '2018-11-12 17:52:01');
INSERT INTO `work_user_tokens` VALUES (56, 2, 2, 'app', 'user&app@2ad40d765d15f28e258a3d01022b9e7f', 'user&app@edbf29d49adc8a8facf3c8d48fd57a0c', 0, 1, '2018-11-12 17:56:23', '2018-11-12 17:56:23');
INSERT INTO `work_user_tokens` VALUES (57, 13, 13, 'applet', 'user&applet@c9a014c307942e9fb153709bde401a60', 'user&applet@018d9b535a1cb78ff61667d4ee9d4e64', 0, 1, '2018-11-12 22:35:49', '2018-11-12 22:35:49');
INSERT INTO `work_user_tokens` VALUES (58, 11, 11, 'applet', 'user&applet@024e2c39d954c881dba5969e803eade2', 'user&applet@0527083f22eca9fce95acf77208c4327', 0, 1, '2018-11-13 09:30:01', '2018-11-13 09:30:01');
INSERT INTO `work_user_tokens` VALUES (59, 11, 11, 'applet', 'user&applet@a432942d84deea554e03509f8a2cf263', 'user&applet@4944c0f53f4aab60a867a28bf9e278fc', 0, 1, '2018-11-13 09:39:12', '2018-11-13 09:39:12');
INSERT INTO `work_user_tokens` VALUES (60, 13, 13, 'applet', 'user&applet@f6db83ab06be5e1133b03eb5c6b39082', 'user&applet@aa578452885acebec56f9de2affb1bf8', 0, 1, '2018-11-13 10:33:47', '2018-11-13 10:33:47');
INSERT INTO `work_user_tokens` VALUES (61, 4, 4, 'app', 'user&app@5a75b3dea337623cb35a1a7093736033', 'user&app@ed9beff3a1cb71443adb0a80f7c1e54d', 0, 1, '2018-11-13 10:47:03', '2018-11-13 10:47:03');
INSERT INTO `work_user_tokens` VALUES (62, 4, 4, 'app', 'user&app@00248e0efeffbc0d9e5de2c21fe0aecf', 'user&app@0e55013a6d4b5b404a320e805a0f58db', 0, 1, '2018-11-13 10:48:49', '2018-11-13 10:48:49');
INSERT INTO `work_user_tokens` VALUES (64, 9, 9, 'wechat', 'user&wechat@e25cc3476808d10834bf7f1f4cb0f068', 'user&wechat@76e46bcd04ce3012e2fd4c57563dbe6a', 7200, 1, '2018-11-13 14:24:14', '2018-11-13 14:24:14');
INSERT INTO `work_user_tokens` VALUES (65, 4, 4, 'wap', 'user&wap@4c55e5e31dc0f853819d0e177df41425', 'user&wap@2670604249bb6c69949cf91124f4a7c1', 7200, 1, '2018-11-13 16:56:28', '2018-11-13 16:56:28');
INSERT INTO `work_user_tokens` VALUES (66, 14, 14, 'applet', 'user&applet@418ed2262bdd42284ba98bbf7a4a31cd', 'user&applet@e0c640472193db3768ee4d8a868f50c5', 0, 1, '2018-11-14 10:19:52', '2018-11-14 10:19:52');
INSERT INTO `work_user_tokens` VALUES (67, 4, 4, 'applet', 'user&applet@c7ac6967f43fc3fdcdfd9203216fd828', 'user&applet@43c532c57ecff99de915330e482eb7f3', 0, 1, '2018-11-14 11:10:53', '2018-11-14 11:10:53');
INSERT INTO `work_user_tokens` VALUES (68, 15, 15, 'applet', 'user&applet@3790fa5e88678a97158cdc1812ac3f5e', 'user&applet@19d7657ea782fe5c99a35219e55ccc85', 0, 1, '2018-11-14 11:13:22', '2018-11-14 11:13:22');
INSERT INTO `work_user_tokens` VALUES (69, 16, 16, 'applet', 'user&applet@1c6b2a573e26ad83b9cd734c308de1ac', 'user&applet@54f3adf25ede9d838bde1489def1a6d2', 0, 1, '2018-11-14 14:00:18', '2018-11-14 14:00:18');
INSERT INTO `work_user_tokens` VALUES (221, 4, 4, 'applet', 'user&applet@d4badafab05a6fdb8f9f9f8071d6a68e', 'user&applet@4b11f4a3fca94f7ca9daa42cbdee2963', 0, 1, '2018-11-23 15:39:50', '2018-11-23 15:39:50');
INSERT INTO `work_user_tokens` VALUES (71, 13, 13, 'applet', 'user&applet@ca43aaf72e4f7416d13c135329a28367', 'user&applet@f905edd20cea4e2e53368f313f550342', 0, 1, '2018-11-15 10:53:30', '2018-11-15 10:53:30');
INSERT INTO `work_user_tokens` VALUES (72, 13, 13, 'applet', 'user&applet@fc7428223fcf7a8d885532df392ffe11', 'user&applet@68e80c63b0005284c2c7556fa7cbe4ce', 0, 1, '2018-11-15 10:54:02', '2018-11-15 10:54:02');
INSERT INTO `work_user_tokens` VALUES (73, 1, 1, 'app', 'user&app@12362e2e4b2a8c2ffb30446dc90fffaa', 'user&app@fa96810dd8af858b6e1b837c3565be2e', 0, 1, '2018-11-15 14:51:39', '2018-11-15 14:51:39');
INSERT INTO `work_user_tokens` VALUES (74, 17, 17, 'app', 'user&app@1e4051558f2711e6b55cc70865fd9456', 'user&app@ebd995a51fcbd224a77c5c2adcfd955b', 0, 1, '2018-11-15 14:52:24', '2018-11-15 14:52:24');
INSERT INTO `work_user_tokens` VALUES (75, 13, 13, 'applet', 'user&applet@a088614b1f26de7fecdbabca325cc9f7', 'user&applet@95e4fe9bc469c57d84ebc54a003a0bb4', 0, 1, '2018-11-15 22:26:28', '2018-11-15 22:26:28');
INSERT INTO `work_user_tokens` VALUES (76, 13, 13, 'applet', 'user&applet@ee20dea1f51f4d9ef9d6f972c92bcb3e', 'user&applet@c48029393dac39bf7cbbc708428c5c17', 0, 1, '2018-11-15 22:35:43', '2018-11-15 22:35:43');
INSERT INTO `work_user_tokens` VALUES (77, 18, 18, 'applet', 'user&applet@26ff7a5cad42684350bd933e3137f9b3', 'user&applet@6feb19e66f53fcb4aeadddb10e787998', 0, 1, '2018-11-16 10:18:07', '2018-11-16 10:18:07');
INSERT INTO `work_user_tokens` VALUES (78, 2, 2, 'wechat', 'user&wechat@d2c29924ad3637107f2baa8d6cff3341', 'user&wechat@43d667cca5be3d1314ed45d90ab36d3d', 7200, 1, '2018-11-16 13:30:51', '2018-11-16 13:30:51');
INSERT INTO `work_user_tokens` VALUES (79, 12, 12, 'app', 'user&app@1842612e1534b948cb1839f35649a5b8', 'user&app@63a16cf6c1110d505b3907b5623dd4f4', 0, 1, '2018-11-16 13:41:19', '2018-11-16 13:41:19');
INSERT INTO `work_user_tokens` VALUES (80, 13, 13, 'applet', 'user&applet@a27cf48f5a04ecddc4b253b282fba5dc', 'user&applet@f76f6f206365b99f49707f8a90931daf', 0, 1, '2018-11-16 15:05:05', '2018-11-16 15:05:05');
INSERT INTO `work_user_tokens` VALUES (139, 1, 1, 'app', 'user&app@accfce08a545863ad93d875dcf61b913', 'user&app@417c8390b37408020a42e8b38f37420e', 0, 1, '2018-11-20 15:14:48', '2018-11-20 15:14:48');
INSERT INTO `work_user_tokens` VALUES (82, 19, 19, 'applet', 'user&applet@48a59a28ff37443ad61a624288dbf1dd', 'user&applet@414f9801f76b051b8a8a85da7ca9f86e', 0, 1, '2018-11-16 17:17:22', '2018-11-16 17:17:22');
INSERT INTO `work_user_tokens` VALUES (84, 4, 4, 'applet', 'user&applet@c5d6ddf52d5a403f928e0f9ca6452655', 'user&applet@e5fa4f91f4858ff6fac1fadb910f0c79', 0, 1, '2018-11-17 09:35:05', '2018-11-17 09:35:05');
INSERT INTO `work_user_tokens` VALUES (85, 1, 1, 'applet', 'user&applet@73305d0c51f2be1ae5961048f9c36753', 'user&applet@79281f79b049c00fd1d28ba0d12d0ca6', 0, 1, '2018-11-17 09:53:16', '2018-11-17 09:53:16');
INSERT INTO `work_user_tokens` VALUES (86, 1, 1, 'wap', 'user&wap@c4cef7d28118e4ba211b8acbd6b56b7a', 'user&wap@1c2c201898b9608bdbadfa12f6f21196', 7200, 1, '2018-11-17 09:56:10', '2018-11-17 14:46:17');
INSERT INTO `work_user_tokens` VALUES (87, 1, 1, 'applet', 'user&applet@f6729ffd822fa2918b94c05c1f7caada', 'user&applet@72e1e5ef007327cf3d7946256003c485', 0, 1, '2018-11-17 09:56:55', '2018-11-17 09:56:55');
INSERT INTO `work_user_tokens` VALUES (88, 1, 1, 'applet', 'user&applet@76fe9569aab844077c76f01335aeb9a1', 'user&applet@9e087b812eb51de19021d83ea88e4819', 0, 1, '2018-11-17 09:58:49', '2018-11-17 09:58:49');
INSERT INTO `work_user_tokens` VALUES (89, 1, 1, 'app', 'user&app@706515a43954b94769d4144c2e21af3e', 'user&app@9d22d0ef07feac21f7cb790082d546da', 0, 1, '2018-11-17 10:44:35', '2018-11-17 10:44:35');
INSERT INTO `work_user_tokens` VALUES (90, 1, 1, 'applet', 'user&applet@52356095a787e35f9d67f5e3f43bdd44', 'user&applet@f0fcd254674e6adfd16e898d56a71860', 0, 1, '2018-11-17 10:45:03', '2018-11-17 10:45:03');
INSERT INTO `work_user_tokens` VALUES (91, 1, 1, 'applet', 'user&applet@c119adce4f77ad4d59284e7e0a592da8', 'user&applet@cb6d673577120231d1fea4188785e098', 0, 1, '2018-11-17 10:52:44', '2018-11-17 10:52:44');
INSERT INTO `work_user_tokens` VALUES (92, 1, 1, 'applet', 'user&applet@1df54da13fbf71c52e4b0a688ea09150', 'user&applet@1a7f68f52c6d8e3d38e26344ced2a1ad', 0, 1, '2018-11-17 10:53:11', '2018-11-17 10:53:11');
INSERT INTO `work_user_tokens` VALUES (93, 1, 1, 'wechat', 'user&wechat@f3bff6114882285bded645603025bdd0', 'user&wechat@90096ee46dd45702c6db5ac870e4a7ea', 7200, 1, '2018-11-17 11:07:31', '2018-11-17 11:07:31');
INSERT INTO `work_user_tokens` VALUES (94, 1, 1, 'wechat', 'user&wechat@9e630f13a7e82cd85a118dc60a12d717', 'user&wechat@92b38637d6a36796c924e82d2ed9bdc1', 7200, 1, '2018-11-17 11:13:32', '2018-11-17 11:13:32');
INSERT INTO `work_user_tokens` VALUES (95, 1, 1, 'wechat', 'user&wechat@95b27afd2a5ffb19ed528862dd580c31', 'user&wechat@6442ce07c8c7e99ec2c86f19a3e17ba0', 7200, 1, '2018-11-17 11:41:27', '2018-11-17 11:41:27');
INSERT INTO `work_user_tokens` VALUES (96, 13, 13, 'applet', 'user&applet@4da81ada19d81bb2be911f04e77a3333', 'user&applet@ee915078b2482fe2739c8a39414f8fd6', 0, 1, '2018-11-17 11:45:37', '2018-11-17 11:45:37');
INSERT INTO `work_user_tokens` VALUES (97, 10, 10, 'wechat', 'user&wechat@aeb50fec61de1343eb381574c35709bd', 'user&wechat@76dd995a012c2da84771c2691cf38aaa', 7200, 1, '2018-11-17 11:53:13', '2018-11-17 11:53:13');
INSERT INTO `work_user_tokens` VALUES (301, 20, 20, 'wap', 'user&wap@70dcd3f36710f6b4c3f3c6839dff20f6', 'user&wap@b668e901b9a6591c29c0a1612b671040', 7200, 1, '2018-11-30 15:39:45', '2018-11-30 15:39:45');
INSERT INTO `work_user_tokens` VALUES (99, 21, 21, 'applet', 'user&applet@b7bd76e6b0795f83c5ef92cb0ad6a651', 'user&applet@c7b4d3778f20ac8ae75c7aaf092c810f', 0, 1, '2018-11-17 13:59:12', '2018-11-17 13:59:12');
INSERT INTO `work_user_tokens` VALUES (100, 22, 22, 'applet', 'user&applet@48a6153537df98a40fbb2b547cea6484', 'user&applet@9eb2224f2ee9ef71bb1ba624e59fc38a', 0, 1, '2018-11-17 14:17:32', '2018-11-17 14:17:32');
INSERT INTO `work_user_tokens` VALUES (101, 23, 23, 'applet', 'user&applet@acadcb8a49fac862c7492ea2aad0cbf5', 'user&applet@e4113d7be2b02e67f1b1867d49126123', 0, 1, '2018-11-17 14:19:54', '2018-11-17 14:19:54');
INSERT INTO `work_user_tokens` VALUES (102, 4, 4, 'applet', 'user&applet@6e8fe1660000e337a14b16fe6e526155', 'user&applet@eb0e4790480a7842178ade5773146af6', 0, 1, '2018-11-17 15:16:59', '2018-11-17 15:16:59');
INSERT INTO `work_user_tokens` VALUES (103, 24, 24, 'applet', 'user&applet@efcaa972ae8d416a130d660318464a88', 'user&applet@686ba4e64c6fb80155b4dad3beb0b001', 0, 1, '2018-11-17 15:21:32', '2018-11-17 15:21:32');
INSERT INTO `work_user_tokens` VALUES (104, 17, 17, 'applet', 'user&applet@510a6cb88381fa0520e5e4ef357b54d6', 'user&applet@bbfea4ec07d16e0885220c5c7658c9e1', 0, 1, '2018-11-17 15:24:11', '2018-11-17 15:24:11');
INSERT INTO `work_user_tokens` VALUES (105, 1, 1, 'app', 'user&app@410863768e311ba0bf7582be69f63672', 'user&app@28c20b618751a51565e37d75254b09b2', 0, 1, '2018-11-17 15:25:20', '2018-11-17 15:25:20');
INSERT INTO `work_user_tokens` VALUES (106, 23, 23, 'applet', 'user&applet@007461832db23d61bb84cd6fc510dadf', 'user&applet@c61b35626fdd4673d3b19fc095c1310d', 0, 1, '2018-11-17 15:38:44', '2018-11-17 15:38:44');
INSERT INTO `work_user_tokens` VALUES (107, 25, 25, 'applet', 'user&applet@01e312612239750b80c5aff917252072', 'user&applet@2767e9bbb51707f87feb7c057fb20039', 0, 1, '2018-11-17 15:39:17', '2018-11-17 15:39:17');
INSERT INTO `work_user_tokens` VALUES (108, 8, 8, 'applet', 'user&applet@42ddece0528e771f4e8440a839e37e97', 'user&applet@e78e061424a2fb57995fa449f7f2e64e', 0, 1, '2018-11-17 15:43:52', '2018-11-17 15:43:52');
INSERT INTO `work_user_tokens` VALUES (109, 26, 26, 'wap', 'user&wap@3fb501333b205516c73abdf0a052bf6a', 'user&wap@6ff82763ba364eff07da139aa2c42118', 7200, 1, '2018-11-17 15:49:36', '2018-11-17 15:49:36');
INSERT INTO `work_user_tokens` VALUES (242, 1, 1, 'wap', 'user&wap@361ddd1bf79e456d23afec48beb188c4', 'user&wap@aed008ae305c18c3b9f74147567508f5', 7200, 1, '2018-11-24 16:15:42', '2018-11-24 16:15:42');
INSERT INTO `work_user_tokens` VALUES (111, 25, 25, 'applet', 'user&applet@daf0aa8e18c2cac6925b518a64ccfff7', 'user&applet@8044550ff18621c8d956b56097a8b7e2', 0, 1, '2018-11-17 16:04:55', '2018-11-17 16:04:55');
INSERT INTO `work_user_tokens` VALUES (112, 17, 17, 'applet', 'user&applet@3d7ad4a036bd76d75b38ac7fda27898c', 'user&applet@3069b0edf63e2575ca40bc9cafffe850', 0, 1, '2018-11-17 16:05:42', '2018-11-17 16:05:42');
INSERT INTO `work_user_tokens` VALUES (378, 12, 12, 'applet', 'user&applet@f07290769c8fdc2ca54306a325cfa9c5', 'user&applet@e9baef57fdf08cc50308e0a4be1a4bf4', 0, 1, '2018-12-07 09:29:31', '2018-12-07 09:29:31');
INSERT INTO `work_user_tokens` VALUES (114, 27, 27, 'applet', 'user&applet@7b557cd32a3ba2bb3c8df292dedfd46c', 'user&applet@4bdf54502d034ea06880f1e0f4218e95', 0, 1, '2018-11-17 16:32:15', '2018-11-17 16:32:15');
INSERT INTO `work_user_tokens` VALUES (115, 4, 4, 'applet', 'user&applet@27a37c8d0dd01bf7a17e891a25f7b09a', 'user&applet@ed91cea8c431ac5584819f0095606d6a', 0, 1, '2018-11-17 16:58:40', '2018-11-17 16:58:40');
INSERT INTO `work_user_tokens` VALUES (117, 8, 8, 'app', 'user&app@d00fcca6a62d76237f7eda6fd4d18b95', 'user&app@4ccf8b89d5c84c7e4f4de709d219bfce', 0, 1, '2018-11-19 09:43:12', '2018-11-19 09:43:12');
INSERT INTO `work_user_tokens` VALUES (118, 10, 10, 'wap', 'user&wap@a4b4b4f024c989e61a9f65cd338fc18c', 'user&wap@d6a6c4fbfbf38c0061977c64b87b4a5b', 7200, 1, '2018-11-19 09:44:19', '2018-11-19 09:44:19');
INSERT INTO `work_user_tokens` VALUES (120, 28, 28, 'applet', 'user&applet@0f5f282bcec55ec7aa3f8b7ec8ddea47', 'user&applet@055e97dcc8a8da62994b174c7b3dfc7e', 0, 1, '2018-11-19 12:25:10', '2018-11-19 12:25:10');
INSERT INTO `work_user_tokens` VALUES (121, 29, 29, 'applet', 'user&applet@ee494bbc43887fe88942a3276bf15bd5', 'user&applet@9d0b9cdeb443e2f01ced5566e1af0be5', 0, 1, '2018-11-19 12:51:39', '2018-11-19 12:51:39');
INSERT INTO `work_user_tokens` VALUES (122, 13, 13, 'applet', 'user&applet@afa2b05961a98117f0a440f0b4f5a19d', 'user&applet@f313df104751aa8328258aeb3bfeb57b', 0, 1, '2018-11-19 14:22:25', '2018-11-19 14:22:25');
INSERT INTO `work_user_tokens` VALUES (123, 17, 17, 'applet', 'user&applet@7bad94b95301a337c5bc0fbce6d04de9', 'user&applet@1b8549883098ccfe611d8fdb707841c5', 0, 1, '2018-11-19 14:56:51', '2018-11-19 14:56:51');
INSERT INTO `work_user_tokens` VALUES (124, 4, 4, 'app', 'user&app@e975b520f106ee571f44bf36c9bcf3cf', 'user&app@0c93e8f86a934f5621469d0ff033c8f1', 0, 1, '2018-11-19 15:58:47', '2018-11-19 15:58:47');
INSERT INTO `work_user_tokens` VALUES (125, 30, 30, 'applet', 'user&applet@fbdec8a45425363edcde7108fb5d9059', 'user&applet@a57749b043cfbc3c651a8f16ef3b163b', 0, 1, '2018-11-19 16:28:19', '2018-11-19 16:28:19');
INSERT INTO `work_user_tokens` VALUES (126, 1, 1, 'applet', 'user&applet@b43892a1e78820e055ca3737e9a122a1', 'user&applet@8d994a932b8355d6a4ed8425cd0c43ea', 0, 1, '2018-11-19 16:31:06', '2018-11-19 16:31:06');
INSERT INTO `work_user_tokens` VALUES (127, 31, 31, 'app', 'user&app@819ce5fd1cbdf8bfd398fbccef383f38', 'user&app@3517c6674394bbafa0f1e78972932d3b', 0, 1, '2018-11-19 17:32:59', '2018-11-19 17:32:59');
INSERT INTO `work_user_tokens` VALUES (128, 2, 2, 'wechat', 'user&wechat@118f8344d4a74eb6139c95947332fdfc', 'user&wechat@465f87cf003a7ecc63c65a587ae5c139', 7200, 1, '2018-11-20 09:46:31', '2018-11-21 14:47:44');
INSERT INTO `work_user_tokens` VALUES (129, 2, 2, 'applet', 'user&applet@8293554cac56e51ff8dc5a7dea94bd44', 'user&applet@16f2f07c9419fec281f8e3d7311a0ce2', 0, 1, '2018-11-20 09:49:23', '2018-11-20 09:49:23');
INSERT INTO `work_user_tokens` VALUES (130, 2, 2, 'applet', 'user&applet@87050240b43767508e9fa297428ba274', 'user&applet@b7f4585a6fa782a3262b9b8ab60d97c7', 0, 1, '2018-11-20 09:54:42', '2018-11-20 09:54:42');
INSERT INTO `work_user_tokens` VALUES (131, 2, 2, 'applet', 'user&applet@3afbaeee7188afc15ad9ae690f1788df', 'user&applet@2e05389e5f0f7f11616048036ac20e5a', 0, 1, '2018-11-20 10:04:06', '2018-11-20 10:04:06');
INSERT INTO `work_user_tokens` VALUES (132, 2, 2, 'app', 'user&app@a5551bc997241a1e1731dac33a8b4a12', 'user&app@3a80cf4af92aa936c0a8fa522e199394', 0, 1, '2018-11-20 10:05:28', '2018-11-20 10:05:28');
INSERT INTO `work_user_tokens` VALUES (133, 15, 15, 'app', 'user&app@b3ae9558ba1b1dee992b85f3bc335948', 'user&app@24ee8d5526b2685ab531661d68ba504a', 0, 1, '2018-11-20 10:29:58', '2018-11-20 10:29:58');
INSERT INTO `work_user_tokens` VALUES (134, 30, 30, 'applet', 'user&applet@7491de1439df252e9ad54f8400e1b66f', 'user&applet@7c99ad2af507bf69bc043d60cc8fd5d7', 0, 1, '2018-11-20 10:37:22', '2018-11-20 10:37:22');
INSERT INTO `work_user_tokens` VALUES (135, 31, 31, 'applet', 'user&applet@115765e35365e0680359ac37bda3789a', 'user&applet@63ce1e5c8c842a8a187ece1e14d57298', 0, 1, '2018-11-20 10:38:03', '2018-11-20 10:38:03');
INSERT INTO `work_user_tokens` VALUES (136, 3, 3, 'applet', 'user&applet@bb6ea8c0f54b12553d7cc46cbc1b461c', 'user&applet@73b61c331275d94300b8ae2f2d49225b', 0, 1, '2018-11-20 10:39:27', '2018-11-20 10:39:27');
INSERT INTO `work_user_tokens` VALUES (137, 17, 17, 'applet', 'user&applet@8afaf1766ec64dd7a6d56a9d081996a1', 'user&applet@7a2f21545680e06e4f1d5a8947ca0b39', 0, 1, '2018-11-20 10:41:16', '2018-11-20 10:41:16');
INSERT INTO `work_user_tokens` VALUES (138, 32, 32, 'applet', 'user&applet@2add3bba2c7a799e78ddc94a2edbea7f', 'user&applet@7b6012e555fcd1ee9e1c952212cb7b8e', 0, 1, '2018-11-20 14:07:51', '2018-11-20 14:07:51');
INSERT INTO `work_user_tokens` VALUES (140, 31, 31, 'app', 'user&app@fbd527b84d6aa134026af87e84bdbb98', 'user&app@f136077575b8805286b5dd738cf08f48', 0, 1, '2018-11-20 15:59:36', '2018-11-20 15:59:36');
INSERT INTO `work_user_tokens` VALUES (141, 33, 33, 'app', 'user&app@605faef84e67a4e069e82e41c9eaa33a', 'user&app@91111f700833e5f334d13cf6af094f62', 0, 1, '2018-11-20 16:57:45', '2018-11-20 16:57:45');
INSERT INTO `work_user_tokens` VALUES (142, 15, 15, 'app', 'user&app@33f0a6b2b32bd2132d5e711bad0a8f14', 'user&app@fb1ecba89aa74d7c23f654f1e627786d', 0, 1, '2018-11-20 17:06:18', '2018-11-20 17:06:18');
INSERT INTO `work_user_tokens` VALUES (143, 15, 15, 'app', 'user&app@48722026220c735b7e018a8d66e31cd3', 'user&app@e19ff0cd8ed58b1b0a2608cde120a25f', 0, 1, '2018-11-20 17:36:03', '2018-11-20 17:36:03');
INSERT INTO `work_user_tokens` VALUES (144, 15, 15, 'app', 'user&app@763d1492396d739019a5fe7e43060e11', 'user&app@5660db636db958e7313f81badec17ce9', 0, 1, '2018-11-20 17:37:12', '2018-11-20 17:37:12');
INSERT INTO `work_user_tokens` VALUES (145, 15, 15, 'app', 'user&app@17d20d511c46c04391938b62cb6d1b19', 'user&app@dd39fec650ca0a9d5ec768951b9c3d7f', 0, 1, '2018-11-20 17:37:43', '2018-11-20 17:37:43');
INSERT INTO `work_user_tokens` VALUES (146, 32, 32, 'applet', 'user&applet@5c8bae046a3ab7d522d87402b8f4938e', 'user&applet@c5ffdc832c0095fea4be69f032bf3da9', 0, 1, '2018-11-20 23:15:23', '2018-11-20 23:15:23');
INSERT INTO `work_user_tokens` VALUES (147, 2, 2, 'applet', 'user&applet@2395e2a1e94fc987c3ee8754fba0b794', 'user&applet@98214e2fb6f7b09ca4515bc207f48d48', 0, 1, '2018-11-21 07:23:29', '2018-11-21 07:23:29');
INSERT INTO `work_user_tokens` VALUES (148, 34, 34, 'app', 'user&app@28f0d99ead7a2efb7014346902517c6a', 'user&app@7175788d126f532318ef3bda1c9e65a7', 0, 1, '2018-11-21 09:09:56', '2018-11-21 09:09:56');
INSERT INTO `work_user_tokens` VALUES (149, 2, 2, 'app', 'user&app@870616332e1a6364b6eef1166c145228', 'user&app@f1c8890c89579755c32eec8ff097befe', 0, 1, '2018-11-21 09:12:26', '2018-11-21 09:12:26');
INSERT INTO `work_user_tokens` VALUES (150, 2, 2, 'app', 'user&app@cd9c2b90f803354e2735851b94633e10', 'user&app@d3cb01ae7baa66cefb7a2e10a62e7102', 0, 1, '2018-11-21 09:12:37', '2018-11-21 09:12:37');
INSERT INTO `work_user_tokens` VALUES (151, 17, 17, 'applet', 'user&applet@d53faacb2f56a3724804783ec41a23e8', 'user&applet@c84d63942cb456a40d7988c3b4dcdaf0', 0, 1, '2018-11-21 10:01:16', '2018-11-21 10:01:16');
INSERT INTO `work_user_tokens` VALUES (314, 15, 15, 'wap', 'user&wap@c3885f85a88fb3bb0d54bc9d2b4422d4', 'user&wap@376a8f78e6f023d342464616c3ec6b4b', 7200, 1, '2018-12-03 14:34:34', '2018-12-04 09:39:06');
INSERT INTO `work_user_tokens` VALUES (154, 2, 2, 'wap', 'user&wap@fbf78526519c32b94abc6809d8d69cfb', 'user&wap@11852b3ca70b1c3f8bc4045aa23add8f', 7200, 1, '2018-11-21 15:45:16', '2018-11-21 15:45:16');
INSERT INTO `work_user_tokens` VALUES (155, 15, 15, 'applet', 'user&applet@72e85bd6a8a7452ce40e7121775ac218', 'user&applet@cebc45ee712854d83987a7b344f5e913', 0, 1, '2018-11-22 10:06:59', '2018-11-22 10:06:59');
INSERT INTO `work_user_tokens` VALUES (212, 15, 15, 'wap', 'user&wap@660c911d7ece7c7f775d517b235785c7', 'user&wap@cd5b59f1cddbf98341785b10317ec444', 7200, 1, '2018-11-23 10:15:07', '2018-11-23 10:15:07');
INSERT INTO `work_user_tokens` VALUES (157, 35, 35, 'applet', 'user&applet@97b39bf4c1ae5d18ff5cf20aba854e10', 'user&applet@e7a9ba1556559c4c5fffb62194dc5276', 0, 1, '2018-11-22 10:18:03', '2018-11-22 10:18:03');
INSERT INTO `work_user_tokens` VALUES (158, 15, 15, 'applet', 'user&applet@e88d42443dc03211cc2ddfa61e85a00f', 'user&applet@9410d3bb697d03b63f73b5768c363209', 0, 1, '2018-11-22 10:25:31', '2018-11-22 10:25:31');
INSERT INTO `work_user_tokens` VALUES (159, 15, 15, 'applet', 'user&applet@a7a83a60f00d17dd463c3ee2b1830250', 'user&applet@2f90a6f269da3ef5c8cc2f360d9ddd50', 0, 1, '2018-11-22 11:54:11', '2018-11-22 11:54:11');
INSERT INTO `work_user_tokens` VALUES (160, 13, 13, 'applet', 'user&applet@d909902903e8b1c103afdcadbc7b6cd5', 'user&applet@a3ef7ac88f9e0112962a55c8c2762e57', 0, 1, '2018-11-22 12:42:46', '2018-11-22 12:42:46');
INSERT INTO `work_user_tokens` VALUES (161, 15, 15, 'applet', 'user&applet@5a93231520d2a88f31fb3d6957f4d8c2', 'user&applet@d89a72cb4e653ed0b86044e30c8eebe8', 0, 1, '2018-11-22 16:12:11', '2018-11-22 16:12:11');
INSERT INTO `work_user_tokens` VALUES (162, 15, 15, 'applet', 'user&applet@e9ae575b1a8d93f1abb129fe1f0b6950', 'user&applet@6234745b00f80beaf3c1d212ea70c28e', 0, 1, '2018-11-22 16:12:21', '2018-11-22 16:12:21');
INSERT INTO `work_user_tokens` VALUES (163, 15, 15, 'applet', 'user&applet@683122e19b3665de08586bf4a89520c3', 'user&applet@d35887082183e0d7a3e7ccd03205b303', 0, 1, '2018-11-22 16:12:31', '2018-11-22 16:12:31');
INSERT INTO `work_user_tokens` VALUES (164, 15, 15, 'applet', 'user&applet@4977d9dff4146c750bd85f2dfdd7ee36', 'user&applet@39c1d2896b8b21435132507084a0304c', 0, 1, '2018-11-22 16:14:17', '2018-11-22 16:14:17');
INSERT INTO `work_user_tokens` VALUES (165, 15, 15, 'applet', 'user&applet@4216d8b0a2e14f131d56a7798ef2ccc2', 'user&applet@056c16da23f15b5c3ee0371a96bdac57', 0, 1, '2018-11-22 16:14:24', '2018-11-22 16:14:24');
INSERT INTO `work_user_tokens` VALUES (166, 15, 15, 'applet', 'user&applet@cdb34af8846149ca31bce85f585638e9', 'user&applet@a4fdf9702a0025e980fb329e9e38121e', 0, 1, '2018-11-22 16:14:32', '2018-11-22 16:14:32');
INSERT INTO `work_user_tokens` VALUES (167, 15, 15, 'applet', 'user&applet@cda7c89a1928c9d96f2697a049267322', 'user&applet@716307fd56766e5292a4229fbf395e15', 0, 1, '2018-11-22 16:14:45', '2018-11-22 16:14:45');
INSERT INTO `work_user_tokens` VALUES (168, 15, 15, 'applet', 'user&applet@a81feb9f693e9c8b6616d7e0e0ae820b', 'user&applet@ea48bb9e11dc12ded6260f4435274a76', 0, 1, '2018-11-22 16:14:54', '2018-11-22 16:14:54');
INSERT INTO `work_user_tokens` VALUES (169, 15, 15, 'applet', 'user&applet@c3eb73b33769727462a8f081d3849022', 'user&applet@a3e5bdb65d2c9aece06b6d7279905e3b', 0, 1, '2018-11-22 16:15:13', '2018-11-22 16:15:13');
INSERT INTO `work_user_tokens` VALUES (170, 15, 15, 'applet', 'user&applet@69af1e5feb41545013535f6cc138c473', 'user&applet@e49bc2a75a41620b69d9c3bc7b48d0ce', 0, 1, '2018-11-22 16:15:57', '2018-11-22 16:15:57');
INSERT INTO `work_user_tokens` VALUES (171, 15, 15, 'applet', 'user&applet@07528f0452c6b2eec3021ef4c0cb25eb', 'user&applet@43768d289a3051a0e80209fb31ba81a3', 0, 1, '2018-11-22 16:16:06', '2018-11-22 16:16:06');
INSERT INTO `work_user_tokens` VALUES (172, 15, 15, 'applet', 'user&applet@920298d562ebc9149bd52699e56b156b', 'user&applet@8a4d13a7be50d8721a2a11e8a704904d', 0, 1, '2018-11-22 16:16:16', '2018-11-22 16:16:16');
INSERT INTO `work_user_tokens` VALUES (173, 15, 15, 'applet', 'user&applet@d96345c6871d59e569419d42956c9aaf', 'user&applet@0368b367e0671f989897fbdfdce12a5d', 0, 1, '2018-11-22 16:17:16', '2018-11-22 16:17:16');
INSERT INTO `work_user_tokens` VALUES (174, 15, 15, 'applet', 'user&applet@0f7e534297be0c96a6098480726e88c5', 'user&applet@cf6eda83cc5064493849ec6d0c964625', 0, 1, '2018-11-22 16:19:11', '2018-11-22 16:19:11');
INSERT INTO `work_user_tokens` VALUES (175, 15, 15, 'applet', 'user&applet@990754b019cc78c7a7255eddf4a12d24', 'user&applet@900147da5db058f4ad83dd75bbcfc5d2', 0, 1, '2018-11-22 16:19:19', '2018-11-22 16:19:19');
INSERT INTO `work_user_tokens` VALUES (176, 15, 15, 'applet', 'user&applet@e2d3d8199718ebe96ec233a997d8ee88', 'user&applet@262cbd54921bad9988c27a510178ab34', 0, 1, '2018-11-22 16:19:33', '2018-11-22 16:19:33');
INSERT INTO `work_user_tokens` VALUES (177, 15, 15, 'applet', 'user&applet@bb4ba4ea892a3c75d60bece02bc1f42f', 'user&applet@e37b984ff53223f6495e6d3353633466', 0, 1, '2018-11-22 16:20:09', '2018-11-22 16:20:09');
INSERT INTO `work_user_tokens` VALUES (178, 15, 15, 'applet', 'user&applet@734a0c9e86218a8adf72b48d74c27d03', 'user&applet@b91f6839c27f1c139b109b09d1ec9419', 0, 1, '2018-11-22 16:20:16', '2018-11-22 16:20:16');
INSERT INTO `work_user_tokens` VALUES (179, 17, 17, 'applet', 'user&applet@57a072ce525dedc8027744c24fe5b4c8', 'user&applet@250e0a32b8cfcca23822f81c468c2501', 0, 1, '2018-11-22 16:28:14', '2018-11-22 16:28:14');
INSERT INTO `work_user_tokens` VALUES (180, 17, 17, 'applet', 'user&applet@ca066701140814fd573604045046d464', 'user&applet@decc51ad051d66887a22d71d03cb90f6', 0, 1, '2018-11-22 16:28:27', '2018-11-22 16:28:27');
INSERT INTO `work_user_tokens` VALUES (181, 17, 17, 'applet', 'user&applet@ba84bd820078c3bb44d579fe594e3f7c', 'user&applet@f513e40dd465c55514c830b5589a4728', 0, 1, '2018-11-22 16:28:46', '2018-11-22 16:28:46');
INSERT INTO `work_user_tokens` VALUES (182, 17, 17, 'applet', 'user&applet@100269d9e2658bf6bcce9db4aec22796', 'user&applet@6622b314497d9db8c9f098617cbfc981', 0, 1, '2018-11-22 16:29:11', '2018-11-22 16:29:11');
INSERT INTO `work_user_tokens` VALUES (183, 17, 17, 'applet', 'user&applet@7f888478528156e184c4ca9b4d0bb434', 'user&applet@ebf1e5663b2dd97aaeae9fb550b6f632', 0, 1, '2018-11-22 16:29:21', '2018-11-22 16:29:21');
INSERT INTO `work_user_tokens` VALUES (184, 17, 17, 'applet', 'user&applet@0d0cf4223f5680d2a9a9ab5c3db36933', 'user&applet@a1f7252288f5afa1d12eef44054df85b', 0, 1, '2018-11-22 16:29:45', '2018-11-22 16:29:45');
INSERT INTO `work_user_tokens` VALUES (185, 17, 17, 'applet', 'user&applet@a172d48869a579d4bf3916b01dd51f48', 'user&applet@35cafa4b601515a7ec1cc3a8ffbd9114', 0, 1, '2018-11-22 16:30:04', '2018-11-22 16:30:04');
INSERT INTO `work_user_tokens` VALUES (186, 17, 17, 'applet', 'user&applet@3170019e054a731ac5c649c11524514c', 'user&applet@9d71868b4540685ab7ac60e57627f146', 0, 1, '2018-11-22 16:30:39', '2018-11-22 16:30:39');
INSERT INTO `work_user_tokens` VALUES (187, 17, 17, 'applet', 'user&applet@35558c61acd417c316be64f115130525', 'user&applet@f1b6a0348c16fe5097efbd4ba080bd8c', 0, 1, '2018-11-22 16:30:47', '2018-11-22 16:30:47');
INSERT INTO `work_user_tokens` VALUES (188, 32, 32, 'applet', 'user&applet@e834016358cbdc244d86d7309ca7b571', 'user&applet@a9860491e1ec3d190121a4dbc42f06c3', 0, 1, '2018-11-22 16:31:52', '2018-11-22 16:31:52');
INSERT INTO `work_user_tokens` VALUES (189, 17, 17, 'applet', 'user&applet@931f1ad7f74870b4ccef1310d4173eb7', 'user&applet@b2082c751de7a6771ae2d92c938d213c', 0, 1, '2018-11-22 16:32:01', '2018-11-22 16:32:01');
INSERT INTO `work_user_tokens` VALUES (190, 32, 32, 'applet', 'user&applet@eb9e309e6cf22a2b5c1efd0a9694deb5', 'user&applet@99658438b9822bda2c00fc2d0aeebbe2', 0, 1, '2018-11-22 16:32:08', '2018-11-22 16:32:08');
INSERT INTO `work_user_tokens` VALUES (191, 17, 17, 'applet', 'user&applet@8438b230e98a8370832a3d7381fa8cd8', 'user&applet@cca00324bc5a3c9fc8c4ed6fa86914e5', 0, 1, '2018-11-22 16:32:15', '2018-11-22 16:32:15');
INSERT INTO `work_user_tokens` VALUES (192, 17, 17, 'applet', 'user&applet@121ed0073da04cd29564c5140a0a01c9', 'user&applet@28eb8840c3462e44e411ca3788efc43f', 0, 1, '2018-11-22 16:32:42', '2018-11-22 16:32:42');
INSERT INTO `work_user_tokens` VALUES (193, 32, 32, 'applet', 'user&applet@b4104d916d92ef78af2cc66f98417101', 'user&applet@4a2259dd64cf03f2f50f52be2d2c9519', 0, 1, '2018-11-22 16:33:52', '2018-11-22 16:33:52');
INSERT INTO `work_user_tokens` VALUES (194, 32, 32, 'applet', 'user&applet@a7887c6239742d83369f95fdf119e9c4', 'user&applet@80b740d0c0c01dcee3db401c104db353', 0, 1, '2018-11-22 16:34:23', '2018-11-22 16:34:23');
INSERT INTO `work_user_tokens` VALUES (195, 1, 1, 'app', 'user&app@61f8c2fa77cf375d6df590913fe6f65f', 'user&app@1e6d850df172da1a39cead71611b2d3c', 0, 1, '2018-11-22 16:35:29', '2018-11-22 16:35:29');
INSERT INTO `work_user_tokens` VALUES (196, 1, 1, 'applet', 'user&applet@3c281721de85d20f4379ce854c082a00', 'user&applet@cf4c0780d931b331e88103d7d6f34d57', 0, 1, '2018-11-22 16:35:50', '2018-11-22 16:35:50');
INSERT INTO `work_user_tokens` VALUES (197, 1, 1, 'applet', 'user&applet@49fb3177325eadfa4c91d2cd34a621e9', 'user&applet@09eef49d1e01b6316fe373f320a70436', 0, 1, '2018-11-22 16:36:37', '2018-11-22 16:36:37');
INSERT INTO `work_user_tokens` VALUES (198, 1, 1, 'applet', 'user&applet@1e5f4ad1f47cdd89da40157971141209', 'user&applet@e6a3f4690175110956d5fb694dd5f166', 0, 1, '2018-11-22 16:36:46', '2018-11-22 16:36:46');
INSERT INTO `work_user_tokens` VALUES (199, 1, 1, 'applet', 'user&applet@8a182d0781a14cb0f0e9b6d3502b65c1', 'user&applet@aa50d8c6530653308d4ed3eb06943724', 0, 1, '2018-11-22 16:37:15', '2018-11-22 16:37:15');
INSERT INTO `work_user_tokens` VALUES (200, 1, 1, 'applet', 'user&applet@1dcd96a809f78eed4b746da4f8d630e1', 'user&applet@aa76fa8d9eaa79be30c572e439c492fb', 0, 1, '2018-11-22 16:37:48', '2018-11-22 16:37:48');
INSERT INTO `work_user_tokens` VALUES (201, 1, 1, 'applet', 'user&applet@f4e6a77bef660bcd2c6990abe8ec9041', 'user&applet@a1e3a159546f0e54f1711129504e9f66', 0, 1, '2018-11-22 16:37:58', '2018-11-22 16:37:58');
INSERT INTO `work_user_tokens` VALUES (202, 17, 17, 'applet', 'user&applet@eafde74bc5c023088269dde2244a2039', 'user&applet@0dc4367584273513dfb78e469afa44c4', 0, 1, '2018-11-22 16:39:18', '2018-11-22 16:39:18');
INSERT INTO `work_user_tokens` VALUES (203, 15, 15, 'applet', 'user&applet@0ce8622a3467f171aefc878ce7a302ab', 'user&applet@2bac98f4a3fb664139a07c387634d243', 0, 1, '2018-11-22 16:40:23', '2018-11-22 16:40:23');
INSERT INTO `work_user_tokens` VALUES (204, 4, 4, 'applet', 'user&applet@1ce524d440c66e7a08eb87be32a1c187', 'user&applet@eb75621d6e044f6b3913fcb92e4a23cb', 0, 1, '2018-11-22 16:40:41', '2018-11-22 16:40:41');
INSERT INTO `work_user_tokens` VALUES (205, 4, 4, 'applet', 'user&applet@24d270cc7f03e1629f07668f699e784e', 'user&applet@a049ee11cc09f4fa3ee08d82019f3d1e', 0, 1, '2018-11-22 16:41:11', '2018-11-22 16:41:11');
INSERT INTO `work_user_tokens` VALUES (206, 4, 4, 'applet', 'user&applet@5cf3dbe4eb38eca1dc21c4b51b9c4106', 'user&applet@5e4818c7cd0e6af97e224f5208c8023c', 0, 1, '2018-11-22 16:41:33', '2018-11-22 16:41:33');
INSERT INTO `work_user_tokens` VALUES (207, 4, 4, 'applet', 'user&applet@473c5cfcffc9d7c5017d56b10e6c010e', 'user&applet@6f2045d3e491116c5b708ebb025cbf22', 0, 1, '2018-11-22 16:42:23', '2018-11-22 16:42:23');
INSERT INTO `work_user_tokens` VALUES (208, 4, 4, 'applet', 'user&applet@3f01855fb0d9f916182ea1f0d34f3582', 'user&applet@55d59ba4549a5c8d7dd10d322c05681d', 0, 1, '2018-11-22 16:43:01', '2018-11-22 16:43:01');
INSERT INTO `work_user_tokens` VALUES (209, 4, 4, 'applet', 'user&applet@602ec6c47c785387c1c79433d27e8b6c', 'user&applet@75ff88191b672ab7df5b4af0bb49e7fa', 0, 1, '2018-11-22 16:43:52', '2018-11-22 16:43:52');
INSERT INTO `work_user_tokens` VALUES (210, 15, 15, 'applet', 'user&applet@eecb454460c4843aea41f9f151178f9b', 'user&applet@3876e24b935e95f067f0407abf2e1ce0', 0, 1, '2018-11-23 09:45:06', '2018-11-23 09:45:06');
INSERT INTO `work_user_tokens` VALUES (211, 15, 15, 'applet', 'user&applet@7ffe60d2e07fa7cbae968ba72500e268', 'user&applet@13a6a89263e79db4d6e579ae62991244', 0, 1, '2018-11-23 09:52:26', '2018-11-23 09:52:26');
INSERT INTO `work_user_tokens` VALUES (214, 15, 15, 'applet', 'user&applet@7b8453cc6d81422d6d01e6d29de2f0cd', 'user&applet@fe75db229ae16d610864cf419b672696', 0, 1, '2018-11-23 11:22:47', '2018-11-23 11:22:47');
INSERT INTO `work_user_tokens` VALUES (216, 15, 15, 'wap', 'user&wap@8c69c97258c428776366fa89f25f34a0', 'user&wap@0aef5bdbe71ca7b846b3a1195d535958', 7200, 1, '2018-11-23 11:42:54', '2018-11-23 11:42:54');
INSERT INTO `work_user_tokens` VALUES (217, 2, 2, 'wechat', 'user&wechat@884b50fdbb3bb838eaae564abfa05e66', 'user&wechat@5f208f87d63a1b369863f94dfbe54542', 7200, 1, '2018-11-23 11:45:20', '2018-11-24 19:53:20');
INSERT INTO `work_user_tokens` VALUES (233, 4, 4, 'wap', 'user&wap@3899f1d1462affc3bf9c6084d7841abd', 'user&wap@87b6b015644bc183ee0a4af0cdc54c74', 7200, 1, '2018-11-24 13:45:49', '2018-11-24 13:45:49');
INSERT INTO `work_user_tokens` VALUES (219, 15, 15, 'applet', 'user&applet@52dcc8fd1948f5bc55641f1a2335a7ea', 'user&applet@3f0b9b263c593d9135c7160ca0236cf6', 0, 1, '2018-11-23 12:06:13', '2018-11-23 12:06:13');
INSERT INTO `work_user_tokens` VALUES (220, 15, 15, 'applet', 'user&applet@218ec5b3f4de519063006be4a145fce3', 'user&applet@cf7f89fe90e2aa241e05cd2e18f82bcc', 0, 1, '2018-11-23 12:06:36', '2018-11-23 12:06:36');
INSERT INTO `work_user_tokens` VALUES (222, 2, 2, 'applet', 'user&applet@8a06c550ecac8748263495876aa081d0', 'user&applet@d396513deda52867f28a0e46599256b6', 0, 1, '2018-11-23 16:02:22', '2018-11-23 16:02:22');
INSERT INTO `work_user_tokens` VALUES (309, 15, 15, 'wap', 'user&wap@6c014f20b286b05f969dd97c04918d28', 'user&wap@7e808ca8ec038a903755e5cc79f2b4b4', 7200, 1, '2018-12-03 11:17:09', '2018-12-03 11:17:09');
INSERT INTO `work_user_tokens` VALUES (224, 15, 15, 'applet', 'user&applet@51f36ba733759d7535ddff999a2ef699', 'user&applet@ec1a923789096cc908baa04e9832f905', 0, 1, '2018-11-24 11:01:28', '2018-11-24 11:01:28');
INSERT INTO `work_user_tokens` VALUES (225, 15, 15, 'applet', 'user&applet@f80eafd92676d41497de848be408a599', 'user&applet@692c657f95123a91c24f93f4b26eebea', 0, 1, '2018-11-24 11:01:36', '2018-11-24 11:01:36');
INSERT INTO `work_user_tokens` VALUES (226, 15, 15, 'applet', 'user&applet@5800694b858bec0cf5cbb4bcba6fd665', 'user&applet@3d46ed2613ab4318f5403c0d78f6c258', 0, 1, '2018-11-24 11:24:33', '2018-11-24 11:24:33');
INSERT INTO `work_user_tokens` VALUES (227, 15, 15, 'applet', 'user&applet@0035e87e74d6c3f17dc1fe84aa6d767d', 'user&applet@d9c850c99a1b0dedd5bdc350077d3a0a', 0, 1, '2018-11-24 11:24:39', '2018-11-24 11:24:39');
INSERT INTO `work_user_tokens` VALUES (228, 15, 15, 'applet', 'user&applet@3c9eff1e0a18651b7492431642fb4709', 'user&applet@6aa9c8d7d38fdeb980a209cf4d9d0a6a', 0, 1, '2018-11-24 11:25:13', '2018-11-24 11:25:13');
INSERT INTO `work_user_tokens` VALUES (229, 15, 15, 'applet', 'user&applet@a2ae694a0956444d9001314f2c878147', 'user&applet@bc07689430a044d3156fb7fe55b96801', 0, 1, '2018-11-24 11:25:22', '2018-11-24 11:25:22');
INSERT INTO `work_user_tokens` VALUES (230, 15, 15, 'applet', 'user&applet@04485d5d3ebc0aba1860ad417bc9cda2', 'user&applet@44601e70381201979685d7a9a259585c', 0, 1, '2018-11-24 11:25:38', '2018-11-24 11:25:38');
INSERT INTO `work_user_tokens` VALUES (231, 15, 15, 'applet', 'user&applet@32830bf0f1ab74479150b9574b13aca1', 'user&applet@4586e66f841047eb17ad26ec2f036751', 0, 1, '2018-11-24 11:25:48', '2018-11-24 11:25:48');
INSERT INTO `work_user_tokens` VALUES (232, 15, 15, 'applet', 'user&applet@691dd6c4f29c6690b97ff14059e73cbe', 'user&applet@2eca71fc7d04b4fecbc725fb8dc21d10', 0, 1, '2018-11-24 11:26:10', '2018-11-24 11:26:10');
INSERT INTO `work_user_tokens` VALUES (234, 36, 36, 'applet', 'user&applet@c4f29194752ce299c6e6a5c6be9e71f3', 'user&applet@19edbdf506cf7ad12e3eeb9090189340', 0, 1, '2018-11-24 14:10:01', '2018-11-24 14:10:01');
INSERT INTO `work_user_tokens` VALUES (235, 15, 15, 'wechat', 'user&wechat@c56aad30fa6fec395dbd9d9874f72b5c', 'user&wechat@28e78c1b6cf322a44e2bd9ad7491ca26', 7200, 1, '2018-11-24 14:48:39', '2018-11-24 14:48:39');
INSERT INTO `work_user_tokens` VALUES (236, 15, 15, 'wap', 'user&wap@dfefa6cbb2a8de3752d26a7ace3e835d', 'user&wap@81455e835ba8abe4f46f4b285888457f', 7200, 1, '2018-11-24 14:56:05', '2018-11-24 14:56:05');
INSERT INTO `work_user_tokens` VALUES (284, 44, 44, 'wap', 'user&wap@ef17101e96dcac71b52cba8c5afc0bf8', 'user&wap@81e777aa8cf284e7ca05f99387f36699', 7200, 1, '2018-11-28 15:28:58', '2018-11-28 17:29:53');
INSERT INTO `work_user_tokens` VALUES (238, 15, 15, 'wap', 'user&wap@d9d44d102549ad280c15e628473b0540', 'user&wap@b07ef78fe6adc67d6291d2eb9a784508', 7200, 1, '2018-11-24 15:20:20', '2018-11-24 15:20:20');
INSERT INTO `work_user_tokens` VALUES (239, 4, 4, 'applet', 'user&applet@7106cb01ab2094c4c5a8345cc141f7fc', 'user&applet@74f06ad6728b5ea447a1b841cebae69b', 0, 1, '2018-11-24 15:22:18', '2018-11-24 15:22:18');
INSERT INTO `work_user_tokens` VALUES (261, 7, 7, 'wap', 'user&wap@fc3d8c99f72fbdadfeac4f3ac51d262e', 'user&wap@95716c3c4397c6858c2209ecd14e12a2', 7200, 1, '2018-11-26 16:11:38', '2018-11-26 16:11:38');
INSERT INTO `work_user_tokens` VALUES (243, 7, 7, 'wap', 'user&wap@9f662d2bf383fd409271c3db353d4c9d', 'user&wap@c59bc2bac9f7a02e62f2b72debc267e4', 7200, 1, '2018-11-24 16:16:40', '2018-11-24 16:16:40');
INSERT INTO `work_user_tokens` VALUES (359, 56, 56, 'applet', 'user&applet@0a2af05a9c544f71825fabc7cecfc986', 'user&applet@f45487a2dbd6e2e81cda7ad914e2df26', 0, 1, '2018-12-05 09:51:56', '2018-12-05 09:51:56');
INSERT INTO `work_user_tokens` VALUES (246, 7, 7, 'wap', 'user&wap@6f5b2279b73994a82450d8b591d33c46', 'user&wap@eb19a7f6a62f2f395d9380e26789e544', 7200, 1, '2018-11-24 17:13:40', '2018-11-24 17:13:40');
INSERT INTO `work_user_tokens` VALUES (247, 2, 2, 'wechat', 'user&wechat@164c38fd73a405993dfd80345db5c37a', 'user&wechat@efd1e0e9b08ffdde03bc6951e88283f1', 7200, 1, '2018-11-24 19:53:56', '2018-11-24 19:53:56');
INSERT INTO `work_user_tokens` VALUES (250, 2, 2, 'wechat', 'user&wechat@3655084f769974f031b166de3f4d4dcf', 'user&wechat@df55dd52bb051536241e342de0aa69d5', 7200, 1, '2018-11-26 09:24:29', '2018-11-26 09:24:29');
INSERT INTO `work_user_tokens` VALUES (249, 2, 2, 'wap', 'user&wap@0d8a82f800d9f1adb81ecd7405a99c6c', 'user&wap@d3057c2a9158c231315cee835e4a7f21', 7200, 1, '2018-11-26 09:19:13', '2018-11-26 09:19:13');
INSERT INTO `work_user_tokens` VALUES (251, 37, 37, 'app', 'user&app@bd37655f7066c20b8dbdb76ec6bc10aa', 'user&app@b83d325a5c87c60228081640a50023cb', 0, 1, '2018-11-26 09:32:37', '2018-11-26 09:32:37');
INSERT INTO `work_user_tokens` VALUES (252, 2, 2, 'app', 'user&app@4c700d07c48124a54182de1ab72e49e7', 'user&app@338d5a4c284f3cc1e699376399e4afc7', 0, 1, '2018-11-26 09:34:51', '2018-11-26 09:34:51');
INSERT INTO `work_user_tokens` VALUES (253, 2, 2, 'applet', 'user&applet@74dae3a1af697bd3fdddae483c8e250b', 'user&applet@88ecc68636a4f82d355e018c5dfbb2b2', 0, 1, '2018-11-26 09:48:53', '2018-11-26 09:48:53');
INSERT INTO `work_user_tokens` VALUES (254, 32, 32, 'applet', 'user&applet@19e386a05d58c9b43de2a65f0cfb048b', 'user&applet@64fb28bd8207d922d18290277fcd6aa5', 0, 1, '2018-11-26 09:50:16', '2018-11-26 09:50:16');
INSERT INTO `work_user_tokens` VALUES (255, 32, 32, 'wechat', 'user&wechat@0fde6c26b46e71157ecd30e3f76d3524', 'user&wechat@7160ada24d1528c4254ad119a1af302a', 7200, 1, '2018-11-26 09:55:47', '2018-11-26 09:55:47');
INSERT INTO `work_user_tokens` VALUES (256, 32, 32, 'applet', 'user&applet@62fc04b4aba2bab0a3fdfc77cac5a438', 'user&applet@c1352cfeddc865d0ad3f027ae3982450', 0, 1, '2018-11-26 09:57:16', '2018-11-26 09:57:16');
INSERT INTO `work_user_tokens` VALUES (257, 32, 32, 'applet', 'user&applet@b932474dae8aa4cfc0605c1db8286103', 'user&applet@ab82930b3d9c2cb2ce30f10cf179d212', 0, 1, '2018-11-26 09:57:31', '2018-11-26 09:57:31');
INSERT INTO `work_user_tokens` VALUES (258, 2, 2, 'applet', 'user&applet@db0bf06d8f1807886e5bc3d6d6347454', 'user&applet@2320ad31586efd39dda157d508719250', 0, 1, '2018-11-26 10:04:57', '2018-11-26 10:04:57');
INSERT INTO `work_user_tokens` VALUES (259, 2, 2, 'wechat', 'user&wechat@1fc051e42ada076529b6c834b496b5a0', 'user&wechat@9501bdb3d0d795525e1aff6d8f74f8c7', 7200, 1, '2018-11-26 10:07:21', '2018-11-26 14:14:35');
INSERT INTO `work_user_tokens` VALUES (260, 17, 17, 'app', 'user&app@7a1378eacb8e6b4e456bdcb77406d5f0', 'user&app@a90040ee7e2d0553e021c693d1eb8604', 0, 1, '2018-11-26 15:43:42', '2018-11-26 15:43:42');
INSERT INTO `work_user_tokens` VALUES (262, 24, 24, 'app', 'user&app@fd8cc1383cf02f7a15587ff9701e520b', 'user&app@5bd0a31983f8cfbec7306a4a27ac776b', 0, 1, '2018-11-26 16:17:42', '2018-11-26 16:17:42');
INSERT INTO `work_user_tokens` VALUES (263, 38, 38, 'app', 'user&app@b04c0973977e7825f5dda71a9fb57f5a', 'user&app@28d8d66eee0289566eddc87a6f0909d3', 0, 1, '2018-11-26 16:18:07', '2018-11-26 16:18:07');
INSERT INTO `work_user_tokens` VALUES (265, 36, 36, 'wechat', 'user&wechat@53d3e20e565c1a1419845e1c46632798', 'user&wechat@8c9a088203bd1465d846c4ccc1c4b79c', 7200, 1, '2018-11-26 17:59:07', '2018-11-27 10:20:57');
INSERT INTO `work_user_tokens` VALUES (266, 39, 39, 'applet', 'user&applet@05908b6cd08bd60082be28f47a29a5e0', 'user&applet@b3bbd81a61c161f57d658f85af5de15b', 0, 1, '2018-11-26 19:23:04', '2018-11-26 19:23:04');
INSERT INTO `work_user_tokens` VALUES (267, 40, 40, 'wechat', 'user&wechat@8dd3626ec2b3a5e065e84a3a929cfc5c', 'user&wechat@288ffc363269290509626d3073f31d0a', 7200, 1, '2018-11-27 10:22:03', '2018-11-27 10:22:03');
INSERT INTO `work_user_tokens` VALUES (268, 41, 41, 'wechat', 'user&wechat@536ba13d6b6994bf41292294b7daa4d3', 'user&wechat@41fac46a58b2c88a20d40f9a847921e6', 7200, 1, '2018-11-27 10:22:47', '2018-11-27 10:22:47');
INSERT INTO `work_user_tokens` VALUES (269, 40, 40, 'wechat', 'user&wechat@d10f757b44944a4df85011f5c1d204aa', 'user&wechat@428a51943f3029f503797dd2299024ad', 7200, 1, '2018-11-27 10:23:26', '2018-11-28 10:00:51');
INSERT INTO `work_user_tokens` VALUES (270, 42, 42, 'app', 'user&app@81f259624f835e68e7426d73ab19b039', 'user&app@dfd8dfd1d200b570a62d1f7abd1322f5', 0, 1, '2018-11-27 14:30:19', '2018-11-27 14:30:19');
INSERT INTO `work_user_tokens` VALUES (271, 6, 6, 'applet', 'user&applet@c2ef273e555fb2f761375b51afca089b', 'user&applet@509c3c7dfefccd973e617076fd44d700', 0, 1, '2018-11-27 15:19:39', '2018-11-27 15:19:39');
INSERT INTO `work_user_tokens` VALUES (272, 4, 4, 'app', 'user&app@2c12acd3e0cda9aa3949a83910afeb80', 'user&app@b60081dc493970530aad6de02e87d403', 0, 1, '2018-11-27 15:49:02', '2018-11-27 15:49:02');
INSERT INTO `work_user_tokens` VALUES (273, 43, 43, 'applet', 'user&applet@e5f51645ad06a285241d5de9eaca8a4c', 'user&applet@59f8036fb57f78fd2ccae0a2ac21072f', 0, 1, '2018-11-27 18:26:57', '2018-11-27 18:26:57');
INSERT INTO `work_user_tokens` VALUES (275, 4, 4, 'applet', 'user&applet@33afe557c901ab17bcdfbda6c7a8b7ae', 'user&applet@951a3978d533cfb948aa2e357c9a1ad7', 0, 1, '2018-11-28 11:54:23', '2018-11-28 11:54:23');
INSERT INTO `work_user_tokens` VALUES (276, 17, 17, 'wechat', 'user&wechat@22745266595b137971945569a9f4361a', 'user&wechat@fa94b1d94fdc19b9b24777718fbcc073', 7200, 1, '2018-11-28 11:57:15', '2018-11-28 11:57:15');
INSERT INTO `work_user_tokens` VALUES (277, 17, 17, 'app', 'user&app@210a6f3bedd628214d38e787a52be041', 'user&app@d26e06fcf668dae4e2b708a8c9f11d55', 0, 1, '2018-11-28 14:04:08', '2018-11-28 14:04:08');
INSERT INTO `work_user_tokens` VALUES (278, 4, 4, 'app', 'user&app@33c9a7dc2c1c04b5f6bab3c137587682', 'user&app@2c31a860c7c1e38f5fbd6e49f47a99ad', 0, 1, '2018-11-28 14:05:03', '2018-11-28 14:05:03');
INSERT INTO `work_user_tokens` VALUES (279, 4, 4, 'app', 'user&app@990bac185e02afcfcda3a8a97a09d336', 'user&app@4d98b5a099016dbbb81857149fd09fc1', 0, 1, '2018-11-28 14:05:30', '2018-11-28 14:05:30');
INSERT INTO `work_user_tokens` VALUES (280, 4, 4, 'app', 'user&app@2625a7636fe4260ae6a362e205363c70', 'user&app@3bb97820979b89fe09a551c71abf04be', 0, 1, '2018-11-28 14:49:17', '2018-11-28 14:49:17');
INSERT INTO `work_user_tokens` VALUES (281, 17, 17, 'wechat', 'user&wechat@c08c3b022db2eafee7e2681c2c8a50a4', 'user&wechat@ed09cea920e13b043b6d8fd1b9f7a4ab', 7200, 1, '2018-11-28 15:07:53', '2018-11-28 15:07:53');
INSERT INTO `work_user_tokens` VALUES (282, 4, 4, 'app', 'user&app@25273054d739e16a4d34212f2b4c01a1', 'user&app@be113e4bed63b78d74091a195ff059e6', 0, 1, '2018-11-28 15:12:10', '2018-11-28 15:12:10');
INSERT INTO `work_user_tokens` VALUES (283, 4, 4, 'app', 'user&app@ce58140da330ed87b51fe80a4a0639c4', 'user&app@fe2ad09c3564f1dda59ad740896f49ae', 0, 1, '2018-11-28 15:12:18', '2018-11-28 15:12:18');
INSERT INTO `work_user_tokens` VALUES (285, 45, 45, 'applet', 'user&applet@4f4f6a7aa07f23330ef1fc51a2337181', 'user&applet@4ca7e6599ad0d894fb9c20d2b240c201', 0, 1, '2018-11-28 17:35:38', '2018-11-28 17:35:38');
INSERT INTO `work_user_tokens` VALUES (286, 4, 4, 'wap', 'user&wap@dd5a120c30bdb78151fbaf01ce713879', 'user&wap@ca93512c7a9c146b780bb321582fe310', 7200, 1, '2018-11-28 17:35:57', '2018-11-28 17:35:57');
INSERT INTO `work_user_tokens` VALUES (308, 44, 44, 'wap', 'user&wap@af9ffa39e3a4686e5472cfe70fedd55c', 'user&wap@b0cd0771ce0358e329ced012c0dacb7b', 7200, 1, '2018-12-03 09:39:49', '2018-12-03 16:32:15');
INSERT INTO `work_user_tokens` VALUES (288, 13, 13, 'applet', 'user&applet@ac1e8da93166830d82ee125614ff5f7b', 'user&applet@089a0768c93c0871d9342db6e240f1a3', 0, 1, '2018-11-29 12:27:07', '2018-11-29 12:27:07');
INSERT INTO `work_user_tokens` VALUES (289, 17, 17, 'app', 'user&app@4a3d0ef7eee662be4810a1aa3a85a356', 'user&app@518ca0ec8edee9529c8e7d61f6bcd24f', 0, 1, '2018-11-29 15:30:09', '2018-11-29 15:30:09');
INSERT INTO `work_user_tokens` VALUES (290, 4, 4, 'app', 'user&app@8021d7f54d69b9e6dac9d3865f771fc7', 'user&app@cb951dee51231cf2342a75733fcd49c2', 0, 1, '2018-11-29 15:40:50', '2018-11-29 15:40:50');
INSERT INTO `work_user_tokens` VALUES (291, 2, 2, 'wap', 'user&wap@fe5d1ce07d47de5d392f4665a6bb235f', 'user&wap@f51562ccd4ee9d64bc07ee8943486288', 7200, 1, '2018-11-29 16:35:17', '2018-11-29 16:35:17');
INSERT INTO `work_user_tokens` VALUES (292, 46, 46, 'wechat', 'user&wechat@e3557fe8844aa178b143bbf13e9945f4', 'user&wechat@6e8a39b60b4e5f2f563896e736f959e1', 7200, 1, '2018-11-29 16:38:18', '2018-11-29 16:38:18');
INSERT INTO `work_user_tokens` VALUES (293, 2, 2, 'wechat', 'user&wechat@42cb6e451226e8ca928d1bd3e3396c53', 'user&wechat@7625f9ccc0636d6549d0301735b34f23', 7200, 1, '2018-11-29 16:42:14', '2018-11-29 16:42:14');
INSERT INTO `work_user_tokens` VALUES (294, 46, 46, 'wechat', 'user&wechat@5bde68e4000b5be03422c08639fbaef0', 'user&wechat@186e6db716dde4ac6daf5ac4deff96ca', 7200, 1, '2018-11-29 17:17:40', '2018-11-30 09:23:44');
INSERT INTO `work_user_tokens` VALUES (295, 2, 2, 'app', 'user&app@91b3426460eab8541543a7540bca8dd2', 'user&app@ae9c49d1c787391d11296bbffbcaef36', 0, 1, '2018-11-30 10:04:59', '2018-11-30 10:04:59');
INSERT INTO `work_user_tokens` VALUES (322, 2, 2, 'wechat', 'user&wechat@80ec841cbecf4aa3b1482b2509beab96', 'user&wechat@1153d040a08bcb5296bec6e5a729d728', 7200, 1, '2018-12-03 17:13:00', '2018-12-03 17:13:00');
INSERT INTO `work_user_tokens` VALUES (297, 13, 13, 'applet', 'user&applet@c14f3086d2bc05a850e6d25abbd56fc6', 'user&applet@55eba6b8c4a9b1db977309d9ae9277e7', 0, 1, '2018-11-30 10:23:15', '2018-11-30 10:23:15');
INSERT INTO `work_user_tokens` VALUES (298, 47, 47, 'app', 'user&app@77cbcbb2901a67cfb5ca551474e91754', 'user&app@333647df06d55c6446b4f5bee49460ef', 0, 1, '2018-11-30 11:28:49', '2018-11-30 11:28:49');
INSERT INTO `work_user_tokens` VALUES (299, 26, 26, 'applet', 'user&applet@6d08202433b639e8ac148eb68ffc547f', 'user&applet@51ba35e76a42d615d7254a5c95b97ca2', 0, 1, '2018-11-30 12:03:55', '2018-11-30 12:03:55');
INSERT INTO `work_user_tokens` VALUES (300, 13, 13, 'applet', 'user&applet@c20df77a8bda99b9d9fd2786e51d66fb', 'user&applet@0744b14238ccd9678632eae89172854f', 0, 1, '2018-11-30 14:36:16', '2018-11-30 14:36:16');
INSERT INTO `work_user_tokens` VALUES (302, 43, 43, 'pc', 'user&pc@11e7ca4d8180e720458f14a43e4a8a48', 'user&pc@40ec9fab896fbf7a9441c63afd343463', 7200, 1, '2018-12-01 11:12:44', '2018-12-01 11:12:44');
INSERT INTO `work_user_tokens` VALUES (303, 43, 43, 'app', 'user&app@1159958a9b857f704a8fd589133d7885', 'user&app@956938dc026526b09d35fb3aabf7379a', 0, 1, '2018-12-01 11:46:51', '2018-12-01 11:46:51');
INSERT INTO `work_user_tokens` VALUES (304, 19, 19, 'app', 'user&app@a66c89bf73e554ce999f5f307a09aace', 'user&app@b73575eb58448c9be758f2a831229bdb', 0, 1, '2018-12-01 11:46:57', '2018-12-01 11:46:57');
INSERT INTO `work_user_tokens` VALUES (305, 48, 48, 'app', 'user&app@8f69921a34781b1e62bc6e4971230cba', 'user&app@d2f3f52b39b52645226b1e6cd2148dc1', 0, 1, '2018-12-01 15:03:02', '2018-12-01 15:03:02');
INSERT INTO `work_user_tokens` VALUES (306, 2, 2, 'app', 'user&app@2e824baf0a1aa0ec133468292fdddd17', 'user&app@463d419b32ced49bbef88212bc2d0be0', 0, 1, '2018-12-01 15:09:19', '2018-12-01 15:09:19');
INSERT INTO `work_user_tokens` VALUES (307, 48, 48, 'pc', 'user&pc@38f43194c0f8441e1be3c4757c1ae649', 'user&pc@6202cce1ff029cacba781d488d605a3f', 7200, 1, '2018-12-03 09:02:34', '2018-12-03 09:02:34');
INSERT INTO `work_user_tokens` VALUES (310, 48, 48, 'pc', 'user&pc@418c5be81379bcc0d75588b8ddc0d729', 'user&pc@789ce1da4cfbbca0150c71912c4fd7fb', 7200, 1, '2018-12-03 11:47:02', '2018-12-03 11:47:02');
INSERT INTO `work_user_tokens` VALUES (311, 15, 15, 'app', 'user&app@b29192e016af8b46f77370dc7613052c', 'user&app@cd668f493a7271349aae4a60da400c86', 0, 1, '2018-12-03 12:08:38', '2018-12-03 12:08:38');
INSERT INTO `work_user_tokens` VALUES (312, 49, 49, 'applet', 'user&applet@8747403bcaf464ed11aa97bb2a3413a1', 'user&applet@61144a7111720c4a65abe725090b8b27', 0, 1, '2018-12-03 13:42:17', '2018-12-03 13:42:17');
INSERT INTO `work_user_tokens` VALUES (313, 49, 49, 'app', 'user&app@48ccd531d72362d3a5d8ebc5bffc8d89', 'user&app@611a1e4e515d0aafe07e2a3c6685cd77', 0, 1, '2018-12-03 13:47:34', '2018-12-03 13:47:34');
INSERT INTO `work_user_tokens` VALUES (315, 15, 15, 'wap', 'user&wap@3516f9be6c8575c77bb51e7e0ec0b9cc', 'user&wap@2d540443ecfe48438a305c8085f99c45', 7200, 1, '2018-12-03 14:36:09', '2018-12-04 09:59:29');
INSERT INTO `work_user_tokens` VALUES (316, 15, 15, 'wap', 'user&wap@4980ea5a8cc39dbfcd1485b71df31f36', 'user&wap@d7e53c16fb0ec39cabf634405196ba86', 7200, 1, '2018-12-03 14:38:10', '2018-12-03 20:31:02');
INSERT INTO `work_user_tokens` VALUES (317, 13, 13, 'applet', 'user&applet@42337a5da404cb1537ea41e9860e2aca', 'user&applet@841afd9e8d8ca4155f62981cee21f33b', 0, 1, '2018-12-03 14:39:59', '2018-12-03 14:39:59');
INSERT INTO `work_user_tokens` VALUES (318, 13, 13, 'applet', 'user&applet@ba4a0a282a7747be9c22cc5dbb2a2bfa', 'user&applet@3890fd7eb5e5d4a4d5b17aad8b096062', 0, 1, '2018-12-03 14:40:48', '2018-12-03 14:40:48');
INSERT INTO `work_user_tokens` VALUES (319, 13, 13, 'applet', 'user&applet@81c00aa526d259cdffe29510acb42ae0', 'user&applet@ebea9d2842331ccb418cf9e4b3d196f0', 0, 1, '2018-12-03 14:46:25', '2018-12-03 14:46:25');
INSERT INTO `work_user_tokens` VALUES (320, 4, 4, 'wechat', 'user&wechat@3ebb5d783d57343c7a65e343dac934ba', 'user&wechat@b64cfcfd940661e0b7528752403f71a4', 7200, 1, '2018-12-03 15:33:25', '2018-12-03 15:33:25');
INSERT INTO `work_user_tokens` VALUES (321, 2, 2, 'wap', 'user&wap@9d579eb399f2a478f539eed4981f34cc', 'user&wap@8e9faa42de53bcddd5a9d76e00f67ba5', 7200, 1, '2018-12-03 16:11:30', '2018-12-03 16:11:30');
INSERT INTO `work_user_tokens` VALUES (323, 15, 15, 'app', 'user&app@139bcd064d8c6ae6790717eac47dabf6', 'user&app@7348e5852838b3796bd6c2b244511b6d', 0, 1, '2018-12-03 17:38:32', '2018-12-03 17:38:32');
INSERT INTO `work_user_tokens` VALUES (324, 9, 9, 'wechat', 'user&wechat@555c00275d1df89c142b3b2440442f0d', 'user&wechat@d3d4daeff41b3302bccd57ea234e62bf', 7200, 1, '2018-12-03 18:21:53', '2018-12-03 18:21:53');
INSERT INTO `work_user_tokens` VALUES (325, 9, 9, 'wechat', 'user&wechat@9cafc515112973050412a4b815c9badc', 'user&wechat@56921d157b489f0d822d579731bf5241', 7200, 1, '2018-12-03 18:22:31', '2018-12-03 18:22:31');
INSERT INTO `work_user_tokens` VALUES (326, 2, 2, 'wechat', 'user&wechat@d36567080502ab9b881238d1016a15e9', 'user&wechat@5f1f452209c611654d6f2f0b27d53feb', 7200, 1, '2018-12-03 18:25:02', '2018-12-03 18:25:02');
INSERT INTO `work_user_tokens` VALUES (327, 15, 15, 'app', 'user&app@23abe63d09d3d2ad1fa13056e6cd0e55', 'user&app@6abf4bdf4c4930a18936a16ac67ae536', 0, 1, '2018-12-03 18:26:12', '2018-12-03 18:26:12');
INSERT INTO `work_user_tokens` VALUES (328, 9, 9, 'app', 'user&app@9d5e480ce8c2784ab783726258cafb23', 'user&app@931463646c3bce52327d89609c1fc5ff', 0, 1, '2018-12-03 18:52:15', '2018-12-03 18:52:15');
INSERT INTO `work_user_tokens` VALUES (329, 2, 2, 'app', 'user&app@f8bd64ed49c2117c37fa9ca71a941144', 'user&app@cb87f750328e1cfdc1c01f843528ac3d', 0, 1, '2018-12-03 18:55:22', '2018-12-03 18:55:22');
INSERT INTO `work_user_tokens` VALUES (330, 2, 2, 'applet', 'user&applet@2730e5c921350429a28fb389758ea31b', 'user&applet@08f1214179e2527d9237b75bab2396f0', 0, 1, '2018-12-03 19:05:36', '2018-12-03 19:05:36');
INSERT INTO `work_user_tokens` VALUES (331, 4, 4, 'applet', 'user&applet@34c54731674ab0275b5fddf4765b2303', 'user&applet@79daba7e5bd87a78f0724ee5012ac091', 0, 1, '2018-12-04 10:26:44', '2018-12-04 10:26:44');
INSERT INTO `work_user_tokens` VALUES (332, 4, 4, 'applet', 'user&applet@12db9811e06f7dbcada20df4e5a4a675', 'user&applet@11290c10dd217ecef7fa95cae9efaf88', 0, 1, '2018-12-04 10:28:28', '2018-12-04 10:28:28');
INSERT INTO `work_user_tokens` VALUES (333, 15, 15, 'app', 'user&app@1cf5488711d115afed0116c721aeab14', 'user&app@a4d90c0b2db1bfcabb8aca7322c633e6', 0, 1, '2018-12-04 11:08:58', '2018-12-04 11:08:58');
INSERT INTO `work_user_tokens` VALUES (334, 15, 15, 'app', 'user&app@c1609643111711b4b78ceec6e7d82fcd', 'user&app@0fb713cfe409867a54de128b16b9492a', 0, 1, '2018-12-04 11:30:57', '2018-12-04 11:30:57');
INSERT INTO `work_user_tokens` VALUES (335, 4, 4, 'app', 'user&app@b709926d31f24624e32f96d0dd716f99', 'user&app@bb2d88ed2ac110c1667fb6f66f61e324', 0, 1, '2018-12-04 11:35:27', '2018-12-04 11:35:27');
INSERT INTO `work_user_tokens` VALUES (336, 50, 50, 'app', 'user&app@9079339213d22b3d26ae359b3a05c567', 'user&app@0a813dad5e0296a0df3806d8393e4212', 0, 1, '2018-12-04 14:02:20', '2018-12-04 14:02:20');
INSERT INTO `work_user_tokens` VALUES (337, 4, 4, 'applet', 'user&applet@e2394311139772db33f87f71409c7790', 'user&applet@1ba1f35d37cbcd2f7260858c17fcd339', 0, 1, '2018-12-04 14:04:41', '2018-12-04 14:04:41');
INSERT INTO `work_user_tokens` VALUES (338, 51, 51, 'app', 'user&app@829854e78c19fcc3a643681cf466c966', 'user&app@9d08b8ae4aa7f67c1ab7ecc2ebac874c', 0, 1, '2018-12-04 14:07:35', '2018-12-04 14:07:35');
INSERT INTO `work_user_tokens` VALUES (339, 15, 15, 'app', 'user&app@a7bf17b20893a2cc40ee0c305ab49a30', 'user&app@15880331db9ad067df9c2e73d2db49e5', 0, 1, '2018-12-04 14:08:03', '2018-12-04 14:08:03');
INSERT INTO `work_user_tokens` VALUES (340, 4, 4, 'app', 'user&app@2c89cbcb1971c3bc95b63eab61fbf4cd', 'user&app@6c9c7544783b2f28ec20ebb576796632', 0, 1, '2018-12-04 14:10:19', '2018-12-04 14:10:19');
INSERT INTO `work_user_tokens` VALUES (341, 52, 52, 'app', 'user&app@1cf70330a1d11ead0be27cb705e7b111', 'user&app@5abb61faa0795b7949b4ff6ac6f2d754', 0, 1, '2018-12-04 14:11:54', '2018-12-04 14:11:54');
INSERT INTO `work_user_tokens` VALUES (342, 53, 53, 'app', 'user&app@64c5a16ad1553b855c0b57a674ed94b9', 'user&app@43dba1f42f5879008df6fee19e6dbcf8', 0, 1, '2018-12-04 14:13:04', '2018-12-04 14:13:04');
INSERT INTO `work_user_tokens` VALUES (343, 54, 54, 'app', 'user&app@371c0eda5bbd01782ddfbe1f42c7f078', 'user&app@efb3874ef82fbe648b9d456329a28def', 0, 1, '2018-12-04 14:14:09', '2018-12-04 14:14:09');
INSERT INTO `work_user_tokens` VALUES (344, 55, 55, 'applet', 'user&applet@29077cd318558284fd079c123231a8e4', 'user&applet@e2454a25e81d99704039995e6fe8f3fb', 0, 1, '2018-12-04 14:14:58', '2018-12-04 14:14:58');
INSERT INTO `work_user_tokens` VALUES (345, 15, 15, 'app', 'user&app@a6043ba26185f432c2a736c0dfe5a233', 'user&app@2b17f1b65c134671c01de8ae25b96211', 0, 1, '2018-12-04 14:26:09', '2018-12-04 14:26:09');
INSERT INTO `work_user_tokens` VALUES (346, 13, 13, 'applet', 'user&applet@4d9f0dac19e0d0353aad87f7f4e6f0e5', 'user&applet@6fbba587d9f301e8335f1eceef532763', 0, 1, '2018-12-04 15:26:15', '2018-12-04 15:26:15');
INSERT INTO `work_user_tokens` VALUES (347, 4, 4, 'applet', 'user&applet@030e382b5693cc9cc3b8988e582c42da', 'user&applet@012878644daffaedd9c344cd9e0a12f4', 0, 1, '2018-12-04 17:03:08', '2018-12-04 17:03:08');
INSERT INTO `work_user_tokens` VALUES (348, 15, 15, 'applet', 'user&applet@8202efbd1ab8374f60c0de2d754317e9', 'user&applet@e418e3f60d322c8d33dd09dff544d8ad', 0, 1, '2018-12-04 17:03:27', '2018-12-04 17:03:27');
INSERT INTO `work_user_tokens` VALUES (349, 4, 4, 'applet', 'user&applet@8d94fe55708fb6faddfe31c1d0489271', 'user&applet@c8aaca9e3a9fc082acd4b273376f9f01', 0, 1, '2018-12-04 17:05:09', '2018-12-04 17:05:09');
INSERT INTO `work_user_tokens` VALUES (350, 4, 4, 'applet', 'user&applet@17fce8ed5fb7fb5da74d020c2ca2ea9e', 'user&applet@0df0fa012ae22d2a8438384cb0cbfde1', 0, 1, '2018-12-04 17:06:09', '2018-12-04 17:06:09');
INSERT INTO `work_user_tokens` VALUES (351, 15, 15, 'applet', 'user&applet@54e8d5c0b8cd5c0c8ef3fb4c44eac42c', 'user&applet@b2525969e11706dfca208ac2b52202c8', 0, 1, '2018-12-04 17:06:11', '2018-12-04 17:06:11');
INSERT INTO `work_user_tokens` VALUES (352, 20, 20, 'wap', 'user&wap@204452889987623bb8358d32771d2fa1', 'user&wap@3b2fc2c9f6b36914ea5a1037766d1b29', 7200, 1, '2018-12-04 17:06:15', '2018-12-04 17:06:15');
INSERT INTO `work_user_tokens` VALUES (353, 4, 4, 'applet', 'user&applet@2ab6b31d4f05e786df5a80c0f0ed585d', 'user&applet@f5116875544d6fd022d50399dc003918', 0, 1, '2018-12-04 17:06:23', '2018-12-04 17:06:23');
INSERT INTO `work_user_tokens` VALUES (354, 4, 4, 'applet', 'user&applet@d1e9596cef8c7341a5874bbc1c911c2b', 'user&applet@49e398c41368b58c4ee272ea8d67efa3', 0, 1, '2018-12-04 17:06:36', '2018-12-04 17:06:36');
INSERT INTO `work_user_tokens` VALUES (355, 17, 17, 'applet', 'user&applet@14b221d44b8c420a18506e6557937974', 'user&applet@81e78b86828e97a6f9ac6fab6ae6158a', 0, 1, '2018-12-04 17:06:57', '2018-12-04 17:06:57');
INSERT INTO `work_user_tokens` VALUES (356, 4, 4, 'applet', 'user&applet@8e2ad37799c918f556c0297ad30542ed', 'user&applet@a2693545d846e6f5bd48c556aecec03e', 0, 1, '2018-12-04 17:15:40', '2018-12-04 17:15:40');
INSERT INTO `work_user_tokens` VALUES (357, 17, 17, 'applet', 'user&applet@e3126370d1554728010074bf4da993aa', 'user&applet@867e64073836d5f110d46963fd3e0562', 0, 1, '2018-12-04 17:16:09', '2018-12-04 17:16:09');
INSERT INTO `work_user_tokens` VALUES (360, 1, 1, 'applet', 'user&applet@8d43c15800caf5c133c73e8704454ece', 'user&applet@6f352c45bfa4ca449a6a4bb289a06ec0', 0, 1, '2018-12-05 16:18:53', '2018-12-05 16:18:53');
INSERT INTO `work_user_tokens` VALUES (361, 55, 55, 'app', 'user&app@ddf3dc595b24b2137078c10d25205528', 'user&app@6051a9bb113878e4ec8754f19646e5f3', 0, 1, '2018-12-05 16:48:53', '2018-12-05 16:48:53');
INSERT INTO `work_user_tokens` VALUES (362, 57, 57, 'applet', 'user&applet@3368f41b885fcd874d21436c56e07ae8', 'user&applet@97f3c9fbcf5a4b53bc0f6f3a3f71af85', 0, 1, '2018-12-05 19:00:00', '2018-12-05 19:00:00');
INSERT INTO `work_user_tokens` VALUES (363, 58, 58, 'app', 'user&app@153f9a53c2cad03462f31edc8625dfcb', 'user&app@7250dd4c547e30833dc4184151251006', 0, 1, '2018-12-05 20:23:41', '2018-12-05 20:23:41');
INSERT INTO `work_user_tokens` VALUES (364, 49, 49, 'app', 'user&app@a4f3ac590b43319b78fd1c1d45b74384', 'user&app@f59799fcdd182195ec0ac45c474e27d3', 0, 1, '2018-12-06 11:29:07', '2018-12-06 11:29:07');
INSERT INTO `work_user_tokens` VALUES (365, 13, 13, 'applet', 'user&applet@a80614beb2aad5b130870e47b6d96298', 'user&applet@abfd2bc991a3336c17196768a2757e5c', 0, 1, '2018-12-06 14:23:47', '2018-12-06 14:23:47');
INSERT INTO `work_user_tokens` VALUES (366, 1, 1, 'wechat', 'user&wechat@274caa0f4a38005d93d9722a9c11e947', 'user&wechat@d1518486ab1a0fd78e84127a6885f1d3', 7200, 1, '2018-12-06 15:34:48', '2018-12-06 15:34:48');
INSERT INTO `work_user_tokens` VALUES (367, 1, 1, 'applet', 'user&applet@eccbdfa401f6910db99eed6f0b40dbca', 'user&applet@90d5d3ee6e3c8acb5c8f8676decaafb0', 0, 1, '2018-12-06 15:37:12', '2018-12-06 15:37:12');
INSERT INTO `work_user_tokens` VALUES (368, 49, 49, 'app', 'user&app@9f2ba33108d4cad6a23e093e325494ed', 'user&app@635e586be4ac12ea5b67b26c94d38d54', 0, 1, '2018-12-06 15:38:22', '2018-12-06 15:38:22');
INSERT INTO `work_user_tokens` VALUES (369, 15, 15, 'app', 'user&app@ea4985cc9de6ddc063fcb7e66a5be789', 'user&app@2c93956a4a90437813906510a808f0f3', 0, 1, '2018-12-06 16:00:13', '2018-12-06 16:00:13');
INSERT INTO `work_user_tokens` VALUES (370, 2, 2, 'app', 'user&app@00bab776d2cdeed6088f7386bcabec97', 'user&app@1c9f61f885237a5e093d32e7cf4fc019', 0, 1, '2018-12-06 18:32:40', '2018-12-06 18:32:40');
INSERT INTO `work_user_tokens` VALUES (371, 2, 2, 'applet', 'user&applet@b4374215a533cc509d79551543bfa068', 'user&applet@ef760bf4cc6e5617d05c6a189b44ec39', 0, 1, '2018-12-06 18:38:48', '2018-12-06 18:38:48');
INSERT INTO `work_user_tokens` VALUES (372, 49, 49, 'applet', 'user&applet@76e652b4195d404c0516cb8d750a6b51', 'user&applet@79736bece47ac5ead7a8583c046b0940', 0, 1, '2018-12-06 19:00:31', '2018-12-06 19:00:31');
INSERT INTO `work_user_tokens` VALUES (373, 49, 49, 'applet', 'user&applet@f758231832f580d2526b3ad1b36d248e', 'user&applet@7df403106fabdcce247a8aff25171511', 0, 1, '2018-12-06 19:53:49', '2018-12-06 19:53:49');
INSERT INTO `work_user_tokens` VALUES (374, 20, 20, 'wap', 'user&wap@ec1ccbcffe9c809b5c97d85c801d6cd4', 'user&wap@ac6183627ba17409f96798c9c9606966', 7200, 1, '2018-12-06 20:05:11', '2018-12-06 20:05:11');
INSERT INTO `work_user_tokens` VALUES (375, 49, 49, 'applet', 'user&applet@fce8f0d6e420ede43c237f6291df8d29', 'user&applet@b2997a9fb34e172ac81e95d9ed2bf987', 0, 1, '2018-12-06 22:51:51', '2018-12-06 22:51:51');
INSERT INTO `work_user_tokens` VALUES (376, 49, 49, 'applet', 'user&applet@f5b88969efaabb50d60c876c31cb0133', 'user&applet@e1d3b3430a14b850616f4f7d0779007f', 0, 1, '2018-12-07 09:15:19', '2018-12-07 09:15:19');
INSERT INTO `work_user_tokens` VALUES (377, 1, 1, 'app', 'user&app@381af67d7575b61a4e5073ddbf6fcab1', 'user&app@16064475203993e4bb27fd7801a7c7ae', 0, 1, '2018-12-07 09:22:32', '2018-12-07 09:22:32');
INSERT INTO `work_user_tokens` VALUES (379, 49, 49, 'wap', 'user&wap@6112321713b3825764c043b294084e7f', 'user&wap@ea39d20119d70fb1904ca11fe0d1a8eb', 7200, 1, '2018-12-07 09:32:04', '2018-12-07 09:32:04');
INSERT INTO `work_user_tokens` VALUES (380, 49, 49, 'applet', 'user&applet@ce1da53d8117061c5ca6249b52aede83', 'user&applet@c9843f2a00c215af50743362c70a4f85', 0, 1, '2018-12-07 09:32:41', '2018-12-07 09:32:41');
INSERT INTO `work_user_tokens` VALUES (381, 8, 8, 'app', 'user&app@8ffb10668ed418f7440dec2796f3a1e9', 'user&app@598422f17e498e72740866aa27c08f8c', 0, 1, '2019-01-22 14:05:26', '2019-01-22 14:05:26');
INSERT INTO `work_user_tokens` VALUES (382, 15, 15, 'applet', 'user&applet@f1010789f22dc38bb3af942d93cfb7e2', 'user&applet@0dc959e43e81f705b0658e8724303c2f', 0, 1, '2019-01-22 14:10:17', '2019-01-22 14:10:17');
INSERT INTO `work_user_tokens` VALUES (383, 21, 21, 'applet', 'user&applet@4cb023395591f04bd4ebab21cdaaedce', 'user&applet@6ab323ccf4f922ed834acceebe7aaa2d', 0, 1, '2019-01-22 14:30:09', '2019-01-22 14:30:09');
INSERT INTO `work_user_tokens` VALUES (384, 18, 18, 'applet', 'user&applet@3e6c0061a87cd090c58db15d5e5708c2', 'user&applet@4de0e5d8d8fb9dbbee46e66f0f81379e', 0, 1, '2019-01-22 14:41:47', '2019-01-22 14:41:47');
INSERT INTO `work_user_tokens` VALUES (385, 1, 1, 'applet', 'user&applet@a5495bf8bbe61fd33e3c7e5172099269', 'user&applet@1d7ab0039bd2dc28ea1cba4fbe79d20b', 0, 1, '2019-01-22 15:04:48', '2019-01-22 15:04:48');
INSERT INTO `work_user_tokens` VALUES (386, 49, 49, 'applet', 'user&applet@f18c314a823ed667f794b13adb92b92b', 'user&applet@7ac1051d788ae1d77172e00979e14234', 0, 1, '2019-01-22 15:25:24', '2019-01-22 15:25:24');
INSERT INTO `work_user_tokens` VALUES (387, 1, 1, 'wap', 'user&wap@159376fb9ce348b2c4fdb27900bdd2f0', 'user&wap@4b3b9c9328f04e2e650b6d03aa13fd06', 7200, 1, '2019-01-22 16:33:39', '2019-01-22 16:33:39');
INSERT INTO `work_user_tokens` VALUES (388, 6, 6, 'applet', 'user&applet@e250930d8de31a2519ce2b76ef90801c', 'user&applet@1e6e785a6d322cb848728033ce6f71b9', 0, 1, '2019-01-23 09:34:25', '2019-01-23 09:34:25');
INSERT INTO `work_user_tokens` VALUES (389, 1, 1, 'applet', 'user&applet@00636cc62f2d8786c7d3a6b0732629ba', 'user&applet@95310a9f49dd6ddfbe04828aaeb8740f', 0, 1, '2019-01-23 09:55:56', '2019-01-23 09:55:56');
INSERT INTO `work_user_tokens` VALUES (390, 6, 6, 'applet', 'user&applet@1b213c25965f972f5c591a4ca55e2689', 'user&applet@70f21c8f0c0a96903dce01eba97a71dc', 0, 1, '2019-01-23 10:02:05', '2019-01-23 10:02:05');
INSERT INTO `work_user_tokens` VALUES (391, 1, 1, 'applet', 'user&applet@87ebe6509fdf7f411ad7bc11b5c8dc13', 'user&applet@cdd2d938795bc77ddd2be722faaf6255', 0, 1, '2019-01-23 10:12:37', '2019-01-23 10:12:37');
INSERT INTO `work_user_tokens` VALUES (392, 6, 6, 'applet', 'user&applet@e20e4a07b79b90e8fe526826e5df869a', 'user&applet@5fc6cdb08b2695f32cc2003258d55e00', 0, 1, '2019-01-23 10:46:00', '2019-01-23 10:46:00');
INSERT INTO `work_user_tokens` VALUES (393, 1, 1, 'applet', 'user&applet@01e9a502a8bc3f327334acc8fd38239c', 'user&applet@9526d9698bdf99c16ba84bba0bf9cdd9', 0, 1, '2019-01-23 11:37:24', '2019-01-23 11:37:24');
INSERT INTO `work_user_tokens` VALUES (394, 2, 2, 'app', 'user&app@e1393fc88dae7b866689c1eaa221ed51', 'user&app@1ffc5957196c011556346b3c4900a889', 0, 1, '2019-01-23 16:57:09', '2019-01-23 16:57:09');
INSERT INTO `work_user_tokens` VALUES (395, 48, 48, 'applet', 'user&applet@c4355ba862c980d0b59eb2c3ecbb6e93', 'user&applet@446bac87e83eaf3cf4ee0ffad74f9da4', 0, 1, '2019-01-24 09:38:01', '2019-01-24 09:38:01');
INSERT INTO `work_user_tokens` VALUES (396, 43, 43, 'applet', 'user&applet@46015f3d82b74e8f20c312c24ec93bc7', 'user&applet@f1005bed41a815365cffa24764a47db7', 0, 1, '2019-01-24 10:11:46', '2019-01-24 10:11:46');
INSERT INTO `work_user_tokens` VALUES (406, 7, 7, 'wap', 'user&wap@e52a4ab1ef139dbd1cf677f67803aaf5', 'user&wap@2c5a4457c5da1aa89a92e5d034ff3ce9', 7200, 1, '2019-01-26 11:39:17', '2019-01-26 11:39:17');
INSERT INTO `work_user_tokens` VALUES (398, 59, 59, 'wap', 'user&wap@603e51f0f14d037cddf37066e3a71cc0', 'user&wap@3127e71fbc20e0281dc4268561569dfa', 7200, 1, '2019-01-24 14:58:07', '2019-01-24 14:58:07');
INSERT INTO `work_user_tokens` VALUES (399, 15, 15, 'applet', 'user&applet@aaf13100c31dcda951cac4da4b4e892d', 'user&applet@c9f7537b52241fa493962fa2d7547abc', 0, 1, '2019-01-24 15:21:24', '2019-01-24 15:21:24');
INSERT INTO `work_user_tokens` VALUES (400, 48, 48, 'applet', 'user&applet@411300bb477c78aec5789769c4ddb202', 'user&applet@8434a1fabf16878bd3769c5124b7e527', 0, 1, '2019-01-24 17:16:11', '2019-01-24 17:16:11');
INSERT INTO `work_user_tokens` VALUES (401, 45, 45, 'applet', 'user&applet@9bb0e0171737242ba738e31a22ce010f', 'user&applet@074a965d71ceb573d0fcfd0042670b91', 0, 1, '2019-01-24 18:47:11', '2019-01-24 18:47:11');
INSERT INTO `work_user_tokens` VALUES (402, 17, 17, 'applet', 'user&applet@5b47e6336b0b8f650a7f9531ec033906', 'user&applet@7976b47266749a49abd19385af763241', 0, 1, '2019-01-25 15:14:56', '2019-01-25 15:14:56');
INSERT INTO `work_user_tokens` VALUES (403, 17, 17, 'app', 'user&app@3f07962746cd0891caaa7e1a5b44418d', 'user&app@379f8c5556076884c7eefcff4fce3fa5', 0, 1, '2019-01-25 15:27:28', '2019-01-25 15:27:28');
INSERT INTO `work_user_tokens` VALUES (404, 17, 17, 'applet', 'user&applet@e6ef68d682e5f08100ef4843ab38af8b', 'user&applet@3095de89b091d2193842a2f12b8c33a9', 0, 1, '2019-01-25 15:35:34', '2019-01-25 15:35:34');
INSERT INTO `work_user_tokens` VALUES (405, 59, 59, 'applet', 'user&applet@5c528d7f62b6d3265350004426eaac91', 'user&applet@848cb200841edd652773fbaf34b4f037', 0, 1, '2019-01-25 17:20:41', '2019-01-25 17:20:41');
INSERT INTO `work_user_tokens` VALUES (407, 7, 7, 'wap', 'user&wap@b44727247664e0085b4dc51e73784718', 'user&wap@1c4efe7724fd1a853fae70697c67bb00', 7200, 1, '2019-01-26 11:40:22', '2019-01-26 11:40:22');
INSERT INTO `work_user_tokens` VALUES (408, 1, 1, 'app', 'user&app@ab9ba9985ec493761753281bc6fab5eb', 'user&app@5124fc0fc8000f7c577a98721d2be624', 0, 1, '2019-01-26 14:28:29', '2019-01-26 14:28:29');
INSERT INTO `work_user_tokens` VALUES (409, 1, 1, 'wap', 'user&wap@40d0f2cac0cf5e1071e62ed0ddaca0cf', 'user&wap@1dd71ff3ee65afd7ff644709995397db', 7200, 1, '2019-01-26 14:38:56', '2019-01-26 14:38:56');
INSERT INTO `work_user_tokens` VALUES (416, 1, 1, 'app', 'user&app@6ab4fd2fef80259a916643950f5aa93c', 'user&app@3bd0d82b3574a421d575edda6ddb9d56', 0, 1, '2019-01-28 15:21:32', '2019-01-28 15:21:32');
INSERT INTO `work_user_tokens` VALUES (411, 19, 19, 'applet', 'user&applet@fc48b39c219989e25dcb9093f8aa2d81', 'user&applet@163bdb8e389e6445316b8f46c06024fe', 0, 1, '2019-01-26 17:59:28', '2019-01-26 17:59:28');
INSERT INTO `work_user_tokens` VALUES (412, 11, 11, 'wechat', 'user&wechat@076ff751c8500f9a15f4bc9eef75fcbe', 'user&wechat@d9f746deb153487a54db9445c3626dd0', 7200, 1, '2019-01-28 10:16:02', '2019-01-28 10:16:02');
INSERT INTO `work_user_tokens` VALUES (413, 45, 45, 'applet', 'user&applet@925f7adc1a21783d7e93010fdda59459', 'user&applet@812500fdad6f9c36ba1b32b52bb2deca', 0, 1, '2019-01-28 10:16:07', '2019-01-28 10:16:07');
INSERT INTO `work_user_tokens` VALUES (414, 2, 2, 'wechat', 'user&wechat@40f784f3ae3749174ca0e46e92fc6991', 'user&wechat@c0f63deb75c0a0df9e4b65e26f200373', 7200, 1, '2019-01-28 10:16:25', '2019-01-28 10:16:25');
INSERT INTO `work_user_tokens` VALUES (415, 11, 11, 'applet', 'user&applet@6078e0edaa26317b930e9e47321f5512', 'user&applet@76258292c2bfacd8b6bd3732f93f7eb3', 0, 1, '2019-01-28 13:50:01', '2019-01-28 13:50:01');
INSERT INTO `work_user_tokens` VALUES (417, 1, 1, 'app', 'user&app@567e3df612f9b9aec1430e2aa7e531ad', 'user&app@b6831e6bb0364ab6f67d59f81814e419', 0, 1, '2019-01-28 15:22:14', '2019-01-28 15:22:14');
INSERT INTO `work_user_tokens` VALUES (418, 1, 1, 'app', 'user&app@650e8e6e627e9c90ec00f12d20259a90', 'user&app@052308b506d966cd0709b341c6ad10d9', 0, 1, '2019-01-28 15:23:17', '2019-01-28 15:23:17');
INSERT INTO `work_user_tokens` VALUES (419, 1, 1, 'app', 'user&app@33401ed688ce28de7204e4e60abf0299', 'user&app@c9505bf9047147d97eccaf90cdf32d4d', 0, 1, '2019-01-28 15:24:58', '2019-01-28 15:24:58');
INSERT INTO `work_user_tokens` VALUES (420, 1, 1, 'app', 'user&app@6c2c68c3682a235907120ac0b167c9c4', 'user&app@0b8471d2c0e903d40385896019bb1462', 0, 1, '2019-01-28 15:28:33', '2019-01-28 15:28:33');
INSERT INTO `work_user_tokens` VALUES (421, 1, 1, 'app', 'user&app@54edf2c55a48de0e7bf4911a266bba99', 'user&app@c6efe35d1700e6423740b63fbbabb276', 0, 1, '2019-01-28 15:30:10', '2019-01-28 15:30:10');
INSERT INTO `work_user_tokens` VALUES (422, 1, 1, 'app', 'user&app@84f5887bd0aecfad4029bdeee4ca8334', 'user&app@b2cd95021d8dba501b06483b75d3d56c', 0, 1, '2019-01-28 15:33:36', '2019-01-28 15:33:36');
INSERT INTO `work_user_tokens` VALUES (423, 1, 1, 'app', 'user&app@21f461f5c850d7955867c08884237160', 'user&app@5067911d8c2be127f837e676bca322ad', 0, 1, '2019-01-28 15:36:20', '2019-01-28 15:36:20');
INSERT INTO `work_user_tokens` VALUES (424, 1, 1, 'app', 'user&app@c417307352165d093bc32638d53eab54', 'user&app@151986f4d49a15cd7d605affe5d759f6', 0, 1, '2019-01-28 15:37:33', '2019-01-28 15:37:33');
INSERT INTO `work_user_tokens` VALUES (425, 1, 1, 'wap', 'user&wap@2bc0ed7b87fd1dc051a69e4292365dec', 'user&wap@70ed2e201b4d02dde7ea7c451ee9ae02', 7200, 1, '2019-01-28 15:40:50', '2019-01-28 15:40:50');
INSERT INTO `work_user_tokens` VALUES (426, 1, 1, 'app', 'user&app@0f3aba1cdb6c7887849fff618f1ddcff', 'user&app@1892cacc66f5576c2f1ddc06761f514d', 0, 1, '2019-01-28 17:30:04', '2019-01-28 17:30:04');
INSERT INTO `work_user_tokens` VALUES (440, 27, 27, 'applet', 'user&applet@5b7578e833b27a583254c197ffb8c903', 'user&applet@0e11542032cd8f08bf85abe93e024a67', 0, 1, '2019-02-14 10:47:40', '2019-02-14 10:47:40');
INSERT INTO `work_user_tokens` VALUES (428, 15, 15, 'wechat', 'user&wechat@9e099bb1bcfce1956d79a696b64c711f', 'user&wechat@36c7941c53ea18908fe23467e72af456', 7200, 1, '2019-01-29 16:44:36', '2019-01-29 16:44:36');
INSERT INTO `work_user_tokens` VALUES (429, 17, 17, 'wechat', 'user&wechat@01a4ce1b6bfb988f7bcab1ab2b259e0f', 'user&wechat@db74f8107f4447b8997ad96a60122295', 7200, 1, '2019-01-29 17:30:00', '2019-01-29 17:30:00');
INSERT INTO `work_user_tokens` VALUES (433, 17, 17, 'wechat', 'user&wechat@ee483c7207d7db8ee41b9fd54f07654c', 'user&wechat@82d4a4c6a55411ea2d49fb8de6df4a41', 7200, 1, '2019-02-11 11:27:23', '2019-02-11 11:27:23');
INSERT INTO `work_user_tokens` VALUES (431, 59, 59, 'applet', 'user&applet@94a5b3533d8db388f52045bca4406267', 'user&applet@125a8a78ac2fb23a9be77e67f2e6d26a', 0, 1, '2019-01-30 10:47:12', '2019-01-30 10:47:12');
INSERT INTO `work_user_tokens` VALUES (432, 16, 16, 'applet', 'user&applet@85b15291153f414e456fe8df5c4801b9', 'user&applet@fdd46651630794d06ea1b3674946e478', 0, 1, '2019-02-04 17:51:46', '2019-02-04 17:51:46');
INSERT INTO `work_user_tokens` VALUES (434, 60, 60, 'wap', 'user&wap@65ac94deeab5766404dece820bab9ef3', 'user&wap@31b4895a66a0895bf943bd376358c132', 7200, 1, '2019-02-11 11:33:31', '2019-02-11 11:33:31');
INSERT INTO `work_user_tokens` VALUES (435, 60, 60, 'wap', 'user&wap@cb77e30f3f7fba45d73c4dee101f5ad0', 'user&wap@7fcc58fea6c6c4f3b0829dcccf83a1f6', 7200, 1, '2019-02-11 11:33:50', '2019-02-11 11:33:50');
INSERT INTO `work_user_tokens` VALUES (436, 56, 56, 'applet', 'user&applet@4b00b14e96459fc494976405a9a1d4f3', 'user&applet@db6b5de1f5f6d873769e86644f0c678c', 0, 1, '2019-02-13 11:33:28', '2019-02-13 11:33:28');
INSERT INTO `work_user_tokens` VALUES (437, 2, 2, 'applet', 'user&applet@e40d5c4a66e11e2c9fc47f8e8bb58b3b', 'user&applet@5cfda3d82f3bedc2351d4cac047f38ad', 0, 1, '2019-02-13 15:33:26', '2019-02-13 15:33:26');
INSERT INTO `work_user_tokens` VALUES (438, 61, 61, 'wechat', 'user&wechat@79892fbcd8bd683bb847a4e80baa8cf8', 'user&wechat@6dbe00362d24ea9ae1c6b8e94f369bdd', 7200, 1, '2019-02-13 15:41:32', '2019-02-13 15:41:32');
INSERT INTO `work_user_tokens` VALUES (439, 8, 8, 'applet', 'user&applet@f4f98595b9179310fe31abfc8a8f9ba9', 'user&applet@9838f5e14316d050fcb1e672e6f7d715', 0, 1, '2019-02-13 16:01:53', '2019-02-13 16:01:53');
INSERT INTO `work_user_tokens` VALUES (441, 2, 2, 'applet', 'user&applet@5c369c75f1c3a4e6e45199334e487203', 'user&applet@7aed83814cb7d6e74c7d5f543b985594', 0, 1, '2019-02-14 11:29:54', '2019-02-14 11:29:54');
INSERT INTO `work_user_tokens` VALUES (442, 62, 62, 'wechat', 'user&wechat@03df4404bc68585a5cbf6c76fa2c53e5', 'user&wechat@91858fc7f49dcae5f39799e84d86f745', 7200, 1, '2019-02-14 17:55:51', '2019-02-15 09:26:44');
INSERT INTO `work_user_tokens` VALUES (443, 63, 63, 'wechat', 'user&wechat@984adf93164426b0da391cfdeb8d3f5b', 'user&wechat@300661ddcfbdcb9fb9df237454986c04', 7200, 1, '2019-02-14 17:59:45', '2019-02-14 17:59:45');
INSERT INTO `work_user_tokens` VALUES (444, 62, 62, 'applet', 'user&applet@c3e2b77349a826b25bd2758d96cb598c', 'user&applet@0efd262b1715e642b0293982c9a0376c', 0, 1, '2019-02-14 18:07:18', '2019-02-14 18:07:18');
INSERT INTO `work_user_tokens` VALUES (445, 63, 63, 'applet', 'user&applet@2e9b49b9b4a5e5cf337f50d58ff5c7b8', 'user&applet@4c2426020f7b6b2ea075b90cdf20e4a0', 0, 1, '2019-02-14 18:10:05', '2019-02-14 18:10:05');
INSERT INTO `work_user_tokens` VALUES (446, 2, 2, 'applet', 'user&applet@51ade628e9ea5ce91cdd8ebcdbb08844', 'user&applet@ef9df67c4aff2e35fa62c01518547a29', 0, 1, '2019-02-22 10:10:45', '2019-02-22 10:10:45');
INSERT INTO `work_user_tokens` VALUES (447, 49, 49, 'applet', 'user&applet@5f3448a0eb8d08145338dc5f9a77fc16', 'user&applet@40777440346dc885d16df59ad38089f9', 0, 1, '2019-02-22 10:16:07', '2019-02-22 10:16:07');
INSERT INTO `work_user_tokens` VALUES (499, 1, 1, 'wap', 'user&wap@4036c6a5949e1d8e82378ca2f996ce98', 'user&wap@60b0615e023dc625b321f75bce02ca51', 7200, 1, '2019-02-25 17:26:52', '2019-02-26 13:57:56');
INSERT INTO `work_user_tokens` VALUES (449, 6, 6, 'applet', 'user&applet@e5a84d973ae41a5047d5d9ca8f31bbc1', 'user&applet@c7fedf1c753e8b568c829fac46fb9d91', 0, 1, '2019-02-22 10:38:32', '2019-02-22 10:38:32');
INSERT INTO `work_user_tokens` VALUES (450, 64, 64, 'applet', 'user&applet@168aec283d08b21fc86b666dc6576ae3', 'user&applet@74d5b2bb7e537e23ba69d66f129588ad', 0, 1, '2019-02-22 11:02:25', '2019-02-22 11:02:25');
INSERT INTO `work_user_tokens` VALUES (451, 64, 64, 'applet', 'user&applet@8ee0ede71d981782a27e5de842ba06f2', 'user&applet@aba84e4440b2ced9856f78e4f160e832', 0, 1, '2019-02-22 11:23:39', '2019-02-22 11:23:39');
INSERT INTO `work_user_tokens` VALUES (452, 64, 64, 'applet', 'user&applet@431d6ec13aed9c71255b2b7bc7b14d42', 'user&applet@e81069d88f690f3a12c2dbf84183bdb1', 0, 1, '2019-02-22 11:25:33', '2019-02-22 11:25:33');
INSERT INTO `work_user_tokens` VALUES (453, 49, 49, 'applet', 'user&applet@3424495edc35382904ffc618e11b3b3b', 'user&applet@369ed78fe07f7febc476c6f193662185', 0, 1, '2019-02-22 11:29:01', '2019-02-22 11:29:01');
INSERT INTO `work_user_tokens` VALUES (454, 2, 2, 'applet', 'user&applet@c6f07589040a3976c120d2e1c5e5134f', 'user&applet@c45465ce65fc5403812e30dafbadbc04', 0, 1, '2019-02-22 11:37:42', '2019-02-22 11:37:42');
INSERT INTO `work_user_tokens` VALUES (455, 20, 20, 'applet', 'user&applet@27e8683453b5b1bcf336bf7364cd0558', 'user&applet@cd827620710043f51776557105b46f09', 0, 1, '2019-02-22 11:38:25', '2019-02-22 11:38:25');
INSERT INTO `work_user_tokens` VALUES (456, 18, 18, 'applet', 'user&applet@eae07c75170db98e6abe1050ee25eb25', 'user&applet@4126db03dac38a758fd13185709b93dc', 0, 1, '2019-02-22 11:41:21', '2019-02-22 11:41:21');
INSERT INTO `work_user_tokens` VALUES (457, 65, 65, 'applet', 'user&applet@ad69d7dc075e0e1996ffe12eec89739a', 'user&applet@72a2cf7f374abc20dc4edcec6081b8b3', 0, 1, '2019-02-22 13:12:12', '2019-02-22 13:12:12');
INSERT INTO `work_user_tokens` VALUES (458, 14, 14, 'applet', 'user&applet@40af31a02fdb34b110d9427bb1f01926', 'user&applet@2f2d7a4258855f025fce30b309d80f48', 0, 1, '2019-02-22 13:47:51', '2019-02-22 13:47:51');
INSERT INTO `work_user_tokens` VALUES (459, 2, 2, 'app', 'user&app@96c7aa5b10a5da925e75b12ea448b17b', 'user&app@0eaca99f35adfcabd278906892f5b397', 0, 1, '2019-02-22 15:14:48', '2019-02-22 15:14:48');
INSERT INTO `work_user_tokens` VALUES (460, 19, 19, 'applet', 'user&applet@39c62f7bf5612bb087cdb86991abeb69', 'user&applet@b38d096a3f69ef4c9dbbeb5df97ae0b1', 0, 1, '2019-02-22 15:26:19', '2019-02-22 15:26:19');
INSERT INTO `work_user_tokens` VALUES (461, 1, 1, 'applet', 'user&applet@6edb6e94615411ca34d6250dfcdd2be5', 'user&applet@f317b5acb0cc011bc4efb38f446e76c0', 0, 1, '2019-02-22 15:39:13', '2019-02-22 15:39:13');
INSERT INTO `work_user_tokens` VALUES (462, 1, 1, 'applet', 'user&applet@1654da97419ae0f4ded2b0ee7c28a932', 'user&applet@c4c1a254ae36333e450b347461936815', 0, 1, '2019-02-22 15:43:40', '2019-02-22 15:43:40');
INSERT INTO `work_user_tokens` VALUES (463, 1, 1, 'app', 'user&app@f734dafc0ffb26e3e5f11b0ec335bd3b', 'user&app@68b63b7218761b408eee0c96d74f0772', 0, 1, '2019-02-22 15:47:35', '2019-02-22 15:47:35');
INSERT INTO `work_user_tokens` VALUES (464, 2, 2, 'applet', 'user&applet@067f10b3800242da11ddd3b11fd0065f', 'user&applet@7c7c80ab97b1e176ca498427c1507a7d', 0, 1, '2019-02-22 15:53:03', '2019-02-22 15:53:03');
INSERT INTO `work_user_tokens` VALUES (465, 2, 2, 'applet', 'user&applet@c5cf035cfb0197bc645e422b582d3242', 'user&applet@9630f26c8ff588f33ab88962c3f66cea', 0, 1, '2019-02-22 16:01:47', '2019-02-22 16:01:47');
INSERT INTO `work_user_tokens` VALUES (466, 14, 14, 'applet', 'user&applet@0b725442ffba1321a3bda21fa0b2640f', 'user&applet@72e19384fa90ffc46bd021d5e6542992', 0, 1, '2019-02-22 16:12:46', '2019-02-22 16:12:46');
INSERT INTO `work_user_tokens` VALUES (467, 61, 61, 'app', 'user&app@22092be1c1456a384ac832ac6a895e2a', 'user&app@da05eb2904cabd5c1185fa6c0f4e4dc0', 0, 1, '2019-02-22 16:39:13', '2019-02-22 16:39:13');
INSERT INTO `work_user_tokens` VALUES (468, 48, 48, 'applet', 'user&applet@8276c0b2da3bc4299a14f81c8c6a7cea', 'user&applet@7f7c745852ea389e31fd2a38f5d4a97c', 0, 1, '2019-02-22 16:40:07', '2019-02-22 16:40:07');
INSERT INTO `work_user_tokens` VALUES (469, 2, 2, 'app', 'user&app@10494667ced493e3c206cedba0b2772c', 'user&app@a598e339a4836286e569c3d60f998b71', 0, 1, '2019-02-22 16:40:18', '2019-02-22 16:40:18');
INSERT INTO `work_user_tokens` VALUES (470, 46, 46, 'app', 'user&app@86917a381c46f43ce22a56608ed0ca87', 'user&app@b64de411da317880a003865bbac4b5b7', 0, 1, '2019-02-22 16:40:48', '2019-02-22 16:40:48');
INSERT INTO `work_user_tokens` VALUES (471, 2, 2, 'app', 'user&app@e1017c8bfa3de7d8f457c718447652e0', 'user&app@265f835a23bb4f438ca007352ce90c5a', 0, 1, '2019-02-22 16:41:24', '2019-02-22 16:41:24');
INSERT INTO `work_user_tokens` VALUES (472, 61, 61, 'app', 'user&app@2a3d14c915e0b4c790298da8dfde35bc', 'user&app@03d39d61018514f0e1164b757c357413', 0, 1, '2019-02-22 16:42:25', '2019-02-22 16:42:25');
INSERT INTO `work_user_tokens` VALUES (473, 2, 2, 'app', 'user&app@c46efb2b50da58fb2940682f498b9069', 'user&app@f948bd21eec3be74f0c7aa5c43184a51', 0, 1, '2019-02-22 16:43:07', '2019-02-22 16:43:07');
INSERT INTO `work_user_tokens` VALUES (474, 8, 8, 'app', 'user&app@c3bc328d39155f9cb677d9d9969d0708', 'user&app@2d159a6c1206a5cc232aaf4d8b781441', 0, 1, '2019-02-22 17:34:50', '2019-02-22 17:34:50');
INSERT INTO `work_user_tokens` VALUES (475, 59, 59, 'applet', 'user&applet@5f9b9fa50232d3a7bc06dea8cedb5e5a', 'user&applet@e0c64a7b0c1ec5cd5ea125076b112135', 0, 1, '2019-02-23 00:26:19', '2019-02-23 00:26:19');
INSERT INTO `work_user_tokens` VALUES (476, 66, 66, 'applet', 'user&applet@bf6018ec18929afdf4db831a5ffa6c37', 'user&applet@567bb9ec88b78fbd9ebaf3287c940927', 0, 1, '2019-02-23 08:36:04', '2019-02-23 08:36:04');
INSERT INTO `work_user_tokens` VALUES (477, 2, 2, 'applet', 'user&applet@7c29b7634f2e8107f40e6851f9df3e45', 'user&applet@7819faa0a3448762a957d701e120f519', 0, 1, '2019-02-23 08:38:10', '2019-02-23 08:38:10');
INSERT INTO `work_user_tokens` VALUES (478, 2, 2, 'applet', 'user&applet@c72a00a739c4fa805601423708256e96', 'user&applet@6eaae6048dd3cc754e01c7381f44005c', 0, 1, '2019-02-23 08:39:45', '2019-02-23 08:39:45');
INSERT INTO `work_user_tokens` VALUES (479, 2, 2, 'applet', 'user&applet@4af332c975d14c01bada4eb8972fb622', 'user&applet@f0f28d2a3cb321119bf8af528ae7b32c', 0, 1, '2019-02-23 09:22:03', '2019-02-23 09:22:03');
INSERT INTO `work_user_tokens` VALUES (480, 2, 2, 'app', 'user&app@5948e940b406bcfe2f4e41da499f5563', 'user&app@679280624b8fbae3d1801e3b717110b2', 0, 1, '2019-02-23 09:33:25', '2019-02-23 09:33:25');
INSERT INTO `work_user_tokens` VALUES (481, 1, 1, 'wap', 'user&wap@42a997df61faee7cd4abb5ca4f657aa7', 'user&wap@4ce4cca8a9b07ecda56e20d24885a873', 7200, 1, '2019-02-23 09:47:33', '2019-02-23 09:47:33');
INSERT INTO `work_user_tokens` VALUES (482, 2, 2, 'wap', 'user&wap@ec5c3c5b158433ec68b02439e08f2b83', 'user&wap@82f21f5d7e35885d175c36b110838d98', 7200, 1, '2019-02-23 09:50:15', '2019-02-23 09:50:15');
INSERT INTO `work_user_tokens` VALUES (483, 2, 2, 'app', 'user&app@70d24b758f726e74772fa2adb4b2dba1', 'user&app@e046add80abf67a60c853d9fe06f70bc', 0, 1, '2019-02-23 09:56:56', '2019-02-23 09:56:56');
INSERT INTO `work_user_tokens` VALUES (484, 2, 2, 'app', 'user&app@8f0c916a0d175fca9c00d86d16bc765e', 'user&app@ecdcac8a0fac2ae0c7272758116fa2c6', 0, 1, '2019-02-23 10:24:42', '2019-02-23 10:24:42');
INSERT INTO `work_user_tokens` VALUES (485, 46, 46, 'app', 'user&app@28c8f0f3934453f92937d143a793f74c', 'user&app@e4a5ea9e57ff5ef025ee5cadc18a493d', 0, 1, '2019-02-23 13:19:41', '2019-02-23 13:19:41');
INSERT INTO `work_user_tokens` VALUES (486, 2, 2, 'app', 'user&app@9ae94a5198d500002958e044b8f08bda', 'user&app@b9aa7c5da782e17f333a59e4b76225cd', 0, 1, '2019-02-23 13:21:23', '2019-02-23 13:21:23');
INSERT INTO `work_user_tokens` VALUES (487, 27, 27, 'applet', 'user&applet@72a3010266c2f27e3d6a2c48ef946580', 'user&applet@53f7f7c533661ba05e8a8435420ff5cc', 0, 1, '2019-02-23 14:02:48', '2019-02-23 14:02:48');
INSERT INTO `work_user_tokens` VALUES (488, 66, 66, 'applet', 'user&applet@155110a27b4c77fa643c16ecc0fd91c5', 'user&applet@09c6584f1b38a816ef9a283955d4b8bf', 0, 1, '2019-02-23 16:12:45', '2019-02-23 16:12:45');
INSERT INTO `work_user_tokens` VALUES (489, 15, 15, 'wap', 'user&wap@86b26184229f96d44790cd54bbb5ab38', 'user&wap@a8da0ab1f5e6886f52a862d9d1f54cb2', 7200, 1, '2019-02-23 16:40:46', '2019-02-23 16:40:46');
INSERT INTO `work_user_tokens` VALUES (490, 45, 45, 'app', 'user&app@6c3f20ee9c4062459d2001adc40e8237', 'user&app@dba69bdc3b33716306866e50a52c4297', 0, 1, '2019-02-23 16:46:19', '2019-02-23 16:46:19');
INSERT INTO `work_user_tokens` VALUES (491, 45, 45, 'applet', 'user&applet@86c38fb1e24d44bd329119d15575edd6', 'user&applet@0eb6b826471c21da71efe2650b152037', 0, 1, '2019-02-23 16:47:24', '2019-02-23 16:47:24');
INSERT INTO `work_user_tokens` VALUES (492, 21, 21, 'applet', 'user&applet@9db3cc1669e0acf4ae6f49ebc2cdc8ac', 'user&applet@b115362bdcb3e77bb8e04a4f59d8a8ae', 0, 1, '2019-02-23 16:49:29', '2019-02-23 16:49:29');
INSERT INTO `work_user_tokens` VALUES (493, 14, 14, 'applet', 'user&applet@8185ed4c8bfe95ccce70bfc1c68d8aad', 'user&applet@91f33fac55c77dd8ac1b1b8b50d552b7', 0, 1, '2019-02-23 17:07:10', '2019-02-23 17:07:10');
INSERT INTO `work_user_tokens` VALUES (494, 14, 14, 'applet', 'user&applet@4b21cfd44cf114736130643c25b30b45', 'user&applet@95789139367919958f715b8784e90f27', 0, 1, '2019-02-23 17:07:10', '2019-02-23 17:07:10');
INSERT INTO `work_user_tokens` VALUES (495, 43, 43, 'applet', 'user&applet@1fd8baa42c64acc0e2ab62ce6a4e0bd5', 'user&applet@f4e50018b2da9eef09d99a023071a3c7', 0, 1, '2019-02-23 17:07:51', '2019-02-23 17:07:51');
INSERT INTO `work_user_tokens` VALUES (496, 6, 6, 'applet', 'user&applet@3610649c7bb56a54c1df7caca3848e83', 'user&applet@ef83e247869121f301e9c059853f1d53', 0, 1, '2019-02-25 14:12:25', '2019-02-25 14:12:25');
INSERT INTO `work_user_tokens` VALUES (497, 14, 14, 'app', 'user&app@51fec1632645267f1dcfa3d69fe21279', 'user&app@6c25edbe85e7d6cd48e4cf631480fb82', 0, 1, '2019-02-25 14:44:40', '2019-02-25 14:44:40');
INSERT INTO `work_user_tokens` VALUES (498, 14, 14, 'applet', 'user&applet@7c08c464cdc5bc00396bb967b05903d1', 'user&applet@0e16864229f5ff8322e6b60ca2597e75', 0, 1, '2019-02-25 14:47:10', '2019-02-25 14:47:10');
INSERT INTO `work_user_tokens` VALUES (500, 14, 14, 'applet', 'user&applet@6805644449f08c5c4292a1df0203f12c', 'user&applet@d883b300383999e7e25b95a09dedea41', 0, 1, '2019-02-25 17:48:33', '2019-02-25 17:48:33');
INSERT INTO `work_user_tokens` VALUES (501, 14, 14, 'applet', 'user&applet@13d8557323ea5a6b55b902abf719d3a2', 'user&applet@28b0b0bd01d5cca6e56aad4a60f76d3c', 0, 1, '2019-02-25 17:58:52', '2019-02-25 17:58:52');
INSERT INTO `work_user_tokens` VALUES (502, 14, 14, 'applet', 'user&applet@317de3a20045f76e77aa178bed005a0f', 'user&applet@0e3d44daa929f4163d0e8554ffd07381', 0, 1, '2019-02-25 18:02:45', '2019-02-25 18:02:45');
INSERT INTO `work_user_tokens` VALUES (503, 65, 65, 'applet', 'user&applet@cf8216b93778a1f4fb7843ecabf288c3', 'user&applet@8a68f82a44375eb63ca10102724c4965', 0, 1, '2019-02-26 10:46:18', '2019-02-26 10:46:18');
INSERT INTO `work_user_tokens` VALUES (504, 59, 59, 'wap', 'user&wap@69b0fe61addfcdf0771d7b24028cd251', 'user&wap@51efb6852b0a6c77ccc5e25a76a51763', 7200, 1, '2019-02-26 10:51:43', '2019-02-26 10:51:43');
INSERT INTO `work_user_tokens` VALUES (505, 1, 1, 'applet', 'user&applet@8d7b1a97a1cd3e7d3c03c7036d2ba7d8', 'user&applet@3d9b8d5042b0e7958a45a22f82c2de97', 0, 1, '2019-02-26 13:43:16', '2019-02-26 13:43:16');
INSERT INTO `work_user_tokens` VALUES (506, 1, 1, 'app', 'user&app@6110b042855956d2ef20a30df8a41fef', 'user&app@19f6a2433662547da38e14349fc1f983', 0, 1, '2019-02-26 13:48:00', '2019-02-26 13:48:00');
INSERT INTO `work_user_tokens` VALUES (507, 59, 59, 'wap', 'user&wap@e3406de16edab1c269723a46c4ce5509', 'user&wap@b493d521afb0e07f27390c6e8fe3a477', 7200, 1, '2019-02-26 13:53:01', '2019-02-26 13:53:01');
INSERT INTO `work_user_tokens` VALUES (508, 62, 62, 'pc', 'user&pc@ec36a51549cacda0c6e9a12b97d71d7e', 'user&pc@5402b63472d5d33d5aa62f2c46de6db4', 7200, 1, '2019-03-20 18:23:27', '2019-03-20 18:23:27');
INSERT INTO `work_user_tokens` VALUES (509, 62, 62, 'pc', 'user&pc@92ee6681ff2365619ec4a7bc3c905f67', 'user&pc@7df9234f097fe9f036ed71ad6acf3445', 7200, 1, '2019-03-21 11:23:52', '2019-03-21 11:23:52');
INSERT INTO `work_user_tokens` VALUES (510, 62, 62, 'pc', 'user&pc@f92dd0152d7ae2207cdd78e1ff1ba5b8', 'user&pc@e6f6e779f0ff6b801af2085f55167c43', 7200, 1, '2019-03-21 16:00:44', '2019-03-21 16:00:44');
INSERT INTO `work_user_tokens` VALUES (511, 62, 62, 'pc', 'user&pc@641ac0e1d397eb6a6e9160764fb4d154', 'user&pc@52861d8340ab14d4404924698b6c6b88', 7200, 1, '2019-03-22 10:46:59', '2019-03-22 10:46:59');
INSERT INTO `work_user_tokens` VALUES (512, 62, 62, 'pc', 'user&pc@74d2e574c27085f1a88acca7d52b9fa0', 'user&pc@e7c1d7c931a4c66d80901cd06c0980c4', 7200, 1, '2019-03-22 18:02:37', '2019-03-22 18:02:37');
INSERT INTO `work_user_tokens` VALUES (518, 62, 62, 'pc', 'user&pc@fdc6a020bb8b5c69513df14be8d8de19', 'user&pc@f2bb022e2426f2c1a1f78a5e4e5ce0e4', 7200, 1, '2019-03-24 16:36:58', '2019-03-24 16:36:58');
INSERT INTO `work_user_tokens` VALUES (519, 62, 62, 'pc', 'user&pc@0030c9f279c64faad31f3933989fc41c', 'user&pc@034e1571f23c1a6f57f13b87d5543c37', 7200, 1, '2019-03-25 10:27:25', '2019-03-25 10:27:25');
INSERT INTO `work_user_tokens` VALUES (515, 62, 62, 'pc', 'user&pc@521c55aa029a3f3deb182c2b1ecc4c38', 'user&pc@c0aec81d0fcdb228dd42b7adbe20de0e', 7200, 1, '2019-03-23 14:08:16', '2019-03-23 14:08:16');
INSERT INTO `work_user_tokens` VALUES (516, 7, 7, 'applet', 'user&applet@dbf386c7d4aa98787168de3adccb49b9', 'user&applet@b50c8ced025b62b20391778178c00f3b', 0, 1, '2019-03-23 17:30:08', '2019-03-23 17:30:08');
INSERT INTO `work_user_tokens` VALUES (517, 7, 7, 'applet', 'user&applet@e196e7dd431adc8f565b45a50b33c710', 'user&applet@2d23bc82edc1df25f0a15c94886028af', 0, 1, '2019-03-23 18:12:38', '2019-03-23 18:12:38');
INSERT INTO `work_user_tokens` VALUES (520, 62, 62, 'pc', 'user&pc@c498faf9a8bce7adeb5c1fa902d097b6', 'user&pc@aa251be44f5a69104ca6333c0279420e', 7200, 1, '2019-03-25 11:24:40', '2019-03-25 11:24:40');
INSERT INTO `work_user_tokens` VALUES (521, 62, 62, 'pc', 'user&pc@25c30e93b3c8ce33855d374f49b0fdba', 'user&pc@a66b5822641d80c21c21b870fe0aea28', 7200, 1, '2019-03-25 13:26:21', '2019-03-25 13:26:21');
INSERT INTO `work_user_tokens` VALUES (522, 62, 62, 'pc', 'user&pc@c61238033515724702d159e2651957ed', 'user&pc@47fdddc05523f7a5be3eae15cf57f4d8', 7200, 1, '2019-03-25 13:52:33', '2019-03-25 13:52:33');
INSERT INTO `work_user_tokens` VALUES (523, 7, 7, 'applet', 'user&applet@257246bb18b04814da45b56e272de272', 'user&applet@c03434ffb7e87e65af976824a86dc323', 0, 1, '2019-03-25 13:54:21', '2019-03-25 13:54:21');
INSERT INTO `work_user_tokens` VALUES (524, 7, 7, 'applet', 'user&applet@d0515949319320b8a018812d3c70e287', 'user&applet@aeadb0f7ea6e173fb120f89515afe977', 0, 1, '2019-03-25 14:07:55', '2019-03-25 14:07:55');
INSERT INTO `work_user_tokens` VALUES (525, 7, 7, 'applet', 'user&applet@3fc000b028799c1bc0fcb234d2e9b95f', 'user&applet@50b1a602791182fd8ff679130c935e9a', 0, 1, '2019-03-25 14:33:36', '2019-03-25 14:33:36');
INSERT INTO `work_user_tokens` VALUES (526, 62, 62, 'pc', 'user&pc@295b24913da077f3d98a6de7e4905e82', 'user&pc@877044dec54d22e81706ba639b774a2e', 7200, 1, '2019-03-25 14:55:47', '2019-03-25 14:55:47');
INSERT INTO `work_user_tokens` VALUES (527, 7, 7, 'applet', 'user&applet@8d18462980c08be2348d93cee4536c9f', 'user&applet@42a4cb454854b88d59563c2e1ef9b56f', 0, 1, '2019-03-25 15:01:04', '2019-03-25 15:01:04');
INSERT INTO `work_user_tokens` VALUES (563, 62, 62, 'pc', 'user&pc@48e4d18e954b93276dfe75314cf2b357', 'user&pc@21b33722103972f0210842336abe249e', 7200, 1, '2019-03-27 14:19:11', '2019-03-27 14:19:11');
INSERT INTO `work_user_tokens` VALUES (529, 7, 7, 'applet', 'user&applet@f78caf009f906aa1480873f9f6429308', 'user&applet@c08084afcfa25af4cb8478df8bef1f86', 0, 1, '2019-03-25 17:19:59', '2019-03-25 17:19:59');
INSERT INTO `work_user_tokens` VALUES (530, 7, 7, 'applet', 'user&applet@470d21216bae66220a9e04bb7acd7c42', 'user&applet@c07bf03b9f4788b76d1e77f24b5d6a52', 0, 1, '2019-03-25 17:21:37', '2019-03-25 17:21:37');
INSERT INTO `work_user_tokens` VALUES (531, 7, 7, 'applet', 'user&applet@3f0b7139e6cc9a91a070983bd93a8f62', 'user&applet@fad9c335e2e6e4594f35bf268a08ef29', 0, 1, '2019-03-25 17:24:20', '2019-03-25 17:24:20');
INSERT INTO `work_user_tokens` VALUES (532, 7, 7, 'applet', 'user&applet@085c9e963a3a2a16eaa18d40b3ae96fa', 'user&applet@5c276a132ade1ff4f60a8ba4427faa14', 0, 1, '2019-03-25 17:25:50', '2019-03-25 17:25:50');
INSERT INTO `work_user_tokens` VALUES (533, 7, 7, 'applet', 'user&applet@6770f4047de35f1392cd04cfd5a7cb15', 'user&applet@06e59e75251af6476749697ab9c20b38', 0, 1, '2019-03-25 17:26:44', '2019-03-25 17:26:44');
INSERT INTO `work_user_tokens` VALUES (534, 62, 62, 'pc', 'user&pc@33efbc85e4f81e70dce8969b3ce01b0f', 'user&pc@b1e758d81e8d86a4dc4b54e9f4264cc4', 7200, 1, '2019-03-25 17:27:13', '2019-03-25 17:27:13');
INSERT INTO `work_user_tokens` VALUES (535, 7, 7, 'applet', 'user&applet@471ea3c1a80022d5b825565251171332', 'user&applet@c9177192135fb806475e503808d64d29', 0, 1, '2019-03-25 17:28:14', '2019-03-25 17:28:14');
INSERT INTO `work_user_tokens` VALUES (536, 7, 7, 'applet', 'user&applet@4aa6176fb54622928261174d3183557d', 'user&applet@095a3b74090700d6a8178d4989ed9fb5', 0, 1, '2019-03-25 17:31:24', '2019-03-25 17:31:24');
INSERT INTO `work_user_tokens` VALUES (537, 62, 62, 'pc', 'user&pc@0e93a44490122fd8f5ba79b7b681bec6', 'user&pc@cab4515b1bcabc456ae7fb8a3ba5ec05', 7200, 1, '2019-03-25 17:32:01', '2019-03-25 17:32:01');
INSERT INTO `work_user_tokens` VALUES (538, 7, 7, 'applet', 'user&applet@57d7e7b02e1ad0406069901e2509a43c', 'user&applet@1b7c1da59588c6bbb1ec8b43a3c8d811', 0, 1, '2019-03-25 17:32:29', '2019-03-25 17:32:29');
INSERT INTO `work_user_tokens` VALUES (539, 7, 7, 'applet', 'user&applet@d14d4c11ca0b5caeb7d8d4232f694403', 'user&applet@a4a3ecb4535aecb186e42f68e0c2db19', 0, 1, '2019-03-25 17:35:14', '2019-03-25 17:35:14');
INSERT INTO `work_user_tokens` VALUES (540, 7, 7, 'applet', 'user&applet@ff7dae4da57c1e8bbba5b34550d9bd14', 'user&applet@44bbd6cbddffa3d581b2dc81048475ba', 0, 1, '2019-03-25 17:37:45', '2019-03-25 17:37:45');
INSERT INTO `work_user_tokens` VALUES (541, 7, 7, 'applet', 'user&applet@8691d81dd2d3abb02b0932c5d9c76c2c', 'user&applet@b1460553936514c68f3ab880d3c6a9ae', 0, 1, '2019-03-25 17:40:09', '2019-03-25 17:40:09');
INSERT INTO `work_user_tokens` VALUES (542, 7, 7, 'applet', 'user&applet@10cae1fb2c56664433e6befef6ea2dfe', 'user&applet@066b6e3a5b7717b951098dc38fbb314c', 0, 1, '2019-03-25 17:45:14', '2019-03-25 17:45:14');
INSERT INTO `work_user_tokens` VALUES (543, 62, 62, 'pc', 'user&pc@bc934e2e3cd0640a86c3d727677954f3', 'user&pc@e0958efa2448d84a23251ed42ada32cf', 7200, 1, '2019-03-25 20:52:55', '2019-03-25 20:52:55');
INSERT INTO `work_user_tokens` VALUES (544, 7, 7, 'applet', 'user&applet@70590ef8e1b6f05d98716423ca96d97d', 'user&applet@5b160f3bdfba9d5a4cd267ed1aec9a40', 0, 1, '2019-03-25 20:56:54', '2019-03-25 20:56:54');
INSERT INTO `work_user_tokens` VALUES (545, 62, 62, 'pc', 'user&pc@121f4e4c27b8198737d2d821c1b465ec', 'user&pc@9920e13a6824ac4dd4688cfa14fcd6f8', 7200, 1, '2019-03-25 21:03:40', '2019-03-25 21:03:40');
INSERT INTO `work_user_tokens` VALUES (546, 62, 62, 'pc', 'user&pc@c7a7e0b5e6bc8fc926f12902fe419894', 'user&pc@901cae346b04df6ee64ba0d5af3ee04d', 7200, 1, '2019-03-26 10:37:38', '2019-03-26 10:37:38');
INSERT INTO `work_user_tokens` VALUES (547, 7, 7, 'applet', 'user&applet@ce941c6ea4aa1ee294a1128d20181019', 'user&applet@498a6384d6410fd09230abe1e25446f0', 0, 1, '2019-03-26 13:50:07', '2019-03-26 13:50:07');
INSERT INTO `work_user_tokens` VALUES (548, 7, 7, 'applet', 'user&applet@9889dc509dd9f9a3981433540733a6a1', 'user&applet@7225865fda3cf344ba97c083562dd3a7', 0, 1, '2019-03-26 13:52:04', '2019-03-26 13:52:04');
INSERT INTO `work_user_tokens` VALUES (549, 62, 62, 'pc', 'user&pc@eca79b7eb0e87f9bb99421dc5659d94f', 'user&pc@8d48496c1a91b78fdb309f0fb3bdf939', 7200, 1, '2019-03-26 13:54:53', '2019-03-26 13:54:53');
INSERT INTO `work_user_tokens` VALUES (550, 7, 7, 'applet', 'user&applet@b6bd66c4649135fd62a512c4d3a526e0', 'user&applet@caf29a5ec16056e3558376220aa51c14', 0, 1, '2019-03-26 14:21:00', '2019-03-26 14:21:00');
INSERT INTO `work_user_tokens` VALUES (551, 62, 62, 'pc', 'user&pc@cb6cc63dc96677b879b7bbcf6538ae75', 'user&pc@51caf8ac8a060ef9c39fb6a03c9105fe', 7200, 1, '2019-03-26 14:28:51', '2019-03-26 14:28:51');
INSERT INTO `work_user_tokens` VALUES (552, 62, 62, 'pc', 'user&pc@ebf0d636d4869febe4a87ecc1307a5c9', 'user&pc@83ab4dada585c494e471886e3b98468c', 7200, 1, '2019-03-26 16:59:01', '2019-03-26 16:59:01');
INSERT INTO `work_user_tokens` VALUES (553, 62, 62, 'pc', 'user&pc@0ae10dc1d423ac906824a3bf4b4a8eba', 'user&pc@109021c8b5ecfc56b0b8cb49f1fa5f3e', 7200, 1, '2019-03-26 17:06:25', '2019-03-26 17:06:25');
INSERT INTO `work_user_tokens` VALUES (554, 62, 62, 'pc', 'user&pc@ac9496bbd89e8aa3cc190b867322013e', 'user&pc@f1bb69203542eb50c40fdf9b1405ef6e', 7200, 1, '2019-03-26 17:06:35', '2019-03-26 17:06:35');
INSERT INTO `work_user_tokens` VALUES (555, 62, 62, 'pc', 'user&pc@8f302aa441823dcc25cd9b6d7a194b80', 'user&pc@de1b0b111a07af979b433a05a87ecd0e', 7200, 1, '2019-03-26 20:08:32', '2019-03-26 20:08:32');
INSERT INTO `work_user_tokens` VALUES (556, 7, 7, 'applet', 'user&applet@58c537d10f66079f53b20b00ed917199', 'user&applet@17f965b0f9c16a77f3d869d6e136620b', 0, 1, '2019-03-26 20:12:48', '2019-03-26 20:12:48');
INSERT INTO `work_user_tokens` VALUES (557, 62, 62, 'pc', 'user&pc@23af090cc5df9ebac91fbb86e8246bf5', 'user&pc@72cf017f8d247983af1cafe93b48ec34', 7200, 1, '2019-03-27 10:34:24', '2019-03-27 10:34:24');
INSERT INTO `work_user_tokens` VALUES (558, 62, 62, 'pc', 'user&pc@7cc4de6cad2940fad2eef5c1acd44a3a', 'user&pc@f717e7109f1e213cb139859351e60dfb', 7200, 1, '2019-03-27 10:43:35', '2019-03-27 10:43:35');
INSERT INTO `work_user_tokens` VALUES (559, 7, 7, 'applet', 'user&applet@ceec2a9d1a31349763babf0f2f5b0336', 'user&applet@0b39bd68f86b3e27c469e035c0cccd37', 0, 1, '2019-03-27 11:20:40', '2019-03-27 11:20:40');
INSERT INTO `work_user_tokens` VALUES (560, 62, 62, 'pc', 'user&pc@766eb7ab212968c38719822ecc72f5ca', 'user&pc@37532e6323df5153fc05211252cbc8b9', 7200, 1, '2019-03-27 13:08:23', '2019-03-27 13:08:23');
INSERT INTO `work_user_tokens` VALUES (574, 62, 62, 'pc', 'user&pc@6a61ac0c0fc034f3494c5345d7a03a22', 'user&pc@6a6aeec3550b050995172b70c6a195a1', 7200, 1, '2019-03-28 17:43:11', '2019-03-28 17:43:11');
INSERT INTO `work_user_tokens` VALUES (562, 62, 62, 'pc', 'user&pc@6d0bede1b6ff58aea3eb24ef8e500bca', 'user&pc@df533184a7b7d6e371feff449f05ee9b', 7200, 1, '2019-03-27 14:01:23', '2019-03-27 14:01:23');
INSERT INTO `work_user_tokens` VALUES (564, 7, 7, 'applet', 'user&applet@0d096035a2d3fe8d464a2f7884de91fa', 'user&applet@86bce6886550bdf3262b7ecc5ed2f715', 0, 1, '2019-03-27 14:44:29', '2019-03-27 14:44:29');
INSERT INTO `work_user_tokens` VALUES (565, 7, 7, 'applet', 'user&applet@90b6637d4551354cf9768d7a0165be64', 'user&applet@bcfd4693fb16990010cf88309bbf2fb9', 0, 1, '2019-03-27 15:19:57', '2019-03-27 15:19:57');
INSERT INTO `work_user_tokens` VALUES (566, 7, 7, 'applet', 'user&applet@90336d2f3d7dcadb94eaa627965137ca', 'user&applet@6fed0e640799dba1426eddc9182e9350', 0, 1, '2019-03-27 16:52:20', '2019-03-27 16:52:20');
INSERT INTO `work_user_tokens` VALUES (567, 62, 62, 'pc', 'user&pc@7ff9f889a35386d261417c4fc29be266', 'user&pc@c791cd1e0aac95784bd613a9c994d3e6', 7200, 1, '2019-03-27 20:35:52', '2019-03-27 20:35:52');
INSERT INTO `work_user_tokens` VALUES (568, 7, 7, 'applet', 'user&applet@9dfcf82c5f84b1e6bc5738cd59446546', 'user&applet@70cfeabb0648c79208f34da97ad61ca1', 0, 1, '2019-03-28 16:19:22', '2019-03-28 16:19:22');
INSERT INTO `work_user_tokens` VALUES (569, 7, 7, 'applet', 'user&applet@a21858d534e47417392eea52553b48a8', 'user&applet@7e971235e53bf93c4aecea986c752e35', 0, 1, '2019-03-28 16:25:42', '2019-03-28 16:25:42');
INSERT INTO `work_user_tokens` VALUES (570, 7, 7, 'applet', 'user&applet@4880d4ddad6e831e12f3fe1698bfd1c1', 'user&applet@b8182df43866a772f3554b10d93cd3e1', 0, 1, '2019-03-28 16:39:11', '2019-03-28 16:39:11');
INSERT INTO `work_user_tokens` VALUES (571, 7, 7, 'applet', 'user&applet@9ffa7f23b1e6885edc0e613897f0b643', 'user&applet@3d808405ef3b45557cf9eb31f98051a1', 0, 1, '2019-03-28 16:39:12', '2019-03-28 16:39:12');
INSERT INTO `work_user_tokens` VALUES (572, 62, 62, 'pc', 'user&pc@c2117b874026a62c072e6f4276f01fbd', 'user&pc@da2e8aeb489cf50fb29bd85ca6001c2c', 7200, 1, '2019-03-28 16:49:00', '2019-03-28 16:49:00');
INSERT INTO `work_user_tokens` VALUES (573, 7, 7, 'applet', 'user&applet@77fce4a67dc19da57b35cd1b52336a24', 'user&applet@a54a4b208215067ac81bfd0962cb3fa8', 0, 1, '2019-03-28 17:17:09', '2019-03-28 17:17:09');
INSERT INTO `work_user_tokens` VALUES (575, 7, 7, 'applet', 'user&applet@a0de394ba313be7ed3e0360d038cfc7a', 'user&applet@61304a630270cb4a32d92b8412b7ac2f', 0, 1, '2019-03-28 17:58:21', '2019-03-28 17:58:21');
INSERT INTO `work_user_tokens` VALUES (576, 7, 7, 'applet', 'user&applet@8e5684e557a9395c851d2eefc3b31d40', 'user&applet@415914d90e2d698c024a3c418a5c8717', 0, 1, '2019-03-28 18:00:50', '2019-03-28 18:00:50');
INSERT INTO `work_user_tokens` VALUES (577, 7, 7, 'applet', 'user&applet@9c095701e99ac5b066d9c36cdf8896c8', 'user&applet@0723f1f7e320bcd0b40c05f082bd0778', 0, 1, '2019-03-28 18:32:03', '2019-03-28 18:32:03');
INSERT INTO `work_user_tokens` VALUES (578, 7, 7, 'applet', 'user&applet@04e533aec7011991f2d80f8390c28843', 'user&applet@836345de3d9c5a4a547d0264298d7306', 0, 1, '2019-03-28 18:38:58', '2019-03-28 18:38:58');
INSERT INTO `work_user_tokens` VALUES (579, 7, 7, 'applet', 'user&applet@49f1139d32a3ff3cb3188d1fbd30b28e', 'user&applet@aab150ddb552fb760801a890c1623780', 0, 1, '2019-03-28 18:45:53', '2019-03-28 18:45:53');
INSERT INTO `work_user_tokens` VALUES (580, 7, 7, 'applet', 'user&applet@32f43913da75e117cf1e9c7e00582895', 'user&applet@5bb43a532794fe866e5599397c8a0b61', 0, 1, '2019-03-28 19:49:38', '2019-03-28 19:49:38');
INSERT INTO `work_user_tokens` VALUES (581, 7, 7, 'applet', 'user&applet@ba0b30045237132daf01973eef8a8195', 'user&applet@5e10cdca3a616a3bc164bdd72aa545ea', 0, 1, '2019-03-28 19:55:18', '2019-03-28 19:55:18');
INSERT INTO `work_user_tokens` VALUES (582, 7, 7, 'applet', 'user&applet@6240ab13d57f1de43d2879003be5df8b', 'user&applet@f4678d1cd85f5d3bc4d6c2073f077756', 0, 1, '2019-03-28 19:56:13', '2019-03-28 19:56:13');
INSERT INTO `work_user_tokens` VALUES (583, 7, 7, 'applet', 'user&applet@f401fe1a38af6b8608af0cec0b53412f', 'user&applet@4a44e2d6be55f2df80bf035ae5df2c30', 0, 1, '2019-03-28 19:57:16', '2019-03-28 19:57:16');
INSERT INTO `work_user_tokens` VALUES (584, 7, 7, 'applet', 'user&applet@c7395969fee4812fbbf90ea69e400796', 'user&applet@edce592aa90a893a6d727e8866994e01', 0, 1, '2019-03-28 19:59:28', '2019-03-28 19:59:28');
INSERT INTO `work_user_tokens` VALUES (585, 7, 7, 'applet', 'user&applet@2788b25c31d1cc64845a20b8b9a5b56b', 'user&applet@7cff73129e5bf7bb9e4438675f42c410', 0, 1, '2019-03-28 20:03:48', '2019-03-28 20:03:48');
INSERT INTO `work_user_tokens` VALUES (586, 7, 7, 'applet', 'user&applet@f6d6281f8eed8eb635f19bdf2023f0bb', 'user&applet@619ec01ee65b4e3c0300ff75d54a48b2', 0, 1, '2019-03-28 20:07:37', '2019-03-28 20:07:37');
INSERT INTO `work_user_tokens` VALUES (587, 7, 7, 'applet', 'user&applet@8fb314b98fadaa04886919a8d9091e16', 'user&applet@ab145aa9d86eb495f171dc82c4217165', 0, 1, '2019-03-28 20:49:52', '2019-03-28 20:49:52');
INSERT INTO `work_user_tokens` VALUES (588, 62, 62, 'pc', 'user&pc@64a59fdb7dd31f5607c4327ea5683881', 'user&pc@149f281ef144f276b69bed9946cc010e', 7200, 1, '2019-03-28 20:58:53', '2019-03-28 20:58:53');
INSERT INTO `work_user_tokens` VALUES (589, 62, 62, 'pc', 'user&pc@3c70bd39bffab2dd57de9efef4517f0d', 'user&pc@e6890abd2ed79134bc4b2527541cb1f4', 7200, 1, '2019-03-28 23:50:44', '2019-03-28 23:50:44');
INSERT INTO `work_user_tokens` VALUES (590, 7, 7, 'applet', 'user&applet@e20af88d87c734563a9b7b7ee7572182', 'user&applet@6400e04e9591c613b524ee8b0211e7f6', 0, 1, '2019-03-29 01:13:56', '2019-03-29 01:13:56');
INSERT INTO `work_user_tokens` VALUES (591, 7, 7, 'applet', 'user&applet@4737e8bdf85c4191f00712f68fe4d8ec', 'user&applet@e71d64438bb52339a020485f39a45dc3', 0, 1, '2019-03-29 01:24:05', '2019-03-29 01:24:05');
INSERT INTO `work_user_tokens` VALUES (592, 7, 7, 'applet', 'user&applet@fddb2b7d272418032923772d9d1ce184', 'user&applet@92cda9e78185e52315435bf68629f317', 0, 1, '2019-03-29 01:25:05', '2019-03-29 01:25:05');
COMMIT;

-- ----------------------------
-- Table structure for work_user_visit_logs
-- ----------------------------
DROP TABLE IF EXISTS `work_user_visit_logs`;
CREATE TABLE `work_user_visit_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_account_id` bigint(20) NOT NULL COMMENT '会员账号ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `client_type` varchar(255) NOT NULL COMMENT '客户端类型：pc|wap|app|wechat|applet',
  `ip` varchar(255) NOT NULL COMMENT '访问IP',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=593 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_user_visit_logs
-- ----------------------------
BEGIN;
INSERT INTO `work_user_visit_logs` VALUES (1, 1, 1, 'wap', '113.246.203.142', '2018-11-10 09:28:14', 1, '2018-11-10 09:28:14', '2018-11-10 09:28:14');
INSERT INTO `work_user_visit_logs` VALUES (2, 1, 1, 'wechat', '113.246.203.142', '2018-11-10 09:58:03', 1, '2018-11-10 09:58:03', '2018-11-10 09:58:03');
INSERT INTO `work_user_visit_logs` VALUES (3, 1, 1, 'applet', '113.246.203.142', '2018-11-10 09:59:11', 1, '2018-11-10 09:59:11', '2018-11-10 09:59:11');
INSERT INTO `work_user_visit_logs` VALUES (4, 1, 1, 'app', '113.246.203.142', '2018-11-10 10:07:21', 1, '2018-11-10 10:07:21', '2018-11-10 10:07:21');
INSERT INTO `work_user_visit_logs` VALUES (5, 1, 1, 'applet', '113.246.203.142', '2018-11-10 10:08:19', 1, '2018-11-10 10:08:19', '2018-11-10 10:08:19');
INSERT INTO `work_user_visit_logs` VALUES (6, 2, 2, 'app', '113.246.203.142', '2018-11-10 13:43:52', 1, '2018-11-10 13:43:52', '2018-11-10 13:43:52');
INSERT INTO `work_user_visit_logs` VALUES (7, 2, 2, 'app', '113.246.203.142', '2018-11-10 13:45:54', 1, '2018-11-10 13:45:54', '2018-11-10 13:45:54');
INSERT INTO `work_user_visit_logs` VALUES (8, 2, 2, 'app', '113.246.203.142', '2018-11-10 14:40:53', 1, '2018-11-10 14:40:53', '2018-11-10 14:40:53');
INSERT INTO `work_user_visit_logs` VALUES (9, 2, 2, 'wechat', '113.246.203.142', '2018-11-10 14:56:16', 1, '2018-11-10 14:56:16', '2018-11-10 14:56:16');
INSERT INTO `work_user_visit_logs` VALUES (10, 2, 2, 'app', '113.246.203.142', '2018-11-10 14:58:02', 1, '2018-11-10 14:58:02', '2018-11-10 14:58:02');
INSERT INTO `work_user_visit_logs` VALUES (11, 2, 2, 'applet', '113.246.203.142', '2018-11-10 15:00:29', 1, '2018-11-10 15:00:29', '2018-11-10 15:00:29');
INSERT INTO `work_user_visit_logs` VALUES (12, 3, 3, 'app', '113.246.203.142', '2018-11-10 15:04:28', 1, '2018-11-10 15:04:28', '2018-11-10 15:04:28');
INSERT INTO `work_user_visit_logs` VALUES (13, 4, 4, 'wap', '113.246.203.142', '2018-11-10 15:06:37', 1, '2018-11-10 15:06:37', '2018-11-10 15:06:37');
INSERT INTO `work_user_visit_logs` VALUES (14, 2, 2, 'wechat', '113.246.203.142', '2018-11-10 15:09:09', 1, '2018-11-10 15:09:09', '2018-11-10 15:09:09');
INSERT INTO `work_user_visit_logs` VALUES (15, 2, 2, 'applet', '113.246.203.142', '2018-11-10 15:11:43', 1, '2018-11-10 15:11:43', '2018-11-10 15:11:43');
INSERT INTO `work_user_visit_logs` VALUES (16, 2, 2, 'applet', '113.246.203.142', '2018-11-10 15:38:51', 1, '2018-11-10 15:38:51', '2018-11-10 15:38:51');
INSERT INTO `work_user_visit_logs` VALUES (17, 2, 2, 'applet', '113.246.203.142', '2018-11-10 15:55:44', 1, '2018-11-10 15:55:44', '2018-11-10 15:55:44');
INSERT INTO `work_user_visit_logs` VALUES (18, 1, 1, 'wechat', '113.246.203.142', '2018-11-10 15:58:47', 1, '2018-11-10 15:58:47', '2018-11-10 15:58:47');
INSERT INTO `work_user_visit_logs` VALUES (19, 1, 1, 'wechat', '113.246.203.142', '2018-11-10 16:00:10', 1, '2018-11-10 16:00:10', '2018-11-10 16:00:10');
INSERT INTO `work_user_visit_logs` VALUES (20, 5, 5, 'wechat', '113.246.203.142', '2018-11-10 16:00:30', 1, '2018-11-10 16:00:30', '2018-11-10 16:00:30');
INSERT INTO `work_user_visit_logs` VALUES (21, 1, 1, 'wechat', '113.246.203.142', '2018-11-10 16:24:03', 1, '2018-11-10 16:24:03', '2018-11-10 16:24:03');
INSERT INTO `work_user_visit_logs` VALUES (22, 1, 1, 'wechat', '113.246.203.142', '2018-11-10 16:36:50', 1, '2018-11-10 16:36:50', '2018-11-10 16:36:50');
INSERT INTO `work_user_visit_logs` VALUES (23, 4, 4, 'app', '113.246.203.142', '2018-11-10 16:39:34', 1, '2018-11-10 16:39:34', '2018-11-10 16:39:34');
INSERT INTO `work_user_visit_logs` VALUES (24, 4, 4, 'app', '113.246.203.142', '2018-11-10 16:40:48', 1, '2018-11-10 16:40:48', '2018-11-10 16:40:48');
INSERT INTO `work_user_visit_logs` VALUES (25, 1, 1, 'wechat', '113.246.203.142', '2018-11-10 16:42:35', 1, '2018-11-10 16:42:35', '2018-11-10 16:42:35');
INSERT INTO `work_user_visit_logs` VALUES (26, 6, 6, 'applet', '220.202.235.50', '2018-11-10 16:42:53', 1, '2018-11-10 16:42:53', '2018-11-10 16:42:53');
INSERT INTO `work_user_visit_logs` VALUES (27, 1, 1, 'wechat', '113.246.203.142', '2018-11-10 16:48:35', 1, '2018-11-10 16:48:35', '2018-11-10 16:48:35');
INSERT INTO `work_user_visit_logs` VALUES (28, 7, 7, 'pc', '192.168.31.145', '2018-11-10 17:38:14', 1, '2018-11-10 17:38:14', '2018-11-10 17:38:14');
INSERT INTO `work_user_visit_logs` VALUES (29, 7, 7, 'wap', '192.168.31.145', '2018-11-10 18:39:06', 1, '2018-11-10 18:39:06', '2018-11-10 18:39:06');
INSERT INTO `work_user_visit_logs` VALUES (30, 8, 8, 'wechat', '106.19.195.182', '2018-11-12 11:17:55', 1, '2018-11-12 11:17:55', '2018-11-12 11:17:55');
INSERT INTO `work_user_visit_logs` VALUES (31, 9, 9, 'wap', '113.247.12.57', '2018-11-12 12:45:53', 1, '2018-11-12 12:45:53', '2018-11-12 12:45:53');
INSERT INTO `work_user_visit_logs` VALUES (32, 9, 9, 'wap', '113.247.12.57', '2018-11-12 13:45:19', 1, '2018-11-12 13:45:19', '2018-11-12 13:45:19');
INSERT INTO `work_user_visit_logs` VALUES (33, 9, 9, 'wap', '113.247.12.57', '2018-11-12 13:50:57', 1, '2018-11-12 13:50:57', '2018-11-12 13:50:57');
INSERT INTO `work_user_visit_logs` VALUES (34, 9, 9, 'wap', '113.247.12.57', '2018-11-12 13:51:40', 1, '2018-11-12 13:51:40', '2018-11-12 13:51:40');
INSERT INTO `work_user_visit_logs` VALUES (35, 1, 1, 'applet', '113.247.12.57', '2018-11-12 13:52:16', 1, '2018-11-12 13:52:16', '2018-11-12 13:52:16');
INSERT INTO `work_user_visit_logs` VALUES (36, 1, 1, 'wechat', '113.247.12.57', '2018-11-12 13:53:14', 1, '2018-11-12 13:53:14', '2018-11-12 13:53:14');
INSERT INTO `work_user_visit_logs` VALUES (37, 2, 2, 'app', '113.247.12.57', '2018-11-12 13:53:47', 1, '2018-11-12 13:53:47', '2018-11-12 13:53:47');
INSERT INTO `work_user_visit_logs` VALUES (38, 10, 10, 'wechat', '113.247.12.57', '2018-11-12 14:27:08', 1, '2018-11-12 14:27:08', '2018-11-12 14:27:08');
INSERT INTO `work_user_visit_logs` VALUES (39, 9, 9, 'wap', '113.247.12.57', '2018-11-12 14:45:49', 1, '2018-11-12 14:45:49', '2018-11-12 14:45:49');
INSERT INTO `work_user_visit_logs` VALUES (40, 9, 9, 'wap', '113.247.12.57', '2018-11-12 14:48:41', 1, '2018-11-12 14:48:41', '2018-11-12 14:48:41');
INSERT INTO `work_user_visit_logs` VALUES (41, 9, 9, 'wap', '113.247.12.57', '2018-11-12 14:49:17', 1, '2018-11-12 14:49:17', '2018-11-12 14:49:17');
INSERT INTO `work_user_visit_logs` VALUES (42, 11, 11, 'applet', '113.247.12.57', '2018-11-12 15:08:12', 1, '2018-11-12 15:08:12', '2018-11-12 15:08:12');
INSERT INTO `work_user_visit_logs` VALUES (43, 9, 9, 'wap', '113.247.12.57', '2018-11-12 15:49:05', 1, '2018-11-12 15:49:05', '2018-11-12 15:49:05');
INSERT INTO `work_user_visit_logs` VALUES (44, 9, 9, 'wap', '113.247.12.57', '2018-11-12 15:49:13', 1, '2018-11-12 15:49:13', '2018-11-12 15:49:13');
INSERT INTO `work_user_visit_logs` VALUES (45, 9, 9, 'wap', '113.247.12.57', '2018-11-12 15:49:21', 1, '2018-11-12 15:49:21', '2018-11-12 15:49:21');
INSERT INTO `work_user_visit_logs` VALUES (46, 9, 9, 'wap', '113.247.12.57', '2018-11-12 15:50:35', 1, '2018-11-12 15:50:35', '2018-11-12 15:50:35');
INSERT INTO `work_user_visit_logs` VALUES (47, 9, 9, 'wap', '113.247.12.57', '2018-11-12 15:50:45', 1, '2018-11-12 15:50:45', '2018-11-12 15:50:45');
INSERT INTO `work_user_visit_logs` VALUES (48, 9, 9, 'wap', '113.247.12.57', '2018-11-12 15:50:54', 1, '2018-11-12 15:50:54', '2018-11-12 15:50:54');
INSERT INTO `work_user_visit_logs` VALUES (49, 9, 9, 'wap', '113.247.12.57', '2018-11-12 16:12:15', 1, '2018-11-12 16:12:15', '2018-11-12 16:12:15');
INSERT INTO `work_user_visit_logs` VALUES (50, 9, 9, 'wap', '113.247.12.57', '2018-11-12 16:12:24', 1, '2018-11-12 16:12:24', '2018-11-12 16:12:24');
INSERT INTO `work_user_visit_logs` VALUES (51, 9, 9, 'wap', '113.247.12.57', '2018-11-12 16:12:33', 1, '2018-11-12 16:12:33', '2018-11-12 16:12:33');
INSERT INTO `work_user_visit_logs` VALUES (52, 12, 12, 'applet', '113.247.49.221', '2018-11-12 17:19:46', 1, '2018-11-12 17:19:46', '2018-11-12 17:19:46');
INSERT INTO `work_user_visit_logs` VALUES (53, 4, 4, 'wap', '113.247.12.57', '2018-11-12 17:26:01', 1, '2018-11-12 17:26:01', '2018-11-12 17:26:01');
INSERT INTO `work_user_visit_logs` VALUES (54, 4, 4, 'applet', '117.136.24.191', '2018-11-12 17:37:21', 1, '2018-11-12 17:37:21', '2018-11-12 17:37:21');
INSERT INTO `work_user_visit_logs` VALUES (55, 2, 2, 'applet', '113.247.12.57', '2018-11-12 17:52:01', 1, '2018-11-12 17:52:01', '2018-11-12 17:52:01');
INSERT INTO `work_user_visit_logs` VALUES (56, 2, 2, 'app', '113.247.12.57', '2018-11-12 17:56:23', 1, '2018-11-12 17:56:23', '2018-11-12 17:56:23');
INSERT INTO `work_user_visit_logs` VALUES (57, 13, 13, 'applet', '119.39.76.138', '2018-11-12 22:35:49', 1, '2018-11-12 22:35:49', '2018-11-12 22:35:49');
INSERT INTO `work_user_visit_logs` VALUES (58, 11, 11, 'applet', '175.8.206.65', '2018-11-13 09:30:01', 1, '2018-11-13 09:30:01', '2018-11-13 09:30:01');
INSERT INTO `work_user_visit_logs` VALUES (59, 11, 11, 'applet', '175.8.206.65', '2018-11-13 09:39:12', 1, '2018-11-13 09:39:12', '2018-11-13 09:39:12');
INSERT INTO `work_user_visit_logs` VALUES (60, 13, 13, 'applet', '175.8.206.65', '2018-11-13 10:33:47', 1, '2018-11-13 10:33:47', '2018-11-13 10:33:47');
INSERT INTO `work_user_visit_logs` VALUES (61, 4, 4, 'app', '175.8.206.65', '2018-11-13 10:47:03', 1, '2018-11-13 10:47:03', '2018-11-13 10:47:03');
INSERT INTO `work_user_visit_logs` VALUES (62, 4, 4, 'app', '175.8.206.65', '2018-11-13 10:48:49', 1, '2018-11-13 10:48:49', '2018-11-13 10:48:49');
INSERT INTO `work_user_visit_logs` VALUES (63, 2, 2, 'wechat', '175.8.206.65', '2018-11-13 14:23:59', 1, '2018-11-13 14:23:59', '2018-11-13 14:23:59');
INSERT INTO `work_user_visit_logs` VALUES (64, 9, 9, 'wechat', '175.8.206.65', '2018-11-13 14:24:14', 1, '2018-11-13 14:24:14', '2018-11-13 14:24:14');
INSERT INTO `work_user_visit_logs` VALUES (65, 4, 4, 'wap', '175.8.206.65', '2018-11-13 16:56:28', 1, '2018-11-13 16:56:28', '2018-11-13 16:56:28');
INSERT INTO `work_user_visit_logs` VALUES (66, 14, 14, 'applet', '223.104.130.157', '2018-11-14 10:19:52', 1, '2018-11-14 10:19:52', '2018-11-14 10:19:52');
INSERT INTO `work_user_visit_logs` VALUES (67, 4, 4, 'applet', '175.8.206.65', '2018-11-14 11:10:53', 1, '2018-11-14 11:10:53', '2018-11-14 11:10:53');
INSERT INTO `work_user_visit_logs` VALUES (68, 15, 15, 'applet', '223.104.21.49', '2018-11-14 11:13:22', 1, '2018-11-14 11:13:22', '2018-11-14 11:13:22');
INSERT INTO `work_user_visit_logs` VALUES (69, 16, 16, 'applet', '117.136.88.54', '2018-11-14 14:00:18', 1, '2018-11-14 14:00:18', '2018-11-14 14:00:18');
INSERT INTO `work_user_visit_logs` VALUES (70, 4, 4, 'wechat', '175.8.205.172', '2018-11-15 10:06:27', 1, '2018-11-15 10:06:27', '2018-11-15 10:06:27');
INSERT INTO `work_user_visit_logs` VALUES (71, 13, 13, 'applet', '175.8.205.172', '2018-11-15 10:53:30', 1, '2018-11-15 10:53:30', '2018-11-15 10:53:30');
INSERT INTO `work_user_visit_logs` VALUES (72, 13, 13, 'applet', '175.8.205.172', '2018-11-15 10:54:02', 1, '2018-11-15 10:54:02', '2018-11-15 10:54:02');
INSERT INTO `work_user_visit_logs` VALUES (73, 1, 1, 'app', '175.8.205.172', '2018-11-15 14:51:39', 1, '2018-11-15 14:51:39', '2018-11-15 14:51:39');
INSERT INTO `work_user_visit_logs` VALUES (74, 17, 17, 'app', '175.8.205.172', '2018-11-15 14:52:24', 1, '2018-11-15 14:52:24', '2018-11-15 14:52:24');
INSERT INTO `work_user_visit_logs` VALUES (75, 13, 13, 'applet', '119.39.76.14', '2018-11-15 22:26:28', 1, '2018-11-15 22:26:28', '2018-11-15 22:26:28');
INSERT INTO `work_user_visit_logs` VALUES (76, 13, 13, 'applet', '119.39.76.14', '2018-11-15 22:35:43', 1, '2018-11-15 22:35:43', '2018-11-15 22:35:43');
INSERT INTO `work_user_visit_logs` VALUES (77, 18, 18, 'applet', '113.247.12.100', '2018-11-16 10:18:07', 1, '2018-11-16 10:18:07', '2018-11-16 10:18:07');
INSERT INTO `work_user_visit_logs` VALUES (78, 2, 2, 'wechat', '175.8.205.172', '2018-11-16 13:30:51', 1, '2018-11-16 13:30:51', '2018-11-16 13:30:51');
INSERT INTO `work_user_visit_logs` VALUES (79, 12, 12, 'app', '43.250.201.12', '2018-11-16 13:41:19', 1, '2018-11-16 13:41:19', '2018-11-16 13:41:19');
INSERT INTO `work_user_visit_logs` VALUES (80, 13, 13, 'applet', '175.8.205.172', '2018-11-16 15:05:05', 1, '2018-11-16 15:05:05', '2018-11-16 15:05:05');
INSERT INTO `work_user_visit_logs` VALUES (81, 1, 1, 'wap', '175.8.205.172', '2018-11-16 15:59:45', 1, '2018-11-16 15:59:45', '2018-11-16 15:59:45');
INSERT INTO `work_user_visit_logs` VALUES (82, 19, 19, 'applet', '43.250.200.102', '2018-11-16 17:17:22', 1, '2018-11-16 17:17:22', '2018-11-16 17:17:22');
INSERT INTO `work_user_visit_logs` VALUES (83, 8, 8, 'wechat', '175.8.205.172', '2018-11-16 17:35:46', 1, '2018-11-16 17:35:46', '2018-11-16 17:35:46');
INSERT INTO `work_user_visit_logs` VALUES (84, 4, 4, 'applet', '113.246.203.18', '2018-11-17 09:35:05', 1, '2018-11-17 09:35:05', '2018-11-17 09:35:05');
INSERT INTO `work_user_visit_logs` VALUES (85, 1, 1, 'applet', '140.82.16.16', '2018-11-17 09:53:16', 1, '2018-11-17 09:53:16', '2018-11-17 09:53:16');
INSERT INTO `work_user_visit_logs` VALUES (86, 1, 1, 'wap', '113.246.203.18', '2018-11-17 09:56:10', 1, '2018-11-17 09:56:10', '2018-11-17 09:56:10');
INSERT INTO `work_user_visit_logs` VALUES (87, 1, 1, 'applet', '113.246.203.18', '2018-11-17 09:56:55', 1, '2018-11-17 09:56:55', '2018-11-17 09:56:55');
INSERT INTO `work_user_visit_logs` VALUES (88, 1, 1, 'applet', '113.246.203.18', '2018-11-17 09:58:49', 1, '2018-11-17 09:58:49', '2018-11-17 09:58:49');
INSERT INTO `work_user_visit_logs` VALUES (89, 1, 1, 'app', '113.246.203.18', '2018-11-17 10:44:35', 1, '2018-11-17 10:44:35', '2018-11-17 10:44:35');
INSERT INTO `work_user_visit_logs` VALUES (90, 1, 1, 'applet', '113.246.203.18', '2018-11-17 10:45:03', 1, '2018-11-17 10:45:03', '2018-11-17 10:45:03');
INSERT INTO `work_user_visit_logs` VALUES (91, 1, 1, 'applet', '113.246.203.18', '2018-11-17 10:52:44', 1, '2018-11-17 10:52:44', '2018-11-17 10:52:44');
INSERT INTO `work_user_visit_logs` VALUES (92, 1, 1, 'applet', '113.246.203.18', '2018-11-17 10:53:11', 1, '2018-11-17 10:53:11', '2018-11-17 10:53:11');
INSERT INTO `work_user_visit_logs` VALUES (93, 1, 1, 'wechat', '113.246.203.18', '2018-11-17 11:07:31', 1, '2018-11-17 11:07:31', '2018-11-17 11:07:31');
INSERT INTO `work_user_visit_logs` VALUES (94, 1, 1, 'wechat', '113.246.203.18', '2018-11-17 11:13:32', 1, '2018-11-17 11:13:32', '2018-11-17 11:13:32');
INSERT INTO `work_user_visit_logs` VALUES (95, 1, 1, 'wechat', '113.246.203.18', '2018-11-17 11:41:27', 1, '2018-11-17 11:41:27', '2018-11-17 11:41:27');
INSERT INTO `work_user_visit_logs` VALUES (96, 13, 13, 'applet', '113.246.203.18', '2018-11-17 11:45:37', 1, '2018-11-17 11:45:37', '2018-11-17 11:45:37');
INSERT INTO `work_user_visit_logs` VALUES (97, 10, 10, 'wechat', '113.246.203.18', '2018-11-17 11:53:13', 1, '2018-11-17 11:53:13', '2018-11-17 11:53:13');
INSERT INTO `work_user_visit_logs` VALUES (98, 20, 20, 'wap', '113.246.203.70', '2018-11-17 11:59:22', 1, '2018-11-17 11:59:22', '2018-11-17 11:59:22');
INSERT INTO `work_user_visit_logs` VALUES (99, 21, 21, 'applet', '113.246.202.36', '2018-11-17 13:59:12', 1, '2018-11-17 13:59:12', '2018-11-17 13:59:12');
INSERT INTO `work_user_visit_logs` VALUES (100, 22, 22, 'applet', '113.246.203.18', '2018-11-17 14:17:32', 1, '2018-11-17 14:17:32', '2018-11-17 14:17:32');
INSERT INTO `work_user_visit_logs` VALUES (101, 23, 23, 'applet', '113.246.203.18', '2018-11-17 14:19:54', 1, '2018-11-17 14:19:54', '2018-11-17 14:19:54');
INSERT INTO `work_user_visit_logs` VALUES (102, 4, 4, 'applet', '113.246.203.18', '2018-11-17 15:16:59', 1, '2018-11-17 15:16:59', '2018-11-17 15:16:59');
INSERT INTO `work_user_visit_logs` VALUES (103, 24, 24, 'applet', '113.246.203.18', '2018-11-17 15:21:32', 1, '2018-11-17 15:21:32', '2018-11-17 15:21:32');
INSERT INTO `work_user_visit_logs` VALUES (104, 17, 17, 'applet', '113.246.203.18', '2018-11-17 15:24:11', 1, '2018-11-17 15:24:11', '2018-11-17 15:24:11');
INSERT INTO `work_user_visit_logs` VALUES (105, 1, 1, 'app', '113.246.203.18', '2018-11-17 15:25:20', 1, '2018-11-17 15:25:20', '2018-11-17 15:25:20');
INSERT INTO `work_user_visit_logs` VALUES (106, 23, 23, 'applet', '113.246.203.18', '2018-11-17 15:38:44', 1, '2018-11-17 15:38:44', '2018-11-17 15:38:44');
INSERT INTO `work_user_visit_logs` VALUES (107, 25, 25, 'applet', '113.246.203.18', '2018-11-17 15:39:17', 1, '2018-11-17 15:39:17', '2018-11-17 15:39:17');
INSERT INTO `work_user_visit_logs` VALUES (108, 8, 8, 'applet', '113.246.203.18', '2018-11-17 15:43:52', 1, '2018-11-17 15:43:52', '2018-11-17 15:43:52');
INSERT INTO `work_user_visit_logs` VALUES (109, 26, 26, 'wap', '113.246.203.70', '2018-11-17 15:49:36', 1, '2018-11-17 15:49:36', '2018-11-17 15:49:36');
INSERT INTO `work_user_visit_logs` VALUES (110, 1, 1, 'wap', '113.246.203.18', '2018-11-17 15:51:24', 1, '2018-11-17 15:51:24', '2018-11-17 15:51:24');
INSERT INTO `work_user_visit_logs` VALUES (111, 25, 25, 'applet', '113.246.203.18', '2018-11-17 16:04:55', 1, '2018-11-17 16:04:55', '2018-11-17 16:04:55');
INSERT INTO `work_user_visit_logs` VALUES (112, 17, 17, 'applet', '113.246.203.18', '2018-11-17 16:05:42', 1, '2018-11-17 16:05:42', '2018-11-17 16:05:42');
INSERT INTO `work_user_visit_logs` VALUES (113, 26, 26, 'wap', '113.246.203.70', '2018-11-17 16:17:18', 1, '2018-11-17 16:17:18', '2018-11-17 16:17:18');
INSERT INTO `work_user_visit_logs` VALUES (114, 27, 27, 'applet', '113.246.202.36', '2018-11-17 16:32:15', 1, '2018-11-17 16:32:15', '2018-11-17 16:32:15');
INSERT INTO `work_user_visit_logs` VALUES (115, 4, 4, 'applet', '113.246.203.18', '2018-11-17 16:58:40', 1, '2018-11-17 16:58:40', '2018-11-17 16:58:40');
INSERT INTO `work_user_visit_logs` VALUES (116, 17, 17, 'wechat', '113.246.200.92', '2018-11-19 09:33:22', 1, '2018-11-19 09:33:22', '2018-11-19 09:33:22');
INSERT INTO `work_user_visit_logs` VALUES (117, 8, 8, 'app', '113.246.200.92', '2018-11-19 09:43:12', 1, '2018-11-19 09:43:12', '2018-11-19 09:43:12');
INSERT INTO `work_user_visit_logs` VALUES (118, 10, 10, 'wap', '113.246.200.92', '2018-11-19 09:44:19', 1, '2018-11-19 09:44:19', '2018-11-19 09:44:19');
INSERT INTO `work_user_visit_logs` VALUES (119, 1, 1, 'wap', '113.246.200.92', '2018-11-19 09:47:08', 1, '2018-11-19 09:47:08', '2018-11-19 09:47:08');
INSERT INTO `work_user_visit_logs` VALUES (120, 28, 28, 'applet', '106.17.117.19', '2018-11-19 12:25:10', 1, '2018-11-19 12:25:10', '2018-11-19 12:25:10');
INSERT INTO `work_user_visit_logs` VALUES (121, 29, 29, 'applet', '113.240.197.207', '2018-11-19 12:51:39', 1, '2018-11-19 12:51:39', '2018-11-19 12:51:39');
INSERT INTO `work_user_visit_logs` VALUES (122, 13, 13, 'applet', '113.246.200.92', '2018-11-19 14:22:25', 1, '2018-11-19 14:22:25', '2018-11-19 14:22:25');
INSERT INTO `work_user_visit_logs` VALUES (123, 17, 17, 'applet', '113.246.200.92', '2018-11-19 14:56:51', 1, '2018-11-19 14:56:51', '2018-11-19 14:56:51');
INSERT INTO `work_user_visit_logs` VALUES (124, 4, 4, 'app', '113.246.200.92', '2018-11-19 15:58:47', 1, '2018-11-19 15:58:47', '2018-11-19 15:58:47');
INSERT INTO `work_user_visit_logs` VALUES (125, 30, 30, 'applet', '43.250.200.111', '2018-11-19 16:28:19', 1, '2018-11-19 16:28:19', '2018-11-19 16:28:19');
INSERT INTO `work_user_visit_logs` VALUES (126, 1, 1, 'applet', '113.246.200.92', '2018-11-19 16:31:06', 1, '2018-11-19 16:31:06', '2018-11-19 16:31:06');
INSERT INTO `work_user_visit_logs` VALUES (127, 31, 31, 'app', '113.246.200.92', '2018-11-19 17:32:59', 1, '2018-11-19 17:32:59', '2018-11-19 17:32:59');
INSERT INTO `work_user_visit_logs` VALUES (128, 2, 2, 'wechat', '113.246.200.92', '2018-11-20 09:46:31', 1, '2018-11-20 09:46:31', '2018-11-20 09:46:31');
INSERT INTO `work_user_visit_logs` VALUES (129, 2, 2, 'applet', '113.246.200.92', '2018-11-20 09:49:23', 1, '2018-11-20 09:49:23', '2018-11-20 09:49:23');
INSERT INTO `work_user_visit_logs` VALUES (130, 2, 2, 'applet', '113.246.200.92', '2018-11-20 09:54:42', 1, '2018-11-20 09:54:42', '2018-11-20 09:54:42');
INSERT INTO `work_user_visit_logs` VALUES (131, 2, 2, 'applet', '113.246.200.92', '2018-11-20 10:04:06', 1, '2018-11-20 10:04:06', '2018-11-20 10:04:06');
INSERT INTO `work_user_visit_logs` VALUES (132, 2, 2, 'app', '113.246.200.92', '2018-11-20 10:05:28', 1, '2018-11-20 10:05:28', '2018-11-20 10:05:28');
INSERT INTO `work_user_visit_logs` VALUES (133, 15, 15, 'app', '113.246.200.92', '2018-11-20 10:29:58', 1, '2018-11-20 10:29:58', '2018-11-20 10:29:58');
INSERT INTO `work_user_visit_logs` VALUES (134, 30, 30, 'applet', '113.246.200.92', '2018-11-20 10:37:22', 1, '2018-11-20 10:37:22', '2018-11-20 10:37:22');
INSERT INTO `work_user_visit_logs` VALUES (135, 31, 31, 'applet', '113.246.200.92', '2018-11-20 10:38:03', 1, '2018-11-20 10:38:03', '2018-11-20 10:38:03');
INSERT INTO `work_user_visit_logs` VALUES (136, 3, 3, 'applet', '113.246.200.92', '2018-11-20 10:39:27', 1, '2018-11-20 10:39:27', '2018-11-20 10:39:27');
INSERT INTO `work_user_visit_logs` VALUES (137, 17, 17, 'applet', '113.246.200.92', '2018-11-20 10:41:16', 1, '2018-11-20 10:41:16', '2018-11-20 10:41:16');
INSERT INTO `work_user_visit_logs` VALUES (138, 32, 32, 'applet', '113.246.200.92', '2018-11-20 14:07:51', 1, '2018-11-20 14:07:51', '2018-11-20 14:07:51');
INSERT INTO `work_user_visit_logs` VALUES (139, 1, 1, 'app', '113.246.200.92', '2018-11-20 15:14:48', 1, '2018-11-20 15:14:48', '2018-11-20 15:14:48');
INSERT INTO `work_user_visit_logs` VALUES (140, 31, 31, 'app', '117.136.88.36', '2018-11-20 15:59:36', 1, '2018-11-20 15:59:36', '2018-11-20 15:59:36');
INSERT INTO `work_user_visit_logs` VALUES (141, 33, 33, 'app', '113.246.200.92', '2018-11-20 16:57:45', 1, '2018-11-20 16:57:45', '2018-11-20 16:57:45');
INSERT INTO `work_user_visit_logs` VALUES (142, 15, 15, 'app', '113.246.200.92', '2018-11-20 17:06:18', 1, '2018-11-20 17:06:18', '2018-11-20 17:06:18');
INSERT INTO `work_user_visit_logs` VALUES (143, 15, 15, 'app', '113.246.200.92', '2018-11-20 17:36:03', 1, '2018-11-20 17:36:03', '2018-11-20 17:36:03');
INSERT INTO `work_user_visit_logs` VALUES (144, 15, 15, 'app', '113.246.200.92', '2018-11-20 17:37:12', 1, '2018-11-20 17:37:12', '2018-11-20 17:37:12');
INSERT INTO `work_user_visit_logs` VALUES (145, 15, 15, 'app', '113.246.200.92', '2018-11-20 17:37:43', 1, '2018-11-20 17:37:43', '2018-11-20 17:37:43');
INSERT INTO `work_user_visit_logs` VALUES (146, 32, 32, 'applet', '113.57.246.108', '2018-11-20 23:15:23', 1, '2018-11-20 23:15:23', '2018-11-20 23:15:23');
INSERT INTO `work_user_visit_logs` VALUES (147, 2, 2, 'applet', '42.48.7.158', '2018-11-21 07:23:29', 1, '2018-11-21 07:23:29', '2018-11-21 07:23:29');
INSERT INTO `work_user_visit_logs` VALUES (148, 34, 34, 'app', '113.246.200.178', '2018-11-21 09:09:56', 1, '2018-11-21 09:09:56', '2018-11-21 09:09:56');
INSERT INTO `work_user_visit_logs` VALUES (149, 2, 2, 'app', '113.246.200.178', '2018-11-21 09:12:26', 1, '2018-11-21 09:12:26', '2018-11-21 09:12:26');
INSERT INTO `work_user_visit_logs` VALUES (150, 2, 2, 'app', '113.246.200.178', '2018-11-21 09:12:37', 1, '2018-11-21 09:12:37', '2018-11-21 09:12:37');
INSERT INTO `work_user_visit_logs` VALUES (151, 17, 17, 'applet', '113.246.200.178', '2018-11-21 10:01:16', 1, '2018-11-21 10:01:16', '2018-11-21 10:01:16');
INSERT INTO `work_user_visit_logs` VALUES (152, 2, 2, 'wechat', '113.246.200.178', '2018-11-21 10:02:37', 1, '2018-11-21 10:02:37', '2018-11-21 10:02:37');
INSERT INTO `work_user_visit_logs` VALUES (153, 15, 15, 'wechat', '113.246.200.178', '2018-11-21 13:56:57', 1, '2018-11-21 13:56:57', '2018-11-21 13:56:57');
INSERT INTO `work_user_visit_logs` VALUES (154, 2, 2, 'wap', '113.246.200.178', '2018-11-21 15:45:16', 1, '2018-11-21 15:45:16', '2018-11-21 15:45:16');
INSERT INTO `work_user_visit_logs` VALUES (155, 15, 15, 'applet', '113.246.200.178', '2018-11-22 10:06:59', 1, '2018-11-22 10:06:59', '2018-11-22 10:06:59');
INSERT INTO `work_user_visit_logs` VALUES (156, 15, 15, 'wap', '113.246.200.178', '2018-11-22 10:13:25', 1, '2018-11-22 10:13:25', '2018-11-22 10:13:25');
INSERT INTO `work_user_visit_logs` VALUES (157, 35, 35, 'applet', '113.247.48.89', '2018-11-22 10:18:03', 1, '2018-11-22 10:18:03', '2018-11-22 10:18:03');
INSERT INTO `work_user_visit_logs` VALUES (158, 15, 15, 'applet', '113.246.200.178', '2018-11-22 10:25:31', 1, '2018-11-22 10:25:31', '2018-11-22 10:25:31');
INSERT INTO `work_user_visit_logs` VALUES (159, 15, 15, 'applet', '113.246.200.178', '2018-11-22 11:54:11', 1, '2018-11-22 11:54:11', '2018-11-22 11:54:11');
INSERT INTO `work_user_visit_logs` VALUES (160, 13, 13, 'applet', '113.246.200.178', '2018-11-22 12:42:46', 1, '2018-11-22 12:42:46', '2018-11-22 12:42:46');
INSERT INTO `work_user_visit_logs` VALUES (161, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:12:11', 1, '2018-11-22 16:12:11', '2018-11-22 16:12:11');
INSERT INTO `work_user_visit_logs` VALUES (162, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:12:21', 1, '2018-11-22 16:12:21', '2018-11-22 16:12:21');
INSERT INTO `work_user_visit_logs` VALUES (163, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:12:31', 1, '2018-11-22 16:12:31', '2018-11-22 16:12:31');
INSERT INTO `work_user_visit_logs` VALUES (164, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:14:17', 1, '2018-11-22 16:14:17', '2018-11-22 16:14:17');
INSERT INTO `work_user_visit_logs` VALUES (165, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:14:24', 1, '2018-11-22 16:14:24', '2018-11-22 16:14:24');
INSERT INTO `work_user_visit_logs` VALUES (166, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:14:32', 1, '2018-11-22 16:14:32', '2018-11-22 16:14:32');
INSERT INTO `work_user_visit_logs` VALUES (167, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:14:45', 1, '2018-11-22 16:14:45', '2018-11-22 16:14:45');
INSERT INTO `work_user_visit_logs` VALUES (168, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:14:54', 1, '2018-11-22 16:14:54', '2018-11-22 16:14:54');
INSERT INTO `work_user_visit_logs` VALUES (169, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:15:13', 1, '2018-11-22 16:15:13', '2018-11-22 16:15:13');
INSERT INTO `work_user_visit_logs` VALUES (170, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:15:57', 1, '2018-11-22 16:15:57', '2018-11-22 16:15:57');
INSERT INTO `work_user_visit_logs` VALUES (171, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:16:06', 1, '2018-11-22 16:16:06', '2018-11-22 16:16:06');
INSERT INTO `work_user_visit_logs` VALUES (172, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:16:16', 1, '2018-11-22 16:16:16', '2018-11-22 16:16:16');
INSERT INTO `work_user_visit_logs` VALUES (173, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:17:16', 1, '2018-11-22 16:17:16', '2018-11-22 16:17:16');
INSERT INTO `work_user_visit_logs` VALUES (174, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:19:11', 1, '2018-11-22 16:19:11', '2018-11-22 16:19:11');
INSERT INTO `work_user_visit_logs` VALUES (175, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:19:19', 1, '2018-11-22 16:19:19', '2018-11-22 16:19:19');
INSERT INTO `work_user_visit_logs` VALUES (176, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:19:33', 1, '2018-11-22 16:19:33', '2018-11-22 16:19:33');
INSERT INTO `work_user_visit_logs` VALUES (177, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:20:09', 1, '2018-11-22 16:20:09', '2018-11-22 16:20:09');
INSERT INTO `work_user_visit_logs` VALUES (178, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:20:16', 1, '2018-11-22 16:20:16', '2018-11-22 16:20:16');
INSERT INTO `work_user_visit_logs` VALUES (179, 17, 17, 'applet', '113.246.200.178', '2018-11-22 16:28:14', 1, '2018-11-22 16:28:14', '2018-11-22 16:28:14');
INSERT INTO `work_user_visit_logs` VALUES (180, 17, 17, 'applet', '113.246.200.178', '2018-11-22 16:28:27', 1, '2018-11-22 16:28:27', '2018-11-22 16:28:27');
INSERT INTO `work_user_visit_logs` VALUES (181, 17, 17, 'applet', '113.246.200.178', '2018-11-22 16:28:46', 1, '2018-11-22 16:28:46', '2018-11-22 16:28:46');
INSERT INTO `work_user_visit_logs` VALUES (182, 17, 17, 'applet', '113.246.200.178', '2018-11-22 16:29:11', 1, '2018-11-22 16:29:11', '2018-11-22 16:29:11');
INSERT INTO `work_user_visit_logs` VALUES (183, 17, 17, 'applet', '113.246.200.178', '2018-11-22 16:29:21', 1, '2018-11-22 16:29:21', '2018-11-22 16:29:21');
INSERT INTO `work_user_visit_logs` VALUES (184, 17, 17, 'applet', '113.246.200.178', '2018-11-22 16:29:45', 1, '2018-11-22 16:29:45', '2018-11-22 16:29:45');
INSERT INTO `work_user_visit_logs` VALUES (185, 17, 17, 'applet', '113.246.200.178', '2018-11-22 16:30:04', 1, '2018-11-22 16:30:04', '2018-11-22 16:30:04');
INSERT INTO `work_user_visit_logs` VALUES (186, 17, 17, 'applet', '113.246.200.178', '2018-11-22 16:30:39', 1, '2018-11-22 16:30:39', '2018-11-22 16:30:39');
INSERT INTO `work_user_visit_logs` VALUES (187, 17, 17, 'applet', '113.246.200.178', '2018-11-22 16:30:47', 1, '2018-11-22 16:30:47', '2018-11-22 16:30:47');
INSERT INTO `work_user_visit_logs` VALUES (188, 32, 32, 'applet', '113.246.200.178', '2018-11-22 16:31:52', 1, '2018-11-22 16:31:52', '2018-11-22 16:31:52');
INSERT INTO `work_user_visit_logs` VALUES (189, 17, 17, 'applet', '113.246.200.178', '2018-11-22 16:32:01', 1, '2018-11-22 16:32:01', '2018-11-22 16:32:01');
INSERT INTO `work_user_visit_logs` VALUES (190, 32, 32, 'applet', '113.246.200.178', '2018-11-22 16:32:08', 1, '2018-11-22 16:32:08', '2018-11-22 16:32:08');
INSERT INTO `work_user_visit_logs` VALUES (191, 17, 17, 'applet', '113.246.200.178', '2018-11-22 16:32:15', 1, '2018-11-22 16:32:15', '2018-11-22 16:32:15');
INSERT INTO `work_user_visit_logs` VALUES (192, 17, 17, 'applet', '113.246.200.178', '2018-11-22 16:32:42', 1, '2018-11-22 16:32:42', '2018-11-22 16:32:42');
INSERT INTO `work_user_visit_logs` VALUES (193, 32, 32, 'applet', '113.246.200.178', '2018-11-22 16:33:52', 1, '2018-11-22 16:33:52', '2018-11-22 16:33:52');
INSERT INTO `work_user_visit_logs` VALUES (194, 32, 32, 'applet', '113.246.200.178', '2018-11-22 16:34:23', 1, '2018-11-22 16:34:23', '2018-11-22 16:34:23');
INSERT INTO `work_user_visit_logs` VALUES (195, 1, 1, 'app', '223.104.21.36', '2018-11-22 16:35:29', 1, '2018-11-22 16:35:29', '2018-11-22 16:35:29');
INSERT INTO `work_user_visit_logs` VALUES (196, 1, 1, 'applet', '223.104.21.36', '2018-11-22 16:35:50', 1, '2018-11-22 16:35:50', '2018-11-22 16:35:50');
INSERT INTO `work_user_visit_logs` VALUES (197, 1, 1, 'applet', '223.104.21.36', '2018-11-22 16:36:37', 1, '2018-11-22 16:36:37', '2018-11-22 16:36:37');
INSERT INTO `work_user_visit_logs` VALUES (198, 1, 1, 'applet', '223.104.21.36', '2018-11-22 16:36:46', 1, '2018-11-22 16:36:46', '2018-11-22 16:36:46');
INSERT INTO `work_user_visit_logs` VALUES (199, 1, 1, 'applet', '223.104.21.36', '2018-11-22 16:37:15', 1, '2018-11-22 16:37:15', '2018-11-22 16:37:15');
INSERT INTO `work_user_visit_logs` VALUES (200, 1, 1, 'applet', '223.104.21.36', '2018-11-22 16:37:48', 1, '2018-11-22 16:37:48', '2018-11-22 16:37:48');
INSERT INTO `work_user_visit_logs` VALUES (201, 1, 1, 'applet', '223.104.21.36', '2018-11-22 16:37:58', 1, '2018-11-22 16:37:58', '2018-11-22 16:37:58');
INSERT INTO `work_user_visit_logs` VALUES (202, 17, 17, 'applet', '113.246.200.178', '2018-11-22 16:39:18', 1, '2018-11-22 16:39:18', '2018-11-22 16:39:18');
INSERT INTO `work_user_visit_logs` VALUES (203, 15, 15, 'applet', '113.246.200.178', '2018-11-22 16:40:23', 1, '2018-11-22 16:40:23', '2018-11-22 16:40:23');
INSERT INTO `work_user_visit_logs` VALUES (204, 4, 4, 'applet', '113.246.200.178', '2018-11-22 16:40:41', 1, '2018-11-22 16:40:41', '2018-11-22 16:40:41');
INSERT INTO `work_user_visit_logs` VALUES (205, 4, 4, 'applet', '113.246.200.178', '2018-11-22 16:41:11', 1, '2018-11-22 16:41:11', '2018-11-22 16:41:11');
INSERT INTO `work_user_visit_logs` VALUES (206, 4, 4, 'applet', '113.246.200.178', '2018-11-22 16:41:33', 1, '2018-11-22 16:41:33', '2018-11-22 16:41:33');
INSERT INTO `work_user_visit_logs` VALUES (207, 4, 4, 'applet', '113.246.200.178', '2018-11-22 16:42:23', 1, '2018-11-22 16:42:23', '2018-11-22 16:42:23');
INSERT INTO `work_user_visit_logs` VALUES (208, 4, 4, 'applet', '113.246.200.178', '2018-11-22 16:43:01', 1, '2018-11-22 16:43:01', '2018-11-22 16:43:01');
INSERT INTO `work_user_visit_logs` VALUES (209, 4, 4, 'applet', '113.246.200.178', '2018-11-22 16:43:52', 1, '2018-11-22 16:43:52', '2018-11-22 16:43:52');
INSERT INTO `work_user_visit_logs` VALUES (210, 15, 15, 'applet', '113.246.203.27', '2018-11-23 09:45:06', 1, '2018-11-23 09:45:06', '2018-11-23 09:45:06');
INSERT INTO `work_user_visit_logs` VALUES (211, 15, 15, 'applet', '113.246.203.27', '2018-11-23 09:52:26', 1, '2018-11-23 09:52:26', '2018-11-23 09:52:26');
INSERT INTO `work_user_visit_logs` VALUES (212, 15, 15, 'wap', '113.246.203.27', '2018-11-23 10:15:07', 1, '2018-11-23 10:15:07', '2018-11-23 10:15:07');
INSERT INTO `work_user_visit_logs` VALUES (213, 20, 20, 'wap', '113.246.200.191', '2018-11-23 11:19:44', 1, '2018-11-23 11:19:44', '2018-11-23 11:19:44');
INSERT INTO `work_user_visit_logs` VALUES (214, 15, 15, 'applet', '113.246.203.27', '2018-11-23 11:22:47', 1, '2018-11-23 11:22:47', '2018-11-23 11:22:47');
INSERT INTO `work_user_visit_logs` VALUES (215, 15, 15, 'wechat', '113.246.203.27', '2018-11-23 11:40:37', 1, '2018-11-23 11:40:37', '2018-11-23 11:40:37');
INSERT INTO `work_user_visit_logs` VALUES (216, 15, 15, 'wap', '113.246.203.27', '2018-11-23 11:42:54', 1, '2018-11-23 11:42:54', '2018-11-23 11:42:54');
INSERT INTO `work_user_visit_logs` VALUES (217, 2, 2, 'wechat', '113.246.203.27', '2018-11-23 11:45:20', 1, '2018-11-23 11:45:20', '2018-11-23 11:45:20');
INSERT INTO `work_user_visit_logs` VALUES (218, 17, 17, 'wap', '113.246.203.27', '2018-11-23 11:53:41', 1, '2018-11-23 11:53:41', '2018-11-23 11:53:41');
INSERT INTO `work_user_visit_logs` VALUES (219, 15, 15, 'applet', '113.246.203.27', '2018-11-23 12:06:13', 1, '2018-11-23 12:06:13', '2018-11-23 12:06:13');
INSERT INTO `work_user_visit_logs` VALUES (220, 15, 15, 'applet', '113.246.203.27', '2018-11-23 12:06:36', 1, '2018-11-23 12:06:36', '2018-11-23 12:06:36');
INSERT INTO `work_user_visit_logs` VALUES (221, 4, 4, 'applet', '113.246.203.27', '2018-11-23 15:39:50', 1, '2018-11-23 15:39:50', '2018-11-23 15:39:50');
INSERT INTO `work_user_visit_logs` VALUES (222, 2, 2, 'applet', '113.246.203.27', '2018-11-23 16:02:22', 1, '2018-11-23 16:02:22', '2018-11-23 16:02:22');
INSERT INTO `work_user_visit_logs` VALUES (223, 15, 15, 'wap', '113.246.203.27', '2018-11-23 16:52:12', 1, '2018-11-23 16:52:12', '2018-11-23 16:52:12');
INSERT INTO `work_user_visit_logs` VALUES (224, 15, 15, 'applet', '113.246.203.27', '2018-11-24 11:01:28', 1, '2018-11-24 11:01:28', '2018-11-24 11:01:28');
INSERT INTO `work_user_visit_logs` VALUES (225, 15, 15, 'applet', '113.246.203.27', '2018-11-24 11:01:36', 1, '2018-11-24 11:01:36', '2018-11-24 11:01:36');
INSERT INTO `work_user_visit_logs` VALUES (226, 15, 15, 'applet', '113.246.203.27', '2018-11-24 11:24:33', 1, '2018-11-24 11:24:33', '2018-11-24 11:24:33');
INSERT INTO `work_user_visit_logs` VALUES (227, 15, 15, 'applet', '113.246.203.27', '2018-11-24 11:24:39', 1, '2018-11-24 11:24:39', '2018-11-24 11:24:39');
INSERT INTO `work_user_visit_logs` VALUES (228, 15, 15, 'applet', '113.246.203.27', '2018-11-24 11:25:13', 1, '2018-11-24 11:25:13', '2018-11-24 11:25:13');
INSERT INTO `work_user_visit_logs` VALUES (229, 15, 15, 'applet', '113.246.203.27', '2018-11-24 11:25:22', 1, '2018-11-24 11:25:22', '2018-11-24 11:25:22');
INSERT INTO `work_user_visit_logs` VALUES (230, 15, 15, 'applet', '113.246.203.27', '2018-11-24 11:25:38', 1, '2018-11-24 11:25:38', '2018-11-24 11:25:38');
INSERT INTO `work_user_visit_logs` VALUES (231, 15, 15, 'applet', '113.246.203.27', '2018-11-24 11:25:48', 1, '2018-11-24 11:25:48', '2018-11-24 11:25:48');
INSERT INTO `work_user_visit_logs` VALUES (232, 15, 15, 'applet', '113.246.203.27', '2018-11-24 11:26:10', 1, '2018-11-24 11:26:10', '2018-11-24 11:26:10');
INSERT INTO `work_user_visit_logs` VALUES (233, 4, 4, 'wap', '113.246.203.27', '2018-11-24 13:45:49', 1, '2018-11-24 13:45:49', '2018-11-24 13:45:49');
INSERT INTO `work_user_visit_logs` VALUES (234, 36, 36, 'applet', '113.246.203.27', '2018-11-24 14:10:01', 1, '2018-11-24 14:10:01', '2018-11-24 14:10:01');
INSERT INTO `work_user_visit_logs` VALUES (235, 15, 15, 'wechat', '113.246.203.27', '2018-11-24 14:48:39', 1, '2018-11-24 14:48:39', '2018-11-24 14:48:39');
INSERT INTO `work_user_visit_logs` VALUES (236, 15, 15, 'wap', '113.246.203.27', '2018-11-24 14:56:05', 1, '2018-11-24 14:56:05', '2018-11-24 14:56:05');
INSERT INTO `work_user_visit_logs` VALUES (237, 4, 4, 'wap', '113.246.203.27', '2018-11-24 15:17:47', 1, '2018-11-24 15:17:47', '2018-11-24 15:17:47');
INSERT INTO `work_user_visit_logs` VALUES (238, 15, 15, 'wap', '192.168.31.23', '2018-11-24 15:20:20', 1, '2018-11-24 15:20:20', '2018-11-24 15:20:20');
INSERT INTO `work_user_visit_logs` VALUES (239, 4, 4, 'applet', '113.246.203.27', '2018-11-24 15:22:18', 1, '2018-11-24 15:22:18', '2018-11-24 15:22:18');
INSERT INTO `work_user_visit_logs` VALUES (240, 20, 20, 'wap', '113.246.200.191', '2018-11-24 16:05:43', 1, '2018-11-24 16:05:43', '2018-11-24 16:05:43');
INSERT INTO `work_user_visit_logs` VALUES (241, 7, 7, 'wap', '192.168.31.145', '2018-11-24 16:18:37', 1, '2018-11-24 16:18:37', '2018-11-24 16:18:37');
INSERT INTO `work_user_visit_logs` VALUES (242, 1, 1, 'wap', '113.246.203.27', '2018-11-24 16:15:42', 1, '2018-11-24 16:15:42', '2018-11-24 16:15:42');
INSERT INTO `work_user_visit_logs` VALUES (243, 7, 7, 'wap', '113.246.203.27', '2018-11-24 16:16:40', 1, '2018-11-24 16:16:40', '2018-11-24 16:16:40');
INSERT INTO `work_user_visit_logs` VALUES (244, 1, 1, 'wechat', '113.246.203.27', '2018-11-24 17:01:02', 1, '2018-11-24 17:01:02', '2018-11-24 17:01:02');
INSERT INTO `work_user_visit_logs` VALUES (245, 1, 1, 'wechat', '113.246.203.27', '2018-11-24 17:01:04', 1, '2018-11-24 17:01:04', '2018-11-24 17:01:04');
INSERT INTO `work_user_visit_logs` VALUES (246, 7, 7, 'wap', '192.168.31.61', '2018-11-24 17:13:40', 1, '2018-11-24 17:13:40', '2018-11-24 17:13:40');
INSERT INTO `work_user_visit_logs` VALUES (247, 2, 2, 'wechat', '113.57.246.227', '2018-11-24 19:53:56', 1, '2018-11-24 19:53:56', '2018-11-24 19:53:56');
INSERT INTO `work_user_visit_logs` VALUES (248, 2, 2, 'wechat', '113.57.246.227', '2018-11-24 20:18:01', 1, '2018-11-24 20:18:01', '2018-11-24 20:18:01');
INSERT INTO `work_user_visit_logs` VALUES (249, 2, 2, 'wap', '113.246.202.115', '2018-11-26 09:19:13', 1, '2018-11-26 09:19:13', '2018-11-26 09:19:13');
INSERT INTO `work_user_visit_logs` VALUES (250, 2, 2, 'wechat', '113.246.202.115', '2018-11-26 09:24:29', 1, '2018-11-26 09:24:29', '2018-11-26 09:24:29');
INSERT INTO `work_user_visit_logs` VALUES (251, 37, 37, 'app', '113.246.202.115', '2018-11-26 09:32:37', 1, '2018-11-26 09:32:37', '2018-11-26 09:32:37');
INSERT INTO `work_user_visit_logs` VALUES (252, 2, 2, 'app', '113.246.202.115', '2018-11-26 09:34:51', 1, '2018-11-26 09:34:51', '2018-11-26 09:34:51');
INSERT INTO `work_user_visit_logs` VALUES (253, 2, 2, 'applet', '113.246.202.115', '2018-11-26 09:48:53', 1, '2018-11-26 09:48:53', '2018-11-26 09:48:53');
INSERT INTO `work_user_visit_logs` VALUES (254, 32, 32, 'applet', '113.246.202.115', '2018-11-26 09:50:16', 1, '2018-11-26 09:50:16', '2018-11-26 09:50:16');
INSERT INTO `work_user_visit_logs` VALUES (255, 32, 32, 'wechat', '113.246.202.115', '2018-11-26 09:55:47', 1, '2018-11-26 09:55:47', '2018-11-26 09:55:47');
INSERT INTO `work_user_visit_logs` VALUES (256, 32, 32, 'applet', '113.246.202.115', '2018-11-26 09:57:16', 1, '2018-11-26 09:57:16', '2018-11-26 09:57:16');
INSERT INTO `work_user_visit_logs` VALUES (257, 32, 32, 'applet', '113.246.202.115', '2018-11-26 09:57:31', 1, '2018-11-26 09:57:31', '2018-11-26 09:57:31');
INSERT INTO `work_user_visit_logs` VALUES (258, 2, 2, 'applet', '113.246.202.115', '2018-11-26 10:04:57', 1, '2018-11-26 10:04:57', '2018-11-26 10:04:57');
INSERT INTO `work_user_visit_logs` VALUES (259, 2, 2, 'wechat', '113.246.202.115', '2018-11-26 10:07:21', 1, '2018-11-26 10:07:21', '2018-11-26 10:07:21');
INSERT INTO `work_user_visit_logs` VALUES (260, 17, 17, 'app', '113.246.202.115', '2018-11-26 15:43:42', 1, '2018-11-26 15:43:42', '2018-11-26 15:43:42');
INSERT INTO `work_user_visit_logs` VALUES (261, 7, 7, 'wap', '192.168.31.145', '2018-11-26 16:11:38', 1, '2018-11-26 16:11:38', '2018-11-26 16:11:38');
INSERT INTO `work_user_visit_logs` VALUES (262, 24, 24, 'app', '113.246.202.115', '2018-11-26 16:17:42', 1, '2018-11-26 16:17:42', '2018-11-26 16:17:42');
INSERT INTO `work_user_visit_logs` VALUES (263, 38, 38, 'app', '113.246.202.115', '2018-11-26 16:18:07', 1, '2018-11-26 16:18:07', '2018-11-26 16:18:07');
INSERT INTO `work_user_visit_logs` VALUES (264, 4, 4, 'wap', '113.246.202.115', '2018-11-26 17:58:42', 1, '2018-11-26 17:58:42', '2018-11-26 17:58:42');
INSERT INTO `work_user_visit_logs` VALUES (265, 36, 36, 'wechat', '113.246.202.115', '2018-11-26 17:59:07', 1, '2018-11-26 17:59:07', '2018-11-26 17:59:07');
INSERT INTO `work_user_visit_logs` VALUES (266, 39, 39, 'applet', '223.104.131.171', '2018-11-26 19:23:04', 1, '2018-11-26 19:23:04', '2018-11-26 19:23:04');
INSERT INTO `work_user_visit_logs` VALUES (267, 40, 40, 'wechat', '113.247.49.199', '2018-11-27 10:22:03', 1, '2018-11-27 10:22:03', '2018-11-27 10:22:03');
INSERT INTO `work_user_visit_logs` VALUES (268, 41, 41, 'wechat', '113.247.49.199', '2018-11-27 10:22:47', 1, '2018-11-27 10:22:47', '2018-11-27 10:22:47');
INSERT INTO `work_user_visit_logs` VALUES (269, 40, 40, 'wechat', '113.247.49.199', '2018-11-27 10:23:26', 1, '2018-11-27 10:23:26', '2018-11-27 10:23:26');
INSERT INTO `work_user_visit_logs` VALUES (270, 42, 42, 'app', '113.247.49.199', '2018-11-27 14:30:19', 1, '2018-11-27 14:30:19', '2018-11-27 14:30:19');
INSERT INTO `work_user_visit_logs` VALUES (271, 6, 6, 'applet', '113.246.200.15', '2018-11-27 15:19:39', 1, '2018-11-27 15:19:39', '2018-11-27 15:19:39');
INSERT INTO `work_user_visit_logs` VALUES (272, 4, 4, 'app', '113.247.49.199', '2018-11-27 15:49:02', 1, '2018-11-27 15:49:02', '2018-11-27 15:49:02');
INSERT INTO `work_user_visit_logs` VALUES (273, 43, 43, 'applet', '112.97.63.214', '2018-11-27 18:26:57', 1, '2018-11-27 18:26:57', '2018-11-27 18:26:57');
INSERT INTO `work_user_visit_logs` VALUES (274, 1, 1, 'wechat', '113.247.49.199', '2018-11-28 11:41:51', 1, '2018-11-28 11:41:51', '2018-11-28 11:41:51');
INSERT INTO `work_user_visit_logs` VALUES (275, 4, 4, 'applet', '113.247.49.199', '2018-11-28 11:54:23', 1, '2018-11-28 11:54:23', '2018-11-28 11:54:23');
INSERT INTO `work_user_visit_logs` VALUES (276, 17, 17, 'wechat', '113.247.49.199', '2018-11-28 11:57:15', 1, '2018-11-28 11:57:15', '2018-11-28 11:57:15');
INSERT INTO `work_user_visit_logs` VALUES (277, 17, 17, 'app', '113.247.49.199', '2018-11-28 14:04:08', 1, '2018-11-28 14:04:08', '2018-11-28 14:04:08');
INSERT INTO `work_user_visit_logs` VALUES (278, 4, 4, 'app', '113.247.49.199', '2018-11-28 14:05:03', 1, '2018-11-28 14:05:03', '2018-11-28 14:05:03');
INSERT INTO `work_user_visit_logs` VALUES (279, 4, 4, 'app', '113.247.49.199', '2018-11-28 14:05:30', 1, '2018-11-28 14:05:30', '2018-11-28 14:05:30');
INSERT INTO `work_user_visit_logs` VALUES (280, 4, 4, 'app', '113.247.49.199', '2018-11-28 14:49:17', 1, '2018-11-28 14:49:17', '2018-11-28 14:49:17');
INSERT INTO `work_user_visit_logs` VALUES (281, 17, 17, 'wechat', '113.247.49.199', '2018-11-28 15:07:53', 1, '2018-11-28 15:07:53', '2018-11-28 15:07:53');
INSERT INTO `work_user_visit_logs` VALUES (282, 4, 4, 'app', '113.247.49.199', '2018-11-28 15:12:10', 1, '2018-11-28 15:12:10', '2018-11-28 15:12:10');
INSERT INTO `work_user_visit_logs` VALUES (283, 4, 4, 'app', '113.247.49.199', '2018-11-28 15:12:18', 1, '2018-11-28 15:12:18', '2018-11-28 15:12:18');
INSERT INTO `work_user_visit_logs` VALUES (284, 44, 44, 'wap', '113.247.49.199', '2018-11-28 15:28:58', 1, '2018-11-28 15:28:58', '2018-11-28 15:28:58');
INSERT INTO `work_user_visit_logs` VALUES (285, 45, 45, 'applet', '117.136.24.173', '2018-11-28 17:35:38', 1, '2018-11-28 17:35:38', '2018-11-28 17:35:38');
INSERT INTO `work_user_visit_logs` VALUES (286, 4, 4, 'wap', '113.247.49.199', '2018-11-28 17:35:57', 1, '2018-11-28 17:35:57', '2018-11-28 17:35:57');
INSERT INTO `work_user_visit_logs` VALUES (287, 44, 44, 'wap', '113.247.49.199', '2018-11-28 17:37:35', 1, '2018-11-28 17:37:35', '2018-11-28 17:37:35');
INSERT INTO `work_user_visit_logs` VALUES (288, 13, 13, 'applet', '175.8.204.141', '2018-11-29 12:27:07', 1, '2018-11-29 12:27:07', '2018-11-29 12:27:07');
INSERT INTO `work_user_visit_logs` VALUES (289, 17, 17, 'app', '175.8.204.141', '2018-11-29 15:30:09', 1, '2018-11-29 15:30:09', '2018-11-29 15:30:09');
INSERT INTO `work_user_visit_logs` VALUES (290, 4, 4, 'app', '175.8.204.141', '2018-11-29 15:40:50', 1, '2018-11-29 15:40:50', '2018-11-29 15:40:50');
INSERT INTO `work_user_visit_logs` VALUES (291, 2, 2, 'wap', '175.8.204.141', '2018-11-29 16:35:17', 1, '2018-11-29 16:35:17', '2018-11-29 16:35:17');
INSERT INTO `work_user_visit_logs` VALUES (292, 46, 46, 'wechat', '175.8.204.141', '2018-11-29 16:38:18', 1, '2018-11-29 16:38:18', '2018-11-29 16:38:18');
INSERT INTO `work_user_visit_logs` VALUES (293, 2, 2, 'wechat', '175.8.204.141', '2018-11-29 16:42:14', 1, '2018-11-29 16:42:14', '2018-11-29 16:42:14');
INSERT INTO `work_user_visit_logs` VALUES (294, 46, 46, 'wechat', '175.8.204.141', '2018-11-29 17:17:40', 1, '2018-11-29 17:17:40', '2018-11-29 17:17:40');
INSERT INTO `work_user_visit_logs` VALUES (295, 2, 2, 'app', '175.8.204.141', '2018-11-30 10:04:59', 1, '2018-11-30 10:04:59', '2018-11-30 10:04:59');
INSERT INTO `work_user_visit_logs` VALUES (296, 2, 2, 'wechat', '175.8.204.141', '2018-11-30 10:05:37', 1, '2018-11-30 10:05:37', '2018-11-30 10:05:37');
INSERT INTO `work_user_visit_logs` VALUES (297, 13, 13, 'applet', '175.8.204.141', '2018-11-30 10:23:15', 1, '2018-11-30 10:23:15', '2018-11-30 10:23:15');
INSERT INTO `work_user_visit_logs` VALUES (298, 47, 47, 'app', '175.8.204.141', '2018-11-30 11:28:49', 1, '2018-11-30 11:28:49', '2018-11-30 11:28:49');
INSERT INTO `work_user_visit_logs` VALUES (299, 26, 26, 'applet', '113.246.202.231', '2018-11-30 12:03:55', 1, '2018-11-30 12:03:55', '2018-11-30 12:03:55');
INSERT INTO `work_user_visit_logs` VALUES (300, 13, 13, 'applet', '175.8.204.141', '2018-11-30 14:36:16', 1, '2018-11-30 14:36:16', '2018-11-30 14:36:16');
INSERT INTO `work_user_visit_logs` VALUES (301, 20, 20, 'wap', '113.246.202.231', '2018-11-30 15:39:45', 1, '2018-11-30 15:39:45', '2018-11-30 15:39:45');
INSERT INTO `work_user_visit_logs` VALUES (302, 43, 43, 'pc', '113.247.14.147', '2018-12-01 11:12:44', 1, '2018-12-01 11:12:44', '2018-12-01 11:12:44');
INSERT INTO `work_user_visit_logs` VALUES (303, 43, 43, 'app', '113.247.14.147', '2018-12-01 11:46:51', 1, '2018-12-01 11:46:51', '2018-12-01 11:46:51');
INSERT INTO `work_user_visit_logs` VALUES (304, 19, 19, 'app', '113.247.14.147', '2018-12-01 11:46:57', 1, '2018-12-01 11:46:57', '2018-12-01 11:46:57');
INSERT INTO `work_user_visit_logs` VALUES (305, 48, 48, 'app', '113.247.14.147', '2018-12-01 15:03:02', 1, '2018-12-01 15:03:02', '2018-12-01 15:03:02');
INSERT INTO `work_user_visit_logs` VALUES (306, 2, 2, 'app', '113.246.202.65', '2018-12-01 15:09:19', 1, '2018-12-01 15:09:19', '2018-12-01 15:09:19');
INSERT INTO `work_user_visit_logs` VALUES (307, 48, 48, 'pc', '113.247.14.109', '2018-12-03 09:02:34', 1, '2018-12-03 09:02:34', '2018-12-03 09:02:34');
INSERT INTO `work_user_visit_logs` VALUES (308, 44, 44, 'wap', '175.8.207.100', '2018-12-03 09:39:49', 1, '2018-12-03 09:39:49', '2018-12-03 09:39:49');
INSERT INTO `work_user_visit_logs` VALUES (309, 15, 15, 'wap', '175.8.207.100', '2018-12-03 11:17:09', 1, '2018-12-03 11:17:09', '2018-12-03 11:17:09');
INSERT INTO `work_user_visit_logs` VALUES (310, 48, 48, 'pc', '113.247.14.109', '2018-12-03 11:47:02', 1, '2018-12-03 11:47:02', '2018-12-03 11:47:02');
INSERT INTO `work_user_visit_logs` VALUES (311, 15, 15, 'app', '175.8.207.100', '2018-12-03 12:08:38', 1, '2018-12-03 12:08:38', '2018-12-03 12:08:38');
INSERT INTO `work_user_visit_logs` VALUES (312, 49, 49, 'applet', '175.8.207.100', '2018-12-03 13:42:17', 1, '2018-12-03 13:42:17', '2018-12-03 13:42:17');
INSERT INTO `work_user_visit_logs` VALUES (313, 49, 49, 'app', '175.8.207.100', '2018-12-03 13:47:34', 1, '2018-12-03 13:47:34', '2018-12-03 13:47:34');
INSERT INTO `work_user_visit_logs` VALUES (314, 15, 15, 'wap', '175.8.207.100', '2018-12-03 14:34:34', 1, '2018-12-03 14:34:34', '2018-12-03 14:34:34');
INSERT INTO `work_user_visit_logs` VALUES (315, 15, 15, 'wap', '0.0.0.0', '2018-12-03 14:36:09', 1, '2018-12-03 14:36:09', '2018-12-03 14:36:09');
INSERT INTO `work_user_visit_logs` VALUES (316, 15, 15, 'wap', '175.8.207.100', '2018-12-03 14:38:10', 1, '2018-12-03 14:38:10', '2018-12-03 14:38:10');
INSERT INTO `work_user_visit_logs` VALUES (317, 13, 13, 'applet', '175.8.207.100', '2018-12-03 14:39:59', 1, '2018-12-03 14:39:59', '2018-12-03 14:39:59');
INSERT INTO `work_user_visit_logs` VALUES (318, 13, 13, 'applet', '175.8.207.100', '2018-12-03 14:40:48', 1, '2018-12-03 14:40:48', '2018-12-03 14:40:48');
INSERT INTO `work_user_visit_logs` VALUES (319, 13, 13, 'applet', '175.8.207.100', '2018-12-03 14:46:25', 1, '2018-12-03 14:46:25', '2018-12-03 14:46:25');
INSERT INTO `work_user_visit_logs` VALUES (320, 4, 4, 'wechat', '175.8.207.100', '2018-12-03 15:33:25', 1, '2018-12-03 15:33:25', '2018-12-03 15:33:25');
INSERT INTO `work_user_visit_logs` VALUES (321, 2, 2, 'wap', '175.8.207.100', '2018-12-03 16:11:30', 1, '2018-12-03 16:11:30', '2018-12-03 16:11:30');
INSERT INTO `work_user_visit_logs` VALUES (322, 2, 2, 'wechat', '175.8.207.100', '2018-12-03 17:13:00', 1, '2018-12-03 17:13:00', '2018-12-03 17:13:00');
INSERT INTO `work_user_visit_logs` VALUES (323, 15, 15, 'app', '175.8.207.100', '2018-12-03 17:38:32', 1, '2018-12-03 17:38:32', '2018-12-03 17:38:32');
INSERT INTO `work_user_visit_logs` VALUES (324, 9, 9, 'wechat', '175.8.207.100', '2018-12-03 18:21:53', 1, '2018-12-03 18:21:53', '2018-12-03 18:21:53');
INSERT INTO `work_user_visit_logs` VALUES (325, 9, 9, 'wechat', '175.8.207.100', '2018-12-03 18:22:31', 1, '2018-12-03 18:22:31', '2018-12-03 18:22:31');
INSERT INTO `work_user_visit_logs` VALUES (326, 2, 2, 'wechat', '175.8.207.100', '2018-12-03 18:25:02', 1, '2018-12-03 18:25:02', '2018-12-03 18:25:02');
INSERT INTO `work_user_visit_logs` VALUES (327, 15, 15, 'app', '175.8.207.100', '2018-12-03 18:26:12', 1, '2018-12-03 18:26:12', '2018-12-03 18:26:12');
INSERT INTO `work_user_visit_logs` VALUES (328, 9, 9, 'app', '175.8.207.100', '2018-12-03 18:52:15', 1, '2018-12-03 18:52:15', '2018-12-03 18:52:15');
INSERT INTO `work_user_visit_logs` VALUES (329, 2, 2, 'app', '175.8.207.100', '2018-12-03 18:55:22', 1, '2018-12-03 18:55:22', '2018-12-03 18:55:22');
INSERT INTO `work_user_visit_logs` VALUES (330, 2, 2, 'applet', '175.8.207.100', '2018-12-03 19:05:36', 1, '2018-12-03 19:05:36', '2018-12-03 19:05:36');
INSERT INTO `work_user_visit_logs` VALUES (331, 4, 4, 'applet', '175.8.207.100', '2018-12-04 10:26:44', 1, '2018-12-04 10:26:44', '2018-12-04 10:26:44');
INSERT INTO `work_user_visit_logs` VALUES (332, 4, 4, 'applet', '175.8.207.100', '2018-12-04 10:28:28', 1, '2018-12-04 10:28:28', '2018-12-04 10:28:28');
INSERT INTO `work_user_visit_logs` VALUES (333, 15, 15, 'app', '223.104.21.19', '2018-12-04 11:08:58', 1, '2018-12-04 11:08:58', '2018-12-04 11:08:58');
INSERT INTO `work_user_visit_logs` VALUES (334, 15, 15, 'app', '175.8.207.100', '2018-12-04 11:30:57', 1, '2018-12-04 11:30:57', '2018-12-04 11:30:57');
INSERT INTO `work_user_visit_logs` VALUES (335, 4, 4, 'app', '175.8.207.100', '2018-12-04 11:35:27', 1, '2018-12-04 11:35:27', '2018-12-04 11:35:27');
INSERT INTO `work_user_visit_logs` VALUES (336, 50, 50, 'app', '175.8.207.100', '2018-12-04 14:02:20', 1, '2018-12-04 14:02:20', '2018-12-04 14:02:20');
INSERT INTO `work_user_visit_logs` VALUES (337, 4, 4, 'applet', '175.8.207.100', '2018-12-04 14:04:41', 1, '2018-12-04 14:04:41', '2018-12-04 14:04:41');
INSERT INTO `work_user_visit_logs` VALUES (338, 51, 51, 'app', '175.8.207.100', '2018-12-04 14:07:35', 1, '2018-12-04 14:07:35', '2018-12-04 14:07:35');
INSERT INTO `work_user_visit_logs` VALUES (339, 15, 15, 'app', '175.8.207.100', '2018-12-04 14:08:03', 1, '2018-12-04 14:08:03', '2018-12-04 14:08:03');
INSERT INTO `work_user_visit_logs` VALUES (340, 4, 4, 'app', '175.8.207.100', '2018-12-04 14:10:19', 1, '2018-12-04 14:10:19', '2018-12-04 14:10:19');
INSERT INTO `work_user_visit_logs` VALUES (341, 52, 52, 'app', '175.8.207.100', '2018-12-04 14:11:54', 1, '2018-12-04 14:11:54', '2018-12-04 14:11:54');
INSERT INTO `work_user_visit_logs` VALUES (342, 53, 53, 'app', '175.8.207.100', '2018-12-04 14:13:04', 1, '2018-12-04 14:13:04', '2018-12-04 14:13:04');
INSERT INTO `work_user_visit_logs` VALUES (343, 54, 54, 'app', '175.8.207.100', '2018-12-04 14:14:09', 1, '2018-12-04 14:14:09', '2018-12-04 14:14:09');
INSERT INTO `work_user_visit_logs` VALUES (344, 55, 55, 'applet', '175.8.207.100', '2018-12-04 14:14:58', 1, '2018-12-04 14:14:58', '2018-12-04 14:14:58');
INSERT INTO `work_user_visit_logs` VALUES (345, 15, 15, 'app', '175.8.207.100', '2018-12-04 14:26:09', 1, '2018-12-04 14:26:09', '2018-12-04 14:26:09');
INSERT INTO `work_user_visit_logs` VALUES (346, 13, 13, 'applet', '175.8.207.100', '2018-12-04 15:26:15', 1, '2018-12-04 15:26:15', '2018-12-04 15:26:15');
INSERT INTO `work_user_visit_logs` VALUES (347, 4, 4, 'applet', '175.8.207.100', '2018-12-04 17:03:08', 1, '2018-12-04 17:03:08', '2018-12-04 17:03:08');
INSERT INTO `work_user_visit_logs` VALUES (348, 15, 15, 'applet', '175.8.207.100', '2018-12-04 17:03:27', 1, '2018-12-04 17:03:27', '2018-12-04 17:03:27');
INSERT INTO `work_user_visit_logs` VALUES (349, 4, 4, 'applet', '175.8.207.100', '2018-12-04 17:05:09', 1, '2018-12-04 17:05:09', '2018-12-04 17:05:09');
INSERT INTO `work_user_visit_logs` VALUES (350, 4, 4, 'applet', '175.8.207.100', '2018-12-04 17:06:09', 1, '2018-12-04 17:06:09', '2018-12-04 17:06:09');
INSERT INTO `work_user_visit_logs` VALUES (351, 15, 15, 'applet', '175.8.207.100', '2018-12-04 17:06:11', 1, '2018-12-04 17:06:11', '2018-12-04 17:06:11');
INSERT INTO `work_user_visit_logs` VALUES (352, 20, 20, 'wap', '175.8.207.100', '2018-12-04 17:06:15', 1, '2018-12-04 17:06:15', '2018-12-04 17:06:15');
INSERT INTO `work_user_visit_logs` VALUES (353, 4, 4, 'applet', '175.8.207.100', '2018-12-04 17:06:23', 1, '2018-12-04 17:06:23', '2018-12-04 17:06:23');
INSERT INTO `work_user_visit_logs` VALUES (354, 4, 4, 'applet', '175.8.207.100', '2018-12-04 17:06:36', 1, '2018-12-04 17:06:36', '2018-12-04 17:06:36');
INSERT INTO `work_user_visit_logs` VALUES (355, 17, 17, 'applet', '175.8.207.100', '2018-12-04 17:06:57', 1, '2018-12-04 17:06:57', '2018-12-04 17:06:57');
INSERT INTO `work_user_visit_logs` VALUES (356, 4, 4, 'applet', '175.8.207.100', '2018-12-04 17:15:40', 1, '2018-12-04 17:15:40', '2018-12-04 17:15:40');
INSERT INTO `work_user_visit_logs` VALUES (357, 17, 17, 'applet', '175.8.207.100', '2018-12-04 17:16:09', 1, '2018-12-04 17:16:09', '2018-12-04 17:16:09');
INSERT INTO `work_user_visit_logs` VALUES (358, 1, 1, 'wechat', '113.247.51.134', '2018-12-04 20:38:18', 1, '2018-12-04 20:38:18', '2018-12-04 20:38:18');
INSERT INTO `work_user_visit_logs` VALUES (359, 56, 56, 'applet', '113.247.13.64', '2018-12-05 09:51:56', 1, '2018-12-05 09:51:56', '2018-12-05 09:51:56');
INSERT INTO `work_user_visit_logs` VALUES (360, 1, 1, 'applet', '140.82.16.16', '2018-12-05 16:18:53', 1, '2018-12-05 16:18:53', '2018-12-05 16:18:53');
INSERT INTO `work_user_visit_logs` VALUES (361, 55, 55, 'app', '106.19.177.183', '2018-12-05 16:48:53', 1, '2018-12-05 16:48:53', '2018-12-05 16:48:53');
INSERT INTO `work_user_visit_logs` VALUES (362, 57, 57, 'applet', '113.247.14.36', '2018-12-05 19:00:00', 1, '2018-12-05 19:00:00', '2018-12-05 19:00:00');
INSERT INTO `work_user_visit_logs` VALUES (363, 58, 58, 'app', '113.247.14.36', '2018-12-05 20:23:41', 1, '2018-12-05 20:23:41', '2018-12-05 20:23:41');
INSERT INTO `work_user_visit_logs` VALUES (364, 49, 49, 'app', '183.92.250.221', '2018-12-06 11:29:07', 1, '2018-12-06 11:29:07', '2018-12-06 11:29:07');
INSERT INTO `work_user_visit_logs` VALUES (365, 13, 13, 'applet', '113.247.14.36', '2018-12-06 14:23:47', 1, '2018-12-06 14:23:47', '2018-12-06 14:23:47');
INSERT INTO `work_user_visit_logs` VALUES (366, 1, 1, 'wechat', '113.247.14.36', '2018-12-06 15:34:48', 1, '2018-12-06 15:34:48', '2018-12-06 15:34:48');
INSERT INTO `work_user_visit_logs` VALUES (367, 1, 1, 'applet', '117.136.88.41', '2018-12-06 15:37:12', 1, '2018-12-06 15:37:12', '2018-12-06 15:37:12');
INSERT INTO `work_user_visit_logs` VALUES (368, 49, 49, 'app', '117.136.88.41', '2018-12-06 15:38:22', 1, '2018-12-06 15:38:22', '2018-12-06 15:38:22');
INSERT INTO `work_user_visit_logs` VALUES (369, 15, 15, 'app', '113.247.14.36', '2018-12-06 16:00:13', 1, '2018-12-06 16:00:13', '2018-12-06 16:00:13');
INSERT INTO `work_user_visit_logs` VALUES (370, 2, 2, 'app', '113.246.203.21', '2018-12-06 18:32:40', 1, '2018-12-06 18:32:40', '2018-12-06 18:32:40');
INSERT INTO `work_user_visit_logs` VALUES (371, 2, 2, 'applet', '113.246.203.21', '2018-12-06 18:38:48', 1, '2018-12-06 18:38:48', '2018-12-06 18:38:48');
INSERT INTO `work_user_visit_logs` VALUES (372, 49, 49, 'applet', '113.246.203.21', '2018-12-06 19:00:31', 1, '2018-12-06 19:00:31', '2018-12-06 19:00:31');
INSERT INTO `work_user_visit_logs` VALUES (373, 49, 49, 'applet', '117.136.88.41', '2018-12-06 19:53:49', 1, '2018-12-06 19:53:49', '2018-12-06 19:53:49');
INSERT INTO `work_user_visit_logs` VALUES (374, 20, 20, 'wap', '113.247.13.64', '2018-12-06 20:05:11', 1, '2018-12-06 20:05:11', '2018-12-06 20:05:11');
INSERT INTO `work_user_visit_logs` VALUES (375, 49, 49, 'applet', '36.157.229.35', '2018-12-06 22:51:51', 1, '2018-12-06 22:51:51', '2018-12-06 22:51:51');
INSERT INTO `work_user_visit_logs` VALUES (376, 49, 49, 'applet', '113.246.203.21', '2018-12-07 09:15:19', 1, '2018-12-07 09:15:19', '2018-12-07 09:15:19');
INSERT INTO `work_user_visit_logs` VALUES (377, 1, 1, 'app', '113.246.203.21', '2018-12-07 09:22:32', 1, '2018-12-07 09:22:32', '2018-12-07 09:22:32');
INSERT INTO `work_user_visit_logs` VALUES (378, 12, 12, 'applet', '220.202.152.114', '2018-12-07 09:29:31', 1, '2018-12-07 09:29:31', '2018-12-07 09:29:31');
INSERT INTO `work_user_visit_logs` VALUES (379, 49, 49, 'wap', '113.247.48.217', '2018-12-07 09:32:04', 1, '2018-12-07 09:32:04', '2018-12-07 09:32:04');
INSERT INTO `work_user_visit_logs` VALUES (380, 49, 49, 'applet', '220.202.152.114', '2018-12-07 09:32:41', 1, '2018-12-07 09:32:41', '2018-12-07 09:32:41');
INSERT INTO `work_user_visit_logs` VALUES (381, 8, 8, 'app', '113.247.51.150', '2019-01-22 14:05:26', 1, '2019-01-22 14:05:26', '2019-01-22 14:05:26');
INSERT INTO `work_user_visit_logs` VALUES (382, 15, 15, 'applet', '113.247.51.150', '2019-01-22 14:10:17', 1, '2019-01-22 14:10:17', '2019-01-22 14:10:17');
INSERT INTO `work_user_visit_logs` VALUES (383, 21, 21, 'applet', '113.247.48.154', '2019-01-22 14:30:09', 1, '2019-01-22 14:30:09', '2019-01-22 14:30:09');
INSERT INTO `work_user_visit_logs` VALUES (384, 18, 18, 'applet', '113.247.48.154', '2019-01-22 14:41:47', 1, '2019-01-22 14:41:47', '2019-01-22 14:41:47');
INSERT INTO `work_user_visit_logs` VALUES (385, 1, 1, 'applet', '113.247.51.150', '2019-01-22 15:04:48', 1, '2019-01-22 15:04:48', '2019-01-22 15:04:48');
INSERT INTO `work_user_visit_logs` VALUES (386, 49, 49, 'applet', '113.247.51.150', '2019-01-22 15:25:24', 1, '2019-01-22 15:25:24', '2019-01-22 15:25:24');
INSERT INTO `work_user_visit_logs` VALUES (387, 1, 1, 'wap', '127.0.0.1', '2019-01-22 16:33:39', 1, '2019-01-22 16:33:39', '2019-01-22 16:33:39');
INSERT INTO `work_user_visit_logs` VALUES (388, 6, 6, 'applet', '223.104.21.58', '2019-01-23 09:34:25', 1, '2019-01-23 09:34:25', '2019-01-23 09:34:25');
INSERT INTO `work_user_visit_logs` VALUES (389, 1, 1, 'applet', '112.17.156.182', '2019-01-23 09:55:56', 1, '2019-01-23 09:55:56', '2019-01-23 09:55:56');
INSERT INTO `work_user_visit_logs` VALUES (390, 6, 6, 'applet', '106.16.135.45', '2019-01-23 10:02:05', 1, '2019-01-23 10:02:05', '2019-01-23 10:02:05');
INSERT INTO `work_user_visit_logs` VALUES (391, 1, 1, 'applet', '113.247.51.150', '2019-01-23 10:12:37', 1, '2019-01-23 10:12:37', '2019-01-23 10:12:37');
INSERT INTO `work_user_visit_logs` VALUES (392, 6, 6, 'applet', '117.136.89.116', '2019-01-23 10:46:00', 1, '2019-01-23 10:46:00', '2019-01-23 10:46:00');
INSERT INTO `work_user_visit_logs` VALUES (393, 1, 1, 'applet', '113.247.51.150', '2019-01-23 11:37:24', 1, '2019-01-23 11:37:24', '2019-01-23 11:37:24');
INSERT INTO `work_user_visit_logs` VALUES (394, 2, 2, 'app', '113.247.51.150', '2019-01-23 16:57:09', 1, '2019-01-23 16:57:09', '2019-01-23 16:57:09');
INSERT INTO `work_user_visit_logs` VALUES (395, 48, 48, 'applet', '113.246.201.10', '2019-01-24 09:38:01', 1, '2019-01-24 09:38:01', '2019-01-24 09:38:01');
INSERT INTO `work_user_visit_logs` VALUES (396, 43, 43, 'applet', '113.246.201.10', '2019-01-24 10:11:46', 1, '2019-01-24 10:11:46', '2019-01-24 10:11:46');
INSERT INTO `work_user_visit_logs` VALUES (397, 7, 7, 'wap', '113.247.12.81', '2019-01-24 10:17:27', 1, '2019-01-24 10:17:27', '2019-01-24 10:17:27');
INSERT INTO `work_user_visit_logs` VALUES (398, 59, 59, 'wap', '113.247.12.81', '2019-01-24 14:58:07', 1, '2019-01-24 14:58:07', '2019-01-24 14:58:07');
INSERT INTO `work_user_visit_logs` VALUES (399, 15, 15, 'applet', '113.247.12.81', '2019-01-24 15:21:24', 1, '2019-01-24 15:21:24', '2019-01-24 15:21:24');
INSERT INTO `work_user_visit_logs` VALUES (400, 48, 48, 'applet', '113.246.201.10', '2019-01-24 17:16:11', 1, '2019-01-24 17:16:11', '2019-01-24 17:16:11');
INSERT INTO `work_user_visit_logs` VALUES (401, 45, 45, 'applet', '117.136.89.100', '2019-01-24 18:47:11', 1, '2019-01-24 18:47:11', '2019-01-24 18:47:11');
INSERT INTO `work_user_visit_logs` VALUES (402, 17, 17, 'applet', '113.247.12.81', '2019-01-25 15:14:56', 1, '2019-01-25 15:14:56', '2019-01-25 15:14:56');
INSERT INTO `work_user_visit_logs` VALUES (403, 17, 17, 'app', '113.247.12.81', '2019-01-25 15:27:28', 1, '2019-01-25 15:27:28', '2019-01-25 15:27:28');
INSERT INTO `work_user_visit_logs` VALUES (404, 17, 17, 'applet', '113.247.12.81', '2019-01-25 15:35:34', 1, '2019-01-25 15:35:34', '2019-01-25 15:35:34');
INSERT INTO `work_user_visit_logs` VALUES (405, 59, 59, 'applet', '113.247.12.81', '2019-01-25 17:20:41', 1, '2019-01-25 17:20:41', '2019-01-25 17:20:41');
INSERT INTO `work_user_visit_logs` VALUES (406, 7, 7, 'wap', '113.246.201.228', '2019-01-26 11:39:17', 1, '2019-01-26 11:39:17', '2019-01-26 11:39:17');
INSERT INTO `work_user_visit_logs` VALUES (407, 7, 7, 'wap', '113.246.201.228', '2019-01-26 11:40:22', 1, '2019-01-26 11:40:22', '2019-01-26 11:40:22');
INSERT INTO `work_user_visit_logs` VALUES (408, 1, 1, 'app', '113.246.201.228', '2019-01-26 14:28:29', 1, '2019-01-26 14:28:29', '2019-01-26 14:28:29');
INSERT INTO `work_user_visit_logs` VALUES (409, 1, 1, 'wap', '0.0.0.0', '2019-01-26 14:38:56', 1, '2019-01-26 14:38:56', '2019-01-26 14:38:56');
INSERT INTO `work_user_visit_logs` VALUES (410, 1, 1, 'wap', '0.0.0.0', '2019-01-26 15:56:44', 1, '2019-01-26 15:56:44', '2019-01-26 15:56:44');
INSERT INTO `work_user_visit_logs` VALUES (411, 19, 19, 'applet', '113.246.202.245', '2019-01-26 17:59:28', 1, '2019-01-26 17:59:28', '2019-01-26 17:59:28');
INSERT INTO `work_user_visit_logs` VALUES (412, 11, 11, 'wechat', '113.246.202.78', '2019-01-28 10:16:02', 1, '2019-01-28 10:16:02', '2019-01-28 10:16:02');
INSERT INTO `work_user_visit_logs` VALUES (413, 45, 45, 'applet', '223.104.130.185', '2019-01-28 10:16:07', 1, '2019-01-28 10:16:07', '2019-01-28 10:16:07');
INSERT INTO `work_user_visit_logs` VALUES (414, 2, 2, 'wechat', '113.246.202.78', '2019-01-28 10:16:25', 1, '2019-01-28 10:16:25', '2019-01-28 10:16:25');
INSERT INTO `work_user_visit_logs` VALUES (415, 11, 11, 'applet', '113.246.202.78', '2019-01-28 13:50:01', 1, '2019-01-28 13:50:01', '2019-01-28 13:50:01');
INSERT INTO `work_user_visit_logs` VALUES (416, 1, 1, 'app', '113.246.202.78', '2019-01-28 15:21:32', 1, '2019-01-28 15:21:32', '2019-01-28 15:21:32');
INSERT INTO `work_user_visit_logs` VALUES (417, 1, 1, 'app', '113.246.202.78', '2019-01-28 15:22:14', 1, '2019-01-28 15:22:14', '2019-01-28 15:22:14');
INSERT INTO `work_user_visit_logs` VALUES (418, 1, 1, 'app', '113.246.202.78', '2019-01-28 15:23:17', 1, '2019-01-28 15:23:17', '2019-01-28 15:23:17');
INSERT INTO `work_user_visit_logs` VALUES (419, 1, 1, 'app', '113.246.202.78', '2019-01-28 15:24:58', 1, '2019-01-28 15:24:58', '2019-01-28 15:24:58');
INSERT INTO `work_user_visit_logs` VALUES (420, 1, 1, 'app', '113.246.202.78', '2019-01-28 15:28:33', 1, '2019-01-28 15:28:33', '2019-01-28 15:28:33');
INSERT INTO `work_user_visit_logs` VALUES (421, 1, 1, 'app', '113.246.202.78', '2019-01-28 15:30:10', 1, '2019-01-28 15:30:10', '2019-01-28 15:30:10');
INSERT INTO `work_user_visit_logs` VALUES (422, 1, 1, 'app', '113.246.202.78', '2019-01-28 15:33:36', 1, '2019-01-28 15:33:36', '2019-01-28 15:33:36');
INSERT INTO `work_user_visit_logs` VALUES (423, 1, 1, 'app', '113.246.202.78', '2019-01-28 15:36:20', 1, '2019-01-28 15:36:20', '2019-01-28 15:36:20');
INSERT INTO `work_user_visit_logs` VALUES (424, 1, 1, 'app', '113.246.202.78', '2019-01-28 15:37:33', 1, '2019-01-28 15:37:33', '2019-01-28 15:37:33');
INSERT INTO `work_user_visit_logs` VALUES (425, 1, 1, 'wap', '0.0.0.0', '2019-01-28 15:40:50', 1, '2019-01-28 15:40:50', '2019-01-28 15:40:50');
INSERT INTO `work_user_visit_logs` VALUES (426, 1, 1, 'app', '113.246.202.78', '2019-01-28 17:30:04', 1, '2019-01-28 17:30:04', '2019-01-28 17:30:04');
INSERT INTO `work_user_visit_logs` VALUES (427, 1, 1, 'wap', '113.246.202.78', '2019-01-28 17:32:42', 1, '2019-01-28 17:32:42', '2019-01-28 17:32:42');
INSERT INTO `work_user_visit_logs` VALUES (428, 15, 15, 'wechat', '175.8.205.104', '2019-01-29 16:44:36', 1, '2019-01-29 16:44:36', '2019-01-29 16:44:36');
INSERT INTO `work_user_visit_logs` VALUES (429, 17, 17, 'wechat', '175.8.205.104', '2019-01-29 17:30:00', 1, '2019-01-29 17:30:00', '2019-01-29 17:30:00');
INSERT INTO `work_user_visit_logs` VALUES (430, 22, 22, 'wechat', '175.8.205.104', '2019-01-29 17:30:27', 1, '2019-01-29 17:30:27', '2019-01-29 17:30:27');
INSERT INTO `work_user_visit_logs` VALUES (431, 59, 59, 'applet', '175.8.205.104', '2019-01-30 10:47:12', 1, '2019-01-30 10:47:12', '2019-01-30 10:47:12');
INSERT INTO `work_user_visit_logs` VALUES (432, 16, 16, 'applet', '117.136.24.182', '2019-02-04 17:51:46', 1, '2019-02-04 17:51:46', '2019-02-04 17:51:46');
INSERT INTO `work_user_visit_logs` VALUES (433, 17, 17, 'wechat', '106.19.101.13', '2019-02-11 11:27:23', 1, '2019-02-11 11:27:23', '2019-02-11 11:27:23');
INSERT INTO `work_user_visit_logs` VALUES (434, 60, 60, 'wap', '175.8.206.32', '2019-02-11 11:33:31', 1, '2019-02-11 11:33:31', '2019-02-11 11:33:31');
INSERT INTO `work_user_visit_logs` VALUES (435, 60, 60, 'wap', '175.8.206.32', '2019-02-11 11:33:50', 1, '2019-02-11 11:33:50', '2019-02-11 11:33:50');
INSERT INTO `work_user_visit_logs` VALUES (436, 56, 56, 'applet', '113.247.51.187', '2019-02-13 11:33:28', 1, '2019-02-13 11:33:28', '2019-02-13 11:33:28');
INSERT INTO `work_user_visit_logs` VALUES (437, 2, 2, 'applet', '113.247.51.68', '2019-02-13 15:33:26', 1, '2019-02-13 15:33:26', '2019-02-13 15:33:26');
INSERT INTO `work_user_visit_logs` VALUES (438, 61, 61, 'wechat', '113.247.51.68', '2019-02-13 15:41:32', 1, '2019-02-13 15:41:32', '2019-02-13 15:41:32');
INSERT INTO `work_user_visit_logs` VALUES (439, 8, 8, 'applet', '113.247.51.68', '2019-02-13 16:01:53', 1, '2019-02-13 16:01:53', '2019-02-13 16:01:53');
INSERT INTO `work_user_visit_logs` VALUES (440, 27, 27, 'applet', '112.17.156.182', '2019-02-14 10:47:40', 1, '2019-02-14 10:47:40', '2019-02-14 10:47:40');
INSERT INTO `work_user_visit_logs` VALUES (441, 2, 2, 'applet', '175.8.205.135', '2019-02-14 11:29:54', 1, '2019-02-14 11:29:54', '2019-02-14 11:29:54');
INSERT INTO `work_user_visit_logs` VALUES (442, 62, 62, 'wechat', '175.8.205.135', '2019-02-14 17:55:51', 1, '2019-02-14 17:55:51', '2019-02-14 17:55:51');
INSERT INTO `work_user_visit_logs` VALUES (443, 63, 63, 'wechat', '175.8.205.135', '2019-02-14 17:59:45', 1, '2019-02-14 17:59:45', '2019-02-14 17:59:45');
INSERT INTO `work_user_visit_logs` VALUES (444, 62, 62, 'applet', '175.8.205.135', '2019-02-14 18:07:18', 1, '2019-02-14 18:07:18', '2019-02-14 18:07:18');
INSERT INTO `work_user_visit_logs` VALUES (445, 63, 63, 'applet', '175.8.205.135', '2019-02-14 18:10:05', 1, '2019-02-14 18:10:05', '2019-02-14 18:10:05');
INSERT INTO `work_user_visit_logs` VALUES (446, 2, 2, 'applet', '192.168.31.137', '2019-02-22 10:10:45', 1, '2019-02-22 10:10:45', '2019-02-22 10:10:45');
INSERT INTO `work_user_visit_logs` VALUES (447, 49, 49, 'applet', '119.39.248.124', '2019-02-22 10:16:07', 1, '2019-02-22 10:16:07', '2019-02-22 10:16:07');
INSERT INTO `work_user_visit_logs` VALUES (448, 1, 1, 'wap', '0.0.0.0', '2019-02-22 10:38:02', 1, '2019-02-22 10:38:02', '2019-02-22 10:38:02');
INSERT INTO `work_user_visit_logs` VALUES (449, 6, 6, 'applet', '113.247.13.159', '2019-02-22 10:38:32', 1, '2019-02-22 10:38:32', '2019-02-22 10:38:32');
INSERT INTO `work_user_visit_logs` VALUES (450, 64, 64, 'applet', '223.104.131.204', '2019-02-22 11:02:25', 1, '2019-02-22 11:02:25', '2019-02-22 11:02:25');
INSERT INTO `work_user_visit_logs` VALUES (451, 64, 64, 'applet', '113.247.13.163', '2019-02-22 11:23:39', 1, '2019-02-22 11:23:39', '2019-02-22 11:23:39');
INSERT INTO `work_user_visit_logs` VALUES (452, 64, 64, 'applet', '113.247.13.163', '2019-02-22 11:25:33', 1, '2019-02-22 11:25:33', '2019-02-22 11:25:33');
INSERT INTO `work_user_visit_logs` VALUES (453, 49, 49, 'applet', '113.247.13.163', '2019-02-22 11:29:01', 1, '2019-02-22 11:29:01', '2019-02-22 11:29:01');
INSERT INTO `work_user_visit_logs` VALUES (454, 2, 2, 'applet', '113.247.13.163', '2019-02-22 11:37:42', 1, '2019-02-22 11:37:42', '2019-02-22 11:37:42');
INSERT INTO `work_user_visit_logs` VALUES (455, 20, 20, 'applet', '113.247.13.163', '2019-02-22 11:38:25', 1, '2019-02-22 11:38:25', '2019-02-22 11:38:25');
INSERT INTO `work_user_visit_logs` VALUES (456, 18, 18, 'applet', '113.247.13.159', '2019-02-22 11:41:21', 1, '2019-02-22 11:41:21', '2019-02-22 11:41:21');
INSERT INTO `work_user_visit_logs` VALUES (457, 65, 65, 'applet', '113.247.13.159', '2019-02-22 13:12:12', 1, '2019-02-22 13:12:12', '2019-02-22 13:12:12');
INSERT INTO `work_user_visit_logs` VALUES (458, 14, 14, 'applet', '113.247.13.159', '2019-02-22 13:47:51', 1, '2019-02-22 13:47:51', '2019-02-22 13:47:51');
INSERT INTO `work_user_visit_logs` VALUES (459, 2, 2, 'app', '113.247.51.55', '2019-02-22 15:14:48', 1, '2019-02-22 15:14:48', '2019-02-22 15:14:48');
INSERT INTO `work_user_visit_logs` VALUES (460, 19, 19, 'applet', '43.250.200.67', '2019-02-22 15:26:19', 1, '2019-02-22 15:26:19', '2019-02-22 15:26:19');
INSERT INTO `work_user_visit_logs` VALUES (461, 1, 1, 'applet', '192.168.31.137', '2019-02-22 15:39:13', 1, '2019-02-22 15:39:14', '2019-02-22 15:39:14');
INSERT INTO `work_user_visit_logs` VALUES (462, 1, 1, 'applet', '192.168.31.137', '2019-02-22 15:43:40', 1, '2019-02-22 15:43:40', '2019-02-22 15:43:40');
INSERT INTO `work_user_visit_logs` VALUES (463, 1, 1, 'app', '113.247.51.55', '2019-02-22 15:47:35', 1, '2019-02-22 15:47:35', '2019-02-22 15:47:35');
INSERT INTO `work_user_visit_logs` VALUES (464, 2, 2, 'applet', '113.247.51.55', '2019-02-22 15:53:03', 1, '2019-02-22 15:53:03', '2019-02-22 15:53:03');
INSERT INTO `work_user_visit_logs` VALUES (465, 2, 2, 'applet', '113.247.51.55', '2019-02-22 16:01:47', 1, '2019-02-22 16:01:47', '2019-02-22 16:01:47');
INSERT INTO `work_user_visit_logs` VALUES (466, 14, 14, 'applet', '113.247.13.159', '2019-02-22 16:12:46', 1, '2019-02-22 16:12:46', '2019-02-22 16:12:46');
INSERT INTO `work_user_visit_logs` VALUES (467, 61, 61, 'app', '113.247.51.55', '2019-02-22 16:39:13', 1, '2019-02-22 16:39:13', '2019-02-22 16:39:13');
INSERT INTO `work_user_visit_logs` VALUES (468, 48, 48, 'applet', '43.250.200.44', '2019-02-22 16:40:07', 1, '2019-02-22 16:40:07', '2019-02-22 16:40:07');
INSERT INTO `work_user_visit_logs` VALUES (469, 2, 2, 'app', '113.247.51.55', '2019-02-22 16:40:18', 1, '2019-02-22 16:40:18', '2019-02-22 16:40:18');
INSERT INTO `work_user_visit_logs` VALUES (470, 46, 46, 'app', '113.247.51.55', '2019-02-22 16:40:48', 1, '2019-02-22 16:40:48', '2019-02-22 16:40:48');
INSERT INTO `work_user_visit_logs` VALUES (471, 2, 2, 'app', '113.247.51.55', '2019-02-22 16:41:24', 1, '2019-02-22 16:41:24', '2019-02-22 16:41:24');
INSERT INTO `work_user_visit_logs` VALUES (472, 61, 61, 'app', '113.247.51.55', '2019-02-22 16:42:25', 1, '2019-02-22 16:42:25', '2019-02-22 16:42:25');
INSERT INTO `work_user_visit_logs` VALUES (473, 2, 2, 'app', '113.247.51.55', '2019-02-22 16:43:07', 1, '2019-02-22 16:43:07', '2019-02-22 16:43:07');
INSERT INTO `work_user_visit_logs` VALUES (474, 8, 8, 'app', '113.218.29.196', '2019-02-22 17:34:50', 1, '2019-02-22 17:34:50', '2019-02-22 17:34:50');
INSERT INTO `work_user_visit_logs` VALUES (475, 59, 59, 'applet', '119.39.76.1', '2019-02-23 00:26:19', 1, '2019-02-23 00:26:19', '2019-02-23 00:26:19');
INSERT INTO `work_user_visit_logs` VALUES (476, 66, 66, 'applet', '119.39.248.32', '2019-02-23 08:36:04', 1, '2019-02-23 08:36:04', '2019-02-23 08:36:04');
INSERT INTO `work_user_visit_logs` VALUES (477, 2, 2, 'applet', '119.39.248.32', '2019-02-23 08:38:10', 1, '2019-02-23 08:38:10', '2019-02-23 08:38:10');
INSERT INTO `work_user_visit_logs` VALUES (478, 2, 2, 'applet', '119.39.248.32', '2019-02-23 08:39:45', 1, '2019-02-23 08:39:45', '2019-02-23 08:39:45');
INSERT INTO `work_user_visit_logs` VALUES (479, 2, 2, 'applet', '113.247.13.197', '2019-02-23 09:22:03', 1, '2019-02-23 09:22:03', '2019-02-23 09:22:03');
INSERT INTO `work_user_visit_logs` VALUES (480, 2, 2, 'app', '113.247.13.197', '2019-02-23 09:33:25', 1, '2019-02-23 09:33:25', '2019-02-23 09:33:25');
INSERT INTO `work_user_visit_logs` VALUES (481, 1, 1, 'wap', '113.247.13.197', '2019-02-23 09:47:33', 1, '2019-02-23 09:47:33', '2019-02-23 09:47:33');
INSERT INTO `work_user_visit_logs` VALUES (482, 2, 2, 'wap', '113.247.13.197', '2019-02-23 09:50:15', 1, '2019-02-23 09:50:15', '2019-02-23 09:50:15');
INSERT INTO `work_user_visit_logs` VALUES (483, 2, 2, 'app', '113.247.13.197', '2019-02-23 09:56:56', 1, '2019-02-23 09:56:56', '2019-02-23 09:56:56');
INSERT INTO `work_user_visit_logs` VALUES (484, 2, 2, 'app', '113.247.13.197', '2019-02-23 10:24:42', 1, '2019-02-23 10:24:42', '2019-02-23 10:24:42');
INSERT INTO `work_user_visit_logs` VALUES (485, 46, 46, 'app', '113.247.13.197', '2019-02-23 13:19:41', 1, '2019-02-23 13:19:41', '2019-02-23 13:19:41');
INSERT INTO `work_user_visit_logs` VALUES (486, 2, 2, 'app', '113.247.13.197', '2019-02-23 13:21:23', 1, '2019-02-23 13:21:23', '2019-02-23 13:21:23');
INSERT INTO `work_user_visit_logs` VALUES (487, 27, 27, 'applet', '112.17.156.182', '2019-02-23 14:02:48', 1, '2019-02-23 14:02:48', '2019-02-23 14:02:48');
INSERT INTO `work_user_visit_logs` VALUES (488, 66, 66, 'applet', '113.246.200.38', '2019-02-23 16:12:45', 1, '2019-02-23 16:12:45', '2019-02-23 16:12:45');
INSERT INTO `work_user_visit_logs` VALUES (489, 15, 15, 'wap', '113.247.13.197', '2019-02-23 16:40:46', 1, '2019-02-23 16:40:46', '2019-02-23 16:40:46');
INSERT INTO `work_user_visit_logs` VALUES (490, 45, 45, 'app', '113.246.200.4', '2019-02-23 16:46:19', 1, '2019-02-23 16:46:19', '2019-02-23 16:46:19');
INSERT INTO `work_user_visit_logs` VALUES (491, 45, 45, 'applet', '113.246.200.4', '2019-02-23 16:47:24', 1, '2019-02-23 16:47:24', '2019-02-23 16:47:24');
INSERT INTO `work_user_visit_logs` VALUES (492, 21, 21, 'applet', '113.246.200.4', '2019-02-23 16:49:29', 1, '2019-02-23 16:49:29', '2019-02-23 16:49:29');
INSERT INTO `work_user_visit_logs` VALUES (493, 14, 14, 'applet', '117.136.89.113', '2019-02-23 17:07:10', 1, '2019-02-23 17:07:10', '2019-02-23 17:07:10');
INSERT INTO `work_user_visit_logs` VALUES (494, 14, 14, 'applet', '117.136.89.113', '2019-02-23 17:07:10', 1, '2019-02-23 17:07:10', '2019-02-23 17:07:10');
INSERT INTO `work_user_visit_logs` VALUES (495, 43, 43, 'applet', '113.246.200.4', '2019-02-23 17:07:51', 1, '2019-02-23 17:07:51', '2019-02-23 17:07:51');
INSERT INTO `work_user_visit_logs` VALUES (496, 6, 6, 'applet', '113.246.203.92', '2019-02-25 14:12:25', 1, '2019-02-25 14:12:25', '2019-02-25 14:12:25');
INSERT INTO `work_user_visit_logs` VALUES (497, 14, 14, 'app', '117.136.88.24', '2019-02-25 14:44:40', 1, '2019-02-25 14:44:40', '2019-02-25 14:44:40');
INSERT INTO `work_user_visit_logs` VALUES (498, 14, 14, 'applet', '117.136.88.24', '2019-02-25 14:47:10', 1, '2019-02-25 14:47:10', '2019-02-25 14:47:10');
INSERT INTO `work_user_visit_logs` VALUES (499, 1, 1, 'wap', '0.0.0.0', '2019-02-25 17:26:52', 1, '2019-02-25 17:26:52', '2019-02-25 17:26:52');
INSERT INTO `work_user_visit_logs` VALUES (500, 14, 14, 'applet', '43.250.201.32', '2019-02-25 17:48:33', 1, '2019-02-25 17:48:33', '2019-02-25 17:48:33');
INSERT INTO `work_user_visit_logs` VALUES (501, 14, 14, 'applet', '117.136.88.53', '2019-02-25 17:58:52', 1, '2019-02-25 17:58:52', '2019-02-25 17:58:52');
INSERT INTO `work_user_visit_logs` VALUES (502, 14, 14, 'applet', '117.136.88.53', '2019-02-25 18:02:45', 1, '2019-02-25 18:02:45', '2019-02-25 18:02:45');
INSERT INTO `work_user_visit_logs` VALUES (503, 65, 65, 'applet', '113.246.203.92', '2019-02-26 10:46:18', 1, '2019-02-26 10:46:18', '2019-02-26 10:46:18');
INSERT INTO `work_user_visit_logs` VALUES (504, 59, 59, 'wap', '113.247.50.30', '2019-02-26 10:51:43', 1, '2019-02-26 10:51:43', '2019-02-26 10:51:43');
INSERT INTO `work_user_visit_logs` VALUES (505, 1, 1, 'applet', '192.168.31.59', '2019-02-26 13:43:16', 1, '2019-02-26 13:43:16', '2019-02-26 13:43:16');
INSERT INTO `work_user_visit_logs` VALUES (506, 1, 1, 'app', '113.247.50.30', '2019-02-26 13:48:00', 1, '2019-02-26 13:48:00', '2019-02-26 13:48:00');
INSERT INTO `work_user_visit_logs` VALUES (507, 59, 59, 'wap', '113.247.50.30', '2019-02-26 13:53:01', 1, '2019-02-26 13:53:01', '2019-02-26 13:53:01');
INSERT INTO `work_user_visit_logs` VALUES (508, 62, 62, 'pc', '192.168.0.130', '2019-03-20 18:23:27', 1, '2019-03-20 18:23:27', '2019-03-20 18:23:27');
INSERT INTO `work_user_visit_logs` VALUES (509, 62, 62, 'pc', '192.168.0.130', '2019-03-21 11:23:52', 1, '2019-03-21 11:23:52', '2019-03-21 11:23:52');
INSERT INTO `work_user_visit_logs` VALUES (510, 62, 62, 'pc', '192.168.0.130', '2019-03-21 16:00:44', 1, '2019-03-21 16:00:44', '2019-03-21 16:00:44');
INSERT INTO `work_user_visit_logs` VALUES (511, 62, 62, 'pc', '192.168.0.130', '2019-03-22 10:46:59', 1, '2019-03-22 10:46:59', '2019-03-22 10:46:59');
INSERT INTO `work_user_visit_logs` VALUES (512, 62, 62, 'pc', '192.168.0.130', '2019-03-22 18:02:37', 1, '2019-03-22 18:02:37', '2019-03-22 18:02:37');
INSERT INTO `work_user_visit_logs` VALUES (513, 62, 62, 'pc', '192.168.0.130', '2019-03-23 11:25:10', 1, '2019-03-23 11:25:10', '2019-03-23 11:25:10');
INSERT INTO `work_user_visit_logs` VALUES (514, 62, 62, 'pc', '192.168.0.107', '2019-03-23 12:15:01', 1, '2019-03-23 12:15:01', '2019-03-23 12:15:01');
INSERT INTO `work_user_visit_logs` VALUES (515, 62, 62, 'pc', '192.168.0.140', '2019-03-23 14:08:16', 1, '2019-03-23 14:08:16', '2019-03-23 14:08:16');
INSERT INTO `work_user_visit_logs` VALUES (516, 7, 7, 'applet', '192.168.0.107', '2019-03-23 17:30:08', 1, '2019-03-23 17:30:08', '2019-03-23 17:30:08');
INSERT INTO `work_user_visit_logs` VALUES (517, 7, 7, 'applet', '192.168.0.107', '2019-03-23 18:12:38', 1, '2019-03-23 18:12:38', '2019-03-23 18:12:38');
INSERT INTO `work_user_visit_logs` VALUES (518, 62, 62, 'pc', '192.168.0.130', '2019-03-24 16:36:58', 1, '2019-03-24 16:36:58', '2019-03-24 16:36:58');
INSERT INTO `work_user_visit_logs` VALUES (519, 62, 62, 'pc', '192.168.0.107', '2019-03-25 10:27:25', 1, '2019-03-25 10:27:25', '2019-03-25 10:27:25');
INSERT INTO `work_user_visit_logs` VALUES (520, 62, 62, 'pc', '192.168.0.140', '2019-03-25 11:24:40', 1, '2019-03-25 11:24:40', '2019-03-25 11:24:40');
INSERT INTO `work_user_visit_logs` VALUES (521, 62, 62, 'pc', '192.168.0.140', '2019-03-25 13:26:21', 1, '2019-03-25 13:26:21', '2019-03-25 13:26:21');
INSERT INTO `work_user_visit_logs` VALUES (522, 62, 62, 'pc', '192.168.0.107', '2019-03-25 13:52:33', 1, '2019-03-25 13:52:33', '2019-03-25 13:52:33');
INSERT INTO `work_user_visit_logs` VALUES (523, 7, 7, 'applet', '192.168.0.140', '2019-03-25 13:54:21', 1, '2019-03-25 13:54:21', '2019-03-25 13:54:21');
INSERT INTO `work_user_visit_logs` VALUES (524, 7, 7, 'applet', '192.168.0.140', '2019-03-25 14:07:55', 1, '2019-03-25 14:07:55', '2019-03-25 14:07:55');
INSERT INTO `work_user_visit_logs` VALUES (525, 7, 7, 'applet', '192.168.0.140', '2019-03-25 14:33:36', 1, '2019-03-25 14:33:36', '2019-03-25 14:33:36');
INSERT INTO `work_user_visit_logs` VALUES (526, 62, 62, 'pc', '192.168.0.140', '2019-03-25 14:55:47', 1, '2019-03-25 14:55:47', '2019-03-25 14:55:47');
INSERT INTO `work_user_visit_logs` VALUES (527, 7, 7, 'applet', '192.168.0.156', '2019-03-25 15:01:04', 1, '2019-03-25 15:01:04', '2019-03-25 15:01:04');
INSERT INTO `work_user_visit_logs` VALUES (528, 62, 62, 'pc', '192.168.0.107', '2019-03-25 17:14:09', 1, '2019-03-25 17:14:09', '2019-03-25 17:14:09');
INSERT INTO `work_user_visit_logs` VALUES (529, 7, 7, 'applet', '192.168.0.107', '2019-03-25 17:19:59', 1, '2019-03-25 17:19:59', '2019-03-25 17:19:59');
INSERT INTO `work_user_visit_logs` VALUES (530, 7, 7, 'applet', '192.168.0.107', '2019-03-25 17:21:37', 1, '2019-03-25 17:21:37', '2019-03-25 17:21:37');
INSERT INTO `work_user_visit_logs` VALUES (531, 7, 7, 'applet', '192.168.0.107', '2019-03-25 17:24:20', 1, '2019-03-25 17:24:20', '2019-03-25 17:24:20');
INSERT INTO `work_user_visit_logs` VALUES (532, 7, 7, 'applet', '192.168.0.107', '2019-03-25 17:25:50', 1, '2019-03-25 17:25:50', '2019-03-25 17:25:50');
INSERT INTO `work_user_visit_logs` VALUES (533, 7, 7, 'applet', '192.168.0.107', '2019-03-25 17:26:44', 1, '2019-03-25 17:26:44', '2019-03-25 17:26:44');
INSERT INTO `work_user_visit_logs` VALUES (534, 62, 62, 'pc', '192.168.0.130', '2019-03-25 17:27:13', 1, '2019-03-25 17:27:13', '2019-03-25 17:27:13');
INSERT INTO `work_user_visit_logs` VALUES (535, 7, 7, 'applet', '192.168.0.107', '2019-03-25 17:28:14', 1, '2019-03-25 17:28:14', '2019-03-25 17:28:14');
INSERT INTO `work_user_visit_logs` VALUES (536, 7, 7, 'applet', '192.168.0.156', '2019-03-25 17:31:24', 1, '2019-03-25 17:31:24', '2019-03-25 17:31:24');
INSERT INTO `work_user_visit_logs` VALUES (537, 62, 62, 'pc', '192.168.0.130', '2019-03-25 17:32:01', 1, '2019-03-25 17:32:01', '2019-03-25 17:32:01');
INSERT INTO `work_user_visit_logs` VALUES (538, 7, 7, 'applet', '192.168.0.140', '2019-03-25 17:32:29', 1, '2019-03-25 17:32:29', '2019-03-25 17:32:29');
INSERT INTO `work_user_visit_logs` VALUES (539, 7, 7, 'applet', '192.168.0.140', '2019-03-25 17:35:14', 1, '2019-03-25 17:35:14', '2019-03-25 17:35:14');
INSERT INTO `work_user_visit_logs` VALUES (540, 7, 7, 'applet', '192.168.0.140', '2019-03-25 17:37:45', 1, '2019-03-25 17:37:45', '2019-03-25 17:37:45');
INSERT INTO `work_user_visit_logs` VALUES (541, 7, 7, 'applet', '192.168.0.140', '2019-03-25 17:40:09', 1, '2019-03-25 17:40:09', '2019-03-25 17:40:09');
INSERT INTO `work_user_visit_logs` VALUES (542, 7, 7, 'applet', '192.168.0.140', '2019-03-25 17:45:14', 1, '2019-03-25 17:45:14', '2019-03-25 17:45:14');
INSERT INTO `work_user_visit_logs` VALUES (543, 62, 62, 'pc', '192.168.0.140', '2019-03-25 20:52:55', 1, '2019-03-25 20:52:55', '2019-03-25 20:52:55');
INSERT INTO `work_user_visit_logs` VALUES (544, 7, 7, 'applet', '192.168.0.156', '2019-03-25 20:56:54', 1, '2019-03-25 20:56:54', '2019-03-25 20:56:54');
INSERT INTO `work_user_visit_logs` VALUES (545, 62, 62, 'pc', '192.168.0.130', '2019-03-25 21:03:40', 1, '2019-03-25 21:03:40', '2019-03-25 21:03:40');
INSERT INTO `work_user_visit_logs` VALUES (546, 62, 62, 'pc', '192.168.0.130', '2019-03-26 10:37:38', 1, '2019-03-26 10:37:38', '2019-03-26 10:37:38');
INSERT INTO `work_user_visit_logs` VALUES (547, 7, 7, 'applet', '192.168.0.156', '2019-03-26 13:50:07', 1, '2019-03-26 13:50:07', '2019-03-26 13:50:07');
INSERT INTO `work_user_visit_logs` VALUES (548, 7, 7, 'applet', '192.168.0.140', '2019-03-26 13:52:04', 1, '2019-03-26 13:52:04', '2019-03-26 13:52:04');
INSERT INTO `work_user_visit_logs` VALUES (549, 62, 62, 'pc', '192.168.0.130', '2019-03-26 13:54:53', 1, '2019-03-26 13:54:53', '2019-03-26 13:54:53');
INSERT INTO `work_user_visit_logs` VALUES (550, 7, 7, 'applet', '192.168.0.140', '2019-03-26 14:21:00', 1, '2019-03-26 14:21:00', '2019-03-26 14:21:00');
INSERT INTO `work_user_visit_logs` VALUES (551, 62, 62, 'pc', '192.168.0.140', '2019-03-26 14:28:51', 1, '2019-03-26 14:28:51', '2019-03-26 14:28:51');
INSERT INTO `work_user_visit_logs` VALUES (552, 62, 62, 'pc', '192.168.0.140', '2019-03-26 16:59:01', 1, '2019-03-26 16:59:01', '2019-03-26 16:59:01');
INSERT INTO `work_user_visit_logs` VALUES (553, 62, 62, 'pc', '192.168.0.130', '2019-03-26 17:06:25', 1, '2019-03-26 17:06:25', '2019-03-26 17:06:25');
INSERT INTO `work_user_visit_logs` VALUES (554, 62, 62, 'pc', '192.168.0.140', '2019-03-26 17:06:35', 1, '2019-03-26 17:06:35', '2019-03-26 17:06:35');
INSERT INTO `work_user_visit_logs` VALUES (555, 62, 62, 'pc', '192.168.0.140', '2019-03-26 20:08:32', 1, '2019-03-26 20:08:32', '2019-03-26 20:08:32');
INSERT INTO `work_user_visit_logs` VALUES (556, 7, 7, 'applet', '192.168.0.140', '2019-03-26 20:12:48', 1, '2019-03-26 20:12:48', '2019-03-26 20:12:48');
INSERT INTO `work_user_visit_logs` VALUES (557, 62, 62, 'pc', '192.168.0.140', '2019-03-27 10:34:24', 1, '2019-03-27 10:34:24', '2019-03-27 10:34:24');
INSERT INTO `work_user_visit_logs` VALUES (558, 62, 62, 'pc', '192.168.0.130', '2019-03-27 10:43:35', 1, '2019-03-27 10:43:35', '2019-03-27 10:43:35');
INSERT INTO `work_user_visit_logs` VALUES (559, 7, 7, 'applet', '192.168.0.140', '2019-03-27 11:20:40', 1, '2019-03-27 11:20:40', '2019-03-27 11:20:40');
INSERT INTO `work_user_visit_logs` VALUES (560, 62, 62, 'pc', '192.168.0.140', '2019-03-27 13:08:23', 1, '2019-03-27 13:08:23', '2019-03-27 13:08:23');
INSERT INTO `work_user_visit_logs` VALUES (561, 62, 62, 'pc', '192.168.0.130', '2019-03-27 13:29:40', 1, '2019-03-27 13:29:40', '2019-03-27 13:29:40');
INSERT INTO `work_user_visit_logs` VALUES (562, 62, 62, 'pc', '192.168.0.140', '2019-03-27 14:01:23', 1, '2019-03-27 14:01:23', '2019-03-27 14:01:23');
INSERT INTO `work_user_visit_logs` VALUES (563, 62, 62, 'pc', '192.168.0.107', '2019-03-27 14:19:11', 1, '2019-03-27 14:19:11', '2019-03-27 14:19:11');
INSERT INTO `work_user_visit_logs` VALUES (564, 7, 7, 'applet', '192.168.0.107', '2019-03-27 14:44:29', 1, '2019-03-27 14:44:29', '2019-03-27 14:44:29');
INSERT INTO `work_user_visit_logs` VALUES (565, 7, 7, 'applet', '192.168.0.156', '2019-03-27 15:19:57', 1, '2019-03-27 15:19:57', '2019-03-27 15:19:57');
INSERT INTO `work_user_visit_logs` VALUES (566, 7, 7, 'applet', '192.168.0.140', '2019-03-27 16:52:20', 1, '2019-03-27 16:52:20', '2019-03-27 16:52:20');
INSERT INTO `work_user_visit_logs` VALUES (567, 62, 62, 'pc', '192.168.0.140', '2019-03-27 20:35:52', 1, '2019-03-27 20:35:52', '2019-03-27 20:35:52');
INSERT INTO `work_user_visit_logs` VALUES (568, 7, 7, 'applet', '192.168.0.140', '2019-03-28 16:19:22', 1, '2019-03-28 16:19:22', '2019-03-28 16:19:22');
INSERT INTO `work_user_visit_logs` VALUES (569, 7, 7, 'applet', '192.168.0.156', '2019-03-28 16:25:42', 1, '2019-03-28 16:25:42', '2019-03-28 16:25:42');
INSERT INTO `work_user_visit_logs` VALUES (570, 7, 7, 'applet', '192.168.0.156', '2019-03-28 16:39:11', 1, '2019-03-28 16:39:11', '2019-03-28 16:39:11');
INSERT INTO `work_user_visit_logs` VALUES (571, 7, 7, 'applet', '192.168.0.156', '2019-03-28 16:39:12', 1, '2019-03-28 16:39:12', '2019-03-28 16:39:12');
INSERT INTO `work_user_visit_logs` VALUES (572, 62, 62, 'pc', '192.168.0.140', '2019-03-28 16:49:00', 1, '2019-03-28 16:49:00', '2019-03-28 16:49:00');
INSERT INTO `work_user_visit_logs` VALUES (573, 7, 7, 'applet', '192.168.0.140', '2019-03-28 17:17:09', 1, '2019-03-28 17:17:09', '2019-03-28 17:17:09');
INSERT INTO `work_user_visit_logs` VALUES (574, 62, 62, 'pc', '192.168.0.130', '2019-03-28 17:43:11', 1, '2019-03-28 17:43:11', '2019-03-28 17:43:11');
INSERT INTO `work_user_visit_logs` VALUES (575, 7, 7, 'applet', '192.168.0.140', '2019-03-28 17:58:21', 1, '2019-03-28 17:58:21', '2019-03-28 17:58:21');
INSERT INTO `work_user_visit_logs` VALUES (576, 7, 7, 'applet', '192.168.0.140', '2019-03-28 18:00:50', 1, '2019-03-28 18:00:50', '2019-03-28 18:00:50');
INSERT INTO `work_user_visit_logs` VALUES (577, 7, 7, 'applet', '192.168.0.140', '2019-03-28 18:32:03', 1, '2019-03-28 18:32:03', '2019-03-28 18:32:03');
INSERT INTO `work_user_visit_logs` VALUES (578, 7, 7, 'applet', '192.168.0.140', '2019-03-28 18:38:58', 1, '2019-03-28 18:38:58', '2019-03-28 18:38:58');
INSERT INTO `work_user_visit_logs` VALUES (579, 7, 7, 'applet', '192.168.0.140', '2019-03-28 18:45:53', 1, '2019-03-28 18:45:53', '2019-03-28 18:45:53');
INSERT INTO `work_user_visit_logs` VALUES (580, 7, 7, 'applet', '192.168.0.156', '2019-03-28 19:49:38', 1, '2019-03-28 19:49:38', '2019-03-28 19:49:38');
INSERT INTO `work_user_visit_logs` VALUES (581, 7, 7, 'applet', '192.168.0.156', '2019-03-28 19:55:18', 1, '2019-03-28 19:55:18', '2019-03-28 19:55:18');
INSERT INTO `work_user_visit_logs` VALUES (582, 7, 7, 'applet', '192.168.0.156', '2019-03-28 19:56:13', 1, '2019-03-28 19:56:13', '2019-03-28 19:56:13');
INSERT INTO `work_user_visit_logs` VALUES (583, 7, 7, 'applet', '192.168.0.156', '2019-03-28 19:57:16', 1, '2019-03-28 19:57:16', '2019-03-28 19:57:16');
INSERT INTO `work_user_visit_logs` VALUES (584, 7, 7, 'applet', '192.168.0.140', '2019-03-28 19:59:28', 1, '2019-03-28 19:59:28', '2019-03-28 19:59:28');
INSERT INTO `work_user_visit_logs` VALUES (585, 7, 7, 'applet', '192.168.0.156', '2019-03-28 20:03:48', 1, '2019-03-28 20:03:48', '2019-03-28 20:03:48');
INSERT INTO `work_user_visit_logs` VALUES (586, 7, 7, 'applet', '192.168.0.156', '2019-03-28 20:07:37', 1, '2019-03-28 20:07:37', '2019-03-28 20:07:37');
INSERT INTO `work_user_visit_logs` VALUES (587, 7, 7, 'applet', '192.168.0.156', '2019-03-28 20:49:52', 1, '2019-03-28 20:49:52', '2019-03-28 20:49:52');
INSERT INTO `work_user_visit_logs` VALUES (588, 62, 62, 'pc', '192.168.0.130', '2019-03-28 20:58:54', 1, '2019-03-28 20:58:54', '2019-03-28 20:58:54');
INSERT INTO `work_user_visit_logs` VALUES (589, 62, 62, 'pc', '192.168.0.140', '2019-03-28 23:50:44', 1, '2019-03-28 23:50:44', '2019-03-28 23:50:44');
INSERT INTO `work_user_visit_logs` VALUES (590, 7, 7, 'applet', '192.168.0.140', '2019-03-29 01:13:56', 1, '2019-03-29 01:13:56', '2019-03-29 01:13:56');
INSERT INTO `work_user_visit_logs` VALUES (591, 7, 7, 'applet', '192.168.0.156', '2019-03-29 01:24:05', 1, '2019-03-29 01:24:05', '2019-03-29 01:24:05');
INSERT INTO `work_user_visit_logs` VALUES (592, 7, 7, 'applet', '192.168.0.156', '2019-03-29 01:25:05', 1, '2019-03-29 01:25:05', '2019-03-29 01:25:05');
COMMIT;

-- ----------------------------
-- Table structure for work_users
-- ----------------------------
DROP TABLE IF EXISTS `work_users`;
CREATE TABLE `work_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) NOT NULL COMMENT '用户手机号',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `gender` tinyint(1) DEFAULT '0' COMMENT '性别：0保密1男2女',
  `telephone` varchar(20) DEFAULT NULL COMMENT '用户联系电话',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq号',
  `wechat` varchar(255) DEFAULT NULL COMMENT '微信号',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `province_code` varchar(255) DEFAULT '' COMMENT '省份编码',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `city_code` varchar(255) DEFAULT '' COMMENT '城市编码',
  `area` varchar(255) DEFAULT NULL COMMENT '地区',
  `area_code` varchar(255) DEFAULT '' COMMENT '地区编码',
  `memo` text COMMENT '备注',
  `role_ids` text COMMENT '角色IDs',
  `become_distributor_time` datetime DEFAULT NULL COMMENT '成为分销商时间',
  `is_distributor` tinyint(1) DEFAULT '0' COMMENT '是否是分销商：0否1是',
  `distributor_level_id` bigint(20) DEFAULT '0' COMMENT '分销商等级ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `parent_ids` text COMMENT '父IDs',
  `become_bonus_time` datetime DEFAULT NULL COMMENT '成为分红商的时间',
  `is_bonus` tinyint(1) DEFAULT '0' COMMENT '是否是分红商',
  `bonus_level_id` bigint(20) DEFAULT '0' COMMENT '分红商等级ID',
  `status` tinyint(1) DEFAULT '1' COMMENT '用户状态：1正常9黑名单',
  `keep_sign_in_num` int(11) DEFAULT '0' COMMENT '连续签到次数',
  `total_sign_in_num` int(11) DEFAULT '0' COMMENT '总签到次数',
  `last_sign_in_time` datetime DEFAULT NULL COMMENT '上次签到时间',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0假删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  `is_master` tinyint(1) DEFAULT '0',
  `department` tinyint(1) DEFAULT '0' COMMENT '部门',
  `project_manager` tinyint(1) DEFAULT '0' COMMENT '是否项目经理',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_users
-- ----------------------------
BEGIN;
INSERT INTO `work_users` VALUES (1, '18888888888', NULL, '_1024', 'http://thirdwx.qlogo.cn/mmopen/vi_32/NCgkpy3LsM5ibz6L9Oe5MKbR4hcm4jgUr17w9XEiaSxzA54CYXPiaZE8QpSpkSpeDfCiaLR6Yfb6UpgFfVLlrAdgnQ/132', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-10 15:52:53', 1, 5, NULL, NULL, '2019-01-26 14:58:30', 1, 8, 1, 0, 1, '2019-01-26 15:54:35', 1, '2018-11-10 09:28:14', '2019-02-22 16:24:37', 0, 0, 0);
INSERT INTO `work_users` VALUES (2, '15071357527', NULL, '', '/public/upload/user_images/20181126/bad859231e722f742b132fdda64f15db.png', 1, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-10 14:57:27', 1, 5, NULL, NULL, '2018-11-23 16:05:40', 1, 2, 1, 0, 1, '2018-12-03 16:42:29', 1, '2018-11-10 13:43:52', '2019-02-22 16:42:44', 0, 0, 0);
INSERT INTO `work_users` VALUES (3, '15071350005', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 1, '2018-11-10 16:39:12', 1, '2018-11-10 15:04:28', '2018-11-10 16:39:12', 0, 0, 0);
INSERT INTO `work_users` VALUES (4, '13874930708', NULL, '我的世界只有你', '/public/upload/user_images/20181203/cc6af6729088fa669ca396b81ffd8e07.png', 1, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-17 14:02:18', 1, 5, NULL, NULL, '2018-11-16 17:38:10', 1, 4, 1, 0, 4, '2018-12-04 10:24:13', 1, '2018-11-10 15:06:37', '2019-02-23 16:46:52', 0, 0, 0);
INSERT INTO `work_users` VALUES (26, '15802542997', NULL, '_露', 'https://wx.qlogo.cn/mmopen/vi_32/JwUMMzv6zMJrxhxNjiaQbhgLmC23CZX2DgFU92JiaFuGcwtovsA52wUdqepTFFdoxlLqB67scMfGibnXUgGbJ3UZg/132', 0, NULL, '12', '啊28807664', '46498878664@qq.com', '北京市', '110000', '市辖区', '110100', '东城区', '110101', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 9, 0, 0, NULL, 1, '2018-11-17 15:49:36', '2018-11-30 12:04:56', 0, 0, 0);
INSERT INTO `work_users` VALUES (5, '15071350006', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-10 16:00:30', '2018-11-10 16:00:30', 0, 0, 0);
INSERT INTO `work_users` VALUES (6, '15200597371', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2019-02-25 14:12:30', 1, 1, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-10 16:42:53', '2019-02-25 14:12:30', 0, 0, 0);
INSERT INTO `work_users` VALUES (7, '15675143940', NULL, '毛陀', '/public/upload/applet/wx4784bf81f698aa99.o6zAJsx-uAxT4rxz3u2tyMiBhpJ8.SHxgw1KUxWBL287f9ca2750c00fbb506baadcb848a69.png', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-10 17:38:14', '2019-03-29 01:12:31', 1, 0, 0);
INSERT INTO `work_users` VALUES (8, '18175974828', NULL, '', '/public/upload/user_images/20181119/e617103629945c35c736c4000abd8d9d.png', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-20 15:58:40', 1, 1, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-12 11:17:55', '2018-11-20 15:58:40', 0, 0, 0);
INSERT INTO `work_users` VALUES (9, '15071357528', NULL, '毛毛', '', 1, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-12 12:45:53', '2018-11-12 12:48:25', 0, 0, 0);
INSERT INTO `work_users` VALUES (10, '15580841403', NULL, '李小二', '/public/static/images/avatar.png', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-12 14:27:08', '2019-03-21 15:59:22', 1, 0, 0);
INSERT INTO `work_users` VALUES (11, '17712345678', NULL, '耗子', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIkJVv034OmXfupclYOwBlOpAn6fp91Kiax9woibJGU0w6ZOFWhNn8hM01jzuZXcUy9CTzYibjOp39HA/132', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-12 15:08:12', '2018-11-12 15:08:12', 0, 0, 0);
INSERT INTO `work_users` VALUES (12, '13170308670', NULL, '郭闻天', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK6DMlNhxP9IWJlIygIib1z3SoeAbWwARKPIxdfW1biadvdAyOf7IpUIakCz4ecFzBqjmoYEQfgPn9w/132', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-12 17:20:33', 1, 1, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-12 17:19:46', '2018-11-12 17:20:33', 0, 0, 0);
INSERT INTO `work_users` VALUES (13, '15574320801', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-12 22:35:49', '2018-11-12 22:35:49', 0, 0, 0);
INSERT INTO `work_users` VALUES (14, '18711869150', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2019-02-25 14:46:38', 1, 1, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-14 10:19:52', '2019-02-25 14:46:38', 0, 0, 0);
INSERT INTO `work_users` VALUES (15, '13973131356', NULL, '朱老大', 'http://thirdwx.qlogo.cn/mmopen/vi_32/kdUgMfkYTECUsibYsWbTzUI3oicybItyXnbwxV5ibNgnSAVCicUDZAPPjl3EZK2MITmBYnlJ2uoEqwHfjaLklFQCRA/132', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-23 16:55:24', 1, 5, NULL, NULL, '2018-11-23 16:51:32', 1, 4, 1, 0, 1, '2018-11-23 11:53:56', 1, '2018-11-14 11:13:22', '2019-02-23 16:48:42', 0, 0, 0);
INSERT INTO `work_users` VALUES (16, '13787024881', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-14 14:00:18', '2018-11-14 14:00:18', 0, 0, 0);
INSERT INTO `work_users` VALUES (17, '13874930001', NULL, '我的世界只有你', '/public/upload/applet/tmp_37d1dce2e465954b2e69681f0b9f346f87a9a1be7b5307cb.jpg', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-23 11:54:08', 1, 1, NULL, NULL, '2018-11-16 17:38:08', 1, 3, 1, 0, 2, '2019-01-25 15:27:47', 1, '2018-11-15 14:52:24', '2019-01-29 17:10:36', 0, 0, 0);
INSERT INTO `work_users` VALUES (18, '18570322162', NULL, '网开亿面-何先森', 'https://wx.qlogo.cn/mmopen/vi_32/iaDXltFylKJvia06rfqZCz2ByCE6zY45MLmH6ica1IzygVHQ8iauB9g16TleL8jQgQic7L9de9JHqRzWoCvuVBnicujw/132', 0, NULL, '981856446', '18570322162', '981856446@qq.com', '北京市', '110000', '市辖区', '110100', '东城区', '110101', NULL, '[1]', '2018-12-06 20:09:32', 1, 1, 27, '#27#', NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-16 10:18:07', '2018-12-06 20:09:32', 0, 0, 0);
INSERT INTO `work_users` VALUES (19, '17608491856', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-17 14:02:16', 1, 1, NULL, NULL, '2018-11-17 14:27:45', 1, 8, 1, 0, 0, NULL, 1, '2018-11-16 17:17:22', '2018-11-17 14:27:45', 0, 0, 0);
INSERT INTO `work_users` VALUES (20, '13117512114', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2019-02-26 10:31:15', 1, 1, 19, '#19#', NULL, 0, 0, 1, 0, 1, '2018-11-17 11:59:46', 1, '2018-11-17 11:59:22', '2019-02-26 10:31:15', 0, 0, 0);
INSERT INTO `work_users` VALUES (21, '15674875874', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-17 14:02:14', 1, 5, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-17 13:59:12', '2019-02-23 16:53:51', 0, 0, 0);
INSERT INTO `work_users` VALUES (22, '13874931111', NULL, '我的世界只有你', 'https://wx.qlogo.cn/mmopen/vi_32/XaBDWRSsd03ruDnuScWcSCnI7zJcECbCqmfXZdHNOStGnF4KBamQtjLDpYIFyTW8TzWqsPGfkIssgDkqXPibqNQ/132', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-17 14:17:32', '2018-11-17 14:17:32', 0, 0, 0);
INSERT INTO `work_users` VALUES (23, '13874932222', NULL, '我的世界只有你', 'https://wx.qlogo.cn/mmopen/vi_32/XaBDWRSsd03ruDnuScWcSCnI7zJcECbCqmfXZdHNOStGnF4KBamQtjLDpYIFyTW8TzWqsPGfkIssgDkqXPibqNQ/132', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-17 14:19:54', '2018-11-17 14:19:54', 0, 0, 0);
INSERT INTO `work_users` VALUES (24, '13874930002', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, 17, '#17#', NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-17 15:21:32', '2018-11-17 15:21:32', 0, 0, 0);
INSERT INTO `work_users` VALUES (25, '13874933333', NULL, '我的世界只有你', 'https://wx.qlogo.cn/mmopen/vi_32/XaBDWRSsd03ruDnuScWcSCnI7zJcECbCqmfXZdHNOStGnF4KBamQtjLDpYIFyTW8TzWqsPGfkIssgDkqXPibqNQ/132', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, 17, '#17#', NULL, 0, 0, 1, 0, 1, '2018-11-17 16:05:08', 1, '2018-11-17 15:39:17', '2018-11-17 16:05:08', 0, 0, 0);
INSERT INTO `work_users` VALUES (27, '15111063940', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-17 16:55:23', 1, 1, NULL, NULL, NULL, 0, 0, 1, 0, 1, '2018-11-17 16:33:37', 1, '2018-11-17 16:32:15', '2018-11-17 16:55:23', 0, 0, 0);
INSERT INTO `work_users` VALUES (28, '13755195588', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-20 13:58:52', 1, 1, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-19 12:25:09', '2018-12-01 15:48:15', 0, 0, 0);
INSERT INTO `work_users` VALUES (29, '15200911999', NULL, '小兵', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEK8MQpib46pqEpYvKyq9PbZR4pCTZnaSLSI4rDJCfKokUazQT9QCSLXEuYrReWGC2UvM0h4e6N8cbg/132', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-19 14:00:43', 1, 1, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-19 12:51:39', '2018-11-19 14:00:43', 0, 0, 0);
INSERT INTO `work_users` VALUES (30, '18670012031', NULL, 'Kevin mo', 'https://wx.qlogo.cn/mmopen/vi_32/89BDM1RM7v13iaYPz8yUZiazribMq3Pb9nPbsyp6QdSGlickJkUkvMCibEJ5dzlxhzWjVr3OxO7fZAa3No9bL8ha3cA/132', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-19 16:28:19', '2018-11-19 16:28:19', 0, 0, 0);
INSERT INTO `work_users` VALUES (31, '13874930009', NULL, '啊啊啊', '/public/upload/user_images/20181121/b588ca31120d6e0482438ca5ed97dd14.png', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 1, '2018-11-21 10:08:21', 1, '2018-11-19 17:32:59', '2018-11-21 10:08:21', 0, 0, 0);
INSERT INTO `work_users` VALUES (32, '19000000001', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 1, '2018-11-23 12:08:31', 1, '2018-11-20 14:07:51', '2018-11-23 12:08:31', 0, 0, 0);
INSERT INTO `work_users` VALUES (33, '12312312122', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-20 16:57:45', '2018-11-20 16:57:45', 0, 0, 0);
INSERT INTO `work_users` VALUES (34, '18071357528', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-21 09:12:09', 1, 1, 2, '#2#', NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-21 09:09:56', '2018-11-21 09:12:09', 0, 0, 0);
INSERT INTO `work_users` VALUES (35, '18900734438', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-22 10:18:03', '2018-11-22 10:18:03', 0, 0, 0);
INSERT INTO `work_users` VALUES (36, '13874930003', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, 4, '#4#', '2018-11-27 10:21:31', 1, 8, 1, 0, 1, '2018-11-24 14:10:44', 1, '2018-11-24 14:10:01', '2018-11-27 10:21:31', 0, 0, 0);
INSERT INTO `work_users` VALUES (37, '15629183379', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-26 09:32:37', '2018-11-26 09:32:37', 0, 0, 0);
INSERT INTO `work_users` VALUES (38, '13874930010', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-26 16:18:07', '2018-11-26 16:18:07', 0, 0, 0);
INSERT INTO `work_users` VALUES (39, '18390926485', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-26 19:23:04', '2018-11-26 19:23:04', 0, 0, 0);
INSERT INTO `work_users` VALUES (40, '13874930004', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, 36, '#4#36#', NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-27 10:22:03', '2018-11-27 10:22:03', 0, 0, 0);
INSERT INTO `work_users` VALUES (41, '13874930005', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-27 10:22:47', '2018-11-27 10:22:47', 0, 0, 0);
INSERT INTO `work_users` VALUES (42, '15675143950', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-27 14:30:19', '2018-11-27 14:30:19', 0, 0, 0);
INSERT INTO `work_users` VALUES (43, '18676798664', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2019-02-24 12:08:22', 1, 1, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-27 18:26:57', '2019-02-24 12:08:22', 0, 0, 0);
INSERT INTO `work_users` VALUES (44, '13874930006', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2018-11-28 15:30:05', 1, 5, 4, '#4#', NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-28 15:28:58', '2019-02-23 16:46:52', 0, 0, 0);
INSERT INTO `work_users` VALUES (45, '18390926488', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2019-02-23 16:46:52', 1, 1, 44, '#4#44#', NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-28 17:35:38', '2019-02-23 16:46:52', 0, 0, 0);
INSERT INTO `work_users` VALUES (46, '15071350000', NULL, '', '/public/upload/user_images/20190222/282b60f4d8ed6ecc18e461fbaddc3729.png', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, 2, '#2#', NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-29 16:38:18', '2019-02-22 16:41:05', 0, 0, 0);
INSERT INTO `work_users` VALUES (47, '16000000000', NULL, '', '/public/upload/user_images/20181201/f7257da7a84c8c40f9850afab7fa3d64.jpg', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, 44, '#4#44#', NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-11-30 11:28:49', '2018-12-01 15:08:38', 0, 0, 0);
INSERT INTO `work_users` VALUES (48, '18630135988', NULL, '灬', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLdUUBQEk4dLiax83mgvMbAz14FBW0ypnkI5dLWjiafvT7csPk0jDgIuzzjZk5KF1kEOIQia2kE3tYsw/132', 0, NULL, '362980405', 'a362980405', '362980405@qq.com', '河北省', '130000', '石家庄市', '130100', '元氏县', '130132', NULL, '[1]', '2018-12-01 16:40:56', 1, 5, 21, '#21#', '2019-01-24 09:38:43', 1, 4, 1, 0, 0, NULL, 1, '2018-12-01 15:03:02', '2019-01-24 18:34:17', 0, 0, 0);
INSERT INTO `work_users` VALUES (49, '16666666666', NULL, '龙猫', '/public/upload/user_images/20181206/8361c5dfa7729f95e8e73c994e14b6e9.png', 1, NULL, '1479481114', '15527507613', '1479481114@qq.com', '湖南省', '430000', '长沙市', '430100', '长沙县', '430121', NULL, '[1]', '2018-12-05 14:38:43', 1, 5, NULL, NULL, '2018-12-05 14:42:57', 1, 4, 1, 0, 1, '2018-12-03 14:56:59', 1, '2018-12-03 13:42:17', '2019-02-22 15:02:11', 0, 0, 0);
INSERT INTO `work_users` VALUES (50, '13973131333', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-12-04 14:02:20', '2018-12-04 14:02:20', 0, 0, 0);
INSERT INTO `work_users` VALUES (51, '17352820001', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-12-04 14:07:35', '2018-12-04 14:07:35', 0, 0, 0);
INSERT INTO `work_users` VALUES (52, '13973131311', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-12-04 14:11:54', '2019-03-29 14:04:18', 0, 0, 1);
INSERT INTO `work_users` VALUES (53, '13973131555', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-12-04 14:13:04', '2018-12-04 14:13:04', 0, 0, 0);
INSERT INTO `work_users` VALUES (54, '13973131366', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-12-04 14:14:09', '2018-12-04 14:14:09', 0, 0, 0);
INSERT INTO `work_users` VALUES (55, '13327219279', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-12-04 14:14:58', '2018-12-04 14:14:58', 0, 0, 0);
INSERT INTO `work_users` VALUES (56, '18166198431', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-12-05 09:51:56', '2018-12-05 09:51:56', 0, 0, 0);
INSERT INTO `work_users` VALUES (57, '18975130026', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-12-05 19:00:00', '2018-12-05 19:00:00', 0, 0, 0);
INSERT INTO `work_users` VALUES (58, '15273967010', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2018-12-05 20:23:41', '2018-12-05 20:23:41', 0, 0, 0);
INSERT INTO `work_users` VALUES (59, '12345678911', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2019-02-26 13:53:06', 1, 1, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2019-01-24 14:58:07', '2019-02-26 13:53:06', 0, 0, 0);
INSERT INTO `work_users` VALUES (60, '15073689110', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2019-02-11 11:33:31', '2019-02-11 11:33:31', 0, 0, 0);
INSERT INTO `work_users` VALUES (61, '15211042188', NULL, '', '/public/upload/user_images/20190222/ded5b1bda8c58d11cd5d5b308293eefa.png', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', '长沙理工-xxx', '[1]', '2019-02-22 16:39:55', 1, 1, 2, '#2#', '2019-02-22 16:42:44', 1, 8, 1, 0, 0, NULL, 1, '2019-02-13 15:41:32', '2019-02-22 16:42:44', 0, 0, 0);
INSERT INTO `work_users` VALUES (62, '12000000000', NULL, '杨小二', '/public/static/images/avatar.png', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2019-02-14 17:56:20', 1, 1, NULL, NULL, '2019-02-14 18:07:46', 1, 8, 1, 0, 0, NULL, 1, '2019-02-14 17:55:51', '2019-03-25 10:47:13', 1, 0, 0);
INSERT INTO `work_users` VALUES (63, '12000000001', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, 62, '#62#', '2019-02-14 18:12:15', 1, 8, 1, 0, 0, NULL, 1, '2019-02-14 17:59:45', '2019-02-14 18:12:15', 0, 0, 0);
INSERT INTO `work_users` VALUES (64, '18229860977', NULL, '付付付', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2019-02-23 09:56:12', 1, 1, NULL, NULL, '2019-02-23 09:57:00', 1, 8, 1, 0, 1, '2019-02-23 10:11:58', 1, '2019-02-22 11:02:25', '2019-03-29 14:02:26', 0, 0, 1);
INSERT INTO `work_users` VALUES (65, '15273060636', NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', '2019-02-26 10:47:20', 1, 1, NULL, NULL, NULL, 0, 0, 1, 0, 1, '2019-02-26 11:26:33', 1, '2019-02-22 13:12:12', '2019-03-29 14:02:01', 0, 0, 1);
INSERT INTO `work_users` VALUES (66, '15071350001', NULL, '', '/public/upload/user_images/20190328/df6310d3fdc9d8d99041c63b6fa10f28.png', 0, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '[1]', NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, 1, '2019-02-23 08:36:04', '2019-03-29 14:01:19', 0, 3, 1);
COMMIT;

-- ----------------------------
-- Table structure for work_wechat
-- ----------------------------
DROP TABLE IF EXISTS `work_wechat`;
CREATE TABLE `work_wechat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jsapi_ticket` text,
  `last_ticket_time` int(11) DEFAULT NULL,
  `access_token` text,
  `last_token_time` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
