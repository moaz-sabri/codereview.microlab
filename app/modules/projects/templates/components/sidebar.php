<aside class="sidebar">

    <div class="sidebar-item search-form">
        <h3 class="sidebar-title">Search</h3>
        <form action="/search" class="mt-3">
            <input type="text" id="search" name="search" minlength="2" maxlength="33" required="">
            <div class="valid-feedback">
                <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
            </div>
            <div class="invalid-feedback">
                <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
            </div>
            <button type="submit">
                <i class="bi bi-search"></i>
            </button>
            <div>
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
            </div>

        </form>
    </div><!-- End sidebar search formn-->
    <?php

    use App\Modules\Projects\Loader\ProjectLoader; 
    ?>
    <div class="sidebar-item categories">
        <h3 class="sidebar-title">Categories</h3>
        <ul class="mt-3">
            <?php foreach (ProjectLoader::getList()->categories as $key => $category) : ?>
                <li>
                    <a href="/categories?search=<?= $category->name ?>">
                        <?= $category->name ?>
                        <span>(<?= $category->total ?>)</span>
                    </a>
                </li>
            <?php endforeach; ?>
        </ul>
    </div><!-- End sidebar categories-->

    <div class="sidebar-item tags">
        <h3 class="sidebar-title">Tags</h3>
        <ul class="mt-3">
            <?php foreach (ProjectLoader::getList()->tags as $key => $tag) : ?>
                <li>
                    <a href="/tags?search=<?= $tag->name ?>">
                        <?= $tag->name ?>
                        <span>(<?= $tag->total ?>)</span>
                    </a>
                </li>
            <?php endforeach; ?>
        </ul>
    </div><!-- End sidebar tags-->

</aside><!-- End inner Sidebar -->