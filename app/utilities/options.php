<?php

namespace App\Utilities;

trait Options
{
    static function activation()
    {
        return (object) [
            "ENABLE", "DISABLED"
        ];
    }

    static function categories()
    {
        return (object) [
            "test", "new", "main", "try"
        ];
    }
}
