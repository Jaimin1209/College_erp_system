<%-- 
    Document   : edit_class_allocation
    Created on : 21 Nov 2025, 9:37:29 am
    Author     : PRITESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <title>Add Class Allocation | Admin Panel</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        /* ============================= */
        /* === BASE & LAYOUT STYLES === */
        /* ============================= */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9; 
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }

        /* ============================= */
        /* === SIDEBAR CUSTOM STYLES === */
        /* ============================= */
        .sidebar {
            height: 100%; 
            width: 250px; /* Fixed width of the sidebar */
            position: fixed; 
            z-index: 1; 
            top: 0;
            left: 0;
            background-color: #343a40; /* Dark background color */
            overflow-x: hidden; 
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
        }

        /* Sidebar links */
        .sidebar a {
            padding: 10px 20px;
            text-decoration: none;
            font-size: 16px;
            color: #f8f9fa; /* Light text color */
            display: block;
            transition: background-color 0.3s;
            border-bottom: 1px solid #454d55;
        }

        /* Change color on hover */
        .sidebar a:hover {
            background-color: #495057;
            color: #fff;
        }

        .nav-title {
            font-size: 18px;
            font-weight: 600;
            padding: 12px 20px;
            color: #fff;
            background: #212529; 
            border-bottom: 1px solid #454d55;
        }

        /* 📦 CONTENT AREA STYLES (Offset for Sidebar) */
        .content-area {
            /* IMPORTANT: Must match sidebar width (250px) */
            margin-left: 250px; 
            padding: 20px; 
        }

    </style>
</head>

<body>

<div class="sidebar">
    <div class="nav-title">ADMIN PANEL</div>

    <a href="admin_dashboard.jsp">Dashboard</a>
    <a href="department.jsp">Departments</a>
    <a href="cource.jsp">Courses</a>
    <a href="subjects.jsp">Subjects</a>
    <a href="faculty.jsp">Faculty</a>
    <a href="student.jsp">Students</a>
    <a href="#">Subject Allocation</a>
    <a href="/admin/logout">Logout</a>
</div>
<div class="content-area">
    
    <div class="container" style="max-width: 700px; margin-top: 40px;">
        <h2 class="text-center mb-4">Add Class Allocation</h2>

        <div class="row justify-content-center">
            <div class="col-12">
                <form action="edit_class_allocation.jsp" method="post" class="card p-4 shadow-lg border-0">
                    
                    <div class="card-header bg-primary text-white mb-3">
                        <h5 class="my-1">Allocation Details</h5>
                    </div>

                    <div class="card-body">
                        
                        <div class="mb-3">
                            <label class="form-label fw-bold">Teacher</label>
                            <select name="teacher" class="form-select" required>
                                <option value="">Select Teacher</option>
                                <option value="1">Dr. S. Kulkarni</option>
                                <option value="2">Prof. R. Desai</option>
                                <option value="3">Ms. V. Shah</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Course</label>
                            <select name="course" class="form-select" required>
                                <option value="">Select Course</option>
                                <option value="101">Data Structures</option>
                                <option value="102">Thermodynamics</option>
                                <option value="103">Microcontrollers</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Department</label>
                            <select name="department" class="form-select" required>
                                <option value="">Select Department</option>
                                <option value="D1">Computer Science</option>
                                <option value="D2">Mechanical Engineering</option>
                                <option value="D3">Electrical Engineering</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Year</label>
                            <select name="year" class="form-select" required>
                                <option value="FY">FY</option>
                                <option value="SY">SY</option>
                                <option value="TY">TY</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Division</label>
                            <select name="division" class="form-select" required>
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                            </select>
                        </div>

                        <a href="edit_class_allocation.jsp"></a>   <button type="submit" class="btn btn-primary w-100 mt-3">Allocate Class</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
</body>
</html>
