<?php

namespace App\Bootstrap;

use App\Utilities\Informations;
use App\Bootstrap\Loader\AutoLoader;

class Output
{
    use Informations;

    public $resource;

    private $currentURL;
    private $label;
    private $data;
    private $loader;
    private $device;

    public function __construct()
    {
        $this->currentURL = urlencode($_SERVER['REQUEST_URI']);
        $this->loader = new AutoLoader();
        if (DEBUG) debug("AutoLoader");
    }

    public function view($obj)
    {

        if (!isset($obj->theme)) $obj->theme = 'default';

        // Autoload components
        $this->loader->autoloadComponents($obj);

        $this->device = $this->detectDevice();

        $viewFile = $this->resource . $obj->view . '.blade.php';

        if (file_exists($viewFile)) {

            // Extract the data to variables
            $this->data = (object) $obj->data;

            // Start output buffering
            ob_start();

            // Generate HTML
            $this->generateHtmlHead($obj);
            $this->generateHtmlBody($viewFile, $obj);

            // Get the content of the buffer and clean it
            $content = ob_get_clean();

            if (DEBUG) debug("loaded file {$viewFile}");


            // Return the rendered content
            return new Response($content);
        } else {
            return "View '$obj->view' not found";
        }
    }


    private function generateHtmlHead($obj)
    {
        $defaultMetaTags = [
            'description'   => DESCRIPTION,
            'keywords'      => KEYWORDS,
            'author_name'   => AUTHOR_NAME,
            'title'         => TITLE_PAGE,
            'domain_source' => DOMAIN_SOURCE,
            'logo'          => LOGO,
            'thumbnail'     => THUMBNAIL,
            'project_name'  => PROJECT_NAME,
        ];

        $metaTags = (object) array_merge(
            $defaultMetaTags,
            array_intersect_key($obj->meta ?? [], $defaultMetaTags)
        );

?>
        <!DOCTYPE html>
        <html dir='ltr' lang='de'>
        <html>

        <head>
            <title><?= $metaTags->title ?></title>
            <?= $this->loader->meta($obj, $this->device, $metaTags); ?>
            <?= $this->loader->pwa(); ?>
            <?= $this->loader->styles($obj, $this->device); ?>
            <?= $this->loader->scripts($obj, $this->device); ?>
        </head>
    <?php
        if (DEBUG) debug("loaded generateHtmlHead");
    }

    private function generateHtmlBody($viewFile, $obj)
    {
    ?>

        <body>
            <div id="app">
                <?php
                if (DEBUG) :
                    debug("loaded generateHtmlBody");
                else :
                    if ($obj->theme != false) :
                        $topFile = ($this->device === 'mobile' || $this->device === 'tablet') ? USETHEME . "mobile/top.inc" : USETHEME . "top.inc";
                        require_once($topFile);
                    endif;

                    if (!($this->device === 'mobile' || $this->device === 'tablet')) :
                    // Moblie, Tablet mode;
                    endif;

                    include_once $viewFile;
                    require_once(COMPONENTS . "notification.inc");

                    if ($obj->theme != false) :
                        $bottomFile = ($this->device === 'mobile' || $this->device === 'tablet') ? USETHEME . "mobile/bottom.inc" : USETHEME . "bottom.inc";
                        require_once($bottomFile);
                    endif;

                    if (!isset($_COOKIE['policyAllowed'])) :
                        echo '<policy-alert></policy-alert>';
                    endif;

                endif;
                ?>
            </div>

            <?= $this->loader->endbody($obj, $this->device); ?>
        </body>

        </html>
<?php

    }
}
