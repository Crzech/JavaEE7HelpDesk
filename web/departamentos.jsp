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
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
        <link rel="stylesheet" href="css/general.css">
        <title>Departamentos</title>
    </head>
    <body class="departamentos">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
              <div class="navbar-header">
                <a class="navbar-brand" href="general.jsp">Inicio</a>
              </div>
              <ul class="nav navbar-nav">
              </ul>
            </div>
        </nav>
        <%
            ModeloDepartamentos modelo = new ModeloDepartamentos();
            ArrayList<ModeloDepartamentos> departamentos = modelo.getList();
        %>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-right">
                    <a href="departament_create.jsp" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Agregar</a>
                </div>
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Nombre</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (int counter = 0; counter < departamentos.size(); counter++) { 		      

                                %>
                                <tr>
                                    <td><%= (counter + 1) %></td>
                                    <td><%= departamentos.get(counter).nombre_departamento %></td>
                                    <td><a href="departamentos_edit.jsp?id_departamento=<%= departamentos.get(counter).id_departamento %>" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></a></td>
                                    <td><a href="departamentos_delete.jsp?id_departamento=<%= departamentos.get(counter).id_departamento %>" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></a></td>
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
            if(request.getAttribute("departamento_processed") != null) {
                if(request.getAttribute("processed_delete") == null) {
                    if(Boolean.parseBoolean(request.getAttribute("departamento_saved").toString()) == false) {
                        %>
                        <script type="text/javascript">
                            Swal.fire(
                                'Error',
                                'Tenemos problemas de conexion con el servidor, intentelo de nuevo',
                                'error'
                            );
                        </script>
                        <%
                    } else {
                       %>
                        <script type="text/javascript">
                            Swal.fire(
                                'Exito',
                                'Departamento guardado correctamente',
                                'success'
                            );
                        </script>
                        <%
                    }
                } else {
                    if(Boolean.parseBoolean(request.getAttribute("departamento_deleted").toString()) == false) {
                        %>
                        <script type="text/javascript">
                            Swal.fire(
                                'Error',
                                'Tenemos problemas de conexion con el servidor, intentelo de nuevo',
                                'error'
                            );
                        </script>
                        <%
                    } else {
                       %>
                        <script type="text/javascript">
                            Swal.fire(
                                'Exito',
                                'Departamento eliminado correctamente',
                                'success'
                            );
                        </script>
                        <%
                    }
                }
            }
        %>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> 
    </body>
</html>
