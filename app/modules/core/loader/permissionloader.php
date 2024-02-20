<?php

namespace App\Modules\Core\Loader;

use App\Modules\Account\Model\UserModel;
use App\Modules\Core\Loader\CryptLoader;

use App\Modules\Core\Model\{
    PermissionGroupsModel,
    AuthenticationModel,
    PermissionModel,
};

use App\Utilities\Utilitie;

class PermissionLoader extends Utilitie
{

    // The rules must be unique everywhere and the name clear
    private static $permissions = [
        "cpanel" => [
            "view_cpanel_dashboard",
            "view_cpanel_mailshistory",
            "view_cpanel_record",
            "view_cpanel_activity",
        ],
        "user" => [
            // manger
            "view_manger_users",
            "view_manger_user",
            "delete_manger_user",
            "create_manger_user",
            "update_manger_user",
            "switsh_manger_user_active",

            // visitor
            "view_visitor_profile",

            // self
            "delete_self_user",
            "update_self_user",
            "activity_self_user",
        ],
        "record" => [
            // manger
            "view_manger_logs_record",
            "view_manger_activity_record",
            "view_manger_user_record",
        ],
        "permission_group" => [
            // manger
            "view_manger_groups",
            "delete_manger_permission_group",
            "create_manger_permission_group",
            "update_manger_permission_group",
            "switsh_manger_permission_group_active",
        ],
    ];

    public static function getPermissions(): object
    {
        return (object) self::$permissions;
    }

    public static function updatePermissions($group, $data)
    {
        $errors = [];

        $permissionModel = new PermissionModel();
        $permissionModel->conditions = [["permission_group_id", "=", $group->pgroup_uid]];
        $permissions = $permissionModel->get()->result;

        if ($permissions) :
            foreach ($permissions as $key => $permission) {
                $permissionModel = new PermissionModel();
                $permissionModel->conditions = [
                    ["permission_group_id", "=", $group->pgroup_uid],
                    ["permission_uid", "=", $permission->permission_uid],
                ];
                $module = $permission->permission_module;
                // if the part of permission not exist then removed 
                if (!isset($data->module)) :
                    if (!$permissionModel->destroy()) :
                        $errors[] = 'ERROR Delete: ' . $module;
                    endif;
                else :
                    // if exist the part then update
                    $module = array_keys($data->module);
                    if (json_encode($module) != $permissionModel->column->permission_action) :

                        $permissionModel->column->permission_action = json_encode($module);
                        if (!$permissionModel->save()) :
                            $errors[] = 'ERROR Update: ' . $module;
                        endif;
                    endif;
                endif;
                unset($data->module);
            }
        endif;

        // and here chekc if has new part to add
        foreach ($data as $key => $value) {
            if (is_array($value)) :
                $permissionModel = new PermissionModel();
                $permissionModel->column->permission_guide =  self::guide("P");
                $permissionModel->column->permission_group_id =  $group->pgroup_uid;
                $permissionModel->column->permission_module = $key;

                $module = array_keys($value);
                $permissionModel->column->permission_action = json_encode($module);
                if (!$permissionModel->save()) :
                    $errors[] = 'ERROR Add :' . $key;

                endif;
            endif;
            unset($data->$key);
        }
        return count($errors) > 0 ? $errors : false;
    }

    public static function authenticated($token = null): bool
    {
        if (is_null($token)) :
            $token = CryptLoader::decrypt('token');
        endif;


        if (isset($_SESSION[LICENSE]) || !is_null($token)) :

            $authentication = new AuthenticationModel;
            $authentication->conditions = [["auth_token", "=", $token]];
            $authentication->merge = [
                [
                    "key" => "user",
                    "table" => "`" . UserModel::getTableName() . "` AS user",
                    "type" => "RIGHT",
                    "on" => AuthenticationModel::getTableName() . ".auth_owner = user.user_uid AND user.user_activation = 'ENABLE'",
                    "columns" => (new UserModel())->column
                ],
                [
                    "key" => "g",
                    "table" => "`" . PermissionGroupsModel::getTableName() . "` AS g",
                    "type" => "LEFT",
                    "on" => "user.user_group_id = g.pgroup_uid AND g.pgroup_status = 'ENABLE'",
                    "columns" => (new PermissionGroupsModel())->column
                ]
            ];

            $user = $authentication->findJoin();

            if ($user) :
                // Creates DateTime objects
                $datetime1 = date_create($user->auth_created_at);
                $datetime2 = date_create(date(DB_FORMAT));

                // Calculates the difference between DateTime objects
                $interval = date_diff($datetime1, $datetime2);

                if ($interval->y <= 0 && $interval->m <= 0 && $interval->d <= 0) :

                    $data = [
                        "token" => $user->auth_token,
                        "uid" => $user->user_uid,
                        "guide" => $user->user_guide,
                        "type" => $user->user_type,
                        "name" => $user->user_username,
                        "role" => $user->user_roles,
                        "avatar" => $user->user_avatar,
                        "group" => $user->pgroup_uid,
                    ];

                    // Encrypt the User Data
                    $_SESSION[LICENSE] = CryptLoader::encrypt($data);
                    return true;

                else :
                    $authentication->delete();
                    unset($_SESSION[LICENSE]);
                endif;
            else :
                unset($_SESSION[LICENSE]);
            endif;
        endif;

        return false;
    }
}
