<%@page import="java.util.List"%>
<%@page import="dto.Mobile"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cart Page</title>
</head>
<body>
    <h1>Your Cart</h1>

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
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cartItem" items="${cartItems}">
                <tr>
                    <td>${cartItem.index + 1}</td>
                    <td>${cartItem.mobile.getMobileId()}</td>
                    <td>${cartItem.mobile.getDescription()}</td>
                    <td>${cartItem.mobile.getPrice()}</td>
                    <td>${cartItem.mobile.getMobileName()}</td>
                    <td>${cartItem.mobile.getYearOfProduction()}</td>
                    <td>${cartItem.quantity}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <form action="CartController" method="POST">
        <input type="submit" value="Proceed to Checkout" name="btAction"/>
    </form>
</body>
</html>
