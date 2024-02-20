<?php

namespace App\Modules\Traffic\Controllers;

use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Records\Loader\RecordLoader;
use App\Modules\Traffic\Models\TrafficModel;
use App\Modules\Traffic\Models\VisitorModel;
use App\Modules\Traffic\Setting as Trafficetting;
use App\Modules\Users\Models\UserModel;
use App\Utilities\Utilitie;

class TrafficController extends Utilitie
{
    function dashboard()
    {

        if (!Trafficetting::permission('dashboard')) :
            $this->notAllowd();
        endif;

        $traffic = new TrafficModel();
        $traffic->pagination = true;
        $traffic->merge = [
            [
                "key" => "visitor",
                "table" => "`" . VisitorModel::getTableName() . "` AS visitor",
                "type" => "LEFT",
                "on" => TrafficModel::getTableName() . ".visitor_id = visitor.uid",
                "columns" => (new VisitorModel())->column
            ],
            [
                "key" => "registered",
                "table" => "`" . UserModel::getTableName() . "` AS registered",
                "type" => "LEFT",
                "on" => TrafficModel::getTableName() . ".registered_id = registered.uid",
                "columns" => (object)["name"]
            ]
        ];

        $result = $traffic->join();

        return (object) [
            "obj" => $result,
            "view" => "dashboard",
            "meta" => [
                "title" => PROJECT_NAME,
            ]
        ];
    }

    function delete()
    {
        if (!Trafficetting::permission('delete')) :
            $this->notAllowd();
        endif;

        $traffic = new TrafficModel();
        $guide = $this->parameters->target;

        if (isset($guide) && preg_match($traffic->pattern, $guide)) :
            $traffic->conditions = [["guide", "=", $guide]];

            if (CryptLoader::decrypt('role') != MASTER) :
                $traffic->conditions[] = ["owner", "=", CryptLoader::decrypt('uid')];
            endif;

            if ($traffic->delete()) :
                $message = "File {$guide} has been deleted successfully.";
                $color = 'success';
                $code = 200;
                RecordLoader::history($message, 1);
            else :
                $message = "Error: Unable to delete the File. Please try again or contact support.";
                RecordLoader::history($message, 0);
            endif;

        endif;

        $this->back($code ?? 204, $message ?? 'Someone wrong!', $color ?? 'danger');
    }
}
