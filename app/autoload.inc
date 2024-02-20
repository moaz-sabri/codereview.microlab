<?php

namespace App;

session_start();

$start_time = microtime(true);

// Include the config and Core files
require_once dirname(__FILE__) . '/bootstrap/config.php';

// Set CSP header with nonce and image source directives
header("Content-Security-Policy: default-src 'self' data:; script-src 'self' 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline'; img-src 'self' data:;");

use App\Bootstrap\Core;
use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Traffic\Loader\TrafficLoader;
use App\Utilities\Utilitie;

// Create a new instance of the Core class to handle requests
$core = new Core();

// Set a cookie using the Set-Cookie header
setcookie('token', CryptLoader::decrypt('token'), time() + 1382400, '/');  // Expires in 16 Days
setcookie('source', DOMAIN_SOURCE, time() + 1382400, '/');  // Expires in 16 Days

// Define default values for meta tags and page details
$defaultMetaTags = [
    'description'       => DESCRIPTION,
    'keywords'          => KEYWORDS,
    'author_name'       => AUTHOR_NAME,
    'title_page'        => TITLE_PAGE,
    'domain_source'     => DOMAIN_SOURCE,
    'logo'              => LOGO,
    'thumbnail'         => THUMBNAIL,
    'project_name'      => PROJECT_NAME,
];

// Merge user-provided meta tags with default values
$metaTags  = (object) array_merge(
    $defaultMetaTags,
    array_intersect_key($data->meta ?? [], $defaultMetaTags)
);

?>
<!DOCTYPE html>
<html dir='<?= $core->dir ?>' lang='<?= $core->language ?>'>

<head>
    <!-- Base -->
    <meta charset='UTF-8'>
    <!-- <meta http-equiv='X-UA-Compatible' content='ie=edge'> -->
    <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <link rel='canonical' href='<?= DOMAIN_SOURCE ?>'>
    <meta name='robots' content='index, home'>
    <base href='<?= DOMAIN_SOURCE ?>'>
    <link rel="canonical" href="<?= DOMAIN_SOURCE ?>" />


    <!-- Main -->
    <meta name='description' content='<?= $metaTags->description ?>'>
    <meta name='keywords' content='<?= $metaTags->keywords ?>'>
    <meta name=' author' content='<?= $metaTags->author_name ?>'>
    <meta name='msapplication-TileImage' content='<?= $metaTags->thumbnail ?>'>

    <!-- Twitter -->
    <meta name='twitter:description' content='<?= $metaTags->description ?>'>
    <meta name='twitter:image' content='<?= $metaTags->thumbnail ?>'>
    <meta name='twitter:title' content='<?= $metaTags->title_page ?>'>
    <meta name='twitter:card' content='<?= $metaTags->description ?>'>

    <!-- OG -->
    <meta property='og:title' content='<?= $metaTags->title_page ?>'>
    <meta property='og:description' content='<?= $metaTags->description ?>'>
    <meta property='og:site_name' content='<?= $metaTags->project_name ?>'>
    <meta property='og:type' content='<?= $metaTags->domain_source ?>'>
    <meta property='og:image' content='<?= $metaTags->thumbnail ?>'>
    <meta property='og:image:type' content='image/jpeg'>
    <meta property='og:image:width' content='300'>
    <meta property='og:image:height' content='300'>
    <meta property='og:url' content='<?= $metaTags->domain_source ?>'>

    <!-- Other Optional Meta Tags -->
    <meta name='application-name' content='<?= $metaTags->project_name ?>'>
    <title><?= $metaTags->title_page ?></title>

    <link rel='apple-touch-icon' sizes='180x180' href='/public/assets/favicon/apple-touch-icon.png'>
    <link rel='icon' type='image/png' sizes='32x32' href='/public/assets/favicon/favicon-32x32.png'>
    <link rel='icon' type='image/png' sizes='16x16' href='/public/assets/favicon/favicon-16x16.png'>
    <link rel='mask-icon' href='/public/assets/favicon/safari-pinned-tab.svg' color='#5bbad5'>
    <meta name='msapplication-TileColor' content='#2b5797'>
    <meta name='theme-color' content='#ffffff'>
    <meta name='theme-color' content='#000000'>
    <meta name='apple-mobile-web-app-capable' content='yes'>
    <meta name='apple-mobile-web-app-status-bar-style' content='black'>
    <link rel='alternate' type='application/rss+xml' title='RSS Feed' href='URL to your RSS feed'>

    <!-- Thumbnail -->
    <link rel='shortcut icon' href='/public/assets/placeholder.webp'>
    <meta name='msapplication-TileImage' content='/public/assets/placeholder.webp'>

    <?= $core->head; ?>

</head>

<body>
    <div id="app">
        <?= $core->output ?>
    </div>

    <?= $core->endbody; ?>
</body>

</html>

<?php

if (PRODUCTION) (new TrafficLoader)->set($start_time);
session_write_close();
