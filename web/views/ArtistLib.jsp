<%-- 
    Document   : ArtistLib
    Created on : Jan 25, 2024, 10:55:22 AM
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
            body{
                font-family: "Archivo Narrow", sans-serif;
            }
            .result{
                width: 85vw;
                margin: 0 auto;
            }
            .artist-field{
                display: flex;
                justify-content: center;
                gap:20px;
                flex-wrap: wrap;
            }
            .img-art{
                border-radius: 300px !important;
                width: 250px !important;
                height: 250px !important;
                object-fit: cover;
                padding: 20px;
            }
            .title-art{
                text-align:  center;
                padding: 20px;
                color: white;
            }
            .album-card{
                border-radius: 10px;
                background: var(--bg-secondary);
            }
            .album-card:hover, .tab:hover{
                background: var(--bg-third);
            }
            .tab{
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <%@include file="TopBar.jsp" %>
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
    </div>	
</body>
</html>
