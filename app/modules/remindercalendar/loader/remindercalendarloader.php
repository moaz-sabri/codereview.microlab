<?php

namespace App\Modules\ReminderCalendar\Loader;

use App\Modules\ReminderCalendar\Model\ReminderCalendarModel;
use App\Utilities\Utilitie;

class ReminderCalendarLoader extends Utilitie
{
    public static function get($id)
    {
        $reminderModel = new ReminderCalendarModel;
        $reminderModel->count = 10;
        $reminderModel->sort = 'date_start';
        $reminderModel->conditions = [['calendar_owner', '=', $id]];
        $result = $reminderModel->get();

        return $result;
    }
}
