<%--
    Document : time_table
    Created on : 27 Nov 2025, 11:28:49 pm
    Author : PRITESH
    Description: Weekly Timetable/Schedule view for students with Sidebar.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student Timetable</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Base Variables */
        :root {
            --sidebar-width: 250px;
            --student-accent: #4ecdc4; /* Teal */
            --student-accent-dark: #30a9a3;
        }

        /* Base Styles and Layout Setup */
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            color: #333;
            line-height: 1.6;
            display: flex; /* Enable flexbox for sidebar and main content layout */
        }

        .dashboard-container {
            display: flex;
            width: 100%;
        }

        /* --- Sidebar Styling --- */
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

        /* Main Content Area */
        .main-content-wrapper {
            flex-grow: 1;
            margin-left: var(--sidebar-width); /* Push content to the right */
            transition: margin-left 0.3s ease;
            padding: 0;
            width: calc(100% - var(--sidebar-width)); /* Ensure proper width calculation */
        }

        /* Header Styling */
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
            margin-bottom: 0; /* Remove bottom margin from the header */
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

        .container {
            max-width: 1200px;
            margin: 40px auto; /* Add margin around the container */
            background: white;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            padding: 40px;
            border: 1px solid #e1e5e9;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
        }

        .container:hover {
            transform: none;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        .page-header {
            font-size: 28px;
            font-weight: 700;
            color: var(--student-accent);
            margin-bottom: 30px;
            text-align: center;
            border-bottom: 2px solid #ecf0f1;
            padding-bottom: 15px;
        }

        /* Timetable Structure */
        .timetable {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            border-radius: 12px;
            overflow: hidden;
        }

        .timetable th {
            background: linear-gradient(135deg, var(--student-accent) 0%, var(--student-accent-dark) 100%);
            color: white;
            padding: 15px;
            text-align: center;
            font-weight: 700;
            font-size: 16px;
            border: 1px solid #ddd;
        }
        
        .timetable th:first-child {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); /* Different accent for Time */
        }

        .timetable td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
            font-size: 14px;
            color: #34495e;
            transition: background-color 0.3s ease;
        }

        .timetable tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .timetable tr:hover {
            background-color: #e9ecef;
        }

        .timetable td:hover {
            background-color: #dee2e6;
        }

        /* Subject Content Styling */
        .subject {
            font-weight: 600;
            color: #2c3e50;
            display: block;
        }

        .time {
            color: #7f8c8d;
            font-weight: 600;
            font-size: 13px;
        }

        .icon {
            margin-right: 5px;
            color: var(--student-accent);
            font-size: 16px;
        }
        
        /* Lunch/No Class Styling */
        .no-class {
            color: #95a5a6;
            font-style: italic;
            background-color: #f0f3f5;
            font-weight: 500;
        }

        /* Back Button - Styled with Student Accent */
        .back-btn {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 25px;
            background: linear-gradient(135deg, var(--student-accent) 0%, var(--student-accent-dark) 100%);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(78, 205, 196, 0.3);
        }

        .back-btn:hover {
            background: linear-gradient(135deg, var(--student-accent-dark) 0%, var(--student-accent) 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(78, 205, 196, 0.5);
        }

        .back-btn i {
            margin-right: 8px;
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

            .main-content-wrapper {
                margin-left: 0;
            }

            .toggle-btn {
                display: block;
            }

            .header {
                padding-left: 70px;
            }
        }

        @media (max-width: 768px) {
            .timetable { font-size: 12px; }
            .timetable th, .timetable td { padding: 10px; }
            .container { padding: 20px; margin: 20px 10px; }
            .header { font-size: 28px; padding: 25px 15px; }
            .page-header { font-size: 24px; }
            .icon { font-size: 14px; }
        }

        @media (max-width: 480px) {
            .timetable { display: block; overflow-x: auto; white-space: nowrap; }
            .timetable th, .timetable td { min-width: 120px; }
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
            <a href="time_table.jsp" class="active">
                <i class="fas fa-calendar-alt"></i> Timetable
            </a>
            <a href="attendance.jsp">
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

        <div class="main-content-wrapper">
            <div class="header">
                <i class="fas fa-calendar-alt" style="margin-right: 10px;"></i> Student Timetable
            </div>

            <div class="container">
                <div class="page-header">Weekly Class Schedule</div>

                <div style="overflow-x: auto;">
                    <table class="timetable">
                        <thead>
                            <tr>
                                <th>Time</th>
                                <th>Monday</th>
                                <th>Tuesday</th>
                                <th>Wednesday</th>
                                <th>Thursday</th>
                                <th>Friday</th>
                                <th>Saturday</th>
                                <th>Sunday</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="time">9:00 AM - 10:00 AM</td>
                                <td><i class="fas fa-code icon"></i><div class="subject">Data Structures</div></td>
                                <td><i class="fas fa-brain icon"></i><div class="subject">AI & ML</div></td>
                                <td><i class="fas fa-network-wired icon"></i><div class="subject">Computer Networks</div></td>
                                <td><i class="fas fa-database icon"></i><div class="subject">Database Systems</div></td>
                                <td><i class="fas fa-code icon"></i><div class="subject">Web Development</div></td>
                                <td class="no-class">No Class</td>
                                <td class="no-class">No Class</td>
                            </tr>
                            <tr>
                                <td class="time">10:00 AM - 11:00 AM</td>
                                <td><i class="fas fa-brain icon"></i><div class="subject">AI & ML</div></td>
                                <td><i class="fas fa-network-wired icon"></i><div class="subject">Computer Networks</div></td>
                                <td><i class="fas fa-database icon"></i><div class="subject">Database Systems</div></td>
                                <td><i class="fas fa-code icon"></i><div class="subject">Web Development</div></td>
                                <td><i class="fas fa-code icon"></i><div class="subject">Data Structures</div></td>
                                <td class="no-class">No Class</td>
                                <td class="no-class">No Class</td>
                            </tr>
                            <tr>
                                <td class="time">11:00 AM - 12:00 PM</td>
                                <td><i class="fas fa-network-wired icon"></i><div class="subject">Computer Networks</div></td>
                                <td><i class="fas fa-database icon"></i><div class="subject">Database Systems</div></td>
                                <td><i class="fas fa-code icon"></i><div class="subject">Web Development</div></td>
                                <td><i class="fas fa-code icon"></i><div class="subject">Data Structures</div></td>
                                <td><i class="fas fa-brain icon"></i><div class="subject">AI & ML</div></td>
                                <td class="no-class">No Class</td>
                                <td class="no-class">No Class</td>
                            </tr>
                            <tr>
                                <td class="time">12:00 PM - 1:00 PM</td>
                                <td class="no-class" colspan="5"><i class="fas fa-utensils"></i> **Lunch Break**</td>
                                <td class="no-class">No Class</td>
                                <td class="no-class">No Class</td>
                            </tr>
                            <tr>
                                <td class="time">1:00 PM - 2:00 PM</td>
                                <td><i class="fas fa-database icon"></i><div class="subject">Database Systems</div></td>
                                <td><i class="fas fa-code icon"></i><div class="subject">Web Development</div></td>
                                <td><i class="fas fa-code icon"></i><div class="subject">Data Structures</div></td>
                                <td><i class="fas fa-brain icon"></i><div class="subject">AI & ML</div></td>
                                <td><i class="fas fa-network-wired icon"></i><div class="subject">Computer Networks</div></td>
                                <td class="no-class">No Class</td>
                                <td class="no-class">No Class</td>
                            </tr>
                            <tr>
                                <td class="time">2:00 PM - 3:00 PM</td>
                                <td><i class="fas fa-code icon"></i><div class="subject">Web Development</div></td>
                                <td><i class="fas fa-code icon"></i><div class="subject">Data Structures</div></td>
                                <td><i class="fas fa-brain icon"></i><div class="subject">AI & ML</div></td>
                                <td><i class="fas fa-network-wired icon"></i><div class="subject">Computer Networks</div></td>
                                <td><i class="fas fa-database icon"></i><div class="subject">Database Systems</div></td>
                                <td class="no-class">No Class</td>
                                <td class="no-class">No Class</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <a href="student_dashboard.jsp" class="back-btn">
                    <i class="fas fa-arrow-left"></i>Back to Dashboard
                </a>
            </div>
        </div>
    </div>

    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.querySelector('.main-content-wrapper');

            sidebar.classList.toggle('active');
            // Basic visual indication for mobile
            if (sidebar.classList.contains('active')) {
                mainContent.style.filter = 'blur(1px)';
            } else {
                mainContent.style.filter = 'none';
            }
        }

        // Automatically hide sidebar on larger screens if it was toggled open on mobile
        window.addEventListener('resize', () => {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.querySelector('.main-content-wrapper');
            if (window.innerWidth > 1024) {
                sidebar.classList.remove('active');
                mainContent.style.filter = 'none';
            }
        });
    </script>

</body>
</html>