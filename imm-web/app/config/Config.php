<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Config
 *
 * @author KikawaToshiki
 */
namespace config;
use pokelab\ConfigLoader;


class Config {
    //put your code here
    /**
     * 唯一無二のインスタンス
     * @var \pokelab\Config
     */
    private static $_instance = array();

    public static function getCampaign() { return static::getInstance('campaign_v1'); }
    public static function getRingmenu() { return static::getInstance('ringmenu'); }
    /**
     * @return Config 設定情報
     */
    public static function getInstance($name) {
        if (empty(self::$_instance[$name])) {
            self::$_instance[$name] = new self($name);
        }
        return self::$_instance[$name];
    }

    /**
     * 設定情報。
     * @var array
     */
    private $_config;

    /**
     * コンストラクタ。
     */
    protected function __construct($name) {
        $path = sprintf('%s/%s.%s', CONFIG_DIR, $name, CONFIG_TYPE);
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
    public function get($key, $category) {
        if (is_array($key)) {
            $format = $this->get_core(array_shift($key), $category);
            return vsprintf($format, $key);
        } else {
            return $this->get_core($key, $category);
        }
        return $key;
    }

    private function get_core($key, $category) {
        if (isset($this->_config[$category][$key])) {
            return $this->_config[$category][$key];
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
        if (array_key_exists($category, $this->_config)) {
            return $this->_config[$category];
        }
        return null;
    }

    /**
     * コンフィグファイルから読み込んだデータを
     * すべて返す
     */ 
    public function getAllEntry() {
        return $this->_config;
    }
    
}
