<?php
    use pokelab\framework\cache\CacheManager;
    use pokelab\framework\core\Dispacher;
    use pokelab\framework\Config;
    use pokelab\framework\core\view\ViewManager;

    $dirName  = dirname( dirname( dirname( __FILE__ ) ) );

    /**
     * DIRECTORY_SEPARATORのエイリアス。
     * @var string
     */
    define( 'DS', DIRECTORY_SEPARATOR );
    /**
     * ルートディレクトリ。
     * @var string
     */
    define( 'ROOT', $dirName . DS );
    /**
     * アプリケーションルートディレクトリ。
     * @var string
     */
    define( 'APP_ROOT'  , ROOT . 'app' . DS );
    /**
     * ライブラリルートディレクトリ。
     * @var string
     */
    define( 'LIB_ROOT'  , ROOT . 'lib' . DS );
    /**
     * configファイルディレクトリ。
     * @var string
     */
    define( 'CONFIG_DIR', APP_ROOT . 'config' . DS . 'production' . DS );
    // define( 'CONFIG_DIR', APP_ROOT . 'config' . DS . 'development' . DS );

    // パスを通す
    ini_set(
        'include_path',
//        APP_ROOT . 'controller' . DS . PATH_SEPARATOR .
//        APP_ROOT . 'model'      . DS . PATH_SEPARATOR .
//        APP_ROOT . 'logic'      . DS . PATH_SEPARATOR .
        ROOT     . 'app'        . DS . PATH_SEPARATOR .
        ROOT     . 'lib'        . DS . PATH_SEPARATOR .
        ROOT     . 'lib'        . DS . 'common' . DS . PATH_SEPARATOR .
        ini_get( 'include_path' )
        );
    // 各マネージャーの初期化処理
    $cm = CacheManager::getInstance();
    $cm->init( CONFIG_DIR . 'cache.json' );

    $vm = ViewManager::getInstance();
    $vm->init( CONFIG_DIR . 'view.json' );

    // タイムゾーン設定
    $config = Config::getInstance();
    date_default_timezone_set( $config->get( 'timezone' ) );

    // Localization
    $language = 'en_US';
    putenv("LANG=$language");
    setlocale(LC_ALL, $language);
    $domain = 'messages';
    bindtextdomain($domain, "../locale");
    textdomain($domain);

    // PATH解析
    //$pathInfo = getenv( 'PATH_INFO' );
    $pathInfo = ( array_key_exists( 'url', $_GET ) ) ? $_GET['url'] : null;//getenv( 'PATH_INFO' );

    // VIEW実行
    $dispacher = new Dispacher( $pathInfo );
    $dispacher->run();

    /**
     * オートローダー。
     * @param string $className クラス名
     */
    function __autoload( $className ='') {

        // Smartyとの共存の為に必要な部分
        $class_name = strtolower($className);
        if ( substr( $class_name, 0, 16 ) === 'smarty_internal_' || $class_name == 'smarty_security' ) {

            include LIB_ROOT . 'Smarty/sysplugins/' . $class_name . '.php';

        }
        // XXX コーディング規約に沿わないが、コメントを書く為に必要なのでこうする
        // 以下、自前の処理
        else if ( !class_exists( $className ) ) {

            //echo '' . $className . '::';

            $fileName = str_replace( '\\', DS, $className ) . '.php';
            $filePath = LIB_ROOT . $fileName;
            if ( file_exists( LIB_ROOT . $filePath ) ) {

                //echo 'file found[' . $fileName . ']<br />';
                require_once $filePath;
            }
            else if ( file_exists( APP_ROOT . $filePath ) ) {

                //echo 'file found[' . $fileName . ']<br />';
                require_once $filePath;
            }
            else {

                //echo 'file not found ' . $className . '[' . $fileName . ']<br />';

                require_once $fileName;
            }
        }
    }
