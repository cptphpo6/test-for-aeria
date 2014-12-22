<?php
echo 'This is for Deployment test - Aeria Games1';
error_reporting(E_ALL);
echo 'This is for Deployment test - Aeria Games2';
require_once dirname(__DIR__) . '/bootstrap.php';
echo 'This is for Deployment test - Aeria Games3';
use pokelab\framework\core\Dispatcher;
use pokelab\framework\core\view\ViewManager;
use pokelab\framework\Log;
echo 'This is for Deployment test - Aeria Games4';
$vm = ViewManager::getInstance();
$vm->init(CONFIG_DIR . 'view.' . CONFIG_TYPE);

// PATH解析
$path_info = (array_key_exists('url', $_GET)) ? $_GET['url'] : null;

if (AppStats::getAppMode() == AppStats::APP_MODE_GAME) {
    require_once dirname(__DIR__) . '/lib/ProcessingTimeWatcher.php';
    $processing_time_watcher = new ProcessingTimeWatcher();
}

// VIEW実行
try {
    $dispacher = new Dispatcher($path_info);
    $dispacher->run();
} catch (Exception $e) {
    Log::getInstance()->err(get_class($e) . ' ' . $e->getMessage() . ' ' . $e->getTraceAsString());
}

