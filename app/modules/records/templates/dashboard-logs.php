<div class="mb-4">
    <h1 class="app-page-title mb-0">
        <?= $data->label->get('error_log', 'Error log'); ?>
    </h1>
</div>
<div class="app-card app-card-orders-table shadow-sm mb-5">
    <div class="app-card-body p-3">
        <div id="preview-table" class="table-responsive-md container">
            <table id="myTable" class="table table-light table-hover">
                <thead>
                    <tr id="headTable">
                        <th class="cell"><?= $data->label->get('table_guide', 'Guide'); ?></th>
                        <th class="cell"><?= $data->label->get('table_status', 'Status'); ?></th>
                        <th class="cell"><?= $data->label->get('table_message', 'Message'); ?></th>
                        <th class="cell"><?= $data->label->get('table_date', 'Date'); ?></th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <?php if (isset($data->obj->result)) : foreach ($data->obj->result as $log) : ?>
                            <tr>
                                <td class="cell"><?= $log->guide ?></td>
                                <td class="cell"><?= $log->status ?></td>
                                <td class="cell"><?= $log->message ?></td>
                                <td class="cell"><?= date(DATE_VIEW, strtotime($log->created_at)) ?></td>
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