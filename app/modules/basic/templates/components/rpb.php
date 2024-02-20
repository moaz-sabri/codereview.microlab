        <!-- ======= Recent inner Posts Section ======= -->
        <section role="blog" id="recent-inner-posts" class="recent-inner-posts">

            <div role="container" class="container" data-aos="fade-up">

                <div role="header" class="section-header">
                    <h2><?= $data->label->get("blog_title"); ?></h2>
                    <p><?= $data->label->get("blog_subtitle"); ?></p>
                </div>

                <div role="items" class="row">
                    <?php foreach (App\Modules\Projects\Loader\ProjectLoader::subProjects('BLOG', 4) as $key => $post) : ?>
                        <div role="item" class="col-lg-4 mb-3" data-aos="fade-up" data-aos-delay="150">
                            <div class="post-box">
                                <div class="post-img">
                                    <img src="<?= isset($post->thumbnail_preview[0]) ? '/storage' . $post->thumbnail_preview[0]->path :  '/public/assets/placeholder.webp' ?>" alt="<?= $post->projects_title ?>" class="img-fluid lazyload" loading="lazy">
                                </div>
                                <div class="px-3 py-2">
                                    <div class="meta">
                                        <span class="post-date"><?= $post->owner_name ?></span>
                                        <span class="post-author"> /
                                            <?= $post->category_name ?>
                                        </span>
                                    </div>
                                    <h3 class="post-title">
                                        <?= $post->projects_title ?>
                                    </h3>
                                    <p>
                                        <?= $post->meta_description ?>
                                    </p>
                                    <a href="/blog/preview/<?= $post->projects_friendlyurl ?>" class="readmore stretched-link"><span>Read More</span><i class="bi bi-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>

            </div>

        </section><!-- End Recent inner Posts Section -->