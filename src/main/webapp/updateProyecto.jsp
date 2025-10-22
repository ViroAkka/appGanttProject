<%@page import="Modelo.SrvProyecto_Service"%>
<%@page import="Modelo.Proyecto"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Actualizar Proyecto - Gantt Project</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="menu.jsp"/>

    <main class="mt-5">
        <%
            Proyecto proyecto;
            Integer idProyecto = Integer.parseInt(request.getParameter("idProyecto"));
            SrvProyecto_Service proyectoService = new SrvProyecto_Service();

            proyecto = proyectoService.getSrvProyectoPort().listarProyectoPorID(idProyecto);

        %>

        <form name="frmProyecto" action="srvUpdateProyecto" method="POST" class="contenedor-formulario">
            <div>
                <div class="formulario card border-primary">
                    <div class="card-header formulario-header">
                        <label class="p-2">Actualizar Proyecto</label>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <!--<label class="p-2">ID del Proyecto</label>-->
                            <input type="text" hidden value="<%= proyecto.getIdProyecto()%>" required class="form-control mb-2 input-readonly" id="idProyecto" name="idProyecto" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Nombre del Proyecto</label>
                            <input type="text" value="<%= proyecto.getNombre() %>" required class="form-control mb-2" id="nombre" name="nombre" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Descripcion</label>
                            <input type="text" value="<%= proyecto.getDescripcion()%>" required class="form-control mb-2" id="descripcion" name="descripcion" />
                        </div>
                    </div>

                    <%
                        String fechaInicio = "";
                        if (proyecto.getFechaInicio() != null) {
                            fechaInicio = proyecto.getFechaInicio().toGregorianCalendar()
                                                  .toZonedDateTime()
                                                  .toLocalDate()
                                                  .toString(); 
                        }

                        String fechaFin = "";
                        if (proyecto.getFechaFinalizacion() != null) {
                            fechaFin = proyecto.getFechaFinalizacion().toGregorianCalendar()
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
            Integer respuesta = (Integer) session.getAttribute("respuestaProyecto");
            if (respuesta != null) {
                if(respuesta == 1) 
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
    </main>

    <jsp:include page="footer.jsp"/>
</body>
