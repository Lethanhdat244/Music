<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Account</title>
        <link rel="icon" href="<c:url value='/resources/img/logoITV.ico' />">
        <link href="<c:url value='/resources/css/managerAcc.css' />" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Archivo+Narrow:400,700"/>

        <style>
        /* CSS customization */
        :root {
            --text-color: rgba(34, 42, 66, .7);
            --success-text: #0d6832;
            --primary-text: #273e63;
            --warning-text: #73510d;
            --danger-text: #A61001;
            --success-bg: #d6f0e0;
            --primary-bg: #dfe7f6;
            --warning-bg: #fbf0da;
            --danger-bg: #FFEBE9;
            --primary-btn-text: #3b71ca;
            --main-color: #8B0000; /* Màu chủ đạo là nâu đỏ */
        }

        /* Các CSS style khác ở đây */

    </style>
    </head>
    <body>
        <%@ include file="TopBar.jsp" %>
    <main>
        <div class="container">
            <div class="table-container">
                <div class="mb-2">
                    <h2 class="">Account manager</h2>
                    <small class="text-secondary">View all form tasks assigned to your group.</small>
                </div>
                <table id="mytable" class="table align-middle mb-0 bg-white">
                    <thead class="bg-light">
                        <tr class="header-row">
                            <th>ID #</th>
                            <th>Username</th>
                            <th>Fullname</th>
                            <th>Email</th>
                            <th>DOB</th>
                            <th>Role</th>
                            <th>Actions</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listA}" var="a">
                                <tr>
                                    <td>${a.id}</td>
                                    <td>${a.useName}</td>
                                    <td>${a.fullName}</td>
                                    <td>${a.email}</td>
                                    <td>${a.dob}</td>
                                    <td>${roles[a.role]}</td>
                                    <td> <a href="/Music/Admin/EditAcc?type=1&uId=${a.id}">Update</a></td>
                                    <td><a href="/Music/Admin/DeleteAcc?uId=${a.id}" onclick="return confirmDelete()">Delete</a></td>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</body>

<script>
    function confirmDelete() {
        return confirm("Bạn có chắc chắn muốn xóa tài khoản này không?");
    }
</script>
</html>
