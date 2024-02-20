<?php use App\Bootstrap\Web;
// echo '<pre>';
// print_r($this->data);
// echo '</pre>';
?>
<div class="container">
    <ul class="nav justify-content-between ">
        <h1>Users</h1>
    </ul>

    <default-table el-data='<?= str_replace("'", '' , json_encode($this->data->users->result)) ?>'
        el-edit="<?= Web::getPath('get_manger_user') ?>" el-dele="<?= Web::getPath('delete_manger_user') ?>"
        el-header='{
            "user_guide":"#",
            "user_username":"UName",
            "user_email":"Email",
            "user_created_at":"Created",
            "":""}'
        el-function="defaultConfirm" el-uid='user_uid'>
    </default-table>

    <popup-question el-id="defaultConfirm" el-title="do you need reomve this user?"></popup-question>

    <nav class="nav justify-content-between">
        <div class="nav-item">
            <a class="btn btn-primary" aria-current="users" href="<?= Web::getPath('get_manger_add_user') ?>">
                <i class="bi bi-plus-lg"></i>
            </a>
            <button class="btn btn-primary disabled" aria-current="<?= Web::getPath('delete_manger_user') ?>"
                id="deleteList">
                <i class="bi bi-trash "></i>
            </button>
        </div>
        <div class="nav-item">
            <pagination-table el-data='<?= json_encode($this->data->users->info) ?>'></pagination-table>
        </div>
    </nav>

</div>
