<!-- ======= Contact Section ======= -->
<section role="contact" id="contact" class="contact">
    <div role="container" class="container">
        <div role="header" class="section-header">
            <h2><?= $data->label->get("contact_title"); ?></h2>
            <p><?= $data->label->get("contact_subtitle"); ?></p>
        </div>
        <div class="map">
            <!-- MAP -->
        </div><!-- End Google Maps -->
        <div class="row gy-5 gx-lg-5">

            <div class="col-lg-4">

                <div class="info">
                    <p><?= $data->label->get("contact_message"); ?></p>

                    <div class="info-item d-flex">
                        <div class="social-links order-first order-lg-last mb-3 mb-lg-0">
                            <a href="https://twitter.com/moaz_sabri_" class="twitter" aria-label="Read more" target="_blank"><i class="bi bi-twitter"></i></a>
                            <a href="https://www.facebook.com/moazsabri.dev" class="facebook" aria-label="Read more" target="_blank"><i class="bi bi-facebook"></i></a>
                            <a href="https://github.com/moaz-sabri" class="github" aria-label="Read more" target="_blank"><i class="bi bi-github"></i></a>
                            <a href="https://www.linkedin.com/in/moaz-sabri/" class="linkedin" aria-label="Read more" target="_blank"><i class="bi bi-linkedin"></i></a>
                        </div>
                    </div><!-- End Info Item -->

                    <div class="info-item d-flex">
                        <i class="bi bi-envelope flex-shrink-0"></i>
                        <div>
                            <h4><?= $data->label->get("email"); ?>:</h4>
                            <p><?= CONTACT_MAIL ?></p>
                        </div>
                    </div><!-- End Info Item -->

                    <!-- <div class="info-item d-flex">
                        <i class="bi bi-phone flex-shrink-0"></i>
                        <div>
                            <h4>Call:</h4>
                            <p>+1 5589 55488 55</p>
                        </div>
                    </div> -->
                    <!-- End Info Item -->

                </div>

            </div>

            <div class="col-lg-8">
                <form onsubmit="return submitContactForm(event)" action="api/mailbox/create" method="post" role="form-contact" class="contact needs-validation text-body-emphasis" novalidate="">
                    <input type="hidden" name="type" value="CONTACT">

                    <div class="row">
                        <div class="col-md-6 form-group">
                            <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required="">
                            <div class="valid-feedback">
                                <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
                            </div>
                            <div class="invalid-feedback">
                                <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
                            </div>
                        </div>
                        <div class="col-md-6 form-group mt-3 mt-md-0">
                            <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required="">
                            <div class="valid-feedback">
                                <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
                            </div>
                            <div class="invalid-feedback">
                                <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mt-3">
                        <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required="">
                        <div class="valid-feedback">
                            <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
                        </div>
                        <div class="invalid-feedback">
                            <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
                        </div>
                    </div>
                    <div class="form-group mt-3">
                        <textarea class="form-control" name="message" placeholder="Message" required=""></textarea>
                        <div class="valid-feedback">
                            <?= $data->label->get('new_case_valid_feedback', 'Looks good!') ?>
                        </div>
                        <div class="invalid-feedback">
                            <?= $data->label->get('case_policy_error', 'Sorry, you must accept the policy to proceed!') ?>
                        </div>
                    </div>
                    <div class="my-3">
                        <div class="loading">Loading</div>
                        <div class="error-message"></div>
                        <div class="sent-message">Your message has been sent. Thank you!</div>
                    </div>
                    <div class="text-center text-md-end">
                        <button type="submit" class="btn btn-lg btn-outline-primary"><?= $data->label->get("send_message"); ?></button>
                    </div>
                </form>
            </div><!-- End Contact Form -->

        </div>

    </div>
</section><!-- End Contact Section -->