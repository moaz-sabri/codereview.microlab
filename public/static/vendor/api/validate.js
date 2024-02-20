let thisForm = undefined;

function subjoud(event, owner = undefined) {
  event.preventDefault();

  return new Promise((resolve, reject) => {
    thisForm = event.srcElement;

    let action = thisForm.getAttribute("action");

    if (!action) {
      reject("The form action property is not set!");
    }

    thisForm.querySelector(".loading").classList.add("d-block");

    let formData = new FormData(thisForm);

    let headers = {
      "X-Requested-With": "XMLHttpRequest",
    };

    if (owner != undefined) {
      headers["Authorization"] = owner;
    }

    fetch(action, {
      method: "POST",
      body: formData,
      headers: headers,
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        } else {
          reject(`${response.status} ${response.statusText} ${response.url}`);
        }
      })
      .then((data) => {
        thisForm.querySelector(".loading").classList.remove("d-block");
        if (data.status === 200) {
          resolve(data);
        } else {
          reject(data.message);
        }
      })
      .catch((error) => {
        reject(error);
      });
  });
}

function submitError(error) {
  if (thisForm) {
    thisForm.querySelector(".error-message").classList.add("d-block");
    thisForm.querySelector(".error-message").innerHTML = error;
    setTimeout(() => {
      thisForm.querySelector(".error-message").classList.add("d-none");
      thisForm.querySelector(".error-message").innerHTML = "";
    }, 3000);
  }
}
