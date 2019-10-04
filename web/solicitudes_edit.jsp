<%-- 
    Document   : departamentos
    Created on : Sep 29, 2019, 4:47:23 PM
    Author     : christianpernillo
--%>
<%@page import="Modelo.ModeloSolicitud"%>
<%@page import="Modelo.ModeloDepartamentos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
        <link rel="stylesheet" href="css/general.css">
        <title>Solicitudes</title>
    </head>
    <body class="solicitudes solicitudes_create">
        <%
                ModeloSolicitud solicitud = new ModeloSolicitud(Integer.parseInt(request.getParameter("solicitud_id")));
        %>
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
            <div class="row">
                <div class="col-xs-12">
                    <form action="srvSolicitudController" class="form" id="solicitud_create" method="POST">
                        <input type="hidden" name="solicitud_id" value="<%= solicitud.getId_solicitud() %>"/>
                        <input type="hidden" name="action_formulario" value="update" />
                        <div id="departamento_usuario_wrapper" class="form-group hide">
                            <label for="departamento_solicitud">Departamento:</label>
                            <select class="form-control" id="departamento_solicitud" name="departamento_solicitud" required>
                                <%
                                    ModeloDepartamentos modelo = new ModeloDepartamentos();
                                    ArrayList<ModeloDepartamentos> departamentos = modelo.getList();
                                    for (int counter = 0; counter < departamentos.size(); counter++) {
                                %>
                                <option 
                                    value="<%= departamentos.get(counter).id_departamento%>" 
                                    <%= departamentos.get(counter).id_departamento == solicitud.getDepartamento().getId_departamento() ? "selected" : "" %> 
                                    ><%= departamentos.get(counter).nombre_departamento%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tipo_solicitud">Tipo:</label>
                            <select class="form-control" id="tipo_solicitud" name="tipo_solicitud" required>
                                <option value="1" <%= solicitud.getTipo_solicitud() == 1 ? "selected" : "" %>>Hardware</option>
                                <option value="2" <%= solicitud.getTipo_solicitud() == 1 ? "selected" : "" %>>Software</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="descripcion_solicitud">Descripcion:</label>
                            <textarea class="form-textarea" id="descripcion_solicitud" name="descripcion_solicitud" value="<%= solicitud.getDescripcion_solicitud() %>"></textarea>
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
