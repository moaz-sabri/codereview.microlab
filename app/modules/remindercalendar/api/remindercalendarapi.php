<?php

namespace App\Modules\ReminderCalendar\Api;

use App\Bootstrap\JsonResponse;
use App\Bootstrap\Web;
use App\Modules\Core\Loader\CryptLoader;
use App\Modules\ReminderCalendar\Model\ReminderCalendarModel;
use App\Utilities\Uploads;
use App\Utilities\Utilitie;
use DateInterval;
use DateTime;

class ReminderCalendarApi extends Utilitie
{
    private $statusCode = 500;
    private $responseMessage;
    private $response;
    private $errors = [];

    #region
    /**
     * Create a new reminder.
     *
     * @param Object $request The request object containing reminder data.
     * @return JsonResponse The JsonResponse containing the created reminder object or error message.
     */
    public function create(Object $request): JsonResponse
    {
        $this->hasAuth();

        $validationRules = [
            'day' => ['required' => true],
            'month' => ['required' => true],
            'subject' => ['required' => true],
            'reminding' => ['required' => true],
        ];

        $data = $this->validates($request->data, $validationRules);
        if (is_array($data)) return $data['res'];

        $reminderModel = new ReminderCalendarModel;

        $reminderModel->column->calendar_guide = $this->guide('C');
        $reminderModel->column->calendar_owner = CryptLoader::decrypt('uid');
        $reminderModel->column->calendar_subject = $data->subject;
        $reminderModel->column->calendar_remindertime = $data->reminding;
        $reminderModel->column->calendar_status = 'RUNNING';

        // Create a DateTime object for the current year, using the provided month and day
        $startDate = new DateTime(date('Y') . '-' . $data->month . '-' . $data->day);

        // Add 1 week to the start date
        $endDate = clone $startDate; // Create a copy of the start date
        $endDate->sub(new DateInterval('P1D')); // Sub the current day
        $endDate->add(new DateInterval('P' . $data->reminding)); // Add reminder date

        // Format the dates as strings
        $reminderModel->column->calendar_date_start = $startDate->format('Y-m-d');
        $reminderModel->column->calendar_date_end = $endDate->format('Y-m-d');

        $reminder = $reminderModel->save();

        if ($reminder) :
            $this->response = $reminder;
            $callback = Web::getPath('get_reminder_editor') . $reminder->calendar_uid;
        else :
            $this->responseMessage = 'Leider wurde der Inhalt nicht gespeichert. Es ist ein Fehler aufgetreten. Bitte versuchen Sie es erneut';
        endif;

        return new JsonResponse([
            'message' => $this->responseMessage,
            'callback' => $callback ?? false,
        ]);
    }
    #endregion

    #region
    /**
     * Update an existing reminder.
     *
     * @param Object $request The request object containing updated reminder data.
     * @return JsonResponse The JsonResponse containing the updated reminder object or error message.
     */
    public function update(Object $request): JsonResponse
    {
        $this->hasAuth();

        $reminderModel = new ReminderCalendarModel;
        $reminderModel->conditions = [['calendar_uid', '=', $request->routeParams->reminder]];
        $reminder = $reminderModel->find();
        if (!$reminder) :
            new JsonResponse('/404', 301);
        endif;

        $validationRules = [
            'day' => ['required' => true],
            'month' => ['required' => true],
            'subject' => ['required' => true],
            'reminding' => ['required' => true],
            'status' => ['required' => true],
            'message' => ['max_length' => 3000],
        ];

        $data = $this->validates($request->data, $validationRules);
        if (is_array($data)) return $data['res'];

        $reminderModel = new ReminderCalendarModel;
        $reminderModel->conditions = [['calendar_uid', '=', $reminder->calendar_uid]];

        $reminderModel->column->calendar_subject = $data->subject;
        $reminderModel->column->calendar_remindertime = $data->reminding;
        $reminderModel->column->calendar_status = $data->status;

        // Create a DateTime object for the current year, using the provided month and day
        $startDate = new DateTime(date('Y') . '-' . $data->month . '-' . $data->day);

        // Add 1 week to the start date
        $endDate = clone $startDate; // Create a copy of the start date
        $endDate->sub(new DateInterval('P1D')); // Sub the current day
        $endDate->add(new DateInterval('P' . $data->reminding)); // Add reminder date

        // Format the dates as strings
        $reminderModel->column->calendar_date_start = $startDate->format('Y-m-d');
        $reminderModel->column->calendar_date_end = $endDate->format('Y-m-d');

        $reminderModel->column->calendar_message = $data->message;

        if (!empty($_FILES['file']['name'])) :
            // Loop through each file
            $loader = new Uploads;
            $loader->file = [
                "size" => [$_FILES['file']['size']],
                "type" => [$_FILES['file']['type']],
                "name" => [$_FILES['file']['name']],
                "tmp_name" => [$_FILES['file']['tmp_name']],
                "size" => [$_FILES['file']['size']],
            ];

            $loader->location = "uploads/{$reminder->calendar_guide}" . DS;

            $upload = $loader->upload();

            if ($upload) :
                $reminderModel->column->calendar_image  =  $upload->file;;
            endif;
        endif;

        $updateReminder = $reminderModel->save();

        if ($updateReminder) :
            $this->response = $updateReminder;
            $callback = Web::getPath('get_reminder_editor') . $reminder->calendar_uid;
        else :
            $this->responseMessage = 'Leider wurde der Inhalt nicht gespeichert. Es ist ein Fehler aufgetreten. Bitte versuchen Sie es erneut';
        endif;

        return new JsonResponse([
            'message' => $this->responseMessage,
            'callback' => $callback ?? false,
        ]);
    }
    #endregion


    /**
     * Soft delete an existing reminder.
     *
     * @param int $id The ID of the reminder to delete.
     * @return JsonResponse The JsonResponse containing a success message.
     */
    public function delete(object $request): JsonResponse
    {
        $this->hasAuth();

        if (isset($request->routeParams->reminder)) :
            $uids = explode(',', $request->routeParams->reminder);

            foreach ($uids as $uid) :
                $reminderModel = new ReminderCalendarModel();
                $reminderModel->conditions = [
                    ['calendar_uid', '=', $uid],
                    ['calendar_owner', '=', CryptLoader::decrypt('uid')]
                ];

                $reminder = $reminderModel->find();

                if ($reminder) :
                    $reminder = $reminderModel->delete();
                    $this->statusCode = 200;
                endif;
            endforeach;
        endif;

        return new JsonResponse([
            'code' => $this->statusCode,
        ]);
    }
    #endregion
}
