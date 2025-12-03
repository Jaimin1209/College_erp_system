<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- 
    Document   : class_allocation
    Created on : [Current Date]
    Author     : PRITESH (Converted for Professional Use)
--%>



<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Class Allocation - College ERP</title>
        <style>
            <%@include file="stylesheet/common.css" %>
             
        </style>
    </head>
    <body>
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
    </body>
        <div class="content-area">
            <div class="container">
                <h2>📅 Add Class Allocation</h2>

                <% if (request.getParameter("error") != null) { %>
                    <div class="alert alert-error"><%= request.getParameter("error") %></div>
                <% } %>
                <% if (request.getParameter("success") != null) { %>
                    <div class="alert alert-success"><%= request.getParameter("success") %></div>
                <% } %>

                <div class="card">
                    <div class="card-header">
                        Assign Class Details
                    </div>
                    <div class="card-body">
                        <form action="ClassAllocationServlet" method="post"> <!-- Changed to a servlet for processing -->
                            <div class="form-group">
                                <label for="dept_id">Department</label>
                                <select name="dept_id" id="dept_id" class="form-select" required>
                                    <option value="">Select Department</option>
                                    
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="sem_id">Semester</label>
                                <select name="sem_id" id="sem_id" class="form-select" required>
                                    <option value="">Select Semester</option>
                                    <option value="1">1 - First Semester</option>
                                    <option value="2">2 - Second Semester</option>
                                    <option value="3">3 - Third Semester</option>
                                    <!-- Add more as needed -->
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="subject_id">Subject</label>
                                <select name="subject_id" id="subject_id" class="form-select" required>
                                    <option value="">Select Subject</option>
                                   
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="faculty_id">Faculty</label>
                                <select name="faculty_id" id="faculty_id" class="form-select" required>
                                    <option value="">Select Faculty</option>
                                    
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="class_type">Class Type</label>
                                <select name="class_type" id="class_type" class="form-select" required>
                                    <option value="">Select Type</option>
                                    <option value="Theory">Theory</option>
                                    <option value="Practical">Practical</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="room_no">Room No</label>
                                <input type="text" id="room_no" class="form-control" name="room_no" placeholder="E.g. 204, Lab-1" required>
                            </div>

                            <button type="submit" class="btn-submit">Save Allocation</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>