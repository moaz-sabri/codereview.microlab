<?php

namespace App\Modules\Users\Models;

use App\Database\{
    Database,
    Migrate
};

use App\Utilities\Utilitie;

class UserModel extends Database
{
    #region [Protected]

    private static string $moduleName = 'users';
    private static array $cols = [
        "type" =>       "CHAR(33) NOT NULL DEFAULT 'account'",
        "roles" =>      "CHAR(11) NOT NULL DEFAULT 'none'",
        "name" =>       "CHAR(33) NOT NULL",
        "firstname" =>  "CHAR(55) DEFAULT NULL",
        "lastname" =>   "CHAR(55) DEFAULT NULL",
        "email" =>      "CHAR(33) NOT NULL",
        "password" =>   "CHAR(255) NOT NULL",
        "avatar" =>     "CHAR(255) DEFAULT NULL",
        "activation" => "CHAR(11) NOT NULL DEFAULT 'ENABLE'",
        "last_active_timestamp" => "TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP",
    ];

    public object $column;
    public static array $roleOptions = [
        "ADMIN", "MONITORING", "GUEST"
    ];
    public string $pattern = '/^U-[A-Za-z0-9]{12}$/';

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
            self::$cols
        );
    }

    function setDefault()
    {
        $password = '$2y$10$vNPcaPlOmstGKqnGbemdG.NRmh6Sz76KGHhpxmZpYdvmLZ3c/p1hu';

        $dataToInsert = [
            [1, 'U-DEVELOPER001', 'account', MASTER, 'developer', 'developer@email.com', '$2y$10$vNPcaPlOmstGKqnGbemdG.NRmh6Sz76KGHhpxmZpYdvmLZ3c/p1hu', 'ENABLE'],
            [5, 'U-ADMIN0000001', 'account', 'ADMIN', 'admin', 'admin@email.com', $password, 'ENABLE'],
            [2, 'U-MONITORING01', 'account', 'MONITORING', 'monitoring', 'monitoring@email.com', $password, 'ENABLE'],
            [3, 'U-GUEST0000001', 'account', 'GUEST', 'guest', 'guest@email.com', $password, 'ENABLE'],
        ];

        $columnNames = ['uid', 'guide', 'type', 'roles', 'name', 'email', 'password', 'activation'];

        return Migrate::insert(self::$moduleName, $dataToInsert, $columnNames);
    }

    function removeModule()
    {
        return Migrate::drop(self::$moduleName);
    }
}
