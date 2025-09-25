<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gantt Project - Nuevo Empresa</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <%@include file="menu.jsp" %>
        
        <form name="frmEmpresa" action="srvInsertEmpresa" method="POST" class="contenedor-formulario">
            <div>
                <div class="formulario card border-primary">
                    <div class="card-header formulario-header">
                        <label class="p-2">Nueva Empresa</label>
                    </div>
                    
                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Nombre de la Empresa</label>
                            <input type="text" required class="form-control mb-2" id="nombre" name="nombre" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Representante Legal</label>
                            <input type="text" required class="form-control mb-2" id="representanteLegal" name="representanteLegal" />
                        </div>
                    </div>

                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Dirección</label>
                            <input type="text" required class="form-control mb-2" id="direccion" name="direccion" />
                        </div>
                    </div>
                    
                    <div class="col" align="center">
                        <div class="form-group">
                            <label class="p-2">Tipo de Empresa</label>
                            <select type="text" required class="form-control mb-2 lista-opciones" id="tipoEmpresa" name="tipoEmpresa">
                                <option selected disabled>-- Seleccionar una opción --</option>
                                <option>Tecnología</option>
                                <option>Medicina</option>
                                <option>Manufactura</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="contenedor-btn">
                        <button type="submit" class="btn btn-primary btn-guardar">Guardar</button>
                    </div>

                </div>
            </div>
            
        </form>
        
        <%
            Integer respuesta = (Integer) session.getAttribute("respuestaEmpresa");
            if (respuesta != null) 
            {
                if (respuesta == 1)
                {
                    %>
                    <script>
                        swal("Empresa agregada", "La empresa fue creada con éxito" , "success");
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
        
        <%@include file="footer.jsp" %>
    </body>
</html>
