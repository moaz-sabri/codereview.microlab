<?php

namespace App\Modules\Permissions\Models;

use App\Database\{
    Database,
    Migrate
};
use App\Modules\Users\Models\UserModel;

class UserGroupModel extends Database
{
    private static string $moduleName = 'usergroup';
    private static array $cols = [
        "user_id" => "INT(33) NOT NULL",
        "group_id" => "INT(255) NOT NULL"
    ];

    public object $column;
    public string $pattern = '/^S-[A-Za-z0-9]{12}$/';

    function __construct()
    {
        $this->tableName = self::$moduleName;
        
        $this->column = $this->attributes(self::$cols);
    }
    

    static function getTableName()
    {
        return  Migrate::tableIsExist(self::$moduleName);
    }

    function build()
    {
        if (
            !Migrate::tableIsExist(UserModel::getTableName()) ||
            !Migrate::tableIsExist(PermissionGroupsModel::getTableName())
        ) return ['users', 'permissiongroups'];

        return Migrate::building(self::$moduleName, self::$cols);
    }

    function tableUpdate(array $news = [])
    {
        return Migrate::tableUpdating(
            self::$moduleName,
            self::$cols
        );
    }

    function setDefault()
    {
        // Sample data to be inserted into the database
        $dataToInsert = [
            [1, 'S-DEFAULTGROUP', 1, 1]
        ];

        // Define the columns you want to insert data into
        $columnNames = ['uid', 'guide', 'user_id', 'group_id'];

        return Migrate::insert(self::$moduleName, $dataToInsert, $columnNames);
    }

    function removeModule()
    {
        return Migrate::drop(self::$moduleName);
    }
}
