<h2 class="auth-heading text-center mb-4"><?= $data->label->get('forget_password_title', 'Password Forgot'); ?></h2>

<div class="auth-intro mb-4 text-center"><?= $data->label->get('forget_password_text', 'Enter your email address below. We will email you a link to a page where you can easily create a new password.'); ?></div>

<div class="auth-form-container text-start">
    <form role="form" onsubmit="return submitToForgotPassword(event)" method="POST" action="api/auth/forgotpassword" class="needs-validation auth-form login-form text-body-emphasis" novalidate="">
        <div class="form-floating mb-3">
            <input id="inter-email" name="email" type="text" placeholder="name@example.com" class="form-control" required="required">
            <label for="inter-email"><?= $data->label->get('email_address', 'Email Address'); ?></label>
        </div>
        <div class="text-center">
            <div>
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
            </div>
            <button type="submit" class="btn btn-primary btn-block theme-btn mx-auto"><?= $data->label->get('reset_password', 'Reset Password'); ?></button>
        </div>
    </form>
    <div class="auth-option text-center pt-5">
        <a class="app-link text-primary" href="/login"><?= $data->label->get('back_login', 'Back to Login'); ?></a>
    </div>
</div>