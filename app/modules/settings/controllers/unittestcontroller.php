<?php

namespace App\Modules\Settings\Controllers;

use App\Modules\Projects\Test\ProjectTest;
use App\Modules\Settings\Setting as Settings;
use App\Modules\Users\Loader\User;
use App\Utilities\Utilitie;

class UnitTestController extends Utilitie
{
    function dashboard(User $currentuser)
    {
        if (!Settings::permission('dashboard')) :
            $this->notAllowd();
        endif;

        return (object) [
            "view" => "unittest",
            "meta" => [
                "title" => PROJECT_NAME
            ],
        ];
    }

    function unit(User $currentuser)
    {
        if (!Settings::permission('dashboard')) :
            $this->notAllowd();
        endif;
        $result = null;

        switch ($this->parameters->endpoint) {
            case 'project':
                if ($this->parameters->target == 'checkups') :
                    $result = ProjectTest::checkups($currentuser);
                endif;
                break;
        }

        if (is_null($result)) $this->bad(404, 'Not Found');

        return (object) [
            "obj" => $result,
            "view" => "unit",
            "meta" => [
                "title" => PROJECT_NAME
            ],
        ];
    }
}
