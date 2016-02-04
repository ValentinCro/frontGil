/**
 * Created by valentin on 22/11/2015.
 */

$("#username").keyup(function () {
    $.post("signup_check_login",{
            login : $("#username").val()
        },
        function (data, status) {
            if (!data) {
                $("#stateLogin").attr('class','glyphicon glyphicon-ok form-control-feedback');
            } else {
                $("#stateLogin").attr('class','glyphicon glyphicon-remove form-control-feedback');
            }
        }
    )
});

$( '#password, #password2').keyup(function() {
    verifPass();
});

function verifPass() {
    if ($( '#password' ).val() == $( '#password2' ).val()) {
        $("#statePass, #statePass2").attr('class','glyphicon glyphicon-ok form-control-feedback');
    } else {
        $("#statePass, #statePass2").attr('class','glyphicon glyphicon-remove form-control-feedback');
    }
}