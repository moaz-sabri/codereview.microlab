<?php

namespace App\Utilities;

trait Filters
{

    // TODO: ReCode
    public static function STR_ENDS_WITH(string $haystack, string $needle)
    {
        $needle_len = strlen($needle);
        return ($needle_len === 0 || 0 === substr_compare($haystack, $needle, -$needle_len));
    }

    public static function STR_STARTS_WITH(string $haystack, string $needle)
    {
        // return (string)$needle !== '' && strncmp($haystack, $needle, strlen($needle)) === 0;
        return strncmp($haystack, $needle, 4) === 0;
    }


    #region [fFilter Int]
    public static function FILTER_INT(int $input)
    {

        // return intval(filter_var($input, FILTER_SANITIZE_NUMBER_INT));
        return intval(filter_var($input, FILTER_VALIDATE_INT, FILTER_NULL_ON_FAILURE));
    }
    #endregion

    #region [Filter Flaot]
    public static function FILTER_FLAOT(float $input)
    {
        $input = filter_var($input, FILTER_SANITIZE_NUMBER_FLOAT);

        return !filter_var($input, FILTER_VALIDATE_FLOAT, FILTER_NULL_ON_FAILURE) ? $input : false;
    }
    #endregion

    #region [Filter String]
    public static function FILTER_STRING(string $input)
    {
        return htmlspecialchars($input, ENT_QUOTES, 'UTF-8');
    }
    #endregion

    #region [Filter Email]
    public static function FILTER_EMAIL(string $email)
    {
        // Remove all illegal characters from email
        $email = filter_var($email, FILTER_SANITIZE_EMAIL);

        // Validate e-mail
        return filter_var($email, FILTER_VALIDATE_EMAIL, FILTER_NULL_ON_FAILURE) ? $email : false;
    }
    #endregion

    #region [Filter String]
    public static function FILTER_FILE_SIZE(string $file, int $max)
    {
        $str = htmlentities($file, ENT_QUOTES, 'UTF-8');

        return strlen($str) > $max ? substr($str, 0, $max) : $str;
    }
    #endregion

    #region [Filter Url]
    public static function FILTER_URL(string $url)
    {
        // Remove all illegal characters from url
        $sanitizedUrl = filter_var($url, FILTER_SANITIZE_URL);
        $url = !filter_var($sanitizedUrl, FILTER_VALIDATE_URL, FILTER_NULL_ON_FAILURE) ? $sanitizedUrl : false;

        return $url;
    }
    #endregion

    #region [Filter String]
    public static function CONVERT_EN_LETTERS(string $input)
    {

        $unwanted_array = [
            'Š' => 'S', 'š' => 's', 'Ž' => 'Z', 'ž' => 'z', 'À' => 'A', 'Á' => 'A', 'Â' => 'A', 'Ã' => 'A', 'Ä' => 'AE', 'Å' => 'A', 'Æ' => 'A', 'Ç' => 'C', 'È' => 'E', 'É' => 'E',
            'Ê' => 'E', 'Ë' => 'E', 'Ì' => 'I', 'Í' => 'I', 'Î' => 'I', 'Ï' => 'I', 'Ñ' => 'N', 'Ò' => 'O', 'Ó' => 'O', 'Ô' => 'O', 'Õ' => 'O', 'Ö' => 'OE', 'Ø' => 'O', 'Ù' => 'U',
            'Ú' => 'U', 'Û' => 'U', 'Ü' => 'UE', 'Ý' => 'Y', 'Þ' => 'B', 'ß' => 'Ss', 'à' => 'a', 'á' => 'a', 'â' => 'a', 'ã' => 'a', 'äe' => 'a', 'å' => 'a', 'æ' => 'a', 'ç' => 'c',
            'è' => 'e', 'é' => 'e', 'ê' => 'e', 'ë' => 'e', 'ì' => 'i', 'í' => 'i', 'î' => 'i', 'ï' => 'i', 'ð' => 'o', 'ñ' => 'n', 'ò' => 'o', 'ó' => 'o', 'ô' => 'o', 'õ' => 'o',
            'ö' => 'oe', 'ø' => 'o', 'ù' => 'u', 'ü' => 'ue', 'ú' => 'u', 'û' => 'u', 'ý' => 'y', 'þ' => 'b', 'ÿ' => 'y'
        ];

        return strip_tags(strtr($input, $unwanted_array));
    }
    #endregion


    #region [Filter String]
    public static function CONVERT_TO_LOWER_CASE(string $input)
    {

        $unwanted_array = [
            'A' => 'a', 'B' => 'b', 'C' => 'c', 'D' => 'd', 'E' => 'e', 'F' => 'f', 'G' => 'g', 'H' => 'h', 'I' => 'i',
            'J' => 'j', 'K' => 'k', 'L' => 'l', 'M' => 'm', 'N' => 'n', 'O' => 'o', 'P' => 'P', 'Q' => 'q', 'R' => 'r', 'S' => 's',
            'T' => 't', 'U' => 'u', 'V' => 'v', 'W' => 'w', 'X' => 'x', 'Y' => 'y', 'Z' => 'z', 'Ö' => 'ö', 'Ü' => 'ü', 'Ä' => 'ä'
        ];

        return strip_tags(strtr($input, $unwanted_array));
    }
    #endregion


    #region [Filter String]
    public static function CONVERT_LETTERS(string $input)
    {

        $utf8_ansi2 = [
            "\u00c0" => "À", "\u00c1" => "Á", "\u00c2" => "Â", "\u00c3" => "Ã", "\u00c4" => "Ä", "\u00c5" => "Å", "\u00c6" => "Æ", "\u00c7" => "Ç", "\u00c8" => "È", "\u00c9" => "É",
            "\u00ca" => "Ê", "\u00cb" => "Ë", "\u00cc" => "Ì", "\u00cd" => "Í", "\u00ce" => "Î", "\u00cf" => "Ï", "\u00d1" => "Ñ", "\u00d2" => "Ò", "\u00d3" => "Ó", "\u00d4" => "Ô",
            "\u00d5" => "Õ", "\u00d6" => "Ö", "\u00d8" => "Ø", "\u00d9" => "Ù", "\u00da" => "Ú", "\u00db" => "Û", "\u00dc" => "Ü", "\u00dd" => "Ý", "\u00df" => "ß", "\u00e0" => "à",
            "\u00e1" => "á", "\u00e2" => "â", "\u00e3" => "ã", "\u00e4" => "ä", "\u00e5" => "å", "\u00e6" => "æ", "\u00e7" => "ç", "\u00e8" => "è", "\u00e9" => "é", "\u00ea" => "ê",
            "\u00eb" => "ë", "\u00ec" => "ì", "\u00ed" => "í", "\u00ee" => "î", "\u00ef" => "ï", "\u00f0" => "ð", "\u00f1" => "ñ", "\u00f2" => "ò", "\u00f3" => "ó", "\u00f4" => "ô",
            "\u00f5" => "õ", "\u00f6" => "ö", "\u00f8" => "ø", "\u00f9" => "ù", "\u00fa" => "ú", "\u00fb" => "û", "\u00fc" => "ü", "\u00fd" => "ý", "\u00ff" => "ÿ"
        ];

        return strip_tags(strtr($input, $utf8_ansi2));
    }
    #endregion



    #region [Filter friendly links]
    public static function FORMAT_FRIENDLY_URL(string $url)
    {
        $url = self::CONVERT_EN_LETTERS($url);
        // Remove all illegal characters from url
        $sanitizedUrl = filter_var($url, FILTER_SANITIZE_URL);
        // $sanitizedUrl = filter_var($url, FILTER_TO_LAWOERCASES);
        $url = htmlentities(strip_tags($url), ENT_QUOTES, 'UTF-8');
        $url = str_replace('&amp;', '&', $url);
        // Validate website url
        if (!filter_var($url, FILTER_VALIDATE_URL) && $url != $sanitizedUrl) :
            $filters = ['>', '<', '*', '+', '=', '?', '&', ';', ':', '\'', '#', '/', '\\', '|', '!', '@', ',', '.', '-', '%', '$', '§', '"', '(', ')', '[', ']', '{', '}'];

            $len = count($filters);

            for ($i = 0; $i < $len; $i++) :
                $url = str_replace($filters[$i], '', $url);
            endfor;
        endif;
        $url = str_replace(' ', '_', $url) . '_' . bin2hex(openssl_random_pseudo_bytes(rand(5, 10)));
        return strtolower($url);
    }
    #endregion
}
