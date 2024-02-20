<?php

namespace App\Modules\Account;

use App\Bootstrap\Web;
use App\Modules\Account\Api\UserApi;
use App\Modules\Account\Controller\UserController;

class AccountUrls extends Web
{
    // this Required to views path 
    static $resource = __DIR__ . '/views/';

    function __construct($router)
    {
        // - User
        $router->get($this->getPath('get_visit_profile') . '{username}', new UserController, "visitProfile");
        $router->get($this->getPath('get_profile'), new UserController, "profile");
        $router->get($this->getPath('get_edit_profile'), new UserController, "edit");
        $router->post($this->getPath('put_profile'), new UserApi, 'update');
    }
}
