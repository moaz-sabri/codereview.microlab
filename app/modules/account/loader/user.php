<?php

namespace App\Modules\Account\Loader;

use App\Modules\Core\Model\PermissionGroupsModel;
use App\Modules\Account\Model\UserModel;
use App\Utilities\Utilitie;

class User extends Utilitie
{
    public $token;
    public $uid;
    public $guide;
    public $type;
    public $username;
    public $role;
    public $avatar;
    public $group_id;

    function __construct($user)
    {
        foreach ($user as $key => $value) :
            if (property_exists($this, $key)) :
                $this->$key = $value;
            endif;
        endforeach;
    }

    public static function get($id)
    {
        $userModel = new UserModel();
        $userModel->conditions = [["user_uid", "=", $id], ["OR", "user_guide", "=", $id]];
        $userModel->merge = [
            [
                "key" => "g",
                "table" => "`" . PermissionGroupsModel::getTableName() . "` AS g",
                "type" => "LEFT",
                "on" => "" . UserModel::getTableName() . ".user_group_id = g.pgroup_uid",
                "columns" => (new PermissionGroupsModel())->column
            ],

        ];
        $result = $userModel->findJoin();

        if (isset($result->user_avatar)) :
            $result->user_avatar = self::isFileExist($result->user_avatar, 'image');
        endif;

        if (!$result || !$id) :
            $result = (object)[];
            $userModel->merge[]['columns'] = (array) $userModel->column;
            foreach ($userModel->merge as  $value) :
                foreach ($value['columns'] as $key => $col) :
                    $result->$key = '';
                endforeach;
            endforeach;
        endif;

        return $result;
    }

    public static function all(int $count, int $current)
    {
        $userModel = new UserModel();

        if ($count) :
            $userModel->pagination = true;
            $userModel->current = $current;
            $userModel->count = $count;
        endif;

        $userModel->merge = [
            [
                "key" => "g",
                "table" => "`" . PermissionGroupsModel::getTableName() . "` AS g",
                "type" => "LEFT",
                "on" => "" . UserModel::getTableName() . ".user_group_id = g.pgroup_uid",
                "columns" => (new PermissionGroupsModel())->column
            ],
        ];
        $result = $userModel->join();


        return $result ?? false;
    }
}
