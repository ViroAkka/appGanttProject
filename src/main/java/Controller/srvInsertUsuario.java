package Controller;

import Modelo.SrvUsuario_Service;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuario
 */
public class srvInsertUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String method = request.getMethod();
            
            if ("POST".equalsIgnoreCase(method)) {
                int idEmpresa = Integer.parseInt(request.getParameter("idEmpresa"));
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String email = request.getParameter("email");
                String contraseña_hash = request.getParameter("contraseña_hash");

                HttpSession session = request.getSession(false); 
                if (session == null || session.getAttribute("usuario") == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }

                Usuario usuario = (Usuario) session.getAttribute("usuario");
                
                SrvUsuario_Service usuarioService = new SrvUsuario_Service();
                int respuesta = usuarioService.getSrvUsuarioPort()
                                   .insertUsuario(idEmpresa, nombre, apellido, email, contraseña_hash);

                // Guardamos un "flag" en la sesión para mostrar el mensaje en JSP
                session.setAttribute("respuestaUsuario", respuesta);

                // Redirigimos con GET (evita reenvío al recargar)
                response.sendRedirect("newUsuario.jsp");
                } 
            else 
            {
                // Si es GET simplemente mostramos la página
                RequestDispatcher rd = request.getRequestDispatcher("newUsuario.jsp");
                rd.forward(request, response);
            }  
            
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet srvInsertUsuario</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet srvInsertUsuario at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
