<?php
use App\Modules\Core\CoreUrls;
// echo '<pre>';
// print_r($this->data);
// echo '</pre>';
$isNew = empty($this->data->user->user_username);
?>
<div class="container">
    <h1>User Activity (<?= $isNew ? 'Add User' : $this->data->user->user_username ?>)</h1>

    <default-table el-data='<?= str_replace("'", '' , json_encode($this->data->activity->result)) ?>'
        el-header='{
            "record_guide":"#",
            "record_message":"Message",
            "record_status":"Status",
            "record_created_at":"Created"
        }'
        el-uid='record_guide'>
    </default-table>

    <nav class="nav justify-content-between">
        <div class="nav-item">

        </div>
        <div class="nav-item">
            <pagination-table el-data='<?= json_encode($this->data->activity->info) ?>'></pagination-table>
        </div>
    </nav>
