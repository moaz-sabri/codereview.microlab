<?php

use App\Bootstrap\Web;
use App\Utilities\Utilitie;

// echo '<pre>';
// print_r($this->data);
// echo '</pre>';
$isNewUser = empty($this->data->user->user_username);
?>
<div class="container">
    <ul class="nav justify-content-between ">
        <h1>User Store (<?= $isNewUser ? 'Add User' : $this->data->user->user_username ?>)</h1>
        <div>
            <?php if (!$isNewUser) : ?>
            <a class="btn btn-primary"
                href="<?= Web::getPath('get_manger_user_activity') . $this->data->user->user_uid ?>/activity">Activity</a>
            <a class="btn btn-primary my-2"
                href="<?= Web::getPath('get_visit_profile') . $this->data->user->user_uid ?>">Profile</a>
            <button
                onclick="defaultDeleteSubmitRequest('<?= Web::getPath('delete_manger_user') . $this->data->user->user_uid ?>', 'defaultConfirm')"
                class="btn btn-danger my-2"><i class="bi bi-trash3"></i></button>
            <?php endif; ?>
        </div>
    </ul>

    <popup-question el-id="defaultConfirm" el-title="do you need reomve this user?"></popup-question>

    <div class="g-5">

        <custom-form
            el-action="<?= $isNewUser ? Web::getPath('post_manger_user') : Web::getPath('put_manger_user') . $this->data->user->user_uid ?>"
            el-method="POST" el-enctype="application/json">

            <div class="row g-3">
                <div class="col-sm-6">
                    <input-form el-type="text" el-lebel="Firstname" el-id="firstname"
                        el-value="<?= $this->data->user->user_firstname ?>" el-placeholder="johan" valid="valid"
                        invalid="input error" el-validation="onkeyup"></input-form>
                </div>

                <div class="col-sm-6">
                    <input-form el-type="text" el-lebel="Lastname" el-id="lastname"
                        el-value="<?= $this->data->user->user_lastname ?>" el-placeholder="stef" valid="valid"
                        invalid="input error" el-validation="onkeyup"></input-form>
                </div>

                <div class="col-12">
                    <input-form el-type="text" el-lebel="username *" el-id="username" el-placeholder="johnstef"
                        el-value="<?= $this->data->user->user_username ?>" el-required="true" valid="valid"
                        invalid="input error" el-validation="onkeyup"></input-form>
                </div>

                <div class="col-12">
                    <input-form el-type="email" el-lebel="Email Address *" el-id="email" el-placeholder="stef"
                        el-value="<?= $this->data->user->user_email ?>" el-required="true" valid="valid"
                        invalid="input error" el-validation="onkeyup"></input-form>
                    <small class="invalid-feedback">
                        Please enter a valid email address for shipping updates.
                    </small>
                </div>

                <?php if (!$isNewUser) : ?>
                <div class="col-sm-12">
                    <input-form el-type="password" el-lebel="Current Password" el-id="current_password"
                        el-placeholder="*********" valid="valid" invalid="input error"
                        el-validation="onkeyup"></input-form>
                </div>
                <?php endif; ?>

                <div class="col-sm-6">
                    <input-form el-type="password" el-lebel="Password" el-id="new_password" el-placeholder="*********"
                        <?= $isNewUser ? 'el-required="true"' : false ?> valid="valid" invalid="input error"
                        el-validation="onkeyup"></input-form>
                </div>

                <div class="col-sm-6">
                    <input-form el-type="password" el-lebel="Confirm Password" el-id="confirm_password"
                        <?= $isNewUser ? 'el-required="true"' : false ?> el-placeholder="********" valid="valid"
                        invalid="input error" el-validation="onkeyup"></input-form>
                </div>

                <div class="col-sm-6">
                    <div class="mb-3">
                        <label for="activation" class="form-label">
                            activation
                        </label>
                        <select class="form-select" name="activation" id="activation"
                            aria-label="Default select example">
                            <?php
                        foreach (Utilitie::getOptions('activation') as $key => $value) : ?>
                            <option
                                <?= isset($this->data->user->user_activation) && $this->data->user->user_activation === $value ? 'selected' : null ?>
                                value="<?= $value ?>"><?= $value ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="mb-3">
                        <label for="group_id" class="form-label">
                            Group Name
                        </label>
                        <select class="form-select text-capitalize" name="group_id" id="group_id"
                            aria-label="Default select example">
                            <option value="-1" selected>defualt</option>
                            <?php foreach ($this->data->groups->result as $key => $group) : ?>
                            <option
                                <?= isset($this->data->user->user_group_id) && $this->data->user->user_group_id == $group->pgroup_uid ? 'selected' : null ?>
                                value="<?= $group->pgroup_uid ?>"><?= $group->pgroup_name ?>
                            </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
            </div>
            <hr class="my-4">

            <submit-form el-type="submit" el-class="w-100 btn btn-primary btn-lg" el-name="Submit"></submit-form>

        </custom-form>

        <hr>
        <?php if (isset($this->data->user->permissions)) : ?>
        <h3>User Permissions</h3>
        <div class="row">
            <?php foreach ($this->data->user->permissions->result as $key => $permissions) : ?>
            <div class="col-md-3">
                <ul class="list-unstyled">
                    <h3 class="text-capitalize"><?= $permissions->permission_module ?></h3>
                    <?php foreach (json_decode($permissions->permission_action) as $permission) : ?>
                    <li class="page-item"><?= $permission ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>
            <?php endforeach; ?>
        </div>
        <?php endif; ?>

    </div>
</div>
