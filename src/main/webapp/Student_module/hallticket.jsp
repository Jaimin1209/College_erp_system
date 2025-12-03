<%--
    Document : hallticket
    Created on : 28 Nov 2025
    Author : PRITESH
    Description: Page for students to download their examination hall ticket with Sidebar.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Download Hall Ticket</title>
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
        .main-content {
            flex-grow: 1;
            margin-left: var(--sidebar-width); /* Push content to the right */
            transition: margin-left 0.3s ease;
            padding: 0;
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

        /* Container Adjustment */
        .container {
            max-width: 600px;
            margin: 40px auto;
            background: white;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            padding: 40px;
            border: 1px solid #e1e5e9;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
        }

        .container:hover {
            transform: none; /* Removed hover transform on main container */
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        .page-header {
            font-size: 28px;
            font-weight: 700;
            color: var(--student-accent);
            margin-bottom: 30px;
            border-bottom: 2px solid #ecf0f1;
            padding-bottom: 15px;
        }

        /* Hall Ticket Card */
        .hallticket-card {
            background-color: #f8f9fa;
            border: 2px solid var(--student-accent); /* Accent Border */
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }

        .hallticket-card i.fa-ticket-alt {
            font-size: 60px;
            color: var(--student-accent);
            margin-bottom: 20px;
        }

        .hallticket-card h4 {
            font-size: 22px;
            color: #2c3e50;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .hallticket-card p {
            color: #7f8c8d;
            margin-bottom: 5px;
            font-size: 14px;
        }

        .hallticket-card strong {
            color: #34495e;
        }

        /* Download Button - Primary Action Style */
        .download-action-btn {
            display: inline-flex;
            align-items: center;
            padding: 15px 30px;
            margin-top: 25px;
            background: linear-gradient(135deg, var(--student-accent) 0%, var(--student-accent-dark) 100%);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 700;
            font-size: 18px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(78, 205, 196, 0.4);
        }

        .download-action-btn:hover {
            background: linear-gradient(135deg, var(--student-accent-dark) 0%, var(--student-accent) 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(78, 205, 196, 0.6);
        }

        .download-action-btn i {
            margin-right: 10px;
        }

        /* Back Button - Secondary Action Style */
        .back-btn {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 25px;
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(108, 117, 125, 0.3);
        }

        .back-btn:hover {
            background: linear-gradient(135deg, #5a6268 0%, #343a40 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(108, 117, 125, 0.4);
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
        
        @media (max-width: 600px) {
            .container {
                padding: 20px;
                margin: 20px 10px;
            }
            .header {
                font-size: 28px;
            }
            .page-header {
                font-size: 24px;
            }
            .download-action-btn {
                font-size: 16px;
                padding: 12px 20px;
            }
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
            <a href="attendance.jsp">
                <i class="fas fa-chart-bar"></i> Attendance
            </a>
            <a href="result.jsp">
                <i class="fas fa-graduation-cap"></i> Result
            </a>
            <a href="download_matirial.jsp">
                <i class="fas fa-file-download"></i> Download Notes
            </a>
            <a href="hallticket.jsp" class="active">
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
                <i class="fas fa-ticket-alt" style="margin-right: 10px;"></i> Download Hall Ticket
            </div>

            <div class="container">
                <div class="page-header">Examination Hall Ticket</div>

                <div class="hallticket-card">
                    <i class="fas fa-ticket-alt"></i>
                    <h4>End Semester Examinations - Dec 2025</h4>
                    <p>Student Name: <strong>John Doe</strong></p>
                    <p>Enrollment No: <strong>CS2025001</strong></p>
                    <p>Semester: <strong>5th Semester</strong></p>
                    <p style="margin-top: 15px;">**Please check the details carefully before printing.**</p>

                    <a href="downloads/hallticket_CS2025001_Dec25.pdf" class="download-action-btn" download>
                        <i class="fas fa-cloud-download-alt"></i>Download Hall Ticket (PDF)
                    </a>
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