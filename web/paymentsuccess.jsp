<%-- 
    Document   : paymentsuccess
    Created on : 15/05/2022, 7:43:29 AM
    Author     : Patrick
--%>
<%@page import="uts.isd.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="labcss.css" />
        <title>Payment Successful</title>
    </head>
    <body>
        <h1>Payment Successful</h1>
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
        <h2>Payment Complete.</h2>
        <p>You can return back to the main page <a href="index.jsp">here</a>
    </body>
</html>
