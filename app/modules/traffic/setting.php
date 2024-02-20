<?php

namespace App\Modules\Traffic;

use App\Modules\Permissions\Loader\PermissionLoader;
use App\Utilities\Utilitie;

class Setting
{

    public static string $name = 'traffic';

    public static array $details = [
        "required" => false,
        "index" => 12,
        "path" => "/dashboard/traffic",
        "icon" => '<path d="M8 5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3m0 4a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3m1.5 2.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"/>
        <path d="M4 2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2h2c-.167.5-.8 1.6-2 2v2h2c-.167.5-.8 1.6-2 2v2h2c-.167.5-.8 1.6-2 2v1a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-1c-1.2-.4-1.833-1.5-2-2h2V8c-1.2-.4-1.833-1.5-2-2h2V4c-1.2-.4-1.833-1.5-2-2zm2-1a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h4a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1z"/>',
        "role" => [],
        "model" => "visitor",
        "directory" => "traffic",
        "name" => "visitors",
        "status" => "enable",
        "preview" => "enable",
        "description" => "the traffic of visitors",
        "actions" => ["dashboard"],
        "children" => [
            [
                "model" => "traffic",
                "name" => "traffic",
                "status" => "enable",
                "description" => "traffic history",
            ]
        ]
    ];

    public $route = [
        [
            "module" => "traffic",
            "url" => "dashboard/traffic",
            "function" => "dashboard",
            "theme" => "cpanel"
        ],
    ];

    function __construct()
    {
    }

    static function permission(string $action = 'dashboard')
    {
        return PermissionLoader::allowed(self::$name, $action, self::$details['role']);
    }
}
