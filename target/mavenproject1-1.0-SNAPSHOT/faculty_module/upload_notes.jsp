<%--
    Document : upload_notes
    Created on : 28 Nov 2025
    Author : PRITESH
    Description: Form for faculty to upload course notes/materials with Dashboard Sidebar.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Upload Course Notes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        <%@include file="stylesheet/upload_notes.css" %>
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
                <i class="fas fa-upload" style="margin-right: 10px;"></i> Upload Course Notes
            </div>

            <div class="upload-container">
                <h3><i class="fas fa-file-upload"></i> Upload New Material</h3>

                <%--
                    Check for a message attribute set by the Servlet after a submission.
                    This provides feedback to the user.
                --%>
                <% 
                    String message = (String) request.getAttribute("message");
                    if (message != null && !message.isEmpty()) {
                        // Assume success if the message is present, you might add logic for 'error' messages too
                        out.println("<div class='message success'>" + message + "</div>");
                    }
                %>

                <%-- 
                    IMPORTANT: 
                    1. action="UploadNotesServlet" must match the URL pattern of your Java Servlet.
                    2. enctype="multipart/form-data" is CRITICAL for file uploads.
                    3. method="POST" is standard for form submissions.
                --%>
                <form action="UploadNotesServlet" method="POST" enctype="multipart/form-data">
                    
                    <div class="form-group">
                        <label for="courseId"><i class="fas fa-book-open"></i> Select Course:</label>
                        <select id="courseId" name="courseId" required>
                            <option value="">-- Select a Course --</option>
                            <option value="CS101">CS101 - Introduction to Programming</option>
                            <option value="CS305">CS305 - Database Management Systems</option>
                            <option value="MA202">MA202 - Discrete Mathematics</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="noteTitle"><i class="fas fa-heading"></i> Note/Lecture Title:</label>
                        <input type="text" id="noteTitle" name="noteTitle" placeholder="e.g., Lecture 5: Inheritance and Polymorphism" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="fileUpload"><i class="fas fa-file"></i> Select File:</label>
                        <%-- The 'file' type input is what handles the file selection --%>
                        <input type="file" id="fileUpload" name="fileUpload" required>
                        <div class="file-info">Allowed formats: **PDF, DOCX, PPTX**. Max file size: **50MB**.</div>
                    </div>

                    <button type="submit" class="btn-submit">
                        <i class="fas fa-save"></i> Upload & Save Notes
                    </button>
                    
                    <div style="text-align: center; margin-top: 15px;">
                        <a href="faculty_dashboard.jsp" class="btn-submit" style="background: var(--faculty-accent); display: inline-block; width: auto; text-decoration: none;">
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