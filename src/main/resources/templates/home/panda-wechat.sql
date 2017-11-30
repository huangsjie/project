/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : panda-wechat

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-11-30 15:03:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for e_machin_set
-- ----------------------------
DROP TABLE IF EXISTS `e_machin_set`;
CREATE TABLE `e_machin_set` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `dic_mac_type` varchar(36) NOT NULL COMMENT '加工类型',
  `dic_tea_attr` varchar(36) NOT NULL COMMENT '茶系ID',
  `dic_mac_pro` varchar(36) NOT NULL COMMENT '工序ID',
  `dic_tea_type` varchar(36) DEFAULT NULL COMMENT '材料品种（茶叶）',
  `dic_tea_gra` varchar(36) DEFAULT NULL COMMENT '等级-(目前存的是产品类型)',
  `temperature` int(3) DEFAULT NULL COMMENT '温度',
  `humidity` int(2) DEFAULT NULL COMMENT '湿度',
  `mac_loss` int(2) DEFAULT NULL COMMENT '损耗',
  `begin_duration` int(2) DEFAULT NULL COMMENT '所需时长',
  `end_duration` int(2) DEFAULT NULL COMMENT '所需时长',
  `duration_type` int(1) DEFAULT NULL COMMENT '1m分,2m时,3d天',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态 1，启用，2禁用',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
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
INSERT INTO `e_machin_set` VALUES ('54109bf4-d4c4-11e7-89ed-38d547b81379', '5382c8cc-27ad-4b2e-8842-b1d194403753', '8a3e0d08-ca66-48b7-9924-b98d98fd193d', '9fd1943d-b955-4921-a1cd-76d60126e114', '53389185-9001-44cc-8c53-83c862b6dc64', 'b1c94b1c-67e4-4e45-a516-0976fb142a81', '12', '12', '12', '1', '2', '1', '1', '加工步骤-杀青1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 13:15:35', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 13:15:35');
INSERT INTO `e_machin_set` VALUES ('55601ed9-d4c4-11e7-89ed-38d547b81379', '5382c8cc-27ad-4b2e-8842-b1d194403753', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '9ea19fba-8765-48f7-8a8a-b5ea412bda2e', 'cc32f7fc-24d6-471a-a5d5-05962737468a', 'b1c94b1c-67e4-4e45-a516-0976fb142a81', '80', '32', '8', '3', '3', '2', '1', '加工步骤-杀青2', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 13:15:37', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 13:15:37');
INSERT INTO `e_machin_set` VALUES ('577fb690-d4c4-11e7-89ed-38d547b81379', '5382c8cc-27ad-4b2e-8842-b1d194403753', 'c416d2c1-10b1-4ce7-9666-d5e18c79a584', '8aa97837-a152-49be-98b8-47a11c3b1de4', 'e9ce4ae0-2c4e-4563-9292-ee7fe182fe4e', 'b1c94b1c-67e4-4e45-a516-0976fb142a81', '90', '45', '15', '1', '2', '3', '1', '加工步骤-杀青3', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 13:15:41', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 13:15:41');
INSERT INTO `e_machin_set` VALUES ('e802bfa2-d4ae-11e7-89ed-38d547b81379', '4dc6f1b2-5bbb-4324-9d74-b318dab9e8a3', '4c23ef06-e0b5-49ae-947b-bb1ff3af9118', '16595d6b-b5f0-4b49-970d-2c26c691e66a', 'cc32f7fc-24d6-471a-a5d5-05962737468a', 'b1c94b1c-67e4-4e45-a516-0976fb142a81', '13', '69', '50', '0', '1', '2', '1', '加工步骤-杀青4', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 10:43:04', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 10:43:09');
INSERT INTO `e_machin_set` VALUES ('eff69752-7dcd-4226-a0ca-7b84d3e7430e', '4dc6f1b2-5bbb-4324-9d74-b318dab9e8a3', 'e6cd00da-fb86-45c4-a0d5-766f781eacc8', 'c307d686-7dce-4b2f-9efb-16fbeb348de6', 'cc32f7fc-24d6-471a-a5d5-05962737468a', '', '90', '8', '20', '1', '3', null, '1', '成品黑茶最后一次烘干1', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 17:04:39', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-11-29 17:04:39');
