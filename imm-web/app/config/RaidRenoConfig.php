<?php

/**
 * @author Hai Minh Nguyen
 */

namespace config;

use pokelab\ConfigLoader;
use logic\RaidRenoConfigLogic;

class RaidRenoConfig {

    private static $_instance = null;
    private $_config;

    public static function getInstance() {
        if (empty(self::$_instance)) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    protected function __construct() {
        $raid_reno_config_logic = new RaidRenoConfigLogic;
        $this->_config = $raid_reno_config_logic->getConfById($_SESSION['_raid_reno_event_id']);
    }

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

    public function getEntriesOf($category) {
        if (array_key_exists($category, $this->_config)) {
            return $this->_config[$category];
        }
        return null;
    }

    public function getAllEntry() {
        return $this->_config;
    }

}
