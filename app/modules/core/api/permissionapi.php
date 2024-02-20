<?php

namespace App\Modules\Core\Api;

use App\Bootstrap\JsonResponse;
use App\Modules\Core\Loader\PermissionLoader;
use App\Modules\Core\Model\PermissionGroupsModel;
use App\Utilities\Utilitie;

class PermissionApi extends Utilitie
{
    private $statusCode = 500;
    private $responseMessage;
    private $response;
    private $errors = [];

    /**
     * Creates a new group and sets permissions for the group based on the provided POST data.
     *
     * This method creates a new group in the system and sets permissions for the group based on the provided POST data. It typically involves extracting the group name and permissions from the POST request.
     *
     * @param array $postData An associative array containing the POST data. It should include keys for 'groupName' (the name of the new group) and 'permissions' (an associative array containing the permissions to be assigned to the group).
     *
     * @return string JSON-encoded string representing the result of the create operation. It typically includes a success or error message.
     */
    public function create($request)
    {
        $this->isAllowed('create_manger_permission_group');

        $validationRules = [
            'group_name' => ['required' => true, 'type' => "username"],
            'group_description' => ['max_length' => 300],
        ];

        foreach (PermissionLoader::getPermissions() as $key => $obj) :
            $validationRules[$key] = [];
        endforeach;

        $data = $this->validates($request->data, $validationRules);
        if (is_array($data)) return $data['res'];

        $groupModel = new PermissionGroupsModel();
        $groupModel->column->pgroup_guide =  $this->guide("G");
        $groupModel->column->pgroup_name = $data->group_name;
        $groupModel->column->pgroup_description = $data->group_description ?? '';
        $group = $groupModel->save();

        if ($group) :

            $updated = PermissionLoader::updatePermissions($group, $data);
            if ($updated) :
                $this->errors[] = $updated;
            endif;

        else :
            $this->errors[] = 'Cant be create a Group!';
        endif;

        if (count($this->errors) == 0) :
            $this->statusCode = 200;
        endif;

        return new JsonResponse([
            'code' => $this->statusCode,
            'errors' => $this->errors,
        ]);
    }

    /**
     * Updates the permissions for an existing group.
     *
     * This method updates the permissions for an existing group based on the provided group ID and updated permissions data. It typically involves specifying the ID of the group to be updated and the new permissions to be assigned to it.
     *
     * @param int $groupId The ID of the group whose permissions are being updated.
     * @param array $updatedPermissions An associative array containing the updated permissions data for the group. Each key represents a permission name, and its value represents the permission level (e.g., 'read', 'write', 'delete').
     *
     * @return string JSON-encoded string representing the result of the update operation. It typically includes a success or error message.
     */
    public function update($request)
    {
        $this->isAllowed('update_manger_permission_group');

        $validationRules = [
            'group_name' => ['required' => true, 'type' => "username"],
            'group_description' => ['max_length' => 300],
        ];

        foreach (PermissionLoader::getPermissions() as $key => $obj) :
            $validationRules[$key] = [];
        endforeach;

        $data = $this->validates($request->data, $validationRules);
        if (is_array($data)) return $data['res'];


        // $input = file_get_contents('php://input');
        // $data = json_decode($input, true);
        if (isset($request->routeParams->group)) :
            $uid = $request->routeParams->group;

            $groupModel = new PermissionGroupsModel();
            $groupModel->conditions = [['pgroup_uid', '=', $uid]];
            $group = $groupModel->find();

            if ($group) :
                $groupModel->column->pgroup_name = $data->group_name;
                $groupModel->column->pgroup_description = $data->group_description ?? '';
                $group = $groupModel->save();

                $updated = PermissionLoader::updatePermissions($group, $data);
                if ($updated) :
                    $this->errors[] = $updated;
                endif;

            else :
                $this->errors[] = 'Cant be create a Group!';
            endif;
        else :
            $this->errors[] = 'The Group id is not avalible';
        endif;

        if (count($this->errors) == 0) :
            $this->statusCode = 200;
        endif;

        return new JsonResponse([
            'code' => $this->statusCode,
            'errors' => $this->errors,
        ]);
    }

    /**
     * Deletes a group and its associated permissions based on the provided group ID.
     *
     * This method deletes a group and its associated permissions based on the provided group ID. It typically involves specifying the ID of the group to be deleted.
     *
     * @param int $groupId The ID of the group to be deleted.
     *
     * @return string JSON-encoded string representing the result of the delete operation. It typically includes a success or error message.
     */
    public function delete($request)
    {
        $this->isAllowed('delete_manger_permission_group');

        if (isset($request->routeParams->group)) :
            $uids = explode(',', $request->routeParams->group);

            foreach ($uids as $uid) :
                $groupModel = new PermissionGroupsModel();
                $groupModel->conditions = [['pgroup_uid', '=', $uid]];
                $group = $groupModel->find();

                if ($group) :
                    $group = $groupModel->destroy();
                    $this->statusCode = 200;
                endif;
            endforeach;
        endif;

        return new JsonResponse([
            'code' => $this->statusCode,
        ]);
    }
}
