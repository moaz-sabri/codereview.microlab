<?php

namespace App\Modules\Permissions\Models;

use App\Database\{
    Database,
    Migrate
};

use App\Modules\Users\Models\UserModel;

class PermissionGroupsModel extends Database
{
    private static string $moduleName = 'permissiongroups';
    private static array $cols = [
        "status" => "CHAR(11) NOT NULL DEFAULT 'ENABLE'",
        "name" => "CHAR(33) NOT NULL",
        "description" => "CHAR(255) DEFAULT NULL"
    ];

    public object $column;
    public string $pattern = '/^G-[A-Za-z0-9]{12}$/';

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
        if (!Migrate::tableIsExist(UserModel::getTableName())) return ['users'];

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
        $dataToInsert = [
            [1, 'G-DEFAULTGROUP', 'master']
        ];

        $columnNames = ['uid', 'guide', 'name'];

        return Migrate::insert(self::$moduleName, $dataToInsert, $columnNames);
    }

    function removeModule()
    {
        return Migrate::drop(self::$moduleName);
    }
}
