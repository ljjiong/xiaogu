
-- -----------------------------
-- Table structure for `wancll_activity_coupons`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_activity_coupons`;
CREATE TABLE `wancll_activity_coupons` (
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
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_activity_coupons`
-- -----------------------------
INSERT INTO `wancll_activity_coupons` VALUES ('1', 'C2018042010533698532', '2', 'full', '2018-04-30 10:52:54', '100.00', '20.00', '10', '2', '2', '0', '2018-04-20 10:53:36', '2018-04-20 13:46:07');
INSERT INTO `wancll_activity_coupons` VALUES ('2', 'C2018042010545286477', '2', 'discount', '2018-04-30 11:00:16', '100.00', '2.00', '5', '1', '2', '0', '2018-04-20 10:54:52', '2018-04-20 13:46:05');
INSERT INTO `wancll_activity_coupons` VALUES ('3', 'C2018042011502905039', '2', 'full', '2018-04-30 11:49:50', '200.00', '100.00', '3', '1', '2', '0', '2018-04-20 11:50:29', '2018-04-20 13:45:48');
INSERT INTO `wancll_activity_coupons` VALUES ('4', 'C2018042013464096645', '2', 'full', '2018-04-30 14:00:00', '100.00', '50.00', '10', '6', '2', '0', '2018-04-20 13:46:40', '2018-04-26 16:09:04');
INSERT INTO `wancll_activity_coupons` VALUES ('5', 'C2018042013471611674', '2', 'full', '2018-04-30 14:00:00', '200.00', '100.00', '10', '7', '2', '0', '2018-04-20 13:47:16', '2018-04-26 16:09:02');
INSERT INTO `wancll_activity_coupons` VALUES ('6', 'C2018042013480967887', '2', 'discount', '2018-04-30 14:00:00', '200.00', '5.00', '10', '9', '2', '0', '2018-04-20 13:48:09', '2018-04-26 16:09:01');
INSERT INTO `wancll_activity_coupons` VALUES ('7', 'C2018042013484283390', '2', 'discount', '2018-04-30 14:00:00', '100.00', '5.00', '10', '9', '2', '0', '2018-04-20 13:48:42', '2018-04-26 16:08:59');
INSERT INTO `wancll_activity_coupons` VALUES ('8', 'C2018042315243185706', '2', 'full', '2018-04-30 15:24:46', '100.00', '50.00', '10', '5', '2', '0', '2018-04-23 15:24:31', '2018-04-26 16:08:58');
INSERT INTO `wancll_activity_coupons` VALUES ('9', 'C2018042410114467380', '2', 'discount', '2018-04-25 10:12:20', '1000.00', '8.50', '1', '1', '2', '0', '2018-04-24 10:11:44', '2018-04-26 16:08:56');
INSERT INTO `wancll_activity_coupons` VALUES ('10', 'C2018042616092347045', '2', 'full', '2018-04-30 16:09:12', '100.00', '50.00', '10', '3', '2', '0', '2018-04-26 16:09:23', '2018-05-03 16:43:44');
INSERT INTO `wancll_activity_coupons` VALUES ('11', 'C2018042616093810946', '2', 'full', '2018-04-30 16:09:31', '200.00', '100.00', '10', '3', '2', '0', '2018-04-26 16:09:38', '2018-05-03 16:43:43');
INSERT INTO `wancll_activity_coupons` VALUES ('12', 'C2018042616095759601', '2', 'discount', '2018-04-30 16:09:45', '100.00', '5.00', '10', '4', '2', '0', '2018-04-26 16:09:57', '2018-05-03 16:43:41');
INSERT INTO `wancll_activity_coupons` VALUES ('13', 'C2018042616101681682', '2', 'discount', '2018-04-30 16:10:05', '200.00', '5.00', '10', '5', '2', '0', '2018-04-26 16:10:16', '2018-05-03 16:43:39');
INSERT INTO `wancll_activity_coupons` VALUES ('14', 'C2018050316464152403', '2', 'full', '2018-05-12 16:44:08', '200.00', '50.00', '10', '10', '2', '0', '2018-05-03 16:46:41', '2018-05-25 15:59:39');
INSERT INTO `wancll_activity_coupons` VALUES ('15', 'C2018050316472023655', '2', 'discount', '2018-05-12 16:47:08', '200.00', '9.50', '100', '14', '2', '0', '2018-05-03 16:47:20', '2018-05-25 16:00:46');
INSERT INTO `wancll_activity_coupons` VALUES ('16', 'C2018050316480256116', '2', 'full', '2018-05-12 16:48:03', '100.00', '10.00', '100', '15', '2', '0', '2018-05-03 16:48:02', '2018-05-25 16:00:49');
INSERT INTO `wancll_activity_coupons` VALUES ('17', 'C2018050415560171754', '2', 'full', '2018-08-05 20:26:29', '200.00', '1.00', '10', '5', '2', '1', '2018-05-04 15:56:01', '2018-05-04 15:56:01');
INSERT INTO `wancll_activity_coupons` VALUES ('18', 'C2018050415562449502', '2', 'discount', '2018-05-24 16:15:06', '500.00', '9.50', '100', '9', '2', '1', '2018-05-04 15:56:24', '2018-05-04 15:56:24');
INSERT INTO `wancll_activity_coupons` VALUES ('19', 'C2018051015482323901', '2', 'full', '2018-05-11 11:04:05', '200.00', '100.00', '100', '9', '2', '1', '2018-05-10 15:48:23', '2018-05-10 15:48:23');
INSERT INTO `wancll_activity_coupons` VALUES ('20', 'C2018051016430802531', '2', 'discount', '2018-05-31 16:43:51', '200.00', '9.00', '100', '13', '2', '1', '2018-05-10 16:43:08', '2018-05-10 16:43:08');
INSERT INTO `wancll_activity_coupons` VALUES ('21', 'C2018051108303380906', '2', 'discount', '2018-05-31 08:24:53', '100.00', '9.50', '100', '9', '2', '1', '2018-05-11 08:30:33', '2018-05-11 08:30:33');
INSERT INTO `wancll_activity_coupons` VALUES ('22', 'C2018051108365715402', '2', 'discount', '2018-05-25 08:31:20', '100.00', '6.00', '1000', '9', '2', '1', '2018-05-11 08:36:57', '2018-05-11 08:36:57');
INSERT INTO `wancll_activity_coupons` VALUES ('23', 'C2018051108372011579', '2', 'discount', '2018-05-25 08:31:47', '100.00', '7.00', '100', '8', '2', '1', '2018-05-11 08:37:20', '2018-05-11 08:37:20');
INSERT INTO `wancll_activity_coupons` VALUES ('24', 'C2018051108374420438', '2', 'discount', '2018-05-25 08:32:05', '10.00', '9.00', '100', '12', '2', '1', '2018-05-11 08:37:44', '2018-05-11 08:37:44');
INSERT INTO `wancll_activity_coupons` VALUES ('25', 'C2018051108542599490', '2', 'discount', '2018-05-19 08:53:34', '100.00', '9.50', '10', '0', '2', '0', '2018-05-11 08:54:25', '2018-05-11 08:54:32');
INSERT INTO `wancll_activity_coupons` VALUES ('26', 'C2018051108552802596', '2', 'discount', '2018-05-19 08:55:07', '100.00', '9.50', '1', '0', '2', '0', '2018-05-11 08:55:28', '2018-05-11 08:56:08');
INSERT INTO `wancll_activity_coupons` VALUES ('27', 'C2018051108562767054', '2', 'discount', '2018-05-18 08:56:14', '100.00', '9.50', '10', '0', '2', '0', '2018-05-11 08:56:27', '2018-05-11 08:56:38');
INSERT INTO `wancll_activity_coupons` VALUES ('28', 'C2018051515305502163', '2', 'discount', '2018-05-31 15:25:11', '100.00', '9.50', '10000', '10', '2', '1', '2018-05-15 15:30:55', '2018-06-02 14:22:40');
INSERT INTO `wancll_activity_coupons` VALUES ('29', 'C2018051711505559763', '2', 'full', '2018-05-31 11:51:06', '200.00', '100.00', '1', '1', '2', '1', '2018-05-17 11:50:55', '2018-05-17 11:50:55');
INSERT INTO `wancll_activity_coupons` VALUES ('30', 'C2018052515583045560', '2', 'discount', '2018-05-31 15:57:57', '299.00', '7.00', '10', '1', '2', '1', '2018-05-25 15:58:30', '2018-05-25 15:58:30');
INSERT INTO `wancll_activity_coupons` VALUES ('31', 'C2018060221391894797', '2', 'full', '2018-06-30 21:38:53', '100.00', '10.00', '1000000', '10', '1', '1', '2018-06-02 21:39:18', '2018-06-02 21:39:18');
INSERT INTO `wancll_activity_coupons` VALUES ('32', 'C2018060221393981481', '2', 'discount', '2018-07-05 21:39:16', '100.00', '7.50', '1000000000', '10', '1', '1', '2018-06-02 21:39:39', '2018-06-02 21:39:39');
INSERT INTO `wancll_activity_coupons` VALUES ('33', 'C2018060810161063325', '2', 'discount', '2018-06-30 10:15:36', '100.00', '9.90', '10', '4', '2', '1', '2018-06-08 10:16:10', '2018-06-08 10:16:10');
INSERT INTO `wancll_activity_coupons` VALUES ('34', 'C2018061914101415196', '2', 'discount', '2018-07-06 14:10:13', '100.00', '9.00', '10', '0', '2', '0', '2018-06-19 14:10:14', '2018-06-28 11:10:05');

-- -----------------------------
-- Table structure for `wancll_activity_discount_rules`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_activity_discount_rules`;
CREATE TABLE `wancll_activity_discount_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `market_activity_id` bigint(20) NOT NULL COMMENT '营销活动ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `discount_price` decimal(10,2) NOT NULL COMMENT '折扣价',
  `user_level_ids` text NOT NULL COMMENT '会员等级IDs',
  `user_limit_buy_num` int(11) NOT NULL COMMENT '单个会员限购买数量',
  `total_goods_num` int(11) NOT NULL COMMENT '总共可售出的商品数量',
  `use_num` int(11) DEFAULT '0' COMMENT '已被购买的数量',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_activity_discount_rules`
-- -----------------------------
INSERT INTO `wancll_activity_discount_rules` VALUES ('1', '1', '40', '20.00', '[3,2,1]', '10', '1000', '21', '1', '0', '2018-04-17 15:56:04', '2018-06-28 10:58:27');
INSERT INTO `wancll_activity_discount_rules` VALUES ('2', '1', '39', '20.00', '[1,2,3]', '100', '1900', '20', '1', '0', '2018-04-19 14:18:44', '2018-06-28 10:58:27');
INSERT INTO `wancll_activity_discount_rules` VALUES ('3', '1', '38', '20.00', '[2,1,3]', '100', '10000', '25', '1', '0', '2018-04-19 14:18:58', '2018-06-28 10:55:37');
INSERT INTO `wancll_activity_discount_rules` VALUES ('4', '1', '31', '20.00', '[3,2,1,4]', '1', '20', '8', '1', '0', '2018-04-25 17:22:59', '2018-06-28 10:55:37');
INSERT INTO `wancll_activity_discount_rules` VALUES ('5', '1', '4', '799.00', '[4,3,2,1]', '1', '120', '0', '1', '0', '2018-05-25 15:48:52', '2018-06-28 10:55:37');
INSERT INTO `wancll_activity_discount_rules` VALUES ('6', '1', '5', '299.00', '[4]', '1', '1', '0', '1', '0', '2018-05-26 11:37:21', '2018-06-28 10:55:37');
INSERT INTO `wancll_activity_discount_rules` VALUES ('7', '1', '1', '10.00', '[4,3,2]', '100', '1000', '0', '1', '1', '2018-06-28 10:53:55', '2018-06-28 10:55:37');
INSERT INTO `wancll_activity_discount_rules` VALUES ('8', '1', '6', '1.00', '[3,2]', '100', '10000', '0', '1', '1', '2018-06-28 11:35:44', '2018-06-28 11:35:44');

-- -----------------------------
-- Table structure for `wancll_activity_full_rules`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_activity_full_rules`;
CREATE TABLE `wancll_activity_full_rules` (
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_activity_full_rules`
-- -----------------------------
INSERT INTO `wancll_activity_full_rules` VALUES ('1', '3', '[3,2,1,4]', '200.00', '100.00', '1', '0', '2018-04-17 15:57:14', '2018-06-28 11:05:50');
INSERT INTO `wancll_activity_full_rules` VALUES ('2', '3', '[4,3]', '1000.00', '20.00', '1', '0', '2018-05-28 10:31:38', '2018-06-28 11:05:50');
INSERT INTO `wancll_activity_full_rules` VALUES ('3', '3', '[4]', '1000.00', '10.00', '1', '0', '2018-05-28 11:08:49', '2018-06-28 11:05:50');
INSERT INTO `wancll_activity_full_rules` VALUES ('4', '6', '[4,3]', '1000.00', '10.00', '1', '0', '2018-05-28 11:14:31', '2018-06-28 11:05:50');
INSERT INTO `wancll_activity_full_rules` VALUES ('5', '6', '[4,3]', '500.00', '5.00', '1', '0', '2018-05-30 14:23:01', '2018-06-28 11:05:50');
INSERT INTO `wancll_activity_full_rules` VALUES ('6', '6', '[4,3,2,1]', '100.00', '10.00', '1', '0', '2018-06-02 14:26:01', '2018-06-28 11:05:50');
INSERT INTO `wancll_activity_full_rules` VALUES ('7', '7', '[4,2,1]', '11.00', '1.00', '1', '1', '2018-06-28 11:50:36', '2018-06-28 11:50:36');

-- -----------------------------
-- Table structure for `wancll_addresses`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_addresses`;
CREATE TABLE `wancll_addresses` (
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_addresses`
-- -----------------------------
INSERT INTO `wancll_addresses` VALUES ('1', '33', '123123', '13973131356', '北京市', '110000', '市辖区', '110100', '密云区', '110118', '123132', '', '', '1', '0', '1', '2018-06-14 17:26:24', '2018-06-14 17:26:24');
INSERT INTO `wancll_addresses` VALUES ('2', '2', '韩梅梅', '18396964545', '天津市', '120000', '市辖区', '120100', '河东区', '120102', '开源鑫贸大楼', '', '', '1', '0', '1', '2018-06-15 09:40:57', '2018-06-15 09:40:57');
INSERT INTO `wancll_addresses` VALUES ('3', '1', '01', '18100000001', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '', '1', '0', '1', '2018-06-15 10:07:17', '2018-06-15 10:07:17');
INSERT INTO `wancll_addresses` VALUES ('4', '5', '02', '18100000002', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '', '1', '0', '1', '2018-06-15 10:23:33', '2018-06-15 10:23:33');
INSERT INTO `wancll_addresses` VALUES ('5', '7', '易云', '15580841403', '山西省', '140000', '大同市', '140200', '大同县', '140227', '测试地址', '', '', '1', '0', '1', '2018-06-15 10:34:36', '2018-06-15 10:34:36');
INSERT INTO `wancll_addresses` VALUES ('6', '6', '03', '18100000003', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '', '1', '0', '1', '2018-06-15 11:44:06', '2018-06-15 11:44:06');
INSERT INTO `wancll_addresses` VALUES ('7', '11', '毛戈', '15675143940', '天津市', '120000', '市辖区', '120100', '河东区', '120102', '区域', '', '', '1', '0', '1', '2018-06-15 18:52:39', '2018-06-15 18:52:39');
INSERT INTO `wancll_addresses` VALUES ('8', '4', 'as', '18888888888', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '', '1', '0', '1', '2018-06-19 13:50:42', '2018-06-19 13:50:42');

-- -----------------------------
-- Table structure for `wancll_admin_accounts`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_admin_accounts`;
CREATE TABLE `wancll_admin_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(50) NOT NULL COMMENT '登录的唯一标识符',
  `password` varchar(255) NOT NULL COMMENT '登录密码',
  `admin_id` bigint(20) DEFAULT '0' COMMENT '管理员ID',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态:1正常0已删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_accounts`
-- -----------------------------
INSERT INTO `wancll_admin_accounts` VALUES ('1', 'yiyun', '18002797d30d04fdc5fe16aceec36d47', '1', '1', '2018-04-10 16:40:36', '2018-04-10 16:40:36');
INSERT INTO `wancll_admin_accounts` VALUES ('2', 'admin', 'b5305e8c4c5e08c246943fe736701525', '2', '1', '2018-04-10 16:40:48', '2018-06-20 17:58:19');
INSERT INTO `wancll_admin_accounts` VALUES ('3', 'test', 'b5305e8c4c5e08c246943fe736701525', '3', '0', '2018-04-11 10:22:20', '2018-04-11 10:30:41');
INSERT INTO `wancll_admin_accounts` VALUES ('4', 'test', 'b5305e8c4c5e08c246943fe736701525', '4', '1', '2018-04-11 14:09:07', '2018-04-11 14:09:07');

-- -----------------------------
-- Table structure for `wancll_admin_assets`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_admin_assets`;
CREATE TABLE `wancll_admin_assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NOT NULL COMMENT '管理员ID',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `score` decimal(10,2) DEFAULT '0.00' COMMENT '积分',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `wancll_admin_tokens`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_admin_tokens`;
CREATE TABLE `wancll_admin_tokens` (
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
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_tokens`
-- -----------------------------
INSERT INTO `wancll_admin_tokens` VALUES ('1', '2', '2', 'pc', 'admin&pc@5764074ca19ebc3ab70d808a2ca26ca6', 'admin&pc@528af4cbf60ffab967e25e5f8ff5f56c', '7200', '1', '2018-06-14 17:25:34', '2018-06-14 17:25:34');
INSERT INTO `wancll_admin_tokens` VALUES ('2', '2', '2', 'pc', 'admin&pc@a7a504bc20d0f97577f8ae95ca6e9e6f', 'admin&pc@b8db4f5c3056251de36a52b251df121a', '7200', '1', '2018-06-14 17:35:05', '2018-06-14 17:35:05');
INSERT INTO `wancll_admin_tokens` VALUES ('3', '2', '2', 'pc', 'admin&pc@d61e82a46bad5e0eb052220c3adacaa5', 'admin&pc@f57d75d35ab81611ef2d1a838642176c', '7200', '1', '2018-06-14 17:41:33', '2018-06-14 17:41:33');
INSERT INTO `wancll_admin_tokens` VALUES ('4', '2', '2', 'pc', 'admin&pc@72e31c855c304a88ad17e3bd827e4aca', 'admin&pc@2c2330e441997ffae26295377e94faed', '7200', '1', '2018-06-15 09:39:14', '2018-06-15 09:39:14');
INSERT INTO `wancll_admin_tokens` VALUES ('5', '2', '2', 'pc', 'admin&pc@48b33e729ab767047ffef883691aa1d4', 'admin&pc@f8028921bf2bd6f32d2fea62781c7b6f', '7200', '1', '2018-06-15 09:40:02', '2018-06-15 09:40:02');
INSERT INTO `wancll_admin_tokens` VALUES ('6', '2', '2', 'pc', 'admin&pc@393ee52a9d941debf2bc19375d2f308c', 'admin&pc@2644b97c112eca1de1c4a9651538db5f', '7200', '1', '2018-06-15 09:44:57', '2018-06-15 09:44:57');
INSERT INTO `wancll_admin_tokens` VALUES ('7', '2', '2', 'pc', 'admin&pc@b4ce3a44c651ce79d4ad5d3cc7e0b672', 'admin&pc@ec488963b71183839ac990770122a50b', '7200', '1', '2018-06-15 10:32:32', '2018-06-15 10:32:32');
INSERT INTO `wancll_admin_tokens` VALUES ('8', '2', '2', 'pc', 'admin&pc@1231f7f179f16304f3b618893689e6a8', 'admin&pc@cdeea59f074699b262679d6ff417bc25', '7200', '1', '2018-06-15 11:22:00', '2018-06-15 11:22:00');
INSERT INTO `wancll_admin_tokens` VALUES ('9', '2', '2', 'pc', 'admin&pc@58894d2099bdacf2b82927aaccb59d14', 'admin&pc@7fc0954eaabbfc828b55277afd0b4867', '7200', '1', '2018-06-15 11:29:19', '2018-06-15 11:29:19');
INSERT INTO `wancll_admin_tokens` VALUES ('10', '2', '2', 'pc', 'admin&pc@866e20a17b80f168d78889c40126d845', 'admin&pc@6a926f547d6bc832a5a277c4a8f676ff', '7200', '1', '2018-06-15 11:44:11', '2018-06-15 11:44:11');
INSERT INTO `wancll_admin_tokens` VALUES ('11', '2', '2', 'pc', 'admin&pc@6591eb12000b611aae637e76420691ed', 'admin&pc@daeb840abb53deca761b750625723535', '7200', '1', '2018-06-15 11:58:44', '2018-06-15 11:58:44');
INSERT INTO `wancll_admin_tokens` VALUES ('12', '2', '2', 'pc', 'admin&pc@424564e2b8524cf178c39f41d5d343d0', 'admin&pc@87243f66b626e770d7e49c1f93f23a6d', '7200', '1', '2018-06-15 13:42:48', '2018-06-15 13:42:48');
INSERT INTO `wancll_admin_tokens` VALUES ('13', '2', '2', 'pc', 'admin&pc@a16d28636be15610f40dfd81506b81fc', 'admin&pc@e15bb47f79d22a61c1f9154361c909e6', '7200', '1', '2018-06-15 13:49:56', '2018-06-15 13:49:56');
INSERT INTO `wancll_admin_tokens` VALUES ('14', '2', '2', 'pc', 'admin&pc@eee9a9d499948710c127f29ca14aff42', 'admin&pc@a0ed32258caec34c4fe3f1f86aa4985a', '7200', '1', '2018-06-15 13:50:43', '2018-06-15 13:50:43');
INSERT INTO `wancll_admin_tokens` VALUES ('15', '2', '2', 'pc', 'admin&pc@b600d980685d9dc86da47c2d0527d699', 'admin&pc@3e5800c3874d17c340b30aad5d649587', '7200', '1', '2018-06-15 13:58:02', '2018-06-15 13:58:02');
INSERT INTO `wancll_admin_tokens` VALUES ('16', '2', '2', 'pc', 'admin&pc@cd5a97c51134400dbf5612f53e2869d3', 'admin&pc@324f3cb005b745e0d943ecce06a7cbcd', '7200', '1', '2018-06-15 14:30:16', '2018-06-15 14:30:16');
INSERT INTO `wancll_admin_tokens` VALUES ('17', '2', '2', 'pc', 'admin&pc@208255d117a95c1fedb0b7ee8efaa1bf', 'admin&pc@bbdfa607e831deeeb6f8a1a5ded4d0bb', '7200', '1', '2018-06-15 15:26:51', '2018-06-15 15:26:51');
INSERT INTO `wancll_admin_tokens` VALUES ('18', '2', '2', 'pc', 'admin&pc@143052b153edbfdc6b88ff65e1ca757a', 'admin&pc@835958ceb29fec998170c305ae14cef4', '7200', '1', '2018-06-15 18:20:13', '2018-06-15 18:20:13');
INSERT INTO `wancll_admin_tokens` VALUES ('19', '2', '2', 'pc', 'admin&pc@978cba012d555b85bc6dba235b68a9c8', 'admin&pc@ca06da399c013bd4b8bf0ef259ed8849', '7200', '1', '2018-06-15 18:33:57', '2018-06-15 18:33:57');
INSERT INTO `wancll_admin_tokens` VALUES ('20', '2', '2', 'pc', 'admin&pc@cf7d37ca4ce3fc10199979b63c709f43', 'admin&pc@b9c189ac702a677513f343280a7c03c5', '7200', '1', '2018-06-16 09:51:10', '2018-06-16 09:51:10');
INSERT INTO `wancll_admin_tokens` VALUES ('26', '2', '2', 'pc', 'admin&pc@512b53edaecef457d832fe61f3a6adb6', 'admin&pc@2fe8bd163d309f08d1ea442d4826e87e', '7200', '1', '2018-06-19 14:09:32', '2018-06-19 14:09:32');
INSERT INTO `wancll_admin_tokens` VALUES ('22', '2', '2', 'pc', 'admin&pc@ec655a814318ff1bf63c3cba84202bcc', 'admin&pc@d2d62839585f8be8807f37b2d5669088', '7200', '1', '2018-06-16 12:02:24', '2018-06-16 12:02:24');
INSERT INTO `wancll_admin_tokens` VALUES ('23', '2', '2', 'pc', 'admin&pc@ac284d22a2cebb261404f2a98979d91d', 'admin&pc@bb230362601ffeed4a183009b9f69dc4', '7200', '1', '2018-06-16 16:32:25', '2018-06-16 16:32:25');
INSERT INTO `wancll_admin_tokens` VALUES ('24', '2', '2', 'pc', 'admin&pc@33ab5bad70c54613fcd3f0aaee8a6773', 'admin&pc@311b879ece38750a535327b76b546b00', '7200', '1', '2018-06-19 10:16:19', '2018-06-19 10:16:19');
INSERT INTO `wancll_admin_tokens` VALUES ('25', '2', '2', 'pc', 'admin&pc@6195c9d5870c9cae586c5dd12040ba15', 'admin&pc@983f096d6430d1aeb7f73c2cf08d95b8', '7200', '1', '2018-06-19 11:52:03', '2018-06-19 11:52:03');
INSERT INTO `wancll_admin_tokens` VALUES ('27', '2', '2', 'pc', 'admin&pc@04063c0d0540b584a19784e5e0040442', 'admin&pc@6709bd33f19ebdf8cbce063675d3f06f', '7200', '1', '2018-06-19 14:26:40', '2018-06-19 14:26:40');
INSERT INTO `wancll_admin_tokens` VALUES ('28', '2', '2', 'pc', 'admin&pc@a6945cba842b4712af40159458aa39df', 'admin&pc@c54cbc8273a0873c2371d10b05575520', '7200', '1', '2018-06-19 14:46:01', '2018-06-19 14:46:01');
INSERT INTO `wancll_admin_tokens` VALUES ('29', '2', '2', 'pc', 'admin&pc@a9041d1d6e272feb21c051c454a90164', 'admin&pc@f2a6a11c1541f8e49c1e22910a458b28', '7200', '1', '2018-06-19 15:40:00', '2018-06-19 15:40:00');
INSERT INTO `wancll_admin_tokens` VALUES ('30', '2', '2', 'pc', 'admin&pc@9dc644471874e057b28c3cf1e03185df', 'admin&pc@e14c258dd50e60dbcab3ea2fd8f462b1', '7200', '1', '2018-06-19 15:53:32', '2018-06-19 15:53:32');
INSERT INTO `wancll_admin_tokens` VALUES ('31', '2', '2', 'pc', 'admin&pc@af43f8731fc3ffa2956321a36f88bb1b', 'admin&pc@06ac6d11e633817623ae96dcdef637be', '7200', '1', '2018-06-19 15:57:39', '2018-06-19 15:57:39');
INSERT INTO `wancll_admin_tokens` VALUES ('32', '2', '2', 'pc', 'admin&pc@304e43bccc85f804abf201d41f54f87f', 'admin&pc@b642f81c63124a8949061fa1a0f50074', '7200', '1', '2018-06-19 17:47:00', '2018-06-19 17:47:00');
INSERT INTO `wancll_admin_tokens` VALUES ('33', '2', '2', 'pc', 'admin&pc@37f09774accbc42691be326cc190a236', 'admin&pc@c9b741a1ce9a8fa1e4e10d764ac7f0fd', '7200', '1', '2018-06-19 18:40:31', '2018-06-19 18:40:31');
INSERT INTO `wancll_admin_tokens` VALUES ('34', '2', '2', 'pc', 'admin&pc@8efc2824aff37bdad8c82ac93aafa8cf', 'admin&pc@fff54157f52220e708d80f0a154b897a', '7200', '1', '2018-06-19 20:33:23', '2018-06-19 20:33:23');
INSERT INTO `wancll_admin_tokens` VALUES ('35', '2', '2', 'pc', 'admin&pc@11428cb50079b1896a642435d82f54e9', 'admin&pc@6c9abfca164e4c9568bcd5a10c753839', '7200', '1', '2018-06-19 20:36:34', '2018-06-19 20:36:34');
INSERT INTO `wancll_admin_tokens` VALUES ('36', '2', '2', 'pc', 'admin&pc@3968031aeb67597d7d1d4804fa4edf54', 'admin&pc@b9aef1ad1b118632678707d5038cfb7d', '7200', '1', '2018-06-19 21:17:05', '2018-06-19 21:17:05');
INSERT INTO `wancll_admin_tokens` VALUES ('37', '2', '2', 'pc', 'admin&pc@bc0f99b88fe3a59dc3f8cd1b607bc63e', 'admin&pc@858c3ca831b3321e877b99ff8a859de1', '7200', '1', '2018-06-20 08:55:07', '2018-06-20 08:55:07');
INSERT INTO `wancll_admin_tokens` VALUES ('38', '2', '2', 'pc', 'admin&pc@bf9eb0f1fe2ed69334244bce4fd898e9', 'admin&pc@9b093402a5f3a8e72e7ee2695294f7c6', '7200', '1', '2018-06-20 11:04:05', '2018-06-20 11:04:05');
INSERT INTO `wancll_admin_tokens` VALUES ('39', '2', '2', 'pc', 'admin&pc@e1c754d129983e6fca36d818b408e26d', 'admin&pc@5d320b5342b7fef60298a53682a662c1', '7200', '1', '2018-06-20 11:48:33', '2018-06-20 11:48:33');
INSERT INTO `wancll_admin_tokens` VALUES ('40', '2', '2', 'pc', 'admin&pc@0ce84441d53797e5842a46e3dc37b6ba', 'admin&pc@be67004dcc0823d7bd913bbbb7e8386c', '7200', '1', '2018-06-20 14:42:50', '2018-06-20 14:42:50');
INSERT INTO `wancll_admin_tokens` VALUES ('41', '2', '2', 'app', 'admin&pc@f9bb82218ea73260bb129c56496bf63f', 'admin&pc@214008e7a2aa3f01d16c79edb31316a0', '0', '1', '2018-06-20 17:57:01', '2018-06-20 17:57:01');
INSERT INTO `wancll_admin_tokens` VALUES ('42', '2', '2', 'pc', 'admin&pc@ee8d5138f1bcca3c053931dd047fcd23', 'admin&pc@20e4626a8f880997ba897c81ff11d9f2', '7200', '1', '2018-06-20 21:32:25', '2018-06-20 21:32:25');
INSERT INTO `wancll_admin_tokens` VALUES ('43', '2', '2', 'pc', 'admin&pc@adee32b77c8f564b86f8244ea98f73f9', 'admin&pc@d5e54b01e58e43485b1c6a7062aa533b', '7200', '1', '2018-06-22 08:35:17', '2018-06-22 08:35:17');
INSERT INTO `wancll_admin_tokens` VALUES ('44', '2', '2', 'pc', 'admin&pc@8e1ad0deff89c1d93f4927a69c90f09b', 'admin&pc@c78a88e8a3a1c2af7b999838c2f06826', '7200', '1', '2018-06-22 09:51:06', '2018-06-22 09:51:06');
INSERT INTO `wancll_admin_tokens` VALUES ('45', '2', '2', 'pc', 'admin&pc@77263ef7f23f8b25ead12732c1efb044', 'admin&pc@4263f3799cd3e094dfa5ef82cbf073d4', '7200', '1', '2018-06-22 17:06:51', '2018-06-22 17:06:51');
INSERT INTO `wancll_admin_tokens` VALUES ('46', '2', '2', 'pc', 'admin&pc@dbeaf9ca6078f3ad7bb0b3972e23495b', 'admin&pc@f87c1f9b036058f25bd47d1d957801bd', '7200', '1', '2018-06-23 09:11:08', '2018-06-23 09:11:08');
INSERT INTO `wancll_admin_tokens` VALUES ('47', '2', '2', 'pc', 'admin&pc@0083d04709f740147d8db291cb45cb77', 'admin&pc@b762904c29988010284157f9a8d197f8', '7200', '1', '2018-06-23 09:54:26', '2018-06-23 09:54:26');
INSERT INTO `wancll_admin_tokens` VALUES ('48', '2', '2', 'pc', 'admin&pc@66e3706a5b8062a8c4a868a9648677d7', 'admin&pc@ff24092b7a2b0e69e81aa3146cec0e3c', '7200', '1', '2018-06-23 11:10:23', '2018-06-23 11:10:23');
INSERT INTO `wancll_admin_tokens` VALUES ('49', '2', '2', 'pc', 'admin&pc@9d5359043888ad5462f1f570b6198ec5', 'admin&pc@9ef7bcac85f155de4b3495bd1afec651', '7200', '1', '2018-06-23 11:11:54', '2018-06-23 11:11:54');
INSERT INTO `wancll_admin_tokens` VALUES ('53', '2', '2', 'pc', 'admin&pc@dc1876f919cbfd24cc90df3577f0582c', 'admin&pc@67ecbe3a5afee723f49506761b08e9f4', '7200', '1', '2018-06-25 09:04:39', '2018-06-25 09:04:39');
INSERT INTO `wancll_admin_tokens` VALUES ('51', '2', '2', 'pc', 'admin&pc@b5ad1c8614580b58b393bb9b47036635', 'admin&pc@3a9e38a0ba0d395965d75869bea84e52', '7200', '1', '2018-06-23 15:30:28', '2018-06-23 15:30:28');
INSERT INTO `wancll_admin_tokens` VALUES ('63', '2', '2', 'pc', 'admin&pc@d19671710f7ec70edb23e884e1e8f55b', 'admin&pc@b8c3f031de025292d69283b918ee565d', '7200', '1', '2018-06-27 16:55:32', '2018-06-27 16:55:32');
INSERT INTO `wancll_admin_tokens` VALUES ('54', '2', '2', 'pc', 'admin&pc@9eb29fc0c20fba399ca2d725760dab98', 'admin&pc@740ea7e29d6101ff254e54fa67bd6ec3', '7200', '1', '2018-06-25 09:27:45', '2018-06-25 09:27:45');
INSERT INTO `wancll_admin_tokens` VALUES ('55', '2', '2', 'pc', 'admin&pc@66e249f6e99b62d976d527834127902f', 'admin&pc@b193e84ba1f1fb11df78daa82f5cbe05', '7200', '1', '2018-06-25 09:32:26', '2018-06-25 09:32:26');
INSERT INTO `wancll_admin_tokens` VALUES ('56', '2', '2', 'pc', 'admin&pc@30d472eac487b0cade2097cb5812bb61', 'admin&pc@57c998ecc3ac870f6235562f87e1b6ba', '7200', '1', '2018-06-25 10:07:00', '2018-06-25 10:07:00');
INSERT INTO `wancll_admin_tokens` VALUES ('57', '2', '2', 'pc', 'admin&pc@cdf3ac131e4f25eb195a8a4ce78465e7', 'admin&pc@a2e78145f0beab45f4fe206129643fc5', '7200', '1', '2018-06-25 10:12:26', '2018-06-25 10:12:26');
INSERT INTO `wancll_admin_tokens` VALUES ('58', '2', '2', 'pc', 'admin&pc@a5e5f61fcc568768fcbec5ccbcddbf36', 'admin&pc@054e8b822a95f4c82d7507b9eedf60b5', '7200', '1', '2018-06-25 22:55:44', '2018-06-25 22:55:44');
INSERT INTO `wancll_admin_tokens` VALUES ('62', '2', '2', 'pc', 'admin&pc@52b1d0695ea5e3d09a101158b66fd127', 'admin&pc@6c20e33200b4831ec5bde4ca8c9a55d3', '7200', '1', '2018-06-27 10:29:52', '2018-06-27 10:29:52');
INSERT INTO `wancll_admin_tokens` VALUES ('61', '2', '2', 'pc', 'admin&pc@76e73691805e13c6b8dc8f0585dbb19d', 'admin&pc@f1353f50fae5337533cd9279f8a4f23c', '7200', '1', '2018-06-26 16:03:31', '2018-06-26 16:03:31');
INSERT INTO `wancll_admin_tokens` VALUES ('64', '2', '2', 'pc', 'admin&pc@aef99dbacfa79914bab2c9b649aac4f0', 'admin&pc@15d923f2b10d2d1872e35b675d345414', '7200', '1', '2018-06-27 16:57:19', '2018-06-27 16:57:19');
INSERT INTO `wancll_admin_tokens` VALUES ('65', '2', '2', 'pc', 'admin&pc@6ff7a4f4c33ff8bdd5a2317f400b4f4d', 'admin&pc@dbe39e0edd91fbd19c374336e9e8558a', '7200', '1', '2018-06-27 17:18:30', '2018-06-27 17:18:30');
INSERT INTO `wancll_admin_tokens` VALUES ('66', '2', '2', 'pc', 'admin&pc@00444847e7d7601832ae5bfb336dc005', 'admin&pc@02d5b10179b2157bd074fd844b191cea', '7200', '1', '2018-06-27 17:57:01', '2018-06-27 17:57:01');
INSERT INTO `wancll_admin_tokens` VALUES ('67', '2', '2', 'pc', 'admin&pc@385d09527c3e8881ac7d43a542b99684', 'admin&pc@e78aa3ff0d9a66fa5de3d65e178bf895', '7200', '1', '2018-06-27 21:05:13', '2018-06-27 21:05:13');
INSERT INTO `wancll_admin_tokens` VALUES ('68', '2', '2', 'pc', 'admin&pc@2c38eaf2cac3ed45113b3bfcda8f6cdc', 'admin&pc@e8a61e5dd1dd78bc0136c0aa3b16d1fa', '7200', '1', '2018-06-27 21:52:52', '2018-06-27 21:52:52');
INSERT INTO `wancll_admin_tokens` VALUES ('69', '2', '2', 'pc', 'admin&pc@07c8bbfb0ddcb0f06a8d3ad7e68be8d0', 'admin&pc@fba685f1d8a5d38ed9d459b82a3ae459', '7200', '1', '2018-06-27 21:54:17', '2018-06-27 21:54:17');
INSERT INTO `wancll_admin_tokens` VALUES ('70', '2', '2', 'pc', 'admin&pc@3c76c295fd8937b441a74a1b71a1f9d2', 'admin&pc@7cfdb89fb385d000abb62786d549a7a3', '7200', '1', '2018-06-27 21:56:52', '2018-06-27 21:56:52');
INSERT INTO `wancll_admin_tokens` VALUES ('71', '2', '2', 'pc', 'admin&pc@57b542d8d4c5d641d3b2364fc2002ad4', 'admin&pc@5473d07f653e73e0e2c6304facc4eec8', '7200', '1', '2018-06-27 22:03:25', '2018-06-27 22:03:25');
INSERT INTO `wancll_admin_tokens` VALUES ('72', '2', '2', 'pc', 'admin&pc@a71e01a5dc747cc9eebf374f138e679d', 'admin&pc@665a9383a98483604509b9bdc27319fa', '7200', '1', '2018-06-27 22:39:37', '2018-06-27 22:39:37');
INSERT INTO `wancll_admin_tokens` VALUES ('73', '2', '2', 'pc', 'admin&pc@14764419e738887a9d6f3e1b6531db75', 'admin&pc@379bd09247f01c0eaba73767ce9a36bb', '7200', '1', '2018-06-27 22:55:14', '2018-06-27 22:55:14');
INSERT INTO `wancll_admin_tokens` VALUES ('74', '2', '2', 'pc', 'admin&pc@d900190e2ed2e912fbcd2c6560b09f95', 'admin&pc@053275c4485a277b55462cf88752bc3f', '7200', '1', '2018-06-27 23:22:00', '2018-06-27 23:22:00');
INSERT INTO `wancll_admin_tokens` VALUES ('75', '2', '2', 'pc', 'admin&pc@92dc94e3ac0c0b123e103335151d3bf6', 'admin&pc@412e0566cd740011e2df991332bec377', '7200', '1', '2018-06-27 23:22:35', '2018-06-27 23:22:35');
INSERT INTO `wancll_admin_tokens` VALUES ('76', '2', '2', 'pc', 'admin&pc@6259de8d11a7742b0da8ae9aed1cf593', 'admin&pc@d47079cdbdf7eee9cd7fcabd384d2f33', '7200', '1', '2018-06-27 23:29:47', '2018-06-27 23:29:47');
INSERT INTO `wancll_admin_tokens` VALUES ('77', '2', '2', 'pc', 'admin&pc@37e0ebe052d829e9bab7900e569b876d', 'admin&pc@20241a61105cf2e1366b8bfebab7d67e', '7200', '1', '2018-06-28 08:12:28', '2018-06-28 08:12:28');
INSERT INTO `wancll_admin_tokens` VALUES ('78', '2', '2', 'pc', 'admin&pc@15eff326c65e52f065b69dc36f5e470f', 'admin&pc@37f5ccc2c8ab285d535b193d12fabc11', '7200', '1', '2018-06-28 10:29:02', '2018-06-28 10:29:02');
INSERT INTO `wancll_admin_tokens` VALUES ('79', '2', '2', 'pc', 'admin&pc@beff520b9f8bcf38048dd7a47bcac9e9', 'admin&pc@d868256b827e816e632d76b4f5a271fd', '7200', '1', '2018-06-28 10:36:03', '2018-06-28 10:36:03');
INSERT INTO `wancll_admin_tokens` VALUES ('80', '2', '2', 'pc', 'admin&pc@de9cb20865d86196c6c183dbafdcc902', 'admin&pc@1b4bf7f3d31050ab828ebd0a3c9a00da', '7200', '1', '2018-06-28 10:36:33', '2018-06-28 10:36:33');
INSERT INTO `wancll_admin_tokens` VALUES ('81', '2', '2', 'pc', 'admin&pc@3d2c1c6681575cd5211ccd56c95a80ed', 'admin&pc@ec3f586a4ae2445b61b707f2f778c98f', '7200', '1', '2018-06-28 10:56:22', '2018-06-28 10:56:22');
INSERT INTO `wancll_admin_tokens` VALUES ('82', '2', '2', 'pc', 'admin&pc@c09f05c03457c9cdf0592f6224038db0', 'admin&pc@59ff1795e1873dcc381fc6322b0129eb', '7200', '1', '2018-06-28 11:22:15', '2018-06-28 11:22:15');
INSERT INTO `wancll_admin_tokens` VALUES ('83', '2', '2', 'pc', 'admin&pc@2720a9943e8faef45175fdfea085ee73', 'admin&pc@51a933904562caed54e18232410666c5', '7200', '1', '2018-06-28 11:25:51', '2018-06-28 11:25:51');
INSERT INTO `wancll_admin_tokens` VALUES ('84', '2', '2', 'pc', 'admin&pc@2fdfdbdc5151fa6c64a108ab4d80cf47', 'admin&pc@ba9d0a5a1849cdce30c56dcb10b31998', '7200', '1', '2018-06-28 11:28:55', '2018-06-28 11:28:55');
INSERT INTO `wancll_admin_tokens` VALUES ('85', '2', '2', 'pc', 'admin&pc@6945dbc16e09b6c0448639bf83f39a32', 'admin&pc@c835c09c9b5203751c4c4da66fdeabcc', '7200', '1', '2018-06-28 11:30:12', '2018-06-28 11:30:12');
INSERT INTO `wancll_admin_tokens` VALUES ('86', '2', '2', 'pc', 'admin&pc@75b9a646fbad96ed9e26644c68ae59dc', 'admin&pc@ca55c73f3f8f75f41d3c0d18250ec49b', '7200', '1', '2018-06-28 11:32:49', '2018-06-28 11:32:49');
INSERT INTO `wancll_admin_tokens` VALUES ('87', '2', '2', 'pc', 'admin&pc@75cdce43acd1eef0a3a64c93116cb954', 'admin&pc@8b4f88207e02f9bfda8d09c0708b39d7', '7200', '1', '2018-06-28 11:45:13', '2018-06-28 11:45:13');
INSERT INTO `wancll_admin_tokens` VALUES ('88', '2', '2', 'pc', 'admin&pc@d271d1c380b303e26a22f5a954995b21', 'admin&pc@0a83940eb2f379bc27f7a7f2255fe11b', '7200', '1', '2018-06-28 11:48:23', '2018-06-28 11:48:23');
INSERT INTO `wancll_admin_tokens` VALUES ('89', '2', '2', 'pc', 'admin&pc@8c3258944a2baddb00dc09be0b97c80d', 'admin&pc@cb2dc1ed44cf37a1fc3f0d0e62ad68b8', '7200', '1', '2018-06-28 11:52:48', '2018-06-28 11:52:48');
INSERT INTO `wancll_admin_tokens` VALUES ('90', '2', '2', 'pc', 'admin&pc@3b75b23964a23c6a341890a42f664d6d', 'admin&pc@4522e04ee78c1376fa276c82e936f007', '7200', '1', '2018-06-28 12:01:18', '2018-06-28 12:01:18');
INSERT INTO `wancll_admin_tokens` VALUES ('91', '2', '2', 'pc', 'admin&pc@b46ddee9cddb3c5f76ccb01a6e180844', 'admin&pc@9230986ba50ebfa82b39916e9ad4c8f8', '7200', '1', '2018-06-28 12:03:57', '2018-06-28 12:03:57');
INSERT INTO `wancll_admin_tokens` VALUES ('92', '2', '2', 'pc', 'admin&pc@a21d70ab26cdb2cb3daf9e2b7d9591ec', 'admin&pc@7906575b0a9b0837bbdd8b4df4a4fc97', '7200', '1', '2018-06-28 13:53:28', '2018-06-28 13:53:28');
INSERT INTO `wancll_admin_tokens` VALUES ('93', '2', '2', 'pc', 'admin&pc@ea24f0af922b5a89a5ffca34ab5e3be7', 'admin&pc@715f6241b1bd9d50b6d0c379473805c6', '7200', '1', '2018-06-28 13:54:46', '2018-06-28 13:54:46');
INSERT INTO `wancll_admin_tokens` VALUES ('94', '2', '2', 'pc', 'admin&pc@968de7755fc25df8328c7a4a6ba05872', 'admin&pc@baa9c76074c9795a53c1080d8158437b', '7200', '1', '2018-06-28 13:57:02', '2018-06-28 13:57:02');
INSERT INTO `wancll_admin_tokens` VALUES ('95', '2', '2', 'pc', 'admin&pc@a4d084da1076594bbeb8284d387f4619', 'admin&pc@9bc6f0b5082f75c4880407f48cfef3f5', '7200', '1', '2018-06-28 14:20:45', '2018-06-28 14:20:45');

-- -----------------------------
-- Table structure for `wancll_admin_visit_logs`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_admin_visit_logs`;
CREATE TABLE `wancll_admin_visit_logs` (
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
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_visit_logs`
-- -----------------------------
INSERT INTO `wancll_admin_visit_logs` VALUES ('1', '2', '2', '113.246.203.190', '2018-06-14 17:25:34', 'pc', '1', '2018-06-14 17:25:34', '2018-06-14 17:25:34');
INSERT INTO `wancll_admin_visit_logs` VALUES ('2', '2', '2', '113.246.203.190', '2018-06-14 17:35:05', 'pc', '1', '2018-06-14 17:35:05', '2018-06-14 17:35:05');
INSERT INTO `wancll_admin_visit_logs` VALUES ('3', '2', '2', '113.246.203.190', '2018-06-14 17:41:33', 'pc', '1', '2018-06-14 17:41:33', '2018-06-14 17:41:33');
INSERT INTO `wancll_admin_visit_logs` VALUES ('4', '2', '2', '113.246.203.190', '2018-06-15 09:39:14', 'pc', '1', '2018-06-15 09:39:14', '2018-06-15 09:39:14');
INSERT INTO `wancll_admin_visit_logs` VALUES ('5', '2', '2', '113.246.203.190', '2018-06-15 09:40:02', 'pc', '1', '2018-06-15 09:40:02', '2018-06-15 09:40:02');
INSERT INTO `wancll_admin_visit_logs` VALUES ('6', '2', '2', '113.246.203.190', '2018-06-15 09:44:57', 'pc', '1', '2018-06-15 09:44:57', '2018-06-15 09:44:57');
INSERT INTO `wancll_admin_visit_logs` VALUES ('7', '2', '2', '113.246.203.190', '2018-06-15 10:32:32', 'pc', '1', '2018-06-15 10:32:32', '2018-06-15 10:32:32');
INSERT INTO `wancll_admin_visit_logs` VALUES ('8', '2', '2', '113.246.203.190', '2018-06-15 11:22:00', 'pc', '1', '2018-06-15 11:22:00', '2018-06-15 11:22:00');
INSERT INTO `wancll_admin_visit_logs` VALUES ('9', '2', '2', '113.246.203.190', '2018-06-15 11:29:19', 'pc', '1', '2018-06-15 11:29:19', '2018-06-15 11:29:19');
INSERT INTO `wancll_admin_visit_logs` VALUES ('10', '2', '2', '113.246.203.190', '2018-06-15 11:44:11', 'pc', '1', '2018-06-15 11:44:11', '2018-06-15 11:44:11');
INSERT INTO `wancll_admin_visit_logs` VALUES ('11', '2', '2', '113.246.203.190', '2018-06-15 11:58:45', 'pc', '1', '2018-06-15 11:58:45', '2018-06-15 11:58:45');
INSERT INTO `wancll_admin_visit_logs` VALUES ('12', '2', '2', '113.246.203.190', '2018-06-15 13:42:48', 'pc', '1', '2018-06-15 13:42:48', '2018-06-15 13:42:48');
INSERT INTO `wancll_admin_visit_logs` VALUES ('13', '2', '2', '113.246.203.190', '2018-06-15 13:49:56', 'pc', '1', '2018-06-15 13:49:56', '2018-06-15 13:49:56');
INSERT INTO `wancll_admin_visit_logs` VALUES ('14', '2', '2', '113.246.203.190', '2018-06-15 13:50:43', 'pc', '1', '2018-06-15 13:50:43', '2018-06-15 13:50:43');
INSERT INTO `wancll_admin_visit_logs` VALUES ('15', '2', '2', '113.246.203.190', '2018-06-15 13:58:02', 'pc', '1', '2018-06-15 13:58:02', '2018-06-15 13:58:02');
INSERT INTO `wancll_admin_visit_logs` VALUES ('16', '2', '2', '113.246.203.190', '2018-06-15 14:30:16', 'pc', '1', '2018-06-15 14:30:16', '2018-06-15 14:30:16');
INSERT INTO `wancll_admin_visit_logs` VALUES ('17', '2', '2', '113.246.203.190', '2018-06-15 15:26:51', 'pc', '1', '2018-06-15 15:26:51', '2018-06-15 15:26:51');
INSERT INTO `wancll_admin_visit_logs` VALUES ('18', '2', '2', '113.246.200.165', '2018-06-15 18:20:13', 'pc', '1', '2018-06-15 18:20:13', '2018-06-15 18:20:13');
INSERT INTO `wancll_admin_visit_logs` VALUES ('19', '2', '2', '113.246.203.190', '2018-06-15 18:33:57', 'pc', '1', '2018-06-15 18:33:57', '2018-06-15 18:33:57');
INSERT INTO `wancll_admin_visit_logs` VALUES ('20', '2', '2', '175.8.204.205', '2018-06-16 09:51:10', 'pc', '1', '2018-06-16 09:51:10', '2018-06-16 09:51:10');
INSERT INTO `wancll_admin_visit_logs` VALUES ('21', '2', '2', '113.246.200.165', '2018-06-16 10:59:53', 'pc', '1', '2018-06-16 10:59:53', '2018-06-16 10:59:53');
INSERT INTO `wancll_admin_visit_logs` VALUES ('22', '2', '2', '175.8.204.205', '2018-06-16 12:02:24', 'pc', '1', '2018-06-16 12:02:24', '2018-06-16 12:02:24');
INSERT INTO `wancll_admin_visit_logs` VALUES ('23', '2', '2', '175.8.204.205', '2018-06-16 16:32:25', 'pc', '1', '2018-06-16 16:32:25', '2018-06-16 16:32:25');
INSERT INTO `wancll_admin_visit_logs` VALUES ('24', '2', '2', '113.247.51.0', '2018-06-19 10:16:19', 'pc', '1', '2018-06-19 10:16:19', '2018-06-19 10:16:19');
INSERT INTO `wancll_admin_visit_logs` VALUES ('25', '2', '2', '113.247.51.0', '2018-06-19 11:52:03', 'pc', '1', '2018-06-19 11:52:03', '2018-06-19 11:52:03');
INSERT INTO `wancll_admin_visit_logs` VALUES ('26', '2', '2', '113.247.12.35', '2018-06-19 14:09:32', 'pc', '1', '2018-06-19 14:09:32', '2018-06-19 14:09:32');
INSERT INTO `wancll_admin_visit_logs` VALUES ('27', '2', '2', '113.247.51.0', '2018-06-19 14:26:40', 'pc', '1', '2018-06-19 14:26:40', '2018-06-19 14:26:40');
INSERT INTO `wancll_admin_visit_logs` VALUES ('28', '2', '2', '113.247.51.0', '2018-06-19 14:46:01', 'pc', '1', '2018-06-19 14:46:01', '2018-06-19 14:46:01');
INSERT INTO `wancll_admin_visit_logs` VALUES ('29', '2', '2', '113.247.51.0', '2018-06-19 15:40:00', 'pc', '1', '2018-06-19 15:40:00', '2018-06-19 15:40:00');
INSERT INTO `wancll_admin_visit_logs` VALUES ('30', '2', '2', '113.247.51.0', '2018-06-19 15:53:32', 'pc', '1', '2018-06-19 15:53:32', '2018-06-19 15:53:32');
INSERT INTO `wancll_admin_visit_logs` VALUES ('31', '2', '2', '113.247.51.0', '2018-06-19 15:57:39', 'pc', '1', '2018-06-19 15:57:39', '2018-06-19 15:57:39');
INSERT INTO `wancll_admin_visit_logs` VALUES ('32', '2', '2', '113.247.51.0', '2018-06-19 17:47:00', 'pc', '1', '2018-06-19 17:47:00', '2018-06-19 17:47:00');
INSERT INTO `wancll_admin_visit_logs` VALUES ('33', '2', '2', '113.247.51.0', '2018-06-19 18:40:31', 'pc', '1', '2018-06-19 18:40:31', '2018-06-19 18:40:31');
INSERT INTO `wancll_admin_visit_logs` VALUES ('34', '2', '2', '113.247.51.0', '2018-06-19 20:33:23', 'pc', '1', '2018-06-19 20:33:23', '2018-06-19 20:33:23');
INSERT INTO `wancll_admin_visit_logs` VALUES ('35', '2', '2', '127.0.0.1', '2018-06-19 20:36:34', 'pc', '1', '2018-06-19 20:36:34', '2018-06-19 20:36:34');
INSERT INTO `wancll_admin_visit_logs` VALUES ('36', '2', '2', '127.0.0.1', '2018-06-19 21:17:05', 'pc', '1', '2018-06-19 21:17:05', '2018-06-19 21:17:05');
INSERT INTO `wancll_admin_visit_logs` VALUES ('37', '2', '2', '113.247.50.169', '2018-06-20 08:55:07', 'pc', '1', '2018-06-20 08:55:07', '2018-06-20 08:55:07');
INSERT INTO `wancll_admin_visit_logs` VALUES ('38', '2', '2', '113.247.12.35', '2018-06-20 11:04:05', 'pc', '1', '2018-06-20 11:04:05', '2018-06-20 11:04:05');
INSERT INTO `wancll_admin_visit_logs` VALUES ('39', '2', '2', '113.247.50.169', '2018-06-20 11:48:33', 'pc', '1', '2018-06-20 11:48:34', '2018-06-20 11:48:34');
INSERT INTO `wancll_admin_visit_logs` VALUES ('40', '2', '2', '113.247.50.169', '2018-06-20 14:42:50', 'pc', '1', '2018-06-20 14:42:50', '2018-06-20 14:42:50');
INSERT INTO `wancll_admin_visit_logs` VALUES ('41', '2', '2', '127.0.0.1', '2018-06-20 17:57:01', 'pc', '1', '2018-06-20 17:57:01', '2018-06-20 17:57:01');
INSERT INTO `wancll_admin_visit_logs` VALUES ('42', '2', '2', '127.0.0.1', '2018-06-20 21:32:25', 'pc', '1', '2018-06-20 21:32:25', '2018-06-20 21:32:25');
INSERT INTO `wancll_admin_visit_logs` VALUES ('43', '2', '2', '127.0.0.1', '2018-06-22 08:35:17', 'pc', '1', '2018-06-22 08:35:17', '2018-06-22 08:35:17');
INSERT INTO `wancll_admin_visit_logs` VALUES ('44', '2', '2', '127.0.0.1', '2018-06-22 09:51:06', 'pc', '1', '2018-06-22 09:51:06', '2018-06-22 09:51:06');
INSERT INTO `wancll_admin_visit_logs` VALUES ('45', '2', '2', '127.0.0.1', '2018-06-22 17:06:51', 'pc', '1', '2018-06-22 17:06:51', '2018-06-22 17:06:51');
INSERT INTO `wancll_admin_visit_logs` VALUES ('46', '2', '2', '192.168.31.60', '2018-06-23 09:11:08', 'pc', '1', '2018-06-23 09:11:08', '2018-06-23 09:11:08');
INSERT INTO `wancll_admin_visit_logs` VALUES ('47', '2', '2', '192.168.31.60', '2018-06-23 09:54:26', 'pc', '1', '2018-06-23 09:54:26', '2018-06-23 09:54:26');
INSERT INTO `wancll_admin_visit_logs` VALUES ('48', '2', '2', '192.168.31.60', '2018-06-23 11:10:23', 'pc', '1', '2018-06-23 11:10:23', '2018-06-23 11:10:23');
INSERT INTO `wancll_admin_visit_logs` VALUES ('49', '2', '2', '192.168.31.60', '2018-06-23 11:11:54', 'pc', '1', '2018-06-23 11:11:54', '2018-06-23 11:11:54');
INSERT INTO `wancll_admin_visit_logs` VALUES ('50', '2', '2', '192.168.31.60', '2018-06-23 11:33:37', 'pc', '1', '2018-06-23 11:33:37', '2018-06-23 11:33:37');
INSERT INTO `wancll_admin_visit_logs` VALUES ('51', '2', '2', '127.0.0.1', '2018-06-23 15:30:28', 'pc', '1', '2018-06-23 15:30:28', '2018-06-23 15:30:28');
INSERT INTO `wancll_admin_visit_logs` VALUES ('52', '2', '2', '192.168.31.183', '2018-06-25 08:52:03', 'pc', '1', '2018-06-25 08:52:03', '2018-06-25 08:52:03');
INSERT INTO `wancll_admin_visit_logs` VALUES ('53', '2', '2', '192.168.31.60', '2018-06-25 09:04:39', 'pc', '1', '2018-06-25 09:04:39', '2018-06-25 09:04:39');
INSERT INTO `wancll_admin_visit_logs` VALUES ('54', '2', '2', '192.168.31.60', '2018-06-25 09:27:45', 'pc', '1', '2018-06-25 09:27:45', '2018-06-25 09:27:45');
INSERT INTO `wancll_admin_visit_logs` VALUES ('55', '2', '2', '192.168.31.60', '2018-06-25 09:32:26', 'pc', '1', '2018-06-25 09:32:26', '2018-06-25 09:32:26');
INSERT INTO `wancll_admin_visit_logs` VALUES ('56', '2', '2', '192.168.31.60', '2018-06-25 10:07:00', 'pc', '1', '2018-06-25 10:07:00', '2018-06-25 10:07:00');
INSERT INTO `wancll_admin_visit_logs` VALUES ('57', '2', '2', '192.168.31.60', '2018-06-25 10:12:26', 'pc', '1', '2018-06-25 10:12:26', '2018-06-25 10:12:26');
INSERT INTO `wancll_admin_visit_logs` VALUES ('58', '2', '2', '192.168.31.60', '2018-06-25 22:55:44', 'pc', '1', '2018-06-25 22:55:44', '2018-06-25 22:55:44');
INSERT INTO `wancll_admin_visit_logs` VALUES ('59', '2', '2', '192.168.31.183', '2018-06-26 09:11:36', 'pc', '1', '2018-06-26 09:11:36', '2018-06-26 09:11:36');
INSERT INTO `wancll_admin_visit_logs` VALUES ('60', '2', '2', '192.168.31.60', '2018-06-26 10:28:52', 'pc', '1', '2018-06-26 10:28:52', '2018-06-26 10:28:52');
INSERT INTO `wancll_admin_visit_logs` VALUES ('61', '2', '2', '192.168.31.9', '2018-06-26 16:03:31', 'pc', '1', '2018-06-26 16:03:31', '2018-06-26 16:03:31');
INSERT INTO `wancll_admin_visit_logs` VALUES ('62', '2', '2', '192.168.31.60', '2018-06-27 10:29:52', 'pc', '1', '2018-06-27 10:29:52', '2018-06-27 10:29:52');
INSERT INTO `wancll_admin_visit_logs` VALUES ('63', '2', '2', '192.168.31.60', '2018-06-27 16:55:32', 'pc', '1', '2018-06-27 16:55:32', '2018-06-27 16:55:32');
INSERT INTO `wancll_admin_visit_logs` VALUES ('64', '2', '2', '192.168.31.183', '2018-06-27 16:57:19', 'pc', '1', '2018-06-27 16:57:19', '2018-06-27 16:57:19');
INSERT INTO `wancll_admin_visit_logs` VALUES ('65', '2', '2', '192.168.31.60', '2018-06-27 17:18:30', 'pc', '1', '2018-06-27 17:18:30', '2018-06-27 17:18:30');
INSERT INTO `wancll_admin_visit_logs` VALUES ('66', '2', '2', '192.168.31.60', '2018-06-27 17:57:01', 'pc', '1', '2018-06-27 17:57:01', '2018-06-27 17:57:01');
INSERT INTO `wancll_admin_visit_logs` VALUES ('67', '2', '2', '192.168.31.60', '2018-06-27 21:05:13', 'pc', '1', '2018-06-27 21:05:13', '2018-06-27 21:05:13');
INSERT INTO `wancll_admin_visit_logs` VALUES ('68', '2', '2', '192.168.31.60', '2018-06-27 21:52:52', 'pc', '1', '2018-06-27 21:52:52', '2018-06-27 21:52:52');
INSERT INTO `wancll_admin_visit_logs` VALUES ('69', '2', '2', '192.168.31.60', '2018-06-27 21:54:17', 'pc', '1', '2018-06-27 21:54:17', '2018-06-27 21:54:17');
INSERT INTO `wancll_admin_visit_logs` VALUES ('70', '2', '2', '192.168.31.60', '2018-06-27 21:56:52', 'pc', '1', '2018-06-27 21:56:52', '2018-06-27 21:56:52');
INSERT INTO `wancll_admin_visit_logs` VALUES ('71', '2', '2', '192.168.31.60', '2018-06-27 22:03:25', 'pc', '1', '2018-06-27 22:03:25', '2018-06-27 22:03:25');
INSERT INTO `wancll_admin_visit_logs` VALUES ('72', '2', '2', '192.168.31.60', '2018-06-27 22:39:37', 'pc', '1', '2018-06-27 22:39:37', '2018-06-27 22:39:37');
INSERT INTO `wancll_admin_visit_logs` VALUES ('73', '2', '2', '192.168.31.60', '2018-06-27 22:55:14', 'pc', '1', '2018-06-27 22:55:14', '2018-06-27 22:55:14');
INSERT INTO `wancll_admin_visit_logs` VALUES ('74', '2', '2', '192.168.31.60', '2018-06-27 23:22:00', 'pc', '1', '2018-06-27 23:22:00', '2018-06-27 23:22:00');
INSERT INTO `wancll_admin_visit_logs` VALUES ('75', '2', '2', '192.168.31.60', '2018-06-27 23:22:35', 'pc', '1', '2018-06-27 23:22:35', '2018-06-27 23:22:35');
INSERT INTO `wancll_admin_visit_logs` VALUES ('76', '2', '2', '192.168.31.60', '2018-06-27 23:29:47', 'pc', '1', '2018-06-27 23:29:47', '2018-06-27 23:29:47');
INSERT INTO `wancll_admin_visit_logs` VALUES ('77', '2', '2', '192.168.31.183', '2018-06-28 08:12:28', 'pc', '1', '2018-06-28 08:12:28', '2018-06-28 08:12:28');
INSERT INTO `wancll_admin_visit_logs` VALUES ('78', '2', '2', '192.168.31.60', '2018-06-28 10:29:02', 'pc', '1', '2018-06-28 10:29:02', '2018-06-28 10:29:02');
INSERT INTO `wancll_admin_visit_logs` VALUES ('79', '2', '2', '192.168.31.60', '2018-06-28 10:36:03', 'pc', '1', '2018-06-28 10:36:03', '2018-06-28 10:36:03');
INSERT INTO `wancll_admin_visit_logs` VALUES ('80', '2', '2', '192.168.31.60', '2018-06-28 10:36:33', 'pc', '1', '2018-06-28 10:36:33', '2018-06-28 10:36:33');
INSERT INTO `wancll_admin_visit_logs` VALUES ('81', '2', '2', '192.168.31.60', '2018-06-28 10:56:22', 'pc', '1', '2018-06-28 10:56:22', '2018-06-28 10:56:22');
INSERT INTO `wancll_admin_visit_logs` VALUES ('82', '2', '2', '127.0.0.1', '2018-06-28 11:22:15', 'pc', '1', '2018-06-28 11:22:16', '2018-06-28 11:22:16');
INSERT INTO `wancll_admin_visit_logs` VALUES ('83', '2', '2', '192.168.31.91', '2018-06-28 11:25:51', 'pc', '1', '2018-06-28 11:25:51', '2018-06-28 11:25:51');
INSERT INTO `wancll_admin_visit_logs` VALUES ('84', '2', '2', '192.168.31.91', '2018-06-28 11:28:55', 'pc', '1', '2018-06-28 11:28:55', '2018-06-28 11:28:55');
INSERT INTO `wancll_admin_visit_logs` VALUES ('85', '2', '2', '192.168.31.91', '2018-06-28 11:30:12', 'pc', '1', '2018-06-28 11:30:12', '2018-06-28 11:30:12');
INSERT INTO `wancll_admin_visit_logs` VALUES ('86', '2', '2', '192.168.31.91', '2018-06-28 11:32:49', 'pc', '1', '2018-06-28 11:32:49', '2018-06-28 11:32:49');
INSERT INTO `wancll_admin_visit_logs` VALUES ('87', '2', '2', '127.0.0.1', '2018-06-28 11:45:13', 'pc', '1', '2018-06-28 11:45:13', '2018-06-28 11:45:13');
INSERT INTO `wancll_admin_visit_logs` VALUES ('88', '2', '2', '192.168.31.183', '2018-06-28 11:48:23', 'pc', '1', '2018-06-28 11:48:23', '2018-06-28 11:48:23');
INSERT INTO `wancll_admin_visit_logs` VALUES ('89', '2', '2', '192.168.31.91', '2018-06-28 11:52:48', 'pc', '1', '2018-06-28 11:52:48', '2018-06-28 11:52:48');
INSERT INTO `wancll_admin_visit_logs` VALUES ('90', '2', '2', '192.168.31.91', '2018-06-28 12:01:18', 'pc', '1', '2018-06-28 12:01:18', '2018-06-28 12:01:18');
INSERT INTO `wancll_admin_visit_logs` VALUES ('91', '2', '2', '192.168.31.91', '2018-06-28 12:03:57', 'pc', '1', '2018-06-28 12:03:57', '2018-06-28 12:03:57');
INSERT INTO `wancll_admin_visit_logs` VALUES ('92', '2', '2', '192.168.31.60', '2018-06-28 13:53:28', 'pc', '1', '2018-06-28 13:53:28', '2018-06-28 13:53:28');
INSERT INTO `wancll_admin_visit_logs` VALUES ('93', '2', '2', '192.168.31.183', '2018-06-28 13:54:46', 'pc', '1', '2018-06-28 13:54:46', '2018-06-28 13:54:46');
INSERT INTO `wancll_admin_visit_logs` VALUES ('94', '2', '2', '192.168.31.183', '2018-06-28 13:57:02', 'pc', '1', '2018-06-28 13:57:02', '2018-06-28 13:57:02');
INSERT INTO `wancll_admin_visit_logs` VALUES ('95', '2', '2', '192.168.31.60', '2018-06-28 14:20:45', 'pc', '1', '2018-06-28 14:20:45', '2018-06-28 14:20:45');

-- -----------------------------
-- Table structure for `wancll_admins`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_admins`;
CREATE TABLE `wancll_admins` (
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
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0假删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admins`
-- -----------------------------
INSERT INTO `wancll_admins` VALUES ('1', '', '', '', 'yiyun', '', '', '', '', '', '', '[\"3\"]', '1', '1', '2018-04-10 16:40:36', '2018-04-11 16:46:56');
INSERT INTO `wancll_admins` VALUES ('2', '18888888888', '', '', 'admin', '/public/upload/images/1529488699642.jpg', '', '', '', '', '', '[\"3\"]', '1', '1', '2018-04-10 16:40:48', '2018-04-11 16:46:56');
INSERT INTO `wancll_admins` VALUES ('3', '', '', '', 'test', '', '', '', '', '', '', '\"\"', '1', '0', '2018-04-11 10:22:20', '2018-04-11 10:30:41');
INSERT INTO `wancll_admins` VALUES ('4', '', '', '', 'test', '', '', '', '', '', '', '\"\"', '1', '1', '2018-04-11 14:09:07', '2018-04-11 16:46:56');

-- -----------------------------
-- Table structure for `wancll_advertisements`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_advertisements`;
CREATE TABLE `wancll_advertisements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '广告类型',
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_advertisements`
-- -----------------------------
INSERT INTO `wancll_advertisements` VALUES ('1', 'wap首页广告', 'wap首页广告', '/public/upload/images/1523973499191.jpg', '', '', '1', 'http://www.baidu.com', '1', 'article', '1', '1', '1', '2018-04-17 21:58:19', '2018-04-17 21:58:19');
INSERT INTO `wancll_advertisements` VALUES ('2', 'wap首页广告', 'wap首页广告1', '/public/upload/images/1523973510890.jpg', '', '', '2', '', '1', 'goods', '39', '1', '1', '2018-04-17 21:58:30', '2018-04-17 21:58:30');
INSERT INTO `wancll_advertisements` VALUES ('3', 'wap首页广告', 'wap首页广告2', '/public/upload/images/1523973523482.jpg', '', '', '2', 'https://www.baidu.com', '0', '', '0', '1', '1', '2018-04-17 21:58:43', '2018-04-17 21:58:43');
INSERT INTO `wancll_advertisements` VALUES ('4', 'wap限时折扣广告图', 'wap限时折扣广告图1', '/public/upload/images/1524119343222.jpg', '', '', '', '', '0', '', '0', '1', '1', '2018-04-19 14:29:03', '2018-04-19 14:29:03');
INSERT INTO `wancll_advertisements` VALUES ('5', 'pc端搜索页广告', 'pc端搜索页底部广告', '/public/upload/images/1525943525803.jpg', '', '', '2', '', '0', '', '0', '1', '1', '2018-05-10 17:12:05', '2018-05-10 17:12:05');
INSERT INTO `wancll_advertisements` VALUES ('6', 'pc端搜索页广告', 'pc端搜索页底部广告', '/public/upload/images/1525944382887.jpg', '', '', '', '', '0', '', '0', '1', '1', '2018-05-10 17:26:22', '2018-05-10 17:26:22');
INSERT INTO `wancll_advertisements` VALUES ('7', 'pc端搜索页广告', 'pc端搜索页底部广告', '/public/upload/images/1525944408902.jpg', '', '', '', '', '0', '', '0', '1', '1', '2018-05-10 17:26:48', '2018-05-10 17:26:48');
INSERT INTO `wancll_advertisements` VALUES ('8', 'pc端搜索页广告', 'pc端搜索页底部广告', '/public/upload/images/1525944433251.jpg', '', '', '', '', '0', '', '0', '1', '1', '2018-05-10 17:27:13', '2018-05-10 17:27:13');
INSERT INTO `wancll_advertisements` VALUES ('9', 'pc广告', 'pc端首页广告图', '/public/upload/images/1526031004885.jpg', '', '', '1', 'http://wancllshop.wx.wygoo.com/', '0', '', '0', '1', '1', '2018-05-11 17:30:04', '2018-05-11 17:30:04');
INSERT INTO `wancll_advertisements` VALUES ('10', 'pc广告', 'pc首页广告图', '/public/upload/images/1526031063565.jpg', '', '', '1', 'http://wancllshop.wx.wygoo.com/', '0', '', '0', '1', '1', '2018-05-11 17:31:03', '2018-05-11 17:31:03');
INSERT INTO `wancll_advertisements` VALUES ('11', 'pc广告', 'pc端首页广告', '/public/upload/images/1526031126133.jpg', '', '', '1', 'http://wancllshop.wx.wygoo.com/', '0', '', '0', '1', '1', '2018-05-11 17:32:06', '2018-05-11 17:32:06');
INSERT INTO `wancll_advertisements` VALUES ('12', 'pc折扣广告', 'pc首页折扣广告', '/public/upload/images/1527042957655.jpg', '', '', '1', '', '0', '', '0', '1', '1', '2018-05-23 10:35:57', '2018-05-23 10:35:57');

-- -----------------------------
-- Table structure for `wancll_annoncements`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_annoncements`;
CREATE TABLE `wancll_annoncements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_annoncements`
-- -----------------------------
INSERT INTO `wancll_annoncements` VALUES ('1', 'wap首页公告', '拥有10亿微信用户的小程序，最大的移动互联网商机，你非做不可 ', '', '', '', '[]', '<p>防守打法</p>', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '1', '2018-04-17 22:00:22', '2018-04-17 22:00:22');
INSERT INTO `wancll_annoncements` VALUES ('2', 'wap首页公告', '会乘电梯、会让路，继菜鸟京东之后，苏宁也推出无人快递车', '', '', '', '[]', '<p>防守打法</p>', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '1', '2018-04-17 22:00:37', '2018-04-17 22:00:37');

-- -----------------------------
-- Table structure for `wancll_article_types`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_article_types`;
CREATE TABLE `wancll_article_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT '0' COMMENT '分类父ID',
  `thum` varchar(255) DEFAULT NULL COMMENT '分类缩略图',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '文章分类的状态：1正常2隐藏',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '分类的状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_article_types`
-- -----------------------------
INSERT INTO `wancll_article_types` VALUES ('1', '0', '', '活动通知', '活动通知', '1', '0', '2018-05-04 00:22:02', '2018-05-28 17:17:12');
INSERT INTO `wancll_article_types` VALUES ('2', '0', '', '我的公告', '公告管理', '1', '1', '2018-05-10 11:53:59', '2018-05-10 11:53:59');
INSERT INTO `wancll_article_types` VALUES ('3', '0', '', '物流信息', '物流信息', '1', '0', '2018-05-10 11:54:18', '2018-05-10 16:02:38');
INSERT INTO `wancll_article_types` VALUES ('4', '0', '', '通用文章', '通用文章', '1', '0', '2018-05-10 11:54:36', '2018-05-10 16:02:41');
INSERT INTO `wancll_article_types` VALUES ('5', '0', '', '通用文章', '通用文章', '1', '1', '2018-05-11 03:41:41', '2018-05-11 03:41:41');
INSERT INTO `wancll_article_types` VALUES ('6', '0', '', '操作手册', '', '1', '1', '2018-05-25 16:24:57', '2018-05-25 16:24:57');

-- -----------------------------
-- Table structure for `wancll_articles`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_articles`;
CREATE TABLE `wancll_articles` (
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_articles`
-- -----------------------------
INSERT INTO `wancll_articles` VALUES ('1', '测试时 ', '', '低洼的', '<p>111111111111222222asdas12da1sd1a</p>', 'DD', '[]', '', '', '1', '0', '1', '', '0', '2018-05-04 17:49:57', '2018-05-10 16:01:44');
INSERT INTO `wancll_articles` VALUES ('2', '2000', '', '2020', '<p>202121210</p>', '222', '[]', '', '', '4', '0', '1', '', '0', '2018-05-10 13:48:35', '2018-05-10 16:01:46');
INSERT INTO `wancll_articles` VALUES ('3', '活动管理', '', '123', '<p>123123</p>', '罗大大', '[]', '', '', '2', '0', '1', '', '0', '2018-05-10 16:00:07', '2018-05-10 16:01:47');
INSERT INTO `wancll_articles` VALUES ('4', '现实', '/public/upload/images/1525941045799.jpg', '来源:原创投稿', '<p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">忘却又何尝不是记忆的一种形式。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">有时忘却的是极力在选择逃避。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">你看到的盲目风清是逃避的一种，</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">你永远不懂那逃避的背后是多么残忍的痛。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">一曰残忍谓之痛</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">二曰痛之所及谓之悲</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">三曰悲痛交集处谓之蠢</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">此三曰至及又是怎样一种撕心裂肺的逢场作戏</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">谁微笑着享受辜负，</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">谁是谁的今生救赎？</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">当太阳西沉</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">许是所有如初的美好</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">不过风景旧曾谙。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">仗剑天涯</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">孤坐未央，</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">千里字行，</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">无语凝噎。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 1em; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, \">——这便是现实！</p><p><br/></p>', '文／秋天的风', '[]', '', '', '1', '0', '1', '', '1', '2018-05-10 16:04:59', '2018-05-10 16:04:59');
INSERT INTO `wancll_articles` VALUES ('5', '大度也是一种美德', '/public/upload/images/1525941638949.jpg', '有一位著名的音乐家，在成名前曾经担任过俄国彼德耶夫公爵家的私人乐队的队长。\n\n突然有一天，公爵决定解散这支乐队，乐手们听到这个消息的时候，一时间全都面面相觑、心慌意乱，不知道如何是好。看着这些和自己一起同甘共苦许多年的亲密战友，他睡不安寝、食不甘味，绞尽脑汁、想来想去，忽然有了一个主意。', '<p style=\"font-family: \">他立即谱写了一首《告别曲》，说是要为公爵做最后一场独特的告别演出，公爵同意了。</p><p style=\"font-family: \">这一天晚上，因为是最后一次为公爵演奏，乐手们表情呆滞、万念俱灰，根本打不起精神，但是看在与公爵一家相处这些日子的情份上，大家还是竭尽所能、尽心尽力地演奏起来。</p><p style=\"font-family: \">这首乐曲的旋律一开始极其欢悦优美，把与公爵之间的<a href=\"http://www.duwenzhang.com/\" style=\"color: rgb(51, 51, 51); text-decoration-line: none;\">情感</a>和<a href=\"http://www.duwenzhang.com/huati/meihao/index1.html\" style=\"color: rgb(51, 51, 51); text-decoration-line: none;\">美好</a>的<a href=\"http://www.duwenzhang.com/huati/youyi/index1.html\" style=\"color: rgb(51, 51, 51); text-decoration-line: none;\">友谊</a>表达得淋漓尽致，公爵深受<a href=\"http://www.duwenzhang.com/huati/gandong/index1.html\" style=\"color: rgb(51, 51, 51); text-decoration-line: none;\">感动</a>。渐渐地，乐曲由明快转为委婉，又渐渐转为低沉，最后，<a href=\"http://www.duwenzhang.com/huati/beishang/index1.html\" style=\"color: rgb(51, 51, 51); text-decoration-line: none;\">悲伤</a>的情调在大厅里弥漫开来。</p><p style=\"font-family: \">这时，只见一位乐手停了下来，吹灭了乐谱上的蜡烛，向公爵深深地鞠了一躬，然后悄悄地<a href=\"http://www.duwenzhang.com/huati/likai/index1.html\" style=\"color: rgb(51, 51, 51); text-decoration-line: none;\">离开</a>了。过了一会儿，又有一名乐手以同样的方式离开了。就这样，乐手们一个接着一个地离去了，到了最后，空荡荡的大厅里，只留下了他一个人。只见他深深地向公爵鞠了一躬，吹熄了指挥架上的蜡烛，偌大的大厅刹那间暗下了下来。</p><p style=\"font-family: \">正当他也像其他乐手一样，真要独自默默地离开的时候，公爵的情绪已经达到了顶点，他再也忍不住了，大声地叫了起来：&quot;这是到底怎么一回事呢？&quot;他真诚而深情地回答说：&quot;公爵大人，这是我们全体乐队在向您做最后的告别呀！&quot;这时候公爵突然省悟了过来，情不自禁地流出了<a href=\"http://www.duwenzhang.com/huati/yanlei/index1.html\" style=\"color: rgb(51, 51, 51); text-decoration-line: none;\">眼泪</a>：&quot;啊！不！请让我再考虑一下。&quot;</p><p style=\"font-family: \">就这样，他用一首《告别曲》的奇特氛围，<a href=\"http://www.duwenzhang.com/huati/chenggong/index1.html\" style=\"color: rgb(51, 51, 51); text-decoration-line: none;\">成功</a>地使公爵将全体乐队队员留了下来。他就是被誉为&quot;音乐之父&quot;的世界著名音乐家－海登，</p><p style=\"font-family: \">在滚滚红尘中，作为芸芸众生的你我有不少人会这样做：你对我不好，我也不会对你好。比如，在被抛弃、被辞退、被退学的时候，往往会愤愤离去，甚至采取报复行为；还有这样一种情况，有的人在抛弃对方或者准备跳槽时，也不愿意给对方留下一个好的印象，结果出现了一种糟糕的结局。相反，海登深知，即便是最后的时光，也要一样无限美好地离去，为的是给双方留下一些更美好的或是更值得他日<a href=\"http://www.duwenzhang.com/huati/huiyi/index1.html\" style=\"color: rgb(51, 51, 51); text-decoration-line: none;\">回忆</a>的东西。结果，他的<a href=\"http://www.duwenzhang.com/huati/zhenqing/index1.html\" style=\"color: rgb(51, 51, 51); text-decoration-line: none;\">真情</a>大度告别扭转了局面。</p><p style=\"font-family: \">聪明如你我者，当你对他人多一点<a href=\"http://www.duwenzhang.com/huati/kuanrong/index1.html\" style=\"color: rgb(51, 51, 51); text-decoration-line: none;\">宽容</a>；多一点大度；多一点容忍；多一点体贴；多一点谅解，与此同时，你自己也会少一些忧愁；少一些<a href=\"http://www.duwenzhang.com/huati/fannao/index1.html\" style=\"color: rgb(51, 51, 51); text-decoration-line: none;\">烦恼</a>；少一些郁闷；少一些闷闷不乐；少一些不快；降低了耗气伤神的砝码，增加了健康<a href=\"http://www.duwenzhang.com/huati/kuaile/index1.html\" style=\"color: rgb(51, 51, 51); text-decoration-line: none;\">快乐</a>的基数，言外之意，善待他人益于己，即便是你不唱高调；也不说空话大话；全权只当是为你个人的长远利益着想，宽容大度一点儿没错！但又能有谁会说宽容大度不也是一种美德呢？</p><p><br/></p>', '作者： 来源：网络文章', '[]', '', '', '2', '0', '1', '', '1', '2018-05-10 16:37:11', '2018-05-10 16:37:11');
INSERT INTO `wancll_articles` VALUES ('6', '网开创商城服务条例', '', '版本生效日期：2017年08月21日', '<p>网开创商城服务条款</p><p>以下详述商城为您提供服务的条款。</p><p>本协议详述您在网开创商城（&quot;www.wancllshop.com&quot;）使用我们的服务所须遵守的条款和条件。如您有任何疑问，请及时联系我们。</p><p>您注册成为商城用户前，必须仔细阅读本用户协议和隐私声明，一旦您注册成为了商城用户即表示您已经阅读、同意并接受本用户协议和隐私声明中所含的所有条款和条件。如果我们对本声明进行了任何变更，我们会在商城网站页面上发布有关变更事项的通知，所有协议内容在发布之日后自动生效。如您不同意该修订，您必须终止您与商城的用户关系。</p><p> 一、用户注册：</p><p><span style=\"white-space:pre\">	</span>1.资料填写： 为确保交易的正常进行，用户必须向商城供真实、有效的个人资料，如个人资料有任何变动，必须及时在商城内进行更改。</p><p>2.一旦成功注册成为网开创商城会员，您将得到一个用户名和密码，您须对自己的用户名和密码的安全负全部责任。另外，每个用户都要对以其用户名进行的所有活动和事件负全责。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告网开创商城。</p><p>3.为保护您的个人权益，请勿使用重复性或者连续数字的简单密码，请勿将密码告知他人，如因密码保管不善造成的任何损失由用户个人承担。</p><p>4.用户使用手机号注册、重置密码、实名认证、手机绑定等网站服务时，网站发送的校验码您须严格保密，因校验码泄密造成的后果，由用户自行承担。</p><p>  二、 隐私：  商城设有适用于所有用户并纳入用户协议的隐私声明。您应当在注册时阅读并接受隐私声明以使用商城网站，且您在作为商城用户期间将继续受其规定（及商城对隐私声明作出的任何修订）的约束。 1.个人数据资料。包括用户在注册时和购买商品时填写的个人资料：如姓名、性别、年龄、出生日期、电话、通信地址、住址、电子邮件地址等信息。在未经您同意及确认之前，商城不会将您的资料用于其它目的。</p><p>2.网开创商城非常重视保护用户个人信息，凡涉及用户姓名、电话、详细地址、电子邮箱、帐号等个人信息的，网开创商城都将予以严格保密，但下列情况除外：</p><p>（1）事先获得用户的明确授权；</p><p>（2）法律法规或政府部门要求披露时；</p><p>（3）为维护社会公众利益必须披露时；</p><p>（4）为维护华为商城的合法利益而必须披露时。</p><p>3.您须知晓，尽管网开创商城已依照相关法律法规、强制性技术标准及规范，采取适当的并与网络服务相适应的措施，规划、设计和建立了用户数据系统处理流程，订立了较为完善的用户数据管理制度，并落实有关数据管理责任及必要的追溯体系，但网开创商城仍无法保证完全避免因黑客攻击、计算机病毒侵入或发作、第三方原因或其他原因造成的用户数据泄露、丢失、篡改、不当使用等数据安全/隐私侵犯事件。除非有关法律另行强制规定，您理解并同意，若不属网开创商城故意或明显过错造成的前述事件，不追究网开创商城因此类事件所造成的任何损害赔偿责任或违约责任。</p><p><br/></p><p><br/></p><p>三. 抽奖活动</p><p><br/></p>', '网开创', '[]', '', '', '5', '0', '1', '', '1', '2018-05-11 03:43:49', '2018-05-11 03:43:49');
INSERT INTO `wancll_articles` VALUES ('7', '测试', '', '测试', '<p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">在电商模式已完全成型、缺乏创新的环境下，马云在云栖大会上提出的新零售概念获得了业界的普遍关注。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">在马云的描述中，<strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">纯电商的时代已经过去，继续下去只会被市场淘汰，这种打通线上线下的新零售模式将会取代传统电商。</strong></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">&nbsp;</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">我们公司作为长沙本土的一家提供解决方案与技术集成的科技公司，为成千上万的企业提供了优质服务。<strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">为了响应国家领导人的号召，传统经济纷纷向数字经济转型。</strong></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><img src=\"http://www.wancll.com/public/upload/ueditor/image/20180429/1524968365913177.jpg\" title=\"1524968365913177.jpg\" alt=\"社区零售.jpg\"/></strong></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">▲马云在云栖大会上的演讲</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">在传统经济转型数字经济浪潮中，每一次创新，有人倒下就有人崛起。今天，我们就来讲述那些崛起的黑马故事！</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">&nbsp;</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">第一期要讲的是新零售模式下勇于尝试的开拓者，一个怀化的商家，主要是做蔬果类产品，在我们公司做了一个鲜乐淘商城。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">经过了解，没做商城之前是做传统零售业，有自己的门店和配送员。但是单单通过线下经营，用户和盈利很快就到天花板了，业绩停滞不前。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">&nbsp;</span></p><hr/><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(89, 89, 89); letter-spacing: 0.5px; font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important;\">1、商业模式的深入解析</span></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(192, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 0, 0); letter-spacing: 0.5px; box-sizing: border-box !important; word-wrap: break-word !important;\">如果你关注了鲜乐淘的微信公众号，</span></strong></span><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">就会发现鲜乐淘最大的特点就是连接、体验、参与</strong>。很好的把线上线下实现无缝连接，用户不仅能亲自到店体验服务，还能参与其中，实现真正意义上的人人都能当店长。</span></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">这个鲜乐淘除了有一个乐淘商城还有一个社区商城，社区商城就把整个怀化地区分为很多个小的地区，然后针对这些不同区域用户的喜好推荐相应喜欢的产品。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">而且鲜乐淘还有自己的门店和配送员，用户在商城下单后，商家能够第一时间把商品送到指定地点，这样就很好的营造了自己的品牌价值。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">每个社区都有自己的用户，如果把每个社区当做是一个点，那么社区越来越多，点也越来越多，最后把这些点连起来就成为一张巨大的网，覆盖了整个市区大大小小的地方。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><hr/><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(89, 89, 89); letter-spacing: 0.5px; font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important;\">2、实际运营计划与成效</span></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">在电商中，所有的商业模式都可以用一个公式来概括，就是：<strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">零售=流量x转化率x客单价</strong>。所以，这个乘出来的数字，当然越大越好。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">第一，如何获取流量。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">借助媒体曝光：由于怀化地处二、三线城市，新模式才刚刚兴起，在当地而言是一种全新的尝试。地方政府当然也会大力扶持，自然少不了大量媒体的争相曝光，<strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">有了媒体的曝光那知名度和品牌价值就有了</strong>。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">精准推广：在当今的快时代，人们很难有时间去线下购物，尤其是白领这些年轻人群，上完一天班很累了他们很少愿意去买水果蔬菜，而且也没有时间。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">时间被大量的APP占据着，<strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">而鲜乐淘正是基于有9亿活跃用户的微信打造的</strong>。所以，在小区进行地推时主要针对的就是年轻的白领用户。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">▲鲜乐淘商城的展示页面</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">熟人传播：互联网的流量红利正在消失，获取新用户的成本越来越大。但鲜乐淘设置分销机制，让人人搜成为店主，每个人都是消费者，也是代理商，从而使拓客成本大大降低，增加流量。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">第二，如何提高转化率。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">除了上述精准推广和熟人传播这两点有助于提高转换率。还有一点就是打造爆品，鲜乐淘会选取当季最好同时也是白领用户最喜爱的水果作为爆品。<strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">一件好的商品，本身就能带来更多的转化率。</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">第三，如何提高客单价</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">鲜乐淘会提供拼盘服务，把几种水果组合在一起，从而提高客单价。同时在摆放水果时也会根据用户的购买习惯，比如用户一般在购买完苹果后喜欢再买点橘子，就在摆放时把苹果和橘子放在一起。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><hr/><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">&nbsp;<strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(89, 89, 89); font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important;\">3、技术层面遇到的问题及解决方案</span></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">由于前期的推广效果很好，<strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">鲜乐淘商城在上线当天会员数就破万</strong>，服务器无法承受这么大的并发量，第一天就被用户挤爆了。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">很多用户在访问商城时出现访问速度慢，甚至有些访问不了的情况。通过对访问日志的查看和分析，发现新增加了很多会员，在这个时间段同时向服务器发送了大量请求，占用了服务器资源，导致出现访问速度很慢。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 0, 0); letter-spacing: 0.5px; box-sizing: border-box !important; word-wrap: break-word !important;\">鲜乐淘首页的图片原本就占用了很多的带宽，同时上万的访问量，就导致云服务器带宽根本不够用。</span></strong></span><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; box-sizing: border-box !important; word-wrap: break-word !important;\">为了不影响鲜乐淘商城当天的正常运营，我们技术人员在客户服务器上搭建了一个图片服务器。把鲜乐淘商城所有的图片文件转移到图片服务器上，同时增加服务器的带宽。</span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; box-sizing: border-box !important; word-wrap: break-word !important;\">有了图片服务器，可以把图片加载消耗带宽的压力分解，图片服务器消耗图片的带宽，而原来的服务器消耗的是加载静态页面和动态代码的带宽，这样就很好的避免带宽的压力过大而导致用户无法访问的问题。</span></strong></span></p><p style=\"white-space: normal; text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; box-sizing: border-box !important; word-wrap: break-word !important;\"><img src=\"http://www.wancll.com/public/upload/ueditor/image/20180429/1524968394611567.jpg\" title=\"1524968394611567.jpg\" alt=\"社区零售2.jpg\"/></span></strong></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 12px; box-sizing: border-box !important; word-wrap: break-word !important;\">▲图片服务器加载消耗带宽的过程图</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">我们公司本着以客户利益最大化的宗旨，在客户选择服务器的时候就为客户考虑周全。因为只有一个项目，所以运行内存用的是4G内存。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">计算量不大，用的是双核，带宽正常情况下5-6M的样子，访问图片高峰期差不多9M，那么10M的带宽肯定没问题。这样就为客户省下一笔不必要的经费，把利益做到了最大化。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">&nbsp;</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">经过了这次服务器大并发的紧急处理，我们又对鲜乐淘商城的系统方案进行了调整，通过对系统的二次开发来修改系统的部分功能使之能够更好的运营，<strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">由于第一次我们采用WANCLL API技术，对系统做了很好的架构，所以可以在二次开发过程中无缝升级，不影响运营数据。</strong></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">&nbsp;</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"></span></p><hr/><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(89, 89, 89); letter-spacing: 0.5px; font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important;\">4、大环境下的新零售</span></strong></span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(192, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"></strong></span></span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(192, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 0, 0); letter-spacing: 0.5px; box-sizing: border-box !important; word-wrap: break-word !important;\">小编觉得所有线下经营业态都可以概括为两个点，一个是服务，另一个则是产品。</span></strong></span><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; box-sizing: border-box !important; word-wrap: break-word !important;\">而服务型商家的售卖单位一般是时间，而产品型商家的售卖单位是件数，产品质量标准化。</span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(192, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 0, 0); letter-spacing: 0.5px; box-sizing: border-box !important; word-wrap: break-word !important;\">新零售的模式最大的一个优点就是，打通线上与线下，解决了传统零售流量天花板的问题。</span></strong></span><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; box-sizing: border-box !important; word-wrap: break-word !important;\">又很好的涵盖了线下场景不能转化的痛点，很好的把线上和线下连接起来。</span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">而这个鲜乐淘的客户，线上有自己的流量渠道，线下也有自己的门店。这样的模式和新零售就不谋而合了。在线上渠道崛起之后，牢牢抓住线上流量；与此同时还能兼顾到线下。</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><img class=\"\" src=\"https://mmbiz.qpic.cn/mmbiz_jpg/BsKMOB0Qhn21fmtTkocOdheIRXF5pGviaVDhWs5OBUNOKGgfye0YJL7sQFyibJLHibkY83sAoDqzn7ExicNBmka8Dg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1\"/></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">▲新零售将成为一种趋势</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">可能传统电商带给大家一些错觉，觉得线上流量这么多，就可以忽略线下这一部分。但是线下实体商店和客户的接触点更多，所以更容易营造全方位的体验，并且和客户产生更多的互动，最终就在客户心中留下一个良好的品牌形象。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">在新零售时代，如果全渠道的问题解决了，线下的流量获取后可以继续导流到线上消费，用户价值也会显著提高。</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">这就是新零售形势一片大好的原因。把传统零售和传统电商两种模式相结合，既能享防守打法</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">fasdfasdfsdfsdf士大夫fdasdf士大夫fsd</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">f</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">asf</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">sdf</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">asd</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">fasd</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">f</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">sdf123123123123123121发射点发的发生发射点发射点发反对萨德发生反对萨德发生发生发射点防守打法是大师傅士大夫地方是f</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">s都是</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">在新零售时代，如果全渠道的问题解决了，线下的流量获取后可以继续导流到线上消费，用户价值也会显著提高。</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em;\"><br/></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">这就是新零售形势一片大好的原因。把传统零售和传统电商两种模式相结合，既能享防守打法</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">fasdfasdfsdfsdf士大夫fdasdf士大夫fsd</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">f</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">asf</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">sdf</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">asd</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">fasd</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">f</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">sdf123123123123123121发射点发的发生发射点发射点发反对萨德发生反对萨德发生发生发射点防守打法是大师傅士大夫地方是f</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">s都是</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">在新零售时代，如果全渠道的问题解决了，线下的流量获取后可以继续导流到线上消费，用户价值也会显著提高。</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em;\"><br/></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">这就是新零售形势一片大好的原因。把传统零售和传统电商两种模式相结合，既能享防守打法</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">fasdfasdfsdfsdf士大夫fdasdf士大夫fsd</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">f</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">asf</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">sdf</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">asd</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">fasd</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">f</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">sdf123123123123123121发射点发的发生发射点发射点发反对萨德发生反对萨德发生发生发射点防守打法是大师傅士大夫地方是f</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">s都是</span></p><p style=\"white-space: normal; padding: 0px; max-width: 100%; min-height: 1em;\">发生发射点发射点风格风格和急急急急急急<span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"></span><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">在电商模式已完全成型、缺乏创新的环境下，马云在云栖大会上提出的新零售概念获得了业界的普遍关注。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">在马云的描述中，<strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">纯电商的时代已经过去，继续下去只会被市场淘汰，这种打通线上线下的新零售模式将会取代传统电商。</strong></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">&nbsp;</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">我们公司作为长沙本土的一家提供解决方案与技术集成的科技公司，为成千上万的企业提供了优质服务。<strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">为了响应国家领导人的号召，传统经济纷纷向数字经济转型。</strong></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><img src=\"http://www.wancll.com/public/upload/ueditor/image/20180429/1524968365913177.jpg\" title=\"1524968365913177.jpg\" alt=\"社区零售.jpg\"/></strong></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">▲马云在云栖大会上的演讲</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">在传统经济转型数字经济浪潮中，每一次创新，有人倒下就有人崛起。今天，我们就来讲述那些崛起的黑马故事！</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">&nbsp;</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">第一期要讲的是新零售模式下勇于尝试的开拓者，一个怀化的商家，主要是做蔬果类产品，在我们公司做了一个鲜乐淘商城。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">经过了解，没做商城之前是做传统零售业，有自己的门店和配送员。但是单单通过线下经营，用户和盈利很快就到天花板了，业绩停滞不前。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">&nbsp;</span></p><hr/><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(89, 89, 89); letter-spacing: 0.5px; font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important;\">1、商业模式的深入解析</span></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(192, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 0, 0); letter-spacing: 0.5px; box-sizing: border-box !important; word-wrap: break-word !important;\">如果你关注了鲜乐淘的微信公众号，</span></strong></span><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">就会发现鲜乐淘最大的特点就是连接、体验、参与</strong>。很好的把线上线下实现无缝连接，用户不仅能亲自到店体验服务，还能参与其中，实现真正意义上的人人都能当店长。</span></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">这个鲜乐淘除了有一个乐淘商城还有一个社区商城，社区商城就把整个怀化地区分为很多个小的地区，然后针对这些不同区域用户的喜好推荐相应喜欢的产品。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><br/></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">而且鲜乐淘还有自己的门店和配送员，用户在商城下单后，商家能够第一时间把商品送到指定地点，这样就很好的营造了自己的品牌价值。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\">每个社区都有自己的用户，如果把每个社区当做是一个点，那么社区越来越多，点也越来越多，最后把这些点连起来就成为一张巨大的网，覆盖了整个市区大大小小的地方。</span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><hr/><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; letter-spacing: 0.5px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(89, 89, 89); letter-spacing: 0.5px; font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important;\">2、实际运营计划与成效</span></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; min-height: 1em; color: rgb(62, 62, 62);\">法撒旦飞洒地方鬼画符恢复供货的范德萨发达发大水发射点fd<br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; padding: 0px; max-width: 100%; min-height: 1em; color: rgb(62, 62, 62);\">sdaffsda发dfasdf</p><p>9999999999999999999999999999999999999999999999</p><p>99999999999999999999999999</p><p>9999999999999999</p><p>999999999999999999999999</p>', '测试', '[]', '', '', '5', '0', '1', '', '1', '2018-05-26 10:38:56', '2018-05-26 10:38:56');

-- -----------------------------
-- Table structure for `wancll_attr_templates`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_attr_templates`;
CREATE TABLE `wancll_attr_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性模板名称',
  `intro` text COMMENT '商品属性模板简介',
  `content` text COMMENT '商品属性模板内容',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '商品属性模板排序',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_attr_templates`
-- -----------------------------
INSERT INTO `wancll_attr_templates` VALUES ('1', '模板测试1', 'readme', '[{\"name\":\"颜色\",\"options\":[\"红\",\"绿\",\"蓝\"]},{\"name\":\"尺寸\",\"options\":[\"1.4寸\",\"1.5寸\",\"1.6寸\"]}]', '5', '1', '2018-06-20 22:34:16', '2018-06-20 22:34:16');
INSERT INTO `wancll_attr_templates` VALUES ('2', '模板测试2', 'readme', '[{\"name\":\"颜色\",\"options\":[\"天蓝\",\"深绿\"]}]', '1', '1', '2018-06-20 22:35:00', '2018-06-20 22:36:05');
INSERT INTO `wancll_attr_templates` VALUES ('3', 'fda', '', '[{\"name\":\"属性\",\"options\":[\"地方\",\"gfdsg\"]}]', '0', '0', '2018-06-25 09:35:47', '2018-06-25 10:28:25');

-- -----------------------------
-- Table structure for `wancll_bank_cards`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_bank_cards`;
CREATE TABLE `wancll_bank_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bank_name` varchar(255) NOT NULL COMMENT '银行名称',
  `card_number` varchar(255) NOT NULL COMMENT '银行卡号',
  `card_holder` varchar(255) NOT NULL COMMENT '持卡人',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_bank_cards`
-- -----------------------------
INSERT INTO `wancll_bank_cards` VALUES ('1', '7', '中国农业银行', '12555', '5688358966555989', '1', '2018-06-22 09:53:16', '2018-06-22 09:53:16');

-- -----------------------------
-- Table structure for `wancll_banners`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_banners`;
CREATE TABLE `wancll_banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '轮播图类别',
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_banners`
-- -----------------------------
INSERT INTO `wancll_banners` VALUES ('1', 'wap首页轮播', 'wap首页轮播1', '/public/upload/images/1525769243483.jpg', '', '', '', '', '1', '1', 'goods', '36', '1', '2018-04-17 15:33:41', '2018-04-17 15:33:41');
INSERT INTO `wancll_banners` VALUES ('2', 'wap首页轮播', 'wap首页轮播2', '/public/upload/images/1527409348467.jpg', '', 'http://www.baidu.com', '', '', '1', '0', '', '0', '1', '2018-04-17 15:33:53', '2018-04-17 15:33:53');
INSERT INTO `wancll_banners` VALUES ('3', 'wap领券中心轮播', 'wap领券中心轮播1', '/public/upload/images/1524110063214.jpg', '', '', '', '', '1', '0', '', '0', '1', '2018-04-17 15:59:25', '2018-04-17 15:59:25');
INSERT INTO `wancll_banners` VALUES ('4', 'wap领券中心轮播', 'wap领券中心轮播2', '/public/upload/images/1523951974519.jpg', '', '', '', '', '1', '0', '', '0', '0', '2018-04-17 15:59:34', '2018-04-19 11:50:39');
INSERT INTO `wancll_banners` VALUES ('5', 'pc首页轮播', 'pc轮播', '/public/upload/images/1525764444540.jpg', '', 'http://wancllshop.wx.wygoo.com/portal/index/coupon', '', '', '1', '0', '', '0', '1', '2018-04-24 17:59:34', '2018-04-24 17:59:34');
INSERT INTO `wancll_banners` VALUES ('6', '4', '42', '', '24', '24', '24', '', '1', '0', '', '0', '0', '2018-05-04 00:26:59', '2018-05-04 00:27:04');
INSERT INTO `wancll_banners` VALUES ('7', 'pc首页轮播', 'PC轮播图', '/public/upload/images/1525765071209.jpg', '', 'http://wancllshop.wx.wygoo.com/portal/index/discount', '', '', '1', '0', '', '0', '1', '2018-05-08 15:37:51', '2018-05-08 15:37:51');
INSERT INTO `wancll_banners` VALUES ('8', ' pc首页轮播', 'PC轮播图', '/public/upload/images/1525765097664.jpg', '', 'http://wancllshop.wx.wygoo.com/portal/index/search_list.html?keyword=母婴儿童', '', '', '1', '0', '', '0', '1', '2018-05-08 15:38:17', '2018-05-08 15:38:17');
INSERT INTO `wancll_banners` VALUES ('9', 'PC首页轮播图', 'PC首页轮播图4', '', '', '', '', '', '1', '0', '', '0', '0', '2018-05-28 13:48:00', '2018-05-28 13:49:03');

-- -----------------------------
-- Table structure for `wancll_bonus_applys`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_bonus_applys`;
CREATE TABLE `wancll_bonus_applys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `apply_no` varchar(255) NOT NULL COMMENT '申请分佣单号',
  `receipt_type` varchar(255) NOT NULL COMMENT '收款类别：money钱包wechat微信收款ali支付宝收款',
  `user_bonus_log_ids` text NOT NULL COMMENT '订单IDs',
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_bonus_applys`
-- -----------------------------
INSERT INTO `wancll_bonus_applys` VALUES ('1', '7', 'B2018061511565034677', 'money', '[6,7,9,12,15]', '53.75', '', '申请分红提现', '申请分红提现：53.75￥，申请时间：2018-06-15 11:56:50', '', '', '', '0', '1', '1', '2018-06-15 11:56:50', '2018-06-15 11:56:50');
INSERT INTO `wancll_bonus_applys` VALUES ('2', '1', 'B2018061918413706614', 'money', '[2,8]', '8.50', '', '申请分红提现', '申请分红提现：8.5￥，申请时间：2018-06-19 18:41:37', '', '', '', '0', '1', '1', '2018-06-19 18:41:37', '2018-06-19 18:41:37');

-- -----------------------------
-- Table structure for `wancll_bonus_goods_levels`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_bonus_goods_levels`;
CREATE TABLE `wancll_bonus_goods_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bonus_level_id` bigint(20) NOT NULL COMMENT '分销商等级ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `rate` decimal(10,2) NOT NULL COMMENT '分红比例',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `wancll_bonus_levels`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_bonus_levels`;
CREATE TABLE `wancll_bonus_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rank_weight` int(11) NOT NULL COMMENT '等级权重：越大权重越高',
  `level_name` varchar(255) NOT NULL COMMENT '分销商等级名称',
  `rate` decimal(10,2) NOT NULL COMMENT '代理比例（%）',
  `up_level_value` bigint(20) DEFAULT NULL COMMENT '达到升级当前等级分销商的升级值',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_bonus_levels`
-- -----------------------------
INSERT INTO `wancll_bonus_levels` VALUES ('1', '0', '会员分红商', '3.00', '0', '1', '1', '2018-06-03 17:47:53', '2018-06-03 17:47:53');
INSERT INTO `wancll_bonus_levels` VALUES ('2', '1', '主管分红商', '5.00', '2', '1', '1', '2018-06-03 17:49:02', '2018-06-03 17:49:02');
INSERT INTO `wancll_bonus_levels` VALUES ('3', '2', '经理分红商', '6.00', '12', '1', '1', '2018-06-03 17:50:11', '2018-06-03 17:50:11');
INSERT INTO `wancll_bonus_levels` VALUES ('4', '3', '董事分红商', '18.00', '20', '1', '1', '2018-06-03 17:50:34', '2018-06-03 17:50:34');

-- -----------------------------
-- Table structure for `wancll_carts`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_carts`;
CREATE TABLE `wancll_carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `goods_id` bigint(20) unsigned NOT NULL COMMENT '商品ID',
  `spec_group_id_str` varchar(255) DEFAULT '' COMMENT '商品规格组合id_str',
  `num` int(11) unsigned DEFAULT '1' COMMENT '商品的数量',
  `status` tinyint(1) DEFAULT '1' COMMENT '1：正常，2：已购买',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_carts`
-- -----------------------------
INSERT INTO `wancll_carts` VALUES ('1', '4', '7', '199', '1', '1', '1', '2018-06-19 13:59:22', '2018-06-19 13:59:22');
INSERT INTO `wancll_carts` VALUES ('2', '4', '21', '0', '1', '1', '1', '2018-06-19 13:59:32', '2018-06-19 13:59:32');
INSERT INTO `wancll_carts` VALUES ('3', '11', '40', '0', '1', '1', '1', '2018-06-20 10:14:27', '2018-06-20 10:14:27');

-- -----------------------------
-- Table structure for `wancll_categories`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_categories`;
CREATE TABLE `wancll_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT '0' COMMENT '父分类id;0为顶层',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `thum` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '是否置顶：0否1是',
  `sort` int(11) DEFAULT '0' COMMENT '排序：数值越大越靠前',
  `status` tinyint(4) DEFAULT '1' COMMENT '1正常2禁用',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_categories`
-- -----------------------------
INSERT INTO `wancll_categories` VALUES ('1', '0', '广告类别', '', '', '0', '0', '1', '1', '2018-06-28 14:20:08', '2018-06-28 14:20:08');
INSERT INTO `wancll_categories` VALUES ('2', '1', '广告类别1', '', '', '0', '0', '1', '1', '2018-06-28 14:20:18', '2018-06-28 14:20:18');

-- -----------------------------
-- Table structure for `wancll_commission_applys`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_commission_applys`;
CREATE TABLE `wancll_commission_applys` (
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_commission_applys`
-- -----------------------------
INSERT INTO `wancll_commission_applys` VALUES ('1', '1', 'F2018061511114664644', 'money', '[2]', '11.00', '', '申请佣金提现', '申请佣金提现：11￥，申请时间：2018-06-15 11:11:46', '', '', '', '0', '1', '1', '2018-06-15 11:11:46', '2018-06-15 11:11:46');
INSERT INTO `wancll_commission_applys` VALUES ('2', '7', 'F2018061511232607809', 'money', '[6]', '13.86', '', '申请佣金提现', '申请佣金提现：13.86￥，申请时间：2018-06-15 11:23:26', '', '', '', '0', '1', '1', '2018-06-15 11:23:26', '2018-06-15 11:23:26');
INSERT INTO `wancll_commission_applys` VALUES ('3', '7', 'F2018061511580379371', 'money', '[7]', '65.89', '', '申请佣金提现', '申请佣金提现：65.89￥，申请时间：2018-06-15 11:58:03', '', '', '', '0', '1', '1', '2018-06-15 11:58:03', '2018-06-15 11:58:03');

-- -----------------------------
-- Table structure for `wancll_commission_goods_levels`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_commission_goods_levels`;
CREATE TABLE `wancll_commission_goods_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `distributor_level_id` bigint(20) NOT NULL COMMENT '分销商等级ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `commission_1` decimal(10,2) NOT NULL COMMENT '一级分销比例',
  `commission_2` decimal(10,2) NOT NULL COMMENT '二级分销比例',
  `commission_3` decimal(10,2) NOT NULL COMMENT '三级分销比例',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `wancll_custom_foottext`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_custom_foottext`;
CREATE TABLE `wancll_custom_foottext` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `foot_info` text COMMENT '1|底部标题',
  `foot_title_id` text COMMENT '1|文章标题集',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_custom_foottext`
-- -----------------------------
INSERT INTO `wancll_custom_foottext` VALUES ('1', '111', '222');

-- -----------------------------
-- Table structure for `wancll_custom_indexbannergoods`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_custom_indexbannergoods`;
CREATE TABLE `wancll_custom_indexbannergoods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ad_img` text COMMENT '2|广告图',
  `ad_href` text COMMENT '1|广告图链接',
  `goods_ids` text COMMENT '1|商品id集',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_custom_indexbannergoods`
-- -----------------------------
INSERT INTO `wancll_custom_indexbannergoods` VALUES ('1', '/public/upload/images/1523951857644.jpg', '/', '30,32,33');
INSERT INTO `wancll_custom_indexbannergoods` VALUES ('2', '/public/upload/images/1523951888496.jpg', '/', '34,35,36,37');

-- -----------------------------
-- Table structure for `wancll_custom_pcindexgoods`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_custom_pcindexgoods`;
CREATE TABLE `wancll_custom_pcindexgoods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` text COMMENT '1|名称',
  `ad1` text COMMENT '2|广告图1',
  `goods_ids` text COMMENT '1|商品id集',
  `hot_keywords` text COMMENT '1|热搜词',
  `ad2` text COMMENT '2|广告图2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_custom_pcindexgoods`
-- -----------------------------
INSERT INTO `wancll_custom_pcindexgoods` VALUES ('10', '家装个护', '/public/upload/images/1525332043954.jpg', '5,6,7,8,9,10,11,12,13,14', '', '/public/upload/images/1524732437831.jpg');
INSERT INTO `wancll_custom_pcindexgoods` VALUES ('9', '服饰鞋包', '/public/upload/images/1525332061737.jpg', '15,16,17,18,19,20,21,22,23,24', '', '/public/upload/images/1524732388205.jpg');
INSERT INTO `wancll_custom_pcindexgoods` VALUES ('7', '母婴儿童', '/public/upload/images/1525332086797.jpg', '25,26,27,28,29,30,31,32,33,34', '', '/public/upload/images/1524729298311.jpg');
INSERT INTO `wancll_custom_pcindexgoods` VALUES ('8', '美容彩妆', '/public/upload/images/1525332101962.jpg', '34,35,36,38,39,40', '', '/public/upload/images/1524732330536.jpg');

-- -----------------------------
-- Table structure for `wancll_custom_pclogo`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_custom_pclogo`;
CREATE TABLE `wancll_custom_pclogo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `img` text COMMENT '2|pc端logo',
  `title` text COMMENT '1|pc端标语',
  `href` text COMMENT '1|首页链接',
  `index_title` text COMMENT '1|首页标语',
  `go_mobile` text COMMENT '1|手机连接名称',
  `title_text` text COMMENT '1|网页名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_custom_pclogo`
-- -----------------------------
INSERT INTO `wancll_custom_pclogo` VALUES ('1', '/public/upload/images/1525939517293.jpg', '开创商业智慧', 'http://wancllshop.wx.wygoo.com', 'HI!欢迎来到wancllshop', '手机网开创', 'WancllShop');

-- -----------------------------
-- Table structure for `wancll_custom_waplogo`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_custom_waplogo`;
CREATE TABLE `wancll_custom_waplogo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `logo` text COMMENT '2|logo',
  `login_logo` text COMMENT '2|login_logo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_custom_waplogo`
-- -----------------------------
INSERT INTO `wancll_custom_waplogo` VALUES ('2', '/public/upload/images/1525941422277.jpg', '/public/upload/images/1525943925967.jpg');

-- -----------------------------
-- Table structure for `wancll_dds`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_dds`;
CREATE TABLE `wancll_dds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '数据字典名称',
  `table_name` varchar(20) NOT NULL COMMENT '数据字典数据表名称',
  `nav_id` bigint(20) DEFAULT NULL,
  `intro` text COMMENT '数据字典说明',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_dds`
-- -----------------------------
INSERT INTO `wancll_dds` VALUES ('1', '模型测试1表', 'test', '', '自定义模型测试表1', '0', '2018-04-02 21:30:44', '2018-04-02 23:10:46');
INSERT INTO `wancll_dds` VALUES ('2', '模型测试表', 'test', '', '自定义模型测试表', '0', '2018-04-02 21:37:36', '2018-04-02 21:38:25');
INSERT INTO `wancll_dds` VALUES ('3', '模型测试表', 'test', '', '自定义模型测试表', '0', '2018-04-02 21:38:57', '2018-04-05 17:57:24');
INSERT INTO `wancll_dds` VALUES ('4', '模型测试表', 'userlevel', '', '自定义模型测试表', '0', '2018-04-02 22:59:36', '2018-04-05 17:57:24');
INSERT INTO `wancll_dds` VALUES ('5', '模型测试表', 'userlevel', '', '', '0', '2018-04-03 09:50:47', '2018-04-03 14:09:02');
INSERT INTO `wancll_dds` VALUES ('6', 'test', 'test', '', '', '0', '2018-04-03 10:17:02', '2018-04-03 14:08:57');
INSERT INTO `wancll_dds` VALUES ('7', '方式', 'www', '', '', '0', '2018-04-03 10:49:02', '2018-05-07 15:45:49');
INSERT INTO `wancll_dds` VALUES ('8', '模型测试表', 'userlevel', '', '自定义模型测试表', '0', '2018-04-05 17:57:24', '2018-05-07 15:45:46');
INSERT INTO `wancll_dds` VALUES ('9', '首页轮播商品', 'indexbannergoods', '', '', '1', '2018-04-17 11:33:54', '2018-04-17 11:33:54');
INSERT INTO `wancll_dds` VALUES ('10', 'PC端商品推荐', 'pctuijiangoods', '', 'PC端为你推荐栏目', '0', '2018-04-21 09:28:46', '2018-04-26 10:58:27');
INSERT INTO `wancll_dds` VALUES ('11', 'pc首页商品配置', 'pcindexgoods', '', '', '1', '2018-04-25 10:59:20', '2018-04-25 10:59:20');
INSERT INTO `wancll_dds` VALUES ('12', '商品信息', 'goods', '', '首页商品', '0', '2018-04-25 11:12:28', '2018-04-26 10:58:20');
INSERT INTO `wancll_dds` VALUES ('13', '手机端logo', 'waplogo', '', '', '1', '2018-05-07 15:46:25', '2018-05-07 15:46:25');
INSERT INTO `wancll_dds` VALUES ('14', 'pc端logo', 'pcHeader', '', 'pc端logo和标语', '0', '2018-05-09 10:11:12', '2018-05-09 10:20:09');
INSERT INTO `wancll_dds` VALUES ('15', 'pc端logo', 'pclogo', '', '', '1', '2018-05-09 10:20:32', '2018-05-09 10:20:32');
INSERT INTO `wancll_dds` VALUES ('16', '底部链接文章', 'foottext', '', '', '1', '2018-05-09 10:26:29', '2018-05-09 10:26:29');
INSERT INTO `wancll_dds` VALUES ('17', 'PC端icon图标', 'pcicon', '', 'PC端的icon图标', '0', '2018-05-12 09:22:01', '2018-05-12 09:33:23');
INSERT INTO `wancll_dds` VALUES ('18', '测试', 'testtest', '', '', '1', '2018-06-11 10:24:19', '2018-06-11 10:24:19');

-- -----------------------------
-- Table structure for `wancll_distributor_levels`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_distributor_levels`;
CREATE TABLE `wancll_distributor_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rank_weight` int(11) NOT NULL COMMENT '等级权重：越大权重越高',
  `level_name` varchar(255) NOT NULL COMMENT '分销商等级名称',
  `commission_1` decimal(10,2) NOT NULL COMMENT '一级分佣比例',
  `commission_2` decimal(10,2) NOT NULL COMMENT '二级分佣比例',
  `commission_3` decimal(10,2) NOT NULL COMMENT '三级分佣比例',
  `up_level_value` bigint(20) DEFAULT NULL COMMENT '达到升级当前等级分销商的升级值',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_distributor_levels`
-- -----------------------------
INSERT INTO `wancll_distributor_levels` VALUES ('1', '0', '普通分销商', '11.00', '8.00', '5.00', '0', '1', '1', '2018-06-03 12:42:20', '2018-06-03 12:42:20');
INSERT INTO `wancll_distributor_levels` VALUES ('2', '1', '铜牌分销商', '11.00', '9.00', '6.00', '100', '1', '1', '2018-06-03 12:42:54', '2018-06-04 13:53:42');
INSERT INTO `wancll_distributor_levels` VALUES ('3', '2', '银牌分销商', '13.00', '11.00', '9.00', '300', '1', '1', '2018-06-03 12:43:30', '2018-06-03 12:43:30');
INSERT INTO `wancll_distributor_levels` VALUES ('4', '3', '金牌分销商', '15.00', '13.00', '11.00', '500', '1', '1', '2018-06-03 12:43:57', '2018-06-03 12:43:57');
INSERT INTO `wancll_distributor_levels` VALUES ('5', '4', '测试', '1.00', '2.00', '3.00', '100', '1', '0', '2018-06-28 14:19:11', '2018-06-28 14:19:16');

-- -----------------------------
-- Table structure for `wancll_feedbacks`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_feedbacks`;
CREATE TABLE `wancll_feedbacks` (
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_feedbacks`
-- -----------------------------
INSERT INTO `wancll_feedbacks` VALUES ('1', '3', '', '', '功能异常', '测试', '1', '1', '1', '2018-04-17 18:09:29', '2018-04-17 21:21:37');
INSERT INTO `wancll_feedbacks` VALUES ('2', '1', '', '', '功能异常', '莫文蔚', '1', '0', '1', '2018-04-18 15:19:58', '2018-04-18 15:19:58');
INSERT INTO `wancll_feedbacks` VALUES ('3', '37', '', '', '功能改进', 'msmsjjsj', '1', '0', '1', '2018-05-06 16:55:45', '2018-05-06 16:55:45');
INSERT INTO `wancll_feedbacks` VALUES ('4', '37', '', '', '功能改进', '今天天红', '1', '0', '1', '2018-05-06 16:56:16', '2018-05-06 16:56:16');
INSERT INTO `wancll_feedbacks` VALUES ('5', '5', '', '', '功能改进', '可以', '1', '0', '1', '2018-05-11 16:20:59', '2018-05-11 16:20:59');
INSERT INTO `wancll_feedbacks` VALUES ('6', '1', '', '', '功能改进', 'afdas', '1', '0', '1', '2018-05-26 10:19:36', '2018-05-26 10:19:36');
INSERT INTO `wancll_feedbacks` VALUES ('7', '1', '', '', '功能异常', 'f的风格是法国', '1', '0', '1', '2018-05-26 10:21:43', '2018-05-26 10:21:43');
INSERT INTO `wancll_feedbacks` VALUES ('8', '1', '', '', '功能改进', '光辐射大概', '1', '0', '1', '2018-05-26 10:22:13', '2018-05-26 10:22:13');
INSERT INTO `wancll_feedbacks` VALUES ('9', '1', '', '', '功能改进', '早睡早起我失去他', '1', '0', '1', '2018-05-26 10:23:39', '2018-05-26 10:23:39');
INSERT INTO `wancll_feedbacks` VALUES ('10', '1', '', '', '功能异常', 'Bb', '1', '0', '1', '2018-05-26 14:09:24', '2018-05-26 14:09:24');
INSERT INTO `wancll_feedbacks` VALUES ('11', '69', '', '', '功能异常', '哈哈哈', '1', '0', '1', '2018-05-31 15:01:38', '2018-05-31 15:01:38');
INSERT INTO `wancll_feedbacks` VALUES ('12', '6', '', '', '功能改进', '恩东', '1', '0', '1', '2018-06-05 21:46:37', '2018-06-05 21:46:37');
INSERT INTO `wancll_feedbacks` VALUES ('13', '6', '', '', '功能改进', '恩东', '1', '0', '1', '2018-06-05 21:46:38', '2018-06-05 21:46:38');
INSERT INTO `wancll_feedbacks` VALUES ('14', '52', '', '', '功能改进', '洗衣液', '1', '0', '1', '2018-06-06 13:59:24', '2018-06-06 13:59:24');

-- -----------------------------
-- Table structure for `wancll_freight_templates`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_freight_templates`;
CREATE TABLE `wancll_freight_templates` (
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_freight_templates`
-- -----------------------------
INSERT INTO `wancll_freight_templates` VALUES ('1', '运费模板2', '运费模板介绍', '1', '10.00', '0.50', '1.00', '0.30', '[{\"basic_value\":5,\"basic_price\":0.6,\"add_value\":1,\"add_price\":0.4,\"area_codes\":[\"130104\",\"130105\",\"140106\"]},{\"basic_value\":\"51\",\"basic_price\":0.6,\"add_value\":\"10\",\"add_price\":\"0.5\",\"area_codes\":[\"140105\",\"140107\"]},{\"basic_value\":\"1\",\"basic_price\":\"2\",\"add_value\":\"3\",\"add_price\":\"4\",\"area_codes\":[\"120105\",\"120106\",\"120110\"]}]', '0', '1', '2018-06-24 09:35:49', '2018-06-24 10:02:42');
INSERT INTO `wancll_freight_templates` VALUES ('2', '1', '2', '1', '2.00', '3.00', '4.00', '5.00', '[{\"basic_value\":\"1\",\"basic_price\":\"2\",\"add_value\":\"3\",\"add_price\":\"4\",\"area_codes\":[\"120000\",\"120100\",\"120101\",\"120102\",\"120103\",\"120104\",\"120105\",\"120106\",\"120110\",\"120111\",\"120112\",\"120113\",\"120114\",\"120115\",\"120116\",\"120117\",\"120118\",\"120119\"]}]', '0', '1', '2018-06-25 15:25:25', '2018-06-25 15:25:25');

-- -----------------------------
-- Table structure for `wancll_friendly_links`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_friendly_links`;
CREATE TABLE `wancll_friendly_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '友情链接类型',
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_friendly_links`
-- -----------------------------
INSERT INTO `wancll_friendly_links` VALUES ('1', 'foots', '关于我们', '', '', '', 'foot', 'http://wancllshop.wx.wygoo.com/portal/index/index.html', '1', '0', '', '0', '1', '2018-05-09 10:34:23', '2018-05-09 10:34:23');
INSERT INTO `wancll_friendly_links` VALUES ('2', 'foots', '帮助中心', '', '', '', 'foot', 'http://wancllshop.wx.wygoo.com', '1', '0', '', '0', '1', '2018-05-09 10:35:47', '2018-05-09 10:35:47');
INSERT INTO `wancll_friendly_links` VALUES ('3', 'foots', '售后服务', '', '', '', 'foot', 'http://wancllshop.wx.wygoo.com/portal/index/index.html', '1', '0', '', '0', '1', '2018-05-09 10:36:58', '2018-05-09 10:36:58');
INSERT INTO `wancll_friendly_links` VALUES ('4', 'footli', '购物流程', '', '', '', '1', 'https://www.suning.com/', '1', '0', '', '0', '1', '2018-05-09 11:18:15', '2018-05-09 11:18:15');
INSERT INTO `wancll_friendly_links` VALUES ('5', 'footli', '支付方式', '', '', '', '2', 'https://help.suning.com/page/id-14.htm', '1', '0', '', '0', '1', '2018-05-09 11:19:16', '2018-05-09 11:19:16');

-- -----------------------------
-- Table structure for `wancll_global_bonus`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_global_bonus`;
CREATE TABLE `wancll_global_bonus` (
  `user_id` bigint(20) NOT NULL COMMENT '商品ID',
  `is_open_own_global_rate` tinyint(1) DEFAULT '0' COMMENT '是否开启独立的全球分红比例',
  `global_rate` decimal(10,2) DEFAULT NULL COMMENT '全球分红比例',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_global_bonus`
-- -----------------------------
INSERT INTO `wancll_global_bonus` VALUES ('19', '0', '0.00', '1', '2018-06-19 17:26:30', '2018-06-19 17:26:30');

-- -----------------------------
-- Table structure for `wancll_goods`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_goods`;
CREATE TABLE `wancll_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_cate_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类ID',
  `goods_no` varchar(50) DEFAULT '' COMMENT '商品编码',
  `goods_code` varchar(50) DEFAULT '' COMMENT '商品条码',
  `is_virtual` tinyint(1) unsigned DEFAULT '0' COMMENT '是否为虚拟商品：0否1是',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `thum` varchar(255) DEFAULT '' COMMENT '商品缩略图',
  `imgs` text COMMENT '商品的大图',
  `intro` text COMMENT '商品简介',
  `desc` text COMMENT '商品描述',
  `standard` varchar(255) DEFAULT '' COMMENT '商品规格',
  `stock` bigint(20) unsigned DEFAULT '0' COMMENT '库存数量',
  `weight` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '商品重量',
  `cost_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '成本价',
  `sell_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '销售价',
  `market_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '市场价',
  `red_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '红包价',
  `tags` text COMMENT '商品标签',
  `sell_num` bigint(20) unsigned DEFAULT '0' COMMENT '销售量',
  `click_num` bigint(20) unsigned DEFAULT '0' COMMENT '商品的点击数量',
  `collect_num` bigint(20) unsigned DEFAULT '0' COMMENT '收藏数量',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '商品排序',
  `is_top` tinyint(1) unsigned DEFAULT '0' COMMENT '是否置顶：0否1是',
  `score` tinyint(1) unsigned DEFAULT '5' COMMENT '商品的综合评分',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1上架2下架',
  `attr_info` text COMMENT '属性信息',
  `spec_info` text COMMENT '规格信息',
  `freight_template_id` bigint(20) DEFAULT '0' COMMENT '运费模板ID',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods`
-- -----------------------------
INSERT INTO `wancll_goods` VALUES ('1', '1', '', '', '0', '测试商品1', '', '[]', '', '放大发', '', '400', '0.00', '0.00', '0.00', '0.00', '0.00', '[]', '0', '0', '0', '0', '0', '5', '1', '[{\"name\":\"颜色\",\"options\":[\"红色\",\"蓝色\",\"灰色\"],\"value\":\"蓝色\"},{\"name\":\"品牌\",\"options\":[\"iPhone\",\"HUAWEI\"],\"value\":\"HUAWEI\"}]', '[{\"name\":\"内存\",\"options\":[\"3G\",\"4G\"]},{\"name\":\"屏幕\",\"options\":[\"1.4寸\",\"1.5寸\"]},{\"name\":\"CPU\",\"options\":[\"骁龙\",\"酷睿\"]}]', '', '1', '2018-06-22 14:18:12', '2018-06-27 18:03:16');
INSERT INTO `wancll_goods` VALUES ('2', '1', '', '', '0', '测试商品2', '', '[]', '', 'fds', '', '400', '0.00', '0.00', '0.00', '0.00', '0.00', '[]', '0', '0', '0', '0', '0', '5', '1', '[{\"name\":\"颜色\",\"options\":[\"红色\",\"蓝色\",\"灰色\"],\"value\":\"蓝色\"},{\"name\":\"品牌\",\"options\":[\"iPhone\",\"HUAWEI\"],\"value\":\"HUAWEI\"}]', '[{\"name\":\"内存\",\"options\":[\"3G\",\"4G\"]},{\"name\":\"屏幕\",\"options\":[\"1.4寸\",\"1.5寸\"]},{\"name\":\"CPU\",\"options\":[\"骁龙\",\"酷睿\"]}]', '', '1', '2018-06-22 14:18:13', '2018-06-27 18:03:16');
INSERT INTO `wancll_goods` VALUES ('3', '1', '', '', '0', '测试商品3', '', '[]', '', 'fdsg', '', '400', '0.00', '0.00', '0.00', '0.00', '0.00', '[]', '0', '0', '0', '0', '0', '5', '1', '[{\"name\":\"颜色\",\"options\":[\"红色\",\"蓝色\",\"灰色\"],\"value\":\"蓝色\"},{\"name\":\"品牌\",\"options\":[\"iPhone\",\"HUAWEI\"],\"value\":\"HUAWEI\"}]', '[{\"name\":\"内存\",\"options\":[\"3G\",\"4G\"]},{\"name\":\"屏幕\",\"options\":[\"1.4寸\",\"1.5寸\"]},{\"name\":\"CPU\",\"options\":[\"骁龙\",\"酷睿\"]}]', '', '1', '2018-06-22 14:18:14', '2018-06-27 18:03:16');
INSERT INTO `wancll_goods` VALUES ('4', '1', '', '', '0', '1', '/public/upload/goods_images/20180627\\e91d042e2a858f1a9419bdaf702b1428.png', '[\"\\/public\\/upload\\/goods_images\\/20180627\\\\a9cbfc6b3b9abd4b8f4b6f24bee7cb91.png\"]', '', '', '', '0', '0.00', '0.00', '1.00', '0.00', '0.00', '[\"精品\",\"新品\"]', '0', '0', '0', '0', '0', '5', '1', '[]', '[]', '0', '1', '2018-06-27 16:19:52', '2018-06-27 18:03:16');
INSERT INTO `wancll_goods` VALUES ('5', '3', '', '', '0', '2', '/public/upload/goods_images/20180627\\b71ba65e0b96ddf5167f763ae19a6dd6.png', '[\"\\/public\\/upload\\/goods_images\\/20180627\\\\cc816b3a277fc50c5ddc5406945222a4.jpg\",\"\\/public\\/upload\\/goods_images\\/20180627\\\\30dde4441bfbe15dcaad39e79e9eec0e.jpg\"]', '', '<p>dfasf</p><p>飞洒地方士大夫</p><p><br/></p><p><img src=\"http://192.168.31.183/public/upload/ueditor/image/20180627/1530088401127055.gif\" title=\"1530088401127055.gif\" alt=\"QQ图片20151124171447.gif\"/></p><p><br/></p><p><br/></p><p>发射点发到付的萨芬</p><p>fasdfdsfadsdf&nbsp;</p>', '', '0', '0.00', '0.00', '1.00', '0.00', '0.00', '[]', '0', '0', '0', '0', '0', '5', '1', '[{\"name\":\"颜色\",\"options\":[\"天蓝\",\"深绿\"],\"value\":\"天蓝\"}]', '[]', '0', '1', '2018-06-27 16:20:44', '2018-06-27 18:03:16');
INSERT INTO `wancll_goods` VALUES ('6', '19', '', '', '0', '测试商品', '/public/upload/images/1530146684561.jpg', '[\"\\/public\\/upload\\/images\\/1530146684810.jpg\",\"\\/public\\/upload\\/images\\/1530146684300.jpg\"]', '测试商品', '<p>发士大夫士大夫</p><p><img src=\"http://127.0.0.1/public/upload/ueditor/image/20180627/1530090430290034.jpg\" title=\"1530090430290034.jpg\" alt=\"1515490803138.jpg\"/></p><p><br/></p><p><br/></p>', '', '900', '0.00', '0.00', '100.00', '0.00', '0.00', '[\"新品\",\"热销品\",\"折扣\"]', '0', '0', '0', '0', '0', '5', '1', '[{\"name\":\"颜色\",\"options\":[\"天蓝\",\"深绿\"],\"value\":\"深绿\"},{\"name\":\"23424\",\"options\":[\"54325\"],\"value\":\"54325\"}]', '[{\"name\":\"内存\",\"options\":[\"gd32423423\",\"4G\",\"5G\"]},{\"name\":\"尺寸\",\"options\":[\"1.4寸\",\"1.5寸\",\"1.6寸\"]}]', '1', '1', '2018-06-27 16:33:40', '2018-06-28 08:44:44');

-- -----------------------------
-- Table structure for `wancll_goods_bonus`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_goods_bonus`;
CREATE TABLE `wancll_goods_bonus` (
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `bonus_level_id` tinyint(1) DEFAULT NULL COMMENT '购买该商品成为指定等级的分红商（分红商等级ID）',
  `is_open_bonus` tinyint(1) DEFAULT '0' COMMENT '是否开启分红：0不开启1开启',
  `is_open_global` tinyint(1) DEFAULT '1' COMMENT '是否开启全球分红：0不开启1开启',
  `is_open_own_global_rate` tinyint(1) DEFAULT '0' COMMENT '是否开启独立的全球分红比例',
  `global_rate` decimal(10,2) DEFAULT NULL COMMENT '全球分红比例',
  `bonus_type` tinyint(1) DEFAULT '0' COMMENT '0不开启独立分红1启用单产品等级分红',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_bonus`
-- -----------------------------
INSERT INTO `wancll_goods_bonus` VALUES ('32', '0', '1', '1', '0', '0.00', '0', '1', '2018-06-15 16:25:22', '2018-06-15 16:25:22');

-- -----------------------------
-- Table structure for `wancll_goods_cates`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_goods_cates`;
CREATE TABLE `wancll_goods_cates` (
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
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_cates`
-- -----------------------------
INSERT INTO `wancll_goods_cates` VALUES ('1', '衣服', '', '0', '0', '1', '1', '2018-04-17 15:53:24', '2018-04-19 10:44:34');
INSERT INTO `wancll_goods_cates` VALUES ('2', '居家', '/public/upload/images/1524106857199.jpg', '0', '0', '1', '1', '2018-04-19 10:44:29', '2018-05-23 09:35:11');
INSERT INTO `wancll_goods_cates` VALUES ('3', '配件1', '/public/upload/goods_images/20180627\\3f8c9209f8ee46131c95b51bec5c0417.png', '0', '0', '1', '1', '2018-04-19 10:44:57', '2018-05-23 09:35:19');
INSERT INTO `wancll_goods_cates` VALUES ('4', '服装', '/public/upload/images/1528188272212.jpg', '0', '0', '1', '1', '2018-04-19 10:45:39', '2018-04-19 10:45:39');
INSERT INTO `wancll_goods_cates` VALUES ('5', '电器', '', '0', '0', '1', '1', '2018-04-19 10:45:48', '2018-04-19 10:45:48');
INSERT INTO `wancll_goods_cates` VALUES ('6', '洗护', '', '0', '0', '1', '1', '2018-04-19 10:46:03', '2018-04-19 10:46:03');
INSERT INTO `wancll_goods_cates` VALUES ('7', '饮食', '', '0', '0', '2', '1', '2018-04-19 10:46:13', '2018-04-19 10:46:13');
INSERT INTO `wancll_goods_cates` VALUES ('8', '餐厨', '', '0', '0', '1', '1', '2018-04-19 10:46:23', '2018-04-19 10:46:23');
INSERT INTO `wancll_goods_cates` VALUES ('9', '床品', '/public/upload/images/1524108404449.jpg', '2', '0', '1', '1', '2018-04-19 10:47:15', '2018-04-19 10:47:15');
INSERT INTO `wancll_goods_cates` VALUES ('10', '被枕', '/public/upload/images/1524108249489.jpg', '2', '0', '1', '1', '2018-04-19 10:47:37', '2018-04-19 10:47:37');
INSERT INTO `wancll_goods_cates` VALUES ('11', '家具', '/public/upload/images/1524108541843.jpg', '2', '0', '1', '1', '2018-04-19 10:47:48', '2018-04-19 10:47:48');
INSERT INTO `wancll_goods_cates` VALUES ('12', '收纳', '/public/upload/images/1524108640857.jpg', '2', '0', '1', '1', '2018-04-19 10:48:01', '2018-05-23 09:35:03');
INSERT INTO `wancll_goods_cates` VALUES ('13', '行李箱', '/public/upload/images/1524108684871.jpg', '3', '0', '1', '1', '2018-04-19 10:48:19', '2018-04-19 10:48:19');
INSERT INTO `wancll_goods_cates` VALUES ('14', '男士包袋', '/public/upload/images/1524108757307.jpg', '3', '0', '1', '1', '2018-04-19 10:48:33', '2018-04-19 10:48:33');
INSERT INTO `wancll_goods_cates` VALUES ('15', '女士包袋', '/public/upload/images/1524108766525.jpg', '3', '0', '1', '1', '2018-04-19 10:49:07', '2018-04-19 10:49:07');
INSERT INTO `wancll_goods_cates` VALUES ('16', '男鞋', '/public/upload/images/1524108829890.jpg', '3', '0', '1', '1', '2018-04-19 10:49:21', '2018-04-19 10:49:21');
INSERT INTO `wancll_goods_cates` VALUES ('17', '女鞋', '/public/upload/images/1524108840579.jpg', '3', '0', '1', '1', '2018-04-19 10:49:34', '2018-04-19 10:49:34');
INSERT INTO `wancll_goods_cates` VALUES ('18', 'T恤', '/public/upload/images/1524108958659.jpg', '4', '0', '1', '1', '2018-04-19 10:49:49', '2018-04-19 10:49:49');
INSERT INTO `wancll_goods_cates` VALUES ('19', '衬衫', '/public/upload/images/1524109016919.jpg', '4', '0', '1', '1', '2018-04-19 10:49:59', '2018-04-19 10:49:59');
INSERT INTO `wancll_goods_cates` VALUES ('20', '牛仔', '/public/upload/images/1524109049426.jpg', '4', '0', '1', '1', '2018-04-19 10:50:10', '2018-04-19 10:50:10');
INSERT INTO `wancll_goods_cates` VALUES ('21', '生活电器', '', '5', '0', '1', '1', '2018-04-19 10:50:22', '2018-04-19 10:50:22');
INSERT INTO `wancll_goods_cates` VALUES ('22', '厨房电器', '', '5', '0', '1', '1', '2018-04-19 10:50:33', '2018-04-19 10:50:33');
INSERT INTO `wancll_goods_cates` VALUES ('23', '个护健康', '', '5', '0', '1', '1', '2018-04-19 10:50:45', '2018-04-19 10:50:45');
INSERT INTO `wancll_goods_cates` VALUES ('24', '数码', '', '5', '0', '1', '1', '2018-04-19 10:50:58', '2018-04-19 10:50:58');
INSERT INTO `wancll_goods_cates` VALUES ('25', '家庭清洁', '', '6', '0', '1', '1', '2018-04-19 10:51:28', '2018-04-19 10:51:28');
INSERT INTO `wancll_goods_cates` VALUES ('26', '生理用品', '', '6', '0', '1', '1', '2018-04-19 10:51:46', '2018-04-19 10:51:46');
INSERT INTO `wancll_goods_cates` VALUES ('27', '坚果炒货', '', '7', '0', '1', '1', '2018-04-19 10:52:04', '2018-04-19 10:52:04');
INSERT INTO `wancll_goods_cates` VALUES ('28', '酒水饮料', '', '7', '0', '1', '1', '2018-04-19 10:52:24', '2018-04-19 10:52:24');
INSERT INTO `wancll_goods_cates` VALUES ('29', '肉类零食', '', '7', '0', '1', '1', '2018-04-19 10:52:40', '2018-04-19 10:52:40');
INSERT INTO `wancll_goods_cates` VALUES ('30', '水具杯壶', '', '8', '0', '1', '1', '2018-04-19 10:53:02', '2018-04-19 10:53:02');
INSERT INTO `wancll_goods_cates` VALUES ('31', '厨房配件', '', '8', '0', '1', '1', '2018-04-19 10:53:13', '2018-04-19 10:53:13');
INSERT INTO `wancll_goods_cates` VALUES ('32', '清洁保鲜', '', '8', '0', '1', '1', '2018-04-19 10:53:29', '2018-04-19 10:53:29');
INSERT INTO `wancll_goods_cates` VALUES ('33', '陪陪', '', '9', '0', '1', '1', '2018-04-27 11:01:49', '2018-04-27 11:02:13');
INSERT INTO `wancll_goods_cates` VALUES ('34', '啦啦f', '', '33', '0', '1', '1', '2018-04-27 11:02:04', '2018-04-27 11:02:04');
INSERT INTO `wancll_goods_cates` VALUES ('35', '电子产品', '', '0', '1', '1', '1', '2018-05-21 02:43:01', '2018-05-21 02:43:43');
INSERT INTO `wancll_goods_cates` VALUES ('36', '手机', '', '35', '1', '1', '1', '2018-05-21 02:43:27', '2018-05-21 02:43:27');
INSERT INTO `wancll_goods_cates` VALUES ('37', '球衣', '', '18', '1', '1', '1', '2018-05-21 02:45:00', '2018-05-21 02:45:11');
INSERT INTO `wancll_goods_cates` VALUES ('38', '手机', '', '0', '0', '1', '1', '2018-05-21 02:46:41', '2018-05-21 02:47:18');
INSERT INTO `wancll_goods_cates` VALUES ('39', '电子产品', '', '38', '0', '1', '1', '2018-05-21 02:47:07', '2018-05-21 02:47:07');
INSERT INTO `wancll_goods_cates` VALUES ('40', 'ces', '/public/upload/goods_images/20180627\\d83039e4f344cf7817d20689a1bea94d.jpg', '3', '0', '1', '1', '2018-06-27 17:52:05', '2018-06-27 17:52:05');
INSERT INTO `wancll_goods_cates` VALUES ('41', '123123', '/public/upload/goods_images/20180627\\12922f24a8eb7e0644b826ffb3944d39.gif', '1', '0', '1', '1', '2018-06-27 17:53:05', '2018-06-27 17:53:05');

-- -----------------------------
-- Table structure for `wancll_goods_collections`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_goods_collections`;
CREATE TABLE `wancll_goods_collections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `goods_id` bigint(20) unsigned NOT NULL COMMENT '商品ID',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `wancll_goods_comments`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_goods_comments`;
CREATE TABLE `wancll_goods_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `content` text NOT NULL COMMENT '评论正文',
  `imgs` text COMMENT '评论商品时上传的图片',
  `score` varchar(255) NOT NULL COMMENT '商品评分',
  `status` tinyint(1) DEFAULT '1' COMMENT '1待审核2审核未通过（不显示）3审核通过（显示）',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `wancll_goods_commission`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_goods_commission`;
CREATE TABLE `wancll_goods_commission` (
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `distributor_level_id` bigint(20) DEFAULT NULL COMMENT '购买该产品成为分销商的等级',
  `is_open_commission` tinyint(1) DEFAULT '0' COMMENT '是否开启分销：0不开启1开启',
  `commission_type` tinyint(1) DEFAULT '0' COMMENT '0不开启独立分佣1启用独立佣金比例2启用单产品等级佣金',
  `commission_1_use_type` varchar(10) DEFAULT '' COMMENT '一级分佣使用类型：rate比例money金额',
  `commission_1_value` decimal(10,2) DEFAULT NULL COMMENT '一级分佣值',
  `commission_2_use_type` varchar(10) DEFAULT '' COMMENT '二级分佣使用类型：rate比例money金额',
  `commission_2_value` decimal(10,2) DEFAULT NULL COMMENT '二级分佣值',
  `commission_3_use_type` varchar(10) DEFAULT '' COMMENT '三级分佣使用类型：rate比例money金额',
  `commission_3_value` decimal(10,2) DEFAULT NULL COMMENT '三级分佣值',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `wancll_goods_keywords`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_goods_keywords`;
CREATE TABLE `wancll_goods_keywords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL COMMENT '关键词',
  `search_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '搜索次数',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_keywords`
-- -----------------------------
INSERT INTO `wancll_goods_keywords` VALUES ('1', '衣服', '9', '1', '2018-06-15 09:43:37', '2018-06-15 09:43:37');
INSERT INTO `wancll_goods_keywords` VALUES ('2', '配件', '3', '1', '2018-06-15 15:54:57', '2018-06-15 15:54:57');
INSERT INTO `wancll_goods_keywords` VALUES ('3', '服装', '3', '1', '2018-06-15 19:06:03', '2018-06-15 19:06:03');
INSERT INTO `wancll_goods_keywords` VALUES ('4', '电子产品', '3', '1', '2018-06-15 19:06:11', '2018-06-15 19:06:11');
INSERT INTO `wancll_goods_keywords` VALUES ('5', '居家', '2', '1', '2018-06-16 11:49:41', '2018-06-16 11:49:41');
INSERT INTO `wancll_goods_keywords` VALUES ('6', '箱子', '1', '1', '2018-06-20 11:49:13', '2018-06-20 11:49:13');
INSERT INTO `wancll_goods_keywords` VALUES ('7', '面膜', '3', '1', '2018-06-20 11:49:15', '2018-06-20 11:49:15');
INSERT INTO `wancll_goods_keywords` VALUES ('8', '牛仔裤', '1', '1', '2018-06-20 11:49:36', '2018-06-20 11:49:36');

-- -----------------------------
-- Table structure for `wancll_goods_spec_groups`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_goods_spec_groups`;
CREATE TABLE `wancll_goods_spec_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '组合项ID',
  `id_str` varchar(255) NOT NULL DEFAULT '',
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '规格对应的商品id',
  `spec_option_group` text NOT NULL COMMENT '商品规格项组合名称',
  `thum` text COMMENT '商品规格组合图片',
  `sell_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '商品销售价格',
  `market_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '商品市场价格',
  `cost_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '商品成本价格',
  `red_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '红包价格',
  `stock` int(11) unsigned DEFAULT '0' COMMENT '库存数量',
  `weight` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '商品重量',
  `goods_no` varchar(255) DEFAULT '' COMMENT '商品编码',
  `goods_code` varchar(255) DEFAULT '' COMMENT '商品条码',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `is_virtual` tinyint(1) unsigned DEFAULT '0' COMMENT '是否为虚拟商品：0否1是',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`,`id_str`),
  KEY `idx_goods_id` (`goods_id`),
  KEY `idx_sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_spec_groups`
-- -----------------------------
INSERT INTO `wancll_goods_spec_groups` VALUES ('1', '718bc5f89c3521e2d205ec12bd2eebaa', '1', '3G_1.4寸_骁龙', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:12', '2018-06-22 14:18:12');
INSERT INTO `wancll_goods_spec_groups` VALUES ('2', '029a37388eb03976ac30b5ba72878894', '1', '3G_1.4寸_酷睿', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:12', '2018-06-22 14:18:12');
INSERT INTO `wancll_goods_spec_groups` VALUES ('3', 'c3aadd5420501203eb102febde132036', '1', '3G_1.5寸_骁龙', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:12', '2018-06-22 14:18:12');
INSERT INTO `wancll_goods_spec_groups` VALUES ('4', '86246a21acff295e32d8644a114c67e7', '1', '3G_1.5寸_酷睿', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:12', '2018-06-22 14:18:12');
INSERT INTO `wancll_goods_spec_groups` VALUES ('5', 'dd8803140e9929440f734fe1a98163f1', '1', '4G_1.4寸_骁龙', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:12', '2018-06-22 14:18:12');
INSERT INTO `wancll_goods_spec_groups` VALUES ('6', '1dd570d94f39e8946b63b1114e6cd860', '1', '4G_1.4寸_酷睿', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:12', '2018-06-22 14:18:12');
INSERT INTO `wancll_goods_spec_groups` VALUES ('7', 'd2642b3a74c1a500dca4b65b4d700623', '1', '4G_1.5寸_骁龙', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:12', '2018-06-22 14:18:12');
INSERT INTO `wancll_goods_spec_groups` VALUES ('8', 'd8d241a8c95e44f8b5ace07af8e64c6c', '1', '4G_1.5寸_酷睿', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:12', '2018-06-22 14:18:12');
INSERT INTO `wancll_goods_spec_groups` VALUES ('9', '6044402a44d3e4b7d8aca1a937bb4057', '2', '3G_1.4寸_骁龙', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:13', '2018-06-22 14:18:13');
INSERT INTO `wancll_goods_spec_groups` VALUES ('10', '31459ea1503c3a4989f8c4ccf7e671c7', '2', '3G_1.4寸_酷睿', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:13', '2018-06-22 14:18:13');
INSERT INTO `wancll_goods_spec_groups` VALUES ('11', '14161ac1e67bf774db44324561a24e40', '2', '3G_1.5寸_骁龙', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:13', '2018-06-22 14:18:13');
INSERT INTO `wancll_goods_spec_groups` VALUES ('12', 'df46ee894c4fedc6b2df3270c40da533', '2', '3G_1.5寸_酷睿', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:13', '2018-06-22 14:18:13');
INSERT INTO `wancll_goods_spec_groups` VALUES ('13', 'f502ecf35a31765972c2529bcdee4c05', '2', '4G_1.4寸_骁龙', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:13', '2018-06-22 14:18:13');
INSERT INTO `wancll_goods_spec_groups` VALUES ('14', '8f48d7a253e27bd2317937c75ec93a35', '2', '4G_1.4寸_酷睿', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:13', '2018-06-22 14:18:13');
INSERT INTO `wancll_goods_spec_groups` VALUES ('15', '96921f2cae544219c2f382d2ff1682b3', '2', '4G_1.5寸_骁龙', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:13', '2018-06-22 14:18:13');
INSERT INTO `wancll_goods_spec_groups` VALUES ('16', '3691a3cab8084ef29b4e3abfa7a706c7', '2', '4G_1.5寸_酷睿', '', '256.00', '200.00', '100.00', '150.00', '50', '50.00', 'X1515', '1515151517', '0', '0', '1', '2018-06-22 14:18:13', '2018-06-22 14:18:13');
INSERT INTO `wancll_goods_spec_groups` VALUES ('37', '2470248f7cb563a8775589b0b021c6eb', '6', 'gd32423423_1.4寸', '', '29.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-06-27 16:50:52', '2018-06-27 16:50:52');
INSERT INTO `wancll_goods_spec_groups` VALUES ('38', '234139072961ac3cd144b3636e9a9169', '6', '4G_1.4寸', '', '29.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-06-27 16:50:52', '2018-06-27 16:50:52');
INSERT INTO `wancll_goods_spec_groups` VALUES ('39', '23322a8c285a8ba15f2515ef1791c6e4', '6', '5G_1.4寸', '', '29.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-06-27 16:50:52', '2018-06-27 16:50:52');
INSERT INTO `wancll_goods_spec_groups` VALUES ('41', 'f5cc0047fcf9dfdd1d122428efcdfebe', '6', '4G_1.5寸', '', '29.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-06-27 16:50:52', '2018-06-27 16:50:52');
INSERT INTO `wancll_goods_spec_groups` VALUES ('40', 'dacee7be510299094b34e9a58ca16a21', '6', 'gd32423423_1.5寸', '', '29.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-06-27 16:50:52', '2018-06-27 16:50:52');
INSERT INTO `wancll_goods_spec_groups` VALUES ('42', '93906f7772bb61c73927d79be8fca444', '6', '5G_1.5寸', '', '29.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-06-27 16:50:52', '2018-06-27 16:50:52');
INSERT INTO `wancll_goods_spec_groups` VALUES ('43', 'a2560c601b4fa483c436661a22df472b', '6', 'gd32423423_1.6寸', '', '29.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-06-27 16:50:52', '2018-06-27 16:50:52');
INSERT INTO `wancll_goods_spec_groups` VALUES ('44', '429a5cfba69b4e3e9a180696b18c2a47', '6', '4G_1.6寸', '', '29.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-06-27 16:50:52', '2018-06-27 16:50:52');
INSERT INTO `wancll_goods_spec_groups` VALUES ('45', '9a28842fd2645323d79c97e722633e22', '6', '5G_1.6寸', '', '29.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-06-27 16:50:52', '2018-06-27 16:50:52');

-- -----------------------------
-- Table structure for `wancll_guides`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_guides`;
CREATE TABLE `wancll_guides` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL COMMENT '指导手册类别',
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `wancll_market_activities`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_market_activities`;
CREATE TABLE `wancll_market_activities` (
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_market_activities`
-- -----------------------------
INSERT INTO `wancll_market_activities` VALUES ('1', 'discount', '限时折扣活动', '', '[]', '', '', '2018-04-17 15:51:28', '2018-08-03 16:02:26', '1', '1', '2018-04-17 15:50:49', '2018-04-17 15:50:49');
INSERT INTO `wancll_market_activities` VALUES ('2', 'coupon', '优惠券活动', '', '[]', '', '', '2018-04-17 15:57:09', '2018-11-10 15:57:10', '1', '1', '2018-04-17 15:56:28', '2018-04-17 15:56:28');
INSERT INTO `wancll_market_activities` VALUES ('3', 'full', '满减活动', '', '[]', '', '', '2018-04-17 15:57:23', '2018-05-31 15:57:24', '1', '0', '2018-04-17 15:56:42', '2018-05-28 11:10:08');
INSERT INTO `wancll_market_activities` VALUES ('4', 'full', '31334', '', '[]', '3324', '<p>234234234<br/></p>', '2017-07-04 11:49:48', '2018-07-07 11:49:48', '1', '0', '2018-04-18 11:49:54', '2018-05-09 09:59:29');
INSERT INTO `wancll_market_activities` VALUES ('5', 'coupon', '4243234', '', '[]', '32132', '<p>423<img src=\"http://wancllshop.wx.wygoo.com/public/upload/ueditor/image/20180419/1524128101208402.jpg\" title=\"1524128101208402.jpg\" alt=\"f04d869e6f75f18651e4426b56f0c56f.jpg\" width=\"86\" height=\"90\"/></p>', '2018-03-26 11:54:01', '2018-05-31 17:07:48', '1', '0', '2018-04-18 11:54:00', '2018-05-09 09:59:32');
INSERT INTO `wancll_market_activities` VALUES ('6', 'full', '满减活动', '', '[]', '', '', '2018-05-01 11:13:55', '2018-11-09 11:13:59', '1', '1', '2018-05-28 11:14:13', '2018-05-28 11:14:13');
INSERT INTO `wancll_market_activities` VALUES ('7', 'full', '发', '/public/upload/user_avatar_images/20180628\\b721bd09571720e173cbcc8884825718.png', '[\"\\/public\\/upload\\/user_avatar_images\\/20180628\\\\302f66609573153d06ac986cdd924580.png\",\"\\/public\\/upload\\/user_avatar_images\\/20180628\\\\c7f702fe92c2d0c5c8d28fad70ebd940.png\"]', '放大', '', '2018-06-12 00:00:00', '2018-07-05 00:00:00', '1', '1', '2018-06-28 10:24:35', '2018-06-28 10:24:35');

-- -----------------------------
-- Table structure for `wancll_mobile_msgs`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_mobile_msgs`;
CREATE TABLE `wancll_mobile_msgs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) NOT NULL COMMENT '手机号',
  `msg` varchar(255) NOT NULL COMMENT '发送的短信内容',
  `code` varchar(255) NOT NULL COMMENT '短信验证码',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '短信发送状态（1发送成功0发送失败）',
  `send_time` datetime NOT NULL COMMENT '短信的发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_mobile_msgs`
-- -----------------------------
INSERT INTO `wancll_mobile_msgs` VALUES ('1', '18100000000', '【网开创】您的验证码是：514733。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '514733', '1', '2018-06-15 09:35:57');
INSERT INTO `wancll_mobile_msgs` VALUES ('2', '18100000000', '【网开创】您的验证码是：311734。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '311734', '1', '2018-06-15 09:36:10');
INSERT INTO `wancll_mobile_msgs` VALUES ('3', '15200597371', '【网开创】您的验证码是：905490。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '905490', '1', '2018-06-15 09:40:21');
INSERT INTO `wancll_mobile_msgs` VALUES ('4', '15675143940', '【网开创】您的验证码是：180255。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '180255', '1', '2018-06-15 18:53:29');
INSERT INTO `wancll_mobile_msgs` VALUES ('5', '13170308670', '【网开创】您的验证码是：147955。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '147955', '1', '2018-06-15 19:08:20');
INSERT INTO `wancll_mobile_msgs` VALUES ('6', '18390926488', '【网开创】您的验证码是：690213。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '690213', '1', '2018-06-15 19:08:24');
INSERT INTO `wancll_mobile_msgs` VALUES ('7', '13170308670', '【网开创】您的验证码是：498034。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '498034', '1', '2018-06-15 19:08:28');
INSERT INTO `wancll_mobile_msgs` VALUES ('8', '15802577957', '【网开创】您的验证码是：318051。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '318051', '1', '2018-06-16 11:52:44');
INSERT INTO `wancll_mobile_msgs` VALUES ('9', '15874013247', '【网开创】您的验证码是：347055。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '347055', '1', '2018-06-19 11:49:52');
INSERT INTO `wancll_mobile_msgs` VALUES ('10', '18175974828', '【网开创】您的验证码是：914663。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '914663', '1', '2018-06-19 14:08:01');
INSERT INTO `wancll_mobile_msgs` VALUES ('11', '13117512114', '【网开创】您的验证码是：755664。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '755664', '1', '2018-06-19 14:26:35');
INSERT INTO `wancll_mobile_msgs` VALUES ('12', '15111063940', '【网开创】您的验证码是：963333。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '963333', '1', '2018-06-20 11:22:13');
INSERT INTO `wancll_mobile_msgs` VALUES ('13', '17608491856', '【网开创】您的验证码是：968304。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '968304', '1', '2018-06-20 14:13:13');
INSERT INTO `wancll_mobile_msgs` VALUES ('14', '17608491856', '【网开创】您的验证码是：347357。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '347357', '1', '2018-06-20 14:13:23');
INSERT INTO `wancll_mobile_msgs` VALUES ('15', '17608491856', '【网开创】您的验证码是：939492。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '939492', '1', '2018-06-20 14:13:47');

-- -----------------------------
-- Table structure for `wancll_navs`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_navs`;
CREATE TABLE `wancll_navs` (
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
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_navs`
-- -----------------------------
INSERT INTO `wancll_navs` VALUES ('1', '会员管理', '', 'icon-account', '', '', '', '', '900', '0', '0', '1', '1', '2017-12-06 15:06:14', '2018-04-02 15:46:53');
INSERT INTO `wancll_navs` VALUES ('2', '会员列表', '', '', 'admin', 'users', 'index', '', '100', '1', '0', '1', '1', '2017-12-06 15:11:57', '2017-12-29 09:34:45');
INSERT INTO `wancll_navs` VALUES ('29', '管理员列表', '', '', 'admin', 'admins', 'index', '', '20', '22', '0', '1', '1', '2017-12-11 20:56:47', '2017-12-19 08:55:41');
INSERT INTO `wancll_navs` VALUES ('112', '会员认证', '', '', 'admin', 'users', 'user_auths', '', '90', '1', '0', '1', '1', '2018-04-08 17:33:31', '2018-04-08 17:33:31');
INSERT INTO `wancll_navs` VALUES ('32', '友情链接', '', '', 'admin', 'friendly_links', 'index', '', '50', '37', '0', '1', '1', '2017-12-12 09:20:56', '2017-12-28 17:49:58');
INSERT INTO `wancll_navs` VALUES ('33', '会员访问日志', '', '', 'admin', 'users', 'user_visit_logs', '', '10', '1', '0', '1', '1', '2017-12-12 09:21:44', '2017-12-29 09:35:01');
INSERT INTO `wancll_navs` VALUES ('34', '自定义模型', '', '', 'admin', 'dds', 'index', '', '12', '22', '0', '1', '1', '2017-12-12 20:19:06', '2018-03-10 09:58:18');
INSERT INTO `wancll_navs` VALUES ('18', '文章管理', '', '', 'admin', 'articles', 'index', '', '200', '37', '0', '1', '1', '2017-12-06 15:23:47', '2017-12-16 10:09:53');
INSERT INTO `wancll_navs` VALUES ('19', '文章分类', '', '', 'admin', 'article_types', 'index', '', '80', '37', '0', '1', '1', '2017-12-06 15:24:19', '2017-12-16 10:12:26');
INSERT INTO `wancll_navs` VALUES ('113', '会员银行卡', '', '', 'admin', 'users', 'user_bank_cards', '', '70', '1', '0', '1', '1', '2018-04-10 16:52:12', '2018-04-10 16:52:12');
INSERT INTO `wancll_navs` VALUES ('21', '规则列表', '', '', 'admin', 'rules', 'index', '', '50', '37', '0', '1', '1', '2017-12-06 15:25:01', '2017-12-28 17:51:07');
INSERT INTO `wancll_navs` VALUES ('22', '系统管理', '', 'icon-msnui-sys-set', 'admin', 'admins', 'index', '', '100', '0', '0', '1', '1', '2017-12-06 15:25:27', '2018-02-25 23:19:26');
INSERT INTO `wancll_navs` VALUES ('23', '参数配置', '', '', 'admin', 'params', 'index', '', '16', '22', '0', '1', '1', '2017-12-06 15:26:06', '2018-02-25 11:23:01');
INSERT INTO `wancll_navs` VALUES ('24', '菜单配置', '', '', 'admin', 'navs', 'index', '', '15', '22', '0', '1', '1', '2017-12-06 15:26:35', '2018-02-25 11:23:12');
INSERT INTO `wancll_navs` VALUES ('114', '资产管理', '', 'icon-daizhifudingdan', '', '', '', '', '750', '0', '0', '1', '1', '2018-04-11 17:53:54', '2018-04-11 17:53:54');
INSERT INTO `wancll_navs` VALUES ('27', '角色管理', '', '', 'admin', 'roles', 'index', '', '18', '22', '0', '1', '1', '2017-12-06 16:53:05', '2017-12-19 08:55:51');
INSERT INTO `wancll_navs` VALUES ('115', '会员资产列表', '', '', 'admin', 'user_assets', 'index', '', '100', '114', '0', '1', '1', '2018-04-11 17:54:55', '2018-04-11 17:54:55');
INSERT INTO `wancll_navs` VALUES ('36', '数据中台', '', 'icon-iconset0357', 'admin', 'data', 'index', '', '1000', '0', '0', '1', '1', '2017-12-14 15:27:53', '2018-02-25 23:18:30');
INSERT INTO `wancll_navs` VALUES ('37', '内容管理', '', 'icon-xiexinzhangjie', 'admin', 'articles', 'index', '', '60', '0', '0', '1', '1', '2017-12-16 10:05:09', '2018-02-25 23:19:14');
INSERT INTO `wancll_navs` VALUES ('38', '广告管理', '', '', 'admin', 'advertisements', 'index', '', '79', '37', '0', '1', '1', '2017-12-16 10:07:15', '2017-12-28 17:50:15');
INSERT INTO `wancll_navs` VALUES ('39', '通知公告', '', '', 'admin', 'annoncements', 'index', '', '78', '37', '0', '1', '1', '2017-12-16 10:08:37', '2017-12-28 17:50:23');
INSERT INTO `wancll_navs` VALUES ('42', '轮播图管理', '', '', 'admin', 'banners', 'index', '', '60', '37', '0', '1', '1', '2017-12-16 10:21:28', '2017-12-28 17:51:13');
INSERT INTO `wancll_navs` VALUES ('43', '商品管理', '', 'icon-all', 'admin', 'goods', 'index', '', '750', '0', '0', '1', '1', '2017-12-16 10:35:43', '2018-02-25 23:18:39');
INSERT INTO `wancll_navs` VALUES ('44', '商品列表', '', '', 'admin', 'goods', 'index', '', '100', '43', '0', '1', '1', '2017-12-16 10:36:26', '2017-12-16 10:36:26');
INSERT INTO `wancll_navs` VALUES ('45', '商品分类', '', '', 'admin', 'goods', 'goods_cates', '', '90', '43', '0', '1', '1', '2017-12-16 10:37:57', '2017-12-16 10:37:57');
INSERT INTO `wancll_navs` VALUES ('46', '商品评论', '', '', 'admin', 'goods', 'goods_comments', '', '50', '43', '0', '1', '1', '2017-12-16 10:38:42', '2017-12-16 10:38:42');
INSERT INTO `wancll_navs` VALUES ('47', '商品收藏', '', '', 'admin', 'goods', 'goods_collections', '', '40', '43', '0', '1', '1', '2017-12-16 10:40:28', '2017-12-16 10:40:28');
INSERT INTO `wancll_navs` VALUES ('48', '订单管理', '', 'icon-icon_order', 'admin', 'orders', 'index', '', '650', '0', '0', '1', '1', '2017-12-16 10:45:06', '2018-02-25 23:19:03');
INSERT INTO `wancll_navs` VALUES ('49', '订单列表', '', '', 'admin', 'orders', 'index', '', '100', '48', '0', '1', '1', '2017-12-16 10:47:03', '2017-12-29 23:09:05');
INSERT INTO `wancll_navs` VALUES ('70', '管理员登录日志', '', '', 'admin', 'visit_logs', 'admin', '', '19', '22', '0', '1', '1', '2017-12-20 21:21:54', '2017-12-20 21:21:54');
INSERT INTO `wancll_navs` VALUES ('116', '资产变动记录', '', '', 'admin', 'user_assets', 'user_asset_logs', '', '90', '114', '0', '1', '1', '2018-04-11 18:02:58', '2018-04-11 18:02:58');
INSERT INTO `wancll_navs` VALUES ('117', '会员积分记录', '', '', 'admin', 'user_assets', 'user_score_logs', '', '60', '114', '0', '1', '1', '2018-04-11 20:36:36', '2018-04-11 20:36:36');
INSERT INTO `wancll_navs` VALUES ('118', '会员提现记录', '', '', 'admin', 'user_assets', 'user_withdraw_logs', '', '70', '114', '0', '1', '1', '2018-04-11 20:40:19', '2018-04-11 20:40:19');
INSERT INTO `wancll_navs` VALUES ('75', '会员地址', '', '', 'admin', 'users', 'user_addresses', '', '80', '1', '0', '1', '1', '2017-12-29 22:57:42', '2017-12-29 22:57:42');
INSERT INTO `wancll_navs` VALUES ('76', '发货管理', '', '', 'admin', 'deliver', 'index', '', '90', '48', '0', '1', '1', '2017-12-29 23:08:50', '2017-12-29 23:08:50');
INSERT INTO `wancll_navs` VALUES ('77', '退货管理', '', '', 'admin', 'return_goods', 'index', '', '80', '48', '0', '1', '1', '2017-12-29 23:10:22', '2017-12-29 23:10:22');
INSERT INTO `wancll_navs` VALUES ('78', '物流查询', '', '', 'admin', 'transport', 'index', '', '60', '48', '0', '1', '1', '2017-12-29 23:11:39', '2017-12-29 23:11:39');
INSERT INTO `wancll_navs` VALUES ('81', '分销管理', '', 'icon-tixian', '', '', '', '', '400', '0', '0', '1', '1', '2017-12-27 10:49:50', '2018-02-23 22:47:25');
INSERT INTO `wancll_navs` VALUES ('82', '分销商等级设置', '', '', 'admin', 'distribution', 'levels', '', '90', '81', '0', '1', '1', '2017-12-27 10:52:40', '2017-12-27 10:52:53');
INSERT INTO `wancll_navs` VALUES ('83', '分销基本参数', '', '', 'admin', 'distribution', 'params', '', '100', '81', '0', '1', '1', '2017-12-27 14:11:33', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('119', '会员充值记录', '', '', 'admin', 'user_assets', 'user_recharge_logs', '', '80', '114', '0', '1', '1', '2018-04-11 20:40:44', '2018-04-11 20:40:44');
INSERT INTO `wancll_navs` VALUES ('86', '分销商佣金提现管理', '', '', 'admin', 'distribution', 'user_withdraw', '', '80', '81', '0', '1', '1', '2018-01-08 22:49:59', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('90', '签收管理', '', '', 'admin', 'sign_for', 'index', '', '70', '48', '0', '1', '1', '2018-02-08 10:52:34', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('91', '基础设置', '', 'icon-shezhi1', 'admin', 'basics', 'index', '', '2000', '0', '1', '1', '1', '2018-02-08 17:10:08', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('92', '留言建议', '', 'icon-xinfeng2', 'admin', 'feedbacks', 'index', '', '1900', '0', '1', '1', '1', '2018-02-08 17:10:45', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('93', '指导手册', '', 'icon-yewushouce', 'admin', 'guides', 'index', '', '1800', '0', '1', '1', '1', '2018-02-08 17:12:07', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('94', '统计板', '', '', 'admin', 'data', 'index', '', '10', '36', '0', '1', '1', '2018-02-23 08:44:28', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('128', '会员通知', '', '', 'admin', 'users', 'user_notices', '', '50', '1', '0', '1', '1', '2018-04-14 14:15:25', '2018-04-14 14:15:25');
INSERT INTO `wancll_navs` VALUES ('129', '会员优惠券', '', '', 'admin', 'users', 'user_coupons', '', '60', '1', '0', '1', '1', '2018-04-14 20:33:56', '2018-04-14 20:33:56');
INSERT INTO `wancll_navs` VALUES ('100', '商品规格模板', '', '', 'admin', 'goods', 'spec_template', '', '80', '43', '0', '1', '1', '2018-02-23 20:28:11', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('101', '商品属性模板', '', '', 'admin', 'goods', 'attr_template', '', '70', '43', '0', '1', '1', '2018-02-25 11:24:53', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('102', '商品运费模板', '', '', 'admin', 'goods', 'freight_template', '', '60', '43', '0', '1', '1', '2018-02-27 22:57:21', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('103', '七牛云存储', '', '', 'admin', 'qiniu', 'index', '', '10', '22', '0', '1', '1', '2018-03-08 13:50:09', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('104', '数据库备份与恢复', '', '', 'admin', 'databackup', 'index', '', '0', '22', '0', '1', '1', '2018-03-09 09:34:19', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('105', '邮件系统', '', '', 'admin', 'email', 'index', '', '8', '22', '0', '1', '1', '2018-03-10 09:58:06', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('121', '营销管理', '', 'icon-youhuiquan', 'admin', 'market_activities', 'index', '', '500', '0', '0', '1', '1', '2018-04-12 17:52:37', '2018-04-12 17:52:37');
INSERT INTO `wancll_navs` VALUES ('122', '活动管理', '', '', 'admin', 'market_activities', 'index', '', '100', '121', '0', '1', '1', '2018-04-12 17:55:09', '2018-04-12 17:55:09');
INSERT INTO `wancll_navs` VALUES ('124', '优惠券活动规则', '', '', 'admin', 'market_activities', 'coupon_activities', '', '70', '121', '0', '1', '1', '2018-04-13 11:45:26', '2018-04-13 11:45:26');
INSERT INTO `wancll_navs` VALUES ('125', '满减活动规则', '', '', 'admin', 'market_activities', 'full_activities', '', '80', '121', '0', '1', '1', '2018-04-13 14:14:19', '2018-04-13 14:14:19');
INSERT INTO `wancll_navs` VALUES ('126', '会员等级设置', '', '', 'admin', 'user_levels', 'index', '', '0', '22', '0', '1', '1', '2018-04-13 15:06:15', '2018-04-13 15:06:15');
INSERT INTO `wancll_navs` VALUES ('127', '限时折扣活动规则', '', '', 'admin', 'market_activities', 'discount_activities', '', '90', '121', '0', '1', '1', '2018-04-13 15:24:17', '2018-04-13 15:24:17');
INSERT INTO `wancll_navs` VALUES ('130', '会员申请分销商管理', '', '', 'admin', 'distribution', 'user_applications', '', '10', '81', '0', '1', '1', '2018-04-23 09:30:14', '2018-04-23 09:30:14');
INSERT INTO `wancll_navs` VALUES ('131', '分销商品设置', '', '', 'admin', 'distribution', 'goods_setting', '', '80', '81', '0', '1', '1', '2018-04-25 11:11:32', '2018-04-25 11:11:32');
INSERT INTO `wancll_navs` VALUES ('132', '分红管理', '', 'icon-shouhou', '', '', '', '', '300', '0', '0', '1', '1', '2018-04-27 09:26:02', '2018-04-27 09:26:02');
INSERT INTO `wancll_navs` VALUES ('133', '分红商等级设置', '', '', 'admin', 'bonus_levels', 'index', '', '90', '132', '0', '1', '1', '2018-04-27 09:26:26', '2018-04-27 09:26:26');
INSERT INTO `wancll_navs` VALUES ('134', '分红基本参数', '', '', 'admin', 'bonus_params', 'index', '', '100', '132', '0', '1', '1', '2018-04-27 10:25:08', '2018-04-27 10:25:08');
INSERT INTO `wancll_navs` VALUES ('135', '会员申请分红商管理', '', '', 'admin', 'bonus_user_applications', 'index', '', '60', '132', '0', '1', '1', '2018-04-27 11:30:33', '2018-04-27 11:30:33');
INSERT INTO `wancll_navs` VALUES ('136', '地区代理会员设置', '', '', 'admin', 'bonus_area_user_setting', 'index', '', '78', '132', '0', '1', '1', '2018-04-27 13:58:42', '2018-04-27 13:58:42');
INSERT INTO `wancll_navs` VALUES ('137', '分红商品设置', '', '', 'admin', 'bonus_goods_setting', 'index', '', '80', '132', '0', '1', '1', '2018-04-27 13:59:08', '2018-04-27 13:59:08');
INSERT INTO `wancll_navs` VALUES ('138', '全球分红会员设置', '', '', 'admin', 'bonus_global_user_setting', 'index', '', '76', '132', '0', '1', '1', '2018-04-28 09:19:42', '2018-04-28 09:19:42');
INSERT INTO `wancll_navs` VALUES ('139', '分红商佣金提现管理', '', '', 'admin', 'bonus_user_withdraw', 'index', '', '70', '132', '0', '1', '1', '2018-04-28 10:14:12', '2018-04-28 10:14:12');
INSERT INTO `wancll_navs` VALUES ('140', '上下级关系结构', '', '', 'admin', 'level_relationship_overview', 'index', '', '0', '81', '0', '1', '1', '2018-06-04 22:06:58', '2018-06-04 22:06:58');
INSERT INTO `wancll_navs` VALUES ('141', '分销商列表', '', '', 'admin', 'distribution', 'users', '', '0', '81', '0', '1', '1', '2018-06-13 13:46:29', '2018-06-13 13:46:29');
INSERT INTO `wancll_navs` VALUES ('142', '分红商列表', '', '', 'admin', 'bonus_users', 'index', '', '0', '132', '0', '1', '1', '2018-06-13 13:46:51', '2018-06-13 13:46:51');
INSERT INTO `wancll_navs` VALUES ('143', '分类树', '', '', 'admin', 'category_tree', 'index', '', '11', '22', '0', '1', '1', '2018-06-28 11:52:31', '2018-06-28 11:52:31');

-- -----------------------------
-- Table structure for `wancll_notices`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_notices`;
CREATE TABLE `wancll_notices` (
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_notices`
-- -----------------------------
INSERT INTO `wancll_notices` VALUES ('1', '11', '1111', '11', '11', '1', '1', '2018-05-03 11:02:56', '2018-05-07 11:04:59');
INSERT INTO `wancll_notices` VALUES ('2', '6', 'dfasfsdfa', '134', '14', '1', '1', '2018-05-07 11:09:51', '2018-05-07 11:09:51');
INSERT INTO `wancll_notices` VALUES ('3', '4', '3412', '43143', '42341324123', '1', '1', '2018-06-27 22:38:56', '2018-06-27 22:38:56');

-- -----------------------------
-- Table structure for `wancll_order_goods`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_order_goods`;
CREATE TABLE `wancll_order_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '会员ID',
  `name` varchar(255) DEFAULT NULL,
  `thum` varchar(255) DEFAULT NULL,
  `intro` text COMMENT '商品简介',
  `standard` varchar(255) DEFAULT NULL COMMENT '商品规格',
  `spec_group_id_str` varchar(255) DEFAULT '' COMMENT '商品规格的组合ID',
  `spec_group_info` varchar(255) DEFAULT NULL,
  `sell_price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `real_price` decimal(10,2) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL COMMENT '商品的重量',
  `num` int(11) DEFAULT NULL COMMENT '购买数量',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '0未评论1已评论',
  `return_goods_status` tinyint(1) DEFAULT '0' COMMENT '退货状态：0未申请退货1申请退货2拒绝退货3已退货',
  `is_return_goods` tinyint(1) DEFAULT '0' COMMENT '是否退货：0否1是',
  `is_return_money` tinyint(1) DEFAULT '0' COMMENT '是否退款：0未退款1已退款',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_order_goods`
-- -----------------------------
INSERT INTO `wancll_order_goods` VALUES ('1', '1', '33', '2', '男式无缝休闲运动T恤', '/public/upload/images/1524125128744.jpg', 'Adidas制造商，快干透气网结构', '', '86', '蓝色_M(160-170)', '136.00', '136.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-15 09:41:01', '2018-06-15 09:41:01');
INSERT INTO `wancll_order_goods` VALUES ('2', '2', '34', '1', '男式丝光棉轻商务须边领T恤', '/public/upload/images/1524125640237.jpg', '含蓄个性的须边风雅', '', '394', '蓝色_M', '110.00', '100.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-15 10:16:47', '2018-06-15 10:16:47');
INSERT INTO `wancll_order_goods` VALUES ('3', '3', '34', '5', '男式丝光棉轻商务须边领T恤', '/public/upload/images/1524125640237.jpg', '含蓄个性的须边风雅', '', '394', '蓝色_M', '110.00', '100.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-15 10:24:10', '2018-06-15 10:24:10');
INSERT INTO `wancll_order_goods` VALUES ('4', '4', '34', '1', '男式丝光棉轻商务须边领T恤', '/public/upload/images/1524125640237.jpg', '含蓄个性的须边风雅', '', '394', '蓝色_M', '110.00', '110.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-15 10:26:34', '2018-06-15 10:26:34');
INSERT INTO `wancll_order_goods` VALUES ('5', '5', '34', '1', '男式丝光棉轻商务须边领T恤', '/public/upload/images/1524125640237.jpg', '含蓄个性的须边风雅', '', '394', '蓝色_M', '110.00', '110.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-15 10:26:35', '2018-06-15 10:26:35');
INSERT INTO `wancll_order_goods` VALUES ('6', '6', '32', '7', '女式条纹提花短袖针织衫', '/public/upload/images/1524124362820.jpg', '超in的条纹小恐龙，带动全身的时髦细胞', '', '92', '白色条纹_M', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-15 10:34:40', '2018-06-15 10:34:40');
INSERT INTO `wancll_order_goods` VALUES ('7', '7', '22', '7', '牛皮复古公文包', '/public/upload/images/1524122680309.jpg', 'MK制造商，定制牛皮优雅尽显', '', '0', '', '599.00', '599.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-15 11:15:35', '2018-06-15 11:15:35');
INSERT INTO `wancll_order_goods` VALUES ('8', '8', '34', '1', '男式丝光棉轻商务须边领T恤', '/public/upload/images/1524125640237.jpg', '含蓄个性的须边风雅', '', '392', '白色_M', '110.00', '110.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-15 11:33:24', '2018-06-15 11:33:24');
INSERT INTO `wancll_order_goods` VALUES ('9', '9', '34', '6', '男式丝光棉轻商务须边领T恤', '/public/upload/images/1524125640237.jpg', '含蓄个性的须边风雅', '', '394', '蓝色_M', '110.00', '110.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-15 11:44:11', '2018-06-15 11:44:11');
INSERT INTO `wancll_order_goods` VALUES ('10', '10', '34', '6', '男式丝光棉轻商务须边领T恤', '/public/upload/images/1524125640237.jpg', '含蓄个性的须边风雅', '', '394', '蓝色_M', '110.00', '100.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-15 11:49:05', '2018-06-15 11:49:05');
INSERT INTO `wancll_order_goods` VALUES ('11', '11', '34', '1', '男式丝光棉轻商务须边领T恤', '/public/upload/images/1524125640237.jpg', '含蓄个性的须边风雅', '', '393', '藏青色_M', '110.00', '110.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-15 11:52:45', '2018-06-15 11:52:45');
INSERT INTO `wancll_order_goods` VALUES ('12', '12', '33', '2', '男式无缝休闲运动T恤', '/public/upload/images/1524125128744.jpg', 'Adidas制造商，快干透气网结构', '', '90', '蓝色_L(170-180)', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-15 18:49:06', '2018-06-15 18:49:06');
INSERT INTO `wancll_order_goods` VALUES ('13', '13', '34', '11', '男式丝光棉轻商务须边领T恤', '/public/upload/images/1524125640237.jpg', '含蓄个性的须边风雅', '', '389', '白色_L', '120.00', '120.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-15 18:53:18', '2018-06-15 18:53:18');
INSERT INTO `wancll_order_goods` VALUES ('14', '14', '36', '7', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '259.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-16 09:50:30', '2018-06-16 09:50:30');
INSERT INTO `wancll_order_goods` VALUES ('15', '15', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '259.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-19 13:50:54', '2018-06-19 13:50:54');
INSERT INTO `wancll_order_goods` VALUES ('16', '16', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '259.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-19 13:50:56', '2018-06-19 13:50:56');
INSERT INTO `wancll_order_goods` VALUES ('17', '17', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '259.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-19 13:50:57', '2018-06-19 13:50:57');
INSERT INTO `wancll_order_goods` VALUES ('18', '18', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '259.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_order_goods` VALUES ('19', '19', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '259.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_order_goods` VALUES ('20', '20', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '259.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_order_goods` VALUES ('21', '21', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:51:54', '2018-06-19 13:51:54');
INSERT INTO `wancll_order_goods` VALUES ('22', '22', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:51:57', '2018-06-19 13:51:57');
INSERT INTO `wancll_order_goods` VALUES ('23', '23', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:51:58', '2018-06-19 13:51:58');
INSERT INTO `wancll_order_goods` VALUES ('24', '24', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:51:58', '2018-06-19 13:51:58');
INSERT INTO `wancll_order_goods` VALUES ('25', '25', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:52:09', '2018-06-19 13:52:09');
INSERT INTO `wancll_order_goods` VALUES ('26', '26', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:52:13', '2018-06-19 13:52:13');
INSERT INTO `wancll_order_goods` VALUES ('27', '27', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:52:17', '2018-06-19 13:52:17');
INSERT INTO `wancll_order_goods` VALUES ('28', '28', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:52:17', '2018-06-19 13:52:17');
INSERT INTO `wancll_order_goods` VALUES ('29', '29', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:52:54', '2018-06-19 13:52:54');
INSERT INTO `wancll_order_goods` VALUES ('30', '30', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:52:55', '2018-06-19 13:52:55');
INSERT INTO `wancll_order_goods` VALUES ('31', '31', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:53:07', '2018-06-19 13:53:07');
INSERT INTO `wancll_order_goods` VALUES ('32', '32', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:53:08', '2018-06-19 13:53:08');
INSERT INTO `wancll_order_goods` VALUES ('33', '33', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:53:08', '2018-06-19 13:53:08');
INSERT INTO `wancll_order_goods` VALUES ('34', '34', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:53:20', '2018-06-19 13:53:20');
INSERT INTO `wancll_order_goods` VALUES ('35', '35', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:53:23', '2018-06-19 13:53:23');
INSERT INTO `wancll_order_goods` VALUES ('36', '36', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:53:27', '2018-06-19 13:53:27');
INSERT INTO `wancll_order_goods` VALUES ('37', '37', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:53:54', '2018-06-19 13:53:54');
INSERT INTO `wancll_order_goods` VALUES ('38', '38', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:53:54', '2018-06-19 13:53:54');
INSERT INTO `wancll_order_goods` VALUES ('39', '39', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:54:05', '2018-06-19 13:54:05');
INSERT INTO `wancll_order_goods` VALUES ('40', '40', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:54:18', '2018-06-19 13:54:18');
INSERT INTO `wancll_order_goods` VALUES ('41', '41', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:54:18', '2018-06-19 13:54:18');
INSERT INTO `wancll_order_goods` VALUES ('42', '42', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:54:22', '2018-06-19 13:54:22');
INSERT INTO `wancll_order_goods` VALUES ('43', '43', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:54:29', '2018-06-19 13:54:29');
INSERT INTO `wancll_order_goods` VALUES ('44', '44', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:54:33', '2018-06-19 13:54:33');
INSERT INTO `wancll_order_goods` VALUES ('45', '45', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:54:37', '2018-06-19 13:54:37');
INSERT INTO `wancll_order_goods` VALUES ('46', '46', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:54:54', '2018-06-19 13:54:54');
INSERT INTO `wancll_order_goods` VALUES ('47', '47', '36', '4', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '382', '粉色_M', '259.00', '777.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-06-19 13:55:04', '2018-06-19 13:55:04');

-- -----------------------------
-- Table structure for `wancll_orders`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_orders`;
CREATE TABLE `wancll_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '会员ID',
  `order_no` varchar(255) NOT NULL COMMENT '订单号',
  `market_activity_type` varchar(20) DEFAULT '0' COMMENT '营销活动类别：full || discount || coupon',
  `market_activity_id` bigint(20) DEFAULT '0' COMMENT '营销活动ID',
  `market_reduce_money` decimal(10,2) DEFAULT '0.00' COMMENT '营销活动减少的金额',
  `goods_money` decimal(10,2) DEFAULT NULL COMMENT '商品的总价',
  `freight_money` decimal(10,2) DEFAULT NULL COMMENT '运费的总价',
  `total_money` decimal(10,2) DEFAULT NULL COMMENT '总金额',
  `mobile` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `consignee_name` varchar(100) DEFAULT NULL COMMENT '收货人',
  `province` varchar(255) DEFAULT NULL,
  `province_code` varchar(20) DEFAULT NULL COMMENT '省份编码',
  `city` varchar(255) DEFAULT NULL,
  `city_code` varchar(20) DEFAULT NULL COMMENT '城市编码',
  `area` varchar(255) DEFAULT NULL,
  `area_code` varchar(20) DEFAULT NULL COMMENT '地区编码',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `memo` text COMMENT '订单备注',
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '是否支付：0未支付1已支付',
  `pay_type` tinyint(1) DEFAULT NULL COMMENT '支付方式：1支付宝2微信3钱包',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `is_app_pay` tinyint(1) DEFAULT '0' COMMENT '是否是APP的支付：0否1是',
  `deliver_tip_num` bigint(20) DEFAULT '0' COMMENT '提醒发货的次数',
  `last_deliver_tip_time` datetime DEFAULT NULL COMMENT '最近一次的提醒发货时间',
  `deliver_time` datetime DEFAULT NULL COMMENT '发货时间',
  `is_open_eorder` tinyint(1) DEFAULT '0' COMMENT '是否开启电子面单：0否1是',
  `express_type` varchar(255) DEFAULT NULL COMMENT '快递方式',
  `express_no` varchar(255) DEFAULT NULL COMMENT '快递编号',
  `eorder_express_type` varchar(255) DEFAULT NULL COMMENT '快递鸟的物流公司类别',
  `is_submit_eorder` tinyint(1) DEFAULT '0' COMMENT '是否提交电子面单：0否1是',
  `confirm_receipt_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `cancel_reason` text COMMENT '订单取消原因',
  `cancel_time` datetime DEFAULT NULL COMMENT '订单的取消时间',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '是否评价',
  `is_has_return_goods` tinyint(1) DEFAULT '0' COMMENT '是否还有退货中的商品：0没有1有',
  `is_all_return_goods` tinyint(1) DEFAULT '0' COMMENT '是否全部退货：0否1是',
  `is_deal_return_goods` tinyint(1) DEFAULT '0' COMMENT '是否处理完退货：0未处理1已处理',
  `return_goods_money` decimal(10,2) DEFAULT '0.00' COMMENT '退货的金额',
  `status` tinyint(1) DEFAULT '1' COMMENT '订单状态：1待付款2已付款待发货3已发货待收货4已确认收货9已取消',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`,`order_no`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_orders`
-- -----------------------------
INSERT INTO `wancll_orders` VALUES ('1', '2', 'N2018061509410150313', '0', '0', '', '136.00', '0.00', '136.00', '18396964545', '韩梅梅', '天津市', '120000', '市辖区', '120100', '河东区', '120102', '开源鑫贸大楼', '', '1', '3', '2018-06-15 09:41:23', '0', '0', '', '2018-06-15 09:41:47', '1', 'shunfeng', '620649072612', 'SF', '1', '', '', '', '0', '0', '0', '0', '0.00', '3', '1', '2018-06-15 09:41:01', '2018-06-15 09:41:48');
INSERT INTO `wancll_orders` VALUES ('2', '1', 'N2018061510164730358', 'full', '6', '10.00', '110.00', '0.00', '100.00', '18100000001', '01', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-06-15 10:17:11', '0', '0', '', '2018-06-15 11:06:11', '0', 'huitongkuaidi', '12321', '', '0', '2018-06-15 11:06:32', '', '', '0', '0', '0', '0', '0.00', '4', '1', '2018-06-15 10:16:47', '2018-06-15 11:06:32');
INSERT INTO `wancll_orders` VALUES ('3', '5', 'N2018061510241052987', 'full', '6', '10.00', '110.00', '0.00', '100.00', '18100000002', '02', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-06-15 10:24:24', '0', '0', '', '2018-06-15 11:09:58', '0', 'huitongkuaidi', '12312', '', '0', '2018-06-15 11:10:16', '', '', '0', '0', '0', '0', '0.00', '4', '1', '2018-06-15 10:24:10', '2018-06-15 11:10:16');
INSERT INTO `wancll_orders` VALUES ('4', '1', 'N2018061510263426422', '0', '0', '', '110.00', '0.00', '110.00', '18100000001', '01', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '我不想买了', '2018-06-15 10:33:39', '0', '0', '0', '0', '0.00', '9', '1', '2018-06-15 10:26:34', '2018-06-15 10:33:39');
INSERT INTO `wancll_orders` VALUES ('5', '1', 'N2018061510263590704', '0', '0', '', '110.00', '0.00', '110.00', '18100000001', '01', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '我不想买了', '2018-06-15 10:33:36', '0', '0', '0', '0', '0.00', '9', '1', '2018-06-15 10:26:35', '2018-06-15 10:33:36');
INSERT INTO `wancll_orders` VALUES ('6', '7', 'N2018061510344003163', '0', '0', '', '126.00', '0.00', '126.00', '15580841403', '易云', '山西省', '140000', '大同市', '140200', '大同县', '140227', '测试地址', '', '1', '3', '2018-06-15 10:35:08', '0', '0', '', '2018-06-15 10:36:20', '1', 'shunfeng', '620650687851', 'SF', '1', '2018-06-15 11:16:21', '', '', '0', '0', '0', '0', '0.00', '4', '1', '2018-06-15 10:34:40', '2018-06-15 11:16:21');
INSERT INTO `wancll_orders` VALUES ('7', '7', 'N2018061511153518320', '0', '0', '', '599.00', '0.00', '599.00', '15580841403', '易云', '山西省', '140000', '大同市', '140200', '大同县', '140227', '测试地址', '', '1', '3', '2018-06-15 11:22:44', '0', '0', '', '2018-06-15 11:52:19', '0', 'huitongkuaidi', '1231231', '', '0', '2018-06-15 11:52:23', '', '', '0', '0', '0', '0', '0.00', '4', '1', '2018-06-15 11:15:35', '2018-06-15 11:52:23');
INSERT INTO `wancll_orders` VALUES ('8', '1', 'N2018061511332423712', '0', '0', '', '110.00', '0.00', '110.00', '18100000001', '01', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-06-15 11:33:34', '0', '0', '', '2018-06-15 11:52:05', '0', 'huitongkuaidi', '213123', '', '0', '2018-06-15 11:52:09', '', '', '0', '0', '0', '0', '0.00', '4', '1', '2018-06-15 11:33:24', '2018-06-15 11:52:09');
INSERT INTO `wancll_orders` VALUES ('9', '6', 'N2018061511441190450', '0', '0', '', '110.00', '0.00', '110.00', '18100000003', '03', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-06-15 11:44:23', '0', '0', '', '2018-06-15 11:51:47', '0', 'huitongkuaidi', '123123', '', '0', '2018-06-15 11:51:51', '', '', '0', '0', '0', '0', '0.00', '4', '1', '2018-06-15 11:44:11', '2018-06-15 11:51:51');
INSERT INTO `wancll_orders` VALUES ('10', '6', 'N2018061511490566101', 'full', '6', '10.00', '110.00', '0.00', '100.00', '18100000003', '03', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-06-15 11:49:12', '0', '0', '', '2018-06-15 11:49:38', '0', 'huitongkuaidi', '333', '', '0', '2018-06-15 11:50:16', '', '', '0', '0', '0', '0', '0.00', '4', '1', '2018-06-15 11:49:05', '2018-06-15 11:50:16');
INSERT INTO `wancll_orders` VALUES ('11', '1', 'N2018061511524556531', '0', '0', '', '110.00', '0.00', '110.00', '18100000001', '01', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-06-15 11:52:50', '0', '0', '', '2018-06-15 18:48:13', '1', 'shunfeng', '620664648809', 'SF', '1', '', '', '', '0', '0', '0', '0', '0.00', '3', '1', '2018-06-15 11:52:45', '2018-06-15 18:48:14');
INSERT INTO `wancll_orders` VALUES ('12', '2', 'N2018061518490641888', '0', '0', '', '126.00', '0.00', '126.00', '18396964545', '韩梅梅', '天津市', '120000', '市辖区', '120100', '河东区', '120102', '开源鑫贸大楼', '', '1', '3', '2018-06-15 18:49:15', '0', '1', '2018-06-15 18:49:20', '2018-06-15 19:12:09', '1', 'shunfeng', '620664987665', 'SF', '1', '', '', '', '0', '0', '0', '0', '0.00', '3', '1', '2018-06-15 18:49:06', '2018-06-15 19:12:09');
INSERT INTO `wancll_orders` VALUES ('13', '11', 'N2018061518531846631', '0', '0', '', '120.00', '0.00', '120.00', '15675143940', '毛戈', '天津市', '120000', '市辖区', '120100', '河东区', '120102', '区域', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-15 18:53:18', '2018-06-15 18:53:18');
INSERT INTO `wancll_orders` VALUES ('14', '7', 'N2018061609503092867', '0', '0', '', '259.00', '0.00', '259.00', '15580841403', '易云', '山西省', '140000', '大同市', '140200', '大同县', '140227', '测试地址', '', '1', '3', '2018-06-16 09:50:40', '0', '0', '', '2018-06-16 09:51:42', '1', 'shunfeng', '620675578997', 'SF', '1', '2018-06-16 09:51:49', '', '', '0', '0', '0', '0', '0.00', '4', '1', '2018-06-16 09:50:30', '2018-06-16 09:51:49');
INSERT INTO `wancll_orders` VALUES ('15', '4', 'N2018061913505400762', '0', '0', '', '259.00', '0.00', '259.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:50:54', '2018-06-19 13:50:54');
INSERT INTO `wancll_orders` VALUES ('16', '4', 'N2018061913505646463', '0', '0', '', '259.00', '0.00', '259.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:50:56', '2018-06-19 13:50:56');
INSERT INTO `wancll_orders` VALUES ('17', '4', 'N2018061913505715973', '0', '0', '', '259.00', '0.00', '259.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:50:57', '2018-06-19 13:50:57');
INSERT INTO `wancll_orders` VALUES ('18', '4', 'N2018061913505838375', '0', '0', '', '259.00', '0.00', '259.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_orders` VALUES ('19', '4', 'N2018061913505882927', '0', '0', '', '259.00', '0.00', '259.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_orders` VALUES ('20', '4', 'N2018061913505816097', '0', '0', '', '259.00', '0.00', '259.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_orders` VALUES ('21', '4', 'N2018061913515441953', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:51:54', '2018-06-19 13:51:54');
INSERT INTO `wancll_orders` VALUES ('22', '4', 'N2018061913515777492', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:51:57', '2018-06-19 13:51:57');
INSERT INTO `wancll_orders` VALUES ('23', '4', 'N2018061913515878515', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:51:58', '2018-06-19 13:51:58');
INSERT INTO `wancll_orders` VALUES ('24', '4', 'N2018061913515829482', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:51:58', '2018-06-19 13:51:58');
INSERT INTO `wancll_orders` VALUES ('25', '4', 'N2018061913520960078', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:52:09', '2018-06-19 13:52:09');
INSERT INTO `wancll_orders` VALUES ('26', '4', 'N2018061913521203843', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:52:12', '2018-06-19 13:52:13');
INSERT INTO `wancll_orders` VALUES ('27', '4', 'N2018061913521751967', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:52:17', '2018-06-19 13:52:17');
INSERT INTO `wancll_orders` VALUES ('28', '4', 'N2018061913521749800', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:52:17', '2018-06-19 13:52:17');
INSERT INTO `wancll_orders` VALUES ('29', '4', 'N2018061913525407912', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:52:54', '2018-06-19 13:52:54');
INSERT INTO `wancll_orders` VALUES ('30', '4', 'N2018061913525565628', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:52:55', '2018-06-19 13:52:55');
INSERT INTO `wancll_orders` VALUES ('31', '4', 'N2018061913530756007', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:53:07', '2018-06-19 13:53:07');
INSERT INTO `wancll_orders` VALUES ('32', '4', 'N2018061913530890978', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:53:08', '2018-06-19 13:53:08');
INSERT INTO `wancll_orders` VALUES ('33', '4', 'N2018061913530842105', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:53:08', '2018-06-19 13:53:08');
INSERT INTO `wancll_orders` VALUES ('34', '4', 'N2018061913532097668', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:53:20', '2018-06-19 13:53:20');
INSERT INTO `wancll_orders` VALUES ('35', '4', 'N2018061913532318934', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:53:23', '2018-06-19 13:53:23');
INSERT INTO `wancll_orders` VALUES ('36', '4', 'N2018061913532797187', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:53:27', '2018-06-19 13:53:27');
INSERT INTO `wancll_orders` VALUES ('37', '4', 'N2018061913535464002', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:53:54', '2018-06-19 13:53:54');
INSERT INTO `wancll_orders` VALUES ('38', '4', 'N2018061913535435970', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:53:54', '2018-06-19 13:53:54');
INSERT INTO `wancll_orders` VALUES ('39', '4', 'N2018061913540406658', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:54:04', '2018-06-19 13:54:05');
INSERT INTO `wancll_orders` VALUES ('40', '4', 'N2018061913541854809', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:54:18', '2018-06-19 13:54:18');
INSERT INTO `wancll_orders` VALUES ('41', '4', 'N2018061913541848357', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:54:18', '2018-06-19 13:54:18');
INSERT INTO `wancll_orders` VALUES ('42', '4', 'N2018061913542206602', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:54:22', '2018-06-19 13:54:22');
INSERT INTO `wancll_orders` VALUES ('43', '4', 'N2018061913542903214', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:54:29', '2018-06-19 13:54:29');
INSERT INTO `wancll_orders` VALUES ('44', '4', 'N2018061913543302268', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:54:33', '2018-06-19 13:54:33');
INSERT INTO `wancll_orders` VALUES ('45', '4', 'N2018061913543720822', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:54:37', '2018-06-19 13:54:37');
INSERT INTO `wancll_orders` VALUES ('46', '4', 'N2018061913545447955', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:54:54', '2018-06-19 13:54:54');
INSERT INTO `wancll_orders` VALUES ('47', '4', 'N2018061913550455118', '0', '0', '', '777.00', '0.00', '777.00', '18888888888', 'as', '北京市', '110000', '市辖区', '110100', '门头沟区', '110109', '123123', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '1', '2018-06-19 13:55:04', '2018-06-19 13:55:04');

-- -----------------------------
-- Table structure for `wancll_qiniu_files`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_qiniu_files`;
CREATE TABLE `wancll_qiniu_files` (
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


-- -----------------------------
-- Table structure for `wancll_region_bonus`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_region_bonus`;
CREATE TABLE `wancll_region_bonus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '地区代理类别：1省级代理2市级代理3县级代理',
  `province` varchar(255) DEFAULT NULL COMMENT '省份名称',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省份编码',
  `city` varchar(255) DEFAULT NULL COMMENT '城市名称',
  `city_code` varchar(20) DEFAULT NULL COMMENT '城市编码',
  `area` varchar(255) DEFAULT NULL COMMENT '地区名称',
  `area_code` varchar(20) DEFAULT NULL COMMENT '地区编码',
  `is_open_own_rate` tinyint(1) DEFAULT '0' COMMENT '是否开启单独比例：0否1是',
  `region_rate` decimal(10,2) DEFAULT NULL COMMENT '区域分红比例',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1正常2关闭',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_region_bonus`
-- -----------------------------
INSERT INTO `wancll_region_bonus` VALUES ('1', '7', '3', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '0', '0.00', '1', '1', '2018-06-15 11:29:47', '2018-06-15 11:29:47');

-- -----------------------------
-- Table structure for `wancll_return_goods`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_return_goods`;
CREATE TABLE `wancll_return_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '会员ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单商品ID：为0表示整笔订单退货',
  `return_order_no` varchar(255) NOT NULL COMMENT '退货单号',
  `return_money` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `imgs` text,
  `return_type` varchar(255) DEFAULT NULL COMMENT '退货类别',
  `return_reason` text COMMENT '申请退货理由',
  `deal_time` datetime DEFAULT NULL COMMENT '管理员退货处理时间',
  `is_return_money` tinyint(1) DEFAULT '0' COMMENT '是否已退款：0否1是',
  `return_money_time` datetime DEFAULT NULL COMMENT '退款时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '订单状态：1申请中2已拒绝3已同意',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `wancll_role_api_powers`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_role_api_powers`;
CREATE TABLE `wancll_role_api_powers` (
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

-- -----------------------------
-- Records of `wancll_role_api_powers`
-- -----------------------------
INSERT INTO `wancll_role_api_powers` VALUES ('1', '1', 'users', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('2', '1', 'modules', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('3', '1', 'annoncements', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('4', '1', 'articles', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('5', '1', 'rules', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('6', '1', 'roles', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('7', '1', 'params', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('8', '1', 'navs', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('9', '1', 'datadict_keys', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('10', '2', 'users', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('11', '2', 'modules', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('12', '2', 'annoncements', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('13', '2', 'articles', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('14', '2', 'rules', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('15', '2', 'roles', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('16', '2', 'params', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('17', '2', 'navs', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('18', '2', 'datadict_keys', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('19', '1', 'admins', '1', '1', '1', '1', '1', '2017-12-11 21:30:18', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('20', '1', 'article_types', '1', '1', '1', '1', '1', '2017-12-11 22:03:22', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('21', '1', 'visit_logs', '1', '1', '1', '1', '1', '2017-12-12 09:42:14', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('22', '1', 'advertisements', '1', '1', '1', '1', '1', '2017-12-12 15:33:24', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('23', '1', 'friendly_links', '1', '1', '1', '1', '1', '2017-12-12 16:53:12', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('24', '1', 'dds', '1', '1', '1', '1', '1', '2017-12-12 20:42:10', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('25', '1', 'data_counts', '1', '1', '1', '1', '1', '2017-12-19 18:15:37', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('26', '1', 'resources', '1', '1', '1', '1', '1', '2017-12-20 09:55:41', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('27', '1', 'banners', '1', '1', '1', '1', '1', '2017-12-20 10:10:03', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('28', '1', 'courses', '1', '1', '1', '1', '1', '2017-12-20 15:51:08', '2017-12-20 17:29:54');
INSERT INTO `wancll_role_api_powers` VALUES ('29', '1', 'course_types', '1', '1', '1', '1', '1', '2017-12-20 17:13:09', '2017-12-20 17:29:54');
INSERT INTO `wancll_role_api_powers` VALUES ('30', '1', 'course_boxs', '1', '1', '1', '1', '1', '2017-12-20 17:29:54', '2017-12-20 17:29:54');
INSERT INTO `wancll_role_api_powers` VALUES ('31', '1', 'systems', '1', '1', '1', '1', '1', '2017-12-20 21:29:28', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('32', '1', 'shops', '1', '1', '1', '1', '1', '2017-12-21 15:43:58', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('33', '1', 'coupons', '1', '1', '1', '1', '1', '2017-12-23 14:01:48', '2018-03-10 09:59:10');
INSERT INTO `wancll_role_api_powers` VALUES ('34', '1', 'orders', '1', '1', '1', '1', '1', '2017-12-25 10:32:21', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('35', '3', 'users', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('36', '3', 'modules', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('37', '3', 'annoncements', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('38', '3', 'admins', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('39', '3', 'article_types', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('40', '3', 'articles', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('41', '3', 'rules', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('42', '3', 'roles', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('43', '3', 'params', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('44', '3', 'navs', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('45', '3', 'datadict_keys', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('46', '3', 'visit_logs', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('47', '3', 'advertisements', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('48', '3', 'friendly_links', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('49', '3', 'dds', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('50', '3', 'data_counts', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('51', '3', 'resources', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('52', '3', 'banners', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('53', '3', 'systems', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('54', '3', 'shops', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('55', '3', 'coupons', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('56', '3', 'orders', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('57', '1', 'addresses', '1', '1', '1', '1', '1', '2017-12-25 11:31:53', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('58', '3', 'addresses', '1', '1', '1', '1', '1', '2017-12-25 11:32:06', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('59', '3', 'carts', '1', '1', '1', '1', '1', '2017-12-25 11:45:43', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('60', '3', 'goods', '1', '1', '1', '1', '1', '2017-12-25 14:21:28', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('61', '3', 'goods_comments', '1', '1', '1', '1', '1', '2017-12-25 14:21:28', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('62', '3', 'goods_collections', '1', '1', '1', '1', '1', '2017-12-25 14:21:28', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('63', '1', 'carts', '1', '1', '1', '1', '1', '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('64', '1', 'goods', '1', '1', '1', '1', '1', '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('65', '1', 'goods_comments', '1', '1', '1', '1', '1', '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('66', '1', 'goods_collections', '1', '1', '1', '1', '1', '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('67', '1', 'goods_cates', '1', '1', '1', '1', '1', '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('68', '2', 'admins', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('69', '2', 'article_types', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('70', '2', 'visit_logs', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('71', '2', 'advertisements', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('72', '2', 'friendly_links', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('73', '2', 'dds', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('74', '2', 'data_counts', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('75', '2', 'resources', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('76', '2', 'banners', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('77', '2', 'systems', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('78', '2', 'shops', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('79', '2', 'coupons', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('80', '2', 'orders', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('81', '2', 'addresses', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('82', '2', 'carts', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('83', '2', 'goods', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('84', '2', 'goods_comments', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('85', '2', 'goods_collections', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('86', '2', 'goods_cates', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('87', '3', 'goods_cates', '1', '1', '1', '1', '1', '2017-12-25 14:49:45', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('88', '1', 'querys', '1', '1', '1', '1', '1', '2017-12-25 15:24:19', '2017-12-25 15:24:19');
INSERT INTO `wancll_role_api_powers` VALUES ('89', '2', 'querys', '1', '1', '1', '1', '1', '2017-12-25 15:24:25', '2017-12-25 15:24:25');
INSERT INTO `wancll_role_api_powers` VALUES ('90', '3', 'querys', '1', '1', '1', '1', '1', '2017-12-25 15:24:32', '2017-12-25 15:24:32');
INSERT INTO `wancll_role_api_powers` VALUES ('91', '3', 'query', '1', '1', '1', '1', '1', '2017-12-25 15:44:11', '2017-12-25 16:14:08');
INSERT INTO `wancll_role_api_powers` VALUES ('92', '2', 'query', '1', '1', '1', '1', '1', '2017-12-25 15:44:17', '2018-01-10 19:36:05');
INSERT INTO `wancll_role_api_powers` VALUES ('93', '1', 'query', '1', '1', '1', '1', '1', '2017-12-25 15:44:25', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('94', '1', 'commissions', '1', '1', '1', '1', '1', '2017-12-27 17:51:46', '2017-12-27 17:51:46');
INSERT INTO `wancll_role_api_powers` VALUES ('95', '1', 'commission_levels', '1', '1', '1', '1', '1', '2017-12-27 17:53:11', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('96', '1', 'commission_systems', '1', '1', '1', '1', '1', '2017-12-27 17:54:11', '2017-12-28 09:31:15');
INSERT INTO `wancll_role_api_powers` VALUES ('97', '3', 'commission_levels', '1', '1', '1', '1', '1', '2018-01-05 09:32:48', '2018-01-05 10:01:18');
INSERT INTO `wancll_role_api_powers` VALUES ('98', '1', 'commission_applys', '1', '1', '1', '1', '1', '2018-01-11 11:55:06', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('99', '1', 'coupon_types', '1', '1', '1', '1', '1', '2018-01-11 11:55:46', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('100', '1', 'asstes_supervise', '1', '1', '1', '1', '1', '2018-01-15 14:03:31', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('101', '1', 'feedbacks', '1', '1', '1', '1', '1', '2018-02-09 10:47:49', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('102', '1', 'basics', '1', '1', '1', '1', '1', '2018-02-22 10:21:31', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('103', '1', 'guides', '1', '1', '1', '1', '1', '2018-02-22 11:52:38', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('104', '1', 'spec_models', '1', '1', '1', '1', '1', '2018-02-23 18:41:32', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('105', '1', 'specs', '1', '1', '1', '1', '1', '2018-02-23 18:41:32', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('106', '1', 'attr_models', '1', '1', '1', '1', '1', '2018-02-25 11:35:53', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('107', '1', 'attrs', '1', '1', '1', '1', '1', '2018-02-25 11:35:53', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('108', '1', 'transport_models', '1', '1', '1', '1', '1', '2018-02-28 08:49:41', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('109', '1', 'qiniu', '1', '1', '1', '1', '1', '2018-03-08 13:50:42', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('110', '1', 'databackup', '1', '1', '1', '1', '1', '2018-03-09 09:34:33', '2018-03-10 09:59:11');
INSERT INTO `wancll_role_api_powers` VALUES ('111', '1', 'email', '1', '1', '1', '1', '1', '2018-03-10 09:59:11', '2018-03-10 09:59:11');

-- -----------------------------
-- Table structure for `wancll_role_nav_powers`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_role_nav_powers`;
CREATE TABLE `wancll_role_nav_powers` (
  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `nav_ids` text NOT NULL COMMENT '菜单IDs',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_role_nav_powers`
-- -----------------------------
INSERT INTO `wancll_role_nav_powers` VALUES ('2', '[91,92,93,36,94,1,112,75,33,2,43,102,101,100,47,46,45,44,48,49,76,77,78,90,81,83,82,86,130,37,18,19,38,39,42,32,21,22,29,70,27,23,24,34,103,105,104]', '1', '2018-04-04 10:57:01', '2018-04-23 09:31:42');
INSERT INTO `wancll_role_nav_powers` VALUES ('3', '[91,92,93,36,94,1,2,112,75,113,129,128,33,114,115,116,119,118,117,43,44,45,100,101,102,46,47,48,49,76,77,90,78,121,122,127,125,124,81,83,82,131,86,130,141,140,132,134,133,137,136,138,139,135,142,22,29,70,27,23,24,34,103,105,143,126,104,37,18,19,38,39,42,32,21]', '1', '2018-04-04 10:57:34', '2018-06-28 11:53:00');
INSERT INTO `wancll_role_nav_powers` VALUES ('4', '[]', '1', '2018-04-05 17:57:18', '2018-04-05 17:57:18');

-- -----------------------------
-- Table structure for `wancll_roles`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_roles`;
CREATE TABLE `wancll_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `intro` varchar(255) DEFAULT NULL COMMENT '角色简介',
  `type` text NOT NULL COMMENT 'user用户类角色admin管理员角色',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_roles`
-- -----------------------------
INSERT INTO `wancll_roles` VALUES ('1', '会员', '会员通用角色', 'user', '1', '2018-04-04 10:55:37', '2018-04-04 10:55:37');
INSERT INTO `wancll_roles` VALUES ('2', '普通管理员', '普通管理员发', 'admin', '1', '2018-04-04 10:57:01', '2018-04-04 10:57:01');
INSERT INTO `wancll_roles` VALUES ('3', '超级管理员', '超级管理员', 'admin', '1', '2018-04-04 10:57:34', '2018-04-04 10:57:34');
INSERT INTO `wancll_roles` VALUES ('4', '运营管理员', '运营管理员的介绍', 'admin', '0', '2018-04-05 17:57:18', '2018-04-05 17:57:18');

-- -----------------------------
-- Table structure for `wancll_rules`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_rules`;
CREATE TABLE `wancll_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '规则分类',
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `wancll_score_goods`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_score_goods`;
CREATE TABLE `wancll_score_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `spec_group_id_str` varchar(255) DEFAULT '' COMMENT '规格ids',
  `score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '兑换积分数',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '兑换金钱数',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '1上架2下架',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_score_goods`
-- -----------------------------
INSERT INTO `wancll_score_goods` VALUES ('1', '1', '86246a21acff295e32d8644a114c67e7', '1.00', '0.00', '0', '1', '1', '2018-06-25 22:57:35', '2018-06-25 23:04:57');

-- -----------------------------
-- Table structure for `wancll_score_logs`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_score_logs`;
CREATE TABLE `wancll_score_logs` (
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_score_logs`
-- -----------------------------
INSERT INTO `wancll_score_logs` VALUES ('1', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-15 09:41:01', '1', '2018-06-15 09:41:01', '2018-06-15 09:41:01');
INSERT INTO `wancll_score_logs` VALUES ('2', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-15 10:16:47', '1', '2018-06-15 10:16:47', '2018-06-15 10:16:47');
INSERT INTO `wancll_score_logs` VALUES ('3', '5', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-15 10:24:10', '1', '2018-06-15 10:24:10', '2018-06-15 10:24:10');
INSERT INTO `wancll_score_logs` VALUES ('4', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-15 10:26:34', '1', '2018-06-15 10:26:34', '2018-06-15 10:26:34');
INSERT INTO `wancll_score_logs` VALUES ('5', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-15 10:26:35', '1', '2018-06-15 10:26:35', '2018-06-15 10:26:35');
INSERT INTO `wancll_score_logs` VALUES ('6', '7', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-15 10:34:40', '1', '2018-06-15 10:34:40', '2018-06-15 10:34:40');
INSERT INTO `wancll_score_logs` VALUES ('7', '7', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-15 11:15:35', '1', '2018-06-15 11:15:35', '2018-06-15 11:15:35');
INSERT INTO `wancll_score_logs` VALUES ('8', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-15 11:33:24', '1', '2018-06-15 11:33:24', '2018-06-15 11:33:24');
INSERT INTO `wancll_score_logs` VALUES ('9', '6', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-15 11:44:11', '1', '2018-06-15 11:44:11', '2018-06-15 11:44:11');
INSERT INTO `wancll_score_logs` VALUES ('10', '6', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-15 11:49:05', '1', '2018-06-15 11:49:05', '2018-06-15 11:49:05');
INSERT INTO `wancll_score_logs` VALUES ('11', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-15 11:52:45', '1', '2018-06-15 11:52:45', '2018-06-15 11:52:45');
INSERT INTO `wancll_score_logs` VALUES ('12', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-15 18:49:06', '1', '2018-06-15 18:49:06', '2018-06-15 18:49:06');
INSERT INTO `wancll_score_logs` VALUES ('13', '11', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-15 18:53:18', '1', '2018-06-15 18:53:18', '2018-06-15 18:53:18');
INSERT INTO `wancll_score_logs` VALUES ('14', '7', 'login', '1.00', '会员登录', '会员登录，登录时间2018-06-16 09:50:30', '1', '2018-06-16 09:50:30', '2018-06-16 09:50:30');

-- -----------------------------
-- Table structure for `wancll_spec_templates`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_spec_templates`;
CREATE TABLE `wancll_spec_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品规格模板名称',
  `intro` text COMMENT '商品规格模板简介',
  `content` text COMMENT '商品规格模板内容',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '商品规格模板排序',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_spec_templates`
-- -----------------------------
INSERT INTO `wancll_spec_templates` VALUES ('2', '规格测试2', 'readme', '[{\"name\":\"内存\",\"options\":[\"3G\",\"4G\",\"fadgdg\"]}]', '0', '1', '2018-06-20 22:55:06', '2018-06-20 22:55:48');
INSERT INTO `wancll_spec_templates` VALUES ('3', '规格测试', 'readmefds', '[{\"name\":\"内存\",\"options\":[\"gd32423423\",\"4G\",\"5G\"]},{\"name\":\"尺寸\",\"options\":[\"1.4寸\",\"1.5寸\",\"1.6寸\"]}]', '0', '1', '2018-06-20 22:56:21', '2018-06-20 22:56:21');
INSERT INTO `wancll_spec_templates` VALUES ('4', 'fda', 'dfasd', '[{\"name\":\"fadfa\",\"options\":[\"fdsaf\",\"fds\",\"fgsdfgsdgsdf\"]},{\"name\":\"dfsagg\",\"options\":[\"fasdf\",\"dfasf\",\"fdgh\"]}]', '0', '0', '2018-06-23 20:28:14', '2018-06-25 10:29:09');

-- -----------------------------
-- Table structure for `wancll_user_accounts`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_accounts`;
CREATE TABLE `wancll_user_accounts` (
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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_accounts`
-- -----------------------------
INSERT INTO `wancll_user_accounts` VALUES ('1', '18100000001', '7f4113f0a85c67f75e67242430026a02', '7f4113f0a85c67f75e67242430026a02', '', '', '1', '1', '2018-06-15 09:36:25', '2018-06-15 10:17:05');
INSERT INTO `wancll_user_accounts` VALUES ('2', '18390916324', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', 'ol1SowpNnKj0_heM0GFIv-eiJJcU', '2', '1', '2018-06-15 09:38:43', '2018-06-15 09:41:16');
INSERT INTO `wancll_user_accounts` VALUES ('3', '15200597371', 'b5305e8c4c5e08c246943fe736701525', '', '', '', '3', '1', '2018-06-15 09:41:19', '2018-06-15 09:41:19');
INSERT INTO `wancll_user_accounts` VALUES ('4', '18888888888', 'e6297b585db794e177808f8953b46669', '', '', '', '4', '1', '2018-06-15 09:42:45', '2018-06-15 09:42:45');
INSERT INTO `wancll_user_accounts` VALUES ('5', '18100000002', '7f4113f0a85c67f75e67242430026a02', '7f4113f0a85c67f75e67242430026a02', '', '', '5', '1', '2018-06-15 09:55:59', '2018-06-15 10:24:21');
INSERT INTO `wancll_user_accounts` VALUES ('6', '18100000003', '7f4113f0a85c67f75e67242430026a02', '7f4113f0a85c67f75e67242430026a02', '', '', '6', '1', '2018-06-15 09:56:31', '2018-06-15 11:44:20');
INSERT INTO `wancll_user_accounts` VALUES ('7', '15580841403', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', 'ol1SowqVrF2G8HKWP7-TAw_wPOsE', '7', '1', '2018-06-15 10:30:10', '2018-06-15 10:35:02');
INSERT INTO `wancll_user_accounts` VALUES ('8', '18111111111', '7f4113f0a85c67f75e67242430026a02', '', '', '', '8', '1', '2018-06-15 10:48:05', '2018-06-15 10:48:05');
INSERT INTO `wancll_user_accounts` VALUES ('9', '13973131356', 'e6297b585db794e177808f8953b46669', 'e6297b585db794e177808f8953b46669', '', '', '9', '1', '2018-06-15 14:01:23', '2018-06-15 18:38:15');
INSERT INTO `wancll_user_accounts` VALUES ('10', '18390911268', 'e6297b585db794e177808f8953b46669', '', '', 'ol1SowgRCWMtOwePHU58X-dbPFTs', '10', '1', '2018-06-15 18:23:07', '2018-06-23 10:05:06');
INSERT INTO `wancll_user_accounts` VALUES ('11', '15675143940', 'b5305e8c4c5e08c246943fe736701525', 'e6297b585db794e177808f8953b46669', '', 'ol1SowjRDUdmCnzuMh20Rg_Mqj6I', '11', '1', '2018-06-15 18:52:03', '2018-06-15 18:53:43');
INSERT INTO `wancll_user_accounts` VALUES ('12', '18888888887', '7f4113f0a85c67f75e67242430026a02', '', '', '', '12', '1', '2018-06-15 18:56:11', '2018-06-15 18:59:08');
INSERT INTO `wancll_user_accounts` VALUES ('13', '18390911267', 'e6297b585db794e177808f8953b46669', '', '', '', '13', '1', '2018-06-15 18:59:36', '2018-06-15 19:03:04');
INSERT INTO `wancll_user_accounts` VALUES ('14', '13973131354', 'e6297b585db794e177808f8953b46669', '', '', 'ol1SowiG0I5lNWFy1qWuLcLp_ZwU', '14', '1', '2018-06-15 19:03:52', '2018-06-15 19:03:52');
INSERT INTO `wancll_user_accounts` VALUES ('15', '18390926488', 'b5305e8c4c5e08c246943fe736701525', '', '', '', '15', '1', '2018-06-15 19:08:39', '2018-06-15 19:08:39');
INSERT INTO `wancll_user_accounts` VALUES ('16', '15802577957', 'b5305e8c4c5e08c246943fe736701525', '', '', '', '16', '1', '2018-06-16 11:53:22', '2018-06-16 11:53:22');
INSERT INTO `wancll_user_accounts` VALUES ('17', '15874013247', 'b5305e8c4c5e08c246943fe736701525', '', '', '', '17', '1', '2018-06-19 11:50:19', '2018-06-19 11:50:19');
INSERT INTO `wancll_user_accounts` VALUES ('18', '18175974828', '04517952767d2452f5f2071938af61f7', '', '', '', '18', '1', '2018-06-19 14:08:37', '2018-06-19 14:08:37');
INSERT INTO `wancll_user_accounts` VALUES ('19', '13117512114', 'b5305e8c4c5e08c246943fe736701525', '', '', '', '19', '1', '2018-06-19 14:27:02', '2018-06-19 14:27:02');
INSERT INTO `wancll_user_accounts` VALUES ('20', '15111063940', 'b5305e8c4c5e08c246943fe736701525', '', '', 'ol1SowqIR7ZSRRczPDJrKxST0rrM', '20', '1', '2018-06-20 11:22:33', '2018-06-20 11:22:33');
INSERT INTO `wancll_user_accounts` VALUES ('21', '17608491855', 'b5305e8c4c5e08c246943fe736701525', '', '', 'ol1Sowj7f6xf-jgnT01EoHpcij3k', '21', '1', '2018-06-20 14:14:33', '2018-06-23 11:12:49');
INSERT INTO `wancll_user_accounts` VALUES ('22', '15666666666', 'e6297b585db794e177808f8953b46669', '', '', '', '22', '1', '2018-06-23 11:14:23', '2018-06-23 11:14:23');
INSERT INTO `wancll_user_accounts` VALUES ('23', '15444444444', 'e6297b585db794e177808f8953b46669', 'e6297b585db794e177808f8953b46669', '', '', '23', '1', '2018-06-23 11:17:10', '2018-06-23 11:17:31');
INSERT INTO `wancll_user_accounts` VALUES ('24', '18888888886', 'e6297b585db794e177808f8953b46669', 'e6297b585db794e177808f8953b46669', '', '', '24', '1', '2018-06-23 11:18:04', '2018-06-23 11:33:51');

-- -----------------------------
-- Table structure for `wancll_user_apply_bonus`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_apply_bonus`;
CREATE TABLE `wancll_user_apply_bonus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `parent_bonus_mobile` varchar(20) DEFAULT NULL COMMENT '父分销商手机号',
  `apply_reason` text COMMENT '申请理由',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `is_deal` tinyint(1) DEFAULT '0' COMMENT '是否处理：0未处理1已处理',
  `deal_time` datetime DEFAULT NULL COMMENT '处理时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1待审核2审核未通过3审核通过',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `wancll_user_apply_distributor`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_apply_distributor`;
CREATE TABLE `wancll_user_apply_distributor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `parent_distributor_mobile` varchar(20) DEFAULT NULL COMMENT '父分销商手机号',
  `apply_reason` text COMMENT '申请理由',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `is_deal` tinyint(1) DEFAULT '0' COMMENT '是否处理：0未处理1已处理',
  `deal_time` datetime DEFAULT NULL COMMENT '处理时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1待审核2审核未通过3审核通过',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `wancll_user_asset_logs`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_asset_logs`;
CREATE TABLE `wancll_user_asset_logs` (
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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_asset_logs`
-- -----------------------------
INSERT INTO `wancll_user_asset_logs` VALUES ('1', '2', 'money', 'user_money_recharge', '10000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-06-15 09:40:05', '2018-06-15 09:40:05');
INSERT INTO `wancll_user_asset_logs` VALUES ('2', '2', 'money', 'user_pay', '136.00', '购物支付【N2018061509410150313】', '会员购物扣款，订单号：N2018061509410150313', '1', '2018-06-15 09:41:23', '2018-06-15 09:41:23');
INSERT INTO `wancll_user_asset_logs` VALUES ('3', '1', 'money', 'user_money_recharge', '10000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-06-15 10:05:27', '2018-06-15 10:05:27');
INSERT INTO `wancll_user_asset_logs` VALUES ('4', '5', 'money', 'user_money_recharge', '10000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-06-15 10:05:36', '2018-06-15 10:05:36');
INSERT INTO `wancll_user_asset_logs` VALUES ('5', '6', 'money', 'user_money_recharge', '10000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-06-15 10:05:43', '2018-06-15 10:05:43');
INSERT INTO `wancll_user_asset_logs` VALUES ('6', '1', 'money', 'user_pay', '100.00', '购物支付【N2018061510164730358】', '会员购物扣款，订单号：N2018061510164730358', '1', '2018-06-15 10:17:11', '2018-06-15 10:17:11');
INSERT INTO `wancll_user_asset_logs` VALUES ('7', '5', 'money', 'user_pay', '100.00', '购物支付【N2018061510241052987】', '会员购物扣款，订单号：N2018061510241052987', '1', '2018-06-15 10:24:24', '2018-06-15 10:24:24');
INSERT INTO `wancll_user_asset_logs` VALUES ('8', '7', 'money', 'user_money_recharge', '10000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-06-15 10:33:06', '2018-06-15 10:33:06');
INSERT INTO `wancll_user_asset_logs` VALUES ('9', '7', 'money', 'user_pay', '126.00', '购物支付【N2018061510344003163】', '会员购物扣款，订单号：N2018061510344003163', '1', '2018-06-15 10:35:08', '2018-06-15 10:35:08');
INSERT INTO `wancll_user_asset_logs` VALUES ('10', '7', 'money', 'user_pay', '599.00', '购物支付【N2018061511153518320】', '会员购物扣款，订单号：N2018061511153518320', '1', '2018-06-15 11:22:44', '2018-06-15 11:22:44');
INSERT INTO `wancll_user_asset_logs` VALUES ('11', '1', 'money', 'user_pay', '110.00', '购物支付【N2018061511332423712】', '会员购物扣款，订单号：N2018061511332423712', '1', '2018-06-15 11:33:34', '2018-06-15 11:33:34');
INSERT INTO `wancll_user_asset_logs` VALUES ('12', '6', 'money', 'user_pay', '110.00', '购物支付【N2018061511441190450】', '会员购物扣款，订单号：N2018061511441190450', '1', '2018-06-15 11:44:23', '2018-06-15 11:44:23');
INSERT INTO `wancll_user_asset_logs` VALUES ('13', '6', 'money', 'user_pay', '100.00', '购物支付【N2018061511490566101】', '会员购物扣款，订单号：N2018061511490566101', '1', '2018-06-15 11:49:12', '2018-06-15 11:49:12');
INSERT INTO `wancll_user_asset_logs` VALUES ('14', '1', 'money', 'user_pay', '110.00', '购物支付【N2018061511524556531】', '会员购物扣款，订单号：N2018061511524556531', '1', '2018-06-15 11:52:50', '2018-06-15 11:52:50');
INSERT INTO `wancll_user_asset_logs` VALUES ('15', '2', 'money', 'user_pay', '126.00', '购物支付【N2018061518490641888】', '会员购物扣款，订单号：N2018061518490641888', '1', '2018-06-15 18:49:15', '2018-06-15 18:49:15');
INSERT INTO `wancll_user_asset_logs` VALUES ('16', '7', 'money', 'user_pay', '259.00', '购物支付【N2018061609503092867】', '会员购物扣款，订单号：N2018061609503092867', '1', '2018-06-16 09:50:40', '2018-06-16 09:50:40');
INSERT INTO `wancll_user_asset_logs` VALUES ('17', '7', 'money', 'user_drawcash', '10.00', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-06-22 09:53:28', '2018-06-22 09:53:28');
INSERT INTO `wancll_user_asset_logs` VALUES ('18', '7', 'money', 'user_drawcash', '5.00', '申请提现扣款【D2018062210250738383】', '会员申请提现，系统自动扣款，提现申请单号【D2018062210250738383】', '1', '2018-06-22 10:25:07', '2018-06-22 10:25:07');
INSERT INTO `wancll_user_asset_logs` VALUES ('19', '7', 'money', 'user_drawcash', '5.00', '申请提现扣款【D2018062214304425440】', '会员申请提现，系统自动扣款，提现申请单号【D2018062214304425440】', '1', '2018-06-22 14:30:44', '2018-06-22 14:30:44');
INSERT INTO `wancll_user_asset_logs` VALUES ('20', '7', 'money', 'user_drawcash', '1.00', '申请提现扣款【D2018062214310729177】', '会员申请提现，系统自动扣款，提现申请单号【D2018062214310729177】', '1', '2018-06-22 14:31:07', '2018-06-22 14:31:07');
INSERT INTO `wancll_user_asset_logs` VALUES ('21', '24', 'money', 'user_money_recharge', '122.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-06-27 22:44:32', '2018-06-27 22:44:32');

-- -----------------------------
-- Table structure for `wancll_user_assets`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_assets`;
CREATE TABLE `wancll_user_assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `score` decimal(10,2) DEFAULT '0.00' COMMENT '积分',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_assets`
-- -----------------------------
INSERT INTO `wancll_user_assets` VALUES ('1', '1', '9680.00', '5.00', '1', '2018-06-15 09:36:25', '2018-06-15 09:36:25');
INSERT INTO `wancll_user_assets` VALUES ('2', '2', '9738.00', '2.00', '1', '2018-06-15 09:38:43', '2018-06-15 09:38:43');
INSERT INTO `wancll_user_assets` VALUES ('3', '3', '0.00', '0.00', '1', '2018-06-15 09:41:19', '2018-06-15 09:41:19');
INSERT INTO `wancll_user_assets` VALUES ('4', '4', '0.00', '0.00', '1', '2018-06-15 09:42:45', '2018-06-15 09:42:45');
INSERT INTO `wancll_user_assets` VALUES ('5', '5', '9900.00', '1.00', '1', '2018-06-15 09:55:59', '2018-06-15 09:55:59');
INSERT INTO `wancll_user_assets` VALUES ('6', '6', '9790.00', '2.00', '1', '2018-06-15 09:56:31', '2018-06-15 09:56:31');
INSERT INTO `wancll_user_assets` VALUES ('7', '7', '8995.00', '3.00', '1', '2018-06-15 10:30:10', '2018-06-15 10:30:10');
INSERT INTO `wancll_user_assets` VALUES ('8', '8', '0.00', '0.00', '1', '2018-06-15 10:48:05', '2018-06-15 10:48:05');
INSERT INTO `wancll_user_assets` VALUES ('9', '9', '0.00', '0.00', '1', '2018-06-15 14:01:23', '2018-06-15 14:01:23');
INSERT INTO `wancll_user_assets` VALUES ('10', '10', '0.00', '0.00', '1', '2018-06-15 18:23:07', '2018-06-15 18:23:07');
INSERT INTO `wancll_user_assets` VALUES ('11', '11', '0.00', '1.00', '1', '2018-06-15 18:52:03', '2018-06-15 18:52:03');
INSERT INTO `wancll_user_assets` VALUES ('12', '12', '0.00', '0.00', '1', '2018-06-15 18:56:11', '2018-06-15 18:56:11');
INSERT INTO `wancll_user_assets` VALUES ('13', '13', '0.00', '0.00', '1', '2018-06-15 18:59:36', '2018-06-15 18:59:36');
INSERT INTO `wancll_user_assets` VALUES ('14', '14', '0.00', '0.00', '1', '2018-06-15 19:03:52', '2018-06-15 19:03:52');
INSERT INTO `wancll_user_assets` VALUES ('15', '15', '0.00', '0.00', '1', '2018-06-15 19:08:39', '2018-06-15 19:08:39');
INSERT INTO `wancll_user_assets` VALUES ('16', '16', '0.00', '0.00', '1', '2018-06-16 11:53:22', '2018-06-16 11:53:22');
INSERT INTO `wancll_user_assets` VALUES ('17', '17', '0.00', '0.00', '1', '2018-06-19 11:50:19', '2018-06-19 11:50:19');
INSERT INTO `wancll_user_assets` VALUES ('18', '18', '0.00', '0.00', '1', '2018-06-19 14:08:37', '2018-06-19 14:08:37');
INSERT INTO `wancll_user_assets` VALUES ('19', '19', '0.00', '0.00', '1', '2018-06-19 14:27:02', '2018-06-19 14:27:02');
INSERT INTO `wancll_user_assets` VALUES ('20', '20', '0.00', '0.00', '1', '2018-06-20 11:22:33', '2018-06-20 11:22:33');
INSERT INTO `wancll_user_assets` VALUES ('21', '21', '0.00', '0.00', '1', '2018-06-20 14:14:33', '2018-06-20 14:14:33');
INSERT INTO `wancll_user_assets` VALUES ('22', '22', '0.00', '0.00', '1', '2018-06-23 11:14:22', '2018-06-23 11:14:22');
INSERT INTO `wancll_user_assets` VALUES ('23', '23', '0.00', '0.00', '1', '2018-06-23 11:17:10', '2018-06-23 11:17:10');
INSERT INTO `wancll_user_assets` VALUES ('24', '24', '122.00', '0.00', '1', '2018-06-23 11:18:04', '2018-06-23 11:18:04');

-- -----------------------------
-- Table structure for `wancll_user_auths`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_auths`;
CREATE TABLE `wancll_user_auths` (
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_auths`
-- -----------------------------
INSERT INTO `wancll_user_auths` VALUES ('1', '24', 'fdsf', '430725199512313016', '/public/upload/user_avatar_images/20180627\\0b43818cb7cebb232070746c0268052f.png', '/public/upload/images/1530104531276.jpg', '[]', '3', '1', '2018-06-27 21:02:11', '2018-06-27 21:02:11');

-- -----------------------------
-- Table structure for `wancll_user_bonus_logs`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_bonus_logs`;
CREATE TABLE `wancll_user_bonus_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `order_goods_id` bigint(20) NOT NULL COMMENT '订单商品ID',
  `bonus_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分红类别：1代理分红2区域分红3全球分红',
  `current_bonus_level_name` varchar(255) DEFAULT '' COMMENT '等级分红时会员当时的等级名称',
  `region_type` varchar(20) DEFAULT NULL COMMENT '区域分红时的类别：province||city||area',
  `expect_money` decimal(10,2) DEFAULT NULL COMMENT '预计分红金：下单时计算的分红金额',
  `real_bonus_money` decimal(10,2) DEFAULT NULL COMMENT '分红总金额',
  `real_bonus_rate` decimal(10,2) DEFAULT NULL COMMENT '分红比例（订单创建时写入）',
  `real_money` decimal(10,2) DEFAULT NULL COMMENT '真实分红金：订单完成后的分红金',
  `already_drawcash_money` decimal(10,2) DEFAULT '0.00' COMMENT '已提现金额',
  `source_user_id` bigint(20) NOT NULL COMMENT '来源会员ID',
  `order_status` tinyint(1) DEFAULT '1' COMMENT '订单状态：1待付款2已付款3已完成',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：0未申请提现1申请提现中2申请未通过3审核通过',
  `bonus_apply_id` bigint(20) DEFAULT NULL COMMENT '申请提现的ID',
  `apply_no` varchar(255) DEFAULT NULL COMMENT '申请提现的单号',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_bonus_logs`
-- -----------------------------
INSERT INTO `wancll_user_bonus_logs` VALUES ('1', '2', '1', '33', '1', '1', '会员分红商', '', '4.08', '', '3.00', '', '0.00', '2', '1', '0', '', '', '1', '2018-06-15 09:41:01', '2018-06-15 09:41:01');
INSERT INTO `wancll_user_bonus_logs` VALUES ('2', '1', '2', '34', '2', '1', '会员分红商', '', '3.00', '100.00', '3.00', '3.00', '0.00', '1', '3', '1', '2', 'B2018061918413706614', '1', '2018-06-15 10:16:47', '2018-06-19 18:41:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('3', '5', '3', '34', '3', '1', '会员分红商', '', '3.00', '100.00', '3.00', '3.00', '0.00', '5', '3', '0', '', '', '1', '2018-06-15 10:24:10', '2018-06-15 11:10:16');
INSERT INTO `wancll_user_bonus_logs` VALUES ('4', '1', '4', '34', '4', '1', '会员分红商', '', '3.30', '', '3.00', '', '0.00', '1', '1', '0', '', '', '1', '2018-06-15 10:26:34', '2018-06-15 10:26:34');
INSERT INTO `wancll_user_bonus_logs` VALUES ('5', '1', '5', '34', '5', '1', '会员分红商', '', '3.30', '', '3.00', '', '0.00', '1', '1', '0', '', '', '1', '2018-06-15 10:26:35', '2018-06-15 10:26:35');
INSERT INTO `wancll_user_bonus_logs` VALUES ('6', '7', '6', '32', '6', '1', '会员分红商', '', '3.78', '126.00', '3.00', '3.78', '0.00', '7', '3', '1', '1', 'B2018061511565034677', '1', '2018-06-15 10:34:40', '2018-06-15 11:56:50');
INSERT INTO `wancll_user_bonus_logs` VALUES ('7', '7', '7', '22', '7', '1', '会员分红商', '', '17.97', '599.00', '3.00', '17.97', '0.00', '7', '3', '1', '1', 'B2018061511565034677', '1', '2018-06-15 11:15:35', '2018-06-15 11:56:50');
INSERT INTO `wancll_user_bonus_logs` VALUES ('8', '1', '8', '34', '8', '1', '主管分红商', '', '5.50', '110.00', '5.00', '5.50', '0.00', '1', '3', '1', '2', 'B2018061918413706614', '1', '2018-06-15 11:33:24', '2018-06-19 18:41:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('9', '7', '8', '34', '8', '2', '', 'area', '11.00', '110.00', '10.00', '11.00', '0.00', '1', '3', '1', '1', 'B2018061511565034677', '1', '2018-06-15 11:33:24', '2018-06-15 11:56:50');
INSERT INTO `wancll_user_bonus_logs` VALUES ('10', '6', '9', '34', '9', '1', '会员分红商', '', '3.30', '110.00', '3.00', '3.30', '0.00', '6', '3', '0', '', '', '1', '2018-06-15 11:44:11', '2018-06-15 11:51:51');
INSERT INTO `wancll_user_bonus_logs` VALUES ('11', '5', '9', '34', '9', '1', '主管分红商', '', '2.20', '110.00', '2.00', '2.20', '0.00', '6', '3', '0', '', '', '1', '2018-06-15 11:44:11', '2018-06-15 11:51:51');
INSERT INTO `wancll_user_bonus_logs` VALUES ('12', '7', '9', '34', '9', '2', '', 'area', '11.00', '110.00', '10.00', '11.00', '0.00', '6', '3', '1', '1', 'B2018061511565034677', '1', '2018-06-15 11:44:11', '2018-06-15 11:56:50');
INSERT INTO `wancll_user_bonus_logs` VALUES ('13', '6', '10', '34', '10', '1', '会员分红商', '', '3.00', '100.00', '3.00', '3.00', '0.00', '6', '3', '0', '', '', '1', '2018-06-15 11:49:05', '2018-06-15 11:50:16');
INSERT INTO `wancll_user_bonus_logs` VALUES ('14', '5', '10', '34', '10', '1', '主管分红商', '', '2.00', '100.00', '2.00', '2.00', '0.00', '6', '3', '0', '', '', '1', '2018-06-15 11:49:05', '2018-06-15 11:50:16');
INSERT INTO `wancll_user_bonus_logs` VALUES ('15', '7', '10', '34', '10', '2', '', 'area', '10.00', '100.00', '10.00', '10.00', '0.00', '6', '3', '1', '1', 'B2018061511565034677', '1', '2018-06-15 11:49:05', '2018-06-15 11:56:50');
INSERT INTO `wancll_user_bonus_logs` VALUES ('16', '1', '11', '34', '11', '1', '主管分红商', '', '5.50', '', '5.00', '', '0.00', '1', '1', '0', '', '', '1', '2018-06-15 11:52:45', '2018-06-15 11:52:45');
INSERT INTO `wancll_user_bonus_logs` VALUES ('17', '7', '11', '34', '11', '2', '', 'area', '11.00', '', '10.00', '', '0.00', '1', '1', '0', '', '', '1', '2018-06-15 11:52:45', '2018-06-15 11:52:45');
INSERT INTO `wancll_user_bonus_logs` VALUES ('18', '2', '12', '33', '12', '1', '会员分红商', '', '3.78', '', '3.00', '', '0.00', '2', '1', '0', '', '', '1', '2018-06-15 18:49:06', '2018-06-15 18:49:06');
INSERT INTO `wancll_user_bonus_logs` VALUES ('19', '11', '13', '34', '13', '1', '会员分红商', '', '3.60', '', '3.00', '', '0.00', '11', '1', '0', '', '', '1', '2018-06-15 18:53:18', '2018-06-15 18:53:18');
INSERT INTO `wancll_user_bonus_logs` VALUES ('20', '7', '14', '36', '14', '1', '董事分红商', '', '46.62', '259.00', '18.00', '46.62', '0.00', '7', '3', '0', '', '', '1', '2018-06-16 09:50:30', '2018-06-16 09:51:49');

-- -----------------------------
-- Table structure for `wancll_user_commission_logs`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_commission_logs`;
CREATE TABLE `wancll_user_commission_logs` (
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
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_commission_logs`
-- -----------------------------
INSERT INTO `wancll_user_commission_logs` VALUES ('1', '2', '1', '33', '1', '1', '14.96', '', '11.00', '', '0.00', '2', '2', '0', '', '', '1', '2018-06-15 09:41:01', '2018-06-15 09:41:23');
INSERT INTO `wancll_user_commission_logs` VALUES ('2', '1', '2', '34', '2', '1', '11.00', '100.00', '11.00', '11.00', '0.00', '1', '3', '1', '1', 'F2018061511114664644', '1', '2018-06-15 10:16:47', '2018-06-15 11:11:46');
INSERT INTO `wancll_user_commission_logs` VALUES ('3', '5', '3', '34', '3', '1', '11.00', '100.00', '11.00', '11.00', '0.00', '5', '3', '0', '', '', '1', '2018-06-15 10:24:10', '2018-06-15 11:10:16');
INSERT INTO `wancll_user_commission_logs` VALUES ('4', '1', '4', '34', '4', '1', '12.10', '', '11.00', '', '0.00', '1', '1', '0', '', '', '1', '2018-06-15 10:26:34', '2018-06-15 10:26:34');
INSERT INTO `wancll_user_commission_logs` VALUES ('5', '1', '5', '34', '5', '1', '12.10', '', '11.00', '', '0.00', '1', '1', '0', '', '', '1', '2018-06-15 10:26:35', '2018-06-15 10:26:35');
INSERT INTO `wancll_user_commission_logs` VALUES ('6', '7', '6', '32', '6', '1', '13.86', '126.00', '11.00', '13.86', '0.00', '7', '3', '1', '2', 'F2018061511232607809', '1', '2018-06-15 10:34:40', '2018-06-15 11:23:26');
INSERT INTO `wancll_user_commission_logs` VALUES ('7', '7', '7', '22', '7', '1', '65.89', '599.00', '11.00', '65.89', '0.00', '7', '3', '1', '3', 'F2018061511580379371', '1', '2018-06-15 11:15:35', '2018-06-15 11:58:03');
INSERT INTO `wancll_user_commission_logs` VALUES ('8', '1', '8', '34', '8', '1', '12.10', '110.00', '11.00', '12.10', '0.00', '1', '3', '0', '', '', '1', '2018-06-15 11:33:24', '2018-06-15 11:52:09');
INSERT INTO `wancll_user_commission_logs` VALUES ('9', '6', '9', '34', '9', '1', '12.10', '110.00', '11.00', '12.10', '0.00', '6', '3', '0', '', '', '1', '2018-06-15 11:44:11', '2018-06-15 11:51:51');
INSERT INTO `wancll_user_commission_logs` VALUES ('10', '5', '9', '34', '9', '2', '9.90', '110.00', '9.00', '9.90', '0.00', '6', '3', '0', '', '', '1', '2018-06-15 11:44:11', '2018-06-15 11:51:51');
INSERT INTO `wancll_user_commission_logs` VALUES ('11', '1', '9', '34', '9', '3', '7.70', '110.00', '7.00', '7.70', '0.00', '6', '3', '0', '', '', '1', '2018-06-15 11:44:11', '2018-06-15 11:51:51');
INSERT INTO `wancll_user_commission_logs` VALUES ('12', '6', '10', '34', '10', '1', '11.00', '100.00', '11.00', '11.00', '0.00', '6', '3', '0', '', '', '1', '2018-06-15 11:49:05', '2018-06-15 11:50:16');
INSERT INTO `wancll_user_commission_logs` VALUES ('13', '5', '10', '34', '10', '2', '9.00', '100.00', '9.00', '9.00', '0.00', '6', '3', '0', '', '', '1', '2018-06-15 11:49:05', '2018-06-15 11:50:16');
INSERT INTO `wancll_user_commission_logs` VALUES ('14', '1', '10', '34', '10', '3', '7.00', '100.00', '7.00', '7.00', '0.00', '6', '3', '0', '', '', '1', '2018-06-15 11:49:05', '2018-06-15 11:50:16');
INSERT INTO `wancll_user_commission_logs` VALUES ('15', '1', '11', '34', '11', '1', '12.10', '', '11.00', '', '0.00', '1', '2', '0', '', '', '1', '2018-06-15 11:52:45', '2018-06-15 11:52:50');
INSERT INTO `wancll_user_commission_logs` VALUES ('16', '2', '12', '33', '12', '1', '13.86', '', '11.00', '', '0.00', '2', '2', '0', '', '', '1', '2018-06-15 18:49:06', '2018-06-15 18:49:15');
INSERT INTO `wancll_user_commission_logs` VALUES ('17', '11', '13', '34', '13', '1', '13.20', '', '11.00', '', '0.00', '11', '1', '0', '', '', '1', '2018-06-15 18:53:18', '2018-06-15 18:53:18');
INSERT INTO `wancll_user_commission_logs` VALUES ('18', '7', '14', '36', '14', '1', '38.85', '259.00', '15.00', '38.85', '0.00', '7', '3', '0', '', '', '1', '2018-06-16 09:50:30', '2018-06-16 09:51:49');
INSERT INTO `wancll_user_commission_logs` VALUES ('19', '4', '15', '36', '15', '1', '28.49', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:54', '2018-06-19 13:50:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('20', '4', '15', '36', '15', '2', '20.72', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:54', '2018-06-19 13:50:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('21', '4', '15', '36', '15', '3', '12.95', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:54', '2018-06-19 13:50:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('22', '4', '16', '36', '16', '1', '28.49', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:56', '2018-06-19 13:50:56');
INSERT INTO `wancll_user_commission_logs` VALUES ('23', '4', '16', '36', '16', '2', '20.72', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:56', '2018-06-19 13:50:56');
INSERT INTO `wancll_user_commission_logs` VALUES ('24', '4', '16', '36', '16', '3', '12.95', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:56', '2018-06-19 13:50:56');
INSERT INTO `wancll_user_commission_logs` VALUES ('25', '4', '17', '36', '17', '1', '28.49', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:57', '2018-06-19 13:50:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('26', '4', '17', '36', '17', '2', '20.72', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:57', '2018-06-19 13:50:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('27', '4', '17', '36', '17', '3', '12.95', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:57', '2018-06-19 13:50:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('28', '4', '18', '36', '18', '1', '28.49', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('29', '4', '18', '36', '18', '2', '20.72', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('30', '4', '18', '36', '18', '3', '12.95', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('31', '4', '19', '36', '19', '1', '28.49', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('32', '4', '19', '36', '19', '2', '20.72', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('33', '4', '19', '36', '19', '3', '12.95', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('34', '4', '20', '36', '20', '1', '28.49', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('35', '4', '20', '36', '20', '2', '20.72', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('36', '4', '20', '36', '20', '3', '12.95', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:50:58', '2018-06-19 13:50:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('37', '4', '21', '36', '21', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:51:54', '2018-06-19 13:51:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('38', '4', '21', '36', '21', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:51:54', '2018-06-19 13:51:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('39', '4', '21', '36', '21', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:51:54', '2018-06-19 13:51:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('40', '4', '22', '36', '22', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:51:57', '2018-06-19 13:51:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('41', '4', '22', '36', '22', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:51:57', '2018-06-19 13:51:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('42', '4', '22', '36', '22', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:51:57', '2018-06-19 13:51:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('43', '4', '23', '36', '23', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:51:58', '2018-06-19 13:51:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('44', '4', '23', '36', '23', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:51:58', '2018-06-19 13:51:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('45', '4', '23', '36', '23', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:51:58', '2018-06-19 13:51:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('46', '4', '24', '36', '24', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:51:58', '2018-06-19 13:51:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('47', '4', '24', '36', '24', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:51:58', '2018-06-19 13:51:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('48', '4', '24', '36', '24', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:51:58', '2018-06-19 13:51:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('49', '4', '25', '36', '25', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:09', '2018-06-19 13:52:09');
INSERT INTO `wancll_user_commission_logs` VALUES ('50', '4', '25', '36', '25', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:09', '2018-06-19 13:52:09');
INSERT INTO `wancll_user_commission_logs` VALUES ('51', '4', '25', '36', '25', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:09', '2018-06-19 13:52:09');
INSERT INTO `wancll_user_commission_logs` VALUES ('52', '4', '26', '36', '26', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:13', '2018-06-19 13:52:13');
INSERT INTO `wancll_user_commission_logs` VALUES ('53', '4', '26', '36', '26', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:13', '2018-06-19 13:52:13');
INSERT INTO `wancll_user_commission_logs` VALUES ('54', '4', '26', '36', '26', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:13', '2018-06-19 13:52:13');
INSERT INTO `wancll_user_commission_logs` VALUES ('55', '4', '27', '36', '27', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:17', '2018-06-19 13:52:17');
INSERT INTO `wancll_user_commission_logs` VALUES ('56', '4', '27', '36', '27', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:17', '2018-06-19 13:52:17');
INSERT INTO `wancll_user_commission_logs` VALUES ('57', '4', '27', '36', '27', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:17', '2018-06-19 13:52:17');
INSERT INTO `wancll_user_commission_logs` VALUES ('58', '4', '28', '36', '28', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:17', '2018-06-19 13:52:17');
INSERT INTO `wancll_user_commission_logs` VALUES ('59', '4', '28', '36', '28', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:17', '2018-06-19 13:52:17');
INSERT INTO `wancll_user_commission_logs` VALUES ('60', '4', '28', '36', '28', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:17', '2018-06-19 13:52:17');
INSERT INTO `wancll_user_commission_logs` VALUES ('61', '4', '29', '36', '29', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:54', '2018-06-19 13:52:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('62', '4', '29', '36', '29', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:54', '2018-06-19 13:52:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('63', '4', '29', '36', '29', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:54', '2018-06-19 13:52:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('64', '4', '30', '36', '30', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:55', '2018-06-19 13:52:55');
INSERT INTO `wancll_user_commission_logs` VALUES ('65', '4', '30', '36', '30', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:55', '2018-06-19 13:52:55');
INSERT INTO `wancll_user_commission_logs` VALUES ('66', '4', '30', '36', '30', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:52:55', '2018-06-19 13:52:55');
INSERT INTO `wancll_user_commission_logs` VALUES ('67', '4', '31', '36', '31', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:07', '2018-06-19 13:53:07');
INSERT INTO `wancll_user_commission_logs` VALUES ('68', '4', '31', '36', '31', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:07', '2018-06-19 13:53:07');
INSERT INTO `wancll_user_commission_logs` VALUES ('69', '4', '31', '36', '31', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:07', '2018-06-19 13:53:07');
INSERT INTO `wancll_user_commission_logs` VALUES ('70', '4', '32', '36', '32', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:08', '2018-06-19 13:53:08');
INSERT INTO `wancll_user_commission_logs` VALUES ('71', '4', '32', '36', '32', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:08', '2018-06-19 13:53:08');
INSERT INTO `wancll_user_commission_logs` VALUES ('72', '4', '32', '36', '32', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:08', '2018-06-19 13:53:08');
INSERT INTO `wancll_user_commission_logs` VALUES ('73', '4', '33', '36', '33', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:08', '2018-06-19 13:53:08');
INSERT INTO `wancll_user_commission_logs` VALUES ('74', '4', '33', '36', '33', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:08', '2018-06-19 13:53:08');
INSERT INTO `wancll_user_commission_logs` VALUES ('75', '4', '33', '36', '33', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:08', '2018-06-19 13:53:08');
INSERT INTO `wancll_user_commission_logs` VALUES ('76', '4', '34', '36', '34', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:20', '2018-06-19 13:53:20');
INSERT INTO `wancll_user_commission_logs` VALUES ('77', '4', '34', '36', '34', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:20', '2018-06-19 13:53:20');
INSERT INTO `wancll_user_commission_logs` VALUES ('78', '4', '34', '36', '34', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:20', '2018-06-19 13:53:20');
INSERT INTO `wancll_user_commission_logs` VALUES ('79', '4', '35', '36', '35', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:23', '2018-06-19 13:53:23');
INSERT INTO `wancll_user_commission_logs` VALUES ('80', '4', '35', '36', '35', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:23', '2018-06-19 13:53:23');
INSERT INTO `wancll_user_commission_logs` VALUES ('81', '4', '35', '36', '35', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:23', '2018-06-19 13:53:23');
INSERT INTO `wancll_user_commission_logs` VALUES ('82', '4', '36', '36', '36', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:27', '2018-06-19 13:53:27');
INSERT INTO `wancll_user_commission_logs` VALUES ('83', '4', '36', '36', '36', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:27', '2018-06-19 13:53:27');
INSERT INTO `wancll_user_commission_logs` VALUES ('84', '4', '36', '36', '36', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:27', '2018-06-19 13:53:27');
INSERT INTO `wancll_user_commission_logs` VALUES ('85', '4', '37', '36', '37', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:54', '2018-06-19 13:53:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('86', '4', '37', '36', '37', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:54', '2018-06-19 13:53:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('87', '4', '37', '36', '37', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:54', '2018-06-19 13:53:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('88', '4', '38', '36', '38', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:54', '2018-06-19 13:53:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('89', '4', '38', '36', '38', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:54', '2018-06-19 13:53:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('90', '4', '38', '36', '38', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:53:54', '2018-06-19 13:53:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('91', '4', '39', '36', '39', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:05', '2018-06-19 13:54:05');
INSERT INTO `wancll_user_commission_logs` VALUES ('92', '4', '39', '36', '39', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:05', '2018-06-19 13:54:05');
INSERT INTO `wancll_user_commission_logs` VALUES ('93', '4', '39', '36', '39', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:05', '2018-06-19 13:54:05');
INSERT INTO `wancll_user_commission_logs` VALUES ('94', '4', '40', '36', '40', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:18', '2018-06-19 13:54:18');
INSERT INTO `wancll_user_commission_logs` VALUES ('95', '4', '40', '36', '40', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:18', '2018-06-19 13:54:18');
INSERT INTO `wancll_user_commission_logs` VALUES ('96', '4', '40', '36', '40', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:18', '2018-06-19 13:54:18');
INSERT INTO `wancll_user_commission_logs` VALUES ('97', '4', '41', '36', '41', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:18', '2018-06-19 13:54:18');
INSERT INTO `wancll_user_commission_logs` VALUES ('98', '4', '41', '36', '41', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:18', '2018-06-19 13:54:18');
INSERT INTO `wancll_user_commission_logs` VALUES ('99', '4', '41', '36', '41', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:18', '2018-06-19 13:54:18');
INSERT INTO `wancll_user_commission_logs` VALUES ('100', '4', '42', '36', '42', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:22', '2018-06-19 13:54:22');
INSERT INTO `wancll_user_commission_logs` VALUES ('101', '4', '42', '36', '42', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:22', '2018-06-19 13:54:22');
INSERT INTO `wancll_user_commission_logs` VALUES ('102', '4', '42', '36', '42', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:22', '2018-06-19 13:54:22');
INSERT INTO `wancll_user_commission_logs` VALUES ('103', '4', '43', '36', '43', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:30', '2018-06-19 13:54:30');
INSERT INTO `wancll_user_commission_logs` VALUES ('104', '4', '43', '36', '43', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:30', '2018-06-19 13:54:30');
INSERT INTO `wancll_user_commission_logs` VALUES ('105', '4', '43', '36', '43', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:30', '2018-06-19 13:54:30');
INSERT INTO `wancll_user_commission_logs` VALUES ('106', '4', '44', '36', '44', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:33', '2018-06-19 13:54:33');
INSERT INTO `wancll_user_commission_logs` VALUES ('107', '4', '44', '36', '44', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:33', '2018-06-19 13:54:33');
INSERT INTO `wancll_user_commission_logs` VALUES ('108', '4', '44', '36', '44', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:33', '2018-06-19 13:54:33');
INSERT INTO `wancll_user_commission_logs` VALUES ('109', '4', '45', '36', '45', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:37', '2018-06-19 13:54:37');
INSERT INTO `wancll_user_commission_logs` VALUES ('110', '4', '45', '36', '45', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:37', '2018-06-19 13:54:37');
INSERT INTO `wancll_user_commission_logs` VALUES ('111', '4', '45', '36', '45', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:37', '2018-06-19 13:54:37');
INSERT INTO `wancll_user_commission_logs` VALUES ('112', '4', '46', '36', '46', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:54', '2018-06-19 13:54:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('113', '4', '46', '36', '46', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:54', '2018-06-19 13:54:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('114', '4', '46', '36', '46', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:54:54', '2018-06-19 13:54:54');
INSERT INTO `wancll_user_commission_logs` VALUES ('115', '4', '47', '36', '47', '1', '85.47', '', '11.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:55:04', '2018-06-19 13:55:04');
INSERT INTO `wancll_user_commission_logs` VALUES ('116', '4', '47', '36', '47', '2', '62.16', '', '8.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:55:04', '2018-06-19 13:55:04');
INSERT INTO `wancll_user_commission_logs` VALUES ('117', '4', '47', '36', '47', '3', '38.85', '', '5.00', '', '0.00', '4', '1', '0', '', '', '1', '2018-06-19 13:55:04', '2018-06-19 13:55:04');

-- -----------------------------
-- Table structure for `wancll_user_coupons`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_coupons`;
CREATE TABLE `wancll_user_coupons` (
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_coupons`
-- -----------------------------
INSERT INTO `wancll_user_coupons` VALUES ('1', '3', '32', '2', 'U2018061509430668465', 'discount', '2018-07-05 21:39:16', '100.00', '7.50', '1', '1', '2018-06-15 09:43:06', '2018-06-15 09:43:06');
INSERT INTO `wancll_user_coupons` VALUES ('2', '11', '32', '2', 'U2018061610105469581', 'discount', '2018-07-05 21:39:16', '100.00', '7.50', '1', '1', '2018-06-16 10:10:54', '2018-06-16 10:10:54');
INSERT INTO `wancll_user_coupons` VALUES ('3', '11', '33', '2', 'U2018061610105902835', 'discount', '2018-06-30 10:15:36', '100.00', '9.90', '1', '1', '2018-06-16 10:10:59', '2018-06-16 10:10:59');
INSERT INTO `wancll_user_coupons` VALUES ('4', '11', '31', '2', 'U2018061610110032849', 'full', '2018-06-30 21:38:53', '100.00', '10.00', '1', '1', '2018-06-16 10:11:00', '2018-06-16 10:11:00');

-- -----------------------------
-- Table structure for `wancll_user_discounts`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_discounts`;
CREATE TABLE `wancll_user_discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `activity_discount_rule_id` bigint(20) NOT NULL COMMENT '享受的折扣活动规则ID',
  `use_num` int(11) NOT NULL DEFAULT '0' COMMENT '已被购买的数量',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `wancll_user_drawcashs`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_drawcashs`;
CREATE TABLE `wancll_user_drawcashs` (
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_drawcashs`
-- -----------------------------
INSERT INTO `wancll_user_drawcashs` VALUES ('1', '7', 'D2018062209532863206', 'money', 'withdrawToBankCard', '10.00', '1', '中国农业银行', '12555', '5688358966555989', '', '1', '1', '2018-06-22 09:53:28', '2018-06-22 09:53:28');
INSERT INTO `wancll_user_drawcashs` VALUES ('2', '7', 'D2018062210250738383', 'money', 'withdrawToBankCard', '5.00', '1', '中国农业银行', '12555', '5688358966555989', '', '1', '1', '2018-06-22 10:25:07', '2018-06-22 10:25:07');
INSERT INTO `wancll_user_drawcashs` VALUES ('3', '7', 'D2018062214304425440', 'money', 'withdrawToBankCard', '5.00', '1', '中国农业银行', '12555', '5688358966555989', '', '1', '1', '2018-06-22 14:30:44', '2018-06-22 14:30:44');
INSERT INTO `wancll_user_drawcashs` VALUES ('4', '7', 'D2018062214310729177', 'money', 'withdrawToBankCard', '1.00', '1', '中国农业银行', '12555', '5688358966555989', '', '1', '1', '2018-06-22 14:31:07', '2018-06-22 14:31:07');

-- -----------------------------
-- Table structure for `wancll_user_goods_keywords`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_goods_keywords`;
CREATE TABLE `wancll_user_goods_keywords` (
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `keywords` text COMMENT '历史搜索关键词',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_goods_keywords`
-- -----------------------------
INSERT INTO `wancll_user_goods_keywords` VALUES ('3', '[\"衣服\"]', '1', '2018-06-15 09:43:37', '2018-06-15 09:47:36');
INSERT INTO `wancll_user_goods_keywords` VALUES ('11', '[\"衣服\"]', '1', '2018-06-16 10:11:25', '2018-06-16 10:11:25');
INSERT INTO `wancll_user_goods_keywords` VALUES ('16', '[\"配件\",\"衣服\"]', '1', '2018-06-16 11:53:36', '2018-06-16 11:53:52');
INSERT INTO `wancll_user_goods_keywords` VALUES ('15', '[\"面膜\",\"箱子\",\"衣服\"]', '1', '2018-06-20 11:49:08', '2018-06-20 11:49:19');

-- -----------------------------
-- Table structure for `wancll_user_info`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_info`;
CREATE TABLE `wancll_user_info` (
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

-- -----------------------------
-- Records of `wancll_user_info`
-- -----------------------------
INSERT INTO `wancll_user_info` VALUES ('1', '2', '210.00', '[34]', '74.10', '37.80', '0.00', '11.00', '20.60', '8.50', '0.00', '8.50', '1', '2018-06-15 09:36:25', '2018-06-19 18:41:37');
INSERT INTO `wancll_user_info` VALUES ('2', '0', '0.00', '', '28.82', '0.00', '0.00', '0.00', '7.86', '0.00', '0.00', '0.00', '1', '2018-06-15 09:38:43', '2018-06-15 18:49:06');
INSERT INTO `wancll_user_info` VALUES ('3', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-15 09:41:19', '2018-06-15 09:41:19');
INSERT INTO `wancll_user_info` VALUES ('4', '0', '0.00', '', '5407.92', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-15 09:42:45', '2018-06-19 13:55:04');
INSERT INTO `wancll_user_info` VALUES ('5', '1', '100.00', '[34]', '29.90', '29.90', '0.00', '0.00', '7.20', '7.20', '0.00', '0.00', '1', '2018-06-15 09:55:59', '2018-06-15 11:51:51');
INSERT INTO `wancll_user_info` VALUES ('6', '2', '210.00', '[34]', '23.10', '23.10', '0.00', '0.00', '6.30', '6.30', '0.00', '0.00', '1', '2018-06-15 09:56:31', '2018-06-15 11:51:51');
INSERT INTO `wancll_user_info` VALUES ('7', '3', '984.00', '[32,22,36]', '118.60', '118.60', '0.00', '79.75', '111.37', '100.37', '0.00', '53.75', '1', '2018-06-15 10:30:10', '2018-06-16 09:51:49');
INSERT INTO `wancll_user_info` VALUES ('8', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-15 10:48:05', '2018-06-15 10:48:05');
INSERT INTO `wancll_user_info` VALUES ('9', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-15 14:01:23', '2018-06-15 14:01:23');
INSERT INTO `wancll_user_info` VALUES ('10', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-15 18:23:07', '2018-06-15 18:23:07');
INSERT INTO `wancll_user_info` VALUES ('11', '0', '0.00', '', '13.20', '0.00', '0.00', '0.00', '3.60', '0.00', '0.00', '0.00', '1', '2018-06-15 18:52:03', '2018-06-15 18:53:18');
INSERT INTO `wancll_user_info` VALUES ('12', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-15 18:56:11', '2018-06-15 18:56:11');
INSERT INTO `wancll_user_info` VALUES ('13', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-15 18:59:36', '2018-06-15 18:59:36');
INSERT INTO `wancll_user_info` VALUES ('14', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-15 19:03:52', '2018-06-15 19:03:52');
INSERT INTO `wancll_user_info` VALUES ('15', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-15 19:08:39', '2018-06-15 19:08:39');
INSERT INTO `wancll_user_info` VALUES ('16', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-16 11:53:22', '2018-06-16 11:53:22');
INSERT INTO `wancll_user_info` VALUES ('17', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-19 11:50:19', '2018-06-19 11:50:19');
INSERT INTO `wancll_user_info` VALUES ('18', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-19 14:08:37', '2018-06-19 14:08:37');
INSERT INTO `wancll_user_info` VALUES ('19', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-19 14:27:02', '2018-06-19 14:27:02');
INSERT INTO `wancll_user_info` VALUES ('20', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-20 11:22:33', '2018-06-20 11:22:33');
INSERT INTO `wancll_user_info` VALUES ('21', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-20 14:14:33', '2018-06-20 14:14:33');
INSERT INTO `wancll_user_info` VALUES ('22', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-23 11:14:22', '2018-06-23 11:14:22');
INSERT INTO `wancll_user_info` VALUES ('23', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-23 11:17:10', '2018-06-23 11:17:10');
INSERT INTO `wancll_user_info` VALUES ('24', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-06-23 11:18:04', '2018-06-23 11:18:04');

-- -----------------------------
-- Table structure for `wancll_user_levels`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_levels`;
CREATE TABLE `wancll_user_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '级别名称',
  `min_score` decimal(10,2) NOT NULL COMMENT '当前等级的最小积分数',
  `intro` text COMMENT '级别简介',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_levels`
-- -----------------------------
INSERT INTO `wancll_user_levels` VALUES ('1', '青铜会员', '10.00', '', '1', '1', '2018-04-17 15:55:03', '2018-04-17 15:55:03');
INSERT INTO `wancll_user_levels` VALUES ('2', '白银会员', '20.00', '', '1', '1', '2018-04-17 15:55:11', '2018-04-17 15:55:11');
INSERT INTO `wancll_user_levels` VALUES ('3', '黄金会员', '40.00', '', '1', '1', '2018-04-17 15:55:26', '2018-04-17 15:55:26');
INSERT INTO `wancll_user_levels` VALUES ('4', '普通会员', '0.00', '', '1', '1', '2018-04-17 20:42:51', '2018-04-17 20:42:51');

-- -----------------------------
-- Table structure for `wancll_user_recharges`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_recharges`;
CREATE TABLE `wancll_user_recharges` (
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
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_recharges`
-- -----------------------------
INSERT INTO `wancll_user_recharges` VALUES ('1', '2', 'R2018061509400577264', 'money', '9', '10000.00', '1', '9', '2018-06-15 09:40:05', '3', '1', '2018-06-15 09:40:05', '2018-06-15 09:40:05');
INSERT INTO `wancll_user_recharges` VALUES ('2', '1', 'R2018061510052784302', 'money', '9', '10000.00', '1', '9', '2018-06-15 10:05:27', '3', '1', '2018-06-15 10:05:27', '2018-06-15 10:05:27');
INSERT INTO `wancll_user_recharges` VALUES ('3', '5', 'R2018061510053615123', 'money', '9', '10000.00', '1', '9', '2018-06-15 10:05:36', '3', '1', '2018-06-15 10:05:36', '2018-06-15 10:05:36');
INSERT INTO `wancll_user_recharges` VALUES ('4', '6', 'R2018061510054396553', 'money', '9', '10000.00', '1', '9', '2018-06-15 10:05:43', '3', '1', '2018-06-15 10:05:43', '2018-06-15 10:05:43');
INSERT INTO `wancll_user_recharges` VALUES ('5', '7', 'R2018061510330692712', 'money', '9', '10000.00', '1', '9', '2018-06-15 10:33:06', '3', '1', '2018-06-15 10:33:06', '2018-06-15 10:33:06');
INSERT INTO `wancll_user_recharges` VALUES ('6', '11', 'R2018061610100215665', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:02', '2018-06-16 10:10:02');
INSERT INTO `wancll_user_recharges` VALUES ('7', '11', 'R2018061610101223863', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:12', '2018-06-16 10:10:12');
INSERT INTO `wancll_user_recharges` VALUES ('8', '11', 'R2018061610101517985', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:15', '2018-06-16 10:10:15');
INSERT INTO `wancll_user_recharges` VALUES ('9', '11', 'R2018061610101623463', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:16', '2018-06-16 10:10:16');
INSERT INTO `wancll_user_recharges` VALUES ('10', '11', 'R2018061610101740061', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:17', '2018-06-16 10:10:17');
INSERT INTO `wancll_user_recharges` VALUES ('11', '11', 'R2018061610101720049', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:17', '2018-06-16 10:10:17');
INSERT INTO `wancll_user_recharges` VALUES ('12', '11', 'R2018061610101704192', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:17', '2018-06-16 10:10:17');
INSERT INTO `wancll_user_recharges` VALUES ('13', '11', 'R2018061610101807062', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:18', '2018-06-16 10:10:18');
INSERT INTO `wancll_user_recharges` VALUES ('14', '11', 'R2018061610101805210', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:18', '2018-06-16 10:10:18');
INSERT INTO `wancll_user_recharges` VALUES ('15', '11', 'R2018061610101908028', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:19', '2018-06-16 10:10:19');
INSERT INTO `wancll_user_recharges` VALUES ('16', '11', 'R2018061610103902158', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:39', '2018-06-16 10:10:39');
INSERT INTO `wancll_user_recharges` VALUES ('17', '11', 'R2018061610104050547', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:40', '2018-06-16 10:10:40');
INSERT INTO `wancll_user_recharges` VALUES ('18', '11', 'R2018061610104005040', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:40', '2018-06-16 10:10:40');
INSERT INTO `wancll_user_recharges` VALUES ('19', '11', 'R2018061610104095255', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:40', '2018-06-16 10:10:40');
INSERT INTO `wancll_user_recharges` VALUES ('20', '11', 'R2018061610104123669', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:41', '2018-06-16 10:10:41');
INSERT INTO `wancll_user_recharges` VALUES ('21', '11', 'R2018061610104186819', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:41', '2018-06-16 10:10:41');
INSERT INTO `wancll_user_recharges` VALUES ('22', '11', 'R2018061610104190168', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:41', '2018-06-16 10:10:41');
INSERT INTO `wancll_user_recharges` VALUES ('23', '11', 'R2018061610104167703', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:41', '2018-06-16 10:10:41');
INSERT INTO `wancll_user_recharges` VALUES ('24', '11', 'R2018061610104272304', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:42', '2018-06-16 10:10:42');
INSERT INTO `wancll_user_recharges` VALUES ('25', '11', 'R2018061610104494571', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:44', '2018-06-16 10:10:44');
INSERT INTO `wancll_user_recharges` VALUES ('26', '11', 'R2018061610104450539', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:44', '2018-06-16 10:10:44');
INSERT INTO `wancll_user_recharges` VALUES ('27', '11', 'R2018061610104549327', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:45', '2018-06-16 10:10:45');
INSERT INTO `wancll_user_recharges` VALUES ('28', '11', 'R2018061610104597338', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:45', '2018-06-16 10:10:45');
INSERT INTO `wancll_user_recharges` VALUES ('29', '11', 'R2018061610104627666', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:46', '2018-06-16 10:10:46');
INSERT INTO `wancll_user_recharges` VALUES ('30', '11', 'R2018061610104661346', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:46', '2018-06-16 10:10:46');
INSERT INTO `wancll_user_recharges` VALUES ('31', '11', 'R2018061610104754533', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:47', '2018-06-16 10:10:47');
INSERT INTO `wancll_user_recharges` VALUES ('32', '11', 'R2018061610104781415', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:47', '2018-06-16 10:10:47');
INSERT INTO `wancll_user_recharges` VALUES ('33', '11', 'R2018061610104799406', 'money', '1', '1000000.00', '0', '', '', '1', '1', '2018-06-16 10:10:47', '2018-06-16 10:10:47');
INSERT INTO `wancll_user_recharges` VALUES ('34', '24', 'R2018062722443291511', 'money', '9', '122.00', '1', '9', '2018-06-27 22:44:32', '3', '1', '2018-06-27 22:44:32', '2018-06-27 22:44:32');

-- -----------------------------
-- Table structure for `wancll_user_third_accounts`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_third_accounts`;
CREATE TABLE `wancll_user_third_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `client_type` varchar(255) DEFAULT NULL COMMENT '客户端类别',
  `type` varchar(255) NOT NULL COMMENT '账户类型：ali ||  wechat',
  `name` varchar(255) NOT NULL COMMENT '账号名称',
  `account` varchar(255) NOT NULL COMMENT '账号',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_third_accounts`
-- -----------------------------
INSERT INTO `wancll_user_third_accounts` VALUES ('1', '13', 'wechat', 'wechat', 'openid', 'oNGLotzmnxK1aIfJio_NWCsPA9zg', '1', '2018-06-15 18:59:57', '2018-06-15 18:59:57');
INSERT INTO `wancll_user_third_accounts` VALUES ('2', '14', 'wechat', 'wechat', 'openid', 'oNGLotzmnxK1aIfJio_NWCsPA9zg', '1', '2018-06-15 19:03:52', '2018-06-15 19:03:52');
INSERT INTO `wancll_user_third_accounts` VALUES ('3', '7', 'wechat', 'wechat', 'openid', 'oNGLot9N_Pi56inWw53BS2KQkfBM', '1', '2018-06-17 08:44:49', '2018-06-17 08:44:49');
INSERT INTO `wancll_user_third_accounts` VALUES ('4', '20', 'wechat', 'wechat', 'openid', 'oNGLot8c8QYFvhlXujRD2613KW6U', '1', '2018-06-20 11:22:33', '2018-06-20 11:22:33');
INSERT INTO `wancll_user_third_accounts` VALUES ('5', '7', 'wap', 'ali', '郝建海', '2630110384@qq.com', '1', '2018-06-22 10:09:47', '2018-06-22 10:09:47');

-- -----------------------------
-- Table structure for `wancll_user_tokens`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_tokens`;
CREATE TABLE `wancll_user_tokens` (
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
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_tokens`
-- -----------------------------
INSERT INTO `wancll_user_tokens` VALUES ('1', '1', '1', 'wap', 'user&wap@ebc055a9911fb8a44bcc3f7767a764d5', 'user&wap@3b2c6584ea29e55c3bf636b8ade8dbbe', '7200', '1', '2018-06-15 09:36:25', '2018-06-15 09:36:25');
INSERT INTO `wancll_user_tokens` VALUES ('2', '2', '2', 'wechat', 'user&wechat@8c73b3281dfd7ea827225b97d50db66f', 'user&wechat@f577172d062ab9f1302e7347a1b94833', '7200', '1', '2018-06-15 09:38:43', '2018-06-15 09:38:43');
INSERT INTO `wancll_user_tokens` VALUES ('52', '3', '3', 'pc', 'user&pc@493019ecdc13edc592001230366bc468', 'user&pc@90a2e92b0ced33e0d3d0f6d374cca124', '7200', '1', '2018-06-19 09:56:09', '2018-06-19 09:56:09');
INSERT INTO `wancll_user_tokens` VALUES ('54', '4', '4', 'applet', 'user&applet@c65995475db4e7a649c2abf989cb8e01', 'user&applet@5405f2c2ae0a44e0131fc2e2cdb507ad', '7200', '1', '2018-06-19 13:48:13', '2018-06-19 13:48:13');
INSERT INTO `wancll_user_tokens` VALUES ('5', '4', '4', 'wap', 'user&wap@d2260426c61e8d22d33f15faa4f7fc5e', 'user&wap@89297c58843a35da593910527751239e', '7200', '1', '2018-06-15 09:42:55', '2018-06-15 09:42:55');
INSERT INTO `wancll_user_tokens` VALUES ('6', '2', '2', 'applet', 'user&applet@c2feb9d1c040f5d8b4cff53f82f66d6a', 'user&applet@8ccc66cbd43688f76c685dfb865cda4d', '7200', '1', '2018-06-15 09:46:35', '2018-06-15 09:46:35');
INSERT INTO `wancll_user_tokens` VALUES ('7', '2', '2', 'wechat', 'user&wechat@728bd1efdcf3e644893eb712b1ea42a6', 'user&wechat@6c76809fb6da45e6ef90d6dc4abe4f22', '7200', '1', '2018-06-15 09:49:27', '2018-06-15 09:49:27');
INSERT INTO `wancll_user_tokens` VALUES ('49', '3', '3', 'wap', 'user&wap@cb15a964d1a3f1454ce5852967de3d23', 'user&wap@4d8b8aba3be5b6689f11d412d5de40ea', '7200', '1', '2018-06-16 15:51:42', '2018-06-16 15:51:42');
INSERT INTO `wancll_user_tokens` VALUES ('9', '5', '5', 'wap', 'user&wap@404bda94097a8cd008a01edd3f935580', 'user&wap@42dfefd8c0ea4b118365bbf30e2a9876', '7200', '1', '2018-06-15 09:55:59', '2018-06-15 09:55:59');
INSERT INTO `wancll_user_tokens` VALUES ('10', '6', '6', 'wap', 'user&wap@79c5497463e90592840a37472a656ec4', 'user&wap@9bf9388156af06922caab861c2bbbbb7', '7200', '1', '2018-06-15 09:56:31', '2018-06-15 09:56:31');
INSERT INTO `wancll_user_tokens` VALUES ('11', '7', '7', 'wechat', 'user&wechat@1a6411dd6ccf52f345003efde8184396', 'user&wechat@721aadcf2e6d8e68196bacc8f57af99c', '7200', '1', '2018-06-15 10:30:10', '2018-06-15 10:30:10');
INSERT INTO `wancll_user_tokens` VALUES ('12', '3', '3', 'wechat', 'user&wechat@a0608e1777376b80875428a696e35c82', 'user&wechat@856e174ad37d02e0963bf7027e9fbc38', '7200', '1', '2018-06-15 10:41:31', '2018-06-15 10:41:31');
INSERT INTO `wancll_user_tokens` VALUES ('13', '8', '8', 'wap', 'user&wap@60d5608a6ec471f355b7dab0ec8ee5df', 'user&wap@ab20854cf58d3363b2584e01ea39fc33', '7200', '1', '2018-06-15 10:48:05', '2018-06-15 10:48:05');
INSERT INTO `wancll_user_tokens` VALUES ('14', '4', '4', 'applet', 'user&applet@12844faf306ff82a214074a1564694d3', 'user&applet@eb125e989fcab63e32dfe2524d338e9f', '7200', '1', '2018-06-15 10:57:56', '2018-06-15 10:57:56');
INSERT INTO `wancll_user_tokens` VALUES ('15', '7', '7', 'wap', 'user&wap@52d98e18d2e83d3269449c252f8e10fd', 'user&wap@b1af45637466ec74337348f3aec98b1a', '7200', '1', '2018-06-15 11:20:51', '2018-06-15 11:20:51');
INSERT INTO `wancll_user_tokens` VALUES ('16', '9', '9', 'wechat', 'user&wechat@512dc9f2661e5ab398e27f639d6c5408', 'user&wechat@069c39db3cf69f79d0c1d61d496c3ebd', '7200', '1', '2018-06-15 14:01:23', '2018-06-15 14:01:23');
INSERT INTO `wancll_user_tokens` VALUES ('17', '7', '7', 'wap', 'user&wap@d5165c615b99feecde992865cd79c74e', 'user&wap@e6cb3657fb8f4bb78a62035045f4e846', '7200', '1', '2018-06-15 14:37:17', '2018-06-15 14:37:17');
INSERT INTO `wancll_user_tokens` VALUES ('70', '20', '20', 'wechat', 'user&wechat@ec0b0e43fa33583b9b4b122ca60dcd1a', 'user&wechat@baad0da2641d144cb67a62199a4407dd', '7200', '1', '2018-06-20 11:22:33', '2018-06-20 11:22:33');
INSERT INTO `wancll_user_tokens` VALUES ('19', '5', '5', 'wechat', 'user&wechat@eb3ebbfc8901c82d08677a57aa542a37', 'user&wechat@fafe4ee9424e1b04f1f3c2c3846dea79', '7200', '1', '2018-06-15 15:08:51', '2018-06-15 15:08:51');
INSERT INTO `wancll_user_tokens` VALUES ('20', '3', '3', 'pc', 'user&pc@2ea1ee174baf7ab75309b30c73a7375b', 'user&pc@5d31d78eeca2d6ac3f654dba6306fe48', '7200', '1', '2018-06-15 17:24:40', '2018-06-15 17:24:40');
INSERT INTO `wancll_user_tokens` VALUES ('65', '4', '4', 'wap', 'user&wap@6b762ab403a1fb888ad67c794da731b6', 'user&wap@6ca42e907b55afc569cd999a8d9c2295', '7200', '1', '2018-06-20 08:52:48', '2018-06-20 08:52:48');
INSERT INTO `wancll_user_tokens` VALUES ('22', '10', '10', 'wechat', 'user&wechat@aa98493d6dfed32ae828d23bfcb1ffec', 'user&wechat@45a2f48d95e7aefb167eb087918c2928', '7200', '1', '2018-06-15 18:23:07', '2018-06-15 18:23:07');
INSERT INTO `wancll_user_tokens` VALUES ('23', '10', '10', 'wechat', 'user&wechat@b4257b5137280356112d0d854c00a95f', 'user&wechat@102e30cc94d1f6b23578d96142b54079', '7200', '1', '2018-06-15 18:34:44', '2018-06-15 18:34:44');
INSERT INTO `wancll_user_tokens` VALUES ('24', '9', '9', 'wechat', 'user&wechat@e6d68b3876c88cd3abcf3df46ec25671', 'user&wechat@eb395834768306685a509b3b0c66c858', '7200', '1', '2018-06-15 18:36:59', '2018-06-15 18:36:59');
INSERT INTO `wancll_user_tokens` VALUES ('25', '9', '9', 'wechat', 'user&wechat@c3862f15d3c6979df8b694238a4c9208', 'user&wechat@f0f1544a7ae2573b10a5a7a730614fcf', '7200', '1', '2018-06-15 18:37:19', '2018-06-15 18:37:19');
INSERT INTO `wancll_user_tokens` VALUES ('26', '11', '11', 'wechat', 'user&wechat@2d58dd951bb4dc4ee91937d0a845893d', 'user&wechat@a0c6a44819e6d8d25561c099c33ab71f', '7200', '1', '2018-06-15 18:52:03', '2018-06-15 18:52:03');
INSERT INTO `wancll_user_tokens` VALUES ('27', '11', '11', 'wechat', 'user&wechat@8c1ea304bab6fe54f5fdeb1d11bab623', 'user&wechat@dbe221bf42ed6cbd05d7f209f9d7d5e7', '7200', '1', '2018-06-15 18:54:23', '2018-06-15 18:54:23');
INSERT INTO `wancll_user_tokens` VALUES ('28', '11', '11', 'wechat', 'user&wechat@f6f2fadb64e0f3d80d328195022726af', 'user&wechat@361a48487c0999b4e4c0a1d83a93da13', '7200', '1', '2018-06-15 18:54:48', '2018-06-15 18:54:48');
INSERT INTO `wancll_user_tokens` VALUES ('29', '12', '12', 'wechat', 'user&wechat@dd41d79c50e0b2802336d338b3cc7904', 'user&wechat@fe94112440afbf627c34c699eef38f9e', '7200', '1', '2018-06-15 18:56:11', '2018-06-15 18:56:11');
INSERT INTO `wancll_user_tokens` VALUES ('30', '11', '11', 'wechat', 'user&wechat@8f80bb0e4c94cb951c4108148e02ca38', 'user&wechat@415b522de7301536c1fb6beffae45301', '7200', '1', '2018-06-15 18:56:49', '2018-06-15 18:56:49');
INSERT INTO `wancll_user_tokens` VALUES ('31', '12', '12', 'wechat', 'user&wechat@cd89ee983a9c58694f2ded0ad46d826f', 'user&wechat@3da900cb3e5b090e4c689f5494f1bdee', '7200', '1', '2018-06-15 18:58:31', '2018-06-15 18:58:31');
INSERT INTO `wancll_user_tokens` VALUES ('32', '12', '12', 'wechat', 'user&wechat@9e01b1ecb7587aeba84f31f087291244', 'user&wechat@43ebe9facf3b09ed90b0fa8f130124f9', '7200', '1', '2018-06-15 18:58:47', '2018-06-15 18:58:47');
INSERT INTO `wancll_user_tokens` VALUES ('33', '12', '12', 'wechat', 'user&wechat@8af4cd8cd98446cf341c0aad24540dc1', 'user&wechat@4d85940823a51e153dbef86aba832238', '7200', '1', '2018-06-15 18:58:56', '2018-06-15 18:58:56');
INSERT INTO `wancll_user_tokens` VALUES ('34', '12', '12', 'wechat', 'user&wechat@d3ea18ba9534bad9d6901bffc607219f', 'user&wechat@5b39c0654dbd733e1ca9e2030fa318e1', '7200', '1', '2018-06-15 18:59:03', '2018-06-15 18:59:03');
INSERT INTO `wancll_user_tokens` VALUES ('35', '13', '13', 'wechat', 'user&wechat@a6c05b01a4f3738c7e8dc3ca41ce9abe', 'user&wechat@ea37f90c621e5867f194afc4e853b1a1', '7200', '1', '2018-06-15 18:59:36', '2018-06-15 18:59:36');
INSERT INTO `wancll_user_tokens` VALUES ('36', '7', '7', 'wechat', 'user&wechat@ed8df1e5de0f896f673bebab73b088a3', 'user&wechat@2b98642283df3605569f940c1e1820f8', '7200', '1', '2018-06-15 18:59:53', '2018-06-15 18:59:53');
INSERT INTO `wancll_user_tokens` VALUES ('37', '13', '13', 'wechat', 'user&wechat@e8de38f900d5e6aa7c27156583fb840c', 'user&wechat@0ab65b4b7d18393037d90c482aa00dd3', '7200', '1', '2018-06-15 19:00:30', '2018-06-15 19:00:30');
INSERT INTO `wancll_user_tokens` VALUES ('38', '7', '7', 'wechat', 'user&wechat@202ee969d555f43348825a0937bdb525', 'user&wechat@273886218c966c765fb5f2e6acbcd596', '7200', '1', '2018-06-15 19:00:50', '2018-06-15 19:00:50');
INSERT INTO `wancll_user_tokens` VALUES ('51', '7', '7', 'wechat', 'user&wechat@1bbc01422e760739a3e95c3437227340', 'user&wechat@b19efffab72c175d6a332267f1c2dffe', '7200', '1', '2018-06-17 08:44:35', '2018-06-17 08:44:35');
INSERT INTO `wancll_user_tokens` VALUES ('40', '13', '13', 'wechat', 'user&wechat@b368a07f9291084809bbf5ef245d2d89', 'user&wechat@0385397cc3a27a6c0b172789aa09cc6e', '7200', '1', '2018-06-15 19:02:56', '2018-06-15 19:02:56');
INSERT INTO `wancll_user_tokens` VALUES ('41', '14', '14', 'wechat', 'user&wechat@f176c11a59bc03facc3fa092c71f5be0', 'user&wechat@c086fc6d0aa7d7a031dd20c1d12a907c', '7200', '1', '2018-06-15 19:03:52', '2018-06-15 19:03:52');
INSERT INTO `wancll_user_tokens` VALUES ('42', '3', '3', 'applet', 'user&applet@b9b24a166ef7e83348315bc5e4761540', 'user&applet@a03621e1fba2ab96d9259e1f48271a39', '7200', '1', '2018-06-15 19:08:07', '2018-06-15 19:08:07');
INSERT INTO `wancll_user_tokens` VALUES ('43', '15', '15', 'applet', 'user&applet@3a4359bc3d9a4a8435a8dbd2b30ea82e', 'user&applet@8ad621d5ff2971478a262b0a52b68ee6', '7200', '1', '2018-06-15 19:08:39', '2018-06-15 19:08:39');
INSERT INTO `wancll_user_tokens` VALUES ('44', '10', '10', 'applet', 'user&applet@6a9be932c368f2b8a389b772375638fc', 'user&applet@855cfb0e4875700cb2a1c4d1a335ae97', '7200', '1', '2018-06-15 19:08:41', '2018-06-15 19:08:41');
INSERT INTO `wancll_user_tokens` VALUES ('45', '15', '15', 'applet', 'user&applet@79687f3fe7ff1bd76720e9c45d53e8fa', 'user&applet@4459c1081ab5d3bfb2d849d416c1aeed', '7200', '1', '2018-06-16 09:50:04', '2018-06-16 09:50:04');
INSERT INTO `wancll_user_tokens` VALUES ('61', '11', '11', 'pc', 'user&pc@d3cfd4e2fe211d662323c7c880665c65', 'user&pc@4c982b34a4f4ebc6d416f685afa87da7', '7200', '1', '2018-06-19 17:42:03', '2018-06-19 17:42:03');
INSERT INTO `wancll_user_tokens` VALUES ('47', '16', '16', 'pc', 'user&pc@76c7ae808de26d9eb0c2ef4b02115ef5', 'user&pc@d8067dcc2efb5ea9d669b38181213ab6', '7200', '1', '2018-06-16 11:53:22', '2018-06-16 11:53:22');
INSERT INTO `wancll_user_tokens` VALUES ('48', '9', '9', 'pc', 'user&pc@7a9bccec5339e78def9921d4c186f027', 'user&pc@f30a35f5525bff81e9f663e1eb41d941', '7200', '1', '2018-06-16 12:04:17', '2018-06-16 12:04:17');
INSERT INTO `wancll_user_tokens` VALUES ('50', '7', '7', 'app', 'user&app@ea6b79a5368e9f77f771c782482e4cde', 'user&app@3b4434b35e2cd446469e21c5791bb459', '0', '1', '2018-06-17 08:41:46', '2018-06-17 08:41:46');
INSERT INTO `wancll_user_tokens` VALUES ('53', '17', '17', 'wechat', 'user&wechat@b867241c90814f216e1846bfc4a01519', 'user&wechat@9ef7abf76a4e5070abb8b9f8ca671767', '7200', '1', '2018-06-19 11:50:19', '2018-06-19 11:50:19');
INSERT INTO `wancll_user_tokens` VALUES ('55', '4', '4', 'pc', 'user&pc@0d24c9d9d42d28e566c0c4d60efc3817', 'user&pc@9a2163fa9d5e9a15df89a2ccc5059998', '7200', '1', '2018-06-19 13:59:06', '2018-06-19 13:59:06');
INSERT INTO `wancll_user_tokens` VALUES ('56', '4', '4', 'wap', 'user&wap@7f882cbeebb8da9a7a15590fa63a490f', 'user&wap@d4121944f7519fa4b34f94716a547cd1', '7200', '1', '2018-06-19 14:00:12', '2018-06-19 14:00:12');
INSERT INTO `wancll_user_tokens` VALUES ('57', '18', '18', 'wap', 'user&wap@8bb884684fa5da371344842bb9d736ac', 'user&wap@523e3554ab3b5249b96240ee4ec1ed36', '7200', '1', '2018-06-19 14:08:37', '2018-06-19 14:08:37');
INSERT INTO `wancll_user_tokens` VALUES ('58', '18', '18', 'wechat', 'user&wechat@a12a9ef5c3ea2a33c68663beec6fd4cd', 'user&wechat@89dba1bd49e3a083ee1e310a2233fa51', '7200', '1', '2018-06-19 14:17:23', '2018-06-19 14:17:23');
INSERT INTO `wancll_user_tokens` VALUES ('59', '18', '18', 'wechat', 'user&wechat@5b71c597698f0f5e442cc53b70815226', 'user&wechat@ef7304d6b980c809ff57fdbec73520bc', '7200', '1', '2018-06-19 14:17:48', '2018-06-19 14:17:48');
INSERT INTO `wancll_user_tokens` VALUES ('60', '19', '19', 'app', 'user&app@b04a494729182d615de09e33bc45c4e7', 'user&app@a1ac54e5e97dc4f233a3163927fcd92a', '0', '1', '2018-06-19 14:27:02', '2018-06-19 14:27:02');
INSERT INTO `wancll_user_tokens` VALUES ('62', '4', '4', 'wap', 'user&wap@2e424c9e46592c42bcaa9c86572d94ab', 'user&wap@8b685db682a3a1d5bd60e98eb777184d', '7200', '1', '2018-06-19 18:38:31', '2018-06-19 18:38:31');
INSERT INTO `wancll_user_tokens` VALUES ('63', '1', '1', 'wap', 'user&wap@187356f6c9f7470f672698a991c163f3', 'user&wap@31f2dd9ac3874aeb6743d719aaa036fa', '7200', '1', '2018-06-19 18:40:57', '2018-06-19 18:40:57');
INSERT INTO `wancll_user_tokens` VALUES ('64', '4', '4', 'applet', 'user&applet@8701598c31e0d62aa289f8204a8f1e5f', 'user&applet@a0e61d91e3029326984f8e0e8f1406ab', '7200', '1', '2018-06-20 08:51:28', '2018-06-20 08:51:28');
INSERT INTO `wancll_user_tokens` VALUES ('66', '1', '1', 'wap', 'user&wap@3fd108f11f2ffde8f684aa56bbe754d9', 'user&wap@e5bb9c4bcf8e79b5d2d06a7729799c11', '7200', '1', '2018-06-20 08:56:25', '2018-06-20 08:56:25');
INSERT INTO `wancll_user_tokens` VALUES ('67', '1', '1', 'applet', 'user&applet@2f714d1858015fbaaa40a6698c582c6e', 'user&applet@89d59d8b6a707f63a67f81bf0a9525c3', '7200', '1', '2018-06-20 08:57:32', '2018-06-20 08:57:32');
INSERT INTO `wancll_user_tokens` VALUES ('68', '15', '15', 'pc', 'user&pc@fc20dc38c7efdd8a7cde1df64d23c912', 'user&pc@08ad5ac0fd7a0fdf5ebed8248e14238a', '7200', '1', '2018-06-20 10:29:59', '2018-06-20 10:29:59');
INSERT INTO `wancll_user_tokens` VALUES ('69', '15', '15', 'wap', 'user&wap@fbd6c677cfaf1353aba690bfebb66ab1', 'user&wap@09ca5ac7bacd250d5eb9f5f4d317af8f', '7200', '1', '2018-06-20 10:45:54', '2018-06-20 10:45:54');
INSERT INTO `wancll_user_tokens` VALUES ('71', '15', '15', 'wechat', 'user&wechat@ae93526988b3d57b49e8152948eb9d71', 'user&wechat@db49094c420e07f7a3eefef0fae68ca5', '7200', '1', '2018-06-20 11:47:40', '2018-06-20 11:47:40');
INSERT INTO `wancll_user_tokens` VALUES ('72', '21', '21', 'applet', 'user&applet@3daaebcb0e4e9f66c2710d28efb43a77', 'user&applet@9567d6e7105c29e3d020cf060f9c62c0', '7200', '1', '2018-06-20 14:14:33', '2018-06-20 14:14:33');
INSERT INTO `wancll_user_tokens` VALUES ('73', '7', '7', 'wap', 'user&wap@2c197e13bf934898760d4ce9085ef1da', 'user&wap@4908f46f59c14d4feb43fdb9e205fb49', '7200', '1', '2018-06-22 09:51:09', '2018-06-22 09:51:09');
INSERT INTO `wancll_user_tokens` VALUES ('74', '7', '7', 'wap', 'user&wap@38e3ff9529ad1957eee6e0c93b07e6bc', 'user&wap@8b31043b7df812a412d5d2ea5a91c44c', '7200', '1', '2018-06-22 14:29:50', '2018-06-22 14:29:50');
INSERT INTO `wancll_user_tokens` VALUES ('75', '22', '22', 'wap', 'user&wap@d55a48478d26fa90c3b1d5bc9dd28b41', 'user&wap@f160500ecf6e558e57e9086caf1e31aa', '7200', '1', '2018-06-23 11:14:23', '2018-06-23 11:14:23');
INSERT INTO `wancll_user_tokens` VALUES ('76', '23', '23', 'wap', 'user&wap@16a97749136bed9242574f03de94b6bc', 'user&wap@62e423d78e2763a15b393e18b6cfc8ae', '7200', '1', '2018-06-23 11:17:10', '2018-06-23 11:17:10');
INSERT INTO `wancll_user_tokens` VALUES ('79', '24', '24', 'wap', 'user&wap@2a09a2161eaa2c3ef44aeddcd395d353', 'user&wap@797c70864b83135fc67018bd9a98fbf5', '7200', '1', '2018-06-27 21:01:54', '2018-06-27 21:01:54');

-- -----------------------------
-- Table structure for `wancll_user_visit_logs`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_visit_logs`;
CREATE TABLE `wancll_user_visit_logs` (
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
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_visit_logs`
-- -----------------------------
INSERT INTO `wancll_user_visit_logs` VALUES ('1', '1', '1', 'wap', '113.246.203.190', '2018-06-15 09:36:25', '1', '2018-06-15 09:36:25', '2018-06-15 09:36:25');
INSERT INTO `wancll_user_visit_logs` VALUES ('2', '2', '2', 'wechat', '113.246.203.190', '2018-06-15 09:38:43', '1', '2018-06-15 09:38:43', '2018-06-15 09:38:43');
INSERT INTO `wancll_user_visit_logs` VALUES ('3', '3', '3', 'pc', '175.8.205.123', '2018-06-15 09:41:19', '1', '2018-06-15 09:41:19', '2018-06-15 09:41:19');
INSERT INTO `wancll_user_visit_logs` VALUES ('4', '4', '4', 'applet', '113.246.203.190', '2018-06-15 09:42:45', '1', '2018-06-15 09:42:45', '2018-06-15 09:42:45');
INSERT INTO `wancll_user_visit_logs` VALUES ('5', '4', '4', 'wap', '113.246.203.190', '2018-06-15 09:42:55', '1', '2018-06-15 09:42:55', '2018-06-15 09:42:55');
INSERT INTO `wancll_user_visit_logs` VALUES ('6', '2', '2', 'applet', '113.246.203.190', '2018-06-15 09:46:35', '1', '2018-06-15 09:46:35', '2018-06-15 09:46:35');
INSERT INTO `wancll_user_visit_logs` VALUES ('7', '2', '2', 'wechat', '113.246.203.190', '2018-06-15 09:49:27', '1', '2018-06-15 09:49:27', '2018-06-15 09:49:27');
INSERT INTO `wancll_user_visit_logs` VALUES ('8', '3', '3', 'wap', '175.8.205.123', '2018-06-15 09:50:29', '1', '2018-06-15 09:50:29', '2018-06-15 09:50:29');
INSERT INTO `wancll_user_visit_logs` VALUES ('9', '5', '5', 'wap', '113.246.203.190', '2018-06-15 09:55:59', '1', '2018-06-15 09:55:59', '2018-06-15 09:55:59');
INSERT INTO `wancll_user_visit_logs` VALUES ('10', '6', '6', 'wap', '113.246.203.190', '2018-06-15 09:56:31', '1', '2018-06-15 09:56:31', '2018-06-15 09:56:31');
INSERT INTO `wancll_user_visit_logs` VALUES ('11', '7', '7', 'wechat', '113.246.203.190', '2018-06-15 10:30:10', '1', '2018-06-15 10:30:10', '2018-06-15 10:30:10');
INSERT INTO `wancll_user_visit_logs` VALUES ('12', '3', '3', 'wechat', '117.136.88.176', '2018-06-15 10:41:31', '1', '2018-06-15 10:41:31', '2018-06-15 10:41:31');
INSERT INTO `wancll_user_visit_logs` VALUES ('13', '8', '8', 'wap', '106.19.33.85', '2018-06-15 10:48:05', '1', '2018-06-15 10:48:05', '2018-06-15 10:48:05');
INSERT INTO `wancll_user_visit_logs` VALUES ('14', '4', '4', 'applet', '113.246.203.190', '2018-06-15 10:57:56', '1', '2018-06-15 10:57:56', '2018-06-15 10:57:56');
INSERT INTO `wancll_user_visit_logs` VALUES ('15', '7', '7', 'wap', '113.246.203.190', '2018-06-15 11:20:51', '1', '2018-06-15 11:20:51', '2018-06-15 11:20:51');
INSERT INTO `wancll_user_visit_logs` VALUES ('16', '9', '9', 'wechat', '113.246.203.190', '2018-06-15 14:01:23', '1', '2018-06-15 14:01:23', '2018-06-15 14:01:23');
INSERT INTO `wancll_user_visit_logs` VALUES ('17', '7', '7', 'wap', '113.246.203.190', '2018-06-15 14:37:17', '1', '2018-06-15 14:37:17', '2018-06-15 14:37:17');
INSERT INTO `wancll_user_visit_logs` VALUES ('18', '5', '5', 'wechat', '117.136.88.12', '2018-06-15 14:59:34', '1', '2018-06-15 14:59:34', '2018-06-15 14:59:34');
INSERT INTO `wancll_user_visit_logs` VALUES ('19', '5', '5', 'wechat', '223.104.21.42', '2018-06-15 15:08:51', '1', '2018-06-15 15:08:51', '2018-06-15 15:08:51');
INSERT INTO `wancll_user_visit_logs` VALUES ('20', '3', '3', 'pc', '113.246.200.165', '2018-06-15 17:24:40', '1', '2018-06-15 17:24:40', '2018-06-15 17:24:40');
INSERT INTO `wancll_user_visit_logs` VALUES ('21', '4', '4', 'wap', '113.246.203.190', '2018-06-15 18:16:27', '1', '2018-06-15 18:16:27', '2018-06-15 18:16:27');
INSERT INTO `wancll_user_visit_logs` VALUES ('22', '10', '10', 'wechat', '113.246.203.190', '2018-06-15 18:23:07', '1', '2018-06-15 18:23:07', '2018-06-15 18:23:07');
INSERT INTO `wancll_user_visit_logs` VALUES ('23', '10', '10', 'wechat', '113.246.203.190', '2018-06-15 18:34:44', '1', '2018-06-15 18:34:44', '2018-06-15 18:34:44');
INSERT INTO `wancll_user_visit_logs` VALUES ('24', '9', '9', 'wechat', '113.246.203.190', '2018-06-15 18:36:59', '1', '2018-06-15 18:36:59', '2018-06-15 18:36:59');
INSERT INTO `wancll_user_visit_logs` VALUES ('25', '9', '9', 'wechat', '113.246.203.190', '2018-06-15 18:37:19', '1', '2018-06-15 18:37:19', '2018-06-15 18:37:19');
INSERT INTO `wancll_user_visit_logs` VALUES ('26', '11', '11', 'wechat', '113.246.203.190', '2018-06-15 18:52:03', '1', '2018-06-15 18:52:03', '2018-06-15 18:52:03');
INSERT INTO `wancll_user_visit_logs` VALUES ('27', '11', '11', 'wechat', '113.246.203.190', '2018-06-15 18:54:23', '1', '2018-06-15 18:54:23', '2018-06-15 18:54:23');
INSERT INTO `wancll_user_visit_logs` VALUES ('28', '11', '11', 'wechat', '113.246.203.190', '2018-06-15 18:54:48', '1', '2018-06-15 18:54:48', '2018-06-15 18:54:48');
INSERT INTO `wancll_user_visit_logs` VALUES ('29', '12', '12', 'wechat', '113.246.203.190', '2018-06-15 18:56:11', '1', '2018-06-15 18:56:11', '2018-06-15 18:56:11');
INSERT INTO `wancll_user_visit_logs` VALUES ('30', '11', '11', 'wechat', '113.246.203.190', '2018-06-15 18:56:49', '1', '2018-06-15 18:56:49', '2018-06-15 18:56:49');
INSERT INTO `wancll_user_visit_logs` VALUES ('31', '12', '12', 'wechat', '113.246.203.190', '2018-06-15 18:58:31', '1', '2018-06-15 18:58:31', '2018-06-15 18:58:31');
INSERT INTO `wancll_user_visit_logs` VALUES ('32', '12', '12', 'wechat', '113.246.203.190', '2018-06-15 18:58:47', '1', '2018-06-15 18:58:47', '2018-06-15 18:58:47');
INSERT INTO `wancll_user_visit_logs` VALUES ('33', '12', '12', 'wechat', '113.246.203.190', '2018-06-15 18:58:56', '1', '2018-06-15 18:58:56', '2018-06-15 18:58:56');
INSERT INTO `wancll_user_visit_logs` VALUES ('34', '12', '12', 'wechat', '113.246.203.190', '2018-06-15 18:59:03', '1', '2018-06-15 18:59:03', '2018-06-15 18:59:03');
INSERT INTO `wancll_user_visit_logs` VALUES ('35', '13', '13', 'wechat', '113.246.203.190', '2018-06-15 18:59:36', '1', '2018-06-15 18:59:36', '2018-06-15 18:59:36');
INSERT INTO `wancll_user_visit_logs` VALUES ('36', '7', '7', 'wechat', '113.246.203.190', '2018-06-15 18:59:53', '1', '2018-06-15 18:59:53', '2018-06-15 18:59:53');
INSERT INTO `wancll_user_visit_logs` VALUES ('37', '13', '13', 'wechat', '113.246.203.190', '2018-06-15 19:00:30', '1', '2018-06-15 19:00:30', '2018-06-15 19:00:30');
INSERT INTO `wancll_user_visit_logs` VALUES ('38', '7', '7', 'wechat', '113.246.203.190', '2018-06-15 19:00:50', '1', '2018-06-15 19:00:50', '2018-06-15 19:00:50');
INSERT INTO `wancll_user_visit_logs` VALUES ('39', '7', '7', 'wechat', '113.246.203.190', '2018-06-15 19:01:14', '1', '2018-06-15 19:01:14', '2018-06-15 19:01:14');
INSERT INTO `wancll_user_visit_logs` VALUES ('40', '13', '13', 'wechat', '113.246.203.190', '2018-06-15 19:02:56', '1', '2018-06-15 19:02:56', '2018-06-15 19:02:56');
INSERT INTO `wancll_user_visit_logs` VALUES ('41', '14', '14', 'wechat', '113.246.203.190', '2018-06-15 19:03:52', '1', '2018-06-15 19:03:52', '2018-06-15 19:03:52');
INSERT INTO `wancll_user_visit_logs` VALUES ('42', '3', '3', 'applet', '113.246.200.165', '2018-06-15 19:08:07', '1', '2018-06-15 19:08:07', '2018-06-15 19:08:07');
INSERT INTO `wancll_user_visit_logs` VALUES ('43', '15', '15', 'applet', '113.246.200.165', '2018-06-15 19:08:39', '1', '2018-06-15 19:08:39', '2018-06-15 19:08:39');
INSERT INTO `wancll_user_visit_logs` VALUES ('44', '10', '10', 'applet', '113.246.200.165', '2018-06-15 19:08:41', '1', '2018-06-15 19:08:41', '2018-06-15 19:08:41');
INSERT INTO `wancll_user_visit_logs` VALUES ('45', '15', '15', 'applet', '117.136.24.179', '2018-06-16 09:50:04', '1', '2018-06-16 09:50:04', '2018-06-16 09:50:04');
INSERT INTO `wancll_user_visit_logs` VALUES ('46', '11', '11', 'pc', '175.8.204.205', '2018-06-16 10:09:01', '1', '2018-06-16 10:09:01', '2018-06-16 10:09:01');
INSERT INTO `wancll_user_visit_logs` VALUES ('47', '16', '16', 'pc', '175.8.204.205', '2018-06-16 11:53:22', '1', '2018-06-16 11:53:22', '2018-06-16 11:53:22');
INSERT INTO `wancll_user_visit_logs` VALUES ('48', '9', '9', 'pc', '175.8.204.205', '2018-06-16 12:04:17', '1', '2018-06-16 12:04:17', '2018-06-16 12:04:17');
INSERT INTO `wancll_user_visit_logs` VALUES ('49', '3', '3', 'wap', '113.246.200.165', '2018-06-16 15:51:42', '1', '2018-06-16 15:51:42', '2018-06-16 15:51:42');
INSERT INTO `wancll_user_visit_logs` VALUES ('50', '7', '7', 'app', '223.104.131.166', '2018-06-17 08:41:46', '1', '2018-06-17 08:41:46', '2018-06-17 08:41:46');
INSERT INTO `wancll_user_visit_logs` VALUES ('51', '7', '7', 'wechat', '223.104.131.166', '2018-06-17 08:44:35', '1', '2018-06-17 08:44:35', '2018-06-17 08:44:35');
INSERT INTO `wancll_user_visit_logs` VALUES ('52', '3', '3', 'pc', '113.247.12.35', '2018-06-19 09:56:09', '1', '2018-06-19 09:56:09', '2018-06-19 09:56:09');
INSERT INTO `wancll_user_visit_logs` VALUES ('53', '17', '17', 'wechat', '113.247.51.0', '2018-06-19 11:50:19', '1', '2018-06-19 11:50:19', '2018-06-19 11:50:19');
INSERT INTO `wancll_user_visit_logs` VALUES ('54', '4', '4', 'applet', '113.247.51.0', '2018-06-19 13:48:13', '1', '2018-06-19 13:48:13', '2018-06-19 13:48:13');
INSERT INTO `wancll_user_visit_logs` VALUES ('55', '4', '4', 'pc', '113.247.51.0', '2018-06-19 13:59:06', '1', '2018-06-19 13:59:06', '2018-06-19 13:59:06');
INSERT INTO `wancll_user_visit_logs` VALUES ('56', '4', '4', 'wap', '113.247.51.0', '2018-06-19 14:00:12', '1', '2018-06-19 14:00:12', '2018-06-19 14:00:12');
INSERT INTO `wancll_user_visit_logs` VALUES ('57', '18', '18', 'wap', '106.17.13.125', '2018-06-19 14:08:37', '1', '2018-06-19 14:08:37', '2018-06-19 14:08:37');
INSERT INTO `wancll_user_visit_logs` VALUES ('58', '18', '18', 'wechat', '106.17.13.125', '2018-06-19 14:17:23', '1', '2018-06-19 14:17:23', '2018-06-19 14:17:23');
INSERT INTO `wancll_user_visit_logs` VALUES ('59', '18', '18', 'wechat', '106.17.13.125', '2018-06-19 14:17:48', '1', '2018-06-19 14:17:48', '2018-06-19 14:17:48');
INSERT INTO `wancll_user_visit_logs` VALUES ('60', '19', '19', 'app', '113.247.51.0', '2018-06-19 14:27:02', '1', '2018-06-19 14:27:02', '2018-06-19 14:27:02');
INSERT INTO `wancll_user_visit_logs` VALUES ('61', '11', '11', 'pc', '113.247.51.0', '2018-06-19 17:42:03', '1', '2018-06-19 17:42:03', '2018-06-19 17:42:03');
INSERT INTO `wancll_user_visit_logs` VALUES ('62', '4', '4', 'wap', '113.247.51.0', '2018-06-19 18:38:31', '1', '2018-06-19 18:38:31', '2018-06-19 18:38:31');
INSERT INTO `wancll_user_visit_logs` VALUES ('63', '1', '1', 'wap', '113.247.51.0', '2018-06-19 18:40:57', '1', '2018-06-19 18:40:57', '2018-06-19 18:40:57');
INSERT INTO `wancll_user_visit_logs` VALUES ('64', '4', '4', 'applet', '113.247.50.169', '2018-06-20 08:51:28', '1', '2018-06-20 08:51:28', '2018-06-20 08:51:28');
INSERT INTO `wancll_user_visit_logs` VALUES ('65', '4', '4', 'wap', '113.247.50.169', '2018-06-20 08:52:48', '1', '2018-06-20 08:52:48', '2018-06-20 08:52:48');
INSERT INTO `wancll_user_visit_logs` VALUES ('66', '1', '1', 'wap', '113.247.50.169', '2018-06-20 08:56:25', '1', '2018-06-20 08:56:25', '2018-06-20 08:56:25');
INSERT INTO `wancll_user_visit_logs` VALUES ('67', '1', '1', 'applet', '113.247.50.169', '2018-06-20 08:57:32', '1', '2018-06-20 08:57:32', '2018-06-20 08:57:32');
INSERT INTO `wancll_user_visit_logs` VALUES ('68', '15', '15', 'pc', '113.247.12.35', '2018-06-20 10:29:59', '1', '2018-06-20 10:29:59', '2018-06-20 10:29:59');
INSERT INTO `wancll_user_visit_logs` VALUES ('69', '15', '15', 'wap', '113.247.12.35', '2018-06-20 10:45:54', '1', '2018-06-20 10:45:54', '2018-06-20 10:45:54');
INSERT INTO `wancll_user_visit_logs` VALUES ('70', '20', '20', 'wechat', '223.104.131.222', '2018-06-20 11:22:33', '1', '2018-06-20 11:22:33', '2018-06-20 11:22:33');
INSERT INTO `wancll_user_visit_logs` VALUES ('71', '15', '15', 'wechat', '113.247.12.35', '2018-06-20 11:47:40', '1', '2018-06-20 11:47:40', '2018-06-20 11:47:40');
INSERT INTO `wancll_user_visit_logs` VALUES ('72', '21', '21', 'applet', '113.247.12.35', '2018-06-20 14:14:33', '1', '2018-06-20 14:14:33', '2018-06-20 14:14:33');
INSERT INTO `wancll_user_visit_logs` VALUES ('73', '7', '7', 'wap', '192.168.31.125', '2018-06-22 09:51:09', '1', '2018-06-22 09:51:09', '2018-06-22 09:51:09');
INSERT INTO `wancll_user_visit_logs` VALUES ('74', '7', '7', 'wap', '127.0.0.1', '2018-06-22 14:29:50', '1', '2018-06-22 14:29:50', '2018-06-22 14:29:50');
INSERT INTO `wancll_user_visit_logs` VALUES ('75', '22', '22', 'wap', '192.168.31.60', '2018-06-23 11:14:23', '1', '2018-06-23 11:14:23', '2018-06-23 11:14:23');
INSERT INTO `wancll_user_visit_logs` VALUES ('76', '23', '23', 'wap', '192.168.31.60', '2018-06-23 11:17:10', '1', '2018-06-23 11:17:10', '2018-06-23 11:17:10');
INSERT INTO `wancll_user_visit_logs` VALUES ('77', '24', '24', 'wap', '192.168.31.60', '2018-06-23 11:18:04', '1', '2018-06-23 11:18:04', '2018-06-23 11:18:04');
INSERT INTO `wancll_user_visit_logs` VALUES ('78', '4', '4', 'wap', '192.168.31.60', '2018-06-25 10:40:36', '1', '2018-06-25 10:40:36', '2018-06-25 10:40:36');
INSERT INTO `wancll_user_visit_logs` VALUES ('79', '24', '24', 'wap', '192.168.31.60', '2018-06-27 21:01:54', '1', '2018-06-27 21:01:54', '2018-06-27 21:01:54');

-- -----------------------------
-- Table structure for `wancll_users`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_users`;
CREATE TABLE `wancll_users` (
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
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0假删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_users`
-- -----------------------------
INSERT INTO `wancll_users` VALUES ('1', '18100000001', '', '01', '', '0', '', '160222222', '1601111111', '1601115805@qq.com', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '', '\"\"', '2018-06-15 09:36:25', '1', '2', '', '', '2018-06-15 09:36:25', '1', '2', '1', '1', '2018-06-15 09:36:25', '2018-06-15 11:52:09');
INSERT INTO `wancll_users` VALUES ('2', '18390916324', '', '车车车车', 'http://thirdwx.qlogo.cn/mmopen/vi_32/x9U78tCoyfh8CbSBPDGqkCxXaI7fXgx5j4X5nU3qeUppiaIWbqIueLS4NeslRt6TFia7BkgXiaVicBia9Qhy6KXXldw/132', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-15 09:38:43', '1', '1', '', '', '2018-06-15 09:38:43', '1', '1', '1', '1', '2018-06-15 09:38:43', '2018-06-15 09:38:43');
INSERT INTO `wancll_users` VALUES ('3', '15200597371', '', '测试', '', '0', '', '000000000', '000000000', '000000000@00.com', '湖南省', '430000', '长沙市', '430100', '长沙县', '430121', '', '\"\"', '2018-06-15 09:41:19', '1', '1', '', '', '2018-06-15 09:41:19', '1', '1', '1', '1', '2018-06-15 09:41:19', '2018-06-15 09:51:18');
INSERT INTO `wancll_users` VALUES ('4', '18888888888', '', 'test', '/public/upload/applet/wx52581b0db255061b.o6zAJs6Y65pbVCTu-ygUlJFnIPe0.DLjQADgFMeJm9b85f34f762a478d37ddb0e492248e76.png', '0', '', '2234242', '121', '23sfsaf1@qq.com', '天津市', '120000', '市辖区', '120100', '河东区', '120102', '', '\"\"', '2018-06-15 09:42:45', '1', '1', '4', '#4#', '2018-06-15 09:42:45', '1', '1', '1', '1', '2018-06-15 09:42:45', '2018-06-19 13:48:33');
INSERT INTO `wancll_users` VALUES ('5', '18100000002', '', '02', '', '0', '', '1601115805', '1601115805', '1601115805@qq.com', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '', '\"\"', '2018-06-15 09:55:59', '1', '2', '1', '#1#', '2018-06-15 09:55:59', '1', '2', '1', '1', '2018-06-15 09:55:59', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('6', '18100000003', '', '03', '', '0', '', '1601115805', '1601115805', '1601115805@qq.com', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '', '\"\"', '2018-06-15 09:56:31', '1', '4', '5', '#1#5#', '2018-06-15 09:56:31', '1', '2', '1', '1', '2018-06-15 09:56:31', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('7', '15580841403', '', '易云', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKr3nkt5a7JGiacHE6ucudCBB5ScfHvbWWxNdF4iaM0hFBI7y5S7kncNhxIgkmmBqxAd2mU3z5jM6Xg/132', '0', '', '2630110384', '13583358385', '2630110384@qq.com', '北京市', '110000', '市辖区', '110100', '朝阳区', '110105', '', '\"\"', '2018-06-15 10:30:10', '1', '4', '', '', '2018-06-15 10:30:10', '1', '4', '1', '1', '2018-06-15 10:30:10', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('8', '18111111111', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-15 10:48:05', '1', '1', '', '', '2018-06-15 10:48:05', '1', '1', '1', '1', '2018-06-15 10:48:05', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('9', '13973131356', '', '朱老大', 'http://thirdwx.qlogo.cn/mmopen/vi_32/kdUgMfkYTECUsibYsWbTzUI3oicybItyXnbwxV5ibNgnSAVCicUDZAPPjl3EZK2MITmBYnlJ2uoEqwHfjaLklFQCRA/132', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-15 18:15:28', '1', '1', '', '', '2018-06-15 14:01:23', '1', '1', '1', '1', '2018-06-15 14:01:23', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('10', '18390911268', '', '_1024', 'http://thirdwx.qlogo.cn/mmopen/vi_32/NCgkpy3LsM5ibz6L9Oe5MKbR4hcm4jgUr17w9XEiaSxzA54CYXPiaZE8QpSpkSpeDfCiaLR6Yfb6UpgFfVLlrAdgnQ/132', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-15 18:23:07', '1', '1', '', '', '2018-06-15 18:23:07', '1', '1', '1', '1', '2018-06-15 18:23:07', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('11', '15675143940', '', '毛陀', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLiaO18iaqiclJTDl8Hpz6vCjnQ9DGKfhZic75yBR0qZhkXLbZ6r2icsahBePBMuPiaIuKJNQ4Agh4s6ictQ/132', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-15 18:52:03', '1', '1', '', '', '2018-06-15 18:52:03', '1', '1', '1', '1', '2018-06-15 18:52:03', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('12', '18888888887', '', '朱老大', 'http://thirdwx.qlogo.cn/mmopen/vi_32/kdUgMfkYTECUsibYsWbTzUI3oicybItyXnbwxV5ibNgnSAVCicUDZAPPjl3EZK2MITmBYnlJ2uoEqwHfjaLklFQCRA/132', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-15 18:56:11', '1', '1', '', '', '2018-06-15 18:56:11', '1', '1', '1', '1', '2018-06-15 18:56:11', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('13', '18390911267', '', '朱老大', 'http://thirdwx.qlogo.cn/mmopen/vi_32/kdUgMfkYTECUsibYsWbTzUI3oicybItyXnbwxV5ibNgnSAVCicUDZAPPjl3EZK2MITmBYnlJ2uoEqwHfjaLklFQCRA/132', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-15 18:59:36', '1', '1', '', '', '2018-06-15 18:59:36', '1', '1', '1', '1', '2018-06-15 18:59:36', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('14', '13973131354', '', '朱老大', 'http://thirdwx.qlogo.cn/mmopen/vi_32/kdUgMfkYTECUsibYsWbTzUI3oicybItyXnbwxV5ibNgnSAVCicUDZAPPjl3EZK2MITmBYnlJ2uoEqwHfjaLklFQCRA/132', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-15 19:03:52', '1', '1', '', '', '2018-06-15 19:03:52', '1', '1', '1', '1', '2018-06-15 19:03:52', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('15', '18390926488', '', '周先生', '', '0', '', '1234568', '123456', '123456@qq.com', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '', '\"\"', '2018-06-15 19:08:39', '1', '1', '', '', '2018-06-15 19:08:39', '1', '1', '1', '1', '2018-06-15 19:08:39', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('16', '15802577957', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-16 11:53:22', '1', '1', '', '', '2018-06-16 11:53:22', '1', '1', '1', '1', '2018-06-16 11:53:22', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('17', '15874013247', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-19 11:50:19', '1', '1', '', '', '2018-06-19 11:50:19', '1', '1', '1', '1', '2018-06-19 11:50:19', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('18', '18175974828', '', '1', '', '0', '', '1601111111', '1601111111', '1601111111@qq.com', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '', '\"\"', '2018-06-19 14:08:37', '1', '1', '', '', '2018-06-19 14:08:37', '1', '1', '1', '1', '2018-06-19 14:08:37', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('19', '13117512114', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-19 14:27:02', '1', '1', '', '', '2018-06-19 14:27:02', '1', '1', '1', '1', '2018-06-19 14:27:02', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('20', '15111063940', '', '段维', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLzZksv9tKto0UYoSexXrUhpufU8sBZdibFxLUtjDL7NlGpoPbPQbHfuVvPQakhmprgxMGmC10ZKUA/132', '0', '', '406676479', '15111063940', '406676479@qq.com', '湖南省', '430000', '长沙市', '430100', '长沙县', '430121', '', '\"\"', '2018-06-20 11:22:33', '1', '1', '', '', '2018-06-20 11:22:33', '1', '1', '1', '1', '2018-06-20 11:22:33', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('21', '17608491855', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-20 14:14:33', '1', '1', '', '', '2018-06-20 14:14:33', '1', '1', '1', '1', '2018-06-20 14:14:33', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('22', '15666666666', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-23 11:14:23', '1', '1', '', '', '2018-06-23 11:14:23', '1', '1', '1', '1', '2018-06-23 11:14:22', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('23', '15444444444', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '\"\"', '2018-06-23 11:17:10', '1', '1', '', '', '2018-06-23 11:17:10', '1', '1', '1', '1', '2018-06-23 11:17:10', '2018-06-27 21:00:30');
INSERT INTO `wancll_users` VALUES ('24', '18888888886', '', '幅度萨芬打法', '/public/upload/user_avatar_images/20180627\\de1e3e9c6b8e4cc49a92e1df1f6adb34.jpg', '1', '18888888888', '423141234', '3412341325', '34143@afd.com', '', '', '', '', '', '', '大发噶发的噶的撒的撒范德萨', '\"\"', '2018-06-23 11:18:04', '1', '1', '', '', '2018-06-23 11:18:04', '1', '1', '1', '1', '2018-06-23 11:18:04', '2018-06-27 21:00:30');

-- -----------------------------
-- Table structure for `wancll_wechat`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_wechat`;
CREATE TABLE `wancll_wechat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jsapi_ticket` text,
  `last_ticket_time` int(11) DEFAULT NULL,
  `access_token` text,
  `last_token_time` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_wechat`
-- -----------------------------
INSERT INTO `wancll_wechat` VALUES ('1', 'sM4AOVdWfPE4DxkXGEs8VATrVRgaBnIuWF9DKdkYdvG5RtAQ_W7lM_stcGbuEYWMjQFTCIPO-DT0kQLEQmWDpw', '1520349729', '7_D6xharWLxLie9YHAhvhquD5_kV4a1oZ2iFlmYLiqagCm-nDP6BUJKdBZzEuAub-3gHaDRgWaDi5eRwqnJNlSqt1OSRx3OmMODi2aiBIT8dedKoV448ZXJW-rjW8AYMeAEAOMA', '1520349698', '2018-03-05 16:13:53');
