<?php

namespace App\Modules\ReminderCalendar\Model;

use App\Database\Database;

class ReminderCalendarModel extends Database
{
    public object $column;
    public string $pattern = '/^C-[R-Za-z0-9]{12}$/';

    private static string $moduleName = 'reminder_calendar';
    private static array $cols = [
        "calendar_uid" => "INT(11) NOT NULL AUTO_INCREMENT",
        "calendar_guide" => "CHAR(14) NOT NULL,",
        "calendar_owner" => "INT(11) NOT NULL",
        "calendar_subject" => "CHAR(255) NOT NULL",
        "calendar_message" => "VARCHAR(3000) DEFAULT NULL",
        "calendar_image" => "VARCHAR(255) DEFAULT NULL",
        "calendar_status" => "CHAR(33) ENUM('RUNNING', 'STOP') DEFAULT 'RUNNING'",
        "calendar_remindertime" => "ENUM('1 day', '2 days', '4 days', '1 week', '2 weeks') NOT NULL",
        "calendar_date_start" => "DATE NOT NULL",
        "calendar_date_end" => "DATE DEFAULT NULL",
        "calendar_created_at" => "DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP",
        "calendar_updated_at" => "DATETIME DEFAULT NULL",
        "calendar_deleted_at" => "DATETIME DEFAULT NULL",
    ];

    function __construct()
    {
        $this->base = 'calendar';
        $this->tableName = self::$moduleName;
        $this->column = $this->attributes(self::$cols);
    }

    static function getTableName()
    {
        return self::tableIsExist(self::$moduleName);
    }
}
