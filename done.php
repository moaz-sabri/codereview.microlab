<?php

namespace App\Bootstrap;

require_once 'app/bootstrap/config.php';

spl_autoload_register(function ($className) {
    $className = str_replace('App', '', $className);
    $className = str_replace('\\', '/', $className);
    $className = $className . '.php';
    // $className = strtolower($className);

    if (file_exists(WEBROOT . $className)) :
        require_once WEBROOT . $className;
    endif;
});

use App\Modules\Records\Models\RecordModel;

use App\Modules\Permissions\Models\{
    PermissionGroupsModel,
    PermissionModel,
    UserGroupModel
};
use App\Modules\Users\Models\{
    AuthenticationModel,
    PasswordResetModel,
    UserModel
};

use PDO;
use PDOException;

// Include the config and Core files

if ($_SERVER['REQUEST_METHOD'] === 'POST') :

    // Generate a unique filename to prevent overwriting
    $file = $_FILES['projecticon'];

    $fileExt = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
    $filename = uniqid('file_') . '.' . $fileExt;
    $destination = __DIR__ . "/public/static/" . $filename;

    // Move the uploaded file to the destination
    if (move_uploaded_file($file['tmp_name'], $destination)) :
        setEnv(LOGO, $destination);
    endif;

    // Generate a unique filename to prevent overwriting
    $file = $_FILES['projectthumbnail'];

    $fileExt = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
    $filename = uniqid('file_') . '.' . $fileExt;
    $destination = __DIR__ . "/public/static/" . $filename;

    // Move the uploaded file to the destination
    if (move_uploaded_file($file['tmp_name'], $destination)) :
        setEnv(THUMBNAIL, $destination);
    endif;

    setEnv(PROJECT_NAME, $_POST['projectname']);
    setEnv(TITLE_PAGE, $_POST['projecttitle']);
    setEnv(DESCRIPTION, $_POST['projectdesctiption']);

    // create Database
    try {
        $conn = new PDO("mysql:host=mysql", getenv('MYSQL_USER'), getenv('MYSQL_PASSWORD'));
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        die("Connection failed: " . $e->getMessage());
    }

    $database = getenv('MYSQL_DATABASE');

    $sql = "SELECT SCHEMA_NAME FROM information_schema.SCHEMATA WHERE SCHEMA_NAME = :database";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':database', $database, PDO::PARAM_STR);
    $stmt->execute();
    $result = $stmt->fetch();

    if (empty($result)) {
        // The database does not exist; create it.
        $sql = "CREATE DATABASE $database";
        $conn->exec($sql);
        echo "Database created successfully. ";
    } else {
        echo "Database already exists. ";
    }
    $conn->query("USE $database"); // Switch to the new database.

    $run = new RecordModel();
    $status = $run->build();

    if ($status) :
        $run = new UserModel();
        $status = $run->build() ? $run->setDefault() : false;
    endif;

    if ($status) :
        $run = new PermissionGroupsModel();
        $status = $run->build() ? $run->setDefault() : false;
    endif;

    if ($status) :
        $run = new PermissionModel();
        $status = $run->build() ? $run->setDefault() : false;
    endif;

    if ($status) :
        $run = new UserGroupModel();
        $status = $run->build() ? $run->setDefault() : false;
    endif;

    if ($status) :
        $run = new AuthenticationModel();
        $status = $run->build();
    endif;

    if ($status) :
        $run = new PasswordResetModel();
        $status = $run->build();
    endif;

    $conn = null;

    session_unset();

    if ($status && rename('index.php', 'installed.php')) {
        if (rename('_index.php', 'index.php')) {
            // Reload the current page
            sleep(3);
            die("<script>window.location.href = '/'</script>");
        } else {
            echo "File rename failed.";
        }
    } else {
        die("The App is instaed");
    }
endif;
?>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<html dir="ltr" lang="de">
<!-- Bootstrap -->
<link href="/public/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" /><!-- Main LTR -->
<link href="/public/static/css/main.css" rel="stylesheet" />
<style>
    body {
        background-color: #eee;
    }

    .from {
        margin: 25px;
        padding: 20px 30px;
        border-radius: 20px;
        box-shadow: 0 0 5px 0px #33333363;
        background-color: #ffffff;
    }
</style>

<body>
    <div class="container">
        <form method="POST" enctype="multipart/form-data" class="from">
            <h1 class="text-primary">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-gear-wide-connected" viewBox="0 0 16 16">
                    <path d="M7.068.727c.243-.97 1.62-.97 1.864 0l.071.286a.96.96 0 0 0 1.622.434l.205-.211c.695-.719 1.888-.03 1.613.931l-.08.284a.96.96 0 0 0 1.187 1.187l.283-.081c.96-.275 1.65.918.931 1.613l-.211.205a.96.96 0 0 0 .434 1.622l.286.071c.97.243.97 1.62 0 1.864l-.286.071a.96.96 0 0 0-.434 1.622l.211.205c.719.695.03 1.888-.931 1.613l-.284-.08a.96.96 0 0 0-1.187 1.187l.081.283c.275.96-.918 1.65-1.613.931l-.205-.211a.96.96 0 0 0-1.622.434l-.071.286c-.243.97-1.62.97-1.864 0l-.071-.286a.96.96 0 0 0-1.622-.434l-.205.211c-.695.719-1.888.03-1.613-.931l.08-.284a.96.96 0 0 0-1.186-1.187l-.284.081c-.96.275-1.65-.918-.931-1.613l.211-.205a.96.96 0 0 0-.434-1.622l-.286-.071c-.97-.243-.97-1.62 0-1.864l.286-.071a.96.96 0 0 0 .434-1.622l-.211-.205c-.719-.695-.03-1.888.931-1.613l.284.08a.96.96 0 0 0 1.187-1.186l-.081-.284c-.275-.96.918-1.65 1.613-.931l.205.211a.96.96 0 0 0 1.622-.434l.071-.286zM12.973 8.5H8.25l-2.834 3.779A4.998 4.998 0 0 0 12.973 8.5zm0-1a4.998 4.998 0 0 0-7.557-3.779l2.834 3.78h4.723zM5.048 3.967c-.03.021-.058.043-.087.065l.087-.065zm-.431.355A4.984 4.984 0 0 0 3.002 8c0 1.455.622 2.765 1.615 3.678L7.375 8 4.617 4.322zm.344 7.646.087.065-.087-.065z" />
                </svg>
                Configuration
            </h1>
            <hr />
            <div class="card p-3 mb-3">
                <h2 class="text-center display-6 text-secondary">
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-sliders" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M11.5 2a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM9.05 3a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0V3h9.05zM4.5 7a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM2.05 8a2.5 2.5 0 0 1 4.9 0H16v1H6.95a2.5 2.5 0 0 1-4.9 0H0V8h2.05zm9.45 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm-2.45 1a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0v-1h9.05z" />
                    </svg>
                    Project Setting
                </h2>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="projectname" placeholder="Project Name..." name="projectname" required />
                    <label for="projectname">Project Name</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="projecttitle" placeholder="Default Title" name="projecttitle" required />
                    <label for="projecttitle">Project Title</label>
                </div>
                <div>
                    <label class="d-block" for="projecticon">Project Icon (Logo)</label>
                    <div class="input-group mb-3">
                        <input type="file" class="form-control" id="projecticon" name="projecticon" aria-describedby="inputGroupFileAddon04" aria-label="Upload" />
                    </div>
                </div>
                <div>
                    <label for="projectthumbnail">Project Thumbnail</label>
                    <div class="input-group mb-3">
                        <input type="file" class="form-control" id="projectthumbnail" name="projectthumbnail" aria-describedby="inputGroupFileAddon04" aria-label="Upload" />
                    </div>
                </div>
                <div class="form-floating mb-3">
                    <textarea class="form-control" placeholder="Desctiption" name="projectdesctiption" id="floatingTextarea2" style="height: 100px"></textarea>
                    <label for="projectdesctiption">Comments</label>
                </div>
            </div>
            <div class="card p-3 mb-3">
                <h2 class="text-center display-6 text-secondary">
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-database-gear" viewBox="0 0 16 16">
                        <path d="M12.096 6.223A4.92 4.92 0 0 0 13 5.698V7c0 .289-.213.654-.753 1.007a4.493 4.493 0 0 1 1.753.25V4c0-1.007-.875-1.755-1.904-2.223C11.022 1.289 9.573 1 8 1s-3.022.289-4.096.777C2.875 2.245 2 2.993 2 4v9c0 1.007.875 1.755 1.904 2.223C4.978 15.71 6.427 16 8 16c.536 0 1.058-.034 1.555-.097a4.525 4.525 0 0 1-.813-.927C8.5 14.992 8.252 15 8 15c-1.464 0-2.766-.27-3.682-.687C3.356 13.875 3 13.373 3 13v-1.302c.271.202.58.378.904.525C4.978 12.71 6.427 13 8 13h.027a4.552 4.552 0 0 1 0-1H8c-1.464 0-2.766-.27-3.682-.687C3.356 10.875 3 10.373 3 10V8.698c.271.202.58.378.904.525C4.978 9.71 6.427 10 8 10c.262 0 .52-.008.774-.024a4.525 4.525 0 0 1 1.102-1.132C9.298 8.944 8.666 9 8 9c-1.464 0-2.766-.27-3.682-.687C3.356 7.875 3 7.373 3 7V5.698c.271.202.58.378.904.525C4.978 6.711 6.427 7 8 7s3.022-.289 4.096-.777ZM3 4c0-.374.356-.875 1.318-1.313C5.234 2.271 6.536 2 8 2s2.766.27 3.682.687C12.644 3.125 13 3.627 13 4c0 .374-.356.875-1.318 1.313C10.766 5.729 9.464 6 8 6s-2.766-.27-3.682-.687C3.356 4.875 3 4.373 3 4Z" />
                        <path d="M11.886 9.46c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0Z" />
                    </svg>
                    Database Info
                </h2>
                <p>
                    <strong>DB Name: </strong><?= getenv('MYSQL_DATABASE') ?>
                </p>
                <p>
                    <strong>DB User: </strong><?= getenv('MYSQL_USER') ?>
                </p>
                <p>
                    <strong>DB Pass: </strong><?= getenv('MYSQL_PASSWORD') ?>
                </p>
                <p>
                    <a href="http://localhost:<?= getenv('MYSQL_PORT') ?>/index.php?route=/database/structure&db=<?= getenv('MYSQL_DATABASE') ?>" class="btn btn-sm btn-secondary" aria-label="Read more" target="_blank">DB Viewer</a>
                </p>
            </div>
            <div class="card p-3 mb-3">
                <h2 class="text-center display-6 text-secondary">
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-gear" viewBox="0 0 16 16">
                        <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm.256 7a4.474 4.474 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10c.26 0 .507.009.74.025.226-.341.496-.65.804-.918C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4s1 1 1 1h5.256Zm3.63-4.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z" />
                    </svg>
                    Login Info
                </h2>
                <p><strong>Username: </strong>test</p>
                <p><strong>Password: </strong>test</p>
            </div>

            <div class="text-end">
                <button type="summit" class="btn btn-primary">Install</button>
            </div>
        </form>
    </div>
    <script src="/public/static/vender/popper.min.js"></script>
    <script src="/public/static/vendor/bootsrtap/js/bootstrap.bundle.min.js"></script>
    <script src="/public/static/js/app.js"></script>
</body>

</html>

</html>