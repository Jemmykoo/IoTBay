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
        <title>Add Products</title>
    </head>
    <body>
        <div id="bar">
            <span id="links">
                <a href="register.jsp">Register</a>
                <a href="./login.jsp">Login</a>
            </span>
        </div>

        <h1>The products list page</h1>
        <div>
            <form method="post" action="AddProductServlet">
                <table id="products_form_table">
                    <tr><td>Product Name:</td><td><input type="text" name="productName" value="${product.name}"/></td></tr>
                    <tr><td>Product Unit Price:</td><td><input type="text" name="unitPrice" value="${product.unitPrice}"/></td></tr>
                    <tr><td>Product Type:</td><td><input type="text" name="productType" value="${product.productType}"/></td></tr>
                    <tr><td>Product Quantity:</td><td><input type="text" name="quantity" value="${product.quantity}"/></td></tr>
                    <tr><td>Product Description:</td><td><input type="text" name="productDescription" value="${product.productDescription}"/></td></tr>
                    <tr><td></td><td><a href="ProductsServlet" class="button"></a>
                            <input class="button" type="submit" value="Add Product"></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="footer"><div></div></div>

    </body>
</html>
