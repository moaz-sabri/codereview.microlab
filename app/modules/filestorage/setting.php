<?php

namespace App\Modules\FileStorage;

use App\Modules\Permissions\Loader\PermissionLoader;

class Setting
{

    public static string $name = 'filestorage';

    public static array $details = [
        "required" => false,
        "index" => 3,
        "path" => "/dashboard/filestorage",
        "icon" => '<path fill-rule="evenodd" d="M7.646 5.146a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 6.707V10.5a.5.5 0 0 1-1 0V6.707L6.354 7.854a.5.5 0 1 1-.708-.708l2-2z"/>
        <path d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383zm.653.757c-.757.653-1.153 1.44-1.153 2.056v.448l-.445.049C2.064 6.805 1 7.952 1 9.318 1 10.785 2.23 12 3.781 12h8.906C13.98 12 15 10.988 15 9.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 4.825 10.328 3 8 3a4.53 4.53 0 0 0-2.941 1.1z"/>',
        "role" => ["ADMIN"],
        "model" => "filestorage",
        "directory" => "filestorage",
        "name" => "file storage",
        "status" => "enable",
        "preview" => "enable",
        "description" => "Allows users to upload files to a designated storage location. This can include images, documents, videos, or any other file types.",
        "actions" =>   [
            "dashboard", "create", "update", "switch", "delete", "preview",
        ]
    ];


    public $route = [
        [
            "module" => "FileStorage",
            "url" => "dashboard/filestorage",
            "function" => "dashboard",
            "theme" => "cpanel"
        ],
        [
            "method" => "POST",
            "module" => "FileStorage",
            "url" => "api/uploads/file",
            "function" => "uploadfile",
            "theme" => false
        ],
        [
            "method" => "POST",
            "module" => "FileStorage",
            "url" => "api/load/files",
            "function" => "loadfiles",
            "theme" => false
        ],
        [
            "method" => "POST",
            "module" => "FileStorage",
            "url" => "file/switch/{guide}",
            "function" => "switch",
            "theme" => false
        ],
        [
            "module" => "FileStorage",
            "url" => "file/delete/{guide}",
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
