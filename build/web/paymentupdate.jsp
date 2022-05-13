<%-- 
    Document   : Payment
    Created on : 11/05/2022, 7:43:21 PM
    Author     : Patrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="labcss.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="labcss.css"/>
        <title>Payment Page</title>
    </head>
    <body>
        <div id="bar">
            <span id="links">
                <a href="index.jsp">Home Page</a>
                <a href="logout.jsp">Logout</a>
            </span>
        </div>
        <h1>Order #${orderid}</h1>
        <div class="registerform">
            <form id="form" method="POST" action="PaymentDetails.jsp">
                <table>
                    <tr><td>Payment Method:</td><td><input type="text" id="paymentMethod" name="paymentMethod"></td></tr>
                    <tr><td>Name on the Card:</td><td><input type="text" id="nameOnCard" name="nameOnCard"></td></tr>
                    <tr><td>Card Number:</td><td><input type="text" id="cardNumber" name="cardNumber"></td></tr>
                    <tr><td>Expiry Date on Card:</td><td><input type="date" id="expiryDate" name="expiryDate"></td></tr>
                    <tr><td>CVV:</td><td><input type="integer" id="cvv" name="cvv"></td></tr>
                    <tr><td><input class="button" type="submit" value="Update"></input></td></tr>
                </table>  
            </form>     
        </div>
        <div class="footer"><div> </div>
        </div>
    </body>
</html>
