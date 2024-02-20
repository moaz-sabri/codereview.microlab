<article id="set-configurations">
    <h2>Set Configurations</h2>

    <h3>Step 1: Update 'config.php' in 'app/bootstrap'</h3>
    <p>Set the following configurations in the 'config.php' file:</p>

    <pre>
                            <code>
// Modes
define('PRODUCTION', false); // env mode
define('DEBUGMODE', true); // debug mode
define('PHPUNIT', false); // test mode
define('MASTER', 'DEV'); // admin rule 

// storage location to save users files
define('STORAGE', realpath(dirname(__DIR__)) . DS . '..' . DS . 'storage' . DS); 
// public location 
define('ROOT', WEBROOT . DS . '..' . DS . 'public' . DS);

// if use docker you can use this way but if use Apache then must set the manual data
define('DB_NAME', getenv('MYSQL_DATABASE')); 
define('DB_USER', getenv('MYSQL_USER'));
define('DB_PASS', getenv('MYSQL_PASSWORD'));

// this the path of project
define('DOMAIN_SOURCE',     "http://localhost:" . getenv('SERVER_PORT') . "/");
                            </code>
                        </pre>

    <h3>Step 2: Update 'docker-compose.yml' for Docker Configuration</h3>
    <p>In the 'docker-compose.yml' file, set the MySQL connection details:</p>

    <pre>
                            <code>
# PHP connects to MySQL using these environment variables
MYSQL_HOST: mysql
MYSQL_USER: name
MYSQL_PASSWORD: pass
MYSQL_DATABASE: name
MYSQL_PORT: DB POST
SERVER_PORT: SERVER PORT # Set the port number you want to access
                            </code>
                        </pre>

    <h3>Step 3: Update 'sw.js' for PWA Service</h3>
    <p>In the 'public/sw.js' file, add the main file URLs to cache:</p>

    <pre>
                            <code>
return cache.addAll([
    // add the main files URLs
]);
                            </code>
                        </pre>

    <h3>Step 4: Update 'site.webmanifest' for PWA Service</h3>
    <p>In the 'public/pwa/site.webmanifest' file, update the data:</p>

    <pre>
                            <code>
// Update data in site.webmanifest
                            </code>
                        </pre>

</article>