<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/30/2023
  Time: 2:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <title>User Management Application</title>
</head>
<body>
<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<center>
  <h1>User Management</h1>
  <h2 align="left">
    <a href="/user?action=create"><button type="button" class="btn btn-primary">Add New User</button></a>
  </h2>
  <h2 align="left">
    <a href="/user?action=search"><button type="button" class="btn btn-primary">Search User</button></a>
  </h2>
</center>
<div align="center">
  <table class="table table-striped">
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Country</th>
      <th>Actions</th>
    </tr>
    <c:forEach var="user" items="${list}">
      <tr>
        <td><c:out value="${user.id}"/></td>
        <td><c:out value="${user.name}"/></td>
        <td><c:out value="${user.email}"/></td>
        <td><c:out value="${user.country}"/></td>
        <td>
          <a href="/user?action=edit&id=${user.id}">Edit</a>
          <a href="/user?action=delete&id=${user.id}">Delete</a>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<%--<script src="https://cdn.datatables.net/1.11.4/js/dataTables.bootstrap4.min.js"></script>--%>
</html>
