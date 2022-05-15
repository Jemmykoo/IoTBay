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
        <%
            String productNameErr = (String) session.getAttribute("productNameErr");
            String unitPriceErr = (String) session.getAttribute("unitPriceErr");
            String productTypeErr = (String) session.getAttribute("productTypeErr");
            String quantityErr = (String) session.getAttribute("quantityErr");
            String productDescriptionErr = (String) session.getAttribute("productDescriptionErr");
        %>
        <div id="bar">
            <span id="links">
                <a href="index.jsp">Home</a>
                <a href="products.jsp">Products</a>
                <a href="register.jsp">Register</a>
                <a href="login.jsp">Login</a>
                <a href="payment.jsp">Payment</a>
                <a href="PaymentHistoryController">Payment History</a>
                <a href="userManagement.jsp">User Management</a>
            </span>
        </div>
        <h1>Edit an existing item in the catalogue.</h1>
        <div>
            <form method="post" action="EditProductServlet">                    
                <input type="hidden" name="productId" value="<%=(request.getParameter("productId"))%>"/>
                <table id="editProductsForm">
                    <tr><td>Product Name:</td><td><input type="text" name="productName"placeholder="<%=(productNameErr != null ? productNameErr : "Enter Product Name")%>"/></td></tr>
                    <tr><td>Product Unit Price:</td><td><input type="text" name="unitPrice" placeholder="<%=(unitPriceErr != null ? unitPriceErr : "Enter Unit Price")%>"/></td></tr>
                    <tr><td>Product Type:</td><td><input type="text" name="productType" placeholder="<%=(productTypeErr != null ? productTypeErr : "Enter Product Type")%>"/></td></tr>
                    <tr><td>Product Quantity:</td><td><input type="text" name="quantity" placeholder="<%=(quantityErr != null ? quantityErr : "Enter Product Quantity")%>" /></td></tr>
                    <tr><td>Product Description:</td><td><input type="text" name="productDescription" placeholder="<%=(productDescriptionErr != null ? productDescriptionErr : "Enter Product Description")%>" /></td></tr>
                    <tr><td></td><td>
                            <input class="button" type="submit" value="Edit Product"></td>
                    </tr>
                </table>
        </div>
        <div class="footer"><div></div></div>

    </body>
</html>
