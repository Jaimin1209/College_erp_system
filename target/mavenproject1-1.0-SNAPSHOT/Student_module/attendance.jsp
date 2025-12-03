<%--
    Document : attendance
    Created on : 27 Nov 2025, 11:32:33 pm
    Author : PRITESH
    Description: Professional view of student attendance summary and history with Sidebar.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Student Attendance</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            /* Embedded CSS for professional styling */
            :root {
                --sidebar-width: 250px;
                --student-accent: #4ecdc4;
                --student-accent-dark: #30a9a3;
            }

            body {
                font-family: 'Inter', sans-serif;
                background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
                margin: 0;
                padding: 0;
                line-height: 1.6;
                display: flex; /* Enable flexbox for sidebar and main content layout */
            }

            /* --- Sidebar Styling (Copied from Student Dashboard) --- */
            .sidebar {
                width: var(--sidebar-width);
                background-color: #2c3e50; /* Dark background for contrast */
                color: white;
                padding-top: 20px;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
                position: fixed; /* Fixed position */
                height: 100vh;
                overflow-y: auto;
                transition: transform 0.3s ease;
                z-index: 1050;
            }

            .sidebar a {
                display: flex;
                align-items: center;
                padding: 15px 20px;
                text-decoration: none;
                color: #ecf0f1;
                font-weight: 600;
                transition: background-color 0.3s ease, color 0.3s ease;
                border-left: 4px solid transparent;
                font-size: 16px;
            }

            .sidebar a.active {
                background-color: #34495e;
                color: var(--student-accent);
                border-left: 4px solid var(--student-accent);
            }

            .sidebar a:hover:not(.active) {
                background-color: #34495e;
                color: var(--student-accent);
                border-left: 4px solid var(--student-accent);
            }

            .sidebar a i {
                margin-right: 15px;
                font-size: 20px;
            }

            /* --- Main Content Layout --- */
            .dashboard-container {
                display: flex;
                width: 100%;
            }

            .main-content {
                flex-grow: 1;
                margin-left: var(--sidebar-width); /* Push content to the right */
                transition: margin-left 0.3s ease;
                padding: 0;
            }

            .header {
                background: linear-gradient(135deg, var(--student-accent) 0%, var(--student-accent-dark) 100%);
                padding: 20px;
                color: white;
                text-align: center;
                font-size: 28px;
                font-weight: 700;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                position: sticky;
                top: 0;
                z-index: 1000;
                width: 100%;
            }

            .header::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(90deg, #ff6b6b, #667eea);
            }

            /* --- Content Area --- */
            .container {
                max-width: 1100px;
                margin: 30px auto;
                padding: 30px;
                background: white;
                border-radius: 12px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            }

            .page-header {
                font-size: 24px;
                color: #333;
                font-weight: 700;
                margin-bottom: 25px;
                border-left: 5px solid var(--student-accent);
                padding-left: 10px;
            }

            /* Summary Cards Styling */
            .summary {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }

            .summary-card {
                background: #f0f3ff;
                padding: 20px;
                border-radius: 10px;
                text-align: center;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
                border-bottom: 3px solid #667eea;
            }

            .summary-card h3 {
                font-size: 32px;
                font-weight: 700;
                color: #667eea;
                margin: 0 0 10px 0;
            }

            .summary-card p {
                font-size: 14px;
                color: #555;
                margin: 0;
                font-weight: 600;
                text-transform: uppercase;
            }

            .summary-card .icon {
                margin-right: 5px;
                color: var(--student-accent);
            }

            /* Table Styling */
            .attendance-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                min-width: 600px;
            }

            .attendance-table th, .attendance-table td {
                border: 1px solid #e0e0e0;
                padding: 12px;
                text-align: center;
                font-size: 14px;
            }

            .attendance-table th {
                background-color: #667eea;
                color: white;
                font-weight: 700;
                text-transform: uppercase;
            }

            .attendance-table tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .attendance-table td {
                color: #555;
            }

            .attendance-table .icon {
                margin-right: 5px;
            }

            /* Status Highlighting */
            .status-present {
                background-color: #e8f5e9;
                color: #388e3c;
                font-weight: 600;
            }

            .status-absent {
                background-color: #ffebee;
                color: #d32f2f;
                font-weight: 600;
            }

            /* Back Button (Adjusted to be inside the content area) */
            .back-btn {
                display: inline-block;
                margin-top: 30px;
                padding: 10px 20px;
                background: var(--student-accent);
                color: white;
                border-radius: 5px;
                text-decoration: none;
                font-weight: 600;
                transition: background 0.3s;
            }

            .back-btn:hover {
                background: var(--student-accent-dark);
            }

            /* Sidebar Toggle Button (for mobile) */
            .toggle-btn {
                position: fixed;
                top: 20px;
                left: 20px;
                background: var(--student-accent);
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 20px;
                z-index: 1100;
                display: none;
            }

            /* Responsive adjustments */
            @media(max-width: 1024px) {
                .sidebar {
                    transform: translateX(calc(var(--sidebar-width) * -1));
                }

                .sidebar.active {
                    transform: translateX(0);
                }

                .main-content {
                    margin-left: 0;
                }

                .toggle-btn {
                    display: block;
                }

                .header {
                    padding-left: 70px;
                }
            }

            @media(max-width: 800px){
                .container { margin: 20px 10px; padding: 20px; }
            }
        </style>
    </head>
    <body>

        <button class="toggle-btn" onclick="toggleSidebar()">
            <i class="fas fa-bars"></i>
        </button>

        <div class="dashboard-container">
            <div class="sidebar" id="sidebar">
                <div style="text-align: center; padding: 20px 0; font-size: 20px; font-weight: 700; color: white; background-color: #1e2b38;">
                    <i class="fas fa-user-graduate" style="margin-right: 5px;"></i> **Student Portal**
                </div>
                <a href="student_dashboard.jsp">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
                <a href="student_profile.jsp">
                    <i class="fas fa-user"></i> Profile
                </a>
                <a href="time_table.jsp">
                    <i class="fas fa-calendar-alt"></i> Timetable
                </a>
                <a href="attendance.jsp" class="active">
                    <i class="fas fa-chart-bar"></i> Attendance
                </a>
                <a href="result.jsp">
                    <i class="fas fa-graduation-cap"></i> Result
                </a>
                <a href="download_matirial.jsp">
                    <i class="fas fa-file-download"></i> Download Notes
                </a>
                <a href="hallticket.jsp">
                    <i class="fas fa-ticket-alt"></i> Hall Ticket
                </a>
                <a href="fees.jsp">
                    <i class="fas fa-dollar-sign"></i> Fees Status
                </a>
                <hr style="border: 0; border-top: 1px solid #34495e; margin: 10px 20px;">
                <a href="logout.jsp" style="color: #ff6b6b;">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>

            <div class="main-content">
                <div class="header">
                    <i class="fas fa-chart-bar" style="margin-right: 10px;"></i> Student Attendance
                </div>

                <div class="container">
                    <div class="page-header">Attendance Records</div>

                    <div class="summary">
                        <div class="summary-card">
                            <h3>85%</h3>
                            <p><i class="fas fa-calendar-check icon"></i>Overall Attendance</p>
                        </div>
                        <div class="summary-card">
                            <h3>42/50</h3>
                            <p><i class="fas fa-check-circle icon"></i>Classes Attended</p>
                        </div>
                        <div class="summary-card">
                            <h3>8/50</h3>
                            <p><i class="fas fa-times-circle icon"></i>Classes Missed</p>
                        </div>
                    </div>

                    <div style="overflow-x: auto;">
                        <table class="attendance-table">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Subject</th>
                                    <th>Status</th>
                                    <th>Remarks</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2025-11-01</td>
                                    <td><i class="fas fa-code icon"></i>Data Structures</td>
                                    <td class="status-present"><i class="fas fa-check icon"></i>Present</td>
                                    <td>On Time</td>
                                </tr>
                                <tr>
                                    <td>2025-11-02</td>
                                    <td><i class="fas fa-brain icon"></i>AI & ML</td>
                                    <td class="status-present"><i class="fas fa-check icon"></i>Present</td>
                                    <td>On Time</td>
                                </tr>
                                <tr>
                                    <td>2025-11-03</td>
                                    <td><i class="fas fa-network-wired icon"></i>Computer Networks</td>
                                    <td class="status-absent"><i class="fas fa-times icon"></i>Absent</td>
                                    <td>Sick Leave</td>
                                </tr>
                                <tr>
                                    <td>2025-11-04</td>
                                    <td><i class="fas fa-database icon"></i>Database Systems</td>
                                    <td class="status-present"><i class="fas fa-check icon"></i>Present</td>
                                    <td>On Time</td>
                                </tr>
                                <tr>
                                    <td>2025-11-05</td>
                                    <td><i class="fas fa-code icon"></i>Web Development</td>
                                    <td class="status-present"><i class="fas fa-check icon"></i>Present</td>
                                    <td>On Time</td>
                                </tr>
                                <tr>
                                    <td>2025-11-06</td>
                                    <td><i class="fas fa-brain icon"></i>AI & ML</td>
                                    <td class="status-absent"><i class="fas fa-times icon"></i>Absent</td>
                                    <td>Personal Reason</td>
                                </tr>
                                <tr>
                                    <td>2025-11-07</td>
                                    <td><i class="fas fa-network-wired icon"></i>Computer Networks</td>
                                    <td class="status-present"><i class="fas fa-check icon"></i>Present</td>
                                    <td>On Time</td>
                                </tr>
                                <tr>
                                    <td>2025-11-08</td>
                                    <td><i class="fas fa-database icon"></i>Database Systems</td>
                                    <td class="status-present"><i class="fas fa-check icon"></i>Present</td>
                                    <td>On Time</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <a href="student_dashboard.jsp" class="back-btn">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
                </div>
            </div>
        </div>

        <script>
            function toggleSidebar() {
                const sidebar = document.getElementById('sidebar');
                const body = document.body;

                sidebar.classList.toggle('active');
                body.classList.toggle('sidebar-open');
            }

            // Automatically hide sidebar on larger screens if it was toggled open on mobile
            window.addEventListener('resize', () => {
                const sidebar = document.getElementById('sidebar');
                const body = document.body;
                if (window.innerWidth > 1024) {
                    sidebar.classList.remove('active');
                    body.classList.remove('sidebar-open');
                }
            });
        </script>

    </body>
</html>