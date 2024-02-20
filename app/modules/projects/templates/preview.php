<?php
$componentsSource = WEBROOT . DS . 'templates/components/';
$mainSource = WEBROOT . DS . 'modules/projects/templates/components/';
#  <!-- ======= breadcrumbs Section ======= -->
include $componentsSource . 'breadcrumbs.inc';
#  <!-- ------- End breadcrumbs Section --- -->
?>

<!-- ======= inner Details Section ======= -->
<section id="inner" class="inner">
    <div class="container" data-aos="fade-up">
        <div class="row g-5">

            <div class="col-lg-8">

                <article class="inner-details position-relative">
                    <button type="button" class="btn btn-primary report-button" data-bs-toggle="modal" data-bs-target="#reportPopup" onclick="setSourceId('<?= $data->obj->projects_guide ?>')">
                        <i class="bi bi-shield-exclamation fs-3"></i>
                    </button>
                    <?php include_once WEBROOT . '/modules/emails/templates/components/report.php'; ?>

                    <?php if (!empty(get_object_vars($data->obj->gallery_preview))) :  ?>

                        <div class="inner-details-slider post-img swiper">
                            <div class="swiper-wrapper align-items-center">

                                <?php foreach ($data->obj->gallery_preview as $galleryKey => $galleryImg) : ?>
                                    <div class="swiper-slide">
                                        <img src="/storage<?= $galleryImg->path ?>" alt="gallery-<?= $galleryImg->projectfile_file_id ?>" class="lazyload" loading="lazy">
                                    </div>
                                <?php endforeach; ?>

                            </div>
                            <div class="swiper-pagination"></div>
                        </div>

                    <?php endif; ?>

                    <h2 class="title">
                        <?= $data->obj->projects_title ?>
                    </h2>

                    <div class="meta-top">
                        <ul>
                            <li class="d-flex align-items-center">
                                <i class="bi bi-person"></i>
                                <a href="inner-details.html"><?= $data->obj->owner_name ?></a>
                            </li>
                            <li class="d-flex align-items-center">
                                <i class="bi bi-clock"></i>
                                <a href="inner-details.html">
                                    <time datetime="2022-01-01">
                                        <?= date_format(date_create($data->obj->projects_updated_at), DATE_FORMAT) ?>
                                    </time>
                                </a>
                            </li>
                            <!-- <li class="d-flex align-items-center">
                                <i class="bi bi-chat-dots"></i>
                                <a href="inner-details.html">12 Comments</a>
                            </li> -->
                        </ul>
                    </div><!-- End meta top -->

                    <div class="ql-editor content">
                        <?= $data->obj->projects_content ?>
                    </div><!-- End post content -->

                    <div class="meta-bottom">
                        <i class="bi bi-eye"></i>
                        <ul class="cats">
                            <li>
                                <?= $data->obj->views ?>
                            </li>
                        </ul>

                        <i class="bi bi-folder"></i>
                        <ul class="cats">
                            <li>
                                <a href="categories?search==<?= $data->obj->category_name ?>">
                                    <?= $data->obj->category_name ?>
                                </a>
                            </li>
                        </ul>

                        <i class="bi bi-tags"></i>
                        <ul class="tags">
                            <?php foreach (explode(',', $data->obj->tags_name) as $tagKey => $tag) : ?>
                                <li><a href="tags?search=<?= $tag ?>"><?= $tag ?></a></li>
                            <?php endforeach; ?>
                        </ul>

                    </div><!-- End meta bottom -->

                </article><!-- End inner post -->

                <!-- ======= comments Section ======= -->
                <?php # include $mainSource . 'comments.php'; 
                ?>
                <!-- ------- End comments Section --- -->

            </div>

            <div class="col-lg-4">

                <!-- ======= sidebar Section ======= -->
                <?php include $mainSource . 'sidebar.php'; ?>
                <!-- ------- End sidebar Section --- -->

            </div>
        </div>
    </div>
</section><!-- End inner Details Section -->