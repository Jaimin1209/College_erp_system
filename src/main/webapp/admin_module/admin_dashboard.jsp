<%-- Document : admin_dashboard Created on : 18 Nov 2025, 8:06:02 pm Author : --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ page session="true" %>



                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Admin Dashboard - College ERP</title>
                    <style>
                        <%@include file="stylesheet/admin_dashboard.css" %>
                    </style>
                </head>

                <body>
                    <div class="sidebar">
                        <div class="nav-title">ADMIN PANEL</div>
                        <a href="admin_dashboard.jsp">📊 Dashboard</a>
                        <a href="department.jsp">🏢 Departments</a>
                        <a href="#">📚 Courses</a>
                        <a href="subjects.jsp">📖 Subjects</a>
                        <a href="faculty.jsp">👨‍🏫 Faculty</a>
                        <a href="student.jsp">👨‍🎓 Students</a>
                        <a href="class_allocation.jsp">📅 Subject Allocation</a>
                        <a href="timetable.jsp">⏰ Add Time-table</a>
                        <a href="logout.jsp">🚪 Logout</a>
                    </div>

                    <div class="content-area">
                        <div class="container">
                            <h1>📊 Administrator Dashboard</h1>

                            <hr>

                            <div class="row">
                                <div class="col">
                                    <a href="department.jsp" class="btn btn-primary">🏢 Manage Departments</a>
                                </div>
                                <div class="col">
                                    <a href="course.jsp" class="btn btn-warning">📚 Manage Courses</a>
                                </div>
                                <div class="col">
                                    <a href="subjects.jsp" class="btn btn-info">📖 Manage Subjects</a>
                                </div>
                                <div class="col">
                                    <a href="faculty.jsp" class="btn btn-secondary">👨‍🏫 Manage Faculty</a>
                                </div>
                                <div class="col">
                                    <a href="student.jsp" class="btn btn-success">👨‍🎓 Manage Students</a>
                                </div>
                                <div class="col">
                                    <a href="class_allocation.jsp" class="btn btn-primary">📅 Subject Allocation</a>
                                </div>
                                <div class="col">
                                    <a href="timetable.jsp" class="btn btn-primary">📅 Manage Time-Table</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </body>

                </html>