<?php

namespace App\Modules\Core\Controller;

use App\Bootstrap\Loader\AutoLoader;
use App\Modules\Account\Model\UserModel;
use App\Modules\Core\CoreUrls;
use App\Modules\Core\Loader\PermissionLoader;
use App\Modules\Core\Model\PermissionGroupsModel;
use App\Modules\Core\Model\PermissionModel;
use App\Utilities\Utilitie;

class PermissionController extends Utilitie
{
    function index()
    {
        $this->isAllowed('view_manger_groups');

        $groupModel = new PermissionGroupsModel();
        $groupModel->count = 50;
        $groupModel->pagination = true;
        $groupModel->merge = [
            [
                "key" => "users",
                "table" => "`" . UserModel::getTableName() . "` AS `users`",
                "type" => "LEFT",
                "on" => "users.user_group_id = " . PermissionGroupsModel::getTableName() . ".pgroup_uid",
                "columns" => "COUNT(*) AS user_count"
            ]
        ];

        $result = $groupModel->group();

        return (object) [
            'view' => CoreUrls::$resource . 'permission/index',
            'data' => ["groups" => $result],
            'theme' => 'cpanel',
            'meta' => ['title' => 'TITLE'],
            'bscripts' => AutoLoader::getSourceTable()
        ];
    }

    function store($request)
    {
        $this->isAllowed('create_manger_permission_group');

        $uid = isset($request->routeParams->group) ? $request->routeParams->group : false;

        $groupModel = new PermissionGroupsModel();
        $groupModel->conditions = [["pgroup_uid", "=", $uid]];
        $group = $groupModel->find();

        $groupModel = new PermissionModel();
        $groupModel->conditions = [["permission_group_id", "=", $uid]];
        $permissions = $groupModel->get();

        $selected_permission = [];
        foreach ($permissions->result as $permission) :
            $selected_permission[$permission->permission_module] = json_decode($permission->permission_action);
        endforeach;

        return (object) [
            'view' => CoreUrls::$resource . 'permission/store',
            'data' => [
                "group" => $group,
                "selected_permission" => $selected_permission,
                "permissions_list" => PermissionLoader::getPermissions()
            ],
            'theme' => 'cpanel',
            'meta' => ['title' => 'TITLE'],
            'bscripts' => AutoLoader::getSourceForm()
        ];
    }
}
