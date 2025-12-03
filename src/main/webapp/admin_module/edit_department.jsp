<%-- 
    Document   : edit_department
    Created on : 18 Nov 2025, 11:44:46 pm
    Author     : PRITESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Department | Admin Panel</title>
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
                <h2 class="text-center mb-4">Edit Department</h2>

                <div class="card shadow">
                    <div class="card-header bg-info text-white">
                        <h5>Update Department</h5>
                    </div>

                    <div class="card-body">
                        <form action="UpdateDepartmentServlet" method="post">

                            <input type="hidden" name="dept_id" value="101">

                            <div class="mb-3">
                                <label class="form-label">Department Name</label>
                                <input type="text" class="form-control" name="dept_name" value="Computer Science and Engineering" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Short Name</label>
                                <input type="text" class="form-control" name="short_name" value="CSE" required>
                            </div>

                            <button class="btn btn-primary w-100">Update Department</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>