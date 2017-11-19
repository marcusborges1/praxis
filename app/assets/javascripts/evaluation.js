$("#target").hide();
$(document).ready(
    $("#evaluation_individual").change(function() {
        if (this.checked === true) {
            $("#target").show();
        } else {
            $("#target").hide();
        }
    })
);
