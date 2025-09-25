<%@page import="Modelo.Tarea"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.SrvTarea_Service"%>
<%@page import="Modelo.Proyecto"%>
<%@page import="Modelo.SrvProyecto_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gantt Project - Nueva Actividad</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <%@include file="menu.jsp" %>
        
        <form name="frmActividad" action="srvInsertActividad" method="POST" class="contenedor-formulario">
            <div>
                <div class="formulario card border-primary">
                    <div class="card-header formulario-header">
                        <label class="p-2">Nueva Actividad</label>
                    </div>
                    
                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Nombre de la Actividad</label>
                            <input type="text" required class="form-control mb-2" id="nombre" name="nombre" />
                        </div>
                    </div>
                    
                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Actividad - Proyecto</label>
                            <!--<input type="text" required class="form-control mb-2" id="idProyecto" name="idProyecto" />-->
                            
                            <select type="text" required class="form-control mb-2 lista-opciones" id="idProyecto" name="idProyecto">
                                <option selected disabled>-- Seleccionar opción --</option>
                                <%
                                    SrvTarea_Service tareaService = new SrvTarea_Service();
                                    SrvProyecto_Service proyectoService = new SrvProyecto_Service();

                                    List<Tarea> tareas = tareaService.getSrvTareaPort().listarTarea();
                                    List<Proyecto> proyectos = proyectoService.getSrvProyectoPort().listarProyecto();

                                    for (int i = 0; i < tareas.size(); i++) 
                                    {
                                        Tarea t = tareas.get(i);
                                        Proyecto p = proyectoService.getSrvProyectoPort().listarProyectoPorID(t.getIdProyecto());

                                        %>
                                        <option value="<%= t.getIdTarea()%>"><%= t.getNombre() + " - " + p.getNombre() %></option>
                                        
                                        <%
                                    }
                                %>
                            </select>
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
            Integer respuesta = (Integer) session.getAttribute("respuestaActividad");
            if (respuesta != null) {
                if (respuesta == 1) 
                {
                    %>
                    <script>
                        swal("Actividad agregada", "La actividad fue creada con éxito", "success");
                    </script>
                    <%
                } 
                else 
                {
                    %>
                    <script>
                        swal("Error", "La actividad no fue agregada. Revisa los datos.", "error");
                    </script>
                    <%
                }
                session.removeAttribute("respuestaActividad");
            }
        %>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
