<div class="modal modal-sheet position-static d-block bg-body-secondary p-4 py-md-5" tabindex="-1" role="dialog"
    id="modalSignin">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
            <?php
            if ($this->data->branch === 'signup'):
                require_once __DIR__ . '/componsnts/signup.php';
            elseif ($this->data->branch === 'forgotpassword'):
                require_once __DIR__ . '/componsnts/forgotpassword.php';
            elseif ($this->data->branch === 'resetpassword'):
                require_once __DIR__ . '/componsnts/resetpassword.php';
            elseif ($this->data->branch === 'confirm'):
                require_once __DIR__ . '/componsnts/confirm.php';
            elseif ($this->data->branch === 'sentmail'):
                require_once __DIR__ . '/componsnts/sentmail.php';
            else:
                require_once __DIR__ . '/componsnts/signin.php';
            endif;
            ?>
        </div>
    </div>
</div>
