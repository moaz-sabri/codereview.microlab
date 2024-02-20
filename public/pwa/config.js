// increase the version when uploading to create a new service worker cache name
const serviceWorkerCacheVersion = 1;

/*
define the environment where the app is running
local -> the app is running locally
server -> the app is running on the server
*/

const environment = "local";
let appURL = "";
let endpoint = "";

if (environment == "local") {
  appURL = "http://localhost:8090/";
  endpoint = "http://localhost:8090/";
} else if (environment == "server") {
  appURL = "https://joudev.com/";
  endpoint = "https://joudev.com/";

  // Overwrite console.log with an empty function
  // Overwrite console.error with an empty function
  console.log = function () {};
  console.error = function () {};
  console.warn = function () {};
  console.info = function () {};
}

let deviceType = "Desktop";
const userAgent = navigator.userAgent.toLowerCase();

if (userAgent.includes("mobile")) {
  deviceType = "Mobile Device";
} else if (userAgent.includes("tablet")) {
  deviceType = "Tablet";
}
