<?php

namespace App\Bootstrap;

use App\Utilities\Informations;
use App\Utilities\Utilitie;
use Throwable;

/**
 * Main Class
 *
 * This class represents the main structure of the application.
 */
class Output
{

    public $head;
    public $output;
    public $endbody;

    /**
     * @var Informations $informations
     * An instance of the Informations class to get client-related information.
     */
    use Informations;

    /**
     * Handle Styles
     *
     * This static method processes styles based on the provided data, device, and theme.
     *
     * @param object  $data   The data object.
     * @param string $device The device information.
     * @param string $theme  The theme being used.
     *
     * @return string
     */
    private static function styles(object $data, string $device, string $theme): string
    {
        $styles = [];

        if ($data->label->get('ltr', 'ltr') !== 'ltr') :
        // RTL
        else :
        // LTR
        endif;

        $styles[] = '/public/static/vendor/bootstrap/css/bootstrap.min.css';
        $styles[] = '/public/static/vendor/bootstrap-icons/bootstrap-icons.css';
        $styles[] = '/public/static/css/configs/variables.css';

        $styles[] = '/public/static/css/configs/primary.css';
        $styles[] = "/public/static/css/configs/secondary.css";

        $styles[] = '/public/static/css/main.css';
        $styles[] = '/public/static/css/custom/offer.css';

        if ($theme === 'cpanel') :
            $styles[] = "/public/static/css/custom/cpanel.css";
        elseif ($theme === 'default') :
            $styles[] = "/public/static/vendor/aos/aos.css";
            $styles[] = "/public/static/vendor/swiper/swiper-bundle.min.css";
        endif;

        if ($device === 'mobile' || $device === 'tablet') :
            $styles[] = "/public/pwa/phone-style.css";
        endif;

        $styles[] = [
            "href" => "/public/static/css/responsive/small-screen.css",
            "media" => "(max-width: 600px)",
            "rel" => "stylesheet"
        ];
        $styles[] = [
            "href" => "/public/static/css/responsive/medium-screen.css",
            "media" => "(min-width: 601px) and (max-width: 1024px)",
            "rel" => "stylesheet"
        ];
        $styles[] = [
            "href" => "/public/static/css/responsive/large-screen.css",
            "media" => "(min-width: 1025px) and (max-width: 1440px)",
            "rel" => "stylesheet"
        ];
        $styles[] = [
            "href" => "/public/static/css/responsive/extra-large-screen.css",
            "media" => "(min-width: 1441px)",
            "rel" => "stylesheet"
        ];

        $styles = array_merge($styles, $data->styles ?? []);

        $loaded = "";
        foreach ($styles as $key => $style) :
            if (is_array($style)) :
                $loaded .= "<link nonce='" . NONCE . "'";
                foreach ($style as $att => $value) :
                    $loaded .= " $att='{$value}' ";
                endforeach;
                $loaded .= ">";
            else :
                $loaded .= "<link nonce='" . NONCE . "' href='{$style}' rel='stylesheet'>";
            endif;
        endforeach;

        return $loaded;
    }

    /**
     * Handle Scripts
     *
     * This static method processes scripts based on the provided data, device, and theme.
     *
     * @param object  $data   The data object.
     * @param string $device The device information.
     * @param string $theme  The theme being used.
     *
     * @return string
     */
    private static function scripts(object $data, string $device, string $theme): string
    {
        $scripts = self::styles($data, $device, $theme);

        $data->tscripts[] = "/public/static/vendor/lazysizes.min.js";

        if (isset($data->tscripts)) :
            foreach ($data->tscripts as $key => $script) :
                $scripts .= "<script nonce='" . NONCE . "' src='{$script}'></script>";
            endforeach;
        endif;

        return $scripts;
    }

    /**
     * Handle End of Body Content
     *
     * This static method processes content to be placed at the end of the HTML body
     * based on the provided data, device, and theme.
     *
     * @param object  $data   The data object.
     * @param string $device The device information.
     * @param string $theme  The theme being used.
     *
     * @return string
     */
    private static function endbody(object $data, string $device, string $theme): string
    {


        // <!-- Vendor JS Files -->
        $data->bscripts[] = "/public/static/vendor/popper.min.js";
        $data->bscripts[] = "/public/static/vendor/bootstrap/js/bootstrap.bundle.min.js";

        // <!-- Template Main JS File -->
        $data->bscripts[] = "/public/static/vendor/api/validate.js";

        $data->bscripts[] = "/public/static/js/api/requests.js";
        $data->bscripts[] = "/public/static/js/app.js";
        $data->bscripts[] = "/public/static/js/main.js";

        if ($theme === 'cpanel') :
            $data->bscripts[] = "/public/static/js/custom/cpanel.js";
        elseif ($theme === 'default') :
            $data->bscripts[] = "/public/static/vendor/aos/aos.js";
            $data->bscripts[] = "/public/static/vendor/isotope-layout/isotope.pkgd.min.js";
            $data->bscripts[] = "/public/static/vendor/swiper/swiper-bundle.min.js";
            $data->bscripts[] = "/public/static/js/custom/offer.js";
            $data->bscripts[] = "/public/static/js/custom/default.js";
        endif;

        $scripts = "";

        foreach ($data->bscripts as $key => $script) :

            if (is_array($script)) :
                $scripts .= "<script nonce='" . NONCE . "'";
                foreach ($script as $att => $value) :
                    $scripts .= " $att='{$value}' ";
                endforeach;
                $scripts .= "></script>";
            else :
                $scripts .= "<script nonce='" . NONCE . "' src='{$script}'></script>";
            endif;

        endforeach;

        return $scripts;
    }

    /**
     * Handle Progressive Web App (PWA) Features
     *
     * This static method processes Progressive Web App features based on the provided data, device, and theme.
     *
     * @param mixed  $data   The data object.
     * @param string $device The device information.
     * @param string $theme  The theme being used.
     *
     * @return string
     */
    private static function pwa(object $data, string $device, string $theme): string
    {
        $scripts = self::scripts($data, $device, $theme);
        $scripts .= "<!-- PWA --><link nonce='" . NONCE . "' href='/public/pwa/site.webmanifest' rel='manifest'><script type='text/javascript' nonce='" . NONCE . "' src='/public/pwa/config.js'></script><script type='text/javascript' nonce='" . NONCE . "' src='/public/pwa/app.js'></script><script type='text/javascript' nonce='" . NONCE . "' src='/public/pwa/init.js'></script>";

        return $scripts;
    }

    /**
     * Render View
     *
     * This method renders a view page based on the provided data, directory, and theme.
     *
     * @param object $data      The data object.
     * @param string $directory The directory path for the view.
     * @param string $theme     The theme being used.
     *
     * @return void
     */
    protected function renderView(object $data, string $diractory, string $theme)
    {

        try {
            $device = $this->detectDevice();

            // Generate the HTML head section with the merged meta tags
            $this->head = $this->pwa($data, $device, $theme);
            $tmp = WEBROOT . "/templates/themes/{$theme}/";
            $popup = WEBROOT . "/templates/popups/";

            define("PAGINATION", WEBROOT . '/templates/components/pagination.inc');
            define("DROPACTIONS", WEBROOT . '/templates/components/dropactions.inc');

            ob_start(); // Start output buffering
            if ($theme != false) :
                if (($device === 'mobile' || $device === 'tablet')  && file_exists("{$tmp}mobile/top.inc")) :
                    require("{$tmp}mobile/top.inc");
                else :
                    require("{$tmp}top.inc");
                endif;
            endif;

            if (!($device === 'mobile' || $device === 'tablet')) :
                require("{$popup}settings.inc");
            endif;

            require_once($diractory);

            require("{$popup}alert.inc");
            require("{$popup}policy.inc");

            if ($theme != false) :
                if (($device === 'mobile' || $device === 'tablet') && file_exists("{$tmp}mobile/bottom.inc")) :
                    require("{$tmp}mobile/bottom.inc");
                else :
                    require("{$tmp}bottom.inc");
                endif;
            endif;

            $this->endbody = $this->endbody($data, $device, $theme);

            $content = ob_get_clean(); // Get the content and clear the output buffer
            // ob_end_flush();
            $this->output = $content;
        } catch (Throwable $e) {
            Utilitie::bad('500', $e);
        }
    }
}
