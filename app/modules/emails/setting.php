<?php

namespace App\Modules\Emails;

use App\Modules\Permissions\Loader\PermissionLoader;

class Setting
{

    public static string $name = 'emails';

    public static array $details = [
        "required" => false,
        "index" => 4,
        "path" => [
            [
                "name" => "mailbox",
                "icon" => '<path d="M4.98 1a.5.5 0 0 0-.39.188L1.54 5H6a.5.5 0 0 1 .5.5 1.5 1.5 0 0 0 3 0A.5.5 0 0 1 10 5h4.46l-3.05-3.812A.5.5 0 0 0 11.02 1H4.98zm9.954 5H10.45a2.5 2.5 0 0 1-4.9 0H1.066l.32 2.562A.5.5 0 0 0 1.884 9h12.234a.5.5 0 0 0 .496-.438L14.933 6zM3.809.563A1.5 1.5 0 0 1 4.981 0h6.038a1.5 1.5 0 0 1 1.172.563l3.7 4.625a.5.5 0 0 1 .105.374l-.39 3.124A1.5 1.5 0 0 1 14.117 10H1.883A1.5 1.5 0 0 1 .394 8.686l-.39-3.124a.5.5 0 0 1 .106-.374L3.81.563zM.125 11.17A.5.5 0 0 1 .5 11H6a.5.5 0 0 1 .5.5 1.5 1.5 0 0 0 3 0 .5.5 0 0 1 .5-.5h5.5a.5.5 0 0 1 .496.562l-.39 3.124A1.5 1.5 0 0 1 14.117 16H1.883a1.5 1.5 0 0 1-1.489-1.314l-.39-3.124a.5.5 0 0 1 .121-.393zm.941.83.32 2.562a.5.5 0 0 0 .497.438h12.234a.5.5 0 0 0 .496-.438l.32-2.562H10.45a2.5 2.5 0 0 1-4.9 0H1.066z"/>',
                "url" => "/dashboard/mailbox",
                "description" => "control of languages",
            ],
            [
                "name" => "history",
                "icon" => '<path d="M4.98 1a.5.5 0 0 0-.39.188L1.54 5H6a.5.5 0 0 1 .5.5 1.5 1.5 0 0 0 3 0A.5.5 0 0 1 10 5h4.46l-3.05-3.812A.5.5 0 0 0 11.02 1H4.98zm9.954 5H10.45a2.5 2.5 0 0 1-4.9 0H1.066l.32 2.562A.5.5 0 0 0 1.884 9h12.234a.5.5 0 0 0 .496-.438L14.933 6zM3.809.563A1.5 1.5 0 0 1 4.981 0h6.038a1.5 1.5 0 0 1 1.172.563l3.7 4.625a.5.5 0 0 1 .105.374l-.39 3.124A1.5 1.5 0 0 1 14.117 10H1.883A1.5 1.5 0 0 1 .394 8.686l-.39-3.124a.5.5 0 0 1 .106-.374L3.81.563zM.125 11.17A.5.5 0 0 1 .5 11H6a.5.5 0 0 1 .5.5 1.5 1.5 0 0 0 3 0 .5.5 0 0 1 .5-.5h5.5a.5.5 0 0 1 .496.562l-.39 3.124A1.5 1.5 0 0 1 14.117 16H1.883a1.5 1.5 0 0 1-1.489-1.314l-.39-3.124a.5.5 0 0 1 .121-.393zm.941.83.32 2.562a.5.5 0 0 0 .497.438h12.234a.5.5 0 0 0 .496-.438l.32-2.562H10.45a2.5 2.5 0 0 1-4.9 0H1.066z"/>',
                "url" => "/dashboard/history",
                "description" => "control of unittest",
            ]
        ],
        "icon" => '<path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m-3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2m0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2m0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>',
        "role" => ["ADMIN", "MONITORING"],
        "model" => "history",
        "directory" => "emails",
        "name" => "Emails",
        "status" => "enable",
        "preview" => "enable",
        "description" => "the history meials",
        "actions" =>   [
            "dashboard", "update", "delete",
        ],
        "children" => [
            [
                "model" => "mailbox",
                "name" => "mailbox",
                "status" => "enable",
                "description" => "internal mails, reports, feedback, messages",
            ],
        ]
    ];

    public $route = [
        [
            "module" => "History",
            "url" => "dashboard/history",
            "function" => "dashboard",
            "theme" => "cpanel"
        ],
        [
            "module" => "Mailbox",
            "url" => "dashboard/mailbox",
            "function" => "dashboard",
            "theme" => "cpanel"
        ],
        [
            "method" => "POST",
            "module" => "Mailbox",
            "url" => "api/mailbox/create",
            "function" => "create",
            "theme" => false
        ],
        [
            "method" => "POST",
            "module" => "Mailbox",
            "url" => "api/mailbox/{guide}",
            "function" => "update",
            "theme" => false
        ],
        [
            "module" => "Mailbox",
            "url" => "mailbox/delete/{guide}",
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
