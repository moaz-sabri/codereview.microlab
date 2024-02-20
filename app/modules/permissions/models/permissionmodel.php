<?php

namespace App\Modules\Permissions\Models;

use App\Database\{
    Database,
    Migrate
};

class PermissionModel extends Database
{
    private static string $moduleName = 'permissions';
    private static array $cols =  [
        "group_id" => "INT(11) NOT NULL",
        "action" => "CHAR(255) DEFAULT NULL",
        "module" => "CHAR(255) DEFAULT NULL",
    ];

    #region [Protected]
    public object $column;
    public string $pattern = '/^P-[A-Za-z0-9]{12}$/';

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
        if (!Migrate::tableIsExist(PermissionGroupsModel::getTableName())) return ['users'];

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
            [1, 1, 'P-PERMISSIN001', 'all', 'user'],
            [2, 1, 'P-PERMISSIN002', 'all', 'api'],
            [3, 1, 'P-PERMISSIN003', 'all', 'history'],
            [4, 1, 'P-PERMISSIN004', 'all', 'permission'],
            [5, 1, 'P-PERMISSIN005', 'all', 'languageloader'],
        ];

        $columnNames = ['uid', 'group_id', 'guide', 'action', 'module'];

        return Migrate::insert(self::$moduleName, $dataToInsert, $columnNames);
    }

    function removeModule()
    {
        return Migrate::drop(self::$moduleName);
    }
}
