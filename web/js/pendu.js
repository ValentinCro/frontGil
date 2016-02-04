/**
* Created by valentin on 10/10/15.
*/
var fail = 0;
var nbFail = 7;
var nbturn = 0;
var words = ["CAMION", "VOITURE", "AVION", "AUTOBUS", "TRAMWAY", "INFORMATIQUE", "GARE", "AEROPORT", "PORT", "GRAMMAIRE"
    , "EUROPE", "FRELON", "SOLDAT", "GENETIQUE", "AUTEUR", "VENIN", "PORTAIL", "PERSONNE", "HOMME", "FEMME", "FILLE"
    , "GARCON", "ECONOMIE", "GEOGRAPHIE", "MATHEMATIQUE"
    ];
var word = '';
var hiddenWord = '';
var triedLetter = new Array();
var end = false;
var scoreShown = false;

function writeLetters(id) {
    var str = '';
    if (!end) {
        for (var i = 97; i <= 122; i++) {
            var letter = String.fromCharCode(i).toUpperCase();
            var find = false;
            for (var j = 0; j < triedLetter.length ; j++) {
                if (triedLetter[j] == letter) {
                    find = true;
                }
            }
            if (!find) {
                str += '<button class="btn btn-default penduLettersBtn" onclick="performTurn(\'' + letter + '\',\'' +  id + '\')">';
                str +=  letter;
                str += '</button> ';
            } else {
                str += '<button disabled class="btn btn-default penduLettersBtn">';
                str += letter;
                str += '</button> ';
            }
        }
    }
    return str;
}

function writeDude(id) {
    var str ='';
    if (fail >= 0) {
        str = '<img src="image/pendu/pendu_' + fail + '.png" class="img-responsive" alt="pendu_' + fail + '">';
    }
    $('#' + id).html(str);
}

function writeGame(id) {
    var letters = writeLetters(id);
    var str = "Tour(s) : " + (nbturn + 1) + "<br />" + "Nombre de chance(s) restante(s) : " + (nbFail - fail) + "<br/><br />" + letters + "<br /><br />";
    for (var i = 0 ; i < hiddenWord.length; i++) {
        str += hiddenWord[i] + ' ';
    }
    if (end) {
        str += '<br /><br /><button class="btn btn-default" onclick="replay()">rejouer</button><br /><br />'
    }
    $('#' + id).html(str);
}

function addTriedLetter(letter) {
    triedLetter.push(letter);
}

function newGame() {
    var ran = Math.floor(Math.random() * words.length);
    word = words[ran];
    fail = 0;
    nbturn = 0;
    triedLetter = new Array();
    hiddenWord = word[0];
    end = false;
    for (var i = 1; i < word.length ; i++) {
        hiddenWord += '_';
    }
}

function performTurn(letter, id) {
    addTriedLetter(letter);
    var match = false;
    for (var i = 1; i < word.length ; i++) {
        if (letter == word[i]) {
            match = true;
            hiddenWord = hiddenWord.substr(0, i) + letter + hiddenWord.substr(i + 1);
        }
    }
    nbturn += 1;
    if (!match) {
        fail += 1;
        if (fail == nbFail) {
            openModal('Oh !! Vous avez perdu...');
            end = true;
            $.post("reversiSet",
                {
                    game : 'pendu',
                    method : 'score',
                    data : '0',
                    value : 'vide'
                },
                function(data, status){
                });
        }
    } else {
        if (hiddenWord == word) {
            openModal('Bravo !! Vous avez gagné !!!');
            end = true;
            $.post("reversiSet",
                {
                    game : 'pendu',
                    method : 'score',
                    data : '1',
                    value : 'vide'
                },
                function(data, status){
                });
        }
    }
    writeGame(id);
    writeDude('dude');
}

function openModal(string) {
    var str = '';
    str += '<div id="modal" class="modal fade" tabindex="-1" role="dialog">' +
        '<div class="modal-dialog">' +
        '<div class="modal-content">' +
        '<div class="modal-header">' +
        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
        '<h4 class="modal-title">Fin de la partie</h4>' +
        '</div>' +
        '<div class="modal-body"><p>' + string + '</p></div>' +
        '<div class="modal-footer">' +
        '<button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>' +
        ' </div>' +
        ' </div>' +
        ' </div>' +
        '</div>';
    $('#modalPlace').html(str);
    $('#modal').modal('show')
}

function toggleScore() {
    if (scoreShown) {
        scoreShown = false;
        $("#param_score").html('');
    } else {
        scoreShown = true;
        var score = '';
        $.ajaxSetup({async: false});
        $.post("reversiGet",
            {
                game : 'pendu',
                method : 'score',
                data : 'vide'
            },
            function(data, status){
                score = data;
            });
        var tmp = score.split(";");
        var tabScore = new Array();
        var i;
        for(i = 0; i < tmp.length; i++) {
            tabScore.push(tmp[i].split(','));
        }
        var str ='<table class="table table-striped table-responsive">';
        str += '<tr>' +
            '<thead>' +
            '<th>Position</th>' +
            '<th>Pseudo</th>' +
            '<th>Victoires</th>' +
            '<th>Parties</th>' +
            '</thead></tr>' +
            '<tbody>';
        for (i = 0; i < tabScore.length; i++) {
            if (tabScore[i][1] != undefined) {
                str +='<tr>';
                str += '<td>' + (i + 1) + '</td>';
                str += '<td>' + tabScore[i][1] + '</td>';
                str += '<td>' + tabScore[i][2] + '</td>';
                str += '<td>' + tabScore[i][3] + '</td>';
                str +='</tr>';
            }
        }
        str +='</tbody></table>';
        $("#param_score").html(str);
    }
}

function replay() {
    newGame("game");
    writeGame("game");
    writeDude("dude");
}

newGame("game");
writeGame("game");
writeDude("dude");