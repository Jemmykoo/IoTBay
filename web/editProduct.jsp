<%-- 
    Document   : addProduct
    Created on : 14/05/2022, 6:03:39 PM
    Author     : Alice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="labcss.css" />
        <title>Edit a Product</title>
    </head>
    <body>
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
        <h1>Edit an existing item in the catalogue.</h1>
        <div>
            <form method="post" action="EditProductServlet">                    
                <input type="hidden" name="productId" value="<%=(request.getParameter("productId"))%>"/>
                <table id="editProductsForm">
                    <tr><td>Product Name:</td><td><input type="text" name="productName"/></td></tr>
                    <tr><td>Product Unit Price:</td><td><input type="text" name="unitPrice"/></td></tr>
                    <tr><td>Product Type:</td><td><input type="text" name="productType"/></td></tr>
                    <tr><td>Product Quantity:</td><td><input type="text" name="quantity"/></td></tr>
                    <tr><td>Product Description:</td><td><input type="text" name="productDescription"/></td></tr>
                    <tr><td></td><td>
                            <input class="button" type="submit" value="Edit Product"></td>
                    </tr>
                </table>
        </div>
        <div class="footer"><div></div></div>

    </body>
</html>
