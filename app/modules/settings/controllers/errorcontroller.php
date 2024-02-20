<?php

namespace App\Modules\Settings\Controllers;

use App\Utilities\Utilitie;

class ErrorController extends Utilitie
{
    function notfound()
    {
        $this->bad(404, "notfound");
    }
}
