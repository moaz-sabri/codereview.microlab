<?php

namespace App\Modules\Projects\Test;

use App\Modules\Settings\Loader\TestLoader;
use App\Modules\Users\Loader\User;
use App\Utilities\Utilitie;

class ProjectTest extends Utilitie
{
    private static $currentuser = null;
    private static $projectId = null;

    private static $endpoint = "http://localhost:80/";
    private static $project = [
        "content" => "<p>testproject</p>",
        "title" => "testproject",
        "type" => "WEBSITES",
        "thumbnail" => "",
        "status" => "ENABLE",
        "gallery" => "",
        "categories" => "testproject",
        "tags" => "testproject,testproject2",
        "keywords" => "testproject, testproject, testproject",
        "description" => "testproject testproject",
    ];

    static function checkups(User $currentuser)
    {
        self::$currentuser = $currentuser;

        $result = (object)[];
        $url = self::$endpoint . "api/project/create";
        $result->successTestToCreate = self::successTestToCreate($url);
        $result->failureTestToCreate = self::failureTestToCreate($url);

        if (!is_null(self::$projectId)) :
            $url = self::$endpoint . "api/project/update/" . self::$projectId;
            $result->successTestToUpdate = self::successTestToUpdate($url);
            $result->failureTestToUpdate = self::failureTestToUpdate($url);
            $result->failureTestToUpdate2 = self::failureTestToUpdate2($url);

            $url = self::$endpoint . "api/project/switch/" . self::$projectId;
            $result->successTestToSwitch = self::successTestToSwitch($url);
            $result->failureTestToSwitch = self::failureTestToSwitch($url);
            $result->failureTestToSwitch2 = self::failureTestToSwitch2($url);

            $url = self::$endpoint . "api/project/delete/" . self::$projectId;
            $result->successTestToDelete = self::successTestToDelete($url);
            $result->failureTestToDelete = self::failureTestToDelete($url);

            $url = self::$endpoint . "api/project/destroy/" . self::$projectId;
            $result->successTestToDestroy = self::successTestToDestroy($url);
            $result->failureTestToDestroy = self::failureTestToDestroy($url);
        endif;

        return $result;
    }

    // Create

    private static function successTestToCreate($url)
    {

        $expected = 200;
        $resp = TestLoader::sendHttpRequest($url, 'POST', self::$currentuser->token, self::$project);
        $projectId = json_decode($resp->response)->message;

        if (isset($projectId)) :
            self::$projectId = $projectId;
        endif;

        if ($resp->code === $expected) return 'success test';
        return 'Bad, the result is: ' . $resp->code . ' but expected: ' . $expected . '\n ' . $resp->response;
    }

    private static function failureTestToCreate($url)
    {

        $expected = 400;
        self::$project['categories'] = null;
        $resp = TestLoader::sendHttpRequest($url, 'POST', self::$currentuser->token, self::$project);

        if ($resp->code === $expected) return 'success test';
        return 'Bad, the result is: ' . $resp->code . ' but expected: ' . $expected . '\n ' . $resp->response;
    }

    // Update

    private static function successTestToUpdate($url)
    {

        $expected = 200;
        self::$project['categories'] = 'catupdated';
        self::$project['title'] = 'successTestToUpdate';
        $resp = TestLoader::sendHttpRequest($url, 'POST', self::$currentuser->token, self::$project);


        if ($resp->code === $expected) return 'success test';
        return 'Bad, the result is: ' . $resp->code . ' but expected: ' . $expected . '\n ' . $resp->response;
    }
    private static function failureTestToUpdate($url)
    {

        $expected = 404;
        self::$project['title'] = 'failureTestToUpdate';
        $resp = TestLoader::sendHttpRequest($url . 'x', 'POST', self::$currentuser->token, self::$project);

        if ($resp->code === $expected) return 'success test';
        return 'Bad, the result is: ' . $resp->code . ' but expected: ' . $expected . '\n ' . $resp->response;
    }

    private static function failureTestToUpdate2($url)
    {

        $expected = 400;
        self::$project['title'] = null;
        self::$project['type'] = null;
        $resp = TestLoader::sendHttpRequest($url, 'POST', self::$currentuser->token, self::$project);

        if ($resp->code === $expected) return 'success test';
        return 'Bad, the result is: ' . $resp->code . ' but expected: ' . $expected . '\n ' . $resp->response;
    }

    // Switch

    private static function successTestToSwitch($url)
    {

        $expected = 200;
        $resp = TestLoader::sendHttpRequest($url, 'POST', self::$currentuser->token, [
            'scope' => 'status',
            'switch' => 'DISABLED'
        ]);

        if ($resp->code === $expected) return 'success test';
        return 'Bad, the result is: ' . $resp->code . ' but expected: ' . $expected . '\n ' . $resp->response;
    }

    private static function failureTestToSwitch($url)
    {

        $expected = 400;
        $resp = TestLoader::sendHttpRequest($url . 'x', 'POST', self::$currentuser->token, [
            'scope' => 'status',
            'switch' => 'DDDDDD'
        ]);

        if ($resp->code === $expected) return 'success test';
        return 'Bad, the result is: ' . $resp->code . ' but expected: ' . $expected . '\n ' . $resp->response;
    }

    private static function failureTestToSwitch2($url)
    {

        $expected = 400;
        $resp = TestLoader::sendHttpRequest($url, 'POST', self::$currentuser->token, [
            'scope' => null,
            'switch' => 'BUG'
        ]);

        if ($resp->code === $expected) return 'success test';
        return 'Bad, the result is: ' . $resp->code . ' but expected: ' . $expected . '\n ' . $resp->response;
    }

    // Delete

    private static function successTestToDelete($url)
    {

        $expected = 200;
        $resp = TestLoader::sendHttpRequest($url, 'GET', self::$currentuser->token);

        if ($resp->code === $expected) return 'success test';
        return 'Bad, the result is: ' . $resp->code . ' but expected: ' . $expected . '\n ' . $resp->response;
    }

    private static function failureTestToDelete($url)
    {

        $expected = 404;
        $resp = TestLoader::sendHttpRequest($url . 'x', 'GET', self::$currentuser->token);

        if ($resp->code === $expected) return 'success test';
        return 'Bad, the result is: ' . $resp->code . ' but expected: ' . $expected . '\n ' . $resp->response;
    }

    // Destroy

    private static function successTestToDestroy($url)
    {

        $expected = 200;
        $resp = TestLoader::sendHttpRequest($url, 'GET', self::$currentuser->token);

        if ($resp->code === $expected) return 'success test';
        return 'Bad, the result is: ' . $resp->code . ' but expected: ' . $expected . '\n ' . $resp->response;
    }

    private static function failureTestToDestroy($url)
    {

        $expected = 404;
        $resp = TestLoader::sendHttpRequest($url . 'x', 'GET', self::$currentuser->token);

        if ($resp->code === $expected) return 'success test';
        return 'Bad, the result is: ' . $resp->code . ' but expected: ' . $expected . '\n ' . $resp->response;
    }
}
