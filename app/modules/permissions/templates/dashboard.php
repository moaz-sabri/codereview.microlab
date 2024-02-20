<div class="row g-3 mb-4 align-items-center justify-content-between">
    <div class="col-auto">
        <h1 class="app-page-title mb-0">
            <?= $data->label->get('permission_groups', 'Permission Groups'); ?>
        </h1>
    </div>
    <div class="col-auto">
        <a href="/permission/store" class="btn btn-primary">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-shield-plus" viewBox="0 0 16 16">
                <path d="M5.338 1.59a61.44 61.44 0 0 0-2.837.856.481.481 0 0 0-.328.39c-.554 4.157.726 7.19 2.253 9.188a10.725 10.725 0 0 0 2.287 2.233c.346.244.652.42.893.533.12.057.218.095.293.118a.55.55 0 0 0 .101.025.615.615 0 0 0 .1-.025c.076-.023.174-.061.294-.118.24-.113.547-.29.893-.533a10.726 10.726 0 0 0 2.287-2.233c1.527-1.997 2.807-5.031 2.253-9.188a.48.48 0 0 0-.328-.39c-.651-.213-1.75-.56-2.837-.855C9.552 1.29 8.531 1.067 8 1.067c-.53 0-1.552.223-2.662.524zM5.072.56C6.157.265 7.31 0 8 0s1.843.265 2.928.56c1.11.3 2.229.655 2.887.87a1.54 1.54 0 0 1 1.044 1.262c.596 4.477-.787 7.795-2.465 9.99a11.775 11.775 0 0 1-2.517 2.453 7.159 7.159 0 0 1-1.048.625c-.28.132-.581.24-.829.24s-.548-.108-.829-.24a7.158 7.158 0 0 1-1.048-.625 11.777 11.777 0 0 1-2.517-2.453C1.928 10.487.545 7.169 1.141 2.692A1.54 1.54 0 0 1 2.185 1.43 62.456 62.456 0 0 1 5.072.56z" />
                <path d="M8 4.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V9a.5.5 0 0 1-1 0V7.5H6a.5.5 0 0 1 0-1h1.5V5a.5.5 0 0 1 .5-.5z" />
            </svg>
        </a>
    </div>
</div>
<div class="app-card app-card-orders-table shadow-sm mb-5">
    <div class="app-card-body p-3">
        <div class="table-responsive-md container pt-3">
            <div>
                <form action="/permission/switch" method="post" class="row g-2 mb-2 d-flex justify-content-end">
                    <input type="hidden" id="select-list" class="form-control" name="scope" value="" aria-describedby="submit-status">
                    <input type="hidden" name="selected" class="form-control">
                    <div class="col-12 col-md-3">
                        <div class="input-group">
                            <select class="form-select form-select-sm" aria-label="Default select example" onchange="switchType(event, 'status')">
                                <option value="" selected><?= $data->label->get('status', 'status'); ?></option>
                                <?php
                                foreach (App\Utilities\Utilitie::activation()  as $key => $value) : ?>
                                    <option value="<?= $value ?>"><?= $data->label->get($value, $value); ?></option>
                                <?php endforeach; ?>
                            </select>
                            <button title="<?= $data->label->get('table_apply', 'Apply'); ?>" type="submit" id="submit-status" class="btn btn-sm btn-primary" disabled>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
                                    <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <table class="table table-light table-hover">
                <thead>
                    <tr>
                        <th scope="col" class="cell">
                            <div class="form-check">
                                <input class="form-check-input" onchange="chnageAll(event)" type="checkbox" id="checkAll">
                            </div>
                        </th>
                        <th scope="col" class="cell"><?= $data->label->get('table_guide', 'Guide'); ?></th>
                        <th scope="col" class="cell"><?= $data->label->get('table_group_name', 'Group Name'); ?></th>
                        <th scope="col" class="cell"><?= $data->label->get('users', 'Users'); ?></th>
                        <th scope="col" class="cell"><?= $data->label->get('table_description', 'Description'); ?></th>
                        <th scope="col" class="cell"></th>
                        <th scope="col" class="cell"></th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <?php if (isset($data->obj->result)) : foreach ($data->obj->result as $group) : ?>
                            <tr>
                                <th class="exclude-export cell">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" onchange="selectOne(event)" value="<?= $group->permissiongroups_guide ?>" id="<?= $group->permissiongroups_guide ?>">
                                    </div>
                                </th>
                                <th class="cell" scope="col"><?= $group->permissiongroups_guide ?></th>
                                <td class="cell" scope="col"><?= $group->permissiongroups_name ?></td>
                                <td class="cell" scope="col"><?= $group->user_count ?></td>
                                <td class="cell" scope="col"><?= $group->permissiongroups_description ?></td>
                                <td class="cell text-end">
                                    <form action="/permission/switch/<?= $group->permissiongroups_guide ?>" method="post">
                                        <input type="hidden" name="scope" value="status">

                                        <select class="form-select form-select-sm" aria-label="Default select example" onchange="submit()" name="switch">
                                            <?php foreach (App\Utilities\Utilitie::activation() as $key => $value) : ?>
                                                <option <?= $group->permissiongroups_status === $value ? 'selected' : null ?> value="<?= $value ?>"><?= $data->label->get($value, $value) ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </form>
                                </td>
                                <td class="cell text-end">
                                    <?php
                                    $dropactions = [
                                        "edit" => [
                                            "mode" => "link",
                                            "icon" => '
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                            </svg>
                                            ',
                                            "route" =>  "/permission/edit/{$group->permissiongroups_guide}"
                                        ],
                                    ];

                                    $require_dropactions = DROPACTIONS;
                                    if (file_exists($require_dropactions)) :
                                        require $require_dropactions;
                                    else :
                                        $_SESSION['alert'] = "Not founded ({$require_dropactions}) file";
                                        exit;
                                    endif;
                                    ?>
                                </td>
                            </tr>
                    <?php endforeach;
                    endif; ?>
                </tbody>
            </table>
        </div>
        <nav class="app-pagination">
            <?php require PAGINATION; ?>
        </nav>
    </div>
</div>