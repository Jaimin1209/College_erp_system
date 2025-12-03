<%--
    Document : students
    Created on : 27 Nov 2025
    Author : PRITESH
    Description: Faculty's interface for viewing managed students with Dashboard Sidebar.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Managed Students</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        <%@include file="stylesheet/students.css" %>
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
                <i class="fas fa-users" style="margin-right: 10px;"></i> Managed Students List
            </div>

            <div class="students-container">
                <div class="section-title">
                    Filter Students by Class
                </div>

                <div id="message-box"></div> <div class="filter-controls">
                    <div>
                        <label for="course-select"><i class="fas fa-book-open"></i> Course Taught:</label>
                        <select id="course-select" name="course">
                            <option value="ml">Machine Learning (ML)</option>
                            <option value="ds">Data Structures (DS)</option>
                        </select>
                    </div>
                    
                    <div>
                        <label for="batch-select"><i class="fas fa-layer-group"></i> Class/Year:</label>
                        <select id="batch-select" name="batch">
                            <option value="3rd-cse">3rd Year CSE</option>
                            <option value="2nd-cse">2nd Year CSE</option>
                        </select>
                    </div>
                    
                    <button onclick="loadStudentList()">
                        <i class="fas fa-search"></i> Load Students
                    </button>
                </div>

                <div class="students-table-wrapper">
                    <table class="students-table">
                        <thead>
                            <tr>
                                <th style="width: 50px;">S.No</th>
                                <th style="width: 120px;">Roll No</th>
                                <th>Student Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th style="width: 100px; text-align: center;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>2022CSB001</td>
                                <td>Akash Sharma</td>
                                <td>akash@std.edu</td>
                                <td>+91 99001 10099</td>
                                <td style="text-align: center;">
                                    <a href="view_student_details.jsp" class="action-link">View</a>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>2022CSB002</td>
                                <td>Bhavna Reddy</td>
                                <td>bhavna@std.edu</td>
                                <td>+91 99002 20099</td>
                                <td style="text-align: center;">
                                    <a href="view_student_details.jsp" class="action-link">View</a>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>2022CSB003</td>
                                <td>Chirag Patel</td>
                                <td>chirag@std.edu</td>
                                <td>+91 99003 30099</td>
                                <td style="text-align: center;">
                                    <a href="view_student_details.jsp" class="action-link">View</a>
                                </td>
                            </tr>
                            </tbody>
                    </table>
                </div>
                
                <div style="text-align: center; margin-top: 30px;">
                    <a href="faculty_dashboard.jsp" class="back-btn">
                        <i class="fas fa-arrow-left" style="margin-right: 8px;"></i> Back to Dashboard
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
        // Simple visual feedback for mobile overlay
        if (sidebar.classList.contains('active')) {
            mainContent.style.filter = 'blur(1px)';
        } else {
            mainContent.style.filter = 'none';
        }
    }

    // Hide sidebar on desktop resize if it was open on mobile
    window.addEventListener('resize', () => {
        const sidebar = document.getElementById('sidebar');
        const mainContent = document.querySelector('.main-content-wrapper');
        if (window.innerWidth > 1024) {
            sidebar.classList.remove('active');
            mainContent.style.filter = 'none';
        }
    });

    function loadStudentList() {
        const course = document.getElementById('course-select').options[document.getElementById('course-select').selectedIndex].text;
        const batch = document.getElementById('batch-select').options[document.getElementById('batch-select').selectedIndex].text;

        const messageBox = document.getElementById('message-box');
        
        // Simulating the loading action
        messageBox.innerHTML = `<i class="fas fa-check-circle" style="margin-right: 5px;"></i> Mock Student List loaded for <strong>${batch}</strong> (Course: <strong>${course}</strong>).`;
        messageBox.style.display = 'block';

        // Hide the message after 5 seconds
        setTimeout(() => {
            messageBox.style.display = 'none';
        }, 5000);
    }
</script>

</body>
</html>