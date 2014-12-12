<?php
namespace config;

use config\AppConfigBase;

/**
 * 設定情報クラス。
 */
class EventCvcConfig extends EventBaseConfig {

    protected static $_file_name = 'event/cvc';

    /**
     * 唯一無二のインスタンス
     * @var \pokelab\Config
     */
    protected static $_instance = null;

}
