<div class="card">
    <div class="card-header">
        <h3>Feedback</h3>
    </div>
    <form id="submitContact" class="card-body needs-validation" novalidate="">
        <input type="hidden" name="type" value="FEEDBACK">

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

        <button type="button" onclick="submitContact()" class="btn btn-primary">Send</button>
    </form>
    <div class="card-footer">
        <p>Supp</p>
    </div>
</div>