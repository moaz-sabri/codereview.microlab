<?php

namespace App\Modules\Emails\Controllers;

use App\Modules\Records\Loader\RecordLoader;
use App\Modules\Emails\Models\MailboxModel;
use App\Modules\Emails\Setting as MailboxSetting;
use App\Modules\Permissions\Loader\CryptLoader;
use App\Utilities\Utilitie;

class MailboxController extends Utilitie
{
    function dashboard()
    {

        if (!MailboxSetting::permission('dashboard')) :
            $this->notAllowd();
        endif;

        $filestorage = new MailboxModel();

        $queries = $this->parameters->queries;
        $conditions = [];
        if (isset($queries->type)) :
            $conditions[] = ["type", "=", $queries->type];
        endif;

        if (isset($queries->status)) :
            $conditions[] = ["status", "=", $queries->status];
        endif;

        if (count($conditions) > 0) :
            $filestorage->conditions = $conditions;
        endif;

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
        if (!MailboxSetting::permission('delete')) :
            $this->notAllowd();
        endif;

        $mailbox = new MailboxModel();
        $guide = $this->parameters->target;

        if (isset($guide) && preg_match($mailbox->pattern, $guide)) :
            $mailbox->conditions = [["guide", "=", $guide]];

            if (CryptLoader::decrypt('role') != MASTER) :
                $mailbox->conditions[] = ["owner", "=", CryptLoader::decrypt('uid')];
            endif;

            if ($mailbox->delete()) :
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
