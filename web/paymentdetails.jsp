<%-- 
    Document   : PaymentDetails
    Created on : 12/05/2022, 3:04:15 AM
    Author     : Patrick
--%><%@page import="uts.isd.model.Payment"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="labcss.css" />
        <title>Payment Details</title>
    </head>
    <body>
        <%  Integer paymentID = (Integer) session.getAttribute("paymentID");
            String paymentMethod = request.getParameter("paymentMethod");
            String nameOnCard = request.getParameter("nameOnCard");
            String cardNumber = request.getParameter("cardNumber");
            String expiryDate = request.getParameter("expiryDate");
            String CVV = request.getParameter("CVV");
            Payment payment = new Payment(paymentMethod, nameOnCard, cardNumber, expiryDate, CVV);%>
        <div id="bar">
            <span id="links">
                <a href="index.jsp">Home</a>
                <a href="products.jsp">Products</a>
                <a href="register.jsp">Register</a>
                <a href="login.jsp">Login</a>
                <a href="payment.jsp">Payment</a>
                <a href="paymentHistoryController">Payment History</a>
            </span>
        </div>
        <div>
            <h2>
                These are the Payment Details you have Inputted.
            </h2>
            <form id="form" method="POST" action="paymentsuccess.jsp">
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
            <p> <a class="buttonpaycon" href="PaymentEdit?paymentID=<%=paymentID%>">Edit</a>
            <p> <a class="buttonpaycon" href="PaymentDelete?paymentID=<%=paymentID%>">Cancel</a>
        </div>
        <div class="footer"><div></div></div>
    </body>
</html>
