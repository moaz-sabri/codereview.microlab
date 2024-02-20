<?php

use App\Bootstrap\Web;
?>
<div class="modal-header p-5 pb-4 border-bottom-0">
    <h1 class="fw-bold mb-0 fs-2">Mail be Sent</h1>
</div>

<div class="modal-body p-5 pt-0">
    <p>

        Thank you for reaching out to us! We've received your email and would like to confirm your inquiry.
    </p>
    <p>
        To proceed, please check your mailbox (including spam or junk folders) for a confirmation email from us. Click on the confirmation link provided in the email to verify your email address and confirm your inquiry.
    </p>
    <p>
        If you don't receive the confirmation email within the next few minutes, please double-check your mailbox. If you still don't find it, please feel free to contact us again at [Your Contact Email] for further assistance.
    </p>
    <p>
        Thank you for your cooperation.
    </p>
    <hr class="my-4">
    <small class="text-body-secondary">
        you agree to the terms of use.
        <a href="<?= Web::getPath('get_signin') ?>" class="nav-like">Signin</a>
        or
        <a href="<?= Web::getPath('get_signup') ?>" class="nav-like">Signup</a>
    </small>

</div>