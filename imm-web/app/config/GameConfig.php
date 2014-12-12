<?php
namespace config;

use pokelab\ConfigLoader;

/**
 * 設定情報クラス。
 */
class GameConfig extends AppConfigBase {

    protected static $_file_name = 'game';

    /**
     * 唯一無二のインスタンス
     * @var \pokelab\Config
     */
    protected static $_instance = null;

}
