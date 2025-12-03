<%--
    Document : view_result
    Created on : 28 Nov 2025
    Author : PRITESH
    Description: Faculty's interface for viewing class results with Dashboard Sidebar.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Results</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        <%@include file="stylesheet/view_results.css" %>
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
                <i class="fas fa-graduation-cap" style="margin-right: 10px;"></i> View Class Results
            </div>

            <div class="results-container">
                <div class="section-title">
                    Result Analysis and Report Viewing
                </div>

                <div class="filter-controls">
                    <div>
                        <label for="semester-select"><i class="fas fa-calendar-alt"></i> Semester:</label>
                        <select id="semester-select" name="semester">
                            <option value="fall2025">Fall 2025</option>
                            <option value="spring2025">Spring 2025</option>
                        </select>
                    </div>
                    
                    <div>
                        <label for="course-select"><i class="fas fa-book"></i> Course:</label>
                        <select id="course-select" name="course">
                            <option value="ml">Machine Learning (ML)</option>
                            <option value="ds">Data Structures (DS)</option>
                        </select>
                    </div>
                    
                    <div>
                        <label for="batch-select"><i class="fas fa-layer-group"></i> Class/Section:</label>
                        <select id="batch-select" name="batch">
                            <option value="3rd-cse">3rd Year CSE</option>
                            <option value="2nd-cse">2nd Year CSE</option>
                        </select>
                    </div>
                    
                    <button onclick="loadResults()">
                        <i class="fas fa-chart-line"></i> Load Results
                    </button>
                </div>

                <div class="results-table-wrapper">
                    <table class="results-table">
                        <thead>
                            <tr>
                                <th style="width: 50px;">S.No</th>
                                <th style="width: 120px;">Roll No</th>
                                <th>Student Name</th>
                                <th>Mid-Term 1 (50)</th>
                                <th>Mid-Term 2 (50)</th>
                                <th>Assignment (20)</th>
                                <th>Total Score (200)</th>
                                <th>Final Grade</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>2022CSB001</td>
                                <td class="name-col">Akash Sharma</td>
                                <td>45</td>
                                <td>40</td>
                                <td>18</td>
                                <td>185</td>
                                <td class="grade-A">A</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>2022CSB002</td>
                                <td class="name-col">Bhavna Reddy</td>
                                <td>32</td>
                                <td>35</td>
                                <td>15</td>
                                <td>150</td>
                                <td class="grade-B">B</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>2022CSB003</td>
                                <td class="name-col">Chirag Patel</td>
                                <td>20</td>
                                <td>25</td>
                                <td>10</td>
                                <td>105</td>
                                <td class="grade-F">F</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>2022CSB004</td>
                                <td class="name-col">Diana Lee</td>
                                <td>40</td>
                                <td>38</td>
                                <td>16</td>
                                <td>170</td>
                                <td class="grade-A">A</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>2022CSB005</td>
                                <td class="name-col">Ethan Hunt</td>
                                <td>25</td>
                                <td>28</td>
                                <td>12</td>
                                <td>125</td>
                                <td class="grade-C">C</td>
                            </tr>
                            </tbody>
                    </table>
                </div>
                
                <div style="text-align: right; margin-top: 30px;">
                    <button class="export-btn" onclick="exportData()">
                        <i class="fas fa-file-excel"></i> Export to Excel
                    </button>
                    <a href="faculty_dashboard.jsp" class="export-btn back-btn">
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

    function loadResults() {
        // This function would typically trigger an AJAX call to load the results data
        alert('Loading Results for ' + document.getElementById('course-select').value + 
              ' - ' + document.getElementById('batch-select').value + 
              ' for ' + document.getElementById('semester-select').value);
    }
    
    function exportData() {
        // This function would typically initiate a download process 
        alert('Initiating Excel Export...');
    }
</script>

</body>
</html>