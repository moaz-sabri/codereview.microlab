    <!-- ======= Header ======= -->
    <header id="header" class="header fixed-top" data-scrollto-offset="0">
      <div class="container-fluid d-flex align-items-center justify-content-between">

        <a href="/" class="logo d-flex align-items-center scrollto me-auto me-lg-0">
          <!-- Uncomment the line below if you also wish to use an image logo -->
          <!-- <img src="public/assets/img/logo.png" alt=""> -->
          <strong class="text-uppercase"><?= PROJECT_NAME ?></strong>
        </a>

        <nav id="navbar" class="navbar">
          <ul>
            <li><a class="nav-link scrollto" href="/about">About</a></li>
            <li><a class="nav-link scrollto" href="/services">Services</a></li>
            <li class="dropdown">
              <a href="javascript:void(0);"><span>Projects</span>
                <i class="bi bi-chevron-down dropdown-indicator"></i>
              </a>
              <ul>
                <li><a href="/websites">Websites</a></li>
                <li><a href="/products">Products</a></li>
              </ul>
            </li>
            <li><a class="nav-link scrollto" href="/blog">Blog's</a></li>
            <!-- <li class="dropdown megamenu"><a href="#"><span>Mega Menu</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
              <ul>
                <li>
                  <a href="#">Column 1 link 1</a>
                  <a href="#">Column 1 link 2</a>
                  <a href="#">Column 1 link 3</a>
                </li>
                <li>
                  <a href="#">Column 2 link 1</a>
                  <a href="#">Column 2 link 2</a>
                  <a href="#">Column 3 link 3</a>
                </li>
                <li>
                  <a href="#">Column 3 link 1</a>
                  <a href="#">Column 3 link 2</a>
                  <a href="#">Column 3 link 3</a>
                </li>
                <li>
                  <a href="#">Column 4 link 1</a>
                  <a href="#">Column 4 link 2</a>
                  <a href="#">Column 4 link 3</a>
                </li>
              </ul>
            </li>
            <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
              <ul>
                <li><a href="#">Drop Down 1</a></li>
                <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                  <ul>
                    <li><a href="#">Deep Drop Down 1</a></li>
                    <li><a href="#">Deep Drop Down 2</a></li>
                    <li><a href="#">Deep Drop Down 3</a></li>
                    <li><a href="#">Deep Drop Down 4</a></li>
                    <li><a href="#">Deep Drop Down 5</a></li>
                  </ul>
                </li>
                <li><a href="#">Drop Down 2</a></li>
                <li><a href="#">Drop Down 3</a></li>
                <li><a href="#">Drop Down 4</a></li>
              </ul>
            </li> -->
          </ul>
          <i class="bi bi-list fs-1 mobile-nav-toggle d-none"></i>
        </nav><!-- .navbar -->

        <div>
          <?php if (isset($_SESSION[SESSION])) : ?>
            <a href="/dashboard" class="btn fs-1">
              <i class="bi bi-person-circle"></i>
            </a>
          <?php endif; ?>
          <button type="button" class="btn btn-primary btn-getstarted scrollto" data-bs-toggle="modal" data-bs-target="#oderform">
            Order Now!
          </button>
        </div>
      </div>
    </header><!-- End Header -->

    <?php include_once WEBROOT . '/modules/offers/templates/components/offer.inc'; ?>
    <main id="main">