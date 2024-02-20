<?php

namespace App\Modules\Offers\Models;

use App\Database\{
    Database,
    Migrate
};
use App\Modules\Users\Models\UserModel;
use App\Utilities\Utilitie;

class OfferModel extends Database
{

    private static string $moduleName = 'offers';
    private static array $cols = [
        "type" => "CHAR(33) DEFAULT 'OTHER'",
        "start" => "CHAR(33) DEFAULT 'asap'",
        "speed" => "CHAR(255) DEFAULT 'normal'",
        "budget" => "CHAR(255) DEFAULT 0",
        "message" => "CHAR(255) DEFAULT NULL",
        "name" => "CHAR(255) DEFAULT NULL",
        "email" => "CHAR(255) DEFAULT NULL",
        "phone" => "CHAR(33) DEFAULT NULL",
    ];

    public object $column;
    public string $pattern = '/^O-[A-Za-z0-9]{12}$/';

    public static array $typeOptions = [
        "BLOG", "PORTFOLIO", "E-COMMERCE"
    ];
    public static array $startOptions = [
        "ASAP", "WEEK", "MONTH", "OPEN"
    ];
    public static array $speedOptions = [
        "NORMAL", "EXPRESS"
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
