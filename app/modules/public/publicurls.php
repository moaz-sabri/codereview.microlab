<?php

namespace App\Modules\Public;

use App\Bootstrap\Web;
// use App\Modules\Account\Controller\UserController;
use App\Modules\Public\Controller\PublicController;
use App\Modules\Public\Api\PublicApi;

class PublicUrls extends Web
{
    static $resource = __DIR__ . '/views/';

    function __construct($router)
    {
        $router->get($this->getPath('get_home'), new PublicController, 'index');
        // $router->get($this->getPath('get_home'), new UserController, 'profile');

        $router->put($this->getPath('put_allowed_policy'), new PublicApi, 'allowedPolicy');

        $router->get([
            '/200',
            '/201',
            '/202',
            '/203',
            '/204',
            '/300',
            '/301',
            '/302',
            '/303',
            '/304',
            '/400',
            '/401',
            '/402',
            '/403',
            '/404',
            '/405',
            '/500',
            '/503',
        ], new PublicController, 'errors');
    }
}
