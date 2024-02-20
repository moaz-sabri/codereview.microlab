<?php

namespace App\Modules\Core\Model;

use App\Database\Database;

class AuthenticationModel extends Database
{
    public object $column;
    public string $pattern = '/^T-[A-Za-z0-9]{12}$/';
    private static string $moduleName = 'authentication';

    private static array $cols = [
        "auth_uid" => "INT(11) NOT NULL AUTO_INCREMENT",
        "auth_guide" => "CHAR(14) NOT NULL,",
        "auth_owner" => "INT(11) NOT NULL",
        "auth_token" => "CHAR(255) NOT NULL",
        "auth_created_at" => "DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP",
        "auth_updated_at" => "DATETIME DEFAULT NULL",
        "auth_deleted_at" => "DATETIME DEFAULT NULL",
    ];

    function __construct()
    {
        $this->base = 'auth';
        $this->tableName = self::$moduleName;
        $this->column = $this->attributes(self::$cols);
    }

    static function getTableName()
    {
        return self::tableIsExist(self::$moduleName);
    }
}
