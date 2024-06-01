<%-- 
    Document   : forbiden
    Created on : Jan 30, 2023, 4:10:32 PM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>access denied</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Archivo+Narrow:400,700"/>
        <link rel="icon" href="<c:url value='/resources/img/logoITV.ico' />">
        <link href="<c:url value='/resources/css/forbiden.css' />" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="app">
            <div>403</div>
            <div class="txt">
                Forbidden<br>
                access denied<span class="blink">_</span><br>
                <a href="<c:url value='/Home'/>">home</a>
            </div>
        </div>
    </body>
</html>
