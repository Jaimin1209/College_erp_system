<%--
    Document : faculty_timetable
    Created on : 28 Nov 2025
    Author : PRITESH
    Description: Faculty's weekly timetable overview with Sidebar.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Faculty Timetable</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        <%@include  file="stylesheet/faculty_timetable.css" %>
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
                <i class="fas fa-calendar-alt" style="margin-right: 10px;"></i> Weekly Timetable
            </div>

            <div class="timetable-container">
                <div class="section-title">
                    Timetable for Dr. Jane Smith (Semester Fall 2025)
                </div>

                <table class="timetable">
                    <thead>
                        <tr>
                            <th>Time / Day</th>
                            <th>Monday</th>
                            <th>Tuesday</th>
                            <th>Wednesday</th>
                            <th>Thursday</th>
                            <th>Friday</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>9:00 - 10:00 AM</td>
                            <td class="class-period">
                                <strong>DS (B1)</strong>
                                <span class="class-details">Room: LT 201 | CSE 2nd Yr</span>
                            </td>
                            <td>-</td>
                            <td class="class-period">
                                <strong>ML (A2)</strong>
                                <span class="class-details">Room: LH 105 | CSE 3rd Yr</span>
                            </td>
                            <td>-</td>
                            <td class="class-period">
                                <strong>DS (B1)</strong>
                                <span class="class-details">Room: LT 201 | CSE 2nd Yr</span>
                            </td>
                        </tr>
                        <tr>
                            <td>10:00 - 11:00 AM</td>
                            <td class="class-period">
                                <strong>ML (A2)</strong>
                                <span class="class-details">Room: LH 105 | CSE 3rd Yr</span>
                            </td>
                            <td class="class-period">
                                <strong>OS (C1)</strong>
                                <span class="class-details">Room: LH 102 | IT 2nd Yr</span>
                            </td>
                            <td class="class-period">
                                <strong>OS (C1)</strong>
                                <span class="class-details">Room: LH 102 | IT 2nd Yr</span>
                            </td>
                            <td class="class-period">
                                <strong>DS (B1)</strong>
                                <span class="class-details">Room: LT 201 | CSE 2nd Yr</span>
                            </td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>11:00 - 12:00 PM</td>
                            <td>-</td>
                            <td class="class-period">
                                <strong>Tutor Session</strong>
                                <span class="class-details">Room: F-303 | All Tutees</span>
                            </td>
                            <td>-</td>
                            <td class="class-period">
                                <strong>Tutor Session</strong>
                                <span class="class-details">Room: F-303 | All Tutees</span>
                            </td>
                            <td class="class-period">
                                <strong>Seminar</strong>
                                <span class="class-details">Dept. Meeting | CSE Faculty</span>
                            </td>
                        </tr>
                        <tr>
                            <td>12:00 - 1:00 PM</td>
                            <td colspan="5" class="break-period">
                                <i class="fas fa-utensils"></i> LUNCH BREAK
                            </td>
                        </tr>
                        <tr>
                            <td>1:00 - 2:00 PM</td>
                            <td class="class-period">
                                <strong>ML LAB (L1)</strong>
                                <span class="class-details">Lab: CS Lab 4 | CSE 3rd Yr</span>
                            </td>
                            <td>-</td>
                            <td>-</td>
                            <td class="class-period">
                                <strong>ML LAB (L1)</strong>
                                <span class="class-details">Lab: CS Lab 4 | CSE 3rd Yr</span>
                            </td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>2:00 - 3:00 PM</td>
                            <td>-</td>
                            <td class="class-period">
                                <strong>Research Meeting</strong>
                                <span class="class-details">Room: HOD's Office | Thesis Students</span>
                            </td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                        </tr>
                    </tbody>
                </table>
                
                <div style="text-align: center; margin-top: 30px;">
                    <a href="faculty_dashboard.jsp" class="action-button">
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