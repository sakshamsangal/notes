
var selectedRow = null;
var my_sum = document.getElementById("sum");
var y = document.getElementById("product");


function onFormSubmit(e) {
    event.preventDefault();
    var formData = readFormData();
    if (selectedRow == null) {
        insertNewRecord(formData);
    } else {
        updateRecord(formData);
    }
    resetForm();
}

//Retrieve the data
function readFormData() {
    var formData = {};
    formData["product"] = y.value;
    formData["perPrice"] = document.getElementById("perPrice").value;
    return formData;
}

//Insert the data
function insertNewRecord(data) {
    var table = document
        .getElementById("storeList")
        .getElementsByTagName("tbody")[0];
    var newRow = table.insertRow(table.length);
    cell2 = newRow.insertCell(0);
    cell2.innerHTML = data.product;
    cell4 = newRow.insertCell(1);
    cell4.innerHTML = data.perPrice;
    cell4 = newRow.insertCell(2);
    sum.value = parseInt(sum.value) + parseInt(data.perPrice);
    cell4.innerHTML = `<button onClick="onEdit(this)" class="btn btn-primary btn-sm" >Edit</button> <button onClick="onDelete(this)" class="btn btn-primary btn-sm" >Delete</button>`;
    y.focus();
}
var temp = 0;
//Edit the data
function onEdit(td) {
    selectedRow = td.parentElement.parentElement;
    y.value = selectedRow.cells[0].innerHTML;
    document.getElementById("perPrice").value = selectedRow.cells[1].innerHTML;
    temp = parseInt(selectedRow.cells[1].innerText);
    y.focus();
}
function updateRecord(formData) {
    selectedRow.cells[0].innerHTML = formData.product;
    selectedRow.cells[1].innerHTML = formData.perPrice;
    sum.value = parseInt(sum.value) + parseInt(formData.perPrice) - temp;
    y.focus();
}

//Delete the data
function onDelete(td) {
    if (confirm("Do you want to delete this record?")) {
        row = td.parentElement.parentElement;
        document.getElementById("storeList").deleteRow(row.rowIndex);
        sum.value = parseInt(sum.value) - parseInt(row.cells[1].innerText);
        resetForm();
        y.focus();
    }
}

//Reset the data
function resetForm() {
    y.value = "";
    document.getElementById("perPrice").value = "";
    selectedRow = null;
}

function export2csv() {
    let data = "";
    x = document.getElementById("date").value;
    const tableData = [];
    const rows = document.querySelectorAll("table tr");
    for (const row of rows) {
        const rowData = [];
        for (const [index, column] of row.querySelectorAll("th, td").entries()) {
            // To retain the commas in the "Description" column, we can enclose those fields in quotation marks.
            // console.log(index, column, column.tagName)
            if (column.tagName === "TH") {
                continue;
            } else if ((index + 1) % 3 === 0) {
                rowData.push('"' + x + '"');
            } else if (index % 3 === 0) {
                rowData.push('"' + column.innerText + '"');
            } else {
                rowData.push(column.innerText);
            }
        }
        tableData.push(rowData.join(","));
    }
    data += tableData.join("\n");
    document.getElementById("csv").value = data;
}

getMyDate();
function getMyDate() {
    const mth = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
    ];
    var currentDate = new Date();
    var day = currentDate.getDate();
    var month = mth[currentDate.getMonth()];
    var year = currentDate.getFullYear();
    document.getElementById("date").value = day + "-" + month + "-" + year;
}
