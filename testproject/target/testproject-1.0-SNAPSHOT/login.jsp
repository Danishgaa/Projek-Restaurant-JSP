<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.sql.*" %>
<link rel="stylesheet" href="style.css">

<%@include file="header.jsp" %>    
<div class="login-container">
<form action="login" method="Post">
        <div class="form-floating mb-3">
            <input type="text" name="username" id="username" class="form-control" id="floatingInput" placeholder="name@example.com">
            <label for="floatingInput">Username</label>
        </div>
        <div class="form-floating mb-3">
            <input type="password" name="password" id="password" class="form-control" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">Password</label>
            <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Login</button>
        </div>
</form>
<hr class="my-4">
<a href="register.jsp" class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Sign in</a>
    </div>

</div>

<%
    String dbURL = "jdbc:mysql://localhost:3306/login";
    String dbUser = "faqih";
    String dbPassword = "12345";

    String action = request.getParameter("action");
    if (action == null || action.isEmpty()) {
        // No action specified, default to login
        action = "Login";
    }

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        if (action.equals("Login")) {
            // Handle login
            String query = "SELECT * FROM users WHERE username=? AND password=?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);

            rs = stmt.executeQuery();

            if (rs.next()) {
                // Login success
                String role = rs.getString("role");
                if (role.equals("admin")) {
                    out.println("<h1>Welcome Admin " + username + "!</h1>");
                } else if (role.equals("regular")) {
                    out.println("<h1>Welcome User " + username + "!</h1>");
                } else {
                    out.println("<h1>Invalid role. Please contact the administrator.</h1>");
                }
            } else {
                // Login failed
                out.println("<h1>Login failed. Invalid username or password.</h1>");
            }
        } else {
            // Handle registration (assuming "regular" role for new users)
            String query = "INSERT INTO users (username, password, role) VALUES (?, ?, 'regular')";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Registration success
                out.println("<h1>Registration successful!</h1>");
            } else {
                // Registration failed
                out.println("<h1>Registration failed. Please try again.</h1>");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close database resources
        try {
            rs.close();
        } catch (Exception e) {
            /* ignored */ }
        try {
            stmt.close();
        } catch (Exception e) {
            /* ignored */ }
        try {
            conn.close();
        } catch (Exception e) {
            /* ignored */ }
    }
%>
<%@include file="footer.jsp" %>
