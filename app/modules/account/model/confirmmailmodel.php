<?php

namespace App\Modules\Account\Model;

use App\Database\Database;

class ConfirmMailModel extends Database
{
    public object $column;
    public string $pattern = '/^R-[R-Za-z0-9]{12}$/';

    private static string $moduleName = 'confirm_mails';
    private static array $cols = [
        "cmail_uid" => "INT(11) NOT NULL AUTO_INCREMENT",
        "cmail_guide" => "CHAR(14) NOT NULL,",
        "cmail_owner" => "INT(11) NOT NULL",
        "cmail_verifiedcode" => "CHAR(9) NOT NULL",
        "cmail_status" => "CHAR(33) DEFAULT 'PENNING'",
        "cmail_type" => "CHAR(33) DEFAULT '-'",
        "cmail_created_at" => "DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP",
        "cmail_updated_at" => "DATETIME DEFAULT NULL",
        "cmail_deleted_at" => "DATETIME DEFAULT NULL",
    ];

    function __construct()
    {
        $this->base = 'cmail';
        $this->tableName = self::$moduleName;
        $this->column = $this->attributes(self::$cols);
    }

    static function getTableName()
    {
        return self::tableIsExist(self::$moduleName);
    }
}
