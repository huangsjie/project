/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : panda-wechat

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-11-20 21:09:17
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
INSERT INTO `s_menu` VALUES ('095c96ce-07e5-4c24-aebb-c743adc3562f', '3', '4bcab523-1174-11e5-a9de-000c29d7a3a0', '测试菜单添加时间', '/system/menu/add', '1', 'flaticon-xxx-1', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 11:25:08', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 11:25:08', '测试菜单添加时间');
INSERT INTO `s_menu` VALUES ('0a1e90f6-cc25-11e7-843e-24fd52935962', '5', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '角色权限', '/system/pageRole/list', '1', 'flaticon-menu', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-18 13:55:11', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-18 13:55:11', '角色权限设置');
INSERT INTO `s_menu` VALUES ('0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '1', '10000000-0000-0000-0000-000000000000', '系统管理', '/system/index/main', '1', 'flaticon-settings', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '管理');
INSERT INTO `s_menu` VALUES ('1f719c62-8993-42c0-b33d-06216a9dc3ad', '1', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', '茶园信息', '/system/origin/teaGarden', '1', 'flaticon-list-3', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 21:01:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 21:01:49', '茶园信息列表');
INSERT INTO `s_menu` VALUES ('20692517-9187-41df-920b-7c7342a93d37', '3', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '字典管理', '/system/dictionary/list', '1', 'flaticon-xxx', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-06 16:50:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:26:14', '字典信息管理');
INSERT INTO `s_menu` VALUES ('3631e59e-1175-11e5-a9de-000c29d7a3a0', '5', '10000000-0000-0000-0000-000000000000', '用户管理', '/system/ucenter/index', '1', 'flaticon-users', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '供应链管理');
INSERT INTO `s_menu` VALUES ('4bcab523-1174-11e5-a9de-000c29d7a3a0', '2', '10000000-0000-0000-0000-000000000000', '商品管理', '/system/commodity/index', '1', 'flaticon-business', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '电商平台管理');
INSERT INTO `s_menu` VALUES ('76849bfe-dfd4-476c-b2f8-11072c25ceb8', '1', 'b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '茶园管理', '/system/origin/list', '1', 'flaticon-list-3', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:41:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:52:47', '茶园信息管理');
INSERT INTO `s_menu` VALUES ('97ea6edb-1178-11e5-a9de-000c29d7a3a0', '6', '10000000-0000-0000-0000-000000000000', '财务管理', '/system/demand/index', '1', 'flaticon-coins', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '财务结算中心');
INSERT INTO `s_menu` VALUES ('b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '8', '10000000-0000-0000-0000-000000000000', '溯源管理', '/system/origin/teaGarden', '1', 'flaticon-tea-cup', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:31:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:38:43', '茶园管理模块');
INSERT INTO `s_menu` VALUES ('c3538d54-8e09-11e6-b311-005056812bf6', '3', '10000000-0000-0000-0000-000000000000', '物流管理', '/system/operation/index', '1', 'flaticon-truck', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '跨境物流管理');
INSERT INTO `s_menu` VALUES ('caf65c04-beed-11e7-959c-38d547b81379', '1', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '菜单管理', '/system/menu/list', '1', 'flaticon-app', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '菜单信息管理');
INSERT INTO `s_menu` VALUES ('d07687ef-2798-11e5-965c-000c29d7a3a0', '4', '10000000-0000-0000-0000-000000000000', '商户管理', '/system/designer/index', '1', 'flaticon-map', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '个人中心、会员中心');
INSERT INTO `s_menu` VALUES ('d942abc1-b177-452e-8c53-1914ac448c7d', '4', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '角色菜单', '/system/roleMenu/list', '1', 'flaticon-menu', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-08 17:50:28', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-08 17:53:27', '角色菜单设置');
INSERT INTO `s_menu` VALUES ('e38ab74b-bf14-11e7-a301-24fd52935962', '2', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '角色管理', '/system/roles/list', '1', 'flaticon-profile', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-01 22:56:49', '角色信息管理');
INSERT INTO `s_menu` VALUES ('fb69a533-1178-11e5-a9de-000c29d7a3a0', '7', '10000000-0000-0000-0000-000000000000', '数据管理', '/system/data/index', '1', 'flaticon-folder', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '销售数据分销');

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
INSERT INTO `s_page_role` VALUES ('04f7dbe2-75fe-4e14-b267-c7ae859c5987', 'e38ab74b-bf14-11e7-a301-24fd52935962', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:54');
INSERT INTO `s_page_role` VALUES ('0ffdc442-2544-4fe5-bbd4-5245f1f88394', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:31', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:31');
INSERT INTO `s_page_role` VALUES ('1f704ca2-0c0f-4505-accc-560ad90d7f30', 'e38ab74b-bf14-11e7-a301-24fd52935962', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:52', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:52');
INSERT INTO `s_page_role` VALUES ('31fdf877-90c4-4599-8549-a85ac0479a24', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:46');
INSERT INTO `s_page_role` VALUES ('399df380-45da-4c41-9d75-786619976847', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:19', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:19');
INSERT INTO `s_page_role` VALUES ('59846d41-a448-41b2-b156-faa194156213', '20692517-9187-41df-920b-7c7342a93d37', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:24', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:24');
INSERT INTO `s_page_role` VALUES ('613e7321-9422-40e1-8355-8239111f7199', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:21', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:21');
INSERT INTO `s_page_role` VALUES ('7291299f-1997-4207-bf14-b8237477d1aa', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:47', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:47');
INSERT INTO `s_page_role` VALUES ('805a355d-3236-4fd0-98ab-9624dc535545', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:16', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:16');
INSERT INTO `s_page_role` VALUES ('80b03523-2054-4359-955c-d69525ebbed6', 'e38ab74b-bf14-11e7-a301-24fd52935962', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:51', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:51');
INSERT INTO `s_page_role` VALUES ('8d3e106d-9af3-4683-ba0c-2596c9917d5f', 'e38ab74b-bf14-11e7-a301-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:18', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:18');
INSERT INTO `s_page_role` VALUES ('9ba3e496-4c6e-4d43-860d-1ef21b6edcfb', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:45', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:45');
INSERT INTO `s_page_role` VALUES ('b2a9c5ff-2bf0-4046-b944-7a295ffdd665', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:48', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:48');
INSERT INTO `s_page_role` VALUES ('bae8b7b5-b9f3-11e7-b0f1-38d547b81379', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-26 10:17:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-26 10:17:50');
INSERT INTO `s_page_role` VALUES ('bdbcf569-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8978edce-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:28:42', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:28:42');
INSERT INTO `s_page_role` VALUES ('c4f42f8f-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9bda9313-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:28:54', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:28:54');
INSERT INTO `s_page_role` VALUES ('c8ea16e2-79ad-42c3-b76a-883b4d4a4724', 'caf65c04-beed-11e7-959c-38d547b81379', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'c50dc6f7-b35b-4294-959e-e6e79abffc1e', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:43', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:43');
INSERT INTO `s_page_role` VALUES ('ca9b9c64-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:03', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:03');
INSERT INTO `s_page_role` VALUES ('cff06d81-8833-460c-a0d2-4386cb30fcab', '0a1e90f6-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9d590186-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:29', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:29');
INSERT INTO `s_page_role` VALUES ('d0f06bbb-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '9e15db46-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:14', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:14');
INSERT INTO `s_page_role` VALUES ('d62cbf1c-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'de46c408-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:23', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:23');
INSERT INTO `s_page_role` VALUES ('dd0eac49-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:34', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:34');
INSERT INTO `s_page_role` VALUES ('e5eb0f56-ccd9-11e7-b07e-24fd52935962', 'caf65c04-beed-11e7-959c-38d547b81379', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fea1871b-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:49', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-19 11:29:49');
INSERT INTO `s_page_role` VALUES ('e959be1c-e6aa-47c6-b96e-bad7e39b9981', 'd942abc1-b177-452e-8c53-1914ac448c7d', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'deed64de-c9c6-11e7-8126-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:26', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-20 20:26:26');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_role_menu
-- ----------------------------
INSERT INTO `s_role_menu` VALUES ('05c5cf15-9fd9-47f2-b03a-3607de630666', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'caf65c04-beed-11e7-959c-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('0f376505-c36f-42e8-81e6-21ab406ca3db', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '3631e59e-1175-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('12de943e-d491-46ec-a046-8bc63ea70620', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'c3538d54-8e09-11e6-b311-005056812bf6', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('19b7d71c-cdf3-11e7-a0af-50465deb996e', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '1f719c62-8993-42c0-b33d-06216a9dc3ad', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('29805307-37f1-407f-82e9-aa989369c2a5', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '20692517-9187-41df-920b-7c7342a93d37', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('30838a1f-cdef-11e7-a0af-50465deb996e', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'b4a121a8-5e4d-41f8-b4a0-672eebb0a74d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('32a11b3c-3b65-4cf5-bc53-4075e25f1d36', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'caf65c04-beed-11e7-959c-38d547b81379', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-18 13:51:19');
INSERT INTO `s_role_menu` VALUES ('3d2048c4-624d-4c1b-bba5-7b6884cd67b7', '0C03F6B6-8CC4-4826-8A51-149990861BE3', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-18 13:51:19');
INSERT INTO `s_role_menu` VALUES ('4c1f9175-3d08-4b7b-9f16-199e18c70df5', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'd942abc1-b177-452e-8c53-1914ac448c7d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-18 13:51:19');
INSERT INTO `s_role_menu` VALUES ('512ce723-cc25-11e7-843e-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '0a1e90f6-cc25-11e7-843e-24fd52935962', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-18 13:57:11');
INSERT INTO `s_role_menu` VALUES ('6b571011-cdf0-11e7-a0af-50465deb996e', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '76849bfe-dfd4-476c-b2f8-11072c25ceb8', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('6e179d0b-1999-4cd2-8d65-c74aeac86138', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '4bcab523-1174-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('b8b84474-02e6-4210-a5e5-e94390685099', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'e38ab74b-bf14-11e7-a301-24fd52935962', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('bd70ed16-8fc5-4f21-a2fa-4fc5f82faa80', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'd942abc1-b177-452e-8c53-1914ac448c7d', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');
INSERT INTO `s_role_menu` VALUES ('bdf1927a-e0b7-4c5e-921b-758ff46f3f19', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '97ea6edb-1178-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('be32b052-2ed3-47f4-a373-53fc004739da', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'd07687ef-2798-11e5-965c-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('c56e414b-f510-4334-b1a4-794ead9cac01', 'f8692cd2-e801-11e4-8fee-40167e64eefd', 'fb69a533-1178-11e5-a9de-000c29d7a3a0', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:13:46');
INSERT INTO `s_role_menu` VALUES ('de61ff97-67d7-4a3e-9ee2-4cf4e94d5acc', '0C03F6B6-8CC4-4826-8A51-149990861BE3', 'e38ab74b-bf14-11e7-a301-24fd52935962', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-18 13:51:19');
INSERT INTO `s_role_menu` VALUES ('dfe63cdc-5706-4e4d-97a9-3958c7d70750', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-14 17:12:13');

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
