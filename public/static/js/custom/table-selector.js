let selectedList = [];
let submit = false;
let selected = false;
let selectType = false;
let list = false;

document.addEventListener("DOMContentLoaded", () => {
  list = document.querySelectorAll("tbody>tr>th>div>input");
});

function chnageAll(e) {
  list.forEach((element) => {
    if (e.target.checked) {
      if (!selectedList.includes(element.value)) {
        selectedList.push(element.value);
      }
    } else {
      selectedList = [];
    }

    element.checked = e.target.checked;
  });

  if (selectedList.length > 0) {
    document.querySelector('input[name="selected"]').value =
      JSON.stringify(selectedList);
  } else {
    document.querySelector('input[name="selected"]').value = false;
  }

  activated();
}

function selectOne(e) {
  if (e.target.checked && !selectedList.includes(e.target.value)) {
    selectedList.push(e.target.value);
    e.target.setAttribute("checked", true);
  } else if (!e.target.checked && selectedList.includes(e.target.value)) {
    var index = selectedList.indexOf(e.target.value);

    if (index !== -1) {
      selectedList.splice(index, 1); // Remove one element at the found index
      e.target.removeAttribute("checked");
    }
  }

  if (selectedList.length > 0) {
    document.querySelector('input[name="selected"]').value =
      JSON.stringify(selectedList);
  } else {
    document.querySelector('input[name="selected"]').value = false;
  }
  activated();
}

function switchType(e, type) {
  e.target.name = "switch";
  let scpoes = document.querySelectorAll('input[name="scope"]');
  scpoes[0].value = type;
  selected = true;
  if (selectType !== false) {
    if (selectType != type) {
      document
        .querySelector("#submit-" + selectType)
        .setAttribute("disabled", true);
    }
  }

  selectType = type;
  activated();
}

function activated() {
  if (selectedList.length > 1 && selected === true) {
    document.querySelector("#submit-" + selectType).removeAttribute("disabled");
  } else if (selected === true) {
    document
      .querySelector("#submit-" + selectType)
      .setAttribute("disabled", true);
  }
}
