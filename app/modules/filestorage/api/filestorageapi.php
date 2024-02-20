<?php

namespace App\Modules\FileStorage\Api;

use App\Modules\FileStorage\Loader\FileStorageLoader;
use App\Modules\FileStorage\Models\FileStorageModel;
use App\Modules\FileStorage\Setting as FileStorageSetting;
use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Users\Loader\User;
use App\Modules\Users\Models\UserModel;
use App\Utilities\Utilitie;


/**
 * FileStorageApi Class
 *
 * A class for handling API responses.
 *
 * This class provides methods to parse, validate, and format data received from an API.
 * It aims to handle API responses in a structured and organized manner.
 *
 * @category   APIHandler
 * @package    FileStorage
 * @author     Moaz Sabri
 * @version    0.1 Beta Version 
 */
class FileStorageApi extends Utilitie
{

    function uploadfile(User $currentuser)
    {
        if (!FileStorageSetting::permission('create')) :
            $this->notAllowd();
        endif;

        if (isset($_FILES['files'])) :
            $files = $_FILES['files'];
            $fileCount = count($files['name']);
            $filesUploaded = [];

            // Loop through each file
            $loader = new FileStorageLoader;
            $loader->file = $files;
            $loader->location = "uploads/{$currentuser->guide}/media" . DS;

            for ($i = 0; $i < $fileCount; $i++) :
                $loader->index = $i;

                $upload = $loader->upload();

                if ($upload) :
                    $file = new FileStorageModel;
                    $file->column->guide = $this->guide('F');
                    $file->column->owner = $currentuser->uid;
                    $file->column->path = $upload->file;
                    $file->column->name = $upload->name;
                    $file->column->size = $upload->size;
                    $file->column->extension = $upload->extension;
                    $file->column->type = '-';

                    $uploaded = $file->save();

                    if ($uploaded) :
                        $filesUploaded[] = $uploaded;
                    endif;
                endif;
            endfor;

            // Return the ID as a JSON response
            if (count($filesUploaded) >= 0) :
                return $filesUploaded;
            endif;
        endif;

        return false;
    }

    function loadfiles()
    {
        if (!FileStorageSetting::permission('preview')) :
            $this->notAllowd();
        endif;

        $filestorage = new FileStorageModel;
        $filestorage->pagination = true;
        return $filestorage->get();
    }
}
