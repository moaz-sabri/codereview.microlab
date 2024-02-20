<div class="app-card app-card-orders-table shadow-sm p-5 mb-5">
    <div class="app-card-body">
        <h1>Unit Test</h1>
        <?php

        foreach ($data->obj as $key => $unit) : ?>
            <div class="mb-3">
                <p><strong><?= $key ?></strong></p>
                <code><?= $unit  ?></code>
            </div>
        <?php endforeach; ?>
    </div>
</div>