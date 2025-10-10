package Controller;

import net.sf.jasperreports.engine.JRPrintElement;
import net.sf.jasperreports.engine.JRPrintText;
import net.sf.jasperreports.engine.JRPrintPage;
import Modelo.Proyecto;
import Modelo.SrvProyecto_Service;
import servicio.Tarea;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanArrayDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import servicio.Actividad;
import servicio.SrvReporte_Service;

public class srvReporte extends HttpServlet {

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
        response.setContentType("application/pdf");
        try (ServletOutputStream outStream = response.getOutputStream()) {
            
            int idProyecto = Integer.parseInt(request.getParameter("idProyecto"));
            InputStream logoEmpresa = this.getServletConfig()
                    .getServletContext()
                    .getResourceAsStream("/JasperReports/img/logo.png");
            InputStream reporteProyecto = this.getServletConfig()
                    .getServletContext()
                    .getResourceAsStream("/JasperReports/GanttReport.jasper");
            InputStream subTareas = getServletContext().getResourceAsStream("/JasperReports/subTareas.jasper");
            InputStream subActividades = getServletContext().getResourceAsStream("/JasperReports/subActividades.jasper");

            if (reporteProyecto == null || subTareas == null || subActividades == null) {
                throw new FileNotFoundException("No se encontró el reporte principal.");
            }

            SrvProyecto_Service proyectoService = new SrvProyecto_Service();
            SrvReporte_Service reporteService = new SrvReporte_Service();

            Proyecto proyecto = proyectoService.getSrvProyectoPort().listarProyectoPorID(idProyecto);
            List<Tarea> tareas = reporteService.getSrvReportePort().listarTareasPorProyecto(idProyecto);
            List<Actividad> actividades = new ArrayList<>();

            for(int i = 0; i < tareas.size(); i++) 
            {
                Tarea tarea = tareas.get(i);
                int idTareaI = tarea.getIdTarea();

                actividades.addAll(reporteService.getSrvReportePort().listarActividadesPorTarea(idTareaI));
            }

            // Data Sources
            JRBeanArrayDataSource dsProyecto = new JRBeanArrayDataSource(new Proyecto[]{ proyecto });
            JRBeanArrayDataSource dsTareas = new JRBeanArrayDataSource(tareas.toArray());
            JRBeanArrayDataSource dsActividades = new JRBeanArrayDataSource(actividades.toArray());

            // Parámetros
            Map<String, Object> parameters = new HashMap();
//            parameters.put("idProyecto", proyecto.getIdProyecto());
//            parameters.put("nombre", proyecto.getNombre());
//            parameters.put("descripcion", proyecto.getDescripcion());
//            parameters.put("fechaInicio", proyecto.getFechaInicio().toString().substring(0,10));
//            parameters.put("fechaFinalizacion", proyecto.getFechaFinalizacion().toString().substring(0,10));
            parameters.put("dsProyecto", dsProyecto);
            parameters.put("dsTareas", dsTareas);
            parameters.put("subTareas", subTareas);
            parameters.put("dsActividades", dsActividades);
            parameters.put("subActividades", subActividades);
            parameters.put("logoEmpresa", logoEmpresa);

            JasperReport report = (JasperReport) JRLoader.loadObject(reporteProyecto);
            JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameters, new JREmptyDataSource());
            
//            for (JRPrintPage page : jasperPrint.getPages()) {
//                for (JRPrintElement element : page.getElements()) {
//                    if (element instanceof JRPrintText) {
//                        JRPrintText textElement = (JRPrintText) element;
//                        System.out.println("Texto en el PDF: " + textElement.getFullText());
//                    }
//                }
//            }
            
            JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
            outStream.flush();
        }    
        catch(Exception ex) 
        {
            response.setContentType("text/plain");
            System.out.println("No se pudo generar el archivo.");
            ex.printStackTrace();
        }
//            out.println("<head>");
//            out.println("<title>Servlet srvReporte</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet srvReporte at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
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
