<?php
// URL to send the POST request to
$url = 'http://localhost:8090/cron-jobs';
// $url = 'https://codereview.joudev.com/cron-jobs';

// Data to be sent in the POST request
$data = array(
    'key1' => 'value1',
    'key2' => 'value2'
);

// Initialize cURL session
$curl = curl_init($url);

// Set the POST data
curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));

// Set other options as needed (e.g., headers, authentication)
// curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type: application/x-www-form-urlencoded'));

// Set option to receive the response as a string
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

// Execute the POST request
$response = curl_exec($curl);

// Close cURL session
curl_close($curl);

// Handle response
if ($response === false) {
    // Handle error
    echo 'cURL error: ' . curl_error($curl);
} else {
    // Process the response
    echo 'Response: ' . $response;
}
