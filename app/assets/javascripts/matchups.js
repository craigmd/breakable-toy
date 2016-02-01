$(document).ready(function() {

  var relatedPositionElements = [["select-qbs", "QB", "favorite-qbs"],
      ["select-rbs", "RB", "favorite-rbs"],
      ["select-wrs", "WR", "favorite-wrs"],
      ["select-tes", "TE", "favorite-tes"]],
    selectPositionSelectors = "#select-qbs, #select-rbs, #select-wrs, #select-tes",
    positionSelectors = ".QB, .RB, .WR, .TE",
    selectFavoriteSelectors = "#favorite-qbs, #favorite-rbs, #favorite-wrs, #favorite-tes";

  //Fixes the position of the logo

  if (location.pathname == "/matchups") {
    $("#home").css("position", "fixed")
  }

  //Hides and shows rows based on their position class

  $(selectPositionSelectors).click(function() {
    $(positionSelectors).hide();

    for (var i = 0; i < relatedPositionElements.length; i++) {
      if ($(this).attr("id") == relatedPositionElements[i][0]) {
        $("." + relatedPositionElements[i][1]).show();
      }
    }

    $(selectPositionSelectors).removeClass("active")
    $(this).addClass("active");
  });

  //Makes the tables sortable with the jQuery plugin TableSort

  $(".matchups-main-table").tablesort();

  //Adds a player to the favorites list and hides it in the main table

  $(".add-player").click(function() {
    var playerRow = $(this).parent();

    playerRow.addClass("deleted");

    for (var i = 0; i < relatedPositionElements.length; i++) {
      if (playerRow.attr("class").includes(relatedPositionElements[i][1])) {
        $("#" + relatedPositionElements[i][2] + " tbody").append(
          "<tr>" +
          '<td class="remove-player">&mdash;</td>' +
          "<td>" + $(this).next().html() + "</td>" +
          "</tr>"
        );
      }
    }
  });

  //Deletes a player from the favorites list and unhides it in the main table

  $(selectFavoriteSelectors).on("click", ".remove-player", function() {
    var playerId = $(this).next().children().attr("href").split("/")[2];

    $(this).parent().remove();
    $("#" + playerId).closest("tr").removeClass("deleted");
  });
});
