<%-- 
    Document   : Login
    Created on : Jan 9, 2024, 3:50:07 PM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*, jakarta.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
        <link rel="icon" href="<c:url value='/resources/img/logoITV.ico' />">
        <link href="<c:url value='/resources/css/login.css' />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value='/resources/css/bar.css' />" rel="stylesheet" type="text/css"/>


    </head>
    <body>
        <%@include file="TopBar.jsp" %>
        <menu>
            <div class="background">
                <div class="shape"></div>
                <div class="shape"></div>
            </div>
            <form action="Login" method="post">
                <h3>${status!=null?"Create or login account to use function":"welcome back"}</h3>

                <label for="username">Username</label>
                <input name="user_r" type="text" placeholder="Email or Phone" id="username">

                <label  for="password">Password</label>
                <input name="pass_r" type="password" placeholder="Password" id="password">
                <p class="forgotPassP"><a href="<c:url value='/forgetPass'/>" class="forgotPass link">Forgot password?</a>	</p>
                <h3>${error}</h3>
                <button>Log In</button>
                <div class="signUpPa">
                    <p class="signUp">Or sign up using</p>

                    <p class="signUp"><a href="<c:url value='/signup'/>" class="SignUpLink link ">SIGN UP</a></p>
                </div>	
            </form>
        </menu>
    </body>
</html>

