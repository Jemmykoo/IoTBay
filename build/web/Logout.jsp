<%-- Document : logout Created on : 22 Mar. 2022, 7:05:11 pm Author : jemima
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="labcss.css" />
    <title>Logout</title>
  </head>
  <body>
    <div id="bar">
      <span id="links">
        <a href="register.jsp">Register</a>
        <a href="Login.jsp">Login</a>
      </span>
    </div>
    <% session.invalidate(); %>
    <h1>You Have Logged out. Thank you, have a good day!</h1>
    <div class="footer"><div></div></div>
  </body>
</html>
