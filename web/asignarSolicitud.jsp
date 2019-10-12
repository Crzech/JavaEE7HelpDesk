<%-- 
    Document   : departamentos
    Created on : Sep 29, 2019, 4:47:23 PM
    Author     : christianpernillo
--%>
<%@page import="Modelo.ModeloSolicitud"%>
<%@page import="Modelo.ModeloUsuario"%>
<%@page import="Modelo.ModeloDepartamentos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
        <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/general.css">
        <title>Solicitudes</title>
    </head>
    <body class="solicitudes solicitudes_create">
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
                ModeloSolicitud solicitud = new ModeloSolicitud(Integer.parseInt(request.getParameter("solicitud_id")));
            %>
            <div class="row">
                <div class="col-xs-12">
                    <form action="srvSolicitudController" class="form" id="solicitud_create" method="POST">
                        <input type="hidden" name="solicitud_id" value="<%= solicitud.getId_solicitud() %>"/>
                        <input type="hidden" name="action_formulario" value="asignar" />
                        <div class="form-group">
                            <label for="idUsuario">Usuario:</label>
                            <select class="form-control" id="idUsuario" name="idUsuario" required>
                                <%
                                    ModeloUsuario modeloUsuario = new ModeloUsuario();
                                    ArrayList<ModeloUsuario> usuarios = modeloUsuario.getByDepartamento(solicitud.getDepartamento().getId_departamento(), true);
                                    for (int counter = 0; counter < usuarios.size(); counter++) {
                                %>
                                <option value="<%= usuarios.get(counter).getId_usuario()%>"><%= usuarios.get(counter).getNombre() + " " + usuarios.get(counter).getApellido()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="fechaFinal">Fecha limite de tarea:</label>
                            <input class="form-control" type="date" id="fechaFinal" name="fechaFinal" />
                        </div>
                        <div class="form-group">
                            <label for="tipo_solicitud">Prioridad:</label>
                            <select class="form-control" id="prioridadSolicitud" name="prioridadSolicitud" required>
                                <option value="1">Alta</option>
                                <option value="2">Media</option>
                                <option value="3">Baja</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>   </body>
</html>
