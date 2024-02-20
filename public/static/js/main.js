import Requests from "./api/requests.js";

const requests = new Requests();

class Main {
  constructor() {
    this.popupModel;
    this.popup;
    this.popupFunction;
    this.selectedList = [];
    this.getInputsCheck = false;

    document.addEventListener("DOMContentLoaded", () => {
      this.getInputsCheck = document.querySelectorAll("tbody>tr>th>div>input");
    });
  }

  openPopup(model) {
    if (model.length < 5)
      return alert("the Attribute of (el-function) is not exist!");

    this.popupModel = new bootstrap.Modal("#" + model, {
      keyboard: false,
    });
    this.popup = document.getElementById(model);

    this.popupFunction = this.popup.querySelector("#" + model + "Action");
    this.popupLoading = this.popup.querySelector("#" + model + "Loading");

    this.popupModel.show(this.popup);
  }
  inprocessPopup() {
    this.popupLoading.classList.remove("d-none");
    this.popupFunction.classList.add("d-none");
  }
  closePopup() {
    setTimeout(() => {
      this.popupLoading.classList.add("d-none");
      this.popupFunction.classList.remove("d-none");
      this.popupModel.hide(this.popup);
    }, 500);
  }
  toastPopup(message = "Complated Good Job!") {
    let toast = document.getElementById("successToast");
    let toastMessage = document.getElementById("successToastMessage");
    toast.classList.add("show");
    toastMessage.innerText = message;
    setTimeout(() => {
      toast.classList.remove("show");
      toastMessage.innerText = "";
    }, 5000);
  }

  defaultDeleteSubmitRequest(url, model) {
    if (url.length < 3) return alert("the Url of action is not exist!");

    this.openPopup(model);

    this.popupFunction.onclick = () => {
      this.inprocessPopup();

      requests
        .deleteRequest(url)
        .then((data) => {
          if (data.callback) {
            window.location.href = data.callback;
          } else {
            window.location.reload();
          }
          this.closePopup();
          this.toastPopup();
        })
        .catch((error) => {
          this.closePopup();
          console.error(error);
        });
    };
  }

  chnageAll(e) {
    this.getInputsCheck.forEach((element) => {
      if (e.target.checked) {
        if (!this.selectedList.includes(element.value)) {
          this.selectedList.push(element.value);
        }
      } else {
        this.selectedList = [];
      }

      element.checked = e.target.checked;
    });

    this.updateActionList();
  }
  selectOne(e) {
    if (e.target.checked && !this.selectedList.includes(e.target.value)) {
      this.selectedList.push(e.target.value);
      e.target.setAttribute("checked", true);
    } else if (
      !e.target.checked &&
      this.selectedList.includes(e.target.value)
    ) {
      var index = this.selectedList.indexOf(e.target.value);

      if (index !== -1) {
        this.selectedList.splice(index, 1); // Remove one element at the found index
        e.target.removeAttribute("checked");
      }
    }

    this.updateActionList();
  }
  updateActionList() {
    let action = document.getElementById("deleteList");
    if (this.selectedList.length > 1) {
      action.classList.remove("disabled");
      action.onclick = () =>
        this.defaultDeleteSubmitRequest(
          action.getAttribute("aria-current") + this.selectedList,
          "defaultConfirm"
        );
    } else {
      action.classList.add("disabled");
    }
  }
}

export default Main;
