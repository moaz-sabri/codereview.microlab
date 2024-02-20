<?php

namespace App\Modules\Projects;

use App\Modules\Permissions\Loader\PermissionLoader;
use App\Utilities\Utilitie;

class Setting
{

    public static string $name = 'projects';

    public static array $details = [
        "required" => false,
        "index" => 8,
        "path" => "/dashboard/projects",
        "icon" => '<path d="M7.752.066a.5.5 0 0 1 .496 0l3.75 2.143a.5.5 0 0 1 .252.434v3.995l3.498 2A.5.5 0 0 1 16 9.07v4.286a.5.5 0 0 1-.252.434l-3.75 2.143a.5.5 0 0 1-.496 0l-3.502-2-3.502 2.001a.5.5 0 0 1-.496 0l-3.75-2.143A.5.5 0 0 1 0 13.357V9.071a.5.5 0 0 1 .252-.434L3.75 6.638V2.643a.5.5 0 0 1 .252-.434L7.752.066ZM4.25 7.504 1.508 9.071l2.742 1.567 2.742-1.567L4.25 7.504ZM7.5 9.933l-2.75 1.571v3.134l2.75-1.571V9.933Zm1 3.134 2.75 1.571v-3.134L8.5 9.933v3.134Zm.508-3.996 2.742 1.567 2.742-1.567-2.742-1.567-2.742 1.567Zm2.242-2.433V3.504L8.5 5.076V8.21l2.75-1.572ZM7.5 8.21V5.076L4.75 3.504v3.134L7.5 8.21ZM5.258 2.643 8 4.21l2.742-1.567L8 1.076 5.258 2.643ZM15 9.933l-2.75 1.571v3.134L15 13.067V9.933ZM3.75 14.638v-3.134L1 9.933v3.134l2.75 1.571Z"/>',
        "role" => ["ADMIN", "MONITORING"],
        "model" => "project",
        "directory" => "projects",
        "name" => "projects",
        "status" => "enable",
        "preview" => "enable",
        "description" => "the project to view",
        "actions" =>   [
            "dashboard", "create", "update", "switch", "delete", "preview",
        ],
        "children" => [
            [
                "model" => "projectfile",
                "name" => "project file",
                "status" => "enable",
                "description" => "the relation project with files",
            ],
            [
                "model" => "projectmeta",
                "name" => "project meta",
                "status" => "enable",
                "description" => "the relation project with files",
            ],
            [
                "model" => "projectcategories",
                "name" => "project categories",
                "status" => "enable",
                "description" => "the relation project with files",
            ],
            [
                "model" => "projecttags",
                "name" => "project tags",
                "status" => "enable",
                "description" => "the relation project with files",
            ]
        ]
    ];

    public $route = [
        [
            "module" => "Project",
            "url" => "dashboard/projects",
            "function" => "dashboard",
            "theme" => "cpanel"
        ],
        [
            "module" => "Project",
            "url" => "project/editor",
            "function" => "editor",
            "theme" => false
        ],
        [
            "module" => "Project",
            "url" => "project/editor/{guide}",
            "function" => "editor",
            "theme" => false
        ],
        [
            "module" => "Project",
            "url" => "api/project/delete/{guide}",
            "function" => "delete",
            "theme" => false
        ],
        [
            "module" => "Project",
            "url" => "api/project/destroy/{guide}",
            "function" => "destroy",
            "theme" => false
        ],
        [
            "method" => "POST",
            "module" => "Project",
            "url" => "api/project/create",
            "function" => "create",
            "theme" => false
        ],
        [
            "method" => "POST",
            "module" => "Project",
            "url" => "api/project/update/{guide}",
            "function" => "update",
            "theme" => false
        ],
        [
            "method" => "POST",
            "module" => "Project",
            "url" => "api/project/switch/{guide}",
            "function" => "switch",
            "theme" => false
        ],
        // Client Side
        [
            "module" => "ProjectClientSide",
            "url" => "search?{search}",
            "function" => "search"
        ],
        [
            "module" => "ProjectClientSide",
            "url" => "categories?{search}",
            "function" => "search"
        ],
        [
            "module" => "ProjectClientSide",
            "url" => "tags?{search}",
            "function" => "search"
        ],

        [
            "module" => "ProjectClientSide",
            "url" => "products",
            "function" => "projects"
        ],
        [
            "module" => "ProjectClientSide",
            "url" => "blog",
            "function" => "projects"
        ],
        [
            "module" => "ProjectClientSide",
            "url" => "websites",
            "function" => "projects"
        ],
        [
            "module" => "ProjectClientSide",
            "url" => "unknown",
            "function" => "projects"
        ],
        [
            "module" => "ProjectClientSide",
            "url" => "products/preview/{guide}",
            "function" => "preview"
        ],
        [
            "module" => "ProjectClientSide",
            "url" => "websites/preview/{guide}",
            "function" => "preview"
        ],
        [
            "module" => "ProjectClientSide",
            "url" => "blog/preview/{guide}",
            "function" => "preview"
        ],
        [
            "module" => "ProjectClientSide",
            "url" => "unknown/preview/{guide}",
            "function" => "preview"
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
