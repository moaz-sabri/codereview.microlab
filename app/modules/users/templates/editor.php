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
            <form action="/user/<?= isset($data->obj->users_guide) ? "update/{$data->obj->users_guide}" : 'create' ?>" method="POST" enctype="multipart/form-data" class="settings-form">
                <div class="mb-3">
                    <label for="name" class="form-label">
                        <?= $data->label->get('table_username', 'User Name') ?>
                    </label>
                    <input type="text" class="form-control" id="name" name="name" value="<?= $data->obj->users_name ?>" placeholder="Lorem Ipsum Ltd." required="">
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label"><?= $data->label->get('victim_email', 'Email Address') ?></label>
                    <input type="email" class="form-control" id="email" name="email" value="<?= $data->obj->users_email ?>" required="">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label"><?= $data->label->get('password', 'Password') ?></label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="password">
                </div>
                <hr>
                <div class="mb-3">
                    <label for="activation" class="form-label">
                        <?= $data->label->get('activation', 'activation') ?>
                    </label>
                    <select class="form-select" name="activation" id="activation" aria-label="Default select example">
                        <?php

                        foreach (App\Utilities\Utilitie::activation() as $key => $value) : ?>
                            <option <?= $data->obj->users_activation === $value ? 'selected' : null ?> value="<?= $value ?>"><?= $data->label->get($value, $value) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="roles" class="form-label">
                        <?= $data->label->get('roles', 'Roles') ?>
                    </label>
                    <select class="form-select" name="roles" id="roles" aria-label="Default select example">
                        <?php foreach (App\Modules\Users\Models\UserModel::$roleOptions as $key => $value) : ?>
                            <option <?= $data->obj->users_roles === $value ? 'selected' : null ?> value="<?= $value ?>"><?= $data->label->get($value, $value) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="group_id" class="form-label">
                        <?= $data->label->get('table_group_name', 'Group Name') ?>
                    </label>
                    <select class="form-select" name="group_id" id="group_id" aria-label="Default select example">
                        <?php foreach ($data->groups as $key => $group) : ?>
                            <option <?= $data->obj->g_uid === $group->uid ? 'selected' : null ?> value="<?= $group->uid ?>"><?= $group->name ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary"><?= $data->label->get('save_changes', 'Save Changes') ?></button>
            </form>
        </div>
    </div>
</div>