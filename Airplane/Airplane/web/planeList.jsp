<%-- 
    Document   : planeList
    Created on : Oct 18, 2023, 12:41:48 AM
    Author     : Zane
--%>

<%@page import="java.util.List"%>
<%@page import="dto.Airplanes"%>
<%@page import="dto.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            Users loginUser = (Users) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !("AD".equals(loginUser.getRoleID()))) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <a href="MainController?action=Logout" class="Logout">Logout</a>    
        <form action ="MainController">
            <input type ="text" placeholder="Search by ID " name ="search" value="<%=search%>" />
            <input type ="submit" name ="action" value ="Search" />
        </form>
        <%
            List<Airplanes> listPlane = (List<Airplanes>) request.getAttribute("LIST_PLANE");
            if (listPlane != null) {
                if (listPlane.size() > 0) {
        %>
        </br>
        <table class="table" border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Destination</th>
                    <th>DepartureTime</th>
                    <th>isDelay</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (Airplanes c : listPlane) {
                %>

            <form action="MainController">
                <tr>
                    <td><%= count++%></td>
                    <td><%= c.getId()%></td>
                    <td>
                        <input type="text" name="destination" value="<%= c.getDestination() %>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="departureTime" value="<%= c.getDepartureTime() %>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="isDelay" value="<%= c.isIsDelay() %>" required=""/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="id" value="<%= c.getId()%>"/>
                        <input type="hidden" name="search" value="<%= search%>"/>
                    </td>
                    <td>
                        <a href="MainController?search=<%=search%>&action=Delete&id=<%=c.getId()%>">Delete</a>
                    </td>
                </tr>
            </form>

            <%
                }
            %>
        </tbody>
    <% }
        }%>
</table>
<form action="planeList.jsp" method="POST">
    <input type="submit" name="status" value="add">
</form>
<% String status = request.getParameter("status");
    if (status != null && status.equals("add")) {
%>

<h1>Add New ROTE</h1>
<form action="MainController" method="POST">
    ID: <input type="text" name="id" required=""><br>
    Destination: <input type="text" name="destination" required=""><br>
    Departure Time <input type="text" name="departureTime" required=""><br>
    Delay :<input type="text" name="isDelay" required=""><br>
    <input type="submit" name="action" value="save">
</form>
<%}%>
<p style="background-color: green; margin-top:20px;color:white;display:inline-block;">${noti}</p>
</html>
