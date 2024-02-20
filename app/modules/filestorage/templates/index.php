<div class="row mb-4">
    <h1 class="col app-page-title mb-0">
        <?= $data->label->get('file_storage', 'File Storage'); ?>
    </h1>
    <div class="col">
        <?php require WEBROOT . DS . 'modules/filestorage/templates/components/uploads.php'; ?>
    </div>
</div>
<div class="app-card app-card-orders-table shadow-sm mb-5">
    <div class="app-card-body p-3">
        <div class="table-responsive-md container">
            <div>
                <form action="/file/switch" method="post" class="row g-2 mb-2 d-flex justify-content-end">
                    <input type="hidden" id="select-list" class="form-control" name="scope" value="" aria-describedby="submit-status">
                    <input type="hidden" name="selected" class="form-control">
                    <div class="col-12 col-md-3">
                        <div class="input-group">
                            <select class="form-select form-select-sm" aria-label="Default select example" onchange="switchType(event, 'status')">
                                <option value="" selected><?= $data->label->get('status', 'status'); ?></option>
                                <?php
                                foreach (App\Utilities\Utilitie::activation() as $key => $value) : ?>
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
                    <tr id="headTable">
                        <th scope="col" class="cell">
                            <div class="form-check">
                                <input class="form-check-input" onchange="chnageAll(event)" type="checkbox" id="checkAll">
                            </div>
                        </th>
                        <th class="cell"><?= $data->label->get('table_guide', 'Guide'); ?></th>
                        <th class="cell"><?= $data->label->get('name', 'Name'); ?></th>
                        <th class="cell"><?= $data->label->get('table_status', 'Status'); ?></th>
                        <th class="cell"><?= $data->label->get('table_date', 'Date'); ?></th>
                        <th class="cell"></th>
                        <th class="cell"></th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <?php if (isset($data->obj->result)) : foreach ($data->obj->result as $key => $file) : ?>
                            <tr>
                                <th class="exclude-export cell">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" onchange="selectOne(event)" value="<?= $file->guide ?>" id="<?= $file->guide ?>">
                                    </div>
                                </th>
                                <td class="cell text-center">
                                    #<?= $file->guide ?>
                                    <div>
                                        <img <?php if (file_exists(STORAGE . $file->path)) : ?> src="/storage<?= $file->path ?>" <?php else : ?> src="/public/assets/placeholder.webp" <?php endif; ?> alt="<?= $file->name ?>" class="lazyload" width="150" loading="lazy">
                                    </div>
                                </td>
                                <td class="cell">
                                    <?= $file->name ?>
                                </td>
                                <td class="cell">
                                    <?= $file->status ?>
                                </td>
                                <td class="cell">
                                    <?= date(DATE_VIEW, strtotime($file->updated_at)) ?>
                                </td>
                                <td class="cell">
                                    <form action="/file/switch/<?= $file->guide ?>" method="POST">
                                        <input type="hidden" name="scope" value="status">

                                        <select class="form-select form-select-sm" aria-label="Default select example" onchange="submit()" name="switch">
                                            <?php foreach (App\Utilities\Utilitie::activation() as $key => $value) : ?>
                                                <option <?= $file->status === $value ? 'selected' : null ?> value="<?= $value ?>"><?= $data->label->get($value, $value) ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </form>
                                </td>
                                <td class="cell text-end">
                                    <?php
                                    $dropactions = [
                                        "delete" => [
                                            "mode" => "modal",
                                            "icon" => '
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                                            <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
                                            </svg>
                                            ',
                                            "function" => "selectId('delete-{$file->guide}', '/file/delete/{$file->guide}', 'Yes')",
                                            "modal" =>  'delete-' .  $file->guide
                                        ]
                                    ];
                                    $dropmodals = [
                                        [
                                            "dropid" => 'delete-' .  $file->guide,
                                            "droptitle" => "Delete user",
                                            "dropdescription" => "<p class='text-start'>Are you sure you want to delete this User:&nbsp;<strong>{$file->name}</strong>?</p>",
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
