<?php

namespace App\Modules\Core\Model;

use App\Database\Database;

class PermissionGroupsModel extends Database
{
    public object $column;
    public string $pattern = '/^G-[A-Za-z0-9]{12}$/';

    private static string $moduleName = 'permissiongroups';
    private static array $cols = [
        "pgroup_uid" => "INT(11) NOT NULL AUTO_INCREMENT",
        "pgroup_guide" => "CHAR(14) NOT NULL,",
        "pgroup_status" => "CHAR(11) NOT NULL DEFAULT 'ENABLE'",
        "pgroup_name" => "CHAR(33) NOT NULL",
        "pgroup_description" => "CHAR(255) DEFAULT NULL",
        "pgroup_created_at" => "DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP",
        "pgroup_updated_at" => "DATETIME DEFAULT NULL",
        "pgroup_deleted_at" => "DATETIME DEFAULT NULL",
    ];

    function __construct()
    {
        $this->base = 'pgroup';
        $this->tableName = self::$moduleName;
        $this->column = $this->attributes(self::$cols);
    }

    static function getTableName()
    {
        return self::tableIsExist(self::$moduleName);
    }
}
