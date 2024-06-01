<%-- 
    Document   : home
    Created on : Jan 13, 2024, 1:04:50 PM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Archivo+Narrow:400,700"/>
        <link rel="icon" href="<c:url value='/resources/img/logoITV.ico' />">
        <link href="<c:url value='/resources/css/bar.css' />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value='/resources/css/home.css' />" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <%@include file="TopBar.jsp" %>
        <main>
            <div class="lasted-ablum">
                    <!--<img src="<c:url value='/resources/img/albums/the_new_abnormal.jpeg' />" alt="alt"/>-->
                <img src="${alb.img}" alt="alt"/><br>
                <div class="lasted-ablum-text">
                    <p>Latest Album</p>
                    <h1>${alb.title}</h1>

                    <button><a class="tag" href="/Music/Albums?type=2&albumId=${alb.id}">Discover >></a>
                    </button>
                </div>
            </div>
            <div class="lasted-ablum-detail">	
                <div class="lasted-ablum-detail-text">	
                    <p style="text-align: center; font-size: 2rem">Latest Album</p>
                    <h1 style="text-align: center; font-size:4rem">${alb.title}</h1>
                    <p class="info">${alb.desc}</p>

                </div>
            </div>
        </main>
        <%@include file="musicBar.jsp" %>
    </body>
</html>
