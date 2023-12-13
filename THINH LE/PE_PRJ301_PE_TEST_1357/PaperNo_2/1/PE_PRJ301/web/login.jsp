<%-- 
    Document   : login
    Created on : Mar 11, 2022, 9:02:11 PM
    Author     : hd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <!--your code here-->
        <form action="MainController" method="POST">
            UserId <input name="id" /> 
            <br>
            Password <input type="password" name="pass" />
            <br>
            <p style="background-color:red;color:white;display:inline-block">${noti}</p>
            <input name="action"  type="submit" value="Login" /> 
        </form>
    </body>
    
</html>

