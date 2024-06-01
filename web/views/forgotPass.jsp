<%-- 
    Document   : testJsp
    Created on : Jan 27, 2024, 9:43:50 PM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Recover Password</title>
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
            <form action="forgetPass" method="post">
                    <!--<h3>${status!=null?"Create or login account to use function":"welcome back"}</h3>-->
                <h3>Recovery Password</h3>

                <label for="username">Username</label>
                <input name="user_r" type="text" placeholder="username" id="username">

                <label  for="email">Email</label>
                <input name="email_r" type="email" placeholder="email" id="password">
                <p class="forgotPassP"><a href="<c:url value='/Login'/>" class="forgotPass link">Did you have Acccount?</a></p>
                <p>${error} ${mess}</p>
                <p></p>
                <button>Send</button>
                <div class="signUpPa">
                    <p class="signUp">Or sign up using</p>

                    <p class="signUp"><a href="<c:url value='/signup'/>" class="SignUpLink link ">SIGN UP</a></p>
                </div>	
            </form>
        </menu>

    </body>
</html>
