<?php

namespace App\Modules\Core\Api;

use App\Bootstrap\JsonResponse;
use App\Database\DatabaseHandler;
use App\Extends\Mailer\MailerLoader;
use App\Extends\Mailer\MailerModel;
use App\Extends\Record\RecordLoader;
use App\Modules\Account\Model\UserModel;
use App\Modules\ReminderCalendar\Model\ReminderCalendarModel;
use App\Utilities\Utilitie;
use PDO;

use function App\Bootstrap\debug;

class CPApi extends Utilitie
{
    private $statusCode = 500;
    private $responseMessage;
    private $response;
    private $errors = [];

    #region [Creates a new user account using the provided user data by an admin.]
    /**
     *
     * This method creates a new user account using the provided user data. It is typically used by an admin to register a new user into the system.
     *
     * @param array $userData An associative array containing the user data for the new user account. It typically includes fields such as 'name', 'email', 'password', etc.
     *
     * @return string JSON-encoded string representing the result of the create operation. It typically includes a success or error message, along with any additional data such as the newly created user's ID.
     */
    public function userAdd($request)
    {
        $this->isAllowed('create_manger_user');

        $validationRules = [
            'username' => ['required' => true, 'type', 'username'],
            'email' => ['required' => true, 'type', 'email'],
            'new_password' => ['required' => true, 'type', 'password'],
            'confirm_password' => ['required' => true, 'type', 'password'],
            'activation' => ['required' => true],
            'group_id' => ['required' => true],
            'firstname' => [],
            'lastname' => [],
        ];

        $data = $this->validates($request->data, $validationRules);
        if (is_array($data)) return $data['res'];

        $userModel = new UserModel;
        $userModel->conditions = [
            ['user_username', '=', $data->username],
            ['OR', 'user_email', '=', $data->email],
        ];

        if ($userModel->find() || $data->new_password != $data->confirm_password) :
            $this->errors = [
                "User already exists. Please choose a different username.",
                "Password confirmation does not match. Please double-check and try again."
            ];
        else :

            $password = password_hash($data->new_password, PASSWORD_BCRYPT); // Hash the password

            $userModel = new UserModel;
            $userModel->column->user_guide = $this->guide('U');
            $userModel->column->user_type = 'ACCOUNT';
            $userModel->column->user_roles = 'USER';
            $userModel->column->user_password = $password;
            $userModel->column->user_username = $data->username;
            $userModel->column->user_email = $data->email;
            $userModel->column->user_firstname = $data->firstname;
            $userModel->column->user_lastname = $data->lastname;
            $userModel->column->user_activation = $data->activation;
            $userModel->column->user_group_id = $data->group_id;

            $newUser = $userModel->save();
            if ($newUser) :
                // Coming Soon to add booking feature
                if (PRODUCTION) :
                    $emailInfo = (object) [
                        "email" =>  $newUser->user_email,
                        "template" => "newuser",
                        "type" => "NEWUSER",
                        "subject" => "Welcome $newUser->user_username,",
                        "name" => $newUser->user_username,
                    ];

                    if (MailerLoader::send($emailInfo)) :
                        RecordLoader::activity("sent email to {$newUser->user_email}", 1);
                    else :
                        RecordLoader::log("sent mail", 500, "sd6sf9a78sdf69B");
                    endif;
                endif;

                $this->responseMessage = 'user created!';
                $this->response = $newUser;
            endif;


        endif;

        return new JsonResponse([
            'errors' => $this->errors,
            'message' => $this->responseMessage,
            'response' => $this->response,
        ]);
    }
    #endregion

    /**
     * Updates the user data for an existing user account.
     *
     * This method updates the user data for an existing user account based on the provided user ID and updated data. It is typically used to modify information such as name, email, password, etc.
     *
     * @param int $userId The ID of the user whose data is being updated.
     * @param array $updatedData An associative array containing the updated user data. It typically includes fields such as 'name', 'email', 'password', etc.
     *
     * @return string JSON-encoded string representing the result of the update operation. It typically includes a success or error message.
     */
    public function userUpdate($request)
    {
        $this->isAllowed('update_manger_user');

        $validationRules = [
            'username' => ['required' => true, 'type', 'username'],
            'email' => ['required' => true, 'type', 'email'],
            'activation' => ['required' => true],
            'group_id' => ['required' => true],
            'new_password' => [],
            'confirm_password' => [],
            'current_password' => [],
            'firstname' => [],
            'lastname' => [],
        ];

        $data = $this->validates($request->data, $validationRules);
        if (is_array($data)) return $data['res'];


        $userModel = new UserModel;
        $userModel->conditions = [
            ['user_uid', '=', $request->routeParams->user]
        ];
        $user = $userModel->find();

        if (!$user) :
            $this->errors = [
                "Please double-check and try again."
            ];
        else :

            $userModel = new UserModel;
            $userModel->conditions = [
                ['user_uid', '=', $request->routeParams->user]
            ];

            if (isset($data->current_password) && password_verify($data->current_password, $user->user_password) && $data->new_password === $data->confirm_password) :
                $password = password_hash($data->new_password, PASSWORD_BCRYPT); // Hash the password
                $userModel->column->user_password = $password;
            endif;

            $userModel->column->user_username = $data->username;
            $userModel->column->user_email = $data->email;
            $userModel->column->user_firstname = $data->firstname;
            $userModel->column->user_lastname = $data->lastname;
            $userModel->column->user_activation = $data->activation;
            $userModel->column->user_group_id = $data->group_id;

            $updateUser = $userModel->save();
            if ($updateUser) :
                $this->responseMessage = 'user created!';
                $this->response = $updateUser;
            endif;

        endif;

        return new JsonResponse([
            'errors' => $this->errors,
            'message' => $this->responseMessage,
            'response' => $this->response,
        ]);
    }

    /**
     * Deletes a user account based on the provided user ID.
     *
     * This method deletes a user account based on the provided user ID. It typically removes all data associated with the user from the system.
     *
     * @param int $userId The ID of the user account to be deleted.
     *
     * @return string JSON-encoded string representing the result of the delete operation. It typically includes a success or error message.
     */
    public function userDelete($request)
    {
        $this->isAllowed('delete_manger_user');
        $ids = explode(',', $request->routeParams->user);
        foreach ($ids as $key => $id) :
            $userModel = new UserModel;
            $userModel->conditions = [
                ['user_uid', '=', $id]
            ];
            $user = $userModel->find();

            if (!$user) :
                $this->errors = [
                    "User is not Existed!"
                ];
            else :
                $userDeleted = $userModel->delete();
                if ($userDeleted) :
                    $this->response = $userDeleted;
                else :
                    $this->errors = [
                        "user is not deleted!",
                    ];
                endif;
            endif;
        endforeach;

        return new JsonResponse([
            'errors' => $this->errors,
            'message' => $this->responseMessage,
            'response' => $this->response,
        ]);
    }

    public function cronJobs()
    {
        $db = new DatabaseHandler();
        $conn = $db->connect();

        // Query to check if the current day is between start and end dates
        $query = "SELECT * FROM reminder_calendar WHERE
              (
            (MONTH(`calendar_date_start`) = MONTH(CURRENT_DATE) AND DAY(`calendar_date_start`) <= DAY(CURRENT_DATE) AND DAY(`calendar_date_end`) >= DAY(CURRENT_DATE))
            OR
            (MONTH(`calendar_date_end`) = MONTH(CURRENT_DATE) AND DAY(`calendar_date_start`) <= DAY(CURRENT_DATE) AND DAY(`calendar_date_end`) >= DAY(CURRENT_DATE))
            OR
            (MONTH(`calendar_date_start`) < MONTH(CURRENT_DATE) AND MONTH(`calendar_date_end`) > MONTH(CURRENT_DATE))
        ) AND calendar_status = 'RUNNING' AND  calendar_deleted_at is NULL";

        // Prepare the query
        $stmt = $conn->prepare($query);

        // Execute the query
        $stmt->execute();
        // Fetch the result if needed
        $rows = $stmt->fetchAll(PDO::FETCH_OBJ);

        if (count($rows) > 0) :

            foreach ($rows as $reminder) :
                $mailHistory = new MailerModel;
                $mailHistory->conditions = [
                    ['hmail_own', '=', $reminder->calendar_uid],
                    ['hmail_status', '=', 1]
                ];
                $mail = $mailHistory->find();

                if (!$mail) :
                    $userModel = new UserModel;
                    $userModel->conditions = [
                        ['user_uid', '=', $reminder->calendar_owner]
                    ];
                    $user = $userModel->find();

                    // if (PRODUCTION) :
                    $emailInfo = (object) [
                        "email" =>  $user->user_email,
                        "template" => "reminder",
                        "type" => "REMINDER",
                        "subject" => "Erinnerungskalender",
                        "name" => $user->user_username,
                    ];

                    if (!empty($reminder->calendar_image)) :
                        $emailInfo->image = $reminder->calendar_image;
                    endif;

                    if (!empty($reminder->calendar_message)) :
                        $emailInfo->message = $reminder->calendar_message;
                    endif;

                    if (MailerLoader::send($emailInfo, 'en', $reminder->calendar_uid)) :
                        RecordLoader::activity("sent email to {$user->user_email}", 1);
                    else :
                        RecordLoader::log("sent mail", 500, "sd6sf9a78sdf69B");
                    endif;

                // endif;
                endif;
            endforeach;
        endif;

        return new JsonResponse([]);
    }
}
