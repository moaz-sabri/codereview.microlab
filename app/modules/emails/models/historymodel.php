<?php

namespace App\Modules\Emails\Models;

use App\Modules\Users\Models\UserModel;
use App\Database\{
    Database,
    Migrate
};

class HistoryModel extends Database
{

    private static string $moduleName = 'mailshistory';
    private static array $cols = [
        "owner" => "INT(11) DEFAULT -1",
        "type" => "CHAR(33) DEFAULT NULL",
        "status" => "CHAR(33) DEFAULT NULL",
        "response" => "CHAR(255) DEFAULT NULL",
        "template" => "VARCHAR(1500) DEFAULT NULL",
    ];

    public object $column;
    public string $pattern = '/^E-[A-Za-z0-9]{12}$/';
    public static array $types = [
        "confirm_case" => "confirm_case",
        "confirm_account" => "confirm_account",
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

        if (!Migrate::tableIsExist(UserModel::getTableName())) return ['users'];

        return Migrate::building(self::$moduleName, self::$cols, []);
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
