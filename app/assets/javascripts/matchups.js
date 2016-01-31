$(document).ready(function() {

  var selectPositions = ["select-qb", "select-rb", "select-wr", "select-te"];
  var selectPositionsString = "#select-qb, #select-rb, #select-wr, #select-te"
  var positions = [".QB", ".RB", ".WR", ".TE"];

  $(selectPositionsString).click(function() {
    $(positions.join(', ')).hide();

    for (var i = 0; i < selectPositions.length; i++) {
      if ($(this).attr("id") == selectPositions[i]) {
        $(positions[i]).show();
      }
    }

    $(selectPositionsString).removeClass("active")
    $(this).addClass("active");
  });

  $(".matchups-main-table").tablesort();
});
