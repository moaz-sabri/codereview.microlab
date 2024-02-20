<div class="modal fade" id="oderform" tabindex="-1" aria-labelledby="oderformLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="signUpForm" onsubmit="return submitCreateOrder(event)" action="api/offer/create" method="post" role="form-order" class="needs-validation auth-form login-form text-body-emphasis" novalidate="">
                <h2 class="header-title d-block text-center">Comming Soon!</h2>
                <div class="modal-header form-header">
                    <span class="stepIndicator">Project Information</span>
                    <span class="stepIndicator">Budget limitation</span>
                    <span class="stepIndicator">Contact Details</span>
                </div>
                <div class="modal-body">
                    <!-- step one -->
                    <div class="step">
                        <h3 class="text-center mb-5">Project</h3>
                        <!-- Selector for project type -->
                        <div class="form-floating mb-3">
                            <select class="form-control text-capitalize" id="websiteType" name="type" oninput="this.className" required="">
                                <option value="" disabled selected>Select Website Type</option>
                                <?php

                                use App\Modules\Offers\Models\OfferModel;

                                foreach (OfferModel::$typeOptions as $key => $status) : ?>
                                    <option value="<?= $status ?>"><?= $status ?></option>
                                <?php endforeach; ?>
                            </select>
                            <label for="websiteType">Select Website Type:</label>
                        </div>
                        <!-- Selector for Process Start -->
                        <div class="form-floating mb-3">
                            <select class="form-control text-capitalize" id="processStart" name="start" oninput="this.className" required="">
                                <?php

                                foreach (OfferModel::$startOptions as $key => $status) : ?>
                                    <option value="<?= $status ?>"><?= $status ?></option>
                                <?php endforeach; ?>
                            </select>
                            <label for="processStart">Select Process Start:</label>
                        </div>
                        <!-- Selector for Process Speed -->
                        <div class="form-floating mb-3">
                            <select class="form-control text-capitalize" id="processSpeed" name="speed" oninput="this.className" required="">
                                <?php

                                foreach (OfferModel::$speedOptions as $key => $status) : ?>
                                    <option value="<?= $status ?>"><?= $status ?></option>
                                <?php endforeach; ?>
                            </select>
                            <label for="processSpeed">Select Process Speed:</label>
                        </div>
                    </div>

                    <!-- step two -->
                    <div class="step">
                        <h3 class="text-center mb-5">Your presence on the social network</h3>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="budget" name="budget" oninput="this.className" placeholder="Enter Budget" required="">
                            <label for="budget">Enter Budget:</label>
                        </div>
                        <div class="form-floating">
                            <textarea class="form-control" placeholder="Leave a comment here" id="message" name="message" oninput="this.className" style="height: 100px"></textarea>
                            <label for="message">Message</label>
                        </div>
                    </div>

                    <!-- step three -->
                    <div class="step">
                        <h3 class="text-center mb-5">We will never sell it</h3>

                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="name" name="name" oninput="this.className" placeholder="Your Name" required="">
                            <label for="name">Your Name:</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="email" name="email" oninput="this.className" placeholder="Your Email" required="">
                            <label for="email">Your Email:</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="tel" class="form-control" id="phone" name="phone" oninput="this.className" placeholder="Your Phone Number" required>
                            <label for="phone">Your Phone Number:</label>
                            <small id="phoneHelp" class="form-text text-muted">We'll never share your phone number with anyone else.</small>
                        </div>

                    </div>
                </div>
                <div class="modal-footer align-content-between justify-content-center">
                    <div class="my-3">
                        <div class="loading">Loading</div>
                        <div class="error-message"></div>
                        <div class="sent-message">Your message has been sent. Thank you!</div>
                    </div>
                    <button type="button" class="btn btn-secondary text-start" data-bs-dismiss="modal">Close</button>
                    <div>
                        <button type="button" id="prevBtn" class="btn btn-primary" onclick="nextPrev(-1)">Previous</button>
                        <button type="button" id="nextBtn" class="btn btn-primary" onclick="nextPrev(1)">Next</button>
                    </div>
                </div>
            </form>
        </div> <!-- modal-content -->
    </div>
</div>