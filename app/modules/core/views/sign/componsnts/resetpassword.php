<?php

use App\Bootstrap\Web;
?>
<div class="modal-header p-5 pb-4 border-bottom-0">
    <h1 class="fw-bold mb-0 fs-2">Reset Password</h1>
</div>

<div class="modal-body p-5 pt-0">

    <custom-form el-action="<?= Web::getPath('post_resetpassword') ?>?access=<?= $this->data->access ?>" el-method="POST" el-enctype="application/json">

        <input-form el-type="password" el-lebel="New Password" el-id="new_password" el-placeholder="*********" el-required="true" valid="valid" invalid="input error" el-validation="onkeyup"></input-form>

        <input-form el-type="password" el-lebel="Confirm Password" el-id="confirm_password" el-placeholder="********" el-required="true" valid="valid" invalid="input error" el-validation="onkeyup"></input-form>

        <submit-form el-type="submit" el-name="Submit"></submit-form>
        <hr class="my-4">
        <small class="text-body-secondary">
            By clicking Sign up, you agree to the terms of use.
            <a href="<?= Web::getPath('get_signin') ?>" class="nav-like">Signin</a>
            or
            <a href="<?= Web::getPath('get_forgotpassword') ?>" class="nav-like">F-Password</a>
        </small>
    </custom-form>
</div>