<?php

namespace App\Modules\Projects\Api;

use App\Modules\Projects\Setting as ProjectSetting;
use App\Modules\Projects\Loader\ProjectLoader;
use App\Modules\Projects\Models\ProjectFileModel;
use App\Modules\Projects\Models\ProjectModel;
use App\Modules\Records\Loader\RecordLoader;
use App\Bootstrap\Request;
use App\Modules\Notifications\Loader\NotificationLoader;
use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Projects\Models\ProjectCategoriesModel;
use App\Modules\Projects\Models\ProjectMetaModel;
use App\Modules\Projects\Models\ProjectTagsModel;
use App\Modules\Users\Loader\User;
use App\Utilities\Utilitie;

class ProjectApi extends Utilitie
{

    function create(Request $request, User $currentuser)
    {
        if (!ProjectSetting::permission('create')) :
            $this->notAllowd();
        endif;

        $validationRules = [
            'thumbnail' => ['min_length' => 0],
            'gallery' => ['min_length' => 0],
            'tags' => ['min_length' => 0],
            'keywords' => ['min_length' => 0],
            'description' => ['min_length' => 0],
            'categories' => ['required' => true, 'min_length' => 3],
            'status' => ['required' => true, 'min_length' => 3],
            'type' => ['required' => true, 'min_length' => 3],
            'title' => ['required' => true, 'min_length' => 3, "max_length" => "230"],
            'content' => ['required' => true, 'min_length' => 3],
        ];

        $validation = $this->validate($request->data, $validationRules);
        $errors = $this->validateFormData($validation);
        if (!empty($errors)) return $this->response(400, $errors);

        $data = $validation['validated'];

        $loader = new ProjectLoader;
        $guide = $this->guide('A');
        $title = filter_var($data->title, FILTER_SANITIZE_URL);
        $friendlyurl = $this->friendly_url($title, $guide);

        $projectModel = new ProjectModel;
        $projectModel->column->guide = $guide;
        $projectModel->column->type = $data->type;
        $projectModel->column->owner = $currentuser->uid;
        $projectModel->column->content = $loader->rewriteContent($data->content);
        $projectModel->column->status = $data->status;

        $projectModel->column->title = $data->title;
        $projectModel->column->friendlyurl = $friendlyurl;

        $project = $projectModel->save();

        if (isset($project->uid)) :
            $metaModel = new ProjectMetaModel;
            $metaModel->column->guide = $this->guide('M');
            $metaModel->column->project_id = $project->uid;

            $categoriesModel = new ProjectCategoriesModel;
            $categoriesModel->column->project_id = $project->uid;
            $categoriesModel->column->guide = $this->guide('C');
            $categoriesModel->column->name = strtolower($data->categories);
            $categoriesModel->save();


            if (isset(($data->tags)) && !empty($data->tags)) :
                foreach (explode(",", $data->tags) as $key => $tag) :
                    $tagsModel = new ProjectTagsModel;
                    $tagsModel->column->project_id = $project->uid;
                    $tagsModel->column->guide = $this->guide('T');
                    $tagsModel->column->name = strtolower($tag);
                    $tagsModel->save();
                endforeach;
            endif;


            if (isset(($data->thumbnail)) && !empty($data->thumbnail)) :
                $thumbnail = explode(',', $data->thumbnail);
                foreach ($thumbnail as $key => $img) :
                    $images = new ProjectFileModel;
                    $images->column->guide = $this->guide('M');
                    $images->column->project_id = $project->uid;
                    $images->column->file_id = $img;
                    $images->column->location = 'THUMBNAIL';
                    $images->save();
                endforeach;

                $metaModel->column->thumbnail_id = $thumbnail[0];
            endif;

            if (isset(($data->gallery)) && !empty($data->gallery)) :
                $gallery = explode(',', $data->gallery);
                foreach ($gallery as $key => $img) :
                    $images = new ProjectFileModel;
                    $images->column->guide = $this->guide('M');
                    $images->column->project_id = $project->uid;
                    $images->column->file_id = $img;
                    $images->column->location = 'GALLERY';
                    $images->save();
                endforeach;
            endif;

            $metaModel->column->keywords = $data->keywords;
            $metaModel->column->description = $data->description;
            $metaModel->save();

            $message = 'Successfully completed!';
            RecordLoader::history($message, 1);

            $notification = (object) [
                "owner" => $currentuser->uid,
                "resource" => "/" . strtolower($project->type) . "/preview/" . $project->friendlyurl,
                "header" =>  "created new project",
                "content" => "",
                "type" => "PRODUCT",
            ];

            NotificationLoader::setNotification($notification);

            return $this->response(200, $project->guide);


        endif;

        return $this->response(404, 'message');
    }

    function update(Request $request, User $currentuser)
    {
        if (!ProjectSetting::permission('update')) :
            $this->notAllowd();
        endif;

        if (isset($this->parameters->target)) :
            $guide = $this->parameters->target;
            $projectModel = new ProjectModel();
        endif;

        if (isset($guide) && preg_match($projectModel->pattern, $guide)) :

            $projectModel->conditions = [["guide", "=", $guide]];
            if (CryptLoader::decrypt('role') != MASTER) :
                $projectModel->conditions[] = ["owner", "=", CryptLoader::decrypt('uid')];
            endif;

            $project = $projectModel->find();

            if (!$project) return $this->response(404, 'message');

            $validationRules = [
                'thumbnail' => ['min_length' => 0],
                'gallery' => ['min_length' => 0],
                'tags' => ['min_length' => 0],
                'keywords' => ['min_length' => 0],
                'description' => ['min_length' => 0],
                'status' => ['required' => true, 'min_length' => 3],
                'type' => ['required' => true, 'min_length' => 3],
                'title' => ['required' => true, 'min_length' => 3, "max_length" => "230"],
                'content' => ['required' => true, 'min_length' => 3],
                'categories' => ['required' => true, 'min_length' => 3],
            ];

            $validation = $this->validate($request->data, $validationRules);
            $errors = $this->validateFormData($validation);
            if (!empty($errors)) return $this->response(400, $errors);

            $data = $validation['validated'];

            if ($data->title !== $project->title) :
                $projectModel->column->title = $data->title . $errors;
                $title = filter_var($data->title, FILTER_SANITIZE_URL);
                $projectModel->column->friendlyurl = $this->friendly_url($title, $guide);
            endif;

            $loader = new ProjectLoader;
            $content = $loader->readContent($project->content);
            if ($data->content !== $content) :
                $projectModel->column->content = $loader->rewriteContent($data->content, $project->content);
            endif;

            if ($data->status !== $project->status) :
                $projectModel->column->status = $data->status;
            endif;

            if ($data->type !== $project->type) :
                $projectModel->column->type = $data->type;
            endif;

            $projected = $projectModel->save();

            if ($projected->uid) :

                $metaModel = new ProjectMetaModel;
                $metaModel->conditions = [["project_id", "=", $project->uid]];

                if (isset(($data->tags)) && !empty($data->categories)) :
                    $categoriesModel = new ProjectCategoriesModel;
                    $categoriesModel->conditions = [["project_id", "=", $project->uid]];
                    $categoriesModel->column->name = strtolower($data->categories);
                    $categoriesModel->save();
                endif;

                if (isset(($data->tags)) && !empty($data->tags)) :
                    foreach (explode(",", $data->tags) as $key => $tag) :
                        $tagsModel = new ProjectTagsModel;

                        $tagsModel->conditions = [
                            ["project_id", "=", $project->uid],
                            ["name", "=", $tag]
                        ];

                        if (!$tagsModel->find()) :
                            $tagsModel = new ProjectTagsModel;
                            $tagsModel->column->project_id = $project->uid;
                            $tagsModel->column->guide = $this->guide('T');
                            $tagsModel->column->name = strtolower($tag);
                            $tagsModel->save();
                        endif;
                    endforeach;
                endif;

                if (isset(($data->thumbnail)) && !empty($data->thumbnail)) :
                    $loader->updateFilesRelation($project, $data->thumbnail, "THUMBNAIL");
                    $metaModel->column->thumbnail_id = $data->thumbnail[0];
                endif;

                if (isset(($data->gallery)) && !empty($data->gallery)) :
                    $loader->updateFilesRelation($project, $data->gallery, "GALLERY");
                endif;

                $metaModel->column->keywords = $data->keywords;
                $metaModel->column->description = $data->description;
                $metaModel->save();

                $message = 'Successfully completed!';
                RecordLoader::history($message, 1);

                return $this->response(200, $projected->guide);

            endif;

        endif;

        return $this->response(404, 'message');
    }

    function switch(Request $request)
    {
        if (!ProjectSetting::permission('switch')) :
            $this->notAllowd();
        endif;

        // update Single row
        $projectModel = new ProjectModel();
        if (isset($this->parameters->target) && preg_match($projectModel->pattern, $this->parameters->target)) :
            $validationRules = [
                'scope' => ['required' => true, 'min_length' => 3],
                'switch' => ['required' => true, 'min_length' => 3],
            ];

        else :
            $validationRules = [
                'scope' => ['required' => true, 'min_length' => 3],
                'switch' => ['required' => true, 'min_length' => 3],
                'selected' => ['required' => true, 'type' => 'array', "return" => "array"],
            ];

        endif;

        $validation = $this->validate($request->data, $validationRules);
        $errors = $this->validateFormData($validation);
        if (!empty($errors)) return $this->response(400, $errors);

        $data = $validation['validated'];

        if (!isset($data->selected)) $data->selected = [$this->parameters->target];
        $tasks = count($data->selected);
        $complated = 0;

        foreach ($data->selected as $row) {
            $projectModel = new ProjectModel();
            $projectModel->conditions = [['guide', "=", $row]];
            $col = $data->scope;
            $projectModel->column->$col = $data->switch;

            if ($projectModel->save()) :
                ++$complated;
            endif;
        }

        if ($tasks === $complated) :
            $message = 'Successfully completed!';
            $code = 200;
            RecordLoader::history($message, 1);

        else :
            $message = "Some wourn whan update $row!";
            RecordLoader::history($message, 0);
            RecordLoader::log($message, 500, "s7f6sa7f6");
        endif;

        return $this->response($code ?? 404, $message ?? 'error');
    }


    function delete()
    {
        if (!ProjectSetting::permission('delete')) :
            $this->notAllowd();
        endif;

        $project = new ProjectModel();
        $guide = $this->parameters->target;

        if (isset($guide) && preg_match($project->pattern, $guide)) :
            $project->conditions = [["guide", "=", $guide]];

            if (CryptLoader::decrypt('role') != MASTER) :
                $project->conditions[] = ["owner", "=", CryptLoader::decrypt('uid')];
            endif;

            if ($project->delete()) :
                $message = "File {$guide} has been deleted successfully.";
                RecordLoader::history($message, 1);
                return $this->response(200, $message);
            else :
                $message = "Error: Unable to delete the File. Please try again or contact support.";
                RecordLoader::history($message, 0);
                return $this->response(500, $message);
            endif;

        endif;

        return $this->response(404, 'Not Found');
    }

    function destroy()
    {
        if (!ProjectSetting::permission('destroy')) :
            $this->notAllowd();
        endif;

        $project = new ProjectModel();
        $guide = $this->parameters->target;

        if (isset($guide) && preg_match($project->pattern, $guide)) :
            $project->conditions = [["guide", "=", $guide]];

            if (CryptLoader::decrypt('role') != MASTER) :
                $project->conditions[] = ["owner", "=", CryptLoader::decrypt('uid')];
            endif;

            if ($project->destroy()) :
                $message = "File {$guide} has been deleted successfully.";
                RecordLoader::history($message, 1);
                return $this->response(200, $message);
            else :
                $message = "Error: Unable to delete the File. Please try again or contact support.";
                RecordLoader::history($message, 0);
                return $this->response(500, $message);
            endif;

        endif;

        return $this->response(404, 'Not Found');
    }
}
