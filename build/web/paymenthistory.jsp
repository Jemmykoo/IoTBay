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
    <% ArrayList<String> rs = (ArrayList<String>) session.getAttribute("listOfPayments"); %>
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
            PaymentHistory paymentHistory = new PaymentHistory(paymentMethod, nameOnCard, cardNumber, expiryDate, CVV, amount, dateOfPayment);%>
        <h1>Payment History</h1>
        <span id="links">
            <a href="Main.jsp">Home Page</a>
            <a href="logout.jsp">Logout</a>
        </span>
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
                    <%  if(rs != null){
                    for(int i = 0; i < rs.size(); i=i+8){
                 %>
               <td><p> <%=rs.get(0+i)%> </p></td>
                    <td><p> <%=rs.get(1+i)%> </p></td>
                    <td><p> <%=rs.get(2+i)%> </p></td>
                    <td><p> <%=rs.get(3+i)%> </p></td>
                    <td><p> <%=rs.get(4+i)%>  </p></td>
                    <td><p> <%=rs.get(5+i)%>  </p></td>
                    <td><p> <%=rs.get(6+i)%>  </p></td>
                    <td><p> <%=rs.get(7+i)%> </p></td>
                </tr>
            </table>
                </tbody>
            </table> 
        </form>
        <div id="bar">
            <span id="links">
                <a href="index.jsp">Home Page</a>
                <a href="register.jsp">Register</a>
                <a href="login.jsp">Login</a>
                <a href="PaymentDetails.jsp">Payment Details</a>
            </span>
        </div>
    </body>
</html>
