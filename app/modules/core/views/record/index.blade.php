<?php use App\Bootstrap\Web;
// echo '<pre>';
// print_r($this->data);
// echo '</pre>';
?>
<div class="container">
    <ul class="nav justify-content-between ">
        <h1>Records</h1>
    </ul>

    <default-table el-data='<?= str_replace("'", '' , json_encode($this->data->record->result)) ?>'
        el-header='{
            "record_hash":"#",
            "record_status":"Status",
            "record_code":"Code",
            "record_message":"Message",
            "record_created_at":"Created"
            }'
        el-uid='record_guide'>
    </default-table>


    <nav class="nav justify-content-between">
        <div class="nav-item">

        </div>
        <div class="nav-item">
            <pagination-table el-data='<?= json_encode($this->data->record->info) ?>'></pagination-table>
        </div>
    </nav>

</div>
