<h2 class="auth-heading text-center mb-5"><?= $data->label->get('login_title', 'Welcome!'); ?></h2>
<div class="auth-form-container text-start">
    <form onsubmit="return submitToLogin(event)" action="api/auth/login" method="post" role="form" enctype="multipart/form-data" class="needs-validation auth-form login-form text-body-emphasis" novalidate="">
        <div class="form-floating mb-3">
            <input id="signin-email" name="email" type="text" placeholder="name@example.com" class="form-control signin-email" required="">
            <label for="signin-email"><?= $data->label->get('email_address', 'Email Address'); ?></label>
            <div class="valid-feedback">
                <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
            </div>
            <div class="invalid-feedback">
                <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
            </div>
        </div>
        <div class="form-floating mb-3">
            <input type="password" class="form-control" name="password" id="signin-password" placeholder="Password" autocomplete="password" required="">
            <label for="signin-password"><?= $data->label->get('password', 'Password'); ?></label>
            <div class="valid-feedback">
                <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
            </div>
            <div class="invalid-feedback">
                <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
            </div>
            <div id="signin-password" class="form-text text-end">
                <a href="/forgot/password"><?= $data->label->get('did_you_forget_password', 'Did you forget your password?'); ?></a>
            </div>
        </div>
        <div class="my-3">
            <div class="loading">Loading</div>
            <div class="error-message"></div>
            <div class="sent-message">Your message has been sent. Thank you!</div>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary w-100 theme-btn mx-auto"><?= $data->label->get('login', 'login'); ?></button>
        </div>
    </form>
    <div class="auth-option text-center pt-5">
        <?= $data->label->get('login_issue_text', ''); ?>
        <a class="text-link" title="Send an Email" href="mailto:<?= EMAIL_ADDRESS ?>"><?= $data->label->get('here', 'here'); ?></a>.
    </div>
</div>