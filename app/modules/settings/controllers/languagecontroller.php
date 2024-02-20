<?php

namespace App\Modules\Settings\Controllers;

use App\Bootstrap\Request;
use App\Modules\Settings\Setting as Settings;
use App\Modules\Settings\Loader\LanguageLoader;
use App\Utilities\Utilitie;

class LanguageController extends Utilitie
{
    function dashboard()
    {
        if (!Settings::permission('dashboard')) :
            $this->notAllowd();
        endif;

        if (isset($this->parameters->target)) :
            $languages = new LanguageLoader();
            $languages->load($this->parameters->target);
            $obj = $languages->languageData;
        endif;

        return (object) [
            "obj" => $obj ?? [],
            "view" => "languages",
            "meta" => [
                "title" => PROJECT_NAME
            ],
        ];
    }

    function updatelanguage(Request $request)
    {
        self::update($request, $this->parameters->target);
        $this->ok();
    }

    function switchlanguage()
    {
        $_SESSION['lang'] = $this->parameters->target;
        $this->ok('');
    }

    public static function update(Request $request, $lang)
    {
        if (!Settings::permission('update')) :
            return false;
        endif;

        $languageFile =  LanguageLoader::$directory . "/{$lang}/index.xml";

        if (!file_exists($languageFile)) :
            return false; // Language file doesn't exist
        endif;

        $validationRules = [
            'value' => ['required' => true, 'min_length' => 2, 'max_length' => 55],
            'key' => ['required' => true, 'min_length' => 2, 'max_length' => 3000],
        ];

        $validation = self::validate($request->data, $validationRules);
        $errors = self::validateFormData($validation);
        if (!empty($errors)) return false;

        $data = $validation['validated'];



        $xml = simplexml_load_file($languageFile);

        $found = false;
        foreach ($xml->phrase as $phrase) :
            if ((string) $phrase['name'] === $data->key) :
                $phrase[0] = $data->value;
                $found = true;
                break;
            endif;
        endforeach;

        if (!$found) :
            return self::add($data);
        endif;

        return $xml->asXML($languageFile);
    }

    private static function add($data)
    {
        if (!Settings::permission('create')) :
            return false;
        endif;

        foreach (LanguageLoader::$availableLanguages as $languageFile) {
            $xml = simplexml_load_file($languageFile);

            if (strpos($languageFile, $_SESSION['lang'])) :
                $newPhrase = $xml->addChild('phrase', $data->value);
            else :
                $newPhrase = $xml->addChild('phrase', $data->key);
            endif;
            $newPhrase->addAttribute('name', $data->key);

            $xml->asXML($languageFile);
        }

        return true;
    }
}
