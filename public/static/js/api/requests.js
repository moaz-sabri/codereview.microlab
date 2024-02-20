// Get the value of 'token' and display it
const token = getCookie("token");

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

/****************************************
 *            Part Start                *
 *            Mailbox               *
 ****************************************/
function updateMailStatus(id) {
  fetch(endpoint + "api/mailbox/" + id, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
  })
    .then((response) => response.json())
    .then((data) => {
      if (data.resource) {
        window.location.href = data.resource;
      } else {
        // TODO update mail status
      }
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}

function submitContact() {
  const form = document.getElementById("submitContact");

  if (form.checkValidity() === false) {
    form.classList.add("was-validated");
    return;
  }

  const formData = new FormData(form);

  fetch(endpoint + "api/mailbox/create", {
    method: "POST",
    body: formData,
  })
    .then((response) => response.json())
    .then((data) => {
      console.log(data);
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}

function submitContactForm(e) {
  subjoud(e)
    .then((data) => {
      console.log(data);
      alert("thinks for Conects!");
      window.location.reload();
    })
    .catch((error) => {
      console.log(error);
      console.error("Error:", error);
      submitError(error);
    });
}

/****************************************
 *            Part Start                *
 *           Notification               *
 ****************************************/
function updateNotificationStatus(id) {
  fetch(endpoint + "api/notification/update/" + id, {
    method: "POST",
    headers: {
      Authorization: token,
      "Content-Type": "application/json",
    },
  })
    .then((response) => response.json())
    .then((data) => {
      console.log(data);
      if (data.resource) {
        window.location.href = data.resource;
      } else {
        let number = document.getElementById("numberOfNotifications");
        number.innerText = Number(number.innerText) - 1;
        if (number.innerText == 0) {
          number.style.display = "none";
        }
      }
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}

// Policy Alert
function allowCookies() {
  let cookieConsent = document.getElementById("cookie-consent");
  fetch(endpoint + "api/savepolicydata", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
  })
    .then((response) => {
      if (response.status == 200) {
        localStorage.setItem("cookieConsent", "true");
        cookieConsent.style.display = "none";
      }
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}

function cancelCookies() {
  let cookieConsent = document.getElementById("cookie-consent");
  localStorage.setItem("cookieConsent", "false");
  cookieConsent.style.display = "none";
}

function runPolicyAlert() {
  const cookieConsent = document.getElementById("cookie-consent");

  // Check if user has previously accepted cookies
  if (!localStorage.getItem("cookieConsent")) {
    cookieConsent.style.display = "block";
  }
}

/****************************************
 *               Login                  *
 ****************************************/
function submitToLogin(e) {
  subjoud(e, token)
    .then((data) => {
      localStorage.getItem("key", data);
      window.location.href = "/profile";
    })
    .catch((error) => {
      console.error("Error:", error);
      submitError(error);
    });
}

function submitToForgotPassword(event) {
  event.preventDefault();
  subjoud(event)
    .then((data) => {
      if (data.status === 200) {
        alert(
          "Password Reset Request: An email with instructions to reset your password has been sent to your registered email address. Please check your inbox and follow the provided link to reset your password. If you don't receive the email, please check your spam folder."
        );

        console.log(data);
        // window.location.href = "/reset/password/" + data.message;
      } else {
        alert("try again!");
      }
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}

function submitToResetPassword(event) {
  subjoud(event)
    .then((data) => {
      if (data.status === 200) {
        alert(
          "Password Reset Request: An email with instructions to reset your password has been sent to your registered email address. Please check your inbox and follow the provided link to reset your password. If you don't receive the email, please check your spam folder."
        );

        window.location.href = "/login";
      } else {
        alert("try again!");
      }
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}

/****************************************
 *               Order                  *
 ****************************************/
function submitCreateOrder(event) {
  subjoud(event)
    .then((data) => {
      console.log(data);
      event.srcElement.reset();
    })
    .catch((error) => {
      console.error("Error:", error);
    });

  alert("Sorry this option is not ready yat!");
}

/****************************************
 *               Project                  *
 ****************************************/
function submitProject(e) {
  saveContent();

  subjoud(e, token)
    .then((data) => {
      console.log(data);
      window.location.href = "javascript:history.go(-1)";
    })
    .catch((error) => {
      console.log(error);
      console.error("Error:", error);
      submitError(error);
    });
}

function submitTypeProject(e) {
  subjoud(e, token)
    .then((data) => {
      console.log(data);
      // window.location.href = "javascript:history.go(-1)";
    })
    .catch((error) => {
      console.log(error);
      console.error("Error:", error);
      submitError(error);
    });
}
