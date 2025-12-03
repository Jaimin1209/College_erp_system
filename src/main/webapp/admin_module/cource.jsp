<%-- 
    Document   : course
    Created on : [Current Date]
    Author     : PRITESH (Converted for Professional Use)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Course Management - College ERP</title>
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
                <h2>📚 Manage Courses</h2>

                <% if (request.getParameter("error") != null) { %>
                    <div class="alert alert-error"><%= request.getParameter("error") %></div>
                <% } %>
                <% if (request.getParameter("success") != null) { %>
                    <div class="alert alert-success"><%= request.getParameter("success") %></div>
                <% } %>

                <div class="card">
                    <div class="card-header">
                        Add New Course
                    </div>
                    <div class="card-body">
                        <form method="post" action="CourseServlet"> <!-- Changed to servlet for processing -->
                            <div class="form-group">
                                <label for="course_name">Course Name</label>
                                <input type="text" id="course_name" class="form-control" name="course_name" placeholder="e.g., Bachelor of Technology" required>
                            </div>

                            <div class="form-group">
                                <label for="dept_id">Department</label>
                                <select id="dept_id" class="form-select" name="dept_id" required>
                                    <option value="">Select Department</option>
                                  
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="duration">Course Duration (Years)</label>
                                <input type="number" id="duration" min="1" max="6" class="form-control" name="duration" placeholder="e.g., 4" required>
                            </div>

                            <button type="submit" class="btn w-100">Add Course</button>
                        </form>
                    </div>
                </div>

                <hr>

                <div class="card">
                    <div class="card-header" style="background-color: #343a40;">
                        All Courses
                    </div>
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Course ID</th>
                                    <th>Course Name</th>
                                    <th>Department</th>
                                    <th>Duration (Yrs)</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                    
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>