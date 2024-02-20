<?php

namespace App\Modules\Emails\Api;

use App\Bootstrap\Request;
use App\Modules\Emails\Loader\MailLoader;
use App\Modules\Emails\Models\MailboxModel;
use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Records\Loader\RecordLoader;
use App\Utilities\Utilitie;

class MailboxApi extends Utilitie
{

    function create(Request $request)
    {
        $validationRules = [
            'type' => ['required' => true, 'min_length' => 4],
            'subject' => ['required' => true, 'min_length' => 10],
            'email' => ['required' => true, 'type' => 'email'],
            'message' => ['required' => true, 'min_length' => 20],
            'name' => ['required' => false],
            'telnumber' => ['required' => false],
            'source' => ['required' => false],
        ];

        $validation = $this->validate($request->data, $validationRules);
        $errors = $this->validateFormData($validation);
        if (!empty($errors)) return $this->response(400, $errors);

        $data = $validation['validated'];

        $mailboxModel = new MailboxModel();
        $mailboxModel->column->guide = $this->guide('E');
        $mailboxModel->column->type = $data->type;
        $mailboxModel->column->subject = $data->subject;
        $mailboxModel->column->email = $data->email;
        $mailboxModel->column->message = $data->message;
        $mailboxModel->column->name = $data->name;

        if (isset($data->telnumber)) :
            $mailboxModel->column->telnumber = $data->telnumber;
        endif;
        if (isset($data->source)) :
            $mailboxModel->column->source = $data->source;
        endif;

        $mailbox = $mailboxModel->save();
        if ($mailbox) :
            if (PRODUCTION) :
                $emailInfo = (object) [
                    "email" =>  $mailboxModel->column->email,
                    "template" => "mailbox",
                    "type" => $mailboxModel->column->type,
                    "subject" => $mailboxModel->column->subject,
                    "name" => $mailboxModel->column->name,
                    "message" => $mailboxModel->column->message
                ];

                if (MailLoader::send($emailInfo, 'en', -1)) :
                    RecordLoader::history("sent email to {$mailboxModel->column->email}", 1);
                else :
                    RecordLoader::log(json_encode($emailInfo), 500, "sd6sf9a78sdf69B");
                endif;
            endif;
            return $this->response(200, json_encode($mailbox));
        endif;

        return $this->response(404, false);
    }

    function update()
    {
        if (isset($this->parameters->target)) :
            $guide = $this->parameters->target;
            $mailboxModel = new MailboxModel();
        endif;

        if (isset($guide) && preg_match($mailboxModel->pattern, $guide)) :

            $mailboxModel->conditions = [
                ["guide", "=", $guide]
            ];

            $mailbox = $mailboxModel->find();

            if ($mailbox) :
                $mailboxModel->column->status = 'READED';
                if ($mailboxModel->save()) :
                    return $mailbox;
                endif;
            endif;
        endif;

        return false;
    }
}
