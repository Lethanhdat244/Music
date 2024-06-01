<%-- 
    Document   : signout
    Created on : Jan 18, 2024, 12:23:28 PM
    Author     : thanh
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Design by foolishdeveloper.com -->
        <title>SignUp</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
        <link rel="icon" href="<c:url value='/resources/img/logoITV.ico' />">
        <link href="<c:url value='/resources/css/login.css' />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value='/resources/css/bar.css' />" rel="stylesheet" type="text/css"/>
        <style>
            label{
                margin:10px;
            }
            #signup-btn{
                margin-top: 20px;
                width: 100%;
                background-color: rgba(64,29,25,0.6);
                color: white;
                padding: 15px 0;
                font-size: 18px;
                font-weight: 600;
                border-radius: 5px;
                cursor: pointer;
            }
            #signup-btn:hover{
                color: rgba(64,29,25,0.6);
                background-color: white;
            }
        </style>


    </head>
    <body>
        <%@include file="TopBar.jsp" %>
        <menu>
            <div class="background">
                <div class="shape"></div>
                <div class="shape"></div>
            </div>
            <form action="signup" method="post">
                <h3>Join our social</h3>

                <label for="username">Username</label>
                <input name="user_r" type="text" placeholder="Email or Phone" id="username">

                <label  for="password">Password</label>
                <input name="pass_r" type="password" placeholder="Password" id="password" required>
                <input name="repass_r" type="password" placeholder="Re-enter password" id="password2"  required>

                <p id="message">${mess}</p>
                <label  for="email">Email</label>
                <input name="email_r" type="email" placeholder="Email" required>

                                <!--<h4>${mess}</h4>-->
                <input type="submit" value="Sign Up" id="signup-btn">
                <!--<button>Sign up</button>-->
                <div class="signUpPa">
                    <p class="signUp">Have An Account? </p>
                    <p class="signUp"><a href="<c:url value='/Login'/>" class="SignUpLink link ">Login</a></p>
                </div>	
            </form>
        </menu>
    </body>
    <script>
        let match = false;
        function checkPassword() {
            var password1 = document.getElementById("password").value;
            var password2 = document.getElementById("password2").value;
            var message = document.getElementById("message");
            var btnSignUp = document.getElementById('signup-btn');

            if (password1 === password2) {
                message.innerHTML = "Passwords match!";
                message.style.color = "green";
                btnSignUp.disabled = false;
                btnSignUp.style.filter = "contrast(100%)";
            } else {
                message.innerHTML = "Passwords do not match!";
                message.style.color = "#E06565";

                btnSignUp.disabled = true;
                btnSignUp.style.filter = "contrast(10%)";

            }
        }
        document.getElementById("password2").addEventListener("input", checkPassword);
    </script>
</html>