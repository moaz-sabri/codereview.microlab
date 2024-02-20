<?php

namespace App\Bootstrap;

use App\Modules\Core\Loader\CryptLoader;
use App\Modules\Core\Loader\PermissionLoader;

class Request
{
    public $path;
    public $method;
    public $data;
    public $user;
    public $routeParams;
    public $queryParams;

    public function __construct($method, $path)
    {
        $this->method = $method;
        $this->path = $path;
        $this->data = $this->getData($path);
        $this->user = $this->validUser() ? CryptLoader::decrypt(true) : false;
        $this->parsePath();
        $this->parseQueryParams();

        if (DEBUG) debug("loaded Request");
    }

    private function ValidUser()
    {
        // Check if the Authorization header is present in the request
        if (
            isset($_SERVER['HTTP_AUTHORIZATION']) ||
            isset($_SERVER['REDIRECT_HTTP_AUTHORIZATION'])
        ) :
            $token = $_SERVER['HTTP_AUTHORIZATION'] ?? $_SERVER['REDIRECT_HTTP_AUTHORIZATION'];
            return PermissionLoader::authenticated($token);
        else :
            return PermissionLoader::authenticated();
        endif;
    }

    private function getData()
    {
        $inputs = [];
        $request = array_merge($_POST, $_GET);
        if ($_SERVER['REQUEST_METHOD'] === 'PUT' || $_SERVER['REQUEST_METHOD'] === 'DELETE') {
            parse_str(file_get_contents('php://input'), $putParams);
            $request = array_merge($request, $putParams);
        }
        foreach ($request as $key => $input) {
            if (gettype($input) === 'string') {
                $input = str_replace('/\s+/', ' ', $input);
                $input = htmlspecialchars_decode($input);
            } elseif (gettype($input) != 'array') {
                $input = strip_tags($input);
            }

            if (!in_array($key, ["count", "current"]) && !is_numeric($key)) {
                $inputs[$key] = $input;
            }
        }

        return (object)$inputs;
    }


    private function parsePath()
    {
        $pathParts = explode('?', $this->path);
        $this->path = $pathParts[0];

        $pathSegments = explode('/', trim($this->path, '/'));

        $this->routeParams = array_slice($pathSegments, 0);
    }

    private function parseQueryParams()
    {
        $query = parse_url($_SERVER['REQUEST_URI'], PHP_URL_QUERY) ?? '';

        parse_str($query, $queryParams);
        $this->queryParams = $queryParams;
    }

    public function getMethod()
    {
        return $this->method;
    }

    public function getPath()
    {
        return $this->path;
    }

    public function getRouteParams()
    {
        return $this->routeParams;
    }

    public function getQueryParams()
    {
        return $this->queryParams;
    }
}
