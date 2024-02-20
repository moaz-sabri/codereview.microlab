<?php
$componentsSource = WEBROOT . DS . 'templates/components/';
$mainSource = WEBROOT . DS . 'modules/projects/templates/components/';
#  <!-- ======= breadcrumbs Section ======= -->
include $componentsSource . 'breadcrumbs.inc';
#  <!-- ------- End breadcrumbs Section --- -->
?>

<!-- ======= inner Section ======= -->
<section id="inner" class="inner">
    <div class="container" data-aos="fade-up">

        <div class="row g-5">

            <div class="col-lg-8">

                <div class="row gy-4 posts-list">

                    <?php foreach ($data->obj->result as $key => $project) : ?>
                        <!-- ======= Project Card Section ======= -->
                        <div class="col-lg-6">
                            <?php include $mainSource . 'project-card.php'; ?>
                        </div><!-- End project list item -->
                        <!-- ------- End Project Card Section --- -->
                    <?php endforeach; ?>

                </div><!-- End inner posts list -->

                <nav class="app-pagination">
                    <?php require PAGINATION; ?>
                </nav><!-- End inner pagination -->

            </div>

            <div class="col-lg-4">
                <!-- ======= sidebar Section ======= -->
                <?php include $mainSource . 'sidebar.php'; ?>
                <!-- ------- End sidebar Section --- -->
            </div>

        </div>

    </div>
</section><!-- End inner Section -->
