<%@page import="java.util.List"%>
<%@page import="dto.Mobile"%>
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
                                    <td><input type="text" name="mobileName" value="<%= mobile.getMobileName()%>" readonly=""></td>
                                    <td><input type="text" name="yearOfProduction" value="<%= mobile.getYearOfProduction()%>" readonly="" ></td>
                                    <td><input type="text" name="quantity" value="<%= mobile.getQuantity()%>" ></td>
                                   <td>
                                <select name="notSale" id="notSaleSelect_<%=count%>">
                                    <option value="0" <%= mobile.isNotSale() ? "" : "selected" %>>Sale</option>
                                    <option value="1" <%= mobile.isNotSale() ? "selected" : "" %>>Not Sale</option>
                                </select>
                                <button type="button" onclick="toggleNotSale(<%=count%>, <%= mobile.isNotSale() ? '1' : '0' %>)">
                                    Toggle Not Sale
                                </button>
                            </td>
                                    <td>
                                        <input type="hidden" name="mobileId" value="<%= mobile.getMobileId()%>">
                                         <a href="MainController?action=delete&mobileId=<%= mobile.getMobileId()%>" >Delete</a>
                                    </td>
                                    <td>
                                        <input type="submit" name="action" value="update">
                                    </td>
                                </tr>
                            </form>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

                <form action="productList.jsp" method="POST">
        <input type="submit" name="status" value="add">
    </form>
      <% String status = request.getParameter("status");
    if (status != null && status.equals("add")) { %>

        <h1>Add New Mobile</h1>
        <form action="MainController" method="POST">
            Mobile ID: <input type="text" name="mobileId" required=""><br>
            Description: <input type="text" name="description" required=""><br>
            Price: <input type="text" name="price" required=""><br>
            Mobile Name:<input type="text" name="mobileName" required=""><br>
            Year Of Production: <input type="text" name="yearOfProduction" required=""><br>
            Quantity: <input type="text" name="quantity" required=""><br>
            Sale:
            <select name="notSale">
                <option value="0">Sale</option>
                <option value="1">Not Sale</option>
            </select><br>
            <input type="submit" name="action" value="save">
        </form>

    <% } %>
    <p style="background-color: green; margin-top:20px;color:white;display:inline-block;">${noti}</p>

    <script>
        function toggleNotSale(count, currentValue) {
            var notSaleSelect = document.getElementById('notSaleSelect_' + count);
            var newValue = currentValue === '1' ? '0' : '1';
            notSaleSelect.value = newValue;
        }
    </script>
    </body>
</html>
