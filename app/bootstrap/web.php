<?php

namespace App\Bootstrap;

class Web
{
    private static $lastForwardSlash = [
        'get_manger_dashboard'
    ];

    private static $paths =  [
        // Public
        'get_home' => '',
        'get_about' => 'about',
        'get_services' => 'services',
        'get_policy' => 'policy',
        'get_qanda' => 'qanda',
        'get_impression' => 'impression',
        'get_help' => 'help',
        'put_allowed_policy' => 'api/policy_allowed',

        // Dashboard
        'get_manger_dashboard' =>  PATH_ADMIN,
        'get_manger_record' =>  PATH_ADMIN . 'record/',

        // ADMIN User
        'get_manger_users' =>  PATH_ADMIN . 'users',
        'get_manger_user' =>  PATH_ADMIN . 'user/',
        'get_manger_add_user' =>  PATH_ADMIN . 'user/add',
        'get_manger_user_activity' =>  PATH_ADMIN . 'user/',
        'post_manger_user' => 'api/' . PATH_ADMIN . 'user/create',
        'put_manger_user' => 'api/' . PATH_ADMIN . 'user/update/',
        'delete_manger_user' => 'api/' . PATH_ADMIN . 'user/delete/',

        // User
        'get_visit_profile' => 'profile/',
        'get_profile' =>  PATH_USER . 'profile',
        'get_edit_profile' =>  PATH_USER . 'profile/edit',
        'put_profile' => 'api/' . PATH_USER . 'profile',

        // Reminder Calendar
        'get_reminder_calendar' => PATH_USER . 'reminder-calendar',
        'get_reminder_editor' =>  PATH_USER . 'reminder-calendar/editor/',
        'post_reminder' =>  'api/' . PATH_USER . 'reminder-calendar/create',
        'post_reminder_update' => 'api/' . PATH_USER . 'reminder-calendar/update/',
        'delete_reminder' => 'api/' . PATH_USER . 'reminder-calendar/delete/',

        // Permissions
        'get_manger_security' =>  PATH_ADMIN . 'permission-groups',
        'get_manger_add_group' =>  PATH_ADMIN . 'permission-groups/store',
        'get_manger_group' =>  PATH_ADMIN . 'permission-groups/group/',
        'post_manger_group' => 'api/' . PATH_ADMIN . 'permission-groups/create',
        'put_manger_group' => 'api/' . PATH_ADMIN . 'permission-groups/update/',
        'delete_manger_group' => 'api/' . PATH_ADMIN . 'permission-groups/delete/',

        // Sign
        'get_signin' =>  PATH_SIGN . 'signin',
        'post_signin' => 'api/' . PATH_SIGN . 'signin',
        'get_signup' =>  PATH_SIGN . 'signup',
        'post_signup' => 'api/' . PATH_SIGN . 'signup',
        'get_signout' =>  PATH_SIGN . 'signuot',
        'get_forgotpassword' =>  PATH_SIGN . 'forgotpassword',
        'post_forgotpassword' => 'api/' . PATH_SIGN . 'forgotpassword',
        'get_resetpassword' =>  PATH_SIGN . 'resetpassword',
        'post_resetpassword' => 'api/' . PATH_SIGN . 'resetpassword',
        'get_confirm' =>  PATH_SIGN . 'confirm',
        'post_confirm' => 'api/' . PATH_SIGN . 'confirm',
        'get_sentmail' =>  PATH_SIGN . 'sentmail',
    ];

    function __construct()
    {
        $router = new Router;

        // Define the directory where module files are located
        $directory = __DIR__ . "/../modules/"; // Replace this with the path to your directory

        // Use glob to get an array of Modules files in the directory
        $modules = glob($directory . "*");

        // Use array_map to extract file names from the array
        $available = array_map(function ($file) {
            return pathinfo($file, PATHINFO_FILENAME);
        }, $modules);

        // Iterate through each available module
        foreach ($available as $key => $module) :
            $className = ucwords($module);

            // Construct the full class name for the module's Setting class
            $className = "App\\Modules\\{$className}\\{$className}Urls";

            if (class_exists($className)) :
                new $className($router);
            endif;

        endforeach;

        // Simulate a request
        $requestMethod = $_SERVER['REQUEST_METHOD'];
        $requestPath = $_SERVER['REQUEST_URI'];
        $request =  new Request($requestMethod, $requestPath);
        $response = $router->dispatch($request);
        $response->send();

        if (DEBUG) debug("Ready to preview!");
    }

    public static function getPath($name)
    {
        // Remove the last forward slash
        $path = isset(self::$paths[$name]) ? '/' . self::$paths[$name] : '/';

        if (in_array($name, self::$lastForwardSlash)) $path = rtrim($path, '/');

        return $path;
    }
}
