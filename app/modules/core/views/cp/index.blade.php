<?php
use App\Bootstrap\Web;
?>
<div class="container">
    <h1>Bedienfeld</h1>
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link" href="<?= Web::getPath('get_manger_users') ?>">Benutzer</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?= Web::getPath('get_reminder_calendar') ?>">Erinnerungskalender</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?= Web::getPath('get_manger_record') . 'logs' ?>">Protokolle</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?= Web::getPath('get_manger_record') . 'activity' ?>">Aktivität</a>
        </li>
    </ul>
</div>
