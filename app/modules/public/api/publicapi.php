<?php

namespace App\Modules\Public\Api;

use App\Bootstrap\JsonResponse;
use App\Utilities\Utilitie;

class PublicApi extends Utilitie
{
    private $statusCode = 500;
    private $responseMessage;
    private $response;
    private $errors = [];

    public function allowedPolicy()
    {
        setcookie('policyAllowed', true,  time() + 30 * 24 * 60 * 60, '/');
        return new JsonResponse([]);
    }
}
