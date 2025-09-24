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

public class srvUsuario extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            String contrasena_hash = request.getParameter("contrasena_hash");
            String respuesta;
            String nombre = "";
            String apellido = "";
            
            if (email == null || contrasena_hash == null) {
//                System.out.println("Email: " + email);
//                System.out.println("Contrasena: " + contrasena_hash);
                request.setAttribute("respuesta", "Faltan parámetros en el formulario");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
                return;
            }
            
            RequestDispatcher rd = null;
            SrvUsuario_Service userService = new SrvUsuario_Service();
            Usuario user = new Usuario();
            
            try 
            {
                user = userService.getSrvUsuarioPort().auntenticateUsuario(email, contrasena_hash);
                nombre = user.getNombre();
                apellido = user.getApellido();
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", user); 

                if(user.getEmail() != null) {
                {
                    respuesta = "True";
                }
                } else {
                    respuesta = "False";
                }
            }
            catch(Exception ex)
            {
                respuesta = ex.getMessage();
            }
            
            
            request.setAttribute("respuesta", respuesta);
            request.setAttribute("nombre", nombre);
            request.setAttribute("apellido", apellido);
            
            rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
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
