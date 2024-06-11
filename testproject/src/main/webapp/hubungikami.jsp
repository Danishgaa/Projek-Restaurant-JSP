<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<link rel="stylesheet" href="style.css">
<%@include file="header.jsp" %>
<div class="contact-container">
    <h2>Hubungi Kami</h2>
    <form action="submit_contact.jsp" method="post">
        <label for="name">Nama:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="message">Pesan:</label>
        <textarea id="message" name="message" required></textarea>

        <input type="submit" value="Kirim" class="btn">
    </form>
</div>
<%@include file="footer.jsp" %>

