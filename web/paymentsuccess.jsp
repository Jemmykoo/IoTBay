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
        <title>Payment Successful</title>
    </head>
    <body>
        <%  Integer paymentID = (Integer) session.getAttribute("paymentID");
            String paymentMethod = request.getParameter("paymentMethod");
            String nameOnCard = request.getParameter("nameOnCard");
            String cardNumber = request.getParameter("cardNumber");
            String expiryDate = request.getParameter("expiryDate");
            String CVV = request.getParameter("CVV");
            Payment payment = new Payment(paymentMethod, nameOnCard, cardNumber, expiryDate, CVV);%>
        <h1>Payment Successful</h1>
        <h2>These are the Payment Details you have Inputted. </h2>
            <form id="form" method="POST" action="main.jsp">
                <table>
                <tr>
                    <td>Payment Method:</td>
                    <td><%= payment.getPaymentMethod()%></td>
                </tr>
                <tr>
                    <td>Name on Card:</td>
                    <td><%= payment.getNameOnCard()%></td>
                </tr>
                <tr>
                    <td>Card Number:</td>
                    <td><%= payment.getCardNumber()%></td>
                </tr>
                <tr>
                    <td>Expiry Date:</td>
                    <td><%= payment.getExpiryDate()%></td>
                </tr>
                <tr>
                    <td>CVV:</td>
                    <td><%= payment.getCVV()%></td>
                </tr>      
                <tr><td><input class="button" type="submit" value="Confirm"></td></tr>
            </table>
            </form>
    </body>
</html>
