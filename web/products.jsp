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
        <%
            ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("productsList");
            User loggedInUser = (User) session.getAttribute("LoggedInUser");
        %>
        <div id="bar">
            <span id="links">
                <a href="index.jsp">Home</a>
                <a href="products.jsp">Products</a>                
                <a href="payment.jsp">Payment</a>
                <a href="PaymentHistoryController">Payment History</a>
                <%if (loggedInUser != null) {
                        if (loggedInUser.getIsStaff() == true) {%>  <a href="userManagement.jsp">User Management</a><%
                                    }
                                }
                %>
            </span>
            <span id="loginlinks">
                <a href="register.jsp">Register</a>
                <a href="login.jsp">Login</a>
                <%if (loggedInUser != null) {%><a href="logout.jsp">Logout</a> <%
                    }
                %>
            </span>
        </div>
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
                    <%if (loggedInUser != null) {
                                if (loggedInUser.getIsStaff() == true) { %><th>Edit</th>
                    <th>Delete</th> <%
                            }
                        }
                        %>
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
                    <%if (loggedInUser != null) {
                            if (loggedInUser.getIsStaff() == true) {%> <td >
                        <form action="editProduct.jsp" method="get">
                            <button name="productId" type="submit" value="<%=product.getProductId()%>">Edit</button>
                        </form></td>
                    <td></form>
                        <form method="post" action="DeleteProductServlet">  
                            <button name="productId" type="submit" value="<%=product.getProductId()%>">Delete</button>
                        </form>
                    </td> <%
                            }
                        }
                    %>

                </tr>
                <%}
                    }%>

            </table>
            <a href="addProduct.jsp">Add Product</a>

        </div>
        <div class="footer"><div></div></div>
    </body>
</html>
