<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.User" %>
<%@ page import="com.res.dao.UserDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Panel</title>
  <link rel="stylesheet" href="./css/login.css">
</head>
<body>
  <div class="container">
    <div class="myform">
      <form action="${pageContext.request.contextPath}/login" method="post">
        <h2>LOGIN</h2>
        <% if(session != null && session.getAttribute("error") != null) { %>
          <div class="error-message">
            <%= session.getAttribute("error") %>
          </div>
          <% session.removeAttribute("error"); %> 
        <% } %>
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <select name="role" required>
          <option value="admin">Admin</option>
          <option value="driver">Driver</option>
        </select>
        <button type="submit">LOGIN</button>
      </form>
    </div>
    <div class="image">
      <img src="./assets/images/slide1.png" alt="Login Image">
    </div>
  </div>
</body>
</html>