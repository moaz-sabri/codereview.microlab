<?php

namespace App\Modules\Settings\Controllers;

use App\Bootstrap\Request;
use App\Database\Migrate;
use App\Utilities\Utilitie;
use ReflectionClass;
use ReflectionException;

class SetupController extends Utilitie
{
    private $requiredModels = [];

    function setup()
    {
        if ($this->parameters->queries->hash === SECRET_KEY) :

            return (object) [
                "view" => "setup",
                "meta" => [
                    "title" => PROJECT_NAME
                ],
            ];
        endif;

        $this->bad(404, 'not found');
    }

    function install(Request $request)
    {
        if ($request->data->key === SECRET_KEY) :
            if (isset($request->data->modules)) :

                if ($this->creating($request->data->modules)) :
                    $this->ok('/login', 'installed modules');
                endif;
            endif;
        endif;

        $this->bad(404, 'not found');
    }

    private function creating($modules)
    {
        $this->requiredModels = [];
        foreach ($modules as $module => $value) :

            // Construct the full class name for the module's Setting class
            $class = "App\\Modules\\{$module}\\Setting"; // Replace this with the path 

            // Check if the class exists
            if (class_exists($class)) :

                // Extract details from the module's Setting class
                $details = (object) $class::$details;
                if (isset($details->children)) :
                    foreach ($details->children as $key => $child) {
                        $this->createTabel($module, $child['model']);
                    }
                endif;
                $this->createTabel($module, $details->model);

            endif;
        endforeach;

        if (count($this->requiredModels) > 1) :
            sleep(1);
            $this->creating($modules);
        else :
            return true;
        endif;
    }

    private function createTabel($module, $model)
    {

        if (!Migrate::tableIsExist($model)) :
            $table = "App\Modules\\{$module}\\Models\\{$model}model";


            if (class_exists($table)) :
                $build = new $table();
                $builded = $build->build();

                if ($builded === true) :
                    if ($builded) :
                        $inserted = $build->setDefault();
                    endif;

                    if (isset($inserted) && $inserted) :

                    endif;
                else :
                    $this->requiredModels = array_merge($this->requiredModels, $builded);
                endif;
            endif;
        endif;
    }
}
