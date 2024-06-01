<%-- 
    Document   : profileUser
    Created on : Jan 17, 2024, 1:01:12 PM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*, jakarta.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Info user</title>
        <link rel="icon" href="<c:url value='/resources/img/logoITV.ico' />">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
        <style>
            :root {
                font-size: 16px;
                font-family: "Archivo Narrow", sans-serif;
                --text-primary: #eccfc5;
                --text-secondary: #f9672c;
                --bg-primary: #401d19;
                --bg-secondary: #250804;
                --bg-third: #863b32;
            }
            p{
                color:black;
            }
            main{
                margin-left: 5rem;
                top:3rem;
                width: calc(100vw - 5rem);
                height: calc(100vh - 5rem);
                display: flex;
                justify-content: center;
            }

            .infoCard{
                width: 80%;
                margin-top: 5rem;
                background-color: #250804;
                border-radius: 30px;
                overflow: scroll;
            }

            .wall-bg, .wall-bg img, profileImg{
                width: 100%;

            }
            .wall-bg{
                height: 30%;
                overflow: hidden;
            }
            .wall-bg img{
                object-fit: cover;
                object-position: 0% 50%;
                filter: blur(20px);
                -webkit-filter: blur(20px);
            }
            .profileImg{
                top: 20%;
                margin-left: 30px;
                position: absolute;
            }
            .profileImg img{
                height: 200px;
                width: 200px;
                object-fit: cover;
                object-position: center;
                border-radius: 200px;
            }
            .infoCard-detail{
                background-color: rgba(236,207,197, 0.5) ;
                width:85%;
                margin-left: 10%;
                margin-top: 20px;

                height: auto;
                border-radius: 20px;
            }
            .infoCard-detail .name{
                margin: 0;
                text-align: center;
                padding-top: 20px ;
                font-size: 3rem;
                font-weight: bold;
            }
            .infoCard-detail table{
                width: 100%;
                padding: 30px 30px 0 30px ;
            }
            .infoCard-detail table tr{
                height: 40px;
            }
            .infoCard-detail table tr td{
                font-size: 1.5rem;
            }
            .infoCard-detail table td:first-child{
                font-weight: bold;
            }
            #editProjet{
                display: flex;
                justify-content: end;
                flex-wrap: wrap;

            }
            .btn-logout{
                margin-right: 50px;
                margin-bottom: 20px;
                padding: 10px 40px;
                background-color: transparent	;
                cursor: pointer;
                border: none;
                border-radius: 30px;
                font-family: "Archivo Narrow", sans-serif;
                font-size: 1rem;

            }
            .btn-logout:hover, .btn-submit:hover, .btn-edit:hover{
                background-color: #eccfc5;
                color:#863b32 ;
            }
            .br-line{
                width: 100%;
            }
            .btn-submit, .btn-edit{
                font-size: 2rem ;
                margin-right: 20px ;
                background-color: transparent;
                cursor: pointer;
                border: none;
                border-radius: 10px;
            }
            .btn-edit{
                padding: 0px 5px ;
            }

            .inputText{
                display: block;
                height: 40px;
                width: 50%;
                background-color: rgba(255,255,255,0.07);
                border-radius: 3px;
                padding: 0 10px;
                margin-top: 8px;
                font-size: 14px;
                font-weight: 300;
                border:none;
            }
            label{
                font-size: 16px;
            }
            .buttonGroup, .buttonGroup1{
                display: flex;
                justify-content: end;

            }

        </style>
    </head>
    <body>
        <%@include file="TopBar.jsp" %>
        <main>
            <div class="infoCard">
                <!--img-->
                <div class="wall-bg">
                    <img src="${use.img!=null?use.img:"/Music/resources/img/profileUserImg/blank_profile.webp"}" alt="alt"/>	
                </div>
                <div class="profileImg">
                    <img src="${use.img!=null?use.img:"/Music/resources/img/profileUserImg/blank_profile.webp"}" alt="alt"/>	
                </div>
                <div class="infoCard-detail">
                    <p class="name">${use.fullName}</p>
                    <c:choose>
                        <c:when test="${!editSign}">
                            <form action="infoUser" method="post">	
                                <table>
                                    <tr><td>UserName</td><td>${use.useName}</td></tr>
                                    <tr><td>Email</td><td>${use.email}</td></tr>
                                    <tr><td>Gender</td><td>${use.gender?"male":"female"}</td></tr>
                                    <tr><td>Date of birth</td><td>${use.dob}</td></tr>
                                    <tr><td>Role</td><td>${use.role==2?"Artist":"User"}</td></tr>
                                    <c:if test="${passSign}">
                                        <tr><td>Old Pass</td><td><input class='inputText' type='password' name='oldPass' required/></td></tr>
                                        <tr><td>New Pass</td><td><input id="password"  class='inputText' type='password' name='newPass' required/></td></tr>
                                        <tr><td>re-enter New Pass</td><td><input id="password2"  class='inputText' type='password' required/></td></tr>
                                        <tr>
                                            <td>
                                                <p id="message">${mess}</p>

                                            </td>
                                            <td>

                                                <button id="btnPass" type="submit" name="btnChangePass" title='submit' class="btn-submit" style="padding: 0 5px">
                                                    <i class="uil uil-check"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:if>

                                </table>
                            </form>
                        </c:when>
                        <c:when test="${editSign}">
                            <form id="editProjet" action="infoUser" method="post">


                                <table>
                                    <tr><td>Full Name</td><td><input class='inputText' type='text' name='fullName_f' value='${use.fullName}' required/></td></tr>
                                    <tr><td>Email</td><td><input class='inputText' type='text' name='email_f' value='${use.email}'/></td></tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td><label for='male'>Male</label><input id='male' type='radio' name='gender_f' value='${use.gender}' ${use.gender?'checked':''}/>
                                            <label for='female'>Female</label><input id='female' type='radio'  name='gender_f' value='${!use.gender}' ${!use.gender?'checked':''}/>
                                        </td>
                                    </tr>
                                    <tr><td>Date of birth</td><td><input class='inputText' type='date' name='date_f' value='${use.dob!=null?use.dob:"1999-01-01"}'/></td></tr>
                                    <tr><td>Role</td><td>${use.role==2?'Artist':'User'}</td></tr>
                                </table>
                                <div class="br-line"></div>

                                <div  id="btnCheck" >		
                                    <button id="btnPass" type="submit" name="submitBtn" title='submit' class="btn-submit" style="padding: 0 5px">
                                        <i class="uil uil-check"></i>
                                    </button>
                                </div>
                            </form>
                        </c:when>
                    </c:choose>
                    <div class="buttonGroup">
                        <form class="buttonGroup1"  action="infoUser" method="post">
                            <div  id="btnCheck" >		
                                <button type="submit" name="editBtn" class="btn-submit" style="padding: 0 5px">
                                    <c:if test="${!editSign}">
                                        <i class="uil uil-edit" title="edit"></i>
                                    </c:if>
                                    <c:if test="${editSign}">
                                        <i class="uil uil-times" title="cancle"></i>
                                    </c:if>
                                </button>
                                <button class="btn-logout" type="submit" name="changePass" >${mess!=null?mess:"change password"}</button>

                            </div>
                        </form>


                        <!--logout button--> 
                        <form action="logout" method="post" >
                            <button class="btn-logout"  type="submit" >
                                LogOut
                                <i class="uil uil-signout"></i>
                            </button>
                        </form>
                    </div>
                </div>

            </div>
        </main>
        <script src="<c:url value="/resources/js/editProfile.js"/>"></script>				
    </body>

    <script>
        let match = false;
        function checkPassword() {
            var password1 = document.getElementById("password").value;
            var password2 = document.getElementById("password2").value;
            var message = document.getElementById("message");
            var btnSignUp = document.getElementById('btnPass');

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
    <script>
        if (window.history.replaceState) {

            window.history.replaceState(null, null, window.location.href);
        }
    </script>
</html>
