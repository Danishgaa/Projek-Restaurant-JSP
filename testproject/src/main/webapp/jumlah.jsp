<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link rel="stylesheet" href="style.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Menu Data</title>
    </head>
    <body>
        <h1>Menu Data</h1>
        <table border="1">
            <tr>
                <th>Nama Makanan</th>
                <th>Jumlah</th>
                <th>Jenis Rasa</th>
                <th>Alamat</th>
                <th>Informasi</th>
                <th>Total Harga</th>
            </tr>
            <%
                String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
                String url = "jdbc:sqlserver://localhost\\LAPTOP-R1312I9E\\MSSQLSERVER02:1433;databaseName=restaurant;encrypt=true;trustServerCertificate=true;";
                String username = "danish";
                String password = "123";
                Statement st;
                ResultSet rs;

                try {
                    Class.forName(driver);
                    String id_user = (String) session.getAttribute("id");
                    Connection con = DriverManager.getConnection(url, username, password);
                    PreparedStatement pst = con.prepareStatement("select  * from menu where id_user = ?");
                    pst.setString(1, id_user);
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        String kode = rs.getString("kode");
                        String Jumlah = rs.getString("jumlah");
                        String Jenis_rasa = rs.getString("rasa");
                        String nama = rs.getString("nama_makanan");
                        String alamat = rs.getString("alamat");
                        String info = rs.getString("informasi");
                        String total = rs.getString("total_harga");


            %> 
            <tr>
                <td><%=nama%></td>
                <td><%=Jumlah%></td>
                <td><%=Jenis_rasa%></td>
                <td><%=alamat%></td>
                <td><%=info%></td>
                <td><%=total%></td>
            </tr>
            <%
                    }

                } catch (Exception e) {
                }
            %>
        </table>
        <%@include file="footer.jsp" %>