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
                <a href="searchproducts.jsp">Search Products</a>

            </span>
        </div>
        <%
            ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("productsList");
        %>
        <h1>List of Products</h1>
        <div>
            <table class="productsTable"> 
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Type</th>
                    <th>Stock Quantity</th>
                    <th>Description</th>
                    <th>Edit</th>
                    <th>Delete</th>
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
                    <td >
                        <form action="editProduct.jsp" method="get">
                            <button name="productId" type="submit" value="<%=product.getProductId()%>">Edit</button>
                        </form></td>
                    <td></form>
                        <form method="post" action="DeleteProductServlet">  
                            <button name="productId" type="submit" value="<%=product.getProductId()%>">Delete</button>
                        </form>
                    </td>
                </tr>
                <%}
                    }%>

            </table>
            <a href="addProduct.jsp">Add Product</a>

        </div>
        <div class="footer"><div></div></div>
                <jsp:include page="/ProductsServlet" flush="true"/>
    </body>
</html>
