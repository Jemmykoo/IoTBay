<%-- Document : PaymentHistory Created on : 11/05/2022, 7:44:59 PM Author : Patrick --%>

    <%@page import="java.text.SimpleDateFormat" %>
        <%@page import="java.text.DateFormat" %>
            <%@page import="java.sql.Date" %>
                <%@page import="java.util.ArrayList" %>
                    <%@page import="uts.isd.model.*" %>
                        <%@page contentType="text/html" pageEncoding="UTF-8" %>
                            <!DOCTYPE html>
                            <html>

                            <head>
                                <link rel="stylesheet" href="labcss.css" />
                                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                                <title>Payment History</title>
                            </head>

                            <body>
                                <% User loggedInUser=(User) session.getAttribute("LoggedInUser"); ArrayList<String>
                                    paymentList = (ArrayList<String>) session.getAttribute("listOfPayments");
                                        %>
                                        <h1>Payment History</h1>
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
                                                <%if (loggedInUser !=null) {%><a href="logout.jsp">Logout</a>
                                                    <% } %>
                                            </span>
                                        </div>
                                        <form class="smart-form">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th><b>Payment Id</b></th>
                                                        <th><b>Payment Method</b></th>
                                                        <th><b>Name On Card</b></th>
                                                        <th><b>Card Number</b></th>
                                                        <th><b>Expiry Date</b></th>
                                                        <th><b>CVV</b></th>
                                                        <th><b>Order Id</b></th>
                                                        <th><b>Amount Paid</b></th>
                                                        <th><b>Date of the Order</b></th>
                                                    </tr>
                                                    <% if (!paymentList.isEmpty()) { for(int i=0; i
                                                        <=(paymentList.size() / 9) - 1; i++) { %>
                                                        <tr>
                                                            <th>
                                                                <%=paymentList.get(9 * i + 0)%>
                                                            </th>
                                                            <th>
                                                                <%=paymentList.get(9 * i + 1)%>
                                                            </th>
                                                            <th>
                                                                <%=paymentList.get(9 * i + 2)%>
                                                            </th>
                                                            <th>
                                                                <%=paymentList.get(9 * i + 3)%>
                                                            </th>
                                                            <th>
                                                                <%=paymentList.get(9 * i + 4)%>
                                                            </th>
                                                            <th>
                                                                <%=paymentList.get(9 * i + 5)%>
                                                            </th>
                                                            <th>
                                                                <%=paymentList.get(9 * i + 6)%>
                                                            </th>
                                                            <th>
                                                                <%=paymentList.get(9 * i + 7)%>
                                                            </th>
                                                            <th>
                                                                <%=paymentList.get(9 * i + 8)%>
                                                            </th>
                                                        </tr>
                                                        <% } } %>
                                                </thead>
                                            </table>
                                        </form>
                            </body>

                            </html>