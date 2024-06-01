
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="common.DateUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Love page</title>
        <link rel="icon" href="<c:url value='/resources/img/logoITV.ico' />">
        <link href="<c:url value='/resources/css/songs.css' />" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Archivo+Narrow:400,700"/>

        <style>
            body{
                font-family: "Archivo Narrow", sans-serif;
            }
            main{
                margin-left: 5rem;
                top:10rem;
                width: calc(100vw - 5rem);
                height: calc(100vh - 5rem);
                display: flex;
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <!--topbar-->
        <%@include file="TopBar.jsp" %>
        <main>
            <!--table of song-->
            <%@include file="tableSongs.jsp" %>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        </main>
        <!--musicbar-->
        <%@include file="musicBar.jsp" %>
    </body>

    <!--get src-->
    <script>
        var songList = [];
        <c:forEach items="${listS}" var="s">
        songList.push('${s.src}');
        </c:forEach>
    </script>

    <script>
        //lưu lại vị trí của scroll window
        document.addEventListener("DOMContentLoaded", function (event) {
            var scrollpos = localStorage.getItem('scrollpos');
            if (scrollpos)
                window.scrollTo(0, scrollpos);
        });

        window.onbeforeunload = function (e) {
            localStorage.setItem('scrollpos', window.scrollY);
        };
    </script>
</html>
