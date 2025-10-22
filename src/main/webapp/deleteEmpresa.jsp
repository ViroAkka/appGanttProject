<%@page import="Modelo.SrvEmpresa_Service"%>
<%@page import="Modelo.Empresa"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Empresa - Gantt Project</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="menu.jsp"/>

    <main class="mt-5">
        <%
            Empresa empresa;
            Integer idEmpresa = Integer.parseInt(request.getParameter("idEmpresa"));
            SrvEmpresa_Service empresaService = new SrvEmpresa_Service();

            empresa = empresaService.getSrvEmpresaPort().listarEmpresaPorID(idEmpresa);

        %>

        <form name="frmEmpresa" action="srvDeleteEmpresa" method="POST" class="contenedor-formulario">
            <div>
                <div class="formulario card border-primary">
                    <div class="card-header formulario-header">
                        <label class="p-2">Eliminar Empresa</label>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <!--<label class="p-2">ID del Empresa</label>-->
                            <input type="text" hidden value="<%= empresa.getIdEmpresa()%>" required class="form-control mb-2 input-readonly" id="idEmpresa" name="idEmpresa" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Nombre de la Empresa</label>
                            <input type="text" readonly value="<%= empresa.getNombre() %>" required class="input-readonly form-control mb-2" id="nombre" name="nombre" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Representante legal</label>
                            <input type="text" readonly value="<%= empresa.getRepresentanteLegal()%>" required class="input-readonly form-control mb-2" id="representanteLegal" name="representanteLegal" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Dirección</label>
                            <input type="text" readonly value="<%= empresa.getDireccion() %>" required class="input-readonly form-control mb-2" id="direccion" name="direccion" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Tipo de empresa</label>
                            <select type="text" required class="form-control mb-2 lista-opciones" id="tipoEmpresa" name="tipoEmpresa">
                                <option disabled>-- Seleccionar una opción --</option>
                                <option value="Tecnología" <%= "Tecnología".equals(empresa.getTipoEmpresa()) ? "selected" : "" %>>Tecnología</option>
                                <option value="Medicina""<%= "Medicina".equals(empresa.getTipoEmpresa()) ? "selected" : "" %>>Medicina</option>
                                <option value="Manufactura" <%= "Manufactura".equals(empresa.getTipoEmpresa()) ? "selected" : "" %>>Manufactura</option>
                            </select>
                    </div>

                    <div class="contenedor-btn">
                        <button type="submit" class="btn btn-primary btn-guardar">Eliminar</button>
                    </div>

                </div>
            </div>

        </form>

        <%
            Integer respuesta = (Integer) session.getAttribute("respuestaEmpresa");
            if (respuesta != null) {
                if(respuesta == 1) 
                {
                    %>
                    <script>
                        swal("Empresa eliminada", "La empresa fue eliminada con éxito" , "success");
                    </script>
                    <%
                }
                else 
                {
                    %>
                    <script>
                        swal("Empresa no fue eliminada", "Revisa los datos por favor." , "error");
                    </script>
                    <%
                }
                session.removeAttribute("respuestaEmpresa");
            }
        %>
    </main>

    <jsp:include page="footer.jsp"/>
</body>
