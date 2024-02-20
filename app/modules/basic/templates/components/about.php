        <!-- ======= About Section ======= -->
        <section role="about" id="about" class="about">
            <div role="container" class="container" data-aos="fade-up">

                <div role="header" class="section-header">
                    <h2><?= $data->label->get("about_title"); ?></h2>
                    <p><?= $data->label->get("about_subtitle"); ?></p>
                </div>

                <div role="content" class="row g-4 g-lg-5" data-aos="fade-up" data-aos-delay="150">

                    <div role="cover" class="col-lg-5">
                        <div class="about-img">
                            <img src="public/assets/img/about.webp" class="img-fluid lazyload" alt="" loading="lazy">
                        </div>
                    </div>

                    <div role="navigation" class="col-lg-7">
                        <h3 class="pt-0 pt-lg-5"><?= $data->label->get("about_sub"); ?></h3>

                        <!-- Tabs -->
                        <ul role="menu" class="nav nav-pills mb-3" role="tablist">
                            <li role="menuitem">
                                <a class="nav-link active" data-bs-toggle="pill" href="#tab1" aria-selected="true" role="tab">
                                    <?= $data->label->get("framework"); ?>
                                </a>
                            </li>
                            <li role="menuitem">
                                <a class="nav-link" data-bs-toggle="pill" href="#tab2" aria-selected="false" tabindex="-1" role="tab">
                                    <?= $data->label->get("explore"); ?>
                                </a>
                            </li>
                            <li role="menuitem">
                                <a class="nav-link" data-bs-toggle="pill" href="#tab3" aria-selected="false" tabindex="-1" role="tab">
                                    <?= $data->label->get("e_commerce"); ?>
                                </a>
                            </li>
                        </ul><!-- End Tabs -->

                        <!-- Tab Content -->
                        <div role="preview" class="tab-content">

                            <div class="tab-pane fade show active" id="tab1">

                                <p class="fst-italic"><?= $data->label->get("about_tab1"); ?></p>

                            </div><!-- End Tab 1 Content -->

                            <div class="tab-pane fade show" id="tab2">

                                <p class="fst-italic"><?= $data->label->get("about_tab2"); ?></p>

                            </div><!-- End Tab 2 Content -->

                            <div class="tab-pane fade show" id="tab3">

                                <p class="fst-italic"><?= $data->label->get("about_tab3"); ?></p>

                            </div><!-- End Tab 3 Content -->

                        </div>

                        <hr class="w-50 px-3">

                        <p role="image" class=""><?= $data->label->get("about_description"); ?></p>

                    </div>

                </div>

            </div>
        </section><!-- End About Section -->