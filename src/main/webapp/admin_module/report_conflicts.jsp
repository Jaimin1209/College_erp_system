<%-- 
    Document   : report_conflicts
    Created on : 29 Nov 2025, 4:50:58 pm
    Author     : PRITESH
--%>

<%--
    Document   : report_conflicts
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
        <title>Admin Dashboard - Report Conflicts</title>
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

            /* Alert Styles */
            .alert {
                padding: 15px;
                margin-bottom: 20px;
                border: 1px solid transparent;
                border-radius: 5px;
            }
            .alert-info {
                color: #0c5460;
                background-color: #d1ecf1;
                border-color: #bee5eb;
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
                <h1><i class="fas fa-exclamation-triangle"></i> Report Conflicts</h1>
                <hr>

                <div class="alert alert-info">
                    <i class="fas fa-info-circle"></i> This page displays any scheduling conflicts detected in the timetable, such as overlapping faculty assignments or room bookings. Conflicts are automatically detected and listed below.
                </div>

                <!-- Conflicts Table -->
                <table class="table mt-4">
                    <thead>
                        <tr>
                            <th>Conflict ID</th>
                            <th>Type</th>
                            <th>Description</th>
                            <th>Department</th>
                            <th>Semester</th>
                            <th>Day</th>
                            <th>Lecture</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Example Static Data - Replace with dynamic data -->
                        <tr>
                            <td>C001</td>
                            <td>Faculty Overlap</td>
                            <td>Dr. Jane Smith is assigned to two lectures at the same time.</td>
                            <td>Computer Science</td>
                            <td>1st Semester</td>
                            <td>Monday</td>
                            <td>3</td>
                            <td><span style="color: red;">Unresolved</span></td>
                            <td>
                                <button class="btn btn-warning btn-sm" onclick="resolveConflict('C001')"><i class="fas fa-check"></i> Resolve</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteConflict('C001')"><i class="fas fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>C002</td>
                            <td>Room Conflict</td>
                            <td>Room 101 is double-booked for Lab session.</td>
                            <td>Electrical Engineering</td>
                            <td>2nd Semester</td>
                            <td>Tuesday</td>
                            <td>5</td>
                            <td><span style="color: green;">Resolved</span></td>
                            <td>
                                <button class="btn btn-primary btn-sm" onclick="viewDetails('C002')"><i class="fas fa-eye"></i> View Details</button>
                            </td>
                        </tr>
                        <tr>
                            <td>C003</td>
                            <td>Subject Clash</td>
                            <td>Calculus I and Physics I scheduled simultaneously.</td>
                            <td>Mechanical Engineering</td>
                            <td>3rd Semester</td>
                            <td>Wednesday</td>
                            <td>2</td>
                            <td><span style="color: red;">Unresolved</span></td>
                            <td>
                                <button class="btn btn-warning btn-sm" onclick="resolveConflict('C003')"><i class="fas fa-check"></i> Resolve</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteConflict('C003')"><i class="fas fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                        <!-- Add more rows as needed -->
                    </tbody>
                </table>

                <div class="text-right mt-3">
                    <button class="btn btn-primary" onclick="refreshConflicts()"><i class="fas fa-sync"></i> Refresh Conflicts</button>
                </div>
            </div>
        </div>

        <script>
            function resolveConflict(id) {
                if (confirm('Are you sure you want to mark this conflict as resolved?')) {
                    // Handle resolve logic here
                    alert('Conflict ' + id + ' marked as resolved (static example)');
                    // In a real app, update the status via AJAX
                }
            }

            function deleteConflict(id) {
                if (confirm('Are you sure you want to delete this conflict report?')) {
                    // Handle delete logic here
                    alert('Conflict ' + id + ' deleted (static example)');
                }
            }

            function viewDetails(id) {
                // Handle view details logic here
                alert('Viewing details for conflict ' + id + ' (static example)');
            }

            function refreshConflicts() {
                // Handle refresh logic here
                alert('Conflicts refreshed (static example)');
                // In a real app, reload data via AJAX
            }
        </script>
    </body>
</html>