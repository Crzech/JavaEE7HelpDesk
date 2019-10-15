<%-- 
    Document   : departamentos
    Created on : Sep 29, 2019, 4:47:23 PM
    Author     : christianpernillo
--%>
<%@page import="Modelo.ModeloResolucionAsignacion"%>
<%@page import="Modelo.ModeloSolicitudAsignacion"%>
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
        <title>Asignaciones</title>
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
            ModeloSolicitudAsignacion modelo = new ModeloSolicitudAsignacion();
            ArrayList<ModeloSolicitudAsignacion> asignaciones = modelo.getList(usuario.getId_usuario());

            ModeloResolucionAsignacion modelo_resoluciones = new ModeloResolucionAsignacion();
            ArrayList<ModeloResolucionAsignacion> lista_resueltas = modelo_resoluciones.getList(usuario.getId_usuario());
            
            String test = modelo_resoluciones.testList(usuario.getId_usuario());
        %>
        <div class="container">
            <%= test %>
            <div class="row">
                <div class="col-xs-12">
                    <h1 class="text-center">Solicitudes pendientes</h1>
                    <div class="list-group">
                        <%
                            for (int counter = 0; counter < asignaciones.size(); counter++) {
                                long yourSeconds = asignaciones.get(counter).getFecha_final();
                                DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                                Date d1 = new Date(yourSeconds * 1000);

                                String asignacion_class = "";
                                switch (asignaciones.get(counter).getPrioridad()) {
                                    case 1:
                                        asignacion_class = "list-group-item-danger";
                                        break;
                                    case 2:
                                        asignacion_class = "list-group-item-warning";
                                        break;
                                    default:
                                        asignacion_class = "list-group-item-success";
                                        break;
                                }


                        %>
                        <a href="finalizarSolicitud.jsp?asignacion_id=<%= asignaciones.get(counter).getId_solicitud_asignacion()%>" class="list-group-item <%= asignacion_class%>"><%= asignaciones.get(counter).getSolicitud().getDescripcion_solicitud()%> - <%= df.format(d1)%></a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h1 class="text-center">Solicitudes resueltas</h1>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Descripcion</th>
                                    <th>Fecha de asignacion</th>
                                    <th>Fecha de resolucion</th>
                                    <th>Resolucion o procedimiento a seguir</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (int counter = 0; counter < lista_resueltas.size(); counter++) {
                                        long fecha_final = lista_resueltas.get(counter).getFecha();
                                        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                                        Date d1 = new Date(fecha_final * 1000);

                                        long fecha_inicio = lista_resueltas.get(counter).getAsignacion().getFecha_asignacion();
                                        Date d2 = new Date(fecha_inicio * 1000);
                                %>
                                <tr>
                                    <td><%= (counter + 1)%></td>
                                    <td><%= lista_resueltas.get(counter).getAsignacion().getSolicitud().getDescripcion_solicitud()%></td>
                                    <td><%= df.format(d2)%></td>
                                    <td><%= df.format(d1)%></td>
                                    <td><%=  lista_resueltas.get(counter).getDescripcion()%></td>

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
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <%
        if (request.getAttribute("processed") != null) {

            int result = Integer.parseInt(request.getAttribute("result").toString());
            switch (result) {
                case 1:
    %>
    <script type="text/javascript">
        Swal.fire(
                'Exito',
                'El ticket ha sido solventado',
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

        }

    %>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> 
</body>
</html>
