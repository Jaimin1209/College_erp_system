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
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.*;
import jakarta.servlet.annotation.MultipartConfig;

/**
 *
 * @author jaimin
 */
@MultipartConfig(maxFileSize = 16177215)
public class StudentServlet extends HttpServlet {

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
                 
                            String code = request.getParameter("enroll_no");
                            String name = request.getParameter("full_name");
                            String email = request.getParameter("email");
                            String dob = request.getParameter("dob");
                            String phone = request.getParameter("phone");
                            String password = request.getParameter("pass");
                            String gender = request.getParameter("gender");
                            String address = request.getParameter("address");
                            int deptId = Integer.parseInt(request.getParameter("dept_id"));
                            int semester = Integer.parseInt(request.getParameter("semester_id"));
                            int cid = Integer.parseInt(request.getParameter("c_id"));
                            int batch = Integer.parseInt(request.getParameter("batch_year"));

                            Part photoPart = request.getPart("photo");
                            InputStream photoStream = null;
                            if (photoPart != null) {
                                photoStream = photoPart.getInputStream();
                            }

                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(
                                    "jdbc:mysql://localhost:3306/charusat", "root", "");

                            String sql = "INSERT INTO admin_stud (SCODE, SNAME, SEMAIL, SGOB, SPHONE, SGENDER, PASSWORD ,SADD, DID,CID, SEMESTER, BATCH, SPHOTO )VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

                            PreparedStatement ps = conn.prepareStatement(sql);

                            ps.setString(1, code);
                            ps.setString(2, name);
                            ps.setString(3, email);
                            ps.setDate(4, java.sql.Date.valueOf(dob));
                            ps.setString(5, phone);
                            ps.setString(6, gender);
                            ps.setString(7, password);
                            ps.setString(8, address);
                            ps.setInt(9, deptId);
                            ps.setInt(10, cid);
                            ps.setInt(11, semester);
                            ps.setInt(12, batch);

                            if (photoStream != null) {
                                ps.setBlob(13, photoStream);
                            } else {
                                ps.setNull(13, java.sql.Types.BLOB);
                            }

                            ps.executeUpdate();

                            ps.close();
                            conn.close();

                            response.sendRedirect("admin_module/student.jsp?success=Student added successfully");

                } catch (Exception e) {
                            out.println(e);
                            response.sendRedirect("admin_module/student.jsp?error=Student insert failed");
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
