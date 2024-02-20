<?php

namespace App\Modules\Users;

use App\Modules\Permissions\Loader\PermissionLoader;

class Setting
{
    public static string $name = 'users';

    public static array $details = [
        "required" => true,
        "index" => 13,
        "path" => "/dashboard/users",
        "icon" => '<path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8Zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022ZM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816ZM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275ZM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0Zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4Z" />',
        "role" => ["ADMIN"],
        "model" => "user",
        "directory" => "users",
        "name" => "users",
        "status" => "enable",
        "preview" => "enable",
        "description" => "Accounts of Users Table",
        "actions" =>   [
            "dashboard", "create", "update", "switch", "delete", "preview",
        ],
        "children" => [
            [
                "model" => "passwordreset",
                "name" => "reset password",
                "status" => "enable",
                "description" => "records of reset password request",
            ],
            [
                "model" => "authentication",
                "name" => "authentication",
                "status" => "enable",
                "description" => "memory token of user logged",
            ]
        ]
    ];

    public $route = [
        [
            "module" => "User",
            "url" => "profile",
            "function" => "profile",
            "theme" => "cpanel"
        ],
        [
            "method" => "POST",
            "module" => "User",
            "url" => "user/update_profile/{guide}",
            "function" => "update_profile",
        ],
        [
            "method" => "POST",
            "module" => "User",
            "url" => "user/switch/{guide}",
            "function" => "switch",
        ],
        [
            "module" => "User",
            "url" => "user/store",
            "function" => "store",
            "theme" => "cpanel"
        ],
        [
            "method" => "POST",
            "module" => "User",
            "url" => "user/create",
            "function" => "create",
        ],
        [
            "module" => "User",
            "url" => "user/edit/{guide}",
            "function" => "edit",
            "theme" => "cpanel"
        ],
        [
            "method" => "POST",
            "module" => "User",
            "url" => "user/update/{guide}",
            "function" => "update",
        ],
        [
            "method" => "GET|POST|DELETE",
            "module" => "User",
            "url" => "user/delete/{guide}",
            "function" => "destroy",
        ],
        [
            "module" => "User",
            "url" => "dashboard/users",
            "function" => "dashboard",
            "theme" => "cpanel"
        ],

        // Authentication
        [
            "module" => "Authentication",
            "url" => "login",
            "function" => "login",
            "theme" => false
        ],
        [
            "method" => "POST",
            "module" => "Authentication",
            "url" => "api/auth/login",
            "function" => "login",
            "theme" => false
        ],
        [
            "module" => "Authentication",
            "url" => "forgot/password",
            "function" => "forgotpassword",
            "theme" => false
        ],
        [
            "method" => "POST",
            "module" => "Authentication",
            "url" => "api/auth/forgotpassword",
            "function" => "forgotpassword",
            "theme" => false
        ],
        [
            "module" => "Authentication",
            "url" => "reset/password/{guide}",
            "function" => "resetpassword",
            "theme" => false
        ],
        [
            "module" => "Authentication",
            "url" => "confirm/{guide}",
            "function" => "confirmemail",
            "theme" => false
        ],
        [
            "method" => "POST",
            "module" => "Authentication",
            "url" => "api/auth/resetpassword",
            "function" => "resetpassword",
            "theme" => false
        ],
        [
            "module" => "Authentication",
            "url" => "logout",
            "function" => "logout",
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
