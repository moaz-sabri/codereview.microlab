<?php

use App\Bootstrap\Web;
?>
<div class="modal-header p-5 pb-4 border-bottom-0">
    <h1 class="fw-bold mb-0 fs-2">Sign In</h1>
</div>

<div class="modal-body p-5 pt-0">

    <custom-form el-action="<?= Web::getPath('post_signin') ?><?= isset($this->data->callback) ? '/' . $this->data->callback : '' ?>" el-method="POST" el-enctype="application/json">

        <input-form el-type="text" el-lebel="Username & Email" el-id="username" el-placeholder="johanstef" el-required="true" valid="valid" invalid="input error"></input-form>
        <!-- el-validation="onkeyup" -->

        <input-form el-type="password" el-lebel="Password" el-id="password" el-placeholder="********" el-required="true" valid="valid" invalid="input error"></input-form>
        <!-- el-validation="onkeyup" -->
        <small class="text-body-secondary">
            i forgot password,
            <a href="<?= Web::getPath('get_forgotpassword') ?>" class="nav-like">forgot password</a>
        </small>

        <submit-form el-type="submit" el-name="Submit"></submit-form>

        <hr class="my-4">
        <small class="text-body-secondary">
            i don't have account,
            <a href="<?= Web::getPath('get_signup') ?>" class="nav-like">Signup</a>
        </small>
    </custom-form>
</div>