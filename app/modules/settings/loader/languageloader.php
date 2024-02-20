<?php

namespace App\Modules\Settings\Loader;

use App\Modules\Permissions\Loader\PermissionLoader;
use App\Modules\Records\Loader\RecordLoader;
use App\Utilities\Utilitie;

class LanguageLoader extends Utilitie
{

    private static string $tablename = 'settings';

    public static $defaultLanguage = 'en'; // Default language
    public $languageData;
    public static $availableLanguages = []; // Default language

    // Replace this with the path to your directory
    public static $directory = STORAGE . "languages";


    function __construct()
    {
        // Use glob to get a list of XML files
        self::$availableLanguages =  glob(self::$directory . "/*/index.xml");
    }

    function load(string $language = 'en'): void
    {
        // If a specific language is provided, use it; otherwise, use the default language
        if ($language) :
            self::$defaultLanguage = $language;
        endif;

        $this->set("/index.xml");
    }

    function moreLabels($language)
    {
        if (is_array($language)) :
            foreach ($language as $key => $lan) :
                $this->set($lan . ".xml");
            endforeach;
        else :
            $this->set($language . ".xml");
        endif;
    }

    private function set($file)
    {
        $languageFile = self::$directory . DS . self::$defaultLanguage . DS . $file;
        if (file_exists($languageFile)) :
            $xml = simplexml_load_file($languageFile);

            foreach ($xml->phrase as $phrase) :
                $this->languageData[(string) $phrase['name']] = (string) $phrase;
            endforeach;
        endif;
    }

    function get(string $key, string $default = 'NO LABEL!'): string
    {
        if (!is_null($key) && isset($this->languageData[$key]) && !empty($this->languageData[$key])) :
            $default = $this->languageData[$key];
        endif;

        return $default;
    }
}
