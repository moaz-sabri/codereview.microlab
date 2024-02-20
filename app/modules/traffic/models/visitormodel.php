<?php

namespace App\Modules\Traffic\Models;

use App\Database\{
    Database,
    Migrate
};
use App\Modules\Users\Models\UserModel;
use App\Utilities\Utilitie;

class VisitorModel extends Database
{

    private static string $moduleName = 'visitors';
    private static array $cols = [
        "ip_address" => "CHAR(33) DEFAULT '-1'",
        "session" => "CHAR(255) DEFAULT '-1'",
        "user_agent" => "CHAR(255) DEFAULT NULL",
        "language" => "CHAR(255) DEFAULT NULL",
        "os" => "CHAR(255) DEFAULT NULL",
        "browser" => "CHAR(255) DEFAULT NULL",
        "device" => "CHAR(255) DEFAULT NULL",
        "country" => "CHAR(255) DEFAULT NULL",
        "first_visit_timestamp" => "TIMESTAMP DEFAULT CURRENT_TIMESTAMP",
        "last_visit_timestamp" => "TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP",
    ];

    public object $column;
    public string $pattern = '/^V-[A-Za-z0-9]{12}$/';

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
            self::$cols,
            $news
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
