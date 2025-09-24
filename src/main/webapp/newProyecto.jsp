<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gantt Project - Nuevo Proyecto</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <%@include file="menu.jsp" %>
        
        <form name="frmProyecto" action="srvInsertProyecto" method="POST" class="contenedor-formulario">
            <div>
                <div class="formulario card border-primary">
                    <div class="card-header formulario-header">
                        <label class="p-2">Nuevo Proyecto</label>
                    </div>
                    
                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Nombre del Proyecto</label>
                            <input type="text" required class="form-control mb-2" id="nombre" name="nombre" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Descripcion</label>
                            <input type="text" required class="form-control mb-2" id="descripcion" name="descripcion" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Fecha de inicio</label>
                            <input type="date" required class="form-control mb-2" id="fechaInicio" name="fechaInicio" />
                        </div>
                    </div>
                    
                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Fecha de finalizacion</label>
                            <input type="date" required class="form-control mb-2" id="fechaFinalizacion" name="fechaFinalizacion" />
                        </div>
                    </div>
                    
                    <div class="contenedor-btn">
                        <button type="submit" class="btn btn-primary btn-guardar">Guardar</button>
                    </div>

                </div>
            </div>
            
        </form>
        
        <%
            Integer respuesta = (Integer) session.getAttribute("respuestaProyecto");
            if (respuesta != null) 
            {
                if (respuesta == 1)
                {
                    %>
                    <script>
                        swal("Proyecto agregado", "El proyecto fue creado con éxito" , "success");
                    </script>
                    <%
                }
                else 
                {
                    %>
                    <script>
                        swal("Proyecto no fue agregado", "Revisa los datos por favor." , "error");
                    </script>
                    <%
                }
        
                session.removeAttribute("respuestaProyecto");
            }
        %>
    </body>
</html>
