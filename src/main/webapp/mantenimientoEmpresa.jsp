<%@page import="Modelo.SrvEmpresa_Service"%>
<%@page import="Modelo.Empresa"%>
<%@page import="java.util.List"%>

<head>
    <title>Mantenimiento de Empresa - Gantt Project</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>

    <main>
        <h2 class="table-title">Mantenimiento de Empresas</h2>
        <form method="post" action="srvBusquedaEmpresa" class="contenedor tabla-mantenimiento">
            <div class="card border-primary tabla-principal">
                <div class="card-header d-flex justify-content-between">
                    <div>
                        <label class="p-2">Empresa</label>
                        <input type="text" id="idEmpresa" name="idEmpresa" placeholder="" />
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
                            <th><b>ID Empresa</b></th>
                            <th><b>Nombre</b></th>
                            <th><b>Representante legal</b></th>
                            <th><b>Dirección</b></th>
                            <th><b>Tipo de empresa</b></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>

                    <tbody class="datos">
                        <%

                            SrvEmpresa_Service empresaService = new SrvEmpresa_Service();

                            if (request.getAttribute("idEmpresa") != null) 
                            {
                                int idEmpresa = Integer.parseInt(request.getAttribute("idEmpresa").toString());

                                Empresa e = empresaService.getSrvEmpresaPort().listarEmpresaPorID(idEmpresa);
                                %> 
                                    <tr>
                                        <td scope="row"><%= e.getIdEmpresa() %></td>
                                        <td scope="row"><%= e.getNombre()%></td>
                                        <td scope="row"><%= e.getRepresentanteLegal()%></td>
                                        <td scope="row"><%= e.getDireccion()%></td>
                                        <td scope="row"><%= e.getTipoEmpresa() %></td>
                                        <td scope="row"><a href="updateEmpresa.jsp?idEmpresa=<%= e.getIdEmpresa() %>" class="btn btn-primary">Actualizar</a></td>
                                        <td scope="row"><a href="deleteEmpresa.jsp?idEmpresa=<%= e.getIdEmpresa() %>" class="btn btn-danger">Eliminar</a></td>
                                    </tr>
                                    <%
                            }
                            else 
                            {
                                List<Empresa> empresas = empresaService.getSrvEmpresaPort().listarEmpresa();

                                for(int i = 0; i < empresas.size(); i++) 
                                {
                                    Empresa e = empresas.get(i);
                                    %> 
                                    <tr>
                                        <td scope="row"><%= e.getIdEmpresa() %></td>
                                        <td scope="row"><%= e.getNombre()%></td>
                                        <td scope="row"><%= e.getRepresentanteLegal()%></td>
                                        <td scope="row"><%= e.getDireccion()%></td>
                                        <td scope="row"><%= e.getTipoEmpresa() %></td>
                                        <td scope="row"><a href="updateEmpresa.jsp?idEmpresa=<%= e.getIdEmpresa() %>" class="btn btn-primary">Actualizar</a></td>
                                        <td scope="row"><a href="deleteEmpresa.jsp?idEmpresa=<%= e.getIdEmpresa() %>" class="btn btn-danger">Eliminar</a></td>
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

