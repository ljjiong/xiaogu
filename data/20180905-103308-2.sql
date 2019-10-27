
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_activity_coupons`
-- -----------------------------
INSERT INTO `wancll_activity_coupons` VALUES ('1', 'C2018090310383967268', '7', 'full', '2018-09-30 00:00:00', '1000.00', '100.00', '100', '2', '1', '1', '2018-09-03 10:38:39', '2018-09-03 10:38:39');
INSERT INTO `wancll_activity_coupons` VALUES ('2', 'C2018090310385679967', '8', 'full', '2018-09-30 00:00:00', '10000.00', '1000.00', '100', '2', '1', '1', '2018-09-03 10:38:56', '2018-09-03 10:38:56');
INSERT INTO `wancll_activity_coupons` VALUES ('3', 'C2018090310393506234', '5', 'discount', '2018-09-30 00:00:00', '1000.00', '5.00', '100', '2', '1', '1', '2018-09-03 10:39:35', '2018-09-03 10:39:35');
INSERT INTO `wancll_activity_coupons` VALUES ('4', 'C2018090310395027402', '2', 'discount', '2018-09-30 00:00:00', '10000.00', '7.00', '100', '2', '1', '1', '2018-09-03 10:39:50', '2018-09-03 10:39:50');
INSERT INTO `wancll_activity_coupons` VALUES ('5', 'C2018090409553440611', '8', 'discount', '2018-09-30 00:00:00', '100000.00', '1.00', '1000', '1', '1', '1', '2018-09-04 09:55:34', '2018-09-04 09:55:34');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_activity_discount_rules`
-- -----------------------------
INSERT INTO `wancll_activity_discount_rules` VALUES ('1', '1', '6', '1.00', '[3]', '2', '10', '0', '1', '1', '2018-08-24 13:58:14', '2018-08-24 13:58:14');
INSERT INTO `wancll_activity_discount_rules` VALUES ('2', '6', '5', '3.00', '[2]', '3', '2', '0', '1', '1', '2018-08-27 18:12:24', '2018-08-27 18:12:24');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_activity_full_rules`
-- -----------------------------
INSERT INTO `wancll_activity_full_rules` VALUES ('1', '3', '[1]', '4.00', '4.00', '1', '1', '2018-08-27 18:10:26', '2018-08-27 18:10:26');
INSERT INTO `wancll_activity_full_rules` VALUES ('2', '4', '[2,3,4,5,6]', '100.00', '10.00', '1', '1', '2018-08-27 18:12:40', '2018-08-27 18:12:40');

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_addresses`
-- -----------------------------
INSERT INTO `wancll_addresses` VALUES ('1', '2', '测试', '15580841403', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '', '', '0', '0', '0', '2018-07-23 15:26:30', '2018-09-01 16:54:28');
INSERT INTO `wancll_addresses` VALUES ('2', '3', 'KBellX', '15581646116', '浙江省', '330000', '台州市', '331000', '温岭市', '331081', 'dadw', '', '', '1', '0', '1', '2018-07-28 09:13:55', '2018-07-28 09:13:55');
INSERT INTO `wancll_addresses` VALUES ('3', '4', 'KBellX2', '15581646117', '天津市', '120000', '市辖区', '120100', '宝坻区', '120115', '111', '', '', '1', '0', '1', '2018-07-28 10:01:02', '2018-07-28 10:01:02');
INSERT INTO `wancll_addresses` VALUES ('4', '5', '韩梅梅', '15636925814', '湖南省', '430000', '长沙市', '430100', '长沙县', '430121', '开源鑫贸大楼906', '', '', '1', '0', '1', '2018-07-28 10:51:11', '2018-07-28 10:51:11');
INSERT INTO `wancll_addresses` VALUES ('5', '6', '韩梅梅', '18364524564', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '北京我的家', '', '', '1', '0', '1', '2018-07-28 14:47:12', '2018-07-28 14:47:12');
INSERT INTO `wancll_addresses` VALUES ('6', '7', '酒后', '18111111111', '天津市', '120000', '市辖区', '120100', '河东区', '120102', '。。。', '', '', '1', '0', '1', '2018-07-30 11:15:45', '2018-07-30 11:15:45');
INSERT INTO `wancll_addresses` VALUES ('7', '8', '李舟', '18177777777', '广东省', '440000', '潮州市', '445100', '湘桥区', '445102', '1', '', '', '1', '0', '1', '2018-07-30 11:54:09', '2018-07-30 11:54:09');
INSERT INTO `wancll_addresses` VALUES ('8', '1', 'fds', '18888888888', '河北省', '130000', '秦皇岛市', '130300', '海港区', '130302', 'fdf', '', '', '1', '0', '1', '2018-08-08 15:21:41', '2018-08-08 15:21:41');
INSERT INTO `wancll_addresses` VALUES ('9', '12', '郭', '15071357538', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '245555', '', '', '1', '0', '1', '2018-08-23 23:24:22', '2018-08-23 23:24:22');
INSERT INTO `wancll_addresses` VALUES ('10', '2', '哈哈', '18390911268', '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '鄂托克前旗', '150623', '含苞待放', '', '', '1', '0', '0', '2018-08-31 16:07:45', '2018-09-01 16:54:26');
INSERT INTO `wancll_addresses` VALUES ('11', '17', '1', '13800000000', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '', '1', '0', '1', '2018-08-31 16:42:51', '2018-08-31 16:42:51');
INSERT INTO `wancll_addresses` VALUES ('12', '18', '1', '11111111111', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '', '0', '0', '0', '2018-08-31 17:03:48', '2018-09-01 15:49:23');
INSERT INTO `wancll_addresses` VALUES ('13', '18', '1', '12345678901', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '', '0', '0', '0', '2018-09-01 14:00:55', '2018-09-01 14:01:05');
INSERT INTO `wancll_addresses` VALUES ('14', '18', '1', '12345678901', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '', '0', '0', '0', '2018-09-01 14:00:56', '2018-09-01 14:01:03');
INSERT INTO `wancll_addresses` VALUES ('15', '18', '1', '12345678901', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '', '1', '0', '0', '2018-09-01 14:00:56', '2018-09-01 14:01:02');
INSERT INTO `wancll_addresses` VALUES ('16', '18', '1', '11111111111', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '', '1', '0', '1', '2018-09-01 15:49:36', '2018-09-01 15:49:36');
INSERT INTO `wancll_addresses` VALUES ('17', '2', '1', '13874930708', '浙江省', '330000', '丽水市', '331100', '龙泉市', '331181', '1', '', '', '1', '0', '0', '2018-09-03 17:43:29', '2018-09-04 10:34:36');
INSERT INTO `wancll_addresses` VALUES ('18', '2', '1', '13874930000', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '', '0', '0', '1', '2018-09-04 10:35:16', '2018-09-04 10:35:42');
INSERT INTO `wancll_addresses` VALUES ('19', '2', '1', '13874960708', '北京市', '110000', '市辖区', '110100', '朝阳区', '110105', '1', '', '', '1', '0', '1', '2018-09-04 10:35:42', '2018-09-04 10:35:42');
INSERT INTO `wancll_addresses` VALUES ('20', '14', '12', '12345678901', '上海市', '310000', '市辖区', '310100', '金山区', '310116', '1', '', '', '1', '0', '1', '2018-09-04 10:41:44', '2018-09-04 10:41:44');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_accounts`
-- -----------------------------
INSERT INTO `wancll_admin_accounts` VALUES ('1', 'super', '18002797d30d04fdc5fe16aceec36d47', '1', '1', '2018-04-10 16:40:36', '2018-09-03 10:38:16');
INSERT INTO `wancll_admin_accounts` VALUES ('2', 'admin', 'b5305e8c4c5e08c246943fe736701525', '2', '1', '2018-04-10 16:40:48', '2018-09-03 10:38:39');
INSERT INTO `wancll_admin_accounts` VALUES ('3', 'test', 'b5305e8c4c5e08c246943fe736701525', '3', '0', '2018-04-11 10:22:20', '2018-04-11 10:30:41');
INSERT INTO `wancll_admin_accounts` VALUES ('4', 'test', 'b5305e8c4c5e08c246943fe736701525', '4', '0', '2018-04-11 14:09:07', '2018-09-03 10:37:56');
INSERT INTO `wancll_admin_accounts` VALUES ('5', 'df', 'e6297b585db794e177808f8953b46669', '5', '0', '2018-06-29 11:59:02', '2018-09-03 10:37:53');
INSERT INTO `wancll_admin_accounts` VALUES ('6', 'testadmin', 'b5305e8c4c5e08c246943fe736701525', '6', '0', '2018-08-24 09:52:10', '2018-09-03 10:37:39');
INSERT INTO `wancll_admin_accounts` VALUES ('7', '1', '5f6a0a6526c1fee9485551c9f94aa66b', '7', '0', '2018-09-04 09:48:51', '2018-09-04 09:49:07');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_assets`
-- -----------------------------
INSERT INTO `wancll_admin_assets` VALUES ('1', '5', '0.00', '0.00', '1', '2018-06-29 11:59:02', '2018-06-29 11:59:02');
INSERT INTO `wancll_admin_assets` VALUES ('2', '6', '0.00', '0.00', '1', '2018-08-24 09:52:10', '2018-08-24 09:52:10');
INSERT INTO `wancll_admin_assets` VALUES ('3', '7', '0.00', '0.00', '1', '2018-09-04 09:48:51', '2018-09-04 09:48:51');

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
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_tokens`
-- -----------------------------
INSERT INTO `wancll_admin_tokens` VALUES ('36', '2', '2', 'pc', 'admin&pc@0f835d796be30c4b2c5c330b9e658656', 'admin&pc@1fc2043f408f357276cc49d45ca4fc7f', '7200', '1', '2018-08-01 08:56:12', '2018-08-01 08:56:12');
INSERT INTO `wancll_admin_tokens` VALUES ('2', '2', '2', 'pc', 'admin&pc@08b38fb588e53f3cc91d60d2dafc5733', 'admin&pc@d70480ddf640b8151c0484e15c57265e', '7200', '1', '2018-07-20 09:01:51', '2018-07-20 09:01:51');
INSERT INTO `wancll_admin_tokens` VALUES ('10', '2', '2', 'pc', 'admin&pc@ad8cb29d64bad194475ebff5801bf7bd', 'admin&pc@c30452f288b87a1ff82379d4e60f0089', '7200', '1', '2018-07-24 16:51:57', '2018-07-24 16:51:57');
INSERT INTO `wancll_admin_tokens` VALUES ('4', '2', '2', 'pc', 'admin&pc@5cfcff9626cff00c3b852c7dd899d919', 'admin&pc@a7dd93d3117901532192a3a86647aff7', '7200', '1', '2018-07-20 18:30:38', '2018-07-20 18:30:38');
INSERT INTO `wancll_admin_tokens` VALUES ('22', '2', '2', 'pc', 'admin&pc@572862cd0eb8a60982d43aa9460b0a8c', 'admin&pc@560ee875ec6d81bf49f522778106f40c', '7200', '1', '2018-07-27 14:04:13', '2018-07-27 14:04:13');
INSERT INTO `wancll_admin_tokens` VALUES ('145', '2', '2', 'pc', 'admin&pc@d2de18d7b7f1b38dec368f7ad77fc978', 'admin&pc@0bec4600075db3675134fa2e35826662', '7200', '1', '2018-09-04 19:52:31', '2018-09-04 19:52:31');
INSERT INTO `wancll_admin_tokens` VALUES ('9', '2', '2', 'pc', 'admin&pc@86bcf5120e4a090f2bedee1296222877', 'admin&pc@bb59c55150397b4e89eb9fc686017155', '7200', '1', '2018-07-24 16:26:13', '2018-07-24 16:26:13');
INSERT INTO `wancll_admin_tokens` VALUES ('11', '2', '2', 'pc', 'admin&pc@bd9f105808d5dba5ea6051fbb3ad46a0', 'admin&pc@5650177e1e84ea12804c00c88bfba3cf', '7200', '1', '2018-07-24 21:28:37', '2018-07-24 21:28:37');
INSERT INTO `wancll_admin_tokens` VALUES ('12', '2', '2', 'pc', 'admin&pc@18474d1755e0bb15c1cc4fc65ea9411d', 'admin&pc@131f93a7f46f2893625d8060c92a343d', '7200', '1', '2018-07-25 07:12:24', '2018-07-25 07:12:24');
INSERT INTO `wancll_admin_tokens` VALUES ('13', '2', '2', 'pc', 'admin&pc@da749a3fa6309fbea5299dcea519a047', 'admin&pc@b1a9cfc2f296d2785d1a36d77d2ca3c8', '7200', '1', '2018-07-25 07:20:45', '2018-07-25 07:20:45');
INSERT INTO `wancll_admin_tokens` VALUES ('14', '2', '2', 'pc', 'admin&pc@f045b3106310e0b7179aed37c2639c02', 'admin&pc@3b39ba772d0054070a0df2bc5fdd4704', '7200', '1', '2018-07-25 07:25:55', '2018-07-25 07:25:55');
INSERT INTO `wancll_admin_tokens` VALUES ('15', '2', '2', 'pc', 'admin&pc@f1e78bc65f2ff7d8485b77bde28b6839', 'admin&pc@57482802ec145014e33754d20558eeaa', '7200', '1', '2018-07-25 07:32:19', '2018-07-25 07:32:19');
INSERT INTO `wancll_admin_tokens` VALUES ('16', '2', '2', 'pc', 'admin&pc@4b3823c444e13baad7d3f76a301d9baa', 'admin&pc@b22b58a687edb860011c50f623361e25', '7200', '1', '2018-07-25 07:38:42', '2018-07-25 07:38:42');
INSERT INTO `wancll_admin_tokens` VALUES ('17', '2', '2', 'pc', 'admin&pc@c765110a23c0d446cc5538f569cb9650', 'admin&pc@be110ec907f1890db1c716a29563f59b', '7200', '1', '2018-07-25 10:06:29', '2018-07-25 10:06:29');
INSERT INTO `wancll_admin_tokens` VALUES ('18', '2', '2', 'pc', 'admin&pc@cb2e2de40ccefacb9a808f780c016979', 'admin&pc@47726ad07440dc8603e80648cca53539', '7200', '1', '2018-07-25 10:36:13', '2018-07-25 10:36:13');
INSERT INTO `wancll_admin_tokens` VALUES ('44', '2', '2', 'pc', 'admin&pc@43520cf46a735b46002e1c116701de84', 'admin&pc@1cbe8d6b9f6adffc5cc2b01387e5e0ed', '7200', '1', '2018-08-06 09:10:10', '2018-08-06 09:10:10');
INSERT INTO `wancll_admin_tokens` VALUES ('20', '2', '2', 'pc', 'admin&pc@93b0c89dfded8d85c5985ccff3ed8ed5', 'admin&pc@ea0e170026a719b6738980e1fb5c40a7', '7200', '1', '2018-07-25 10:46:35', '2018-07-25 10:46:35');
INSERT INTO `wancll_admin_tokens` VALUES ('24', '2', '2', 'pc', 'admin&pc@20dcf350c9800e5a3e78197d997e7927', 'admin&pc@d9524d3fe7270ad61f229feab7e2c88b', '7200', '1', '2018-07-27 19:37:39', '2018-07-27 19:37:39');
INSERT INTO `wancll_admin_tokens` VALUES ('70', '2', '2', 'pc', 'admin&pc@089b54468dd1413806a1bd16b1978bcc', 'admin&pc@8f7f6d2acb14a59b7554b87471db98d1', '7200', '1', '2018-08-21 17:46:13', '2018-08-21 17:46:13');
INSERT INTO `wancll_admin_tokens` VALUES ('26', '2', '2', 'pc', 'admin&pc@c38f0733d66d15a76bd094da3dbf3ef6', 'admin&pc@d8173211528330c82c1dd3ad87933073', '7200', '1', '2018-07-28 08:41:23', '2018-07-28 08:41:23');
INSERT INTO `wancll_admin_tokens` VALUES ('66', '2', '2', 'pc', 'admin&pc@07aa72d2192ac48a09246469a17e9da5', 'admin&pc@417d135feff56c5b58f6751c9da4ba72', '7200', '1', '2018-08-17 11:38:21', '2018-08-17 11:38:21');
INSERT INTO `wancll_admin_tokens` VALUES ('77', '2', '2', 'pc', 'admin&pc@9c789093aa37f615ba5f4325a96125d1', 'admin&pc@265e0c4cebeb715d28e82a26cd2c323b', '7200', '1', '2018-08-24 09:12:07', '2018-08-24 09:12:07');
INSERT INTO `wancll_admin_tokens` VALUES ('104', '2', '2', 'pc', 'admin&pc@aeb20d040a63c6bd9459fcae78aa9b36', 'admin&pc@36ddcf1a87422f426929642b404e3012', '7200', '1', '2018-08-28 18:02:32', '2018-08-29 09:20:31');
INSERT INTO `wancll_admin_tokens` VALUES ('35', '2', '2', 'pc', 'admin&pc@6d5ee40fb2c1d6e509231118ea3b651a', 'admin&pc@fc34ed0b2ecc971fee64af40b31e6931', '7200', '1', '2018-07-31 22:42:24', '2018-07-31 22:42:24');
INSERT INTO `wancll_admin_tokens` VALUES ('56', '2', '2', 'pc', 'admin&pc@62d5bf59b7c26a1fc6467bcc45c8144b', 'admin&pc@383eb4006405729de1a6f95bc5b7c369', '7200', '1', '2018-08-11 08:52:26', '2018-08-11 08:52:26');
INSERT INTO `wancll_admin_tokens` VALUES ('42', '2', '2', 'pc', 'admin&pc@e42126128dd5d2d0b2a3851c547fa098', 'admin&pc@1440806d67e4b2282a3b1c487bdb9f14', '7200', '1', '2018-08-04 18:55:12', '2018-08-04 18:55:12');
INSERT INTO `wancll_admin_tokens` VALUES ('46', '2', '2', 'pc', 'admin&pc@c4dec40ca1fb16b8f188891dbdabc664', 'admin&pc@64ddc49731808f3d5fe8c4c4ef81fc6e', '7200', '1', '2018-08-06 15:00:25', '2018-08-06 15:00:25');
INSERT INTO `wancll_admin_tokens` VALUES ('49', '2', '2', 'pc', 'admin&pc@404dfc1514b2d3227ca1e6c1467c1a7b', 'admin&pc@4382e3ac7e77df302724b8bd5f3fef5b', '7200', '1', '2018-08-07 13:55:32', '2018-08-07 13:55:32');
INSERT INTO `wancll_admin_tokens` VALUES ('137', '2', '2', 'pc', 'admin&pc@fe7b851434286e0066d9aee9e3c33c8f', 'admin&pc@634d3dd332250e6f3035687922dd6d81', '7200', '1', '2018-09-03 15:48:15', '2018-09-03 15:48:15');
INSERT INTO `wancll_admin_tokens` VALUES ('51', '2', '2', 'pc', 'admin&pc@5715de32b9eadf0456107fe7c09cabf3', 'admin&pc@e5ef55687523463e86a200f37a2b9d8b', '7200', '1', '2018-08-08 08:54:56', '2018-08-08 08:54:56');
INSERT INTO `wancll_admin_tokens` VALUES ('89', '2', '2', 'pc', 'admin&pc@c8542ec068dbe3f9e7e492a83ee3f632', 'admin&pc@49e1596d95f25a09768af3a16a559682', '7200', '1', '2018-08-25 14:23:01', '2018-08-25 14:23:01');
INSERT INTO `wancll_admin_tokens` VALUES ('55', '2', '2', 'pc', 'admin&pc@e5d92b14141d46ad171a693ae40fce09', 'admin&pc@a06a208fa685a603b65fab43b0390de1', '7200', '1', '2018-08-10 17:19:33', '2018-08-10 17:19:33');
INSERT INTO `wancll_admin_tokens` VALUES ('126', '2', '2', 'pc', 'admin&pc@daccbcd599f712314189c1986bd5d9f8', 'admin&pc@457c8e64fd4783014d28209aeb27696c', '7200', '1', '2018-09-03 09:04:11', '2018-09-03 09:04:11');
INSERT INTO `wancll_admin_tokens` VALUES ('63', '2', '2', 'pc', 'admin&pc@5098cdeb248977584c2435dfa08ac8ff', 'admin&pc@d7b314c56c4880f51e33f44bdd49bf6d', '7200', '1', '2018-08-16 10:12:59', '2018-08-16 10:12:59');
INSERT INTO `wancll_admin_tokens` VALUES ('64', '2', '2', 'pc', 'admin&pc@377aeb35dbeb48c17ea876be00a43a63', 'admin&pc@60078b275ba6b6847708eaee40ac2abc', '7200', '1', '2018-08-16 10:54:02', '2018-08-16 10:54:02');
INSERT INTO `wancll_admin_tokens` VALUES ('68', '2', '2', 'pc', 'admin&pc@3956eda897910294a39d3c432eeda3bf', 'admin&pc@32516dc2bcbecaf3bb6ed98dfd82d566', '7200', '1', '2018-08-19 21:05:00', '2018-08-19 21:05:00');
INSERT INTO `wancll_admin_tokens` VALUES ('72', '2', '2', 'pc', 'admin&pc@86fa27a044a6968e3ed1633fe0c03ccd', 'admin&pc@809d3b57937c7536da32b8680829cc11', '7200', '1', '2018-08-22 17:57:31', '2018-08-22 17:57:31');
INSERT INTO `wancll_admin_tokens` VALUES ('74', '2', '2', 'pc', 'admin&pc@886671c8ffd24dfec8a8122f919bbcf7', 'admin&pc@6b1b8a5344f7a8ba7f3a99219b8f539c', '7200', '1', '2018-08-23 00:33:42', '2018-08-23 00:33:42');
INSERT INTO `wancll_admin_tokens` VALUES ('75', '2', '2', 'pc', 'admin&pc@04b61c35d87cf1f0c3439773fcd72c8d', 'admin&pc@70d02741c2102559690cd23b1d19f693', '7200', '1', '2018-08-24 07:30:16', '2018-08-24 07:30:16');
INSERT INTO `wancll_admin_tokens` VALUES ('76', '2', '2', 'pc', 'admin&pc@6801deb707e5af88cb1e35957fbd8752', 'admin&pc@7ba7303149a4c509d70ee0f779964801', '7200', '1', '2018-08-24 07:58:27', '2018-08-24 07:58:27');
INSERT INTO `wancll_admin_tokens` VALUES ('78', '2', '2', 'pc', 'admin&pc@90c3244213e7ddb5127a1c73db70e2bb', 'admin&pc@79e9256c60a4c9092ff87bfbea3fff10', '7200', '1', '2018-08-24 09:44:14', '2018-08-24 09:44:14');
INSERT INTO `wancll_admin_tokens` VALUES ('123', '2', '2', 'pc', 'admin&pc@708ca4c309f4b09b6f8d09ab9aa4e479', 'admin&pc@0a788725f49d50de0c030551395ae782', '7200', '1', '2018-09-01 15:19:42', '2018-09-01 15:19:42');
INSERT INTO `wancll_admin_tokens` VALUES ('132', '2', '2', 'pc', 'admin&pc@e63e4d2a29d340d46cdcfbaa4e470fe9', 'admin&pc@114d456d06ec66fabadd4e385b820c61', '7200', '1', '2018-09-03 15:36:07', '2018-09-03 15:36:07');
INSERT INTO `wancll_admin_tokens` VALUES ('81', '2', '2', 'pc', 'admin&pc@257b1be8947284591b3cc3d68228cdde', 'admin&pc@90b4c0ee9e6353825eb545e80cc3b572', '7200', '1', '2018-08-24 11:32:54', '2018-08-24 11:32:54');
INSERT INTO `wancll_admin_tokens` VALUES ('130', '1', '1', 'pc', 'admin&pc@a2139414270dc8e631208bd42ae7650b', 'admin&pc@c4d661d1c00b8b59d1ab316801603b91', '7200', '1', '2018-09-03 10:39:09', '2018-09-03 10:39:09');
INSERT INTO `wancll_admin_tokens` VALUES ('83', '2', '2', 'pc', 'admin&pc@f5d8fd4465783e8316f83ee9ee199634', 'admin&pc@b50cd261a260ee405d857e699aebaaee', '7200', '1', '2018-08-24 11:38:17', '2018-08-24 11:38:17');
INSERT INTO `wancll_admin_tokens` VALUES ('84', '2', '2', 'pc', 'admin&pc@e1ae109dcbb5257bcc9c3d6b98c01847', 'admin&pc@3062b4bd2f72217ba2fc03f3ba2b5524', '7200', '1', '2018-08-24 11:39:03', '2018-08-24 11:39:03');
INSERT INTO `wancll_admin_tokens` VALUES ('129', '2', '2', 'pc', 'admin&pc@0da3a775d23367084ca592c662e331b2', 'admin&pc@69ef55f12559f9ca86376d18bf5c8d36', '7200', '1', '2018-09-03 10:38:47', '2018-09-03 10:38:47');
INSERT INTO `wancll_admin_tokens` VALUES ('86', '2', '2', 'pc', 'admin&pc@5cbbd41a9bdaaadb11cb43bee78c752b', 'admin&pc@8504d65d5eb2b255228c8a5fb903d09a', '7200', '1', '2018-08-24 13:43:08', '2018-08-24 13:43:08');
INSERT INTO `wancll_admin_tokens` VALUES ('88', '2', '2', 'pc', 'admin&pc@3cddb0f639bf9abbc1896660a8497eba', 'admin&pc@be53ec9514c2bf8b739fb863e67fb4d8', '7200', '1', '2018-08-24 16:03:00', '2018-08-24 16:03:00');
INSERT INTO `wancll_admin_tokens` VALUES ('90', '2', '2', 'pc', 'admin&pc@54496cb4ab2aab611870980b7c9a6d0a', 'admin&pc@4aad4b26f1d0c174b2020b29536f66d6', '7200', '1', '2018-08-25 14:37:32', '2018-08-25 14:37:32');
INSERT INTO `wancll_admin_tokens` VALUES ('91', '2', '2', 'pc', 'admin&pc@b13d7d94027d800310a0076b941533cb', 'admin&pc@ae2ee8e1118c6819701781a06ec6dd0f', '7200', '1', '2018-08-25 14:52:59', '2018-08-25 14:52:59');
INSERT INTO `wancll_admin_tokens` VALUES ('92', '2', '2', 'pc', 'admin&pc@e8bda8a1aef402315c674132365a141d', 'admin&pc@8794dcf531947835a56a88086e9f9f34', '7200', '1', '2018-08-26 10:55:18', '2018-08-26 10:55:18');
INSERT INTO `wancll_admin_tokens` VALUES ('98', '2', '2', 'pc', 'admin&pc@b6f6f13b01f954eaad5f08886c1f4a29', 'admin&pc@d269ce6da731b06f7f3a966192cb0ee3', '7200', '1', '2018-08-28 11:20:52', '2018-08-28 13:57:17');
INSERT INTO `wancll_admin_tokens` VALUES ('94', '2', '2', 'pc', 'admin&pc@50b3f7a5fc7b6ced81f6e2ad3c2345c1', 'admin&pc@86757e8e524306f3a8569872c209d2d9', '7200', '1', '2018-08-27 17:10:37', '2018-08-27 17:10:37');
INSERT INTO `wancll_admin_tokens` VALUES ('95', '2', '2', 'pc', 'admin&pc@67bb29eafb49299ad3cf76ce8dc9edad', 'admin&pc@1ccaf44c2a72022f8b4dd98d4b700e60', '7200', '1', '2018-08-27 18:50:13', '2018-08-27 18:50:13');
INSERT INTO `wancll_admin_tokens` VALUES ('96', '2', '2', 'pc', 'admin&pc@30c4d8de8169b268f19c4be35cbdd6e4', 'admin&pc@aed98037d8bcc815d6a1feccb5ed715d', '7200', '1', '2018-08-27 21:31:31', '2018-08-27 21:31:31');
INSERT INTO `wancll_admin_tokens` VALUES ('97', '2', '2', 'pc', 'admin&pc@17fe182783a03c8d78e197f7b4ade82f', 'admin&pc@f18864c9f05ca985d6053a01245f36ce', '7200', '1', '2018-08-28 09:59:37', '2018-08-28 09:59:37');
INSERT INTO `wancll_admin_tokens` VALUES ('99', '2', '2', 'pc', 'admin&pc@215326f29a12507ea2989e7af9c456e3', 'admin&pc@86fdef929695476f6b0f7d43475733a7', '7200', '1', '2018-08-28 14:03:35', '2018-08-28 14:03:35');
INSERT INTO `wancll_admin_tokens` VALUES ('100', '2', '2', 'pc', 'admin&pc@8d93780c3a9cc9b5bcebade015213a5e', 'admin&pc@623fb38f4c07b9e629e090afd2259f6e', '7200', '1', '2018-08-28 14:04:35', '2018-08-28 14:04:35');
INSERT INTO `wancll_admin_tokens` VALUES ('101', '2', '2', 'pc', 'admin&pc@5d3623c6067ab693654974a52a953ae3', 'admin&pc@e234c9f50d13bb6f65ca67746a98bd3d', '7200', '1', '2018-08-28 14:18:15', '2018-08-28 14:18:15');
INSERT INTO `wancll_admin_tokens` VALUES ('102', '2', '2', 'pc', 'admin&pc@4a10b02cc8115d52f4b5edc16eb175ed', 'admin&pc@6dffa8ce9586975f30ca378f5ae9fd14', '7200', '1', '2018-08-28 14:18:21', '2018-08-29 18:18:52');
INSERT INTO `wancll_admin_tokens` VALUES ('128', '2', '2', 'pc', 'admin&pc@b892b6627f1648f5cadd2524553905c4', 'admin&pc@18f0bb906f2ce67339e36b3e0dbb9242', '7200', '1', '2018-09-03 10:25:28', '2018-09-03 10:25:28');
INSERT INTO `wancll_admin_tokens` VALUES ('106', '2', '2', 'pc', 'admin&pc@fdf37c71e1796edde74d7adc6abc1732', 'admin&pc@a90089291599ede6ded0de5a7d87d901', '7200', '1', '2018-08-30 09:31:56', '2018-08-30 16:45:37');
INSERT INTO `wancll_admin_tokens` VALUES ('107', '2', '2', 'pc', 'admin&pc@51ab9d1ffbb283cc1b5f8f56e82097f8', 'admin&pc@e6adad19e51948b8eb68afb46da75906', '7200', '1', '2018-08-30 09:48:23', '2018-08-30 09:48:23');
INSERT INTO `wancll_admin_tokens` VALUES ('108', '2', '2', 'pc', 'admin&pc@d5b67501c8777f8938c0a602625201e6', 'admin&pc@5f21be9617bc4ba97a891991cea45f82', '7200', '1', '2018-08-30 10:03:00', '2018-08-30 10:03:00');
INSERT INTO `wancll_admin_tokens` VALUES ('110', '2', '2', 'pc', 'admin&pc@5450ab7c023a0c6d746ec9cb1fd2b180', 'admin&pc@a813a0a8b591badea9e01afbcc457ff7', '7200', '1', '2018-08-30 17:36:15', '2018-08-30 17:36:15');
INSERT INTO `wancll_admin_tokens` VALUES ('111', '2', '2', 'pc', 'admin&pc@4464a0d752a899284c1b81d6a9bf7207', 'admin&pc@16a383d004e46d40e010f1be5427482e', '7200', '1', '2018-08-30 17:43:09', '2018-08-31 10:30:05');
INSERT INTO `wancll_admin_tokens` VALUES ('113', '2', '2', 'pc', 'admin&pc@da9a49886d01ae89908bafa4c2b8f0b0', 'admin&pc@2a7fb4d333a6ea6bc857604579d80ec6', '7200', '1', '2018-08-31 11:10:02', '2018-09-01 13:36:05');
INSERT INTO `wancll_admin_tokens` VALUES ('114', '2', '2', 'pc', 'admin&pc@d7f2819c41f46a34a8583b0ac63a2294', 'admin&pc@857b4e05ace80e88ba2b2b3fd2383c2d', '7200', '1', '2018-08-31 14:48:49', '2018-08-31 14:48:49');
INSERT INTO `wancll_admin_tokens` VALUES ('115', '2', '2', 'pc', 'admin&pc@8091c06e8450007fd5978abc35b19a31', 'admin&pc@001d84032dfbe3f8b2bcda1584a00859', '7200', '1', '2018-08-31 14:57:10', '2018-08-31 14:57:10');
INSERT INTO `wancll_admin_tokens` VALUES ('127', '2', '2', 'pc', 'admin&pc@90fedd4c8565b02d85826202561d68ef', 'admin&pc@fe19b88dcebf5895cc2613058f04d3aa', '7200', '1', '2018-09-03 09:20:03', '2018-09-04 09:31:23');
INSERT INTO `wancll_admin_tokens` VALUES ('117', '2', '2', 'pc', 'admin&pc@f811bd4584f01f352055a4eb6cb300ef', 'admin&pc@e1b2507af70a8bdc8cc1cf96e6aa6c1e', '7200', '1', '2018-08-31 15:03:44', '2018-08-31 15:03:44');
INSERT INTO `wancll_admin_tokens` VALUES ('118', '2', '2', 'pc', 'admin&pc@57b98225ee0648385e320d26ac33e3ea', 'admin&pc@3fe6de20dcbbdf99f54fbecce1e3766f', '7200', '1', '2018-08-31 15:04:55', '2018-08-31 17:04:57');
INSERT INTO `wancll_admin_tokens` VALUES ('131', '1', '1', 'pc', 'admin&pc@75f8cbfc810221bfe8b8b3dce45125bf', 'admin&pc@06f5bad6999b9a7f50c196f9064b4f79', '7200', '1', '2018-09-03 11:03:18', '2018-09-03 14:42:54');
INSERT INTO `wancll_admin_tokens` VALUES ('121', '2', '2', 'pc', 'admin&pc@18ed0338b24486892702817072539a3a', 'admin&pc@f21640489bc516a689e65f9428ae4e6c', '7200', '1', '2018-09-01 13:58:25', '2018-09-01 13:58:25');
INSERT INTO `wancll_admin_tokens` VALUES ('122', '2', '2', 'pc', 'admin&pc@3ee19a5247880d32688ce3bb0143ba78', 'admin&pc@a2f579c57fe40d8642db96534bac00f4', '7200', '1', '2018-09-01 14:09:23', '2018-09-01 16:53:45');
INSERT INTO `wancll_admin_tokens` VALUES ('124', '2', '2', 'pc', 'admin&pc@827e3f5bd7d0aad112a0ecc5603d4f1a', 'admin&pc@4abae8c6ea599205052c885618ed29d3', '7200', '1', '2018-09-02 16:43:21', '2018-09-02 16:43:21');
INSERT INTO `wancll_admin_tokens` VALUES ('125', '2', '2', 'pc', 'admin&pc@e83e830926eeb7816249bdb070145e51', 'admin&pc@dd7b3665fccc1fdbfe1cdadfedb6d736', '7200', '1', '2018-09-02 22:52:25', '2018-09-02 22:52:25');
INSERT INTO `wancll_admin_tokens` VALUES ('133', '2', '2', 'pc', 'admin&pc@48626af665b57deb4aa577c870c0c3cc', 'admin&pc@8645c93d3d0dee0e2445c09c910f103d', '7200', '1', '2018-09-03 15:36:07', '2018-09-03 15:36:07');
INSERT INTO `wancll_admin_tokens` VALUES ('134', '1', '1', 'pc', 'admin&pc@9dd2bee2eebb05b7fd0287711a37217d', 'admin&pc@f43ceaee4fe54aace6257e02b288d277', '7200', '1', '2018-09-03 15:38:41', '2018-09-03 15:38:41');
INSERT INTO `wancll_admin_tokens` VALUES ('135', '2', '2', 'pc', 'admin&pc@c9e579e4b207c0bdd22ce17e4e8d5f3f', 'admin&pc@297ab1e2e325a54b80269521a19474ba', '7200', '1', '2018-09-03 15:43:12', '2018-09-03 15:43:12');
INSERT INTO `wancll_admin_tokens` VALUES ('136', '2', '2', 'pc', 'admin&pc@720805a88649cdcdea4d6b02c3b09407', 'admin&pc@93185abf107e45124de0a2cb1c97edd1', '7200', '1', '2018-09-03 15:43:12', '2018-09-03 15:43:12');
INSERT INTO `wancll_admin_tokens` VALUES ('138', '2', '2', 'pc', 'admin&pc@51d8f3c2c6f1046dcefd3364d1aeda84', 'admin&pc@bf89582328b233ac7584805fa321265d', '7200', '1', '2018-09-03 15:48:15', '2018-09-03 15:48:15');
INSERT INTO `wancll_admin_tokens` VALUES ('144', '2', '2', 'pc', 'admin&pc@956b68a4dcac95d36c1d56383b46554a', 'admin&pc@52657ee68c4fb51db10715321a1645af', '7200', '1', '2018-09-04 17:52:32', '2018-09-04 17:52:32');
INSERT INTO `wancll_admin_tokens` VALUES ('140', '1', '1', 'pc', 'admin&pc@4283dc8ef536ad7338a37d150ef546c1', 'admin&pc@34b485224ef16ccff620e1a4539384b6', '7200', '1', '2018-09-03 17:10:37', '2018-09-05 10:23:45');
INSERT INTO `wancll_admin_tokens` VALUES ('141', '2', '2', 'pc', 'admin&pc@4a4b86d8dc21a597344b3ab08b9aaf6e', 'admin&pc@7dc233b4e5776bfb273e786e27b67a21', '7200', '1', '2018-09-03 17:46:40', '2018-09-03 17:46:40');
INSERT INTO `wancll_admin_tokens` VALUES ('142', '2', '2', 'pc', 'admin&pc@95b127211a13e6353089c29c9fcc6851', 'admin&pc@1d5fa33349bab856a39a6532bc291e74', '7200', '1', '2018-09-03 17:46:40', '2018-09-03 17:46:40');
INSERT INTO `wancll_admin_tokens` VALUES ('143', '2', '2', 'pc', 'admin&pc@3b0aa12b712aa6b8030b28b0a502172c', 'admin&pc@ceeb067a1aaa1259344acf1c8943205c', '7200', '1', '2018-09-04 10:39:46', '2018-09-04 10:39:46');

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
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_visit_logs`
-- -----------------------------
INSERT INTO `wancll_admin_visit_logs` VALUES ('1', '2', '2', '113.247.13.183', '2018-07-20 08:58:28', 'pc', '1', '2018-07-20 08:58:28', '2018-07-20 08:58:28');
INSERT INTO `wancll_admin_visit_logs` VALUES ('2', '2', '2', '113.247.13.183', '2018-07-20 09:01:51', 'pc', '1', '2018-07-20 09:01:51', '2018-07-20 09:01:51');
INSERT INTO `wancll_admin_visit_logs` VALUES ('3', '2', '2', '127.0.0.1', '2018-07-20 10:53:12', 'pc', '1', '2018-07-20 10:53:12', '2018-07-20 10:53:12');
INSERT INTO `wancll_admin_visit_logs` VALUES ('4', '2', '2', '113.247.13.183', '2018-07-20 18:30:38', 'pc', '1', '2018-07-20 18:30:38', '2018-07-20 18:30:38');
INSERT INTO `wancll_admin_visit_logs` VALUES ('5', '2', '2', '113.247.51.228', '2018-07-23 15:25:20', 'pc', '1', '2018-07-23 15:25:20', '2018-07-23 15:25:20');
INSERT INTO `wancll_admin_visit_logs` VALUES ('6', '2', '2', '113.247.51.228', '2018-07-24 10:21:30', 'pc', '1', '2018-07-24 10:21:30', '2018-07-24 10:21:30');
INSERT INTO `wancll_admin_visit_logs` VALUES ('7', '2', '2', '113.247.51.228', '2018-07-24 15:09:27', 'pc', '1', '2018-07-24 15:09:27', '2018-07-24 15:09:27');
INSERT INTO `wancll_admin_visit_logs` VALUES ('8', '2', '2', '113.247.51.228', '2018-07-24 15:25:35', 'pc', '1', '2018-07-24 15:25:35', '2018-07-24 15:25:35');
INSERT INTO `wancll_admin_visit_logs` VALUES ('9', '2', '2', '127.0.0.1', '2018-07-24 16:26:13', 'pc', '1', '2018-07-24 16:26:13', '2018-07-24 16:26:13');
INSERT INTO `wancll_admin_visit_logs` VALUES ('10', '2', '2', '127.0.0.1', '2018-07-24 16:51:57', 'pc', '1', '2018-07-24 16:51:57', '2018-07-24 16:51:57');
INSERT INTO `wancll_admin_visit_logs` VALUES ('11', '2', '2', '36.157.194.84', '2018-07-24 21:28:37', 'pc', '1', '2018-07-24 21:28:37', '2018-07-24 21:28:37');
INSERT INTO `wancll_admin_visit_logs` VALUES ('12', '2', '2', '42.48.51.232', '2018-07-25 07:12:24', 'pc', '1', '2018-07-25 07:12:24', '2018-07-25 07:12:24');
INSERT INTO `wancll_admin_visit_logs` VALUES ('13', '2', '2', '42.48.51.232', '2018-07-25 07:20:45', 'pc', '1', '2018-07-25 07:20:45', '2018-07-25 07:20:45');
INSERT INTO `wancll_admin_visit_logs` VALUES ('14', '2', '2', '42.48.51.232', '2018-07-25 07:25:55', 'pc', '1', '2018-07-25 07:25:55', '2018-07-25 07:25:55');
INSERT INTO `wancll_admin_visit_logs` VALUES ('15', '2', '2', '42.48.51.232', '2018-07-25 07:32:19', 'pc', '1', '2018-07-25 07:32:19', '2018-07-25 07:32:19');
INSERT INTO `wancll_admin_visit_logs` VALUES ('16', '2', '2', '42.48.51.232', '2018-07-25 07:38:42', 'pc', '1', '2018-07-25 07:38:42', '2018-07-25 07:38:42');
INSERT INTO `wancll_admin_visit_logs` VALUES ('17', '2', '2', '127.0.0.1', '2018-07-25 10:06:29', 'pc', '1', '2018-07-25 10:06:29', '2018-07-25 10:06:29');
INSERT INTO `wancll_admin_visit_logs` VALUES ('18', '2', '2', '127.0.0.1', '2018-07-25 10:36:13', 'pc', '1', '2018-07-25 10:36:13', '2018-07-25 10:36:13');
INSERT INTO `wancll_admin_visit_logs` VALUES ('19', '2', '2', '127.0.0.1', '2018-07-25 10:40:41', 'pc', '1', '2018-07-25 10:40:41', '2018-07-25 10:40:41');
INSERT INTO `wancll_admin_visit_logs` VALUES ('20', '2', '2', '127.0.0.1', '2018-07-25 10:46:35', 'pc', '1', '2018-07-25 10:46:35', '2018-07-25 10:46:35');
INSERT INTO `wancll_admin_visit_logs` VALUES ('21', '2', '2', '113.247.15.172', '2018-07-26 15:38:41', 'pc', '1', '2018-07-26 15:38:41', '2018-07-26 15:38:41');
INSERT INTO `wancll_admin_visit_logs` VALUES ('22', '2', '2', '127.0.0.1', '2018-07-27 14:04:13', 'pc', '1', '2018-07-27 14:04:13', '2018-07-27 14:04:13');
INSERT INTO `wancll_admin_visit_logs` VALUES ('23', '2', '2', '175.8.205.90', '2018-07-27 19:28:13', 'pc', '1', '2018-07-27 19:28:13', '2018-07-27 19:28:13');
INSERT INTO `wancll_admin_visit_logs` VALUES ('24', '2', '2', '175.8.205.90', '2018-07-27 19:37:39', 'pc', '1', '2018-07-27 19:37:39', '2018-07-27 19:37:39');
INSERT INTO `wancll_admin_visit_logs` VALUES ('25', '2', '2', '175.8.205.90', '2018-07-27 19:39:32', 'pc', '1', '2018-07-27 19:39:32', '2018-07-27 19:39:32');
INSERT INTO `wancll_admin_visit_logs` VALUES ('26', '2', '2', '127.0.0.1', '2018-07-28 08:41:23', 'pc', '1', '2018-07-28 08:41:23', '2018-07-28 08:41:23');
INSERT INTO `wancll_admin_visit_logs` VALUES ('27', '2', '2', '127.0.0.1', '2018-07-28 09:21:24', 'pc', '1', '2018-07-28 09:21:24', '2018-07-28 09:21:24');
INSERT INTO `wancll_admin_visit_logs` VALUES ('28', '2', '2', '175.8.205.90', '2018-07-28 10:48:38', 'pc', '1', '2018-07-28 10:48:38', '2018-07-28 10:48:38');
INSERT INTO `wancll_admin_visit_logs` VALUES ('29', '2', '2', '113.246.202.237', '2018-07-30 10:51:20', 'pc', '1', '2018-07-30 10:51:20', '2018-07-30 10:51:20');
INSERT INTO `wancll_admin_visit_logs` VALUES ('30', '2', '2', '113.246.202.237', '2018-07-30 11:16:28', 'pc', '1', '2018-07-30 11:16:28', '2018-07-30 11:16:28');
INSERT INTO `wancll_admin_visit_logs` VALUES ('31', '2', '2', '113.246.202.237', '2018-07-30 15:58:21', 'pc', '1', '2018-07-30 15:58:21', '2018-07-30 15:58:21');
INSERT INTO `wancll_admin_visit_logs` VALUES ('32', '2', '2', '127.0.0.1', '2018-07-30 16:14:56', 'pc', '1', '2018-07-30 16:14:56', '2018-07-30 16:14:56');
INSERT INTO `wancll_admin_visit_logs` VALUES ('33', '2', '2', '175.8.206.136', '2018-07-31 08:39:32', 'pc', '1', '2018-07-31 08:39:32', '2018-07-31 08:39:32');
INSERT INTO `wancll_admin_visit_logs` VALUES ('34', '2', '2', '175.8.206.136', '2018-07-31 13:36:58', 'pc', '1', '2018-07-31 13:36:58', '2018-07-31 13:36:58');
INSERT INTO `wancll_admin_visit_logs` VALUES ('35', '2', '2', '127.0.0.1', '2018-07-31 22:42:24', 'pc', '1', '2018-07-31 22:42:24', '2018-07-31 22:42:24');
INSERT INTO `wancll_admin_visit_logs` VALUES ('36', '2', '2', '175.8.206.136', '2018-08-01 08:56:12', 'pc', '1', '2018-08-01 08:56:12', '2018-08-01 08:56:12');
INSERT INTO `wancll_admin_visit_logs` VALUES ('37', '2', '2', '175.8.206.136', '2018-08-01 17:32:15', 'pc', '1', '2018-08-01 17:32:15', '2018-08-01 17:32:15');
INSERT INTO `wancll_admin_visit_logs` VALUES ('38', '2', '2', '175.8.206.136', '2018-08-01 17:56:19', 'pc', '1', '2018-08-01 17:56:19', '2018-08-01 17:56:19');
INSERT INTO `wancll_admin_visit_logs` VALUES ('39', '2', '2', '113.247.51.102', '2018-08-03 15:10:33', 'pc', '1', '2018-08-03 15:10:33', '2018-08-03 15:10:33');
INSERT INTO `wancll_admin_visit_logs` VALUES ('40', '2', '2', '113.247.51.102', '2018-08-03 17:12:46', 'pc', '1', '2018-08-03 17:12:46', '2018-08-03 17:12:46');
INSERT INTO `wancll_admin_visit_logs` VALUES ('41', '2', '2', '113.247.51.102', '2018-08-04 09:48:00', 'pc', '1', '2018-08-04 09:48:00', '2018-08-04 09:48:00');
INSERT INTO `wancll_admin_visit_logs` VALUES ('42', '2', '2', '113.247.51.102', '2018-08-04 18:55:13', 'pc', '1', '2018-08-04 18:55:13', '2018-08-04 18:55:13');
INSERT INTO `wancll_admin_visit_logs` VALUES ('43', '2', '2', '113.247.50.187', '2018-08-06 09:08:11', 'pc', '1', '2018-08-06 09:08:11', '2018-08-06 09:08:11');
INSERT INTO `wancll_admin_visit_logs` VALUES ('44', '2', '2', '127.0.0.1', '2018-08-06 09:10:10', 'pc', '1', '2018-08-06 09:10:10', '2018-08-06 09:10:10');
INSERT INTO `wancll_admin_visit_logs` VALUES ('45', '2', '2', '113.247.50.187', '2018-08-06 14:03:52', 'pc', '1', '2018-08-06 14:03:52', '2018-08-06 14:03:52');
INSERT INTO `wancll_admin_visit_logs` VALUES ('46', '2', '2', '113.247.50.187', '2018-08-06 15:00:25', 'pc', '1', '2018-08-06 15:00:25', '2018-08-06 15:00:25');
INSERT INTO `wancll_admin_visit_logs` VALUES ('47', '2', '2', '113.247.15.167', '2018-08-07 09:43:35', 'pc', '1', '2018-08-07 09:43:35', '2018-08-07 09:43:35');
INSERT INTO `wancll_admin_visit_logs` VALUES ('48', '2', '2', '113.247.15.167', '2018-08-07 09:58:26', 'pc', '1', '2018-08-07 09:58:26', '2018-08-07 09:58:26');
INSERT INTO `wancll_admin_visit_logs` VALUES ('49', '2', '2', '113.247.13.25', '2018-08-07 13:55:32', 'pc', '1', '2018-08-07 13:55:32', '2018-08-07 13:55:32');
INSERT INTO `wancll_admin_visit_logs` VALUES ('50', '2', '2', '113.247.15.167', '2018-08-07 14:22:58', 'pc', '1', '2018-08-07 14:22:58', '2018-08-07 14:22:58');
INSERT INTO `wancll_admin_visit_logs` VALUES ('51', '2', '2', '127.0.0.1', '2018-08-08 08:54:56', 'pc', '1', '2018-08-08 08:54:56', '2018-08-08 08:54:56');
INSERT INTO `wancll_admin_visit_logs` VALUES ('52', '2', '2', '113.247.15.167', '2018-08-08 14:02:04', 'pc', '1', '2018-08-08 14:02:04', '2018-08-08 14:02:04');
INSERT INTO `wancll_admin_visit_logs` VALUES ('53', '2', '2', '175.8.205.45', '2018-08-09 14:12:18', 'pc', '1', '2018-08-09 14:12:18', '2018-08-09 14:12:18');
INSERT INTO `wancll_admin_visit_logs` VALUES ('54', '2', '2', '175.8.205.45', '2018-08-10 15:04:17', 'pc', '1', '2018-08-10 15:04:17', '2018-08-10 15:04:17');
INSERT INTO `wancll_admin_visit_logs` VALUES ('55', '2', '2', '127.0.0.1', '2018-08-10 17:19:33', 'pc', '1', '2018-08-10 17:19:33', '2018-08-10 17:19:33');
INSERT INTO `wancll_admin_visit_logs` VALUES ('56', '2', '2', '140.82.16.16', '2018-08-11 08:52:26', 'pc', '1', '2018-08-11 08:52:26', '2018-08-11 08:52:26');
INSERT INTO `wancll_admin_visit_logs` VALUES ('57', '2', '2', '113.246.200.194', '2018-08-11 11:53:33', 'pc', '1', '2018-08-11 11:53:33', '2018-08-11 11:53:33');
INSERT INTO `wancll_admin_visit_logs` VALUES ('58', '2', '2', '113.246.200.112', '2018-08-11 16:25:22', 'pc', '1', '2018-08-11 16:25:22', '2018-08-11 16:25:22');
INSERT INTO `wancll_admin_visit_logs` VALUES ('59', '2', '2', '113.247.50.218', '2018-08-14 11:29:59', 'pc', '1', '2018-08-14 11:29:59', '2018-08-14 11:29:59');
INSERT INTO `wancll_admin_visit_logs` VALUES ('60', '2', '2', '113.246.201.25', '2018-08-15 13:45:59', 'pc', '1', '2018-08-15 13:45:59', '2018-08-15 13:45:59');
INSERT INTO `wancll_admin_visit_logs` VALUES ('61', '2', '2', '113.246.201.25', '2018-08-15 14:17:40', 'pc', '1', '2018-08-15 14:17:40', '2018-08-15 14:17:40');
INSERT INTO `wancll_admin_visit_logs` VALUES ('62', '2', '2', '113.246.201.25', '2018-08-15 15:08:53', 'pc', '1', '2018-08-15 15:08:53', '2018-08-15 15:08:53');
INSERT INTO `wancll_admin_visit_logs` VALUES ('63', '2', '2', '113.246.201.25', '2018-08-16 10:12:59', 'pc', '1', '2018-08-16 10:12:59', '2018-08-16 10:12:59');
INSERT INTO `wancll_admin_visit_logs` VALUES ('64', '2', '2', '113.246.201.25', '2018-08-16 10:54:02', 'pc', '1', '2018-08-16 10:54:02', '2018-08-16 10:54:02');
INSERT INTO `wancll_admin_visit_logs` VALUES ('65', '2', '2', '113.246.201.25', '2018-08-16 15:46:21', 'pc', '1', '2018-08-16 15:46:21', '2018-08-16 15:46:21');
INSERT INTO `wancll_admin_visit_logs` VALUES ('66', '2', '2', '113.247.48.13', '2018-08-17 11:38:21', 'pc', '1', '2018-08-17 11:38:21', '2018-08-17 11:38:21');
INSERT INTO `wancll_admin_visit_logs` VALUES ('67', '2', '2', '113.247.48.13', '2018-08-18 13:48:49', 'pc', '1', '2018-08-18 13:48:49', '2018-08-18 13:48:49');
INSERT INTO `wancll_admin_visit_logs` VALUES ('68', '2', '2', '113.246.101.75', '2018-08-19 21:05:00', 'pc', '1', '2018-08-19 21:05:00', '2018-08-19 21:05:00');
INSERT INTO `wancll_admin_visit_logs` VALUES ('69', '2', '2', '175.8.207.120', '2018-08-20 15:42:37', 'pc', '1', '2018-08-20 15:42:37', '2018-08-20 15:42:37');
INSERT INTO `wancll_admin_visit_logs` VALUES ('70', '2', '2', '175.8.207.120', '2018-08-21 17:46:13', 'pc', '1', '2018-08-21 17:46:13', '2018-08-21 17:46:13');
INSERT INTO `wancll_admin_visit_logs` VALUES ('71', '2', '2', '175.8.207.120', '2018-08-22 09:30:15', 'pc', '1', '2018-08-22 09:30:15', '2018-08-22 09:30:15');
INSERT INTO `wancll_admin_visit_logs` VALUES ('72', '2', '2', '113.247.12.217', '2018-08-22 17:57:31', 'pc', '1', '2018-08-22 17:57:31', '2018-08-22 17:57:31');
INSERT INTO `wancll_admin_visit_logs` VALUES ('73', '2', '2', '113.247.12.217', '2018-08-22 18:06:34', 'pc', '1', '2018-08-22 18:06:34', '2018-08-22 18:06:34');
INSERT INTO `wancll_admin_visit_logs` VALUES ('74', '2', '2', '119.39.76.152', '2018-08-23 00:33:42', 'pc', '1', '2018-08-23 00:33:42', '2018-08-23 00:33:42');
INSERT INTO `wancll_admin_visit_logs` VALUES ('75', '2', '2', '119.39.76.152', '2018-08-24 07:30:16', 'pc', '1', '2018-08-24 07:30:16', '2018-08-24 07:30:16');
INSERT INTO `wancll_admin_visit_logs` VALUES ('76', '2', '2', '119.39.76.152', '2018-08-24 07:58:27', 'pc', '1', '2018-08-24 07:58:27', '2018-08-24 07:58:27');
INSERT INTO `wancll_admin_visit_logs` VALUES ('77', '2', '2', '113.247.12.217', '2018-08-24 09:12:07', 'pc', '1', '2018-08-24 09:12:07', '2018-08-24 09:12:07');
INSERT INTO `wancll_admin_visit_logs` VALUES ('78', '2', '2', '113.246.201.80', '2018-08-24 09:44:14', 'pc', '1', '2018-08-24 09:44:14', '2018-08-24 09:44:14');
INSERT INTO `wancll_admin_visit_logs` VALUES ('79', '6', '6', '113.246.201.80', '2018-08-24 09:57:00', 'pc', '1', '2018-08-24 09:57:00', '2018-08-24 09:57:00');
INSERT INTO `wancll_admin_visit_logs` VALUES ('80', '6', '6', '113.246.201.80', '2018-08-24 11:00:29', 'pc', '1', '2018-08-24 11:00:29', '2018-08-24 11:00:29');
INSERT INTO `wancll_admin_visit_logs` VALUES ('81', '2', '2', '113.246.201.80', '2018-08-24 11:32:54', 'pc', '1', '2018-08-24 11:32:54', '2018-08-24 11:32:54');
INSERT INTO `wancll_admin_visit_logs` VALUES ('82', '6', '6', '113.246.201.80', '2018-08-24 11:34:23', 'pc', '1', '2018-08-24 11:34:23', '2018-08-24 11:34:23');
INSERT INTO `wancll_admin_visit_logs` VALUES ('83', '2', '2', '113.246.201.80', '2018-08-24 11:38:17', 'pc', '1', '2018-08-24 11:38:17', '2018-08-24 11:38:17');
INSERT INTO `wancll_admin_visit_logs` VALUES ('84', '2', '2', '113.246.201.80', '2018-08-24 11:39:03', 'pc', '1', '2018-08-24 11:39:03', '2018-08-24 11:39:03');
INSERT INTO `wancll_admin_visit_logs` VALUES ('85', '6', '6', '113.246.201.80', '2018-08-24 11:41:58', 'pc', '1', '2018-08-24 11:41:58', '2018-08-24 11:41:58');
INSERT INTO `wancll_admin_visit_logs` VALUES ('86', '2', '2', '113.246.201.80', '2018-08-24 13:43:08', 'pc', '1', '2018-08-24 13:43:08', '2018-08-24 13:43:08');
INSERT INTO `wancll_admin_visit_logs` VALUES ('87', '2', '2', '113.246.201.80', '2018-08-24 15:32:10', 'pc', '1', '2018-08-24 15:32:10', '2018-08-24 15:32:10');
INSERT INTO `wancll_admin_visit_logs` VALUES ('88', '2', '2', '113.246.201.80', '2018-08-24 16:03:00', 'pc', '1', '2018-08-24 16:03:00', '2018-08-24 16:03:00');
INSERT INTO `wancll_admin_visit_logs` VALUES ('89', '2', '2', '113.246.201.80', '2018-08-25 14:23:01', 'pc', '1', '2018-08-25 14:23:01', '2018-08-25 14:23:01');
INSERT INTO `wancll_admin_visit_logs` VALUES ('90', '2', '2', '113.246.201.80', '2018-08-25 14:37:32', 'pc', '1', '2018-08-25 14:37:32', '2018-08-25 14:37:32');
INSERT INTO `wancll_admin_visit_logs` VALUES ('91', '2', '2', '113.246.201.80', '2018-08-25 14:52:59', 'pc', '1', '2018-08-25 14:52:59', '2018-08-25 14:52:59');
INSERT INTO `wancll_admin_visit_logs` VALUES ('92', '2', '2', '113.246.203.175', '2018-08-26 10:55:18', 'pc', '1', '2018-08-26 10:55:18', '2018-08-26 10:55:18');
INSERT INTO `wancll_admin_visit_logs` VALUES ('93', '2', '2', '113.246.203.175', '2018-08-26 11:07:52', 'pc', '1', '2018-08-26 11:07:52', '2018-08-26 11:07:52');
INSERT INTO `wancll_admin_visit_logs` VALUES ('94', '2', '2', '113.246.203.175', '2018-08-27 17:10:37', 'pc', '1', '2018-08-27 17:10:37', '2018-08-27 17:10:37');
INSERT INTO `wancll_admin_visit_logs` VALUES ('95', '2', '2', '113.246.203.175', '2018-08-27 18:50:13', 'pc', '1', '2018-08-27 18:50:13', '2018-08-27 18:50:13');
INSERT INTO `wancll_admin_visit_logs` VALUES ('96', '2', '2', '42.48.50.27', '2018-08-27 21:31:31', 'pc', '1', '2018-08-27 21:31:31', '2018-08-27 21:31:31');
INSERT INTO `wancll_admin_visit_logs` VALUES ('97', '2', '2', '175.8.204.28', '2018-08-28 09:59:37', 'pc', '1', '2018-08-28 09:59:37', '2018-08-28 09:59:37');
INSERT INTO `wancll_admin_visit_logs` VALUES ('98', '2', '2', '175.8.204.28', '2018-08-28 11:20:52', 'pc', '1', '2018-08-28 11:20:52', '2018-08-28 11:20:52');
INSERT INTO `wancll_admin_visit_logs` VALUES ('99', '2', '2', '124.232.147.165', '2018-08-28 14:03:35', 'pc', '1', '2018-08-28 14:03:35', '2018-08-28 14:03:35');
INSERT INTO `wancll_admin_visit_logs` VALUES ('100', '2', '2', '124.232.147.165', '2018-08-28 14:04:35', 'pc', '1', '2018-08-28 14:04:35', '2018-08-28 14:04:35');
INSERT INTO `wancll_admin_visit_logs` VALUES ('101', '2', '2', '175.8.204.28', '2018-08-28 14:18:15', 'pc', '1', '2018-08-28 14:18:15', '2018-08-28 14:18:15');
INSERT INTO `wancll_admin_visit_logs` VALUES ('102', '2', '2', '175.8.204.28', '2018-08-28 14:18:21', 'pc', '1', '2018-08-28 14:18:21', '2018-08-28 14:18:21');
INSERT INTO `wancll_admin_visit_logs` VALUES ('103', '2', '2', '124.232.147.165', '2018-08-28 14:36:12', 'pc', '1', '2018-08-28 14:36:12', '2018-08-28 14:36:12');
INSERT INTO `wancll_admin_visit_logs` VALUES ('104', '2', '2', '113.247.50.70', '2018-08-28 18:02:32', 'pc', '1', '2018-08-28 18:02:32', '2018-08-28 18:02:32');
INSERT INTO `wancll_admin_visit_logs` VALUES ('105', '2', '2', '113.247.50.70', '2018-08-28 18:45:29', 'pc', '1', '2018-08-28 18:45:29', '2018-08-28 18:45:29');
INSERT INTO `wancll_admin_visit_logs` VALUES ('106', '2', '2', '113.247.50.70', '2018-08-30 09:31:56', 'pc', '1', '2018-08-30 09:31:56', '2018-08-30 09:31:56');
INSERT INTO `wancll_admin_visit_logs` VALUES ('107', '2', '2', '113.247.50.70', '2018-08-30 09:48:23', 'pc', '1', '2018-08-30 09:48:23', '2018-08-30 09:48:23');
INSERT INTO `wancll_admin_visit_logs` VALUES ('108', '2', '2', '113.247.50.70', '2018-08-30 10:03:00', 'pc', '1', '2018-08-30 10:03:00', '2018-08-30 10:03:00');
INSERT INTO `wancll_admin_visit_logs` VALUES ('109', '2', '2', '113.246.203.116', '2018-08-30 15:33:31', 'pc', '1', '2018-08-30 15:33:31', '2018-08-30 15:33:31');
INSERT INTO `wancll_admin_visit_logs` VALUES ('110', '2', '2', '127.0.0.1', '2018-08-30 17:36:15', 'pc', '1', '2018-08-30 17:36:15', '2018-08-30 17:36:15');
INSERT INTO `wancll_admin_visit_logs` VALUES ('111', '2', '2', '113.246.203.116', '2018-08-30 17:43:09', 'pc', '1', '2018-08-30 17:43:09', '2018-08-30 17:43:09');
INSERT INTO `wancll_admin_visit_logs` VALUES ('112', '2', '2', '113.246.203.116', '2018-08-31 09:28:39', 'pc', '1', '2018-08-31 09:28:39', '2018-08-31 09:28:39');
INSERT INTO `wancll_admin_visit_logs` VALUES ('113', '2', '2', '113.246.203.116', '2018-08-31 11:10:02', 'pc', '1', '2018-08-31 11:10:02', '2018-08-31 11:10:02');
INSERT INTO `wancll_admin_visit_logs` VALUES ('114', '2', '2', '113.246.203.116', '2018-08-31 14:48:49', 'pc', '1', '2018-08-31 14:48:49', '2018-08-31 14:48:49');
INSERT INTO `wancll_admin_visit_logs` VALUES ('115', '2', '2', '113.246.203.116', '2018-08-31 14:57:10', 'pc', '1', '2018-08-31 14:57:10', '2018-08-31 14:57:10');
INSERT INTO `wancll_admin_visit_logs` VALUES ('116', '2', '2', '113.246.203.116', '2018-08-31 15:03:13', 'pc', '1', '2018-08-31 15:03:13', '2018-08-31 15:03:13');
INSERT INTO `wancll_admin_visit_logs` VALUES ('117', '2', '2', '113.246.203.116', '2018-08-31 15:03:44', 'pc', '1', '2018-08-31 15:03:44', '2018-08-31 15:03:44');
INSERT INTO `wancll_admin_visit_logs` VALUES ('118', '2', '2', '113.246.203.116', '2018-08-31 15:04:55', 'pc', '1', '2018-08-31 15:04:55', '2018-08-31 15:04:55');
INSERT INTO `wancll_admin_visit_logs` VALUES ('119', '2', '2', '113.246.203.116', '2018-08-31 15:55:06', 'pc', '1', '2018-08-31 15:55:06', '2018-08-31 15:55:06');
INSERT INTO `wancll_admin_visit_logs` VALUES ('120', '2', '2', '113.246.201.121', '2018-09-01 13:39:49', 'pc', '1', '2018-09-01 13:39:49', '2018-09-01 13:39:49');
INSERT INTO `wancll_admin_visit_logs` VALUES ('121', '2', '2', '127.0.0.1', '2018-09-01 13:58:25', 'pc', '1', '2018-09-01 13:58:25', '2018-09-01 13:58:25');
INSERT INTO `wancll_admin_visit_logs` VALUES ('122', '2', '2', '127.0.0.1', '2018-09-01 14:09:23', 'pc', '1', '2018-09-01 14:09:23', '2018-09-01 14:09:23');
INSERT INTO `wancll_admin_visit_logs` VALUES ('123', '2', '2', '113.246.201.121', '2018-09-01 15:19:42', 'pc', '1', '2018-09-01 15:19:42', '2018-09-01 15:19:42');
INSERT INTO `wancll_admin_visit_logs` VALUES ('124', '2', '2', '113.246.202.236', '2018-09-02 16:43:21', 'pc', '1', '2018-09-02 16:43:21', '2018-09-02 16:43:21');
INSERT INTO `wancll_admin_visit_logs` VALUES ('125', '2', '2', '42.48.54.65', '2018-09-02 22:52:25', 'pc', '1', '2018-09-02 22:52:25', '2018-09-02 22:52:25');
INSERT INTO `wancll_admin_visit_logs` VALUES ('126', '2', '2', '113.246.202.236', '2018-09-03 09:04:11', 'pc', '1', '2018-09-03 09:04:11', '2018-09-03 09:04:11');
INSERT INTO `wancll_admin_visit_logs` VALUES ('127', '2', '2', '113.246.202.236', '2018-09-03 09:20:03', 'pc', '1', '2018-09-03 09:20:03', '2018-09-03 09:20:03');
INSERT INTO `wancll_admin_visit_logs` VALUES ('128', '2', '2', '124.232.147.165', '2018-09-03 10:25:28', 'pc', '1', '2018-09-03 10:25:28', '2018-09-03 10:25:28');
INSERT INTO `wancll_admin_visit_logs` VALUES ('129', '2', '2', '113.246.202.236', '2018-09-03 10:38:47', 'pc', '1', '2018-09-03 10:38:47', '2018-09-03 10:38:47');
INSERT INTO `wancll_admin_visit_logs` VALUES ('130', '1', '1', '113.246.202.236', '2018-09-03 10:39:09', 'pc', '1', '2018-09-03 10:39:09', '2018-09-03 10:39:09');
INSERT INTO `wancll_admin_visit_logs` VALUES ('131', '1', '1', '113.246.202.236', '2018-09-03 11:03:18', 'pc', '1', '2018-09-03 11:03:18', '2018-09-03 11:03:18');
INSERT INTO `wancll_admin_visit_logs` VALUES ('132', '2', '2', '0.0.0.0', '2018-09-03 15:36:07', 'pc', '1', '2018-09-03 15:36:07', '2018-09-03 15:36:07');
INSERT INTO `wancll_admin_visit_logs` VALUES ('133', '2', '2', '0.0.0.0', '2018-09-03 15:36:07', 'pc', '1', '2018-09-03 15:36:07', '2018-09-03 15:36:07');
INSERT INTO `wancll_admin_visit_logs` VALUES ('134', '1', '1', '113.246.202.236', '2018-09-03 15:38:41', 'pc', '1', '2018-09-03 15:38:41', '2018-09-03 15:38:41');
INSERT INTO `wancll_admin_visit_logs` VALUES ('135', '2', '2', '0.0.0.0', '2018-09-03 15:43:12', 'pc', '1', '2018-09-03 15:43:12', '2018-09-03 15:43:12');
INSERT INTO `wancll_admin_visit_logs` VALUES ('136', '2', '2', '0.0.0.0', '2018-09-03 15:43:12', 'pc', '1', '2018-09-03 15:43:12', '2018-09-03 15:43:12');
INSERT INTO `wancll_admin_visit_logs` VALUES ('137', '2', '2', '113.246.202.236', '2018-09-03 15:48:15', 'pc', '1', '2018-09-03 15:48:15', '2018-09-03 15:48:15');
INSERT INTO `wancll_admin_visit_logs` VALUES ('138', '2', '2', '113.246.202.236', '2018-09-03 15:48:15', 'pc', '1', '2018-09-03 15:48:15', '2018-09-03 15:48:15');
INSERT INTO `wancll_admin_visit_logs` VALUES ('139', '2', '2', '113.246.202.236', '2018-09-03 15:52:37', 'pc', '1', '2018-09-03 15:52:37', '2018-09-03 15:52:37');
INSERT INTO `wancll_admin_visit_logs` VALUES ('140', '1', '1', '113.246.200.142', '2018-09-03 17:10:37', 'pc', '1', '2018-09-03 17:10:37', '2018-09-03 17:10:37');
INSERT INTO `wancll_admin_visit_logs` VALUES ('141', '2', '2', '113.246.200.142', '2018-09-03 17:46:40', 'pc', '1', '2018-09-03 17:46:40', '2018-09-03 17:46:40');
INSERT INTO `wancll_admin_visit_logs` VALUES ('142', '2', '2', '113.246.200.142', '2018-09-03 17:46:40', 'pc', '1', '2018-09-03 17:46:40', '2018-09-03 17:46:40');
INSERT INTO `wancll_admin_visit_logs` VALUES ('143', '2', '2', '113.246.200.142', '2018-09-04 10:39:46', 'pc', '1', '2018-09-04 10:39:46', '2018-09-04 10:39:46');
INSERT INTO `wancll_admin_visit_logs` VALUES ('144', '2', '2', '175.8.206.221', '2018-09-04 17:52:32', 'pc', '1', '2018-09-04 17:52:32', '2018-09-04 17:52:32');
INSERT INTO `wancll_admin_visit_logs` VALUES ('145', '2', '2', '113.246.200.142', '2018-09-04 19:52:31', 'pc', '1', '2018-09-04 19:52:31', '2018-09-04 19:52:31');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admins`
-- -----------------------------
INSERT INTO `wancll_admins` VALUES ('1', '', '', '', 'super', '', '', '', '', '', '', '[3]', '1', '1', '2018-04-10 16:40:36', '2018-04-11 16:46:56');
INSERT INTO `wancll_admins` VALUES ('2', '18888888888', '', '', 'admin', '/public/upload/user_images/20180903/960576557ec4a9b2ad65282d06d8afcb.jpg', '', '', '', '', '', '[2]', '1', '1', '2018-04-10 16:40:48', '2018-04-11 16:46:56');
INSERT INTO `wancll_admins` VALUES ('3', '', '', '', 'test', '', '', '', '', '', '', '[2]', '1', '0', '2018-04-11 10:22:20', '2018-04-11 10:30:41');
INSERT INTO `wancll_admins` VALUES ('4', '', '', '', 'test', '', '', '', '', '', '', '[2]', '1', '0', '2018-04-11 14:09:07', '2018-09-03 10:37:56');
INSERT INTO `wancll_admins` VALUES ('5', '18888888881', '', '', '1231', '/public/upload/user_avatar_images/20180629\\ab37000fab1f28d08476b722a2c9aca3.png', '188888888888', '', '', 'afdf@fadf.fga', 'fdafadfadsfdasfsd', '[3]', '1', '0', '2018-06-29 11:59:02', '2018-09-03 10:37:53');
INSERT INTO `wancll_admins` VALUES ('6', '', '', '', '测试管理', '/public/upload/user_images/20180824/dccaa48903262c321b02db6fc5f38642.png', '', '', '', '', '', '[2]', '1', '0', '2018-08-24 09:52:10', '2018-09-03 10:37:39');
INSERT INTO `wancll_admins` VALUES ('7', '11111111111', '', '', '1', '', '11111111111', '', '', '1@qq.com', '1', '[2]', '1', '0', '2018-09-04 09:48:51', '2018-09-04 09:49:07');

-- -----------------------------
-- Table structure for `wancll_advertisements`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_advertisements`;
CREATE TABLE `wancll_advertisements` (
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_advertisements`
-- -----------------------------
INSERT INTO `wancll_advertisements` VALUES ('1', '4', 'WAP首页广告1', '/public/upload/article_images/20180724\\c3eb76df4a99d086f6fc8fd56e8235a6.png', '', '', 'wap端首页广告1', '', '0', '', '0', '1', '0', '2018-07-24 11:38:54', '2018-07-24 11:40:29');
INSERT INTO `wancll_advertisements` VALUES ('2', '3', 'wap首页广告1', '/public/upload/article_images/20180830/04a83a05636b65372fc4fea8ae5b9ca2.png', '', '', '', '', '0', '', '0', '2', '1', '2018-08-04 19:08:27', '2018-09-03 11:50:44');
INSERT INTO `wancll_advertisements` VALUES ('3', '4', '455454', '/public/upload/article_images/20180903/d0d0a37bacfcdd7495e86aed5c61f5ee.jpg', '545454', '', '3', 'http://www.baidu.com', '0', '', '0', '2', '1', '2018-08-24 13:10:54', '2018-09-03 11:50:44');
INSERT INTO `wancll_advertisements` VALUES ('4', '3', '434', '/public/upload/article_images/20180901/6d7facaee9503df9055a730a6bd31e9c.png', '43', '', '', '', '0', '', '0', '2', '1', '2018-08-24 13:11:20', '2018-09-03 11:50:44');

-- -----------------------------
-- Table structure for `wancll_annoncements`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_annoncements`;
CREATE TABLE `wancll_annoncements` (
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_annoncements`
-- -----------------------------
INSERT INTO `wancll_annoncements` VALUES ('1', '6', '韩正义党党鞭涉\"网络水军案\"跳楼 否认干非法勾当', '', '', '', '[]', '<header><h1>韩正义党党鞭涉&quot;网络水军案&quot;跳楼 否认干非法勾当</h1><p><a href=\"https://m.haiwainet.cn/ttc/3541083/2018/0724/content_31359718_1.html#\">北京青年报</a>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 07-24 06:53&nbsp;&nbsp; &nbsp; &nbsp;</p></header><p style=\"white-space: normal;\"><br/></p><p><article><p class=\"imgs_c\"><img title=\"1532386450835894.jpg\" alt=\"0c39934f2cf33b8e1104970bf304234b.jpg\" src=\"http://v4.wx.wygoo.com/public/upload/ueditor/image/20180724/1532401024112571.jpg\"/></p><p>当地时间23日，韩国首尔，警方在鲁会灿跳楼现场进行调查 供图/视觉中国</p><p>韩国首都首尔警方23日说，在野党正义党党鞭、国会议员鲁会灿当天上午在公寓楼跳楼自尽。</p><p>鲁会灿是韩国劳工运动代表性人物，以清廉形象著称，最近却因牵涉搅动政坛的“网络水军案”接受调查，被指两年前非法收受5000万韩元(约合30万元人民币)政治捐款。警方说，不会作尸检，原因是鲁会灿死亡没有可疑之处，而且家人不同意。</p><p><strong>警方称不会作尸检</strong></p><p>警方官员说，当天上午9时38分，首尔市中心一座公寓楼的保安金某在大门附近发现鲁会灿的尸体，立即报警。</p><p>“我听到砰的一响，然后就在那儿发现了鲁议员，”金某说，“我立即向警方报告这起事件，没有碰任何东西。警察告诉我去看看他还有没有脉搏，我试着做了，但是没有脉搏，尽管当时他摔到地上只有一两分钟。”</p><p>警方稍后在公寓楼17层和18层之间的楼梯间发现一件夹克衫，里面有装着鲁会灿身份证件和名片的钱包，以及一封遗书。</p><p>鲁会灿在遗书中承认拿钱，但否认干非法勾当。他在遗书中写道，他收了那笔钱，但是与任何“不当请求”无关。他对不起自己的家人。</p><p>鲁会灿的母亲和一个兄弟住在这座公寓楼里。</p><p>警方说，不会作尸检，原因是鲁会灿死亡没有可疑之处，而且家人不同意。按照家人的意愿，遗书其他部分不会公开。</p><p>鲁会灿是韩国自前总统卢武铉2009年5月因家人卷入腐败丑闻而跳崖以来，自杀身亡的最知名政治人物。</p><p><strong>经常犀利揭露体制内腐败</strong></p><p>鲁会灿61岁，劳工维权人士出身，三次当选国会议员，是韩国劳工运动和进步派政治标志性人物之一。他经常犀利揭露和尖锐抨击体制内腐败，人气很高。</p><p>只是，鲁会灿近期卷入网络水军案，涉嫌收受非法献金一事，接受检察部门调查，一直以来的清廉形象黯然失色。</p><p>网络水军案主角是博客博主金某，网名“Druking”。检方指认，金某及其团队借助电脑程序在网络新闻下捏造留言和评论，目的是在政治热点议题上操控民意，使舆情有利于现执政党共同民主党。</p><p>警方调查发现，金某与执政党、青瓦台官员有联系，其中包括上月当选庆尚南道知事的前议员、总统文在寅的心腹金庆洙。</p><p>检方指认，金某的亲信都某2016年向鲁会灿非法捐款5000万韩元，并安排金某和鲁会灿见面。韩联社报道，鲁会灿曾经从金某活动的网络论坛获得2000万韩元(12万元人民币)演讲费。</p><p>鲁会灿否认上述指认。首尔一家法院19日拒绝批准特别检察官逮捕都某。</p><p>警方和检方2016年联合调查鲁会灿所涉非法献金案，但没有起诉。</p><p>作为网络水军案调查的一部分，特别检察官许益范(音译)带领特别检察组开始重新调查这起案件，发现都某向调查人员提交伪造证据，致使检方两年前没能提出起诉。</p><p><strong>朝野各党党鞭取消会议</strong></p><p>许益范对鲁会灿之死表达哀悼。他告诉媒体记者，他个人“尊重”鲁会灿，这一“悲剧性消息”令他痛苦。“我为他的灵魂祈祷，向他的家人表达哀悼。”系着黑色领带的许益范在镜头前深深低下头。</p><p>青瓦台同样对鲁会灿之死表达哀悼。“这是令人心碎的事件，”青瓦台发言人金宜谦说，“我希望鲁议员安息。”青瓦台宣布，文在寅取消原定当天听取和回复网络请愿的互联网广播节目。</p><p>鲁会灿所在的正义党说：“对他的逝去，没有语言能够表达悲伤。”正义党当天晚些时候举行紧急会议。</p><p>正义党和另一个在野小党民主和平党今年3月组成议会党团，由鲁会灿担任代表。</p><p>共同民主党发言人白惠莲说：“鲁会灿自上世纪90年代以来就致力于进步派政治，是韩国历史上进步派政治的象征。”</p><p>保守派的最大在野党自由韩国党说，鲁会灿之死是“韩国政治的一个悲剧”，“他作为政治家树立了一个关心普通民众和劳工的榜样”，朝野政党应当延续鲁会灿对政治改革和发展的热忱。</p><p>朝野各党党鞭原定当天上午开会，商讨促进在国会的合作，但在鲁会灿坠楼身亡后取消会议。</p></article></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">31359718,.韩正义党党鞭涉&quot;网络水军案&quot;跳楼 否认干非法勾当,.2018-07-24 06:53:52,.204233,.耿佩,.toutiao</p><p><br/></p>', '', '', '2018-07-24 11:54:09', '2018-07-31 00:00:00', '2018-07-24 11:54:06', '1', '1', '2018-07-24 11:54:03', '2018-07-24 11:54:03');
INSERT INTO `wancll_annoncements` VALUES ('2', '7', '1', '1', '1', '/public/upload/article_images/20180824/0da1e41284a68ed2ba298e4485e52343.png', '[]', '<p>66</p>', '1', '', '2018-08-27 00:00:00', '2018-08-31 00:00:00', '2018-08-24 00:00:00', '1', '0', '2018-08-24 13:14:45', '2018-09-03 11:47:36');
INSERT INTO `wancll_annoncements` VALUES ('3', '29', '外交习语|听！习近平讲非洲故事', '龙', '9月3日至4日举行的2018年中非合作论坛北京峰会，将是中国今年举办的规模最大、外国领导人出席最多的主场外交，也是中非友好大家庭的又一次大团圆，更是中非关系更上一层楼的一座里程碑。\n\n　　这几年，习近平主席在不同场合讲过许多精彩的中非友好故事。下面，我们一起回顾和聆听。', '/public/upload/article_images/20180903/fbfd5680501cc9c25031ad53df8ef33d.png', '[]', '<p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\"><span style=\"font-weight: 600 !important;\"><span style=\"color:navy\">故事1：塞内加尔老人“圆梦”宁夏</span></span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　“2013年，65岁的塞内加尔老人比拉马参加‘感知中国’知识竞赛。他从全球25万名参赛者中脱颖而出，获得了最高奖，并被邀请到中国旅游，实现了多年的访华夙愿。”</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"font-weight: 600 !important;\">——2018年7月20日，习近平主席在塞内加尔《太阳报》发表题为《中国和塞内加尔团结一致》的署名文章</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"font-weight: 600 !important;\">“故事里的事”：</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　“感知中国”知识竞赛由中国媒体发起，对中国一直兴趣浓厚的比拉马积极报名参赛。作为特等奖的获得者，他得到了去“塞上江南”宁夏旅游的机会，从而圆了自己的“中国梦”。首次访华给这位非洲老人留下了美好而深刻的印象。在著名景点沙坡头，他说：“乘坐沙漠冲浪车时的颠簸，让我想到了巴黎-达喀尔汽车拉力赛－－为了夺得桂冠或者仅仅是完成比赛，勇敢的车手们必须驱车穿过大片的沙漠。这真是了不起的壮举。”</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal; text-align: center;\"><img id=\"{9BF320B3-8D57-4C32-A822-ABC81CCF0828}\" title=\"\" src=\"http://www.xinhuanet.com/world/2018-09/01/129944882_15357688533731n.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal; text-align: center;\"><span style=\"color:navy;font-family:楷体\">2017年12月8日，宁夏沙坡头景区内腾格里沙漠一景。新华社记者 隋先凯摄</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"font-weight: 600 !important;\"><span style=\"color:navy\">故事2：津巴布韦儿童“非爱不可”</span></span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　“据我了解，旅居津巴布韦的华侨中间有一个名为‘非爱不可’（Love of Africa）的妈妈团体，还有一位连车牌号都被当地孩子熟知的‘程爸爸’（Father Cheng）。他们多年如一日给当地孤儿送去关爱和温暖，用实际行动书写着中津友好的‘现在时’，也培育着中津友好的‘将来时’。”</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"font-weight: 600 !important;\">——2015年11月30日，习近平主席在津巴布韦《先驱报》发表题为《让中津友谊绽放出更加绚丽的芳华》的署名文章</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"font-weight: 600 !important;\">“故事里的事”：</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　“非爱不可”爱心妈妈团成立于2014年，是津巴布韦华商会名下的一个公益慈善组织，旨在帮助津巴布韦的弱势儿童改善学习和生活条件。短短几年时间，“非爱不可”爱心妈妈团为津巴布韦几十家孤儿院捐助食品、生活用品和娱乐设施，为50多个孤儿筹集学费。2016年8月，“非爱不可”爱心妈妈团还在哈拉雷北郊的贫民区捐建一所孤儿院，接收12名孤儿。一系列大爱无疆的善举得到了津巴布韦政府和老百姓的称赞。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal; text-align: center;\"><img id=\"{66FF3C84-7F1E-4FC4-9D27-8A653C21EC80}\" title=\"\" src=\"http://www.xinhuanet.com/world/2018-09/01/129944882_15357690679031n.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"color:navy;font-family:楷体\">2016年8月12日，一名津巴布韦儿童在“非爱不可”爱心妈妈团捐建的孤儿院内感受新的双层木板床。新华社记者 许林贵摄</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"font-weight: 600 !important;\"><span style=\"color:navy\">故事3：中国玉树有个“刚果小学”</span></span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　“2010年4月，中国青海玉树发生强烈地震后，刚果政府慷慨解囊，向灾区捐建了一所小学，萨苏总统亲自将其命名为‘中刚友谊小学’。现在，灾区的孩子们有了宽敞的新校舍，他们可以安静读书学习，在运动场上奔跑欢笑。该校全体学生在写给萨苏总统的感谢信中动情地说：‘鸟儿因为有了天空的广阔而更加自由，骏马因为有了草原的宽广而更加健壮，鲜花因为有了阳光雨露而更加艳丽，我们的生活因为有了刚果政府和人民的帮助而更加美好。’”</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"font-weight: 600 !important;\">——2013年3月29日，习近平主席在刚果共和国议会发表题为《共同谱写中非人民友谊新篇章》的演讲</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　“故事里的事”：</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　2010年4月14日，中国玉树发生地震。月底，在参加上海世博会开幕式时，刚果共和国总统萨苏表示希望在玉树灾区捐建一所小学。中方考虑到玉树位于青藏高原，捐建一所完整的寄宿小学成本较高、对刚果负担较重，因此建议仅捐建一座教学楼或图书馆。但萨苏随即表示：“不，刚果要捐建的是一所小学，一所完整的小学，不管造价多高，刚果都会承担。”经双方协商，刚果共和国捐赠1600万元人民币用于建设中刚友谊小学。学校占地面积是震前孤儿学校的4倍多、校舍面积是之前的近7倍。学校拥有现代化的教学楼和配套设施，能满足240名学生的就读需求。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal; text-align: center;\"><img id=\"{5927A9B5-AD00-433B-8DAF-D530FABA902A}\" title=\"\" src=\"http://www.xinhuanet.com/world/2018-09/01/129944882_15357697633571n.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal; text-align: center;\"><span style=\"color:navy;font-family:楷体\">2012年7月22日，玉树州称多县中刚友谊小学二年级学生在教室内。 新华社记者 张宏祥摄</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"color:navy\"><span style=\"font-weight: 600 !important;\">故事4：坦桑尼亚热播《媳妇的美好时代》</span></span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　“近年来，随着中非关系发展，中非人民越走越近。一些非洲朋友活跃在中国文艺舞台上，成了中国家喻户晓的明星。中国电视剧《媳妇的美好时代》在坦桑尼亚热播，使坦桑尼亚观众了解到中国老百姓家庭生活的酸甜苦辣。”</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"font-weight: 600 !important;\">——2013年3月25日，习近平主席在坦桑尼亚尼雷尔国际会议中心发表题为《永远做可靠朋友和真诚伙伴》的演讲</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"font-weight: 600 !important;\">“故事里的事”：</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　2011年11月21日，斯瓦西里语版中国电视剧《媳妇的美好时代》在坦桑尼亚开播。作为国家广电总局“中国优秀电视剧走进东非”项目的开局之作，斯瓦西里语版36集《媳妇的美好时代》是首部被翻译成非洲本土语言并进行配音、在非洲的国家电视台播出的中国电视剧。该剧在坦桑尼亚由当地最具号召力的人气明星担纲配音、重新演绎。随后，《媳妇的美好时代》很快成为许多非洲国家的热播剧。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal; text-align: center;\"><img id=\"{89D00E39-74BA-4D36-9C6C-F8C4C7681CF1}\" title=\"\" src=\"http://www.xinhuanet.com/world/2018-09/01/129944882_15357698202801n.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"color:navy;font-family:楷体\">2013年12月11日，《媳妇的美好时代》法语版首播仪式在塞内加尔国家大剧院举行，图为配音演员在介绍自己在电视剧《媳妇的美好时代》中的角色。 新华社记者 邰剑秋摄</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"color:navy\"><span style=\"font-weight: 600 !important;\">故事5：卢旺达有了规模化的服装厂</span></span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　“中国企业家积极响应卡加梅总统提出的‘卢旺达制造’发展战略，创办的服装公司为卢旺达发展本国制造业作出了积极贡献。”</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"font-weight: 600 !important;\">——2018年7月21日，习近平主席在卢旺达《新时代报》发表题为《中卢友谊情比山高》的署名文章</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<span style=\"font-weight: 600 !important;\">“故事里的事”：</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　卢旺达政府当前正推行“卢旺达制造”计划，旨在提升本国制造业的产量和质量，以本国产品替代进口产品并增加出口。曾经，卢旺达没有真正规模化的服装厂，只有小作坊。2015年，中国人开办的C&amp;H服装厂改变了这一状况，不仅解决了1500多个就业岗位，还为当地服装制造业带来了先进的理念、技术和装备。“撸起袖子加油干！”被翻译成英语和当地语挂在墙上，8000平方米的厂房内工人们各司其职，在21条生产线上井井有条地工作。他们生产的服装20%在卢旺达销售，80%出口欧美国家。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal; text-align: center;\"><img id=\"{2F71914A-138D-49AB-8B49-2A293BF463D7}\" title=\"\" src=\"http://www.xinhuanet.com/world/2018-09/01/129944882_15357698703581n.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal; text-align: center;\"><span style=\"color:navy;font-family:楷体\">2018年7月21日，卢旺达工人在繁忙的C&amp;H服装厂车间内工作。新华社记者 饶爱民摄</span></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　习近平主席讲述的一个个生动鲜活的故事，或暖意融融、或鼓舞人心，传递着中非人民之间的深情厚谊。随着2018年中非合作论坛北京峰会的成功举办，相信更多的中非友好故事将会上演。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　（据新华社客户端报道　新华社记者：王卓伦）</p><p><span class=\"tj\" style=\"display: block; position: absolute; z-index: 4; left: 0px; top: 0px; padding: 4px 12px; font-size: 14px; background-color: rgb(52, 140, 236); color: rgb(255, 255, 255);\">图集</span><span class=\"origin\" style=\"display: block; position: absolute; z-index: 4; width: 89px; height: 29px; right: 0px; background-image: url(&quot;http://www.newsimg.cn/xl2017/images/origin.png&quot;); cursor: pointer;\"></span></p><p><span class=\"lb-left s_arrow_left\" style=\"display: block; position: absolute; z-index: 4; top: 0px; margin-top: -40px; left: 0px; width: 22px; height: 64px; background-image: url(&quot;http://www.newsimg.cn/xl2017/images/lb-l.png&quot;); cursor: pointer;\"></span><span class=\"lb-right s_arrow_right\" style=\"display: block; position: absolute; z-index: 4; top: 0px; margin-top: -40px; right: 0px; width: 22px; height: 64px; background-image: url(&quot;http://www.newsimg.cn/xl2017/images/lb-r.png&quot;); cursor: pointer;\"></span></p><p><br/></p>', '', '', '2018-09-03 00:00:00', '2018-09-30 00:00:00', '2018-09-03 00:00:00', '1', '1', '2018-09-03 11:50:13', '2018-09-03 11:50:13');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_articles`
-- -----------------------------
INSERT INTO `wancll_articles` VALUES ('1', '韩正义党党鞭涉\"网络水军案\"跳楼 否认干非法勾当', '/public/upload/article_images/20180728/5ea2c61409318dc9eb0135761a286f83.jpg', '', '<header><h1>韩正义党党鞭涉&quot;网络水军案&quot;跳楼 否认干非法勾当</h1><p><a href=\"https://m.haiwainet.cn/ttc/3541083/2018/0724/content_31359718_1.html#\">北京青年报</a> &nbsp; &nbsp; &nbsp; &nbsp; 07-24 06:53<a style=\"display: none;\" href=\"https://m.haiwainet.cn/ttc/3541083/2018/0724/content_31359718_1.html#\">显示图片</a> &nbsp; &nbsp; &nbsp;</p></header><p><br/></p><article><p class=\"imgs_c\"><img title=\"1532386450835894.jpg\" alt=\"0c39934f2cf33b8e1104970bf304234b.jpg\" src=\"http://v4.wx.wygoo.com/public/upload/ueditor/image/20180724/1532401024112571.jpg\"/></p><p>当地时间23日，韩国首尔，警方在鲁会灿跳楼现场进行调查 供图/视觉中国</p><p>韩国首都首尔警方23日说，在野党正义党党鞭、国会议员鲁会灿当天上午在公寓楼跳楼自尽。</p><p>鲁会灿是韩国劳工运动代表性人物，以清廉形象著称，最近却因牵涉搅动政坛的“网络水军案”接受调查，被指两年前非法收受5000万韩元(约合30万元人民币)政治捐款。警方说，不会作尸检，原因是鲁会灿死亡没有可疑之处，而且家人不同意。</p><p><strong>警方称不会作尸检</strong></p><p>警方官员说，当天上午9时38分，首尔市中心一座公寓楼的保安金某在大门附近发现鲁会灿的尸体，立即报警。</p><p>“我听到砰的一响，然后就在那儿发现了鲁议员，”金某说，“我立即向警方报告这起事件，没有碰任何东西。警察告诉我去看看他还有没有脉搏，我试着做了，但是没有脉搏，尽管当时他摔到地上只有一两分钟。”</p><p>警方稍后在公寓楼17层和18层之间的楼梯间发现一件夹克衫，里面有装着鲁会灿身份证件和名片的钱包，以及一封遗书。</p><p>鲁会灿在遗书中承认拿钱，但否认干非法勾当。他在遗书中写道，他收了那笔钱，但是与任何“不当请求”无关。他对不起自己的家人。</p><p>鲁会灿的母亲和一个兄弟住在这座公寓楼里。</p><p>警方说，不会作尸检，原因是鲁会灿死亡没有可疑之处，而且家人不同意。按照家人的意愿，遗书其他部分不会公开。</p><p>鲁会灿是韩国自前总统卢武铉2009年5月因家人卷入腐败丑闻而跳崖以来，自杀身亡的最知名政治人物。</p><p><strong>经常犀利揭露体制内腐败</strong></p><p>鲁会灿61岁，劳工维权人士出身，三次当选国会议员，是韩国劳工运动和进步派政治标志性人物之一。他经常犀利揭露和尖锐抨击体制内腐败，人气很高。</p><p>只是，鲁会灿近期卷入网络水军案，涉嫌收受非法献金一事，接受检察部门调查，一直以来的清廉形象黯然失色。</p><p>网络水军案主角是博客博主金某，网名“Druking”。检方指认，金某及其团队借助电脑程序在网络新闻下捏造留言和评论，目的是在政治热点议题上操控民意，使舆情有利于现执政党共同民主党。</p><p>警方调查发现，金某与执政党、青瓦台官员有联系，其中包括上月当选庆尚南道知事的前议员、总统文在寅的心腹金庆洙。</p><p>检方指认，金某的亲信都某2016年向鲁会灿非法捐款5000万韩元，并安排金某和鲁会灿见面。韩联社报道，鲁会灿曾经从金某活动的网络论坛获得2000万韩元(12万元人民币)演讲费。</p><p>鲁会灿否认上述指认。首尔一家法院19日拒绝批准特别检察官逮捕都某。</p><p>警方和检方2016年联合调查鲁会灿所涉非法献金案，但没有起诉。</p><p>作为网络水军案调查的一部分，特别检察官许益范(音译)带领特别检察组开始重新调查这起案件，发现都某向调查人员提交伪造证据，致使检方两年前没能提出起诉。</p><p><strong>朝野各党党鞭取消会议</strong></p><p>许益范对鲁会灿之死表达哀悼。他告诉媒体记者，他个人“尊重”鲁会灿，这一“悲剧性消息”令他痛苦。“我为他的灵魂祈祷，向他的家人表达哀悼。”系着黑色领带的许益范在镜头前深深低下头。</p><p>青瓦台同样对鲁会灿之死表达哀悼。“这是令人心碎的事件，”青瓦台发言人金宜谦说，“我希望鲁议员安息。”青瓦台宣布，文在寅取消原定当天听取和回复网络请愿的互联网广播节目。</p><p>鲁会灿所在的正义党说：“对他的逝去，没有语言能够表达悲伤。”正义党当天晚些时候举行紧急会议。</p><p>正义党和另一个在野小党民主和平党今年3月组成议会党团，由鲁会灿担任代表。</p><p>共同民主党发言人白惠莲说：“鲁会灿自上世纪90年代以来就致力于进步派政治，是韩国历史上进步派政治的象征。”</p><p>保守派的最大在野党自由韩国党说，鲁会灿之死是“韩国政治的一个悲剧”，“他作为政治家树立了一个关心普通民众和劳工的榜样”，朝野政党应当延续鲁会灿对政治改革和发展的热忱。</p><p>朝野各党党鞭原定当天上午开会，商讨促进在国会的合作，但在鲁会灿坠楼身亡后取消会议。</p></article><p><br/></p><p>31359718,.韩正义党党鞭涉&quot;网络水军案&quot;跳楼 否认干非法勾当,.2018-07-24 06:53:52,.204233,.耿佩,.toutiao</p><p><br/></p>', '北京青年报', '[]', '', '', '25', '0', '1', '', '1', '2018-07-24 10:57:26', '2018-07-24 10:57:26');
INSERT INTO `wancll_articles` VALUES ('2', '9月你好', '/public/upload/article_images/20180824/5666be1eff868608d8454b5d0efc8c31.png', '', '<p>的方法的奋斗的非官方大哥大哥大对方答复<br/></p>', '大大', '[]', '4343', '344343', '25', '0', '1', '', '0', '2018-08-24 13:10:09', '2018-09-03 11:45:32');
INSERT INTO `wancll_articles` VALUES ('3', '44', '/public/upload/article_images/20180824/6bec19f2686cbbb6a8573f2487947a19.png', '4', '<p>5454545454<br/></p>', '4', '[]', '4', '4', '25', '0', '1', '', '0', '2018-08-24 15:08:06', '2018-09-03 11:45:32');
INSERT INTO `wancll_articles` VALUES ('4', '44', '/public/upload/article_images/20180824/6bec19f2686cbbb6a8573f2487947a19.png', '4', '<p>5454545454<br/></p>', '4', '[]', '4', '4', '25', '0', '1', '', '0', '2018-08-24 15:08:06', '2018-09-03 11:45:32');
INSERT INTO `wancll_articles` VALUES ('5', '44', '/public/upload/article_images/20180824/6bec19f2686cbbb6a8573f2487947a19.png', '4', '<p>5454545454<br/></p>', '4', '[]', '4', '4', '25', '0', '1', '', '0', '2018-08-24 15:08:06', '2018-09-03 11:45:32');
INSERT INTO `wancll_articles` VALUES ('6', '65', '/public/upload/article_images/20180824/41557b04fca07d46651b985764fb4cbd.png', '56', '<p>565656<br/></p>', '56', '[]', '56', '56', '25', '0', '1', '', '0', '2018-08-24 15:10:37', '2018-09-03 11:45:32');
INSERT INTO `wancll_articles` VALUES ('7', '65', '/public/upload/article_images/20180824/41557b04fca07d46651b985764fb4cbd.png', '56', '<p>565656<br/></p>', '56', '[]', '56', '56', '26', '0', '1', '', '0', '2018-08-24 15:10:37', '2018-09-03 11:45:32');
INSERT INTO `wancll_articles` VALUES ('8', '1', '', '1', '', '1', '[]', '1', '1', '27', '0', '1', '', '0', '2018-09-04 09:54:00', '2018-09-04 09:54:04');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_attr_templates`
-- -----------------------------
INSERT INTO `wancll_attr_templates` VALUES ('1', '衣服属性模板', '', '[{\"name\":\"品牌\",\"options\":[\"轩斯顿（XUANSIDUN）\"]},{\"name\":\"商品名称\",\"options\":[\"轩斯顿 短袖T恤\"]},{\"name\":\"商品编号\",\"options\":[\"27069258521\"]},{\"name\":\"商品重量\",\"options\":[\"500.00g\"]},{\"name\":\"商品产地\",\"options\":[\"中国大陆\"]},{\"name\":\"厚度\",\"options\":[\"常规\"]},{\"name\":\"领型\",\"options\":[\"连帽\"]},{\"name\":\"颜色\",\"options\":[\"灰色\"]},{\"name\":\"袖长\",\"options\":[\"五分袖\"]}]', '0', '1', '2018-07-24 10:45:13', '2018-07-24 10:45:13');
INSERT INTO `wancll_attr_templates` VALUES ('2', '颜色', '颜色属性', '[{\"name\":\"红\",\"options\":[\"大红\",\"深红\"]},{\"name\":\"黑\",\"options\":[\"非常黑\",\"一般黑\"]}]', '0', '1', '2018-08-24 08:02:58', '2018-08-24 08:02:58');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_bank_cards`
-- -----------------------------
INSERT INTO `wancll_bank_cards` VALUES ('1', '12', '中国农业银行', '621661750000468428', '大牛', '1', '2018-08-24 13:46:09', '2018-08-24 13:46:09');
INSERT INTO `wancll_bank_cards` VALUES ('2', '12', '中国农业银行', '621661750000468428', '大牛', '1', '2018-08-24 13:46:10', '2018-08-24 13:46:10');
INSERT INTO `wancll_bank_cards` VALUES ('3', '12', '中国农业银行', '621661750000ghh8428', '大牛', '1', '2018-08-24 13:46:10', '2018-08-24 13:46:10');
INSERT INTO `wancll_bank_cards` VALUES ('4', '14', '中国农业银行', '发货哈了咖啡卡卡了；啊', '1', '1', '2018-08-31 15:24:48', '2018-08-31 15:24:48');
INSERT INTO `wancll_bank_cards` VALUES ('5', '2', '中国农业银行', '1', '1', '1', '2018-08-31 15:40:14', '2018-08-31 15:40:14');
INSERT INTO `wancll_bank_cards` VALUES ('6', '18', '中国农业银行', 'dabhdadh到爱的奇偶假的', '111', '0', '2018-09-01 13:54:04', '2018-09-01 13:54:22');
INSERT INTO `wancll_bank_cards` VALUES ('7', '18', '中国银行', '@1Sb智障；', '胸带', '1', '2018-09-01 13:55:04', '2018-09-01 13:55:04');
INSERT INTO `wancll_bank_cards` VALUES ('8', '2', '中国农业银行', '1', '1', '0', '2018-09-04 10:36:25', '2018-09-04 10:36:29');

-- -----------------------------
-- Table structure for `wancll_banners`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_banners`;
CREATE TABLE `wancll_banners` (
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_banners`
-- -----------------------------
INSERT INTO `wancll_banners` VALUES ('1', '11', 'wap轮播图1', '/public/upload/article_images/20180901/286b2fd72c4ea1ab17f9ac6d4643fd98.jpg', '', '', '', '', '1', '0', '', '0', '1', '2018-07-24 15:20:33', '2018-07-24 15:20:33');
INSERT INTO `wancll_banners` VALUES ('2', '11', 'wap轮播图2', '/public/upload/article_images/20180901/ef8565cb4dc71863a93659a804db1f71.jpg', '', '', '', '', '1', '0', '', '0', '1', '2018-07-24 15:21:30', '2018-07-24 15:21:30');
INSERT INTO `wancll_banners` VALUES ('3', '11', 'wap轮播图3', '/public/upload/article_images/20180901/2a4249e80bdec0098a937dc2c45385eb.jpg', '', '', '', '', '1', '0', '', '0', '1', '2018-07-24 15:21:47', '2018-07-24 15:21:47');
INSERT INTO `wancll_banners` VALUES ('4', '10', 'Pc轮播图', '/public/upload/article_images/20180827/f2f0f6ba8a22e7d6317eaa05615533fc.png', '3', '3', '3', '', '1', '0', '', '0', '1', '2018-08-27 17:18:43', '2018-08-27 17:18:43');
INSERT INTO `wancll_banners` VALUES ('5', '28', 'WAP领券中心轮播图1', '/public/upload/article_images/20180901/357e04a39838f01493ac9ce7a7e342a0.png', '', '', '', '', '1', '0', '', '0', '1', '2018-09-01 15:20:47', '2018-09-01 15:20:47');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_bonus_applys`
-- -----------------------------
INSERT INTO `wancll_bonus_applys` VALUES ('1', '17', 'B2018090110520733630', 'money', '[46,50,52,53,54,57,61,65,70,75,80,89,94,99,104]', '2233.62', '2233.62', '申请分红提现', '申请分红提现：2233.62￥，申请时间：2018-09-01 10:52:07', '', '2018-09-01 16:41:31', '2018-09-01 16:41:31', '1', '3', '1', '2018-09-01 10:52:07', '2018-09-01 16:41:31');
INSERT INTO `wancll_bonus_applys` VALUES ('2', '17', 'B2018090116132851326', 'money', '[108,120,124,125,126,131,132]', '1583.82', '1583.82', '申请分红提现', '申请分红提现：1583.82￥，申请时间：2018-09-01 16:13:28', '', '2018-09-01 16:15:31', '2018-09-01 16:15:31', '1', '3', '1', '2018-09-01 16:13:28', '2018-09-01 16:15:31');
INSERT INTO `wancll_bonus_applys` VALUES ('3', '17', 'B2018090116133887557', 'money', '[]', '0.00', '0.00', '申请分红提现', '申请分红提现：0￥，申请时间：2018-09-01 16:13:38', '', '2018-09-01 16:15:27', '2018-09-01 16:15:27', '1', '3', '1', '2018-09-01 16:13:38', '2018-09-01 16:15:27');
INSERT INTO `wancll_bonus_applys` VALUES ('4', '17', 'B2018090116135002593', 'money', '[]', '0.00', '0.00', '申请分红提现', '申请分红提现：0￥，申请时间：2018-09-01 16:13:50', '', '2018-09-01 16:15:24', '2018-09-01 16:15:24', '1', '3', '1', '2018-09-01 16:13:50', '2018-09-01 16:15:24');
INSERT INTO `wancll_bonus_applys` VALUES ('5', '2', 'B2018090116143846134', 'money', '[7,8,11,14,17,20,23,26,31,34,35,38,39,40,41,42,47,51,58,62,66,67,71,72,76,77,81,82,90,91,95,96,100,101,105,109,112,113,116,117,121,127,128,133,134]', '5545.42', '5545.42', '申请分红提现', '申请分红提现：5545.42￥，申请时间：2018-09-01 16:14:38', '', '2018-09-01 16:15:20', '2018-09-01 16:15:20', '1', '3', '1', '2018-09-01 16:14:38', '2018-09-01 16:15:20');
INSERT INTO `wancll_bonus_applys` VALUES ('6', '17', 'B2018090116161713738', 'money', '[]', '0.00', '0.00', '申请分红提现', '申请分红提现：0￥，申请时间：2018-09-01 16:16:17', '', '2018-09-01 16:16:31', '2018-09-01 16:16:31', '1', '3', '1', '2018-09-01 16:16:17', '2018-09-01 16:16:31');
INSERT INTO `wancll_bonus_applys` VALUES ('7', '17', 'B2018090116243431593', 'money', '[]', '0.00', '0.00', '申请分红提现', '申请分红提现：0￥，申请时间：2018-09-01 16:24:34', '', '2018-09-01 16:42:21', '2018-09-01 16:42:21', '1', '3', '1', '2018-09-01 16:24:34', '2018-09-01 16:42:21');
INSERT INTO `wancll_bonus_applys` VALUES ('8', '17', 'B2018090309262580506', 'money', '[141,142,145,146,149,150,153,154,159,160,163,164]', '26200.00', '26200.00', '申请分红提现', '申请分红提现：26200￥，申请时间：2018-09-03 09:26:25', '', '2018-09-03 09:32:37', '2018-09-03 09:32:37', '1', '3', '1', '2018-09-03 09:26:25', '2018-09-03 09:32:37');
INSERT INTO `wancll_bonus_applys` VALUES ('9', '2', 'B2018090309301491738', 'money', '[143,144,147,148,151,152,155,156,161,162,165,166]', '24000.00', '24000.00', '申请分红提现', '申请分红提现：24000￥，申请时间：2018-09-03 09:30:14', '', '2018-09-03 09:32:33', '2018-09-03 09:32:33', '1', '3', '1', '2018-09-03 09:30:14', '2018-09-03 09:32:33');
INSERT INTO `wancll_bonus_applys` VALUES ('10', '17', 'B2018090310302518085', 'money', '[171,172,174,175,178,179]', '6338.00', '', '申请分红提现', '申请分红提现：6338￥，申请时间：2018-09-03 10:30:25', '', '2018-09-03 10:30:42', '', '0', '2', '1', '2018-09-03 10:30:25', '2018-09-03 10:30:42');

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
INSERT INTO `wancll_bonus_levels` VALUES ('1', '0', '会员分红商', '1.00', '0', '1', '1', '2018-06-03 17:47:53', '2018-08-31 17:35:12');
INSERT INTO `wancll_bonus_levels` VALUES ('2', '1', '主管分红商', '6.00', '100', '1', '1', '2018-06-03 17:49:02', '2018-08-31 17:35:12');
INSERT INTO `wancll_bonus_levels` VALUES ('3', '2', '经理分红商', '5.00', '500', '1', '1', '2018-06-03 17:50:11', '2018-08-31 17:35:12');
INSERT INTO `wancll_bonus_levels` VALUES ('4', '3', '董事分红商', '18.00', '1000', '1', '1', '2018-06-03 17:50:34', '2018-08-31 17:35:12');

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_carts`
-- -----------------------------
INSERT INTO `wancll_carts` VALUES ('1', '3', '2', '212009b774a03875900111b1556c6bbd', '1', '1', '1', '2018-08-21 11:23:29', '2018-08-21 11:23:29');
INSERT INTO `wancll_carts` VALUES ('2', '3', '2', '3ecaf83e4b58258b2708e71f5153c28f', '1', '1', '1', '2018-08-21 11:23:33', '2018-08-21 11:23:33');
INSERT INTO `wancll_carts` VALUES ('3', '6', '4', 'bae05d8d2bda242ab4579038dde5914e', '1', '1', '1', '2018-08-24 09:36:20', '2018-08-24 09:36:20');
INSERT INTO `wancll_carts` VALUES ('4', '12', '5', 'aefef5355ad49bd95bf17ab9c94359e4', '1', '1', '0', '2018-08-24 13:34:51', '2018-08-24 13:36:09');
INSERT INTO `wancll_carts` VALUES ('6', '12', '5', '6115eedc743452f7cf13d8f0af09540f', '2', '1', '1', '2018-08-24 13:37:55', '2018-08-24 13:37:56');
INSERT INTO `wancll_carts` VALUES ('7', '2', '6', '15af5a6922cb75a5c1e7dcb0fab322dd', '2', '1', '0', '2018-08-31 16:10:32', '2018-08-31 16:18:23');
INSERT INTO `wancll_carts` VALUES ('18', '2', '1', 'f151bcf787d73a0cb29fd360d7f6f598', '1', '1', '1', '2018-09-01 15:40:58', '2018-09-01 15:40:58');
INSERT INTO `wancll_carts` VALUES ('12', '18', '5', 'aefef5355ad49bd95bf17ab9c94359e4', '1', '1', '1', '2018-09-01 09:20:51', '2018-09-01 09:20:51');
INSERT INTO `wancll_carts` VALUES ('13', '18', '6', '15af5a6922cb75a5c1e7dcb0fab322dd', '1', '1', '1', '2018-09-01 09:20:59', '2018-09-01 09:20:59');
INSERT INTO `wancll_carts` VALUES ('14', '18', '2', 'ebf7862a9bb6255ddad83eaed2ca94a8', '1', '1', '1', '2018-09-01 09:21:11', '2018-09-01 09:21:11');
INSERT INTO `wancll_carts` VALUES ('15', '18', '1', 'f151bcf787d73a0cb29fd360d7f6f598', '1', '1', '1', '2018-09-01 09:21:19', '2018-09-01 09:21:19');

-- -----------------------------
-- Table structure for `wancll_categories`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_categories`;
CREATE TABLE `wancll_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT '0' COMMENT '父分类id;0为顶层',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序：数值越大越靠前',
  `status` tinyint(4) DEFAULT '1' COMMENT '1正常2禁用',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_categories`
-- -----------------------------
INSERT INTO `wancll_categories` VALUES ('1', '0', '广告类别', '50', '1', '1', '2018-06-28 14:20:08', '2018-06-29 21:12:36');
INSERT INTO `wancll_categories` VALUES ('2', '1', '文章广告', '0', '1', '1', '2018-06-28 14:20:18', '2018-06-29 22:20:28');
INSERT INTO `wancll_categories` VALUES ('3', '1', 'WAP首页广告', '3', '1', '1', '2018-06-29 15:51:20', '2018-06-29 15:51:20');
INSERT INTO `wancll_categories` VALUES ('4', '1', '产品广告', '1', '1', '1', '2018-06-29 16:23:08', '2018-06-29 16:23:08');
INSERT INTO `wancll_categories` VALUES ('5', '0', '通知公告类别', '40', '1', '1', '2018-06-29 21:25:13', '2018-06-30 09:15:24');
INSERT INTO `wancll_categories` VALUES ('6', '5', '系统公告', '0', '1', '1', '2018-06-29 21:25:42', '2018-06-29 21:25:42');
INSERT INTO `wancll_categories` VALUES ('7', '5', '产品公告', '0', '1', '1', '2018-06-29 21:26:07', '2018-06-29 21:26:07');
INSERT INTO `wancll_categories` VALUES ('8', '5', '升级公告', '0', '1', '1', '2018-06-29 21:26:34', '2018-06-29 21:26:34');
INSERT INTO `wancll_categories` VALUES ('9', '0', '轮播图类别', '30', '1', '1', '2018-06-29 21:26:52', '2018-06-29 21:26:52');
INSERT INTO `wancll_categories` VALUES ('10', '9', 'PC端轮播图', '0', '1', '1', '2018-06-29 21:27:15', '2018-06-29 21:27:15');
INSERT INTO `wancll_categories` VALUES ('11', '9', 'WAP端首页轮播图', '0', '1', '1', '2018-06-29 21:27:33', '2018-07-28 11:03:11');
INSERT INTO `wancll_categories` VALUES ('12', '9', 'APP端轮播图', '0', '1', '1', '2018-06-29 21:28:05', '2018-06-29 21:28:05');
INSERT INTO `wancll_categories` VALUES ('13', '0', '友情链接类别', '20', '1', '1', '2018-06-29 21:28:26', '2018-06-29 21:28:26');
INSERT INTO `wancll_categories` VALUES ('14', '13', '行业友链', '0', '1', '1', '2018-06-29 21:28:46', '2018-06-29 21:28:46');
INSERT INTO `wancll_categories` VALUES ('15', '13', '系统友链', '0', '1', '1', '2018-06-29 21:29:11', '2018-06-29 21:29:11');
INSERT INTO `wancll_categories` VALUES ('16', '0', '规则类别', '10', '1', '1', '2018-06-29 21:29:30', '2018-06-29 21:29:30');
INSERT INTO `wancll_categories` VALUES ('17', '16', '注册规则', '0', '1', '1', '2018-06-29 21:29:51', '2018-06-29 21:29:51');
INSERT INTO `wancll_categories` VALUES ('18', '16', '支付规则', '0', '1', '1', '2018-06-29 21:30:10', '2018-06-29 21:30:10');
INSERT INTO `wancll_categories` VALUES ('19', '16', '活动规则', '0', '1', '1', '2018-06-29 21:30:25', '2018-06-29 21:30:25');
INSERT INTO `wancll_categories` VALUES ('20', '0', '指导手册类别', '5', '1', '1', '2018-06-29 22:03:54', '2018-06-29 22:03:54');
INSERT INTO `wancll_categories` VALUES ('21', '20', '开发说明', '0', '1', '1', '2018-06-29 22:04:21', '2018-06-29 22:04:21');
INSERT INTO `wancll_categories` VALUES ('22', '20', '使用说明', '0', '1', '1', '2018-06-29 22:04:32', '2018-06-29 22:04:32');
INSERT INTO `wancll_categories` VALUES ('23', '20', '维护说明', '0', '1', '1', '2018-06-29 22:04:52', '2018-06-29 22:04:52');
INSERT INTO `wancll_categories` VALUES ('24', '0', '文章分类', '60', '1', '1', '2018-06-30 09:48:01', '2018-06-30 09:48:01');
INSERT INTO `wancll_categories` VALUES ('25', '24', '文章分类1', '0', '1', '1', '2018-06-30 09:48:29', '2018-06-30 09:48:29');
INSERT INTO `wancll_categories` VALUES ('26', '24', '文章分类2', '0', '1', '1', '2018-06-30 10:03:22', '2018-06-30 10:03:22');
INSERT INTO `wancll_categories` VALUES ('27', '26', '文章分类2-1', '0', '1', '1', '2018-06-30 10:04:09', '2018-06-30 10:04:09');
INSERT INTO `wancll_categories` VALUES ('28', '9', 'WAP领券中心轮播图', '0', '1', '1', '2018-09-01 15:20:06', '2018-09-01 15:20:06');
INSERT INTO `wancll_categories` VALUES ('29', '5', 'WAP首页公告', '0', '1', '1', '2018-09-01 15:33:59', '2018-09-01 15:33:59');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_commission_applys`
-- -----------------------------
INSERT INTO `wancll_commission_applys` VALUES ('1', '17', 'F2018090110433107068', 'money', '[7,10,12,14,16,18,20,22,24,26,28,32,34,36,38]', '2661.56', '2661.56', '申请佣金提现', '申请佣金提现：2661.56￥，申请时间：2018-09-01 10:43:31', '', '2018-09-01 10:52:38', '2018-09-01 10:52:38', '1', '3', '1', '2018-09-01 10:43:31', '2018-09-01 10:52:38');
INSERT INTO `wancll_commission_applys` VALUES ('2', '17', 'F2018090116131731918', 'money', '[43,45,47,49]', '944.85', '944.85', '申请佣金提现', '申请佣金提现：944.85￥，申请时间：2018-09-01 16:13:17', '', '2018-09-01 16:15:05', '2018-09-01 16:15:05', '1', '3', '1', '2018-09-01 16:13:17', '2018-09-01 16:15:05');
INSERT INTO `wancll_commission_applys` VALUES ('3', '2', 'F2018090116142890123', 'money', '[1,2,3,4,8,11,13,15,17,19,21,23,25,27,29,33,35,37,39,40,41,42,44,46,48,50]', '4462.35', '4462.35', '申请佣金提现', '申请佣金提现：4462.35￥，申请时间：2018-09-01 16:14:28', '', '2018-09-01 16:14:57', '2018-09-01 16:14:57', '1', '3', '1', '2018-09-01 16:14:28', '2018-09-01 16:14:57');
INSERT INTO `wancll_commission_applys` VALUES ('4', '17', 'F2018090309263607136', 'money', '[53,55,57,59,62,64]', '13200.00', '13200.00', '申请佣金提现', '申请佣金提现：13200￥，申请时间：2018-09-03 09:26:36', '', '2018-09-03 09:27:06', '2018-09-03 09:27:06', '1', '3', '1', '2018-09-03 09:26:36', '2018-09-03 09:27:06');
INSERT INTO `wancll_commission_applys` VALUES ('5', '2', 'F2018090309300604209', 'money', '[54,56,58,60,63,65]', '9600.00', '9600.00', '申请佣金提现', '申请佣金提现：9600￥，申请时间：2018-09-03 09:30:06', '', '2018-09-03 09:32:20', '2018-09-03 09:32:20', '1', '3', '1', '2018-09-03 09:30:06', '2018-09-03 09:32:20');
INSERT INTO `wancll_commission_applys` VALUES ('6', '17', 'F2018090310301745821', 'money', '[68,70,72]', '3315.00', '3315.00', '申请佣金提现', '申请佣金提现：3315￥，申请时间：2018-09-03 10:30:17', '', '2018-09-04 10:27:44', '2018-09-04 10:27:44', '1', '3', '1', '2018-09-03 10:30:17', '2018-09-04 10:27:44');
INSERT INTO `wancll_commission_applys` VALUES ('7', '2', 'F2018090410284155947', 'money', '[69,71,73]', '2413.00', '', '申请佣金提现', '申请佣金提现：2413￥，申请时间：2018-09-04 10:28:41', '', '', '', '0', '1', '1', '2018-09-04 10:28:41', '2018-09-04 10:28:55');

-- -----------------------------
-- Table structure for `wancll_commission_goods_levels`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_commission_goods_levels`;
CREATE TABLE `wancll_commission_goods_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `distributor_level_id` bigint(20) NOT NULL COMMENT '分销商等级ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `commission_1_use_type` varchar(10) NOT NULL COMMENT '一级分销的类别：rate比例money金额',
  `commission_1_value` decimal(10,2) NOT NULL COMMENT '一级分销的值',
  `commission_2_use_type` varchar(10) NOT NULL COMMENT '二级分销的类别：rate比例money金额',
  `commission_2_value` decimal(10,2) NOT NULL COMMENT '二级分销值',
  `commission_3_use_type` varchar(10) NOT NULL COMMENT '三级分销的类别：rate比例money金额',
  `commission_3_value` decimal(10,2) NOT NULL COMMENT '三级分销值',
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
INSERT INTO `wancll_custom_indexbannergoods` VALUES ('1', '/public/upload/user_images/20180804/df4811921ae5bdf8a3af01688cdd7ab6.jpg', '/', '');
INSERT INTO `wancll_custom_indexbannergoods` VALUES ('2', '/public/upload/user_images/20180804/acf8539a62446c66a49c98cb88f51f90.jpg', '/', '');

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
INSERT INTO `wancll_custom_pcindexgoods` VALUES ('10', '家装个护', '/public/upload/images/1525332043954.jpg', '5,6,7,8,9,10,11,12,13,14', '防守打法', '/public/upload/images/1524732437831.jpg');
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
INSERT INTO `wancll_custom_waplogo` VALUES ('2', '/public/upload/user_images/20180804/bcbf0db623ee45029d73d9c92dcf251d.jpg', '/public/upload/user_images/20180804/3ba49f995d6ed33be4952303b6db986c.jpg');

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_dds`
-- -----------------------------
INSERT INTO `wancll_dds` VALUES ('9', '首页轮播商品', 'indexbannergoods', '', '', '1', '2018-04-17 11:33:54', '2018-04-17 11:33:54');
INSERT INTO `wancll_dds` VALUES ('11', 'pc首页商品配置', 'pcindexgoods', '', '', '1', '2018-04-25 10:59:20', '2018-04-25 10:59:20');
INSERT INTO `wancll_dds` VALUES ('13', '手机端logo', 'waplogo', '', '', '1', '2018-05-07 15:46:25', '2018-05-07 15:46:25');
INSERT INTO `wancll_dds` VALUES ('15', 'pc端logo', 'pclogo', '', '', '1', '2018-05-09 10:20:32', '2018-05-09 10:20:32');
INSERT INTO `wancll_dds` VALUES ('16', '底部链接文章', 'foottext', '', '', '1', '2018-05-09 10:26:29', '2018-05-09 10:26:29');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_distributor_levels`
-- -----------------------------
INSERT INTO `wancll_distributor_levels` VALUES ('1', '0', '普通分销商', '11.00', '8.00', '5.00', '0', '1', '1', '2018-06-03 12:42:20', '2018-06-03 12:42:20');
INSERT INTO `wancll_distributor_levels` VALUES ('2', '1', '合伙人', '11.00', '9.00', '7.00', '1000', '1', '1', '2018-06-03 12:42:54', '2018-06-04 13:53:42');
INSERT INTO `wancll_distributor_levels` VALUES ('3', '2', '银牌分销商', '13.00', '11.00', '9.00', '2000', '1', '1', '2018-06-03 12:43:30', '2018-06-03 12:43:30');
INSERT INTO `wancll_distributor_levels` VALUES ('4', '3', '金牌分销商', '15.00', '13.00', '11.00', '5000', '1', '1', '2018-06-03 12:43:57', '2018-06-03 12:43:57');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_feedbacks`
-- -----------------------------
INSERT INTO `wancll_feedbacks` VALUES ('1', '14', '', '', '功能异常', '1', '1', '1', '1', '2018-08-31 15:14:35', '2018-09-03 11:40:35');
INSERT INTO `wancll_feedbacks` VALUES ('2', '14', '', '', '功能改进', '2', '1', '1', '1', '2018-08-31 15:14:40', '2018-09-03 11:40:35');
INSERT INTO `wancll_feedbacks` VALUES ('3', '14', '', '', '功能异常', '3', '1', '1', '1', '2018-08-31 15:14:56', '2018-09-03 11:40:35');
INSERT INTO `wancll_feedbacks` VALUES ('4', '14', '', '', '功能异常', '3', '1', '1', '1', '2018-08-31 15:14:56', '2018-09-03 11:40:35');
INSERT INTO `wancll_feedbacks` VALUES ('5', '2', '', '', '功能异常', '2323', '1', '1', '1', '2018-09-01 16:14:18', '2018-09-03 11:40:35');
INSERT INTO `wancll_feedbacks` VALUES ('6', '14', '', '', '功能异常', '1', '1', '0', '1', '2018-09-04 10:39:35', '2018-09-04 10:39:35');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_freight_templates`
-- -----------------------------
INSERT INTO `wancll_freight_templates` VALUES ('1', '运费模板', '', '2', '1.00', '10.00', '1.00', '1.00', '[]', '0', '1', '2018-07-24 11:26:54', '2018-07-24 11:26:54');
INSERT INTO `wancll_freight_templates` VALUES ('2', '模板一', '', '1', '10.00', '10.00', '10.00', '10.00', '[{\"basic_value\":\"10\",\"basic_price\":\"10\",\"add_value\":\"10\",\"add_price\":\"10\",\"area_codes\":[\"540000\",\"540100\",\"540101\",\"540102\",\"540103\",\"540121\",\"540122\",\"540123\",\"540124\",\"540126\",\"540127\",\"540200\",\"540202\",\"540221\",\"540222\",\"540223\",\"540224\",\"540225\",\"540226\",\"540227\",\"540228\",\"540229\",\"540230\",\"540231\",\"540232\",\"540233\",\"540234\",\"540235\",\"540236\",\"540237\",\"540300\",\"540302\",\"540321\",\"540322\",\"540323\",\"540324\",\"540325\",\"540326\",\"540327\",\"540328\",\"540329\",\"540330\",\"540400\",\"540402\",\"540421\",\"540422\",\"540423\",\"540424\",\"540425\",\"540426\",\"540500\",\"540501\",\"540502\",\"540521\",\"540522\",\"540523\",\"540524\",\"540525\",\"540526\",\"540527\",\"540528\",\"540529\",\"540530\",\"540531\",\"542400\",\"542421\",\"542422\",\"542423\",\"542424\",\"542425\",\"542426\",\"542427\",\"542428\",\"542429\",\"542430\",\"542431\",\"542500\",\"542521\",\"542522\",\"542523\",\"542524\",\"542525\",\"542526\",\"542527\",\"650000\",\"650100\",\"650101\",\"650102\",\"650103\",\"650104\",\"650105\",\"650106\",\"650107\",\"650109\",\"650121\",\"650200\",\"650201\",\"650202\",\"650203\",\"650204\",\"650205\",\"650400\",\"650402\",\"650421\",\"650422\",\"650500\",\"650502\",\"650521\",\"650522\",\"652300\",\"652301\",\"652302\",\"652323\",\"652324\",\"652325\",\"652327\",\"652328\",\"652700\",\"652701\",\"652702\",\"652722\",\"652723\",\"652800\",\"652801\",\"652822\",\"652823\",\"652824\",\"652825\",\"652826\",\"652827\",\"652828\",\"652829\",\"652900\",\"652901\",\"652922\",\"652923\",\"652924\",\"652925\",\"652926\",\"652927\",\"652928\",\"652929\",\"653000\",\"653001\",\"653022\",\"653023\",\"653024\",\"653100\",\"653101\",\"653121\",\"653122\",\"653123\",\"653124\",\"653125\",\"653126\",\"653127\",\"653128\",\"653129\",\"653130\",\"653131\",\"653200\",\"653201\",\"653221\",\"653222\",\"653223\",\"653224\",\"653225\",\"653226\",\"653227\",\"654000\",\"654002\",\"654003\",\"654004\",\"654021\",\"654022\",\"654023\",\"654024\",\"654025\",\"654026\",\"654027\",\"654028\",\"654200\",\"654201\",\"654202\",\"654221\",\"654223\",\"654224\",\"654225\",\"654226\",\"654300\",\"654301\",\"654321\",\"654322\",\"654323\",\"654324\",\"654325\",\"654326\",\"659000\",\"659001\",\"659002\",\"659003\",\"659004\",\"659006\"]}]', '0', '1', '2018-08-15 14:45:45', '2018-08-15 14:45:45');
INSERT INTO `wancll_freight_templates` VALUES ('3', '重量计费', '重量', '1', '2.00', '20.00', '0.20', '2.00', '[{\"basic_value\":\"2\",\"basic_price\":\"30\",\"add_value\":\"0.2\",\"add_price\":\"5\",\"area_codes\":[\"110000\",\"110100\",\"110101\",\"110102\",\"110105\",\"110106\",\"110107\",\"110108\",\"110109\",\"110111\",\"110112\",\"110113\",\"110114\",\"110115\",\"110116\",\"110117\",\"110118\",\"110119\",\"120000\",\"120100\",\"120101\",\"120102\",\"120103\",\"120104\",\"120105\",\"120106\",\"120110\",\"120111\",\"120112\",\"120113\",\"120114\",\"120115\",\"120116\",\"120117\",\"120118\",\"120119\",\"130000\",\"130100\",\"130101\",\"130102\",\"130104\",\"130105\",\"130107\",\"130108\",\"130109\",\"130110\",\"130111\",\"130121\",\"130123\",\"130125\",\"130126\",\"130127\",\"130128\",\"130129\",\"130130\",\"130131\",\"130132\",\"130133\",\"130183\",\"130184\",\"130200\",\"130201\",\"130202\",\"130203\",\"130204\",\"130205\",\"130207\",\"130208\",\"130209\",\"130223\",\"130224\",\"130225\",\"130227\",\"130229\",\"130281\",\"130283\",\"130300\",\"130301\",\"130302\",\"130303\",\"130304\",\"130306\",\"130321\",\"130322\",\"130324\",\"130400\",\"130401\",\"130402\",\"130403\",\"130404\",\"130406\",\"130421\",\"130423\",\"130424\",\"130425\",\"130426\",\"130427\",\"130428\",\"130429\",\"130430\",\"130431\",\"130432\",\"130433\",\"130434\",\"130435\",\"130481\",\"130500\",\"130501\",\"130502\",\"130503\",\"130521\",\"130522\",\"130523\",\"130524\",\"130525\",\"130526\",\"130527\",\"130528\",\"130529\",\"130530\",\"130531\",\"130532\",\"130533\",\"130534\",\"130535\",\"130581\",\"130582\",\"130600\",\"130601\",\"130602\",\"130606\",\"130607\",\"130608\",\"130609\",\"130623\",\"130624\",\"130626\",\"130627\",\"130628\",\"130629\",\"130630\",\"130631\",\"130632\",\"130633\",\"130634\",\"130635\",\"130636\",\"130637\",\"130638\",\"130681\",\"130683\",\"130684\",\"130700\",\"130701\",\"130702\",\"130703\",\"130705\",\"130706\",\"130708\",\"130709\",\"130722\",\"130723\",\"130724\",\"130725\",\"130726\",\"130727\",\"130728\",\"130730\",\"130731\",\"130732\",\"130800\",\"130801\",\"130802\",\"130803\",\"130804\",\"130821\",\"130822\",\"130823\",\"130824\",\"130825\",\"130826\",\"130827\",\"130828\",\"130900\",\"130901\",\"130902\",\"130903\",\"130921\",\"130922\",\"130923\",\"130924\",\"130925\",\"130926\",\"130927\",\"130928\",\"130929\",\"130930\",\"130981\",\"130982\",\"130983\",\"130984\",\"131000\",\"131001\",\"131002\",\"131003\",\"131022\",\"131023\",\"131024\",\"131025\",\"131026\",\"131028\",\"131081\",\"131082\",\"131100\",\"131101\",\"131102\",\"131103\",\"131121\",\"131122\",\"131123\",\"131124\",\"131125\",\"131126\",\"131127\",\"131128\",\"131182\",\"139000\",\"139001\",\"139002\"]}]', '0', '1', '2018-08-24 08:00:59', '2018-08-24 08:00:59');

-- -----------------------------
-- Table structure for `wancll_friendly_links`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_friendly_links`;
CREATE TABLE `wancll_friendly_links` (
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_friendly_links`
-- -----------------------------
INSERT INTO `wancll_friendly_links` VALUES ('1', '15', '6', '', '6', '', '6', '6', '1', '0', '', '0', '1', '2018-08-27 17:13:37', '2018-08-27 17:13:37');
INSERT INTO `wancll_friendly_links` VALUES ('2', '14', '66', 'http://v4.wx.wygoo.com/public/upload/article_images/20180827/f14838766aee41c9f3556f0716073b72.png', '6', '', '6', '6', '1', '1', 'article', '6', '1', '2018-08-27 17:13:52', '2018-08-27 17:13:52');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods`
-- -----------------------------
INSERT INTO `wancll_goods` VALUES ('1', '11', '', '', '0', '测试商品', '/public/upload/goods_images/20180720\\e05a5778b4d7f83d67ab3414fa22bb23.png', '[\"\\/public\\/upload\\/goods_images\\/20180720\\\\d5e0376a3578b918771369d88b9da82a.jpg\"]', '', '', '', '97', '0.00', '0.00', '100.00', '0.00', '0.00', '[\"精品\",\"热销品\"]', '3', '0', '0', '0', '0', '5', '1', '[]', '[]', '0', '0', '2018-07-20 09:04:21', '2018-09-03 17:54:14');
INSERT INTO `wancll_goods` VALUES ('2', '3', '', '', '0', '轩斯顿 短袖T恤男士卫衣', '/public/upload/goods_images/20180903/31adebb9513b502c940947a15087f7fd.jpg', '[\"\\/public\\/upload\\/goods_images\\/20180903\\/abe06b43499987c9008d19c2a7222ad2.jpg\",\"\\/public\\/upload\\/goods_images\\/20180903\\/baed7fed34797dc0e1e8935524420d7f.jpg\",\"\\/public\\/upload\\/goods_images\\/20180903\\/75bcd83cbe42684a61fb8b6a8933ada8.jpg\"]', '2018夏季新款帅气韩版时尚休闲连帽半袖五分上衣服青年学生打底衫男装', '<p><img src=\"http://v4.wx.wygoo.com/public/upload/ueditor/image/20180724/1532399994105311.jpg\" title=\"1532399994105311.jpg\" alt=\"5b51f7b0N34e66f62.jpg\"/></p><p><img src=\"http://v4.wx.wygoo.com/public/upload/ueditor/image/20180724/1532400002104179.jpg\" title=\"1532400002104179.jpg\" alt=\"5b51f7b0N577022b4.jpg\"/></p><p><br/></p>', '', '0', '0.00', '0.00', '100.00', '0.00', '0.00', '[\"折扣\",\"热销品\",\"精品\",\"清仓\"]', '20', '0', '0', '0', '0', '5', '1', '[]', '[{\"name\":\"颜色\",\"options\":[\"白色\",\"黑色\",\"灰色\"]},{\"name\":\"尺寸\",\"options\":[\"S\",\"M\",\"L\"]}]', '1', '0', '2018-07-24 10:41:03', '2018-09-03 17:54:14');
INSERT INTO `wancll_goods` VALUES ('3', '7', '', '', '0', '小米路由器', '/public/upload/goods_images/20180724\\f4dc8589e04b4e2ca61f21a05264c7f3.jpg', '[\"\\/public\\/upload\\/goods_images\\/20180724\\\\1910f5026e461e75d189811ea72f91e7.jpg\",\"\\/public\\/upload\\/goods_images\\/20180724\\\\0a475f083d3d7dabf8054c519c95014a.jpg\",\"\\/public\\/upload\\/goods_images\\/20180724\\\\cbb73d5304b89fd4b0c6eacd7fb276d7.jpg\"]', '小米路由器3G 全千兆 双频 四天线信号穿墙 有线无线双千兆 光纤优选 大户型覆盖', '<p><img src=\"http://v4.wx.wygoo.com/public/upload/ueditor/image/20180724/1532401955120760.png\" title=\"1532401955120760.png\" alt=\"image.png\"/></p><p><img src=\"http://v4.wx.wygoo.com/public/upload/ueditor/image/20180724/1532401994726204.png\" title=\"1532401994726204.png\" alt=\"image.png\"/></p><p><br/></p>', '', '717', '0.00', '0.00', '215.00', '0.00', '0.00', '[\"精品\"]', '11', '0', '0', '0', '0', '5', '2', '[]', '[]', '0', '0', '2018-07-24 11:25:21', '2018-09-03 17:54:14');
INSERT INTO `wancll_goods` VALUES ('4', '9', '', '', '0', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180903/65378f984a85b7976d9a31926dadf4c4.jpg', '[\"\\/public\\/upload\\/goods_images\\/20180903\\/2c30bedec654767326fc0382f935d9f2.jpg\"]', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '<p><img src=\"http://v4.wx.wygoo.com/public/upload/ueditor/image/20180724/1532404167110471.png\" title=\"1532404167110471.png\" alt=\"image.png\"/></p><p><img src=\"http://v4.wx.wygoo.com/public/upload/ueditor/image/20180724/1532404183522707.png\" title=\"1532404183522707.png\" alt=\"image.png\"/></p><p><img src=\"http://v4.wx.wygoo.com/public/upload/ueditor/image/20180724/1532404205457255.png\" title=\"1532404205457255.png\" alt=\"image.png\"/></p>', '', '0', '0.00', '0.00', '3299.00', '0.00', '0.00', '[\"热销品\"]', '29', '0', '0', '0', '0', '5', '1', '[]', '[{\"name\":\"颜色\",\"options\":[\"白色\",\"黑色\",\"灰色\"]},{\"name\":\"尺寸\",\"options\":[\"S\",\"M\",\"L\"]}]', '2', '0', '2018-07-24 11:50:08', '2018-09-03 17:54:14');
INSERT INTO `wancll_goods` VALUES ('5', '11', '4554545', '457775', '0', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '[\"\\/public\\/upload\\/goods_images\\/20180824\\/aa70477cf0fb373e5ecec152c1717caa.png\",\"\\/public\\/upload\\/goods_images\\/20180824\\/2df7be5c6cfafb80cb0e9ee9795aaf6e.png\",\"\\/public\\/upload\\/goods_images\\/20180824\\/02138f8458ba27abd0f78da4853d6405.png\",\"\\/public\\/upload\\/goods_images\\/20180824\\/3bb585a3840313946cfd50b01cf220f3.png\"]', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '<p>商品按重量计费<br/></p>', '', '0', '300.00', '42.00', '50.00', '40.00', '45.00', '[\"精品\",\"新品\",\"热销品\",\"折扣\",\"清仓\"]', '14', '5', '4', '1', '0', '5', '1', '[]', '[{\"name\":\"颜色\",\"options\":[\"红色\",\"绿色\",\"蓝色\"]}]', '3', '0', '2018-08-24 11:04:30', '2018-09-03 17:54:14');
INSERT INTO `wancll_goods` VALUES ('8', '11', '123', '456', '0', '测试-A', '/public/upload/goods_images/20180904/70e8fbf45626e6fa0e645ae0a09cb909.png', '[\"\\/public\\/upload\\/goods_images\\/20180904\\/a625a7814d67da31df007872252d2638.jpg\",\"\\/public\\/upload\\/goods_images\\/20180904\\/831e227ad88ad06b9ec3f31f566f1ad6.jpg\",\"\\/public\\/upload\\/goods_images\\/20180904\\/7a6e6b5b745b3411de17360e2e64423b.jpg\"]', '测试-A', '', '', '299', '10000.00', '1000.00', '1000.00', '1000.00', '1000.00', '[]', '1', '0', '0', '0', '1', '5', '1', '[{\"name\":\"红\",\"options\":[\"大红\",\"深红\"],\"value\":\"大红\"},{\"name\":\"绿\",\"options\":[\"大绿\",\"绿帽\"],\"value\":\"绿帽\"},{\"name\":\"蓝\",\"options\":[\"大蓝\",\"蓝猫\"],\"value\":\"蓝猫\"}]', '[{\"name\":\"颜色\",\"options\":[\"红色\",\"绿色\",\"蓝色\"]}]', '0', '1', '2018-09-04 10:15:37', '2018-09-04 10:20:09');
INSERT INTO `wancll_goods` VALUES ('6', '11', '5545454', '55455454', '0', '免邮费商品', '/public/upload/goods_images/20180824/7b831d739d415cb356774e03a9fa5471.png', '[\"\\/public\\/upload\\/goods_images\\/20180824\\/8ffe8fd1a8fd5ff21c39619e020ae589.png\",\"\\/public\\/upload\\/goods_images\\/20180824\\/e351544da6893cdf15dbc8ca0741e000.png\",\"\\/public\\/upload\\/goods_images\\/20180824\\/b2e5023d6004015e5afb56a21f00102f.png\",\"\\/public\\/upload\\/goods_images\\/20180824\\/0f6b49b6a4e623ef1dcf18207c229157.png\"]', '按件计费', '<p>的看房了解快递的房间开饭店及开发的框架的妇科健康健康的房价肯定发几款京东方科技快递费的反馈京东方科技东方健康的反馈及东方健康看东方健康的反馈及东方健康发都大幅度发发呆地方大幅度发<br/></p>', '', '0', '300.00', '75.00', '100.00', '70.00', '80.00', '[\"精品\"]', '28', '5', '6', '3', '1', '5', '1', '[]', '[{\"name\":\"颜色\",\"options\":[\"红色\",\"绿色\",\"蓝色\"]}]', '0', '0', '2018-08-24 11:18:00', '2018-09-03 17:54:14');
INSERT INTO `wancll_goods` VALUES ('7', '11', '547878654', '1245646', '0', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '[\"\\/public\\/upload\\/goods_images\\/20180901\\/c2715d36a1ff4cdb34f5c5e78a96b015.jpg\",\"\\/public\\/upload\\/goods_images\\/20180901\\/9a11d4a1db8022c4dad451d00ee20e00.jpg\",\"\\/public\\/upload\\/goods_images\\/20180901\\/620ac95b99981145c5bfb81da1eeb1a7.jpg\",\"\\/public\\/upload\\/goods_images\\/20180901\\/df64107a6659141aaf597b2a35a8edd2.jpg\",\"\\/public\\/upload\\/goods_images\\/20180901\\/c8926761d355cdcafc96b7a9a362821a.jpg\"]', '测试', '', '', '60', '100.00', '12000.00', '10000.00', '12000.00', '12000.00', '[]', '39', '0', '0', '0', '1', '5', '1', '[]', '[]', '0', '1', '2018-09-01 09:22:40', '2018-09-01 09:22:40');

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
INSERT INTO `wancll_goods_bonus` VALUES ('6', '1', '1', '1', '0', '0.00', '0', '1', '2018-08-27 17:50:00', '2018-08-27 17:50:00');
INSERT INTO `wancll_goods_bonus` VALUES ('4', '4', '1', '1', '0', '0.00', '0', '1', '2018-08-27 17:50:08', '2018-08-27 17:50:08');

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_cates`
-- -----------------------------
INSERT INTO `wancll_goods_cates` VALUES ('1', '测试分类 ', '', '0', '0', '1', '0', '2018-07-20 09:03:01', '2018-07-24 10:24:53');
INSERT INTO `wancll_goods_cates` VALUES ('2', '服饰内衣', '', '0', '0', '1', '1', '2018-07-24 10:25:28', '2018-07-24 10:25:28');
INSERT INTO `wancll_goods_cates` VALUES ('3', '男装', '/public/upload/goods_images/20180724\\46983cade2d582d8681069b17274061b.png', '2', '0', '1', '1', '2018-07-24 10:25:49', '2018-07-24 10:25:49');
INSERT INTO `wancll_goods_cates` VALUES ('4', 'T恤', '', '3', '0', '1', '0', '2018-07-24 10:26:05', '2018-07-24 10:27:47');
INSERT INTO `wancll_goods_cates` VALUES ('5', '选斯顿', '', '4', '0', '1', '0', '2018-07-24 10:26:35', '2018-07-24 10:27:36');
INSERT INTO `wancll_goods_cates` VALUES ('6', '电脑办公', '', '0', '0', '1', '1', '2018-07-24 11:03:24', '2018-07-24 11:03:24');
INSERT INTO `wancll_goods_cates` VALUES ('7', '网络产品', '/public/upload/goods_images/20180724\\d78cd745e5b1aa6fa05a3cffd9d41dd8.jpg', '6', '0', '1', '1', '2018-07-24 11:03:39', '2018-07-24 11:03:39');
INSERT INTO `wancll_goods_cates` VALUES ('8', '家用电器', '', '0', '0', '1', '1', '2018-07-24 11:43:59', '2018-07-24 11:43:59');
INSERT INTO `wancll_goods_cates` VALUES ('9', '平板电视', '/public/upload/goods_images/20180724\\7e376fcbfc70afcc60e435eda49e8f37.jpg', '8', '0', '1', '1', '2018-07-24 11:44:14', '2018-07-24 11:44:14');
INSERT INTO `wancll_goods_cates` VALUES ('10', 'test', '', '6', '0', '1', '0', '2018-07-24 15:12:57', '2018-07-24 15:13:02');
INSERT INTO `wancll_goods_cates` VALUES ('11', '普货', '', '0', '2', '1', '1', '2018-08-24 08:05:27', '2018-08-24 08:05:27');
INSERT INTO `wancll_goods_cates` VALUES ('12', '4334434343', '', '0', '0', '1', '0', '2018-08-24 11:11:10', '2018-08-24 11:15:07');

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_collections`
-- -----------------------------
INSERT INTO `wancll_goods_collections` VALUES ('1', '5', '4', '1', '2018-07-28 10:59:02', '2018-07-28 10:59:02');
INSERT INTO `wancll_goods_collections` VALUES ('10', '2', '4', '1', '2018-08-31 16:10:43', '2018-08-31 16:10:43');
INSERT INTO `wancll_goods_collections` VALUES ('9', '2', '5', '1', '2018-08-31 16:10:36', '2018-08-31 16:10:36');
INSERT INTO `wancll_goods_collections` VALUES ('8', '2', '6', '1', '2018-08-31 16:10:27', '2018-08-31 16:10:27');
INSERT INTO `wancll_goods_collections` VALUES ('7', '12', '5', '1', '2018-08-24 11:57:27', '2018-08-24 11:57:27');
INSERT INTO `wancll_goods_collections` VALUES ('15', '18', '4', '1', '2018-09-01 14:03:33', '2018-09-01 14:03:33');
INSERT INTO `wancll_goods_collections` VALUES ('14', '18', '7', '1', '2018-09-01 09:23:01', '2018-09-01 09:23:01');

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
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_comments`
-- -----------------------------
INSERT INTO `wancll_goods_comments` VALUES ('1', '12', '14', '6', 'gvv', '[\"\\/public\\/upload\\/goods_images\\/1535085722913.jpg\",\"\\/public\\/upload\\/goods_images\\/1535085722996.jpg\"]', '5', '3', '1', '2018-08-24 12:42:02', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('2', '2', '22', '2', '1', '[]', '5', '3', '1', '2018-08-31 16:18:38', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('3', '2', '23', '2', '2', '[]', '5', '3', '1', '2018-08-31 16:18:46', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('4', '2', '26', '5', '1', '[]', '5', '3', '1', '2018-08-31 16:18:53', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('5', '2', '32', '4', '1', '[]', '5', '3', '1', '2018-08-31 16:38:19', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('6', '17', '33', '6', '1', '[]', '5', '3', '1', '2018-08-31 16:43:27', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('7', '17', '34', '6', '2', '[]', '5', '3', '1', '2018-08-31 16:45:34', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('8', '17', '36', '6', '1', '[]', '5', '3', '1', '2018-08-31 16:46:57', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('9', '17', '35', '6', '1', '[]', '5', '3', '1', '2018-08-31 16:47:57', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('10', '2', '31', '5', '1', '[]', '5', '3', '1', '2018-08-31 17:07:00', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('11', '2', '31', '4', '1', '[]', '5', '3', '1', '2018-08-31 17:07:05', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('12', '2', '31', '1', '1', '[]', '5', '3', '1', '2018-08-31 17:07:09', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('13', '2', '9', '4', '1', '[]', '5', '3', '1', '2018-08-31 17:07:13', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('14', '2', '24', '5', '1', '[]', '5', '3', '1', '2018-08-31 17:07:27', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('15', '2', '25', '5', '1', '[]', '5', '3', '1', '2018-08-31 17:07:34', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('16', '2', '27', '2', '1', '[]', '5', '3', '1', '2018-08-31 17:07:38', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('17', '2', '21', '2', '1', '[]', '5', '3', '1', '2018-08-31 17:07:43', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('18', '18', '39', '4', '1', '[]', '5', '3', '1', '2018-08-31 17:45:49', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('19', '18', '41', '4', '1', '[]', '5', '3', '1', '2018-08-31 17:55:29', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('20', '18', '43', '4', '1', '[]', '5', '3', '1', '2018-08-31 17:56:30', '2018-08-31 18:03:32');
INSERT INTO `wancll_goods_comments` VALUES ('21', '18', '42', '4', '1', '[]', '5', '1', '1', '2018-09-01 09:31:38', '2018-09-01 09:31:38');
INSERT INTO `wancll_goods_comments` VALUES ('22', '18', '44', '7', '2', '[]', '5', '1', '1', '2018-09-01 09:31:42', '2018-09-01 09:31:42');
INSERT INTO `wancll_goods_comments` VALUES ('23', '18', '45', '7', '1', '[]', '5', '1', '1', '2018-09-01 09:38:11', '2018-09-01 09:38:11');
INSERT INTO `wancll_goods_comments` VALUES ('24', '18', '46', '7', '1', '[]', '5', '1', '1', '2018-09-01 09:44:29', '2018-09-01 09:44:29');
INSERT INTO `wancll_goods_comments` VALUES ('25', '18', '47', '7', '1', '[]', '5', '1', '1', '2018-09-01 10:24:17', '2018-09-01 10:24:17');
INSERT INTO `wancll_goods_comments` VALUES ('26', '18', '50', '7', '1', '[\"\\/public\\/upload\\/goods_images\\/1535769061906.jpg\",\"\\/public\\/upload\\/goods_images\\/1535769061910.jpg\",\"\\/public\\/upload\\/goods_images\\/1535769061410.jpg\",\"\\/public\\/upload\\/goods_images\\/1535769061247.jpg\",\"\\/public\\/upload\\/goods_images\\/1535769061261.jpg\"]', '5', '1', '1', '2018-09-01 10:31:01', '2018-09-01 10:31:01');
INSERT INTO `wancll_goods_comments` VALUES ('27', '18', '49', '7', 'ad', '[]', '5', '3', '1', '2018-09-01 10:31:07', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('28', '18', '48', '7', '今年佛家佛为卡住了你看着屏幕操作设置康复卡卡【网卡【 跑【啊肯定怕卡', '[]', '5', '3', '1', '2018-09-01 10:31:16', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('29', '18', '55', '7', '1', '[\"\\/public\\/upload\\/goods_images\\/1535773649907.jpg\",\"\\/public\\/upload\\/goods_images\\/1535773649140.jpg\",\"\\/public\\/upload\\/goods_images\\/1535773649924.jpg\",\"\\/public\\/upload\\/goods_images\\/1535773649658.jpg\",\"\\/public\\/upload\\/goods_images\\/1535773649340.jpg\"]', '5', '3', '1', '2018-09-01 11:47:29', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('30', '18', '59', '7', '1', '[\"\\/public\\/upload\\/goods_images\\/1535774066458.jpg\"]', '5', '3', '1', '2018-09-01 11:54:26', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('31', '17', '57', '7', '123', '[]', '5', '3', '1', '2018-09-01 13:41:37', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('32', '17', '58', '7', '1234', '[]', '5', '3', '1', '2018-09-01 13:41:44', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('33', '17', '56', '7', '12345', '[]', '5', '3', '1', '2018-09-01 13:41:50', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('34', '18', '54', '7', '1', '[]', '5', '3', '1', '2018-09-01 13:51:32', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('35', '18', '52', '7', ' ', '[]', '5', '3', '1', '2018-09-01 13:51:41', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('36', '18', '53', '7', '  ', '[]', '5', '3', '1', '2018-09-01 13:51:48', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('37', '18', '63', '4', '1', '[]', '5', '3', '1', '2018-09-01 14:08:05', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('38', '18', '65', '7', '1', '[]', '5', '3', '1', '2018-09-01 16:12:11', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('39', '18', '64', '7', '2', '[]', '5', '3', '1', '2018-09-01 16:12:15', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('40', '18', '68', '7', '100', '[]', '5', '3', '1', '2018-09-01 16:50:22', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('41', '18', '67', '7', '+100', '[]', '5', '3', '1', '2018-09-01 16:50:28', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('42', '18', '70', '7', '+700', '[]', '5', '3', '1', '2018-09-01 16:52:07', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('43', '18', '69', '7', '+100', '[]', '5', '3', '1', '2018-09-01 16:52:13', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('44', '18', '73', '7', '1', '[]', '5', '3', '1', '2018-09-03 09:32:06', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('45', '18', '72', '7', '2', '[]', '5', '3', '1', '2018-09-03 09:32:10', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('46', '18', '76', '7', '1', '[]', '5', '3', '1', '2018-09-03 10:08:07', '2018-09-03 11:39:39');
INSERT INTO `wancll_goods_comments` VALUES ('47', '18', '77', '7', '1', '[]', '5', '1', '0', '2018-09-03 10:09:33', '2018-09-03 11:39:34');
INSERT INTO `wancll_goods_comments` VALUES ('48', '18', '75', '6', '1', '[]', '5', '1', '0', '2018-09-03 10:09:38', '2018-09-03 11:39:29');
INSERT INTO `wancll_goods_comments` VALUES ('49', '14', '88', '8', '123456789', '[]', '5', '1', '1', '2018-09-04 10:42:48', '2018-09-04 10:42:48');
INSERT INTO `wancll_goods_comments` VALUES ('50', '14', '88', '7', '987654321', '[]', '5', '1', '1', '2018-09-04 10:42:56', '2018-09-04 10:42:56');

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
-- Records of `wancll_goods_commission`
-- -----------------------------
INSERT INTO `wancll_goods_commission` VALUES ('5', '0', '1', '0', 'rate', '0.00', 'rate', '0.00', 'rate', '0.00', '1', '2018-08-24 15:00:04', '2018-08-24 15:00:04');
INSERT INTO `wancll_goods_commission` VALUES ('4', '0', '1', '0', 'rate', '0.00', 'rate', '0.00', 'rate', '0.00', '1', '2018-08-24 15:00:14', '2018-08-24 15:00:14');
INSERT INTO `wancll_goods_commission` VALUES ('6', '4', '1', '0', 'rate', '0.00', 'rate', '0.00', 'rate', '0.00', '1', '2018-08-24 15:07:06', '2018-08-24 15:07:31');

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_keywords`
-- -----------------------------
INSERT INTO `wancll_goods_keywords` VALUES ('1', '服饰内衣', '13', '1', '2018-08-04 10:43:08', '2018-08-04 10:43:08');
INSERT INTO `wancll_goods_keywords` VALUES ('2', '电脑办公', '18', '1', '2018-08-23 10:15:45', '2018-08-23 10:15:45');
INSERT INTO `wancll_goods_keywords` VALUES ('3', '家用电器', '16', '1', '2018-08-23 10:20:02', '2018-08-23 10:20:02');
INSERT INTO `wancll_goods_keywords` VALUES ('4', '普货', '11', '1', '2018-08-24 11:12:25', '2018-08-24 11:12:25');
INSERT INTO `wancll_goods_keywords` VALUES ('5', '测试商品', '1', '1', '2018-08-24 12:57:52', '2018-08-24 12:57:52');
INSERT INTO `wancll_goods_keywords` VALUES ('6', '地闹', '1', '1', '2018-08-31 16:11:10', '2018-08-31 16:11:10');
INSERT INTO `wancll_goods_keywords` VALUES ('7', '电脑', '2', '1', '2018-08-31 16:11:15', '2018-08-31 16:11:15');
INSERT INTO `wancll_goods_keywords` VALUES ('8', '衣服', '2', '1', '2018-08-31 16:11:22', '2018-08-31 16:11:22');
INSERT INTO `wancll_goods_keywords` VALUES ('9', '测试', '2', '1', '2018-08-31 16:11:48', '2018-08-31 16:11:48');
INSERT INTO `wancll_goods_keywords` VALUES ('10', '1', '4', '1', '2018-08-31 16:11:56', '2018-08-31 16:11:56');
INSERT INTO `wancll_goods_keywords` VALUES ('11', '2', '4', '1', '2018-08-31 16:12:01', '2018-08-31 16:12:01');
INSERT INTO `wancll_goods_keywords` VALUES ('12', '3', '3', '1', '2018-08-31 16:12:04', '2018-08-31 16:12:04');
INSERT INTO `wancll_goods_keywords` VALUES ('13', '4', '1', '1', '2018-08-31 16:13:34', '2018-08-31 16:13:34');
INSERT INTO `wancll_goods_keywords` VALUES ('14', '男', '2', '1', '2018-09-01 09:20:28', '2018-09-01 09:20:28');
INSERT INTO `wancll_goods_keywords` VALUES ('15', '的', '2', '1', '2018-09-01 14:31:26', '2018-09-01 14:31:26');
INSERT INTO `wancll_goods_keywords` VALUES ('16', '规范', '1', '1', '2018-09-01 14:31:32', '2018-09-01 14:31:32');
INSERT INTO `wancll_goods_keywords` VALUES ('17', 'ff', '1', '1', '2018-09-01 14:33:14', '2018-09-01 14:33:14');
INSERT INTO `wancll_goods_keywords` VALUES ('18', '464', '2', '1', '2018-09-03 11:31:11', '2018-09-03 11:31:11');
INSERT INTO `wancll_goods_keywords` VALUES ('19', '4465465', '1', '1', '2018-09-03 11:31:17', '2018-09-03 11:31:17');
INSERT INTO `wancll_goods_keywords` VALUES ('20', '打的', '1', '1', '2018-09-04 10:34:47', '2018-09-04 10:34:47');

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
  PRIMARY KEY (`id`),
  KEY `idx_goods_id` (`goods_id`),
  KEY `idx_sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_spec_groups`
-- -----------------------------
INSERT INTO `wancll_goods_spec_groups` VALUES ('205', '9a4f62329a021d6063e4389b4191549a', '2', '白色_S', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:49:59', '2018-09-03 17:49:59');
INSERT INTO `wancll_goods_spec_groups` VALUES ('206', '3ecaf83e4b58258b2708e71f5153c28f', '2', '黑色_S', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:49:59', '2018-09-03 17:49:59');
INSERT INTO `wancll_goods_spec_groups` VALUES ('207', '14e449c122e1a02ad9055d72892da421', '2', '灰色_S', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:49:59', '2018-09-03 17:49:59');
INSERT INTO `wancll_goods_spec_groups` VALUES ('208', '212009b774a03875900111b1556c6bbd', '2', '白色_M', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:49:59', '2018-09-03 17:49:59');
INSERT INTO `wancll_goods_spec_groups` VALUES ('209', '75e13ff2a062474ce87a9743b92ed529', '2', '黑色_M', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:49:59', '2018-09-03 17:49:59');
INSERT INTO `wancll_goods_spec_groups` VALUES ('210', '2a556c0b177054851a311b5b28bc0217', '2', '灰色_M', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:49:59', '2018-09-03 17:49:59');
INSERT INTO `wancll_goods_spec_groups` VALUES ('211', '086e8bcf7197f7a15e3f3ef580f48656', '2', '白色_L', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:49:59', '2018-09-03 17:49:59');
INSERT INTO `wancll_goods_spec_groups` VALUES ('212', '6ae4f8940ef3a0f87a7b0adfef09d243', '2', '黑色_L', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:49:59', '2018-09-03 17:49:59');
INSERT INTO `wancll_goods_spec_groups` VALUES ('213', 'ebf7862a9bb6255ddad83eaed2ca94a8', '2', '灰色_L', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:49:59', '2018-09-03 17:49:59');
INSERT INTO `wancll_goods_spec_groups` VALUES ('214', '754a381ebd0f0cb15507ecfd297165a3', '4', '白色_S', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:50:50', '2018-09-03 17:50:50');
INSERT INTO `wancll_goods_spec_groups` VALUES ('215', '5f297fbd4dfa8bf93359840e1134205f', '4', '黑色_S', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:50:50', '2018-09-03 17:50:50');
INSERT INTO `wancll_goods_spec_groups` VALUES ('216', 'c0387b8e5f28bb2797c152574dee5eba', '4', '灰色_S', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:50:50', '2018-09-03 17:50:50');
INSERT INTO `wancll_goods_spec_groups` VALUES ('217', 'b1940b91d408f97f1ef9ad7406b63eae', '4', '白色_M', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:50:50', '2018-09-03 17:50:50');
INSERT INTO `wancll_goods_spec_groups` VALUES ('218', 'f319236f0ded2cdeae5a32410c787f30', '4', '黑色_M', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:50:50', '2018-09-03 17:50:50');
INSERT INTO `wancll_goods_spec_groups` VALUES ('219', '8654b523527a4d2bfd6cb4e5b8c12bf8', '4', '灰色_M', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:50:50', '2018-09-03 17:50:50');
INSERT INTO `wancll_goods_spec_groups` VALUES ('220', 'acbabcc31b2647f5729e98ea2336e721', '4', '白色_L', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:50:50', '2018-09-03 17:50:50');
INSERT INTO `wancll_goods_spec_groups` VALUES ('221', '1cf1bbc738dbc1d47fc3f0eb49f16a89', '4', '黑色_L', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:50:50', '2018-09-03 17:50:50');
INSERT INTO `wancll_goods_spec_groups` VALUES ('222', 'ed2e28f191f4cb9f2eb6c66d4d3f8d31', '4', '灰色_L', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:50:50', '2018-09-03 17:50:50');
INSERT INTO `wancll_goods_spec_groups` VALUES ('223', '6115eedc743452f7cf13d8f0af09540f', '5', '红色', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:51:49', '2018-09-03 17:51:49');
INSERT INTO `wancll_goods_spec_groups` VALUES ('224', 'aefef5355ad49bd95bf17ab9c94359e4', '5', '绿色', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:51:49', '2018-09-03 17:51:49');
INSERT INTO `wancll_goods_spec_groups` VALUES ('225', '4821f5db66d294a3d277e0448b2e49ad', '5', '蓝色', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:51:49', '2018-09-03 17:51:49');
INSERT INTO `wancll_goods_spec_groups` VALUES ('226', 'ce30c60ea60b1caf11188b7f34967860', '6', '红色', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:52:03', '2018-09-03 17:52:03');
INSERT INTO `wancll_goods_spec_groups` VALUES ('227', '75b9c28244bae00db098e38d70c753f4', '6', '绿色', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:52:03', '2018-09-03 17:52:03');
INSERT INTO `wancll_goods_spec_groups` VALUES ('228', '798e47b53201b7ef75c94efdafe04f40', '6', '蓝色', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-09-03 17:52:03', '2018-09-03 17:52:03');
INSERT INTO `wancll_goods_spec_groups` VALUES ('235', '99634f20d3ba922db5ab94e8fa002994', '8', '红色', '', '1000.00', '1000.00', '1000.00', '1000.00', '100', '10000.00', '1000', '123456', '0', '0', '1', '2018-09-04 10:15:37', '2018-09-04 10:21:44');
INSERT INTO `wancll_goods_spec_groups` VALUES ('236', '9d653df2bede1d864f703472454645f5', '8', '绿色', '', '1000.00', '1000.00', '1000.00', '1000.00', '99', '10000.00', '1000', '123456', '0', '0', '1', '2018-09-04 10:15:37', '2018-09-04 10:21:44');
INSERT INTO `wancll_goods_spec_groups` VALUES ('237', 'f90dd144f9cb24d244cc023e74eca12c', '8', '蓝色', '', '1000.00', '1000.00', '1000.00', '1000.00', '100', '10000.00', '1000', '123456', '0', '0', '1', '2018-09-04 10:15:37', '2018-09-04 10:21:44');

-- -----------------------------
-- Table structure for `wancll_group_buy_system_goods`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_group_buy_system_goods`;
CREATE TABLE `wancll_group_buy_system_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `person_num` int(11) unsigned NOT NULL DEFAULT '2' COMMENT '团购人数',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '团购价格',
  `stock` bigint(20) unsigned NOT NULL COMMENT '库存',
  `person_buy_num` int(11) unsigned NOT NULL COMMENT '单人单笔订单限购买数量',
  `spec_group_info` text COMMENT '规格组合项信息',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1上架2下架',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_group_buy_system_goods`
-- -----------------------------
INSERT INTO `wancll_group_buy_system_goods` VALUES ('1', '3', '2018-07-25 09:00:27', '2018-07-31 00:00:00', '2', '99.00', '86', '1', '[{\"spec_group_id_str\":\"1801aa94b8a08fa9a0c467a6e2fc262e\",\"person_num\":\"2\",\"money\":\"99\",\"stock\":9,\"spec_option_group\":\"白色_450M\"},{\"spec_group_id_str\":\"c5b12e5f6771f8bc9ac5ff80e0c2e5f5\",\"person_num\":\"2\",\"money\":\"99\",\"stock\":\"10\",\"spec_option_group\":\"黑色_450M\"},{\"spec_group_id_str\":\"f500f38a228dfbe52d25a8c1c6064e91\",\"person_num\":\"2\",\"money\":\"99\",\"stock\":\"10\",\"spec_option_group\":\"灰色_450M\"},{\"spec_group_id_str\":\"3815dc5fa04ce193491b1488fb76fab5\",\"person_num\":\"2\",\"money\":\"99\",\"stock\":7,\"spec_option_group\":\"白色_1200M\"},{\"spec_group_id_str\":\"145c9e89ca0df0ad71dc483ada7823ec\",\"person_num\":\"2\",\"money\":\"99\",\"stock\":\"10\",\"spec_option_group\":\"黑色_1200M\"},{\"spec_group_id_str\":\"1034ced74785d90772d982521c460e11\",\"person_num\":\"2\",\"money\":\"99\",\"stock\":\"10\",\"spec_option_group\":\"灰色_1200M\"},{\"spec_group_id_str\":\"27c40c8cd59b044215e67fe7f768d8ff\",\"person_num\":\"2\",\"money\":\"99\",\"stock\":\"10\",\"spec_option_group\":\"白色_全千兆\"},{\"spec_group_id_str\":\"bc7837c0c483711c873e748bf34373b2\",\"person_num\":\"2\",\"money\":\"99\",\"stock\":\"10\",\"spec_option_group\":\"黑色_全千兆\"},{\"spec_group_id_str\":\"fa8469b7c1889ab25fa4cfdae4cb3f43\",\"person_num\":\"2\",\"money\":\"99\",\"stock\":\"10\",\"spec_option_group\":\"灰色_全千兆\"}]', '0', '1', '0', '2018-07-25 09:00:33', '2018-09-03 17:53:52');
INSERT INTO `wancll_group_buy_system_goods` VALUES ('2', '2', '2018-07-28 15:08:15', '2018-07-28 15:15:56', '2', '198.00', '97', '1', '[{\"spec_group_id_str\":\"9a4f62329a021d6063e4389b4191549a\",\"person_num\":\"2\",\"money\":\"198\",\"stock\":\"11\",\"spec_option_group\":\"白色_S\"},{\"spec_group_id_str\":\"3ecaf83e4b58258b2708e71f5153c28f\",\"person_num\":\"2\",\"money\":\"198\",\"stock\":\"11\",\"spec_option_group\":\"黑色_S\"},{\"spec_group_id_str\":\"14e449c122e1a02ad9055d72892da421\",\"person_num\":\"2\",\"money\":\"198\",\"stock\":\"11\",\"spec_option_group\":\"灰色_S\"},{\"spec_group_id_str\":\"212009b774a03875900111b1556c6bbd\",\"person_num\":\"2\",\"money\":\"198\",\"stock\":9,\"spec_option_group\":\"白色_M\"},{\"spec_group_id_str\":\"75e13ff2a062474ce87a9743b92ed529\",\"person_num\":\"2\",\"money\":\"198\",\"stock\":\"11\",\"spec_option_group\":\"黑色_M\"},{\"spec_group_id_str\":\"2a556c0b177054851a311b5b28bc0217\",\"person_num\":\"2\",\"money\":\"198\",\"stock\":\"11\",\"spec_option_group\":\"灰色_M\"},{\"spec_group_id_str\":\"086e8bcf7197f7a15e3f3ef580f48656\",\"person_num\":\"2\",\"money\":\"198\",\"stock\":\"11\",\"spec_option_group\":\"白色_L\"},{\"spec_group_id_str\":\"6ae4f8940ef3a0f87a7b0adfef09d243\",\"person_num\":\"2\",\"money\":\"198\",\"stock\":\"11\",\"spec_option_group\":\"黑色_L\"},{\"spec_group_id_str\":\"ebf7862a9bb6255ddad83eaed2ca94a8\",\"person_num\":\"2\",\"money\":\"198\",\"stock\":\"11\",\"spec_option_group\":\"灰色_L\"}]', '0', '1', '0', '2018-07-28 15:05:41', '2018-07-30 16:22:37');
INSERT INTO `wancll_group_buy_system_goods` VALUES ('3', '2', '2018-07-30 16:22:57', '2018-07-31 16:23:02', '10', '100.00', '448', '1', '[{\"spec_group_id_str\":\"9a4f62329a021d6063e4389b4191549a\",\"person_num\":\"10\",\"money\":\"100\",\"stock\":\"50\",\"spec_option_group\":\"白色_S\"},{\"spec_group_id_str\":\"3ecaf83e4b58258b2708e71f5153c28f\",\"person_num\":\"10\",\"money\":\"100\",\"stock\":\"50\",\"spec_option_group\":\"黑色_S\"},{\"spec_group_id_str\":\"14e449c122e1a02ad9055d72892da421\",\"person_num\":\"10\",\"money\":\"100\",\"stock\":\"50\",\"spec_option_group\":\"灰色_S\"},{\"spec_group_id_str\":\"212009b774a03875900111b1556c6bbd\",\"person_num\":\"10\",\"money\":\"100\",\"stock\":\"50\",\"spec_option_group\":\"白色_M\"},{\"spec_group_id_str\":\"75e13ff2a062474ce87a9743b92ed529\",\"person_num\":\"10\",\"money\":\"100\",\"stock\":49,\"spec_option_group\":\"黑色_M\"},{\"spec_group_id_str\":\"2a556c0b177054851a311b5b28bc0217\",\"person_num\":\"10\",\"money\":\"100\",\"stock\":\"50\",\"spec_option_group\":\"灰色_M\"},{\"spec_group_id_str\":\"086e8bcf7197f7a15e3f3ef580f48656\",\"person_num\":\"10\",\"money\":\"100\",\"stock\":\"50\",\"spec_option_group\":\"白色_L\"},{\"spec_group_id_str\":\"6ae4f8940ef3a0f87a7b0adfef09d243\",\"person_num\":\"10\",\"money\":\"100\",\"stock\":\"50\",\"spec_option_group\":\"黑色_L\"},{\"spec_group_id_str\":\"ebf7862a9bb6255ddad83eaed2ca94a8\",\"person_num\":\"10\",\"money\":\"100\",\"stock\":49,\"spec_option_group\":\"灰色_L\"}]', '0', '1', '0', '2018-07-30 16:23:15', '2018-09-03 17:53:51');
INSERT INTO `wancll_group_buy_system_goods` VALUES ('4', '8', '2018-09-04 10:20:59', '2018-09-30 00:00:00', '2', '500.00', '300', '1', '[{\"spec_group_id_str\":\"f90dd144f9cb24d244cc023e74eca12c\",\"person_num\":\"2\",\"money\":\"500\",\"stock\":\"100\",\"spec_option_group\":\"蓝色\"},{\"spec_group_id_str\":\"9d653df2bede1d864f703472454645f5\",\"person_num\":\"2\",\"money\":\"500\",\"stock\":\"100\",\"spec_option_group\":\"绿色\"},{\"spec_group_id_str\":\"99634f20d3ba922db5ab94e8fa002994\",\"person_num\":\"2\",\"money\":\"500\",\"stock\":\"100\",\"spec_option_group\":\"红色\"}]', '0', '1', '1', '2018-09-04 10:20:59', '2018-09-04 10:20:59');
INSERT INTO `wancll_group_buy_system_goods` VALUES ('5', '7', '2018-09-04 10:21:16', '2018-09-30 00:00:00', '2', '5000.00', '1', '1', '[]', '0', '1', '1', '2018-09-04 10:21:16', '2018-09-04 10:21:16');

-- -----------------------------
-- Table structure for `wancll_group_buy_teams`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_group_buy_teams`;
CREATE TABLE `wancll_group_buy_teams` (
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_group_buy_teams`
-- -----------------------------
INSERT INTO `wancll_group_buy_teams` VALUES ('1', '2', '2', '1', '2018-07-31 15:03:59', '2018-07-31 15:04:35', '2', '[{\"user_id\":2,\"order_id\":1}]', '0', '2', '2018-07-31 15:04:36', '2', '1', '2018-07-31 15:03:59', '2018-07-31 15:04:36');
INSERT INTO `wancll_group_buy_teams` VALUES ('2', '2', '3', '2', '2018-07-31 18:19:03', '2018-07-31 20:19:03', '2', '[{\"user_id\":2,\"order_id\":2}]', '0', '2', '2018-08-01 10:14:54', '2', '1', '2018-07-31 18:19:03', '2018-08-01 10:14:54');
INSERT INTO `wancll_group_buy_teams` VALUES ('3', '2', '2', '3', '2018-08-01 10:15:12', '2018-08-01 10:15:48', '2', '[{\"user_id\":5,\"order_id\":3}]', '0', '2', '2018-08-01 10:15:49', '2', '1', '2018-08-01 10:15:12', '2018-08-01 10:15:49');
INSERT INTO `wancll_group_buy_teams` VALUES ('4', '2', '4', '30', '2018-08-31 15:44:14', '2018-09-01 01:44:14', '2', '[{\"user_id\":2,\"order_id\":30}]', '0', '2', '2018-09-01 11:18:05', '2', '1', '2018-08-31 15:44:14', '2018-09-01 11:18:05');
INSERT INTO `wancll_group_buy_teams` VALUES ('5', '2', '7', '84', '2018-09-03 17:55:47', '2018-09-04 17:55:47', '2', '[{\"user_id\":17,\"order_id\":84}]', '0', '1', '', '1', '1', '2018-09-03 17:55:47', '2018-09-03 17:55:47');

-- -----------------------------
-- Table structure for `wancll_group_buy_user_goods`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_group_buy_user_goods`;
CREATE TABLE `wancll_group_buy_user_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `time_length` decimal(10,2) unsigned NOT NULL COMMENT '拼团限时（单位：小时）',
  `person_num` int(11) unsigned NOT NULL DEFAULT '2' COMMENT '团购人数',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '团购价格',
  `stock` bigint(20) unsigned NOT NULL COMMENT '库存',
  `person_buy_num` int(11) unsigned NOT NULL COMMENT '单人单笔订单限购买数量',
  `spec_group_info` text COMMENT '规格组合项信息',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1上架2下架',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_group_buy_user_goods`
-- -----------------------------
INSERT INTO `wancll_group_buy_user_goods` VALUES ('1', '4', '3.00', '5', '2999.00', '55', '1', '[{\"spec_group_id_str\":\"4201a560b5d850a1f2fa922674981d99\",\"person_num\":\"5\",\"money\":\"2999\",\"stock\":9,\"spec_option_group\":\"黑色_60寸爆款4K\"},{\"spec_group_id_str\":\"5aa1986312dc29e79dd428e0e1530e58\",\"person_num\":\"5\",\"money\":\"2999\",\"stock\":\"10\",\"spec_option_group\":\"银色_60寸爆款4K\"},{\"spec_group_id_str\":\"bae05d8d2bda242ab4579038dde5914e\",\"person_num\":\"5\",\"money\":\"2999\",\"stock\":9,\"spec_option_group\":\"黑色_50寸智能\"},{\"spec_group_id_str\":\"4c278694f0e1a64e8989e4fe4e25da2d\",\"person_num\":\"5\",\"money\":\"2999\",\"stock\":9,\"spec_option_group\":\"银色_50寸智能\"},{\"spec_group_id_str\":\"c00e9dfb99b228b9b31e01a6ed0cd1cf\",\"person_num\":\"5\",\"money\":\"2999\",\"stock\":8,\"spec_option_group\":\"黑色_45寸智能\"},{\"spec_group_id_str\":\"8f7ddcef8034b31b2d219ce556bdca1c\",\"person_num\":\"5\",\"money\":\"2999\",\"stock\":\"10\",\"spec_option_group\":\"银色_45寸智能\"}]', '0', '2', '0', '2018-07-25 08:48:24', '2018-07-30 11:53:19');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('2', '2', '20.00', '2', '80.00', '7', '1', '[{\"spec_group_id_str\":\"9a4f62329a021d6063e4389b4191549a\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"1\",\"spec_option_group\":\"白色_S\"},{\"spec_group_id_str\":\"3ecaf83e4b58258b2708e71f5153c28f\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"1\",\"spec_option_group\":\"黑色_S\"},{\"spec_group_id_str\":\"14e449c122e1a02ad9055d72892da421\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"1\",\"spec_option_group\":\"灰色_S\"},{\"spec_group_id_str\":\"212009b774a03875900111b1556c6bbd\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":0,\"spec_option_group\":\"白色_M\"},{\"spec_group_id_str\":\"75e13ff2a062474ce87a9743b92ed529\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"1\",\"spec_option_group\":\"黑色_M\"},{\"spec_group_id_str\":\"2a556c0b177054851a311b5b28bc0217\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"1\",\"spec_option_group\":\"灰色_M\"},{\"spec_group_id_str\":\"086e8bcf7197f7a15e3f3ef580f48656\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":0,\"spec_option_group\":\"白色_L\"},{\"spec_group_id_str\":\"6ae4f8940ef3a0f87a7b0adfef09d243\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"1\",\"spec_option_group\":\"黑色_L\"},{\"spec_group_id_str\":\"ebf7862a9bb6255ddad83eaed2ca94a8\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"1\",\"spec_option_group\":\"灰色_L\"}]', '0', '1', '0', '2018-07-28 09:41:25', '2018-07-28 09:50:42');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('3', '2', '10.00', '2', '80.00', '90', '10', '[{\"spec_group_id_str\":\"9a4f62329a021d6063e4389b4191549a\",\"person_num\":\"2\",\"money\":0,\"stock\":\"10\",\"spec_option_group\":\"白色_S\"},{\"spec_group_id_str\":\"3ecaf83e4b58258b2708e71f5153c28f\",\"person_num\":\"2\",\"money\":0,\"stock\":\"10\",\"spec_option_group\":\"黑色_S\"},{\"spec_group_id_str\":\"14e449c122e1a02ad9055d72892da421\",\"person_num\":\"2\",\"money\":0,\"stock\":\"10\",\"spec_option_group\":\"灰色_S\"},{\"spec_group_id_str\":\"212009b774a03875900111b1556c6bbd\",\"person_num\":\"2\",\"money\":0,\"stock\":\"10\",\"spec_option_group\":\"白色_M\"},{\"spec_group_id_str\":\"75e13ff2a062474ce87a9743b92ed529\",\"person_num\":\"2\",\"money\":0,\"stock\":\"10\",\"spec_option_group\":\"黑色_M\"},{\"spec_group_id_str\":\"2a556c0b177054851a311b5b28bc0217\",\"person_num\":\"2\",\"money\":0,\"stock\":\"10\",\"spec_option_group\":\"灰色_M\"},{\"spec_group_id_str\":\"086e8bcf7197f7a15e3f3ef580f48656\",\"person_num\":\"2\",\"money\":0,\"stock\":\"10\",\"spec_option_group\":\"白色_L\"},{\"spec_group_id_str\":\"6ae4f8940ef3a0f87a7b0adfef09d243\",\"person_num\":\"2\",\"money\":0,\"stock\":\"10\",\"spec_option_group\":\"黑色_L\"},{\"spec_group_id_str\":\"ebf7862a9bb6255ddad83eaed2ca94a8\",\"person_num\":\"2\",\"money\":0,\"stock\":\"10\",\"spec_option_group\":\"灰色_L\"}]', '0', '1', '0', '2018-07-28 09:51:29', '2018-07-28 09:58:12');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('4', '2', '10.00', '2', '70.00', '88', '5', '[{\"spec_group_id_str\":\"9a4f62329a021d6063e4389b4191549a\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"10\",\"spec_option_group\":\"白色_S\"},{\"spec_group_id_str\":\"3ecaf83e4b58258b2708e71f5153c28f\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":9,\"spec_option_group\":\"黑色_S\"},{\"spec_group_id_str\":\"14e449c122e1a02ad9055d72892da421\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"10\",\"spec_option_group\":\"灰色_S\"},{\"spec_group_id_str\":\"212009b774a03875900111b1556c6bbd\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"10\",\"spec_option_group\":\"白色_M\"},{\"spec_group_id_str\":\"75e13ff2a062474ce87a9743b92ed529\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":9,\"spec_option_group\":\"黑色_M\"},{\"spec_group_id_str\":\"2a556c0b177054851a311b5b28bc0217\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"10\",\"spec_option_group\":\"灰色_M\"},{\"spec_group_id_str\":\"086e8bcf7197f7a15e3f3ef580f48656\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"10\",\"spec_option_group\":\"白色_L\"},{\"spec_group_id_str\":\"6ae4f8940ef3a0f87a7b0adfef09d243\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"10\",\"spec_option_group\":\"黑色_L\"},{\"spec_group_id_str\":\"ebf7862a9bb6255ddad83eaed2ca94a8\",\"person_num\":\"2\",\"money\":\"80\",\"stock\":\"10\",\"spec_option_group\":\"灰色_L\"}]', '0', '1', '0', '2018-07-28 09:59:00', '2018-07-28 10:05:13');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('5', '4', '1.00', '2', '999.00', '597', '1', '[{\"spec_group_id_str\":\"4201a560b5d850a1f2fa922674981d99\",\"person_num\":\"2\",\"money\":\"999\",\"stock\":99,\"spec_option_group\":\"黑色_60寸爆款4K\"},{\"spec_group_id_str\":\"5aa1986312dc29e79dd428e0e1530e58\",\"person_num\":\"2\",\"money\":\"999\",\"stock\":\"100\",\"spec_option_group\":\"银色_60寸爆款4K\"},{\"spec_group_id_str\":\"bae05d8d2bda242ab4579038dde5914e\",\"person_num\":\"2\",\"money\":\"999\",\"stock\":98,\"spec_option_group\":\"黑色_50寸智能\"},{\"spec_group_id_str\":\"4c278694f0e1a64e8989e4fe4e25da2d\",\"person_num\":\"2\",\"money\":\"999\",\"stock\":\"100\",\"spec_option_group\":\"银色_50寸智能\"},{\"spec_group_id_str\":\"c00e9dfb99b228b9b31e01a6ed0cd1cf\",\"person_num\":\"2\",\"money\":\"999\",\"stock\":\"100\",\"spec_option_group\":\"黑色_45寸智能\"},{\"spec_group_id_str\":\"8f7ddcef8034b31b2d219ce556bdca1c\",\"person_num\":\"2\",\"money\":\"999\",\"stock\":\"100\",\"spec_option_group\":\"银色_45寸智能\"}]', '0', '1', '0', '2018-07-30 11:53:46', '2018-07-30 17:28:21');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('6', '4', '1.00', '10', '100.00', '296', '1', '[{\"spec_group_id_str\":\"4201a560b5d850a1f2fa922674981d99\",\"person_num\":\"10\",\"money\":\"200\",\"stock\":49,\"spec_option_group\":\"黑色_60寸爆款4K\"},{\"spec_group_id_str\":\"5aa1986312dc29e79dd428e0e1530e58\",\"person_num\":\"10\",\"money\":\"200\",\"stock\":\"50\",\"spec_option_group\":\"银色_60寸爆款4K\"},{\"spec_group_id_str\":\"bae05d8d2bda242ab4579038dde5914e\",\"person_num\":\"10\",\"money\":\"200\",\"stock\":48,\"spec_option_group\":\"黑色_50寸智能\"},{\"spec_group_id_str\":\"4c278694f0e1a64e8989e4fe4e25da2d\",\"person_num\":\"10\",\"money\":\"200\",\"stock\":49,\"spec_option_group\":\"银色_50寸智能\"},{\"spec_group_id_str\":\"c00e9dfb99b228b9b31e01a6ed0cd1cf\",\"person_num\":\"10\",\"money\":\"200\",\"stock\":\"50\",\"spec_option_group\":\"黑色_45寸智能\"},{\"spec_group_id_str\":\"8f7ddcef8034b31b2d219ce556bdca1c\",\"person_num\":\"10\",\"money\":\"200\",\"stock\":\"50\",\"spec_option_group\":\"银色_45寸智能\"}]', '0', '1', '0', '2018-07-30 17:28:50', '2018-07-31 14:22:11');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('7', '3', '2.00', '2', '10.00', '86', '1', '[{\"spec_group_id_str\":\"1801aa94b8a08fa9a0c467a6e2fc262e\",\"person_num\":\"2\",\"money\":\"10\",\"stock\":\"10\",\"spec_option_group\":\"白色_450M\"},{\"spec_group_id_str\":\"c5b12e5f6771f8bc9ac5ff80e0c2e5f5\",\"person_num\":\"2\",\"money\":\"10\",\"stock\":\"10\",\"spec_option_group\":\"黑色_450M\"},{\"spec_group_id_str\":\"f500f38a228dfbe52d25a8c1c6064e91\",\"person_num\":\"2\",\"money\":\"10\",\"stock\":\"10\",\"spec_option_group\":\"灰色_450M\"},{\"spec_group_id_str\":\"3815dc5fa04ce193491b1488fb76fab5\",\"person_num\":\"2\",\"money\":\"10\",\"stock\":\"10\",\"spec_option_group\":\"白色_1200M\"},{\"spec_group_id_str\":\"145c9e89ca0df0ad71dc483ada7823ec\",\"person_num\":\"2\",\"money\":\"10\",\"stock\":\"10\",\"spec_option_group\":\"黑色_1200M\"},{\"spec_group_id_str\":\"1034ced74785d90772d982521c460e11\",\"person_num\":\"2\",\"money\":\"10\",\"stock\":\"10\",\"spec_option_group\":\"灰色_1200M\"},{\"spec_group_id_str\":\"27c40c8cd59b044215e67fe7f768d8ff\",\"person_num\":\"2\",\"money\":\"10\",\"stock\":\"10\",\"spec_option_group\":\"白色_全千兆\"},{\"spec_group_id_str\":\"bc7837c0c483711c873e748bf34373b2\",\"person_num\":\"2\",\"money\":\"10\",\"stock\":8,\"spec_option_group\":\"黑色_全千兆\"},{\"spec_group_id_str\":\"fa8469b7c1889ab25fa4cfdae4cb3f43\",\"person_num\":\"2\",\"money\":\"10\",\"stock\":8,\"spec_option_group\":\"灰色_全千兆\"}]', '0', '1', '0', '2018-07-31 14:05:00', '2018-09-03 17:54:00');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('8', '2', '0.01', '2', '10.00', '86', '1', '[{\"spec_group_id_str\":\"9a4f62329a021d6063e4389b4191549a\",\"person_num\":\"2\",\"money\":\"15\",\"stock\":\"10\",\"spec_option_group\":\"白色_S\"},{\"spec_group_id_str\":\"3ecaf83e4b58258b2708e71f5153c28f\",\"person_num\":\"2\",\"money\":\"15\",\"stock\":\"10\",\"spec_option_group\":\"黑色_S\"},{\"spec_group_id_str\":\"14e449c122e1a02ad9055d72892da421\",\"person_num\":\"2\",\"money\":\"15\",\"stock\":\"10\",\"spec_option_group\":\"灰色_S\"},{\"spec_group_id_str\":\"212009b774a03875900111b1556c6bbd\",\"person_num\":\"2\",\"money\":\"15\",\"stock\":\"10\",\"spec_option_group\":\"白色_M\"},{\"spec_group_id_str\":\"75e13ff2a062474ce87a9743b92ed529\",\"person_num\":\"2\",\"money\":\"15\",\"stock\":9,\"spec_option_group\":\"黑色_M\"},{\"spec_group_id_str\":\"2a556c0b177054851a311b5b28bc0217\",\"person_num\":\"2\",\"money\":\"15\",\"stock\":\"10\",\"spec_option_group\":\"灰色_M\"},{\"spec_group_id_str\":\"086e8bcf7197f7a15e3f3ef580f48656\",\"person_num\":\"2\",\"money\":\"15\",\"stock\":\"10\",\"spec_option_group\":\"白色_L\"},{\"spec_group_id_str\":\"6ae4f8940ef3a0f87a7b0adfef09d243\",\"person_num\":\"2\",\"money\":\"15\",\"stock\":\"10\",\"spec_option_group\":\"黑色_L\"},{\"spec_group_id_str\":\"ebf7862a9bb6255ddad83eaed2ca94a8\",\"person_num\":\"2\",\"money\":\"15\",\"stock\":7,\"spec_option_group\":\"灰色_L\"}]', '0', '1', '0', '2018-07-31 14:23:36', '2018-09-03 17:54:00');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('9', '4', '10.00', '2', '2000.00', '59', '1', '[{\"spec_group_id_str\":\"8f7ddcef8034b31b2d219ce556bdca1c\",\"person_num\":\"2\",\"money\":\"2000\",\"stock\":\"10\",\"spec_option_group\":\"银色_45寸智能\"},{\"spec_group_id_str\":\"c00e9dfb99b228b9b31e01a6ed0cd1cf\",\"person_num\":\"2\",\"money\":\"2000\",\"stock\":\"10\",\"spec_option_group\":\"黑色_45寸智能\"},{\"spec_group_id_str\":\"4c278694f0e1a64e8989e4fe4e25da2d\",\"person_num\":\"2\",\"money\":\"2000\",\"stock\":\"10\",\"spec_option_group\":\"银色_50寸智能\"},{\"spec_group_id_str\":\"bae05d8d2bda242ab4579038dde5914e\",\"person_num\":\"2\",\"money\":\"2000\",\"stock\":\"10\",\"spec_option_group\":\"黑色_50寸智能\"},{\"spec_group_id_str\":\"5aa1986312dc29e79dd428e0e1530e58\",\"person_num\":\"2\",\"money\":\"2000\",\"stock\":\"10\",\"spec_option_group\":\"银色_60寸爆款4K\"},{\"spec_group_id_str\":\"4201a560b5d850a1f2fa922674981d99\",\"person_num\":\"2\",\"money\":\"2000\",\"stock\":9,\"spec_option_group\":\"黑色_60寸爆款4K\"}]', '0', '1', '0', '2018-08-25 14:24:56', '2018-09-03 17:53:56');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('10', '7', '24.00', '2', '5000.00', '0', '1', '[]', '0', '1', '1', '2018-09-03 17:55:24', '2018-09-03 17:55:47');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('11', '8', '24.00', '2', '500.00', '300', '1', '[{\"spec_group_id_str\":\"f90dd144f9cb24d244cc023e74eca12c\",\"person_num\":\"2\",\"money\":\"500\",\"stock\":\"100\",\"spec_option_group\":\"蓝色\"},{\"spec_group_id_str\":\"9d653df2bede1d864f703472454645f5\",\"person_num\":\"2\",\"money\":\"500\",\"stock\":\"100\",\"spec_option_group\":\"绿色\"},{\"spec_group_id_str\":\"99634f20d3ba922db5ab94e8fa002994\",\"person_num\":\"2\",\"money\":\"500\",\"stock\":\"100\",\"spec_option_group\":\"红色\"}]', '0', '1', '1', '2018-09-04 10:21:44', '2018-09-04 10:21:44');

-- -----------------------------
-- Table structure for `wancll_guides`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_guides`;
CREATE TABLE `wancll_guides` (
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_guides`
-- -----------------------------
INSERT INTO `wancll_guides` VALUES ('1', '22', '方式发', '/public/upload/article_images/20180630\\af71e469697a4aa92543cff5eeba1823.png', 'dfa', '<p>的说法打法</p>', 'fsdf ', '[]', '', '', '0', '1', '1', '2018-06-30 11:43:24', '2018-06-30 11:43:24');

-- -----------------------------
-- Table structure for `wancll_jobs`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_jobs`;
CREATE TABLE `wancll_jobs` (
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

-- -----------------------------
-- Records of `wancll_jobs`
-- -----------------------------
INSERT INTO `wancll_jobs` VALUES ('1', 'TimedTasksQueue', '{\"job\":\"app\\\\job\\\\task\\\\GroupBuyReturnGoods\",\"data\":{\"token\":\"5b50a120cf984\"}}', '0', '0', '', '1532044800', '1532010784');

-- -----------------------------
-- Table structure for `wancll_jpush_devices`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_jpush_devices`;
CREATE TABLE `wancll_jpush_devices` (
  `device_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '设备号',
  `type` varchar(10) NOT NULL COMMENT '值为ios || android',
  `account_id` bigint(20) unsigned NOT NULL,
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`device_id`)
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_market_activities`
-- -----------------------------
INSERT INTO `wancll_market_activities` VALUES ('1', 'discount', '123123', '', '[]', '1323132', '', '2018-08-20 00:00:00', '2018-09-08 00:00:00', '1', '1', '2018-08-19 21:27:52', '2018-08-19 21:27:52');
INSERT INTO `wancll_market_activities` VALUES ('2', 'coupon', '优惠券活动', '', '[]', '3', '', '2018-08-24 00:00:00', '2018-09-08 00:00:00', '1', '1', '2018-08-24 13:57:41', '2018-08-24 13:57:41');
INSERT INTO `wancll_market_activities` VALUES ('3', 'full', '满减活动', '/public/upload/user_images/20180824/b733c39c4816101eb6bfb68f88f481f2.png', '[]', '满减活动', '', '2018-08-24 00:00:00', '2018-09-08 00:00:00', '1', '1', '2018-08-24 13:58:53', '2018-08-24 13:58:53');
INSERT INTO `wancll_market_activities` VALUES ('4', 'full', '满减活动2', '/public/upload/user_images/20180827/ecae2bf081927211bb89a92a497c1b1c.png', '[]', '33', '', '2018-08-27 00:00:00', '2018-09-08 00:00:00', '1', '1', '2018-08-27 18:10:59', '2018-08-27 18:10:59');
INSERT INTO `wancll_market_activities` VALUES ('5', 'coupon', '优惠券活动2', '/public/upload/user_images/20180827/4718ef150144331df80ebd4ba8b09b1f.png', '[]', '优惠券活动2', '', '2018-08-28 00:00:00', '2018-09-08 00:00:00', '1', '1', '2018-08-27 18:11:39', '2018-08-27 18:11:39');
INSERT INTO `wancll_market_activities` VALUES ('6', 'discount', '限时折扣活动2', '', '[]', '3', '', '2018-08-27 00:00:00', '2018-09-12 00:00:00', '1', '1', '2018-08-27 18:12:07', '2018-08-27 18:12:07');
INSERT INTO `wancll_market_activities` VALUES ('7', 'coupon', '1', '/public/upload/user_images/20180903/7c6881e625d1c2cef03421ac139698eb.jpg', '[]', '1', '', '2018-09-03 00:00:00', '2018-09-30 00:00:00', '1', '1', '2018-09-03 10:32:14', '2018-09-03 10:32:14');
INSERT INTO `wancll_market_activities` VALUES ('8', 'coupon', '2', '/public/upload/user_images/20180903/79c3483fb4398becbf9372cfcf610c28.jpg', '[]', '2', '', '2018-09-03 00:00:00', '2018-09-29 00:00:00', '1', '1', '2018-09-03 10:32:30', '2018-09-03 10:32:30');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_mobile_msgs`
-- -----------------------------
INSERT INTO `wancll_mobile_msgs` VALUES ('1', '15581646116', '您的验证码是：324340，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '324340', '1', '2018-07-25 10:41:47');
INSERT INTO `wancll_mobile_msgs` VALUES ('2', '15071357527', '您的验证码是：532751，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '532751', '0', '2018-08-22 20:42:16');
INSERT INTO `wancll_mobile_msgs` VALUES ('3', '15071357527', '您的验证码是：846960，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '846960', '0', '2018-08-23 00:31:35');
INSERT INTO `wancll_mobile_msgs` VALUES ('4', '15071357527', '您的验证码是：760415，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '760415', '0', '2018-08-23 23:17:31');
INSERT INTO `wancll_mobile_msgs` VALUES ('5', '13874930708', '您的验证码是：992666，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '992666', '0', '2018-08-31 14:49:45');

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
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_navs`
-- -----------------------------
INSERT INTO `wancll_navs` VALUES ('1', '会员管理', '', 'icon-account', '', '', '', '', '900', '0', '0', '1', '1', '2017-12-06 15:06:14', '2018-04-02 15:46:53');
INSERT INTO `wancll_navs` VALUES ('2', '会员列表', '', '', 'admin', 'users', 'index', '', '100', '1', '0', '1', '1', '2017-12-06 15:11:57', '2017-12-29 09:34:45');
INSERT INTO `wancll_navs` VALUES ('29', '管理员列表', '', '', 'admin', 'system', 'admins', '', '20', '22', '0', '1', '1', '2017-12-11 20:56:47', '2017-12-19 08:55:41');
INSERT INTO `wancll_navs` VALUES ('112', '会员认证', '', '', 'admin', 'users', 'user_auths', '', '90', '1', '0', '1', '1', '2018-04-08 17:33:31', '2018-04-08 17:33:31');
INSERT INTO `wancll_navs` VALUES ('32', '友情链接', '', '', 'admin', 'content', 'friendly_links', '', '50', '37', '0', '1', '1', '2017-12-12 09:20:56', '2017-12-28 17:49:58');
INSERT INTO `wancll_navs` VALUES ('33', '会员访问日志', '', '', 'admin', 'users', 'user_visit_logs', '', '10', '1', '0', '1', '1', '2017-12-12 09:21:44', '2017-12-29 09:35:01');
INSERT INTO `wancll_navs` VALUES ('34', '自定义模型', '', '', 'admin', 'system', 'dds', '', '12', '22', '0', '1', '1', '2017-12-12 20:19:06', '2018-03-10 09:58:18');
INSERT INTO `wancll_navs` VALUES ('18', '文章管理', '', '', 'admin', 'content', 'articles', '', '200', '37', '0', '1', '1', '2017-12-06 15:23:47', '2017-12-16 10:09:53');
INSERT INTO `wancll_navs` VALUES ('113', '会员银行卡', '', '', 'admin', 'users', 'user_bank_cards', '', '70', '1', '0', '1', '1', '2018-04-10 16:52:12', '2018-04-10 16:52:12');
INSERT INTO `wancll_navs` VALUES ('21', '规则列表', '', '', 'admin', 'content', 'rules', '', '50', '37', '0', '1', '1', '2017-12-06 15:25:01', '2017-12-28 17:51:07');
INSERT INTO `wancll_navs` VALUES ('22', '系统管理', '', 'icon-msnui-sys-set', 'admin', '', '', '', '100', '0', '0', '1', '1', '2017-12-06 15:25:27', '2018-02-25 23:19:26');
INSERT INTO `wancll_navs` VALUES ('23', '参数配置', '', '', 'admin', 'system', 'params', '', '16', '22', '0', '1', '1', '2017-12-06 15:26:06', '2018-02-25 11:23:01');
INSERT INTO `wancll_navs` VALUES ('24', '菜单配置', '', '', 'admin', 'system', 'navs', '', '15', '22', '0', '1', '1', '2017-12-06 15:26:35', '2018-02-25 11:23:12');
INSERT INTO `wancll_navs` VALUES ('114', '资产管理', '', 'icon-daizhifudingdan', '', '', '', '', '750', '0', '0', '1', '1', '2018-04-11 17:53:54', '2018-04-11 17:53:54');
INSERT INTO `wancll_navs` VALUES ('27', '角色管理', '', '', 'admin', 'system', 'roles', '', '18', '22', '0', '1', '1', '2017-12-06 16:53:05', '2017-12-19 08:55:51');
INSERT INTO `wancll_navs` VALUES ('115', '会员资产列表', '', '', 'admin', 'user_assets', 'index', '', '100', '114', '0', '1', '1', '2018-04-11 17:54:55', '2018-04-11 17:54:55');
INSERT INTO `wancll_navs` VALUES ('36', '数据中台', '', 'icon-iconset0357', '', '', '', '', '1000', '0', '0', '1', '1', '2017-12-14 15:27:53', '2018-02-25 23:18:30');
INSERT INTO `wancll_navs` VALUES ('37', '内容管理', '', 'icon-xiexinzhangjie', '', '', '', '', '60', '0', '0', '1', '1', '2017-12-16 10:05:09', '2018-02-25 23:19:14');
INSERT INTO `wancll_navs` VALUES ('38', '广告管理', '', '', 'admin', 'content', 'advertisements', '', '79', '37', '0', '1', '1', '2017-12-16 10:07:15', '2017-12-28 17:50:15');
INSERT INTO `wancll_navs` VALUES ('39', '通知公告', '', '', 'admin', 'content', 'annoncements', '', '78', '37', '0', '1', '1', '2017-12-16 10:08:37', '2017-12-28 17:50:23');
INSERT INTO `wancll_navs` VALUES ('42', '轮播图管理', '', '', 'admin', 'content', 'banners', '', '60', '37', '0', '1', '1', '2017-12-16 10:21:28', '2017-12-28 17:51:13');
INSERT INTO `wancll_navs` VALUES ('43', '商品管理', '', 'icon-all', 'admin', 'goods', 'index', '', '750', '0', '0', '1', '1', '2017-12-16 10:35:43', '2018-02-25 23:18:39');
INSERT INTO `wancll_navs` VALUES ('44', '商品列表', '', '', 'admin', 'goods', 'index', '', '100', '43', '0', '1', '1', '2017-12-16 10:36:26', '2017-12-16 10:36:26');
INSERT INTO `wancll_navs` VALUES ('45', '商品分类', '', '', 'admin', 'goods', 'goods_cates', '', '90', '43', '0', '1', '1', '2017-12-16 10:37:57', '2017-12-16 10:37:57');
INSERT INTO `wancll_navs` VALUES ('46', '商品评论', '', '', 'admin', 'goods', 'goods_comments', '', '50', '43', '0', '1', '1', '2017-12-16 10:38:42', '2017-12-16 10:38:42');
INSERT INTO `wancll_navs` VALUES ('47', '商品收藏', '', '', 'admin', 'goods', 'goods_collections', '', '40', '43', '0', '1', '1', '2017-12-16 10:40:28', '2017-12-16 10:40:28');
INSERT INTO `wancll_navs` VALUES ('48', '订单管理', '', 'icon-icon_order', 'admin', 'orders', 'index', '', '650', '0', '0', '1', '1', '2017-12-16 10:45:06', '2018-02-25 23:19:03');
INSERT INTO `wancll_navs` VALUES ('49', '订单列表', '', '', 'admin', 'orders', 'index', '', '100', '48', '0', '1', '1', '2017-12-16 10:47:03', '2017-12-29 23:09:05');
INSERT INTO `wancll_navs` VALUES ('70', '管理员登录日志', '', '', 'admin', 'system', 'admin_visit_logs', '', '19', '22', '0', '1', '1', '2017-12-20 21:21:54', '2017-12-20 21:21:54');
INSERT INTO `wancll_navs` VALUES ('116', '资产变动记录', '', '', 'admin', 'user_assets', 'user_asset_logs', '', '90', '114', '0', '1', '1', '2018-04-11 18:02:58', '2018-04-11 18:02:58');
INSERT INTO `wancll_navs` VALUES ('117', '会员积分记录', '', '', 'admin', 'user_assets', 'user_score_logs', '', '60', '114', '0', '1', '1', '2018-04-11 20:36:36', '2018-04-11 20:36:36');
INSERT INTO `wancll_navs` VALUES ('118', '会员提现记录', '', '', 'admin', 'user_assets', 'user_withdraw_logs', '', '70', '114', '0', '1', '1', '2018-04-11 20:40:19', '2018-04-11 20:40:19');
INSERT INTO `wancll_navs` VALUES ('75', '会员地址', '', '', 'admin', 'users', 'user_addresses', '', '80', '1', '0', '1', '1', '2017-12-29 22:57:42', '2017-12-29 22:57:42');
INSERT INTO `wancll_navs` VALUES ('76', '发货管理', '', '', 'admin', 'orders', 'order_deliver', '', '90', '48', '0', '1', '1', '2017-12-29 23:08:50', '2017-12-29 23:08:50');
INSERT INTO `wancll_navs` VALUES ('77', '退货管理', '', '', 'admin', 'orders', 'goods_return', '', '80', '48', '0', '1', '1', '2017-12-29 23:10:22', '2017-12-29 23:10:22');
INSERT INTO `wancll_navs` VALUES ('78', '物流查询', '', '', 'admin', 'orders', 'query_logistics', '', '60', '48', '0', '1', '1', '2017-12-29 23:11:39', '2017-12-29 23:11:39');
INSERT INTO `wancll_navs` VALUES ('81', '分销管理', '', 'icon-tixian', '', '', '', '', '400', '0', '0', '1', '1', '2017-12-27 10:49:50', '2018-09-03 15:40:34');
INSERT INTO `wancll_navs` VALUES ('82', '分销商等级设置', '', '', 'admin', 'distribution', 'levels', '', '90', '81', '0', '1', '1', '2017-12-27 10:52:40', '2017-12-27 10:52:53');
INSERT INTO `wancll_navs` VALUES ('83', '分销基本参数', '', '', 'admin', 'distribution', 'params', '', '100', '81', '0', '1', '1', '2017-12-27 14:11:33', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('119', '会员充值记录', '', '', 'admin', 'user_assets', 'user_recharge_logs', '', '80', '114', '0', '1', '1', '2018-04-11 20:40:44', '2018-04-11 20:40:44');
INSERT INTO `wancll_navs` VALUES ('86', '分销商佣金提现管理', '', '', 'admin', 'distribution', 'user_withdraw', '', '80', '81', '0', '1', '1', '2018-01-08 22:49:59', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('90', '签收管理', '', '', 'admin', 'orders', 'sign_for', '', '70', '48', '0', '1', '1', '2018-02-08 10:52:34', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('91', '基础设置', '', 'icon-shezhi1', 'admin', 'basics', 'index', '', '2000', '0', '1', '1', '1', '2018-02-08 17:10:08', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('92', '留言建议', '', 'icon-xinfeng2', 'admin', 'content', 'feedback', '', '1900', '0', '1', '1', '1', '2018-02-08 17:10:45', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('93', '指导手册', '', 'icon-yewushouce', 'admin', 'content', 'guides', '', '1800', '0', '1', '1', '1', '2018-02-08 17:12:07', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('94', '统计板', '', '', 'admin', 'data', 'index', '', '10', '36', '0', '1', '1', '2018-02-23 08:44:28', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('128', '会员通知', '', '', 'admin', 'users', 'user_notices', '', '50', '1', '0', '1', '1', '2018-04-14 14:15:25', '2018-04-14 14:15:25');
INSERT INTO `wancll_navs` VALUES ('129', '会员优惠券', '', '', 'admin', 'users', 'user_coupons', '', '60', '1', '0', '1', '1', '2018-04-14 20:33:56', '2018-04-14 20:33:56');
INSERT INTO `wancll_navs` VALUES ('100', '商品规格模板', '', '', 'admin', 'goods', 'spec_template', '', '80', '43', '0', '1', '1', '2018-02-23 20:28:11', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('101', '商品属性模板', '', '', 'admin', 'goods', 'attr_template', '', '70', '43', '0', '1', '1', '2018-02-25 11:24:53', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('102', '商品运费模板', '', '', 'admin', 'goods', 'freight_template', '', '60', '43', '0', '1', '1', '2018-02-27 22:57:21', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('103', '七牛云存储', '', '', 'admin', 'system', 'qiniu', '', '10', '22', '0', '1', '1', '2018-03-08 13:50:09', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('104', '数据库备份与恢复', '', '', 'admin', 'system', 'data_backup', '', '0', '22', '0', '1', '1', '2018-03-09 09:34:19', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('105', '邮件系统', '', '', 'admin', 'system', 'email', '', '8', '22', '0', '1', '1', '2018-03-10 09:58:06', '2018-04-02 14:11:44');
INSERT INTO `wancll_navs` VALUES ('121', '营销管理', '', 'icon-youhuiquan', 'admin', 'market_activities', 'index', '', '500', '0', '0', '1', '1', '2018-04-12 17:52:37', '2018-04-12 17:52:37');
INSERT INTO `wancll_navs` VALUES ('122', '活动管理', '', '', 'admin', 'market_activities', 'index', '', '100', '121', '0', '1', '1', '2018-04-12 17:55:09', '2018-04-12 17:55:09');
INSERT INTO `wancll_navs` VALUES ('124', '优惠券活动规则', '', '', 'admin', 'market_activities', 'coupon_activities', '', '70', '121', '0', '1', '1', '2018-04-13 11:45:26', '2018-04-13 11:45:26');
INSERT INTO `wancll_navs` VALUES ('125', '满减活动规则', '', '', 'admin', 'market_activities', 'full_activities', '', '80', '121', '0', '1', '1', '2018-04-13 14:14:19', '2018-04-13 14:14:19');
INSERT INTO `wancll_navs` VALUES ('126', '会员等级设置', '', '', 'admin', 'system', 'user_levels', '', '0', '22', '0', '1', '1', '2018-04-13 15:06:15', '2018-04-13 15:06:15');
INSERT INTO `wancll_navs` VALUES ('127', '限时折扣活动规则', '', '', 'admin', 'market_activities', 'discount_activities', '', '90', '121', '0', '1', '1', '2018-04-13 15:24:17', '2018-04-13 15:24:17');
INSERT INTO `wancll_navs` VALUES ('130', '会员申请分销商管理', '', '', 'admin', 'distribution', 'user_applications', '', '10', '81', '0', '1', '1', '2018-04-23 09:30:14', '2018-04-23 09:30:14');
INSERT INTO `wancll_navs` VALUES ('131', '分销商品设置', '', '', 'admin', 'distribution', 'goods_setting', '', '80', '81', '0', '1', '1', '2018-04-25 11:11:32', '2018-04-25 11:11:32');
INSERT INTO `wancll_navs` VALUES ('132', '分红管理', '', 'icon-shouhou', '', '', '', '', '300', '0', '0', '1', '1', '2018-04-27 09:26:02', '2018-09-03 15:40:26');
INSERT INTO `wancll_navs` VALUES ('133', '分红商等级设置', '', '', 'admin', 'bonus', 'levels', '', '90', '132', '0', '1', '1', '2018-04-27 09:26:26', '2018-04-27 09:26:26');
INSERT INTO `wancll_navs` VALUES ('134', '分红基本参数', '', '', 'admin', 'bonus', 'params', '', '100', '132', '0', '1', '1', '2018-04-27 10:25:08', '2018-04-27 10:25:08');
INSERT INTO `wancll_navs` VALUES ('135', '会员申请分红商管理', '', '', 'admin', 'bonus', 'user_applications', '', '60', '132', '0', '1', '1', '2018-04-27 11:30:33', '2018-04-27 11:30:33');
INSERT INTO `wancll_navs` VALUES ('136', '地区代理会员设置', '', '', 'admin', 'bonus', 'area_user_setting', '', '78', '132', '0', '1', '1', '2018-04-27 13:58:42', '2018-04-27 13:58:42');
INSERT INTO `wancll_navs` VALUES ('137', '分红商品设置', '', '', 'admin', 'bonus', 'goods_setting', '', '80', '132', '0', '1', '1', '2018-04-27 13:59:08', '2018-04-27 13:59:08');
INSERT INTO `wancll_navs` VALUES ('138', '全球分红会员设置', '', '', 'admin', 'bonus', 'global_user_setting', '', '76', '132', '0', '1', '1', '2018-04-28 09:19:42', '2018-04-28 09:19:42');
INSERT INTO `wancll_navs` VALUES ('139', '分红商佣金提现管理', '', '', 'admin', 'bonus', 'user_withdraw', '', '70', '132', '0', '1', '1', '2018-04-28 10:14:12', '2018-04-28 10:14:12');
INSERT INTO `wancll_navs` VALUES ('140', '会员上下级关系', '', '', 'admin', 'users', 'user_relationship', '', '0', '1', '0', '1', '1', '2018-06-04 22:06:58', '2018-06-04 22:06:58');
INSERT INTO `wancll_navs` VALUES ('141', '分销商列表', '', '', 'admin', 'distribution', 'users', '', '0', '81', '0', '1', '1', '2018-06-13 13:46:29', '2018-06-13 13:46:29');
INSERT INTO `wancll_navs` VALUES ('142', '分红商列表', '', '', 'admin', 'bonus', 'users', '', '0', '132', '0', '1', '1', '2018-06-13 13:46:51', '2018-06-13 13:46:51');
INSERT INTO `wancll_navs` VALUES ('143', '分类树', '', '', 'admin', 'system', 'category_tree', '', '11', '22', '0', '1', '1', '2018-06-28 11:52:31', '2018-06-28 11:52:31');
INSERT INTO `wancll_navs` VALUES ('145', 'fdas', '', '', '', '', '', '', '0', '92', '0', '1', '0', '2018-06-29 15:51:11', '2018-06-29 15:51:32');
INSERT INTO `wancll_navs` VALUES ('146', '积分商城', '', 'icon-jifenshangcheng', '', '', '', '', '490', '0', '0', '1', '1', '2018-06-29 22:32:15', '2018-09-03 15:41:00');
INSERT INTO `wancll_navs` VALUES ('147', '团购管理', '', 'icon-daohangtuangou', '', '', '', '', '480', '0', '0', '1', '1', '2018-06-29 22:32:42', '2018-09-03 15:40:44');
INSERT INTO `wancll_navs` VALUES ('148', '积分商品管理', '', '', 'admin', 'score_shop', 'goods_list', '', '40', '146', '0', '1', '1', '2018-06-29 22:33:25', '2018-06-29 22:33:25');
INSERT INTO `wancll_navs` VALUES ('149', '系统团购商品设置', '', '', 'admin', 'group_shop', 'system_goods_list', '', '40', '147', '0', '1', '1', '2018-06-29 22:34:22', '2018-06-29 22:34:22');
INSERT INTO `wancll_navs` VALUES ('150', '积分商城配置', '', '', 'admin', 'score_shop', 'params', '', '50', '146', '0', '1', '1', '2018-06-30 15:12:10', '2018-06-30 15:12:10');
INSERT INTO `wancll_navs` VALUES ('151', '团购配置', '', '', 'admin', 'group_shop', 'params', '', '50', '147', '0', '1', '1', '2018-06-30 15:28:42', '2018-06-30 15:28:42');
INSERT INTO `wancll_navs` VALUES ('152', '积分订单管理', '', '', 'admin', 'score_shop', 'orders', '', '30', '146', '0', '1', '1', '2018-07-02 18:03:21', '2018-07-02 18:03:21');
INSERT INTO `wancll_navs` VALUES ('153', '会员团购商品设置', '', '', 'admin', 'group_shop', 'member_goods_list', '', '35', '147', '0', '1', '1', '2018-07-05 09:57:28', '2018-07-05 09:57:28');
INSERT INTO `wancll_navs` VALUES ('154', '定时任务管理', '', '', 'admin', 'system', 'time_task', '', '0', '22', '0', '1', '1', '2018-07-13 16:56:27', '2018-07-13 16:56:27');
INSERT INTO `wancll_navs` VALUES ('155', '系统团购订单管理', '', '', 'admin', 'group_shop', 'system_orders', '', '37', '147', '0', '1', '1', '2018-07-24 15:29:08', '2018-07-24 15:29:08');
INSERT INTO `wancll_navs` VALUES ('156', '会员团购订单管理', '', '', 'admin', 'group_shop', 'user_orders', '', '28', '147', '0', '1', '1', '2018-07-24 15:29:53', '2018-07-24 15:29:53');
INSERT INTO `wancll_navs` VALUES ('157', '系统团购拼团信息', '', '', 'admin', 'group_shop', 'system_teams', '', '38', '147', '0', '1', '1', '2018-07-24 15:31:51', '2018-07-24 15:31:51');
INSERT INTO `wancll_navs` VALUES ('158', '会员团购拼团信息', '', '', 'admin', 'group_shop', 'user_teams', '', '33', '147', '0', '1', '1', '2018-07-24 15:32:31', '2018-07-24 15:32:31');
INSERT INTO `wancll_navs` VALUES ('159', '拼团退款管理', '', '', 'admin', 'group_shop', 'return_money', '', '0', '147', '0', '1', '1', '2018-07-31 10:34:56', '2018-07-31 10:34:56');
INSERT INTO `wancll_navs` VALUES ('160', '统计版', '', '5', '65', '556', '5', '5', '5', '36', '0', '1', '0', '2018-08-24 10:17:39', '2018-09-03 10:42:57');
INSERT INTO `wancll_navs` VALUES ('161', '测试菜单', '', '', '测试', '3', '', '', '0', '0', '0', '1', '0', '2018-08-24 10:21:52', '2018-08-24 10:31:01');
INSERT INTO `wancll_navs` VALUES ('162', '测试菜单', '', '', '测试', '3', '', '', '0', '0', '0', '1', '0', '2018-08-24 10:21:53', '2018-08-24 10:30:54');
INSERT INTO `wancll_navs` VALUES ('163', '测试', '', '', '', '', '', '', '0', '0', '0', '1', '0', '2018-09-01 11:30:36', '2018-09-01 11:30:44');
INSERT INTO `wancll_navs` VALUES ('164', '1', '', '1', '1', '1', '1', '1', '0', '0', '0', '1', '0', '2018-09-01 11:33:59', '2018-09-01 11:34:06');

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
INSERT INTO `wancll_notices` VALUES ('1', '5', 'lallalalaallal ', '', 'lalalala ', '1', '1', '2018-08-04 17:33:41', '2018-08-04 17:33:41');
INSERT INTO `wancll_notices` VALUES ('2', '13', '554', '55', '55', '1', '1', '2018-08-27 18:19:52', '2018-08-27 18:19:52');
INSERT INTO `wancll_notices` VALUES ('3', '14', '1', '1', '1', '1', '1', '2018-09-01 11:33:07', '2018-09-01 11:33:07');

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
  `score` decimal(10,2) DEFAULT '0.00' COMMENT '积分',
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
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_order_goods`
-- -----------------------------
INSERT INTO `wancll_order_goods` VALUES ('1', '1', '2', '2', '轩斯顿 短袖T恤男士卫衣', '/public/upload/goods_images/20180724\\e983f980ae2c060c9612674522ef9542.jpg', '2018夏季新款帅气韩版时尚休闲连帽半袖五分上衣服青年学生打底衫男装', '', 'ebf7862a9bb6255ddad83eaed2ca94a8', '灰色_L', '15.00', '0.00', '15.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-07-31 15:03:52', '2018-07-31 15:03:52');
INSERT INTO `wancll_order_goods` VALUES ('2', '2', '3', '2', '小米路由器', '/public/upload/goods_images/20180724\\f4dc8589e04b4e2ca61f21a05264c7f3.jpg', '小米路由器3G 全千兆 双频 四天线信号穿墙 有线无线双千兆 光纤优选 大户型覆盖', '', 'fa8469b7c1889ab25fa4cfdae4cb3f43', '灰色_全千兆', '10.00', '0.00', '10.00', '0.00', '1', '0', '0', '0', '1', '1', '2018-07-31 18:18:56', '2018-09-03 11:07:45');
INSERT INTO `wancll_order_goods` VALUES ('3', '3', '2', '5', '轩斯顿 短袖T恤男士卫衣', '/public/upload/goods_images/20180724\\e983f980ae2c060c9612674522ef9542.jpg', '2018夏季新款帅气韩版时尚休闲连帽半袖五分上衣服青年学生打底衫男装', '', '75e13ff2a062474ce87a9743b92ed529', '黑色_M', '15.00', '0.00', '15.00', '0.00', '1', '0', '0', '0', '1', '1', '2018-08-01 10:15:03', '2018-09-03 11:07:48');
INSERT INTO `wancll_order_goods` VALUES ('4', '4', '3', '5', '小米路由器', '/public/upload/goods_images/20180724\\f4dc8589e04b4e2ca61f21a05264c7f3.jpg', '小米路由器3G 全千兆 双频 四天线信号穿墙 有线无线双千兆 光纤优选 大户型覆盖', '', '145c9e89ca0df0ad71dc483ada7823ec', '黑色_1200M', '10.00', '999.00', '10.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-08-01 16:09:13', '2018-08-01 16:09:13');
INSERT INTO `wancll_order_goods` VALUES ('5', '5', '4', '5', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180724\\b5664c84cf8995f13a42fd0a81b57fa2.jpg', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', '4c278694f0e1a64e8989e4fe4e25da2d', '银色_50寸智能', '3299.00', '0.00', '3299.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-08-04 17:38:45', '2018-08-04 17:38:45');
INSERT INTO `wancll_order_goods` VALUES ('6', '6', '2', '2', '轩斯顿 短袖T恤男士卫衣', '/public/upload/goods_images/20180804/8f870a675e42d9435c4e947622ac181e.jpg', '2018夏季新款帅气韩版时尚休闲连帽半袖五分上衣服青年学生打底衫男装', '', '75e13ff2a062474ce87a9743b92ed529', '黑色_M', '100.00', '0.00', '100.00', '0.00', '1', '0', '3', '1', '1', '1', '2018-08-07 16:17:28', '2018-08-31 17:05:04');
INSERT INTO `wancll_order_goods` VALUES ('7', '7', '2', '7', '轩斯顿 短袖T恤男士卫衣', '/public/upload/goods_images/20180804/8f870a675e42d9435c4e947622ac181e.jpg', '2018夏季新款帅气韩版时尚休闲连帽半袖五分上衣服青年学生打底衫男装', '', '2a556c0b177054851a311b5b28bc0217', '灰色_M', '100.00', '0.00', '100.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-08-10 09:13:08', '2018-08-10 09:13:08');
INSERT INTO `wancll_order_goods` VALUES ('8', '8', '2', '7', '轩斯顿 短袖T恤男士卫衣', '/public/upload/goods_images/20180804/8f870a675e42d9435c4e947622ac181e.jpg', '2018夏季新款帅气韩版时尚休闲连帽半袖五分上衣服青年学生打底衫男装', '', '2a556c0b177054851a311b5b28bc0217', '灰色_M', '100.00', '0.00', '100.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-08-10 09:13:53', '2018-08-10 09:13:53');
INSERT INTO `wancll_order_goods` VALUES ('9', '9', '4', '2', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180811/924b2a3e8ee8c63f51c3bd576ad4d563.png', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', '4201a560b5d850a1f2fa922674981d99', '黑色_60寸爆款4K', '3299.00', '0.00', '3299.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-08-14 14:34:58', '2018-08-31 17:07:13');
INSERT INTO `wancll_order_goods` VALUES ('10', '10', '5', '12', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', 'aefef5355ad49bd95bf17ab9c94359e4', '绿色', '100.00', '0.00', '100.00', '200.00', '1', '0', '0', '0', '0', '1', '2018-08-24 11:31:42', '2018-08-24 11:31:42');
INSERT INTO `wancll_order_goods` VALUES ('11', '11', '5', '12', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', 'aefef5355ad49bd95bf17ab9c94359e4', '绿色', '100.00', '0.00', '100.00', '200.00', '1', '0', '0', '0', '0', '1', '2018-08-24 11:47:50', '2018-08-24 11:47:50');
INSERT INTO `wancll_order_goods` VALUES ('12', '12', '6', '12', '免邮费商品', '/public/upload/goods_images/20180824/7b831d739d415cb356774e03a9fa5471.png', '按件计费', '', '15af5a6922cb75a5c1e7dcb0fab322dd', '大于50cm', '100.00', '0.00', '100.00', '300.00', '1', '0', '3', '1', '1', '1', '2018-08-24 11:48:26', '2018-09-01 16:12:33');
INSERT INTO `wancll_order_goods` VALUES ('13', '13', '6', '12', '免邮费商品', '/public/upload/goods_images/20180824/7b831d739d415cb356774e03a9fa5471.png', '按件计费', '', '11d72bbb0a90eed68331863da7ff8344', '小于50cm', '100.00', '0.00', '100.00', '300.00', '1', '0', '3', '1', '1', '1', '2018-08-24 11:48:54', '2018-08-24 12:04:14');
INSERT INTO `wancll_order_goods` VALUES ('14', '14', '6', '12', '免邮费商品', '/public/upload/goods_images/20180824/7b831d739d415cb356774e03a9fa5471.png', '按件计费', '', '15af5a6922cb75a5c1e7dcb0fab322dd', '大于50cm', '100.00', '0.00', '100.00', '300.00', '1', '1', '0', '0', '0', '1', '2018-08-24 11:49:42', '2018-08-24 12:42:02');
INSERT INTO `wancll_order_goods` VALUES ('15', '15', '5', '12', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', '4821f5db66d294a3d277e0448b2e49ad', '蓝色', '100.00', '0.00', '100.00', '200.00', '1', '0', '2', '0', '0', '1', '2018-08-24 11:56:03', '2018-08-24 12:04:00');
INSERT INTO `wancll_order_goods` VALUES ('16', '16', '5', '12', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', 'aefef5355ad49bd95bf17ab9c94359e4', '绿色', '100.00', '0.00', '150.00', '200.00', '2', '0', '0', '0', '0', '1', '2018-08-24 13:37:21', '2018-08-24 13:37:21');
INSERT INTO `wancll_order_goods` VALUES ('17', '17', '5', '12', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', 'aefef5355ad49bd95bf17ab9c94359e4', '绿色', '100.00', '0.00', '100.00', '200.00', '1', '0', '0', '0', '0', '1', '2018-08-24 13:38:32', '2018-08-24 13:38:32');
INSERT INTO `wancll_order_goods` VALUES ('18', '18', '5', '12', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', 'aefef5355ad49bd95bf17ab9c94359e4', '绿色', '100.00', '0.00', '100.00', '200.00', '1', '0', '0', '0', '0', '1', '2018-08-24 13:38:33', '2018-08-24 13:38:33');
INSERT INTO `wancll_order_goods` VALUES ('19', '19', '5', '12', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', 'aefef5355ad49bd95bf17ab9c94359e4', '绿色', '100.00', '0.00', '100.00', '200.00', '1', '0', '0', '0', '0', '1', '2018-08-24 13:38:33', '2018-08-24 13:38:33');
INSERT INTO `wancll_order_goods` VALUES ('20', '20', '5', '12', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', 'aefef5355ad49bd95bf17ab9c94359e4', '绿色', '100.00', '0.00', '100.00', '200.00', '1', '0', '0', '0', '0', '1', '2018-08-24 13:38:42', '2018-08-24 13:38:42');
INSERT INTO `wancll_order_goods` VALUES ('21', '21', '2', '2', '轩斯顿 短袖T恤男士卫衣', '/public/upload/goods_images/20180811/68829501ee2de9a0a931fce515fd1c85.png', '2018夏季新款帅气韩版时尚休闲连帽半袖五分上衣服青年学生打底衫男装', '', '3ecaf83e4b58258b2708e71f5153c28f', '黑色_S', '100.00', '0.00', '100.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-08-31 14:21:12', '2018-08-31 17:07:43');
INSERT INTO `wancll_order_goods` VALUES ('22', '22', '2', '2', '轩斯顿 短袖T恤男士卫衣', '/public/upload/goods_images/20180811/68829501ee2de9a0a931fce515fd1c85.png', '2018夏季新款帅气韩版时尚休闲连帽半袖五分上衣服青年学生打底衫男装', '', '212009b774a03875900111b1556c6bbd', '白色_M', '100.00', '0.00', '100.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-08-31 14:22:13', '2018-08-31 16:18:38');
INSERT INTO `wancll_order_goods` VALUES ('23', '23', '2', '2', '轩斯顿 短袖T恤男士卫衣', '/public/upload/goods_images/20180811/68829501ee2de9a0a931fce515fd1c85.png', '2018夏季新款帅气韩版时尚休闲连帽半袖五分上衣服青年学生打底衫男装', '', '14e449c122e1a02ad9055d72892da421', '灰色_S', '100.00', '0.00', '100.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-08-31 14:47:55', '2018-08-31 16:18:46');
INSERT INTO `wancll_order_goods` VALUES ('24', '24', '5', '2', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', '4821f5db66d294a3d277e0448b2e49ad', '蓝色', '100.00', '0.00', '100.00', '200.00', '1', '1', '0', '0', '0', '1', '2018-08-31 15:07:34', '2018-08-31 17:07:27');
INSERT INTO `wancll_order_goods` VALUES ('25', '25', '5', '2', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', '4821f5db66d294a3d277e0448b2e49ad', '蓝色', '100.00', '0.00', '100.00', '200.00', '1', '1', '0', '0', '0', '1', '2018-08-31 15:11:17', '2018-08-31 17:07:34');
INSERT INTO `wancll_order_goods` VALUES ('26', '26', '5', '2', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', '4821f5db66d294a3d277e0448b2e49ad', '蓝色', '100.00', '0.00', '100.00', '200.00', '1', '1', '0', '0', '0', '1', '2018-08-31 15:11:22', '2018-08-31 16:18:53');
INSERT INTO `wancll_order_goods` VALUES ('27', '27', '2', '2', '轩斯顿 短袖T恤男士卫衣', '/public/upload/goods_images/20180811/68829501ee2de9a0a931fce515fd1c85.png', '2018夏季新款帅气韩版时尚休闲连帽半袖五分上衣服青年学生打底衫男装', '', '2a556c0b177054851a311b5b28bc0217', '灰色_M', '100.00', '0.00', '100.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-08-31 15:15:51', '2018-08-31 17:07:38');
INSERT INTO `wancll_order_goods` VALUES ('28', '28', '1', '12', '测试商品', '/public/upload/goods_images/20180720\\e05a5778b4d7f83d67ab3414fa22bb23.png', '', '', 'f151bcf787d73a0cb29fd360d7f6f598', '尺寸', '100.00', '0.00', '200.00', '0.00', '2', '0', '3', '1', '1', '1', '2018-08-31 15:18:58', '2018-09-01 16:12:40');
INSERT INTO `wancll_order_goods` VALUES ('29', '29', '5', '2', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', '4821f5db66d294a3d277e0448b2e49ad', '蓝色', '0.00', '5.00', '0.00', '200.00', '1', '0', '0', '0', '0', '1', '2018-08-31 15:43:43', '2018-08-31 15:43:43');
INSERT INTO `wancll_order_goods` VALUES ('30', '30', '4', '2', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180825/457ecc49505d0c09b67ffcbdde368d19.png', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', '4201a560b5d850a1f2fa922674981d99', '黑色_60寸爆款4K', '2000.00', '0.00', '2000.00', '0.00', '1', '0', '0', '0', '1', '1', '2018-08-31 15:44:05', '2018-09-03 11:07:43');
INSERT INTO `wancll_order_goods` VALUES ('31', '31', '1', '2', '测试商品', '/public/upload/goods_images/20180720\\e05a5778b4d7f83d67ab3414fa22bb23.png', '', '', 'f151bcf787d73a0cb29fd360d7f6f598', '尺寸', '100.00', '0.00', '100.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-08-31 16:34:18', '2018-08-31 17:07:09');
INSERT INTO `wancll_order_goods` VALUES ('32', '31', '4', '2', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180825/457ecc49505d0c09b67ffcbdde368d19.png', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', 'c00e9dfb99b228b9b31e01a6ed0cd1cf', '黑色_45寸智能', '3299.00', '0.00', '16495.00', '0.00', '5', '1', '0', '0', '0', '1', '2018-08-31 16:34:18', '2018-08-31 17:07:05');
INSERT INTO `wancll_order_goods` VALUES ('33', '31', '5', '2', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', 'aefef5355ad49bd95bf17ab9c94359e4', '绿色', '100.00', '0.00', '200.00', '200.00', '2', '1', '0', '0', '0', '1', '2018-08-31 16:34:18', '2018-08-31 17:07:00');
INSERT INTO `wancll_order_goods` VALUES ('34', '32', '4', '2', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180825/457ecc49505d0c09b67ffcbdde368d19.png', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', '4201a560b5d850a1f2fa922674981d99', '黑色_60寸爆款4K', '3299.00', '0.00', '3299.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-08-31 16:37:39', '2018-08-31 16:38:19');
INSERT INTO `wancll_order_goods` VALUES ('35', '33', '6', '17', '免邮费商品', '/public/upload/goods_images/20180824/7b831d739d415cb356774e03a9fa5471.png', '按件计费', '', '15af5a6922cb75a5c1e7dcb0fab322dd', '大于50cm', '100.00', '0.00', '100.00', '300.00', '1', '1', '0', '0', '0', '1', '2018-08-31 16:42:53', '2018-08-31 16:43:27');
INSERT INTO `wancll_order_goods` VALUES ('36', '34', '6', '17', '免邮费商品', '/public/upload/goods_images/20180824/7b831d739d415cb356774e03a9fa5471.png', '按件计费', '', '11d72bbb0a90eed68331863da7ff8344', '小于50cm', '100.00', '0.00', '100.00', '300.00', '1', '1', '0', '0', '0', '1', '2018-08-31 16:44:59', '2018-08-31 16:45:34');
INSERT INTO `wancll_order_goods` VALUES ('37', '35', '6', '17', '免邮费商品', '/public/upload/goods_images/20180824/7b831d739d415cb356774e03a9fa5471.png', '按件计费', '', '15af5a6922cb75a5c1e7dcb0fab322dd', '大于50cm', '100.00', '0.00', '100.00', '300.00', '1', '1', '0', '0', '0', '1', '2018-08-31 16:46:12', '2018-08-31 16:47:57');
INSERT INTO `wancll_order_goods` VALUES ('38', '36', '6', '17', '免邮费商品', '/public/upload/goods_images/20180824/7b831d739d415cb356774e03a9fa5471.png', '按件计费', '', '15af5a6922cb75a5c1e7dcb0fab322dd', '大于50cm', '100.00', '0.00', '100.00', '300.00', '1', '1', '0', '0', '0', '1', '2018-08-31 16:46:18', '2018-08-31 16:46:57');
INSERT INTO `wancll_order_goods` VALUES ('39', '37', '4', '18', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180825/457ecc49505d0c09b67ffcbdde368d19.png', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', '4201a560b5d850a1f2fa922674981d99', '黑色_60寸爆款4K', '3299.00', '0.00', '3299.00', '0.00', '1', '0', '3', '1', '1', '1', '2018-08-31 17:03:52', '2018-08-31 17:05:55');
INSERT INTO `wancll_order_goods` VALUES ('40', '38', '4', '2', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180825/457ecc49505d0c09b67ffcbdde368d19.png', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', '4201a560b5d850a1f2fa922674981d99', '黑色_60寸爆款4K', '3299.00', '0.00', '3299.00', '0.00', '1', '0', '3', '1', '1', '1', '2018-08-31 17:07:54', '2018-08-31 17:52:17');
INSERT INTO `wancll_order_goods` VALUES ('41', '39', '4', '18', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180825/457ecc49505d0c09b67ffcbdde368d19.png', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', '4201a560b5d850a1f2fa922674981d99', '黑色_60寸爆款4K', '3299.00', '0.00', '3299.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-08-31 17:09:41', '2018-08-31 17:45:49');
INSERT INTO `wancll_order_goods` VALUES ('42', '40', '4', '17', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180825/457ecc49505d0c09b67ffcbdde368d19.png', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', '4201a560b5d850a1f2fa922674981d99', '黑色_60寸爆款4K', '3299.00', '0.00', '3299.00', '0.00', '1', '0', '3', '1', '1', '1', '2018-08-31 17:47:30', '2018-08-31 17:52:33');
INSERT INTO `wancll_order_goods` VALUES ('43', '41', '4', '18', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180825/457ecc49505d0c09b67ffcbdde368d19.png', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', '4201a560b5d850a1f2fa922674981d99', '黑色_60寸爆款4K', '3299.00', '0.00', '3299.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-08-31 17:53:02', '2018-08-31 17:55:29');
INSERT INTO `wancll_order_goods` VALUES ('44', '42', '4', '18', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180825/457ecc49505d0c09b67ffcbdde368d19.png', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', '4201a560b5d850a1f2fa922674981d99', '黑色_60寸爆款4K', '3299.00', '0.00', '3299.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-08-31 17:55:43', '2018-09-01 09:31:38');
INSERT INTO `wancll_order_goods` VALUES ('45', '43', '4', '18', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180825/457ecc49505d0c09b67ffcbdde368d19.png', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', '4c278694f0e1a64e8989e4fe4e25da2d', '银色_50寸智能', '3299.00', '0.00', '3299.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-08-31 17:55:50', '2018-08-31 17:56:30');
INSERT INTO `wancll_order_goods` VALUES ('46', '44', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 09:23:04', '2018-09-01 09:31:42');
INSERT INTO `wancll_order_goods` VALUES ('47', '45', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 09:37:40', '2018-09-01 09:38:11');
INSERT INTO `wancll_order_goods` VALUES ('48', '46', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 09:44:02', '2018-09-01 09:44:29');
INSERT INTO `wancll_order_goods` VALUES ('49', '47', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 09:51:06', '2018-09-01 10:24:17');
INSERT INTO `wancll_order_goods` VALUES ('50', '48', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 10:26:30', '2018-09-01 10:31:16');
INSERT INTO `wancll_order_goods` VALUES ('51', '49', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 10:28:27', '2018-09-01 10:31:07');
INSERT INTO `wancll_order_goods` VALUES ('52', '50', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 10:29:50', '2018-09-01 10:31:01');
INSERT INTO `wancll_order_goods` VALUES ('53', '51', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '0', '3', '1', '1', '1', '2018-09-01 10:31:49', '2018-09-01 10:32:39');
INSERT INTO `wancll_order_goods` VALUES ('54', '52', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 10:33:04', '2018-09-01 13:51:41');
INSERT INTO `wancll_order_goods` VALUES ('55', '53', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 10:33:17', '2018-09-01 13:51:48');
INSERT INTO `wancll_order_goods` VALUES ('56', '54', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 10:34:30', '2018-09-01 13:51:32');
INSERT INTO `wancll_order_goods` VALUES ('57', '55', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 10:35:18', '2018-09-01 11:47:29');
INSERT INTO `wancll_order_goods` VALUES ('58', '56', '7', '17', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 11:02:50', '2018-09-01 13:41:50');
INSERT INTO `wancll_order_goods` VALUES ('59', '57', '7', '17', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 11:10:49', '2018-09-01 13:41:37');
INSERT INTO `wancll_order_goods` VALUES ('60', '58', '7', '17', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 11:31:44', '2018-09-01 13:41:44');
INSERT INTO `wancll_order_goods` VALUES ('61', '59', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 11:53:44', '2018-09-01 11:54:26');
INSERT INTO `wancll_order_goods` VALUES ('62', '60', '5', '17', '测试商品', '/public/upload/goods_images/20180824/217180e8dd8b17997351a6e19925a06f.png', '商品按重量计费，代付款发动机科技开发大飞机的开发的房价肯定发空间的付款链接的反馈及地方看见对方即可', '', '6115eedc743452f7cf13d8f0af09540f', '红色', '0.00', '5.00', '0.00', '200.00', '10', '0', '0', '0', '0', '1', '2018-09-01 13:45:14', '2018-09-01 13:45:14');
INSERT INTO `wancll_order_goods` VALUES ('63', '61', '2', '18', '轩斯顿 短袖T恤男士卫衣', '/public/upload/goods_images/20180811/68829501ee2de9a0a931fce515fd1c85.png', '2018夏季新款帅气韩版时尚休闲连帽半袖五分上衣服青年学生打底衫男装', '', 'ebf7862a9bb6255ddad83eaed2ca94a8', '灰色_L', '1.00', '10000.00', '1.00', '100000.00', '1', '0', '0', '0', '0', '1', '2018-09-01 13:49:08', '2018-09-01 13:49:08');
INSERT INTO `wancll_order_goods` VALUES ('64', '62', '2', '18', '轩斯顿 短袖T恤男士卫衣', '/public/upload/goods_images/20180811/68829501ee2de9a0a931fce515fd1c85.png', '2018夏季新款帅气韩版时尚休闲连帽半袖五分上衣服青年学生打底衫男装', '', '9a4f62329a021d6063e4389b4191549a', '白色_S', '1.00', '10000.00', '1.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-09-01 13:50:36', '2018-09-01 13:50:36');
INSERT INTO `wancll_order_goods` VALUES ('65', '63', '4', '18', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180825/457ecc49505d0c09b67ffcbdde368d19.png', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', 'bae05d8d2bda242ab4579038dde5914e', '黑色_50寸智能', '3299.00', '0.00', '3299.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-09-01 14:03:51', '2018-09-01 14:08:05');
INSERT INTO `wancll_order_goods` VALUES ('66', '64', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 15:49:46', '2018-09-01 16:12:15');
INSERT INTO `wancll_order_goods` VALUES ('67', '65', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '1000.00', '0.00', '1000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 15:51:09', '2018-09-01 16:12:11');
INSERT INTO `wancll_order_goods` VALUES ('68', '66', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '10000.00', '100.00', '1', '0', '3', '1', '1', '1', '2018-09-01 16:11:43', '2018-09-01 16:12:30');
INSERT INTO `wancll_order_goods` VALUES ('69', '67', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '10000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 16:44:19', '2018-09-01 16:50:28');
INSERT INTO `wancll_order_goods` VALUES ('70', '68', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '10000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 16:45:23', '2018-09-01 16:50:22');
INSERT INTO `wancll_order_goods` VALUES ('71', '69', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '10000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 16:50:36', '2018-09-01 16:52:13');
INSERT INTO `wancll_order_goods` VALUES ('72', '70', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '70000.00', '100.00', '7', '1', '0', '0', '0', '1', '2018-09-01 16:51:28', '2018-09-01 16:52:07');
INSERT INTO `wancll_order_goods` VALUES ('73', '71', '7', '17', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '10000.00', '100.00', '1', '0', '3', '1', '1', '1', '2018-09-01 16:55:09', '2018-09-01 16:55:51');
INSERT INTO `wancll_order_goods` VALUES ('74', '72', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '10000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 16:56:15', '2018-09-03 09:32:10');
INSERT INTO `wancll_order_goods` VALUES ('75', '73', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '10000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-01 16:57:11', '2018-09-03 09:32:06');
INSERT INTO `wancll_order_goods` VALUES ('76', '74', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '10000.00', '100.00', '1', '0', '3', '1', '1', '1', '2018-09-03 09:33:08', '2018-09-03 10:04:49');
INSERT INTO `wancll_order_goods` VALUES ('77', '75', '6', '18', '免邮费商品', '/public/upload/goods_images/20180824/7b831d739d415cb356774e03a9fa5471.png', '按件计费', '', '11d72bbb0a90eed68331863da7ff8344', '小于50cm', '100.00', '0.00', '100.00', '300.00', '1', '1', '0', '0', '0', '1', '2018-09-03 09:41:52', '2018-09-03 10:09:38');
INSERT INTO `wancll_order_goods` VALUES ('78', '76', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '10000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-03 10:07:01', '2018-09-03 10:08:07');
INSERT INTO `wancll_order_goods` VALUES ('79', '77', '7', '18', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '20000.00', '100.00', '2', '1', '0', '0', '0', '1', '2018-09-03 10:08:58', '2018-09-03 10:09:33');
INSERT INTO `wancll_order_goods` VALUES ('80', '78', '6', '17', '免邮费商品', '/public/upload/goods_images/20180824/7b831d739d415cb356774e03a9fa5471.png', '按件计费', '', '15af5a6922cb75a5c1e7dcb0fab322dd', '大于50cm', '100.00', '0.00', '90.00', '300.00', '1', '0', '0', '0', '0', '1', '2018-09-03 10:41:23', '2018-09-03 10:41:23');
INSERT INTO `wancll_order_goods` VALUES ('81', '79', '7', '17', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '7000.00', '100.00', '1', '0', '0', '0', '0', '1', '2018-09-03 11:02:30', '2018-09-03 11:02:30');
INSERT INTO `wancll_order_goods` VALUES ('82', '80', '7', '17', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '5000.00', '100.00', '1', '0', '0', '0', '0', '1', '2018-09-03 11:02:39', '2018-09-03 11:02:39');
INSERT INTO `wancll_order_goods` VALUES ('83', '81', '4', '17', '小米（MI）小米电视4A ', '/public/upload/goods_images/20180825/457ecc49505d0c09b67ffcbdde368d19.png', '小米（MI）小米电视4A 32英寸L32M5-AZ 智能高清网络液晶平板电视机彩电 40', '', 'c00e9dfb99b228b9b31e01a6ed0cd1cf', '黑色_45寸智能', '0.00', '99.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-09-03 11:24:46', '2018-09-03 11:24:46');
INSERT INTO `wancll_order_goods` VALUES ('84', '82', '7', '2', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '10000.00', '100.00', '1', '0', '0', '0', '0', '1', '2018-09-03 17:43:32', '2018-09-03 17:43:32');
INSERT INTO `wancll_order_goods` VALUES ('85', '83', '7', '17', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '0.00', '1000.00', '0.00', '100.00', '1', '0', '0', '0', '0', '1', '2018-09-03 17:55:33', '2018-09-03 17:55:33');
INSERT INTO `wancll_order_goods` VALUES ('86', '84', '7', '17', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '5000.00', '0.00', '5000.00', '100.00', '1', '0', '0', '0', '0', '1', '2018-09-03 17:55:42', '2018-09-03 17:55:42');
INSERT INTO `wancll_order_goods` VALUES ('87', '85', '7', '2', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '0.00', '1000.00', '0.00', '100.00', '1', '0', '0', '0', '0', '1', '2018-09-04 09:45:30', '2018-09-04 09:45:30');
INSERT INTO `wancll_order_goods` VALUES ('88', '86', '8', '2', '测试-A', '/public/upload/goods_images/20180904/70e8fbf45626e6fa0e645ae0a09cb909.png', '测试-A', '', '99634f20d3ba922db5ab94e8fa002994', '红色', '1000.00', '0.00', '1000.00', '10000.00', '1', '0', '0', '0', '0', '1', '2018-09-04 10:34:27', '2018-09-04 10:34:27');
INSERT INTO `wancll_order_goods` VALUES ('89', '87', '8', '2', '测试-A', '/public/upload/goods_images/20180904/70e8fbf45626e6fa0e645ae0a09cb909.png', '测试-A', '', '9d653df2bede1d864f703472454645f5', '绿色', '1000.00', '0.00', '1000.00', '10000.00', '1', '0', '0', '0', '0', '1', '2018-09-04 10:35:22', '2018-09-04 10:35:22');
INSERT INTO `wancll_order_goods` VALUES ('90', '88', '7', '14', '测试', '/public/upload/goods_images/20180901/fd1d8d390d8694dda2c237fce6289446.jpg', '测试', '', '0', '', '10000.00', '0.00', '10000.00', '100.00', '1', '1', '0', '0', '0', '1', '2018-09-04 10:41:47', '2018-09-04 10:42:56');
INSERT INTO `wancll_order_goods` VALUES ('91', '88', '8', '14', '测试-A', '/public/upload/goods_images/20180904/70e8fbf45626e6fa0e645ae0a09cb909.png', '测试-A', '', '9d653df2bede1d864f703472454645f5', '绿色', '1000.00', '0.00', '1000.00', '10000.00', '1', '1', '0', '0', '0', '1', '2018-09-04 10:41:47', '2018-09-04 10:42:48');

-- -----------------------------
-- Table structure for `wancll_orders`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_orders`;
CREATE TABLE `wancll_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '会员ID',
  `order_no` varchar(255) NOT NULL COMMENT '订单号',
  `type` tinyint(1) DEFAULT '1' COMMENT '订单类别：1正常订单2积分商城订单3会员拼团订单4系统拼团订单',
  `market_activity_type` varchar(20) DEFAULT '0' COMMENT '营销活动类别：full || discount || coupon',
  `market_activity_id` bigint(20) DEFAULT '0' COMMENT '营销活动ID',
  `market_reduce_money` decimal(10,2) DEFAULT '0.00' COMMENT '营销活动减少的金额',
  `goods_money` decimal(10,2) DEFAULT NULL COMMENT '商品的总价',
  `freight_money` decimal(10,2) DEFAULT NULL COMMENT '运费的总价',
  `total_money` decimal(10,2) DEFAULT NULL COMMENT '总金额',
  `total_score` decimal(10,2) DEFAULT '0.00' COMMENT '积分值',
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
  `is_group_buy_first` tinyint(4) DEFAULT '0' COMMENT '是否是拼团的发起人：0否1是',
  `group_buy_order_pid` bigint(20) DEFAULT '0' COMMENT '拼团的父订单id',
  `group_buy_time_length` decimal(10,2) DEFAULT NULL COMMENT '会员拼团的拼团时长（单位：小时）',
  `group_buy_end_timestamp` int(11) DEFAULT NULL COMMENT '系统拼单到期时间',
  `group_buy_person_num` int(11) DEFAULT NULL COMMENT '拼团人数',
  `group_buy_goods_id` bigint(20) DEFAULT NULL COMMENT '拼团的商品ID',
  `group_buy_status` tinyint(1) DEFAULT '1' COMMENT '团购状态：1等待拼团2限时拼团失败3拼团成功4拼团失败自动退款进入排队5退款成功',
  `status` tinyint(1) DEFAULT '1' COMMENT '订单状态：1待付款2已付款待发货3已发货待收货4已确认收货9已取消',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_orders`
-- -----------------------------
INSERT INTO `wancll_orders` VALUES ('1', '2', 'N2018073115035239276', '3', '0', '0', '0.00', '15.00', '0.00', '15.00', '0.00', '15580841403', '测试', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '', '1', '3', '2018-07-31 15:03:59', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '0', '0.01', '1533020675', '2', '2', '5', '2', '1', '2018-07-31 15:03:52', '2018-07-31 18:20:01');
INSERT INTO `wancll_orders` VALUES ('2', '2', 'N2018073118185685994', '3', '0', '0', '0.00', '10.00', '0.00', '10.00', '0.00', '15580841403', '测试', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '', '1', '3', '2018-07-31 18:19:03', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '0', '2.00', '1533039543', '2', '3', '5', '2', '1', '2018-07-31 18:18:56', '2018-09-03 11:07:48');
INSERT INTO `wancll_orders` VALUES ('3', '5', 'N2018080110150312496', '3', '0', '0', '0.00', '15.00', '0.00', '15.00', '0.00', '15636925814', '韩梅梅', '湖南省', '430000', '长沙市', '430100', '长沙县', '430121', '开源鑫贸大楼906', '', '1', '3', '2018-08-01 10:15:12', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '0', '0.01', '1533089748', '2', '2', '5', '2', '1', '2018-08-01 10:15:03', '2018-09-03 11:07:46');
INSERT INTO `wancll_orders` VALUES ('4', '5', 'N2018080116091321457', '2', '0', '0', '0.00', '10.00', '0.00', '10.00', '999.00', '15636925814', '韩梅梅', '湖南省', '430000', '长沙市', '430100', '长沙县', '430121', '开源鑫贸大楼906', '', '1', '3', '2018-08-04 09:47:41', '0', '0', '', '2018-08-04 09:48:18', '1', 'shunfeng', '544531376585', 'SF', '1', '2018-08-04 09:48:49', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-01 16:09:13', '2018-08-04 09:48:49');
INSERT INTO `wancll_orders` VALUES ('5', '5', 'N2018080417384543005', '1', '0', '0', '0.00', '3299.00', '0.00', '3299.00', '0.00', '15636925814', '韩梅梅', '湖南省', '430000', '长沙市', '430100', '长沙县', '430121', '开源鑫贸大楼906', '', '1', '3', '2018-08-04 17:38:52', '0', '0', '', '2018-08-04 17:39:07', '1', 'kuaijiesudi', '', 'FAST', '0', '2018-08-04 17:40:29', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-04 17:38:45', '2018-08-04 17:40:29');
INSERT INTO `wancll_orders` VALUES ('6', '2', 'N2018080716172856257', '1', '0', '0', '0.00', '100.00', '0.00', '100.00', '0.00', '15580841403', '测试', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '', '1', '3', '2018-08-31 15:39:55', '0', '0', '', '2018-08-31 16:35:03', '1', 'shunfeng', '249091040938', 'SF', '1', '', '', '', '0', '1', '1', '1', '100.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-07 16:17:28', '2018-08-31 16:35:35');
INSERT INTO `wancll_orders` VALUES ('7', '7', 'N2018081009130890529', '1', '0', '0', '0.00', '100.00', '0.00', '100.00', '0.00', '18111111111', '酒后', '天津市', '120000', '市辖区', '120100', '河东区', '120102', '。。。', '', '1', '3', '2018-08-10 09:13:14', '0', '0', '', '2018-08-19 21:23:53', '0', 'ems', '1231', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '3', '1', '2018-08-10 09:13:08', '2018-08-19 21:23:53');
INSERT INTO `wancll_orders` VALUES ('8', '7', 'N2018081009135384371', '1', '0', '0', '0.00', '100.00', '0.00', '100.00', '0.00', '18111111111', '酒后', '天津市', '120000', '市辖区', '120100', '河东区', '120102', '。。。', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-08-10 09:13:53', '2018-08-10 09:13:53');
INSERT INTO `wancll_orders` VALUES ('9', '2', 'N2018081414345837816', '1', '0', '0', '0.00', '3299.00', '0.00', '3299.00', '0.00', '15580841403', '测试', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '', '1', '3', '2018-08-31 15:39:45', '0', '0', '', '2018-08-31 16:35:28', '1', 'shunfeng', '249091057226', 'SF', '1', '2018-08-31 16:36:04', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-14 14:34:58', '2018-08-31 17:07:13');
INSERT INTO `wancll_orders` VALUES ('10', '12', 'N2018082411314288617', '1', '0', '0', '0.00', '100.00', '30.00', '130.00', '0.00', '15071357538', '郭', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '245555', '', '1', '3', '2018-08-24 11:33:51', '0', '0', '', '2018-08-24 11:36:07', '1', 'shunfeng', '544870282308', 'SF', '1', '2018-08-24 11:40:50', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-24 11:31:42', '2018-08-24 11:40:50');
INSERT INTO `wancll_orders` VALUES ('11', '12', 'N2018082411475046875', '1', '0', '0', '0.00', '100.00', '30.00', '130.00', '0.00', '15071357538', '郭', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '245555', '', '1', '3', '2018-08-24 11:48:07', '0', '0', '', '2018-08-31 14:28:51', '1', 'kuaijiesudi', '', 'FAST', '0', '2018-08-31 15:19:17', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-24 11:47:50', '2018-08-31 15:19:17');
INSERT INTO `wancll_orders` VALUES ('12', '12', 'N2018082411482666846', '1', '0', '0', '0.00', '100.00', '0.00', '100.00', '0.00', '15071357538', '郭', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '245555', '', '1', '3', '2018-08-24 11:48:34', '0', '1', '2018-08-24 11:52:46', '2018-08-31 14:23:08', '1', 'kuaijiesudi', '', 'FAST', '0', '', '', '', '0', '1', '1', '1', '100.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-24 11:48:26', '2018-08-31 15:41:28');
INSERT INTO `wancll_orders` VALUES ('13', '12', 'N2018082411485475541', '1', '0', '0', '0.00', '100.00', '0.00', '100.00', '0.00', '15071357538', '郭', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '245555', '', '1', '3', '2018-08-24 11:49:03', '0', '0', '', '2018-08-24 11:52:12', '0', 'ems', '3372096122395', '', '0', '', '', '', '0', '1', '1', '1', '100.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-24 11:48:54', '2018-08-24 12:04:10');
INSERT INTO `wancll_orders` VALUES ('14', '12', 'N2018082411494299937', '1', '0', '0', '0.00', '100.00', '0.00', '100.00', '0.00', '15071357538', '郭', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '245555', '', '1', '3', '2018-08-24 11:49:50', '0', '0', '', '2018-08-24 11:50:56', '0', 'yuantong', '801122888379157767', '', '0', '2018-08-24 12:04:47', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-24 11:49:42', '2018-08-24 12:42:02');
INSERT INTO `wancll_orders` VALUES ('15', '12', 'N2018082411560301646', '1', '0', '0', '0.00', '100.00', '30.00', '130.00', '0.00', '15071357538', '郭', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '245555', '', '1', '3', '2018-08-24 11:56:14', '0', '0', '', '2018-08-27 18:51:52', '1', 'zhaijisong', '', 'ZJS', '0', '', '', '', '0', '1', '0', '1', '0.00', '0', '0', '', '', '', '', '1', '3', '1', '2018-08-24 11:56:03', '2018-08-27 18:51:52');
INSERT INTO `wancll_orders` VALUES ('16', '12', 'N2018082413372103600', '1', '0', '0', '0.00', '150.00', '30.00', '180.00', '0.00', '15071357538', '郭', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '245555', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-08-24 13:37:21', '2018-08-24 13:37:21');
INSERT INTO `wancll_orders` VALUES ('17', '12', 'N2018082413383254149', '1', '0', '0', '0.00', '100.00', '30.00', '130.00', '0.00', '15071357538', '郭', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '245555', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-08-24 13:38:32', '2018-08-24 13:38:32');
INSERT INTO `wancll_orders` VALUES ('18', '12', 'N2018082413383397566', '1', '0', '0', '0.00', '100.00', '30.00', '130.00', '0.00', '15071357538', '郭', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '245555', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-08-24 13:38:33', '2018-08-24 13:38:33');
INSERT INTO `wancll_orders` VALUES ('19', '12', 'N2018082413383396941', '1', '0', '0', '0.00', '100.00', '30.00', '130.00', '0.00', '15071357538', '郭', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '245555', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-08-24 13:38:33', '2018-08-24 13:38:33');
INSERT INTO `wancll_orders` VALUES ('20', '12', 'N2018082413384250201', '1', '0', '0', '0.00', '100.00', '30.00', '130.00', '0.00', '15071357538', '郭', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '245555', '', '1', '3', '2018-08-24 13:38:55', '0', '1', '2018-08-24 13:39:00', '2018-08-27 18:50:36', '1', 'zhaijisong', '', 'ZJS', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '3', '1', '2018-08-24 13:38:42', '2018-08-27 18:50:36');
INSERT INTO `wancll_orders` VALUES ('21', '2', 'N2018083114211246626', '1', '0', '0', '0.00', '100.00', '10.00', '110.00', '0.00', '15580841403', '测试', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '', '1', '3', '2018-08-31 14:21:18', '0', '0', '', '2018-08-31 14:21:30', '1', 'shunfeng', '249086949060', 'SF', '1', '2018-08-31 14:21:47', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 14:21:12', '2018-08-31 17:07:43');
INSERT INTO `wancll_orders` VALUES ('22', '2', 'N2018083114221350514', '1', '0', '0', '0.00', '100.00', '10.00', '110.00', '0.00', '15580841403', '测试', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '', '1', '3', '2018-08-31 14:22:18', '0', '0', '', '2018-08-31 14:22:28', '1', 'shunfeng', '249086970084', 'SF', '1', '2018-08-31 15:39:35', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 14:22:13', '2018-08-31 16:18:38');
INSERT INTO `wancll_orders` VALUES ('23', '2', 'N2018083114475592342', '1', '0', '0', '0.00', '100.00', '10.00', '110.00', '0.00', '15580841403', '测试', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '', '1', '3', '2018-08-31 14:48:02', '0', '0', '', '2018-08-31 14:53:24', '1', 'kuaijiesudi', '', 'FAST', '0', '2018-08-31 15:39:32', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 14:47:55', '2018-08-31 16:18:46');
INSERT INTO `wancll_orders` VALUES ('24', '2', 'N2018083115073402711', '1', '0', '0', '0.00', '100.00', '30.00', '130.00', '0.00', '15580841403', '测试', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '', '1', '3', '2018-08-31 15:07:39', '0', '0', '', '2018-08-31 15:07:58', '1', 'kuaijiesudi', '', 'FAST', '0', '2018-08-31 15:39:28', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 15:07:34', '2018-08-31 17:07:27');
INSERT INTO `wancll_orders` VALUES ('25', '2', 'N2018083115111776250', '1', '0', '0', '0.00', '100.00', '30.00', '130.00', '0.00', '15580841403', '测试', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '', '1', '3', '2018-08-31 15:12:54', '0', '0', '', '2018-08-31 15:13:04', '1', 'kuaijiesudi', '', 'FAST', '0', '2018-08-31 15:39:25', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 15:11:17', '2018-08-31 17:07:34');
INSERT INTO `wancll_orders` VALUES ('26', '2', 'N2018083115112234969', '1', '0', '0', '0.00', '100.00', '30.00', '130.00', '0.00', '15580841403', '测试', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '', '1', '3', '2018-08-31 15:11:27', '0', '0', '', '2018-08-31 15:11:41', '1', 'kuaijiesudi', '', 'FAST', '0', '2018-08-31 15:39:22', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 15:11:22', '2018-08-31 16:18:53');
INSERT INTO `wancll_orders` VALUES ('27', '2', 'N2018083115155177983', '1', '0', '0', '0.00', '100.00', '10.00', '110.00', '0.00', '15580841403', '测试', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '', '1', '3', '2018-08-31 15:15:56', '0', '0', '', '2018-08-31 15:16:09', '1', 'shunfeng', '249088510271', 'SF', '1', '2018-08-31 15:39:17', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 15:15:51', '2018-08-31 17:07:38');
INSERT INTO `wancll_orders` VALUES ('28', '12', 'N2018083115185842362', '1', '0', '0', '0.00', '200.00', '0.00', '200.00', '0.00', '15071357538', '郭', '天津市', '120000', '市辖区', '120100', '河西区', '120103', '245555', '', '1', '3', '2018-08-31 15:19:08', '0', '1', '2018-08-31 15:19:25', '2018-08-31 17:04:41', '1', 'shunfeng', '249092002070', 'SF', '1', '', '', '', '0', '1', '1', '1', '200.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 15:18:58', '2018-09-01 16:12:36');
INSERT INTO `wancll_orders` VALUES ('29', '2', 'N2018083115434340263', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '5.00', '15580841403', '测试', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '', '1', '3', '2018-08-31 15:43:43', '0', '0', '', '2018-09-01 13:47:49', '0', 'ems', '1', '', '0', '2018-09-01 13:47:53', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 15:43:43', '2018-09-01 13:47:53');
INSERT INTO `wancll_orders` VALUES ('30', '2', 'N2018083115440588797', '3', '0', '0', '0.00', '2000.00', '0.00', '2000.00', '0.00', '15580841403', '测试', '河北省', '130000', '秦皇岛市', '130300', '市辖区', '130301', '测试', '1', '1', '3', '2018-08-31 15:44:14', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '0', '10.00', '1535737454', '2', '4', '5', '2', '1', '2018-08-31 15:44:05', '2018-09-03 11:07:43');
INSERT INTO `wancll_orders` VALUES ('31', '2', 'N2018083116341843349', '1', '0', '0', '0.00', '16795.00', '30.00', '16825.00', '0.00', '18390911268', '哈哈', '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '鄂托克前旗', '150623', '含苞待放', '', '1', '3', '2018-08-31 16:34:29', '0', '0', '', '2018-08-31 16:35:17', '1', 'shunfeng', '249091049780', 'SF', '1', '2018-08-31 16:36:08', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 16:34:18', '2018-08-31 17:07:09');
INSERT INTO `wancll_orders` VALUES ('32', '2', 'N2018083116373971696', '1', '0', '0', '0.00', '3299.00', '10.00', '3309.00', '0.00', '18390911268', '哈哈', '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '鄂托克前旗', '150623', '含苞待放', '', '1', '3', '2018-08-31 16:37:46', '0', '0', '', '2018-08-31 16:38:01', '0', 'huitongkuaidi', '1', '', '0', '2018-08-31 16:38:14', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 16:37:39', '2018-08-31 16:38:19');
INSERT INTO `wancll_orders` VALUES ('33', '17', 'N2018083116425380197', '1', '0', '0', '0.00', '100.00', '0.00', '100.00', '0.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-08-31 16:42:58', '0', '0', '', '2018-08-31 16:43:14', '1', 'shunfeng', '249091307428', 'SF', '1', '2018-08-31 16:43:22', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 16:42:53', '2018-08-31 16:43:27');
INSERT INTO `wancll_orders` VALUES ('34', '17', 'N2018083116445956017', '1', '0', '0', '0.00', '100.00', '0.00', '100.00', '0.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-08-31 16:45:03', '0', '0', '', '2018-08-31 16:45:20', '0', 'huitongkuaidi', '1', '', '0', '2018-08-31 16:45:24', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 16:44:59', '2018-08-31 16:45:34');
INSERT INTO `wancll_orders` VALUES ('35', '17', 'N2018083116461265414', '1', '0', '0', '0.00', '100.00', '0.00', '100.00', '0.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-08-31 16:47:28', '0', '0', '', '2018-08-31 16:47:44', '0', 'huitongkuaidi', '1', '', '0', '2018-08-31 16:47:47', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 16:46:12', '2018-08-31 16:47:57');
INSERT INTO `wancll_orders` VALUES ('36', '17', 'N2018083116461894679', '1', '0', '0', '0.00', '100.00', '0.00', '100.00', '0.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-08-31 16:46:33', '0', '0', '', '2018-08-31 16:46:48', '0', 'shentong', '1', '', '0', '2018-08-31 16:46:51', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 16:46:18', '2018-08-31 16:46:57');
INSERT INTO `wancll_orders` VALUES ('37', '18', 'N2018083117035202763', '1', '0', '0', '0.00', '3299.00', '10.00', '3309.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-08-31 17:03:58', '0', '0', '', '2018-08-31 17:04:31', '0', 'huitongkuaidi', '1', '', '0', '', '', '', '0', '1', '1', '1', '3309.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 17:03:52', '2018-08-31 17:05:52');
INSERT INTO `wancll_orders` VALUES ('38', '2', 'N2018083117075484078', '1', '0', '0', '0.00', '3299.00', '10.00', '3309.00', '0.00', '18390911268', '哈哈', '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '鄂托克前旗', '150623', '含苞待放', '', '1', '3', '2018-08-31 17:07:58', '0', '0', '', '2018-08-31 17:08:14', '0', 'huitongkuaidi', '1', '', '0', '', '', '', '0', '1', '1', '1', '3309.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 17:07:54', '2018-08-31 17:10:16');
INSERT INTO `wancll_orders` VALUES ('39', '18', 'N2018083117094103957', '1', '0', '0', '0.00', '3299.00', '10.00', '3309.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-08-31 17:09:45', '0', '0', '', '2018-08-31 17:10:02', '0', 'huitongkuaidi', '1', '', '0', '2018-08-31 17:10:06', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 17:09:41', '2018-08-31 17:45:49');
INSERT INTO `wancll_orders` VALUES ('40', '17', 'N2018083117473002159', '1', '0', '0', '0.00', '3299.00', '10.00', '3309.00', '0.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-08-31 17:47:34', '0', '0', '', '2018-08-31 17:47:45', '0', 'huitongkuaidi', '1', '', '0', '', '', '', '0', '1', '1', '1', '3309.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 17:47:30', '2018-08-31 17:48:15');
INSERT INTO `wancll_orders` VALUES ('41', '18', 'N2018083117530212617', '1', '0', '0', '0.00', '3299.00', '10.00', '3309.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-08-31 17:53:06', '0', '0', '', '2018-08-31 17:53:20', '1', 'shunfeng', '249093267377', 'SF', '1', '2018-08-31 17:53:24', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 17:53:02', '2018-08-31 17:55:29');
INSERT INTO `wancll_orders` VALUES ('42', '18', 'N2018083117554371079', '1', '0', '0', '0.00', '3299.00', '10.00', '3309.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 09:24:28', '0', '0', '', '2018-09-01 09:24:41', '0', 'ems', '1', '', '0', '2018-09-01 09:25:03', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 17:55:43', '2018-09-01 09:31:38');
INSERT INTO `wancll_orders` VALUES ('43', '18', 'N2018083117555081001', '1', '0', '0', '0.00', '3299.00', '10.00', '3309.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-08-31 17:55:56', '0', '0', '', '2018-08-31 17:56:17', '0', 'tiantian', '1', '', '0', '2018-08-31 17:56:26', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-08-31 17:55:50', '2018-08-31 17:56:30');
INSERT INTO `wancll_orders` VALUES ('44', '18', 'N2018090109230438895', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 09:23:09', '0', '0', '', '2018-09-01 09:24:51', '0', 'shunfeng', '1', '', '0', '2018-09-01 09:25:00', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 09:23:04', '2018-09-01 09:31:42');
INSERT INTO `wancll_orders` VALUES ('45', '18', 'N2018090109374038220', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 09:37:45', '0', '0', '', '2018-09-01 09:37:58', '0', 'ems', '1', '', '0', '2018-09-01 09:38:02', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 09:37:40', '2018-09-01 09:38:11');
INSERT INTO `wancll_orders` VALUES ('46', '18', 'N2018090109440255270', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 09:44:06', '0', '0', '', '2018-09-01 09:44:17', '0', 'shunfeng', '1', '', '0', '2018-09-01 09:44:26', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 09:44:02', '2018-09-01 09:44:29');
INSERT INTO `wancll_orders` VALUES ('47', '18', 'N2018090109510670521', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 09:51:11', '0', '0', '', '2018-09-01 09:51:22', '0', 'shunfeng', '1', '', '0', '2018-09-01 09:51:28', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 09:51:06', '2018-09-01 10:24:17');
INSERT INTO `wancll_orders` VALUES ('48', '18', 'N2018090110263007916', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 10:26:36', '0', '0', '', '2018-09-01 10:26:48', '0', 'shunfeng', '2', '', '0', '2018-09-01 10:26:54', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 10:26:30', '2018-09-01 10:31:16');
INSERT INTO `wancll_orders` VALUES ('49', '18', 'N2018090110282774823', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 10:28:36', '0', '0', '', '2018-09-01 10:28:51', '0', 'tiantian', '1', '', '0', '2018-09-01 10:28:55', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 10:28:27', '2018-09-01 10:31:07');
INSERT INTO `wancll_orders` VALUES ('50', '18', 'N2018090110295014084', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 10:29:57', '0', '0', '', '2018-09-01 10:30:10', '0', 'tiantian', '2', '', '0', '2018-09-01 10:30:16', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 10:29:50', '2018-09-01 10:31:01');
INSERT INTO `wancll_orders` VALUES ('51', '18', 'N2018090110314989900', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 10:31:57', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '1', '1', '1', '1000.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 10:31:49', '2018-09-01 10:32:35');
INSERT INTO `wancll_orders` VALUES ('52', '18', 'N2018090110330435374', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 10:33:09', '0', '0', '', '2018-09-01 10:34:06', '0', 'ems', '1', '', '0', '2018-09-01 10:34:09', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 10:33:04', '2018-09-01 13:51:41');
INSERT INTO `wancll_orders` VALUES ('53', '18', 'N2018090110331701789', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 10:33:21', '0', '0', '', '2018-09-01 10:33:50', '0', 'ems', '1', '', '0', '2018-09-01 10:33:54', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 10:33:17', '2018-09-01 13:51:48');
INSERT INTO `wancll_orders` VALUES ('54', '18', 'N2018090110342996354', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 10:34:35', '0', '0', '', '2018-09-01 10:34:47', '0', 'shentong', '2', '', '0', '2018-09-01 10:34:55', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 10:34:29', '2018-09-01 13:51:33');
INSERT INTO `wancll_orders` VALUES ('55', '18', 'N2018090110351827783', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 10:35:22', '0', '0', '', '2018-09-01 10:35:58', '0', 'ems', '1', '', '0', '2018-09-01 10:36:05', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 10:35:18', '2018-09-01 11:47:29');
INSERT INTO `wancll_orders` VALUES ('56', '17', 'N2018090111025069702', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-09-01 11:02:53', '0', '0', '', '2018-09-01 11:03:05', '0', 'yunda', '1', '', '0', '2018-09-01 11:03:10', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 11:02:50', '2018-09-01 13:41:50');
INSERT INTO `wancll_orders` VALUES ('57', '17', 'N2018090111104988421', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-09-01 11:10:54', '0', '0', '', '2018-09-01 11:31:16', '1', 'shunfeng', '249099909907', 'SF', '1', '2018-09-01 12:01:46', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 11:10:49', '2018-09-01 13:41:37');
INSERT INTO `wancll_orders` VALUES ('58', '17', 'N2018090111314433432', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-09-01 11:31:48', '0', '0', '', '2018-09-01 11:32:02', '1', 'zhaijisong', '', 'ZJS', '0', '2018-09-01 11:32:18', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 11:31:44', '2018-09-01 13:41:44');
INSERT INTO `wancll_orders` VALUES ('59', '18', 'N2018090111534433336', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 11:53:50', '0', '0', '', '2018-09-01 11:54:06', '1', 'zhaijisong', 'A001004043600', 'ZJS', '1', '2018-09-01 11:54:18', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 11:53:44', '2018-09-01 11:54:26');
INSERT INTO `wancll_orders` VALUES ('60', '17', 'N2018090113451403951', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '50.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-09-01 13:45:14', '0', '0', '', '2018-09-01 13:45:37', '1', 'zhaijisong', 'A001004043611', 'ZJS', '1', '2018-09-01 13:47:40', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 13:45:14', '2018-09-01 13:47:40');
INSERT INTO `wancll_orders` VALUES ('61', '18', 'N2018090113490813780', '2', '0', '0', '0.00', '1.00', '0.00', '1.00', '10000.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 13:49:15', '0', '1', '2018-09-01 13:49:19', '2018-09-01 13:49:33', '1', 'kuaijiesudi', '', 'FAST', '0', '2018-09-01 13:50:04', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 13:49:08', '2018-09-01 13:50:04');
INSERT INTO `wancll_orders` VALUES ('62', '18', 'N2018090113503598026', '2', '0', '0', '0.00', '1.00', '0.00', '1.00', '10000.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 13:50:41', '0', '0', '', '2018-09-01 13:50:56', '1', 'zhaijisong', 'A001004043622', 'ZJS', '1', '2018-09-01 13:51:25', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 13:50:35', '2018-09-01 13:51:25');
INSERT INTO `wancll_orders` VALUES ('63', '18', 'N2018090114035030516', '1', '0', '0', '0.00', '3299.00', '10.00', '3309.00', '0.00', '11111111111', '1', '江西省', '360000', '上饶市', '361100', '婺源县', '361130', '1', '', '1', '3', '2018-09-01 14:03:56', '0', '1', '2018-09-01 14:04:00', '2018-09-01 14:04:39', '1', 'kuaijiesudi', '', 'FAST', '0', '2018-09-01 14:08:00', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 14:03:50', '2018-09-01 14:08:05');
INSERT INTO `wancll_orders` VALUES ('64', '18', 'N2018090115494608694', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-09-01 15:49:50', '0', '0', '', '2018-09-01 15:50:15', '1', 'shunfeng', '249104011208', 'SF', '1', '2018-09-01 15:51:02', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 15:49:46', '2018-09-01 16:12:15');
INSERT INTO `wancll_orders` VALUES ('65', '18', 'N2018090115510971701', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '11111111111', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-09-01 15:51:13', '0', '0', '', '2018-09-01 15:52:09', '1', 'shunfeng', '249104046119', 'SF', '1', '2018-09-01 16:12:03', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 15:51:09', '2018-09-01 16:12:11');
INSERT INTO `wancll_orders` VALUES ('66', '18', 'N2018090116114319248', '1', '0', '0', '0.00', '10000.00', '0.00', '10000.00', '0.00', '11111111111', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-09-01 16:11:47', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '1', '1', '1', '10000.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 16:11:43', '2018-09-01 16:12:27');
INSERT INTO `wancll_orders` VALUES ('67', '18', 'N2018090116441987108', '1', '0', '0', '0.00', '10000.00', '0.00', '10000.00', '0.00', '11111111111', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-09-01 16:44:23', '0', '0', '', '2018-09-01 16:45:07', '0', 'ems', '1', '', '0', '2018-09-01 16:45:10', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 16:44:19', '2018-09-01 16:50:28');
INSERT INTO `wancll_orders` VALUES ('68', '18', 'N2018090116452383075', '1', '0', '0', '0.00', '10000.00', '0.00', '10000.00', '0.00', '11111111111', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-09-01 16:45:28', '0', '0', '', '2018-09-01 16:46:39', '0', 'ems', '1', '', '0', '2018-09-01 16:47:04', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 16:45:23', '2018-09-01 16:50:23');
INSERT INTO `wancll_orders` VALUES ('69', '18', 'N2018090116503693101', '1', '0', '0', '0.00', '10000.00', '0.00', '10000.00', '0.00', '11111111111', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-09-01 16:50:40', '0', '0', '', '2018-09-01 16:50:58', '0', 'ems', '1', '', '0', '2018-09-01 16:51:01', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 16:50:36', '2018-09-01 16:52:13');
INSERT INTO `wancll_orders` VALUES ('70', '18', 'N2018090116512897499', '1', '0', '0', '0.00', '70000.00', '0.00', '70000.00', '0.00', '11111111111', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-09-01 16:51:32', '0', '0', '', '2018-09-01 16:51:48', '0', 'ems', '1', '', '0', '2018-09-01 16:51:54', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 16:51:28', '2018-09-01 16:52:07');
INSERT INTO `wancll_orders` VALUES ('71', '17', 'N2018090116550979749', '1', '0', '0', '0.00', '10000.00', '0.00', '10000.00', '0.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-09-01 16:55:14', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '1', '1', '1', '10000.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 16:55:09', '2018-09-01 16:55:48');
INSERT INTO `wancll_orders` VALUES ('72', '18', 'N2018090116561570204', '1', '0', '0', '0.00', '10000.00', '0.00', '10000.00', '0.00', '11111111111', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-09-01 16:56:19', '0', '0', '', '2018-09-01 16:56:34', '0', 'huitongkuaidi', '1', '', '0', '2018-09-01 16:56:37', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 16:56:15', '2018-09-03 09:32:10');
INSERT INTO `wancll_orders` VALUES ('73', '18', 'N2018090116571106669', '1', '0', '0', '0.00', '10000.00', '0.00', '10000.00', '0.00', '11111111111', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-09-01 16:57:15', '0', '0', '', '2018-09-01 16:57:31', '0', 'huitongkuaidi', '123456', '', '0', '2018-09-01 16:57:38', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-01 16:57:11', '2018-09-03 09:32:06');
INSERT INTO `wancll_orders` VALUES ('74', '18', 'N2018090309330813479', '1', '0', '0', '0.00', '10000.00', '0.00', '10000.00', '0.00', '11111111111', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-09-03 09:33:12', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '1', '1', '1', '10000.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-03 09:33:08', '2018-09-03 10:04:47');
INSERT INTO `wancll_orders` VALUES ('75', '18', 'N2018090309415294600', '1', '0', '0', '0.00', '100.00', '0.00', '100.00', '0.00', '11111111111', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-09-03 09:41:57', '0', '0', '', '2018-09-03 09:42:16', '1', 'zhaijisong', 'A001004043681', 'ZJS', '1', '2018-09-03 09:42:21', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-03 09:41:52', '2018-09-03 10:09:38');
INSERT INTO `wancll_orders` VALUES ('76', '18', 'N2018090310070154781', '1', '0', '0', '0.00', '10000.00', '0.00', '10000.00', '0.00', '11111111111', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-09-03 10:07:06', '0', '0', '', '2018-09-03 10:07:31', '0', 'huitongkuaidi', '1', '', '0', '2018-09-03 10:07:36', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-03 10:07:01', '2018-09-03 10:08:07');
INSERT INTO `wancll_orders` VALUES ('77', '18', 'N2018090310085838571', '1', '0', '0', '0.00', '20000.00', '0.00', '20000.00', '0.00', '11111111111', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '1', '3', '2018-09-03 10:09:03', '0', '0', '', '2018-09-03 10:09:14', '0', 'ems', '1', '', '0', '2018-09-03 10:09:29', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-03 10:08:58', '2018-09-03 10:09:33');
INSERT INTO `wancll_orders` VALUES ('78', '17', 'N2018090310412338285', '1', 'full', '2', '10.00', '100.00', '0.00', '90.00', '0.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-09-03 10:41:23', '2018-09-03 10:41:23');
INSERT INTO `wancll_orders` VALUES ('79', '17', 'N2018090311023087502', '1', 'coupon', '2', '3000.00', '10000.00', '0.00', '7000.00', '0.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-09-03 11:02:30', '2018-09-03 11:02:30');
INSERT INTO `wancll_orders` VALUES ('80', '17', 'N2018090311023967341', '1', 'coupon', '1', '5000.00', '10000.00', '0.00', '5000.00', '0.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-09-03 11:02:48', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-09-03 11:02:39', '2018-09-03 11:02:48');
INSERT INTO `wancll_orders` VALUES ('81', '17', 'N2018090311244650367', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '99.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-09-03 11:24:46', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-09-03 11:24:46', '2018-09-03 11:24:46');
INSERT INTO `wancll_orders` VALUES ('82', '2', 'N2018090317433239358', '1', '0', '0', '0.00', '10000.00', '0.00', '10000.00', '0.00', '13874930708', '1', '浙江省', '330000', '丽水市', '331100', '龙泉市', '331181', '1', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-09-03 17:43:32', '2018-09-03 17:43:32');
INSERT INTO `wancll_orders` VALUES ('83', '17', 'N2018090317553331022', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '1000.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-09-03 17:55:33', '0', '0', '', '2018-09-04 10:31:04', '1', 'zhaijisong', 'A001004043762', 'ZJS', '1', '2018-09-04 10:32:04', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-03 17:55:33', '2018-09-04 10:32:04');
INSERT INTO `wancll_orders` VALUES ('84', '17', 'N2018090317554293651', '3', '0', '0', '0.00', '5000.00', '0.00', '5000.00', '0.00', '13800000000', '1', '安徽省', '340000', '六安市', '341500', '金寨县', '341524', '1', '', '1', '3', '2018-09-03 17:55:47', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '0', '24.00', '1536054947', '2', '7', '1', '2', '1', '2018-09-03 17:55:42', '2018-09-03 17:55:47');
INSERT INTO `wancll_orders` VALUES ('85', '2', 'N2018090409453010672', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '1000.00', '13874930708', '1', '浙江省', '330000', '丽水市', '331100', '龙泉市', '331181', '1', '', '1', '3', '2018-09-04 09:45:30', '0', '0', '', '2018-09-04 10:30:49', '1', 'kuaijiesudi', '', 'FAST', '0', '2018-09-04 10:30:57', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-04 09:45:30', '2018-09-04 10:30:57');
INSERT INTO `wancll_orders` VALUES ('86', '2', 'N2018090410342720360', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '13874930708', '1', '浙江省', '330000', '丽水市', '331100', '龙泉市', '331181', '1', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-09-04 10:34:27', '2018-09-04 10:34:27');
INSERT INTO `wancll_orders` VALUES ('87', '2', 'N2018090410352250788', '1', '0', '0', '0.00', '1000.00', '0.00', '1000.00', '0.00', '13874930000', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '1', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-09-04 10:35:22', '2018-09-04 10:35:22');
INSERT INTO `wancll_orders` VALUES ('88', '14', 'N2018090410414705109', '1', '0', '0', '0.00', '11000.00', '0.00', '11000.00', '0.00', '12345678901', '12', '上海市', '310000', '市辖区', '310100', '金山区', '310116', '1', '', '1', '3', '2018-09-04 10:42:04', '0', '0', '', '2018-09-04 10:42:17', '1', 'shunfeng', '249139827394', 'SF', '1', '2018-09-04 10:42:39', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-09-04 10:41:47', '2018-09-04 10:42:56');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_qiniu_files`
-- -----------------------------
INSERT INTO `wancll_qiniu_files` VALUES ('1', '新建 Microsoft Word 文档', 'zip', '192.00B', '5b796defde929.zip', 'http://oyfr0gkd3.bkt.clouddn.com/5b796defde929.zip', '', '0', '2018-08-19 21:17:36', '2018-08-19 21:17:40');
INSERT INTO `wancll_qiniu_files` VALUES ('2', '1', 'png', '113.65KB', '5b7f6ea051d99.png', 'http://oyfr0gkd3.bkt.clouddn.com/5b7f6ea051d99.png', '', '0', '2018-08-24 10:34:08', '2018-08-24 10:35:09');
INSERT INTO `wancll_qiniu_files` VALUES ('3', '快翼取系统测试报告', 'docx', '279.39KB', '5b7f6ea5d5332.docx', 'http://oyfr0gkd3.bkt.clouddn.com/5b7f6ea5d5332.docx', '', '0', '2018-08-24 10:34:14', '2018-08-24 10:35:27');
INSERT INTO `wancll_qiniu_files` VALUES ('4', 'lamp', 'txt', '7.61KB', '5b7f6ee48b981.txt', 'http://oyfr0gkd3.bkt.clouddn.com/5b7f6ee48b981.txt', '', '0', '2018-08-24 10:35:16', '2018-09-01 13:36:10');
INSERT INTO `wancll_qiniu_files` VALUES ('5', 'jianhaihao', 'jpg', '18.62KB', '5b8a0b46d94c7.jpg', 'http://oyfr0gkd3.bkt.clouddn.com/5b8a0b46d94c7.jpg', '', '0', '2018-09-01 11:45:11', '2018-09-01 12:02:27');
INSERT INTO `wancll_qiniu_files` VALUES ('6', 'jianhaihao', 'jpg', '18.62KB', '5b8a25531f2ee.jpg', 'http://oyfr0gkd3.bkt.clouddn.com/5b8a25531f2ee.jpg', '', '0', '2018-09-01 13:36:19', '2018-09-01 13:36:51');
INSERT INTO `wancll_qiniu_files` VALUES ('7', '新版本测试2', 'docx', '861.53KB', '5b8bfacbcc671.docx', 'http://oyfr0gkd3.bkt.clouddn.com/5b8bfacbcc671.docx', '', '0', '2018-09-02 22:59:32', '2018-09-04 09:39:31');
INSERT INTO `wancll_qiniu_files` VALUES ('8', '新建 Microsoft Word 文档', 'docx', '5.06KB', '5b8bfae0ea89e.docx', 'http://oyfr0gkd3.bkt.clouddn.com/5b8bfae0ea89e.docx', '', '1', '2018-09-02 22:59:45', '2018-09-02 22:59:45');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_region_bonus`
-- -----------------------------
INSERT INTO `wancll_region_bonus` VALUES ('1', '17', '1', '北京市', '110000', '', '', '', '', '0', '0.00', '1', '0', '2018-09-01 11:48:35', '2018-09-01 11:48:38');
INSERT INTO `wancll_region_bonus` VALUES ('2', '17', '2', '北京市', '110000', '市辖区', '110100', '', '', '0', '0.00', '1', '0', '2018-09-01 11:48:48', '2018-09-01 12:00:50');
INSERT INTO `wancll_region_bonus` VALUES ('3', '2', '1', '北京市', '110000', '', '', '', '', '0', '0.00', '1', '0', '2018-09-01 11:49:37', '2018-09-01 12:00:50');
INSERT INTO `wancll_region_bonus` VALUES ('4', '17', '2', '北京市', '110000', '市辖区', '110100', '', '', '0', '0.00', '1', '1', '2018-09-01 15:48:58', '2018-09-01 15:48:58');
INSERT INTO `wancll_region_bonus` VALUES ('5', '2', '1', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '0', '0.00', '1', '1', '2018-09-01 15:49:09', '2018-09-01 15:49:09');
INSERT INTO `wancll_region_bonus` VALUES ('6', '9', '3', '北京市', '110000', '市辖区', '110100', '丰台区', '110106', '0', '0.00', '1', '1', '2018-09-03 14:02:20', '2018-09-03 14:02:20');

-- -----------------------------
-- Table structure for `wancll_return_goods`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_return_goods`;
CREATE TABLE `wancll_return_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '退货类型:1正常退货2拼团到期退货',
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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_return_goods`
-- -----------------------------
INSERT INTO `wancll_return_goods` VALUES ('1', '2', '2', '1', '2', 'G2018073115043681313', '15.00', '[]', '9', '拼团失败，系统自动退款', '2018-07-31 15:04:36', '1', '2018-07-31 18:20:01', '3', '1', '2018-07-31 15:04:36', '2018-07-31 18:20:01');
INSERT INTO `wancll_return_goods` VALUES ('2', '2', '2', '2', '3', 'G2018080110145482397', '10.00', '[]', '9', '拼团失败，系统自动退款', '2018-08-01 10:14:54', '1', '2018-09-03 11:07:48', '3', '1', '2018-08-01 10:14:54', '2018-09-03 11:07:48');
INSERT INTO `wancll_return_goods` VALUES ('3', '2', '5', '3', '2', 'G2018080110154939871', '15.00', '[]', '9', '拼团失败，系统自动退款', '2018-08-01 10:15:49', '1', '2018-09-03 11:07:45', '3', '1', '2018-08-01 10:15:49', '2018-09-03 11:07:45');
INSERT INTO `wancll_return_goods` VALUES ('4', '1', '12', '13', '13', 'G2018082411544185159', '100.00', '[\"\\/public\\/upload\\/goods_images\\/1535082881616.jpg\"]', '1', 'tuik', '2018-08-24 12:04:10', '1', '2018-08-24 12:04:14', '3', '1', '2018-08-24 11:54:41', '2018-08-24 12:04:14');
INSERT INTO `wancll_return_goods` VALUES ('5', '1', '12', '15', '15', 'G2018082411563656611', '130.00', '[\"\\/public\\/upload\\/goods_images\\/1535082996269.jpg\"]', '1', 'gg', '2018-08-24 12:04:00', '0', '', '2', '1', '2018-08-24 11:56:36', '2018-08-24 12:04:00');
INSERT INTO `wancll_return_goods` VALUES ('6', '1', '12', '12', '12', 'G2018083115204162555', '100.00', '[\"\\/public\\/upload\\/goods_images\\/1535700041341.jpg\"]', '1', '退款', '2018-08-31 15:41:28', '1', '2018-09-01 16:12:33', '3', '1', '2018-08-31 15:20:41', '2018-09-01 16:12:33');
INSERT INTO `wancll_return_goods` VALUES ('7', '1', '12', '28', '28', 'G2018083115442703581', '200.00', '[\"\\/public\\/upload\\/goods_images\\/1535701467376.jpg\"]', '1', '刚', '2018-09-01 16:12:36', '1', '2018-09-01 16:12:40', '3', '1', '2018-08-31 15:44:27', '2018-09-01 16:12:40');
INSERT INTO `wancll_return_goods` VALUES ('8', '1', '2', '6', '6', 'G2018083116344141302', '100.00', '[]', '1', '1', '2018-08-31 16:35:35', '1', '2018-08-31 17:05:04', '3', '1', '2018-08-31 16:34:41', '2018-08-31 17:05:04');
INSERT INTO `wancll_return_goods` VALUES ('9', '1', '18', '37', '39', 'G2018083117053632308', '3309.00', '[]', '1', '1', '2018-08-31 17:05:52', '1', '2018-08-31 17:05:55', '3', '1', '2018-08-31 17:05:36', '2018-08-31 17:05:55');
INSERT INTO `wancll_return_goods` VALUES ('10', '1', '2', '38', '40', 'G2018083117082546665', '3309.00', '[]', '1', '1', '2018-08-31 17:10:16', '1', '2018-08-31 17:52:17', '3', '1', '2018-08-31 17:08:25', '2018-08-31 17:52:17');
INSERT INTO `wancll_return_goods` VALUES ('11', '1', '17', '40', '42', 'G2018083117475489551', '3309.00', '[]', '1', '1', '2018-08-31 17:48:15', '1', '2018-08-31 17:52:32', '3', '1', '2018-08-31 17:47:54', '2018-08-31 17:52:32');
INSERT INTO `wancll_return_goods` VALUES ('12', '1', '18', '51', '53', 'G2018090110322798800', '1000.00', '[]', '1', '4', '2018-09-01 10:32:35', '1', '2018-09-01 10:32:39', '3', '1', '2018-09-01 10:32:27', '2018-09-01 10:32:39');
INSERT INTO `wancll_return_goods` VALUES ('13', '2', '2', '30', '30', 'G2018090115442671386', '2000.00', '[]', '9', '拼团失败，系统自动退款', '2018-09-01 15:44:26', '1', '2018-09-03 11:07:43', '3', '1', '2018-09-01 15:44:26', '2018-09-03 11:07:43');
INSERT INTO `wancll_return_goods` VALUES ('14', '1', '18', '66', '68', 'G2018090116115214509', '10000.00', '[]', '1', '1', '2018-09-01 16:12:27', '1', '2018-09-01 16:12:30', '3', '1', '2018-09-01 16:11:52', '2018-09-01 16:12:30');
INSERT INTO `wancll_return_goods` VALUES ('15', '1', '17', '71', '73', 'G2018090116554436064', '10000.00', '[]', '1', '1', '2018-09-01 16:55:48', '1', '2018-09-01 16:55:51', '3', '1', '2018-09-01 16:55:44', '2018-09-01 16:55:51');
INSERT INTO `wancll_return_goods` VALUES ('16', '1', '18', '74', '76', 'G2018090310043142287', '10000.00', '[]', '1', '1', '2018-09-03 10:04:47', '1', '2018-09-03 10:04:49', '3', '1', '2018-09-03 10:04:31', '2018-09-03 10:04:49');

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
INSERT INTO `wancll_role_nav_powers` VALUES ('2', '[91,92,93,36,94,1,2,112,75,113,129,128,33,140,114,115,116,119,118,117,43,44,45,100,101,102,46,47,48,49,76,77,90,78,121,122,127,125,124,146,150,148,152,147,151,149,157,155,153,158,156,159,81,83,82,131,86,130,141,132,134,133,137,136,138,139,135,142,22,27,23,24,34,37,18,38,39,42,32,21]', '1', '2018-04-04 10:57:01', '2018-09-03 11:03:11');
INSERT INTO `wancll_role_nav_powers` VALUES ('3', '[91,92,93,36,94,1,2,112,75,113,129,128,33,140,114,115,116,119,118,117,43,44,45,100,101,102,46,47,48,49,76,77,90,78,121,122,127,125,124,146,150,148,152,147,151,149,157,155,153,158,156,159,81,83,82,131,86,130,141,132,134,133,137,136,138,139,135,142,22,29,70,27,23,24,34,143,103,105,154,126,104,37,18,38,39,42,32,21]', '1', '2018-04-04 10:57:34', '2018-07-31 10:35:08');
INSERT INTO `wancll_role_nav_powers` VALUES ('4', '[]', '1', '2018-04-05 17:57:18', '2018-04-05 17:57:18');
INSERT INTO `wancll_role_nav_powers` VALUES ('5', '[]', '1', '2018-06-29 14:14:09', '2018-06-29 14:14:09');
INSERT INTO `wancll_role_nav_powers` VALUES ('6', '[36,94,1,116]', '1', '2018-08-24 09:46:23', '2018-08-24 10:51:55');
INSERT INTO `wancll_role_nav_powers` VALUES ('7', '[]', '1', '2018-09-04 09:47:48', '2018-09-04 09:47:48');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_roles`
-- -----------------------------
INSERT INTO `wancll_roles` VALUES ('1', '会员', '会员通用角色', 'user', '1', '2018-04-04 10:55:37', '2018-04-04 10:55:37');
INSERT INTO `wancll_roles` VALUES ('2', '普通管理员', '普通管理员发', 'admin', '1', '2018-04-04 10:57:01', '2018-04-04 10:57:01');
INSERT INTO `wancll_roles` VALUES ('3', '超级管理员', '超级管理员', 'admin', '1', '2018-04-04 10:57:34', '2018-04-04 10:57:34');
INSERT INTO `wancll_roles` VALUES ('4', '运营管理员', '运营管理员的介绍', 'admin', '0', '2018-04-05 17:57:18', '2018-04-05 17:57:18');
INSERT INTO `wancll_roles` VALUES ('5', '测试', '法大师傅', 'admin', '0', '2018-06-29 14:14:09', '2018-06-29 14:14:43');
INSERT INTO `wancll_roles` VALUES ('6', '测试管理员', '用于测试', 'admin', '0', '2018-08-24 09:46:23', '2018-09-03 11:39:48');
INSERT INTO `wancll_roles` VALUES ('7', '1', '1', 'user', '0', '2018-09-04 09:47:48', '2018-09-04 09:47:59');

-- -----------------------------
-- Table structure for `wancll_rules`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_rules`;
CREATE TABLE `wancll_rules` (
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_rules`
-- -----------------------------
INSERT INTO `wancll_rules` VALUES ('1', '18', '43', '/public/upload/article_images/20180824/10b240754b2569ba5ca96096d21f83e3.png', '34', '<p>4334433443</p>', '433', '[]', '4343', '3443', '0', '1', '1', '2018-08-24 13:05:19', '2018-08-24 13:05:19');
INSERT INTO `wancll_rules` VALUES ('2', '18', '3343434', '/public/upload/article_images/20180824/39f45d1f26e7d31f90ca305ef4173f08.png', '43', '343443443', '4334', '[]', '4343', '34', '0', '1', '1', '2018-08-24 13:05:38', '2018-08-24 13:05:38');
INSERT INTO `wancll_rules` VALUES ('3', '19', '43434', '/public/upload/article_images/20180824/c1910dfeac43e6effd6368e56094d113.png', '3434', '43433434', '4334', '[]', '3443', '34', '0', '1', '1', '2018-08-24 13:05:52', '2018-08-24 13:05:52');

-- -----------------------------
-- Table structure for `wancll_score_goods`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_score_goods`;
CREATE TABLE `wancll_score_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `spec_group_info` text COMMENT '规格组合项信息',
  `score` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '兑换积分数',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '兑换金钱数',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1上架2下架',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_score_goods`
-- -----------------------------
INSERT INTO `wancll_score_goods` VALUES ('1', '1', '[{\"spec_group_id_str\":\"f151bcf787d73a0cb29fd360d7f6f598\",\"score\":\"10\",\"money\":0,\"spec_option_group\":\"尺寸\"}]', '10.00', '0.00', '0', '1', '0', '2018-07-20 09:36:11', '2018-07-24 15:14:54');
INSERT INTO `wancll_score_goods` VALUES ('2', '4', '[{\"spec_group_id_str\":\"4201a560b5d850a1f2fa922674981d99\",\"score\":\"99\",\"money\":0,\"spec_option_group\":\"黑色_60寸爆款4K\"},{\"spec_group_id_str\":\"5aa1986312dc29e79dd428e0e1530e58\",\"score\":\"99\",\"money\":0,\"spec_option_group\":\"银色_60寸爆款4K\"},{\"spec_group_id_str\":\"bae05d8d2bda242ab4579038dde5914e\",\"score\":\"99\",\"money\":0,\"spec_option_group\":\"黑色_50寸智能\"},{\"spec_group_id_str\":\"4c278694f0e1a64e8989e4fe4e25da2d\",\"score\":\"99\",\"money\":0,\"spec_option_group\":\"银色_50寸智能\"},{\"spec_group_id_str\":\"c00e9dfb99b228b9b31e01a6ed0cd1cf\",\"score\":\"99\",\"money\":0,\"spec_option_group\":\"黑色_45寸智能\"},{\"spec_group_id_str\":\"8f7ddcef8034b31b2d219ce556bdca1c\",\"score\":\"99\",\"money\":0,\"spec_option_group\":\"银色_45寸智能\"}]', '99.00', '0.00', '0', '1', '0', '2018-07-24 15:10:35', '2018-09-03 17:53:39');
INSERT INTO `wancll_score_goods` VALUES ('3', '2', '[{\"spec_group_id_str\":\"9a4f62329a021d6063e4389b4191549a\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"白色_S\"},{\"spec_group_id_str\":\"3ecaf83e4b58258b2708e71f5153c28f\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"黑色_S\"},{\"spec_group_id_str\":\"14e449c122e1a02ad9055d72892da421\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"灰色_S\"},{\"spec_group_id_str\":\"212009b774a03875900111b1556c6bbd\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"白色_M\"},{\"spec_group_id_str\":\"75e13ff2a062474ce87a9743b92ed529\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"黑色_M\"},{\"spec_group_id_str\":\"2a556c0b177054851a311b5b28bc0217\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"灰色_M\"},{\"spec_group_id_str\":\"086e8bcf7197f7a15e3f3ef580f48656\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"白色_L\"},{\"spec_group_id_str\":\"6ae4f8940ef3a0f87a7b0adfef09d243\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"黑色_L\"},{\"spec_group_id_str\":\"ebf7862a9bb6255ddad83eaed2ca94a8\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"灰色_L\"}]', '10000.00', '1.00', '0', '1', '0', '2018-07-24 15:11:03', '2018-09-03 17:53:44');
INSERT INTO `wancll_score_goods` VALUES ('4', '3', '[{\"spec_group_id_str\":\"1801aa94b8a08fa9a0c467a6e2fc262e\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"白色_450M\"},{\"spec_group_id_str\":\"c5b12e5f6771f8bc9ac5ff80e0c2e5f5\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"黑色_450M\"},{\"spec_group_id_str\":\"f500f38a228dfbe52d25a8c1c6064e91\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"灰色_450M\"},{\"spec_group_id_str\":\"3815dc5fa04ce193491b1488fb76fab5\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"白色_1200M\"},{\"spec_group_id_str\":\"145c9e89ca0df0ad71dc483ada7823ec\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"黑色_1200M\"},{\"spec_group_id_str\":\"1034ced74785d90772d982521c460e11\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"灰色_1200M\"},{\"spec_group_id_str\":\"27c40c8cd59b044215e67fe7f768d8ff\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"白色_全千兆\"},{\"spec_group_id_str\":\"bc7837c0c483711c873e748bf34373b2\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"黑色_全千兆\"},{\"spec_group_id_str\":\"fa8469b7c1889ab25fa4cfdae4cb3f43\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"灰色_全千兆\"}]', '999.00', '10.00', '0', '1', '0', '2018-07-28 13:41:33', '2018-09-03 17:53:40');
INSERT INTO `wancll_score_goods` VALUES ('5', '5', '[{\"spec_group_id_str\":\"6115eedc743452f7cf13d8f0af09540f\",\"score\":\"5\",\"money\":0,\"spec_option_group\":\"红色\"},{\"spec_group_id_str\":\"aefef5355ad49bd95bf17ab9c94359e4\",\"score\":\"5\",\"money\":0,\"spec_option_group\":\"绿色\"},{\"spec_group_id_str\":\"4821f5db66d294a3d277e0448b2e49ad\",\"score\":\"5\",\"money\":0,\"spec_option_group\":\"蓝色\"}]', '5.00', '0.00', '0', '1', '0', '2018-08-24 14:07:26', '2018-09-03 17:53:42');
INSERT INTO `wancll_score_goods` VALUES ('6', '7', '[]', '1000.00', '0.00', '0', '1', '1', '2018-09-03 17:54:36', '2018-09-03 17:54:36');
INSERT INTO `wancll_score_goods` VALUES ('7', '8', '[{\"spec_group_id_str\":\"f90dd144f9cb24d244cc023e74eca12c\",\"score\":\"500\",\"money\":0,\"spec_option_group\":\"蓝色\"},{\"spec_group_id_str\":\"9d653df2bede1d864f703472454645f5\",\"score\":\"500\",\"money\":0,\"spec_option_group\":\"绿色\"},{\"spec_group_id_str\":\"99634f20d3ba922db5ab94e8fa002994\",\"score\":\"500\",\"money\":0,\"spec_option_group\":\"红色\"}]', '500.00', '0.00', '0', '1', '1', '2018-09-04 10:16:14', '2018-09-04 10:16:26');

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
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_score_logs`
-- -----------------------------
INSERT INTO `wancll_score_logs` VALUES ('1', '2', 'shop', '70.00', '会员完成购物', '会员完成购物，购物时间2018-07-23 15:26:56', '1', '2018-07-23 15:26:56', '2018-07-23 15:26:56');
INSERT INTO `wancll_score_logs` VALUES ('2', '2', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-07-25 10:52:23', '1', '2018-07-25 10:52:23', '2018-07-25 10:52:23');
INSERT INTO `wancll_score_logs` VALUES ('3', '2', 'score_shop', '99.00', '积分兑换', '积分兑换商品，购物时间2018-07-25 10:52:57', '1', '2018-07-25 10:52:57', '2018-07-25 10:52:57');
INSERT INTO `wancll_score_logs` VALUES ('4', '3', 'admin_recharge_score', '100.00', '管理员充值积分', '管理员给会员充值积分, 充值时间2018-07-27 19:41:51', '1', '2018-07-27 19:41:51', '2018-07-27 19:41:51');
INSERT INTO `wancll_score_logs` VALUES ('5', '2', 'admin_recharge_score', '500.00', '管理员充值积分', '管理员给会员充值积分, 充值时间2018-07-27 19:41:56', '1', '2018-07-27 19:41:56', '2018-07-27 19:41:56');
INSERT INTO `wancll_score_logs` VALUES ('6', '1', 'admin_recharge_score', '100.00', '管理员充值积分', '管理员给会员充值积分, 充值时间2018-07-27 19:42:01', '1', '2018-07-27 19:42:01', '2018-07-27 19:42:01');
INSERT INTO `wancll_score_logs` VALUES ('7', '2', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-07-27 19:45:50', '1', '2018-07-27 19:45:50', '2018-07-27 19:45:50');
INSERT INTO `wancll_score_logs` VALUES ('8', '2', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-07-28 10:17:48', '1', '2018-07-28 10:17:48', '2018-07-28 10:17:48');
INSERT INTO `wancll_score_logs` VALUES ('9', '5', 'admin_recharge_score', '10000.00', '管理员充值积分', '管理员给会员充值积分, 充值时间2018-07-28 10:59:35', '1', '2018-07-28 10:59:35', '2018-07-28 10:59:35');
INSERT INTO `wancll_score_logs` VALUES ('10', '5', 'score_shop', '10.00', '积分兑换', '积分兑换商品，购物时间2018-07-28 10:59:50', '1', '2018-07-28 10:59:50', '2018-07-28 10:59:50');
INSERT INTO `wancll_score_logs` VALUES ('11', '5', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-07-28 11:01:06', '1', '2018-07-28 11:01:06', '2018-07-28 11:01:06');
INSERT INTO `wancll_score_logs` VALUES ('12', '5', 'score_shop', '999.00', '积分兑换', '积分兑换商品，购物时间2018-07-28 14:24:40', '1', '2018-07-28 14:24:40', '2018-07-28 14:24:40');
INSERT INTO `wancll_score_logs` VALUES ('13', '6', 'admin_recharge_score', '500.00', '管理员充值积分', '管理员给会员充值积分, 充值时间2018-07-28 14:46:23', '1', '2018-07-28 14:46:23', '2018-07-28 14:46:23');
INSERT INTO `wancll_score_logs` VALUES ('14', '7', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-07-30 09:34:41', '1', '2018-07-30 09:34:41', '2018-07-30 09:34:41');
INSERT INTO `wancll_score_logs` VALUES ('15', '3', 'shop', '150.50', '会员完成购物', '会员完成购物，购物时间2018-07-30 10:51:21', '1', '2018-07-30 10:51:21', '2018-07-30 10:51:21');
INSERT INTO `wancll_score_logs` VALUES ('16', '7', 'admin_recharge_score', '10000.00', '管理员充值积分', '管理员给会员充值积分, 充值时间2018-07-30 11:17:17', '1', '2018-07-30 11:17:17', '2018-07-30 11:17:17');
INSERT INTO `wancll_score_logs` VALUES ('17', '7', 'score_shop', '999.00', '积分兑换', '积分兑换商品，购物时间2018-07-30 11:17:51', '1', '2018-07-30 11:17:51', '2018-07-30 11:17:51');
INSERT INTO `wancll_score_logs` VALUES ('18', '8', 'admin_recharge_score', '10000.00', '管理员充值积分', '管理员给会员充值积分, 充值时间2018-07-30 11:54:28', '1', '2018-07-30 11:54:28', '2018-07-30 11:54:28');
INSERT INTO `wancll_score_logs` VALUES ('19', '3', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-07-30 12:00:00', '1', '2018-07-30 12:00:00', '2018-07-30 12:00:00');
INSERT INTO `wancll_score_logs` VALUES ('20', '7', 'score_shop', '999.00', '积分兑换', '积分兑换商品，购物时间2018-07-30 16:05:26', '1', '2018-07-30 16:05:26', '2018-07-30 16:05:26');
INSERT INTO `wancll_score_logs` VALUES ('21', '5', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-08-01 10:14:45', '1', '2018-08-01 10:14:45', '2018-08-01 10:14:45');
INSERT INTO `wancll_score_logs` VALUES ('22', '5', 'score_shop', '999.00', '积分兑换', '积分兑换商品，购物时间2018-08-01 16:09:13', '1', '2018-08-01 16:09:13', '2018-08-01 16:09:13');
INSERT INTO `wancll_score_logs` VALUES ('23', '5', 'shop', '2309.30', '会员完成购物', '会员完成购物，购物时间2018-08-04 17:38:45', '1', '2018-08-04 17:38:45', '2018-08-04 17:38:45');
INSERT INTO `wancll_score_logs` VALUES ('24', '2', 'shop', '70.00', '会员完成购物', '会员完成购物，购物时间2018-08-07 16:17:28', '1', '2018-08-07 16:17:28', '2018-08-07 16:17:28');
INSERT INTO `wancll_score_logs` VALUES ('25', '7', 'shop', '70.00', '会员完成购物', '会员完成购物，购物时间2018-08-10 09:13:08', '1', '2018-08-10 09:13:08', '2018-08-10 09:13:08');
INSERT INTO `wancll_score_logs` VALUES ('26', '7', 'shop', '70.00', '会员完成购物', '会员完成购物，购物时间2018-08-10 09:13:53', '1', '2018-08-10 09:13:53', '2018-08-10 09:13:53');
INSERT INTO `wancll_score_logs` VALUES ('27', '2', 'shop', '2309.30', '会员完成购物', '会员完成购物，购物时间2018-08-14 14:34:58', '1', '2018-08-14 14:34:58', '2018-08-14 14:34:58');
INSERT INTO `wancll_score_logs` VALUES ('28', '6', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-08-23 09:14:47', '1', '2018-08-23 09:14:47', '2018-08-23 09:14:47');
INSERT INTO `wancll_score_logs` VALUES ('29', '12', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-08-23 23:28:41', '1', '2018-08-23 23:28:41', '2018-08-23 23:28:41');
INSERT INTO `wancll_score_logs` VALUES ('30', '12', 'shop', '91.00', '会员完成购物', '会员完成购物，购物时间2018-08-24 11:31:43', '1', '2018-08-24 11:31:43', '2018-08-24 11:31:43');
INSERT INTO `wancll_score_logs` VALUES ('31', '12', 'shop', '91.00', '会员完成购物', '会员完成购物，购物时间2018-08-24 11:47:50', '1', '2018-08-24 11:47:50', '2018-08-24 11:47:50');
INSERT INTO `wancll_score_logs` VALUES ('32', '12', 'shop', '70.00', '会员完成购物', '会员完成购物，购物时间2018-08-24 11:48:26', '1', '2018-08-24 11:48:26', '2018-08-24 11:48:26');
INSERT INTO `wancll_score_logs` VALUES ('33', '12', 'shop', '70.00', '会员完成购物', '会员完成购物，购物时间2018-08-24 11:48:54', '1', '2018-08-24 11:48:54', '2018-08-24 11:48:54');
INSERT INTO `wancll_score_logs` VALUES ('34', '12', 'shop', '70.00', '会员完成购物', '会员完成购物，购物时间2018-08-24 11:49:42', '1', '2018-08-24 11:49:43', '2018-08-24 11:49:43');
INSERT INTO `wancll_score_logs` VALUES ('35', '12', 'shop', '91.00', '会员完成购物', '会员完成购物，购物时间2018-08-24 11:56:03', '1', '2018-08-24 11:56:03', '2018-08-24 11:56:03');
INSERT INTO `wancll_score_logs` VALUES ('36', '12', 'shop', '126.00', '会员完成购物', '会员完成购物，购物时间2018-08-24 13:37:21', '1', '2018-08-24 13:37:21', '2018-08-24 13:37:21');
INSERT INTO `wancll_score_logs` VALUES ('37', '12', 'shop', '91.00', '会员完成购物', '会员完成购物，购物时间2018-08-24 13:38:32', '1', '2018-08-24 13:38:32', '2018-08-24 13:38:32');
INSERT INTO `wancll_score_logs` VALUES ('38', '12', 'shop', '91.00', '会员完成购物', '会员完成购物，购物时间2018-08-24 13:38:33', '1', '2018-08-24 13:38:33', '2018-08-24 13:38:33');
INSERT INTO `wancll_score_logs` VALUES ('39', '12', 'shop', '91.00', '会员完成购物', '会员完成购物，购物时间2018-08-24 13:38:33', '1', '2018-08-24 13:38:33', '2018-08-24 13:38:33');
INSERT INTO `wancll_score_logs` VALUES ('40', '12', 'shop', '91.00', '会员完成购物', '会员完成购物，购物时间2018-08-24 13:38:42', '1', '2018-08-24 13:38:42', '2018-08-24 13:38:42');
INSERT INTO `wancll_score_logs` VALUES ('41', '12', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-08-24 14:01:24', '1', '2018-08-24 14:01:24', '2018-08-24 14:01:24');
INSERT INTO `wancll_score_logs` VALUES ('42', '2', 'shop', '77.00', '会员完成购物', '会员完成购物，购物时间2018-08-31 14:21:12', '1', '2018-08-31 14:21:12', '2018-08-31 14:21:12');
INSERT INTO `wancll_score_logs` VALUES ('43', '2', 'shop', '77.00', '会员完成购物', '会员完成购物，购物时间2018-08-31 14:22:13', '1', '2018-08-31 14:22:13', '2018-08-31 14:22:13');
INSERT INTO `wancll_score_logs` VALUES ('44', '2', 'shop', '77.00', '会员完成购物', '会员完成购物，购物时间2018-08-31 14:47:55', '1', '2018-08-31 14:47:55', '2018-08-31 14:47:55');
INSERT INTO `wancll_score_logs` VALUES ('45', '14', 'admin_recharge_score', '1000.00', '管理员充值积分', '管理员给会员充值积分, 充值时间2018-08-31 14:56:05', '1', '2018-08-31 14:56:05', '2018-08-31 14:56:05');
INSERT INTO `wancll_score_logs` VALUES ('46', '2', 'shop', '91.00', '会员完成购物', '会员完成购物，购物时间2018-08-31 15:07:34', '1', '2018-08-31 15:07:34', '2018-08-31 15:07:34');
INSERT INTO `wancll_score_logs` VALUES ('47', '2', 'shop', '91.00', '会员完成购物', '会员完成购物，购物时间2018-08-31 15:11:17', '1', '2018-08-31 15:11:17', '2018-08-31 15:11:17');
INSERT INTO `wancll_score_logs` VALUES ('48', '2', 'shop', '91.00', '会员完成购物', '会员完成购物，购物时间2018-08-31 15:11:22', '1', '2018-08-31 15:11:22', '2018-08-31 15:11:22');
INSERT INTO `wancll_score_logs` VALUES ('49', '2', 'shop', '77.00', '会员完成购物', '会员完成购物，购物时间2018-08-31 15:15:51', '1', '2018-08-31 15:15:51', '2018-08-31 15:15:51');
INSERT INTO `wancll_score_logs` VALUES ('50', '12', 'shop', '140.00', '会员完成购物', '会员完成购物，购物时间2018-08-31 15:18:58', '1', '2018-08-31 15:18:58', '2018-08-31 15:18:58');
INSERT INTO `wancll_score_logs` VALUES ('51', '14', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-08-31 15:26:44', '1', '2018-08-31 15:26:44', '2018-08-31 15:26:44');
INSERT INTO `wancll_score_logs` VALUES ('52', '2', 'score_shop', '5.00', '积分兑换', '积分兑换商品，购物时间2018-08-31 15:43:43', '1', '2018-08-31 15:43:43', '2018-08-31 15:43:43');
INSERT INTO `wancll_score_logs` VALUES ('53', '2', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-08-31 15:43:51', '1', '2018-08-31 15:43:51', '2018-08-31 15:43:51');
INSERT INTO `wancll_score_logs` VALUES ('54', '2', 'shop', '11777.50', '会员完成购物', '会员完成购物，购物时间2018-08-31 16:34:18', '1', '2018-08-31 16:34:18', '2018-08-31 16:34:18');
INSERT INTO `wancll_score_logs` VALUES ('55', '2', 'shop', '2316.30', '会员完成购物', '会员完成购物，购物时间2018-08-31 16:37:39', '1', '2018-08-31 16:37:39', '2018-08-31 16:37:39');
INSERT INTO `wancll_score_logs` VALUES ('56', '17', 'shop', '70.00', '会员完成购物', '会员完成购物，购物时间2018-08-31 16:42:53', '1', '2018-08-31 16:42:53', '2018-08-31 16:42:53');
INSERT INTO `wancll_score_logs` VALUES ('57', '17', 'shop', '70.00', '会员完成购物', '会员完成购物，购物时间2018-08-31 16:44:59', '1', '2018-08-31 16:44:59', '2018-08-31 16:44:59');
INSERT INTO `wancll_score_logs` VALUES ('58', '17', 'shop', '70.00', '会员完成购物', '会员完成购物，购物时间2018-08-31 16:46:12', '1', '2018-08-31 16:46:12', '2018-08-31 16:46:12');
INSERT INTO `wancll_score_logs` VALUES ('59', '17', 'shop', '70.00', '会员完成购物', '会员完成购物，购物时间2018-08-31 16:46:18', '1', '2018-08-31 16:46:18', '2018-08-31 16:46:18');
INSERT INTO `wancll_score_logs` VALUES ('60', '18', 'shop', '2316.30', '会员完成购物', '会员完成购物，购物时间2018-08-31 17:03:52', '1', '2018-08-31 17:03:52', '2018-08-31 17:03:52');
INSERT INTO `wancll_score_logs` VALUES ('61', '2', 'shop', '2316.30', '会员完成购物', '会员完成购物，购物时间2018-08-31 17:07:54', '1', '2018-08-31 17:07:54', '2018-08-31 17:07:54');
INSERT INTO `wancll_score_logs` VALUES ('62', '18', 'shop', '2316.30', '会员完成购物', '会员完成购物，购物时间2018-08-31 17:09:42', '1', '2018-08-31 17:09:42', '2018-08-31 17:09:42');
INSERT INTO `wancll_score_logs` VALUES ('63', '17', 'shop', '2316.30', '会员完成购物', '会员完成购物，购物时间2018-08-31 17:47:31', '1', '2018-08-31 17:47:31', '2018-08-31 17:47:31');
INSERT INTO `wancll_score_logs` VALUES ('64', '18', 'shop', '2316.30', '会员完成购物', '会员完成购物，购物时间2018-08-31 17:53:02', '1', '2018-08-31 17:53:02', '2018-08-31 17:53:02');
INSERT INTO `wancll_score_logs` VALUES ('65', '18', 'shop', '2316.30', '会员完成购物', '会员完成购物，购物时间2018-08-31 17:55:43', '1', '2018-08-31 17:55:43', '2018-08-31 17:55:43');
INSERT INTO `wancll_score_logs` VALUES ('66', '18', 'shop', '2316.30', '会员完成购物', '会员完成购物，购物时间2018-08-31 17:55:50', '1', '2018-08-31 17:55:50', '2018-08-31 17:55:50');
INSERT INTO `wancll_score_logs` VALUES ('67', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 09:23:04', '1', '2018-09-01 09:23:04', '2018-09-01 09:23:04');
INSERT INTO `wancll_score_logs` VALUES ('68', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 09:37:40', '1', '2018-09-01 09:37:40', '2018-09-01 09:37:40');
INSERT INTO `wancll_score_logs` VALUES ('69', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 09:44:02', '1', '2018-09-01 09:44:02', '2018-09-01 09:44:02');
INSERT INTO `wancll_score_logs` VALUES ('70', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 09:51:07', '1', '2018-09-01 09:51:07', '2018-09-01 09:51:07');
INSERT INTO `wancll_score_logs` VALUES ('71', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 10:26:30', '1', '2018-09-01 10:26:30', '2018-09-01 10:26:30');
INSERT INTO `wancll_score_logs` VALUES ('72', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 10:28:27', '1', '2018-09-01 10:28:27', '2018-09-01 10:28:27');
INSERT INTO `wancll_score_logs` VALUES ('73', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 10:29:51', '1', '2018-09-01 10:29:51', '2018-09-01 10:29:51');
INSERT INTO `wancll_score_logs` VALUES ('74', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 10:31:50', '1', '2018-09-01 10:31:50', '2018-09-01 10:31:50');
INSERT INTO `wancll_score_logs` VALUES ('75', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 10:33:04', '1', '2018-09-01 10:33:04', '2018-09-01 10:33:04');
INSERT INTO `wancll_score_logs` VALUES ('76', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 10:33:17', '1', '2018-09-01 10:33:17', '2018-09-01 10:33:17');
INSERT INTO `wancll_score_logs` VALUES ('77', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 10:34:30', '1', '2018-09-01 10:34:30', '2018-09-01 10:34:30');
INSERT INTO `wancll_score_logs` VALUES ('78', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 10:35:18', '1', '2018-09-01 10:35:18', '2018-09-01 10:35:18');
INSERT INTO `wancll_score_logs` VALUES ('79', '17', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 11:02:50', '1', '2018-09-01 11:02:50', '2018-09-01 11:02:50');
INSERT INTO `wancll_score_logs` VALUES ('80', '17', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 11:10:49', '1', '2018-09-01 11:10:49', '2018-09-01 11:10:49');
INSERT INTO `wancll_score_logs` VALUES ('81', '17', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 11:31:44', '1', '2018-09-01 11:31:44', '2018-09-01 11:31:44');
INSERT INTO `wancll_score_logs` VALUES ('82', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 11:53:44', '1', '2018-09-01 11:53:44', '2018-09-01 11:53:44');
INSERT INTO `wancll_score_logs` VALUES ('83', '17', 'score_shop', '50.00', '积分兑换', '积分兑换商品，购物时间2018-09-01 13:45:14', '1', '2018-09-01 13:45:14', '2018-09-01 13:45:14');
INSERT INTO `wancll_score_logs` VALUES ('84', '18', 'score_shop', '10000.00', '积分兑换', '积分兑换商品，购物时间2018-09-01 13:49:08', '1', '2018-09-01 13:49:08', '2018-09-01 13:49:08');
INSERT INTO `wancll_score_logs` VALUES ('85', '18', 'score_shop', '10000.00', '积分兑换', '积分兑换商品，购物时间2018-09-01 13:50:35', '1', '2018-09-01 13:50:35', '2018-09-01 13:50:35');
INSERT INTO `wancll_score_logs` VALUES ('86', '18', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-09-01 13:51:16', '1', '2018-09-01 13:51:16', '2018-09-01 13:51:16');
INSERT INTO `wancll_score_logs` VALUES ('87', '18', 'shop', '2316.30', '会员完成购物', '会员完成购物，购物时间2018-09-01 14:03:51', '1', '2018-09-01 14:03:51', '2018-09-01 14:03:51');
INSERT INTO `wancll_score_logs` VALUES ('88', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 15:49:46', '1', '2018-09-01 15:49:46', '2018-09-01 15:49:46');
INSERT INTO `wancll_score_logs` VALUES ('89', '18', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 15:51:09', '1', '2018-09-01 15:51:09', '2018-09-01 15:51:09');
INSERT INTO `wancll_score_logs` VALUES ('90', '18', 'shop', '7000.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 16:11:43', '1', '2018-09-01 16:11:43', '2018-09-01 16:11:43');
INSERT INTO `wancll_score_logs` VALUES ('91', '18', 'shop', '7000.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 16:44:19', '1', '2018-09-01 16:44:19', '2018-09-01 16:44:19');
INSERT INTO `wancll_score_logs` VALUES ('92', '18', 'shop', '7000.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 16:45:23', '1', '2018-09-01 16:45:23', '2018-09-01 16:45:23');
INSERT INTO `wancll_score_logs` VALUES ('93', '18', 'shop', '7000.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 16:50:36', '1', '2018-09-01 16:50:36', '2018-09-01 16:50:36');
INSERT INTO `wancll_score_logs` VALUES ('94', '18', 'shop', '49000.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 16:51:28', '1', '2018-09-01 16:51:28', '2018-09-01 16:51:28');
INSERT INTO `wancll_score_logs` VALUES ('95', '17', 'shop', '7000.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 16:55:09', '1', '2018-09-01 16:55:09', '2018-09-01 16:55:09');
INSERT INTO `wancll_score_logs` VALUES ('96', '18', 'shop', '7000.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 16:56:15', '1', '2018-09-01 16:56:15', '2018-09-01 16:56:15');
INSERT INTO `wancll_score_logs` VALUES ('97', '18', 'shop', '7000.00', '会员完成购物', '会员完成购物，购物时间2018-09-01 16:57:12', '1', '2018-09-01 16:57:12', '2018-09-01 16:57:12');
INSERT INTO `wancll_score_logs` VALUES ('98', '18', 'shop', '7000.00', '会员完成购物', '会员完成购物，购物时间2018-09-03 09:33:08', '1', '2018-09-03 09:33:08', '2018-09-03 09:33:08');
INSERT INTO `wancll_score_logs` VALUES ('99', '18', 'shop', '70.00', '会员完成购物', '会员完成购物，购物时间2018-09-03 09:41:52', '1', '2018-09-03 09:41:52', '2018-09-03 09:41:52');
INSERT INTO `wancll_score_logs` VALUES ('100', '18', 'shop', '7000.00', '会员完成购物', '会员完成购物，购物时间2018-09-03 10:07:01', '1', '2018-09-03 10:07:01', '2018-09-03 10:07:01');
INSERT INTO `wancll_score_logs` VALUES ('101', '18', 'shop', '14000.00', '会员完成购物', '会员完成购物，购物时间2018-09-03 10:08:59', '1', '2018-09-03 10:08:59', '2018-09-03 10:08:59');
INSERT INTO `wancll_score_logs` VALUES ('102', '17', 'shop', '63.00', '会员完成购物', '会员完成购物，购物时间2018-09-03 10:41:24', '1', '2018-09-03 10:41:24', '2018-09-03 10:41:24');
INSERT INTO `wancll_score_logs` VALUES ('103', '17', 'shop', '4900.00', '会员完成购物', '会员完成购物，购物时间2018-09-03 11:02:30', '1', '2018-09-03 11:02:30', '2018-09-03 11:02:30');
INSERT INTO `wancll_score_logs` VALUES ('104', '17', 'shop', '3500.00', '会员完成购物', '会员完成购物，购物时间2018-09-03 11:02:39', '1', '2018-09-03 11:02:39', '2018-09-03 11:02:39');
INSERT INTO `wancll_score_logs` VALUES ('105', '17', 'score_shop', '99.00', '积分兑换', '积分兑换商品，购物时间2018-09-03 11:24:46', '1', '2018-09-03 11:24:46', '2018-09-03 11:24:46');
INSERT INTO `wancll_score_logs` VALUES ('106', '17', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-09-03 11:30:10', '1', '2018-09-03 11:30:10', '2018-09-03 11:30:10');
INSERT INTO `wancll_score_logs` VALUES ('107', '2', 'shop', '7000.00', '会员完成购物', '会员完成购物，购物时间2018-09-03 17:43:32', '1', '2018-09-03 17:43:32', '2018-09-03 17:43:32');
INSERT INTO `wancll_score_logs` VALUES ('108', '17', 'score_shop', '1000.00', '积分兑换', '积分兑换商品，购物时间2018-09-03 17:55:33', '1', '2018-09-03 17:55:33', '2018-09-03 17:55:33');
INSERT INTO `wancll_score_logs` VALUES ('109', '2', 'score_shop', '1000.00', '积分兑换', '积分兑换商品，购物时间2018-09-04 09:45:30', '1', '2018-09-04 09:45:30', '2018-09-04 09:45:30');
INSERT INTO `wancll_score_logs` VALUES ('110', '2', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-04 10:34:27', '1', '2018-09-04 10:34:27', '2018-09-04 10:34:27');
INSERT INTO `wancll_score_logs` VALUES ('111', '2', 'shop', '700.00', '会员完成购物', '会员完成购物，购物时间2018-09-04 10:35:22', '1', '2018-09-04 10:35:22', '2018-09-04 10:35:22');
INSERT INTO `wancll_score_logs` VALUES ('112', '14', 'shop', '7700.00', '会员完成购物', '会员完成购物，购物时间2018-09-04 10:41:48', '1', '2018-09-04 10:41:48', '2018-09-04 10:41:48');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_spec_templates`
-- -----------------------------
INSERT INTO `wancll_spec_templates` VALUES ('1', '衣服规格', '', '[{\"name\":\"颜色\",\"options\":[\"白色\",\"黑色\",\"灰色\"]},{\"name\":\"尺寸\",\"options\":[\"S\",\"M\",\"L\"]}]', '0', '1', '2018-07-24 10:47:19', '2018-07-24 10:47:19');
INSERT INTO `wancll_spec_templates` VALUES ('2', '颜色尺寸', '', '[{\"name\":\"颜色\",\"options\":[\"红色\",\"绿色\",\"蓝色\"]}]', '0', '1', '2018-07-28 11:47:50', '2018-07-28 11:47:50');
INSERT INTO `wancll_spec_templates` VALUES ('3', '尺寸', '尺寸', '[{\"name\":\"长度\",\"options\":[\"小于50cm\",\"大于50cm\"]}]', '0', '1', '2018-08-24 08:04:42', '2018-08-24 08:04:42');

-- -----------------------------
-- Table structure for `wancll_test`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_test`;
CREATE TABLE `wancll_test` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `num` varchar(255) DEFAULT NULL,
  `content` text,
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_test`
-- -----------------------------
INSERT INTO `wancll_test` VALUES ('1', '0', '1d3cbb56ed1e0009f4cead38546f52cf', '1', '', '');
INSERT INTO `wancll_test` VALUES ('2', '0', '1d3cbb56ed1e0009f4cead38546f52cf', '1', '2018-09-01 14:56:29', '2018-09-01 14:56:29');
INSERT INTO `wancll_test` VALUES ('3', '0', '1d3cbb56ed1e0009f4cead38546f52cf', '1', '', '');
INSERT INTO `wancll_test` VALUES ('4', '1', '0ee939c710d875c4b95000a53c6dd311', '1', '', '');
INSERT INTO `wancll_test` VALUES ('5', '2', 'f8e70b8079d4c50386257b82f64ea824', '1', '', '');
INSERT INTO `wancll_test` VALUES ('6', '3', '3ddf4e823905def3cd75f47250d0907d', '1', '', '');
INSERT INTO `wancll_test` VALUES ('7', '4', '02b95c75f71adf6dab81a82e201640b7', '1', '', '');
INSERT INTO `wancll_test` VALUES ('8', '5', '28e3e3430d961dafea773fa3e600d163', '1', '', '');
INSERT INTO `wancll_test` VALUES ('9', '6', '5805add5003e7f5ce50cf35692e3064e', '1', '', '');
INSERT INTO `wancll_test` VALUES ('10', '7', '70d17a16b7250af13a175615fb0dae57', '1', '', '');
INSERT INTO `wancll_test` VALUES ('11', '8', '6ab6f1699942b39ee7c6096247cf8c73', '1', '', '');
INSERT INTO `wancll_test` VALUES ('12', '9', '3aeafde0c3dfa4c7605951f95a8e97b0', '1', '', '');
INSERT INTO `wancll_test` VALUES ('13', '10', 'e0cd3d19dc21cf25a23fb16c78ba74a0', '1', '', '');
INSERT INTO `wancll_test` VALUES ('14', '11', 'ccdd9ee2ad4f1d2fd30bff718d20e5ad', '1', '', '');
INSERT INTO `wancll_test` VALUES ('15', '12', '2acb4bbefb9b727cd9f7487963533b32', '1', '', '');
INSERT INTO `wancll_test` VALUES ('16', '13', 'f38ace90c4f0b6bf2f3c7a6f5933830e', '1', '', '');
INSERT INTO `wancll_test` VALUES ('17', '14', '8783d5182afa2f3fad23b6430df5763c', '1', '', '');
INSERT INTO `wancll_test` VALUES ('18', '15', '9bcbfb225b82ec759fecb03b55e1f270', '1', '', '');
INSERT INTO `wancll_test` VALUES ('19', '16', '44bb578ac244eb84a8d177bcb16a4c3e', '1', '', '');
INSERT INTO `wancll_test` VALUES ('20', '17', '7cff054fa361ed2662aa994be6185335', '1', '', '');
INSERT INTO `wancll_test` VALUES ('21', '18', '24ea14475090e98277bfd9979706cc76', '1', '', '');
INSERT INTO `wancll_test` VALUES ('22', '19', 'd7496da655c84f049268d8713c3607fa', '1', '', '');
INSERT INTO `wancll_test` VALUES ('23', '20', '6143ba228f1296fe7678d9241c5d7310', '1', '', '');
INSERT INTO `wancll_test` VALUES ('24', '21', 'c8801d76f8aa808b21bad377c204c201', '1', '', '');
INSERT INTO `wancll_test` VALUES ('25', '22', 'd5c271e6d9ccb360f557152d2786e087', '1', '', '');
INSERT INTO `wancll_test` VALUES ('26', '23', 'db405da8846cad82fda08d5c7eac0cba', '1', '', '');
INSERT INTO `wancll_test` VALUES ('27', '24', 'deb7b2c6a22858c85b34c9652cff0e40', '1', '', '');
INSERT INTO `wancll_test` VALUES ('28', '25', '3a997e8935132e5dd85beb5a28cc615b', '1', '', '');
INSERT INTO `wancll_test` VALUES ('29', '26', '7bc0f9b2ccf4ad234cbe6d15d4dbc280', '1', '', '');
INSERT INTO `wancll_test` VALUES ('30', '27', '42c4605e93f738f2bce5b1ee5a1a3837', '1', '', '');
INSERT INTO `wancll_test` VALUES ('31', '28', 'ac10e6767cff22e8f349ca184fe08994', '1', '', '');
INSERT INTO `wancll_test` VALUES ('32', '29', 'd3b557b8afae222e47faef46347c2fa1', '1', '', '');
INSERT INTO `wancll_test` VALUES ('33', '30', '9780e996f017883d01068ec1759e9a39', '1', '', '');
INSERT INTO `wancll_test` VALUES ('34', '31', '1dbb385d02cc2c48babad08c33549373', '1', '', '');
INSERT INTO `wancll_test` VALUES ('35', '32', '91973efbbbe3de84af5cd73f3b8fb7ea', '1', '', '');
INSERT INTO `wancll_test` VALUES ('36', '33', 'd2e4166b0f752c040118b2006ad0db17', '1', '', '');
INSERT INTO `wancll_test` VALUES ('37', '34', '9ebab4058a5f7520a5c9c6e10eb71b88', '1', '', '');
INSERT INTO `wancll_test` VALUES ('38', '35', 'd3f2a14cdebaf788b8901c6127134adf', '1', '', '');
INSERT INTO `wancll_test` VALUES ('39', '36', 'b6b9a1408eb9a4f3d685419b8b471cbb', '1', '', '');
INSERT INTO `wancll_test` VALUES ('40', '37', '8342e00ff26253f939d6967a0fafd0e2', '1', '', '');
INSERT INTO `wancll_test` VALUES ('41', '38', '37d8c0bf36193841e0aa565e1fc86c3a', '1', '', '');
INSERT INTO `wancll_test` VALUES ('42', '39', 'c716b38c7d2c25158c1303d8d99e1856', '1', '', '');
INSERT INTO `wancll_test` VALUES ('43', '40', 'd47b1b75ac44e493986120a37d4b8e4b', '1', '', '');
INSERT INTO `wancll_test` VALUES ('44', '41', '7c26e4b4e885d846b75df2f9147f5dc9', '1', '', '');
INSERT INTO `wancll_test` VALUES ('45', '42', '8efb56318ca4de6f3cc9f7c302aca3d1', '1', '', '');
INSERT INTO `wancll_test` VALUES ('46', '43', 'e4dd99d95355b36ae921fecf29a2ee28', '1', '', '');
INSERT INTO `wancll_test` VALUES ('47', '44', '04e3e2cea733df28c322d72b450843f9', '1', '', '');
INSERT INTO `wancll_test` VALUES ('48', '45', '6a50edefef0ee006a0fa87af519d4186', '1', '', '');
INSERT INTO `wancll_test` VALUES ('49', '46', 'aa24c654b2b1daf10528806570bccb93', '1', '', '');
INSERT INTO `wancll_test` VALUES ('50', '47', '3090ae47ee70c82911896e50e7fa9b61', '1', '', '');
INSERT INTO `wancll_test` VALUES ('51', '48', '0188fb0c39601f1ed99fbb838ab1fff1', '1', '', '');
INSERT INTO `wancll_test` VALUES ('52', '49', '00f0699696ec8f2908da069b616e3a41', '1', '', '');
INSERT INTO `wancll_test` VALUES ('53', '50', 'd1afe68b163bac2e3d3039bfa361ac29', '1', '', '');
INSERT INTO `wancll_test` VALUES ('54', '51', '3f6a7a5dc9a28989390b1e5710a555fb', '1', '', '');
INSERT INTO `wancll_test` VALUES ('55', '52', '3b3f680f8fc31ca288ba481820182d21', '1', '', '');
INSERT INTO `wancll_test` VALUES ('56', '53', '5a9609e060054ea56c044670d1e70fd4', '1', '', '');
INSERT INTO `wancll_test` VALUES ('57', '54', 'a6f368213ba0ad0ab0875621955bb695', '1', '', '');
INSERT INTO `wancll_test` VALUES ('58', '55', 'ac3a9d0edba01cad127ca49e691d4b96', '1', '', '');
INSERT INTO `wancll_test` VALUES ('59', '56', 'e1a473d761ec43bac30b0bfc3e848164', '1', '', '');
INSERT INTO `wancll_test` VALUES ('60', '57', 'c69ef41e83baba109a85c2876ec543a7', '1', '', '');
INSERT INTO `wancll_test` VALUES ('61', '58', 'd7caae7277e98b73ca356e83fad44bf6', '1', '', '');
INSERT INTO `wancll_test` VALUES ('62', '59', 'cb1039717c338f6db2cfd201cb07fdcf', '1', '', '');
INSERT INTO `wancll_test` VALUES ('63', '60', '3b11a2e49f47914456060ce701f06b4c', '1', '', '');
INSERT INTO `wancll_test` VALUES ('64', '61', 'a8892c03735e22599198f96d622dfc5b', '1', '', '');
INSERT INTO `wancll_test` VALUES ('65', '62', 'acedd1becdc218861aa40748ff2f6a71', '1', '', '');
INSERT INTO `wancll_test` VALUES ('66', '63', 'a4223800b81a79f49407319148e2e458', '1', '', '');
INSERT INTO `wancll_test` VALUES ('67', '64', '77cb3037a468fe383ded63fdd0563abd', '1', '', '');
INSERT INTO `wancll_test` VALUES ('68', '65', 'eb9f2c6b3df7f9f2079cb51e84f4a10a', '1', '', '');
INSERT INTO `wancll_test` VALUES ('69', '66', '1c12d8cf0a520a4bfef87a8d31626b3d', '1', '', '');
INSERT INTO `wancll_test` VALUES ('70', '67', '3a4f708bc635edb111854e6f2cfd7277', '1', '', '');
INSERT INTO `wancll_test` VALUES ('71', '68', '6f5014578f55ff3f8f75d80d6e276047', '1', '', '');
INSERT INTO `wancll_test` VALUES ('72', '69', 'a6aaebbe74a5c5e0e08719282c4b021b', '1', '', '');
INSERT INTO `wancll_test` VALUES ('73', '70', '031e87951a1f00132edd42d2ed62fad7', '1', '', '');
INSERT INTO `wancll_test` VALUES ('74', '71', '592ebe0e8b96dabaffa64b51de6dc362', '1', '', '');
INSERT INTO `wancll_test` VALUES ('75', '72', '73a483e8938e86d096d95519f90e6373', '1', '', '');
INSERT INTO `wancll_test` VALUES ('76', '73', '669aaa857c02f8cf6ce36fee6bfaa37c', '1', '', '');
INSERT INTO `wancll_test` VALUES ('77', '74', 'ca0ff356dc77bd7594ff0fe13af1be7e', '1', '', '');
INSERT INTO `wancll_test` VALUES ('78', '75', '600432796135fcc2bfae0f46500c0f88', '1', '', '');
INSERT INTO `wancll_test` VALUES ('79', '76', '0086ac8ca6f662dfa48c3616ac44f62a', '1', '', '');
INSERT INTO `wancll_test` VALUES ('80', '77', 'b02fdcaf04c1b4b77f271611900113c4', '1', '', '');
INSERT INTO `wancll_test` VALUES ('81', '78', 'd0a745fe5755288e72e8ee9d6b61723f', '1', '', '');
INSERT INTO `wancll_test` VALUES ('82', '79', '1c622279d3d9411571d1c3be72ecbc07', '1', '', '');
INSERT INTO `wancll_test` VALUES ('83', '80', '221416313ea031dd0fb76b71b0e0eafb', '1', '', '');
INSERT INTO `wancll_test` VALUES ('84', '81', 'fc912721aba77103d6c8aa4b45fd6d26', '1', '', '');
INSERT INTO `wancll_test` VALUES ('85', '82', 'b7a77e9524d9374350a2dd47d593bd4f', '1', '', '');
INSERT INTO `wancll_test` VALUES ('86', '83', '378b4d10c3316ee0339ebcb6dd82d4c4', '1', '', '');
INSERT INTO `wancll_test` VALUES ('87', '84', 'b2ad4d5369b72987fd997b2f95eccfad', '1', '', '');
INSERT INTO `wancll_test` VALUES ('88', '85', 'c9f5f3fcf26edc298e3b165c5d2fd021', '1', '', '');
INSERT INTO `wancll_test` VALUES ('89', '86', 'fae35a6f29a819cce5efb90e02fe6718', '1', '', '');
INSERT INTO `wancll_test` VALUES ('90', '87', 'a5f22ae5a5761094dce7b8c425955ba0', '1', '', '');
INSERT INTO `wancll_test` VALUES ('91', '88', 'f7973817207125c5b5aca3852f5d4bfe', '1', '', '');
INSERT INTO `wancll_test` VALUES ('92', '89', '7c35b8d2b1d86cd105b3ca6b338fd3a7', '1', '', '');
INSERT INTO `wancll_test` VALUES ('93', '90', 'e6e71bc34c2535fbdb58cb613a8debee', '1', '', '');
INSERT INTO `wancll_test` VALUES ('94', '91', '2a831faf9eb7bbe42caf981f974037f9', '1', '', '');
INSERT INTO `wancll_test` VALUES ('95', '92', 'f851242f70f4602d0a866719365288c9', '1', '', '');
INSERT INTO `wancll_test` VALUES ('96', '93', '373db4016155e171c1e535b171d730cf', '1', '', '');
INSERT INTO `wancll_test` VALUES ('97', '94', '1f74b5a7951792489a124fb36fc5913e', '1', '', '');
INSERT INTO `wancll_test` VALUES ('98', '95', '6742fbebff18aecf5964c1ba49d08009', '1', '', '');
INSERT INTO `wancll_test` VALUES ('99', '96', '93d5088e18d334600f34be4b8334266c', '1', '', '');
INSERT INTO `wancll_test` VALUES ('100', '97', '252a831fdd716955ab8894edb0fde4d1', '1', '', '');
INSERT INTO `wancll_test` VALUES ('101', '98', '361a2db1fedaec7ba6166bf373c0d39b', '1', '', '');
INSERT INTO `wancll_test` VALUES ('102', '99', '13d045d78b019fbc8cf58123ba8b141b', '1', '', '');

-- -----------------------------
-- Table structure for `wancll_timed_task_logs`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_timed_task_logs`;
CREATE TABLE `wancll_timed_task_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) NOT NULL COMMENT '任务id',
  `warn_code` tinyint(4) DEFAULT '0' COMMENT '警告码；0执行成功',
  `desc` varchar(255) DEFAULT NULL COMMENT '任务执行情况描述',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `wancll_timed_tasks`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_timed_tasks`;
CREATE TABLE `wancll_timed_tasks` (
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

-- -----------------------------
-- Records of `wancll_timed_tasks`
-- -----------------------------
INSERT INTO `wancll_timed_tasks` VALUES ('1', '自动取消订单', '每天检测一次，对下订单满规定天数仍未支付的订单，系统自动取消该订单。', 'day', '1', 'CancelOrders', '2018-08-24 23:00:00', '0', '5b7f712b8b1ca', '2', '1', '2018-07-19 22:07:21', '2018-08-24 10:44:59');
INSERT INTO `wancll_timed_tasks` VALUES ('2', '自动删除订单', '每天检测一次，对已取消的订单满规定天数后，系统自动删除该订单。', 'day', '1', 'DeleteOrders', '2018-08-24 23:10:00', '0', '5b7f712b8b1ca', '2', '1', '2018-07-19 22:11:59', '2018-08-24 10:44:59');
INSERT INTO `wancll_timed_tasks` VALUES ('3', '自动签收订单', '每天检测一次，对已发货的订单满规定天数会员仍未进行签收的订单，系统自动签收该订单。', 'day', '1', 'SignOrders', '2018-08-24 23:20:00', '0', '5b7f712b8b1ca', '2', '1', '2018-07-19 22:14:49', '2018-08-24 10:44:59');
INSERT INTO `wancll_timed_tasks` VALUES ('4', '团购处理时限', '对已到结束时间，仍未完成的拼团的订单，自动结束该团。', 'minute', '1', 'GroupBuyTimeLimits', '2018-08-24 10:45:00', '0', '5b7f712b8b1ca', '2', '1', '2018-07-19 22:26:17', '2018-08-24 10:44:59');
INSERT INTO `wancll_timed_tasks` VALUES ('5', '团购自动退款', '每天检测一次，对团购中未完成拼团的订单，自动退款。', 'day', '1', 'GroupBuyReturnMoney', '2018-08-25 08:00:00', '0', '5b7f712b8b1ca', '2', '1', '2018-07-19 22:33:04', '2018-08-24 10:44:59');

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_accounts`
-- -----------------------------
INSERT INTO `wancll_user_accounts` VALUES ('1', '18888888888', 'e6297b585db794e177808f8953b46669', 'e6297b585db794e177808f8953b46669', '', '', '1', '1', '2018-07-20 09:35:36', '2018-07-20 09:35:42');
INSERT INTO `wancll_user_accounts` VALUES ('2', '15580841403', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '2', '1', '2018-07-23 15:25:59', '2018-07-23 15:26:10');
INSERT INTO `wancll_user_accounts` VALUES ('3', '15581646116', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '3', '1', '2018-07-25 10:42:12', '2018-07-28 09:49:35');
INSERT INTO `wancll_user_accounts` VALUES ('4', '15581646117', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '4', '1', '2018-07-28 09:19:25', '2018-07-28 09:20:45');
INSERT INTO `wancll_user_accounts` VALUES ('5', '18390916324', '88c2956827ef2617aaf45689b90b0b9c', '88c2956827ef2617aaf45689b90b0b9c', '', '', '5', '1', '2018-07-28 10:50:06', '2018-07-28 10:50:18');
INSERT INTO `wancll_user_accounts` VALUES ('6', '18111111111', 'b5305e8c4c5e08c246943fe736701525', 'e6297b585db794e177808f8953b46669', '', '', '6', '1', '2018-07-28 14:45:41', '2018-07-31 14:09:01');
INSERT INTO `wancll_user_accounts` VALUES ('7', '18175974828', '58ea7ee5188b7ea946b66cff50bf5e82', '58ea7ee5188b7ea946b66cff50bf5e82', '', '', '7', '1', '2018-07-30 09:04:51', '2018-07-30 11:19:13');
INSERT INTO `wancll_user_accounts` VALUES ('8', '18133333333', '58ea7ee5188b7ea946b66cff50bf5e82', '58ea7ee5188b7ea946b66cff50bf5e82', '', '', '8', '1', '2018-07-30 11:37:02', '2018-07-30 11:37:11');
INSERT INTO `wancll_user_accounts` VALUES ('9', '13300000001', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '9', '1', '2018-08-03 15:10:02', '2018-08-03 15:10:14');
INSERT INTO `wancll_user_accounts` VALUES ('10', '13300000002', 'e6297b585db794e177808f8953b46669', 'e6297b585db794e177808f8953b46669', '', '', '10', '1', '2018-08-03 15:11:19', '2018-08-03 15:11:29');
INSERT INTO `wancll_user_accounts` VALUES ('11', '17621502221', 'e6297b585db794e177808f8953b46669', 'e6297b585db794e177808f8953b46669', '', '', '11', '1', '2018-08-04 17:16:05', '2018-08-04 17:16:20');
INSERT INTO `wancll_user_accounts` VALUES ('12', '15071357527', 'b5305e8c4c5e08c246943fe736701525', '97847b5f59bd4026532c27d5cf51b3c5', '', '', '12', '1', '2018-08-23 23:17:50', '2018-08-23 23:18:27');
INSERT INTO `wancll_user_accounts` VALUES ('13', '15071357528', 'b5305e8c4c5e08c246943fe736701525', '97847b5f59bd4026532c27d5cf51b3c5', '', '', '13', '1', '2018-08-24 12:49:06', '2018-08-24 12:49:26');
INSERT INTO `wancll_user_accounts` VALUES ('14', '13874930708', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '14', '1', '2018-08-31 14:49:53', '2018-09-04 10:41:57');
INSERT INTO `wancll_user_accounts` VALUES ('15', '13874930709', 'b5305e8c4c5e08c246943fe736701525', '', '', '', '15', '1', '2018-08-31 14:53:56', '2018-09-04 10:39:01');
INSERT INTO `wancll_user_accounts` VALUES ('16', '13787294506', 'b5305e8c4c5e08c246943fe736701525', '', '', '', '16', '1', '2018-08-31 15:11:47', '2018-08-31 15:11:47');
INSERT INTO `wancll_user_accounts` VALUES ('17', '13800000001', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '17', '1', '2018-08-31 16:41:58', '2018-08-31 16:42:08');
INSERT INTO `wancll_user_accounts` VALUES ('18', '13800000002', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '18', '1', '2018-08-31 17:01:44', '2018-08-31 17:01:51');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_apply_bonus`
-- -----------------------------
INSERT INTO `wancll_user_apply_bonus` VALUES ('1', '17', '', '', '2018-08-31 16:59:40', '1', '2018-08-31 17:01:30', '3', '1', '2018-08-31 16:59:40', '2018-08-31 17:01:30');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_apply_distributor`
-- -----------------------------
INSERT INTO `wancll_user_apply_distributor` VALUES ('1', '12', '', '', '2018-08-24 14:16:18', '1', '2018-08-24 14:17:05', '3', '1', '2018-08-24 14:16:18', '2018-08-24 14:17:05');
INSERT INTO `wancll_user_apply_distributor` VALUES ('2', '2', '', '', '2018-08-31 16:07:01', '1', '2018-08-31 16:33:22', '3', '1', '2018-08-31 16:07:01', '2018-08-31 16:33:22');
INSERT INTO `wancll_user_apply_distributor` VALUES ('3', '17', '', '', '2018-08-31 16:59:33', '1', '2018-08-31 17:01:37', '3', '1', '2018-08-31 16:59:33', '2018-08-31 17:01:37');

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
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_asset_logs`
-- -----------------------------
INSERT INTO `wancll_user_asset_logs` VALUES ('1', '3', 'money', 'user_money_recharge', '10000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-07-27 19:41:35', '2018-07-27 19:41:35');
INSERT INTO `wancll_user_asset_logs` VALUES ('2', '2', 'money', 'user_money_recharge', '10000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-07-27 19:41:41', '2018-07-27 19:41:41');
INSERT INTO `wancll_user_asset_logs` VALUES ('3', '1', 'money', 'user_money_recharge', '10000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-07-27 19:41:46', '2018-07-27 19:41:46');
INSERT INTO `wancll_user_asset_logs` VALUES ('4', '2', 'money', 'user_pay', '2999.00', '购物支付【N2018072719422340746】', '会员购物扣款，订单号：N2018072719422340746', '1', '2018-07-27 19:42:35', '2018-07-27 19:42:35');
INSERT INTO `wancll_user_asset_logs` VALUES ('5', '2', 'money', 'user_pay', '80.00', '购物支付【N2018072809414099589】', '会员购物扣款，订单号：N2018072809414099589', '1', '2018-07-28 09:41:48', '2018-07-28 09:41:48');
INSERT INTO `wancll_user_asset_logs` VALUES ('6', '3', 'money', 'user_pay', '80.00', '购物支付【N2018072809415644371】', '会员购物扣款，订单号：N2018072809415644371', '1', '2018-07-28 09:50:01', '2018-07-28 09:50:01');
INSERT INTO `wancll_user_asset_logs` VALUES ('7', '3', 'money', 'user_pay', '80.00', '购物支付【N2018072809592943162】', '会员购物扣款，订单号：N2018072809592943162', '1', '2018-07-28 09:59:50', '2018-07-28 09:59:50');
INSERT INTO `wancll_user_asset_logs` VALUES ('8', '4', 'money', 'user_money_recharge', '10000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-07-28 10:01:55', '2018-07-28 10:01:55');
INSERT INTO `wancll_user_asset_logs` VALUES ('9', '4', 'money', 'user_pay', '80.00', '购物支付【N2018072810010697717】', '会员购物扣款，订单号：N2018072810010697717', '1', '2018-07-28 10:02:02', '2018-07-28 10:02:02');
INSERT INTO `wancll_user_asset_logs` VALUES ('10', '5', 'money', 'user_money_recharge', '10000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-07-28 10:51:47', '2018-07-28 10:51:47');
INSERT INTO `wancll_user_asset_logs` VALUES ('11', '5', 'money', 'user_pay', '2999.00', '购物支付【N2018072810511564134】', '会员购物扣款，订单号：N2018072810511564134', '1', '2018-07-28 10:52:23', '2018-07-28 10:52:23');
INSERT INTO `wancll_user_asset_logs` VALUES ('12', '2', 'money', 'user_pay', '2999.00', '购物支付【N2018072811495302079】', '会员购物扣款，订单号：N2018072811495302079', '1', '2018-07-28 11:50:02', '2018-07-28 11:50:02');
INSERT INTO `wancll_user_asset_logs` VALUES ('13', '5', 'money', 'user_pay', '10.00', '购物支付【N2018072814244033540】', '会员购物扣款，订单号：N2018072814244033540', '1', '2018-07-28 14:25:01', '2018-07-28 14:25:01');
INSERT INTO `wancll_user_asset_logs` VALUES ('14', '5', 'money', 'user_pay', '99.00', '购物支付【N2018072814430729685】', '会员购物扣款，订单号：N2018072814430729685', '1', '2018-07-28 14:43:20', '2018-07-28 14:43:20');
INSERT INTO `wancll_user_asset_logs` VALUES ('15', '6', 'money', 'user_money_recharge', '5000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-07-28 14:46:11', '2018-07-28 14:46:11');
INSERT INTO `wancll_user_asset_logs` VALUES ('16', '6', 'money', 'user_pay', '99.00', '购物支付【N2018072814471805576】', '会员购物扣款，订单号：N2018072814471805576', '1', '2018-07-28 14:47:29', '2018-07-28 14:47:29');
INSERT INTO `wancll_user_asset_logs` VALUES ('17', '6', 'money', 'user_pay', '99.00', '购物支付【N2018072814484323952】', '会员购物扣款，订单号：N2018072814484323952', '1', '2018-07-28 14:48:54', '2018-07-28 14:48:54');
INSERT INTO `wancll_user_asset_logs` VALUES ('18', '3', 'money', 'user_pay', '2999.00', '购物支付【N2018072815015716158】', '会员购物扣款，订单号：N2018072815015716158', '1', '2018-07-28 15:02:08', '2018-07-28 15:02:08');
INSERT INTO `wancll_user_asset_logs` VALUES ('19', '5', 'money', 'user_pay', '198.00', '购物支付【N2018072815055961690】', '会员购物扣款，订单号：N2018072815055961690', '1', '2018-07-28 15:06:18', '2018-07-28 15:06:18');
INSERT INTO `wancll_user_asset_logs` VALUES ('20', '6', 'money', 'user_pay', '198.00', '购物支付【N2018072815064525328】', '会员购物扣款，订单号：N2018072815064525328', '1', '2018-07-28 15:06:57', '2018-07-28 15:06:57');
INSERT INTO `wancll_user_asset_logs` VALUES ('21', '3', 'money', 'user_pay', '2999.00', '购物支付【N2018072815111042065】', '会员购物扣款，订单号：N2018072815111042065', '1', '2018-07-28 15:12:03', '2018-07-28 15:12:03');
INSERT INTO `wancll_user_asset_logs` VALUES ('22', '7', 'money', 'user_money_recharge', '10000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-07-30 11:17:22', '2018-07-30 11:17:22');
INSERT INTO `wancll_user_asset_logs` VALUES ('23', '7', 'money', 'user_pay', '10.00', '购物支付【N2018073011175148135】', '会员购物扣款，订单号：N2018073011175148135', '1', '2018-07-30 11:19:35', '2018-07-30 11:19:35');
INSERT INTO `wancll_user_asset_logs` VALUES ('24', '7', 'money', 'user_pay', '99.00', '购物支付【N2018073011371956779】', '会员购物扣款，订单号：N2018073011371956779', '1', '2018-07-30 11:37:45', '2018-07-30 11:37:45');
INSERT INTO `wancll_user_asset_logs` VALUES ('25', '8', 'money', 'user_money_recharge', '10000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-07-30 11:54:21', '2018-07-30 11:54:21');
INSERT INTO `wancll_user_asset_logs` VALUES ('26', '8', 'money', 'user_pay', '999.00', '购物支付【N2018073011543436272】', '会员购物扣款，订单号：N2018073011543436272', '1', '2018-07-30 11:54:42', '2018-07-30 11:54:42');
INSERT INTO `wancll_user_asset_logs` VALUES ('27', '7', 'money', 'user_pay', '999.00', '购物支付【N2018073011550224224】', '会员购物扣款，订单号：N2018073011550224224', '1', '2018-07-30 11:55:18', '2018-07-30 11:55:18');
INSERT INTO `wancll_user_asset_logs` VALUES ('28', '7', 'money', 'user_pay', '100.00', '购物支付【N2018073016323083111】', '会员购物扣款，订单号：N2018073016323083111', '1', '2018-07-30 16:48:40', '2018-07-30 16:48:40');
INSERT INTO `wancll_user_asset_logs` VALUES ('29', '7', 'money', 'user_pay', '999.00', '购物支付【N2018073017265430112】', '会员购物扣款，订单号：N2018073017265430112', '1', '2018-07-30 17:27:02', '2018-07-30 17:27:02');
INSERT INTO `wancll_user_asset_logs` VALUES ('30', '7', 'money', 'user_pay', '200.00', '购物支付【N2018073017291751716】', '会员购物扣款，订单号：N2018073017291751716', '1', '2018-07-30 17:30:10', '2018-07-30 17:30:10');
INSERT INTO `wancll_user_asset_logs` VALUES ('31', '8', 'money', 'user_pay', '200.00', '购物支付【N2018073017302324847】', '会员购物扣款，订单号：N2018073017302324847', '1', '2018-07-30 17:30:32', '2018-07-30 17:30:32');
INSERT INTO `wancll_user_asset_logs` VALUES ('32', '5', 'money', 'user_pay', '200.00', '购物支付【N2018073109550017493】', '会员购物扣款，订单号：N2018073109550017493', '1', '2018-07-31 09:55:22', '2018-07-31 09:55:22');
INSERT INTO `wancll_user_asset_logs` VALUES ('33', '7', 'money', 'user_pay', '200.00', '购物支付【N2018073109565111927】', '会员购物扣款，订单号：N2018073109565111927', '1', '2018-07-31 09:57:07', '2018-07-31 09:57:07');
INSERT INTO `wancll_user_asset_logs` VALUES ('34', '5', 'money', 'user_pay_return', '2999.00', '订单退款【G2018072814225710433】', '会员申请订单退款，退款订单号：G2018072814225710433', '1', '2018-07-31 10:56:50', '2018-07-31 10:56:50');
INSERT INTO `wancll_user_asset_logs` VALUES ('35', '2', 'money', 'user_pay', '10.00', '购物支付【N2018073114053293607】', '会员购物扣款，订单号：N2018073114053293607', '1', '2018-07-31 14:05:40', '2018-07-31 14:05:40');
INSERT INTO `wancll_user_asset_logs` VALUES ('36', '6', 'money', 'user_pay', '10.00', '购物支付【N2018073114081870866】', '会员购物扣款，订单号：N2018073114081870866', '1', '2018-07-31 14:09:19', '2018-07-31 14:09:19');
INSERT INTO `wancll_user_asset_logs` VALUES ('37', '2', 'money', 'user_pay', '100.00', '购物支付【N2018073114123072510】', '会员购物扣款，订单号：N2018073114123072510', '1', '2018-07-31 14:12:45', '2018-07-31 14:12:45');
INSERT INTO `wancll_user_asset_logs` VALUES ('38', '2', 'money', 'user_pay', '10.00', '购物支付【N2018073114160029508】', '会员购物扣款，订单号：N2018073114160029508', '1', '2018-07-31 14:16:15', '2018-07-31 14:16:15');
INSERT INTO `wancll_user_asset_logs` VALUES ('39', '2', 'money', 'user_pay', '15.00', '购物支付【N2018073114235312913】', '会员购物扣款，订单号：N2018073114235312913', '1', '2018-07-31 14:24:02', '2018-07-31 14:24:02');
INSERT INTO `wancll_user_asset_logs` VALUES ('40', '2', 'money', 'user_pay', '15.00', '购物支付【N2018073114501336543】', '会员购物扣款，订单号：N2018073114501336543', '1', '2018-07-31 14:50:23', '2018-07-31 14:50:23');
INSERT INTO `wancll_user_asset_logs` VALUES ('41', '2', 'money', 'user_pay', '15.00', '购物支付【N2018073115035239276】', '会员购物扣款，订单号：N2018073115035239276', '1', '2018-07-31 15:03:59', '2018-07-31 15:03:59');
INSERT INTO `wancll_user_asset_logs` VALUES ('42', '2', 'money', 'user_pay', '10.00', '购物支付【N2018073118185685994】', '会员购物扣款，订单号：N2018073118185685994', '1', '2018-07-31 18:19:03', '2018-07-31 18:19:03');
INSERT INTO `wancll_user_asset_logs` VALUES ('43', '2', 'money', 'user_pay_return', '15.00', '订单退款【G2018073115043681313】', '会员申请订单退款，退款订单号：G2018073115043681313', '1', '2018-07-31 18:20:01', '2018-07-31 18:20:01');
INSERT INTO `wancll_user_asset_logs` VALUES ('44', '5', 'money', 'user_pay', '15.00', '购物支付【N2018080110150312496】', '会员购物扣款，订单号：N2018080110150312496', '1', '2018-08-01 10:15:12', '2018-08-01 10:15:12');
INSERT INTO `wancll_user_asset_logs` VALUES ('45', '5', 'money', 'user_pay', '10.00', '购物支付【N2018080116091321457】', '会员购物扣款，订单号：N2018080116091321457', '1', '2018-08-04 09:47:41', '2018-08-04 09:47:41');
INSERT INTO `wancll_user_asset_logs` VALUES ('46', '5', 'money', 'user_pay', '3299.00', '购物支付【N2018080417384543005】', '会员购物扣款，订单号：N2018080417384543005', '1', '2018-08-04 17:38:52', '2018-08-04 17:38:52');
INSERT INTO `wancll_user_asset_logs` VALUES ('47', '7', 'money', 'user_pay', '100.00', '购物支付【N2018081009130890529】', '会员购物扣款，订单号：N2018081009130890529', '1', '2018-08-10 09:13:14', '2018-08-10 09:13:14');
INSERT INTO `wancll_user_asset_logs` VALUES ('48', '12', 'money', 'user_money_recharge', '1000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-08-24 11:33:13', '2018-08-24 11:33:13');
INSERT INTO `wancll_user_asset_logs` VALUES ('49', '12', 'money', 'user_pay', '130.00', '购物支付【N2018082411314288617】', '会员购物扣款，订单号：N2018082411314288617', '1', '2018-08-24 11:33:51', '2018-08-24 11:33:51');
INSERT INTO `wancll_user_asset_logs` VALUES ('50', '12', 'money', 'user_pay', '130.00', '购物支付【N2018082411475046875】', '会员购物扣款，订单号：N2018082411475046875', '1', '2018-08-24 11:48:07', '2018-08-24 11:48:07');
INSERT INTO `wancll_user_asset_logs` VALUES ('51', '12', 'money', 'user_pay', '100.00', '购物支付【N2018082411482666846】', '会员购物扣款，订单号：N2018082411482666846', '1', '2018-08-24 11:48:34', '2018-08-24 11:48:34');
INSERT INTO `wancll_user_asset_logs` VALUES ('52', '12', 'money', 'user_pay', '100.00', '购物支付【N2018082411485475541】', '会员购物扣款，订单号：N2018082411485475541', '1', '2018-08-24 11:49:03', '2018-08-24 11:49:03');
INSERT INTO `wancll_user_asset_logs` VALUES ('53', '12', 'money', 'user_pay', '100.00', '购物支付【N2018082411494299937】', '会员购物扣款，订单号：N2018082411494299937', '1', '2018-08-24 11:49:50', '2018-08-24 11:49:50');
INSERT INTO `wancll_user_asset_logs` VALUES ('54', '12', 'money', 'user_pay', '130.00', '购物支付【N2018082411560301646】', '会员购物扣款，订单号：N2018082411560301646', '1', '2018-08-24 11:56:14', '2018-08-24 11:56:14');
INSERT INTO `wancll_user_asset_logs` VALUES ('55', '12', 'money', 'user_pay_return', '100.00', '订单退款【G2018082411544185159】', '会员申请订单退款，退款订单号：G2018082411544185159', '1', '2018-08-24 12:04:14', '2018-08-24 12:04:14');
INSERT INTO `wancll_user_asset_logs` VALUES ('56', '12', 'money', 'user_pay', '130.00', '购物支付【N2018082413384250201】', '会员购物扣款，订单号：N2018082413384250201', '1', '2018-08-24 13:38:55', '2018-08-24 13:38:55');
INSERT INTO `wancll_user_asset_logs` VALUES ('57', '2', 'money', 'user_money_recharge', '100000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-08-25 14:37:49', '2018-08-25 14:37:49');
INSERT INTO `wancll_user_asset_logs` VALUES ('58', '2', 'money', 'user_pay', '110.00', '购物支付【N2018083114211246626】', '会员购物扣款，订单号：N2018083114211246626', '1', '2018-08-31 14:21:18', '2018-08-31 14:21:18');
INSERT INTO `wancll_user_asset_logs` VALUES ('59', '2', 'money', 'user_pay', '110.00', '购物支付【N2018083114221350514】', '会员购物扣款，订单号：N2018083114221350514', '1', '2018-08-31 14:22:18', '2018-08-31 14:22:18');
INSERT INTO `wancll_user_asset_logs` VALUES ('60', '2', 'money', 'user_pay', '110.00', '购物支付【N2018083114475592342】', '会员购物扣款，订单号：N2018083114475592342', '1', '2018-08-31 14:48:02', '2018-08-31 14:48:02');
INSERT INTO `wancll_user_asset_logs` VALUES ('61', '14', 'money', 'user_money_recharge', '100000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-08-31 14:56:00', '2018-08-31 14:56:00');
INSERT INTO `wancll_user_asset_logs` VALUES ('62', '2', 'money', 'user_pay', '130.00', '购物支付【N2018083115073402711】', '会员购物扣款，订单号：N2018083115073402711', '1', '2018-08-31 15:07:39', '2018-08-31 15:07:39');
INSERT INTO `wancll_user_asset_logs` VALUES ('63', '2', 'money', 'user_pay', '130.00', '购物支付【N2018083115112234969】', '会员购物扣款，订单号：N2018083115112234969', '1', '2018-08-31 15:11:27', '2018-08-31 15:11:27');
INSERT INTO `wancll_user_asset_logs` VALUES ('64', '2', 'money', 'user_pay', '130.00', '购物支付【N2018083115111776250】', '会员购物扣款，订单号：N2018083115111776250', '1', '2018-08-31 15:12:54', '2018-08-31 15:12:54');
INSERT INTO `wancll_user_asset_logs` VALUES ('65', '2', 'money', 'user_pay', '110.00', '购物支付【N2018083115155177983】', '会员购物扣款，订单号：N2018083115155177983', '1', '2018-08-31 15:15:56', '2018-08-31 15:15:56');
INSERT INTO `wancll_user_asset_logs` VALUES ('66', '12', 'money', 'user_pay', '200.00', '购物支付【N2018083115185842362】', '会员购物扣款，订单号：N2018083115185842362', '1', '2018-08-31 15:19:08', '2018-08-31 15:19:08');
INSERT INTO `wancll_user_asset_logs` VALUES ('67', '2', 'money', 'user_pay', '3299.00', '购物支付【N2018081414345837816】', '会员购物扣款，订单号：N2018081414345837816', '1', '2018-08-31 15:39:45', '2018-08-31 15:39:45');
INSERT INTO `wancll_user_asset_logs` VALUES ('68', '2', 'money', 'user_pay', '100.00', '购物支付【N2018080716172856257】', '会员购物扣款，订单号：N2018080716172856257', '1', '2018-08-31 15:39:55', '2018-08-31 15:39:55');
INSERT INTO `wancll_user_asset_logs` VALUES ('69', '2', 'money', 'user_drawcash', '1.00', '申请提现扣款【D2018083115401939916】', '会员申请提现，系统自动扣款，提现申请单号【D2018083115401939916】', '1', '2018-08-31 15:40:19', '2018-08-31 15:40:19');
INSERT INTO `wancll_user_asset_logs` VALUES ('70', '2', 'money', 'user_pay', '2000.00', '购物支付【N2018083115440588797】', '会员购物扣款，订单号：N2018083115440588797', '1', '2018-08-31 15:44:14', '2018-08-31 15:44:14');
INSERT INTO `wancll_user_asset_logs` VALUES ('71', '2', 'money', 'user_pay', '16825.00', '购物支付【N2018083116341843349】', '会员购物扣款，订单号：N2018083116341843349', '1', '2018-08-31 16:34:29', '2018-08-31 16:34:29');
INSERT INTO `wancll_user_asset_logs` VALUES ('72', '2', 'money', 'user_pay', '3309.00', '购物支付【N2018083116373971696】', '会员购物扣款，订单号：N2018083116373971696', '1', '2018-08-31 16:37:46', '2018-08-31 16:37:46');
INSERT INTO `wancll_user_asset_logs` VALUES ('73', '17', 'money', 'user_money_recharge', '100000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-08-31 16:42:26', '2018-08-31 16:42:26');
INSERT INTO `wancll_user_asset_logs` VALUES ('74', '17', 'money', 'user_pay', '100.00', '购物支付【N2018083116425380197】', '会员购物扣款，订单号：N2018083116425380197', '1', '2018-08-31 16:42:58', '2018-08-31 16:42:58');
INSERT INTO `wancll_user_asset_logs` VALUES ('75', '17', 'money', 'user_pay', '100.00', '购物支付【N2018083116445956017】', '会员购物扣款，订单号：N2018083116445956017', '1', '2018-08-31 16:45:03', '2018-08-31 16:45:03');
INSERT INTO `wancll_user_asset_logs` VALUES ('76', '17', 'money', 'user_pay', '100.00', '购物支付【N2018083116461894679】', '会员购物扣款，订单号：N2018083116461894679', '1', '2018-08-31 16:46:33', '2018-08-31 16:46:33');
INSERT INTO `wancll_user_asset_logs` VALUES ('77', '17', 'money', 'user_pay', '100.00', '购物支付【N2018083116461265414】', '会员购物扣款，订单号：N2018083116461265414', '1', '2018-08-31 16:47:28', '2018-08-31 16:47:28');
INSERT INTO `wancll_user_asset_logs` VALUES ('78', '18', 'money', 'user_money_recharge', '1000001.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-08-31 17:03:08', '2018-08-31 17:03:08');
INSERT INTO `wancll_user_asset_logs` VALUES ('79', '18', 'money', 'user_pay', '3309.00', '购物支付【N2018083117035202763】', '会员购物扣款，订单号：N2018083117035202763', '1', '2018-08-31 17:03:58', '2018-08-31 17:03:58');
INSERT INTO `wancll_user_asset_logs` VALUES ('80', '2', 'money', 'user_pay_return', '100.00', '订单退款【G2018083116344141302】', '会员申请订单退款，退款订单号：G2018083116344141302', '1', '2018-08-31 17:05:04', '2018-08-31 17:05:04');
INSERT INTO `wancll_user_asset_logs` VALUES ('81', '18', 'money', 'user_pay_return', '3309.00', '订单退款【G2018083117053632308】', '会员申请订单退款，退款订单号：G2018083117053632308', '1', '2018-08-31 17:05:55', '2018-08-31 17:05:55');
INSERT INTO `wancll_user_asset_logs` VALUES ('82', '2', 'money', 'user_pay', '3309.00', '购物支付【N2018083117075484078】', '会员购物扣款，订单号：N2018083117075484078', '1', '2018-08-31 17:07:58', '2018-08-31 17:07:58');
INSERT INTO `wancll_user_asset_logs` VALUES ('83', '18', 'money', 'user_pay', '3309.00', '购物支付【N2018083117094103957】', '会员购物扣款，订单号：N2018083117094103957', '1', '2018-08-31 17:09:45', '2018-08-31 17:09:45');
INSERT INTO `wancll_user_asset_logs` VALUES ('84', '17', 'money', 'user_pay', '3309.00', '购物支付【N2018083117473002159】', '会员购物扣款，订单号：N2018083117473002159', '1', '2018-08-31 17:47:34', '2018-08-31 17:47:34');
INSERT INTO `wancll_user_asset_logs` VALUES ('85', '2', 'money', 'user_pay_return', '3309.00', '订单退款【G2018083117082546665】', '会员申请订单退款，退款订单号：G2018083117082546665', '1', '2018-08-31 17:52:17', '2018-08-31 17:52:17');
INSERT INTO `wancll_user_asset_logs` VALUES ('86', '17', 'money', 'user_pay_return', '3309.00', '订单退款【G2018083117475489551】', '会员申请订单退款，退款订单号：G2018083117475489551', '1', '2018-08-31 17:52:33', '2018-08-31 17:52:33');
INSERT INTO `wancll_user_asset_logs` VALUES ('87', '18', 'money', 'user_pay', '3309.00', '购物支付【N2018083117530212617】', '会员购物扣款，订单号：N2018083117530212617', '1', '2018-08-31 17:53:06', '2018-08-31 17:53:06');
INSERT INTO `wancll_user_asset_logs` VALUES ('88', '18', 'money', 'user_pay', '3309.00', '购物支付【N2018083117555081001】', '会员购物扣款，订单号：N2018083117555081001', '1', '2018-08-31 17:55:56', '2018-08-31 17:55:56');
INSERT INTO `wancll_user_asset_logs` VALUES ('89', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090109230438895】', '会员购物扣款，订单号：N2018090109230438895', '1', '2018-09-01 09:23:09', '2018-09-01 09:23:09');
INSERT INTO `wancll_user_asset_logs` VALUES ('90', '18', 'money', 'user_pay', '3309.00', '购物支付【N2018083117554371079】', '会员购物扣款，订单号：N2018083117554371079', '1', '2018-09-01 09:24:28', '2018-09-01 09:24:28');
INSERT INTO `wancll_user_asset_logs` VALUES ('91', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090109374038220】', '会员购物扣款，订单号：N2018090109374038220', '1', '2018-09-01 09:37:45', '2018-09-01 09:37:45');
INSERT INTO `wancll_user_asset_logs` VALUES ('92', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090109440255270】', '会员购物扣款，订单号：N2018090109440255270', '1', '2018-09-01 09:44:06', '2018-09-01 09:44:06');
INSERT INTO `wancll_user_asset_logs` VALUES ('93', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090109510670521】', '会员购物扣款，订单号：N2018090109510670521', '1', '2018-09-01 09:51:11', '2018-09-01 09:51:11');
INSERT INTO `wancll_user_asset_logs` VALUES ('94', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090110263007916】', '会员购物扣款，订单号：N2018090110263007916', '1', '2018-09-01 10:26:36', '2018-09-01 10:26:36');
INSERT INTO `wancll_user_asset_logs` VALUES ('95', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090110282774823】', '会员购物扣款，订单号：N2018090110282774823', '1', '2018-09-01 10:28:36', '2018-09-01 10:28:36');
INSERT INTO `wancll_user_asset_logs` VALUES ('96', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090110295014084】', '会员购物扣款，订单号：N2018090110295014084', '1', '2018-09-01 10:29:57', '2018-09-01 10:29:57');
INSERT INTO `wancll_user_asset_logs` VALUES ('97', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090110314989900】', '会员购物扣款，订单号：N2018090110314989900', '1', '2018-09-01 10:31:57', '2018-09-01 10:31:57');
INSERT INTO `wancll_user_asset_logs` VALUES ('98', '18', 'money', 'user_pay_return', '1000.00', '订单退款【G2018090110322798800】', '会员申请订单退款，退款订单号：G2018090110322798800', '1', '2018-09-01 10:32:39', '2018-09-01 10:32:39');
INSERT INTO `wancll_user_asset_logs` VALUES ('99', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090110330435374】', '会员购物扣款，订单号：N2018090110330435374', '1', '2018-09-01 10:33:09', '2018-09-01 10:33:09');
INSERT INTO `wancll_user_asset_logs` VALUES ('100', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090110331701789】', '会员购物扣款，订单号：N2018090110331701789', '1', '2018-09-01 10:33:21', '2018-09-01 10:33:21');
INSERT INTO `wancll_user_asset_logs` VALUES ('101', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090110342996354】', '会员购物扣款，订单号：N2018090110342996354', '1', '2018-09-01 10:34:35', '2018-09-01 10:34:35');
INSERT INTO `wancll_user_asset_logs` VALUES ('102', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090110351827783】', '会员购物扣款，订单号：N2018090110351827783', '1', '2018-09-01 10:35:22', '2018-09-01 10:35:22');
INSERT INTO `wancll_user_asset_logs` VALUES ('103', '17', 'money', 'user_get_commission', '2661.56', '分销佣金提现【F2018090110433107068】', '会员申请分销提现到钱包', '1', '2018-09-01 10:52:38', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_asset_logs` VALUES ('104', '17', 'money', 'user_pay', '1000.00', '购物支付【N2018090111025069702】', '会员购物扣款，订单号：N2018090111025069702', '1', '2018-09-01 11:02:53', '2018-09-01 11:02:53');
INSERT INTO `wancll_user_asset_logs` VALUES ('105', '17', 'money', 'user_pay', '1000.00', '购物支付【N2018090111104988421】', '会员购物扣款，订单号：N2018090111104988421', '1', '2018-09-01 11:10:54', '2018-09-01 11:10:54');
INSERT INTO `wancll_user_asset_logs` VALUES ('106', '17', 'money', 'user_pay', '1000.00', '购物支付【N2018090111314433432】', '会员购物扣款，订单号：N2018090111314433432', '1', '2018-09-01 11:31:48', '2018-09-01 11:31:48');
INSERT INTO `wancll_user_asset_logs` VALUES ('107', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090111534433336】', '会员购物扣款，订单号：N2018090111534433336', '1', '2018-09-01 11:53:50', '2018-09-01 11:53:50');
INSERT INTO `wancll_user_asset_logs` VALUES ('108', '18', 'money', 'user_pay', '1.00', '购物支付【N2018090113490813780】', '会员购物扣款，订单号：N2018090113490813780', '1', '2018-09-01 13:49:15', '2018-09-01 13:49:15');
INSERT INTO `wancll_user_asset_logs` VALUES ('109', '18', 'money', 'user_pay', '1.00', '购物支付【N2018090113503598026】', '会员购物扣款，订单号：N2018090113503598026', '1', '2018-09-01 13:50:41', '2018-09-01 13:50:41');
INSERT INTO `wancll_user_asset_logs` VALUES ('110', '18', 'money', 'user_drawcash', '1.00', '申请提现扣款【D2018090113541221836】', '会员申请提现，系统自动扣款，提现申请单号【D2018090113541221836】', '1', '2018-09-01 13:54:12', '2018-09-01 13:54:12');
INSERT INTO `wancll_user_asset_logs` VALUES ('111', '18', 'money', 'user_pay', '3309.00', '购物支付【N2018090114035030516】', '会员购物扣款，订单号：N2018090114035030516', '1', '2018-09-01 14:03:56', '2018-09-01 14:03:56');
INSERT INTO `wancll_user_asset_logs` VALUES ('112', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090115494608694】', '会员购物扣款，订单号：N2018090115494608694', '1', '2018-09-01 15:49:50', '2018-09-01 15:49:50');
INSERT INTO `wancll_user_asset_logs` VALUES ('113', '18', 'money', 'user_pay', '1000.00', '购物支付【N2018090115510971701】', '会员购物扣款，订单号：N2018090115510971701', '1', '2018-09-01 15:51:13', '2018-09-01 15:51:13');
INSERT INTO `wancll_user_asset_logs` VALUES ('114', '18', 'money', 'user_money_recharge', '1000000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-09-01 16:06:23', '2018-09-01 16:06:23');
INSERT INTO `wancll_user_asset_logs` VALUES ('115', '18', 'money', 'user_pay', '10000.00', '购物支付【N2018090116114319248】', '会员购物扣款，订单号：N2018090116114319248', '1', '2018-09-01 16:11:47', '2018-09-01 16:11:47');
INSERT INTO `wancll_user_asset_logs` VALUES ('116', '18', 'money', 'user_pay_return', '10000.00', '订单退款【G2018090116115214509】', '会员申请订单退款，退款订单号：G2018090116115214509', '1', '2018-09-01 16:12:30', '2018-09-01 16:12:30');
INSERT INTO `wancll_user_asset_logs` VALUES ('117', '12', 'money', 'user_pay_return', '100.00', '订单退款【G2018083115204162555】', '会员申请订单退款，退款订单号：G2018083115204162555', '1', '2018-09-01 16:12:33', '2018-09-01 16:12:33');
INSERT INTO `wancll_user_asset_logs` VALUES ('118', '12', 'money', 'user_pay_return', '200.00', '订单退款【G2018083115442703581】', '会员申请订单退款，退款订单号：G2018083115442703581', '1', '2018-09-01 16:12:40', '2018-09-01 16:12:40');
INSERT INTO `wancll_user_asset_logs` VALUES ('119', '2', 'money', 'user_get_commission', '4462.35', '分销佣金提现【F2018090116142890123】', '会员申请分销提现到钱包', '1', '2018-09-01 16:14:57', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_asset_logs` VALUES ('120', '17', 'money', 'user_get_commission', '944.85', '分销佣金提现【F2018090116131731918】', '会员申请分销提现到钱包', '1', '2018-09-01 16:15:05', '2018-09-01 16:15:05');
INSERT INTO `wancll_user_asset_logs` VALUES ('121', '2', 'money', 'user_get_bonus', '5545.42', '分红佣金提现【B2018090116143846134】', '会员申请分红提现到钱包', '1', '2018-09-01 16:15:20', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_asset_logs` VALUES ('122', '17', 'money', 'user_get_bonus', '0.00', '分红佣金提现【B2018090116135002593】', '会员申请分红提现到钱包', '1', '2018-09-01 16:15:24', '2018-09-01 16:15:24');
INSERT INTO `wancll_user_asset_logs` VALUES ('123', '17', 'money', 'user_get_bonus', '0.00', '分红佣金提现【B2018090116133887557】', '会员申请分红提现到钱包', '1', '2018-09-01 16:15:27', '2018-09-01 16:15:27');
INSERT INTO `wancll_user_asset_logs` VALUES ('124', '17', 'money', 'user_get_bonus', '1583.82', '分红佣金提现【B2018090116132851326】', '会员申请分红提现到钱包', '1', '2018-09-01 16:15:31', '2018-09-01 16:15:31');
INSERT INTO `wancll_user_asset_logs` VALUES ('125', '17', 'money', 'user_get_bonus', '0.00', '分红佣金提现【B2018090116161713738】', '会员申请分红提现到钱包', '1', '2018-09-01 16:16:31', '2018-09-01 16:16:31');
INSERT INTO `wancll_user_asset_logs` VALUES ('126', '17', 'money', 'user_get_bonus', '2233.62', '分红佣金提现【B2018090110520733630】', '会员申请分红提现到钱包', '1', '2018-09-01 16:41:31', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_asset_logs` VALUES ('127', '17', 'money', 'user_get_bonus', '0.00', '分红佣金提现【B2018090116243431593】', '会员申请分红提现到钱包', '1', '2018-09-01 16:42:21', '2018-09-01 16:42:21');
INSERT INTO `wancll_user_asset_logs` VALUES ('128', '18', 'money', 'user_pay', '10000.00', '购物支付【N2018090116441987108】', '会员购物扣款，订单号：N2018090116441987108', '1', '2018-09-01 16:44:23', '2018-09-01 16:44:23');
INSERT INTO `wancll_user_asset_logs` VALUES ('129', '18', 'money', 'user_pay', '10000.00', '购物支付【N2018090116452383075】', '会员购物扣款，订单号：N2018090116452383075', '1', '2018-09-01 16:45:28', '2018-09-01 16:45:28');
INSERT INTO `wancll_user_asset_logs` VALUES ('130', '18', 'money', 'user_pay', '10000.00', '购物支付【N2018090116503693101】', '会员购物扣款，订单号：N2018090116503693101', '1', '2018-09-01 16:50:40', '2018-09-01 16:50:40');
INSERT INTO `wancll_user_asset_logs` VALUES ('131', '18', 'money', 'user_pay', '70000.00', '购物支付【N2018090116512897499】', '会员购物扣款，订单号：N2018090116512897499', '1', '2018-09-01 16:51:32', '2018-09-01 16:51:32');
INSERT INTO `wancll_user_asset_logs` VALUES ('132', '17', 'money', 'user_pay', '10000.00', '购物支付【N2018090116550979749】', '会员购物扣款，订单号：N2018090116550979749', '1', '2018-09-01 16:55:14', '2018-09-01 16:55:14');
INSERT INTO `wancll_user_asset_logs` VALUES ('133', '17', 'money', 'user_pay_return', '10000.00', '订单退款【G2018090116554436064】', '会员申请订单退款，退款订单号：G2018090116554436064', '1', '2018-09-01 16:55:51', '2018-09-01 16:55:51');
INSERT INTO `wancll_user_asset_logs` VALUES ('134', '18', 'money', 'user_pay', '10000.00', '购物支付【N2018090116561570204】', '会员购物扣款，订单号：N2018090116561570204', '1', '2018-09-01 16:56:19', '2018-09-01 16:56:19');
INSERT INTO `wancll_user_asset_logs` VALUES ('135', '18', 'money', 'user_pay', '10000.00', '购物支付【N2018090116571106669】', '会员购物扣款，订单号：N2018090116571106669', '1', '2018-09-01 16:57:15', '2018-09-01 16:57:15');
INSERT INTO `wancll_user_asset_logs` VALUES ('136', '17', 'money', 'user_get_commission', '13200.00', '分销佣金提现【F2018090309263607136】', '会员申请分销提现到钱包', '1', '2018-09-03 09:27:06', '2018-09-03 09:27:06');
INSERT INTO `wancll_user_asset_logs` VALUES ('137', '2', 'money', 'user_get_commission', '9600.00', '分销佣金提现【F2018090309300604209】', '会员申请分销提现到钱包', '1', '2018-09-03 09:32:20', '2018-09-03 09:32:20');
INSERT INTO `wancll_user_asset_logs` VALUES ('138', '2', 'money', 'user_get_bonus', '24000.00', '分红佣金提现【B2018090309301491738】', '会员申请分红提现到钱包', '1', '2018-09-03 09:32:33', '2018-09-03 09:32:33');
INSERT INTO `wancll_user_asset_logs` VALUES ('139', '17', 'money', 'user_get_bonus', '26200.00', '分红佣金提现【B2018090309262580506】', '会员申请分红提现到钱包', '1', '2018-09-03 09:32:37', '2018-09-03 09:32:37');
INSERT INTO `wancll_user_asset_logs` VALUES ('140', '18', 'money', 'user_pay', '10000.00', '购物支付【N2018090309330813479】', '会员购物扣款，订单号：N2018090309330813479', '1', '2018-09-03 09:33:12', '2018-09-03 09:33:12');
INSERT INTO `wancll_user_asset_logs` VALUES ('141', '18', 'money', 'user_pay', '100.00', '购物支付【N2018090309415294600】', '会员购物扣款，订单号：N2018090309415294600', '1', '2018-09-03 09:41:57', '2018-09-03 09:41:57');
INSERT INTO `wancll_user_asset_logs` VALUES ('142', '18', 'money', 'user_pay_return', '10000.00', '订单退款【G2018090310043142287】', '会员申请订单退款，退款订单号：G2018090310043142287', '1', '2018-09-03 10:04:49', '2018-09-03 10:04:49');
INSERT INTO `wancll_user_asset_logs` VALUES ('143', '18', 'money', 'user_pay', '10000.00', '购物支付【N2018090310070154781】', '会员购物扣款，订单号：N2018090310070154781', '1', '2018-09-03 10:07:06', '2018-09-03 10:07:06');
INSERT INTO `wancll_user_asset_logs` VALUES ('144', '18', 'money', 'user_pay', '20000.00', '购物支付【N2018090310085838571】', '会员购物扣款，订单号：N2018090310085838571', '1', '2018-09-03 10:09:03', '2018-09-03 10:09:03');
INSERT INTO `wancll_user_asset_logs` VALUES ('145', '17', 'money', 'user_pay', '5000.00', '购物支付【N2018090311023967341】', '会员购物扣款，订单号：N2018090311023967341', '1', '2018-09-03 11:02:48', '2018-09-03 11:02:48');
INSERT INTO `wancll_user_asset_logs` VALUES ('146', '2', 'money', 'user_pay_return', '2000.00', '订单退款【G2018090115442671386】', '会员申请订单退款，退款订单号：G2018090115442671386', '1', '2018-09-03 11:07:43', '2018-09-03 11:07:43');
INSERT INTO `wancll_user_asset_logs` VALUES ('147', '5', 'money', 'user_pay_return', '15.00', '订单退款【G2018080110154939871】', '会员申请订单退款，退款订单号：G2018080110154939871', '1', '2018-09-03 11:07:46', '2018-09-03 11:07:46');
INSERT INTO `wancll_user_asset_logs` VALUES ('148', '2', 'money', 'user_pay_return', '10.00', '订单退款【G2018080110145482397】', '会员申请订单退款，退款订单号：G2018080110145482397', '1', '2018-09-03 11:07:48', '2018-09-03 11:07:48');
INSERT INTO `wancll_user_asset_logs` VALUES ('149', '17', 'money', 'user_pay', '5000.00', '购物支付【N2018090317554293651】', '会员购物扣款，订单号：N2018090317554293651', '1', '2018-09-03 17:55:47', '2018-09-03 17:55:47');
INSERT INTO `wancll_user_asset_logs` VALUES ('150', '17', 'money', 'user_get_commission', '3315.00', '分销佣金提现【F2018090310301745821】', '会员申请分销提现到钱包', '1', '2018-09-04 10:27:44', '2018-09-04 10:27:44');
INSERT INTO `wancll_user_asset_logs` VALUES ('151', '14', 'money', 'user_pay', '11000.00', '购物支付【N2018090410414705109】', '会员购物扣款，订单号：N2018090410414705109', '1', '2018-09-04 10:42:04', '2018-09-04 10:42:04');

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_assets`
-- -----------------------------
INSERT INTO `wancll_user_assets` VALUES ('1', '1', '10000.00', '100.00', '1', '2018-07-20 09:35:36', '2018-07-20 09:35:36');
INSERT INTO `wancll_user_assets` VALUES ('2', '2', '123115.77', '39172.00', '1', '2018-07-23 15:25:59', '2018-07-23 15:25:59');
INSERT INTO `wancll_user_assets` VALUES ('3', '3', '3842.00', '316.00', '1', '2018-07-25 10:42:12', '2018-07-25 10:42:12');
INSERT INTO `wancll_user_assets` VALUES ('4', '4', '9920.00', '0.00', '1', '2018-07-28 09:19:25', '2018-07-28 09:19:25');
INSERT INTO `wancll_user_assets` VALUES ('5', '5', '6184.00', '11293.00', '1', '2018-07-28 10:50:06', '2018-07-28 10:50:06');
INSERT INTO `wancll_user_assets` VALUES ('6', '6', '4594.00', '501.00', '1', '2018-07-28 14:45:41', '2018-07-28 14:45:41');
INSERT INTO `wancll_user_assets` VALUES ('7', '7', '7293.00', '8203.00', '1', '2018-07-30 09:04:51', '2018-07-30 09:04:51');
INSERT INTO `wancll_user_assets` VALUES ('8', '8', '8801.00', '10000.00', '1', '2018-07-30 11:37:02', '2018-07-30 11:37:02');
INSERT INTO `wancll_user_assets` VALUES ('9', '9', '0.00', '0.00', '1', '2018-08-03 15:10:02', '2018-08-03 15:10:02');
INSERT INTO `wancll_user_assets` VALUES ('10', '10', '0.00', '0.00', '1', '2018-08-03 15:11:19', '2018-08-03 15:11:19');
INSERT INTO `wancll_user_assets` VALUES ('11', '11', '0.00', '0.00', '1', '2018-08-04 17:16:04', '2018-08-04 17:16:04');
INSERT INTO `wancll_user_assets` VALUES ('12', '12', '380.00', '1592.00', '1', '2018-08-23 23:17:50', '2018-08-23 23:17:50');
INSERT INTO `wancll_user_assets` VALUES ('13', '13', '0.00', '0.00', '1', '2018-08-24 12:49:06', '2018-08-24 12:49:06');
INSERT INTO `wancll_user_assets` VALUES ('14', '14', '89000.00', '12001.00', '1', '2018-08-31 14:49:53', '2018-08-31 14:49:53');
INSERT INTO `wancll_user_assets` VALUES ('15', '15', '0.00', '0.00', '1', '2018-08-31 14:53:56', '2018-08-31 14:53:56');
INSERT INTO `wancll_user_assets` VALUES ('16', '16', '0.00', '0.00', '1', '2018-08-31 15:11:47', '2018-08-31 15:11:47');
INSERT INTO `wancll_user_assets` VALUES ('17', '17', '136738.85', '27651.00', '1', '2018-08-31 16:41:58', '2018-08-31 16:41:58');
INSERT INTO `wancll_user_assets` VALUES ('18', '18', '1819353.00', '184955.00', '1', '2018-08-31 17:01:44', '2018-08-31 17:01:44');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_auths`
-- -----------------------------
INSERT INTO `wancll_user_auths` VALUES ('1', '2', '易云', '14022719988956231X', '/public/upload/user_images/20180903/5a535db6583743c74867620239b83b02.jpg', '/public/upload/user_images/20180903/45a0d444432bc8cf85d9c8e47c988657.png', '[]', '3', '1', '2018-08-31 10:49:01', '2018-09-03 15:39:52');
INSERT INTO `wancll_user_auths` VALUES ('2', '14', '1', '43068119960708761X', '/public/upload/user_images/20180904/913904dc85532b4c7e101ce9202ba1af.jpg', '/public/upload/user_images/20180904/a517ddd2747cfc7e308525ca240c6c28.jpg', '[]', '1', '1', '2018-08-31 15:24:25', '2018-09-04 10:40:47');
INSERT INTO `wancll_user_auths` VALUES ('3', '18', '啊', '12345678901234567X', '/public/upload/user_images/20180901/052850e15cdf49bed4a0469c744d7e31.jpg', '/public/upload/user_images/20180901/d57b6ad9c1300cbac62b99180253b088.jpg', '[]', '3', '1', '2018-09-01 13:55:42', '2018-09-01 13:55:42');

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
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_bonus_logs`
-- -----------------------------
INSERT INTO `wancll_user_bonus_logs` VALUES ('1', '2', '1', '1', '1', '1', '会员分红商', '', '1.00', '', '1.00', '', '0.00', '2', '1', '0', '', '', '1', '2018-07-23 15:26:56', '2018-07-23 15:26:56');
INSERT INTO `wancll_user_bonus_logs` VALUES ('2', '3', '19', '3', '19', '1', '会员分红商', '', '2.15', '', '1.00', '', '0.00', '3', '1', '0', '', '', '1', '2018-07-30 10:51:20', '2018-07-30 10:51:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('3', '5', '5', '4', '5', '1', '会员分红商', '', '32.99', '3299.00', '1.00', '32.99', '0.00', '5', '3', '0', '', '', '1', '2018-08-04 17:38:45', '2018-08-04 17:40:29');
INSERT INTO `wancll_user_bonus_logs` VALUES ('4', '2', '6', '2', '6', '1', '会员分红商', '', '1.00', '', '1.00', '', '0.00', '2', '2', '0', '', '', '1', '2018-08-07 16:17:28', '2018-08-31 15:39:55');
INSERT INTO `wancll_user_bonus_logs` VALUES ('5', '7', '7', '2', '7', '1', '会员分红商', '', '1.00', '', '1.00', '', '0.00', '7', '2', '0', '', '', '1', '2018-08-10 09:13:08', '2018-08-10 09:13:14');
INSERT INTO `wancll_user_bonus_logs` VALUES ('6', '7', '8', '2', '8', '1', '会员分红商', '', '1.00', '', '1.00', '', '0.00', '7', '1', '0', '', '', '1', '2018-08-10 09:13:53', '2018-08-10 09:13:53');
INSERT INTO `wancll_user_bonus_logs` VALUES ('7', '2', '9', '4', '9', '1', '会员分红商', '', '32.99', '3299.00', '1.00', '32.99', '32.99', '2', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-14 14:34:58', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('8', '2', '21', '2', '21', '1', '会员分红商', '', '1.00', '100.00', '1.00', '1.00', '1.00', '2', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 14:21:12', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('9', '13', '21', '2', '21', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 14:21:12', '2018-08-31 14:21:47');
INSERT INTO `wancll_user_bonus_logs` VALUES ('10', '12', '21', '2', '21', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 14:21:12', '2018-08-31 14:21:47');
INSERT INTO `wancll_user_bonus_logs` VALUES ('11', '2', '22', '2', '22', '1', '会员分红商', '', '1.00', '100.00', '1.00', '1.00', '1.00', '2', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 14:22:13', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('12', '13', '22', '2', '22', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 14:22:13', '2018-08-31 15:39:35');
INSERT INTO `wancll_user_bonus_logs` VALUES ('13', '12', '22', '2', '22', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 14:22:13', '2018-08-31 15:39:35');
INSERT INTO `wancll_user_bonus_logs` VALUES ('14', '2', '23', '2', '23', '1', '会员分红商', '', '1.00', '100.00', '1.00', '1.00', '1.00', '2', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 14:47:55', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('15', '13', '23', '2', '23', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 14:47:55', '2018-08-31 15:39:32');
INSERT INTO `wancll_user_bonus_logs` VALUES ('16', '12', '23', '2', '23', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 14:47:55', '2018-08-31 15:39:32');
INSERT INTO `wancll_user_bonus_logs` VALUES ('17', '2', '24', '5', '24', '1', '会员分红商', '', '1.00', '100.00', '1.00', '1.00', '1.00', '2', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 15:07:34', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('18', '13', '24', '5', '24', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 15:07:34', '2018-08-31 15:39:28');
INSERT INTO `wancll_user_bonus_logs` VALUES ('19', '12', '24', '5', '24', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 15:07:34', '2018-08-31 15:39:28');
INSERT INTO `wancll_user_bonus_logs` VALUES ('20', '2', '25', '5', '25', '1', '会员分红商', '', '1.00', '100.00', '1.00', '1.00', '1.00', '2', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 15:11:17', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('21', '13', '25', '5', '25', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 15:11:17', '2018-08-31 15:39:25');
INSERT INTO `wancll_user_bonus_logs` VALUES ('22', '12', '25', '5', '25', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 15:11:17', '2018-08-31 15:39:25');
INSERT INTO `wancll_user_bonus_logs` VALUES ('23', '2', '26', '5', '26', '1', '会员分红商', '', '1.00', '100.00', '1.00', '1.00', '1.00', '2', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 15:11:22', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('24', '13', '26', '5', '26', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 15:11:22', '2018-08-31 15:39:22');
INSERT INTO `wancll_user_bonus_logs` VALUES ('25', '12', '26', '5', '26', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 15:11:22', '2018-08-31 15:39:22');
INSERT INTO `wancll_user_bonus_logs` VALUES ('26', '2', '27', '2', '27', '1', '会员分红商', '', '1.00', '100.00', '1.00', '1.00', '1.00', '2', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 15:15:51', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('27', '13', '27', '2', '27', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 15:15:51', '2018-08-31 15:39:17');
INSERT INTO `wancll_user_bonus_logs` VALUES ('28', '12', '27', '2', '27', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 15:15:51', '2018-08-31 15:39:17');
INSERT INTO `wancll_user_bonus_logs` VALUES ('29', '13', '28', '1', '28', '3', '', '', '20.00', '', '10.00', '', '0.00', '12', '2', '0', '', '', '1', '2018-08-31 15:18:58', '2018-08-31 15:19:09');
INSERT INTO `wancll_user_bonus_logs` VALUES ('30', '12', '28', '1', '28', '3', '', '', '20.00', '', '10.00', '', '0.00', '12', '2', '0', '', '', '1', '2018-08-31 15:18:58', '2018-08-31 15:19:09');
INSERT INTO `wancll_user_bonus_logs` VALUES ('31', '2', '31', '5', '33', '1', '会员分红商', '', '2.00', '200.00', '1.00', '2.00', '2.00', '2', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 16:34:18', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('32', '13', '31', '5', '33', '3', '', '', '20.00', '200.00', '10.00', '20.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 16:34:18', '2018-08-31 16:36:08');
INSERT INTO `wancll_user_bonus_logs` VALUES ('33', '12', '31', '5', '33', '3', '', '', '20.00', '200.00', '10.00', '20.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 16:34:18', '2018-08-31 16:36:08');
INSERT INTO `wancll_user_bonus_logs` VALUES ('34', '2', '31', '4', '32', '1', '会员分红商', '', '164.95', '16495.00', '1.00', '164.95', '164.95', '2', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 16:34:18', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('35', '2', '31', '1', '31', '1', '会员分红商', '', '1.00', '100.00', '1.00', '1.00', '1.00', '2', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 16:34:18', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('36', '13', '31', '1', '31', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 16:34:18', '2018-08-31 16:36:08');
INSERT INTO `wancll_user_bonus_logs` VALUES ('37', '12', '31', '1', '31', '3', '', '', '10.00', '100.00', '10.00', '10.00', '0.00', '2', '3', '0', '', '', '1', '2018-08-31 16:34:18', '2018-08-31 16:36:08');
INSERT INTO `wancll_user_bonus_logs` VALUES ('38', '2', '32', '4', '34', '1', '董事分红商', '', '593.82', '3299.00', '18.00', '593.82', '593.82', '2', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 16:37:39', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('39', '2', '33', '6', '35', '1', '董事分红商', '', '18.00', '100.00', '18.00', '18.00', '18.00', '17', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 16:42:53', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('40', '2', '34', '6', '36', '1', '董事分红商', '', '18.00', '100.00', '18.00', '18.00', '18.00', '17', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 16:44:59', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('41', '2', '35', '6', '37', '1', '董事分红商', '', '18.00', '100.00', '18.00', '18.00', '18.00', '17', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 16:46:12', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('42', '2', '36', '6', '38', '1', '董事分红商', '', '18.00', '100.00', '18.00', '18.00', '18.00', '17', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 16:46:18', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('43', '17', '37', '4', '39', '1', '会员分红商', '', '32.99', '', '1.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-08-31 17:03:52', '2018-08-31 17:03:58');
INSERT INTO `wancll_user_bonus_logs` VALUES ('44', '2', '37', '4', '39', '1', '董事分红商', '', '560.83', '', '17.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-08-31 17:03:52', '2018-08-31 17:03:58');
INSERT INTO `wancll_user_bonus_logs` VALUES ('45', '2', '38', '4', '40', '1', '董事分红商', '', '593.82', '', '18.00', '', '0.00', '2', '2', '0', '', '', '1', '2018-08-31 17:07:54', '2018-08-31 17:07:58');
INSERT INTO `wancll_user_bonus_logs` VALUES ('46', '17', '39', '4', '41', '1', '会员分红商', '', '32.99', '3299.00', '1.00', '32.99', '32.99', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-08-31 17:09:42', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('47', '2', '39', '4', '41', '1', '董事分红商', '', '560.83', '3299.00', '17.00', '560.83', '560.83', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 17:09:42', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('48', '17', '40', '4', '42', '1', '会员分红商', '', '32.99', '', '1.00', '', '0.00', '17', '2', '0', '', '', '1', '2018-08-31 17:47:31', '2018-08-31 17:47:35');
INSERT INTO `wancll_user_bonus_logs` VALUES ('49', '2', '40', '4', '42', '1', '董事分红商', '', '560.83', '', '17.00', '', '0.00', '17', '2', '0', '', '', '1', '2018-08-31 17:47:31', '2018-08-31 17:47:35');
INSERT INTO `wancll_user_bonus_logs` VALUES ('50', '17', '41', '4', '43', '1', '会员分红商', '', '32.99', '3299.00', '1.00', '32.99', '32.99', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-08-31 17:53:02', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('51', '2', '41', '4', '43', '1', '董事分红商', '', '560.83', '3299.00', '17.00', '560.83', '560.83', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-08-31 17:53:02', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('52', '17', '42', '4', '44', '1', '董事分红商', '', '593.82', '3299.00', '18.00', '593.82', '593.82', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-08-31 17:55:43', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('53', '17', '43', '4', '45', '1', '董事分红商', '', '593.82', '3299.00', '18.00', '593.82', '593.82', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-08-31 17:55:50', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('54', '17', '44', '7', '46', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-09-01 09:23:04', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('55', '13', '44', '7', '46', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 09:23:04', '2018-09-01 09:25:00');
INSERT INTO `wancll_user_bonus_logs` VALUES ('56', '12', '44', '7', '46', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 09:23:04', '2018-09-01 09:25:00');
INSERT INTO `wancll_user_bonus_logs` VALUES ('57', '17', '45', '7', '47', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-09-01 09:37:40', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('58', '2', '45', '7', '47', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 09:37:40', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('59', '13', '45', '7', '47', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 09:37:40', '2018-09-01 09:38:02');
INSERT INTO `wancll_user_bonus_logs` VALUES ('60', '12', '45', '7', '47', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 09:37:40', '2018-09-01 09:38:02');
INSERT INTO `wancll_user_bonus_logs` VALUES ('61', '17', '46', '7', '48', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-09-01 09:44:02', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('62', '2', '46', '7', '48', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 09:44:02', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('63', '13', '46', '7', '48', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 09:44:02', '2018-09-01 09:44:26');
INSERT INTO `wancll_user_bonus_logs` VALUES ('64', '12', '46', '7', '48', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 09:44:02', '2018-09-01 09:44:26');
INSERT INTO `wancll_user_bonus_logs` VALUES ('65', '17', '47', '7', '49', '1', '会员分红商', '', '10.00', '1000.00', '1.00', '10.00', '10.00', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-09-01 09:51:07', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('66', '2', '47', '7', '49', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 09:51:07', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('67', '2', '47', '7', '49', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 09:51:07', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('68', '13', '47', '7', '49', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 09:51:07', '2018-09-01 09:51:28');
INSERT INTO `wancll_user_bonus_logs` VALUES ('69', '12', '47', '7', '49', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 09:51:07', '2018-09-01 09:51:28');
INSERT INTO `wancll_user_bonus_logs` VALUES ('70', '17', '48', '7', '50', '1', '主管分红商', '', '60.00', '1000.00', '6.00', '60.00', '60.00', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-09-01 10:26:30', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('71', '2', '48', '7', '50', '1', '董事分红商', '', '120.00', '1000.00', '12.00', '120.00', '120.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 10:26:30', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('72', '2', '48', '7', '50', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 10:26:30', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('73', '13', '48', '7', '50', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:26:30', '2018-09-01 10:26:54');
INSERT INTO `wancll_user_bonus_logs` VALUES ('74', '12', '48', '7', '50', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:26:30', '2018-09-01 10:26:54');
INSERT INTO `wancll_user_bonus_logs` VALUES ('75', '17', '49', '7', '51', '1', '会员分红商', '', '10.00', '1000.00', '1.00', '10.00', '10.00', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-09-01 10:28:27', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('76', '2', '49', '7', '51', '1', '董事分红商', '', '170.00', '1000.00', '17.00', '170.00', '170.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 10:28:27', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('77', '2', '49', '7', '51', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 10:28:27', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('78', '13', '49', '7', '51', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:28:27', '2018-09-01 10:28:55');
INSERT INTO `wancll_user_bonus_logs` VALUES ('79', '12', '49', '7', '51', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:28:27', '2018-09-01 10:28:55');
INSERT INTO `wancll_user_bonus_logs` VALUES ('80', '17', '50', '7', '52', '1', '会员分红商', '', '10.00', '1000.00', '1.00', '10.00', '10.00', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-09-01 10:29:51', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('81', '2', '50', '7', '52', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 10:29:51', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('82', '2', '50', '7', '52', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 10:29:51', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('83', '13', '50', '7', '52', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:29:51', '2018-09-01 10:30:16');
INSERT INTO `wancll_user_bonus_logs` VALUES ('84', '12', '50', '7', '52', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:29:51', '2018-09-01 10:30:16');
INSERT INTO `wancll_user_bonus_logs` VALUES ('85', '17', '51', '7', '53', '1', '董事分红商', '', '180.00', '', '18.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-01 10:31:50', '2018-09-01 10:31:57');
INSERT INTO `wancll_user_bonus_logs` VALUES ('86', '2', '51', '7', '53', '3', '', '', '100.00', '', '10.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-01 10:31:50', '2018-09-01 10:31:57');
INSERT INTO `wancll_user_bonus_logs` VALUES ('87', '13', '51', '7', '53', '3', '', '', '100.00', '', '10.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-01 10:31:50', '2018-09-01 10:31:57');
INSERT INTO `wancll_user_bonus_logs` VALUES ('88', '12', '51', '7', '53', '3', '', '', '100.00', '', '10.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-01 10:31:50', '2018-09-01 10:31:57');
INSERT INTO `wancll_user_bonus_logs` VALUES ('89', '17', '52', '7', '54', '1', '主管分红商', '', '60.00', '1000.00', '6.00', '60.00', '60.00', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-09-01 10:33:04', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('90', '2', '52', '7', '54', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 10:33:04', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('91', '2', '52', '7', '54', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 10:33:04', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('92', '13', '52', '7', '54', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:33:04', '2018-09-01 10:34:09');
INSERT INTO `wancll_user_bonus_logs` VALUES ('93', '12', '52', '7', '54', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:33:04', '2018-09-01 10:34:09');
INSERT INTO `wancll_user_bonus_logs` VALUES ('94', '17', '53', '7', '55', '1', '主管分红商', '', '60.00', '1000.00', '6.00', '60.00', '60.00', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-09-01 10:33:17', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('95', '2', '53', '7', '55', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 10:33:17', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('96', '2', '53', '7', '55', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 10:33:17', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('97', '13', '53', '7', '55', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:33:17', '2018-09-01 10:33:54');
INSERT INTO `wancll_user_bonus_logs` VALUES ('98', '12', '53', '7', '55', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:33:17', '2018-09-01 10:33:54');
INSERT INTO `wancll_user_bonus_logs` VALUES ('99', '17', '54', '7', '56', '1', '经理分红商', '', '50.00', '1000.00', '5.00', '50.00', '50.00', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-09-01 10:34:30', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('100', '2', '54', '7', '56', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 10:34:30', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('101', '2', '54', '7', '56', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 10:34:30', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('102', '13', '54', '7', '56', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:34:30', '2018-09-01 10:34:55');
INSERT INTO `wancll_user_bonus_logs` VALUES ('103', '12', '54', '7', '56', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:34:30', '2018-09-01 10:34:55');
INSERT INTO `wancll_user_bonus_logs` VALUES ('104', '17', '55', '7', '57', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '18', '3', '3', '1', 'B2018090110520733630', '1', '2018-09-01 10:35:18', '2018-09-01 16:41:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('105', '2', '55', '7', '57', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 10:35:18', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('106', '13', '55', '7', '57', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:35:18', '2018-09-01 10:36:05');
INSERT INTO `wancll_user_bonus_logs` VALUES ('107', '12', '55', '7', '57', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 10:35:18', '2018-09-01 10:36:05');
INSERT INTO `wancll_user_bonus_logs` VALUES ('108', '17', '56', '7', '58', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '17', '3', '3', '2', 'B2018090116132851326', '1', '2018-09-01 11:02:50', '2018-09-01 16:15:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('109', '2', '56', '7', '58', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '17', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 11:02:50', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('110', '13', '56', '7', '58', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '17', '3', '0', '', '', '1', '2018-09-01 11:02:50', '2018-09-01 11:03:10');
INSERT INTO `wancll_user_bonus_logs` VALUES ('111', '12', '56', '7', '58', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '17', '3', '0', '', '', '1', '2018-09-01 11:02:50', '2018-09-01 11:03:10');
INSERT INTO `wancll_user_bonus_logs` VALUES ('112', '2', '57', '7', '59', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '17', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 11:10:49', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('113', '2', '57', '7', '59', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '17', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 11:10:49', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('114', '13', '57', '7', '59', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '17', '3', '0', '', '', '1', '2018-09-01 11:10:49', '2018-09-01 12:01:46');
INSERT INTO `wancll_user_bonus_logs` VALUES ('115', '12', '57', '7', '59', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '17', '3', '0', '', '', '1', '2018-09-01 11:10:49', '2018-09-01 12:01:46');
INSERT INTO `wancll_user_bonus_logs` VALUES ('116', '2', '58', '7', '60', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '17', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 11:31:44', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('117', '2', '58', '7', '60', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '17', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 11:31:44', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('118', '13', '58', '7', '60', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '17', '3', '0', '', '', '1', '2018-09-01 11:31:44', '2018-09-01 11:32:18');
INSERT INTO `wancll_user_bonus_logs` VALUES ('119', '12', '58', '7', '60', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '17', '3', '0', '', '', '1', '2018-09-01 11:31:44', '2018-09-01 11:32:18');
INSERT INTO `wancll_user_bonus_logs` VALUES ('120', '17', '59', '7', '61', '1', '经理分红商', '', '50.00', '1000.00', '5.00', '50.00', '50.00', '18', '3', '3', '2', 'B2018090116132851326', '1', '2018-09-01 11:53:44', '2018-09-01 16:15:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('121', '2', '59', '7', '61', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 11:53:44', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('122', '13', '59', '7', '61', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 11:53:44', '2018-09-01 11:54:18');
INSERT INTO `wancll_user_bonus_logs` VALUES ('123', '12', '59', '7', '61', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 11:53:44', '2018-09-01 11:54:18');
INSERT INTO `wancll_user_bonus_logs` VALUES ('124', '17', '63', '4', '65', '1', '董事分红商', '', '593.82', '3299.00', '18.00', '593.82', '593.82', '18', '3', '3', '2', 'B2018090116132851326', '1', '2018-09-01 14:03:51', '2018-09-01 16:15:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('125', '17', '64', '7', '66', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '18', '3', '3', '2', 'B2018090116132851326', '1', '2018-09-01 15:49:46', '2018-09-01 16:15:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('126', '17', '64', '7', '66', '2', '', 'city', '200.00', '1000.00', '20.00', '200.00', '200.00', '18', '3', '3', '2', 'B2018090116132851326', '1', '2018-09-01 15:49:46', '2018-09-01 16:15:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('127', '2', '64', '7', '66', '2', '', 'province', '300.00', '1000.00', '30.00', '300.00', '300.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 15:49:46', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('128', '2', '64', '7', '66', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 15:49:46', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('129', '13', '64', '7', '66', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 15:49:46', '2018-09-01 15:51:03');
INSERT INTO `wancll_user_bonus_logs` VALUES ('130', '12', '64', '7', '66', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 15:49:46', '2018-09-01 15:51:03');
INSERT INTO `wancll_user_bonus_logs` VALUES ('131', '17', '65', '7', '67', '1', '董事分红商', '', '180.00', '1000.00', '18.00', '180.00', '180.00', '18', '3', '3', '2', 'B2018090116132851326', '1', '2018-09-01 15:51:09', '2018-09-01 16:15:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('132', '17', '65', '7', '67', '2', '', 'city', '200.00', '1000.00', '20.00', '200.00', '200.00', '18', '3', '3', '2', 'B2018090116132851326', '1', '2018-09-01 15:51:09', '2018-09-01 16:15:31');
INSERT INTO `wancll_user_bonus_logs` VALUES ('133', '2', '65', '7', '67', '2', '', 'province', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 15:51:09', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('134', '2', '65', '7', '67', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '100.00', '18', '3', '3', '5', 'B2018090116143846134', '1', '2018-09-01 15:51:09', '2018-09-01 16:15:20');
INSERT INTO `wancll_user_bonus_logs` VALUES ('135', '13', '65', '7', '67', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 15:51:09', '2018-09-01 16:12:03');
INSERT INTO `wancll_user_bonus_logs` VALUES ('136', '12', '65', '7', '67', '3', '', '', '100.00', '1000.00', '10.00', '100.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-01 15:51:09', '2018-09-01 16:12:03');
INSERT INTO `wancll_user_bonus_logs` VALUES ('137', '17', '66', '7', '68', '1', '董事分红商', '', '1800.00', '', '18.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-01 16:11:43', '2018-09-01 16:11:47');
INSERT INTO `wancll_user_bonus_logs` VALUES ('138', '17', '66', '7', '68', '2', '', 'city', '2000.00', '', '20.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-01 16:11:43', '2018-09-01 16:11:47');
INSERT INTO `wancll_user_bonus_logs` VALUES ('139', '2', '66', '7', '68', '2', '', 'province', '1000.00', '', '10.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-01 16:11:43', '2018-09-01 16:11:47');
INSERT INTO `wancll_user_bonus_logs` VALUES ('140', '2', '66', '7', '68', '3', '', '', '1000.00', '', '10.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-01 16:11:43', '2018-09-01 16:11:47');
INSERT INTO `wancll_user_bonus_logs` VALUES ('141', '17', '67', '7', '69', '1', '会员分红商', '', '100.00', '10000.00', '1.00', '100.00', '100.00', '18', '3', '3', '8', 'B2018090309262580506', '1', '2018-09-01 16:44:19', '2018-09-03 09:32:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('142', '17', '67', '7', '69', '2', '', 'city', '2000.00', '10000.00', '20.00', '2000.00', '2000.00', '18', '3', '3', '8', 'B2018090309262580506', '1', '2018-09-01 16:44:19', '2018-09-03 09:32:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('143', '2', '67', '7', '69', '2', '', 'province', '1000.00', '10000.00', '10.00', '1000.00', '1000.00', '18', '3', '3', '9', 'B2018090309301491738', '1', '2018-09-01 16:44:19', '2018-09-03 09:32:33');
INSERT INTO `wancll_user_bonus_logs` VALUES ('144', '2', '67', '7', '69', '3', '', '', '1000.00', '10000.00', '10.00', '1000.00', '1000.00', '18', '3', '3', '9', 'B2018090309301491738', '1', '2018-09-01 16:44:19', '2018-09-03 09:32:33');
INSERT INTO `wancll_user_bonus_logs` VALUES ('145', '17', '68', '7', '70', '1', '会员分红商', '', '100.00', '10000.00', '1.00', '100.00', '100.00', '18', '3', '3', '8', 'B2018090309262580506', '1', '2018-09-01 16:45:23', '2018-09-03 09:32:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('146', '17', '68', '7', '70', '2', '', 'city', '2000.00', '10000.00', '20.00', '2000.00', '2000.00', '18', '3', '3', '8', 'B2018090309262580506', '1', '2018-09-01 16:45:23', '2018-09-03 09:32:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('147', '2', '68', '7', '70', '2', '', 'province', '1000.00', '10000.00', '10.00', '1000.00', '1000.00', '18', '3', '3', '9', 'B2018090309301491738', '1', '2018-09-01 16:45:23', '2018-09-03 09:32:33');
INSERT INTO `wancll_user_bonus_logs` VALUES ('148', '2', '68', '7', '70', '3', '', '', '1000.00', '10000.00', '10.00', '1000.00', '1000.00', '18', '3', '3', '9', 'B2018090309301491738', '1', '2018-09-01 16:45:23', '2018-09-03 09:32:33');
INSERT INTO `wancll_user_bonus_logs` VALUES ('149', '17', '69', '7', '71', '1', '会员分红商', '', '100.00', '10000.00', '1.00', '100.00', '100.00', '18', '3', '3', '8', 'B2018090309262580506', '1', '2018-09-01 16:50:36', '2018-09-03 09:32:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('150', '17', '69', '7', '71', '2', '', 'city', '2000.00', '10000.00', '20.00', '2000.00', '2000.00', '18', '3', '3', '8', 'B2018090309262580506', '1', '2018-09-01 16:50:36', '2018-09-03 09:32:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('151', '2', '69', '7', '71', '2', '', 'province', '1000.00', '10000.00', '10.00', '1000.00', '1000.00', '18', '3', '3', '9', 'B2018090309301491738', '1', '2018-09-01 16:50:36', '2018-09-03 09:32:33');
INSERT INTO `wancll_user_bonus_logs` VALUES ('152', '2', '69', '7', '71', '3', '', '', '1000.00', '10000.00', '10.00', '1000.00', '1000.00', '18', '3', '3', '9', 'B2018090309301491738', '1', '2018-09-01 16:50:36', '2018-09-03 09:32:33');
INSERT INTO `wancll_user_bonus_logs` VALUES ('153', '17', '70', '7', '72', '1', '会员分红商', '', '700.00', '70000.00', '1.00', '700.00', '700.00', '18', '3', '3', '8', 'B2018090309262580506', '1', '2018-09-01 16:51:28', '2018-09-03 09:32:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('154', '17', '70', '7', '72', '2', '', 'city', '14000.00', '70000.00', '20.00', '14000.00', '14000.00', '18', '3', '3', '8', 'B2018090309262580506', '1', '2018-09-01 16:51:28', '2018-09-03 09:32:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('155', '2', '70', '7', '72', '2', '', 'province', '7000.00', '70000.00', '10.00', '7000.00', '7000.00', '18', '3', '3', '9', 'B2018090309301491738', '1', '2018-09-01 16:51:28', '2018-09-03 09:32:33');
INSERT INTO `wancll_user_bonus_logs` VALUES ('156', '2', '70', '7', '72', '3', '', '', '7000.00', '70000.00', '10.00', '7000.00', '7000.00', '18', '3', '3', '9', 'B2018090309301491738', '1', '2018-09-01 16:51:28', '2018-09-03 09:32:33');
INSERT INTO `wancll_user_bonus_logs` VALUES ('157', '2', '71', '7', '73', '1', '主管分红商', '', '600.00', '', '6.00', '', '0.00', '17', '2', '0', '', '', '1', '2018-09-01 16:55:09', '2018-09-01 16:55:14');
INSERT INTO `wancll_user_bonus_logs` VALUES ('158', '2', '71', '7', '73', '3', '', '', '1000.00', '', '10.00', '', '0.00', '17', '2', '0', '', '', '1', '2018-09-01 16:55:09', '2018-09-01 16:55:14');
INSERT INTO `wancll_user_bonus_logs` VALUES ('159', '17', '72', '7', '74', '1', '主管分红商', '', '600.00', '10000.00', '6.00', '600.00', '600.00', '18', '3', '3', '8', 'B2018090309262580506', '1', '2018-09-01 16:56:15', '2018-09-03 09:32:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('160', '17', '72', '7', '74', '2', '', 'city', '2000.00', '10000.00', '20.00', '2000.00', '2000.00', '18', '3', '3', '8', 'B2018090309262580506', '1', '2018-09-01 16:56:15', '2018-09-03 09:32:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('161', '2', '72', '7', '74', '2', '', 'province', '1000.00', '10000.00', '10.00', '1000.00', '1000.00', '18', '3', '3', '9', 'B2018090309301491738', '1', '2018-09-01 16:56:15', '2018-09-03 09:32:33');
INSERT INTO `wancll_user_bonus_logs` VALUES ('162', '2', '72', '7', '74', '3', '', '', '1000.00', '10000.00', '10.00', '1000.00', '1000.00', '18', '3', '3', '9', 'B2018090309301491738', '1', '2018-09-01 16:56:15', '2018-09-03 09:32:33');
INSERT INTO `wancll_user_bonus_logs` VALUES ('163', '17', '73', '7', '75', '1', '主管分红商', '', '600.00', '10000.00', '6.00', '600.00', '600.00', '18', '3', '3', '8', 'B2018090309262580506', '1', '2018-09-01 16:57:12', '2018-09-03 09:32:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('164', '17', '73', '7', '75', '2', '', 'city', '2000.00', '10000.00', '20.00', '2000.00', '2000.00', '18', '3', '3', '8', 'B2018090309262580506', '1', '2018-09-01 16:57:12', '2018-09-03 09:32:37');
INSERT INTO `wancll_user_bonus_logs` VALUES ('165', '2', '73', '7', '75', '2', '', 'province', '1000.00', '10000.00', '10.00', '1000.00', '1000.00', '18', '3', '3', '9', 'B2018090309301491738', '1', '2018-09-01 16:57:12', '2018-09-03 09:32:33');
INSERT INTO `wancll_user_bonus_logs` VALUES ('166', '2', '73', '7', '75', '3', '', '', '1000.00', '10000.00', '10.00', '1000.00', '1000.00', '18', '3', '3', '9', 'B2018090309301491738', '1', '2018-09-01 16:57:12', '2018-09-03 09:32:33');
INSERT INTO `wancll_user_bonus_logs` VALUES ('167', '17', '74', '7', '76', '1', '董事分红商', '', '1800.00', '', '18.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-03 09:33:08', '2018-09-03 09:33:12');
INSERT INTO `wancll_user_bonus_logs` VALUES ('168', '17', '74', '7', '76', '2', '', 'city', '2000.00', '', '20.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-03 09:33:08', '2018-09-03 09:33:12');
INSERT INTO `wancll_user_bonus_logs` VALUES ('169', '2', '74', '7', '76', '2', '', 'province', '1000.00', '', '10.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-03 09:33:08', '2018-09-03 09:33:12');
INSERT INTO `wancll_user_bonus_logs` VALUES ('170', '2', '74', '7', '76', '3', '', '', '1000.00', '', '10.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-03 09:33:08', '2018-09-03 09:33:12');
INSERT INTO `wancll_user_bonus_logs` VALUES ('171', '17', '75', '6', '77', '1', '董事分红商', '', '18.00', '100.00', '18.00', '18.00', '0.00', '18', '3', '2', '10', 'B2018090310302518085', '1', '2018-09-03 09:41:52', '2018-09-03 10:30:42');
INSERT INTO `wancll_user_bonus_logs` VALUES ('172', '17', '75', '6', '77', '2', '', 'city', '20.00', '100.00', '20.00', '20.00', '0.00', '18', '3', '2', '10', 'B2018090310302518085', '1', '2018-09-03 09:41:52', '2018-09-03 10:30:42');
INSERT INTO `wancll_user_bonus_logs` VALUES ('173', '2', '75', '6', '77', '2', '', 'province', '10.00', '100.00', '10.00', '10.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-03 09:41:52', '2018-09-03 09:42:21');
INSERT INTO `wancll_user_bonus_logs` VALUES ('174', '17', '76', '7', '78', '1', '会员分红商', '', '100.00', '10000.00', '1.00', '100.00', '0.00', '18', '3', '2', '10', 'B2018090310302518085', '1', '2018-09-03 10:07:01', '2018-09-03 10:30:42');
INSERT INTO `wancll_user_bonus_logs` VALUES ('175', '17', '76', '7', '78', '2', '', 'city', '2000.00', '10000.00', '20.00', '2000.00', '0.00', '18', '3', '2', '10', 'B2018090310302518085', '1', '2018-09-03 10:07:01', '2018-09-03 10:30:42');
INSERT INTO `wancll_user_bonus_logs` VALUES ('176', '2', '76', '7', '78', '2', '', 'province', '1000.00', '10000.00', '10.00', '1000.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-03 10:07:01', '2018-09-03 10:07:36');
INSERT INTO `wancll_user_bonus_logs` VALUES ('177', '2', '76', '7', '78', '3', '', '', '1000.00', '10000.00', '10.00', '1000.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-03 10:07:01', '2018-09-03 10:07:36');
INSERT INTO `wancll_user_bonus_logs` VALUES ('178', '17', '77', '7', '79', '1', '会员分红商', '', '200.00', '20000.00', '1.00', '200.00', '0.00', '18', '3', '2', '10', 'B2018090310302518085', '1', '2018-09-03 10:08:59', '2018-09-03 10:30:42');
INSERT INTO `wancll_user_bonus_logs` VALUES ('179', '17', '77', '7', '79', '2', '', 'city', '4000.00', '20000.00', '20.00', '4000.00', '0.00', '18', '3', '2', '10', 'B2018090310302518085', '1', '2018-09-03 10:08:59', '2018-09-03 10:30:42');
INSERT INTO `wancll_user_bonus_logs` VALUES ('180', '2', '77', '7', '79', '2', '', 'province', '2000.00', '20000.00', '10.00', '2000.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-03 10:08:59', '2018-09-03 10:09:29');
INSERT INTO `wancll_user_bonus_logs` VALUES ('181', '2', '77', '7', '79', '3', '', '', '2000.00', '20000.00', '10.00', '2000.00', '0.00', '18', '3', '0', '', '', '1', '2018-09-03 10:08:59', '2018-09-03 10:09:29');
INSERT INTO `wancll_user_bonus_logs` VALUES ('182', '2', '78', '6', '80', '1', '会员分红商', '', '0.90', '', '1.00', '', '0.00', '17', '1', '0', '', '', '1', '2018-09-03 10:41:24', '2018-09-03 10:41:24');
INSERT INTO `wancll_user_bonus_logs` VALUES ('183', '2', '79', '7', '81', '1', '会员分红商', '', '70.00', '', '1.00', '', '0.00', '17', '1', '0', '', '', '1', '2018-09-03 11:02:30', '2018-09-03 11:02:30');
INSERT INTO `wancll_user_bonus_logs` VALUES ('184', '2', '79', '7', '81', '3', '', '', '700.00', '', '10.00', '', '0.00', '17', '1', '0', '', '', '1', '2018-09-03 11:02:30', '2018-09-03 11:02:30');
INSERT INTO `wancll_user_bonus_logs` VALUES ('185', '2', '80', '7', '82', '1', '会员分红商', '', '50.00', '', '1.00', '', '0.00', '17', '2', '0', '', '', '1', '2018-09-03 11:02:39', '2018-09-03 11:02:48');
INSERT INTO `wancll_user_bonus_logs` VALUES ('186', '2', '80', '7', '82', '3', '', '', '500.00', '', '10.00', '', '0.00', '17', '2', '0', '', '', '1', '2018-09-03 11:02:39', '2018-09-03 11:02:48');
INSERT INTO `wancll_user_bonus_logs` VALUES ('187', '2', '82', '7', '84', '3', '', '', '1000.00', '', '10.00', '', '0.00', '2', '1', '0', '', '', '1', '2018-09-03 17:43:32', '2018-09-03 17:43:32');
INSERT INTO `wancll_user_bonus_logs` VALUES ('188', '17', '87', '8', '89', '2', '', 'city', '200.00', '', '20.00', '', '0.00', '2', '1', '0', '', '', '1', '2018-09-04 10:35:22', '2018-09-04 10:35:22');
INSERT INTO `wancll_user_bonus_logs` VALUES ('189', '2', '87', '8', '89', '2', '', 'province', '100.00', '', '10.00', '', '0.00', '2', '1', '0', '', '', '1', '2018-09-04 10:35:22', '2018-09-04 10:35:22');

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
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_commission_logs`
-- -----------------------------
INSERT INTO `wancll_user_commission_logs` VALUES ('1', '2', '33', '6', '35', '1', '15.00', '100.00', '15.00', '15.00', '15.00', '17', '3', '3', '3', 'F2018090116142890123', '1', '2018-08-31 16:42:53', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('2', '2', '34', '6', '36', '1', '11.00', '100.00', '11.00', '11.00', '11.00', '17', '3', '3', '3', 'F2018090116142890123', '1', '2018-08-31 16:44:59', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('3', '2', '35', '6', '37', '1', '11.00', '100.00', '11.00', '11.00', '11.00', '17', '3', '3', '3', 'F2018090116142890123', '1', '2018-08-31 16:46:12', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('4', '2', '36', '6', '38', '1', '11.00', '100.00', '11.00', '11.00', '11.00', '17', '3', '3', '3', 'F2018090116142890123', '1', '2018-08-31 16:46:18', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('5', '17', '37', '4', '39', '1', '362.89', '', '11.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-08-31 17:03:52', '2018-08-31 17:03:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('6', '2', '37', '4', '39', '2', '428.87', '', '13.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-08-31 17:03:52', '2018-08-31 17:03:58');
INSERT INTO `wancll_user_commission_logs` VALUES ('7', '17', '39', '4', '41', '1', '362.89', '3299.00', '11.00', '362.89', '362.89', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-08-31 17:09:41', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('8', '2', '39', '4', '41', '2', '428.87', '3299.00', '13.00', '428.87', '428.87', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-08-31 17:09:41', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('9', '2', '40', '4', '42', '1', '494.85', '', '15.00', '', '0.00', '17', '2', '0', '', '', '1', '2018-08-31 17:47:30', '2018-08-31 17:47:35');
INSERT INTO `wancll_user_commission_logs` VALUES ('10', '17', '41', '4', '43', '1', '362.89', '3299.00', '11.00', '362.89', '362.89', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-08-31 17:53:02', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('11', '2', '41', '4', '43', '2', '428.87', '3299.00', '13.00', '428.87', '428.87', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-08-31 17:53:02', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('12', '17', '42', '4', '44', '1', '362.89', '3299.00', '11.00', '362.89', '362.89', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-08-31 17:55:43', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('13', '2', '42', '4', '44', '2', '428.87', '3299.00', '13.00', '428.87', '428.87', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-08-31 17:55:43', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('14', '17', '43', '4', '45', '1', '362.89', '3299.00', '11.00', '362.89', '362.89', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-08-31 17:55:50', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('15', '2', '43', '4', '45', '2', '428.87', '3299.00', '13.00', '428.87', '428.87', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-08-31 17:55:50', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('16', '17', '44', '7', '46', '1', '110.00', '1000.00', '11.00', '110.00', '110.00', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-09-01 09:23:04', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('17', '2', '44', '7', '46', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 09:23:04', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('18', '17', '45', '7', '47', '1', '110.00', '1000.00', '11.00', '110.00', '110.00', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-09-01 09:37:40', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('19', '2', '45', '7', '47', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 09:37:40', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('20', '17', '46', '7', '48', '1', '110.00', '1000.00', '11.00', '110.00', '110.00', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-09-01 09:44:02', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('21', '2', '46', '7', '48', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 09:44:02', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('22', '17', '47', '7', '49', '1', '110.00', '1000.00', '11.00', '110.00', '110.00', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-09-01 09:51:06', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('23', '2', '47', '7', '49', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 09:51:06', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('24', '17', '48', '7', '50', '1', '110.00', '1000.00', '11.00', '110.00', '110.00', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-09-01 10:26:30', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('25', '2', '48', '7', '50', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 10:26:30', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('26', '17', '49', '7', '51', '1', '110.00', '1000.00', '11.00', '110.00', '110.00', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-09-01 10:28:27', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('27', '2', '49', '7', '51', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 10:28:27', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('28', '17', '50', '7', '52', '1', '110.00', '1000.00', '11.00', '110.00', '110.00', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-09-01 10:29:51', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('29', '2', '50', '7', '52', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 10:29:51', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('30', '17', '51', '7', '53', '1', '110.00', '', '11.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-01 10:31:50', '2018-09-01 10:31:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('31', '2', '51', '7', '53', '2', '130.00', '', '13.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-01 10:31:50', '2018-09-01 10:31:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('32', '17', '52', '7', '54', '1', '110.00', '1000.00', '11.00', '110.00', '110.00', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-09-01 10:33:04', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('33', '2', '52', '7', '54', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 10:33:04', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('34', '17', '53', '7', '55', '1', '110.00', '1000.00', '11.00', '110.00', '110.00', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-09-01 10:33:17', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('35', '2', '53', '7', '55', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 10:33:17', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('36', '17', '54', '7', '56', '1', '110.00', '1000.00', '11.00', '110.00', '110.00', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-09-01 10:34:30', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('37', '2', '54', '7', '56', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 10:34:30', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('38', '17', '55', '7', '57', '1', '110.00', '1000.00', '11.00', '110.00', '110.00', '18', '3', '3', '1', 'F2018090110433107068', '1', '2018-09-01 10:35:18', '2018-09-01 10:52:38');
INSERT INTO `wancll_user_commission_logs` VALUES ('39', '2', '55', '7', '57', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 10:35:18', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('40', '2', '56', '7', '58', '1', '150.00', '1000.00', '15.00', '150.00', '150.00', '17', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 11:02:50', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('41', '2', '57', '7', '59', '1', '150.00', '1000.00', '15.00', '150.00', '150.00', '17', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 11:10:49', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('42', '2', '58', '7', '60', '1', '150.00', '1000.00', '15.00', '150.00', '150.00', '17', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 11:31:44', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('43', '17', '59', '7', '61', '1', '150.00', '1000.00', '15.00', '150.00', '150.00', '18', '3', '3', '2', 'F2018090116131731918', '1', '2018-09-01 11:53:44', '2018-09-01 16:15:05');
INSERT INTO `wancll_user_commission_logs` VALUES ('44', '2', '59', '7', '61', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 11:53:44', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('45', '17', '63', '4', '65', '1', '494.85', '3299.00', '15.00', '494.85', '494.85', '18', '3', '3', '2', 'F2018090116131731918', '1', '2018-09-01 14:03:51', '2018-09-01 16:15:05');
INSERT INTO `wancll_user_commission_logs` VALUES ('46', '2', '63', '4', '65', '2', '428.87', '3299.00', '13.00', '428.87', '428.87', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 14:03:51', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('47', '17', '64', '7', '66', '1', '150.00', '1000.00', '15.00', '150.00', '150.00', '18', '3', '3', '2', 'F2018090116131731918', '1', '2018-09-01 15:49:46', '2018-09-01 16:15:05');
INSERT INTO `wancll_user_commission_logs` VALUES ('48', '2', '64', '7', '66', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 15:49:46', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('49', '17', '65', '7', '67', '1', '150.00', '1000.00', '15.00', '150.00', '150.00', '18', '3', '3', '2', 'F2018090116131731918', '1', '2018-09-01 15:51:09', '2018-09-01 16:15:05');
INSERT INTO `wancll_user_commission_logs` VALUES ('50', '2', '65', '7', '67', '2', '130.00', '1000.00', '13.00', '130.00', '130.00', '18', '3', '3', '3', 'F2018090116142890123', '1', '2018-09-01 15:51:09', '2018-09-01 16:14:57');
INSERT INTO `wancll_user_commission_logs` VALUES ('51', '17', '66', '7', '68', '1', '1500.00', '', '15.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-01 16:11:43', '2018-09-01 16:11:47');
INSERT INTO `wancll_user_commission_logs` VALUES ('52', '2', '66', '7', '68', '2', '1300.00', '', '13.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-01 16:11:43', '2018-09-01 16:11:47');
INSERT INTO `wancll_user_commission_logs` VALUES ('53', '17', '67', '7', '69', '1', '1100.00', '10000.00', '11.00', '1100.00', '1100.00', '18', '3', '3', '4', 'F2018090309263607136', '1', '2018-09-01 16:44:19', '2018-09-03 09:27:06');
INSERT INTO `wancll_user_commission_logs` VALUES ('54', '2', '67', '7', '69', '2', '800.00', '10000.00', '8.00', '800.00', '800.00', '18', '3', '3', '5', 'F2018090309300604209', '1', '2018-09-01 16:44:19', '2018-09-03 09:32:20');
INSERT INTO `wancll_user_commission_logs` VALUES ('55', '17', '68', '7', '70', '1', '1100.00', '10000.00', '11.00', '1100.00', '1100.00', '18', '3', '3', '4', 'F2018090309263607136', '1', '2018-09-01 16:45:23', '2018-09-03 09:27:06');
INSERT INTO `wancll_user_commission_logs` VALUES ('56', '2', '68', '7', '70', '2', '800.00', '10000.00', '8.00', '800.00', '800.00', '18', '3', '3', '5', 'F2018090309300604209', '1', '2018-09-01 16:45:23', '2018-09-03 09:32:20');
INSERT INTO `wancll_user_commission_logs` VALUES ('57', '17', '69', '7', '71', '1', '1100.00', '10000.00', '11.00', '1100.00', '1100.00', '18', '3', '3', '4', 'F2018090309263607136', '1', '2018-09-01 16:50:36', '2018-09-03 09:27:06');
INSERT INTO `wancll_user_commission_logs` VALUES ('58', '2', '69', '7', '71', '2', '800.00', '10000.00', '8.00', '800.00', '800.00', '18', '3', '3', '5', 'F2018090309300604209', '1', '2018-09-01 16:50:36', '2018-09-03 09:32:20');
INSERT INTO `wancll_user_commission_logs` VALUES ('59', '17', '70', '7', '72', '1', '7700.00', '70000.00', '11.00', '7700.00', '7700.00', '18', '3', '3', '4', 'F2018090309263607136', '1', '2018-09-01 16:51:28', '2018-09-03 09:27:06');
INSERT INTO `wancll_user_commission_logs` VALUES ('60', '2', '70', '7', '72', '2', '5600.00', '70000.00', '8.00', '5600.00', '5600.00', '18', '3', '3', '5', 'F2018090309300604209', '1', '2018-09-01 16:51:28', '2018-09-03 09:32:20');
INSERT INTO `wancll_user_commission_logs` VALUES ('61', '2', '71', '7', '73', '1', '1100.00', '', '11.00', '', '0.00', '17', '2', '0', '', '', '1', '2018-09-01 16:55:09', '2018-09-01 16:55:14');
INSERT INTO `wancll_user_commission_logs` VALUES ('62', '17', '72', '7', '74', '1', '1100.00', '10000.00', '11.00', '1100.00', '1100.00', '18', '3', '3', '4', 'F2018090309263607136', '1', '2018-09-01 16:56:15', '2018-09-03 09:27:06');
INSERT INTO `wancll_user_commission_logs` VALUES ('63', '2', '72', '7', '74', '2', '800.00', '10000.00', '8.00', '800.00', '800.00', '18', '3', '3', '5', 'F2018090309300604209', '1', '2018-09-01 16:56:15', '2018-09-03 09:32:20');
INSERT INTO `wancll_user_commission_logs` VALUES ('64', '17', '73', '7', '75', '1', '1100.00', '10000.00', '11.00', '1100.00', '1100.00', '18', '3', '3', '4', 'F2018090309263607136', '1', '2018-09-01 16:57:11', '2018-09-03 09:27:06');
INSERT INTO `wancll_user_commission_logs` VALUES ('65', '2', '73', '7', '75', '2', '800.00', '10000.00', '8.00', '800.00', '800.00', '18', '3', '3', '5', 'F2018090309300604209', '1', '2018-09-01 16:57:11', '2018-09-03 09:32:20');
INSERT INTO `wancll_user_commission_logs` VALUES ('66', '17', '74', '7', '76', '1', '1500.00', '', '15.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-03 09:33:08', '2018-09-03 09:33:12');
INSERT INTO `wancll_user_commission_logs` VALUES ('67', '2', '74', '7', '76', '2', '1300.00', '', '13.00', '', '0.00', '18', '2', '0', '', '', '1', '2018-09-03 09:33:08', '2018-09-03 09:33:12');
INSERT INTO `wancll_user_commission_logs` VALUES ('68', '17', '75', '6', '77', '1', '15.00', '100.00', '15.00', '15.00', '15.00', '18', '3', '3', '6', 'F2018090310301745821', '1', '2018-09-03 09:41:52', '2018-09-04 10:27:44');
INSERT INTO `wancll_user_commission_logs` VALUES ('69', '2', '75', '6', '77', '2', '13.00', '100.00', '13.00', '13.00', '0.00', '18', '3', '1', '7', 'F2018090410284155947', '1', '2018-09-03 09:41:52', '2018-09-04 10:28:55');
INSERT INTO `wancll_user_commission_logs` VALUES ('70', '17', '76', '7', '78', '1', '1100.00', '10000.00', '11.00', '1100.00', '1100.00', '18', '3', '3', '6', 'F2018090310301745821', '1', '2018-09-03 10:07:01', '2018-09-04 10:27:44');
INSERT INTO `wancll_user_commission_logs` VALUES ('71', '2', '76', '7', '78', '2', '800.00', '10000.00', '8.00', '800.00', '0.00', '18', '3', '1', '7', 'F2018090410284155947', '1', '2018-09-03 10:07:01', '2018-09-04 10:28:55');
INSERT INTO `wancll_user_commission_logs` VALUES ('72', '17', '77', '7', '79', '1', '2200.00', '20000.00', '11.00', '2200.00', '2200.00', '18', '3', '3', '6', 'F2018090310301745821', '1', '2018-09-03 10:08:59', '2018-09-04 10:27:44');
INSERT INTO `wancll_user_commission_logs` VALUES ('73', '2', '77', '7', '79', '2', '1600.00', '20000.00', '8.00', '1600.00', '0.00', '18', '3', '1', '7', 'F2018090410284155947', '1', '2018-09-03 10:08:59', '2018-09-04 10:28:55');
INSERT INTO `wancll_user_commission_logs` VALUES ('74', '2', '78', '6', '80', '1', '9.90', '', '11.00', '', '0.00', '17', '1', '0', '', '', '1', '2018-09-03 10:41:24', '2018-09-03 10:41:24');
INSERT INTO `wancll_user_commission_logs` VALUES ('75', '2', '79', '7', '81', '1', '770.00', '', '11.00', '', '0.00', '17', '1', '0', '', '', '1', '2018-09-03 11:02:30', '2018-09-03 11:02:30');
INSERT INTO `wancll_user_commission_logs` VALUES ('76', '2', '80', '7', '82', '1', '550.00', '', '11.00', '', '0.00', '17', '2', '0', '', '', '1', '2018-09-03 11:02:39', '2018-09-03 11:02:48');
INSERT INTO `wancll_user_commission_logs` VALUES ('77', '12', '88', '8', '91', '1', '130.00', '1000.00', '13.00', '130.00', '0.00', '14', '3', '0', '', '', '1', '2018-09-04 10:41:48', '2018-09-04 10:42:39');
INSERT INTO `wancll_user_commission_logs` VALUES ('78', '12', '88', '7', '90', '1', '1300.00', '10000.00', '13.00', '1300.00', '0.00', '14', '3', '0', '', '', '1', '2018-09-04 10:41:48', '2018-09-04 10:42:39');

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_coupons`
-- -----------------------------
INSERT INTO `wancll_user_coupons` VALUES ('1', '17', '3', '5', 'U2018090310401704569', 'discount', '2018-09-30 00:00:00', '1000.00', '5.00', '2', '1', '2018-09-03 10:40:17', '2018-09-03 11:02:39');
INSERT INTO `wancll_user_coupons` VALUES ('2', '17', '4', '2', 'U2018090310401808076', 'discount', '2018-09-30 00:00:00', '10000.00', '7.00', '2', '1', '2018-09-03 10:40:18', '2018-09-03 11:02:30');
INSERT INTO `wancll_user_coupons` VALUES ('3', '17', '2', '8', 'U2018090310401957692', 'full', '2018-09-30 00:00:00', '10000.00', '1000.00', '1', '1', '2018-09-03 10:40:19', '2018-09-03 10:40:19');
INSERT INTO `wancll_user_coupons` VALUES ('4', '17', '1', '7', 'U2018090310402828239', 'full', '2018-09-30 00:00:00', '1000.00', '100.00', '1', '1', '2018-09-03 10:40:28', '2018-09-03 10:40:28');
INSERT INTO `wancll_user_coupons` VALUES ('5', '14', '5', '8', 'U2018090410434983496', 'discount', '2018-09-30 00:00:00', '100000.00', '1.00', '1', '1', '2018-09-04 10:43:49', '2018-09-04 10:43:49');
INSERT INTO `wancll_user_coupons` VALUES ('6', '14', '4', '2', 'U2018090410434954461', 'discount', '2018-09-30 00:00:00', '10000.00', '7.00', '1', '1', '2018-09-04 10:43:49', '2018-09-04 10:43:49');
INSERT INTO `wancll_user_coupons` VALUES ('7', '14', '2', '8', 'U2018090410435058358', 'full', '2018-09-30 00:00:00', '10000.00', '1000.00', '1', '1', '2018-09-04 10:43:50', '2018-09-04 10:43:50');
INSERT INTO `wancll_user_coupons` VALUES ('8', '14', '3', '5', 'U2018090410435102622', 'discount', '2018-09-30 00:00:00', '1000.00', '5.00', '1', '1', '2018-09-04 10:43:51', '2018-09-04 10:43:51');
INSERT INTO `wancll_user_coupons` VALUES ('9', '14', '1', '7', 'U2018090410435232716', 'full', '2018-09-30 00:00:00', '1000.00', '100.00', '1', '1', '2018-09-04 10:43:52', '2018-09-04 10:43:52');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_drawcashs`
-- -----------------------------
INSERT INTO `wancll_user_drawcashs` VALUES ('1', '2', 'D2018083115401939916', 'money', 'withdrawToBankCard', '1.00', '5', '中国农业银行', '1', '1', '1', '3', '1', '2018-08-31 15:40:19', '2018-08-31 18:02:58');
INSERT INTO `wancll_user_drawcashs` VALUES ('2', '18', 'D2018090113541221836', 'money', 'withdrawToBankCard', '1.00', '6', '中国农业银行', 'dabhdadh到爱的奇偶假的', '111', '0', '1', '1', '2018-09-01 13:54:12', '2018-09-01 13:54:12');

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
INSERT INTO `wancll_user_goods_keywords` VALUES ('6', '[\"家用电器\",\"电脑办公\",\"服饰内衣\"]', '1', '2018-08-23 10:15:43', '2018-08-23 10:21:04');
INSERT INTO `wancll_user_goods_keywords` VALUES ('12', '[\"家用电器\",\"普货\",\"电脑办公\",\"服饰内衣\"]', '1', '2018-08-24 07:38:05', '2018-08-24 13:12:25');
INSERT INTO `wancll_user_goods_keywords` VALUES ('13', '[\"测试商品\"]', '1', '2018-08-24 12:57:52', '2018-08-24 12:57:52');
INSERT INTO `wancll_user_goods_keywords` VALUES ('2', '[\"打的\",\"测试\",\"ff\",\"的\",\"规范\"]', '1', '2018-08-31 16:11:48', '2018-09-04 10:34:47');
INSERT INTO `wancll_user_goods_keywords` VALUES ('18', '[\"男\"]', '1', '2018-09-01 09:20:28', '2018-09-01 16:43:33');

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
INSERT INTO `wancll_user_info` VALUES ('1', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-07-20 09:35:36', '2018-07-20 09:35:36');
INSERT INTO `wancll_user_info` VALUES ('2', '13', '24273.00', '[3,2,5,4,1,7]', '22558.97', '16475.35', '14062.35', '2413.00', '45393.80', '35555.42', '29545.42', '0.00', '1', '2018-07-23 15:25:59', '2018-09-04 10:35:22');
INSERT INTO `wancll_user_info` VALUES ('3', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '2.15', '0.00', '0.00', '0.00', '1', '2018-07-25 10:42:12', '2018-07-30 10:51:20');
INSERT INTO `wancll_user_info` VALUES ('4', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-07-28 09:19:25', '2018-07-28 09:19:25');
INSERT INTO `wancll_user_info` VALUES ('5', '2', '3309.00', '[3,4]', '0.00', '0.00', '0.00', '0.00', '32.99', '32.99', '0.00', '0.00', '1', '2018-07-28 10:50:06', '2018-08-04 17:40:29');
INSERT INTO `wancll_user_info` VALUES ('6', '1', '10.00', '[3]', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-07-28 14:45:41', '2018-07-31 14:10:22');
INSERT INTO `wancll_user_info` VALUES ('7', '2', '1009.00', '[3,4]', '0.00', '0.00', '0.00', '0.00', '2.00', '0.00', '0.00', '0.00', '1', '2018-07-30 09:04:51', '2018-08-10 09:13:53');
INSERT INTO `wancll_user_info` VALUES ('8', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-07-30 11:37:02', '2018-07-30 11:37:02');
INSERT INTO `wancll_user_info` VALUES ('9', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-08-03 15:10:02', '2018-08-03 15:10:02');
INSERT INTO `wancll_user_info` VALUES ('10', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-08-03 15:11:19', '2018-08-03 15:11:19');
INSERT INTO `wancll_user_info` VALUES ('11', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-08-04 17:16:04', '2018-08-04 17:16:04');
INSERT INTO `wancll_user_info` VALUES ('12', '3', '360.00', '[5,6]', '1430.00', '1430.00', '0.00', '0.00', '1920.00', '1800.00', '0.00', '0.00', '1', '2018-08-23 23:17:50', '2018-09-04 10:42:39');
INSERT INTO `wancll_user_info` VALUES ('13', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '1920.00', '1800.00', '0.00', '0.00', '1', '2018-08-24 12:49:06', '2018-09-01 16:12:03');
INSERT INTO `wancll_user_info` VALUES ('14', '1', '11000.00', '[8,7]', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-08-31 14:49:53', '2018-09-04 10:42:39');
INSERT INTO `wancll_user_info` VALUES ('15', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-08-31 14:53:56', '2018-08-31 14:53:56');
INSERT INTO `wancll_user_info` VALUES ('16', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-08-31 15:11:47', '2018-08-31 15:11:47');
INSERT INTO `wancll_user_info` VALUES ('17', '9', '3400.00', '[6,7,5]', '23594.30', '20121.41', '20121.41', '0.00', '44401.42', '36355.44', '30017.44', '0.00', '1', '2018-08-31 16:41:58', '2018-09-04 10:35:22');
INSERT INTO `wancll_user_info` VALUES ('18', '30', '180647.00', '[4,7,2,6]', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-08-31 17:01:44', '2018-09-03 10:09:29');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_levels`
-- -----------------------------
INSERT INTO `wancll_user_levels` VALUES ('1', '普通会员', '0.00', '初始会员等级', '1', '1', '2018-07-27 19:40:15', '2018-07-27 19:40:15');
INSERT INTO `wancll_user_levels` VALUES ('2', '一星会员', '100.00', '', '1', '1', '2018-07-27 19:40:32', '2018-07-27 19:40:32');
INSERT INTO `wancll_user_levels` VALUES ('3', '二星会员', '200.00', '', '1', '1', '2018-07-27 19:40:43', '2018-07-27 19:40:43');
INSERT INTO `wancll_user_levels` VALUES ('4', '三星会员', '300.00', '', '1', '1', '2018-07-27 19:40:53', '2018-07-27 19:40:53');
INSERT INTO `wancll_user_levels` VALUES ('5', '四星会员', '400.00', '', '1', '1', '2018-07-27 19:41:05', '2018-07-27 19:41:05');
INSERT INTO `wancll_user_levels` VALUES ('6', '五星会员', '500.00', '', '1', '1', '2018-07-27 19:41:15', '2018-07-27 19:41:15');
INSERT INTO `wancll_user_levels` VALUES ('7', '3', '33.00', '33', '1', '0', '2018-08-24 10:45:59', '2018-08-24 10:46:07');

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_recharges`
-- -----------------------------
INSERT INTO `wancll_user_recharges` VALUES ('1', '3', 'R2018072719413597581', 'money', '9', '10000.00', '1', '9', '2018-07-27 19:41:35', '3', '1', '2018-07-27 19:41:35', '2018-07-27 19:41:35');
INSERT INTO `wancll_user_recharges` VALUES ('2', '2', 'R2018072719414183287', 'money', '9', '10000.00', '1', '9', '2018-07-27 19:41:41', '3', '1', '2018-07-27 19:41:41', '2018-07-27 19:41:41');
INSERT INTO `wancll_user_recharges` VALUES ('3', '1', 'R2018072719414667179', 'money', '9', '10000.00', '1', '9', '2018-07-27 19:41:46', '3', '1', '2018-07-27 19:41:46', '2018-07-27 19:41:46');
INSERT INTO `wancll_user_recharges` VALUES ('4', '4', 'R2018072810015466294', 'money', '9', '10000.00', '1', '9', '2018-07-28 10:01:54', '3', '1', '2018-07-28 10:01:54', '2018-07-28 10:01:54');
INSERT INTO `wancll_user_recharges` VALUES ('5', '5', 'R2018072810514789831', 'money', '9', '10000.00', '1', '9', '2018-07-28 10:51:47', '3', '1', '2018-07-28 10:51:47', '2018-07-28 10:51:47');
INSERT INTO `wancll_user_recharges` VALUES ('6', '6', 'R2018072814461172861', 'money', '9', '5000.00', '1', '9', '2018-07-28 14:46:11', '3', '1', '2018-07-28 14:46:11', '2018-07-28 14:46:11');
INSERT INTO `wancll_user_recharges` VALUES ('7', '7', 'R2018073011172287043', 'money', '9', '10000.00', '1', '9', '2018-07-30 11:17:22', '3', '1', '2018-07-30 11:17:22', '2018-07-30 11:17:22');
INSERT INTO `wancll_user_recharges` VALUES ('8', '8', 'R2018073011542170540', 'money', '9', '10000.00', '1', '9', '2018-07-30 11:54:21', '3', '1', '2018-07-30 11:54:21', '2018-07-30 11:54:21');
INSERT INTO `wancll_user_recharges` VALUES ('9', '1', 'R2018080816324858522', 'money', '1', '1.00', '0', '', '', '1', '1', '2018-08-08 16:32:48', '2018-08-08 16:32:48');
INSERT INTO `wancll_user_recharges` VALUES ('10', '1', 'R2018080816325687196', 'money', '1', '1.00', '0', '', '', '1', '1', '2018-08-08 16:32:56', '2018-08-08 16:32:56');
INSERT INTO `wancll_user_recharges` VALUES ('11', '1', 'R2018080816330641029', 'money', '1', '1.00', '0', '', '', '1', '1', '2018-08-08 16:33:06', '2018-08-08 16:33:06');
INSERT INTO `wancll_user_recharges` VALUES ('12', '12', 'R2018082411331336722', 'money', '9', '1000.00', '1', '9', '2018-08-24 11:33:13', '3', '1', '2018-08-24 11:33:13', '2018-08-24 11:33:13');
INSERT INTO `wancll_user_recharges` VALUES ('13', '12', 'R2018082413422830794', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-08-24 13:42:28', '2018-08-24 13:42:28');
INSERT INTO `wancll_user_recharges` VALUES ('14', '2', 'R2018082514374996315', 'money', '9', '100000.00', '1', '9', '2018-08-25 14:37:49', '3', '1', '2018-08-25 14:37:49', '2018-08-25 14:37:49');
INSERT INTO `wancll_user_recharges` VALUES ('15', '14', 'R2018083114560055789', 'money', '9', '100000.00', '1', '9', '2018-08-31 14:56:00', '3', '1', '2018-08-31 14:56:00', '2018-08-31 14:56:00');
INSERT INTO `wancll_user_recharges` VALUES ('16', '17', 'R2018083116422678991', 'money', '9', '100000.00', '1', '9', '2018-08-31 16:42:26', '3', '1', '2018-08-31 16:42:26', '2018-08-31 16:42:26');
INSERT INTO `wancll_user_recharges` VALUES ('17', '18', 'R2018083117030842062', 'money', '9', '1000001.00', '1', '9', '2018-08-31 17:03:08', '3', '1', '2018-08-31 17:03:08', '2018-08-31 17:03:08');
INSERT INTO `wancll_user_recharges` VALUES ('18', '18', 'R2018090116062346192', 'money', '9', '1000000.00', '1', '9', '2018-09-01 16:06:23', '3', '1', '2018-09-01 16:06:23', '2018-09-01 16:06:23');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_third_accounts`
-- -----------------------------
INSERT INTO `wancll_user_third_accounts` VALUES ('1', '17', 'wap', 'ali', '黄跃龙', '13874930708', '1', '2018-08-31 17:00:09', '2018-08-31 17:00:09');

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
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_tokens`
-- -----------------------------
INSERT INTO `wancll_user_tokens` VALUES ('1', '2', '2', 'wap', 'user&wap@9d37455c877723930e8646afca7fe9e6', 'user&wap@68ea59e3842476a3f36f836887855b60', '7200', '1', '2018-08-16 15:47:28', '2018-08-16 15:47:28');
INSERT INTO `wancll_user_tokens` VALUES ('15', '2', '2', 'wap', 'user&wap@640f5874d91ce34b5a867cf3c965033e', 'user&wap@6a3ff47711bb54051f296504aadbf757', '7200', '1', '2018-08-25 14:26:35', '2018-08-25 14:26:35');
INSERT INTO `wancll_user_tokens` VALUES ('3', '3', '3', 'wap', 'user&wap@fd6092842094d12ab579f05fa2ef8963', 'user&wap@c81cebd96423d40566e25c5b2d5d7a05', '7200', '1', '2018-08-21 11:23:16', '2018-08-21 11:23:16');
INSERT INTO `wancll_user_tokens` VALUES ('8', '6', '6', 'wap', 'user&wap@d51db05ef4ae2cb39cf399c1b1f94286', 'user&wap@3f4e01ca8626db97705f6248c98996b1', '7200', '1', '2018-08-24 09:36:09', '2018-08-24 09:36:09');
INSERT INTO `wancll_user_tokens` VALUES ('17', '2', '2', 'wechat', 'user&wechat@1ca9302a4c9b5633215622ef13ed8c91', 'user&wechat@028429ce7a4302285f89687a7e14e04e', '7200', '1', '2018-08-28 14:24:32', '2018-08-28 14:24:32');
INSERT INTO `wancll_user_tokens` VALUES ('6', '12', '12', 'wechat', 'user&wechat@98adf29944e1d3700dcb03c113857eb0', 'user&wechat@6d464996c87552d2537b9b2e5cbd9ae5', '7200', '1', '2018-08-23 23:17:50', '2018-08-23 23:17:50');
INSERT INTO `wancll_user_tokens` VALUES ('7', '12', '12', 'pc', 'user&pc@32b8e7417ad5fd39cb5a61dd47474542', 'user&pc@53fc8228f1a26e031431b8396648bdff', '7200', '1', '2018-08-24 07:29:01', '2018-08-24 07:29:01');
INSERT INTO `wancll_user_tokens` VALUES ('9', '12', '12', 'wechat', 'user&wechat@96c43673e7ceb95c42553413c157244e', 'user&wechat@8a3c1a80b9c447b152a561c8fbe15ca2', '7200', '1', '2018-08-24 09:41:11', '2018-08-24 09:41:11');
INSERT INTO `wancll_user_tokens` VALUES ('10', '12', '12', 'pc', 'user&pc@996f6acfb1f5c6e817a5403cb0c1d5b2', 'user&pc@b73ba0a0e9d3f1d0d4e44c25ab5c125b', '7200', '1', '2018-08-24 11:18:30', '2018-08-24 11:18:30');
INSERT INTO `wancll_user_tokens` VALUES ('12', '13', '13', 'wechat', 'user&wechat@2806976a60d96d2a3e506ae4376a1a17', 'user&wechat@400df67dd14671a21350a68ed64b7b00', '7200', '1', '2018-08-24 12:49:06', '2018-08-24 12:49:06');
INSERT INTO `wancll_user_tokens` VALUES ('13', '12', '12', 'wechat', 'user&wechat@4bf00de5afd2257ab4cb5c6e111e0f40', 'user&wechat@7e10aced3dad74c3a6d2efd7a096b6f1', '7200', '1', '2018-08-24 13:33:51', '2018-08-24 13:33:51');
INSERT INTO `wancll_user_tokens` VALUES ('14', '2', '2', 'wechat', 'user&wechat@33a0df1f1302e3a37ae06f51ee579163', 'user&wechat@7677004e4436b32b6f38fba59ccf0a5f', '7200', '1', '2018-08-25 14:25:39', '2018-08-25 14:25:39');
INSERT INTO `wancll_user_tokens` VALUES ('16', '2', '2', 'wechat', 'user&wechat@504df1bec1863baf66ef82600e735db7', 'user&wechat@48a6ee9eda1bd6bcd6adbfed42d66097', '7200', '1', '2018-08-25 14:37:35', '2018-08-25 14:37:35');
INSERT INTO `wancll_user_tokens` VALUES ('18', '1', '1', 'wap', 'user&wap@906eb5aac9ff7bb5c3ec519ffa5094f0', 'user&wap@826cf4998bd6ff8b9c950820f44756b5', '7200', '1', '2018-08-28 21:57:20', '2018-08-28 21:57:20');
INSERT INTO `wancll_user_tokens` VALUES ('19', '12', '12', 'wap', 'user&wap@0f566b9b465f1ccf659019ace04313e2', 'user&wap@5a97e70ba5e9a6f1da35e9c6413654fd', '7200', '1', '2018-08-30 09:50:16', '2018-08-30 09:50:16');
INSERT INTO `wancll_user_tokens` VALUES ('20', '12', '12', 'wap', 'user&wap@5420951addcc15cde8a7dd4e1bb78ee9', 'user&wap@356af32f3220600151a3b0ba68f79403', '7200', '1', '2018-08-31 09:28:31', '2018-08-31 09:28:31');
INSERT INTO `wancll_user_tokens` VALUES ('21', '2', '2', 'wechat', 'user&wechat@ed10f0f5cd1880b0cfe992679685406c', 'user&wechat@2921dc0bb12bded8992f1e0077c1373c', '7200', '1', '2018-08-31 10:28:16', '2018-08-31 14:06:05');
INSERT INTO `wancll_user_tokens` VALUES ('22', '2', '2', 'wap', 'user&wap@e0ca7f6ada29579aed3fecef9de4c798', 'user&wap@f2836cbd972cd73a5be80fa4be52c863', '7200', '1', '2018-08-31 10:30:34', '2018-08-31 15:49:38');
INSERT INTO `wancll_user_tokens` VALUES ('23', '2', '2', 'wechat', 'user&wechat@157180450d896b13513a60fb95bdf0d7', 'user&wechat@c0216def5f87537ba65f3632ee659a38', '7200', '1', '2018-08-31 14:07:07', '2018-08-31 14:07:07');
INSERT INTO `wancll_user_tokens` VALUES ('24', '14', '14', 'wap', 'user&wap@7e4f2c564048a4cf58d048f8454a085b', 'user&wap@dd96ff7671e6c5ac7113451a1c21154f', '7200', '1', '2018-08-31 14:49:53', '2018-08-31 14:49:53');
INSERT INTO `wancll_user_tokens` VALUES ('25', '14', '14', 'wap', 'user&wap@75f7f592a5b9280842ff7afb3aed1d9c', 'user&wap@8694eb3af7ef26224694511cef131b64', '7200', '1', '2018-08-31 14:53:14', '2018-08-31 14:53:14');
INSERT INTO `wancll_user_tokens` VALUES ('26', '15', '15', 'wap', 'user&wap@a30da26a011095621ee326584e06f68c', 'user&wap@b8a1c85e73635eee182046da2e4458ae', '7200', '1', '2018-08-31 14:53:56', '2018-08-31 14:53:56');
INSERT INTO `wancll_user_tokens` VALUES ('27', '14', '14', 'wap', 'user&wap@0584e123c731c22d7e79b803a2ad99fd', 'user&wap@57126a04e15ebb8e6569f2caccf5174f', '7200', '1', '2018-08-31 14:55:41', '2018-08-31 14:55:41');
INSERT INTO `wancll_user_tokens` VALUES ('28', '14', '14', 'wap', 'user&wap@092c236f2771abb782275ddd2eaaa975', 'user&wap@b7fa1e7b6b7aa1eb6bafa16540a1fdc2', '7200', '1', '2018-08-31 14:59:16', '2018-08-31 14:59:16');
INSERT INTO `wancll_user_tokens` VALUES ('29', '14', '14', 'wap', 'user&wap@c63d10d835eeff0b0213dd1b3b7be01f', 'user&wap@5235f85a5c56f4c0cbd143534c120171', '7200', '1', '2018-08-31 15:00:43', '2018-08-31 15:00:43');
INSERT INTO `wancll_user_tokens` VALUES ('30', '14', '14', 'wap', 'user&wap@1494b13c28d114ee6c17a5749c9298da', 'user&wap@93dfd9c6d9205c2e783af466c551cfc1', '7200', '1', '2018-08-31 15:03:37', '2018-08-31 15:03:37');
INSERT INTO `wancll_user_tokens` VALUES ('31', '14', '14', 'wap', 'user&wap@733cc977fa0f5638b96985602a4707f0', 'user&wap@b8b32bdb80ef91d01ae014e381cac7bb', '7200', '1', '2018-08-31 15:04:15', '2018-08-31 15:04:15');
INSERT INTO `wancll_user_tokens` VALUES ('32', '16', '16', 'wechat', 'user&wechat@12cceab2bb2c8b9d9f8b007b9e2509a6', 'user&wechat@06de512cf272a32e3cfb4a9ef1fa06b1', '7200', '1', '2018-08-31 15:11:47', '2018-08-31 15:11:47');
INSERT INTO `wancll_user_tokens` VALUES ('33', '12', '12', 'wechat', 'user&wechat@1a74c349c83bbb3cf13a902c602284bf', 'user&wechat@61e10714c676b6917168c0e9e8d6144c', '7200', '1', '2018-08-31 15:17:19', '2018-08-31 15:17:19');
INSERT INTO `wancll_user_tokens` VALUES ('34', '2', '2', 'wap', 'user&wap@9f986eec117eb9d95e81de40c60b6759', 'user&wap@4f48d693eef07f71b72aa2ad9a32f484', '7200', '1', '2018-08-31 15:39:11', '2018-08-31 15:39:11');
INSERT INTO `wancll_user_tokens` VALUES ('35', '2', '2', 'wechat', 'user&wechat@f3343bb028b94c7acf0635dec45d5503', 'user&wechat@f31a763e2f5dc8ccbe2aa15d2dde8758', '7200', '1', '2018-08-31 16:04:41', '2018-09-01 17:24:17');
INSERT INTO `wancll_user_tokens` VALUES ('36', '17', '17', 'wap', 'user&wap@7be5d05429a37152d8193d066f610073', 'user&wap@6234bc57f72db028fd3c09410741d15e', '7200', '1', '2018-08-31 16:41:58', '2018-08-31 16:41:58');
INSERT INTO `wancll_user_tokens` VALUES ('37', '2', '2', 'wap', 'user&wap@587d8ffd662b7d80ca10d26f49c78b2a', 'user&wap@bf58d6112da5d914bd4578406b4c11d9', '7200', '1', '2018-08-31 16:50:21', '2018-08-31 16:50:21');
INSERT INTO `wancll_user_tokens` VALUES ('53', '17', '17', 'wap', 'user&wap@60d9a184c68746910e7424a0197b9ffe', 'user&wap@ab5769d32735cacb270c73b0ab5afe29', '7200', '1', '2018-09-03 09:20:43', '2018-09-03 09:20:43');
INSERT INTO `wancll_user_tokens` VALUES ('39', '18', '18', 'wap', 'user&wap@78056b6a605f66b606011ddc2000ed4c', 'user&wap@8a10eac952c8b83a94491b0d968ca7b2', '7200', '1', '2018-08-31 17:01:44', '2018-09-01 09:04:03');
INSERT INTO `wancll_user_tokens` VALUES ('40', '2', '2', 'wap', 'user&wap@eebb6093e0dc559a0187ca69fc614b42', 'user&wap@fbf998110fc6abf56b781f4b9e2f4f59', '7200', '1', '2018-08-31 17:06:51', '2018-08-31 17:06:51');
INSERT INTO `wancll_user_tokens` VALUES ('41', '17', '17', 'wap', 'user&wap@36ef5846ed4ebd617f4595121258c878', 'user&wap@efd9a7937259f0398e52105579723028', '7200', '1', '2018-09-01 10:43:15', '2018-09-01 10:43:15');
INSERT INTO `wancll_user_tokens` VALUES ('42', '18', '18', 'wap', 'user&wap@ba775aa09b97e97fe54e8aa2b14f6a9f', 'user&wap@1cc3232deb6fd48372c986611e8c17a9', '7200', '1', '2018-09-01 11:35:44', '2018-09-01 11:35:44');
INSERT INTO `wancll_user_tokens` VALUES ('43', '17', '17', 'wap', 'user&wap@7ea8d6b8184ee4c5d5762b765c3a57f7', 'user&wap@b9480b5b4e53dd6648010f649ef1b4a1', '7200', '1', '2018-09-01 12:01:40', '2018-09-01 12:01:40');
INSERT INTO `wancll_user_tokens` VALUES ('44', '18', '18', 'wap', 'user&wap@02f05dd0b0ce693f47e559d01a9eb5e7', 'user&wap@33cd1e03bf96a4b8be88a19b4fd5e602', '7200', '1', '2018-09-01 13:48:56', '2018-09-01 15:49:16');
INSERT INTO `wancll_user_tokens` VALUES ('45', '18', '18', 'wechat', 'user&wechat@133e77602d7a68a8a6bf3429b3e9ef3c', 'user&wechat@e111f19f1ea3aec0e91185d2c3269276', '7200', '1', '2018-09-01 14:37:31', '2018-09-01 14:37:31');
INSERT INTO `wancll_user_tokens` VALUES ('63', '2', '2', 'wap', 'user&wap@f3e538d2d6df92af434bb14920a3de46', 'user&wap@3f925be1484f7c35776538fc49f73d53', '7200', '1', '2018-09-03 15:39:11', '2018-09-03 15:39:11');
INSERT INTO `wancll_user_tokens` VALUES ('47', '17', '17', 'wap', 'user&wap@04668bbabebc3bc9932521fb46ca81e4', 'user&wap@c811737ae327c966ba60e3e48f3637f6', '7200', '1', '2018-09-01 16:13:06', '2018-09-01 16:13:06');
INSERT INTO `wancll_user_tokens` VALUES ('48', '2', '2', 'wap', 'user&wap@c5b0484b7373607d5f1123d73e1c60cb', 'user&wap@a7beeeb2d5622d6a65c86ff06e624b32', '7200', '1', '2018-09-01 16:14:20', '2018-09-01 16:14:20');
INSERT INTO `wancll_user_tokens` VALUES ('49', '17', '17', 'wap', 'user&wap@d8444dbd5fc85c0f7d6345d4cafa26a1', 'user&wap@ed1719ec57aad159148433338e89bad2', '7200', '1', '2018-09-01 16:16:00', '2018-09-01 16:16:00');
INSERT INTO `wancll_user_tokens` VALUES ('50', '18', '18', 'wap', 'user&wap@6b965a6d09b6db4aa6c208863fa14cea', 'user&wap@ff0f3cb3ba082bcf8054cf9ef0e0f78a', '7200', '1', '2018-09-01 16:43:14', '2018-09-01 16:43:14');
INSERT INTO `wancll_user_tokens` VALUES ('51', '17', '17', 'wap', 'user&wap@33fb6a334a0c18f1c2228f1ad1b64aaf', 'user&wap@701aa3f70c0ed894f100a9840b91eac8', '7200', '1', '2018-09-01 16:52:34', '2018-09-01 16:52:34');
INSERT INTO `wancll_user_tokens` VALUES ('52', '18', '18', 'wap', 'user&wap@aed8ca767945937ccc1abdf3a5bc5fa9', 'user&wap@71efb6b52312d07b98dda1fbb02aac75', '7200', '1', '2018-09-01 16:56:08', '2018-09-01 16:56:08');
INSERT INTO `wancll_user_tokens` VALUES ('54', '18', '18', 'wap', 'user&wap@399ea32d98220c4b087e61996b3ec36e', 'user&wap@e4ddbc2d38af7640ffeb20488b3bfb19', '7200', '1', '2018-09-03 09:24:56', '2018-09-03 09:24:56');
INSERT INTO `wancll_user_tokens` VALUES ('55', '17', '17', 'wap', 'user&wap@39be7597ff3a12ba756753bb8b656af9', 'user&wap@a80534c3a98d67ca9203c3795aa57a19', '7200', '1', '2018-09-03 09:25:37', '2018-09-03 09:25:37');
INSERT INTO `wancll_user_tokens` VALUES ('56', '2', '2', 'wap', 'user&wap@87032209ef0bac577dd3439dcefd5919', 'user&wap@ae4b01e6a25b33366059e633c2edcf99', '7200', '1', '2018-09-03 09:29:21', '2018-09-03 09:29:21');
INSERT INTO `wancll_user_tokens` VALUES ('57', '18', '18', 'wap', 'user&wap@95cbba1295244860c2541dc9105091dd', 'user&wap@861667092b873a0db557ef0a9832cafd', '7200', '1', '2018-09-03 09:31:56', '2018-09-03 09:31:56');
INSERT INTO `wancll_user_tokens` VALUES ('58', '17', '17', 'wap', 'user&wap@011fb54aa70b16aa38e9a3e666e892b0', 'user&wap@852300c76ca310caa015cc01fb7c89ce', '7200', '1', '2018-09-03 10:08:26', '2018-09-03 10:08:26');
INSERT INTO `wancll_user_tokens` VALUES ('59', '18', '18', 'wap', 'user&wap@c297ff172b99eb9c43e6b95c3dddceb5', 'user&wap@bfd5fb5ac646bfc710c4c53b1f042e01', '7200', '1', '2018-09-03 10:08:51', '2018-09-03 10:08:51');
INSERT INTO `wancll_user_tokens` VALUES ('60', '17', '17', 'wap', 'user&wap@27fff9e822c59aa9d49c5fc2e5475a6e', 'user&wap@0cc91e0dafdf6a91c295b64a1649f81d', '7200', '1', '2018-09-03 10:30:06', '2018-09-03 10:30:06');
INSERT INTO `wancll_user_tokens` VALUES ('61', '2', '2', 'wap', 'user&wap@c057ae41217538f2b52c25c172c8f84b', 'user&wap@c28b0f6bb9f477dd177910336ec36501', '7200', '1', '2018-09-03 11:31:30', '2018-09-03 17:30:54');
INSERT INTO `wancll_user_tokens` VALUES ('62', '1', '1', 'applet', 'user&applet@89cbc681bf789345d0cf234ebfec3bf4', 'user&applet@9269e993fae45677f4a4a8dca50a0a94', '7200', '1', '2018-09-03 11:45:05', '2018-09-03 11:45:05');
INSERT INTO `wancll_user_tokens` VALUES ('64', '17', '17', 'wap', 'user&wap@0ebb0c48987def0a543bf339b6bd2bdd', 'user&wap@d10e7bbfd36448ac86eca50262f8685d', '7200', '1', '2018-09-03 17:43:53', '2018-09-04 09:29:14');
INSERT INTO `wancll_user_tokens` VALUES ('65', '2', '2', 'wechat', 'user&wechat@0c79c38d8d407f4a85661946a2d1981b', 'user&wechat@77aee954f3be89dc8e9de1d964c3be9a', '7200', '1', '2018-09-04 09:45:08', '2018-09-04 09:45:08');
INSERT INTO `wancll_user_tokens` VALUES ('66', '2', '2', 'wap', 'user&wap@ce46c5c0c78e4d031d73b56636212b54', 'user&wap@535323fde31240cbb6e2acd7ef04514e', '7200', '1', '2018-09-04 10:28:30', '2018-09-04 10:28:30');
INSERT INTO `wancll_user_tokens` VALUES ('67', '15', '15', 'wap', 'user&wap@638fb4e0721837970bf4c20dc89692f1', 'user&wap@7138aa9996a08c814aaa2e608969d57b', '7200', '1', '2018-09-04 10:38:38', '2018-09-04 10:38:38');
INSERT INTO `wancll_user_tokens` VALUES ('68', '14', '14', 'wap', 'user&wap@e881fc20c9d7761f955880d9cc581cac', 'user&wap@5e87a50981c962e7aab2bf1bff623e19', '7200', '1', '2018-09-04 10:39:30', '2018-09-04 10:39:30');

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
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_visit_logs`
-- -----------------------------
INSERT INTO `wancll_user_visit_logs` VALUES ('1', '1', '1', 'wap', '113.247.13.183', '2018-07-20 09:35:36', '1', '2018-07-20 09:35:36', '2018-07-20 09:35:36');
INSERT INTO `wancll_user_visit_logs` VALUES ('2', '2', '2', 'wap', '113.247.51.228', '2018-07-23 15:25:59', '1', '2018-07-23 15:25:59', '2018-07-23 15:25:59');
INSERT INTO `wancll_user_visit_logs` VALUES ('3', '3', '3', 'wap', '127.0.0.1', '2018-07-25 10:42:12', '1', '2018-07-25 10:42:12', '2018-07-25 10:42:12');
INSERT INTO `wancll_user_visit_logs` VALUES ('4', '2', '2', 'wap', '127.0.0.1', '2018-07-25 10:51:04', '1', '2018-07-25 10:51:04', '2018-07-25 10:51:04');
INSERT INTO `wancll_user_visit_logs` VALUES ('5', '2', '2', 'wechat', '175.8.205.90', '2018-07-27 19:34:26', '1', '2018-07-27 19:34:26', '2018-07-27 19:34:26');
INSERT INTO `wancll_user_visit_logs` VALUES ('6', '1', '1', 'wechat', '175.8.205.90', '2018-07-27 19:52:25', '1', '2018-07-27 19:52:25', '2018-07-27 19:52:25');
INSERT INTO `wancll_user_visit_logs` VALUES ('7', '2', '2', 'wap', '175.8.205.90', '2018-07-28 09:01:24', '1', '2018-07-28 09:01:24', '2018-07-28 09:01:24');
INSERT INTO `wancll_user_visit_logs` VALUES ('8', '3', '3', 'wap', '127.0.0.1', '2018-07-28 09:08:41', '1', '2018-07-28 09:08:41', '2018-07-28 09:08:41');
INSERT INTO `wancll_user_visit_logs` VALUES ('9', '4', '4', 'wap', '127.0.0.1', '2018-07-28 09:19:25', '1', '2018-07-28 09:19:25', '2018-07-28 09:19:25');
INSERT INTO `wancll_user_visit_logs` VALUES ('10', '5', '5', 'wechat', '175.8.205.90', '2018-07-28 10:50:06', '1', '2018-07-28 10:50:06', '2018-07-28 10:50:06');
INSERT INTO `wancll_user_visit_logs` VALUES ('11', '1', '1', 'wap', '175.8.205.90', '2018-07-28 11:47:03', '1', '2018-07-28 11:47:03', '2018-07-28 11:47:03');
INSERT INTO `wancll_user_visit_logs` VALUES ('12', '1', '1', 'wap', '175.8.205.90', '2018-07-28 11:47:53', '1', '2018-07-28 11:47:53', '2018-07-28 11:47:53');
INSERT INTO `wancll_user_visit_logs` VALUES ('13', '5', '5', 'wap', '175.8.205.90', '2018-07-28 14:22:06', '1', '2018-07-28 14:22:06', '2018-07-28 14:22:06');
INSERT INTO `wancll_user_visit_logs` VALUES ('14', '6', '6', 'wechat', '175.8.205.90', '2018-07-28 14:45:41', '1', '2018-07-28 14:45:41', '2018-07-28 14:45:41');
INSERT INTO `wancll_user_visit_logs` VALUES ('15', '7', '7', 'wap', '113.246.202.237', '2018-07-30 09:04:51', '1', '2018-07-30 09:04:51', '2018-07-30 09:04:51');
INSERT INTO `wancll_user_visit_logs` VALUES ('16', '7', '7', 'wap', '113.246.202.237', '2018-07-30 09:06:27', '1', '2018-07-30 09:06:27', '2018-07-30 09:06:27');
INSERT INTO `wancll_user_visit_logs` VALUES ('17', '3', '3', 'wap', '127.0.0.1', '2018-07-30 09:51:50', '1', '2018-07-30 09:51:50', '2018-07-30 09:51:50');
INSERT INTO `wancll_user_visit_logs` VALUES ('18', '7', '7', 'wechat', '113.246.202.237', '2018-07-30 11:04:26', '1', '2018-07-30 11:04:26', '2018-07-30 11:04:26');
INSERT INTO `wancll_user_visit_logs` VALUES ('19', '8', '8', 'wap', '113.246.202.237', '2018-07-30 11:37:02', '1', '2018-07-30 11:37:02', '2018-07-30 11:37:02');
INSERT INTO `wancll_user_visit_logs` VALUES ('20', '2', '2', 'wechat', '113.246.202.237', '2018-07-30 20:18:37', '1', '2018-07-30 20:18:37', '2018-07-30 20:18:37');
INSERT INTO `wancll_user_visit_logs` VALUES ('21', '5', '5', 'wechat', '175.8.206.136', '2018-07-31 09:54:34', '1', '2018-07-31 09:54:34', '2018-07-31 09:54:34');
INSERT INTO `wancll_user_visit_logs` VALUES ('22', '2', '2', 'wap', '175.8.206.136', '2018-07-31 14:03:52', '1', '2018-07-31 14:03:52', '2018-07-31 14:03:52');
INSERT INTO `wancll_user_visit_logs` VALUES ('23', '6', '6', 'wap', '175.8.206.136', '2018-07-31 14:08:01', '1', '2018-07-31 14:08:01', '2018-07-31 14:08:01');
INSERT INTO `wancll_user_visit_logs` VALUES ('24', '2', '2', 'wap', '175.8.206.136', '2018-07-31 14:11:39', '1', '2018-07-31 14:11:39', '2018-07-31 14:11:39');
INSERT INTO `wancll_user_visit_logs` VALUES ('25', '2', '2', 'wap', '127.0.0.1', '2018-07-31 22:43:07', '1', '2018-07-31 22:43:07', '2018-07-31 22:43:07');
INSERT INTO `wancll_user_visit_logs` VALUES ('26', '5', '5', 'wechat', '175.8.206.136', '2018-08-01 10:14:38', '1', '2018-08-01 10:14:38', '2018-08-01 10:14:38');
INSERT INTO `wancll_user_visit_logs` VALUES ('27', '2', '2', 'wap', '113.247.51.102', '2018-08-03 15:07:10', '1', '2018-08-03 15:07:10', '2018-08-03 15:07:10');
INSERT INTO `wancll_user_visit_logs` VALUES ('28', '9', '9', 'wap', '113.247.51.102', '2018-08-03 15:10:02', '1', '2018-08-03 15:10:02', '2018-08-03 15:10:02');
INSERT INTO `wancll_user_visit_logs` VALUES ('29', '10', '10', 'wap', '113.247.51.102', '2018-08-03 15:11:19', '1', '2018-08-03 15:11:19', '2018-08-03 15:11:19');
INSERT INTO `wancll_user_visit_logs` VALUES ('30', '3', '3', 'wap', '113.247.51.102', '2018-08-03 17:05:20', '1', '2018-08-03 17:05:20', '2018-08-03 17:05:20');
INSERT INTO `wancll_user_visit_logs` VALUES ('31', '5', '5', 'wechat', '113.247.51.102', '2018-08-04 09:47:09', '1', '2018-08-04 09:47:09', '2018-08-04 09:47:09');
INSERT INTO `wancll_user_visit_logs` VALUES ('32', '11', '11', 'wap', '112.64.119.2', '2018-08-04 17:16:06', '1', '2018-08-04 17:16:06', '2018-08-04 17:16:06');
INSERT INTO `wancll_user_visit_logs` VALUES ('33', '5', '5', 'wechat', '113.247.51.102', '2018-08-04 17:34:00', '1', '2018-08-04 17:34:00', '2018-08-04 17:34:00');
INSERT INTO `wancll_user_visit_logs` VALUES ('34', '2', '2', 'wap', '113.247.15.167', '2018-08-07 16:16:09', '1', '2018-08-07 16:16:09', '2018-08-07 16:16:09');
INSERT INTO `wancll_user_visit_logs` VALUES ('35', '2', '2', 'wap', '127.0.0.1', '2018-08-07 16:24:55', '1', '2018-08-07 16:24:55', '2018-08-07 16:24:55');
INSERT INTO `wancll_user_visit_logs` VALUES ('36', '1', '1', 'wap', '113.247.15.167', '2018-08-08 15:21:16', '1', '2018-08-08 15:21:16', '2018-08-08 15:21:16');
INSERT INTO `wancll_user_visit_logs` VALUES ('37', '2', '2', 'wap', '175.8.205.45', '2018-08-09 09:54:34', '1', '2018-08-09 09:54:34', '2018-08-09 09:54:34');
INSERT INTO `wancll_user_visit_logs` VALUES ('38', '1', '1', 'wap', '175.8.205.45', '2018-08-09 16:20:10', '1', '2018-08-09 16:20:10', '2018-08-09 16:20:10');
INSERT INTO `wancll_user_visit_logs` VALUES ('39', '7', '7', 'wechat', '106.19.18.151', '2018-08-10 09:12:53', '1', '2018-08-10 09:12:53', '2018-08-10 09:12:53');
INSERT INTO `wancll_user_visit_logs` VALUES ('40', '3', '3', 'wap', '113.246.200.194', '2018-08-11 11:53:42', '1', '2018-08-11 11:53:42', '2018-08-11 11:53:42');
INSERT INTO `wancll_user_visit_logs` VALUES ('41', '2', '2', 'wap', '113.247.50.218', '2018-08-14 14:33:17', '1', '2018-08-14 14:33:17', '2018-08-14 14:33:17');
INSERT INTO `wancll_user_visit_logs` VALUES ('42', '2', '2', 'wap', '113.246.201.25', '2018-08-16 15:47:28', '1', '2018-08-16 15:47:28', '2018-08-16 15:47:28');
INSERT INTO `wancll_user_visit_logs` VALUES ('43', '2', '2', 'wap', '113.246.201.25', '2018-08-16 15:47:47', '1', '2018-08-16 15:47:47', '2018-08-16 15:47:47');
INSERT INTO `wancll_user_visit_logs` VALUES ('44', '3', '3', 'wap', '175.8.207.120', '2018-08-21 11:23:16', '1', '2018-08-21 11:23:16', '2018-08-21 11:23:16');
INSERT INTO `wancll_user_visit_logs` VALUES ('45', '6', '6', 'wap', '113.247.12.217', '2018-08-23 09:14:37', '1', '2018-08-23 09:14:37', '2018-08-23 09:14:37');
INSERT INTO `wancll_user_visit_logs` VALUES ('46', '6', '6', 'pc', '113.247.12.217', '2018-08-23 10:15:38', '1', '2018-08-23 10:15:38', '2018-08-23 10:15:38');
INSERT INTO `wancll_user_visit_logs` VALUES ('47', '12', '12', 'wechat', '119.39.76.152', '2018-08-23 23:17:50', '1', '2018-08-23 23:17:50', '2018-08-23 23:17:50');
INSERT INTO `wancll_user_visit_logs` VALUES ('48', '12', '12', 'pc', '119.39.76.152', '2018-08-24 07:29:01', '1', '2018-08-24 07:29:01', '2018-08-24 07:29:01');
INSERT INTO `wancll_user_visit_logs` VALUES ('49', '6', '6', 'wap', '113.246.201.80', '2018-08-24 09:36:09', '1', '2018-08-24 09:36:09', '2018-08-24 09:36:09');
INSERT INTO `wancll_user_visit_logs` VALUES ('50', '12', '12', 'wechat', '113.246.201.80', '2018-08-24 09:41:11', '1', '2018-08-24 09:41:11', '2018-08-24 09:41:11');
INSERT INTO `wancll_user_visit_logs` VALUES ('51', '12', '12', 'pc', '113.246.201.80', '2018-08-24 11:18:30', '1', '2018-08-24 11:18:30', '2018-08-24 11:18:30');
INSERT INTO `wancll_user_visit_logs` VALUES ('52', '12', '12', 'pc', '113.246.201.80', '2018-08-24 12:40:35', '1', '2018-08-24 12:40:35', '2018-08-24 12:40:35');
INSERT INTO `wancll_user_visit_logs` VALUES ('53', '13', '13', 'wechat', '113.246.201.80', '2018-08-24 12:49:06', '1', '2018-08-24 12:49:06', '2018-08-24 12:49:06');
INSERT INTO `wancll_user_visit_logs` VALUES ('54', '12', '12', 'wechat', '113.246.201.80', '2018-08-24 13:33:51', '1', '2018-08-24 13:33:51', '2018-08-24 13:33:51');
INSERT INTO `wancll_user_visit_logs` VALUES ('55', '2', '2', 'wechat', '113.246.201.80', '2018-08-25 14:25:39', '1', '2018-08-25 14:25:39', '2018-08-25 14:25:39');
INSERT INTO `wancll_user_visit_logs` VALUES ('56', '2', '2', 'wap', '113.246.201.80', '2018-08-25 14:26:35', '1', '2018-08-25 14:26:35', '2018-08-25 14:26:35');
INSERT INTO `wancll_user_visit_logs` VALUES ('57', '2', '2', 'wechat', '223.104.21.42', '2018-08-25 14:37:35', '1', '2018-08-25 14:37:35', '2018-08-25 14:37:35');
INSERT INTO `wancll_user_visit_logs` VALUES ('58', '2', '2', 'wechat', '175.8.206.200', '2018-08-28 14:24:32', '1', '2018-08-28 14:24:32', '2018-08-28 14:24:32');
INSERT INTO `wancll_user_visit_logs` VALUES ('59', '1', '1', 'wap', '113.247.50.70', '2018-08-28 21:57:20', '1', '2018-08-28 21:57:20', '2018-08-28 21:57:20');
INSERT INTO `wancll_user_visit_logs` VALUES ('60', '12', '12', 'wap', '113.247.50.70', '2018-08-30 09:50:16', '1', '2018-08-30 09:50:16', '2018-08-30 09:50:16');
INSERT INTO `wancll_user_visit_logs` VALUES ('61', '12', '12', 'wap', '113.246.203.116', '2018-08-31 09:28:31', '1', '2018-08-31 09:28:31', '2018-08-31 09:28:31');
INSERT INTO `wancll_user_visit_logs` VALUES ('62', '2', '2', 'wechat', '113.246.203.116', '2018-08-31 10:28:16', '1', '2018-08-31 10:28:16', '2018-08-31 10:28:16');
INSERT INTO `wancll_user_visit_logs` VALUES ('63', '2', '2', 'wap', '113.246.203.116', '2018-08-31 10:30:34', '1', '2018-08-31 10:30:34', '2018-08-31 10:30:34');
INSERT INTO `wancll_user_visit_logs` VALUES ('64', '2', '2', 'wechat', '113.246.203.116', '2018-08-31 14:07:07', '1', '2018-08-31 14:07:07', '2018-08-31 14:07:07');
INSERT INTO `wancll_user_visit_logs` VALUES ('65', '14', '14', 'wap', '113.246.203.116', '2018-08-31 14:49:53', '1', '2018-08-31 14:49:53', '2018-08-31 14:49:53');
INSERT INTO `wancll_user_visit_logs` VALUES ('66', '14', '14', 'wap', '113.246.203.116', '2018-08-31 14:53:14', '1', '2018-08-31 14:53:14', '2018-08-31 14:53:14');
INSERT INTO `wancll_user_visit_logs` VALUES ('67', '15', '15', 'wap', '113.246.203.116', '2018-08-31 14:53:56', '1', '2018-08-31 14:53:56', '2018-08-31 14:53:56');
INSERT INTO `wancll_user_visit_logs` VALUES ('68', '14', '14', 'wap', '113.246.203.116', '2018-08-31 14:55:41', '1', '2018-08-31 14:55:41', '2018-08-31 14:55:41');
INSERT INTO `wancll_user_visit_logs` VALUES ('69', '14', '14', 'wap', '113.246.203.116', '2018-08-31 14:59:16', '1', '2018-08-31 14:59:16', '2018-08-31 14:59:16');
INSERT INTO `wancll_user_visit_logs` VALUES ('70', '14', '14', 'wap', '113.246.203.116', '2018-08-31 15:00:43', '1', '2018-08-31 15:00:43', '2018-08-31 15:00:43');
INSERT INTO `wancll_user_visit_logs` VALUES ('71', '14', '14', 'wap', '113.246.203.116', '2018-08-31 15:03:37', '1', '2018-08-31 15:03:37', '2018-08-31 15:03:37');
INSERT INTO `wancll_user_visit_logs` VALUES ('72', '14', '14', 'wap', '113.246.203.116', '2018-08-31 15:04:15', '1', '2018-08-31 15:04:15', '2018-08-31 15:04:15');
INSERT INTO `wancll_user_visit_logs` VALUES ('73', '16', '16', 'wechat', '113.246.203.116', '2018-08-31 15:11:47', '1', '2018-08-31 15:11:47', '2018-08-31 15:11:47');
INSERT INTO `wancll_user_visit_logs` VALUES ('74', '12', '12', 'wechat', '113.246.203.116', '2018-08-31 15:17:19', '1', '2018-08-31 15:17:19', '2018-08-31 15:17:19');
INSERT INTO `wancll_user_visit_logs` VALUES ('75', '2', '2', 'wap', '113.246.203.116', '2018-08-31 15:39:11', '1', '2018-08-31 15:39:11', '2018-08-31 15:39:11');
INSERT INTO `wancll_user_visit_logs` VALUES ('76', '2', '2', 'wechat', '113.246.203.116', '2018-08-31 16:04:41', '1', '2018-08-31 16:04:41', '2018-08-31 16:04:41');
INSERT INTO `wancll_user_visit_logs` VALUES ('77', '17', '17', 'wap', '113.246.203.116', '2018-08-31 16:41:58', '1', '2018-08-31 16:41:58', '2018-08-31 16:41:58');
INSERT INTO `wancll_user_visit_logs` VALUES ('78', '2', '2', 'wap', '113.246.203.116', '2018-08-31 16:50:21', '1', '2018-08-31 16:50:21', '2018-08-31 16:50:21');
INSERT INTO `wancll_user_visit_logs` VALUES ('79', '17', '17', 'wap', '113.246.203.116', '2018-08-31 16:58:44', '1', '2018-08-31 16:58:44', '2018-08-31 16:58:44');
INSERT INTO `wancll_user_visit_logs` VALUES ('80', '18', '18', 'wap', '113.246.203.116', '2018-08-31 17:01:44', '1', '2018-08-31 17:01:44', '2018-08-31 17:01:44');
INSERT INTO `wancll_user_visit_logs` VALUES ('81', '2', '2', 'wap', '113.246.203.116', '2018-08-31 17:06:51', '1', '2018-08-31 17:06:51', '2018-08-31 17:06:51');
INSERT INTO `wancll_user_visit_logs` VALUES ('82', '17', '17', 'wap', '113.246.203.116', '2018-09-01 10:43:15', '1', '2018-09-01 10:43:15', '2018-09-01 10:43:15');
INSERT INTO `wancll_user_visit_logs` VALUES ('83', '18', '18', 'wap', '113.246.203.116', '2018-09-01 11:35:44', '1', '2018-09-01 11:35:44', '2018-09-01 11:35:44');
INSERT INTO `wancll_user_visit_logs` VALUES ('84', '17', '17', 'wap', '113.246.203.116', '2018-09-01 12:01:40', '1', '2018-09-01 12:01:40', '2018-09-01 12:01:40');
INSERT INTO `wancll_user_visit_logs` VALUES ('85', '18', '18', 'wap', '113.246.201.121', '2018-09-01 13:48:56', '1', '2018-09-01 13:48:56', '2018-09-01 13:48:56');
INSERT INTO `wancll_user_visit_logs` VALUES ('86', '18', '18', 'wechat', '113.246.201.121', '2018-09-01 14:37:31', '1', '2018-09-01 14:37:31', '2018-09-01 14:37:31');
INSERT INTO `wancll_user_visit_logs` VALUES ('87', '2', '2', 'wap', '113.246.201.121', '2018-09-01 15:18:55', '1', '2018-09-01 15:18:55', '2018-09-01 15:18:55');
INSERT INTO `wancll_user_visit_logs` VALUES ('88', '17', '17', 'wap', '113.246.201.121', '2018-09-01 16:13:06', '1', '2018-09-01 16:13:07', '2018-09-01 16:13:07');
INSERT INTO `wancll_user_visit_logs` VALUES ('89', '2', '2', 'wap', '113.246.201.121', '2018-09-01 16:14:20', '1', '2018-09-01 16:14:20', '2018-09-01 16:14:20');
INSERT INTO `wancll_user_visit_logs` VALUES ('90', '17', '17', 'wap', '113.246.201.121', '2018-09-01 16:16:00', '1', '2018-09-01 16:16:00', '2018-09-01 16:16:00');
INSERT INTO `wancll_user_visit_logs` VALUES ('91', '18', '18', 'wap', '113.246.201.121', '2018-09-01 16:43:14', '1', '2018-09-01 16:43:14', '2018-09-01 16:43:14');
INSERT INTO `wancll_user_visit_logs` VALUES ('92', '17', '17', 'wap', '113.246.201.121', '2018-09-01 16:52:34', '1', '2018-09-01 16:52:34', '2018-09-01 16:52:34');
INSERT INTO `wancll_user_visit_logs` VALUES ('93', '18', '18', 'wap', '113.246.201.121', '2018-09-01 16:56:08', '1', '2018-09-01 16:56:08', '2018-09-01 16:56:08');
INSERT INTO `wancll_user_visit_logs` VALUES ('94', '17', '17', 'wap', '113.246.202.236', '2018-09-03 09:20:43', '1', '2018-09-03 09:20:43', '2018-09-03 09:20:43');
INSERT INTO `wancll_user_visit_logs` VALUES ('95', '18', '18', 'wap', '113.246.202.236', '2018-09-03 09:24:56', '1', '2018-09-03 09:24:56', '2018-09-03 09:24:56');
INSERT INTO `wancll_user_visit_logs` VALUES ('96', '17', '17', 'wap', '113.246.202.236', '2018-09-03 09:25:37', '1', '2018-09-03 09:25:37', '2018-09-03 09:25:37');
INSERT INTO `wancll_user_visit_logs` VALUES ('97', '2', '2', 'wap', '113.246.202.236', '2018-09-03 09:29:21', '1', '2018-09-03 09:29:21', '2018-09-03 09:29:21');
INSERT INTO `wancll_user_visit_logs` VALUES ('98', '18', '18', 'wap', '113.246.202.236', '2018-09-03 09:31:56', '1', '2018-09-03 09:31:56', '2018-09-03 09:31:56');
INSERT INTO `wancll_user_visit_logs` VALUES ('99', '17', '17', 'wap', '113.246.202.236', '2018-09-03 10:08:26', '1', '2018-09-03 10:08:26', '2018-09-03 10:08:26');
INSERT INTO `wancll_user_visit_logs` VALUES ('100', '18', '18', 'wap', '113.246.202.236', '2018-09-03 10:08:51', '1', '2018-09-03 10:08:51', '2018-09-03 10:08:51');
INSERT INTO `wancll_user_visit_logs` VALUES ('101', '17', '17', 'wap', '113.246.202.236', '2018-09-03 10:30:06', '1', '2018-09-03 10:30:06', '2018-09-03 10:30:06');
INSERT INTO `wancll_user_visit_logs` VALUES ('102', '2', '2', 'wap', '113.246.202.236', '2018-09-03 11:31:30', '1', '2018-09-03 11:31:30', '2018-09-03 11:31:30');
INSERT INTO `wancll_user_visit_logs` VALUES ('103', '1', '1', 'applet', '113.246.202.236', '2018-09-03 11:45:05', '1', '2018-09-03 11:45:05', '2018-09-03 11:45:05');
INSERT INTO `wancll_user_visit_logs` VALUES ('104', '2', '2', 'wap', '113.246.202.236', '2018-09-03 15:39:11', '1', '2018-09-03 15:39:11', '2018-09-03 15:39:11');
INSERT INTO `wancll_user_visit_logs` VALUES ('105', '17', '17', 'wap', '113.246.200.142', '2018-09-03 17:43:53', '1', '2018-09-03 17:43:53', '2018-09-03 17:43:53');
INSERT INTO `wancll_user_visit_logs` VALUES ('106', '2', '2', 'wechat', '113.247.14.208', '2018-09-04 09:45:08', '1', '2018-09-04 09:45:08', '2018-09-04 09:45:08');
INSERT INTO `wancll_user_visit_logs` VALUES ('107', '2', '2', 'wap', '113.246.200.142', '2018-09-04 10:28:30', '1', '2018-09-04 10:28:30', '2018-09-04 10:28:30');
INSERT INTO `wancll_user_visit_logs` VALUES ('108', '15', '15', 'wap', '113.246.200.142', '2018-09-04 10:38:38', '1', '2018-09-04 10:38:38', '2018-09-04 10:38:38');
INSERT INTO `wancll_user_visit_logs` VALUES ('109', '14', '14', 'wap', '113.246.200.142', '2018-09-04 10:39:30', '1', '2018-09-04 10:39:30', '2018-09-04 10:39:30');

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
  `keep_sign_in_num` int(11) DEFAULT '0' COMMENT '连续签到次数',
  `total_sign_in_num` int(11) DEFAULT '0' COMMENT '总签到次数',
  `last_sign_in_time` datetime DEFAULT NULL COMMENT '上次签到时间',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0假删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_users`
-- -----------------------------
INSERT INTO `wancll_users` VALUES ('1', '18888888888', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '2018-07-20 09:35:36', '1', '1', '1', '0', '0', '', '1', '2018-07-20 09:35:36', '2018-07-20 09:35:36');
INSERT INTO `wancll_users` VALUES ('2', '15580841403', '', '1', '/public/upload/goods_images/1535696012957.jpg', '0', '', '23886DHAHDAdjadja断绝的', '1387493大坏蛋djajDJAO', '2388688772@qq.co', '北京市', '110000', '市辖区', '110100', '西城区', '110102', '', '[1]', '2018-08-31 16:33:22', '1', '4', '', '', '2018-07-23 15:25:59', '1', '4', '1', '0', '4', '2018-08-31 15:43:51', '1', '2018-07-23 15:25:59', '2018-09-04 10:30:57');
INSERT INTO `wancll_users` VALUES ('3', '15581646116', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '2018-07-25 10:42:12', '1', '1', '1', '0', '1', '2018-07-30 12:00:00', '1', '2018-07-25 10:42:12', '2018-07-30 12:00:00');
INSERT INTO `wancll_users` VALUES ('4', '15581646117', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '2018-07-28 09:19:25', '1', '1', '1', '0', '0', '', '1', '2018-07-28 09:19:25', '2018-07-28 09:19:25');
INSERT INTO `wancll_users` VALUES ('5', '18390916324', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '2018-07-28 10:50:06', '1', '4', '1', '0', '2', '2018-08-01 10:14:45', '1', '2018-07-28 10:50:06', '2018-08-04 17:40:29');
INSERT INTO `wancll_users` VALUES ('6', '18111111111', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '2018-07-28 14:45:41', '1', '1', '1', '0', '1', '2018-08-23 09:14:47', '1', '2018-07-28 14:45:41', '2018-08-23 09:14:47');
INSERT INTO `wancll_users` VALUES ('7', '18175974828', '', '123', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '2018-07-30 09:04:51', '1', '1', '1', '0', '1', '2018-07-30 09:34:41', '1', '2018-07-30 09:04:51', '2018-07-30 11:59:19');
INSERT INTO `wancll_users` VALUES ('8', '18133333333', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '2018-07-30 11:37:02', '1', '1', '1', '0', '0', '', '1', '2018-07-30 11:37:02', '2018-07-30 11:37:02');
INSERT INTO `wancll_users` VALUES ('9', '13300000001', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '2018-08-03 15:10:02', '1', '1', '1', '0', '0', '', '1', '2018-08-03 15:10:02', '2018-08-03 15:10:02');
INSERT INTO `wancll_users` VALUES ('10', '13300000002', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '2', '#2#', '', '0', '0', '1', '0', '0', '', '1', '2018-08-03 15:11:19', '2018-09-01 11:29:11');
INSERT INTO `wancll_users` VALUES ('11', '17621502221', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '', '0', '0', '1', '0', '0', '', '1', '2018-08-04 17:16:04', '2018-08-04 17:16:04');
INSERT INTO `wancll_users` VALUES ('12', '15071357527', '', '郭大大', '/public/upload/goods_images/1535079192985.jpg', '0', '', '1010998729', '1010998729', '1010998729@qq.com', '天津市', '120000', '市辖区', '120100', '南开区', '120104', '', '[1]', '2018-08-24 14:17:05', '1', '3', '', '', '', '0', '0', '1', '0', '2', '2018-08-24 14:01:24', '1', '2018-08-23 23:17:50', '2018-08-31 15:19:17');
INSERT INTO `wancll_users` VALUES ('13', '15071357528', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '9', '#9#', '', '0', '0', '1', '0', '0', '', '1', '2018-08-24 12:49:06', '2018-08-27 21:36:05');
INSERT INTO `wancll_users` VALUES ('14', '13874930708', '', '龙', '/public/upload/goods_images/1535698580387.jpg', '1', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '12', '#12#', '', '0', '0', '1', '0', '1', '2018-08-31 15:26:44', '1', '2018-08-31 14:49:53', '2018-08-31 15:26:44');
INSERT INTO `wancll_users` VALUES ('15', '13874930709', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '17', '#2#17#', '', '0', '0', '1', '0', '0', '', '1', '2018-08-31 14:53:56', '2018-09-04 10:39:01');
INSERT INTO `wancll_users` VALUES ('16', '13787294506', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '17', '#2#17#', '', '0', '0', '1', '0', '0', '', '1', '2018-08-31 15:11:47', '2018-09-01 11:28:52');
INSERT INTO `wancll_users` VALUES ('17', '13800000001', '', '2', '', '0', '', '2388688772', '13874930708', '2388688772@qq.com', '湖南省', '430000', '长沙市', '430100', '长沙县', '430121', '', '[1]', '2018-08-31 17:01:37', '1', '4', '2', '#2#', '2018-08-31 17:01:30', '1', '4', '1', '1', '1', '2018-09-03 11:30:10', '1', '2018-08-31 16:41:58', '2018-09-04 10:32:05');
INSERT INTO `wancll_users` VALUES ('18', '13800000002', '', '3', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '17', '#2#17#', '', '0', '0', '1', '0', '1', '2018-09-01 13:51:16', '1', '2018-08-31 17:01:44', '2018-09-01 13:51:16');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

