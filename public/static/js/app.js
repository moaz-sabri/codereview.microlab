const alertList = document.querySelectorAll(".alert");
const alerts = [...alertList].map((element) => new bootstrap.Alert(element));

// // Iterate through each element and attach a mouseenter event listener
// function autoOpen(e) {
//   // console.log(e)
//   // Find the closest ancestor with class 'card'
//   var card = closestByClass(e, "accordion-item");
//   console.log(card);

//   // Find the '.collapse' element within the 'card' and show it
//   if (card) {
//     var collapseElement = card.querySelector(".collapse");
//     if (collapseElement) {
//       collapseElement.classList.add("show");
//     }
//   }
// }
// // Iterate through each element and attach a mouseenter event listener
// function autoClose(e) {
//   // console.log(e)
//   // Find the closest ancestor with class 'card'
//   var card = closestByClass(e, "accordion-item");
//   console.log(card);

//   // Find the '.collapse' element within the 'card' and show it
//   if (card) {
//     var collapseElement = card.querySelector(".collapse");
//     if (collapseElement) {
//       collapseElement.classList.remove("show");
//     }
//   }
// }

// Helper function to find the closest ancestor with a specific class
function closestByClass(element, className) {
  while (element && !element.classList.contains(className)) {
    element = element.parentElement;
  }
  return element;
}

/****************************************
 *            Part Start                *
 *            dropactions               *
 ****************************************/
function selectId(id, route, name) {
  document.getElementById(id + "-subbutton").href = route;
  document.getElementById(id + "-subbutton").innerText = name;
}

function copyText(id, copyText, name) {
  document.getElementById(id + "-subbutton").href = "javascript: void(0)";
  document.getElementById(id + "-subbutton").innerText = name;
}

/****************************************
 *            Part Start                *
 *             Messages                 *
 ****************************************/
function setSourceId(id) {
  const source = document.getElementById("source");
  source.value = id;

  const display = document.getElementById("display");
  display.innerText = id;
}

/****************************************
 *            Part Start                *
 *              PopUp                   *
 ****************************************/

// Function to check if the div is loaded and exists
function isAlertPopupLoaded() {
  // Check if the div with the id "alertPopup" exists
  var divElement = document.getElementById("alertPopup");

  // Return true if the div exists, otherwise return false
  return divElement !== null && divElement !== undefined;
}

// Your function to be executed when the div is loaded
function runPopup() {
  // Your code here
  setTimeout(() => {
    const alertPopup = document.getElementById("alertPopup");
    const toastAlert = bootstrap.Toast.getOrCreateInstance(alertPopup);
    toastAlert.hide();
  }, 5000);
}

/****************************************
 *            Main Load                 *
 *              PopUp                   *
 ****************************************/

// Function to check if the div is loaded and exists
function isExist(id) {
  // Check if the div with the id exists
  var divElement = document.getElementById(id);

  // Return true if the div exists, otherwise return false
  return divElement !== null && divElement !== undefined;
}

// Calculate page load time using various metrics

window.onload = () => {
  if (isAlertPopupLoaded()) {
    runPopup();
  }

  runPolicyAlert();
  init();
};
