<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/29/2023
  Time: 9:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Back to List</a>
<h1>Delete Product</h1>
<form action="/product?action=delete" method="post">
  <label for="id">Id Product</label>
  <input type="text" id="id" name="id"><br>
  <button type="submit">Delete</button>
</form>
</body>
</html>
