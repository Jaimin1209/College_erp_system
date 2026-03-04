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

/**
 *
 * @author jaimin
 */
public class SaveTimetableServlet extends HttpServlet {

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

            String deptId = request.getParameter("dept_id");
            String cid = request.getParameter("c_id");
            String sem = request.getParameter("sem_id");
            String day = request.getParameter("day_name");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/charusat", "root", "");

                PreparedStatement ps = conn.prepareStatement("INSERT INTO admin_timetable (DID, ID,CID,FID, START, END,DAY,SEM ) VALUES (?,?, ?, ?, ?, ?, ?, ?)");
                for (int i = 1; i <= 7; i++) {

                    String startTime = request.getParameter("startTime_" + i);
                    String endTime = request.getParameter("endTime_" + i);
                    String subject = request.getParameter("subject_" + i);
                    String faculty = request.getParameter("faculty_" + i);

                    ps.setInt(1, Integer.parseInt(deptId));
                    ps.setInt(3,Integer.parseInt(cid));
                    ps.setString(8, sem);
                    ps.setString(7, day);

                    // LUNCH / BREAK (lecture 4)
                    if (subject == null || subject.isEmpty()) {
                        ps.setNull(2, Types.INTEGER);
                        ps.setNull(4, Types.INTEGER);
                        ps.setNull(5, Types.TIME);
                        ps.setNull(6, Types.TIME);
                    } else {
                        ps.setInt(2, Integer.parseInt(subject));                        

                        if (faculty == null || faculty.isEmpty()) {
                            ps.setNull(3, Types.INTEGER);
                        } else {
                            ps.setInt(4, Integer.parseInt(faculty));
                        }

                        ps.setTime(5, Time.valueOf(startTime + ":00"));
                        ps.setTime(6, Time.valueOf(endTime + ":00"));
                    }

                    ps.executeUpdate();
                }

                response.sendRedirect("admin_module/timetable.jsp?success=Time Table Save...");

            } catch (Exception e) {
                out.println(e);
//                response.sendRedirect("admin_module/timetable.jsp?error =insert failed");
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
