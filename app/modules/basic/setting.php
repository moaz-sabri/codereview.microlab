<?php

namespace App\Modules\Basic;

use App\Modules\Permissions\Loader\PermissionLoader;

class Setting
{
    public static string $name = 'basic';

    public static array $details = [
        "required" => false,
        "index" => 0,
        "path" => "/home",
        "icon" => '<path d="M2.5 3.5a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1h-11zm2-2a.5.5 0 0 1 0-1h7a.5.5 0 0 1 0 1h-7zM0 13a1.5 1.5 0 0 0 1.5 1.5h13A1.5 1.5 0 0 0 16 13V6a1.5 1.5 0 0 0-1.5-1.5h-13A1.5 1.5 0 0 0 0 6v7zm1.5.5A.5.5 0 0 1 1 13V6a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-13z"/>',
        "role" => [],
        "model" => "",
        "directory" => "basic",
        "name" => "home",
        "status" => "enable",
        "description" => "The static Pages",
        "preview" => "enable",
        "actions" =>   [
            "preview",
        ]
    ];

    public $route = [
        [
            "module" => "Basic",
            "url" => ""
        ],
        [
            "module" => "Basic",
            "url" => "home"
        ],
        [
            "module" => "Basic",
            "url" => "policy"
        ],
        [
            "module" => "Basic",
            "url" => "about"
        ],
        [
            "module" => "Basic",
            "url" => "qanda"
        ],
        [
            "module" => "Basic",
            "url" => "impression"
        ],
        [
            "module" => "Basic",
            "url" => "services"
        ],

        // Documentation
        [
            "module" => "Basic",
            "url" => "documentation"
        ],
        [
            "module" => "Basic",
            "url" => "documentation/overview"
        ],
        [
            "module" => "Basic",
            "url" => "documentation/gettingstarted"
        ],
        [
            "module" => "Basic",
            "url" => "documentation/upcomingfeatures"
        ],
        [
            "module" => "Basic",
            "url" => "documentation/roadmap"
        ],
        [
            "module" => "Basic",
            "url" => "documentation/creating"
        ],
        [
            "module" => "Basic",
            "url" => "documentation/configuring"
        ],
        [
            "module" => "Basic",
            "url" => "help",
        ],

        // Policy
        [
            "method" => "POST",
            "module" => "Basic",
            "url" => "api/savepolicydata",
            "function" => "policysavedata"
        ],


        // Errors
        [
            "module" => "Basic",
            "url" => "bad-request",
            "function" => "errors",
            "theme" => false
        ],
        [
            "module" => "Basic",
            "url" => "unauthorized",
            "function" => "errors",
            "theme" => false
        ],
        [
            "module" => "Basic",
            "url" => "forbidden",
            "function" => "errors",
            "theme" => false
        ],
        [
            "module" => "Basic",
            "url" => "internal-server-error",
            "function" => "errors",
            "theme" => false
        ],
        [
            "module" => "Basic",
            "url" => "service-unavailable",
            "function" => "errors",
            "theme" => false
        ],
        [
            "module" => "Basic",
            "url" => "not-found",
            "function" => "errors",
            "theme" => false
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
