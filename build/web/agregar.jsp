<%-- 
    Document   : agregar
    Created on : 05-dic-2022, 9:30:57
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar</title>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    </head>
    <body>
        
        <div class="container">
            
            <div class="card">
                <div class="card-header">
                    <h3> Agregar Estudiantes </h3>
                    
                </div>
                
                <div class="card-body">
                    <form action="Controlador">
                        <label>Cedula</label>
                        <input type="text" name="cedula" class="form-control" placeholder="Cedula">
                        <label>Nombre</label>
                        <input type="text" name="nombre" class="form-control" placeholder="Nombre">
                        <label>Apellido</label>
                        <input type="text" name="apellido" class="form-control" placeholder="Apellido">
                        <label>Telefono</label>
                        <input type="text" name="telefono" class="form-control" placeholder="Telefono">
                        <label>Direccion</label>
                        <input type="text" name="direccion" class="form-control" placeholder="Direccion">
                        
                        <input type="submit" name="accion" value="Guardar" class="btn btn-primary mt4">
                        
                    </form>
                    
                    
                </div>
                
            </div>
            
        </div>
        
        
    </body>
</html>
