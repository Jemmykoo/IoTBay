<%-- 
    Document   : PaymentHistorySearch
    Created on : 13/05/2022, 4:59:53 AM
    Author     : Patrick
--%>

<%@page import="uts.isd.model.Payment"%>
<%@page import="uts.isd.model.PaymentHistory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="labcss.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String paymentMethod = request.getParameter("paymentMethod");
            String nameOnCard = request.getParameter("nameOnCard");
            String cardNumber = request.getParameter("cardNumber");
            String expiryDate = request.getParameter("expiryDate");
            int CVV = Integer.parseInt(request.getParameter("CVV"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            String dateOfPayment = request.getParameter("dateOfPayment");
        PaymentHistory paymentHistory = new PaymentHistory(paymentMethod,nameOnCard,cardNumber,expiryDate,CVV,amount,dateOfPayment);%>
        <h1>Search for Payment</h1>
        <table>
	<thead>
                <tr>
                    <th><b>Payment Id</b></th>
                    <th><b>Date Paid</b></th>
                    <th><b>OrderId</b></th>
                    <th><b>Payment Method</b></th>
                    <th><b>Card Number</b></th>
                    <th><b>CVV</b></th>
                    <th><b>Name On Card</b></th>
                    <th><b>Expiry Date</b></th>
                </tr>
        </thead>
        <tbody> 
                <tr>
                    <td><p>${paymentId}</p></td>
                    <td><p><%=paymentHistory.getDateOfPayment()%></p></td>
                    <td><p>${orderId}</p></td>
                    <td><p><%=paymentHistory.getPaymentMethod()%></p></td>
                    <td><p><%=paymentHistory.getCardNumber()%></p></td>
                    <td><p><%=paymentHistory.getCVV()%></p></td>
                    <td><p><%=paymentHistory.getNameOnCard()%></p></td>
                    <td><p><%=paymentHistory.getExpiryDate()%></p></td>
                </tr> 
        </tbody>
        </table> 
    </body>
</html>