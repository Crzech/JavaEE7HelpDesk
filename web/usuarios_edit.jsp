<%-- 
    Document   : departamentos
    Created on : Sep 29, 2019, 4:47:23 PM
    Author     : christianpernillo
--%>
<%@page import="Modelo.ModeloDepartamentos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.ModeloUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
        <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/general.css">
        <title>Usuarios</title>
    </head>
    <body class="usuarios usuarios_edit">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="general.jsp">Inicio</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="srvLogoutController"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <%
                ModeloUsuario usuario = new ModeloUsuario(Integer.parseInt(request.getParameter("id_usuario")));
            %>
            <div class="row">
                <div class="col-xs-12">
                    <form action="srvUsuarioController" class="form" id="usuario_edit" method="POST">
                        <input type="hidden" name="usuario_id" value="<%= usuario.getId_usuario()%>"/>
                        <input type="hidden" name="action_formulario" value="update" />
                        <div class="form-group">
                            <label for="nombre_usuario">Nombre:</label>
                            <input class="form-control" id="nombre_usuario" name="nombre_usuario" type="text" value="<%= usuario.getNombre()%>" required/>
                        </div>
                        <div class="form-group">
                            <label for="apellido_usuario">Apellido:</label>
                            <input class="form-control" id="apellido_usuario" name="apellido_usuario" type="text" value="<%= usuario.getApellido()%>" required/>
                        </div>
                        <div class="form-group">
                            <label for="username_usuario">Nombre de usuario:</label>
                            <input class="form-control" id="username_usuario" name="username_usuario" type="text" value="<%= usuario.getUsername()%>" required/>
                        </div>
                        <div class="form-group">
                            <label for="password_usuario">Contraseña:</label>
                            <input class="form-control" id="password_usuario" name="password_usuario" type="password" required/>
                        </div>
                        <div class="form-group">
                            <label for="perfil_usuario">Perfil:</label>
                            <select class="form-control" id="perfil_usuario" name="perfil_usuario" required>
                                <option value="1" <%= usuario.getPerfil() == 1 ? "selected" : ""%>>Administrador</option>
                                <option value="2" <%= usuario.getPerfil() == 2 ? "selected" : ""%>>Solicitante</option>
                                <option value="3" <%= usuario.getPerfil() == 3 ? "selected" : ""%>>Experto</option>
                            </select>
                        </div>
                        <div id="departamento_usuario_wrapper" class="form-group">
                            <label for="departamento_usuario">Departamento</label>
                            <select class="form-control" id="departamento_usuario" name="departamento_usuario" required>
                                <%
                                    ModeloDepartamentos modelo = new ModeloDepartamentos();
                                    ArrayList<ModeloDepartamentos> departamentos = modelo.getList();
                                    for (int counter = 0; counter < departamentos.size(); counter++) {
                                %>
                                <option value="<%= departamentos.get(counter).id_departamento%>"><%= departamentos.get(counter).nombre_departamento%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    </body>
</html>
