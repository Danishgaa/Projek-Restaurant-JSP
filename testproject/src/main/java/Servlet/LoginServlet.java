/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ilham fajri
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String url = "jdbc:sqlserver://localhost\\LAPTOP-R1312I9E\\MSSQLSERVER02:1433;databaseName=restaurant;encrypt=true;trustServerCertificate=true;";
    String username = "danish";
    String password = "123";
    Statement st;
    ResultSet rs;
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("username");
        String upass = request.getParameter("password");
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();
        Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, username, password);
            PreparedStatement pst = con.prepareStatement("select * from users where username = ? and password = ?");
            pst.setString(1, uname);
            pst.setString(2, upass);

            rs = pst.executeQuery();
            if (rs.next()) {
                System.out.println("koneksi  berhhasil");
                session.setAttribute("id", rs.getString("id"));
                String role = rs.getString("role");
                                response.sendRedirect("index.jsp");

            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
