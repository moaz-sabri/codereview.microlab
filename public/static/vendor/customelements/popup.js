import ElementHandler from "./handler.js";

const elementHandler = new ElementHandler();

// JavaScript (Custom Element) Submit With Loading Progress
class PopupQuestion extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    const id = this.getAttribute("el-id") || "defaultConfirm";
    const title = this.getAttribute("el-title") || "NON Title";
    const description = this.getAttribute("el-description") || "";
    const yas = this.getAttribute("el-yas") || "Yas";
    const no = this.getAttribute("el-no") || "No";

    const currentElement = elementHandler.getParent(this);

    // Create a div element in the shadow DOM
    const div = document.createElement("div");
    div.setAttribute("id", id);
    div.setAttribute("tabindex", "-1");
    div.setAttribute("aria-hidden", "true");
    div.setAttribute("data-bs-backdrop", "static");
    div.setAttribute("aria-labelledby", `${id}Label`);
    div.setAttribute("class", "modal fade modal-sheet");

    div.innerHTML = `
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-3 shadow">
            <div class="modal-body p-4 text-center">
                <h5 class="mb-0">${title}</h5>
                <p class="mb-0">${description}</p>
            </div>
            <div class="modal-footer flex-nowrap p-0">
                <button type="button" id="${id}Action" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 py-3 m-0 rounded-0 border-end"><strong>${yas}</strong></button>

                <button class="btn btn-lg btn-link fs-6 text-decoration-none col-6 py-3 m-0 rounded-0 border-en d-none" id="${id}Loading" type="button" disabled>
                  <span class="spinner-grow spinner-grow-sm" aria-hidden="true"></span>
                  <span class="visually-hidden" role="status">${yas}</span>
                </button>

                <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 py-3 m-0 rounded-0" data-bs-dismiss="modal">${no}</button>
            </div>
        </div>
    </div>

      `;

    elementHandler.setElement(div, currentElement);
  }
}

// JavaScript (Custom Element) Submit With Loading Progress
class PolicyAlert extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    const id = this.getAttribute("el-id") || "policyAlert";
    const currentElement = elementHandler.getParent(this);

    // Create a div element in the shadow DOM
    const div = document.createElement("div");
    div.setAttribute("id", id);
    div.setAttribute("tabindex", "-1");
    div.setAttribute("role", `dialog`);
    div.setAttribute(
      "class",
      "modal modal-sheet position-fixed d-block bg-body-secondary p-4 py-md-5"
    );

    div.innerHTML = `
    <div class="modal-dialog" role="document">
      <div class="modal-content rounded-4 shadow">
        <div class="modal-header border-bottom-0">
          <h1 class="modal-title fs-5">Policy</h1>
        </div>
        <div class="modal-body py-0">
          <p>This is a modal sheet, a variation of the modal that docs itself to the bottom of the viewport like the newer share sheets in iOS.</p>
        </div>
        <div class="modal-footer flex-column align-items-stretch w-100 gap-2 pb-3 border-top-0">
        <button id="allowCookiesButton" class="btn btn-sm btn-primary mx-1">Allow cookies</button>
        <button id="cancelCookiesButton" class="btn btn-sm btn-secondary">cancel</button>
        </div>
      </div>
    </div>
      `;

    elementHandler.setElement(div, currentElement);

    div.querySelector("#allowCookiesButton").onclick = () =>
      this.allowCookies(div);
    div.querySelector("#cancelCookiesButton").onclick = () =>
      this.cancelCookies(div);
  }

  allowCookies(div) {
    fetch("/api/policy_allowed", {
      method: "PUT",
      headers: {
        "X-Requested-With": "XMLHttpRequest",
      },
    })
      .then((response) => {
        if (response.ok && response.status == 200) {
          return response.json();
        } else {
          reject(`${response.status} ${response.statusText} ${response.url}`);
        }
      })
      .then((data) => {
        div.classList.remove("d-block");
      })
      .catch((error) => {
        reject(error);
      });
  }

  // Policy Alert
  cancelCookies(div) {
    div.classList.remove("d-block");
  }
}

customElements.define("popup-question", PopupQuestion);
customElements.define("policy-alert", PolicyAlert);
