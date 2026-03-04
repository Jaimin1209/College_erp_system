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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.annotation.MultipartConfig;

@MultipartConfig(
    maxFileSize = 5 * 1024 * 1024,      // 5 MB
    maxRequestSize = 10 * 1024 * 1024
)

/**
 *
 * @author jaimin
 */
public class EditFacultyModuleServlet extends HttpServlet {

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
                Integer fidObj = (Integer) request.getSession().getAttribute("fid");

                if (fidObj == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }

                int fid = fidObj;

                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String add = request.getParameter("add");
                String quali = request.getParameter("quali");
                String speci = request.getParameter("speci");
                String exp = request.getParameter("exp");
                Part photoPart = request.getPart("photo");

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/charusat", "root", "");
                PreparedStatement ps;

                if (photoPart != null && photoPart.getSize() > 0) {
                    InputStream photoStream = photoPart.getInputStream();

                    String sql = "UPDATE ADMIN_FACULTY SET FEMAIL=?, FPHONE=?, FADD=?,DQUALI = ?, FSPECI=?, FEXP=?,FPHOTO = ? WHERE FID=?";

                    ps = con.prepareStatement(sql);

                    ps.setString(1, email);
                    ps.setString(2, phone);
                    ps.setString(3, add);
                    ps.setString(4, quali);
                    ps.setString(5, speci);
                    ps.setString(6, exp);
                    ps.setBlob(7, photoStream);
                    ps.setInt(8, fid);
                } else {
                    String sql = "UPDATE ADMIN_FACULTY SET FEMAIL=?, FPHONE=?, FADD=?, DQUALI=?, FSPECI=?, FEXP=? WHERE FID=?";

                    ps = con.prepareStatement(sql);

                    ps.setString(1, email);
                    ps.setString(2, phone);
                    ps.setString(3, add);
                    ps.setString(4, quali);
                    ps.setString(5, speci);
                    ps.setString(6, exp);
                    ps.setInt(7, fid);
                }

                ps.executeUpdate();
                ps.close();
                con.close();
                response.sendRedirect("faculty_module/faculty_profile.jsp?success=Faculty updated successfully");

            } catch (Exception e) {
                out.println(e);
//                response.sendRedirect("faculty_module/faculty_profile.jsp?error=Update failed");
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
