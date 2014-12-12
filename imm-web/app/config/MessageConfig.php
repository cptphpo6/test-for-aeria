<?php
namespace config;

use pokelab\ConfigLoader;

/**
 * 設定情報クラス。
 */
class MessageConfig {
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

    /**
     * 設定情報。
     * @var array
     */
    private $_config;

    /**
     * コンストラクタ。
     */
    protected function __construct() {
        $path = sprintf('%s/message.%s', CONFIG_DIR, CONFIG_TYPE);
        $this->_config = ConfigLoader::load($path);
    }

    // 設定値取得
    /**
     * 設定されている値を取得する。
     * @param string $key 値名
     * @param string $category カテゴリ
     * @param mixed $default デフォルト値
     * @return string 設定されている値<br/>
     */
    public static function get($key, $category) {
        $instance = self::getInstance();
        if (is_array($key)) {
            $format = $instance->get_core(array_shift($key), $category);
            return vsprintf($format, $key);
        } else {
            return $instance->get_core($key, $category);
        }
        return $key;
    }

    private static function get_core($key, $category) {
        $instance = self::getInstance();
        if (isset($instance->_config[$category][$key])) {
            $text = $instance->_config[$category][$key];
            $text = trim($text);
            return gettext($text);
        }
        return $key;
    }

    /**
     * カテゴリ配下の設定を取得する。
     * @param string $category カテゴリ
     * @return string カテゴリ配下の設定<br/>
     * カテゴリが存在しなければnull
     */
    public function getEntriesOf($category) {
        $instance = self::getInstance();
        if (array_key_exists($category, $instance->_config)) {
            return $instance->_config[$category];
        }
        return null;
    }
}
