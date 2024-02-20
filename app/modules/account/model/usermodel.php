<?php

namespace App\Modules\Account\Model;

use App\Database\Database;

class UserModel extends Database
{
    #region [Protected]
    public object $column;
    public string $pattern = '/^U-[A-Za-z0-9]{12}$/';

    private static string $moduleName = 'users';
    private static array $cols = [
        "user_uid" => "INT(11) NOT NULL AUTO_INCREMENT",
        "user_guide" => "CHAR(14) DEFAULT -1",
        "user_group_id" => "INT(11) NOT NULL AUTO_INCREMENT",
        "user_type" => "CHAR(33) NOT NULL DEFAULT 'account'",
        "user_roles" => "CHAR(11) NOT NULL DEFAULT 'none'",
        "user_username" => "CHAR(33) NOT NULL",
        "user_firstname" => "CHAR(55) DEFAULT NULL",
        "user_lastname" => "CHAR(55) DEFAULT NULL",
        "user_email" => "CHAR(33) NOT NULL",
        "user_password" => "CHAR(255) NOT NULL",
        "user_avatar" => "CHAR(255) DEFAULT NULL",
        "user_activation" => "CHAR(11) NOT NULL DEFAULT 'ENABLE'",
        "user_last_active_timestamp" => "TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP",
        "user_created_at" => "DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP",
        "user_updated_at" => "DATETIME DEFAULT NULL",
        "user_deleted_at" => "DATETIME DEFAULT NULL",
    ];

    function __construct()
    {
        $this->base = 'user';
        $this->tableName = self::$moduleName;
        $this->column = $this->attributes(self::$cols);
    }

    static function getTableName()
    {
        return self::tableIsExist(self::$moduleName);
    }
}
