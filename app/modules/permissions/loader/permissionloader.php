<?php

namespace App\Modules\Permissions\Loader;

use App\Modules\Permissions\Models\PermissionModel;
use App\Modules\Permissions\Loader\CryptLoader;

use App\Modules\Users\Models\{
    AuthenticationModel,
    UserModel
};
use App\Modules\Permissions\Models\{
    PermissionGroupsModel,
    UserGroupModel
};
use App\Utilities\Utilitie;

class PermissionLoader
{

    private static $allowdActions = ["dashboard", "main", "preview"];

    public static function authenticated($token = null): bool
    {
        if (is_null($token)) :
            $token = CryptLoader::decrypt('token');
        endif;

        if (isset($_SESSION[SESSION]) || !is_null($token)) :

            $authentication = new AuthenticationModel;
            $authentication->conditions = [["token", "=", $token]];
            $authentication->merge = [
                [
                    "key" => "user",
                    "table" => "`" . UserModel::getTableName() . "` AS user",
                    "type" => "RIGHT",
                    "on" => AuthenticationModel::getTableName() . ".owner = user.uid AND user.activation = 'ENABLE'",
                    "columns" => (new UserModel())->column
                ],
                [
                    "key" => "ug",
                    "table" => "`" . UserGroupModel::getTableName() . "` AS ug",
                    "type" => "LEFT",
                    "on" => "ug.user_id = user.uid",
                    "columns" => (new UserGroupModel())->column
                ],
                [
                    "key" => "g",
                    "table" => "`" . PermissionGroupsModel::getTableName() . "` AS g",
                    "type" => "LEFT",
                    "on" => "ug.group_id = g.uid AND g.status = 'ENABLE'",
                    "columns" => (new PermissionGroupsModel())->column
                ]
            ];

            $user = $authentication->findJoin();

            if ($user) :
                // Creates DateTime objects
                $datetime1 = date_create($user->authentication_created_at);
                $datetime2 = date_create(date(DB_FORMAT));

                // Calculates the difference between DateTime objects
                $interval = date_diff($datetime1, $datetime2);

                if ($interval->y <= 0 && $interval->m <= 0 && $interval->d <= 0) :

                    $data = [
                        "token" => $user->authentication_token,
                        "uid" => $user->user_uid,
                        "guide" => $user->user_guide,
                        "type" => $user->user_type,
                        "name" => $user->user_name,
                        "role" => $user->user_roles,
                        "avatar" => $user->user_avatar,
                        "group" => $user->g_uid,
                    ];

                    // Encrypt the User Data
                    $_SESSION[SESSION] = CryptLoader::encrypt($data);
                    return true;

                else :
                    $authentication->delete();
                    unset($_SESSION[SESSION]);
                endif;
            else :
                unset($_SESSION[SESSION]);
            endif;
        endif;

        return false;
    }

    static function allowed(string $module, string $action, array $roles = []): bool
    {
        // TODO Rediract to login page then back to page 
        if (!isset($_SESSION[SESSION])) :
            die("<script>window.location.href = '/login'</script>");
        endif;

        if (CryptLoader::decrypt('role') === MASTER) return true;

        if (
            in_array($action, self::$allowdActions) &&
            in_array(CryptLoader::decrypt('role'), $roles)
        ) return true;

        $permission = new PermissionModel;
        $permission->conditions = [
            ["module", "=", $module],
            ["AND", "group_id", "=", CryptLoader::decrypt('group')],
            ["AND", "action", "LIKE", "%$action%"],
        ];

        return $permission->find() ? true : false;
    }
}
