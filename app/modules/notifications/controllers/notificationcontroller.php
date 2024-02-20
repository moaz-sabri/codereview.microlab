<?php

namespace App\Modules\Notifications\Controllers;

use App\Modules\Records\Loader\RecordLoader;
use App\Modules\Notifications\Models\NotificationModel;
use App\Modules\Notifications\Setting as NotificationSetting;
use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Users\Loader\User;
use App\Utilities\Utilitie;

class NotificationController extends Utilitie
{
    function dashboard()
    {

        if (!NotificationSetting::permission('dashboard')) :
            $this->notAllowd();
        endif;


        $filestorage = new NotificationModel();

        $filestorage->count = 3;
        $filestorage->pagination = true;
        $result = $filestorage->get();

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
        if (!NotificationSetting::permission('delete')) :
            $this->notAllowd();
        endif;

        $notification = new NotificationModel();
        $guide = $this->parameters->target;

        if (isset($guide) && preg_match($notification->pattern, $guide)) :
            $notification->conditions = [["guide", "=", $guide]];

            if (CryptLoader::decrypt('role') != MASTER) :
                $notification->conditions[] = ["owner", "=", CryptLoader::decrypt('uid')];
            endif;

            if ($notification->delete()) :
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
