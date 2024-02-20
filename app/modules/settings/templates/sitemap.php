<div class="app-card app-card-orders-table shadow-sm p-5 mb-5">
    <div class="app-card-body">
        <div class="app-card app-card-orders-table shadow-sm mb-5">
            <div class="app-card-body">
                <div id="preview-table" class="table-responsive">
                    <table id="myTable" class="table app-table-hover mb-0 text-left">
                        <thead>
                            <tr>
                                <th class="cell">#</th>
                                <th class="cell">url</th>
                                <th class="cell exclude-export"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (isset($data->obj->result)) : foreach ($data->obj->result as $url) : ?>
                                    <tr>
                                        <td class="cell"><?= $url['id'] ?></td>
                                        <td class="cell"><?= $url['url'] ?></td>
                                        <td class="cell exclude-export text-end">
                                            <?php
                                            $dropactions = [
                                                "delete" => [
                                                    "mode" => "modal",
                                                    "icon" => '/static/svg-icons/trash3.svg',
                                                    "function" => "selectId('delete-{$url['id']}', '/url/delete/{$url['id']}', 'Yes')",
                                                    "modal" =>  'delete-' .  $url['id']
                                                ]
                                            ];

                                            $dropmodals = [
                                                [
                                                    "dropid" => 'delete-' .  $url['id'],
                                                    "droptitle" => "Delete Post",
                                                    "dropdescription" => "<p>are you sure do you need delete the <strong>{$url['url']}</strong> post if you are sure click on yes button or cancel on close button</p>",
                                                ]
                                            ];

                                            $require_dropactions = DROPACTIONS;
                                            if (file_exists($require_dropactions)) :
                                                require $require_dropactions;
                                            else :
                                                $_SESSION['alert'] = "Not founded ({$require_dropactions}) file";
                                                exit;
                                            endif;
                                            ?>

                                        </td>
                                    </tr>
                            <?php endforeach;
                            endif; ?>
                        </tbody>
                    </table>
                </div><!--//table-responsive-->

            </div><!--//app-card-body-->
        </div><!--//app-card-->
        <nav class="app-pagination">
            <?php require PAGINATION; ?>
        </nav><!--//app-pagination-->
    </div>
</div>