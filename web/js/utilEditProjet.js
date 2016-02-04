/**
 * Created by valentin on 1/18/16.
 */

$("#intitule").keyup(function() {
    $("#intitule-view").html($("#intitule").val());
});

$("#tags").keyup(function() {
    var tags = $("#tags").val().split(" ");
    var ch = "";
    for (tag of tags) {
        ch += '<div class="badge">' + tag + '</div>'
    }
    $("#tags-view").html(ch);
});

