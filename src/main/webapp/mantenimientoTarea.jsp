<%@page import="Modelo.Tarea"%>
<%@page import="Modelo.SrvTarea_Service"%>
<%@page import="java.util.List"%>

<head>
    <title>Mantenimiento de Tarea - Gantt Project</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    
    <main>
        <h2 class="table-title">Mantenimiento de Tareas</h2>
        <form method="post" action="srvBusquedaTarea" class="contenedor tabla-mantenimiento">
            <div class="card border-primary tabla-principal">
                <div class="card-header d-flex justify-content-between">
                    <div>
                        <label class="p-2">Tarea</label>
                        <input type="text" id="idTarea" name="idTarea" placeholder="" />
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
                            <th><b>ID Tarea</b></th>
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
                        <%

                            SrvTarea_Service tareaService = new SrvTarea_Service();

                            if (request.getAttribute("idTarea") != null) 
                            {
                                int idTarea = Integer.parseInt(request.getAttribute("idTarea").toString());
                                Tarea t = tareaService.getSrvTareaPort().listarTareaPorID(idTarea);
                                
                                if (t != null) 
                                {
                                    %> 
                                    <tr>
                                        <td scope="row"><%= t.getIdTarea() %></td>
                                        <td scope="row"><%= t.getIdProyecto()%></td>
                                        <td scope="row"><%= t.getNombre() %></td>
                                        <td scope="row"><%= t.getDescripcion() %></td>
                                        <td scope="row"><%= t.getFechaInicio().toString().substring(0, 10) %></td>
                                        <td scope="row"><%= t.getFechaFinalizacion().toString().substring(0, 10) %></td>
                                        <td scope="row"><a href="updateTarea.jsp?idTarea=<%= t.getIdTarea() %>" class="btn btn-primary">Actualizar</a></td>
                                        <td scope="row"><a href="deleteTarea.jsp?idTarea=<%= t.getIdTarea() %>" class="btn btn-danger">Eliminar</a></td>
                                    </tr>
                                    <%
                                }
                                else
                                {
                                    List<Tarea> tareas = tareaService.getSrvTareaPort().listarTarea();

                                    for(int i = 0; i < tareas.size(); i++) 
                                    {
                                        Tarea tar = tareas.get(i);
                                        %> 
                                        <tr>
                                            <td scope="row"><%= tar.getIdTarea() %></td>
                                            <td scope="row"><%= tar.getIdProyecto()%></td>
                                            <td scope="row"><%= tar.getNombre() %></td>
                                            <td scope="row"><%= tar.getDescripcion() %></td>
                                            <td scope="row"><%= tar.getFechaInicio().toString().substring(0, 10) %></td>
                                            <td scope="row"><%= tar.getFechaFinalizacion().toString().substring(0, 10) %></td>
                                            <td scope="row"><a href="updateTarea.jsp?idTarea=<%= tar.getIdTarea() %>" class="btn btn-primary">Actualizar</a></td>
                                            <td scope="row"><a href="deleteTarea.jsp?idTarea=<%= tar.getIdTarea() %>" class="btn btn-danger">Eliminar</a></td>
                                        </tr>
                                        <%
                                    }
                                }
                            }
                            else 
                            {
                                List<Tarea> tareas = tareaService.getSrvTareaPort().listarTarea();

                                for(int i = 0; i < tareas.size(); i++) 
                                {
                                    Tarea t = tareas.get(i);
                                    %> 
                                    <tr>
                                        <td scope="row"><%= t.getIdTarea() %></td>
                                        <td scope="row"><%= t.getIdProyecto()%></td>
                                        <td scope="row"><%= t.getNombre() %></td>
                                        <td scope="row"><%= t.getDescripcion() %></td>
                                        <td scope="row"><%= t.getFechaInicio().toString().substring(0, 10) %></td>
                                        <td scope="row"><%= t.getFechaFinalizacion().toString().substring(0, 10) %></td>
                                        <td scope="row"><a href="updateTarea.jsp?idTarea=<%= t.getIdTarea() %>" class="btn btn-primary">Actualizar</a></td>
                                        <td scope="row"><a href="deleteTarea.jsp?idTarea=<%= t.getIdTarea() %>" class="btn btn-danger">Eliminar</a></td>
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
