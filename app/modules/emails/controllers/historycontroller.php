<?php

namespace App\Modules\Emails\Controllers;

use App\Modules\Emails\Models\HistoryModel;
use App\Modules\Emails\Setting as EmailSetting;
use App\Utilities\Utilitie;

class HistoryController extends Utilitie
{
    function dashboard()
    {

        if (!EmailSetting::permission('dashboard')) :
            $this->notAllowd();
        endif;

        $recordModel = new HistoryModel();

        $recordModel->pagination = true;
        $result = $recordModel->get();

        return (object) [
            "obj" => $result,
            "view" => "mails",
            "meta" => [
                "title" => PROJECT_NAME
            ]
        ];
    }
}
