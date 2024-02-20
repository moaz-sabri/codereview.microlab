<?php

namespace App\Extends\Record;

use App\Bootstrap\Loader\AutoLoader;
use App\Bootstrap\Response;
use App\Bootstrap\Web;
use App\Modules\Account\Loader\User;
use App\Extends\Record\RecordModel;
use App\Modules\Core\CoreUrls;
use App\Utilities\Utilitie;

class RecordController extends Utilitie
{
    function index($record)
    {
        $this->isAllowed('view_cpanel_record');

        $RecordModel = new RecordModel();

        $RecordModel->pagination = true;
        $RecordModel->conditions = [["record_type", "=", $record->routeParams->record]];
        $result = $RecordModel->get();

        return (object) [
            "view" => CoreUrls::$resource . "record/index",
            "data" => ['record' => $result],
            "meta" => [
                "title" => PROJECT_NAME
            ],
            "theme" => 'cpanel',
            'bscripts' => AutoLoader::getSourceTable()
        ];
    }

    function userActivity($request)
    {
        $this->isAllowed('activity_self_user');

        $uid = isset($request->routeParams->user) ? $request->routeParams->user : false;
        $result = User::get($uid);

        if ($request->path !== Web::getPath('get_manger_add_user') && !$result) :
            return new Response('Server', 500);
        endif;

        $record = new RecordModel();

        $record->current = $request->queryParams->current ?? 1;
        $record->count = $request->queryParams->count ?? 30;
        $record->pagination = true;

        $record->conditions = [
            ['record_owner', "=", $result->user_uid],
            ["AND", 'record_type', "=", "activity"]
        ];

        $activity = $record->get();


        return (object) [
            'view' => CoreUrls::$resource . 'record/user_activity',
            'data' => [
                'user' => $result,
                'activity' => $activity
            ],
            'theme' => 'cpanel',
            'meta' => ['title' => "User Editor"],
            'bscripts' => AutoLoader::getSourceTable()
        ];
    }
}
