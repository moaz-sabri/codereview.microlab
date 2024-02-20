<?php

use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Notifications\Loader\NotificationLoader;
use App\Utilities\Utilitie;

$notifications = NotificationLoader::getNotification(); ?>

<a class="dropdown-toggle no-toggle-arrow text-primary" id="notifications-dropdown-toggle" data-bs-toggle="dropdown" href="javascript: void(0)" role="button" aria-expanded="false" title="Notifications">
    <svg width="1em" height="1em" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-bell icon" viewBox="0 0 16 16">
        <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
    </svg>
    <?php if (isset($notifications) && count((array)$notifications) > 0) : ?>
        <span id="numberOfNotifications" class="icon-badge"><?= count((array)$notifications) ?></span>
    <?php endif; ?>
</a>
<div class="dropdown-menu p-0" aria-labelledby="notifications-dropdown-toggle">
    <div class="dropdown-menu-header p-3">
        <h5 class="dropdown-menu-title mb-0"><?= $data->label->get('notifications', 'Notifications'); ?></h5>
    </div>
    <div class="dropdown-menu-content">
        <?php if (isset($notifications)) : foreach ($notifications as $key => $notification) : ?>
                <div class="item p-3">
                    <button onclick="updateNotificationStatus('<?= $notification->guide ?>')" class="btn w-100">
                        <div class="row gx-2 justify-content-between align-items-center">
                            <div class="col-auto">
                                <div class="app-icon-holder">
                                    <svg width="1em" height="1em" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
                                        <path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z" />
                                        <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5L9.5 0zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z" />
                                    </svg>
                                </div>
                            </div>
                            <div class="col">
                                <div class="info">
                                    <div class="desc text-start">
                                        <?= $notification->header ?>
                                    </div>
                                    <div class="meta"><?= date_format(date_create($notification->created_at), DATE_FORMAT); ?></div>
                                </div>
                            </div>
                        </div>
                    </button>
                </div>
        <?php endforeach;
        endif; ?>
    </div>
    <div class="dropdown-menu-footer p-2 text-center">
        <a href="/dashboard/notifications"><?= $data->label->get('view_all', 'View all'); ?></a>
    </div>
</div>