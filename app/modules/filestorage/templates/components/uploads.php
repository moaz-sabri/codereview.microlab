<form enctype="multipart/form-data" class="row">
    <div class="col-10">
        <div class="mb-3">
            <input type="file" class="form-control" id="files" multiple onchange="updateFileList()" required="">
        </div>

        <div class="form-group">
            <div id="fileList" class="mt-3">
            </div>
        </div>
    </div>
    <div class="col-2 m-auto text-center">
        <button type="button" class="btn text-primary" onclick="sendToServer()">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
                <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z" />
                <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708l3-3z" />
            </svg>
        </button>
    </div>
</form>