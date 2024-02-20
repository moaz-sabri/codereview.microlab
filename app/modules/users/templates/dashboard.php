<div class="container">
    <div class="row g-3 mb-4 align-items-center justify-content-between">
        <div class="col-auto">
            <h1 class="app-page-title mb-0">
                <?= $data->label->get('users', 'Users'); ?>
            </h1>
        </div>
        <div class="col-auto">
            <a href="/user/store" class="btn btn-primary">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-add" viewBox="0 0 16 16">
                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0Zm-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Z" />
                    <path d="M8.256 14a4.474 4.474 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10c.26 0 .507.009.74.025.226-.341.496-.65.804-.918C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4s1 1 1 1h5.256Z" />
                </svg>
            </a>
        </div>
    </div>
</div>
<div class="app-card app-card-orders-table shadow-sm mb-5">
    <div class="app-card-body p-3">
        <div class="table-responsive-md container">
            <div>
                <form action="/user/switch" method="post" class="row g-2 mb-2 d-flex justify-content-end">
                    <input type="hidden" id="select-list" class="form-control" name="scope" value="" aria-describedby="submit-activation">
                    <input type="hidden" name="selected" class="form-control">
                    <div class="col-12 col-md-3">
                        <div class="input-group">
                            <select class="form-select form-select-sm" aria-label="Default select example" onchange="switchType(event, 'activation')">
                                <option value="" selected><?= $data->label->get('activation', 'Activation'); ?></option>
                                <?php
                                foreach (App\Utilities\Utilitie::activation() as $key => $value) : ?>
                                    <option value="<?= $value ?>"><?= $data->label->get($value, $value); ?></option>
                                <?php endforeach; ?>
                            </select>
                            <button title="<?= $data->label->get('table_apply', 'Apply'); ?>" type="submit" id="submit-activation" class="btn btn-sm btn-primary" disabled>
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
                        <th scope="col" class="cell"><?= $data->label->get('table_Avatar', 'Avatar'); ?></th>
                        <th scope="col" class="cell"><?= $data->label->get('table_username', 'User name'); ?></th>
                        <th scope="col" class="cell"><?= $data->label->get('table_email', 'Email'); ?></th>
                        <th scope="col" class="cell"><?= $data->label->get('table_role', 'Role'); ?></th>
                        <th scope="col" class="cell"><?= $data->label->get('table_created_at', 'Created Date'); ?></th>
                        <th scope="col" class="cell"></th>
                        <th scope="col" class="cell"></th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <?php if (isset($data->obj->result)) : foreach ($data->obj->result as $user) : ?>
                            <tr>
                                <th class="exclude-export cell">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" onchange="selectOne(event)" value="<?= $user->users_guide ?>" id="<?= $user->users_guide ?>">
                                    </div>
                                </th>

                                <td class="cell" scope="col"><?= $user->users_guide ?></td>
                                <td class="cell" scope="col">
                                    <?php if ($user->users_avatar) : ?>
                                        <img width="26px" class="rounded-circle" src="/storage<?= $user->users_avatar ?>" alt="avatar" class="lazyload"  loading="lazy">
                                    <?php else : ?>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle text-dark-emphasis" viewBox="0 0 16 16">
                                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                        </svg>
                                    <?php endif; ?>
                                </td>
                                <td class="cell" scope="col">
                                    <span><?= $user->users_name ?></span>
                                </td>
                                <td class="cell" scope="col"><?= $user->users_email ?></td>
                                <td class="cell" scope="col"><span class="badge bg-success"><?= $user->users_roles ?> | <?= $user->g_name ?> </span></td>
                                <td class="cell" scope="col"><?= date(DATE_FORMAT, strtotime($user->users_created_at)) ?></td>

                                <td class="cell text-end">
                                    <form action="/user/switch/<?= $user->users_guide ?>" method="post">
                                        <input type="hidden" name="scope" value="activation">

                                        <select class="form-select form-select-sm" aria-label="Default select example" onchange="submit()" name="switch">
                                            <?php foreach (App\Utilities\Utilitie::activation()  as $key => $value) : ?>
                                                <option <?= $user->users_activation === $value ? 'selected' : null ?> value="<?= $value ?>"><?= $data->label->get($value, $value) ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </form>
                                    <form action="/user/switch/<?= $user->users_guide ?>" method="post" class="mt-2">
                                        <input type="hidden" name="scope" value="roles">

                                        <select class="form-select form-select-sm" aria-label="Default select example" onchange="submit()" name="switch">
                                            <?php foreach (App\Modules\Users\Models\UserModel::$roleOptions as $key => $value) : ?>
                                                <option <?= $user->users_roles === $value ? 'selected' : null ?> value="<?= $value ?>"><?= $data->label->get($value, $value) ?></option>
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
                                            "route" =>  "/user/edit/{$user->users_guide}"
                                        ],
                                        "line" => [
                                            "mode" => "line",
                                        ],
                                        "delete" => [
                                            "mode" => "modal",
                                            "icon" => '
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                                            <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
                                            </svg>
                                            ',
                                            "function" => "selectId('delete-{$user->users_guide}', '/user/delete/{$user->users_guide}', 'Yes')",
                                            "modal" =>  'delete-' .  $user->users_guide
                                        ]
                                    ];
                                    $dropmodals = [
                                        [
                                            "dropid" => 'delete-' .  $user->users_guide,
                                            "droptitle" => "Delete user",
                                            "dropdescription" => "<p class='text-start'>Are you sure you want to delete this User:&nbsp;<strong>{$user->users_name}</strong>?</p>",
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
        <!-- <nav class="app-pagination">
            <?php require PAGINATION ?>
        </nav> -->
    </div>
</div>