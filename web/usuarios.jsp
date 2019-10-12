<%-- 
    Document   : departamentos
    Created on : Sep 29, 2019, 4:47:23 PM
    Author     : christianpernillo
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.ModeloUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
        <link rel="stylesheet" href="css/general.css">
        <title>Usuarios</title>
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
            ModeloUsuario modelo = new ModeloUsuario();
            ArrayList<ModeloUsuario> usuarios = modelo.getList();
        %>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-right">
                    <a href="usuarios_create.jsp" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Agregar</a>
                </div>
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Nombre de usuario</th>
                                    <th>Departamento</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (int counter = 0; counter < usuarios.size(); counter++) { 		      

                                %>
                                <tr>
                                    <td><%= (counter + 1) %></td>
                                    <td><%= usuarios.get(counter).getNombre() %></td>
                                    <td><%= usuarios.get(counter).getApellido() %></td>
                                    <td><%= usuarios.get(counter).getUsername() %></td>
                                    <td><%= usuarios.get(counter).getDepartamento().getNombre_departamento() %></td>
                                    <td><a href="usuarios_edit.jsp?id_usuario=<%= usuarios.get(counter).getId_usuario() %>" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></a></td>
                                    <td><a href="usuarios_delete.jsp?id_usuario=<%= usuarios.get(counter).getId_usuario() %>" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></a></td>
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
            if(request.getAttribute("processed") != null) {
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
                                            'Se ha creado el usuario correctamente',
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
                                            'El nombre de usuario esta en uso, por favor elegir uno diferente',
                                            'error'
                                        );
                                    </script>
                                <%
                                break;
                            case 3:
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
                                            'Se han guardado correctamente los datos del usuario',
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
                                            'El nombre de usuario esta en uso, por favor elegir uno diferente',
                                            'error'
                                        );
                                    </script>
                                <%
                                break;
                            case 3:
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
                                            'Usuario eliminado correctamente',
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
