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
                <a href="login.jsp">Login</a>

            </span>
        </div>
        <%
            ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("searchedProducts");
            System.out.println("HELLO ONCE");
        %>
        <h1>List of Products</h1>
        <div>


            <form action="SearchProductsServlet" method="post">
                <p>Search for a product Name</p><input type="text" name="searchProductString" />
                <button name="searchButton" type="submit" >Search</button>
            </form>
            <table class="productsTable"> 
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Type</th>
                    <th>Stock Quantity</th>
                    <th>Description</th>

                </tr>
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
                <%}
                    }%>

            </table>


        </div>
        <div class="footer"><div></div></div>
                <jsp:include page="/SearchProductsServlet" flush="true"/>
    </body>
</html>
