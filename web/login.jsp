<%-- 
    Document   : login
    Created on : Sep 28, 2019, 8:35:42 PM
    Author     : christianpernillo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
        <link rel="stylesheet" href="css/login.css">
        <title>Login</title>
    </head>
    <body>
        <div class="cotainer">
            <div class="row login-container">
                <div class="col-xs-12 login-card col-sm-4">
                    <%
                        if(request.getAttribute("processed") != null){
                            if(Boolean.parseBoolean(request.getAttribute("error").toString()) == true) {
                              
                    %>
                    <div class="alert alert-danger">
                        Usuario/Clave incorrecta.
                    </div>
                    <%  
                            }
                        }
                        
                        
                    %>
                    
                    <form class="form" action="srvLogin" method="POST">
                        <div class="form-group">
                            <label for="username">Usuario:</label>
                            <input class="form-control" id="username" type="text" name="username">
                        </div>
                        <div class="form-group">
                            <label for="password">Contraseña:</label>
                            <input class="form-control" id="password" type="password" name="password">
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary">Ingresar</button>
                        </div>
                    </form> 
                </div>
            </div>
        </div>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> 
    </body>
</html>
