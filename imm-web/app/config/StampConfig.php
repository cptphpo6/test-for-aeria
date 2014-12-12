<?php
namespace config;

use pokelab\ConfigLoader;
use pokelab\framework\core\ClassFactory;

/**
 * 設定情報クラス。
 */
class StampConfig extends AppConfigBase {

    protected static $_file_name = 'stamp';

    protected $_monthly_config = null;
    protected $_open_event_config = null;

    /**
     * 唯一無二のインスタンス
     * @var \pokelab\Config
     */
    protected static $_instance = null;

    /**
     * 開催中判定(ログインボーナスで利用)
     * @param
     * @return void
     */
    public function isOpen() {

        $isOpen       = false;
        $date         = getDate();
        $start_date   = $this->get("start_date", sprintf("%04d%02d", $date['year'], $date['mon']));

        if (!empty($start_date)) { 
            // 開催スタート日
            $start_timestamp = strtotime(date(sprintf("%04d-%02d-%02d 00:00:00", $date["year"], $date["mon"], $start_date)));
            // 開催終了日(月末) 翌月まで継続するかはコンフィグの設定次第
            $end_timestamp   = strtotime(date("Y-m-d 23:59:59", mktime(0, 0, 0, $date["mon"]+1, 0, $date["year"])));
            $now             = time();

            $isOpen = $start_timestamp <= $now && $now <= $end_timestamp;
        }

        return $isOpen;

    }


    /**
     * スタンプラリー用に AppConfigBase::get を オーバーライド 
     * @param
     * @return void
     */
    public function getMonthlyConfig($key, $monthly = null, $default = null) {

        if (!is_array($this->_monthly_config)) {
            $this->_monthly_config 
                        = $this->getEntriesOf($monthly);
            if ($this->_monthly_config === null) {
                $this->_monthly_config = array(); 
            }
        }

        return array_key_exists($key, $this->_monthly_config) ? 
                                            $this->_monthly_config[$key] : $default;
        
    }

    public function get($key = null, $monthly = null, $default = null) {
        $value = null;
        if (!empty($key)) {
            // 現状のロジックにも対応できるよう 日付け(YYYYMM) 指定にも対応
            // (これはのちに削除)
            if (null !== $monthly and preg_match("/^\d{4}\d{2}$/", $monthly)) {
                $value = $this->getMonthlyConfig($key, $monthly);
            }
            else {
                // 開催中のイベントを取得
                $event = $this->retrieveOpenEvent();
                if (is_array($event) and array_key_exists($key, $event)) {
                    $value = $event[$key];
                }
            }
        }
        return (null !== $value) ? 
                        $value : $default;
    }

    protected function dateToJP($datetime = null) {
        $date_jp = '';
        if (null !== $datetime) {
            $wdays = array('日', '月', '火', '水', '木', '金', '土');
            $d = getdate(strtotime($datetime));
            $date_jp = sprintf("%s/%s(%s)", $d['mon'], $d['mday'], $wdays[$d['wday']]);
        }
        return $date_jp;
    }

    protected function dateToEN($datetime = null) {
        $date_en = '';
        if (null !== $datetime) {
            $d = getdate(strtotime($datetime));
            $date_en = sprintf("%s/%s", $d['mon'], $d['mday']);
        }
        return $date_en;
    }

    protected function retrieveOpenEvent($event_key = null) {

        $event      = array();
        $event_name = null;

        if (null !== $event_key) {
            $entry = $this->getEntriesOf($event_key);
            if (null !== $entry) {
                $event[]    = $entry;
                $event_name = $event_key;
            }
        }
        else {

            // イベントキーが指定されなかった場合は
            // 全エントリーから 期間内のものを探索
            $config_data = $this->getAllEntry();
            $now = time(); 
            if (is_array($config_data)) 
            {

                foreach($config_data as $name => $entry) 
                {

                    if (!empty($entry['start_date']) and !empty($entry['end_date'])) 
                    {
                        $start_time = strtotime($entry['start_date']);
                        $end_time   = strtotime($entry['end_date']);

                        // 期間内のイベント有り
                        if ($now >= $start_time && $now <= $end_time) 
                        {
                            $event_name = $name;
                            $event[]    = $entry;
                        }

                    }

                }

            }

        }

        if (1 === count($event)) {
           $event          = $event[0];
           $event['event'] = $event_name;
           // format the time in english version by calling dateToEN
           $event['start_date_jp'] = $this->dateToEN($event['start_date']);
           $event['end_date_jp']   = $this->dateToEN($event['end_date']);
           if (!empty($event['stamp_present_list'])){ 
               
               //$item_mst_model = $this->loadModel("ItemMstModel");
               $item_mst_model = ClassFactory::loadModel("ItemMstModel");

               foreach($event['stamp_present_list'] as $num => $values) {
                   if (!empty($values['type'])){
                      $type = $values['type'];
                      if ('virtual_money' === $type) {
                          $event['stamp_present_list'][$num]['img'] = 'vm';
                      }
                      else if('gacha_p' === $type) {
                          $event['stamp_present_list'][$num]['img'] = 'gp';
                      }
                      else if('item' === $type) {
                          $item_data = $item_mst_model->getMst($values['id']);
                          if(!empty($item_data)) {
                              $event['stamp_present_list'][$num]['img'] = 
                                                    sprintf("%s_%s", $type, $item_data['img']);
                          }
                      } 
                      else {
                          $event['stamp_present_list'][$num]['img'] = 
                                            sprintf("%s_%s", $type, $values['id']);
                      }
                   }
               }
           }
        }
        else  {
           // コンフィグの設定ミスかイベント自体が存在しない
           $event = null;
        }

        return $event;

    }


    public function hasOpenEvent($event_name = null) {
       
        if (null === $this->_open_event_config) 
        {
            $this->_open_event_config  = 
                            $this->retrieveOpenEvent($event_name);
        }

        return is_array($this->_open_event_config);

    }

    public function getConfig($event_name = null) {
        return (null === $this->_open_event_config) ? 
                         ($this->_open_event_config = $this->retrieveOpenEvent($event_name)) :
                          $this->_open_event_config;
    }
   
}
