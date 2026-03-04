/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import java.sql.*;
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
public class UpdateFacultyServlet extends HttpServlet {

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
                int fid = Integer.parseInt(request.getParameter("fid"));

                String fcode = request.getParameter("fcode");
                String fname = request.getParameter("full_name");
                String email = request.getParameter("email");
                String dob = request.getParameter("dob");
                String gender = request.getParameter("gender");
                String phone = request.getParameter("phone");
                String add = request.getParameter("add");
                String pass = request.getParameter("pass");
                String doj = request.getParameter("doj");
                int did = Integer.parseInt(request.getParameter("dept_id"));
                int sid = Integer.parseInt(request.getParameter("subject_id"));
                String desig = request.getParameter("designation");
                String quali = request.getParameter("qualification");
                String speci = request.getParameter("specification");
                String exp = request.getParameter("experience");
                Part photoPart = request.getPart("photo");

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/charusat", "root", "");
                PreparedStatement ps;

                if (photoPart != null && photoPart.getSize() > 0) {
                    InputStream photoStream = photoPart.getInputStream();

                    String sql = "UPDATE ADMIN_FACULTY SET "
                            + "FCODE=?, FNAME=?, FEMAIL=?, FDOB=?, FGENDER=?, "
                            + "FPHONE=?, FADD=?, PASSWORD=?, FDOJ=?, "
                            + "DID=?, ID=?, FDESIG=?, DQUALI=?, FSPECI=?, FEXP=?,FPHOTO = ? "
                            + "WHERE FID=?";

                    ps = con.prepareStatement(sql);

                    ps.setString(1, fcode);
                    ps.setString(2, fname);
                    ps.setString(3, email);
                    ps.setDate(4, java.sql.Date.valueOf(dob));
                    ps.setString(5, gender);
                    ps.setString(6, phone);
                    ps.setString(7, add);
                    ps.setString(8, pass);
                    ps.setDate(9, java.sql.Date.valueOf(doj));
                    ps.setInt(10, did);
                    ps.setInt(11, sid);
                    ps.setString(12, desig);
                    ps.setString(13, quali);
                    ps.setString(14, speci);
                    ps.setString(15, exp);
                    ps.setBlob(16, photoStream);
                    ps.setInt(17, fid);
                } else {
                    String sql = "UPDATE ADMIN_FACULTY SET "
                            + "FCODE=?, FNAME=?, FEMAIL=?, FDOB=?, FGENDER=?, "
                            + "FPHONE=?, FADD=?, PASSWORD=?, FDOJ=?, "
                            + "DID=?, ID=?, FDESIG=?, DQUALI=?, FSPECI=?, FEXP=? "
                            + "WHERE FID=?";

                    ps = con.prepareStatement(sql);

                    ps.setString(1, fcode);
                    ps.setString(2, fname);
                    ps.setString(3, email);
                    ps.setDate(4, java.sql.Date.valueOf(dob));
                    ps.setString(5, gender);
                    ps.setString(6, phone);
                    ps.setString(7, add);
                    ps.setString(8, pass);
                    ps.setDate(9, java.sql.Date.valueOf(doj));
                    ps.setInt(10, did);
                    ps.setInt(11, sid);
                    ps.setString(12, desig);
                    ps.setString(13, quali);
                    ps.setString(14, speci);
                    ps.setString(15, exp);
                    ps.setInt(16, fid);
                }

                ps.executeUpdate();
                ps.close();
                con.close();
                response.sendRedirect("admin_module/faculty.jsp?success=Faculty updated successfully");

            } catch (Exception e) {
                out.println(e);
                response.sendRedirect("admin_module/faculty.jsp?error=Update failed");
            }

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateFacultyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateFacultyServlet at " + request.getContextPath() + "</h1>");
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
