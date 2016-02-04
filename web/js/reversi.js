function place(x, y) {
    this.x = x;
    this.y = y;

    this.getX = function() {
        return this.x;
    }

    this.getY = function() {
        return this.y;
    }
}

function reversi(colorIA, colorPlayer, isHelp, colorBoard) {
	this.plateau = new Array();
	this.turn = -1;
    this.whiteTurn = true;
    this.canPlayed = new Array();
    this.end = false;
    this.colorW = colorIA; 
    this.colorB = colorPlayer;
    this.colorCase = colorBoard;
    this.help = isHelp;
	
    var i = 0;
	for (i = 0; i < 8; i++) {
		this.plateau[i] = new Array();
	}
	for (i = 0; i < 8; i++) {
		for (var j = 0; j < 8; j++) {
			if (i == 3 && j == 3 || i == 4 && j == 4) {
                this.plateau[i][j] = 'W';
            } else if (i == 3 && j == 4 || i == 4 && j == 3 ) {
                this.plateau[i][j] = 'B';
            } else {
                this.plateau[i][j] = 'E';
            }
		}
	}
	
	this.setScore = function() {
        var nbWhite = this.getNbCaseByColor('W');
        var nbBlack = this.getNbCaseByColor('B');
        var diff = nbBlack - nbWhite;
        $.ajaxSetup({async: false});
        $.post("ajaxSet.php",
            {
                game: 'reversi',
                method: 'score',
                data: ' ',
                value: diff

            },
            function (data, status) {
            });
    }
	
	this.convertBoardToHTML = function(id) {
        this.clearCanPlay();
        this.changeTurn();
        this.upTurn();
        for (var i = 0; i < 8; i++) {
			for (var j = 0; j < 8; j++) {
                this.canPlay(i, j);
            }
        }
		this.display(id);
		this.setEvent();
        if (this.nbPlayableCase() == 0 && !this.end) {
            if (this.isEnd()) {
				this.setScore();
				this.end = true;
                if (this.getNbCaseByColor('B') > this.getNbCaseByColor('W')) {
                    document.getElementById(id).innerHTML = "<fieldset><div id='end'>Vous avez gagné</div></fieldset>";
                    return;
                } else if (this.getNbCaseByColor('B') < this.getNbCaseByColor('W')) {
                    document.getElementById(id).innerHTML = "<fieldset><div id='end'>Vous avez perdu</div></fieldset>";   
                    return;
                } else if (this.getNbCaseByColor('B') == this.getNbCaseByColor('W')) {
                    document.getElementById(id).innerHTML = "<fieldset><div id='end'>égalité</div></fieldset>";
                    return;
                }
            } else if (!this.end) {
                this.convertBoardToHTML(id);
            }
        }
	}
	
	this.setPlayerColor = function(color) {
		this.colorB = color;
	}
	
	this.setIAColor = function(color) {
		this.colorW = color;
	}
    
    this.setBoardColor = function(color) {
		this.colorCase = color;
	}
	
	this.setHelp = function(help) {
		this.help = help;
	}
    
    this.display = function(id) {
        var ch = '';
		for (var i = 0; i < 8; i++) {
			ch += '<div class="row">';
			for (var j = 0; j < 8; j++) {
				if (this.plateau[i][j] == 'E') {
					ch += '<div class="col-xs-1 col-sm-1 col-lg-1 square" style="background-color:' + this.colorCase + ';" id="empty_' + i + '_' + j + '"></div>';
				} else if (this.plateau[i][j] == 'W') {
					ch += '<div class="col-xs-1 col-sm-1 col-lg-1 square" style="background-color:' + this.colorCase + ';" id="white_' + i + '_' + j + '">';
					ch += '<svg width="40px" height="40px">';
                    ch += '<circle cx="16px" cy="25px" r="15px" fill=' + this.colorW + ' />';
					ch += '</svg>';
					ch += '</div>';
				} else if (this.plateau[i][j] == 'B') {
					ch += '<div class="col-xs-1 col-sm-1 col-lg-1 square" style="background-color:' + this.colorCase + ';" id="black_' + i + '_' + j + '">';
					ch += '<svg width="40px" height="40px">';
                    ch += '<circle cx="16px" cy="25px" r="15px" fill=' + this.colorB + ' />';
					ch += '</svg>';
					ch += '</div>';
				} else if (this.plateau[i][j] == 'P' && !this.whiteTurn && this.help == 1) {
					ch += '<div class="col-xs-1 col-sm-1 col-lg-1 square" style="background-color:' + this.colorCase + ';" id="empty_' + i + '_' + j + '">';
					ch += '<svg width="40px" height="40px">';
					ch += '<circle cx="16px" cy="25px" r="5px" fill=' + this.colorB + ' />';
					ch += '</svg>';
					ch += '</div>';
				} else {
					ch += '<div class="col-xs-1 col-lg-1 square" style="background-color:' + this.colorCase + ';" id="empty_' + i + '_' + j + '"></div>';
                }
			}
			ch += '</div>';
		}
		document.getElementById(id).innerHTML = ch;   
		document.getElementById('stateGame').innerHTML = 'Pion IA : ' + this.getNbCaseByColor('W') + '<br/>Pion joueur : ' + this.getNbCaseByColor('B'); 
    }
    
    this.clearCanPlay = function() {
		for (var i = 0; i < 8; i++) {
			for (var j = 0; j < 8; j++) {
                if (this.plateau[i][j] == 'P') {
                    this.plateau[i][j] = 'E';   
                }
            }
        }
    }
	
	this.isEnd = function() {
        if (this.nbPlayableCase() == 0) {
            this.changeTurn();
            this.clearCanPlay();
            for (var i = 0; i < 8; i++) {
                for (var j = 0; j < 8; j++) {
                    this.canPlay(i, j);
                }
            }
            if (this.nbPlayableCase() == 0) {
                return true;   
            }
        }
        this.changeTurn();
        return false;
    }
    
    this.getNbCaseByColor = function(color) {
        var nb = 0;
        for (var i = 0; i < 8; i++) {
			for (var j = 0; j < 8; j++) {
				if (this.plateau[i][j] == color) {
                    nb++;   
                }
			}
		}
        return nb;
    }
    
	this.convertToWhite = function(x, y) {
		this.plateau[x][y] = 'W';
        this.flipCircle(x, y, 'W', 'B');
	};
	
	this.getCase = function(i, j) {
		return this.plateau[i][j];
	};
	
	this.convertToBlack = function(x, y) {
		this.plateau[x][y] = 'B';
        this.flipCircle(x, y, 'B', 'W');
	};
    
    this.flipCircle = function(i, j, our, other) {
        var cpti = parseInt(i);
        var cptj = parseInt(j);
        var z = [-1,0,1];
		for (var cptx = 0; cptx < z.length; cptx++) {
			for (var cpty = 0; cpty < z.length; cpty++) {
				var new_X = cpti + z[cptx];
				var new_Y = cptj + z[cpty];
				if (new_X > -1 && new_X < 8 && new_Y > -1 && new_Y < 8) {
					if (this.plateau[new_X][new_Y] == other) {
						var x = cpti;
						var y = cptj;
						var bool = true;
                        var find = false;
						while(y < 8 && y > -1 && x < 8 && x > -1) {
							if (x != cpti || y != cptj) {
								if (this.plateau[x][y] == 'E' || this.plateau[x][y] == 'P') {
									bool = false;
								}if (find) {
									bool = false;
								}
								if (this.plateau[x][y] == our && bool) {
									this.flip(x, y, new_X, new_Y, our);
                                    find = true;
								}
							}
							x += new_X - cpti;
							y += new_Y - cptj;
						} 
					}
				}
			}
        }
        
    };
    
    this.flip = function(destx, desty, sourcex, sourcey, our) {
        while (sourcex != destx || sourcey != desty) {
            this.plateau[sourcex][sourcey] = our;
            if (sourcex > destx) {
                sourcex--;
            } else if (sourcex < destx) {
                sourcex++;
            }
            if (sourcey > desty) {
                sourcey--;
            } else if (sourcey < desty) {
                sourcey++;
            }
        }
        
    };
	
	this.getPosById = function(id) {
		var tab = id.split("_");
		var Pos = new Array(tab[1], tab[2])
		return Pos;
	};
	
	this.setEvent = function() {
		for (var i = 0; i < 8; i++) {
			for (var j = 0; j < 8; j++) {
				this.setEventById('#empty', i, j);
			}
		}
	};
	
	
    this.upTurn = function() {
        this.turn++;   
    };
    
    this.changeTurn = function() {
        this.whiteTurn = !this.whiteTurn;    
    };
    
    this.getTurn = function() {
        return this.whiteTurn;  
    };
    
    this.performIA = function() {
		if (this.whiteTurn && !this.end) {
			var canPlayed = this.nbPlayableCase();
            var playableCase = this.getPlayableCase();
			if (canPlayed > 0) {
                var good = false;
                while (!good) {
                    var nb = Math.floor(Math.random() * (canPlayed + 1));
                    if (canPlayed > 1) {
                        good = this.isNotCorner(playableCase[nb]);
                        if (!good) {
                            var otherCase = false;
                            for (var i = 0; i < canPlayed; i ++) {
                                if (this.isNotCorner(playableCase[i])) {
                                    otherCase = true;
                                }
                            }
                            if (!otherCase) {
                                good = true;
                            }
                        }
                    } else {
                        good = true;
                    }
                }
                rever.convertToWhite(playableCase[nb].getX(), playableCase[nb].getY());
                rever.convertBoardToHTML("plateau");
			} else {
				rever.convertBoardToHTML("plateau");
			}
		}
	};

    this.isNotCorner = function(place) {
        if (place.getX() == 0 && (place.getY() == 1 || place.getY() == 6)) {
            return false;
        } else if (place.getX() == 1 &&
            (place.getY() == 1 || place.getY() == 6 || place.getY() == 0 || place.getY() == 7)) {
            return false;
        } else if (place.getX() == 7 && (place.getY() == 1 || place.getY() == 6)) {
            return false;
        } else if (place.getX() == 6 &&
            (place.getY() == 1 || place.getY() == 6 || place.getY() == 0 || place.getY() == 7)) {
            return false;
        }
        return true;
    }

    this.getPlayableCase = function() {
        var playableCase = new Array();
        for (var i = 0; i < 8; i++) {
            for (var j = 0; j < 8; j++) {
                if (this.plateau[i][j] == 'P') {
                    playableCase.push(new place(i, j));
                }
            }
        }
        return playableCase;
    }

    this.canPlay = function(i, j) {
        if (this.plateau[i][j] == 'E') {
            var cptx;
            var cpty;
			if (this.whiteTurn) {
				var our = 'W';
				var other = 'B';
			} else {
				var our = 'B';
				var other = 'W';
			}
			if (this.checkNorth(i , j, our, other) || this.checkNorthEast(i , j, our, other) ||  this.checkNorthWest(i , j, our, other)
			    || this.checkSouth(i , j, our, other) || this.checkSouthEast(i , j, our, other) || this.checkSouthWest(i , j, our, other)
                                                      || this.checkEast(i , j, our, other) || this.checkWest(i , j, our, other)) {
                return true;   
            } else {
                return false;   
            }
        }
        return false;
    };
    
    this.checkNorth = function(i , j, our, other) {
        if (j - 1 >= 0) {
            if (this.plateau[i][j - 1] == other) {
                var bool = true;
                for (var cpt = j - 1; cpt >= 0; cpt--) {
                    if (this.plateau[i][cpt] == 'E' || this.plateau[i][cpt] == 'P') {
                        bool = false;
                    }
                    if (this.plateau[i][cpt] == our && bool) {
                        this.plateau[i][j] = 'P';
                        return true;
                    }
                }
            }
        }
    }
    
    
    this.checkSouth = function(i , j, our, other) {
        if (j + 1 < 8) {
            if (this.plateau[i][j + 1] == other) {
                var bool = true;
                for (var cpt = j + 1; cpt < 8; cpt++) {
                    if (this.plateau[i][cpt] == 'E' || this.plateau[i][cpt] == 'P') {
                        bool = false;
                    }
                    if (this.plateau[i][cpt] == our && bool) {
                        this.plateau[i][j] = 'P';
                        return true;
                    }
                }
            }
        }
    }
    
    
    this.checkEast = function(i , j, our, other) {
        if (i + 1 < 8) {
            if (this.plateau[i + 1][j] == other) {
                var bool = true;
                for (var cpt = i + 1; cpt < 8; cpt++) {
                    if (this.plateau[cpt][j] == 'E' || this.plateau[cpt][j] == 'P') {
                        bool = false;
                    }
                    if (this.plateau[cpt][j] == our && bool) {
                        this.plateau[i][j] = 'P';
                        return true;
                    }
                }
            }
        }
    }
    
    this.checkWest = function(i , j, our, other) {
        if (i - 1 >= 0) {
            if (this.plateau[i - 1][j] == other) {
                var bool = true;
                for (var cpt = i - 1; cpt >= 0; cpt--) {
                    if (this.plateau[cpt][j] == 'E' || this.plateau[cpt][j] == 'P') {
                        bool = false;
                    }
                    if (this.plateau[cpt][j] == our && bool) {
                        this.plateau[i][j] = 'P';
                        return true;
                    }
                }
            }
        }
    }
    
    this.checkNorthWest = function(i , j, our, other) {
        if (j - 1 >= 0 && i - 1 >= 0) {
            if (this.plateau[i - 1][j - 1] == other) {
                var bool = true;
                var cptN = j - 1;
                var cptW = i - 1;
                while ( cptN >= 0 && cptW >= 0) {
                    if (this.plateau[cptW][cptN] == 'E' || this.plateau[cptW][cptN] == 'P') {
                        bool = false;
                    }
                    if (this.plateau[cptW][cptN] == our && bool) {
                        this.plateau[i][j] = 'P';
                        return true;
                    }
                    cptN--;
                    cptW--;
                }
            }
        }
    }
    
    this.checkSouthEast = function(i , j, our, other) {
        if (j + 1 < 8 && i + 1 < 8) {
            if (this.plateau[i + 1][j + 1] == other) {
                var bool = true;
                var cptS = j + 1;
                var cptE = i + 1;
                while ( cptS < 8 && cptE < 8) {
                    if (this.plateau[cptE][cptS] == 'E' || this.plateau[cptE][cptS] == 'P') {
                        bool = false;
                    }
                    if (this.plateau[cptE][cptS] == our && bool) {
                        this.plateau[i][j] = 'P';
                        return true;
                    }
                    cptS++;
                    cptE++;
                }
            }
        }
    }
    
    this.checkSouthWest = function(i , j, our, other) {
         if (j + 1 < 8 && i - 1 >= 0) {
            if (this.plateau[i - 1][j + 1] == other) {
                var bool = true;
                var cptS = j + 1;
                var cptW = i - 1;
                while ( cptS < 8 && cptW >= 0) {
                    if (this.plateau[cptW][cptS] == 'E' || this.plateau[cptW][cptS] == 'P') {
                        bool = false;
                    }
                    if (this.plateau[cptW][cptS] == our && bool) {
                        this.plateau[i][j] = 'P';
                        return true;
                    }
                    cptS++;
                    cptW--;
                }
            }
        }
    }
    
    this.checkNorthEast = function(i , j, our, other) {
        if (j - 1 >= 0 && i + 1 < 8) {
            if (this.plateau[i + 1][j - 1] == other) {
                var bool = true;
                var cptN = j - 1;
                var cptE = i + 1;
                while ( cptN >= 0 && cptE < 8) {
                    if (this.plateau[cptE][cptN] == 'E' || this.plateau[cptE][cptN] == 'P') {
                        bool = false;
                    }
                    if (this.plateau[cptE][cptN] == our && bool) {
                        this.plateau[i][j] = 'P';
                        return true;
                    }
                    cptN--;
                    cptE++;
                }
            }
        }
    }
    
    this.nbPlayableCase = function() {
		var canPlayed = 0;
		for (var i = 0; i < 8; i++) {
			for (var j = 0; j < 8; j++) {
				if (this.plateau[i][j] == 'P') {
					canPlayed++;
				}
			}
		}
		return canPlayed;
	};
    
    this.getSave = function() {
        var ch ="";
        for(var i = 0; i < 8; i++) {
            for(var j = 0; j < 8; j++) {
                if (this.plateau[i][j] == 'E') {
                    ch += '-';   
                } else {
                    ch += this.plateau[i][j];    
                }
            }
        }
        return ch;
    }
    
	this.setEventById = function(id, i, j) {
        if (rever.getCase(i, j) == 'P') {
             $(id + '_' + i + '_' + j).click(function (i, j) {
                var pos = rever.getPosById($(this).attr('id'));
                if (!rever.getTurn()) {
                    rever.convertToBlack(pos[0], pos[1]);
                    rever.convertBoardToHTML("plateau");
                }
            });
        }
    };
    
    this.load = function(code, id) {
        var line = code.split('');
        var i = 0;
        for (var x = 0; x < 8; x++) {
            for (var y = 0; y < 8; y++) {
                if (line[i] == '-') {
                    this.plateau[x][y] = 'E';   
                } else {
                    this.plateau[x][y] = line[i];   
                }
                i++;
            }
        }
        this.clearCanPlay();
        for (var i = 0; i < 8; i++) {
			for (var j = 0; j < 8; j++) {
                this.canPlay(i, j);
            }
        }
		this.display(id);
        this.setEvent();
    }

    this.getScore = function(visibility) {
        var score;
        $.ajaxSetup({async: false});
        $.post("reversiGet",
            {
                game : 'reversi',
                method : 'score',
                data : visibility

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
        return tabScore;
    }

    this.getGlobalScore = function(id) {
        var tabScore = this.getScore('global');
        var i;
        var str ='<table class="table table-striped table-responsive">';
        str += '<thead>' +
            '<tr>' +
            '<th>Position</th>' +
            '<th>Pseudo</th>' +
            '<th>Score</th>' +
            '</tr>' +
            '</thead><tbody>';
        for (i = 0; i < tabScore.length; i++) {
            if (tabScore[i][1] != undefined) {
                str +='<tr>';
                str += '<td>' + (i + 1) + '</td>';
                str += '<td>' + tabScore[i][1] + '</td>';
                str += '<td>' + tabScore[i][2] + '</td>';
                str +='</tr>';
            }
        }
        str +='</tbody></table>';

        document.getElementById(id).innerHTML = str;
    }
    
    this.getPersoScore = function(id) {
        var tabScore = this.getScore('local');var i;
        var str ='<table class="table table-striped table-responsive">';
        str += '<thead>' +
            '<tr>' +
            '<th>Position</th>' +
            '<th>Score</th>' +
            '</tr>' +
            '</thead><tbody>';
        for (i = 0; i < tabScore.length; i++) {
            if (tabScore[i][1] != undefined) {
                str +='<tr>';
                str += '<td>' + (i + 1) + '</td>';
                str += '<td>' + tabScore[i][1] + '</td>';
                str +='</tr>';
            }
        }
        str +='</tbody></table>';

        document.getElementById(id).innerHTML = str;
    }
}
