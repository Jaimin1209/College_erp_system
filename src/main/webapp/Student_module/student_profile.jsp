<%--
    Document : student_profile
    Created on : 21 Nov 2025, 10:23:50 am
    Author : PRITESH
    Description: Student's personal and academic profile overview with Sidebar.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student Profile</title>
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

        /* --- Global Layout Setup --- */
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            color: #333;
            line-height: 1.6;
            display: flex;
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
            position: fixed;
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
        .main-content-wrapper {
            flex-grow: 1;
            margin-left: var(--sidebar-width); /* Push content to the right */
            transition: margin-left 0.3s ease;
            padding: 0;
        }

        /* --- Header Styling Fix --- */
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
            /* Fix: Reduce padding/font size for a standard dashboard header */
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

        /* Profile Container Styling */
        .profile-wrapper {
            max-width: 1100px;
            margin: 40px auto; /* Centering the profile card below the fixed header */
            background: white;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            padding: 40px;
            border: 1px solid #e1e5e9;
        }

        .page-header {
            font-size: 28px;
            font-weight: 700;
            color: var(--student-accent);
            margin-bottom: 30px;
            border-bottom: 2px solid #ecf0f1;
            padding-bottom: 15px;
            text-align: center;
        }

        /* Main layout: 3-column structure */
        .profile-content {
            display: flex;
            gap: 40px;
        }

        /* Column 1: Avatar and main actions */
        .col-avatar {
            flex-basis: 200px;
            flex-shrink: 0;
            text-align: center;
        }

        .avatar {
            width: 160px;
            height: 160px;
            object-fit: cover;
            border-radius: 50%;
            border: 6px solid var(--student-accent);
            margin-bottom: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .avatar:hover {
            transform: scale(1.05);
        }

        .btn {
            display: block;
            padding: 12px 20px;
            margin-bottom: 12px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 16px;
            border: none;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--student-accent) 0%, var(--student-accent-dark) 100%);
            color: white;
            box-shadow: 0 4px 10px rgba(78, 205, 196, 0.3);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, var(--student-accent-dark) 0%, var(--student-accent) 100%);
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            color: white;
        }

        .btn-secondary:hover {
            background: linear-gradient(135deg, #5a6268 0%, #343a40 100%);
            transform: translateY(-2px);
        }

        /* Column 2: Profile Details */
        .col-details {
            flex-grow: 1;
        }

        .col-details h3 {
            margin: 0 0 10px 0;
            font-size: 32px;
            color: #2c3e50;
            font-weight: 700;
        }

        .text-muted {
            color: #7f8c8d;
            margin-bottom: 25px;
            font-size: 18px;
        }

        .detail-group {
            display: flex;
            margin-bottom: 20px;
            gap: 20px;
        }

        .detail-item {
            flex: 1;
        }

        .info-key {
            color: #7f8c8d;
            font-weight: 600;
            font-size: 16px;
            margin-bottom: 5px;
        }

        .info-value {
            font-weight: 700;
            font-size: 18px;
            color: #34495e;
        }

        .info-value a {
            color: var(--student-accent);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .info-value a:hover {
            color: var(--student-accent-dark);
        }

        hr {
            border: none;
            border-top: 2px solid #ecf0f1;
            margin: 30px 0;
        }

        /* Column 3: Quick Actions */
        .col-actions {
            flex-basis: 280px;
            flex-shrink: 0;
            padding: 25px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border: 1px solid #dee2e6;
            border-radius: 12px;
            align-self: flex-start;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }

        .col-actions h6 {
            color: var(--student-accent);
            font-weight: 700;
            margin-bottom: 20px;
            font-size: 18px;
            text-align: center;
        }

        .action-link {
            display: block;
            text-decoration: none;
            padding: 12px 15px;
            margin-bottom: 10px;
            border-radius: 8px;
            font-size: 16px;
            text-align: center;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .link-primary {
            background: linear-gradient(135deg, #e6f7f6 0%, #c4f3ef 100%);
            color: var(--student-accent);
            border: 1px solid var(--student-accent);
        }

        .link-primary:hover {
            background: linear-gradient(135deg, #c4f3ef 0%, #99e8e2 100%);
            transform: translateY(-2px);
        }
        
        /* ... (other link styles omitted for brevity, they are fine) ... */

        .address-section {
            margin-top: 40px;
            padding-top: 25px;
            border-top: 2px solid #ecf0f1;
            text-align: center;
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

        /* Responsive Layout */
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
                padding-left: 70px; /* Make space for toggle button */
            }
        }

        @media (max-width: 900px) {
            .profile-content {
                flex-direction: column;
            }
            .col-avatar {
                flex-basis: auto;
                order: -1;
                margin-bottom: 30px;
            }
            .col-actions {
                flex-basis: auto;
                order: 1;
                margin-bottom: 30px;
                align-self: stretch;
            }
            .profile-wrapper {
                margin: 20px 10px;
                padding: 30px 20px;
            }
        }

        @media (max-width: 500px) {
            .detail-group {
                flex-direction: column;
                gap: 10px;
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
            <a href="student_profile.jsp" class="active">
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

        <div class="main-content-wrapper">
            <div class="header">
                <i class="fas fa-user" style="margin-right: 10px;"></i> Student Profile
            </div>

            <div class="profile-wrapper">
                <div class="page-header">Profile Overview</div>

                <div class="profile-content">

                    <div class="col-avatar">
                        <img src="https://via.placeholder.com/160/4ecdc4/ffffff?text=JD" alt="Student Avatar" class="avatar">

                        <a href="edit_student_profile.jsp" class="btn btn-primary">
                            <i class="fas fa-edit" style="margin-right: 8px;"></i>Edit Profile
                        </a>
                        <a href="student_dashboard.jsp" class="btn btn-secondary">
                            <i class="fas fa-tachometer-alt" style="margin-right: 8px;"></i>Dashboard
                        </a>
                    </div>

                    <div class="col-details">
                        <h3 class="student-name">John Doe</h3>
                        <p class="text-muted">Enrollment No: <strong>CS2025001</strong></p>

                        <div class="detail-group">
                            <div class="detail-item">
                                <div class="info-key"><i class="fas fa-building" style="margin-right: 8px; color: var(--student-accent);"></i>Department</div>
                                <div class="info-value">Computer Science and Engineering</div>
                            </div>
                            <div class="detail-item">
                                <div class="info-key"><i class="fas fa-calendar-alt" style="margin-right: 8px; color: var(--student-accent);"></i>Semester</div>
                                <div class="info-value">5th Semester</div>
                            </div>
                        </div>

                        <div class="detail-group">
                            <div class="detail-item">
                                <div class="info-key"><i class="fas fa-graduation-cap" style="margin-right: 8px; color: var(--student-accent);"></i>Batch</div>
                                <div class="info-value">2025</div>
                            </div>
                            <div class="detail-item">
                                <div class="info-key"><i class="fas fa-venus-mars" style="margin-right: 8px; color: var(--student-accent);"></i>Gender</div>
                                <div class="info-value">Male</div>
                            </div>
                        </div>

                        <hr>

                        <div class="detail-group">
                            <div class="detail-item">
                                <div class="info-key"><i class="fas fa-envelope" style="margin-right: 8px; color: var(--student-accent);"></i>Email</div>
                                <div class="info-value"><a href="mailto:john.doe@college.edu">john.doe@college.edu</a></div>
                            </div>
                            <div class="detail-item">
                                <div class="info-key"><i class="fas fa-phone" style="margin-right: 8px; color: var(--student-accent);"></i>Phone</div>
                                <div class="info-value"><a href="tel:555-1234">(555) 123-4567</a></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-actions">
                        <h6><i class="fas fa-bolt" style="margin-right: 8px; color: var(--student-accent);"></i>Quick Navigation</h6>
                        <div>
                            <a href="time_table.jsp" class="action-link link-primary">
                                <i class="fas fa-calendar-alt" style="margin-right: 8px;"></i>Timetable
                            </a>
                            <a href="attendance.jsp" class="action-link link-success">
                                <i class="fas fa-chart-bar" style="margin-right: 8px;"></i>Attendance
                            </a>
                            <a href="result.jsp" class="action-link link-warning">
                                <i class="fas fa-graduation-cap" style="margin-right: 8px;"></i>Results
                            </a>
                            <a href="fees.jsp" class="action-link link-info">
                                <i class="fas fa-dollar-sign" style="margin-right: 8px;"></i>Fees
                            </a>
                            <a href="logout.jsp" class="action-link link-danger">
                                <i class="fas fa-sign-out-alt" style="margin-right: 8px;"></i>Logout
                            </a>
                        </div>
                    </div>
                </div>

                <div class="address-section">
                    <h6><i class="fas fa-map-marker-alt" style="margin-right: 8px; color: var(--student-accent);"></i>Address</h6>
                    <p class="text-muted">123 Main Street, Apartment 4B, Silicon Valley, CA 94020, USA</p>
                </div>

            </div>
        </div>
    </div>

    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.querySelector('.main-content-wrapper');

            sidebar.classList.toggle('active');
            if (sidebar.classList.contains('active')) {
                mainContent.style.filter = 'blur(1px)';
            } else {
                mainContent.style.filter = 'none';
            }
        }

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