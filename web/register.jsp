<%-- 
    Document   : register
    Created on : 15 Mar. 2022, 8:27:38 pm
    Author     : jemima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="labcss.css"/>
        <title>Registration Page</title>
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
                %>            </span>
            <span id="loginlinks">
                <a href="register.jsp">Register</a>
                <a href="login.jsp">Login</a>
                <%if (loggedInUser != null) {%><a href="logout.jsp">Logout</a> <%
                    }
                %>
            </span>
        </div>
        <h1>Registration Page</h1>
        <div class="registerform">
            <form method="post" action="AddUserServlet">
                <table id="addUserForm">
                    <tr><td>First Name:</td><td><input type="text" name="firstName" /></td></tr>
                    <tr><td>Last Name:</td><td><input type="text" name="lastName"/></td></tr>
                    <tr><td>Email:</td><td><input type="text" name="email" /></td></tr>
                    <tr><td>Password:</td><td><input type="text" name="password" /></td></tr>
                    <tr><td>Phone Number:</td><td><input type="text" name="phoneNo" /></td></tr>
                    <input type="hidden" value=false /></td></tr> 
                    <tr><td></td><td>
                            <input class="button" type="submit" value="Add User"></td>
                    </tr>
                </table>
            </form>    
        </div>
        <div class="footer"><div> </div>
        </div>
    </body>
</html>