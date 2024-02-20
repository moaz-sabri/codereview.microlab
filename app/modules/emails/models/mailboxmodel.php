<?php

namespace App\Modules\Emails\Models;

use App\Database\{
    Database,
    Migrate
};
use App\Modules\Users\Models\UserModel;
use App\Utilities\Utilitie;

class MailboxModel extends Database
{

    private static string $moduleName = 'mailbox';
    private static array $cols = [
        "type" => "CHAR(33) DEFAULT 'OTHER'",
        "status" => "CHAR(33) DEFAULT 'NEW'",
        "name" => "CHAR(255) DEFAULT NULL",
        "telnumber" => "CHAR(255) DEFAULT NULL",
        "subject" => "CHAR(255) DEFAULT NULL",
        "email" => "CHAR(255) DEFAULT NULL",
        "message" => "CHAR(255) DEFAULT NULL",
        "source" => "CHAR(33) DEFAULT NULL",
    ];

    public object $column;
    public string $pattern = '/^E-[A-Za-z0-9]{12}$/';
    public static array $typeOptions = [
        "OTHER", "REPORT", "MESSAGE", "FEEDBACK"
    ];
    public static array $statusOptions = [
        "NEW", "READED", "CLOSED"
    ];

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
