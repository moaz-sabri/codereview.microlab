(() => {
  "use strict";
})();

/* ===== Responsive Sidepanel ====== */
const sidePanel = document.getElementById("app-sidepanel");
const appWrapper = document.getElementsByClassName("app-wrapper");
const appHeaderContent = document.getElementsByClassName("app-header-content");

window.addEventListener("load", function () {
  responsiveSidePanel();
});

window.addEventListener("resize", function () {
  responsiveSidePanel();
});

function responsiveSidePanel() {
  let w = window.innerWidth;
  if (w >= 1200) {
    // if larger
    sideHidden();
  } else {
    // if smaller
    sideVisible();
  }
}

function sideToggler() {
  if (sidePanel.classList.contains("sidepanel-visible")) {
    sideVisible();
  } else {
    sideHidden();
  }
}

function sideVisible() {
  sidePanel.classList.remove("sidepanel-visible");
  sidePanel.classList.add("sidepanel-hidden");
  appWrapper[0].style.marginLeft = 0;
  appHeaderContent[0].style.marginLeft = "3rem";
}

function sideHidden() {
  sidePanel.classList.remove("sidepanel-hidden");
  sidePanel.classList.add("sidepanel-visible");
  appWrapper[0].style.marginLeft = "250px";
  appHeaderContent[0].style.marginLeft = "19rem";
}

/* ====== Mobile search ======= */
const searchMobileTrigger = document.querySelector(".search-mobile-trigger");
const searchBox = document.querySelector(".app-search-box");

searchMobileTrigger.addEventListener("click", () => {
  searchBox.classList.toggle("is-visible");

  let searchMobileTriggerIcon = document.querySelector(
    ".search-mobile-trigger-icon"
  );

  if (searchMobileTriggerIcon.classList.contains("fa-magnifying-glass")) {
    searchMobileTriggerIcon.classList.remove("fa-magnifying-glass");
    searchMobileTriggerIcon.classList.add("fa-xmark");
  } else {
    searchMobileTriggerIcon.classList.remove("fa-xmark");
    searchMobileTriggerIcon.classList.add("fa-magnifying-glass");
  }
});
