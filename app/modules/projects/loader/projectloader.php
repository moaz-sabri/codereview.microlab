<?php

namespace App\Modules\Projects\Loader;

use App\Modules\FileStorage\Models\FileStorageModel;
use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Users\Models\UserModel;
use App\Modules\Projects\Models\{
    ProjectCategoriesModel,
    ProjectFileModel,
    ProjectMetaModel,
    ProjectModel,
    ProjectTagsModel
};
use App\Utilities\Utilitie;

class ProjectLoader extends Utilitie
{
    static function getTopics()
    {
        return (object) [
            "UNKNOWN" => "",
            "WEBSITES" => "websites",
            "PRODUCTS" => "products",
            "BLOG" => "blog",
        ];
    }

    static function getList()
    {
        $cats = new ProjectCategoriesModel;
        $cats->count = 10;

        $tags = new ProjectTagsModel;
        $tags->count = 10;

        return (object) [
            "tags" => $tags->countlist(),
            "categories" => $cats->countlist()
        ];
    }

    function rewriteContent(string $file, string $content = '')
    {

        if (empty($content)) :
            $storage =  'uploads' . DS .  CryptLoader::decrypt('guide') . DS . 'contents' . DS;

            $destination = "../storage/{$storage}";
            if (!is_dir($destination)) :
                mkdir($destination, 0777, true);
            endif;

            $content = $destination . uniqid('file_') . ".txt";
        endif;

        $file = preg_replace('/\s+/', ' ', $file);

        file_put_contents($content, $this->FILTER_FILE_SIZE($file, 50000));

        return $content;
    }

    function readContent($content)
    {
        if (file_exists($content) && filesize($content) > 10) :
            $myfile = fopen($content, "r") or die("Unable to open file!");
            $content = html_entity_decode(fread($myfile, filesize($content)));
            fclose($myfile);
        else :
            // $this->bad('404', 'Not Found');
            $content = 'Sorry, The Content is not available!';
        endif;

        return $content;
    }


    function updateFilesRelation($project, $files, $location)
    {
        $fileModel = new ProjectFileModel;
        $fileModel->conditions = [
            ["project_id", "=", $project->uid], ["AND", "location", "=", $location]
        ];
        $currentfiles = $fileModel->get();

        if ($currentfiles) :
            $thIds = array_map(function ($object) {
                return $object->file_id;
            }, (array) $currentfiles);

            $file = explode(',', $files);

            // Find elements unique to the first array
            $toDelete = array_diff($thIds, $file);

            // Find elements unique to the second array
            $toAdd = array_diff($file, $thIds);

            foreach ($toDelete as $key => $delete) {
                $fileModel = new ProjectFileModel;
                $fileModel->conditions = [
                    ["project_id", "=", $project->uid], ["AND", "location", "=", $location], ["AND", "file_id", "=", $delete]
                ];
                $fileModel->destroy();
            }
        else :
            $toAdd = explode(',', $files);
        endif;

        foreach ($toAdd as $key => $add) {
            $fileModel = new ProjectFileModel;
            $fileModel->column->guide = $this->guide('M');
            $fileModel->column->location = $location;
            $fileModel->column->project_id = $project->uid;
            $fileModel->column->file_id = $add;
            $fileModel->save();
        }
    }

    static function getFiles($id, $location)
    {
        $fileModel = new ProjectFileModel;
        $fileModel->merge = [
            [
                "key" => "file",
                "table" => "`" . FileStorageModel::getTableName() . "` AS `file`",
                "type" => "INNER",
                "on" => "`" . ProjectFileModel::getTableName() . "`.file_id = file.uid AND `" . ProjectFileModel::getTableName() . "`.project_id = {$id}",
                "columns" => "path"
            ]
        ];
        $fileModel->conditions = [
            ["project_id", "=", $id], ["location", "=", $location]
        ];
        $file = $fileModel->join();

        if ($file) :
            $thIds = array_map(function ($object) {
                return $object->projectfile_file_id;
            }, (array) $file);

            return [
                "file" => implode(',', $thIds),
                "file_preview" => $file
            ];
        else :
            return [
                "file" => '',
                "file_preview" => []
            ];
        endif;
    }

    static function getFullData()
    {
        return [
            [
                "key" => "owner",
                "table" => "`" . UserModel::getTableName() . "` AS `owner`",
                "type" => "LEFT",
                "on" => "owner.uid = `" . ProjectModel::getTableName() . "`.owner",
                "columns" => (object)["name"]
            ],
            [
                "key" => "category",
                "table" => "`" . ProjectCategoriesModel::getTableName() . "` AS `category`",
                "type" => "LEFT",
                "on" => "category.project_id = `" . ProjectModel::getTableName() . "`.uid",
                "columns" => (object)["name"]
            ],
            [
                "key" => "meta",
                "table" => "`" . ProjectMetaModel::getTableName() . "` AS `meta`",
                "type" => "LEFT",
                "on" => "meta.project_id = `" . ProjectModel::getTableName() . "`.uid",
                "columns" => (object)["keywords", "description", "thumbnail_id"]
            ]
        ];
    }

    static function subProjects($topic = 'UNKNOWN', $count = 6): object
    {
        $projects = (object) ["result" => []];

        $projectModel = new ProjectModel();
        $projectModel->merge =  self::getFullData();
        if (is_array($topic)) :
            foreach ($topic as $key => $t) :
                if ($key == 0) :
                    $projectModel->conditions[] = ["type", "=", $t];
                else :
                    $projectModel->conditions[] = ["OR", "type", "=", $t];
                endif;
            endforeach;
        else :
            $projectModel->conditions = [["type", "=", $topic]];
        endif;
        $projectModel->count = $count;
        $result = $projectModel->join();

        if ($result) :
            foreach ($result as $key => $project) :
                $thumbnail = self::getFiles($project->projects_uid, "THUMBNAIL");
                $project->thumbnail = $thumbnail['file'];
                $project->thumbnail_preview = (array) $thumbnail['file_preview'];
            endforeach;

            $projects =  $result;
        endif;

        return $projects;
    }
}
