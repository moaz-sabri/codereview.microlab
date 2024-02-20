import ElementHandler from "./handler.js";
import Requests from "../../js/api/requests.js";
import Main from "../../js/main.js";

const elementHandler = new ElementHandler();
const main = new Main();
const requests = new Requests();

// JavaScript (Custom Element) Submit With Loading Progress
class DefaultTable extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    const headerString = this.getAttribute("el-header") || false;
    const dataString = this.getAttribute("el-data") || false;
    const edit = this.getAttribute("el-edit");
    const dele = this.getAttribute("el-dele");
    const uid = this.getAttribute("el-uid") || "";
    const fun = this.getAttribute("el-function") || "";

    let header, data;

    try {
      header = JSON.parse(headerString);
      data = JSON.parse(dataString);
    } catch (error) {
      console.error("Error parsing JSON attributes:", error);
      return;
    }

    const clas =
      this.getAttribute("el-class") ||
      "table table-striped table-striped table-hover";

    const currentElement = elementHandler.getParent(this);

    // Create a div element in the shadow DOM
    const table = document.createElement("table");
    table.setAttribute("class", clas);

    // Create the table header
    const thead = document.createElement("thead");
    const headerRow = document.createElement("tr");

    if (dele) {
      const deleteHeader = document.createElement("th");
      deleteHeader.setAttribute("scope", "col");
      deleteHeader.setAttribute("class", "cell");

      const checkboxDiv = document.createElement("div");
      checkboxDiv.setAttribute("class", "form-check");

      const checkboxInput = document.createElement("input");
      checkboxInput.setAttribute("class", "form-check-input");
      checkboxInput.setAttribute("type", "checkbox");
      checkboxInput.setAttribute("id", "checkAll");
      checkboxInput.addEventListener("change", (event) =>
        main.chnageAll(event)
      );

      checkboxDiv.appendChild(checkboxInput);
      deleteHeader.appendChild(checkboxDiv);

      headerRow.appendChild(deleteHeader);
    }

    Object.values(header).forEach((col) => {
      const headerCell = document.createElement("th");
      headerCell.setAttribute("scope", "col");
      headerCell.textContent = col;
      headerRow.appendChild(headerCell);
    });

    thead.appendChild(headerRow);
    table.appendChild(thead);

    // Create the table body
    const tbody = document.createElement("tbody");

    Object.values(data).forEach((item) => {
      const row = document.createElement("tr");

      let first = true;
      Object.values(header).forEach((key, col) => {
        const cell = document.createElement("td");
        let value = item[Object.keys(header)[col]];

        if (Object.keys(header)[col] === "calendar_date_start") {
          // Convert the date string to a Date object
          const date = new Date(value);

          // Format the date as 'MM.DD'
          const formattedDate = date
            .toLocaleDateString("en-US", { month: "2-digit", day: "2-digit" })
            .replace(/\//g, ".");

          // Reformat the date string (e.g., "05.05.")
          value = formattedDate;
        }

        cell.textContent = value;

        if (first) {
          first = false;
          if (dele) {
            const deleteCell = document.createElement("th");
            const checkboxDiv = document.createElement("div");
            checkboxDiv.setAttribute("class", "form-check");

            const checkboxInput = document.createElement("input");
            checkboxInput.setAttribute("class", "form-check-input");
            checkboxInput.setAttribute("type", "checkbox");
            checkboxInput.setAttribute("value", item[uid]);
            checkboxInput.setAttribute("id", item[uid]);
            checkboxInput.addEventListener("change", (event) =>
              main.selectOne(event)
            );

            checkboxDiv.appendChild(checkboxInput);
            deleteCell.appendChild(checkboxDiv);

            row.appendChild(deleteCell);
          }

          const rowCell = document.createElement("td");
          rowCell.setAttribute("scope", "row");
          rowCell.textContent = value;
          row.appendChild(rowCell);
        } else {
          const rowCell = document.createElement("td");

          if (Object.keys(header)[col] === "calendar_status") {
            console.log(value);
            let color = "danger";
            if (value === "RUNNING") {
              color = "success";
            }
            rowCell.innerHTML = `<span class="badge text-bg-${color}">Läuft</span>`;
          } else {
            rowCell.textContent = value;
          }
          row.appendChild(rowCell);
        }
      });

      if (edit || dele) {
        const actionCell = document.createElement("td");
        actionCell.setAttribute("class", "text-end");

        if (edit) {
          const editLink = document.createElement("a");
          editLink.setAttribute("href", `${edit}${item[uid]}`);
          editLink.setAttribute("class", "btn btn-info m-1");
          const editIcon = document.createElement("i");
          editIcon.setAttribute("class", "bi bi-pencil-square");
          editLink.appendChild(editIcon);
          actionCell.appendChild(editLink);
        }

        if (dele) {
          const deleteButton = document.createElement("button");
          deleteButton.setAttribute("class", "btn btn-danger my-1");
          deleteButton.addEventListener("click", () =>
            main.defaultDeleteSubmitRequest(`${dele}${item[uid]}`, `${fun}`)
          );
          const deleteIcon = document.createElement("i");
          deleteIcon.setAttribute("class", "bi bi-trash3");
          deleteButton.appendChild(deleteIcon);
          actionCell.appendChild(deleteButton);
        }

        row.appendChild(actionCell);
      }

      tbody.appendChild(row);
    });

    table.appendChild(tbody);

    // // Append the table to the document
    // const div = document.getElementById("tableContainer");
    // div.appendChild(table);

    elementHandler.setElement(table, currentElement);
  }
}

// JavaScript (Custom Element) Submit With Loading Progress
class PaginationTable extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    const dataString = this.getAttribute("el-data") || "Submit";
    const clas = this.getAttribute("el-class") || "";
    let limit = this.getAttribute("el-limit") || 3;

    let data;

    try {
      data = JSON.parse(dataString);
    } catch (error) {
      console.error("Error parsing JSON attributes:", error);
      return;
    }

    const currentElement = elementHandler.getParent(this);

    // Create a div element in the shadow DOM
    const nav = document.createElement("nav");
    nav.setAttribute("class", clas);
    nav.setAttribute("aria-label", "Page navigation example");
    let pagination = `
    <ul class="pagination justify-content-start">`;

    if (data.current > 1) {
      pagination += `
        <li class="page-item">
            <a class="page-link" href="${data.url}?current=${
        data.current - 1
      }&count=${data.count}">Vorherige</a>
        </li>
        `;
    } else {
      pagination += `
        <li class="page-item disabled">
            <a class="page-link">Vorherige</a>
        </li>
        `;
    }

    let more = true;

    if (limit > data.total) {
      limit = Math.ceil(data.total / data.count);
      more = false;
    }

    let diff = 0;
    if (data.current > 2) {
      diff = 2;
    } else if (data.current > 1) {
      diff = 1;
    }

    for (
      let num = data.current - diff;
      num <= limit + data.current - diff;
      num++
    ) {
      // TODO UPDATE
      //   if (num < limit) {
      //     pagination += `
      //     <li class="page-item">
      //         <a class="page-link" href="${data.url}?current=${num}&count=${data.count}">${num}</a>
      //       </li>
      //     `;
      //   } else {
      pagination += `
        <li class="page-item ${num == data.current ? "active" : ""}">
            <a class="page-link ${
              num == data.current ? "" : "disabled"
            }">${num}</a>
        </li>
        `;
      //   }
    }

    if (more) {
      pagination += `
      <li class="page-item">
          <a class="page-link" disabled>...</a>
        </li>
      `;
    }

    if (data.current * data.count < data.total) {
      pagination += `
        <li class="page-item">
            <a class="page-link" href="${data.url}?current=${
        data.current + 1
      }&count=${data.count}">Nächste</a>
        </li>
        `;
    } else {
      pagination += `
        <li class="page-item disabled">
            <a class="page-link">Nächste</a>
        </li>
        `;
    }

    nav.innerHTML = pagination + `</ul>`;

    elementHandler.setElement(nav, currentElement);
  }
}

customElements.define("default-table", DefaultTable);
customElements.define("pagination-table", PaginationTable);
