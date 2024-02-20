<div class="app-card app-card-orders-table shadow-sm p-5 mb-5">
    <div class="app-card-body">
        <?php

        use App\Utilities\Utilitie;

        foreach (App\Modules\Settings\Loader\LanguageLoader::$availableLanguages as $key => $path) :
            // Split the string by '/'
            $parts = explode('/', $path);
            $languageCode = $parts[count($parts) - 2];

            echo "<a href='/dashboard/language/{$languageCode}' class='btn btn-primary my-2 mx-1'>{$data->label->get($languageCode,$languageCode)}</a>";
        endforeach;
        ?>
        <?php if (count($data->obj) > 1) : ?>

            <div class="table-responsive">
                <table class="table app-table-hover mb-0 text-left">
                    <thead>
                        <tr>
                            <th class="cell">Key</th>
                            <th class="cell">Value</th>
                            <th class="cell"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($data->obj as $key => $lang) : ?>
                            <form action="/lang/updatelanguage/<?= $data->obj['lang']; ?>" method="post">
                                <tr>
                                    <th scope="row"><?= $key ?></th>
                                    <td>
                                        <input type="text" class="form-control" name="value" value="<?= $lang ?>" id="<?= $key ?>" aria-describedby="<?= $lang ?>">
                                    </td>
                                    <td class="text-end">
                                        <input type="hidden" name="key" value="<?= $key ?>">
                                        <button type="submit" class="btn btn-success">Save</button>
                                    </td>
                                </tr>
                            </form>
                        <?php endforeach; ?>
                        <form action="/lang/updatelanguage/<?= $data->obj['lang'];  ?>" method="post">
                            <tr>
                                <th scope="row">
                                    <input type="text" class="form-control" name="key" id="newKey">
                                </th>
                                <td>
                                    <input type="text" class="form-control" name="value" id="newValue">
                                </td>
                                <td class="text-end">
                                    <button type="submit" class="btn btn-success">Save</button>
                                </td>
                            </tr>
                        </form>
                    </tbody>
                </table>
            </div><!--//table-responsive-->
        <?php endif; ?>
    </div>
</div>