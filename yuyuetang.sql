/*
Navicat MySQL Data Transfer

Source Server         : 39.106.176.148
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : yuyuetang

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-05-07 22:01:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rm_article
-- ----------------------------
DROP TABLE IF EXISTS `rm_article`;
CREATE TABLE `rm_article` (
  `id` char(40) COLLATE utf8mb4_bin NOT NULL COMMENT '文章ID',
  `group_id` char(40) COLLATE utf8mb4_bin NOT NULL COMMENT '组ID',
  `title` varchar(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '文章标题',
  `cover` varchar(512) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '文章封面',
  `content` text COLLATE utf8mb4_bin NOT NULL COMMENT '文章内容',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `id` (`id`(8)),
  KEY `create_time` (`create_time`),
  KEY `group_id` (`group_id`(8)),
  FULLTEXT KEY `content` (`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='文章表';

-- ----------------------------
-- Records of rm_article
-- ----------------------------

-- ----------------------------
-- Table structure for rm_config
-- ----------------------------
DROP TABLE IF EXISTS `rm_config`;
CREATE TABLE `rm_config` (
  `key` varchar(128) COLLATE utf8mb4_bin NOT NULL COMMENT '键',
  `title` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '管理员密码',
  `value` varchar(1024) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '值',
  `group_id` char(40) COLLATE utf8mb4_bin NOT NULL COMMENT '组ID',
  `mark` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`key`),
  KEY `group_id` (`group_id`(8)) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='配置表';

-- ----------------------------
-- Records of rm_config
-- ----------------------------
INSERT INTO `rm_config` VALUES ('abstract', '公司简介', '', 'b538307d-44f5-3563-5783-c60792448230', '');
INSERT INTO `rm_config` VALUES ('address', '公司地址', '', 'b538307d-44f5-3563-5783-c60792448230', '');
INSERT INTO `rm_config` VALUES ('admin_pwd', '管理员密码', '625c7cd8ee4c55b37ee1a6fb85c0be10', 'b538307d-44f5-3563-5783-c60792448230', '(已加密,输入明文即可修改)');
INSERT INTO `rm_config` VALUES ('company_name', '公司名称', '', 'b538307d-44f5-3563-5783-c60792448230', '');
INSERT INTO `rm_config` VALUES ('email', '邮箱', '', 'b538307d-44f5-3563-5783-c60792448230', '');
INSERT INTO `rm_config` VALUES ('fax', '传真', '', 'b538307d-44f5-3563-5783-c60792448230', '');
INSERT INTO `rm_config` VALUES ('record', '备案号', '', 'b538307d-44f5-3563-5783-c60792448230', '');
INSERT INTO `rm_config` VALUES ('site_name', '网站标题', '', 'b538307d-44f5-3563-5783-c60792448230', '');
INSERT INTO `rm_config` VALUES ('syaid', '首页文章ID', '', 'b538307d-44f5-3563-5783-c60792448230', '');
INSERT INTO `rm_config` VALUES ('tel', '联系电话', '', 'b538307d-44f5-3563-5783-c60792448230', '');
INSERT INTO `rm_config` VALUES ('web_discription', 'SEO 网站描述', '', 'b538307d-44f5-3563-5783-c60792448230', '');
INSERT INTO `rm_config` VALUES ('web_keyword', 'SEO 关键词', '', 'b538307d-44f5-3563-5783-c60792448230', '');

-- ----------------------------
-- Table structure for rm_group
-- ----------------------------
DROP TABLE IF EXISTS `rm_group`;
CREATE TABLE `rm_group` (
  `id` char(40) COLLATE utf8mb4_bin NOT NULL COMMENT '分组ID',
  `pid` char(40) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '父分组ID',
  `type` enum('article','config','user','adminer') COLLATE utf8mb4_bin NOT NULL COMMENT '分类',
  `title` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `ln` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '左值',
  `rn` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '右值',
  PRIMARY KEY (`id`),
  KEY `ln` (`ln`),
  KEY `rn` (`rn`),
  KEY `pid` (`pid`(8)) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='分组表';

-- ----------------------------
-- Records of rm_group
-- ----------------------------
INSERT INTO `rm_group` VALUES ('b538307d-44f5-3563-5783-c60792448230', '', 'config', '网站设置', '13', '14');
