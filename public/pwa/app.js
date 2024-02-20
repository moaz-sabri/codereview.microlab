// this before run the app
function App() {
  console.log("APP");
}

// this after installi the app
App.prototype.start = function () {
  console.log("start");
};
