<%@page import="Modelo.Actividad"%>
<%@page import="Modelo.SrvActividad_Service"%>
<%@page import="java.util.List"%>

<head>
    <title>Mantenimiento de Actividad - Gantt Project</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>

    <main>
        <h2 class="table-title">Mantenimiento de Actividades</h2>
        <form method="post" action="srvBusquedaActividad" class="contenedor tabla-mantenimiento">
            <div class="card border-primary tabla-principal">
                <div class="card-header d-flex justify-content-between">
                    <div>
                        <label class="p-2">Actividad</label>
                        <input type="text" id="idActividad" name="idActividad" placeholder="" />
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
                            <th><b>ID Actividad</b></th>
                            <th><b>ID Tarea</b></th>
                            <th><b>Nombre</b></th>
                            <th><b>Descripción</b></th>
                            <th><b>Fecha de Inicio</b></th>
                            <th><b>Fecha de Fin</b></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>

                    <tbody class="datos">
                        <%

                            SrvActividad_Service actividadService = new SrvActividad_Service();

                            if (request.getAttribute("idActividad") != null) 
                            {
                                int idActividad = Integer.parseInt(request.getAttribute("idActividad").toString());

                                Actividad t = actividadService.getSrvActividadPort().listarActividadPorID(idActividad);
                                %> 
                                    <tr>
                                        <td scope="row"><%= t.getIdActividad() %></td>
                                        <td scope="row"><%= t.getIdTarea()%></td>
                                        <td scope="row"><%= t.getNombre() %></td>
                                        <td scope="row"><%= t.getDescripcion() %></td>
                                        <td scope="row"><%= t.getFechaInicio().toString().substring(0, 10) %></td>
                                        <td scope="row"><%= t.getFechaFinalizacion().toString().substring(0, 10) %></td>
                                        <td scope="row"><a href="updateActividad.jsp?idActividad=<%= t.getIdActividad() %>" class="btn btn-primary">Actualizar</a></td>
                                        <td scope="row"><a href="deleteActividad.jsp?idActividad=<%= t.getIdActividad() %>" class="btn btn-danger">Eliminar</a></td>
                                    </tr>
                                    <%
                            }
                            else 
                            {
                                List<Actividad> actividades = actividadService.getSrvActividadPort().listarActividad();

                                for(int i = 0; i < actividades.size(); i++) 
                                {
                                    Actividad t = actividades.get(i);
                                    %> 
                                    <tr>
                                        <td scope="row"><%= t.getIdActividad() %></td>
                                        <td scope="row"><%= t.getIdTarea()%></td>
                                        <td scope="row"><%= t.getNombre() %></td>
                                        <td scope="row"><%= t.getDescripcion() %></td>
                                        <td scope="row"><%= t.getFechaInicio().toString().substring(0, 10) %></td>
                                        <td scope="row"><%= t.getFechaFinalizacion().toString().substring(0, 10) %></td>
                                        <td scope="row"><a href="updateActividad.jsp?idActividad=<%= t.getIdActividad() %>" class="btn btn-primary">Actualizar</a></td>
                                        <td scope="row"><a href="deleteActividad.jsp?idActividad=<%= t.getIdActividad() %>" class="btn btn-danger">Eliminar</a></td>
                                    </tr>
                                    <%
                                }
                            }

                        %>
                    </tbody>
                </table>
            </div>
        </form>
    </main>

        <jsp:include page="footer.jsp"/>
</body>
