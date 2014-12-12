<?php

namespace config;

use config\AppConfigBase;

/**
 * テーマ召喚設定情報クラス。
 */
class ManastoneTrainingConfig extends EventBaseConfig {
	protected static $_file_name = 'event/manastone_training';

    /**
     * 唯一無二のインスタンス
     * @var \pokelab\Config
     */
    private static $_instance = null;

    /**
     * @return Config 設定情報
     */
    public static function getInstance() {
        if (self::$_instance === null) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }
}
