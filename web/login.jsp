<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <c:if test="${not empty status}">
        <c:out value="${status}"/>
        <br>
    </c:if>
</div>
<div>
    <form method="post">
        <input name="username" type="text"><br>
        <input name="password" type="password"><br>
        <button type="submit" name="login">Log-in</button>
    </form>
</div>
</body>
</html>
