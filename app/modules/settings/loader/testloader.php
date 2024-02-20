<?php

namespace App\Modules\Settings\Loader;

use App\Utilities\Utilitie;

class TestLoader extends Utilitie
{

    /**
     * Send an HTTP request using cURL.
     *
     * @param string $url The URL to which the request is sent.
     * @param string $method The HTTP method (GET or POST).
     * @param array $data An associative array of data to include in the request (for POST requests).
     * @return mixed The response from the server, or false on failure.
     */
    static function sendHttpRequest($url, $method = 'GET',  $authorizationToken = null, $data = [])
    {
        // Initialize cURL session
        $ch = curl_init($url);

        // Set cURL options for the request
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, strtoupper($method));
        if ($method === 'POST') {
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        }
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        // Set Authorization header if provided
        if ($authorizationToken !== null) {
            $headers = ["Authorization: $authorizationToken"];
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLINFO_HEADER_OUT, true);
        }

        // Execute cURL session and get the response
        $response = curl_exec($ch);

        // Check for cURL errors
        if (curl_errno($ch)) {
            // Handle the error (you may log or display an error message)
            echo 'Curl error: ' . curl_error($ch);
            $response = false;
        }

        // Close cURL session
        curl_close($ch);

        // Get HTTP status code
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        return (object) [
            "code" => $httpCode,
            "response" => $response
        ];
    }
}
