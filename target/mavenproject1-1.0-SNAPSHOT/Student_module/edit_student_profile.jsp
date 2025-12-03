<%--
    Document : edit_student_profile
    Created on : 21 Nov 2025, 10:31:29 am
    Author : PRITESH
    Description: Student form for updating personal and contact information with Sidebar.
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Student Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Base Variables */
        :root {
            --sidebar-width: 250px;
            --student-accent: #4ecdc4; /* Teal */
            --student-accent-dark: #30a9a3;
        }

        /* Base Styles and Layout Setup */
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            color: #333;
            line-height: 1.6;
            display: flex; /* Enable flexbox for sidebar and main content layout */
        }

        .dashboard-container {
            display: flex;
            width: 100%;
        }

        /* --- Sidebar Styling --- */
        .sidebar {
            width: var(--sidebar-width);
            background-color: #2c3e50; /* Dark background for contrast */
            color: white;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
            position: fixed; /* Fixed position */
            height: 100vh;
            overflow-y: auto;
            transition: transform 0.3s ease;
            z-index: 1050;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            padding: 15px 20px;
            text-decoration: none;
            color: #ecf0f1;
            font-weight: 600;
            transition: background-color 0.3s ease, color 0.3s ease;
            border-left: 4px solid transparent;
            font-size: 16px;
        }

        .sidebar a.active {
            background-color: #34495e;
            color: var(--student-accent);
            border-left: 4px solid var(--student-accent);
        }

        .sidebar a:hover:not(.active) {
            background-color: #34495e;
            color: var(--student-accent);
            border-left: 4px solid var(--student-accent);
        }

        .sidebar a i {
            margin-right: 15px;
            font-size: 20px;
        }

        /* Main Content Area */
        .main-content {
            flex-grow: 1;
            margin-left: var(--sidebar-width); /* Push content to the right */
            transition: margin-left 0.3s ease;
            padding: 0;
        }

        /* Header Styling */
        .header {
            background: linear-gradient(135deg, var(--student-accent) 0%, var(--student-accent-dark) 100%);
            padding: 20px;
            color: white;
            text-align: center;
            font-size: 28px;
            font-weight: 700;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
            width: 100%;
        }

        .header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #ff6b6b, #667eea);
        }

        /* Form Container */
        .container {
            max-width: 700px;
            margin: 40px auto;
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            border: 1px solid #e1e5e9;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: none; /* Removed hover transform as it interferes with scroll in main-content */
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: var(--student-accent);
            font-weight: 700;
            font-size: 28px;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 15px;
        }

        /* Profile Photo Styling */
        .photo-box {
            text-align: center;
            margin-bottom: 30px;
        }

        .photo-box img {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            border: 6px solid var(--student-accent);
            object-fit: cover;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .photo-box img:hover {
            transform: scale(1.05);
        }

        /* Form Elements */
        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: 600;
            margin-bottom: 8px;
            display: block;
            color: #34495e;
            font-size: 16px;
        }

        input[type="text"]:read-only,
        input[type="email"]:read-only {
            background-color: #ecf0f1;
            color: #7f8c8d;
            cursor: not-allowed;
            font-weight: 600;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #ecf0f1;
            border-radius: 8px;
            box-sizing: border-box;
            transition: border-color 0.3s, box-shadow 0.3s;
            font-size: 16px;
            font-family: 'Inter', sans-serif;
        }

        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: var(--student-accent);
            box-shadow: 0 0 8px rgba(78, 205, 196, 0.5);
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        input[type="file"] {
            padding: 8px 0;
            border: none;
            background: none;
        }

        /* Action Buttons */
        .btn-update {
            background: linear-gradient(135deg, var(--student-accent) 0%, var(--student-accent-dark) 100%);
            color: white;
            padding: 15px;
            border: none;
            width: 100%;
            margin-top: 30px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            font-weight: 700;
            transition: background 0.3s, transform 0.2s, box-shadow 0.3s;
            box-shadow: 0 4px 10px rgba(78, 205, 196, 0.3);
        }

        .btn-update:hover {
            background: linear-gradient(135deg, var(--student-accent-dark) 0%, var(--student-accent) 100%);
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(78, 205, 196, 0.5);
        }

        .btn-update:active {
            transform: translateY(-1px);
        }
        
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #667eea; /* Secondary blue accent */
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.3s;
        }
        
        .back-btn:hover {
            background: #5266d6;
        }

        /* Sidebar Toggle Button (for mobile) */
        .toggle-btn {
            position: fixed;
            top: 20px;
            left: 20px;
            background: var(--student-accent);
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 20px;
            z-index: 1100;
            display: none;
        }

        /* Responsive adjustments */
        @media(max-width: 1024px) {
            .sidebar {
                transform: translateX(calc(var(--sidebar-width) * -1));
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
            }

            .toggle-btn {
                display: block;
            }

            .header {
                padding-left: 70px;
            }
        }

        @media (max-width: 768px) {
            .container { padding: 30px 20px; margin: 20px; }
            .header { font-size: 28px; padding: 25px 15px; }
            h2 { font-size: 24px; }
        }

    </style>
</head>
<body>

    <button class="toggle-btn" onclick="toggleSidebar()">
        <i class="fas fa-bars"></i>
    </button>

    <div class="dashboard-container">
        <div class="sidebar" id="sidebar">
            <div style="text-align: center; padding: 20px 0; font-size: 20px; font-weight: 700; color: white; background-color: #1e2b38;">
                <i class="fas fa-user-graduate" style="margin-right: 5px;"></i> **Student Portal**
            </div>
            <a href="student_dashboard.jsp">
                <i class="fas fa-tachometer-alt"></i> Dashboard
            </a>
            <a href="student_profile.jsp" class="active">
                <i class="fas fa-user"></i> Profile
            </a>
            <a href="time_table.jsp">
                <i class="fas fa-calendar-alt"></i> Timetable
            </a>
            <a href="attendance.jsp">
                <i class="fas fa-chart-bar"></i> Attendance
            </a>
            <a href="result.jsp">
                <i class="fas fa-graduation-cap"></i> Result
            </a>
            <a href="download_matirial.jsp">
                <i class="fas fa-file-download"></i> Download Notes
            </a>
            <a href="hallticket.jsp">
                <i class="fas fa-ticket-alt"></i> Hall Ticket
            </a>
            <a href="fees.jsp">
                <i class="fas fa-dollar-sign"></i> Fees Status
            </a>
            <hr style="border: 0; border-top: 1px solid #34495e; margin: 10px 20px;">
            <a href="logout.jsp" style="color: #ff6b6b;">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>

        <div class="main-content">
            <div class="header">
                <i class="fas fa-user-edit" style="margin-right: 10px;"></i> Edit Student Profile
            </div>

            <div class="container">
                <h2>Update Your Profile Information</h2>

                <div class="photo-box">
                    <img src="https://via.placeholder.com/140" alt="Current Profile Picture">
                </div>

                <form action="updateProfileServlet" method="post" enctype="multipart/form-data">
                    
                    <div class="form-group">
                        <label for="id"><i class="fas fa-id-card" style="margin-right: 8px;"></i>Student ID</label>
                        <input type="text" id="id" name="id" value="S0012345" readonly>
                    </div>

                    <div class="form-group">
                        <label for="name"><i class="fas fa-user" style="margin-right: 8px;"></i>Name</label>
                        <input type="text" id="name" name="name" value="John Doe" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email"><i class="fas fa-envelope" style="margin-right: 8px;"></i>Email</label>
                        <input type="email" id="email" name="email" value="john.doe@college.edu" required>
                    </div>

                    <div class="form-group">
                        <label for="phone"><i class="fas fa-phone" style="margin-right: 8px;"></i>Phone</label>
                        <input type="text" id="phone" name="phone" value="(555) 123-4567" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="department"><i class="fas fa-building" style="margin-right: 8px;"></i>Department</label>
                        <input type="text" id="department" name="department" value="Computer Science" required>
                    </div>

                    <div class="form-group">
                        <label for="course"><i class="fas fa-graduation-cap" style="margin-right: 8px;"></i>Course</label>
                        <input type="text" id="course" name="course" value="B.Tech" required>
                    </div>

                    <div class="form-group">
                        <label for="semester"><i class="fas fa-calendar-alt" style="margin-right: 8px;"></i>Semester</label>
                        <select id="semester" name="semester" required>
                            <option value="5" selected>5</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="address"><i class="fas fa-map-marker-alt" style="margin-right: 8px;"></i>Address</label>
                        <textarea id="address" name="address" rows="3">123 Main Street, Apartment 4B, Silicon Valley, CA 94020, USA</textarea>
                    </div>

                    <div class="form-group">
                        <label for="photo"><i class="fas fa-camera" style="margin-right: 8px;"></i>Update Profile Photo</label>
                        <input type="file" id="photo" name="photo" accept="image/*">
                    </div>

                    <button class="btn-update" type="submit">
                        <i class="fas fa-save" style="margin-right: 8px;"></i>Update Profile
                    </button>
                </form>
                
                <div style="text-align: center;">
                    <a href="student_profile.jsp" class="back-btn">
                        <i class="fas fa-arrow-left"></i> Cancel & Back to Profile
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const body = document.body;

            sidebar.classList.toggle('active');
            body.classList.toggle('sidebar-open');
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