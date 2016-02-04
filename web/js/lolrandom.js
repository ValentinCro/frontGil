/**
 * Created by valentin on 11/6/15.
 */
function freeChamp(id) {
    $.post("getFreeChamp",
        {

        },
        function (data, status) {
            var res = data;
            $("#" + id).html(res);
            $('[data-toggle="popover"]').popover();
        });
};

function checkAllMyChamp() {
    if ($(".MyChamp").is(':checked')) {
        $(".MyChamp").prop("checked", false);
    } else {
        $(".MyChamp").prop("checked", true);
    }
}

function checkAllNotMyChamp() {
    if ($(".notMyChamp").is(':checked')) {
        $(".notMyChamp").prop("checked", false);
    } else {
        $(".notMyChamp").prop("checked", true);
    }
}

function searchPlayer(name) {
    $.post("getUser",
        {
            log : name
        },
        function (data, status){
            $('#searchResult').html(data);
        });
}

function refreshParticipant() {
    $.post("getParticipant",
        {
            idSalle: $("#idGame").val()
        },
        function (data, status) {
            var res = data;
            var tab = res.split(',');
            var i;
            var str = ""
            for (i = 0; i < tab.length ; i++) {
                str += tab[i];
                if (i != tab.length - 1) {
                    str += ", ";
                }
            }
            $("#participant").html(str);
        });
}

function randomChamp() {
    $.post("getRandomChamp",
        {
            idSalle : $("#idGame").val()
        },
        function (data, status) {
            var res = JSON.parse(data);
            var image = res.image;
            var name = res.name;
            $.post("getLolVersion",
                {
                },
                function (data, status) {
                    var url = $url ="http://ddragon.leagueoflegends.com/cdn/" + data + "/img/champion/" + res.image;
                    var str = '<div class="card hoverable">';
                    str += '<div class="card-image">';
                    str += '<img src="' + url + '">';
                    str += '<p class="center">' + name + '</p></div>';
                    str += '</div>';
                    $("#champion_get").html(str);
                });
        });
}

function refreshChampGet() {
    $.post("champGet",
        {
            idSalle : $("#idGame").val()
        },
        function (data, status) {
            var res = JSON.parse(data);
            $.post("getLolVersion",
                {
                },
                function (data, status) {
                    var str ='';
                    for (var i = 0; i < res.length ; i++) {
                        var pseudo = res[i].pseudo;
                        var image = res[i].image;
                        var imageLoader = res[i].imageLoader;
                        var url = "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/" + imageLoader;
                        str += '<div class="col l6">';
                        str += '<div class="card hoverable">';
                        str += '<div class="card-image">';
                        str += '<img src="' + url + '">';
                        str += '<p class="center">' + pseudo + '</p></div>';
                        str += '</div>';
                        str += '</div>';
                    }
                    $("#stateGame").html(str);
                });
        });
}

$(document).ready(function() {
    $('[data-toggle="popover"]').popover();
});