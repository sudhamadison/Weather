function isDateValid(dateStr) {
    return !isNaN(new Date(dateStr));
}

function validateDOB() {

    document.getElementById("lblDOBErrorMsg").innerHTML = '';
    if (!isDateValid(document.getElementById("txtdob").value)) {
        document.getElementById("lblDOBErrorMsg").innerHTML = "Enter valid DOB.";
    }
}

function validateStartDate() {
    document.getElementById("lblStartDateErrorMsg").innerHTML = '';
    if (!isDateValid(document.getElementById("txtstartdate").value)) {
        document.getElementById("lblStartDateErrorMsg").innerHTML = "Enter valid Date.";
    }
}

function validateEndDate() {
    document.getElementById("lblEndDateErrorMsg").innerHTML = '';
    if (!isDateValid(document.getElementById("txtenddate").value)) {
        document.getElementById("lblEndDateErrorMsg").innerHTML = "Enter valid Date.";
    }
}

function futureDateCheck() {
    validateDOB();
    document.getElementById("lblFutureDateErrorMsg").innerHTML = '';

    var givenDate = new Date(document.getElementById("txtdob").value);
    var currentDate = new Date();
    if (givenDate > currentDate) {
        document.getElementById("lblFutureDateErrorMsg").innerHTML = "Don't enter future date";
    }
}

function pastDateCheck() {
    validateStartDate()
    document.getElementById("lblPastDateErrorMsg").innerHTML = '';
    var startDate = new Date(document.getElementById("txtstartdate").value);
    var currentDate = new Date();
    if (startDate <= currentDate) {
        document.getElementById("lblPastDateErrorMsg").innerHTML = "Enter current or future date";
    }
}

function pastDateCheck2() {
    validateEndDate()
    document.getElementById("lblPastDateErrorMsg2").innerHTML = '';
    var x = new Date(document.getElementById("txtstartdate").value);
    var endDate = new Date(document.getElementById("txtenddate").value);
    var currentDate = new Date();
    if (endDate <= currentDate) {

        document.getElementById("lblPastDateErrorMsg2").innerHTML = "Enter current or future date.";
    }
}

function testonchange() {

    var x = document.getElementById("txtlastname").value;
    x = x.toUpperCase();
    document.getElementById("txtlastname").value = x;
}
function testonchange2() {

    var x = document.getElementById("txtfirstname").value;
    x = x.toUpperCase();
    document.getElementById("txtfirstname").value = x;
}

function val() {
    document.getElementById("errorMsg").innerHTML = "";
    const startdate = new Date(document.getElementById('txtstartdate').value);
    const enddate = new Date(document.getElementById('txtenddate').value);

    if (startdate > enddate) {
        document.getElementById("errorMsg").innerHTML = "Start date should be less than end date";
        return false;
    }

    return true;
}