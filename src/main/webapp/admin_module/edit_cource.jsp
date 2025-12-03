<%-- 
    Document   : edit_cource
    Created on : 18 Nov 2025, 11:44:25 pm
    Author     : PRITESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Course - College ERP</title>
        <style>
           <%@include file="stylesheet/common.css" %>
        </style>
    </head>
    <body>
       <div class="sidebar">
            <div class="nav-title">ADMIN PANEL</div>
            <a href="admin_dashboard.jsp">📊 Dashboard</a>
            <a href="department.jsp">🏢 Departments</a>
            <a href="cource.jsp">📚 Courses</a>
            <a href="subjects.jsp">📖 Subjects</a>
            <a href="faculty.jsp">👨‍🏫 Faculty</a>
            <a href="student.jsp">👨‍🎓 Students</a>
            <a href="class_allocation.jsp">📅 Subject Allocation</a>
            <a href="timetable.jsp">⏰ Add Time-table</a>
            <a href="logout.jsp">🚪 Logout</a>
        </div>

        <div class="content-area">
            <div class="container">
                <h2>📝 Edit Course</h2>

                <% if (request.getParameter("error") != null) { %>
                    <div class="alert alert-error"><%= request.getParameter("error") %></div>
                <% } %>
                <% if (request.getParameter("success") != null) { %>
                    <div class="alert alert-success"><%= request.getParameter("success") %></div>
                <% } %>

                <div class="card">
                    <div class="card-header">
                        Update Course Details
                    </div>
                    <div class="card-body">
                        <form action="CourseServlet" method="post"> <!-- Changed to servlet for processing -->
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="course_id" value="">

                            <div class="form-group">
                                <label for="course_name">Course Name</label>
                                <input type="text" id="course_name" class="form-control" name="course_name" value="" required>
                            </div>

                            <div class="form-group">
                                <label for="dept_id">Department</label>
                                <select id="dept_id" class="form-select" name="dept_id" required>
                                    <option value="">Select Department</option>
                                  
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="duration">Duration (Years)</label>
                                <input type="number" id="duration" min="1" max="6" class="form-control" name="duration" value="" required>
                            </div>

                            <button type="submit" class="btn">Update Course</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
