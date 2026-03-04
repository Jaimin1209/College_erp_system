/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;  
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author jaimin
 */
public class UpdateSubjectServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            
            String action = request.getParameter("action");

            if (action != null && action.equals("update")) {

                int sid = Integer.parseInt(request.getParameter("subject_id"));
                String nm = request.getParameter("subject_name");
                String code = request.getParameter("subject_code");
                int did = Integer.parseInt(request.getParameter("dept_id"));
                int sem = Integer.parseInt(request.getParameter("semester_id"));

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/charusat", "root", "");

                    PreparedStatement ps = con.prepareStatement(
                            "UPDATE admin_sub SET NAME=?, CODE=? ,DID=?, SEM=? WHERE ID=?");

                    ps.setString(1, nm);
                    ps.setString(2, code);
                    ps.setInt(3, did);
                    ps.setInt(4, sem);
                    ps.setInt(5, sid);

                    int result = ps.executeUpdate();
                    con.close();

                    if (result > 0) {
                        // SUCCESS
                        response.sendRedirect("admin_module/subjects.jsp?success=Course Updated Successfully");
                    } else {
                        // FAILED
                        response.sendRedirect("admin_module/edit_subject.jsp?id="
                                + sid + "&error=Update Failed");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("admin_module/edit_subject.jsp?course_id="
                            + sid + "&error=Server Error");
                }

            } else {
                response.getWriter().println("Invalid Action");
            }
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateSubjectServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateSubjectServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
