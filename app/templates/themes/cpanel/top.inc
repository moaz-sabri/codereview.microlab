<?php

use App\Bootstrap\Web;
use App\Utilities\Utilitie;

?>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">CPanel</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <?php if (Utilitie::isAllowed('view_cpanel_dashboard')) : ?>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Administratorin
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<?= Web::getPath('get_manger_dashboard') ?>">Armaturenbrett</a></li>
              <li><a class="dropdown-item" href="<?= Web::getPath('get_manger_record') ?>logs">Protokolle</a></li>
              <li><a class="dropdown-item" href="<?= Web::getPath('get_manger_record') ?>activity">Aktivität</a></li>
              <li><a class="dropdown-item" href="<?= Web::getPath('get_manger_users') ?>">Benutzer</a></li>
            </ul>
          </li>
        <?php endif; ?>

      </ul>
    </div>
    <div>
      <?php if (isset($_SESSION[LICENSE])) : ?>
        <a class="btn btn-secondary mx-2" href="<?= Web::getPath('get_profile') ?>">
          <i class="bi bi-person-circle"></i>
        </a>

        <a href="<?= Web::getPath('get_signout') ?>" class="btn btn-primary mx-2">
          <i class="bi bi-box-arrow-right"></i>
        </a>
      <?php endif; ?>
    </div>
  </div>
</nav>
<main class="py-5">