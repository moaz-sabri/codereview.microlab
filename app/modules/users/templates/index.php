<div class="auth-background-image position-relative">
    <div class="bg-opacity-90 text-white p-4 rounded-3 position-absolute top-50 start-50 translate-middle">
        <div class="container px-0">
            <div class="bg-white rounded-3 mb-4 mx-auto">
                <!--  LOGO  -->
            </div>
            <div class="col">
                <?php
                if ($data->param->module == 'forgot') :
                    require_once WEBROOT . '/modules/users/templates/components/forgotpassword.php';
                elseif ($data->param->module == 'reset') :
                    require_once WEBROOT . '/modules/users/templates/components/resetpassword.php';
                else :
                    require_once WEBROOT . '/modules/users/templates/components/login.php';
                endif; ?>
            </div>
        </div>
    </div>
    <footer class="app-auth-footer">
        <div class="container text-center text-white py-3">
            <small>
                © <?php echo date("Y") ?> <?= AUTHOR_NAME ?>- (PLF) PHP Light-Framework Project
            </small>
            <small class="d-none copyright">
                Only Designed with
                <span class="sr-only">love</span>
                <i class="fas fa-heart"></i>
                by
                <a class="app-link" href="http://themes.3rdwavemedia.com" aria-label="Read more" target="_blank">
                    Xiaoying Riley
                </a> for developers
            </small>
        </div>
    </footer>
</div>