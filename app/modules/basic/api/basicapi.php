<?php

namespace App\Modules\Basic\Api;

use App\Modules\Records\Loader\RecordLoader;
use App\Utilities\Utilitie;

class BasicApi extends Utilitie
{
    function policysavedata()
    {
        // Get user's IP address
        $userIP = $_SERVER['REMOTE_ADDR'];

        // Get user's browser and operating system information
        $userAgent = $_SERVER['HTTP_USER_AGENT'];

        // Get user's language preference
        $userLanguage = $_SERVER['HTTP_ACCEPT_LANGUAGE'];

        // Set a cookie named 'user' with the value 'John Doe' that expires in one hour
        setcookie('policy', $_COOKIE['PHPSESSID'], time() + 3600, '/'); // '/' makes it accessible across the entire domain

        // Store the gathered data in an array
        $userData = array(
            'ip' => $userIP,
            'user_agent' => $userAgent,
            'language' => $userLanguage,
            ""
        );

        RecordLoader::locallog([
            "status" => 200,
            "message" => json_encode($userData),
            "location" => 'location',
            "code" => 'dfg7s8f7'
        ]);


        return 'true';
    }
}
