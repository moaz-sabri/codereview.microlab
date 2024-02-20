let filesUpload = false,
  ids = [],
  inputId,
  fileInput,
  fileList;

document.addEventListener("DOMContentLoaded", () => {
  fileInput = document.getElementById("files");
  fileList = document.getElementById("fileList");
});

function selectInput(id) {
  inputId = id;
}

function sendToServer() {
  const formData = new FormData();
  if (filesUpload == false) {
    alert("you don`t have any file selected to uploa");
    return;
  }
  for (let i = 0; i < filesUpload.length; i++) {
    formData.append("files[]", filesUpload[i]);
  }

  fetch("/api/uploads/file", {
    method: "POST",
    headers: {
      Authorization: token,
    },
    body: formData,
  })
    .then((response) => response.json())
    .then((data) => {
      if (data) {
        data.map((file) => {
          ids.push(file.uid);

          let img = document.createElement("img");
          img.setAttribute("width", "100");
          img.setAttribute("alt", file.name);
          img.setAttribute("id", file.uid + "-img");
          img.setAttribute("src", "/storage" + file.path);
          previewInListSelected(img, true);
        });
      }

      fileList.innerHTML = ""; // Clear previous list
      fileInput.value = ""; // Clear the selected files by setting value to an empty string
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}

let pageNumber = 1;

function loadFiles() {
  fetch("/api/load/files?current=" + pageNumber + "&count=8", {
    method: "POST",
  })
    .then((response) => response.json())
    .then((data) => {
      document.getElementById("upload").style.display = "none";
      document.getElementById("storage").style.display = "block";

      if (data == false || data.count * data.current > data.total) {
        document.getElementById("more").style.display = "none";
      }

      if (data.result.length > 0) {
        let imgList = document.getElementById(inputId).value;
        let listArray = imgList.split(",").filter(Boolean);

        data.result.map((file) => {
          let tr = document.createElement("tr");

          let th = document.createElement("th");
          th.setAttribute("class", "cell");

          let div = document.createElement("div");
          div.setAttribute("class", "form-check");

          let input = document.createElement("input");
          input.setAttribute("class", "form-check-input");
          input.setAttribute("type", "checkbox");
          input.setAttribute("id", file.uid);
          input.setAttribute("value", file.uid);
          input.setAttribute("onchange", "selectFile(event)");

          if (listArray.includes(file.uid.toString(), false)) {
            input.checked = true;
          }

          let td = document.createElement("td");
          td.setAttribute("class", "cell");
          td.setAttribute("scope", "col");

          if (imgExtension.includes(file.extension)) {
            let img = document.createElement("img");
            img.setAttribute("width", "100");
            img.setAttribute("alt", file.name);
            img.setAttribute("id", file.uid + "-img");
            img.setAttribute("src", "/storage" + file.path);
            td.appendChild(img);
          }

          let p = document.createElement("span");
          p.setAttribute("class", "m-auto text-center");
          p.innerText += file.name;
          td.appendChild(p);

          div.appendChild(input);
          th.appendChild(div);

          tr.appendChild(th);
          tr.appendChild(td);
          document.getElementById("list").appendChild(tr);
        });
      }
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}

function nextPage() {
  pageNumber++;
  loadFiles();
}

function updateFileList() {
  fileList.innerHTML = ""; // Clear previous list

  const files = fileInput.files;
  filesUpload = files;

  for (let i = 0; i < files.length; i++) {
    const file = files[i];
    if (validateAndFilterFile(file)) {
      const listItem = document.createElement("div");
      listItem.textContent = file.name;
      fileList.appendChild(listItem);
    }
  }
}

function validateAndFilterFile(file) {
  const maxSizeInMB = 5; // Maximum allowed file size in megabytes
  const allowedTypes = [
    "image/jpeg",
    "image/png",
    "image/gif",
    "application/pdf",
    "image/svg+xml",
    "application/msword",
    "application/vnd.ms-excel",
    "image/webp",
  ]; // Allowed file types

  // Check file size
  if (file.size > maxSizeInMB * 1024 * 1024) {
    alert("File size exceeds the maximum limit of " + maxSizeInMB + "MB");
    return false;
  }

  // Check file type
  if (!allowedTypes.includes(file.type)) {
    alert("Invalid file type or extension.");
    return false;
  }

  // Check file name (optional)
  const allowedExtensions = [
    "jpg",
    "jpeg",
    "png",
    "gif",
    "pdf",
    "svg",
    "doc",
    "xlsx",
    "webp",
  ];
  const fileName = file.name.toLowerCase();
  const fileExtension = fileName.split(".").pop();
  if (!allowedExtensions.includes(fileExtension)) {
    alert(
      "Invalid file name or extension. Please use Image, PDF, Excel or GIF files."
    );
    return false;
  }

  // If all checks pass, return true to indicate the file is valid
  return true;
}

let imgExtension = ["jpg", "jpeg", "png", "gif", "webp"];

function selectFile(e) {
  let imged = document.getElementById(e.target.value + "-img");

  if (e.target.checked && !ids.includes(e.target.value)) {
    ids.push(e.target.value);
    e.target.setAttribute("checked", true);

    previewInListSelected(imged, true);
  } else if (!e.target.checked && ids.includes(e.target.value)) {
    var index = ids.indexOf(e.target.value);

    if (index !== -1) {
      ids.splice(index, 1); // Remove one element at the found index
      e.target.removeAttribute("checked");
      previewInListSelected(imged, false);
    }
  }
}

function uploadFile() {
  document.getElementById("upload").style.display = "block";
  document.getElementById("storage").style.display = "none";
}

function selectedFiles() {
  let clearSelector = document.querySelectorAll("tbody>tr>th>div>input");

  if (ids.length > 0) {
    let selected = document.getElementById(inputId);

    if (selected.value.length > 0) {
      selected.value += "," + ids;
    } else {
      selected.value = ids;
    }

    clearSelector.forEach((element) => {
      element.checked = false;
    });

    closePopup();
  } else {
    alert("you don`t have any file selected");
  }
}

function closePopup() {
  fileList.innerHTML = ""; // Clear previous list
  fileInput.value = ""; // Clear the selected files by setting value to an empty string
  document.getElementById("list").innerHTML = "";
  ids = [];
  uploadFile();
}

function previewInListSelected(img, e) {
  // this to preview in list Selected Components
  let listSelected = document.getElementById("listSelected-" + inputId);

  if (listSelected) {
    let imged = document.getElementById(img.id + "ed-" + inputId + "container");

    if (e && !imged) {
      let newIMG = img.cloneNode();
      newIMG.id = img.id + "ed";
      newIMG.setAttribute("class", "w-100");

      let container = document.createElement("div");
      container.setAttribute("id", newIMG.id + "-container");
      container.setAttribute("class", "");
      container.setAttribute("style", "position: relative;");

      let button = document.createElement("button");
      button.setAttribute("class", "exit-button");
      button.setAttribute("type", "button");
      button.setAttribute("onclick", "removeImg('" + container.id + "')");
      button.innerText = "X";

      container.appendChild(button);
      container.appendChild(newIMG);
      listSelected.appendChild(container);
    } else if (imged) {
      imged.remove();
    }
  }
}

function removeImg(id, container) {
  let imged = document.getElementById(id);
  imged.remove();

  if (container) inputId = container;
  let imgList = document.getElementById(inputId);
  let listArray = imgList.value.split(",").filter(Boolean);

  let idIs = id.replace("-imged-" + inputId + "container", "");
  var index = listArray.indexOf(idIs);

  console.log(idIs);
  if (index !== -1) {
    listArray.splice(index, 1); // Remove one element at the found index
    imgList.value = listArray;
  }
}
