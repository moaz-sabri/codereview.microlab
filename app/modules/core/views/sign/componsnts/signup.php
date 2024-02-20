<?php

use App\Bootstrap\Web;
?>
<div class="modal-header p-5 pb-4 border-bottom-0">
    <h1 class="fw-bold mb-0 fs-2">Sign Up</h1>
</div>

<div class="modal-body p-5 pt-0">


    <custom-form el-action="<?= Web::getPath('post_signup') ?>" el-method="POST" el-enctype="application/json">

        <input-form el-type="text" el-lebel="Username" el-id="username" el-placeholder="johantomas" el-required="true" valid="valid" invalid="input error">
        </input-form>

        <input-form el-type="email" el-lebel="Email Address" el-id="email" el-placeholder="name@example.com" el-required="true" valid="valid" invalid="input error" el-validation="onkeyup"></input-form>

        <input-form el-type="password" el-lebel="Password" el-id="new_password" el-placeholder="*********" el-required="true" valid="valid" invalid="input error" el-validation="onkeyup"></input-form>

        <input-form el-type="password" el-lebel="Confirm Password" el-id="confirm_password" el-placeholder="********" el-required="true" valid="valid" invalid="input error" el-validation="onkeyup"></input-form>

        <submit-form el-type="submit" el-name="Submit"></submit-form>

        <hr class="my-4">
        <small class="text-body-secondary">
            By clicking Sign up, you agree to the terms of use.
            <a href="<?= Web::getPath('get_signin') ?>" class="nav-like">Signin</a>
        </small>
    </custom-form>
</div>