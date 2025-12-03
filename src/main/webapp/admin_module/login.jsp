<%-- 
    Document   : login
    Created on : 16 Nov 2025, 12:27:33 pm

--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - College ERP</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh; }
        .container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 300px; }
        h3 { text-align: center; color: #333; }
        form { display: flex; flex-direction: column; }
        label { margin-bottom: 5px; font-weight: bold; }
        input { padding: 8px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 4px; }
        button { padding: 10px; background-color: #007BFF; color: white; border: none; border-radius: 4px; cursor: pointer; width:300px;font-size: 1.2rem}
        button:hover { background-color: #0056b3; }
        .error { color: red; text-align: center; margin-bottom: 10px; }
        .success { color: green; text-align: center; margin-bottom: 10px; }
        a { text-align: center; display: block; margin-top: 10px; color: #007BFF; text-decoration: none; }
    </style>
</head>
<body>
    <div class="container">
        <h3>Login to College ERP</h3>
        <% if (request.getParameter("success") != null) { %>
            <div class="success"><%= request.getParameter("success") %></div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>
        <form action="admin_module/admin_dashboard.jsp" method="post">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
            
            <label for="role">Role</label>
            <select id="role" name="role" required>
                <option value="STUDENT">Student</option>
                <option value="FACULTY">Faculty</option>
                <option value="ADMIN">Admin</option>
            </select>
            
            <a href="admin_module/admin_dashboard.jsp"> <button type="submit">Login</button></a>
        </form>
        <a href="admin_module/register.jsp">Don't have an account? Register</a>
    </div>
</body>
</html>
