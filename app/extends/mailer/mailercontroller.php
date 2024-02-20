<?php

namespace App\Extends\Mailer;

use App\Utilities\Utilitie;

class MailerController extends Utilitie
{
    function dashboard()
    {

        $this->isAllowed('view_cpanel_mailshistory');

        $recordModel = new MailerModel();

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
