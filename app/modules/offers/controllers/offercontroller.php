<?php

namespace App\Modules\Offers\Controllers;

use App\Modules\Records\Loader\RecordLoader;
use App\Modules\Offers\Models\OfferModel;
use App\Modules\Offers\Setting as OfferSetting;
use App\Modules\Permissions\Loader\CryptLoader;
use App\Utilities\Utilitie;

class OfferController extends Utilitie
{
    function dashboard()
    {

        if (!OfferSetting::permission('dashboard')) :
            $this->notAllowd();
        endif;

        $filestorage = new OfferModel();

        $queries = $this->parameters->queries;
        $conditions = [];
        if (isset($queries->type)) :
            $conditions[] = ["type", "=", $queries->type];
        endif;

        if (isset($queries->status)) :
            $conditions[] = ["status", "=", $queries->status];
        endif;

        if (count($conditions) > 0) :
            $filestorage->conditions = $conditions;
        endif;

        $filestorage->count = 3;
        $filestorage->pagination = true;
        $result = $filestorage->get();

        return (object) [
            "obj" => $result,
            "view" => "dashboard",
            "meta" => [
                "title" => PROJECT_NAME,
            ]
        ];
    }

    function delete()
    {
        if (!OfferSetting::permission('delete')) :
            $this->notAllowd();
        endif;

        $offer = new OfferModel();
        $guide = $this->parameters->target;

        if (isset($guide) && preg_match($offer->pattern, $guide)) :
            $offer->conditions = [["guide", "=", $guide]];

            if (CryptLoader::decrypt('role') != MASTER) :
                $offer->conditions[] = ["owner", "=", CryptLoader::decrypt('uid')];
            endif;

            if ($offer->delete()) :
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
