<?php

namespace App\Modules\Basic\Controllers;

use App\Modules\Projects\Loader\ProjectLoader;
use App\Modules\Records\Loader\RecordLoader;
use App\Utilities\Utilitie;

class BasicController extends Utilitie
{
    function main()
    {
        $file = $this->parameters->module;
        if (!empty($this->parameters->endpoint)) :
            $file .= "/{$this->parameters->endpoint}";
        endif;
        if (!empty($this->parameters->target)) :
            $file .= "/{$this->parameters->target}";
        endif;

        $page = in_array($this->parameters->module, ["home", "/", ""]) ? 'index' : $file;

        return (object) [
            "view" => $page,
            "meta" => [
                "title" => $page . '-' . PROJECT_NAME
            ],
            "language" => "home"
        ];
    }

    function errors()
    {

        switch ($this->parameters->module) {
            case "bad-request":
                $file = '/errors/bad-request.html';
                break;

            case "unauthorized":
                $file = '/errors/unauthorized.html';
                break;

            case "forbidden":
                $file = '/errors/forbidden.html';
                break;

            case "internal-server-error":
                $file = '/errors/internal-server-error.html';
                break;

            case "service-unavailable":
                $file = '/errors/service-unavailable.html';
                break;

            default:
                $file = '/errors/not-found.html';
                break;
        }

        require_once  ROOT . $file;
        die;
    }
}
