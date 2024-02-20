self.importScripts("/public/pwa/config.js");

// cache name for cache versioning
var cacheName = "v" + serviceWorkerCacheVersion + ":static";

// when the service is installed
self.addEventListener("install", (event) => {
  // cache all required files for offline use
  event.waitUntil(
    caches.open(cacheName).then((cache) => {
      return cache.addAll([
        "/",
        "/about",
        "/services",
        "pwa/phone-style.css",
        "static/css/main.css",
        "static/js/main.js",
        "assets/favicon/android-chrome-192x192.png",
        "assets/favicon/android-chrome-512x512.png",
      ]);
    })
  );
  console.log("sw > installed");
  // activate the new service worker version immediately
  self.skipWaiting();
});

// when a new version of the service worker is activated
addEventListener("activate", (event) => {
  // delete the old cache
  event.waitUntil(
    caches.keys().then((keyList) =>
      Promise.all(
        keyList.map((key) => {
          if (key !== cacheName) return caches.delete(key);
        })
      )
    )
  );
  console.log("sw > activated");
});

// when the browser fetches a URL
self.addEventListener("fetch", (event) => {
  // cache first caching - only go to the network if no cache match was found, other caching strategies can be used too
  event.respondWith(
    caches.match(event.request).then((response) => {
      return response || fetch(event.request);
    })
  );
});
