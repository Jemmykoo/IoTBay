<%-- 
    Document   : main
    Created on : Mar 30, 2022, 2:46:39 AM
    Author     : Justin
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="labcss.css" />
    <title>Main</title>
  </head>
    <body>
        <div id="bar">
            <span id="links">
                <a href="index.jsp">Home Page</a>
                <a href="logout.jsp">Logout</a>
            </span>
        </div>
        <%
            User user = (User) session.getAttribute("user");
            
        %>
        
        <div class="main-table-container">
            <h1 class="main-table-title"> Details Review </h1>
            <table class="main-table">
                <thead>
                    <tr>
                        <th class="main-th">First Name</th>
                        <th class="main-th">Last Name</th>
                        <th class="main-th">Email</th>
                        <th class="main-th">Password</th>
                        <th class="main-th">Phone Number</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="main-td">${user.firstName}</td>
                        <td class="main-td">${user.lastName}</td>
                        <td class="main-td">${user.email}</td>
                        <td class="main-td">${user.password}</td>
                        <td class="main-td">${user.phone}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    
            <div>
                <a href="edit.jsp">
                    <button>
                         Edit Account
                    </button>
                <a/>
            </div>

    </body>
</html>
