$("#target").hide();
$(document).ready(
    $("#evaluation_individual").change(function() {
        console.log(this.checked);
        if (this.checked === true) {
            $("#target").show();
        } else {
            $("#target").hide();
        }
    })
);