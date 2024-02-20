<div class="dropstart">
    <button class="btn-link text-primary btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots-vertical" viewBox="0 0 16 16">
            <path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z" />
        </svg>
    </button>
    <ul class="dropdown-menu">
        <?php foreach ($dropactions as $action => $dropaction) : ?>
            <li>
                <?php switch ($dropaction['mode']):
                    case 'link': ?>
                        <a class="dropdown-item d-flex gap-2 align-items-center" href="<?= $dropaction['route']; ?>">
                            <?= $dropaction['icon']; ?>
                            <?= $action; ?>
                        </a>
                    <?php break;
                    case 'modal': ?>
                        <button onclick="<?= $dropaction['function']; ?>" class="btn dropdown-item d-flex gap-2 align-items-center" data-bs-toggle="modal" data-bs-target="#<?= $dropaction['modal']; ?>">
                            <?= $dropaction['icon']; ?>
                            <?= $action; ?>
                        </button>
                    <?php break;
                    case 'button': ?>
                        <button onclick="<?= $dropaction['function']; ?>" class="btn">
                            <?= $dropaction['icon']; ?>
                            <?= $action; ?>
                        </button>
                    <?php break;
                    case 'line': ?>
                        <hr class="dropdown-divider">
            <?php break;
                endswitch;
            endforeach; ?>
            </li>
    </ul>
</div>

<?php if (isset($dropmodals)) : foreach ($dropmodals as $dropmodal) : ?>
        <div class="modal fade" id="<?= $dropmodal['dropid'] ?>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="<?= $dropmodal['dropid'] ?>Label" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title fs-5" id="<?= $dropmodal['dropid'] ?>Label"><?= $dropmodal['droptitle']; ?></h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <?= $dropmodal['dropdescription']; ?>
                    </div>
                    <div class="modal-footer">
                        <a id="<?= $dropmodal['dropid'] ?>-subbutton" href="#" class="btn btn-danger"></a>
                        <button type="button" class="btn btn-link" data-bs-dismiss="modal"><?= $data->label->get('cancel', 'Cancel'); ?></button>
                    </div>
                </div>
            </div>
        </div>
<?php endforeach;
endif; ?>