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
 * @author Danish
 */
@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String url = "jdbc:sqlserver://localhost\\LAPTOP-R1312I9E\\MSSQLSERVER02:1433;databaseName=restaurant;encrypt=true;trustServerCertificate=true;";
    String username = "danish";
    String password = "123";
    Statement st;
    ResultSet rs;
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
            String nama = request.getParameter("nama_makanan");
            String id_user = request.getParameter("id_user");
            String harga = request.getParameter("harga");
            String jumlah = request.getParameter("jumlah");
            String rasa = request.getParameter("rasa");
            String alamat = request.getParameter("alamat");
            String info = request.getParameter("info");
            
            
//            Converter to integer
        Integer iJumlah = Integer.parseInt(jumlah);
        Integer iHarga = Integer.parseInt(harga);
        
//        Total Harga
         Integer total = iJumlah * iHarga;
         
//         Convert to string
        String stotal = (String) Integer.toString(total);
        
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();
        Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, username, password);
            PreparedStatement pst = con.prepareStatement("insert into menu (nama_makanan, jumlah, rasa, alamat, informasi, total_harga, id_user) values (?,?,?,?,?,?,?)");
            pst.setString(1, nama);
            pst.setString(2, jumlah);
            pst.setString(3, rasa);
            pst.setString(4, alamat);
            pst.setString(5, info);
            pst.setString(6, stotal);
            pst.setString(7, id_user);

            rs = pst.executeQuery();
            if (rs.next()) {
                                response.sendRedirect("bukti_pemesanan.jsp");

            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("bukti_pemesanan.jsp");
            }
                                                    response.sendRedirect("bukti_pemesanan.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("bukti_pemesanan.jsp");
    }

}
