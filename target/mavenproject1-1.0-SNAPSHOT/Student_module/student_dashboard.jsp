<%--
    Document : student_dashboard
    Created on : 21 Nov 2025, 10:17:52 am
    Author : PRITESH
    Description: Professional Student Dashboard with Notes and Hall Ticket download links, and a Sidebar.
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Base Styling */
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            line-height: 1.6;
            display: flex; /* Enable flexbox for sidebar and main content layout */
        }

        /* Variables for easy color/size change */
        :root {
            --sidebar-width: 250px;
            --student-accent: #4ecdc4;
            --student-accent-dark: #30a9a3;
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
            position: sticky; /* Keep header visible */
            top: 0;
            z-index: 1000;
            width: 100%; /* Full width of its container (main-content) */
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

        /* Main Layout Container */
        .dashboard-container {
            display: flex;
            width: 100%;
        }

        /* Sidebar Styling */
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
            color: #ecf0f1; /* Light text color */
            font-weight: 600;
            transition: background-color 0.3s ease, color 0.3s ease;
            border-left: 4px solid transparent;
            font-size: 16px;
        }

        .sidebar a:hover {
            background-color: #34495e; /* Slightly lighter on hover */
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

        /* Profile Card & Grid Styling (Unchanged) */
        .profile-card {
            max-width: 900px;
            margin: 30px auto;
            background: white;
            border-radius: 12px;
            padding: 30px;
            display: flex;
            align-items: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-left: 5px solid var(--student-accent);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .profile-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .profile-card img {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            border: 5px solid var(--student-accent);
            object-fit: cover;
            flex-shrink: 0;
            margin-right: 25px;
        }

        .profile-info h3 {
            margin: 0 0 10px 0;
            font-size: 24px;
            color: #333;
            font-weight: 700;
        }

        .profile-info p {
            margin: 5px 0;
            color: #555;
            font-size: 16px;
        }

        .profile-info b {
            color: #111;
        }

        .grid {
            max-width: 1100px;
            margin: 30px auto;
            padding: 0 15px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 25px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            text-align: center;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            color: var(--student-accent);
            border: 2px solid #e0e0e0;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            text-decoration: none;
            display: block;
        }

        .card:hover {
            background: linear-gradient(135deg, var(--student-accent) 0%, var(--student-accent-dark) 100%);
            color: white;
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(78, 205, 196, 0.3);
            border-color: var(--student-accent);
        }

        .card i {
            font-size: 36px;
            margin-bottom: 10px;
            color: var(--student-accent);
            transition: color 0.3s ease;
        }

        .card:hover i {
            color: white;
        }

        /* Sidebar Toggle Button (optional, but good for mobile/compact views) */
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
            display: none; /* Hidden by default on desktop */
        }

        /* Responsive adjustments */
        @media(max-width: 1024px) {
            .sidebar {
                transform: translateX(calc(var(--sidebar-width) * -1)); /* Hide sidebar off-screen */
            }

            .sidebar.active {
                transform: translateX(0); /* Show sidebar */
            }

            .main-content {
                margin-left: 0; /* No margin on smaller screens */
            }

            .toggle-btn {
                display: block; /* Show toggle button on mobile */
            }

            /* Adjust main content when sidebar is active on small screens */
            body.sidebar-open .main-content {
                margin-left: 0; /* Stays at 0 */
            }

            .header {
                padding-left: 70px; /* Make space for the toggle button */
            }
        }

        @media(max-width: 800px){
            .grid { grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); }
            .profile-card { flex-direction: column; text-align: center; }
            .profile-card img { margin-bottom: 20px; margin-right: 0; }
        }

        @media(max-width: 500px){
            .grid { grid-template-columns: 1fr; }
            .profile-card { margin: 20px 10px; padding: 20px; }
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
        <a href="student_dashboard.jsp" class="active">
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
            <i class="fas fa-tachometer-alt" style="margin-right: 10px;"></i> Student Dashboard
        </div>

        <div class="profile-card">
            <img src="https://via.placeholder.com/140" alt="Student Profile Picture">

            <div class="profile-info">
                <h3>John Doe</h3>
                <p><b>Roll No:</b> CS2025001</p>
                <p><b>Department:</b> Computer Science and Engineering</p>
                <p><b>Semester:</b> 5th Semester</p>
            </div>
        </div>

        <div style="max-width: 1100px; margin: 30px auto; padding: 0 15px;">
            <h2 style="color: #333; margin-bottom: 20px; border-bottom: 2px solid var(--student-accent); padding-bottom: 5px;">Quick Actions / Overview</h2>
        </div>
        
        <div class="grid">
             <a class="card" href="time_table.jsp">
                <i class="fas fa-clock"></i>
                Class Schedule
            </a>
            <a class="card" href="attendance.jsp">
                <i class="fas fa-percent"></i>
                View Attendance
            </a>
             <a class="card" href="result.jsp">
                <i class="fas fa-trophy"></i>
                Latest Result
            </a>
            <a class="card" href="hallticket.jsp">
                <i class="fas fa-print"></i>
                Download Hall Ticket
            </a>
        </div>

    </div>
</div>

<script>
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        const body = document.body;
        
        sidebar.classList.toggle('active');
        body.classList.toggle('sidebar-open'); // Helps manage body scroll/main content shift
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