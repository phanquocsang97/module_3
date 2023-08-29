<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/29/2023
  Time: 11:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>List Product</title>
    <style>
        table{
            border-collapse: collapse;
        }

    </style>
</head>
<body>
<a role="button" class="btn btn-secondary" href="/product?action=showformcreate">Add new product</a>
<a role="button" class="btn btn-secondary" href="/product?action=showformdelete">Delete product</a>

<br>
<br>
<table class="table table-dark table-hover">
    <thead>
    <tr>
        <th>Name</th>
        <th>Price</th>
        <th>Detail</th>
        <th>Brand</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="list" items="${list}">
        <tr>
            <td>${list.getName()}</td>
            <td>${list.getPrice()}</td>
            <td>${list.getDescription()}</td>
            <td>${list.getBrand()}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
