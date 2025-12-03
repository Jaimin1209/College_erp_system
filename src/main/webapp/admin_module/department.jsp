<%-- 
    Document   : department
    Created on : 18 Nov 2025, 8:14:45 pm
    Author     : PRITESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page session="true" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Department Management - College ERP</title>
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
                <h2>🏢 Manage Departments</h2>

                <% if (request.getParameter("error") != null) {%>
                <div class="alert alert-error"><%= request.getParameter("error")%></div>
                <% } %>
                <% if (request.getParameter("success") != null) {%>
                <div class="alert alert-success"><%= request.getParameter("success")%></div>
                <% }%>

                <div class="card">
                    <div class="card-header">
                        Add New Department
                    </div>
                    <div class="card-body">
                        <form method="post" action="DepartmentServlet"> <!-- Changed to servlet for processing -->
                            <div class="form-group">
                                <label for="dept_name">Department Name</label>
                                <input type="text" id="dept_name" class="form-control" name="dept_name" placeholder="e.g., Computer Science and Engineering" required>
                            </div>

                            <div class="form-group">
                                <label for="code">Code</label>
                                <input type="text" id="code" class="form-control" name="code" placeholder="e.g., CSE">
                                <small class="form-text">Optional short code (e.g., CS, ME)</small>
                            </div>

                            <button type="submit" class="btn">Add Department</button>
                        </form>
                    </div>
                </div>

                <hr>

                <div class="card">
                    <div class="card-header" style="background-color: #343a40;">
                        All Departments
                    </div>
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Department Name</th>
                                    <th>Code</th>
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