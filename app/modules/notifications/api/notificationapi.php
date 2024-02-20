<?php

namespace App\Modules\Notifications\Api;

use App\Modules\Notifications\Models\NotificationModel;
use App\Modules\Permissions\Loader\CryptLoader;
use App\Utilities\Utilitie;

class NotificationApi extends Utilitie
{
    function update()
    {
        if (isset($this->parameters->target)) :
            $guide = $this->parameters->target;
            $notificationModel = new NotificationModel();
        endif;

        if (isset($guide) && preg_match($notificationModel->pattern, $guide)) :

            $notificationModel->conditions = [
                ["guide", "=", $guide],
                ['AND', 'owner', '=', CryptLoader::decrypt('uid')]
            ];

            $notification = $notificationModel->find();

            if ($notification) :
                $notificationModel->column->status = 'READED';
                if ($notificationModel->save()) :
                    return $notification;
                endif;
            endif;
        endif;
    
        return false;
    }
}
