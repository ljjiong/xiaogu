
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_activity_coupons`
-- -----------------------------
INSERT INTO `wancll_activity_coupons` VALUES ('1', 'C2018090310383967268', '7', 'full', '2018-09-30 00:00:00', '1000.00', '100.00', '100', '2', '2', '1', '2018-09-03 10:38:39', '2018-09-03 10:38:39');
INSERT INTO `wancll_activity_coupons` VALUES ('2', 'C2018090310385679967', '8', 'full', '2018-09-30 00:00:00', '10000.00', '1000.00', '100', '2', '2', '1', '2018-09-03 10:38:56', '2018-09-03 10:38:56');
INSERT INTO `wancll_activity_coupons` VALUES ('3', 'C2018090310393506234', '5', 'discount', '2018-09-30 00:00:00', '1000.00', '5.00', '100', '2', '2', '1', '2018-09-03 10:39:35', '2018-09-03 10:39:35');
INSERT INTO `wancll_activity_coupons` VALUES ('4', 'C2018090310395027402', '2', 'discount', '2018-09-30 00:00:00', '10000.00', '7.00', '100', '2', '2', '1', '2018-09-03 10:39:50', '2018-09-03 10:39:50');
INSERT INTO `wancll_activity_coupons` VALUES ('5', 'C2018090409553440611', '8', 'discount', '2018-09-30 00:00:00', '100000.00', '1.00', '1000', '1', '2', '1', '2018-09-04 09:55:34', '2018-09-04 09:55:34');
INSERT INTO `wancll_activity_coupons` VALUES ('6', 'C2018100714342510604', '14', 'full', '2018-10-11 00:00:00', '50.00', '5.00', '10', '0', '2', '1', '2018-10-07 14:34:25', '2018-10-07 14:34:25');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_activity_discount_rules`
-- -----------------------------
INSERT INTO `wancll_activity_discount_rules` VALUES ('1', '1', '6', '1.00', '[3]', '2', '10', '0', '1', '1', '2018-08-24 13:58:14', '2018-08-24 13:58:14');
INSERT INTO `wancll_activity_discount_rules` VALUES ('2', '6', '5', '3.00', '[2]', '3', '2', '0', '1', '1', '2018-08-27 18:12:24', '2018-08-27 18:12:24');
INSERT INTO `wancll_activity_discount_rules` VALUES ('3', '13', '26', '0.80', '[6]', '3', '8', '1', '1', '1', '2018-10-07 14:29:28', '2018-10-07 14:38:03');
INSERT INTO `wancll_activity_discount_rules` VALUES ('4', '10', '18', '20.00', '[1]', '2', '5', '2', '1', '1', '2018-11-10 14:42:38', '2018-11-10 14:43:25');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_activity_full_rules`
-- -----------------------------
INSERT INTO `wancll_activity_full_rules` VALUES ('1', '3', '[1]', '4.00', '4.00', '1', '1', '2018-08-27 18:10:26', '2018-08-27 18:10:26');
INSERT INTO `wancll_activity_full_rules` VALUES ('2', '4', '[2,3,4,5,6]', '100.00', '10.00', '1', '1', '2018-08-27 18:12:40', '2018-08-27 18:12:40');
INSERT INTO `wancll_activity_full_rules` VALUES ('3', '15', '[6,5,1,2,4,3]', '100.00', '20.00', '1', '1', '2018-10-07 14:33:04', '2018-10-07 14:33:04');

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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_addresses`
-- -----------------------------
INSERT INTO `wancll_addresses` VALUES ('1', '2', 'hgvb', '12345688905', '天津市', '120000', '市辖区', '120100', '河西区', '120103', 'ccb', '', '', '0', '0', '0', '2018-11-10 14:43:22', '2018-11-10 15:11:59');
INSERT INTO `wancll_addresses` VALUES ('2', '2', 'hgvb', '12345688905', '天津市', '120000', '市辖区', '120100', '河西区', '120103', 'ccb', '', '', '0', '0', '0', '2018-11-10 14:43:22', '2018-11-10 15:15:35');
INSERT INTO `wancll_addresses` VALUES ('3', '3', '看看', '12345678905', '山西省', '140000', '朔州市', '140600', '山阴县', '140621', '鸡腿', '', '', '0', '0', '1', '2018-11-10 15:05:45', '2018-11-10 15:05:46');
INSERT INTO `wancll_addresses` VALUES ('4', '3', '看看', '12345678905', '山西省', '140000', '朔州市', '140600', '山阴县', '140621', '鸡腿', '', '', '1', '0', '1', '2018-11-10 15:05:46', '2018-11-10 15:05:46');
INSERT INTO `wancll_addresses` VALUES ('5', '2', '就', '12345678905', '黑龙江省', '230000', '鸡西市', '230300', '市辖区', '230301', '酒', '', '', '1', '0', '0', '2018-11-10 15:12:53', '2018-11-10 15:15:37');
INSERT INTO `wancll_addresses` VALUES ('6', '2', '路途', '12345688904', '河北省', '130000', '邯郸市', '130400', '邯郸县', '130421', '就', '', '', '1', '0', '0', '2018-11-10 15:17:00', '2018-11-10 15:18:56');
INSERT INTO `wancll_addresses` VALUES ('7', '2', '牛', '12345678905', '江苏省', '320000', '常州市', '320400', '市辖区', '320401', '12346679905', '', '', '1', '0', '0', '2018-11-10 15:25:20', '2018-11-10 15:28:17');
INSERT INTO `wancll_addresses` VALUES ('8', '2', '九江', '12345678905', '北京市', '110000', '市辖区', '110100', '东城区', '110101', 'vvv', '', '', '1', '0', '0', '2018-11-10 15:34:37', '2018-11-10 16:44:24');
INSERT INTO `wancll_addresses` VALUES ('9', '1', '999', '18390606242', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '0', '1', '2018-11-10 15:46:47', '2018-11-10 15:46:47');
INSERT INTO `wancll_addresses` VALUES ('10', '7', '123456', '12345678912', '北京市', '110000', '市辖区', '110100', '朝阳区', '110105', '长沙', '', '', '1', '0', '1', '2018-11-10 17:39:22', '2018-11-10 17:39:22');
INSERT INTO `wancll_addresses` VALUES ('11', '2', '继续', '12345678905', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '泪如雨下', '', '', '1', '0', '1', '2018-11-12 09:24:01', '2018-11-12 09:24:01');
INSERT INTO `wancll_addresses` VALUES ('12', '8', '啊啊啊', '18175974828', '北京市', '110000', '市辖区', '110100', '石景山区', '110107', '啊啊啊啊啊啊啊啊', '', '', '1', '0', '1', '2018-11-12 11:20:18', '2018-11-12 11:20:18');
INSERT INTO `wancll_addresses` VALUES ('13', '9', '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '', '', '1', '0', '1', '2018-11-12 12:46:51', '2018-11-12 12:46:51');

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
INSERT INTO `wancll_admin_accounts` VALUES ('8', 'yiyun', 'dd9a9818083a8d2bb3810887ecc40dc4', '8', '1', '2018-11-10 10:05:47', '2018-11-10 10:06:29');
INSERT INTO `wancll_admin_accounts` VALUES ('9', '123123', 'e6297b585db794e177808f8953b46669', '9', '1', '2018-11-12 11:36:45', '2018-11-12 11:36:45');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_assets`
-- -----------------------------
INSERT INTO `wancll_admin_assets` VALUES ('1', '5', '0.00', '0.00', '1', '2018-06-29 11:59:02', '2018-06-29 11:59:02');
INSERT INTO `wancll_admin_assets` VALUES ('2', '6', '0.00', '0.00', '1', '2018-08-24 09:52:10', '2018-08-24 09:52:10');
INSERT INTO `wancll_admin_assets` VALUES ('3', '7', '0.00', '0.00', '1', '2018-09-04 09:48:51', '2018-09-04 09:48:51');
INSERT INTO `wancll_admin_assets` VALUES ('4', '8', '0.00', '0.00', '1', '2018-11-10 10:05:47', '2018-11-10 10:05:47');
INSERT INTO `wancll_admin_assets` VALUES ('5', '9', '0.00', '0.00', '1', '2018-11-12 11:36:45', '2018-11-12 11:36:45');

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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_tokens`
-- -----------------------------
INSERT INTO `wancll_admin_tokens` VALUES ('1', '2', '2', 'pc', 'admin&pc@60d11ba7df136201db1d4d2170c21863', 'admin&pc@26e5a2522615ed092eaf5d653fb2152f', '7200', '1', '2018-10-29 12:00:17', '2018-10-29 12:00:17');
INSERT INTO `wancll_admin_tokens` VALUES ('2', '1', '1', 'pc', 'admin&pc@aab313b9a56cf9bca5dd368633ddf44d', 'admin&pc@17936dad01a1b967f683fcdc2e883973', '7200', '1', '2018-10-29 13:35:21', '2018-10-29 13:35:21');
INSERT INTO `wancll_admin_tokens` VALUES ('3', '1', '1', 'pc', 'admin&pc@1d96f40dea99afa4fd0d21dfd6f7d1d6', 'admin&pc@392adb8ec20199256967fd581960e7fb', '7200', '1', '2018-10-29 13:37:46', '2018-10-29 13:37:46');
INSERT INTO `wancll_admin_tokens` VALUES ('4', '1', '1', 'pc', 'admin&pc@31c017c9bc6c77a43413731df094da06', 'admin&pc@94718ef71efec3bff750825099eb9d4d', '7200', '1', '2018-11-10 09:26:33', '2018-11-10 15:39:48');
INSERT INTO `wancll_admin_tokens` VALUES ('5', '2', '2', 'pc', 'admin&pc@3cda3afbdc72a7d9f7fc4370bec20da7', 'admin&pc@4ebed71e25ca3cc96bd875a392104bd6', '7200', '1', '2018-11-10 09:27:04', '2018-11-10 09:27:04');
INSERT INTO `wancll_admin_tokens` VALUES ('6', '1', '1', 'pc', 'admin&pc@3abe08c7c13c20b0c57f7edbdaedcfe5', 'admin&pc@73a5e4595917d2ef252fa0da7dca3e55', '7200', '1', '2018-11-10 09:28:09', '2018-11-10 09:28:09');
INSERT INTO `wancll_admin_tokens` VALUES ('7', '1', '1', 'pc', 'admin&pc@f103b9fa9d81b776db8bdf2ecf23bce7', 'admin&pc@37418435e5387d06f1a58b88fed4bb53', '7200', '1', '2018-11-10 10:05:05', '2018-11-10 10:05:05');
INSERT INTO `wancll_admin_tokens` VALUES ('8', '8', '8', 'pc', 'admin&pc@102f3610b44ee684a6850c02c26cd306', 'admin&pc@6fdff9047265650e4dc87f7a82242b51', '7200', '1', '2018-11-10 10:09:38', '2018-11-10 10:09:38');
INSERT INTO `wancll_admin_tokens` VALUES ('9', '1', '1', 'pc', 'admin&pc@4cda7dc12e56d60747f1b0f135945239', 'admin&pc@de9ccfcb49335686c57f5436489fb7b7', '7200', '1', '2018-11-10 10:09:58', '2018-11-10 10:09:58');
INSERT INTO `wancll_admin_tokens` VALUES ('10', '1', '1', 'pc', 'admin&pc@c279dd76e2f942f63392f572edd381df', 'admin&pc@146914058830cd847d2deee615fb3505', '7200', '1', '2018-11-10 10:32:46', '2018-11-10 10:32:46');
INSERT INTO `wancll_admin_tokens` VALUES ('11', '2', '2', 'pc', 'admin&pc@a135299dfd26a546ae37436f30b25380', 'admin&pc@35182dedc5f5767daefaf36f3ee8356b', '7200', '1', '2018-11-10 10:42:40', '2018-11-10 17:58:04');
INSERT INTO `wancll_admin_tokens` VALUES ('12', '2', '2', 'pc', 'admin&pc@76a261b5fc7234aa368c32eb6fce8388', 'admin&pc@a3c2d610acfe69c4e5d47b8f644af941', '7200', '1', '2018-11-10 10:46:42', '2018-11-10 10:46:42');
INSERT INTO `wancll_admin_tokens` VALUES ('13', '1', '1', 'pc', 'admin&pc@d2e424ee6df49e88159b655d5d08b0f4', 'admin&pc@986cec935c02b453b7ccc577cce488cb', '7200', '1', '2018-11-10 11:10:02', '2018-11-10 11:10:02');
INSERT INTO `wancll_admin_tokens` VALUES ('14', '2', '2', 'pc', 'admin&pc@ea2d5d84cb849220b862c5a885a7457a', 'admin&pc@19eca57ee5d20fcefba1562dd36e4118', '7200', '1', '2018-11-10 13:40:38', '2018-11-10 13:40:38');
INSERT INTO `wancll_admin_tokens` VALUES ('15', '2', '2', 'pc', 'admin&pc@c4ff7b5847e983ddff294a6b860f113f', 'admin&pc@2716135ebada02306c9f52f7ad6907b3', '7200', '1', '2018-11-10 14:41:44', '2018-11-10 14:41:44');
INSERT INTO `wancll_admin_tokens` VALUES ('16', '2', '2', 'pc', 'admin&pc@695085dbe2adf93e4d6679bd3d913223', 'admin&pc@7d17d51d576e907a822af0aebd2eaadb', '7200', '1', '2018-11-10 14:52:02', '2018-11-10 14:52:02');
INSERT INTO `wancll_admin_tokens` VALUES ('26', '2', '2', 'pc', 'admin&pc@99400b0edf533610eedb8d74b127d6f7', 'admin&pc@9d181528fb652a358f1bd31556a72edb', '7200', '1', '2018-11-12 10:24:21', '2018-11-12 13:53:50');
INSERT INTO `wancll_admin_tokens` VALUES ('18', '1', '1', 'pc', 'admin&pc@a35d3fa2b94f19b760613f974e67094e', 'admin&pc@bcae2665336e6b8106bb685240f22e21', '7200', '1', '2018-11-10 15:45:45', '2018-11-10 15:45:45');
INSERT INTO `wancll_admin_tokens` VALUES ('19', '1', '1', 'pc', 'admin&pc@9b2057c7d72d20d3bd712004942f68ef', 'admin&pc@60a3cc5ba0da8f1d65edf1831631529a', '7200', '1', '2018-11-10 16:10:52', '2018-11-10 16:10:52');
INSERT INTO `wancll_admin_tokens` VALUES ('20', '1', '1', 'pc', 'admin&pc@d97f7a1e2f12a444a099c63a4791ec3a', 'admin&pc@00067832e6050230334e22915abb7fdb', '7200', '1', '2018-11-10 16:24:21', '2018-11-10 16:24:21');
INSERT INTO `wancll_admin_tokens` VALUES ('21', '1', '1', 'pc', 'admin&pc@394e47788d2b1e2bd0b4fbdb16e86751', 'admin&pc@086fa6137a10765cf34331375fbd0665', '7200', '1', '2018-11-10 17:10:13', '2018-11-10 17:10:13');
INSERT INTO `wancll_admin_tokens` VALUES ('22', '1', '1', 'pc', 'admin&pc@3453a303ff1881c91d14e16c248597ce', 'admin&pc@2943b81d18b62b219af93494a341de27', '7200', '1', '2018-11-10 17:13:52', '2018-11-10 17:13:52');
INSERT INTO `wancll_admin_tokens` VALUES ('23', '1', '1', 'pc', 'admin&pc@b8324fd68d4428021f2a1339e297cdd0', 'admin&pc@96a055b865b766e43ff5bd67887c039d', '7200', '1', '2018-11-10 17:14:17', '2018-11-10 17:14:17');
INSERT INTO `wancll_admin_tokens` VALUES ('24', '2', '2', 'pc', 'admin&pc@670f50d27f5c142ffa7d918da267e194', 'admin&pc@33f763c970b497885418f20bdbfe0778', '7200', '1', '2018-11-10 17:38:40', '2018-11-10 17:38:40');
INSERT INTO `wancll_admin_tokens` VALUES ('25', '2', '2', 'pc', 'admin&pc@051e64e198f2bf5feb7fc34dbb43d8e7', 'admin&pc@931f1db1fbbb4a7fe8301c2e9ccae8c3', '7200', '1', '2018-11-11 21:16:02', '2018-11-11 21:16:02');
INSERT INTO `wancll_admin_tokens` VALUES ('27', '2', '2', 'pc', 'admin&pc@c240fe992aa1b078cff1824cf84d0787', 'admin&pc@57fe20ce4aaa60e9e30b872ca13e09a6', '7200', '1', '2018-11-12 10:28:32', '2018-11-12 10:28:32');
INSERT INTO `wancll_admin_tokens` VALUES ('28', '2', '2', 'pc', 'admin&pc@c570379b443da0a0c8101f172d11041d', 'admin&pc@a6aec55bb028a0b623ecb6bdedae2d6e', '7200', '1', '2018-11-12 11:06:00', '2018-11-12 14:35:49');
INSERT INTO `wancll_admin_tokens` VALUES ('29', '2', '2', 'pc', 'admin&pc@b8f080aab110452333ede58a0d81b698', 'admin&pc@9d690ad6d6a2bdb757d529fef1429f30', '7200', '1', '2018-11-12 11:09:16', '2018-11-12 11:09:16');
INSERT INTO `wancll_admin_tokens` VALUES ('30', '9', '9', 'pc', 'admin&pc@ea1e207ef0f79c7ae1d81b5b7c2f0005', 'admin&pc@690c0e64b9540123718ecbbf985c0c31', '7200', '1', '2018-11-12 11:37:00', '2018-11-12 16:03:52');
INSERT INTO `wancll_admin_tokens` VALUES ('31', '2', '2', 'pc', 'admin&pc@0282eedea3142873dde6215dbd202cd6', 'admin&pc@31db1fb65287c65fd5f808f53a614f69', '7200', '1', '2018-11-12 13:36:57', '2018-11-12 13:36:57');
INSERT INTO `wancll_admin_tokens` VALUES ('32', '2', '2', 'pc', 'admin&pc@eed0034a2bedef69eba9721bc09d56e0', 'admin&pc@8884ff833ce9ca782cfbae0dfa719583', '7200', '1', '2018-11-12 13:42:06', '2018-11-12 13:42:06');
INSERT INTO `wancll_admin_tokens` VALUES ('33', '2', '2', 'pc', 'admin&pc@6f5acea2585538239b78c0ff0f16ed2f', 'admin&pc@08c0dfcd6c4e35715a325ab5726559b7', '7200', '1', '2018-11-12 13:50:10', '2018-11-12 15:50:23');
INSERT INTO `wancll_admin_tokens` VALUES ('34', '2', '2', 'pc', 'admin&pc@e44c69b994729e5863738379ee9c91e0', 'admin&pc@47ae31e70f900a89e8209072107fc031', '7200', '1', '2018-11-12 14:31:23', '2018-11-12 14:31:23');
INSERT INTO `wancll_admin_tokens` VALUES ('35', '2', '2', 'pc', 'admin&pc@cbb972d53dfedbcba0608aa2e8f05d50', 'admin&pc@04f164d1dae57ba1054dd7b2cff6c872', '7200', '1', '2018-11-12 15:57:27', '2018-11-12 15:57:27');
INSERT INTO `wancll_admin_tokens` VALUES ('36', '1', '1', 'pc', 'admin&pc@f8407b5edb40b31e703d925b43fb1435', 'admin&pc@c5e4f6183f0c833a32bc3420338e58a0', '7200', '1', '2018-11-12 15:58:35', '2018-11-12 15:58:35');

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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_visit_logs`
-- -----------------------------
INSERT INTO `wancll_admin_visit_logs` VALUES ('1', '2', '2', '175.8.204.64', '2018-10-29 12:00:17', 'pc', '1', '2018-10-29 12:00:17', '2018-10-29 12:00:17');
INSERT INTO `wancll_admin_visit_logs` VALUES ('2', '1', '1', '175.8.204.64', '2018-10-29 13:35:21', 'pc', '1', '2018-10-29 13:35:21', '2018-10-29 13:35:21');
INSERT INTO `wancll_admin_visit_logs` VALUES ('3', '1', '1', '175.8.204.64', '2018-10-29 13:37:46', 'pc', '1', '2018-10-29 13:37:46', '2018-10-29 13:37:46');
INSERT INTO `wancll_admin_visit_logs` VALUES ('4', '1', '1', '113.246.203.142', '2018-11-10 09:26:33', 'pc', '1', '2018-11-10 09:26:33', '2018-11-10 09:26:33');
INSERT INTO `wancll_admin_visit_logs` VALUES ('5', '2', '2', '113.246.203.142', '2018-11-10 09:27:04', 'pc', '1', '2018-11-10 09:27:04', '2018-11-10 09:27:04');
INSERT INTO `wancll_admin_visit_logs` VALUES ('6', '1', '1', '113.246.203.142', '2018-11-10 09:28:09', 'pc', '1', '2018-11-10 09:28:09', '2018-11-10 09:28:09');
INSERT INTO `wancll_admin_visit_logs` VALUES ('7', '1', '1', '113.246.203.142', '2018-11-10 10:05:05', 'pc', '1', '2018-11-10 10:05:05', '2018-11-10 10:05:05');
INSERT INTO `wancll_admin_visit_logs` VALUES ('8', '8', '8', '113.246.203.142', '2018-11-10 10:09:38', 'pc', '1', '2018-11-10 10:09:38', '2018-11-10 10:09:38');
INSERT INTO `wancll_admin_visit_logs` VALUES ('9', '1', '1', '113.246.203.142', '2018-11-10 10:09:58', 'pc', '1', '2018-11-10 10:09:58', '2018-11-10 10:09:58');
INSERT INTO `wancll_admin_visit_logs` VALUES ('10', '1', '1', '113.246.203.142', '2018-11-10 10:32:46', 'pc', '1', '2018-11-10 10:32:46', '2018-11-10 10:32:46');
INSERT INTO `wancll_admin_visit_logs` VALUES ('11', '2', '2', '113.247.14.225', '2018-11-10 10:42:40', 'pc', '1', '2018-11-10 10:42:40', '2018-11-10 10:42:40');
INSERT INTO `wancll_admin_visit_logs` VALUES ('12', '2', '2', '113.247.14.225', '2018-11-10 10:46:42', 'pc', '1', '2018-11-10 10:46:42', '2018-11-10 10:46:42');
INSERT INTO `wancll_admin_visit_logs` VALUES ('13', '1', '1', '113.246.203.142', '2018-11-10 11:10:02', 'pc', '1', '2018-11-10 11:10:02', '2018-11-10 11:10:02');
INSERT INTO `wancll_admin_visit_logs` VALUES ('14', '2', '2', '113.246.203.142', '2018-11-10 13:40:38', 'pc', '1', '2018-11-10 13:40:38', '2018-11-10 13:40:38');
INSERT INTO `wancll_admin_visit_logs` VALUES ('15', '2', '2', '113.246.203.142', '2018-11-10 14:41:44', 'pc', '1', '2018-11-10 14:41:44', '2018-11-10 14:41:44');
INSERT INTO `wancll_admin_visit_logs` VALUES ('16', '2', '2', '113.246.203.142', '2018-11-10 14:52:02', 'pc', '1', '2018-11-10 14:52:02', '2018-11-10 14:52:02');
INSERT INTO `wancll_admin_visit_logs` VALUES ('17', '2', '2', '113.246.203.142', '2018-11-10 14:56:50', 'pc', '1', '2018-11-10 14:56:50', '2018-11-10 14:56:50');
INSERT INTO `wancll_admin_visit_logs` VALUES ('18', '1', '1', '113.246.203.142', '2018-11-10 15:45:45', 'pc', '1', '2018-11-10 15:45:45', '2018-11-10 15:45:45');
INSERT INTO `wancll_admin_visit_logs` VALUES ('19', '1', '1', '113.246.203.142', '2018-11-10 16:10:52', 'pc', '1', '2018-11-10 16:10:52', '2018-11-10 16:10:52');
INSERT INTO `wancll_admin_visit_logs` VALUES ('20', '1', '1', '113.246.203.142', '2018-11-10 16:24:21', 'pc', '1', '2018-11-10 16:24:21', '2018-11-10 16:24:21');
INSERT INTO `wancll_admin_visit_logs` VALUES ('21', '1', '1', '113.246.203.142', '2018-11-10 17:10:13', 'pc', '1', '2018-11-10 17:10:13', '2018-11-10 17:10:13');
INSERT INTO `wancll_admin_visit_logs` VALUES ('22', '1', '1', '113.246.203.142', '2018-11-10 17:13:52', 'pc', '1', '2018-11-10 17:13:52', '2018-11-10 17:13:52');
INSERT INTO `wancll_admin_visit_logs` VALUES ('23', '1', '1', '113.246.203.142', '2018-11-10 17:14:17', 'pc', '1', '2018-11-10 17:14:17', '2018-11-10 17:14:17');
INSERT INTO `wancll_admin_visit_logs` VALUES ('24', '2', '2', '192.168.31.145', '2018-11-10 17:38:40', 'pc', '1', '2018-11-10 17:38:40', '2018-11-10 17:38:40');
INSERT INTO `wancll_admin_visit_logs` VALUES ('25', '2', '2', '175.0.204.133', '2018-11-11 21:16:02', 'pc', '1', '2018-11-11 21:16:02', '2018-11-11 21:16:02');
INSERT INTO `wancll_admin_visit_logs` VALUES ('26', '2', '2', '113.247.12.57', '2018-11-12 10:24:21', 'pc', '1', '2018-11-12 10:24:21', '2018-11-12 10:24:21');
INSERT INTO `wancll_admin_visit_logs` VALUES ('27', '2', '2', '113.247.12.57', '2018-11-12 10:28:32', 'pc', '1', '2018-11-12 10:28:32', '2018-11-12 10:28:32');
INSERT INTO `wancll_admin_visit_logs` VALUES ('28', '2', '2', '113.247.12.57', '2018-11-12 11:06:00', 'pc', '1', '2018-11-12 11:06:00', '2018-11-12 11:06:00');
INSERT INTO `wancll_admin_visit_logs` VALUES ('29', '2', '2', '113.247.12.57', '2018-11-12 11:09:16', 'pc', '1', '2018-11-12 11:09:16', '2018-11-12 11:09:16');
INSERT INTO `wancll_admin_visit_logs` VALUES ('30', '9', '9', '113.247.12.57', '2018-11-12 11:37:00', 'pc', '1', '2018-11-12 11:37:00', '2018-11-12 11:37:00');
INSERT INTO `wancll_admin_visit_logs` VALUES ('31', '2', '2', '113.247.12.57', '2018-11-12 13:36:57', 'pc', '1', '2018-11-12 13:36:57', '2018-11-12 13:36:57');
INSERT INTO `wancll_admin_visit_logs` VALUES ('32', '2', '2', '113.247.12.57', '2018-11-12 13:42:06', 'pc', '1', '2018-11-12 13:42:06', '2018-11-12 13:42:06');
INSERT INTO `wancll_admin_visit_logs` VALUES ('33', '2', '2', '113.247.12.57', '2018-11-12 13:50:10', 'pc', '1', '2018-11-12 13:50:10', '2018-11-12 13:50:10');
INSERT INTO `wancll_admin_visit_logs` VALUES ('34', '2', '2', '113.247.12.57', '2018-11-12 14:31:23', 'pc', '1', '2018-11-12 14:31:23', '2018-11-12 14:31:23');
INSERT INTO `wancll_admin_visit_logs` VALUES ('35', '2', '2', '113.247.12.57', '2018-11-12 15:57:27', 'pc', '1', '2018-11-12 15:57:27', '2018-11-12 15:57:27');
INSERT INTO `wancll_admin_visit_logs` VALUES ('36', '1', '1', '113.247.12.57', '2018-11-12 15:58:35', 'pc', '1', '2018-11-12 15:58:35', '2018-11-12 15:58:35');

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
  `is_view` tinyint(1) DEFAULT '1' COMMENT '是否显示：0否1是',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0假删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admins`
-- -----------------------------
INSERT INTO `wancll_admins` VALUES ('1', '', '', '', 'super', '', '', '', '', '', '', '[3]', '1', '0', '1', '2018-04-10 16:40:36', '2018-04-11 16:46:56');
INSERT INTO `wancll_admins` VALUES ('2', '18888888888', '', '', 'admin', '/public/upload/user_images/20180903/960576557ec4a9b2ad65282d06d8afcb.jpg', '', '', '', '', '', '[2]', '1', '1', '1', '2018-04-10 16:40:48', '2018-04-11 16:46:56');
INSERT INTO `wancll_admins` VALUES ('3', '', '', '', 'test', '', '', '', '', '', '', '[2]', '1', '1', '0', '2018-04-11 10:22:20', '2018-04-11 10:30:41');
INSERT INTO `wancll_admins` VALUES ('4', '', '', '', 'test', '', '', '', '', '', '', '[2]', '1', '1', '0', '2018-04-11 14:09:07', '2018-09-03 10:37:56');
INSERT INTO `wancll_admins` VALUES ('5', '18888888881', '', '', '1231', '/public/upload/user_avatar_images/20180629\\ab37000fab1f28d08476b722a2c9aca3.png', '188888888888', '', '', 'afdf@fadf.fga', 'fdafadfadsfdasfsd', '[3]', '1', '1', '0', '2018-06-29 11:59:02', '2018-09-03 10:37:53');
INSERT INTO `wancll_admins` VALUES ('6', '', '', '', '测试管理', '/public/upload/user_images/20180824/dccaa48903262c321b02db6fc5f38642.png', '', '', '', '', '', '[2]', '1', '1', '0', '2018-08-24 09:52:10', '2018-09-03 10:37:39');
INSERT INTO `wancll_admins` VALUES ('7', '11111111111', '', '', '1', '', '11111111111', '', '', '1@qq.com', '1', '[2]', '1', '1', '0', '2018-09-04 09:48:51', '2018-09-04 09:49:07');
INSERT INTO `wancll_admins` VALUES ('8', '', '', '', 'yiyun', '/public/static/images/avatar.png', '', '', '', '', '', '[3]', '1', '0', '1', '2018-11-10 10:05:47', '2018-11-10 10:05:47');
INSERT INTO `wancll_admins` VALUES ('9', '18175974828', '', '', '', '', '', '', '', '', '', '[2]', '1', '1', '1', '2018-11-12 11:36:45', '2018-11-12 11:36:45');

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
INSERT INTO `wancll_attr_templates` VALUES ('1', '衣服属性模板', '', '[{\"name\":\"品牌\",\"options\":[\"轩斯顿（XUANSIDUN）\",\"轩斯顿2（XUANSIDUN）\"]},{\"name\":\"商品名称\",\"options\":[\"轩斯顿 短袖T恤\"]},{\"name\":\"商品编号\",\"options\":[\"27069258521\"]},{\"name\":\"商品重量\",\"options\":[\"500.00g\"]},{\"name\":\"商品产地\",\"options\":[\"中国大陆\"]},{\"name\":\"厚度\",\"options\":[\"常规\"]},{\"name\":\"领型\",\"options\":[\"连帽\"]},{\"name\":\"颜色\",\"options\":[\"灰色\"]},{\"name\":\"袖长\",\"options\":[\"五分袖\"]}]', '0', '1', '2018-07-24 10:45:13', '2018-07-24 10:45:13');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_bank_cards`
-- -----------------------------
INSERT INTO `wancll_bank_cards` VALUES ('1', '9', '中国银行', '123456789123456588544', '15071357528', '1', '2018-11-12 12:47:20', '2018-11-12 12:47:20');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_bonus_levels`
-- -----------------------------
INSERT INTO `wancll_bonus_levels` VALUES ('1', '0', '会员分红商', '1.00', '0', '1', '0', '2018-06-03 17:47:53', '2018-09-26 17:18:32');
INSERT INTO `wancll_bonus_levels` VALUES ('2', '2', '主管分红商', '6.00', '5', '1', '1', '2018-06-03 17:49:02', '2018-09-10 10:50:16');
INSERT INTO `wancll_bonus_levels` VALUES ('3', '3', '经理分红商', '5.00', '500', '1', '1', '2018-06-03 17:50:11', '2018-09-10 10:50:16');
INSERT INTO `wancll_bonus_levels` VALUES ('4', '4', '董事分红商', '18.00', '1000', '1', '1', '2018-06-03 17:50:34', '2018-09-10 10:50:16');
INSERT INTO `wancll_bonus_levels` VALUES ('5', '11', '1', '1.00', '1', '1', '0', '2018-09-10 10:50:26', '2018-09-10 10:50:40');
INSERT INTO `wancll_bonus_levels` VALUES ('6', '111', '111', '11.00', '11', '1', '0', '2018-09-10 10:50:34', '2018-09-10 10:50:40');
INSERT INTO `wancll_bonus_levels` VALUES ('7', '4', '3', '4.00', '3', '1', '0', '2018-09-24 20:44:39', '2018-09-26 17:18:40');
INSERT INTO `wancll_bonus_levels` VALUES ('8', '1', '会员分红商', '1.00', '2', '1', '1', '2018-09-26 17:19:33', '2018-09-26 17:19:33');

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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

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
INSERT INTO `wancll_categories` VALUES ('30', '4', '3', '3', '1', '1', '2018-09-14 10:01:15', '2018-09-14 10:01:15');
INSERT INTO `wancll_categories` VALUES ('31', '1', '限时折扣广告', '0', '1', '1', '2018-09-29 16:06:24', '2018-09-29 16:06:24');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_commission_goods_levels`
-- -----------------------------
INSERT INTO `wancll_commission_goods_levels` VALUES ('1', '1', '12', 'rate', '1.00', 'rate', '0.50', 'rate', '0.00', '1', '2018-09-26 17:01:59', '2018-09-26 17:01:59');
INSERT INTO `wancll_commission_goods_levels` VALUES ('2', '2', '12', 'rate', '3.00', 'rate', '1.50', 'rate', '0.00', '1', '2018-09-26 17:01:59', '2018-09-26 17:01:59');
INSERT INTO `wancll_commission_goods_levels` VALUES ('3', '3', '12', 'rate', '5.00', 'rate', '2.50', 'rate', '0.00', '1', '2018-09-26 17:01:59', '2018-09-26 17:01:59');
INSERT INTO `wancll_commission_goods_levels` VALUES ('4', '4', '12', 'rate', '10.00', 'rate', '5.00', 'rate', '0.00', '1', '2018-09-26 17:01:59', '2018-09-26 17:01:59');

-- -----------------------------
-- Table structure for `wancll_config`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_config`;
CREATE TABLE `wancll_config` (
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

-- -----------------------------
-- Records of `wancll_config`
-- -----------------------------
INSERT INTO `wancll_config` VALUES ('27', 'version', 'v1.4.3', 'basic', 'text', '', '1', '2018-10-28 16:57:20', '2018-10-28 16:57:23');
INSERT INTO `wancll_config` VALUES ('12', 'system_title', '网开创', 'basic', 'text', '', '1', '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `wancll_config` VALUES ('15', 'web_icon', '/public/upload/user_images/20180926/baa9bc1f16dbdc95b49db87e5adff317.png', 'basic', 'img', '', '1', '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `wancll_config` VALUES ('16', 'admin_login_logo', '/public/static/images/login-logo.png', 'basic', 'img', '', '1', '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `wancll_config` VALUES ('17', 'admin_index_logo', '/public/static/images/fa-trademark.png', 'basic', 'img', '', '1', '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `wancll_config` VALUES ('18', 'wap_index_logo', '/public/static/wap/images/index_logo.png', 'basic', 'img', '', '1', '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `wancll_config` VALUES ('19', 'wap_login_logo', '/public/static/wap/images/wap_logo.png', 'basic', 'img', '', '1', '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `wancll_config` VALUES ('20', 'home_pc_logo', '/public/upload/user_images/20181028/25e8f92a0c5fb9c33881f5da093abbda.jpg', 'basic', 'img', '', '1', '2018-10-28 14:18:49', '2018-10-28 14:18:49');
INSERT INTO `wancll_config` VALUES ('28', 'copyright', '长沙网开亿面网络科技有限公司', 'basic', 'text', '', '1', '2018-10-28 16:58:30', '2018-10-28 16:58:33');
INSERT INTO `wancll_config` VALUES ('29', 'avatar', '/public/static/images/avatar.png', 'basic', 'img', '', '1', '2018-11-03 09:22:12', '2018-11-03 09:22:15');
INSERT INTO `wancll_config` VALUES ('30', 'share_img', '/public/static/wap/images/yaoqing.png', 'basic', 'img', '', '1', '2018-11-03 09:42:19', '2018-11-03 09:42:22');
INSERT INTO `wancll_config` VALUES ('31', 'customer_telephone', '4000-500-740', 'basic', 'text', '', '1', '2018-11-10 09:34:05', '2018-11-10 09:34:07');

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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_dds`
-- -----------------------------
INSERT INTO `wancll_dds` VALUES ('22', '2', 's', '', '', '0', '2018-09-10 11:33:02', '2018-09-10 11:33:14');
INSERT INTO `wancll_dds` VALUES ('23', '3', 'd', '', '', '0', '2018-09-10 11:33:05', '2018-09-10 11:33:14');
INSERT INTO `wancll_dds` VALUES ('24', '4', 'f', '', '', '0', '2018-09-10 11:33:09', '2018-09-10 11:33:14');
INSERT INTO `wancll_dds` VALUES ('9', '首页轮播商品', 'indexbannergoods', '', '', '1', '2018-04-17 11:33:54', '2018-04-17 11:33:54');
INSERT INTO `wancll_dds` VALUES ('11', 'pc首页商品配置', 'pcindexgoods', '', '', '1', '2018-04-25 10:59:20', '2018-04-25 10:59:20');
INSERT INTO `wancll_dds` VALUES ('13', '手机端logo', 'waplogo', '', '', '1', '2018-05-07 15:46:25', '2018-05-07 15:46:25');
INSERT INTO `wancll_dds` VALUES ('15', 'pc端logo', 'pclogo', '', '', '1', '2018-05-09 10:20:32', '2018-05-09 10:20:32');
INSERT INTO `wancll_dds` VALUES ('16', '底部链接文章', 'foottext', '', '', '1', '2018-05-09 10:26:29', '2018-05-09 10:26:29');
INSERT INTO `wancll_dds` VALUES ('21', '1', 'a', '', '', '0', '2018-09-10 11:32:58', '2018-09-10 11:33:14');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_freight_templates`
-- -----------------------------
INSERT INTO `wancll_freight_templates` VALUES ('1', '运费模板', '', '2', '1.00', '10.00', '1.00', '1.00', '[]', '0', '1', '2018-07-24 11:26:54', '2018-07-24 11:26:54');
INSERT INTO `wancll_freight_templates` VALUES ('2', '模板一', '', '1', '10.00', '10.00', '10.00', '10.00', '[{\"basic_value\":\"10\",\"basic_price\":\"10\",\"add_value\":\"10\",\"add_price\":\"10\",\"area_codes\":[\"540000\",\"540100\",\"540101\",\"540102\",\"540103\",\"540121\",\"540122\",\"540123\",\"540124\",\"540126\",\"540127\",\"540200\",\"540202\",\"540221\",\"540222\",\"540223\",\"540224\",\"540225\",\"540226\",\"540227\",\"540228\",\"540229\",\"540230\",\"540231\",\"540232\",\"540233\",\"540234\",\"540235\",\"540236\",\"540237\",\"540300\",\"540302\",\"540321\",\"540322\",\"540323\",\"540324\",\"540325\",\"540326\",\"540327\",\"540328\",\"540329\",\"540330\",\"540400\",\"540402\",\"540421\",\"540422\",\"540423\",\"540424\",\"540425\",\"540426\",\"540500\",\"540501\",\"540502\",\"540521\",\"540522\",\"540523\",\"540524\",\"540525\",\"540526\",\"540527\",\"540528\",\"540529\",\"540530\",\"540531\",\"542400\",\"542421\",\"542422\",\"542423\",\"542424\",\"542425\",\"542426\",\"542427\",\"542428\",\"542429\",\"542430\",\"542431\",\"542500\",\"542521\",\"542522\",\"542523\",\"542524\",\"542525\",\"542526\",\"542527\",\"650000\",\"650100\",\"650101\",\"650102\",\"650103\",\"650104\",\"650105\",\"650106\",\"650107\",\"650109\",\"650121\",\"650200\",\"650201\",\"650202\",\"650203\",\"650204\",\"650205\",\"650400\",\"650402\",\"650421\",\"650422\",\"650500\",\"650502\",\"650521\",\"650522\",\"652300\",\"652301\",\"652302\",\"652323\",\"652324\",\"652325\",\"652327\",\"652328\",\"652700\",\"652701\",\"652702\",\"652722\",\"652723\",\"652800\",\"652801\",\"652822\",\"652823\",\"652824\",\"652825\",\"652826\",\"652827\",\"652828\",\"652829\",\"652900\",\"652901\",\"652922\",\"652923\",\"652924\",\"652925\",\"652926\",\"652927\",\"652928\",\"652929\",\"653000\",\"653001\",\"653022\",\"653023\",\"653024\",\"653100\",\"653101\",\"653121\",\"653122\",\"653123\",\"653124\",\"653125\",\"653126\",\"653127\",\"653128\",\"653129\",\"653130\",\"653131\",\"653200\",\"653201\",\"653221\",\"653222\",\"653223\",\"653224\",\"653225\",\"653226\",\"653227\",\"654000\",\"654002\",\"654003\",\"654004\",\"654021\",\"654022\",\"654023\",\"654024\",\"654025\",\"654026\",\"654027\",\"654028\",\"654200\",\"654201\",\"654202\",\"654221\",\"654223\",\"654224\",\"654225\",\"654226\",\"654300\",\"654301\",\"654321\",\"654322\",\"654323\",\"654324\",\"654325\",\"654326\",\"659000\",\"659001\",\"659002\",\"659003\",\"659004\",\"659006\"]}]', '0', '1', '2018-08-15 14:45:45', '2018-08-15 14:45:45');
INSERT INTO `wancll_freight_templates` VALUES ('3', '重量计费', '重量', '1', '2.00', '20.00', '1.00', '10.00', '[]', '0', '1', '2018-08-24 08:00:59', '2018-08-24 08:00:59');
INSERT INTO `wancll_freight_templates` VALUES ('5', '测试模板', '测试模板', '1', '5.00', '50.00', '5000.00', '500.00', '[]', '0', '0', '2018-09-26 17:03:54', '2018-09-26 17:22:48');
INSERT INTO `wancll_freight_templates` VALUES ('4', '1', '1', '1', '1.00', '1.00', '1.00', '1.00', '[]', '0', '0', '2018-09-10 10:11:17', '2018-09-10 10:11:21');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_friendly_links`
-- -----------------------------
INSERT INTO `wancll_friendly_links` VALUES ('1', '15', '6', '', '6', '', '6', '6', '1', '0', '', '0', '0', '2018-08-27 17:13:37', '2018-09-10 11:40:11');
INSERT INTO `wancll_friendly_links` VALUES ('2', '14', '66', 'http://v4.wx.wygoo.com/public/upload/article_images/20180827/f14838766aee41c9f3556f0716073b72.png', '6', '', '6', '6', '1', '1', 'article', '6', '0', '2018-08-27 17:13:52', '2018-09-10 11:40:11');
INSERT INTO `wancll_friendly_links` VALUES ('3', '15', '55656', '', '5', '', '56', '5', '1', '0', '', '0', '0', '2018-09-14 10:07:45', '2018-09-14 10:08:14');
INSERT INTO `wancll_friendly_links` VALUES ('4', '14', '655656', '', '6556', '', '56', '566', '1', '0', '', '0', '0', '2018-09-14 10:07:55', '2018-09-14 10:08:12');

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
  `tag_ids` text COMMENT '自定义商品标签ID集合',
  `sell_num` bigint(20) unsigned DEFAULT '0' COMMENT '销售量',
  `click_num` bigint(20) unsigned DEFAULT '0' COMMENT '商品的点击数量',
  `collect_num` bigint(20) unsigned DEFAULT '0' COMMENT '收藏数量',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '商品排序',
  `is_top` tinyint(1) unsigned DEFAULT '0' COMMENT '是否置顶：0否1是',
  `score` tinyint(1) unsigned DEFAULT '5' COMMENT '商品的综合评分',
  `buy_get_score` bigint(20) DEFAULT '0' COMMENT '会员购买赠送积分',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1上架2下架',
  `attr_info` text COMMENT '属性信息',
  `spec_info` text COMMENT '规格信息',
  `freight_template_id` bigint(20) DEFAULT '0' COMMENT '运费模板ID',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods`
-- -----------------------------
INSERT INTO `wancll_goods` VALUES ('25', '14', '', '', '1', 'test02', '/public/upload/goods_images/20180929/ecf7514886eae5fd00f14e7c8e2bc13d.jpeg', '[\"\\/public\\/upload\\/goods_images\\/20180929\\/933eb689d58b71595a45bf62cb9076c8.jpeg\"]', '', '', '', '94', '0.00', '0.00', '0.01', '0.00', '0.00', '[]', '[]', '6', '0', '0', '0', '0', '5', '0', '1', '[]', '[]', '0', '1', '2018-09-29 20:36:16', '2018-09-29 20:36:16');
INSERT INTO `wancll_goods` VALUES ('26', '14', '8745454', '78565445', '0', '限时折扣商品', '/public/upload/goods_images/20181007/9847687bcd43304b9fb77209550fe69f.png', '[\"\\/public\\/upload\\/goods_images\\/20181007\\/9e5c23916ad850ca462273c2f3eea75f.png\"]', '限时折扣商品', '<p>限时折扣商品</p>', '', '55', '500.00', '1.50', '1.50', '1.50', '1.50', '[\"精品\"]', '[]', '25', '20', '20', '20', '1', '5', '0', '1', '[{\"name\":\"红\",\"options\":[\"大红\",\"深红\"],\"value\":\"大红\"},{\"name\":\"黑\",\"options\":[\"非常黑\",\"一般黑\"],\"value\":\"一般黑\"}]', '[{\"name\":\"颜色\",\"options\":[\"红色\",\"绿色\",\"蓝色\"]}]', '3', '0', '2018-10-07 14:26:25', '2018-10-13 11:09:26');
INSERT INTO `wancll_goods` VALUES ('24', '14', '', '', '0', 'test', '/public/upload/goods_images/20180929/e6d17c805cface1f3fb12c887afd11dc.jpeg', '[\"\\/public\\/upload\\/goods_images\\/20180929\\/dc2d9c3835cea57458d85af0f7c1432d.jpeg\"]', '', '', '', '97', '0.00', '0.00', '0.01', '0.00', '0.00', '[]', '[]', '10', '0', '0', '0', '0', '5', '0', '2', '[]', '[]', '0', '1', '2018-09-29 20:34:37', '2018-09-29 20:34:37');
INSERT INTO `wancll_goods` VALUES ('23', '14', '', '', '0', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '[\"\\/public\\/upload\\/goods_images\\/20180929\\/860bea6d466c87be602b762fb42c55f5.jpg\",\"\\/public\\/upload\\/goods_images\\/20180929\\/e6810c0cebc63e58a1ee05ef1b72ea7c.jpg\",\"\\/public\\/upload\\/goods_images\\/20180929\\/1398c35700607137fa1c9fcf5212146b.jpg\"]', '金银丝压褶针织裙', '<p><span style=\"color: rgb(153, 153, 153); font-family: \">浪漫金银丝，让行走仙气撩人</span></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><br/></p>', '', '181', '0.00', '0.00', '562.00', '0.00', '0.00', '[\"精品\",\"热销品\",\"新品\"]', '[]', '12670', '0', '0', '0', '1', '5', '1000', '1', '[{\"name\":\"红\",\"options\":[\"大红\",\"深红\"],\"value\":\"深红\"},{\"name\":\"绿\",\"options\":[\"深绿\"],\"value\":\"深绿\"}]', '[]', '0', '1', '2018-09-29 11:11:47', '2018-09-29 11:11:47');
INSERT INTO `wancll_goods` VALUES ('22', '14', '', '', '0', '女式分体裙式泳衣', '/public/upload/goods_images/20180929/920d1e74cd1c6b92a37df3f4633d217f.jpg', '[\"\\/public\\/upload\\/goods_images\\/20180929\\/ca10e4f76951c64ca4e29ed0b98c2b58.png\",\"\\/public\\/upload\\/goods_images\\/20180929\\/b34433e27167a686494a2e8dcdc0040f.jpg\",\"\\/public\\/upload\\/goods_images\\/20180929\\/031c1ce1ea6a6a779accc8d6d735e0b0.jpg\"]', '女式分体裙式泳衣', '<p><span style=\"color: rgb(153, 153, 153); font-family: \">惊艳出场，收割回头率</span></p>', '', '96', '0.00', '0.00', '129.00', '0.00', '0.00', '[\"精品\",\"热销品\",\"清仓\"]', '[]', '129', '0', '0', '0', '1', '5', '0', '1', '[{\"name\":\"绿\",\"options\":[\"浅绿\",\"深绿\"],\"value\":\"浅绿\"}]', '[]', '0', '1', '2018-09-29 11:09:18', '2018-09-29 11:09:18');
INSERT INTO `wancll_goods` VALUES ('21', '14', '', '', '0', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '[\"\\/public\\/upload\\/goods_images\\/20180929\\/366bf98c01580464ad5787dd76ad33cf.jpg\",\"\\/public\\/upload\\/goods_images\\/20180929\\/dd88d742fba2e0587421ba612e534d24.jpg\",\"\\/public\\/upload\\/goods_images\\/20180929\\/cd104bfaabaa607ea706c88c45fc36fd.jpg\"]', '男式基础色织纯棉圆领T恤', '<p><span style=\"color: rgb(153, 153, 153); font-family: \">毛羽夹花，错落层次</span></p>', '', '22178', '0.00', '0.00', '125.00', '0.00', '0.00', '[\"精品\",\"折扣\",\"清仓\"]', '[]', '10047', '0', '0', '0', '1', '5', '2', '1', '[{\"name\":\"橙\",\"options\":[\"浅橙\"],\"value\":\"浅橙\"}]', '[{\"name\":\"颜色\",\"options\":[\"橙色\"]},{\"name\":\"尺寸\",\"options\":[\"S\",\"M\"]}]', '0', '1', '2018-09-29 11:06:39', '2018-10-09 10:40:33');
INSERT INTO `wancll_goods` VALUES ('20', '14', '', '', '0', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', '[\"\\/public\\/upload\\/goods_images\\/20180929\\/6fe84cbc15effb8b17cf2a458d4dc831.jpg\",\"\\/public\\/upload\\/goods_images\\/20180929\\/e60f522c8b65476c35c59654d46562de.jpg\"]', 'Yessing男式高质感廓形开衫外套', '<p><span style=\"color: rgb(51, 51, 51); font-family: \">运动型格&nbsp;超值低价</span></p>', '', '41', '0.00', '0.00', '200.00', '0.00', '0.00', '[\"精品\",\"折扣\",\"清仓\"]', '[]', '12010', '0', '0', '0', '1', '5', '0', '1', '[{\"name\":\"黑色\",\"options\":[\"一般黑\"],\"value\":\"一般黑\"}]', '[{\"name\":\"颜色\",\"options\":[\"黑色\"]}]', '0', '1', '2018-09-29 10:58:29', '2018-10-09 16:38:07');
INSERT INTO `wancll_goods` VALUES ('19', '14', '', '', '0', '男式一体织运动生活两穿长袖衫', '/public/upload/goods_images/20180929/130db6af2e9a4c30f06eeb307df89272.png', '[\"\\/public\\/upload\\/goods_images\\/20180929\\/7674f9f8884a1dec7bb283e9da61d12e.png\",\"\\/public\\/upload\\/goods_images\\/20180929\\/e4c3fef443e4f0bc161eebf9e1fdf77c.png\",\"\\/public\\/upload\\/goods_images\\/20180929\\/7a8cc56c21ee65e079045f4994b82622.png\"]', '男式一体织运动生活两穿长袖衫', '<ul class=\" list-paddingleft-2\"><li><p>这款Columbia采用棉和聚酯纤维合成材质，面料柔和，手感细腻，亲肤性强，兼具透气和保暖性；经典的圆领套头款式，时尚简单的配色和标志性的LOGO，&nbsp;无论日常怎么搭配都是很不错的选择；采用直筒螺纹袖口，活动自如。</p></li><li><p><br/></p></li></ul><p><br/></p>', '', '546', '0.00', '0.00', '239.00', '420.00', '0.00', '[\"精品\",\"热销品\",\"折扣\"]', '[]', '1655', '0', '0', '0', '1', '5', '0', '1', '[{\"name\":\"黑\",\"options\":[\"非常黑\"],\"value\":\"非常黑\"}]', '[{\"name\":\"颜色\",\"options\":[\"黑色\",\"灰色\"]}]', '3', '1', '2018-09-29 10:52:33', '2018-09-30 18:08:14');
INSERT INTO `wancll_goods` VALUES ('18', '14', '', '', '0', '女式蝴蝶结衬衫', '/public/upload/goods_images/20180928/d6124aec51ebc39c1871cd41be6473ef.jpg', '[\"\\/public\\/upload\\/goods_images\\/20180928\\/0839d1ba8d3f039dbccb6d6c4ed136eb.jpg\"]', '女式蝴蝶结衬衫', '', '', '294', '0.00', '0.00', '100.00', '0.00', '0.00', '[\"精品\",\"新品\",\"热销品\"]', '[]', '6', '0', '0', '0', '1', '5', '0', '1', '[{\"name\":\"红\",\"options\":[\"大红\",\"深红\"],\"value\":\"深红\"},{\"name\":\"黑\",\"options\":[\"非常黑\",\"一般黑\"],\"value\":\"一般黑\"}]', '[{\"name\":\"颜色\",\"options\":[\"红色\",\"绿色\",\"蓝色\"]}]', '0', '1', '2018-09-28 19:44:22', '2018-09-28 19:44:22');
INSERT INTO `wancll_goods` VALUES ('27', '14', '', '', '0', 'tt', '/public/upload/goods_images/20181110/c6b53c464c08ac64f426b9837b49bd39.jpg', '[\"\\/public\\/upload\\/goods_images\\/20181110\\/0cf61e14f211bf91a480985f1d3c99cc.jpg\"]', 'tt', '', '', '2', '0.00', '0.00', '2.00', '0.00', '0.00', '[]', '', '2', '0', '0', '0', '0', '5', '0', '1', '[]', '[]', '0', '1', '2018-11-10 13:55:05', '2018-11-10 13:55:05');

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
INSERT INTO `wancll_goods_bonus` VALUES ('23', '0', '1', '1', '1', '10.00', '0', '1', '2018-10-09 16:29:27', '2018-10-09 16:29:27');

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_cates`
-- -----------------------------
INSERT INTO `wancll_goods_cates` VALUES ('14', '衣服', '', '0', '0', '1', '1', '2018-09-28 19:42:58', '2018-09-28 19:42:58');
INSERT INTO `wancll_goods_cates` VALUES ('15', '测试', '', '14', '0', '1', '1', '2018-11-12 11:10:13', '2018-11-12 11:10:13');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_collections`
-- -----------------------------
INSERT INTO `wancll_goods_collections` VALUES ('1', '2', '19', '1', '2018-11-10 15:09:20', '2018-11-10 15:09:20');
INSERT INTO `wancll_goods_collections` VALUES ('2', '2', '23', '1', '2018-11-10 15:56:31', '2018-11-10 15:56:31');
INSERT INTO `wancll_goods_collections` VALUES ('3', '4', '18', '1', '2018-11-10 16:46:20', '2018-11-10 16:46:20');
INSERT INTO `wancll_goods_collections` VALUES ('4', '2', '20', '1', '2018-11-10 18:12:43', '2018-11-10 18:12:43');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_comments`
-- -----------------------------
INSERT INTO `wancll_goods_comments` VALUES ('1', '8', '66', '23', '啊啊', '[]', '4', '1', '1', '2018-11-12 11:23:03', '2018-11-12 11:23:03');

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
INSERT INTO `wancll_goods_commission` VALUES ('22', '0', '1', '0', 'rate', '0.00', 'rate', '0.00', 'rate', '0.00', '1', '2018-09-30 17:20:16', '2018-09-30 17:20:16');
INSERT INTO `wancll_goods_commission` VALUES ('19', '0', '1', '0', 'rate', '0.00', 'rate', '0.00', 'rate', '0.00', '1', '2018-09-30 17:20:26', '2018-09-30 17:20:26');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_keywords`
-- -----------------------------
INSERT INTO `wancll_goods_keywords` VALUES ('1', 'Gkkjh', '2', '1', '2018-11-10 10:14:53', '2018-11-10 10:14:53');
INSERT INTO `wancll_goods_keywords` VALUES ('2', '就吐', '2', '1', '2018-11-10 14:59:49', '2018-11-10 14:59:49');
INSERT INTO `wancll_goods_keywords` VALUES ('3', '手机', '1', '1', '2018-11-10 16:11:59', '2018-11-10 16:11:59');
INSERT INTO `wancll_goods_keywords` VALUES ('4', '男式', '2', '1', '2018-11-10 16:12:18', '2018-11-10 16:12:18');
INSERT INTO `wancll_goods_keywords` VALUES ('5', '衣服', '7', '1', '2018-11-10 17:18:16', '2018-11-10 17:18:16');
INSERT INTO `wancll_goods_keywords` VALUES ('6', '啊啊啊', '1', '1', '2018-11-12 11:19:33', '2018-11-12 11:19:33');
INSERT INTO `wancll_goods_keywords` VALUES ('7', '女式', '1', '1', '2018-11-12 16:02:03', '2018-11-12 16:02:03');

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
) ENGINE=MyISAM AUTO_INCREMENT=288 DEFAULT CHARSET=utf8;

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
INSERT INTO `wancll_goods_spec_groups` VALUES ('243', '99634f20d3ba922db5ab94e8fa002994', '8', '红色', '', '1000.00', '1000.00', '1000.00', '1000.00', '100', '10000.00', '1000', '123456', '0', '0', '1', '2018-09-04 10:15:37', '2018-09-04 10:21:44');
INSERT INTO `wancll_goods_spec_groups` VALUES ('242', '9d653df2bede1d864f703472454645f5', '8', '绿色', '', '1000.00', '1000.00', '1000.00', '1000.00', '0', '10000.00', '1000', '123456', '0', '0', '1', '2018-09-04 10:15:37', '2018-09-04 10:21:44');
INSERT INTO `wancll_goods_spec_groups` VALUES ('241', 'f90dd144f9cb24d244cc023e74eca12c', '8', '蓝色', '', '1000.00', '1000.00', '1000.00', '1000.00', '97', '10000.00', '1000', '123456', '0', '0', '1', '2018-09-04 10:15:37', '2018-09-04 10:21:44');
INSERT INTO `wancll_goods_spec_groups` VALUES ('238', 'd6c62d56056f1cdffacddb848aeedc1f', '12', '小于50cm', '', '1188.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-09-26 14:06:53', '2018-09-26 14:06:53');
INSERT INTO `wancll_goods_spec_groups` VALUES ('239', '57ca3fbef3549d1c68a821ad5f08b23b', '12', '大于50cm', '', '1388.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-09-26 14:06:53', '2018-09-26 14:06:53');
INSERT INTO `wancll_goods_spec_groups` VALUES ('257', '937e97058c09673ac45e8cba3b3a3302', '17', '红色', '', '0.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-09-27 15:13:44', '2018-09-27 15:13:44');
INSERT INTO `wancll_goods_spec_groups` VALUES ('256', '998041f8cd070e175798211441e9e873', '17', '绿色', '', '0.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-09-27 15:13:44', '2018-09-27 15:13:44');
INSERT INTO `wancll_goods_spec_groups` VALUES ('255', 'd3c2d133ebafa4728ce2e183687f8c88', '17', '蓝色', '', '0.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-09-27 15:13:44', '2018-09-27 15:13:44');
INSERT INTO `wancll_goods_spec_groups` VALUES ('282', '3632406e94116a96aa6b79a29f2b58dc', '18', '绿色', '', '120.00', '120.00', '120.00', '120.00', '95', '500.00', '545445', '544545', '0', '0', '1', '2018-09-28 19:44:22', '2018-09-28 19:44:22');
INSERT INTO `wancll_goods_spec_groups` VALUES ('281', 'f18a998b077ff1a1b2c4183e3c4ce57a', '18', '蓝色', '', '120.00', '120.00', '120.00', '120.00', '99', '500.00', '545445', '544545', '0', '0', '1', '2018-09-28 19:44:22', '2018-09-28 19:44:22');
INSERT INTO `wancll_goods_spec_groups` VALUES ('273', 'db69e41d0f0ff49cca4b45a795471bea', '19', '灰色', '/public/upload/goods_images/20180930/b00e15ef5e4d4de1e4928c26ba528a18.png', '300.00', '300.00', '300.00', '300.00', '251', '500.00', '987845445', '544545', '0', '0', '1', '2018-09-29 10:52:33', '2018-09-29 10:52:33');
INSERT INTO `wancll_goods_spec_groups` VALUES ('280', '43790e633067801c8d346c42e11e9cf9', '20', '黑色', '', '100.00', '100.00', '100.00', '80.00', '41', '20.00', '84544554', '894511', '0', '0', '1', '2018-09-29 10:58:29', '2018-09-29 10:58:29');
INSERT INTO `wancll_goods_spec_groups` VALUES ('283', '35d312ed087327a1e1d5eae374fd2899', '18', '红色', '', '120.00', '120.00', '120.00', '120.00', '100', '500.00', '545445', '544545', '0', '0', '1', '2018-09-28 19:44:22', '2018-09-28 19:44:22');
INSERT INTO `wancll_goods_spec_groups` VALUES ('287', '4f473b63ba2b0782749c89e25e83f744', '21', '橙色_S', '', '125.00', '0.00', '0.00', '0.00', '11105', '0.00', '0', '0', '0', '0', '1', '2018-09-29 11:06:39', '2018-10-05 14:22:43');
INSERT INTO `wancll_goods_spec_groups` VALUES ('286', '1c60d5cc528afc2c7085b0cb6ac78a76', '21', '橙色_M', '', '125.00', '0.00', '0.00', '0.00', '11073', '0.00', '0', '0', '0', '0', '1', '2018-09-29 11:06:39', '2018-10-05 14:22:43');
INSERT INTO `wancll_goods_spec_groups` VALUES ('274', 'fac0dcf49245d2ec63cc9001288b996d', '19', '黑色', '/public/upload/goods_images/20180930/b00e15ef5e4d4de1e4928c26ba528a18.png', '300.00', '300.00', '300.00', '300.00', '295', '500.00', '987845445', '544545', '0', '0', '1', '2018-09-29 10:52:33', '2018-09-29 10:52:33');
INSERT INTO `wancll_goods_spec_groups` VALUES ('275', '3f4cdd660e6cd0088a283090046e9615', '26', '红色', '/public/upload/goods_images/20181007/49595592a0ae91fb971da390f8471131.png', '1.00', '1.00', '1.00', '1.00', '20', '200.00', '87544545', '984411212', '0', '0', '1', '2018-10-07 14:26:25', '2018-10-07 14:26:25');
INSERT INTO `wancll_goods_spec_groups` VALUES ('276', '20e98b8fa273347a896430d6f357b8ec', '26', '绿色', '/public/upload/goods_images/20181007/49595592a0ae91fb971da390f8471131.png', '1.00', '1.00', '1.00', '1.00', '17', '200.00', '87544545', '984411212', '0', '0', '1', '2018-10-07 14:26:25', '2018-10-07 14:26:25');
INSERT INTO `wancll_goods_spec_groups` VALUES ('277', '1b8a857838e89f2fd500da2e92398fc0', '26', '蓝色', '/public/upload/goods_images/20181007/49595592a0ae91fb971da390f8471131.png', '1.00', '1.00', '1.00', '1.00', '18', '200.00', '87544545', '984411212', '0', '0', '1', '2018-10-07 14:26:25', '2018-10-07 14:26:25');

-- -----------------------------
-- Table structure for `wancll_goods_tags`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_goods_tags`;
CREATE TABLE `wancll_goods_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `thum` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `sort` int(11) DEFAULT '0' COMMENT '排序：数值越大越靠前',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_goods_tags`
-- -----------------------------
INSERT INTO `wancll_goods_tags` VALUES ('1', '新品', '/public/upload/goods_images/20181028/e28d26012675e8fd51fa9f9923817f98.png', '5', '1', '2018-10-27 17:24:00', '2018-10-27 17:24:00');
INSERT INTO `wancll_goods_tags` VALUES ('2', '精品', '/public/upload/goods_images/20181028/1de70cf20975a376afbc4ff7d6a7e7e2.png', '4', '1', '2018-10-28 09:35:24', '2018-10-28 09:35:24');
INSERT INTO `wancll_goods_tags` VALUES ('3', '热销', '/public/upload/goods_images/20181028/a597f8b12aa311f3bcc1bf682ac1053b.png', '3', '1', '2018-10-28 09:36:03', '2018-10-28 09:36:03');
INSERT INTO `wancll_goods_tags` VALUES ('4', '折扣', '/public/upload/goods_images/20181028/7991b49ab59fde9a2ea6685fb0f76565.png', '2', '1', '2018-10-28 11:28:05', '2018-10-28 11:28:05');
INSERT INTO `wancll_goods_tags` VALUES ('5', '清仓', '/public/upload/goods_images/20181028/203770a684b90a947e19387fdabf17f8.png', '1', '1', '2018-10-28 11:28:20', '2018-10-28 11:28:20');

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
INSERT INTO `wancll_group_buy_system_goods` VALUES ('4', '8', '2018-09-04 10:20:59', '2018-09-30 00:00:00', '2', '500.00', '299', '1', '[{\"spec_group_id_str\":\"f90dd144f9cb24d244cc023e74eca12c\",\"person_num\":\"2\",\"money\":\"500\",\"stock\":99,\"spec_option_group\":\"蓝色\"},{\"spec_group_id_str\":\"9d653df2bede1d864f703472454645f5\",\"person_num\":\"2\",\"money\":\"500\",\"stock\":\"100\",\"spec_option_group\":\"绿色\"},{\"spec_group_id_str\":\"99634f20d3ba922db5ab94e8fa002994\",\"person_num\":\"2\",\"money\":\"500\",\"stock\":\"100\",\"spec_option_group\":\"红色\"}]', '0', '1', '0', '2018-09-04 10:20:59', '2018-09-25 14:18:31');
INSERT INTO `wancll_group_buy_system_goods` VALUES ('5', '7', '2018-09-04 10:21:16', '2018-09-30 00:00:00', '2', '5000.00', '1', '1', '[]', '0', '1', '0', '2018-09-04 10:21:16', '2018-09-25 14:18:31');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_group_buy_teams`
-- -----------------------------
INSERT INTO `wancll_group_buy_teams` VALUES ('1', '2', '21', '15', '2018-11-10 15:26:17', '2018-11-10 20:26:17', '3', '[{\"user_id\":2,\"order_id\":15}]', '0', '2', '2018-11-12 09:23:28', '2', '1', '2018-11-10 15:26:17', '2018-11-12 09:23:28');
INSERT INTO `wancll_group_buy_teams` VALUES ('2', '2', '23', '65', '2018-11-12 09:24:16', '2018-11-12 19:24:16', '10', '[{\"user_id\":2,\"order_id\":65}]', '0', '1', '', '1', '1', '2018-11-12 09:24:16', '2018-11-12 09:24:16');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
INSERT INTO `wancll_group_buy_user_goods` VALUES ('10', '7', '24.00', '2', '5000.00', '0', '1', '[]', '0', '1', '0', '2018-09-03 17:55:24', '2018-09-25 14:17:33');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('11', '8', '24.00', '2', '500.00', '300', '1', '[{\"spec_group_id_str\":\"f90dd144f9cb24d244cc023e74eca12c\",\"person_num\":\"2\",\"money\":\"500\",\"stock\":\"100\",\"spec_option_group\":\"蓝色\"},{\"spec_group_id_str\":\"9d653df2bede1d864f703472454645f5\",\"person_num\":\"2\",\"money\":\"500\",\"stock\":\"100\",\"spec_option_group\":\"绿色\"},{\"spec_group_id_str\":\"99634f20d3ba922db5ab94e8fa002994\",\"person_num\":\"2\",\"money\":\"500\",\"stock\":\"100\",\"spec_option_group\":\"红色\"}]', '0', '1', '0', '2018-09-04 10:21:44', '2018-09-25 14:17:33');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('12', '21', '5.00', '5', '60.00', '8', '1', '[{\"spec_group_id_str\":\"1c60d5cc528afc2c7085b0cb6ac78a76\",\"person_num\":\"3\",\"money\":\"10\",\"stock\":0,\"spec_option_group\":\"橙色_M\"},{\"spec_group_id_str\":\"4f473b63ba2b0782749c89e25e83f744\",\"person_num\":\"3\",\"money\":\"10\",\"stock\":8,\"spec_option_group\":\"橙色_S\"}]', '0', '1', '1', '2018-10-05 14:22:43', '2018-11-10 15:26:17');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('13', '24', '1.00', '3', '1.00', '93', '3', '[]', '0', '1', '1', '2018-10-09 10:46:14', '2018-10-09 10:51:28');
INSERT INTO `wancll_group_buy_user_goods` VALUES ('14', '23', '10.00', '10', '20.00', '19', '2', '[]', '0', '1', '1', '2018-11-10 16:08:01', '2018-11-12 09:24:16');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_guides`
-- -----------------------------
INSERT INTO `wancll_guides` VALUES ('1', '22', '方式发', '/public/upload/article_images/20180630\\af71e469697a4aa92543cff5eeba1823.png', 'dfa', '<p>的说法打法</p>', 'fsdf ', '[]', '', '', '0', '1', '1', '2018-06-30 11:43:24', '2018-09-10 11:55:45');
INSERT INTO `wancll_guides` VALUES ('2', '23', '1', '', '1', '', '1', '[]', '1', '', '0', '1', '0', '2018-09-10 11:55:21', '2018-09-10 11:56:02');
INSERT INTO `wancll_guides` VALUES ('3', '22', '2', '', '2', '', '2', '[]', '3', '2', '0', '1', '0', '2018-09-10 11:55:28', '2018-09-10 11:56:02');
INSERT INTO `wancll_guides` VALUES ('4', '21', '3', '', '3', '', '3', '[]', '3', '3', '0', '1', '0', '2018-09-10 11:55:37', '2018-09-10 11:56:02');

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_market_activities`
-- -----------------------------
INSERT INTO `wancll_market_activities` VALUES ('2', 'coupon', '优惠券活动', '/public/upload/user_images/20180926/c851fbc3b215ee0d5bad04d10e21be48.jpg', '[\"\\/public\\/upload\\/user_images\\/20180926\\/902486c07a5d32cd29d49988f852a4ed.jpg\"]', '3', '', '2018-08-24 00:00:00', '2019-07-06 00:00:00', '1', '1', '2018-08-24 13:57:41', '2018-09-10 10:21:24');
INSERT INTO `wancll_market_activities` VALUES ('3', 'full', '满减活动', '/public/upload/user_images/20180926/673c9608e5d1ba5ce08828501d0f1c18.jpg', '[\"\\/public\\/upload\\/user_images\\/20180926\\/d68dd0cfbfb52b3ec86752e56d3f187a.jpg\"]', '满减活动', '', '2018-08-24 00:00:00', '2018-09-30 00:00:00', '1', '0', '2018-08-24 13:58:53', '2018-10-06 09:19:30');
INSERT INTO `wancll_market_activities` VALUES ('4', 'full', '满减活动2', '/public/upload/user_images/20180926/f830c4e18e2b7fa3c864392666e804c9.jpg', '[\"\\/public\\/upload\\/user_images\\/20180926\\/caaddd5d80f128c2e1068b944d9f7c51.jpg\"]', '33', '', '2018-08-27 00:00:00', '2018-09-30 00:00:00', '1', '0', '2018-08-27 18:10:59', '2018-10-06 09:19:27');
INSERT INTO `wancll_market_activities` VALUES ('5', 'coupon', '优惠券活动2', '/public/upload/user_images/20180926/150909468247dc22cd3500ea9dbcf143.jpg', '[\"\\/public\\/upload\\/user_images\\/20180926\\/1c61b9718b86c1750c616e6239c325ee.jpg\"]', '优惠券活动2', '', '2018-08-28 00:00:00', '2018-09-30 00:00:00', '2', '1', '2018-08-27 18:11:39', '2018-09-10 10:21:24');
INSERT INTO `wancll_market_activities` VALUES ('7', 'coupon', '1', '/public/upload/user_images/20180903/7c6881e625d1c2cef03421ac139698eb.jpg', '[]', '1', '', '2018-09-03 00:00:00', '2018-09-30 00:00:00', '1', '0', '2018-09-03 10:32:14', '2018-09-10 10:21:31');
INSERT INTO `wancll_market_activities` VALUES ('8', 'coupon', '2', '/public/upload/user_images/20180903/79c3483fb4398becbf9372cfcf610c28.jpg', '[]', '2', '', '2018-09-03 00:00:00', '2018-09-29 00:00:00', '1', '0', '2018-09-03 10:32:30', '2018-09-10 10:21:31');
INSERT INTO `wancll_market_activities` VALUES ('9', 'discount', '345', '/public/upload/user_images/20180914/2c03bde3344352ee9a0e5d922d67106f.png', '[]', '554', '', '2018-09-12 00:00:00', '2018-09-27 00:00:00', '1', '0', '2018-09-14 09:17:10', '2018-09-14 09:17:17');
INSERT INTO `wancll_market_activities` VALUES ('12', 'full', '满减', '', '[]', '', '', '2018-10-06 09:19:42', '2019-01-05 00:00:00', '1', '1', '2018-10-06 09:19:48', '2018-10-06 09:19:48');
INSERT INTO `wancll_market_activities` VALUES ('13', 'discount', '10月折扣商品', '/public/upload/user_images/20181007/eccaeb1dc25aec1b09db61bde3ca04e8.png', '[\"\\/public\\/upload\\/user_images\\/20181007\\/bad0882fb66bf29f202c110f267e6d56.png\"]', '10月限时折扣商品', '', '2018-10-07 14:27:53', '2018-10-11 00:00:00', '2', '1', '2018-10-07 14:27:36', '2018-10-07 14:27:36');
INSERT INTO `wancll_market_activities` VALUES ('10', 'discount', '限时折扣', '', '[]', '', '', '2018-09-29 16:03:10', '2019-06-06 00:00:00', '1', '1', '2018-09-29 16:03:18', '2018-09-29 16:03:18');
INSERT INTO `wancll_market_activities` VALUES ('11', 'full', '营销活动101', '/public/upload/user_images/20180930/3e095c9165953fddee1325fcd5a15cbe.png', '[]', '活动', '', '2018-09-26 00:00:00', '2018-09-12 00:00:00', '2', '1', '2018-09-30 15:25:23', '2018-09-30 15:25:23');
INSERT INTO `wancll_market_activities` VALUES ('14', 'coupon', '10月优惠券活动', '/public/upload/user_images/20181007/40df265d5df3e08c5e96f0fb6e741d53.png', '[\"\\/public\\/upload\\/user_images\\/20181007\\/bb240b6e83e0f8f05fefe90cd03242a0.png\"]', '10月优惠券活动', '', '2018-10-07 14:32:26', '2018-10-10 00:00:00', '2', '1', '2018-10-07 14:31:59', '2018-10-07 14:31:59');
INSERT INTO `wancll_market_activities` VALUES ('15', 'full', '10月满减活动', '/public/upload/user_images/20181007/3ac6411f40fe0319a2cf11244c1774c7.jpg', '[\"\\/public\\/upload\\/user_images\\/20181007\\/e57af46d7e151ea7625fadd5000d8b13.jpg\"]', '10月满减活动', '', '2018-10-07 14:33:18', '2018-11-29 00:00:00', '1', '1', '2018-10-07 14:32:31', '2018-10-07 14:32:31');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_mobile_msgs`
-- -----------------------------
INSERT INTO `wancll_mobile_msgs` VALUES ('1', '15675143940', '您的验证码是：651129，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '651129', '0', '2018-11-10 17:38:07');
INSERT INTO `wancll_mobile_msgs` VALUES ('2', '18175974828', '您的验证码是：436819，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '436819', '0', '2018-11-12 11:11:22');
INSERT INTO `wancll_mobile_msgs` VALUES ('3', '18175974828', '您的验证码是：118346，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '118346', '0', '2018-11-12 11:11:29');
INSERT INTO `wancll_mobile_msgs` VALUES ('4', '15084960792', '您的验证码是：809738，请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '809738', '0', '2018-11-12 15:07:36');

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
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

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
INSERT INTO `wancll_navs` VALUES ('91', '基础设置', '', 'icon-shezhi1', 'admin', 'system', 'base_params', '', '2000', '0', '1', '1', '1', '2018-02-08 17:10:08', '2018-04-02 14:11:44');
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
INSERT INTO `wancll_navs` VALUES ('149', '系统团购商品设置', '', '', 'admin', 'group_shop', 'system_goods_list', '', '40', '147', '0', '2', '0', '2018-06-29 22:34:22', '2018-10-27 15:07:42');
INSERT INTO `wancll_navs` VALUES ('150', '积分商城配置', '', '', 'admin', 'score_shop', 'params', '', '50', '146', '0', '1', '1', '2018-06-30 15:12:10', '2018-06-30 15:12:10');
INSERT INTO `wancll_navs` VALUES ('151', '团购配置', '', '', 'admin', 'group_shop', 'params', '', '50', '147', '0', '1', '1', '2018-06-30 15:28:42', '2018-06-30 15:28:42');
INSERT INTO `wancll_navs` VALUES ('152', '积分订单管理', '', '', 'admin', 'score_shop', 'orders', '', '30', '146', '0', '1', '1', '2018-07-02 18:03:21', '2018-07-02 18:03:21');
INSERT INTO `wancll_navs` VALUES ('153', '会员团购商品设置', '', '', 'admin', 'group_shop', 'member_goods_list', '', '35', '147', '0', '1', '1', '2018-07-05 09:57:28', '2018-07-05 09:57:28');
INSERT INTO `wancll_navs` VALUES ('154', '定时任务管理', '', '', 'admin', 'system', 'time_task', '', '0', '22', '0', '1', '1', '2018-07-13 16:56:27', '2018-07-13 16:56:27');
INSERT INTO `wancll_navs` VALUES ('155', '系统团购订单管理', '', '', 'admin', 'group_shop', 'system_orders', '', '37', '147', '0', '2', '0', '2018-07-24 15:29:08', '2018-10-27 15:07:53');
INSERT INTO `wancll_navs` VALUES ('156', '会员团购订单管理', '', '', 'admin', 'group_shop', 'user_orders', '', '28', '147', '0', '1', '1', '2018-07-24 15:29:53', '2018-07-24 15:29:53');
INSERT INTO `wancll_navs` VALUES ('157', '系统团购拼团信息', '', '', 'admin', 'group_shop', 'system_teams', '', '38', '147', '0', '2', '0', '2018-07-24 15:31:51', '2018-10-27 15:07:46');
INSERT INTO `wancll_navs` VALUES ('158', '会员团购拼团信息', '', '', 'admin', 'group_shop', 'user_teams', '', '33', '147', '0', '1', '1', '2018-07-24 15:32:31', '2018-07-24 15:32:31');
INSERT INTO `wancll_navs` VALUES ('159', '拼团退款管理', '', '', 'admin', 'group_shop', 'return_money', '', '0', '147', '0', '1', '1', '2018-07-31 10:34:56', '2018-07-31 10:34:56');
INSERT INTO `wancll_navs` VALUES ('160', '统计版', '', '5', '65', '556', '5', '5', '5', '36', '0', '1', '0', '2018-08-24 10:17:39', '2018-09-03 10:42:57');
INSERT INTO `wancll_navs` VALUES ('161', '测试菜单', '', '', '测试', '3', '', '', '0', '0', '0', '1', '0', '2018-08-24 10:21:52', '2018-08-24 10:31:01');
INSERT INTO `wancll_navs` VALUES ('162', '测试菜单', '', '', '测试', '3', '', '', '0', '0', '0', '1', '0', '2018-08-24 10:21:53', '2018-08-24 10:30:54');
INSERT INTO `wancll_navs` VALUES ('163', '测试', '', '', '', '', '', '', '0', '0', '0', '1', '0', '2018-09-01 11:30:36', '2018-09-01 11:30:44');
INSERT INTO `wancll_navs` VALUES ('164', '1', '', '1', '1', '1', '1', '1', '0', '0', '0', '1', '0', '2018-09-01 11:33:59', '2018-09-01 11:34:06');
INSERT INTO `wancll_navs` VALUES ('165', '基础设置', '', '', 'admin', 'system', 'base_params', '', '0', '22', '0', '1', '1', '2018-09-07 14:47:09', '2018-09-07 14:47:09');
INSERT INTO `wancll_navs` VALUES ('166', '促销', '', 'icon-youhuiquan', '', '', '', '', '0', '0', '0', '2', '0', '2018-09-10 15:11:54', '2018-10-13 14:11:24');
INSERT INTO `wancll_navs` VALUES ('167', '优惠券管理', '', '', 'admin', 'promotion', 'pro_coupon', '', '0', '166', '0', '2', '0', '2018-09-10 15:13:13', '2018-10-13 14:11:15');
INSERT INTO `wancll_navs` VALUES ('168', '订单促销', '', '', 'admin', 'promotion', 'pro_order', '', '0', '166', '0', '2', '0', '2018-09-10 15:13:58', '2018-10-13 14:11:20');
INSERT INTO `wancll_navs` VALUES ('169', '商品促销', '', '', 'admin', 'promotion', 'pro_goods', '', '0', '166', '0', '2', '0', '2018-09-10 15:14:29', '2018-10-13 14:11:10');
INSERT INTO `wancll_navs` VALUES ('170', '商品标签', '', '', 'admin', 'goods', 'tags', '', '59', '43', '0', '1', '1', '2018-10-27 16:09:41', '2018-10-27 16:09:41');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
INSERT INTO `wancll_order_goods` VALUES ('1', '1', '18', '2', '女式蝴蝶结衬衫', '/public/upload/goods_images/20180928/d6124aec51ebc39c1871cd41be6473ef.jpg', '女式蝴蝶结衬衫', '', '3632406e94116a96aa6b79a29f2b58dc', '绿色', '120.00', '0.00', '20.00', '500.00', '1', '0', '0', '0', '0', '1', '2018-11-10 14:43:25', '2018-11-10 14:43:25');
INSERT INTO `wancll_order_goods` VALUES ('2', '2', '18', '2', '女式蝴蝶结衬衫', '/public/upload/goods_images/20180928/d6124aec51ebc39c1871cd41be6473ef.jpg', '女式蝴蝶结衬衫', '', '3632406e94116a96aa6b79a29f2b58dc', '绿色', '120.00', '0.00', '20.00', '500.00', '1', '0', '0', '0', '0', '1', '2018-11-10 14:43:26', '2018-11-10 14:43:26');
INSERT INTO `wancll_order_goods` VALUES ('3', '3', '20', '2', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', 'Yessing男式高质感廓形开衫外套', '', '43790e633067801c8d346c42e11e9cf9', '黑色', '100.00', '0.00', '100.00', '20.00', '1', '0', '0', '0', '0', '1', '2018-11-10 14:43:55', '2018-11-10 14:43:55');
INSERT INTO `wancll_order_goods` VALUES ('4', '4', '21', '2', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 14:44:58', '2018-11-10 14:44:58');
INSERT INTO `wancll_order_goods` VALUES ('5', '5', '18', '2', '女式蝴蝶结衬衫', '/public/upload/goods_images/20180928/d6124aec51ebc39c1871cd41be6473ef.jpg', '女式蝴蝶结衬衫', '', '3632406e94116a96aa6b79a29f2b58dc', '绿色', '120.00', '0.00', '120.00', '500.00', '1', '0', '0', '0', '0', '1', '2018-11-10 14:45:18', '2018-11-10 14:45:18');
INSERT INTO `wancll_order_goods` VALUES ('6', '6', '18', '2', '女式蝴蝶结衬衫', '/public/upload/goods_images/20180928/d6124aec51ebc39c1871cd41be6473ef.jpg', '女式蝴蝶结衬衫', '', '3632406e94116a96aa6b79a29f2b58dc', '绿色', '120.00', '0.00', '120.00', '500.00', '1', '0', '0', '0', '0', '1', '2018-11-10 14:45:25', '2018-11-10 14:45:25');
INSERT INTO `wancll_order_goods` VALUES ('7', '7', '21', '3', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:05:52', '2018-11-10 15:05:52');
INSERT INTO `wancll_order_goods` VALUES ('8', '8', '21', '3', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:05:52', '2018-11-10 15:05:52');
INSERT INTO `wancll_order_goods` VALUES ('9', '9', '22', '3', '女式分体裙式泳衣', '/public/upload/goods_images/20180929/920d1e74cd1c6b92a37df3f4633d217f.jpg', '女式分体裙式泳衣', '', '0', '', '129.00', '0.00', '129.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:06:59', '2018-11-10 15:06:59');
INSERT INTO `wancll_order_goods` VALUES ('10', '10', '22', '3', '女式分体裙式泳衣', '/public/upload/goods_images/20180929/920d1e74cd1c6b92a37df3f4633d217f.jpg', '女式分体裙式泳衣', '', '0', '', '129.00', '0.00', '129.00', '0.00', '1', '0', '1', '0', '0', '1', '2018-11-10 15:07:23', '2018-11-10 15:08:20');
INSERT INTO `wancll_order_goods` VALUES ('11', '11', '18', '2', '女式蝴蝶结衬衫', '/public/upload/goods_images/20180928/d6124aec51ebc39c1871cd41be6473ef.jpg', '女式蝴蝶结衬衫', '', '3632406e94116a96aa6b79a29f2b58dc', '绿色', '120.00', '0.00', '240.00', '500.00', '2', '0', '0', '0', '0', '1', '2018-11-10 15:09:47', '2018-11-10 15:09:47');
INSERT INTO `wancll_order_goods` VALUES ('12', '11', '19', '2', '男式一体织运动生活两穿长袖衫', '/public/upload/goods_images/20180930/b00e15ef5e4d4de1e4928c26ba528a18.png', '男式一体织运动生活两穿长袖衫', '', 'db69e41d0f0ff49cca4b45a795471bea', '灰色', '300.00', '0.00', '600.00', '500.00', '2', '0', '0', '0', '0', '1', '2018-11-10 15:09:47', '2018-11-10 15:09:47');
INSERT INTO `wancll_order_goods` VALUES ('13', '12', '25', '2', 'test02', '/public/upload/goods_images/20180929/ecf7514886eae5fd00f14e7c8e2bc13d.jpeg', '', '', '0', '', '0.01', '0.00', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:17:03', '2018-11-10 15:17:03');
INSERT INTO `wancll_order_goods` VALUES ('14', '13', '25', '2', 'test02', '/public/upload/goods_images/20180929/ecf7514886eae5fd00f14e7c8e2bc13d.jpeg', '', '', '0', '', '0.01', '0.00', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:17:35', '2018-11-10 15:17:35');
INSERT INTO `wancll_order_goods` VALUES ('15', '14', '21', '2', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:25:42', '2018-11-10 15:25:42');
INSERT INTO `wancll_order_goods` VALUES ('16', '15', '21', '2', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '4f473b63ba2b0782749c89e25e83f744', '橙色_S', '10.00', '0.00', '10.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:26:04', '2018-11-10 15:26:04');
INSERT INTO `wancll_order_goods` VALUES ('17', '16', '21', '2', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:27:32', '2018-11-10 15:27:32');
INSERT INTO `wancll_order_goods` VALUES ('18', '17', '21', '2', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:27:33', '2018-11-10 15:27:33');
INSERT INTO `wancll_order_goods` VALUES ('19', '18', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:47:14', '2018-11-10 15:47:14');
INSERT INTO `wancll_order_goods` VALUES ('20', '19', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:47:14', '2018-11-10 15:47:14');
INSERT INTO `wancll_order_goods` VALUES ('21', '20', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:47:15', '2018-11-10 15:47:15');
INSERT INTO `wancll_order_goods` VALUES ('22', '21', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:47:15', '2018-11-10 15:47:15');
INSERT INTO `wancll_order_goods` VALUES ('23', '22', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:47:15', '2018-11-10 15:47:15');
INSERT INTO `wancll_order_goods` VALUES ('24', '23', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:47:23', '2018-11-10 15:47:23');
INSERT INTO `wancll_order_goods` VALUES ('25', '24', '21', '2', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:51:58', '2018-11-10 15:51:58');
INSERT INTO `wancll_order_goods` VALUES ('26', '25', '21', '2', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:51:58', '2018-11-10 15:51:58');
INSERT INTO `wancll_order_goods` VALUES ('27', '26', '21', '2', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:51:59', '2018-11-10 15:51:59');
INSERT INTO `wancll_order_goods` VALUES ('28', '27', '25', '1', 'test02', '/public/upload/goods_images/20180929/ecf7514886eae5fd00f14e7c8e2bc13d.jpeg', '', '', '0', '', '0.01', '0.00', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 15:59:25', '2018-11-10 15:59:25');
INSERT INTO `wancll_order_goods` VALUES ('29', '28', '25', '1', 'test02', '/public/upload/goods_images/20180929/ecf7514886eae5fd00f14e7c8e2bc13d.jpeg', '', '', '0', '', '0.01', '0.00', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:00:15', '2018-11-10 16:00:15');
INSERT INTO `wancll_order_goods` VALUES ('30', '29', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:02:51', '2018-11-10 16:02:51');
INSERT INTO `wancll_order_goods` VALUES ('31', '30', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:02:57', '2018-11-10 16:02:57');
INSERT INTO `wancll_order_goods` VALUES ('32', '31', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:02:57', '2018-11-10 16:02:57');
INSERT INTO `wancll_order_goods` VALUES ('33', '32', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:02:57', '2018-11-10 16:02:57');
INSERT INTO `wancll_order_goods` VALUES ('34', '33', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `wancll_order_goods` VALUES ('35', '34', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `wancll_order_goods` VALUES ('36', '35', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `wancll_order_goods` VALUES ('37', '36', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `wancll_order_goods` VALUES ('38', '37', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:03:47', '2018-11-10 16:03:47');
INSERT INTO `wancll_order_goods` VALUES ('39', '38', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:03:54', '2018-11-10 16:03:54');
INSERT INTO `wancll_order_goods` VALUES ('40', '39', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:03:54', '2018-11-10 16:03:54');
INSERT INTO `wancll_order_goods` VALUES ('41', '40', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:03:54', '2018-11-10 16:03:54');
INSERT INTO `wancll_order_goods` VALUES ('42', '41', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:03:55', '2018-11-10 16:03:55');
INSERT INTO `wancll_order_goods` VALUES ('43', '42', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:03:55', '2018-11-10 16:03:55');
INSERT INTO `wancll_order_goods` VALUES ('44', '43', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:03:56', '2018-11-10 16:03:56');
INSERT INTO `wancll_order_goods` VALUES ('45', '44', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:03:56', '2018-11-10 16:03:56');
INSERT INTO `wancll_order_goods` VALUES ('46', '45', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:04:49', '2018-11-10 16:04:49');
INSERT INTO `wancll_order_goods` VALUES ('47', '46', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:05:01', '2018-11-10 16:05:01');
INSERT INTO `wancll_order_goods` VALUES ('48', '47', '23', '1', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '金银丝压褶针织裙', '', '0', '', '0.00', '20.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:05:09', '2018-11-10 16:05:09');
INSERT INTO `wancll_order_goods` VALUES ('49', '48', '23', '1', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '金银丝压褶针织裙', '', '0', '', '0.00', '20.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:05:17', '2018-11-10 16:05:17');
INSERT INTO `wancll_order_goods` VALUES ('50', '49', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:05:44', '2018-11-10 16:05:44');
INSERT INTO `wancll_order_goods` VALUES ('51', '50', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `wancll_order_goods` VALUES ('52', '51', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `wancll_order_goods` VALUES ('53', '52', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `wancll_order_goods` VALUES ('54', '53', '21', '1', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '1c60d5cc528afc2c7085b0cb6ac78a76', '橙色_M', '0.00', '100.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `wancll_order_goods` VALUES ('55', '54', '23', '1', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '金银丝压褶针织裙', '', '0', '', '0.00', '20.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:07:45', '2018-11-10 16:07:45');
INSERT INTO `wancll_order_goods` VALUES ('56', '55', '23', '1', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '金银丝压褶针织裙', '', '0', '', '0.00', '20.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:07:53', '2018-11-10 16:07:53');
INSERT INTO `wancll_order_goods` VALUES ('57', '56', '23', '1', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '金银丝压褶针织裙', '', '0', '', '0.00', '20.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:08:12', '2018-11-10 16:08:12');
INSERT INTO `wancll_order_goods` VALUES ('58', '57', '23', '1', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '金银丝压褶针织裙', '', '0', '', '0.00', '20.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:14:13', '2018-11-10 16:14:13');
INSERT INTO `wancll_order_goods` VALUES ('59', '58', '23', '1', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '金银丝压褶针织裙', '', '0', '', '0.00', '20.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:14:13', '2018-11-10 16:14:13');
INSERT INTO `wancll_order_goods` VALUES ('60', '59', '23', '1', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '金银丝压褶针织裙', '', '0', '', '0.00', '20.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:14:13', '2018-11-10 16:14:13');
INSERT INTO `wancll_order_goods` VALUES ('61', '60', '23', '1', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '金银丝压褶针织裙', '', '0', '', '0.00', '20.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:18:08', '2018-11-10 16:18:08');
INSERT INTO `wancll_order_goods` VALUES ('62', '61', '23', '1', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '金银丝压褶针织裙', '', '0', '', '0.00', '20.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:18:20', '2018-11-10 16:18:20');
INSERT INTO `wancll_order_goods` VALUES ('63', '62', '23', '1', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '金银丝压褶针织裙', '', '0', '', '0.00', '20.00', '0.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 16:18:44', '2018-11-10 16:18:44');
INSERT INTO `wancll_order_goods` VALUES ('64', '63', '22', '7', '女式分体裙式泳衣', '/public/upload/goods_images/20180929/920d1e74cd1c6b92a37df3f4633d217f.jpg', '女式分体裙式泳衣', '', '0', '', '129.00', '0.00', '129.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 18:39:25', '2018-11-10 18:39:25');
INSERT INTO `wancll_order_goods` VALUES ('65', '64', '22', '7', '女式分体裙式泳衣', '/public/upload/goods_images/20180929/920d1e74cd1c6b92a37df3f4633d217f.jpg', '女式分体裙式泳衣', '', '0', '', '129.00', '0.00', '129.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-10 18:39:50', '2018-11-10 18:39:50');
INSERT INTO `wancll_order_goods` VALUES ('66', '65', '23', '2', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '金银丝压褶针织裙', '', '0', '', '20.00', '0.00', '20.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-12 09:24:06', '2018-11-12 09:24:06');
INSERT INTO `wancll_order_goods` VALUES ('67', '66', '23', '8', '金银丝压褶针织裙', '/public/upload/goods_images/20180929/f8f01140695946e007e32ed241705473.jpg', '金银丝压褶针织裙', '', '0', '', '562.00', '0.00', '542.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-11-12 11:20:35', '2018-11-12 11:23:03');
INSERT INTO `wancll_order_goods` VALUES ('68', '67', '20', '9', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', 'Yessing男式高质感廓形开衫外套', '', '43790e633067801c8d346c42e11e9cf9', '黑色', '100.00', '0.00', '100.00', '20.00', '1', '0', '0', '0', '0', '1', '2018-11-12 13:46:31', '2018-11-12 13:46:31');
INSERT INTO `wancll_order_goods` VALUES ('69', '67', '21', '9', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '4f473b63ba2b0782749c89e25e83f744', '橙色_S', '125.00', '0.00', '125.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-12 13:46:31', '2018-11-12 13:46:31');
INSERT INTO `wancll_order_goods` VALUES ('70', '68', '20', '9', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', 'Yessing男式高质感廓形开衫外套', '', '43790e633067801c8d346c42e11e9cf9', '黑色', '100.00', '0.00', '100.00', '20.00', '1', '0', '0', '0', '0', '1', '2018-11-12 13:51:02', '2018-11-12 13:51:02');
INSERT INTO `wancll_order_goods` VALUES ('71', '68', '21', '9', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '4f473b63ba2b0782749c89e25e83f744', '橙色_S', '125.00', '0.00', '125.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-12 13:51:02', '2018-11-12 13:51:02');
INSERT INTO `wancll_order_goods` VALUES ('72', '69', '20', '9', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', 'Yessing男式高质感廓形开衫外套', '', '43790e633067801c8d346c42e11e9cf9', '黑色', '100.00', '0.00', '100.00', '20.00', '1', '0', '0', '0', '0', '1', '2018-11-12 13:51:44', '2018-11-12 13:51:44');
INSERT INTO `wancll_order_goods` VALUES ('73', '69', '21', '9', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '4f473b63ba2b0782749c89e25e83f744', '橙色_S', '125.00', '0.00', '125.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-12 13:51:44', '2018-11-12 13:51:44');
INSERT INTO `wancll_order_goods` VALUES ('74', '70', '20', '9', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', 'Yessing男式高质感廓形开衫外套', '', '43790e633067801c8d346c42e11e9cf9', '黑色', '100.00', '0.00', '100.00', '20.00', '1', '0', '0', '0', '0', '1', '2018-11-12 14:45:54', '2018-11-12 14:45:54');
INSERT INTO `wancll_order_goods` VALUES ('75', '70', '21', '9', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '4f473b63ba2b0782749c89e25e83f744', '橙色_S', '125.00', '0.00', '125.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-12 14:45:54', '2018-11-12 14:45:54');
INSERT INTO `wancll_order_goods` VALUES ('76', '71', '20', '9', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', 'Yessing男式高质感廓形开衫外套', '', '43790e633067801c8d346c42e11e9cf9', '黑色', '100.00', '0.00', '100.00', '20.00', '1', '0', '0', '0', '0', '1', '2018-11-12 14:48:45', '2018-11-12 14:48:45');
INSERT INTO `wancll_order_goods` VALUES ('77', '71', '21', '9', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '4f473b63ba2b0782749c89e25e83f744', '橙色_S', '125.00', '0.00', '125.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-12 14:48:45', '2018-11-12 14:48:45');
INSERT INTO `wancll_order_goods` VALUES ('78', '72', '20', '9', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', 'Yessing男式高质感廓形开衫外套', '', '43790e633067801c8d346c42e11e9cf9', '黑色', '100.00', '0.00', '100.00', '20.00', '1', '0', '0', '0', '0', '1', '2018-11-12 14:49:22', '2018-11-12 14:49:22');
INSERT INTO `wancll_order_goods` VALUES ('79', '72', '21', '9', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '4f473b63ba2b0782749c89e25e83f744', '橙色_S', '125.00', '0.00', '125.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-12 14:49:22', '2018-11-12 14:49:22');
INSERT INTO `wancll_order_goods` VALUES ('80', '73', '20', '9', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', 'Yessing男式高质感廓形开衫外套', '', '43790e633067801c8d346c42e11e9cf9', '黑色', '100.00', '0.00', '100.00', '20.00', '1', '0', '0', '0', '0', '1', '2018-11-12 15:49:10', '2018-11-12 15:49:10');
INSERT INTO `wancll_order_goods` VALUES ('81', '73', '21', '9', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '4f473b63ba2b0782749c89e25e83f744', '橙色_S', '125.00', '0.00', '125.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-12 15:49:10', '2018-11-12 15:49:10');
INSERT INTO `wancll_order_goods` VALUES ('82', '74', '20', '9', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', 'Yessing男式高质感廓形开衫外套', '', '43790e633067801c8d346c42e11e9cf9', '黑色', '100.00', '0.00', '100.00', '20.00', '1', '0', '0', '0', '0', '1', '2018-11-12 15:49:17', '2018-11-12 15:49:17');
INSERT INTO `wancll_order_goods` VALUES ('83', '74', '21', '9', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '4f473b63ba2b0782749c89e25e83f744', '橙色_S', '125.00', '0.00', '125.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-12 15:49:17', '2018-11-12 15:49:17');
INSERT INTO `wancll_order_goods` VALUES ('84', '75', '20', '9', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', 'Yessing男式高质感廓形开衫外套', '', '43790e633067801c8d346c42e11e9cf9', '黑色', '100.00', '0.00', '100.00', '20.00', '1', '0', '0', '0', '0', '1', '2018-11-12 15:49:25', '2018-11-12 15:49:25');
INSERT INTO `wancll_order_goods` VALUES ('85', '75', '21', '9', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '4f473b63ba2b0782749c89e25e83f744', '橙色_S', '125.00', '0.00', '125.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-12 15:49:25', '2018-11-12 15:49:25');
INSERT INTO `wancll_order_goods` VALUES ('86', '76', '20', '9', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', 'Yessing男式高质感廓形开衫外套', '', '43790e633067801c8d346c42e11e9cf9', '黑色', '100.00', '0.00', '100.00', '20.00', '1', '0', '0', '0', '0', '1', '2018-11-12 15:50:41', '2018-11-12 15:50:41');
INSERT INTO `wancll_order_goods` VALUES ('87', '76', '21', '9', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '4f473b63ba2b0782749c89e25e83f744', '橙色_S', '125.00', '0.00', '125.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-12 15:50:41', '2018-11-12 15:50:41');
INSERT INTO `wancll_order_goods` VALUES ('88', '77', '20', '9', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', 'Yessing男式高质感廓形开衫外套', '', '43790e633067801c8d346c42e11e9cf9', '黑色', '100.00', '0.00', '100.00', '20.00', '1', '0', '0', '0', '0', '1', '2018-11-12 15:50:50', '2018-11-12 15:50:50');
INSERT INTO `wancll_order_goods` VALUES ('89', '77', '21', '9', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '4f473b63ba2b0782749c89e25e83f744', '橙色_S', '125.00', '0.00', '125.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-12 15:50:50', '2018-11-12 15:50:50');
INSERT INTO `wancll_order_goods` VALUES ('90', '78', '20', '9', 'Yessing男式高质感廓形开衫外套', '/public/upload/goods_images/20180929/b463be763f68afb4a29a0ebe803d4ff2.jpg', 'Yessing男式高质感廓形开衫外套', '', '43790e633067801c8d346c42e11e9cf9', '黑色', '100.00', '0.00', '100.00', '20.00', '1', '0', '0', '0', '0', '1', '2018-11-12 15:50:58', '2018-11-12 15:50:58');
INSERT INTO `wancll_order_goods` VALUES ('91', '78', '21', '9', '男式基础色织纯棉圆领T恤', '/public/upload/goods_images/20180929/4d48c6c0fd78761319209c9d66af8d08.jpg', '男式基础色织纯棉圆领T恤', '', '4f473b63ba2b0782749c89e25e83f744', '橙色_S', '125.00', '0.00', '125.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-11-12 15:50:58', '2018-11-12 15:50:58');

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
  `reply_memo` text COMMENT '商家回复备注',
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
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_orders`
-- -----------------------------
INSERT INTO `wancll_orders` VALUES ('1', '2', 'N2018111014432544796', '1', 'discount', '4', '100.00', '120.00', '0.00', '20.00', '0.00', '12345688905', 'hgvb', '天津市', '120000', '市辖区', '120100', '河西区', '120103', 'ccb', '', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-11-10 14:43:25', '2018-11-10 14:43:25');
INSERT INTO `wancll_orders` VALUES ('2', '2', 'N2018111014432533825', '1', 'discount', '4', '100.00', '120.00', '0.00', '20.00', '0.00', '12345688905', 'hgvb', '天津市', '120000', '市辖区', '120100', '河西区', '120103', 'ccb', '', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-11-10 14:43:25', '2018-11-10 14:43:25');
INSERT INTO `wancll_orders` VALUES ('3', '2', 'N2018111014435500478', '1', '0', '0', '0.00', '100.00', '0.00', '100.00', '0.00', '12345688905', 'hgvb', '天津市', '120000', '市辖区', '120100', '河西区', '120103', 'ccb', '', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-11-10 14:43:55', '2018-11-10 14:43:55');
INSERT INTO `wancll_orders` VALUES ('4', '2', 'N2018111014445881554', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '12345688905', 'hgvb', '天津市', '120000', '市辖区', '120100', '河西区', '120103', 'ccb', '', '', '1', '3', '2018-11-10 14:44:58', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 14:44:58', '2018-11-10 14:44:58');
INSERT INTO `wancll_orders` VALUES ('5', '2', 'N2018111014451853986', '1', '0', '0', '0.00', '120.00', '0.00', '120.00', '0.00', '12345688905', 'hgvb', '天津市', '120000', '市辖区', '120100', '河西区', '120103', 'ccb', '', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-11-10 14:45:18', '2018-11-10 14:45:18');
INSERT INTO `wancll_orders` VALUES ('6', '2', 'N2018111014452540064', '1', '0', '0', '0.00', '120.00', '0.00', '120.00', '0.00', '12345688905', 'hgvb', '天津市', '120000', '市辖区', '120100', '河西区', '120103', 'ccb', '', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-11-10 14:45:25', '2018-11-10 14:45:25');
INSERT INTO `wancll_orders` VALUES ('7', '3', 'N2018111015055212054', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '12345678905', '看看', '山西省', '140000', '朔州市', '140600', '山阴县', '140621', '鸡腿', '', '', '1', '3', '2018-11-10 15:05:52', '0', '1', '2018-11-10 15:06:50', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:05:52', '2018-11-10 15:06:50');
INSERT INTO `wancll_orders` VALUES ('8', '3', 'N2018111015055236310', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '12345678905', '看看', '山西省', '140000', '朔州市', '140600', '山阴县', '140621', '鸡腿', '', '', '1', '3', '2018-11-10 15:05:52', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:05:52', '2018-11-10 15:05:52');
INSERT INTO `wancll_orders` VALUES ('9', '3', 'N2018111015065954470', '1', '0', '0', '0.00', '129.00', '0.00', '129.00', '0.00', '12345678905', '看看', '山西省', '140000', '朔州市', '140600', '山阴县', '140621', '鸡腿', '', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-11-10 15:06:59', '2018-11-10 15:06:59');
INSERT INTO `wancll_orders` VALUES ('10', '3', 'N2018111015072359604', '1', '0', '0', '0.00', '129.00', '0.00', '129.00', '0.00', '12345678905', '看看', '山西省', '140000', '朔州市', '140600', '山阴县', '140621', '鸡腿', '', '', '1', '3', '2018-11-10 15:07:34', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '1', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:07:23', '2018-11-10 15:08:20');
INSERT INTO `wancll_orders` VALUES ('11', '2', 'N2018111015094750069', '1', '0', '0', '0.00', '840.00', '20.00', '860.00', '0.00', '12345688905', 'hgvb', '天津市', '120000', '市辖区', '120100', '河西区', '120103', 'ccb', '', '', '1', '3', '2018-11-10 15:10:18', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:09:47', '2018-11-10 15:10:18');
INSERT INTO `wancll_orders` VALUES ('12', '2', 'N2018111015170365304', '1', '0', '0', '0.00', '0.01', '0.00', '0.01', '0.00', '12345688904', '路途', '河北省', '130000', '邯郸市', '130400', '邯郸县', '130421', '就', '', '', '1', '2', '2018-11-10 15:17:16', '1', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:17:03', '2018-11-10 15:17:16');
INSERT INTO `wancll_orders` VALUES ('13', '2', 'N2018111015173532630', '1', '0', '0', '0.00', '0.01', '0.00', '0.01', '0.00', '12345688904', '路途', '河北省', '130000', '邯郸市', '130400', '邯郸县', '130421', '就', '', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '商家缺货', '2018-11-10 16:03:26', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '9', '1', '2018-11-10 15:17:35', '2018-11-10 16:03:26');
INSERT INTO `wancll_orders` VALUES ('14', '2', 'N2018111015254225573', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '12345678905', '牛', '江苏省', '320000', '常州市', '320400', '市辖区', '320401', '12346679905', '', '', '1', '3', '2018-11-10 15:25:42', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:25:42', '2018-11-10 15:25:42');
INSERT INTO `wancll_orders` VALUES ('15', '2', 'N2018111015260494969', '3', '0', '0', '0.00', '10.00', '0.00', '10.00', '0.00', '12345678905', '牛', '江苏省', '320000', '常州市', '320400', '市辖区', '320401', '12346679905', '', '', '1', '3', '2018-11-10 15:26:17', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '0', '5.00', '1541852777', '3', '21', '4', '2', '1', '2018-11-10 15:26:04', '2018-11-12 09:23:28');
INSERT INTO `wancll_orders` VALUES ('16', '2', 'N2018111015273227609', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '12345678905', '牛', '江苏省', '320000', '常州市', '320400', '市辖区', '320401', '12346679905', '', '', '1', '3', '2018-11-10 15:27:32', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:27:32', '2018-11-10 15:27:32');
INSERT INTO `wancll_orders` VALUES ('17', '2', 'N2018111015273304719', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '12345678905', '牛', '江苏省', '320000', '常州市', '320400', '市辖区', '320401', '12346679905', '', '', '1', '3', '2018-11-10 15:27:33', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:27:33', '2018-11-10 15:27:33');
INSERT INTO `wancll_orders` VALUES ('18', '1', 'N2018111015471435707', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 15:47:14', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:47:14', '2018-11-10 15:47:14');
INSERT INTO `wancll_orders` VALUES ('19', '1', 'N2018111015471451043', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 15:47:14', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:47:14', '2018-11-10 15:47:14');
INSERT INTO `wancll_orders` VALUES ('20', '1', 'N2018111015471590654', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 15:47:15', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:47:15', '2018-11-10 15:47:15');
INSERT INTO `wancll_orders` VALUES ('21', '1', 'N2018111015471599187', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 15:47:15', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:47:15', '2018-11-10 15:47:15');
INSERT INTO `wancll_orders` VALUES ('22', '1', 'N2018111015471564946', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 15:47:15', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:47:15', '2018-11-10 15:47:15');
INSERT INTO `wancll_orders` VALUES ('23', '1', 'N2018111015472319763', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 15:47:23', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:47:23', '2018-11-10 15:47:23');
INSERT INTO `wancll_orders` VALUES ('24', '2', 'N2018111015515861841', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '12345678905', '九江', '北京市', '110000', '市辖区', '110100', '东城区', '110101', 'vvv', '快去做普通', '', '1', '3', '2018-11-10 15:51:58', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:51:58', '2018-11-10 15:51:58');
INSERT INTO `wancll_orders` VALUES ('25', '2', 'N2018111015515885752', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '12345678905', '九江', '北京市', '110000', '市辖区', '110100', '东城区', '110101', 'vvv', '快去做普通', '', '1', '3', '2018-11-10 15:51:58', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:51:58', '2018-11-10 15:51:58');
INSERT INTO `wancll_orders` VALUES ('26', '2', 'N2018111015515980802', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '12345678905', '九江', '北京市', '110000', '市辖区', '110100', '东城区', '110101', 'vvv', '快去做普通', '', '1', '3', '2018-11-10 15:51:59', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:51:59', '2018-11-10 15:51:59');
INSERT INTO `wancll_orders` VALUES ('27', '1', 'N2018111015592502959', '1', '0', '0', '0.00', '0.01', '0.00', '0.01', '0.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '2', '2018-11-10 15:59:35', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 15:59:25', '2018-11-10 15:59:35');
INSERT INTO `wancll_orders` VALUES ('28', '1', 'N2018111016001585709', '1', '0', '0', '0.00', '0.01', '0.00', '0.01', '0.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '2', '2018-11-10 16:00:29', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:00:15', '2018-11-10 16:00:29');
INSERT INTO `wancll_orders` VALUES ('29', '1', 'N2018111016025150284', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:02:51', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:02:51', '2018-11-10 16:02:51');
INSERT INTO `wancll_orders` VALUES ('30', '1', 'N2018111016025712547', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:02:57', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:02:57', '2018-11-10 16:02:57');
INSERT INTO `wancll_orders` VALUES ('31', '1', 'N2018111016025793859', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:02:57', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:02:57', '2018-11-10 16:02:57');
INSERT INTO `wancll_orders` VALUES ('32', '1', 'N2018111016025701934', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:02:57', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:02:57', '2018-11-10 16:02:57');
INSERT INTO `wancll_orders` VALUES ('33', '1', 'N2018111016025881479', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:02:58', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `wancll_orders` VALUES ('34', '1', 'N2018111016025861001', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:02:58', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `wancll_orders` VALUES ('35', '1', 'N2018111016025886774', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:02:58', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `wancll_orders` VALUES ('36', '1', 'N2018111016025888706', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:02:58', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `wancll_orders` VALUES ('37', '1', 'N2018111016034774614', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:03:47', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:03:47', '2018-11-10 16:03:47');
INSERT INTO `wancll_orders` VALUES ('38', '1', 'N2018111016035458588', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:03:54', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:03:54', '2018-11-10 16:03:54');
INSERT INTO `wancll_orders` VALUES ('39', '1', 'N2018111016035418355', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:03:54', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:03:54', '2018-11-10 16:03:54');
INSERT INTO `wancll_orders` VALUES ('40', '1', 'N2018111016035435019', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:03:54', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:03:54', '2018-11-10 16:03:54');
INSERT INTO `wancll_orders` VALUES ('41', '1', 'N2018111016035500610', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:03:55', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:03:55', '2018-11-10 16:03:55');
INSERT INTO `wancll_orders` VALUES ('42', '1', 'N2018111016035511920', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:03:55', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:03:55', '2018-11-10 16:03:55');
INSERT INTO `wancll_orders` VALUES ('43', '1', 'N2018111016035532210', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:03:55', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:03:55', '2018-11-10 16:03:55');
INSERT INTO `wancll_orders` VALUES ('44', '1', 'N2018111016035658434', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:03:56', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:03:56', '2018-11-10 16:03:56');
INSERT INTO `wancll_orders` VALUES ('45', '1', 'N2018111016044905546', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:04:49', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:04:49', '2018-11-10 16:04:49');
INSERT INTO `wancll_orders` VALUES ('46', '1', 'N2018111016050100321', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:05:01', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:05:01', '2018-11-10 16:05:01');
INSERT INTO `wancll_orders` VALUES ('47', '1', 'N2018111016050922768', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '20.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:05:09', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:05:09', '2018-11-10 16:05:09');
INSERT INTO `wancll_orders` VALUES ('48', '1', 'N2018111016051741105', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '20.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:05:17', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:05:17', '2018-11-10 16:05:17');
INSERT INTO `wancll_orders` VALUES ('49', '1', 'N2018111016054475535', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:05:44', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:05:44', '2018-11-10 16:05:44');
INSERT INTO `wancll_orders` VALUES ('50', '1', 'N2018111016055082432', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:05:50', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `wancll_orders` VALUES ('51', '1', 'N2018111016055046176', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:05:50', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `wancll_orders` VALUES ('52', '1', 'N2018111016055000064', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:05:50', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `wancll_orders` VALUES ('53', '1', 'N2018111016055052976', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '100.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:05:50', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `wancll_orders` VALUES ('54', '1', 'N2018111016074542763', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '20.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:07:45', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:07:45', '2018-11-10 16:07:45');
INSERT INTO `wancll_orders` VALUES ('55', '1', 'N2018111016075314040', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '20.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:07:53', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:07:53', '2018-11-10 16:07:53');
INSERT INTO `wancll_orders` VALUES ('56', '1', 'N2018111016081206935', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '20.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:08:12', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:08:12', '2018-11-10 16:08:12');
INSERT INTO `wancll_orders` VALUES ('57', '1', 'N2018111016141370590', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '20.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:14:13', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:14:13', '2018-11-10 16:14:13');
INSERT INTO `wancll_orders` VALUES ('58', '1', 'N2018111016141336275', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '20.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:14:13', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:14:13', '2018-11-10 16:14:13');
INSERT INTO `wancll_orders` VALUES ('59', '1', 'N2018111016141315273', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '20.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:14:13', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:14:13', '2018-11-10 16:14:13');
INSERT INTO `wancll_orders` VALUES ('60', '1', 'N2018111016180888736', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '20.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:18:08', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:18:08', '2018-11-10 16:18:08');
INSERT INTO `wancll_orders` VALUES ('61', '1', 'N2018111016182057204', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '20.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:18:20', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:18:20', '2018-11-10 16:18:20');
INSERT INTO `wancll_orders` VALUES ('62', '1', 'N2018111016184418540', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '20.00', '18390606242', '999', '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303', 'Njjjj', '', '', '1', '3', '2018-11-10 16:18:44', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-10 16:18:44', '2018-11-10 16:18:44');
INSERT INTO `wancll_orders` VALUES ('63', '7', 'N2018111018392565960', '1', '0', '0', '0.00', '129.00', '0.00', '129.00', '0.00', '12345678912', '123456', '北京市', '110000', '市辖区', '110100', '朝阳区', '110105', '长沙', '', '', '1', '3', '2018-11-10 18:40:06', '0', '0', '', '2018-11-10 18:40:22', '0', 'huitongkuaidi', '123456', '', '0', '2018-11-10 18:40:49', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-11-10 18:39:25', '2018-11-10 18:40:49');
INSERT INTO `wancll_orders` VALUES ('64', '7', 'N2018111018395033027', '1', '0', '0', '0.00', '129.00', '0.00', '129.00', '0.00', '12345678912', '123456', '北京市', '110000', '市辖区', '110100', '朝阳区', '110105', '长沙', '', '', '1', '3', '2018-11-10 18:39:57', '0', '0', '', '2018-11-10 18:40:34', '0', 'huitongkuaidi', '123456', '', '0', '2018-11-10 18:40:44', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-11-10 18:39:50', '2018-11-10 18:40:44');
INSERT INTO `wancll_orders` VALUES ('65', '2', 'N2018111209240631039', '3', '0', '0', '0.00', '20.00', '0.00', '20.00', '0.00', '12345678905', '继续', '北京市', '110000', '市辖区', '110100', '东城区', '110101', '泪如雨下', '', '', '1', '3', '2018-11-12 09:24:16', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '1', '0', '10.00', '1542021856', '10', '23', '1', '2', '1', '2018-11-12 09:24:06', '2018-11-12 09:24:16');
INSERT INTO `wancll_orders` VALUES ('66', '8', 'N2018111211203530483', '1', 'full', '3', '20.00', '562.00', '0.00', '542.00', '0.00', '18175974828', '啊啊啊', '北京市', '110000', '市辖区', '110100', '石景山区', '110107', '啊啊啊啊啊啊啊啊', '', 'HAHHAHA', '1', '3', '2018-11-12 11:21:02', '0', '0', '', '2018-11-12 11:22:24', '0', 'huitongkuaidi', '123456', '', '0', '2018-11-12 11:22:36', '', '', '1', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '4', '1', '2018-11-12 11:20:35', '2018-11-12 11:23:03');
INSERT INTO `wancll_orders` VALUES ('67', '9', 'N2018111213463151961', '1', '0', '0', '0.00', '225.00', '0.00', '225.00', '0.00', '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '给我包好了', '', '1', '3', '2018-11-12 13:46:42', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-12 13:46:31', '2018-11-12 13:46:42');
INSERT INTO `wancll_orders` VALUES ('68', '9', 'N2018111213510234550', '1', '0', '0', '0.00', '225.00', '0.00', '225.00', '0.00', '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '给我包好了', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-11-12 13:51:02', '2018-11-12 13:51:02');
INSERT INTO `wancll_orders` VALUES ('69', '9', 'N2018111213514443132', '1', '0', '0', '0.00', '225.00', '0.00', '225.00', '0.00', '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '给我包好了', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-11-12 13:51:44', '2018-11-12 13:51:44');
INSERT INTO `wancll_orders` VALUES ('70', '9', 'N2018111214455429929', '1', '0', '0', '0.00', '225.00', '0.00', '225.00', '0.00', '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '给我包好了', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-11-12 14:45:54', '2018-11-12 14:45:54');
INSERT INTO `wancll_orders` VALUES ('71', '9', 'N2018111214484555517', '1', '0', '0', '0.00', '225.00', '0.00', '225.00', '0.00', '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '给我包好了', '', '1', '3', '2018-11-12 14:48:46', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-12 14:48:45', '2018-11-12 14:48:46');
INSERT INTO `wancll_orders` VALUES ('72', '9', 'N2018111214492293059', '1', '0', '0', '0.00', '225.00', '0.00', '225.00', '0.00', '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '给我包好了', '', '1', '3', '2018-11-12 14:49:22', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-12 14:49:22', '2018-11-12 14:49:22');
INSERT INTO `wancll_orders` VALUES ('73', '9', 'N2018111215491056623', '1', '0', '0', '0.00', '225.00', '0.00', '225.00', '0.00', '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '给我包好了', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-11-12 15:49:10', '2018-11-12 15:49:10');
INSERT INTO `wancll_orders` VALUES ('74', '9', 'N2018111215491700989', '1', '0', '0', '0.00', '225.00', '0.00', '225.00', '0.00', '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '给我包好了', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-11-12 15:49:17', '2018-11-12 15:49:17');
INSERT INTO `wancll_orders` VALUES ('75', '9', 'N2018111215492508917', '1', '0', '0', '0.00', '225.00', '0.00', '225.00', '0.00', '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '给我包好了', '', '0', '', '', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '1', '1', '2018-11-12 15:49:25', '2018-11-12 15:49:25');
INSERT INTO `wancll_orders` VALUES ('76', '9', 'N2018111215504169401', '1', '0', '0', '0.00', '225.00', '0.00', '225.00', '0.00', '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '给我包好了', '', '1', '3', '2018-11-12 15:50:41', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-12 15:50:41', '2018-11-12 15:50:41');
INSERT INTO `wancll_orders` VALUES ('77', '9', 'N2018111215505088666', '1', '0', '0', '0.00', '225.00', '0.00', '225.00', '0.00', '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '给我包好了', '', '1', '3', '2018-11-12 15:50:51', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-12 15:50:50', '2018-11-12 15:50:51');
INSERT INTO `wancll_orders` VALUES ('78', '9', 'N2018111215505860048', '1', '0', '0', '0.00', '225.00', '0.00', '225.00', '0.00', '15071357528', '15071357528', '江苏省', '320000', '常州市', '320400', '武进区', '320412', '7845454545', '给我包好了', '', '1', '3', '2018-11-12 15:50:58', '0', '0', '', '', '0', '', '', '', '0', '', '', '', '0', '0', '0', '0', '0.00', '0', '0', '', '', '', '', '1', '2', '1', '2018-11-12 15:50:58', '2018-11-12 15:50:58');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_return_goods`
-- -----------------------------
INSERT INTO `wancll_return_goods` VALUES ('1', '1', '3', '10', '10', 'G2018111015082095851', '129.00', '[\"\\/public\\/upload\\/user_images\\/20181110\\/90fdc654c8f7fa0407f388b1beb9ee3f.jpg\"]', '1', 'hdsh(哼哼锯了你)', '', '0', '', '1', '1', '2018-11-10 15:08:20', '2018-11-10 15:08:20');
INSERT INTO `wancll_return_goods` VALUES ('2', '2', '2', '15', '16', 'G2018111209232840517', '10.00', '[]', '9', '拼团失败，系统自动退款', '2018-11-12 09:23:28', '0', '', '3', '1', '2018-11-12 09:23:28', '2018-11-12 09:23:28');

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
INSERT INTO `wancll_role_nav_powers` VALUES ('2', '[91,92,93,36,94,1,2,112,75,113,129,128,33,140,114,115,116,119,118,117,43,44,45,100,101,102,46,47,48,49,76,77,90,78,121,122,127,125,124,146,150,148,152,147,151,149,157,155,153,158,156,159,81,83,82,131,86,130,141,132,134,133,137,136,138,139,135,142,22,29,70,27,23,24,34,143,103,105,165,154,126,104,37,18,38,39,42,32,21,166,169,168,167]', '1', '2018-04-04 10:57:01', '2018-09-17 15:55:56');
INSERT INTO `wancll_role_nav_powers` VALUES ('3', '[91,92,93,36,94,1,2,112,75,113,129,128,33,140,114,115,116,119,118,117,43,44,45,100,101,102,46,47,48,49,76,77,90,78,121,122,127,125,124,146,150,148,152,147,151,149,157,155,153,158,156,159,81,83,82,131,86,130,141,132,134,133,137,136,138,139,135,142,22,29,70,27,23,24,34,143,103,105,165,154,126,104,37,18,38,39,42,32,21,166,169,168,167]', '1', '2018-04-04 10:57:34', '2018-09-10 15:17:22');
INSERT INTO `wancll_role_nav_powers` VALUES ('4', '[]', '1', '2018-04-05 17:57:18', '2018-04-05 17:57:18');
INSERT INTO `wancll_role_nav_powers` VALUES ('5', '[]', '1', '2018-06-29 14:14:09', '2018-06-29 14:14:09');
INSERT INTO `wancll_role_nav_powers` VALUES ('6', '[36,94,1,116]', '1', '2018-08-24 09:46:23', '2018-08-24 10:51:55');
INSERT INTO `wancll_role_nav_powers` VALUES ('7', '[]', '1', '2018-09-04 09:47:48', '2018-09-04 09:47:48');
INSERT INTO `wancll_role_nav_powers` VALUES ('8', '[]', '1', '2018-09-10 11:31:27', '2018-09-10 11:31:27');
INSERT INTO `wancll_role_nav_powers` VALUES ('9', '[]', '1', '2018-09-10 11:31:57', '2018-09-10 11:31:57');
INSERT INTO `wancll_role_nav_powers` VALUES ('10', '[]', '1', '2018-09-10 11:32:01', '2018-09-10 11:32:01');
INSERT INTO `wancll_role_nav_powers` VALUES ('11', '[]', '1', '2018-09-26 17:43:00', '2018-09-26 17:43:00');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
INSERT INTO `wancll_roles` VALUES ('8', '1', '1', 'user', '0', '2018-09-10 11:31:27', '2018-09-10 11:31:54');
INSERT INTO `wancll_roles` VALUES ('9', '1', '1', 'user', '0', '2018-09-10 11:31:57', '2018-09-10 11:32:07');
INSERT INTO `wancll_roles` VALUES ('10', '2', '2', 'admin', '0', '2018-09-10 11:32:01', '2018-09-10 11:32:05');
INSERT INTO `wancll_roles` VALUES ('11', '测试角色', '测试角色', 'admin', '0', '2018-09-26 17:43:00', '2018-09-26 17:44:01');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_rules`
-- -----------------------------
INSERT INTO `wancll_rules` VALUES ('1', '18', '43', '/public/upload/article_images/20180824/10b240754b2569ba5ca96096d21f83e3.png', '34', '<p>4334433443</p>', '433', '[]', '4343', '3443', '0', '1', '1', '2018-08-24 13:05:19', '2018-09-10 11:40:36');
INSERT INTO `wancll_rules` VALUES ('2', '18', '3343434', '/public/upload/article_images/20180824/39f45d1f26e7d31f90ca305ef4173f08.png', '43', '343443443', '4334', '[]', '4343', '34', '0', '1', '1', '2018-08-24 13:05:38', '2018-09-10 11:40:36');
INSERT INTO `wancll_rules` VALUES ('3', '19', '43434', '/public/upload/article_images/20180824/c1910dfeac43e6effd6368e56094d113.png', '3434', '43433434', '4334', '[]', '3443', '34', '0', '1', '1', '2018-08-24 13:05:52', '2018-09-10 11:40:36');
INSERT INTO `wancll_rules` VALUES ('4', '17', '1', '', '1', '', '1', '[]', '1', '1', '0', '1', '0', '2018-09-10 11:40:43', '2018-09-10 11:40:47');
INSERT INTO `wancll_rules` VALUES ('5', '17', '服务条款', '', '', '<p>服务条款</p>', '', '[]', '', '', '0', '1', '1', '2018-09-17 20:59:50', '2018-09-17 20:59:50');
INSERT INTO `wancll_rules` VALUES ('6', '17', '隐私政策', '', '', '<p><span style=\"color: #a31515;\">隐私政策</span></p><p><br/></p>', '', '[]', '', '', '0', '1', '1', '2018-09-17 21:00:02', '2018-09-17 21:00:02');

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_score_goods`
-- -----------------------------
INSERT INTO `wancll_score_goods` VALUES ('1', '1', '[{\"spec_group_id_str\":\"f151bcf787d73a0cb29fd360d7f6f598\",\"score\":\"10\",\"money\":0,\"spec_option_group\":\"尺寸\"}]', '10.00', '0.00', '0', '1', '0', '2018-07-20 09:36:11', '2018-07-24 15:14:54');
INSERT INTO `wancll_score_goods` VALUES ('2', '4', '[{\"spec_group_id_str\":\"4201a560b5d850a1f2fa922674981d99\",\"score\":\"99\",\"money\":0,\"spec_option_group\":\"黑色_60寸爆款4K\"},{\"spec_group_id_str\":\"5aa1986312dc29e79dd428e0e1530e58\",\"score\":\"99\",\"money\":0,\"spec_option_group\":\"银色_60寸爆款4K\"},{\"spec_group_id_str\":\"bae05d8d2bda242ab4579038dde5914e\",\"score\":\"99\",\"money\":0,\"spec_option_group\":\"黑色_50寸智能\"},{\"spec_group_id_str\":\"4c278694f0e1a64e8989e4fe4e25da2d\",\"score\":\"99\",\"money\":0,\"spec_option_group\":\"银色_50寸智能\"},{\"spec_group_id_str\":\"c00e9dfb99b228b9b31e01a6ed0cd1cf\",\"score\":\"99\",\"money\":0,\"spec_option_group\":\"黑色_45寸智能\"},{\"spec_group_id_str\":\"8f7ddcef8034b31b2d219ce556bdca1c\",\"score\":\"99\",\"money\":0,\"spec_option_group\":\"银色_45寸智能\"}]', '99.00', '0.00', '0', '1', '0', '2018-07-24 15:10:35', '2018-09-03 17:53:39');
INSERT INTO `wancll_score_goods` VALUES ('3', '2', '[{\"spec_group_id_str\":\"9a4f62329a021d6063e4389b4191549a\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"白色_S\"},{\"spec_group_id_str\":\"3ecaf83e4b58258b2708e71f5153c28f\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"黑色_S\"},{\"spec_group_id_str\":\"14e449c122e1a02ad9055d72892da421\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"灰色_S\"},{\"spec_group_id_str\":\"212009b774a03875900111b1556c6bbd\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"白色_M\"},{\"spec_group_id_str\":\"75e13ff2a062474ce87a9743b92ed529\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"黑色_M\"},{\"spec_group_id_str\":\"2a556c0b177054851a311b5b28bc0217\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"灰色_M\"},{\"spec_group_id_str\":\"086e8bcf7197f7a15e3f3ef580f48656\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"白色_L\"},{\"spec_group_id_str\":\"6ae4f8940ef3a0f87a7b0adfef09d243\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"黑色_L\"},{\"spec_group_id_str\":\"ebf7862a9bb6255ddad83eaed2ca94a8\",\"score\":\"10000\",\"money\":\"1\",\"spec_option_group\":\"灰色_L\"}]', '10000.00', '1.00', '0', '1', '0', '2018-07-24 15:11:03', '2018-09-03 17:53:44');
INSERT INTO `wancll_score_goods` VALUES ('4', '3', '[{\"spec_group_id_str\":\"1801aa94b8a08fa9a0c467a6e2fc262e\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"白色_450M\"},{\"spec_group_id_str\":\"c5b12e5f6771f8bc9ac5ff80e0c2e5f5\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"黑色_450M\"},{\"spec_group_id_str\":\"f500f38a228dfbe52d25a8c1c6064e91\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"灰色_450M\"},{\"spec_group_id_str\":\"3815dc5fa04ce193491b1488fb76fab5\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"白色_1200M\"},{\"spec_group_id_str\":\"145c9e89ca0df0ad71dc483ada7823ec\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"黑色_1200M\"},{\"spec_group_id_str\":\"1034ced74785d90772d982521c460e11\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"灰色_1200M\"},{\"spec_group_id_str\":\"27c40c8cd59b044215e67fe7f768d8ff\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"白色_全千兆\"},{\"spec_group_id_str\":\"bc7837c0c483711c873e748bf34373b2\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"黑色_全千兆\"},{\"spec_group_id_str\":\"fa8469b7c1889ab25fa4cfdae4cb3f43\",\"score\":\"999\",\"money\":\"10\",\"spec_option_group\":\"灰色_全千兆\"}]', '999.00', '10.00', '0', '1', '0', '2018-07-28 13:41:33', '2018-09-03 17:53:40');
INSERT INTO `wancll_score_goods` VALUES ('5', '5', '[{\"spec_group_id_str\":\"6115eedc743452f7cf13d8f0af09540f\",\"score\":\"5\",\"money\":0,\"spec_option_group\":\"红色\"},{\"spec_group_id_str\":\"aefef5355ad49bd95bf17ab9c94359e4\",\"score\":\"5\",\"money\":0,\"spec_option_group\":\"绿色\"},{\"spec_group_id_str\":\"4821f5db66d294a3d277e0448b2e49ad\",\"score\":\"5\",\"money\":0,\"spec_option_group\":\"蓝色\"}]', '5.00', '0.00', '0', '1', '0', '2018-08-24 14:07:26', '2018-09-03 17:53:42');
INSERT INTO `wancll_score_goods` VALUES ('6', '7', '[]', '1000.00', '0.00', '0', '1', '0', '2018-09-03 17:54:36', '2018-09-25 14:17:45');
INSERT INTO `wancll_score_goods` VALUES ('7', '8', '[{\"spec_group_id_str\":\"f90dd144f9cb24d244cc023e74eca12c\",\"score\":\"500\",\"money\":0,\"spec_option_group\":\"蓝色\"},{\"spec_group_id_str\":\"9d653df2bede1d864f703472454645f5\",\"score\":\"500\",\"money\":0,\"spec_option_group\":\"绿色\"},{\"spec_group_id_str\":\"99634f20d3ba922db5ab94e8fa002994\",\"score\":\"500\",\"money\":0,\"spec_option_group\":\"红色\"}]', '500.00', '0.00', '0', '1', '0', '2018-09-04 10:16:14', '2018-09-25 14:17:45');
INSERT INTO `wancll_score_goods` VALUES ('8', '17', '[{\"spec_group_id_str\":\"66e57ac537f93a9e95084a7bbea45149\",\"score\":\"20\",\"money\":0,\"spec_option_group\":\"测试\"}]', '20.00', '0.00', '2', '1', '0', '2018-09-26 17:12:22', '2018-09-27 15:09:32');
INSERT INTO `wancll_score_goods` VALUES ('9', '13', '[]', '50.00', '0.00', '0', '1', '0', '2018-09-26 17:12:33', '2018-10-06 17:02:50');
INSERT INTO `wancll_score_goods` VALUES ('10', '17', '[{\"spec_group_id_str\":\"d3c2d133ebafa4728ce2e183687f8c88\",\"score\":\"100\",\"money\":0,\"spec_option_group\":\"蓝色\"},{\"spec_group_id_str\":\"998041f8cd070e175798211441e9e873\",\"score\":\"100\",\"money\":0,\"spec_option_group\":\"绿色\"},{\"spec_group_id_str\":\"937e97058c09673ac45e8cba3b3a3302\",\"score\":\"100\",\"money\":0,\"spec_option_group\":\"红色\"}]', '50.00', '0.00', '0', '1', '0', '2018-09-27 15:14:25', '2018-10-06 17:02:48');
INSERT INTO `wancll_score_goods` VALUES ('11', '23', '[{\"spec_group_id_str\":\"17555d64b91c295bda96a7c5633e140b\",\"score\":\"2\",\"money\":0,\"spec_option_group\":\"绿色\"},{\"spec_group_id_str\":\"099aa793d0e0043f71f0380c4ecc9bf8\",\"score\":\"3\",\"money\":0,\"spec_option_group\":\"红色\"}]', '20.00', '0.00', '0', '1', '1', '2018-10-05 14:15:17', '2018-10-05 14:15:17');
INSERT INTO `wancll_score_goods` VALUES ('12', '21', '[{\"spec_group_id_str\":\"4f473b63ba2b0782749c89e25e83f744\",\"score\":\"105\",\"money\":0,\"spec_option_group\":\"橙色_S\"},{\"spec_group_id_str\":\"1c60d5cc528afc2c7085b0cb6ac78a76\",\"score\":\"100\",\"money\":0,\"spec_option_group\":\"橙色_M\"}]', '100.00', '0.00', '0', '1', '1', '2018-10-10 10:14:42', '2018-10-10 10:15:18');

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
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_score_logs`
-- -----------------------------
INSERT INTO `wancll_score_logs` VALUES ('1', '2', 'admin_recharge_score', '5000.00', '管理员充值积分', '管理员给会员充值积分, 充值时间2018-11-10 14:44:46', '1', '2018-11-10 14:44:46', '2018-11-10 14:44:46');
INSERT INTO `wancll_score_logs` VALUES ('2', '2', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 14:44:58', '1', '2018-11-10 14:44:58', '2018-11-10 14:44:58');
INSERT INTO `wancll_score_logs` VALUES ('3', '3', 'admin_recharge_score', '200.00', '管理员充值积分', '管理员给会员充值积分, 充值时间2018-11-10 15:04:43', '1', '2018-11-10 15:04:43', '2018-11-10 15:04:43');
INSERT INTO `wancll_score_logs` VALUES ('4', '3', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:05:52', '1', '2018-11-10 15:05:52', '2018-11-10 15:05:52');
INSERT INTO `wancll_score_logs` VALUES ('5', '3', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:05:52', '1', '2018-11-10 15:05:52', '2018-11-10 15:05:52');
INSERT INTO `wancll_score_logs` VALUES ('6', '2', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:25:42', '1', '2018-11-10 15:25:42', '2018-11-10 15:25:42');
INSERT INTO `wancll_score_logs` VALUES ('7', '2', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:27:32', '1', '2018-11-10 15:27:32', '2018-11-10 15:27:32');
INSERT INTO `wancll_score_logs` VALUES ('8', '2', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:27:33', '1', '2018-11-10 15:27:33', '2018-11-10 15:27:33');
INSERT INTO `wancll_score_logs` VALUES ('9', '1', 'admin_recharge_score', '10000000.00', '管理员充值积分', '管理员给会员充值积分, 充值时间2018-11-10 15:47:12', '1', '2018-11-10 15:47:12', '2018-11-10 15:47:12');
INSERT INTO `wancll_score_logs` VALUES ('10', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:47:14', '1', '2018-11-10 15:47:14', '2018-11-10 15:47:14');
INSERT INTO `wancll_score_logs` VALUES ('11', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:47:14', '1', '2018-11-10 15:47:14', '2018-11-10 15:47:14');
INSERT INTO `wancll_score_logs` VALUES ('12', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:47:15', '1', '2018-11-10 15:47:15', '2018-11-10 15:47:15');
INSERT INTO `wancll_score_logs` VALUES ('13', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:47:15', '1', '2018-11-10 15:47:15', '2018-11-10 15:47:15');
INSERT INTO `wancll_score_logs` VALUES ('14', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:47:15', '1', '2018-11-10 15:47:15', '2018-11-10 15:47:15');
INSERT INTO `wancll_score_logs` VALUES ('15', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:47:23', '1', '2018-11-10 15:47:23', '2018-11-10 15:47:23');
INSERT INTO `wancll_score_logs` VALUES ('16', '2', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:51:58', '1', '2018-11-10 15:51:58', '2018-11-10 15:51:58');
INSERT INTO `wancll_score_logs` VALUES ('17', '2', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:51:58', '1', '2018-11-10 15:51:58', '2018-11-10 15:51:58');
INSERT INTO `wancll_score_logs` VALUES ('18', '2', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 15:51:59', '1', '2018-11-10 15:51:59', '2018-11-10 15:51:59');
INSERT INTO `wancll_score_logs` VALUES ('19', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:51', '1', '2018-11-10 16:02:51', '2018-11-10 16:02:51');
INSERT INTO `wancll_score_logs` VALUES ('20', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:57', '1', '2018-11-10 16:02:57', '2018-11-10 16:02:57');
INSERT INTO `wancll_score_logs` VALUES ('21', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:57', '1', '2018-11-10 16:02:57', '2018-11-10 16:02:57');
INSERT INTO `wancll_score_logs` VALUES ('22', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:57', '1', '2018-11-10 16:02:57', '2018-11-10 16:02:57');
INSERT INTO `wancll_score_logs` VALUES ('23', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:58', '1', '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `wancll_score_logs` VALUES ('24', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:58', '1', '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `wancll_score_logs` VALUES ('25', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:58', '1', '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `wancll_score_logs` VALUES ('26', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:02:58', '1', '2018-11-10 16:02:58', '2018-11-10 16:02:58');
INSERT INTO `wancll_score_logs` VALUES ('27', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:47', '1', '2018-11-10 16:03:47', '2018-11-10 16:03:47');
INSERT INTO `wancll_score_logs` VALUES ('28', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:54', '1', '2018-11-10 16:03:54', '2018-11-10 16:03:54');
INSERT INTO `wancll_score_logs` VALUES ('29', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:54', '1', '2018-11-10 16:03:54', '2018-11-10 16:03:54');
INSERT INTO `wancll_score_logs` VALUES ('30', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:54', '1', '2018-11-10 16:03:54', '2018-11-10 16:03:54');
INSERT INTO `wancll_score_logs` VALUES ('31', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:55', '1', '2018-11-10 16:03:55', '2018-11-10 16:03:55');
INSERT INTO `wancll_score_logs` VALUES ('32', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:55', '1', '2018-11-10 16:03:55', '2018-11-10 16:03:55');
INSERT INTO `wancll_score_logs` VALUES ('33', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:55', '1', '2018-11-10 16:03:55', '2018-11-10 16:03:55');
INSERT INTO `wancll_score_logs` VALUES ('34', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:03:56', '1', '2018-11-10 16:03:56', '2018-11-10 16:03:56');
INSERT INTO `wancll_score_logs` VALUES ('35', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:04:49', '1', '2018-11-10 16:04:49', '2018-11-10 16:04:49');
INSERT INTO `wancll_score_logs` VALUES ('36', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:01', '1', '2018-11-10 16:05:01', '2018-11-10 16:05:01');
INSERT INTO `wancll_score_logs` VALUES ('37', '1', 'score_shop', '20.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:09', '1', '2018-11-10 16:05:09', '2018-11-10 16:05:09');
INSERT INTO `wancll_score_logs` VALUES ('38', '1', 'score_shop', '20.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:17', '1', '2018-11-10 16:05:17', '2018-11-10 16:05:17');
INSERT INTO `wancll_score_logs` VALUES ('39', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:44', '1', '2018-11-10 16:05:44', '2018-11-10 16:05:44');
INSERT INTO `wancll_score_logs` VALUES ('40', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:50', '1', '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `wancll_score_logs` VALUES ('41', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:50', '1', '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `wancll_score_logs` VALUES ('42', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:50', '1', '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `wancll_score_logs` VALUES ('43', '1', 'score_shop', '100.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:05:50', '1', '2018-11-10 16:05:50', '2018-11-10 16:05:50');
INSERT INTO `wancll_score_logs` VALUES ('44', '1', 'score_shop', '20.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:07:45', '1', '2018-11-10 16:07:45', '2018-11-10 16:07:45');
INSERT INTO `wancll_score_logs` VALUES ('45', '1', 'score_shop', '20.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:07:53', '1', '2018-11-10 16:07:53', '2018-11-10 16:07:53');
INSERT INTO `wancll_score_logs` VALUES ('46', '1', 'score_shop', '20.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:08:12', '1', '2018-11-10 16:08:12', '2018-11-10 16:08:12');
INSERT INTO `wancll_score_logs` VALUES ('47', '1', 'score_shop', '20.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:14:13', '1', '2018-11-10 16:14:13', '2018-11-10 16:14:13');
INSERT INTO `wancll_score_logs` VALUES ('48', '1', 'score_shop', '20.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:14:13', '1', '2018-11-10 16:14:13', '2018-11-10 16:14:13');
INSERT INTO `wancll_score_logs` VALUES ('49', '1', 'score_shop', '20.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:14:13', '1', '2018-11-10 16:14:13', '2018-11-10 16:14:13');
INSERT INTO `wancll_score_logs` VALUES ('50', '1', 'score_shop', '20.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:18:08', '1', '2018-11-10 16:18:08', '2018-11-10 16:18:08');
INSERT INTO `wancll_score_logs` VALUES ('51', '1', 'score_shop', '20.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:18:20', '1', '2018-11-10 16:18:20', '2018-11-10 16:18:20');
INSERT INTO `wancll_score_logs` VALUES ('52', '1', 'score_shop', '20.00', '积分兑换', '积分兑换商品，购物时间2018-11-10 16:18:44', '1', '2018-11-10 16:18:44', '2018-11-10 16:18:44');
INSERT INTO `wancll_score_logs` VALUES ('53', '3', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-11-10 16:39:12', '1', '2018-11-10 16:39:12', '2018-11-10 16:39:12');
INSERT INTO `wancll_score_logs` VALUES ('54', '4', 'admin_recharge_score', '1000000.00', '管理员充值积分', '管理员给会员充值积分, 充值时间2018-11-10 16:39:55', '1', '2018-11-10 16:39:55', '2018-11-10 16:39:55');
INSERT INTO `wancll_score_logs` VALUES ('55', '4', 'sign_in', '1.00', '会员签到', '会员签到，签到时间2018-11-10 16:40:00', '1', '2018-11-10 16:40:00', '2018-11-10 16:40:00');
INSERT INTO `wancll_score_logs` VALUES ('56', '7', 'shop', '90.30', '会员完成购物', '会员完成购物，购物时间2018-11-10 18:40:45', '1', '2018-11-10 18:40:45', '2018-11-10 18:40:45');
INSERT INTO `wancll_score_logs` VALUES ('57', '7', 'shop', '90.30', '会员完成购物', '会员完成购物，购物时间2018-11-10 18:40:49', '1', '2018-11-10 18:40:49', '2018-11-10 18:40:49');
INSERT INTO `wancll_score_logs` VALUES ('58', '8', 'shop', '1000.00', '会员完成购物', '会员完成购物，购物时间2018-11-12 11:22:37', '1', '2018-11-12 11:22:37', '2018-11-12 11:22:37');
INSERT INTO `wancll_score_logs` VALUES ('59', '9', 'admin_recharge_score', '2000.00', '管理员充值积分', '管理员给会员充值积分, 充值时间2018-11-12 13:42:32', '1', '2018-11-12 13:42:32', '2018-11-12 13:42:32');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_spec_templates`
-- -----------------------------
INSERT INTO `wancll_spec_templates` VALUES ('1', '衣服规格', '', '[{\"name\":\"颜色\",\"options\":[\"白色\",\"黑色\",\"灰色\"]},{\"name\":\"尺寸\",\"options\":[\"S\",\"M\",\"L\"]}]', '0', '1', '2018-07-24 10:47:19', '2018-07-24 10:47:19');
INSERT INTO `wancll_spec_templates` VALUES ('2', '颜色尺寸', '', '[{\"name\":\"颜色\",\"options\":[\"红色\",\"绿色\",\"蓝色\"]}]', '0', '1', '2018-07-28 11:47:50', '2018-07-28 11:47:50');
INSERT INTO `wancll_spec_templates` VALUES ('3', '尺寸', '尺寸', '[{\"name\":\"长度\",\"options\":[\"小于50cm\",\"大于50cm\"]}]', '0', '0', '2018-08-24 08:04:42', '2018-09-26 14:06:59');
INSERT INTO `wancll_spec_templates` VALUES ('4', '1', '1', '[{\"name\":\"1\",\"options\":[\"1\"]}]', '0', '0', '2018-09-10 10:10:20', '2018-09-10 10:10:33');
INSERT INTO `wancll_spec_templates` VALUES ('5', '2', '2', '[{\"name\":\"2\",\"options\":[\"2\"]}]', '0', '0', '2018-09-10 10:10:25', '2018-09-10 10:10:33');
INSERT INTO `wancll_spec_templates` VALUES ('6', '测试规格', '测试规范', '[{\"name\":\"测试\",\"options\":[\"测试\"]}]', '0', '0', '2018-09-26 17:04:59', '2018-09-26 17:22:35');

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
INSERT INTO `wancll_timed_tasks` VALUES ('1', '自动取消订单', '每天检测一次，对下订单满规定天数仍未支付的订单，系统自动取消该订单。', 'day', '1', 'CancelOrders', '2018-09-27 00:00:00', '0', '5bab56b7753e5', '2', '1', '2018-07-19 22:07:21', '2018-09-26 17:51:51');
INSERT INTO `wancll_timed_tasks` VALUES ('2', '自动删除订单', '每天检测一次，对已取消的订单满规定天数后，系统自动删除该订单。', 'day', '1', 'DeleteOrders', '2018-09-27 00:00:00', '0', '5bab56b774c97', '2', '1', '2018-07-19 22:11:59', '2018-09-26 17:51:51');
INSERT INTO `wancll_timed_tasks` VALUES ('3', '自动签收订单', '每天检测一次，对已发货的订单满规定天数会员仍未进行签收的订单，系统自动签收该订单。', 'day', '1', 'SignOrders', '2018-09-27 00:00:00', '0', '5bab56b774559', '2', '1', '2018-07-19 22:14:49', '2018-09-26 17:51:51');
INSERT INTO `wancll_timed_tasks` VALUES ('4', '团购处理时限', '对已到结束时间，仍未完成的拼团的订单，自动结束该团。', 'minute', '1', 'GroupBuyTimeLimits', '2018-09-27 10:45:00', '0', '5bab56b773e09', '2', '1', '2018-07-19 22:26:17', '2018-09-26 17:51:51');
INSERT INTO `wancll_timed_tasks` VALUES ('5', '团购自动退款', '每天检测一次，对团购中未完成拼团的订单，自动退款。', 'day', '1', 'GroupBuyReturnMoney', '2018-09-27 08:00:00', '0', '5bab56b77307e', '2', '1', '2018-07-19 22:33:04', '2018-09-26 17:51:51');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_accounts`
-- -----------------------------
INSERT INTO `wancll_user_accounts` VALUES ('1', '18888888888', 'e6297b585db794e177808f8953b46669', 'e6297b585db794e177808f8953b46669', '', 'ol1SowgRCWMtOwePHU58X-dbPFTs', '1', '1', '2018-11-10 09:28:14', '2018-11-10 15:58:44');
INSERT INTO `wancll_user_accounts` VALUES ('2', '15071357527', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '2', '1', '2018-11-10 13:43:52', '2018-11-10 15:10:02');
INSERT INTO `wancll_user_accounts` VALUES ('3', '15071350005', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '3', '1', '2018-11-10 15:04:28', '2018-11-10 15:07:17');
INSERT INTO `wancll_user_accounts` VALUES ('4', '13874930708', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', 'ol1Sowr-jXVXF5j0mqe9d6wgOni4', '4', '1', '2018-11-10 15:06:37', '2018-11-10 16:40:41');
INSERT INTO `wancll_user_accounts` VALUES ('5', '15071350006', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '5', '1', '2018-11-10 16:00:30', '2018-11-10 16:00:43');
INSERT INTO `wancll_user_accounts` VALUES ('6', '15200597371', 'b5305e8c4c5e08c246943fe736701525', '', '', '', '6', '1', '2018-11-10 16:42:53', '2018-11-10 16:42:53');
INSERT INTO `wancll_user_accounts` VALUES ('7', '15675143940', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '7', '1', '2018-11-10 17:38:14', '2018-11-10 18:39:42');
INSERT INTO `wancll_user_accounts` VALUES ('8', '18175974828', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '8', '1', '2018-11-12 11:17:55', '2018-11-12 11:18:13');
INSERT INTO `wancll_user_accounts` VALUES ('9', '15071357528', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '9', '1', '2018-11-12 12:45:53', '2018-11-12 12:46:07');
INSERT INTO `wancll_user_accounts` VALUES ('10', '15580841403', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '10', '1', '2018-11-12 14:27:08', '2018-11-12 14:27:19');
INSERT INTO `wancll_user_accounts` VALUES ('11', '17712345678', 'b5305e8c4c5e08c246943fe736701525', '', '', 'ol1SowgrO0TswBMCU8CgFchbkLlA', '11', '1', '2018-11-12 15:08:12', '2018-11-12 15:08:12');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_apply_distributor`
-- -----------------------------
INSERT INTO `wancll_user_apply_distributor` VALUES ('1', '2', '', '', '2018-11-10 14:57:20', '1', '2018-11-10 14:57:27', '3', '1', '2018-11-10 14:57:20', '2018-11-10 14:57:27');
INSERT INTO `wancll_user_apply_distributor` VALUES ('2', '1', '', '', '2018-11-10 15:52:45', '1', '2018-11-10 15:52:53', '3', '1', '2018-11-10 15:52:45', '2018-11-10 15:52:53');

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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_asset_logs`
-- -----------------------------
INSERT INTO `wancll_user_asset_logs` VALUES ('1', '1', 'money', 'user_money_recharge', '12342355.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-11-10 09:28:42', '2018-11-10 09:28:42');
INSERT INTO `wancll_user_asset_logs` VALUES ('2', '2', 'money', 'user_money_recharge', '5000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-11-10 14:44:55', '2018-11-10 14:44:55');
INSERT INTO `wancll_user_asset_logs` VALUES ('3', '3', 'money', 'user_money_recharge', '20000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-11-10 15:04:38', '2018-11-10 15:04:38');
INSERT INTO `wancll_user_asset_logs` VALUES ('4', '3', 'money', 'user_pay', '129.00', '购物支付【N2018111015072359604】', '会员购物扣款，订单号：N2018111015072359604', '1', '2018-11-10 15:07:34', '2018-11-10 15:07:34');
INSERT INTO `wancll_user_asset_logs` VALUES ('5', '2', 'money', 'user_pay', '860.00', '购物支付【N2018111015094750069】', '会员购物扣款，订单号：N2018111015094750069', '1', '2018-11-10 15:10:18', '2018-11-10 15:10:18');
INSERT INTO `wancll_user_asset_logs` VALUES ('6', '2', 'money', 'user_money_recharge', '0.01', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-11-10 15:19:55', '2018-11-10 15:19:55');
INSERT INTO `wancll_user_asset_logs` VALUES ('7', '2', 'money', 'user_pay', '10.00', '购物支付【N2018111015260494969】', '会员购物扣款，订单号：N2018111015260494969', '1', '2018-11-10 15:26:17', '2018-11-10 15:26:17');
INSERT INTO `wancll_user_asset_logs` VALUES ('8', '2', 'money', 'user_money_recharge', '0.01', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-11-10 15:33:13', '2018-11-10 15:33:13');
INSERT INTO `wancll_user_asset_logs` VALUES ('9', '1', 'money', 'user_money_recharge', '0.01', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-11-10 15:49:49', '2018-11-10 15:49:49');
INSERT INTO `wancll_user_asset_logs` VALUES ('10', '2', 'money', 'user_money_recharge', '0.01', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-11-10 15:50:23', '2018-11-10 15:50:23');
INSERT INTO `wancll_user_asset_logs` VALUES ('11', '2', 'money', 'user_money_recharge', '0.01', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-11-10 15:59:07', '2018-11-10 15:59:07');
INSERT INTO `wancll_user_asset_logs` VALUES ('12', '4', 'money', 'user_money_recharge', '1000000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-11-10 16:39:50', '2018-11-10 16:39:50');
INSERT INTO `wancll_user_asset_logs` VALUES ('13', '7', 'money', 'user_money_recharge', '1000000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-11-10 18:38:59', '2018-11-10 18:38:59');
INSERT INTO `wancll_user_asset_logs` VALUES ('14', '7', 'money', 'user_pay', '129.00', '购物支付【N2018111018395033027】', '会员购物扣款，订单号：N2018111018395033027', '1', '2018-11-10 18:39:57', '2018-11-10 18:39:57');
INSERT INTO `wancll_user_asset_logs` VALUES ('15', '7', 'money', 'user_pay', '129.00', '购物支付【N2018111018392565960】', '会员购物扣款，订单号：N2018111018392565960', '1', '2018-11-10 18:40:06', '2018-11-10 18:40:06');
INSERT INTO `wancll_user_asset_logs` VALUES ('16', '2', 'money', 'user_pay', '20.00', '购物支付【N2018111209240631039】', '会员购物扣款，订单号：N2018111209240631039', '1', '2018-11-12 09:24:16', '2018-11-12 09:24:16');
INSERT INTO `wancll_user_asset_logs` VALUES ('17', '8', 'money', 'user_money_recharge', '100000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-11-12 11:19:01', '2018-11-12 11:19:01');
INSERT INTO `wancll_user_asset_logs` VALUES ('18', '8', 'money', 'user_pay', '542.00', '购物支付【N2018111211203530483】', '会员购物扣款，订单号：N2018111211203530483', '1', '2018-11-12 11:21:02', '2018-11-12 11:21:02');
INSERT INTO `wancll_user_asset_logs` VALUES ('19', '9', 'money', 'user_money_recharge', '2000.00', '管理员充值', '管理员在后台给会员进行充值', '1', '2018-11-12 13:42:24', '2018-11-12 13:42:24');
INSERT INTO `wancll_user_asset_logs` VALUES ('20', '9', 'money', 'user_pay', '225.00', '购物支付【N2018111213463151961】', '会员购物扣款，订单号：N2018111213463151961', '1', '2018-11-12 13:46:42', '2018-11-12 13:46:42');
INSERT INTO `wancll_user_asset_logs` VALUES ('21', '9', 'money', 'user_pay', '225.00', '购物支付【N2018111214484555517】', '会员购物扣款，订单号：N2018111214484555517', '1', '2018-11-12 14:48:46', '2018-11-12 14:48:46');
INSERT INTO `wancll_user_asset_logs` VALUES ('22', '9', 'money', 'user_pay', '225.00', '购物支付【N2018111214492293059】', '会员购物扣款，订单号：N2018111214492293059', '1', '2018-11-12 14:49:22', '2018-11-12 14:49:22');
INSERT INTO `wancll_user_asset_logs` VALUES ('23', '9', 'money', 'user_pay', '225.00', '购物支付【N2018111215504169401】', '会员购物扣款，订单号：N2018111215504169401', '1', '2018-11-12 15:50:41', '2018-11-12 15:50:41');
INSERT INTO `wancll_user_asset_logs` VALUES ('24', '9', 'money', 'user_pay', '225.00', '购物支付【N2018111215505088666】', '会员购物扣款，订单号：N2018111215505088666', '1', '2018-11-12 15:50:51', '2018-11-12 15:50:51');
INSERT INTO `wancll_user_asset_logs` VALUES ('25', '9', 'money', 'user_pay', '225.00', '购物支付【N2018111215505860048】', '会员购物扣款，订单号：N2018111215505860048', '1', '2018-11-12 15:50:58', '2018-11-12 15:50:58');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_assets`
-- -----------------------------
INSERT INTO `wancll_user_assets` VALUES ('1', '1', '12342355.01', '9996880.00', '1', '2018-11-10 09:28:14', '2018-11-10 09:28:14');
INSERT INTO `wancll_user_assets` VALUES ('2', '2', '4110.04', '4300.00', '1', '2018-11-10 13:43:52', '2018-11-10 13:43:52');
INSERT INTO `wancll_user_assets` VALUES ('3', '3', '19871.00', '1.00', '1', '2018-11-10 15:04:28', '2018-11-10 15:04:28');
INSERT INTO `wancll_user_assets` VALUES ('4', '4', '1000000.00', '1000001.00', '1', '2018-11-10 15:06:37', '2018-11-10 15:06:37');
INSERT INTO `wancll_user_assets` VALUES ('5', '5', '0.00', '0.00', '1', '2018-11-10 16:00:30', '2018-11-10 16:00:30');
INSERT INTO `wancll_user_assets` VALUES ('6', '6', '0.00', '0.00', '1', '2018-11-10 16:42:53', '2018-11-10 16:42:53');
INSERT INTO `wancll_user_assets` VALUES ('7', '7', '999742.00', '258.00', '1', '2018-11-10 17:38:14', '2018-11-10 17:38:14');
INSERT INTO `wancll_user_assets` VALUES ('8', '8', '99458.00', '1000.00', '1', '2018-11-12 11:17:55', '2018-11-12 11:17:55');
INSERT INTO `wancll_user_assets` VALUES ('9', '9', '650.00', '2000.00', '1', '2018-11-12 12:45:53', '2018-11-12 12:45:53');
INSERT INTO `wancll_user_assets` VALUES ('10', '10', '0.00', '0.00', '1', '2018-11-12 14:27:08', '2018-11-12 14:27:08');
INSERT INTO `wancll_user_assets` VALUES ('11', '11', '0.00', '0.00', '1', '2018-11-12 15:08:12', '2018-11-12 15:08:12');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_discounts`
-- -----------------------------
INSERT INTO `wancll_user_discounts` VALUES ('1', '2', '4', '1', '1', '2018-11-10 14:43:25', '2018-11-10 14:43:25');
INSERT INTO `wancll_user_discounts` VALUES ('2', '2', '4', '1', '1', '2018-11-10 14:43:25', '2018-11-10 14:43:25');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
INSERT INTO `wancll_user_goods_keywords` VALUES ('1', '[\"Gkkjh\"]', '1', '2018-11-10 10:14:53', '2018-11-10 10:14:53');
INSERT INTO `wancll_user_goods_keywords` VALUES ('2', '[\"女式\",\"衣服\",\"男式\",\"手机\"]', '1', '2018-11-10 16:11:59', '2018-11-12 16:02:03');
INSERT INTO `wancll_user_goods_keywords` VALUES ('7', '[\"衣服\"]', '1', '2018-11-10 17:38:51', '2018-11-10 17:44:50');
INSERT INTO `wancll_user_goods_keywords` VALUES ('8', '[\"啊啊啊\"]', '1', '2018-11-12 11:19:33', '2018-11-12 11:19:33');

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
INSERT INTO `wancll_user_info` VALUES ('1', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-11-10 09:28:14', '2018-11-10 09:28:14');
INSERT INTO `wancll_user_info` VALUES ('2', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-11-10 13:43:52', '2018-11-10 13:43:52');
INSERT INTO `wancll_user_info` VALUES ('3', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-11-10 15:04:28', '2018-11-10 15:04:28');
INSERT INTO `wancll_user_info` VALUES ('4', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-11-10 15:06:37', '2018-11-10 15:06:37');
INSERT INTO `wancll_user_info` VALUES ('5', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-11-10 16:00:30', '2018-11-10 16:00:30');
INSERT INTO `wancll_user_info` VALUES ('6', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-11-10 16:42:53', '2018-11-10 16:42:53');
INSERT INTO `wancll_user_info` VALUES ('7', '2', '258.00', '[22]', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-11-10 17:38:14', '2018-11-10 18:40:49');
INSERT INTO `wancll_user_info` VALUES ('8', '1', '542.00', '[23]', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-11-12 11:17:55', '2018-11-12 11:22:37');
INSERT INTO `wancll_user_info` VALUES ('9', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-11-12 12:45:53', '2018-11-12 12:45:53');
INSERT INTO `wancll_user_info` VALUES ('10', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-11-12 14:27:08', '2018-11-12 14:27:08');
INSERT INTO `wancll_user_info` VALUES ('11', '0', '0.00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '2018-11-12 15:08:12', '2018-11-12 15:08:12');

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
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_recharges`
-- -----------------------------
INSERT INTO `wancll_user_recharges` VALUES ('1', '1', 'R2018111009284203329', 'money', '9', '12342355.00', '1', '9', '2018-11-10 09:28:42', '3', '1', '2018-11-10 09:28:42', '2018-11-10 09:28:42');
INSERT INTO `wancll_user_recharges` VALUES ('2', '2', 'R2018111014445512269', 'money', '9', '5000.00', '1', '9', '2018-11-10 14:44:55', '3', '1', '2018-11-10 14:44:55', '2018-11-10 14:44:55');
INSERT INTO `wancll_user_recharges` VALUES ('3', '3', 'R2018111015043803857', 'money', '9', '20000.00', '1', '9', '2018-11-10 15:04:38', '3', '1', '2018-11-10 15:04:38', '2018-11-10 15:04:38');
INSERT INTO `wancll_user_recharges` VALUES ('4', '2', 'R2018111015194756753', 'money', '1', '0.01', '1', '2', '2018-11-10 15:19:55', '3', '1', '2018-11-10 15:19:47', '2018-11-10 15:19:55');
INSERT INTO `wancll_user_recharges` VALUES ('5', '2', 'R2018111015232646522', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 15:23:26', '2018-11-10 15:23:26');
INSERT INTO `wancll_user_recharges` VALUES ('6', '2', 'R2018111015330527246', 'money', '1', '0.01', '1', '2', '2018-11-10 15:33:13', '3', '1', '2018-11-10 15:33:05', '2018-11-10 15:33:13');
INSERT INTO `wancll_user_recharges` VALUES ('7', '1', 'R2018111015401627125', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 15:40:16', '2018-11-10 15:40:16');
INSERT INTO `wancll_user_recharges` VALUES ('8', '2', 'R2018111015402465417', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 15:40:24', '2018-11-10 15:40:24');
INSERT INTO `wancll_user_recharges` VALUES ('9', '1', 'R2018111015490900137', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 15:49:09', '2018-11-10 15:49:09');
INSERT INTO `wancll_user_recharges` VALUES ('10', '1', 'R2018111015493846558', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 15:49:38', '2018-11-10 15:49:38');
INSERT INTO `wancll_user_recharges` VALUES ('11', '1', 'R2018111015494319813', 'money', '1', '0.01', '1', '1', '2018-11-10 15:49:49', '3', '1', '2018-11-10 15:49:43', '2018-11-10 15:49:49');
INSERT INTO `wancll_user_recharges` VALUES ('12', '2', 'R2018111015501538396', 'money', '1', '0.01', '1', '1', '2018-11-10 15:50:23', '3', '1', '2018-11-10 15:50:15', '2018-11-10 15:50:23');
INSERT INTO `wancll_user_recharges` VALUES ('13', '1', 'R2018111015585378997', 'money', '1', '1.00', '0', '', '', '1', '1', '2018-11-10 15:58:53', '2018-11-10 15:58:53');
INSERT INTO `wancll_user_recharges` VALUES ('14', '2', 'R2018111015585794539', 'money', '1', '0.01', '1', '2', '2018-11-10 15:59:07', '3', '1', '2018-11-10 15:58:57', '2018-11-10 15:59:07');
INSERT INTO `wancll_user_recharges` VALUES ('15', '1', 'R2018111016012673998', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:01:26', '2018-11-10 16:01:26');
INSERT INTO `wancll_user_recharges` VALUES ('16', '1', 'R2018111016241079779', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:24:10', '2018-11-10 16:24:10');
INSERT INTO `wancll_user_recharges` VALUES ('17', '1', 'R2018111016242896135', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:24:28', '2018-11-10 16:24:28');
INSERT INTO `wancll_user_recharges` VALUES ('18', '1', 'R2018111016251238702', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:25:12', '2018-11-10 16:25:12');
INSERT INTO `wancll_user_recharges` VALUES ('19', '1', 'R2018111016340192372', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:34:01', '2018-11-10 16:34:01');
INSERT INTO `wancll_user_recharges` VALUES ('20', '1', 'R2018111016345967343', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:34:59', '2018-11-10 16:34:59');
INSERT INTO `wancll_user_recharges` VALUES ('21', '1', 'R2018111016365976013', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:36:59', '2018-11-10 16:36:59');
INSERT INTO `wancll_user_recharges` VALUES ('22', '4', 'R2018111016395085008', 'money', '9', '1000000.00', '1', '9', '2018-11-10 16:39:50', '3', '1', '2018-11-10 16:39:50', '2018-11-10 16:39:50');
INSERT INTO `wancll_user_recharges` VALUES ('23', '1', 'R2018111016424211069', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:42:42', '2018-11-10 16:42:42');
INSERT INTO `wancll_user_recharges` VALUES ('24', '1', 'R2018111016441870481', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:44:18', '2018-11-10 16:44:18');
INSERT INTO `wancll_user_recharges` VALUES ('25', '1', 'R2018111016472580858', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:47:25', '2018-11-10 16:47:25');
INSERT INTO `wancll_user_recharges` VALUES ('26', '1', 'R2018111016484302429', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:48:43', '2018-11-10 16:48:43');
INSERT INTO `wancll_user_recharges` VALUES ('27', '1', 'R2018111016572536089', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:57:25', '2018-11-10 16:57:25');
INSERT INTO `wancll_user_recharges` VALUES ('28', '1', 'R2018111016573087533', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:57:30', '2018-11-10 16:57:30');
INSERT INTO `wancll_user_recharges` VALUES ('29', '1', 'R2018111016573107797', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:57:31', '2018-11-10 16:57:31');
INSERT INTO `wancll_user_recharges` VALUES ('30', '1', 'R2018111016573302561', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 16:57:33', '2018-11-10 16:57:33');
INSERT INTO `wancll_user_recharges` VALUES ('31', '1', 'R2018111017002581263', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:00:25', '2018-11-10 17:00:25');
INSERT INTO `wancll_user_recharges` VALUES ('32', '1', 'R2018111017041947235', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:04:19', '2018-11-10 17:04:19');
INSERT INTO `wancll_user_recharges` VALUES ('33', '1', 'R2018111017064662927', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:06:46', '2018-11-10 17:06:46');
INSERT INTO `wancll_user_recharges` VALUES ('34', '1', 'R2018111017331544134', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:33:15', '2018-11-10 17:33:15');
INSERT INTO `wancll_user_recharges` VALUES ('35', '1', 'R2018111017332426902', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:33:24', '2018-11-10 17:33:24');
INSERT INTO `wancll_user_recharges` VALUES ('36', '1', 'R2018111017405696898', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:40:56', '2018-11-10 17:40:56');
INSERT INTO `wancll_user_recharges` VALUES ('37', '1', 'R2018111017412066655', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:41:20', '2018-11-10 17:41:20');
INSERT INTO `wancll_user_recharges` VALUES ('38', '1', 'R2018111017415026881', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:41:50', '2018-11-10 17:41:50');
INSERT INTO `wancll_user_recharges` VALUES ('39', '1', 'R2018111017474887328', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:47:48', '2018-11-10 17:47:48');
INSERT INTO `wancll_user_recharges` VALUES ('40', '1', 'R2018111017480442107', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:48:04', '2018-11-10 17:48:04');
INSERT INTO `wancll_user_recharges` VALUES ('41', '1', 'R2018111017480966749', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:48:09', '2018-11-10 17:48:09');
INSERT INTO `wancll_user_recharges` VALUES ('42', '1', 'R2018111017494252423', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:49:42', '2018-11-10 17:49:42');
INSERT INTO `wancll_user_recharges` VALUES ('43', '1', 'R2018111017513998687', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:51:39', '2018-11-10 17:51:39');
INSERT INTO `wancll_user_recharges` VALUES ('44', '1', 'R2018111017595367246', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 17:59:53', '2018-11-10 17:59:53');
INSERT INTO `wancll_user_recharges` VALUES ('45', '1', 'R2018111018030321686', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 18:03:03', '2018-11-10 18:03:03');
INSERT INTO `wancll_user_recharges` VALUES ('46', '1', 'R2018111018121339027', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-10 18:12:13', '2018-11-10 18:12:13');
INSERT INTO `wancll_user_recharges` VALUES ('47', '7', 'R2018111018385966199', 'money', '9', '1000000.00', '1', '9', '2018-11-10 18:38:59', '3', '1', '2018-11-10 18:38:59', '2018-11-10 18:38:59');
INSERT INTO `wancll_user_recharges` VALUES ('48', '1', 'R2018111111351406496', 'money', '1', '0.01', '0', '', '', '1', '1', '2018-11-11 11:35:14', '2018-11-11 11:35:14');
INSERT INTO `wancll_user_recharges` VALUES ('49', '8', 'R2018111211190158277', 'money', '9', '100000.00', '1', '9', '2018-11-12 11:19:01', '3', '1', '2018-11-12 11:19:01', '2018-11-12 11:19:01');
INSERT INTO `wancll_user_recharges` VALUES ('50', '9', 'R2018111213422441133', 'money', '9', '2000.00', '1', '9', '2018-11-12 13:42:24', '3', '1', '2018-11-12 13:42:24', '2018-11-12 13:42:24');

-- -----------------------------
-- Table structure for `wancll_user_third_accounts`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_user_third_accounts`;
CREATE TABLE `wancll_user_third_accounts` (
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_third_accounts`
-- -----------------------------
INSERT INTO `wancll_user_third_accounts` VALUES ('1', '1', 'user', 'wechat', 'wechat', 'openid', 'oNGLot9r0rsf4gvYC4K0o8RHkhFY', '1', '2018-11-10 15:58:44', '2018-11-10 15:58:44');
INSERT INTO `wancll_user_third_accounts` VALUES ('2', '11', 'user', 'applet', 'wechat', 'openid', 'oPYxV4_J5UyPR16xJjmz5oZNdC3I', '1', '2018-11-12 15:08:12', '2018-11-12 15:08:12');

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
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_tokens`
-- -----------------------------
INSERT INTO `wancll_user_tokens` VALUES ('1', '1', '1', 'wap', 'user&wap@9a19ae1625fcabe2545c880316081f20', 'user&wap@4f885cf7a725f13f42d3fb6c5a955c49', '7200', '1', '2018-11-09 09:28:14', '2018-11-10 09:28:14');
INSERT INTO `wancll_user_tokens` VALUES ('2', '1', '1', 'wechat', 'user&wechat@cffcdf8f61add554a249887fded8da37', 'user&wechat@ce96660fe8b5e211aa98f4695d1eed59', '7200', '1', '2018-11-10 09:58:03', '2018-11-10 15:58:32');
INSERT INTO `wancll_user_tokens` VALUES ('3', '1', '1', 'applet', 'user&applet@7667b82384edcba19f6739a32aeb8c1f', 'user&applet@4a90b712d066ea13dcb35aacb50fe0e8', '0', '1', '2018-11-10 09:59:11', '2018-11-10 09:59:11');
INSERT INTO `wancll_user_tokens` VALUES ('4', '1', '1', 'app', 'user&app@90c2f510584a06302ce5a75d2aab9faf', 'user&app@ec8cc6538a9a6a958878748eb7c234e9', '0', '1', '2018-11-10 10:07:20', '2018-11-10 10:07:20');
INSERT INTO `wancll_user_tokens` VALUES ('5', '1', '1', 'applet', 'user&applet@ab839b42a7351377131a84e8b437cff2', 'user&applet@c91a8abe58b92248e362afe2557e2c36', '0', '1', '2018-11-10 10:08:19', '2018-11-10 10:08:19');
INSERT INTO `wancll_user_tokens` VALUES ('6', '2', '2', 'app', 'user&app@d534125717637c389c321d19b42e751a', 'user&app@7fe5de4ee0b081e7555722e9330b5e02', '0', '1', '2018-11-10 13:43:52', '2018-11-10 13:43:52');
INSERT INTO `wancll_user_tokens` VALUES ('7', '2', '2', 'app', 'user&app@9e0634e9546ed890519d78a1cf97ef5e', 'user&app@bb947b607c32219cfdb282ac6a3ffb49', '0', '1', '2018-11-10 13:45:54', '2018-11-10 13:45:54');
INSERT INTO `wancll_user_tokens` VALUES ('8', '2', '2', 'app', 'user&app@c77956cd2252f645ad20dc830d99a6bc', 'user&app@34d686d1c69cecef97589f7a98d5dde1', '0', '1', '2018-11-10 14:40:53', '2018-11-10 14:40:53');
INSERT INTO `wancll_user_tokens` VALUES ('9', '2', '2', 'wechat', 'user&wechat@a1b3eb147504215a9feb7d3336cbbbda', 'user&wechat@c7b8e10cd8c8992ca19e6ac18f9d5b7f', '7200', '1', '2018-11-10 14:56:16', '2018-11-10 14:56:16');
INSERT INTO `wancll_user_tokens` VALUES ('10', '2', '2', 'app', 'user&app@b97cf12e6bda93bbab008519dbac88c4', 'user&app@f25b2df8203de80761c1ce2a104b0eb5', '0', '1', '2018-11-10 14:58:02', '2018-11-10 14:58:02');
INSERT INTO `wancll_user_tokens` VALUES ('11', '2', '2', 'applet', 'user&applet@775ce1fbbb5d4182b2151e0aa032f978', 'user&applet@123af483ad7be044e31dfd6fa1104ba8', '0', '1', '2018-11-10 15:00:29', '2018-11-10 15:00:29');
INSERT INTO `wancll_user_tokens` VALUES ('12', '3', '3', 'app', 'user&app@ba155bbe4effcb133e8b7d64cf7137ba', 'user&app@98045413f80d02ebd338cc80dae7a383', '0', '1', '2018-11-10 15:04:28', '2018-11-10 15:04:28');
INSERT INTO `wancll_user_tokens` VALUES ('13', '4', '4', 'wap', 'user&wap@08219e6017a5a747dcbe31859cf9ac33', 'user&wap@ec0a1d8fade110260227d3b20e95417a', '7200', '1', '2018-11-10 15:06:37', '2018-11-10 15:06:37');
INSERT INTO `wancll_user_tokens` VALUES ('14', '2', '2', 'wechat', 'user&wechat@f3d9ce0d23d211fb11eaf95c50eb2e0c', 'user&wechat@76c2721211b1dece573289fb64c003fe', '7200', '1', '2018-11-10 15:09:09', '2018-11-10 15:09:09');
INSERT INTO `wancll_user_tokens` VALUES ('15', '2', '2', 'applet', 'user&applet@24aa629f79d2a7dabf590070c915e37e', 'user&applet@57bf73c33d9f3efef6a9276a24094b32', '0', '1', '2018-11-10 15:11:43', '2018-11-10 15:11:43');
INSERT INTO `wancll_user_tokens` VALUES ('16', '2', '2', 'applet', 'user&applet@a15885f697dd1e1be29362651638b38d', 'user&applet@56b2abdd93e3135fefef4b56c52c2711', '0', '1', '2018-11-10 15:38:51', '2018-11-10 15:38:51');
INSERT INTO `wancll_user_tokens` VALUES ('17', '2', '2', 'applet', 'user&applet@ba90860d95d240d4bb04f2580274b3cf', 'user&applet@97d63f5a13a6c98fd5a1b35cf447b0ab', '0', '1', '2018-11-10 15:55:44', '2018-11-10 15:55:44');
INSERT INTO `wancll_user_tokens` VALUES ('18', '1', '1', 'wechat', 'user&wechat@f06e5a0287923470676eba4ca12e03d4', 'user&wechat@d24ae3ee4d1aa2c67c942872294acec3', '7200', '1', '2018-11-10 15:58:47', '2018-11-10 15:58:47');
INSERT INTO `wancll_user_tokens` VALUES ('19', '1', '1', 'wechat', 'user&wechat@7e1df311a3e0f2f158d628951e7367f5', 'user&wechat@f9971d672b37785f4228092b5bdc21b6', '7200', '1', '2018-11-10 16:00:10', '2018-11-10 16:00:10');
INSERT INTO `wancll_user_tokens` VALUES ('20', '5', '5', 'wechat', 'user&wechat@3d41ced5c46502395685a7d15d29636f', 'user&wechat@95bd98af7a164dcc61f45e08920403de', '7200', '1', '2018-11-10 16:00:30', '2018-11-10 16:00:30');
INSERT INTO `wancll_user_tokens` VALUES ('21', '1', '1', 'wechat', 'user&wechat@e5f38f3764d7453b269b9c4aa7833818', 'user&wechat@d0e14cb70b2245c003419d04fdb44882', '7200', '1', '2018-11-10 16:24:03', '2018-11-10 16:24:03');
INSERT INTO `wancll_user_tokens` VALUES ('22', '1', '1', 'wechat', 'user&wechat@ffbb2af9e71952b0b418453034a35a79', 'user&wechat@6960156d982e9b3955a42973bf543b53', '7200', '1', '2018-11-10 16:36:50', '2018-11-10 16:36:50');
INSERT INTO `wancll_user_tokens` VALUES ('23', '4', '4', 'app', 'user&app@3ff1b67243f3865bbeef849aac9cb0da', 'user&app@1e13069628bfb34ca0baf356298e61ed', '0', '1', '2018-11-10 16:39:34', '2018-11-10 16:39:34');
INSERT INTO `wancll_user_tokens` VALUES ('24', '4', '4', 'app', 'user&app@4043fb95a654c4464a5a0fa0e572c83a', 'user&app@98fbcf5d78d6cd3fcb8847d0eb0e8c30', '0', '1', '2018-11-10 16:40:48', '2018-11-10 16:40:48');
INSERT INTO `wancll_user_tokens` VALUES ('38', '10', '10', 'wechat', 'user&wechat@d9d3327421ac73bb51110d49e7d27a26', 'user&wechat@4938ff4125580bd5e08b909eb473c01f', '7200', '1', '2018-11-12 14:27:08', '2018-11-12 14:27:08');
INSERT INTO `wancll_user_tokens` VALUES ('26', '6', '6', 'applet', 'user&applet@cf8973e7c681b1ecd8e4a699e4b5ad76', 'user&applet@5defa82254ae38e4ba78234c0bda9602', '0', '1', '2018-11-10 16:42:53', '2018-11-10 16:42:53');
INSERT INTO `wancll_user_tokens` VALUES ('27', '1', '1', 'wechat', 'user&wechat@e3ac39b5c858ff13b2b3dcbab7efeeb2', 'user&wechat@6592adc51ccbdc7f54ca602e42bbe94b', '7200', '1', '2018-11-10 16:48:35', '2018-11-10 16:48:35');
INSERT INTO `wancll_user_tokens` VALUES ('28', '7', '7', 'pc', 'user&pc@336b8d62138055939b9a638c60e1f2af', 'user&pc@a3e0ea1991ce3c020244351773f9970e', '7200', '1', '2018-11-10 17:38:14', '2018-11-10 17:38:14');
INSERT INTO `wancll_user_tokens` VALUES ('29', '7', '7', 'wap', 'user&wap@f8654c4492eebbd8e8c2c638c95ad722', 'user&wap@1073e3864abe9784820917edc533b16b', '7200', '1', '2018-11-10 18:39:06', '2018-11-10 18:39:06');
INSERT INTO `wancll_user_tokens` VALUES ('30', '8', '8', 'wechat', 'user&wechat@d2988809692cfdbc18bd1eb981482f0e', 'user&wechat@68a17c3fcae1a80e535b17436aac48f4', '7200', '1', '2018-11-12 11:17:55', '2018-11-12 11:17:55');
INSERT INTO `wancll_user_tokens` VALUES ('31', '9', '9', 'wap', 'user&wap@d6bf54711d2a2c0cf79acd5a0562170a', 'user&wap@467c3dc012633d3085224be1768f4d4c', '7200', '1', '2018-11-12 12:45:53', '2018-11-12 12:45:53');
INSERT INTO `wancll_user_tokens` VALUES ('32', '9', '9', 'wap', 'user&wap@73b28d4d0cfa282a8e0e5bd559e26b82', 'user&wap@379d930fdedd21c56a4c0f788575a295', '7200', '1', '2018-11-12 13:45:19', '2018-11-12 13:45:19');
INSERT INTO `wancll_user_tokens` VALUES ('33', '9', '9', 'wap', 'user&wap@fa9d1e6d2504cffd32f5ffbb8d23e0fc', 'user&wap@244f2a3046ea55f8e1adb500dbe656b2', '7200', '1', '2018-11-12 13:50:57', '2018-11-12 13:50:57');
INSERT INTO `wancll_user_tokens` VALUES ('34', '9', '9', 'wap', 'user&wap@c48107631323eff1b8c17314c074a7c0', 'user&wap@83484591ac285c9096e7220213f89262', '7200', '1', '2018-11-12 13:51:40', '2018-11-12 13:51:40');
INSERT INTO `wancll_user_tokens` VALUES ('35', '1', '1', 'applet', 'user&applet@f62c581f2072b194c1dc173a22b137ea', 'user&applet@d4bff3c27a93ef0851efa005338b4899', '0', '1', '2018-11-12 13:52:16', '2018-11-12 13:52:16');
INSERT INTO `wancll_user_tokens` VALUES ('36', '1', '1', 'wechat', 'user&wechat@d3ff30c4431d1d73e2e1f21bf430b923', 'user&wechat@5804861d283c054b57cde8a0eef50ac6', '7200', '1', '2018-11-12 13:53:14', '2018-11-12 13:53:14');
INSERT INTO `wancll_user_tokens` VALUES ('37', '2', '2', 'app', 'user&app@957b0c28da256e4f6cecea2584dfc4b5', 'user&app@1b06f13b2860a00ac028787e67986a9a', '0', '1', '2018-11-12 13:53:47', '2018-11-12 13:53:47');
INSERT INTO `wancll_user_tokens` VALUES ('39', '9', '9', 'wap', 'user&wap@2c42f85c12698d72715e3828af8a195a', 'user&wap@4095f483dfaed97a4ce0f03d1cf716ec', '7200', '1', '2018-11-12 14:45:49', '2018-11-12 14:45:49');
INSERT INTO `wancll_user_tokens` VALUES ('40', '9', '9', 'wap', 'user&wap@52b6d85a2bfc96348a284d5beb3b7722', 'user&wap@ccfe3d65f3586837c56b81f150786cc8', '7200', '1', '2018-11-12 14:48:41', '2018-11-12 14:48:41');
INSERT INTO `wancll_user_tokens` VALUES ('41', '9', '9', 'wap', 'user&wap@0a83d278f5825cdcf208badf2d96a04f', 'user&wap@5f41f8d98cf5ade2d6145ec6d132e643', '7200', '1', '2018-11-12 14:49:17', '2018-11-12 14:49:17');
INSERT INTO `wancll_user_tokens` VALUES ('42', '11', '11', 'applet', 'user&applet@13964d2bedbd80122b437b4bd325e5a4', 'user&applet@ca9764a76ed7f83b6bc6961efd05d3ab', '0', '1', '2018-11-12 15:08:12', '2018-11-12 15:08:12');
INSERT INTO `wancll_user_tokens` VALUES ('43', '9', '9', 'wap', 'user&wap@fc1f1ea525c30ccfdc5292b0c89806d9', 'user&wap@84805ca6dac2ab1e6e7c3546e6d11ba5', '7200', '1', '2018-11-12 15:49:05', '2018-11-12 15:49:05');
INSERT INTO `wancll_user_tokens` VALUES ('44', '9', '9', 'wap', 'user&wap@808223b544930b0dde691f0bae891fd5', 'user&wap@43ede1e0e161d41a520bc75ba9406612', '7200', '1', '2018-11-12 15:49:13', '2018-11-12 15:49:13');
INSERT INTO `wancll_user_tokens` VALUES ('45', '9', '9', 'wap', 'user&wap@e5f71d848eae9440a7f37fcca405c5b1', 'user&wap@13039d2e3bc24a69dd4dabeac547aa7b', '7200', '1', '2018-11-12 15:49:21', '2018-11-12 15:49:21');
INSERT INTO `wancll_user_tokens` VALUES ('46', '9', '9', 'wap', 'user&wap@a31a18199fc93c0b28ac8dbf2f874c11', 'user&wap@636f1bb4e7b90039d28217b6597a7b63', '7200', '1', '2018-11-12 15:50:35', '2018-11-12 15:50:35');
INSERT INTO `wancll_user_tokens` VALUES ('47', '9', '9', 'wap', 'user&wap@ebb0a4c959297483679dd2d65210f1f1', 'user&wap@571911cc66dc111ac7fa6491efb75d63', '7200', '1', '2018-11-12 15:50:45', '2018-11-12 15:50:45');
INSERT INTO `wancll_user_tokens` VALUES ('48', '9', '9', 'wap', 'user&wap@c9d4fbc521cd50bd00630ded00e9360a', 'user&wap@0c29c8568a8d94949bf6a7b274f6eade', '7200', '1', '2018-11-12 15:50:54', '2018-11-12 15:50:54');

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
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_visit_logs`
-- -----------------------------
INSERT INTO `wancll_user_visit_logs` VALUES ('1', '1', '1', 'wap', '113.246.203.142', '2018-11-10 09:28:14', '1', '2018-11-10 09:28:14', '2018-11-10 09:28:14');
INSERT INTO `wancll_user_visit_logs` VALUES ('2', '1', '1', 'wechat', '113.246.203.142', '2018-11-10 09:58:03', '1', '2018-11-10 09:58:03', '2018-11-10 09:58:03');
INSERT INTO `wancll_user_visit_logs` VALUES ('3', '1', '1', 'applet', '113.246.203.142', '2018-11-10 09:59:11', '1', '2018-11-10 09:59:11', '2018-11-10 09:59:11');
INSERT INTO `wancll_user_visit_logs` VALUES ('4', '1', '1', 'app', '113.246.203.142', '2018-11-10 10:07:21', '1', '2018-11-10 10:07:21', '2018-11-10 10:07:21');
INSERT INTO `wancll_user_visit_logs` VALUES ('5', '1', '1', 'applet', '113.246.203.142', '2018-11-10 10:08:19', '1', '2018-11-10 10:08:19', '2018-11-10 10:08:19');
INSERT INTO `wancll_user_visit_logs` VALUES ('6', '2', '2', 'app', '113.246.203.142', '2018-11-10 13:43:52', '1', '2018-11-10 13:43:52', '2018-11-10 13:43:52');
INSERT INTO `wancll_user_visit_logs` VALUES ('7', '2', '2', 'app', '113.246.203.142', '2018-11-10 13:45:54', '1', '2018-11-10 13:45:54', '2018-11-10 13:45:54');
INSERT INTO `wancll_user_visit_logs` VALUES ('8', '2', '2', 'app', '113.246.203.142', '2018-11-10 14:40:53', '1', '2018-11-10 14:40:53', '2018-11-10 14:40:53');
INSERT INTO `wancll_user_visit_logs` VALUES ('9', '2', '2', 'wechat', '113.246.203.142', '2018-11-10 14:56:16', '1', '2018-11-10 14:56:16', '2018-11-10 14:56:16');
INSERT INTO `wancll_user_visit_logs` VALUES ('10', '2', '2', 'app', '113.246.203.142', '2018-11-10 14:58:02', '1', '2018-11-10 14:58:02', '2018-11-10 14:58:02');
INSERT INTO `wancll_user_visit_logs` VALUES ('11', '2', '2', 'applet', '113.246.203.142', '2018-11-10 15:00:29', '1', '2018-11-10 15:00:29', '2018-11-10 15:00:29');
INSERT INTO `wancll_user_visit_logs` VALUES ('12', '3', '3', 'app', '113.246.203.142', '2018-11-10 15:04:28', '1', '2018-11-10 15:04:28', '2018-11-10 15:04:28');
INSERT INTO `wancll_user_visit_logs` VALUES ('13', '4', '4', 'wap', '113.246.203.142', '2018-11-10 15:06:37', '1', '2018-11-10 15:06:37', '2018-11-10 15:06:37');
INSERT INTO `wancll_user_visit_logs` VALUES ('14', '2', '2', 'wechat', '113.246.203.142', '2018-11-10 15:09:09', '1', '2018-11-10 15:09:09', '2018-11-10 15:09:09');
INSERT INTO `wancll_user_visit_logs` VALUES ('15', '2', '2', 'applet', '113.246.203.142', '2018-11-10 15:11:43', '1', '2018-11-10 15:11:43', '2018-11-10 15:11:43');
INSERT INTO `wancll_user_visit_logs` VALUES ('16', '2', '2', 'applet', '113.246.203.142', '2018-11-10 15:38:51', '1', '2018-11-10 15:38:51', '2018-11-10 15:38:51');
INSERT INTO `wancll_user_visit_logs` VALUES ('17', '2', '2', 'applet', '113.246.203.142', '2018-11-10 15:55:44', '1', '2018-11-10 15:55:44', '2018-11-10 15:55:44');
INSERT INTO `wancll_user_visit_logs` VALUES ('18', '1', '1', 'wechat', '113.246.203.142', '2018-11-10 15:58:47', '1', '2018-11-10 15:58:47', '2018-11-10 15:58:47');
INSERT INTO `wancll_user_visit_logs` VALUES ('19', '1', '1', 'wechat', '113.246.203.142', '2018-11-10 16:00:10', '1', '2018-11-10 16:00:10', '2018-11-10 16:00:10');
INSERT INTO `wancll_user_visit_logs` VALUES ('20', '5', '5', 'wechat', '113.246.203.142', '2018-11-10 16:00:30', '1', '2018-11-10 16:00:30', '2018-11-10 16:00:30');
INSERT INTO `wancll_user_visit_logs` VALUES ('21', '1', '1', 'wechat', '113.246.203.142', '2018-11-10 16:24:03', '1', '2018-11-10 16:24:03', '2018-11-10 16:24:03');
INSERT INTO `wancll_user_visit_logs` VALUES ('22', '1', '1', 'wechat', '113.246.203.142', '2018-11-10 16:36:50', '1', '2018-11-10 16:36:50', '2018-11-10 16:36:50');
INSERT INTO `wancll_user_visit_logs` VALUES ('23', '4', '4', 'app', '113.246.203.142', '2018-11-10 16:39:34', '1', '2018-11-10 16:39:34', '2018-11-10 16:39:34');
INSERT INTO `wancll_user_visit_logs` VALUES ('24', '4', '4', 'app', '113.246.203.142', '2018-11-10 16:40:48', '1', '2018-11-10 16:40:48', '2018-11-10 16:40:48');
INSERT INTO `wancll_user_visit_logs` VALUES ('25', '1', '1', 'wechat', '113.246.203.142', '2018-11-10 16:42:35', '1', '2018-11-10 16:42:35', '2018-11-10 16:42:35');
INSERT INTO `wancll_user_visit_logs` VALUES ('26', '6', '6', 'applet', '220.202.235.50', '2018-11-10 16:42:53', '1', '2018-11-10 16:42:53', '2018-11-10 16:42:53');
INSERT INTO `wancll_user_visit_logs` VALUES ('27', '1', '1', 'wechat', '113.246.203.142', '2018-11-10 16:48:35', '1', '2018-11-10 16:48:35', '2018-11-10 16:48:35');
INSERT INTO `wancll_user_visit_logs` VALUES ('28', '7', '7', 'pc', '192.168.31.145', '2018-11-10 17:38:14', '1', '2018-11-10 17:38:14', '2018-11-10 17:38:14');
INSERT INTO `wancll_user_visit_logs` VALUES ('29', '7', '7', 'wap', '192.168.31.145', '2018-11-10 18:39:06', '1', '2018-11-10 18:39:06', '2018-11-10 18:39:06');
INSERT INTO `wancll_user_visit_logs` VALUES ('30', '8', '8', 'wechat', '106.19.195.182', '2018-11-12 11:17:55', '1', '2018-11-12 11:17:55', '2018-11-12 11:17:55');
INSERT INTO `wancll_user_visit_logs` VALUES ('31', '9', '9', 'wap', '113.247.12.57', '2018-11-12 12:45:53', '1', '2018-11-12 12:45:53', '2018-11-12 12:45:53');
INSERT INTO `wancll_user_visit_logs` VALUES ('32', '9', '9', 'wap', '113.247.12.57', '2018-11-12 13:45:19', '1', '2018-11-12 13:45:19', '2018-11-12 13:45:19');
INSERT INTO `wancll_user_visit_logs` VALUES ('33', '9', '9', 'wap', '113.247.12.57', '2018-11-12 13:50:57', '1', '2018-11-12 13:50:57', '2018-11-12 13:50:57');
INSERT INTO `wancll_user_visit_logs` VALUES ('34', '9', '9', 'wap', '113.247.12.57', '2018-11-12 13:51:40', '1', '2018-11-12 13:51:40', '2018-11-12 13:51:40');
INSERT INTO `wancll_user_visit_logs` VALUES ('35', '1', '1', 'applet', '113.247.12.57', '2018-11-12 13:52:16', '1', '2018-11-12 13:52:16', '2018-11-12 13:52:16');
INSERT INTO `wancll_user_visit_logs` VALUES ('36', '1', '1', 'wechat', '113.247.12.57', '2018-11-12 13:53:14', '1', '2018-11-12 13:53:14', '2018-11-12 13:53:14');
INSERT INTO `wancll_user_visit_logs` VALUES ('37', '2', '2', 'app', '113.247.12.57', '2018-11-12 13:53:47', '1', '2018-11-12 13:53:47', '2018-11-12 13:53:47');
INSERT INTO `wancll_user_visit_logs` VALUES ('38', '10', '10', 'wechat', '113.247.12.57', '2018-11-12 14:27:08', '1', '2018-11-12 14:27:08', '2018-11-12 14:27:08');
INSERT INTO `wancll_user_visit_logs` VALUES ('39', '9', '9', 'wap', '113.247.12.57', '2018-11-12 14:45:49', '1', '2018-11-12 14:45:49', '2018-11-12 14:45:49');
INSERT INTO `wancll_user_visit_logs` VALUES ('40', '9', '9', 'wap', '113.247.12.57', '2018-11-12 14:48:41', '1', '2018-11-12 14:48:41', '2018-11-12 14:48:41');
INSERT INTO `wancll_user_visit_logs` VALUES ('41', '9', '9', 'wap', '113.247.12.57', '2018-11-12 14:49:17', '1', '2018-11-12 14:49:17', '2018-11-12 14:49:17');
INSERT INTO `wancll_user_visit_logs` VALUES ('42', '11', '11', 'applet', '113.247.12.57', '2018-11-12 15:08:12', '1', '2018-11-12 15:08:12', '2018-11-12 15:08:12');
INSERT INTO `wancll_user_visit_logs` VALUES ('43', '9', '9', 'wap', '113.247.12.57', '2018-11-12 15:49:05', '1', '2018-11-12 15:49:05', '2018-11-12 15:49:05');
INSERT INTO `wancll_user_visit_logs` VALUES ('44', '9', '9', 'wap', '113.247.12.57', '2018-11-12 15:49:13', '1', '2018-11-12 15:49:13', '2018-11-12 15:49:13');
INSERT INTO `wancll_user_visit_logs` VALUES ('45', '9', '9', 'wap', '113.247.12.57', '2018-11-12 15:49:21', '1', '2018-11-12 15:49:21', '2018-11-12 15:49:21');
INSERT INTO `wancll_user_visit_logs` VALUES ('46', '9', '9', 'wap', '113.247.12.57', '2018-11-12 15:50:35', '1', '2018-11-12 15:50:35', '2018-11-12 15:50:35');
INSERT INTO `wancll_user_visit_logs` VALUES ('47', '9', '9', 'wap', '113.247.12.57', '2018-11-12 15:50:45', '1', '2018-11-12 15:50:45', '2018-11-12 15:50:45');
INSERT INTO `wancll_user_visit_logs` VALUES ('48', '9', '9', 'wap', '113.247.12.57', '2018-11-12 15:50:54', '1', '2018-11-12 15:50:54', '2018-11-12 15:50:54');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_users`
-- -----------------------------
INSERT INTO `wancll_users` VALUES ('1', '18888888888', '', '_1024', 'http://thirdwx.qlogo.cn/mmopen/vi_32/NCgkpy3LsM5ibz6L9Oe5MKbR4hcm4jgUr17w9XEiaSxzA54CYXPiaZE8QpSpkSpeDfCiaLR6Yfb6UpgFfVLlrAdgnQ/132', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '2018-11-10 15:52:53', '1', '1', '', '', '', '0', '0', '1', '0', '0', '', '1', '2018-11-10 09:28:14', '2018-11-10 15:58:44');
INSERT INTO `wancll_users` VALUES ('2', '15071357527', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '2018-11-10 14:57:27', '1', '1', '', '', '', '0', '0', '1', '0', '0', '', '1', '2018-11-10 13:43:52', '2018-11-10 14:57:27');
INSERT INTO `wancll_users` VALUES ('3', '15071350005', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '', '0', '0', '1', '0', '1', '2018-11-10 16:39:12', '1', '2018-11-10 15:04:28', '2018-11-10 16:39:12');
INSERT INTO `wancll_users` VALUES ('4', '13874930708', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '', '0', '0', '1', '0', '1', '2018-11-10 16:40:00', '1', '2018-11-10 15:06:37', '2018-11-10 16:40:00');
INSERT INTO `wancll_users` VALUES ('5', '15071350006', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '', '0', '0', '1', '0', '0', '', '1', '2018-11-10 16:00:30', '2018-11-10 16:00:30');
INSERT INTO `wancll_users` VALUES ('6', '15200597371', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '', '0', '0', '1', '0', '0', '', '1', '2018-11-10 16:42:53', '2018-11-10 16:42:53');
INSERT INTO `wancll_users` VALUES ('7', '15675143940', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '', '0', '0', '1', '0', '0', '', '1', '2018-11-10 17:38:14', '2018-11-10 17:38:14');
INSERT INTO `wancll_users` VALUES ('8', '18175974828', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '', '0', '0', '1', '0', '0', '', '1', '2018-11-12 11:17:55', '2018-11-12 11:17:55');
INSERT INTO `wancll_users` VALUES ('9', '15071357528', '', '毛毛', '', '1', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '', '0', '0', '1', '0', '0', '', '1', '2018-11-12 12:45:53', '2018-11-12 12:48:25');
INSERT INTO `wancll_users` VALUES ('10', '15580841403', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '', '0', '0', '1', '0', '0', '', '1', '2018-11-12 14:27:08', '2018-11-12 14:27:08');
INSERT INTO `wancll_users` VALUES ('11', '17712345678', '', '耗子', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIkJVv034OmXfupclYOwBlOpAn6fp91Kiax9woibJGU0w6ZOFWhNn8hM01jzuZXcUy9CTzYibjOp39HA/132', '0', '', '', '', '', '', '', '', '', '', '', '', '[1]', '', '0', '0', '', '', '', '0', '0', '1', '0', '0', '', '1', '2018-11-12 15:08:12', '2018-11-12 15:08:12');

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

