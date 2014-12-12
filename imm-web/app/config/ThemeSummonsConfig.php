<?php

namespace config;

use config\AppConfigBase;

/**
 * テーマ召喚設定情報クラス。
 */
class ThemeSummonsConfig extends EventBaseConfig {
	protected static $_file_name = 'event/theme_summons_event';

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
