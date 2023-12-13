<%@page import="java.util.List"%>
<%@page import="dto.Mobile"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Page</title>
</head>
<body>
    <h1>Welcome User</h1>

    <form action="MainController">
        <input name="action" type="submit" value="Logout" />
    </form>

   <form action="UserSearchController" method="POST">
    Min Price: <input type="text" name="minPrice" required/>
    Max Price: <input type="text" name="maxPrice"  required/>
    <input type="submit" value="Search by Price" name="action" /> 
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
                <th>Action</th>
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
                                <td><input type="text" name="description" value="<%= mobile.getDescription()%>" readonly=""></td>
                                <td><input type="text" name="price" value="<%= mobile.getPrice()%>" readonly=""></td>
                                <td><input type="text" name="mobileName" value="<%= mobile.getMobileName()%>" readonly=""></td>
                                <td><input type="text" name="yearOfProduction" value="<%= mobile.getYearOfProduction()%>" readonly=""></td>
                                <td><input type="text" name="quantity" value="1" /></td>
                                <td>
                                    <input type="hidden" name="mobileId" value="<%= mobile.getMobileId()%>">
                                    <input type="submit" value="Add to Cart" name="btAction" onclick="document.getElementById('addToCartForm').action='CartController?action=add_to_cart';"/>
                                </td>
                            </tr>
                        </form>
            <%
                    }
                }
            %>
        </tbody>
    </table>

    <form action="CartController" method="POST">
        <input type="submit" value="View Your Cart" name="btAction"/>
    </form>

    <p style="background-color: green; margin-top:20px;color:white;display:inline-block;">${noti}</p>
</body>
</html>
