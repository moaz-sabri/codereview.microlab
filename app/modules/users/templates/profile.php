<div class="row g-3 mb-4 align-items-center justify-content-between">
    <div class="col-auto">
        <h1 class="app-page-title mb-0">
            <?= $data->label->get('edit_profile', 'Edit Profile') ?>
        </h1>
    </div>
</div>

<div class="col-12 col-md-11">
    <div class="app-card app-card-settings shadow-sm p-4">
        <div class="app-card-body">
            <form action="/user/update_profile/<?= $data->obj->guide ?>" method="POST" enctype="multipart/form-data" class="settings-form">
                <div class="card border-0 pb-2 border-bottom col-md-9 mb-3">
                    <div class="row g-0">
                        <div class="col-3 d-flex align-items-center mb-3">
                            <div class="mx-auto rounded-circle overflow-hidden">
                                <img class="img-fluid lazyload" src="/storage<?= $data->obj->avatar ?>" height="120px" width="120px" alt="user profile" loading="lazy">
                            </div>
                        </div>
                        <div class="col-9">
                            <div class="card-body">
                                <label for="formFile" class="form-label card-text"><?= $data->label->get('upload_new_avatar', 'Upload new avatar') ?></label>
                                <input class="form-control" id="formFileF" type="file" name="file" accept="image/*" aria-describedby="upload_new_avatar">
                                <p class="form-text" id="upload_new_avatar"><small class="text-body-secondary">The maximum file size allowed is 2MB.</small></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">
                        <span class="me-3"><?= $data->label->get('table_username', 'User Name') ?></span>
                        <span class="badge rounded-pill text-bg-success"><?= $data->obj->roles ?></span>
                    </label>
                    <input type="text" class="form-control" id="name" name="name" value="<?= $data->obj->name ?>">
                </div>
                <div class="row g-3 mb-3">
                    <div class="col-12 col-md-6">
                        <label for="firstname" class="form-label"><?= $data->label->get('victim_firstname', 'Firstname') ?></label>
                        <input type="text" class="form-control" id="firstname" name="firstname" value="<?= $data->obj->firstname ?>" placeholder="<?= $data->obj->firstname ?>">
                    </div>
                    <div class="col-12 col-md-6">
                        <label for="lastname" class="form-label"><?= $data->label->get('victim_lastname', 'Lastname') ?></label>
                        <input type="text" class="form-control" id="lastname" name="lastname" value="<?= $data->obj->lastname ?>" placeholder="Doe">
                    </div>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label"><?= $data->label->get('victim_email', 'Email Address') ?></label>
                    <input type="text" class="form-control" id="email" name="email" value="<?= $data->obj->email ?>" placeholder="<?= CONTACT_MAIL ?>">
                </div>
                <div class="row g-3 mb-3">
                    <div class="col-12 col-md-6">
                        <label for="oldpassword" class="form-label"><?= $data->label->get('current_password', 'Current Password') ?></label>
                        <input type="password" class="form-control" id="oldpassword" name="oldpassword" placeholder="old password" autocomplete="oldpassword">
                    </div>
                    <div class="col-12 col-md-6">
                        <label for="password" class="form-label"><?= $data->label->get('set_new_password', 'New Password') ?></label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="new password" autocomplete="password">
                    </div>
                    <div class="col-md-10 col-12 me-auto ms-2 mt-1 small text-muted"><?= $data->label->get('conditions_password', 'Your password must meet the following criteria: It must contain at least one uppercase letter (A-Z), one lowercase letter (a-z), one numeric digit (0-9), and one special character (e.g., !@#$%^&*).') ?></div>
                </div>
                <button type="submit" class="btn btn-primary"><?= $data->label->get('save_changes', 'Save Changes') ?></button>
            </form>
        </div>
    </div>
</div>