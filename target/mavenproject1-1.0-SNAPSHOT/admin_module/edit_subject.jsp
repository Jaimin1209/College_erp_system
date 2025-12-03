<%-- 
    Document   : edit_subject
    Created on : 18 Nov 2025, 8:54:47 pm
    Author     : PRITESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
    <title>Edit Subject</title>
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

        <h2 class="text-center mb-4">Edit Subject</h2>

        <div class="card shadow">
            <div class="card-header bg-warning">
                <h5>Update Subject Details</h5>
            </div>

            <div class="card-body">

                <form action="UpdateSubjectServlet" method="post">

                    <input type="hidden" name="subject_id" value="1">

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Subject Name</label>
                        <div class="col-sm-9">
                            <input type="text"
                                   name="subject_name"
                                   class="form-control"
                                   value="Advanced Java"
                                   required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Subject Code</label>
                        <div class="col-sm-9">
                            <input type="text"
                                   name="subject_code"
                                   class="form-control"
                                   value="CS-401"
                                   required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Department</label>
                        <div class="col-sm-9">
                            <select name="dept_id" class="form-select" required>
                                <option value="">Select Department</option>
                                <option value="1" selected>1 - Computer Science</option>
                                <option value="2">2 - Electrical Engineering</option>
                                <option value="3">3 - Mechanical</option>
                            </select>
                        </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Semester</label>
                        <div class="col-sm-9">
                            <select name="semester_id" class="form-select" required>
                                <option value="">Select Semester</option>
                                <option value="1">1 - First Semester</option>
                                <option value="2">2 - Second Semester</option>
                                <option value="3">3 - Third Semester</option>
                                <option value="4" selected>4 - Fourth Semester</option> 
                                <option value="5">5 - Fifth Semester</option>
                                <option value="6">6 - Sixth Semester</option>
                            </select>
                        </div>
                    </div>

                    <button class="btn btn-primary w-100">Update Subject</button>

                </form>

            </div>
        </div>

    </div>
</div>

</body>
</html>