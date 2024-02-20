<div class="modal fade" id="reportPopup" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="reportPopupLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form onsubmit="return submitContactForm(event)" action="api/mailbox/create" method="post" role="form-report" class="card-body needs-validation" novalidate="">
                <div class=" modal-header">
                <h1 class="modal-title fs-5" id="reportPopupLabel">Report <strong id="display"></strong></h1>
        </div>
        <div class="modal-body">
            <input type="hidden" name="type" value="REPORT">
            <input type="hidden" id="source" name="source" value="">

            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="subject" required="">
                <label for="subject">subject</label>
                <div class="valid-feedback">
                    <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
                </div>
                <div class="invalid-feedback">
                    <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
                </div>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="email" id="email" placeholder="email">
                <label for="email">email</label>
                <div class="valid-feedback">
                    <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
                </div>
                <div class="invalid-feedback">
                    <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
                </div>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="message" id="message" placeholder="message">
                <label for="message">message</label>
                <div class="valid-feedback">
                    <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
                </div>
                <div class="invalid-feedback">
                    <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
                </div>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="name" id="name" placeholder="name">
                <label for="name">name</label>
                <div class="valid-feedback">
                    <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
                </div>
                <div class="invalid-feedback">
                    <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
                </div>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="telnumber" id="telnumber" placeholder="telnumber">
                <label for="telnumber">telnumber</label>
                <div class="valid-feedback">
                    <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
                </div>
                <div class="invalid-feedback">
                    <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
                </div>
            </div>

        </div>
        <div class="my-3">
            <div class="loading">Loading</div>
            <div class="error-message"></div>
            <div class="sent-message">Your message has been sent. Thank you!</div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

            <button type="submit" class="btn btn-primary">Send</button>
        </div>
        </form>
    </div>
</div>
</div>