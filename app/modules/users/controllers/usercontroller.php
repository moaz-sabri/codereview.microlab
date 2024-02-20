<?php

namespace App\Modules\Users\Controllers;

use App\Bootstrap\Request;
use App\Modules\Permissions\Models\{
    PermissionGroupsModel,
    UserGroupModel
};
use App\Utilities\{
    Utilitie,
};

use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Emails\Loader\MailLoader;
use App\Modules\FileStorage\Loader\FileStorageLoader;
use App\Modules\Users\Loader\User;
use App\Modules\Records\Loader\RecordLoader;
use App\Modules\Users\Models\UserModel;
use App\Modules\Users\Setting as UserSetting;

class UserController extends Utilitie
{

    function dashboard()
    {
        if (!UserSetting::permission('dashboard')) :
            $this->notAllowd();
        endif;

        $userModel = new UserModel();
        $userModel->pagination = true;
        $userModel->except = ["uid", "password", "type"];
        $userModel->merge = [
            [
                "key" => "ug",
                "table" => "`" . UserGroupModel::getTableName() . "` AS ug",
                "type" => "LEFT",
                "on" => UserModel::getTableName() . ".uid = ug.user_id",
                "columns" => (new UserGroupModel())->column
            ],
            [
                "key" => "g",
                "table" => "`" . PermissionGroupsModel::getTableName() . "` AS g",
                "type" => "LEFT",
                "on" => "ug.group_id = g.uid",
                "columns" => (new PermissionGroupsModel())->column
            ],
        ];

        $obj = $userModel->join();

        return (object) [
            "obj" => $obj,
            "view" => "dashboard",
            "meta" => [
                "title" => PROJECT_NAME,
            ],
            "bscripts" => [
                "/public/static/js/custom/table-selector.js"
            ]
        ];
    }

    function store()
    {
        if (!UserSetting::permission('create')) :
            $this->notAllowd();
        endif;

        $userModel = new UserModel();
        $groupModel = new PermissionGroupsModel();
        $group = $groupModel->get();

        return (object) [
            "groups" => $group,
            "user" => $userModel->column,
            "view" => "store",
            "meta" => [
                "title" => PROJECT_NAME
            ]
        ];
    }

    function create(Request $request)
    {
        if (!UserSetting::permission('create')) :
            $this->notAllowd();
        endif;

        $validationRules = [
            'name' => ['required' => true, 'type' => "username"],
            'group_id' => ['required' => true, 'type' => "int"],
            'email' => ['required' => true, 'type' => 'email', 'min_length' => 2, 'max_length' => 50],
            'password' => ['required' => true, 'type' => 'password'],
            'activation' => ['required' => true, 'min_length' => 4, 'max_length' => 11],
        ];

        $validation = $this->validate($request->data, $validationRules);
        $errors = $this->validateFormData($validation);
        if (!empty($errors)) $this->back(400, $errors);

        $data = $validation['validated'];

        $userModel = new UserModel();

        $data->password = password_hash($data->password, PASSWORD_BCRYPT); // Hash the password
        $data->name = str_replace(' ', '_', strtolower($this->FILTER_STRING($data->name)));

        $userModel->column->guide = $this->guide("U");
        $userModel->column->name = $data->name;
        $userModel->column->email = $data->email;
        $userModel->column->password = $data->password;
        $userModel->column->activation = $data->activation;

        $user = $userModel->save();
        if ($user) :
            $group = new UserGroupModel;
            $group->column->guide = $this->guide("S");
            $group->column->user_id = $user->uid;
            $group->column->group_id = $data->group_id;

            if ($group->save()) :
                $message = "New user {$data->name} has been created. Welcome to our community!";

                if (PRODUCTION) :
                    $emailInfo = (object) [
                        "email" =>  $data->email,
                        "template" => "newuser",
                        "type" => "NEWUSER",
                        "subject" => "Welcome to JouDev - Confirm Your Email Address",
                        "name" => $data->name,
                        "confirm_url" => DOMAIN_SOURCE . "confirm/{$user->guide}"
                    ];

                    if (MailLoader::send($emailInfo)) :
                        RecordLoader::history("sent email to {$data->email}", 1);
                    else :
                        RecordLoader::log("sent mail", 500, "sd6sf9a78sdf69B");
                    endif;
                endif;

                RecordLoader::history($message, 1);
                $this->ok("/dashboard/user", $message);
            endif;
        endif;

        $message = "Oops, there was an error while creating the new user. Please double-check the provided data or try again later. If the issue persists, please contact our support team";

        RecordLoader::history($message, 0);
        $this->back(204, $message, 'danger');
    }

    function edit()
    {
        if (!UserSetting::permission('update')) :
            $this->notAllowd();
        endif;

        $userModel = new UserModel();
        if (isset($this->parameters->target) && preg_match($userModel->pattern, $this->parameters->target)) :
            $userModel->conditions = [["guide", "=", $this->parameters->target]];
            $userModel->merge = [
                [
                    "key" => "ug",
                    "table" => "`" . UserGroupModel::getTableName() . "` AS ug",
                    "type" => "LEFT",
                    "on" => UserModel::getTableName() . ".uid = ug.user_id",
                    "columns" => (new UserGroupModel())->column
                ],
                [
                    "key" => "g",
                    "table" => "`" . PermissionGroupsModel::getTableName() . "` AS g",
                    "type" => "LEFT",
                    "on" => "ug.group_id = g.uid",
                    "columns" => (new PermissionGroupsModel())->column
                ],
            ];
            $result = $userModel->findJoin();

            if (!$result) $this->bad('404', 'Not Found');

            $group = new PermissionGroupsModel();
            $groups = $group->get();

            return (object) [
                "obj" => $result,
                "groups" => (object) $groups,
                "view" => "editor",
                "meta" => [
                    "title" => PROJECT_NAME
                ]
            ];
        endif;
    }

    function update(Request $request)
    {
        if (!UserSetting::permission('update')) :
            $this->notAllowd();
        endif;

        $userModel = new UserModel();
        if (isset($this->parameters->target) && preg_match($userModel->pattern, $this->parameters->target)) :

            $validationRules = [
                'name' => ['required' => true, 'type' => "username"],
                'email' => ['required' => true, 'type' => 'email', 'min_length' => 2, 'max_length' => 50],
                'group_id' => ['required' => true],
                'password' => ['type' => 'password'],
                'roles' => ['min_length' => 2, 'max_length' => 50],
            ];

            $validation = $this->validate($request->data, $validationRules);
            $errors = $this->validateFormData($validation);
            if (!empty($errors)) $this->back(400, $errors);

            $data = $validation['validated'];

            $userModel->conditions = [["guide", "=", $this->parameters->target]];
            $user = $userModel->find();

            if (isset($data->password) && !empty($data->password)) :
                $data->password = password_hash($data->password, PASSWORD_BCRYPT); // Hash the password
                $userModel->column->password = $data->password;
            endif;

            $data->name = str_replace(' ', '_', strtolower($this->FILTER_STRING($data->name)));
            $userModel->column->name = $data->name;

            $userModel->column->email = $data->email;

            $userModel->column->roles = $data->roles ?? 'none';

            if ($data->group_id) :
                $group = new UserGroupModel;
                $group->conditions = [["user_id", "=", $user->uid]];
                $group->column->group_id = $data->group_id;

                if (!$group->save()) :
                    $group = new UserGroupModel;
                    $group->column->guide = $this->guide("S");
                    $group->column->user_id = $user->uid;
                    $group->column->group_id = $data->group_id;
                    $group->save();
                endif;
            endif;

            if ($userModel->save()) :
                $message = "Your user information has been updated successfully";
                $color = 'success';
                $code = 200;

                RecordLoader::history($message, 1);
            else :
                $message = "Error: Unable to update your user information. Please check the provided data or try again later.";

                RecordLoader::history($message, 0);
            endif;
        endif;

        $this->back($code ?? 204, $message ?? 'Someone wrong!', $color ?? 'danger');
    }

    function destroy()
    {
        if (!UserSetting::permission('delete')) :
            $this->notAllowd();
        endif;

        $userModel = new UserModel();
        $guide = $this->parameters->target;

        if (isset($guide) && preg_match($userModel->pattern, $guide)) :
            $userModel->conditions = [["guide", "=", $guide]];

            if (CryptLoader::decrypt('role') != MASTER) :
                $userModel->conditions[] = ["owner", "=", CryptLoader::decrypt('uid')];
            endif;

            if ($userModel->delete()) :
                $message = "User {$guide} has been deleted successfully.";
                $color = 'success';
                $code = 200;
                RecordLoader::history($message, 1);
            else :
                $message = "Error: Unable to delete the user. Please try again or contact support.";
                RecordLoader::history($message, 0);
            endif;
        endif;

        $this->back($code ?? 204, $message ?? 'Someone wrong!', $color ?? 'danger');
    }

    function switch(Request $request)
    {
        if (!UserSetting::permission('switch')) :
            $this->notAllowd();
        endif;

        // update Single row
        $caseModel = new UserModel();
        if (isset($this->parameters->target) && preg_match($caseModel->pattern, $this->parameters->target)) :
            $validationRules = [
                'scope' => ['required' => true, 'min_length' => 3, 'max_length' => 33],
                'switch' => ['required' => true, 'min_length' => 3, 'max_length' => 33],
            ];

        else :
            $validationRules = [
                'scope' => ['required' => true, 'min_length' => 3, 'max_length' => 33],
                'switch' => ['required' => true, 'min_length' => 3, 'max_length' => 33],
                'selected' => ['required' => true, 'type' => 'array', "return" => "array"],
            ];

        endif;

        $validation = $this->validate($request->data, $validationRules);
        $errors = $this->validateFormData($validation);
        if (!empty($errors)) $this->back(400, $errors);

        $data = $validation['validated'];


        if (!isset($data->selected)) $data->selected = [$this->parameters->target];

        foreach ($data->selected as $row) {
            $caseModel = new UserModel();
            $caseModel->conditions = [['guide', "=", $row]];
            $col = $data->scope;
            $caseModel->column->$col = $data->switch;

            if ($caseModel->save()) :
                $message = 'Successfully completed!';
                $color = 'success';
                $code = 200;
                RecordLoader::history($message, 1);
            else :
                $message = "Some wourn whan update $row!";
                $color = 'danger';
                $code = 204;

                RecordLoader::history($message, 0);
                RecordLoader::log($message, 500, "s7f6sa7f6");
            endif;
        }

        $this->back($code ?? 404, $message ?? 'Someone wrong!', $color ?? 'danger');
    }

    function profile(User $currentuser)
    {
        if (!isset($_SESSION[SESSION])) :
            $this->ok('/');
        endif;

        $userModel = new UserModel();

        $userModel->conditions = [["uid", "=", $currentuser->uid]];
        $result = $userModel->find();

        if (is_null($result) || !$result) $this->bad('404', 'Not Found');

        return (object) [
            "obj" => $result,
            "view" => "profile",
            "meta" => [
                "title" => PROJECT_NAME
            ]
        ];
    }

    function update_profile(Request $request, User $currentuser)
    {
        if (CryptLoader::decrypt('token')) :

            $validationRules = [
                'name' => ['required' => true, 'type' => "username"],
                'email' => ['required' => true, 'type' => 'email', 'min_length' => 2, 'max_length' => 50],
                'firstname' => ['min_length' => 2, 'max_length' => 50],
                'lastname' => ['min_length' => 2, 'max_length' => 50],
                'oldpassword' => ['type' => 'password'],
                'password' => ['type' => 'password'],
            ];

            $validation = $this->validate($request->data, $validationRules);
            $errors = $this->validateFormData($validation);
            if (!empty($errors)) $this->back(400, $errors);

            $data = $validation['validated'];

            $userModel = new UserModel();
            $userModel->conditions = [["uid", "=", $currentuser->uid]];
            $user = $userModel->find();
            if (!$user) $this->bad(404, $errors);

            if (!empty($_FILES['file']['name'])) :
                // Loop through each file
                $loader = new FileStorageLoader;
                $loader->file = [
                    "size" => [$_FILES['file']['size']],
                    "type" => [$_FILES['file']['type']],
                    "name" => [$_FILES['file']['name']],
                    "tmp_name" => [$_FILES['file']['tmp_name']],
                    "size" => [$_FILES['file']['size']],
                ];

                $loader->location = "uploads/{$currentuser->guide}/avatar" . DS;

                $upload = $loader->upload();


                if ($upload) :
                    $userModel->column->avatar  =  $upload->file;;
                endif;
            endif;

            $message = "Error: Profile update failed. Please double-check the provided data or try again later.";

            if (
                isset($data->oldpassword) &&
                isset($data->password) &&
                !empty($data->password) &&
                !empty($data->oldpassword) &&
                $data->oldpassword !== $data->password
            ) :
                if ($data->password != $data->oldpassword) :

                    if (password_verify($data->oldpassword, $user->password)) :
                        $userModel->column->password = password_hash($data->password, PASSWORD_BCRYPT); // Hash the password
                    else :
                        $this->bad(404, $message);
                    endif;
                else :
                    $this->bad(404, $message);
                endif;
            endif;

            if (isset($data->firstname) && !empty($data->firstname)) :
                $userModel->column->firstname = $data->firstname;
            endif;
            if (isset($data->lastname) && !empty($data->lastname)) :
                $userModel->column->lastname = $data->lastname;
            endif;

            $userModel->conditions = [["uid", "=", $user->uid]];
            $userModel->column->name = str_replace(' ', '_', strtolower($this->FILTER_STRING($data->name)));
            $userModel->column->email = $data->email;

            if ($userModel->save()) :
                $message = "Your profile has been successfully updated.";
                $color = 'success';
                $code = 200;
                RecordLoader::history($message, 1);
            else :
                $message = "Error: Profile update failed. Please double-check the provided data or try again later.";
                RecordLoader::history($message, 0);
            endif;
        endif;

        $this->back($code ?? 500, $message ?? 'Someone wrong!', $color ?? 'danger');
    }
}
