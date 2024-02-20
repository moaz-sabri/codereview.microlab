<?php

namespace App\Modules\Users\Api;

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
use GuzzleHttp\Promise\Utils;

class AuthenticationApi extends Utilitie
{
    function login(Request $request)
    {
        if (isset($_SESSION[SESSION])) return;
        $validationRules = [
            // 'email' => ['required' => true, 'type' => 'email'],
            // 'password' => ['required' => true, 'type' => 'password'],
        ];

        // $validation = $this->validate($request->data, $validationRules);
        // $errors = $this->validateFormData($validation);
        // if (!empty($errors)) $this->back(400, $errors);
        // $data = $validation['validated'];

        $data = $request->data;

        $userModel = new UserModel;
        $userModel->conditions = [
            ["email", "=", $data->email],
            ["OR", "name", "=", $data->email],
            ["AND", "activation", "=", "ENABLE"]

        ];

        $user = $userModel->find();

        if ($user && password_verify($data->password, $user->password)) :

            $token = hash('sha512', date('Y-m-d h:m:s')); // hashing using SHA512

            $authMolel = new AuthenticationModel();
            $authMolel->column->owner = $user->uid;
            $authMolel->column->token = $token;
            $authMolel->column->guide = $this->guide("T");

            if ($authMolel->save()) :
                $data = [
                    "token" => $token,
                    "uid" => $user->uid,
                    "guide" => $user->guide,
                    "type" => $user->type,
                    "name" => $user->name,
                    "role" => $user->roles,
                    "avatar" => $user->avatar
                ];

                // Encrypt the User Data
                $_SESSION[SESSION] = CryptLoader::encrypt($data);
                $message = "Welcome, {$user->name}! You are now logged in.";
                RecordLoader::history($message, 1);

                return $this->response(200, $_SESSION[SESSION]);
            else :
                $message = "Login failed. Please check your username and password and try again.";
                RecordLoader::history($message, 0);
            endif;
        endif;

        $message = "Login failed. The user does not exist. Please check your username or sign up for a new account.";

        RecordLoader::history($message, 0);

        return $this->response(404, $message);
    }

    function forgotpassword(Request $request)
    {
        if (isset($_SESSION[SESSION])) return;

        $validationRules = [
            'email' => ['required' => true, 'type' => 'email', 'min_length' => 2, 'max_length' => 50],
        ];

        $validation = $this->validate($request->data, $validationRules);
        $errors = $this->validateFormData($validation);
        if (!empty($errors)) return $this->response(400, $errors);

        $data = $validation['validated'];

        $userModel = new UserModel();
        $userModel->conditions = [
            ["email", "=", $data->email],
            ["AND", "activation", "=", "ENABLE"]
        ];

        $user = $userModel->find();

        if ($user) :
            $forgotModel = new PasswordResetModel();

            $code = $this->GENERATE_VERIFIED_CODE();

            $forgotModel->column->owner = $user->uid;
            $forgotModel->column->guide = $this->guide("R");
            $forgotModel->column->updated_at = $this->CURRENT_DATE();
            $forgotModel->column->verifiedcode = $code;
            $forgotModel->column->status = 'PENNING';

            if ($forgotModel->save()) :
                // Coming Soon to add booking feature
                if (PRODUCTION) :
                    $emailInfo = (object) [
                        "email" =>  $user->email,
                        "template" => "forgotpassword",
                        "type" => "FORGOTPASSWORD",
                        "subject" => " Password Reset Request ($code)",
                        "name" => $user->name,
                        "confirm_url" => DOMAIN_SOURCE . "reset/password/{$forgotModel->column->guide}"
                    ];

                    if (MailLoader::send($emailInfo)) :
                        RecordLoader::history("sent email to {$user->email}", 1);
                    else :
                        RecordLoader::log("sent mail", 500, "sd6sf9a78sdf69B");
                    endif;
                endif;
                RecordLoader::history("Password reset for {$user->name} has been successful.", 1);

                return $this->response(200, $forgotModel->column->guide);
            endif;
        endif;

        $message = "Password reset failed. Please try again or contact support.";
        RecordLoader::history($message, 0);

        return $this->response(404, $message);
    }

    function resetpassword(Request $request)
    {
        if (isset($_SESSION[SESSION])) return;

        $validationRules = [
            'verifiedcode' => ['required' => true, 'min_length' => 8, 'max_length' => 9],
            'password' => ['required' => true, 'type' => 'password'],
            'guide' => ['required' => true, 'min_length' => 13, 'max_length' => 14],
        ];

        $validation = $this->validate($request->data, $validationRules);
        $errors = $this->validateFormData($validation);
        if (!empty($errors)) return $this->response(400, $errors);

        $data = $validation['validated'];

        $forgotModel = new PasswordResetModel();
        $forgotModel->conditions = [
            ["guide", "=", $data->guide],
            ["AND", "verifiedcode", "=", $data->verifiedcode],
            ["AND", "status", "=", "PENNING"]
        ];
        $reset = $forgotModel->find();

        if ($reset) :
            $userModel = new UserModel();
            $userModel->conditions = [
                ["uid", "=", $reset->owner],
                ["AND", "activation", "=", "ENABLE"]
            ];

            $user = $userModel->find();

            if ($user) :
                $password = password_hash($data->password, PASSWORD_BCRYPT); // Hash the password
                $userModel->column->password = $password;

                if ($userModel->save()) :

                    $forgotModel->conditions = [["guide", "=", $reset->guide]];
                    $forgotModel->column->status = 'COMPLETED';

                    if ($forgotModel->save()) :
                        // Coming Soon to add booking feature
                        if (PRODUCTION) :
                            $emailInfo = (object) [
                                "email" =>  $user->email,
                                "template" => "resetpassword",
                                "type" => "RESETPASSWORD",
                                "subject" => "Password Updated Successfully",
                                "name" => $user->name,
                            ];

                            if (MailLoader::send($emailInfo)) :
                                RecordLoader::history("sent email to {$user->email}", 1);
                            else :
                                RecordLoader::log("sent mail", 500, "sd6sf9a78sdf69B");
                            endif;
                        endif;

                        $message = "Your password has been successfully updated. You can now log in with your new password.";
                        RecordLoader::history($message, 1);

                        return $this->response(200, $message);
                    endif;
                endif;
            endif;
        endif;

        $message = "Oops, there was an error updating your password. Please double-check the provided data or try again later. If the issue persists, please contact our support team";
        RecordLoader::history($message, 0);

        return $this->response(404, $message);
    }
}
