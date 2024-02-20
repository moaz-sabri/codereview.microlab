<?php

namespace App\Modules\Core\Controller;

use App\Bootstrap\Loader\AutoLoader;
use App\Bootstrap\Response;
use App\Extends\Record\RecordLoader;
use App\Modules\Account\Model\ConfirmMailModel;
use App\Modules\Account\Model\UserModel;
use App\Modules\Core\CoreUrls;
use App\Modules\Core\Loader\CryptLoader;
use App\Modules\Core\Model\AuthenticationModel;
use App\Utilities\Utilitie;

class SignController extends Utilitie
{
    public function signin($request)
    {
        if ($request->user) new Response('/' . PATH_ADMIN, 301);

        $response =  [
            'branch' => 'signin',
        ];

        if (isset($request->routeParams->callback)) :
            $response['callback'] = $request->routeParams->callback;
        endif;

        return (object) [
            'view' => CoreUrls::$resource . 'sign/index',
            'data' => $response,
            'theme' => false,
            'meta' => ['title' => 'signin'],
            'bscripts' => AutoLoader::getSourceForm()
        ];
    }

    public function signup($request)
    {
        if ($request->user) new Response('/' . PATH_ADMIN, 301);

        return (object) [
            'view' => CoreUrls::$resource . 'sign/index',
            'data' => ['branch' => 'signup'],
            'theme' => false,
            'meta' => ['title' => 'signup'],
            'bscripts' => AutoLoader::getSourceForm()
        ];
    }

    public function signout($request)
    {
        if (!$request->user) new Response('/', 301);

        $auth = new AuthenticationModel();
        $auth->conditions = [["auth_token", "=", CryptLoader::decrypt('token')]];

        if ($auth->destroy()) :
            RecordLoader::activity("You have been successfully logged out. Thank you for using our service, Owner: " . CryptLoader::decrypt('name'), 1);
        else :
            RecordLoader::activity("Logout failed due to an error. Please try again or contact support.", 0);

        endif;

        // Set the cookie expiration time to a past date
        CryptLoader::encrypt([]);
        setcookie(LICENSE, "", time() - 3600);
        unset($_SESSION[LICENSE]);

        return new Response('/', 301);
    }

    public function forgotpassword($request)
    {
        if ($request->user) new Response('/' . PATH_ADMIN, 301);

        return (object) [
            'view' => CoreUrls::$resource . 'sign/index',
            'data' => ['branch' => 'forgotpassword'],
            'theme' => false,
            'meta' => ['title' => 'forgotpassword'],
            'bscripts' => AutoLoader::getSourceForm()
        ];
    }

    public function resetpassword($request)
    {
        if ($request->user) new Response('/' . PATH_ADMIN, 301);

        if (isset($_SESSION[LICENSE]) || !isset($request->queryParams->access)) return new Response('/', 301);

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
                return (object) [
                    'view' => CoreUrls::$resource . 'sign/index',
                    'data' => [
                        'access' => $request->queryParams->access,
                        'branch' => 'resetpassword'
                    ],
                    'theme' => false, 'meta' => ['title' => 'resetpassword'],
                    'bscripts' => AutoLoader::getSourceForm()
                ];
            endif;
        endif;

        return new Response('Email!', 404);
    }

    public function confirm($request)
    {
        if (!isset($request->queryParams->access)) return new Response('/', 301);

        $guide = $request->queryParams->access;
        $userModel = new UserModel();

        if (isset($guide) && preg_match($userModel->pattern, $guide)) :
            $userModel->conditions = [
                ["guide", "=", $guide],
                ["activation", "status", "!=", "DISABLED"]
            ];
            $user = $userModel->find();

            if ($user) :
                $userModel->column->status = 'ENABLE';
                if ($userModel->save()) :
                    return (object) [
                        'view' => CoreUrls::$resource . 'sign/index',
                        'data' => ['access' => $guide, 'branch' => 'confirm'], 'theme' => false,
                        'meta' => ['title' => 'signin'],
                        'bscripts' => AutoLoader::getSourceForm()
                    ];
                endif;
            endif;

        endif;

        return new Response('Email!', 404);
    }

    public function sentMail($request)
    {
        if ($request->user) new Response('/' . PATH_ADMIN, 301);

        return (object) [
            'view' => CoreUrls::$resource . 'sign/index',
            'data' => ['branch' => 'sentmail'],
            'theme' => false,
            'meta' => ['title' => 'Sent E-mail']
        ];
    }
}
