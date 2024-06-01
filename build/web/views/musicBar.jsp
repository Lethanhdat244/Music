<%-- 
    Document   : sidebar
    Created on : Feb 29, 2024, 11:44:43 PM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Music Controll Bar</title>
        <link rel="icon" href="<c:url value='/resources/img/logoITV.ico' />">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
        <link  rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto"/>
        <script
            src="https://kit.fontawesome.com/6751618717.js"
            crossorigin="anonymous"
        ></script>
        <link href="<c:url value='/resources/css/musicBar.css' />" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="music-control-bar">
            <!--track name-->
            <div class="first-part">
                <div class="player-track-meta">
                    <p id="titleSong"></p>
                    <p><span id="artist"></span></p>
                </div>
            </div>
            <div class="mid-part">
                <div class="mid-part-sub1">
                    <!--button control-->
                    <i class="uil uil-previous media-btn " onclick="previousBtn()" title="previous" ></i>
                    <button id="play-pause-button" onclick="togglePlayPause()"><i class="uil uil-play media-btn" ></i></button>
                    <i class="uil uil-step-forward media-btn " id="change-src-button" onclick="forwardBtn()" title="next"></i>
                </div>
                <!--progress-bar-->
                <div class="mid-part-sub2">
                    <span class="player-time player-time-current">00:00</span>
                    <div id="progress-bar-container" onclick="updateProgressOnClick(event)">
                        <div id="progress-bar">
                            <div  id="progress"></div>
                        </div>
                    </div>
                    <span class="player-time player-time-duration">00:00</span>
                </div>
            </div>
            <!--volume controll-->
            <div class="last-part">
                <i class="uil uil-repeat" id="repeat-button" onclick="repeatFn()" ></i>
                <div class="player-volume-container">
                    <i class="uil uil-volume media-btn " ></i>
                    <input type="range" class="player-volume" id="volume-control" min="0" max="1" step="0.01" value="1" onchange="changeVolume()">
                </div>
            </div>
        </div>

        <audio id="audio" src=""/>"></audio>
    <script src="<c:url value="/resources/js/musicBar.js"/>"></script>
</body>
</html>
