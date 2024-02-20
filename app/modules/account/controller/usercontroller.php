<?php

namespace App\Modules\Account\Controller;

use App\Bootstrap\Loader\AutoLoader;
use App\Bootstrap\Web;
use App\Bootstrap\Response;
use App\Modules\Account\AccountUrls;
use App\Modules\Account\Loader\User;
use App\Modules\ReminderCalendar\Loader\ReminderCalendarLoader;
use App\Utilities\Utilitie;

class UserController extends Utilitie
{
    #region [Retrieves the profile data of the currently logged-in user and returns it for viewing.]
    /**
     *
     * This method retrieves the profile data of the currently logged-in user and returns it for viewing. It typically includes information such as name, email, and any other profile-related data.
     *
     * @return array An associative array containing the profile data of the currently logged-in user. The array typically includes fields such as 'name', 'email', etc.
     */
    function profile($request)
    {
        $this->hasAuth();

        $result = User::get($request->user->uid);

        $reminder = ReminderCalendarLoader::get($request->user->uid);

        if ($request->path !== Web::getPath('get_manger_add_user') && !$result) :
            return new Response('Server', 500);
        endif;

        return (object) [
            'view' => AccountUrls::$resource . 'profile',
            'data' => ['user' => $result, 'reminder' => $reminder],
            'theme' => 'cpanel',
            'meta' => ['title' => "Profile {$result->user_username}"],
            'bscripts' => AutoLoader::getSourceFormAndTable()
        ];
    }
    #endregion

    function edit($request)
    {
        $this->hasAuth();

        $result = User::get($request->user->uid);

        if ($request->path !== Web::getPath('get_manger_add_user') && !$result) :
            return new Response('Server', 500);
        endif;

        return (object) [
            'view' => AccountUrls::$resource . 'profile',
            'data' => ['user' => $result, 'branch' => 'edit'],
            'theme' => 'cpanel',
            'meta' => ['title' => "Profile {$result->user_username}"],
            'bscripts' => AutoLoader::getSourceForm()
        ];
    }

    public function visitProfile($request)
    {
        $this->hasAuth();

        $uid = isset($request->routeParams->username) ? $request->routeParams->username : 5;
        $result = User::get($uid);

        if ($request->path !== Web::getPath('get_manger_add_user') && !$result) :
            return new Response('Server', 500);
        endif;

        return (object) [
            'view' => AccountUrls::$resource . 'visit_profile',
            'data' => ['user' => $result],
            'theme' => 'cpanel',
            'meta' => ['title' => 'Visit Profile Username']
        ];
    }
}
