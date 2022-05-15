<%-- 
    Document   : PaymentHistory
    Created on : 11/05/2022, 7:44:59 PM
    Author     : Patrick
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.PaymentHistory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="labcss.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment History</title>
    </head>
    <body>
        <% String paymentMethod = request.getParameter("paymentMethod");
            String nameOnCard = request.getParameter("nameOnCard");
            String cardNumber = request.getParameter("cardNumber");
            String expiryDate = request.getParameter("expiryDate");
            int CVV = Integer.parseInt(request.getParameter("CVV"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            String dateOfPayment = request.getParameter("dateOfPayment");
            PaymentHistory paymentHistory = new PaymentHistory(paymentMethod, nameOnCard, cardNumber, expiryDate, CVV, amount, dateOfPayment);
            ArrayList<String> rs = (ArrayList<String>) session.getAttribute("listOfPayments"); %>
        <h1>Payment History</h1>
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
        <form class="smart-form">
            <table>
                <thead>
                    <tr>
                        <th><b>Payment Id</b></th>
                        <th><b>Date Paid</b></th>
                        <th><b>Order Id</b></th>
                        <th><b>Payment Method</b></th>
                        <th><b>Card Number</b></th>
                        <th><b>CVV</b></th>
                        <th><b>Name On Card</b></th>
                        <th><b>Expiry Date</b></th>
                    </tr>
                </thead>
                <tbody> 
                    <%  if (rs != null) {
                            for (int i = 0; i <= rs.size() - 1; i = i++) {
                    %>
                <td><p> <%=rs.get(0 + i * 9)%> </p></td>
                <td><p> <%=rs.get(1 + i * 9)%> </p></td>
                <td><p> <%=rs.get(2 + i * 9)%> </p></td>
                <td><p> <%=rs.get(3 + i * 9)%> </p></td>
                <td><p> <%=rs.get(4 + i * 9)%>  </p></td>
                <td><p> <%=rs.get(5 + i * 9)%>  </p></td>
                <td><p> <%=rs.get(6 + i * 9)%>  </p></td>
                <td><p> <%=rs.get(7 + i * 9)%> </p></td>
                <td><p> <%=rs.get(8 + i * 9)%> </p></td>
                </tr>
                </tbody>
            </table> 
        </form>
    </body>
</html>
