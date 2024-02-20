<h1 class="display-6">Group Permission</h1>
<hr class="border-bottm shadow">
<div class="app-card app-card-settings shadow-sm p-4">
    <form action="/permission/<?= isset($data->group->guide) ? "update/{$data->group->guide}" : 'create' ?>" method="POST" enctype="multipart/form-data">
        <div class="row">
            <div class="col-sm-5">
                <div class="mb-3">
                    <label for="name" class="form-label"><?= $data->label->get('table_group_name', 'Group Name'); ?></label>
                    <input type="test" class="form-control" name="name" value="<?= $data->group->name ?>" id="name" placeholder="admin" required="">
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label"><?= $data->label->get('table_description', 'Description'); ?></label>
                    <textarea class="form-control h-100" name="description" id="description" rows="10"><?= $data->group->description ?></textarea>
                </div>
                <button type="submit" class="btn btn-primary"><?= $data->label->get('update', 'Update'); ?></button>
            </div>
            <div class="col-sm-7">
                <div class="row">
                    <?php foreach ($data->modules as $key => $module) :
                        $currentActions = $data->group->permission[$module->directory] ?? []; ?>
                        <div class="col-6 mb-3">
                            <div>
                                <span class="nav-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-database-fill-gear" viewBox="0 0 16 16">
                                        <?= $module->icon ?>
                                    </svg>
                                </span>
                                <span class="nav-link-text text-capitalize"><?= $data->label->get($module->name, $module->name); ?></span>
                            </div>
                            <div class="row m-0 mb-3">
                                <?php foreach ($module->actions as $keyAction => $action) : ?>
                                    <label class="col-sm-4 form-check" for="check_<?= $keyAction ?>">
                                        <input class="form-check-input" type="checkbox" value="<?= $action ?>" id="check_<?= $module->directory ?>_<?= $action ?>" name="<?= $module->directory ?>[]" <?= in_array($action, $currentActions) ? 'checked' : null ?>>
                                        <label class="form-check-label" for="check_<?= $module->directory ?>_<?= $action ?>">
                                            <?= $action ?>
                                        </label>
                                    </label>
                                <?php endforeach; ?>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </form>
</div><!--//die-->