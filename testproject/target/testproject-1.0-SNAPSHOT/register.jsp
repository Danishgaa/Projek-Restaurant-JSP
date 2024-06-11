<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<link rel="stylesheet" href="style.css">

<%@include file="header.jsp" %>
  <div class="login-container">
<form action="register" method="Post">
              <div class="form-floating mb-3">
                <input type="text" name="username" id="username" class="form-control" id="floatingInput">
                <label for="floatingInput">Username</label>
              </div>
               <div class="form-floating mb-3">
                <input type="password" name="password" id="password" class="form-control" id="floatingInput" >
                <label for="floatingPassword">Password</label>
              </div>
              <div class="d-grid">
                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Regist</button>
              </div>
              <hr class="my-4">
              
            </form>
</div>
<%@include file="footer.jsp" %>
