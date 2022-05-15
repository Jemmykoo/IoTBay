<%-- 
    Document   : paymenthistoryforanon
    Created on : 13/05/2022, 8:27:42 PM
    Author     : Patrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="labcss.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Anonymous Users Payment History</title>
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
        <h1>Anonymous Users Payment History</h1>
        <h2>Anonymous Users cannot have a payment history</h2>
        <p>If you would like you have a payment history please register <a href="register.jsp">here</a>
    </body>
</html>
