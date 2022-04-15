// Generan Date Picker 
$('.date_picker').daterangepicker({
    "singleDatePicker": true,
    "autoApply": true,
    "showDropdowns": true,
    "locale": {
        "format": "YYYY-MM-DD",
    }
});


// Cash Book Search
$("#SearchRadio").click(function () {
    $("#Search").show();
    $("#FilterSearch").hide();
});

$("#FilterSearchRadio").click(function () {
    $("#Search").hide();
    $("#FilterSearch").show();
});

$("#Search").show();
$("#FilterSearch").hide();