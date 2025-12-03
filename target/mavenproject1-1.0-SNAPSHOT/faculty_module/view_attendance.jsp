<%--
    Document : view_attendance
    Created on : 28 Nov 2025
    Author : PRITESH
    Description: Faculty's interface for viewing monthly attendance reports with Dashboard Sidebar.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Attendance</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        <%@include file="stylesheet/view_attendance.css" %>
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
                <i class="fas fa-chart-bar" style="margin-right: 10px;"></i> View Attendance Records
            </div>

            <div class="view-container">
                <div class="section-title">
                    Filter Attendance Report
                </div>

                <div class="filter-controls">
                    <div>
                        <label for="course-select"><i class="fas fa-book"></i> Course:</label>
                        <select id="course-select" name="course">
                            <option value="ds">Data Structures (DS)</option>
                            <option value="ml">Machine Learning (ML)</option>
                            <option value="os">Operating Systems (OS)</option>
                        </select>
                    </div>
                    
                    <div>
                        <label for="batch-select"><i class="fas fa-users"></i> Batch/Section:</label>
                        <select id="batch-select" name="batch">
                            <option value="b1">CSE 2nd Year (B1)</option>
                            <option value="a2">CSE 3rd Year (A2)</option>
                        </select>
                    </div>
                    
                    <div>
                        <label for="month-select"><i class="fas fa-calendar-alt"></i> Month:</label>
                        <input type="month" id="month-select" name="month" value="<%= new java.text.SimpleDateFormat("yyyy-MM").format(new java.util.Date()) %>">
                    </div>
                    
                    <button onclick="viewAttendance()">
                        <i class="fas fa-eye"></i> View Report
                    </button>
                </div>

                <div class="attendance-table-wrapper">
                    <table class="attendance-table">
                        <thead>
                            <tr>
                                <th rowspan="2" style="width: 50px;">S.No</th>
                                <th rowspan="2" style="width: 200px;">Student Name</th>
                                <th colspan="5">Attendance Status (November)</th> 
                                <th rowspan="2" class="summary-col" style="width: 80px;">Total %</th>
                            </tr>
                            <tr>
                                <th>Day 1</th>
                                <th>Day 2</th>
                                <th>Day 3</th>
                                <th>Day 4</th>
                                <th>Day 5</th>
                                </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td class="student-name-col">Akash Sharma</td>
                                <td class="status-P">P</td>
                                <td class="status-P">P</td>
                                <td class="status-A">A</td>
                                <td class="status-P">P</td>
                                <td class="status-P">P</td>
                                <td class="summary-col">80%</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="student-name-col">Bhavna Reddy</td>
                                <td class="status-P">P</td>
                                <td class="status-P">P</td>
                                <td class="status-P">P</td>
                                <td class="status-A">A</td>
                                <td class="status-L">L</td>
                                <td class="summary-col">60%</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="student-name-col">Chirag Patel</td>
                                <td class="status-P">P</td>
                                <td class="status-P">P</td>
                                <td class="status-P">P</td>
                                <td class="status-P">P</td>
                                <td class="status-P">P</td>
                                <td class="summary-col">100%</td>
                            </tr>
                            </tbody>
                    </table>
                </div>
                
                <div style="text-align: right; margin-top: 30px;">
                    <a href="faculty_dashboard.jsp" class="back-btn">
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

    function viewAttendance() {
        const course = document.getElementById('course-select').options[document.getElementById('course-select').selectedIndex].text;
        const batch = document.getElementById('batch-select').options[document.getElementById('batch-select').selectedIndex].text;
        const month = document.getElementById('month-select').value;
        
        // Simulating the loading action
        alert(`Loading Attendance Report for ${course} - ${batch} for month: ${month}`);
    }
</script>

</body>
</html>