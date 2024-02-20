<?php

use App\Bootstrap\Web;
?>
<div class="modal-header p-5 pb-4 border-bottom-0">
    <h1 class="fw-bold mb-0 fs-2">Confirm</h1>
</div>

<div class="modal-body p-5 pt-0">

    <custom-form el-action="<?= Web::getPath('post_confirm') ?>?access=<?= $this->data->access ?>" el-method="POST" el-enctype="application/json">

        <input-form el-type="number" el-lebel="Enter your Code" el-id="confirm_code" el-placeholder="12345" el-required="true" valid="valid" invalid="input error" el-validation="onkeyup"></input-form>

        <submit-form el-type="submit" el-name="Submit"></submit-form>

        <hr class="my-4">
        <small class="text-body-secondary">
            you agree to the terms of use.
            <a href="<?= Web::getPath('get_signin') ?>" class="nav-like">Signin</a>
            or
            <a href="<?= Web::getPath('get_signup') ?>" class="nav-like">Signup</a>
        </small>
    </custom-form>
</div>