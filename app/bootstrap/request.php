<?php

namespace App\Bootstrap;

use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Records\Loader\RecordLoader;
use App\Modules\Users\Loader\User;
use App\Utilities\Utilitie;
use ReflectionClass;

/**
 * Class Request
 *
 * This class handles incoming requests, implements request rate limiting logic,
 * and parses request data and parameters.
 */
class Request
{

    /**
     * @var mixed $url The orgin url.
     */
    public $url;

    /**
     * @var mixed $data The request data.
     */
    public $data;

    /**
     * @var mixed $parameters The request parameters.
     */
    public $parameters;

    /**
     * Constructor
     *
     * Initializes the Request object, handles request rate limiting logic,
     * sets request history, and parses request data and parameters.
     */
    function  __construct()
    {
        // Implement request rate limiting logic
        $isSpam = $this->isSpam();

        // Check if the request is not spam or in DEBUGMODE
        if (!$isSpam || DEBUGMODE) :
            // Set request history
            $this->setHistory();

            // Get request data
            $this->data =  $this->getRequest();

            // Parse request parameters from the URL
            $this->parameters = $this->parseUrl();
        else :
            // Log or handle the spam attempt (e.g., block the IP)
            require_once ROOT . 'errors/bad-request.html';

            // Check and unblock IPs after 30 minutes
            $this->unblockOldAttempts();
            exit;
        endif;
    }

    /**
     * Check if the request is considered spam.
     *
     * @return bool True if the request is spam, false otherwise.
     */
    private function isSpam()
    {

        $clientIp = $_SERVER['REMOTE_ADDR'];

        // Check if a session variable exists indicating recent activity
        if (isset($_SESSION['last_request_time'])) {
            $lastRequestTime = $_SESSION['last_request_time'];
            $currentTime = time();

            // Calculate the time difference
            $timeDifference = $currentTime - $lastRequestTime;

            // If the time difference is within the threshold, increment the request count
            if ($timeDifference <= TIMETHRESHOLD || (isset($_SESSION['blocked_ips']) &&
                key_exists($clientIp, $_SESSION['blocked_ips']))) {
                $_SESSION['request_count'] = isset($_SESSION['request_count']) ? $_SESSION['request_count'] + 1 : 1;

                // If the request count exceeds the threshold, consider it spam
                if ($_SESSION['request_count'] > REQUESTTHRESHOLD) {
                    // Log the attempt or take appropriate action (e.g., block the IP)

                    // Store the blocked IP in the session
                    $_SESSION['blocked_ips'][$clientIp] = $currentTime;


                    // Log the IP address and timestamp in your database or file
                    $meesgae = "Spam attempt from IP: $clientIp at " . date('Y-m-d H:i:s', $currentTime);
                    RecordLoader::locallog($meesgae, 500, 'sd87f6a9');
                    // For demonstration purposes, just returning true here
                    return (object) [
                        "message" => $meesgae
                    ];
                }
            } else {
                // Reset the session variables
                $_SESSION['request_count'] = 1;
                $_SESSION['last_request_time'] = $currentTime;
                if (isset($_SESSION['blocked_ips']) && key_exists($clientIp, $_SESSION['blocked_ips'])) :
                    unset($_SESSION['blocked_ips'][$clientIp]);
                endif;
            }
        } else {
            // Initialize session variables
            $_SESSION['request_count'] = 1;
            $_SESSION['last_request_time'] = time();
            if (isset($_SESSION['blocked_ips']) && key_exists($clientIp, $_SESSION['blocked_ips'])) :
                unset($_SESSION['blocked_ips'][$clientIp]);
            endif;
        }


        return false; // Not spam
    }

    /**
     * Unblock old IP attempts.
     *
     * This method is responsible for unblocking IPs after a certain period.
     */
    private function unblockOldAttempts()
    {
        // Define the time limit for blocking (30 minutes)
        $blockTimeLimit = BLOCKTIMELIMIT; // in seconds

        // Check and unblock IPs that have been blocked for more than the time limit
        if (isset($_SESSION['blocked_ips'])) {
            $currentTime = time();
            foreach ($_SESSION['blocked_ips'] as $ip => $timestamp) {
                if ($currentTime - $timestamp >= $blockTimeLimit) {
                    // Remove the entry from the blocked IPs list
                    unset($_SESSION['blocked_ips'][$ip]);
                }
            }
        }
    }

    /**
     * Set request history.
     *
     * This method is responsible for setting the history of the request.
     */
    private function setHistory()
    {
        // Check if the request is for an image
        $currentUrl = $_SERVER['REQUEST_URI'];
        if (preg_match('/.ico|.png|.jpg|.webp|.svg/i', $currentUrl)) return;

        // Check if a 'history' session array exists
        if (isset($_SESSION['history'])) :
            // If it exists and the current URL is different from the last visited URL,
            // update the session history with the current URL while preserving the previous URL
            if ($_SESSION['history'][0] !== $currentUrl) :
                array_unshift($_SESSION['history'], $currentUrl);
            endif;
        else :
            // If it doesn't exist, initialize it with the current URL
            $_SESSION['history'] = [$currentUrl];
        endif;

        $_SESSION['history'] = array_slice($_SESSION['history'], 0, 10);
    }

    /**
     * Get request data.
     *
     * This method retrieves and returns the request data.
     *
     * @return mixed The request data.
     */
    private function getRequest()
    {
        $inputs = [];
        $request = array_merge($_POST, $_GET);
        foreach ($request as $key => $input) :
            if (gettype($input) === 'string') :
                $input = str_replace('/\s+/', ' ', $input);
                $input = htmlspecialchars_decode($input);
            elseif (gettype($input) != 'array') :
                $input = strip_tags($input);
            endif;

            if (!in_array($key, ["count", "current"]) && !is_numeric($key)) :
                $inputs[$key] = $input;
            endif;

        endforeach;

        return (object) $inputs;
    }

    /**
     * Parse URL and extract request parameters.
     *
     * This method parses the URL and extracts request parameters.
     *
     * @return mixed The parsed request parameters.
     */
    private function parseUrl()
    {
        $parameters = (object) [
            'language' => $_SESSION['lang'] ?? 'en',
            'queries' =>  (object) []
        ];

        // Get the raw REQUEST_URI from $_SERVER
        $rawRequestUri = $_SERVER['REQUEST_URI'];

        // Filter the raw request URI to make sure it contains only allowed characters
        $filteredRequestUri = filter_var($rawRequestUri, FILTER_SANITIZE_URL);
        $this->url = trim($filteredRequestUri, '/');

        // Use parse_url to extract specific components of the URL
        // $parsedUrl = parse_url($filteredRequestUri);

        // Parse the URL and extract query parameters
        $url  = explode('/', $this->url);

        // Extract the first part of the URL for language handling
        if (isset($url[0]) && !empty($url[0]) && strlen($url[0]) === 2) :
            $parameters->language = $url[0];
            if ($_SESSION['lang'] != $url[0]) :
                $_SESSION['lang'] = $url[0];
            endif;
            array_shift($url);
        endif;

        // Extract part of the URL for API handling
        if (
            (isset($url[0]) && $url[0] == 'api') ||
            (isset($url[1]) && $url[1] == 'api')
        ) :
            $parameters->api = true;
            array_shift($url);
        endif;

        foreach ($url as $key => $part) {

            if (strpos($part, '?')) :
                $queries = [];
                $param = explode('?', $part);
                $name = $param[0];

                parse_str(substr($part, strpos($part, '?') + 1), $queries);

                if ($key < 3) :
                    $parameters->queries = (object) $queries;
                else :
                    $parameters->queries->$name = (object) $queries;
                endif;

                $url[$key] = $param[0];
            endif;
        }

        // Set default values for parameters and store query parameters
        $parameters->module = isset($url[0]) ? $url[0] : null;
        $parameters->endpoint = isset($url[1]) ? $url[1] : null;
        $parameters->target = isset($url[2]) ? $url[2] : null;

        for ($pos = 3; $pos < count($url); $pos++) {
            $param = $url[$pos];
            $parameters->$param = true;
        }

        return $parameters;
    }

    /**
     * Request Handler
     *
     * This method handles requests by creating an instance of the specified module's class,
     * checking if the specified function exists within the module class, and calling that function.
     * It also prepares the required parameters for the function call, considering dependencies such as 'request' and 'currentuser'.
     *
     * @param object $module The module configuration object containing 'module' and 'function' properties.
     *
     * @return mixed|false The result of the called function or false if the function does not exist.
     */
    public function handler($module)
    {

        // Create an instance of the module's class
        $class = $module->module;
        $function = $module->function;
        $moduleInstance = new $class();
        $moduleInstance->parameters = $this->parameters;

        // Check if the specified function exists within the module class
        if (method_exists($moduleInstance, $function)) :

            // Call the specified function and store the result in $data
            // Create a reflection class for SomeOtherClass
            $reflection = new ReflectionClass($moduleInstance);

            // Get the update method from SomeOtherClass
            $method = $reflection->getMethod($function);

            // Get information about the method's parameters
            $parameters = $method->getParameters();

            $request = [];

            foreach ($parameters as $parameter) {
                // Prepare 'request' parameter
                if ($parameter->getName() == 'request') :
                    $request[] = new Request();

                // Prepare 'currentuser' parameter
                elseif ($parameter->getName() == 'currentuser') :
                    $user = new User((object)CryptLoader::decrypt(true));
                    $request[] = $user;

                // Add additional conditions for other parameters if needed
                // elseif ($parameter->getName() == 'other_parameter') {
                //     $request[] = ...;
                // }
                endif;
            }

            // Call the function with the prepared parameters
            return $moduleInstance->$function(...$request);

        endif;

        // Return false if the specified function does not exist in the module class
        return false;
    }
}
