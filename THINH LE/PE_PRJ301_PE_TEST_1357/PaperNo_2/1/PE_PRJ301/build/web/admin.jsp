<%-- 
    Document   : admin
    Created on : Mar 1, 2022, 8:29:12 PM
    Author     : hd
--%>
<%@page import="java.util.List"%>
<%@page import="pe.dto.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <h1>  Account management </h1>
            
    </body>
    
    <form action="MainController">
        <input name="action" type="submit" value="Logout" />
    </form>

    <form action="MainController">
        <input type="text" name="data" />
        <input type="submit" value="search" name="action" /> 
    </form>
    <table border="1">
        <thead>
            <tr>
                <th>No</th>
                <th>userID</th>
                <th>fullName</th>
                <th>roleID</th>
                <th>password</th>
                <th>status</th>
                
            </tr>
        </thead>
        <tbody>
            <%
                int count = 0;
                List<Account> list = (List) request.getAttribute("list");
                if (list != null) {
                    for (Account i : list) {
                        count++;
            %>
        <form action="MainController" method="POST">
            <tr>
                <td><%=count%></td>
                <td><%= i.getUserId()%></td>
                <td><input type="text" name="name" value="<%= i.getFullName()%>"></td>
                <td><input type="text" name="major" value="<%= i.getRoleID()%>" readonly=""></td>
                <td><input type="text" name="yearOfBirth" value="<%= i.getPassword()%>" ></td>
                 <td><input type="text" name="yearOfBirth" value="<%= i.isStatus()%>" ></td>
                
                
            </tr>
        </form>
    </tbody>
    <% }
        }%>
</table>
</html>
