        <!-- ======= F.A.Q Section ======= -->
        <section role="faq" id="faq" class="faq bg-light">
            <div role="container" class="container" data-aos="fade-up">
                <div role="header" class="content px-xl-5">
                    <h3>
                        <?= $data->label->get("qanda_title"); ?>
                        <strong>
                            <?= $data->label->get("qanda_title_strong"); ?>
                        </strong>
                    </h3>
                    <p>
                        <?= $data->label->get("qanda_subtitle"); ?>
                    </p>
                </div>

                <div role="content" class="row gy-4">
                    <div class="col-lg-8 d-flex flex-column justify-content-center align-items-stretch  order-2 order-lg-1">
                        <div class="accordion accordion-flush px-xl-5" id="faqlist">

                            <div class="accordion-item" data-aos="fade-up" data-aos-delay="50">
                                <h3 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-1">
                                        <i class="bi bi-question-circle question-icon"></i>
                                        What services do you offer?
                                    </button>
                                </h3>
                                <div id="faq-content-1" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                                    <div class="accordion-body">
                                        We provide a range of comprehensive digital services, including mailbox solutions, data analysis, design services, SEO optimization, dedicated support, deadline management, strategic planning, domains and hosting, and mini mobile app development.
                                    </div>
                                </div>
                            </div><!-- # Faq item-->

                            <div class="accordion-item" data-aos="fade-up" data-aos-delay="100">
                                <h3 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-2">
                                        <i class="bi bi-question-circle question-icon"></i>
                                        How can I contact your support team?
                                    </button>
                                </h3>
                                <div id="faq-content-2" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                                    <div class="accordion-body">
                                        For any assistance or queries, reach out to our dedicated support team via email at <?= CONTACT_MAIL ?>.
                                    </div>
                                </div>
                            </div><!-- # Faq item-->

                            <div class="accordion-item" data-aos="fade-up" data-aos-delay="150">
                                <h3 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-3">
                                        <i class="bi bi-question-circle question-icon"></i>
                                        What is the process for getting a mobile app developed?
                                    </button>
                                </h3>
                                <div id="faq-content-3" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                                    <div class="accordion-body">
                                        Discuss your mobile app ideas with us! Contact our team to schedule a consultation. We'll guide you through the development process, from ideation to deployment.
                                    </div>
                                </div>
                            </div><!-- # Faq item-->

                            <div class="accordion-item" data-aos="fade-up" data-aos-delay="200">
                                <h3 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-4">
                                        <i class="bi bi-question-circle question-icon"></i>
                                        How can I register a domain with your services?
                                    </button>
                                </h3>
                                <div id="faq-content-4" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                                    <div class="accordion-body">
                                        <i class="bi bi-question-circle question-icon"></i>
                                        Securing your online identity is easy. Get in touch with us, and our team will assist you in registering your desired domain and setting up reliable hosting.
                                    </div>
                                </div>
                            </div><!-- # Faq item-->

                            <div class="accordion-item" data-aos="fade-up" data-aos-delay="250">
                                <h3 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-5">
                                        <i class="bi bi-question-circle question-icon"></i>
                                        Can I customize the services according to my business needs?
                                    </button>
                                </h3>
                                <div id="faq-content-5" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                                    <div class="accordion-body">
                                        Absolutely! We understand that each business is unique. Contact us to discuss your specific requirements, and we'll tailor our services to meet your individual needs.
                                    </div>
                                </div>
                            </div><!-- # Faq item-->

                            <div class="accordion-item" data-aos="fade-up" data-aos-delay="300">
                                <h3 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-6">
                                        <i class="bi bi-question-circle question-icon"></i>
                                        What sets your strategic planning services apart?
                                    </button>
                                </h3>
                                <div id="faq-content-6" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                                    <div class="accordion-body">
                                        Our strategic planning services involve a thorough analysis of your business goals and market trends. We create a customized roadmap to ensure your digital journey aligns with your long-term objectives.
                                    </div>
                                </div>
                            </div><!-- # Faq item-->

                            <div class="accordion-item" data-aos="fade-up" data-aos-delay="350">
                                <h3 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-7">
                                        <i class="bi bi-question-circle question-icon"></i>
                                        How do I initiate a design project with your team?
                                    </button>
                                </h3>
                                <div id="faq-content-7" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                                    <div class="accordion-body">
                                        To start a design project, simply get in touch with our design experts through email or phone. We'll discuss your vision, goals, and preferences to kickstart the creative process.
                                    </div>
                                </div>
                            </div><!-- # Faq item-->

                            <div class="accordion-item" data-aos="fade-up" data-aos-delay="400">
                                <h3 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-8">
                                        <i class="bi bi-question-circle question-icon"></i>
                                        What are your payment options?
                                    </button>
                                </h3>
                                <div id="faq-content-8" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                                    <div class="accordion-body">
                                        We offer flexible payment options to suit your convenience. Our team will provide details and work with you to find the best payment solution for your project.
                                    </div>
                                </div>
                            </div><!-- # Faq item-->

                        </div>

                    </div>
                    <div  role="cover" class="col-lg-4 align-items-stretch order-1 order-lg-2 img">
                        <img src="/public/assets/img/faq.webp" class="w-100 py-4 lazyload" alt="" loading="lazy">
                    </div>
                </div>

            </div>
        </section><!-- End F.A.Q Section -->