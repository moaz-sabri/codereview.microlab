var serviceWorkerRegistration = null;

var app = new App();

function init() {
  // service worker
  if ("serviceWorker" in navigator) {
    // register the service worker
    navigator.serviceWorker
      .register("/public/sw.js")
      .then((reg) => {
        console.log("service worker has been registered successfully");
        serviceWorkerRegistration = reg;

        window.addEventListener("beforeinstallprompt", (e) => {
          // Prevent the mini-infobar from appearing on mobile
          e.preventDefault();

          // Stash the event so it can be triggered later.
          window.deferredPrompt = e;
          console.log("Registerd event");
          // Update UI notify the user they can install the PWA
          window.localStorage.setItem("pwainstalled", "false");
          //this.showInstallPromotion();
        });
        window.addEventListener("appinstalled", (evt) => {
          // Log install to analytics
          console.log("INSTALL: Success");
          window.localStorage.setItem("pwainstalled", "true");
        });
      })
      .catch((error) => {
        console.log("failed to register service worker", error);
      });
  }

  // check whether in online or offline mode
  if (navigator.onLine) {
    console.log("online mode");
  } else {
    console.log("offline mode");
  }

  // event listener when going online
  window.addEventListener("online", (event) => {
    console.log("online event");
  });

  // event listener when going offline
  window.addEventListener("offline", (event) => {
    console.log("offline event");
  });

  // app install banner -- may not work on every platform
  window.addEventListener("beforeinstallprompt", (event) => {
    event.userChoice.then((choiceResult) => {
      console.log(choiceResult.outcome); // either "accepted" or "dismissed"
    });
  });

  app.start();
}

function installPWA() {
  if (window.deferredPrompt) {
    console.log("inside window.deferredPromp if condition");
    window.deferredPrompt.prompt();
    window.deferredPrompt.userChoice.then((choiceResult) => {
      if (choiceResult.outcome === "accepted") {
        removeButton();
        console.log("User accepted the install prompt");
      } else {
        console.log("User dismissed the install prompt");
      }
    });
  }
}
function removeButton() {
  var elem = document.getElementById("install-button");
  elem.parentNode.removeChild(elem);
}
