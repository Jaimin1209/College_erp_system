<%-- 
    Document   : student
    Created on : 18 Nov 2025, 11:32:16 pm
    Author     : PRITESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management | Admin Panel</title>
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

        <h2 class="text-center mb-4">Manage Students</h2>

        <div class="card shadow mb-4">
            <div class="card-header bg-primary text-white">
                <h5>Add New Student</h5>
            </div>

            <div class="card-body">

                <form action="AddStudentServlet" method="post" enctype="multipart/form-data">

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Enrollment No</label>
                        <div class="col-sm-9">
                            <input type="text" name="enroll_no" class="form-control" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Full Name</label>
                        <div class="col-sm-9">
                            <input type="text" name="full_name" class="form-control" required>
                        </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Email</label>
                        <div class="col-sm-9">
                            <input type="email" name="email" class="form-control" required>
                        </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Phone</label>
                        <div class="col-sm-9">
                            <input type="text" name="phone" class="form-control" required>
                        </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Gender</label>
                        <div class="col-sm-9">
                            <select name="gender" class="form-select" required>
                                <option value="">Select Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Other</option>
                            </select>
                        </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Address</label>
                        <div class="col-sm-9">
                            <textarea name="address" class="form-control" required></textarea>
                        </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Department</label>
                        <div class="col-sm-9">

                            <select name="dept_id" class="form-select" required>
                                <option value="">Select Department</option>
                                <option value="101">101 - Computer Science</option>
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
                                <option value="2">2 - Second Semester</option>
                                <option value="3">3 - Third Semester</option>
                            </select>

                        </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Batch Year</label>
                        <div class="col-sm-9">
                            <input type="text" name="batch_year" class="form-control" placeholder="2023" required>
                        </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Profile Photo</label>
                        <div class="col-sm-9">
                            <input type="file" name="photo" class="form-control" required>
                        </div>
                    </div>

                    <button class="btn btn-success w-100">Add Student</button>

                </form>

            </div>
        </div>


        <div class="card shadow">
            <div class="card-header bg-dark text-white">
                <h5>All Students</h5>
            </div>

            <div class="card-body">

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Photo</th>
                            <th>Enroll No</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Dept</th>
                            <th>Sem</th>
                            <th>Batch</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>
                                <img src="placeholder_male.jpg" alt="Photo" class="student-photo">
                            </td>
                            <td>CS1001</td>
                            <td>Eliza Johnson</td>
                            <td>eliza@erp.com</td>
                            <td>9988776655</td>
                            <td>101 - Computer Science</td>
                            <td>1 - First Semester</td>
                            <td>2023</td>
                            <td>
                                <a href="edit_student.jsp" class="btn btn-primary btn-sm">Edit</a>
                                <a href="DeleteStudentServlet" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="placeholder_female.jpg" alt="Photo" class="student-photo">
                            </td>
                            <td>EE2005</td>
                            <td>Robert Davis</td>
                            <td>robert@erp.com</td>
                            <td>9001122334</td>
                            <td>205 - Electrical Engineering</td>
                            <td>3 - Third Semester</td>
                            <td>2022</td>
                            <td>
                                <a href="edit_student.jsp?id=2" class="btn btn-primary btn-sm">Edit</a>
                                <a href="DeleteStudentServlet?id=2" class="btn btn-danger btn-sm">Delete</a>
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