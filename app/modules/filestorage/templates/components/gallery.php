<div class="modal fade" id="fileStorage" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="fileStorageLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="fileStorageLabel">Upload Files</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closePopup()"></button>
            </div>
            <div class="modal-body">
                <div id="upload">
                    <?php require WEBROOT . DS . 'modules/filestorage/templates/components/uploads.php'; ?>
                    <hr>
                    <button type="button" class="btn text-primary" onclick="loadFiles()">Storage</button>
                </div>
                <div id="storage" >
                    <table class="table table-light table-hover">
                        <thead>
                            <tr>
                                <th scope="col" class="cell">
                                    #
                                </th>
                                <th scope="col" class="cell"><?= $data->label->get('table_guide', 'Guide'); ?></th>
                            </tr>
                        </thead>
                        <tbody id="list" class="table-group-divider">

                        </tbody>
                    </table>
                    <div id="more" class="text-center">
                        <button type="button" class="btn btn-primary" onclick="nextPage()">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-down" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M1.646 6.646a.5.5 0 0 1 .708 0L8 12.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
                                <path fill-rule="evenodd" d="M1.646 2.646a.5.5 0 0 1 .708 0L8 8.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
                            </svg>
                        </button>
                    </div>
                    <hr>
                    <button type="button" class="btn text-primary" onclick="uploadFile()">Upload</button>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closePopup()" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="selectedFiles()" data-bs-dismiss="modal">Selected</button>
            </div>
        </div>
    </div>
</div>