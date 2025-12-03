<%--
    Document : faculty_manage_marks
    Created on : 28 Nov 2025
    Author : PRITESH
    Description: Faculty's interface for entering and editing student assessment marks with Sidebar.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Marks</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        <%@include file="stylesheet/manage_marks.css" %>
    </style>
</head>
<body>

    <!-- Sidebar Toggle Button (for mobile) -->
    <button class="toggle-btn" onclick="toggleSidebar()">
        <i class="fas fa-bars"></i>
    </button>

    <div class="dashboard-container">
        <!-- Sidebar -->
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

        <!-- Main Content Area -->
        <div class="main-content-wrapper">
            
            <div class="header">
                <i class="fas fa-edit" style="margin-right: 10px;"></i> Manage Assessment Marks
            </div>

            <div class="marks-container">
                <div class="section-title">
                    Enter and Edit Student Scores
                </div>

                <div id="message-box"></div>

                <div class="filter-controls">
                    <div>
                        <label for="course-select">Course:</label>
                        <select id="course-select" name="course">
                            <option value="ml">Machine Learning (ML)</option>
                            <option value="ds">Data Structures (DS)</option>
                            <option value="os">Operating Systems (OS)</option>
                        </select>
                    </div>
                    
                    <div>
                        <label for="assessment-select">Assessment:</label>
                        <select id="assessment-select" name="assessment">
                            <option value="mid1">Mid-Term 1 (50)</option>
                            <option value="mid2">Mid-Term 2 (50)</option>
                            <option value="assignment1">Assignment 1 (20)</option>
                            <option value="final">Final Exam (100)</option>
                        </select>
                    </div>
                    
                    <div>
                        <label for="batch-select">Batch/Section:</label>
                        <select id="batch-select" name="batch">
                            <option value="a1">CSE 3rd Year (A1)</option>
                            <option value="b2">CSE 2nd Year (B2)</option>
                        </select>
                    </div>
                    
                    <button onclick="loadMarks()">
                        <i class="fas fa-search"></i> Load Data
                    </button>
                </div>

                <div class="marks-table-wrapper">
                    <table class="marks-table">
                        <thead>
                            <tr>
                                <th>S.No</th>
                                <th>Roll No</th>
                                <th>Student Name</th>
                                <th>Max Marks</th>
                                <th>Marks Obtained</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Placeholder Data -->
                            <tr>
                                <td>1</td>
                                <td>2022CSB001</td>
                                <td>Akash Sharma</td>
                                <td>50</td>
                                <td>
                                    <input type="number" class="marks-input" value="45" max="50" min="0" data-student-id="001">
                                </td>
                                <td><button class="save-btn-inline"><i class="fas fa-save"></i> Save</button></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>2022CSB002</td>
                                <td>Bhavna Reddy</td>
                                <td>50</td>
                                <td>
                                    <input type="number" class="marks-input" value="38" max="50" min="0" data-student-id="002">
                                </td>
                                <td><button class="save-btn-inline"><i class="fas fa-save"></i> Save</button></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>2022CSB003</td>
                                <td>Chirag Patel</td>
                                <td>50</td>
                                <td>
                                    <input type="number" class="marks-input" value="0" max="50" min="0" data-student-id="003">
                                </td>
                                <td><button class="save-btn-inline"><i class="fas fa-save"></i> Save</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
                <div style="text-align: right; margin-top: 20px;">
                    <button class="action-button submit">
                        <i class="fas fa-upload"></i> Submit All Marks
                    </button>
                    <a href="faculty_dashboard.jsp" class="action-button back">
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

    function loadMarks() {
        const course = document.getElementById('course-select').value;
        const assessment = document.getElementById('assessment-select').value;
        const batch = document.getElementById('batch-select').value;

        const messageBox = document.getElementById('message-box');
        
        // This simulates the action in a real application without using alert()
        messageBox.innerHTML = `<i class="fas fa-check-circle" style="margin-right: 5px;"></i> Data loaded (Mock): Course: <strong>${course}</strong>, Assessment: <strong>${assessment}</strong>, Batch: <strong>${batch}</strong>.`;
        messageBox.style.display = 'block';

        // Hide the message after 5 seconds
        setTimeout(() => {
            messageBox.style.display = 'none';
        }, 5000);
    }
    
    // Placeholder function for saving individual marks
    document.querySelectorAll('.save-btn-inline').forEach(button => {
        button.addEventListener('click', (event) => {
            const row = event.target.closest('tr');
            const rollNo = row.querySelector('td:nth-child(2)').textContent;
            const marksInput = row.querySelector('.marks-input');
            const marks = marksInput.value;
            
            const messageBox = document.getElementById('message-box');
            messageBox.innerHTML = `<i class="fas fa-save" style="margin-right: 5px;"></i> Marks <strong>${marks}</strong> saved for Roll No: <strong>${rollNo}</strong>.`;
            messageBox.style.display = 'block';
            
            setTimeout(() => {
                messageBox.style.display = 'none';
            }, 3000);
        });
    });
</script>

</body>
</html>