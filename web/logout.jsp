<%-- Document : logout Created on : 22 Mar. 2022, 7:05:11 pm Author : jemima
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="labcss.css" />
        <title>Logout</title>
    </head>
    <body>
        <%
            User loggedInUser = (User) session.getAttribute("LoggedInUser");
        %>
        <div id="bar">
            <span id="links">
                <a href="index.jsp">Home</a>
                <a href="products.jsp">Products</a>                
                <a href="payment.jsp">Payment</a>
                <a href="PaymentHistoryController">Payment History</a>
                <%if (loggedInUser != null) {
                        if (loggedInUser.getIsStaff() == true) {%>  <a href="userManagement.jsp">User Management</a><%
                        }
                    }
                %>
            </span
            <span id="loginlinks">
                <a href="register.jsp">Register</a>
                <a href="login.jsp">Login</a>

            </span>
        </div>
        <% session.invalidate();
            response.sendRedirect("index.jsp");

        %>
        <h1>You Have Logged out. Thank you, have a good day!</h1>
        <div class="footer"><div></div></div>
    </body>
</html>
