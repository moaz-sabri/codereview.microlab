<?php

namespace App\Extends\Mailer;

use App\Database\Database;

class MailerModel extends Database
{
    public object $column;
    public string $pattern = '/^E-[A-Za-z0-9]{12}$/';

    private static string $moduleName = 'mailshistory';
    private static array $cols = [
        "hmail_uid" => "INT(11) NOT NULL AUTO_INCREMENT",
        "hmail_guide" => "CHAR(14) NOT NULL,",
        "hmail_own" => "INT(11) DEFAULT -1",
        "hmail_type" => "CHAR(33) DEFAULT NULL",
        "hmail_status" => "CHAR(33) DEFAULT NULL",
        "hmail_response" => "CHAR(255) DEFAULT NULL",
        "hmail_template" => "VARCHAR(1500) DEFAULT NULL",
        "hmail_created_at" => "DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP",
        "hmail_updated_at" => "DATETIME DEFAULT NULL",
        "hmail_deleted_at" => "DATETIME DEFAULT NULL",
    ];

    function __construct()
    {
        $this->base = 'hmail';
        $this->tableName = self::$moduleName;
        $this->column = $this->attributes(self::$cols);
    }

    static function getTableName()
    {
        return self::tableIsExist(self::$moduleName);
    }
}
