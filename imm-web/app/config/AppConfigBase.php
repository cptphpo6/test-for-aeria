<?php
namespace config;

use pokelab\ConfigLoader;
use pokelabo\utility\ArrayUtility;
use logic\CvcEventLogic;
use logic\RagnaEventLogic;
use logic\PreselectionEventLogic;
use logic\StrengtheningWeekEventLogic;
use logic\GachaStepEventLogic;

/**
 * 設定情報クラス。
 */
abstract class AppConfigBase {

    protected static $_file_name = 'config.yaml';

    /**
     * 設定情報。
     * @var array
     */
    private $_config;

    /**
     * コンストラクタ。
     */
    protected function __construct() {
        $path = sprintf('%s/%s.%s', CONFIG_DIR, static::$_file_name, CONFIG_TYPE);
        $this->_config = ConfigLoader::load($path);
    }

    /**
     * シングルトンインスタンスを取得。
     */
    public static function getInstance() {
        if (static::$_instance === null) {
            static::$_instance = new static();
        }

        return static::$_instance;
    }

    // 設定値取得
    /**
     * 設定されている値を取得する。
     * @param string $key 値名
     * @param string $category カテゴリ
     * @param mixed $default デフォルト値
     * @return string 設定されている値<br/>
     */
    public function get($key, $category = 'application', $default = null) {
        if (!array_key_exists($category, $this->_config)) {
            return $default;
        }
        if (!array_key_exists($key, $this->_config[$category])) {
            return $default;
        }
        
        if($category == "ragnarok" 
        	&& in_array($key, array("beind_held_date","page_control","watch_page_control"))
        ){
        	$ragna_event_logic = new RagnaEventLogic;
        	$ragna_event_config = $ragna_event_logic->getConfById(null);
        	if(!empty($ragna_event_config)){
        		if($key == "beind_held_date"){
					$this->_config[$category]["beind_held_date"] = $ragna_event_config["beind_held_date"];
				
	        	}else if($key == "page_control" || $key == "watch_page_control"){
	        		$battle_start = substr($ragna_event_config["start"], 11, 8);
	        		$battle_end = substr($ragna_event_config["end"], 11, 8);
	        		
	        		$this->_config[$category][$key]["ragnarok_start_date"]["end_date"] = $battle_start;
	        		$this->_config[$category][$key]["ragnarok_battle_date"]["start_date"] = $battle_start;
	        		$this->_config[$category][$key]["ragnarok_battle_date"]["end_date"] = $battle_end;
	        		$this->_config[$category][$key]["ragnarok_end_date"]["start_date"] = $battle_end;
	        	}
        	}
    	}
        
        if( $category=='gacha' && $key == 'rare2_step' ) {
            $gacha_step_event_logic = new GachaStepEventLogic();
            $this->_config[$category][$key] = $gacha_step_event_logic->getConfById();
        }
	        
		if( $category == 'guild_attack_rate' ) {
            $strengthening_week_event_logic=  new StrengtheningWeekEventLogic();
			$strengthening_week_event_config = $strengthening_week_event_logic->getConfById(null);
            
            switch($key) {
                case 'start_date':
                    $this->_config[$category][$key] = $strengthening_week_event_config['start'];
                    break;
                case 'end_date':
                    $this->_config[$category][$key] = $strengthening_week_event_config['end'];
                    break;
                case 'attack_rate':
                    $this->_config[$category][$key] = $strengthening_week_event_config['guild_attack_rate'];
                    break;
            }
            
             
        }


        if( $category == 'gvg' && $key == 'gvg_presents_campaign' ) {
            $preselection_event_logic = new PreselectionEventLogic;
            $preselection_event_config = $preselection_event_logic->getConfById(null);
                        
            if( $preselection_event_config['start'] < date('Y-m-d H:i:s')  && date('Y-m-d H:i:s') < $preselection_event_config['end'] && isset($preselection_event_config['gvg_presents_campaign']) && $preselection_event_config['gvg_presents_campaign'] ) {
                $this->_config[$category][$key]['start_date'] = $preselection_event_config['start'];
                $this->_config[$category][$key]['end_date'] = $preselection_event_config['end'];
            }
        }
        
        
        return $this->_config[$category][$key];
    }

    /**
     * カテゴリ配下の設定を取得する。
     * @param string $category カテゴリ
     * @return string カテゴリ配下の設定<br/>
     * カテゴリが存在しなければnull
     */
    public function getEntriesOf($category) {
        if (array_key_exists($category, $this->_config)) {
        	
        	if($category == "field_limit"){
        		$cvc_event_logic = new CvcEventLogic;
                $strengthening_week_event_logic=  new StrengtheningWeekEventLogic();
                
                $cvc_event_config = $cvc_event_logic->getConfById(null);
				$strengthening_week_event_config = $strengthening_week_event_logic->getConfById(null);
                                
				if( !empty($cvc_event_config) && empty($strengthening_week_event_config) ){ //cvc event only exists
                    if($cvc_event_config["end"] > $this->_config[$category]["end_date"]){
					    $this->_config[$category]["start_date"] = $cvc_event_config["start"];
					    $this->_config[$category]["end_date"] = $cvc_event_config["end"];
                    }
				}else if( empty($cvc_event_config) && !empty($strengthening_week_event_config) ) { //strengthening week only exists
                    
                }else if( !empty($cvc_event_config) && !empty($strengthening_week_event_config) ) { //both exist
                    if( $cvc_event_config['start'] < date('Y-m-d H:i:s') && $cvc_event_config['end'] > date('Y-m-d H:i:s')  ) { //cvc event ongoing
                        $this->_config[$category]["start_date"] = $cvc_event_config["start"];
					    $this->_config[$category]["end_date"] = $cvc_event_config["end"];
                    }else if( $strengthening_week_event_config['start'] < date('Y-m-d H:i:s') && $strengthening_week_event_config['end'] > date('Y-m-d H:i:s') ) { //strengthening week event ongoing
                        $this->_config[$category]["start_date"] = $strengthening_week_event_config["start"];
					    $this->_config[$category]["end_date"] = $strengthening_week_event_config["end"];
                        
                        foreach( $this->_config[$category]['field_fact_list'] as $key => &$value ) {
                            $value['name'] = $strengthening_week_event_config['field_effects'][$key]['name'];
                            $value['img'] = $strengthening_week_event_config['field_effects'][$key]['img'];
                            $value['text_up'] = $strengthening_week_event_config['field_effects'][$key]['text_up'];
                            $value['text_down'] = $strengthening_week_event_config['field_effects'][$key]['text_down'];
                            $value['attack_rate_1'] = $strengthening_week_event_config['field_effects'][$key]['attack_rate_1'];
                            $value['attack_rate_2'] = $strengthening_week_event_config['field_effects'][$key]['attack_rate_2'];
                            $value['attack_rate_3'] = $strengthening_week_event_config['field_effects'][$key]['attack_rate_3'];
                        }
                        
                        
                    }
                    
                }
        	}
        	
        	if($category == "ragnarok"){
        		$beind_held_date = $this->get('beind_held_date','ragnarok');
				if(!empty($beind_held_date)){
					$this->_config[$category]["beind_held_date"] = $beind_held_date;
				}
				
				$page_control = $this->get('page_control','ragnarok');
				if(!empty($page_control)){
					$this->_config[$category]["page_control"] = $page_control;
				}
				
				$watch_page_control = $this->get('watch_page_control','ragnarok');
				if(!empty($watch_page_control)){
					$this->_config[$category]["watch_page_control"] = $watch_page_control;
				}
        	}
            
            
            if($category == 'daily' ) {
                $preselection_event_logic = new PreselectionEventLogic;
				$preselection_event_config = $preselection_event_logic->getConfById(null);
                
				if(!empty($preselection_event_config)){
					$this->_config[$category]['start'] = $preselection_event_config['start'];
					$this->_config[$category]['end'] = $preselection_event_config['end'];
                    $this->_config[$category]['id'] = $preselection_event_config['id'];
				}
                     
            }
            
            if( $category == 'field_special' ) {
                $strengthening_week_event_logic=  new StrengtheningWeekEventLogic();
				$strengthening_week_event_config = $strengthening_week_event_logic->getConfById(null);
				if(!empty($strengthening_week_event_config)){
					$this->_config[$category]['start_date'] = $strengthening_week_event_config['start'];
					$this->_config[$category]['end_date'] = $strengthening_week_event_config['end'];
                    $this->_config[$category]['id'] = $strengthening_week_event_config['id'];

                    #IMMIOS-11004: Iron Royal improvements. Start.
                    foreach( $this->_config[$category]['field_fact_list'] as $key => $value ) {
                        #Since logic was changed, field_special is now an array of values instead of single integer value
                        $fieldSpecialValues = array_keys($strengthening_week_event_config['field_special']);
                        if(!in_array($key, $fieldSpecialValues)){
                            unset($this->_config[$category]['field_fact_list'][$key]);
                        }
                        #So we need to loop though it to field_fact_list for each of its keys
                        foreach ($fieldSpecialValues as $fieldSpecial){
                            if ($key != $fieldSpecial) {
                                $this->_config[$category]['field_fact_list'][$fieldSpecial] = $value;
                            }
                        }
                    }
                    #IMMIOS-11004: Iron Royal improvements. Stop.
				}
            }
        	
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

    /**
     * ドット区切りのパスで指定された設定値を取得する
     */
    public function read($path) {
        return ArrayUtility::dig($path, $this->_config, null);
    }

}
