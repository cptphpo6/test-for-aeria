<?php
namespace config;

use pokelab\ConfigLoader;

/**
 * 設定情報クラス。
 */
class EventGachaConfig extends EventBaseConfig {

    protected static $_file_name = 'event/gacha';

    /**
     * 唯一無二のインスタンス
     * @var \pokelab\Config
     */
    protected static $_instance = null;

}
