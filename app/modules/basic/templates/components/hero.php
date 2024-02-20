<section role="hero" id="hero-fullscreen" class="hero-fullscreen d-flex align-items-center">
    <div role="container" class="container d-flex flex-column align-items-center position-relative" data-aos="zoom-out">
        <h2><?= $data->label->get("hero_title"); ?><span><?= PROJECT_NAME ?></span></h2>
        <p><?= $data->label->get("hero_subtitle"); ?></p>
        <div role="contanet" class="d-flex">
            <a href="#about" class="btn-get-started scrollto">
                <?= $data->label->get("hero_button"); ?>
            </a>
        </div>
    </div>
</section>