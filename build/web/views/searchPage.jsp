<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="common.DateUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>search page</title>
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
            .result{
                background-color: var(--bg-third);
                width: 90vw;
                margin: 0 auto;
                border-radius: 10px;
            }
            .result h2{
                color:white;
                text-align: center;
                font-size: 2rem;
                padding: 20px 0;
            }
            .album-field, .artist-field{
                display: flex;
                justify-content: center;
                gap:20px;
                flex-wrap: wrap;
            }
            .tag{
                text-decoration: none;
                margin: 20px 0;
            }
            .album-card{
                padding-bottom: 10px;
                border-radius: 5px;
            }
            .album-card h3, .album-card p{
                color: white;
                margin: 10px 10px;

            }

            .album-card img{
                width: 300px;
                border-radius: 5px;
            }
            .album-card:hover{
                background: var(--bg-primary);
            }
            .img-art{
                border-radius: 300px !important;
                width: 300px !important;
                height: 300px !important;
                object-fit: cover;
            }
            .title-art{
                text-align:  center;
            }
            .search-container{
                display: flex;
                justify-content: center;
            }
            .sel{
                height: 40px;
            }
            .key{
                height: 34px;
            }
            .btn{
                height: 40px;

            }




        </style>
    </head>
    <body>
        <!--topbar-->
        <%@include file="TopBar.jsp" %>
        <main>
            <!--search fiel-->			
            <did class="search-container">
                <form action="search" method="post">
                    <select class="sel" name="sort2">
                        <option value="0" ${type2!=null&&type2==0?"selected":""}>All Genre</option>
                        <c:forEach items="${dao.gen}" var="i">
                            <option value="${i.id}" ${type2!=null&&type2==i.id?"selected":""}>${i.title}</option>	
                        </c:forEach>
                    </select>
                    <input class="key" type="text" name="key_r" value="${key!=null?key:""}" required/>
                    <input class="btn" type="submit" value="Search"/>
                </form>
            </did>

            <div class="search-result">
                <c:if test="${listS==null}">
                    <c:set var="listS" scope="request" value="${dao.songList}"/>
                </c:if>
                <div class="result">
                    <h2>Album</h2>	
                    <div class="album-field">
                        <c:forEach  items="${dao.alb}" var="alb" begin="0" end="${dao.alb.size()}">
                            <a class="tag" href="/Music/Albums?type=2&albumId=${alb.id}">
                                <div class="album-card">
                                    <img src="${alb.img}" alt="alt"/><br>
                                    <h3 class="title-album">${alb.title}</h3>
                                    <p class="title-album">${alb.ptype}</p>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <div class="result">
                    <h2>Artist</h2>	
                    <div class="artist-field">
                        <c:forEach  items="${dao.art}" var="art" begin="0" end="${dao.art.size()}">
                            <a class="tag" href="/Music/Artist?type=2&artId=${art.id}">
                                <div class="album-card">
                                    <img class="img-art" src="${dao.getImgSrcByArtId(art.id)}" alt="alt"/><br>
                                    <h3 class="title-art">${art.name}</h3>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <!--table of song-->
                <div class="result">
                    <h2>Song</h2>
                    <%@include file="tableSongs.jsp" %>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                </div>
            </div>
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
