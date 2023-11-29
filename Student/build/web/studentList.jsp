
<%@page import="java.util.List"%>
<%@page import="pe.dto.Students"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <h1>Welcome Admin</h1>
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
                <th>id</th>
                <th>name</th>
                <th>major</th>
                <th>year of birth</th>
                <th>Delete</th>
                <th>Update</th>
            </tr>
        </thead>
        <tbody>
            <%
                int count = 0;
                List<Students> list = (List) request.getAttribute("list");
                if (list != null) {
                    for (Students i : list) {
                        count++;
            %>
        <form action="MainController" method="POST">
            <tr>
                <td><%=count%></td>
                <td><%= i.getId()%></td>
                <td><input type="text" name="name" value="<%= i.getName()%>"></td>
                <td><input type="text" name="major" value="<%= i.getMajor()%>"></td>
                <td><input type="text" name="yearOfBirth" value="<%= i.getYearOfBirth()%>" readonly=""></td>
                <td>
                    <input type="hidden" name="id" value="<%= i.getId()%>">
                    <a href="MainController?action=delete&id=<%= i.getId()%>" >Delete</a>
                </td>
                <td>
                    <input type="submit" name="action" value="update">
                </td>
            </tr>
        </form>
    </tbody>
    <% }
        }%>
</table>
<form action="studentList.jsp" method="POST">
    <input type="submit" name="status" value="add">
</form>
<% String status = request.getParameter("status");
    if (status != null && status.equals("add")) {
%>

<h1>Add New Student</h1>
<form action="MainController" method="POST">
    ID: <input type="text" name="id" required=""><br>
    Name: <input type="text" name="name" required=""><br>
    Major: <input type="text" name="major" required=""><br>
    Year Of Birth :<input type="number" name="yearOfBirth" required=""><br>
    <input type="submit" name="action" value="save">
</form>
<%}%>
<p style="background-color: green; margin-top:20px;color:white;display:inline-block;">${noti}</p>
</html>