function toggleToolbar() {
  let tool = document.getElementById("toolbar");
  let container = document.getElementById("main-holder");
  let editorToolbar = document.getElementsByClassName("ql-toolbar")[0];
  console.log(editorToolbar);

  if (tool.style.display == "none") {
    container.style.gridTemplateColumns = "auto 300px";
    editorToolbar.style.right = "300px";
    tool.style.display = "block";
  } else {
    container.style.gridTemplateColumns = "auto";
    editorToolbar.style.right = "0";
    tool.style.display = "none";
  }
}

let quill = new Quill("#editor", {
  modules: {
    toolbar: [
      [{ header: [1, 2, 3, 4, 5, 6, false] }],
      ["bold", "italic", "underline", "strike"], // toggled buttons
      [{ color: [] }, { background: [] }], // dropdown with defaults from theme
      [{ font: [] }],
      [{ align: [] }],
      [{ indent: "-1" }, { indent: "+1" }], // outdent/indent
      [{ direction: "rtl" }], // text direction
      [{ script: "sub" }, { script: "super" }], // superscript/subscript
      [{ list: "ordered" }, { list: "bullet" }],
      ["link"],
      ["blockquote", "code-block"],
      ["clean"],
    ],
  },
  placeholder: "",
  theme: "snow", // or 'bubble'
});

let content = document.getElementById("content");
content.value = quill.root.innerHTML;
function saveContent() {
  content.value = quill.root.innerHTML;
}
