<%@page import="Modelo.Proyecto"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.SrvProyecto_Service"%>
<%@page import="Modelo.SrvTarea_Service"%>
<%@page import="Modelo.Tarea"%>

<head>
    <title>Eliminar Tarea - Gantt Project</title>
</head>
<body>
    <%@include file="menu.jsp" %>

    <main class="mt-5">
        <%
            Tarea tarea;
            Integer idTarea = Integer.parseInt(request.getParameter("idTarea"));
            SrvTarea_Service tareaServicer = new SrvTarea_Service();

            tarea = tareaServicer.getSrvTareaPort().listarTareaPorID(idTarea);

        %>

        <form name="frmTarea" action="srvDeleteTarea" method="POST" class="contenedor-formulario">
            <div>
                <div class="formulario card border-primary">
                    <div class="card-header formulario-header">
                        <label class="p-2">Eliminar Tarea</label>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <!--<label class="p-2">ID del Tarea</label>-->
                            <input type="text" hidden value="<%= tarea.getIdTarea()%>" required class="form-control mb-2" id="idTarea" name="idTarea" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Nombre del Tarea</label>
                            <input type="text" readonly value="<%= tarea.getNombre() %>" required class="form-control mb-2" id="nombre" name="nombre" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Proyecto</label>
                            <!--<input type="text" required class="form-control mb-2" id="idProyecto" name="idProyecto" />-->

                            <select type="text" required class="form-control mb-2 lista-opciones" id="idProyecto" name="idProyecto">
                                <option disabled>-- Seleccionar opción --</option>
                                <%
                                    SrvProyecto_Service proyectoService = new SrvProyecto_Service();

                                    List<Proyecto> proyectos = proyectoService.getSrvProyectoPort().listarProyecto();

                                    for (int i = 0; i < proyectos.size(); i++) 
                                    {
                                        Proyecto p = proyectos.get(i);

                                        if(p.getIdProyecto() == tarea.getIdProyecto()) 
                                        {
                                            %>
                                            <option value="<%= p.getIdProyecto() %>"><%= p.getNombre() %></option>
                                            <%
                                        } 
                                        else 
                                        {
                                            %>
                                            <option value="<%= p.getIdProyecto() %>"><%= p.getNombre() %></option>
                                            <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>   

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Descripcion</label>
                            <input type="text" readonly value="<%= tarea.getDescripcion()%>" required class="form-control mb-2" id="descripcion" name="descripcion" />
                        </div>
                    </div>

                    <%
                        String fechaInicio = "";
                        if (tarea.getFechaInicio() != null) {
                            fechaInicio = tarea.getFechaInicio().toGregorianCalendar()
                                                  .toZonedDateTime()
                                                  .toLocalDate()
                                                  .toString(); 
                        }

                        String fechaFin = "";
                        if (tarea.getFechaFinalizacion() != null) {
                            fechaFin = tarea.getFechaFinalizacion().toGregorianCalendar()
                                               .toZonedDateTime()
                                               .toLocalDate()
                                               .toString();
                        }
                    %>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Fecha de inicio</label>
                            <input type="date" readonly value="<%= fechaInicio%>" required class="form-control mb-2" id="fechaInicio" name="fechaInicio" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Fecha de finalizacion</label>
                            <input type="date" readonly value="<%= fechaFin%>" required class="form-control mb-2" id="fechaFinalizacion" name="fechaFinalizacion" />
                        </div>
                    </div>

                    <div class="contenedor-btn">
                        <button type="submit" class="btn btn-primary btn-guardar">Eliminar</button>
                    </div>

                </div>
            </div>

        </form>

        <%
            Integer respuesta = (Integer) session.getAttribute("respuestaTarea");
            if (respuesta != null) {
                if(respuesta == 1) 
                {
                    %>
                    <script>
                        swal("Tarea eliminado", "El tarea fue eliminado con éxito" , "success");
                    </script>
                    <%
                }
                else 
                {
                    %>
                    <script>
                        swal("Tarea no fue Eliminada", "Revisa los datos por favor." , "error");
                    </script>
                    <%
                } session.removeAttribute("respuestaTarea");
            }
        %>
    </main>
    
    <jsp:include page="footer.jsp"/>
</body>

