<?php

namespace App\Modules\Core;

use App\Bootstrap\Web;
use App\Modules\Core\Api\CPApi;
use App\Modules\Core\Controller\CPController;
use App\Modules\Core\Api\PermissionApi;
use App\Modules\Core\Controller\PermissionController;
use App\Modules\Core\Api\SignApi;
use App\Modules\Core\Controller\SignController;
use App\Extends\Record\RecordController;


class CoreUrls extends Web
{
    // this Required to views path 
    static $resource = __DIR__ . '/views/';

    function __construct($router)
    {
        $router->get('/cron-jobs', new CPApi, 'cronJobs');

        // - Logs
        $router->get($this->getPath('get_manger_record') . '{record}', new RecordController, 'index');
        $router->get($this->getPath('get_manger_user_activity') . '{user}/activity', new RecordController, 'userActivity');
        // - CP
        $router->get($this->getPath('get_manger_dashboard'), new CPController, 'index');

        // - CP Users
        $router->get($this->getPath('get_manger_users'), new CPController, 'users');
        $router->get($this->getPath('get_manger_add_user'), new CPController, 'userStore');
        $router->get($this->getPath('get_manger_user') . '{user}', new CPController, 'userStore');
        $router->post($this->getPath('post_manger_user'), new CPApi, 'userAdd');
        $router->post($this->getPath('put_manger_user') . '{user}', new CPApi, 'userUpdate');
        $router->delete($this->getPath('delete_manger_user') . '{user}', new CPApi, 'userDelete');
        // - Permission
        $router->get($this->getPath('get_manger_security'), new PermissionController, 'index');
        $router->get($this->getPath('get_manger_add_group'), new PermissionController, 'store');
        $router->get($this->getPath('get_manger_group') . '{group}', new PermissionController, 'store');
        $router->post($this->getPath('post_manger_group'), new PermissionApi, 'create');
        $router->post($this->getPath('put_manger_group') . '{group}', new PermissionApi, 'update');
        $router->delete($this->getPath('delete_manger_group') . '{group}', new PermissionApi, 'delete');

        // - Sign
        $router->get($this->getPath('get_signin'), new SignController, "signin");
        $router->post($this->getPath('post_signin'), new SignApi, 'signin');

        $router->get($this->getPath('get_signin') . '/{callback}', new SignController, "signin");
        $router->post($this->getPath('post_signin') . '/{callback}', new SignApi, 'signin');

        $router->get($this->getPath('get_signup'), new SignController, 'signup');
        $router->post($this->getPath('post_signup'), new SignApi, 'signup');

        $router->get($this->getPath('get_signout'), new SignController, 'signout');

        $router->get($this->getPath('get_forgotpassword'), new SignController, 'forgotpassword');
        $router->post($this->getPath('post_forgotpassword'), new SignApi, 'forgotpassword');

        $router->get($this->getPath('get_resetpassword'), new SignController, 'resetpassword');
        $router->post($this->getPath('post_resetpassword'), new SignApi, 'resetpassword');

        $router->get($this->getPath('get_confirm'), new SignController, 'confirm');
        $router->post($this->getPath('post_confirm'), new SignApi, 'confirm');

        $router->get($this->getPath('get_sentmail'), new SignController, 'sentMail');
    }
}
