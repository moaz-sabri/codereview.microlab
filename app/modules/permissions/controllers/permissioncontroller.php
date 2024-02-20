<?php

namespace App\Modules\Permissions\Controllers;

use App\Bootstrap\Routes;
use App\Bootstrap\Request;
use App\Modules\Permissions\Models\{
    PermissionGroupsModel,
    PermissionModel,
    UserGroupModel
};
use App\Modules\Permissions\Setting as PermissionSetting;

use App\Modules\Records\Loader\RecordLoader;
use App\Utilities\Utilitie;

class PermissionController extends Utilitie
{
    function dashboard()
    {
        if (!PermissionSetting::permission('dashboard')) :
            $this->notAllowd();
        endif;

        $groupModel = new PermissionGroupsModel();
        $groupModel->count = 50;
        $groupModel->pagination = true;
        $groupModel->merge = [
            [
                "key" => "owner",
                "table" => "`" . UserGroupModel::getTableName() . "` AS `users`",
                "type" => "LEFT",
                "on" => "users.group_id = permissiongroups.uid",
                "columns" => "COUNT(DISTINCT users.group_id) AS user_count"
            ]
        ];

        $result = $groupModel->group();

        return (object) [
            "obj" => $result,
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
        if (!PermissionSetting::permission('create')) :
            $this->notAllowd();
        endif;

        $groupModel = new PermissionGroupsModel();

        return (object) [
            "group" => $groupModel->column,
            "view" => "editor",
            "meta" => [
                "title" => PROJECT_NAME
            ]
        ];
    }

    function create(Request $request)
    {
        if (!PermissionSetting::permission('create')) :
            $this->notAllowd();
        endif;

        $validationRules = [
            'name' => ['required' => true, 'min_length' => 4, 'max_length' => 33],
            'description' => ['max_length' => 255],
        ];
        $groupModel = new PermissionGroupsModel();
        $permissionModel = new PermissionModel();

        $validation = $this->validate($request->data, $validationRules);
        $errors = $this->validateFormData($validation);
        if (!empty($errors)) $this->back(400, $errors);

        $data = $validation['validated'];

        $groupModel->column->guide =  $this->guide("G");
        $groupModel->column->name = $data->name;
        $group = $groupModel->save();

        if ($group) :

            // Load the routing configuration
            $setting = new Routes($this->parameters);
            foreach ($setting->modules as $name => $value) {
                $actions = $request->data->$name ?? [-1];
                $permissionModel = new PermissionModel();
                $permissionModel->column->group_id =  $group->uid;
                $permissionModel->column->guide =  $this->guide("P");
                $permissionModel->column->module = $name;
                $permissionModel->column->action = implode(',', $actions);
                $permissionModel->save();
            }

            RecordLoader::history("New group permission has been created successfully. You can now assign this permission to specific user groups to manage access and privileges.", 1);
            $this->ok("/dashboard/permission");

        endif;


        RecordLoader::history("Error: Unable to create the new group permission. We're working to fix this issue.", 0);

        $this->back(500, 'Oops, an error occurred while creating the new group permission. Our team is aware of the issue and is actively working on a resolution. We appreciate your patience and understanding during this process.', 'danger');
    }

    function edit()
    {
        if (!PermissionSetting::permission('update')) :
            $this->notAllowd();
        endif;

        $groupModel = new PermissionGroupsModel();
        $permissionModel = new PermissionModel();
        if (isset($this->parameters->target) && preg_match($groupModel->pattern, $this->parameters->target)) :
            $groupModel->conditions = [["guide", "=", $this->parameters->target]];
            $group = $groupModel->find();

            if (!isset($group) || is_null($group)) $this->bad('404', 'Not Found');

            $permissionModel->count = 50;
            $permissionModel->conditions = [["group_id", "=", $group->uid]];
            $permissions = $permissionModel->get();

            if (!isset($permissions) || is_null($permissions)) $this->bad('404', 'Not Found');
            $selected_permission = [];

            foreach ($permissions as $permission) :
                if ($permission->action > 0) :
                    $selected_permission[$permission->module] = explode(',', $permission->action);
                else :
                    $selected_permission[$permission->module] = [];
                endif;
            endforeach;

            $group->permission = $selected_permission;

            return (object) [
                "group" => $group,
                "view" => "editor",
                "meta" => [
                    "title" => PROJECT_NAME
                ]
            ];
        else :
            $this->bad(404, 'NOT FOUND');
        endif;
    }

    function update(Request $request)
    {
        if (!PermissionSetting::permission('update')) :
            $this->notAllowd();
        endif;

        $groupModel = new PermissionGroupsModel();

        if (isset($this->parameters->target) && preg_match($groupModel->pattern, $this->parameters->target)) :
            $validationRules = [
                'name' => ['required' => true, 'min_length' => 4, 'max_length' => 33],
                'description' => ['max_length' => 255],
            ];

            $validation = $this->validate($request->data, $validationRules);
            $errors = $this->validateFormData($validation);
            if (!empty($errors)) $this->back(400, $errors);

            $data = $validation['validated'];

            $groupModel->conditions = [["guide", "=", $this->parameters->target]];
            $group = $groupModel->find();

            if ($group) :

                $groupModel->conditions = [["guide", "=", $this->parameters->target]];
                $groupModel->column->name = $data->name;
                $groupModel->save();

                // Load the routing configuration
                $setting = new Routes($this->parameters);
                foreach ($setting->modules as $name => $value) {
                    $actions = $request->data->$name ?? [-1];

                    $pModel = new PermissionModel();
                    $pModel->conditions = [["group_id", "=", $group->uid], ["AND", "module", "=", $name]];
                    $pModel->column->action = implode(',', $actions);

                    if (!$pModel->save()) :
                        $pModel = new PermissionModel();
                        $pModel->column->group_id =  $group->uid;
                        $pModel->column->guide =  $this->guide("P");
                        $pModel->column->module = $name;
                        $pModel->column->action = implode(',', $actions);
                        $pModel->save();
                    endif;
                }
                $message = "New group permission has been created successfully. You can now assign this permission to specific user groups to manage access and privileges.";

                RecordLoader::history($message, 1);
                $this->back(200, $message, "success");

            endif;
        endif;

        RecordLoader::history("Error: Unable to update the group permission. We're working to fix this issue.", 0);

        $this->back(500, 'Oops, an error occurred while updateing the group permission. Our team is aware of the issue and is actively working on a resolution. We appreciate your patience and understanding during this process.', 'danger');
    }

    function switch(Request $request)
    {
        if (!PermissionSetting::permission('switch')) :
            $this->notAllowd();
        endif;

        // update Single row
        $caseModel = new PermissionGroupsModel();
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
            $caseModel = new PermissionGroupsModel();
            $caseModel->conditions = [['guide', "=", $row]];
            $col = $data->scope;
            $caseModel->column->$col = $data->switch;

            if ($caseModel->save()) :
                $message = 'Successfully completed!';
                $color = 'success';
                $code = 200;
                RecordLoader::history($message, 1);
            else :
                $message = "Some wourn whan update $row !";
                $color = 'danger';
                $code = 204;

                RecordLoader::history($message, 0);
                RecordLoader::log($message, 500, "s7f6sa7f6");
            endif;
        }

        $this->back($code ?? 404, $message ?? 'Someone wrong!', $color ?? 'danger');
    }
}
