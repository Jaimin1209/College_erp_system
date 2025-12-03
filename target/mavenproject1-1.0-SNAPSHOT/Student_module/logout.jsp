<%--
    Document   : logout
    Created on : 27 Nov 2025, 11:36:49 pm
    Author     : PRITESH
    Description: Logout confirmation page for students.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student Logout</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Base Styles: Centered Content */
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 40px 20px;
            color: #333;
            line-height: 1.6;
            display: flex;
            flex-direction: column; /* Allows header and container to stack */
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Student Dashboard Header Style */
        .header {
            background: linear-gradient(135deg, #4ecdc4 0%, #30a9a3 100%); /* Student Accent */
            padding: 30px 20px;
            color: white;
            text-align: center;
            font-size: 32px;
            font-weight: 700;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            position: relative;
            margin-bottom: 40px;
            width: 100%;
            /* Removed fixed position for better centering of the page content */
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

        /* Confirmation Container */
        .container {
            max-width: 500px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            padding: 40px;
            border: 1px solid #e1e5e9;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-top: 20px; /* Space from the header */
        }

        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.15);
        }

        .logout-icon {
            font-size: 64px;
            color: #4ecdc4; /* Student Accent */
            margin-bottom: 20px;
        }

        .message {
            font-size: 18px;
            color: #34495e;
            margin-bottom: 30px;
            font-weight: 600;
        }

        /* Logout Button (Red - Danger Action) */
        .btn-logout {
            background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(220, 53, 69, 0.3);
            margin-right: 15px;
        }

        .btn-logout:hover {
            background: linear-gradient(135deg, #c82333 0%, #a02622 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(220, 53, 69, 0.4);
        }

        /* Cancel Button (Secondary Color) */
        .btn-cancel {
            background: linear-gradient(135deg, #667eea 0%, #5266d6 100%); /* Blue Accent */
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(102, 126, 234, 0.3);
            text-decoration: none;
            display: inline-block;
        }

        .btn-cancel:hover {
            background: linear-gradient(135deg, #5266d6 0%, #667eea 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(102, 126, 234, 0.4);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container { padding: 30px 20px; margin: 20px 10px; }
            .header { font-size: 28px; padding: 25px 15px; }
            .btn-logout, .btn-cancel {
                padding: 12px 20px;
                font-size: 16px;
                margin-bottom: 15px;
            }
        }
    </style>
</head>
<body>

<div class="header">
    <i class="fas fa-sign-out-alt" style="margin-right: 10px;"></i> Student Logout
</div>

<div class="container">
    <div class="logout-icon">
        <i class="fas fa-sign-out-alt"></i>
    </div>
    <div class="message">
        Are you sure you want to **logout** from your account?
    </div>
    
    <form action="logoutServlet" method="post" style="display: inline;">
        <button type="submit" class="btn-logout">
            <i class="fas fa-sign-out-alt" style="margin-right: 8px;"></i>Yes, Logout
        </button>
    </form>
    
    <a href="student_dashboard.jsp" class="btn-cancel">
        <i class="fas fa-arrow-left" style="margin-right: 8px;"></i>Cancel
    </a>
</div>

</body>
</html>