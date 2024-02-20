<?php

namespace App\Modules\Records\Models;

use App\Database\{
    Database,
    Migrate
};

use App\Utilities\Utilitie;

class RecordModel extends Database
{

    private static string $moduleName = 'records';
    private static array $cols = [
        "owner" => "INT(11) DEFAULT NULL",
        "type" => "CHAR(33) NOT NULL",
        "status" => "CHAR(33) NOT NULL",
        "message" => "LONGTEXT NOT NULL",
        "hash" => "CHAR(33) DEFAULT NULL",
        "code" => "CHAR(255) DEFAULT NULL",
    ];

    public object $column;
    public string $pattern = '/^L-[A-Za-z0-9]{12}$/';

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
