/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : panda-wechat

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-12-24 23:28:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_category
-- ----------------------------
DROP TABLE IF EXISTS `c_category`;
CREATE TABLE `c_category` (
  `id` varchar(36) NOT NULL,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `parent_id` varchar(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `icon_url` varchar(200) DEFAULT NULL,
  `modify_time` datetime NOT NULL,
  `type_desc` varchar(200) DEFAULT NULL,
  `choose_status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_category
-- ----------------------------

-- ----------------------------
-- Table structure for c_comment
-- ----------------------------
DROP TABLE IF EXISTS `c_comment`;
CREATE TABLE `c_comment` (
  `id` varchar(36) NOT NULL,
  `commodity_id` varchar(36) NOT NULL,
  `ooid` varchar(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `user_content` varchar(500) DEFAULT NULL,
  `user_id` varchar(36) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `source` int(11) DEFAULT '0',
  `com_status` int(11) NOT NULL DEFAULT '0',
  `com_star` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_comment
-- ----------------------------

-- ----------------------------
-- Table structure for c_information
-- ----------------------------
DROP TABLE IF EXISTS `c_information`;
CREATE TABLE `c_information` (
  `id` varchar(36) NOT NULL,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `editer_id` varchar(36) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `content` varchar(20000) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_id` varchar(36) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_id` varchar(36) NOT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `commodity_id` varchar(36) DEFAULT NULL,
  `source` int(11) DEFAULT '0',
  `info_mode` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `i18n` int(11) DEFAULT '1',
  `click_count` int(11) DEFAULT NULL,
  `lable_item` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_information
-- ----------------------------

-- ----------------------------
-- Table structure for c_products
-- ----------------------------
DROP TABLE IF EXISTS `c_products`;
CREATE TABLE `c_products` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(1) NOT NULL,
  `descriptin` varchar(200) DEFAULT NULL,
  `create_id` varchar(36) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_id` varchar(36) NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_products
-- ----------------------------
INSERT INTO `c_products` VALUES ('dc081d33-ee9d-4126-bcd5-9133ae82caf5', '绿茶产品1号', '1', '绿茶产品1号', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 12:45:22', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 12:45:22');
INSERT INTO `c_products` VALUES ('3a235d7d-b242-4ede-862d-ef0ccee122a6', '红茶产品2号', '1', '红茶产品2号', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 12:52:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 12:52:15');
INSERT INTO `c_products` VALUES ('5e0fb4f9-2b27-4c44-9e4a-71ae602dcebd', '黑茶产品3号', '1', '黑茶产品3号', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 13:00:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 13:00:30');

-- ----------------------------
-- Table structure for c_property
-- ----------------------------
DROP TABLE IF EXISTS `c_property`;
CREATE TABLE `c_property` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  `property_type` int(11) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_id` varchar(36) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of c_property
-- ----------------------------

-- ----------------------------
-- Table structure for c_provalue
-- ----------------------------
DROP TABLE IF EXISTS `c_provalue`;
CREATE TABLE `c_provalue` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `property_id` varchar(36) DEFAULT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_id` varchar(36) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `icon_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of c_provalue
-- ----------------------------

-- ----------------------------
-- Table structure for c_sku
-- ----------------------------
DROP TABLE IF EXISTS `c_sku`;
CREATE TABLE `c_sku` (
  `id` varchar(36) NOT NULL,
  `commodity_id` varchar(36) DEFAULT NULL,
  `counts` int(11) DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `original_price` double(15,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_id` varchar(36) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_id` varchar(36) DEFAULT NULL,
  `provalue_str` varchar(500) DEFAULT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  `customer_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_price` (`price`),
  KEY `index_modify_time` (`modify_time`),
  KEY `index_sku_category_status` (`status`,`category_id`,`id`),
  KEY `index_provalue_str` (`provalue_str`(255)),
  KEY `index_customerId_categoryId` (`category_id`) USING BTREE,
  KEY `Index_category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of c_sku
-- ----------------------------

-- ----------------------------
-- Table structure for c_skuvalue
-- ----------------------------
DROP TABLE IF EXISTS `c_skuvalue`;
CREATE TABLE `c_skuvalue` (
  `id` varchar(36) NOT NULL,
  `skuid` varchar(36) DEFAULT NULL,
  `property_id` varchar(36) DEFAULT NULL,
  `provalue_id` varchar(36) DEFAULT NULL,
  `provalue_name` varchar(36) DEFAULT NULL,
  `property_type` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_skuId` (`skuid`),
  KEY `index_propertyId` (`property_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_skuvalue
-- ----------------------------

-- ----------------------------
-- Table structure for e_assembly_set
-- ----------------------------
DROP TABLE IF EXISTS `e_assembly_set`;
CREATE TABLE `e_assembly_set` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `name` varchar(36) DEFAULT NULL COMMENT '生产线名称',
  `parent_id` varchar(36) NOT NULL COMMENT '父级ID',
  `machine_id` varchar(36) DEFAULT NULL COMMENT '设备id',
  `maintain_cycle` int(1) DEFAULT NULL COMMENT '保养周期',
  `maintain_clear` int(1) DEFAULT NULL COMMENT '清洁周期',
  `sort_id` int(1) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态 1，启用，2禁用',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_assembly_set
-- ----------------------------
INSERT INTO `e_assembly_set` VALUES ('1571ddff-e88c-11e7-a642-6045cb7f62f1', '绿茶生产线A', '10000000-0000-0000-0000-000000000000', '', '1', '1', '1', '1', '法国风格bb', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-24 17:24:25', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-24 17:24:29');
INSERT INTO `e_assembly_set` VALUES ('9d6b121a-cd21-458b-ba09-228fef1c11b1', null, 'a59a9b95-280c-4ee0-bd8d-77d0573d9dfc', '0ff0d8b3-a30b-4838-8ae4-645d62066d4e', null, null, '1', '1', '复', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-24 23:14:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-24 23:14:58');
INSERT INTO `e_assembly_set` VALUES ('a59a9b95-280c-4ee0-bd8d-77d0573d9dfc', '红茶生产线A', '10000000-0000-0000-0000-000000000000', null, '2', '2', '2', '1', '短短的', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-24 23:12:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-24 23:12:55');
INSERT INTO `e_assembly_set` VALUES ('c3f573bf-e489-4e48-b0d8-d65e3637852f', null, 'a59a9b95-280c-4ee0-bd8d-77d0573d9dfc', '395a1c75-e7ee-11e7-8011-6045cb7f62f1', null, null, '1', '1', '方法', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-24 23:22:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-24 23:22:13');

-- ----------------------------
-- Table structure for e_equipment
-- ----------------------------
DROP TABLE IF EXISTS `e_equipment`;
CREATE TABLE `e_equipment` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `unit_name` varchar(36) NOT NULL COMMENT '设备名称',
  `unit_no` varchar(36) NOT NULL COMMENT '设备编号',
  `unit_usage` varchar(36) NOT NULL COMMENT '设备用途',
  `unit_type` varchar(36) NOT NULL COMMENT '设备型号',
  `unit_cycle` int(1) NOT NULL COMMENT '保养周期',
  `unit_status` int(1) NOT NULL DEFAULT '0' COMMENT '是否绑定生产线,1绑定，2未绑定',
  `unit_clear` int(1) NOT NULL DEFAULT '0' COMMENT '清洁周期',
  `img_url` varchar(200) DEFAULT NULL COMMENT '设备图片',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_equipment
-- ----------------------------
INSERT INTO `e_equipment` VALUES ('0ff0d8b3-a30b-4838-8ae4-645d62066d4e', '发酵设备', 'unit-2', '发酵', '这70-1', '12', '0', '1', 'http://of8rkrh1w.bkt.clouddn.com/2017/12/24/blog4.jpg', '1', '', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-24 11:10:38', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-24 11:10:38');
INSERT INTO `e_equipment` VALUES ('395a1c75-e7ee-11e7-8011-6045cb7f62f1', '炒茶设备', 'unt-123', '炒茶', 'Z270-AR', '50', '0', '1', 'http://of8rkrh1w.bkt.clouddn.com/2017/12/24/blog5.jpg', '1', '炒茶设备Z270-AR', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 22:35:22', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 22:35:26');

-- ----------------------------
-- Table structure for e_harvest_records
-- ----------------------------
DROP TABLE IF EXISTS `e_harvest_records`;
CREATE TABLE `e_harvest_records` (
  `id` varchar(36) NOT NULL,
  `tea_garden_id` varchar(36) NOT NULL COMMENT '茶园ID',
  `dic_standard` varchar(36) NOT NULL COMMENT '字典采摘标准',
  `rec_quantity` double(9,2) NOT NULL COMMENT '采摘数量',
  `pick_number` varchar(36) NOT NULL COMMENT '(管理批次)',
  `pick_batch_no` varchar(36) NOT NULL,
  `pick_area` varchar(200) NOT NULL COMMENT '采摘区域',
  `pick_time` int(1) DEFAULT '0' COMMENT '采摘时间,1上午,2下午',
  `operator_id` varchar(36) DEFAULT NULL COMMENT '操作人',
  `description` varchar(200) DEFAULT NULL COMMENT '备注',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '是否已经加工(生成加工批次号后为1默认为0)',
  `create_id` varchar(36) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_harvest_records
-- ----------------------------
INSERT INTO `e_harvest_records` VALUES ('dbd0a12c-ac0c-4c68-b9d8-3821de372ebf', '8893e29b-d37b-11e7-b5d6-24fd52935962', '19c89bde-0a44-405e-b09e-a7220a8e627c', '120.00', '3eccf0b4-bdfc-47cb-b7c4-c883bd0a8ccc', ' B3SOG-2156602', 'eastward,southward,westward,northerliness,northeast,southeast,northwest,southwest', '2', '我', '说', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-22 15:50:42');

-- ----------------------------
-- Table structure for e_machin_set
-- ----------------------------
DROP TABLE IF EXISTS `e_machin_set`;
CREATE TABLE `e_machin_set` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `dic_mac_type` varchar(36) NOT NULL COMMENT '加工类型',
  `dic_tea_attr` varchar(36) NOT NULL COMMENT '茶系ID',
  `dic_mac_pro` varchar(36) NOT NULL COMMENT '工序ID',
  `dic_roll_type` varchar(36) DEFAULT NULL COMMENT '揉捻工序类型',
  `temperature` int(3) DEFAULT NULL COMMENT '温度',
  `humidity` int(2) DEFAULT NULL COMMENT '湿度',
  `mac_loss` int(2) DEFAULT NULL COMMENT '损耗',
  `begin_duration` int(2) DEFAULT NULL COMMENT '所需时长开始',
  `end_duration` int(2) DEFAULT NULL COMMENT '所需时长结束',
  `duration_type` int(1) DEFAULT NULL COMMENT '1m分,2h时,3d天',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态 1，启用，2禁用',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  `roll_status` int(1) NOT NULL DEFAULT '0' COMMENT '加工工序排期',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_machin_set
-- ----------------------------
INSERT INTO `e_machin_set` VALUES ('0c8ef491-3ee0-421b-84aa-746cd401663d', '5382c8cc-27ad-4b2e-8842-b1d194403753', '8a3e0d08-ca66-48b7-9924-b98d98fd193d', 'c307d686-7dce-4b2f-9efb-16fbeb348de6', '', '90', '0', null, '0', '90', '1', '1', '红茶半成品加工第七道工序', '7', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:39:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:39:06');
INSERT INTO `e_machin_set` VALUES ('186f2227-fb01-4cfc-aefc-0ad9e16f902b', '5382c8cc-27ad-4b2e-8842-b1d194403753', '8a3e0d08-ca66-48b7-9924-b98d98fd193d', '8aa97837-a152-49be-98b8-47a11c3b1de4', 'f0b5d672-b743-44ce-954d-2eefaf95b11a', '0', '0', null, '0', '35', '1', '1', '红茶半成品加工第三道工序', '3', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:22:05', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:22:05');
INSERT INTO `e_machin_set` VALUES ('1b0e362b-4006-4d7a-8a53-3055a8f4d322', '5382c8cc-27ad-4b2e-8842-b1d194403753', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', 'c307d686-7dce-4b2f-9efb-16fbeb348de6', '', '150', '0', null, '0', '90', '1', '1', '绿茶加工第八道工序，二次炒干', '9', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:36:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:36:26');
INSERT INTO `e_machin_set` VALUES ('21abfad1-734c-4a41-8b40-78e1cf696c7c', '5382c8cc-27ad-4b2e-8842-b1d194403753', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '01b33909-73b8-45d9-af2e-5f57a22895c1', '', '0', '0', null, '0', '0', '1', '1', '第八道工序，一次质检', '8', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:03:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:03:14');
INSERT INTO `e_machin_set` VALUES ('312f3670-b5a6-4370-9c73-b058d8f49512', '5382c8cc-27ad-4b2e-8842-b1d194403753', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', 'c307d686-7dce-4b2f-9efb-16fbeb348de6', '', '180', '0', null, '0', '8', '1', '1', '绿茶加工第七道工序，一次炒干', '7', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:33:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:33:29');
INSERT INTO `e_machin_set` VALUES ('35ed4386-98da-49f1-b15f-60e1b6b3ecbb', '5382c8cc-27ad-4b2e-8842-b1d194403753', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '590b26ce-356c-4a4f-82f3-b02aca313238', '', '0', '0', null, '0', '0', '1', '1', '绿茶加工第九道工序，筛选确定茶叶等级', '11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:41:32', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:41:32');
INSERT INTO `e_machin_set` VALUES ('37202115-6e12-48a7-8e8e-aff3827a2719', '5382c8cc-27ad-4b2e-8842-b1d194403753', '8a3e0d08-ca66-48b7-9924-b98d98fd193d', '8aa97837-a152-49be-98b8-47a11c3b1de4', 'da517c36-6812-4a9d-a4d4-38f633254656', '0', '0', null, '0', '35', '1', '1', '红茶半成品加工第四道工序', '4', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:22:36', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:22:36');
INSERT INTO `e_machin_set` VALUES ('55601ed9-d4c4-11e7-89ed-38d547b81379', '5382c8cc-27ad-4b2e-8842-b1d194403753', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '16595d6b-b5f0-4b49-970d-2c26c691e66a', '', '0', '0', '8', '9', '10', '2', '1', '绿茶第一道工序萎凋', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 13:15:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 13:15:37');
INSERT INTO `e_machin_set` VALUES ('5a6a2b09-4f7a-42a1-b58a-dce787ac1928', '4dc6f1b2-5bbb-4324-9d74-b318dab9e8a3', '8a3e0d08-ca66-48b7-9924-b98d98fd193d', 'f9e96bed-6103-4a14-9135-e69b7392dc78', '', '85', '0', null, '0', '1', '2', '1', '红茶复炒第九道工序', '9', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:41:25', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:41:25');
INSERT INTO `e_machin_set` VALUES ('68b1f56c-82df-4afe-bc06-d26017c891a1', '5382c8cc-27ad-4b2e-8842-b1d194403753', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '9ea19fba-8765-48f7-8a8a-b5ea412bda2e', '', '300', '0', null, '0', '3', '1', '1', '绿茶第二道工序', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:18:35', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:18:35');
INSERT INTO `e_machin_set` VALUES ('7fdcf6f1-61eb-4fc1-ae40-e1cafb0b7196', '5382c8cc-27ad-4b2e-8842-b1d194403753', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '8aa97837-a152-49be-98b8-47a11c3b1de4', 'f0b5d672-b743-44ce-954d-2eefaf95b11a', '0', '0', null, '0', '5', '1', '1', '绿茶加工第四道工序，二次揉捻', '4', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:23:25', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:23:25');
INSERT INTO `e_machin_set` VALUES ('81259a38-f688-4267-bc46-9aea08c7d1bb', '4dc6f1b2-5bbb-4324-9d74-b318dab9e8a3', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '9d9438d9-7746-4b14-adb7-d29136b1778a', '', '0', '0', null, '0', '0', '1', '1', '绿茶成品加工第十三道工序，提香', '13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:06:44', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:06:44');
INSERT INTO `e_machin_set` VALUES ('81849634-bf60-46d0-9c7e-d6760126d263', '5382c8cc-27ad-4b2e-8842-b1d194403753', '8a3e0d08-ca66-48b7-9924-b98d98fd193d', '01b33909-73b8-45d9-af2e-5f57a22895c1', '', '0', '0', null, '0', '0', '1', '1', '红茶抽检工序', '8', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:39:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:39:59');
INSERT INTO `e_machin_set` VALUES ('8281c645-17fb-41f7-97b4-17f60385b874', '5382c8cc-27ad-4b2e-8842-b1d194403753', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '8aa97837-a152-49be-98b8-47a11c3b1de4', 'da517c36-6812-4a9d-a4d4-38f633254656', '0', '0', null, '0', '5', '1', '1', '绿茶加工第5道工序，3次揉捻', '5', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:23:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:23:51');
INSERT INTO `e_machin_set` VALUES ('9be20092-4ad1-4fdd-b2ae-c57a3ad48af3', '5382c8cc-27ad-4b2e-8842-b1d194403753', '8a3e0d08-ca66-48b7-9924-b98d98fd193d', '8aa97837-a152-49be-98b8-47a11c3b1de4', '28dd1122-1981-4035-a57a-47edc20884b8', '0', '0', null, '0', '20', '1', '1', '红茶半成品加工第二道工序', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:20:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:20:59');
INSERT INTO `e_machin_set` VALUES ('a284f3b7-9045-42a1-997a-45ec1ea57b44', '4dc6f1b2-5bbb-4324-9d74-b318dab9e8a3', '8a3e0d08-ca66-48b7-9924-b98d98fd193d', '01b33909-73b8-45d9-af2e-5f57a22895c1', '', '0', '0', null, '0', '0', '1', '1', '红茶成品二次抽检', '10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:42:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:42:07');
INSERT INTO `e_machin_set` VALUES ('a5e00610-11dc-44a7-b9dd-53429949531e', '5382c8cc-27ad-4b2e-8842-b1d194403753', '8a3e0d08-ca66-48b7-9924-b98d98fd193d', '16595d6b-b5f0-4b49-970d-2c26c691e66a', '', '30', '0', null, '0', '12', '2', '1', '红茶半成品加工第一道工序', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:19:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:19:49');
INSERT INTO `e_machin_set` VALUES ('a92ee26d-02e7-4566-ba06-579eba874e0f', '5382c8cc-27ad-4b2e-8842-b1d194403753', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '01b33909-73b8-45d9-af2e-5f57a22895c1', '', '0', '0', null, '0', '0', '1', '1', '绿茶加工第十道工序，质检', '10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:45:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:45:14');
INSERT INTO `e_machin_set` VALUES ('ba401d63-2994-45cc-bbf1-9b979cb02236', '4dc6f1b2-5bbb-4324-9d74-b318dab9e8a3', '8a3e0d08-ca66-48b7-9924-b98d98fd193d', '9d9438d9-7746-4b14-adb7-d29136b1778a', '', '0', '0', null, '0', '0', '1', '1', '红茶第四一道工序，提香', '11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:42:39', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:42:39');
INSERT INTO `e_machin_set` VALUES ('c84620d6-6b17-40a6-8cc1-36db852b5228', '5382c8cc-27ad-4b2e-8842-b1d194403753', '8a3e0d08-ca66-48b7-9924-b98d98fd193d', '8aa97837-a152-49be-98b8-47a11c3b1de4', '28dd1122-1981-4035-a57a-47edc20884b8', '0', '0', null, '0', '25', '1', '1', '红茶半成品加工第五道工序', '5', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:23:22', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:23:22');
INSERT INTO `e_machin_set` VALUES ('d671f6cc-8b0b-4349-884a-8f525c0b90fc', '5382c8cc-27ad-4b2e-8842-b1d194403753', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '8aa97837-a152-49be-98b8-47a11c3b1de4', '28dd1122-1981-4035-a57a-47edc20884b8', '0', '0', null, '0', '8', '1', '1', '绿茶第三道工序一次揉捻', '3', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:22:36', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:22:36');
INSERT INTO `e_machin_set` VALUES ('e6349ed8-5ca8-4814-a975-e33919038278', '5382c8cc-27ad-4b2e-8842-b1d194403753', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '8aa97837-a152-49be-98b8-47a11c3b1de4', '28dd1122-1981-4035-a57a-47edc20884b8', '0', '0', null, '0', '5', '1', '1', '绿茶加工第6道工序，3次揉捻', '6', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:24:22', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:24:22');
INSERT INTO `e_machin_set` VALUES ('e9482682-3d79-4a0b-9cba-9aa3e1acf124', '5382c8cc-27ad-4b2e-8842-b1d194403753', '8a3e0d08-ca66-48b7-9924-b98d98fd193d', '9fd1943d-b955-4921-a1cd-76d60126e114', '', '40', '90', null, '8', '10', '2', '1', '红茶半成品加工，第六道工序。发酵', '6', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:37:43', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:37:43');
INSERT INTO `e_machin_set` VALUES ('efadcfc9-59da-4057-b28d-fc8e51fc85b3', '4dc6f1b2-5bbb-4324-9d74-b318dab9e8a3', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', 'f9e96bed-6103-4a14-9135-e69b7392dc78', '', '100', '0', null, '0', '3', '2', '1', '绿茶加工第十一道工序，成品复炒。', '12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:46:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:46:29');

-- ----------------------------
-- Table structure for e_machin_tea
-- ----------------------------
DROP TABLE IF EXISTS `e_machin_tea`;
CREATE TABLE `e_machin_tea` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `dic_mac_type` varchar(36) NOT NULL COMMENT '加工类型',
  `dic_tea_attr` varchar(36) NOT NULL COMMENT '茶系ID',
  `dic_mac_pro` varchar(36) NOT NULL COMMENT '工序ID',
  `dic_tea_type` varchar(36) DEFAULT NULL COMMENT '材料品种（茶叶）',
  `product_id` varchar(36) DEFAULT NULL COMMENT '等级-(目前存的是产品类型)',
  `process_batch_id` varchar(36) DEFAULT NULL COMMENT '加工批次号',
  `temperature` int(3) DEFAULT NULL COMMENT '温度',
  `humidity` int(2) DEFAULT NULL COMMENT '湿度',
  `mac_loss` int(2) DEFAULT NULL COMMENT '损耗',
  `begin_time` datetime DEFAULT NULL COMMENT '所需时长',
  `end_time` datetime DEFAULT NULL COMMENT '所需时长',
  `machin_status` int(1) DEFAULT NULL COMMENT '1m分,2m时,3d天',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '1进行中，2完成，3终止',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `process_batch_id` (`process_batch_id`,`dic_mac_type`,`dic_mac_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_machin_tea
-- ----------------------------
INSERT INTO `e_machin_tea` VALUES ('41d53d04-275d-4857-824e-665e1e8f569b', '4dc6f1b2-5bbb-4324-9d74-b318dab9e8a3', '8a3e0d08-ca66-48b7-9924-b98d98fd193d', '16595d6b-b5f0-4b49-970d-2c26c691e66a', 'cc32f7fc-24d6-471a-a5d5-05962737468a', '5e0fb4f9-2b27-4c44-9e4a-71ae602dcebd', '8dd86c54-d5a5-11e7-bbd8-38d547b81379', '12', '32', '12', '2017-12-03 18:13:12', '2017-12-03 19:13:42', '1', '1', '富商大贾', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-03 11:55:36', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-03 11:55:36');
INSERT INTO `e_machin_tea` VALUES ('55601ed9-d4c4-11e7-89ed-38d547b81379', '5382c8cc-27ad-4b2e-8842-b1d194403753', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '9ea19fba-8765-48f7-8a8a-b5ea412bda2e', 'cc32f7fc-24d6-471a-a5d5-05962737468a', '5e0fb4f9-2b27-4c44-9e4a-71ae602dcebd', '8dd86c54-d5a5-11e7-bbd8-38d547b81379', '80', '32', '8', '2017-12-01 18:13:16', '2017-12-03 18:13:45', '2', '2', '加工步骤-杀青2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 13:15:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 13:15:37');
INSERT INTO `e_machin_tea` VALUES ('577fb690-d4c4-11e7-89ed-38d547b81379', '5382c8cc-27ad-4b2e-8842-b1d194403753', 'c416d2c1-10b1-4ce7-9666-d5e18c79a584', '8aa97837-a152-49be-98b8-47a11c3b1de4', 'e9ce4ae0-2c4e-4563-9292-ee7fe182fe4e', '5e0fb4f9-2b27-4c44-9e4a-71ae602dcebd', '8dd86c54-d5a5-11e7-bbd8-38d547b81379', '90', '45', '15', '2017-12-02 18:13:21', '2017-12-03 18:13:48', '3', '1', '加工步骤-杀青3', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 13:15:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 13:15:41');
INSERT INTO `e_machin_tea` VALUES ('e802bfa2-d4ae-11e7-89ed-38d547b81379', '4dc6f1b2-5bbb-4324-9d74-b318dab9e8a3', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '16595d6b-b5f0-4b49-970d-2c26c691e66a', 'cc32f7fc-24d6-471a-a5d5-05962737468a', '3a235d7d-b242-4ede-862d-ef0ccee122a6', '04265198-d591-11e7-bbd8-38d547b81379', '13', '69', '50', '2017-11-30 18:13:25', '2017-12-03 18:13:51', '2', '3', '加工步骤-杀青4', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 10:43:04', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 10:43:09');
INSERT INTO `e_machin_tea` VALUES ('eff69752-7dcd-4226-a0ca-7b84d3e7430e', '4dc6f1b2-5bbb-4324-9d74-b318dab9e8a3', 'e6cd00da-fb86-45c4-a0d5-766f781eacc8', 'c307d686-7dce-4b2f-9efb-16fbeb348de6', 'cc32f7fc-24d6-471a-a5d5-05962737468a', 'dc081d33-ee9d-4126-bcd5-9133ae82caf5', '9333b038-d5a5-11e7-bbd8-38d547b81379', '90', '8', '20', '2017-11-17 18:13:31', '2017-12-03 18:13:53', '1', '1', '成品黑茶最后一次烘干1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 17:04:39', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 17:04:39');

-- ----------------------------
-- Table structure for e_manage_batch
-- ----------------------------
DROP TABLE IF EXISTS `e_manage_batch`;
CREATE TABLE `e_manage_batch` (
  `id` varchar(36) NOT NULL,
  `batch_number` varchar(50) NOT NULL COMMENT '批次号',
  `tea_garden_id` varchar(36) NOT NULL COMMENT '茶园ID',
  `create_id` varchar(36) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_manage_batch
-- ----------------------------
INSERT INTO `e_manage_batch` VALUES ('3eccf0b4-bdfc-47cb-b7c4-c883bd0a8ccc', 'B3-SOG-1917-123', '8893e29b-d37b-11e7-b5d6-24fd52935962', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:05:27', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:05:27', '1');
INSERT INTO `e_manage_batch` VALUES ('82ebeed2-d962-4169-acae-a2c76e1f94a5', 'B3-MZ-19175665', 'd038c43b-b1d1-4d2c-9435-aa4ab2267e79', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:05:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:05:46', '1');

-- ----------------------------
-- Table structure for e_origin_batch
-- ----------------------------
DROP TABLE IF EXISTS `e_origin_batch`;
CREATE TABLE `e_origin_batch` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `batch_num` varchar(50) NOT NULL COMMENT '溯源批次',
  `origin_set_id` varchar(36) DEFAULT NULL COMMENT '溯源设置表ID',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `batch_num` (`batch_num`),
  UNIQUE KEY `origin_set_id` (`origin_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_origin_batch
-- ----------------------------
INSERT INTO `e_origin_batch` VALUES ('428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'MSU20171207174947', null, '1', '细致', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 17:17:00', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:47:46');
INSERT INTO `e_origin_batch` VALUES ('5de96e6a-772a-4143-97af-fc7a3d1515a5', 'MSU20171207210316', null, '0', 'A', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 21:21:46', null, null);
INSERT INTO `e_origin_batch` VALUES ('9fd8212c-db20-11e7-8488-24fd52935962', 'MSHT17128675', 'd2bf46ba-db20-11e7-8488-24fd52935962', '1', '马山红茶溯源', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:32:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:32:34');

-- ----------------------------
-- Table structure for e_origin_code
-- ----------------------------
DROP TABLE IF EXISTS `e_origin_code`;
CREATE TABLE `e_origin_code` (
  `id` varchar(36) NOT NULL,
  `origin_batch_id` varchar(36) NOT NULL COMMENT '溯源批次',
  `prefix_val` varchar(50) NOT NULL COMMENT '前缀',
  `origin_code` varchar(36) NOT NULL COMMENT '溯源编码(明文编码类型)',
  `create_status` int(1) NOT NULL DEFAULT '0' COMMENT '是否已生成过(包装盒上的二维码)',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_origin_code
-- ----------------------------
INSERT INTO `e_origin_code` VALUES ('f3db5750-db21-11e7-8488-24fd52935962', '9fd8212c-db20-11e7-8488-24fd52935962', 'STL', 'STL000123', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:41:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:53:21');
INSERT INTO `e_origin_code` VALUES ('753e2a2a-9fed-4cf9-aa5b-4ddb853d3d97', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207233796', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:28', null, null);
INSERT INTO `e_origin_code` VALUES ('1caaad60-ac7d-4c35-b18d-a41fa7d4aa10', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207234181', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:33', null, null);
INSERT INTO `e_origin_code` VALUES ('21b2dbbd-ae80-4ff8-8fb3-af9c6e9a67d8', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207232269', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:36', null, null);
INSERT INTO `e_origin_code` VALUES ('06e23bcf-be57-4b12-a6a7-d543b80a8f62', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207234373', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:41', null, null);
INSERT INTO `e_origin_code` VALUES ('42d4a05e-6eb0-44c6-b509-6ce19b8650bd', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236617', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('66790de2-1fb6-4a20-b218-7b39a6933049', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236913', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('a0aae813-abb2-4e05-ad72-0631458350e5', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236131', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('279f0cce-7b45-4dd9-afc1-6859f05dd5b0', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236170', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('1331f3f3-7171-4403-bbe0-ccebab713bad', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236197', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('c8d0e306-9a98-4ed4-9ef8-dae2f7dccd71', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236222', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('c995141a-3939-42f6-87f8-528e5f0728fb', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236251', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('702c1859-b7d4-4364-b87d-8179bc320f5d', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236273', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('78fb31c3-f09e-41b0-b057-d40aec03b2e6', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236308', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('ee2cfeff-2db2-4eb6-8549-bd5787e313af', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236326', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('e456439a-baf4-4b10-b081-dd2aa3356d1e', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236376', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('dfd335e0-3140-4a77-beb7-030432d14cdf', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236432', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('fa66d858-ea7f-44c9-89b4-c2b35fc7c59a', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236486', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('6742fa4b-1810-4b40-947a-98f704c6e286', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236540', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('a720c507-0582-4c67-a80c-4b872d80f9e2', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236578', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('72cd47e4-c061-4a5c-9d42-3aafcf940981', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236611', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('3455683d-5f4e-47e3-8de5-17252ed63008', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236647', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('a7ecf868-3bdf-424e-ad3e-26725de7f2c8', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236667', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('03c2ee63-6016-4ebc-b81e-7fcbb5d68112', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236697', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('251e9658-cb97-403c-b97c-5b60445d63dd', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236714', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('bc1739e1-c127-43e6-ab57-9b175d15093b', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236745', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('cfcf92c0-cd52-4b34-bf68-e8a208516b4c', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236761', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('4398a8c0-24f1-43e0-ba3d-26cb1f9cf3a3', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236785', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('35211429-de99-41b7-8178-2afd05215a85', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236804', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('8bbdfc88-bae1-495a-bb26-a67c90b1e526', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236842', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('26a071f4-7a6f-424a-9baf-7a4d5d59c97d', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236872', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('3668430d-5d70-4e39-b88d-ea927b9a9774', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236911', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('b2630be2-3ff6-42a6-bf65-defc99aeda0b', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236936', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('afa031da-a4c2-4627-b645-ba668139ea93', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236951', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('aed746d3-d686-4197-952a-3c41157896e8', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236975', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('b8aa3c35-65fb-4396-97b1-35ba6f0c29f6', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207236990', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('76e0a7d1-7464-459c-b230-88ebe790e5aa', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237115', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('af56586b-eabe-4df5-9934-0b05361befa1', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237310', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('62287f06-c989-4b56-add3-70a5eb40df1c', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237610', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('e567f2f7-4623-40e9-b627-9c986afd0666', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237817', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('55e7aaad-c198-47e0-b2aa-232847d7371a', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237109', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('ea5efd9d-57a8-4109-9f00-a8f435fe17aa', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237137', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('0f7f752a-ba96-463c-b88e-31c828c5613d', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237151', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('02fdf079-93d5-4308-a8b5-638367c97d60', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237170', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('2baeefd0-5b34-41d4-bdfc-7140e51d9117', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237192', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('d0c3417c-aef3-435d-ae37-5714d46a6c42', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237218', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('9138491c-d027-4bea-afc5-27c3ea5408d1', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237239', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('aef54b43-3f46-460d-8d37-ff8f6d308878', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237264', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('449f31b0-308c-43c5-bc75-5dbd619f2a66', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237286', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('ad097b8d-e95d-4e44-aa99-c991377f9a42', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237316', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('fe4fea24-4ff5-455c-b79f-67bf5237d694', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237342', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('7081cffa-6d28-428b-a34e-48eb195d6941', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237362', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('2c7eeb34-bfe6-498f-8a4c-d20c74a41577', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237395', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('546dc7d9-c467-4dd2-8c7e-4599e45dc598', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237427', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('c171e549-dfa9-40b1-ad94-30a1f78fa1da', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237448', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('7246c5f8-7429-4bf7-b71e-02bc8d8be47e', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237468', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('4d193c64-1845-4f66-ac2f-4d0cf8c1a24a', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237494', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('d595a9b6-0df3-47da-8d57-dbc8b166f22f', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237517', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('1ae4b9ba-3bae-4e7d-85bb-d70d7610e7e0', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237531', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('007adce9-5d1b-45b2-ba10-47728ca71e87', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237561', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('2b4d246d-aaca-4a9d-8afd-cd73b6a8928f', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237585', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('0c08b347-8c39-48cd-a1d7-dfe8be7745be', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237614', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('84a92bad-cc04-4593-933d-01cf6da1bc82', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237632', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('81fc254a-2850-4bdc-b037-6a49dde86be2', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237658', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('401f058e-c3d7-447c-b6d5-72a9ee1cbdfa', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237679', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('4902120d-678c-474f-8e0f-cbfab736f459', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237694', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('438e5ac2-5d5f-49c8-9d5d-07c3aa0db789', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237712', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('ca8801b0-16c7-47b4-85c8-a6d21d6aba79', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237739', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('1730af2d-aa81-4eb8-8d97-906bcf1d0d66', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237762', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('bacad801-718a-4f82-9b3a-099b3e8596da', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237794', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('8b862e65-b668-4b4e-8f49-d39a8248c229', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237813', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('93c3bcac-e30f-4d77-9d8f-c95790b8933b', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237837', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('1ced0a29-257f-480f-9c4d-454896995a98', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237861', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('5fcf7261-5f4d-48d6-b632-f738e1c8e7bf', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237889', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('360acc3d-e01e-411c-aa9d-726d5ecd3858', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237913', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('808eeef6-deea-4efa-bc8b-e550337d3714', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237938', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('fad89250-72f1-49e6-8632-cf6d14e338bc', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237953', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('34cab4e3-11d9-4f45-960f-440fbf572e2b', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237961', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('0a99bd5a-552a-4ce3-bf99-4beb9a459d11', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207237983', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('b031fae5-5623-427a-b890-0582b6d07d26', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238015', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('e5e8f139-ac3b-4028-8160-0643adcbe8f6', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238310', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('7e526cd1-7ba1-43ee-bd46-d1fafe517a0c', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238411', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('024491d7-96f8-4d50-a7ab-7a1c0f73ff96', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238619', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('564b6177-b203-4280-9d6e-3939453ee2b8', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238812', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('7628cb35-4675-4048-bb9e-dadeecffbf2c', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238110', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('ca503d56-ecb6-449b-b0f4-128579be8cab', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238133', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('df601686-e41f-4d5c-b8b1-e3f4da1e87e9', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238159', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('c58d4b0d-1a79-461d-af19-31e998ef7f35', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238184', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('cec71c46-7eb1-4d25-b07a-803f0bd20594', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238205', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('1130f458-988c-47bd-9ca0-84ad1fa684aa', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238221', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('ecc82b1a-c495-4e25-859d-949ec0ffd2d3', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238258', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('a3a1f963-23a4-4779-84d3-65910b5ccbf2', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238284', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('28da1cd0-b683-4872-a6f8-591962cab1bd', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238317', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('91264866-4692-4c79-9d42-a99e54d7177d', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238320', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('458201a1-a24d-4c8c-ad62-1733f924df04', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238348', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('6a427300-db34-4d48-a2b6-1b8eb08e7d80', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238372', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('4cfc1f22-1e13-4ce8-9cd7-6a65d4ac35cb', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238401', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('eaa68272-ed9f-4605-b83e-84af7483dc23', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238429', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('64c974b7-9a37-45f9-95ab-1222a38f2dc5', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238451', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('dd9318b0-1806-4575-a3a0-baa56edec7f6', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238474', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('70a2cb75-3538-47b4-8e25-7f1e605ccd53', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238497', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('9f5f8721-8934-4197-822e-8e31aa7c6dac', '5de96e6a-772a-4143-97af-fc7a3d1515a5', 'TS', 'TS20171207238510', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 23:36:44', null, null);
INSERT INTO `e_origin_code` VALUES ('41d7bc55-2c2b-42b4-a611-24f29f6ff68d', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'TS', 'TS20171208003325', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:11:49', null, null);
INSERT INTO `e_origin_code` VALUES ('52aca61a-dddf-441a-a77d-35fc97a802af', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'TS', 'TS20171208003371', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:11:49', null, null);
INSERT INTO `e_origin_code` VALUES ('f80173ff-9837-4195-8535-ae294af1a2f0', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'TS', 'TS20171208003412', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:11:49', null, null);
INSERT INTO `e_origin_code` VALUES ('545925dc-d6bb-41ab-9032-36d5c892cec6', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'TS', 'TS20171208003442', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:11:49', null, null);
INSERT INTO `e_origin_code` VALUES ('a3315fff-f327-4414-9e01-124ece8fcd32', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'TS', 'TS20171208003494', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:11:49', null, null);
INSERT INTO `e_origin_code` VALUES ('be3cb192-b6ee-4aa8-a450-0277cf7692e8', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'TS', 'TS20171208003539', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:11:49', null, null);
INSERT INTO `e_origin_code` VALUES ('7666f31e-9f70-44d5-90c9-c5fcf829ebbd', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'TS', 'TS20171208003573', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:11:49', null, null);
INSERT INTO `e_origin_code` VALUES ('75836a23-478d-467f-8877-7c0bc5b71f18', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'TS', 'TS20171208003601', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:11:49', null, null);
INSERT INTO `e_origin_code` VALUES ('b9eb9789-c831-4018-ae69-151d8d37b23d', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'TS', 'TS20171208003646', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:11:49', null, null);
INSERT INTO `e_origin_code` VALUES ('9445f592-c640-4a97-a5a9-3886aaf37c32', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'TS', 'TS20171208003680', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:11:49', null, null);
INSERT INTO `e_origin_code` VALUES ('ff745591-11be-480c-86bc-f5c095a34b24', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'TS', 'TS20171208003713', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:11:49', null, null);
INSERT INTO `e_origin_code` VALUES ('42af28c6-3906-4302-b69e-70a2d44f5461', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'S', 'S20171208001179', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:12:19', null, null);
INSERT INTO `e_origin_code` VALUES ('06269d65-362b-4d4f-abdf-40c2191c4546', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'S', 'S20171208001217', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:12:19', null, null);
INSERT INTO `e_origin_code` VALUES ('3300034d-a912-4335-b2ab-9d81dd187dff', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'S', 'S20171208001244', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:12:19', null, null);
INSERT INTO `e_origin_code` VALUES ('43d74923-ce9b-4ab2-a270-4b27bdc0b573', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'S', 'S20171208001270', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:12:19', null, null);
INSERT INTO `e_origin_code` VALUES ('3a929532-a19b-418a-99fb-49b2a20213f0', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'S', 'S20171208001311', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:12:19', null, null);
INSERT INTO `e_origin_code` VALUES ('26144e72-842b-4232-b767-0dcba8cc6b10', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'S', 'S20171208001341', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:12:19', null, null);
INSERT INTO `e_origin_code` VALUES ('ce9be381-3890-4138-aaf5-abb36b666266', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'S', 'S20171208001385', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:12:19', null, null);
INSERT INTO `e_origin_code` VALUES ('d809454d-38a7-4e0f-88e2-1e2572056ad7', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'S', 'S20171208001414', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:12:19', null, null);
INSERT INTO `e_origin_code` VALUES ('13db4ea3-280c-4cfc-812d-438d080b5c45', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'S', 'S20171208001436', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:12:19', null, null);
INSERT INTO `e_origin_code` VALUES ('9c6e96bd-43f0-4abe-b797-d67231fb87c4', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208144680', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('e9515f9b-ee59-4cf1-a308-ff11618f73c5', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208144802', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('c52136b4-a104-4d65-aaf8-beb1b95bcd58', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208144820', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('22c8d55a-b1c4-44a3-878b-37779ac4d2af', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208144858', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('9a982663-23a6-4369-841b-2437fc0a4795', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208144870', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('de50886f-b59d-4e0c-9647-2ec5d72fd6e8', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208144903', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('58c4792f-3d28-4f20-9050-d701b264c8a8', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208144923', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('04314a6f-8113-42fb-aaf1-9665495f6bdd', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208144934', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('32bcf27b-1d14-429a-a877-ebf7f581f583', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208144953', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('03a38c6d-46c6-43c5-ae3f-c55e8c8c0523', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208144969', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('43382ddf-903d-4b75-99cd-edc3bd809065', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208144981', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('83bb9e60-b7d8-4ecf-a713-33eda77a5395', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208145018', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('793ca502-498f-4e1f-a92d-43e9fbbf4819', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208145214', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('047549b0-f038-46cc-a47d-573d49e76347', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208145411', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('3f9f2c0a-8872-4a36-a8d7-3705a35d003a', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208145512', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('ccb99a59-97e6-421a-8cf6-2ccfe130625c', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208145712', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('20606bed-ddc2-40ba-9789-472f9bf5d9f3', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208145820', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('417f0cdc-493d-423a-99a5-c7ba43319e3c', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208145107', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('d80a46f9-25d2-4d9d-97ac-284902df26f3', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208145123', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('abdcc836-8521-4c8e-b106-8f6ac8394983', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'hst', 'hst20171208145141', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:39:16', null, null);
INSERT INTO `e_origin_code` VALUES ('8db6142c-6e09-4bd1-b380-2636a644fcd5', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'D', 'D20171208147177', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:41:51', null, null);
INSERT INTO `e_origin_code` VALUES ('b2ef92bb-8b68-4d01-9e3d-ead058b758bb', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'D', 'D20171208148240', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:41:51', null, null);
INSERT INTO `e_origin_code` VALUES ('492f1210-f7f8-4f22-84f5-6abc293c86a6', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'D', 'D20171208149283', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:41:51', null, null);
INSERT INTO `e_origin_code` VALUES ('ac533332-e255-4cf5-add1-b95416ad8578', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'D', 'D20171208140391', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:41:52', null, null);
INSERT INTO `e_origin_code` VALUES ('0219f1df-5e1a-48e8-acb0-7590fec1267c', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'D', 'D20171208141467', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:41:52', null, null);
INSERT INTO `e_origin_code` VALUES ('c9f6e5cb-5c2e-4340-ad8a-380606644291', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'D', 'D20171208142569', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:41:52', null, null);
INSERT INTO `e_origin_code` VALUES ('29b3a249-10b0-49f8-bf17-2d468cce7c4d', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'D', 'D20171208143601', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:41:52', null, null);
INSERT INTO `e_origin_code` VALUES ('f289ffd8-faa1-4cdc-8ff4-7515f7bcbf96', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'D', 'D20171208144654', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:41:52', null, null);
INSERT INTO `e_origin_code` VALUES ('9c947d16-d88c-4901-ba8f-ea038537825a', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'D', 'D20171208145703', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:41:52', null, null);
INSERT INTO `e_origin_code` VALUES ('c5da37e9-5c2b-400b-9ea8-2e139f147a31', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'D', 'D20171208146773', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:41:52', null, null);
INSERT INTO `e_origin_code` VALUES ('e8e4e161-3cbd-4749-8d8f-5306b217a106', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'D', 'D20171208147862', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:41:52', null, null);
INSERT INTO `e_origin_code` VALUES ('fcc17512-1b15-4f5a-8bda-c8472da0cabb', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', 'D', 'D20171208148938', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:41:52', null, null);
INSERT INTO `e_origin_code` VALUES ('868085b0-3050-4652-b6a8-6bb03351ecad', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208145715', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:42:45', null, null);
INSERT INTO `e_origin_code` VALUES ('19b56f8e-25c7-4bf6-beb3-dd9889ff3168', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208146207', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:42:45', null, null);
INSERT INTO `e_origin_code` VALUES ('23b76c5c-f98d-4a24-a4ba-c3b8fc24a931', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208147266', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:42:45', null, null);
INSERT INTO `e_origin_code` VALUES ('ebd47a5b-c223-41fb-a3d5-7a91ead42870', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208148321', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:42:45', null, null);
INSERT INTO `e_origin_code` VALUES ('bc5f4ead-4e40-46fb-b83d-6c7cf1ea2eae', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208149390', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:42:45', null, null);
INSERT INTO `e_origin_code` VALUES ('e239e94b-e015-4c11-b03f-e0e9cbfebedf', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208140490', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:42:46', null, null);
INSERT INTO `e_origin_code` VALUES ('459a4a0f-d194-4dbc-a04e-4da6cd370e81', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208141588', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:42:46', null, null);
INSERT INTO `e_origin_code` VALUES ('fc8a76a6-ebf8-454e-96ac-90c6c6ad843a', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208142681', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:42:46', null, null);
INSERT INTO `e_origin_code` VALUES ('2ab2f324-da52-4b3f-b561-6a7af46520f6', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208143770', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:42:46', null, null);
INSERT INTO `e_origin_code` VALUES ('bfb36ed1-b4d6-43cc-b282-fdbd76e81135', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208144873', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:42:46', null, null);
INSERT INTO `e_origin_code` VALUES ('6293d3f4-0ce2-4f10-b370-6734154646f3', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208145976', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:42:46', null, null);
INSERT INTO `e_origin_code` VALUES ('f801a99b-1109-482b-b1e5-419e9117e42e', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208147617', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:42:46', null, null);
INSERT INTO `e_origin_code` VALUES ('32fd9c4c-2ffd-4bf3-9edd-8cc18d015b7f', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208141718', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:47:46', null, null);
INSERT INTO `e_origin_code` VALUES ('657ac926-1a9e-43ef-a4c4-f9fffbfc63ce', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208141767', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:47:46', null, null);
INSERT INTO `e_origin_code` VALUES ('f888a652-90be-4ae1-ba75-e8eabb2ce3ae', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208141803', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:47:46', null, null);
INSERT INTO `e_origin_code` VALUES ('eb4cc03d-2c0a-45ce-8313-d7a42750350e', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208141846', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:47:46', null, null);
INSERT INTO `e_origin_code` VALUES ('237177ad-5ff8-4a06-8939-a0686ec1664a', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208141874', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:47:46', null, null);
INSERT INTO `e_origin_code` VALUES ('9784aa97-b68e-4ee4-b81d-c9b0fb772911', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208141903', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:47:46', null, null);
INSERT INTO `e_origin_code` VALUES ('3d049ca0-8934-4cfd-96e4-b0ad203bcb60', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208141947', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:47:46', null, null);
INSERT INTO `e_origin_code` VALUES ('259fcb19-fb5a-4281-b909-9fa26bdc16a0', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208141983', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:47:46', null, null);
INSERT INTO `e_origin_code` VALUES ('e066d91c-e6ab-4ab0-af05-99787f518a65', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208142118', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:47:46', null, null);
INSERT INTO `e_origin_code` VALUES ('b7dbd6be-fd6d-40ef-9f50-6de94333e71c', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208142518', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:47:46', null, null);
INSERT INTO `e_origin_code` VALUES ('1c9730fd-2be1-44de-9b6b-a032ddba92a4', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208142818', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:47:46', null, null);
INSERT INTO `e_origin_code` VALUES ('45cd7829-2bb6-49b3-a17d-e784be882ea2', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '12', '1220171208142114', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:47:46', null, null);

-- ----------------------------
-- Table structure for e_origin_img
-- ----------------------------
DROP TABLE IF EXISTS `e_origin_img`;
CREATE TABLE `e_origin_img` (
  `id` varchar(36) NOT NULL,
  `relation_id` varchar(36) NOT NULL COMMENT '关联的ID',
  `relation_type` varchar(36) DEFAULT NULL,
  `sort_id` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(50) NOT NULL COMMENT '原始名称',
  `img_type` varchar(30) NOT NULL COMMENT '图片类型(格式)',
  `img_url` varchar(200) NOT NULL COMMENT '路径',
  `resolution` varchar(50) NOT NULL COMMENT '分辨率',
  `show_type` int(11) NOT NULL DEFAULT '0' COMMENT '类型-竖屏1,横屏2,无0',
  `size` varchar(50) NOT NULL COMMENT '尺寸',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `source` varchar(50) DEFAULT NULL COMMENT '来源',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `create_id` varchar(36) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_commodity_id` (`relation_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_origin_img
-- ----------------------------

-- ----------------------------
-- Table structure for e_origin_info
-- ----------------------------
DROP TABLE IF EXISTS `e_origin_info`;
CREATE TABLE `e_origin_info` (
  `id` varchar(36) NOT NULL,
  `title` varchar(200) NOT NULL COMMENT '标题',
  `dic_origin_type` varchar(36) NOT NULL COMMENT '溯源类型',
  `content` text NOT NULL COMMENT '内容',
  `img_url` varchar(200) NOT NULL COMMENT '图片',
  `status` int(1) NOT NULL COMMENT '状态',
  `sort_id` int(1) NOT NULL COMMENT '排序ID',
  `description` varchar(200) NOT NULL COMMENT '简介',
  `origin_batch` varchar(36) NOT NULL COMMENT '溯源批次号',
  `create_id` varchar(36) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_id` varchar(36) NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_origin_info
-- ----------------------------
INSERT INTO `e_origin_info` VALUES ('952bf70d-dcb3-11e7-8597-24fd52935962', '溯源信息第一条茶园信息简介', '01980df1-e742-4891-b449-a6ae4be190cc', '广东龙岗马山茶业股份有限公司成立于2007年，己投资4500多万元，是集岭南古茶种质保护、茶新品种选育、茶叶分级采收与遴选、马山茶高端生产、马山茶精制加工与仓储、销售网络与物流体系建设、岭南茶文化发掘与弘扬、产学研合作于一体的茶产业全链条经营企业。公司承“企业十基地十茶农”的经营模式，在保护原有老茶园，提升老茶树品质的基础上带动全村870多户茶农，进一步扩大种植规模。茶园实施高起点规划、高标准开垦、高质量种植，实现了茶地园林化、品种良种化、管理科学化、加工清洁化、产品优质化。公司拥有先进绿茶、红茶加工设备，现己生产名优绿茶和红茶共10个系列，20多个品种，如高山雾芽、高山溢韵、马山红等精致礼盒装。 公司设有产品研发中心，技术培训中心，拥有一批中高级技术人才及先进的制茶设备。今年我公司成功研发出金针一号，高山雾芽，马山红茶等新产品，其中金针一号还填补了广东省高档名优绿茶的空白。公司还积极与广东省农科院、华南农业大学等合作机构进行茶树新品种选育和茶叶新产品的研发工作，以不断提高茶叶产品质量和科技含量。', 'http://of8rkrh1w.bkt.clouddn.com/2017/12/8/Hydrangeas.jpg', '1', '1', '溯源信息第一条茶园信息简介', '428cfec4-ed51-44a5-bdc2-f79d62dc559a', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:36:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:36:44');
INSERT INTO `e_origin_info` VALUES ('fa5dfdb7-dcb3-11e7-8597-24fd52935962', '溯源信息第一条茶园信息简介', '336dd879-f833-4eee-ad08-fc5f60953f20', '广东龙岗马山茶业股份有限公司成立于2007年，己投资4500多万元，是集岭南古茶种质保护、茶新品种选育、茶叶分级采收与遴选、马山茶高端生产、马山茶精制加工与仓储、销售网络与物流体系建设、岭南茶文化发掘与弘扬、产学研合作于一体的茶产业全链条经营企业。公司承“企业十基地十茶农”的经营模式，在保护原有老茶园，提升老茶树品质的基础上带动全村870多户茶农，进一步扩大种植规模。茶园实施高起点规划、高标准开垦、高质量种植，实现了茶地园林化、品种良种化、管理科学化、加工清洁化、产品优质化。公司拥有先进绿茶、红茶加工设备，现己生产名优绿茶和红茶共10个系列，20多个品种，如高山雾芽、高山溢韵、马山红等精致礼盒装。 公司设有产品研发中心，技术培训中心，拥有一批中高级技术人才及先进的制茶设备。今年我公司成功研发出金针一号，高山雾芽，马山红茶等新产品，其中金针一号还填补了广东省高档名优绿茶的空白。公司还积极与广东省农科院、华南农业大学等合作机构进行茶树新品种选育和茶叶新产品的研发工作，以不断提高茶叶产品质量和科技含量。', 'http://of8rkrh1w.bkt.clouddn.com/2017/12/8/Hydrangeas.jpg', '1', '2', '溯源信息第一条茶园信息简介', '9fd8212c-db20-11e7-8488-24fd52935962', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:36:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:36:44');
INSERT INTO `e_origin_info` VALUES ('faedb56b-dcb3-11e7-8597-24fd52935962', '溯源信息第一条茶园信息简介', '4b0cedd9-13be-4759-9e00-2f705d7770d6', '广东龙岗马山茶业股份有限公司成立于2007年，己投资4500多万元，是集岭南古茶种质保护、茶新品种选育、茶叶分级采收与遴选、马山茶高端生产、马山茶精制加工与仓储、销售网络与物流体系建设、岭南茶文化发掘与弘扬、产学研合作于一体的茶产业全链条经营企业。公司承“企业十基地十茶农”的经营模式，在保护原有老茶园，提升老茶树品质的基础上带动全村870多户茶农，进一步扩大种植规模。茶园实施高起点规划、高标准开垦、高质量种植，实现了茶地园林化、品种良种化、管理科学化、加工清洁化、产品优质化。公司拥有先进绿茶、红茶加工设备，现己生产名优绿茶和红茶共10个系列，20多个品种，如高山雾芽、高山溢韵、马山红等精致礼盒装。 公司设有产品研发中心，技术培训中心，拥有一批中高级技术人才及先进的制茶设备。今年我公司成功研发出金针一号，高山雾芽，马山红茶等新产品，其中金针一号还填补了广东省高档名优绿茶的空白。公司还积极与广东省农科院、华南农业大学等合作机构进行茶树新品种选育和茶叶新产品的研发工作，以不断提高茶叶产品质量和科技含量。', 'http://of8rkrh1w.bkt.clouddn.com/2017/12/8/Hydrangeas.jpg', '1', '1', '溯源信息第一条茶园信息简介', '5de96e6a-772a-4143-97af-fc7a3d1515a5', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:36:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:36:44');
INSERT INTO `e_origin_info` VALUES ('fb6777bc-dcb3-11e7-8597-24fd52935962', '溯源信息第一条茶园信息简介', '909b76dd-b521-4255-b2e6-1b2f4767f65a', '广东龙岗马山茶业股份有限公司成立于2007年，己投资4500多万元，是集岭南古茶种质保护、茶新品种选育、茶叶分级采收与遴选、马山茶高端生产、马山茶精制加工与仓储、销售网络与物流体系建设、岭南茶文化发掘与弘扬、产学研合作于一体的茶产业全链条经营企业。公司承“企业十基地十茶农”的经营模式，在保护原有老茶园，提升老茶树品质的基础上带动全村870多户茶农，进一步扩大种植规模。茶园实施高起点规划、高标准开垦、高质量种植，实现了茶地园林化、品种良种化、管理科学化、加工清洁化、产品优质化。公司拥有先进绿茶、红茶加工设备，现己生产名优绿茶和红茶共10个系列，20多个品种，如高山雾芽、高山溢韵、马山红等精致礼盒装。 公司设有产品研发中心，技术培训中心，拥有一批中高级技术人才及先进的制茶设备。今年我公司成功研发出金针一号，高山雾芽，马山红茶等新产品，其中金针一号还填补了广东省高档名优绿茶的空白。公司还积极与广东省农科院、华南农业大学等合作机构进行茶树新品种选育和茶叶新产品的研发工作，以不断提高茶叶产品质量和科技含量。', 'http://of8rkrh1w.bkt.clouddn.com/2017/12/8/Hydrangeas.jpg', '1', '1', '溯源信息第一条茶园信息简介', '9fd8212c-db20-11e7-8488-24fd52935962', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:36:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:36:44');

-- ----------------------------
-- Table structure for e_origin_set
-- ----------------------------
DROP TABLE IF EXISTS `e_origin_set`;
CREATE TABLE `e_origin_set` (
  `id` varchar(36) NOT NULL,
  `origin_set_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `process_batch` varchar(36) DEFAULT NULL COMMENT '加工批次号',
  `sampling_id` varchar(36) DEFAULT NULL COMMENT '取样单号',
  `manage_batch_id` varchar(36) DEFAULT NULL COMMENT '茶园管理批次号',
  `status` int(1) DEFAULT NULL,
  `create_id` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `modify_id` varchar(36) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_origin_set
-- ----------------------------
INSERT INTO `e_origin_set` VALUES ('d2bf46ba-db20-11e7-8488-24fd52935962', '关联溯源设置', '无关联', '无关联', '无关联', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:38:53', '暂时不启用的功能项', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:40:11');

-- ----------------------------
-- Table structure for e_process_batch
-- ----------------------------
DROP TABLE IF EXISTS `e_process_batch`;
CREATE TABLE `e_process_batch` (
  `id` varchar(36) NOT NULL,
  `batch_number` varchar(50) NOT NULL COMMENT '批次号',
  `manage_batch_id` varchar(36) NOT NULL COMMENT '管理批次号ID',
  `product_id` varchar(36) NOT NULL COMMENT '产品ID',
  `create_id` varchar(36) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_process_batch
-- ----------------------------

-- ----------------------------
-- Table structure for e_quality
-- ----------------------------
DROP TABLE IF EXISTS `e_quality`;
CREATE TABLE `e_quality` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `sampling_id` varchar(36) NOT NULL COMMENT '取样ID',
  `dic_tea_grade` varchar(36) NOT NULL COMMENT '茶叶等级',
  `dic_quality_type` varchar(36) NOT NULL COMMENT '质检类型(字典)',
  `verify_quality` int(1) DEFAULT '0' COMMENT '质检审核(复检)0未复检， 1,合格，2不合格',
  `verify_user` varchar(36) DEFAULT NULL COMMENT '复检员',
  `verify_time` datetime DEFAULT NULL COMMENT '复检时间',
  `quality_status` int(1) NOT NULL DEFAULT '0' COMMENT '质检状态,0未检， 1合格，2不合格',
  `quality_user` varchar(36) NOT NULL COMMENT '质检员',
  `quality_time` datetime NOT NULL COMMENT '质检时间',
  `net_content` varchar(50) DEFAULT NULL COMMENT '净重（净含量）',
  `tea_crumble` varchar(50) DEFAULT NULL COMMENT '碎末(茶叶灰)',
  `water_content` varchar(50) DEFAULT NULL COMMENT '水份量(含水量)',
  `quality_cable` varchar(100) DEFAULT NULL COMMENT '外形-条索',
  `quality_color_lustre` varchar(100) DEFAULT NULL COMMENT '外形-色泽',
  `quality_cleanliness` varchar(100) DEFAULT NULL COMMENT '外形-净度',
  `quality_aroma` varchar(100) DEFAULT NULL COMMENT '内质-香气',
  `quality_taste` varchar(100) DEFAULT NULL COMMENT '内质-滋味(口感)',
  `quality_colour` varchar(100) DEFAULT NULL COMMENT '内质-汤色',
  `description` varchar(200) DEFAULT NULL,
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_id` varchar(36) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_quality
-- ----------------------------
INSERT INTO `e_quality` VALUES ('06f9e0cc-e096-466d-91a0-20eca01cced1', '5c79bda3-d8ca-11e7-8c51-38d547b81379', '74125ba6-0ec1-4286-b9c2-f56d95fe4ac4', '1301e136-8d75-4e05-9fa3-06cbdcad1eea', '2', '狐疑的', '2017-12-06 16:31:54', '1', '湿度', '2017-12-06 15:12:09', '1', '2', '3', '1', '2', '3', '4', '5', '6', '阿斯蒂芬', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-06 15:25:38', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-06 17:08:50');
INSERT INTO `e_quality` VALUES ('c09728df-da61-11e7-a489-38d547b81379', '5c79bda3-d8ca-11e7-8c51-38d547b81379', '74125ba6-0ec1-4286-b9c2-f56d95fe4ac4', '1301e136-8d75-4e05-9fa3-06cbdcad1eea', '1', 'sdf', '2017-12-06 16:31:54', '1', 'Alan', '2017-12-05 09:49:38', '1', '2', '3', '1', '2', '3', '4', '5', '6', '阿斯蒂芬', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-06 09:51:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-06 17:08:00');

-- ----------------------------
-- Table structure for e_sampling
-- ----------------------------
DROP TABLE IF EXISTS `e_sampling`;
CREATE TABLE `e_sampling` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `process_batch_id` varchar(36) DEFAULT NULL COMMENT '加工批次ID',
  `product_id` varchar(36) NOT NULL COMMENT '产品ID',
  `order_no` varchar(36) NOT NULL COMMENT '取样单号',
  `sampling_number` int(5) NOT NULL COMMENT '取样数量',
  `sampling_time` datetime NOT NULL COMMENT '取样时间',
  `machin_status` datetime DEFAULT NULL COMMENT '生产开始时间',
  `machin_end` datetime DEFAULT NULL COMMENT '生产结束时间',
  `dic_tea_grade` varchar(36) DEFAULT NULL COMMENT '等级(目标等级)',
  `operator_id` varchar(36) NOT NULL COMMENT '操作人',
  `sampling_base` int(5) NOT NULL DEFAULT '0' COMMENT '取样基数',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_sampling
-- ----------------------------
INSERT INTO `e_sampling` VALUES ('5c79bda3-d8ca-11e7-8c51-38d547b81379', '04265198-d591-11e7-bbd8-38d547b81379', 'dc081d33-ee9d-4126-bcd5-9133ae82caf5', 'QY2017120416', '2', '2017-12-04 16:09:01', '2017-12-04 16:13:21', '2017-12-04 16:13:23', 'b1c94b1c-67e4-4e45-a516-0976fb142a81', 'Morgan', '1', '阿斯蒂芬', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-04 16:13:44', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-04 16:13:47');
INSERT INTO `e_sampling` VALUES ('b289528b-77ca-4bde-b697-e4c4b5318d05', '04265198-d591-11e7-bbd8-38d547b81379', '3a235d7d-b242-4ede-862d-ef0ccee122a6', 'QY20171205228615', '2', '2017-12-05 22:44:36', '2017-11-30 18:13:25', '2017-12-03 18:13:51', '0fb92203-be20-4705-87e8-ae6862a91743', '你好啊', '12', '撒大声地', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-05 22:44:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-05 22:44:54');
INSERT INTO `e_sampling` VALUES ('eebcdb93-4504-47b1-84b7-4632a5970fc2', '04265198-d591-11e7-bbd8-38d547b81379', '3a235d7d-b242-4ede-862d-ef0ccee122a6', 'QY20171205228815', '1', '2017-12-05 22:44:22', '2017-11-30 18:13:25', '2017-12-03 18:13:51', '65bac923-24d4-4a61-b933-ca3bd1fae8ae', '我', '12', '', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-05 22:44:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-05 22:44:29');

-- ----------------------------
-- Table structure for e_tea_garden
-- ----------------------------
DROP TABLE IF EXISTS `e_tea_garden`;
CREATE TABLE `e_tea_garden` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `name_area` varchar(50) NOT NULL COMMENT '茶园区域',
  `area_code` varchar(100) NOT NULL COMMENT '区域编号',
  `orientation` varchar(36) DEFAULT NULL COMMENT '方位-字典ID',
  `plant_year` int(4) NOT NULL COMMENT '种植年份',
  `age_limit` int(5) NOT NULL COMMENT '茶园年龄',
  `acreage` double(8,2) NOT NULL COMMENT '面积',
  `dic_cultivar_id` varchar(36) NOT NULL COMMENT '栽培品种',
  `elevation` varchar(36) DEFAULT NULL COMMENT '海拔高度',
  `latitude` decimal(20,17) DEFAULT NULL COMMENT '纬度',
  `longitude` decimal(20,17) DEFAULT NULL COMMENT '经度',
  `direction` varchar(36) DEFAULT NULL COMMENT '风向',
  `illumination` varchar(36) DEFAULT NULL COMMENT '光照',
  `status` int(1) NOT NULL,
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  `principal` varchar(36) NOT NULL COMMENT '负责人',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_tea_garden
-- ----------------------------
INSERT INTO `e_tea_garden` VALUES ('8893e29b-d37b-11e7-b5d6-24fd52935962', 'B3细叶乌龙', 'B3', '5eaea1eb-3718-4316-bf63-d34ca1ae75e5', '2010', '1', '19.16', 'e9ce4ae0-2c4e-4563-9292-ee7fe182fe4e', '1500', '1.12300000000000000', null, '5eaea1eb-3718-4316-bf63-d34ca1ae75e5', '', '1', '细叶乌龙123', '我', '8893e29b-d37b-11e7-b5d6-24fd52935962', '2017-11-27 22:02:45', '8893e29b-d37b-11e7-b5d6-24fd52935962', '2017-11-27 22:02:49');
INSERT INTO `e_tea_garden` VALUES ('d038c43b-b1d1-4d2c-9435-aa4ab2267e79', 'B3梅占', 'B3', '5eaea1eb-3718-4316-bf63-d34ca1ae75e5', '2009', '7', '12.00', 'de639eec-dd97-497a-953d-7246247aec95', null, '12.12000000000000000', '123.12312300000000000', '5eaea1eb-3718-4316-bf63-d34ca1ae75e5', '12', '1', '123', '马化腾', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 15:56:44', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 15:56:45');

-- ----------------------------
-- Table structure for e_tea_garden_log
-- ----------------------------
DROP TABLE IF EXISTS `e_tea_garden_log`;
CREATE TABLE `e_tea_garden_log` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `tea_garden_id` varchar(36) DEFAULT NULL COMMENT '茶园',
  `farm_type_id` varchar(36) NOT NULL COMMENT '农事ID',
  `farm_quantity` double(5,2) DEFAULT NULL COMMENT '施肥/除草使用的药剂或其他数量/垦荒面积',
  `farm_time` datetime DEFAULT NULL COMMENT '农事操作时间',
  `farm_pattern` varchar(36) DEFAULT NULL COMMENT '农事操作方式/措施',
  `fert_variety` varchar(36) DEFAULT NULL COMMENT '种子来源/施肥品种/病虫害对象',
  `cultivar_id` varchar(36) DEFAULT NULL COMMENT '种子品种',
  `batch_num` varchar(36) DEFAULT NULL COMMENT '管理批次',
  `operator_id` varchar(36) DEFAULT NULL COMMENT '操作人ID(目前不关联用户使用手动输入)',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  `end_time` datetime DEFAULT NULL,
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_id` varchar(36) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_tea_garden_log
-- ----------------------------
INSERT INTO `e_tea_garden_log` VALUES ('0ab9aebd-e25a-4d9d-8762-bc246cf7ea28', '8893e29b-d37b-11e7-b5d6-24fd52935962', '1689fac5-4b03-4d4b-94c1-d1bbbe8d06ee', '19.90', '2017-12-21 16:12:21', null, '4e1644d7-4997-4304-931e-08b03a477f39', 'e9ce4ae0-2c4e-4563-9292-ee7fe182fe4e', '3eccf0b4-bdfc-47cb-b7c4-c883bd0a8ccc', '啊', '1', '啊', null, '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 16:28:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 16:28:49');
INSERT INTO `e_tea_garden_log` VALUES ('23923d1a-52d7-495b-ba28-e200f9609519', '8893e29b-d37b-11e7-b5d6-24fd52935962', 'd5bbd9b5-91c4-48c2-b5f8-0c7328f8902f', '0.00', '2017-12-21 16:12:40', '152a5745-3cac-4beb-8d31-f4670e7ccf08', null, null, '3eccf0b4-bdfc-47cb-b7c4-c883bd0a8ccc', '我', '1', '我', null, '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 16:30:16', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 16:30:16');
INSERT INTO `e_tea_garden_log` VALUES ('3dcf4ced-78db-40f0-9a2f-f14034ddde0a', '8893e29b-d37b-11e7-b5d6-24fd52935962', '5fe37095-7d9a-4235-914f-cf0c6f1e592a', '10.00', '2017-12-21 16:12:17', 'd556160f-91d4-4316-bf11-7035e863a102', null, null, '3eccf0b4-bdfc-47cb-b7c4-c883bd0a8ccc', '我', '1', '我', null, '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 16:32:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 16:32:24');
INSERT INTO `e_tea_garden_log` VALUES ('55728282-2bf0-4d0b-9e0d-a95058b94a90', '8893e29b-d37b-11e7-b5d6-24fd52935962', 'e1f3e464-31c2-46b5-8e20-20d7ea12fb3f', '1.00', '2017-12-21 18:12:22', '102b6d54-94f9-4ae4-a8a4-427978096e19', '甲虫A', null, '3eccf0b4-bdfc-47cb-b7c4-c883bd0a8ccc', '我', '1', '是', null, '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 16:31:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 16:31:11');
INSERT INTO `e_tea_garden_log` VALUES ('611f04b8-26a2-4a97-950f-d93030eea44c', '8893e29b-d37b-11e7-b5d6-24fd52935962', '4b2946d6-ec92-403f-ae59-6a2d6311e6cd', '20.00', '2017-12-21 15:12:18', null, '1', null, '225a6caa-43db-41ff-a9d2-56e03186eb94', '我', '1', '我', null, '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 15:58:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 15:58:37');
INSERT INTO `e_tea_garden_log` VALUES ('83121bb4-192c-49db-890e-585ae1a8eb4c', null, '43512930-9822-48b4-b577-e900c4a12504', '12.00', '2017-12-21 15:12:06', null, 'KH0001', null, '225a6caa-43db-41ff-a9d2-56e03186eb94', '我', '1', '今天垦荒', null, '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 15:56:36', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 15:56:36');
INSERT INTO `e_tea_garden_log` VALUES ('e7ae21c3-feef-41cc-9a82-790a91760feb', '8893e29b-d37b-11e7-b5d6-24fd52935962', 'd687763c-2a2e-41a7-b57d-71e9caebf579', '19.90', '2017-12-21 16:12:07', '6fbd9b32-81bd-45f8-9906-5c219354e2cb', 'fb283fdc-fe15-4134-9df0-78082cf7451c', null, '3eccf0b4-bdfc-47cb-b7c4-c883bd0a8ccc', '我', '1', '我', null, '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 16:29:33', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 16:29:33');

-- ----------------------------
-- Table structure for s_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `s_dictionary`;
CREATE TABLE `s_dictionary` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `sort_id` int(11) NOT NULL DEFAULT '0' COMMENT '排序id',
  `parent_id` varchar(36) NOT NULL COMMENT '父级id',
  `name` varchar(50) NOT NULL COMMENT '字典名称',
  `value` varchar(50) NOT NULL COMMENT '属性值',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_dictionary
-- ----------------------------
INSERT INTO `s_dictionary` VALUES ('01980df1-e742-4891-b449-a6ae4be190cc', '1', '7dcd4ffe-3041-4ce7-ae5f-ac3ba811ff71', '茶园类', 'teaGardenInfo', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:47:55', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:47:55', '1', '茶园信息类型');
INSERT INTO `s_dictionary` VALUES ('01b33909-73b8-45d9-af2e-5f57a22895c1', '8', '1e12732d-246e-11e5-965c-000c29d7a3a0', '抽检', 'qualityTest', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:43:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:43:49', '1', '内部质检-');
INSERT INTO `s_dictionary` VALUES ('02e71242-9fea-11e5-a07b-000c29d29d54', '11', '10000000-0000-0000-0000-000000000000', '设备类型', 'customerType', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-11 17:16:00', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-12-19 13:52:55', '1', '设备类型');
INSERT INTO `s_dictionary` VALUES ('094cac42-096c-47e1-96bd-3608b58703c7', '2', '67c57cec-8621-40cc-ab3e-2bc3fd487c58', '喷灌', 'sprayIrrigation', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 15:00:27', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 15:00:27', '1', '喷灌');
INSERT INTO `s_dictionary` VALUES ('0b9ed538-29d6-11e5-965c-000c29d7a3a0', '9', '10000000-0000-0000-0000-000000000000', '加工类型', 'machinType', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:48:21', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-12-19 13:52:49', '1', '加工类型 -machiningType');
INSERT INTO `s_dictionary` VALUES ('0fb92203-be20-4705-87e8-ae6862a91743', '3', 'f63fe4f8-27ab-11e5-965c-000c29d7a3a0', '二等', '3', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:11:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:29:08', '1', '二等');
INSERT INTO `s_dictionary` VALUES ('102b6d54-94f9-4ae4-a8a4-427978096e19', '2', 'bc9b6739-d94f-4fb4-a54d-c88255cf0f22', '化学', 'chemicalWeeding', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:22:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:22:08', '1', '化学除草');
INSERT INTO `s_dictionary` VALUES ('1301e136-8d75-4e05-9fa3-06cbdcad1eea', '1', '68d6888f-2b91-11e5-965c-000c29d7a3a0', '自检', 'incheck', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:02:23', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:03:01', '1', '公司内部QC质检');
INSERT INTO `s_dictionary` VALUES ('152a5745-3cac-4beb-8d31-f4670e7ccf08', '1', 'bc9b6739-d94f-4fb4-a54d-c88255cf0f22', '物理', 'physicalWeeding', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:21:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:21:30', '1', '物理除草');
INSERT INTO `s_dictionary` VALUES ('153a683d-f7da-4853-ad65-4438ff0af8c3', '6', 'ab73bbbb-f7ca-4fe9-a086-296e57b9c3ac', '东南', 'southeast', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 14:02:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 14:02:29', '1', '东南');
INSERT INTO `s_dictionary` VALUES ('155a1b9b-5fbb-11e7-8697-38d547b81379', '2', '10000000-0000-0000-0000-000000000000', '用户类型', 'userType', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:46:27', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:46:27', '1', '用户类型');
INSERT INTO `s_dictionary` VALUES ('16595d6b-b5f0-4b49-970d-2c26c691e66a', '2', '1e12732d-246e-11e5-965c-000c29d7a3a0', '萎凋', 'WD', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:49:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:49:19', '1', '萎凋');
INSERT INTO `s_dictionary` VALUES ('1689fac5-4b03-4d4b-94c1-d1bbbe8d06ee', '3', '92253cc8-2128-11e5-965c-000c29d7a3a0', '种植', 'seed', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:30:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 17:14:14', '1', '茶园属性播种');
INSERT INTO `s_dictionary` VALUES ('1699d859-66af-4ea6-8913-0a1e0899f5de', '1', '02e71242-9fea-11e5-a07b-000c29d29d54', '烘烤设备', 'bakefacility', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:05:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:05:40', '1', '此处为示例内容');
INSERT INTO `s_dictionary` VALUES ('19c89bde-0a44-405e-b09e-a7220a8e627c', '2', '963c5d6c-7015-4f92-9b9c-80b274ab10d4', '一芽二叶', 'obt', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 17:57:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 17:57:46', '1', '一芽二叶');
INSERT INTO `s_dictionary` VALUES ('1e12732d-246e-11e5-965c-000c29d7a3a0', '6', '10000000-0000-0000-0000-000000000000', '加工工序', 'machinProcess', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:48:28', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-16 22:46:34', '1', 'machiningType');
INSERT INTO `s_dictionary` VALUES ('1fc53559-ed54-4897-95a1-9af0c99c6c05', '3', '67c57cec-8621-40cc-ab3e-2bc3fd487c58', '漫灌', 'flooding', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 15:00:55', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 15:00:55', '1', '漫灌');
INSERT INTO `s_dictionary` VALUES ('203ebb76-6a7a-4710-a234-7750c8d5358d', '1', 'ba259a75-f5a7-4897-949f-1c90b7958b35', '未激活', '0', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-25 15:52:20', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-25 15:57:52', '1', '未开启的状态');
INSERT INTO `s_dictionary` VALUES ('2192b69e-e600-461f-b7f6-57a9134e12cc', '4', '155a1b9b-5fbb-11e7-8697-38d547b81379', '用户', 'user', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-25 15:42:23', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-25 15:42:23', '1', '普通用户类型');
INSERT INTO `s_dictionary` VALUES ('241f8263-5e9e-4479-8463-4b902f54e736', '1', '155a1b9b-5fbb-11e7-8697-38d547b81379', '管理员', 'manager', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:51:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-25 15:38:23', '1', '管理员类型');
INSERT INTO `s_dictionary` VALUES ('26b273b3-a49b-4910-a68c-23a1fde3ece0', '3', '68d6888f-2b91-11e5-965c-000c29d7a3a0', '送检', 'inspect', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:04:05', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:04:05', '1', '第三方机构送检');
INSERT INTO `s_dictionary` VALUES ('28dd1122-1981-4035-a57a-47edc20884b8', '1', '6d493a67-1545-4022-b7d4-2854c5b70abd', '轻压', 'pressureo', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 19:01:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 19:01:30', '1', '第一次揉捻');
INSERT INTO `s_dictionary` VALUES ('31783870-956f-469f-b43e-9fefd905afca', '7', '10000000-0000-0000-0000-000000000000', '所属茶系', 'teaAttr', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:53:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:53:47', '1', '茶系字典');
INSERT INTO `s_dictionary` VALUES ('336dd879-f833-4eee-ad08-fc5f60953f20', '3', '7dcd4ffe-3041-4ce7-ae5f-ac3ba811ff71', '质检', 'quality', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:49:05', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:49:05', '1', '质检类型消息');
INSERT INTO `s_dictionary` VALUES ('3b7dc807-11d0-4884-b63c-78c929e28bec', '5', '10000000-0000-0000-0000-000000000000', '种子来源', 'seedOrigin', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:07:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:07:41', '1', '种子来源');
INSERT INTO `s_dictionary` VALUES ('43512930-9822-48b4-b577-e900c4a12504', '1', '92253cc8-2128-11e5-965c-000c29d7a3a0', '垦荒', 'reclaim', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:40:58', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:40:58', '1', 'reclaim');
INSERT INTO `s_dictionary` VALUES ('445159a9-665f-49fb-9505-d68f7a02685e', '1', '963c5d6c-7015-4f92-9b9c-80b274ab10d4', '一芽一叶', 'obo', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 17:57:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 17:57:29', '1', '一芽一叶');
INSERT INTO `s_dictionary` VALUES ('4b0cedd9-13be-4759-9e00-2f705d7770d6', '4', '7dcd4ffe-3041-4ce7-ae5f-ac3ba811ff71', '产品', 'product', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:49:32', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:49:32', '1', '产品消息');
INSERT INTO `s_dictionary` VALUES ('4b2946d6-ec92-403f-ae59-6a2d6311e6cd', '2', '92253cc8-2128-11e5-965c-000c29d7a3a0', '耕地', 'plough', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:30:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:41:52', '1', '茶园当前操作为耕地');
INSERT INTO `s_dictionary` VALUES ('4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '1', '31783870-956f-469f-b43e-9fefd905afca', '绿茶', 'GREENTEA', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:55:32', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:00:20', '1', 'CXLC （茶系-绿茶）首字母大写');
INSERT INTO `s_dictionary` VALUES ('4c387b0a-5c56-43fc-8e5a-9050df95b2c0', '2', 'ba259a75-f5a7-4897-949f-1c90b7958b35', '激活', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-25 15:52:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-25 15:53:37', '1', '使用中的状态');
INSERT INTO `s_dictionary` VALUES ('4dc6f1b2-5bbb-4324-9d74-b318dab9e8a3', '2', '0b9ed538-29d6-11e5-965c-000c29d7a3a0', '成品', 'finished', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 20:50:48', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 20:50:48', '1', '加工完成的类型');
INSERT INTO `s_dictionary` VALUES ('4e1644d7-4997-4304-931e-08b03a477f39', '1', '3b7dc807-11d0-4884-b63c-78c929e28bec', '培育基地A', 'baseA', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:08:38', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:08:38', '1', '培育基地A');
INSERT INTO `s_dictionary` VALUES ('50e0fd8b-573c-4e3d-aee6-73582467b852', '4', '963c5d6c-7015-4f92-9b9c-80b274ab10d4', '单叶', 'cutForm', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 17:58:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 17:58:42', '1', '单叶');
INSERT INTO `s_dictionary` VALUES ('53389185-9001-44cc-8c53-83c862b6dc64', '4', 'be0ba01c-23ad-11e5-965c-000c29d7a3a0', '马山4号', 'MS4', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:46:43', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 12:02:23', '1', 'MS4');
INSERT INTO `s_dictionary` VALUES ('5382c8cc-27ad-4b2e-8842-b1d194403753', '1', '0b9ed538-29d6-11e5-965c-000c29d7a3a0', '半成品', 'halfProducts', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 20:49:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 20:49:40', '1', '粗加工的产品');
INSERT INTO `s_dictionary` VALUES ('54398001-2a31-42a9-9fed-9d3ce4612fed', '2', '155a1b9b-5fbb-11e7-8697-38d547b81379', '商户', 'merchant', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:52:58', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-25 15:41:01', '1', '门店和经销商');
INSERT INTO `s_dictionary` VALUES ('56a4a63d-2cb8-474d-8da4-9bc9bce662e7', '1', '1e12732d-246e-11e5-965c-000c29d7a3a0', '鲜叶', 'XY', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:48:38', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-22 15:21:45', '2', '鲜叶');
INSERT INTO `s_dictionary` VALUES ('590b26ce-356c-4a4f-82f3-b02aca313238', '7', '1e12732d-246e-11e5-965c-000c29d7a3a0', '筛选', 'screen', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:40:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:40:24', '1', '筛选工序');
INSERT INTO `s_dictionary` VALUES ('5eaea1eb-3718-4316-bf63-d34ca1ae75e5', '1', 'ab73bbbb-f7ca-4fe9-a086-296e57b9c3ac', '向东', 'eastward', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 13:59:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 13:59:13', '1', '方向');
INSERT INTO `s_dictionary` VALUES ('5fe37095-7d9a-4235-914f-cf0c6f1e592a', '7', '92253cc8-2128-11e5-965c-000c29d7a3a0', '灌溉', 'irrigate', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:16:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:41:34', '1', '茶园灌溉');
INSERT INTO `s_dictionary` VALUES ('65bac923-24d4-4a61-b933-ca3bd1fae8ae', '4', 'f63fe4f8-27ab-11e5-965c-000c29d7a3a0', '三等', '4', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:11:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:29:14', '1', '三等');
INSERT INTO `s_dictionary` VALUES ('6767343c-2716-4dd6-a82b-dd028009711b', '3', 'ab73bbbb-f7ca-4fe9-a086-296e57b9c3ac', '向西', 'westward', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 14:00:17', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 14:00:17', '1', '向西');
INSERT INTO `s_dictionary` VALUES ('67c57cec-8621-40cc-ab3e-2bc3fd487c58', '6', '10000000-0000-0000-0000-000000000000', '灌溉方式', 'irrigationRegime', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:59:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:59:15', '1', '灌溉方式');
INSERT INTO `s_dictionary` VALUES ('68d6888f-2b91-11e5-965c-000c29d7a3a0', '10', '10000000-0000-0000-0000-000000000000', '质检类型', 'attestation', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:52:05', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-12-19 13:52:52', '1', '质检类型');
INSERT INTO `s_dictionary` VALUES ('6b0548af-ebdb-4ea8-ab58-0031c6a46994', '8', 'ab73bbbb-f7ca-4fe9-a086-296e57b9c3ac', '西南', 'southwest', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 14:03:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 14:03:21', '1', '西南');
INSERT INTO `s_dictionary` VALUES ('6d173896-2c89-4f7b-9827-fbe0fc9b407b', '4', 'ab73bbbb-f7ca-4fe9-a086-296e57b9c3ac', '向北', 'northerliness', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 14:00:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 14:00:50', '1', '向北');
INSERT INTO `s_dictionary` VALUES ('6d493a67-1545-4022-b7d4-2854c5b70abd', '6', '10000000-0000-0000-0000-000000000000', '揉捻工序', 'rollingType', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 19:00:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 19:00:24', '1', '揉捻工序分类');
INSERT INTO `s_dictionary` VALUES ('6fbd9b32-81bd-45f8-9906-5c219354e2cb', '2', 'c0de59f4-63a7-11e7-b264-000c29b92c50', '茎叶施肥', 'leafFertilizer', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 13:48:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 13:48:47', '1', '茎叶施肥');
INSERT INTO `s_dictionary` VALUES ('74125ba6-0ec1-4286-b9c2-f56d95fe4ac4', '2', 'f63fe4f8-27ab-11e5-965c-000c29d7a3a0', '一等', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:10:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:29:05', '1', '一等品级');
INSERT INTO `s_dictionary` VALUES ('7dcd4ffe-3041-4ce7-ae5f-ac3ba811ff71', '12', '10000000-0000-0000-0000-000000000000', '溯源类型', 'originType', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:46:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 13:54:23', '1', '溯源信息类型设置');
INSERT INTO `s_dictionary` VALUES ('8978edce-c9c6-11e7-8126-38d547b81379', '2', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '删除', 'delete', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-15 13:33:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-26 10:16:25', '1', '删除');
INSERT INTO `s_dictionary` VALUES ('8a3e0d08-ca66-48b7-9924-b98d98fd193d', '2', '31783870-956f-469f-b43e-9fefd905afca', '红茶', 'REDTEA', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:55:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:01:03', '1', '红茶典范');
INSERT INTO `s_dictionary` VALUES ('8a71952c-9278-4882-b9bd-e8267f50aefa', '7', 'ab73bbbb-f7ca-4fe9-a086-296e57b9c3ac', '西北', 'northwest', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 14:02:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 14:02:50', '1', '西北');
INSERT INTO `s_dictionary` VALUES ('8aa97837-a152-49be-98b8-47a11c3b1de4', '4', '1e12732d-246e-11e5-965c-000c29d7a3a0', '揉捻', 'RN', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:49:35', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:49:35', '1', '揉捻');
INSERT INTO `s_dictionary` VALUES ('909b76dd-b521-4255-b2e6-1b2f4767f65a', '2', '7dcd4ffe-3041-4ce7-ae5f-ac3ba811ff71', '加工', 'machinType', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:48:23', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 15:48:23', '1', '加工类型');
INSERT INTO `s_dictionary` VALUES ('9162c28b-e360-4e44-9e7d-a79b843f3645', '3', '155a1b9b-5fbb-11e7-8697-38d547b81379', '会员', 'member', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:51:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-25 15:39:51', '1', '标识为会员的用户');
INSERT INTO `s_dictionary` VALUES ('92253cc8-2128-11e5-965c-000c29d7a3a0', '4', '10000000-0000-0000-0000-000000000000', '农事类型', 'teaStatus', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-10 13:16:08', 'fd8b9374-2134-4eb2-b7c7-0019d65d94b2', '2017-11-28 09:52:39', '1', '茶园状态');
INSERT INTO `s_dictionary` VALUES ('963c5d6c-7015-4f92-9b9c-80b274ab10d4', '10', '10000000-0000-0000-0000-000000000000', '采摘标准', 'pickStandard', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 17:56:45', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 17:56:45', '1', '采摘标准');
INSERT INTO `s_dictionary` VALUES ('9bda9313-c9c6-11e7-8126-38d547b81379', '3', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '编辑', 'edit', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-15 13:34:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-26 10:16:25', '1', '编辑');
INSERT INTO `s_dictionary` VALUES ('9d590186-c9c6-11e7-8126-38d547b81379', '4', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '导出', 'export', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-15 13:34:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-26 10:16:25', '1', '导出');
INSERT INTO `s_dictionary` VALUES ('9d9438d9-7746-4b14-adb7-d29136b1778a', '10', '1e12732d-246e-11e5-965c-000c29d7a3a0', '提香', 'titian', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 18:59:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:12:52', '1', '成品加工提香工序');
INSERT INTO `s_dictionary` VALUES ('9e15db46-c9c6-11e7-8126-38d547b81379', '5', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '提交', 'submit', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-15 13:34:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-26 10:16:25', '1', '提交');
INSERT INTO `s_dictionary` VALUES ('9ea19fba-8765-48f7-8a8a-b5ea412bda2e', '3', '1e12732d-246e-11e5-965c-000c29d7a3a0', '杀青', 'SQ', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:47:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:48:42', '1', '杀青');
INSERT INTO `s_dictionary` VALUES ('9eed0607-9fe9-4f3f-9afb-997a93eeaef4', '1', 'c0de59f4-63a7-11e7-b264-000c29b92c50', '土壤施肥', 'soilFertilization', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 13:48:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 13:48:13', '1', '土壤施肥');
INSERT INTO `s_dictionary` VALUES ('9fd1943d-b955-4921-a1cd-76d60126e114', '5', '1e12732d-246e-11e5-965c-000c29d7a3a0', '发酵', 'FJ', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:49:55', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:49:55', '1', '发酵');
INSERT INTO `s_dictionary` VALUES ('a9ce6951-b3ae-4529-90fa-4cfa42afcaad', '2', 'e597a18d-9e8a-4194-b413-54d2d8694f51', '生物肥料', 'biofertilizer', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 13:58:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 13:58:06', '1', '生物肥料');
INSERT INTO `s_dictionary` VALUES ('ab73bbbb-f7ca-4fe9-a086-296e57b9c3ac', '20', '10000000-0000-0000-0000-000000000000', '方位区域', 'areaDirection', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 13:51:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 13:55:35', '1', '方位区域信息集合');
INSERT INTO `s_dictionary` VALUES ('ac3d7fa7-d887-440e-9a41-a5cde1c00ac6', '3', 'c0de59f4-63a7-11e7-b264-000c29b92c50', '灌溉施肥', 'fertigation', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 13:49:17', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 13:49:17', '1', '灌溉施肥');
INSERT INTO `s_dictionary` VALUES ('ac60b692-deb4-426a-a1a5-414e7919449e', '2', '3b7dc807-11d0-4884-b63c-78c929e28bec', '培育基地B', 'baseB', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:09:02', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:09:02', '1', '培育基地B');
INSERT INTO `s_dictionary` VALUES ('ae0576d3-d31c-48fd-9c13-b1b709a4cece', '2', 'ab73bbbb-f7ca-4fe9-a086-296e57b9c3ac', '向南', 'southward', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 13:59:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 13:59:41', '1', '向南');
INSERT INTO `s_dictionary` VALUES ('b1c94b1c-67e4-4e45-a516-0976fb142a81', '1', 'f63fe4f8-27ab-11e5-965c-000c29d7a3a0', '特等', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:11:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:29:01', '1', '特等');
INSERT INTO `s_dictionary` VALUES ('b361f510-501e-4072-aa23-525e4efdf564', '3', '963c5d6c-7015-4f92-9b9c-80b274ab10d4', '一芽多叶', 'obn', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 17:58:05', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 17:58:05', '1', '一芽多叶');
INSERT INTO `s_dictionary` VALUES ('b6315b3a-1587-11e5-a9de-000c29d7a3a0', '1', '10000000-0000-0000-0000-000000000000', '按钮权限', 'roleButtn', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-10 13:16:18', 'fd8b9374-2134-4eb2-b7c7-0019d65d94b2', '2017-11-16 22:35:22', '1', '按钮权限组，以实现分区控制功能');
INSERT INTO `s_dictionary` VALUES ('ba259a75-f5a7-4897-949f-1c90b7958b35', '3', '10000000-0000-0000-0000-000000000000', '状态类型', 'statusType', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-25 15:49:55', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-25 15:49:55', '1', '系统通用的唯一状态');
INSERT INTO `s_dictionary` VALUES ('bc9b6739-d94f-4fb4-a54d-c88255cf0f22', '6', '10000000-0000-0000-0000-000000000000', '除草方式', 'methods', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:20:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:20:46', '1', '除草方式');
INSERT INTO `s_dictionary` VALUES ('be0ba01c-23ad-11e5-965c-000c29d7a3a0', '5', '10000000-0000-0000-0000-000000000000', '茶树品种', 'treeType', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:51:24', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-12-14 17:50:28', '1', '茶园种植的茶树品种');
INSERT INTO `s_dictionary` VALUES ('c0de59f4-63a7-11e7-b264-000c29b92c50', '13', '10000000-0000-0000-0000-000000000000', '施肥方式', 'patternType', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:44:46', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-12-21 13:47:16', '1', '施肥方式');
INSERT INTO `s_dictionary` VALUES ('c307d686-7dce-4b2f-9efb-16fbeb348de6', '6', '1e12732d-246e-11e5-965c-000c29d7a3a0', '炒干', 'GZ', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:50:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 20:31:45', '1', '干燥');
INSERT INTO `s_dictionary` VALUES ('c4aa9993-e8d6-4512-9608-16df191879ed', '5', 'ab73bbbb-f7ca-4fe9-a086-296e57b9c3ac', '东北', 'northeast', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 14:01:43', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 14:01:43', '1', 'northeast');
INSERT INTO `s_dictionary` VALUES ('c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '新增', 'add', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 23:08:25', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 23:08:25', '1', '测试组建唯一');
INSERT INTO `s_dictionary` VALUES ('cc32f7fc-24d6-471a-a5d5-05962737468a', '1', 'be0ba01c-23ad-11e5-965c-000c29d7a3a0', '马山9号', 'MS9', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:44:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 12:01:22', '1', '茶园种植的茶树品种');
INSERT INTO `s_dictionary` VALUES ('ce84f35c-2d8b-4a72-981d-dcbb8150a8c7', '2', '68d6888f-2b91-11e5-965c-000c29d7a3a0', '抽检', 'spotcheck', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:03:33', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:03:33', '1', '抽检');
INSERT INTO `s_dictionary` VALUES ('d556160f-91d4-4316-bf11-7035e863a102', '1', '67c57cec-8621-40cc-ab3e-2bc3fd487c58', '滴灌', 'dropIrrigation', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:59:55', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 14:59:55', '1', '滴灌');
INSERT INTO `s_dictionary` VALUES ('d5bbd9b5-91c4-48c2-b5f8-0c7328f8902f', '5', '92253cc8-2128-11e5-965c-000c29d7a3a0', '除草', 'weeding', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:14:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:42:12', '1', '茶园除草');
INSERT INTO `s_dictionary` VALUES ('d687763c-2a2e-41a7-b57d-71e9caebf579', '4', '92253cc8-2128-11e5-965c-000c29d7a3a0', '施肥', 'fertilizer', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:14:25', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:42:05', '1', '茶园操作-施肥');
INSERT INTO `s_dictionary` VALUES ('d7bd09c0-4114-4445-a2b3-6e17bcb04f09', '3', 'ba259a75-f5a7-4897-949f-1c90b7958b35', '禁用', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-25 15:53:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-25 15:53:31', '1', '禁止使用的状态');
INSERT INTO `s_dictionary` VALUES ('da517c36-6812-4a9d-a4d4-38f633254656', '3', '6d493a67-1545-4022-b7d4-2854c5b70abd', '重压', 'pressurer', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 19:02:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 19:02:11', '1', '第三次揉捻');
INSERT INTO `s_dictionary` VALUES ('de46c408-c9c6-11e7-8126-38d547b81379', '6', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '上传', 'upload', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-15 13:36:02', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-26 10:16:25', '1', '上传');
INSERT INTO `s_dictionary` VALUES ('de639eec-dd97-497a-953d-7246247aec95', '2', 'be0ba01c-23ad-11e5-965c-000c29d7a3a0', '梅占', 'MZ', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:45:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 17:49:20', '1', 'MZ');
INSERT INTO `s_dictionary` VALUES ('deed64de-c9c6-11e7-8126-38d547b81379', '7', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '审核', 'verify', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-15 13:36:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-26 10:16:25', '1', '审核');
INSERT INTO `s_dictionary` VALUES ('e1f3e464-31c2-46b5-8e20-20d7ea12fb3f', '6', '92253cc8-2128-11e5-965c-000c29d7a3a0', '治虫', 'insecticide', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 18:15:35', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:41:24', '1', '茶园治虫');
INSERT INTO `s_dictionary` VALUES ('e597a18d-9e8a-4194-b413-54d2d8694f51', '14', '10000000-0000-0000-0000-000000000000', '肥料品种', 'manureType', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 13:56:33', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 13:56:33', '1', '肥料品种');
INSERT INTO `s_dictionary` VALUES ('e9ce4ae0-2c4e-4563-9292-ee7fe182fe4e', '3', 'be0ba01c-23ad-11e5-965c-000c29d7a3a0', '细叶乌龙', 'SOG', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-27 17:46:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 17:50:09', '1', '马山3号');
INSERT INTO `s_dictionary` VALUES ('f0b5d672-b743-44ce-954d-2eefaf95b11a', '2', '6d493a67-1545-4022-b7d4-2854c5b70abd', '中压', 'pressuret', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 19:01:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 19:01:50', '1', '第二次揉捻');
INSERT INTO `s_dictionary` VALUES ('f63fe4f8-27ab-11e5-965c-000c29d7a3a0', '8', '10000000-0000-0000-0000-000000000000', '质量等级', 'grade', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:50:43', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-12-19 13:52:45', '1', '等级，用于品级产品或对应的商品');
INSERT INTO `s_dictionary` VALUES ('f9e96bed-6103-4a14-9135-e69b7392dc78', '9', '1e12732d-246e-11e5-965c-000c29d7a3a0', '复炒', 'afterFire', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:14:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:14:19', '1', '加工第九道工序');
INSERT INTO `s_dictionary` VALUES ('fb283fdc-fe15-4134-9df0-78082cf7451c', '1', 'e597a18d-9e8a-4194-b413-54d2d8694f51', '有机肥料', 'organicManure', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 13:57:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-21 13:57:15', '1', '有机肥料');
INSERT INTO `s_dictionary` VALUES ('fea1871b-c9c6-11e7-8126-38d547b81379', '8', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '查看', 'view', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-15 13:36:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-26 10:16:25', '1', '查看');

-- ----------------------------
-- Table structure for s_menu
-- ----------------------------
DROP TABLE IF EXISTS `s_menu`;
CREATE TABLE `s_menu` (
  `id` varchar(36) NOT NULL COMMENT '菜单的主键ID',
  `sort_id` int(11) DEFAULT NULL COMMENT '排序ID',
  `parent_id` varchar(36) DEFAULT NULL COMMENT '父级ID',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `type` int(11) DEFAULT NULL,
  `icon_class` varchar(100) DEFAULT NULL COMMENT '菜单Class属性对应菜单的图标样式',
  `status` int(1) NOT NULL DEFAULT '1',
  `create_id` varchar(36) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_menu
-- ----------------------------
INSERT INTO `s_menu` VALUES ('0277b5ce-acca-4f31-a43c-20585768c596', '1', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', '垦荒', '/system/teaLog/reclaim', null, 'flaticon-reclaim', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:47:36', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:54:56', '茶园管理工序');
INSERT INTO `s_menu` VALUES ('02886d5a-211c-4e58-800c-90cf79640ef5', '2', '21136dca-a230-4902-b370-73cedbfd37d1', '生产线', '/system/assembly/list', null, 'flaticon-Assembly', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:52:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:52:57', '生产线管理');
INSERT INTO `s_menu` VALUES ('04c21bbc-f0c1-4981-bbe7-17627cce0664', '2', '3631e59e-1175-11e5-a9de-000c29d7a3a0', '用户管理', '/system/user/getUserList', null, 'flaticon-users', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:30:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 09:48:17', '用户信息管理');
INSERT INTO `s_menu` VALUES ('095c96ce-07e5-4c24-aebb-c743adc3562f', '3', '4bcab523-1174-11e5-a9de-000c29d7a3a0', '测试菜单添加时间', '/system/menu/add', '1', 'flaticon-xxx-1', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 11:25:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 11:25:08', '测试菜单添加时间');
INSERT INTO `s_menu` VALUES ('0a1e90f6-cc25-11e7-843e-24fd52935962', '5', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '角色权限', '/system/pageRole/list', '1', 'flaticon-menu', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-18 13:55:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-18 13:55:11', '角色权限设置');
INSERT INTO `s_menu` VALUES ('0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '1', '10000000-0000-0000-0000-100000000000', '系统管理', '/system/index/main', '1', 'flaticon-settings', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '管理');
INSERT INTO `s_menu` VALUES ('0bc54201-f2e3-4585-a9c7-bb5d9b44e26d', '8', '10000000-0000-0000-0000-100000000000', '溯源管理', '/system/originRecord/list', '1', 'flaticon-folder-1', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:32:44', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:44:45', '溯源信息管理');
INSERT INTO `s_menu` VALUES ('0de2c731-9dd6-4a95-8fef-0fa88b625c98', '1', 'dd6448d3-ade1-40c3-9043-a77c3036f829', '属性管理', '/system/property/list', null, 'flaticon-ware', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:08:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 22:18:59', '仓库信息管理-标记仓库位置信息等');
INSERT INTO `s_menu` VALUES ('0ef5eb36-2a53-4ec0-ab6b-7c5ed02d3ccf', '7', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', '灌溉', '/system/teaLog/irrigate', null, 'flaticon-irrigate', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:54:25', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:55:49', '灌溉');
INSERT INTO `s_menu` VALUES ('10000000-0000-0000-0000-100000000000', '1', '10000000-0000-0000-0000-000000000000', '后台菜单', '/system/index/index', '1', 'flaticon-folder', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-01 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-01 17:38:06', '销售数据分销');
INSERT INTO `s_menu` VALUES ('10000000-0000-0000-0000-200000000000', '2', '10000000-0000-0000-0000-000000000000', '前台菜单', '/home/index', '1', 'flaticon-folder', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-01 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:42:34', '销售数据分销');
INSERT INTO `s_menu` VALUES ('10000000-0000-0000-0000-300000000000', '3', '10000000-0000-0000-0000-000000000000', '微信菜单', '/wechat/index/main', '1', 'flaticon-folder', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-01 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-01 17:38:06', '销售数据分销');
INSERT INTO `s_menu` VALUES ('162e38d7-5b27-488b-9776-e60d7aa07b68', '2', '0bc54201-f2e3-4585-a9c7-bb5d9b44e26d', '溯源设置', '/system/originSet/list', null, 'flaticon-set', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:35:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 11:06:09', '溯源相关信息设置');
INSERT INTO `s_menu` VALUES ('20692517-9187-41df-920b-7c7342a93d37', '3', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '字典管理', '/system/dictionary/list', '1', 'flaticon-xxx', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-06 16:50:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:26:14', '字典信息管理');
INSERT INTO `s_menu` VALUES ('21136dca-a230-4902-b370-73cedbfd37d1', '9', '10000000-0000-0000-0000-100000000000', '设备管理', '/system/equipment/list', '1', 'flaticon-profile-1', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:19:52', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:44:10', '生产设备管理');
INSERT INTO `s_menu` VALUES ('2bb748c6-224b-4fff-a3c2-82b684faf56d', '4', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', '揉捻', '/system/machinTea/rolling', null, 'flaticon-rolling', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 17:12:32', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:56:25', '');
INSERT INTO `s_menu` VALUES ('2c68aa86-891b-4661-ba76-327e8a2a6215', '3', '0bc54201-f2e3-4585-a9c7-bb5d9b44e26d', '溯源信息', '/system/originInfo/list', null, 'flaticon-info', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:33:58', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:22:33', '溯源信息记录');
INSERT INTO `s_menu` VALUES ('2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', '2', 'f5baa02f-7e39-421f-a7dd-c8ee4773966b', '取样记录', '/system/sampling/list', null, 'flaticon-samp', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:18:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:18:24', '质检取样记录管理');
INSERT INTO `s_menu` VALUES ('2dc7b0aa-e46e-4583-9738-72e71de1426c', '2', 'b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '管理批次', '/system/manageBatch/list', null, 'flaticon-batch', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 21:52:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 00:23:00', '茶园批次号生成');
INSERT INTO `s_menu` VALUES ('2fe964ba-f060-47cf-8c81-fcd0ba615d63', '1', '10000000-0000-0000-0000-200000000000', '首页', '/index/main', null, 'flaticon-home', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:43:22', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 15:59:18', '前台菜单啊');
INSERT INTO `s_menu` VALUES ('33fb6e82-2b8b-48fb-af3c-fb886049ca77', '5', '10000000-0000-0000-0000-100000000000', '加工管理', '/system/teaMachin/list', '1', 'flaticon-network', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 23:48:20', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 22:13:01', '茶叶加工流程管理');
INSERT INTO `s_menu` VALUES ('3631e59e-1175-11e5-a9de-000c29d7a3a0', '3', '10000000-0000-0000-0000-100000000000', '客户管理', '/system/ucenter/index', '1', 'flaticon-users', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:25:39', '供应链管理');
INSERT INTO `s_menu` VALUES ('37a082cd-0e38-49f8-b6f1-fc26e05383cc', '4', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', '施肥', '/system/teaLog/fertilizer', null, 'flaticon-fertilizer', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:51:23', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:55:21', '');
INSERT INTO `s_menu` VALUES ('3dacb910-a325-4939-aec5-f1e05218513c', '3', 'dd6448d3-ade1-40c3-9043-a77c3036f829', '标签管理', '/system/tags/list', null, 'flaticon-tags', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 22:31:55', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 22:31:55', '商品标签管理-折扣-优惠-降价-等');
INSERT INTO `s_menu` VALUES ('41220884-50a6-4204-8168-f8e3eb5ad2ce', '2', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', '萎凋', '/system/machinTea/wither', null, 'flaticon-wither', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 17:10:39', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:56:10', '加工步骤2');
INSERT INTO `s_menu` VALUES ('43d5b520-eafe-4f7f-a846-4fba12c9ffab', '4', '10000000-0000-0000-0000-200000000000', '溯源查询', '/index/traceQuery', null, 'flaticon-trace', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:47:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-09 19:07:38', '溯源');
INSERT INTO `s_menu` VALUES ('55638077-269d-41fc-981e-d6f8eeaee8f3', '6', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', '干燥', '/system/machinTea/dry', null, 'flaticon-dry', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 17:13:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:56:40', '');
INSERT INTO `s_menu` VALUES ('55f9ecb5-b899-4321-952f-64a1f579d2c2', '2', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', '耕地', '/system/teaLog/plough', null, 'flaticon-plough', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:48:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:55:05', '耕地');
INSERT INTO `s_menu` VALUES ('5863e4f5-927d-4c96-8bda-2294703bc909', '2', 'dd6448d3-ade1-40c3-9043-a77c3036f829', '类别管理', '/system/category/list', null, 'flaticon-inven', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:10:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 22:30:15', '商品类别管理');
INSERT INTO `s_menu` VALUES ('5903d97e-84bc-4a0b-b45b-0b61acd2d238', '5', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', '发酵', '/system/machinTea/fermentation', null, 'flaticon-fermentation', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 17:13:10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:56:32', '');
INSERT INTO `s_menu` VALUES ('5a90ce13-c8ce-43c6-a9ed-21fd4a4fb2c5', '1', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', '鲜叶', '/system/harvest/list', null, 'flaticon-pick', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 16:11:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-22 09:34:40', '鲜叶采摘');
INSERT INTO `s_menu` VALUES ('5af24cc1-0a73-4f28-8972-dae2f138c1a8', '3', 'b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '茶园日志', '/system/teaLog/list', '1', 'flaticon-app-1', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 23:44:10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 21:54:27', '记录茶园操作日志');
INSERT INTO `s_menu` VALUES ('5d2f2a0d-9326-4026-b338-c03bf6e255db', '11', '10000000-0000-0000-0000-100000000000', '包装管理', '/system/packing/list', '1', 'flaticon-bag', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:11:43', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:41:50', '产品包装信息等');
INSERT INTO `s_menu` VALUES ('682cc88a-5424-4f14-8298-bf19a8c1a726', '3', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', '杀青', '/system/machinTea/killOut', null, 'flaticon-killOut', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 17:11:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:56:18', '加工步骤3');
INSERT INTO `s_menu` VALUES ('68522995-30dc-4fb0-97d8-7468e6af4853', '2', '10000000-0000-0000-0000-200000000000', '产品库', '/index/products', null, 'flaticon-products', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:44:45', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 15:48:04', '商品展示产品库');
INSERT INTO `s_menu` VALUES ('6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', '1', 'f5baa02f-7e39-421f-a7dd-c8ee4773966b', '质检记录', '/system/quality/list', null, 'flaticon-process', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:17:01', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-04 11:40:34', '质检记录管理');
INSERT INTO `s_menu` VALUES ('76849bfe-dfd4-476c-b2f8-11072c25ceb8', '1', 'b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '茶园信息', '/system/origin/teaGarden', '1', 'flaticon-list-3', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:41:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 23:40:03', '茶园信息管理');
INSERT INTO `s_menu` VALUES ('80787bb8-4542-434b-95e4-54b48c58be4f', '2', '0bc54201-f2e3-4585-a9c7-bb5d9b44e26d', '溯源编号', '/system/originCode/list', null, 'flaticon-code', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:07:56', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:22:29', '溯源编码');
INSERT INTO `s_menu` VALUES ('86b97cad-9b5d-4ab9-8bd6-fab7de92d5da', '6', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', '治虫', '/system/teaLog/insecticide', null, 'flaticon-insecticide', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:53:38', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:55:42', '病虫害防治');
INSERT INTO `s_menu` VALUES ('8c4baf7a-a6dd-4f0a-aa13-4078f6c74320', '5', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', '除草', '/system/teaLog/weeding', null, 'flaticon-weeding', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:52:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:55:34', '');
INSERT INTO `s_menu` VALUES ('91d81894-dca3-4738-a408-77d23108a710', '0', 'dd6448d3-ade1-40c3-9043-a77c3036f829', '产品管理', '/system/products/list', null, 'flaticon-products', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 22:34:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:00:58', '商品库存管理');
INSERT INTO `s_menu` VALUES ('96e55b56-ab35-4774-a248-14a683a932e7', '2', '33fb6e82-2b8b-48fb-af3c-fb886049ca77', '加工批次', '/system/processBatch/list', null, 'flaticon-mac-b', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 21:54:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-22 17:08:02', '加工批次加工批次');
INSERT INTO `s_menu` VALUES ('97ea6edb-1178-11e5-a9de-000c29d7a3a0', '7', '10000000-0000-0000-0000-100000000000', '财务管理', '/system/demand/index', '1', 'flaticon-coins', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '财务结算中心');
INSERT INTO `s_menu` VALUES ('b17105b9-8da9-47b7-a4b1-7dbcfa60d250', '1', '68522995-30dc-4fb0-97d8-7468e6af4853', '产品二级', '/index/products/list', null, 'flaticon-location', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 14:37:52', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 15:48:13', '产品二级');
INSERT INTO `s_menu` VALUES ('b246e414-5c86-468e-81e0-0edf77710e3f', '3', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', '种植', '/system/teaLog/seed', null, 'flaticon-seed', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:50:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-19 17:55:14', '播种');
INSERT INTO `s_menu` VALUES ('b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '4', '10000000-0000-0000-0000-100000000000', '茶园管理', '/system/origin/teaGarden', '1', 'flaticon-tea-cup', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:31:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 23:40:26', '茶园管理模块');
INSERT INTO `s_menu` VALUES ('baf74d02-a7fa-41cf-a7c6-d1e5da805701', '1', '0bc54201-f2e3-4585-a9c7-bb5d9b44e26d', '溯源批次', '/system/originBatch/list', null, 'flaticon-orginb', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-06 17:45:53', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 14:22:24', '按批次生成溯源编号,提供溯源使用');
INSERT INTO `s_menu` VALUES ('c3538d54-8e09-11e6-b311-005056812bf6', '10', '10000000-0000-0000-0000-100000000000', '订单管理', '/system/operation/index', '1', 'flaticon-truck', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '跨境物流管理');
INSERT INTO `s_menu` VALUES ('caf65c04-beed-11e7-959c-38d547b81379', '1', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '菜单管理', '/system/menu/list', '1', 'flaticon-app', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '菜单信息管理');
INSERT INTO `s_menu` VALUES ('ce43305b-a658-4e8c-b864-10b6ee797429', '1', '5d2f2a0d-9326-4026-b338-c03bf6e255db', '包材管理', '/system/packageMaterial/list', null, 'flaticon-mate', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:13:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:13:42', '包材材料管理');
INSERT INTO `s_menu` VALUES ('d07687ef-2798-11e5-965c-000c29d7a3a0', '1', '3631e59e-1175-11e5-a9de-000c29d7a3a0', '门店管理', '/system/store/getStoreList', '1', 'flaticon-map', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 09:48:09', '个人中心、会员中心');
INSERT INTO `s_menu` VALUES ('d2aad1f2-4230-4aee-a1f1-91a6a6c5db40', '4', '21136dca-a230-4902-b370-73cedbfd37d1', '维护记录', '/system/maintain/list', null, 'flaticon-main', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:22:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-24 20:03:25', '设备保养记录');
INSERT INTO `s_menu` VALUES ('d6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', '3', '33fb6e82-2b8b-48fb-af3c-fb886049ca77', '茶叶加工', '/system/machinTea/list', null, 'flaticon-machin-tea', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 21:19:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 21:54:31', '茶叶加工工序');
INSERT INTO `s_menu` VALUES ('d942abc1-b177-452e-8c53-1914ac448c7d', '4', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '角色菜单', '/system/roleMenu/list', '1', 'flaticon-menu', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-08 17:50:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-08 17:53:27', '角色菜单设置');
INSERT INTO `s_menu` VALUES ('dd6448d3-ade1-40c3-9043-a77c3036f829', '2', '10000000-0000-0000-0000-100000000000', '库存管理', '/system/stockManager/list', '1', 'flaticon-open-box', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:04:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 22:14:32', '库存信息管理');
INSERT INTO `s_menu` VALUES ('ded1d6eb-2c41-407e-9a3e-bf3615ced9ff', '3', '10000000-0000-0000-0000-200000000000', '关于我们', '/index/about', null, 'flaticon-aboutus', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:46:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 16:01:44', '企业介绍');
INSERT INTO `s_menu` VALUES ('df1a659b-180f-4fd2-abb0-b42c7db62714', '1', '33fb6e82-2b8b-48fb-af3c-fb886049ca77', '加工设置', '/system/machinSet/list', null, 'flaticon-machin', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:03:25', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 21:17:26', '加工的事情');
INSERT INTO `s_menu` VALUES ('e38ab74b-bf14-11e7-a301-24fd52935962', '2', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '角色管理', '/system/roles/list', '1', 'flaticon-profile', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-01 22:56:49', '角色信息管理');
INSERT INTO `s_menu` VALUES ('e4b9b1d7-79da-4490-9bce-5d2a78d150b9', '1', '68522995-30dc-4fb0-97d8-7468e6af4853', '测试二级', '/index/test', null, 'flaticon-location', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 14:36:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 15:48:23', '');
INSERT INTO `s_menu` VALUES ('f04e0fcf-11b2-42a9-90f8-b8d0002f78cf', '4', 'dd6448d3-ade1-40c3-9043-a77c3036f829', '评论管理', '/system/comment/list', null, 'flaticon-comm', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 22:36:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 22:36:29', '商品评论管理');
INSERT INTO `s_menu` VALUES ('f5baa02f-7e39-421f-a7dd-c8ee4773966b', '6', '10000000-0000-0000-0000-100000000000', '质检管理', '/system/quality/list', '1', 'flaticon-notes', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:15:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:43:25', '产品质量管理');
INSERT INTO `s_menu` VALUES ('fb69a533-1178-11e5-a9de-000c29d7a3a0', '12', '10000000-0000-0000-0000-100000000000', '数据管理', '/system/data/index', '1', 'flaticon-folder', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 14:06:47', '销售数据分销');
INSERT INTO `s_menu` VALUES ('fd1d49d4-0d1d-4294-a304-c1ae7432e53b', '1', '21136dca-a230-4902-b370-73cedbfd37d1', '设备信息', '/system/equipment/list', null, 'flaticon-equipment', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:51:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:51:30', '设备信息管理');

-- ----------------------------
-- Table structure for s_page_role
-- ----------------------------
DROP TABLE IF EXISTS `s_page_role`;
CREATE TABLE `s_page_role` (
  `id` varchar(36) NOT NULL,
  `menu_id` varchar(36) DEFAULT NULL COMMENT '菜单编号',
  `role_id` varchar(36) DEFAULT NULL COMMENT '角色编号',
  `dict_id` varchar(36) DEFAULT NULL COMMENT '字典编号',
  `status` int(1) NOT NULL DEFAULT '1',
  `create_id` varchar(36) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '最后一次修改ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_page_role
-- ----------------------------
INSERT INTO `s_page_role` VALUES ('000c3753-3445-4b1f-947c-f063bb3cab83', '37a082cd-0e38-49f8-b6f1-fc26e05383cc', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:39', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:39');
INSERT INTO `s_page_role` VALUES ('00170715-3203-4453-b2b8-701796e92b0b', '96e55b56-ab35-4774-a248-14a683a932e7', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:43', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:43');
INSERT INTO `s_page_role` VALUES ('00b8596c-480e-4325-ae5b-9d934e0ffb69', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:08');
INSERT INTO `s_page_role` VALUES ('01d6af40-b865-4bba-8fca-c0d3090f2338', '0277b5ce-acca-4f31-a43c-20585768c596', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:07');
INSERT INTO `s_page_role` VALUES ('020e0cea-5869-480e-b77d-c20980e679ab', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:49');
INSERT INTO `s_page_role` VALUES ('021b1a8e-808b-4786-8a67-e9962d861c72', '0ef5eb36-2a53-4ec0-ab6b-7c5ed02d3ccf', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:06');
INSERT INTO `s_page_role` VALUES ('03f72f42-ce60-4bdc-9c33-9a25827d8eb4', '20692517-9187-41df-920b-7c7342a93d37', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:47');
INSERT INTO `s_page_role` VALUES ('046db5f9-9fcc-4bf3-b18c-8f2dfbeb3e92', '5a90ce13-c8ce-43c6-a9ed-21fd4a4fb2c5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:16', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:16');
INSERT INTO `s_page_role` VALUES ('04f7dbe2-75fe-4e14-b267-c7ae859c5987', 'e38ab74b-bf14-11e7-a301-24fd52935962', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:54');
INSERT INTO `s_page_role` VALUES ('051c7747-7236-444e-8bfa-d1885be4d86f', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:30');
INSERT INTO `s_page_role` VALUES ('05b81bd7-f77b-47e0-953b-94f4fdb97d7c', '55638077-269d-41fc-981e-d6f8eeaee8f3', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:28');
INSERT INTO `s_page_role` VALUES ('05d22852-2840-4157-8ca5-c781bf963b2f', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:54');
INSERT INTO `s_page_role` VALUES ('05decbae-95d0-49a8-9547-1685c4b3b789', '55638077-269d-41fc-981e-d6f8eeaee8f3', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:30');
INSERT INTO `s_page_role` VALUES ('0671c676-ab4e-416a-a5fa-dcb70a3844dd', '682cc88a-5424-4f14-8298-bf19a8c1a726', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:42');
INSERT INTO `s_page_role` VALUES ('07b89c9a-69ab-46f1-ae91-60eb6c0c71b4', 'e38ab74b-bf14-11e7-a301-24fd52935962', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:42');
INSERT INTO `s_page_role` VALUES ('08082911-41da-4483-8708-3a78c37ca5a7', 'fd1d49d4-0d1d-4294-a304-c1ae7432e53b', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:07');
INSERT INTO `s_page_role` VALUES ('0884e847-bac3-4fe0-8196-f8da4e0e23cb', '5903d97e-84bc-4a0b-b45b-0b61acd2d238', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:22', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:22');
INSERT INTO `s_page_role` VALUES ('089aa77d-0666-4b0d-90d1-6e3061d248f6', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:56', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:56');
INSERT INTO `s_page_role` VALUES ('0910489b-1e70-4b89-bc86-aaf1e514e201', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:21');
INSERT INTO `s_page_role` VALUES ('0bdd164f-3a72-47d7-be92-3ef6b52e1965', '5a90ce13-c8ce-43c6-a9ed-21fd4a4fb2c5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:20', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:20');
INSERT INTO `s_page_role` VALUES ('0bfa53f6-f542-4612-8370-f1497f1f83c7', '2dc7b0aa-e46e-4583-9738-72e71de1426c', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:14');
INSERT INTO `s_page_role` VALUES ('0d6925a7-dce4-4b22-b982-6d7e1172b5cb', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:37');
INSERT INTO `s_page_role` VALUES ('0d76899a-bb82-4a78-9e42-006f0af8e5f8', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:15');
INSERT INTO `s_page_role` VALUES ('0f93d0c3-01aa-4d73-af44-dcf67415148e', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:04', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:04');
INSERT INTO `s_page_role` VALUES ('0ffdc442-2544-4fe5-bbd4-5245f1f88394', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:31');
INSERT INTO `s_page_role` VALUES ('10580e68-9c91-4361-aa47-a566abd97054', '55f9ecb5-b899-4321-952f-64a1f579d2c2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:16', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:16');
INSERT INTO `s_page_role` VALUES ('10d07dc3-f608-4a98-a566-619956b99397', '41220884-50a6-4204-8168-f8e3eb5ad2ce', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:28');
INSERT INTO `s_page_role` VALUES ('125cd21d-8b42-4852-977a-8edf9d185793', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:11');
INSERT INTO `s_page_role` VALUES ('137583f9-cb0e-4724-b583-7888b0e4b800', '55638077-269d-41fc-981e-d6f8eeaee8f3', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:33', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:33');
INSERT INTO `s_page_role` VALUES ('13d133cc-6a17-4986-8613-dcd3b25b31bf', '2dc7b0aa-e46e-4583-9738-72e71de1426c', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:16', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:16');
INSERT INTO `s_page_role` VALUES ('14a2a083-74be-4d82-a881-93494f686092', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:31');
INSERT INTO `s_page_role` VALUES ('14e35dda-54f3-4e70-801f-205f0985664e', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:22', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:22');
INSERT INTO `s_page_role` VALUES ('152038fa-9f05-41ef-b5c6-b4d135fb9fc4', '80787bb8-4542-434b-95e4-54b48c58be4f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:24');
INSERT INTO `s_page_role` VALUES ('15499398-6087-43ba-9dea-e358d85382ce', '5903d97e-84bc-4a0b-b45b-0b61acd2d238', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:24');
INSERT INTO `s_page_role` VALUES ('15ff7864-cf8f-4240-b3d0-7e3acfa62bee', '91d81894-dca3-4738-a408-77d23108a710', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:12');
INSERT INTO `s_page_role` VALUES ('1889d39c-a7f3-42e4-b407-f3d38523b71c', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:49');
INSERT INTO `s_page_role` VALUES ('18b73917-592f-421e-80eb-277715ac405b', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:39', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:39');
INSERT INTO `s_page_role` VALUES ('190e1727-c2f0-4e17-9898-64264c2efac3', '02886d5a-211c-4e58-800c-90cf79640ef5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:24');
INSERT INTO `s_page_role` VALUES ('1998ec45-da35-430a-b51d-49833b8d8554', '96e55b56-ab35-4774-a248-14a683a932e7', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:31');
INSERT INTO `s_page_role` VALUES ('1a773f13-6816-4723-b4ca-ed2711b9c94c', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:44', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:44');
INSERT INTO `s_page_role` VALUES ('1b29a6cc-abb3-471f-a97b-646289e801c2', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:18:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:18:59');
INSERT INTO `s_page_role` VALUES ('1c4ce6a2-7451-41fa-9601-47b11e54632c', '2fe964ba-f060-47cf-8c81-fcd0ba615d63', 'c716be42-78c2-4c80-8c88-25814b2e683b', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:55:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:55:13');
INSERT INTO `s_page_role` VALUES ('1dc171eb-8be9-4fe7-bcf7-49d60ee548f1', '96e55b56-ab35-4774-a248-14a683a932e7', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:39', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:39');
INSERT INTO `s_page_role` VALUES ('1dc9564c-1704-4d4a-a1e8-51781220fca9', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:58', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:58');
INSERT INTO `s_page_role` VALUES ('1f704ca2-0c0f-4505-accc-560ad90d7f30', 'e38ab74b-bf14-11e7-a301-24fd52935962', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:52', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:52');
INSERT INTO `s_page_role` VALUES ('205cc0d5-92c6-4b80-a9b4-b6cfa77d9097', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:27', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:27');
INSERT INTO `s_page_role` VALUES ('20e6816d-bb56-4ef1-a38a-cf447067a109', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:18');
INSERT INTO `s_page_role` VALUES ('228bae69-57f5-42ef-b01d-b45a67a250ef', '96e55b56-ab35-4774-a248-14a683a932e7', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:38', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:38');
INSERT INTO `s_page_role` VALUES ('2361473b-1880-43a5-85f8-463f4725c1ee', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:18');
INSERT INTO `s_page_role` VALUES ('2373c355-3aa6-4152-9f10-c8659c643ae9', 'fd1d49d4-0d1d-4294-a304-c1ae7432e53b', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:02:56', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:02:56');
INSERT INTO `s_page_role` VALUES ('23d5a8b9-fddb-47c1-9209-ab1d90fb3614', '682cc88a-5424-4f14-8298-bf19a8c1a726', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:35', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:35');
INSERT INTO `s_page_role` VALUES ('2435ceec-0b60-4b7d-bb0f-af0d3f43267e', 'df1a659b-180f-4fd2-abb0-b42c7db62714', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:25', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:25');
INSERT INTO `s_page_role` VALUES ('24724370-ffce-4f15-bde9-17d35aeb5028', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:12');
INSERT INTO `s_page_role` VALUES ('261977f2-c999-4a49-9030-1de757d6d6b7', '96e55b56-ab35-4774-a248-14a683a932e7', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:42');
INSERT INTO `s_page_role` VALUES ('2644c720-c70e-4afe-8cf6-21ce6de47ad8', '80787bb8-4542-434b-95e4-54b48c58be4f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:25', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:25');
INSERT INTO `s_page_role` VALUES ('274feb91-84f1-4b15-85cb-b697140f0469', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:53', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:53');
INSERT INTO `s_page_role` VALUES ('278bf696-beab-47d1-b22e-b95493436093', '55638077-269d-41fc-981e-d6f8eeaee8f3', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:30');
INSERT INTO `s_page_role` VALUES ('2902fc4a-e5fc-4cd4-bfa4-c583262430d0', 'b246e414-5c86-468e-81e0-0edf77710e3f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:25', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:25');
INSERT INTO `s_page_role` VALUES ('29480c54-0ad9-4b90-920d-9747b1e247f7', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:19');
INSERT INTO `s_page_role` VALUES ('2aa3d062-45b6-48fd-89a1-1357645862d3', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:29');
INSERT INTO `s_page_role` VALUES ('2ac18b3a-5838-40af-a876-b555d850ea75', '41220884-50a6-4204-8168-f8e3eb5ad2ce', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:24');
INSERT INTO `s_page_role` VALUES ('2bdc16a0-fc52-434f-bf7c-e673fd1f1e52', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:03');
INSERT INTO `s_page_role` VALUES ('2bfa24dc-bd20-4da2-86ec-dca0818e954a', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:42');
INSERT INTO `s_page_role` VALUES ('2c7d7d8c-cda1-4840-9923-12977383f6ee', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:47');
INSERT INTO `s_page_role` VALUES ('2dde30f7-63df-4c97-9d92-ab38819b802c', '5903d97e-84bc-4a0b-b45b-0b61acd2d238', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:14');
INSERT INTO `s_page_role` VALUES ('2e0abeac-9a82-4db3-ad03-4e58b54a3a0b', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:00', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:00');
INSERT INTO `s_page_role` VALUES ('301bf8a1-ac75-45f7-907c-15c735b67bd6', '55f9ecb5-b899-4321-952f-64a1f579d2c2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:19');
INSERT INTO `s_page_role` VALUES ('30a385ac-f097-4326-a8f1-d05b7cdddcef', 'fd1d49d4-0d1d-4294-a304-c1ae7432e53b', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:02:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:02:41');
INSERT INTO `s_page_role` VALUES ('31fdf877-90c4-4599-8549-a85ac0479a24', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:46');
INSERT INTO `s_page_role` VALUES ('32119401-0c36-4982-9bdf-e0af1c5467a0', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:19');
INSERT INTO `s_page_role` VALUES ('32f3be37-e32f-490d-9f8c-70b49a229dc8', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:36', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:36');
INSERT INTO `s_page_role` VALUES ('33734c49-46c6-4a04-a8c1-c2b58ecbd7ce', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:32', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:32');
INSERT INTO `s_page_role` VALUES ('3506ced2-04c7-47a1-b52d-ef22e89ddfee', '80787bb8-4542-434b-95e4-54b48c58be4f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:26');
INSERT INTO `s_page_role` VALUES ('355efc0f-a08f-443e-96a4-02278e248424', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:16', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:16');
INSERT INTO `s_page_role` VALUES ('37b4844b-88a5-4b5d-833a-2a1afe1b4f9f', '2dc7b0aa-e46e-4583-9738-72e71de1426c', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:09', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:09');
INSERT INTO `s_page_role` VALUES ('38458ab3-cfa8-495a-8a76-290763e854af', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:05', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:05');
INSERT INTO `s_page_role` VALUES ('392faa66-314b-4c3a-b156-76128f42ac68', '41220884-50a6-4204-8168-f8e3eb5ad2ce', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:29');
INSERT INTO `s_page_role` VALUES ('399df380-45da-4c41-9d75-786619976847', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:19');
INSERT INTO `s_page_role` VALUES ('3a01a28b-d07b-45cc-8de6-872c08c2e8fb', '8c4baf7a-a6dd-4f0a-aa13-4078f6c74320', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:46');
INSERT INTO `s_page_role` VALUES ('3a4a5c65-7b4a-43c9-bf39-4db4d613b40d', '0277b5ce-acca-4f31-a43c-20585768c596', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:08');
INSERT INTO `s_page_role` VALUES ('3adbaf60-0261-441c-ab14-7084dc8e7aa4', '0277b5ce-acca-4f31-a43c-20585768c596', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:12');
INSERT INTO `s_page_role` VALUES ('3b1e2541-b46b-4a8e-b2ad-3174823444ce', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:59');
INSERT INTO `s_page_role` VALUES ('3bcc5051-33e4-4665-bc38-2a85988f5535', '0277b5ce-acca-4f31-a43c-20585768c596', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:10');
INSERT INTO `s_page_role` VALUES ('3c2b087c-e8dd-4267-b9af-dd0de8444a25', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:09', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:09');
INSERT INTO `s_page_role` VALUES ('3c6f0783-e7eb-4cee-95c3-c30aa5f97994', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:54');
INSERT INTO `s_page_role` VALUES ('3dac4381-7320-41ed-b1e2-e06be3ed3fb7', 'b246e414-5c86-468e-81e0-0edf77710e3f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:30');
INSERT INTO `s_page_role` VALUES ('3fe73a27-dd67-4744-aea5-2662cddefbb9', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:34', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:34');
INSERT INTO `s_page_role` VALUES ('401d4983-756d-426a-9f78-08394d570906', '5903d97e-84bc-4a0b-b45b-0b61acd2d238', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:23', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:23');
INSERT INTO `s_page_role` VALUES ('4260dfce-6cc7-46e4-a78e-b822c8dada51', '682cc88a-5424-4f14-8298-bf19a8c1a726', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:41');
INSERT INTO `s_page_role` VALUES ('442ae51d-4694-4e45-8c2d-c32a25709282', '2bb748c6-224b-4fff-a3c2-82b684faf56d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:05', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:05');
INSERT INTO `s_page_role` VALUES ('45bcf3fa-ae77-477a-8957-1c108c93bd5e', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:37');
INSERT INTO `s_page_role` VALUES ('46fb21af-801e-470f-86d3-63d22d4c27bf', '55638077-269d-41fc-981e-d6f8eeaee8f3', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:31');
INSERT INTO `s_page_role` VALUES ('49ae13c8-34f3-4d28-bf69-d1668221f932', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:31');
INSERT INTO `s_page_role` VALUES ('4a151c30-5dc8-42f1-96ee-f46ee9878651', '55f9ecb5-b899-4321-952f-64a1f579d2c2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:18');
INSERT INTO `s_page_role` VALUES ('4a77d431-44d8-434f-8caf-012269af0902', '02886d5a-211c-4e58-800c-90cf79640ef5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:19');
INSERT INTO `s_page_role` VALUES ('4ab306fc-0236-420e-9a2f-848e8ab989db', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:10');
INSERT INTO `s_page_role` VALUES ('4ac88108-40aa-4282-bdc7-e83207ef7809', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:57');
INSERT INTO `s_page_role` VALUES ('4b343769-a959-4c7d-b548-a68a5cd1ab97', '0277b5ce-acca-4f31-a43c-20585768c596', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:07');
INSERT INTO `s_page_role` VALUES ('4b683deb-e1e8-450a-ac89-2f5be1cc4447', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:56', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:56');
INSERT INTO `s_page_role` VALUES ('4e6703e3-abcc-4997-8af4-0fc8c271c932', 'd942abc1-b177-452e-8c53-1914ac448c7d', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:53', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:53');
INSERT INTO `s_page_role` VALUES ('4e8782f8-0802-46ce-8582-42159a407a63', '0ef5eb36-2a53-4ec0-ab6b-7c5ed02d3ccf', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:06');
INSERT INTO `s_page_role` VALUES ('4f38061f-4500-44c3-a98d-7063e0d20df8', '8c4baf7a-a6dd-4f0a-aa13-4078f6c74320', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:46');
INSERT INTO `s_page_role` VALUES ('5005558b-c6b5-4c91-81ef-3a65d6dd6aa1', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:15');
INSERT INTO `s_page_role` VALUES ('5064b108-f4d6-4b2a-9b9e-ddab3876a87b', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:18');
INSERT INTO `s_page_role` VALUES ('5088c4f7-a792-4379-b83d-9e02b77349c8', '37a082cd-0e38-49f8-b6f1-fc26e05383cc', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:37');
INSERT INTO `s_page_role` VALUES ('5099d0bd-e4e4-4d9c-a440-1942293d8982', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:40');
INSERT INTO `s_page_role` VALUES ('5147ce21-5fd9-4afc-a449-b9acd398a347', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:03');
INSERT INTO `s_page_role` VALUES ('516d24c7-87f1-47d8-8e01-df28aaebc30a', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:10');
INSERT INTO `s_page_role` VALUES ('51c67c7f-3404-4619-9f97-f5dc041a6d03', 'baf74d02-a7fa-41cf-a7c6-d1e5da805701', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:53', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:53');
INSERT INTO `s_page_role` VALUES ('51f4a9ef-452e-43c6-a012-e636774640b0', '80787bb8-4542-434b-95e4-54b48c58be4f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:22', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:22');
INSERT INTO `s_page_role` VALUES ('526dd681-055c-4c4b-b5d5-900b390214f2', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:14');
INSERT INTO `s_page_role` VALUES ('530e46a6-9c9a-478a-8c05-601769a15b19', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:55', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:55');
INSERT INTO `s_page_role` VALUES ('535d348d-464e-460d-bb36-b24c896c76b6', 'ded1d6eb-2c41-407e-9a3e-bf3615ced9ff', 'c716be42-78c2-4c80-8c88-25814b2e683b', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:55:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:55:28');
INSERT INTO `s_page_role` VALUES ('553b3b7f-a52c-4e3b-82f6-4147adfa8116', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:51');
INSERT INTO `s_page_role` VALUES ('55426de5-9214-4c57-9bfa-f82916589a32', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:09', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:09');
INSERT INTO `s_page_role` VALUES ('571cce07-1f19-4d36-a416-faa32d2baca7', '5903d97e-84bc-4a0b-b45b-0b61acd2d238', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:24');
INSERT INTO `s_page_role` VALUES ('57dd5404-0cb0-4774-be9f-236e41a7b533', '0ef5eb36-2a53-4ec0-ab6b-7c5ed02d3ccf', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:08');
INSERT INTO `s_page_role` VALUES ('58559771-7e14-4c7b-bff5-898363c36ad1', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:48', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:48');
INSERT INTO `s_page_role` VALUES ('59846d41-a448-41b2-b156-faa194156213', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:24');
INSERT INTO `s_page_role` VALUES ('598f4876-14ec-4797-9259-f2c3ac507e30', '5a90ce13-c8ce-43c6-a9ed-21fd4a4fb2c5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:19');
INSERT INTO `s_page_role` VALUES ('5cb7ecc2-361e-493e-9839-4620df59f5e9', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:28');
INSERT INTO `s_page_role` VALUES ('5d1376b1-934d-4d00-9c3f-bf348a025bf6', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:58', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:58');
INSERT INTO `s_page_role` VALUES ('5d2dda2a-b833-40ff-869b-61d6b634a3dd', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:26');
INSERT INTO `s_page_role` VALUES ('5df91695-141d-415b-879a-3eca438f38c2', '2dc7b0aa-e46e-4583-9738-72e71de1426c', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:12');
INSERT INTO `s_page_role` VALUES ('5e83f553-3fca-4cb5-a707-f3d25ea683b0', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:17', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:17');
INSERT INTO `s_page_role` VALUES ('5e9fcddb-3aa8-48c8-b6ca-d0b1cad14da7', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:58', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:58');
INSERT INTO `s_page_role` VALUES ('5ec14e19-64c4-4f5e-bb17-d97f4f748a88', '2bb748c6-224b-4fff-a3c2-82b684faf56d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:51');
INSERT INTO `s_page_role` VALUES ('5f2017b9-b65e-4544-86ce-bf6fbdea7480', '2bb748c6-224b-4fff-a3c2-82b684faf56d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:55', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:55');
INSERT INTO `s_page_role` VALUES ('5f9acf3a-654b-477a-937e-14553eca9077', '91d81894-dca3-4738-a408-77d23108a710', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:13');
INSERT INTO `s_page_role` VALUES ('6084bc0a-4f20-4910-abb9-672a753ad1dc', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:11');
INSERT INTO `s_page_role` VALUES ('613e7321-9422-40e1-8355-8239111f7199', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:21');
INSERT INTO `s_page_role` VALUES ('613fc519-5e46-498b-8b16-a2a47aef9ba0', '0277b5ce-acca-4f31-a43c-20585768c596', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:11');
INSERT INTO `s_page_role` VALUES ('61447d6d-0818-4d62-af26-60f0c00522a4', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:31');
INSERT INTO `s_page_role` VALUES ('61ccf727-8672-44de-963c-260338760ee1', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:59');
INSERT INTO `s_page_role` VALUES ('6218adf9-683a-4e19-aaa9-f64022299a4f', '41220884-50a6-4204-8168-f8e3eb5ad2ce', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:30');
INSERT INTO `s_page_role` VALUES ('638a122b-7595-42f6-9a57-c01a3bd0cb0c', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:54');
INSERT INTO `s_page_role` VALUES ('640efdad-7409-42e5-9157-4b028acb1a16', '55f9ecb5-b899-4321-952f-64a1f579d2c2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:17', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:17');
INSERT INTO `s_page_role` VALUES ('64e3e0b7-5570-449a-a659-b5a61285c6ae', '8c4baf7a-a6dd-4f0a-aa13-4078f6c74320', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:51');
INSERT INTO `s_page_role` VALUES ('6708f242-3ec6-4296-8068-ed8740e2dc12', 'baf74d02-a7fa-41cf-a7c6-d1e5da805701', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:48', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:48');
INSERT INTO `s_page_role` VALUES ('677d436c-8d48-493b-9a2c-61b0103da9a8', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:06');
INSERT INTO `s_page_role` VALUES ('6829af81-1490-4e1f-8e16-0ff4fc715376', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:36', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:36');
INSERT INTO `s_page_role` VALUES ('682f58b3-2ba5-473f-ad10-c2c3eb4ee746', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:31');
INSERT INTO `s_page_role` VALUES ('68519e2d-53b2-49d0-aabb-d44816521c23', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:06');
INSERT INTO `s_page_role` VALUES ('6916f12c-923e-4b4f-ba39-bcb444be382e', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:48', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:48');
INSERT INTO `s_page_role` VALUES ('69a99555-8ca1-4c8c-a739-572f58b93526', '04c21bbc-f0c1-4981-bbe7-17627cce0664', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:04', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:04');
INSERT INTO `s_page_role` VALUES ('69eb8e3a-19cb-4bb3-a06b-e09684e99a63', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:49');
INSERT INTO `s_page_role` VALUES ('6ac9ef59-14b2-4af4-a8a9-aff5226ee54f', '0ef5eb36-2a53-4ec0-ab6b-7c5ed02d3ccf', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:10');
INSERT INTO `s_page_role` VALUES ('6c1ebf53-3e1f-4cf1-95c9-dc98991f14c4', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:00', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:00');
INSERT INTO `s_page_role` VALUES ('6c3d5381-bf89-43b7-a0bd-d921a350a0bc', '86b97cad-9b5d-4ab9-8bd6-fab7de92d5da', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:01', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:01');
INSERT INTO `s_page_role` VALUES ('6d7c70bd-d39a-4b4e-95bf-922c057ed361', '5a90ce13-c8ce-43c6-a9ed-21fd4a4fb2c5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:17', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:17');
INSERT INTO `s_page_role` VALUES ('6dbdeccf-d1ef-4d03-a614-3777ce41de1a', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:47');
INSERT INTO `s_page_role` VALUES ('6e786857-0246-46f1-9c57-0ebbd0c60578', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:18:58', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:18:58');
INSERT INTO `s_page_role` VALUES ('6e871904-bace-41ae-8230-ca89a66ffa4b', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:21');
INSERT INTO `s_page_role` VALUES ('6f972f2d-fd4e-451e-ae42-5a4a23bb361e', 'b246e414-5c86-468e-81e0-0edf77710e3f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:24');
INSERT INTO `s_page_role` VALUES ('7040bae6-6521-4420-a14e-931d2c7050ba', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:05', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:05');
INSERT INTO `s_page_role` VALUES ('71708ec9-6163-4e1b-b128-2cad710e5c63', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:21');
INSERT INTO `s_page_role` VALUES ('71793655-146f-474c-b927-b3e1374c83bf', '8c4baf7a-a6dd-4f0a-aa13-4078f6c74320', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:48', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:48');
INSERT INTO `s_page_role` VALUES ('71b59acb-855b-43e4-a9c4-73cc056815ec', '91d81894-dca3-4738-a408-77d23108a710', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:17', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:17');
INSERT INTO `s_page_role` VALUES ('71cf91a0-44a2-4e31-a1db-062cc9f30628', '2fe964ba-f060-47cf-8c81-fcd0ba615d63', 'c716be42-78c2-4c80-8c88-25814b2e683b', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:55:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:55:21');
INSERT INTO `s_page_role` VALUES ('725b12e9-d663-4291-a40c-a160bfa73f4f', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:18:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:18:57');
INSERT INTO `s_page_role` VALUES ('7291299f-1997-4207-bf14-b8237477d1aa', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:47');
INSERT INTO `s_page_role` VALUES ('7401737d-02e0-42c0-9a14-9c794d67e841', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:33', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:33');
INSERT INTO `s_page_role` VALUES ('745ef6d7-39b5-46db-8790-0ac9e7538a51', 'baf74d02-a7fa-41cf-a7c6-d1e5da805701', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:52', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:52');
INSERT INTO `s_page_role` VALUES ('74f347ab-30a6-4eb7-a601-88179fa0920f', '80787bb8-4542-434b-95e4-54b48c58be4f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:20', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:20');
INSERT INTO `s_page_role` VALUES ('756b0dff-5464-4385-8bcc-a560fbe263e3', 'baf74d02-a7fa-41cf-a7c6-d1e5da805701', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:50');
INSERT INTO `s_page_role` VALUES ('75d74c31-5f4b-4c48-97ab-d91e7bbfa8d3', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:44', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:44');
INSERT INTO `s_page_role` VALUES ('76441396-9548-409b-aa36-234aff5f8560', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:07');
INSERT INTO `s_page_role` VALUES ('768e6d6c-379e-40fc-8919-ef21a9a5798a', '86b97cad-9b5d-4ab9-8bd6-fab7de92d5da', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:00', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:00');
INSERT INTO `s_page_role` VALUES ('781f9731-b26e-4106-9ef6-fb968eb1d3b3', 'ce43305b-a658-4e8c-b864-10b6ee797429', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:59');
INSERT INTO `s_page_role` VALUES ('790cc867-0cf6-4630-a217-d36c87ee8c48', '43d5b520-eafe-4f7f-a846-4fba12c9ffab', 'c716be42-78c2-4c80-8c88-25814b2e683b', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:55:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:55:30');
INSERT INTO `s_page_role` VALUES ('797c3ad2-eb8d-4809-b352-329e8b97b4d8', '37a082cd-0e38-49f8-b6f1-fc26e05383cc', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:40');
INSERT INTO `s_page_role` VALUES ('79ce2421-1200-485c-b387-fc45b297f52a', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:05', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:05');
INSERT INTO `s_page_role` VALUES ('79eaecd8-5c8b-4801-b3c3-b006b00f116c', '96e55b56-ab35-4774-a248-14a683a932e7', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:41');
INSERT INTO `s_page_role` VALUES ('7a1d0e79-eec5-455c-a829-3213f0f3ff27', '2dc7b0aa-e46e-4583-9738-72e71de1426c', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:18');
INSERT INTO `s_page_role` VALUES ('7d1302c2-1202-46a3-8921-220f725a11f9', '2bb748c6-224b-4fff-a3c2-82b684faf56d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:53', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:53');
INSERT INTO `s_page_role` VALUES ('7f1ef68a-a13b-408b-9779-aa8c3f41271e', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:42');
INSERT INTO `s_page_role` VALUES ('7f32cad7-ee55-4816-bea2-0f5d9edb1cac', '80787bb8-4542-434b-95e4-54b48c58be4f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:21');
INSERT INTO `s_page_role` VALUES ('805a355d-3236-4fd0-98ab-9624dc535545', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:16', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:16');
INSERT INTO `s_page_role` VALUES ('80b03523-2054-4359-955c-d69525ebbed6', 'e38ab74b-bf14-11e7-a301-24fd52935962', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:51');
INSERT INTO `s_page_role` VALUES ('8149339a-d294-44b4-bc9d-5d254a056fcc', '8c4baf7a-a6dd-4f0a-aa13-4078f6c74320', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:47');
INSERT INTO `s_page_role` VALUES ('8176a49f-9837-4217-be8b-f2fd45e535da', '86b97cad-9b5d-4ab9-8bd6-fab7de92d5da', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:59');
INSERT INTO `s_page_role` VALUES ('8182c08c-33e8-4639-9ab1-e45d1bfb63a4', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:21');
INSERT INTO `s_page_role` VALUES ('8288214f-9b49-4691-aca3-295a84366a17', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:41');
INSERT INTO `s_page_role` VALUES ('82f23698-2358-4af3-85ad-30170212f3fc', '37a082cd-0e38-49f8-b6f1-fc26e05383cc', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:36', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:36');
INSERT INTO `s_page_role` VALUES ('839c2d76-7e8c-42e8-a203-be0038cf03a4', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:40');
INSERT INTO `s_page_role` VALUES ('83c6fe89-d165-422a-9b77-210a57922c96', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:13');
INSERT INTO `s_page_role` VALUES ('83fcde73-483f-4ea7-be06-db1e2dee8bf1', '682cc88a-5424-4f14-8298-bf19a8c1a726', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:37');
INSERT INTO `s_page_role` VALUES ('8422b8d1-650e-4848-a599-521a31964acc', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:04', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:04');
INSERT INTO `s_page_role` VALUES ('85a0a410-759b-48fe-a9a0-ca6e96f8ec84', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:37');
INSERT INTO `s_page_role` VALUES ('85dcf696-7564-4ab0-99c9-f172fccba05b', '55f9ecb5-b899-4321-952f-64a1f579d2c2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:18');
INSERT INTO `s_page_role` VALUES ('86be4300-c156-4eba-86c5-e22f9331a014', '91d81894-dca3-4738-a408-77d23108a710', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:18');
INSERT INTO `s_page_role` VALUES ('87221d8a-be8e-4cde-bfb6-fbf07641f6bf', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:13');
INSERT INTO `s_page_role` VALUES ('8730f65d-16a0-4f25-bca1-7c8bf38ef3f9', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:32', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:32');
INSERT INTO `s_page_role` VALUES ('8b8fee70-a44a-4e48-a2e5-e6d08512f14d', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:33', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:33');
INSERT INTO `s_page_role` VALUES ('8d3e106d-9af3-4683-ba0c-2596c9917d5f', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:18');
INSERT INTO `s_page_role` VALUES ('8d575d02-e420-40ca-b184-9c40a62dc651', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:10');
INSERT INTO `s_page_role` VALUES ('8f777215-5376-4ae4-8c75-04b993d42cb7', '682cc88a-5424-4f14-8298-bf19a8c1a726', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:42');
INSERT INTO `s_page_role` VALUES ('902d7832-e4c3-4e7a-9d3a-1b1a22d97a87', '86b97cad-9b5d-4ab9-8bd6-fab7de92d5da', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:56', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:56');
INSERT INTO `s_page_role` VALUES ('90896a95-35a6-4a20-b889-09dd9b29521b', '2dc7b0aa-e46e-4583-9738-72e71de1426c', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:11');
INSERT INTO `s_page_role` VALUES ('9091f2fa-b5c1-4267-bfef-8a8d0554c69d', 'baf74d02-a7fa-41cf-a7c6-d1e5da805701', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:47');
INSERT INTO `s_page_role` VALUES ('90cf500b-95b7-44b1-99ad-4f876b5b6737', '5a90ce13-c8ce-43c6-a9ed-21fd4a4fb2c5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:19');
INSERT INTO `s_page_role` VALUES ('916d81e3-2027-48b0-84e0-6afcb1fb38a6', 'b246e414-5c86-468e-81e0-0edf77710e3f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:28');
INSERT INTO `s_page_role` VALUES ('92f00295-e90b-4dcc-92eb-4bafbf1c6b2a', '682cc88a-5424-4f14-8298-bf19a8c1a726', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:45', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:45');
INSERT INTO `s_page_role` VALUES ('930f3ddd-0cf5-46b7-bebd-486702a18471', '2bb748c6-224b-4fff-a3c2-82b684faf56d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:59');
INSERT INTO `s_page_role` VALUES ('940f6a54-75e5-4e9d-a441-6254133f8c7c', '37a082cd-0e38-49f8-b6f1-fc26e05383cc', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:38', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:38');
INSERT INTO `s_page_role` VALUES ('96969437-3fb2-4d19-87f3-5fa8c48cbf5e', '91d81894-dca3-4738-a408-77d23108a710', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:15');
INSERT INTO `s_page_role` VALUES ('96faeeb8-fd70-435f-927c-615667642bb0', 'b246e414-5c86-468e-81e0-0edf77710e3f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:26');
INSERT INTO `s_page_role` VALUES ('97cc6954-8e1c-4c95-a4ed-860cf5f62e71', '91d81894-dca3-4738-a408-77d23108a710', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:19');
INSERT INTO `s_page_role` VALUES ('97dc6155-4ca7-45f5-b993-712219e757be', '55f9ecb5-b899-4321-952f-64a1f579d2c2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:16', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:16');
INSERT INTO `s_page_role` VALUES ('97eb9038-610f-40b7-8b28-4bf0c8abcc6b', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:27', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:27');
INSERT INTO `s_page_role` VALUES ('9828f3fe-d4f4-44cc-bada-3e44c04ecbd2', '02886d5a-211c-4e58-800c-90cf79640ef5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:27', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:27');
INSERT INTO `s_page_role` VALUES ('9919cf0f-e58d-46e5-b1b8-22dfec6a431a', '5a90ce13-c8ce-43c6-a9ed-21fd4a4fb2c5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:21');
INSERT INTO `s_page_role` VALUES ('992dfaa2-8749-4e33-9a3d-3e7f57d43fd8', 'b246e414-5c86-468e-81e0-0edf77710e3f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:26');
INSERT INTO `s_page_role` VALUES ('9a2f7ef3-fc85-47d3-9893-6af1ec7cf4f5', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:06');
INSERT INTO `s_page_role` VALUES ('9a802bab-de24-4ae0-ad3d-d969ef9c4017', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:30');
INSERT INTO `s_page_role` VALUES ('9b1f1ea8-ad23-4fbb-9aff-2c7b9bdf52f7', '86b97cad-9b5d-4ab9-8bd6-fab7de92d5da', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:57');
INSERT INTO `s_page_role` VALUES ('9b64d3fd-c30b-409c-98e8-22928778961a', '8c4baf7a-a6dd-4f0a-aa13-4078f6c74320', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:50');
INSERT INTO `s_page_role` VALUES ('9b7f2ee5-2a98-4e79-a036-0d8cb9925639', '2dc7b0aa-e46e-4583-9738-72e71de1426c', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:08');
INSERT INTO `s_page_role` VALUES ('9ba3e496-4c6e-4d43-860d-1ef21b6edcfb', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:45', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:45');
INSERT INTO `s_page_role` VALUES ('9bd9ee94-27a9-4f74-afa9-dddb07832086', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:20', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:20');
INSERT INTO `s_page_role` VALUES ('9c1e0614-9419-484f-bcdf-d1ab4a57c89f', '68522995-30dc-4fb0-97d8-7468e6af4853', 'c716be42-78c2-4c80-8c88-25814b2e683b', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:55:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:55:26');
INSERT INTO `s_page_role` VALUES ('9f33be4b-010a-494c-a6b7-d07d56204582', 'fd1d49d4-0d1d-4294-a304-c1ae7432e53b', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:09', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:09');
INSERT INTO `s_page_role` VALUES ('a02deaf2-e638-4d2b-aa2f-775ceed478fc', '5903d97e-84bc-4a0b-b45b-0b61acd2d238', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:13');
INSERT INTO `s_page_role` VALUES ('a0992344-a906-43a5-adcc-a88900aba964', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:50');
INSERT INTO `s_page_role` VALUES ('a1013132-0247-4101-8ad3-7682dda526cd', 'fd1d49d4-0d1d-4294-a304-c1ae7432e53b', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:04', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:04');
INSERT INTO `s_page_role` VALUES ('a1a49b49-9c0c-48fb-a850-57b55d6c8865', '02886d5a-211c-4e58-800c-90cf79640ef5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:22', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:22');
INSERT INTO `s_page_role` VALUES ('a1a8e2ae-166d-4753-a202-7db54aae0ec4', '41220884-50a6-4204-8168-f8e3eb5ad2ce', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:30');
INSERT INTO `s_page_role` VALUES ('a1d56c8a-4da1-44cd-9d36-e26e27e36615', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:03');
INSERT INTO `s_page_role` VALUES ('a2e76970-77e9-40df-9e36-92cedd25602f', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:40');
INSERT INTO `s_page_role` VALUES ('a31f6119-e9d4-4967-8bd2-ae5c1724adb5', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:13');
INSERT INTO `s_page_role` VALUES ('a36f97b7-067f-4da2-b398-bf920911a0fa', '80787bb8-4542-434b-95e4-54b48c58be4f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:27', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:27');
INSERT INTO `s_page_role` VALUES ('a3aa3eca-f123-4649-842f-2fb5b6f44028', '2bb748c6-224b-4fff-a3c2-82b684faf56d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:03');
INSERT INTO `s_page_role` VALUES ('a44e3b03-9bbd-4378-957c-4e8dac70d5b5', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:47');
INSERT INTO `s_page_role` VALUES ('a70a1ec0-7b5c-47bb-b58d-b26c85a15521', '0ef5eb36-2a53-4ec0-ab6b-7c5ed02d3ccf', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:11');
INSERT INTO `s_page_role` VALUES ('a95b5494-a805-4950-93c9-f56bac44f327', '80787bb8-4542-434b-95e4-54b48c58be4f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:08:15');
INSERT INTO `s_page_role` VALUES ('aa224ce6-30dc-4c78-85b9-43fe1020e602', '96e55b56-ab35-4774-a248-14a683a932e7', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:44', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:44');
INSERT INTO `s_page_role` VALUES ('aab7e696-a31d-4ad7-a853-d001ebc91973', 'fd1d49d4-0d1d-4294-a304-c1ae7432e53b', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:02:44', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:02:44');
INSERT INTO `s_page_role` VALUES ('ac44d175-16ef-4ace-82e5-e07f4edb7d74', '86b97cad-9b5d-4ab9-8bd6-fab7de92d5da', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:00', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:00');
INSERT INTO `s_page_role` VALUES ('ac78a126-701e-478d-a101-17a84d1ceae5', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:36', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:36');
INSERT INTO `s_page_role` VALUES ('acc17164-cfff-48db-acb1-647ccb2f9669', 'b246e414-5c86-468e-81e0-0edf77710e3f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:23', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:23');
INSERT INTO `s_page_role` VALUES ('acc82e5f-0d6e-42f5-8f2d-457222179c48', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:30');
INSERT INTO `s_page_role` VALUES ('ae0a2942-2fba-44fb-97b4-29581ab06356', '0ef5eb36-2a53-4ec0-ab6b-7c5ed02d3ccf', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:09', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:09');
INSERT INTO `s_page_role` VALUES ('ae56902c-d723-4abd-a74e-25cc2483eb74', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:17', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:17');
INSERT INTO `s_page_role` VALUES ('b00d3079-0dd0-4148-8fe6-f88d0e501051', '2dc7b0aa-e46e-4583-9738-72e71de1426c', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:06');
INSERT INTO `s_page_role` VALUES ('b012597d-204b-4c1c-8967-beb95b86874c', '67416840-6b15-473b-80fc-bbf1b28dfac5', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:51');
INSERT INTO `s_page_role` VALUES ('b07a7ba5-93a8-4f85-b327-fbfb403b6a5d', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:09', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:09');
INSERT INTO `s_page_role` VALUES ('b1276f65-1a89-436b-a5d3-717f8645b898', '41220884-50a6-4204-8168-f8e3eb5ad2ce', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:32', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:32');
INSERT INTO `s_page_role` VALUES ('b186f862-ffa3-4974-b5c9-e6a23428a4af', '0277b5ce-acca-4f31-a43c-20585768c596', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:11');
INSERT INTO `s_page_role` VALUES ('b29cb75f-900d-4c5c-a111-7147fb4c38a3', '5a90ce13-c8ce-43c6-a9ed-21fd4a4fb2c5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:18');
INSERT INTO `s_page_role` VALUES ('b2a9c5ff-2bf0-4046-b944-7a295ffdd665', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:48', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:48');
INSERT INTO `s_page_role` VALUES ('b408c715-19ed-46ee-9428-5e5cfd58fd13', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:50');
INSERT INTO `s_page_role` VALUES ('b4f00ac8-8c14-4ae0-8b39-20265fd31750', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:02', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:02');
INSERT INTO `s_page_role` VALUES ('b541062f-24d4-4937-8071-d712a445b025', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:41');
INSERT INTO `s_page_role` VALUES ('b54faa66-1051-445c-841f-bd8100230966', '55638077-269d-41fc-981e-d6f8eeaee8f3', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:28');
INSERT INTO `s_page_role` VALUES ('b85720bf-9b1a-43ec-bc0a-e82ce6c0af86', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:14');
INSERT INTO `s_page_role` VALUES ('b975457a-ec07-4102-831a-70dd9b517a8e', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:39', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:39');
INSERT INTO `s_page_role` VALUES ('b97c8347-4989-460e-a150-e050f303855d', '37a082cd-0e38-49f8-b6f1-fc26e05383cc', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:41');
INSERT INTO `s_page_role` VALUES ('ba1a27d3-ed45-4d0b-8f61-8aa9c0c14fca', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:33', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:33');
INSERT INTO `s_page_role` VALUES ('ba225e35-ea52-4ee8-b3fd-4a2883dd5103', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:15');
INSERT INTO `s_page_role` VALUES ('ba3e5d87-fe92-459d-9aa0-bcc55b879c68', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:47');
INSERT INTO `s_page_role` VALUES ('babb6627-62f5-4930-94b8-b50b1f0f8737', '91d81894-dca3-4738-a408-77d23108a710', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:11');
INSERT INTO `s_page_role` VALUES ('bae8b7b5-b9f3-11e7-b0f1-38d547b81379', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-26 10:17:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-26 10:17:50');
INSERT INTO `s_page_role` VALUES ('bb38eaae-6535-4650-9062-c8a844cd430a', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:46');
INSERT INTO `s_page_role` VALUES ('bc8d987c-2492-4262-8740-1d774f8f576f', '86b97cad-9b5d-4ab9-8bd6-fab7de92d5da', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:02', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:02');
INSERT INTO `s_page_role` VALUES ('bcc72356-e874-42c1-84ef-b9248738ce58', '41220884-50a6-4204-8168-f8e3eb5ad2ce', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:31');
INSERT INTO `s_page_role` VALUES ('bd44cd2d-1b4e-49d7-904c-9e83cdf42184', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:48', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:48');
INSERT INTO `s_page_role` VALUES ('bdbcf569-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:28:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:28:42');
INSERT INTO `s_page_role` VALUES ('be00ccc2-45a1-4045-9515-3e04e1995f05', 'caf65c04-beed-11e7-959c-38d547b81379', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:36', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:36');
INSERT INTO `s_page_role` VALUES ('be05e115-31b0-4aec-afb3-fe151045f09d', 'fd1d49d4-0d1d-4294-a304-c1ae7432e53b', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:10');
INSERT INTO `s_page_role` VALUES ('bfa17a3b-f044-4a63-8057-7a0a571ed8bd', 'baf74d02-a7fa-41cf-a7c6-d1e5da805701', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:51');
INSERT INTO `s_page_role` VALUES ('bff31f2d-61db-45f1-8285-bb82cae08dcc', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:15');
INSERT INTO `s_page_role` VALUES ('c0bf13e3-dd20-4128-b9ed-e3720c8482cb', '0ef5eb36-2a53-4ec0-ab6b-7c5ed02d3ccf', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:07');
INSERT INTO `s_page_role` VALUES ('c1cce5ab-dfaf-424e-8700-4994ebfac93d', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:23', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:23');
INSERT INTO `s_page_role` VALUES ('c1f8d2b9-bca0-442a-b274-17a4dc230c9a', '91d81894-dca3-4738-a408-77d23108a710', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:39', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:39');
INSERT INTO `s_page_role` VALUES ('c23a9d95-d00e-4a29-be26-27231be72c3c', '8c4baf7a-a6dd-4f0a-aa13-4078f6c74320', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:52', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:52');
INSERT INTO `s_page_role` VALUES ('c24b3129-776d-4738-b4e1-57845e141def', '682cc88a-5424-4f14-8298-bf19a8c1a726', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:43', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:43');
INSERT INTO `s_page_role` VALUES ('c308e511-780e-41b8-81b8-30c68599fef3', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:14');
INSERT INTO `s_page_role` VALUES ('c451b195-4865-4c12-a0db-a74fdfe9f436', '91d81894-dca3-4738-a408-77d23108a710', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:01:14');
INSERT INTO `s_page_role` VALUES ('c4f42f8f-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:28:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:28:54');
INSERT INTO `s_page_role` VALUES ('c5029761-54f2-4633-823a-d140df89ca70', '37a082cd-0e38-49f8-b6f1-fc26e05383cc', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:34', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:34');
INSERT INTO `s_page_role` VALUES ('c513009e-beb2-4693-920b-1747d9d8fcf7', '02886d5a-211c-4e58-800c-90cf79640ef5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:26');
INSERT INTO `s_page_role` VALUES ('c518b30e-0e5e-44c2-920b-f212dbdc3324', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:05', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:05');
INSERT INTO `s_page_role` VALUES ('c54f41e0-c2c8-43c3-a734-be4848c36a8f', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:51');
INSERT INTO `s_page_role` VALUES ('c56668bb-c56b-40c4-9143-f87d8c139def', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:24');
INSERT INTO `s_page_role` VALUES ('c5e7afc3-bafb-4c99-bfe0-dd84c0c719a4', '02886d5a-211c-4e58-800c-90cf79640ef5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:15');
INSERT INTO `s_page_role` VALUES ('c61a948e-a08e-4ebf-8c01-5675b5d70327', '0ef5eb36-2a53-4ec0-ab6b-7c5ed02d3ccf', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:10');
INSERT INTO `s_page_role` VALUES ('c6352c33-05d3-4d2e-b66e-2f5627e6dfb0', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:35', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:35');
INSERT INTO `s_page_role` VALUES ('c6cd6715-6203-4f84-b55a-68c57eae82e4', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:37');
INSERT INTO `s_page_role` VALUES ('c6e7a1f7-31cc-439a-9daa-69b5aab08308', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:38', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:38');
INSERT INTO `s_page_role` VALUES ('c74316a2-41e1-489b-aa20-215199bc2840', '2dc7b0aa-e46e-4583-9738-72e71de1426c', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:13');
INSERT INTO `s_page_role` VALUES ('c785808b-9951-4f97-8fec-1037e797ae0e', '41220884-50a6-4204-8168-f8e3eb5ad2ce', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:27', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:27');
INSERT INTO `s_page_role` VALUES ('c8ea16e2-79ad-42c3-b76a-883b4d4a4724', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:43', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:43');
INSERT INTO `s_page_role` VALUES ('ca9b9c64-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:03');
INSERT INTO `s_page_role` VALUES ('cb07d6fe-d17c-47f0-bdd6-3f0b7af58147', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:53', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:53');
INSERT INTO `s_page_role` VALUES ('cb165983-89b6-40f7-abd9-f24449f12fd6', '5903d97e-84bc-4a0b-b45b-0b61acd2d238', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:11');
INSERT INTO `s_page_role` VALUES ('cb1fe717-69b3-40ba-8c23-2bbec9927b3e', '8c4baf7a-a6dd-4f0a-aa13-4078f6c74320', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:49');
INSERT INTO `s_page_role` VALUES ('cc2e0288-62cc-4821-b7a5-afa6f9261ce8', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:02', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:02');
INSERT INTO `s_page_role` VALUES ('cc95bfe5-2335-4aa3-ad17-2e26eb1b93ef', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:50');
INSERT INTO `s_page_role` VALUES ('ce7bae32-c358-4e07-a91f-22bea1a06653', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:32', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:32');
INSERT INTO `s_page_role` VALUES ('cf43f9fb-e2e6-4fbc-bbed-9cfcb682c4f8', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:08');
INSERT INTO `s_page_role` VALUES ('cf44b720-e3d3-4289-a3b9-962f1fa83c9f', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:38', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:38');
INSERT INTO `s_page_role` VALUES ('cf922533-5459-4c7c-9c0f-04fd74ddc360', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:52', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:52');
INSERT INTO `s_page_role` VALUES ('cff06d81-8833-460c-a0d2-4386cb30fcab', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:29');
INSERT INTO `s_page_role` VALUES ('d0f06bbb-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:14');
INSERT INTO `s_page_role` VALUES ('d275b505-2c04-4a6e-81d5-cd7abb44af09', '2c68aa86-891b-4661-ba76-327e8a2a6215', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:08');
INSERT INTO `s_page_role` VALUES ('d4869692-e7ab-47e8-b71c-76d522a0528a', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:57');
INSERT INTO `s_page_role` VALUES ('d4b76915-12f2-4be4-a7ca-bcd12ee40a67', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:09', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:09');
INSERT INTO `s_page_role` VALUES ('d4d4c103-4099-4ab8-a294-84adf12e2f43', '55638077-269d-41fc-981e-d6f8eeaee8f3', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:29');
INSERT INTO `s_page_role` VALUES ('d54537a9-3704-40d8-926b-675cbfb5d092', '96e55b56-ab35-4774-a248-14a683a932e7', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:46');
INSERT INTO `s_page_role` VALUES ('d62cbf1c-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:23', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:23');
INSERT INTO `s_page_role` VALUES ('d7b18c0a-b97b-4e8e-b4fc-df93c0c6c492', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:57');
INSERT INTO `s_page_role` VALUES ('d8895364-5ec2-46d5-9f59-e779fae092ad', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:07');
INSERT INTO `s_page_role` VALUES ('db43422f-2410-462f-b0b4-72ca7f9d24ff', '682cc88a-5424-4f14-8298-bf19a8c1a726', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:40');
INSERT INTO `s_page_role` VALUES ('db61db80-2c9c-432e-96cd-ba243e08c89d', '5a90ce13-c8ce-43c6-a9ed-21fd4a4fb2c5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:15');
INSERT INTO `s_page_role` VALUES ('dd0eac49-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:34', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:34');
INSERT INTO `s_page_role` VALUES ('dda029b3-2fd7-4729-9658-983d2683bed0', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:01', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:01');
INSERT INTO `s_page_role` VALUES ('ddb7f2cc-8f4c-4197-99d6-eaaa1a1fb3a5', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:04', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:04');
INSERT INTO `s_page_role` VALUES ('de0b6a9a-5d0e-4181-ba75-4f9d67059831', '0277b5ce-acca-4f31-a43c-20585768c596', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:13');
INSERT INTO `s_page_role` VALUES ('dea98dbe-9843-4bd3-8b4c-3af8595eab1d', 'baf74d02-a7fa-41cf-a7c6-d1e5da805701', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:54');
INSERT INTO `s_page_role` VALUES ('dfdadb44-9ae4-4836-98bb-bd63f2d35118', '02886d5a-211c-4e58-800c-90cf79640ef5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:17', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:17');
INSERT INTO `s_page_role` VALUES ('e044daef-b5de-494d-ba91-e05d9c08a060', '5903d97e-84bc-4a0b-b45b-0b61acd2d238', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:25', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:25');
INSERT INTO `s_page_role` VALUES ('e05efa02-15e8-4917-aaa7-388b8362d755', '55f9ecb5-b899-4321-952f-64a1f579d2c2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:20', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:20');
INSERT INTO `s_page_role` VALUES ('e0add266-8920-448b-9991-8c36d9d2e0e7', '162e38d7-5b27-488b-9776-e60d7aa07b68', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:12');
INSERT INTO `s_page_role` VALUES ('e0b14634-4ae5-4ad0-b393-be6eb642c281', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:45', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:45');
INSERT INTO `s_page_role` VALUES ('e3c67641-8f6b-4f09-81a2-b47287cc1c3c', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:59');
INSERT INTO `s_page_role` VALUES ('e3d4dd30-77ef-4633-8856-c9be7c98838d', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:55', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:55');
INSERT INTO `s_page_role` VALUES ('e5eb0f56-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:49');
INSERT INTO `s_page_role` VALUES ('e6307870-aa9d-46d5-b704-b2f856fdf973', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:46');
INSERT INTO `s_page_role` VALUES ('e6c58554-59df-4b1a-a2d6-7d5738613596', '0a1e90f6-cc25-11e7-843e-24fd52935962', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:00', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:03:00');
INSERT INTO `s_page_role` VALUES ('e959be1c-e6aa-47c6-b96e-bad7e39b9981', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:26');
INSERT INTO `s_page_role` VALUES ('ea3f6d1e-c700-4877-9a8b-e87483f0c2d7', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:46');
INSERT INTO `s_page_role` VALUES ('ea8504db-dd70-484e-bc79-75028ef4f2e1', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:50');
INSERT INTO `s_page_role` VALUES ('eb01f894-3c82-4b32-be90-451fac2cb8e6', '96e55b56-ab35-4774-a248-14a683a932e7', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:02:40');
INSERT INTO `s_page_role` VALUES ('ebff6e98-d797-4d36-8cfd-e5af8d3b2a4e', '55f9ecb5-b899-4321-952f-64a1f579d2c2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:20', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:20');
INSERT INTO `s_page_role` VALUES ('ec69f624-15fd-4aa7-babe-191e31b52888', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:03:01', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 23:03:01');
INSERT INTO `s_page_role` VALUES ('ec86ca7f-d6e6-4fd7-8f62-c0d92e1b6631', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:20', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:20');
INSERT INTO `s_page_role` VALUES ('ec993411-82d4-4a78-97b1-c47ac6833541', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:09', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:09');
INSERT INTO `s_page_role` VALUES ('edbd0508-40ef-4a3c-b150-67db24c6186d', '55638077-269d-41fc-981e-d6f8eeaee8f3', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:32', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:32');
INSERT INTO `s_page_role` VALUES ('edeb4021-bf49-4a5a-bbcd-ba4f32e900bd', '02886d5a-211c-4e58-800c-90cf79640ef5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:03:21');
INSERT INTO `s_page_role` VALUES ('efd1d268-1660-4d40-b159-1abb26698352', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:08');
INSERT INTO `s_page_role` VALUES ('f4104582-97d0-423c-952d-e0dd7b0f9a55', '86b97cad-9b5d-4ab9-8bd6-fab7de92d5da', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:57');
INSERT INTO `s_page_role` VALUES ('f50ab5e3-cf67-4133-92ca-0ad3c26754da', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:28');
INSERT INTO `s_page_role` VALUES ('f574de8f-972f-4583-b210-23789dfac8bf', '2bb748c6-224b-4fff-a3c2-82b684faf56d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:01', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:45:01');
INSERT INTO `s_page_role` VALUES ('f64a1385-983b-4556-a68d-14a4a51bbc8e', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:39', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:39');
INSERT INTO `s_page_role` VALUES ('f6fd0b34-637d-4c6b-a2e6-68438f59c121', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:01', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:01');
INSERT INTO `s_page_role` VALUES ('f78fdbbd-6387-497e-8788-a4874cddf5e6', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:13');
INSERT INTO `s_page_role` VALUES ('f7e6d269-e262-4d59-b4ce-bdc88a845aa5', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:03');
INSERT INTO `s_page_role` VALUES ('f8be31eb-342c-46cb-b609-974f34c36e92', 'fd1d49d4-0d1d-4294-a304-c1ae7432e53b', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:02:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 23:02:54');
INSERT INTO `s_page_role` VALUES ('f99c364a-0c64-4195-af35-9bc17074190f', 'b246e414-5c86-468e-81e0-0edf77710e3f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:31');
INSERT INTO `s_page_role` VALUES ('fa48bf4a-3529-4028-9ed1-11868563994d', '2bb748c6-224b-4fff-a3c2-82b684faf56d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:44:57');
INSERT INTO `s_page_role` VALUES ('fc747e02-de80-4c13-9585-3606295bc43b', 'baf74d02-a7fa-41cf-a7c6-d1e5da805701', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-07 15:25:49');
INSERT INTO `s_page_role` VALUES ('fe66a627-5617-42e0-8e1f-a8a71bbcdb67', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:57');
INSERT INTO `s_page_role` VALUES ('ff493225-c6e1-4a63-a36f-3bddb03ee6ac', '37a082cd-0e38-49f8-b6f1-fc26e05383cc', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:35', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-20 10:43:35');

-- ----------------------------
-- Table structure for s_roles
-- ----------------------------
DROP TABLE IF EXISTS `s_roles`;
CREATE TABLE `s_roles` (
  `id` varchar(36) NOT NULL COMMENT '角色id',
  `name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(500) DEFAULT NULL COMMENT '角色描述',
  `type` int(11) DEFAULT NULL COMMENT '角色类别',
  `status` int(1) NOT NULL DEFAULT '1',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` varchar(36) DEFAULT NULL COMMENT '创建人ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_roles
-- ----------------------------
INSERT INTO `s_roles` VALUES ('0C03F6B6-8CC4-4826-8A51-149990861BE3', '商户', '门店和经销商', '1', '1', '2017-11-01 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-01 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4');
INSERT INTO `s_roles` VALUES ('257ae84e-d86a-11e6-ba64-d8490bd28593', '管理员', '管理员', '1', '1', '2017-11-01 14:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-01 14:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4');
INSERT INTO `s_roles` VALUES ('c716be42-78c2-4c80-8c88-25814b2e683b', '用户', '普通用的的角色', '1', '1', '2017-11-08 16:32:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-08 16:32:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4');
INSERT INTO `s_roles` VALUES ('f8692cd2-e801-11e4-8fee-40167e64eefd', '系统管理员', '系统管理员', '1', '1', '2017-11-01 11:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-01 11:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4');

-- ----------------------------
-- Table structure for s_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `s_role_menu`;
CREATE TABLE `s_role_menu` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL COMMENT '角色ID',
  `menu_id` varchar(36) NOT NULL COMMENT '菜单ID',
  `status` int(1) NOT NULL DEFAULT '1',
  `create_id` varchar(36) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_id` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_role_menu
-- ----------------------------
INSERT INTO `s_role_menu` VALUES ('015f2644-1d41-4250-8e81-3c59767c9189', 'c716be42-78c2-4c80-8c88-25814b2e683b', '43d5b520-eafe-4f7f-a846-4fba12c9ffab', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 14:59:30');
INSERT INTO `s_role_menu` VALUES ('05c5cf15-9fd9-47f2-b03a-3607de630666', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'caf65c04-beed-11e7-959c-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('074658d4-2506-4edb-b7da-1ead2e2d1bd7', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '80787bb8-4542-434b-95e4-54b48c58be4f', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-08 00:07:56');
INSERT INTO `s_role_menu` VALUES ('091eab92-d53b-45d9-9d56-8609905eb2f5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '5863e4f5-927d-4c96-8bda-2294703bc909', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:10:15');
INSERT INTO `s_role_menu` VALUES ('0c00848c-7228-493c-ab22-75bb134623f0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'ce43305b-a658-4e8c-b864-10b6ee797429', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:13:42');
INSERT INTO `s_role_menu` VALUES ('0cf0f74d-bcc5-4814-a737-4f37f068c37d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8c4baf7a-a6dd-4f0a-aa13-4078f6c74320', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:52:26');
INSERT INTO `s_role_menu` VALUES ('0f376505-c36f-42e8-81e6-21ab406ca3db', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '3631e59e-1175-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('117f61b3-18c0-459c-84f5-138e8405f483', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'f5baa02f-7e39-421f-a7dd-c8ee4773966b', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:15:14');
INSERT INTO `s_role_menu` VALUES ('11826290-08f5-45e6-a651-bf3513aba74e', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '0a1e90f6-cc25-11e7-843e-24fd52935962', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('120a99d6-f198-466d-a642-a3a3501a3cda', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:17:01');
INSERT INTO `s_role_menu` VALUES ('12abba29-8284-48b0-9fd9-06c28ee9d359', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('12de943e-d491-46ec-a046-8bc63ea70620', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c3538d54-8e09-11e6-b311-005056812bf6', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('152fa507-9961-4116-a255-3db1fee59159', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'd942abc1-b177-452e-8c53-1914ac448c7d', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('16174b7e-4c99-486d-98dc-1dd85bfcc247', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '68522995-30dc-4fb0-97d8-7468e6af4853', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:44:45');
INSERT INTO `s_role_menu` VALUES ('188d4fc9-663c-47ec-a59b-126611c4ed0c', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '97ea6edb-1178-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('1baca17f-f581-4784-a76e-7fe6268b50f7', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'c3538d54-8e09-11e6-b311-005056812bf6', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('1e44ec98-27dc-4e98-837d-8cb7ec07cdcb', '257ae84e-d86a-11e6-ba64-d8490bd28593', '2dc7b0aa-e46e-4583-9738-72e71de1426c', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('2329bec1-4eda-4f74-b256-8b6ea2b98e96', '257ae84e-d86a-11e6-ba64-d8490bd28593', '96e55b56-ab35-4774-a248-14a683a932e7', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('2343e0c2-d067-11e7-a807-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '33fb6e82-2b8b-48fb-af3c-fb886049ca77', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 23:58:25');
INSERT INTO `s_role_menu` VALUES ('23879256-29fb-4fd0-a0e2-27cdbbdd99f5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '37a082cd-0e38-49f8-b6f1-fc26e05383cc', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:51:23');
INSERT INTO `s_role_menu` VALUES ('23d6664b-ae04-4f84-9bc9-c8b688489357', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '04c21bbc-f0c1-4981-bbe7-17627cce0664', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:30:19');
INSERT INTO `s_role_menu` VALUES ('2700c504-367d-4c2f-bd99-ad5f919768cb', 'c716be42-78c2-4c80-8c88-25814b2e683b', 'e4b9b1d7-79da-4490-9bce-5d2a78d150b9', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 14:59:30');
INSERT INTO `s_role_menu` VALUES ('272d547d-03aa-4b4d-a29e-5c904c0060d7', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('28987f86-4ac8-460c-a581-fd7be0d9c124', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'fb69a533-1178-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('29805307-37f1-407f-82e9-aa989369c2a5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '20692517-9187-41df-920b-7c7342a93d37', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('2bdbd772-c2ca-4d76-a0cb-7a9ae38f5de7', '257ae84e-d86a-11e6-ba64-d8490bd28593', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('2ece302f-27c9-4a5a-a754-737d54aec452', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '5a90ce13-c8ce-43c6-a9ed-21fd4a4fb2c5', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 16:11:14');
INSERT INTO `s_role_menu` VALUES ('2f95acd0-d067-11e7-a807-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 23:58:45');
INSERT INTO `s_role_menu` VALUES ('31477da1-d021-49a9-884c-2ba4e8287a04', '257ae84e-d86a-11e6-ba64-d8490bd28593', '20692517-9187-41df-920b-7c7342a93d37', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('3744e89c-a116-4783-9f47-bb935386ec41', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '5d2f2a0d-9326-4026-b338-c03bf6e255db', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:11:43');
INSERT INTO `s_role_menu` VALUES ('3f7b3895-6c89-4796-bc9b-d5ce07bebb73', '257ae84e-d86a-11e6-ba64-d8490bd28593', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('3fee64c8-5784-42bc-96ef-f7f9526fea6c', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'df1a659b-180f-4fd2-abb0-b42c7db62714', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('478233a6-3ee8-42f5-93d5-5d06df2f2d4f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '96e55b56-ab35-4774-a248-14a683a932e7', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 21:54:07');
INSERT INTO `s_role_menu` VALUES ('49ea090b-1f1e-4e4b-baa5-fbbb392d474d', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'caf65c04-beed-11e7-959c-38d547b81379', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('512ce723-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '0a1e90f6-cc25-11e7-843e-24fd52935962', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-18 13:57:11');
INSERT INTO `s_role_menu` VALUES ('519d6387-4e6e-4ab9-976a-41b9b331edfa', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '2c68aa86-891b-4661-ba76-327e8a2a6215', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:33:58');
INSERT INTO `s_role_menu` VALUES ('574858b8-1fc1-4dea-b458-d46a88202051', 'c716be42-78c2-4c80-8c88-25814b2e683b', '10000000-0000-0000-0000-300000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 14:59:30');
INSERT INTO `s_role_menu` VALUES ('5830e971-74c3-444a-ba86-ae418ff6ac70', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'e38ab74b-bf14-11e7-a301-24fd52935962', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('58ac537e-c804-4114-bf8e-e2a95eef389d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '2dc7b0aa-e46e-4583-9738-72e71de1426c', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 21:52:57');
INSERT INTO `s_role_menu` VALUES ('59e78d63-d836-4468-b39c-798672f57388', '257ae84e-d86a-11e6-ba64-d8490bd28593', '0a1e90f6-cc25-11e7-843e-24fd52935962', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('5c6efcb2-62a1-4a80-860f-85556ff2ad96', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '3631e59e-1175-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('5cd2a9d5-97bb-4cc7-912e-9d7f4931e803', '257ae84e-d86a-11e6-ba64-d8490bd28593', '67416840-6b15-473b-80fc-bbf1b28dfac5', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('5e03e76a-5b01-4b50-99b6-ec088cbbe482', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '0bc54201-f2e3-4585-a9c7-bb5d9b44e26d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:32:44');
INSERT INTO `s_role_menu` VALUES ('5ef0eb3c-98ec-4a49-baea-1ceb5f75dd22', '257ae84e-d86a-11e6-ba64-d8490bd28593', '91d81894-dca3-4738-a408-77d23108a710', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('614e2550-7862-4705-973b-edbf75b0c4ff', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '682cc88a-5424-4f14-8298-bf19a8c1a726', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 17:11:50');
INSERT INTO `s_role_menu` VALUES ('63444c8b-9718-46c3-a290-bb637e80b638', 'c716be42-78c2-4c80-8c88-25814b2e683b', '2fe964ba-f060-47cf-8c81-fcd0ba615d63', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 14:59:30');
INSERT INTO `s_role_menu` VALUES ('67d4f9c9-c5da-4734-ad1d-512ab9e8c190', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '0ef5eb36-2a53-4ec0-ab6b-7c5ed02d3ccf', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:54:26');
INSERT INTO `s_role_menu` VALUES ('682452ae-3a55-4663-a292-aad9d3f34b89', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'e4b9b1d7-79da-4490-9bce-5d2a78d150b9', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 14:36:51');
INSERT INTO `s_role_menu` VALUES ('6b571011-cdf0-11e7-a0af-50465deb996e', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('6c9cbb56-6f97-44c1-a912-1106a5939ba2', '257ae84e-d86a-11e6-ba64-d8490bd28593', '2c68aa86-891b-4661-ba76-327e8a2a6215', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('6e179d0b-1999-4cd2-8d65-c74aeac86138', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '4bcab523-1174-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('71451f50-91c5-46bd-bd42-79fa2dd80e36', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '86b97cad-9b5d-4ab9-8bd6-fab7de92d5da', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:53:38');
INSERT INTO `s_role_menu` VALUES ('73ca6c93-6213-4a56-b0d7-d717b2a40fdd', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'e38ab74b-bf14-11e7-a301-24fd52935962', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('75d8f621-3c27-4d62-a8d2-51cf6012a8a3', 'c716be42-78c2-4c80-8c88-25814b2e683b', 'b17105b9-8da9-47b7-a4b1-7dbcfa60d250', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 14:59:30');
INSERT INTO `s_role_menu` VALUES ('7ac89dd4-dafb-4eea-997e-cb0dff2698a4', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'caf65c04-beed-11e7-959c-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('7bff7054-b148-4188-8145-00c4c171c499', '257ae84e-d86a-11e6-ba64-d8490bd28593', '162e38d7-5b27-488b-9776-e60d7aa07b68', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('7cc3fdfb-cf40-11e7-ad32-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('7cc42f97-cf40-11e7-ad32-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('85b47219-4e92-48cf-b57a-1c73ac6b1e05', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('87b72623-a691-4405-97b2-2a4cd03b7b65', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'df1a659b-180f-4fd2-abb0-b42c7db62714', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:03:25');
INSERT INTO `s_role_menu` VALUES ('88fcdad2-b707-40da-9132-0c0dfc6be15f', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'baf74d02-a7fa-41cf-a7c6-d1e5da805701', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-06 17:45:53');
INSERT INTO `s_role_menu` VALUES ('8b1bc67a-34c2-422d-9574-b236371ddfa6', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:18:24');
INSERT INTO `s_role_menu` VALUES ('8dff7a2b-aa7d-48de-b074-f9837b690d20', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '43d5b520-eafe-4f7f-a846-4fba12c9ffab', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:47:14');
INSERT INTO `s_role_menu` VALUES ('9c0e2b38-4c38-4195-a08d-db287ff6df00', '257ae84e-d86a-11e6-ba64-d8490bd28593', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('9c85de13-8c9e-4281-bebd-820036b178cd', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '162e38d7-5b27-488b-9776-e60d7aa07b68', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:35:28');
INSERT INTO `s_role_menu` VALUES ('9c8c80fb-7b0c-482e-870a-d1c285d89664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'd6b1760b-e2e4-47e1-8e65-660fcd0c0f2a', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-28 21:19:03');
INSERT INTO `s_role_menu` VALUES ('9c9c5220-c9f4-4b70-a01e-54f2c0c47c84', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '2bb748c6-224b-4fff-a3c2-82b684faf56d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 17:12:32');
INSERT INTO `s_role_menu` VALUES ('9cc63b59-9e3d-4f1e-bfd4-29d7f81f202c', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '3dacb910-a325-4939-aec5-f1e05218513c', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 22:31:55');
INSERT INTO `s_role_menu` VALUES ('9e0d7f7e-2bd2-49b0-9ed8-bd61579ef24d', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'd942abc1-b177-452e-8c53-1914ac448c7d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('a215308f-384c-43cd-8190-6074b8e4ba99', '257ae84e-d86a-11e6-ba64-d8490bd28593', '04c21bbc-f0c1-4981-bbe7-17627cce0664', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('a4149933-e39a-413d-82df-200d5a06c2e3', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '91d81894-dca3-4738-a408-77d23108a710', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 22:34:12');
INSERT INTO `s_role_menu` VALUES ('ac8fb970-78ad-40f5-a082-1f2a171f1986', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'd07687ef-2798-11e5-965c-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('af3df7f2-d51e-11e7-b7f6-24fd52935962', '257ae84e-d86a-11e6-ba64-d8490bd28593', '10000000-0000-0000-0000-100000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:27');
INSERT INTO `s_role_menu` VALUES ('af3e52db-d51e-11e7-b7f6-24fd52935962', '257ae84e-d86a-11e6-ba64-d8490bd28593', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('af3ebb23-d51e-11e7-b7f6-24fd52935962', '257ae84e-d86a-11e6-ba64-d8490bd28593', '3631e59e-1175-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('af3f1dd6-d51e-11e7-b7f6-24fd52935962', '257ae84e-d86a-11e6-ba64-d8490bd28593', '0bc54201-f2e3-4585-a9c7-bb5d9b44e26d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('af3fa99e-d51e-11e7-b7f6-24fd52935962', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('af401896-d51e-11e7-b7f6-24fd52935962', '257ae84e-d86a-11e6-ba64-d8490bd28593', '33fb6e82-2b8b-48fb-af3c-fb886049ca77', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('af40fa6b-d51e-11e7-b7f6-24fd52935962', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'f5baa02f-7e39-421f-a7dd-c8ee4773966b', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('af4164c3-d51e-11e7-b7f6-24fd52935962', '257ae84e-d86a-11e6-ba64-d8490bd28593', '21136dca-a230-4902-b370-73cedbfd37d1', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('af41d875-d51e-11e7-b7f6-24fd52935962', '257ae84e-d86a-11e6-ba64-d8490bd28593', '5d2f2a0d-9326-4026-b338-c03bf6e255db', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('b0a6e8c1-0806-45b8-ab71-b5271a72942a', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'ce43305b-a658-4e8c-b864-10b6ee797429', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('b3eab242-e811-410f-a0ef-61111786f1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '5903d97e-84bc-4a0b-b45b-0b61acd2d238', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 17:13:10');
INSERT INTO `s_role_menu` VALUES ('b452c7d9-8570-45c7-a4ee-b55938cc1047', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '21136dca-a230-4902-b370-73cedbfd37d1', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:19:52');
INSERT INTO `s_role_menu` VALUES ('b5b562a6-94db-4540-b217-9aa057ad7d8a', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '02886d5a-211c-4e58-800c-90cf79640ef5', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:52:57');
INSERT INTO `s_role_menu` VALUES ('b8b84474-02e6-4210-a5e5-e94390685099', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'e38ab74b-bf14-11e7-a301-24fd52935962', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('b9ece692-b7f6-439f-8cc0-e72cac1c1ab4', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'b246e414-5c86-468e-81e0-0edf77710e3f', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:50:31');
INSERT INTO `s_role_menu` VALUES ('bd70ed16-8fc5-4f21-a2fa-4fc5f82faa80', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'd942abc1-b177-452e-8c53-1914ac448c7d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('bdf1927a-e0b7-4c5e-921b-758ff46f3f19', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '97ea6edb-1178-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('be1d9d70-19c5-4abd-980e-3c837a7ef2f5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '0277b5ce-acca-4f31-a43c-20585768c596', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:47:36');
INSERT INTO `s_role_menu` VALUES ('be32b052-2ed3-47f4-a373-53fc004739da', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'd07687ef-2798-11e5-965c-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('be6dc1df-384d-4c77-8b7f-4b4d345df339', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '2fe964ba-f060-47cf-8c81-fcd0ba615d63', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:43:23');
INSERT INTO `s_role_menu` VALUES ('c3a7e654-d653-11e7-8fec-38d547b81379', 'c716be42-78c2-4c80-8c88-25814b2e683b', '10000000-0000-0000-0000-200000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 14:59:30');
INSERT INTO `s_role_menu` VALUES ('c56e414b-f510-4334-b1a4-794ead9cac01', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fb69a533-1178-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('c5fe3bfb-dbfb-4b8a-b08b-5f2d429ff844', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'f04e0fcf-11b2-42a9-90f8-b8d0002f78cf', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 22:36:29');
INSERT INTO `s_role_menu` VALUES ('c7c89fea-40f3-4417-99f3-3c12adfc3a08', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '67416840-6b15-473b-80fc-bbf1b28dfac5', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:20:59');
INSERT INTO `s_role_menu` VALUES ('c826c0b0-a0fb-4325-af4a-19804275e4d9', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'dd6448d3-ade1-40c3-9043-a77c3036f829', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:04:57');
INSERT INTO `s_role_menu` VALUES ('c8f6360b-745c-4bcd-a21e-97dcf4185b60', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '10000000-0000-0000-0000-100000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('cb3c1fae-16ec-4020-96e5-612d92aeb050', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '41220884-50a6-4204-8168-f8e3eb5ad2ce', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 17:10:39');
INSERT INTO `s_role_menu` VALUES ('cc559a1f-baeb-4392-a7af-2dd50ff90b2d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'ded1d6eb-2c41-407e-9a3e-bf3615ced9ff', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 12:46:24');
INSERT INTO `s_role_menu` VALUES ('cc8fc171-c683-46ac-ac8c-9582da04b2ea', '257ae84e-d86a-11e6-ba64-d8490bd28593', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('cf31615b-cecb-11e7-979d-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '10000000-0000-0000-0000-300000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-04 17:12:13');
INSERT INTO `s_role_menu` VALUES ('cfc040ed-70e9-483a-b5b6-7ba9f9ba7f86', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '55638077-269d-41fc-981e-d6f8eeaee8f3', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 17:13:40');
INSERT INTO `s_role_menu` VALUES ('d0233780-ee85-4293-9322-e2acdc0506b3', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-21 23:05:31');
INSERT INTO `s_role_menu` VALUES ('d178db18-cecb-11e7-979d-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '10000000-0000-0000-0000-200000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-04 17:12:13');
INSERT INTO `s_role_menu` VALUES ('d3af5e46-cecb-11e7-979d-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '10000000-0000-0000-0000-100000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-04 17:12:13');
INSERT INTO `s_role_menu` VALUES ('d5d7ddbc-9bf4-41e7-b88b-8b1a5f025549', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '4bcab523-1174-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('dc230d34-6887-41f3-9cde-6c963b1c8c4d', 'c716be42-78c2-4c80-8c88-25814b2e683b', 'ded1d6eb-2c41-407e-9a3e-bf3615ced9ff', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 14:59:30');
INSERT INTO `s_role_menu` VALUES ('dfe63cdc-5706-4e4d-97a9-3958c7d70750', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('e89d84cf-d664-11e7-8fec-38d547b81379', 'c716be42-78c2-4c80-8c88-25814b2e683b', '68522995-30dc-4fb0-97d8-7468e6af4853', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 14:59:30');
INSERT INTO `s_role_menu` VALUES ('e9e11104-5d50-4416-a116-69e5c1b3fdca', '257ae84e-d86a-11e6-ba64-d8490bd28593', 'dd6448d3-ade1-40c3-9043-a77c3036f829', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-30 00:02:22');
INSERT INTO `s_role_menu` VALUES ('ea07ba03-9952-485c-9d1c-22c980f2f3d1', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '20692517-9187-41df-920b-7c7342a93d37', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('ee14142c-83f7-4361-ac20-73da7cfe3a28', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:22:13');
INSERT INTO `s_role_menu` VALUES ('ef14f211-3a20-419c-82dc-ac014f6bc189', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'b17105b9-8da9-47b7-a4b1-7dbcfa60d250', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-01 14:37:52');
INSERT INTO `s_role_menu` VALUES ('f9cad055-3f05-49fe-b321-e33bdbb4e939', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:08:07');
INSERT INTO `s_role_menu` VALUES ('fa852e84-4a4c-492b-9954-457ac01f9fe7', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '55f9ecb5-b899-4321-952f-64a1f579d2c2', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-14 13:48:30');
INSERT INTO `s_role_menu` VALUES ('ff6b2534-3818-4b32-b079-ae3c90ef69c7', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fd1d49d4-0d1d-4294-a304-c1ae7432e53b', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-12-23 21:51:30');
INSERT INTO `s_role_menu` VALUES ('ffb36530-8fa3-4f63-a96a-f3e47ca6ab92', '257ae84e-d86a-11e6-ba64-d8490bd28593', '4bcab523-1174-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:27');

-- ----------------------------
-- Table structure for s_system_log
-- ----------------------------
DROP TABLE IF EXISTS `s_system_log`;
CREATE TABLE `s_system_log` (
  `id` varchar(36) NOT NULL,
  `log_time` date DEFAULT NULL COMMENT '发生时间',
  `error_type` varchar(50) DEFAULT NULL COMMENT '错误类型',
  `error_desc` text COMMENT '错误描述',
  `stauts` int(11) DEFAULT NULL COMMENT '处理状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of s_system_log
-- ----------------------------

-- ----------------------------
-- Table structure for s_users
-- ----------------------------
DROP TABLE IF EXISTS `s_users`;
CREATE TABLE `s_users` (
  `id` varchar(36) NOT NULL COMMENT '用户唯一ID',
  `account` varchar(50) DEFAULT NULL COMMENT '用户账号',
  `password` varchar(50) DEFAULT NULL COMMENT '系统密码',
  `chinese_name` varchar(50) DEFAULT NULL COMMENT '中文名称',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `mobile` varchar(30) DEFAULT NULL COMMENT '手机号码',
  `user_type` varchar(10) DEFAULT NULL COMMENT '用户类型',
  `last_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int(11) NOT NULL COMMENT '激活状态',
  `login_type` int(11) DEFAULT NULL COMMENT '登陆类型',
  `role_id` varchar(36) DEFAULT NULL COMMENT '角色ID',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_users
-- ----------------------------
INSERT INTO `s_users` VALUES ('0f1443aa-eade-410d-b8bf-74ebfa914ca4', 'morgan', '6a3fd4ce78066de7876e189ab9db43a9', '波波', 'jionlandry@gmail.com', '13713666160', 'manager', '2017-10-18 13:30:04', '1', '1', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '2017-10-18 13:30:10', '2017-10-18 13:30:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4');
INSERT INTO `s_users` VALUES ('aae3184b-0af7-49c8-9b8c-0ec33cb5ffa1', 'jionlandry', 'f365f8e29fcf4412ee3be47ef8497b23', 'Alan', '123@11213.com', '15011191110', 'merchant', '2017-11-26 17:31:03', '1', '1', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '2017-11-26 17:31:03', '2017-11-26 17:31:03', 'aae3184b-0af7-49c8-9b8c-0ec33cb5ffa1');

-- ----------------------------
-- Table structure for s_user_info
-- ----------------------------
DROP TABLE IF EXISTS `s_user_info`;
CREATE TABLE `s_user_info` (
  `id` varchar(36) NOT NULL COMMENT 'id',
  `user_id` varchar(36) NOT NULL COMMENT '用户ID',
  `nick_name` varchar(36) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL COMMENT '市',
  `province` varchar(50) DEFAULT NULL COMMENT '省',
  `country` varchar(50) DEFAULT NULL COMMENT '国',
  `address` varchar(255) DEFAULT NULL,
  `location_x` char(20) DEFAULT NULL COMMENT '纬度',
  `location_y` char(20) DEFAULT NULL COMMENT '经度',
  `head_imgurl` varchar(255) DEFAULT NULL,
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信',
  `create_time` datetime NOT NULL,
  `create_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_user_info
-- ----------------------------
INSERT INTO `s_user_info` VALUES ('0e813589-a977-4a52-9e96-6785efa1667e', 'aae3184b-0af7-49c8-9b8c-0ec33cb5ffa1', null, '123123123', '包头市', '内蒙古自治区', '达尔罕茂明安联合旗', '123123', null, null, '', null, '2017-11-26 17:31:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4');
INSERT INTO `s_user_info` VALUES ('a8381549-d1d9-11e7-ad5f-24fd52935962', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', 'Mollty', '我再写代码', '深圳市', '广东省', '南山区', '西丽官龙村', '22.123123', '113.3211', 'http://of8rkrh1w.bkt.clouddn.com/2017/12/8/Hydrangeas.jpg', '123123', '2017-11-25 20:11:48', '0f1443aa-eade-410d-b8bf-74ebfa914ca4');
INSERT INTO `s_user_info` VALUES ('c1db1398-f9eb-4cfd-a262-d3c58715768b', 'ff92d2e1-87be-4c32-b61c-3e32c6c45d13', null, '12121212', '厦门市', '福建省', '湖里区', '1212', null, null, '', null, '2017-11-26 17:29:33', '0f1443aa-eade-410d-b8bf-74ebfa914ca4');

-- ----------------------------
-- Table structure for t_wechat
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat`;
CREATE TABLE `t_wechat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '公众号名称',
  `orgid` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号原始ID',
  `weixin` varchar(255) NOT NULL DEFAULT '' COMMENT '微信号',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `appid` varchar(255) NOT NULL COMMENT 'AppID',
  `appsecret` varchar(255) NOT NULL COMMENT 'AppSecret',
  `type` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '公众号类型',
  `oauth_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启微信登录',
  `oauth_name` varchar(100) DEFAULT NULL,
  `oauth_redirecturi` varchar(255) DEFAULT NULL,
  `oauth_count` int(11) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `default_wx` int(1) NOT NULL DEFAULT '1' COMMENT '1为默认使用，0为不默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wechat
-- ----------------------------
INSERT INTO `t_wechat` VALUES ('6', '锦绣神州', '', '', 'jinxiushenzhou', 'wx746679c0eb31b0a7', '961604e3bac8703aa84faa7d82b4c6f5', '0', '0', null, 'http://jxcs.jxworld.net/jxworld/weixin', '0', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for t_wechat_custom_message
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_custom_message`;
CREATE TABLE `t_wechat_custom_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `msg` varchar(255) DEFAULT NULL COMMENT '信息内容',
  `iswechat` smallint(1) unsigned DEFAULT NULL,
  `send_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wechat_custom_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_wechat_log
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_log`;
CREATE TABLE `t_wechat_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(20) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `message` text,
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wechat_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_wechat_mass_history
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_mass_history`;
CREATE TABLE `t_wechat_mass_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '素材id',
  `type` varchar(10) DEFAULT NULL COMMENT '发送内容类型',
  `status` varchar(20) DEFAULT NULL COMMENT '发送状态，对应微信通通知状态',
  `send_time` int(11) unsigned NOT NULL DEFAULT '0',
  `msg_id` varchar(20) DEFAULT NULL COMMENT '微信端返回的消息ID',
  `totalcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'group_id下粉丝数；或者openid_list中的粉丝数',
  `filtercount` int(10) unsigned NOT NULL DEFAULT '0',
  `sentcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送成功的粉丝数',
  `errorcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送失败的粉丝数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wechat_mass_history
-- ----------------------------

-- ----------------------------
-- Table structure for t_wechat_media
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_media`;
CREATE TABLE `t_wechat_media` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '图文消息标题',
  `command` varchar(20) NOT NULL COMMENT '关键词',
  `author` varchar(20) DEFAULT NULL,
  `is_show` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示封面，1为显示，0为不显示',
  `digest` varchar(255) DEFAULT NULL COMMENT '图文消息的描述',
  `content` text NOT NULL COMMENT '图文消息页面的内容，支持HTML标签',
  `link` varchar(255) DEFAULT NULL COMMENT '点击图文消息跳转链接',
  `file` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `size` int(7) DEFAULT NULL COMMENT '媒体文件上传后，获取时的唯一标识',
  `file_name` varchar(255) DEFAULT NULL COMMENT '媒体文件上传时间戳',
  `thumb` varchar(255) DEFAULT NULL,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) DEFAULT NULL,
  `article_id` varchar(100) DEFAULT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wechat_media
-- ----------------------------

-- ----------------------------
-- Table structure for t_wechat_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_menu`;
CREATE TABLE `t_wechat_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `name` varchar(255) NOT NULL COMMENT '菜单标题',
  `type` varchar(10) NOT NULL COMMENT '菜单的响应动作类型',
  `key` varchar(255) NOT NULL COMMENT '菜单KEY值，click类型必须',
  `url` varchar(255) NOT NULL COMMENT '网页链接，view类型必须',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `scope` int(3) NOT NULL DEFAULT '0' COMMENT '验证方式, 0:不验证，1:base',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wechat_menu
-- ----------------------------
INSERT INTO `t_wechat_menu` VALUES ('1', '0', '当期活动', 'click', 'q', '', '0', '1', '0');
INSERT INTO `t_wechat_menu` VALUES ('2', '1', '线下活动', 'view', '', 'http://mp.weixin.qq.com/s?__biz=MzI4NzM2Mzc4Mw==&mid=2247483916&idx=1&sn=ddaa90132ac2a6f16f1ad4c33bd77771&chksm=ebcf85a4dcb80cb203c662e40761a367f9c86f8a3240835012ae55c75ad728f5e10b31141f4f&scene=0#wechat_redirect', '0', '1', '0');
INSERT INTO `t_wechat_menu` VALUES ('3', '0', '锦绣商城', 'view', '通知', 'http://jxcs.jxworld.net/jxworld/weixin/getShopHome', '0', '1', '1');
INSERT INTO `t_wechat_menu` VALUES ('4', '0', '平台服务', 'click', 'q', '', '0', '1', '0');
INSERT INTO `t_wechat_menu` VALUES ('5', '4', '个人中心', 'view', '通知', 'http://jxcs.jxworld.net/jxworld/weixin/getUserinfo', '0', '1', '1');
INSERT INTO `t_wechat_menu` VALUES ('6', '4', '我要赚钱', 'view', '', 'http://mp.weixin.qq.com/s?__biz=MzI4NzM2Mzc4Mw==&mid=100000134&idx=1&sn=2d5c12dbae3892fa0f417639e94ae5f2&scene=0#wechat_redirect', '0', '1', '0');
INSERT INTO `t_wechat_menu` VALUES ('7', '4', '商务合作', 'view', '', 'http://mp.weixin.qq.com/s?__biz=MzI4NzM2Mzc4Mw==&mid=100000565&idx=1&sn=c410ce08d321cad5c5eaceb52d384f5e&chksm=6bcf849d5cb80d8bd606b328fe1b18c9084ad74faa44d4e0d1c51c1564fda844ef86b515c067&scene=0#wechat_redirect', '0', '1', '0');

-- ----------------------------
-- Table structure for t_wechat_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_qrcode`;
CREATE TABLE `t_wechat_qrcode` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '二维码类型，0临时，1永久',
  `expire_seconds` int(4) DEFAULT NULL COMMENT '二维码有效时间',
  `scene_id` int(10) NOT NULL COMMENT '场景值ID，临时二维码时为32位非0整型，永久二维码时最大值为100000（目前参数只支持1--100000）',
  `username` varchar(60) DEFAULT NULL COMMENT '推荐人',
  `function` varchar(255) NOT NULL COMMENT '功能',
  `ticket` varchar(255) DEFAULT NULL COMMENT '二维码ticket',
  `qrcode_url` varchar(255) DEFAULT NULL COMMENT '二维码路径',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `scan_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扫描量',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wechat_qrcode
-- ----------------------------

-- ----------------------------
-- Table structure for t_wechat_reply
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_reply`;
CREATE TABLE `t_wechat_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL COMMENT '自动回复类型',
  `content` varchar(255) DEFAULT NULL,
  `media_id` int(10) DEFAULT NULL,
  `rule_name` varchar(180) DEFAULT NULL,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `reply_type` varchar(10) DEFAULT NULL COMMENT '关键词回复内容的类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wechat_reply
-- ----------------------------
INSERT INTO `t_wechat_reply` VALUES ('1', 'keywords', '商城升级维护中。。。。。。', '0', '通知', '1479472969', 'text');

-- ----------------------------
-- Table structure for t_wechat_rule_keywords
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_rule_keywords`;
CREATE TABLE `t_wechat_rule_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL COMMENT '规则id',
  `rule_keywords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wechat_rule_keywords
-- ----------------------------
INSERT INTO `t_wechat_rule_keywords` VALUES ('1', '1', '通知');

-- ----------------------------
-- Table structure for t_wechat_template
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_template`;
CREATE TABLE `t_wechat_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(255) DEFAULT NULL,
  `template_id` varchar(255) DEFAULT NULL,
  `contents` varchar(133) DEFAULT NULL,
  `template` text,
  `title` varchar(33) NOT NULL,
  `add_time` int(11) DEFAULT NULL,
  `switch` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wechat_template
-- ----------------------------
