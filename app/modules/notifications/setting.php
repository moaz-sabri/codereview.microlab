<?php

namespace App\Modules\Notifications;

use App\Modules\Permissions\Loader\PermissionLoader;
use App\Utilities\Utilitie;

class Setting
{

    public static string $name = 'notifications';

    public static array $details = [
        "required" => false,
        "index" => 5,
        "path" => "/dashboard/notifications",
        "icon" => '<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"></path>',
        "role" => ["ADMIN", "MONITORING"],
        "model" => "notification",
        "directory" => "notifications",
        "name" => "notifications",
        "status" => "enable",
        "preview" => "enable",
        "description" => "Activities notifications",
        "actions" =>   [
            "dashboard", "update", "delete",
        ],
    ];

    public $route = [
        [
            "module" => "Notification",
            "url" => "dashboard/notifications",
            "function" => "dashboard",
            "theme" => "cpanel"
        ],
        [
            "method" => "POST",
            "module" => "Notification",
            "url" => "api/notification/update/{guide}",
            "function" => "update",
            "theme" => false
        ],
        [
            "module" => "Notification",
            "url" => "notification/delete/{guide}",
            "function" => "delete",
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
