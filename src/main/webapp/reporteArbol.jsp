<%@page import="Modelo.Proyecto"%>
<%@page import="Modelo.SrvProyecto_Service"%>
<%@page import="java.util.List"%>

<head>
    <title>Gantt Project - Reporte de Proyecto</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>

    <main class="mt-5">
        <form name="frmReporte" action="srvReporte" method="POST" target="_blank" class="contenedor-formulario">
            <div>
                <div class="formulario card border-primary">
                    <div class="card-header formulario-header">
                        <label class="p-2">Nuevo Usuario</label>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Proyecto</label>
                            <select type="text" required class="form-control mb-2 lista-opciones" id="idProyecto" name="idProyecto">
                                <option selected disabled>-- Seleccionar opción --</option>
                                <%
                                    SrvProyecto_Service proyectoService = new SrvProyecto_Service();

                                    List<Proyecto> proyectos = proyectoService.getSrvProyectoPort().listarProyecto();

                                    for (int i = 0; i < proyectos.size(); i++) 
                                    {
                                        Proyecto e = proyectos.get(i);

                                        %>
                                        <option value="<%= e.getIdProyecto()%>"><%= e.getNombre() %></option>

                                        <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <div class="contenedor-btn">
                        <button type="submit" class="btn btn-primary btn-guardar">Crear reporte</button>
                    </div>
                </div>
            </div>
        </form>

        <%
            Integer respuesta = (Integer) session.getAttribute("respuestaUsuario");
            if (respuesta != null) {
                if (respuesta == 1) 
                {
                    %>
                    <script>
                        swal("Usuario agregado", "El Usuario fue creado con éxito", "success");
                    </script>
                    <%
                } 
                else 
                {
                    %>
                    <script>
                        swal("Error", "El Usuario no fue agregado. Revisa los datos.", "error");
                    </script>
                    <%
                }
                session.removeAttribute("respuestaUsuario");
            }
        %>
    </main>

    <jsp:include page="footer.jsp"/>
</body>
