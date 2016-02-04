var session = true;
var pseudo;
var iaColor;
var boardColor;
var playerColor;
var help;
$.ajaxSetup({async: false});
$.post("reversiGet",
    {
        game : 'reversi',
        method : 'param',
        data : 'reversiIAColor'

    },
    function(data, status){
        iaColor = data;
    });

$.post("reversiGet",
    {
        game : 'reversi',
        method : 'param',
        data : 'reversiBoardColor'

    },
    function(data, status){
        boardColor = data;
    });

$.post("reversiGet",
    {
        game : 'reversi',
        method : 'param',
        data : 'reversiUserColor'

    },
    function(data, status){
        playerColor = data;
    });

$.post("reversiGet",
    {
        game : 'reversi',
        method : 'param',
        data : 'reversiHelp'

    },
    function(data, status){
        help = data;
    });