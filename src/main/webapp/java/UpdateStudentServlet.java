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
import jakarta.servlet.http.Part;
import java.io.InputStream;
import jakarta.servlet.annotation.MultipartConfig;

@MultipartConfig(
    maxFileSize = 5 * 1024 * 1024,   // 5 MB
    maxRequestSize = 10 * 1024 * 1024
)

/**
 *
 * @author jaimin
 */
public class UpdateStudentServlet extends HttpServlet {

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
            
            int sid = Integer.parseInt(request.getParameter("student_id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String dob = request.getParameter("dob");
            String phone = request.getParameter("phone");
            String pass = request.getParameter("pass");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            int deptId = Integer.parseInt(request.getParameter("dept_id"));
            int semester = Integer.parseInt(request.getParameter("semester_id"));
            int batch = Integer.parseInt(request.getParameter("batch_year"));

            Part photoPart = request.getPart("photo");
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/charusat", "root", "");

                PreparedStatement ps;
                if (photoPart != null && photoPart.getSize() > 0) {
                    InputStream photoStream = photoPart.getInputStream();

                    ps = con.prepareStatement(
                            "UPDATE ADMIN_STUD SET SNAME=?, SEMAIL=?, SGOB=?, SPHONE=?, PASSWORD=?, "
                            + "SADD=?, SGENDER=?, DID=?, SEMESTER=?, BATCH=?, SPHOTO=? WHERE SID=?");

                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setDate(3, java.sql.Date.valueOf(dob));
                    ps.setString(4, phone);
                    ps.setString(5, pass);
                    ps.setString(6, address);
                    ps.setString(7, gender);
                    ps.setInt(8, deptId);
                    ps.setInt(9, semester);
                    ps.setInt(10, batch);
                    ps.setBlob(11, photoStream);
                    ps.setInt(12, sid);

                } 
                else {
                    ps = con.prepareStatement(
                            "UPDATE ADMIN_STUD SET SNAME=?, SEMAIL=?, SGOB=?, SPHONE=?, PASSWORD=?, "
                            + "SADD=?, SGENDER=?, DID=?, SEMESTER=?, BATCH=? WHERE SID=?");

                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setDate(3, java.sql.Date.valueOf(dob));
                    ps.setString(4, phone);
                    ps.setString(5, pass);
                    ps.setString(6, address);
                    ps.setString(7, gender);
                    ps.setInt(8, deptId);
                    ps.setInt(9, semester);
                    ps.setInt(10, batch);
                    ps.setInt(11, sid);
                }

                ps.executeUpdate();
                ps.close();
                con.close();

                response.sendRedirect("admin_module/student.jsp?success=Student updated successfully");

            } catch (Exception e) {
                out.println(e);
                response.sendRedirect("admin_module/student.jsp?error=Update failed");
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
