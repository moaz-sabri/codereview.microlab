<h2 class="auth-heading text-center mb-4"><?= $data->label->get('reset_password', 'Reset Password'); ?></h2>

<div class="auth-intro mb-4 text-center"><?= $data->label->get('reset_password_text', 'Enter your Verified Code below. We will email you a link to a page where you can easily create a new password.'); ?></div>

<div class="auth-form-container text-left">
    <form role="form" onsubmit="return submitToResetPassword(event)" action="api/auth/resetpassword" method="POST" class="needs-validation auth-form login-form text-body-emphasis" novalidate="">
        <input type="hidden" name="guide" value="<?= $data->param->target ?>">
        <div class="form-floating mb-3">
            <input id="verifiedcode" name="verifiedcode" type="text" placeholder="N0N0N-N0N0N" required class="form-control">
            <label for="verifiedcode"><?= $data->label->get('verified_code', 'verified_code'); ?></label>
        </div>
        <div class="form-floating mb-3">
            <input type="password" class="form-control" name="password" id="password" placeholder="********" required="">
            <label for="password"><?= $data->label->get('new_password', 'new_password'); ?></label>
        </div>
        <div class="text-center">
            <div>
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
            </div>
            <button type="submit" class="btn btn-primary btn-block theme-btn mx-auto"><?= $data->label->get('set_new_password', 'Set new Password'); ?></button>
        </div>
    </form>
    <div class="auth-option text-center pt-5">
        <a class="app-link text-primary" href="/login"><?= $data->label->get('back_login', 'Back to Login'); ?></a>
    </div>
</div>