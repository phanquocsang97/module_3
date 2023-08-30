<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/30/2023
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>
<a href="/user"><button class="btn btn-primary" type="submit">Back to List</button></a>
<form method="post">
    <input type="text" name="name" value="${nameSearch}">
    <button class="btn btn-primary" type="submit">Search</button>
</form>
<table class="table table-striped">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    <c:forEach var="list" items="${list}">
        <tr>
            <td><c:out value="${list.id}"/></td>
            <td><c:out value="${list.name}"/></td>
            <td><c:out value="${list.email}"/></td>
            <td><c:out value="${list.country}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
