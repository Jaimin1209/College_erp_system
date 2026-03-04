/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author jaimin
 */
public class EditCourseServlet extends HttpServlet {

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

                int courseId = Integer.parseInt(request.getParameter("course_id"));
                String courseName = request.getParameter("course_name");
                int deptId = Integer.parseInt(request.getParameter("dept_id"));
                int duration = Integer.parseInt(request.getParameter("duration"));

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/charusat", "root", "");

                    PreparedStatement ps = con.prepareStatement(
                            "UPDATE admin_course SET CNAME=?, DID=?, DURETION=? WHERE CID=?");

                    ps.setString(1, courseName);
                    ps.setInt(2, deptId);
                    ps.setInt(3, duration);
                    ps.setInt(4, courseId);

                    int result = ps.executeUpdate();
                    con.close();

                    if (result > 0) {
                        // SUCCESS
                        response.sendRedirect("admin_module/cource.jsp?success=Course Updated Successfully");
                    } else {
                        // FAILED
                        response.sendRedirect("admin_module/edit_cource.jsp?course_id="
                                + courseId + "&error=Update Failed");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("admin_module/edit_cource.jsp?course_id="
                            + courseId + "&error=Server Error");
                }

            } else {
                response.getWriter().println("Invalid Action");
            }
    

           
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditCourseServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditCourseServlet at " + request.getContextPath() + "</h1>");
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
