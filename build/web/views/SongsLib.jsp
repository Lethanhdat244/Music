<%-- 
    Document   : SongsLib
    Created on : Jan 24, 2024, 2:50:57 PM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="common.DateUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${albumId_a!=null?album_a.title:"Songs "}</title>
        <link rel="icon" href="<c:url value='/resources/img/logoITV.ico' />">
        <link href="<c:url value='/resources/css/songs.css' />" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Archivo+Narrow:400,700"/>

        <style>
            body{
                font-family: "Archivo Narrow", sans-serif;
            }
        </style>
    </head>
    <body>
        <%@include file="TopBar.jsp" %>
        <main>
            <div class="top-part">
                <div class='top-part-sub1'>
                    <img src="${albumId_a!=null?album_a.img:"/Music/resources/img/bgImg/bg-2.jpg"}" alt="album"/>
                    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
                </div>
                <div class="top-part-sub2">
                    <h1>${albumId_a!=null?album_a.title:"Song library"}</h1>
                    <c:if test="${albumId_a!=null}">

                    </c:if>
                </div>
            </div>
            <div class="main-part">
                <div class="filter-part">
                    <form action="Songs"  method="post">
                        <nav>sort by: </nav>
                        <select onchange="this.form.submit()" name="sort1" >
                            <c:forEach  items="${filters}" var="i" varStatus="check">
                                <option value="${check.index}" ${type1!=null&&type1==check.index?"selected":""}>${i}</option>	
                            </c:forEach>
                        </select>	
                        <nav>gender: </nav>
                        <select onchange="this.form.submit()" name="sort2">
                            <option value="0" ${type2!=null&&type2==0?"selected":""}>All Genre</option>
                            <c:forEach items="${dao.gen}" var="i">
                                <option value="${i.id}" ${type2!=null&&type2==i.id?"selected":""}>${i.title}</option>	
                            </c:forEach>
                        </select>
                    </form>
                </div>
                <%@include file="tableSongs.jsp" %>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </div>

        </main>
        <%@include file="musicBar.jsp" %>

    </body>
    <script src="<c:url value="/resources/js/songctrl.js"/>"></script>
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
