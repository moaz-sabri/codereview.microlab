<?php

namespace App\Modules\Users\Tests;

include 'vendor/autoload.php';
include 'app/bootstrap/config.php';

use PHPUnit\Framework\TestCase;

use GuzzleHttp\Client;

class UserTest extends TestCase
{

    private $httpClient;

    public function setUp(): void
    {
        parent::setUp();

        $this->httpClient = new Client([
            'base_uri' => 'http://localhost:80', // Replace with your app's URL
            'proxy' => 'http://localhost:80',
        ]);
    }

    // public function testSuccessfulLogin()
    // {
    //     $response = $this->httpClient->post('/login', [
    //         'form_params' => [
    //             'email' => 'test',
    //             'password' => 'test',
    //         ],
    //     ]);

    //     $this->assertEquals(200, $response->getStatusCode());
    //     $this->assertEquals("<script>window.location.href = '/profile'</script>", $response->getBody()->getContents());
    // }

    // public function testFailedLogin()
    // {
    //     $response = $this->httpClient->post('/login', [
    //         'form_params' => [
    //             'email' => 'invaliduser',
    //             'password' => 'invalidpassword',
    //         ],
    //     ]);

    //     $this->assertEquals(204, $response->getStatusCode());
    // }

    public function testSuccessfulUpdateUser()
    {
        $token = "48421e9dd9c91412c36ac1f5ee4c5d0ce0cba7c989e85e2b4eb14ef244ddaf47c532acede771da831bdc2e7fb40b4b11e56b7ca5b78dfd21e4711fed4511bb2a";

        // Send the POST request with headers and body
        $response = $this->httpClient->post('/user/update_profile/U-ADMIN0000000', [
            'headers' =>[
                'Authorization' => $token, // Example: Bearer token format
                // 'Content-Type' => 'application/json', // Adjust as needed
            ],
            'form_params' => [
                "name" => "test",
                "email" => "fffff@3242.com",
                "firstname" => "testetst",
                "lastname" => "xxxxxxx",
            ], // Send JSON data if needed
        ]);

        $this->assertEquals(200, $response->getStatusCode());
    }

    public function testFailedUpdateUser()
    {
        $token = "48421e9dd9c91412c36ac1f5ee4c5d0ce0cba7c989e85e2b4eb14ef244ddaf47c532acede771da831bdc2e7fb40b4b11e56b7ca5b78dfd21e4711fed4511bb2a";

        // Send the POST request with headers and body
        $response = $this->httpClient->post('/user/update_profile/U-ADMIN00000a0', [
            'headers' =>[
                'Authorization' => $token, // Example: Bearer token format
                // 'Content-Type' => 'application/json', // Adjust as needed
            ],
            'form_params' => [
                "name" => "test",
                "email" => "fffff@3242.com",
                "firstname" => "testetst",
                "lastname" => "xxxxxxx",
            ], // Send JSON data if needed
        ]);

        $this->assertEquals(404, $response->getStatusCode());
    }
}
