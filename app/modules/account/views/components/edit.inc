<?php

use App\Bootstrap\Web;
// echo '<pre>';
// print_r($this->data);
// echo '</pre>';

?>
<div class="container">

    <div class="row g-3 mb-4 align-items-center justify-content-between">
        <div class="col-auto">
            <h1 class="app-page-title mb-0">
                Profil bearbeiten
            </h1>
        </div>
    </div>

    <div class="g-5">

        <custom-form el-action="<?= Web::getPath('put_profile') ?>" el-method="POST" el-enctype="application/json">
            <div class="row g-3">
                <div class="col-sm-6">
                    <input-form el-type="text" el-lebel="Vorname" el-id="firstname" el-value="<?= $this->data->user->user_firstname ?>" el-placeholder="johan" valid="valid" invalid="input error" el-validation="onkeyup"></input-form>
                </div>

                <div class="col-sm-6">
                    <input-form el-type="text" el-lebel="Nachname" el-id="lastname" el-value="<?= $this->data->user->user_lastname ?>" el-placeholder="stef" valid="valid" invalid="input error" el-validation="onkeyup"></input-form>
                </div>

                <div class="col-12">
                    <input-form el-type="text" el-lebel="Nutzername *" el-id="username" el-placeholder="johnstef" el-value="<?= $this->data->user->user_username ?>" el-required="true" valid="valid" invalid="input error" el-validation="onkeyup"></input-form>
                </div>

                <div class="col-sm-12">
                    <input-form el-type="password" el-lebel="Aktuelles Passwort" el-id="current_password" el-placeholder="*********" valid="valid" invalid="input error" el-validation="onkeyup"></input-form>
                </div>

                <div class="col-sm-6">
                    <input-form el-type="password" el-lebel="Passwort" el-id="new_password" el-placeholder="*********" valid="valid" invalid="input error" el-validation="onkeyup"></input-form>
                </div>

                <div class="col-sm-6">
                    <input-form el-type="password" el-lebel="Bestätige das Passwort" el-id="confirm_password" el-placeholder="********" valid="valid" invalid="input error" el-validation="onkeyup"></input-form>
                </div>
            </div>

            <div class="nav justify-content-between align-items-center">
                <button type="button" onclick="history.back()" class="btn btn-secondary">Zurück</button>
                <submit-form el-type="submit" el-class="btn btn-primary" el-name="Speichern"></submit-form>
            </div>
        </custom-form>

    </div>
</div>