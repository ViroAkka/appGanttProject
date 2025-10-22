<%@page import="Modelo.SrvProyecto_Service"%>
<%@page import="Modelo.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Proyecto - Gantt Project</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="menu.jsp"/>

    <main class="mt-5">
        <%
            Proyecto proyecto;
            Integer idProyecto = Integer.parseInt(request.getParameter("idProyecto"));
            SrvProyecto_Service proyectoServicer = new SrvProyecto_Service();

            proyecto = proyectoServicer.getSrvProyectoPort().listarProyectoPorID(idProyecto);

        %>

        <form name="frmProyecto" action="srvDeleteProyecto" method="POST" class="contenedor-formulario">
            <div>
                <div class="formulario card border-primary">
                    <div class="card-header formulario-header">
                        <label class="p-2">Eliminar Proyecto</label>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <!--<label class="p-2">ID del Proyecto</label>-->
                            <input type="text" hidden value="<%= proyecto.getIdProyecto()%>" required class="form-control mb-2" id="idProyecto" name="idProyecto" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Nombre del Proyecto</label>
                            <input type="text" readonly value="<%= proyecto.getNombre() %>" required class="form-control mb-2" id="nombre" name="nombre" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Descripcion</label>
                            <input type="text" readonly value="<%= proyecto.getDescripcion()%>" required class="form-control mb-2" id="descripcion" name="descripcion" />
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
            Integer respuesta = (Integer) session.getAttribute("respuestaProyecto");
            if (respuesta != null && respuesta == 1) {
        %>
            <script>
                swal("Proyecto eliminado", "El proyecto fue eliminado con éxito" , "success");
            </script>
        <%
                // eliminamos el flag para que no vuelva a salir al refrescar
                session.removeAttribute("respuestaProyecto");
            }
            else 
            {
        %>
                <script>
                    swal("Proyecto no fue Eliminado", "Revisa los datos por favor." , "error");
                </script>
        <%
            }
        %>
    </main>
    
    <jsp:include page="footer.jsp"/>
</body>

