        <!-- ======= Features Section ======= -->
        <section role="features" id="features" class="features">
            <div role="container" class="container" data-aos="fade-up">

                <div role="header" class="section-header">
                    <p><?= $data->label->get("features_title"); ?></p>
                </div>

                <ul role="nav" class="nav nav-tabs row gy-4 d-flex">

                    <li role="tabs" class="nav-item col-6 col-md-4 col-lg-4">
                        <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#tab-1">
                            <i class="bi bi-body-text color-cyan"></i>
                            <h4><?= $data->label->get("features_title_tab1"); ?></h4>
                        </a>
                    </li><!-- End Tab 1 Nav -->

                    <li role="tabs" class="nav-item col-6 col-md-4 col-lg-4">
                        <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-2">
                            <i class="bi bi-graph-up-arrow  color-indigo"></i>
                            <h4><?= $data->label->get("features_title_tab2"); ?></h4>
                        </a>
                    </li><!-- End Tab 2 Nav -->

                    <li role="tabs" class="nav-item col-6 col-md-4 col-lg-4">
                        <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-3">
                            <i class="bi bi-person-wheelchair color-teal"></i>
                            <h4><?= $data->label->get("features_title_tab3"); ?></h4>
                        </a>
                    </li><!-- End Tab 3 Nav -->

                </ul>

                <div role="content" class="tab-content">

                    <div class="tab-pane active show" id="tab-1">
                        <div class="row gy-4">
                            <div class="col-lg-8 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="100">
                                <h3><?= $data->label->get("features_title_tab1"); ?></h3>
                                <p class="fst-italic">
                                    <?= $data->label->get("features_decs_tab1"); ?>
                                </p>
                            </div>
                            <div class="col-lg-4 order-1 order-lg-2 text-center" data-aos="fade-up" data-aos-delay="150">
                                <img src="public/assets/img/features-1.svg" alt="" class="img-fluid lazyload" loading="lazy">
                            </div>
                        </div>
                    </div><!-- End Tab Content 1 -->

                    <div class="tab-pane" id="tab-2">
                        <div class="row gy-4">
                            <div class="col-lg-8 order-2 order-lg-1">
                                <h3>
                                    <?= $data->label->get("features_title_tab2"); ?>
                                </h3>
                                <p>
                                    <?= $data->label->get("features_desc_tab2"); ?>
                                </p>
                            </div>
                            <div class="col-lg-4 order-1 order-lg-2 text-center">
                                <img src="public/assets/img/features-2.svg" alt="" class="img-fluid lazyload" loading="lazy">
                            </div>
                        </div>
                    </div><!-- End Tab Content 2 -->

                    <div class="tab-pane" id="tab-3">
                        <div class="row gy-4">
                            <div class="col-lg-8 order-2 order-lg-1">
                                <h3>
                                    <?= $data->label->get("features_title_tab3"); ?>
                                </h3>
                                <p>
                                    <?= $data->label->get("features_desc_tab3"); ?>
                                </p>
                                <!-- <ul>
                                    <li><i class="bi bi-check-circle-fill"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                                    <li><i class="bi bi-check-circle-fill"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
                                    <li><i class="bi bi-check-circle-fill"></i> Provident mollitia neque rerum asperiores dolores quos qui a. Ipsum neque dolor voluptate nisi sed.</li>
                                </ul> 
                                <p class="fst-italic">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
                                    magna aliqua.
                                </p> -->
                            </div>
                            <div class="col-lg-4 order-1 order-lg-2 text-center">
                                <img src="public/assets/img/features-3.svg" alt="" class="img-fluid lazyload" loading="lazy">
                            </div>
                        </div>
                    </div><!-- End Tab Content 3 -->

                </div>

            </div>
        </section><!-- End Features Section -->