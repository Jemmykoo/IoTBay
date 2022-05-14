<%-- 
    Document   : products
    Created on : 08/05/2022, 4:02:16 PM
    Author     : Jemima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="labcss.css" />
        <title>Add Products</title>
    </head>
    <body>
        <div id="bar">
            <span id="links">
                <a href="register.jsp">Register</a>
                <a href="./login.jsp">Login</a>
            </span>
        </div>
        <%
            ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
        %>
        <h1>The products list page</h1>
        <div>
            <table> <tr>
                    <%if (products != null) {
                            for (Product product : products) {
                    %>
                <tr>
                    <td><%=product.getProductId()%></td>
                    <td><%=product.getProductName()%></td>
                    <td><%=product.getUnitPrice()%></td>
                    <td><%=product.getProductType()%></td>
                    <td><%=product.getQuantity()%></td>
                    <td><%=product.getProductDescription()%></td>
                </tr>
                <%}}%>
                </tr>
                <tr>
                    <td>Hello</td>
                    <td>There</td> <td>Hello</td>
                    <td>There</td> <td>Hello</td>
                    <td>There</td>
                </tr>
            </table>
        </div>
        <div class="footer"><div></div></div>

    </body>
</html>
