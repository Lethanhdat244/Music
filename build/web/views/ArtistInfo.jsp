<%-- 
    Document   : ArtistLib
    Created on : Feb 25, 2023, 10:55:22 AM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Artist</title>
        <link rel="icon" href="<c:url value='/resources/img/logoITV.ico' />">
        <link href="<c:url value='/resources/css/artists.css' />" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Archivo+Narrow:400,700"/>

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
            body{
                font-family: "Archivo Narrow", sans-serif;
            }

            main{
                margin-left: 5rem;
                margin-top: 7rem;

                width: calc(100vw - 5rem);
                /*height: calc(100vh - 5rem);*/
                /*padding-bottom: 300px;*/
            }
            .artistInfo{
                display:flex;
                width: 85vw;
                margin: 0 auto;
                background-color: var(--text-primary);
                gap:20px;
                padding: 10px;
                border-radius: 100px;
            }
            .artistInfo img{
                width: 300px;
                height: 300px;
                object-fit: cover;
                border-radius: 100px;
            }
            .detail-art h1{
                color: black;
                font-size: 30px;
            }
            .detail-art p{
                color: black;
                font-size: 1rem;
            }
            .artist-albums{
                display:flex;
                justify-content: center;
                flex-wrap: wrap;
                width: 85vw;
                margin: 20px auto;
                background-color: var(--text-primary);
                gap:20px;
                padding: 10px;
                border-radius: 10px;
            }
            .album-card{
                padding-bottom: 10px;
                border-radius: 5px;
            }
            .album-card h3, .album-card p{
                color: black;
                margin: 10px 10px;

            }
            .album-card img{
                width: 300px;
                border-radius: 5px;
            }
            .album-card:hover{
                background: var(--bg-primary);
            }

        </style>
    </head>
    <body>
        <%@include file="TopBar.jsp" %>
        <main>
            <div class="artistInfo">
                <img class="img-art" src="${dao.getImgSrcByArtId(art.id)}" alt="alt"/><br>
                <div class='detail-art'>
                    <h1>${art.name}</h1>
                    <p>${art.bio}</p>
                </div>

            </div>
            <div class="artist-albums">
                <c:forEach  items="${listA}" var="alb" begin="0" end="${listA.size()}">
                    <a class="tag" href="/Music/Albums?type=2&albumId=${alb.id}">
                        <div class="album-card">
                            <img src="${alb.img}" alt="alt"/><br>
                            <h3 class="title-album">${alb.title}</h3>
                            <p class="title-album">${alb.ptype}</p>
                        </div>
                    </a>
                </c:forEach>
            </div>

        </main>


    </div>	
</body>
</html>
