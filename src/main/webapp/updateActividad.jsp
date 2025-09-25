<%@page import="Modelo.Tarea"%>
<%@page import="Modelo.SrvTarea_Service"%>
<%@page import="Modelo.Proyecto"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.SrvProyecto_Service"%>
<%@page import="Modelo.SrvActividad_Service"%>
<%@page import="Modelo.Actividad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Actividad - Gantt Project</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <%@include file="menu.jsp" %>
        
        <%
            Actividad actividad;
            Integer idActividad = Integer.parseInt(request.getParameter("idActividad"));
            SrvActividad_Service actividadService = new SrvActividad_Service();
            
            actividad = actividadService.getSrvActividadPort().listarActividadPorID(idActividad);
            
            // debug rápido: verifica que 'actividad' exista y su id
            //if (actividad == null) {
            //    out.println("<div style='color:red'>DEBUG: actividad es NULL</div>");
            //} else {
            //    out.println("<div style='color:green'>DEBUG: actividad.getIdTarea() = " + actividad.getIdTarea() + "</div>");
            //}
        %>
        
        <form name="frmActividad" action="srvUpdateActividad" method="POST" class="contenedor-formulario">
            <div>
                <div class="formulario card border-primary">
                    <div class="card-header formulario-header">
                        <label class="p-2">Actualizar Actividad</label>
                    </div>
                    
                    <div class="col" align="center">
                        <div class="form-group">
                            <!--<label class="p-2">ID del Actividad</label>-->
                            <input type="text" hidden value="<%= actividad.getIdActividad()%>" required class="form-control mb-2 input-readonly" id="idActividad" name="idActividad" />
                        </div>
                    </div>
                    
                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Tarea - Proyecto</label>
                            <select type="text" required class="form-control mb-2 lista-opciones" id="idTarea" name="idTarea">
                                <option disabled >-- Seleccionar opción --</option>
                                <%
                                    SrvTarea_Service tareaService = new SrvTarea_Service();
                                    SrvProyecto_Service proyectoService = new SrvProyecto_Service();
                                    
                                    List<Tarea> tareas = tareaService.getSrvTareaPort().listarTarea();
                                    
                                    for (int i = 0; i < tareas.size(); i++) 
                                    {
                                        Tarea t = tareas.get(i);
                                        Proyecto p = proyectoService.getSrvProyectoPort().listarProyectoPorID(t.getIdProyecto());
                                        
                                        if(t.getIdTarea() == actividad.getIdTarea()) 
                                        {
                                            %>
                                            <option selected value="<%= t.getIdTarea() %>"><%= t.getNombre() + " - " + p.getNombre() %></option>
                                            <%
                                        } 
                                        else 
                                        {
                                            %>
                                            <option value="<%= t.getIdTarea()%>"><%= t.getNombre() + " - " + p.getNombre() %></option>
                                            <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>    
                        
                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Nombre de la Actividad</label>
                            <input type="text" value="<%= actividad.getNombre() %>" required class="form-control mb-2" id="nombre" name="nombre" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Descripcion</label>
                            <input type="text" value="<%= actividad.getDescripcion()%>" required class="form-control mb-2" id="descripcion" name="descripcion" />
                        </div>
                    </div>

                    <%
                        String fechaInicio = "";
                        if (actividad.getFechaInicio() != null) {
                            fechaInicio = actividad.getFechaInicio().toGregorianCalendar()
                                                  .toZonedDateTime()
                                                  .toLocalDate()
                                                  .toString(); 
                        }

                        String fechaFin = "";
                        if (actividad.getFechaFinalizacion() != null) {
                            fechaFin = actividad.getFechaFinalizacion().toGregorianCalendar()
                                               .toZonedDateTime()
                                               .toLocalDate()
                                               .toString();
                        }
                    %>
                        
                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Fecha de inicio</label>
                            <input type="date" value="<%= fechaInicio%>" required class="form-control mb-2" id="fechaInicio" name="fechaInicio" />
                        </div>
                    </div>
                    
                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Fecha de finalizacion</label>
                            <input type="date" value="<%= fechaFin%>" required class="form-control mb-2" id="fechaFinalizacion" name="fechaFinalizacion" />
                        </div>
                    </div>
                    
                    <div class="contenedor-btn">
                        <button type="submit" class="btn btn-primary btn-guardar">Actualizar</button>
                    </div>

                </div>
            </div>
            
        </form>
        
           <%
                Integer respuesta = (Integer) session.getAttribute("respuestaActividad");
                if (respuesta != null) {
                    if(respuesta == 1) 
                    {
                        %>
                        <script>
                            swal("Actividad agregado", "El proyecto fue creado con éxito" , "success");
                        </script>
                        <%
                    }
                    else 
                    {
                        %>
                        <script>
                            swal("Actividad no fue agregado", "Revisa los datos por favor." , "error");
                        </script>
                        <%
                    }
                    session.removeAttribute("respuestaActividad");
                }
            %>
            
            <%@include file="footer.jsp" %>
    </body>
</html>
