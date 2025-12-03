<%--
    Document : view_student_details
    Created on : 28 Nov 2025
    Author : PRITESH
    Description: Detailed view of a single student's profile and records, integrated with Faculty Dashboard Sidebar.
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        <%@ include file="stylesheet/view_student_details.css"%>
    </style>
</head>
<body>

<%
    // 1. Get the student ID from the URL parameter
    String studentId = request.getParameter("id");
    
    // --- 2. DYNAMIC DATA SIMULATION ---
    // In a real application, you would use this ID to query your database (DB) 
    // to fetch the student's complete record using Java/JSP and JSTL/Servlets.
    
    // Placeholder Data (replace with DB fetch logic)
    String studentName = "Akash Sharma"; // Example name for ID=001
    String rollNo = "2022CSB001";        // Example roll no for ID=001
    String department = "Computer Science and Engineering";
    String batch = "3rd Year (2022-2026)";
    String email = "akash@std.edu";
    String phone = "+91 99001 10099";
    String address = "Hostel Block C, Room 301";
    String dob = "15 Jan 2004";
    String advisor = "Dr. Jane Smith";
    String profilePicUrl = "https://via.placeholder.com/100/4ecdc4/ffffff?text=AS";

    // You can use the ID to change the data if needed (e.g., if (studentId.equals("002")) {...})
    if ("002".equals(studentId)) {
        studentName = "Bhavna Reddy";
        rollNo = "2022CSB002";
        email = "bhavna@std.edu";
        profilePicUrl = "https://via.placeholder.com/100/ff6b6b/ffffff?text=BR";
    }
%>

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
                <i class="fas fa-id-card-alt" style="margin-right: 10px;"></i> Student Profile
            </div>

            <div class="details-container">
                
                <div class="profile-header">
                    <img src="<%= profilePicUrl %>" alt="Student Profile Picture" class="profile-img">
                    <div class="profile-text">
                        <h3><%= studentName %></h3>
                        <p>Roll No: <b><%= rollNo %></b></p>
                        <p>Class: <b><%= batch %></b></p>
                    </div>
                </div>

                <div class="detail-section">
                    <div class="section-title"><i class="fas fa-info-circle"></i> Personal & Contact Information</div>
                    <div class="info-grid">
                        <div class="info-item">
                            <label><i class="fas fa-envelope"></i> Email</label>
                            <span><%= email %></span>
                        </div>
                        <div class="info-item">
                            <label><i class="fas fa-phone-alt"></i> Phone</label>
                            <span><%= phone %></span>
                        </div>
                        <div class="info-item">
                            <label><i class="fas fa-calendar-alt"></i> Date of Birth</label>
                            <span><%= dob %></span>
                        </div>
                        <div class="info-item">
                            <label><i class="fas fa-user-tie"></i> Academic Advisor</label>
                            <span><%= advisor %></span>
                        </div>
                        <div class="info-item" style="grid-column: span 2;">
                            <label><i class="fas fa-map-marker-alt"></i> Current Address</label>
                            <span><%= address %></span>
                        </div>
                    </div>
                </div>

                <div class="detail-section">
                    <div class="section-title"><i class="fas fa-book"></i> Academic Record (Sample)</div>
                    <div class="students-table-wrapper">
                        <table class="record-table">
                            <thead>
                                <tr>
                                    <th style="width: 150px;">Semester</th>
                                    <th>Course Code</th>
                                    <th>Course Name</th>
                                    <th style="width: 80px;">Grade</th>
                                    <th style="width: 80px;">Attendance</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- *** JSP/JSTL Loop for Student's Grades/Attendance goes here *** --%>
                                <tr>
                                    <td>Semester V</td>
                                    <td>ML401</td>
                                    <td>Machine Learning</td>
                                    <td>B+</td>
                                    <td>88%</td>
                                </tr>
                                <tr>
                                    <td>Semester V</td>
                                    <td>DS402</td>
                                    <td>Data Structures</td>
                                    <td>A</td>
                                    <td>92%</td>
                                </tr>
                                <tr>
                                    <td>Semester IV</td>
                                    <td>CS301</td>
                                    <td>Operating Systems</td>
                                    <td>A-</td>
                                    <td>79%</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <a href="students.jsp" class="back-link">
                    <i class="fas fa-arrow-left"></i> Back to Student List
                </a>

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
</script>

</body>
</html>