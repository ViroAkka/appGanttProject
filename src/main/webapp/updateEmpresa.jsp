<%@page import="Modelo.SrvEmpresa_Service"%>
<%@page import="Modelo.Empresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Empresa - Gantt Project</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <%@include file="menu.jsp" %>
        
        <%
            Empresa empresa;
            Integer idEmpresa = Integer.parseInt(request.getParameter("idEmpresa"));
            SrvEmpresa_Service empresaService = new SrvEmpresa_Service();
            
            empresa = empresaService.getSrvEmpresaPort().listarEmpresaPorID(idEmpresa);
            

            // debug rápido: verifica que 'actividad' exista y su id
            if (empresa == null) {
                out.println("<div style='color:red'>DEBUG: empresa es NULL</div>");
            } else {
                out.println("<div style='color:green'>DEBUG: actividad.getIdTarea() = " + empresa.getIdEmpresa()+ "</div>");
            }
        %>
        
        <form name="frmEmpresa" action="srvUpdateEmpresa" method="POST" class="contenedor-formulario">
            <div>
                <div class="formulario card border-primary">
                    <div class="card-header formulario-header">
                        <label class="p-2">Actualizar Empresa</label>
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
                            <input type="text" value="<%= empresa.getNombre() %>" required class="form-control mb-2" id="nombre" name="nombre" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Representante legal</label>
                            <input type="text" value="<%= empresa.getRepresentanteLegal()%>" required class="form-control mb-2" id="representanteLegal" name="representanteLegal" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Dirección</label>
                            <input type="text" value="<%= empresa.getDireccion() %>" required class="form-control mb-2" id="direccion" name="direccion" />
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
                        <button type="submit" class="btn btn-primary btn-guardar">Actualizar</button>
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
                        swal("Empresa actualizada", "La empresa fue actualizada con éxito" , "success");
                    </script>
                    <%
                }
                else 
                {
                    %>
                    <script>
                        swal("Empresa no fue agregada", "Revisa los datos por favor." , "error");
                    </script>
                    <%
                }
                session.removeAttribute("respuestaEmpresa");
            }
        %>
    </body>
</html>
