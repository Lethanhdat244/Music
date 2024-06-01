<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Account</title>
        <link rel="icon" href="<c:url value='/resources/img/logoITV.ico' />">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Archivo+Narrow:400,700"/>
        <style>
            body{
                background-color: #843f20 !important;
                font-family: "Archivo Narrow", sans-serif;
            }

            main{
                margin-left: 5rem;
                margin-top: 7rem;
                width: calc(100vw - 5rem);
                /*height: calc(100vh - 5rem);*/
                display: flex;
                justify-content: center;
                padding-bottom: 300px;
            }
            .tableEdit{
                width: 30vw;
            }
            tr{
                height: 30px;
            }
        </style>

    </head>
    <body>
        <%@include file="TopBar.jsp" %>
        <main>
            <div class="">
                <form action="UpdateAcc" method="POST">
                    <table class="tableEdit">
                        <tr><td>Id:</td><td>${a1.id}</td></tr>
                        <tr><td>userName:</td><td><input type="text" name="name" value="${a1.useName}"></td></tr>
                        <tr><td>Full Name:</td><td><input type="text" name="fullName" value="${a1.fullName}"></td></tr>
                        <tr><td>email:</td><td><input type="text" name="email" value="${a1.email}"></tr>
                        <tr>
                            <td>role:</td>
                            <td>
                                <select name="role">
                                    <c:forEach items="${roles}" var="r" varStatus="check">
                                        <option value="${check.index+1}">${r}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr><td><input type="submit" value="Send" onclick="return confirmSend()"></td></tr>

                    </table>
                </form>
            </div>	

        </main>

    </body>

    <script>
        function confirmSend() {
            return confirm("Bạn có muốn thay đổi thông tin người dùng không?");
        }
    </script>
</html>
