$(document).ready(function() {
  $(".allocated-members-checkbox").each(function() {
    displayLeaderOptions(this)
  });

  $(".allocated-members-checkbox").change(function() {
    displayLeaderOptions(this)
  });

  function displayLeaderOptions(elem) {
    var option = $("option[value=" + elem.value + "]");
    elem.checked ? option.show() : option.hide();
  }
});
