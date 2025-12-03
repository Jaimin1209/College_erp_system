<%-- 
    Document   : logout
    Created on : 27 Nov 2025, 11:54:04 pm
    Author     : PRITESH
--%>

<%--
    Document   : faculty_logout
    Created on : 28 Nov 2025
    Author     : PRITESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Ensure that the session is invalidated
    session.invalidate();
    
    // Set a response header to prevent caching of this page
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Logout Successful</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            text-align: center;
        }
        
        .logout-message {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 90%;
            border-top: 5px solid #ff6b6b; /* Use a strong color for final action */
        }
        
        .logout-message i {
            font-size: 50px;
            color: #ff6b6b;
            margin-bottom: 20px;
        }
        
        .logout-message h2 {
            color: #333;
            margin-bottom: 10px;
            font-size: 26px;
        }
        
        .logout-message p {
            color: #555;
            margin-bottom: 30px;
        }
        
        .login-btn {
            display: inline-block;
            padding: 12px 25px;
            background: #667eea;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.3s;
        }
        
        .login-btn:hover {
            background: #5266d6;
        }
    </style>
</head>
<body>

<div class="logout-message">
    <i class="fas fa-sign-out-alt"></i>
    <h2>Logout Successful!</h2>
    <p>You have been securely logged out of the Faculty Dashboard.</p>
    
    <a href="index.jsp" class="login-btn">
        <i class="fas fa-user-circle"></i> Go to Login Page
    </a>
</div>

</body>
</html>
<script>
    setTimeout(function(){
        window.location.href = 'index.jsp'; // Redirect to login page
    }, 3000);
</script>
