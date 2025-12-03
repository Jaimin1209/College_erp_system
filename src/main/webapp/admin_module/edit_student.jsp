<%-- 
    Document   : edit_student
    Created on : 18 Nov 2025, 11:35:58 pm
    Author     : PRITESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Student | Admin Panel</title>
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

        <h2 class="text-center mb-4">Edit Student</h2>

        <div class="card shadow">
            <div class="card-header bg-info text-white">
                <h5>Update Student Details</h5>
            </div>

            <div class="card-body">

                <form action="UpdateStudentServlet" method="post" enctype="multipart/form-data">

                    <input type="hidden" name="student_id" value="105">
                    <input type="hidden" name="old_photo" value="photos/student_105.jpg">

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Full Name</label>
                        <div class="col-sm-9">
                            <input type="text" name="name" class="form-control" value="Eliza Johnson" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Email</label>
                        <div class="col-sm-9">
                            <input type="email" name="email" class="form-control" value="eliza@erp.com" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Phone</label>
                        <div class="col-sm-9">
                            <input type="text" name="phone" class="form-control" value="9988776655" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Address</label>
                        <div class="col-sm-9">
                            <textarea name="address" class="form-control" required>123 Main St, Anytown, CA</textarea>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Gender</label>
                        <div class="col-sm-9">
                            <input type="radio" name="gender" value="Male"> Male
                            <input type="radio" name="gender" value="Female" class="ms-3" checked> Female
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Department</label>
                        <div class="col-sm-9">
                            <select name="dept_id" class="form-select" required>
                                <option value="">Select Department</option>

                                <option value="101" selected>101 - Computer Science</option>
                                <option value="205">205 - Electrical Engineering</option>
                                <option value="310">310 - Mechanical</option>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Semester</label>
                        <div class="col-sm-9">
                            <select name="semester_id" class="form-select" required>
                                <option value="">Select Semester</option>

                                <option value="1">1 - First Semester</option>
                                <option value="2" selected>2 - Second Semester</option>
                                <option value="3">3 - Third Semester</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Batch Year</label>
                        <div class="col-sm-9">
                            <input type="text" name="batch_year" class="form-control" value="2023" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Profile Photo (Leave blank to keep old)</label>
                        <div class="col-sm-9">
                            <input type="file" name="photo" class="form-control">
                            <small class="form-text text-muted">Current File: photos/student_105.jpg</small>
                        </div>
                    </div>

                    <button class="btn btn-primary w-100">Update Student</button>

                </form>

            </div>
        </div>

    </div>
</div>

</body>
</html>
