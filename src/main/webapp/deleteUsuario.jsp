<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.SrvUsuario_Service"%>
<%@page import="Modelo.Empresa"%>
<%@page import="Modelo.SrvEmpresa_Service"%>
<%@page import="java.util.List"%>

<head>
    <title>Gantt Project - Eliminar Usuario</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>

    <main class="mt-5">
        <%
        Usuario usuario;
        Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        SrvUsuario_Service usuarioService = new SrvUsuario_Service();

        usuario = usuarioService.getSrvUsuarioPort().listarUsuarioPorID(idUsuario);

        %>

        <form name="frmUsuario" action="srvDeleteUsuario" method="POST" class="contenedor-formulario">
            <div>
                <div class="formulario card border-primary">
                    <div class="card-header formulario-header">
                        <label class="p-2">Eliminar Usuario</label>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <!--<label class="p-2">Nombre del Usuario</label>-->
                            <input type="text" hidden value="<%= usuario.getIdUsuario() %>" required class="form-control mb-2" id="idUsuario" name="idUsuario" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Nombre del Usuario</label>
                            <input type="text" readonly required value="<%= usuario.getNombre() %>" class="form-control mb-2 input-readonly" id="nombre" name="nombre" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Apellido del Usuario</label>
                            <input type="text" readonly required value="<%= usuario.getApellido()%>" class="input-readonly form-control mb-2" id="apellido" name="apellido" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Empresa</label>
                            <select type="text" readonly required class="form-control mb-2 lista-opciones input-readonly" id="idEmpresa" name="idEmpresa">
                                <option disabled>-- Seleccionar opción --</option>
                                <%
                                    SrvEmpresa_Service empresaService = new SrvEmpresa_Service();

                                    List<Empresa> empresas = empresaService.getSrvEmpresaPort().listarEmpresa();

                                    for (int i = 0; i < empresas.size(); i++) 
                                    {
                                        Empresa e = empresas.get(i);

                                        if(e.getIdEmpresa() == usuario.getIdEmpresa()) 
                                        {
                                            %>
                                            <option selected value="<%= e.getIdEmpresa()%>"><%= e.getNombre() %></option>
                                            <%
                                        }
                                        else
                                        {
                                            %>
                                            <option value="<%= e.getIdEmpresa()%>"><%= e.getNombre() %></option>
                                            <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Email</label>
                            <input type="email" readonly required value="<%= usuario.getEmail()%>" class="form-control mb-2 input-readonly" id="email" name="email" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Contraseña</label>
                            <input type="password" readonly required value="<%= usuario.getContraseñaHash()%>" class="form-control mb-2 input-readonly" id="contraseña_hash" name="contraseña_hash" />
                        </div>
                    </div>

                    <div class="contenedor-btn">
                        <button type="submit" class="btn btn-primary btn-guardar">Eliminar</button>
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
                        swal("Usuario eliminado", "El Usuario fue eliminado con éxito", "success");
                    </script>
                    <%
                } 
                else 
                {
                    %>
                    <script>
                        swal("Error", "El Usuario no fue eliminado. Revisa los datos.", "error");
                    </script>
                    <%
                }
                session.removeAttribute("respuestaUsuario");
            }
        %>
    </main>

    <jsp:include page="footer.jsp"/>
</body>
