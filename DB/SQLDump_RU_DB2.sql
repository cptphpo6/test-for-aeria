# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# Database: dev_monster_real2_ru_RU
# Generation Time: 2014-12-09 13:22:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table access_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access_log`;

CREATE TABLE `access_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'アクセスログID',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '記録日時',
  `uid` int(11) unsigned DEFAULT NULL COMMENT 'ユーザーID',
  `path` text COMMENT 'URL 中のパス',
  `parameters` text COMMENT '$_GET, $_POST の値',
  `is_imported` tinyint(4) DEFAULT '0' COMMENT 'インポートしたレコードか？',
  PRIMARY KEY (`id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='アクセスログ\n- パーティショニングすること\n'
/*!50100 PARTITION BY RANGE (UNIX_TIMESTAMP(time))
(PARTITION p20130711 VALUES LESS THAN (1373526000) ENGINE = InnoDB,
 PARTITION p20130712 VALUES LESS THAN (1373612400) ENGINE = InnoDB,
 PARTITION p20130713 VALUES LESS THAN (1373698800) ENGINE = InnoDB,
 PARTITION p20130714 VALUES LESS THAN (1373785200) ENGINE = InnoDB,
 PARTITION p20130715 VALUES LESS THAN (1373871600) ENGINE = InnoDB,
 PARTITION p20130716 VALUES LESS THAN (1373958000) ENGINE = InnoDB,
 PARTITION p20130717 VALUES LESS THAN (1374044400) ENGINE = InnoDB,
 PARTITION p20130718 VALUES LESS THAN (1374130800) ENGINE = InnoDB,
 PARTITION p20130719 VALUES LESS THAN (1374217200) ENGINE = InnoDB,
 PARTITION p20141203 VALUES LESS THAN (1417550400) ENGINE = InnoDB,
 PARTITION p20141204 VALUES LESS THAN (1417636800) ENGINE = InnoDB,
 PARTITION p20141205 VALUES LESS THAN (1417723200) ENGINE = InnoDB,
 PARTITION p20141206 VALUES LESS THAN (1417809600) ENGINE = InnoDB,
 PARTITION p20141207 VALUES LESS THAN (1417896000) ENGINE = InnoDB,
 PARTITION p20141208 VALUES LESS THAN (1417982400) ENGINE = InnoDB,
 PARTITION p20141209 VALUES LESS THAN (1418068800) ENGINE = InnoDB,
 PARTITION p20141210 VALUES LESS THAN (1418155200) ENGINE = InnoDB,
 PARTITION p20141211 VALUES LESS THAN (1418241600) ENGINE = InnoDB) */;



# Dump of table admin_ban_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_ban_log`;

CREATE TABLE `admin_ban_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `comment` varchar(128) NOT NULL,
  `admin` varchar(64) NOT NULL,
  `banned_on` datetime DEFAULT NULL,
  `banned_days` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table admin_change_name_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_change_name_log`;

CREATE TABLE `admin_change_name_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `admin` varchar(64) NOT NULL,
  `update_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table admin_notification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_notification`;

CREATE TABLE `admin_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `message` varchar(256) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table admin_unban_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_unban_log`;

CREATE TABLE `admin_unban_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `admin` varchar(64) NOT NULL,
  `unbanned_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table admin_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user`;

CREATE TABLE `admin_user` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `password` varchar(512) NOT NULL,
  `role` varchar(128) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table admin_user_inventory_delete_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user_inventory_delete_log`;

CREATE TABLE `admin_user_inventory_delete_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `item_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1: immortals, 2: item',
  `target_id` int(11) NOT NULL,
  `target_name` varchar(255) NOT NULL,
  `amt_before` int(11) NOT NULL DEFAULT '1',
  `amt_after` int(11) NOT NULL DEFAULT '0',
  `admin` varchar(64) NOT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_type` (`item_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table amazon_sales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `amazon_sales`;

CREATE TABLE `amazon_sales` (
  `sales_data_id` bigint(16) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `uid` int(11) NOT NULL COMMENT 'ユーザーID',
  `amazon_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `purchase_token` varchar(1024) NOT NULL DEFAULT '',
  `coin` mediumint(5) NOT NULL,
  `insert_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sales_data_id`),
  KEY `t_common_id` (`amazon_id`),
  KEY `uid` (`uid`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table bbs_all_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bbs_all_data`;

CREATE TABLE `bbs_all_data` (
  `t_bbs_all_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ゲーム内ケージ版スレッドID',
  `uid` int(10) unsigned NOT NULL COMMENT 'スレ主ユーザID',
  `name` varchar(255) DEFAULT NULL COMMENT 'スレ主ユーザ名',
  `bbs_type` tinyint(4) DEFAULT NULL COMMENT '掲示板タイプ\n1：雑談\n2：攻略',
  `title` varchar(255) DEFAULT NULL COMMENT 'タイトル',
  `comment` varchar(255) DEFAULT NULL COMMENT 'コメント。',
  `res_count` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'レス数',
  `lock_flag` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `stick_flag` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `insert_date` datetime NOT NULL COMMENT 'システム登録日',
  `update_date` datetime NOT NULL COMMENT 'システムデータ更新日',
  `delete_date` datetime DEFAULT NULL COMMENT 'システムデータ削除日',
  `delete_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'システムデータ削除フラグ\n0:削除してない\n1:削除',
  PRIMARY KEY (`t_bbs_all_id`),
  KEY `uid` (`uid`),
  KEY `bbs_type` (`bbs_type`,`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ゲーム内掲示板スレッドID';



# Dump of table bbs_all_reply_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bbs_all_reply_data`;

CREATE TABLE `bbs_all_reply_data` (
  `t_bbs_all_reply_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '掲示板レスID',
  `t_bbs_all_id` bigint(20) unsigned NOT NULL COMMENT 'ゲーム内掲示板スレッドID',
  `uid` int(10) unsigned NOT NULL COMMENT 'レス書いたユーザID',
  `name` varchar(255) DEFAULT NULL COMMENT 'レス書いたユーザ名',
  `insert_date` datetime NOT NULL COMMENT 'システム登録日',
  `update_date` datetime NOT NULL COMMENT 'システムデータ更新日',
  `delete_date` datetime DEFAULT NULL COMMENT 'システムデータ削除日',
  `delete_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'システムデータ削除フラグ\n0:削除してない\n1:削除',
  `comment` varchar(500) DEFAULT NULL COMMENT 'コメント。',
  PRIMARY KEY (`t_bbs_all_reply_id`),
  KEY `t_bbs_all_id` (`t_bbs_all_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ゲーム内掲示板レス';



# Dump of table bonus_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bonus_data`;

CREATE TABLE `bonus_data` (
  `bonus_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bonus_mst_id` int(10) unsigned NOT NULL,
  `bonus_type` int(10) unsigned NOT NULL,
  `bonus_amount` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `insert_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`bonus_data_id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table bonus_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bonus_mst`;

CREATE TABLE `bonus_mst` (
  `bonus_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bonus_type` int(10) unsigned NOT NULL,
  `bonus_amount` int(10) unsigned NOT NULL,
  `bonus_duration` int(10) unsigned NOT NULL,
  `insert_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`bonus_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table campaign_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_code`;

CREATE TABLE `campaign_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `code` varchar(512) NOT NULL,
  `used` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table card_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `card_data`;

CREATE TABLE `card_data` (
  `card_data_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'カードID',
  `card_mst_id` int(10) unsigned NOT NULL COMMENT 'カードマスタID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `attack` int(10) unsigned NOT NULL COMMENT '攻撃力',
  `defense` int(10) unsigned NOT NULL COMMENT '防御力',
  `offset_max_attack` int(10) unsigned NOT NULL COMMENT '最大攻撃力の加算値',
  `offset_max_defense` int(10) unsigned NOT NULL COMMENT '最大防御力の加算値',
  `create_date` datetime NOT NULL COMMENT '作成日',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `card_level` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'カードレベル',
  `card_exp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'カード経験値',
  `card_levelup_exp` int(11) NOT NULL COMMENT 'レベルアップまでの経験値',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状態',
  `evolution_card_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '進化後ID',
  `evol_level` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '進化度',
  `evol_material_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '進化素材ID',
  `protect` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '保護状態',
  `uphill_attack` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '攻撃力上がり度数',
  `uphill_defense` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '防御力上がり度数',
  PRIMARY KEY (`card_data_id`,`status`),
  KEY `attack` (`attack`),
  KEY `defense` (`defense`),
  KEY `create_date` (`create_date`),
  KEY `release_date` (`update_date`),
  KEY `evol_material_id` (`evol_material_id`),
  KEY `uid` (`uid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='使用中カードデータ'
/*!50100 PARTITION BY LIST (`status`)
(PARTITION pOwned VALUES IN (0) ENGINE = InnoDB,
 PARTITION pDedicated VALUES IN (1) ENGINE = InnoDB,
 PARTITION pSold VALUES IN (2) ENGINE = InnoDB,
 PARTITION pSent VALUES IN (3) ENGINE = InnoDB,
 PARTITION pTrading VALUES IN (4) ENGINE = InnoDB,
 PARTITION pTraded VALUES IN (5) ENGINE = InnoDB,
 PARTITION pEvolved VALUES IN (6) ENGINE = InnoDB,
 PARTITION pGrew VALUES IN (7) ENGINE = InnoDB,
 PARTITION pRecycle VALUES IN (101) ENGINE = InnoDB) */;



# Dump of table card_evol_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `card_evol_log`;

CREATE TABLE `card_evol_log` (
  `evol_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '進化ログID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `evol_card_data_id` bigint(20) unsigned NOT NULL COMMENT '進化ベースカードID',
  `evol_card_mst_id` int(10) unsigned NOT NULL COMMENT '進化ベースマスタID',
  `evol_img` varchar(50) NOT NULL COMMENT '進化ベース画像',
  `material_card_data_id` bigint(20) unsigned NOT NULL COMMENT '素材カードID',
  `material_card_mst_id` int(10) unsigned NOT NULL COMMENT '素材カードマスタID',
  `material_img` varchar(50) NOT NULL COMMENT '素材カード画像',
  `new_card_data_id` bigint(20) unsigned NOT NULL COMMENT '進化後カードＩＤ',
  `new_card_mst_id` int(10) unsigned NOT NULL COMMENT '進化後マスタＩＤ',
  `new_img` varchar(50) NOT NULL COMMENT '進化後カード画像',
  `evol_attack_succeed` int(10) unsigned NOT NULL COMMENT 'ベースカード攻撃継承値',
  `evol_defense_succeed` int(10) unsigned NOT NULL COMMENT 'ベースカード防御継承値',
  `material_attack_succeed` int(10) unsigned NOT NULL COMMENT '素材カード攻撃継承値',
  `material_defense_succeed` int(10) unsigned NOT NULL COMMENT '素材カード防御継承値',
  `new_default_attack` int(10) unsigned NOT NULL COMMENT '進化後攻撃力',
  `new_default_defense` int(10) unsigned NOT NULL COMMENT '進化後防御力',
  `cost_money` int(10) unsigned NOT NULL COMMENT '進化金額',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '実行日時',
  `new_evol_level` tinyint(1) unsigned NOT NULL COMMENT '新進化度（旧カード進化度+1）',
  `new_card_evol_level` tinyint(1) unsigned NOT NULL COMMENT '新カードの進化度',
  `offset_max_attack` int(10) unsigned NOT NULL COMMENT '最大攻撃力の加算値',
  `offset_max_defense` int(10) unsigned NOT NULL COMMENT '最大防御力の加算値',
  `b_state_max` tinyint(10) unsigned NOT NULL COMMENT 'ステータスMAX合成？',
  `b_lv_max` tinyint(10) unsigned NOT NULL COMMENT 'レベルMAX合成？',
  `skill_succession` varchar(255) NOT NULL COMMENT 'スキル継承',
  `evol_has_skill_data_ids` varchar(255) NOT NULL COMMENT '進化ベースが持っていたスキルデータID',
  PRIMARY KEY (`evol_log_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='カード進化ログ';



# Dump of table card_merg_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `card_merg_config`;

CREATE TABLE `card_merg_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `merg_per` float DEFAULT '0',
  `disp_merg_per` float DEFAULT '0',
  `updated_by` varchar(128) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table card_merg_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `card_merg_log`;

CREATE TABLE `card_merg_log` (
  `merg_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '合成ログＩＤ',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザＩＤ',
  `card_data_id` bigint(20) unsigned NOT NULL COMMENT 'ベースカードデータＩＤ',
  `card_mst_id` int(10) unsigned NOT NULL COMMENT 'ベースカードマスタＩＤ',
  `name` varchar(50) NOT NULL COMMENT 'ベースカード名',
  `img` varchar(50) NOT NULL COMMENT 'ベースカード画像',
  `before_exp_persent` int(10) NOT NULL COMMENT '強化前経験値（％）',
  `after_exp_persent` int(10) NOT NULL COMMENT '強化後経験値（％）',
  `before_exp` int(10) NOT NULL COMMENT '強化前経験値',
  `after_exp` int(10) NOT NULL COMMENT '強化後経験値',
  `before_level` int(10) unsigned NOT NULL COMMENT '強化前レベル',
  `after_level` int(10) unsigned NOT NULL COMMENT '強化後レベル',
  `before_attack` int(10) unsigned NOT NULL COMMENT '強化前攻撃力',
  `after_attack` int(10) unsigned NOT NULL COMMENT '強化後攻撃力',
  `before_defense` int(10) unsigned NOT NULL COMMENT '強化前防御力',
  `after_defense` int(10) unsigned NOT NULL COMMENT '強化後防御力',
  `material_count` int(10) unsigned NOT NULL COMMENT '素材カード数',
  `exceed_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '大成功した？',
  `material_card_data_ids` varchar(255) NOT NULL COMMENT '素材カードデータＩＤ',
  `material_card_mst_ids` varchar(255) NOT NULL COMMENT '素材カードマスタＩＤ',
  `material_card_imgs` varchar(255) NOT NULL COMMENT '素材カード画像',
  `material_exps` varchar(255) NOT NULL COMMENT '素材カード経験値',
  `up_level` int(10) NOT NULL COMMENT 'レベルアップ数',
  `cost_money` int(10) unsigned NOT NULL COMMENT '強化費用',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '実行日時',
  PRIMARY KEY (`merg_log_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='カード合成ログ';



# Dump of table card_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `card_mst`;

CREATE TABLE `card_mst` (
  `card_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `attribute` tinyint(1) DEFAULT NULL,
  `max_level` tinyint(3) DEFAULT NULL,
  `rarity` tinyint(1) DEFAULT NULL,
  `max_attack` int(10) DEFAULT NULL,
  `max_defense` int(10) DEFAULT NULL,
  `default_attack` int(10) DEFAULT NULL,
  `default_defense` int(10) DEFAULT NULL,
  `default_sell_price` int(10) DEFAULT NULL,
  `statement` varchar(255) DEFAULT NULL,
  `evolution_card_id` int(10) DEFAULT NULL,
  `evol_material_id` int(10) DEFAULT NULL,
  `evol_level` tinyint(1) DEFAULT NULL,
  `mp` int(10) DEFAULT NULL,
  `deck_cost` int(10) DEFAULT NULL,
  `max_discharge_num` bigint(20) DEFAULT NULL,
  `can_trade` tinyint(1) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`card_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table card_sell_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `card_sell_log`;

CREATE TABLE `card_sell_log` (
  `sell_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'カード売却ログID',
  `uid` int(10) NOT NULL COMMENT 'ユーザID',
  `card_data_ids` varchar(255) NOT NULL COMMENT 'カードデータID',
  `card_mst_ids` varchar(255) NOT NULL COMMENT 'カードマスタID',
  `moneys` varchar(255) NOT NULL COMMENT '売却金額',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '売却時間',
  PRIMARY KEY (`sell_log_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='カード売却ログ';



# Dump of table card_skill_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `card_skill_mst`;

CREATE TABLE `card_skill_mst` (
  `card_skill_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'スキル予約ID',
  `skill_mst_id` int(10) unsigned NOT NULL COMMENT 'スキルマスタID',
  `same_card_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '同種類のカードタイプ(固定スキル用)',
  `card_mst_id` int(10) unsigned NOT NULL COMMENT 'カードマスタID',
  PRIMARY KEY (`card_skill_mst_id`),
  UNIQUE KEY `card_mst_id` (`card_mst_id`),
  KEY `skill_mst_id` (`skill_mst_id`,`card_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='カードとスキルの対応表';



# Dump of table card_warehouse_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `card_warehouse_data`;

CREATE TABLE `card_warehouse_data` (
  `card_warehouse_data_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'カード在庫管理ID',
  `card_mst_id` int(10) unsigned NOT NULL COMMENT 'カードマスタID',
  `discharge_num` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '放出量',
  `discharge_num_active` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'for 30 day active users',
  `create_date` datetime NOT NULL COMMENT '作成日',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `total_discharge_num` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '総放出量',
  PRIMARY KEY (`card_warehouse_data_id`),
  UNIQUE KEY `card_mst_id_UNIQUE` (`card_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='カード在庫管理データ';



# Dump of table cms_landing_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_landing_pages`;

CREATE TABLE `cms_landing_pages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `landing_backlink_url_id` int(10) NOT NULL,
  `landing_img_url` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `button_backlink_url_id` int(10) NOT NULL,
  `button_img_url` varchar(255) NOT NULL,
  `updated_by` varchar(64) NOT NULL,
  `background_img` varchar(255) DEFAULT NULL,
  `background_img_iphone5` varchar(512) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table crystal_recycle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `crystal_recycle`;

CREATE TABLE `crystal_recycle` (
  `rarity` tinyint(1) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  `crystals0` int(10) NOT NULL DEFAULT '0',
  `percentage0` int(10) NOT NULL DEFAULT '0',
  `crystals1` int(10) NOT NULL DEFAULT '0',
  `percentage1` int(10) NOT NULL DEFAULT '0',
  `crystals2` int(10) NOT NULL DEFAULT '0',
  `percentage2` int(10) NOT NULL DEFAULT '0',
  `crystals3` int(10) NOT NULL DEFAULT '0',
  `percentage3` int(10) NOT NULL DEFAULT '0',
  `crystals4` int(10) NOT NULL DEFAULT '0',
  `percentage4` int(10) NOT NULL DEFAULT '0',
  `crystals5` int(10) NOT NULL DEFAULT '0',
  `percentage5` int(10) NOT NULL DEFAULT '0',
  `crystals6` int(10) NOT NULL DEFAULT '0',
  `percentage6` int(10) NOT NULL DEFAULT '0',
  `crystals7` int(10) NOT NULL DEFAULT '0',
  `percentage7` int(10) NOT NULL DEFAULT '0',
  `crystals8` int(10) NOT NULL DEFAULT '0',
  `percentage8` int(10) NOT NULL DEFAULT '0',
  `crystals9` int(10) NOT NULL DEFAULT '0',
  `percentage9` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cvc_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cvc_event`;

CREATE TABLE `cvc_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `title_img` varchar(512) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `present_receive_limit` varchar(64) NOT NULL,
  `card_name` varchar(128) NOT NULL,
  `card_img` varchar(512) DEFAULT NULL,
  `point_list` text NOT NULL,
  `ranking_present_title` varchar(256) NOT NULL,
  `ranking_list` text NOT NULL,
  `rank_reward_img` varchar(512) DEFAULT NULL,
  `updated_by` varchar(128) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table error_js_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `error_js_log`;

CREATE TABLE `error_js_log` (
  `error_js_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'エラーログID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `error_msg` varchar(255) DEFAULT NULL COMMENT 'エラーメッセージ',
  `error_file` varchar(255) DEFAULT NULL COMMENT 'エラーファイル名',
  `error_no` varchar(255) DEFAULT NULL COMMENT 'エラー行数',
  `url` varchar(255) DEFAULT NULL COMMENT 'document.url',
  `referrer` varchar(255) DEFAULT NULL COMMENT 'document.referrer',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`error_js_log_id`,`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='javascript エラーログ'
/*!50100 PARTITION BY RANGE (UNIX_TIMESTAMP(create_date))
(PARTITION p20130417 VALUES LESS THAN (1366124400) ENGINE = InnoDB,
 PARTITION p20130418 VALUES LESS THAN (1366210800) ENGINE = InnoDB,
 PARTITION p20130419 VALUES LESS THAN (1366297200) ENGINE = InnoDB,
 PARTITION p20130420 VALUES LESS THAN (1366383600) ENGINE = InnoDB,
 PARTITION p20130711 VALUES LESS THAN (1373526000) ENGINE = InnoDB,
 PARTITION p20130712 VALUES LESS THAN (1373612400) ENGINE = InnoDB,
 PARTITION p20130713 VALUES LESS THAN (1373698800) ENGINE = InnoDB,
 PARTITION p20130714 VALUES LESS THAN (1373785200) ENGINE = InnoDB,
 PARTITION p20130715 VALUES LESS THAN (1373871600) ENGINE = InnoDB,
 PARTITION p20130716 VALUES LESS THAN (1373958000) ENGINE = InnoDB,
 PARTITION p20130717 VALUES LESS THAN (1374044400) ENGINE = InnoDB,
 PARTITION p20130718 VALUES LESS THAN (1374130800) ENGINE = InnoDB,
 PARTITION p20130719 VALUES LESS THAN (1374217200) ENGINE = InnoDB,
 PARTITION p20141203 VALUES LESS THAN (1417550400) ENGINE = InnoDB,
 PARTITION p20141204 VALUES LESS THAN (1417636800) ENGINE = InnoDB,
 PARTITION p20141205 VALUES LESS THAN (1417723200) ENGINE = InnoDB,
 PARTITION p20141206 VALUES LESS THAN (1417809600) ENGINE = InnoDB,
 PARTITION p20141207 VALUES LESS THAN (1417896000) ENGINE = InnoDB,
 PARTITION p20141208 VALUES LESS THAN (1417982400) ENGINE = InnoDB,
 PARTITION p20141209 VALUES LESS THAN (1418068800) ENGINE = InnoDB,
 PARTITION p20141210 VALUES LESS THAN (1418155200) ENGINE = InnoDB,
 PARTITION p20141211 VALUES LESS THAN (1418241600) ENGINE = InnoDB) */;



# Dump of table friend_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `friend_list`;

CREATE TABLE `friend_list` (
  `uid` int(10) unsigned NOT NULL COMMENT 'userID',
  `friend_uid` int(10) unsigned NOT NULL COMMENT 'フレンドのuserID',
  `valid` tinyint(1) NOT NULL COMMENT '有効フラグ',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`,`friend_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='フレンドリスト';



# Dump of table friend_list_pending
# ------------------------------------------------------------

DROP TABLE IF EXISTS `friend_list_pending`;

CREATE TABLE `friend_list_pending` (
  `uid` int(10) unsigned NOT NULL COMMENT 'the person who initiates the friending and whose name will show up in friend_uid''s notification list',
  `friend_uid` int(10) unsigned NOT NULL COMMENT 'id of the player to be friended, who will have the notification pop up for',
  `ignore_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'flag is 1 if the friend_uid wants to ignore notification from uid in the pending friends page (so that it never shows up again in the future until they unignore)',
  `view_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'flag if the notification page has been viewed with this row entry',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`uid`,`friend_uid`),
  KEY `index_friend_uid` (`friend_uid`,`ignore_flag`,`view_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gacha_box_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_box_config`;

CREATE TABLE `gacha_box_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `background_img` varchar(512) DEFAULT NULL,
  `background_img_iphone5` varchar(512) DEFAULT NULL,
  `landing_img` varchar(512) DEFAULT NULL,
  `guide_landing_img` varchar(512) DEFAULT NULL,
  `box_card` int(11) NOT NULL DEFAULT '1',
  `ticket` varchar(90) DEFAULT NULL,
  `card_num` int(11) NOT NULL DEFAULT '1',
  `category_id` int(11) NOT NULL,
  `effect_id` int(11) NOT NULL DEFAULT '2',
  `available_reset_rarity` int(11) NOT NULL DEFAULT '60',
  `use_landing_html` text,
  `updated_by` varchar(128) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table gacha_box_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_box_mst`;

CREATE TABLE `gacha_box_mst` (
  `gacha_box_mst_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ボックスガチャマスタID',
  `gacha_category_id` int(10) unsigned NOT NULL COMMENT 'ガチャカテゴリID',
  `card_mst_id` int(10) unsigned NOT NULL COMMENT 'カードマスタID',
  `discharge_num` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '放出量',
  `card_lot` float NOT NULL COMMENT '出現確率',
  `create_date` datetime NOT NULL COMMENT '作成日',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`gacha_box_mst_id`),
  KEY `gacha_category_id` (`gacha_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ボックスガチャ用マスタ';



# Dump of table gacha_box_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_box_user_data`;

CREATE TABLE `gacha_box_user_data` (
  `gacha_box_user_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ボックス ガチャ用ユーザデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `type` varchar(45) NOT NULL COMMENT 'ガチャタイプ',
  `box_number` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'ユーザーのボックス内で割り当てられる通し番号',
  `card_list` text COMMENT 'ボックスのカード状態 jsonエンコードされた文字列',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'ボックスの状態フラグ',
  `create_date` datetime NOT NULL COMMENT '作成日',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`gacha_box_user_data_id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`,`type`,`box_number`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ボックス ガチャ用ユーザデータ';



# Dump of table gacha_box_user_data_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_box_user_data_log`;

CREATE TABLE `gacha_box_user_data_log` (
  `gacha_box_user_data_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ボックス ガチャ ユーザログデータID',
  `gacha_log_id` int(10) unsigned NOT NULL COMMENT 'ガチャログID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `type` varchar(45) NOT NULL COMMENT 'ガチャタイプ',
  `box_number` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'ユーザーのボックス内で割り当てられる通し番号',
  `card_mst_id` int(10) unsigned NOT NULL,
  `create_date` datetime NOT NULL COMMENT '作成日',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`gacha_box_user_data_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ボックス ガチャ用ユーザデータ ログ';



# Dump of table gacha_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_config`;

CREATE TABLE `gacha_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(64) NOT NULL COMMENT 'one_day|lunchtime|dinnertime|normal|rare1|rare2|rare2_1st',
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `time_once` varchar(64) DEFAULT '' COMMENT 'one_day_update_time|lunchtime_update_time|dinner_update_time',
  `open_time` varchar(64) DEFAULT '',
  `close_time` varchar(64) DEFAULT '',
  `purchase_money` int(11) DEFAULT '0',
  `ticket` varchar(64) DEFAULT '' COMMENT 'rare_1:1',
  `enable_count` int(11) DEFAULT '0',
  `card_num` int(11) NOT NULL DEFAULT '1',
  `many_max` int(11) DEFAULT '0',
  `miss_count` varchar(64) DEFAULT '' COMMENT 'rare_miss_count:10',
  `user_attr_per` int(11) DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `gacha_point` int(11) DEFAULT '0',
  `lot` varchar(64) NOT NULL COMMENT '30:89,40:9.7,50:1.1,60:0.2',
  `special_card` varchar(128) DEFAULT '' COMMENT '30:130017:80,30:612:15,50:230018:85',
  `card_mst_list` varchar(128) DEFAULT '' COMMENT '250007,350006,130022',
  `overwrite` int(11) NOT NULL DEFAULT '1',
  `banner_img` varchar(512) DEFAULT NULL,
  `updated_by` varchar(128) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table gacha_count_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_count_event`;

CREATE TABLE `gacha_count_event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `r` int(11) DEFAULT NULL,
  `hr` int(11) DEFAULT NULL,
  `sr` int(11) DEFAULT NULL,
  `mr` int(11) DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gacha_distribution_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_distribution_log`;

CREATE TABLE `gacha_distribution_log` (
  `gacha_distribution_data_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ガチャ分布データID',
  `type` varchar(45) NOT NULL COMMENT 'ガチャタイプ',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  `rarity_0` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'レアリティ1排出数',
  `rarity_10` int(10) unsigned NOT NULL DEFAULT '0',
  `rarity_20` int(10) unsigned NOT NULL DEFAULT '0',
  `rarity_30` int(10) unsigned NOT NULL DEFAULT '0',
  `rarity_40` int(10) unsigned NOT NULL DEFAULT '0',
  `rarity_50` int(10) unsigned NOT NULL DEFAULT '0',
  `rarity_60` int(10) unsigned NOT NULL DEFAULT '0',
  `rarity_70` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gacha_distribution_data_id`),
  UNIQUE KEY `type_UNIQUE` (`type`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ガチャ抽選分布';



# Dump of table gacha_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_event`;

CREATE TABLE `gacha_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL DEFAULT '',
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `background_img` varchar(512) DEFAULT NULL,
  `background_img_iphone5` varchar(512) DEFAULT NULL,
  `logo_img` varchar(512) DEFAULT NULL,
  `info_msg` varchar(128) NOT NULL,
  `landing_img` varchar(1024) DEFAULT NULL,
  `guide_landing_img` varchar(512) DEFAULT NULL,
  `reward_header_img` varchar(512) DEFAULT NULL,
  `note` varchar(1024) NOT NULL,
  `login_bonus_comment` varchar(128) DEFAULT NULL,
  `login_bonus_list` varchar(128) DEFAULT NULL,
  `11ren_summons_bonus_comment` varchar(128) DEFAULT NULL,
  `11ren_summons_bonus_list` varchar(128) DEFAULT NULL,
  `box_type0` varchar(512) NOT NULL,
  `box_type1` varchar(512) NOT NULL,
  `box_type2` varchar(512) NOT NULL,
  `break_box_bonus` varchar(32) DEFAULT '0',
  `break_box_bonus_item` varchar(32) NOT NULL DEFAULT '0',
  `updated_by` varchar(128) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gacha_hit_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_hit_log`;

CREATE TABLE `gacha_hit_log` (
  `gacha_hit_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ログID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `rarity` tinyint(1) unsigned NOT NULL COMMENT 'カードレアリティ',
  `user_name` varchar(255) NOT NULL COMMENT 'ユーザ名',
  `card_name` varchar(50) NOT NULL COMMENT 'カード名',
  `card_img` varchar(50) NOT NULL COMMENT 'カード画像\n',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  PRIMARY KEY (`gacha_hit_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ガチャ当選ログ';



# Dump of table gacha_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_log`;

CREATE TABLE `gacha_log` (
  `gacha_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ガチャログID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `type` varchar(45) NOT NULL COMMENT 'ガチャタイプ',
  `card_mst_id` varchar(255) NOT NULL COMMENT '当選カードマスタIDリスト',
  `card_data_id` varchar(255) NOT NULL COMMENT '獲得カードデータIDリスト',
  `error_id` int(10) DEFAULT NULL COMMENT 'エラーID　エラーが発生した場合に エラーIDが入ります',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  PRIMARY KEY (`gacha_log_id`),
  KEY `uid` (`uid`,`gacha_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ガチャログ';



# Dump of table gacha_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_mst`;

CREATE TABLE `gacha_mst` (
  `gacha_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ガチャマスタID',
  `gacha_category_id` int(10) unsigned NOT NULL COMMENT 'ガチャカテゴリID',
  `card_mst_id` int(10) unsigned NOT NULL COMMENT 'カードマスタID',
  PRIMARY KEY (`gacha_mst_id`),
  KEY `gacha_category_id` (`gacha_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ガチャマスタ';



# Dump of table gacha_mst_name
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_mst_name`;

CREATE TABLE `gacha_mst_name` (
  `gacha_mst_name_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gacha_mst_name` varchar(255) NOT NULL,
  `gacha_category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`gacha_mst_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gacha_multi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_multi`;

CREATE TABLE `gacha_multi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET latin1 NOT NULL,
  `header_img` varchar(256) CHARACTER SET latin1 NOT NULL,
  `button_img` varchar(256) CHARACTER SET latin1 NOT NULL,
  `button_img_ticket` varchar(256) NOT NULL,
  `landing_img` varchar(2048) CHARACTER SET latin1 DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `firsttime_start` datetime NOT NULL,
  `firsttime_end` datetime NOT NULL,
  `firsttime_img` varchar(2048) DEFAULT NULL,
  `purchase_money` int(11) NOT NULL DEFAULT '3000',
  `card_num` int(11) NOT NULL DEFAULT '11',
  `miss_count_key` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT 'rare_miss_count',
  `miss_count_num` int(11) NOT NULL DEFAULT '10',
  `rarity_min` int(11) DEFAULT '0',
  `user_attr_per` int(11) NOT NULL DEFAULT '30',
  `category_id` int(11) NOT NULL DEFAULT '2',
  `can_use_ticket` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bonus_present_flag` int(1) NOT NULL DEFAULT '0',
  `bonus_present_comment` varchar(128) NOT NULL DEFAULT '11x Conjure Presents.',
  `bonus_present_virtual_money` int(11) NOT NULL,
  `bonus_present_gacha_point` int(11) NOT NULL,
  `bonus_present_card` varchar(256) NOT NULL,
  `bonus_present_item` varchar(256) NOT NULL,
  `bonus_present_display` varchar(64) NOT NULL,
  `present_comment` varchar(128) NOT NULL DEFAULT '11 Заклинаний представляют',
  `present_virtual_money` int(11) NOT NULL,
  `present_gacha_point` int(11) NOT NULL,
  `present_card` varchar(256) CHARACTER SET latin1 NOT NULL,
  `present_item` varchar(256) CHARACTER SET latin1 NOT NULL,
  `present_display` varchar(64) CHARACTER SET latin1 NOT NULL,
  `lot` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT '30:89,40:9.7,50:1.1,60:0.2',
  `special_card` varchar(128) CHARACTER SET latin1 NOT NULL,
  `specific_interrup_card` varchar(128) CHARACTER SET latin1 NOT NULL,
  `on_top` int(11) NOT NULL DEFAULT '0',
  `updated_by` varchar(128) CHARACTER SET latin1 NOT NULL,
  `updated_at` datetime NOT NULL,
  `note` varchar(2048) DEFAULT '<p>Вы получаете 11 Редких Бессмертных (Р или выше) по цене 10.</p>\n<p>Возможно выпадение дубликатов Бессмертных.</p>\n<p>Сетевые показатели или иные факторы могут привести к тому, что игра пропустит анимацию, но транзакции всегда должны проводиться до конца, даже если анимация не проигрывается.</p>\n<p>Усиленное заклинание на этой странице и обычное Усиленное заклинание- оба дают одинаковые результаты.</p>',
  `odd_even` tinyint(1) DEFAULT '0' COMMENT '0: all IDs, 1:odd, 2:even',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='アイテムマスタテーブル';



# Dump of table gacha_step_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_step_event`;

CREATE TABLE `gacha_step_event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `disp_start` datetime DEFAULT NULL,
  `disp_end` datetime DEFAULT NULL,
  `event_type` int(11) unsigned DEFAULT NULL,
  `max_step_rate` int(11) DEFAULT NULL,
  `level_up_premium` tinyint(1) DEFAULT '0' COMMENT 'IMMIOS-8760: Level Up Premium feature',
  `rarity_table` text,
  `step_data` text,
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gacha_step_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_step_log`;

CREATE TABLE `gacha_step_log` (
  `gacha_step_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ステップガチャlog_ID',
  `gacha_log_id` bigint(20) unsigned NOT NULL COMMENT 'ガチャステップデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `type` tinyint(4) NOT NULL COMMENT 'ガチャステップのイベントID',
  `step_no` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'ステップ番号',
  `gacha_lv` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'ガチャレベル',
  `sr_rate_step` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'SR出現率のステップ',
  `ssr_rate_step` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'SSR出現率のステップ',
  `next_step_no` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'ステップ番号',
  `next_gacha_lv` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'ガチャレベル',
  `next_sr_rate_step` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'SR出現率のステップ',
  `next_ssr_rate_step` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'SSR出現率のステップ',
  `sr_step_up_flg` tinyint(4) NOT NULL COMMENT 'SR確率アップフラグ',
  `create_date` datetime NOT NULL COMMENT '作成日',
  PRIMARY KEY (`gacha_step_log_id`),
  UNIQUE KEY `gacha_log_id` (`gacha_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ボックスプレゼント';



# Dump of table gacha_step_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_step_user_data`;

CREATE TABLE `gacha_step_user_data` (
  `gacha_step_user_data_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ガチャステップデータID',
  `type` tinyint(4) NOT NULL COMMENT 'ガチャステップのイベントID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `step_no` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'ステップ番号',
  `gacha_lv` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'ガチャレベル',
  `sr_rate_step` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'SR出現率のステップ',
  `ssr_rate_step` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'SSR出現率のステップ',
  `create_date` datetime NOT NULL COMMENT '作成日',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`gacha_step_user_data_id`),
  UNIQUE KEY `uid` (`uid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ボックスプレゼント';



# Dump of table gacha_ticket_use
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_ticket_use`;

CREATE TABLE `gacha_ticket_use` (
  `gacha_ticket_use_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `item_mst_id` int(10) unsigned NOT NULL COMMENT 'アイテムデータID',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  PRIMARY KEY (`gacha_ticket_use_id`),
  KEY `uid_item_date` (`uid`,`item_mst_id`,`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gacha_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gacha_user_data`;

CREATE TABLE `gacha_user_data` (
  `gacha_user_data` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ガチャ用ユーザデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `one_day_update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '一日一回無料ガチャ更新時間',
  `lunchtime_update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'ランチタイムガチャ更新時間',
  `dinner_update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'ディナータイムガチャ更新時間',
  `rare_miss_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'レアガチャ連続はずれカウント\n保障処理に使用',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event_1_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'イベント１用時間記録領域',
  `event_1_miss_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'イベント１用補てんカウント記録領域',
  `event_1_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'イベント１用汎用カウント記録領域',
  `event_1_update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'イベント１用更新日時',
  `event_2_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'イベント２用時間記録領域',
  `event_2_miss_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'イベント２用補てんカウント記録領域',
  `event_2_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'イベント２用汎用カウント記録領域',
  `event_2_update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'イベント２用更新日時',
  `event_3_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'イベント３用時間記録領域',
  `event_3_miss_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'イベント３用補てんカウント記録領域',
  `event_3_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'イベント３用汎用カウント記録領域',
  `event_3_update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'イベント３用更新日時',
  `event_4_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'イベント４用時間記録領域',
  `event_4_miss_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'イベント４用補てんカウント記録領域',
  `event_4_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'イベント４用汎用カウント記録領域',
  `event_4_update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'イベント４用更新日時',
  `event_5_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'イベント５用時間記録領域',
  `event_5_miss_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'イベント５用補てんカウント記録領域',
  `event_5_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'イベント５用汎用カウント記録領域',
  `event_5_update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'イベント５用更新日時',
  `event_6_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'イベント６用時間記録領域',
  `event_6_miss_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'イベント６用補てんカウント記録領域',
  `event_6_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'イベント６用汎用カウント記録領域',
  `event_6_update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'イベント６用更新日時',
  PRIMARY KEY (`gacha_user_data`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ガチャ用ユーザデータ';



# Dump of table gift_code_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gift_code_log`;

CREATE TABLE `gift_code_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `redeem_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gift_code_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gift_code_mst`;

CREATE TABLE `gift_code_mst` (
  `code_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(8) DEFAULT NULL,
  `item_mst_list` varchar(128) DEFAULT NULL,
  `quantity` varchar(128) DEFAULT NULL,
  `redemptions` int(10) unsigned NOT NULL DEFAULT '0',
  `redeem_limit` int(11) NOT NULL DEFAULT '1',
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table information_compensation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `information_compensation`;

CREATE TABLE `information_compensation` (
  `info_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'info_id',
  `compensation_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '補填タイプ',
  `uid` int(10) unsigned NOT NULL COMMENT 'uid',
  `valid_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有効期限',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'もらえるフラグもらえる 1もらったら 0',
  `subject` varchar(255) NOT NULL COMMENT '新着表示文',
  `body` varchar(255) NOT NULL COMMENT '補填ページ表示文',
  `comment` varchar(255) NOT NULL COMMENT 'プレゼントBOXコメント',
  `type1` varchar(45) NOT NULL COMMENT 'item -> item\ncard -> card\nvirtual_money -> money\ngacha_p -> gacha',
  `id1` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  `cnt1` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '補填数(カードの場合、無視)',
  `type2` varchar(45) NOT NULL,
  `id2` int(10) unsigned NOT NULL DEFAULT '0',
  `cnt2` int(10) unsigned NOT NULL DEFAULT '0',
  `type3` varchar(45) NOT NULL,
  `id3` int(10) unsigned NOT NULL DEFAULT '0',
  `cnt3` int(10) unsigned NOT NULL DEFAULT '0',
  `type4` varchar(45) NOT NULL,
  `id4` int(10) unsigned NOT NULL DEFAULT '0',
  `cnt4` int(10) unsigned NOT NULL DEFAULT '0',
  `type5` varchar(45) NOT NULL,
  `id5` int(10) unsigned NOT NULL DEFAULT '0',
  `cnt5` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`info_id`),
  UNIQUE KEY `compensation_type` (`compensation_type`,`uid`),
  KEY `uid_index` (`uid`),
  KEY `time_index` (`valid_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='補填情報';



# Dump of table lucky_egg_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lucky_egg_data`;

CREATE TABLE `lucky_egg_data` (
  `egg_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `valid` tinyint(1) DEFAULT '1' COMMENT '有効フラグ(孵化前)\nnullで無効な感じで',
  `get_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '取得時間',
  `reduction_timing` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '短縮アイテム使用タイミング',
  `reduction_rest` time NOT NULL DEFAULT '00:00:00' COMMENT '短縮した残り時間',
  `warmer_list` mediumtext NOT NULL COMMENT '温めた人の名前',
  `invalid_warmer` mediumtext NOT NULL COMMENT 'アイテム使って無効になった人たち',
  `item_list` varchar(255) NOT NULL COMMENT 'もらったものリスト',
  PRIMARY KEY (`egg_id`),
  UNIQUE KEY `uid_valid` (`uid`,`valid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ラッキーエッグの状態';



# Dump of table lucky_egg_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lucky_egg_mst`;

CREATE TABLE `lucky_egg_mst` (
  `id` int(10) unsigned NOT NULL COMMENT 'ID(温め回数)',
  `virtual_money` int(10) unsigned NOT NULL COMMENT 'ギル',
  `gacha_point` int(10) unsigned NOT NULL COMMENT 'ガチャP',
  `gvg_stamina` int(10) unsigned NOT NULL COMMENT 'MP',
  `card_id0` int(10) unsigned NOT NULL COMMENT '孵化時取得カードID',
  `card_rate0` int(10) unsigned NOT NULL COMMENT '孵化時取得確率',
  `card_id1` int(10) unsigned NOT NULL COMMENT '孵化時取得カードID',
  `card_rate1` int(10) unsigned NOT NULL COMMENT '孵化時取得確率',
  `card_id2` int(10) unsigned NOT NULL COMMENT '孵化時取得カードID',
  `card_rate2` int(10) unsigned NOT NULL COMMENT '孵化時取得確率',
  `card_id3` int(10) unsigned NOT NULL COMMENT '孵化時取得カードID',
  `card_rate3` int(10) unsigned NOT NULL COMMENT '孵化時取得確率',
  `card_id4` int(10) unsigned NOT NULL COMMENT '孵化時取得カードID',
  `card_rate4` int(10) unsigned NOT NULL COMMENT '孵化時取得確率',
  `exp` int(10) unsigned NOT NULL COMMENT '経験値',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ラッキーエッグ中身マスタ';



# Dump of table maintenance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `maintenance`;

CREATE TABLE `maintenance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:normal, 1:maintenance',
  `start_date` varchar(32) NOT NULL,
  `start` varchar(32) NOT NULL,
  `end_date` varchar(32) NOT NULL,
  `end` varchar(32) NOT NULL,
  `updated_by` varchar(128) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table manastone_training_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `manastone_training_event`;

CREATE TABLE `manastone_training_event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `manastone_item_id` int(11) DEFAULT '0',
  `exclusion_card_ids` varchar(256) DEFAULT NULL,
  `training_type1_cost` int(11) DEFAULT NULL,
  `training_type2_cost` int(11) DEFAULT NULL,
  `training_type3_cost` int(11) DEFAULT NULL,
  `gacha_present_rare_min` int(11) DEFAULT NULL,
  `gacha_present` text,
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table manastone_training_treasure_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `manastone_training_treasure_log`;

CREATE TABLE `manastone_training_treasure_log` (
  `manastone_training_treasure_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '魔石錬成 錬成報酬ログID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `event_id` int(10) unsigned NOT NULL COMMENT 'イベントID',
  `training_type` tinyint(1) unsigned NOT NULL COMMENT '錬成タイプ',
  `manastone_training_treasure_mst_id` int(10) unsigned NOT NULL COMMENT '魔石錬成 報酬マスタID',
  `chance_time_count` int(10) unsigned NOT NULL COMMENT '魔石チャンスカウント',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  PRIMARY KEY (`manastone_training_treasure_log_id`),
  KEY `uid_event_id` (`uid`,`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='魔石錬成 錬成報酬ログ';



# Dump of table manastone_training_treasure_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `manastone_training_treasure_mst`;

CREATE TABLE `manastone_training_treasure_mst` (
  `manastone_training_treasure_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '魔石錬成 報酬マスタID',
  `event_id` int(10) unsigned NOT NULL COMMENT 'イベントID',
  `training_type` tinyint(1) unsigned NOT NULL COMMENT '錬成タイプ manastone_training.yaml 参照',
  `type` tinyint(3) unsigned NOT NULL COMMENT '報酬アイテムタイプ manastone_training.yaml 参照',
  `data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'データID\nマスタID系を入れるところ',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '個数',
  `lot_per` int(10) unsigned NOT NULL COMMENT '0~10000\n100%を10000とみなすので\n100で割って考えてね。',
  `img_path` varchar(255) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`manastone_training_treasure_mst_id`),
  KEY `training_type` (`training_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='魔石錬成 報酬マスタID';



# Dump of table manastone_training_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `manastone_training_user_data`;

CREATE TABLE `manastone_training_user_data` (
  `manastone_training_user_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '魔石錬成 ユーザデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `event_id` int(10) unsigned NOT NULL COMMENT 'イベントID',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0：OP演出未表示、1：OP演出表示済み',
  `chance_time_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '魔石チャンス残り回数',
  `chance_hit_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '魔石チャンス当選数',
  `use_manastone_1_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '魔石1使用数',
  `use_manastone_2_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '魔石2使用数(予備)',
  `use_manastone_3_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '魔石3使用数(予備)',
  `training_1_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '錬成回数:序',
  `training_2_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '錬成回数:特',
  `training_3_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '錬成回数:極',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`manastone_training_user_data_id`),
  UNIQUE KEY `uid_event_id_UNIQUE` (`uid`,`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='魔石錬成 ユーザデータ';



# Dump of table marketing_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `marketing_event`;

CREATE TABLE `marketing_event` (
  `uid` int(10) unsigned NOT NULL COMMENT 'user ID',
  `marketing_event_id` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL COMMENT 'Status of the event.',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`,`marketing_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keep track of the marketing events.';



# Dump of table mat_api
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mat_api`;

CREATE TABLE `mat_api` (
  `mat_api_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `msg` varchar(400) DEFAULT NULL,
  `msg_type` enum('success','fail','queue') DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_scope` int(10) unsigned NOT NULL DEFAULT '20141122' COMMENT 'date for partition',
  PRIMARY KEY (`mat_api_id`,`date_scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE (date_scope)
(PARTITION p20141122 VALUES LESS THAN (20141122) ENGINE = InnoDB) */;



# Dump of table mat_api_android
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mat_api_android`;

CREATE TABLE `mat_api_android` (
  `mat_api_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) NOT NULL,
  `msg` varchar(400) DEFAULT NULL,
  `msg_type` enum('success','fail','queue') DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_scope` int(10) unsigned NOT NULL DEFAULT '20141122' COMMENT 'date for partition',
  PRIMARY KEY (`mat_api_id`,`date_scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE (date_scope)
(PARTITION p20141122 VALUES LESS THAN (20141122) ENGINE = InnoDB) */;



# Dump of table mission_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_config`;

CREATE TABLE `mission_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `disp_text` varchar(128) DEFAULT '',
  `stamina_fact` float DEFAULT '0',
  `exp_fact` float DEFAULT '0',
  `money_fact` float DEFAULT '0',
  `updated_by` varchar(128) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pictorial_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pictorial_data`;

CREATE TABLE `pictorial_data` (
  `pictorial_data_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '図鑑データID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `card_mst_id` int(10) unsigned NOT NULL COMMENT 'カードマスタID',
  `total_num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '入手枚数',
  `max_evol_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'MAX合成枚数',
  `max_penetration_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最終限界突破回数',
  `create_date` datetime NOT NULL COMMENT '作成日',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `max_lv_num` int(11) NOT NULL DEFAULT '0' COMMENT 'そのカードを最大レベルにしたカウント',
  PRIMARY KEY (`pictorial_data_id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`,`card_mst_id`),
  KEY `opening_quest_type_UniqueGetMax` (`uid`,`total_num`),
  KEY `opening_quest_type_LvMax` (`uid`,`max_lv_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='図鑑データ';



# Dump of table preselection_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `preselection_event`;

CREATE TABLE `preselection_event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `disp_start` datetime DEFAULT NULL,
  `disp_end` datetime DEFAULT NULL,
  `ranking_present_title` varchar(256) DEFAULT NULL,
  `ranking_list` text,
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gvg_presents_campaign` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table present_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `present_data`;

CREATE TABLE `present_data` (
  `present_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'プレゼントデータＩＤ',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザＩＤ',
  `send_uid` int(10) unsigned NOT NULL COMMENT '送り主ユーザＩＤ',
  `type` tinyint(3) NOT NULL COMMENT 'タイプ',
  `data_id` int(10) NOT NULL DEFAULT '0' COMMENT 'データＩＤ',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数',
  `from_user_name` varchar(255) DEFAULT NULL COMMENT '贈り主名',
  `comment` varchar(200) DEFAULT NULL COMMENT '説明文',
  `create_date` datetime DEFAULT NULL COMMENT '送った日時',
  `receive_date` datetime DEFAULT NULL COMMENT '受け取った日時',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状態',
  PRIMARY KEY (`present_data_id`),
  KEY `uid` (`uid`,`status`),
  KEY `send_uid` (`send_uid`),
  KEY `index_create_date` (`create_date`),
  KEY `index_receive_date` (`receive_date`),
  KEY `uid_p_data_id` (`uid`,`present_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='プレゼントデータ';



# Dump of table present_receive_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `present_receive_log`;

CREATE TABLE `present_receive_log` (
  `present_receive_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'プレゼント受け取りログID',
  `present_data_id` int(10) unsigned NOT NULL COMMENT 'プレゼントデータID',
  `src_uid` int(10) unsigned NOT NULL COMMENT '贈ったユーザID',
  `dst_uid` int(10) unsigned NOT NULL COMMENT '受け取ったユーザID',
  `type` tinyint(3) NOT NULL COMMENT 'タイプ',
  `data_id` int(10) NOT NULL COMMENT 'データID',
  `num` int(10) unsigned NOT NULL COMMENT '数',
  `make_card_data_id` bigint(20) unsigned DEFAULT NULL COMMENT '受け取って作成されたカードデータID',
  `comment` varchar(200) DEFAULT NULL COMMENT '説明文',
  `send_date` datetime DEFAULT NULL COMMENT 'プレゼントを贈った日時',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '作成日時',
  `error` varchar(100) DEFAULT NULL COMMENT 'エラーメッセージ',
  PRIMARY KEY (`present_receive_log_id`,`create_date`),
  KEY `srd_uid` (`src_uid`),
  KEY `dst_uid` (`dst_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='プレゼント受け取りログ'
/*!50100 PARTITION BY RANGE (UNIX_TIMESTAMP(create_date))
(PARTITION p20130417 VALUES LESS THAN (1366124400) ENGINE = InnoDB,
 PARTITION p20130418 VALUES LESS THAN (1366210800) ENGINE = InnoDB,
 PARTITION p20130419 VALUES LESS THAN (1366297200) ENGINE = InnoDB,
 PARTITION p20130420 VALUES LESS THAN (1366383600) ENGINE = InnoDB,
 PARTITION p20130421 VALUES LESS THAN (1366470000) ENGINE = InnoDB,
 PARTITION p20130422 VALUES LESS THAN (1366556400) ENGINE = InnoDB,
 PARTITION p20130423 VALUES LESS THAN (1366642800) ENGINE = InnoDB,
 PARTITION p20130424 VALUES LESS THAN (1366729200) ENGINE = InnoDB,
 PARTITION p20130425 VALUES LESS THAN (1366815600) ENGINE = InnoDB,
 PARTITION p20130426 VALUES LESS THAN (1366902000) ENGINE = InnoDB,
 PARTITION p20130427 VALUES LESS THAN (1366988400) ENGINE = InnoDB,
 PARTITION p20130428 VALUES LESS THAN (1367074800) ENGINE = InnoDB,
 PARTITION p20130429 VALUES LESS THAN (1367161200) ENGINE = InnoDB,
 PARTITION p20130430 VALUES LESS THAN (1367247600) ENGINE = InnoDB,
 PARTITION p20130501 VALUES LESS THAN (1367334000) ENGINE = InnoDB,
 PARTITION p20130502 VALUES LESS THAN (1367420400) ENGINE = InnoDB,
 PARTITION p20130503 VALUES LESS THAN (1367506800) ENGINE = InnoDB,
 PARTITION p20130504 VALUES LESS THAN (1367593200) ENGINE = InnoDB,
 PARTITION p20130505 VALUES LESS THAN (1367679600) ENGINE = InnoDB,
 PARTITION p20130506 VALUES LESS THAN (1367766000) ENGINE = InnoDB,
 PARTITION p20130507 VALUES LESS THAN (1367852400) ENGINE = InnoDB,
 PARTITION p20130508 VALUES LESS THAN (1367938800) ENGINE = InnoDB,
 PARTITION p20130509 VALUES LESS THAN (1368025200) ENGINE = InnoDB,
 PARTITION p20130510 VALUES LESS THAN (1368111600) ENGINE = InnoDB,
 PARTITION p20130511 VALUES LESS THAN (1368198000) ENGINE = InnoDB,
 PARTITION p20130512 VALUES LESS THAN (1368284400) ENGINE = InnoDB,
 PARTITION p20130513 VALUES LESS THAN (1368370800) ENGINE = InnoDB,
 PARTITION p20130514 VALUES LESS THAN (1368457200) ENGINE = InnoDB,
 PARTITION p20130515 VALUES LESS THAN (1368543600) ENGINE = InnoDB,
 PARTITION p20130516 VALUES LESS THAN (1368630000) ENGINE = InnoDB,
 PARTITION p20130618 VALUES LESS THAN (1371538800) ENGINE = InnoDB,
 PARTITION p20130619 VALUES LESS THAN (1371625200) ENGINE = InnoDB,
 PARTITION p20130620 VALUES LESS THAN (1371711600) ENGINE = InnoDB,
 PARTITION p20130621 VALUES LESS THAN (1371798000) ENGINE = InnoDB,
 PARTITION p20130622 VALUES LESS THAN (1371884400) ENGINE = InnoDB,
 PARTITION p20130623 VALUES LESS THAN (1371970800) ENGINE = InnoDB,
 PARTITION p20130624 VALUES LESS THAN (1372057200) ENGINE = InnoDB,
 PARTITION p20130625 VALUES LESS THAN (1372143600) ENGINE = InnoDB,
 PARTITION p20130626 VALUES LESS THAN (1372230000) ENGINE = InnoDB,
 PARTITION p20130627 VALUES LESS THAN (1372316400) ENGINE = InnoDB,
 PARTITION p20130628 VALUES LESS THAN (1372402800) ENGINE = InnoDB,
 PARTITION p20130629 VALUES LESS THAN (1372489200) ENGINE = InnoDB,
 PARTITION p20130630 VALUES LESS THAN (1372575600) ENGINE = InnoDB,
 PARTITION p20130701 VALUES LESS THAN (1372662000) ENGINE = InnoDB,
 PARTITION p20130702 VALUES LESS THAN (1372748400) ENGINE = InnoDB,
 PARTITION p20130703 VALUES LESS THAN (1372834800) ENGINE = InnoDB,
 PARTITION p20130704 VALUES LESS THAN (1372921200) ENGINE = InnoDB,
 PARTITION p20130705 VALUES LESS THAN (1373007600) ENGINE = InnoDB,
 PARTITION p20130706 VALUES LESS THAN (1373094000) ENGINE = InnoDB,
 PARTITION p20130707 VALUES LESS THAN (1373180400) ENGINE = InnoDB,
 PARTITION p20130708 VALUES LESS THAN (1373266800) ENGINE = InnoDB,
 PARTITION p20130709 VALUES LESS THAN (1373353200) ENGINE = InnoDB,
 PARTITION p20130710 VALUES LESS THAN (1373439600) ENGINE = InnoDB,
 PARTITION p20130711 VALUES LESS THAN (1373526000) ENGINE = InnoDB,
 PARTITION p20130712 VALUES LESS THAN (1373612400) ENGINE = InnoDB,
 PARTITION p20130713 VALUES LESS THAN (1373698800) ENGINE = InnoDB,
 PARTITION p20130714 VALUES LESS THAN (1373785200) ENGINE = InnoDB,
 PARTITION p20130715 VALUES LESS THAN (1373871600) ENGINE = InnoDB,
 PARTITION p20130716 VALUES LESS THAN (1373958000) ENGINE = InnoDB,
 PARTITION p20130717 VALUES LESS THAN (1374044400) ENGINE = InnoDB,
 PARTITION p20130718 VALUES LESS THAN (1374130800) ENGINE = InnoDB,
 PARTITION p20130719 VALUES LESS THAN (1374217200) ENGINE = InnoDB,
 PARTITION p20141110 VALUES LESS THAN (1415563200) ENGINE = InnoDB,
 PARTITION p20141111 VALUES LESS THAN (1415649600) ENGINE = InnoDB,
 PARTITION p20141112 VALUES LESS THAN (1415736000) ENGINE = InnoDB,
 PARTITION p20141113 VALUES LESS THAN (1415822400) ENGINE = InnoDB,
 PARTITION p20141114 VALUES LESS THAN (1415908800) ENGINE = InnoDB,
 PARTITION p20141115 VALUES LESS THAN (1415995200) ENGINE = InnoDB,
 PARTITION p20141116 VALUES LESS THAN (1416081600) ENGINE = InnoDB,
 PARTITION p20141117 VALUES LESS THAN (1416168000) ENGINE = InnoDB,
 PARTITION p20141118 VALUES LESS THAN (1416254400) ENGINE = InnoDB,
 PARTITION p20141119 VALUES LESS THAN (1416340800) ENGINE = InnoDB,
 PARTITION p20141120 VALUES LESS THAN (1416427200) ENGINE = InnoDB,
 PARTITION p20141121 VALUES LESS THAN (1416513600) ENGINE = InnoDB,
 PARTITION p20141122 VALUES LESS THAN (1416600000) ENGINE = InnoDB,
 PARTITION p20141123 VALUES LESS THAN (1416686400) ENGINE = InnoDB,
 PARTITION p20141124 VALUES LESS THAN (1416772800) ENGINE = InnoDB,
 PARTITION p20141125 VALUES LESS THAN (1416859200) ENGINE = InnoDB,
 PARTITION p20141126 VALUES LESS THAN (1416945600) ENGINE = InnoDB,
 PARTITION p20141127 VALUES LESS THAN (1417032000) ENGINE = InnoDB,
 PARTITION p20141128 VALUES LESS THAN (1417118400) ENGINE = InnoDB,
 PARTITION p20141129 VALUES LESS THAN (1417204800) ENGINE = InnoDB,
 PARTITION p20141130 VALUES LESS THAN (1417291200) ENGINE = InnoDB,
 PARTITION p20141201 VALUES LESS THAN (1417377600) ENGINE = InnoDB,
 PARTITION p20141202 VALUES LESS THAN (1417464000) ENGINE = InnoDB,
 PARTITION p20141203 VALUES LESS THAN (1417550400) ENGINE = InnoDB,
 PARTITION p20141204 VALUES LESS THAN (1417636800) ENGINE = InnoDB,
 PARTITION p20141205 VALUES LESS THAN (1417723200) ENGINE = InnoDB,
 PARTITION p20141206 VALUES LESS THAN (1417809600) ENGINE = InnoDB,
 PARTITION p20141207 VALUES LESS THAN (1417896000) ENGINE = InnoDB,
 PARTITION p20141208 VALUES LESS THAN (1417982400) ENGINE = InnoDB,
 PARTITION p20141209 VALUES LESS THAN (1418068800) ENGINE = InnoDB,
 PARTITION p20141210 VALUES LESS THAN (1418155200) ENGINE = InnoDB,
 PARTITION p20141211 VALUES LESS THAN (1418241600) ENGINE = InnoDB) */;



# Dump of table ragnarok_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ragnarok_event`;

CREATE TABLE `ragnarok_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `beind_held_date` text NOT NULL,
  `updated_by` varchar(128) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `start_end` (`start`,`end`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table rank_card_data_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_card_data_1`;

CREATE TABLE `rank_card_data_1` (
  `rank_card_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `card_count` int(11) DEFAULT NULL COMMENT 'The unique amount of cards the player has collected in the course of his playing time',
  `active_table` tinyint(1) unsigned DEFAULT NULL COMMENT 'Only set for the first row. If active, this table will be used, otherwise, other table',
  PRIMARY KEY (`rank_card_data_id`),
  KEY `card_count` (`card_count`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table rank_card_data_2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_card_data_2`;

CREATE TABLE `rank_card_data_2` (
  `rank_card_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `card_count` int(11) DEFAULT NULL COMMENT 'The unique amount of cards the player has collected in the course of his playing time',
  `active_table` tinyint(1) unsigned DEFAULT NULL COMMENT 'Only set for the first row. If active, this table will be used, otherwise, other table',
  PRIMARY KEY (`rank_card_data_id`),
  KEY `card_count` (`card_count`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table rank_clan_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_clan_data`;

CREATE TABLE `rank_clan_data` (
  `rank_clan_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クランID',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_clan_data_id`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランランキング蓄積用データ';



# Dump of table rank_clan_data_daily
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_clan_data_daily`;

CREATE TABLE `rank_clan_data_daily` (
  `rank_clan_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クランID',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_clan_data_id`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランランキング蓄積用データ日別';



# Dump of table rank_clan_data_monthly
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_clan_data_monthly`;

CREATE TABLE `rank_clan_data_monthly` (
  `rank_clan_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クランID',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_clan_data_id`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランランキング蓄積用データ月別';



# Dump of table rank_clan_data_weekly
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_clan_data_weekly`;

CREATE TABLE `rank_clan_data_weekly` (
  `rank_clan_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_clan_data_id`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランランキング蓄積用データ週別';



# Dump of table rank_clan_total_daily
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_clan_total_daily`;

CREATE TABLE `rank_clan_total_daily` (
  `rank_clan_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クランID',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`rank_clan_total_id`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランランキング集計用データ日別';



# Dump of table rank_clan_total_monthly
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_clan_total_monthly`;

CREATE TABLE `rank_clan_total_monthly` (
  `rank_clan_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クランID',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_clan_total_id`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランランキング集計用データ月別';



# Dump of table rank_clan_total_weekly
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_clan_total_weekly`;

CREATE TABLE `rank_clan_total_weekly` (
  `rank_clan_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_clan_total_id`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランランキング集計用データ週別';



# Dump of table rank_clan_total_weekly_interim
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_clan_total_weekly_interim`;

CREATE TABLE `rank_clan_total_weekly_interim` (
  `rank_clan_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_clan_total_id`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランランキング中間発表';



# Dump of table rank_personal_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_personal_data`;

CREATE TABLE `rank_personal_data` (
  `rank_personal_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `card_status_max` int(10) unsigned NOT NULL,
  `card_data_id` int(10) unsigned NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_personal_data`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='個人ランキング蓄積用データ';



# Dump of table rank_personal_data_daily
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_personal_data_daily`;

CREATE TABLE `rank_personal_data_daily` (
  `rank_personal_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT 'ユーザID',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `maindeck_total_attack` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの攻撃力の合計値',
  `maindeck_total_defense` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの防御力の合計値',
  `total_status_point` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの攻防の合計値',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_personal_data_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='個人ランキング蓄積用データ日別';



# Dump of table rank_personal_data_weekly
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_personal_data_weekly`;

CREATE TABLE `rank_personal_data_weekly` (
  `rank_personal_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT 'ユーザID',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `maindeck_total_attack` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの攻撃力の合計値',
  `maindeck_total_defense` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの防御力の合計値',
  `total_status_point` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの攻防の合計値',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_personal_data_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='個人ランキング蓄積用データ週別';



# Dump of table rank_personal_total
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_personal_total`;

CREATE TABLE `rank_personal_total` (
  `rank_personal_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `card_status_max` int(10) unsigned NOT NULL DEFAULT '0',
  `card_data_id` int(10) unsigned NOT NULL DEFAULT '0',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_personal_total_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='個人ランキング集計用データ';



# Dump of table rank_personal_total_daily
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_personal_total_daily`;

CREATE TABLE `rank_personal_total_daily` (
  `rank_personal_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT 'ユーザID',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `maindeck_total_attack` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの攻撃力の合計値',
  `maindeck_total_defense` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの防御力の合計値',
  `total_status_point` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの攻防の合計値',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_personal_total_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='個人ランキング集計用データ日別';



# Dump of table rank_personal_total_weekly
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_personal_total_weekly`;

CREATE TABLE `rank_personal_total_weekly` (
  `rank_personal_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT 'ユーザID',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `maindeck_total_attack` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの攻撃力の合計値',
  `maindeck_total_defense` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの防御力の合計値',
  `total_status_point` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの攻防の合計値',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_personal_total_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='個人ランキング集計用データ週別';



# Dump of table rank_status_data_daily
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_status_data_daily`;

CREATE TABLE `rank_status_data_daily` (
  `rank_status_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT 'ユーザID',
  `maindeck_total_attack` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの攻撃力の合計値',
  `maindeck_total_defense` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの防御力の合計値',
  `total_status_point` int(10) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_status_data_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ステータスランキング蓄積用データ日別';



# Dump of table rank_status_total_daily
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rank_status_total_daily`;

CREATE TABLE `rank_status_total_daily` (
  `rank_status_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT 'ユーザID',
  `maindeck_total_attack` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの攻撃力の合計値',
  `maindeck_total_defense` int(10) unsigned DEFAULT '0' COMMENT 'メインデッキの防御力の合計値',
  `total_status_point` int(10) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_status_total_id`),
  UNIQUE KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ステータスランキング集計用データ日別';



# Dump of table sacrifice_count_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sacrifice_count_event`;

CREATE TABLE `sacrifice_count_event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `c` int(11) DEFAULT NULL,
  `uc` int(11) DEFAULT NULL,
  `r` int(11) DEFAULT NULL,
  `hr` int(11) DEFAULT NULL,
  `sr` int(11) DEFAULT NULL,
  `mr` int(11) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table saturation_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `saturation_log`;

CREATE TABLE `saturation_log` (
  `saturation_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT NULL,
  `item_mst_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`saturation_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table skill_bonus_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skill_bonus_config`;

CREATE TABLE `skill_bonus_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `skill_per` float DEFAULT '0',
  `disp_skill_per` float DEFAULT '0',
  `updated_by` varchar(128) NOT NULL DEFAULT '',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table skill_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skill_data`;

CREATE TABLE `skill_data` (
  `skill_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'スキルデータID',
  `skill_mst_id` int(10) unsigned NOT NULL COMMENT 'スキルマスタID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `card_data_id` bigint(20) unsigned NOT NULL COMMENT 'カードデータＩＤ',
  `skill_level` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'スキルレベル',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生成日時',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状態',
  PRIMARY KEY (`skill_data_id`,`uid`),
  KEY `card_data_id` (`uid`,`card_data_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='習得スキルデータ\nどのカードデータがどのスキルを覚えているか';



# Dump of table skill_merg_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skill_merg_log`;

CREATE TABLE `skill_merg_log` (
  `skill_merg_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'スキル強化ログＩＤ',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザＩＤ',
  `merg_log_id` int(10) unsigned NOT NULL COMMENT '合成ログＩＤ',
  `skill_mst_id` int(10) unsigned NOT NULL COMMENT 'スキルマスタID',
  `skill_name` varchar(50) NOT NULL COMMENT 'スキル名',
  `skill_data_id` int(10) unsigned NOT NULL COMMENT 'ベーススキルデータID',
  `before_skill_level` tinyint(3) NOT NULL DEFAULT '0' COMMENT '強化前スキルレベル',
  `after_skill_level` tinyint(3) NOT NULL DEFAULT '0' COMMENT '強化後スキルレベル',
  `merg_result` tinyint(3) unsigned NOT NULL COMMENT '合成結果',
  `material_skill_data_ids` varchar(255) NOT NULL COMMENT '素材スキルデータID',
  `material_skill_mst_ids` varchar(255) NOT NULL COMMENT '素材スキルマスタID',
  `material_skill_levels` varchar(255) NOT NULL COMMENT '素材スキルレベル',
  `lot_per` int(10) unsigned NOT NULL COMMENT '抽選した確率（％）',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '実行日時',
  PRIMARY KEY (`skill_merg_log_id`),
  KEY `merg_log_id` (`merg_log_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スキル強化ログ';



# Dump of table skill_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skill_mst`;

CREATE TABLE `skill_mst` (
  `skill_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(255) NOT NULL DEFAULT '',
  `skill_note` varchar(255) NOT NULL DEFAULT '',
  `card_combination_note` varchar(255) NOT NULL DEFAULT '',
  `skill_effect_level` int(10) unsigned NOT NULL,
  `skill_max_level` int(3) NOT NULL,
  `attribute` int(10) unsigned NOT NULL,
  `skill_type` int(3) unsigned NOT NULL,
  `motion_conditions` int(3) unsigned NOT NULL,
  `card_combination_num` int(10) unsigned NOT NULL,
  PRIMARY KEY (`skill_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table social_bonus_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `social_bonus_data`;

CREATE TABLE `social_bonus_data` (
  `uid` int(10) unsigned NOT NULL COMMENT 'uid',
  `bonus_type` int(10) unsigned NOT NULL COMMENT '招待キャンペーン = 0、クランバトル = 1',
  `bonus_id` int(11) NOT NULL DEFAULT '0' COMMENT '各タイプ内でのさらにID',
  `social_type` int(10) unsigned NOT NULL COMMENT 'Twitter = 0, Facebook = 1',
  `date` date NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日時',
  PRIMARY KEY (`uid`,`bonus_type`,`bonus_id`,`social_type`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='twitterとかfacebookとかのボーナス';



# Dump of table strengthening_week_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strengthening_week_event`;

CREATE TABLE `strengthening_week_event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `disp_start` datetime DEFAULT NULL,
  `disp_end` datetime DEFAULT NULL,
  `guild_attack_rate` float DEFAULT NULL,
  `field_special` int(11) DEFAULT NULL,
  `field_effects` text,
  `ranking_present_title` varchar(256) DEFAULT NULL,
  `ranking_list` text,
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gvg_presents_campaign` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tieredspender_events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tieredspender_events`;

CREATE TABLE `tieredspender_events` (
  `event_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `weight` tinyint(4) unsigned NOT NULL DEFAULT '20',
  `recharge_limit` tinyint(4) NOT NULL DEFAULT '1',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `pcal_start_date` datetime NOT NULL,
  `pcal_end_date` datetime NOT NULL,
  `updated_by` varchar(64) NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `start_end_weight` (`start_date`,`end_date`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tieredspender_recharge_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tieredspender_recharge_log`;

CREATE TABLE `tieredspender_recharge_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `t_common_id` int(10) unsigned NOT NULL,
  `inserted_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_common` (`event_id`,`t_common_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tieredspender_redemption_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tieredspender_redemption_log`;

CREATE TABLE `tieredspender_redemption_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `t_common_id` int(10) unsigned NOT NULL,
  `round` tinyint(4) unsigned NOT NULL,
  `tier_number` tinyint(4) unsigned NOT NULL,
  `wid` int(10) unsigned NOT NULL,
  `inserted_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_common_round` (`event_id`,`t_common_id`,`round`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tieredspender_tiers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tieredspender_tiers`;

CREATE TABLE `tieredspender_tiers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `tier_number` tinyint(4) unsigned NOT NULL,
  `wid` int(10) unsigned NOT NULL,
  `tier_price` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_tier_number` (`event_id`,`tier_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tmpTable
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tmpTable`;

CREATE TABLE `tmpTable` (
  `card_data_id` bigint(20) NOT NULL DEFAULT '0',
  `uid` int(10) DEFAULT NULL,
  `card_mst_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`card_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table trade_clip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trade_clip`;

CREATE TABLE `trade_clip` (
  `trade_clip_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'trade clip id',
  `uid` int(11) NOT NULL COMMENT 'アプリで使用されるユニークID',
  `trade_entry_id` int(11) DEFAULT NULL COMMENT 'トレードID',
  `insert_date` datetime NOT NULL COMMENT 'システム登録日',
  `update_date` datetime NOT NULL COMMENT 'システムデータ更新日',
  `delete_date` datetime DEFAULT NULL COMMENT 'システムデータ削除日',
  `delete_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'システムデータ削除フラグ\r\n0:削除してない\r\n1:削除',
  PRIMARY KEY (`trade_clip_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='お気に入りトレード';



# Dump of table trade_contract_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trade_contract_log`;

CREATE TABLE `trade_contract_log` (
  `trade_contract_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'トレードログID',
  `trade_entry_id` int(10) DEFAULT NULL COMMENT 'トレードID',
  `entry_uid` int(10) DEFAULT NULL COMMENT '出品者UID',
  `contract_uid` int(10) DEFAULT NULL COMMENT 'トレード相手UID',
  `error` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '取引時間',
  PRIMARY KEY (`trade_contract_log_id`),
  KEY `uid` (`entry_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='トレードログ';



# Dump of table trade_entry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trade_entry`;

CREATE TABLE `trade_entry` (
  `trade_entry_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'tradeID',
  `uid` int(11) NOT NULL COMMENT 'アプリで使用されるユニークID',
  `card_data_id` int(10) unsigned NOT NULL COMMENT 'カードID',
  `card_mst_id` int(10) unsigned NOT NULL COMMENT 'カードマスターID',
  `rarity` tinyint(3) unsigned NOT NULL COMMENT 'レア度',
  `attribute` tinyint(1) unsigned NOT NULL COMMENT '属性',
  `level` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'card level',
  `attack` int(10) unsigned NOT NULL COMMENT '攻撃力',
  `defense` int(10) unsigned NOT NULL COMMENT '防御力',
  `deck_cost` int(10) unsigned NOT NULL COMMENT 'コスト',
  `contract_uid` int(10) unsigned DEFAULT NULL COMMENT 'トレードの相手',
  `req_cnt` tinyint(4) DEFAULT NULL COMMENT '条件数',
  `req1_type` tinyint(3) unsigned DEFAULT NULL COMMENT '1:card, 2:item, 3:gacha_point',
  `req1_id` int(10) unsigned DEFAULT NULL COMMENT 'カード、アイテムのマスタID',
  `req1_cnt` int(10) unsigned DEFAULT NULL COMMENT '量',
  `req2_type` tinyint(3) unsigned DEFAULT NULL COMMENT '1:card, 2:item, 3:gacha_point',
  `req2_id` int(10) unsigned DEFAULT NULL COMMENT 'カード、アイテムのマスタID',
  `req2_cnt` int(10) unsigned DEFAULT NULL COMMENT '量',
  `req3_type` tinyint(3) unsigned DEFAULT NULL COMMENT '1:card, 2:item, 3:gacha_point',
  `req3_id` int(10) unsigned DEFAULT NULL COMMENT 'カード、アイテムのマスタID',
  `req3_cnt` int(10) unsigned DEFAULT NULL COMMENT '量',
  `req4_type` tinyint(3) unsigned DEFAULT NULL COMMENT '1:card, 2:item, 3:gacha_point',
  `req4_id` int(10) unsigned DEFAULT NULL COMMENT 'カード、アイテムのマスタID',
  `req4_cnt` int(10) unsigned DEFAULT NULL COMMENT '量',
  `req5_type` tinyint(3) unsigned DEFAULT NULL COMMENT '1:card, 2:item, 3:gacha_point',
  `req5_id` int(10) unsigned DEFAULT NULL COMMENT 'カード、アイテムのマスタID',
  `req5_cnt` int(10) unsigned DEFAULT NULL COMMENT '量',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:取引中 1:成立 2:cancel 3:時間切れ',
  `expire_date` datetime DEFAULT NULL COMMENT 'expire date',
  `date_scope` bigint(20) unsigned NOT NULL COMMENT 'int type of expire_date for fast select',
  `insert_date` datetime NOT NULL COMMENT 'システム登録日',
  `update_date` datetime NOT NULL COMMENT 'システムデータ更新日',
  `delete_date` datetime DEFAULT NULL COMMENT 'システムデータ削除日',
  `delete_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'システムデータ削除フラグ\r\n0:削除してない\r\n1:削除',
  PRIMARY KEY (`trade_entry_id`),
  KEY `uid` (`uid`,`status`),
  KEY `req1_idx` (`req1_id`,`req1_type`),
  KEY `req2_idx` (`req2_id`,`req2_type`),
  KEY `req3_idx` (`req3_id`,`req3_type`),
  KEY `req4_idx` (`req4_id`,`req4_type`),
  KEY `req5_idx` (`req5_id`,`req5_type`),
  KEY `card_mst_idx` (`card_mst_id`,`status`,`delete_flag`),
  KEY `trade_search_idx` (`date_scope`,`rarity`,`attribute`,`status`,`delete_flag`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='トレードデータ';



# Dump of table trade_wish
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trade_wish`;

CREATE TABLE `trade_wish` (
  `trade_wish_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'trade materialID',
  `uid` int(11) NOT NULL COMMENT 'アプリで使用されるユニークID',
  `card_mst_id` int(11) DEFAULT NULL COMMENT 'マスターモンスターID',
  `insert_date` datetime NOT NULL COMMENT 'システム登録日',
  `update_date` datetime NOT NULL COMMENT 'システムデータ更新日',
  `delete_date` datetime DEFAULT NULL COMMENT 'システムデータ削除日',
  `delete_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'システムデータ削除フラグ\r\n0:削除してない\r\n1:削除',
  PRIMARY KEY (`trade_wish_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='トレードアイテム';



# Dump of table urls
# ------------------------------------------------------------

DROP TABLE IF EXISTS `urls`;

CREATE TABLE `urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `url` varchar(1024) NOT NULL,
  `updated_by` varchar(128) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ãƒ¦ãƒ¼ã‚¶ãƒ¼ID',
  `social_id` varchar(108) NOT NULL COMMENT 'ã‚½ãƒ¼ã‚·ãƒ£ãƒ«ID',
  `app_id` int(10) unsigned NOT NULL COMMENT 'ã‚¢ãƒ—ãƒªã®ID 1:æ­¦ç¥žSENKIå¤©ã€2:ãƒ¢ãƒ³ã‚¹ã‚¿ãƒ¼ãƒ‘ãƒ©ãƒ€ã‚¤ã‚¹',
  `user_id` int(10) unsigned NOT NULL COMMENT 'ã‚¢ãƒ—ãƒªå†…ã§ä½¿ç”¨ã—ã¦ã„ã‚‹ãƒ¦ãƒ¼ã‚¶ID',
  `level` int(10) unsigned NOT NULL COMMENT 'ãƒ¬ãƒ™ãƒ«',
  `purchase` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'æœˆé–“èª²é‡‘é¡',
  `insert_date` datetime NOT NULL COMMENT 'ä½œæˆæ—¥',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¥',
  PRIMARY KEY (`id`),
  KEY `social_id` (`social_id`),
  KEY `app_id` (`app_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ãƒ­ã‚°ã‚µãƒ¼ãƒãƒ¼ç”¨ã®ãƒ¦ãƒ¼ã‚¶ç®¡ç†ãƒ†ãƒ¼ãƒ–ãƒ«';



# Dump of table user_account_tutorial_mat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_account_tutorial_mat`;

CREATE TABLE `user_account_tutorial_mat` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `tutorial_sent` tinyint(1) DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
