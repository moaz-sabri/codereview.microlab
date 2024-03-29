<?php

use App\Bootstrap\Web;
?>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand text-uppercase" href="/"><?= PROJECT_NAME ?></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">Home</a>
        </li>
      </ul>
    </div>
    <div>

      <?php if (isset($_SESSION[LICENSE])) : ?>
        <a href="<?= Web::getPath('get_profile') ?>" class="btn fs-1">
          <i class="bi bi-person-circle"></i>
        </a>
      <?php endif; ?>
    </div>
  </div>
</nav>
<main class="py-5">