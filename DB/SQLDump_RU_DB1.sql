# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# Database: dev_monster_real2_ru_RU
# Generation Time: 2014-12-09 13:02:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table adventure_area_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adventure_area_mst`;

CREATE TABLE `adventure_area_mst` (
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID(0から連番)',
  `area_name` varchar(255) NOT NULL COMMENT 'エリア名',
  `area_text` varchar(255) NOT NULL COMMENT 'エリア説明文',
  `drop_rate_lucky_egg` int(10) unsigned NOT NULL COMMENT 'ラッキーエッグドロップ確率',
  `drop_rate_gvg_stamina` int(10) unsigned NOT NULL COMMENT 'ドロップ確率(gvg行動力(MP))',
  `drop_rate_gacha_point` int(10) unsigned NOT NULL COMMENT 'ドロップ確率(ガチャP)',
  `drop_rate_card` int(10) unsigned NOT NULL COMMENT 'ドロップ確率(カード)',
  `drop_rate_gvg_stamina_at_gvg` int(10) unsigned NOT NULL COMMENT 'GvG中\nドロップ確率(gvg行動力(MP))',
  `drop_rate_gacha_point_at_gvg` int(10) unsigned NOT NULL COMMENT 'GvG中\nドロップ確率(ガチャP)',
  `drop_rate_card_at_gvg` int(10) unsigned NOT NULL COMMENT 'GvG中\nドロップ確率(カード)',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冒険エリアマスターデータ';



# Dump of table adventure_monster_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adventure_monster_mst`;

CREATE TABLE `adventure_monster_mst` (
  `adventure_monster_mst_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID',
  `monster_id` int(10) unsigned NOT NULL COMMENT 'モンスターID',
  `move_type` int(10) unsigned NOT NULL COMMENT '動き番号',
  PRIMARY KEY (`adventure_monster_mst_id`),
  KEY `area_id` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冒険ザコマスタ　冒険で表示されるモンスター';



# Dump of table adventure_quest_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adventure_quest_mst`;

CREATE TABLE `adventure_quest_mst` (
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID(0から連番)',
  `quest_id` int(10) unsigned NOT NULL COMMENT 'クエストID(0から連番)',
  `quest_name` varchar(255) NOT NULL COMMENT 'クエスト名',
  `use_stamina` int(10) unsigned NOT NULL COMMENT '体力消費量',
  `gain_step` int(10) unsigned NOT NULL COMMENT '取得達成度',
  `gain_exp` int(10) unsigned NOT NULL COMMENT '取得経験値',
  `gain_money_min` int(10) unsigned NOT NULL COMMENT '最小取得金額',
  `gain_money_max` int(10) unsigned NOT NULL COMMENT '最大取得金額',
  `gain_gvg_stamina` int(10) unsigned NOT NULL COMMENT '取得gvg行動力(MP)',
  `gain_gacha_point` int(10) unsigned NOT NULL COMMENT '取得ガチャP',
  `drop_card_id0` int(10) unsigned NOT NULL COMMENT 'ドロップカードID',
  `drop_rate0` int(10) unsigned NOT NULL COMMENT 'ドロップ確率',
  `drop_card_id1` int(10) unsigned NOT NULL COMMENT '取得カードタイプ０',
  `drop_rate1` int(10) unsigned NOT NULL COMMENT 'カードタイプ０確率',
  `drop_card_id2` int(10) unsigned NOT NULL COMMENT '取得カードタイプ１',
  `drop_rate2` int(10) unsigned NOT NULL COMMENT 'カードタイプ１確率',
  `drop_card_id3` int(10) unsigned NOT NULL COMMENT '取得カードタイプ２',
  `drop_rate3` int(10) unsigned NOT NULL COMMENT 'カードタイプ２確率',
  `drop_card_id4` int(10) unsigned NOT NULL COMMENT '取得カードタイプ３',
  `drop_rate4` int(10) unsigned NOT NULL COMMENT 'カードタイプ３確率',
  `boss_flag` tinyint(1) NOT NULL COMMENT 'ボスいるかどうか\n(存在しない場合はゼロ)',
  `boss_name` varchar(255) NOT NULL COMMENT 'ボス名',
  `boss_speech` varchar(255) NOT NULL COMMENT 'ボスセリフ',
  `boss_speech_win` varchar(255) NOT NULL COMMENT 'ボス勝ち台詞',
  `boss_speech_lose` varchar(255) NOT NULL COMMENT 'ボス負けセリフ',
  `boss_attack` int(10) unsigned NOT NULL COMMENT 'ボス攻撃力',
  `boss_defense` int(10) unsigned NOT NULL COMMENT 'ボス防御力',
  `boss_exp` int(10) unsigned NOT NULL COMMENT 'ボス獲得経験値',
  `boss_money` int(10) unsigned NOT NULL COMMENT 'ボス獲得ギル',
  `boss_gacha_point` int(10) unsigned NOT NULL COMMENT 'ボス獲得ガチャP',
  `boss_item_id` int(10) unsigned NOT NULL COMMENT 'ボス獲得アイテム',
  `boss_item_cnt` int(10) unsigned NOT NULL COMMENT 'ボス獲得アイテム個数',
  PRIMARY KEY (`area_id`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冒険クエストマスターデータ';



# Dump of table android_sales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `android_sales`;

CREATE TABLE `android_sales` (
  `sales_data_id` bigint(16) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `t_common_id` varchar(255) NOT NULL COMMENT 'UUID',
  `uid` int(11) NOT NULL COMMENT 'ユーザーID',
  `package_name` varchar(255) NOT NULL COMMENT 'パッケージ名',
  `nonce` bigint(16) NOT NULL COMMENT 'ノンス',
  `product_id` varchar(255) NOT NULL COMMENT 'Google側から渡されるプロダクトID',
  `order_id` varchar(255) NOT NULL COMMENT 'Google注文番号',
  `coin` mediumint(5) NOT NULL COMMENT '付与クランコイン',
  `insert_date` datetime NOT NULL COMMENT '作成日',
  `purchase_date` datetime NOT NULL COMMENT '決済時間（Google側から渡される）',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `purchase_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sales_data_id`),
  KEY `t_common_id` (`t_common_id`),
  KEY `uid` (`uid`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='売上管理テーブル';



# Dump of table attr_cnt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attr_cnt`;

CREATE TABLE `attr_cnt` (
  `attr_id` int(10) unsigned NOT NULL COMMENT '属性ID',
  `cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='属性カウントテーブル(ただ数を保存するだけ)';



# Dump of table banner_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banner_mst`;

CREATE TABLE `banner_mst` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'バナータイプ',
  `img` varchar(255) NOT NULL COMMENT '画像ファイルパス',
  `link` varchar(255) NOT NULL COMMENT 'リンクパス',
  `text` mediumtext NOT NULL COMMENT 'テキスト',
  `priority` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'プライオリティ',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '表示開始時間',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '表示終了時間',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  `delete_date` timestamp NULL DEFAULT NULL COMMENT '使わない',
  `flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有効フラグ',
  `once_flag` int(11) NOT NULL DEFAULT '0',
  `min_level` int(11) DEFAULT '0' COMMENT 'Restrict min level',
  `max_level` int(11) DEFAULT '0' COMMENT 'Restrict max level',
  `first_time_spender` tinyint(1) DEFAULT '0',
  `os_type` tinyint(1) DEFAULT '0',
  `allow_uid` text,
  `odd_even` tinyint(1) DEFAULT '0' COMMENT '0:all IDs, 1:odd, 2:even',
  PRIMARY KEY (`banner_id`),
  KEY `type_idx` (`type`),
  KEY `prio_idx` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='バナーマスターデータ';



# Dump of table batch_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `batch_log`;

CREATE TABLE `batch_log` (
  `batch_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `batch_name` varchar(40) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL COMMENT '0 = failed, 1 = running, 2 = complete',
  `insert_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`batch_log_id`),
  KEY `index_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table campaign_start_dash
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_start_dash`;

CREATE TABLE `campaign_start_dash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `commit_date` date NOT NULL COMMENT '参加日',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_data` (`uid`,`commit_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スタートダッシュキャンペーンデータ';



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



# Dump of table cvc_data_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cvc_data_1`;

CREATE TABLE `cvc_data_1` (
  `cvc_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドデータＩＤ',
  `guild_name` varchar(64) DEFAULT NULL COMMENT 'ギルド名',
  `guild_level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ギルドレベル',
  `guild_member_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ギルドメンバー数',
  `guild_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'ギルドポイント',
  `win_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '勝ち点\n',
  `win_num` int(10) unsigned NOT NULL DEFAULT '0',
  `lose_num` int(10) unsigned NOT NULL DEFAULT '0',
  `battle_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '総戦闘数',
  `win_rate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '勝率\n10000倍の値を登録して\n100 で割って100％表記に直してください',
  `received_win_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '受け取り済み勝ち点ポイント',
  `master_name` varchar(255) DEFAULT NULL COMMENT 'クランマスター名',
  `master_img` varchar(50) DEFAULT NULL COMMENT 'クランマスターメインカードイメージ名',
  `master_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クランマスターuid\n',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  `matching_axis` tinyint(3) NOT NULL,
  `today_win_count` int(11) DEFAULT '0',
  PRIMARY KEY (`cvc_data_id`),
  UNIQUE KEY `guild_data_id_UNIQUE` (`guild_data_id`),
  KEY `win_point` (`win_point`,`guild_point`),
  KEY `index_matching_axis` (`matching_axis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランバトルイベントクランデータ';



# Dump of table cvc_rank_data_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cvc_rank_data_1`;

CREATE TABLE `cvc_rank_data_1` (
  `cvc_rank_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ランキングデータＩＤ',
  `rank` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '表示順位',
  `cvc_data_id` int(10) unsigned NOT NULL COMMENT 'ＣＶＣデータＩＤ',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドデータＩＤ',
  `guild_name` varchar(64) DEFAULT NULL COMMENT 'ギルド名',
  `guild_level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ギルドレベル',
  `guild_member_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ギルドメンバー数',
  `guild_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'ギルドポイント',
  `win_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '勝ち点',
  `win_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '勝ち数',
  `lose_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '負け数',
  `battle_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '戦闘数',
  `win_rate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '勝率\n10000倍の値を登録して\n100 で割って100％表記に直してください',
  `master_name` varchar(255) DEFAULT NULL COMMENT 'マスター名',
  `master_img` varchar(50) DEFAULT NULL COMMENT 'マスターメインカード画像',
  `master_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'マスターユーザＩＤ',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '作成日時',
  PRIMARY KEY (`cvc_rank_data_id`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ＣＶＣランキング表示用テーブル';



# Dump of table cvc_user_data_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cvc_user_data_1`;

CREATE TABLE `cvc_user_data_1` (
  `cvc_user_data_id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ユーザＩＤ',
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ギルドデータＩＤ',
  `guild_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属ギルドでの獲得ＣＰ',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '０：OP演出未表示、１：OP演出表示済み',
  PRIMARY KEY (`cvc_user_data_id`),
  KEY `uid` (`uid`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランバトルイベント用ユーザデータ';



# Dump of table daily_quest
# ------------------------------------------------------------

DROP TABLE IF EXISTS `daily_quest`;

CREATE TABLE `daily_quest` (
  `dailyquest_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーＩＤ',
  `date_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '日付タイプ',
  `dailyquest_state_id` int(10) unsigned NOT NULL,
  `quest_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クエスト用日付',
  `daily_quest_mst_id` int(11) NOT NULL DEFAULT '0',
  `insert_date` datetime NOT NULL COMMENT '作成日時',
  `updated_date` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`dailyquest_id`,`quest_date`),
  KEY `uid` (`uid`),
  KEY `daily` (`uid`,`daily_quest_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイド中のギルドユーザデータ';



# Dump of table daily_quest_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `daily_quest_data`;

CREATE TABLE `daily_quest_data` (
  `daily_quest_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT 'アプリで使用されるユニークID',
  `dailyquest_state_id` int(10) unsigned NOT NULL COMMENT 'デイリークエストステートID',
  `daily_quest_mst_id` int(10) unsigned NOT NULL COMMENT 'デイリークエストマスタID',
  `complete_status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'コンプリート状況 0:未達成 1:達成 2:アイテムBOX配布済み',
  `complete_date` int(10) unsigned NOT NULL COMMENT 'デイリークエスト完了',
  `get_item_date` datetime DEFAULT NULL COMMENT 'アイテム取得日時',
  `insert_date` datetime NOT NULL COMMENT 'システム登録日',
  `update_date` datetime NOT NULL COMMENT 'システムデータ更新日',
  PRIMARY KEY (`daily_quest_data_id`,`complete_date`),
  UNIQUE KEY `quest` (`uid`,`dailyquest_state_id`,`daily_quest_mst_id`,`complete_status`,`complete_date`),
  KEY `uid` (`uid`,`complete_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スタートダッシュクエスト';



# Dump of table daily_quest_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `daily_quest_mst`;

CREATE TABLE `daily_quest_mst` (
  `daily_quest_mst_id` int(11) NOT NULL,
  `group` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'グループ',
  `date_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'グループ',
  `title` varchar(120) NOT NULL COMMENT 'タイトル',
  `detail` varchar(256) NOT NULL COMMENT '1行説明',
  `link_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '分類(リンク先種類)0=その他 1=図鑑 2=バトル 3=召喚  4=強化合成 5=進撃 6=限界突破 7=騎士団 8=プロフ',
  `item_mst_id` int(10) unsigned NOT NULL COMMENT 'アイテムID',
  `gift_type` smallint(5) unsigned NOT NULL COMMENT '1=アイテム 2=カード 3=召喚P 4=ギル 5=カード枠 6=回復時間',
  `gift_num` mediumint(8) unsigned NOT NULL COMMENT 'ギフトの種類',
  `gift_img` mediumint(8) unsigned NOT NULL COMMENT 'ギフトの画像',
  `disable` tinyint(4) NOT NULL DEFAULT '0' COMMENT '無効',
  `comment` text NOT NULL COMMENT 'ギフトの種類',
  PRIMARY KEY (`daily_quest_mst_id`),
  KEY `group` (`group`,`date_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='マスタスタートダッシュクエスト';



# Dump of table daily_quest_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `daily_quest_state`;

CREATE TABLE `daily_quest_state` (
  `dailyquest_state_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーＩＤ',
  `help_view` tinyint(4) NOT NULL DEFAULT '0' COMMENT '初回だけヘルプに飛ぶ',
  `quest_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クエスト用日付',
  `adv_card_get_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '進撃で取得のカードの数',
  `gacha_normal_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ノーマルガチャ実行数',
  `profile_change` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'プロフィール変更',
  `present_send` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'プレゼント送信',
  `gvg_join` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'ＧｖＧ参加',
  `trade_send` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'トレード申請',
  `coin_exchange` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '交換所交換',
  `evol_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '限界突破回数',
  `final_evol_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最終限界突破回数',
  `greeting_send` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '挨拶したかどうか',
  `powerup_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '強化の最高レベル',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `bonus_card_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'カードのMAX値のボーナス',
  `bonus_time_sec` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '減算される回復時間ボーナス',
  PRIMARY KEY (`dailyquest_state_id`,`quest_date`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table deck_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deck_data`;

CREATE TABLE `deck_data` (
  `deck_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ﾃﾞｯｷﾃﾞｰﾀID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ﾕｰｻﾞｰID',
  `deck_name` varchar(64) NOT NULL COMMENT 'ﾃﾞｯｷ名',
  `gvg_flg` tinyint(3) unsigned NOT NULL COMMENT 'GvGフラグ 1:GvG設定中 2:未設定',
  `recommend_flg` tinyint(3) unsigned NOT NULL COMMENT 'おすすめデッキ 1:対象 2:対象外',
  `total_deck_cost` int(10) unsigned NOT NULL COMMENT 'デッキコスト合計値',
  `total_mp` int(10) unsigned NOT NULL DEFAULT '0',
  `total_attack` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '攻撃力デッキ合計値',
  `total_defense` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '防御力デッキ合計値',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `total_sub_deck_cost` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'コスト合計値 (サブデッキ)',
  `total_sub_mp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '消費MP合計値 (サブデッキ)',
  `total_sub_attack` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '攻撃力合計値 (サブデッキ)',
  `total_sub_defense` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '防御力合計値 (サブデッキ)',
  PRIMARY KEY (`deck_data_id`),
  KEY `index_uid` (`uid`),
  KEY `index_sort` (`gvg_flg`),
  KEY `GVG_SELECT1` (`uid`,`gvg_flg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ﾃﾞｯｷﾃﾞｰﾀ';



# Dump of table deck_detail_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deck_detail_data`;

CREATE TABLE `deck_detail_data` (
  `deck_detail_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ﾃﾞｯｷﾃﾞｰﾀ詳細ID',
  `deck_data_id` int(10) unsigned NOT NULL COMMENT 'ﾃﾞｯｷﾃﾞｰﾀID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ﾕｰｻﾞｰID',
  `card_data_id` bigint(20) unsigned NOT NULL COMMENT 'ｶｰﾄﾞID',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deck_kind` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'deck type( 0:main deck, 1: sub deck )',
  PRIMARY KEY (`deck_detail_data_id`),
  KEY `index_deck_data_id` (`deck_data_id`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ﾃﾞｯｷﾃﾞｰﾀ詳細';



# Dump of table event_button_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_button_mst`;

CREATE TABLE `event_button_mst` (
  `button_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `page` int(10) unsigned NOT NULL DEFAULT '100' COMMENT 'Page to be displayed on',
  `img` varchar(255) NOT NULL COMMENT 'Button image path',
  `link` varchar(255) NOT NULL COMMENT 'Page to link to',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time to begin displaying button',
  `end_time` timestamp NULL DEFAULT NULL COMMENT 'Time to stop displaying button',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date created',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date updated',
  `delete_date` timestamp NULL DEFAULT NULL COMMENT 'Date deleted',
  `min_level` int(11) DEFAULT '0' COMMENT 'Restrict min level',
  `max_level` int(11) DEFAULT '0' COMMENT 'Restrict max level',
  PRIMARY KEY (`button_id`),
  KEY `page_idx` (`page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks special event buttons to display in noticable locations';



# Dump of table event_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_log`;

CREATE TABLE `event_log` (
  `event_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned DEFAULT NULL,
  `uid` int(10) unsigned DEFAULT NULL,
  `step_id` int(10) unsigned DEFAULT NULL,
  `previous_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `complete_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`event_log_id`),
  KEY `index_event_id` (`event_id`,`uid`),
  KEY `index_complete_date` (`complete_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table event_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_mst`;

CREATE TABLE `event_mst` (
  `event_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gc_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gc_log`;

CREATE TABLE `gc_log` (
  `gc_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) NOT NULL,
  `purchase_gc` int(10) NOT NULL,
  `total_new_gc` int(10) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`gc_log_id`),
  UNIQUE KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table greeting_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `greeting_data`;

CREATE TABLE `greeting_data` (
  `greeting_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `src_uid` int(10) unsigned NOT NULL COMMENT '挨拶元',
  `dst_uid` int(10) unsigned NOT NULL COMMENT '挨拶先',
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クランID',
  `greeting_date` date DEFAULT NULL COMMENT '挨拶した日付',
  `src_user_name` varchar(255) NOT NULL COMMENT '挨拶したユーザー名',
  `greeting` varchar(255) NOT NULL COMMENT '挨拶',
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '見たかどうか',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '挨拶した時間',
  PRIMARY KEY (`greeting_id`),
  UNIQUE KEY `unique` (`src_uid`,`greeting_date`,`dst_uid`),
  KEY `dst_uid_idx` (`dst_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='挨拶データ';



# Dump of table grow_chara_level_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grow_chara_level_mst`;

CREATE TABLE `grow_chara_level_mst` (
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ﾚﾍﾞﾙ',
  `need_exp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '必要経験値',
  `type_up` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '1:キャラのtype進める',
  `type_order_up` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '1:type_orderを進める',
  PRIMARY KEY (`level`),
  KEY `need_exp` (`need_exp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='育成キャラレベルマスタ';



# Dump of table grow_chara_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grow_chara_mst`;

CREATE TABLE `grow_chara_mst` (
  `chara_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL COMMENT 'キャラタイプ',
  `type_order` int(10) unsigned NOT NULL COMMENT 'キャラタイプ内での判別',
  `name` varchar(255) DEFAULT NULL COMMENT '育成キャラ名',
  `img_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画像番号',
  `max_lv` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大ﾚﾍﾞﾙ',
  PRIMARY KEY (`chara_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='育成キャラマスタ';



# Dump of table grow_chara_talk_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grow_chara_talk_mst`;

CREATE TABLE `grow_chara_talk_mst` (
  `type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'grow_chara_mstのtype',
  `love_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '必要親密度',
  `talk_word` varchar(255) DEFAULT NULL COMMENT '育成キャラセリフ本文',
  KEY `type` (`type`,`love_point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='育成キャラセリフマスタ';



# Dump of table grow_guild_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grow_guild_data`;

CREATE TABLE `grow_guild_data` (
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ｷﾞﾙﾄﾞﾃﾞｰﾀID',
  `chara_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'chara_mstのchara_id',
  `type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'grow_chara_mstのtype',
  `type_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'grow_chara_mstのtype_order',
  `chara_name` varchar(255) DEFAULT NULL COMMENT '育成ｷｬﾗ名',
  `chara_level` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '育成ｷｬﾗﾚﾍﾞﾙ',
  `chara_total_level` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '一軸で見た場合のﾚﾍﾞﾙ',
  `chara_exp` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '育成ｷｬﾗ経験値',
  `received_reward` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '受取済み報酬ﾚﾍﾞﾙ',
  `insert_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`guild_data_id`),
  KEY `chara_exp` (`chara_exp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='育成ｲﾍﾞﾝﾄｷﾞﾙﾄﾞﾃﾞｰﾀ';



# Dump of table grow_guild_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grow_guild_user_data`;

CREATE TABLE `grow_guild_user_data` (
  `grow_guild_user_data_id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ﾕｰｻﾞID',
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ｷﾞﾙﾄﾞﾃﾞｰﾀID',
  `grow_chara_exp` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '個人総獲得経験値',
  `grow_love_exp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '親密度報酬用経験値',
  `insert_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`grow_guild_user_data_id`),
  KEY `uid` (`uid`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='育成ｲﾍﾞﾝﾄ所属ｷﾞﾙﾄﾞ個人ﾃﾞｰﾀ';



# Dump of table grow_history_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grow_history_log`;

CREATE TABLE `grow_history_log` (
  `history_id` int(10) NOT NULL AUTO_INCREMENT,
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ｷﾞﾙﾄﾞﾃﾞｰﾀID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ﾕｰｻﾞID',
  `before_chara_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '育成前キャラid',
  `before_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '育成前ｷｬﾗﾀｲﾌﾟ',
  `before_type_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '育成前ｷｬﾗﾀｲﾌﾟｵｰﾀﾞ',
  `after_chara_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '育成後キャラid',
  `after_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '育成後ｷｬﾗﾀｲﾌﾟ',
  `after_type_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '育成後ｷｬﾗﾀｲﾌﾟｵｰﾀﾞ',
  `before_lv` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '育成前ﾚﾍﾞﾙ',
  `after_lv` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '育成後ﾚﾍﾞﾙ',
  `before_exp` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '育成前経験値',
  `after_exp` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '育成後経験値',
  `before_love_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '育成前親密度',
  `after_love_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '育成後親密度',
  `before_love_exp` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '育成前親密経験値',
  `after_love_exp` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '育成後親密経験値',
  `evol` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '1ならその育成で進化している',
  `grow_reward_ids` varchar(255) DEFAULT NULL COMMENT '個人の育成報酬ﾃﾞｰﾀID/0:未獲得',
  `love_reward_ids` varchar(255) DEFAULT NULL COMMENT '親密度報酬id',
  `used_card_mst_ids` varchar(255) DEFAULT NULL COMMENT '使用ｶーﾄﾞﾏｽﾀｰID',
  `used_card_data_ids` varchar(255) DEFAULT NULL COMMENT '育成に使用したcard_data_id',
  `insert_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`history_id`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ギルドの育成履歴(正確にはログじゃなくなってる)';



# Dump of table grow_love_point_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grow_love_point_mst`;

CREATE TABLE `grow_love_point_mst` (
  `love_point` int(10) unsigned NOT NULL COMMENT '親密度',
  `need_exp` bigint(20) unsigned NOT NULL COMMENT '必要経験値',
  PRIMARY KEY (`love_point`),
  KEY `need_exp` (`need_exp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='育成親密度ﾏｽﾀ';



# Dump of table grow_love_reward_received_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grow_love_reward_received_log`;

CREATE TABLE `grow_love_reward_received_log` (
  `reward_id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ﾕーｻﾞID',
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ｷﾞﾙﾄﾞID',
  `reward_step` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '報酬カテゴリ内の階層',
  `type` varchar(255) NOT NULL DEFAULT '0' COMMENT '報酬種別',
  `data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '報酬ﾃﾞｰﾀID',
  `cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '付与個数',
  `comment` varchar(255) DEFAULT NULL COMMENT '報酬参照',
  `insert_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`reward_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='育成報酬受取データ';



# Dump of table grow_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grow_user_data`;

CREATE TABLE `grow_user_data` (
  `grow_user_data_id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ﾕｰｻﾞID',
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ｷﾞﾙﾄﾞﾃﾞｰﾀID',
  `leader_card` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '設定中のﾘｰﾀﾞｰｶｰﾄﾞのcard_data_id',
  `grow_guild_user_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'grow_guild_user_dataのid',
  `grow_chara_exp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'grow_guild_user_dataのコピー(ランキング用)',
  `grow_exp_recieve_reward` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '受取済み経験値報酬',
  `grow_love_received_reward` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '受取済み親密度報酬',
  `insert_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`grow_user_data_id`),
  KEY `uid` (`uid`),
  KEY `guild_data_id` (`guild_data_id`),
  KEY `grow_chara_exp` (`grow_chara_exp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='育成ｲﾍﾞﾝﾄﾕｰｻﾞﾃﾞｰﾀ';



# Dump of table grow_user_reward_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grow_user_reward_data`;

CREATE TABLE `grow_user_reward_data` (
  `reward_id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ﾕーｻﾞID',
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ｷﾞﾙﾄﾞID',
  `reward_step` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '報酬の段階',
  `type` varchar(255) NOT NULL DEFAULT '0' COMMENT '報酬種別',
  `data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '報酬ﾃﾞｰﾀID',
  `cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '付与個数',
  `img_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '報酬画像id',
  `comment` varchar(255) DEFAULT NULL COMMENT '報酬参照',
  `valid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0:受取済み(貰った), 1:未獲得(貰える)',
  `insert_date` datetime NOT NULL COMMENT '作成日時',
  `received_date` datetime DEFAULT NULL COMMENT '報酬受取日時/受取った場合のみ日付が入る',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`reward_id`),
  KEY `uid` (`uid`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='育成報酬受取データ';



# Dump of table guild_bbs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `guild_bbs`;

CREATE TABLE `guild_bbs` (
  `guild_bbs_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ギルド掲示板ID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドデータID',
  `guild_user_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドユーザーデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `comment` varchar(256) NOT NULL COMMENT '書き込み内容',
  `public_flg` tinyint(3) unsigned NOT NULL COMMENT '公開フラグ 1:公開 2:非公開',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`guild_bbs_id`),
  KEY `index_guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ギルド掲示板';



# Dump of table guild_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `guild_data`;

CREATE TABLE `guild_data` (
  `guild_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ｷﾞﾙﾄﾞﾃﾞｰﾀID',
  `guild_name` varchar(64) DEFAULT NULL COMMENT 'ｷﾞﾙﾄﾞ名',
  `guild_word` varchar(256) NOT NULL COMMENT '紹介文',
  `guild_master_uid` int(10) unsigned NOT NULL COMMENT 'ｷﾞﾙﾄﾞﾏｽﾀｰﾕｰｻﾞｰID',
  `max_member_num` int(10) unsigned NOT NULL COMMENT '所属ﾒﾝﾊﾞｰ上限数',
  `ace_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'エース設定ユーザー',
  `guild_level` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'ｷﾞﾙﾄﾞﾚﾍﾞﾙ',
  `guild_exp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ｷﾞﾙﾄﾞ経験値',
  `guild_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'ｷﾞﾙﾄﾞ',
  `gvg_victory_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GvG勝利数',
  `gvg_draw_num` int(10) unsigned NOT NULL DEFAULT '0',
  `gvg_lose_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GvG敗戦数',
  `guild_effect_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ｷﾞﾙﾄﾞ効果ID',
  `delete_flg` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '削除ﾌﾗｸﾞ',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `delete_date` timestamp NULL DEFAULT NULL COMMENT '削除日',
  `recognition_flg` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '承認制フラグ(1:承認制 2:非承認制)',
  `guild_member_num` int(11) NOT NULL DEFAULT '1' COMMENT '所属人数',
  `invite_board_user_level` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'ギルメン募集版用ユーザーLv',
  `invite_board_atmosphere` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'ギルメン募集版用雰囲気',
  `invite_board_experience` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'ギルメン募集版用経験',
  `average_level` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '平均Lv',
  `battle_rate` int(11) NOT NULL DEFAULT '0' COMMENT 'バトルレート',
  `active_point` int(11) DEFAULT '0' COMMENT 'アクティブ率',
  `purchase_point` int(11) NOT NULL DEFAULT '0' COMMENT '課金率',
  `matching_axis` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'マッチング軸',
  `last_gvg_guild_data_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '前回GVG対戦したクラン',
  `hero_shogo_get_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '英雄称号取得回数',
  `matching_flg` tinyint(3) DEFAULT '1' COMMENT 'Set to 1 if the guild is to be matched, otherwise don''t match the guild',
  `recent_guild_point` bigint(20) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`guild_data_id`),
  KEY `index_matching_axis` (`matching_axis`),
  KEY `index_guild_member_num` (`guild_member_num`),
  KEY `index_guild_master_uid` (`guild_master_uid`),
  KEY `index_delete_flg` (`delete_flg`,`invite_board_user_level`,`invite_board_atmosphere`,`invite_board_experience`),
  KEY `index_guild_name` (`guild_name`),
  KEY `index_matching_flg` (`matching_flg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ｷﾞﾙﾄﾞﾃﾞｰﾀ';



# Dump of table guild_join_subscription_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `guild_join_subscription_data`;

CREATE TABLE `guild_join_subscription_data` (
  `guild_join_subscription_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '加入申請中データID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `joining_guild_data_id` int(10) unsigned NOT NULL COMMENT '加入申請したギルドID',
  `status` tinyint(3) unsigned NOT NULL COMMENT '申請中ステータス 1:申請中 2:許可 3:拒否 4:ｷｬﾝｾﾙ',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`guild_join_subscription_data_id`),
  KEY `index_guild_data_id` (`joining_guild_data_id`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ギルド加入申請中データ';



# Dump of table guild_role_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `guild_role_data`;

CREATE TABLE `guild_role_data` (
  `guild_role_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ギルド役職データID',
  `guild_role_mst_id` int(10) unsigned NOT NULL COMMENT 'ギルド役職マスタID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドデータID',
  `guild_role_type` tinyint(3) unsigned NOT NULL COMMENT '役職タイプ',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  PRIMARY KEY (`guild_role_data_id`),
  KEY `index_guild_role_mst_id` (`guild_role_mst_id`),
  KEY `index_guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ギルド役職データ';



# Dump of table guild_role_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `guild_role_mst`;

CREATE TABLE `guild_role_mst` (
  `guild_role_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ｷﾞﾙﾄﾞ役職ﾏｽﾀID',
  `guild_role_name` varchar(64) NOT NULL COMMENT '役職名',
  `role_detail` varchar(256) DEFAULT NULL COMMENT '役職詳細',
  `img` varchar(64) NOT NULL COMMENT '画像ファイル名',
  `required_guild_level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '必要ギルドLV',
  `guild_role_num` int(10) unsigned NOT NULL COMMENT '役職個数',
  `guild_role_type` tinyint(3) unsigned NOT NULL COMMENT '役職タイプ(1:バトル系 2:クエスト系 3:合成系 9:特殊系)',
  `guild_role_effect_type1` tinyint(3) unsigned NOT NULL COMMENT '役職効果タイプ1(11:攻撃力アップ 12:防御力アップ 13:攻防アップ 14:カード覚醒確率アップ\n 21:獲得経験値アップ 22:獲得ギルアップ 23:ラッキーエッグ獲得率アップ\n 24:カード獲得率アップ 25:ガチャP獲得率アップ 26:MP回復量アップ\n 31:消費ギルダウン\n 99:特殊)',
  `guild_role_effect_type2` tinyint(3) unsigned NOT NULL COMMENT '役職効果タイプ2(guild_role_effect_type2 と同様)',
  `guild_role_rate1` int(10) unsigned NOT NULL COMMENT 'ギルド効果倍率1',
  `guild_role_rate2` int(10) unsigned NOT NULL COMMENT 'ギルド効果倍率2',
  `guild_role_max_level` int(10) unsigned NOT NULL COMMENT 'ギルド効果ﾚﾍﾞﾙ上限',
  PRIMARY KEY (`guild_role_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ギルド役職マスタ';



# Dump of table guild_scout_board_setup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `guild_scout_board_setup`;

CREATE TABLE `guild_scout_board_setup` (
  `guild_scout_board_setup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `scout_board_atmosphere` tinyint(3) unsigned NOT NULL COMMENT 'スカウト用雰囲気',
  `scout_board_experience` tinyint(3) unsigned NOT NULL COMMENT 'スカウト用経験',
  `scout_board_guild_level` tinyint(3) unsigned NOT NULL COMMENT 'スカウト用クランレベル',
  `scout_board_guild_member_num` tinyint(3) unsigned NOT NULL COMMENT 'スカウト用所属人数',
  `scout_board_average_level` tinyint(3) unsigned NOT NULL COMMENT 'スカウト用平均レベル',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`guild_scout_board_setup_id`),
  KEY `index_guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スカウト勧誘設定';



# Dump of table guild_scout_subscription_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `guild_scout_subscription_data`;

CREATE TABLE `guild_scout_subscription_data` (
  `guild_scout_subscription_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '加入申請中データID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT '勧誘元ギルドID',
  `subscription_uid` int(10) unsigned NOT NULL COMMENT '勧誘申請したユーザーID',
  `scout_uid` int(10) unsigned NOT NULL COMMENT '勧誘対象のユーザーID',
  `status` tinyint(3) unsigned NOT NULL COMMENT '勧誘申請中ステータス 1:申請中 2:許可 3:拒否 4:ｷｬﾝｾﾙ',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`guild_scout_subscription_data_id`),
  KEY `index_guild_data_id` (`guild_data_id`),
  KEY `index_subscription_uid` (`subscription_uid`),
  KEY `index_scout_uid` (`scout_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スカウト勧誘申請中データ';



# Dump of table guild_shogo_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `guild_shogo_data`;

CREATE TABLE `guild_shogo_data` (
  `guild_shogo_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '称号ID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT '称号名',
  `guild_shogo_mst_id` int(10) unsigned NOT NULL COMMENT '称号詳細',
  `equip_flg` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '装備フラグ(0:未装備 1:装備中 2:削除)',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`guild_shogo_data_id`),
  KEY `index_guild_data_id` (`guild_data_id`),
  KEY `index_guild_shogo_mst_id` (`guild_shogo_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='称号データ';



# Dump of table guild_shogo_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `guild_shogo_mst`;

CREATE TABLE `guild_shogo_mst` (
  `guild_shogo_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '称号ID',
  `name` varchar(64) NOT NULL COMMENT '称号名',
  `guild_shogo_detail` varchar(256) NOT NULL COMMENT '称号詳細',
  `img` varchar(256) NOT NULL DEFAULT '' COMMENT '画像ファイル名',
  PRIMARY KEY (`guild_shogo_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='称号マスタ';



# Dump of table guild_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `guild_user_data`;

CREATE TABLE `guild_user_data` (
  `guild_user_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ｷﾞﾙﾄﾞﾕｰｻﾞｰID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ｷﾞﾙﾄﾞﾃﾞｰﾀID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ﾕｰｻﾞｰID',
  `guild_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'ｷﾞﾙﾄﾞﾎﾟｲﾝﾄ',
  `guild_joined_flg` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '加入中ﾌﾗｸﾞ',
  `guild_role_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '役職データID',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`guild_user_data_id`),
  KEY `index_guild_data_id` (`guild_data_id`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ｷﾞﾙﾄﾞﾕｰｻﾞｰﾃﾞｰﾀ';



# Dump of table gvg_action_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_action_history`;

CREATE TABLE `gvg_action_history` (
  `gvg_action_history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GvG行動ID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'GvGﾃﾞｰﾀID',
  `guild_data_id` int(11) NOT NULL COMMENT 'ギルドデータID',
  `history_id` int(10) unsigned NOT NULL COMMENT 'ログID（各履歴テーブルのログID）',
  `action_log_id` int(10) unsigned DEFAULT NULL COMMENT 'ログID（メモキャッシュと同期用）',
  `action_kind` tinyint(3) unsigned NOT NULL COMMENT '行動種別(1:攻撃 2:応援 3:回復)',
  `uid` int(10) unsigned NOT NULL COMMENT 'ﾕｰｻﾞｰID',
  `name` varchar(255) DEFAULT NULL COMMENT 'ユーザー名',
  `result` text NOT NULL COMMENT '結果',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `delete_date` timestamp NULL DEFAULT NULL COMMENT '削除日',
  `delete_flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '削除フラグ(1:削除)',
  `date_scope` int(10) unsigned NOT NULL DEFAULT '20130530' COMMENT 'date for partition',
  PRIMARY KEY (`gvg_action_history_id`,`date_scope`),
  KEY `index_uid` (`uid`),
  KEY `gvg_data_id_date_scope_history_id_idx` (`gvg_data_id`,`date_scope`,`gvg_action_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GvG行動戦歴'
/*!50100 PARTITION BY RANGE (date_scope)
(PARTITION p20130520 VALUES LESS THAN (20130520) ENGINE = InnoDB,
 PARTITION p20130521 VALUES LESS THAN (20130521) ENGINE = InnoDB,
 PARTITION p20130522 VALUES LESS THAN (20130522) ENGINE = InnoDB,
 PARTITION p20130706 VALUES LESS THAN (20130706) ENGINE = InnoDB,
 PARTITION p20130707 VALUES LESS THAN (20130707) ENGINE = InnoDB,
 PARTITION p20130708 VALUES LESS THAN (20130708) ENGINE = InnoDB,
 PARTITION p20130709 VALUES LESS THAN (20130709) ENGINE = InnoDB,
 PARTITION p20130710 VALUES LESS THAN (20130710) ENGINE = InnoDB,
 PARTITION p20130711 VALUES LESS THAN (20130711) ENGINE = InnoDB,
 PARTITION p20130712 VALUES LESS THAN (20130712) ENGINE = InnoDB,
 PARTITION p20130713 VALUES LESS THAN (20130713) ENGINE = InnoDB,
 PARTITION p20130714 VALUES LESS THAN (20130714) ENGINE = InnoDB,
 PARTITION p20130715 VALUES LESS THAN (20130715) ENGINE = InnoDB,
 PARTITION p20130716 VALUES LESS THAN (20130716) ENGINE = InnoDB,
 PARTITION p20130717 VALUES LESS THAN (20130717) ENGINE = InnoDB,
 PARTITION p20130718 VALUES LESS THAN (20130718) ENGINE = InnoDB,
 PARTITION p20130719 VALUES LESS THAN (20130719) ENGINE = InnoDB,
 PARTITION p20141128 VALUES LESS THAN (20141128) ENGINE = InnoDB,
 PARTITION p20141129 VALUES LESS THAN (20141129) ENGINE = InnoDB,
 PARTITION p20141130 VALUES LESS THAN (20141130) ENGINE = InnoDB,
 PARTITION p20141201 VALUES LESS THAN (20141201) ENGINE = InnoDB,
 PARTITION p20141202 VALUES LESS THAN (20141202) ENGINE = InnoDB,
 PARTITION p20141203 VALUES LESS THAN (20141203) ENGINE = InnoDB,
 PARTITION p20141204 VALUES LESS THAN (20141204) ENGINE = InnoDB,
 PARTITION p20141205 VALUES LESS THAN (20141205) ENGINE = InnoDB,
 PARTITION p20141206 VALUES LESS THAN (20141206) ENGINE = InnoDB,
 PARTITION p20141207 VALUES LESS THAN (20141207) ENGINE = InnoDB,
 PARTITION p20141208 VALUES LESS THAN (20141208) ENGINE = InnoDB,
 PARTITION p20141209 VALUES LESS THAN (20141209) ENGINE = InnoDB,
 PARTITION p20141210 VALUES LESS THAN (20141210) ENGINE = InnoDB,
 PARTITION p20141211 VALUES LESS THAN (20141211) ENGINE = InnoDB) */;



# Dump of table gvg_aid_effect_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_aid_effect_data`;

CREATE TABLE `gvg_aid_effect_data` (
  `gvg_aid_effect_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '応援効果データID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'GVGデータID',
  `gvg_user_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `add_attack` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '攻撃力アップ',
  `add_defense` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '防御力アップ',
  `del_attack` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '攻撃力ダウン',
  `del_defense` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '防御力ダウン',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`gvg_aid_effect_data_id`),
  KEY `index_gvg_data_id` (`gvg_data_id`),
  KEY `index_gvg_user_data_id` (`gvg_user_data_id`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='応援効果データ';



# Dump of table gvg_aid_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_aid_history`;

CREATE TABLE `gvg_aid_history` (
  `gvg_aid_history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '応援履歴ID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'GVGデータID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `name` varchar(255) DEFAULT NULL COMMENT 'ユーザー名',
  `receive_guild_data_id` int(10) unsigned NOT NULL COMMENT '相手ギルドデータID',
  `receive_uid` int(10) unsigned NOT NULL COMMENT '相手ユーザーID',
  `receive_name` varchar(255) DEFAULT NULL COMMENT '応援相手ユーザー名',
  `combo_aid_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '応援コンボ回数',
  `add_attack` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '攻撃力アップ',
  `add_defense` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '防御力アップ',
  `del_attack` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '攻撃力ダウン',
  `del_defense` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '防御力ダウン',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  PRIMARY KEY (`gvg_aid_history_id`),
  KEY `index_gvg_data_id` (`gvg_data_id`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='応援履歴';



# Dump of table gvg_battle_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_battle_history`;

CREATE TABLE `gvg_battle_history` (
  `gvg_battle_history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GvG戦歴ID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'GvGﾃﾞｰﾀID',
  `guild_data_id` int(11) NOT NULL COMMENT 'ギルドデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ﾕｰｻﾞｰID',
  `name` varchar(255) DEFAULT NULL COMMENT 'ユーザー名',
  `receive_guild_data_id` int(10) unsigned NOT NULL COMMENT '対戦相手ギルドデータID',
  `combo_count` int(11) NOT NULL DEFAULT '1' COMMENT 'ｺﾝﾎﾞ回数',
  `gacha_point` int(10) unsigned NOT NULL DEFAULT '0',
  `guild_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '獲得GP',
  `critical_flg` tinyint(3) unsigned NOT NULL COMMENT 'クリティカル発動フラグ(1:発動していない 2:発動した)',
  `output_result_flg` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'ﾊﾞﾄﾙ結果出力ﾌﾗｸﾞ(1:結果未出力 2:結果出力済)',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `date_scope` int(10) unsigned NOT NULL DEFAULT '20130830' COMMENT 'date for partition',
  `damage_total` bigint(20) unsigned DEFAULT '0' COMMENT 'ダメージトータル',
  PRIMARY KEY (`gvg_battle_history_id`,`date_scope`),
  KEY `index_gvg_data_id` (`gvg_data_id`),
  KEY `index_uid` (`uid`),
  KEY `GVG_SELECT1` (`gvg_data_id`,`uid`,`gvg_battle_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GvG戦歴'
/*!50100 PARTITION BY RANGE (date_scope)
(PARTITION p20130831 VALUES LESS THAN (20130831) ENGINE = InnoDB,
 PARTITION p20130901 VALUES LESS THAN (20130901) ENGINE = InnoDB,
 PARTITION p20130902 VALUES LESS THAN (20130902) ENGINE = InnoDB,
 PARTITION p20141128 VALUES LESS THAN (20141128) ENGINE = InnoDB,
 PARTITION p20141129 VALUES LESS THAN (20141129) ENGINE = InnoDB,
 PARTITION p20141130 VALUES LESS THAN (20141130) ENGINE = InnoDB,
 PARTITION p20141201 VALUES LESS THAN (20141201) ENGINE = InnoDB,
 PARTITION p20141202 VALUES LESS THAN (20141202) ENGINE = InnoDB,
 PARTITION p20141203 VALUES LESS THAN (20141203) ENGINE = InnoDB,
 PARTITION p20141204 VALUES LESS THAN (20141204) ENGINE = InnoDB,
 PARTITION p20141205 VALUES LESS THAN (20141205) ENGINE = InnoDB,
 PARTITION p20141206 VALUES LESS THAN (20141206) ENGINE = InnoDB,
 PARTITION p20141207 VALUES LESS THAN (20141207) ENGINE = InnoDB,
 PARTITION p20141208 VALUES LESS THAN (20141208) ENGINE = InnoDB,
 PARTITION p20141209 VALUES LESS THAN (20141209) ENGINE = InnoDB,
 PARTITION p20141210 VALUES LESS THAN (20141210) ENGINE = InnoDB,
 PARTITION p20141211 VALUES LESS THAN (20141211) ENGINE = InnoDB) */;



# Dump of table gvg_battle_history_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_battle_history_detail`;

CREATE TABLE `gvg_battle_history_detail` (
  `gvg_battle_history_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GvG戦歴詳細ID',
  `gvg_battle_history_id` int(10) unsigned NOT NULL COMMENT 'GvG戦歴ID',
  `uid` int(11) NOT NULL COMMENT 'ユーザーID',
  `gvg_card_data_id` bigint(20) unsigned NOT NULL COMMENT '使用ｶｰﾄﾞID',
  `receive_uid` int(10) unsigned NOT NULL COMMENT '対戦相手ﾕｰｻﾞｰID',
  `receive_gvg_card_data_id` int(10) unsigned NOT NULL COMMENT '対戦相手使用ｶｰﾄﾞID',
  `receive_name` varchar(255) NOT NULL,
  `skill_mst_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'スキルマスタID',
  `skill_name` varchar(255) NOT NULL,
  `skill_level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'スキルLV',
  `skill_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'スキルタイプ',
  `additional_attack_flg` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '追い打ちフラグ(全員気絶の場合のみ)(1:発動しない 2:発動した)',
  `default_gvg_life` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被ダメージ前HP',
  `deleted_hp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '削ったHP',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `dead_flg` tinyint(4) NOT NULL DEFAULT '0' COMMENT '死亡ﾌﾗｸﾞ(default:0, 死亡:1)',
  `date_scope` int(10) unsigned NOT NULL DEFAULT '20130830' COMMENT 'date for partition',
  PRIMARY KEY (`gvg_battle_history_detail_id`,`date_scope`),
  KEY `index_gvg_battle_history_id` (`gvg_battle_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GvG戦歴詳細'
/*!50100 PARTITION BY RANGE (date_scope)
(PARTITION p20130831 VALUES LESS THAN (20130831) ENGINE = InnoDB,
 PARTITION p20130901 VALUES LESS THAN (20130901) ENGINE = InnoDB,
 PARTITION p20130902 VALUES LESS THAN (20130902) ENGINE = InnoDB,
 PARTITION p20141128 VALUES LESS THAN (20141128) ENGINE = InnoDB,
 PARTITION p20141129 VALUES LESS THAN (20141129) ENGINE = InnoDB,
 PARTITION p20141130 VALUES LESS THAN (20141130) ENGINE = InnoDB,
 PARTITION p20141201 VALUES LESS THAN (20141201) ENGINE = InnoDB,
 PARTITION p20141202 VALUES LESS THAN (20141202) ENGINE = InnoDB,
 PARTITION p20141203 VALUES LESS THAN (20141203) ENGINE = InnoDB,
 PARTITION p20141204 VALUES LESS THAN (20141204) ENGINE = InnoDB,
 PARTITION p20141205 VALUES LESS THAN (20141205) ENGINE = InnoDB,
 PARTITION p20141206 VALUES LESS THAN (20141206) ENGINE = InnoDB,
 PARTITION p20141207 VALUES LESS THAN (20141207) ENGINE = InnoDB,
 PARTITION p20141208 VALUES LESS THAN (20141208) ENGINE = InnoDB,
 PARTITION p20141209 VALUES LESS THAN (20141209) ENGINE = InnoDB,
 PARTITION p20141210 VALUES LESS THAN (20141210) ENGINE = InnoDB,
 PARTITION p20141211 VALUES LESS THAN (20141211) ENGINE = InnoDB) */;



# Dump of table gvg_card_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_card_data`;

CREATE TABLE `gvg_card_data` (
  `gvg_card_data_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gvg_date_scope` int(10) unsigned NOT NULL COMMENT 'レコードの有効範囲（日付）',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'GvGﾃﾞｰﾀID',
  `gvg_user_data_id` int(10) unsigned NOT NULL COMMENT 'GvGﾕｰｻﾞｰﾃﾞｰﾀID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ﾕｰｻﾞｰID',
  `card_data_id` bigint(20) unsigned NOT NULL COMMENT 'ｶｰﾄﾞID',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'ｶｰﾄﾞｽﾃｰﾀｽ',
  `insert_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `deck_kind` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'デッキ種別 ( 0:メインデッキ, 1:サブデッキ )',
  PRIMARY KEY (`gvg_card_data_id`,`gvg_date_scope`),
  KEY `index_uid` (`uid`),
  KEY `index_card_id` (`card_data_id`),
  KEY `index_gvg_data_id` (`gvg_data_id`,`deck_kind`),
  KEY `index_gvg_user_data_id` (`gvg_data_id`,`gvg_user_data_id`,`deck_kind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GvGｶｰﾄﾞﾃﾞｰﾀ'
/*!50100 PARTITION BY RANGE (`gvg_date_scope`)
(PARTITION p20130711 VALUES LESS THAN (20130711) ENGINE = InnoDB,
 PARTITION p20130712 VALUES LESS THAN (20130712) ENGINE = InnoDB,
 PARTITION p20130713 VALUES LESS THAN (20130713) ENGINE = InnoDB,
 PARTITION p20130714 VALUES LESS THAN (20130714) ENGINE = InnoDB,
 PARTITION p20130715 VALUES LESS THAN (20130715) ENGINE = InnoDB,
 PARTITION p20130716 VALUES LESS THAN (20130716) ENGINE = InnoDB,
 PARTITION p20130717 VALUES LESS THAN (20130717) ENGINE = InnoDB,
 PARTITION p20130718 VALUES LESS THAN (20130718) ENGINE = InnoDB,
 PARTITION p20130719 VALUES LESS THAN (20130719) ENGINE = InnoDB,
 PARTITION p20141203 VALUES LESS THAN (20141203) ENGINE = InnoDB,
 PARTITION p20141204 VALUES LESS THAN (20141204) ENGINE = InnoDB,
 PARTITION p20141205 VALUES LESS THAN (20141205) ENGINE = InnoDB,
 PARTITION p20141206 VALUES LESS THAN (20141206) ENGINE = InnoDB,
 PARTITION p20141207 VALUES LESS THAN (20141207) ENGINE = InnoDB,
 PARTITION p20141208 VALUES LESS THAN (20141208) ENGINE = InnoDB,
 PARTITION p20141209 VALUES LESS THAN (20141209) ENGINE = InnoDB,
 PARTITION p20141210 VALUES LESS THAN (20141210) ENGINE = InnoDB,
 PARTITION p20141211 VALUES LESS THAN (20141211) ENGINE = InnoDB) */;



# Dump of table gvg_combo_aid_bonus_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_combo_aid_bonus_data`;

CREATE TABLE `gvg_combo_aid_bonus_data` (
  `gvg_combo_aid_bonus_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '応援コンボボーナスID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'gvgデータID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'クランデータID',
  `uid` int(10) unsigned NOT NULL COMMENT '達成時のユーザーID',
  `combo_aid_bonus_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '応援コンボボーナスタイプ',
  `combo_aid_bonus_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '応援コンボボーナス回数',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`gvg_combo_aid_bonus_data_id`),
  KEY `index_gvg_data_id` (`gvg_data_id`,`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='応援コンボボーナスデータ';



# Dump of table gvg_combo_aid_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_combo_aid_data`;

CREATE TABLE `gvg_combo_aid_data` (
  `gvg_combo_aid_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '応援コンボデータID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'GVGデータID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドデータID',
  `last_combo_uid` int(10) unsigned NOT NULL COMMENT '最終コンボユーザーID',
  `combo_aid_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '応援コンボ回数',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`gvg_combo_aid_data_id`),
  KEY `index_gvg_data_id` (`gvg_data_id`),
  KEY `index_guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='応援コンボデータ';



# Dump of table gvg_combo_bonus_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_combo_bonus_data`;

CREATE TABLE `gvg_combo_bonus_data` (
  `gvg_combo_bonus_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'コンボボーナスID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'gvgデータID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'クランデータID',
  `uid` int(10) unsigned NOT NULL COMMENT '達成時のユーザーID',
  `combo_bonus_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '攻撃コンボボーナスタイプ',
  `combo_bonus_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '攻撃コンボボーナス回数',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`gvg_combo_bonus_data_id`),
  KEY `index_gvg_data_id` (`gvg_data_id`,`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='コンボボーナスデータ';



# Dump of table gvg_combo_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_combo_data`;

CREATE TABLE `gvg_combo_data` (
  `gvg_combo_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ｺﾝﾎﾞﾃﾞｰﾀID',
  `gvg_data_id` int(10) unsigned NOT NULL,
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ｷﾞﾙﾄﾞﾃﾞｰﾀID',
  `last_combo_uid` int(10) unsigned NOT NULL COMMENT '最終ｺﾝﾎﾞﾕｰｻﾞｰID',
  `combo_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ｺﾝﾎﾞ回数',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT 'ｺﾝﾎﾞ開始日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`gvg_combo_data_id`),
  KEY `index_gvg_data_id` (`gvg_data_id`),
  KEY `index_guild_data_id` (`guild_data_id`),
  KEY `GVG_SELECT1` (`gvg_data_id`,`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ｺﾝﾎﾞﾃﾞｰﾀ';



# Dump of table gvg_combo_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_combo_log`;

CREATE TABLE `gvg_combo_log` (
  `gvg_combo_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ｺﾝﾎﾞﾛｸﾞID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'GvGﾃﾞｰﾀID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ｷﾞﾙﾄﾞﾃﾞｰﾀID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ﾕｰｻﾞｰID',
  `deleted_hp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '削ったHP',
  `combo_count` int(10) unsigned NOT NULL COMMENT 'コンボ回数',
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日',
  PRIMARY KEY (`gvg_combo_log_id`),
  KEY `index_gvg_data_id` (`gvg_data_id`),
  KEY `index_guild_data_id` (`guild_data_id`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ｺﾝﾎﾞﾛｸﾞ';



# Dump of table gvg_counter_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_counter_user`;

CREATE TABLE `gvg_counter_user` (
  `gvg_counter_user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GvGユーザーカウンターID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'GvGデータID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'クランデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `counter_type` int(10) unsigned NOT NULL COMMENT 'カウンタータイプ',
  `num` int(10) unsigned NOT NULL COMMENT '回数',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`gvg_counter_user_id`),
  KEY `index_gvg_data_id` (`gvg_data_id`),
  KEY `index_uid` (`uid`),
  KEY `index_guild_data_id` (`guild_data_id`),
  KEY `index_gvg_guild_uid` (`gvg_data_id`,`guild_data_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GvGユーザー単位のカウンター';



# Dump of table gvg_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_data`;

CREATE TABLE `gvg_data` (
  `gvg_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GvGﾃﾞｰﾀID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ｷﾞﾙﾄﾞﾃﾞｰﾀID',
  `guild_receive_data_id` int(10) unsigned NOT NULL COMMENT '対戦相手ｷﾞﾙﾄﾞﾃﾞｰﾀID',
  `gvg_today_times_count` int(10) unsigned NOT NULL COMMENT '1日分のGvGｶｳﾝﾄ',
  `start_date` timestamp NULL DEFAULT NULL COMMENT 'GvG開始時刻',
  `total_guild_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '獲得ｷﾞﾙﾄﾞﾎﾟｲﾝﾄ',
  `receive_total_guild_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '相手獲得ｷﾞﾙﾄﾞﾎﾟｲﾝﾄ',
  `active_flg` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'ｽﾃｰﾀｽ',
  `gvg_date` int(10) unsigned NOT NULL COMMENT '日付',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `guild_time_skill_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `guild_time_skill_id` int(10) DEFAULT '0',
  `guild_receive_time_skill_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `guild_receive_time_skill_id` int(10) DEFAULT '0',
  PRIMARY KEY (`gvg_data_id`,`active_flg`),
  KEY `index_guild_data_id` (`guild_data_id`),
  KEY `index_guild_receive_data_id` (`guild_receive_data_id`),
  KEY `index_active_flg` (`active_flg`),
  KEY `index_gvg_date` (`gvg_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GvGﾃﾞｰﾀ'
/*!50100 PARTITION BY LIST (`active_flg`)
(PARTITION pActive VALUES IN (1) ENGINE = InnoDB,
 PARTITION pNotActive VALUES IN (2) ENGINE = InnoDB) */;



# Dump of table gvg_guild_member_encourage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_guild_member_encourage`;

CREATE TABLE `gvg_guild_member_encourage` (
  `gvg_guild_member_encourage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `encouraged_uid` int(10) unsigned NOT NULL COMMENT '鼓舞されたﾕｰｻﾞｰID',
  `recovery_amount` int(10) unsigned NOT NULL COMMENT 'MP回復量',
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日',
  PRIMARY KEY (`gvg_guild_member_encourage_id`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ギルドメンバー鼓舞';



# Dump of table gvg_life_recovery_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_life_recovery_history`;

CREATE TABLE `gvg_life_recovery_history` (
  `gvg_life_recovery_history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'HP回復履歴ID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'GvGデータID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `name` varchar(255) DEFAULT NULL COMMENT 'ユーザー名',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  PRIMARY KEY (`gvg_life_recovery_history_id`),
  KEY `index_gvg_data_id` (`gvg_data_id`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='HP回復履歴';



# Dump of table gvg_participating_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_participating_data`;

CREATE TABLE `gvg_participating_data` (
  `gvg_participating_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ユーザID',
  `gvg_participating_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'バトル参加数',
  `gvg_win_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'バトル勝利数',
  `gvg_lose_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'バトル敗北数',
  `gvg_draw_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'バトル引分数',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`gvg_participating_data_id`),
  UNIQUE KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ユーザーのバトル参加数';



# Dump of table gvg_participating_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_participating_log`;

CREATE TABLE `gvg_participating_log` (
  `gvg_participating_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'クランバトル参加ログID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'gvgデータID',
  `gvg_user_data_id` int(10) unsigned NOT NULL COMMENT 'gvgユーザーデータID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'クランデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  PRIMARY KEY (`gvg_participating_log_id`),
  KEY `index_gvg_data_id` (`gvg_data_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランバトル参加ログ';



# Dump of table gvg_skill_effect_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_skill_effect_data`;

CREATE TABLE `gvg_skill_effect_data` (
  `gvg_skill_effect_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'スキル効果データID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'GVGデータID',
  `gvg_user_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `add_attack` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '攻撃力アップ',
  `add_defense` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '防御力アップ',
  `del_attack` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '攻撃力ダウン',
  `del_defense` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '防御力ダウン',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`gvg_skill_effect_data_id`),
  KEY `index_gvg_data_id` (`gvg_data_id`),
  KEY `index_gvg_user_data_id` (`gvg_user_data_id`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スキル効果データ';



# Dump of table gvg_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gvg_user_data`;

CREATE TABLE `gvg_user_data` (
  `gvg_user_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GvGﾕｰｻﾞｰﾃﾞｰﾀID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'GvGﾃﾞｰﾀID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ｷﾞﾙﾄﾞﾃﾞｰﾀID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ﾕｰｻﾞｰID',
  `deck_id` int(10) unsigned NOT NULL COMMENT 'ﾃﾞｯｷID',
  `dead_flg` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '気絶ﾌﾗｸﾞ',
  `party_sequence` tinyint(3) unsigned NOT NULL COMMENT '隊列',
  `guild_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '獲得ｷﾞﾙﾄﾞﾎﾟｲﾝﾄ',
  `skill_defense_num` int(10) unsigned NOT NULL DEFAULT '0',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `gvg_max_hp` int(10) unsigned NOT NULL COMMENT 'GvG MAX HP',
  `date_scope` int(10) unsigned NOT NULL DEFAULT '20130530' COMMENT 'date for partition',
  `used_mp` int(10) unsigned DEFAULT '0' COMMENT '消費MP値',
  `aid_count` int(10) unsigned DEFAULT '0' COMMENT '応援回数',
  `current_deck` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '現在のデッキタイプ ( 0:メインデッキ, 1:サブデッキ )',
  `passive_skill_ids` varchar(64) NOT NULL COMMENT 'パッシブスキルID',
  `passive_skill_sub_ids` varchar(64) NOT NULL COMMENT 'パッシブスキルID(サブデッキ)',
  PRIMARY KEY (`gvg_user_data_id`,`date_scope`),
  KEY `index_gvg_data_id` (`gvg_data_id`),
  KEY `index_guild_data_id` (`guild_data_id`),
  KEY `index_uid` (`uid`),
  KEY `GVG_SELECT1` (`gvg_data_id`,`uid`),
  KEY `GVG_SELECT2` (`gvg_data_id`,`guild_data_id`),
  KEY `date_index` (`date_scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GvGﾕｰｻﾞｰﾃﾞｰﾀ'
/*!50100 PARTITION BY RANGE (date_scope)
(PARTITION p20130520 VALUES LESS THAN (20130520) ENGINE = InnoDB,
 PARTITION p20130521 VALUES LESS THAN (20130521) ENGINE = InnoDB,
 PARTITION p20130522 VALUES LESS THAN (20130522) ENGINE = InnoDB,
 PARTITION p20130706 VALUES LESS THAN (20130706) ENGINE = InnoDB,
 PARTITION p20130707 VALUES LESS THAN (20130707) ENGINE = InnoDB,
 PARTITION p20130708 VALUES LESS THAN (20130708) ENGINE = InnoDB,
 PARTITION p20130709 VALUES LESS THAN (20130709) ENGINE = InnoDB,
 PARTITION p20130710 VALUES LESS THAN (20130710) ENGINE = InnoDB,
 PARTITION p20130711 VALUES LESS THAN (20130711) ENGINE = InnoDB,
 PARTITION p20130712 VALUES LESS THAN (20130712) ENGINE = InnoDB,
 PARTITION p20130713 VALUES LESS THAN (20130713) ENGINE = InnoDB,
 PARTITION p20130714 VALUES LESS THAN (20130714) ENGINE = InnoDB,
 PARTITION p20130715 VALUES LESS THAN (20130715) ENGINE = InnoDB,
 PARTITION p20130716 VALUES LESS THAN (20130716) ENGINE = InnoDB,
 PARTITION p20130717 VALUES LESS THAN (20130717) ENGINE = InnoDB,
 PARTITION p20130718 VALUES LESS THAN (20130718) ENGINE = InnoDB,
 PARTITION p20130719 VALUES LESS THAN (20130719) ENGINE = InnoDB,
 PARTITION p20141128 VALUES LESS THAN (20141128) ENGINE = InnoDB,
 PARTITION p20141129 VALUES LESS THAN (20141129) ENGINE = InnoDB,
 PARTITION p20141130 VALUES LESS THAN (20141130) ENGINE = InnoDB,
 PARTITION p20141201 VALUES LESS THAN (20141201) ENGINE = InnoDB,
 PARTITION p20141202 VALUES LESS THAN (20141202) ENGINE = InnoDB,
 PARTITION p20141203 VALUES LESS THAN (20141203) ENGINE = InnoDB,
 PARTITION p20141204 VALUES LESS THAN (20141204) ENGINE = InnoDB,
 PARTITION p20141205 VALUES LESS THAN (20141205) ENGINE = InnoDB,
 PARTITION p20141206 VALUES LESS THAN (20141206) ENGINE = InnoDB,
 PARTITION p20141207 VALUES LESS THAN (20141207) ENGINE = InnoDB,
 PARTITION p20141208 VALUES LESS THAN (20141208) ENGINE = InnoDB,
 PARTITION p20141209 VALUES LESS THAN (20141209) ENGINE = InnoDB,
 PARTITION p20141210 VALUES LESS THAN (20141210) ENGINE = InnoDB,
 PARTITION p20141211 VALUES LESS THAN (20141211) ENGINE = InnoDB) */;



# Dump of table information_guild
# ------------------------------------------------------------

DROP TABLE IF EXISTS `information_guild`;

CREATE TABLE `information_guild` (
  `info_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'インフォID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'guild_data_id',
  `data` varchar(255) NOT NULL COMMENT 'データ',
  `subject` varchar(255) NOT NULL COMMENT '本文',
  `jump_url` varchar(255) NOT NULL COMMENT 'とび先',
  `valid` tinyint(1) NOT NULL COMMENT '有効フラグ',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`info_id`),
  KEY `guild_data_id_idx` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ギルド新着情報';



# Dump of table information_managerial
# ------------------------------------------------------------

DROP TABLE IF EXISTS `information_managerial`;

CREATE TABLE `information_managerial` (
  `info_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` int(10) unsigned NOT NULL COMMENT '0:運営 1:イベント',
  `subject` varchar(255) NOT NULL COMMENT 'タイトル',
  `body` mediumtext NOT NULL COMMENT '本文',
  `date` date NOT NULL COMMENT '日付',
  `end_date` date NOT NULL DEFAULT '2020-01-01' COMMENT 'date for news item to stop showing up',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有効判定',
  `spender_flag` int(11) NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '登録日時',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='運営からのお知らせ';



# Dump of table information_personal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `information_personal`;

CREATE TABLE `information_personal` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ニュースID',
  `uid` int(10) unsigned NOT NULL COMMENT '宛先ユーザーID',
  `info_type` int(10) unsigned NOT NULL COMMENT 'ニュースタイプ',
  `delete_type` int(11) NOT NULL COMMENT '消える条件種類',
  `data` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL COMMENT 'タイトル',
  `body` mediumtext NOT NULL COMMENT '本文',
  `jump_url` varchar(255) NOT NULL COMMENT 'とび先',
  `valid` tinyint(1) NOT NULL COMMENT '有効フラグ',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日',
  PRIMARY KEY (`id`),
  KEY `uid_info_type_valid_idx` (`uid`,`info_type`,`valid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='個人宛ニュース';



# Dump of table invite_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invite_data`;

CREATE TABLE `invite_data` (
  `invite_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL COMMENT '招待キャンペーン第１弾とか第２弾を区別する場合に',
  `invite_uid` int(10) unsigned NOT NULL COMMENT '招待した人\n＝招待IDを入力してもらった人',
  `invited_uid` int(10) unsigned NOT NULL COMMENT '招待された人\n＝招待IDを入力した人',
  `level` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '被招待者のLevel',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`invite_id`),
  UNIQUE KEY `type_unique` (`type`,`invite_uid`,`invited_uid`),
  KEY `create_index` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='招待データ';



# Dump of table invite_event_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invite_event_mst`;

CREATE TABLE `invite_event_mst` (
  `invite_event_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT 'title',
  `top_banner_img_path` varchar(255) DEFAULT NULL COMMENT 'top banner img',
  `reward_banner_img_path` varchar(255) DEFAULT NULL COMMENT 'top banner img',
  `bg_img_path` varchar(255) DEFAULT NULL COMMENT 'background img',
  `bg_img_path_iphone5` varchar(512) DEFAULT NULL,
  `facebook_btn_img_path` varchar(255) DEFAULT NULL COMMENT 'facebook button img',
  `mail_btn_img_path` varchar(255) DEFAULT NULL COMMENT 'mail button img',
  `twitter_btn_img_path` varchar(255) DEFAULT NULL COMMENT 'twitter button img',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `admin` varchar(64) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`invite_event_mst_id`),
  KEY `event_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='invite event';



# Dump of table invite_monster_chain_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invite_monster_chain_mst`;

CREATE TABLE `invite_monster_chain_mst` (
  `invite_monster_chain_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invite_event_mst_id` int(10) unsigned NOT NULL,
  `card_mst_id` int(10) unsigned DEFAULT '0',
  `monster_banner_img_path` varchar(255) DEFAULT NULL COMMENT 'monster banner img',
  `order_num` int(10) unsigned DEFAULT '0',
  `admin` varchar(64) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`invite_monster_chain_mst_id`),
  KEY `invite_event` (`invite_event_mst_id`,`order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='invite monster chain';



# Dump of table invite_reward_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invite_reward_mst`;

CREATE TABLE `invite_reward_mst` (
  `invite_reward_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invite_event_mst_id` int(10) unsigned NOT NULL,
  `type_flag` tinyint(4) unsigned DEFAULT '0' COMMENT '0:invite 1:invited',
  `level` int(10) unsigned DEFAULT '0',
  `item_mst_id` int(10) unsigned DEFAULT '0',
  `limit` int(10) unsigned DEFAULT '0',
  `admin` varchar(64) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`invite_reward_mst_id`),
  KEY `invite_id_type_and_level` (`invite_event_mst_id`,`type_flag`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='invite reward';



# Dump of table item_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item_data`;

CREATE TABLE `item_data` (
  `item_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'アイテムデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `item_mst_id` int(10) unsigned NOT NULL COMMENT 'アイテムマスタID',
  `num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '所持数',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`item_data_id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`,`item_mst_id`),
  KEY `uid` (`uid`,`item_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='アイテムデータ';



# Dump of table item_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item_log`;

CREATE TABLE `item_log` (
  `item_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'アイテムログID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `item_data_id` int(10) unsigned NOT NULL COMMENT 'アイテムデータID',
  `item_mst_id` int(10) unsigned NOT NULL COMMENT 'アイテムマスタID',
  `delta_num` int(10) NOT NULL COMMENT '増減数',
  `total_num` int(10) NOT NULL COMMENT '結果個数',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  PRIMARY KEY (`item_log_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='アイテム増減ログ';



# Dump of table item_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item_mst`;

CREATE TABLE `item_mst` (
  `item_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'アイテムマスタID',
  `name` varchar(50) NOT NULL COMMENT 'アイテム名',
  `img` varchar(50) NOT NULL COMMENT 'アイテム画像',
  `img_path` varchar(255) NOT NULL COMMENT 'Image path',
  `type` tinyint(1) unsigned NOT NULL COMMENT 'タイプ\ngame.yaml item:type: で指定\n',
  `effect` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '効果の種類\n\ntype 毎に指定が変わります\ngame.yaml\nitem:once:\nitem:gacha:\nで指定\n\n',
  `value` int(10) NOT NULL DEFAULT '0' COMMENT '効果量',
  `value2` float NOT NULL DEFAULT '0',
  `virtual_money` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金額（ゲーム通貨）',
  `purchase_money` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金額（リアルマネー）',
  `add_num` int(10) NOT NULL DEFAULT '0' COMMENT '増加アイテム数\n\nセット売りアイテム時は無視されます',
  `set_item_mst_id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'セット売り時のアイテム１マスタID\n\nここに指定したIDのアイテムが\nset_num_1 個増えます',
  `set_num_1` int(10) NOT NULL DEFAULT '0' COMMENT 'セットアイテム１個数',
  `set_item_mst_id_2` int(10) NOT NULL DEFAULT '0' COMMENT 'セット売り時のアイテム２マスタID\n\nここに指定したIDのアイテムが\nset_num_2 個増えます',
  `set_num_2` int(10) NOT NULL DEFAULT '0' COMMENT 'セットアイテム２個数',
  `set_item_mst_id_3` int(10) NOT NULL DEFAULT '0' COMMENT 'セット売り時のアイテム３マスタID\n\nここに指定したIDのアイテムが\nset_num_3 個増えます',
  `set_num_3` int(10) NOT NULL DEFAULT '0' COMMENT 'セットアイテム３個数',
  `set_item_mst_id_4` int(10) NOT NULL DEFAULT '0' COMMENT 'セット売り時のアイテム４マスタID\n\nここに指定したIDのアイテムが\nset_num_4 個増えます',
  `set_num_4` int(10) NOT NULL DEFAULT '0' COMMENT 'セットアイテム４個数',
  `set_item_mst_id_5` int(10) NOT NULL DEFAULT '0' COMMENT 'セット売り時のアイテム５マスタID\n\nここに指定したIDのアイテムが\nset_num_5 個増えます',
  `set_num_5` int(10) NOT NULL DEFAULT '0' COMMENT 'セットアイテム５個数',
  `set_item_mst_id_6` int(10) NOT NULL DEFAULT '0',
  `set_num_6` int(10) NOT NULL DEFAULT '0',
  `set_item_mst_id_7` int(10) NOT NULL DEFAULT '0',
  `set_num_7` int(10) NOT NULL DEFAULT '0',
  `set_item_mst_id_8` int(10) NOT NULL DEFAULT '0',
  `set_num_8` int(10) NOT NULL DEFAULT '0',
  `set_item_mst_id_9` int(10) NOT NULL DEFAULT '0',
  `set_num_9` int(10) NOT NULL DEFAULT '0',
  `set_item_mst_id_10` int(10) NOT NULL DEFAULT '0',
  `set_num_10` int(10) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL COMMENT '説明',
  `can_use` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '使用の可否（0：使用不可、1：使用可）',
  `can_buy` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '購入の可否（0：購入不可、1：購入可）',
  `can_trade` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'トレードの可否（0：不可、1：可能）',
  `view_order` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '表示順',
  `once_flag` int(11) NOT NULL DEFAULT '0' COMMENT 'Disappear after purchased',
  `first_time_spender` int(11) NOT NULL DEFAULT '0',
  `odd_even` tinyint(1) DEFAULT '0' COMMENT '0: all IDs, 1:odd, 2:even',
  `start` datetime DEFAULT '0000-00-00 00:00:00',
  `end` datetime DEFAULT '2020-01-01 00:00:00',
  `level_min` int(11) DEFAULT '0',
  `level_max` int(11) DEFAULT '999',
  PRIMARY KEY (`item_mst_id`),
  KEY `can_buy` (`item_mst_id`,`can_buy`),
  KEY `type` (`type`,`effect`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='アイテムマスタテーブル';



# Dump of table login_bonus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login_bonus`;

CREATE TABLE `login_bonus` (
  `bonus_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bonus_type` int(8) NOT NULL COMMENT 'Normal, Ragnorok',
  `gacha_points` int(10) DEFAULT NULL,
  `virtual_money` int(10) DEFAULT NULL,
  `mp` int(10) DEFAULT NULL,
  `include_trade_ticket` tinyint(1) NOT NULL DEFAULT '1',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `card_comment` varchar(64) DEFAULT NULL,
  `card0` int(11) DEFAULT NULL,
  `card0_amount` int(11) DEFAULT NULL,
  `card1` int(11) DEFAULT NULL,
  `card1_amount` int(11) DEFAULT NULL,
  `card2` int(11) DEFAULT NULL,
  `card2_amount` int(11) DEFAULT NULL,
  `card3` int(11) DEFAULT NULL,
  `card3_amount` int(11) DEFAULT NULL,
  `card4` int(11) DEFAULT NULL,
  `card4_amount` int(11) DEFAULT NULL,
  `item_comment` varchar(64) DEFAULT NULL,
  `item0` int(11) DEFAULT NULL,
  `item0_amount` int(11) DEFAULT NULL,
  `item1` int(11) DEFAULT NULL,
  `item1_amount` int(11) DEFAULT NULL,
  `item2` int(11) DEFAULT NULL,
  `item2_amount` int(11) DEFAULT NULL,
  `item3` int(11) DEFAULT NULL,
  `item3_amount` int(11) DEFAULT NULL,
  `item4` int(11) DEFAULT NULL,
  `item4_amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`bonus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table login_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login_image`;

CREATE TABLE `login_image` (
  `login_image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(256) NOT NULL,
  `img_iphone5` varchar(512) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`login_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table market_point
# ------------------------------------------------------------

DROP TABLE IF EXISTS `market_point`;

CREATE TABLE `market_point` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  `product_id` varchar(256) NOT NULL COMMENT 'プロダクトコード',
  `app_version` varchar(10) DEFAULT '1.1',
  `point` int(10) unsigned NOT NULL COMMENT 'ポイント',
  `description` varchar(256) DEFAULT NULL,
  `bonus_item_id` int(10) NOT NULL DEFAULT '0',
  `market_id` tinyint(3) unsigned NOT NULL COMMENT '1:AppStore, 2:Android',
  `updated_by` varchar(64) DEFAULT NULL,
  `release_date` datetime NOT NULL COMMENT 'リリース日時',
  `insert_date` datetime NOT NULL COMMENT '作成日時',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`(255),`market_id`),
  KEY `market_id` (`market_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='購入ポイントマスタ';



# Dump of table market_point_android
# ------------------------------------------------------------

DROP TABLE IF EXISTS `market_point_android`;

CREATE TABLE `market_point_android` (
  `mt_m_market_point_id` int(11) NOT NULL COMMENT 'Primary Key',
  `product_id` varchar(255) NOT NULL COMMENT 'プロダクトID',
  `product_name` varchar(255) NOT NULL COMMENT 'アイテム名（表示用）',
  `point` int(11) NOT NULL COMMENT '付与クランコイン',
  `price` varchar(10) NOT NULL COMMENT '値段',
  `market_id` tinyint(4) NOT NULL COMMENT '販売店（原則2->Google Play）',
  `release_date` datetime NOT NULL COMMENT 'リリース日時',
  PRIMARY KEY (`mt_m_market_point_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Android用購入ポイントマスタ';



# Dump of table medal_item_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `medal_item_data`;

CREATE TABLE `medal_item_data` (
  `medal_item_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'メダル用アイテムデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `medal_item_mst_id` int(10) unsigned NOT NULL COMMENT 'メダル用アイテムマスタID',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所持数',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`medal_item_data_id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`,`medal_item_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='メダルショップ用アイテムデータ';



# Dump of table medal_item_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `medal_item_log`;

CREATE TABLE `medal_item_log` (
  `medal_item_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'メダルアイテムログID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `medal_item_data_id` int(10) unsigned NOT NULL COMMENT 'メダルアイテムデータID',
  `medal_item_mst_id` int(10) unsigned NOT NULL COMMENT 'メダルアイテムマスタID',
  `delta_num` int(10) NOT NULL COMMENT '増減数',
  `total_num` int(10) NOT NULL COMMENT '結果個数',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  PRIMARY KEY (`medal_item_log_id`),
  KEY `uid` (`uid`,`medal_item_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='メダルアイテム増減ログ';



# Dump of table medal_item_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `medal_item_mst`;

CREATE TABLE `medal_item_mst` (
  `medal_item_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'メダルショップアイテムマスタID',
  `name` varchar(50) NOT NULL COMMENT 'メダルショップアイテム名',
  `img` varchar(50) NOT NULL COMMENT 'アイテム画像',
  `img_path` varchar(255) NOT NULL COMMENT 'Image path',
  `type` tinyint(1) unsigned NOT NULL COMMENT 'タイプ\ngame.yaml medal_item:type: で指定',
  `effect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '効果の種類\n\ntype 毎に指定が変わります\ngame.yaml\nmedal_item:*\nで指定\n\n',
  `value` int(10) NOT NULL DEFAULT '0' COMMENT '効果量',
  `medal_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '購入に必要なメダル数',
  `medal_price_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '購入に必要なメダル数\n予備\n上位メダル用',
  `limit_num` int(10) unsigned DEFAULT NULL COMMENT '購入制限数\nnull の場合は、制限無しになります',
  `set_item_mst_id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'セット売り時のアイテム１マスタID\n\nここに指定したIDのアイテムが\nset_num_1 個増えます',
  `set_num_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'セットアイテム１個数',
  `set_item_mst_id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'セット売り時のアイテム１マスタID\n\nここに指定したIDのアイテムが\nset_num_2 個増えます',
  `set_num_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'セットアイテム2個数',
  `set_item_mst_id_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'セット売り時のアイテム１マスタID\n\nここに指定したIDのアイテムが\nset_num_3 個増えます',
  `set_num_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'セットアイテム3個数',
  `set_item_mst_id_4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'セット売り時のアイテム１マスタID\n\nここに指定したIDのアイテムが\nset_num_4 個増えます',
  `set_num_4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'セットアイテム4個数',
  `set_item_mst_id_5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'セット売り時のアイテム１マスタID\n\nここに指定したIDのアイテムが\nset_num_5 個増えます',
  `set_num_5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'セットアイテム5個数',
  `set_item_mst_id_6` int(10) unsigned NOT NULL DEFAULT '0',
  `set_num_6` int(10) unsigned NOT NULL DEFAULT '0',
  `set_item_mst_id_7` int(10) unsigned NOT NULL DEFAULT '0',
  `set_num_7` int(10) unsigned NOT NULL DEFAULT '0',
  `set_item_mst_id_8` int(10) unsigned NOT NULL DEFAULT '0',
  `set_num_8` int(10) unsigned NOT NULL DEFAULT '0',
  `set_item_mst_id_9` int(10) unsigned NOT NULL DEFAULT '0',
  `set_num_9` int(10) unsigned NOT NULL DEFAULT '0',
  `set_item_mst_id_10` int(10) unsigned NOT NULL DEFAULT '0',
  `set_num_10` int(10) unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL COMMENT '説明',
  `can_buy` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '購入の可否（0：購入不可、1：購入可）',
  `view_order` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '表示順',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商品棚カテゴリ\n0:常設\n1:特設',
  `special` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'おまけ表示\n0:特に無し\n1:豪華な枠とかになるかも',
  `odd_even` tinyint(1) DEFAULT '0' COMMENT '0: all IDs, 1:odd, 2:even',
  `start` datetime DEFAULT '0000-00-00 00:00:00',
  `end` datetime DEFAULT '2020-01-01 00:00:00',
  `level_min` int(11) DEFAULT '0',
  `level_max` int(11) DEFAULT '999',
  PRIMARY KEY (`medal_item_mst_id`),
  KEY `can_buy` (`can_buy`),
  KEY `type` (`type`,`effect`),
  KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='メダルショップ用アイテムマスタ';



# Dump of table mini_tutorial_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mini_tutorial_data`;

CREATE TABLE `mini_tutorial_data` (
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `type` int(10) unsigned NOT NULL COMMENT 'ミニチュートリアルタイプ',
  `step` int(10) unsigned NOT NULL COMMENT 'ミニチュートリアル進行度',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`uid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ミニチュートリアル進行管理';



# Dump of table mission_area_drop_item_pattern_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_area_drop_item_pattern_mst`;

CREATE TABLE `mission_area_drop_item_pattern_mst` (
  `area_drop_pattern_id` int(10) unsigned NOT NULL COMMENT 'パターンID(1から連番)',
  `drop_rate_lucky_egg` int(10) unsigned NOT NULL COMMENT 'ラッキーエッグドロップ確率',
  `drop_rate_gvg_stamina` int(10) unsigned NOT NULL COMMENT 'ドロップ確率(gvg行動力(MP))',
  `drop_rate_gacha_point` int(10) unsigned NOT NULL COMMENT 'ドロップ確率(ガチャP)',
  `drop_rate_card` int(10) unsigned NOT NULL COMMENT 'ドロップ確率(カード)',
  `drop_rate_item` int(10) unsigned NOT NULL COMMENT 'ドロップ確率(アイテム)',
  `drop_rate_gvg_stamina_at_gvg` int(10) unsigned NOT NULL COMMENT 'GvG中\nドロップ確率(gvg行動力(MP))',
  `drop_rate_gacha_point_at_gvg` int(10) unsigned NOT NULL COMMENT 'GvG中\nドロップ確率(ガチャP)',
  `drop_rate_card_at_gvg` int(10) unsigned NOT NULL COMMENT 'GvG中\nドロップ確率(カード)',
  `drop_rate_item_at_gvg` int(10) unsigned NOT NULL COMMENT 'GvG中\nドロップ確率(アイテム)',
  PRIMARY KEY (`area_drop_pattern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='進撃ステージアイテムドロップ確率マスタ';



# Dump of table mission_area_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_area_mst`;

CREATE TABLE `mission_area_mst` (
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID(0から連番)',
  `area_name` varchar(255) NOT NULL COMMENT 'エリア名',
  `area_text` varchar(255) NOT NULL COMMENT 'エリア説明文',
  `area_map_id` int(10) unsigned NOT NULL COMMENT 'エリアマップID（マップ解決に使用）',
  `area_drop_pattern_id` int(10) unsigned NOT NULL COMMENT 'mission_area_drop_item_pattern_mst.area_drop_pattern_id',
  `extra_area_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'エクストラエリアフラグ',
  PRIMARY KEY (`area_id`),
  KEY `area_map_idx` (`area_map_id`,`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='進撃エリアマスタ';



# Dump of table mission_boss_drop_item_pattern_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_boss_drop_item_pattern_mst`;

CREATE TABLE `mission_boss_drop_item_pattern_mst` (
  `boss_drop_pattern_id` int(10) unsigned NOT NULL COMMENT 'ドロップパターンID(1から連番)',
  `min_drop_num` int(10) unsigned NOT NULL COMMENT '最小ドロップ数',
  `max_drop_num` int(10) unsigned NOT NULL COMMENT '最大ドロップ数',
  `drop_rate_item1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(アイテム１)',
  `drop_rate_item2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(アイテム２)',
  `drop_rate_item3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(アイテム３)',
  `drop_rate_item4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(アイテム４)',
  `drop_rate_item5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(アイテム５)',
  `drop_rate_item6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(アイテム６)',
  `drop_rate_item7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(アイテム７)',
  `drop_rate_item8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(アイテム８)',
  `drop_rate_item9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(アイテム９)',
  `drop_rate_item10` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(アイテム１０)',
  `drop_rate_card1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(カード１)',
  `drop_rate_card2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(カード２)',
  `drop_rate_card3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(カード３)',
  `drop_rate_card4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(カード４)',
  `drop_rate_card5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(カード５)',
  `drop_rate_card6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(カード６)',
  `drop_rate_card7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(カード７)',
  `drop_rate_card8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(カード８)',
  `drop_rate_card9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(カード９)',
  `drop_rate_card10` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップ確率(カード１０)',
  `drop_item_num1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム数１',
  `drop_item_num2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム数２',
  `drop_item_num3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム数３',
  `drop_item_num4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム数４',
  `drop_item_num5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム数５',
  `drop_item_num6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム数６',
  `drop_item_num7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム数７',
  `drop_item_num8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム数８',
  `drop_item_num9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム数９',
  `drop_item_num10` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム数１０',
  `drop_item_id1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID１',
  `drop_item_id2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID２',
  `drop_item_id3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID３',
  `drop_item_id4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID４',
  `drop_item_id5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID５',
  `drop_item_id6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID６',
  `drop_item_id7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID７',
  `drop_item_id8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID８',
  `drop_item_id9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID９',
  `drop_item_id10` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID１０',
  `drop_card_id1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID１',
  `drop_card_id2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID２',
  `drop_card_id3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID３',
  `drop_card_id4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID４',
  `drop_card_id5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID５',
  `drop_card_id6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID６',
  `drop_card_id7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID７',
  `drop_card_id8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID８',
  `drop_card_id9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID９',
  `drop_card_id10` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID１０',
  PRIMARY KEY (`boss_drop_pattern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ボスアイテムドロップマスタ';



# Dump of table mission_boss_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_boss_mst`;

CREATE TABLE `mission_boss_mst` (
  `boss_id` int(10) unsigned NOT NULL COMMENT 'ボスID(1から連番)',
  `boss_name` varchar(255) NOT NULL COMMENT 'ボス名',
  `boss_speech` varchar(255) NOT NULL COMMENT 'ボスセリフ',
  `boss_speech_win` varchar(255) NOT NULL COMMENT 'ボス勝ち台詞',
  `boss_speech_lose` varchar(255) NOT NULL COMMENT 'ボス負けセリフ',
  `boss_attack` int(10) unsigned NOT NULL COMMENT 'ボス攻撃力',
  `boss_defense` int(10) unsigned NOT NULL COMMENT 'ボス防御力',
  `use_stamina` int(10) unsigned NOT NULL COMMENT '進撃P消費',
  `mini_game_speed` int(10) unsigned NOT NULL COMMENT 'タイミングゲームのバーのスピード（最大で５）',
  `boss_exp` int(10) unsigned NOT NULL COMMENT 'ボス獲得経験値',
  `boss_money` int(10) unsigned NOT NULL COMMENT 'ボス獲得金額',
  `boss_gacha_point` int(10) unsigned NOT NULL COMMENT 'ボス獲得召喚P',
  `boss_drop_pattern_id` int(10) unsigned NOT NULL COMMENT 'mission_boss_drop_item_pattern_mst.boss_drop_pattern_id',
  `prev_direct_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '事前演出のシーンID',
  `win_direct_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '勝利時演出のシーンID',
  PRIMARY KEY (`boss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ボスマスタ';



# Dump of table mission_boss_user_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_boss_user_log`;

CREATE TABLE `mission_boss_user_log` (
  `boss_user_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `boss_id` int(10) unsigned NOT NULL COMMENT 'ボスID(1から連番)',
  `user_attack` int(10) unsigned NOT NULL COMMENT 'ユーザー攻撃力',
  `friend_uid1` int(10) unsigned NOT NULL COMMENT '助っ人フレンドUID１',
  `friend_uid2` int(10) unsigned NOT NULL COMMENT '助っ人フレンドUID２',
  `friend_uid3` int(10) unsigned NOT NULL COMMENT '助っ人フレンドUID３',
  `friend_attack1` int(10) unsigned NOT NULL COMMENT 'フレンド１攻撃力',
  `friend_attack2` int(10) unsigned NOT NULL COMMENT 'フレンド２攻撃力',
  `friend_attack3` int(10) unsigned NOT NULL COMMENT 'フレンド３攻撃力',
  `mini_game_timing` int(10) unsigned NOT NULL COMMENT 'ミニゲームで押したタイミング値（0～4）',
  `result` tinyint(1) NOT NULL DEFAULT '0' COMMENT '戦闘結果、1:勝利、0:敗北',
  `gain_exp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '獲得経験値',
  `gain_money` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '獲得金額',
  `gain_gacha` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '獲得ガチャP',
  `drop_type0` tinyint(1) NOT NULL DEFAULT '0' COMMENT '勝利時のドロップしたアイテムの種類1:カード、2:アイテム',
  `drop_item_id0` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'アイテムがドロップした際のアイテムID',
  `drop_item_num0` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'アイテムがドロップした際のアイテム数',
  `drop_card_id0` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'カードがドロップした際のカードID',
  `drop_type1` tinyint(1) NOT NULL DEFAULT '0' COMMENT '勝利時のドロップしたアイテムの種類1:カード、2:アイテム',
  `drop_item_id1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'アイテムがドロップした際のアイテムID',
  `drop_item_num1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'アイテムがドロップした際のアイテム数',
  `drop_card_id1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'カードがドロップした際のカードID',
  `drop_type2` tinyint(1) NOT NULL DEFAULT '0' COMMENT '勝利時のドロップしたアイテムの種類1:カード、2:アイテム',
  `drop_item_id2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'アイテムがドロップした際のアイテムID',
  `drop_item_num2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'アイテムがドロップした際のアイテム数',
  `drop_card_id2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'カードがドロップした際のカードID',
  `drop_type3` tinyint(1) NOT NULL DEFAULT '0' COMMENT '勝利時のドロップしたアイテムの種類1:カード、2:アイテム',
  `drop_item_id3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'アイテムがドロップした際のアイテムID',
  `drop_item_num3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'アイテムがドロップした際のアイテム数',
  `drop_card_id3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'カードがドロップした際のカードID',
  `drop_type4` tinyint(1) NOT NULL DEFAULT '0' COMMENT '勝利時のドロップしたアイテムの種類1:カード、2:アイテム',
  `drop_item_id4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'アイテムがドロップした際のアイテムID',
  `drop_item_num4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'アイテムがドロップした際のアイテム数',
  `drop_card_id4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'カードがドロップした際のカードID',
  `gain_stage_clear_parameter_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ステージクリア時に獲得したパラメータポイント（クリア時にもない場合がある）',
  `levelup_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'レベルアップフラグ（取得していない場合は0）',
  `first_clear_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'レベルアップしたかどうか？',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
  PRIMARY KEY (`boss_user_log_id`,`create_date`),
  KEY `user_boss_idx` (`uid`,`boss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ボス戦闘ログ'
/*!50100 PARTITION BY RANGE (UNIX_TIMESTAMP(create_date))
(PARTITION p20141110 VALUES LESS THAN (1415563200) ENGINE = InnoDB,
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



# Dump of table mission_monster_pattern_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_monster_pattern_mst`;

CREATE TABLE `mission_monster_pattern_mst` (
  `monster_pattern_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `monster_id` int(10) unsigned NOT NULL COMMENT 'モンスターID',
  `move_type` int(10) unsigned NOT NULL COMMENT '動き番号',
  PRIMARY KEY (`monster_pattern_id`,`monster_id`,`move_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冒険ザコマスタ　冒険で表示されるモンスター';



# Dump of table mission_stage_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_stage_mst`;

CREATE TABLE `mission_stage_mst` (
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID(0から連番)',
  `stage_id` int(10) unsigned NOT NULL COMMENT 'ステージID(0から連番)',
  `stage_name` varchar(255) NOT NULL COMMENT 'ステージ名',
  `use_stamina` int(10) unsigned NOT NULL COMMENT '体力消費量',
  `gain_step` int(10) unsigned NOT NULL COMMENT '取得達成度',
  `gain_exp` int(10) unsigned NOT NULL COMMENT '取得経験値',
  `gain_money_min` int(10) unsigned NOT NULL COMMENT '最小取得金額',
  `gain_money_max` int(10) unsigned NOT NULL COMMENT '最大取得金額',
  `gain_gvg_stamina` int(10) unsigned NOT NULL COMMENT '取得gvg行動力(MP)',
  `gain_gacha_point` int(10) unsigned NOT NULL COMMENT '取得ガチャP',
  `drop_card_id0` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID０',
  `drop_card_rate0` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカード確率０',
  `drop_card_id1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID１',
  `drop_card_rate1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカード確率１',
  `drop_card_id2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID２',
  `drop_card_rate2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカード確率２',
  `drop_card_id3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID３',
  `drop_card_rate3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカード確率３',
  `drop_card_id4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID４',
  `drop_card_rate4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカード確率４',
  `drop_card_id5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID５',
  `drop_card_rate5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカード確率５',
  `drop_card_id6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID６',
  `drop_card_rate6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカード確率６',
  `drop_card_id7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID７',
  `drop_card_rate7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカード確率７',
  `drop_card_id8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID８',
  `drop_card_rate8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカード確率８',
  `drop_card_id9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカードID９',
  `drop_card_rate9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップカード確率９',
  `drop_item_id0` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID０',
  `drop_item_rate0` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム確率０',
  `drop_item_id1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID１',
  `drop_item_rate1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム確率１',
  `drop_item_id2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムD２',
  `drop_item_rate2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム確率２',
  `drop_item_id3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID３',
  `drop_item_rate3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム確率３',
  `drop_item_id4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID４',
  `drop_item_rate4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム確率４',
  `drop_item_id5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID５',
  `drop_item_rate5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム確率５',
  `drop_item_id6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムD６',
  `drop_item_rate6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム確率６',
  `drop_item_id7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID７',
  `drop_item_rate7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム確率７',
  `drop_item_id8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID８',
  `drop_item_rate8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム確率８',
  `drop_item_id9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテムID９',
  `drop_item_rate9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ドロップアイテム確率９',
  `gain_parameter_point` int(10) unsigned NOT NULL COMMENT 'クリア時に獲得するパラメータポイント',
  `monster_pattern_id` int(10) unsigned NOT NULL COMMENT 'mission_monster_pattern_mst.monster_pattern_id',
  `boss_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'mission_boss_mst.boss_id(存在しない場合はゼロ)',
  `opening_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'オープニングのシーンID',
  `ending_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'エンディングのシーンID',
  PRIMARY KEY (`area_id`,`stage_id`),
  KEY `area_boss_idx` (`stage_id`,`area_id`,`boss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ミッションステージマスタ';



# Dump of table mission_stage_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_stage_user_data`;

CREATE TABLE `mission_stage_user_data` (
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID',
  `stage_id` int(10) unsigned NOT NULL COMMENT 'ステージID',
  `step` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '進行度',
  `rest_action_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '次イベントまでのステップ数',
  `gain_card0` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カード取得フラグ０',
  `gain_card1` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カード取得フラグ１',
  `gain_card2` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カード取得フラグ２',
  `gain_card3` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カード取得フラグ３',
  `gain_card4` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カード取得フラグ４',
  `gain_card5` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カード取得フラグ５',
  `gain_card6` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カード取得フラグ６',
  `gain_card7` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カード取得フラグ７',
  `gain_card8` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カード取得フラグ８',
  `gain_card9` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カード取得フラグ９',
  `card_complete` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カードコンプフラグ',
  `stage_opening_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ステージオープニングをすでに見ているかどうか',
  `stage_ending_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ステージエンディングをすでに見ているかどうか？',
  `boss_prev_direct_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ボス事前会話をすでに見ているかどうか',
  `boss_win_direct_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ボス勝利時会話をすでに見ているかどうか',
  `boss_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ボスフラグ(ボスのいる面で1初期化され倒されると0になる)',
  `clear_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'クリアフラグ一度でもクリアすれば１',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登録日時',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新日時',
  PRIMARY KEY (`uid`,`stage_id`,`area_id`),
  KEY `area_idx` (`area_id`,`stage_id`),
  KEY `card_complete_idx` (`uid`,`stage_id`,`card_complete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ユーザーごとのクエスト状況';



# Dump of table mission_stage_user_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_stage_user_log`;

CREATE TABLE `mission_stage_user_log` (
  `stage_user_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID',
  `stage_id` int(10) unsigned NOT NULL COMMENT 'ステージID',
  `step` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '進行度',
  `rest_action_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '次イベントまでのステップ数',
  `force_drop_cristal_rest_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クリスタル以外がドロップした際にカウントアップされる数',
  `max_exp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '次のレベルアップまでの経験値',
  `exp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '現在の経験値',
  `appear_boss` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ボス出現フラグ（出現していない場合は0）',
  `reserve_stamina` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '残りスタミナ',
  `next_no_stamina` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'スタミナ切れフラグ(次進めないのなら１)',
  `gain_step` int(10) unsigned NOT NULL COMMENT '取得達成度',
  `gain_exp` int(10) unsigned NOT NULL COMMENT '取得経験値',
  `gain_money` int(10) unsigned NOT NULL COMMENT '取得金額',
  `gain_gvg_stamina` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '取得GvGスタミナ（取得していない場合は0）',
  `gain_gacha_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '召喚ポイント入手額（取得していない場合は0）',
  `gain_lucky_egg` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ラッキーエッグ入手フラグ（取得していない場合は0）',
  `gain_card_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '入手カードID（取得していない場合は0）',
  `gain_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '入手アイテムID（取得していない場合は0）',
  `card_sell_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カードを取得後すぐに売った場合は１',
  `gain_stage_clear_parameter_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ステージクリア時に獲得したパラメータポイント（クリア時にもない場合がある）',
  `levelup_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'レベルアップフラグ（取得していない場合は0）',
  `first_clear_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '初回クリアかどうか？（初回クリアの場合は1）',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
  PRIMARY KEY (`stage_user_log_id`,`create_date`),
  KEY `user_stage_idx` (`uid`,`area_id`),
  KEY `user_date_idx` (`uid`,`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ユーザーごとのクエスト状況'
/*!50100 PARTITION BY RANGE (UNIX_TIMESTAMP(create_date))
(PARTITION p20141110 VALUES LESS THAN (1415563200) ENGINE = InnoDB,
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



# Dump of table mission_story_character_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_story_character_mst`;

CREATE TABLE `mission_story_character_mst` (
  `story_id` int(10) unsigned NOT NULL COMMENT 'ストーリーID(1から連番)',
  `character_img_name1` varchar(255) NOT NULL COMMENT 'キャラクター１イメージ名',
  `character_img_name2` varchar(255) NOT NULL COMMENT 'キャラクター２イメージ名',
  `character_img_name3` varchar(255) NOT NULL COMMENT 'キャラクター３イメージ名',
  `character_img_name4` varchar(255) NOT NULL COMMENT 'キャラクター４イメージ名',
  `character_img_name5` varchar(255) NOT NULL COMMENT 'キャラクター５イメージ名',
  `character_img_name6` varchar(255) NOT NULL COMMENT 'キャラクター６イメージ名',
  `character_img_name7` varchar(255) NOT NULL COMMENT 'キャラクター７イメージ名',
  `character_img_name8` varchar(255) NOT NULL COMMENT 'キャラクター８イメージ名',
  `character_img_name9` varchar(255) NOT NULL COMMENT 'キャラクター９イメージ名',
  `character_img_name10` varchar(255) NOT NULL COMMENT 'キャラクター１０イメージ名',
  PRIMARY KEY (`story_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ストーリーキャラクターマスター';



# Dump of table mission_story_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_story_mst`;

CREATE TABLE `mission_story_mst` (
  `story_id` int(10) unsigned NOT NULL COMMENT 'ストーリーID(1から連番)',
  `scene_id` int(10) unsigned NOT NULL COMMENT 'シーンID(1から連番)この順番で再生される',
  `position_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '左右どちらに配置(0=左,1=右)',
  `character_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '表示する画像ID(0=表示なし,1～10迄はラフィー、11以降が設定したキャラ)',
  `motion_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '動き(0=なし,1=ﾌﾚｰﾑｲﾝ,2=ﾌﾚｰﾑｱｳﾄ,3=ﾌｪｰﾄﾞｲﾝ,4=ﾌｪｰﾄﾞｱｳﾄ,5=びっくり,6=怒,7=ﾀﾞﾒｰｼﾞ,8=死亡,)',
  `speak_effect_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=無し,1=・・・,2=！？,3=？,4=！',
  `scene_effect_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '画面全体の演出(0=無し,1=画面揺れ,2=バトル突入,3=会話終了,4=ﾌｪｰﾄﾞｲﾝ白,5=ﾌｪｰﾄﾞｱｳﾄ白,6=ﾌｪｰﾄﾞｲﾝ黒,7=ﾌｪｰﾄﾞｱｳﾄ黒,)',
  `speak_decorate_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'セリフの文字が大きくなる(0=OFF,1=ON)　※ビックリした時とか使える',
  `character_name` varchar(255) NOT NULL COMMENT 'セリフを喋るキャラの名前',
  `speak_text` varchar(255) NOT NULL COMMENT 'テキストウィンドウに表示されるセリフ',
  PRIMARY KEY (`story_id`,`scene_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会話シーンマスタ';



# Dump of table mission_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mission_user_data`;

CREATE TABLE `mission_user_data` (
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `clear_area_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クリアエリアID',
  `clear_stage_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クリアステージID',
  `old_mission_parameter_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '旧進撃取得パラメータポイント',
  `mission_parameter_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新進撃取得パラメータポイント',
  `prologue_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'プロローグフラグ（プロローグを見たかどうかのフラグ）',
  `tutorial_clear_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'チュートリアルクリアフラグ',
  `tutorial_step` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'チュートリアルステップ',
  `force_drop_cristal_rest_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クリスタル以外がドロップした際にカウントアップされる数',
  `disp_area_map_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '現在表示しているエリアMAPID',
  `fps_speed` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画面での速度指定（１～４）',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新日時',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ユーザーごとの進撃状況';



# Dump of table opening_img
# ------------------------------------------------------------

DROP TABLE IF EXISTS `opening_img`;

CREATE TABLE `opening_img` (
  `opening_img_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `img_iphone5` varchar(512) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`opening_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table opening_quest_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `opening_quest_data`;

CREATE TABLE `opening_quest_data` (
  `opening_quest_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT 'アプリで使用されるユニークID',
  `opening_quest_mst_id` int(10) unsigned NOT NULL COMMENT 'スタートダッシュマスタID',
  `complete_status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'コンプリート状況 0:未達成 1:達成 2:アイテムBOX配布済み',
  `get_item_date` datetime DEFAULT NULL COMMENT 'アイテム取得日時',
  `insert_date` datetime NOT NULL COMMENT 'システム登録日',
  `update_date` datetime NOT NULL COMMENT 'システムデータ更新日',
  PRIMARY KEY (`opening_quest_data_id`),
  KEY `uid` (`uid`,`complete_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スタートダッシュクエスト';



# Dump of table opening_quest_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `opening_quest_mst`;

CREATE TABLE `opening_quest_mst` (
  `opening_quest_mst_id` int(11) NOT NULL,
  `group` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'グループ',
  `title` varchar(120) NOT NULL COMMENT 'タイトル',
  `detail` varchar(256) NOT NULL COMMENT '1行説明',
  `link_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '分類(リンク先種類) 0:冒険 1:召喚 2:ギルド 3:合成 4:パーティ 5:バトル 6:ダーク',
  `item_mst_id` int(10) unsigned NOT NULL COMMENT 'アイテムID',
  `gift_type` smallint(5) unsigned NOT NULL COMMENT 'ギフトタイプ 80:ﾓﾝｽﾀｰ 81:ｱｲﾃﾑ 82:ﾓﾝﾌﾟﾁ 83:召喚p',
  `gift_num` mediumint(8) unsigned NOT NULL COMMENT 'ギフトの種類',
  PRIMARY KEY (`opening_quest_mst_id`),
  KEY `group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='マスタスタートダッシュクエスト';



# Dump of table opening_quest_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `opening_quest_state`;

CREATE TABLE `opening_quest_state` (
  `openingquest_state_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーＩＤ',
  `adv_card_get_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '進撃で取得のカードの数',
  `gacha_normal_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ノーマルガチャ実行数',
  `profile_change` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'プロフィール変更',
  `present_send` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'プレゼント送信',
  `gvg_join` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'ＧｖＧ参加',
  `trade_send` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'トレード申請',
  `coin_exchange` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '交換所交換',
  `evol_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '限界突破回数',
  `final_evol_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最終限界突破回数',
  `greeting_send` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '挨拶したかどうか',
  `powerup_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '強化の最高レベル',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `bonus_card_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'カードのMAX値のボーナス',
  `bonus_time_sec` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '減算される回復時間ボーナス',
  `help_view` tinyint(4) NOT NULL DEFAULT '0' COMMENT '初回だけヘルプに飛ぶ',
  PRIMARY KEY (`openingquest_state_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table partition_manager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `partition_manager`;

CREATE TABLE `partition_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(45) NOT NULL,
  `partition_name` varchar(45) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expire_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delete_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_name` (`table_name`,`partition_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table payment_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment_log`;

CREATE TABLE `payment_log` (
  `payment_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '購入ログID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `type` tinyint(4) NOT NULL COMMENT '購入種類',
  `data_id` int(10) unsigned NOT NULL COMMENT '購入データID（アイテムマスタID等）',
  `unit_price` int(10) unsigned NOT NULL COMMENT '購入単価',
  `num` int(10) unsigned NOT NULL COMMENT '購入数',
  `total_price` int(10) unsigned NOT NULL COMMENT '合計金額',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  `gacha_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`payment_log_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='購入ログ';



# Dump of table platform_login_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `platform_login_history`;

CREATE TABLE `platform_login_history` (
  `platform_login_history_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'login/logout操作ヒストリ',
  `pokelabo_id` bigint(20) unsigned NOT NULL COMMENT 'ポケラボID',
  `login_uuid` varchar(128) DEFAULT NULL COMMENT 'LOGIN uuid',
  `logout_uuid` varchar(128) DEFAULT NULL COMMENT 'LOGOUT uuid',
  `error_code` tinyint(4) NOT NULL DEFAULT '-1' COMMENT 'エラーコード\n-1処理中\n0:正常終了\n99:CSツールにより削除',
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム登録日',
  PRIMARY KEY (`platform_login_history_id`,`insert_date`),
  KEY `pokelabo_id` (`pokelabo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE (UNIX_TIMESTAMP(insert_date))
(PARTITION p20130618 VALUES LESS THAN (1371538800) ENGINE = InnoDB,
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



# Dump of table pokelabo_reward
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pokelabo_reward`;

CREATE TABLE `pokelabo_reward` (
  `uid` int(10) unsigned NOT NULL COMMENT 'uid',
  `app_id` int(10) unsigned NOT NULL COMMENT 'app_id\n1:戦国\n2:モンパラ\n3:三国',
  `invite_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '各アプリからの取得済み招待者カウント',
  PRIMARY KEY (`uid`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ポケラボリワード用';



# Dump of table pokelabo_reward_2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pokelabo_reward_2`;

CREATE TABLE `pokelabo_reward_2` (
  `uid` int(11) NOT NULL COMMENT 'ユーザーID',
  `app_id` int(11) NOT NULL COMMENT 'アプリID　0,戦国 1,モンパラ 2,三国 3,ミスモン',
  `invite_cnt` int(11) NOT NULL COMMENT '各アプリからの取得済み招待者カウント',
  PRIMARY KEY (`uid`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ポケラボリワード２';



# Dump of table pokelogger
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pokelogger`;

CREATE TABLE `pokelogger` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'ユーザID',
  `begin_on` decimal(20,7) NOT NULL COMMENT 'ログ開始時刻',
  `end_on` decimal(20,7) NOT NULL COMMENT 'ログ終了時刻',
  `request_method` varchar(8) NOT NULL COMMENT 'リクエスト種別',
  `url` varchar(255) NOT NULL COMMENT 'url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pokelogger_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pokelogger_data`;

CREATE TABLE `pokelogger_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ポケロガーID',
  `log_id` int(10) unsigned NOT NULL COMMENT 'pokelogger.id',
  `time` decimal(20,7) NOT NULL COMMENT 'データ出力時刻',
  `type` tinyint(3) unsigned NOT NULL COMMENT 'データ種別\r\n1:リクエストヘッダ, \r\n2:レスポンスヘッダ, \r\n3:ブラウザ出力 \r\n4: 文字列, \r\n5: PHPオブジェクト, \r\n6: JSONデータ'',',
  `level` tinyint(4) NOT NULL COMMENT '出力レベル\r\n1:FATAL, \r\n2:ERROR, \r\n3:WARN, \r\n4:INFO, \r\n5:DEBUG''',
  `data` longblob COMMENT '出力データ',
  `file_name` varchar(255) DEFAULT NULL COMMENT '発生ファイル名',
  `line` int(10) NOT NULL DEFAULT '0' COMMENT '発生行',
  PRIMARY KEY (`id`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table preregist_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `preregist_data`;

CREATE TABLE `preregist_data` (
  `regist_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '事前登録id',
  `uid` int(10) unsigned NOT NULL COMMENT 'uid ',
  PRIMARY KEY (`regist_id`),
  UNIQUE KEY `uniq_uid` (`uid`),
  UNIQUE KEY `uniq_rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='事前登録';



# Dump of table purchase_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_history`;

CREATE TABLE `purchase_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_id` varchar(256) NOT NULL COMMENT 'プロダクトコード',
  `transaction_id` varchar(255) NOT NULL COMMENT 'トランザクションID',
  `user_id` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `status` tinyint(3) unsigned NOT NULL COMMENT '購入ステータス',
  `market_id` tinyint(3) unsigned NOT NULL COMMENT '購入元',
  `term_of_payment` tinyint(3) unsigned DEFAULT NULL COMMENT '支払方法',
  `add_by_tool` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'CSツール/バッチによる付与',
  `start_date` datetime NOT NULL COMMENT '購入処理開始日時',
  `end_date` datetime DEFAULT NULL COMMENT '購入処理終了日時',
  `insert_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` datetime DEFAULT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `product_id` (`product_id`(255),`user_id`),
  KEY `user_id` (`user_id`),
  KEY `add_by_tool` (`add_by_tool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='購入履歴';



# Dump of table purchase_money_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_money_data`;

CREATE TABLE `purchase_money_data` (
  `purchase_money_data_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '課金ポイントデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `purchase_money` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '課金ポイント',
  `total_use_purchase_money` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '総消費課金ポイント',
  `create_date` datetime NOT NULL COMMENT '作成日',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`purchase_money_data_id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='課金ポイントデータ';



# Dump of table purchase_request_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_request_history`;

CREATE TABLE `purchase_request_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `transaction_id` varchar(255) NOT NULL COMMENT 'トランザクションID',
  `receipt` text NOT NULL COMMENT 'レシート',
  `status` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '状態 -1: 処理開始, 0: 正常付与, 1: 多重送信, 2: 付与済, 3: AppStore通信エラー, 4: レシート不正, 5: コイン付与失敗, 99: 例外発生',
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新日時',
  PRIMARY KEY (`id`,`insert_date`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='購入リクエスト履歴'
/*!50100 PARTITION BY RANGE (unix_timestamp(insert_date))
(PARTITION p20130607 VALUES LESS THAN (1370588400) ENGINE = InnoDB,
 PARTITION p20130608 VALUES LESS THAN (1370674800) ENGINE = InnoDB,
 PARTITION p20130609 VALUES LESS THAN (1370761200) ENGINE = InnoDB,
 PARTITION p20130610 VALUES LESS THAN (1370847600) ENGINE = InnoDB,
 PARTITION p20130611 VALUES LESS THAN (1370934000) ENGINE = InnoDB,
 PARTITION p20130612 VALUES LESS THAN (1371020400) ENGINE = InnoDB,
 PARTITION p20130613 VALUES LESS THAN (1371106800) ENGINE = InnoDB,
 PARTITION p20130614 VALUES LESS THAN (1371193200) ENGINE = InnoDB,
 PARTITION p20130615 VALUES LESS THAN (1371279600) ENGINE = InnoDB,
 PARTITION p20130617 VALUES LESS THAN (1371452400) ENGINE = InnoDB,
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
 PARTITION p20140911 VALUES LESS THAN (1410379200) ENGINE = InnoDB,
 PARTITION p20140912 VALUES LESS THAN (1410465600) ENGINE = InnoDB,
 PARTITION p20140913 VALUES LESS THAN (1410552000) ENGINE = InnoDB,
 PARTITION p20140914 VALUES LESS THAN (1410638400) ENGINE = InnoDB,
 PARTITION p20140915 VALUES LESS THAN (1410724800) ENGINE = InnoDB,
 PARTITION p20140916 VALUES LESS THAN (1410811200) ENGINE = InnoDB,
 PARTITION p20140917 VALUES LESS THAN (1410897600) ENGINE = InnoDB,
 PARTITION p20140918 VALUES LESS THAN (1410984000) ENGINE = InnoDB,
 PARTITION p20140919 VALUES LESS THAN (1411070400) ENGINE = InnoDB,
 PARTITION p20140920 VALUES LESS THAN (1411156800) ENGINE = InnoDB,
 PARTITION p20140921 VALUES LESS THAN (1411243200) ENGINE = InnoDB,
 PARTITION p20140922 VALUES LESS THAN (1411329600) ENGINE = InnoDB,
 PARTITION p20140923 VALUES LESS THAN (1411416000) ENGINE = InnoDB,
 PARTITION p20140924 VALUES LESS THAN (1411502400) ENGINE = InnoDB,
 PARTITION p20140925 VALUES LESS THAN (1411588800) ENGINE = InnoDB,
 PARTITION p20140926 VALUES LESS THAN (1411675200) ENGINE = InnoDB,
 PARTITION p20140927 VALUES LESS THAN (1411761600) ENGINE = InnoDB,
 PARTITION p20140928 VALUES LESS THAN (1411848000) ENGINE = InnoDB,
 PARTITION p20140929 VALUES LESS THAN (1411934400) ENGINE = InnoDB,
 PARTITION p20140930 VALUES LESS THAN (1412020800) ENGINE = InnoDB,
 PARTITION p20141001 VALUES LESS THAN (1412107200) ENGINE = InnoDB,
 PARTITION p20141002 VALUES LESS THAN (1412193600) ENGINE = InnoDB,
 PARTITION p20141003 VALUES LESS THAN (1412280000) ENGINE = InnoDB,
 PARTITION p20141004 VALUES LESS THAN (1412366400) ENGINE = InnoDB,
 PARTITION p20141005 VALUES LESS THAN (1412452800) ENGINE = InnoDB,
 PARTITION p20141006 VALUES LESS THAN (1412539200) ENGINE = InnoDB,
 PARTITION p20141007 VALUES LESS THAN (1412625600) ENGINE = InnoDB,
 PARTITION p20141008 VALUES LESS THAN (1412712000) ENGINE = InnoDB,
 PARTITION p20141009 VALUES LESS THAN (1412798400) ENGINE = InnoDB,
 PARTITION p20141010 VALUES LESS THAN (1412884800) ENGINE = InnoDB,
 PARTITION p20141011 VALUES LESS THAN (1412971200) ENGINE = InnoDB,
 PARTITION p20141012 VALUES LESS THAN (1413057600) ENGINE = InnoDB,
 PARTITION p20141013 VALUES LESS THAN (1413144000) ENGINE = InnoDB,
 PARTITION p20141014 VALUES LESS THAN (1413230400) ENGINE = InnoDB,
 PARTITION p20141015 VALUES LESS THAN (1413316800) ENGINE = InnoDB,
 PARTITION p20141016 VALUES LESS THAN (1413403200) ENGINE = InnoDB,
 PARTITION p20141017 VALUES LESS THAN (1413489600) ENGINE = InnoDB,
 PARTITION p20141018 VALUES LESS THAN (1413576000) ENGINE = InnoDB,
 PARTITION p20141019 VALUES LESS THAN (1413662400) ENGINE = InnoDB,
 PARTITION p20141020 VALUES LESS THAN (1413748800) ENGINE = InnoDB,
 PARTITION p20141021 VALUES LESS THAN (1413835200) ENGINE = InnoDB,
 PARTITION p20141022 VALUES LESS THAN (1413921600) ENGINE = InnoDB,
 PARTITION p20141023 VALUES LESS THAN (1414008000) ENGINE = InnoDB,
 PARTITION p20141024 VALUES LESS THAN (1414094400) ENGINE = InnoDB,
 PARTITION p20141025 VALUES LESS THAN (1414180800) ENGINE = InnoDB,
 PARTITION p20141026 VALUES LESS THAN (1414267200) ENGINE = InnoDB,
 PARTITION p20141027 VALUES LESS THAN (1414353600) ENGINE = InnoDB,
 PARTITION p20141028 VALUES LESS THAN (1414440000) ENGINE = InnoDB,
 PARTITION p20141029 VALUES LESS THAN (1414526400) ENGINE = InnoDB,
 PARTITION p20141030 VALUES LESS THAN (1414612800) ENGINE = InnoDB,
 PARTITION p20141031 VALUES LESS THAN (1414699200) ENGINE = InnoDB,
 PARTITION p20141101 VALUES LESS THAN (1414785600) ENGINE = InnoDB,
 PARTITION p20141102 VALUES LESS THAN (1414872000) ENGINE = InnoDB,
 PARTITION p20141103 VALUES LESS THAN (1414958400) ENGINE = InnoDB,
 PARTITION p20141104 VALUES LESS THAN (1415044800) ENGINE = InnoDB,
 PARTITION p20141105 VALUES LESS THAN (1415131200) ENGINE = InnoDB,
 PARTITION p20141106 VALUES LESS THAN (1415217600) ENGINE = InnoDB,
 PARTITION p20141107 VALUES LESS THAN (1415304000) ENGINE = InnoDB,
 PARTITION p20141108 VALUES LESS THAN (1415390400) ENGINE = InnoDB,
 PARTITION p20141109 VALUES LESS THAN (1415476800) ENGINE = InnoDB,
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



# Dump of table purchase_request_history_android
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_request_history_android`;

CREATE TABLE `purchase_request_history_android` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `product_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'トランザクションID',
  `order_number` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '-1 start, 0 success, 1 cancelled, 3 unavailable, 4 item unavailable, 5 api dev error, 6 api error, 7 already owned, 8 not owned',
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新日時',
  PRIMARY KEY (`id`,`insert_date`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='購入リクエスト履歴'
/*!50100 PARTITION BY RANGE (unix_timestamp(insert_date))
(PARTITION p20130628 VALUES LESS THAN (1372402800) ENGINE = InnoDB,
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
 PARTITION p20130720 VALUES LESS THAN (1374303600) ENGINE = InnoDB,
 PARTITION p20130721 VALUES LESS THAN (1374390000) ENGINE = InnoDB,
 PARTITION p20130722 VALUES LESS THAN (1374476400) ENGINE = InnoDB,
 PARTITION p20130723 VALUES LESS THAN (1374562800) ENGINE = InnoDB,
 PARTITION p20130724 VALUES LESS THAN (1374649200) ENGINE = InnoDB,
 PARTITION p20130725 VALUES LESS THAN (1374735600) ENGINE = InnoDB,
 PARTITION p20130726 VALUES LESS THAN (1374822000) ENGINE = InnoDB,
 PARTITION p20130727 VALUES LESS THAN (1374908400) ENGINE = InnoDB,
 PARTITION p20130728 VALUES LESS THAN (1374994800) ENGINE = InnoDB,
 PARTITION p20130729 VALUES LESS THAN (1375081200) ENGINE = InnoDB,
 PARTITION p20130730 VALUES LESS THAN (1375167600) ENGINE = InnoDB,
 PARTITION p20130731 VALUES LESS THAN (1375254000) ENGINE = InnoDB,
 PARTITION p20130801 VALUES LESS THAN (1375340400) ENGINE = InnoDB,
 PARTITION p20130802 VALUES LESS THAN (1375426800) ENGINE = InnoDB,
 PARTITION p20130803 VALUES LESS THAN (1375513200) ENGINE = InnoDB,
 PARTITION p20130804 VALUES LESS THAN (1375599600) ENGINE = InnoDB,
 PARTITION p20130805 VALUES LESS THAN (1375686000) ENGINE = InnoDB,
 PARTITION p20130806 VALUES LESS THAN (1375772400) ENGINE = InnoDB,
 PARTITION p20130807 VALUES LESS THAN (1375858800) ENGINE = InnoDB,
 PARTITION p20130808 VALUES LESS THAN (1375945200) ENGINE = InnoDB,
 PARTITION p20130809 VALUES LESS THAN (1376031600) ENGINE = InnoDB,
 PARTITION p20130810 VALUES LESS THAN (1376118000) ENGINE = InnoDB,
 PARTITION p20130811 VALUES LESS THAN (1376204400) ENGINE = InnoDB,
 PARTITION p20130812 VALUES LESS THAN (1376290800) ENGINE = InnoDB,
 PARTITION p20130813 VALUES LESS THAN (1376377200) ENGINE = InnoDB,
 PARTITION p20130814 VALUES LESS THAN (1376463600) ENGINE = InnoDB,
 PARTITION p20130815 VALUES LESS THAN (1376550000) ENGINE = InnoDB,
 PARTITION p20130816 VALUES LESS THAN (1376636400) ENGINE = InnoDB,
 PARTITION p20130817 VALUES LESS THAN (1376722800) ENGINE = InnoDB,
 PARTITION p20130818 VALUES LESS THAN (1376809200) ENGINE = InnoDB,
 PARTITION p20130819 VALUES LESS THAN (1376895600) ENGINE = InnoDB,
 PARTITION p20130820 VALUES LESS THAN (1376982000) ENGINE = InnoDB,
 PARTITION p20130821 VALUES LESS THAN (1377068400) ENGINE = InnoDB,
 PARTITION p20130822 VALUES LESS THAN (1377154800) ENGINE = InnoDB,
 PARTITION p20130823 VALUES LESS THAN (1377241200) ENGINE = InnoDB,
 PARTITION p20130824 VALUES LESS THAN (1377327600) ENGINE = InnoDB,
 PARTITION p20130825 VALUES LESS THAN (1377414000) ENGINE = InnoDB,
 PARTITION p20130826 VALUES LESS THAN (1377500400) ENGINE = InnoDB,
 PARTITION p20130827 VALUES LESS THAN (1377586800) ENGINE = InnoDB,
 PARTITION p20130828 VALUES LESS THAN (1377673200) ENGINE = InnoDB,
 PARTITION p20130829 VALUES LESS THAN (1377759600) ENGINE = InnoDB,
 PARTITION p20130830 VALUES LESS THAN (1377846000) ENGINE = InnoDB,
 PARTITION p20130831 VALUES LESS THAN (1377932400) ENGINE = InnoDB,
 PARTITION p20130901 VALUES LESS THAN (1378018800) ENGINE = InnoDB,
 PARTITION p20130902 VALUES LESS THAN (1378105200) ENGINE = InnoDB,
 PARTITION p20130903 VALUES LESS THAN (1378191600) ENGINE = InnoDB,
 PARTITION p20130904 VALUES LESS THAN (1378278000) ENGINE = InnoDB,
 PARTITION p20130905 VALUES LESS THAN (1378364400) ENGINE = InnoDB,
 PARTITION p20130906 VALUES LESS THAN (1378450800) ENGINE = InnoDB,
 PARTITION p20130907 VALUES LESS THAN (1378537200) ENGINE = InnoDB,
 PARTITION p20130908 VALUES LESS THAN (1378623600) ENGINE = InnoDB,
 PARTITION p20130909 VALUES LESS THAN (1378710000) ENGINE = InnoDB,
 PARTITION p20130910 VALUES LESS THAN (1378796400) ENGINE = InnoDB,
 PARTITION p20130911 VALUES LESS THAN (1378882800) ENGINE = InnoDB,
 PARTITION p20130912 VALUES LESS THAN (1378969200) ENGINE = InnoDB,
 PARTITION p20130913 VALUES LESS THAN (1379055600) ENGINE = InnoDB,
 PARTITION p20130914 VALUES LESS THAN (1379142000) ENGINE = InnoDB,
 PARTITION p20130915 VALUES LESS THAN (1379228400) ENGINE = InnoDB,
 PARTITION p20130916 VALUES LESS THAN (1379314800) ENGINE = InnoDB,
 PARTITION p20130917 VALUES LESS THAN (1379401200) ENGINE = InnoDB,
 PARTITION p20130918 VALUES LESS THAN (1379487600) ENGINE = InnoDB,
 PARTITION p20130919 VALUES LESS THAN (1379574000) ENGINE = InnoDB,
 PARTITION p20130920 VALUES LESS THAN (1379660400) ENGINE = InnoDB,
 PARTITION p20130921 VALUES LESS THAN (1379746800) ENGINE = InnoDB,
 PARTITION p20130922 VALUES LESS THAN (1379833200) ENGINE = InnoDB,
 PARTITION p20130923 VALUES LESS THAN (1379919600) ENGINE = InnoDB,
 PARTITION p20130924 VALUES LESS THAN (1380006000) ENGINE = InnoDB,
 PARTITION p20130925 VALUES LESS THAN (1380092400) ENGINE = InnoDB,
 PARTITION p20130926 VALUES LESS THAN (1380178800) ENGINE = InnoDB,
 PARTITION p20130927 VALUES LESS THAN (1380265200) ENGINE = InnoDB,
 PARTITION p20140911 VALUES LESS THAN (1410379200) ENGINE = InnoDB,
 PARTITION p20140912 VALUES LESS THAN (1410465600) ENGINE = InnoDB,
 PARTITION p20140913 VALUES LESS THAN (1410552000) ENGINE = InnoDB,
 PARTITION p20140914 VALUES LESS THAN (1410638400) ENGINE = InnoDB,
 PARTITION p20140915 VALUES LESS THAN (1410724800) ENGINE = InnoDB,
 PARTITION p20140916 VALUES LESS THAN (1410811200) ENGINE = InnoDB,
 PARTITION p20140917 VALUES LESS THAN (1410897600) ENGINE = InnoDB,
 PARTITION p20140918 VALUES LESS THAN (1410984000) ENGINE = InnoDB,
 PARTITION p20140919 VALUES LESS THAN (1411070400) ENGINE = InnoDB,
 PARTITION p20140920 VALUES LESS THAN (1411156800) ENGINE = InnoDB,
 PARTITION p20140921 VALUES LESS THAN (1411243200) ENGINE = InnoDB,
 PARTITION p20140922 VALUES LESS THAN (1411329600) ENGINE = InnoDB,
 PARTITION p20140923 VALUES LESS THAN (1411416000) ENGINE = InnoDB,
 PARTITION p20140924 VALUES LESS THAN (1411502400) ENGINE = InnoDB,
 PARTITION p20140925 VALUES LESS THAN (1411588800) ENGINE = InnoDB,
 PARTITION p20140926 VALUES LESS THAN (1411675200) ENGINE = InnoDB,
 PARTITION p20140927 VALUES LESS THAN (1411761600) ENGINE = InnoDB,
 PARTITION p20140928 VALUES LESS THAN (1411848000) ENGINE = InnoDB,
 PARTITION p20140929 VALUES LESS THAN (1411934400) ENGINE = InnoDB,
 PARTITION p20140930 VALUES LESS THAN (1412020800) ENGINE = InnoDB,
 PARTITION p20141001 VALUES LESS THAN (1412107200) ENGINE = InnoDB,
 PARTITION p20141002 VALUES LESS THAN (1412193600) ENGINE = InnoDB,
 PARTITION p20141003 VALUES LESS THAN (1412280000) ENGINE = InnoDB,
 PARTITION p20141004 VALUES LESS THAN (1412366400) ENGINE = InnoDB,
 PARTITION p20141005 VALUES LESS THAN (1412452800) ENGINE = InnoDB,
 PARTITION p20141006 VALUES LESS THAN (1412539200) ENGINE = InnoDB,
 PARTITION p20141007 VALUES LESS THAN (1412625600) ENGINE = InnoDB,
 PARTITION p20141008 VALUES LESS THAN (1412712000) ENGINE = InnoDB,
 PARTITION p20141009 VALUES LESS THAN (1412798400) ENGINE = InnoDB,
 PARTITION p20141010 VALUES LESS THAN (1412884800) ENGINE = InnoDB,
 PARTITION p20141011 VALUES LESS THAN (1412971200) ENGINE = InnoDB,
 PARTITION p20141012 VALUES LESS THAN (1413057600) ENGINE = InnoDB,
 PARTITION p20141013 VALUES LESS THAN (1413144000) ENGINE = InnoDB,
 PARTITION p20141014 VALUES LESS THAN (1413230400) ENGINE = InnoDB,
 PARTITION p20141015 VALUES LESS THAN (1413316800) ENGINE = InnoDB,
 PARTITION p20141016 VALUES LESS THAN (1413403200) ENGINE = InnoDB,
 PARTITION p20141017 VALUES LESS THAN (1413489600) ENGINE = InnoDB,
 PARTITION p20141018 VALUES LESS THAN (1413576000) ENGINE = InnoDB,
 PARTITION p20141019 VALUES LESS THAN (1413662400) ENGINE = InnoDB,
 PARTITION p20141020 VALUES LESS THAN (1413748800) ENGINE = InnoDB,
 PARTITION p20141021 VALUES LESS THAN (1413835200) ENGINE = InnoDB,
 PARTITION p20141022 VALUES LESS THAN (1413921600) ENGINE = InnoDB,
 PARTITION p20141023 VALUES LESS THAN (1414008000) ENGINE = InnoDB,
 PARTITION p20141024 VALUES LESS THAN (1414094400) ENGINE = InnoDB,
 PARTITION p20141025 VALUES LESS THAN (1414180800) ENGINE = InnoDB,
 PARTITION p20141026 VALUES LESS THAN (1414267200) ENGINE = InnoDB,
 PARTITION p20141027 VALUES LESS THAN (1414353600) ENGINE = InnoDB,
 PARTITION p20141028 VALUES LESS THAN (1414440000) ENGINE = InnoDB,
 PARTITION p20141029 VALUES LESS THAN (1414526400) ENGINE = InnoDB,
 PARTITION p20141030 VALUES LESS THAN (1414612800) ENGINE = InnoDB,
 PARTITION p20141031 VALUES LESS THAN (1414699200) ENGINE = InnoDB,
 PARTITION p20141101 VALUES LESS THAN (1414785600) ENGINE = InnoDB,
 PARTITION p20141102 VALUES LESS THAN (1414872000) ENGINE = InnoDB,
 PARTITION p20141103 VALUES LESS THAN (1414958400) ENGINE = InnoDB,
 PARTITION p20141104 VALUES LESS THAN (1415044800) ENGINE = InnoDB,
 PARTITION p20141105 VALUES LESS THAN (1415131200) ENGINE = InnoDB,
 PARTITION p20141106 VALUES LESS THAN (1415217600) ENGINE = InnoDB,
 PARTITION p20141107 VALUES LESS THAN (1415304000) ENGINE = InnoDB,
 PARTITION p20141108 VALUES LESS THAN (1415390400) ENGINE = InnoDB,
 PARTITION p20141109 VALUES LESS THAN (1415476800) ENGINE = InnoDB,
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



# Dump of table quiz_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quiz_mst`;

CREATE TABLE `quiz_mst` (
  `category_id` int(10) unsigned NOT NULL COMMENT 'カテゴリID',
  `question_id` int(10) unsigned NOT NULL COMMENT '問題ID(カテゴリ内ユニーク)',
  `question` varchar(255) NOT NULL COMMENT '問題文',
  `correct` int(10) unsigned NOT NULL COMMENT '正解番号',
  `correct_text` varchar(255) NOT NULL COMMENT '正解時テキスト',
  `incorrect_text` varchar(255) NOT NULL COMMENT '不正解時テキスト',
  PRIMARY KEY (`category_id`,`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クイズマスター';



# Dump of table quiz_present_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quiz_present_mst`;

CREATE TABLE `quiz_present_mst` (
  `category_id` int(10) unsigned NOT NULL COMMENT 'カテゴリID',
  `present_id` int(10) unsigned NOT NULL COMMENT 'プレゼントID',
  `present_cnt` int(10) unsigned NOT NULL COMMENT 'プレゼント数',
  `gacha_point` int(10) unsigned NOT NULL COMMENT 'プレゼントガチャP',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クイズプレゼントマスタ';



# Dump of table ragnarok_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ragnarok_data`;

CREATE TABLE `ragnarok_data` (
  `ragnarok_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ラグナロクデータID',
  `gvg_data_id` int(10) unsigned NOT NULL COMMENT 'GvGﾃﾞｰﾀID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'クランID',
  `guild_receive_data_id` int(10) unsigned NOT NULL COMMENT '対戦相手ギルドデータID',
  `bet_flg` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'BET対象フラグ(0:非対象, 1:対象)',
  `active_flg` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'アクティブフラグ(1:アクティブ 2:非アクティブ)',
  `rank` int(10) unsigned NOT NULL COMMENT '順位',
  `receive_rank` int(10) unsigned NOT NULL COMMENT '相手順位',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'CP',
  `receive_clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '相手CP',
  `degree_attention` int(11) NOT NULL DEFAULT '0' COMMENT '注目度',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`ragnarok_data_id`),
  KEY `index_gvg_data_id` (`gvg_data_id`),
  KEY `index_guild_data_id` (`guild_data_id`),
  KEY `index_guild_receive_data_id` (`guild_receive_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ラグナロク';



# Dump of table ragnarok_spectator_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ragnarok_spectator_log`;

CREATE TABLE `ragnarok_spectator_log` (
  `ragnarok_spectator_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '観戦者ログID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `date` date DEFAULT NULL COMMENT '観戦日',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  PRIMARY KEY (`ragnarok_spectator_log_id`),
  KEY `index_uid` (`uid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ラグナロク観戦者ロク';



# Dump of table raid_area_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_area_mst`;

CREATE TABLE `raid_area_mst` (
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID(0から連番)',
  `area_name` varchar(255) NOT NULL COMMENT 'エリア名',
  `area_text` varchar(255) NOT NULL COMMENT 'エリア説明文',
  `drop_rate_lucky_egg` int(10) unsigned NOT NULL COMMENT 'ラッキーエッグドロップ確率',
  `drop_rate_gvg_stamina` int(10) unsigned NOT NULL COMMENT 'ドロップ確率(gvg行動力(MP))',
  `drop_rate_gacha_point` int(10) unsigned NOT NULL COMMENT 'ドロップ確率(ガチャP)',
  `drop_rate_card` int(10) unsigned NOT NULL COMMENT 'ドロップ確率(カード)',
  `drop_rate_gvg_stamina_at_gvg` int(10) unsigned NOT NULL COMMENT 'GvG中\nドロップ確率(gvg行動力(MP))',
  `drop_rate_gacha_point_at_gvg` int(10) unsigned NOT NULL COMMENT 'GvG中\nドロップ確率(ガチャP)',
  `drop_rate_card_at_gvg` int(10) unsigned NOT NULL COMMENT 'GvG中\nドロップ確率(カード)',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冒険エリアマスターデータ';



# Dump of table raid_battle_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_battle_log`;

CREATE TABLE `raid_battle_log` (
  `raid_battle_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'レイドバトルログＩＤ',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザＩＤ',
  `raid_battle_id` int(10) unsigned NOT NULL COMMENT '攻撃ID\n時間の数値が入るっぽい',
  `raid_boss_id` int(10) unsigned NOT NULL COMMENT 'raid_boss_data の raid_id\nプログラム内では raid_battle_id とも呼ばれているやつ\n',
  `boss_crnt_hp` int(10) unsigned NOT NULL COMMENT 'ボスのＨＰ\n',
  `boss_type` int(10) unsigned NOT NULL COMMENT 'ボスタイプ\nraid_boss_mst の type\n',
  `boss_type_order` int(10) unsigned NOT NULL COMMENT 'ボスタイプオーダー\nraid_boss_mst の type_order\n',
  `use_stamina` int(10) unsigned NOT NULL COMMENT '消費冒P',
  `damage` int(10) unsigned NOT NULL COMMENT '今回与えたダメージ\n',
  `point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '獲得ポイント',
  `max_card_damage` int(10) unsigned NOT NULL COMMENT '最大１撃ダメージ量',
  `item_fact` float NOT NULL COMMENT 'アイテム効果係数',
  `card_mst_ids` varchar(255) NOT NULL COMMENT '使用したカードマスタIDのリスト\n',
  `attack_list` varchar(1536) NOT NULL COMMENT 'ターンデータ\n各ダメージと',
  `purge_list` varchar(512) NOT NULL COMMENT '脱落カードリスト\n',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '作成日時',
  PRIMARY KEY (`raid_battle_log_id`),
  KEY `battle_id` (`uid`,`raid_battle_id`),
  KEY `user_raid_id` (`uid`,`raid_boss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドバトルログ';



# Dump of table raid_boss_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_boss_data`;

CREATE TABLE `raid_boss_data` (
  `raid_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` int(10) unsigned NOT NULL COMMENT 'type from mst',
  `type_order` int(10) unsigned NOT NULL COMMENT 'type_order from mst',
  `crnt_hp` int(10) unsigned NOT NULL COMMENT '現在HP',
  `status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ステータス',
  `over_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '終了時間',
  `discoverer_uid` int(11) NOT NULL COMMENT '発見者',
  `smasher_uid` int(11) NOT NULL DEFAULT '0' COMMENT '撃破者',
  `attacker_list` text NOT NULL COMMENT '攻撃者リスト',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新時間',
  `create_time` datetime NOT NULL COMMENT '作成日',
  PRIMARY KEY (`raid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドボスデータ';



# Dump of table raid_boss_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_boss_mst`;

CREATE TABLE `raid_boss_mst` (
  `type` int(10) unsigned NOT NULL COMMENT '涼:0\n爽:1\n粋:2\nク,ク+:3\nク++:4\n【】ク:5\n',
  `type_order` int(10) unsigned NOT NULL COMMENT '同一タイプ内での出現順番',
  `name` varchar(45) NOT NULL COMMENT '名前',
  `add_flag` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '討伐時に追加するフラグ',
  `damege_fact` float NOT NULL COMMENT 'ダメージ補正',
  `max_hp` int(10) unsigned NOT NULL COMMENT '最大HP',
  `defense` int(10) unsigned NOT NULL COMMENT '防御力',
  `critical_rate` int(10) unsigned NOT NULL COMMENT 'クリティカル発生確率\n0-100',
  `img_id` int(10) unsigned NOT NULL COMMENT '画像番号',
  `valid_time` time NOT NULL COMMENT '有効時間',
  `speech1` varchar(255) NOT NULL,
  `speech_lose1` varchar(255) NOT NULL,
  `speech2` varchar(255) NOT NULL,
  `speech_lose2` varchar(255) NOT NULL,
  PRIMARY KEY (`type`,`type_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドボスマスタ';



# Dump of table raid_cluster_boss_appear_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_cluster_boss_appear_mst`;

CREATE TABLE `raid_cluster_boss_appear_mst` (
  `cluster_id` int(10) unsigned NOT NULL COMMENT 'クラスターＩＤ',
  `boss_type` int(10) unsigned NOT NULL COMMENT 'raid_boss_mst の type で\n倒したボスを指定',
  `boss_type_order` int(10) unsigned NOT NULL COMMENT 'type order も指定したい場合に使用\n0 だとオールマイティ\nboss_type のみで判定するよ\n',
  `bonus_step` int(10) unsigned NOT NULL COMMENT 'bonus_step も指定したい場合に使用\n0 だとオールマイティ\nboss_type のみで判定するよ\n',
  `next_boss_type` int(10) unsigned NOT NULL COMMENT 'raid_boss_mst の type で\n連戦で出てくるボスを指定',
  `rate` int(10) unsigned NOT NULL COMMENT '連戦確率\n100% = 10000',
  `need_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'エンカウントに必要なフラグ\n',
  `not_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'エンカウントにあっちゃいけないフラグ\n',
  `special_flag` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'エンカウント特殊設定とかに使用するフラグ\n',
  PRIMARY KEY (`cluster_id`,`boss_type`,`next_boss_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クラスター毎ボス連戦指定';



# Dump of table raid_cluster_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_cluster_mst`;

CREATE TABLE `raid_cluster_mst` (
  `cluster_id` int(10) unsigned NOT NULL,
  `boss_appear_cap_fact` float NOT NULL COMMENT 'レイドボス出現消費冒P上限係数',
  `stamina_appear_rate0` int(10) unsigned NOT NULL COMMENT '冒Pによるボス出現補正\n閾値はraid.yaml参照\n',
  `stamina_appear_rate1` int(10) unsigned NOT NULL COMMENT '冒Pによるボス出現補正\n閾値はraid.yaml参照\n',
  `stamina_appear_rate2` int(10) unsigned NOT NULL COMMENT '冒Pによるボス出現補正\n閾値はraid.yaml参照\n',
  `boss_appear_rate0` int(10) unsigned NOT NULL COMMENT 'スプリガン出現確率',
  `boss_appear_rate1` int(10) unsigned NOT NULL COMMENT 'クラーディア出現確率',
  PRIMARY KEY (`cluster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイド用クラスタパラメータマスタ';



# Dump of table raid_guild_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_guild_data`;

CREATE TABLE `raid_guild_data` (
  `guild_data_id` int(10) unsigned NOT NULL,
  `point_1` bigint(20) unsigned NOT NULL DEFAULT '0',
  `point_2` bigint(20) unsigned NOT NULL DEFAULT '0',
  `point_total` bigint(20) unsigned NOT NULL DEFAULT '0',
  `point` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`guild_data_id`),
  KEY `point_idx` (`point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドイベント用ギルドデータ';



# Dump of table raid_guild_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_guild_user_data`;

CREATE TABLE `raid_guild_user_data` (
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザＩＤ',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドＩＤ',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`uid`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイド中のギルドユーザデータ';



# Dump of table raid_guild_user_data_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_guild_user_data_1`;

CREATE TABLE `raid_guild_user_data_1` (
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザＩＤ',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドＩＤ',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`uid`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイド中のギルドユーザデータ';



# Dump of table raid_guild_user_data_2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_guild_user_data_2`;

CREATE TABLE `raid_guild_user_data_2` (
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザＩＤ',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドＩＤ',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`uid`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイド中のギルドユーザデータ';



# Dump of table raid_guild_user_data_3
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_guild_user_data_3`;

CREATE TABLE `raid_guild_user_data_3` (
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザＩＤ',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ギルドＩＤ',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`uid`),
  KEY `guild_data_id` (`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイド中のギルドユーザデータ';



# Dump of table raid_monster_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_monster_mst`;

CREATE TABLE `raid_monster_mst` (
  `raid_monster_mst_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID',
  `monster_id` int(10) unsigned NOT NULL COMMENT 'モンスターID',
  `move_type` int(10) unsigned NOT NULL COMMENT '動き番号',
  PRIMARY KEY (`raid_monster_mst_id`),
  KEY `area_id` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冒険ザコマスタ';



# Dump of table raid_present_send_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_present_send_log`;

CREATE TABLE `raid_present_send_log` (
  `raid_present_send_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ログID\n',
  `src_uid` int(10) unsigned NOT NULL COMMENT '送信者ユーザID',
  `dst_uid` int(10) unsigned NOT NULL COMMENT '受信者ユーザID',
  `raid_id` int(10) unsigned NOT NULL COMMENT '贈ったレイドID',
  `send_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '贈った日付\n',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '作成日時',
  PRIMARY KEY (`raid_present_send_log_id`),
  UNIQUE KEY `send_data` (`src_uid`,`dst_uid`,`send_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ユーザ間プレゼント送信ログ';



# Dump of table raid_quest_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_quest_mst`;

CREATE TABLE `raid_quest_mst` (
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID(0から連番)',
  `quest_id` int(10) unsigned NOT NULL COMMENT 'クエストID(0から連番)',
  `floor_no` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '階層番号\n1 ～の連番',
  `quest_name` varchar(255) NOT NULL COMMENT 'クエスト名',
  `use_stamina` int(10) unsigned NOT NULL COMMENT '体力消費量',
  `gain_step` int(10) unsigned NOT NULL COMMENT '取得達成度',
  `gain_exp` int(10) unsigned NOT NULL COMMENT '取得経験値',
  `gain_money_min` int(10) unsigned NOT NULL COMMENT '最小取得金額',
  `gain_money_max` int(10) unsigned NOT NULL COMMENT '最大取得金額',
  `gain_gvg_stamina` int(10) unsigned NOT NULL COMMENT '取得gvg行動力(MP)',
  `gain_gacha_point` int(10) unsigned NOT NULL COMMENT '取得ガチャP',
  `drop_card_id0` int(10) unsigned NOT NULL COMMENT 'ドロップカードID',
  `drop_rate0` int(10) unsigned NOT NULL COMMENT 'ドロップ確率',
  `drop_card_id1` int(10) unsigned NOT NULL,
  `drop_rate1` int(10) unsigned NOT NULL,
  `drop_card_id2` int(10) unsigned NOT NULL,
  `drop_rate2` int(10) unsigned NOT NULL,
  `drop_card_id3` int(10) unsigned NOT NULL,
  `drop_rate3` int(10) unsigned NOT NULL,
  `drop_card_id4` int(10) unsigned NOT NULL,
  `drop_rate4` int(10) unsigned NOT NULL,
  `boss_flag` tinyint(1) NOT NULL COMMENT 'ボスいるかどうか\n(存在しない場合はゼロ)',
  `boss_name` varchar(255) NOT NULL COMMENT 'ボス名',
  `boss_speech` varchar(255) NOT NULL COMMENT 'ボスセリフ',
  `boss_speech_win` varchar(255) NOT NULL COMMENT 'ボス勝ち台詞',
  `boss_speech_lose` varchar(255) NOT NULL COMMENT 'ボス負けセリフ',
  `boss_attack` int(10) unsigned NOT NULL COMMENT 'ボス攻撃力',
  `boss_defense` int(10) unsigned NOT NULL COMMENT 'ボス防御力',
  `boss_exp` int(10) unsigned NOT NULL COMMENT 'ボス獲得経験値',
  `boss_money` int(10) unsigned NOT NULL COMMENT 'ボス獲得ギル',
  `boss_gacha_point` int(10) unsigned NOT NULL COMMENT 'ボス獲得ガチャP',
  `boss_item_id` int(10) unsigned NOT NULL COMMENT 'ボス獲得アイテム',
  `boss_item_cnt` int(10) unsigned NOT NULL COMMENT 'ボス獲得アイテム個数',
  PRIMARY KEY (`area_id`,`quest_id`),
  KEY `floor_no` (`floor_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冒険クエストマスターデータ';



# Dump of table raid_rank_distribution_guild
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_rank_distribution_guild`;

CREATE TABLE `raid_rank_distribution_guild` (
  `border` int(10) unsigned NOT NULL,
  `cnt` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`border`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドイベント用ギルドランキング分布';



# Dump of table raid_rank_distribution_personal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_rank_distribution_personal`;

CREATE TABLE `raid_rank_distribution_personal` (
  `border` int(10) unsigned NOT NULL,
  `cnt` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`border`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドイベント用個人ランキング分布';



# Dump of table raid_rareboss_rank_correct_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_rareboss_rank_correct_mst`;

CREATE TABLE `raid_rareboss_rank_correct_mst` (
  `rank_border` int(10) unsigned NOT NULL,
  `rate` int(11) NOT NULL COMMENT '補正値',
  PRIMARY KEY (`rank_border`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイド用レアボス出現補正';



# Dump of table raid_reno_area_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_reno_area_mst`;

CREATE TABLE `raid_reno_area_mst` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL DEFAULT '1',
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID(0から連番)',
  `area_name` varchar(255) NOT NULL COMMENT 'エリア名',
  `area_text` varchar(255) NOT NULL COMMENT 'エリア説明文',
  `drop_rate_lucky_egg` int(10) unsigned NOT NULL COMMENT 'ラッキーエッグドロップ確率',
  `drop_rate_gvg_stamina` int(10) unsigned NOT NULL COMMENT 'ドロップ確率(gvg行動力(MP))',
  `drop_rate_gacha_point` int(10) unsigned NOT NULL COMMENT 'ドロップ確率(ガチャP)',
  `drop_rate_card` int(10) unsigned NOT NULL COMMENT 'ドロップ確率(カード)',
  `drop_rate_gvg_stamina_at_gvg` int(10) unsigned NOT NULL COMMENT 'GvG中\nドロップ確率(gvg行動力(MP))',
  `drop_rate_gacha_point_at_gvg` int(10) unsigned NOT NULL COMMENT 'GvG中\nドロップ確率(ガチャP)',
  `drop_rate_card_at_gvg` int(10) unsigned NOT NULL COMMENT 'GvG中\nドロップ確率(カード)',
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `area_id` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冒険エリアマスターデータ';



# Dump of table raid_reno_boss_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_reno_boss_mst`;

CREATE TABLE `raid_reno_boss_mst` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL DEFAULT '1',
  `type` int(10) unsigned NOT NULL COMMENT '涼:0\n爽:1\n粋:2\nク,ク+:3\nク++:4\n【】ク:5\n',
  `type_order` int(10) unsigned NOT NULL COMMENT '同一タイプ内での出現順番',
  `name` varchar(45) NOT NULL COMMENT '名前',
  `add_flag` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '討伐時に追加するフラグ',
  `damege_fact` float NOT NULL COMMENT 'ダメージ補正',
  `max_hp` int(10) unsigned NOT NULL COMMENT '最大HP',
  `defense` int(10) unsigned NOT NULL COMMENT '防御力',
  `critical_rate` int(10) unsigned NOT NULL COMMENT 'クリティカル発生確率\n0-100',
  `img_id` int(10) unsigned NOT NULL COMMENT '画像番号',
  `valid_time` time NOT NULL COMMENT '有効時間',
  `speech1` varchar(255) NOT NULL,
  `speech_lose1` varchar(255) NOT NULL,
  `speech2` varchar(255) NOT NULL,
  `speech_lose2` varchar(255) NOT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `type` (`type`,`type_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドボスマスタ';



# Dump of table raid_reno_cluster_boss_appear_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_reno_cluster_boss_appear_mst`;

CREATE TABLE `raid_reno_cluster_boss_appear_mst` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL DEFAULT '1',
  `cluster_id` int(10) unsigned NOT NULL COMMENT 'クラスターＩＤ',
  `boss_type` int(10) unsigned NOT NULL COMMENT 'raid_boss_mst の type で\n倒したボスを指定',
  `boss_type_order` int(10) unsigned NOT NULL COMMENT 'type order も指定したい場合に使用\n0 だとオールマイティ\nboss_type のみで判定するよ\n',
  `bonus_step` int(10) unsigned NOT NULL COMMENT 'bonus_step も指定したい場合に使用\n0 だとオールマイティ\nboss_type のみで判定するよ\n',
  `next_boss_type` int(10) unsigned NOT NULL COMMENT 'raid_boss_mst の type で\n連戦で出てくるボスを指定',
  `rate` int(10) unsigned NOT NULL COMMENT '連戦確率\n100% = 10000',
  `need_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'エンカウントに必要なフラグ\n',
  `not_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'エンカウントにあっちゃいけないフラグ\n',
  `special_flag` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'エンカウント特殊設定とかに使用するフラグ\n',
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `cluster_id` (`cluster_id`,`boss_type`,`next_boss_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クラスター毎ボス連戦指定';



# Dump of table raid_reno_cluster_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_reno_cluster_mst`;

CREATE TABLE `raid_reno_cluster_mst` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL DEFAULT '1',
  `cluster_id` int(10) unsigned NOT NULL,
  `boss_appear_cap_fact` float NOT NULL COMMENT 'レイドボス出現消費冒P上限係数',
  `stamina_appear_rate0` int(10) unsigned NOT NULL COMMENT '冒Pによるボス出現補正\n閾値はraid.yaml参照\n',
  `stamina_appear_rate1` int(10) unsigned NOT NULL COMMENT '冒Pによるボス出現補正\n閾値はraid.yaml参照\n',
  `stamina_appear_rate2` int(10) unsigned NOT NULL COMMENT '冒Pによるボス出現補正\n閾値はraid.yaml参照\n',
  `boss_appear_rate0` int(10) unsigned NOT NULL COMMENT 'スプリガン出現確率',
  `boss_appear_rate1` int(10) unsigned NOT NULL COMMENT 'クラーディア出現確率',
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `cluster_id` (`cluster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイド用クラスタパラメータマスタ';



# Dump of table raid_reno_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_reno_config`;

CREATE TABLE `raid_reno_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `template_id` int(11) NOT NULL DEFAULT '1',
  `start` datetime NOT NULL,
  `first_period_end` datetime NOT NULL,
  `second_period_start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `boss_appear_period` varchar(256) DEFAULT NULL,
  `boss_appear_limit` varchar(128) DEFAULT NULL,
  `raid_item` int(11) NOT NULL DEFAULT '17',
  `display_cards` varchar(128) DEFAULT NULL,
  `special_cards` text NOT NULL,
  `smash_rewards` text NOT NULL,
  `quest_rewards` text NOT NULL,
  `greet_msg` varchar(256) DEFAULT NULL,
  `updated_by` varchar(128) NOT NULL DEFAULT '',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table raid_reno_monster_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_reno_monster_mst`;

CREATE TABLE `raid_reno_monster_mst` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL DEFAULT '1',
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID',
  `monster_id` int(10) unsigned NOT NULL COMMENT 'モンスターID',
  `move_type` int(10) unsigned NOT NULL COMMENT '動き番号',
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `area_id` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冒険ザコマスタ';



# Dump of table raid_reno_quest_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_reno_quest_mst`;

CREATE TABLE `raid_reno_quest_mst` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID(0から連番)',
  `quest_id` int(10) unsigned NOT NULL COMMENT 'クエストID(0から連番)',
  `floor_no` int(10) unsigned NOT NULL COMMENT '階層番号\\n1 ～の連番',
  `quest_name` varchar(255) NOT NULL COMMENT 'クエスト名',
  `use_stamina` int(10) unsigned NOT NULL COMMENT '体力消費量',
  `gain_step` int(10) unsigned NOT NULL COMMENT '取得達成度',
  `gain_exp` int(10) unsigned NOT NULL COMMENT '取得経験値',
  `gain_money_min` int(10) unsigned NOT NULL COMMENT '最小取得金額',
  `gain_money_max` int(10) unsigned NOT NULL COMMENT '最大取得金額',
  `gain_gvg_stamina` int(10) unsigned NOT NULL COMMENT '取得gvg行動力(MP)',
  `gain_gacha_point` int(10) unsigned NOT NULL COMMENT '取得ガチャP',
  `drop_card_id0` int(10) unsigned NOT NULL COMMENT 'ドロップカードID',
  `drop_rate0` int(10) unsigned NOT NULL COMMENT 'ドロップ確率',
  `drop_card_id1` int(10) unsigned NOT NULL,
  `drop_rate1` int(10) unsigned NOT NULL,
  `drop_card_id2` int(10) unsigned NOT NULL,
  `drop_rate2` int(10) unsigned NOT NULL,
  `drop_card_id3` int(10) unsigned NOT NULL,
  `drop_rate3` int(10) unsigned NOT NULL,
  `drop_card_id4` int(10) unsigned NOT NULL,
  `drop_rate4` int(10) unsigned NOT NULL,
  `boss_flag` tinyint(1) NOT NULL COMMENT 'ボスいるかどうか\n(存在しない場合はゼロ)',
  `boss_name` varchar(255) NOT NULL COMMENT 'ボス名',
  `boss_speech` varchar(255) NOT NULL COMMENT 'ボスセリフ',
  `boss_speech_win` varchar(255) NOT NULL COMMENT 'ボス勝ち台詞',
  `boss_speech_lose` varchar(255) NOT NULL COMMENT 'ボス負けセリフ',
  `boss_attack` int(10) unsigned NOT NULL COMMENT 'ボス攻撃力',
  `boss_defense` int(10) unsigned NOT NULL COMMENT 'ボス防御力',
  `boss_exp` int(10) unsigned NOT NULL COMMENT 'ボス獲得経験値',
  `boss_money` int(10) unsigned NOT NULL COMMENT 'ボス獲得ギル',
  `boss_gacha_point` int(10) unsigned NOT NULL COMMENT 'ボス獲得ガチャP',
  `boss_item_id` int(10) unsigned NOT NULL COMMENT 'ボス獲得アイテム',
  `boss_item_cnt` int(10) unsigned NOT NULL COMMENT 'ボス獲得アイテム個数',
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `floor_no` (`floor_no`),
  KEY `event_id` (`event_id`),
  KEY `quest_id` (`quest_id`),
  KEY `area_id` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冒険クエストマスターデータ';



# Dump of table raid_reno_rareboss_rank_correct_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_reno_rareboss_rank_correct_mst`;

CREATE TABLE `raid_reno_rareboss_rank_correct_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL DEFAULT '1',
  `rank_border` int(10) unsigned NOT NULL,
  `rate` int(11) NOT NULL COMMENT '補正値',
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイド用レアボス出現補正';



# Dump of table raid_reno_reward_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_reno_reward_mst`;

CREATE TABLE `raid_reno_reward_mst` (
  `reward_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL DEFAULT '1',
  `boss_type` int(10) unsigned NOT NULL COMMENT 'ボスタイプ\nraid_boss_mst\nの type 指定',
  `reward_type` int(10) unsigned NOT NULL COMMENT '報酬タイプ\n1: 最多ダメージ\n2: 攻撃\n3: 発見\n4: 撃破\n\n',
  `type` int(10) unsigned NOT NULL COMMENT '1: card\n2: item\n3: ギル\n4: 召喚P',
  `id` int(10) unsigned NOT NULL COMMENT 'item or card\nのID',
  `cnt` int(10) unsigned NOT NULL COMMENT '数(カードの場合無視)',
  `rate` int(10) unsigned NOT NULL COMMENT '0~10000\n100%を10000とみなすので\n100で割って考えてね。',
  `max_lv_rate` int(10) unsigned NOT NULL COMMENT '最大ＬＶ討伐時の確率\n\n間の段階は\n(max_lv_rate - rate) / 段階\n的にリニアーな補正を入れます',
  `updated_by` varchar(128) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`reward_id`),
  KEY `reward_type` (`reward_type`),
  KEY `boss_type` (`boss_type`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドボス報酬マスタ';



# Dump of table raid_reward_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_reward_mst`;

CREATE TABLE `raid_reward_mst` (
  `reward_id` int(10) unsigned NOT NULL COMMENT 'id',
  `boss_type` int(10) unsigned NOT NULL COMMENT 'ボスタイプ\nraid_boss_mst\nの type 指定',
  `reward_type` int(10) unsigned NOT NULL COMMENT '報酬タイプ\n1: 最多ダメージ\n2: 攻撃\n3: 発見\n4: 撃破\n\n',
  `type` int(10) unsigned NOT NULL COMMENT '1: card\n2: item\n3: ギル\n4: 召喚P',
  `id` int(10) unsigned NOT NULL COMMENT 'item or card\nのID',
  `cnt` int(10) unsigned NOT NULL COMMENT '数(カードの場合無視)',
  `rate` int(10) unsigned NOT NULL COMMENT '0~10000\n100%を10000とみなすので\n100で割って考えてね。',
  `max_lv_rate` int(10) unsigned NOT NULL COMMENT '最大ＬＶ討伐時の確率\n\n間の段階は\n(max_lv_rate - rate) / 段階\n的にリニアーな補正を入れます',
  PRIMARY KEY (`reward_id`),
  KEY `reward_type` (`reward_type`),
  KEY `boss_type` (`boss_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドボス報酬マスタ';



# Dump of table raid_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_user_data`;

CREATE TABLE `raid_user_data` (
  `uid` int(10) unsigned NOT NULL,
  `raid_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '戦闘中のレイドボスID',
  `raid_step_0` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'レイドボス撃破進捗\nraid_step_*\n* に対応するボスのtypeが入る\nステップ記録が必要なボスtype分カラムが必要',
  `raid_step_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'レイドボス撃破進捗\nraid_step_*\n* に対応するボスのtypeが入る\nステップ記録が必要なボスtype分カラムが必要',
  `raid_step_5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'レイドボス撃破進捗\nraid_step_*\n* に対応するボスのtypeが入る\nステップ記録が必要なボスtype分カラムが必要',
  `encount_flag` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ボスエンカウント用のフラグワーク',
  `bonus_step` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'レアボス進捗',
  `reserve_raid_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '予約分(レアとか)',
  `smash_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '撃破数',
  `status` int(10) unsigned NOT NULL COMMENT '汎用ステータス',
  `crnt_area` int(10) unsigned NOT NULL DEFAULT '1',
  `crnt_quest` int(10) unsigned NOT NULL DEFAULT '1',
  `cluster_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クラスターID\nプログラムで使用はしないが、解析用に入れておく',
  `point_1` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'ンキング用のポイント',
  `point_2` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'ンキング用のポイント',
  `point_total` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'ランキング用のポイント',
  `point` bigint(20) unsigned NOT NULL DEFAULT '0',
  `sum_damage` bigint(20) unsigned NOT NULL COMMENT '累計ダメージ',
  `select_deck_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '選択中デッキ番号',
  `last_raid_battle_id` int(10) unsigned NOT NULL DEFAULT '0',
  `boss_appear` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ボス出現ポイント',
  `sum_payment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '課金合計',
  `start_payment` int(10) unsigned DEFAULT NULL,
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  `notification_flg` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'notification設定 0:受信しない、1:受信',
  PRIMARY KEY (`uid`),
  KEY `area_idx` (`crnt_area`),
  KEY `quest_idx` (`crnt_quest`),
  KEY `point_idx` (`point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドイベント用ユーザーデータ';



# Dump of table raid_user_guild_point
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_user_guild_point`;

CREATE TABLE `raid_user_guild_point` (
  `uid` int(10) unsigned NOT NULL COMMENT 'uid',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'guild_data_id',
  `point_1` bigint(20) unsigned NOT NULL DEFAULT '0',
  `point_2` bigint(20) unsigned NOT NULL DEFAULT '0',
  `point_total` bigint(20) unsigned NOT NULL DEFAULT '0',
  `point` bigint(20) unsigned NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`uid`,`guild_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ユーザーの現ギルドでの獲得ポイント';



# Dump of table raid_user_help_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_user_help_data`;

CREATE TABLE `raid_user_help_data` (
  `raid_user_help_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '救援要請データID',
  `src_uid` int(10) unsigned NOT NULL COMMENT '要請を出したユーザID',
  `dst_uid` int(10) unsigned NOT NULL COMMENT '要請で呼ばれたユーザID',
  `raid_id` int(10) unsigned NOT NULL COMMENT '要請が出たレイドID',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '有効か無効か',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'アクティブかどうか\n',
  `src_cmid` int(10) unsigned NOT NULL COMMENT '呼んだ人のカードマスタID\n表示用\n',
  `src_name` varchar(255) DEFAULT NULL COMMENT '呼んだ人のユーザ名',
  `over_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '終了時間',
  `create_date` datetime NOT NULL COMMENT '作成日\n',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時\n',
  PRIMARY KEY (`raid_user_help_data_id`),
  UNIQUE KEY `dst_uid_UNIQUE` (`dst_uid`,`raid_id`),
  KEY `raid_id` (`raid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='救援要請データ';



# Dump of table raid_user_help_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_user_help_list`;

CREATE TABLE `raid_user_help_list` (
  `uid` int(11) NOT NULL COMMENT 'uid',
  `help_list` text NOT NULL COMMENT '救援リスト',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイド救援リスト';



# Dump of table raid_user_quest_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_user_quest_state`;

CREATE TABLE `raid_user_quest_state` (
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID',
  `quest_id` int(10) unsigned NOT NULL COMMENT 'クエストID',
  `step` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '進行度',
  `rest_action_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '中断した場合の残りアクション数',
  `get_card0` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カード取得フラグ',
  `get_card1` tinyint(1) NOT NULL DEFAULT '0',
  `get_card2` tinyint(1) NOT NULL DEFAULT '0',
  `get_card3` tinyint(1) NOT NULL DEFAULT '0',
  `get_card4` tinyint(1) NOT NULL DEFAULT '0',
  `card_complete` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カードコンプフラグ',
  `boss_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ボスいるかいないか',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`uid`,`area_id`,`quest_id`),
  KEY `area_idx` (`area_id`),
  KEY `quest_idx` (`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冒険クエスト状態';



# Dump of table raid_user_roulette_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_user_roulette_data`;

CREATE TABLE `raid_user_roulette_data` (
  `uid` int(10) unsigned NOT NULL,
  `bonus_no` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '報酬no: raid.yaml、0の場合は発動中の効果がすでにあって外れになった場合',
  `expire_date` datetime NOT NULL COMMENT '作成日時',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドルレット効果のユーザーデータ';



# Dump of table raid_user_roulette_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_user_roulette_log`;

CREATE TABLE `raid_user_roulette_log` (
  `raid_user_roulette_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'レイドルレットlog_ID',
  `raid_id` int(10) unsigned NOT NULL COMMENT 'bossデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `bonus_no` tinyint(4) NOT NULL COMMENT '報酬no: raid.yaml、0の場合は発動中の効果がすでにあって外れになった場合',
  `expire_date` datetime NOT NULL COMMENT '制限時間',
  `create_date` datetime NOT NULL COMMENT '作成日',
  PRIMARY KEY (`raid_user_roulette_log_id`),
  UNIQUE KEY `raid_id` (`raid_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ボックスプレゼント';



# Dump of table raid_user_smash_cnt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_user_smash_cnt`;

CREATE TABLE `raid_user_smash_cnt` (
  `uid` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL COMMENT 'raid_boss_mstのtype',
  `cnt` int(10) unsigned NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドボス倒した数';



# Dump of table raid_user_smash_cnt_reward
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_user_smash_cnt_reward`;

CREATE TABLE `raid_user_smash_cnt_reward` (
  `data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ﾃﾞｰﾀID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ﾕｰｻﾞID',
  `received_cnt` int(10) unsigned DEFAULT NULL COMMENT '前回受け取った際のカウント数',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`data_id`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドボス撃破特別報酬受取カウント';



# Dump of table raid_user_treasure_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raid_user_treasure_data`;

CREATE TABLE `raid_user_treasure_data` (
  `treasure_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'お宝ID',
  `uid` int(10) unsigned NOT NULL COMMENT 'uid',
  `raid_id` int(10) unsigned NOT NULL,
  `treasure` text NOT NULL COMMENT 'お宝jsonデータ',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有効フラグ',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日時',
  PRIMARY KEY (`treasure_id`),
  UNIQUE KEY `uid_raid_unique` (`uid`,`raid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='レイドおたからデータ';



# Dump of table rvr_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rvr_data`;

CREATE TABLE `rvr_data` (
  `rvr_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gvg_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GVG_DATA_ID',
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クランID',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `team` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'チーム',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rvr_data_id`),
  KEY `clan_point` (`team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランランキング蓄積用データ日別';



# Dump of table rvr_rank_team_a_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rvr_rank_team_a_data`;

CREATE TABLE `rvr_rank_team_a_data` (
  `rvr_rank_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rank` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GVG_DATA_ID',
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クランID',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `team` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'チーム',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rvr_rank_data_id`),
  KEY `clan_point` (`guild_data_id`,`team`,`clan_point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランランキング蓄積用データ日別';



# Dump of table rvr_rank_team_b_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rvr_rank_team_b_data`;

CREATE TABLE `rvr_rank_team_b_data` (
  `rvr_rank_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rank` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GVG_DATA_ID',
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クランID',
  `clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'クランポイント',
  `team` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'チーム',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rvr_rank_data_id`),
  KEY `clan_point` (`guild_data_id`,`team`,`clan_point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランランキング蓄積用データ日別';



# Dump of table rvr_result_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rvr_result_data`;

CREATE TABLE `rvr_result_data` (
  `rvr_result_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_scope` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日付',
  `gvg_today_times_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'カウント',
  `team_a_clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'マユポイント',
  `team_b_clan_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'ユキポイント',
  `victory_team` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '勝敗',
  `victory_a_num` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'A勝敗',
  `victory_b_num` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'B勝敗',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rvr_result_data_id`),
  KEY `guild_data_id` (`date_scope`,`gvg_today_times_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='データ日別';



# Dump of table rvr_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rvr_user_data`;

CREATE TABLE `rvr_user_data` (
  `rvr_user_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'UID',
  `guild_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'クランID',
  `gvg_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GVG_DATA_ID',
  `team` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'チーム',
  `date_scope` int(10) unsigned NOT NULL COMMENT '日付',
  `gvg_today_times_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'カウント',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '０：OP演出未表示、１：OP演出表示済み',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rvr_user_data_id`),
  KEY `uid` (`date_scope`,`guild_data_id`,`uid`),
  KEY `date_scope` (`date_scope`,`gvg_today_times_count`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クランランキング蓄積用データ日別';



# Dump of table s_gvg_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `s_gvg_data`;

CREATE TABLE `s_gvg_data` (
  `gvg_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GvGﾃﾞｰﾀID',
  `guild_data_id` int(10) unsigned NOT NULL COMMENT 'ｷﾞﾙﾄﾞﾃﾞｰﾀID',
  `guild_receive_data_id` int(10) unsigned NOT NULL COMMENT '対戦相手ｷﾞﾙﾄﾞﾃﾞｰﾀID',
  `gvg_today_times_count` int(10) unsigned NOT NULL COMMENT '1日分のGvGｶｳﾝﾄ',
  `start_date` timestamp NULL DEFAULT NULL COMMENT 'GvG開始時刻',
  `total_guild_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '獲得ｷﾞﾙﾄﾞﾎﾟｲﾝﾄ',
  `receive_total_guild_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '相手獲得ｷﾞﾙﾄﾞﾎﾟｲﾝﾄ',
  `active_flg` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'ｽﾃｰﾀｽ',
  `gvg_date` int(10) unsigned NOT NULL COMMENT '日付',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `guild_time_skill_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `guild_time_skill_id` int(10) DEFAULT '0',
  `guild_receive_time_skill_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `guild_receive_time_skill_id` int(10) DEFAULT '0',
  PRIMARY KEY (`gvg_data_id`,`active_flg`),
  KEY `index_gvg_date` (`gvg_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Storage table for gvg_data';



# Dump of table sp_hello_comeback_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_hello_comeback_user_data`;

CREATE TABLE `sp_hello_comeback_user_data` (
  `uid` int(11) NOT NULL COMMENT 'ユーザーID',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:hello 2:comeback',
  `day_cnt` tinyint(4) NOT NULL DEFAULT '1' COMMENT '何日目なのかのカウント',
  `movie_flg` tinyint(4) NOT NULL DEFAULT '0' COMMENT '演出をみたのか。0:見ていない、1:見た',
  `complete_flg` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'プレゼント全部もらったのか。0:まだ、1:終わった',
  `create_date` datetime NOT NULL COMMENT '作成日',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`uid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スペシャルハロー＆カムバックキャンデーター';



# Dump of table stamp_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stamp_data`;

CREATE TABLE `stamp_data` (
  `stamp_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ユーザID',
  `stamp_pushes_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '現在押されているスタンプ数',
  `stamp_pushes_add_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'その日に押されたスタンプ数',
  `stamp_card_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'スタンプカード',
  `date_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日数',
  `check_flg` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '演出表示フラグ',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `event` varchar(128) NOT NULL,
  `stamp_event_mst_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`stamp_data_id`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スタンプ蓄積用';



# Dump of table stamp_data_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stamp_data_log`;

CREATE TABLE `stamp_data_log` (
  `stamp_data_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ユーザID',
  `stamp_pushes_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '押下スタンプ数',
  `date_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日数',
  `stamp_card_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'スタンプシート名',
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event` varchar(128) NOT NULL,
  `stamp_event_mst_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`stamp_data_log_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スタンプデータテーブル用ログ';



# Dump of table stamp_event_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stamp_event_mst`;

CREATE TABLE `stamp_event_mst` (
  `stamp_event_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT 'background img',
  `top_banner_img_path` varchar(255) NOT NULL COMMENT 'top banner img',
  `card_mst_id` int(10) unsigned NOT NULL COMMENT 'monster id',
  `monster_bg_img_path` varchar(255) NOT NULL COMMENT 'monster background img',
  `howto1_img_path` varchar(255) NOT NULL COMMENT 'img for how1 ',
  `howto2_img_path` varchar(255) NOT NULL COMMENT 'img for how2 ',
  `stamp_pushes_count` int(10) DEFAULT '1' COMMENT 'stamp pushed per gvg',
  `stamp_date_count` int(10) DEFAULT '1' COMMENT 'stamp pushed for day',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `admin` varchar(64) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`stamp_event_mst_id`),
  KEY `event_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stamp event';



# Dump of table stamp_reward_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stamp_reward_mst`;

CREATE TABLE `stamp_reward_mst` (
  `stamp_reward_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `stamp_event_mst_id` int(10) unsigned NOT NULL,
  `item_mst_id` int(10) unsigned NOT NULL,
  `order_num` int(10) unsigned NOT NULL,
  `type_flag` tinyint(4) unsigned DEFAULT '0' COMMENT '0:none 1:important 2:stamp_over',
  `admin` varchar(64) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`stamp_reward_mst_id`),
  KEY `event_id` (`stamp_event_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stamp reward';



# Dump of table startdash_quest_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `startdash_quest_data`;

CREATE TABLE `startdash_quest_data` (
  `startdash_quest_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT 'アプリで使用されるユニークID',
  `startdash_quest_mst_id` int(10) unsigned NOT NULL COMMENT 'スタートダッシュマスタID',
  `complete_status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'コンプリート状況 0:未達成 1:達成 2:アイテムBOX配布済み',
  `get_item_date` datetime DEFAULT NULL COMMENT 'アイテム取得日時',
  `insert_date` datetime NOT NULL COMMENT 'システム登録日',
  `update_date` datetime NOT NULL COMMENT 'システムデータ更新日',
  PRIMARY KEY (`startdash_quest_data_id`),
  KEY `uid` (`uid`,`complete_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スタートダッシュクエスト';



# Dump of table startdash_quest_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `startdash_quest_mst`;

CREATE TABLE `startdash_quest_mst` (
  `startdash_quest_mst_id` int(11) NOT NULL,
  `group` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'グループ',
  `title` varchar(120) NOT NULL COMMENT 'タイトル',
  `detail` varchar(256) NOT NULL COMMENT '1行説明',
  `link_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '分類(リンク先種類)0=その他 1=図鑑 2=バトル 3=召喚  4=強化合成 5=進撃 6=限界突破 7=騎士団 8=プロフ',
  `item_mst_id` int(10) unsigned NOT NULL COMMENT 'アイテムID',
  `gift_type` smallint(5) unsigned NOT NULL COMMENT '1=アイテム 2=カード 3=召喚P 4=ギル 5=カード枠 6=回復時間',
  `gift_num` mediumint(8) unsigned NOT NULL COMMENT 'ギフトの種類',
  PRIMARY KEY (`startdash_quest_mst_id`),
  KEY `group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='マスタスタートダッシュクエスト';



# Dump of table startdash_quest_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `startdash_quest_state`;

CREATE TABLE `startdash_quest_state` (
  `startdash_quest_state_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーＩＤ',
  `help_view` tinyint(4) NOT NULL DEFAULT '0' COMMENT '初回だけヘルプに飛ぶ',
  `adv_card_get_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '進撃で取得のカードの数',
  `gacha_normal_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ノーマルガチャ実行数',
  `profile_change` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'プロフィール変更',
  `present_send` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'プレゼント送信',
  `gvg_join` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'ＧｖＧ参加',
  `trade_send` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'トレード申請',
  `coin_exchange` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '交換所交換',
  `evol_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '限界突破回数',
  `final_evol_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最終限界突破回数',
  `greeting_send` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '挨拶したかどうか',
  `egg_warm` int(11) NOT NULL DEFAULT '0' COMMENT '玉子暖め回数',
  `powerup_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '強化の最高レベル',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `bonus_card_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'カードのMAX値のボーナス',
  `bonus_time_sec` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '減算される回復時間ボーナス',
  PRIMARY KEY (`startdash_quest_state_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table surveillance_user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `surveillance_user_data`;

CREATE TABLE `surveillance_user_data` (
  `surveillance_user_data_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '監視対象ユーザデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `create_date` datetime NOT NULL COMMENT '作成日',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状態',
  PRIMARY KEY (`surveillance_user_data_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='監視対象ユーザデータ';



# Dump of table theme_summons_flash_log_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `theme_summons_flash_log_1`;

CREATE TABLE `theme_summons_flash_log_1` (
  `theme_summons_flash_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'テーマ召喚ソード演出ログID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `sword_type` tinyint(1) unsigned NOT NULL COMMENT 'ソードタイプ',
  `sword_num` int(10) unsigned NOT NULL COMMENT '所持ソード数',
  `sword_use_num` int(10) unsigned NOT NULL COMMENT '今回使用したソード数',
  `total_damage` int(10) unsigned NOT NULL COMMENT '累積ダメージ',
  `step` int(10) unsigned NOT NULL COMMENT '演出ステップ',
  `after_step` int(10) unsigned NOT NULL COMMENT '使用後演出ステップ',
  `after_step_img` varchar(45) DEFAULT NULL COMMENT '使用後演出画像名',
  `box_type` tinyint(1) unsigned NOT NULL COMMENT '宝箱タイプ',
  `next_box_type` tinyint(1) unsigned DEFAULT NULL COMMENT '次の宝箱タイプ\n次の宝箱が無い場合はnull',
  `chance` tinyint(1) unsigned NOT NULL COMMENT 'ブレイクチャンスフラグ',
  `result_log_id` int(10) unsigned NOT NULL COMMENT '結果ログID',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '作成日時',
  PRIMARY KEY (`theme_summons_flash_log_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='テーマ召喚1(天魔の宴)ソード演出ログ';



# Dump of table theme_summons_treasure_log_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `theme_summons_treasure_log_1`;

CREATE TABLE `theme_summons_treasure_log_1` (
  `theme_summons_treasure_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'テーマ召喚宝箱放出ログID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `treasure_type` tinyint(1) unsigned NOT NULL COMMENT '宝箱の種類',
  `next_treasure_type` tinyint(1) unsigned NOT NULL COMMENT '次の宝箱の種類',
  `theme_summons_treasure_mst_id` int(10) unsigned NOT NULL COMMENT '当選した宝箱の中身マスタID',
  `chance_time_count` int(10) unsigned NOT NULL COMMENT 'ブレイクチャンスカウント',
  `sword_1_id` int(10) unsigned NOT NULL COMMENT '獲得ソードID\nアイテムマスタIDです',
  `sword_1_num` int(10) unsigned NOT NULL COMMENT 'sword_id のアイテムの獲得数',
  `sword_2_id` int(10) unsigned NOT NULL COMMENT '獲得ソードID\nアイテムマスタIDです',
  `sword_2_num` int(10) unsigned NOT NULL COMMENT 'sword_id のアイテムの獲得数',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  PRIMARY KEY (`theme_summons_treasure_log_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='テーマ召喚1(天魔の宴)宝箱放出ログ';



# Dump of table theme_summons_treasure_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `theme_summons_treasure_mst`;

CREATE TABLE `theme_summons_treasure_mst` (
  `theme_summons_treasure_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'テーマ召喚宝箱中身マスタID',
  `treasure_type` tinyint(1) unsigned NOT NULL COMMENT '宝箱タイプtheme_summons_event.yaml 参照',
  `type` tinyint(3) unsigned NOT NULL COMMENT '財宝タイプtheme_summons_event.yaml 参照',
  `data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'データID\nマスタID系を入れるところ',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '個数',
  `lot_per` int(10) unsigned NOT NULL COMMENT '0~10000\n100%を10000とみなすので\n100で割って考えてね。',
  PRIMARY KEY (`theme_summons_treasure_mst_id`),
  KEY `treasure_type` (`treasure_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='テーマ召喚宝箱中身マスタ';



# Dump of table theme_summons_user_data_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `theme_summons_user_data_1`;

CREATE TABLE `theme_summons_user_data_1` (
  `theme_summons_user_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'テーマ召喚ユーザデータID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザID',
  `now_box_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '箱タイプ\n0:銅\n1:銀\n2:金',
  `chain_step_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鎖ステップ数',
  `no_level_up_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '連続レベルアップ失敗数',
  `chance_time_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ブレイクチャンス残り回数',
  `chance_hit_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ブレイクチャンス当選数',
  `use_sword_1_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ソード1使用数',
  `use_sword_2_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ソード2使用数',
  `use_sword_3_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ソード3使用数',
  `break_box_0_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '銅破壊数',
  `break_box_1_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '銀破壊数',
  `break_box_2_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金破壊数',
  `break_box_3_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '予備宝箱破壊数',
  `create_date` datetime NOT NULL COMMENT '作成日時',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`theme_summons_user_data_id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='テーマ召喚1(天魔の宴)ユーザデータ';



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
  KEY `event_common` (`event_id`,`t_common_id`),
  KEY `index_inserted_on` (`inserted_on`)
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
  KEY `event_common_round` (`event_id`,`t_common_id`,`round`),
  KEY `index_inserted_on` (`inserted_on`)
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



# Dump of table user_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_account`;

CREATE TABLE `user_account` (
  `account` varchar(100) NOT NULL COMMENT 'アカウント',
  `password` varchar(100) DEFAULT NULL COMMENT 'パスワード',
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ユーザーID',
  `ref_uid` int(10) unsigned NOT NULL COMMENT 'プラットフォームログイン時のUID',
  `pokelabo_id` varchar(100) DEFAULT NULL,
  `platform_login_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'プラットフォームログイン状態（0 = 未登録 / 1 = ログイン / 2 = ログアウト）',
  `device_token` varchar(1028) DEFAULT NULL,
  `os_type` enum('ios','android','amazon') DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `delete_date` timestamp NULL DEFAULT NULL COMMENT '削除日時',
  `advertise_id` varchar(64) DEFAULT NULL,
  `mac_address` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`account`),
  KEY `uid_index` (`uid`),
  KEY `platform_login_state_index` (`ref_uid`,`platform_login_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user_account_cookie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_account_cookie`;

CREATE TABLE `user_account_cookie` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `cookie_set` tinyint(1) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user_adventure_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_adventure_event`;

CREATE TABLE `user_adventure_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `event` varchar(255) NOT NULL COMMENT 'イベント',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有効フラグ',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`event_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冒険各種イベント(カードゲットとか)保存用';



# Dump of table user_adventure_quest_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_adventure_quest_state`;

CREATE TABLE `user_adventure_quest_state` (
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `area_id` int(10) unsigned NOT NULL COMMENT 'エリアID',
  `quest_id` int(10) unsigned NOT NULL COMMENT 'クエストID',
  `step` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '進行度',
  `rest_action_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '中断した場合の残りアクション数',
  `get_card0` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カード取得フラグ',
  `get_card1` tinyint(1) NOT NULL DEFAULT '0',
  `get_card2` tinyint(1) NOT NULL DEFAULT '0',
  `get_card3` tinyint(1) NOT NULL DEFAULT '0',
  `get_card4` tinyint(1) NOT NULL DEFAULT '0',
  `card_complete` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'カードコンプフラグ',
  `boss_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ボスいるかいないか',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`uid`,`area_id`,`quest_id`),
  KEY `area_idx` (`area_id`),
  KEY `quest_idx` (`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冒険クエスト状態';



# Dump of table user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_data`;

CREATE TABLE `user_data` (
  `uid` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'ユーザー名',
  `invite_id` varchar(255) DEFAULT NULL COMMENT '自分の招待ID',
  `invite_uid` int(10) unsigned DEFAULT NULL COMMENT '招待者のユーザーID',
  `comment` varchar(255) NOT NULL COMMENT 'コメント',
  `virtual_money` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ゲーム内通貨',
  `stamina` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行動力(冒険P)',
  `stamina_max` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行動力(冒険P)最大値',
  `stamina_recover_bonus` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行動力回復ボーナス（秒）',
  `stamina_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gvg_stamina` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ラグナロク用行動力(MP)',
  `gvg_life` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ラグナロク用体力(HP)',
  `gvg_win` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GvG勝ち数',
  `gvg_lose` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GvG負け数',
  `gvg_draw` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GvG引き分け数',
  `gvg_winning` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GvG連勝数',
  `gvg_winning_max` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GvG最大連勝数',
  `gacha_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ガチャポイント',
  `attribute` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ゲーム属性',
  `exp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '経験値',
  `level` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'レベル',
  `parameter_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '振り分けポイント',
  `last_adventure_area` int(10) unsigned NOT NULL DEFAULT '0',
  `last_adventure_quest` int(10) unsigned NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'データ作成日時',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'データ更新日時',
  `delete_date` timestamp NULL DEFAULT NULL COMMENT 'データ削除日時',
  `mute_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'to disable user from posting in forums',
  `card_data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'メインカードID',
  `max_card` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '最大カード所有枚数',
  `max_friends` int(10) unsigned NOT NULL DEFAULT '20',
  `total_guild_point` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '累計GP',
  `deck_cost` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'デッキコスト',
  `tutorial_step` int(10) NOT NULL DEFAULT '0' COMMENT 'チュートリアル進行度',
  `tutorial_step_state` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'チュートリアル進行度内の\nさらにステート管理用',
  `tutorial_skip` int(11) DEFAULT '0',
  `member_attr1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '選択中メンバ(属性1)',
  `member_attr2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '選択中メンバ(属性2)',
  `member_attr3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '選択中メンバ(属性3)',
  `tutorial_finish_time` timestamp NULL DEFAULT NULL COMMENT 'チュートリアル終わった時間',
  `adventure_start_time` timestamp NULL DEFAULT NULL COMMENT '初めて冒険に入った時間',
  `int1` int(10) unsigned NOT NULL,
  `int2` int(10) unsigned NOT NULL,
  `int3` int(10) unsigned NOT NULL,
  `int4` int(10) unsigned NOT NULL,
  `int5` int(10) unsigned NOT NULL,
  `vc1` varchar(255) NOT NULL,
  `vc2` varchar(255) NOT NULL,
  `vc3` varchar(255) NOT NULL,
  `vc4` varchar(255) NOT NULL,
  `vc5` varchar(255) NOT NULL,
  `ts1` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ts2` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ts3` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `invite_id_UNIQUE` (`invite_id`),
  KEY `invite_uid_INDEX` (`invite_uid`),
  KEY `index_level` (`level`),
  KEY `name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ユーザーデータ';



# Dump of table user_login_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_login_info`;

CREATE TABLE `user_login_info` (
  `uid` int(11) NOT NULL COMMENT 'ユーザーID',
  `last_login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_bonus_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '最終ログインボーナス取得日',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ログイン情報';



# Dump of table user_onetime_event_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_onetime_event_data`;

CREATE TABLE `user_onetime_event_data` (
  `uid` int(10) unsigned NOT NULL COMMENT 'uid',
  `type` int(10) unsigned NOT NULL COMMENT '種類',
  `identify` int(10) unsigned NOT NULL COMMENT '識別番号\n',
  `date` date NOT NULL COMMENT '日付',
  PRIMARY KEY (`uid`,`type`,`identify`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='１回だけ起きるイベントを記憶する汎用テーブル';



# Dump of table user_quiz_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_quiz_state`;

CREATE TABLE `user_quiz_state` (
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `category_id` int(10) unsigned NOT NULL COMMENT 'カテゴリID',
  `question_id` int(10) unsigned NOT NULL COMMENT '問題ID',
  `clear_date` timestamp NULL DEFAULT NULL COMMENT '正解日時',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`uid`,`category_id`,`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='クイズ進捗';



# Dump of table user_session_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_session_data`;

CREATE TABLE `user_session_data` (
  `uid` int(10) unsigned NOT NULL COMMENT 'UID',
  `uuid` varchar(100) NOT NULL COMMENT 'UUID',
  `session_id` varchar(255) CHARACTER SET ascii DEFAULT NULL COMMENT 'session id',
  `app_version` float NOT NULL DEFAULT '-1' COMMENT 'login/registerで送られてくるアプリのバージョン',
  `uninstall_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'PushNotificationから受け取ったuninstallを保存\n(新規セッション張られるたびにfalseをセットする。インストールされてなければsession張られることもないから)',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `session_id_UNIQUE` (`session_id`),
  KEY `uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='uidとsession_idを紐づける\nなぜかアプリのバージョンやら、アンインストールのフラグやらもついでに管理';



# Dump of table user_shogo_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_shogo_data`;

CREATE TABLE `user_shogo_data` (
  `user_shogo_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '称号ID',
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `user_shogo_mst_id` int(10) unsigned NOT NULL COMMENT '称号マスターID',
  `equip_flg` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '装備フラグ(0:未装備 1:装備中 2:削除)',
  `insert_date` timestamp NULL DEFAULT NULL COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`user_shogo_data_id`),
  KEY `index_uid` (`uid`),
  KEY `index_user_shogo_mst_id` (`user_shogo_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='個人称号データ';



# Dump of table user_shogo_mst
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_shogo_mst`;

CREATE TABLE `user_shogo_mst` (
  `user_shogo_mst_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '称号ID',
  `name` varchar(64) NOT NULL COMMENT '称号名',
  `user_shogo_detail` varchar(256) NOT NULL COMMENT '称号詳細',
  `img` varchar(256) NOT NULL DEFAULT '' COMMENT '画像ファイル名',
  PRIMARY KEY (`user_shogo_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='個人称号マスタ';



# Dump of table user_social_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_social_data`;

CREATE TABLE `user_social_data` (
  `uid` int(10) unsigned NOT NULL COMMENT 'ｱﾌﾟﾘ内UID',
  `social_type` varchar(255) DEFAULT NULL COMMENT 'ｿｰｼｬﾙﾒﾃﾞｨｱﾀｲﾌﾟ(0:Twitter, 1:Facebook)',
  `social_id` varchar(255) DEFAULT NULL COMMENT 'ｿーｼｬﾙﾒﾃﾞｨｱ登録ﾕｰｻﾞID',
  `social_user_name` varchar(255) DEFAULT NULL COMMENT 'ｿーｼｬﾙﾒﾃﾞｨｱ登録名（個人情報の観点から現在登録させていません）',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`uid`),
  KEY `index_social_type` (`social_type`),
  KEY `index_social_id` (`social_id`),
  KEY `index_social_name` (`social_user_name`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ｿｰｼｬﾙﾒﾃﾞｨｱ情報';



# Dump of table user_visit_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_visit_data`;

CREATE TABLE `user_visit_data` (
  `uid` int(10) unsigned NOT NULL COMMENT 'ユーザーID',
  `type` int(10) unsigned NOT NULL COMMENT '訪問ページタイプ(1:guildBbs)',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日時',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新日時(訪問日時)',
  PRIMARY KEY (`uid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ユーザー毎に訪問ヒストリーを残すテーブル';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
