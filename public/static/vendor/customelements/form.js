import ElementHandler from "./handler.js";
import InputRules from "../../js/api/validate.js";
import Requests from "../../js/api/requests.js";

// Create an instance of the InputRules class
const elementHandler = new ElementHandler();
const inputRules = new InputRules();
const requests = new Requests();

// JavaScript (Custom Element) input types
class InputForm extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    const id = this.getAttribute("el-id");
    const type = this.getAttribute("el-type") || "text";
    const value = this.getAttribute("el-value") || "";
    const lebel = this.getAttribute("el-lebel") || "";
    const clas = this.getAttribute("el-class") || "form-control rounded-3";
    const placeholder = this.getAttribute("el-placeholder");
    const required = this.getAttribute("el-required") || false;
    const validation = this.getAttribute("el-validation") || false;
    const valid = this.getAttribute("valid") || "Looks good!";
    const invalid = this.getAttribute("invalid") || "Looks Bad!";

    const currentElement = elementHandler.getParent(this);

    // Create a div element in the shadow DOM
    const div = document.createElement("div");
    div.setAttribute("class", "form-floating mb-3 position-relative");
    div.innerHTML = `
        <input type="${type}" class="${clas}" id="${id}" name="${id}" value="${value}" placeholder="${placeholder}" autocomplete="new-${id}"
        ${required ? 'required=""' : ""}
        >
        <label for="${id}">${lebel}</label>
        <div class="valid-feedback">${valid}</div>
        <div class="invalid-feedback">${invalid}</div>
        
      `;

    let elValidation = div.querySelector("input");

    if (validation) {
      elValidation[validation] = () => inputRules.inputFilters(elValidation);
    }

    if (type == "password") {
      const eye = document.createElement("i");
      eye.setAttribute("class", "pass_show bi bi-eye-slash");
      eye.setAttribute("ariahidden", true);
      eye.onclick = (e) => elementHandler.showHidePassword(e);
      div.appendChild(eye);
    }

    if (
      type == "password" &&
      (id == "new_password" || id == "confirm_password")
    ) {
      const password = document.createElement("div");
      password.setAttribute("id", "passwordStrength");
      password.setAttribute("class", "password-strength");
      password.innerHTML = `<span>Password Strength: <i id="strengthText">Low</i></span>`;
      div.appendChild(password); // Insert current element before previous element
    }

    elementHandler.setElement(div, currentElement);
  }
}

// JavaScript (Custom Element) input types
class CheckForm extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    const id = this.getAttribute("el-id");
    const type = this.getAttribute("el-type") || "checkbox";
    const list = this.getAttribute("el-list") || "list";
    const value = this.getAttribute("el-value") || "";
    const lebel = this.getAttribute("el-lebel") || "";
    const required = this.getAttribute("el-required") || false;
    const valid = this.getAttribute("valid") || "Looks good!";
    const invalid = this.getAttribute("invalid") || "Looks Bad!";

    const currentElement = elementHandler.getParent(this);

    // Create a div element in the shadow DOM
    const div = document.createElement("div");
    div.setAttribute("class", "form-check p-3");

    div.innerHTML = `
        <input type="${type}" class="form-check-input" id="${id}" name="${list}[${id}]" value="${value}" 
        ${required ? 'required=""' : ""}
        ${value ? "checked" : ""} />

        <label class="form-check-label" for="${id}">${lebel}</label>
        <div class="valid-feedback">${valid}</div>
        <div class="invalid-feedback">${invalid}</div>
      `;

    elementHandler.setElement(div, currentElement);
  }
}

// JavaScript (Custom Element) input types
class TextAreaForm extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    const id = this.getAttribute("el-id");
    const height = this.getAttribute("el-height") || "100px";
    const value = this.getAttribute("el-value") || "";
    const lebel = this.getAttribute("el-lebel") || "";
    const required = this.getAttribute("el-required") || false;
    const valid = this.getAttribute("valid") || "Looks good!";
    const invalid = this.getAttribute("invalid") || "Looks Bad!";

    const currentElement = elementHandler.getParent(this);

    // Create a div element in the shadow DOM
    const div = document.createElement("div");
    div.setAttribute("class", "form-floating");

    div.innerHTML = `
        <textarea class="form-control" name="${id}" placeholder="Leave a comment here" id="${id}" style="height: ${height}" ${
      required ? 'required=""' : ""
    }>${value ? value : ""}</textarea>
        <label  for="${id}">${lebel}</label>
        <div class="valid-feedback">${valid}</div>
        <div class="invalid-feedback">${invalid}</div>
      `;

    elementHandler.setElement(div, currentElement);
  }
}

// JavaScript (Custom Element) Submit With Loading Progress
class SubmitForm extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    const id = Math.floor(Math.random() * 999999) + 100000;
    const name = this.getAttribute("el-name") || "Submit";
    const type = this.getAttribute("el-type") || "submit";
    const clas =
      this.getAttribute("el-class") || "mb-2 btn btn-lg rounded-3 btn-primary";

    const currentElement = elementHandler.getParent(this);

    // Create a div element in the shadow DOM
    const div = document.createElement("div");
    div.setAttribute("class", "form-floating mb-3");
    div.innerHTML = `
        <div class="my-3">
          <div class="loading">Loading</div>
          <div class="error-message"></div>
        </div>    
        <button class="${clas}" id="${id}" type="${type}">${name}</button>
        `;

    elementHandler.setElement(div, currentElement);
  }
}

// inputForm.js
class CustomForm extends HTMLElement {
  constructor() {
    super();

    // Create a shadow root
    this.attachShadow({ mode: "open" });

    const enctype = this.getAttribute("el-enctype") || "application/json";
    const method = this.getAttribute("el-method") || "POST";
    const action = this.getAttribute("el-action") || false;
    const clas = this.getAttribute("el-class") || false;

    let form = document.createElement("form");
    form.setAttribute("class", "needs-validation " + clas);
    form.setAttribute("enctype", enctype);
    form.setAttribute("method", method);
    form.setAttribute("novalidate", "");
    form.setAttribute("autocomplete", "on");
    form.setAttribute("action", action);
    form.onsubmit = (event) => {
      event.preventDefault();
      let errors = "";

      Object.entries(inputRules.validated).forEach((valid) => {
        if (valid[1] !== true) {
          errors += valid[1] + "<br>";
        }
      });

      // return requests.defaultPostSubmitRequest(event);
      if (errors.length > 0) {
        let thisForm = event.srcElement;
        let errorMessage = thisForm.querySelector(".error-message");
        errorMessage.classList.add("d-block");
        errorMessage.innerHTML = errors;
      } else {
        return requests.defaultPostSubmitRequest(event);
      }
    };

    const currentElement = elementHandler.getParent(this);

    currentElement.childNodes.forEach((child) => {
      const clonedChild = child.cloneNode(true); // true indicates deep cloning
      form.appendChild(clonedChild);
    });

    elementHandler.setElement(form, currentElement);
  }
}

// Define the custom element
customElements.define("custom-form", CustomForm);
customElements.define("input-form", InputForm);
customElements.define("check-form", CheckForm);
customElements.define("textarea-form", TextAreaForm);
customElements.define("submit-form", SubmitForm);
