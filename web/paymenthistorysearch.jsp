<%-- Document : PaymentHistorySearch Created on : 13/05/2022, 4:59:53 AM Author : Patrick --%>

    <%@page import="uts.isd.model.*" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>
            <head>
                <link rel="stylesheet" href="labcss.css" />
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
            </head>
            <body>
                <% User loggedInUser=(User) session.getAttribute("LoggedInUser"); %>
                    <div id="bar">
                        <span id="links">
                            <a href="index.jsp">Home</a>
                            <a href="products.jsp">Products</a>
                            <a href="payment.jsp">Payment</a>
                            <a href="PaymentHistoryController">Payment History</a>
                            <%if (loggedInUser !=null) { if (loggedInUser.getIsStaff()==true) {%> <a
                                    href="userManagement.jsp">User Management</a>
                                <% } } %>
                        </span>
                        <span id="loginlinks">
                            <a href="register.jsp">Register</a>
                            <a href="login.jsp">Login</a>
                            <%if (loggedInUser != null) {%><a href="logout.jsp">Logout</a> <%
                        }
                    %>
                        </span>
                    </div>
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
                        </tbody>
                    </table>
            </body>

            </html>