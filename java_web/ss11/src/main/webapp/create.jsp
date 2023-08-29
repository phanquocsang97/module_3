<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/29/2023
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Back to List</a>
<h1>Add new Product</h1>
<form action="/product?action=create" method="post">
    <label for="name">Name</label>
    <input type="text" id="name" name="name"><br>
    <label for="price">Price</label>
    <input type="number" id="price" name="price"><br>
    <label for="description">Description</label>
    <input type="text" id="description" name="description"><br>
    <label for="brand">Brand</label>
    <input type="text" id="brand" name="brand">
    <button type="submit">Add new</button>
</form>
</body>
</html>
