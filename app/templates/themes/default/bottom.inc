</main><!-- End #main -->
<!-- ======= Footer ======= -->
<footer id="footer" class="footer">

    <div class="footer-content">
        <div class="container">
            <div class="row">

                <div class="col-lg-3 col-md-6">
                    <div class="footer-info">
                        <h3><?= PROJECT_NAME ?></h3>
                        <p>
                            <strong>Email:</strong> <a href="mailto:<?= CONTACT_MAIL ?>"><?= CONTACT_MAIL ?></a><br>
                        </p>
                    </div>
                </div>

                <div class="col-lg-2 col-md-6 footer-links">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><i class="bi bi-chevron-right"></i> <a href="/about">About us</a></li>
                        <li><i class="bi bi-chevron-right"></i> <a href="/services">Services</a></li>
                        <li><i class="bi bi-chevron-right"></i> <a href="/policy">Privacy policy</a></li>
                        <li><i class="bi bi-chevron-right"></i> <a href="/qanda">Frequently A&Q</a></li>
                        <li><i class="bi bi-chevron-right"></i> <a href="/impression">Impression</a></li>
                    </ul>
                </div>

                <div class="col-lg-3 col-md-6 footer-links">
                    <h4>More Links</h4>
                    <ul>
                        <li><i class="bi bi-chevron-right"></i> <a href="/websites">Websites</a></li>
                        <li><i class="bi bi-chevron-right"></i> <a href="/products">Products</a></li>
                        <li><i class="bi bi-chevron-right"></i> <a href="/documentation">Documentation</a></li>
                        <li><i class="bi bi-chevron-right"></i> <a href="/blog">Blog's</a></li>
                        <li><i class="bi bi-chevron-right"></i> <a href="/help">Help</a></li>
                    </ul>
                </div>

                <div class="col-lg-4 col-md-6 footer-newsletter">
                    <article class="my-5">
                        <strong>Please note: This project is just a template to preview my experience. It is not a real project and I do not have any real-world examples yet.</strong>
                    </article>
                    <!-- <div class="col-lg-4 col-md-6 footer-newsletter">
                    <h4>Our Newsletter</h4>
                    <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
                    <form action="" method="post">
                        <input type="email" name="email"><input type="submit" value="Subscribe">
                    </form>
                </div> -->
                </div>

            </div>
        </div>
    </div>

    <div class="footer-legal text-center">
        <div class="container d-flex flex-column flex-lg-row justify-content-center justify-content-lg-between align-items-center">

            <div class="d-flex flex-column align-items-center align-items-lg-start">
                <div class="copyright">
                    &copy; Copyright <strong><span><?= AUTHOR_NAME ?></span></strong>.
                </div>
                <div class="credits">
                    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                    <span>|</span>
                    Image by <a href="https://www.freepik.com">Freepik</a>
                </div>
            </div>
            <div class="">
                <div class="dropdown bd-mode-toggle">
                    <div class="nav-link dropdown">
                        <button class="btn py-2 mb-1 d-flex align-items-center no-toggle-arrow color-secondary-light" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="bd-theme" type="button" aria-expanded="false" data-bs-toggle="dropdown" aria-label="Toggle theme (auto)">
                            Language
                        </button>
                        <ul class="dropdown-menu">
                            <?php

                            use App\Modules\Settings\Loader\LanguageLoader;

                            foreach (LanguageLoader::$availableLanguages as $key => $path) :
                                // Split the string by '/'
                                $parts = explode('/', $path);
                                $languageCode = $parts[count($parts) - 2];
                            ?>
                                <li>
                                    <a class='dropdown-item' href='/lang/switch/<?= $languageCode; ?>'>
                                        <?= $data->label->get($languageCode, $languageCode) ?>
                                    </a>
                                </li>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</footer><!-- End Footer -->

<button class="btn btn-primary scroll-top d-flex align-items-center justify-content-center" onclick="gotop()"><i class="bi bi-arrow-up-short"></i></button>

<div id="preloader"></div>