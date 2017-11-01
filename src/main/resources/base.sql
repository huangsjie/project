/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : panda-wechat

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-11-01 10:55:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for s_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `s_dictionary`;
CREATE TABLE `s_dictionary` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '自增id',
  `sort_id` int(11) NOT NULL DEFAULT '0' COMMENT '排序id',
  `parent_id` varchar(36) NOT NULL COMMENT '父级id',
  `name` varchar(50) NOT NULL COMMENT '字典名称',
  `value` varchar(500) NOT NULL COMMENT '属性值',
  `create_id` varchar(36) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_dictionary
-- ----------------------------
INSERT INTO `s_dictionary` VALUES ('8aafb62a-b9f3-11e7-b0f1-38d547b81379', '1', '10000000-0000-0000-0000-000000000000', '新增', 'role:add', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-26 10:16:20', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-26 10:16:25', '1', '新增权限');

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
INSERT INTO `s_menu` VALUES ('0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '1', '10000000-0000-0000-0000-000000000000', '系统管理', '/system/main', '1', 'iconUser', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '管理');
INSERT INTO `s_menu` VALUES ('3631e59e-1175-11e5-a9de-000c29d7a3a0', '5', '10000000-0000-0000-0000-000000000000', '用户管理', '/system/index', '1', 'icoDateRem', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '供应链管理');
INSERT INTO `s_menu` VALUES ('4bcab523-1174-11e5-a9de-000c29d7a3a0', '2', '10000000-0000-0000-0000-000000000000', '商品管理', '/system/commodity/index', '1', 'icobackup', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '电商平台管理');
INSERT INTO `s_menu` VALUES ('97ea6edb-1178-11e5-a9de-000c29d7a3a0', '6', '10000000-0000-0000-0000-000000000000', '财务管理', '/system/demand/index', '1', 'icoColor', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '财务结算中心');
INSERT INTO `s_menu` VALUES ('c3538d54-8e09-11e6-b311-005056812bf6', '3', '10000000-0000-0000-0000-000000000000', '物流管理', '/system/operation/index', '1', 'icoColor', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '跨境物流管理');
INSERT INTO `s_menu` VALUES ('d07687ef-2798-11e5-965c-000c29d7a3a0', '4', '10000000-0000-0000-0000-000000000000', '商户管理', '/system/designer/index', '1', 'icoColor', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '个人中心、会员中心');
INSERT INTO `s_menu` VALUES ('fb69a533-1178-11e5-a9de-000c29d7a3a0', '7', '10000000-0000-0000-0000-000000000000', '数据管理', '/system/data/index', '1', 'icoClcont', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:38:06', '销售数据分销');

-- ----------------------------
-- Table structure for s_page_role
-- ----------------------------
DROP TABLE IF EXISTS `s_page_role`;
CREATE TABLE `s_page_role` (
  `id` varchar(36) NOT NULL,
  `menu_id` varchar(36) DEFAULT NULL COMMENT '菜单编号',
  `role_id` varchar(36) DEFAULT NULL COMMENT '角色编号',
  `dict_id` varchar(36) DEFAULT NULL COMMENT '字典编号',
  `create_id` varchar(36) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '最后一次修改ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_page_role
-- ----------------------------
INSERT INTO `s_page_role` VALUES ('bae8b7b5-b9f3-11e7-b0f1-38d547b81379', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '8aafb62a-b9f3-11e7-b0f1-38d547b81379', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-26 10:17:46', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-26 10:17:50');

-- ----------------------------
-- Table structure for s_roles
-- ----------------------------
DROP TABLE IF EXISTS `s_roles`;
CREATE TABLE `s_roles` (
  `id` varchar(36) NOT NULL COMMENT '角色id',
  `name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(500) DEFAULT NULL COMMENT '角色描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` varchar(36) DEFAULT NULL COMMENT '创建人ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_id` varchar(36) DEFAULT NULL COMMENT '修改人ID',
  `type` int(11) DEFAULT NULL COMMENT '角色类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_roles
-- ----------------------------
INSERT INTO `s_roles` VALUES ('0C03F6B6-8CC4-4826-8A51-149990861BE3', '系统工程师', '系统工程师', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '1');
INSERT INTO `s_roles` VALUES ('257ae84e-d86a-11e6-ba64-d8490bd28593', '管理员', '管理员', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '1');
INSERT INTO `s_roles` VALUES ('661de1cc-3c07-11e5-9c2d-000c29d7a3a0', '普通用户', '普通用户', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '1');
INSERT INTO `s_roles` VALUES ('f8692cd2-e801-11e4-8fee-40167e64eefd', '系统管理员', '系统管理员', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:32:12', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '1');

-- ----------------------------
-- Table structure for s_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `s_role_menu`;
CREATE TABLE `s_role_menu` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL COMMENT '角色ID',
  `menu_id` varchar(36) NOT NULL COMMENT '菜单ID',
  `create_id` varchar(36) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_role_menu
-- ----------------------------
INSERT INTO `s_role_menu` VALUES ('1b84ca00-b643-11e7-9591-24fd52935962', 'f8692cd2-e801-11e4-8fee-40167e64eefd', '0B6D1F77-BAEC-4CFA-8D19-E1C4ECE995B9', '0f1443aa-eade-410d-b8bf-74ebfa914ca4', '2017-10-21 17:35:21');

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
