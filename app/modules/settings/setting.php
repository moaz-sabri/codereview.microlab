<?php

namespace App\Modules\Settings;

use App\Modules\Permissions\Loader\PermissionLoader;

class Setting
{

    public static string $name = 'settings';

    public static array $details = [
        "required" => true,
        "index" => 10,
        "path" => [
            [
                "name" => "Control Panel",
                "icon" => '<path d="M14 10a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-1a1 1 0 0 1 1-1h12zM2 9a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2H2z"/>
                <path d="M5 11.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-2 0a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM14 3a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h12zM2 2a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"/><path d="M5 4.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-2 0a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>',
                "url" => "/dashboard",
                "description" => "Control Panel",
            ],
            [
                "name" => "language",
                "icon" => '<path d="M4.545 6.714 4.11 8H3l1.862-5h1.284L8 8H6.833l-.435-1.286zm1.634-.736L5.5 3.956h-.049l-.679 2.022H6.18z"/>
                <path d="M0 2a2 2 0 0 1 2-2h7a2 2 0 0 1 2 2v3h3a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-3H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h7a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zm7.138 9.995c.193.301.402.583.63.846-.748.575-1.673 1.001-2.768 1.292.178.217.451.635.555.867 1.125-.359 2.08-.844 2.886-1.494.777.665 1.739 1.165 2.93 1.472.133-.254.414-.673.629-.89-1.125-.253-2.057-.694-2.82-1.284.681-.747 1.222-1.651 1.621-2.757H14V8h-3v1.047h.765c-.318.844-.74 1.546-1.272 2.13a6.066 6.066 0 0 1-.415-.492 1.988 1.988 0 0 1-.94.31z"/>',
                "url" => "/dashboard/languages",
                "description" => "control of languages",
            ],
            [
                "name" => "unittest",
                "icon" => '<path d="M10 .5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5.5.5 0 0 1-.5.5.5.5 0 0 0-.5.5V2a.5.5 0 0 0 .5.5h5A.5.5 0 0 0 11 2v-.5a.5.5 0 0 0-.5-.5.5.5 0 0 1-.5-.5"/>
                <path d="M4.085 1H3.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1h-.585c.055.156.085.325.085.5V2a1.5 1.5 0 0 1-1.5 1.5h-5A1.5 1.5 0 0 1 4 2v-.5c0-.175.03-.344.085-.5M9.98 5.356 11.372 10h.128a.5.5 0 0 1 0 1H11a.5.5 0 0 1-.479-.356l-.94-3.135-1.092 5.096a.5.5 0 0 1-.968.039L6.383 8.85l-.936 1.873A.5.5 0 0 1 5 11h-.5a.5.5 0 0 1 0-1h.191l1.362-2.724a.5.5 0 0 1 .926.08l.94 3.135 1.092-5.096a.5.5 0 0 1 .968-.039Z"/>',
                "url" => "/dashboard/unittest",
                "description" => "control of unittest",
            ]
        ],
        "icon" => '<path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m-3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2m0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2m0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>',
        "role" => ["ADMIN"],
        "model" => "",
        "directory" => "settings",
        "name" => "settings",
        "status" => "enable",
        "preview" => "enable",
        "description" => "Tools",
        "actions" =>   [
            "dashboard", "create", "update", "switch", "delete", "preview",
        ]
    ];

    public $route = [
        // Control Panel
        [
            "module" => "SuperHub",
            "url" => "dashboard",
            "theme" => "cpanel"
        ],
        [
            "module" => "SuperHub",
            "url" => "action/build/{directory}",
            "function" => "appbuliding"
        ],
        [
            "module" => "SuperHub",
            "url" => "action/remove/{directory}",
            "function" => "appremove"
        ],
        [
            "module" => "SuperHub",
            "url" => "action/update/{directory}",
            "function" => "appupdate"
        ],

        // CP API
        [
            "module" => "SuperHub",
            "url" => "api/dashboard/get",
            "function" => "get"
        ],

        // Languages
        [
            "module" => "Language",
            "url" => "dashboard/languages",
            "function" => "dashboard",
            "theme" => "cpanel"
        ],
        [
            "module" => "Language",
            "url" => "dashboard/language/{lang}",
            "function" => "dashboard",
            "theme" => "cpanel"
        ],
        [
            "module" => "Error",
            "url" => "notfound",
            "function" => "notfound",
        ],
        [
            "module" => "Language",
            "url" => "lang/switch/{lang}",
            "function" => "switchlanguage",
        ],
        [
            "method" => "POST",
            "module" => "Language",
            "url" => "lang/updatelanguage",
            "function" => "updatelanguage",
        ],

        // Sitemap
        [
            "module" => "Sitemap",
            "url" => "dashboard/sitemap",
            "function" => "dashboard",
            "theme" => "cpanel"
        ],

        // Setup
        [
            "module" => "Setup",
            "url" => "setup",
            "function" => "setup",
            "theme" => false
        ],
        [
            "method" => "POST",
            "module" => "Setup",
            "url" => "setup/install",
            "function" => "install",
            "theme" => false
        ],

        // Unit Test
        [
            "module" => "UnitTest",
            "url" => "dashboard/unittest",
            "function" => "dashboard",
            "theme" => "cpanel"
        ],
        [
            "method" => "POST",
            "module" => "UnitTest",
            "url" => "unit/{module}/{part}",
            "function" => "unit",
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
