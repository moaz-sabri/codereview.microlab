<?php

namespace App\Modules\Projects\Models;

use App\Database\{
    Database,
    Migrate
};
use App\Modules\FileStorage\Models\FileStorageModel;
use App\Modules\Users\Models\UserModel;
use App\Utilities\Utilitie;

class ProjectFileModel extends Database
{

    private static string $moduleName = 'projectfile';
    private static array $cols = [
        "project_id" => "INT(11) NOT NULL",
        "file_id" => "INT(11) NOT NULL",
        "location" => "CHAR(33) NOT NULL",
        "allow" => "CHAR(33) DEFAULT 1",
    ];

    public object $column;
    public string $pattern = '/^M-[A-Za-z0-9]{12}$/';

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
        if (
            !Migrate::tableIsExist(UserModel::getTableName()) ||
            !Migrate::tableIsExist(FileStorageModel::getTableName()) ||
            !Migrate::tableIsExist(ProjectModel::getTableName())
        ) return ['users', 'projects', 'filestorage'];

        return Migrate::building(self::$moduleName, self::$cols, [
            "KEY `project_id` (`project_id`)",
            "CONSTRAINT `project_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`uid`) ON DELETE CASCADE"
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
