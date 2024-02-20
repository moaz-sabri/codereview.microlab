        <!-- ======= Projects Section ======= -->
        <section role="projects" id="projects" class="projects" data-aos="fade-up">

            <div role="contaner" class="container" data-aos="fade-up" data-aos-delay="150">

                <div role="header" class="section-header">
                    <h2><?= $data->label->get("projects_title"); ?></h2>
                    <p><?= $data->label->get("projects_subtitle"); ?></p>
                </div>

                <div role="content" class="projects-isotope" data-projects-filter="*" data-projects-layout="masonry" data-projects-sort="original-order">

                    <ul role="nav" class="projects-flters text-capitalize">
                        <li data-filter="*" class="filter-active">all</li>
                        <li data-filter=".filter-PRODUCTS">products</li>
                        <li data-filter=".filter-WEBSITES">websites</li>
                    </ul><!-- End Projects Filters -->

                    <div role="items" class="row projects-container">
                        <?php foreach (App\Modules\Projects\Loader\ProjectLoader::subProjects(['WEBSITES', 'PRODUCTS'], 8) as $key => $project) : ?>
                            <article role="item" class="col-xl-4 col-md-6 projects-item filter-<?= $project->projects_type ?>" data-aos="zoom-in" data-aos-delay="150">

                                <div class="img">
                                    <img src="<?= isset($project->thumbnail_preview[0]) ? '/storage' . $project->thumbnail_preview[0]->path : '/public/assets/placeholder.webp' ?>" class="img-fluid lazyload" alt="<?= $project->projects_title ?>" loading="lazy">
                                </div>
                                <div class="details position-relative">
                                    <div class="icon">
                                        <a href="/<?= strtolower($project->projects_type) ?>/preview/<?= $project->projects_friendlyurl ?>" aria-label="Read more" target="_blank">
                                            <i class="bi bi-box-arrow-up-right"></i>
                                        </a>
                                    </div>
                                    <h3 class="title">
                                        <?= $project->projects_title ?>
                                    </h3>
                                    <p class="desc">
                                        <?= $project->meta_description ?>
                                    </p>
                                    <i class="date">
                                        <?= date(DATE_FORMAT, strtotime($project->projects_updated_at)) ?>
                                    </i>
                                </div>

                            </article><!-- End Project Item -->
                        <?php endforeach; ?>
                    </div>
                </div>

            </div>
        </section><!-- End Projects Section -->