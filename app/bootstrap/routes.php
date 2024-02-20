<?php

namespace App\Bootstrap;

use App\Utilities\Utilitie;

/**
 * Routes Class
 *
 * This class represents a set of routes and modules associated with a URL.
 */
class Routes
{
    /**
     * @var object $route An object containing route information.
     */
    public $route;

    /**
     * @var array $modules An array containing module information.
     */
    public $modules;

    /**
     * Modules Constructor
     *
     * This constructor initializes the Modules instance by loading available
     * modules, extracting their details, and determining the appropriate
     * module based on the provided URL.
     *
     * @param string $url The URL to determine the active module.
     */
    function __construct($url)
    {
        // Define the directory where module files are located
        $directory = WEBROOT . "/modules"; // Replace this with the path to your directory

        // Use glob to get an array of Modules files in the directory
        $available = glob($directory . "/*");

        // Use array_map to extract file names from the array
        $available = array_map(function ($file) {
            return pathinfo($file, PATHINFO_FILENAME);
        }, $available);

        // Iterate through each available module
        foreach ($available as $key => $className) :
            $className = ucwords($className);

            // Construct the full class name for the module's Setting class
            $class = "App\\Modules\\{$className}\\Setting"; // Replace this with the path 


            // Check if the class exists
            if (class_exists($class)) :
                // Create an instance of the module's Setting class
                $instance = new $class();

                // Extract details from the module's Setting class
                $details = (object) $class::$details;

                // Add module details to the modules array
                $this->modules[$details->directory] = $details;

                // Use getUrl function to determine the active module based on the provided URL
                $this->getUrl($instance, $url, $className);

            endif;
        endforeach;
    }


    /**
     * Get URL and Match with Routes
     *
     * This function iterates through the routes of a specified instance, 
     * compares each route's URL pattern with the provided URL, and sets 
     * the corresponding route if a match is found.
     *
     * @param object $instance   The instance containing routes to check against.
     * @param string $url        The URL to match against route patterns.
     * @param string $className  The class name associated with the routes.
     *
     * @return void
     */
    private function getUrl($instance, $url, $className)
    {
        // If the route is already set, there's no need to check again
        if (isset($this->route)) return;

        // Iterate through each route in the instance
        foreach ($instance->route as $r) :
            // Cast the route as an object for consistency
            $rotue = (object)$r;

            // Parse the provided URL into components
            $currentUrl = (object) parse_url($url);

            // Convert the URL to a regular expression pattern
            $pattern = str_replace(['/', '{', '}'], ['\/', '(?P<', '>[^\/]+)'], $rotue->url);
            $pattern = "/^$pattern$/";

            // Check if the current URL matches the pattern
            if (preg_match($pattern, $currentUrl->path, $matches)) :
                // Match found, $matches will contain the values of dynamic parts
                // Set the route and continue processing
                $this->get($rotue, "Modules\\{$className}");
                return;
            endif;
        endforeach;
    }

    /**
     *
     * This method updates the routing structure based on the provided object,
     * considering the URL structure, method, function, theme, and module.
     *
     * @param object $obj        The object containing route information.
     * @param string $location   The location of the route (e.g., 'frontend', 'backend').
     * @param object $parameters The parameters associated with the route.
     *
     * @return void
     */
    private function get(object $obj, string $location)
    {

        // Determine the module based on the location
        $module = "App\\{$location}\\Controllers\\{$obj->module}Controller";

        if (preg_match('/api\//i', $obj->url)) :
            $module =  "App\\{$location}\\Api\\{$obj->module}Api";
        endif;
        
        $currentLevel = (object) [
            "method" => $obj->method ?? "GET",
            "function" => $obj->function ?? "main",
            "theme" => $obj->theme ?? "default",
            "diractory" => $location,
            "module" => $module,
            "url" => $obj->url ?? false
        ];

        // Check if the route contains query parameters
        if (strpos($obj->url, '{') !== false) :
            $query = explode('/', $obj->url);
            foreach ($query as $key => $value) :
                if (strpos($value, '{') !== false) :
                    $value = str_replace(["{", "}"], "", $value);
                    $currentLevel->query[$value] = '$parameters->target';
                endif;
            endforeach;
        endif;

        $this->route = $currentLevel;
    }
}
