<div class="row mb-4">
    <h1 class="col app-page-title mb-0 text-capitalize">
        <?= $data->label->get('notification', 'notification'); ?>
    </h1>
</div>
<div class="app-card app-card-orders-table shadow-sm mb-5">
    <div class="app-card-body p-3">
        <div class="table-responsive-md container">
            <table class="table table-light table-hover">
                <thead>
                    <tr id="headTable">
                        <th class="cell"><?= $data->label->get('table_guide', 'Guide'); ?></th>
                        <th class="cell"><?= $data->label->get('name', 'Name'); ?></th>
                        <th class="cell"><?= $data->label->get('table_status', 'Status'); ?></th>
                        <th class="cell"><?= $data->label->get('table_date', 'Date'); ?></th>
                        <th class="cell"></th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <?php if (isset($data->obj->result)) : foreach ($data->obj->result as $key => $notification) : ?>
                            <tr>
                                <td class="cell text-center">
                                    #<?= $notification->guide ?>
                                </td>
                                <td class="cell">
                                    <?= $notification->header ?>
                                </td>
                                <td class="cell">
                                    <?= $notification->status ?>
                                </td>
                                <td class="cell">
                                    <?= date(DATE_VIEW, strtotime($notification->created_at)) ?>
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
                                            "function" => "selectId('delete-{$notification->guide}', '/notification/delete/{$notification->guide}', 'Yes')",
                                            "modal" =>  'delete-' .  $notification->guide
                                        ]
                                    ];
                                    $dropmodals = [
                                        [
                                            "dropid" => 'delete-' .  $notification->guide,
                                            "droptitle" => "Delete user",
                                            "dropdescription" => "<p class='text-start'>Are you sure you want to delete this User:&nbsp;<strong>{$notification->header}</strong>?</p>",
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