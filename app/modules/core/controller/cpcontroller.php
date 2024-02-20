<?php

namespace App\Modules\Core\Controller;

use App\Bootstrap\Loader\AutoLoader;
use App\Bootstrap\Response;
use App\Modules\Core\CoreUrls;
use App\Modules\Account\Loader\User;
use App\Modules\Core\Model\PermissionGroupsModel;
use App\Modules\Core\Model\PermissionModel;
use App\Utilities\Utilitie;

class CPController extends Utilitie
{
    public function index($request)
    {
        $this->isAllowed('view_cpanel_dashboard');

        return (object) [
            'view' => CoreUrls::$resource . 'cp/index',
            'data' => [],
            'theme' => 'cpanel',
            'meta' => ['title' => 'Control Panel']
        ];
    }

    function users($request)
    {
        $this->isAllowed('view_manger_users');

        $result = User::all($request->queryParams->count ?? 6, $request->queryParams->current ?? 1);
        if (!$result) new Response('not found', 404);

        return (object) [
            'view' => CoreUrls::$resource . 'cp/users',
            'data' => ['users' => $result],
            'theme' => 'cpanel',
            'meta' => ['title' => "Users"],
            'bscripts' => AutoLoader::getSourceTable()
        ];
    }

    function userStore($request)
    {
        $this->isAllowed('view_manger_user');

        $uid = isset($request->routeParams->user) ? $request->routeParams->user : false;

        $result = User::get($uid);

        if ($request->path !== CoreUrls::getPath('get_manger_add_user') && !$result) :
            return new Response('Server', 400);
        endif;

        $group = new PermissionGroupsModel();
        $groups = $group->get();

        return (object) [
            'view' => CoreUrls::$resource . 'cp/user_store',
            'data' => [
                'user' => $result,
                'groups' => $groups
            ],
            'theme' => 'cpanel',
            'meta' => ['title' => "User Editor"],
            'bscripts' => AutoLoader::getSourceForm()
        ];
    }
}
