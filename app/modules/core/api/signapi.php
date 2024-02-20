<?php

namespace App\Modules\Core\Api;

use App\Bootstrap\JsonResponse;
use App\Bootstrap\Web;
use App\Extends\Mailer\MailerLoader;
use App\Extends\Record\RecordLoader;
use App\Modules\Account\Model\ConfirmMailModel;
use App\Modules\Account\Model\UserModel;
use App\Modules\Core\Loader\CryptLoader;
use App\Modules\Core\Model\AuthenticationModel;
use App\Utilities\Utilitie;

class SignApi extends Utilitie
{
    private $statusCode = 500;
    private $responseMessage;
    private $response;
    private $errors = [];

    public function signin($request)
    {
        if ($request->user) new JsonResponse(false, 301);

        $validationRules = [
            'username' => ['required' => true],
            'password' => ['required' => true],
        ];

        $data = $this->validates($request->data, $validationRules);
        if (is_array($data)) return $data['res'];

        $userModel = new UserModel;
        $userModel->conditions = [
            ["user_email", "=", $data->username],
            ["OR", "user_username", "=", $data->username],
            ["AND", "user_activation", "=", "ENABLE"]
        ];

        $user = $userModel->find();

        if ($user && password_verify($data->password, $user->user_password)) :

            $token = hash('sha512', date('Y-m-d h:m:s')); // hashing using SHA512

            $authMolel = new AuthenticationModel();
            $authMolel->column->auth_owner = $user->user_uid;
            $authMolel->column->auth_token = $token;
            $authMolel->column->auth_guide = $this->guide("T");

            if ($authMolel->save()) :
                $data = [
                    "token" => $token,
                    "uid" => $user->user_uid,
                    "guide" => $user->user_guide,
                    "group_id" => $user->user_group_id,
                    "type" => $user->user_type,
                    "name" => $user->user_username,
                    "role" => $user->user_roles,
                    "avatar" => $user->user_avatar
                ];

                // Encrypt the User Data
                $_SESSION[LICENSE] = CryptLoader::encrypt($data);
                $message = "Welcome, {$user->user_username}! You are now logged in.";
                RecordLoader::activity($message, 1);

                $this->statusCode = 200;
                $this->response = $_SESSION[LICENSE];

                $callback = '/' . PATH_USER . 'profile';

                // Set a cookie using the Set-Cookie header
                setcookie(LICENSE, CryptLoader::decrypt('token'), time() + 24 * 60 * 60, '/');  // Expires in 16 Days
                setcookie('policyAllowed', true,  time() + 30 * 24 * 60 * 60, '/');

            else :
                $responseMessage = "Login failed. Please check your username and password and try again.";
                RecordLoader::activity($responseMessage, 0);
            endif;
        else :
            $responseMessage = "Login failed. The user does not exist. Please check your username or sign up for a new account.";
            RecordLoader::activity($responseMessage, 0);
        endif;

        if (isset($request->routeParams->callback)) $callback = str_replace('%2F', '/', base64_decode($request->routeParams->callback));

        $response = [
            "message" => $this->responseMessage,
            "response" => $this->response,
            "callback" => $callback
        ];


        return new JsonResponse($response, $this->statusCode);
    }

    public function signup($request)
    {
        if ($request->user) new JsonResponse(false, 301);

        $validationRules = [
            'username' => ['required' => true, 'type', 'username'],
            'email' => ['required' => true, 'type', 'email'],
            'new_password' => ['required' => true, 'type', 'password'],
            'confirm_password' => ['required' => true, 'type', 'password'],
        ];

        $data = $this->validates($request->data, $validationRules);
        if (is_array($data)) return $data['res'];

        $userModel = new UserModel;
        $userModel->conditions = [
            ['user_username', '=', $data->username],
            ['OR', 'user_email', '=', $data->email],
        ];

        if ($userModel->find() || $data->new_password != $data->confirm_password) :
            $this->errors = [
                "User already exists. Please choose a different username.",
                "Password confirmation does not match. Please double-check and try again."
            ];
        else :

            $password = password_hash($data->new_password, PASSWORD_BCRYPT); // Hash the password

            $userModel = new UserModel;
            $userModel->column->user_guide = $this->guide('U');
            $userModel->column->user_type = 'ACCOUNT';
            $userModel->column->user_roles = 'USER';
            $userModel->column->user_password = $password;
            $userModel->column->user_username = $data->username;
            $userModel->column->user_email = $data->email;

            $newUser = $userModel->save();
            if ($newUser) :
                // Coming Soon to add booking feature
                if (PRODUCTION) :
                    $emailInfo = (object) [
                        "email" =>  $newUser->user_email,
                        "template" => "newuser",
                        "type" => "NEWUSER",
                        "subject" => "Welcome $newUser->user_username,",
                        "name" => $newUser->user_username,
                    ];

                    if (MailerLoader::send($emailInfo)) :
                        RecordLoader::activity("sent email to {$newUser->user_email}", 1);
                    else :
                        RecordLoader::log("sent mail", 500, "sd6sf9a78sdf69B");
                    endif;
                endif;

                // Set a cookie using the Set-Cookie header
                setcookie(LICENSE, CryptLoader::decrypt('token'), time() + 24 * 60 * 60, '/');  // Expires in 16 Days
                setcookie('policyAllowed', true,  time() + 30 * 24 * 60 * 60, '/');

                $this->responseMessage = 'user created!';
                $this->response = $newUser;

                $callback = Web::getPath('get_profile');
            endif;
        endif;

        return new JsonResponse([
            'errors' => $this->errors,
            'message' => $this->responseMessage,
            'response' => $this->response,
            'callback' => $callback ?? false
        ]);
    }

    public function forgotpassword($request)
    {
        if ($request->user) new JsonResponse(false, 301);

        $validationRules = [
            'email' => ['required' => true, 'type' => 'email', 'min_length' => 2, 'max_length' => 50],
        ];

        $data = $this->validates($request->data, $validationRules);
        if (is_array($data)) return $data['res'];

        $userModel = new UserModel();
        $userModel->conditions = [
            ["user_email", "=", $data->email],
            ["AND", "user_activation", "=", "ENABLE"]
        ];

        $user = $userModel->find();

        if ($user) :
            $forgotModel = new ConfirmMailModel();

            $code = $this->GENERATE_VERIFIED_CODE();
            $guide = $this->guide("R");

            $forgotModel->column->cmail_owner = $user->user_uid;
            $forgotModel->column->cmail_guide = $guide;
            $forgotModel->column->cmail_verifiedcode = $code;
            $forgotModel->column->cmail_status = 'PENNING';
            $forgotModel->column->cmail_type = 'FORGOTPASSWORD';

            if ($forgotModel->save()) :
                // Coming Soon to add booking feature
                if (PRODUCTION) :
                    $emailInfo = (object) [
                        "email" =>  $user->user_email,
                        "template" => "forgotpassword",
                        "type" => "FORGOTPASSWORD",
                        "subject" => " Password Reset Request",
                        "name" => $user->user_username,
                        "confirm_url" => DOMAIN_SOURCE . DS . PATH_SIGN . "resetpassword?access=" . base64_encode($guide . ',' . $code)
                    ];

                    if (MailerLoader::send($emailInfo)) :
                        RecordLoader::activity("sent email to {$user->user_email}", 1);
                    else :
                        RecordLoader::log("sent mail", 500, "sd6sf9a78sdf69B");
                    endif;
                endif;
                RecordLoader::activity("Password reset for {$user->user_username} has been successful.", 1);

                $this->statusCode = 200;
                $callback = Web::getPath('get_sentmail');

            endif;

        else :

            $this->responseMessage = "Password reset failed. Please try again or contact support.";
            RecordLoader::activity($this->responseMessage, 0);
        endif;

        return new JsonResponse([
            'message' => $this->responseMessage,
            'callback' => $callback ?? false
        ], $this->statusCode);
    }

    public function resetpassword($request)
    {
        if ($request->user) new JsonResponse(false, 301);

        $guide = explode(',', base64_decode($request->queryParams->access));

        if (isset($guide) && is_array($guide)) :
            $resetModel = new ConfirmMailModel();
        endif;

        if (isset($guide) && preg_match($resetModel->pattern, $guide[0])) :

            $resetModel->conditions = [
                ["cmail_guide", "=", $guide[0]],
                ["AND", "cmail_verifiedcode", "=", $guide[1]],
                ["AND", "cmail_status", "=", "PENNING"]
            ];
            $reset = $resetModel->find();

            if ($reset) :

                $userModel = new UserModel();
                $userModel->conditions = [
                    ["user_uid", "=", $reset->cmail_owner],
                    ["AND", "user_activation", "=", "ENABLE"]
                ];
                $user = $userModel->find();
                if ($user) :

                    $validationRules = [
                        'password' => ['required' => true, 'type' => 'password'],
                    ];

                    $data = $this->validates($request->data, $validationRules);
                    if (is_array($data)) return $data['res'];

                    $userModel = new UserModel();
                    $userModel->conditions = [
                        ["user_uid", "=", $reset->cmail_owner],
                    ];

                    // Hash the password
                    $userModel->column->user_password = password_hash($data->password, PASSWORD_BCRYPT);

                    if ($userModel->save()) :

                        $forgotModel = new ConfirmMailModel();
                        $forgotModel->conditions = [["cmail_guide", "=", $reset->cmail_guide]];
                        $forgotModel->column->cmail_status = 'COMPLETED';
                        $forgotModel->column->cmail_verifiedcode  = '';

                        if ($forgotModel->save()) :

                            if (PRODUCTION) :
                                $emailInfo = (object) [
                                    "email" =>  $user->user_email,
                                    "template" => "resetpassword",
                                    "type" => "RESETPASSWORD",
                                    "subject" => "Password Updated Successfully",
                                    "name" => $user->user_username,
                                ];

                                if (MailerLoader::send($emailInfo)) :
                                    RecordLoader::activity("sent email to {$user->user_email}", 1);
                                else :
                                    RecordLoader::log("sent mail", 500, "sd6sf9a78sdf69B");
                                endif;
                            endif;

                            $this->responseMessage = "Your password has been successfully updated. You can now log in with your new password.";
                            RecordLoader::activity($this->responseMessage, 1);

                            $this->statusCode = 200;
                            $callback = '/' . PATH_SIGN . 'signin';

                        endif;
                    endif;
                endif; // save user

            endif; // resetModel

        else :
            $this->responseMessage = "Oops, there was an error updating your password. Please double-check the provided data or try again later. If the issue persists, please contact our support team";
            RecordLoader::activity($this->responseMessage, 0);
        endif;

        return new JsonResponse([
            'message' => $this->responseMessage,
            'callback' => $callback ?? false
        ], $this->statusCode);
    }
}
