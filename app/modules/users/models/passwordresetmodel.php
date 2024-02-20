<?php

namespace App\Modules\Users\Models;

use App\Database\{
    Database,
    Migrate
};

class PasswordResetModel extends Database
{
    private static string $moduleName = 'passwordreset';
    private static array $cols = [
        "owner" => "INT(11) NOT NULL",
        "verifiedcode" => "CHAR(9) NOT NULL",
        "status" => "CHAR(33) DEFAULT 'PENNING'",
        "mail_status" => "CHAR(33) DEFAULT NULL",
    ];

    public object $column;
    public string $pattern = '/^R-[R-Za-z0-9]{12}$/';

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

        return Migrate::building(self::$moduleName, self::$cols, [
            "UNIQUE KEY `verifiedcode` (`verifiedcode`)",
            "KEY `owner` (`owner`)",
            "CONSTRAINT `passwordreset_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `users` (`uid`) ON DELETE CASCADE"
        ]);
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
        return true;
    }

    function removeModule()
    {
        return Migrate::drop(self::$moduleName);
    }
}
