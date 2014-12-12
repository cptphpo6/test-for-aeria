<?php
namespace config;

use pokelab\ConfigLoader;
use logic\GachaConfigLogic;
use logic\CardMergConfigLogic;
use logic\SkillBonusConfigLogic;
use logic\GachaBoxEventLogic;
use logic\GachaEventLogic;
use logic\CvcEventLogic;
use logic\GachaStepEventLogic;
use logic\ManastoneTrainingEventLogic;

/**
 * 設定情報クラス。
 */
class EventBaseConfig extends AppConfigBase {

    // 現在開催中のイベント設定を取得
    public function getNowEnableEvent($user, $tag, $b_disp = false) {
        $conf = $this->getEntriesOf($tag);

		// Customizable summons events by CMS tool
		if($tag == "gacha"){
			$gacha_config_logic = new GachaConfigLogic;
            $gacha_step_event_logic = new GachaStepEventLogic();
            
			$conf["one_day"] = $gacha_config_logic->getConfByType("one_day");
			$conf["lunchtime"] = $gacha_config_logic->getConfByType("lunchtime");
			$conf["dinnertime"] = $gacha_config_logic->getConfByType("dinnertime");
			$conf["normal"] = $gacha_config_logic->getConfByType("normal");
			$conf["rare1"] = $gacha_config_logic->getConfByType("rare1");
			$conf["rare2"] = $gacha_config_logic->getConfByType("rare2");
			$conf["rare2_1st"] = $gacha_config_logic->getConfByType("rare2_1st");

            //adding gacha step event configuration
            $step_conf = $gacha_step_event_logic->getCurrent(true);

            if( isset($step_conf) ) {
               
                $conf['rare2_step']['start'] = $step_conf['start'];
                $conf['rare2_step']['end'] = $step_conf['end'];
                $conf['rare2_step']['disp_start'] = $step_conf['disp_start'];
                $conf['rare2_step']['disp_end'] = $step_conf['disp_end'];
                $conf['rare2_step']['event_type'] = $step_conf['event_type'];
                $conf['rare2_step']['max_step_rate'] = $step_conf['max_step_rate'];
                $conf['rare2_step']['level_up_premium'] = $step_conf['level_up_premium'];



                //set the step data in the correct format for the step gacha
                foreach( $step_conf['step_data'] as $key => $step_data ) {
                    $conf["rare2_step_lv".($key+1)] = $step_data;
                }
                //set the step data for tickets in the correct format for the step gacha (always same as normal step gacha)
                foreach( $step_conf['step_data'] as $key => $step_data ) {
                    $conf["rare2_step_lv".($key+1)."_ticket"] = $step_data;
                    $conf["rare2_step_lv".($key+1)."_ticket"]['ticket'] = array(
                        'type' => 'rare_2_lv_'.($key+1),
                        'num' => 1
                    );
                    unset($conf["rare2_step_lv".($key+1)."_ticket"]['purchase_money']);
                }
                
            }
			// 1 Free a day (keys)
			if(isset($conf["rare2_once_a_day_key_x_3"])){
				$once_a_day_key_conf = $gacha_config_logic->getConfByType("rare2_once_a_day_key_x_3");
				$conf["rare2_once_a_day_key_x_3"]["start"] = $once_a_day_key_conf["start"];
				$conf["rare2_once_a_day_key_x_3"]["end"] = $once_a_day_key_conf["end"];
				$conf["rare2_once_a_day_key_x_3"]["banner"] = $once_a_day_key_conf["banner_img"];
				$conf["rare2_once_a_day_key_x_3"]["purchase_money"] = $once_a_day_key_conf["purchase_money"];
			}
			
			$gacha_box_event_logic = new GachaBoxEventLogic;
			$gacha_box_event_configs = $gacha_box_event_logic->getNowEnableEventConfigs();
			foreach($gacha_box_event_configs as $gb_conf){
				$conf["gacha_box_" . $gb_conf["id"]] = $gb_conf;
			}

		}
		
		// Customizable sacrifice event by CMS tool
		if($tag == "card_merg"){
			$card_merg_config_logic = new CardMergConfigLogic;
            $skill_bonus_config_logic = new SkillBonusConfigLogic();
			$conf["merg_per_up"] = $card_merg_config_logic->getConf();
            $conf["skill_per_up"] = $skill_bonus_config_logic->getConf();
		}
		
		// Customizable Crystal Smash gacha events by CMS tool
		if($tag == "theme_summons"){
			$gacha_event_logic = new GachaEventLogic;
			foreach($conf as $conf_key => $conf_value){
				$event_id = isset($_SESSION["_current_gacha_event_id"]) ? $_SESSION["_current_gacha_event_id"] : null;
				$conf[$conf_key] = $gacha_event_logic->getConfById($event_id, $conf_value);	
				break ;
			}
		}

		// Customizable Selection Battle by CMS tool
		if($tag == "cvc"){
			$cvc_event_logic = new CvcEventLogic;
			$cvc_event_config = $cvc_event_logic->getConfById(null);
			if(!empty($cvc_event_config)){
				$conf["default"] = $cvc_event_config;	
			}
		}
        
        //completely override the conf
        if( $tag == "manastone_training" ) {
            $manastone_training_event_logic = new ManastoneTrainingEventLogic();
			$manastone_training_config = $manastone_training_event_logic->getConfById(null);
            
            if(!empty($manastone_training_config)){
				$conf["manastone_training"] = $manastone_training_config;	
			}
        }

        $event_conf = array();
        
        
        if ($conf && (count($conf) > 0)) {
            $now_date = strtotime(date("Y-m-d H:i:s"));

            // イベント定義分ループ
            foreach ($conf as $key => $value) {
                
                if( !isset($value) ) {
                    continue;
                }
                
                // 開始期間
                $start_date = null;
                if ($user && isset($value['start_tutorial_end']) && $value['start_tutorial_end']) {
                    // チュートリアル終了時間
                    $start_date = strtotime(date($user->tutorial_finish_time));
                }
                if (isset($value['start'])) {
                    $event_start_date = strtotime($value['start']);

                    if (is_null($start_date) || ($event_start_date > $start_date)) {
                        $start_date = $event_start_date;    // イベント後を採用
                    }
                }
                $value['start_date'] = $start_date;
                $check_start_date = $start_date;


                // 表示期間のチェック
                if ($b_disp) {
                    $disp_start_date = null;
                    if ($user && isset($value['disp_start_tutorial_end']) && $value['disp_start_tutorial_end']) {
                        // チュートリアル終了時間
                        $disp_start_date = strtotime(date($user->tutorial_finish_time));
                    }
                    if (isset($value['disp_start'])) {
                        $event_disp_start_date = strtotime($value['disp_start']);

                        if (is_null($disp_start_date) || ($event_disp_start_date > $disp_start_date)) {
                            $disp_start_date = $event_disp_start_date;    // イベント後を採用
                        }
                    }

                    if (!is_null($disp_start_date) && ($now_date < $disp_start_date)) {
                        continue;   // アウトー
                    }
                    $value['disp_start_date'] = $disp_start_date;
                    $check_start_date = $disp_start_date;   // 表示設定がある場合はこちらを優先
                }

                if (!is_null($check_start_date) && ($now_date < $check_start_date)) {
                    continue;   // アウトー
                }


                // 終了期間
                $end_date = null;
                if (isset($value['end'])) {
                    $end_date = strtotime($value['end']);
                } else if (isset($value['end_add'])) {
                    $end_date = strtotime($value['end_add'], $start_date);
                }
                $value['end_date'] = $end_date;
                $check_end_date = $end_date;

                // 表示期間のチェック
                if ($b_disp) {
                    $disp_end_date = null;
                    if (isset($value['disp_end'])) {
                        $disp_end_date = strtotime($value['disp_end']);
                    } else if (isset($value['disp_end_add'])) {
                        $disp_end_date = strtotime($value['disp_end_add'], $disp_start_date);
                    }
                    if (!is_null($disp_end_date) && ($disp_end_date < $now_date)) {
                        continue;   // アウトー
                    }

                    $value['disp_end_date'] = $disp_end_date;
                    $check_end_date = $disp_end_date;   // 表示設定がある場合はこちらを優先
                }

                if (!is_null($check_end_date) && ($check_end_date < $now_date)) {
                    continue;   // アウトー
                }

                if ($b_disp && $disp_end_date && $end_date
                    && ($end_date < $now_date)          // イベントが終わって
                    && ($disp_end_date >= $now_date)    // 表示のみの期間中
                ) {
                    $value['b_lose_time'] = true;
                }

                // ここまできたなら有効なイベント
                if ($end_date) {
                    $value['end_time'] = date('m/d H:i', $end_date);
                }

                
                $event_conf[$key] = $value;
            }
        }

        return $event_conf;
    }
}
