<?php

use App\Bootstrap\Web;

// echo '<pre>';
// print_r($this->data);
// echo '</pre>';
$isNew = empty($this->data->group->pgroup_name);
?>

<div class="container">
    <h1>Permissions store</h1>


    <custom-form
        el-action="<?= $isNew ? Web::getPath('post_manger_group') : Web::getPath('put_manger_group') . $this->data->group->pgroup_uid ?>"
        el-method="POST" el-enctype="application/json">

        <div class="col-sm-6">
            <input-form el-type="text" el-lebel="group_name" el-id="group_name"
                el-value="<?= $isNew ? '' : $this->data->group->pgroup_name ?>" el-placeholder="johan" valid="valid"
                invalid="input error"el-validation="onkeyup"></input-form>
        </div>
        <div class="col-sm-6">
            <textarea-form el-lebel="group_description" el-id="group_description"
                el-value="<?= $isNew ? '' : $this->data->group->pgroup_description ?>" el-placeholder="johan"
                valid="valid" invalid="input error"el-validation="onkeyup"></textarea-form>
        </div>
        <hr class="px-3">
        <div class="row">
            <?php foreach ($this->data->permissions_list as $key => $permissions) : ?>
            <div class="col-md-3">
                <h3 class="text-capitalize"><?= $key ?></h3>
                <?php foreach ($permissions as  $permission) : ?>
                <div class="col-sm-6">
                    <check-form el-type="checkbox" el-list="<?= $key ?>" el-lebel="valid"
                        el-value="<?= isset($this->data->selected_permission[$key]) && in_array($permission, $this->data->selected_permission[$key]) ? true : false ?>"
                        el-id="<?= $permission ?>" el-placeholder="johan" valid="valid"
                        invalid="input error"></check-form>
                </div>

                <?php endforeach; ?>
            </div>
            <?php endforeach; ?>
        </div>

        <submit-form el-type="submit" el-class="w-100 btn btn-primary btn-lg" el-name="Submit"></submit-form>
    </custom-form>
</div>
