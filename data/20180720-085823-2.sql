
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_accounts`
-- -----------------------------
INSERT INTO `wancll_admin_accounts` VALUES ('1', 'yiyun', '18002797d30d04fdc5fe16aceec36d47', '1', '1', '2018-04-10 16:40:36', '2018-04-10 16:40:36');
INSERT INTO `wancll_admin_accounts` VALUES ('2', 'admin', 'b5305e8c4c5e08c246943fe736701525', '2', '1', '2018-04-10 16:40:48', '2018-06-30 11:51:06');
INSERT INTO `wancll_admin_accounts` VALUES ('3', 'test', 'b5305e8c4c5e08c246943fe736701525', '3', '0', '2018-04-11 10:22:20', '2018-04-11 10:30:41');
INSERT INTO `wancll_admin_accounts` VALUES ('4', 'test', 'b5305e8c4c5e08c246943fe736701525', '4', '1', '2018-04-11 14:09:07', '2018-04-11 14:09:07');
INSERT INTO `wancll_admin_accounts` VALUES ('5', 'df', 'e6297b585db794e177808f8953b46669', '5', '1', '2018-06-29 11:59:02', '2018-06-29 13:51:57');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_assets`
-- -----------------------------
INSERT INTO `wancll_admin_assets` VALUES ('1', '5', '0.00', '0.00', '1', '2018-06-29 11:59:02', '2018-06-29 11:59:02');

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
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_tokens`
-- -----------------------------
INSERT INTO `wancll_admin_tokens` VALUES ('11', '2', '2', 'pc', 'admin&pc@1cddca58ba7cb66e3ceff43576096771', 'admin&pc@c7460371ba0b7ff40225f0206e2bde40', '7200', '1', '2018-06-29 15:55:39', '2018-06-29 15:55:39');
INSERT INTO `wancll_admin_tokens` VALUES ('2', '2', '2', 'pc', 'admin&pc@0de9af265a598e6d8be2eed1acca9ad6', 'admin&pc@f90bfbc2ec85fb44f6bc8330f932a89c', '7200', '1', '2018-06-28 16:00:17', '2018-06-28 16:00:17');
INSERT INTO `wancll_admin_tokens` VALUES ('3', '2', '2', 'pc', 'admin&pc@300096679fd285b59a7ad0fa7898848b', 'admin&pc@cf406ae50a2108643fbb6c8cfed394f5', '7200', '1', '2018-06-28 17:01:11', '2018-06-28 17:01:11');
INSERT INTO `wancll_admin_tokens` VALUES ('4', '2', '2', 'pc', 'admin&pc@94feaf89499b0ad76497cd1ca8fae4f8', 'admin&pc@73cc273e584cc9ec23f72c856cd9a783', '', '1', '2018-06-28 17:04:42', '2018-06-28 17:04:42');
INSERT INTO `wancll_admin_tokens` VALUES ('5', '2', '2', 'pc', 'admin&pc@7c5a5df0d073e8cb9acfd583edaa115f', 'admin&pc@945cc4ada3d49adb9eff0a022ae48c94', '7200', '1', '2018-06-29 11:29:03', '2018-06-29 11:29:03');
INSERT INTO `wancll_admin_tokens` VALUES ('6', '2', '2', 'pc', 'admin&pc@f4ad67a4a7eda3d3d7f5da3c2b7336f7', 'admin&pc@a682f3ca76d96636d3db6e0d6e06aa98', '7200', '1', '2018-06-29 11:29:31', '2018-06-29 11:29:31');
INSERT INTO `wancll_admin_tokens` VALUES ('7', '2', '2', 'pc', 'admin&pc@f4ff1c6138614bc5f19d14c0814855e7', 'admin&pc@b9e333bbfeed34765d913918c21b3044', '7200', '1', '2018-06-29 11:31:44', '2018-06-29 11:31:44');
INSERT INTO `wancll_admin_tokens` VALUES ('37', '2', '2', 'pc', 'admin&pc@03ef0c89b1c613c6089aa8cdce8deae2', 'admin&pc@81d50b81e12b8afa7f55d0ee86cc240e', '7200', '1', '2018-06-30 16:08:27', '2018-06-30 16:08:27');
INSERT INTO `wancll_admin_tokens` VALUES ('9', '2', '2', 'pc', 'admin&pc@49a417055e76e020e52d0772ea87f50e', 'admin&pc@929a190f30dd2f89f30905801bdfd38c', '7200', '1', '2018-06-29 15:51:22', '2018-06-29 15:51:22');
INSERT INTO `wancll_admin_tokens` VALUES ('10', '2', '2', 'pc', 'admin&pc@eef408b479af1879c12e86240dc8ad4c', 'admin&pc@bb614eb086b06da7aa1fce5d14010c97', '7200', '1', '2018-06-29 15:51:51', '2018-06-29 15:51:51');
INSERT INTO `wancll_admin_tokens` VALUES ('12', '2', '2', 'pc', 'admin&pc@ecbb7c7da826582bbc5e5f4593457c04', 'admin&pc@82ff94b460297b99fbfebdb97c6f1484', '7200', '1', '2018-06-29 20:00:38', '2018-06-29 20:00:38');
INSERT INTO `wancll_admin_tokens` VALUES ('13', '2', '2', 'pc', 'admin&pc@190881eaca38f3d867d94f0523ec4bf4', 'admin&pc@53dbe15a0946fe5c2004076a326bf6a8', '7200', '1', '2018-06-29 20:00:40', '2018-06-29 20:00:40');
INSERT INTO `wancll_admin_tokens` VALUES ('14', '2', '2', 'pc', 'admin&pc@d33646a2548d48fb3cd08121a46b4e3f', 'admin&pc@6e8c821b2803ddc61a7794dc82f6d606', '7200', '1', '2018-06-29 20:00:57', '2018-06-29 20:00:57');
INSERT INTO `wancll_admin_tokens` VALUES ('15', '2', '2', 'pc', 'admin&pc@70e4456cafb22cff6e66f805702598fb', 'admin&pc@34400562c1ac2db553af12460989122f', '7200', '1', '2018-06-29 20:01:17', '2018-06-29 20:01:17');
INSERT INTO `wancll_admin_tokens` VALUES ('16', '2', '2', 'pc', 'admin&pc@ae7ae24a258eaeeb046a6cf2be0c2c24', 'admin&pc@7844f961635adfc0664a14db7c4b86f6', '7200', '1', '2018-06-29 20:08:36', '2018-06-29 20:08:36');
INSERT INTO `wancll_admin_tokens` VALUES ('17', '2', '2', 'pc', 'admin&pc@1ffc6334bb4bc8c9d17e66a6f44cad29', 'admin&pc@21239c451154a6ccd60e0572b0aba19e', '7200', '1', '2018-06-29 20:10:26', '2018-06-29 20:10:26');
INSERT INTO `wancll_admin_tokens` VALUES ('18', '2', '2', 'pc', 'admin&pc@69f65d347b0e4b76dcc253485cfbb5fa', 'admin&pc@ec8a3d9db0a2122e858b8eb51ba6ef66', '7200', '1', '2018-06-29 20:10:41', '2018-06-29 20:10:41');
INSERT INTO `wancll_admin_tokens` VALUES ('19', '2', '2', 'pc', 'admin&pc@380c6a8bbb7aa0876c0bcc4a2eb6577c', 'admin&pc@77306c4291f2d3ff82036c3f182d1be7', '7200', '1', '2018-06-29 20:31:20', '2018-06-29 20:31:20');
INSERT INTO `wancll_admin_tokens` VALUES ('20', '2', '2', 'pc', 'admin&pc@84a20d611d89488f3afb5a1c5f7ac870', 'admin&pc@dcbd9da1a4bb48eab8d978efd7c87d99', '7200', '1', '2018-06-29 20:59:22', '2018-06-29 20:59:22');
INSERT INTO `wancll_admin_tokens` VALUES ('21', '2', '2', 'pc', 'admin&pc@05eaa934658c6da5681410901f8f95e7', 'admin&pc@ff83b10b94a1d7e5c41f581d85c15018', '7200', '1', '2018-06-29 21:33:21', '2018-06-29 21:33:21');
INSERT INTO `wancll_admin_tokens` VALUES ('22', '2', '2', 'pc', 'admin&pc@1250807b6826e7f3dee790c8c2bfe1bb', 'admin&pc@252f798fb28c558e0279c31ae0ee4c8a', '7200', '1', '2018-06-29 22:39:09', '2018-06-29 22:39:09');
INSERT INTO `wancll_admin_tokens` VALUES ('23', '2', '2', 'pc', 'admin&pc@3a46849460945dc02e10efce0c9cbde5', 'admin&pc@dae9d36ce9d3d3144091688af52413c1', '7200', '1', '2018-06-29 22:39:50', '2018-06-29 22:39:50');
INSERT INTO `wancll_admin_tokens` VALUES ('24', '2', '2', 'pc', 'admin&pc@b520bb5ab8f7c70c566048c16517a262', 'admin&pc@34496d75fc7e5362f186dc40f11531ea', '7200', '1', '2018-06-29 22:42:04', '2018-06-29 22:42:04');
INSERT INTO `wancll_admin_tokens` VALUES ('25', '2', '2', 'pc', 'admin&pc@f58d211056d970f4ca294c944d3332c4', 'admin&pc@0fb3180c45644746557e6411ec790ce3', '7200', '1', '2018-06-30 09:03:17', '2018-06-30 09:03:17');
INSERT INTO `wancll_admin_tokens` VALUES ('26', '2', '2', 'pc', 'admin&pc@dba219d80aeec571f4cb564e010afab1', 'admin&pc@e4df14ba5b72379bd2039c2ec2188f02', '7200', '1', '2018-06-30 09:30:43', '2018-06-30 09:30:43');
INSERT INTO `wancll_admin_tokens` VALUES ('27', '2', '2', 'pc', 'admin&pc@0ef93d81a99a624a10ad482b92729a55', 'admin&pc@c126a10bff63049239cf0deded05750a', '7200', '1', '2018-06-30 09:31:44', '2018-06-30 09:31:44');
INSERT INTO `wancll_admin_tokens` VALUES ('28', '2', '2', 'pc', 'admin&pc@8a649f7c6802a120512d660a58998763', 'admin&pc@bb43c3a19cdac43fb699cab10c5fc98c', '7200', '1', '2018-06-30 09:33:04', '2018-06-30 09:33:04');
INSERT INTO `wancll_admin_tokens` VALUES ('29', '2', '2', 'pc', 'admin&pc@b29866b7ed51654f25cbedfc2aee3a0b', 'admin&pc@043688f80f4143a4d557082cd7d717a0', '7200', '1', '2018-06-30 09:33:39', '2018-06-30 09:33:39');
INSERT INTO `wancll_admin_tokens` VALUES ('30', '2', '2', 'pc', 'admin&pc@2b2986e734d233f6a24029d9a2a5f335', 'admin&pc@d3f6891a50e5b133eec5043e88b5ded7', '7200', '1', '2018-06-30 10:08:22', '2018-06-30 10:08:22');
INSERT INTO `wancll_admin_tokens` VALUES ('31', '2', '2', 'pc', 'admin&pc@3b128d49486cffc59af74a54bfec9f7f', 'admin&pc@ffa30f4700df5c98f7a7cb704b067e4a', '7200', '1', '2018-06-30 13:59:08', '2018-06-30 13:59:08');
INSERT INTO `wancll_admin_tokens` VALUES ('32', '2', '2', 'pc', 'admin&pc@5117f9db2f02852da6e088e8dd4f49d2', 'admin&pc@e653d38934fcc1783c4523683f7d9080', '7200', '1', '2018-06-30 15:12:35', '2018-06-30 15:12:35');
INSERT INTO `wancll_admin_tokens` VALUES ('33', '2', '2', 'pc', 'admin&pc@4dcbe7cdf23387f15ea879a6b62645b7', 'admin&pc@2f22f8b99e904349ab01db83dbb2b632', '7200', '1', '2018-06-30 15:12:56', '2018-06-30 15:12:56');
INSERT INTO `wancll_admin_tokens` VALUES ('34', '2', '2', 'pc', 'admin&pc@05ba7fd0b05f392df32647069e700868', 'admin&pc@3146530c4a90963fa21ce6bb90cabcaf', '7200', '1', '2018-06-30 15:28:50', '2018-06-30 15:28:50');
INSERT INTO `wancll_admin_tokens` VALUES ('42', '2', '2', 'pc', 'admin&pc@937e0cf15fe75d2e436dcb6de3835932', 'admin&pc@4f76dfaa9465b2cdd669ea263b5079d6', '7200', '1', '2018-07-02 09:11:06', '2018-07-02 09:11:06');
INSERT INTO `wancll_admin_tokens` VALUES ('36', '2', '2', 'pc', 'admin&pc@346488b1f1ee9a40cbe162a10636781d', 'admin&pc@8ee9d4a589cbec67e20dfd5d3d617b30', '7200', '1', '2018-06-30 15:33:15', '2018-06-30 15:33:15');
INSERT INTO `wancll_admin_tokens` VALUES ('38', '2', '2', 'pc', 'admin&pc@0e1cc166b911da66202775cb5c4dae48', 'admin&pc@7577ce461d5ed43609588c616be85681', '7200', '1', '2018-06-30 16:25:55', '2018-06-30 16:25:55');
INSERT INTO `wancll_admin_tokens` VALUES ('39', '2', '2', 'pc', 'admin&pc@d64e4aee1f8798238c9f77519fe6d979', 'admin&pc@70a224f9c4834b4a755b76fb7f93c21c', '7200', '1', '2018-06-30 16:26:51', '2018-06-30 16:26:51');
INSERT INTO `wancll_admin_tokens` VALUES ('43', '2', '2', 'pc', 'admin&pc@7a98134db19e32220eee6f58668b3460', 'admin&pc@57f3db296799832368d1c2296cdd17d3', '7200', '1', '2018-07-02 13:48:05', '2018-07-02 13:48:05');
INSERT INTO `wancll_admin_tokens` VALUES ('57', '2', '2', 'pc', 'admin&pc@c6fd3bca424a76286ddf8797a0d1c302', 'admin&pc@7f934fa668a687492bd25f1df811b3a8', '7200', '1', '2018-07-05 09:32:08', '2018-07-05 09:32:08');
INSERT INTO `wancll_admin_tokens` VALUES ('62', '2', '2', 'pc', 'admin&pc@818d2cce4c30d4ddbd4ca0461424f3ba', 'admin&pc@d832f42e6a73c4e1a4c402b3d52fa5a9', '7200', '1', '2018-07-05 11:38:06', '2018-07-05 11:38:06');
INSERT INTO `wancll_admin_tokens` VALUES ('45', '2', '2', 'pc', 'admin&pc@564b6f5385a8b566987f896875289ca7', 'admin&pc@73a52f5a7cb4bc23785b6e1436de4844', '7200', '1', '2018-07-02 18:03:29', '2018-07-02 18:03:29');
INSERT INTO `wancll_admin_tokens` VALUES ('46', '2', '2', 'pc', 'admin&pc@58dce97e954cb16dcbe7c7e0b920abd6', 'admin&pc@c1e5d279eb9df4a51b56fe67b617bb84', '7200', '1', '2018-07-02 18:04:09', '2018-07-02 18:04:09');
INSERT INTO `wancll_admin_tokens` VALUES ('47', '2', '2', 'pc', 'admin&pc@36a008249ab9d0d35c7cd50177602224', 'admin&pc@90f3a2a0f3efb3687f80d85880788eea', '7200', '1', '2018-07-02 21:06:33', '2018-07-02 21:06:33');
INSERT INTO `wancll_admin_tokens` VALUES ('48', '2', '2', 'pc', 'admin&pc@85d5f855c9787f479c4977a95669af12', 'admin&pc@af44f0699327595fa66dd083a158b024', '7200', '1', '2018-07-02 22:32:37', '2018-07-02 22:32:37');
INSERT INTO `wancll_admin_tokens` VALUES ('49', '2', '2', 'pc', 'admin&pc@70bf500c24df77dade5e5ae7bf8e54d7', 'admin&pc@a10304bab6d0213e3e00ffc1b68fcb29', '7200', '1', '2018-07-02 23:49:51', '2018-07-02 23:49:51');
INSERT INTO `wancll_admin_tokens` VALUES ('50', '2', '2', 'pc', 'admin&pc@3a28c436bb6d0f0fca4a12bc96008b66', 'admin&pc@71aef2d55d49d67d6925ceab1a56f2db', '7200', '1', '2018-07-02 23:52:48', '2018-07-02 23:52:48');
INSERT INTO `wancll_admin_tokens` VALUES ('51', '2', '2', 'pc', 'admin&pc@dd3ded105cbbeaafca07a369070b0ca1', 'admin&pc@dab8156ba1eae2e435ee9b873cfdb0a7', '7200', '1', '2018-07-02 23:55:27', '2018-07-02 23:55:27');
INSERT INTO `wancll_admin_tokens` VALUES ('53', '2', '2', 'pc', 'admin&pc@0ec7cdd11acd627688c1844a1518ca9c', 'admin&pc@f6692415d3a385b3b6375d6d64ff0243', '7200', '1', '2018-07-03 09:12:32', '2018-07-03 09:12:32');
INSERT INTO `wancll_admin_tokens` VALUES ('54', '2', '2', 'pc', 'admin&pc@e1769b94ad298acb1972b3e31de82372', 'admin&pc@fc6b91b6328be3929705cd6e7da3c2f9', '7200', '1', '2018-07-03 15:40:30', '2018-07-03 15:40:30');
INSERT INTO `wancll_admin_tokens` VALUES ('58', '2', '2', 'pc', 'admin&pc@fa98d7f825148dcb8011f6355fbb40ef', 'admin&pc@0daff4c0c22625306fbf933cb7c01767', '7200', '1', '2018-07-05 09:48:32', '2018-07-05 09:48:32');
INSERT INTO `wancll_admin_tokens` VALUES ('59', '2', '2', 'pc', 'admin&pc@27f1b334baeb638c23d634cb7a074b38', 'admin&pc@2dedc5c5be5f93b2bf6c4e6cab0f9fb8', '7200', '1', '2018-07-05 09:57:35', '2018-07-05 09:57:35');
INSERT INTO `wancll_admin_tokens` VALUES ('64', '2', '2', 'pc', 'admin&pc@e9ce97b2080857b4ec0dbc2fd2836f5c', 'admin&pc@95bbb775696ee267a8ddeeaa8c09e81d', '7200', '1', '2018-07-06 11:10:26', '2018-07-06 11:10:26');
INSERT INTO `wancll_admin_tokens` VALUES ('61', '2', '2', 'pc', 'admin&pc@b4228fcb24c3a1e921435a0df580bdad', 'admin&pc@5dd4cfc1e355749d870b726e76a8f6e5', '7200', '1', '2018-07-05 11:30:06', '2018-07-05 11:30:06');
INSERT INTO `wancll_admin_tokens` VALUES ('63', '2', '2', 'pc', 'admin&pc@88b5ba95eef4172fa117fdb4eb20b766', 'admin&pc@8f199afe5de9fb262db041d82cf58fbf', '7200', '1', '2018-07-05 21:40:06', '2018-07-05 21:40:06');
INSERT INTO `wancll_admin_tokens` VALUES ('65', '2', '2', 'pc', 'admin&pc@5f3c0e3751658f7ae6da820d4c4575f8', 'admin&pc@b4bdc3760193d5bf3f6039bcc1aaf5c6', '7200', '1', '2018-07-06 11:19:36', '2018-07-06 11:19:36');
INSERT INTO `wancll_admin_tokens` VALUES ('66', '2', '2', 'pc', 'admin&pc@d462f311439d0ad982ca795abd22a00f', 'admin&pc@8e2b494f2ff709a0f4d5810298e31add', '7200', '1', '2018-07-10 11:52:24', '2018-07-10 11:52:24');
INSERT INTO `wancll_admin_tokens` VALUES ('75', '2', '2', 'pc', 'admin&pc@dc7d4fc2fd2052135f0487f8a9eb4d76', 'admin&pc@c4edcf4a235ca2f52befa409368cf019', '7200', '1', '2018-07-17 11:43:43', '2018-07-17 11:43:43');
INSERT INTO `wancll_admin_tokens` VALUES ('68', '2', '2', 'pc', 'admin&pc@8bc2d9fb4705f9157f2be9bb81fa9477', 'admin&pc@df48f02b064f498d54ce7a941b1f06e5', '7200', '1', '2018-07-13 16:37:13', '2018-07-13 16:37:13');
INSERT INTO `wancll_admin_tokens` VALUES ('69', '2', '2', 'pc', 'admin&pc@7ee0e5b4ea8146fa8c6667b6dfee93cd', 'admin&pc@cfa87a0e402128a9e5231c63ac440ad6', '7200', '1', '2018-07-13 16:38:12', '2018-07-13 16:38:12');
INSERT INTO `wancll_admin_tokens` VALUES ('70', '2', '2', 'pc', 'admin&pc@0f48ebac12104b39e64edcd07ed79272', 'admin&pc@c873a518cecfc0ed9910d38ed2299359', '7200', '1', '2018-07-13 16:38:46', '2018-07-13 16:38:46');
INSERT INTO `wancll_admin_tokens` VALUES ('71', '2', '2', 'pc', 'admin&pc@19558f57bda7404b4701fe118d5dc72f', 'admin&pc@fa3cfbfe8975ab740f1c051766a77080', '7200', '1', '2018-07-13 16:42:08', '2018-07-13 16:42:08');
INSERT INTO `wancll_admin_tokens` VALUES ('73', '2', '2', 'pc', 'admin&pc@02afa639f6c8c92273da16a2895f2699', 'admin&pc@9293e71b3acc8b7c93d058551700c3c7', '7200', '1', '2018-07-14 17:29:50', '2018-07-14 17:29:50');
INSERT INTO `wancll_admin_tokens` VALUES ('76', '2', '2', 'pc', 'admin&pc@0d37a54714456d91d19d7bbabe554042', 'admin&pc@e013c3aac1a722f1960581c5def8b3bc', '7200', '1', '2018-07-17 14:40:50', '2018-07-17 14:40:50');
INSERT INTO `wancll_admin_tokens` VALUES ('77', '2', '2', 'pc', 'admin&pc@40605dbb5a2b542738e736090a4b896b', 'admin&pc@9fb7e5d615d7c7ee8db7af3bff9afd36', '7200', '1', '2018-07-17 14:41:07', '2018-07-17 14:41:07');
INSERT INTO `wancll_admin_tokens` VALUES ('78', '2', '2', 'pc', 'admin&pc@ec48230837073dfb99635e06321fb087', 'admin&pc@deb6268efb4bc3869f82a3c11089083b', '7200', '1', '2018-07-18 17:13:36', '2018-07-18 17:13:36');
INSERT INTO `wancll_admin_tokens` VALUES ('79', '2', '2', 'pc', 'admin&pc@ec32006681e3109bf56762a9bca323ab', 'admin&pc@2c1225a205ff4f2d66281909789de582', '7200', '1', '2018-07-19 09:49:57', '2018-07-19 09:49:57');
INSERT INTO `wancll_admin_tokens` VALUES ('80', '2', '2', 'pc', 'admin&pc@bce2d0fd2c6d9bd3157c8e702bf0d8d9', 'admin&pc@e04245ebf3c830aed5dc2c8ef397fb3a', '7200', '1', '2018-07-19 16:00:32', '2018-07-19 16:00:32');

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
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admin_visit_logs`
-- -----------------------------
INSERT INTO `wancll_admin_visit_logs` VALUES ('1', '2', '2', '192.168.31.183', '2018-06-28 15:54:29', 'pc', '1', '2018-06-28 15:54:29', '2018-06-28 15:54:29');
INSERT INTO `wancll_admin_visit_logs` VALUES ('2', '2', '2', '192.168.31.60', '2018-06-28 16:00:17', 'pc', '1', '2018-06-28 16:00:17', '2018-06-28 16:00:17');
INSERT INTO `wancll_admin_visit_logs` VALUES ('3', '2', '2', '192.168.31.60', '2018-06-28 17:01:11', 'pc', '1', '2018-06-28 17:01:11', '2018-06-28 17:01:11');
INSERT INTO `wancll_admin_visit_logs` VALUES ('4', '2', '2', '192.168.31.23', '2018-06-28 17:04:42', 'pc', '1', '2018-06-28 17:04:42', '2018-06-28 17:04:42');
INSERT INTO `wancll_admin_visit_logs` VALUES ('5', '2', '2', '192.168.31.60', '2018-06-29 11:29:03', 'pc', '1', '2018-06-29 11:29:03', '2018-06-29 11:29:03');
INSERT INTO `wancll_admin_visit_logs` VALUES ('6', '2', '2', '192.168.31.60', '2018-06-29 11:29:31', 'pc', '1', '2018-06-29 11:29:31', '2018-06-29 11:29:31');
INSERT INTO `wancll_admin_visit_logs` VALUES ('7', '2', '2', '192.168.31.60', '2018-06-29 11:31:44', 'pc', '1', '2018-06-29 11:31:44', '2018-06-29 11:31:44');
INSERT INTO `wancll_admin_visit_logs` VALUES ('8', '2', '2', '192.168.31.183', '2018-06-29 13:47:23', 'pc', '1', '2018-06-29 13:47:23', '2018-06-29 13:47:23');
INSERT INTO `wancll_admin_visit_logs` VALUES ('9', '2', '2', '192.168.31.60', '2018-06-29 15:51:22', 'pc', '1', '2018-06-29 15:51:22', '2018-06-29 15:51:22');
INSERT INTO `wancll_admin_visit_logs` VALUES ('10', '2', '2', '192.168.31.60', '2018-06-29 15:51:51', 'pc', '1', '2018-06-29 15:51:51', '2018-06-29 15:51:51');
INSERT INTO `wancll_admin_visit_logs` VALUES ('11', '2', '2', '192.168.31.183', '2018-06-29 15:55:40', 'pc', '1', '2018-06-29 15:55:40', '2018-06-29 15:55:40');
INSERT INTO `wancll_admin_visit_logs` VALUES ('12', '2', '2', '192.168.31.183', '2018-06-29 20:10:41', 'pc', '1', '2018-06-29 20:10:41', '2018-06-29 20:10:41');
INSERT INTO `wancll_admin_visit_logs` VALUES ('13', '2', '2', '127.0.0.1', '2018-06-29 20:31:20', 'pc', '1', '2018-06-29 20:31:20', '2018-06-29 20:31:20');
INSERT INTO `wancll_admin_visit_logs` VALUES ('14', '2', '2', '127.0.0.1', '2018-06-29 20:59:22', 'pc', '1', '2018-06-29 20:59:22', '2018-06-29 20:59:22');
INSERT INTO `wancll_admin_visit_logs` VALUES ('15', '2', '2', '192.168.31.60', '2018-06-29 21:33:21', 'pc', '1', '2018-06-29 21:33:21', '2018-06-29 21:33:21');
INSERT INTO `wancll_admin_visit_logs` VALUES ('16', '2', '2', '192.168.31.60', '2018-06-29 22:39:09', 'pc', '1', '2018-06-29 22:39:09', '2018-06-29 22:39:09');
INSERT INTO `wancll_admin_visit_logs` VALUES ('17', '2', '2', '192.168.31.60', '2018-06-29 22:39:50', 'pc', '1', '2018-06-29 22:39:50', '2018-06-29 22:39:50');
INSERT INTO `wancll_admin_visit_logs` VALUES ('18', '2', '2', '192.168.31.60', '2018-06-29 22:42:04', 'pc', '1', '2018-06-29 22:42:04', '2018-06-29 22:42:04');
INSERT INTO `wancll_admin_visit_logs` VALUES ('19', '2', '2', '127.0.0.1', '2018-06-30 09:03:17', 'pc', '1', '2018-06-30 09:03:17', '2018-06-30 09:03:17');
INSERT INTO `wancll_admin_visit_logs` VALUES ('20', '2', '2', '192.168.31.60', '2018-06-30 09:30:43', 'pc', '1', '2018-06-30 09:30:43', '2018-06-30 09:30:43');
INSERT INTO `wancll_admin_visit_logs` VALUES ('21', '2', '2', '192.168.31.60', '2018-06-30 09:31:44', 'pc', '1', '2018-06-30 09:31:44', '2018-06-30 09:31:44');
INSERT INTO `wancll_admin_visit_logs` VALUES ('22', '2', '2', '192.168.31.60', '2018-06-30 09:33:04', 'pc', '1', '2018-06-30 09:33:04', '2018-06-30 09:33:04');
INSERT INTO `wancll_admin_visit_logs` VALUES ('23', '2', '2', '192.168.31.60', '2018-06-30 09:33:39', 'pc', '1', '2018-06-30 09:33:39', '2018-06-30 09:33:39');
INSERT INTO `wancll_admin_visit_logs` VALUES ('24', '2', '2', '192.168.31.60', '2018-06-30 10:08:22', 'pc', '1', '2018-06-30 10:08:22', '2018-06-30 10:08:22');
INSERT INTO `wancll_admin_visit_logs` VALUES ('25', '2', '2', '192.168.31.60', '2018-06-30 13:59:08', 'pc', '1', '2018-06-30 13:59:08', '2018-06-30 13:59:08');
INSERT INTO `wancll_admin_visit_logs` VALUES ('26', '2', '2', '192.168.31.60', '2018-06-30 15:12:35', 'pc', '1', '2018-06-30 15:12:35', '2018-06-30 15:12:35');
INSERT INTO `wancll_admin_visit_logs` VALUES ('27', '2', '2', '192.168.31.60', '2018-06-30 15:12:56', 'pc', '1', '2018-06-30 15:12:56', '2018-06-30 15:12:56');
INSERT INTO `wancll_admin_visit_logs` VALUES ('28', '2', '2', '192.168.31.60', '2018-06-30 15:28:50', 'pc', '1', '2018-06-30 15:28:50', '2018-06-30 15:28:50');
INSERT INTO `wancll_admin_visit_logs` VALUES ('29', '2', '2', '192.168.31.60', '2018-06-30 15:29:08', 'pc', '1', '2018-06-30 15:29:08', '2018-06-30 15:29:08');
INSERT INTO `wancll_admin_visit_logs` VALUES ('30', '2', '2', '192.168.31.60', '2018-06-30 15:33:15', 'pc', '1', '2018-06-30 15:33:15', '2018-06-30 15:33:15');
INSERT INTO `wancll_admin_visit_logs` VALUES ('31', '2', '2', '192.168.31.183', '2018-06-30 16:08:27', 'pc', '1', '2018-06-30 16:08:27', '2018-06-30 16:08:27');
INSERT INTO `wancll_admin_visit_logs` VALUES ('32', '2', '2', '127.0.0.1', '2018-06-30 16:25:55', 'pc', '1', '2018-06-30 16:25:55', '2018-06-30 16:25:55');
INSERT INTO `wancll_admin_visit_logs` VALUES ('33', '2', '2', '192.168.31.183', '2018-06-30 16:26:51', 'pc', '1', '2018-06-30 16:26:51', '2018-06-30 16:26:51');
INSERT INTO `wancll_admin_visit_logs` VALUES ('34', '2', '2', '192.168.31.183', '2018-06-30 17:04:47', 'pc', '1', '2018-06-30 17:04:47', '2018-06-30 17:04:47');
INSERT INTO `wancll_admin_visit_logs` VALUES ('35', '2', '2', '127.0.0.1', '2018-07-02 08:33:54', 'pc', '1', '2018-07-02 08:33:54', '2018-07-02 08:33:54');
INSERT INTO `wancll_admin_visit_logs` VALUES ('36', '2', '2', '192.168.31.60', '2018-07-02 09:11:06', 'pc', '1', '2018-07-02 09:11:06', '2018-07-02 09:11:06');
INSERT INTO `wancll_admin_visit_logs` VALUES ('37', '2', '2', '192.168.31.183', '2018-07-02 13:48:05', 'pc', '1', '2018-07-02 13:48:05', '2018-07-02 13:48:05');
INSERT INTO `wancll_admin_visit_logs` VALUES ('38', '2', '2', '192.168.31.183', '2018-07-02 17:14:52', 'pc', '1', '2018-07-02 17:14:52', '2018-07-02 17:14:52');
INSERT INTO `wancll_admin_visit_logs` VALUES ('39', '2', '2', '192.168.31.60', '2018-07-02 18:03:29', 'pc', '1', '2018-07-02 18:03:29', '2018-07-02 18:03:29');
INSERT INTO `wancll_admin_visit_logs` VALUES ('40', '2', '2', '192.168.31.60', '2018-07-02 18:04:09', 'pc', '1', '2018-07-02 18:04:09', '2018-07-02 18:04:09');
INSERT INTO `wancll_admin_visit_logs` VALUES ('41', '2', '2', '192.168.31.60', '2018-07-02 21:06:33', 'pc', '1', '2018-07-02 21:06:33', '2018-07-02 21:06:33');
INSERT INTO `wancll_admin_visit_logs` VALUES ('42', '2', '2', '192.168.31.183', '2018-07-02 22:32:37', 'pc', '1', '2018-07-02 22:32:37', '2018-07-02 22:32:37');
INSERT INTO `wancll_admin_visit_logs` VALUES ('43', '2', '2', '192.168.31.60', '2018-07-02 23:49:51', 'pc', '1', '2018-07-02 23:49:51', '2018-07-02 23:49:51');
INSERT INTO `wancll_admin_visit_logs` VALUES ('44', '2', '2', '192.168.31.60', '2018-07-02 23:52:48', 'pc', '1', '2018-07-02 23:52:48', '2018-07-02 23:52:48');
INSERT INTO `wancll_admin_visit_logs` VALUES ('45', '2', '2', '192.168.31.60', '2018-07-02 23:55:27', 'pc', '1', '2018-07-02 23:55:27', '2018-07-02 23:55:27');
INSERT INTO `wancll_admin_visit_logs` VALUES ('46', '2', '2', '127.0.0.1', '2018-07-03 08:45:35', 'pc', '1', '2018-07-03 08:45:35', '2018-07-03 08:45:35');
INSERT INTO `wancll_admin_visit_logs` VALUES ('47', '2', '2', '192.168.31.60', '2018-07-03 09:12:32', 'pc', '1', '2018-07-03 09:12:32', '2018-07-03 09:12:32');
INSERT INTO `wancll_admin_visit_logs` VALUES ('48', '2', '2', '192.168.31.49', '2018-07-03 15:40:30', 'pc', '1', '2018-07-03 15:40:30', '2018-07-03 15:40:30');
INSERT INTO `wancll_admin_visit_logs` VALUES ('49', '2', '2', '127.0.0.1', '2018-07-04 08:51:45', 'pc', '1', '2018-07-04 08:51:45', '2018-07-04 08:51:45');
INSERT INTO `wancll_admin_visit_logs` VALUES ('50', '2', '2', '192.168.31.60', '2018-07-04 09:20:04', 'pc', '1', '2018-07-04 09:20:04', '2018-07-04 09:20:04');
INSERT INTO `wancll_admin_visit_logs` VALUES ('51', '2', '2', '127.0.0.1', '2018-07-05 09:32:08', 'pc', '1', '2018-07-05 09:32:08', '2018-07-05 09:32:08');
INSERT INTO `wancll_admin_visit_logs` VALUES ('52', '2', '2', '192.168.31.60', '2018-07-05 09:48:32', 'pc', '1', '2018-07-05 09:48:32', '2018-07-05 09:48:32');
INSERT INTO `wancll_admin_visit_logs` VALUES ('53', '2', '2', '192.168.31.60', '2018-07-05 09:57:35', 'pc', '1', '2018-07-05 09:57:35', '2018-07-05 09:57:35');
INSERT INTO `wancll_admin_visit_logs` VALUES ('54', '2', '2', '192.168.31.60', '2018-07-05 09:58:09', 'pc', '1', '2018-07-05 09:58:09', '2018-07-05 09:58:09');
INSERT INTO `wancll_admin_visit_logs` VALUES ('55', '2', '2', '192.168.31.91', '2018-07-05 11:30:06', 'pc', '1', '2018-07-05 11:30:06', '2018-07-05 11:30:06');
INSERT INTO `wancll_admin_visit_logs` VALUES ('56', '2', '2', '192.168.31.183', '2018-07-05 11:38:06', 'pc', '1', '2018-07-05 11:38:06', '2018-07-05 11:38:06');
INSERT INTO `wancll_admin_visit_logs` VALUES ('57', '2', '2', '127.0.0.1', '2018-07-05 21:40:06', 'pc', '1', '2018-07-05 21:40:06', '2018-07-05 21:40:06');
INSERT INTO `wancll_admin_visit_logs` VALUES ('58', '2', '2', '192.168.31.60', '2018-07-06 11:10:26', 'pc', '1', '2018-07-06 11:10:26', '2018-07-06 11:10:26');
INSERT INTO `wancll_admin_visit_logs` VALUES ('59', '2', '2', '127.0.0.1', '2018-07-06 11:19:36', 'pc', '1', '2018-07-06 11:19:36', '2018-07-06 11:19:36');
INSERT INTO `wancll_admin_visit_logs` VALUES ('60', '2', '2', '127.0.0.1', '2018-07-10 11:52:24', 'pc', '1', '2018-07-10 11:52:24', '2018-07-10 11:52:24');
INSERT INTO `wancll_admin_visit_logs` VALUES ('61', '2', '2', '127.0.0.1', '2018-07-13 13:52:14', 'pc', '1', '2018-07-13 13:52:14', '2018-07-13 13:52:14');
INSERT INTO `wancll_admin_visit_logs` VALUES ('62', '2', '2', '192.168.31.60', '2018-07-13 16:37:13', 'pc', '1', '2018-07-13 16:37:13', '2018-07-13 16:37:13');
INSERT INTO `wancll_admin_visit_logs` VALUES ('63', '2', '2', '192.168.31.60', '2018-07-13 16:38:12', 'pc', '1', '2018-07-13 16:38:12', '2018-07-13 16:38:12');
INSERT INTO `wancll_admin_visit_logs` VALUES ('64', '2', '2', '192.168.31.60', '2018-07-13 16:38:46', 'pc', '1', '2018-07-13 16:38:46', '2018-07-13 16:38:46');
INSERT INTO `wancll_admin_visit_logs` VALUES ('65', '2', '2', '192.168.31.60', '2018-07-13 16:42:08', 'pc', '1', '2018-07-13 16:42:08', '2018-07-13 16:42:08');
INSERT INTO `wancll_admin_visit_logs` VALUES ('66', '2', '2', '127.0.0.1', '2018-07-13 17:28:54', 'pc', '1', '2018-07-13 17:28:54', '2018-07-13 17:28:54');
INSERT INTO `wancll_admin_visit_logs` VALUES ('67', '2', '2', '127.0.0.1', '2018-07-14 17:29:50', 'pc', '1', '2018-07-14 17:29:50', '2018-07-14 17:29:50');
INSERT INTO `wancll_admin_visit_logs` VALUES ('68', '2', '2', '175.8.205.220', '2018-07-15 12:34:09', 'pc', '1', '2018-07-15 12:34:09', '2018-07-15 12:34:09');
INSERT INTO `wancll_admin_visit_logs` VALUES ('69', '2', '2', '113.247.14.87', '2018-07-17 11:43:43', 'pc', '1', '2018-07-17 11:43:43', '2018-07-17 11:43:43');
INSERT INTO `wancll_admin_visit_logs` VALUES ('70', '2', '2', '113.247.14.87', '2018-07-17 14:40:50', 'pc', '1', '2018-07-17 14:40:50', '2018-07-17 14:40:50');
INSERT INTO `wancll_admin_visit_logs` VALUES ('71', '2', '2', '113.247.14.87', '2018-07-17 14:41:07', 'pc', '1', '2018-07-17 14:41:07', '2018-07-17 14:41:07');
INSERT INTO `wancll_admin_visit_logs` VALUES ('72', '2', '2', '113.247.51.216', '2018-07-18 17:13:36', 'pc', '1', '2018-07-18 17:13:36', '2018-07-18 17:13:36');
INSERT INTO `wancll_admin_visit_logs` VALUES ('73', '2', '2', '113.247.51.216', '2018-07-19 09:49:57', 'pc', '1', '2018-07-19 09:49:57', '2018-07-19 09:49:57');
INSERT INTO `wancll_admin_visit_logs` VALUES ('74', '2', '2', '113.247.51.216', '2018-07-19 16:00:32', 'pc', '1', '2018-07-19 16:00:32', '2018-07-19 16:00:32');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_admins`
-- -----------------------------
INSERT INTO `wancll_admins` VALUES ('1', '', '', '', 'yiyun', '', '', '', '', '', '', '[3]', '1', '1', '2018-04-10 16:40:36', '2018-04-11 16:46:56');
INSERT INTO `wancll_admins` VALUES ('2', '18888888888', '', '', 'admin', '/public/upload/user_images/20180630\\c562e513c3d3e7af2f1e9fcf4f1e052f.png', '', '', '', '', '', '[3]', '1', '1', '2018-04-10 16:40:48', '2018-04-11 16:46:56');
INSERT INTO `wancll_admins` VALUES ('3', '', '', '', 'test', '', '', '', '', '', '', '\"\"', '1', '0', '2018-04-11 10:22:20', '2018-04-11 10:30:41');
INSERT INTO `wancll_admins` VALUES ('4', '', '', '', 'test', '', '', '', '', '', '', '\"\"', '1', '1', '2018-04-11 14:09:07', '2018-04-11 16:46:56');
INSERT INTO `wancll_admins` VALUES ('5', '18888888881', '', '', '1231', '/public/upload/user_avatar_images/20180629\\ab37000fab1f28d08476b722a2c9aca3.png', '188888888888', '', '', 'afdf@fadf.fga', 'fdafadfadsfdasfsd', '[3]', '1', '1', '2018-06-29 11:59:02', '2018-06-29 11:59:02');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_bonus_levels`
-- -----------------------------
INSERT INTO `wancll_bonus_levels` VALUES ('1', '0', '会员分红商', '1.00', '0', '1', '1', '2018-06-03 17:47:53', '2018-06-03 17:47:53');
INSERT INTO `wancll_bonus_levels` VALUES ('2', '1', '主管分红商', '6.00', '30', '1', '1', '2018-06-03 17:49:02', '2018-06-03 17:49:02');
INSERT INTO `wancll_bonus_levels` VALUES ('3', '2', '经理分红商', '5.00', '12', '1', '1', '2018-06-03 17:50:11', '2018-06-03 17:50:11');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_categories`
-- -----------------------------
INSERT INTO `wancll_categories` VALUES ('1', '0', '广告类别', '50', '1', '1', '2018-06-28 14:20:08', '2018-06-29 21:12:36');
INSERT INTO `wancll_categories` VALUES ('2', '1', '文章广告', '0', '1', '1', '2018-06-28 14:20:18', '2018-06-29 22:20:28');
INSERT INTO `wancll_categories` VALUES ('3', '1', '营销广告', '3', '1', '1', '2018-06-29 15:51:20', '2018-06-29 15:51:20');
INSERT INTO `wancll_categories` VALUES ('4', '1', '产品广告', '1', '1', '1', '2018-06-29 16:23:08', '2018-06-29 16:23:08');
INSERT INTO `wancll_categories` VALUES ('5', '0', '通知公告类别', '40', '1', '1', '2018-06-29 21:25:13', '2018-06-30 09:15:24');
INSERT INTO `wancll_categories` VALUES ('6', '5', '系统公告', '0', '1', '1', '2018-06-29 21:25:42', '2018-06-29 21:25:42');
INSERT INTO `wancll_categories` VALUES ('7', '5', '产品公告', '0', '1', '1', '2018-06-29 21:26:07', '2018-06-29 21:26:07');
INSERT INTO `wancll_categories` VALUES ('8', '5', '升级公告', '0', '1', '1', '2018-06-29 21:26:34', '2018-06-29 21:26:34');
INSERT INTO `wancll_categories` VALUES ('9', '0', '轮播图类别', '30', '1', '1', '2018-06-29 21:26:52', '2018-06-29 21:26:52');
INSERT INTO `wancll_categories` VALUES ('10', '9', 'PC端轮播图', '0', '1', '1', '2018-06-29 21:27:15', '2018-06-29 21:27:15');
INSERT INTO `wancll_categories` VALUES ('11', '9', 'WAP端轮播图', '0', '2', '1', '2018-06-29 21:27:33', '2018-06-30 09:15:45');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_group_buy_system_goods`
-- -----------------------------
INSERT INTO `wancll_group_buy_system_goods` VALUES ('1', '1', '2018-07-06 10:08:58', '2018-07-13 00:00:00', '2', '100.00', '39', '1', '[{\"spec_group_id_str\":\"8e7f9bb7a1818d488140d778e80b9ab4\",\"person_num\":\"2\",\"money\":0,\"stock\":\"20\",\"spec_option_group\":\"M_1.5寸\"},{\"spec_group_id_str\":\"559d9acd6828cbbea8ba55c4fac29058\",\"person_num\":\"2\",\"money\":0,\"stock\":19,\"spec_option_group\":\"M_2.0寸\"}]', '0', '1', '1', '2018-07-06 10:10:07', '2018-07-06 11:11:16');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_group_buy_user_goods`
-- -----------------------------
INSERT INTO `wancll_group_buy_user_goods` VALUES ('1', '1', '2.00', '2', '10.00', '37', '1', '[{\"spec_group_id_str\":\"559d9acd6828cbbea8ba55c4fac29058\",\"person_num\":\"2\",\"money\":\"10\",\"stock\":17,\"spec_option_group\":\"M_2.0寸\"},{\"spec_group_id_str\":\"8e7f9bb7a1818d488140d778e80b9ab4\",\"person_num\":\"2\",\"money\":\"10\",\"stock\":\"20\",\"spec_option_group\":\"M_1.5寸\"}]', '0', '1', '1', '2018-07-06 10:19:22', '2018-07-06 10:45:51');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

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
INSERT INTO `wancll_navs` VALUES ('81', '分销管理', '', 'icon-tixian', '', '', '', '', '400', '0', '0', '1', '1', '2017-12-27 10:49:50', '2018-02-23 22:47:25');
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
INSERT INTO `wancll_navs` VALUES ('132', '分红管理', '', 'icon-shouhou', '', '', '', '', '300', '0', '0', '1', '1', '2018-04-27 09:26:02', '2018-04-27 09:26:02');
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
INSERT INTO `wancll_navs` VALUES ('146', '积分商城', '', 'icon-jifenshangcheng', '', '', '', '', '490', '0', '0', '1', '1', '2018-06-29 22:32:15', '2018-06-29 22:32:15');
INSERT INTO `wancll_navs` VALUES ('147', '团购管理', '', 'icon-daohangtuangou', '', '', '', '', '480', '0', '0', '1', '1', '2018-06-29 22:32:42', '2018-06-29 22:32:42');
INSERT INTO `wancll_navs` VALUES ('148', '积分商品管理', '', '', 'admin', 'score_shop', 'goods_list', '', '40', '146', '0', '1', '1', '2018-06-29 22:33:25', '2018-06-29 22:33:25');
INSERT INTO `wancll_navs` VALUES ('149', '系统团购商品设置', '', '', 'admin', 'group_shop', 'system_goods_list', '', '40', '147', '0', '1', '1', '2018-06-29 22:34:22', '2018-06-29 22:34:22');
INSERT INTO `wancll_navs` VALUES ('150', '积分商城配置', '', '', 'admin', 'score_shop', 'params', '', '50', '146', '0', '1', '1', '2018-06-30 15:12:10', '2018-06-30 15:12:10');
INSERT INTO `wancll_navs` VALUES ('151', '团购配置', '', '', 'admin', 'group_shop', 'params', '', '50', '147', '0', '1', '1', '2018-06-30 15:28:42', '2018-06-30 15:28:42');
INSERT INTO `wancll_navs` VALUES ('152', '积分订单管理', '', '', 'admin', 'score_shop', 'orders', '', '30', '146', '0', '1', '1', '2018-07-02 18:03:21', '2018-07-02 18:03:21');
INSERT INTO `wancll_navs` VALUES ('153', '会员团购商品设置', '', '', 'admin', 'group_shop', 'member_goods_list', '', '0', '147', '0', '1', '1', '2018-07-05 09:57:28', '2018-07-05 09:57:28');
INSERT INTO `wancll_navs` VALUES ('154', '定时任务管理', '', '', 'admin', 'system', 'time_task', '', '0', '22', '0', '1', '1', '2018-07-13 16:56:27', '2018-07-13 16:56:27');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
  `group_buy_status` tinyint(1) DEFAULT '1' COMMENT '团购状态：1等待拼团2限时拼团失败3拼团成功4拼团失败已自动退款',
  `status` tinyint(1) DEFAULT '1' COMMENT '订单状态：1待付款2已付款待发货3已发货待收货4已确认收货9已取消',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`,`order_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
INSERT INTO `wancll_role_nav_powers` VALUES ('2', '[91,92,93,36,94,1,2,112,75,113,33,43,44,45,100,101,102,46,47,48,49,76,77,90,78,81,83,82,86,130,22,29,70,27,23,24,34,103,105,104,37,18,19,38,39,42,32,21]', '1', '2018-04-04 10:57:01', '2018-06-29 14:45:59');
INSERT INTO `wancll_role_nav_powers` VALUES ('3', '[91,92,93,36,94,1,2,112,75,113,129,128,33,140,114,115,116,119,118,117,43,44,45,100,101,102,46,47,48,49,76,77,90,78,121,122,127,125,124,146,150,148,152,147,151,149,153,81,83,82,131,86,130,141,132,134,133,137,136,138,139,135,142,22,29,70,27,23,24,34,143,103,105,154,126,104,37,18,38,39,42,32,21]', '1', '2018-04-04 10:57:34', '2018-07-13 16:57:09');
INSERT INTO `wancll_role_nav_powers` VALUES ('4', '[]', '1', '2018-04-05 17:57:18', '2018-04-05 17:57:18');
INSERT INTO `wancll_role_nav_powers` VALUES ('5', '[]', '1', '2018-06-29 14:14:09', '2018-06-29 14:14:09');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_roles`
-- -----------------------------
INSERT INTO `wancll_roles` VALUES ('1', '会员', '会员通用角色', 'user', '1', '2018-04-04 10:55:37', '2018-04-04 10:55:37');
INSERT INTO `wancll_roles` VALUES ('2', '普通管理员', '普通管理员发', 'admin', '1', '2018-04-04 10:57:01', '2018-04-04 10:57:01');
INSERT INTO `wancll_roles` VALUES ('3', '超级管理员', '超级管理员', 'admin', '1', '2018-04-04 10:57:34', '2018-04-04 10:57:34');
INSERT INTO `wancll_roles` VALUES ('4', '运营管理员', '运营管理员的介绍', 'admin', '0', '2018-04-05 17:57:18', '2018-04-05 17:57:18');
INSERT INTO `wancll_roles` VALUES ('5', '测试', '法大师傅', 'admin', '0', '2018-06-29 14:14:09', '2018-06-29 14:14:43');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_spec_templates`
-- -----------------------------
INSERT INTO `wancll_spec_templates` VALUES ('2', '规格测试2', 'readme', '[{\"name\":\"内存\",\"options\":[\"3G\",\"4G\",\"fadgdg\"]}]', '0', '0', '2018-06-20 22:55:06', '2018-06-28 17:08:42');
INSERT INTO `wancll_spec_templates` VALUES ('3', '规格测试', 'readmefds', '[{\"name\":\"内存\",\"options\":[\"gd32423423\",\"4G\",\"5G\"]},{\"name\":\"尺寸\",\"options\":[\"1.4寸\",\"1.5寸\",\"1.6寸\"]}]', '0', '0', '2018-06-20 22:56:21', '2018-06-28 17:08:48');
INSERT INTO `wancll_spec_templates` VALUES ('5', '苹果规格模型', '苹果规格模型', '[{\"name\":\"尺码\",\"options\":[\"XL\",\"XXL\"]},{\"name\":\"颜色\",\"options\":[\"黑色\",\"白色\"]}]', '0', '1', '2018-06-28 17:10:59', '2018-06-28 17:10:59');
INSERT INTO `wancll_spec_templates` VALUES ('4', 'fda', 'dfasd', '[{\"name\":\"fadfa\",\"options\":[\"fdsaf\",\"fds\",\"fgsdfgsdgsdf\"]},{\"name\":\"dfsagg\",\"options\":[\"fasdf\",\"dfasf\",\"fdgh\"]}]', '0', '0', '2018-06-23 20:28:14', '2018-06-25 10:29:09');

-- -----------------------------
-- Table structure for `wancll_test`
-- -----------------------------
DROP TABLE IF EXISTS `wancll_test`;
CREATE TABLE `wancll_test` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text,
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_test`
-- -----------------------------
INSERT INTO `wancll_test` VALUES ('1', '[{\"id\":1,\"user_id\":1},{\"id\":2,\"user_id\":2}]', '1', '2018-07-19 15:02:09', '');
INSERT INTO `wancll_test` VALUES ('2', '[{\"id\":1,\"user_id\":1},{\"id\":2,\"user_id\":2}]', '1', '2018-07-19 15:03:16', '');
INSERT INTO `wancll_test` VALUES ('3', '[{\"id\":1,\"user_id\":1},{\"id\":2,\"user_id\":2}]', '1', '2018-07-19 23:10:09', '2018-07-19 23:10:09');

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
INSERT INTO `wancll_timed_tasks` VALUES ('1', '自动取消订单', '每天检测一次，对下订单满规定天数仍未支付的订单，系统自动取消该订单。', 'day', '1', 'CancelOrders', '2018-07-19 23:00:00', '0', '5b50a00b02eea', '2', '1', '2018-07-19 22:07:21', '2018-07-19 22:07:21');
INSERT INTO `wancll_timed_tasks` VALUES ('2', '自动删除订单', '每天检测一次，对已取消的订单满规定天数后，系统自动删除该订单。', 'day', '1', 'DeleteOrders', '2018-07-19 23:10:00', '0', '5b50a04e902c3', '2', '1', '2018-07-19 22:11:59', '2018-07-19 22:11:59');
INSERT INTO `wancll_timed_tasks` VALUES ('3', '自动签收订单', '每天检测一次，对已发货的订单满规定天数会员仍未进行签收的订单，系统自动签收该订单。', 'day', '1', 'SignOrders', '2018-07-19 23:20:00', '0', '5b50a09823e79', '2', '1', '2018-07-19 22:14:49', '2018-07-19 22:14:49');
INSERT INTO `wancll_timed_tasks` VALUES ('4', '团购处理时限', '对已到结束时间，仍未完成的拼团的订单，自动结束该团。', 'minute', '1', 'GroupBuyTimeLimits', '2018-07-19 23:30:00', '0', '5b509f898f996', '2', '1', '2018-07-19 22:26:17', '2018-07-19 22:26:17');
INSERT INTO `wancll_timed_tasks` VALUES ('5', '团购自动退款', '每天检测一次，对团购中未完成拼团的订单，自动退款。', 'day', '1', 'GroupBuyReturnMoney', '2018-07-20 08:00:00', '0', '5b50b46e08b2f', '2', '1', '2018-07-19 22:33:04', '2018-07-19 22:33:04');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `wancll_user_levels`
-- -----------------------------
INSERT INTO `wancll_user_levels` VALUES ('1', '青铜会员', '10.00', '', '1', '1', '2018-04-17 15:55:03', '2018-04-17 15:55:03');
INSERT INTO `wancll_user_levels` VALUES ('2', '白银会员', '20.00', '', '1', '1', '2018-04-17 15:55:11', '2018-04-17 15:55:11');
INSERT INTO `wancll_user_levels` VALUES ('3', '黄金会员', '40.00', '', '1', '1', '2018-04-17 15:55:26', '2018-04-17 15:55:26');
INSERT INTO `wancll_user_levels` VALUES ('4', '普通会员', '0.00', '', '1', '1', '2018-04-17 20:42:51', '2018-04-17 20:42:51');
INSERT INTO `wancll_user_levels` VALUES ('5', '钻石会员', '1000.00', '', '1', '1', '2018-06-29 16:32:55', '2018-06-29 16:32:55');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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

