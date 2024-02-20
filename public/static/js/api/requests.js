class Requests {
  constructor() {
    // Get the value of 'token' and display it
    this.token = this.getCookie("WEx4UpU6AOzw8z");

    this.thisForm,
      this.loadingSubmitButton,
      this.errorMessage,
      this.loadingSpiner,
      this.loading;

    this.headers = {
      // "Content-Type": "application/json",
    };
  }

  // Access the cookie in JavaScript
  getCookie(name) {
    const cookies = document.cookie.split(";");
    for (let i = 0; i < cookies.length; i++) {
      const cookie = cookies[i].trim();
      if (cookie.startsWith(name + "=")) {
        return cookie.substring(name.length + 1);
      }
    }
    return null;
  }

  subjoud(event, owner = undefined) {
    return new Promise((resolve, reject) => {
      event.preventDefault();

      const form = event.target;
      form.classList.add("was-validated");

      this.thisForm = event.srcElement;

      this.submitProcess();

      if (!form.checkValidity()) {
        event.stopPropagation();
        reject("the form is not complated!");
        return;
      }

      if (owner != undefined) {
        this.headers["Authorization"] = this.token;
      }

      let action = this.thisForm.getAttribute("action");
      let method = this.thisForm.getAttribute("method");

      if (!action) {
        reject("The form action property is not set!");
      }

      let formData = new FormData(this.thisForm);

      // TODO PUT Hendler
      // // Convert form data to JSON
      // var jsonData = {};
      // formData.forEach(function (value, key) {
      //   // jsonData[key] = value;
      // });
      // body: JSON.stringify(jsonData),
      // headers: {
      // "Content-Type": "application/json",
      // },

      fetch(action, {
        method: method,
        headers: this.headers,
        body: formData,
      })
        .then((response) => {
          if (response.ok && response.status == 200) {
            return response.json();
          } else {
            reject(`${response.status} ${response.statusText} ${response.url}`);
          }
        })
        .then((data) => {
          resolve(data);
        })
        .catch((error) => {
          reject(error.message);
        });
    });
  }

  getRequest(action, data = undefined) {
    return new Promise((resolve, reject) => {
      if (!action) {
        reject("The form action property is not set!");
      }

      if (data) {
        action = action + "?data=" + btoa(data);
      }

      fetch(action, {
        method: "GET",
        headers: this.headers,
      })
        .then((response) => {
          if (response.ok && response.status == 200) {
            return response.json();
          } else {
            reject(`${response.status} ${response.statusText} ${response.url}`);
          }
        })
        .then((data) => {
          resolve(data);
        })
        .catch((error) => {
          reject(error);
        });
    });
  }

  putRequest(action, data = undefined) {
    return new Promise((resolve, reject) => {
      if (!action) {
        reject("The form action property is not set!");
      }

      if (data) {
        action = action + "?data=" + btoa(data);
      }

      fetch(action, {
        method: "PUT",
        headers: this.headers,
      })
        .then((response) => {
          if (response.ok && response.status == 200) {
            return response.json();
          } else {
            reject(`${response.status} ${response.statusText} ${response.url}`);
          }
        })
        .then((data) => {
          resolve(data);
        })
        .catch((error) => {
          reject(error);
        });
    });
  }

  deleteRequest(action, owner = undefined) {
    return new Promise((resolve, reject) => {
      if (!action) {
        reject("The form action property is not set!");
      }

      if (owner != undefined) {
        this.headers["Authorization"] = owner;
      }

      fetch(action, {
        method: "DELETE",
        headers: this.headers,
      })
        .then((response) => {
          if (response.ok && response.status == 200) {
            return response.json();
          } else {
            reject(`${response.status} ${response.statusText} ${response.url}`);
          }
        })
        .then((data) => {
          resolve(data);

          // if (data.status === 200) {
          //   resolve(data);
          // } else {
          //   reject(data.message);
          // }
        })
        .catch((error) => {
          reject(error);
        });
    });
  }

  submitProcess() {
    if (!this.thisForm) return;
    this.loadingSubmitButton = this.thisForm.querySelector(
      'button[type="submit"]'
    );
    this.errorMessage = this.thisForm.querySelector(".error-message");
    this.loadingSpiner = this.thisForm.querySelector(".loading");

    this.loadingSpiner.classList.add("d-block");
    this.errorMessage.classList.remove("d-block");
    this.errorMessage.innerHTML = "";
    this.loadingSubmitButton.classList.add("d-none");
  }

  submitError(error) {
    if (!this.thisForm) return;
    this.loadingSpiner.classList.remove("d-block");
    this.errorMessage.classList.add("d-block");
    this.errorMessage.innerHTML = error;
    this.loadingSubmitButton.classList.remove("d-none");
  }

  submitSucsses(message) {
    if (!this.thisForm) return;
    this.loadingSpiner.classList.remove("d-block");
    this.errorMessage.classList.remove("d-block");
    this.errorMessage.innerHTML = "";
    this.loadingSubmitButton.classList.remove("d-none");
    this.thisForm.reset();
    this.thisForm.classList.remove("was-validated");
  }

  defaultPostSubmitRequest(e) {
    this.subjoud(e, true)
      .then((data) => {
        this.submitSucsses();
        if (data.callback) {
          window.location.href = data.callback;
        } else {
          window.location.reload();
        }
      })
      .catch((error) => {
        console.error(error);
        this.submitError(error);
      });
  }
}

export default Requests;
