<%-- 
    Document   : departamentos
    Created on : Sep 29, 2019, 4:47:23 PM
    Author     : christianpernillo
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.ModeloSolicitud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
        <link rel="stylesheet" href="css/general.css">
        <title>Solicitudes</title>
    </head>
    <body class="solicitudes solicitudes_delete">
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
                ModeloSolicitud solicitud = new ModeloSolicitud(Integer.parseInt(request.getParameter("solicitud_id")));
            %>
            <div class="row">
                <div class="col-xs-12">
                    <form action="srvSolicitudController" class="form" id="solicitud_delete" method="POST">
                        <input type="hidden" name="solicitud_id" value="<%= solicitud.getId_solicitud()%>"/>
                        <input type="hidden" name="action_formulario" value="delete" />
                        <div class="form-group">
                            <h5>Esta seguro de eliminar esta solicitud?</h5>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-danger">Si</button>
                            <a href="solicitudes.jsp" class="btn btn-primary">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> 
    </body>
</html>