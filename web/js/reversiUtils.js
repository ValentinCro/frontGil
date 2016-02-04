/**
 * Created by valentin on 10/20/15.
 */

function offlineLoad() {
var loadLine = $('#loadLine').val();
    if (loadLine != '') {
        rever.load(loadLine, 'plateau');
    }
}

var optLoad = false;
var optSave = false;
var optParam = false;
var globalScoreShown = false;
var persoScoreShown = false;
var win = 0;
var pourcentage;
if (session) {
    var rever = new reversi(iaColor, playerColor, help, boardColor);
} else {
    var rever = new reversi('#FFFFFF', '#000', true, '#008000');
}
rever.convertBoardToHTML('plateau');
setInterval("rever.performIA()", 1000);
$('#replay').click(function() {
    if (session) {
        rever = new reversi(iaColor, playerColor, help, boardColor);
    } else {
        rever = new reversi('#FFFFFF', '#000000', true, '#008000');
    }
    rever.convertBoardToHTML('plateau');
});
$('#saved').click(function() {
    if (session) {
        var save = rever.getSave();
        $.ajaxSetup({async: false});
        $.post("reversiSet",
            {
                game : 'reversi',
                method : 'save',
                data : 'vide',
                value : save
            },
            function(data, status){
            });
        $('#opt').html("Partie sauvegardée");
    } else {
        if (optSave) {
            optSave = false;
            $('#opt').html('');
        } else {
            optSave = true;
            optLoad = false;
            optParam = false;
            $('#opt').html(rever.getSave() + "<br/> Veuillez copier le code ci-dessus, il constitue la sauvegarde");
        }
    }
});
$('#loaded').click(function() {
    if (session) {
        var save;
        $.ajaxSetup({async: false});
        $.post("reversiGet",
            {
                game : 'reversi',
                method : 'save',
                data : 'vide'

            },
            function(data, status){
                save = data;
            });
        if (save != '') {
            rever.load(save, 'plateau');
            $('#opt').html("Partie chargée");
        } else {
            $('#opt').html("Aucune partie sauvegardée");
        }
    } else {
        if (optLoad) {
            optLoad = false;
            $('#opt').html('');
        } else {
            optLoad = true;
            optSave = false;
            optParam = false;
            $('#opt').html('<input type="text" name="loadLine" class="form-control" id="loadLine"><br /> <button class="btn btn-default" onclick="offlineLoad()" type="submit">Valider</button>');

        }
    }
});
$('#param').click(function() {
    if (!optParam) {
        optParam = true;
        optSave = false;
        optLoad = false;
        var ch = 'Couleur du joueur : <br/>';
        ch += '<input type="color" id="playerColor" class="form-control" value="' + playerColor + '">';
        ch += '<br/>Couleur de l\'IA : <br/>';
        ch += '<input type="color" id="iaColor" class="form-control" value="' + iaColor + '">';
        ch += '<br/>Couleur du plateau : <br/>';
        ch += '<input type="color" id="boardColor" class="form-control" value="' + boardColor + '"><br />';
        ch += 'Aide : ';
        if (session) {
            if (help == 1) {
                ch += '<input checked type="checkbox" id="help">';
            } else {
                ch += '<input type="checkbox" id="help">';
            }
        } else {
            ch += '<input checked type="checkbox" id="help">';
        }
        $('#opt').html(ch);
        $('#playerColor').change(function() {
            playerColor = $('#playerColor').val();
            rever.setPlayerColor(playerColor);
            rever.display('plateau');
            rever.setEvent();
            if (session) {
                var color = playerColor.replace("#", "");
                $.ajaxSetup({async: false});
                $.post("reversiSet",
                    {
                        game : 'reversi',
                        method : 'param',
                        data : 'reversiUserColor',
                        value : color

                    },
                    function(data, status){
                    });
            }
        });
        $('#iaColor').change(function() {
            iaColor = $('#iaColor').val()
            rever.setIAColor(iaColor);
            rever.display('plateau');
            rever.setEvent();
            if (session) {
                var color = iaColor.replace("#", "");
                $.ajaxSetup({async: false});
                $.post("reversiSet",
                    {
                        game : 'reversi',
                        method : 'param',
                        data : 'reversiIAColor',
                        value : color

                    },
                    function(data, status){
                    });
            }
        });
        $('#boardColor').change(function() {
            boardColor = $('#boardColor').val()
            rever.setBoardColor(boardColor);
            rever.display('plateau');
            rever.setEvent();
            if (session) {
                var color = boardColor.replace("#", "");
                $.ajaxSetup({async: false});
                $.post("reversiSet",
                    {
                        game : 'reversi',
                        method : 'param',
                        data : 'reversiBoardColor',
                        value : color

                    },
                    function(data, status){
                    });
            }
        });
        $('#help').change(function() {
            if ($('#help').prop('checked')) {
                help = 1;
                if (session) {
                    var color = playerColor.replace("#", "");
                    $.ajaxSetup({async: false});
                    $.post("reversiSet",
                        {
                            game : 'reversi',
                            method : 'param',
                            data : 'reversiHelp',
                            value : help

                        },
                        function(data, status){
                        });
                }
            } else {
                help = 0;
                if (session) {
                    $.ajaxSetup({async: false});
                    $.post("reversiSet",
                        {
                            game : 'reversi',
                            method : 'param',
                            data : 'reversiHelp',
                            value : help

                        },
                        function(data, status){
                        });
                }
            }
            rever.setHelp(help);
            rever.display('plateau');
            rever.setEvent();
        });
    } else {
        optParam = false;
        $('#opt').html(' ');
    }
});

$('#globalScore').click(function() {
    if (!globalScoreShown) {
        globalScoreShown = true;
        persoScoreShown = false;
        rever.getGlobalScore('leaderBoard');
    } else {
        globalScoreShown = false;
        $('#leaderBoard').html(' ');
    }
});
$('#persoScore').click(function() {
    if (!persoScoreShown) {
        persoScoreShown = true;
        globalScoreShown = false;
        rever.getPersoScore('leaderBoard');
    } else {
        persoScoreShown = false;
        $('#leaderBoard').html(' ');
    }
});
