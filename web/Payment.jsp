<%-- 
    Document   : Payment
    Created on : 11/05/2022, 7:43:21 PM
    Author     : Patrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="labcss.css"/>
        <title>Payment Page</title>
        <% String cardNumberErr = (String) session.getAttribute("cardNumberErr"); 
        %>
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
            <form id="form" method="post" action="PaymentController">
                <table>
                    <tr><td>Payment Method:</td><td><input type="text" placeholder="Enter Payment Method:"id="paymentMethod" name="paymentMethod"></td></tr>
                    <tr><td>Name on the Card:</td><td><input type="text" placeholder="Enter the name on the card"id="nameOnCard" name="nameOnCard"></td></tr>
                    <tr><td>Card Number:</td><td><input type="text" placeholder="<%=(cardNumberErr != null ? cardNumberErr : "Enter Card Number")%>" id="cardNumber" name="cardNumber"></td></tr>
                    <tr><td>Expiry Date on Card:</td><td><input type="month" placeholder="Enter Expiry Date:" id="expiryDate" name="expiryDate"></td></tr>
                    <tr><td>CVV:</td><td><input type="text" placeholder="Enter CVV:" id="CVV" name="CVV"></td></tr>
                    <tr><td><input class="button" type="submit" value="Confirm"></input></td></tr>
                </table>  
            </form>     
        </div>
        <div class="footer"><div> </div>
        </div>
    </body>
</html>
