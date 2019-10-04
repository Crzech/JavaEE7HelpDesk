<%-- 
    Document   : departamentos
    Created on : Sep 29, 2019, 4:47:23 PM
    Author     : christianpernillo
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.ModeloUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
        <link rel="stylesheet" href="css/general.css">
        <title>Usuarios</title>
    </head>
    <body class="departamentos departamentos_edit">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
              <div class="navbar-header">
                <a class="navbar-brand" href="general.jsp">Inicio</a>
              </div>
              <ul class="nav navbar-nav">
              </ul>
            </div>
        </nav>
        <div class="container">
            <%
                ModeloUsuario usuario = new ModeloUsuario(Integer.parseInt(request.getParameter("id_usuario")));
            %>
            <div class="row">
                <div class="col-xs-12">
                    <form action="srvUsuarioController" class="form" id="usuarios_delete" method="POST">
                        <input type="hidden" name="usuario_id" value="<%= usuario.getId_usuario() %>"/>
                        <input type="hidden" name="action_formulario" value="delete" />
                        <div class="form-group">
                            <h5>Esta seguro de eliminar este usuario?</h5>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-danger">Si</button>
                            <a href="usuarios.jsp" class="btn btn-primary">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> 
    </body>
</html>