<?php use App\Bootstrap\Web;

// Parse the date string with the correct format
$date = DateTime::createFromFormat('Y-m-d', $this->data->reminder->calendar_date_start);
?>

<div class="container">

    <custom-form el-action="<?= Web::getPath('post_reminder_update') . $this->data->reminder->calendar_uid ?>"
        el-method="POST" el-enctype="application/json" el-class="row gy-2 gx-3 align-items-center">

        <div class="col-md-2">
            <label class="mb-2" for="day">Datum (TT)</label>
            <select class="form-select" id="day" name="day" required="">
                <option value="">Tag </option>
                <?php for ($i = 1; $i <= 31; $i++) :  $value = str_pad($i, 2, '0', STR_PAD_LEFT);?>
                <option value="<?= $value ?>" <?= $value == $date->format('d') ? 'selected' : '' ?>>
                    <?= $value ?>
                </option>
                <?php endfor; ?>
            </select>

            <div class="valid-feedback">Looks good!</div>
            <div class="invalid-feedback">Looks Bad!</div>
        </div>

        <div class="col-md-2">
            <label class="mb-2" for="month">Datum (MM)</label>
            <select class="form-select" id="month" name="month" required="">
                <option value="">Monat</option>
                <?php for ($i = 1; $i <= 12; $i++) : $value = str_pad($i, 2, '0', STR_PAD_LEFT); ?>
                <option value="<?= $value ?>" <?= $value == $date->format('m') ? 'selected' : '' ?>>
                    <?= $value ?></option>
                <?php endfor; ?>
            </select>

            <div class="valid-feedback">Looks good!</div>
            <div class="invalid-feedback">Looks Bad!</div>
        </div>

        <div class="col-md-6">
            <label class="mb-2" for="subject">Bezeichnung</label>
            <input type="text" class="form-control" id="subject" name="subject"
                value="<?= $this->data->reminder->calendar_subject ?>" placeholder="Hochzeitstag" required="">


            <div class="valid-feedback">Looks good!</div>
            <div class="invalid-feedback">Looks Bad!</div>
        </div>

        <div class="col-md-2">
            <label class="mb-2" for="reminding">Erinnerung</label>
            <select class="form-select" id="reminding" name="reminding" required="">
                <option value="">Mal</option>
                <option value="1D" <?= '1D'==$this->data->reminder->calendar_remindertime ? 'selected' : ''
                    ?>>
                    Ein Tag
                </option>
                <option value="2D" <?= '2D'==$this->data->reminder->calendar_remindertime ? 'selected' : ''
                    ?>>
                    Zwei Tage
                </option>
                <option value="4D" <?= '4D'==$this->data->reminder->calendar_remindertime ? 'selected' : ''
                    ?>>
                    Vier Tage
                </option>
                <option value="1W" <?= '1W'==$this->data->reminder->calendar_remindertime ? 'selected' : ''
                    ?>>
                    Eine Woche
                </option>
                <option value="2W" <?= '2W'==$this->data->reminder->calendar_remindertime ? 'selected' : ''
                    ?>>
                    Zwei Wochen
                </option>
            </select>

            <div class="valid-feedback">Looks good!</div>
            <div class="invalid-feedback">Looks Bad!</div>
        </div>

        <div class="row mt-3 m-0">
            <div class="col-sm-6 p-0">
                <label for="formFile" class="form-label">Bild hochladen</label>
                <input class="form-control" id="formFileF" type="file" name="file" accept="image/*"
                    aria-describedby="upload_new_avatar">
                <p class="form-text" id="upload_new_avatar">
                    <small class="text-body-secondary">
                        Die maximal zulässige Dateigröße ist 2 MB.
                    </small>
                </p>
                <div class="mt-3">
                    <label class="mb-2" for="status">Status</label>
                    <select class="form-select" id="status" name="status" required="">

                        <option value="RUNNING" <?= 'RUNNING'==$this->data->reminder->calendar_status ?
                            'selected' : '' ?>>
                            Läuft
                        </option>
                        <option value="STOP" <?= 'STOP'==$this->data->reminder->calendar_status ? 'selected'
                            : '' ?>>
                            Stoppen
                        </option>
                    </select>

                    <div class="valid-feedback">Looks good!</div>
                    <div class="invalid-feedback">Looks Bad!</div>
                </div>
            </div>

            <div class="col-sm-6 p-0">
                <div class="border border-1 h-100 ms-3">
                    <?php if(!empty($this->data->reminder->calendar_image)) : ?>
                    <img class="img-fluid w-100 lazyload" src="/storage<?= $this->data->reminder->calendar_image ?>"
                        alt="user profile" loading="lazy">
                    <?php else: ?>
                    <h3 class="text-center mt-4">Bild</h3>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <div class="col-12 text-start">
            <div class="mb-3">
                <label for="message" class="form-label">Nachricht schreiben</label>
                <textarea class="form-control" id="message" name="message" rows="10"><?= $this->data->reminder->calendar_message ?></textarea>
            </div>
        </div>

        <div class="col-12">
            <div class="nav justify-content-between align-items-center">
                <button type="button" onclick="history.back()" class="btn btn-secondary">Zurück</button>
                <submit-form el-type="submit" el-class="btn btn-primary" el-name="Speicheren"></submit-form>
            </div>
        </div>

    </custom-form>

    <hr class="my-5">

    <div>
        <h3>Geschichte</h3>
        <table class="table table-striped table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">Status</th>
                    <th scope="col">Antwort</th>
                    <th scope="col">Datum</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($this->data->history->result as $key => $value) :?>
                <tr>
                    <td scope="row"><?= $value->hmail_status ?></td>
                    <td><?= $value->hmail_response ?></td>
                    <td><?= $value->hmail_updated_at ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

</div>
