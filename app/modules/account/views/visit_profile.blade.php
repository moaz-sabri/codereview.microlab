<?php use App\Bootstrap\Web; ?>
<a href="<?= Web::getPath('get_edit_profile') ?>">Edit</a>
<?php
echo '<pre>';
print_r($this->data);
echo '</pre>';
