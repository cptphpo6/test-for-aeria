<?php
namespace config;

use pokelab\ConfigLoader;

/**
 * 設定情報クラス。
 */
class EventCardMergConfig extends EventBaseConfig {

    protected static $_file_name = 'event/card_merg';

    /**
     * 唯一無二のインスタンス
     * @var \pokelab\Config
     */
    protected static $_instance = null;

}
