<?php if (isset($_SESSION['ALERT'])) : ?>
    <div class="toast-container position-fixed bottom-0  start-0 p-3 ">
        <div id="alertPopup" class="toast align-items-center  fade show bg-<?php echo $_SESSION['ALERT_COLOR'] ?? 'warning' ?>" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body">
                    <?= $_SESSION['ALERT'] ?>
                </div>
                <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>
<?php unset($_SESSION['ALERT'], $_SESSION['ALERT_COLOR']);
endif; ?>