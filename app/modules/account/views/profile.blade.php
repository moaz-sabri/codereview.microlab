<?php

use App\Bootstrap\Web;
use App\Utilities\Utilitie;

$util = new Utilitie();
?>
<div class="container">
    <ul class="nav justify-content-between ">
        <div>
            <h1>Profil</h1>
        </div>
        <div>
            <a href="<?= Web::getPath('get_edit_profile') ?>" class="btn btn-primary">Bearbeiten</a>
            <a href="<?= Web::getPath('get_reminder_calendar') ?>" class="btn btn-primary">Erinnerungskalender</a>
        </div>
    </ul>

    <div class="row">
        <div class="col-md-4 text-md-start" aria-hidden="true">

            <!--
            <picture>
                <source srcset="< ?= $this->data->user->user_avatar ?>" type="image/svg+xml">
                <img src="< ?= $this->data->user->user_avatar ?>" class="img-fluid img-thumbnail" alt="...">
            </picture>
        -->

            <ul class="list-group list-group-flush">
                <li class="list-group-item">@<?= $this->data->user->user_username ?></li>
                <li class="list-group-item">
                    <?= $this->data->user->user_firstname ?? 'none' ?>
                    <?= $this->data->user->user_lastname ?? 'none' ?>
                </li>
                <li class="list-group-item <?= $this->data->user->user_activation ? 'text-success' : 'text-danger' ?>">
                    Email: <?= $this->data->user->user_email ?>
                </li>
                <li class="list-group-item">
                    letzte Aktivität: <?= $this->data->user->user_last_active_timestamp ?>
                </li>
                <li class="list-group-item">
                    Gruppe: <?= $this->data->user->pgroup_name ?>
                </li>
                <li class="list-group-item">
                    Dazu kommen: <?= $this->data->user->user_created_at ?>
                </li>
            </ul>
        </div>
        <div class="col-md-8">
            <?php
            if (isset($this->data->branch)):
                switch ($this->data->branch):
                    case 'edit':
                        require_once __DIR__ . '/components/edit.inc';
                        break;
                endswitch; 
        else: ?>

            <div class="border border-1 p-3">


                <table class="table table-striped table-striped table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Datum</th>
                            <th scope="col">Bezeichnung</th>
                            <th scope="col">Erinnerung</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($this->data->reminder->result as $key => $value) :?>
                        <tr>
                            <td scope="row"><?= $value->calendar_date_start ?></td>
                            <td><?= $value->calendar_subject ?></td>
                            <td><?= $value->calendar_remindertime ?></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
            <?php endif; ?>
        </div>
    </div>
</div>
