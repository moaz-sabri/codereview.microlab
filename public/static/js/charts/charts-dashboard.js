"use strict";

const tooltips = {
  titleMarginBottom: 10,
  bodySpacing: 10,
  xPadding: 16,
  yPadding: 16,
  borderColor: window.chartColors.border,
  borderWidth: 1,
  backgroundColor: "#fff",
  bodyFontColor: window.chartColors.text,
  titleFontColor: window.chartColors.text,

  /* Display % in tooltip - https://stackoverflow.com/questions/37257034/chart-js-2-0-doughnut-tooltip-percentages */
  callbacks: {
    label: function (tooltipItem, data) {
      //get the concerned dataset
      var dataset = data.datasets[tooltipItem.datasetIndex];
      //calculate the total of this data set
      var total = dataset.data.reduce(function (
        previousValue,
        currentValue,
        currentIndex,
        array
      ) {
        return previousValue + currentValue;
      });
      //get the current items value
      var currentValue = dataset.data[tooltipItem.index];
      //calculate the precentage based on the total and current item, also this does a rough rounding to give a whole number
      var percentage = Math.floor((currentValue / total) * 100 + 0.5);

      return percentage + "%";
    },
  },
};

const options = {
  responsive: true,

  plugins: {
    legend: {
      display: true,
      position: "left",
      textAlign: "center",
    },
  },

  tooltips: tooltips,
};

// Access the cookie in JavaScript
function getCookie(name) {
  const cookies = document.cookie.split(";");
  for (let i = 0; i < cookies.length; i++) {
    const cookie = cookies[i].trim();
    if (cookie.startsWith(name + "=")) {
      return cookie.substring(name.length + 1);
    }
  }
  return null;
}

/* Chart.js docs: https://www.chartjs.org/ */

function generateRandomColor() {
  // Define a list of color components (excluding black and white)
  const colorComponents = ["00", "33", "66", "99", "CC", "FF"];

  // Function to get a random index from the colorComponents array
  const getRandomIndex = () =>
    Math.floor(Math.random() * colorComponents.length);

  // Generate random RGB values
  const red = colorComponents[getRandomIndex()];
  const green = colorComponents[getRandomIndex()];
  const blue = colorComponents[getRandomIndex()];

  // Combine RGB values to form a color
  const color = `#${red}${green}${blue}`;

  return color;
}

fetch("/api/dashboard/get", {
  method: "GET",
  headers: {
    Authorization: getCookie("token"),
    "Content-Type": "application/json",
  },
})
  .then((response) => response.json())
  .then((data) => {
    let obj = JSON.parse(data.message);
    last30Days(obj.last30DaysVisitorCount, obj.averageLoadingTime);
    popularBrowsers(obj.popularBrowsers);
    popularDevice(obj.popularDevice);
    operatingSystemsDesktop(obj.popularOperatingSystems);
    operatingSystemsMobile(obj.popularOperatingSystems);
    trafficTypeDistribution(obj.trafficTypeDistribution);
    contentCount(obj.contentCount);
    counters(obj);
    console.log(JSON.parse(data.message));
  })
  .catch((error) => {
    console.error("Error:", error);
  });

function counters(data) {
  let clone = document.getElementById("clone-card");
  clone.children[1].innerHTML = data.membersCount[0].members;

  let container = document.getElementById("counter");
  for (let index = 0; index < Object.keys(data.ordersCount).length; index++) {
    let div = clone.cloneNode(true);
    const element = data.ordersCount[index];
    div.children[0].innerHTML = element.type;
    div.children[1].innerHTML = element.count;

    container.appendChild(div);
  }
}

//Area line Chart Demo
function last30Days(visitors, loaded) {
  let setcolors = [];
  let setdata = [];
  let setloaddata = [];
  let setlabels = [];

  for (let index = 0; index < Object.keys(visitors).length; index++) {
    const element = visitors[index];
    setcolors.push(generateRandomColor());
    setdata.push(element.daily_visitors);
    setlabels.push(element.visit_date);

    const load = loaded[index];
    setloaddata.push((load.avg_page_load_time / 60).toFixed(2));
  }

  var lineChartConfig = {
    type: "line",

    data: {
      labels: setlabels,

      datasets: [
        {
          label: "Visitors",
          backgroundColor: "rgba(117,193,129,0.2)",
          borderColor: "rgba(117,193,129, 0.8)",
          data: setdata,
        },
        {
          label: "Loaded",
          backgroundColor: "rgba(30,50,43,0.2)",
          borderColor: "rgba(30,50,43, 0.8)",
          data: setloaddata,
        },
      ],
    },

    options: {
      responsive: true,
      plugins: {
        legend: {
          display: true,
          position: "top",
          align: "center",
        },
      },

      tooltips: {
        mode: "index",
        intersect: false,
        titleMarginBottom: 10,
        bodySpacing: 10,
        xPadding: 16,
        yPadding: 16,
        borderColor: window.chartColors.border,
        borderWidth: 1,
        backgroundColor: "#fff",
        bodyFontColor: window.chartColors.text,
        titleFontColor: window.chartColors.text,
        callbacks: {
          label: (tooltipItem, data) => {
            return tooltipItem.value;
          },
        },
      },
      hover: {
        mode: "nearest",
        intersect: true,
      },
      scales: {
        // xAxes: [
        //   {
        //     display: true,
        //     gridLines: {
        //       drawBorder: false,
        //       color: window.chartColors.border,
        //     },
        //     scaleLabel: {
        //       display: false,
        //     },
        //   },
        // ],
        // yAxes: [
        //   {
        //     display: true,
        //     gridLines: {
        //       drawBorder: false,
        //       color: window.chartColors.border,
        //     },
        //     scaleLabel: {
        //       display: false,
        //     },
        //     ticks: {
        //       beginAtZero: true,
        //       userCallback: (value, index, values) => {
        //         return value.toLocaleString();
        //       },
        //     },
        //   },
        // ],
      },
    },
  };
  var lineChart = document.getElementById("chart-last30Days").getContext("2d");
  window.myLine = new Chart(lineChart, lineChartConfig);
}

// Pie Chart Demo
function popularBrowsers(obj) {
  let setcolors = [];
  let setdata = [];
  let setlabels = [];

  for (let index = 0; index < Object.keys(obj).length; index++) {
    const element = obj[index];
    setcolors.push(generateRandomColor());
    setdata.push(element.browser_count);
    setlabels.push(element.browser + " " + element.browser_count);
  }

  let pieChartConfig = {
    type: "pie",
    data: {
      datasets: [
        {
          data: setdata,
          backgroundColor: setcolors,
          label: "Dataset 1",
        },
      ],
      labels: setlabels,
    },
    options: options,
  };

  let pieChart = document.getElementById("chart-browser").getContext("2d");
  window.myPie = new Chart(pieChart, pieChartConfig);
}

function popularDevice(obj) {
  let setcolors = [];
  let setdata = [];
  let setlabels = [];

  for (let index = 0; index < Object.keys(obj).length; index++) {
    const element = obj[index];
    setcolors.push(generateRandomColor());
    setdata.push(element.device_count);
    setlabels.push(element.device + " " + element.device_count);
  }

  let pieChartConfig = {
    type: "pie",
    data: {
      datasets: [
        {
          data: setdata,
          backgroundColor: setcolors,
          label: "Dataset 1",
        },
      ],
      labels: setlabels,
    },
    options: options,
  };

  let pieChart = document.getElementById("chart-device").getContext("2d");
  window.myPie = new Chart(pieChart, pieChartConfig);
}

function operatingSystemsDesktop(obj) {
  let setcolors = [];
  let setdata = [];
  let setlabels = [];

  for (let index = 0; index < Object.keys(obj).length; index++) {
    const element = obj[index];
    if (["android", "iOS"].includes(element.os)) continue;
    setcolors.push(generateRandomColor());
    setdata.push(element.os_count);
    setlabels.push(element.os + " " + element.os_count);
  }

  let pieChartConfig = {
    type: "pie",
    data: {
      datasets: [
        {
          data: setdata,
          backgroundColor: setcolors,
          label: "Dataset 1",
        },
      ],
      labels: setlabels,
    },
    options: options,
  };

  let pieChart = document
    .getElementById("chart-operatingSystemsDesktop")
    .getContext("2d");
  window.myPie = new Chart(pieChart, pieChartConfig);
}
function operatingSystemsMobile(obj) {
  let setcolors = [];
  let setdata = [];
  let setlabels = [];

  for (let index = 0; index < Object.keys(obj).length; index++) {
    const element = obj[index];
    if (!["android", "iOS"].includes(element.os)) continue;
    setcolors.push(generateRandomColor());
    setdata.push(element.os_count);
    setlabels.push(element.os + " " + element.os_count);
  }

  let pieChartConfig = {
    type: "pie",
    data: {
      datasets: [
        {
          data: setdata,
          backgroundColor: setcolors,
          label: "Dataset 1",
        },
      ],
      labels: setlabels,
    },
    options: options,
  };

  let pieChart = document
    .getElementById("chart-operatingSystemsMobile")
    .getContext("2d");
  window.myPie = new Chart(pieChart, pieChartConfig);
}

function trafficTypeDistribution(obj) {
  let setcolors = [];
  let setdata = [];
  let setlabels = [];

  for (let index = 0; index < Object.keys(obj).length; index++) {
    const element = obj[index];
    setcolors.push(generateRandomColor());
    setdata.push(element.traffic_count);
    setlabels.push(element.type + " " + element.traffic_count);
  }

  let pieChartConfig = {
    type: "pie",
    data: {
      datasets: [
        {
          data: setdata,
          backgroundColor: setcolors,
          label: "Dataset 1",
        },
      ],
      labels: setlabels,
    },
    options: options,
  };

  let pieChart = document
    .getElementById("chart-trafficTypeDistribution")
    .getContext("2d");
  window.myPie = new Chart(pieChart, pieChartConfig);
}

function contentCount(obj) {
  let setcolors = [];
  let setdata = [];
  let setlabels = [];

  for (let index = 0; index < Object.keys(obj).length; index++) {
    const element = obj[index];
    setcolors.push(generateRandomColor());
    setdata.push(element.count);
    setlabels.push(element.type + " " + element.count);
  }

  let pieChartConfig = {
    type: "pie",
    data: {
      datasets: [
        {
          data: setdata,
          backgroundColor: setcolors,
          label: "Dataset 1",
        },
      ],
      labels: setlabels,
    },
    options: options,
  };

  let pieChart = document.getElementById("chart-contentCount").getContext("2d");
  window.myPie = new Chart(pieChart, pieChartConfig);
}
