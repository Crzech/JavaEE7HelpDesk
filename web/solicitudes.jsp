<%-- 
    Document   : departamentos
    Created on : Sep 29, 2019, 4:47:23 PM
    Author     : christianpernillo
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="Modelo.ModeloUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.ModeloSolicitud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
        <link rel="stylesheet" href="css/general.css">
        <title>Solicitudes</title>
    </head>
    <body class="usuarios">
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
        <%
            String username = session.getAttribute("username").toString();
            ModeloUsuario usuario = new ModeloUsuario(username);
            ModeloSolicitud modelo = new ModeloSolicitud();
            ArrayList<ModeloSolicitud> solicitudes = modelo.getList(usuario.getId_usuario());
        %>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-right">
                    <a href="solicitudes_create.jsp" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Agregar</a>
                </div>
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Departamento</th>
                                    <th>Tipo Solicitud</th>
                                    <th>Descripcion solicitud</th>
                                    <th>Fecha de creacion</th>
                                    <th>Estado</th>
                                    <th></th>
                                    <th></th>
                                        <%
                                            if (usuario.getPerfil() == 1) {
                                        %>
                                    <th></th>
                                        <%
                                            }
                                        %>
                                    <%
                                        if(usuario.getPerfil() == 3) {
                                    %>
                                    <th></th>
                                    <%
                                        }
                                    %>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (int counter = 0; counter < solicitudes.size(); counter++) {
                                        long yourSeconds = solicitudes.get(counter).getFecha_creacion();
                                        DateFormat df = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
                                        Date d = new Date(yourSeconds * 1000);

                                %>
                                <tr>
                                    <td><%= (counter + 1)%></td>
                                    <td><%= solicitudes.get(counter).getDepartamento().getNombre_departamento()%></td>
                                    <td><%= solicitudes.get(counter).getTipo_solicitud() == 1 ? "Software" : "Hardware"%></td>
                                    <td><%= solicitudes.get(counter).getDescripcion_solicitud()%></td>
                                    <td><%= df.format(d)%></td>
                                    <td><%= solicitudes.get(counter).getEstado() <= 1 ? "Sin asignar" : "En proceso"%></td>
                                    <td><a href="solicitudes_edit.jsp?solicitud_id=<%= solicitudes.get(counter).getId_solicitud()%>" <%= solicitudes.get(counter).getEstado() != 1 ? "disabled" : ""  %> class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span></a></td>
                                    <td><a href="solicitud_delete.jsp?solicitud_id=<%= solicitudes.get(counter).getId_solicitud()%>" <%= solicitudes.get(counter).getEstado() != 1 ? "disabled" : ""  %> class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>
                                    <%
                                        if (usuario.getPerfil() == 1) {
                                            if (solicitudes.get(counter).getEstado() == 1) {
                                    %>
                                    <td><a href="asignarSolicitud.jsp?solicitud_id=<%= solicitudes.get(counter).getId_solicitud()%>" class="btn btn-success">Asignar</a></td>
                                    <%
                                            }
                                        }
                                    %>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        <%
            if (request.getAttribute("processed") != null) {
                int action = Integer.parseInt(request.getAttribute("action").toString());
                int result = Integer.parseInt(request.getAttribute("result").toString());
                switch (action) {
                    case 1:
                        switch (result) {
                            case 1:
        %>
        <script type="text/javascript">
            Swal.fire(
                    'Exito',
                    'Se han guardado correctamente los datos de la solicitud',
                    'success'
                    );
        </script>
        <%
                break;
            case 2:
        %>
        <script type="text/javascript">
            Swal.fire(
                    'Error',
                    'Tenemos problemas de conexion con el servidor, intentelo de nuevo',
                    'error'
                    );
        </script>
        <%
                        break;
                }
                break;
            case 2:
                switch (result) {
                    case 1:
        %>
        <script type="text/javascript">
            Swal.fire(
                    'Exito',
                    'Se han guardado correctamente los datos de la solicitud',
                    'success'
                    );
        </script>
        <%
                break;
            case 2:
        %>
        <script type="text/javascript">
            Swal.fire(
                    'Error',
                    'Tenemos problemas de conexion con el servidor, intentelo de nuevo',
                    'error'
                    );
        </script>
        <%
                        break;
                }
                break;
            case 3:
                switch (result) {
                    case 1:
        %>
        <script type="text/javascript">
            Swal.fire(
                    'Exito',
                    'Se ha eliminado la solicitud del sistema',
                    'success'
                    );
        </script>
        <%
                break;
            case 2:
        %>
        <script type="text/javascript">
            Swal.fire(
                    'Error',
                    'Tenemos problemas de conexion con el servidor, intentelo de nuevo',
                    'error'
                    );
        </script>
        <%
                        break;
                }
                break;
            case 4:
                switch (result) {
                    case 1:
        %>
        <script type="text/javascript">
            Swal.fire(
                    'Exito',
                    'Se ha asignado el ticket correctamente',
                    'success'
                    );
        </script>
        <%
                break;
            case 2:
        %>
        <script type="text/javascript">
            Swal.fire(
                    'Error',
                    'Tenemos problemas de conexion con el servidor, intentelo de nuevo',
                    'error'
                    );
        </script>
        <%
                                break;
                        }
                        break;
                }
            }
        %>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> 
    </body>
</html>
