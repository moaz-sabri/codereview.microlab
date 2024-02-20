<?php

namespace App\Modules\FileStorage\Controllers;

use App\Bootstrap\Request;
use App\Modules\FileStorage\Models\FileStorageModel;
use App\Modules\FileStorage\Setting as FileStorageSetting;
use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Records\Loader\RecordLoader;
use App\Utilities\Utilitie;

class FileStorageController extends Utilitie
{
    function dashboard()
    {

        if (!FileStorageSetting::permission('dashboard')) :
            $this->notAllowd();
        endif;

        $filestorage = new FileStorageModel();

        $filestorage->count = 3;
        $filestorage->pagination = true;
        // $filestorage->conditions = [["type", "=", "DOC"]];
        $result = $filestorage->get();

        return (object) [
            "obj" => $result,
            "view" => "index",
            "meta" => [
                "title" => PROJECT_NAME,
            ],
            "bscripts" => [
                "table-selector" => "/public/static/js/custom/table-selector.js",
                "file-storage" => "/public/static/js/custom/file-storage.js"
            ]
        ];
    }

    function switch(Request $request)
    {
        if (!FileStorageSetting::permission('switch')) :
            $this->notAllowd();
        endif;

        // update Single row
        $caseModel = new FileStorageModel();
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
            $caseModel = new FileStorageModel();
            $caseModel->conditions = [['guide', "=", $row]];
            $col = $data->scope;
            $caseModel->column->$col = $data->switch;

            if (!$caseModel->save()) :
                $message = "Some wourn whan update $row!";

                RecordLoader::history($message, 0);
                RecordLoader::log($message, 500, "s7f6sa7f6");
            endif;

            $message = 'Successfully completed!';
            $color = 'success';
            $code = 200;
            RecordLoader::history($message, 1);
        }

        $this->back($code ?? 404, $message ?? 'Someone wrong!', $color ?? 'danger', "/dashboard/filestorage");
    }

    function delete()
    {
        if (!FileStorageSetting::permission('delete')) :
            $this->notAllowd();
        endif;

        $storage = new FileStorageModel();
        $guide = $this->parameters->target;

        if (isset($guide) && preg_match($storage->pattern, $guide)) :
            $storage->conditions = [["guide", "=", $guide]];
            
            if (CryptLoader::decrypt('role') != MASTER) :
                $storage->conditions[] = ["owner", "=", CryptLoader::decrypt('uid')];
            endif;

            if ($storage->delete()) :
                $message = "File {$guide} has been deleted successfully.";
                $color = 'success';
                $code = 200;
                RecordLoader::history($message, 1);
            else :
                $message = "Error: Unable to delete the File. Please try again or contact support.";
                RecordLoader::history($message, 0);
            endif;
        endif;

        $this->back($code ?? 204, $message ?? 'Someone wrong!', $color ?? 'danger');
    }
}
