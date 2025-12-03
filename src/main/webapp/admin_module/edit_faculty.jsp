<%-- 
    Document   : edit_faculty
    Created on : 18 Nov 2025, 11:26:43 pm
    Author     : PRITESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Faculty | Admin Panel</title>
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

        <h2 class="text-center mb-4">Edit Faculty Details</h2>

        <div class="card shadow">
            <div class="card-header bg-warning">
                <h5>Edit Faculty</h5>
            </div>

            <div class="card-body">

                <form action="UpdateFacultyServlet" method="post">

                    <input type="hidden" name="faculty_id" value="1">

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Full Name</label>
                        <div class="col-sm-9">
                            <input type="text" name="full_name" class="form-control"
                                   value="Dr. Alan Turing" required> </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Email</label>
                        <div class="col-sm-9">
                            <input type="email" name="email" class="form-control"
                                   value="alan.turing@erp.com" required> </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Phone</label>
                        <div class="col-sm-9">
                            <input type="text" name="phone" class="form-control"
                                   value="9876543210" required> </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Department</label>
                        <div class="col-sm-9">

                            <select name="dept_id" class="form-select" required>
                                <option value="">Select Department</option>

                                <option value="1" selected>1 - Computer Science</option> <option value="2">2 - Electrical Engineering</option>
                                <option value="3">3 - Mechanical</option>

                            </select>
                        </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Subject</label>
                        <div class="col-sm-9">

                            <select name="subject_id" class="form-select" required>
                                <option value="">Select Subject</option>

                                <option value="1">1 - Advanced Java</option>
                                <option value="2" selected>2 - Data Structures</option> <option value="3">3 - Thermodynamics</option>

                            </select>
                        </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Designation</label>
                        <div class="col-sm-9">
                            <input type="text" name="designation" class="form-control"
                                   value="Professor" required> </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Qualification</label>
                        <div class="col-sm-9">
                            <input type="text" name="qualification" class="form-control"
                                   value="PhD (Mathematics)" required> </div>
                    </div>

                    <button class="btn btn-primary w-100">Update Faculty</button>

                </form>

            </div>
        </div>

    </div>
</div>

</body>
</html>