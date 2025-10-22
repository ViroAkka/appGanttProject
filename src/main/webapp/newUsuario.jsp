<%@page import="Modelo.Empresa"%>
<%@page import="Modelo.SrvEmpresa_Service"%>
<%@page import="java.util.List"%>

<head>
    <title>Gantt Project - Nuevo Usuario</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>

    <main class="mt-5">
        <form name="frmUsuario" action="srvInsertUsuario" method="POST" class="contenedor-formulario">
            <div>
                <div class="formulario card border-primary">
                    <div class="card-header formulario-header">
                        <label class="p-2">Nuevo Usuario</label>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Nombre del Usuario</label>
                            <input type="text" required class="form-control mb-2" id="nombre" name="nombre" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Apellido del Usuario</label>
                            <input type="text" required class="form-control mb-2" id="apellido" name="apellido" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Empresa</label>
                            <select type="text" required class="form-control mb-2 lista-opciones" id="idEmpresa" name="idEmpresa">
                                <option selected disabled>-- Seleccionar opci�n --</option>
                                <%
                                    SrvEmpresa_Service empresaService = new SrvEmpresa_Service();

                                    List<Empresa> empresas = empresaService.getSrvEmpresaPort().listarEmpresa();

                                    for (int i = 0; i < empresas.size(); i++) 
                                    {
                                        Empresa e = empresas.get(i);

                                        %>
                                        <option value="<%= e.getIdEmpresa()%>"><%= e.getNombre() %></option>

                                        <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Email</label>
                            <input type="email" required class="form-control mb-2" id="email" name="email" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Contrase�a</label>
                            <input type="password" required class="form-control mb-2" id="contrase�a_hash" name="contrase�a_hash" />
                        </div>
                    </div>

                    <div class="contenedor-btn">
                        <button type="submit" class="btn btn-primary btn-guardar">Guardar</button>
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
                        swal("Usuario agregado", "El Usuario fue creado con �xito", "success");
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

