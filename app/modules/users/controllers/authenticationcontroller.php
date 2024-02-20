<?php

namespace App\Modules\Users\Controllers;

use App\Bootstrap\Request;
use App\Modules\Users\Models\{
    AuthenticationModel,
    PasswordResetModel,
    UserModel
};

use App\Utilities\Utilitie;

use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Emails\Loader\MailLoader;
use App\Modules\Records\Loader\RecordLoader;


class AuthenticationController extends Utilitie
{
    function login()
    {
        if (isset($_SESSION[SESSION])) $this->ok('/dashboard');

        return (object) [
            "view" => "index",
            "meta" => [
                "title" => 'getPost',
            ],
            "styles" => [
                "login" => "/public/static/css/custom/login.css"
            ]
        ];
    }

    function forgotpassword()
    {
        if (isset($_SESSION[SESSION])) $this->ok('/profile');

        return (object) [
            "view" => "index",
            "meta" => [
                "title" => 'getPost',
            ],
            "styles" => [
                "login" => "/public/static/css/custom/login.css"
            ]
        ];
    }

    function resetpassword()
    {
        if (isset($_SESSION[SESSION])) $this->ok('/profile');

        if (isset($this->parameters->target)) :
            $guide = $this->parameters->target;
            $resetModel = new PasswordResetModel();
        endif;

        if (isset($guide) && preg_match($resetModel->pattern, $guide)) :
            $resetModel->conditions = [
                ["guide", "=", $this->parameters->target],
                ["AND", "status", "=", "PENNING"]
            ];
            $reset = $resetModel->find();

            if ($reset) :
                return (object) [
                    "view" => "index",
                    "meta" => [
                        "title" => 'getPost',
                    ],
                    "styles" => [
                        "login" => "/public/static/css/custom/login.css"
                    ]
                ];
            endif;
        endif;

        $this->bad(404, 'not found');
    }

    function logout()
    {
        $auth = new AuthenticationModel();
        $auth->conditions = [["token", "=", CryptLoader::decrypt('token')]];

        if ($auth->destroy()) :
            $message = 'Successfully completed!';
            $color = 'success';

            RecordLoader::history("You have been successfully logged out. Thank you for using our service", 1);
        else :
            RecordLoader::history("Logout failed due to an error. Please try again or contact support.", 0);

        endif;

        unset($_SESSION[SESSION]);

        $this->ok('/', $message ?? 'logged out', $color ??  'danger');
    }


    function register($username, $email, $password)
    {
        // Implementation for user registration
    }

    function confirmemail()
    {
        if (isset($_SESSION[SESSION])) $this->ok('/profile');

        if (isset($this->parameters->target)) :
            $guide = $this->parameters->target;
            $userModel = new UserModel();
        endif;

        if (isset($guide) && preg_match($userModel->pattern, $guide)) :
            $userModel->conditions = [
                ["guide", "=", $this->parameters->target],
                ["activation", "status", "!=", "DISABLED"]
            ];
            $user = $userModel->find();

            if ($user) :
                $userModel->column->status = 'ENABLE';
                if ($userModel->save()) :
                    $this->ok('/login');
                endif;
            endif;
        endif;

        $this->ok('/');
    }
}
