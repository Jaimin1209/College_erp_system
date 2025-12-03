<%--
    Document : faculty_profile
    Created on : 28 Nov 2025
    Author : PRITESH
    Description: Faculty's personal and academic profile overview with Sidebar.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Faculty Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        <%@include  file="stylesheet/faculty_profile.css" %>
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

        <div class="main-content-wrapper">
            <div class="header">
                <i class="fas fa-user-circle" style="margin-right: 10px;"></i> Faculty Profile
            </div>

            <div class="profile-container">
                <div class="profile-header">
                    <img src="https://via.placeholder.com/150/667eea/ffffff?text=JS" alt="Faculty Profile Picture">
                    <h2>Dr. Jane Smith</h2>
                    <p>Associate Professor, CSE</p>
                </div>

                <div class="section-title">
                    <i class="fas fa-info-circle"></i> Personal & Contact Information
                </div>
                
                <div class="info-grid">
                    <div class="info-item">
                        <span>Employee ID</span>
                        <span>FAC2025001</span>
                    </div>
                    <div class="info-item">
                        <span>Date of Joining</span>
                        <span>2020-08-15</span>
                    </div>
                    <div class="info-item">
                        <span>Email</span>
                        <span>jane.smith@university.edu</span>
                    </div>
                    <div class="info-item">
                        <span>Phone Number</span>
                        <span>+91 98765 43210</span>
                    </div>
                    <div class="info-item">
                        <span>Date of Birth</span>
                        <span>1985-05-20</span>
                    </div>
                    <div class="info-item">
                        <span>Gender</span>
                        <span>Female</span>
                    </div>
                    <div class="info-item" style="grid-column: 1 / span 2; border-bottom: none;">
                        <span>Address</span>
                        <span>123 University Quarters, Cityville</span>
                    </div>
                </div>
                
                <div class="section-title">
                    <i class="fas fa-graduation-cap"></i> Academic Details
                </div>
                
                <div class="info-grid">
                    <div class="info-item">
                        <span>Department</span>
                        <span>Computer Science and Engineering</span>
                    </div>
                    <div class="info-item">
                        <span>Designation</span>
                        <span>Associate Professor</span>
                    </div>
                    <div class="info-item">
                        <span>Highest Qualification</span>
                        <span>Ph.D. (Computer Science)</span>
                    </div>
                    <div class="info-item">
                        <span>Specialization</span>
                        <span>Machine Learning, Data Mining</span>
                    </div>
                    <div class="info-item">
                        <span>Experience (Years)</span>
                        <span>12 Years</span>
                    </div>
                    <div class="info-item">
                        <span>Current Courses</span>
                        <span>ML, Data Structures</span>
                    </div>
                </div>
                
                <div style="text-align: center; margin-top: 40px;">
                    <a href="faculty_edit_profile.jsp" class="action-button">
                        <i class="fas fa-pen"></i> Edit Profile
                    </a>
                    <a href="faculty_dashboard.jsp" class="action-button" style="background: #4ecdc4;">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
                </div>

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