<%-- 
    Document   : TopBar
    Created on : Jan 30, 2024, 5:02:08 PM
    Author     : thanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sidebar</title>
        <link rel="icon" href="<c:url value='/resources/img/logoITV.ico' />">
        <link href="<c:url value='/resources/css/bar.css' />" rel="stylesheet" type="text/css"/>
        <link
            rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto"/>
        <script
            src="https://kit.fontawesome.com/6751618717.js"
            crossorigin="anonymous"
        ></script>
    </head>

    <body>
        <!-- topbar -->
        <nav class="topBar">
            <div class="topBar-left">
                <a class="nav2-logo" href="<c:url value='/Home'/>">Vimusic </a>
                <a class="nav2-tag" href="<c:url value='/Songs'/>">Songs </a>
                <a class="nav2-tag" href="<c:url value='/Albums'/>">Albums</a>
                <a class="nav2-tag" href="<c:url value='/Artist'/>">Artist</a>
            </div>
            <div class="topBar-right">
                <button type="button"><a class="nav2-tag" href="<c:url value='${sessionScope.user_ses.role==0?"/Admin/managerAccount":"/Artist/UploadFile"}'/>">${sessionScope.user_ses.role==0?"admin":"+music"}</a></button>
            </div>
        </nav>

        <nav class="navbar">
            <ul>
                <li onclick="location.href = '<c:url value='/Home' />'">
                    <i class="fa-solid fa-house nav-icon"></i>
                    <nav class="nav-text">home</nav>
                </li>
                <li  onclick="location.href = '<c:url value='/search' />'">
                    <i class="fa-solid fa-magnifying-glass nav-icon"></i>
                    <nav class="nav-text">search</nav>
                </li>
                <li onclick="location.href = '<c:url value="/love1?access=true"/>'">
                    <i class="fa-solid fa-heart nav-icon"></i>
                    <nav class="nav-text">love</nav>
                </li>
                <li onclick="location.href = '<c:url value="/infoUser"/>'">
                    <c:if test="${sessionScope.user_ses.img !=null}">
                        <img class="nav-icon img-icon  " src="${sessionScope.user_ses.img}"/>
                    </c:if>	
                    <c:if test="${sessionScope.user_ses.img ==null}">
                        <i class="fa-solid fa-user nav-icon"></i>
                    </c:if>	



                    <nav class="nav-text">user</nav>
                </li>
            </ul>
        </nav>

    </body>

</html>
