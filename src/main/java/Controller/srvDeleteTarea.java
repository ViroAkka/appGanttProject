package Controller;

import Modelo.SrvTarea_Service;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class srvDeleteTarea extends HttpServlet {

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
            
            String method = request.getMethod();
            
            if ("POST".equalsIgnoreCase(method)) {
                int idTarea = Integer.parseInt(request.getParameter("idTarea"));
                
                HttpSession session = request.getSession(false); 
                if (session == null || session.getAttribute("usuario") == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }

                Usuario usuario = (Usuario) session.getAttribute("usuario");
                
                SrvTarea_Service tareaService = new SrvTarea_Service();
                int respuesta = tareaService.getSrvTareaPort()
                                  .deleteTarea(idTarea);

                // Guardamos un "flag" en la sesión para mostrar el mensaje en JSP
                session.setAttribute("respuestaTarea", respuesta);

                // Redirigimos con GET (evita reenvío al recargar)
                response.sendRedirect("mantenimientoTarea.jsp");
                } 
            else 
            {
                // Si es GET simplemente mostramos la página
                RequestDispatcher rd = request.getRequestDispatcher("mantenimientoTarea.jsp");
                rd.forward(request, response);
            }
            
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet srvDeleteTarea</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet srvDeleteTarea at " + request.getContextPath() + "</h1>");
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
