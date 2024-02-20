<div class="position-relative mb-3">
    <div class="row g-3 justify-content-between">
        <div class="col-auto">
            <h1 class="app-page-title mb-0">E-Mail Box</h1>
        </div>
        <div class="col-auto">
            <div class="page-utilities btn-toolbar">
                <?php

                use App\Modules\Emails\Models\MailboxModel; ?>

                <div class="dropdown me-2">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <?= $data->label->get('type', 'TYPE'); ?>
                    </a>

                    <ul class="dropdown-menu">
                        <?php foreach (MailboxModel::$typeOptions as $key => $type) : ?>
                            <li>
                                <a href="/dashboard/mailbox?type=<?= $type ?>" class="dropdown-item">
                                    <?= $type ?>
                                </a>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                </div><!--//type-dropdown-->
                <div class="dropdown">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <?= $data->label->get('status', 'STATUS'); ?>
                    </a>

                    <ul class="dropdown-menu">
                        <?php

                        foreach (MailboxModel::$statusOptions as $key => $status) : ?>
                            <li>
                                <a href="/dashboard/mailbox?status=<?= $status ?>" class="dropdown-item">
                                    <?= $status ?>
                                </a>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                </div><!--//status-dropdown-->
            </div><!--//page-utilities-->
        </div>
    </div>
</div>

<?php
if (isset($data->obj->result)) :
    foreach ($data->obj->result as $key => $mail) : ?>
        <div class="app-card app-card-notification shadow-sm mb-4" onclick="updateMailStatus('<?= $mail->guide ?>')">
            <div class="app-card-header row px-4 py-3">
                <div class="row m-0 col-8 g-3 align-items-center">
                    <div class="col-12 col-lg-auto text-start">
                        <div class="app-icon-holder">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                                <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z" />
                            </svg>
                        </div><!--//app-icon-holder-->
                    </div><!--//col-->
                    <div class="col-12 col-lg-auto text-start">
                        <div class="notification-type mb-2">
                            <span class="badge bg-warning">
                                <?= $mail->type ?> |
                                <?= $mail->status ?>
                            </span>
                        </div>
                        <h4 class="notification-title mb-1">
                            <?= $mail->subject ?>
                        </h4>

                        <ul class="notification-meta list-inline mb-0">
                            <li class="list-inline-item"><?= $mail->email ?></li>
                            <li class="list-inline-item">|</li>
                            <li class="list-inline-item"><?= $mail->telnumber ?></li>
                        </ul>

                    </div><!--//col-->
                </div><!--//row-->
                <div class="col-4  px-4 py-3 text-end">
                    <?php
                    $dropactions = [
                        "delete" => [
                            "mode" => "modal",
                            "icon" => '
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                                            <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
                                            </svg>
                                            ',
                            "function" => "selectId('delete-{$mail->guide}', '/mailbox/delete/{$mail->guide}', 'Yes')",
                            "modal" =>  'delete-' .  $mail->guide
                        ]
                    ];
                    $dropmodals = [
                        [
                            "dropid" => 'delete-' .  $mail->guide,
                            "droptitle" => "Delete user",
                            "dropdescription" => "<p class='text-start'>Are you sure you want to delete this User:&nbsp;<strong>{$mail->name}</strong>?</p>",
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
                    <a href="mailto:<?= $mail->email ?>" class="btn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply" viewBox="0 0 16 16">
                            <path d="M6.598 5.013a.144.144 0 0 1 .202.134V6.3a.5.5 0 0 0 .5.5c.667 0 2.013.005 3.3.822.984.624 1.99 1.76 2.595 3.876-1.02-.983-2.185-1.516-3.205-1.799a8.74 8.74 0 0 0-1.921-.306 7.404 7.404 0 0 0-.798.008h-.013l-.005.001h-.001L7.3 9.9l-.05-.498a.5.5 0 0 0-.45.498v1.153c0 .108-.11.176-.202.134L2.614 8.254a.503.503 0 0 0-.042-.028.147.147 0 0 1 0-.252.499.499 0 0 0 .042-.028l3.984-2.933zM7.8 10.386c.068 0 .143.003.223.006.434.02 1.034.086 1.7.271 1.326.368 2.896 1.202 3.94 3.08a.5.5 0 0 0 .933-.305c-.464-3.71-1.886-5.662-3.46-6.66-1.245-.79-2.527-.942-3.336-.971v-.66a1.144 1.144 0 0 0-1.767-.96l-3.994 2.94a1.147 1.147 0 0 0 0 1.946l3.994 2.94a1.144 1.144 0 0 0 1.767-.96v-.667z" />
                        </svg>
                    </a>
                </div><!--//col-->
            </div><!--//app-card-header-->

            <div class="app-card-body p-4">
                <div class="notification-content">
                    <?= $mail->message ?>
                </div>
            </div><!--//app-card-body-->

            <div class="app-card-footer text-end px-4 py-3">
                <i class="text-muted fs-6 "><?= $mail->updated_at ?></i>
            </div><!--//app-card-footer-->
        </div><!--//app-card-->
<?php endforeach;
endif; ?>

<nav class="app-pagination">
    <?php require PAGINATION; ?>
</nav>