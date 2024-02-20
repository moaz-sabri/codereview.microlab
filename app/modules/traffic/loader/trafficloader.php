<?php

namespace App\Modules\Traffic\Loader;

use App\Modules\Traffic\Models\TrafficModel;
use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Records\Loader\RecordLoader;
use App\Modules\Traffic\Models\VisitorModel;
use App\Utilities\Utilitie;

class TrafficLoader extends Utilitie
{
    function set($start_time)
    {
        $ip_address = $_SERVER['REMOTE_ADDR'] ?? -1;

        $cookie = isset($_COOKIE['PHPSESSID']) ? $_COOKIE['PHPSESSID'] : -1;

        $vi = new VisitorModel;
        $vi->conditions = [
            ["ip_address", "=", $ip_address]
        ];
        $vi = $vi->find();

        if (!$vi) :
            $vi = new VisitorModel;
            $vi->column->guide = $this->guide('V');
            $vi->column->user_agent = $this->getUserAgent();
            $vi->column->ip_address = $ip_address;
            $vi->column->session =  $cookie;
            $vi->column->language =  $this->detectLanguage();
            $vi->column->os = $this->detectOS();
            $vi->column->browser = $this->detectBrowser();
            $vi->column->device = $this->detectDevice();
            $vi = $vi->save();

            RecordLoader::log('add new Visitor', 200);
        endif;

        if ($vi) :
            // the Current path
            $currentUrl = $_SERVER['REQUEST_URI'];


            // check if the visit is exist in db
            $model = new TrafficModel;
            $model->conditions = [
                ["page_url", "=", $currentUrl],
                ["AND", "visitor_id", "=", $vi->uid]
            ];
            $currentTrack = $model->find();

            //  check if need create or update the traffic
            $traff = new TrafficModel;
            $traff->column->type = $this->detectVisitor();

            // the end of load resquest & Convert to milliseconds
            $end_time = microtime(true);
            $page_load_time = ($end_time - $start_time) * 1000;
            $traff->column->page_load_time = number_format($page_load_time, 2);

            $queries = [];
            if (strpos($currentUrl, '?')) :
                parse_str(substr($currentUrl, strpos($currentUrl, '?') + 1), $queries);
                $traff->column->queries = json_encode($queries);
            endif;

            // registertion of current user
            $registered = CryptLoader::decrypt('uid');
            if ($registered) $traff->column->registered_id = $registered;

            if (!$currentTrack) :
                $traff->column->guide = $this->guide('T');
                $traff->column->visitor_id = $vi->uid;
                $traff->column->page_url = $currentUrl;
            else :
                $traff->conditions = [["page_url", "=", $currentUrl]];
                $traff->column->reloaded = $currentTrack->reloaded + 1;

            endif;

            $traff->save();

        endif;
    }
}
