<form role="form" onsubmit="return submitProject(event)" action="/api/project/<?= isset($data->obj->projects_guide) ? 'update/' . $data->obj->projects_guide  : 'create' ?>" method="post" class="needs-validation" novalidate="">
    <input type="hidden" name="guide" value="<? $data->obj->projects_guide ?? '' ?>">
    <input type="hidden" name="content" id="content" required="">

    <nav class="nav justify-content-between align-items-center px-3 topnav">
        <div class="row">
            <div class="col-auto">
                <a class="navbar-brand" href="javascript:history.go(-1)">
                    <img src="<?= LOGO ?>" class="lazyload" alt="Bootstrap" width="50" loading="lazy">
                </a>
            </div>

            <div class="col">
                <label class="visually-hidden" for="title">Project Title</label>
                <div class="input-group my-2">
                    <div class="input-group-text">Project Title</div>
                    <input type="text" class="form-control" name="title" id="title" placeholder="title" value="<?= $data->obj->projects_title ?? '' ?>" required="">
                </div>
            </div>

        </div>
        <div class="btn-toolbar justify-content-end">
            <div>
                <label class="visually-hidden" for="topic">Topic</label>
                <div class="input-group">
                    <div class="input-group-text">Topic</div>
                    <select class="form-select" name="type" id="type" required="">
                        <?php foreach (App\Modules\Projects\Loader\ProjectLoader::getTopics() as $topicKey => $value) : ?>
                            <option class="text-capitalize" value="<?= $topicKey ?>" <?= isset($data->obj->projects_type) && $data->obj->projects_type === $topicKey ? 'selected' : ''; ?>><?= $data->label->get($value, $value); ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <?php if (isset($data->obj->projects_friendlyurl)) : ?>
                <a href="/<?= strtolower($data->obj->projects_type) ?>/preview/<?= $data->obj->projects_friendlyurl ?>" class="btn btn-sm p-2 px-3 btn-primary mx-2">
                    <i class="bi bi-easel"></i> Preview
                </a>
            <?php endif; ?>
            <button type="submit" class="btn btn-sm p-2 px-3 btn-primary mx-2">
                <i class="bi bi-floppy"></i> Save
            </button>
            <button class="btn btn-sm btn-secondary  p-2 px-3 rounded-0" type="button" onclick="toggleToolbar()">&#9776;</button>
        </div>
    </nav>

    <main id="main-holder" class="main-holder">

        <section id="editor-container" class="editor-container">
            <div>
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
            </div>
            <div id="editor" class="editor container-fluid">
                <?= $data->obj->projects_content ?? '' ?>
            </div>
        </section>

        <section id="toolbar" class="sidenav">
            <div class="accordion" id="accordionPanelsStayOpenExample">

                <div class="">
                    <h2 class="accordion-header">
                        <button class="btn btn-primary accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-thumbnail" aria-expanded="false" aria-controls="panelsStayOpen-thumbnail">
                            <i class="bi bi-aspect-ratio me-2"></i> Thumbnail (Cover)
                        </button>
                    </h2>
                    <div id="panelsStayOpen-thumbnail" class="accordion-collapse collapse ">
                        <div class="accordion-body">
                            <div class="thumbnalil upload">
                                <button type="button" class="btn text-primary" data-bs-toggle="modal" data-bs-target="#fileStorage" onclick="selectInput('thumbnail')">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-cloud-arrow-up" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M7.646 5.146a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 6.707V10.5a.5.5 0 0 1-1 0V6.707L6.354 7.854a.5.5 0 1 1-.708-.708l2-2z" />
                                        <path d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383zm.653.757c-.757.653-1.153 1.44-1.153 2.056v.448l-.445.049C2.064 6.805 1 7.952 1 9.318 1 10.785 2.23 12 3.781 12h8.906C13.98 12 15 10.988 15 9.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 4.825 10.328 3 8 3a4.53 4.53 0 0 0-2.941 1.1z" />
                                    </svg>
                                </button>
                                <input type="hidden" id="thumbnail" name="thumbnail" value="<?= $data->obj->projects_thumbnail ?? '' ?>">
                                <div id="listSelected-thumbnail" class="listSelected-thumbnail">

                                    <?php foreach ($data->obj->thumbnail_preview ?? [] as $thumbnailKey => $thumbnailImg) : ?>
                                        <div id="<?= $thumbnailImg->projectfile_file_id ?>-imged-thumbnailcontainer" class=" position-relative">
                                            <button class="exit-button" type="button" onclick="removeImg('<?= $thumbnailImg->projectfile_file_id ?>-imged-thumbnailcontainer', 'thumbnail')">X
                                            </button>
                                            <img alt="132-02.jpg" id="<?= $thumbnailImg->projectfile_file_id ?>-imged" src="/storage<?= $thumbnailImg->path ?>" class="w-100 lazyload" loading="lazy">
                                        </div>
                                    <?php endforeach; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="">
                    <h2 class="accordion-header">
                        <button class="btn btn-primary accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-publiching" aria-expanded="false" aria-controls="panelsStayOpen-publiching">
                            <i class="bi bi-easel2 me-2"></i> Publiching
                        </button>
                    </h2>
                    <div id="panelsStayOpen-publiching" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <div class="form-floating mb-3">
                                <select class="form-select" name="status" id="status">
                                    <?php foreach (App\Utilities\Utilitie::activation() as $key => $value) : ?>
                                        <option value="<?= $value ?>" <?= $data->obj->projects_status ?? [] === $value ? 'selected' : ''; ?>><?= $data->label->get($value, $value); ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <label for="status">Activation</label>
                                <div class="valid-feedback">
                                    <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
                                </div>
                                <div class="invalid-feedback">
                                    <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="">
                    <h2 class="accordion-header">
                        <button class="btn btn-primary accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-gallery" aria-expanded="false" aria-controls="panelsStayOpen-gallery">
                            <i class="bi bi-images me-2"></i> Slider (Gallery)
                        </button>
                    </h2>
                    <div id="panelsStayOpen-gallery" class="accordion-collapse collapse">
                        <div class="accordion-body">

                            <div class="text-center mb-3">
                                <input type="hidden" id="gallery" name="gallery" value="<?= $data->obj->projects_gallery ?? '' ?>">
                                <button type="button" class="btn btn-lg btn-outline-primary" data-bs-toggle="modal" data-bs-target="#fileStorage" onclick="selectInput('gallery')">
                                    <i class="bi bi-upload"></i>
                                </button>
                            </div>

                            <div id="listSelected-gallery" class="listSelected-gallery">
                                <?php foreach ($data->obj->gallery_preview ?? [] as $galleryKey => $galleryImg) : ?>
                                    <div id="<?= $galleryImg->projectfile_file_id ?>-imged-gallerycontainer" class="position-relative">
                                        <button class="exit-button" type="button" onclick="removeImg('<?= $galleryImg->projectfile_file_id ?>-imged-gallerycontainer', 'gallery')">X
                                        </button>
                                        <img width="100" alt="132-02.jpg" id="<?= $galleryImg->projectfile_file_id ?>-imged" src="/storage<?= $galleryImg->path ?>" class="w-100 lazyload" loading="lazy">
                                    </div>
                                <?php endforeach; ?>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="">
                    <h2 class="accordion-header">
                        <button class="btn btn-primary accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-categories" aria-expanded="false" aria-controls="panelsStayOpen-categories">
                            <i class="bi bi-bookmark me-2"></i> Categories
                        </button>
                    </h2>
                    <div id="panelsStayOpen-categories" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <div class="form-floating mb-3">
                                <input class="form-control" list="datalistOptions" name="categories" id="categories" placeholder="Type to search..." value="<?= $data->obj->category_name ?? '' ?>" required="">
                                <datalist id="datalistOptions">
                                    <?php foreach (App\Utilities\Utilitie::categories() as $key => $value) : ?>
                                        <option value="<?= $value ?>">
                                        <?php endforeach; ?>
                                </datalist>
                                <label for="categories">categories</label>
                                <div class="valid-feedback">
                                    <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
                                </div>
                                <div class="invalid-feedback">
                                    <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="">
                    <h2 class="accordion-header">
                        <button class="btn btn-primary accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-tags" aria-expanded="false" aria-controls="panelsStayOpen-tags">
                            <i class="bi bi-tags me-2"></i> Tags
                        </button>
                    </h2>
                    <div id="panelsStayOpen-tags" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <span id="hint" class=""></span>
                            <div class="input-group flex-nowrap mb-3">
                                <label class="input-group-text" for="tags">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-tag" viewBox="0 0 16 16">
                                        <path d="M6 4.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm-1 0a.5.5 0 1 0-1 0 .5.5 0 0 0 1 0z" />
                                        <path d="M2 1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 1 6.586V2a1 1 0 0 1 1-1zm0 5.586 7 7L13.586 9l-7-7H2v4.586z" />
                                    </svg> Tags
                                </label>
                                <input type="text" id="tag" placeholder="Enter a word" class="form-control" aria-label="Tags" aria-describedby="button-tags">
                                <input type="hidden" id="tags" name="tags" value="<?= $data->obj->tags_name ?? '' ?>">
                                <button class="btn btn-outline-primary pb-0" type="button" onclick="addItem()" id="button-tags">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z" />
                                    </svg>
                                </button>
                            </div>
                            <div id="itemList">
                                <?php if (isset($data->obj->tags_name)) :
                                    foreach (explode(',', $data->obj->tags_name) as $tagKey => $tag) :
                                        if (!empty($tag)) : ?>
                                            <span class="badge bg-secondary mb-2 mx-1">
                                                <button class="btn p-0 text-light " type="button" onclick="removeItem(<?= $tagKey ?>)">
                                                    <?= $tag ?>
                                                </button>
                                            </span>
                                <?php endif;
                                    endforeach;
                                endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="">
                    <h2 class="accordion-header">
                        <button class="btn btn-primary accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-meta" aria-expanded="false" aria-controls="panelsStayOpen-meta">
                            <i class="bi bi-meta me-2"></i> meta
                        </button>
                    </h2>
                    <div id="panelsStayOpen-meta" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <span id="hint" class=""></span>
                            <div class="flex-nowrap mb-3">
                                <label class="form-label" for="keywords">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-tag" viewBox="0 0 16 16">
                                        <path d="M6 4.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm-1 0a.5.5 0 1 0-1 0 .5.5 0 0 0 1 0z" />
                                        <path d="M2 1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 1 6.586V2a1 1 0 0 1 1-1zm0 5.586 7 7L13.586 9l-7-7H2v4.586z" />
                                    </svg> Keywords
                                </label>
                                <input type="text" class="form-control" id="keywords" name="keywords" value="<?= $data->obj->meta_keywords ?? '' ?>">
                            </div>
                            <div class="flex-nowrap mb-3">
                                <label class="form-label" for="description">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-tag" viewBox="0 0 16 16">
                                        <path d="M6 4.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm-1 0a.5.5 0 1 0-1 0 .5.5 0 0 0 1 0z" />
                                        <path d="M2 1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 1 6.586V2a1 1 0 0 1 1-1zm0 5.586 7 7L13.586 9l-7-7H2v4.586z" />
                                    </svg> Description
                                </label>
                                <textarea type="text" class="form-control" id="description" name="description"><?= $data->obj->meta_description ?? '' ?></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</form>

<!-- 
     [meta_keywords] => TEST
    [meta_description] => TEST
    [meta_thumbnail_id] => 5
 -->

<?php include WEBROOT . '/modules/filestorage/templates/components/gallery.php'; ?>