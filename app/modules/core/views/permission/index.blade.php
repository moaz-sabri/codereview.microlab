<?php use App\Bootstrap\Web;
// echo '<pre>';
// print_r($this->data);
// echo '</pre>';
?>
<div class="container">
    <ul class="nav justify-content-between ">
        <h1>Permission Groups</h1>
    </ul>

    <default-table el-data='<?= str_replace("'", '' , json_encode($this->data->groups->result)) ?>'
        el-edit="<?= Web::getPath('get_manger_group') ?>" el-dele="<?= Web::getPath('delete_manger_group') ?>"
        el-header='{
            "pgroup_guide":"#",
            "pgroup_name":"Name",
            "pgroup_description":"Description",
            "pgroup_created_at":"Created",
            "":""}'
        el-function="defaultConfirm" el-uid='pgroup_uid'>
    </default-table>

    <popup-question el-id="defaultConfirm" el-title="do you need reomve this group?"></popup-question>

    <nav class="nav justify-content-between">
        <div class="nav-item">
            <a class="btn btn-primary" aria-current="groups" href="<?= Web::getPath('get_manger_add_group') ?>">
                <i class="bi bi-plus-lg"></i>
            </a>
            <button class="btn btn-primary disabled" aria-current="<?= Web::getPath('delete_manger_group') ?>"
                id="deleteList">
                <i class="bi bi-trash "></i>
            </button>
        </div>
        <div class="nav-item">
            <pagination-table el-data='<?= json_encode($this->data->groups->info) ?>'></pagination-table>
        </div>
    </nav>

</div>
