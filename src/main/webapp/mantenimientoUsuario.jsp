<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.SrvUsuario_Service"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Usuario - Gantt Project</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <%@include file="menu.jsp" %>
        
        <h2 class="table-title">Mantenimiento de Usuarios</h2>
        <form method="post" action="srvBusquedaUsuario" class="contenedor tabla-mantenimiento">
            <div class="card border-primary tabla-principal">
                <div class="card-header d-flex justify-content-between">
                    <div>
                        <label class="p-2">Usuario</label>
                        <input type="text" id="idUsuario" name="idUsuario" placeholder="" />
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
                            <th><b>ID Usuario</b></th>
                            <th><b>ID Empresa</b></th>
                            <th><b>Nombre</b></th>
                            <th><b>Apellido</b></th>
                            <th><b>Correo electrónico</b></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>

                    <tbody class="datos">
                        <%
                            
                            SrvUsuario_Service usuarioService = new SrvUsuario_Service();
                            
                            if (request.getAttribute("idUsuario") != null) 
                            {
                                int idUsuario = Integer.parseInt(request.getAttribute("idUsuario").toString());
                                
                                Usuario u = usuarioService.getSrvUsuarioPort().listarUsuarioPorID(idUsuario);
                                
                                if(u.getIdUsuario() != 3)
                                {
                                    %> 
                                    <tr>
                                        <td scope="row"><%= u.getIdUsuario() %></td>
                                        <td scope="row"><%= u.getIdEmpresa()%></td>
                                        <td scope="row"><%= u.getNombre() %></td>
                                        <td scope="row"><%= u.getApellido()%></td>
                                        <td scope="row"><%= u.getEmail() %></td>
                                        <td scope="row"><a href="updateUsuario.jsp?idUsuario=<%= u.getIdUsuario() %>" class="btn btn-primary">Actualizar</a></td>
                                        <td scope="row"><a href="deleteUsuario.jsp?idUsuario=<%= u.getIdUsuario() %>" class="btn btn-danger">Eliminar</a></td>
                                    </tr>
                                    <%
                                }
                            }
                            else 
                            {
                                List<Usuario> usuarios = usuarioService.getSrvUsuarioPort().listarUsuario();
                            
                                for(int i = 0; i < usuarios.size(); i++) 
                                {
                                    Usuario u = usuarios.get(i);
                                    
                                    if(u.getIdUsuario() != 3)
                                    {
                                        %> 
                                        <tr>
                                            <td scope="row"><%= u.getIdUsuario() %></td>
                                            <td scope="row"><%= u.getIdEmpresa()%></td>
                                            <td scope="row"><%= u.getNombre() %></td>
                                            <td scope="row"><%= u.getApellido()%></td>
                                            <td scope="row"><%= u.getEmail() %></td>
                                            <td scope="row"><a href="updateUsuario.jsp?idUsuario=<%= u.getIdUsuario() %>" class="btn btn-primary">Actualizar</a></td>
                                            <td scope="row"><a href="deleteUsuario.jsp?idUsuario=<%= u.getIdUsuario() %>" class="btn btn-danger">Eliminar</a></td>
                                        </tr>
                                        <%
                                    }
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </form>
        <%@include file="footer.jsp" %>
    </body>
</html>
