<?php

namespace App\Modules\ReminderCalendar;

use App\Bootstrap\Web;
use App\Modules\ReminderCalendar\Api\ReminderCalendarApi;
use App\Modules\ReminderCalendar\Controller\ReminderCalendarController;

class ReminderCalendarUrls extends Web
{
    // this Required to views path 
    static $resource = __DIR__ . '/views/';

    function __construct($router)
    {
        // - Reminder Calendar
        $router->get($this->getPath('get_reminder_calendar'), new ReminderCalendarController, "index");
        $router->get($this->getPath('get_reminder_editor') . '{reminder}', new ReminderCalendarController, "editor");
        $router->post($this->getPath('post_reminder'), new ReminderCalendarApi, 'create');
        $router->post($this->getPath('post_reminder_update') . '{reminder}', new ReminderCalendarApi, 'update');
        $router->delete($this->getPath('delete_reminder') . '{reminder}', new ReminderCalendarApi, 'delete');
    }
}
