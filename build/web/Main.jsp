<%-- Document : main Created on : 22 Mar. 2022, 7:10:41 pm Author : jemima --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="uts.isd.model.*" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="labcss.css" />
    <title>Main</title>
  </head>
  <body>
    <% 
        String loginEmail = request.getParameter("email"); 
        String loginPassword = request.getParameter("password"); 
        try { User user = (User)session.getAttribute(loginEmail);
        if(user.getPassword().equals(loginPassword)) { 
    %>
    <div id="bar">
      <span id="links">
        <a href="index.jsp">Home Page</a>
        <a href="logout.jsp">Logout</a>
      </span>
    </div>
    <div>
      <h2>
        You are now logged in to <%= user.getFirstName() %>'s IoTBay Account.
      </h2>
      <table id="form">
        <tr>
          <td>First Name:</td>
          <td><%= user.getFirstName() %></td>
        </tr>
        <tr>
          <td>Last Name:</td>
          <td><%= user.getLastName() %></td>
        </tr>
        <tr>
          <td>Email:</td>
          <td><%= user.getEmail() %></td>
        </tr>
        <tr>
          <td>Phone:</td>
          <td><%= user.getPhone() %></td>
        </tr>
      </table>
    </div>
    <% } else { %>
    <div id="bar">
      <span id="links">
        <a href="index.jsp">Home Page</a>
        <a href="register.jsp">Register</a>
        <a href="login.jsp">Login</a>
      </span>
    </div>
    <div>
      <h1>Incorrect password.</h1>
    </div>
    <% } } catch(Exception e) { %>
    <div id="bar">
      <span id="links">
        <a href="index.jsp">Home Page</a>
        <a href="register.jsp">Register</a>
        <a href="login.jsp">Login</a>
      </span>
    </div>
    <div>
      <h1>User does not exist.</h1>
    </div>
    <% } %>
    <div class="footer"><div></div></div>
  </body>
</html>
