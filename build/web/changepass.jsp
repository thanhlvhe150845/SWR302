<%-- 
    Document   : changepass
    Created on : Mar 21, 2022, 8:01:16 PM
    Author     : citih
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script>
            $("input[type=password]").keyup(function () {
                var ucase = new RegExp("[A-Z]+");
                var lcase = new RegExp("[a-z]+");
                var num = new RegExp("[0-9]+");

                if ($("#password1").val().length >= 8) {
                    $("#8char").removeClass("glyphicon-remove");
                    $("#8char").addClass("glyphicon-ok");
                    $("#8char").css("color", "#00A41E");
                } else {
                    $("#8char").removeClass("glyphicon-ok");
                    $("#8char").addClass("glyphicon-remove");
                    $("#8char").css("color", "#FF0004");
                }

                if (ucase.test($("#password1").val())) {
                    $("#ucase").removeClass("glyphicon-remove");
                    $("#ucase").addClass("glyphicon-ok");
                    $("#ucase").css("color", "#00A41E");
                } else {
                    $("#ucase").removeClass("glyphicon-ok");
                    $("#ucase").addClass("glyphicon-remove");
                    $("#ucase").css("color", "#FF0004");
                }

                if (lcase.test($("#password1").val())) {
                    $("#lcase").removeClass("glyphicon-remove");
                    $("#lcase").addClass("glyphicon-ok");
                    $("#lcase").css("color", "#00A41E");
                } else {
                    $("#lcase").removeClass("glyphicon-ok");
                    $("#lcase").addClass("glyphicon-remove");
                    $("#lcase").css("color", "#FF0004");
                }

                if (num.test($("#password1").val())) {
                    $("#num").removeClass("glyphicon-remove");
                    $("#num").addClass("glyphicon-ok");
                    $("#num").css("color", "#00A41E");
                } else {
                    $("#num").removeClass("glyphicon-ok");
                    $("#num").addClass("glyphicon-remove");
                    $("#num").css("color", "#FF0004");
                }

                if ($("#password1").val() == $("#password2").val()) {
                    $("#pwmatch").removeClass("glyphicon-remove");
                    $("#pwmatch").addClass("glyphicon-ok");
                    $("#pwmatch").css("color", "#00A41E");
                } else {
                    $("#pwmatch").removeClass("glyphicon-ok");
                    $("#pwmatch").addClass("glyphicon-remove");
                    $("#pwmatch").css("color", "#FF0004");
                }
            });
        </script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1>Change Password</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <p class="text-center">Use the form below to change your password. Your password cannot be the same as your username.</p>
                    <p style="color: red">${requestScope.error}</p>
                    <form action="changepass" >
                        <input type="password" class="input-lg form-control" name="oldpass"  placeholder="Old Password" autocomplete="off">
                        <input type="password" class="input-lg form-control" name="pass"  placeholder="New Password" autocomplete="off">
                       
                        <input type="password" class="input-lg form-control" name="repass"  placeholder="Repeat Password" autocomplete="off">
                        
                        <input type="submit" class="col-xs-12 btn btn-primary btn-load btn-lg" >
                    </form>
                </div><!--/col-sm-6-->
            </div><!--/row-->
        </div>
    </body>
</html>
