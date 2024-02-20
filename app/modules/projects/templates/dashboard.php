<div class="row mb-4">
    <h1 class="col app-page-title mb-0 text-capitalize">
        <?= $data->label->get('projects', 'project'); ?>
    </h1>
    <div class="col m-auto text-end">
        <a href="/project/editor" class="btn btn-primary pb-0">
            <i class="bi bi-plus-lg"></i>
        </a>
    </div>
</div>
<div class="app-card app-card-orders-table shadow-sm mb-5">
    <div class="app-card-body p-3">
        <div class="table-responsive-md container">
            <div>
                <form role="form" onsubmit="return submitTypeProject(event)" action="/api/project/switch/multiple" method="post" class="row g-2 mb-2 d-flex justify-content-end">
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
                            <div class="my-3">
                                <div class="loading">Loading</div>
                                <div class="error-message"></div>
                                <div class="sent-message">Your message has been sent. Thank you!</div>
                            </div>
                            <button title="<?= $data->label->get('table_apply', 'Apply'); ?>" type="submit" id="submit-status" class="btn btn-sm btn-primary" disabled>
                                <i class="bi bi-check2-all"></i>
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
                        <th class="cell"><?= $data->label->get('staticfile', 'guide'); ?></th>
                        <th class="cell"><?= $data->label->get('name', 'Name'); ?></th>
                        <th class="cell"><?= $data->label->get('table_status', 'Status'); ?></th>
                        <th class="cell"><?= $data->label->get('table_date', 'Date'); ?></th>
                        <th class="cell">T&S</th>
                        <th class="cell"></th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <?php if (isset($data->obj->result)) : foreach ($data->obj->result as $key => $project) : ?>
                            <tr>
                                <th class="exclude-export cell">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" onchange="selectOne(event)" value="<?= $project->guide ?>" id="<?= $project->guide ?>">
                                    </div>
                                </th>
                                <td class="cell text-center">
                                    #<?= $project->guide ?>
                                </td>
                                <td class="cell">
                                    <?= $project->title ?>
                                </td>
                                <td class="cell">
                                    <?= $project->type ?>
                                    <strong> | </strong>
                                    <?= $project->status ?>
                                </td>
                                <td class="cell">
                                    <?= date(DATE_VIEW, strtotime($project->updated_at)) ?>
                                </td>
                                <td class="cell">
                                    <form role="form" onsubmit="return submitTypeProject(event)" action="/api/project/switch/<?= $project->guide ?>" method="POST">
                                        <input type="hidden" name="scope" value="status">

                                        <div class="input-group mb-3">
                                            <div class="my-3">
                                                <div class="loading">Loading</div>
                                                <div class="error-message"></div>
                                                <div class="sent-message">Your message has been sent. Thank you!</div>
                                            </div>
                                            <button type="submit" class="btn btn-sm btn-primary">
                                                <i class="bi bi-check2"></i>
                                            </button>
                                            <select class="form-select form-select-sm" aria-label="Default select example" name="switch">
                                                <?php foreach (App\Utilities\Utilitie::activation() as $key => $value) : ?>
                                                    <option <?= $project->status === $value ? 'selected' : null ?> value="<?= $value ?>"><?= $data->label->get($value, $value) ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </form>
                                </td>
                                <td class="cell text-end">
                                    <?php

                                    $dropactions = [
                                        "preview" => [
                                            "mode" => "link",
                                            "icon" => '
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                            </svg>
                                            ',
                                            "route" =>  "/" . strtolower($project->type) . "/preview/{$project->friendlyurl}"
                                        ],
                                        "edit" => [
                                            "mode" => "link",
                                            "icon" => '
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                            </svg>
                                            ',
                                            "route" =>  "/project/editor/{$project->guide}"
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
                                            "function" => "selectId('delete-{$project->guide}', '/api/project/delete/{$project->guide}', 'Yes')",
                                            "modal" =>  'delete-' .  $project->guide
                                        ]
                                    ];
                                    $dropmodals = [
                                        [
                                            "dropid" => 'delete-' .  $project->guide,
                                            "droptitle" => "Delete user",
                                            "dropdescription" => "<p class='text-start'>Are you sure you want to delete this User:&nbsp;<strong>{$project->title}</strong>?</p>",
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