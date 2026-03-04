/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.annotation.MultipartConfig;

/**
 *
 * @author jaimin
 */
@WebServlet(urlPatterns = {"/FacultyServlet"})
@MultipartConfig(maxFileSize = 16177215)
public class FacultyServlet extends HttpServlet {

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
                String fcode = request.getParameter("fcode");
                String fnm = request.getParameter("full_name");
                String email = request.getParameter("email");
                String dob = request.getParameter("dob");
                String phone = request.getParameter("phone");
                String gender = request.getParameter("gender");
                String add = request.getParameter("add");
                String pass = request.getParameter("pass");
                String doj = request.getParameter("doj");
                int did = Integer.parseInt(request.getParameter("dept_id"));
                int id = Integer.parseInt(request.getParameter("subject_id"));
                int cid = Integer.parseInt(request.getParameter("c_id"));
                String desig = request.getParameter("designation");
                String quali = request.getParameter("qualification");
                String exp = request.getParameter("experience");
                String speci = request.getParameter("specification");

                Part photoPart = request.getPart("photo");
                InputStream photoStream = null;
                if (photoPart != null) {
                    photoStream = photoPart.getInputStream();
                }

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/charusat", "root", "");

                PreparedStatement ps = conn.prepareStatement("INSERT INTO ADMIN_FACULTY (FCODE,FNAME,FDOB,FDOJ,FGENDER,FADD,FEMAIL,FPHONE,PASSWORD,DID,ID,CID,FDESIG,DQUALI,FSPECI,FEXP,FPHOTO) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

                ps.setString(1, fcode);
                ps.setString(2, fnm);
                ps.setDate(3, java.sql.Date.valueOf(dob));
                ps.setDate(4, java.sql.Date.valueOf(doj));
                ps.setString(5, gender);
                ps.setString(6, add);
                ps.setString(7, email);
                ps.setString(8, phone);
                ps.setString(9, pass);
                ps.setInt(10, did);
                ps.setInt(11, id);
                ps.setInt(12, cid);
                ps.setString(13, desig);
                ps.setString(14, quali);
                ps.setString(15, speci);
                ps.setString(16, exp);

                if (photoStream != null) {
                    ps.setBlob(17, photoStream);
                } else {
                    ps.setNull(17, java.sql.Types.BLOB);
                }
                ps.executeUpdate();

                ps.close();
                conn.close();
                response.sendRedirect("admin_module/faculty.jsp?success=Faculty added successfully");

            } catch (Exception e) {
                out.println(e);
                response.sendRedirect("admin_module/faculty.jsp?error=Insert failed");
            }

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FacultyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FacultyServlet at " + request.getContextPath() + "</h1>");
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
