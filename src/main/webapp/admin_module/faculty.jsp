<%-- 
    Document   : faculty
    Created on : 18 Nov 2025, 11:23:10 pm
    Author     : PRITESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Faculty Management | Admin Panel</title>
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

        <h2 class="text-center mb-4">Manage Faculty</h2>

        <div class="card shadow mb-4">
            <div class="card-header bg-primary text-white">
                <h5>Add New Faculty</h5>
            </div>

            <div class="card-body">

                <form action="AddFacultyServlet" method="post">

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
                        <label class="col-sm-3 col-form-label">Subject</label>
                        <div class="col-sm-9">
                            <select name="subject_id" class="form-select" required>
                                <option value="">Select Subject</option>
                                <option value="1">1 - Advanced Java</option>
                                <option value="2">2 - Data Structures</option>
                                <option value="3">3 - Thermodynamics</option>
                            </select>
                        </div>
                    </div>


                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Designation</label>
                        <div class="col-sm-9">
                            <input type="text" name="designation" class="form-control" placeholder="Professor / Lecturer" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Qualification</label>
                        <div class="col-sm-9">
                            <input type="text" name="qualification" class="form-control" placeholder="MCA / BCA / M.Tech" required>
                        </div>
                    </div>

                    <button class="btn btn-success w-100">Add Faculty</button>

                </form>

            </div>
        </div>


        <div class="card shadow">
            <div class="card-header bg-dark text-white">
                <h5>All Faculty Members</h5>
            </div>

            <div class="card-body">

                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Department</th>
                            <th>Subject</th>
                            <th>Designation</th>
                            <th>Qualification</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Dr. Alan Turing</td>
                            <td>alan.turing@erp.com</td>
                            <td>9876543210</td>
                            <td>101 - Computer Science</td>
                            <td>2 - Data Structures</td>
                            <td>Professor</td>
                            <td>PhD (Mathematics)</td>
                            <td>
                                <a href="edit_faculty.jsp" class="btn btn-primary btn-sm">Edit</a>
                                <a href="DeleteFacultyServlet?id=1" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Ms. Grace Hopper</td>
                            <td>grace.h@erp.com</td>
                            <td>9900112233</td>
                            <td>101 - Computer Science</td>
                            <td>1 - Advanced Java</td>
                            <td>Lecturer</td>
                            <td>MCA</td>
                            <td>
                                <a href="edit_faculty.jsp" class="btn btn-primary btn-sm">Edit</a>
                                <a href="DeleteFacultyServlet?id=2" class="btn btn-danger btn-sm">Delete</a>
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
