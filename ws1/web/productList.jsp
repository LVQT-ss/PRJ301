<%@page import="java.util.List"%>
<%@page import="thinh.dto.Mobile"%>
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
                    <th>Mobile ID</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Mobile Name</th>
                    <th>Year of Production</th>
                    <th>Quantity</th>
                    <th>Not Sale</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    List<Mobile> list = (List) request.getAttribute("list");
                    if (list != null) {
                        for (Mobile mobile : list) {
                            count++;
                %>
                            <form action="MainController" method="POST">
                                <tr>
                                    <td><%=count%></td>
                                    <td><%= mobile.getMobileId()%></td>
                                    <td><input type="text" name="description" value="<%= mobile.getDescription()%>"></td>
                                    <td><input type="text" name="price" value="<%= mobile.getPrice()%>" ></td>
                                    <td><input type="text" name="mobileName" value="<%= mobile.getMobileName()%>"></td>
                                    <td><input type="text" name="yearOfProduction" value="<%= mobile.getYearOfProduction()%>" ></td>
                                    <td><input type="text" name="quantity" value="<%= mobile.getQuantity()%>" ></td>
                                    <td><input type="text" name="notSale" value="<%= mobile.isNotSale()%>" ></td>
                                    <td>
                                        <input type="hidden" name="mobileId" value="<%= mobile.getMobileId()%>">
                                         <a href="MainController?action=delete&mobileId=<%= mobile.getMobileId()%>" >Delete</a>
                                    </td>
                                    <td>
                                        <input type="submit" name="action" value="updateMobile">
                                    </td>
                                </tr>
                            </form>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <form action="MainController" method="POST">
            <input type="submit" name="status" value="addMobile">
        </form>

        <% String status = request.getParameter("status");
            if (status != null && status.equals("addMobile")) {
        %>
            <h1>Add New Mobile</h1>
            <form action="MainController" method="POST">
                Mobile ID: <input type="text" name="mobileId" required=""><br>
                Description: <input type="text" name="description" required=""><br>
                Price: <input type="text" name="price" required=""><br>
                Mobile Name: <input type="text" name="mobileName" required=""><br>
                Year of Production: <input type="text" name="yearOfProduction" required=""><br>
                Quantity: <input type="text" name="quantity" required=""><br>
                Not Sale: <input type="text" name="notSale" required=""><br>
                <input type="submit" name="action" value="saveMobile">
            </form>
        <%}%>

        <p style="background-color: green; margin-top:20px;color:white;display:inline-block;">${noti}</p>
    </body>
</html>
