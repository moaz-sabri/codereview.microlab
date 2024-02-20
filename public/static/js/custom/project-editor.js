let items = [];

let tags = document.getElementById("tags");
if (tags.value.length > 0) {
  items = tags.value.split(",");
}

function addItem() {
  document.getElementById("hint").innerHTML = "";
  let input = document.getElementById("tag");
  let value = input.value.trim();

  if (value !== "" && value.indexOf(" ") !== 0) {
    if (!items.includes(value)) {
      items.push(value);
      displayItems();
    } else {
      document.getElementById("hint").innerHTML =
        "This item already exists in the list.";
    }
    input.value = "";
  }
}

function displayItems() {
  let itemList = document.getElementById("itemList");
  itemList.innerHTML = ""; // Clear the list before displaying items
  let tags = document.getElementById("tags");
  tags.value = items;

  items.forEach((item, index) => {
    let span = document.createElement("span");
    span.setAttribute("class", "badge bg-secondary mb-2 mx-1");

    let button = document.createElement("button");
    button.setAttribute("class", "btn p-0 text-light ");
    button.type = "button";
    button.textContent = item;
    button.setAttribute("onclick", "removeItem(" + index + ")");

    span.appendChild(button);
    itemList.appendChild(span);
  });
}

function removeItem(index) {
  items.splice(index, 1);
  displayItems();
}
