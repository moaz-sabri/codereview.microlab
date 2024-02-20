class ElementHandler {
  getParent(e) {
    // Get the position of the shadow DOM relative to its parent
    const parent = e.parentNode;

    // Find the index of this custom element within its parent's children
    const index = Array.from(parent.children).indexOf(e);

    // If the index is valid and there is another element to switch with
    if (index == undefined) return false;

    return parent.children[index]; // Get the current element
  }

  setElement(div, currentElement) {
    // Switch the positions of the elements
    currentElement.parentNode.insertBefore(div, currentElement); // Insert current element before previous element
    currentElement.remove();
  }

  showHidePassword(event) {
    event.preventDefault();

    const parent = event.target.parentNode;

    let inputField = parent.querySelector("input");
    let eyeIcon = parent.querySelector("i");

    if (inputField.type === "text") {
      inputField.type = "password";
      eyeIcon.classList.add("bi-eye-slash");
      eyeIcon.classList.remove("bi-eye");
    } else if (inputField.type === "password") {
      inputField.type = "text";
      eyeIcon.classList.remove("bi-eye-slash");
      eyeIcon.classList.add("bi-eye");
    }
  }
}

export default ElementHandler;
