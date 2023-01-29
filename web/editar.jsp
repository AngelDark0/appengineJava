<%-- 
    Document   : editar
    Created on : 05-dic-2022, 10:56:35
    Author     : Admin
--%>

<%@page import="okhttp3.FormBody"%>
<%@page import="okhttp3.RequestBody"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    </head>
    <body>
        <h5>Actualizar Estudiante</h5>
        <div class="container">

            <div class="card">
                <div class="card-header">


                </div>
                <%
                    Cliente cliente = new Cliente();
                    String cedula = request.getParameter("cedula").toString();

                    RequestBody requestBody = new FormBody.Builder()
                            .add("cedula", cedula).build();

                    JSONObject datos = cliente.postJSON("http://34.133.153.173/pruebaservicios/models/buscar.php", requestBody);
                    JSONArray estudiante = (JSONArray) datos.get("estudiantes");
                    for (int i = 0; i < estudiante.length(); i++) {
                        JSONObject estu = (JSONObject) estudiante.get(i);


                %>

                <div class="card-body">
                    <form action="Controlador">
                        <label>Cedula</label>
                        <input type="text" name="cedula" class="form-control" value="<%=estu.getString("est_cedula")%>" readonly>
                        <label>Nombre</label>
                        <input type="text" name="nombre" class="form-control" value="<%=estu.getString("est_nombre")%>" >
                        <label>Apellido</label>
                        <input type="text" name="apellido" class="form-control"  value="<%=estu.getString("est_apellido")%>">
                        <label>Telefono</label>
                        <input type="text" name="telefono" class="form-control" value="<%=estu.getString("est_telefono")%>">
                        <label>Direccion</label>
                        <input type="text" name="direccion" class="form-control" value="<%=estu.getString("est_direccion")%>">

                        <input type="submit" name="accion" value="Actualizar" class="btn btn-primary mt4">

                    </form>


                </div>
                <%
                    }


                %>

            </div>

        </div>
    </body>
</html>
