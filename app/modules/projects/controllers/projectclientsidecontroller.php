<?php

namespace App\Modules\Projects\Controllers;

use App\Bootstrap\Request;
use App\Modules\Projects\Loader\ProjectLoader;
use App\Modules\Projects\Models\ProjectModel;
use App\Modules\Projects\Models\ProjectTagsModel;
use App\Modules\Projects\Setting as ProjectSetting;
use App\Modules\Traffic\Models\TrafficModel;
use App\Utilities\Utilitie;

class ProjectClientSideController extends Utilitie
{
    function preview()
    {

        // if (!ProjectSetting::permission('preview')) :
        //     $this->notAllowd();
        // endif;

        if (isset($this->parameters->target)) :
            $guide = $this->extractIdFromURL($this->parameters->target);
            $projectModel = new ProjectModel();
        endif;

        if (isset($guide) && preg_match($projectModel->pattern, $guide)) :

            $loader = new ProjectLoader;
            $projectModel->merge = $loader->getFullData();
            $projectModel->conditions = [
                ["guide", "=", $guide],
                ["type", "=", $this->parameters->module]
            ];
            $result = $projectModel->findJoin();

            if (!$result) $this->bad(404, 'NOT FOUND');

            $viewsModel = new TrafficModel;
            $viewsModel->conditions = [["page_url", "LIKE", "%$guide%"]];
            $viewsModel->list = [
                "page_url",
                "SUM(reloaded) AS views",
            ];

            $views = (array) $viewsModel->countlist();
            $result->views = isset($views[0]) ?
                (
                    isset($views[0]->views) ?
                    $views[0]->views + $views[0]->total : 0
                ) : 0;

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

            $result->projects_content = $loader->readContent($result->projects_content);

            $thumbnail = $loader->getFiles($result->projects_uid, "THUMBNAIL");
            $result->thumbnail = $thumbnail['file'];
            $result->thumbnail_preview = $thumbnail['file_preview'];

            $gallery = $loader->getFiles($result->projects_uid, "GALLERY");
            $result->gallery = $gallery['file'];
            $result->gallery_preview = $gallery['file_preview'];

            return (object) [
                "obj" => $result,
                "view" => "preview",
                "meta" => [
                    "title" => PROJECT_NAME,
                    "keywords" => $result->tags_name,
                    "description" => $result->meta_description,
                ],
                "styles" => [
                    "/public/static/editor/quill.bubble.css",
                    "/public/static/editor/quill.snow.css"
                ],
            ];
        endif;
        $this->back($code ?? 404, $message ?? 'Someone wrong!', $color ?? 'danger');
    }

    function projects()
    {
        // if (!ProjectSetting::permission('preview')) :
        //     $this->notAllowd();
        // endif;

        $projects = (object)[
            "result" => [],
        ];

        $topic = strtoupper($this->parameters->module);
        $loader = new ProjectLoader;

        if (isset($loader->getTopics()->$topic)) :
            $projectModel = new ProjectModel();
            $projectModel->merge = $loader->getFullData();

            $projectModel->conditions = [["type", "=", $topic]];
            $projectModel->pagination = true;

            $result = $projectModel->join();

            if (isset($result->result)) :
                foreach ($result->result as $key => $project) :
                    $tagsModels = new ProjectTagsModel;
                    $tagsModels->conditions = [["project_id", "=", $project->projects_uid]];
                    $tags = $tagsModels->get();
                    if ($tags) :
                        $tags_name = '';
                        foreach ($tags as $key => $tag) {
                            $tags_name .= $tag->name . ',';
                        }
                        $project->tags_name = trim($tags_name, ",");
                    endif;

                    $thumbnail = $loader->getFiles($project->projects_uid, "THUMBNAIL");
                    $project->thumbnail = $thumbnail['file'];
                    $project->thumbnail_preview = (array) $thumbnail['file_preview'];
                endforeach;

                $projects =  $result;
            endif;

        endif;

        // $this->debug($topic, true);
        // $this->debug($projects);

        return (object) [
            "obj" => $projects,
            "view" => "index",
            "meta" => [
                "title" => PROJECT_NAME,
            ],
        ];
    }

    function search(Request $request)
    {

        // if (!ProjectSetting::permission('preview')) :
        //     $this->notAllowd();
        // endif;

        $projects = (object)[
            "result" => [],
        ];

        $validationRules = [
            'search' => ['required' => true, 'min_length' => 3, "max_length" => "33"],
        ];


        $validation = $this->validate($request->data, $validationRules);
        $errors = $this->validateFormData($validation);
        if (!empty($errors)) return $this->response(400, $errors);

        $data = $validation['validated'];

        if (isset($data->search)) :
            $loader = new ProjectLoader;

            $projectModel = new ProjectModel();
            $projectModel->merge = $loader->getFullData();
            $projectModel->conditions = [
                ["title", "LIKE", "%$data->search%"],
            ];
            $projectModel->pagination = true;
            $result = $projectModel->join();

            if ($result) :
                foreach ($result->result as $key => $project) :
                    $tagsModels = new ProjectTagsModel;
                    $tagsModels->conditions = [["project_id", "=", $project->projects_uid]];
                    $tags = $tagsModels->get();
                    if ($tags) :
                        $tags_name = '';
                        foreach ($tags as $key => $tag) {
                            $tags_name .= $tag->name . ',';
                        }
                        $project->tags_name = trim($tags_name, ",");
                    endif;

                    $thumbnail = $loader->getFiles($project->projects_uid, "THUMBNAIL");
                    $project->thumbnail = $thumbnail['file'];
                    $project->thumbnail_preview = (array) $thumbnail['file_preview'];
                endforeach;

                $projects =  $result;
            endif;
        endif;

        return (object) [
            "obj" => $projects,
            "view" => "index",
            "meta" => [
                "title" => PROJECT_NAME,
            ],
        ];
    }
}
