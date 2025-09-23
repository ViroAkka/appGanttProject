<%-- 
    Document   : mantenimientoProveedor
    Created on : 18/09/2025, 10:51:49 AM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Proyecto</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <%@include file="index.jsp" %>
        
        <h2 class="table-title">Mantenimiento de Proyectos</h2>
        <form method="post" action="" class="contenedor tabla-mantenimiento">
            <div class="card border-primary tabla-principal">
                <div class="card-header d-flex justify-content-between">
                    <div>
                        <label class="p-2">Proyecto</label>
                        <input type="text" id="idProyecto" name="idProyecto" placeholder="" />
                        <button type="submit" class="btn btn-primary">Buscar</button>
                    </div>
                    <div>
                        <!--
                        <button onclick="location.href = '@Url.Action("ExportarPDF", "Reportes", new {nombreDataSet = "Deporte"} )'; return false" class="btn btn-primary">Crear Reporte PDF</button>
                        <button onclick="location.href = '@Url.Action("ExportarExcel", "Reportes", new {nombreDataSet = "Deporte"} )'; return false" class="btn btn-primary">Crear Reporte Excel</button> 
                        -->
                    </div>
                </div>

                <table class="table-dark" border="1">
                    <thead>
                        <tr>
                            <th><b>ID Proyecto</b></th>
                            <th><b>Nombre</b></th>
                            <th><b>Descripción</b></th>
                            <th><b>Fecha de Inicio</b></th>
                            <th><b>Fecha de Fin</b></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>

                    <tbody class="datos">
                        
                    </tbody>
                </table>
            </div>
        </form>
    </body>
</html>
