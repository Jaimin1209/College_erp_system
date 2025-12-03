<%-- 
    Document   : manage_faculties
    Created on : 29 Nov 2025, 4:50:01 pm
    Author     : PRITESH
--%>

<%--
    Document   : faculty
    Created on : 18 Nov 2025, 8:06:02 pm
    Author     :
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    // Session validation: Ensure user is logged in and has ADMIN role
  /*  User user = (User) session.getAttribute("user");
    if (user == null || user.getRole() != User.Role.ADMIN) {
        response.sendRedirect("login.jsp?error=Access denied. Admin login required.");
        return;
    }*/
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard - Manage Faculty</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            /* Reset and Base Styles */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f8f9fa;
                color: #333;
                line-height: 1.6;
            }

            /* Sidebar */
            .sidebar {
                width: 250px;
                height: 100vh;
                background-color: #343a40;
                position: fixed;
                top: 0;
                left: 0;
                overflow-y: auto;
                padding-top: 20px;
                box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            }
            .sidebar .nav-title {
                color: #fff;
                font-size: 1.2em;
                font-weight: bold;
                padding: 15px 20px;
                border-bottom: 1px solid #495057;
            }
            .sidebar a {
                display: block;
                color: #adb5bd;
                text-decoration: none;
                padding: 15px 20px;
                transition: all 0.3s;
                border-bottom: 1px solid #495057;
            }
            .sidebar a:hover, .sidebar a.active {
                background-color: #495057;
                color: #fff;
                border-left: 4px solid #007bff;
            }
            .sidebar a i {
                margin-right: 10px;
            }

            /* Content Area */
            .content-area {
                margin-left: 250px;
                padding: 30px;
                min-height: 100vh;
            }
            .container {
                background: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                max-width: 100%;
            }
            .container h1 {
                color: #343a40;
                margin-bottom: 20px;
                text-align: center;
                font-weight: 700;
            }
            hr {
                border: 0;
                height: 1px;
                background: #dee2e6;
                margin-bottom: 30px;
            }

            /* Button Styles */
            .btn {
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 0.9em;
                font-weight: 600;
                text-align: center;
                transition: background-color 0.3s;
                display: inline-block;
                margin-right: 10px;
            }
            .btn-primary {
                background-color: #007bff;
                color: white;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .btn-success {
                background-color: #28a745;
                color: white;
            }
            .btn-success:hover {
                background-color: #218838;
            }
            .btn-warning {
                background-color: #ffc107;
                color: #212529;
            }
            .btn-warning:hover {
                background-color: #e0a800;
            }
            .btn-danger {
                background-color: #dc3545;
                color: white;
            }
            .btn-danger:hover {
                background-color: #c82333;
            }
            .text-right {
                text-align: right;
            }
            .mt-3 {
                margin-top: 1rem;
            }
            .mt-4 {
                margin-top: 1.5rem;
            }

            /* Table Styles */
            .table {
                width: 100%;
                margin-top: 20px;
                border-collapse: collapse;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }
            .table th, .table td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #dee2e6;
            }
            .table th {
                background-color: #007bff;
                color: white;
                font-weight: 600;
            }
            .table tbody tr:nth-child(even) {
                background-color: #f8f9fa;
            }
            .table tbody tr:hover {
                background-color: #e9ecef;
            }

            /* Form Styles */
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: 600;
                color: #495057;
            }
            .form-control {
                width: 100%;
                padding: 10px;
                border: 1px solid #ced4da;
                border-radius: 5px;
                font-size: 1em;
                transition: border-color 0.3s, box-shadow 0.3s;
            }
            .form-control:focus {
                outline: none;
                border-color: #007bff;
                box-shadow: 0 0 0 0.2rem rgba(0,123,255,0.25);
            }
            .modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.5);
                justify-content: center;
                align-items: center;
            }
            .modal-content {
                background: white;
                padding: 20px;
                border-radius: 8px;
                width: 90%;
                max-width: 500px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            }
            .close {
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .sidebar {
                    width: 100%;
                    height: auto;
                    position: relative;
                }
                .content-area {
                    margin-left: 0;
                    padding: 20px;
                }
                .table th, .table td {
                    padding: 10px;
                    font-size: 0.9em;
                }
            }
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
                <h1><i class="fas fa-user-tie"></i> Manage Faculty</h1>
                <hr>

                <div class="text-right mt-3">
                    <button class="btn btn-success" onclick="openModal('add')"><i class="fas fa-plus"></i> Add New Faculty</button>
                </div>

                <!-- Faculty Table -->
                <table class="table mt-4">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Department</th>
                            <th>Phone</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Example Static Data - Replace with dynamic data -->
                        <tr>
                            <td>F001</td>
                            <td>Dr. Jane Smith</td>
                            <td>jane.smith@university.edu</td>
                            <td>Computer Science</td>
                            <td>+1 234 567 8901</td>
                            <td>
                                <button class="btn btn-warning btn-sm" onclick="openModal('edit', 'F001')"><i class="fas fa-edit"></i> Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteFaculty('F001')"><i class="fas fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>F002</td>
                            <td>Prof. Alex Jones</td>
                            <td>alex.jones@university.edu</td>
                            <td>Electrical Engineering</td>
                            <td>+1 234 567 8902</td>
                            <td>
                                <button class="btn btn-warning btn-sm" onclick="openModal('edit', 'F002')"><i class="fas fa-edit"></i> Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteFaculty('F002')"><i class="fas fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>F003</td>
                            <td>Dr. Emily Davis</td>
                            <td>emily.davis@university.edu</td>
                            <td>Mechanical Engineering</td>
                            <td>+1 234 567 8903</td>
                            <td>
                                <button class="btn btn-warning btn-sm" onclick="openModal('edit', 'F003')"><i class="fas fa-edit"></i> Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteFaculty('F003')"><i class="fas fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                        <!-- Add more rows as needed -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Modal for Add/Edit Faculty -->
        <div id="facultyModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2 id="modalTitle">Add New Faculty</h2>
                <form id="facultyForm" action="#" method="post">
                    <input type="hidden" id="facultyId" name="faculty_id">
                    <div class="form-group">
                        <label for="facultyName">Name</label>
                        <input type="text" id="facultyName" name="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="facultyEmail">Email</label>
                        <input type="email" id="facultyEmail" name="email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="department">Department</label>
                        <select id="department" name="dept_id" class="form-control" required>
                            <option value="">Select Department</option>
                            <option value="1">Computer Science</option>
                            <option value="2">Electrical Engineering</option>
                            <option value="3">Mechanical Engineering</option>
                            <option value="4">Civil Engineering</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="facultyPhone">Phone</label>
                        <input type="tel" id="facultyPhone" name="phone" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Save Faculty</button>
                </form>
            </div>
        </div>

        <script>
            function openModal(action, id = null) {
                const modal = document.getElementById('facultyModal');
                const title = document.getElementById('modalTitle');
                const form = document.getElementById('facultyForm');
                const facultyId = document.getElementById('facultyId');

                if (action === 'add') {
                    title.textContent = 'Add New Faculty';
                    form.reset();
                    facultyId.value = '';
                } else if (action === 'edit') {
                    title.textContent = 'Edit Faculty';
                    // Populate form with data (static example)
                    facultyId.value = id;
                    // In a real app, fetch data via AJAX
                    if (id == 'F001') {
                        document.getElementById('facultyName').value = 'Dr. Jane Smith';
                        document.getElementById('facultyEmail').value = 'jane.smith@university.edu';
                        document.getElementById('department').value = '1';
                        document.getElementById('facultyPhone').value = '+1 234 567 8901';
                    }
                    // Add more conditions for other IDs
                }
                modal.style.display = 'flex';
            }

            function closeModal() {
                document.getElementById('facultyModal').style.display = 'none';
            }

            function deleteFaculty(id) {
                if (confirm('Are you sure you want to delete this faculty member?')) {
                    // Handle delete logic here
                    alert('Faculty deleted (static example)');
                }
            }

            // Close modal when clicking outside
            window.onclick = function(event) {
                const modal = document.getElementById('facultyModal');
                if (event.target == modal) {
                    modal.style.display = 'none';
                }
            }
        </script>
    </body>
</html>