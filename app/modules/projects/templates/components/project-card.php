<article class="d-flex flex-column">

    <div class="post-img">
        <img src="<?= isset($project->thumbnail_preview[0]) ? "/storage" . $project->thumbnail_preview[0]->path : '/public/assets/placeholder.webp' ?>" alt="<?= $project->projects_title ?>" class="img-fluid lazyload" loading="lazy">
    </div>

    <?php if (!empty($project->projects_title)) : ?>
        <h2 class="title">
            <a href="/<?= strtolower($project->projects_type) ?>/preview/<?= $project->projects_friendlyurl ?>">
                <?= $project->projects_title ?>
            </a>
        </h2>
    <?php endif; ?>

    <div class="meta-top">
        <ul>
            <li class="d-flex align-items-center">
                <i class="bi bi-person"></i>
                <?= $project->projects_type ?>
            </li>
            <li class="d-flex align-items-center">
                <i class="bi bi-clock"></i>
                <time datetime="2022-01-01">
                    <?= date_format(date_create($project->projects_updated_at), DATE_FORMAT) ?>
                </time>
            </li>
            <li class="d-flex align-items-center">
                <i class="bi bi-clock"></i>
                <?= $project->category_name ?>
            </li>
        </ul>
    </div>

    <div class="content">
        <p>
            Similique neque nam consequuntur ad non maxime aliquam quas. Quibusdam animi praesentium. Aliquam et laboriosam eius aut nostrum quidem aliquid dicta.
        </p>
    </div>

    <div class="read-more mt-auto align-self-end">
        <a href="/<?= strtolower($project->projects_type) ?>/preview/<?= $project->projects_friendlyurl ?>">Read More</a>
    </div>
</article>