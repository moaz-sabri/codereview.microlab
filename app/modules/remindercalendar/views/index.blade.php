<?php

use App\Bootstrap\Web;
use App\Utilities\Utilitie;

$util = new Utilitie();
?>
<div class="container">
    <ul class="nav justify-content-between ">
        <div>
            <h1>Erinnerungskalender</h1>
        </div>
    </ul>
    <div>
        <div class="border border-1 p-3">
            <custom-form el-action="<?= Web::getPath('post_reminder') ?>" el-method="POST" el-enctype="application/json"
                el-class="row gy-2 gx-3 align-items-center">

                <div class="col-md-2">
                    <label class="" for="day">Datum TT</label>
                    <select class="form-select" id="day" name="day" required="">
                        <option value="" selected>Tag</option>
                        <?php for ($i = 1; $i <= 31; $i++) : ?>
                        <option value="<?= str_pad($i, 2, '0', STR_PAD_LEFT) ?>">
                            <?= str_pad($i, 2, '0', STR_PAD_LEFT) ?></option>
                        <?php endfor; ?>
                    </select>

                    <div class="valid-feedback">Looks good!</div>
                    <div class="invalid-feedback">Looks Bad!</div>
                </div>

                <div class="col-md-2">
                    <label class="" for="month">Datum MM</label>
                    <select class="form-select" id="month" name="month" required="">
                        <option value="" selected>Monat</option>
                        <?php for ($i = 1; $i <= 12; $i++) : ?>
                        <option value="<?= str_pad($i, 2, '0', STR_PAD_LEFT) ?>">
                            <?= str_pad($i, 2, '0', STR_PAD_LEFT) ?></option>
                        <?php endfor; ?>
                    </select>

                    <div class="valid-feedback">Looks good!</div>
                    <div class="invalid-feedback">Looks Bad!</div>
                </div>

                <div class="col-md-6">
                    <label class="" for="subject">Bezeichnung</label>
                    <input type="text" class="form-control" id="subject" name="subject" placeholder="Hochzeitstag"
                        required="">


                    <div class="valid-feedback">Looks good!</div>
                    <div class="invalid-feedback">Looks Bad!</div>
                </div>

                <div class="col-md-2">
                    <label class="" for="reminding">Erinnerung</label>
                    <select class="form-select" id="reminding" name="reminding" required="">
                        <option value="" selected>Mal</option>
                        <option value="1D">Ein Tag</option>
                        <option value="2D">Zwei Tage</option>
                        <option value="4D">Vier Tage</option>
                        <option value="1W">Eine Woche</option>
                        <option value="2W">Zwei Wochen</option>
                    </select>

                    <div class="valid-feedback">Looks good!</div>
                    <div class="invalid-feedback">Looks Bad!</div>
                </div>

                <div class="col-12 text-end">
                    <submit-form el-type="submit" el-class="btn btn-primary btn-lg" el-name="Speicheren"></submit-form>
                </div>

            </custom-form>

        </div>
        <hr class="my-5">
        <div class="border border-1 p-3">
            <default-table el-data='<?= str_replace("'", '' , json_encode($this->data->reminder->result)) ?>'
                el-edit="<?= Web::getPath('get_reminder_editor') ?>"
                el-dele="<?= Web::getPath('delete_reminder') ?>"
                el-header='{
                        "calendar_date_start":"Datum",
                        "calendar_subject":"Bezeichnung",
                        "calendar_remindertime":"Erinnerung",
                        "calendar_status":"Status",
                        "":"Action"}'
                el-function="defaultConfirm" el-uid='calendar_uid'>
            </default-table>

            <popup-question el-id="defaultConfirm" el-title="do you need reomve this user?"></popup-question>

            <hr class="my-3">

            <nav class="nav justify-content-between">
                <div class="nav-item">
                    <button type="button" onclick="history.back()" class="btn btn-secondary">Zurück</button>
                    <button class="btn btn-primary disabled" aria-current="<?= Web::getPath('delete_reminder') ?>"
                        id="deleteList">
                        <i class="bi bi-trash "></i>
                    </button>
                </div>
                <div class="nav-item">
                    <pagination-table el-data='<?= json_encode($this->data->reminder->info) ?>'></pagination-table>
                </div>
            </nav>
        </div>


    </div>
</div>
