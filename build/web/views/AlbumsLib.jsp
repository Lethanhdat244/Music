<%-- 
    Document   : Album
    Created on : Feb 19, 2024, 11:45:23 PM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Albums</title>
        <link rel="icon" href="<c:url value='/resources/img/logoITV.ico' />">
        <link href="<c:url value='/resources/css/albums.css' />" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Archivo+Narrow:400,700"/>

        <style>
            body{
                background-image: url("<c:url value='/resources/img/bgImg/bg1.png'/>");
                font-family: "Archivo Narrow", sans-serif;
            }
        </style>
    </head>
    <body>
        <%@include file="TopBar.jsp" %>
        <main>
            <div class="top-part">
                <div class='top-part-sub1'>
                    <img src="<c:url value='/resources/img/bgImg/blog2.jpg' />" alt="album"/>
                </div>
                <div class="top-part-sub2">
                    <p>See what's new</p>
                    <h1>Latest Album</h1>
                </div>
            </div>
            <div class="albums-part">
                <!--album filter-->
                <div class="album-filter">
                    <div class="form-paging">
                        <form action="Albums" method="post">

                            <input type="text" name="index" value="${page.index}" hidden/>
                            <input type="text" name="totalPage" value="${page.totalPage}" hidden/>

                            <c:if test="${page.index != 0}">
                                <input type="submit" name="btnHome" value="Home">
                                <input type="submit" name="btnPre" value="Pre">
                            </c:if> 
                            <c:forEach var="i" begin ='${page.pageStart}' end="${page.pageEnd}">
                                <input class="page" type="submit" name="btn${i}" value="${i+1}" style="${index==(i)?"background: black; color:white;":""}">
                            </c:forEach>

                            <c:if test="${page.index != page.totalPage-1 }">
                                <input type="submit" name="btnNext" value="Next">
                                <input type="submit" name="btnEnd" value="End">
                            </c:if>

                        </form>
                    </div>

                    <div class="album-loader1" >
                        <c:forEach  items="${dao.alb}" var="alb" begin='${page.begin}' end="${page.end-1}">
                            <a class="tag" href="/Music/Albums?type=2&albumId=${alb.id}">
                                <div class="album-card">
                                    <img src="${alb.img}" alt="alt"/><br>
                                    <h3 class="title-album">${alb.title}</h3>
                                    <p class="title-album">${alb.artist.name}</p>
                                    <p class="title-album">${alb.ptype}</p>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <!--album-loader-->
                <div class="album-loader">
                    <div class="lable2">
                        <p>See more</p>
                        <h1>Album library</h1>
                    </div>
                    <c:forEach  items="${dao.alb}" var="alb" begin="0" end="${amount}">
                        <a class="tag" href="/Music/Albums?type=2&albumId=${alb.id}">
                            <div class="album-card">
                                <img src="${alb.img}" alt="alt"/><br>
                                <h3 class="title-album">${alb.title}</h3>
                                <p class="title-album">${alb.ptype}</p>
                            </div>
                        </a>
                    </c:forEach>
                    <div class="break"></div>
                    <a class="album-loader2" href="/Music/Albums?type=3&loadAmount=${amount}" style="display:${amount >= dao.alb.size()?"none":""}" >
                        <p>Load More </p>
                    </a>
                </div>
                <div class="album-filter"></div>
            </div>



        </main>
        <%@include file="musicBar.jsp" %>
    </body>
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
