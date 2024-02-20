<?php

namespace App\Modules\Users\Loader;

use App\Utilities\Utilitie;

class User
{
    public $token;
    public $uid;
    public $guide;
    public $type;
    public $name;
    public $role;
    public $avatar;
    public $group;

    function __construct($user)
    {
        foreach ($user as $key => $value) :
            if (property_exists($this, $key)) :
                $this->$key = $value;
            endif;
        endforeach;
    }
}
