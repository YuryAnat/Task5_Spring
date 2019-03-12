<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %><html>
<head>
    <title>Home page</title>
</head>
<body>
<security:authorize access="!isAuthenticated()">
    <button onclick="location.href='/login'">Login</button>
</security:authorize>
<security:authorize url="/user">
    <button onclick="location.href='/user'">User info page</button>
</security:authorize>
<security:authorize url="/admin">
    <button onclick="location.href='/admin'">Admin page</button>
</security:authorize>
<security:authorize access="isAuthenticated()">
    <button onclick="location.href='/logout'">Logout</button>
</security:authorize>
</body>
</html>
