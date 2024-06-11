<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="style.css">
<%@include file="header.jsp" %>
<center>
    <h1>Bukti Pemesanan</h1>
</center>
<br>
<%
    String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String url = "jdbc:sqlserver://localhost\\LAPTOP-R1312I9E\\MSSQLSERVER02:1433;databaseName=restaurant;encrypt=true;trustServerCertificate=true;";
    String username = "danish";
    String password = "123";
    Statement st;
    ResultSet rs;

    try {
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement pst = con.prepareStatement("select top 1 * from menu order by kode desc");
        rs = pst.executeQuery();
        if (rs.next()) {
            String Jumlah = rs.getString("jumlah");
            String Jenis_rasa = rs.getString("rasa");
            String nama = rs.getString("nama_makanan");
            String alamat = rs.getString("alamat");
            String info = rs.getString("informasi");
            String total = rs.getString("total_harga");
            
            
%> 
<p class="bukti">Nama Makanan : <%=nama%></p>
<p class="bukti">Jumlah : <%= Jumlah%></p>
<p class="bukti">Jenis Rasa : <%=Jenis_rasa%></p>
<p class="bukti">Total Harga : <%=total%></p>
<p class="bukti">Alamat : <%=alamat%></p>
<p class="bukti">Informasi Tambahan : <%=info%></p>
<%
        }

    } catch (Exception e) {
    }
%>
<form action="jumlah.jsp">
    <!--<input type="submit" value="Total" class="btn">-->
</form>
<%@include file="footer.jsp" %>

