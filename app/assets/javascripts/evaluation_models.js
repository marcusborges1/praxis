var targetOptions = $("#evaluation_model_context option");

for (var i = 0; i < targetOptions.length; i++) {
  if (!targetOptions[i].selected) {
    $("#" + targetOptions[i].value + "-target").hide();
  }
}

$("#evaluation_model_context").change(function() {
  if (this.value === "project") {
    $("#project-target").show();
    $("#sector-target").hide();
  } else if (this.value === "sector") {
    $("#sector-target").show();
    $("#project-target").hide();
  } else {
    $("#sector-target").hide();
    $("#project-target").hide();
  }
});
