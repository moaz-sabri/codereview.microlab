<?php

use App\Bootstrap\Web;
?>
<div class="modal-header p-5 pb-4 border-bottom-0">
    <h1 class="fw-bold mb-0 fs-2">Forgot Password</h1>
</div>

<div class="modal-body p-5 pt-0">

    <custom-form el-action="<?= Web::getPath('post_forgotpassword') ?>" el-method="POST" el-enctype="application/json">
        <input-form el-type="email" el-lebel="Email" el-id="email" el-placeholder="example@email.ex" el-required="true" valid="valid" invalid="input error" el-validation="onkeyup"></input-form>

        <submit-form el-type="submit" el-name="Submit"></submit-form>
        <hr class="my-4">
        <small class="text-body-secondary">
            By clicking Sign up, you agree to the terms of use.
            <a href="<?= Web::getPath('get_signin') ?>" class="nav-like">Signin</a>
        </small>
    </custom-form>
</div>