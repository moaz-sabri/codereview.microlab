<?php

namespace App\Utilities;

use Exception as Exc;
use Throwable;

class Exception extends Exc
{
    function __construct($message = "Custom error message", $code = 0, Throwable $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }
}
