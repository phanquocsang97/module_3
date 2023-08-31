<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/31/2023
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="text-align: center;">
  <h1>User Management</h1>
</div>
<div align="center">
  <form method="post" action="/users?action=add-transaction">
    <table class="table table-striped">
      <tr>
        <td colspan="2"><h2>Add user</h2></td>
      </tr>
      <tr>
        <td>User name</td>
        <td><input type="text" name="name" placeholder="Enter new user's name"/></td>
      </tr>
      <tr>
        <td>User email</td>
        <td><input type="text" name="email" placeholder="Enter new user's email"/></td>
      </tr>
      <tr>
        <td>User country</td>
        <td><input type="text" name="country" placeholder="Enter new user's country"/></td>
      </tr>
      <tr>
        <td colspan="2" align="center"><button type="submit">Submit</button></td>
      </tr>
    </table>
  </form>
</div>
<div>
  <button type="button" class="btn btn-outline-primary"><a href="/users?action=show-list">Back to list</a></button>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
</body>
</html>
