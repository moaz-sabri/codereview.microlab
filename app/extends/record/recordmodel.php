<?php

namespace App\Extends\Record;

use App\Database\Database;

class RecordModel extends Database
{
    public object $column;
    public string $pattern = '/^L-[A-Za-z0-9]{12}$/';

    private static string $moduleName = 'records';
    private static array $cols = [
        "record_uid" => "INT(11) NOT NULL AUTO_INCREMENT",
        "record_guide" => "CHAR(14) NOT NULL,",
        "record_owner" => "INT(11) DEFAULT NULL",
        "record_type" => "CHAR(33) NOT NULL",
        "record_status" => "CHAR(33) NOT NULL",
        "record_message" => "LONGTEXT NOT NULL",
        "record_hash" => "CHAR(33) DEFAULT NULL",
        "record_code" => "CHAR(255) DEFAULT NULL",
        "record_created_at" => "DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP",
        "record_updated_at" => "DATETIME DEFAULT NULL",
        "record_deleted_at" => "DATETIME DEFAULT NULL",
    ];

    function __construct()
    {
        $this->base = 'record';
        $this->tableName = self::$moduleName;
        $this->column = $this->attributes(self::$cols);
    }

    static function getTableName()
    {
        return self::tableIsExist(self::$moduleName);
    }
}
