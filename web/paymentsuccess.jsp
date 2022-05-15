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
        <span id="links">
                <a href="index.jsp">Home</a>
                <a href="products.jsp">Products</a>
                <a href="register.jsp">Register</a>
                <a href="login.jsp">Login</a>
                <a href="payment.jsp">Payment</a>
                <a href="paymentHistoryController">Payment History</a>
            </span>
        <h2>Payment Complete.</h2>
        <p>You can return back to the main page <a href="main.jsp">here</a>
    </body>
</html>
