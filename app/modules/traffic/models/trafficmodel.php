<?php

namespace App\Modules\Traffic\Models;

use App\Database\{
    Database,
    Migrate
};

class TrafficModel extends Database
{

    private static string $moduleName = 'traffic';
    private static array $cols = [
        "visitor_id" => "INT(11) NOT NULL",
        "registered_id" => "INT(11) DEFAULT NULL",
        "page_url" => "CHAR(255) DEFAULT NULL",
        "page_load_time" => "CHAR(255) DEFAULT NULL",
        "queries" => "CHAR(255) DEFAULT NULL",
        "response" => "CHAR(255) DEFAULT 1",
        "reloaded" => "INT(5) DEFAULT 0",
        "type" => "CHAR(33) DEFAULT 'client'",
    ];

    public object $column;
    public string $pattern = '/^T-[A-Za-z0-9]{12}$/';

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
        if (!Migrate::tableIsExist(VisitorModel::getTableName())) return ['users'];

        return Migrate::building(self::$moduleName, self::$cols, [
            "KEY `visitor_id` (`visitor_id`)",
            "CONSTRAINT `visitor_ibfk_1` FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`uid`) ON DELETE CASCADE"
        ]);
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
