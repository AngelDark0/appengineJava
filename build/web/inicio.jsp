<%-- 
    Document   : index
    Created on : 28-nov-2022, 11:37:06
    Author     : Admin
--%>

<%@page import="okhttp3.FormBody"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="model.Cliente"%>
<%@page import="okhttp3.RequestBody"%>
<%@page import="okhttp3.FormBody"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOA</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <h3> Estudiantes </h3>
            <div class="card">
                <div class="card-header">
                    <a href="Controlador?accion=agregar" class="btn btn-primary">Nuevo Estudiante</a>
                    <a href="Controlador?accion=cerrar" class="btn btn-primary">Logout</a>
                </div>
                <div>
                    <form class="form-inline">
                        <label>Ingrese la cedula: </label>
                        <input  class="form-control"
                                type="text" value="" name="cedulaE" class ="form-control"  >
                        <input class="form-primary" type="submit" value="Buscar" name="accion">
                        <input class="form-primary" type="submit" value="Cancelar" name="accion">
                        
                    </form>
                </div>

                <div class="card-body">
                    <table class="table table-hover">
                        <thead>
                        <th>Cedula</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Telefono</th>
                        <th>Direccion</th>
                        </thead>
                        <tbody>
                            <%

                                Cliente cliente = new Cliente();
                                
                       
                                    JSONObject res = cliente.getJSON("http://34.133.153.173/pruebaservicios/models/select.php");
                                    JSONArray estudiantes = (JSONArray) res.get("estudiantes");
                                    for (int i = 0; i < estudiantes.length(); i++) {
                                        JSONObject estu = (JSONObject) estudiantes.get(i);


                            %>
                            <tr>
                                <td><%=estu.getString("est_cedula")%></td>
                                <td><%=estu.getString("est_nombre")%></td>
                                <td><%=estu.getString("est_apellido")%></td>
                                <td><%=estu.getString("est_telefono")%></td>
                                <td><%=estu.getString("est_direccion")%></td>
                                <td>
                                    <a href="Controlador?accion=editar&cedula=<%=estu.getString("est_cedula")%>" class="btn btn-warning">Editar</a>
                                    <a href="Controlador?accion=eliminar&cedula=<%=estu.getString("est_cedula")%>" class="btn btn-danger">Eliminar</a>
                                </td>




                            </tr>
                            <% 
                                }%>
                        </tbody>

                    </table>

                </div>

            </div>

        </div>

    </body>
</html>
