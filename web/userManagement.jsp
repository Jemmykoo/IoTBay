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
        <title>User Management</title>
    </head>
    <body>
        <%
            User loggedInUser = (User) session.getAttribute("LoggedInUser");
        %>
        <div id="bar">
            <span id="links">
                <a href="index.jsp">Home</a>
                <a href="products.jsp">Products</a>                
                <a href="payment.jsp">Payment</a>
                <a href="PaymentHistoryController">Payment History</a>
                <a href="userManagement.jsp">User Management</a>
            </span>
            <span id="loginlinks">
                <a href="register.jsp">Register</a>
                <a href="login.jsp">Login</a>
                <%if (loggedInUser != null) {%><a href="logout.jsp">Logout</a> <%
                    }
                %>
            </span>
        </div>
        <%
            ArrayList<User> users = (ArrayList<User>) session.getAttribute("usersList");
        %>
        <h1>List of Users</h1>
        <div>
            <table class="productsTable"> 
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone number</th>
                    <th>Is Staff</th>
                    <th>Delete</th>
                </tr>
                <%if (users != null) {
                        for (User user : users) {
                %>
                <tr>
                    <td><%=user.getId()%></td>
                    <td><%=user.getFirstName()%></td>
                    <td><%=user.getLastName()%></td>
                    <td><%=user.getEmail()%></td>
                    <td><%=user.getPhone()%></td>
                    <td><%=user.getIsStaff()%></td>

                    <td> <form method="post" action="DeleteUserServlet">  
                            <button name="id" type="submit" value="<%=user.getId()%>">Delete</button>
                        </form>
                    </td>
                </tr>
                <%}
                    }%>
            </table>
            <a href="addUser.jsp">Add User</a>
        </div>
        <div class="footer"><div></div></div>
                <jsp:include page="/UsersServlet" flush="true"/>
    </body>
</html>
