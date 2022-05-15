<%-- 
    Document   : index
    Created on : 01/05/2022, 9:52:25 PM
    Author     : Jemima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="labcss.css"/>
        <title>Welcome Page</title>
    </head>
    <body>
        <div id="bar">
            <span id="links"> 
                <a href="index.jsp">Home</a>
                <a href="products.jsp">Products</a>
                <a href="register.jsp">Register</a>
                <a href="login.jsp">Login</a>
                <a href="payment.jsp">Payment</a>
                <a href="paymentHistoryController">Payment History</a>
                <a href="userManagement.jsp">User Management</a>
            </span>
        </div>
        <h1>The IoTBay!</h1>
        <div class="footer"><div></div></div>
                <jsp:include page="ConnServlet" flush="true"/>
    </body>
</html>
