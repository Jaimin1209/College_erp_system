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
public class ClassAllocationServlet extends HttpServlet {

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

            try {
                String deptId = request.getParameter("dept_id");
                String semId = request.getParameter("semester_id");
                String subjectId = request.getParameter("subject_id");
                String cid = request.getParameter("c_id");
                String facultyId = request.getParameter("faculty_id");
                String classType = request.getParameter("class_type");
                String roomNo = request.getParameter("room_no");

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/charusat", "root", "");

                PreparedStatement ps = conn.prepareStatement("INSERT INTO admin_sub_allo (DID,ID,CID,FID,SEM,CTYPE,ROOM)VALUES (?,?,?,?,?,?,?)");

                ps.setInt(1, Integer.parseInt(deptId));
                ps.setInt(2, Integer.parseInt(subjectId));
                ps.setInt(3, Integer.parseInt(cid));
                 ps.setInt(4, Integer.parseInt(facultyId));
                ps.setString(5, semId);               
                ps.setString(6, classType);
                ps.setString(7, roomNo);

                int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect(
                        "admin_module/class_allocation.jsp?success=Class allocation saved successfully"
                );
            } else {
                response.sendRedirect(
                        "admin_module/class_allocation.jsp?error=Failed to save class allocation"
                );
            }
            } catch (Exception e) {
                out.println(e);
            }

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
