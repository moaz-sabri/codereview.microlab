<?php

namespace App\Modules\ReminderCalendar\Controller;

use App\Bootstrap\Loader\AutoLoader;
use App\Bootstrap\Response;
use App\Extends\Mailer\MailerLoader;
use App\Modules\Core\Loader\CryptLoader;
use App\Modules\ReminderCalendar\Model\ReminderCalendarModel;
use App\Modules\ReminderCalendar\ReminderCalendarUrls;
use App\Utilities\Utilitie;

class ReminderCalendarController extends Utilitie
{
    #region 
    /**
     * Retrieve all reminders for the current user.
     *
     * @param Object $request The request object containing additional parameters.
     * @return Response The response containing the list of reminders.
     */
    function index(object $request): Response
    {
        $this->hasAuth();

        $count = $request->queryParams->count ?? 6;
        $current = $request->queryParams->current ?? 1;

        $reminderModel = new ReminderCalendarModel;

        if (CryptLoader::decrypt('role') != 'DEV') :
            $reminderModel->conditions = [['calendar_owner', '=', CryptLoader::decrypt('uid')]];
        endif;

        $reminderModel->pagination = true;
        $reminderModel->current = $current;
        $reminderModel->count = $count;
        $reminderModel->sort = 'date_start';

        $result = $reminderModel->get();

        return (object) [
            'view' => ReminderCalendarUrls::$resource . 'index',
            'data' => ['reminder' => $result],
            'theme' => 'cpanel',
            'meta' => ['title' => "Reminder Calendar"],
            'bscripts' => AutoLoader::getSourceFormAndTable()
        ];
    }
    #endregion

    function editor($request)
    {
        $this->hasAuth();

        $reminderModel = new ReminderCalendarModel;
        $reminderModel->conditions = [['calendar_uid', '=', $request->routeParams->reminder],];
        $reminder = $reminderModel->find();
        if (!$reminder) :
            new Response('/404', 301);
        endif;

        $history = MailerLoader::remidHistory($reminder->calendar_uid);

        return (object) [
            'view' => ReminderCalendarUrls::$resource . 'editor',
            'data' => ['reminder' => $reminder, 'history' => $history],
            'theme' => 'cpanel',
            'meta' => ['title' => "Editor"],
            'bscripts' => AutoLoader::getSourceFormAndTable()
        ];
    }
}
