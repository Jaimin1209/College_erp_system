<%-- 
    Document   : subjects
    Created on : 18 Nov 2025, 8:47:59 pm
    Author     : PRITESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
    <title>Subjects | Admin Panel</title>
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
        <h2 class="text-center mb-4">Manage Subjects</h2>

        <div class="card shadow mb-4-card">
            <div class="card-header bg-primary text-white">
                <h5>Add New Subject</h5>
            </div>

            <div class="card-body">

                <form action="AddSubjectServlet" method="post">

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Subject Name</label>
                        <div class="col-sm-9">
                            <input type="text" name="subject_name" class="form-control" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Subject Code</label>
                        <div class="col-sm-9">
                            <input type="text" name="subject_code" class="form-control" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Department</label>
                        <div class="col-sm-9">
                            <select name="dept_id" class="form-select" required>
                                <option value="">Select Department</option>
                                <option value="1">101 - Computer Science</option>
                                <option value="2">205 - Electrical Engineering</option>
                                <option value="3">310 - Mechanical</option>
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
                            </select>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-success w-100">Add Subject</button>

                </form>

            </div>
        </div>


        <div class="card shadow">
            <div class="card-header bg-dark text-white">
                <h5>All Subjects</h5>
            </div>

            <div class="card-body">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Subject Name</th>
                            <th>Code</th>
                            <th>Department</th>
                            <th>Semester</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Data Structures</td>
                            <td>CS-301</td>
                            <td>101 - Computer Science</td>
                            <td>3 - Third Semester</td>
                            <td>
                                <a href="edit_subject.jsp" class="btn btn-sm btn-primary">Edit</a>
                                <a href="DeleteSubjectServlet?id=1" class="btn btn-sm btn-danger">Delete</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Digital Logic Design</td>
                            <td>EE-205</td>
                            <td>205 - Electrical Engineering</td>
                            <td>2 - Second Semester</td>
                            <td>
                                <a href="edit_subject.jsp" class="btn btn-sm btn-primary">Edit</a>
                                <a href="DeleteSubjectServlet?id=2" class="btn btn-sm btn-danger">Delete</a>
                            </td>
                        </tr>
                    </tbody>

                </table>
            </div>
        </div>

    </div>
</div>

</body>
</html>