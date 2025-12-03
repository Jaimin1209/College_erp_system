<%--
    Document : faculty_dashboard
    Created on : 27 Nov 2025, 11:46:02 pm
    Author : PRITESH
    Modified : Added Sidebar for navigation and modernized layout.
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Faculty Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        <%@include file="stylesheet/faculty_dashboard.css" %>
    </style>
</head>
<body>

<button class="toggle-btn" onclick="toggleSidebar()">
    <i class="fas fa-bars"></i>
</button>

<div class="dashboard-container">
    <div class="sidebar" id="sidebar">
        <div style="text-align: center; padding: 20px 0; font-size: 20px; font-weight: 700; color: white; background-color: #1e2b38;">
            <i class="fas fa-user-tie" style="margin-right: 5px;"></i> Faculty Portal
        </div>
        <a href="faculty_dashboard.jsp" class="active">
            <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <a href="faculty_profile.jsp">
            <i class="fas fa-user"></i> My Profile
        </a>
        <a href="faculty_timetable.jsp">
            <i class="fas fa-calendar-alt"></i> Class Timetable
        </a>
        <a href="students.jsp">
            <i class="fas fa-users"></i> Student Directory
        </a>
        <hr style="border: 0; border-top: 1px solid #34495e; margin: 10px 20px;">
        <a href="mark_attendance.jsp">
            <i class="fas fa-check-circle"></i> Mark Attendance
        </a>
        <a href="manage_marks.jsp">
            <i class="fas fa-edit"></i> Manage Marks
        </a>
        <a href="upload_notes.jsp">
            <i class="fas fa-upload"></i> Upload Notes
        </a>
        <hr style="border: 0; border-top: 1px solid #34495e; margin: 10px 20px;">
        <a href="view_attendance.jsp">
            <i class="fas fa-chart-bar"></i> View Attendance
        </a>
        <a href="view_result.jsp">
            <i class="fas fa-graduation-cap"></i> View Results
        </a>
        <hr style="border: 0; border-top: 1px solid #34495e; margin: 10px 20px;">
        <a href="logout.jsp" style="color: #ff6b6b;">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>

    <div class="main-content">
        <div class="header">
            <i class="fas fa-chalkboard-teacher" style="margin-right: 10px;"></i> Faculty Dashboard
        </div>

        <div class="profile-card">
            <img src="https://via.placeholder.com/120" alt="Faculty Profile Picture">

            <div class="profile-info">
                <h3>Dr. Jane Smith</h3>
                <p><b>Employee ID:</b> FAC2025001</p>
                <p><b>Department:</b> Computer Science and Engineering</p>
                <p><b>Designation:</b> Associate Professor</p>
            </div>
        </div>

        <div style="max-width: 1100px; margin: 30px auto; padding: 0 15px;">
            <h2 style="color: #333; margin-bottom: 20px; border-bottom: 2px solid var(--faculty-accent); padding-bottom: 5px;">Quick Actions</h2>
        </div>

        <div class="grid">
            <a class="card" href="mark_attendance.jsp">
                <i class="fas fa-check-circle"></i>
                Mark Today's Attendance
            </a>
            <a class="card" href="manage_marks.jsp">
                <i class="fas fa-edit"></i>
                Enter/Update Marks
            </a>
            <a class="card" href="upload_notes.jsp">
                <i class="fas fa-upload"></i>
                Upload Course Notes
            </a>
            <a class="card" href="faculty_timetable.jsp">
                <i class="fas fa-clock"></i>
                View Schedule
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