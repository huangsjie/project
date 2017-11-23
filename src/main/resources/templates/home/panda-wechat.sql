/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : panda-wechat

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-11-24 00:46:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for e_processing_step_info
-- ----------------------------
DROP TABLE IF EXISTS `e_processing_step_info`;
CREATE TABLE `e_processing_step_info` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `cultivar_id` varchar(36) NOT NULL COMMENT '品种ID',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  `step_id` varchar(36) NOT NULL COMMENT '工序ID',
  `operator_id` varchar(36) NOT NULL COMMENT '操作人',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_processing_step_info
-- ----------------------------

-- ----------------------------
-- Table structure for e_quality_control_list
-- ----------------------------
DROP TABLE IF EXISTS `e_quality_control_list`;
CREATE TABLE `e_quality_control_list` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `sampling_id` varchar(36) NOT NULL COMMENT '取样ID',
  `check_status` int(10) NOT NULL COMMENT '检验状态',
  `check_time` datetime NOT NULL COMMENT '检验时间',
  `operator_id` varchar(36) NOT NULL COMMENT '检验人',
  `re_check_status` int(10) DEFAULT NULL COMMENT '复核状态',
  `re_check_ussr` varchar(10) DEFAULT NULL COMMENT '复核人',
  `re_check_time` datetime DEFAULT NULL COMMENT '复核时间',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_quality_control_list
-- ----------------------------

-- ----------------------------
-- Table structure for e_sampling_list
-- ----------------------------
DROP TABLE IF EXISTS `e_sampling_list`;
CREATE TABLE `e_sampling_list` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `order_no` varchar(36) NOT NULL COMMENT '取样单号',
  `product_id` varchar(36) NOT NULL COMMENT '产品ID',
  `sampling_number` float(10,2) NOT NULL COMMENT '取样基数',
  `sampling_time` datetime NOT NULL COMMENT '取样时间',
  `operator_id` varchar(36) NOT NULL COMMENT '操作人',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_sampling_list
-- ----------------------------

-- ----------------------------
-- Table structure for e_stock_list
-- ----------------------------
DROP TABLE IF EXISTS `e_stock_list`;
CREATE TABLE `e_stock_list` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `cultivar_id` varchar(100) DEFAULT NULL COMMENT '品种ID',
  `warehouse_id` varchar(36) NOT NULL COMMENT '仓库ID',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  `stock_number` float(10,2) NOT NULL COMMENT '出库数量',
  `stock_time` datetime NOT NULL COMMENT '出库时间',
  `operator_id` varchar(36) NOT NULL COMMENT '操作人',
  `stock_object_id` varchar(36) NOT NULL COMMENT '出库对象',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_stock_list
-- ----------------------------

-- ----------------------------
-- Table structure for e_tea_garden_info
-- ----------------------------
DROP TABLE IF EXISTS `e_tea_garden_info`;
CREATE TABLE `e_tea_garden_info` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '茶园名称',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  `area` varchar(100) NOT NULL COMMENT '区域',
  ` cultivar_id` varchar(36) NOT NULL COMMENT '栽培品种',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_tea_garden_info
-- ----------------------------
INSERT INTO `e_tea_garden_info` VALUES ('60053ec7-cdf7-11e7-a0af-50465deb996e', '茶园A', '13165056-cdf9-11e7-a0af-50465deb996e', '2017-11-20 21:33:46', '13165056-cdf9-11e7-a0af-50465deb996e', '2017-11-20 21:33:52', '1', 'qq', '湖北', '13165056-cdf9-11e7-a0af-50465deb996e');
INSERT INTO `e_tea_garden_info` VALUES ('800a25d7-6d35-401d-bb7f-db0c48906b69', '你好', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 21:15:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 21:15:14', '1', '啊是D阿斯顿发生的方法', '123', '7235cfc8-bcd7-48ef-88e0-fcc0c640ab13');

-- ----------------------------
-- Table structure for e_tea_garden_manage_list
-- ----------------------------
DROP TABLE IF EXISTS `e_tea_garden_manage_list`;
CREATE TABLE `e_tea_garden_manage_list` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `tea_garden_id` varchar(36) NOT NULL COMMENT '茶园',
  `farm_type_id` varchar(36) NOT NULL COMMENT '农事ID',
  `farm_desc` varchar(300) NOT NULL COMMENT '农事类型值(如施化肥5kg)',
  `cultivar_id` varchar(36) NOT NULL,
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `operator_id` varchar(36) NOT NULL COMMENT '操作人ID',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_tea_garden_manage_list
-- ----------------------------

-- ----------------------------
-- Table structure for e_tea_system_step
-- ----------------------------
DROP TABLE IF EXISTS `e_tea_system_step`;
CREATE TABLE `e_tea_system_step` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `tea_system_id` varchar(36) NOT NULL COMMENT '茶系ID',
  `step_id` varchar(50) NOT NULL COMMENT '工序ID',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_tea_system_step
-- ----------------------------

-- ----------------------------
-- Table structure for e_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `e_warehouse`;
CREATE TABLE `e_warehouse` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '农事名称',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  `area` varchar(100) DEFAULT NULL COMMENT '仓库位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_warehouse
-- ----------------------------

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
  UNIQUE KEY `value` (`value`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_dictionary
-- ----------------------------
INSERT INTO `s_dictionary` VALUES ('02e71242-9fea-11e5-a07b-000c29d29d54', '12', '10000000-0000-0000-0000-000000000000', '设备类型', 'customerType', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-11 17:16:00', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-11 17:16:00', '1', '设备类型');
INSERT INTO `s_dictionary` VALUES ('072b643a-9a30-11e5-a07b-000c29d29d54', '11', '10000000-0000-0000-0000-000000000000', '成品品阶', 'checkType', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:49:23', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:49:23', '1', '成品品阶');
INSERT INTO `s_dictionary` VALUES ('0b9ed538-29d6-11e5-965c-000c29d7a3a0', '7', '10000000-0000-0000-0000-000000000000', '加工类型', 'machiningType', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:48:21', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-16 22:45:54', '1', '加工类型 -machiningType');
INSERT INTO `s_dictionary` VALUES ('155a1b9b-5fbb-11e7-8697-38d547b81379', '2', '10000000-0000-0000-0000-000000000000', '用户类型', 'userType', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:46:27', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:46:27', '1', '用户类型');
INSERT INTO `s_dictionary` VALUES ('1689fac5-4b03-4d4b-94c1-d1bbbe8d06ee', '2', '92253cc8-2128-11e5-965c-000c29d7a3a0', '茶园属性2', 'status2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:30:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:30:18', '2', '茶园属性2');
INSERT INTO `s_dictionary` VALUES ('1e12732d-246e-11e5-965c-000c29d7a3a0', '5', '10000000-0000-0000-0000-000000000000', '加工工序', 'machinProcess', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:48:28', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-16 22:46:34', '1', 'machiningType');
INSERT INTO `s_dictionary` VALUES ('241f8263-5e9e-4479-8463-4b902f54e736', '2', '155a1b9b-5fbb-11e7-8697-38d547b81379', '管理员', 'manager', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:51:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:53:07', '1', '管理员类型');
INSERT INTO `s_dictionary` VALUES ('4b2946d6-ec92-403f-ae59-6a2d6311e6cd', '1', '92253cc8-2128-11e5-965c-000c29d7a3a0', '茶园属性1', 'status1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:30:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:30:03', '1', '茶园属性1');
INSERT INTO `s_dictionary` VALUES ('54398001-2a31-42a9-9fed-9d3ce4612fed', '3', '155a1b9b-5fbb-11e7-8697-38d547b81379', '财务-出纳', 'financeCashier', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:52:58', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:53:10', '1', '财务部出纳');
INSERT INTO `s_dictionary` VALUES ('68d6888f-2b91-11e5-965c-000c29d7a3a0', '8', '10000000-0000-0000-0000-000000000000', '质检类型', 'attestation', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:52:05', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:52:05', '1', '质检类型');
INSERT INTO `s_dictionary` VALUES ('74194818-5796-47c5-bad9-ee4beb675158', '3', '10000000-0000-0000-0000-000000000000', '字典测试啊', 'test', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 23:04:33', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 23:04:33', '0', '字典测试啊');
INSERT INTO `s_dictionary` VALUES ('75b11562-9a2b-11e5-a07b-000c29d29d54', '10', '10000000-0000-0000-0000-000000000000', '包装规格', 'operation', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:52:57', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:52:57', '1', '包装规格');
INSERT INTO `s_dictionary` VALUES ('8978edce-c9c6-11e7-8126-38d547b81379', '2', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '删除', 'delete', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-15 13:33:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-26 10:16:25', '1', '删除');
INSERT INTO `s_dictionary` VALUES ('9162c28b-e360-4e44-9e7d-a79b843f3645', '1', '155a1b9b-5fbb-11e7-8697-38d547b81379', '普通用户', 'user', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:51:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 22:51:26', '1', '普通用户类型');
INSERT INTO `s_dictionary` VALUES ('92253cc8-2128-11e5-965c-000c29d7a3a0', '3', '10000000-0000-0000-0000-000000000000', '茶园状态', 'teaStatus', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-10 13:16:08', 'fd8b9374-2134-4eb2-b7c7-0019d65d94b2', '2017-11-10 13:16:08', '1', '茶园状态');
INSERT INTO `s_dictionary` VALUES ('9bda9313-c9c6-11e7-8126-38d547b81379', '3', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '编辑', 'edit', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-15 13:34:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-26 10:16:25', '1', '编辑');
INSERT INTO `s_dictionary` VALUES ('9d590186-c9c6-11e7-8126-38d547b81379', '4', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '导出', 'export', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-15 13:34:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-26 10:16:25', '1', '导出');
INSERT INTO `s_dictionary` VALUES ('9e15db46-c9c6-11e7-8126-38d547b81379', '5', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '提交', 'submit', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-15 13:34:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-26 10:16:25', '1', '提交');
INSERT INTO `s_dictionary` VALUES ('b6315b3a-1587-11e5-a9de-000c29d7a3a0', '1', '10000000-0000-0000-0000-000000000000', '按钮权限', 'roleButtn', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-10 13:16:18', 'fd8b9374-2134-4eb2-b7c7-0019d65d94b2', '2017-11-16 22:35:22', '1', '按钮权限组，以实现分区控制功能');
INSERT INTO `s_dictionary` VALUES ('be0ba01c-23ad-11e5-965c-000c29d7a3a0', '4', '10000000-0000-0000-0000-000000000000', '茶园类型', 'teaType', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:51:24', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:51:24', '1', '茶园类型');
INSERT INTO `s_dictionary` VALUES ('c06d6558-76ea-474d-87c9-e89cbbe1c5fc', '14', '10000000-0000-0000-0000-000000000000', '字典测试', 'diction', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 23:06:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 23:06:31', '1', '字典测试1');
INSERT INTO `s_dictionary` VALUES ('c0de59f4-63a7-11e7-b264-000c29b92c50', '13', '10000000-0000-0000-0000-000000000000', '营销类型', 'marketingType', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:44:46', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:44:46', '1', '营销类型');
INSERT INTO `s_dictionary` VALUES ('c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '新增', 'add', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 23:08:25', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-16 23:08:25', '1', '测试组建唯一');
INSERT INTO `s_dictionary` VALUES ('de46c408-c9c6-11e7-8126-38d547b81379', '6', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '上传', 'upload', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-15 13:36:02', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-26 10:16:25', '1', '上传');
INSERT INTO `s_dictionary` VALUES ('deed64de-c9c6-11e7-8126-38d547b81379', '7', 'b6315b3a-1587-11e5-a9de-000c29d7a3a0', '审核', 'verify', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-15 13:36:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-26 10:16:25', '1', '审核');
INSERT INTO `s_dictionary` VALUES ('efec119e-31ee-11e5-993d-000c29d7a3a0', '9', '10000000-0000-0000-0000-000000000000', '包材类型', 'rankType', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:52:40', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-16 22:46:52', '1', '包材类型1');
INSERT INTO `s_dictionary` VALUES ('f63fe4f8-27ab-11e5-965c-000c29d7a3a0', '6', '10000000-0000-0000-0000-000000000000', '加工时长', 'machiningTime', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-08 14:50:43', 'c6830623-3988-11e5-993d-000c29d7a3a0', '2017-11-16 22:45:37', '1', '加工时长-machiningTime');
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
INSERT INTO `s_menu` VALUES ('04c21bbc-f0c1-4981-bbe7-17627cce0664', '2', '3631e59e-1175-11e5-a9de-000c29d7a3a0', '用户管理', '/system/user/list', null, 'flaticon-users', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:30:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:30:19', '用户信息管理');
INSERT INTO `s_menu` VALUES ('095c96ce-07e5-4c24-aebb-c743adc3562f', '3', '4bcab523-1174-11e5-a9de-000c29d7a3a0', '测试菜单添加时间', '/system/menu/add', '1', 'flaticon-xxx-1', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 11:25:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 11:25:08', '测试菜单添加时间');
INSERT INTO `s_menu` VALUES ('0a1e90f6-cc25-11e7-843e-24fd52935962', '5', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '角色权限', '/system/pageRole/list', '1', 'flaticon-menu', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-18 13:55:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-18 13:55:11', '角色权限设置');
INSERT INTO `s_menu` VALUES ('0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '1', '10000000-0000-0000-0000-100000000000', '系统管理', '/system/index/main', '1', 'flaticon-settings', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '管理');
INSERT INTO `s_menu` VALUES ('0bc54201-f2e3-4585-a9c7-bb5d9b44e26d', '14', '10000000-0000-0000-0000-100000000000', '溯源管理', '/system/originRecord/list', null, 'flaticon-folder-1', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:32:44', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:44:45', '溯源信息管理');
INSERT INTO `s_menu` VALUES ('0de2c731-9dd6-4a95-8fef-0fa88b625c98', '1', 'dd6448d3-ade1-40c3-9043-a77c3036f829', '仓库信息', '/system/warehouse/view', null, 'flaticon-ware', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:08:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:08:07', '仓库信息管理-标记仓库位置信息等');
INSERT INTO `s_menu` VALUES ('10000000-0000-0000-0000-100000000000', '1', '10000000-0000-0000-0000-000000000000', '后台菜单', '/system/index/index', '1', 'flaticon-folder', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-01 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-01 17:38:06', '销售数据分销');
INSERT INTO `s_menu` VALUES ('10000000-0000-0000-0000-200000000000', '2', '10000000-0000-0000-0000-000000000000', '前台菜单', '/home/index/main', '1', 'flaticon-folder', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-01 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:45:57', '销售数据分销');
INSERT INTO `s_menu` VALUES ('10000000-0000-0000-0000-300000000000', '3', '10000000-0000-0000-0000-000000000000', '微信菜单', '/wechat/index/main', '1', 'flaticon-folder', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-01 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-01 17:38:06', '销售数据分销');
INSERT INTO `s_menu` VALUES ('162e38d7-5b27-488b-9776-e60d7aa07b68', '2', '0bc54201-f2e3-4585-a9c7-bb5d9b44e26d', '溯源设置', '/system/originSet/list', null, 'flaticon-set', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:35:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:35:28', '溯源相关信息设置');
INSERT INTO `s_menu` VALUES ('20692517-9187-41df-920b-7c7342a93d37', '3', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '字典管理', '/system/dictionary/list', '1', 'flaticon-xxx', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-06 16:50:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:26:14', '字典信息管理');
INSERT INTO `s_menu` VALUES ('21136dca-a230-4902-b370-73cedbfd37d1', '13', '10000000-0000-0000-0000-100000000000', '设备管理', '/system/equipment/list', null, 'flaticon-profile-1', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:19:52', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:44:10', '生产设备管理');
INSERT INTO `s_menu` VALUES ('2c68aa86-891b-4661-ba76-327e8a2a6215', '1', '0bc54201-f2e3-4585-a9c7-bb5d9b44e26d', '溯源信息', '/system/originInfo/list', null, 'flaticon-info', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:33:58', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:33:58', '溯源信息记录');
INSERT INTO `s_menu` VALUES ('2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', '2', 'f5baa02f-7e39-421f-a7dd-c8ee4773966b', '取样记录', '/system/sampling/list', null, 'flaticon-samp', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:18:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:18:24', '质检取样记录管理');
INSERT INTO `s_menu` VALUES ('33fb6e82-2b8b-48fb-af3c-fb886049ca77', '9', '10000000-0000-0000-0000-100000000000', '加工管理', '/system/teaMachin/list', '1', 'flaticon-open-box', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 23:48:20', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:40:33', '茶叶加工流程管理');
INSERT INTO `s_menu` VALUES ('3631e59e-1175-11e5-a9de-000c29d7a3a0', '5', '10000000-0000-0000-0000-100000000000', '客户管理', '/system/ucenter/index', '1', 'flaticon-users', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:25:39', '供应链管理');
INSERT INTO `s_menu` VALUES ('4bcab523-1174-11e5-a9de-000c29d7a3a0', '2', '10000000-0000-0000-0000-100000000000', '商品管理', '/system/commodity/index', '1', 'flaticon-business', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 14:07:05', '电商平台管理');
INSERT INTO `s_menu` VALUES ('5863e4f5-927d-4c96-8bda-2294703bc909', '2', 'dd6448d3-ade1-40c3-9043-a77c3036f829', '库存管理', '/system/inventory/list', null, 'flaticon-inven', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:10:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:10:15', '产品库存管理');
INSERT INTO `s_menu` VALUES ('5af24cc1-0a73-4f28-8972-dae2f138c1a8', '2', 'b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '茶园日志', '/system/teaLog/list', '1', 'flaticon-app-1', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 23:44:10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 23:44:10', '记录茶园操作日志');
INSERT INTO `s_menu` VALUES ('5d2f2a0d-9326-4026-b338-c03bf6e255db', '11', '10000000-0000-0000-0000-100000000000', '包装管理', '/system/packing/list', null, 'flaticon-bag', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:11:43', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:41:50', '产品包装信息等');
INSERT INTO `s_menu` VALUES ('67416840-6b15-473b-80fc-bbf1b28dfac5', '1', '21136dca-a230-4902-b370-73cedbfd37d1', '清洁记录', '/system/clear/list', null, 'flaticon-clear', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:20:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:20:59', '设备清洁记录');
INSERT INTO `s_menu` VALUES ('6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', '1', 'f5baa02f-7e39-421f-a7dd-c8ee4773966b', '质检记录', '/system/process/list', null, 'flaticon-process', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:17:01', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:17:01', '质检记录管理');
INSERT INTO `s_menu` VALUES ('76849bfe-dfd4-476c-b2f8-11072c25ceb8', '1', 'b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '茶园信息', '/system/origin/teaGarden', '1', 'flaticon-list-3', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:41:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 23:40:03', '茶园信息管理');
INSERT INTO `s_menu` VALUES ('97ea6edb-1178-11e5-a9de-000c29d7a3a0', '6', '10000000-0000-0000-0000-100000000000', '财务管理', '/system/demand/index', '1', 'flaticon-coins', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '财务结算中心');
INSERT INTO `s_menu` VALUES ('b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '8', '10000000-0000-0000-0000-100000000000', '茶园管理', '/system/origin/teaGarden', '1', 'flaticon-tea-cup', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:31:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 23:40:26', '茶园管理模块');
INSERT INTO `s_menu` VALUES ('c3538d54-8e09-11e6-b311-005056812bf6', '3', '10000000-0000-0000-0000-100000000000', '物流管理', '/system/operation/index', '1', 'flaticon-truck', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '跨境物流管理');
INSERT INTO `s_menu` VALUES ('caf65c04-beed-11e7-959c-38d547b81379', '1', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '菜单管理', '/system/menu/list', '1', 'flaticon-app', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '菜单信息管理');
INSERT INTO `s_menu` VALUES ('ce43305b-a658-4e8c-b864-10b6ee797429', '1', '5d2f2a0d-9326-4026-b338-c03bf6e255db', '包材管理', '/system/packageMaterial/list', null, 'flaticon-mate', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:13:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:13:42', '包材材料管理');
INSERT INTO `s_menu` VALUES ('d07687ef-2798-11e5-965c-000c29d7a3a0', '1', '3631e59e-1175-11e5-a9de-000c29d7a3a0', '门店管理', '/system/store/list', '1', 'flaticon-map', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:29:13', '个人中心、会员中心');
INSERT INTO `s_menu` VALUES ('d2aad1f2-4230-4aee-a1f1-91a6a6c5db40', '2', '21136dca-a230-4902-b370-73cedbfd37d1', '设备维护', '/system/maintain/list', null, 'flaticon-main', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:22:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:22:13', '设备保养记录');
INSERT INTO `s_menu` VALUES ('d942abc1-b177-452e-8c53-1914ac448c7d', '4', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '角色菜单', '/system/roleMenu/list', '1', 'flaticon-menu', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-08 17:50:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-08 17:53:27', '角色菜单设置');
INSERT INTO `s_menu` VALUES ('dd6448d3-ade1-40c3-9043-a77c3036f829', '10', '10000000-0000-0000-0000-100000000000', '库存管理', '/system/stockManager/list', null, 'flaticon-network', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:04:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:41:28', '库存信息管理');
INSERT INTO `s_menu` VALUES ('df1a659b-180f-4fd2-abb0-b42c7db62714', '1', '33fb6e82-2b8b-48fb-af3c-fb886049ca77', '加工1', '/system/teaMachin/list', null, 'flaticon-machin', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:03:25', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:03:25', '加工的事情');
INSERT INTO `s_menu` VALUES ('e38ab74b-bf14-11e7-a301-24fd52935962', '2', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '角色管理', '/system/roles/list', '1', 'flaticon-profile', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-01 22:56:49', '角色信息管理');
INSERT INTO `s_menu` VALUES ('f5baa02f-7e39-421f-a7dd-c8ee4773966b', '12', '10000000-0000-0000-0000-100000000000', '质检管理', '/system/quality/list', null, 'flaticon-notes', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:15:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:43:25', '产品质量管理');
INSERT INTO `s_menu` VALUES ('fb69a533-1178-11e5-a9de-000c29d7a3a0', '7', '10000000-0000-0000-0000-100000000000', '数据管理', '/system/data/index', '1', 'flaticon-folder', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 14:06:47', '销售数据分销');

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
INSERT INTO `s_page_role` VALUES ('00b8596c-480e-4325-ae5b-9d934e0ffb69', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:08');
INSERT INTO `s_page_role` VALUES ('020e0cea-5869-480e-b77d-c20980e679ab', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:49');
INSERT INTO `s_page_role` VALUES ('04f7dbe2-75fe-4e14-b267-c7ae859c5987', 'e38ab74b-bf14-11e7-a301-24fd52935962', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:54');
INSERT INTO `s_page_role` VALUES ('051c7747-7236-444e-8bfa-d1885be4d86f', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:30');
INSERT INTO `s_page_role` VALUES ('089aa77d-0666-4b0d-90d1-6e3061d248f6', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:56', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:56');
INSERT INTO `s_page_role` VALUES ('0d6925a7-dce4-4b22-b982-6d7e1172b5cb', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:37');
INSERT INTO `s_page_role` VALUES ('0f93d0c3-01aa-4d73-af44-dcf67415148e', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:04', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:04');
INSERT INTO `s_page_role` VALUES ('0ffdc442-2544-4fe5-bbd4-5245f1f88394', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:31');
INSERT INTO `s_page_role` VALUES ('125cd21d-8b42-4852-977a-8edf9d185793', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:11');
INSERT INTO `s_page_role` VALUES ('14a2a083-74be-4d82-a881-93494f686092', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:31');
INSERT INTO `s_page_role` VALUES ('14e35dda-54f3-4e70-801f-205f0985664e', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:22', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:22');
INSERT INTO `s_page_role` VALUES ('1889d39c-a7f3-42e4-b407-f3d38523b71c', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:49');
INSERT INTO `s_page_role` VALUES ('18b73917-592f-421e-80eb-277715ac405b', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:39', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:39');
INSERT INTO `s_page_role` VALUES ('1a773f13-6816-4723-b4ca-ed2711b9c94c', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:44', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:44');
INSERT INTO `s_page_role` VALUES ('1b29a6cc-abb3-471f-a97b-646289e801c2', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:18:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:18:59');
INSERT INTO `s_page_role` VALUES ('1dc9564c-1704-4d4a-a1e8-51781220fca9', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:58', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:58');
INSERT INTO `s_page_role` VALUES ('1f704ca2-0c0f-4505-accc-560ad90d7f30', 'e38ab74b-bf14-11e7-a301-24fd52935962', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:52', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:52');
INSERT INTO `s_page_role` VALUES ('205cc0d5-92c6-4b80-a9b4-b6cfa77d9097', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:27', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:27');
INSERT INTO `s_page_role` VALUES ('20e6816d-bb56-4ef1-a38a-cf447067a109', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:18');
INSERT INTO `s_page_role` VALUES ('2361473b-1880-43a5-85f8-463f4725c1ee', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:18');
INSERT INTO `s_page_role` VALUES ('24724370-ffce-4f15-bde9-17d35aeb5028', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:12');
INSERT INTO `s_page_role` VALUES ('29480c54-0ad9-4b90-920d-9747b1e247f7', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:19');
INSERT INTO `s_page_role` VALUES ('2aa3d062-45b6-48fd-89a1-1357645862d3', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:29');
INSERT INTO `s_page_role` VALUES ('2bdc16a0-fc52-434f-bf7c-e673fd1f1e52', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:03');
INSERT INTO `s_page_role` VALUES ('2bfa24dc-bd20-4da2-86ec-dca0818e954a', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:42');
INSERT INTO `s_page_role` VALUES ('2c7d7d8c-cda1-4840-9923-12977383f6ee', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:47');
INSERT INTO `s_page_role` VALUES ('2e0abeac-9a82-4db3-ad03-4e58b54a3a0b', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:00', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:00');
INSERT INTO `s_page_role` VALUES ('31fdf877-90c4-4599-8549-a85ac0479a24', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:46');
INSERT INTO `s_page_role` VALUES ('32119401-0c36-4982-9bdf-e0af1c5467a0', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:19');
INSERT INTO `s_page_role` VALUES ('32f3be37-e32f-490d-9f8c-70b49a229dc8', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:36', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:36');
INSERT INTO `s_page_role` VALUES ('33734c49-46c6-4a04-a8c1-c2b58ecbd7ce', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:32', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:32');
INSERT INTO `s_page_role` VALUES ('355efc0f-a08f-443e-96a4-02278e248424', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:16', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:16');
INSERT INTO `s_page_role` VALUES ('38458ab3-cfa8-495a-8a76-290763e854af', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:05', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:05');
INSERT INTO `s_page_role` VALUES ('399df380-45da-4c41-9d75-786619976847', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:19');
INSERT INTO `s_page_role` VALUES ('3b1e2541-b46b-4a8e-b2ad-3174823444ce', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:59');
INSERT INTO `s_page_role` VALUES ('3c2b087c-e8dd-4267-b9af-dd0de8444a25', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:09', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:09');
INSERT INTO `s_page_role` VALUES ('3fe73a27-dd67-4744-aea5-2662cddefbb9', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:34', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:34');
INSERT INTO `s_page_role` VALUES ('45bcf3fa-ae77-477a-8957-1c108c93bd5e', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:37');
INSERT INTO `s_page_role` VALUES ('49ae13c8-34f3-4d28-bf69-d1668221f932', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:31');
INSERT INTO `s_page_role` VALUES ('4ab306fc-0236-420e-9a2f-848e8ab989db', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:10');
INSERT INTO `s_page_role` VALUES ('4ac88108-40aa-4282-bdc7-e83207ef7809', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:57');
INSERT INTO `s_page_role` VALUES ('5005558b-c6b5-4c91-81ef-3a65d6dd6aa1', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:15');
INSERT INTO `s_page_role` VALUES ('5064b108-f4d6-4b2a-9b9e-ddab3876a87b', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:18');
INSERT INTO `s_page_role` VALUES ('5099d0bd-e4e4-4d9c-a440-1942293d8982', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:40');
INSERT INTO `s_page_role` VALUES ('5147ce21-5fd9-4afc-a449-b9acd398a347', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:03');
INSERT INTO `s_page_role` VALUES ('516d24c7-87f1-47d8-8e01-df28aaebc30a', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:10');
INSERT INTO `s_page_role` VALUES ('526dd681-055c-4c4b-b5d5-900b390214f2', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:14');
INSERT INTO `s_page_role` VALUES ('553b3b7f-a52c-4e3b-82f6-4147adfa8116', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:51');
INSERT INTO `s_page_role` VALUES ('55426de5-9214-4c57-9bfa-f82916589a32', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:09', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:09');
INSERT INTO `s_page_role` VALUES ('58559771-7e14-4c7b-bff5-898363c36ad1', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:48', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:48');
INSERT INTO `s_page_role` VALUES ('59846d41-a448-41b2-b156-faa194156213', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:24');
INSERT INTO `s_page_role` VALUES ('5cb7ecc2-361e-493e-9839-4620df59f5e9', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:28');
INSERT INTO `s_page_role` VALUES ('5d2dda2a-b833-40ff-869b-61d6b634a3dd', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:26');
INSERT INTO `s_page_role` VALUES ('5e83f553-3fca-4cb5-a707-f3d25ea683b0', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:17', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:17');
INSERT INTO `s_page_role` VALUES ('5e9fcddb-3aa8-48c8-b6ca-d0b1cad14da7', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:58', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:58');
INSERT INTO `s_page_role` VALUES ('6084bc0a-4f20-4910-abb9-672a753ad1dc', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:11');
INSERT INTO `s_page_role` VALUES ('613e7321-9422-40e1-8355-8239111f7199', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:21');
INSERT INTO `s_page_role` VALUES ('61447d6d-0818-4d62-af26-60f0c00522a4', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:31');
INSERT INTO `s_page_role` VALUES ('638a122b-7595-42f6-9a57-c01a3bd0cb0c', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:54');
INSERT INTO `s_page_role` VALUES ('677d436c-8d48-493b-9a2c-61b0103da9a8', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:06');
INSERT INTO `s_page_role` VALUES ('682f58b3-2ba5-473f-ad10-c2c3eb4ee746', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:31');
INSERT INTO `s_page_role` VALUES ('68519e2d-53b2-49d0-aabb-d44816521c23', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:06');
INSERT INTO `s_page_role` VALUES ('6916f12c-923e-4b4f-ba39-bcb444be382e', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:48', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:48');
INSERT INTO `s_page_role` VALUES ('69eb8e3a-19cb-4bb3-a06b-e09684e99a63', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:49');
INSERT INTO `s_page_role` VALUES ('6c1ebf53-3e1f-4cf1-95c9-dc98991f14c4', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:00', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:00');
INSERT INTO `s_page_role` VALUES ('6dbdeccf-d1ef-4d03-a614-3777ce41de1a', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:47');
INSERT INTO `s_page_role` VALUES ('6e786857-0246-46f1-9c57-0ebbd0c60578', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:18:58', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:18:58');
INSERT INTO `s_page_role` VALUES ('6e871904-bace-41ae-8230-ca89a66ffa4b', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:21');
INSERT INTO `s_page_role` VALUES ('7040bae6-6521-4420-a14e-931d2c7050ba', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:05', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:05');
INSERT INTO `s_page_role` VALUES ('71708ec9-6163-4e1b-b128-2cad710e5c63', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:21');
INSERT INTO `s_page_role` VALUES ('725b12e9-d663-4291-a40c-a160bfa73f4f', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:18:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:18:57');
INSERT INTO `s_page_role` VALUES ('7291299f-1997-4207-bf14-b8237477d1aa', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:47');
INSERT INTO `s_page_role` VALUES ('7401737d-02e0-42c0-9a14-9c794d67e841', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:33', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:33');
INSERT INTO `s_page_role` VALUES ('76441396-9548-409b-aa36-234aff5f8560', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:07');
INSERT INTO `s_page_role` VALUES ('79ce2421-1200-485c-b387-fc45b297f52a', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:05', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:05');
INSERT INTO `s_page_role` VALUES ('7f1ef68a-a13b-408b-9779-aa8c3f41271e', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:42');
INSERT INTO `s_page_role` VALUES ('805a355d-3236-4fd0-98ab-9624dc535545', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:16', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:16');
INSERT INTO `s_page_role` VALUES ('80b03523-2054-4359-955c-d69525ebbed6', 'e38ab74b-bf14-11e7-a301-24fd52935962', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:51');
INSERT INTO `s_page_role` VALUES ('8182c08c-33e8-4639-9ab1-e45d1bfb63a4', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:21');
INSERT INTO `s_page_role` VALUES ('8288214f-9b49-4691-aca3-295a84366a17', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:41');
INSERT INTO `s_page_role` VALUES ('839c2d76-7e8c-42e8-a203-be0038cf03a4', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:40');
INSERT INTO `s_page_role` VALUES ('83c6fe89-d165-422a-9b77-210a57922c96', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:13');
INSERT INTO `s_page_role` VALUES ('8422b8d1-650e-4848-a599-521a31964acc', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:04', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:04');
INSERT INTO `s_page_role` VALUES ('85a0a410-759b-48fe-a9a0-ca6e96f8ec84', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:37');
INSERT INTO `s_page_role` VALUES ('87221d8a-be8e-4cde-bfb6-fbf07641f6bf', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:13');
INSERT INTO `s_page_role` VALUES ('8730f65d-16a0-4f25-bca1-7c8bf38ef3f9', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:32', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:32');
INSERT INTO `s_page_role` VALUES ('8b8fee70-a44a-4e48-a2e5-e6d08512f14d', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:33', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:33');
INSERT INTO `s_page_role` VALUES ('8d3e106d-9af3-4683-ba0c-2596c9917d5f', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:18');
INSERT INTO `s_page_role` VALUES ('8d575d02-e420-40ca-b184-9c40a62dc651', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:10', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:10');
INSERT INTO `s_page_role` VALUES ('97eb9038-610f-40b7-8b28-4bf0c8abcc6b', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:27', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:27');
INSERT INTO `s_page_role` VALUES ('9a2f7ef3-fc85-47d3-9893-6af1ec7cf4f5', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:06');
INSERT INTO `s_page_role` VALUES ('9a802bab-de24-4ae0-ad3d-d969ef9c4017', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:30');
INSERT INTO `s_page_role` VALUES ('9ba3e496-4c6e-4d43-860d-1ef21b6edcfb', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:45', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:45');
INSERT INTO `s_page_role` VALUES ('9bd9ee94-27a9-4f74-afa9-dddb07832086', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:20', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:20');
INSERT INTO `s_page_role` VALUES ('a0992344-a906-43a5-adcc-a88900aba964', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:50');
INSERT INTO `s_page_role` VALUES ('a1d56c8a-4da1-44cd-9d36-e26e27e36615', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:03');
INSERT INTO `s_page_role` VALUES ('a2e76970-77e9-40df-9e36-92cedd25602f', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:40', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:40');
INSERT INTO `s_page_role` VALUES ('a31f6119-e9d4-4967-8bd2-ae5c1724adb5', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:13');
INSERT INTO `s_page_role` VALUES ('ac78a126-701e-478d-a101-17a84d1ceae5', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:36', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:36');
INSERT INTO `s_page_role` VALUES ('acc82e5f-0d6e-42f5-8f2d-457222179c48', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:30', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:30');
INSERT INTO `s_page_role` VALUES ('ae56902c-d723-4abd-a74e-25cc2483eb74', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:17', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:17');
INSERT INTO `s_page_role` VALUES ('b07a7ba5-93a8-4f85-b327-fbfb403b6a5d', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:09', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:09');
INSERT INTO `s_page_role` VALUES ('b2a9c5ff-2bf0-4046-b944-7a295ffdd665', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:48', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:48');
INSERT INTO `s_page_role` VALUES ('b408c715-19ed-46ee-9428-5e5cfd58fd13', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:50');
INSERT INTO `s_page_role` VALUES ('b4f00ac8-8c14-4ae0-8b39-20265fd31750', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:02', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:02');
INSERT INTO `s_page_role` VALUES ('b541062f-24d4-4937-8071-d712a445b025', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:41');
INSERT INTO `s_page_role` VALUES ('b85720bf-9b1a-43ec-bc0a-e82ce6c0af86', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:14');
INSERT INTO `s_page_role` VALUES ('b975457a-ec07-4102-831a-70dd9b517a8e', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:39', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:39');
INSERT INTO `s_page_role` VALUES ('ba1a27d3-ed45-4d0b-8f61-8aa9c0c14fca', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:33', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:33');
INSERT INTO `s_page_role` VALUES ('ba225e35-ea52-4ee8-b3fd-4a2883dd5103', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:15');
INSERT INTO `s_page_role` VALUES ('ba3e5d87-fe92-459d-9aa0-bcc55b879c68', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:47');
INSERT INTO `s_page_role` VALUES ('bae8b7b5-b9f3-11e7-b0f1-38d547b81379', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-26 10:17:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-26 10:17:50');
INSERT INTO `s_page_role` VALUES ('bb38eaae-6535-4650-9062-c8a844cd430a', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:46');
INSERT INTO `s_page_role` VALUES ('bd44cd2d-1b4e-49d7-904c-9e83cdf42184', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:48', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:48');
INSERT INTO `s_page_role` VALUES ('bdbcf569-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:28:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:28:42');
INSERT INTO `s_page_role` VALUES ('bff31f2d-61db-45f1-8285-bb82cae08dcc', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:15', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:15');
INSERT INTO `s_page_role` VALUES ('c1cce5ab-dfaf-424e-8700-4994ebfac93d', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:23', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:23');
INSERT INTO `s_page_role` VALUES ('c308e511-780e-41b8-81b8-30c68599fef3', '04c21bbc-f0c1-4981-bbe7-17627cce0664', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:14');
INSERT INTO `s_page_role` VALUES ('c4f42f8f-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:28:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:28:54');
INSERT INTO `s_page_role` VALUES ('c518b30e-0e5e-44c2-920b-f212dbdc3324', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:05', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:05');
INSERT INTO `s_page_role` VALUES ('c54f41e0-c2c8-43c3-a734-be4848c36a8f', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:51');
INSERT INTO `s_page_role` VALUES ('c56668bb-c56b-40c4-9143-f87d8c139def', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:24');
INSERT INTO `s_page_role` VALUES ('c6352c33-05d3-4d2e-b66e-2f5627e6dfb0', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:35', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:35');
INSERT INTO `s_page_role` VALUES ('c6cd6715-6203-4f84-b55a-68c57eae82e4', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:37');
INSERT INTO `s_page_role` VALUES ('c6e7a1f7-31cc-439a-9daa-69b5aab08308', '67416840-6b15-473b-80fc-bbf1b28dfac5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:38', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:38');
INSERT INTO `s_page_role` VALUES ('c8ea16e2-79ad-42c3-b76a-883b4d4a4724', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:43', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:43');
INSERT INTO `s_page_role` VALUES ('ca9b9c64-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:03');
INSERT INTO `s_page_role` VALUES ('cb07d6fe-d17c-47f0-bdd6-3f0b7af58147', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:53', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:53');
INSERT INTO `s_page_role` VALUES ('cc2e0288-62cc-4821-b7a5-afa6f9261ce8', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:02', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:02');
INSERT INTO `s_page_role` VALUES ('cc95bfe5-2335-4aa3-ad17-2e26eb1b93ef', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:50');
INSERT INTO `s_page_role` VALUES ('ce7bae32-c358-4e07-a91f-22bea1a06653', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:32', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:32');
INSERT INTO `s_page_role` VALUES ('cf43f9fb-e2e6-4fbc-bbed-9cfcb682c4f8', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:08');
INSERT INTO `s_page_role` VALUES ('cf44b720-e3d3-4289-a3b9-962f1fa83c9f', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:38', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:38');
INSERT INTO `s_page_role` VALUES ('cf922533-5459-4c7c-9c0f-04fd74ddc360', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:52', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:52');
INSERT INTO `s_page_role` VALUES ('cff06d81-8833-460c-a0d2-4386cb30fcab', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:29');
INSERT INTO `s_page_role` VALUES ('d0f06bbb-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:14');
INSERT INTO `s_page_role` VALUES ('d4869692-e7ab-47e8-b71c-76d522a0528a', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:57');
INSERT INTO `s_page_role` VALUES ('d4b76915-12f2-4be4-a7ca-bcd12ee40a67', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:09', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:09');
INSERT INTO `s_page_role` VALUES ('d62cbf1c-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:23', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:23');
INSERT INTO `s_page_role` VALUES ('d8895364-5ec2-46d5-9f59-e779fae092ad', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:07', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:07');
INSERT INTO `s_page_role` VALUES ('dd0eac49-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:34', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:34');
INSERT INTO `s_page_role` VALUES ('dda029b3-2fd7-4729-9658-983d2683bed0', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:01', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:01');
INSERT INTO `s_page_role` VALUES ('ddb7f2cc-8f4c-4197-99d6-eaaa1a1fb3a5', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:04', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:04');
INSERT INTO `s_page_role` VALUES ('e0b14634-4ae5-4ad0-b393-be6eb642c281', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:45', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:45');
INSERT INTO `s_page_role` VALUES ('e3c67641-8f6b-4f09-81a2-b47287cc1c3c', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:59', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:59');
INSERT INTO `s_page_role` VALUES ('e3d4dd30-77ef-4633-8856-c9be7c98838d', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:55', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:55');
INSERT INTO `s_page_role` VALUES ('e5eb0f56-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:49');
INSERT INTO `s_page_role` VALUES ('e6307870-aa9d-46d5-b704-b2f856fdf973', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:46');
INSERT INTO `s_page_role` VALUES ('e959be1c-e6aa-47c6-b96e-bad7e39b9981', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:26');
INSERT INTO `s_page_role` VALUES ('ea3f6d1e-c700-4877-9a8b-e87483f0c2d7', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 21:35:46');
INSERT INTO `s_page_role` VALUES ('ea8504db-dd70-484e-bc79-75028ef4f2e1', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:50', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:50');
INSERT INTO `s_page_role` VALUES ('ec86ca7f-d6e6-4fd7-8f62-c0d92e1b6631', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:20', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:20');
INSERT INTO `s_page_role` VALUES ('ec993411-82d4-4a78-97b1-c47ac6833541', 'ce43305b-a658-4e8c-b864-10b6ee797429', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:09', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:09');
INSERT INTO `s_page_role` VALUES ('efd1d268-1660-4d40-b159-1abb26698352', '162e38d7-5b27-488b-9776-e60d7aa07b68', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:38:08');
INSERT INTO `s_page_role` VALUES ('f50ab5e3-cf67-4133-92ca-0ad3c26754da', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:28');
INSERT INTO `s_page_role` VALUES ('f64a1385-983b-4556-a68d-14a4a51bbc8e', 'df1a659b-180f-4fd2-abb0-b42c7db62714', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:39', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:39');
INSERT INTO `s_page_role` VALUES ('f6fd0b34-637d-4c6b-a2e6-68438f59c121', '5863e4f5-927d-4c96-8bda-2294703bc909', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:01', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:01');
INSERT INTO `s_page_role` VALUES ('f78fdbbd-6387-497e-8788-a4874cddf5e6', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:13', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 15:19:13');
INSERT INTO `s_page_role` VALUES ('f7e6d269-e262-4d59-b4ce-bdc88a845aa5', 'd07687ef-2798-11e5-965c-000c29d7a3a0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:36:03');
INSERT INTO `s_page_role` VALUES ('fe66a627-5617-42e0-8e1f-a8a71bbcdb67', '2c68aa86-891b-4661-ba76-327e8a2a6215', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:57', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:37:57');

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
INSERT INTO `s_roles` VALUES ('0C03F6B6-8CC4-4826-8A51-149990861BE3', '系统工程师', '系统工程师12', '1', '1', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4');
INSERT INTO `s_roles` VALUES ('257ae84e-d86a-11e6-ba64-d8490bd28593', '管理员', '管理员1', '1', '1', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4');
INSERT INTO `s_roles` VALUES ('c716be42-78c2-4c80-8c88-25814b2e683b', '普通用户', '普通用的的角色', '1', '1', '2017-11-08 16:32:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-08 16:32:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4');
INSERT INTO `s_roles` VALUES ('f8692cd2-e801-11e4-8fee-40167e64eefd', '系统管理员', '系统管理员', '1', '1', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4');

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
INSERT INTO `s_role_menu` VALUES ('05c5cf15-9fd9-47f2-b03a-3607de630666', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'caf65c04-beed-11e7-959c-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('091eab92-d53b-45d9-9d56-8609905eb2f5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '5863e4f5-927d-4c96-8bda-2294703bc909', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:10:15');
INSERT INTO `s_role_menu` VALUES ('0c00848c-7228-493c-ab22-75bb134623f0', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'ce43305b-a658-4e8c-b864-10b6ee797429', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:13:42');
INSERT INTO `s_role_menu` VALUES ('0f376505-c36f-42e8-81e6-21ab406ca3db', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '3631e59e-1175-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('117f61b3-18c0-459c-84f5-138e8405f483', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'f5baa02f-7e39-421f-a7dd-c8ee4773966b', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:15:14');
INSERT INTO `s_role_menu` VALUES ('11826290-08f5-45e6-a651-bf3513aba74e', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '0a1e90f6-cc25-11e7-843e-24fd52935962', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('120a99d6-f198-466d-a642-a3a3501a3cda', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '6fc0d40a-ca6e-4c19-8d24-485d5a61ea50', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:17:01');
INSERT INTO `s_role_menu` VALUES ('12abba29-8284-48b0-9fd9-06c28ee9d359', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('12de943e-d491-46ec-a046-8bc63ea70620', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c3538d54-8e09-11e6-b311-005056812bf6', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('152fa507-9961-4116-a255-3db1fee59159', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'd942abc1-b177-452e-8c53-1914ac448c7d', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('188d4fc9-663c-47ec-a59b-126611c4ed0c', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '97ea6edb-1178-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('1baca17f-f581-4784-a76e-7fe6268b50f7', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'c3538d54-8e09-11e6-b311-005056812bf6', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('2343e0c2-d067-11e7-a807-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '33fb6e82-2b8b-48fb-af3c-fb886049ca77', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 23:58:25');
INSERT INTO `s_role_menu` VALUES ('23d6664b-ae04-4f84-9bc9-c8b688489357', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '04c21bbc-f0c1-4981-bbe7-17627cce0664', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:30:19');
INSERT INTO `s_role_menu` VALUES ('28987f86-4ac8-460c-a581-fd7be0d9c124', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'fb69a533-1178-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('28b46f54-6cc8-42ca-af69-231ae2fd38c4', 'c716be42-78c2-4c80-8c88-25814b2e683b', '10000000-0000-0000-0000-200000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:31');
INSERT INTO `s_role_menu` VALUES ('29805307-37f1-407f-82e9-aa989369c2a5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '20692517-9187-41df-920b-7c7342a93d37', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('2f95acd0-d067-11e7-a807-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '5af24cc1-0a73-4f28-8972-dae2f138c1a8', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-23 23:58:45');
INSERT INTO `s_role_menu` VALUES ('3744e89c-a116-4783-9f47-bb935386ec41', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '5d2f2a0d-9326-4026-b338-c03bf6e255db', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:11:43');
INSERT INTO `s_role_menu` VALUES ('49ea090b-1f1e-4e4b-baa5-fbbb392d474d', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'caf65c04-beed-11e7-959c-38d547b81379', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('512ce723-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '0a1e90f6-cc25-11e7-843e-24fd52935962', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-18 13:57:11');
INSERT INTO `s_role_menu` VALUES ('519d6387-4e6e-4ab9-976a-41b9b331edfa', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '2c68aa86-891b-4661-ba76-327e8a2a6215', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:33:58');
INSERT INTO `s_role_menu` VALUES ('574858b8-1fc1-4dea-b458-d46a88202051', 'c716be42-78c2-4c80-8c88-25814b2e683b', '10000000-0000-0000-0000-300000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:31');
INSERT INTO `s_role_menu` VALUES ('5c6efcb2-62a1-4a80-860f-85556ff2ad96', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '3631e59e-1175-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('5e03e76a-5b01-4b50-99b6-ec088cbbe482', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '0bc54201-f2e3-4585-a9c7-bb5d9b44e26d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:32:44');
INSERT INTO `s_role_menu` VALUES ('6b571011-cdf0-11e7-a0af-50465deb996e', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('6e179d0b-1999-4cd2-8d65-c74aeac86138', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '4bcab523-1174-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('73ca6c93-6213-4a56-b0d7-d717b2a40fdd', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'e38ab74b-bf14-11e7-a301-24fd52935962', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('7cc3fdfb-cf40-11e7-ad32-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('7cc42f97-cf40-11e7-ad32-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('87b72623-a691-4405-97b2-2a4cd03b7b65', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'df1a659b-180f-4fd2-abb0-b42c7db62714', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:03:25');
INSERT INTO `s_role_menu` VALUES ('8b1bc67a-34c2-422d-9574-b236371ddfa6', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '2d42e55d-5e6a-4b92-ba22-5c188c0d13d2', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:18:24');
INSERT INTO `s_role_menu` VALUES ('9c85de13-8c9e-4281-bebd-820036b178cd', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '162e38d7-5b27-488b-9776-e60d7aa07b68', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:35:28');
INSERT INTO `s_role_menu` VALUES ('ac8fb970-78ad-40f5-a082-1f2a171f1986', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'd07687ef-2798-11e5-965c-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('b452c7d9-8570-45c7-a4ee-b55938cc1047', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '21136dca-a230-4902-b370-73cedbfd37d1', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:19:52');
INSERT INTO `s_role_menu` VALUES ('b8b84474-02e6-4210-a5e5-e94390685099', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'e38ab74b-bf14-11e7-a301-24fd52935962', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('bd70ed16-8fc5-4f21-a2fa-4fc5f82faa80', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'd942abc1-b177-452e-8c53-1914ac448c7d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('bdf1927a-e0b7-4c5e-921b-758ff46f3f19', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '97ea6edb-1178-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('be32b052-2ed3-47f4-a373-53fc004739da', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'd07687ef-2798-11e5-965c-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('c56e414b-f510-4334-b1a4-794ead9cac01', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fb69a533-1178-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('c7c89fea-40f3-4417-99f3-3c12adfc3a08', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '67416840-6b15-473b-80fc-bbf1b28dfac5', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:20:59');
INSERT INTO `s_role_menu` VALUES ('c826c0b0-a0fb-4325-af4a-19804275e4d9', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'dd6448d3-ade1-40c3-9043-a77c3036f829', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:04:57');
INSERT INTO `s_role_menu` VALUES ('c8f6360b-745c-4bcd-a21e-97dcf4185b60', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '10000000-0000-0000-0000-100000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('cf31615b-cecb-11e7-979d-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '10000000-0000-0000-0000-300000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-04 17:12:13');
INSERT INTO `s_role_menu` VALUES ('d0233780-ee85-4293-9322-e2acdc0506b3', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-21 23:05:31');
INSERT INTO `s_role_menu` VALUES ('d178db18-cecb-11e7-979d-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '10000000-0000-0000-0000-200000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-04 17:12:13');
INSERT INTO `s_role_menu` VALUES ('d3af5e46-cecb-11e7-979d-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '10000000-0000-0000-0000-100000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-04 17:12:13');
INSERT INTO `s_role_menu` VALUES ('d5d7ddbc-9bf4-41e7-b88b-8b1a5f025549', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '4bcab523-1174-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:13');
INSERT INTO `s_role_menu` VALUES ('db0fea8c-c94d-43cf-81a8-d992f1672dd1', '257ae84e-d86a-11e6-ba64-d8490bd28593', '10000000-0000-0000-0000-100000000000', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:27');
INSERT INTO `s_role_menu` VALUES ('dfe63cdc-5706-4e4d-97a9-3958c7d70750', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('ea07ba03-9952-485c-9d1c-22c980f2f3d1', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '20692517-9187-41df-920b-7c7342a93d37', '2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:10');
INSERT INTO `s_role_menu` VALUES ('ee14142c-83f7-4361-ac20-73da7cfe3a28', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'd2aad1f2-4230-4aee-a1f1-91a6a6c5db40', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:22:13');
INSERT INTO `s_role_menu` VALUES ('f9cad055-3f05-49fe-b321-e33bdbb4e939', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '0de2c731-9dd6-4a95-8fef-0fa88b625c98', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-24 00:08:07');
INSERT INTO `s_role_menu` VALUES ('ffb36530-8fa3-4f63-a96a-f3e47ca6ab92', '257ae84e-d86a-11e6-ba64-d8490bd28593', '4bcab523-1174-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-22 12:49:27');

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
  `user_type` int(1) DEFAULT NULL COMMENT '用户类型',
  `last_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int(11) NOT NULL COMMENT '激活状态',
  `login_type` int(11) DEFAULT NULL COMMENT '登陆类型',
  `role_id` varchar(36) DEFAULT NULL COMMENT '角色ID',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`account`,`mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_users
-- ----------------------------
INSERT INTO `s_users` VALUES ('0f1443aa-eade-410d-b8bf-74ebfa914ca4', 'morgan', '6a3fd4ce78066de7876e189ab9db43a9', '波波', 'jionlandry@gmail.com', '13713666160', '0', '2017-10-18 13:30:04', '1', '1', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '2017-10-18 13:30:10', '2017-10-18 13:30:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4');
INSERT INTO `s_users` VALUES ('d56ad1f8-86a5-4e0f-a4bd-4fde333f9910', 'Alan', null, '哗哗', '2755527207@qq.com', '13713666160', '2', '2017-11-01 08:54:47', '0', '1', null, null, '2017-11-01 08:54:47', null);

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_user_info
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wechat_template
-- ----------------------------
