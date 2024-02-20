<div class="row mb-4">
    <h1 class="col app-page-title mb-0 text-capitalize">
        <?= $data->label->get('traffic', 'traffic'); ?>
    </h1>
</div>
<div class="app-card app-card-orders-table shadow-sm mb-5">
    <div class="app-card-body p-3">
        <div class="table-responsive-md container">
            <table class="table table-light table-hover table align-middle caption-top">
                <caption>List of Traffic</caption>
                <thead class="table-dark">
                    <tr id="headTable">
                        <th class="cell"><?= $data->label->get('name', 'Name'); ?></th>
                        <th class="cell"><?= $data->label->get('url', 'Url'); ?></th>
                        <th class="cell"><?= $data->label->get('loaded', 'loaded'); ?></th>
                        <th class="cell"><?= $data->label->get('status', 'status'); ?></th>
                        <th class="cell"><?= $data->label->get('table_date', 'Date'); ?></th>
                    </tr>
                </thead>
                <tbody id="accordionExample" class="table-group-divider accordion">
                    <?php if (isset($data->obj->result)) : foreach ($data->obj->result as $key => $traffic) : ?>
                            <tr class="accordion-item">
                                <th colspan="5" class="accordion-header">
                                    <button class="btn w-100 text-start" type="button" data-bs-toggle="collapse" data-bs-target="#<?= $traffic->traffic_guide ?>" aria-expanded="false" aria-controls="<?= $traffic->traffic_guide ?>">
                                        <div class="btn-group w-100 align-items-center justify-content-between flex-wrap">
                                            <p>
                                                <i class="bi bi-info-circle"></i>
                                                <?= $traffic->traffic_page_url ?>
                                            </p>

                                            <p class="">
                                                <?= date(DATE_FORMAT, strtotime($traffic->traffic_updated_at)) ?>
                                            </p>
                                        </div>
                                        <div id="<?= $traffic->traffic_guide ?>" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                            <div class="accordion-body">
                                                <div class="mb-3">
                                                    <h4>Visitor</h4>
                                                    <code>
                                                        <?= !empty($traffic->registered_name) ? "<strong>User: </strong>$traffic->registered_name  " : '' ?>
                                                        <strong>IP is </strong>
                                                        <?= $traffic->visitor_ip_address ?>
                                                        <span> | </span>
                                                        <strong>Session is </strong>
                                                        <?= $traffic->visitor_session ?>
                                                    </code>
                                                </div>
                                                <div class="mb-3">
                                                    <h4>Device</h4>
                                                    <code>
                                                        <strong>Use </strong>
                                                        <?= $traffic->traffic_type ?>
                                                        <strong>, D </strong>
                                                        <?= $traffic->visitor_device ?? 'Unknown' ?>
                                                        <strong>, B </strong>
                                                        <?= $traffic->visitor_browser ?>
                                                        <strong>, L </strong>
                                                        <?= $traffic->visitor_language ?>
                                                        <strong>, OS </strong>
                                                        <?= $traffic->visitor_os ?>
                                                    </code>
                                                </div>
                                                <div class="mb-3">
                                                    <h4>Request</h4>
                                                    <code>
                                                        <strong>last loaded: </strong>
                                                        <?= $traffic->traffic_page_load_time ?>MS
                                                        <strong> & Status: </strong>
                                                        <?= $traffic->traffic_response ?>

                                                        <?= !empty($traffic->traffic_queries) ? "<strong> & queries: </strong>$traffic->traffic_queries" : ''  ?>
                                                        <strong> & called count: </strong>
                                                        <?= $traffic->traffic_reloaded ?>
                                                    </code>
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                </th>
                            </tr>
                    <?php endforeach;
                    endif; ?>

                </tbody>
            </table>
        </div>
        <nav class="app-pagination">
            <?php require PAGINATION; ?>
        </nav>
    </div>
</div>