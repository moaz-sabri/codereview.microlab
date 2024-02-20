<?php

namespace App\Modules\Offers\Api;

use App\Bootstrap\Request;
use App\Modules\Offers\Models\OfferModel;
use App\Utilities\Utilitie;

class OfferApi extends Utilitie
{

    function create(Request $request)
    {
        $validationRules = [
            'type' => ['required' => true, 'min_length' => 4],
            'start' => ['required' => true, 'min_length' => 4],
            'speed' => ['required' => true, 'min_length' => 4],
            'budget' => ['required' => true, 'min_length' => 0],
            'email' => ['required' => true, 'type' => 'email'],
            'name' => ['required' => true, 'min_length' => 3],
            'phone' => ['min_length' => 3],
            'message' => [],
        ];

        $validation = $this->validate($request->data, $validationRules);
        $errors = $this->validateFormData($validation);
        if (!empty($errors)) return $this->response(400, $errors);

        $data = $validation['validated'];

        $offerModel = new OfferModel();
        $offerModel->column->guide = $this->guide('O');
        $offerModel->column->type = $data->type;
        $offerModel->column->start = $data->start;
        $offerModel->column->speed = $data->speed;
        $offerModel->column->budget = $data->budget;
        $offerModel->column->message = $data->message;
        $offerModel->column->name = $data->name;
        $offerModel->column->email = $data->email;
        $offerModel->column->phone = $data->phone;

        $offer = $offerModel->save();
        if ($offer) :
            return $this->response(200, json_encode($offer));
        endif;

        return $this->response(404, false);
    }

    function update()
    {
        if (isset($this->parameters->target)) :
            $guide = $this->parameters->target;
            $offerModel = new OfferModel();
        endif;

        if (isset($guide) && preg_match($offerModel->pattern, $guide)) :

            $offerModel->conditions = [
                ["guide", "=", $guide]
            ];

            $offer = $offerModel->find();

            if ($offer) :
                $offerModel->column->status = 'READED';
                if ($offerModel->save()) :
                    return $offer;
                endif;
            endif;
        endif;

        return false;
    }
}
