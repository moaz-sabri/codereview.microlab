<?php

namespace App\Modules\FileStorage\Models;

use App\Database\{
    Database,
    Migrate
};
use App\Modules\Users\Models\UserModel;
use App\Utilities\Utilitie;

class FileStorageModel extends Database
{

    private static string $moduleName = 'filestorage';
    private  static array $cols = [
        "owner" => "INT(11) NOT NULL",
        "type" => "CHAR(33) NOT NULL",
        "status" => "CHAR(33) DEFAULT 'ENABLE'",
        "allow" => "CHAR(33) DEFAULT 1",
        "path" => "CHAR(255) DEFAULT NULL",
        "name" => "CHAR(33) DEFAULT NULL",
        "size" => "INT(11) DEFAULT NULL",
        "extension" => "CHAR(33) DEFAULT NULL",
    ];

    public object $column;
    public string $pattern = '/^F-[A-Za-z0-9]{12}$/';

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
