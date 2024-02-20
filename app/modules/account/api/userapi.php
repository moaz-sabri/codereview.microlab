<?php

namespace App\Modules\Account\Api;

use App\Bootstrap\JsonResponse;
use App\Bootstrap\Web;
use App\Modules\Account\Model\UserModel;
use App\Utilities\Utilitie;

class UserApi extends Utilitie
{
    private $statusCode = 500;
    private $responseMessage;
    private $response;
    private $errors = [];

    #region [Updates the profile data of a user based on the provided request data and returns the result as JSON.]
    /**
     *
     * This method updates the profile data of a user based on the provided request data. It typically updates information such as name, email, or any other profile-related data.
     *
     * @param mixed $request The request data containing the updated user profile information.
     *
     * @return string JSON-encoded string representing the result of the update operation. It typically includes a success or error message.
     */
    public function update($request)
    {
        $this->hasAuth();

        $validationRules = [
            'username' => ['required' => true, 'type' => "username"],
            'firstname' => ['max_length' => 55],
            'lastname' => ['max_length' => 55],
            'new_password' => [],
            'confirm_password' => [],
            'current_password' => [],
        ];

        $data = $this->validates($request->data, $validationRules);
        if (is_array($data)) return $data['res'];

        $userModel = new UserModel();
        $userModel->conditions = [['user_uid', '=', $request->user->uid]];
        $user = $userModel->find();

        if ($user) :
            $userModel->column->user_username = $data->username;
            $userModel->column->user_firstname = $data->firstname;
            $userModel->column->user_lastname = $data->lastname;

            if (isset($data->current_password) && password_verify($data->current_password, $user->user_password) && $data->new_password === $data->confirm_password) :
                $password = password_hash($data->new_password, PASSWORD_BCRYPT); // Hash the password
                $userModel->column->user_password = $password;
            endif;

            if ($userModel->save()) :
                $this->statusCode = 200;
                $this->responseMessage = 'updated user';
            endif;
        endif;

        return new JsonResponse([
            'message' => $this->responseMessage,
            'callback' => Web::getPath('get_profile'),
        ], $this->statusCode);
    }
    #endregion

    // TODO
    #region [Deletes the user profile based on the provided user ID.]
    /**
     * This method deletes the profile of a user based on the provided user ID. It typically removes all data associated with the user from the system.
     *
     * @param int $userId The ID of the user whose profile should be deleted.
     *
     * @return string JSON-encoded string representing the result of the delete operation. It typically includes a success or error message.
     */
    public function delete($request)
    {
        $this->hasAuth();

        return new JsonResponse([
            'message' => $this->responseMessage,
            'callback' => Web::getPath('get_home'),
        ], $this->statusCode);
    }
    #endregion
}
