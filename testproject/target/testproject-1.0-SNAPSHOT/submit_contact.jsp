<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<link rel="stylesheet" href="style.css">
<%@include file="header.jsp" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    // Perform any necessary processing with the form data here (e.g., sending an email).

    // For demonstration purposes, we will simply display the submitted data on the page.
%>
<div class="submitted-data-container">
    <h2>Pesan Terkirim</h2>
    <p><strong>Nama:</strong> <%= name %></p>
    <p><strong>Email:</strong> <%= email %></p>
    <p><strong>Pesan:</strong> <%= message %></p>
</div>
<%@include file="footer.jsp" %>
