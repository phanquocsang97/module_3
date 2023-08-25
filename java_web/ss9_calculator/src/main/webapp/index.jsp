<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <meta charset="UTF-8">
</head>
<body>
<form action="/product-discount-calculator" method="post">
    <label name="description">Description Product</label>
    <input type="text" name="description" id="description" value="${description}">
    <label name="price">Price Product</label>
    <input type="number" name="price" id="price" value="${price}">
    <label name="discount">Discount Product</label>
    <input type="number" name="discount" id="discount" value="${discount}">
    <button type="submit">Result</button>
</form>

</body>
</html>