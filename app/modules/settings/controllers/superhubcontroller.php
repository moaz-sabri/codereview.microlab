<?php

namespace App\Modules\Settings\Controllers;

use App\Modules\Settings\Loader\SuperHubLoader;
use App\Modules\Settings\Setting as DashSetting;
use App\Utilities\Utilitie;

class SuperHubController extends Utilitie
{

    function main()
    {
        if (!DashSetting::permission('dashboard')) :
            $this->notAllowd();
        endif;

        return (object) [
            "view" => "index",
            "meta" => [
                "TITLE_PAGE" => 'TEST',
            ],
            "bscripts" => [
                "/public/static/vendor/chart.js/chart.min.js",
                "/public/static/js/charts/index-charts.js",
                "/public/static/js/charts/charts-dashboard.js"
            ]
        ];
    }

    function appbuliding()
    {
        if (!DashSetting::permission('create')) :
            $this->notAllowd();
        endif;

        if (isset($this->parameters->queries->model)) :
            $model = "App\Modules\\{$this->parameters->target}\\Models\\{$this->parameters->queries->model}model";

            if (class_exists($model)) :
                $table = new $model();
                $builded = $table->build();

                if ($builded == true && $builded == 1) :
                    $table->setDefault();
                    $code = 200;
                    $message = "The build is completed successfully";
                    $color = "success";

                endif;
            endif;
        endif;

        $this->back($code ?? 204, $message ?? "some problem!", $color ?? "danger");
    }

    function appupdate()
    {
        if (!DashSetting::permission('update')) :
            $this->notAllowd();
        endif;

        if (isset($this->parameters->queries->model)) :
            $model = "App\Modules\\{$this->parameters->target}\\Models\\{$this->parameters->queries->model}model";


            if (class_exists($model)) :
                $table = new $model();
                $update = $table->tableUpdate();

                if ($update) :
                    $message = "Update the Table";
                    $color = "success";
                endif;
            endif;
        endif;

        $this->ok('/dashboard', $message ?? "some problem!", $color ?? "danger");
    }

    function appremove()
    {
        if (!DashSetting::permission('delete')) :
            $this->notAllowd();
        endif;

        if (isset($this->parameters->queries->model)) :
            $model = "App\Modules\\{$this->parameters->target}\\Models\\{$this->parameters->queries->model}model";

            if (class_exists($model)) :
                $table = new $model();
                $deleted = $table->removeModule();

                if ($deleted) :
                    $code = 200;
                    $message = "Removed the Module";
                    $color = "success";
                endif;
            endif;
        endif;

        $this->back($code ?? 204, $message ?? "some problem!", $color ?? "danger");
    }
}
