<div class="app-card app-card-orders-table shadow-sm p-5 mb-5">
    <div class="app-card-body">
        <h1>Setup</h1>
        <form action="/setup/install" method="post">
            <input type="hidden" name="key" value="<?= SECRET_KEY ?>">
            <div class="row g-4 mb-3">
                <?php
                foreach ($data->modules as $key => $module) : if (!empty($module->model)) : ?>
                        <div class="col-md-6 col-xl-4 col-xxl-3" <?= $module->required ? 'aria-readonly="true"' : null ?>>
                            <label for="<?= $module->directory ?>" class="d-block app-card app-card-doc shadow-sm h-100 position-relative">
                                <span class="position-absolute top-50 end-0 translate-middle badge rounded-pill bg-danger">
                                    <?= $module->required ? 'required' : 'Optionaly' ?>
                                </span>
                                <div class="app-card-thumb-holder p-3">
                                    <input type="checkbox" class="form-check-input" name="modules[<?= $module->directory ?>]" <?= $module->required ? 'checked' : null ?> id="<?= $module->directory ?>" <?= $module->required ? 'required' : null ?>>
                                    <span class="icon-holder">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-database-fill-gear" viewBox="0 0 16 16">
                                            <?php if (isset($module->icon)) : ?>
                                                <?= $module->icon ?>
                                            <?php else : ?>
                                                ICON
                                            <?php endif; ?>
                                        </svg>
                                    </span>
                                </div>
                                <div class="app-card-body p-3 has-card-actions">

                                    <h4 class="app-doc-title truncate mb-0 text-capitalize">
                                        <?= $module->name ?>
                                    </h4>
                                    <p class="text-muted">
                                        <?= $module->description ?>
                                    </p>
                                </div><!--//app-card-body-->

                            </label>
                        </div><!--//col-->
                <?php endif;
                endforeach; ?>
            </div>
            <div class="text-end">
                <button type="submit" class="btn btn-lg btn-primary">Install</button>
            </div>
        </form>
    </div>
</div>