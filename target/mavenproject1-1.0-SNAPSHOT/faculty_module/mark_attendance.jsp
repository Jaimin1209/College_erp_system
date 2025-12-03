<%--
    Document : faculty_mark_attendance
    Created on : 28 Nov 2025
    Author : PRITESH
    Description: Faculty's interface for marking daily attendance with Sidebar.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Mark Attendance</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        <%@include file="stylesheet/mark_attendance.css" %>
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
                <i class="fas fa-check-circle" style="margin-right: 10px;"></i> Mark Class Attendance
            </div>

            <div class="attendance-container">
                <div class="section-title">
                    Select Class Details
                </div>

                <div id="message-box"></div> <div class="selection-controls">
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
                        <label for="date-select"><i class="fas fa-calendar-day"></i> Date:</label>
                        <input type="date" id="date-select" name="date" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
                    </div>
                    
                    <button onclick="loadStudents()">
                        <i class="fas fa-list-alt"></i> Load Students
                    </button>
                </div>

                <form action="submitAttendance.jsp" method="post" id="attendance-form">
                    <div class="attendance-table-wrapper">
                        <table class="attendance-table">
                            <thead>
                                <tr>
                                    <th style="width: 50px;">S.No</th>
                                    <th style="width: 150px;">Roll No</th>
                                    <th>Student Name</th>
                                    <th style="width: 250px; text-align: center;">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>2022CSB001</td>
                                    <td>Akash Sharma</td>
                                    <td class="radio-group">
                                        <label><input type="radio" name="att_001" value="P" checked> Present</label>
                                        <label><input type="radio" name="att_001" value="A"> Absent</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>2022CSB002</td>
                                    <td>Bhavna Reddy</td>
                                    <td class="radio-group">
                                        <label><input type="radio" name="att_002" value="P" checked> Present</label>
                                        <label><input type="radio" name="att_002" value="A"> Absent</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>2022CSB003</td>
                                    <td>Chirag Patel</td>
                                    <td class="radio-group">
                                        <label><input type="radio" name="att_003" value="P"> Present</label>
                                        <label><input type="radio" name="att_003" value="A" checked> Absent</label>
                                    </td>
                                </tr>
                                </tbody>
                        </table>
                    </div>
                    
                    <div style="text-align: center; margin-top: 30px;">
                        <button type="button" class="action-button submit" onclick="submitAttendance()">
                            <i class="fas fa-paper-plane"></i> Finalize & Submit Attendance
                        </button>
                        <a href="faculty_dashboard.jsp" class="action-button back">
                            <i class="fas fa-arrow-left"></i> Back to Dashboard
                        </a>
                    </div>
                </form>
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
    
    function showNotification(message, isSuccess = true) {
        const messageBox = document.getElementById('message-box');
        messageBox.innerHTML = isSuccess 
            ? `<i class="fas fa-check-circle" style="margin-right: 5px;"></i> ${message}`
            : `<i class="fas fa-exclamation-triangle" style="margin-right: 5px;"></i> ${message}`;
        
        messageBox.style.backgroundColor = isSuccess ? '#e6f7ff' : '#fff1f0';
        messageBox.style.color = isSuccess ? '#1890ff' : '#ff4d4f';
        messageBox.style.borderColor = isSuccess ? '#91d5ff' : '#ffa39e';
        messageBox.style.display = 'block';

        setTimeout(() => {
            messageBox.style.display = 'none';
        }, 5000);
    }

    function loadStudents() {
        const course = document.getElementById('course-select').options[document.getElementById('course-select').selectedIndex].text;
        const batch = document.getElementById('batch-select').options[document.getElementById('batch-select').selectedIndex].text;
        const date = document.getElementById('date-select').value;
        
        // Simulating the loading action
        showNotification(`Students for ${course} (${batch}) on ${date} have been loaded (Mock data shown).`);
    }

    function submitAttendance() {
        // In a real application, you would serialize the form data and send it via AJAX.
        // For demonstration, we simulate the submission.
        showNotification("Attendance successfully recorded for the selected class and date!");
        // Optional: Reset form fields or provide further navigation options here.
    }
</script>

</body>
</html>