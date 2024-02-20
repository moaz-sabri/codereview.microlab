class ValidRules {
  constructor() {
    this.validated = [];

    this.configData = {
      firstname: {
        pattern: /^[a-z*\s]{3,33}$/,
      },
      lastname: {
        pattern: /^[a-z*\s]{3,33}$/,
      },
      username: {
        pattern:
          /^(?!_)(?!.*_$)(?!.*__)[a-z0-9]{1,3}[a-z0-9](?=[a-z0-9_]{4,31}$)/,
        required: true,
      },
      email: {
        pattern:
          /^[a-z0-9._%+-]+@(hotmail|outlook|gmail|gmx)\.(com|net|org|edu|gov|mil|info|de|at|co\.uk)$/i,
        required: true,
      },
      password: {
        required: true,
      },
      current_password: {
        strength: 8,
      },
      new_password: {
        strength: 8,
        matching: "confirm_password",
      },
      confirm_password: {
        matching: "new_password",
        strength: 8,
      },
      selection: {},
    };
  }

  inputFilters(e) {
    const value = e.value;
    const rules = this.configData[e.name];
    if (!rules) return (this.validated["validated"] = "validated!");
    this.validated[e.name] = undefined;
    let failedConditions = 0;

    Object.entries(rules).forEach(([key, rule]) => {
      switch (key) {
        case "pattern":
          let pattern = new RegExp(rule);
          if (pattern.test(value) || value.length == 0) {
          } else {
            failedConditions++;
          }
          break;

        case "required":
          if (value.length != 0) {
          } else {
            failedConditions++;
          }
          break;

        case "matching":
          let pass = document.getElementById(rule).value;
          this.validated[document.getElementById(rule).id] = true;

          if ((value === pass && pass.length > 0) || value.length == 0) {
          } else {
            failedConditions++;
          }
          break;
        case "strength":
          let strength = this.checkPassword();
          if (strength > rule || value.length == 0) {
          } else {
            failedConditions++;
          }
          break;
      }

      if (failedConditions == 0) {
        this.validated[e.name] = true;
      } else {
        this.validated[e.name] = e.name + " is worn! " + key;
      }
    });
  }

  // Valid Password
  checkPassword() {
    const passwordInput =
      document.getElementById("password") ||
      document.getElementById("new_password");
    const strengthText = document.getElementById("strengthText");
    const passwordStrength = document.getElementById("passwordStrength");

    const password = passwordInput.value;
    const strength = this.calculatePasswordStrength(password);

    passwordStrength.classList.remove("weak", "medium", "strong");

    if (strength < 40 && password.length >= 8) {
      passwordStrength.classList.add("weak");
      strengthText.textContent = "Weak";
    } else if (strength >= 40 && strength < 70) {
      passwordStrength.classList.add("medium");
      strengthText.textContent = "Medium";
    } else if (strength >= 70) {
      passwordStrength.classList.add("strong");
      strengthText.textContent = "Strong";
    } else {
      strengthText.textContent = "low";
    }

    return strength;
  }

  calculatePasswordStrength(password) {
    const upperCaseRegex = /[A-Z]/;
    const lowerCaseRegex = /[a-z]/;
    const numbersRegex = /[0-9]/;
    const symbolsRegex = /[$&+,:;=?@#|'<>.^*()%!-]/;

    let strength = 0;

    if (password.length >= 8) strength += 10;
    if (password.length >= 12) strength += 10;
    if (password.length >= 14) strength += 10;
    if (upperCaseRegex.test(password)) strength += 10;
    if (lowerCaseRegex.test(password)) strength += 10;
    if (numbersRegex.test(password)) strength += 10;
    if (symbolsRegex.test(password)) strength += 10;

    return strength;
  }
}

export default ValidRules;
