<?php

namespace App\Bootstrap;

// use App\Extends\Record\RecordLoader;

// Size of memory limit
ini_set('memory_limit', '30M');

// Mode;
// The mode of production or local environment
define('PRODUCTION', filter_var(strncmp(__FILE__, '/home', 5) === 0, FILTER_VALIDATE_BOOLEAN));  // Set to true for production, false for local environment

// The debug mode to preview errors and bug messages
define('DEBUGMODE', true); // Set to true for debugging, false for regular mode

define('DEBUG', false); // Set to true for debug mode, false for production
define('PERMISSION_OFF', false); // Set to true for debug mode, false for production

// The test environment
define('PHPUNIT', false); // Set to true when running tests with PHPUnit, false for regular execution

// The role of the developer
define('MASTER', 'DEV'); // Set the developer role, e.g., 'DEV'


// Directory
// Directory separator
define('DS', DIRECTORY_SEPARATOR);
// Webroot path
define('WEBROOT', realpath(dirname(__FILE__)) . DS . '..');
// Storage path
define('STORAGE', realpath(dirname(__DIR__)) . DS . '..' . DS . 'storage' . DS);
// Root path
define('ROOT', WEBROOT . DS . '..' . DS . 'public' . DS);

// Secret Key
define('SECRET_KEY', '-'); // Replace 'your_secret_key_here' with your actual secret key
// license
define('LICENSE', '-'); // Replace 'your_license_variable_name' with your actual license variable name

// Generate a nonce value for this page load
define('NONCE', base64_encode(random_int(PHP_INT_MIN, PHP_INT_MAX)));

// Generate a key to unittest 
define('UNITTESTKEY', '-'); // Replace 'your_unittest_key_variable_name' with your actual unittest key variable name

// glouble Setting
// Set default timezone to Europe/Vienna
date_default_timezone_set('Europe/Vienna');
// Database Format
define('DB_FORMAT', "Y-m-d"); // Database date and time format, e.g., 'Y-m-d'
// Date Format
define('DATE_FORMAT', "j, M | y"); // Display date format, e.g., 'M, j | Y'
// View Date
define('DATE_VIEW', "G:i - j, M | y"); // Date format for views, e.g., 'H:i - M, d | Y'
// Time Threshold
define('TIMETHRESHOLD', 60); // Time threshold in seconds, e.g., 24 hours
// Request Threshold
define('REQUESTTHRESHOLD', 25); // Maximum allowed requests within a threshold
// Block Time Limit
define('BLOCKTIMELIMIT', 1800); // Block time limit in seconds, e.g., 10 minutes

// Meta
// Author Name
define('AUTHOR_NAME', 'Moaz Sabri');
// Project Name
define('PROJECT_NAME', 'joudev'); // Replace 'Your Project' with the actual project name
// Title Page
define('TITLE_PAGE', 'JouDev'); // Replace 'Your Page Title' with the desired page title
// Description
define('DESCRIPTION', 'DESCRIPTION'); // Replace with a brief project description
// Keywords
define('KEYWORDS', 'KEYWORDS'); // Replace with relevant keywords
// Logo
define('LOGO', '/public/assets/logo/s-main-logo.webp'); // Replace with the actual path to your logo image
// Thumbnail
define('THUMBNAIL', '/public/assets/logo/s-main-logo.webp'); // Replace with the actual path to your thumbnail image
// Contact Email
define('CONTACT_MAIL', '-'); // Replace 'info@example.com' with the actual contact email


// Email Address
define('EMAIL_ADDRESS', '-'); // Replace with the actual email address

// IMAP Host
define('EMAIL_IMAP_HOST', '-'); // Replace with the IMAP host for incoming emails

// SMTP Host
define('EMAIL_SMTP_HOST', '-'); // Replace with the SMTP host for outgoing emails

// Email User
define('EMAIL_USER', '-'); // Replace with the email user/account

// Email Password
define('EMAIL_PASS', '-'); // Replace with the email password

// Email Debugging
define('EMAIL_DEBUG', 0); // Set to true for debugging, false for regular operation

// Email Port
define('EMAIL_PORT', 587); // Replace with the appropriate port for your email configuration [993 | 465]

// Setting
define('PATH_SIGN', '');
define('PATH_USER', '');
define('PATH_ADMIN', '');


// Check if the application is in debug mode
if (DEBUGMODE) {
    // If in debug mode, display errors to aid development

    // Set PHP to display all errors
    ini_set('display_errors', 1);

    // Set PHP to display startup errors
    ini_set('display_startup_errors', 1);

    // Report all errors
    error_reporting(E_ALL);
} else {
    // If not in debug mode, hide errors for a cleaner production environment

    // Disable displaying errors
    ini_set('display_errors', 0);

    // Disable displaying startup errors
    ini_set('display_startup_errors', 0);

    // Disable error reporting
    error_reporting(0);
}

// Database configuration
if (PRODUCTION) :
    // Database Name
    define('DB_NAME', '-'); // Replace 'your_database_name' with the actual database name
    // Database User
    define('DB_USER', '-'); // Replace 'your_database_user' with the actual database user
    // Database Password
    define('DB_PASS', '-'); // Replace 'your_database_password' with the actual database password

    // Source Path of the Project
    define('DOMAIN_SOURCE',     '-'); // Replace '/path/to/your/project' with the actual source path of your project

elseif (PHPUNIT) :
    define('DB_NAME', 'joudev');
    define('DB_USER', 'root');
    define('DB_PASS', 'root');

    // Source Path of the Project
    define('DOMAIN_SOURCE',     "http://localhost:" . getenv('SERVER_PORT'));

else :
    // Database Name
    define('DB_NAME', getenv('MYSQL_DATABASE')); // Replace 'your_database_name' with the actual database name
    // Database User
    define('DB_USER', getenv('MYSQL_USER')); // Replace 'your_database_user' with the actual database user
    // Database Password
    define('DB_PASS', getenv('MYSQL_PASSWORD')); // Replace 'your_database_password' with the actual database password

    // Source Path of the Project
    define('DOMAIN_SOURCE',     "http://localhost:" . getenv('SERVER_PORT')); // Replace '/path/to/your/project' with the actual source path of your project
endif;

// Store the current URL in the session
$_SESSION['previous_page'] = $_SERVER['REQUEST_URI'];

function debug($data)
{
    echo '<pre>';
    print_r($data);
    echo '</pre>';
}


if (DEBUG) debug("Debug Mode is enabled!");
