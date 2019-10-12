<%-- 
    Document   : general
    Created on : Sep 29, 2019, 1:04:11 AM
    Author     : christianpernillo
--%>

<%@page import="Modelo.ModeloUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
        <link rel="stylesheet" href="css/general.css">
        <title>Inicio</title>
    </head>
    <body>
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
        <%--<jsp:include page="/srvGeneral" flush="true" />--%>
        <%
            String username = session.getAttribute("username").toString();
            ModeloUsuario usuario = new ModeloUsuario(username);
        %>
        <div class="container">
            <div class="row">
                <%
                    if (usuario.getPerfil() == 1) {
                %>
                <a href="departamentos.jsp">
                    <div class="col-sm-4">
                        <div class="text-center">
                            <div class="section-general-wrapper">
                                <div class="icon-center-wrapper"><i class="glyphicon glyphicon-th"></i></div>
                                <div class="text-general-card"><h3>Departamentos</h3></div>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="usuarios.jsp">
                    <div class="col-sm-4">
                        <div class="text-center">
                            <div class="section-general-wrapper">
                                <div class="icon-center-wrapper"><i class="glyphicon glyphicon-user"></i></div>
                                <div class="text-general-card"><h3>Usuarios</h3></div>
                            </div>
                        </div>
                    </div>
                </a>
                <%
                    }
                    if (usuario.getPerfil() == 2 || usuario.getPerfil() == 1) {
                %>
                <a href="solicitudes.jsp">
                    <div class="col-sm-4">
                        <div class="text-center">
                            <div class="section-general-wrapper">
                                <div class="icon-center-wrapper"><i class="glyphicon glyphicon-list-alt	"></i></div>
                                <div class="text-general-card"><h3>Solicitudes</h3></div>
                            </div>
                        </div>
                    </div>
                </a>
                <%
                    }
                    if (usuario.getPerfil() == 3) {
                %>
                <a href="solicitudes_cola.jsp">
                    <div class="col-sm-4">
                        <div class="text-center">
                            <div class="section-general-wrapper">
                                <div class="icon-center-wrapper"><i class="glyphicon glyphicon-list-alt	"></i></div>
                                <div class="text-general-card"><h3>Solicitudes</h3></div>
                            </div>
                        </div>
                    </div>
                </a>
                <%
                    }
                %>


            </div>
        </div>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> 
    </body>
</html>
