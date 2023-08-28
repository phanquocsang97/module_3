<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/28/2023
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <style>
        table{
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<table border="1px">
    <thead>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="list" items="${list}">
        <tr>
            <td>${list.name}</td>
            <td>${list.date}</td>
            <td>${list.address}</td>
            <td><img src="${list.photo}"></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
