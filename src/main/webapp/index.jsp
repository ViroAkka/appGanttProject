<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gantt Project</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="index.jsp">Gantt Project</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarScroll">
                <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
                  </li>
                  
                  <!-- Proyecto -->
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Proyecto
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="newProyecto.jsp">Crear</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="mantenimientoProyecto.jsp">Mantenimiento de Proyectos</a></li>
                    </ul>
                  </li>
                  
                  <!-- Tarea -->
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Tarea
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="#">Crear</a></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><a class="dropdown-item" href="#">Búsqueda</a></li>
                    </ul>
                  </li>
                  
                  <!-- Actividad -->
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Actividad
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="#">Crear</a></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><a class="dropdown-item" href="#">Búsqueda</a></li>
                    </ul>
                  </li>

                  <!--<li class="nav-item">
                    <a class="nav-link disabled">Link</a>
                  </li> -->
                  
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <!-- Ícono de usuario sólido -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" aria-hidden="false" role="img" aria-label="Usuario">
                          <path d="M12 12c2.761 0 5-2.239 5-5s-2.239-5-5-5-5 2.239-5 5 2.239 5 5 5zm0 2c-3.866 0-7 3.134-7 7 0 .553.447 1 1 1h12c.553 0 1-.447 1-1 0-3.866-3.134-7-7-7z"/>
                        </svg>

                    </a>
                    <ul class="dropdown-menu">
                        <li><p class="dropdown-header">Usuario</p></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="login.jsp?cerrar=true">Cerrar sesión</a></li>
                    </ul>
                 </li>
                </ul>
                
                
                
                <!--<form class="d-flex" role="search">
                  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                  <button class="btn btn-danger" type="submit">Search</button>
                </form>-->
              </div>
            </div>
        </nav>
        
        <%
            HttpSession sesion = request.getSession(false);
            if (sesion == null || sesion.getAttribute("usuario") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>
