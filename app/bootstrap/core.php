<?php

namespace App\Bootstrap;

use App\Bootstrap\Routes;
use App\Modules\Settings\Loader\LanguageLoader;
use App\Modules\Permissions\Loader\PermissionLoader;
use App\Utilities\{
    Informations,
    Utilitie
};

/**
 * Main Class
 *
 * This class represents the main structure of the application.
 */
class Core extends Output
{

    /**
     * @var Informations $informations
     * An instance of the Informations class to get client-related information.
     */
    use Informations;

    /**
     * @var string $dir
     * The directory path for the application.
     */
    public $dir;
    /**
     * @var array $meta
     * Metadata information for the application.
     */
    public $meta;
    /**
     * @var string $theme
     * The theme used for the application.
     */
    public $theme;
    /**
     * @var array $modules
     * List of modules or components used in the application.
     */
    public $modules;
    /**
     * @var string $language
     * The language setting for the application.
     */
    public $language;

    /**
     * Constructor
     *
     * Initializes the MainClass and sets up dependencies.
     */
    function __construct()
    {
        // Format the URL using the Request class
        $request = new Request();

        // Initialize the language loader and determine the language to use
        $languageLoader = new LanguageLoader();
        $languageLoader->load($request->parameters->language);

        // Load the routing configuration using the parameters from the request
        $routes = new Routes($request->url);

        // Check if the requested module exists in the routing configuration
        if (!isset($routes->route->module)) :
            // If the module is not found, respond with a 404 error
            Utilitie::bad('404', 'Not Found');
        endif;

        // Build and handle the request using the determined module configuration and language loader
        $this->build($routes, $languageLoader, $request);
    }

    /**
     * Build and Handle Request
     *
     * This method processes a request based on the provided routing configuration and module.
     *
     * @param Routes         $routes   The routing configuration.
     * @param LanguageLoader $language The language loader.
     * @param Request        $request  The request object.
     *
     * @return 
     */
    private function build(Routes $routes, LanguageLoader $language, Request $request)
    {
        $module = $routes->route;
        $this->theme = $module->theme;

        // Split the allowed HTTP methods into an array
        $method = explode('|', $module->method);

        // Check if the current request method is allowed
        if (
            in_array($_SERVER['REQUEST_METHOD'], $method) ||
            ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['method']) &&
                in_array($_POST['method'], $method))
        ) :
            // Check if the class for the module exists
            // Retrieve the function name from the module configuration or set it to false
            if (
                class_exists($module->module) &&
                isset($module->function)
            ) :

                // Check if the Authorization header is present in the request
                if (
                    isset($_SERVER['HTTP_AUTHORIZATION']) ||
                    isset($_SERVER['REDIRECT_HTTP_AUTHORIZATION'])
                ) :
                    $token = $_SERVER['HTTP_AUTHORIZATION'] ?? $_SERVER['REDIRECT_HTTP_AUTHORIZATION'];
                    PermissionLoader::authenticated($token);
                else :
                    PermissionLoader::authenticated();
                endif;

                // Handle the request using the request handler
                $data = $request->handler($module);

                // Handle the response based on the request type (API, JSON, or other)
                if (isset($data) && isset($data->view) && !isset($request->parameters->api)) :

                    // Construct the layout path based on the module configuration
                    $layout = WEBROOT . "/" . strtolower(str_replace("\\", "/", "{$module->diractory}\\templates\\" . $data->view . ".php"));

                    // Check if the layout file exists
                    if (file_exists($layout)) :

                        // Render the view and pass language, parameters, device, and metadata
                        if (isset($data->language)) :
                            $language->moreLabels($data->language);
                        endif;

                        $data->label = $language;
                        $data->param = $request->parameters;

                        $data->device = $this->detectDevice();
                        $this->dir = $data->label->get('dir', 'ltr');
                        $this->language = $data->label->get('language', 'en');
                        $this->meta = $data->meta;

                        // Optionally, handle specific logic for the 'cpanel' theme
                        if ($this->theme == "cpanel" || ($request->parameters->module === 'setup' && $request->parameters->queries->hash === SECRET_KEY)) :
                            usort($routes->modules, function ($a, $b) {
                                return $a->index - $b->index;
                            });
                            $data->modules = $routes->modules;
                        endif;

                        // Render the view
                        return $this->renderView($data, $layout, $this->theme);
                    endif;
                elseif (isset($data) && isset($request->parameters->api)) :
                    // Set the response content type to JSON and exit with the JSON data
                    header('Content-Type: application/json');
                    header('Cache-Control: no-cache, no-store, must-revalidate');
                    header('Expires: 0');
                    header('Pragma: no-cache');
                    exit(json_encode($data));

                endif;
            endif;
        endif;

        // If no valid route or handling is found, respond with a 404 error
        Utilitie::bad('404', 'Not Found');
    }
}
