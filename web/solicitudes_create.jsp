<%-- 
    Document   : departamentos
    Created on : Sep 29, 2019, 4:47:23 PM
    Author     : christianpernillo
--%>
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
                <ul class="nav navbar-nav">
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <form action="srvSolicitudController" class="form" id="solicitud_create" method="POST">
                        <div id="departamento_usuario_wrapper" class="form-group hide">
                            <label for="departamento_solicitud">Departamento:</label>
                            <select class="form-control" id="departamento_solicitud" name="departamento_solicitud" required>
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
                            <label for="tipo_solicitud">Tipo:</label>
                            <select class="form-control" id="tipo_solicitud" name="tipo_solicitud" required>
                                <option value="1">Hardware</option>
                                <option value="2">Software</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="descripcion_solicitud">Descripcion:</label>
                            <textarea class="form-textarea" id="descripcion_solicitud" name="descripcion_solicitud"></textarea>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script type="text/javascript">
            $(document).on('change', '#perfil_usuario', function () {
                var id_perfil = parseInt($(this).val());
                if (id_perfil === 3) {
                    $('#departamento_usuario_wrapper').removeClass('hide');
                } else {
                    $('#departamento_usuario_wrapper').addClass('hide');
                }

            });
        </script>

    </body>
</html>
