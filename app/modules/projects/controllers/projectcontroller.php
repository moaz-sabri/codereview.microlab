<?php

namespace App\Modules\Projects\Controllers;

use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Projects\Setting as ProjectSetting;
use App\Modules\Projects\Loader\ProjectLoader;
use App\Modules\Projects\Models\ProjectModel;
use App\Modules\Projects\Models\ProjectTagsModel;
use App\Modules\Records\Loader\RecordLoader;
use App\Utilities\Utilitie;

class ProjectController extends Utilitie
{
    function dashboard()
    {

        if (!ProjectSetting::permission('dashboard')) :
            $this->notAllowd();
        endif;

        $filestorage = new ProjectModel();

        $filestorage->count = 10;
        $filestorage->pagination = true;
        $result = $filestorage->get();

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

    function editor()
    {
        if (!ProjectSetting::permission('update')) :
            $this->notAllowd();
        endif;
        
        if (isset($this->parameters->target)) :
            $guide = $this->parameters->target;
        endif;
        
        $projectModel = new ProjectModel();
        
        
        if (isset($guide) && preg_match($projectModel->pattern, $guide)) :
            $loader = new ProjectLoader;
            
            $projectModel->merge = $loader->getFullData();
            $projectModel->conditions = [["guide", "=", $guide]];
            
            $result = $projectModel->findJoin();
            
            if (!$result) $this->back(404, 'NOT FOUND');
            
            $result->projects_content = $loader->readContent($result->projects_content);
            
            $tagsModels = new ProjectTagsModel;
            $tagsModels->conditions = [["project_id", "=", $result->projects_uid]];
            $tags = $tagsModels->get();
            if ($tags) :
                $tags_name = '';
                foreach ($tags as $key => $tag) {
                    $tags_name .= $tag->name . ',';
                }
                $result->tags_name = trim($tags_name, ",");
            endif;
            
            $thumbnail = $loader->getFiles($result->projects_uid, "THUMBNAIL");
            $result->thumbnail = $thumbnail['file'];
            $result->thumbnail_preview = $thumbnail['file_preview'];
            
            $gallery = $loader->getFiles($result->projects_uid, "GALLERY");
            $result->gallery = $gallery['file'];
            $result->gallery_preview = $gallery['file_preview'];
        else :

            $projectModel->column->guide = null;
            $projectModel->column->gallery = null;
            $projectModel->column->gallery_preview = (object)[];
            $projectModel->column->thumbnail = null;
            $projectModel->column->thumbnail_preview = (object)[];
            $result = (object) $projectModel->column;
        endif;

        return (object) [
            "obj" => $result,
            "view" => "editor",
            "meta" => [
                "title" => PROJECT_NAME,
            ],
            "styles" => [
                "quill-bubble" => "/public/static/editor/quill.bubble.css",
                "quill-snow" => "/public/static/editor/quill.snow.css",
                "editor" => "/public/static/editor/editor.css"
            ],
            "tscripts" => [
                "quill" => "/public/static/editor/quill.js",
            ],
            "bscripts" => [
                "tableSelector" => "/public/static/js/custom/table-selector.js",
                "projectEditor" => "/public/static/js/custom/project-editor.js",
                "fileStorager" => "/public/static/js/custom/file-storage.js",
                "editor" => "/public/static/editor/editor.js"
            ]
        ];
    }
}
