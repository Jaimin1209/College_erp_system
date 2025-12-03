<%-- 
    Document   : logout
    Created on : 21 Nov 2025, 10:03:35 am
    Author     : PRITESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%
    // Destroy user session
    session.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .logout-box {
            background: white;
            width: 380px;
            padding: 30px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            animation: fadeIn 0.6s ease;
        }

        .logout-box h1 {
            font-size: 26px;
            margin-bottom: 10px;
            color: #333;
        }

        .logout-box p {
            font-size: 16px;
            color: #555;
            margin-bottom: 25px;
        }

        .logout-btn {
            display: inline-block;
            background: #007bff;
            color: white;
            padding: 12px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 16px;
            transition: 0.3s;
        }

        .logout-btn:hover {
            background: #0056b3;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>

    <div class="logout-box">
        <h1>Logout Successful</h1>
        <p>You have been logged out of your session.</p>

        <a href="login.jsp" class="logout-btn">Go to Login</a>
    </div>

</body>
</html>
