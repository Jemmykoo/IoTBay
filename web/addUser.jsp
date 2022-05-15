<%-- 
    Document   : addProduct
    Created on : 14/05/2022, 6:03:39 PM
    Author     : Alice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="labcss.css" />
        <title>Add User</title>
    </head>
    <body>
        <div id="bar">
            <span id="links">
                <a href="index.jsp">Home</a>
                <a href="products.jsp">Products</a>                
                <a href="payment.jsp">Payment</a>
                <a href="PaymentHistoryController">Payment History</a>
                <a href="userManagement.jsp">User Management</a>
            </span>
            <span id="loginlinks">
                <a href="register.jsp">Register</a>
                <a href="login.jsp">Login</a>
            </span>
        </div>
        <h1>Add a User to the database </h1>
        <div>
            <form method="post" action="AddUserServlet">
                <table id="addUserForm">
                    <tr><td>First Name:</td><td><input type="text" name="firstName" /></td></tr>
                    <tr><td>Last Name:</td><td><input type="text" name="lastName"/></td></tr>
                    <tr><td>Email:</td><td><input type="text" name="email" /></td></tr>
                    <tr><td>Password:</td><td><input type="text" name="password" /></td></tr>
                    <tr><td>Phone Number:</td><td><input type="text" name="phoneNo" /></td></tr>
                    <tr>
                        <td>User Level:</td><td><input type="radio" name="isStaff" value="false" checked />Customer</td>
                        <td><input type="radio" name="isStaff" value="false"/>Staff</td>
                    </tr> 
                    <tr><td></td><td>
                            <input class="button" type="submit" value="Add User"></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="footer"><div></div></div>

    </body>
</html>
