<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel='stylesheet' href='webjars/bootstrap/4.1.1/css/bootstrap.min.css'>
    <link href="resources/css/loginPage.css" rel="stylesheet">
</head>
<body>
<div>
    <c:if test="${not empty status}">
        <c:out value="${status}"/>
        <br>
    </c:if>
</div>
<form method="post" class="form-signin border">
    <div class="form-label-group">
        <H1>Please sign in</H1>
    </div>
    <div class="form-label-group">
        <input name="username" type="text" class="form-control" placeholder="Enter login">
    </div>
    <div class="form-label-group">
        <input name="password" type="password" class="form-control" placeholder="Enter password">
    </div>
    <button type="submit" name="login" class="btn-primary btn btn-block btn-lg">Log-in</button>
</form>
</body>
</html>
