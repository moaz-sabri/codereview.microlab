<?php
$componentsSource = WEBROOT . DS . 'templates/components/';
#  <!-- ======= breadcrumbs Section ======= -->
include $componentsSource . 'breadcrumbs.inc';
#  <!-- ------- End breadcrumbs Section --- -->
?>

<!-- ======= inner Section ======= -->
<section class="inner-page documentation">
    <div class="container">

        <div class="alert alert-warning d-flex align-items-center justify-content-between" role="alert">
            <p>
                <strong class="fs-4 d-block">🚧 Documentation Under Development 🚧</strong>
                We're currently working on enhancing our documentation to provide you with better and more comprehensive information.
                <i class="d-block">Thank you for your patience!</i>
            </p>
            <div class="spinner-border text-danger" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <ul class="list-group">
                    <li class="list-group-item d-flex  align-items-start">
                        <button class="nav-link text-start" id="v-pills-overview-tab" data-bs-toggle="pill" data-bs-target="#v-pills-overview" type="button" role="tab" aria-controls="v-pills-overview" aria-selected="true">
                            <div class="ms-2 me-auto">
                                <div class="fw-bold">Overview</div>
                                light-framework Overview
                            </div>
                        </button>
                    </li>
                    <li class="list-group-item d-flex  align-items-start">
                        <button class="nav-link text-start" id="v-pills-community-tab" data-bs-toggle="pill" data-bs-target="#v-pills-community" type="button" role="tab" aria-controls="v-pills-community" aria-selected="false">
                            <div class="ms-2 me-auto">
                                <div class="fw-bold">Community</div>
                                Inquiries and Community Updates
                            </div>
                        </button>
                    </li>
                    <li class="list-group-item d-flex  align-items-start">
                        <button class="nav-link text-start" id="v-pills-model-tab" data-bs-toggle="pill" data-bs-target="#v-pills-model" type="button" role="tab" aria-controls="v-pills-model" aria-selected="false">
                            <div class="ms-2 me-auto">
                                <div class="fw-bold">Modules</div>
                                Create a New Module
                            </div>
                        </button>
                    </li>
                    <li class="list-group-item d-flex  align-items-start">
                        <button class="nav-link text-start" id="v-pills-templates-tab" data-bs-toggle="pill" data-bs-target="#v-pills-templates" type="button" role="tab" aria-controls="v-pills-templates" aria-selected="false">
                            <div class="ms-2 me-auto">
                                <div class="fw-bold">Templates</div>
                                Create a Simple Landing Page
                            </div>
                        </button>
                    </li>
                    <li class="list-group-item d-flex  align-items-start">
                        <button class="nav-link text-start" id="v-pills-configurations-tab" data-bs-toggle="pill" data-bs-target="#v-pills-configurations" type="button" role="tab" aria-controls="v-pills-configurations" aria-selected="false">
                            <div class="ms-2 me-auto">
                                <div class="fw-bold">Configurations</div>
                                Set Configurations
                            </div>
                        </button>
                    </li>
                    <li class="list-group-item d-flex  align-items-start">
                        <button class="nav-link text-start" id="v-pills-database-tab" data-bs-toggle="pill" data-bs-target="#v-pills-database" type="button" role="tab" aria-controls="v-pills-database" aria-selected="false">
                            <div class="ms-2 me-auto">
                                <div class="fw-bold">Database</div>
                                Database Connection and CRUD Operation
                            </div>
                        </button>
                    </li>
                    <li class="list-group-item d-flex  align-items-start">
                        <button class="nav-link text-start" id="v-pills-parameters-tab" data-bs-toggle="pill" data-bs-target="#v-pills-parameters" type="button" role="tab" aria-controls="v-pills-parameters" aria-selected="false">
                            <div class="ms-2 me-auto">
                                <div class="fw-bold">Parameters</div>
                                URL Handling and Parameters
                            </div>
                        </button>
                    </li>
                </ul>
            </div>

            <div class="col-md-9 tab-content" id="v-pills-tabContent">
                <header>
                    <h1>Welcome to the light-framework Documentation</h1>
                    <p class="lead">A society aiming for freedom of thought and ease of work.</p>
                </header>

                <div class="tab-pane fade" id="v-pills-overview" role="tabpanel" aria-labelledby="v-pills-overview-tab" tabindex="0">
                    <?php include_once WEBROOT . '/modules/basic/templates/documentation/overview.php'; ?>
                </div>
                <div class="tab-pane fade" id="v-pills-community" role="tabpanel" aria-labelledby="v-pills-community-tab" tabindex="0">
                    <?php include_once WEBROOT . '/modules/basic/templates/documentation/community.php'; ?>
                </div>
                <div class="tab-pane fade" id="v-pills-model" role="tabpanel" aria-labelledby="v-pills-model-tab" tabindex="0">
                    <?php include_once WEBROOT . '/modules/basic/templates/documentation/models.php'; ?>
                </div>
                <div class="tab-pane fade" id="v-pills-templates" role="tabpanel" aria-labelledby="v-pills-templates-tab" tabindex="0">
                    <?php include_once WEBROOT . '/modules/basic/templates/documentation/templates.php'; ?>
                </div>
                <div class="tab-pane fade" id="v-pills-configurations" role="tabpanel" aria-labelledby="v-pills-configurations-tab" tabindex="0">
                    <?php include_once WEBROOT . '/modules/basic/templates/documentation/configurations.php'; ?>
                </div>
                <div class="tab-pane fade" id="v-pills-database" role="tabpanel" aria-labelledby="v-pills-database-tab" tabindex="0">
                    <?php include_once WEBROOT . '/modules/basic/templates/documentation/database.php'; ?>
                </div>
                <div class="tab-pane fade" id="v-pills-parameters" role="tabpanel" aria-labelledby="v-pills-parameters-tab" tabindex="0">
                    <?php include_once WEBROOT . '/modules/basic/templates/documentation/parameters.php'; ?>
                </div>
                <hr class="my-5">
                <article id="framework-overview">
                    <h2>light-framework Overview</h2>
                    <p>A summary of different experiences among other light-frameworks, focusing on simplification, ease of use, and providing a comprehensive set of services while ensuring optimal performance.</p>

                    <h3>Key Features</h3>
                    <ul>
                        <li><strong>No Need for a Server:</strong> Unlike many light-frameworks, our solution doesn't require a private server, running efficiently on the Apache system.</li>
                        <li><strong>Cost Savings and SEO:</strong> Provides search engine support (SEO).</li>
                        <li><strong>Modular Structure:</strong> Each service is organized in an individual folder with tasks, paths, and appearance, allowing for easy modification.</li>
                        <li><strong>Integration:</strong> Work seamlessly in both front-end and back-end environments within a single project.</li>
                        <li><strong>REST API Support:</strong> Utilize the flexibility of REST API for enhanced functionality.</li>
                        <li><strong>User System:</strong> Provides a system for users with customized settings and permissions.</li>
                        <li><strong>Control Panel:</strong> A ready-to-use control panel for adding new services.</li>
                        <li><strong>Error and Event Handling:</strong> Includes a module for effective error and event management.</li>
                        <li><strong>File Upload Module:</strong> Offers a module for easy file uploading.</li>
                        <li><strong>Specialized Modules:</strong> Various modules designed to help focus on specific tasks.</li>
                    </ul>
                </article>

            </div>
        </div>
    </div>
</section>