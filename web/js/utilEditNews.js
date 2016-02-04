/**
 * Created by valentin on 1/18/16.
 */
$("#title").keyup(function() {
    $("#title-view").html($("#title").val());
});

$("#content").keyup(function() {
    $("#content-view").html($("#content").val());
});