/**
 * Created by valentin on 23/09/15.
 */
function seeMore(id) {
    $.post("get_content.php",
        {
            id: id
        },
        function(data, status){
            $("#content_" + id).html(data);
            console.log(data);
            $("#link_" + id).html('<i class="material-icons" onClick="seeLess('
                + id + ')" >expand_less</i>');
        });
}

function seeLess(id) {
    $.post("get_content.php",
        {
            id: id
        },
        function(data, status){
            $("#content_" + id).html(data.substr(0, 200));
            $("#link_" + id).html('<i class="material-icons" onClick="seeMore('
                + id + ')" >expand_more</i>');
        });
}

function sendCom() {
    var id = $('#hiddenIdNews').val();
    var pseudo = $("#pseudo").val();
    var text = $("#text").val();
    if (text != '' && pseudo != '') {
        $.post("set_comment.php",
            {
                idNews: id,
                pseudo: pseudo,
                comment: text
            },
            function(data, status){
                refreshNbButtonCom(id);
                $('#modal').closeModal();
            });
    }
}

function refreshNbButtonCom(id) {
    $.post("getNbCom.php",
        {
            id: id
        },
        function(data, status){
            $("#indCom_" + id).html('<button type="button" class="btn btn-primary" onClick="seeComm(' + id + ', 10)">' +
                'commentaires(' + data + ')</button> ' +
                '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal" ' +
                'onClick="changeIdNews(' + id + ')">Ajouter un commentaire</button>');
            //alert("Data: " + data + "\nStatus: " + status);
        });
}

function changeIdNews(id) {
    $('#hiddenIdNews').val(id);
}

function seeComm(id, end) {
    var start = 0;
    if (end > 10) {
        start = end - 10;
    }
    $.post('getComm.php',
        {
            id: id
        },
        function(data, statuts) {
            var com = data;
            var tabCom = com.split(';');
            if (tabCom.length > 1) {
                var ch = "";
                if (tabCom.length - 1 - start < 10) {
                    for (var i = start; i < tabCom.length - 1; i++) {
                        var splitedCom = tabCom[i].split(",");
                        ch += '<div class="row">' +
                            '<div class="card hoverable">' +
                            '<div class="card-content">' +
                            '<span class="card-title black-text">' + splitedCom[0] + ' : ' + splitedCom[1] + '' +
                            '</span>';
                        ch += '<p>' + splitedCom[2] + '</p>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                    }
                } else {
                    for (var i = start; i < end; i++) {
                        var splitedCom = tabCom[i].split(",");
                        ch += '<div class="row">' +
                            '<div class="card hoverable">' +
                            '<div class="card-content">' +
                            '<span class="card-title black-text">' + splitedCom[0] + ' : ' + splitedCom[1] + '' +
                            '</span>';
                        ch += '<p>' + splitedCom[2] + '</p>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                    }
                }
                var previous = end;
                if (end > 10) {
                    previous -= 10;
                }
                ch += '<div class="navCom row">' +
                    '<div class="card hoverable">' +
                    '<ul class="pagination">' +
                    '<li class="waves-effect">' +
                    '<a onClick="seeComm(' + id + ', ' + previous + ')" aria-label="Previous">' +
                    '<i class="material-icons">chevron_left</i>' +
                    '</a>' +
                    '</li>';
                var nbPage = 1;
                for (var length = tabCom.length - 1; length > 0 ; length-=10) {
                    if (nbPage * 10 == end) {
                        ch += '<li  class="active waves-effect grey"><a onClick="seeComm(' + id + ', ' + (nbPage * 10) + ')">' + nbPage + '<span class="sr-only"></span></a></li>';
                    } else {
                        ch += '<li class="waves-effect grey"><a onClick="seeComm(' + id + ', ' + (nbPage * 10) + ')">' + nbPage + '</a></li>';
                    }
                    nbPage ++;
                }
                var next = end;
                if (tabCom.length - 1 > end) {
                    next += 10;
                }
                ch += '<li class="waves-effect">' +
                    '<a onClick="seeComm(' + id + ', ' + next + ')" aria-label="Next">' +
                    '<i class="material-icons">chevron_right</i>' +
                    '</a>' +
                    '</li>' +
                    '</ul>' +
                    '</div>' +
                    '</div>';
                $("#commPlace_" + id).html(ch);
                $.post("getNbCom.php",
                    {
                        id: id
                    },
                    function(data, status){
                        $("#indCom_" + id).html('<button type="button" class="btn btn-primary" onClick="hideComm(' + id + ')">' +
                            'commentaires(' + data + ')</button> ' +
                            '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal" ' +
                            'onClick="changeIdNews(' + id + ')">Ajouter un commentaire</button>');
                        //alert("Data: " + data + "\nStatus: " + status);
                    });

            }
        });
}

function hideComm(id) {
    $("#commPlace_" + id ).html('');
    refreshNbButtonCom(id);
}

$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();
});