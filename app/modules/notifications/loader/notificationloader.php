<?php

namespace App\Modules\Notifications\Loader;

use App\Modules\Notifications\Models\NotificationModel;
use App\Modules\Permissions\Loader\CryptLoader;
use App\Utilities\Utilitie;

class NotificationLoader extends Utilitie
{
    static function setNotification(object $data)
    {
        $guide = self::guide('N');

        $notificationModel = new NotificationModel;
        $notificationModel->column->guide = $guide;
        $notificationModel->column->owner = $data->owner;
        $notificationModel->column->resource = $data->resource;
        $notificationModel->column->header = $data->header;
        $notificationModel->column->content = $data->content;
        $notificationModel->column->type = $data->type;

        $notification = $notificationModel->save();

        if ($notification) :
            return $notification;
        endif;

        return false;
    }

    static function getNotification()
    {
        $filestorage = new NotificationModel();
        
        $filestorage->count = 9;
        $filestorage->conditions = [
            ["status", "=", "READ"],
            ["AND", "owner", "=", CryptLoader::decrypt('uid')]
        ];
        $result = $filestorage->get();

        return $result;
    }
}
