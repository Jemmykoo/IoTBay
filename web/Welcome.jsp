<%-- Document : welcome.jsp Created on : 29 Mar. 2022, 6:55:25 pm Author :
jemima --%> <%@page contentType="text/html" pageEncoding="UTF-8"%> <%@page
import="uts.isd.model.*" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="labcss.css" />
    <title>Welcome</title>
  </head>
  <body>
    <div id="bar">
      <span id="links">
        <a href="index.jsp">Home Page</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="payment.jsp">Payment</a>
        <a href="PaymentHistoryController">Payment History</a>
      </span>
    </div>
    <% String firstname = request.getParameter("firstname"); String lastname =
    request.getParameter("lastname"); String email =
    request.getParameter("email"); String phone = request.getParameter("phone");
    String password = request.getParameter("password"); %>
    <h1>Welcome! <%= firstname %> you are now registered</h1>
    <% User user = new User(firstname, lastname, email, phone, password);
    session.setAttribute(email,user); %>
    <div class="footer"><div></div></div>
  </body>
</html>