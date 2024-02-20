</div><!--//app-content-->
</div><!--//app-wrapper-->


<div class=" app-header fixed-bottom">

    <nav class="row m-0 text-center">
        <div class="col btn fs-2 border-start border-end">
            <a class="nav-link text-primary" href="/about"><i class="bi bi-info-circle"></i></a>
        </div>
        <div class="col btn fs-2  border-end">
            <a class="nav-link text-primary" href="/blog"><i class="bi bi-newspaper"></i></a>
        </div>
        <div class="col btn fs-2">
            <a class="nav-link text-primary" aria-current="page" href="/"><i class="bi bi-house"></i></a>
        </div>
        <div class="col btn fs-2  border-end text-center">
            <button class="nav-link text-primary m-0 m-auto" data-bs-toggle="modal" data-bs-target="#oderform">
                <i class="bi bi-bag"></i>
            </button>
        </div>
        <div class="col btn fs-2">
            <button class="nav-link text-primary m-0 m-auto" data-bs-toggle="offcanvas" data-bs-target="#phonelist" aria-controls="phonelist">
                <i class="bi bi-view-list"></i>
            </button>
        </div>
    </nav>
</div>


<?php include_once WEBROOT . '/modules/offers/templates/components/offer.inc'; ?>
<?php include_once WEBROOT . '/templates/themes/default/components/mobilelist.inc'; ?>