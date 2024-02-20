<?php

namespace App\Modules\Core\Model;

use App\Database\Database;

class PermissionModel extends Database
{
    public object $column;
    public string $pattern = '/^P-[A-Za-z0-9]{12}$/';

    private static string $moduleName = 'permissions';
    private static array $cols =  [
        "permission_uid" => "INT(11) NOT NULL AUTO_INCREMENT",
        "permission_guide" => "CHAR(14) NOT NULL,",
        "permission_group_id" => "INT(11) NOT NULL",
        "permission_action" => "CHAR(255) DEFAULT NULL",
        "permission_module" => "CHAR(255) DEFAULT NULL",
        "permission_created_at" => "DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP",
        "permission_updated_at" => "DATETIME DEFAULT NULL",
        "permission_deleted_at" => "DATETIME DEFAULT NULL",
    ];

    function __construct()
    {
        $this->base = 'permission';
        $this->tableName = self::$moduleName;
        $this->column = $this->attributes(self::$cols);
    }

    static function getTableName()
    {
        return self::tableIsExist(self::$moduleName);
    }
}
