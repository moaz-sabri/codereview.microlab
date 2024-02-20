<?php

namespace App\Modules\Projects\Models;

use App\Database\{
    Database,
    Migrate
};
use App\Modules\Users\Models\UserModel;
use App\Utilities\Utilitie;

class ProjectModel extends Database
{

    private static string $moduleName = 'projects';
    private static array $cols = [
        "owner" => "INT(11) NOT NULL",
        "status" => "CHAR(33) DEFAULT 'ENABLE'",
        "allow" => "CHAR(33) DEFAULT 1",
        "friendlyurl" => "CHAR(255) DEFAULT NULL",
        "title" => "CHAR(255) DEFAULT NULL",
        "content" => "CHAR(255) DEFAULT NULL",
        "type" => "CHAR(33) DEFAULT NULL",
    ];

    public object $column;
    public string $pattern = '/^A-[A-Za-z0-9]{12}$/';

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
