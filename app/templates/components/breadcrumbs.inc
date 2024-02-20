<!-- ======= Breadcrumbs ======= -->

<?php

use App\Utilities\Utilitie;

if ($data->device != "mobile") :
?>
    <div class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center text-capitalize ">
                <h2><?= $data->param->module ?></h2>
                <ol>
                    <li><a href="<?= $data->param->module ?>"><?= $data->param->module ?></a></li>
                    <?php if (isset($data->param->endpoint)) : ?>
                        <li><span><?= $data->param->endpoint ?></span></li>
                    <?php endif; ?>
                    <?php if (isset($data->param->target)) : ?>
                        <li><span><?= $data->param->target ?></span></li>
                    <?php endif; ?>
                </ol>
            </div>

        </div>
    </div><!-- End Breadcrumbs -->
<?php endif;
