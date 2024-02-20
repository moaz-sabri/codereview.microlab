<?php

namespace App\Modules\Records\Controllers;

use App\Modules\Records\Models\RecordModel;
use App\Modules\Records\Setting as RecordSetting;
use App\Utilities\Utilitie;

class RecordController extends Utilitie
{
    function dashboard()
    {

        if (!RecordSetting::permission('dashboard')) :
            $this->notAllowd();
        endif;

        $recordModel = new RecordModel();

        $recordModel->pagination = true;
        $recordModel->conditions = [["type", "=", "log"]];
        $result = $recordModel->get();

        return (object) [
            "obj" => $result,
            "view" => "dashboard-logs",
            "meta" => [
                "title" => PROJECT_NAME
            ]
        ];
    }

    function historytable()
    {

        if (!RecordSetting::permission('dashboard')) :
            $this->notAllowd();
        endif;

        $recordModel = new RecordModel();
        $recordModel->pagination = true;
        $recordModel->conditions = [["type", "=", "history"]];
        $result = $recordModel->get();

        return (object) [
            "obj" => $result,
            "view" => "dashboard-history",
            "meta" => [
                "title" => PROJECT_NAME,
            ]
        ];
    }
}
