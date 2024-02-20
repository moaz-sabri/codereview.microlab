<?php

namespace App\Utilities;

trait Response
{
    #region [Filter friendly links]
    public static function debug($data, $con = false)
    {
        // if (DEBUGMODE) :
            echo '<pre>';
            print_r($data);
            echo '</pre>';

            if (!$con) exit;
        // endif;
    }


    public static function response(int $code = 404, string $message = ''): object
    {
        http_response_code($code);

        return (object) [
            "status" => $code,
            "message" => $message
        ];
    }
    /**
     * Redirects the user to an error page with a specified HTTP response code and message.
     *
     * @param int    $code     The HTTP response code (e.g., 404, 403).
     * @param string $textCode The text representation of the HTTP response code.
     * @param string $message  The error message to display (default is null).
     *
     * @return void
     */
    public static function bad(int $code, string $textCode, string $message = null): void
    {

        if (empty($message)) :
            switch ($code) {
                case 400:
                    $file = '/public/errors/bad-request.html';
                    break;

                case 401:
                    $file = '/public/errors/unauthorized.html';
                    break;

                case 403:
                    $file = '/public/errors/forbidden.html';
                    break;

                case 500:
                    $file = '/public/errors/internal-server-error.html';
                    break;

                case 503:
                    $file = '/public/errors/service-unavailable.html';
                    break;

                default:
                    $file = '/not-found';
                    // $file = '/public/errors/not-found.html';
                    break;
            }

        endif;

        http_response_code($code);
        // Send headers for redirection
        if (headers_sent()) {
            // Headers have already been sent, use JavaScript for redirection
            echo '<script type="text/javascript">window.location.href="' . $file . '";</script>';
        } else {
            // header("HTTP/1.1 200 OK");
            header("Content-Type: text/html");
            header("Location: " . $file);
        }
        exit;
    }

    /**
     * Redirects the user back to the previous page with a warning message and HTTP 200 response.
     *
     * @param string $message The warning message to display (default is "Some Warning!").
     * @param string $color   The color associated with the warning message (default is "danger|success").
     *
     * @return void
     */
    public static function back(int $code, string $message = "Message.", string $color = "danger", string $url = ''): void
    {

        http_response_code($code);

        $_SESSION['ALERT'] = $message;
        $_SESSION['ALERT_COLOR'] = $color;

        if (empty($url)) :
            $url = "javascript:history.go(-1)";
            if (isset($_SERVER['HTTP_REFERER'])) :
                $url = $_SERVER['HTTP_REFERER'];
            endif;
        endif;

        // Send headers for redirection
        if (headers_sent()) {
            // Headers have already been sent, use JavaScript for redirection
            echo '<script type="text/javascript">window.location.href="' . $url . '";</script>';
        } else {
            // header("HTTP/1.1 200 OK");
            header("Content-Type: text/html");
            header("Location: $url");
        }
        exit;
    }

    /**
     * Redirects the user to a URL with a success message and HTTP 200 response.
     *
     * @param string $url     The URL to redirect to.
     * @param string $message The success message to display (default is "Successfully!").
     * @param string $color   The color associated with the success message (default is "success").
     *
     * @return void
     */
    public static function ok(string $url = '', string  $message = "Success!", string  $color = "success"): void
    {
        http_response_code(200);
        $_SESSION['ALERT'] = $message;
        $_SESSION['ALERT_COLOR'] = $color;

        if (empty($url)) :
            $url = "javascript:history.go(-1)";

            if (isset($_SERVER['HTTP_REFERER'])) :
                $url = $_SERVER['HTTP_REFERER'];
            endif;
        endif;

        // Send headers for redirection
        if (headers_sent()) {
            // Headers have already been sent, use JavaScript for redirection
            echo '<script type="text/javascript">window.location.href="' . $url . '";</script>';
        } else {
            header("HTTP/1.1 200 OK");
            header("Content-Type: text/html");
            header("Location: $url");
        }
        exit;
    }


    public static function notAllowd(): void
    {

        $_SESSION['ALERT'] = "sorry you don't have permission to access";
        $_SESSION['ALERT_COLOR'] = "warning";

        http_response_code(403);

        $url = "javascript:history.go(-1)";

        if (isset($_SERVER['HTTP_REFERER'])) :
            $url = $_SERVER['HTTP_REFERER'];
        endif;

        if (headers_sent()) {
            // Headers have already been sent, use JavaScript for redirection
            echo '<script type="text/javascript">window.location.href="' . $url . '";</script>';
        } else {
            // Send headers for redirection
            header("Location: $url");
        }
        exit;
    }
    #endregion
}
