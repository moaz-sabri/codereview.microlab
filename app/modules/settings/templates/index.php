<?php

use App\Modules\Permissions\Loader\CryptLoader;
use App\Utilities\Utilitie;

?>

<h1 class="app-page-title">Overview</h1>
<div class="app-card alert alert-dismissible shadow-sm mb-4 border-left-decoration" role="alert">
    <div class="inner">
        <div class="app-card-body p-3 p-lg-4">
            <h3 class="mb-3"><?= $data->label->get('hello_dear', 'Hello dear'); ?><span class="text-primary fw-bold"><?= CryptLoader::decrypt('name'); ?></span>!</h3>
            <div class="row gx-5 gy-3">
                <div class="col-12 col-lg-9">
                    <div><?= $data->label->get('welcome_text', 'welcome_text'); ?></div>
                </div>
                <div class="col-12 col-lg-3">
                    <a class="btn btn-primary" href="/help">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                            <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
                        </svg>
                        <?= $data->label->get('contact', 'Contact'); ?>
                    </a>
                </div>
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</div>

<div class="app-card my-3">
    <div id="counter" class="row m-0">
        <div id="clone-card" class="col-4 app-card p-3 text-center">
            <h3 class="text-capitalize">members</h3>
            <p>2</p>
        </div>
    </div>

    <hr class="my-5">


    <div class="app-card-chart shadow-sm mb-3">
        <div class="app-card-header p-3 border-0">
            <h4 class="app-card-title"><?= $data->label->get('last30Days', 'Last 30 Days'); ?></h4>
        </div>
        <div class="app-card-body py-4">
            <div class="chart-container">
                <canvas id="chart-last30Days"></canvas>
            </div>
        </div>
    </div>

    <div class="row m-0">
        <div class="col-sm-6 col-md-4 col-lg-3 app-card-chart shadow-sm mb-3">
            <div class="app-card-header p-3 border-0">
                <h4 class="app-card-title"><?= $data->label->get('browser', 'Browser used'); ?></h4>
            </div>
            <div class="app-card-body py-4">
                <div class="chart-container">
                    <canvas id="chart-browser"></canvas>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-3 app-card-chart shadow-sm mb-3">
            <div class="app-card-header p-3 border-0">
                <h4 class="app-card-title"><?= $data->label->get('content', 'Content Created'); ?></h4>
            </div>
            <div class="app-card-body py-4">
                <div class="chart-container">
                    <canvas id="chart-contentCount"></canvas>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-4 col-lg-3 app-card-chart shadow-sm mb-3">
            <div class="app-card-header p-3 border-0">
                <h4 class="app-card-title"><?= $data->label->get('device', 'Device used'); ?></h4>
            </div>
            <div class="app-card-body py-4">
                <div class="chart-container">
                    <canvas id="chart-device"></canvas>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-4 col-lg-3 app-card-chart shadow-sm mb-3">
            <div class="app-card-header p-3 border-0">
                <h4 class="app-card-title"><?= $data->label->get('trafficTypeDistribution', 'Traffic Type Distribution'); ?></h4>
            </div>
            <div class="app-card-body py-4">
                <div class="chart-container">
                    <canvas id="chart-trafficTypeDistribution"></canvas>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-4 col-lg-3 app-card-chart shadow-sm mb-3">
            <div class="app-card-header p-3 border-0">
                <h4 class="app-card-title"><?= $data->label->get('operatingSystemsMobile', 'Operating Systems on Mobiles'); ?></h4>
            </div>
            <div class="app-card-body py-4">
                <div class="chart-container">
                    <canvas id="chart-operatingSystemsMobile"></canvas>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-4 col-lg-3 app-card-chart shadow-sm mb-3">
            <div class="app-card-header p-3 border-0">
                <h4 class="app-card-title"><?= $data->label->get('operatingSystemsDesktop', 'Operating Systems on Desktop'); ?></h4>
            </div>
            <div class="app-card-body py-4">
                <div class="chart-container">
                    <canvas id="chart-operatingSystemsDesktop"></canvas>
                </div>
            </div>
        </div>
    </div>

    <hr class="my-5">

    <div class="row m-0">
        <?php if (App\Modules\Permissions\Loader\CryptLoader::decrypt('role') === MASTER) :
            foreach ($data->modules as $key => $module) : ?>
                <div class="col-md-6 col-xl-4 col-xxl-3">
                    <div class="app-card app-card-doc shadow-sm w-100">
                        <div class="app-card-thumb-holder p-3">
                            <span class="icon-holder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-database-fill-gear" viewBox="0 0 16 16">
                                    <?php if (isset($module->icon)) : ?>
                                        <?= $module->icon ?>
                                    <?php else : ?>
                                        <path d="M8 1c-1.573 0-3.022.289-4.096.777C2.875 2.245 2 2.993 2 4s.875 1.755 1.904 2.223C4.978 6.711 6.427 7 8 7s3.022-.289 4.096-.777C13.125 5.755 14 5.007 14 4s-.875-1.755-1.904-2.223C11.022 1.289 9.573 1 8 1Z" />
                                        <path d="M2 7v-.839c.457.432 1.004.751 1.49.972C4.722 7.693 6.318 8 8 8s3.278-.307 4.51-.867c.486-.22 1.033-.54 1.49-.972V7c0 .424-.155.802-.411 1.133a4.51 4.51 0 0 0-4.815 1.843A12.31 12.31 0 0 1 8 10c-1.573 0-3.022-.289-4.096-.777C2.875 8.755 2 8.007 2 7Zm6.257 3.998L8 11c-1.682 0-3.278-.307-4.51-.867-.486-.22-1.033-.54-1.49-.972V10c0 1.007.875 1.755 1.904 2.223C4.978 12.711 6.427 13 8 13h.027a4.552 4.552 0 0 1 .23-2.002Zm-.002 3L8 14c-1.682 0-3.278-.307-4.51-.867-.486-.22-1.033-.54-1.49-.972V13c0 1.007.875 1.755 1.904 2.223C4.978 15.711 6.427 16 8 16c.536 0 1.058-.034 1.555-.097a4.507 4.507 0 0 1-1.3-1.905Zm3.631-4.538c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z" />
                                    <?php endif; ?>
                                </svg>
                            </span>
                        </div>
                        <div class="app-card-body p-3 has-card-actions">

                            <h4 class="app-doc-title truncate mb-0 text-capitalize">
                                <?= $module->name ?>
                            </h4>
                            <p class="text-muted">
                                <?= $module->description ?>
                            </p>
                            <?php if (isset($module->children)) : ?>
                                <div class="app-doc-meta">
                                    <ul class="list-unstyled mb-0">
                                        <?php foreach ($module->children as $key => $child) :  ?>
                                            <li>
                                                <div class="dropdown">
                                                    <?php if (!empty($module->model)) : ?>
                                                        <div class="dropdown-toggle no-toggle-arrow d-inline-block" data-bs-toggle="dropdown" aria-expanded="false">
                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-three-dots-vertical" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"></path>
                                                            </svg>
                                                        </div><!--//dropdown-toggle-->
                                                        <ul class="dropdown-menu">
                                                            <li>
                                                                <a href="/action/build/<?= $module->directory ?>?model=<?= $child['model'] ?>" class="dropdown-item">Build</a>
                                                                <a href="/action/removePOPUP/<?= $module->directory ?>?model=<?= $child['model'] ?>" class="dropdown-item">Remove</a>
                                                                <a href="/action/update/<?= $module->directory ?>?model=<?= $child['model'] ?>" class="dropdown-item">Update</a>
                                                            </li>
                                                        </ul>
                                                    <?php endif; ?>
                                                    <span class="text-capitalize"><?= $child['name'] ?></span>
                                                    <p class="text-muted"><?= $child['description'] ?></p>
                                                </div>
                                            </li>
                                        <?php endforeach; ?>
                                    </ul>
                                </div><!--//app-doc-meta-->
                            <?php endif; ?>
                            <?php if (is_array($module->path)) : ?>
                                <div class="app-doc-meta">
                                    <ul class="list-unstyled mb-0">
                                        <?php foreach ($module->path as $key => $url) :  ?>
                                            <li>
                                                <span class="text-capitalize">
                                                    <?= $url['name'] ?>
                                                </span>
                                                <p class="text-muted"><?= $url['description'] ?? '' ?></p>
                                            </li>
                                        <?php endforeach; ?>
                                    </ul>
                                </div><!--//app-doc-meta-->
                            <?php endif; ?>

                            <?php if (!empty($module->model)) : ?>
                                <div class="app-card-actions">
                                    <div class="dropdown">
                                        <div class="dropdown-toggle no-toggle-arrow" data-bs-toggle="dropdown" aria-expanded="false">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-three-dots-vertical" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"></path>
                                            </svg>
                                        </div><!--//dropdown-toggle-->
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="/action/build/<?= $module->directory ?>?model=<?= $module->model ?>" class="dropdown-item">Build</a>
                                                <a href="/action/removePOPUP/<?= $module->directory ?>?model=<?= $module->model ?>" class="dropdown-item">Remove</a>
                                                <a href="/action/update/<?= $module->directory ?>?model=<?= $module->model ?>" class="dropdown-item">Update</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div><!--//app-card-actions-->
                            <?php endif; ?>
                        </div><!--//app-card-body-->

                    </div><!--//app-card-->
                </div><!--//col-->
        <?php endforeach;
        endif; ?>
    </div><!--//row-->
</div>