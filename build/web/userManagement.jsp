<%-- 
    Document   : UserManagement
    Created on : 13 May 2022, 4:36:41 pm
    Author     : DavidPhung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="uts.isd.model.*" %>


<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="labcss.css" />
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management</title>
        <div id="bar">
        <span id="links">
          <a href="index.jsp">Back</a> <%-- fix the href later --%>
        </span>
    </div>
    </head>
    <body>
        <h1>User Management - For staff only.</h1>

        <span id="links">
        <a type="button" href="userManagementCreate.jsp">Create Users</a> 
        <a type="button" href="userManagementViewEdit.jsp">View/Edit Users</a>
        <span/>
        
    </body>
</html>
