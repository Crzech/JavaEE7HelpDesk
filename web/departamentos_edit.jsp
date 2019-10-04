<%-- 
    Document   : departamentos
    Created on : Sep 29, 2019, 4:47:23 PM
    Author     : christianpernillo
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.ModeloDepartamentos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
        <link rel="stylesheet" href="css/general.css">
        <title>Departamentos</title>
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
                ModeloDepartamentos departamento = new ModeloDepartamentos(Integer.parseInt(request.getParameter("id_departamento")));
            %>
            <div class="row">
                <div class="col-xs-12">
                    <form action="srvDepartamentosSave" class="form" id="departamento_create" method="POST">
                        <input type="hidden" name="departamento_id" value="<%= departamento.getId_departamento() %>"/>
                        <input type="hidden" name="action_formulario" value="update" />
                        <div class="form-group">
                            <label for="nombre_departamento">Nombre:</label>
                            <input class="form-control" id="nombre_departamento" name="nombre_departamento" value="<%= departamento.getNombre_departamento() %>" class="nombre_departamento" />
                        </div>
                        <div class="form-group">
                            <button class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Guardar </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> 
    </body>
</html>