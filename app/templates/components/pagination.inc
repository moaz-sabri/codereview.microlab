<?php if (isset($data->obj->result)) : ?>
    <?php if (count($data->obj->result) > 0) : ?>
        <nav aria-label="Page navigation" class="container mt-3">
            <div class="col-3 mx-auto">
                <ul class="pagination justify-content-center">
                    <?php if ($data->obj->current <= 1) : ?>
                        <li class="page-item disabled">
                            <a class="page-link" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    <?php else : ?>
                        <li class="page-item">
                            <a class="page-link" aria-label="Previous" href="<?= $data->obj->url; ?>?current=<?= $data->obj->current - 1; ?>&count=<?= $data->obj->count; ?>">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    <?php endif; ?>
                    <div class="mx-auto">
                        <ul class="list-group list-group-horizontal">
                            <li class="list-group-item border-0 fw-bold"><?= $data->obj->pages ?></li>
                            <li class="list-group-item border-0"><?= $data->label->get('pagination_of', 'of'); ?></li>
                            <li class="list-group-item border-0 fw-bold"><?= $data->obj->total ?></li>
                        </ul>
                    </div>
                    <?php if ($data->obj->pages >= $data->obj->total) : ?>
                        <li class="page-item disabled">
                            <a class="page-link" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    <?php else : ?>
                        <li class="page-item">
                            <a class="page-link" aria-label="Next" href="<?= $data->obj->url; ?>?current=<?= $data->obj->current + 1; ?>&count=<?= $data->obj->count; ?>">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    <?php endif; ?>
                </ul>
            </div>
        </nav>
    <?php else : ?>
        <p class="fs-4">Sorry, it seems that we don't have information on that topic at the moment. Our content is regularly updated, so please check back later, or feel free to explore other topics in the meantime. If there's anything else you're curious about, we're here to help!</p>
    <?php endif; ?>
<?php endif; ?>